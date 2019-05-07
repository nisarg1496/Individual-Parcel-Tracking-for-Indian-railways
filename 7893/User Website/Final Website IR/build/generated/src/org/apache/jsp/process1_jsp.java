package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Vector;
import java.sql.Timestamp;
import java.sql.DriverManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;

public final class process1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Indian Railways Package Tracking</title>\n");
      out.write("        <!-- for-mobile-apps -->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <meta name=\"keywords\" content=\"Courier Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, \n");
      out.write("              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design\" />\n");
      out.write("        <script type=\"application/x-javascript\"> addEventListener(\"load\", function() { setTimeout(hideURLbar, 0); }, false);\n");
      out.write("            function hideURLbar(){ window.scrollTo(0,1); } </script>\n");
      out.write("        <!-- css files -->\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n");
      out.write("        <link href=\"css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n");
      out.write("        <link href=\"css/colorfulTab.min.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n");
      out.write("        <!-- /css files -->\n");
      out.write("        <!-- font files -->\n");
      out.write("        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700italic,700,800,800italic' rel='stylesheet' type='text/css'>\n");
      out.write("        <link href=\"//fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900\" rel=\"stylesheet\">\n");
      out.write("        <!-- /font files -->\n");
      out.write("        <!-- js files -->\n");
      out.write("\n");
      out.write("        <!-- /js files -->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");

           try {
                int count = 0;
                Timestamp time = new Timestamp(12, 12, 12, 12, 12, 12, 12);
                String location;
                String pkgid = request.getParameter("trackcode");
                String status = "o";
                Timestamp createtime=null;
                Timestamp unloadtime;

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/indian", "root", "");
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                Vector times = new Vector();
                Vector locations = new Vector();
                

                ResultSet rs;
                ResultSet rs1;
                ResultSet rs2;
                rs = stmt.executeQuery("select location,time from package_location where pkm_id=(select pkm_id from package_train_mapping where pkg_id = '" + pkgid + "') order by time DESC;");
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

                        out.println("Location : " + location + " Time : " + time);
                        times.add(time);
                        locations.add(location);

                    }
                } catch (SQLException e) {
                    out.println(e);
                    out.println(e.getMessage());
                    out.println(e.getErrorCode());

                }

        //
                rs1 = stmt.executeQuery("select load_unload_status,unload_time from package_train_mapping where pkg_id = '" + pkgid + "'");
                try {
                    ResultSetMetaData resultSetMetaData1 = rs1.getMetaData();
                    int columnCount = resultSetMetaData1.getColumnCount();

                    while (rs1.next()) {
                        Object[] values = new Object[columnCount];
                        for (int i = 1; i <= resultSetMetaData1.getColumnCount(); i++) {
                            values[i - 1] = rs1.getObject(i);
                            // out.println(rs1.getObject(i));
                        }
                        status = (String) values[0];
                        unloadtime = (Timestamp) values[1];
                        out.println(status);
                    }
                } catch (SQLException e) {
                    out.println(e);
                    out.println(e.getMessage());
                    out.println(e.getErrorCode());

                }

                rs2 = stmt.executeQuery("select creation_date from package_details where pkg_id = '" + pkgid + "'");
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
        
      out.write("\n");
      out.write("        <!-- navigation -->\n");
      out.write("        <nav class=\"navbar navbar-default navbar-fixed-top\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\">\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </button>\n");
      out.write("                    <a class=\"navbar-brand\" href=\"index.html\"><h1><span class=\"fa fa-diamond\" aria-hidden=\"true\"></span>Indian Railway Package Tracking</h1></a>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"navbar\" class=\"navbar-collapse collapse\">\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                        <li><a href=\"index.html\">Home</a></li>\n");
      out.write("                        <li><a href=\"about.html\">About</a></li>\n");
      out.write("                        <li class=\"active\"><a href=\"process.jsp\">Process</a></li>\n");
      out.write("                        <li><a href=\"contact.html\">Contact</a></li>\n");
      out.write("                        <li class=\"dropdown\">\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-truck\" aria-hidden=\"true\"></i> Track Package<b class=\"caret\"></b></a>\n");
      out.write("                            <div class=\"dropdown-menu\">\n");
      out.write("                                <div class=\"track-w3ls\">\n");
      out.write("                                    <h3>Enter Your Tracking Code</h3>\n");
      out.write("                                    <form action=\"process.jsp\" method=\"post\">\n");
      out.write("                                        <input type=\"text\" name=\"trackcode\" placeholder=\"Enter Tracking Code\" required />\n");
      out.write("                                        <button type=\"submit\" class=\"btn btn-primary\">Track</button>\n");
      out.write("                                    </form>\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div><!--/.nav-collapse -->\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <!-- navigation -->\n");
      out.write("        <!-- banner section -->\n");
      out.write("        <section class=\"inner-w3ls\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <h2 class=\"text-center w3layouts w3 w3l agileits agileinfo\">Track Your Product</h2>\n");
      out.write("                <p class=\"text-center w3layouts w3 w3l agileits agileinfo\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <!-- /banner section -->\n");
      out.write("        <!-- tracking section -->\n");
      out.write("        <section class=\"shipment-w3ls\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <i class=\"fa fa-braille\" aria-hidden=\"true\"></i>\n");
      out.write("                <h3 class=\"text-center wthree w3-agileits agileits-w3layouts agile w3-agile\">Shipment Track</h3>\n");
      out.write("                <p class=\"text-center wthree w3-agileits agileits-w3layouts agile w3-agile\">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"content-w3ls\">\t\n");
      out.write("                    <div class=\"content1-w3ls\">\n");
      out.write("                        <h2>Order Tracking: ");
