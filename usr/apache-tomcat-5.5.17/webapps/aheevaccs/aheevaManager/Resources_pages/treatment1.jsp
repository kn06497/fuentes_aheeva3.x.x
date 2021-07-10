<html>
<title>Add a Treatment </title>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import = "aheevaManager.ressources.*" %>

<title>Add a Treatment1 </title>


<%System.out.println(session.getAttribute("USER_LANGUAGE"));
String treatname=(request.getParameter("treatment_name")==null)?"":request.getParameter("treatment_name");
String tenant_dbid=(request.getParameter("tenant_dbid")==null)?"":request.getParameter("tenant_dbid");



////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();

%>




<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />

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
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript">
var tenant_dbid = "NULL";
var treatmentDBID = '';
var treatName='';

function enableUpdateButton()
{
	if(document.treatment.name.value.length > 0){
		document.treatment.updateInfo.disabled = false;
	}else{
		document.treatment.updateInfo.disabled = true;
	}
}

function displayTreatmentInfo()
{
	ourCaption  = document.getElementById("caption");
	treatName   = normalizeString(QueryString('treatment_name'));
	tenant_dbid	= normalizeString(QueryString('tenant_dbid'));
	var i;

	if (treatName== '')
	{
		ourCaption.innerHTML = "<%= pageData.getWord("Add a new treatment")%>";
		document.treatment.updateInfo.value = "<%= pageData.getWord("Save")%>";
	}
	else
	{
		ourCaption.innerHTML  = "<%= pageData.getWord("Modify treatment")%>";
		var treatmentDetails  =  String( appletObj.getTreatmentDetails(treatName) );
		// parse info received
		var jsDetails = treatmentDetails  + "";
		arrayDetails = jsDetails.split("|");
		for (i = 0; i <arrayDetails.length; i++)
		{
			if(i == 0)
				treatmentDBID = arrayDetails[i];
			else if (i == 1)
				document.treatment.name.value = arrayDetails[i];				
			else if(i == 2)
				document.treatment.description.value = arrayDetails[i] == 'NULL' ? '' : arrayDetails[i];
			else if (i == 3)
				document.treatment.callResult.value = arrayDetails[i];
			else if (i == 4)
				document.treatment.order.value = arrayDetails[i];
			else if (i == 5)
				document.treatment.interval.value = arrayDetails[i];
			else if (i == 6)
				document.treatment.increment.value = arrayDetails[i];
			else if (i == 7)
				document.treatment.attempts.value = arrayDetails[i];
			else if (i == 8)
			{
				//document.treatment.cycle_attempt.value = arrayDetails[i];
			}
			else if (i == 9)
			{
				if(arrayDetails[i] == '1')
					document.treatment.state.checked = true;
				else
					document.treatment.state.checked = false;
			}
			else if(i == 10)
				document.treatment.personal_callback_timeout.value = arrayDetails[i];
		}
	}
 }

function saveTreatment()
{
	var state = 0;
	if(document.treatment.state.checked)
		state = 1;
	else
		state = 0;

	var alReadyExist = false;
	var treatments = String(appletObj.getTreatmentByName(tenant_dbid));
	jstreatments = treatments.split("|");
	for(q = 0; q < jstreatments.length; q++)
	{
		if(document.treatment.name.value == jstreatments[q] && document.treatment.name.value != treatName) //le groupe existe deja						
		{
			alReadyExist = true;
			break;
		}
	}
	
	if(validation(document.treatment.name.value)==0 || !document.treatment.name.value.match(/^[a-zA-Z0-9\-\_]+$/)){
		alert('<%= pageData.getWord("Invalid use of character")%>');
		document.treatment.name.focus();
	}else if(validation(document.treatment.description.value)==0){
		alert('<%= pageData.getWord("Invalid use of character")%>');
		document.treatment.description.focus();	
	}else if(alReadyExist){
		alert('<%= pageData.getWord("Treatment already exists")%>');
	}else{
		appletObj.saveTreatmentInfo(treatmentDBID,tenant_dbid,
			document.treatment.name.value,
			document.treatment.description.value,
			document.treatment.callResult.value,
			document.treatment.order.value,
			document.treatment.interval.value,
			document.treatment.increment.value,
			document.treatment.attempts.value,
			"",//document.treatment.cycle_attempt.value,
			state,
			document.treatment.personal_callback_timeout.value);
		
		// disable the update button
		document.treatment.updateInfo.disabled = true;
	}
}

