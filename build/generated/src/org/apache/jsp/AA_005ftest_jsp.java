package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class AA_005ftest_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <style>\n");
      out.write("            #mainDiv\n");
      out.write("            {\n");
      out.write("                width: 1300px;\n");
      out.write("                margin: auto;\n");
      out.write("            }\n");
      out.write("            .dropdown \n");
      out.write("            {\n");
      out.write("                    position: relative;\n");
      out.write("                    display: inline-block;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            .dropdown-content {\n");
      out.write("                display: none;\n");
      out.write("                position: fixed;\n");
      out.write("                background-color:#efeede;\n");
      out.write("                min-width: 130px;\n");
      out.write("                z-index: 1;\n");
      out.write("                font-size: 12px;\n");
      out.write("                font-weight: normal;\n");
      out.write("                text-align: left;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown-content a {\n");
      out.write("                padding: 8px 12px;\n");
      out.write("                text-decoration: none;\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown-content a:hover {background-color: #dad189 ;}\n");
      out.write("\n");
      out.write("            .dropdown:hover .dropdown-content {\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown:hover .dropbtn {\n");
      out.write("                background-color: none;\n");
      out.write("            }\n");
      out.write("            .li-ele\n");
      out.write("            {\n");
      out.write("                text-align: left;\n");
      out.write("                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"mainDiv\">\n");
      out.write("            <ul>\n");
      out.write("                      <li id=\"link\"><a href=\"EIS_dataoneis.jsp\">Home</a></li>\n");
      out.write("                      <li id=\"link\"><a href=\"EGS_Grievance_Hqtr.jsp\">Grievance</a></li>\n");
      out.write("                      <li id=\"link\"><a href=\"searchInfo.jsp\">Search on EIS</a></li>\n");
      out.write("                      <li id=\"link\"><a href=\"EIS_instwise.jsp\">Institute Wise Data</a></li>\n");
      out.write("                      <li id=\"link\"><a href=\"EIS_updatedPref.jsp\">Updated Preference List</a></li>\n");
      out.write("                      ");
      out.write("\n");
      out.write("                      <li id=\"link\"><a href=\"EIS_report_BySelecting_Inst.jsp\">Discipline Wise Report</a></li>\n");
      out.write("                      ");
      out.write("\n");
      out.write("                      <li id=\"link\" class=\"dropdown\">\n");
      out.write("                          <a class=\"dropbtn\" >Retired List</a>\n");
      out.write("                          <div class=\"dropdown-content\">\n");
      out.write("                              <a class=\"li-ele\" href=\"all_retired_list1.jsp\">Complete List</a>\n");
      out.write("                              <a class=\"li-ele\" href=\"EIS_retired_list1.jsp\">List designation wise</a> \n");
      out.write("                          </div>\n");
      out.write("                      </li>\n");
      out.write("                      <li id=\"link\"><a HREF=\"EISadlogout.jsp\" >Logout</a></li>\n");
      out.write("           </ul>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