out.println(pkgid);
      out.write("</h2>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"content2-w3ls\">\n");
      out.write("                        <div class=\"content2-header1\">\n");
      out.write("                            <p>Status : <span>Dispatched Item</span></p>\t\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"content2-header1\">\n");
      out.write("                            <p>Expected Date : <span>7-NOV-2016</span></p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"clear\"></div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"content3-w3ls\">\n");
      out.write("                        <div class=\"shipment\">\n");
      out.write("                            <div class=\"confirm\">\n");
      out.write("                                <div class=\"imgcircle\">\n");
      out.write("                                    <img src=\"images/confirm.png\" alt=\"confirm order\">\n");
      out.write("                                </div>\n");
      out.write("                                <span class=\"line\"></span>\n");
      out.write("                                <p>Confirmed Order</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"process\">\n");
      out.write("                                <div class=\"imgcircle\">\n");
      out.write("                                    <img src=\"images/process.png\" alt=\"process order\">\n");
      out.write("                                </div>\n");
      out.write("                                <span class=\"line\"></span>\n");
      out.write("                                <p>Processing Order</p>\n");
      out.write("                            </div>\n");
      out.write("                            ");

                                if (status.trim().equalsIgnoreCase("L") || status.trim().equalsIgnoreCase("U")) {
      out.write("\n");
      out.write("                            <div class=\"dispatch\">\n");
      out.write("                                <div class=\"imgcircle\">\n");
      out.write("                                    <img src=\"images/dispatch.png\" alt=\"dispatch product\">\n");
      out.write("                                </div>\n");
      out.write("                                <span class=\"line\"></span>\n");
      out.write("                                <p>Dispatched Item</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"quality\">\n");
      out.write("                                <div class=\"imgcircle\">\n");
      out.write("                                    <img src=\"images/quality.png\" alt=\"In Transit\">\n");
      out.write("                                </div>\n");
      out.write("                                <span class=\"line\"></span>\n");
      out.write("                                <p>In Transit</p>\n");
      out.write("                            </div>");
} else if (status.trim().equalsIgnoreCase("P")) {
      out.write("\n");
      out.write("                            <div class=\"dispatchr\">\n");
      out.write("                                <div class=\"imgcircle\">\n");
      out.write("                                    <img src=\"images/dispatch.png\" alt=\"dispatch product\">\n");
      out.write("                                </div>\n");
      out.write("                                <span class=\"line\"></span>\n");
      out.write("                                <p>Dispatched Item</p>\n");
      out.write("                                ");
 //out.println(locations.get(locations.size() - 1)); 
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"qualityr\">\n");
      out.write("                                <div class=\"imgcircle\">\n");
      out.write("                                    <img src=\"images/quality.png\" alt=\"In Transit\">\n");
      out.write("                                </div>\n");
      out.write("                                <span class=\"line\"></span>\n");
      out.write("                                <p>In Transit</p>\n");
      out.write("                            </div>");
}
      out.write("\n");
      out.write("                            ");
