<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "aheevaManager.ressources.*" %>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
	String tenantDbid = request.getParameter("tenant_dbid");
	String queueName = request.getParameter("queue_name");
	QueueManagement vQueue = new QueueManagement(queueName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Add an agent</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
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
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language=JavaScript src="jsUtil.js"></script>
<script language=javascript src="Browser.js" type=text/javascript></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language=javascript type=text/javascript>
var queueName = "<%=queueName%>";
var dbid = "<%=vQueue.getDbid() > 0 ? vQueue.getDbid() : 0 %>";
var tenant_dbid = "<%=tenantDbid%>";

function enableUpdateButton()
{
	document.getElementById("updateInfo").disabled = false;
}

function disableUpdateButton()
{
	document.getElementById("updateInfo").disabled = true;
}

function enableReload()
{
   appletObj.fReloadMenu = true;
}

function recalculateCounter(counterId, selectOneId, selectTwoId)
{
	var counter = document.getElementById(counterId);
	if(counter)
	{
		var selectObj = document.getElementById(selectOneId);
		if(selectObj)
			counter.value = selectObj.length;
		else
			counter.value = 0;
	}
	//Now let's sort the select objects
	var selectOne = document.getElementById(selectOneId);
	if(selectOne)
		sortSelectBox(selectOne);

	var selectTwo = document.getElementById(selectTwoId);
	if(selectTwo)
		sortSelectBox(selectTwo);
}

function validateInfo()
{
	var o;
	var SVL_answered = "";
	var SVL_abandonned = "";

	if (!IsInteger(document.getElementById("threshold_answered").value))
	{
		alert(MultiArray["The longest waiting time for response must be in seconds"][lang]);
	}
	else if(!IsInteger(document.getElementById("threshold_abandonned").value))
	{
		alert(MultiArray["The abandoned shortest time must be in seconds"][lang]);
	}
	else if( parseInt(document.getElementById("threshold_abandonned").value) >= parseInt(document.getElementById("threshold_answered").value))
	{
		alert(MultiArray["The abandoned shortest time must be less than the longuest waiting time for response"][lang]);
	}
	else if(document.queue.serviceLevel_answered.options.length != 10)
	{
		alert(MultiArray["Select 10 values for service level answered times"][lang]);
	}
	else if(document.queue.serviceLevel_abandonned.options.length != 10)
	{
		alert(MultiArray["Select 10 values for service level answered times"][lang]);
	}
	else
	{
		for (var i = 0; i < document.queue.serviceLevel_answered.options.length; i++)
		{
			o = document.queue.serviceLevel_answered.options[i];
			SVL_answered = SVL_answered + o.value + "/";
		}
		SVL_answered = SVL_answered.substring(0, SVL_answered.length - 1); // remove the last '/'

		for (var i = 0; i < document.queue.serviceLevel_abandonned.options.length; i++)
		{
			o = document.queue.serviceLevel_abandonned.options[i];
			SVL_abandonned = SVL_abandonned + o.value + "/";
		}
		SVL_abandonned = SVL_abandonned.substring(0, SVL_abandonned.length - 1); // remove the last '/'
		alert("dbid: " + dbid
			+ "\ntenant_dbid: " + tenant_dbid
			+ "\nq_name: " + queueName
			+ "\nt_answ: " +  document.getElementById("threshold_answered").value
			+ "\nt_aband: " + document.getElementById("threshold_abandonned").value
			+ "\n svlansw: " + SVL_answered
			+ "\n svlaban: " + SVL_abandonned);
		appletObj.saveQueue(dbid, tenant_dbid, queueName, document.getElementById("threshold_answered").value,
							document.getElementById("threshold_abandonned").value,
							SVL_answered, SVL_abandonned);
		disableUpdateButton();
	}
}
</script>
</head>
<body class="bottompagebody">
<div class="tab-pane" id="tabPane1">
<form name="queue" >
	<script type="text/javascript">
		tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><%=pageData.getWord("Service factor")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<fieldset>
			<legend class="contentTitles"><%=queueName%> - <%=pageData.getWord("General information for service factor")%></legend>
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="80%">
				<tr height="50px">
					<td width="40%">
						<%=pageData.getWord("Longest waiting time for response")%>
					</td>
					<td align="left" width="60%">
						<input id="threshold_answered" type="text" value="<%=vQueue.getThresholdAnswered()%>" onChange="enableUpdateButton()"  size="10" name="threshold_answered">sec
					</td>
				</tr height="50px">
					<td width="40%">
						<%=pageData.getWord("Shortest time for abandon")%>
					</td>
					<td align="left" width="60%">
						<input id="threshold_abandonned" type="text" value="<%=vQueue.getThresholdAbandoned()%>" onChange="enableUpdateButton()" size="10" name="threshold_abandonned">sec
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div class="tab-page" id="tabAns">
		<h2 class="tab"><%=pageData.getWord("Service level")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabAns" ) );</script>
		<fieldset>
			<legend class="contentTitles"><%=queueName%> - <%=pageData.getWord("Answered times")%></legend>
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
				<tr>
					<td align="center">
						<select id="availableANS_Level" name="availableANS_Level" multiple="multiple" onchange="enableUpdateButton()" style="width:200px" size="5">
						<%
						for(int i = 1; i <= 180; i++) {
							if((i <= 60 || i % 15 == 0) && !vQueue.getServiceLevelAnsweredValues().contains(i)) {
						%>
							<option value="<%=i%>"><%=pageData.getWord("Within")%> <%=i%> sec</option>
						<%		
							}
						}
						%>
						</select>
					</td>
					<td align="center" width="10%">
						<img src="../img/left_to_right.gif" alt=">>" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('availableANS_Level', 'serviceLevel_answered');recalculateCounter('nb_ans_for_svl_select', 'serviceLevel_answered', 'availableANS_Level')" /><br><br>
						<img src="../img/right_to_left.gif" alt="<<" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('serviceLevel_answered', 'availableANS_Level');recalculateCounter('nb_ans_for_svl_select', 'serviceLevel_answered', 'availableANS_Level')"/>
					</td>
					<td align="center" >
						<select id="serviceLevel_answered" name="serviceLevel_answered" multiple onChange="enableUpdateButton()" style="width:200px" size="5">
						<%
						for(int i = 0; i < vQueue.getServiceLevelAnsweredValues().size(); i++) { 
						%>
							<option value="<%=vQueue.getServiceLevelAnsweredValues().elementAt(i)%>"><%=pageData.getWord("Within")%> <%=vQueue.getServiceLevelAnsweredValues().elementAt(i)%> sec</option>
						<%
						} 
						%>
						</select>
					</td>
					<td align="right" valign="bottom" width="10%">
						<input name="nb_ans_for_svl_select" id="nb_ans_for_svl_select" type="text" size="2" disabled value="10">
					</td>
				</tr>
			</table>
		</fieldset>
		<br /><br />
		<fieldset>
			<legend class="contentTitles"><%=queueName%> - <%=pageData.getWord("Abandonned times")%></legend>
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
				<tr>
					<td align="center">
						<select id="availableABD_Level" name="availableABD_Level" multiple onChange="enableUpdateButton()" style="width:200px" size="5">
						<%
						for(int i = 1; i <= 180; i++) {
							if((i <= 60 || i % 15 == 0) && !vQueue.getServiceLevelAbandonedValues().contains(i)) {
						%>
							<option value="<%=i%>"><%=pageData.getWord("Within")%> <%=i%> sec</option>
						<%
							}
						}
						%>
						</select>
					</td>
					<td align="center" width="10%">
						<img src="../img/left_to_right.gif" alt=">>" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('availableABD_Level', 'serviceLevel_abandonned');recalculateCounter('nb_abd_for_svl_select', 'serviceLevel_abandonned', 'availableABD_Level')" /><br><br>
						<img src="../img/right_to_left.gif" alt="<<" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('serviceLevel_abandonned', 'availableABD_Level');recalculateCounter('nb_abd_for_svl_select', 'serviceLevel_abandonned', 'availableABD_Level')"/>
					</td>
					<td align="center">
						<select id="serviceLevel_abandonned" name="serviceLevel_abandonned" multiple onChange="enableUpdateButton()" style="width:200px" size="5">
						<%
						for(int i = 0; i < vQueue.getServiceLevelAbandonedValues().size(); i++) {
						%>
							<option value="<%=vQueue.getServiceLevelAbandonedValues().elementAt(i)%>"><%=pageData.getWord("Within")%> <%=vQueue.getServiceLevelAbandonedValues().elementAt(i)%> sec</option>
						<%			
						}
						%>
						</select>
					<td align="right" valign="bottom" width="10%">
						<input name="nb_abd_for_svl_select" id="nb_abd_for_svl_select" type="text" size="2" disabled value="10">
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<input disabled="disabled" name="updateInfo" type="button" value="<%=pageData.getWord("Update")%>" onclick="validateInfo()" />
</form>
<script type="text/javascript">
	setupAllTabs();
</script>
</div>
<% pageData.closeConnection(); %>
</body>
</html>
