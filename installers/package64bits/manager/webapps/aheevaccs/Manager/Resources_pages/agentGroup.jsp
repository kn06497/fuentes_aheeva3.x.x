<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "Manager.ressources.*" %>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
	String agentGroupDbid = request.getParameter("dbid");
	String tenantDbid = request.getParameter("tenant_dbid");
	
	String userAssignedTenants = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='TENANT' AND RESSOURCE_DBID='"+tenantDbid+"')";
	String userAssignedAgentGroups = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='AGENTGROUP' AND RESSOURCE_DBID='"+agentGroupDbid+"')";
	String listAllowedUsersQuery = "SELECT U.DBID AS USER_DBID, USERNAME FROM cfg_user_authorize_ressources, cfg_user U "+
		"WHERE RESSOURCE_TYPE='AGENTGROUP' AND U.DBID = USER_DBID AND RESSOURCE_DBID='"+agentGroupDbid+"' ORDER BY USERNAME";
	String listNotAllowedUsersQuery = "SELECT DBID AS USER_DBID, USERNAME FROM cfg_user WHERE ALLOW_AGENT_GROUPS_MANAGEMENT='yes' AND state='1' "+
		"AND DBID NOT IN "+userAssignedAgentGroups+" AND DBID IN "+userAssignedTenants+" ORDER BY USERNAME";
	String userRightsQuery = "SELECT USERNAME, ALLOW_USER_MANAGEMENT, ALLOW_AGENT_GROUPS_MANAGEMENT FROM cfg_user WHERE DBID='"+currentUserDbid+"'";

	pageData.openConnection();
	pageData.executeFromString(listAllowedUsersQuery);
	Vector <HashMap> listAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(listNotAllowedUsersQuery);
	Vector <HashMap> listNotAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(userRightsQuery);
	Vector <HashMap> userRightsDataResult = pageData.CreateVectorFromBean();
	pageData.closeConnection();

	String currentUserName = (String)userRightsDataResult.elementAt(0).get("USERNAME");
	boolean userManagementAllowed = pageData.userHasRight(userRightsDataResult, "ALLOW_USER_MANAGEMENT");
	boolean isNewResource = agentGroupDbid.compareTo("") == 0;
	if(!pageData.userHasRight(userRightsDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT"))
	{ %>
		<jsp:forward page="forbidden.htm"/>
<%	} %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
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
<script language="javascript" type="text/javascript" src="agentGroupFunctions.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="javascript" type="text/javascript">
var currentUserDbid = <%=currentUserDbid%>;
var agentGroupDbid = "<%=agentGroupDbid%>";
var isNewResource = <%=isNewResource%>;
var agentGrpDBID       	= '';
var groupName          	= '';
var lastName           	= '';
var firstName          	= '';
var tenant_dbid		= "NULL";
var recordingRight      = '';

var nrows = 1 ;
var maxrow = 1;
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
</script>
</head>

<body class="bottompagebody" onLoad="displayAgentGroupInfo()">
<div class="tab-pane" id="tabPane1">
<form name="agentGroup" >
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
	<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><script>document.write(MultiArray["General"][lang]);</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<fieldset>
			<legend><script>document.write(MultiArray["General settings"][lang]);</script></legend>
            <table border="0">
              <tr>
                <td width="197" height="22"><script>document.write(MultiArray["Group name"][lang]);</script></td>
                <td width="288" height="22" align="left"><input type="text" name="grpName" onChange="enableUpdateButton()" size="20"></td>
              </tr>
              <tr>
                <td width="197" height="24"><script>document.write(MultiArray["Description"][lang]);</script></td>
                <td width="288"height="50"><textarea rows="3" name="grpDescription" cols="41" onChange="enableUpdateButton()"></textarea></td>
              </tr>
              <tr>
                <td width="197" height="36"><script>document.write(MultiArray["Associated queue"][lang]);</script></td>
                <td width="288" height="36"><input type="text" name="grpQueue" onChange="enableUpdateButton()"></td>
              </tr>
              <tr>
                <td colspan="1">

					<script>document.write(MultiArray["Wrap-up time out"][lang]);</script>

                    <input name="wrapUpTimeOut" type="checkbox" id="wrapUpTimeOut" onClick="enableUpdateButton(); changeSecondWrapUpStatus()" value="">
                </td>
                <td>
					<input name="maxWrapUpTime" id="maxWrapUpTime" type="text" onChange="enableUpdateButton()" size="5" disabled>
					<script>document.write(MultiArray["seconds"][lang]);</script> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					<select name="ActionAfterTimeOut" id="ActionAfterTimeOut" onChange="enableUpdateButton()" disabled>
						<option value="NOT_READY"><script>document.write(MultiArray["Not ready"][lang]);</script></option>
						<option value="READY"><script>document.write(MultiArray["Ready"][lang]);</script></option>
						<option value="LOGGED_OUT">
						</option>
					</select>
					<script>document.write(MultiArray["Action after Time out"][lang]);</script>
				</td>
              </tr>
              <tr>

                <td colspan="1"><script>document.write(MultiArray["Max Wrap-up time For Productivity"][lang]);</script></td>
                <td><input type="text" id="maxWrapTimeForProductivity" name="maxWrapTimeForProductivity" onChange="enableUpdateButton()" size="5">&nbsp;<script>document.write(MultiArray["seconds"][lang]);</script></td>
              </tr>
              <tr>
                <td width="197" height="25"><script>document.write(MultiArray["Active"][lang]);</script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <input id="grpState" type="checkbox" name="grpState" value="ON" onClick="enableUpdateButton()" checked>
                </td>
				
              </tr>
            </table>
		</fieldset>
	</div>
	<div class="tab-page" id="tabAgents">
		<h2 class="tab"><script>document.write(MultiArray["Agents"][lang]);</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabAgents" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Agents configuration"][lang]);</script></legend>
		<table border="0">
			<tr>
				<td width="197" height="25">
					<input id="agtlist" type="checkbox" name="orderView" value="ON" onClick="changeAgentListView(); enableUpdateButton()">
					<script>document.write(MultiArray["Show agent by ID"][lang]);</script>
				</td>
			</tr>
			<tr>
				<td>
					<table border="0" width="100%" height="58" cellspacing="0" cellpadding="0" bordercolor="#c0c0c0" style="BORDER-COLLAPSE: collapse">
						<tr>
							<td align="center" valign="middle" ><script>document.write(MultiArray["Non-configured agent"][lang]);</script></td>
							<td align="center">&nbsp;</td>
							<td align="center" valign="middle"><script>document.write(MultiArray["Assigned agent"][lang]);</script></td>
						</tr>
						<tr>
							<td width="43%" height="52" align="center">
								<select width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 250px" name="nonConfiguredAgents" size="10" multiple>
								</select>
							</td>
							<td width="11%" valign=middle height="52" bordercolordark="#c0c0c0" nowrap align="center">
								&nbsp;<img src="../img/left_to_right.gif" style="cursor:pointer " onClick="chkAndAddAgentToGroup()" />&nbsp;<br><br><br><br>
								&nbsp;<img src="../img/right_to_left.gif"  style="cursor:pointer " onClick="chkAndDropAgentFromGroup()"/>&nbsp;
							</td>
							<td width="288%" height="52" bordercolor="#000000" align="center">
								<select style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 250px" name="availableAgentInGroup" size="10" multiple>
								</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</fieldset>
	</div>
	<div class="tab-page" id="tabNRR">
		<h2 class="tab"><script>document.write(MultiArray["Not-ready reasons"][lang]);</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabNRR" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Not-ready reasons configuration"][lang]);</script></legend>
			<table border="0">
				<tr>
					<td><script>
						document.write("<input id=\"addNRR\" name=\"addRowButton\" type=\"button\" value=\""+MultiArray["Add a new reason"][lang]+"\" onClick=\"addMyNotGlobalRow();enableUpdateButton()\">");</script>
	
					</td>
					<td>&nbsp;</td>
					<!--<td>&nbsp;<INPUT id=Button2 onclick=javascript:save() type=button value="Save" name=saveRowButton></TD>-->
				</tr>
				<tr>
					<td>
						<div id="NRR_items" style="MARGIN: 0px 5px">
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
	</div>

	<div class="tab-page" id="tabStarphone">
		<h2 class="tab"><script>document.write(MultiArray["StarPhone"][lang]);</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabStarphone" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["StarPhone Settings"][lang]);</script></legend>
			<table border="0">
              <tr>
                <td width="197" height="25"><script>document.write(MultiArray["Enable Dialing"][lang]);</script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="grpEnableDialing" type="checkbox" name="grpEnableDialing" value="ON" onClick="enableUpdateButton()" checked>
                </td>
				</tr>
				<tr>
					<td width="197" height="25"><script>document.write(MultiArray["Be ready after login"][lang]);</script>
						<input id="grpReadyButtonState" type="checkbox" name="grpReadyButtonState" value="OFF" onClick="enableUpdateButton()">
					</td>
              </tr>
			  <tr><td height="15"></td></tr>
			</table>
		</fieldset>
	</div>

	<div class="tab-page" id="tabRecording">
		<h2 class="tab"><script>document.write(MultiArray["Recordings"][lang]);</script></h2>
		<script type="text/javascript">
			recordingRight = normalizeString(QueryString('recordingRight'));
			if( recordingRight != 'false')
				tp1.addTabPage( document.getElementById( "tabRecording" ) );
		</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Recording options"][lang]);</script></legend>
		<table border="0">
			<tr>
				<td colspan="2">
					<script>document.write(MultiArray["Enable Recording"][lang]);</script>
					<input id="recording" type="checkbox" name="recordingsState" value="ON" onClick="enableUpdateButton();validateRecordings()" checked>
				</td>
				<td colspan="2">
					<script>document.write(MultiArray["Recordings stay local"][lang]);</script>
					<input id="local" type="checkbox" name="localRecording" value="ON" onClick="enableUpdateButton()">
				</td>
				<td colspan="2">
					<script>document.write(MultiArray["Encode Recordings to MP3"][lang]);</script>
					<input id="mp3" type="checkbox" name="mp3Encoding" value="ON" onClick="enableUpdateButton();enableMp3Quality()" checked>
				</td>
			</tr>
			<tr><td colspan="6">&nbsp;</td></tr>
			<tr>
				<td><script>document.write(MultiArray["Minimum Recording Time"][lang]);</script></td>
				<td colspan="5">
					<select name="minRecTime" onChange="enableUpdateButton()">
						<option value="0">0 sec</option>
						<option value="5">5 secs</option>
						<option value="10">10 secs</option>
						<option value="15">15 secs</option>
						<option value="20">20 secs</option>
						<option value="25">25 secs</option>
						<option value="30" selected>30 secs</option>
						<option value="35">35 secs</option>
						<option value="40">40 secs</option>
						<option value="45">45 secs</option>
						<option value="50">50 secs</option>
						<option value="55">55 secs</option>
						<option value="60">60 secs</option>
						<option value="65">65 secs</option>
						<option value="70">70 secs</option>
						<option value="75">75 secs</option>
						<option value="80">80 secs</option>
						<option value="85">85 secs</option>
						<option value="90">90 secs</option>
						<option value="95">95 secs</option>
						<option value="100">100 secs</option>
						<option value="105">105 secs</option>
						<option value="110">110 secs</option>
						<option value="115">115 secs</option>
						<option value="120">120 secs</option>
						<option value="125">125 secs</option>
						<option value="130">130 secs</option>
						<option value="135">135 secs</option>
						<option value="140">140 secs</option>
						<option value="145">145 secs</option>
						<option value="150">150 secs</option>
						<option value="155">155 secs</option>
						<option value="160">160 secs</option>
						<option value="165">165 secs</option>
						<option value="170">170 secs</option>
						<option value="175">175 secs</option>
						<option value="180">180 secs</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><script>document.write(MultiArray["Maximum Recording Time"][lang]);</script></td>
				<td colspan="5">
					<select name="maxRecTime" onChange="enableUpdateButton()">
						<option value="5">5 mins</option>
						<option value="10">10 mins</option>
						<option value="15">15 mins</option>
						<option value="20">20 mins</option>
						<option value="25">25 mins</option>
						<option value="30" selected>30 mins</option>
						<option value="35">35 mins</option>
						<option value="40">40 mins</option>
						<option value="45">45 mins</option>
						<option value="50">50 mins</option>
						<option value="55">55 mins</option>
						<option value="60">60 mins</option>
						<option value="65">65 mins</option>
						<option value="70">70 mins</option>
						<option value="75">75 mins</option>
						<option value="80">80 mins</option>
						<option value="85">85 mins</option>
						<option value="90">90 mins</option>
						<option value="95">95 mins</option>
						<option value="100">100 mins</option>
						<option value="105">105 mins</option>
						<option value="110">110 mins</option>
						<option value="115">115 mins</option>
						<option value="120">120 mins</option>
					</select>
				</td>
			</tr>
			<tr><td colspan="6">&nbsp;</td></tr>
			<tr>
				<td colspan="3"><script>document.write(MultiArray["Low quality MP3(smaller files)"][lang]);</script><input type="radio" name="mp3Quality" value="low" onClick="enableUpdateButton()" checked></td>
				<td colspan="3"><script>document.write(MultiArray["High quality MP3(bigger files)"][lang]);</script><input type="radio" name="mp3Quality" value="high" onClick="enableUpdateButton()"></td>
			</tr>
			<tr><td colspan="6">&nbsp;</td></tr>
			<tr>
				<td colspan="2">
					<script>document.write(MultiArray["Enable encryption"][lang]);</script>
					<input id="encryption" type="checkbox" name="encryptionEnable" value="ON" onClick="enableUpdateButton(); updateEncServerBox() ">
				</td>
				<td colspan="2">
					<script>document.write(MultiArray["Encryption server"][lang]);</script>
					<select name="encServer" onChange="enableUpdateButton()" disabled></select>
				</td>
				<td ><script>document.write(MultiArray["Encryption method"][lang]);</script></td>
				<td ><select name="encMethod" onChange="enableUpdateButton()" disabled>
						<option value="" selected> </option>
						<option value="AES">AES</option>
						<option value="MyAES" >MyAES</option>
						<option value="DES3">DES3</option>
					</select>
				</td>

			</tr>
  		</table>
		</fieldset>
	</div>
	
