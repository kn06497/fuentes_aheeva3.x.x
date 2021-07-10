package org.apache.jsp.aheevaManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>Aheeva</title>\r\n");
      out.write("<LINK REL=\"SHORTCUT ICON\" HREF=\"img/aheeva.ico\">\r\n");
      out.write("\r\n");
      out.write("<!-- Fixes the IE6 & IE7 \"Press SP\r\n");
      out.write("ACEBAR or ENTER to activate and use this control\" - must be at the beginning of the file-->\r\n");
      out.write("<script language=\"JScript\" type=\"text/jscript\" src=\"activateActiveX_onload.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"flashobject.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"/jsUtil.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\r\n");
      out.write("function refreshFrame() {\r\n");
      out.write("frames['comm'].window.location.href = \"CommPage.jsp\"; // frame 1's page\r\n");
      out.write("}\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("<script language=\"javascript\" src=\"Resources_pages/globFuncsIndexHTM.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<frameset rows=\"*,100%\"  border=\"1\" >\r\n");
      out.write("<frame name=\"comm\" scrolling=\"no\" noresize target=\"contents\" src=\"CommPage.jsp\" >\r\n");
      out.write("<frame name=\"main\" scrolling=\"no\" noresize target=\"contents\" src=\"login.jsp\" >\r\n");
      out.write("<noframes>Your browser does not support frames</noframes>\r\n");
      out.write("\r\n");
      out.write("<!-- Fixes the IE6 & IE7 \"Press SPACEBAR or ENTER to activate and use this control\" - must be at the end of the file-->\r\n");
      out.write("<script language=\"JScript\" type=\"text/jscript\" src=\"activateActiveX.js\"></script>\r\n");
      out.write("</html>\r\n");
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
