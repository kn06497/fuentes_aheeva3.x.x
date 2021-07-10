<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "aheevaManager.ressources.*" %>
<%@page import = "java.util.HashMap" %>
<%@page import = "java.util.Iterator" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	if (session.getAttribute("USER_LANGUAGE") != null)
		pageData.setDefaultLanguage((String) session
		.getAttribute("USER_LANGUAGE"));

	String currentUserDbid = (String) session
			.getAttribute("CURRENT_USER_DBID");
	int tenant_dbid = -1;
	try {
		tenant_dbid = Integer.parseInt(request
		.getParameter("tenant_dbid"));
	} catch (NumberFormatException e) {
		//do nothing
	}

	pageData.openConnection();
%>


<html>
<head>


<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language=JavaScript src="jsUtil.js"></script>
<script language=javascript src="Browser.js" type=text/javascript></script>
<script language=javascript src="AnchorPosition.js" type=text/javascript></script>
<script language=javascript src="ColorPicker2.js" type=text/javascript></script>
<script language=javascript src="PopupWindow.js" type=text/javascript></script>
<script language=javascript src="alert_xparse.js" type=text/javascript></script>
<script language=javascript src="alert_xReader.js" type=text/javascript></script>
<script language=javascript src="alert_xWriter.js" type=text/javascript></script>
<script language="javascript" type="text/javascript" src="alert_tabpane.js"></script>

<title>addAlert</title>
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >
<style type="text/css">
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}

html, body {
/*	background:	ThreeDFace; */

}

form {
	margin:		0;
	padding:	0;
}

/* over ride styles from webfxlayout */

body {
	margin:		10px;
	width:		auto;
	height:		auto;
}

.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}

.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
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

<script language="javascript" type="text/javascript" >

/***********************************************************************
************************************************************************/


var client_id='';
var tabIndex;

</script>

<%
	ResultSet rs;
	String m_name = "";
	boolean m_state= false;
	int m_agentGroup = -1;
	String m_conditions= "";
	String m_message= "";
	String m_color = "#000000";
	int m_time= -1;
	String m_queue = "";

	String sqlQuery = "";
	int dbid = -1;
	String errorMsg = "";
	boolean error = false;
	boolean sendSoftphone = false;
	boolean sendManager = false;
	boolean gotQueue = false;
	boolean needGroup = false; //for manager

	int j = 0;

	if(request.getParameter("dbid") != null){
		try{
			dbid = Integer.parseInt(request.getParameter("dbid"));
		}catch(NumberFormatException e){
			dbid = -1;
		}
	}

	if(dbid != -1 && request.getParameter("delete") != null && request.getParameter("delete").compareTo("1") == 0){
		PreparedStatement ps = pageData.buildPreparedStatement("SELECT manager, softphone FROM cfg_mc_alert WHERE DBID=?");
		ps.setInt(1, dbid);
		rs = ps.executeQuery();
		if(rs.next()){
			boolean manager = rs.getBoolean(1);
			boolean softphone = rs.getBoolean(2);
			pageData.executeModification("DELETE FROM cfg_mc_alert WHERE DBID=" + dbid);
			if(manager){
				%>
				<script language="javascript" type="text/javascript">
				appletObj.sendInfo("196,<%= dbid %>");
				</script>
				<%	
			}else if(softphone){
				%>
				<script language="javascript" type="text/javascript">
				appletObj.sendInfo("195,<%= dbid %>");
				</script>
				<%
			}
		}
		%>
		<script>
		appletObj.fReloadMenu = true;
		// refresh the current page
		document.location = "../defaultpage.htm";
		</script>
		</html>
		<%
		return;
	}
