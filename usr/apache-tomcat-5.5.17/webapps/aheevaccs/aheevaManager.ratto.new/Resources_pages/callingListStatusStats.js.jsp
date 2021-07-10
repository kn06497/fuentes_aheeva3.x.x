<%@ page contentType="text/javascript" language="java" %>
<%@ page language="java" import="aheevaManager.ressources.beanCallingListAfterQueries, aheevaManager.ressources.beanLoadCallingList, java.util.*" %>

<%
	System.out.println("CallingListStatus: Getting Stats");	
	if(request.getParameter("actionType") != null)
	{		
		if(request.getParameter("actionType").compareTo("GetStatistics") == 0)
		{					
			if( session.getAttribute("queryThread") != null )
			{				
				beanCallingListAfterQueries beanQuery = (beanCallingListAfterQueries) session.getAttribute("beanAfterQueries");
				out.write("tableOfQueriesStatus[\"DAILY HOURS\"] = \""+beanQuery.getStatus("DAILY HOURS")+"\"; ");
				out.write("tableOfQueriesStatus[\"EXTRA DATA\"] = \""+beanQuery.getStatus("EXTRA DATA")+"\"; ");
				out.write("tableOfQueriesStatus[\"NON_NUMERIC_PHONES\"] = \""+beanQuery.getStatus("NON_NUMERIC_PHONES")+"\"; ");
				out.write("tableOfQueriesStatus[\"PREFIX_RULES\"] = \""+beanQuery.getStatus("PREFIX_RULES")+"\"; ");
				out.write("tableOfQueriesStatus[\"TIME_ZONE_SETUP\"] = \""+beanQuery.getStatus("TIME_ZONE_SETUP")+"\"; ");
				out.write("tableOfQueriesMessages[\"DAILY HOURS\"] = \""+beanQuery.getStatusMessage("DAILY HOURS")+"\"; ");
				out.write("tableOfQueriesMessages[\"EXTRA DATA\"] = \""+beanQuery.getStatusMessage("EXTRA DATA")+"\"; ");
				out.write("tableOfQueriesMessages[\"NON_NUMERIC_PHONES\"] = \""+beanQuery.getStatusMessage("NON_NUMERIC_PHONES")+"\"; ");
				out.write("tableOfQueriesMessages[\"PREFIX_RULES\"] = \""+beanQuery.getStatusMessage("PREFIX_RULES")+"\"; ");
				out.write("tableOfQueriesMessages[\"TIME_ZONE_SETUP\"] = \""+beanQuery.getStatusMessage("TIME_ZONE_SETUP")+"\"; ");				
				out.flush();								
			}
			else
			{
				System.out.println("CallingListStatus: queryThread is not in session");				
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
