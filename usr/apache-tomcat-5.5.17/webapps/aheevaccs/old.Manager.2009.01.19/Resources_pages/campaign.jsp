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
	String campaignDbid = request.getParameter("dbid");
	String tenantDbid = request.getParameter("tenant_dbid");

	String userAssignedTenants = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='TENANT' AND RESSOURCE_DBID='"+tenantDbid+"')";
	String userAssignedCampaigns = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='CAMPAIGN' AND RESSOURCE_DBID='"+campaignDbid+"')";
	String listAllowedUsersQuery = "SELECT DISTINCT U.DBID AS USER_DBID, USERNAME FROM cfg_user_authorize_ressources, cfg_user U "+
		"WHERE RESSOURCE_TYPE='CAMPAIGN' AND U.DBID = USER_DBID AND RESSOURCE_DBID='"+campaignDbid+"' ORDER BY USERNAME";
	String listNotAllowedUsersQuery = "SELECT DISTINCT DBID AS USER_DBID, USERNAME FROM cfg_user WHERE ALLOW_CAMPAIGN_MANAGEMENT='yes' AND state='1' "+
		"AND DBID NOT IN "+userAssignedCampaigns+" AND DBID IN "+userAssignedTenants+" ORDER BY USERNAME";
	String userRightsQuery = "SELECT USERNAME, ALLOW_USER_MANAGEMENT, ALLOW_CAMPAIGN_MANAGEMENT FROM cfg_user WHERE DBID='"+currentUserDbid+"'";

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
	boolean isNewResource = campaignDbid.compareTo("") == 0;
	if(!pageData.userHasRight(userRightsDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))
	{ %>
		<jsp:forward page="forbidden.htm"/>
<%	} %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<head>
<title>Add a new campaign</title>
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style.css" />
<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
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
</style>

<!-- Calendrier début -->
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="javascript" type="text/javascript" src="xc2_default.js"></script>
<script language="javascript" type="text/javascript">xcAutoHide=1000;</script>
<script language="javascript" type="text/javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="JavaScript" type="text/javascript" src="trim.js"></script>
<script language="javascript" type="text/javascript" src="campaignFunctions.js"></script>
<script language="javascript" type="text/javascript">
var currentUserDbid = <%=currentUserDbid%>;
var this_cmpName = normalizeString(QueryString('campaign_name'));
var campaignDbid = normalizeString(QueryString('dbid'));
var isNewResource = <%=isNewResource%>;
var cmpName	= '';
var cmpDBID	= '';
var tenant_dbid = "NULL";

var sTring = String( appletObj.getCampaignStats(this_cmpName) );
sTringArray = sTring.split(",");

var cmpTotalAnswers = sTringArray[1];
var cmpTotalNoAnswers = sTringArray[2];
var cmpTotalAbandonned = sTringArray[3];
var cmpTotalAnswerMachine = sTringArray[4];
var cmpTotalSIT = sTringArray[5];
var cmpTotalBusy = sTringArray[6];
var cmpTotalFax = sTringArray[7];
var cmpTotalDials = parseInt(cmpTotalAnswers) + 
					parseInt(cmpTotalNoAnswers) + 
					parseInt(cmpTotalAbandonned) + 
					parseInt(cmpTotalAnswerMachine) + 
					parseInt(cmpTotalSIT) + 
					parseInt(cmpTotalBusy) + 
					parseInt(cmpTotalFax);