if(request.getParameter("alertNameStarPhone") != null){
	m_name = request.getParameter("alertNameStarPhone").trim();
	if (request.getParameter("alertStateStarPhone") != null)m_state = true;
	m_conditions = request.getParameter("alertConditionsStarPhone").trim();
	m_message = request.getParameter("alertMessageStarPhone").trim();
	m_color = request.getParameter("statisticColor2");
	if(request.getParameter("sendTo") != null){
		if(request.getParameter("sendTo").compareTo("Softphone") == 0) sendSoftphone = true;
		else if(request.getParameter("sendTo").compareTo("Manager") == 0)sendManager = true;
	}
	try{
		m_agentGroup = Integer.parseInt(request.getParameter("assigneGroups"));
	}catch(NumberFormatException e){
		m_agentGroup = -1;
	}
	
	try{
		m_time = Integer.parseInt(request.getParameter("alertTimeStarPhone"));
	}catch(NumberFormatException e){
		m_time = -1;
	}
	
	
	//verifier si ce nom n'existe pas dans la base de donnee
			
	if (!pageData.nameAvailable(m_name, dbid, "cfg_mc_alert")) {
		error = true;
		errorMsg += "-" + pageData.getWord("This name already exists") + "\\n";
	} else if (m_name.length() == 0) {
		error = true;
		errorMsg += "-" + pageData.getWord("You must enter a name") + "\\n";
	}
	
	if(!sendSoftphone && ! sendManager){
		error = true;
		errorMsg += "-" +pageData.getWord("You must select a destination") + "\\n";
	}

	
	if(!pageData.isValidExpression(m_conditions)){
		error = true;
		errorMsg += "-" + pageData.getValidationErrorMsg() + "\\n";
	}
	
//	{
		ArrayList<String> varAL = pageData.getExpressionVariables(m_conditions);
		ArrayList<String> validVariables = new ArrayList<String>();
		
		validVariables.add("WA");
		validVariables.add("WC");
		validVariables.add("AWT");
		validVariables.add("LWC");
		if(sendManager){
			validVariables.add("AHTG");
			validVariables.add("PRG");
			validVariables.add("WA");
			validVariables.add("AWU");
		}else{
			validVariables.add("AHTA");
			validVariables.add("PRA");
		}
		
		if(!pageData.areValidVariables(varAL, validVariables)){
			error = true;
			errorMsg += "-" +pageData.getWord("Unknown expression variable") + " (" + pageData.getValidationErrorMsg() + ")\\n";
		}
		
		varAL = pageData.getExpressionVariables(m_message);
		if(!pageData.areValidVariables(varAL, validVariables)){
			error = true;
			errorMsg += "-" + pageData.getWord("Unknown message variable") + " (" + pageData.getValidationErrorMsg() + ")\\n";
		}
//	}
	
	if(m_message.length() == 0){
		error = true;
		errorMsg += "-" + pageData.getWord("You must enter a message") + "\\n";
	}else if(m_message.length() > 256){
		error = true;
		errorMsg += "-" + pageData.getWord("The message must not exceed 256 characters") + "(" + pageData.getWord("variables included")+" )\\n";
	}
	
	
	//check group selection
	if(m_agentGroup == -1 && (sendSoftphone || needGroup)){
		error = true;
		errorMsg += "-" + pageData.getWord("You must select an agent group") + "\\n";
	}
	
	//check if a queue is required
	if(m_conditions.indexOf("$WC") != -1 || m_conditions.indexOf("$AWT") != -1 || m_conditions.indexOf("$LWC") != -1
			|| m_message.indexOf("$WC") != -1 || m_message.indexOf("$AWT") != -1 || m_message.indexOf("$LWC") != -1){
		m_queue = request.getParameter("queue");
		gotQueue = true;
		if(m_queue.length() == 0){
			error = true;
			errorMsg += "-" + pageData.getWord("You must select a queue") +" \\n";
		}
	}
	
	if(m_time < 1){
		error = true;
		errorMsg += "-" + pageData.getWord("You must specify a broadcast time period") + "\\n";
	}
	
	if(error){
		%>
		<script language="javascript" type="text/javascript">
		alert('<%= errorMsg %>');
		</script>
		<%
		}else{
			PreparedStatement ps;
			boolean update = false;
			if(dbid == -1){
				ps = pageData.buildPreparedStatement("INSERT INTO cfg_mc_alert ("
					+ "`TENANT_DBID`, `NAME`, `STATE`, `GRP_DBID`, `CONDITIONS`, "
					+ "`MESSAGE`, `COLOR`, `BCAST_PERIOD`, `MANAGER`, `SOFTPHONE`, `QUEUE_NAME`) VALUES ("
					+ "?, ?, ?, ?, ?, "
					+ "?, ?, ?, ?, ?, ?)");
			}else{
				update = true;
				ps = pageData.buildPreparedStatement("UPDATE cfg_mc_alert SET "
					+ "`TENANT_DBID`=?, `NAME`=?, `STATE`=?, `GRP_DBID`=?, `CONDITIONS`=?, "
					+ "`MESSAGE`=?, `COLOR`=?, `BCAST_PERIOD`=?, `MANAGER`=?, `SOFTPHONE`=?, `QUEUE_NAME`=? "
					+ "WHERE `DBID`=?");
			}
			ps.setInt(1, tenant_dbid);
			ps.setString(2, m_name);
			ps.setBoolean(3, m_state);
			ps.setInt(4, (m_agentGroup == -1 ? 0 : m_agentGroup));
			ps.setString(5, XMLTool.expressionToXML(m_conditions));
			ps.setString(6, m_message);
			ps.setString(7, m_color);
			ps.setInt(8, m_time);
			ps.setBoolean(9, sendManager);
			ps.setBoolean(10, sendSoftphone);
			ps.setString(11, m_queue);
			if(dbid != -1) ps.setInt(12, dbid);
			ps.execute();
			
			ps = pageData.buildPreparedStatement("select dbid from cfg_mc_alert where tenant_dbid=? and name=?");
			ps.setInt(1, tenant_dbid);
			ps.setString(2, m_name);
			ps.execute();
			rs = ps.getResultSet();
			
			if (rs.next() && (dbid = rs.getInt(1)) != -1) {
				%>
				<script language="javascript" type="text/javascript">
				appletObj.fReloadMenu = true;
				if(<%= sendManager %>) appletObj.sendInfo("196,<%= dbid %>"); //Manager
				else appletObj.sendInfo("195,<%= dbid %>");	//softphone
				document.location='?tenant_dbid=<%= tenant_dbid %>&dbid=<%= dbid %>&update=<%= update %>';
				</script>
<%
			} else {//Error
			%>
				alert(pageData.getWord("An unknown database error occurred while saving your entry"));
<%
		}
	}
}

