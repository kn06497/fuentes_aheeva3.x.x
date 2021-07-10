<%@ page contentType="text/javascript" language="java" %>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.ressources.*"%>
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
%>