function askDelete()
{
	 answer = confirm('<%= pageData.getWord("Are you sure, you wish to delete this treatment? ")%>');
	if(answer)
	{
		appletObj.deleteTreatment(treatmentDBID);
		// refresh the current page
		document.location.href = "../defaultpage.htm";
	}
}

function checkCallResult()
{
	if(document.treatment.callResult.value == "agent_unavailable")
	{
		showLayer("agentUnavailable_Options");
		hideLayer("treatment_Options");
		//hideLayer("agentError_Options");
	}
	/*else if(document.treatment.callResult.value == "agent_error")
	{
		hideLayer("agentUnavailable_Options");
		hideLayer("treatment_Options");
		showLayer("agentError_Options");
	}*/
	else
	{
		hideLayer("agentUnavailable_Options");
		showLayer("treatment_Options");
		//hideLayer("agentError_Options");
	}
}

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

<body class="treat_body" onLoad="displayTreatmentInfo();checkCallResult()">
<div class="tab-pane" id="tabPane1">
<form name="treatment" onKeyDown="KeyDownHandler(update)">
	<script type="text/javascript">
		tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabGeneral">

		<fieldset>
		<legend id="caption"></legend>
<table width="75%">
	<tr>
		<td align="left" valign="top" style="padding-top:15px; padding-bottom:10px">
			<%= pageData.getWord("Name")%>
		</td>
		<td align="left" valign="top" style="padding-top:15px; padding-bottom:10px">
			<input name="name" size="37" onChange="enableUpdateButton()" style="float: left" >
		</td>
	</tr>
	<tr height="33px">
		<td align="left" valign="top">
			<%= pageData.getWord("Description")%>
		</td>
		<td valign="top">
			<textarea rows="3" name="description" cols="36" onChange="enableUpdateButton()"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td align="left" valign="top" style="padding-bottom:10px"> 
			<%= pageData.getWord("Call result")%>
		</td>
		<td valign="top" style="padding-bottom:5px">
			<select size="1" name="callResult" onChange="enableUpdateButton();checkCallResult()">
				<option value="busy"><%= pageData.getWord("Busy")%></option>
				<option value="abandoned"><%= pageData.getWord("Abandoned")%></option>
				<option value="no_answer"><%= pageData.getWord("No answer")%></option>
				<option value="answer_machine"><%= pageData.getWord("Answering machine")%></option>
				<option value="sit"><%= pageData.getWord("Sit")%></option>
				<option value="no_more_trunk"><%= pageData.getWord("No more trunk")%></option>
				<option value="agent_unavailable"><%= pageData.getWord("Agent Unavailable (Personal CallBack)")%></option>
				<!--<option value="agent_error">Agent Error (Personal CallBack)</option>-->
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" valign="top">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td nowrap valign="middle" align="right" width="135" style="padding-right:5px">
						<%= pageData.getWord("Order")%>
</td>
					<td valign="middle" align="left" width="80">
						<select size="1"  name="order" onChange="enableUpdateButton()">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</td>
					<td height="33" valign="middle" align="right" width="150" style="padding-right:5px">
						<%= pageData.getWord("Attempts")%>
					</td>
					<td height="33" align="left" valign="middle">
						<select size="1"  name="attempts" onChange="enableUpdateButton()">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
						</select>
					</td>
				</tr>