if(dbid == -1){
	m_state = true;
}else if(request.getParameter("alertNameStarPhone") == null){
	rs = pageData.executeFromString("SELECT `NAME`, `STATE`, `GRP_DBID`, `CONDITIONS`, `MESSAGE`, "
			+ "`COLOR`, `BCAST_PERIOD`, `MANAGER`, `SOFTPHONE`, `QUEUE_NAME` FROM cfg_mc_alert WHERE dbid=" + dbid);
	try{
		if(rs.next()){
			m_name = rs.getString(1);
			m_state = rs.getBoolean(2);
			m_agentGroup = rs.getInt(3);
			m_conditions = XMLTool.xmlToExpression(rs.getString(4));
			m_message = rs.getString(5);
			m_color = rs.getString(6);
			m_time = rs.getInt(7);
			sendManager = rs.getBoolean(8);
			sendSoftphone = rs.getBoolean(9);
			if(m_conditions.indexOf("$WC") != -1 || m_conditions.indexOf("$AWT") != -1 || m_conditions.indexOf("$LWC") != -1
					|| m_message.indexOf("$WC") != -1 || m_message.indexOf("$AWT") != -1 || m_message.indexOf("$LWC") != -1){
				m_queue = rs.getString(10);
				gotQueue = true;
			}
			
		}else{
			%>
			alert(pageData.getWord("No data was retrieved"));
			<%
		}
	}catch(SQLException e){
		e.printStackTrace();
		%>
		alert(pageData.getWord("Unknown SQL error while loading the data"));
		</script>
		<%
	}
}
	
	//************************************************************

%>
<script>

function updateAlertConditions(client){
	var alertConditions='alertConditionsStarPhone';
 	if(document.getElementById(alertConditions).value=='<%= "--" + pageData.getWord("Define message condition(s)") + "--"%>'){
		document.getElementById(alertConditions).value='';
		document.getElementById(alertConditions).style.fontStyle ='normal';
	}
}


/***********************************************************************
************************************************************************/

