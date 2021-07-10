<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "aheevaManager.ressources.*" %>
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
	
	String tenantDbid = request.getParameter("tenant_dbid");
	
	String userPreferencesQuery = "SELECT * FROM cfg_user_live_stats_preferences WHERE USER_DBID='"+currentUserDbid+"'";
	

	pageData.openConnection();
	pageData.executeFromString(userPreferencesQuery);
	Vector <HashMap<String,String>> userPreferences = pageData.CreateVectorFromBean();

	
	
%>

<!-- Start Tab pane -->
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {
	/*background:	ThreeDFace;*/
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
<%@ include file="agentGroupFunctions_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="agentGroupFunctions.js"></script>
<script language="javascript" type="text/javascript">

function setDefault()
{
	var myform = document.userPreferencesForm;
	
	alert("<%=pageData.getWord("Live statistics preferences will be set to default values.")%>");
	myform.refresh_rate.value="7";
	myform.have_agent_stats.checked=true;
	myform.have_agent_group_stats.checked=true;
	myform.have_queue_stats.checked=true;
	myform.have_campaign_stats.checked=true;
	myform.have_calling_list_stats.checked=true;
	myform.have_performance_stats.checked=true;
	myform.have_team_stats.checked=true;
	myform.have_line_management_stats.checked=true;
	myform.have_adherence_stats.checked=true;
	
}
var rate;
function validateBeforeSubmit()
{
	var myform = document.userPreferencesForm;
	
	rate = parseInt(myform.refresh_rate.value)*1000;
	
	if(IsNumeric(myform.refresh_rate.value)==false)
	{
		alert("<%=pageData.getWord("Please, select a refresh rate between 7 and 3600 seconds.")%>");
		return false;

	}
	else 
	{
		if(rate < 7000 || rate > 3600000 )
		{
			alert("<%=pageData.getWord("Please, select a refresh rate between 7 and 3600 seconds.")%>");
			return false;
		}
	}
	
	if(myform.have_agent_stats.checked==false &&
	myform.have_agent_group_stats.checked==false &&
	myform.have_queue_stats.checked==false &&
	myform.have_campaign_stats.checked==false &&
	myform.have_calling_list_stats.checked==false &&
	myform.have_performance_stats.checked==false &&
	myform.have_team_stats.checked==false &&
	myform.have_line_management_stats.checked==false &&
	myform.have_adherence_stats.checked==false)
	{
		alert("<%=pageData.getWord("Select at least one type of live statistic to visualize")%>");
		return false;
	}
	
	sendUpdate();
}

function sendUpdate()
{
	var myform = document.userPreferencesForm;
	var tosend;
	tosend=<%=currentUserDbid%>+"^"+rate;
	
	if(myform.have_agent_stats.checked)
	{
		tosend=tosend+"^1";
	}
	else
	{
		tosend=tosend+"^0";
	}
	
	if(myform.have_agent_group_stats.checked)
	{
		tosend=tosend+"^1";
	}
	else
	{
		tosend=tosend+"^0";
	}
	
	if(myform.have_queue_stats.checked)
	{
		tosend=tosend+"^1";
	}
	else
	{
		tosend=tosend+"^0";
	}
	
	if(myform.have_calling_list_stats.checked)
	{
		tosend=tosend+"^1";
	}
	else
	{
		tosend=tosend+"^0";
	}
	
	if(myform.have_campaign_stats.checked)
	{
		tosend=tosend+"^1";
	}
	else
	{
		tosend=tosend+"^0";
	}

	if(myform.have_performance_stats.checked)
	{
		tosend=tosend+"^1";
	}
	else
	{
		tosend=tosend+"^0";
	}
	
	if(myform.have_team_stats.checked)
	{
		tosend=tosend+"^1";
	}
	else
	{
		tosend=tosend+"^0";
	}

	if(myform.have_line_management_stats.checked)
	{
		tosend=tosend+"^1";
	}
	else
	{
		tosend=tosend+"^0";
	}
	
	if(myform.have_adherence_stats.checked)
	{
		tosend=tosend+"^1";
	}
	else
	{
		tosend=tosend+"^0";
	}
	
	appletObj.modifyUserLiveStatsPreferences(tosend);
}

</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css">
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css">
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style.css">
<link href="livestats.css" 	rel="stylesheet" type="text/css">
<meta http-equiv="Content-Language" content="en-us">
</head>
<body class="use_pref_body">
	<div class="tab-pane" id="tabPane1">
		<form name="userPreferencesForm" id="userPreferencesForm">
			<script type="text/javascript">
				tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
			</script>
			<div class="tab-page" id="tabGeneral">
				<fieldset>
				<legend><%=pageData.getWord("USER LIVE STATISTICS MANAGEMENT")%></legend>
				  <table width="100%">
				    <tr>
				      <td colspan="2"><p align="center" class="style1"><b><%=pageData.getWord("Enter your live statistics view settings")%> </b></p><br/>
				  	</td>
				   </tr>
				    <tr> 
				      <td width="50%">
							<div align="right" class="style1"><%=pageData.getWord("Refresh rate")%> </div>
						</td>
				      	<td width="50%"> 
				        	<div align="left"><span class="style1"> 
				          		<input name="refresh_rate" type="text" id="refresh_rate" value="<%=Integer.parseInt(userPreferences.elementAt(0).get("REFRESH_RATE"))/1000%>" size="5" maxlength="4">
				          <%=pageData.getWord("seconds")%></span></div></td>
				    </tr>
				    <tr> 
				      <td width="50%">
				<div align="right" class="style1"><%=pageData.getWord("Agents")%> </div></td>
				      <td width="50%"> 
				        <div align="left"><span class="style1"> 
				          <input name="have_agent_stats" type="checkbox" id="have_agent_stats" <%=userPreferences.elementAt(0).get("AGENT_STATS").compareTo("1")==0?"checked":""%> 
					  onClick="">
				          </span></div></td>
				    </tr>
				    <tr> 
				      <td width="50%">
				<div align="right" class="style1"><%=pageData.getWord("Agent groups")%> </div></td>
				      <td width="50%"> 
				        <div align="left"><span class="style1"> 
				          <input name="have_agent_group_stats" type="checkbox" id="have_agent_group_stats" <%=userPreferences.elementAt(0).get("AGENT_GROUP_STATS").compareTo("1")==0?"checked":""%>>
				          </span></div></td>
				    </tr>
				    <tr> 
				      <td width="50%" class="style1">
				<div align="right" class="style1"><%=pageData.getWord("Queues")%> </div></td>
				      <td width="50%"> 
				        <div align="left"><span class="style1"> 
				          <input name="have_queue_stats" type="checkbox" id="have_queue_stats" <%=userPreferences.elementAt(0).get("QUEUE_STATS").compareTo("1")==0?"checked":""%>>
				          </span></div></td>
				    </tr>
				    <tr> 
				      <td width="50%" align="right"> 
				        <div align="right" class="style1"><%=pageData.getWord("Campaigns")%> </div></td>
				      <td width="50%" align="left"> 
				        <div align="left"><span class="style1"> 
				          <input name="have_campaign_stats" type="checkbox" id="have_campaign_stats" <%=userPreferences.elementAt(0).get("CAMPAIGN_STATS").compareTo("1")==0?"checked":""%>>
				          </span></div></td>
				    </tr>
				    <tr> 
				      <td width="50%" align="right"> 
				        <div align="right" class="style1"><%=pageData.getWord("Calling lists")%> </div></td>
				      <td width="50%" align="left"> 
				        <div align="left"><span class="style1"> 
				          <input name="have_calling_list_stats" type="checkbox" id="have_calling_list_stats" <%=userPreferences.elementAt(0).get("CALLING_LIST_STATS").compareTo("1")==0?"checked":""%>>
				          </span></div></td>
				    </tr>
				    <tr> 
				      <td width="50%" align="right"> 
				        <div align="right" class="style1"><%=pageData.getWord("Performance")%> </div></td>
				      <td width="50%" align="left"> 
				        <div align="left"><span class="style1"> 
				          <input name="have_performance_stats" type="checkbox" id="have_performance_stats"<%=userPreferences.elementAt(0).get("PERFORMANCE_STATS").compareTo("1")==0?"checked":""%>>
				          </span></div></td>
				    </tr>
				    <tr> 
				      <td width="50%" align="right"> 
				        <div align="right" class="style1"><%=pageData.getWord("Teams")%> </div></td>
				      <td width="50%" align="left"> 
				        <div align="left"><span class="style1"> 
				          <input name="have_team_stats" type="checkbox" id="have_team_stats" <%=userPreferences.elementAt(0).get("TEAMS_STATS").compareTo("1")==0?"checked":""%>>
				          </span></div></td>
				    </tr>
				    <tr> 
				      <td width="50%" align="right"> 
				        <div align="right" class="style1"><%=pageData.getWord("Adherence")%> </div></td>
				      <td width="50%" align="left"> 
				        <div align="left"><span class="style1"> 
				          <input name="have_adherence_stats" type="checkbox" id="have_adherence_stats" <%=userPreferences.elementAt(0).get("ADHERENCE_STATS").compareTo("1")==0?"checked":""%>>
				          </span></div></td>
				    </tr>
				    <tr> 
				      <td width="50%" align="right"> 
				        <div align="right" class="style1"><%=pageData.getWord("Line management")%></div></td>
				      <td width="50%" align="left"> 
				        <div align="left"><span class="style1"> 
				          <input name="have_line_management_stats" type="checkbox" id="have_line_management_stats" <%=userPreferences.elementAt(0).get("LINE_MANAGEMENT_STATS").compareTo("1")==0?"checked":""%>>
				          </span></div></td>
				    </tr>
				
				  </table>
				 
				  <div align="center"><br>
				    <br>
				    <input name="submit" id="submit" value="<%=pageData.getWord("Update")%>" type="button" onClick="validateBeforeSubmit()"> 
				    <input name="setToDefault" id="setToDefault" value="<%=pageData.getWord("Default")%>" type="button" onClick="setDefault()">
				  </div>
				 </fieldset>
			</div>
		</form>
	</div>
</body>
<% pageData.closeConnection(); %>
</html>