if(status.trim().equalsIgnoreCase("U")){
      out.write("\n");
      out.write("\n");
      out.write("                            <div class=\"delivery\">\n");
      out.write("                                <div class=\"imgcircle\">\n");
      out.write("                                    <img src=\"images/delivery.png\" alt=\"delivery\">\n");
      out.write("                                </div>\n");
      out.write("                                <p>Product Delivered</p>\n");
      out.write("                            </div>");
}else{
      out.write("\n");
      out.write("\n");
      out.write("                            <div class=\"deliveryr\">\n");
      out.write("                                <div class=\"imgcircle\">\n");
      out.write("                                    <img src=\"images/delivery.png\" alt=\"delivery\">\n");
      out.write("                                </div>\n");
      out.write("                                <p>Product Delivered</p>");
}
      out.write("\n");
      out.write("                                <div class=\"clear\"></div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\t\n");
      out.write("        </section>\t\n");
      out.write("        <!-- /tracking section -->\n");
      out.write("        <!-- transit section -->\n");
      out.write("         <section class=\"transit-w3ls\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <i class=\"fa fa-trophy\" aria-hidden=\"true\"></i>\n");
      out.write("                <h3 class=\"text-center\">Transit Location</h3>\n");
      out.write("                <p class=\"text-center\">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"colorful-tab-wrapper\" id=\"colorful-flatline\">\n");
      out.write("                    <div class=\"colorful-tab-container\">  \n");
      out.write("                        <div class=\"colorful-tab-content active\" id=\"fl-0\"> \n");
      out.write("                            <div class=\"skill-info\">\n");
      out.write("                                <div class=\"table-responsive\">\n");
      out.write("                                    <table class=\"table\">\n");
      out.write("                                        <thead>\n");
      out.write("                                            <tr>\n");
      out.write("                                                <th>Location</th>\n");
      out.write("                                                <th>Time</th>\n");
      out.write("                                            </tr>\n");
      out.write("                                        </thead>\n");
      out.write("                                        <tbody>\n");
      out.write("                                            ");
 

                                                int jj;
                                                for (jj = 0; jj < times.size(); jj++) {

                                            
      out.write("\n");
      out.write("                                            <tr>\n");
      out.write("                                                <td>\n");
      out.write("\n");
      out.write("                                                    <h4 class=\"text-center\">");
out.println(locations.get(jj));
      out.write("</h4>\n");
      out.write("                                                    <div class=\"clearfix\"></div>\n");
      out.write("                                                </td>\n");
      out.write("                                                <td><h4 class=\"text-center\">");
out.println(times.get(jj));
      out.write("</h4></td>\n");
      out.write("                                            </tr>\n");
      out.write("                                            ");
}
      out.write("\n");
      out.write("                                            <tr>\n");
      out.write("                                                <td>\n");
      out.write("                                                    <h4 class=\"text-center\">");
out.println("Package has been confirmed and is dispatched for loading");
      out.write("</h4>\n");
      out.write("                                                </td>\n");
      out.write("                                                <td>\n");
      out.write("                                                    <h4 class=\"text-center\"> ");
out.println(createtime);
      out.write("</h4>\n");
      out.write("                                                    <div class=\"clearfix\"></div>\n");
      out.write("                                                </td>\n");
      out.write("                                            </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                        </tbody>\n");
      out.write("                                    </table>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- Flatline -->\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        ");

            }
            catch(Exception e){
                
            }
        
      out.write("\n");
      out.write("\n");
      out.write("        <!-- /transit section -->\n");
      out.write("        <a href=\"#0\" class=\"cd-top\">Top</a>\n");
      out.write("        <!-- js files -->\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"js/SmoothScroll.min.js\"></script>\n");
      out.write("        <script src=\"js/index.js\"></script>\n");
      out.write("        <script src=\"js/top.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/colorfulTab.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("$(document).ready(function () {\n");
      out.write("\n");
      out.write("    $(\"#colorful\").colorfulTab();\n");
      out.write("\n");
      out.write("    $(\"#colorful-elliptic\").colorfulTab({\n");
      out.write("        theme: \"elliptic\"\n");
      out.write("    });\n");
      out.write("\n");
      out.write("    $(\"#colorful-flatline\").colorfulTab({\n");
      out.write("        theme: \"flatline\"\n");
      out.write("    });\n");
      out.write("\n");
      out.write("    $(\"#colorful-background-image\").colorfulTab({\n");
      out.write("        theme: \"flatline\",\n");
      out.write("        backgroundImage: \"true\",\n");
      out.write("        overlayColor: \"#2d3305\",\n");
      out.write("        overlayOpacity: \"0.8\"\n");
      out.write("    });\n");
      out.write("\n");
      out.write("});\n");
      out.write("        </script>\n");
      out.write("        <!-- /js files -->\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
