package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.*;

public final class logo1_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();

      out.write("\r\n");
      out.write("<title>Untitled Document</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("\r\n");
      out.write("<!-- Fixes the IE6 & IE7 \"Press SPACEBAR or ENTER to activate and use this control\" - must be at the beginning of the file-->\r\n");
      out.write("<script language=\"JScript\" type=\"text/jscript\" src=\"../activateActiveX_onload.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<link href=\"style.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write(".style1 {\r\n");
      out.write("\tfont-family: Verdana, Arial, Helvetica, sans-serif;\r\n");
      out.write("\tfont-size: 10px;\r\n");
      out.write("\tcolor: #999999;\r\n");
      out.write("   \tfont-weight: normal;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".style1 a {\r\n");
      out.write("\tcolor: #999999;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".style1 a:link {\r\n");
      out.write("\tcolor: #999999;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".style1 a:visited {\r\n");
      out.write("\tcolor: #999999;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".style1 a:hover {\r\n");
      out.write("\tcolor: #666666;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(".style2 {\r\n");
      out.write("\tfont-family: Verdana, Arial, Helvetica, sans-serif;\r\n");
      out.write("\tfont-size: 12px;\r\n");
      out.write("\tcolor: #000099;\r\n");
      out.write("   \tfont-weight: bold;\r\n");
      out.write("}\r\n");
      out.write(".style3 {\r\n");
      out.write("\tfont-family: Verdana, Arial, Helvetica, sans-serif;\r\n");
      out.write("\tfont-size: 12px;\r\n");
      out.write("\tcolor: #ff0000;\r\n");
      out.write("   \tfont-weight: bold;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<!--[if lt IE 7]>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("#wrapper {\r\n");
      out.write("\tbackground-image: url(../img/intro_bg03.gif);\r\n");
      out.write("\tbackground-repeat: no-repeat;\r\n");
      out.write("\tbackground-position: right top;\r\n");
      out.write("\theight:100%;\r\n");
      out.write("\twidth:100%;\r\n");
      out.write("\tmargin: 0;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\tborder: none;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<![endif]-->\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"startback\" SCROLL=\"NO\">\r\n");
      out.write("\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" id=\"wrapper\">\r\n");
      out.write("    <tr>\r\n");
      out.write("        <td>\r\n");
      out.write("\t\r\n");
      out.write("\t    </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<!-- Fixes the IE6 & IE7 \"Press SPACEBAR or ENTER to activate and use this control\" - must be at the end of the file-->\r\n");
      out.write("<script language=\"JScript\" type=\"text/jscript\" src=\"../activateActiveX.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 pageData.closeConnection(); 
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
