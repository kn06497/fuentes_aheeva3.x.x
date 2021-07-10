package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.lang.*;
import aheevaManager.ressources.*;

public final class user_005fmanagement_005froles_js_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/javascript");
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

	
	
	if( request.getParameter("actionType") != null )
	{
		String action_type = (String) request.getParameter("actionType");
		if( action_type.compareTo("SAVE_ROLE") == 0 )
		{
			String role_name = "";
			Vector allow_privs = new Vector();
			Enumeration paramNames = request.getParameterNames();
			while(paramNames.hasMoreElements())
			{
				String param = (String)paramNames.nextElement();
				String value = (String)request.getParameter(param);
				if( param.compareTo("role_name") == 0 )
					role_name = value;
				else if( param.indexOf("ALLOW_") == 0 )//this is a privlg.
					allow_privs.addElement(param);				
			}
			
			/* make queries */
			beanManagerData pageData = new beanManagerData();
			pageData.setDebug(true);
			pageData.openConnection();
			String sql_query = "DELETE FROM cfg_predefined_user_roles WHERE ROLE_NAME = '"+role_name+"'";
			pageData.executeModification(sql_query);
			String colNames = "(ROLE_NAME";
			String valueList = "('"+role_name+"'";
			int nbSelPriv = allow_privs.size();//number of selected privlgs
			
			for( int i = 0; i < allow_privs.size(); i++ )
			{
				colNames += "," +(String)allow_privs.elementAt(i) ;	
				valueList += ",true";		
			}
			sql_query = "INSERT INTO cfg_predefined_user_roles " +colNames+") VALUES "+valueList+")";
			System.out.println(sql_query); 
			java.sql.PreparedStatement ps = pageData.buildPreparedStatement(sql_query);
			ps.executeUpdate();
						
			pageData.closeConnection();			
		}
		else if( action_type.compareTo("REMOVE_ROLE") == 0 )
		{
			String role_name = (String) request.getParameter("role_name");
			beanManagerData pageData = new beanManagerData();
			pageData.setDebug(true);
			pageData.openConnection();
			String sql_query = "DELETE FROM cfg_predefined_user_roles WHERE ROLE_NAME = '"+role_name+"'";
			System.out.println(sql_query ); 
			pageData.executeModification(sql_query);
			pageData.closeConnection();			
		}
	}
	else
		System.out.println("actionType is null");

      out.write("\r\n");
      out.write("\r\n");
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
