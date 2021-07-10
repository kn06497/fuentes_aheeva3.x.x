<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="aheevaManager.ressources.*"%>
<%@ page import="java.util.StringTokenizer"%>
<% 

   /*
   file name: mopRowsManagement.jsp
   description: Used to run operations on the MOP loginVsProduction Time report rows.
   author: Serge Poueme
   Date: 2007/02/01
   */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
<%
	String item_id = request.getParameter("item_id");
	String operation = request.getParameter("operation");
	String date = request.getParameter("startDate");
	
	if(operation!=null && item_id!=null && date!=null)
	{
		
		System.out.println("Have received management request of type "+operation+" for item_id "+item_id);
		beanManagerData requestBroker = new beanManagerData();
		requestBroker.setDebug(true);
		requestBroker.openConnection();
		String query = "";
		switch(Integer.parseInt(operation))
		{
			case 1:
					System.out.println("Splitting string to retrieve agent_id");
					StringTokenizer item= new StringTokenizer(item_id,"_");
					String agent_id=null;
					String group_id=null;
					String activity_type=null;
					date=date.trim();
					if(item.hasMoreTokens())
					{
						agent_id=item.nextToken();
						System.out.println("Agent_id is "+agent_id);
						
	
						if(item.hasMoreTokens())
						{
							group_id=item.nextToken();	
							System.out.println("Agent group id is "+group_id);
							
							
							if(item.hasMoreTokens())
							{	
								activity_type=item.nextToken();
								System.out.println("Activity is "+activity_type);
							}
							
						}
					}
					
					if(agent_id!=null && activity_type!=null&&group_id!=null)
					{
						query="DELETE FROM wfm_production_time where agent_id='"+agent_id+"' and date_format(event_date,'%m/%d/%Y')='"+date+"' and activity_type='"+activity_type+"' and grp_id='"+group_id+"'";
						requestBroker.executeModification(query);
						System.out.println("Row removed in wfm_production_time for agent "+agent_id);
						requestBroker.closeConnection();
					}
					else
					{
						System.out.println("Nothing to do, no parameters received to proceed on operation");
					}
					break;
			default:
					
		}
	}
	else
	{
		System.out.println("Nothing to do, bad parameters received to proceed on operation");
	}
%>
<body>
</body>
</html>