function updateAlertMessage(client)
{
	var alertMessage='alertMessageStarPhone';
	if(document.getElementById(alertMessage).value=='<%= "--" + pageData.getWord("Click to write the message") + "--"%>'){
			document.getElementById(alertMessage).value='';
			document.getElementById(alertMessage).style.fontStyle ='normal';
	}
}

/***********************************************************************
************************************************************************/

function pickColor(color) {
	document.getElementById('alertColorStarPhone').style.backgroundColor = color;
	document.getElementById('statisticColor2').value = color;
}

/***********************************************************************
************************************************************************/

function checkQueue(){
	document.getElementById('queueSelect').disabled = !(checkQueueMsg(document.getElementById("alertConditionsStarPhone").value) 
														|| checkQueueMsg(document.getElementById("alertMessageStarPhone").value));
	if(document.getElementById('queueSelect').disabled) document.getElementById("queueSelect").selectedIndex = 0;
}

function checkQueueMsg(theText){
	if(theText.indexOf('$WC') != -1 || theText.indexOf('$AWT') != -1 || theText.indexOf('$LWC') != -1){
		return true;
	}
	return false;
}

function checkEmpty(msgBox){
	if(msgBox.value == ""){
		if(msgBox.name == "alertConditionsStarPhone"){
			msgBox.value = '<%= "--" + pageData.getWord("Define message condition(s)") + "--" %>';
		}else if(msgBox.name == "alertMessageStarPhone"){
			msgBox.value = '<%= "--" + pageData.getWord("Click to write the message") + "--" %>';
		}
		msgBox.style.fontStyle ='italic';
	}
}


/***********************************************************************
************************************************************************/

function getAssignedAgentGroups(){
	return document.getElementById('assigneGroups').options.value;
}


/***********************************************************************
************************************************************************/

function addThistoAlertMessageArea(text, client)
{
	var alertMessage= 'alertMessage' +client;
	var option1Message = 'option1Message' + client;
	updateAlertMessage(client);
	insertAtCursor(document.getElementById(alertMessage), text);
	document.getElementById(option1Message).selected=true;
}

/***********************************************************************
************************************************************************/

function addThistoAlertConditionsArea(text, client)
{
	
	var alertConditions= 'alertConditions' +client;
	var option1Condition = 'option1Condition' + client;
	updateAlertConditions(client);
	insertAtCursor(document.getElementById(alertConditions), text);
	document.getElementById(option1Condition).selected=true;
}

/***********************************************************************
************************************************************************/

function insertAtCursor(myField, myValue) 
{
	//IE support
	if (document.selection) {
	myField.focus();
	sel = document.selection.createRange();
	sel.text = myValue;
	}
	//MOZILLA/NETSCAPE support
	else if (myField.selectionStart || myField.selectionStart == '0') {
	alert("nonIE");
	var startPos = myField.selectionStart;
	var endPos = myField.selectionEnd;
	myField.value = myField.value.substring(0, startPos)
	+ myValue
	+ myField.value.substring(endPos, myField.value.length);
	} else {
	myField.value += myValue;
	}
}