</script>
</head>
<body class="bottompagebody" text="#000000" vLink="#666666" link="#000066" onload="displayCampaignInfo();setDialingMode();">
	<div class="tab-pane" id="tabPane1">
	<form name="campaign">
	<script type="text/javascript">
		tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabGeneral">
	<h2 class="tab"><script>document.write(MultiArray["General"][lang])</script></td></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
	<fieldset>
	<legend><script>document.write(MultiArray["General information"][lang])</script></legend>
	<table>
      <tr>
        <td valign="top" align="left"><script>document.write(MultiArray["Campaign name"][lang])</script>&nbsp;&nbsp;</td>
        <td valign="top"><input type="text" onChange="enableUpdateButton()" size="28" name="campaignName"></td>
      </tr>
      <tr>
        <td valign="top"><script>document.write(MultiArray["Description"][lang])</script>&nbsp;&nbsp;</td>
        <td valign="top"><textarea name="cmpDescription" rows="4" cols="40" onChange="enableUpdateButton()"></textarea>
        </td>
      </tr>
      <tr>
        <td valign="top"><script>document.write(MultiArray["Number of ports"][lang])</script>&nbsp;&nbsp; </td>
        <td valign="top"><input type="text" onChange="enableUpdateButton()" size="8" name="cmp_NbrPorts">
        </td>
      </tr>
      <tr>
        <td valign="top"><script>document.write(MultiArray["Caller ID"][lang])</script>&nbsp;&nbsp; </td>
        <td valign="top"><input type="text" onChange="enableUpdateButton()" size="27" name="callerID">

          &nbsp;&nbsp;<script>document.write(MultiArray["Caller ID format"][lang])</script>: "<script>document.write(MultiArray["Caller ID name"][lang])</script>" &lt;(514) 555-5555&gt; </td>

      </tr>
      <tr>
        <td valign="top" align="left" height="45"><script>document.write(MultiArray["Active"][lang])</script>&nbsp;&nbsp;&nbsp;
            <input onClick="enableUpdateButton()" type="checkbox" value="ON" name="cmpState">
        </td>
      </tr>
    </table>
	</fieldset>
	</div>
	<div class="tab-page" id="tabCallingList">
		<h2 class="tab"><script>document.write(MultiArray["Calling lists"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabCallingList" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Associated calling lists"][lang])</script></legend>
		<table border="0">
			<tr>
				<td vAlign="top" align="left" width="25%" height="61"><script>document.write(MultiArray["Available calling lists"][lang])</script>&nbsp;&nbsp;
				</td>
				<td vAlign="top" height="61">
					<table id="availableCallingList" cellSpacing="0" cellPadding="0" width="331" border="0">
						<tr>
							<td id="availableCallingListTD">
							
							</td>										
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</fieldset>
	</div>
	
	<div class="tab-page" id="tabBlackList">
		<h2 class="tab"><script>document.write(MultiArray["Do-not-call lists"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabBlackList" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Associated Do-not-call lists"][lang])</script></legend>
		<table border="0">
			<tr>
				<td vAlign="top" height="61">
					<table id="availableBlackList" cellSpacing="0" cellPadding="0" width="331" border="0">
					  <tr>
					   <td height="21" align="center"><script>document.write(MultiArray["Available blacklist groups"][lang])</script></td>
					   <td></td>
					   <td align="center"><script>document.write(MultiArray["Selected blacklist groups"][lang])</script></td>
					  </tr>
					
					  <tr>
						<td width="200" height="138" align="center"><select id="availableBlackListGroups" width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="availableBlackListGroups" size="10" multiple onchange="enabledAddButton()">
						</select></td>
						<td width="115" height="138" bordercolordark="#c0c0c0" nowrap align="center">
						 <p> </p>
						 <p>
						 <button name="addButton"  disabled onclick="switchOptionsFromSelectBoxes('availableBlackListGroups', 'selectedBlackListGroups');enableUpdateButton()" style="WIDTH: 40px; HEIGHT: 26px" type=button> &gt;&gt; </button></p>
						 <button name="dropButton" disabled onclick="switchOptionsFromSelectBoxes('selectedBlackListGroups', 'availableBlackListGroups');enableUpdateButton()" style="WIDTH: 40px; HEIGHT: 26px" type=button> &lt;&lt; </button>
						 <p>&nbsp;</p>				</td>
						<td width="200" height="138" bordercolor="#000000" align="left">
						 <select id="selectedBlackListGroups" width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="selectedBlackListGroups" size="10" multiple onChange="enabledDropButton()">
						 </select>				</td>
					   </tr>
					</table>
				</td>
			</tr>
		</table>
		</fieldset>
	</div>
	
	
	<div class="tab-page" id="tabHours">
		<h2 class="tab"><script>document.write(MultiArray["Hours"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabHours" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Campaign daily hours"][lang])</script></legend>
		<table border="0">
			<tr>
				<td vAlign="top" align="left" ><script>document.write(MultiArray["Daily hours"][lang])</script>&nbsp;&nbsp;</td>
				<td vAlign="top" height="80">
					<table>
						<tr>
							<td>&nbsp;</td>
							<td><script>document.write(MultiArray["Monday"][lang])</script></td>
							<td><script>document.write(MultiArray["Tuesday"][lang])</script></td>
							<td><script>document.write(MultiArray["Wednesday"][lang])</script></td>
							<td><script>document.write(MultiArray["Thursday"][lang])</script></td>
							<td><script>document.write(MultiArray["Friday"][lang])</script></td>
							<td><script>document.write(MultiArray["Saturday"][lang])</script></td>
							<td><script>document.write(MultiArray["Sunday"][lang])</script></td>
						</tr>
						<tr>
							<td><script>document.write(MultiArray["From"][lang])</script>&nbsp;</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_from_monday">
									<option value="-0200">24h</option>
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900" selected>09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100">21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
								</select>
							</td>
							<td>
								<select onChange="enableUpdateButton()" name="daily_from_tuesday">
									<option value="-0200">24h</option>
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900" selected>09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100">21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_from_wednesday">
									<option value="-0200">24h</option>
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900" selected>09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100">21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_from_thursday">
									<option value="-0200">24h</option>
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900" selected>09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100">21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_from_friday">
									<option value="-0200">24h</option>
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900" selected>09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100">21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_from_saturday">
									<option value="-0200">24h</option>
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900" selected>09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100">21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_from_sunday">
									<option value="-0200">24h</option>
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900" selected>09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100">21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><script>document.write(MultiArray["to"][lang])</script>&nbsp;</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_to_monday">
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900">09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100" selected>21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
									<option value="2500">24h</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_to_tuesday">
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900">09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100" selected>21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
									<option value="2500">24h</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_to_wednesday">
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900">09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100" selected>21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
									<option value="2500">24h</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_to_thursday">
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900">09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100" selected>21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
									<option value="2500">24h</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_to_friday">
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900">09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100" selected>21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
									<option value="2500">24h</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_to_saturday">
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900">09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100" selected>21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
									<option value="2500">24h</option>
								</select>
							</td>
							<td>
								<select onchange="enableUpdateButton()" name="daily_to_sunday">
									<option value="-0100"><script>document.write(MultiArray["Close"][lang])</script></option>
									<option value="0000">00:00</option>
									<option value="0100">01:00</option>
									<option value="0200">02:00</option>
									<option value="0300">03:00</option>
									<option value="0400">04:00</option>
									<option value="0500">05:00</option>
									<option value="0600">06:00</option>
									<option value="0700">07:00</option>
									<option value="0800">08:00</option>
									<option value="0900">09:00</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
									<option value="1300">13:00</option>
									<option value="1400">14:00</option>
									<option value="1500">15:00</option>
									<option value="1600">16:00</option>
									<option value="1700">17:00</option>
									<option value="1800">18:00</option>
									<option value="1900">19:00</option>
									<option value="2000">20:00</option>
									<option value="2100" selected>21:00</option>
									<option value="2200">22:00</option>
									<option value="2300">23:00</option>
									<option value="2500">24h</option>
								</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</fieldset>
	</div>
	<div class="tab-page" id="tabMode">
		<h2 class="tab"><script>document.write(MultiArray["Mode"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabMode" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Dialing Mode"][lang])</script></legend>
		<table border="0" width="100%">
			<tr>
				<td colspan="2">
					<div id="routing_script_div" style="margin: 0px 0px 0px 0px;display:;">
						<table width="100%">
							<td width="38%"><script>document.write(MultiArray["Associated routing script"][lang])</script>
							</td>
							<td>
								<select name="routing_script">
									<option value=""></option>
								</select>
							</td>
						</table>
					</div>
					<div id="agent_group_div" style="margin: 0px 0px 0px 0px;display:; ">
						<table width="100%">
							<td width="38%">
								<script>document.write(MultiArray["Agent group"][lang])</script>
							</td>
							<td>
								<select onchange="enableUpdateButton()" size="1" name="AgentGroupSelection">
								</select>
							</td>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td vAlign="top"><script>document.write(MultiArray["Dialing Mode"][lang])</script></td>
				<td vAlign="top"><select onchange="setDialingMode()" size="1" name="dialingMode">
						<option value="PREVIEW"><script>document.write(MultiArray["Preview mode"][lang])</script></option>
						<option value="PROGRESSIVE"><script>document.write(MultiArray["Progressive mode"][lang])</script></option>
						<option value="PREDICTIVE" selected><script>document.write(MultiArray["Predictive mode"][lang])</script></option>
						<option value="BROADCAST"><script>document.write(MultiArray["Broadcast mode"][lang])</script></option>
					</select>
				</td>
			</tr>
			<tr>
				<td vAlign="top"><script>document.write(MultiArray["Optimization parameter"][lang])</script></td>
				<td vAlign="top">
					<select onchange="modifyTargetValue(this.value)" size="1" name="OptimizationParameter">
						<option value="0"><script>document.write(MultiArray["Agent Busy Factor"][lang])</script></option>
						<option value="1" selected><script>document.write(MultiArray["Overdial Rate"][lang])</script></option>
					</select>
					&nbsp; <script>document.write(MultiArray["Target"][lang])</script> &nbsp; 
					<input type="text" maxLength="100" size="3" value="10" name="TargetValue"><b>%</b>&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<script>document.write(MultiArray["Abandon rate"][lang])</script>
				</td>
				<td>
					<INPUT type="text" maxLength="3" size="3" value="5" name="AbandonRate"><b>%</b>
				</td>
			</tr>
			<tr>
				<td vAlign="top" align="left" colspan="2">
					<script>document.write(MultiArray["Answering Machine Detection"][lang])</script> &nbsp;&nbsp;&nbsp; 
					<input type="checkbox" onClick="enableUpdateButton();checkAnswerMachine()" checked="checked" name="AMD" id="AMD">
				</td>
			</tr>
			<tr>
				<td vAlign="top" align="left" colspan="2">
					<div id="leave_message_div" style="margin: 0px 0px 0px 0px;display:;">
						<table width="100%">
							<td>
								<%=pageData.getWord("Leave a message if answering machine is detected")%>&nbsp;&nbsp;&nbsp;<input type="checkbox" onClick="enableUpdateButton()" id="leave_message" name="leave_message">
							</td>
						</table>
					</div>
				</td>
			</tr>
		</table>
		</fieldset>
	</div>
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
		<h2 class="tab"><script>document.write(MultiArray["Statistics"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabStatistics" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Statistics"][lang])</script></legend>
		<table border="0">
			<tr style="BACKGROUND-COLOR: #c4e0f0">
				<td colSpan="2">
					<script>document.write(MultiArray["Campaign"][lang])</script> [
					<script language="javascript" type="text/javascript">document.write(this_cmpName);</script>
					]
				</td>
			</tr>
			<tr>
				<td colSpan="2">
					<script language="javascript" type="text/javascript">
					   if(window.cmpTotalAnswers || window.cmpTotalNoAnswers || 
					      window.cmpTotalAbandonned || window.cmpTotalAnswerMachine ||
					      window.cmpTotalSIT || window.cmpTotalBusy || window.cmpTotalFax )
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
						document.write('<PARAM name="pie1label1" value="Answered">');
						document.write('<PARAM name="pie1label2" value="No Answer">');
						document.write('<PARAM name="pie1label3" value="Abandoned">');
						document.write('<PARAM name="pie1label4" value="Answer machine">');
						document.write('<PARAM name="pie1label5" value="SIT">');
						document.write('<PARAM name="pie1label6" value="Busy">');
						document.write('<PARAM name="pie1label7" value="Fax">');
						
						
						<!-- Segment Data -->
						<!-- segmentN       series color|legend label|URL|Target Frame -->
						document.write('<PARAM name="segment1" value="115,152,164|Answered">');
						document.write('<PARAM name="segment2" value="99,99,156|No Answer">');
						document.write('<PARAM name="segment3" value="185,53,8|Abandoned">');
						document.write('<PARAM name="segment4" value="239,214,115|Answer machine">');
						document.write('<PARAM name="segment5" value="0,63,68|SIT">');
						document.write('<PARAM name="segment6" value="17,97,158|Busy">');
						document.write('<PARAM name="segment7" value="17,97,0|Fax">');
						
						<!-- Images -->
						<!-- imageN    imageURL,x position,y position -->
						<!-- <PARAM name="image1" value="./images/productX.gif,80,45"> -->
						<!-- <PARAM name="image2" value="./images/productY.gif,330,45"> -->
						<!-- <PARAM name="image3" value="./images/productZ.gif,155,220"> -->
						
						<!-- Pie Data -->
						<!--                value,URL,Target Frame -->
						/*
						document.write('<PARAM name="data1series1" value="'+cmpTotalAnswers+'">');
						document.write('<PARAM name="data2series1" value="'+cmpTotalNoAnswers+'">');
						document.write('<PARAM name="data3series1" value="'+cmpTotalAbandonned+'">');
						document.write('<PARAM name="data4series1" value="'+cmpTotalAnswerMachine+'">');
						document.write('<PARAM name="data5series1" value="'+cmpTotalSIT+'">');
						document.write('<PARAM name="data6series1" value="'+cmpTotalBusy+'">');
						document.write('<PARAM name="data7series1" value="'+cmpTotalFax+'">');
						*/
						document.write('<PARAM name="data1series1" value="'+cmpTotalAnswers+'">');
						document.write('<PARAM name="data2series1" value="'+cmpTotalNoAnswers+'">');
						document.write('<PARAM name="data3series1" value="'+cmpTotalAbandonned+'">');
						document.write('<PARAM name="data4series1" value="'+cmpTotalAnswerMachine+'">');
						document.write('<PARAM name="data5series1" value="'+cmpTotalSIT+'">');
						document.write('<PARAM name="data6series1" value="'+cmpTotalBusy+'">');
						document.write('<PARAM name="data7series1" value="'+cmpTotalFax+'">');
						
						document.write("</applet>");}
					    else{
						document.write(MultiArray["No Stats Available"][lang]);
					    }
				
					</script>
				</td>
			</tr>
		</table>
		</fieldset>
	</div>
	<!--<div class="tab-page" id="tabPage7">
		<h2 class="tab">TEMP</h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage7" ) );</script>
		<fieldset>
		<legend></legend>
		<table border="0">
			
		</table>
		</fieldset>
	</div>-->