<script>
if(userHasRight("ALLOW_WORK_FORCE_MANAGEMENT"))
{
	document.write('<div class="tab-page" id="tabPage5">');
		document.write('<h2 class="tab">');
		//document.write(MultiArray["Methods Of Payment"][lang]);
		document.write(MultiArray["Methods Of Payment"][lang]);
		document.write('</h2>');
		tp1.addTabPage( document.getElementById( "tabPage5" ) );
		document.write('<fieldset>');
		document.write('<legend>');
		document.write(MultiArray["Methods Of Payment info"][lang]);
		document.write('</legend>');
			document.write('<table border="0">');
			  document.write('<tr>');
			  	document.write('<td colspan="2" width="394" height="50">');
					document.write('<select onChange="enableUpdateButton()" name="MopSelection" >');
						document.write('<option value="">');
						document.write(MultiArray["Select MOP"][lang]);
						document.write('</option>');
					document.write('</select>');
				document.write('</td>');
			  document.write('</tr>');
			  document.write('<tr>');
			   document.write('<td width="197" height="50">');
					document.write(MultiArray["Override salary"][lang]);
					document.write('<input id="overrideEnable" type="checkbox" name="overrideEnable" value="ON" onClick="enableUpdateButton()">');
				document.write('</td>');
				  document.write('<td width="197" height="50">');
				  	document.write(MultiArray["Amount"][lang]);
					document.write('<input id="overrideSalary" type="text" name="overrideSalary" onChange="enableUpdateButton()" size="15"> <b>$</b>');
					 document.write('</td>');
			  document.write('</tr>');
			document.write('</table>');
		document.write('</fieldset>');
	document.write('</div>');
}	
</script>
	<% if(userManagementAllowed) { %>
	<div class="tab-page" id="tabSecurity">
		<h2 class="tab"><%=pageData.getWord("Security")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabSecurity" ) );</script>
		<fieldset>
		<legend><%=pageData.getWord("Security settings")%></legend>
		<table border="0">
			<tr>
				<td><%=pageData.getWord("Not allowed users")%></td>
				<td>&nbsp;</td>
				<td><%=pageData.getWord("Allowed users")%></td>
			</tr>		
			<tr>
				<td align="center">
					<select id="notAllowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="notAllowedUsers" size="5" multiple="multiple">
					<%for(int i = 0; i < listNotAllowedUsersDataResult.size(); i++)
					{
						String userDbid = (String)listNotAllowedUsersDataResult.elementAt(i).get("USER_DBID");
						String userName = (String)listNotAllowedUsersDataResult.elementAt(i).get("USERNAME");
						if(userDbid.compareTo(currentUserDbid) != 0)
						{
					%>
						<option value="<%=userDbid%>"><%=userName%></option>
					<%	}
					} %>
					</select>
				</td>
				<td valign=middle>
					&nbsp;<img src="../img/left_to_right.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('notAllowedUsers', 'allowedUsers');enableUpdateButton()"/>&nbsp;<br>
					&nbsp;<img src="../img/right_to_left.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('allowedUsers', 'notAllowedUsers');enableUpdateButton()"/>&nbsp;
				</td>
				<td align="center">
					<select id="allowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="allowedUsers" size="5" multiple="multiple">
					<%for(int i = 0; i < listAllowedUsersDataResult.size(); i++)
					{
						String userDbid = (String)listAllowedUsersDataResult.elementAt(i).get("USER_DBID");
						String userName = (String)listAllowedUsersDataResult.elementAt(i).get("USERNAME");
					%>
						<option value="<%=userDbid%>"><%=userName%></option>
					<%}	
					if(isNewResource)
					{%>
						<option value="<%=currentUserDbid%>"><%=currentUserName%></option>
					<%}
					%>
					</select>
				</td>
			</tr>
		</table>
		</fieldset>
	</div>
	<% } %>
	
	<div class="tab-page" id="tabStatistics">
		<h2 class="tab"><script>document.write(MultiArray["Statistics"][lang]);</script></h2>
		<script type="text/javascript">
			if(normalizeString(QueryString('grpName')) != "")
				tp1.addTabPage( document.getElementById( "tabStatistics" ) );
		</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Statistics"][lang]);</script></legend>
		<table border="0">
			<tr>
				<td>
					<!-- table width="450" style="BORDER-RIGHT:#000000 1px solid; BORDER-TOP:#000000 1px solid; BORDER-LEFT:#000000 1px solid; BORDER-BOTTOM:#000000 1px solid; BACKGROUND-COLOR:#ffffff" -->
					<table border="0">
						<tr style="BACKGROUND-COLOR:#c4e0f0">
							<td colspan="2"><b><script>document.write(MultiArray["Agent group"][lang]);</script> [<script language="javascript" type="text/javascript">document.write(normalizeString(QueryString('grpName')));</script>]</b></td>
						</tr>
						<tr>
							<td colspan="2">
								<script language="javascript" type="text/javascript">
								/*alert(window.grpTotalReady + ", " +
									window.grpTotalWaiting+ ", " +
									window.grpTotalDialing+ ", " +
									window.grpTotalHold+ ", " +
									window.grpTotalConference+ ", " +
									window.grpTotalNotReady+ ", " +
									window.grpTotalWrapUp
								);*/
								if(grpTotalReady || grpTotalWaiting || grpTotalWrapUp
								   || grpTotalDialing || grpTotalHold ||
								      grpTotalConference || grpTotalNotReady)
								{
								document.write('<applet code="Manager.PieChart.PiechartApplet.class" archive="../sAheevaChart.jar" width="550" height="250" mayscript name="graphApplet">');
								<!-- Start Up Parameters -->
								document.write('<PARAM name="LOADINGMESSAGE" value="Creating Chart - Please Wait.">');
								document.write('<PARAM name="STEXTCOLOR"     value="0,0,100">');
								document.write('<PARAM name="STARTUPCOLOR"   value="255,255,255">');
								<!-- Character Encoding -->
								document.write('<PARAM name="charset"   value="8859_1">');

								<!-- Chart Switches -->
								document.write('<PARAM name="3D"                 value="true">');
								document.write('<PARAM name="Slabels"            value="true">');
								document.write('<PARAM name="legend"             value="true">');
								document.write('<PARAM name="displayPercentages" value="true">');

								<!-- Chart Characteristics -->
								document.write('<PARAM name="width"      value="550">');
								document.write('<PARAM name="height"     value="250">');
								document.write('<PARAM name="nPies"      value="1">');
								document.write('<PARAM name="depth3D"    value="15">');
								document.write('<PARAM name="ndecplaces" value="0">');
								document.write('<PARAM name="3Dangle"    value="50">');

								<!-- Thousand separator -->
								document.write('<PARAM name="thousandseparator" value=".">');

								<!-- Link Cursor -->
								<!--  valid values are - crosshair, default, hand, move, text or wait -->
								document.write('<PARAM name="linkCursor" value="default">');

								<!-- Popup segment Value Pre & Post Symbols -->
								document.write('<PARAM name="valuepresym"  value="">');
								document.write('<PARAM name="valuepostsym"  value=" ">');

								<!-- Additional font information -->
								document.write('<PARAM name="popupfont"  value="Arial,B,12">');
								document.write('<PARAM name="slabelfont" value="Arial,N,10">');

								<!-- Additional color information -->
								document.write('<PARAM name="bgcolor"      value="white">');
								document.write('<PARAM name="labelcolor"   value="50,50,50">');


								<!-- Legend Information -->
								document.write('<PARAM name="legendfont"       value="Arial,N,10">');
								document.write('<PARAM name="legendposition"   value="400,10">');
								document.write('<PARAM name="legendtitle"      value="Dials">');
								document.write('<PARAM name="LegendBackground" value="255,255,255">');
								document.write('<PARAM name="LegendBorder"     value="125,125,125">');
								document.write('<PARAM name="LegendtextColor"  value="0,0,0">');

								<!-- Title -->
								<!-- title   text|xpos,ypos|Font|Color Defintion"> -->
								<!--<PARAM name="title" value="Dials statistics|180,15|Arial,BI,16|grey">-->

								<!-- Free Form Text -->
								<!--  textN  text|xpos,ypos|Font|Color Defintion"> -->


								<!-- Pie Data -->
								<!--  PieN   x,y,size,number of segments, seperation -->
								document.write('<PARAM name="Pie1" value="110,50,175,7,5">');

								<!-- Pie Segement Labels -->
								document.write('<PARAM name="pie1label1" value="Not ready agents">');
								document.write('<PARAM name="pie1label2" value="Ready agents">');
								document.write('<PARAM name="pie1label3" value="Waiting agents">');
								document.write('<PARAM name="pie1label4" value="Wrap up agents">');
								document.write('<PARAM name="pie1label5" value="Dialing agents">');
								document.write('<PARAM name="pie1label6" value="OnHold agents">');
								document.write('<PARAM name="pie1label7" value="In Conference agents">');


								<!-- Segment Data -->
								<!-- segmentN       series color|legend label|URL|Target Frame -->
								document.write('<PARAM name="segment1" value="115,152,164|Not ready">');
								document.write('<PARAM name="segment2" value="99,99,156|Ready">');
								document.write('<PARAM name="segment3" value="185,53,8|Waiting">');
								document.write('<PARAM name="segment4" value="239,214,115|Wrap up">');
								document.write('<PARAM name="segment5" value="250,200,115|Dialing">');
								document.write('<PARAM name="segment6" value="239,100,115|On Hold">');
								document.write('<PARAM name="segment7" value="100,214,50|In Conference">');
								document.write('<PARAM name="data1series1" value="'+grpTotalNotReady+'">');
								document.write('<PARAM name="data2series1" value="'+grpTotalReady+'">');
								document.write('<PARAM name="data3series1" value="'+grpTotalWaiting+'">');
								document.write('<PARAM name="data4series1" value="'+grpTotalWrapUp+'">');
								document.write('<PARAM name="data4series1" value="'+grpTotalDialing+'">');
								document.write('<PARAM name="data4series1" value="'+grpTotalHold+'">');
								document.write('<PARAM name="data4series1" value="'+grpTotalConference+'">');

								document.write('</applet>');
								}
								else{
								document.write(MultiArray["No Stats Available"][lang]);
								}

								</script>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</fieldset>
	</div>
	<script>document.write("<input name=\"updateInfo\" type=\"button\" value=\""+MultiArray["Update"][lang]+"\" onClick=\"validateInfo()\">")</script>
	<script>document.write("<input name=\"deleteAgtGrp\" type=\"button\" value=\""+MultiArray["Delete"][lang]+"\" onClick=\"askDelete()\">")</script>
</form>
</div>
</body>
</html>
