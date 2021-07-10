<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.util.*"%>
<%@page import ="Manager.wfm.*"%>
<jsp:useBean id="beanAgentLoginProdReport" scope="request" class="Manager.wfm.beanAgentLoginProdReport" />


<body>


<%


	Vector eventVector = new Vector();

	String agentId = request.getParameter("agentId");
	String reportDate = request.getParameter("curDate");
        String []date = null;
        date = reportDate.split("/");
        reportDate = date[2] + "-" + date[0] + "-" + date[1];

    // build events details for this agent
%>
<%
try
{
       eventVector = beanAgentLoginProdReport.getEvents(agentId, reportDate);
%>
<br>
			<table width="750" border="1" align="left">
			  <tr bgcolor="#66CCCC">
				<td width="750" align="center" colspan="5"><b> <script>document.write(MultiArray["Events"][lang])</script> &nbsp;<script>document.write(MultiArray["Details"][lang])</script></b></td>
			  </tr>
			  <tr>
				<td height="15" align="center" colspan="5"></td>
			  </tr>
				<tr bgcolor="#CCFF99">
					<td width="150" align="center"><strong><script>document.write(MultiArray["ID"][lang])</script> </strong></td>
					<td width="150" align="center"><strong><script>document.write(MultiArray["Events"][lang])</script></strong> </td>
					<td width="150" align="center"><strong><script>document.write(MultiArray["Details"][lang])</script></strong> </td>
					<td width="150" align="center"><strong><script>document.write(MultiArray["Date and Time"][lang])</script></strong> </td>
					<td width="150" align="center"><strong><script>document.write(MultiArray["Duration"][lang])</script></strong> </td>
				</tr>
			<%
				//Prendre le premier élément et l'afficher
				int i = 0;
				//beanAgentLoginProdReport.events lastEvent;
				beanAgentLoginProdReport.events nextEvent;
				SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date nextTime;
				Date curTime;
				long lnextTime;
				long lcurTime;
				long duree;
				beanAgentLoginProdReport.events curEvent = (beanAgentLoginProdReport.events) eventVector.elementAt(i);
				i++;
				//lastEvent = curEvent;
				while (i < eventVector.size())
				{
					nextEvent = (beanAgentLoginProdReport.events) eventVector.elementAt(i);
					if ((curEvent.event.compareTo("LOGIN") == 0) && ((nextEvent.event.compareTo("LOGOUT") == 0) || (nextEvent.event.compareTo("NOT_READY") == 0)))
					{
						nextTime = bartDateFormat.parse(nextEvent.event_time);
						curTime = bartDateFormat.parse(curEvent.event_time);
						lnextTime = nextTime.getTime();
						lcurTime = curTime.getTime();
						duree = (lnextTime - lcurTime)/1000;
			%>
						<tr>
							<td width="150" align="center"><%=curEvent.id%> </td>
							<td width="150" align="center"><%=curEvent.event%> </td>
							<td width="150" align="center"><%=curEvent.detail%> </td>
							<td width="150" align="center"><%=curEvent.event_time%> </td>
							<td width="150" align="center"><%=beanAgentLoginProdReport.buildReadableTime(duree)%> </td>
						</tr>
			<%
						curEvent = nextEvent;
					}// fin curEvent
//2e cas
					else if ((curEvent.event.compareTo("NOT_READY") == 0) && ((nextEvent.event.compareTo("LOGOUT") == 0) || (nextEvent.event.compareTo("WAITING_FOR_NEXT_CALL") == 0) || (nextEvent.event.compareTo("NOT_READY") == 0)))
					{
						nextTime = bartDateFormat.parse(nextEvent.event_time);
						curTime = bartDateFormat.parse(curEvent.event_time);
						lnextTime = nextTime.getTime();
						lcurTime = curTime.getTime();
						duree = (lnextTime - lcurTime)/1000;
							
			%>
						<tr>
							<td width="150" align="center"><%=curEvent.id%> </td>
							<td width="150" align="center"><%=curEvent.event%> </td>
							<td width="150" align="center"><%=curEvent.detail%> </td>
							<td width="150" align="center"><%=curEvent.event_time%> </td>
							<td width="150" align="center"><%=beanAgentLoginProdReport.buildReadableTime(duree)%> </td>
						</tr>
			<%
						curEvent = nextEvent;
					}// fin curEvent
//3e cas
					else if ((curEvent.event.compareTo("WAITING_FOR_NEXT_CALL") == 0) && ((nextEvent.event.compareTo("LOGOUT") == 0) || (nextEvent.event.compareTo("NOT_READY") == 0)))
					{
						nextTime = bartDateFormat.parse(nextEvent.event_time);
						curTime = bartDateFormat.parse(curEvent.event_time);
						lnextTime = nextTime.getTime();
						lcurTime = curTime.getTime();
						duree = (lnextTime - lcurTime)/1000;
							
			%>
						<tr>
							<td width="150" align="center"><%=curEvent.id%> </td>
							<td width="150" align="center"><%=curEvent.event%> </td>
							<td width="150" align="center"><%=curEvent.detail%> </td>
							<td width="150" align="center"><%=curEvent.event_time%> </td>
							<td width="150" align="center"><%=beanAgentLoginProdReport.buildReadableTime(duree)%> </td>
						</tr>
			<%
						curEvent = nextEvent;
					}// fin curEvent
//4e cas				 
					else if (curEvent.event.compareTo("LOGOUT") == 0) //&& ((nextEvent.event.compareTo("LOGIN") == 0)))
					{
						nextTime = bartDateFormat.parse(nextEvent.event_time);
						curTime = bartDateFormat.parse(curEvent.event_time);
						lnextTime = nextTime.getTime();
						lcurTime = curTime.getTime();
						duree = (lnextTime - lcurTime)/1000;
							
			%>
						<tr>
							<td width="150" align="center"><%=curEvent.id%> </td>
							<td width="150" align="center"><%=curEvent.event%> </td>
							<td width="150" align="center"><%=curEvent.detail%> </td>
							<td width="150" align="center"><%=curEvent.event_time%> </td>
							<td width="150" align="center"><%=beanAgentLoginProdReport.buildReadableTime(duree)%> </td>
						</tr>
			<%
						curEvent = nextEvent;
					}// fin curEvent
					
					i++;
				}// fin while
			%>	
						<tr>
							<td width="150" align="center"><%=curEvent.id%> </td>
							<td width="150" align="center"><%=curEvent.event%> </td>
							<td width="150" align="center"><%=curEvent.detail%> </td>
							<td width="150" align="center"><%=curEvent.event_time%> </td>
							<td width="150" align="center"><%%> </td>
						</tr>
				
<%										
}
catch(Exception e)
{


}
%>
</body>

</html>

