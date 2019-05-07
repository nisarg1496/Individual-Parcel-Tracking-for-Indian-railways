<%@page import="java.util.logging.Logger"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.util.Vector" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Indian Railways Package Tracking</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Courier Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- css files -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/colorfulTab.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- /css files -->
        <!-- font files -->
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700italic,700,800,800italic' rel='stylesheet' type='text/css'>
        <link href="//fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <!-- /font files -->
        <!-- js files -->

        <!-- /js files -->
    </head>
    <body>

        <%
           try {
                int count = 0;
                Timestamp time = new Timestamp(12, 12, 12, 12, 12, 12, 12);
                String location = "Mumbai";
                String pkgid = request.getParameter("trackcode");
                String status = "o";
                String trainno="o";
                String load_station=null, unload_station=null, delay=null;
                Timestamp createtime=null;
                Timestamp unloadtime=null;

                Class.forName("com.mysql.jdbc.Driver");
                //Connection con = DriverManager.getConnection("jdbc:mysql://localhost/indian", "root", "");
                Connection con = DriverManager.getConnection("jdbc:mysql://192.168.1.100/indianrail", "thompson", "root");
                //out.println("connection successful");
                 Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                Vector times = new Vector();
                Vector locations = new Vector();
                Vector delays = new Vector();
                

                ResultSet rs;
                ResultSet rs1;
                ResultSet rs2;
                ResultSet rs3;
                out.println("before stmt.executeQuery(");
                rs = stmt.executeQuery("select distinct(station_name),time,delay from package_location where pkm_id=(select pkm_id from package_train_mapping where pkg_id = '" + pkgid + "') order by time DESC;");
                out.println("after stmt.executeQuery(");
                try {
                    ResultSetMetaData resultSetMetaData = rs.getMetaData();
                    int columnCount = resultSetMetaData.getColumnCount();

                    while (rs.next()) {
                        Object[] values = new Object[columnCount];
                        for (int i = 1; i <= resultSetMetaData.getColumnCount(); i++) {
                            //values[i - 1] = rs.getObject(i);
                            //out.println(rs.getObject(i));
                        }
                        //out.println((String)values[0]);
                        location = (String) rs.getObject(1);
                        time = (Timestamp) rs.getObject(2);
                        delay= (String) rs.getObject(3);

                        out.println("Location : " + location + " Time : " + time);
                        times.add(time);
                        locations.add(location);
                        delays.add(delay);

                    }
                } catch (SQLException e) {
                    out.println(e);
                    out.println(e.getMessage());
                    out.println(e.getErrorCode());

                }

                out.println("before 1 stmt.executeQuery(");
                rs1 = stmt.executeQuery("select load_unload_status,unload_time,train_no,unload_station from package_train_mapping where pkg_id = '" + pkgid + "'");
                out.println("after 1 stmt.executeQuery(");
                try {
                    ResultSetMetaData resultSetMetaData1 = rs1.getMetaData();
                    int columnCount = resultSetMetaData1.getColumnCount();

                    while (rs1.next()) {
                        Object[] values = new Object[columnCount];
                        Object  train= new Integer(11);
                        for (int i = 1; i <= resultSetMetaData1.getColumnCount(); i++) {
                            values[i - 1] = rs1.getObject(i);
                            // out.println(rs1.getObject(i));
                        }
                        
                        status = (String) values[0];
                        
                        unloadtime = (Timestamp) values[1];
                        //trainno=  values[2].toString();
                        trainno= (String) values[2];
                        unload_station= (String) values[3];
                        out.println(unload_station);
                        out.println(status); 
                        out.println(trainno);
                    }
                } catch (SQLException e) {
                    out.println(e);
                    out.println(e.getMessage());
                    out.println(e.getErrorCode());

                }
                out.println("before 2 stmt.executeQuery(");
                rs2 = stmt.executeQuery("select creation_date from package_details where pkg_id = '" + pkgid + "'");
                System.out.println("after 2 stmt.executeQuery(");
                try {
                    ResultSetMetaData resultSetMetaData = rs2.getMetaData();
                    int columnCount = resultSetMetaData.getColumnCount();

                    while (rs2.next()) {
                        createtime = (Timestamp) rs2.getObject(1);

                    }
                } catch (Exception e) {
                    out.println(e);
                    out.println(e.getMessage());
                }
                

        //
        /*
        rs = stmt.executeQuery("select location,time from package_location where pkm_id=(select pkm_id from package_train_mapping where pkg_id = '"+pkgid+"') order by time DESC;");
        rs.last();
        rs1= stmt.executeQuery("select load_unload_status,unload_time from package_train_mapping where pkg_id = '"+pkgid+"'");
        rs1.last();
        rs2=stmt.executeQuery("select creation_date from package_details where pkg_id = '"+pkgid+"'");
        rs2.last();
                 */
        //status= rs1.getString("load_unload_status");
        //createtime=rs2.getString("creation_date");
        //unloadtime=rs1.getString("unload_time");
        //out.println(createtime);
        //out.println(unloadtime);
        %>
        <!-- navigation -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><h1><span class="fa fa-diamond" aria-hidden="true"></span>Indian Railway Package Tracking</h1></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li class="active"><a href="process.jsp">Process</a></li>
                        <li><a href="contact.html">Contact</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-truck" aria-hidden="true"></i> Track Package<b class="caret"></b></a>
                            <div class="dropdown-menu">
                                <div class="track-w3ls">
                                    <h3>Enter Your Tracking Code</h3>
                                    <form action="process.jsp" method="post">
                                        <input id="pkgid" type="text" name="trackcode" placeholder="Enter Tracking Code" required />
                                        <div class="g-recaptcha" data-sitekey="6LcRKRsUAAAAAH1r5Z1UBG4qa1YPAQSQ3BLZOOq5"> </div>
                                        <button type="submit" class="btn btn-primary">Track</button>
                                        <p class="track-p1">Contact Us :</p>
					<p class="track-p2"><a href="mailto:nisargshah1496@gmail.com">nisargshah1496@gmail.com</a></p>
                                    </form>

                                </div>
                            </div>
                        </li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <!-- navigation -->
    
        <!-- tracking section -->
        <section class="shipment-w3ls">
            <div class="container">
                <i class="fa fa-braille" aria-hidden="true"></i>
                <h3 class="text-center wthree w3-agileits agileits-w3layouts agile w3-agile">Shipment Track</h3>
                <p class="text-center wthree w3-agileits agileits-w3layouts agile w3-agile">Animated representation of the real time status of your package.</p>
            </div>
            <div class="container">
                <div class="content-w3ls">	
                    <div class="content1-w3ls">
                        <h2>Order Tracking: <%out.println(pkgid);%></h2><br>
                        <form action="qrdisplay.jsp" method="post">
                            <input type="Submit" value="View Bill" name="billButton" id="billButton"/>
                            <% System.out.println(pkgid); %>
                             <input type="hidden" name="pkgid" id="pkgid" value="<%= pkgid%>"/>
                        </form>
                    </div>
                    <div class="content2-w3ls">
                        <div class="content2-header1">
                            <%if(status.trim().equalsIgnoreCase("P")){%><p>Status : <span> Processing Order</span></p>
                            <%}else if(status.trim().equalsIgnoreCase("L")){%><p>Status :<span> In Transit</span></p>
                            <%}else if(status.trim().equalsIgnoreCase("U")){%><p>Status :<span> Product Delivered</span></p><%}%>
                        </div>
                        <div class="content2-header1">
                            <p>Expected Date : <span>7-NOV-2016</span></p>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="content3-w3ls">
                        <div class="shipment">
                            <div class="confirm">
                                <div class="imgcircle">
                                    <img src="images/confirm.png" alt="confirm order">
                                </div>
                                <span class="line"></span>
                                <p>Confirmed Order</p>
                            </div>
                            <div class="process">
                                <div class="imgcircle">
                                    <img src="images/process.png" alt="process order">
                                </div>
                                <span class="line"></span>
                                <p>Processing Order</p>
                            </div>
                            <%
                                if (status.trim().equalsIgnoreCase("L") || status.trim().equalsIgnoreCase("U")) {%>
                            <div class="dispatch">
                                <div class="imgcircle">
                                    <img src="images/dispatch.png" alt="dispatch product">
                                </div>
                                <span class="line"></span>
                                <p>Dispatched Item</p>
                            </div>
                            <div class="quality">
                                <div class="imgcircle">
                                    <img src="images/quality.png" alt="In Transit">
                                </div>
                                <span class="line"></span>
                                <p>In Transit</p>
                            </div><%} else if (status.trim().equalsIgnoreCase("P")) {%>
                            <div class="dispatchr">
                                <div class="imgcircle">
                                    <img src="images/dispatch.png" alt="dispatch product">
                                </div>
                                <span class="line"></span>
                                <p>Dispatched Item</p>
                                <% //out.println(locations.get(locations.size() - 1)); %>
                            </div>
                            <div class="qualityr">
                                <div class="imgcircle">
                                    <img src="images/quality.png" alt="In Transit">
                                </div>
                                <span class="line"></span>
                                <p>In Transit</p>
                            </div><%}%>
                            <%if(status.trim().equalsIgnoreCase("U")){%>

                            <div class="delivery">
                                <div class="imgcircle">
                                    <img src="images/delivery.png" alt="delivery">
                                </div>
                                <p>Product Delivered</p>
                            </div><%}else{%>

                            <div class="deliveryr">
                                <div class="imgcircle">
                                    <img src="images/delivery.png" alt="delivery">
                                </div>
                                <p>Product Delivered</p><%}%>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </div>	
        </section>	
        <!-- /tracking section -->
        <!-- transit section -->
         <section class="transit-w3ls">
            <div class="container">
                <i class="fa fa-trophy" aria-hidden="true"></i>
                <h3 class="text-center">Transit Location</h3>
                <p class="text-center">Check real time status of your package with the most recent update on top.</p>
            </div>
            <div class="container">
                <div class="colorful-tab-wrapper" id="colorful-flatline">
                    <div class="colorful-tab-container">  
                        <div class="colorful-tab-content active" id="fl-0"> 
                            <div class="skill-info">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th><b>Status</b></th>
                                                <th><b>Time</b></th>
                                                <th><b>Delay</b></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%if(status.trim().equalsIgnoreCase("U")){%>
                                            <tr>
                                                <td>

                                                    <h4 class="text-center"><%out.println("Your package has been unloaded from train "+trainno+" and has reached "+unload_station+" station ");%></h4>
                                                    <div class="clearfix"></div>
                                                </td>
                                                <td><h4 class="text-center"><%out.println(unloadtime);%></h4></td>
                                            </tr>
                                            <% 
                                                }
                                                int jj;
                                                for (jj = 0; jj < times.size(); jj++) {

                                            %>
                                            <tr>
                                                <td>

                                                    <h4 class="text-center"><%out.println("Your package has reached at "+locations.get(jj)+" station.");%></h4>
                                                    <div class="clearfix"></div>
                                                </td>
                                                <td><h4 class="text-center"><%out.println(times.get(jj));%></h4></td>
                                                <td><h4 class="text-center"><%out.println(delays.get(jj));%></h4></td>
                                                
                                            </tr>
                                            <%} location=(String)locations.get(0);%>
                                            <tr>
                                                <td>
                                                    <h4 class="text-center"><%out.println("Package has been confirmed and is dispatched for loading");%></h4>
                                                </td>
                                                <td>
                                                    <h4 class="text-center"> <%out.println(createtime);%></h4>
                                                    <div class="clearfix"></div>
                                                </td>
                                            </tr>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Flatline -->
                 
            </div>
        </section>
    

        <!-- /transit section -->
        <a href="#0" class="cd-top">Top</a>
        <!-- js files -->
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/SmoothScroll.min.js"></script>
        <script src="js/index.js"></script>
        <script src="js/top.js"></script>
        <script type="text/javascript" src="js/colorfulTab.min.js"></script>
        
        <script type="text/javascript">
$(document).ready(function () {

    $("#colorful").colorfulTab();

    $("#colorful-elliptic").colorfulTab({
        theme: "elliptic"
    });

    $("#colorful-flatline").colorfulTab({
        theme: "flatline"
    });

    $("#colorful-background-image").colorfulTab({
        theme: "flatline",
        backgroundImage: "true",
        overlayColor: "#2d3305",
        overlayOpacity: "0.8"
    });

});
        </script>
        <script src="http://maps.google.com/maps/api/js?key=AIzaSyBVi14_ZTj1E6qe9l311HpdukC5-dAb4Bw&callback=initmap" 
           type="text/javascript"></script>
       <center> <div id="map" style="width: 400px; height: 300px; align: center"></div></center>
         <script type="text/javascript"> 

   var address = "<%=location%>, Railway Station";

   var map = new google.maps.Map(document.getElementById('map'), { 
       mapTypeId: google.maps.MapTypeId.TERRAIN,
       zoom: 6
   });

   var geocoder = new google.maps.Geocoder();

   geocoder.geocode({
      'address': address
   }, 
   function(results, status) {
      if(status == google.maps.GeocoderStatus.OK) {
         new google.maps.Marker({
            position: results[0].geometry.location,
            map: map
         });
         map.setCenter(results[0].geometry.location);
      }
      else {
         // Google couldn't geocode this request. Handle appropriately.
      }
   });

   </script> 
       <%
            }
            catch(Exception e){
                
            }
        %>
        <!-- /js files -->
    </body>
</html>