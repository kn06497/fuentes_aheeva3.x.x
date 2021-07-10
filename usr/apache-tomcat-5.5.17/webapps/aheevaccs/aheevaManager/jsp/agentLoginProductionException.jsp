<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.StringTokenizer"%>
<%@page import ="aheevaManager.wfm.beanAgentLoginProdInfo"%>
<%@page import = "aheevaManager.ressources.*" %>
<jsp:useBean id="beanExceptionReport" scope="request" class="aheevaManager.wfm.beanAgentLoginProdExceptionReport" />
<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<head>
<title>Login and Production time Exception report</title>

<script type="text/javascript" language="javascript" src="../Resources_pages/trim.js"></script>
<script type="text/javascript" language="javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
</head>

<body>
<%
beanManagerData pageDataAgent = new beanManagerData();
pageDataAgent.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDataAgent.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	beanExceptionReport.setStartTime("01:00:00");
	beanExceptionReport.setEndTime("01:00:00");
	beanExceptionReport.setTenantDBID(request.getParameter("tenant_dbid"));
	
	double pct = Double.parseDouble(request.getParameter("percentage"));
	beanExceptionReport.setPercentage(pct);
	
    String reportDate = request.getParameter("reportDate");

	// Formatting the date
	String[] date_array = reportDate.split("/");
	int year = 0, month = 0, day = 0;
	for (int i = 0; i<=date_array.length;i++)
	{
		if (i == 0) month = Integer.parseInt(date_array[i]);
		if (i == 1) day = Integer.parseInt(date_array[i]);
		if (i == 2) year = Integer.parseInt(date_array[i]);
	}
	java.util.Calendar cal = java.util.Calendar.getInstance();
	cal.clear();
	cal.set(year, month-1, day);
	java.util.Date good_date = cal.getTime();
	String formatted_date = java.text.DateFormat.getDateInstance(java.text.DateFormat.LONG).format(good_date);
    
	//Loading data
	java.util.Vector data = new java.util.Vector();
	data.clear();
	
	beanExceptionReport.buildExceptionReport(reportDate);

    long tLoginTime = 0, tProductionTime = 0, tScheduledWorkTime = 0;
    beanAgentLoginProdInfo agentInfo = new beanAgentLoginProdInfo();
%>

<center>
	<font class="reportsID" size="+5">
		<strong><%=pageDataAgent.getWord("Agent login")%> VS <%=pageDataAgent.getWord("Production time exception report")%><br>
		<%=pageDataAgent.getWord("for")%> <%=formatted_date%></strong>
	</font>
</center>
<br><br>

<font class="reportsID" size="+2">
	<%=pageDataAgent.getWord("Agents whose production time is higher than their login time by")%>&nbsp; <%=(int)(beanExceptionReport.percentage * 100) + " %"%>&nbsp; <%=pageDataAgent.getWord("or more")%>
</font>
<table border="1" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse:collapse ">
	<tr class="reportsTab">
		<td align="center"><b><%=pageDataAgent.getWord("Agent ID")%></b></td>
		<td width="125" align="center"><b><%=pageDataAgent.getWord("Agent name")%></b></td>
		<td align="center"><b><%=pageDataAgent.getWord("Campaign")%></b></td>
		<td width="70" align="center"><b><%=pageDataAgent.getWord("First login")%>&nbsp; <%=pageDataAgent.getWord("Time")%></b></td>
		<td width="70" align="center"><b><%=pageDataAgent.getWord("Last Logout")%>&nbsp; <%=pageDataAgent.getWord("Time")%></b></td>
		<td width="70" align="center"><b><%=pageDataAgent.getWord("Total login time")%></b></td>
		<td width="70" align="center"><b><%=pageDataAgent.getWord("Production time")%</b></td>
		<td align="center"><b><%=pageDataAgent.getWord("Integration")%></b></td>
		<td align="center"><b><%=pageDataAgent.getWord("Acknowledged")%></b></td>
		<td align="center"><b><%=pageDataAgent.getWord("Comments")%></b></td>
		<td width="70" align="center"><b><%=pageDataAgent.getWord("Percentage over")%></b></td>
	</tr>
