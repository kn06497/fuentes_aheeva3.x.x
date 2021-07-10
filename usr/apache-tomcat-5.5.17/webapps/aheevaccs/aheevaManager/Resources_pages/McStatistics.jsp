<%@page contentType="text/html"%>
<%@page language="java"%>
<%@page import="java.util.*"%>
<%@page import="aheevaManager.ressources.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%
	beanManagerData pageData = new beanManagerData();
	if (session.getAttribute("USER_LANGUAGE") != null)
		pageData.setDefaultLanguage((String) session.getAttribute("USER_LANGUAGE"));

	String currentUserDbid = (String) session.getAttribute("CURRENT_USER_DBID");
	int tenant_dbid = -1;
	try{
		tenant_dbid = Integer.parseInt(request.getParameter("tenant_dbid"));
	}catch(NumberFormatException e){
		e.printStackTrace();
	}

%>


<html>
<head>

<script language=JavaScript src="jsUtil.js"></script>
<script language="javascript" type="text/javascript"
	src="../lang_browser.js"></script>
<script language=javascript src="Browser.js" type=text/javascript></script>
<script language=javascript src="AnchorPosition.js" type=text/javascript></script>
<script language=javascript src="ColorPicker2.js" type=text/javascript></script>
<script language=javascript src="PopupWindow.js" type=text/javascript></script>
<script language="javascript" type="text/javascript"
	src="alert_tabpane.js"></script>

<title>addStatistics</title>
<LINK href="style.css" rel="stylesheet" type="text/css">
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet"
	href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet"
	href="style_2.css" />
<LINK href="livestats.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page
	{
	height: 100px;
}

html,body { /*	background:	ThreeDFace; */
	
}

form {
	margin: 0;
	padding: 0;
}

/* over ride styles from webfxlayout */
body {
	margin: 10px;
	width: auto;
	height: auto;
}

.dynamic-tab-pane-control h2 {
	text-align: center;
	width: auto;
}

.dynamic-tab-pane-control h2 a {
	display: inline;
	width: auto;
}

.dynamic-tab-pane-control a:hover {
	background: transparent;
}

table.msg{
	background-color: #80FF80;
	border-color: black;
	border-width: 1px;
	border-style: dashed;
}
</style>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>



