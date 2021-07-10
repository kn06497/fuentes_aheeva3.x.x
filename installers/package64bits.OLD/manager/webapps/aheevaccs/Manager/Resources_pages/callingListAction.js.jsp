<%@ page contentType="text/javascript" language="java" %>
<%@ page language="java" import="Manager.ressources.beanLoadCallingList, java.util.*" %>

<%
	if(request.getParameter("actionType") != null)
	{		
		if(request.getParameter("actionType").compareTo("SaveThisListSettings") == 0)
		{
			if( session.getAttribute("beanCList") != null )
			{
				beanLoadCallingList thisList = (beanLoadCallingList) session.getAttribute("beanCList");				
				System.out.println("Will save Callinglist settings: "+thisList.callingListToXML());
				if( request.getParameter("formatName") != null )
				{
					thisList.saveSettings((String)request.getParameter("formatName"));
				}
				else
				{
					System.out.println("CallingListStatus: formatName is not in request");
				}
			}
			else
			{
				System.out.println("CallingListStatus: beanCList is not in session");
			}
		}
		else
		{
			System.out.println("CallingListStatus: Unsupported Action");	
		}
	}	
	else
	{
		System.out.println("CallingListStatus: actionType is null");
	}
%>