<!-- traverse the array -->
<%
    int j = 0;
	data.clear();
	data = new java.util.Vector();

	data = beanExceptionReport.m_ProdGTLogin;
	java.util.Collections.sort(data);
	for (j = 0; j < data.size(); j++)
	{
		agentInfo = (beanAgentLoginProdInfo)data.elementAt(j);
%>
	
	<tr <%if(j%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");%> >
	<td align="center"><%=agentInfo.agt_id%></td>
	<td align="left" nowrap><%=agentInfo.last_name%>, <%=agentInfo.first_name%></td>
	<td align="center"><%=beanExceptionReport.getAgentGroupName(agentInfo.grp_id)%></td>
	<td align="center"><%=agentInfo.getFirstLoginTime()%></td>
	<td align="center"><%=agentInfo.getLastLogoutTime()%></td>
	<td align="center"><%=agentInfo.getTotalLoginTime()%></td>
	<td align="center"><%=agentInfo.getTotalProductionTime()%></td>
	<td align="center"><%=agentInfo.integration?"Yes":"No"%></td>
	<td align="center"><%=agentInfo.acknowledged?"Yes":"No"%></td>
	<td align="center"><%=agentInfo.comments%></td>
	<td align="center"><%=agentInfo.getPercentageOver()%></td>
  </tr>
<!-- end of array traversal-->
<%
       tLoginTime += agentInfo.totalLoginTime;
	   tProductionTime += agentInfo.totalProductionTime;
	   //tScheduledWorkTime = agentInfo.totalScheduledWorkTime;
      }
%>
<tr>
      <td bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=pageDataAgent.getWord("Total")%></b></font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
     <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=agentInfo.buildReadableTime(tLoginTime)%></b></font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=agentInfo.buildReadableTime(tProductionTime)%></b></font></td>
     <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDEO" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDEO" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
</tr>
</table>
<br><br><br>

<font class="reportsID" size="+2">
	<%=pageDataAgent.getWord("Agents which have login time but no production time")%>
</font>
<table border="1" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse:collapse ">
	<tr class="reportsTab">
		<td align="center"><b><%=pageDataAgent.getWord("Agent ID")%></b></td>
		<td width="125" align="center"><b><%=pageDataAgent.getWord("Agent name")%></b></td>
		<td align="center"><b><%=pageDataAgent.getWord("Campaign")%></b></td>
		<td width="70" align="center"><b><%=pageDataAgent.getWord("First login")%>&nbsp; <%=pageDataAgent.getWord("Time")%></b></td>
		<td width="70" align="center"><b><%=pageDataAgent.getWord("Last Logout")%>&nbsp; <%=pageDataAgent.getWord("Time")%></b></td>
		<td width="70" align="center"><b><%=pageDataAgent.getWord("Total login time")%></b></td>
	</tr>
<%
    j = 0;
	data.clear();
	tLoginTime = 0;
	data = new java.util.Vector();

	data = beanExceptionReport.m_NoProdButLogin;
	java.util.Collections.sort(data);

	for(j = 0; j < data.size(); j++)
	{
		agentInfo = (beanAgentLoginProdInfo)data.elementAt(j);
%>
	<tr <%if(j%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");%> >
		<td align="center"><%=agentInfo.agt_id%></td>
		<td align="center" nowrap><%=agentInfo.last_name%>, <%=agentInfo.first_name%></td>
		<td align="center"><%=beanExceptionReport.getAgentGroupName(agentInfo.grp_id)%></td>
		<td align="center"><%=agentInfo.getFirstLoginTime()%></td>
		<td align="center"><%=agentInfo.getLastLogoutTime()%></td>
		<td align="center"><%=agentInfo.getTotalLoginTime()%></td>
	</tr>
<%
		tLoginTime += agentInfo.totalLoginTime;
	}
%>
<tr>
     <td bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=pageDataAgent.getWord("Total")%></b></font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=agentInfo.buildReadableTime(tLoginTime)%></b></font></td>
</tr>
</table>
<br><br><br>
<!------------------------------>
<font class="reportsID" size="+2">
	<%=pageDataAgent.getWord("Agents with days not in integration between two integration days")%>
</font>
<table border="1" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse:collapse ">
	<tr class="reportsTab">
		<td align="center"><b><%=pageDataAgent.getWord("Agent ID")%></b></td>
		<td width="125" align="center"><b><%=pageDataAgent.getWord("Agent name")%></b></td>
		<td align="center"><b><%=pageDataAgent.getWord("Campaign")%></b></td>
		<td width="100" align="center"><b><%=pageDataAgent.getWord("First day integration")%></b></td>
		<td width="100" align="center"><b><%=pageDataAgent.getWord("Last day integration")%></b></td>
		<td width="100" align="center"><b><%=pageDataAgent.getWord("Days not in Integration")%></b></td>
	</tr>
<%
    j = 0;
	data.clear();
	data = new java.util.Vector();
	data = beanExceptionReport.m_IntegrationValidate;
	String old_login = "", login = "";

	for(j = 0; j < data.size(); j++)
	{
		agentInfo = (beanAgentLoginProdInfo)data.elementAt(j);
		old_login = (j == 0) ? agentInfo.agt_id : login;
		login = agentInfo.agt_id;
		if(!old_login.equals(login))
		{
		%>
			<tr>
				<td colspan="6">&nbsp;</td>
			</tr>
		<%
		}
%>
	<tr <%if(j%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");%> >
		<td align="center"><%=agentInfo.agt_id%></td>
		<td align="center" nowrap><%=agentInfo.last_name%>, <%=agentInfo.first_name%></td>
		<td align="center"><%=beanExceptionReport.getAgentGroupName(agentInfo.grp_id)%></td>
		<td align="center"><%=agentInfo.minIntegrationDate%></td>
		<td align="center"><%=agentInfo.maxIntegrationDate%></td>
		<td align="center"><%=agentInfo.event_date%></td>
	</tr>
<%	}
%>
<!--<tr>
     <td bgcolor="#FDFDE0" align="center"><font color="#000000"><b> TOTAL </b></font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
	 <td bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=agentInfo.buildReadableTime(tLoginTime)%></b></font></td>
</tr>-->
</table>

</body>
</html>
<%
pageDataAgent.closeConnection();
%>