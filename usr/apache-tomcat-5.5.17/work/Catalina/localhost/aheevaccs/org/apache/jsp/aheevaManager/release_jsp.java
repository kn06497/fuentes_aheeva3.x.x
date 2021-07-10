package org.apache.jsp.aheevaManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.lang.*;
import aheevaManager.ressources.*;

public final class release_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else	
		pageData.setDefaultLanguage("ENGLISH");	
	
	System.out.println("top.jsp "+session.getAttribute("USER_LANGUAGE"));
		
	
		
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	
	String userPrivilegesQuery 			= "select * from cfg_user where dbid='"+CURRENT_USER_DBID+"'";
	String userPreferencesQuery = "SELECT * FROM cfg_user_live_stats_preferences WHERE USER_DBID='"+CURRENT_USER_DBID+"'";
	

	
	
	
	pageData.openConnection();
	pageData.executeFromString(userPrivilegesQuery);
	Vector <HashMap> userPrivilegesDataResult = pageData.CreateVectorFromBean();	
	pageData.executeFromString(userPreferencesQuery);
	Vector <HashMap<String,String>> userPreferences = pageData.CreateVectorFromBean();
	
	
	
		
	

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<title>release number</title>\r\n");
      out.write("<link href=\"Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"lang_browser.js\"></script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write("body {\r\n");
      out.write("\tmargin-left: 0px;\r\n");
      out.write("\tmargin-top: 0px;\r\n");
      out.write("\tmargin-right: 0px;\r\n");
      out.write("\tmargin-bottom: 0px;\r\n");
      out.write("\tbackground-image: url(img/release_bg.gif);\r\n");
      out.write("\tbackground-position: left bottom;\r\n");
      out.write("\tbackground-repeat: no-repeat;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("   html, body, #wrapper2 {\r\n");
      out.write("      height:100%;\r\n");
      out.write("      margin: 0px;\r\n");
      out.write("      padding: 0px;\r\n");
      out.write("      border: none;\r\n");
      out.write("      text-align: left;\r\n");
      out.write("   }\r\n");
      out.write("-->\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("   <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" id=\"wrapper2\">\r\n");
      out.write("      <tr>\r\n");
      out.write("         <td align=\"left\" valign=\"bottom\">\r\n");
      out.write("\t\t <nobr>\r\n");
      out.write("\t\t \t<div align=\"left\" style=\"padding-left:0px\">\r\n");
      out.write("\t\t\t\t<span class=\"vers_name\">Aheeva </span>\r\n");
      out.write("\t\t\t\t<span class=\"vers_numb\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("AHRelease"));
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t</nobr>\r\n");
      out.write("\t\t </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
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
