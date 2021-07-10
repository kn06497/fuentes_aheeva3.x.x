package org.apache.jsp.aheevaManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.net.*;
import aheevaManager.ressources.*;

public final class CommPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/Resources_pages/globFuncs_labels.jsp");
  }

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<head>\n");
      out.write('\r');
      out.write('\n');

beanManagerData pageGlobFData = new beanManagerData();
pageGlobFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageGlobFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var glob= new Array();\r\n");
      out.write("glob[0]=\"");
      out.print(pageGlobFData.getWord("Data has been changed in") );
      out.write("\";\r\n");
      out.write("glob[1]=\"");
      out.print(pageGlobFData.getWord("Do you want to reload information?") );
      out.write("\";\r\n");
      out.write("glob[2]=\"");
      out.print(pageGlobFData.getWord("yes") );
      out.write("\";\r\n");
      out.write("glob[3]=\"");
      out.print(pageGlobFData.getWord("no") );
      out.write("\";\r\n");
      out.write("glob[4]=\"");
      out.print(pageGlobFData.getWord("Close") );
      out.write("\";\r\n");
      out.write("glob[5]=\"");
      out.print(pageGlobFData.getWord("Notice") );
      out.write("\";\r\n");
      out.write("glob[6]=\"");
      out.print(pageGlobFData.getWord("ALERT") );
      out.write("\";\r\n");
      out.write("glob[7]=\"");
      out.print(pageGlobFData.getWord("Couldn't get connection from") );
      out.write("\";\r\n");
      out.write("glob[8]=\"");
      out.print(pageGlobFData.getWord("WARNING") );
      out.write("\";\r\n");
      out.write("glob[9]=\"");
      out.print(pageGlobFData.getWord("Connection successfull to") );
      out.write("\";\r\n");
      out.write("glob[10]=\"");
      out.print(pageGlobFData.getWord("MESSAGE") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageGlobFData.closeConnection(); 
      out.write("\n");
      out.write("<script language=\"javascript\" src=\"Resources_pages/globFuncs.js\"></script>\n");
      out.write("<script language=\"javascript\" src=\"Resources_pages/jsUtil.js\"></script>\n");
      out.write("\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var i;\n");
      out.write("var user = 0;\n");
      out.write("var lang = 0; \n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<base target=\"contents\">\n");
      out.write("<body bottommargin=\"0\" leftmargin=\"0\" rightmargin=\"0\" topmargin=\"0\">\n");
      out.write("\n");
 
String remoteIp = request.getRemoteAddr();

      out.write("\n");
      out.write("\n");
      out.write("<!-- Loading the Communication applet with the JSP plugin special tag -->\n");
      out.write("<OBJECT classid=\"clsid:8AD9C840-044E-11D1-B3E9-00805F499D93\" name=\"myApplet\"" + " width=\"" + "0" + "\"" + " height=\"" + "0" + "\"" + " codebase=\"http://java.sun.com/products/plugin/1.2.2/jinstall-1_2_2-win.cab#Version=1,2,2,0\">");
      out.write("\n");
      out.write("<PARAM name=\"java_code\" value=\"aheevaManager.java.ComApplet.class\">");
      out.write("\n");
      out.write("<PARAM name=\"java_archive\" value=\"sManager.jar\">");
      out.write("\n");
      out.write("<PARAM name=\"type\" value=\"application/x-java-applet;version=1.5\">");
      out.write("\n");
      out.write( "<PARAM name=\"debug\" value=\"" + "0" + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"host\" value=\"" +  (remoteIp.substring(0, 7).compareTo("192.168") == 0 ? "192.168.2.2" : "192.168.2.2") + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"port\" value=\"" +  (remoteIp.substring(0, 7).compareTo("192.168") == 0 ? "8765" : "8765") + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"remoteConnection\" value=\"" +  (remoteIp.substring(0, 7).compareTo("192.168") == 0 ? "false" : "true") + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"initial_focus\" value=\"" + "false" + "\">" );
      out.write("\n");
      out.write("<COMMENT>");
      out.write("\n");
      out.write("<EMBED type=\"application/x-java-applet;version=1.5\" name=\"myApplet\"" + " width=\"" + "0" + "\"" + " height=\"" + "0" + "\"" + " pluginspage=\"http://java.sun.com/products/plugin/\" java_code=\"aheevaManager.java.ComApplet.class\" java_archive=\"sManager.jar\"");
      out.write( " debug=\"" + "0" + "\"" );
      out.write( " host=\"" +  (remoteIp.substring(0, 7).compareTo("192.168") == 0 ? "192.168.2.2" : "192.168.2.2") + "\"" );
      out.write( " port=\"" +  (remoteIp.substring(0, 7).compareTo("192.168") == 0 ? "8765" : "8765") + "\"" );
      out.write( " remoteConnection=\"" +  (remoteIp.substring(0, 7).compareTo("192.168") == 0 ? "false" : "true") + "\"" );
      out.write( " initial_focus=\"" + "false" + "\"" );
      out.write("/>");
      out.write("\n");
      out.write("<NOEMBED>");
      out.write("\n");
      out.write("Your browser does not support Java Applets");
      out.write("\n");
      out.write("</NOEMBED>");
      out.write("\n");
      out.write("</COMMENT>");
      out.write("\n");
      out.write("</OBJECT>");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div id=\"dropin\" name=\"dropin\" style=\"position:absolute;visibility:hidden; width:100%;left:0px;top:0px;background-color:#FFFFEB; font-family:verdana; font-size:11px;\"></div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
