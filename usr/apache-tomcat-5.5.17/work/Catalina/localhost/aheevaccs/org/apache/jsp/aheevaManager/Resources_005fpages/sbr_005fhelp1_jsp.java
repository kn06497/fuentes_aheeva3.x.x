package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.*;

public final class sbr_005fhelp1_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n");
      out.write("\"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();

      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<title>Aheeva SBR Help</title>\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"bottompagebody\" leftmargin=\"0\" topmargin=\"0\" rightmargin=\"0\" bottommargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("<table width=\"100%\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"10%\"><img src=\"../img/help_faq.gif\" width=\"20\" height=\"20\"></td>\r\n");
      out.write("\t\t<td width=\"90%\" class=\"sbrHelpTitle\">\r\n");
      out.write("\t\t ");
      out.print( pageData.getWord("Routing script documentation"));
      out.write("</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"10%\">&nbsp;</td>\r\n");
      out.write("\t\t<td width=\"90%\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<a href=\"#Shortcuts\"> ");
      out.print( pageData.getWord("Shortcuts"));
      out.write("</a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"10%\">&nbsp;</td>\r\n");
      out.write("\t\t<td width=\"90%\">\r\n");
      out.write("\t\t\t<a name=\"Shortcuts\"></a>\r\n");
      out.write("\t\t\t<div class=\"sbrHelpSubTitle\">");
      out.print( pageData.getWord("Shortcuts"));
      out.write(" <img src=\"../img/shortcut.gif\" width=\"21\" height=\"16\"></div>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\" class=\"sbrHelpGrayBg\"><em>Ctrl+S</em></td><td width=\"25%\" class=\"sbrHelpGrayBg\">");
      out.print( pageData.getWord("Save"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\"><em>Ctrl++</em></td><td width=\"25%\">");
      out.print( pageData.getWord("Zoom in"));
      out.write("</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\"><em>Ctrl+-</em></td><td width=\"25%\">");
      out.print( pageData.getWord("Zoom out"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\" class=\"sbrHelpGrayBg\"><em>Esc</em></td><td width=\"25%\" class=\"sbrHelpGrayBg\">");
      out.print( pageData.getWord("Reset zoom"));
      out.write("</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\" class=\"sbrHelpGrayBg\"><em>Ctrl+Shift+D</em></td><td width=\"25%\" class=\"sbrHelpGrayBg\">");
      out.print( pageData.getWord("Debug/NoDebug mode"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\"><em>Ctrl+Shift+E</em></td><td width=\"25%\">");
      out.print( pageData.getWord("Erase diagram"));
      out.write("</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\"><em>Ctrl+Shift+H</em></td><td width=\"25%\">");
      out.print( pageData.getWord("Display this help"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\" class=\"sbrHelpGrayBg\"><em>Ctrl+Shift+N</em></td><td width=\"25%\" class=\"sbrHelpGrayBg\">");
      out.print( pageData.getWord("New script"));
      out.write("...</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\" class=\"sbrHelpGrayBg\"><em>Ctrl+Shift+O</em></td><td width=\"25%\" class=\"sbrHelpGrayBg\">");
      out.print( pageData.getWord("Open script"));
      out.write("...</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\"><em>Ctrl+Shift+P</em></td><td width=\"25%\">");
      out.print( pageData.getWord("Call properties dialog"));
      out.write("</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\"><em>Ctrl+Shift+R</em></td><td width=\"25%\">");
      out.print( pageData.getWord("Refresh diagram"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\" class=\"sbrHelpGrayBg\"><em>Ctrl+Shift+S</em></td><td width=\"25%\" class=\"sbrHelpGrayBg\">");
      out.print( pageData.getWord("Save as"));
      out.write("...</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\" class=\"sbrHelpGrayBg\"><em>Ctrl+Shift+V</em></td><td width=\"25%\" class=\"sbrHelpGrayBg\">");
      out.print( pageData.getWord("Validate whole diagram"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\"><em>Ctrl+Shift+X</em></td><td width=\"25%\">");
      out.print( pageData.getWord("Exit editor"));
      out.write("</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
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