function checkDelete(){
	if(document.getElementById('delete').value == 1){
		if(<%= dbid %> > -1){
			var answer = confirm("<%=pageData.getWord("Are you sure you wish to delete this alert?")%>");
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

function checkGroup(){
	if(document.getElementById("sendSoftphone").checked){
		document.getElementById("assigneGroups").disabled = false;
	}else if(checkGroupMsg(document.getElementById("alertConditionsStarPhone").value)
			|| checkGroupMsg(document.getElementById("alertMessageStarPhone").value)){
		document.getElementById("assigneGroups").disabled = false;
	}else{
		document.getElementById("assigneGroups").disabled = true;
		document.getElementById("assigneGroups").selectedIndex = 0;
	}
	
	if(document.getElementById("sendSoftphone").checked || document.getElementById("sendManager").checked){
		document.getElementById("selMessage").disabled = false;
		document.getElementById("selAlert").disabled = false;
	}
	
}

function checkGroupMsg(theText){
	if(theText.indexOf('$AHT') != -1 || theText.indexOf('$PR') != -1 || theText.indexOf('$WA') != -1 || theText.indexOf('$AWU') != -1){
		return true;
	}
	return false;
}

function checkVariables(){
	
	if(document.getElementById("sendManager").checked){
		document.getElementById("selMessage").options[1] = new Option("<%=pageData.getWord("Average handling time")%>","$AHTG");
		document.getElementById("selAlert").options[1] = new Option("<%=pageData.getWord("Average handling time")%>","$AHTG");
		document.getElementById("selMessage").options[2] = new Option("<%=pageData.getWord("Productivity ratio")%>","$PRG");
		document.getElementById("selAlert").options[2] = new Option("<%=pageData.getWord("Productivity ratio")%>","$PRG");	
		document.getElementById("selMessage").options[6] = new Option("<%=pageData.getWord("Waiting agents")%>","$WA");
		document.getElementById("selAlert").options[6] = new Option("<%=pageData.getWord("Waiting agents")%>","$WA");
		document.getElementById("selMessage").options[7] = new Option("<%=pageData.getWord("Agents in wrap up")%>","$AWU");		
		document.getElementById("selAlert").options[7] = new Option("<%=pageData.getWord("Agents in wrap up")%>","$AWU");
	}else{
		document.getElementById("selMessage").options[1] = new Option("<%=pageData.getWord("Average handling time")%>","$AHTA");
		document.getElementById("selAlert").options[1] = new Option("<%=pageData.getWord("Average handling time")%>","$AHTA");
		document.getElementById("selMessage").options[2] = new Option("<%=pageData.getWord("Productivity ratio")%>","$PRA");
		document.getElementById("selAlert").options[2] = new Option("<%=pageData.getWord("Productivity ratio")%>","$PRA");
		document.getElementById("selMessage").length = 6;
		document.getElementById("selAlert").length = 6;
	}
}

/***********************************************************************
************************************************************************/
</script>

</head>
<body class="alert_body" onload="checkGroup(); pickColor('<%= m_color %>'); checkVariables();" >
<div class="tab-pane" id="tabPane1">

<script type="text/javascript">
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	var cp = new ColorPicker('window');
</script>
<div class="tab-page" id="pageStarPhone">
<h2 class="tab" ><%= pageData.getWord("Add alert")%></h2>
<script type="text/javascript">tp1.addTabPage( document.getElementById( "pageStarPhone" ) );</script>
	
		
		<%
		if (request.getParameter("update") != null && !error) {
		%>
	<table class="msg">
	<tr><td>
	<%
			if (request.getParameter("update").compareTo("true") == 0) {
				out.write( pageData.getWord("Update succeeded"));
			} else {
				out.write(pageData.getWord("Creation succeeded"));
			}
	%></td></tr></table>
	<br/>
	<%
	}
	%>
		
		<fieldset>
			<legend><%=pageData.getWord("Add alert for softPhone")%></legend>
			<form method="post" onsubmit="return checkDelete();">
			<table>						
				<tr height="25">
					<td>
						<%= pageData.getWord("Alert name")%> &nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td>
						<input id="alertNameStarPhone"  type="text" name="alertNameStarPhone" value="<%= pageData.protectHTMLString(m_name) %>">
					</td> 
				</tr>
				
				<tr>
					<td rowspan="2" valign="top">Sent to</td><td><input type="radio" id='sendManager' name='sendTo' value="Manager" checked="checked"  <% if(sendManager) out.print("checked='checked'");%> onClick="checkGroup(); checkVariables();"/>Manager</td>
				</tr>
				<tr>
						<td><input type="radio" id='sendSoftphone' name='sendTo' value="Softphone" <% if(sendSoftphone) out.print("checked='checked'");%> onClick="checkGroup(); checkVariables();"/>Softphone</td>
				</tr>
					
					<tr>
						<td colspan="4">&nbsp; </td>
					</tr>
					<tr>
						<td>
							<%=pageData.getWord("Message condition")%> &nbsp;&nbsp;
						</td>
						<td> 
							<input type="button" value="()" onClick="addThistoAlertConditionsArea('()','StarPhone')">
							<input type="button" value="AND" onClick="addThistoAlertConditionsArea(' AND ','StarPhone') ">
							<input type="button" value="OR" onClick="addThistoAlertConditionsArea(' OR ','StarPhone') ">
						</td>
						<td>
							<select id="selAlert" name="selectStatisticConditionStarPhone" onChange=" if(this.value!='') addThistoAlertConditionsArea(this.options[this.selectedIndex].value,'StarPhone' )"
								disabled="disabled">
								<option  id="option1ConditionStarPhone" value="" style="font-style:italic" >--<%= pageData.getWord("Select a statistic")%>--</option>
								<option value="$AHT"><%= pageData.getWord("Average handling time")%></option>
								<option value="$PR"><%= pageData.getWord("Productivity ratio")%></option>
								<option value="$WC"><%= pageData.getWord("Waiting calls")%></option>
								<option value="$AWT"><%= pageData.getWord("Average waiting time")%></option>
								<option value="$LWC"><%= pageData.getWord("Longest waiting call")%></option>
								<option value="$WA" style="display:none"><%= pageData.getWord("Waiting agents")%></option>
								<option value="$AWU"><%= pageData.getWord("Agents in wrap up")%></option>
							</select>								
						</td>
						<td id="alertOperandsStarPhone">
							<input type="button" value='&lt' onClick="addThistoAlertConditionsArea('&lt;','StarPhone') ">
							<input type="button" value="=" onClick="addThistoAlertConditionsArea('=','StarPhone')">
							<input type="button" value="&gt" onClick="addThistoAlertConditionsArea('&gt;','StarPhone') ">
						</td>
					</tr>
					<tr>
						<td colspan="1">&nbsp; </td>
						<td  colspan="3">
							<textarea name="alertConditionsStarPhone"  onFocus="updateAlertConditions('StarPhone'); checkQueue(); checkGroup();" onBlur="checkQueue(); checkEmpty(this); checkGroup();"  rows="3" style=" width:98%; font-style:italic" ><%=m_conditions.length() == 0 ? "--"
					+ pageData.getWord("Define message condition(s)") + "--" : pageData.protectHTMLString(m_conditions)%></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp; </td>
					</tr>
					<tr>
						<td>
							<%= pageData.getWord("Message to send")%>&nbsp;&nbsp;
						</td>
						<td colspan="3">
							<select id="selMessage" name="selectStatisticMessageStarPhone" onChange="if(this.value!='') addThistoAlertMessageArea(this.options[this.selectedIndex].value,'StarPhone') "
								disabled="disabled">
								<option id="option1MessageStarPhone" value="" style=" font-style:italic ">    --<%= pageData.getWord("Select a statistic")%>--</option>
								<option value="$AHT"><%= pageData.getWord("Average handling time")%></option>
								<option value="$PR"><%= pageData.getWord("Productivity ratio")%></option>
								<option value="$WC"><%= pageData.getWord("Waiting calls")%></option>
								<option value="$AWT"><%= pageData.getWord("Average waiting time")%></option>
								<option value="$LWC"><%= pageData.getWord("Longest waiting call")%></option>
								<option value="$WA"><%= pageData.getWord("Waiting agents")%></option>
								<option value="$AWU"><%= pageData.getWord("Agents in wrap up")%></option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="1">&nbsp; </td>
						<td colspan="3">
							<textarea name="alertMessageStarPhone"  onFocus="updateAlertMessage('StarPhone'); checkQueue(); checkGroup();" onBlur="checkQueue(); checkEmpty(this); checkGroup();" rows="3" style=" width:98%; font-style:italic" ><%=m_message.length() == 0 ? "--"
					+ pageData.getWord("Click to write the message") + "--"	: pageData.protectHTMLString(m_message)%></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">&nbsp; </td>
							<td>
								<%= pageData.getWord("(256 characters maximum)")%>&nbsp;&nbsp;
							</td>
					</tr>			
					<tr>
						<td colspan="4">&nbsp; </td>
					</tr>
					<tr>
						<td align="left">
						<%= pageData.getWord("Group")%>
						</td><td>
							<select id="assigneGroups" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="assigneGroups" <%= sendSoftphone ? "" : "disabled='disabled'"  %>>
								<OPTION value=''></OPTION>
							<%
										rs = pageData
										.executeFromString("select name, dbid from cfg_agent_group where tenant_dbid='"
										+ tenant_dbid + "' and state='1' order by name");
								try {
									while (rs.next()) {
							%>
							<option value="<%=rs.getInt("dbid")%>" <% if(m_agentGroup == rs.getInt("dbid")) out.print("selected='selected'"); %>><%=rs.getString("name")%></option>
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
							</select>
						</td>
					</tr>
					<tr height="25">
						<td vAlign=top><%= pageData.getWord("Queue")%></td>
						<td>
							<SELECT name='queue' id='queueSelect' <%if(!gotQueue) out.write("disabled='disabled'"); %>>
								<option value=""></option>
									<%=pageData.getQueuesHTMLSelectBox(m_queue)%>
							</SELECT>
						</td>
					</tr>
					<tr height="25">
						<td> 
							<%= pageData.getWord("Broadcast period (min)")%>&nbsp;
						</td>
						<td colspan="3">
							<SELECT id="alertTimeStarPhone" name="alertTimeStarPhone">
								<option></option> 
								<OPTION value=1 <% if(m_time == 1) out.print("selected='selected'"); %>>1</OPTION> 
								<OPTION value=5 <% if(m_time == 5) out.print("selected='selected'"); %>>5</OPTION> 
								<OPTION value=10 <% if(m_time == 10) out.print("selected='selected'"); %>>10</OPTION> 
								<OPTION value=15 <% if(m_time == 15) out.print("selected='selected'"); %>>15</OPTION>
								<OPTION value=20 <% if(m_time == 20) out.print("selected='selected'"); %>>20</OPTION> 
								<OPTION value=25 <% if(m_time == 25) out.print("selected='selected'"); %>>25</OPTION>  
								<OPTION value=30 <% if(m_time == 30) out.print("selected='selected'"); %>>30</OPTION> 
							</SELECT> 
						</td>
					</tr>
					<tr height="25">
						<td>
							<%= pageData.getWord("Message color")%>&nbsp;&nbsp;
						</td>
						<td colspan="3">
							<input id="alertColorStarPhone" type="text" readonly="" size=5
								onClick="cp.show('pick');return false ; " name="statisticColor"
								style="" style="cursor: pointer" /> <A HREF="#"
								style="color: #000000"
								onClick="cp.show('pick');"
								NAME="pick" ID="pick"></A> 
								<input type='hidden' name="statisticColor2" value="<%= m_color %>" />
						</td>
					</tr>
					<tr height="25">
						<td>
							<%= pageData.getWord("Active")%> &nbsp;&nbsp;
						</td>
						<td>
							<input id="alertStateStarPhone"  align="center" type="checkbox" name="alertStateStarPhone" <% if(m_state) out.print("checked='checked'"); %>>
						</td> 
						<td colspan="2">&nbsp; </td>
					</tr>
					<tr height="25">
						<td colspan="1">
						<input type='hidden' name='delete' id='delete' value='0'/>
						<%
						if (dbid == -1) {
						%>
							<input type='submit' id='updateInfoStarPhone' style='HEIGHT:25px' value='<%= pageData.getWord("Save")%>' onClick='updateAlertMessage(""); updateAlertConditions("");'/>
						<%
						} else {
						%>
							<input type='submit' id='updateInfoStarPhone' style='HEIGHT:25px' value='<%= pageData.getWord("Update")%>' onClick='updateAlertMessage(""); updateAlertConditions("");'/>
							 <input type='submit' id='deleteButton' style='HEIGHT:25px' onClick='setDelete();' value='<%= pageData.getWord("Delete")%>'/>
						
						<%
						}
						%>
						</td>
						<td colspan="3">&nbsp; </td>
					</tr>
				</table>
			</form>
		</fieldset>	
	</div>

</div>
</body><script type="text/javascript">


<%
if(m_message.length() > 0) out.print("document.getElementById('alertMessageStarPhone').style.fontStyle ='normal';");
if(m_conditions.length() > 0) out.print("document.getElementById('alertConditionsStarPhone').style.fontStyle ='normal';");
%>
</script>
</html>
<%
pageData.closeConnection();
%>
