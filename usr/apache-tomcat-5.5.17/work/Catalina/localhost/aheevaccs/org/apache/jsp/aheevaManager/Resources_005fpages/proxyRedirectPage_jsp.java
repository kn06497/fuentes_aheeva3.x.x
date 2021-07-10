package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.*;
import java.sql.ResultSet;
import java.io.IOException;

public final class proxyRedirectPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<title>Screen Capture desktop</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
 

beanManagerData pageData = new beanManagerData();
boolean decodeHeader = true;

String query = "SELECT ipaddress FROM datamart_agent_sessions WHERE agent_id =" + request.getParameter("agentID")+" ORDER BY event_time DESC LIMIT 1";
//String query = "SELECT ipaddress FROM datamart_agent_sessions WHERE agent_id = 304  ORDER BY event_time DESC LIMIT 1";

String agentMachineIP ="";
pageData.openConnection();
ResultSet resultSet = pageData.executeFromString(query);
	while(resultSet.next()){
		agentMachineIP = resultSet.getString("ipaddress");
	}
	

String agentHost = request.getParameter("proxyHost");
String agentPort = request.getParameter("proxyPort");


      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<APPLET CODE= aheevaManager.vncViewerApplet.screencapviewer.class ARCHIVE=sVncViewerApplet.jar WIDTH=1024 HEIGHT=800>\r\n");
      out.write("\t\t<param name=HOST value=");
      out.print(agentHost);
      out.write(" />\r\n");
      out.write("\t\t<param name=PORT value=");
      out.print(agentPort);
      out.write(" />\r\n");
      out.write("\t\t<param name=PASS value=\"atelka\"/>\r\n");
      out.write("\t\t<param name=agentMachineIP value=");
      out.print(agentMachineIP);
      out.write(" />\r\n");
      out.write("\t</APPLET>\r\n");
      out.write("\t\r\n");
      out.write("</body>\r\n");
 pageData.closeConnection(); 
      out.write("\r\n");
      out.write("</html>");
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
