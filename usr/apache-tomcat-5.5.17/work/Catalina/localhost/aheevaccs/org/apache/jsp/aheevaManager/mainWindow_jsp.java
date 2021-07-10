package org.apache.jsp.aheevaManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import aheevaManager.ressources.*;

public final class mainWindow_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	session.setMaxInactiveInterval(-1);		/* this session should never expire */
	if( request.getParameter("lang") != null )
	{
		String user_number = request.getParameter("lang");
		if( user_number.compareTo("0") == 0 )
			session.setAttribute("USER_LANGUAGE", "ENGLISH");
		else if( user_number.compareTo("1") == 0 )		
			session.setAttribute("USER_LANGUAGE", "FRENCH");
		else if( user_number.compareTo("2") == 0 )
			session.setAttribute("USER_LANGUAGE", "ESPAGNOL");
		else if( user_number.compareTo("3") == 0 )
			session.setAttribute("USER_LANGUAGE", "PORTUGUES");
			
		session.setAttribute("USER_LANGUAGE_NUMBER", request.getParameter("lang"));
	}
	else
	{
		session.setAttribute("USER_LANGUAGE", "ENGLISH");
		session.setAttribute("USER_LANGUAGE_NUMBER", "0");
	}	
	
	if( request.getParameter("user_dbid") != null )
		session.setAttribute("CURRENT_USER_DBID", request.getParameter("user_dbid"));

      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<LINK href=\"Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"JavaScript\" src=\"Resources_pages/jsUtil.js\"> </script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Resources_pages/Browser.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<title>Aheeva</title>\r\n");
      out.write("<META HTTP-EQUIV=\"CACHE-CONTROL\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");

	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	String currentUserData = "SELECT ALLOW_CONFIGURATION_MANAGEMENT, ALLOW_TENANT_VIEW, ALLOW_VIEW_LIVE_STATS FROM cfg_user WHERE dbid = '"+CURRENT_USER_DBID+"'";
	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	pageData.executeFromString(currentUserData);
	Vector <HashMap> currentUserDataResult = pageData.CreateVectorFromBean();	
	pageData.closeConnection();
	
	int left_frame_width 		= 220;	//default values
	int top_frame_width_percent  = 52;	//default values
	
	if( currentUserDataResult.size() == 1 )
	{
		String allow_config 	= (String)currentUserDataResult.elementAt(0).get("ALLOW_CONFIGURATION_MANAGEMENT");
		String allow_tenant 	= (String)currentUserDataResult.elementAt(0).get("ALLOW_TENANT_VIEW");
		String allow_livestat 	= (String)currentUserDataResult.elementAt(0).get("ALLOW_VIEW_LIVE_STATS");
		
		if( allow_config.compareTo("yes") != 0 && allow_tenant.compareTo("yes") != 0 ) /* none of this was allowed */
		{
			if(allow_livestat.compareTo("yes") != 0) /* nothing is allowed here ... Permission denied */
			{
				
      out.write("\r\n");
      out.write("\t\t\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Resources_pages/forbidden.jsp", out, false);
      out.write("\r\n");
      out.write("\t\t\t\t");

				return;			
			}
			
			left_frame_width = 0; 			/* no left frame */
			top_frame_width_percent = 100;  /* no bottom frame */
		}
		else if(allow_livestat.compareTo("yes") != 0)		/* Allow for the menu and bottom frame but not live stats */
		{
			top_frame_width_percent = 0;  /* no top frame */
		}
	}

      out.write("\r\n");
      out.write("<frameset id=\"ColFrameset\" border=\"0\" frameborder=\"no\" framespacing=\"5\" cols=\"");
      out.print(left_frame_width);
      out.write(",*\" >\r\n");
      out.write("\t<frameset id=\"leftSet\" border=\"0\" frameborder=\"no\" framespacing=\"0\" cols=\"5,*\" >\r\n");
      out.write("\t\t<frame src=\"border.html\" name=\"borderleft\" frameborder=\"no\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("\r\n");
      out.write("\t\t<frameset  rows=\"30,*,5\" framespacing=\"0\" frameborder=\"no\" border=\"0\" id=\"MenuRowFrameset\">\r\n");
      out.write("\t\t\t<frame src=\"release.jsp\" name=\"topleft\" frameborder=\"no\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\" target=\"rtop\">\r\n");
      out.write("\t\t\t<frame  src=\"menu.jsp\" name=\"left\" frameborder=\"no\" scrolling=\"yes\" marginwidth=\"0\" marginheight=\"0\" class=\"botleft\" target=\"rbottom\">\r\n");
      out.write("\t\t\t<frame src=\"border.html\" name=\"borderleft2\" frameborder=\"no\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("\t\t</frameset>\r\n");
      out.write("\t</frameset>\r\n");
      out.write("\t<frameset id=\"rightSet\" border=\"0\" frameborder=\"no\" framespacing=\"0\" cols=\"*,5\" >\r\n");
      out.write("\t\r\n");
      out.write("\t\t<frameset id=\"rightrows\" border=\"0\" frameborder=\"no\" framespacing=\"0\" rows=\"5,*,5\" >\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t<frame src=\"border.html\" name=\"borderleft3\" frameborder=\"no\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<frameset id=\"RowFrameset\" border=\"0\" frameborder=\"0\" framespacing=\"5\" rows=\"");
      out.print(top_frame_width_percent);
      out.write('%');
      out.write(',');
      out.print((100-top_frame_width_percent));
      out.write("%\">\r\n");
      out.write("\t\t\t\t<frame src=\"top.jsp\" name=\"rtop\" scrolling=\"no\" target=\"rbottom\">\r\n");
      out.write("\t\t\t\t<frame name=\"rbottom\" target=\"rbottom\" src=\"defaultpage.htm\" class=\"botrightframe\">\r\n");
      out.write("\t\t\t</frameset>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<frame src=\"border.html\" name=\"borderleft4\" frameborder=\"no\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t</frameset>\r\n");
      out.write("\r\n");
      out.write("\t\t<frame src=\"border.html\" name=\"borderright\" frameborder=\"no\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("\t</frameset>\r\n");
      out.write("</frameset>\r\n");
      out.write("\r\n");
      out.write("<!-- \r\n");
      out.write("<frameset  id=\"ColFrameset\"  border=\"0\"  frameborder=\"0\"  framespacing=\"5\"  cols=\"");
      out.print(left_frame_width);
      out.write(",*\" >\r\n");
      out.write("\t<frame name=\"left\" scrolling=\"yes\" target=\"rtop\"  CLASS=\"FrameBorders\"  src=\"menu.jsp\">\r\n");
      out.write("\t<frameset id=\"RowFrameset\"  border=\"0\"  frameborder=\"0\"   framespacing=\"5\"  rows=\"");
      out.print(top_frame_width_percent);
      out.write('%');
      out.write(',');
      out.print((100-top_frame_width_percent));
      out.write("%\">\r\n");
      out.write("\t\t<frame name=\"rtop\" target=\"rbottom\"  CLASS=\"FrameBordersTop\" src=\"top.jsp\" >\r\n");
      out.write("\t\t<frame name=\"rbottom\" target=\"rbottom\"  CLASS=\"FrameBorders\"  src=\"defaultpage.jsp\" >\r\n");
      out.write("\t</frameset>\r\n");
      out.write("</frameset>\r\n");
      out.write("-->\r\n");
      out.write("<noframes></noframes>\r\n");
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
