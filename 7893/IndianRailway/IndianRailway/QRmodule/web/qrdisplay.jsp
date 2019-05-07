<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" rel="stylesheet" media="screen">

        <!-- Bootstrap -->
        <link href="/IndianRailway/bootstrap.min.css" rel="stylesheet">
        <!-- styles -->
        <link href="/IndianRailway/styles.css" rel="stylesheet">
        <link href="/IndianRailway/forms.css" rel="stylesheet">
        <script src="/IndianRailway/forms.js"></script>
        
        <title>Parcel Bill</title>
        <style>
            .myImage {
                float: left;
                font-family: Veranda;
            }
            .heading {
                float:next
            }
        </style>

        <script>
            //function myFunction() {
            //  window.print();
            //}

            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;
            }
        </script>

    </head>

    <%

        System.out.println("From jsp: " + request.getParameter("packageId"));
    %>



    <body>
        <%
            session = request.getSession(false);
            if (session.getAttribute("staffID") == null) {
                response.sendRedirect("login.jsp");
            } else {
            }

        %>

        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <!-- Logo -->
                        <div class="logo">
                            <h1><a href="home.jsp">Indian Railways</a></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="page-content">
            <div class="row">
                <jsp:include page="sidepanel.jsp" />
                <div class="col-md-6">
                    <div class="content-box-large">
                        <div class="panel-heading">

                        </div>
                        <div class="panel-body">
                            <div id="printableArea">
                                <%                //        session = request.getSession(false);
                                    //        if(session.getAttribute("staffID") == null){
                                    //            response.sendRedirect("login.jsp");
                                    //        } 
                                    //        else{}

                                %>

                                <image style="float: left" src="/IndianRailway/QRcodeServlet?id=<%=request.getParameter("packageId")%>" width="200" height="200"></image>


                                <%
                                    try {
                                        String url = "jdbc:mysql://localhost/indianrail";
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection(url, "root", "root");

                                        Statement stmt = con.createStatement();

                                        String pkg_id = request.getParameter("packageId");
                                        String query1 = "SELECT * FROM package_details WHERE pkg_id='" + request.getParameter("packageId") + "'";
                                        System.out.println(query1);
                                        ResultSet rs = stmt.executeQuery(query1);

                                        int sender_cid = 0, receiver_cid = 0;
                                        int total_cost = 0;
                                        String src_station_code = null, dest_station_code = null;
                                        while (rs.next()) {
                                            sender_cid = rs.getInt("sender_cid");
                                            receiver_cid = rs.getInt("receiver_cid");
                                            //no_of_pkg = rs.getInt("no_of_pkg");
                                            total_cost = rs.getInt("payment_amount");
                                            src_station_code = rs.getString("src_station_code");
                                            dest_station_code = rs.getString("dest_station_code");
                                        }
                                        int no_of_pkg = (total_cost / 50);
                                        long sphone = 0, rphone = 0;
                                        System.out.println(sender_cid + " " + receiver_cid + " " + receiver_cid + " " + src_station_code + " " + dest_station_code);

                                        query1 = "select * from contacts where cid=" + sender_cid;
                                        System.out.println(query1);
                                        rs = stmt.executeQuery(query1);
                                        String sname = null, saddress = null, rname = null, raddress = null;
                                        while (rs.next()) {
                                            sname = rs.getString("cname");
                                            saddress = rs.getString("address");
                                            sphone = rs.getLong("phone");
                                        }

                                        query1 = "select * from contacts where cid=" + receiver_cid;
                                        System.out.println(query1 + "\n\n");
                                        rs = stmt.executeQuery(query1);

                                        while (rs.next()) {
                                            rname = rs.getString("cname");
                                            raddress = rs.getString("address");
                                            rphone = rs.getLong("phone");
                                        }

                                %>
                                <h1 class="heading"><%= src_station_code%> - <%= dest_station_code%></h1>

                                <br><br><br><br><br><br><br><br><br><br>
                                <table border="2" cellpadding="0" cellspacing="0" width="400px"> 
                                    <tr><th> <h3>PACKAGE ID.</h3> </th><th> <h3><%= "  " + pkg_id%></h3> </th></tr> 
                                </table>
                                <hr>
                                <table border="2" cellpadding="0" cellspacing="0" width="500px">
                                    <tr>
                                        <th> SENDER  </th>
                                        <th> RECEIVER </th>
                                    </tr>
                                    <tr>
                                        <td> Name : <%= sname%> </td>
                                        <td> Name : <%= rname%> </td>   
                                    </tr>
                                    <tr>
                                        <td> Address : <%= saddress%> </td>
                                        <td> Address : <%= raddress%> </td>   
                                    </tr>
                                    <tr>
                                        <td> Phone : <%= sphone%> </td>
                                        <td> Phone : <%= rphone%> </td>   
                                    </tr>
                                </table> <br>
                                <table border="2" cellpadding="0" cellspacing="0" width="400px">
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Quantity</th>
                                        <th>Price(Rs.)</th>
                                    </tr>
                                    <tr>
                                        <td><%= pkg_id%></td>  

                                        <td><%= no_of_pkg%></td> 
                                        <td>  50  </td>
                                    </tr>
                                    <tr colspan="2">
                                        <td><b>TOTAL</b></td>  


                                        <td> <%=total_cost%>   </td>
                                    </tr>

                                </table>
                                <%

                                        con.close();
                                        rs.close();
                                        stmt.close();

                                    } catch (Exception e) {
                                    }
                                %>
                            </div>
                            <br><br>
                            

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <input class="btn btn-primary" type="button" onclick="printDiv('printableArea')" value="PRINT BILL" width="150px" height="50px" />
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </body>
</html>
