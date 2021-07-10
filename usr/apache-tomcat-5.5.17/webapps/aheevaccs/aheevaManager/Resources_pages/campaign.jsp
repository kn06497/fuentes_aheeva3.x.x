<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "aheevaManager.ressources.*" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.ResultSet" %>

<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	PreparedStatement ps;
	ResultSet rs;
	String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
	String campaignDbid = request.getParameter("dbid");
	String tenantDbid = request.getParameter("tenant_dbid");
	int campaignID = -1;
	int tenantID = 0;
	if(campaignDbid  != null && !campaignDbid.equals("")){
		try{
			campaignID = Integer.parseInt(campaignDbid);
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
	}
	if(tenantDbid != null && !campaignDbid.equals("")){
		try{
			tenantID = Integer.parseInt(tenantDbid);
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
	}

	beanManagerData pageCData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageCData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	

	String userAssignedTenants = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='TENANT' AND RESSOURCE_DBID='"+tenantDbid+"')";
	String userAssignedCampaigns = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='CAMPAIGN' AND RESSOURCE_DBID='"+campaignDbid+"')";
	String listAllowedUsersQuery = "SELECT DISTINCT U.DBID AS USER_DBID, USERNAME FROM cfg_user_authorize_ressources, cfg_user U "+
		"WHERE RESSOURCE_TYPE='CAMPAIGN' AND U.DBID = USER_DBID AND RESSOURCE_DBID='"+campaignDbid+"' ORDER BY USERNAME";
	String listNotAllowedUsersQuery = "SELECT DISTINCT DBID AS USER_DBID, USERNAME FROM cfg_user WHERE ALLOW_CAMPAIGN_MANAGEMENT='yes' AND state='1' "+
		"AND DBID NOT IN "+userAssignedCampaigns+" AND DBID IN "+userAssignedTenants+" ORDER BY USERNAME";
	String userRightsQuery = "SELECT USERNAME, ALLOW_USER_MANAGEMENT, ALLOW_CAMPAIGN_MANAGEMENT,ALLOW_CALLING_LIST_MANAGEMENT FROM cfg_user WHERE DBID='"+currentUserDbid+"'";
	String switchConfiguredPorts = "SELECT SUM(IF(NUMBER_OF_LINES < 0, 10000, NUMBER_OF_LINES)) AS NB_CONFIGURED_PORT FROM cfg_switch;";
	String campaignListQry = "SELECT NAME from cfg_campaign WHERE  TENANT_DBID='"+tenantDbid+"'";

	pageCData.openConnection();
	pageCData.executeFromString(listAllowedUsersQuery);
	Vector <HashMap> listAllowedUsersDataResult = pageCData.CreateVectorFromBean();
	pageCData.executeFromString(listNotAllowedUsersQuery);
	Vector <HashMap> listNotAllowedUsersDataResult = pageCData.CreateVectorFromBean();
	pageCData.executeFromString(userRightsQuery);
	Vector <HashMap> userRightsDataResult = pageCData.CreateVectorFromBean();
	pageCData.executeFromString(switchConfiguredPorts);
	Vector <HashMap> switchConfiguredPortsResult = pageCData.CreateVectorFromBean();
	pageCData.executeFromString(campaignListQry);//retrieve list of existing cmps
	Vector <HashMap> campaignListResult = pageCData.CreateVectorFromBean();

	String currentUserName = (String)userRightsDataResult.elementAt(0).get("USERNAME");
	String nbConfiguredPorts = (String)switchConfiguredPortsResult.elementAt(0).get("NB_CONFIGURED_PORT");
	if (nbConfiguredPorts.length() < 1)
	{
		nbConfiguredPorts = "0";
	}
	boolean userManagementAllowed = pageCData.userHasRight(userRightsDataResult, "ALLOW_USER_MANAGEMENT");
	boolean isNewResource = campaignDbid.compareTo("") == 0;
	if(!pageCData.userHasRight(userRightsDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))
	{ %>
		<jsp:forward page="forbidden.jsp"/>
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
	height:		210px;
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

a{
	color: black;
}
</style>
<%@ include file="xc2_default_labels.jsp" %>
<!-- Calendrier début -->
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="xc2_default.js"></script>
<script language="javascript" type="text/javascript">xcAutoHide=1000;</script>
<script language="javascript" type="text/javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->
<%@ include file="campaignFunctions_labels.jsp" %>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="JavaScript" type="text/javascript" src="trim.js"></script>
<script language="javascript" type="text/javascript" src="campaignFunctions.js"></script>
<script language="javascript" type="text/javascript">
var currentUserDbid = <%=currentUserDbid%>;
var numberOfPortsAvailable = <%=nbConfiguredPorts%>;
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

//get the list of existing cmps					
var campaignList = new Array();
var cur_jsCp = "";
<% 
for(int i=0; i<campaignListResult.size();i++)
{
	String curCp = (String)campaignListResult.elementAt(i).get("NAME");
%>
	cur_jsCp = "<%=curCp%>";
	campaignList.push(cur_jsCp);
<%
}
%>
</script>


<script language="javascript">
    // Associate a default button with pressing the Enter key
	function KeyDownHandler(btn)
    {
        // process only the Enter key
        if (event.keyCode == 13)
        {
            // cancel the default submit
            event.returnValue=false;
            event.cancel = true;
            // submit the form by programmatically clicking the specified button
            btn.click();
        }
    }
</script>

</head>
<body class="cam_body" text="#000000" vLink="#666666" link="#000066" onload="displayCampaignInfo();setDialingMode();">
	<div class="tab-pane" id="tabPane1">
		<form name="campaign" onKeyDown="KeyDownHandler(update)">
			<script type="text/javascript">
				tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
			</script>
			<div class="tab-page" id="tabGeneral">
				<h2 class="tab"><%=	pageCData.getWord("General")%></h2>
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
				<fieldset>
					<legend><%=	pageCData.getWord("General information")%></legend>
					<table>
						<tr>
							<td valign="top" align="left"><%=pageCData.getWord("Campaign name")%>&nbsp;&nbsp;</td>
							<td valign="top"><input type="text" onChange="enableUpdateButton()" onKeyUp="enableUpdateButton()" size="28" name="campaignName"></td>
						</tr>
						<tr>
							<td valign="top"><%=pageCData.getWord("Description")%>&nbsp;&nbsp;</td>
							<td valign="top"><textarea name="cmpDescription" rows="4" cols="52" onChange="enableUpdateButton()" >&nbsp;</textarea>
							</td>
						</tr>
						<tr>
							<td valign="top"><%=pageCData.getWord("Number of ports")%>&nbsp;&nbsp; </td>
							<td valign="top"><input type="text" onChange="enableUpdateButton()" size="8" name="cmp_NbrPorts">
							</td>
						</tr>
						<tr>
							<td valign="top"><%=pageCData.getWord("Caller ID")%>&nbsp;&nbsp; </td>
							<td valign="top"><input type="text" onChange="enableUpdateButton()" size="54" name="callerID"> 
								<br>
								<%=pageCData.getWord("Caller ID format")%>:" <%=pageCData.getWord("Caller ID name")%>" &lt;(514) 555-5555&gt;
							</td>
						</tr>
						<tr>
							<td valign="top" align="left"><%=pageCData.getWord("Active")%>&nbsp;&nbsp;&nbsp;
								<input onClick="enableUpdateButton()" type="checkbox" value="ON" name="cmpState">
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
			<div class="tab-page" id="tabCallingList">
				<h2 class="tab"><%=	pageCData.getWord("Calling lists")%></h2>
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabCallingList" ) );</script>
				<fieldset>
					<legend><%=	pageCData.getWord("Associated calling lists")%></legend>
					<table border="0">
						<tr>
							<td vAlign="top" align="left" width="25%" height="61"><%=	pageCData.getWord("Available calling lists")%>&nbsp;&nbsp;
							</td>
							<td vAlign="top" height="61"><div style="width: 400px; height: 175px; overflow: auto;">
								<table id="availableCallingList" cellSpacing="0" cellPadding="0" width="331" border="0">
									<tr>
										<td id="availableCallingListTD">
											<table border="0" cellpadding="0" cellspacing="1" width="100%">
												<tr>
													<td width="45" bgColor="#cccccc"><b><%=	pageCData.getWord("Active")%></b></td>
													<td width="226" bgColor="#cccccc"><b><%=pageCData.getWord("Calling list name")%></b></td>
													<td width="56" bgColor="#cccccc"><b><%=	pageCData.getWord("Weight")%></b></td>
												</tr>
<% 
ps = pageCData.buildPreparedStatement("SELECT name, IF(campaign_dbid=?, 1, 0) AS active, weight, dbid FROM cfg_calling_list "
															+ " WHERE TENANT_DBID=? AND state=TRUE AND campaign_dbid IN(?, 0) ORDER BY name");
ps.setInt(1, campaignID);
ps.setInt(2, tenantID);
ps.setInt(3, campaignID);
rs = ps.executeQuery();
while(rs.next()){
%>
												<tr id="availableCallingListTR" listName="<%= rs.getString(1) %>">
													<td width="45" align="center">
	<%if(rs.getBoolean(2)){%>
														<input id='<%= rs.getString(1) %>_check' type="checkbox" name="<%= rs.getString(1) %>_check" value="ON"  onClick="enableUpdateButton()" checked='checked'>				
	<%}else{ %>
														<input id='<%= rs.getString(1) %>_check' type="checkbox" name="<%= rs.getString(1) %>_check" value="ON"  onClick="enableUpdateButton()">
	<%} %>
													</td>
													<td width="226">
	<% if( pageCData.userHasRight(userRightsDataResult, "ALLOW_CALLING_LIST_MANAGEMENT") ){ 
		String linkCallingList  =  "modifyCallingList.jsp?dbid="+ rs.getInt(4)+ "&callinglistName="+ rs.getString(1)+ "&tenant_dbid="+ tenantDbid ;
		out.println( "<a href="+linkCallingList + " color='#000000'>" + rs.getString(1) + "</a>" );

	}else{
		out.print( rs.getString(1) );
	}
	%> 
													</td>
													<td width="56">
														<input id='<%= rs.getString(1) %>_weight' type="text" name="<%= rs.getString(1) %>_weight" size="3" value="<%= rs.getString(3) %>"  onChange="enableUpdateButton()">
													</td>
												</tr>		
<%}	%>
											</table>									
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
			<div class="tab-page" id="tabBlackList">
				<h2 class="tab"><%=	pageCData.getWord("Do-not-call lists")%></h2>
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabBlackList" ) );</script>
				<fieldset>
					<legend><%=	pageCData.getWord("Associated Do-not-call lists")%></legend>
					<table border="0">
						<tr>
							<td vAlign="top" height="61">
								<table id="availableBlackList" cellSpacing="0" cellPadding="0" width="331" border="0">
									<tr>
										<td height="21" align="center"><%=	pageCData.getWord("Available blacklist groups")%></td>
										<td></td>
										<td align="center"><%=	pageCData.getWord("Selected blacklist groups")%></td>
									</tr>
									<tr>
										<td width="200" height="138" align="center">
											<select id="availableBlackListGroups" width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="availableBlackListGroups" size="10" multiple onchange="enabledAddButton()"></select>
										</td>
										<td width="115" height="138" bordercolordark="#c0c0c0" nowrap align="center" valign="top">
											<div>
												<button name="addButton"  disabled onclick="switchOptionsFromSelectBoxes('availableBlackListGroups', 'selectedBlackListGroups');enableUpdateButton()" style="width:40px; height:26px; margin-top:25px; margin-bottom:25px;" type=button> &gt;&gt; </button>
											</div>
											<div>
												<button name="dropButton" disabled onclick="switchOptionsFromSelectBoxes('selectedBlackListGroups', 'availableBlackListGroups');enableUpdateButton()" style="WIDTH: 40px; HEIGHT: 26px" type=button> &lt;&lt; </button>
											</div>
										</td>
										<td width="200" height="138" bordercolor="#000000" align="left">
											<select id="selectedBlackListGroups" width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="selectedBlackListGroups" size="10" multiple onChange="enabledDropButton()"></select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
			<div class="tab-page" id="tabHours">
				<h2 class="tab"><%=	pageCData.getWord("Hours")%></h2>
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabHours" ) );</script>
				<fieldset>
					<legend><%=	pageCData.getWord("Campaign daily hours")%></legend>
					<table border="0">
						<tr>
							<td vAlign="top" align="left" ><%=	pageCData.getWord("Daily hours")%>&nbsp;&nbsp;</td>
							<td vAlign="top" height="80">
								<table>
									<tr>
										<td>&nbsp;</td>
										<td><%=	pageCData.getWord("Monday")%></td>
										<td><%=	pageCData.getWord("Tuesday")%></td>
										<td><%=	pageCData.getWord("Wednesday")%></td>
										<td><%=	pageCData.getWord("Thursday")%></td>
										<td><%=	pageCData.getWord("Friday")%></td>
										<td><%=	pageCData.getWord("Saturday")%></td>
										<td><%=	pageCData.getWord("Sunday")%></td>
									</tr>
									<tr>
										<td><%=	pageCData.getWord("From")%>&nbsp;</td>
										<td>
											<select onchange="enableUpdateButton()" name="daily_from_monday">
												<option value="-0200">24h</option>
												<option value="-0100"><%=	pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
										<td><%=pageCData.getWord("to")%>&nbsp;</td>
										<td>
											<select onchange="enableUpdateButton()" name="daily_to_monday">
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
												<option value="-0100"><%=pageCData.getWord("Close")%></option>
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
				<h2 class="tab"><%=pageCData.getWord("Mode")%></h2>
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabMode" ) );</script>
				<fieldset>
					<legend><%=pageCData.getWord("Dialing Mode")%></legend>
					<table border="0" width="100%">
						<tr>
							<td colspan="2">
								<div id="routing_script_div" style="margin: 0px 0px 0px 0px;display:;">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="224"><%=pageCData.getWord("Associated routing script")%>
											</td>
											<td>
												<select name="routing_script" style="margin-bottom:2px;">
													<option value=""></option>
												</select>
											</td>
										</tr>
									</table>
								</div>
								<div id="agent_group_div" style="margin: 0px 0px 0px 0px;display:; ">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="224">
												<%=pageCData.getWord("Agent group")%>
											</td>
											<td>
												<select onchange="enableUpdateButton()" size="1" name="AgentGroupSelection" style="margin-bottom:2px;">
												</select>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td vAlign="top" width="220"><%=pageCData.getWord("Dialing Mode")%></td>
							<td vAlign="top">
								<select onchange="setDialingMode()" size="1" name="dialingMode">
									<option value="PREVIEW"><%=pageCData.getWord("Preview mode")%></option>
									<option value="PROGRESSIVE"><%=pageCData.getWord("Progressive mode")%></option>
									<option value="PREDICTIVE" selected><%=pageCData.getWord("Predictive mode")%></option>
									<option value="BROADCAST"><%=pageCData.getWord("Broadcast mode")%></option>
								</select>
							</td>
						</tr>
						<tr>
							<td vAlign="top" width="220"><%=pageCData.getWord("Optimization parameter")%></td>
							<td vAlign="top">
								<select onchange="modifyTargetValue(this.value)" size="1" name="OptimizationParameter" style="margin-right:10px;">
									<option value="0"><%=pageCData.getWord("Agent Busy Factor")%></option>
									<option value="1" selected><%=pageCData.getWord("Overdial Rate")%></option>
								</select>
								&nbsp; <%=pageCData.getWord("Target")%> &nbsp; 
								<input type="text" maxLength="100" size="3" value="10" name="TargetValue"><b>%</b>&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td width="220">
								<%=pageCData.getWord("Abandon rate")%>
							</td>
							<td>
								<INPUT type="text" maxLength="3" size="3" value="5" name="AbandonRate"><b>%</b>
							</td>
						</tr>
						<tr>
							<td vAlign="top" align="left" colspan="2">
								<%=pageCData.getWord("Answering Machine Detection")%> &nbsp;&nbsp;&nbsp; 
								<input type="checkbox" onClick="enableUpdateButton();checkAnswerMachine()" checked="checked" name="AMD" id="AMD">
							</td>
						</tr>
						<tr>
							<td vAlign="top" align="left" colspan="2">
								<div id="leave_message_div" style="margin: 0px 0px 0px 0px;display:;">
									<table width="100%">
										<tr>
											<td>
												<%=pageCData.getWord("Leave a message if answering machine is detected")%>&nbsp;&nbsp;&nbsp;
												<input type="checkbox" onClick="enableUpdateButton()" id="leave_message" name="leave_message">
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
			
<% if(userManagementAllowed) { %>
			
			<div class="tab-page" id="tabSecurity">
				<h2 class="tab"><%=pageCData.getWord("Security")%></h2>
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabSecurity" ) );</script>
				<fieldset>
					<legend><%=pageCData.getWord("Security settings")%></legend>
					<table border="0">
						<tr>
							<td><%=pageCData.getWord("Not allowed users")%></td>
							<td>&nbsp;</td>
							<td><%=pageCData.getWord("Allowed users")%></td>
						</tr>
						<tr>
							<td align="center">
								<select id="notAllowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="notAllowedUsers" size="5" multiple="multiple">
	<%for(int i = 0; i < listNotAllowedUsersDataResult.size(); i++) {
		String userDbid = (String)listNotAllowedUsersDataResult.elementAt(i).get("USER_DBID");
		String userName = (String)listNotAllowedUsersDataResult.elementAt(i).get("USERNAME");
		if(userDbid.compareTo(currentUserDbid) != 0) {
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
	<%for(int i = 0; i < listAllowedUsersDataResult.size(); i++) {
		String userDbid = (String)listAllowedUsersDataResult.elementAt(i).get("USER_DBID");
		String userName = (String)listAllowedUsersDataResult.elementAt(i).get("USERNAME");
	%>
									<option value="<%=userDbid%>"><%=userName%></option>
	<%}	
	if(isNewResource) {%>
									<option value="<%=currentUserDbid%>"><%=currentUserName%></option>
	<%} %>
								</select>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
<% } %>		
			<input disabled  size="18" name="status" type="text" value="<%=pageCData.getWord("Not loaded")%>" >	
			<input disabled name="load" type="button" value="<%=pageCData.getWord("Load")%>" onClick="clickLoadButton()">
			<input disabled name="start" type="button" value="<%=pageCData.getWord("Start")%>" onClick="clickStartButton()">	

			<br><br>

			<input id="update" disabled name="updateInfo" type="button" value="<%=pageCData.getWord("Update")%>" onClick="validateInfo()">
			<input name="deleteCmp" type="button" value="<%=pageCData.getWord("Delete")%>" onClick="askDelete()">

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
	<div class="TempMessages" id="TempMessages"> 
		<table border="0" width="100%" cellpadding="0" cellspacing="0" height="100%">
			<tr> 
				<td width="100%" id="TempMsg" align="center" class="TempMsg"></td>
			</tr>
		</table>
	</div>
</body>
<%pageCData.closeConnection(); %>
</HTML>
