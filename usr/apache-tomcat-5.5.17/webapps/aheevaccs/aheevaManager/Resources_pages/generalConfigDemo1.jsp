<html>
<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ include file="generalConfigDemoFunctions_labels.jsp" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >
<meta http-equiv="Content-Language" content="en-us">
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {

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
</style>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="generalConfigDemoFunctions.js"></script>

<script language="javascript" type="text/javascript">
var agentGrpDBID       	= '';
var groupName          	= '';
var lastName           	= '';
var firstName          	= '';
//var recordingRight      = '';

var nrows = 1 ;
var maxrow = 1;
/*
var mopID = "";

// Statistiques

var sTring = String( appletObj.getAgentGroupsStats( normalizeString(QueryString('grpName')) ) );
sTringArray = sTring.split(",");

var grp_Name 		= sTringArray[0];
var grpCallHandled 	= sTringArray[1];
var grpCallInbound 	= sTringArray[2];
var grpCallOutbound = sTringArray[3];
var grpLoginAgents 	= sTringArray[4];
var grpTotalNotReady= sTringArray[5];
var grpTotalReady 	= sTringArray[6];
var grpTotalWaiting = sTringArray[7];
var grpTotalWrapUp 	= sTringArray[8];
var grpTotalDialing = sTringArray[9];
var grpTotalHold	= sTringArray[10];
var grpTotalConference = sTringArray[11];
*/
</script>
</head>

<body class="f_i_conf_body" onLoad="displayGeneralConfigurationInfo()">
<div class="tab-pane" id="tabPane1">
<form name="generalConfiguration" >
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
	<div class="tab-page" id="tabGeneralSetup">
		<h2 class="tab"><%= pageData.getWord("General setup")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneralSetup" ) );</script>
		<fieldset>
		<legend><%= pageData.getWord("Define work periods")%></legend>
			<table width="1001" border="0">
				<tr>
				  <td width="354">
				  		<input  id="addWorkPeriod"  name="addWorkPeriod" type="button" value='<%= pageData.getWord("Add a new work period")%>' onClick="addMyRow();"></td>
					<td width="637">
						&nbsp;<input disabled  id="saveWorkPeriod"  name="saveWorkPeriod" type="button" value='<%= pageData.getWord("Save work periods")%>' onClick="javascript:saveWorkPeriodInfo();">
					    &nbsp;<input disabled  id="defineDurations"  name="defineDurations" type="button" value='<%= pageData.getWord("Define durations for NRR")%>' onClick="javascript:toggleLayer('configFields');">
					   &nbsp;<input disabled  id="updateInfo"  name="updateInfo" type="button" value='<%= pageData.getWord("Save durations for NRR")%>' onClick="saveGlobalNRRDurations()">
					</td>
					<!--<td>&nbsp;<INPUT id=Button2 onclick=javascript:save() type=button value="Save" name=saveRowButton></TD>-->
				</tr>
				<tr>
					<td>
						<div id="workperiod_items" style="MARGIN: 0px 5px">
						</div>
					</td>
					<td></td>
				</tr>
		</table>
		</fieldset>
		<fieldset id="configFields" style="display:none ">
			<legend><%= pageData.getWord("Configure durations for NRR")%></legend>
		</fieldset>
		

	</div>
	<div class="tab-page" id="paidNRR">
		<h2 class="tab"><%= pageData.getWord("Paid NRR")%></h2>
		<script type="text/javascript">
			//recordingRight = normalizeString(QueryString('recordingRight'));
			//if( recordingRight != 'false')
				tp1.addTabPage( document.getElementById( "paidNRR" ) );
		</script>
		<fieldset>
			<legend><%= pageData.getWord("Select an agent group")%></legend>
				<table border="0">
					<tr>
						<td colspan="2">
                          <select id="agentGroups" name="agentGroups" onChange="getNRRInfoForAgentGroup(this.value)">
                            <option value=""><%= pageData.getWord("Select agent group")%></option>
                          </select>
						</td>
					</tr>
				</table>
		</fieldset>
		<fieldset id="configPaidNRR">
			<legend><%= pageData.getWord("Associated not-ready reasons")%></legend>
			
			<div id="nrrDetails"></div>
			
		</fieldset>
	    <input style="visibility:hidden;"  id="savePaidConfig"  name="savePaidConfig" type="button" value='<%= pageData.getWord("Save payable NRR for this agent group")%>' onClick="savePayableOrBillableConfig(document.getElementById('agentGroups').value);refresh();">
				
	</div>
	
	
<!--	
	<div class="tab-page" id="activity">
		<h2 class="tab">Activities</h2>
		<script type="text/javascript">
			//recordingRight = normalizeString(QueryString('recordingRight'));
			//if( recordingRight != 'false')
				tp1.addTabPage( document.getElementById( "activity" ) );
		</script>
		<table>
			<tr>
				<td width="50%">
					<fieldset>
						<legend>Create an activity</legend>
							<table border="0">
								<tr>
									<td colspan="2">
										<input type="text" id="activity_name" name="activity_name">
									</td>
									<td width="400" align="center"> 
										<input type="button" id="addActivity" name="addActivity" value="Add an activity" onClick="saveActivity()"> 
									</td>
								</tr>
							</table>
					</fieldset>
				</td>
				<td width="50%">
					<fieldset>
						<legend>Already created activities</legend>
							<div id="alreadyCreatedActivities">
							</div>
					</fieldset>
				</td>
			</tr>
		</table>
	</div>
	
-->	
	
	<div class="tab-page" id="summary">
		<h2 class="tab"><%= pageData.getWord("Associated formulas")%></h2>
		<script type="text/javascript">
			//recordingRight = normalizeString(QueryString('recordingRight'));
			//if( recordingRight != 'false')
				tp1.addTabPage( document.getElementById( "summary" ) );
		</script>
		<fieldset>
		<legend><%= pageData.getWord("Associated formulas")%></legend>
		</fieldset>
	</div>
	<!--<input name="deleteAgtGrp" onClick="askDelete()" type="button" value="Delete">-->
</form>
</div>
<script>
	//displayActivities();
</script>
</body>
<% pageData.closeConnection(); %>
</html>