<%
	pageData.openConnection();
	ResultSet rs;
	String m_name = "";
	boolean m_state = false;
	String m_color = "#000000";
	String m_time = "";
	int m_agentGroups = -1;
	String m_queueName = "";
	boolean m_aht_group = false;
	boolean m_aht_agent = false;
	boolean m_ncr_group = false;
	boolean m_ncr_agent = false;
	boolean m_sph_group = false;
	boolean m_sph_agent = false;
	boolean m_pro_rat_group = false;
	boolean m_pro_rat_agent = false;
	boolean m_busy_fact_group = false;
	boolean m_busy_fact_agent = false;
	boolean m_login_time_agent = false;
	boolean m_total_calls_group = false;
	boolean m_total_calls_agent = false;
	boolean m_waiting_calls_group = false;
	boolean m_abandoned_calls_group = false;

	boolean m_averageWaitingTime = false;
	boolean m_longestWaitingCall = false;
	boolean error = false;
	String errorMsg = "";

	int dbid = -1;
	String sqlQuery = new String();
	int j = 0;

	if(request.getParameter("dbid") != null){
		try{
			dbid = Integer.parseInt(request.getParameter("dbid"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
	}
	
	if(dbid != -1 && request.getParameter("delete") != null && request.getParameter("delete").compareTo("1") == 0){
		pageData.executeModification("DELETE FROM cfg_mc_starphone_statistic WHERE DBID=" + dbid);
		%>
		<script>
		appletObj.sendInfo("197,<%= dbid %>");
		appletObj.fReloadMenu = true;
		// refresh the current page
		document.location = "../defaultpage.htm";
		</script>
		</html>
		<%
		return;
	}
	
	if (request.getParameter("statisticName") != null) {
		m_name = request.getParameter("statisticName").trim();
		try{
			m_agentGroups = Integer.parseInt(request.getParameter("assigneGroups"));
		}catch(NumberFormatException e){
			m_agentGroups = -1;
		}
		if (request.getParameter("ahtGroup") != null)m_aht_group = true;
		if (request.getParameter("ahtAgent") != null)	m_aht_agent = true;
		if (request.getParameter("netConvRateGroup") != null)m_ncr_group = true;
		if (request.getParameter("netConvRateAgent") != null)m_ncr_agent = true;
		if (request.getParameter("salesPerHourGroup") != null)m_sph_group = true;
		if (request.getParameter("salesPerHourAgent") != null)m_sph_agent = true;
		if (request.getParameter("productRatioGroup") != null)m_pro_rat_group = true;
		if (request.getParameter("productRatioAgent") != null)m_pro_rat_agent = true;
		if (request.getParameter("busyFactorGroup") != null)m_busy_fact_group = true;
		if (request.getParameter("busyFactorAgent") != null)m_busy_fact_agent = true;
		if (request.getParameter("loginTimeAgent") != null)m_login_time_agent = true;
		if (request.getParameter("totalCallsGroup") != null)m_total_calls_group = true;
		if (request.getParameter("totalCallsAgent") != null)m_total_calls_agent = true;
		if (request.getParameter("waitingCallsGroup") != null)m_waiting_calls_group = true;
		if (request.getParameter("abandonedCallsGroup") != null)m_abandoned_calls_group = true;
		if (request.getParameter("averageWaitingTime") != null)	m_averageWaitingTime = true;
		if (request.getParameter("longestWaitingCall") != null)	m_longestWaitingCall = true;
		if (request.getParameter("queue") != null)	m_queueName = request.getParameter("queue");
		m_time = request.getParameter("statisticTime");
		m_color = request.getParameter("statisticColor2");
		if (request.getParameter("statisticState") != null)m_state = true;
		//verifier si ce nom n'existe pas dans la base de donnee

		if (!pageData.nameAvailable(m_name, dbid, "cfg_mc_starphone_statistic")) {
			error = true;
			errorMsg += "-"+ pageData.getWord("This name already exists")+ "\\n";
		} else if (m_name.length() == 0) {
			error = true;
			errorMsg += "-"+ pageData.getWord("You must define a name") + "\\n";
		}

		if (m_agentGroups < 1) {
			error = true;
			errorMsg += "-"+ pageData.getWord("You must select an agent group") + "\\n";
		}

		if ((m_waiting_calls_group || m_abandoned_calls_group
		|| m_averageWaitingTime || m_longestWaitingCall)
		&& m_queueName.length() == 0) {
			error = true;
			errorMsg += "-"+ pageData.getWord("You must select a queue") + "\\n";
		}
		
		if(!(m_aht_group || m_aht_agent || m_ncr_group || m_ncr_agent || m_sph_group || m_sph_agent || m_pro_rat_group ||
			m_pro_rat_agent || m_busy_fact_group || m_busy_fact_agent || m_login_time_agent || m_total_calls_group ||
			m_total_calls_agent || m_waiting_calls_group || m_abandoned_calls_group || m_averageWaitingTime ||
			m_longestWaitingCall)){
			error = true;
			errorMsg += "-"+ pageData.getWord("You must select at least one statistic") + "\\n";
		}	

		if (!error){
			PreparedStatement ps;
			boolean update = false;
			if(dbid == -1){
				ps = pageData.buildPreparedStatement("INSERT INTO cfg_mc_starphone_statistic " +
					"(NAME,TENANT_DBID,STATE,BCAST_PERIOD,COLOR,AHT_GROUP, " + //1-6
					"AHT_AGENT, NCR_GROUP,NCR_AGENT,SPH_GROUP,SPH_AGENT,PRO_RAT_GROUP,PRO_RAT_AGENT,BUSY_FACT_GROUP, " + //7-14
					"BUSY_FACT_AGENT, LOGIN_TIME_AGENT,TOTAL_CALLS_GROUP,TOTAL_CALLS_AGENT,WAITING_CALLS, " + //15-19
					"ABANDONED_CALLS, AVERAGE_WAITING_TIME, LONGEST_WAITING_CALL, QUEUE_NAME, GRP_DBID) VALUES( " + //20-24
					" ?, ?, ?, ?, ?, ?, " + //1-6
					" ?, ?, ?, ?, ?, ?, ?, ?, " + //7-14
					" ?, ?, ?, ?, ?, " + //15-19
					" ?, ?, ?, ?, ? )"); //20-24
			}else{
				update = true;
				ps = pageData.buildPreparedStatement("UPDATE cfg_mc_starphone_statistic SET " +
					"NAME=?, TENANT_DBID=?,STATE=?,BCAST_PERIOD=?,COLOR=?,AHT_GROUP=?, " + //1-6
					"AHT_AGENT=?, NCR_GROUP=?,NCR_AGENT=?,SPH_GROUP=?,SPH_AGENT=?,PRO_RAT_GROUP=?,PRO_RAT_AGENT=?, " + //7-13
					"BUSY_FACT_GROUP=?, BUSY_FACT_AGENT=?, LOGIN_TIME_AGENT=?,TOTAL_CALLS_GROUP=?,TOTAL_CALLS_AGENT=?, " + //14-18
					"WAITING_CALLS=?, ABANDONED_CALLS=?, AVERAGE_WAITING_TIME=?, LONGEST_WAITING_CALL=?, " + //19-22
					"QUEUE_NAME=?, GRP_DBID=? " + //23-24
					"WHERE DBID=?");//25
			}
			ps.setString(1, m_name);
			ps.setInt(2, tenant_dbid);
			ps.setBoolean(3, m_state);
			ps.setString(4, m_time);
			ps.setString(5, m_color);
			ps.setBoolean(6, m_aht_group);
			ps.setBoolean(7, m_aht_agent);
			ps.setBoolean(8, m_ncr_group);
			ps.setBoolean(9, m_ncr_agent);
			ps.setBoolean(10, m_sph_group);
			ps.setBoolean(11, m_sph_agent);
			ps.setBoolean(12, m_pro_rat_group);
			ps.setBoolean(13, m_pro_rat_agent);
			ps.setBoolean(14, m_busy_fact_group);
			ps.setBoolean(15, m_busy_fact_agent);
			ps.setBoolean(16, m_login_time_agent);
			ps.setBoolean(17, m_total_calls_group);
			ps.setBoolean(18, m_total_calls_agent);
			ps.setBoolean(19, m_waiting_calls_group);
			ps.setBoolean(20, m_abandoned_calls_group);
			ps.setBoolean(21, m_averageWaitingTime);
			ps.setBoolean(22, m_longestWaitingCall);
			ps.setString(23, m_queueName);
			ps.setInt(24, m_agentGroups);
			if(dbid > 0) ps.setInt(25, dbid);
			ps.execute();
			
			ps = pageData.buildPreparedStatement("select dbid from cfg_mc_starphone_statistic where tenant_dbid=? and name=?");
			ps.setInt(1, tenant_dbid);
			ps.setString(2, m_name);
			ps.execute();
			rs = ps.getResultSet();
			if (rs.next() && (dbid = rs.getInt(1)) != -1) {	
				%><script type='text/javascript'>
				appletObj.fReloadMenu = true;
				appletObj.sendInfo("197,<%= dbid %>");
				document.location='?tenant_dbid=<%= tenant_dbid %>&dbid=<%= dbid %>&update=<%= update %>';
				</script>
<%
			} else {
		//Error
%>
<script type='text/javascript'>
			alert("<%= pageData.getWord("An unknown database error occurred while saving your entry")%>");
			</script>
<%
			}
		} else {
%>
<script language="javascript" type="text/javascript">
		alert('<%= errorMsg %>');
		</script>
<%
		}
	}
	if(dbid == -1)m_state = true;

	if (request.getParameter("dbid") != null && request.getParameter("statisticName") == null) {
		rs = pageData.executeFromString("SELECT STATE, BCAST_PERIOD, COLOR, AHT_GROUP, AHT_AGENT, NCR_GROUP, NCR_AGENT, SPH_GROUP, "
				+ "SPH_AGENT, PRO_RAT_GROUP, PRO_RAT_AGENT, BUSY_FACT_GROUP, BUSY_FACT_AGENT, LOGIN_TIME_AGENT, "
				+ "TOTAL_CALLS_GROUP, TOTAL_CALLS_AGENT, WAITING_CALLS, ABANDONED_CALLS, QUEUE_NAME, "
				+ " LONGEST_WAITING_CALL, AVERAGE_WAITING_TIME, NAME, GRP_DBID FROM cfg_mc_starphone_statistic WHERE "
				+ "DBID=" + request.getParameter("dbid"));
		try {
			if (rs.next()) {
				m_name = rs.getString("NAME");
				m_agentGroups = rs.getInt("GRP_DBID");
		
				if (rs.getBoolean("AHT_GROUP")) m_aht_group = true;
				if (rs.getBoolean("AHT_AGENT")) m_aht_agent = true;
				if (rs.getBoolean("NCR_GROUP")) m_ncr_group = true;
				if (rs.getBoolean("NCR_AGENT")) m_ncr_agent = true;
				if (rs.getBoolean("SPH_GROUP")) m_sph_group = true;
				if (rs.getBoolean("SPH_AGENT")) m_sph_agent = true;
				if (rs.getBoolean("PRO_RAT_GROUP")) m_pro_rat_group = true;
				if (rs.getBoolean("PRO_RAT_AGENT")) m_pro_rat_agent = true;
				if (rs.getBoolean("BUSY_FACT_GROUP")) m_busy_fact_group = true;
				if (rs.getBoolean("BUSY_FACT_AGENT")) m_busy_fact_agent = true;
				if (rs.getBoolean("LOGIN_TIME_AGENT")) m_login_time_agent = true;
				if (rs.getBoolean("TOTAL_CALLS_GROUP")) m_total_calls_group = true;
				if (rs.getBoolean("TOTAL_CALLS_AGENT")) m_total_calls_agent = true;
				if (rs.getBoolean("WAITING_CALLS")) m_waiting_calls_group = true;
				if (rs.getBoolean("ABANDONED_CALLS")) m_abandoned_calls_group = true;
				if (rs.getBoolean("AVERAGE_WAITING_TIME")) m_averageWaitingTime = true;
				if (rs.getBoolean("LONGEST_WAITING_CALL")) m_longestWaitingCall = true;
				m_queueName = rs.getString("QUEUE_NAME");
				m_time = rs.getString("BCAST_PERIOD");
				m_color = rs.getString("COLOR");
				if (rs.getBoolean("STATE")) m_state = true;
			}else{
				%><script language="javascript">
				alert("<%= pageData.getWord("No data was retrieved")%>");
				</script>
				<%
			}
		} catch (SQLException e) {
			e.printStackTrace();
%><script language="javascript">
		alert("<%= pageData.getWord("Unknown SQL error while loading the data")%>");
		</script>
<%
	}
	}
%>
<script language="javascript" type="text/javascript">
var tenant_dbid =<%out.write((String)"'"+tenant_dbid + "'");%>;
function pickColor(color) 
{
	document.getElementById('statisticColor').style.backgroundColor = color;
	document.getElementById('statisticColor2').value = color;
}



/**
 * Enables or disables the queue select box 
 */ 	
function checkQueue(){
	if(document.getElementById('waitingCallsGroup').checked || 
			document.getElementById('abandonedCallsGroup').checked ||
			document.getElementById('averageWaitingTime').checked ||
			document.getElementById('longestWaitingCall').checked){
		document.getElementById('queueSelect').disabled = false;
	} else{
		document.getElementById('queueSelect').disabled = true;
		document.getElementById('queueSelect').selectedIndex = 0;
	}
}

/***********************************************************************
************************************************************************/

function getAssignedAgentGroups(){
	return document.getElementById('assigneGroups').options.value;
}

function checkDelete(){
	if(document.getElementById('delete').value == 1){
		if(<%= dbid %> > -1){
			var answer = confirm('<%= pageData.getWord("Are you sure you wish to delete this Statistic?")%>');
			if(!answer){
				document.getElementById('delete').value = 0;
				return false;
			}
		}else{
			alert("DBID error on delete prompt.");
			return false;
		}
	}
	return true;
}

function setDelete(){
	document.getElementById('delete').value = 1;
}


/***********************************************************************
************************************************************************/
</script>
</head>
<body class="stat_body">
<div class="tab-pane" id="tabPane1"><script type="text/javascript">
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	var cp = new ColorPicker('window');
</script>
<div class="tab-page" id="pageStarPhone">
<h2 class="tab"><%= pageData.getWord("SoftPhone")%></h2>
<script type="text/javascript">tp1.addTabPage( document.getElementById( "pageStarPhone" ) );</script>
<%
if(request.getParameter("update") != null  && !error){
	%>
	<table class="msg">
	<tr><td>
	<%
	if(request.getParameter("update").compareTo("true") == 0){
		out.write(pageData.getWord("Update succeeded"));
	}else{
		out.write(pageData.getWord("Creation succeeded"));
	}
	%></td></tr></table>
	<br/>
	<%
}
%>
<fieldset><legend><%=pageData.getWord("Add statistic for softPhone")%></legend>
<form name="MCStats" method="post" onsubmit='return checkDelete();'">
<table>
	<tr height="25">
		<td><%=pageData.getWord("Statistic name")%></td>
		<td><input id="statisticName" type="text" name="statisticName"
			value="<%= pageData.protectHTMLString(m_name) %>" /></td>
	</tr>
	<tr>
		&nbsp;
	</tr>
	<table>
		<tr>
			<td align="center"><%= pageData.getWord("Group")%>
			<select id="assigneGroups"
				style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px"
				name="assigneGroups">
				<option value='-1'></option>
				<%
					rs = pageData.executeFromString("select name, dbid from cfg_agent_group where tenant_dbid='"
													+ tenant_dbid + "' and state='1' order by name");
					try {
						while (rs.next()) {
				%>
				<option value="<%=rs.getInt("dbid")%>" <% if(m_agentGroups == rs.getInt("dbid")) out.print("selected='selected'"); %>><%=pageData.protectHTMLString(rs.getString("name"))%></option>
				<%
						}
					} catch (SQLException e) {
				%>
				<script type="text/javascript">
					alert("<%= pageData.getWord("Unknown error while retrieving the groups")%>");
					</script>
				<%
				}
				%>
			</select></td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>
	</table>
	<fieldset style="width: 450px;">
	<table>
		<tr>
			<td height=20 width=200><b><%= pageData.getWord("Statistics")%>:</b>
			</td>
			<td height=20 width=100></td>
			<td height=20 width=125 colspan="2"><b><%= pageData.getWord("Stats related to")%>:</b></td>
		</tr>
		<tr align=left>
			<td colspan="2" height=20><b>&nbsp </b></td>
			<td height=20><b><%= pageData.getWord("Group")%></b></td>
			<td height=20><b><%= pageData.getWord("Agent")%></b></td>
		</tr>
		<tr bgcolor=#b4cfff>
			<td vAlign=top colspan="2"><%= pageData.getWord("Average handling time")%></td>
			<td vAlign=top align="center"><input id="ahtGroup"
				type="checkbox" name="ahtGroup"
				<% if(m_aht_group) out.print("checked='checked'"); %> /></td>
			<td vAlign=top align="center"><input id="ahtAgent" type=checkbox
				name="ahtAgent"
				<% if(m_aht_agent) out.print("checked='checked'"); %>></td>

		</tr>
		<tr bgcolor=#e6eff4>
			<td vAlign=top colspan="2"><%= pageData.getWord("Net conversion rate")%></td>
			<td vAlign=top align="center"><input id="netConvRateGroup"
				type=checkbox name="netConvRateGroup"
				<% if(m_ncr_group) out.print("checked='checked'"); %>></td>
			<td vAlign=top align="center"><input id="netConvRateAgent"
				type=checkbox name="netConvRateAgent"
				<% if(m_ncr_agent) out.print("checked='checked'"); %>></td>
		</tr>
		<tr bgcolor=#b4cfff>
			<td vAlign=top colspan="2"><%= pageData.getWord("Sales per hour")%></td>
			<td vAlign=top align="center"><input id="salesPerHourGroup"
				type=checkbox name="salesPerHourGroup"
				<% if(m_sph_group) out.print("checked='checked'"); %>></td>
			<td vAlign=top align="center"><input id="salesPerHourAgent"
				type=checkbox name="salesPerHourAgent"
				<% if(m_sph_agent) out.print("checked='checked'"); %>></td>
		</tr>
		<tr bgcolor=#e6eff4>
			<td vAlign=top colspan="2"><%= pageData.getWord("Productivity ratio")%></td>
			<td vAlign=top align="center"><input id="productRatioGroup"
				type=checkbox name="productRatioGroup"
				<% if(m_pro_rat_group) out.print("checked='checked'"); %>></td>
			<td vAlign=top align="center"><input id="productRatioAgent"
				type=checkbox name="productRatioAgent"
				<% if(m_pro_rat_agent) out.print("checked='checked'"); %>></td>
		</tr>
		<TR bgcolor=#b4cfff>
			<td vAlign=top colspan="2"><%= pageData.getWord("Busy factor")%></td>
			<td vAlign=top align="center"><input id="busyFactorGroup"
				type=checkbox name="busyFactorGroup"
				<% if(m_busy_fact_group) out.print("checked='checked'"); %>></td>
			<td vAlign=top align="center"><input id="busyFactorAgent"
				type=checkbox name="busyFactorAgent"
				<% if(m_busy_fact_agent) out.print("checked='checked'"); %>></td>
		</tr>
		<TR bgcolor=#e6eff4>
			<td vAlign=top colspan="2"><%= pageData.getWord("Total login time")%></td>
			<td></td>
			<td vAlign=top align="center"><input id="loginTimeAgent"
				type=checkbox name="loginTimeAgent"
				<% if(m_login_time_agent) out.print("checked='checked'"); %>></td>
		</tr>
		<TR bgcolor=#b4cfff>
			<td vAlign=top colspan="2"><%= pageData.getWord("Total calls")%></td>
			<td vAlign=top align="center"><input id="totalCallsGroup"
				type=checkbox name="totalCallsGroup"
				<% if(m_total_calls_group) out.print("checked='checked'"); %>></td>
			<td vAlign=top align="center"><input id="totalCallsAgent"
				type=checkbox name="totalCallsAgent"
				<% if(m_total_calls_agent) out.print("checked='checked'"); %>></td>
		</tr>
		<TR bgcolor=#e6eff4>
			<td vAlign=top colspan="2"><%= pageData.getWord("Waiting calls")%></td>
			<td vAlign=top align="center"><input id="waitingCallsGroup"
				type=checkbox onclick='checkQueue();' name="waitingCallsGroup"
				<% if(m_waiting_calls_group) out.print("checked='checked'"); %>></td>
			<td></td>
		</tr>
		<TR bgcolor=#b4cfff>
			<td vAlign=top colspan="2"><%= pageData.getWord("Abandoned calls")%></td>
			<td vAlign=top align="center"><input id="abandonedCallsGroup"
				type=checkbox onclick='checkQueue();' name="abandonedCallsGroup"
				<% if(m_abandoned_calls_group) out.print("checked='checked'"); %>></td>
			<td></td>
		</tr>
		<TR bgcolor=#e6eff4>
			<td vAlign=top colspan="2"><%= pageData.getWord("Average waiting time")%></td>
			<td vAlign=top align="center"><input id='averageWaitingTime'
				type=checkbox onclick='checkQueue();' name='averageWaitingTime'
				<% if(m_averageWaitingTime) out.print("checked='checked'"); %>></td>
			<td></td>
		</tr>
		<TR bgcolor=#b4cfff>
			<td vAlign=top colspan="2"><%= pageData.getWord("Longest waiting call")%></td>
			<td vAlign=top align="center"><input id='longestWaitingCall'
				type=checkbox onclick='checkQueue();' name='longestWaitingCall'
				<% if(m_longestWaitingCall) out.print("checked='checked'"); %>></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
	</table>
	</fieldset>

	<table>
		<tr>
			<td><%= pageData.getWord("Queue")%></td>
			<td><SELECT name='queue' id='queueSelect'
				<% if(!m_waiting_calls_group && !m_abandoned_calls_group && !m_averageWaitingTime && !m_longestWaitingCall) out.print("disabled='disabled'"); %>>
				<option value=''></option>
				<%=pageData.getQueuesHTMLSelectBox(m_queueName)%>
			</SELECT></td>
		</tr>
		<tr height="25">
			<td><%= pageData.getWord("Broadcast period (min)")%>&nbsp;
			</td>
			<td><SELECT id="statisticTime" name="statisticTime">
				<OPTION value=''></OPTION>
				<OPTION value='1'
					<% if(m_time.compareTo("1") == 0) out.print("selected='selected'"); %>>1</OPTION>
				<OPTION value='5'
					<% if(m_time.compareTo("5") == 0) out.print("selected='selected'"); %>>5</OPTION>
				<OPTION value='10'
					<% if(m_time.compareTo("10") == 0) out.print("selected='selected'"); %>>10</OPTION>
				<OPTION value='15'
					<% if(m_time.compareTo("15") == 0) out.print("selected='selected'"); %>>15</OPTION>
				<OPTION value='20'
					<% if(m_time.compareTo("20") == 0) out.print("selected='selected'"); %>>20</OPTION>
				<OPTION value='25'
					<% if(m_time.compareTo("25") == 0) out.print("selected='selected'"); %>>25</OPTION>
				<OPTION value='30'
					<% if(m_time.compareTo("30") == 0) out.print("selected='selected'"); %>>30</OPTION>
			</SELECT></td>
		</tr>

		<tr height="25">
			<td><%= pageData.getWord("Message color")%>
			</td>
			<td><input id="statisticColor" type="text" readonly="" size=5
				onClick="cp.show('pick');return false ; " name="statisticColor"
				style="" style="cursor: pointer" /> <A HREF="#"
				style="color: #000000"
				onClick="cp.show('pick');return false ; "
				NAME="pick" ID="pick"></A> <input type='hidden'
				name="statisticColor2" value="<%= m_color %>" /></td>
		</tr>

		<tr height="25">
			<td><%= pageData.getWord("Active")%></td>
			<td><input id="statisticState" type='checkbox' name="statisticState" <% if(m_state) out.print("checked='checked'"); %>></td>
			<input type='hidden' name='delete' id='delete' value='0'/>
		</tr>

		<tr height="25">
			<td>
			
			<% if(dbid == -1){ %> <input type='submit' id='saveButton' style='HEIGHT:25px' value='<%= pageData.getWord("Save")%>'/>
			<% }else{ %>
				<input type='submit' id='updateButton' style='HEIGHT:25px' value='<%= pageData.getWord("Update")%>'/>
				<input type='submit' id='deleteButton' style='HEIGHT:25px' onClick='setDelete();' value='<%= pageData.getWord("Delete")%>'/>
			<% } %>
			
			</td>
		</tr>
	</table>
</table>
</form>
</fieldset>
</div>

</div>
<script>
pickColor("<%= m_color %>");
</script>
</body>
</html>

<%
pageData.closeConnection();
%>
