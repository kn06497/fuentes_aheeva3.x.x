package org.apache.jsp.aheevaManager.Resources_005fpages.popup;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.popbuilder.*;

public final class popupdetail_jsp extends org.apache.jasper.runtime.HttpJspBase
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

if (request.getParameter("mn").equals("fillFieldOrTableList")) {
		Menu menu = new Menu();
		out.print(menu.getFieldorTableList(request));
	} else if (request.getParameter("mn").equals("testConnection")) {
		DBConnection DBConnection = new DBConnection();
		out.print(DBConnection.getDBConnection(request));
	} else if (request.getParameter("mn").equals("getListPopUps")) {
		Menu menu = new Menu();
		out.print(menu.getPopUpsList(request));
	} else if (request.getParameter("mn").equals("ckeckPopUniqueId")) {
		Menu menu = new Menu();
		out.print(menu.ckeckPopUniqueId(request));
	}else if (request.getParameter("mn").equals("unloadPopup")) {
		UploadDownload.deleteFile(request.getParameter("path"));
	}
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