<script>document.write("<input disabled  size=\"18\" name=\"status\" type=\"text\" value=\""+MultiArray["Not loaded"][lang]+"\" >")</script>
	
<script>document.write("<input disabled name=\"load\" type=\"button\" value=\""+MultiArray["Load"][lang]+"\" onClick=\"clickLoadButton()\">")</script>
<script>document.write("<input disabled name=\"start\" type=\"button\" value=\""+MultiArray["Start"][lang]+"\" onClick=\"clickStartButton()\">")</script>	

<br><br>

	<script>document.write("<input disabled name=\"updateInfo\" type=\"button\" value=\""+MultiArray["Update"][lang]+"\" onClick=\"validateInfo()\">")</script>
	<script>document.write("<input name=\"deleteCmp\" type=\"button\" value=\""+MultiArray["Delete"][lang]+"\" onClick=\"askDelete()\">")</script>	

</form>
</div>
<script language="javascript" type="text/javascript">
this_cmpName = normalizeString(QueryString('campaign_name'));
selectObject(document.campaign.daily_from_monday, String( appletObj.getCampaignHour(this_cmpName, 0) ) );
selectObject(document.campaign.daily_from_tuesday,  String( appletObj.getCampaignHour(this_cmpName, 1) ));
selectObject(document.campaign.daily_from_wednesday,  String( appletObj.getCampaignHour(this_cmpName, 2) ));
selectObject(document.campaign.daily_from_thursday,  String( appletObj.getCampaignHour(this_cmpName, 3) ));
selectObject(document.campaign.daily_from_friday,  String( appletObj.getCampaignHour(this_cmpName, 4) ));
selectObject(document.campaign.daily_from_saturday,  String( appletObj.getCampaignHour(this_cmpName, 5) ));
selectObject(document.campaign.daily_from_sunday,  String( appletObj.getCampaignHour(this_cmpName, 6) ));
selectObject(document.campaign.daily_to_monday,  String( appletObj.getCampaignHour(this_cmpName, 7) ) );
selectObject(document.campaign.daily_to_tuesday, String(  appletObj.getCampaignHour(this_cmpName, 8) ));
selectObject(document.campaign.daily_to_wednesday,  String( appletObj.getCampaignHour(this_cmpName, 9) ));
selectObject(document.campaign.daily_to_thursday,  String( appletObj.getCampaignHour(this_cmpName, 10) ));
selectObject(document.campaign.daily_to_friday,  String( appletObj.getCampaignHour(this_cmpName, 11) ));
selectObject(document.campaign.daily_to_saturday,  String( appletObj.getCampaignHour(this_cmpName, 12) ));
selectObject(document.campaign.daily_to_sunday,  String( appletObj.getCampaignHour(this_cmpName, 13) ));
</script>
</body>
</HTML>
