<%@ page contentType="text/javascript" language="java" %>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="com.mysql.jdbc.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="Manager.ressources.*"%>
<%
	
	
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
				else if( param.indexOf("ALLOW_") == 0 )
					allow_privs.addElement(param);				
			}
			
			/* make queries */
			beanManagerData pageData = new beanManagerData();
			pageData.setDebug(true);
			pageData.openConnection();
			String sql_query = "DELETE FROM cfg_predefined_user_roles WHERE ROLE_NAME = '"+role_name+"'";
			pageData.executeModification(sql_query);
			for( int i = 0; i < allow_privs.size(); i++ )
			{
				sql_query = "INSERT INTO cfg_predefined_user_roles (ROLE_NAME, PRIVILEGE_NAME) VALUES ('"+role_name+"', '"+(String)allow_privs.elementAt(i)+"')";
				pageData.executeModification(sql_query);				
			}
			pageData.closeConnection();			
		}
		else if( action_type.compareTo("REMOVE_ROLE") == 0 )
		{
			String role_name = (String) request.getParameter("role_name");
			beanManagerData pageData = new beanManagerData();
			pageData.setDebug(true);
			pageData.openConnection();
			String sql_query = "DELETE FROM cfg_predefined_user_roles WHERE ROLE_NAME = '"+role_name+"'";
			pageData.executeModification(sql_query);
			pageData.closeConnection();			
		}
	}
%>