</table>
		</td>
	</tr>
	<tr>
		<td valign="top" colspan="2">
			<div id="treatment_Options" style="display:;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td nowrap valign="middle" align="right" width="135" style="padding-right:5px">
							<%= pageData.getWord("Interval (min)")%>
						</td>
						<td align="left" valign="middle" width="80">
							<select size="1"  name="interval" onChange="enableUpdateButton()">
								<option value="5">5</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
								<option value="35">35</option>
								<option value="40">40</option>
								<option value="45">45</option>
								<option value="50">50</option>
								<option value="55">55</option>
								<option value="60">60</option>
								<option value="75">75</option>
								<option value="90">90</option>
								<option value="120">2h</option>
								<option value="180">3h</option>
								<option value="300">5h</option>
								<option value="1440">1 <%= pageData.getWord("day")%></option>
								<option value="2880">2 <%= pageData.getWord("days")%></option>
								<option value="4320">3 <%= pageData.getWord("days")%></option>
								<option value="5760">4 <%= pageData.getWord("days")%></option>
								<option value="7200">5 <%= pageData.getWord("days")%></option>
								<option value="8640">6 <%= pageData.getWord("days")%></option>
								<option value="10080">1 <%= pageData.getWord("week")%></option></option>
							</select>
						</td>
						<td nowrap valign="middle" align="right" width="150" style="padding-right:5px">
							<%= pageData.getWord("Increment (min)")%>
						</td>
						<td align="left" valign="middle">
							<select size="1"  name="increment" onChange="enableUpdateButton()">
								<option value="0">0</option>
								<option value="5">5</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
								<option value="35">35</option>
								<option value="40">40</option>
								<option value="45">45</option>
								<option value="50">50</option>
								<option value="55">55</option>
								<option value="60">60</option>
								<option value="75">75</option>
								<option value="90">90</option>
								<option value="120">120</option>
								<option value="180">180</option>
								<option value="300">5h</option>
								<option value="1440">1 &nbsp; <%= pageData.getWord("day")%></option>
								<option value="2880">2 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="4320">3 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="5760">4 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="7200">5 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="8640">6 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="10080">1 &nbsp; <%= pageData.getWord("days")%></option>
							</select>
						</td>
						<!-- <td width="19%" height="33" align="left" valign="top" style="border-top-style: none; border-top-width: 1">
						<b>Attempt Cycle&nbsp;&nbsp;
						</b>
						</td>
						<td width="15%" height="33" align="left" valign="top" style="border-top-style: none; border-top-width: 1">
						<b>
						<select size="1"  name="cycle_attempt" disabled onChange="enableUpdateButton()">
						<option value="1" disabled >1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						</select>
						</b>
						</td>-->
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div id="agentUnavailable_Options" style="margin: 0px 0px 0px 0px;display:;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td nowrap valign="middle" align="right" width="370" style="padding-right:5px"><%= pageData.getWord("Personal CallBack time out (min)")%></td>
						<td valign="middle">
							<select size="1"  name="personal_callback_timeout" onChange="enableUpdateButton()">
								<option value="5">5</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
								<option value="35">35</option>
								<option value="40">40</option>
								<option value="45">45</option>
								<option value="50">50</option>
								<option value="55">55</option>
								<option value="60">60</option>
								<option value="75">75</option>
								<option value="90">90</option>
								<option value="120">120</option>
								<option value="180">180</option>
								<option value="300">5h</option>
								<option value="1440">1 &nbsp; <%= pageData.getWord("day")%></option>
								<option value="2880">2 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="4320">3 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="5760">4 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="7200">5 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="8640">6 &nbsp; <%= pageData.getWord("days")%></option>
								<option value="10080">1 &nbsp; <%= pageData.getWord("days")%></option>
							</select>
						</td>
					</tr>
				</table>
			</div><!--
			<div id="agentError_Options" style="margin: 0px 0px 0px 0px;display:;">
				<table>
					<tr>
						<td nowrap valign="middle"><b>Action on agent error</b></td>
						<td valign="middle">
							<select size="1" name="agent_error_action" onChange="enableUpdateButton()">
								<option value="hang_up">Hang Up</option>
								<option value="distribute_other_agent">Distribute to another agent</option>
								<option value="queue_script">Queue until agent is ready</option>
							</select>
						</td>
					</tr>
				</table>
			</div>-->
		</td>
	</tr>
	<tr>
		<td height="33px" align="left" valign="top" colspan="2">
			<span style="padding-right:0px; width:135px; text-align:right;"><%= pageData.getWord("Active")%></span><input type="checkbox" name="state" value="ON" onClick="enableUpdateButton()">
		</td>
	</tr>
</table>
<script>document.write("<input disabled=\"true\"  id=\"update\" name=\"updateInfo\" type=\"button\" value=\"<%=pageData.getWord("Update")%>\" onClick=\"saveTreatment()\" style=\"margin-left:140px;\">")</script>

&nbsp;&nbsp;
<script language="JavaScript">
	var treatmentName = normalizeString(QueryString('treatment_name'));

	if (treatmentName== '')
	{
		document.write('&nbsp;');
	}
	else
	{
		document.write(' <input type="button" name="deleteAgt" onclick="askDelete()"  value="<%=pageData.getWord("Delete")%>">');
	} 
</script>
		</fieldset>
	</div>
   </form>
  </div>
</body>
<% pageData.closeConnection(); %>
</html>