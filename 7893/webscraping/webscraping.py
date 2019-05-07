import requests
import re
import sys
import time
from timeit import default_timer as timer

import MySQLdb

from bs4 import BeautifulSoup
from pprint import pprint
from datetime import datetime, timedelta


class main:
    def __init__(self):
        while(1):
            start = timer()
            print "============================================================"
            self.loop()
            end = timer()
            #print(end - start)
            self.wait(5)

    def wait(self, n):
        '''Wait until the next increment of n seconds'''
        x = time.time()
        time.sleep(n - (x % n))

    def loop(self):

        self.db = MySQLdb.connect(host="192.168.1.100", user="thompson", passwd="root", db="indianrail")
        #self.db = MySQLdb.connect(host="localhost", user="root", passwd="", db="indianrail")
        self.cur = self.db.cursor()
        self.cur.execute("use indianrail")
        self.cur.fetchall()

        firstQuery = "SELECT train_no, load_time,pkm_id, src_station_code FROM `package_train_mapping`, package_details" \
            " where package_train_mapping.pkg_id = package_details.pkg_id and load_unload_status = 'L' "
        self.cur.execute(firstQuery)
        allPackagesDetails = self.cur.fetchall()


        for packageDetails in allPackagesDetails:
            done = False
            trials = 0

            while not done:
                try:
                    trials += 1
                    if trials >= 11:
                        print "Too many Timeouts, ignoring this until the next time."
                    data = self.getDetails(packageDetails)
                    done = True
                except requests.exceptions.Timeout:
                    print "Response timed out. Trying again."
                except requests.exceptions.ConnectionError:
                    print "Connection Error, Retrying"
                except requests.exceptions.RequestException:
                    print "SOME OTHER ERROR, I am not taking chances"

            if (len(data) == 6):
                d1, d2, d3, d4, d5, d6 = data

                stationCode = d1
                timeAt = d2
                pkm_id = d3
                scharr = d4
                delay_time = d5
                station_name = d6

                scharr_object = datetime.strptime(str(datetime.now().year) + " " + scharr, '%Y %d-%b %H:%M')
                datetime_object = datetime.strptime(str(datetime.now().year) + " " + timeAt, '%Y %d-%b %H:%M')
                #print datetime_object
                #print scharr_object

                insertQuery = "Insert into `package_location`(location, time, pkm_id, Scheduled_arr, delay, station_name)" \
                                  "values(%s,%s,%s,%s,%s,%s)"

                args = (stationCode, datetime_object, pkm_id, scharr_object, delay_time, station_name)
                self.cur.execute(insertQuery, args)
                self.db.commit()


    def getDetails(self, packageDetails):
        trainNo, journeyDateTime,pkm_id, journeyStartStation = packageDetails

        r = requests.post("http://enquiry.indianrail.gov.in/mntes/q?opt=TrainRunning&subOpt=FindStationList",
                          params={'trainNo': trainNo, }, timeout=1)
        data = r.text
        soup = BeautifulSoup(data, 'html.parser')

        outputFile = open("Stations.html", "w")
        outputFile.write(r.text)

        k = soup.find_all('select')
        allStations = [i for i in list(k[0].children)[2:] if len(str(i).strip()) > 0]

        # get the days a train runs

        allStationsOrder = [i['value'].split("#")[0] for i in allStations]
        allStationsEnum = dict([(i['value'].split("#")[0], (i.text, i['title'])) for i in allStations])

        # # for now, get the station data from the list
        # ####################################################################################################
        # journeyStartStation = allStationsOrder[0]


        journeyDate = journeyDateTime.strftime("%d-%b-%Y")
        journeyDay = journeyDateTime.strftime("%a")

        trainRunning = journeyDay in allStationsEnum[journeyStartStation][1]
        print "Whether train no. " + str(trainNo) + " is running today? ", trainRunning

        calcDate = journeyDate
        calcDay = journeyDay


        # params={'trainNo': 12216, 'jStation': 'BDTS#true', 'jDate' :jDate,  'jDateDay':jDateDay, ' jDateMap' : jDateMap}
        params = {'trainNo': trainNo, 'jStation': journeyStartStation + '#false', 'jDate': calcDate,
                  'jDateDay': calcDay}
        r = requests.post("http://enquiry.indianrail.gov.in/mntes/q?opt=TrainRunning&subOpt=ShowRunC",
                          params=params, timeout=1)

        # Check for Error
        outputHTML = BeautifulSoup(r.text, 'html.parser')
        error = outputHTML.find_all("span", class_="redError11L")

        outputFile = open("response.html", "w")
        outputFile.write(r.text)

        if len(error) > 0:
            print error[1].text
        else:
            # no error, process the data
            parentNode = outputHTML.select('#ResTab > tbody')
            childrenNodes = parentNode[0].children
            childrenNodes = list(childrenNodes)[1::2]  # remove the alternating blanks

            trainInfo = {}
            for t in childrenNodes:
                try:
                    if len(t.select('td')) < 2:
                        continue
                    key = ''.join(t.select('td')[0].text.split())
                    value = ' '.join(t.select('td')[1].text.split())
                    trainInfo[key] = value
                except Exception as e:
                    pass

            # Now, because of some person somewhere who wasted my half hour....
            dataAfterHtmlClosingTag = outputHTML.encode_contents(formatter='html').split(u'</html>')[1].replace(
                u'&nbsp;', u' ')

            if len(dataAfterHtmlClosingTag) > 0:
                lastLocationAddendum = ' '.join(
                    (dataAfterHtmlClosingTag[0:dataAfterHtmlClosingTag.find(u'<tr>')]).split())
                trainInfo['LastLocation'] += lastLocationAddendum

            lastLocation = trainInfo["LastLocation"]

            colonPoint = lastLocation.split(":")
            #scharr = trainInfo[Scheduled_]
            #print trainInfo
            #print colonPoint[0]
            #print colonPoint[1]

            # If no Time is present then??
            if len(colonPoint) == 1:
                # no time present
                print "No time Specifed"
            else:
                TIME = ":" + colonPoint[1][0:2]
                prevText_splited = colonPoint[0].split()
                TIME = prevText_splited[-2] + " " + prevText_splited[-1] + TIME
                print "TIME: " + TIME

                LOCATION = ''
                stationName, stationCode = re.findall('([A-Z][A-Z\s]+)\(([A-Z]+)\)', colonPoint[0])[0]
                LOCATION = stationCode

                station_name = stationName
                print "station_name: ", station_name

                print "LOCATION: ", LOCATION

                scharr = trainInfo['ScheduledDeparture']
                print "Scheduled_arr:",scharr

                #if (temp1 = outputHTML.find_all("span", class_="errorTextL11")[0]):
                    #delay = temp1.text
                if not(outputHTML.find_all("span", class_="errorTextL11")) :
                    delay_time = "No delay"
                else:
                    delay = outputHTML.find_all("span", class_="errorTextL11")[0]
                    delay_time = delay.text

                print delay_time
                print "---------------------------------------"

                return (LOCATION, TIME, pkm_id, scharr, delay_time, station_name)
        return (None, None)


print "THE OBJECT ORIENTED WAY"
main()
