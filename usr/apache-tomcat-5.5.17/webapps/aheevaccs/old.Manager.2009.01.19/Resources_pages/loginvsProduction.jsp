

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.io.*"%>
<%@page import ="Manager.wfm.*"%>
<%@page import ="java.util.StringTokenizer"%>
<%@page session="true"%>
<jsp:useBean id="beanAgentLoginProdReportObj" scope="session" class="Manager.wfm.beanAgentLoginProdReport" />

<html>
<head>

<%

if( beanAgentLoginProdReportObj == null )
	beanAgentLoginProdReportObj = new beanAgentLoginProdReport();
else
	System.out.println("beanAgentLoginProdReportObj already exists !");
	
beanAgentLoginProdReportObj.setTenantDBID(request.getParameter("tenant_dbid"));
String reportDate = request.getParameter("startDate");
String agentGroupId = request.getParameter("agentGroupId");
String thisDayIsClosed = request.getParameter("dayClosed");
String viewExceptions = request.getParameter("viewExceptionObj");

String fromDate = request.getParameter("dateFrom");
String toDate = request.getParameter("dateTo");

String tenant_dbid = request.getParameter("tenant_dbid");
String agentId = request.getParameter("agentId");
String submitRequest = request.getParameter("viewData");
String sessionParams = request.getParameter("sessionParams");
String submitRequest2 = request.getParameter("saveAddedRows");


if(sessionParams != null && sessionParams.compareTo("init") == 0)
{
	beanAgentLoginProdReportObj.hasExtractData = false;
    beanAgentLoginProdReportObj.m_gAllDetails.clear();
	beanAgentLoginProdReportObj.m_AllExceptions.clear();
}

%>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link rel="stylesheet" href="xc2_default.css" type="text/css">
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
	background:	;
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
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<!-- Calendrier début -->
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->

<script language="javascript" type="text/javascript">

var tenant_dbid  = normalizeString(QueryString('tenant_dbid'));
var startDate = normalizeString(QueryString("startDate"));
var agentGroupId = normalizeString(QueryString("agentGroupId"));
var agentId = normalizeString(QueryString("agentId"));
var dataExtracted = normalizeString(QueryString("viewData"));

</script>
<%
out.write("<script>agentGroupId = '"+agentGroupId+"'</script>");
out.write("<script>agentId = '"+agentId+"'</script>");
out.write("<script>tenant_dbid = '"+tenant_dbid+"'</script>");
out.write("<script>dataExtracted = '"+submitRequest+"'</script>");
out.write("<script>startDate = '"+reportDate+"'</script>");
%>
<script>
var userid = appletObj.getCurrentUserDBID();

function toggleLayer(whichLayer)
{
	if (document.getElementById)
	{
		// this is the way the standards work
		//if (document.getElementById("objects").value != '')
		//{
			var style2 = document.getElementById(whichLayer).style;
			style2.display = style2.display? "":"none";
		//}
	}
	else if (document.all)
	{
		// this is the way old msie versions work
		var style2 = document.all[whichLayer].style;
		style2.display = style2.display? "":"none";
	}
	else if (document.layers)
	{
		// this is the way nn4 works
		var style2 = document.layers[whichLayer].style;
		style2.display = style2.display? "":"none";
	}
}


function enableOverrideTime(checkoverrideid)
{
	var id = checkoverrideid.substring(13, checkoverrideid.length);
	if (document.getElementById(checkoverrideid).checked == true)
	{
		alert(MultiArray["Don't forget to select an override cause"][lang]);
		document.getElementById("correctiontime"+id).disabled = false;
		document.getElementById("selectoverridecause"+id).disabled = false;
		document.getElementById("overridecause"+id).disabled = false;
	}
	else
	{
		document.getElementById("overridetime"+id).value = "00:00:00";
		document.getElementById("correctiontime"+id).value = "00:00:00";
		document.getElementById("correctiontime"+id).disabled = true;
		document.getElementById("selectoverridecause"+id).disabled = true;
		document.getElementById("overridecause"+id).disabled = true;
	}
}


function viewOverrideCause(id)
{
  	var agt_id = id.substring(19, id.length);
	if (document.getElementById(id).value == "Other")
		document.getElementById("overridecause"+agt_id).style.visibility = 'visible';
	else
		document.getElementById("overridecause"+agt_id).style.visibility = 'hidden';

}

function fillObjectCombo(groupBox, agentBox, viewBox)
{
	if(agentBox.options.length <= 1 )
	{
		var agents = String( appletObj.getAgentsByName(tenant_dbid) );
		var o = new Array();

		//Fill agents combo box with agents name
        var jsAgents = agents + "";
    	arrayAgents = jsAgents.split("|");
    	if(agents.length > 0 )
		{
    		for (j = 0; j <arrayAgents.length; j++)
			{
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if ( viewBox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents [j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)

				o[o.length]= myOption;
    		}
			
		}

		//Sort the object
		sortSelect(o);
		for (var i=0; i<o.length; i++)
		{
			agentBox.options[i+1] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}

	}

	if(groupBox.options.length <= 1 )
	{
		var agentGroups = String( appletObj.getAgentGroupDbidAndName(tenant_dbid) ); // dbid. name
		var jsAgentGroups = agentGroups + "";
		var arrayGroups = jsAgentGroups.split("|");
		for (j = 0; j < arrayGroups.length; j++)
		{
			var agtGrp = arrayGroups[j].split(",");
			myOption = new Option(agtGrp[1],agtGrp[0])
			optionPos = groupBox.options.length
			groupBox.options[optionPos]=myOption
		}
	 }
}



function getAgentsInGroup(groupBox, agentBox, viewBox)
{
	var o = new Array();
	if(groupBox.value =='AllGroups')
	{
		//Empty the agent group combo box
		groupBox.options.length=1;
		agentBox.length = 0;
        var defaultvalue =  "- All Agents -" ;
		myOption = new Option(defaultvalue,"AllAgents")
		optionPos = agentBox.options.length
		agentBox.options[optionPos]=myOption

		fillObjectCombo(groupBox, agentBox, viewBox);
	}
	else
	{

		var agtGroupName = "";
		for (var i = 0; i < groupBox.length; i++)
		{
			if (groupBox.options[i].selected == true)
			{
				agtGroupName = groupBox.options[i].text;
				break;
			}
		}

		var agents = String( appletObj.getAvailableAgentListInGroupByStatus(agtGroupName,1) );
		var jsAgents = agents + "";

		// Remove all agents from agents option field
		var i=agentBox.options.length;
        if (i>0){
              agentBox.length = 0;
        }
        var defaultvalue =  "- All Agents -" ;
		myOption = new Option(defaultvalue,"AllAgents")
		o[o.length]= myOption;

		if(agents.length > 0 ){
			arrayAgents = jsAgents.split("|");
    		for (j = 0; j <arrayAgents.length; j++){
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if ( viewBox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents [j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)

				o[o.length]= myOption;

			}
         }

	}

	sortSelect(o);

	for (var i=0; i<o.length; i++) {
		agentBox.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}

	return;
}

function changeAgentListView(groupBox, agentBox, viewBox)
{
	var agents;
	var name="";
	var o = new Array();
	agentBox.length = 0;
    var defaultvalue =  "- All Agents -" ;
	myOption = new Option(defaultvalue,"AllAgents")
	o[o.length]=myOption
		
	
	if(groupBox.value == 'AllGroups')
		agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
	else
		agents = String( appletObj.getAvailableAgentListInGroupByStatus(groupBox.options[groupBox.selectedIndex].text,1) );

	var jsAgents = agents + "";
	//alert(jsAgents);
    arrayAgents = jsAgents.split("|");
    for (j = 0; j <arrayAgents.length; j++)
	{
		  var iStartPos = arrayAgents[j].indexOf('[');
		  var iEndPos   = arrayAgents[j].indexOf(']');
		  var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
		  name = login+'['+arrayAgents[j].substr(0,iStartPos)+']'
		  if ( viewBox.checked == false)  // show agents name as : firstname, lastname[login]
			myOption = new Option(arrayAgents[j],login);  
		  else // show agents name as : login[firstname, lastname]
			myOption = new Option(name,login);
		  o[o.length]=myOption
   }   
		
	if (viewBox.checked == false)	
	{
   		o = o.sort(
			function(a,b) 
			{
				if ((a.text+"") < (b.text+"")) { return -1; }
				if ((a.text+"") > (b.text+"")) { return 1; }
				return 0;
			}
		);
	}
	else
	{
		o = o.sort(
			function(a,b) 
			{
				if (parseInt(a.value) < parseInt(b.value)) { return -1; }
				if (parseInt(a.value) > parseInt(b.value)) { return 1; }
				return 0;
			}				
		);   	
	}	
   
	
	for (var i=0; i<o.length; i++) 
	{
		agentBox.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}

  //sortSelect(agentBox);
}

function convertTimeToSeconds(time)
{
	total_time = 0;
	hour = 0;
	minute = 0;
	second = 0;
	if(time.indexOf(":") != -1)
	{
		time_array = time.split(":");
		hour = time_array[0] != null && IsNumeric(time_array[0]) ? time_array[0] : 0;
		minute = time_array[1] != null && IsNumeric(time_array[0]) ? time_array[1] : 0;
		second = time_array[2] != null && IsNumeric(time_array[0]) ? time_array[2] : 0;
	}
	else
		hour = time;
	total_time += hour * 3600 + minute * 60 + second * 1;
	return total_time;
}

function buildOverrideTime(id, time_format)
{
	var override_time = 0;
	var time_format_sec = 0;
	var agt_id = id.substring(14, id.length);
	var paid_time = document.getElementById("paidtime"+agt_id).value;
	//alert(convertTimeToSeconds(paid_time));
	
	if (time_format.substring(0, 1) == '-')
	{
		time_format_sec = time_format.substring(1, time_format.length);
		//alert(convertTimeToSeconds(time_format_sec));
		override_time = convertTimeToSeconds(paid_time) - convertTimeToSeconds(time_format_sec);
	}
	else
	{
		time_format_sec = time_format.substring(0, time_format.length);
		//alert(convertTimeToSeconds(time_format_sec));
		override_time = convertTimeToSeconds(paid_time) + convertTimeToSeconds(time_format_sec);
	}
	
	var dest_id = "overridetime"+agt_id;
	//alert(override_time);
	var override_hour = override_time / 3600;
	//alert(override_hour);
	buildReadableTime(dest_id, override_hour);
}

function buildCorrectionTime(id, value)
{
	if (value.substring(0, 1) == '-')
	{
		document.getElementById(id).value = "(" + value.substring(1, value.length) + ")";
	}
	else
	{
		document.getElementById(id).value = value;
	}
	
}


function buildReadableTime(id, time_hr)
{
	var signe = 1;
	if (time_hr < 0)
	{
		signe = -1;
		time_hr = -1*time_hr;
	}
	var time_sec = time_hr*3600;
	var time = "";
	var hours = 0;
	var minutes = 0;
	var seconds = 0;

	if (time_hr < 0)
	{
		time_sec = -1*time_sec;
	}
	hours = parseInt(time_sec / 3600);
	if ((hours < 10) && (hours > 0))
	{
		time += "0";
		time += hours;
	}
	else if ((hours >= 10) && (hours > 0))
		time += hours;
	if (hours == 0)
		time += "00";
	time += ":";

	minutes = parseInt((time_sec - hours * 3600) / 60);
	if ((minutes < 10) && (minutes > 0))
	{
		time += "0";
		time += minutes;
	}
	else if ((minutes >= 10) && (minutes > 0))
		time += minutes;
	if (minutes == 0)
		time += "00";
	time += ":";

	seconds = parseInt((time_sec - minutes * 60) % 3600);
	if (seconds < 10)
	{
		time += "0";
		time += seconds;
	}
	else
		time += seconds;

	if (signe == -1)
	{
		time = "(" + time + ")";
	}

	document.getElementById(id).value = time;
}

function extractAllData()
{
	var startDate = document.getElementById("reportDate").value;
	var agentGroupId = document.getElementById("agtGrp").value;
	//var agentId = document.getElementById("objects").value;
	var agentId = '';
	document.getElementById("agtGrp").disabled = false;
	document.location = "./loginvsProduction.jsp?type=report&userid="+userid+"&viewData=true&saveAddedRows=&startDate="+startDate+"&agentGroupId="+agentGroupId+"&agentId="+agentId+"&tenant_dbid="+tenant_dbid;
	
}


function displayOverrideCause(id_suff, comments)
{
	if (comments == 'No comments' || comments == ' '  || comments == 'null')
	{
	}
	else
	{
		document.getElementById("selectoverridecause" + id_suff).disabled = true;
		if (comments.length >= 5 && comments.substring(0, 5) != 'Other')
		{
			selectObject(document.getElementById("selectoverridecause" + id_suff), comments);
		}
		else
		{
			document.getElementById("overridecause"+id_suff).style.visibility = 'visible';
			document.getElementById("overridecause" + id_suff).disabled = true;
			var custom_comments = comments.split("~");
			selectObject(document.getElementById("selectoverridecause" + id_suff), custom_comments[0]);
			document.getElementById("overridecause" + id_suff).value = custom_comments[1];
		}
	}

}

var chaine1 = ""; // contient les infos à inserer (not_already_modified)
var chaine2 = ""; // contient les infos à updater (already_modified)
var chaine3 = ""; // contient les infos à updater après CloseTheDay
var nrows = 1;
var maxrow = 1;

function saveTheModified()
{
	var strToInsert = "", strToUpdate = "";
	if (chaine1 != '')
	{
		//alert("chaine1 = "+chaine1);
		chaine1 = chaine1.substring(0, chaine1.length-1);
		strToInsert = "", strToUpdate = "";
		tabInfos = chaine1.split("|");
		for(var i = 0; i < tabInfos.length; i++)
		{
			if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
			{
				strToInsert += tabInfos[i] + "_";
				var elt_id = "logintime" + tabInfos[i];
				strToInsert += document.getElementById("logintime" + tabInfos[i]).value + "_";
				strToInsert += document.getElementById("paidtime" + tabInfos[i]).value + "_";
				if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
					strToInsert += "1" + "_";
				else
					strToInsert += "0" + "_";
				strToInsert += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
				strToInsert += document.getElementById("overridetime" + tabInfos[i]).value + "_";
				var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
				if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
				{
					strToInsert += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
				}
				else
					strToInsert += selectbox + "_";
				strToInsert += document.getElementById("billabletime" + tabInfos[i]).value + "_";
				strToInsert += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
				strToInsert += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
				strToInsert += "0|";
			}
		}
	}
	if (strToInsert != '')
		strToInsert = strToInsert.substring(0, strToInsert.length-1);

	if (chaine2 != '')
	{
		strToUpdate = "";
		chaine2 = chaine2.substring(0, chaine2.length-1);
		tabInfos = chaine2.split("|");
		for(var i = 0; i < tabInfos.length; i++)
		{
			strToUpdate += tabInfos[i] + "_";
			strToUpdate += document.getElementById("logintime" + tabInfos[i]).value + "_";
			strToUpdate += document.getElementById("paidtime" + tabInfos[i]).value + "_";
			if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
				strToUpdate += "1" + "_";
			else
				strToUpdate += "0" + "_";
			strToUpdate += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
			strToUpdate += document.getElementById("overridetime" + tabInfos[i]).value + "_";
			var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
			if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
			{
				strToUpdate += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
			}
			else
				strToUpdate += selectbox + "_";

			strToUpdate += document.getElementById("billabletime" + tabInfos[i]).value + "_";
			strToUpdate += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
			strToUpdate += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
			
			strToUpdate += "0|";
		}
		strToUpdate = strToUpdate.substring(0, strToUpdate.length-1);
	}

	if(document.getElementById("strToInsertCell") != null){
		document.agentHours.strToInsertCell.value = strToInsert;
	}
	if(document.getElementById("strToUpdateCell") != null){
		document.agentHours.strToUpdateCell.value = strToUpdate;
	}
	if(document.getElementById("type") != null){
		document.agentHours.type.value = "report";
	}
	if(document.getElementById("tenant_dbid") != null){
		document.agentHours.tenant_dbid.value = tenant_dbid;
	}
	if(document.getElementById("userid") != null){
		document.agentHours.userid.value = userid;
	}
	if(document.getElementById("viewData") != null){
		document.agentHours.viewData.value = "true";
	}
	if(document.getElementById("startDate") != null){
		document.agentHours.startDate.value = startDate;
	}
	if(document.getElementById("agentGroupId") != null){
		document.agentHours.agentGroupId.value = agentGroupId;
	}
	if(document.getElementById("agentId") != null){
		document.agentHours.agentId.value = agentId;
	}
	if(document.getElementById("saveAddedRows") != null){
		document.agentHours.saveAddedRows.value = 'false';
	}
	if(document.getElementById("dayClosed") != null){
		document.agentHours.dayClosed.value = 'false';
	}
	document.agentHours.submit();

}

function closeTheDay()
{
	

	var close_really = confirm(MultiArray["Do you really want to close this day"][lang]);
	
	if (close_really == true)
	{
		
		var tabInfos = "", strToInsert = "", strToUpdate = "";
	
		if (chaine3 != '')//
		{
			chaine3 = chaine3.substring(0, chaine3.length - 1);
			strToInsert = "", strToUpdate = "";
			tabInfos = chaine3.split("|");
			for(var i = 0; i < tabInfos.length; i++)
			{
				strToUpdate += tabInfos[i] + "_";
				strToUpdate += document.getElementById("logintime" + tabInfos[i]).value + "_";
				strToUpdate += document.getElementById("paidtime" + tabInfos[i]).value + "_";
				if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
					strToUpdate += "1" + "_";
				else
					strToUpdate += "0" + "_";
				strToUpdate += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
				strToUpdate += document.getElementById("overridetime" + tabInfos[i]).value + "_";
				var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
				if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
				{
					strToUpdate += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
				}
				else
					strToUpdate += selectbox + "_";
	
				strToUpdate += document.getElementById("billabletime" + tabInfos[i]).value + "_";
				strToUpdate += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
				strToUpdate += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
				strToUpdate += "1|";
			}
			strToUpdate = strToUpdate.substring(0, strToUpdate.length-1);
			if(document.getElementById("strToInsertCell") != null){
				document.agentHours.strToInsertCell.value = strToInsert;
			}
			if(document.getElementById("strToUpdateCell") != null){
				document.agentHours.strToUpdateCell.value = strToUpdate;
			}
			if(document.getElementById("type") != null){
				document.agentHours.type.value = "report";
			}
			if(document.getElementById("tenant_dbid") != null){
				document.agentHours.tenant_dbid.value = tenant_dbid;
			}
			if(document.getElementById("userid") != null){
				document.agentHours.userid.value = userid;
			}
			if(document.getElementById("viewData") != null){
				document.agentHours.viewData.value = "true";
			}
			if(document.getElementById("startDate") != null){
				document.agentHours.startDate.value = startDate;
			}
			if(document.getElementById("agentGroupId") != null){
				document.agentHours.agentGroupId.value = agentGroupId;
			}
			if(document.getElementById("agentId") != null){
				document.agentHours.agentId.value = agentId;
			}
			if(document.getElementById("saveAddedRows") != null){
				document.agentHours.saveAddedRows.value = 'false';
			}
			if(document.getElementById("dayClosed") != null){
				document.agentHours.dayClosed.value = 'true';
			}
			document.agentHours.submit();
	
		}
		else
		{
			if (chaine1 != '')
			{
				chaine1 = chaine1.substring(0, chaine1.length-1);
				strToInsert = "", strToUpdate = "";
				tabInfos = chaine1.split("|");
				for(var i = 0; i < tabInfos.length; i++)
				{
					strToInsert += tabInfos[i] + "_";
					var elt_id = "logintime" + tabInfos[i];
					strToInsert += document.getElementById("logintime" + tabInfos[i]).value + "_";
					strToInsert += document.getElementById("paidtime" + tabInfos[i]).value + "_";
					if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
						strToInsert += "1" + "_";
					else
						strToInsert += "0" + "_";
					strToInsert += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
					strToInsert += document.getElementById("overridetime" + tabInfos[i]).value + "_";
					var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
					if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
					{
						strToInsert += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
					}
					else
						strToInsert += selectbox + "_";
	
					strToInsert += document.getElementById("billabletime" + tabInfos[i]).value + "_";
					strToInsert += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
					strToInsert += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
					strToInsert += "1|";
				}
			}
			if (strToInsert != '')
				strToInsert = strToInsert.substring(0, strToInsert.length-1);
	
	
			if (chaine2 != '')
			{
				strToUpdate = "";
				chaine2 = chaine2.substring(0, chaine2.length-1);
				tabInfos = chaine2.split("|");
				for(var i = 0; i < tabInfos.length; i++)
				{
					strToUpdate += tabInfos[i] + "_";
					strToUpdate += document.getElementById("logintime" + tabInfos[i]).value + "_";
					strToUpdate += document.getElementById("paidtime" + tabInfos[i]).value + "_";
					if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
						strToUpdate += "1" + "_";
					else
						strToUpdate += "0" + "_";
					strToUpdate += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
					strToUpdate += document.getElementById("overridetime" + tabInfos[i]).value + "_";
					var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
					if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
					{
						strToUpdate += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
					}
					else
						strToUpdate += selectbox + "_";
	
					strToUpdate += document.getElementById("billabletime" + tabInfos[i]).value + "_";
					strToUpdate += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
					strToUpdate += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
					strToUpdate += "1|";
				}
				strToUpdate = strToUpdate.substring(0, strToUpdate.length-1);
			}
	
			if(document.getElementById("strToInsertCell") != null){
				document.agentHours.strToInsertCell.value = strToInsert;
			}
			if(document.getElementById("strToUpdateCell") != null){
				document.agentHours.strToUpdateCell.value = strToUpdate;
			}
			if(document.getElementById("type") != null){
				document.agentHours.type.value = "report";
			}
			if(document.getElementById("tenant_dbid") != null){
				document.agentHours.tenant_dbid.value = tenant_dbid;
			}
			if(document.getElementById("userid") != null){
				document.agentHours.userid.value = userid;
			}
			if(document.getElementById("viewData") != null){
				document.agentHours.viewData.value = "true";
			}
			if(document.getElementById("startDate") != null){
				document.agentHours.startDate.value = startDate;
			}
			if(document.getElementById("agentGroupId") != null){
				document.agentHours.agentGroupId.value = agentGroupId;
			}
			if(document.getElementById("agentId") != null){
				document.agentHours.agentId.value = agentId;
			}
			if(document.getElementById("saveAddedRows") != null){
				document.agentHours.saveAddedRows.value = 'false';
			}
			if(document.getElementById("dayClosed") != null){
				document.agentHours.dayClosed.value = 'true';
			}
			document.agentHours.submit();
		} // fin de else if chaine != ''
		
	}// fin if (close_really == true)
	else
	{
	
	}

}

function fillActivitiesCombo(id)
{

	if(document.getElementById(id).options.length <= 1 )
	{
		var activities = String( appletObj.getActivities() ); // dbid, name
		var jsActivities = activities + "";
		var arrayActivities = jsActivities.split("|");
		for (j = 0; j < arrayActivities.length; j++)
		{
			var activity = arrayActivities[j].split("^");
			myOption = new Option(activity[1],activity[0])
			optionPos = document.getElementById(id).options.length
			document.getElementById(id).options[optionPos]=myOption
		}
	}
}

function addMyRow(groupBox,agtBox,viewBox)
{
	if(groupBox.value == 'AllGroups')
	{
	  alert(MultiArray["Please select a group"][lang]);
	  return;
	}

	if(agtBox.value == 'AllAgents')
	{
     alert(MultiArray["Please select an agent"][lang]);
	  return;
	}

	var agtinfo = agtBox.options[agtBox.selectedIndex].text;
	var agtId = agtBox.value, agtname="";
	var agtdatas = agtinfo.split("[");
	if(viewBox.checked == true)
	{
		agtname = agtdatas[1].substring(0,agtdatas[1].length-1);
	}
	else
	{
		agtname = agtdatas[0];

	}

	lyr=document.createElement("DIV");
 	lyr.id ='t'+nrows;
	var nom = 'n'+ nrows;

	var code='';
	var i = 0;
	if (maxrow == 1)
	{
	

		code += "<table border='1' class='reportsTabName' style='border-collapse:collapse ' bordercolor='#CCCCCC'><tr>";
		code += "<td align='center' width='50'><b> ----- </b></td>";
		code += "<td align='center' width='100'><b>"+MultiArray["Agent ID"][lang]+"</b></td>";
		code += "<td align='center' width='200'><b>"+MultiArray["Last name"][lang]+", "+MultiArray["First name"][lang]+"</b></td>";
		code += "<td align='center' width='150'><b>"+MultiArray["Agent group"][lang]+"</b></td>";
		code += "<td align='center' width='125'><b>"+MultiArray["Activity"][lang]+"</b></td>";
		code += "<td align='center' width='150'><b>"+MultiArray["Paid time"][lang]+" (hh:mm:ss)</b></td>";
		code += "<td align='center' width='200'><b>"+MultiArray["Comments"][lang]+"</b></td>";
		code += "</tr></table>";
		code += "";
		code += "<table border='1' class='reportsRowUnPair' bordercolor='#CCCCCC' style='border-collapse:collapse '><tr>";
		code += "<td align='center' width='50'> <a href='javascript:deleteMyRow("+nrows+");'>"+MultiArray["Delete"][lang]+"</a></td>";
		code += "<td align='center' id='agentId"+nrows+"' width='100'>"+agtId+"</td>";
		code += "<td align='center' id='agentName"+nrows+"' width='200'>"+agtname+"</td>";
		code += "<td align='center' id='agentGroupId"+nrows+"' value='"+groupBox.options[groupBox.selectedIndex].value+"' width='150'>"+groupBox.options[groupBox.selectedIndex].text+"</td>";
		code += "<td align='center' id='activity"+nrows+"' width='125'>";
		code += "<select id='select_activity_type"+nrows+"' name='select_activity_type"+nrows+"' onClick='fillActivitiesCombo(this.id)'>";
		code += "<option value=''>"+MultiArray["Select"][lang]+"</option>";
		code += "</select>";
		code += "</td>";
		code += "<td align='center' width='150'><input type='text' id='paidtime"+nrows+"' name='paidtime"+nrows+"' size='10' value='' onFocus='this.select()' ></td>";//onBlur='buildReadableTime(this.id, this.value)'
		code += "<td align='center' width='200'>";
		code += "<input type='text' id='comments"+nrows+"' name='comments"+nrows+"' size='18'></td>";
		code += "</tr></table>";
	}
	else
	{
		code += "<table border='1' class='reportsRowUnPair' bordercolor='#CCCCCC' style='border-collapse:collapse '><tr>";
		code += "<td align='center' width='50'> <a href='javascript:deleteMyRow("+nrows+");'>"+MultiArray["Delete"][lang]+"</a></td>";
		code += "<td align='center' id='agentId"+nrows+"' width='100'>"+agtId+"</td>";
		code += "<td align='center' id='agentName"+nrows+"' width='200'>"+agtname+"</td>";
		code += "<td align='center' id='agentGroupId"+nrows+"' value='"+groupBox.options[groupBox.selectedIndex].value+"' width='150'>"+groupBox.options[groupBox.selectedIndex].text+"</td>";
		code += "<td align='center' id='activity"+nrows+"' width='125'>";
		code += "<select id='select_activity_type"+nrows+"' name='select_activity_type"+nrows+"' onClick='fillActivitiesCombo(this.id)'>";
		code += "<option value=''>"+MultiArray["Select"][lang]+"</option>";
		code += "</select>";
		code += "</td>";
		code += "<td align='center' width='150'><input type='text' id='paidtime"+nrows+"' name='paidtime"+nrows+"' size='10' value='' onFocus='this.select()' ></td>";//onBlur='buildReadableTime(this.id, this.value)'
		code += "<td align='center' width='200'>";
		code += "<input type='text' id='comments"+nrows+"' name='comments"+nrows+"' size='18'></td>";
		code += "</tr></table>";
	}
   	lyr.innerHTML = code;
  	document.getElementById("divAddARow").appendChild(lyr);
	fillActivitiesCombo("select_activity_type"+nrows);
	nrows++;
	maxrow++;
	document.getElementById("saveRows").disabled = false;
}

function deleteMyRow(f)
{
	var xxx = 't'+f;
	document.getElementById("divAddARow").removeChild(document.getElementById(xxx));
	nrows--;
}

function compareDates(date1, date2)
{
	var comp_result = 'false';
	var tabDate1 = date1.split("/");
	var tabDate2 = date2.split("/");
	//alert( tabDate1[2]+"-"+tabDate2[2] +"-"+tabDate1[1] +"-"+ tabDate2[1]+"-"+tabDate1[0] +"-"+ tabDate2[0]);
	// anee
	if (parseInt(tabDate2[2], 10) < parseInt(tabDate1[2], 10) )
		return 'false';
	if (parseInt(tabDate2[2], 10) > parseInt(tabDate1[2], 10) )
		return 'true';
	if (parseInt(tabDate2[2], 10) == parseInt(tabDate1[2], 10) )
	{
		// mois
		if (parseInt(tabDate2[0], 10) < parseInt(tabDate1[0], 10) )
			return 'false';
		if (parseInt(tabDate2[0], 10) > parseInt(tabDate1[0], 10) )
			return 'true';
		if (parseInt(tabDate2[0], 10) == parseInt(tabDate1[0], 10) )
		{
			// jour
			if (parseInt(tabDate2[1], 10) < parseInt(tabDate1[1], 10) )
				return 'false';
			if (parseInt(tabDate2[1], 10) >= parseInt(tabDate1[1], 10) )
				return 'true';
		}
	}

}

function saveMyRows()
{
	var strToInsert = "", strToUpdate = "";
	var startDate2 = document.getElementById("reportDate2").value;
	
	var today = new Date();
	
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var year = today.getFullYear();
	var s = "/";
	
	cur_day = month + s + day + s + year;
	var result = compareDates(cur_day, startDate2);
	
	//alert("result = " + result);
	
	if (result == 'false')
	{
		alert(MultiArray["You cannot add a row for a date prior to today. Please change the date!"][lang]);
		return false;
	}

	var trouve = false;
	for (var i = 1; i < maxrow; i++)
	{
		if (document.getElementById("t"+i) != null)
		{
			if(document.getElementById("select_activity_type"+i).value == "")
			{
				trouve = true;
				break;
			}
		}
	}

	if (trouve == true)
	{
		
		alert(MultiArray["You must select an activity for each row, please verify"][lang]);
		return;
	}
	for (var i = 1; i < maxrow; i++)
	{
		if (document.getElementById("t"+i) != null)
		{
			var paidtime_value = document.getElementById("paidtime"+i).value;
			if(paidtime_value == "" || paidtime_value == "00:00:00" || paidtime_value.length != 8 || paidtime_value.charAt(2) != ':' || paidtime_value.charAt(2) != ':')
			{
				trouve = true;
				break;
			}
		}
	}

	if (trouve == true)
	{
	
		alert(MultiArray["You must enter a paid time for each row, and respect the format. Please verify !"][lang]);
		return;
	}

	for (var i = 1; i < maxrow; i++)
	{
		if (document.getElementById("t"+i) != null)
		{
			strToInsert += document.getElementById("agentId"+i).innerHTML + "_";
			strToInsert += document.getElementById("agentGroupId"+i).value + "_";
			strToInsert += document.getElementById("select_activity_type"+i).value + "_";
			strToInsert += "00:00:00_";
			strToInsert += document.getElementById("paidtime"+i).value + "_";
			strToInsert += "1_";
			strToInsert += "00:00:00_";
			strToInsert += "00:00:00_";
			strToInsert += "Other~"+document.getElementById("comments"+i).value + "_";
			strToInsert += document.getElementById("paidtime"+i).value + "_";
			strToInsert += "0_0_0|";
		}
	}
	if (strToInsert.length > 0)
		strToInsert = strToInsert.substring(0, strToInsert.length - 1);

	if(document.getElementById("strToInsertCell") != null){
		document.agentHours.strToInsertCell.value = strToInsert;
	}
	if(document.getElementById("strToUpdateCell") != null){
		document.agentHours.strToUpdateCell.value = strToUpdate;
	}
	if(document.getElementById("type") != null){
		document.agentHours.type.value = "report";
	}
	if(document.getElementById("tenant_dbid") != null){
		document.agentHours.tenant_dbid.value = tenant_dbid;
	}
	if(document.getElementById("userid") != null){
		document.agentHours.userid.value = userid;
	}
	if(document.getElementById("viewData") != null){
		document.agentHours.viewData.value = "false";
	}
	if(document.getElementById("startDate") != null){
		document.agentHours.startDate.value = startDate2;
	}
	if(document.getElementById("agentGroupId") != null){
		document.agentHours.agentGroupId.value = agentGroupId;
	}
	if(document.getElementById("agentId") != null){
		document.agentHours.agentId.value = agentId;
	}
	if(document.getElementById("saveAddedRows") != null){
		document.agentHours.saveAddedRows.value = 'true';
	}
	document.agentHours.submit();

	
}



isIE=document.all;
isNN=!document.all&&document.getElementById;
 // Mouse events
function setMousePosition(e) 
{
   mp.x = (document.all)? event.clientX  + document.body.scrollLeft : e.pageX ;
   mp.y = (document.all)? event.clientY + document.body.scrollTop : e.pageY ;
   //window.status = " mp.x = "+mp.x+" mp.y = "+ mp.y
}

function mousePosition() 
{
   this.x = 0;
   this.y = 0;
}

var mp = new mousePosition();


function showPaidTimeDetails(agent_id, agent_name, login_time, not_paid_nrr_time, over_paid_nrr_time, paid_time, state)
{
	//
	if (document.getElementById('bulleDiv') != null)
	{
		if(state==1){
			setMousePosition();
			var code = "<TABLE WIDTH='100%'>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left' height='15'></TD><TD NOWRAP WIDTH=50%><b></b></TD><TD NOWRAP WIDTH=30%></TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH='80%' colspan=2 align='center'><b>"+agent_id+": "+agent_name+"</b></TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH=50%><b>"+MultiArray["Login time"][lang] +" :</b></TD><TD NOWRAP WIDTH=30%>  "+login_time+"</TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH=50%><b>"+MultiArray["Not paid NRR time"][lang] +" :</b></TD><TD NOWRAP WIDTH=30%>-("+not_paid_nrr_time+")</TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH=50%><b>"+MultiArray["Extra paid NRR time"][lang] +" :</b><TD NOWRAP WIDTH=30%>-("+over_paid_nrr_time+")</TD></TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH=50%><b>"+MultiArray["Total paid time"][lang] +" :</b></TD><TD NOWRAP WIDTH=30%>= "+paid_time+"</TD></TR>"
			code +="</TABLE>";
			document.getElementById('bulleDiv').innerHTML = code;
			document.getElementById('bulleDiv').style.left = mp.x+16;
			document.getElementById('bulleDiv').style.top = mp.y-48;
			document.getElementById('bulleDiv').style.visibility = 'visible';

		}
		else{

			document.getElementById('bulleDiv').style.visibility = 'hidden';
		}
	}
}


function hideLoadingDiv()
{
	if (document.getElementById("loading_div") != null)
	{
		document.getElementById("loading_div").innerHTML = "";
		document.getElementById("loading_div").style.visibility = 'hidden';
	}

}


function viewExceptions()
{
	if (document.getElementById("viewExceptionObj") != null)
	{
		document.getElementById("viewExceptionObj").value = 'true';
		var date_from = document.getElementById("fromDate").value;
		var date_to = document.getElementById("toDate").value;
		document.getElementById("dateFrom").value = date_from;
		document.getElementById("dateTo").value = date_to;
		//alert("view exceptions " + date_from +"-"+ date_to);
		document.agentHours.submit();
	}	
}

function displayTmpMessage(theMess, color)
{	
	var TempMsgObj = document.getElementById('TempMsg');
	var TempMessagesObj = document.getElementById('TempMessages');
	TempMsgObj.innerHTML = theMess;
	if(color != "")
		TempMsgObj.style.color = color;
	TempMessagesObj.style.top = document.body.clientHeight/2-TempMessagesObj.clientHeight/2;
	TempMessagesObj.style.left = document.body.clientWidth/2-TempMessagesObj.clientWidth/2;
	
	TempMessagesObj.style.visibility = "visible";
	TempMsgObj.style.visibility = "visible";
}

function retrieveTmpMessage()
{	
	var TempMsgObj = document.getElementById('TempMsg');
	var TempMessagesObj = document.getElementById('TempMessages');
	TempMsgObj.innerHTML = "";
	TempMessagesObj.style.visibility = "hidden";
		
}

function getUserName(id)
{
	
}



</script>

</head>


<body  class="bottompagebody">
<div class="tab-pane" id="tabPane1">
<form name="agentHours"  action="./loginvsProduction.jsp" method="post" >
	<script type="text/javascript">
		tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	  <div class="tab-page" id="searchoptions">
	  	<h2 class="tab"><script>document.write(MultiArray["Daily hours"][lang]);</script></h2>

			<script type="text/javascript">
				tp1.addTabPage( document.getElementById( "searchoptions" ) );
			</script>
			<fieldset>
				<legend><script>document.write(MultiArray["Search options"][lang]);</script></legend>
				<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="1455">
					<tr>
						<td height="25" colspan="4">&nbsp;						</td>
					</tr>
					<tr>
						<td width="276" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">
							<b><script>document.write(MultiArray["Select a date"][lang]);</script> </b>						</td>
						<td width="9" ></td>
						<td width="288" style="border-top-style: none; border-top-width: 1">
                          <input type="text" size="15" onFocus="showCalendar('',this,this,'','id_reportDate',0,30,1);this.blur()" name="reportDate" value="<%if((submitRequest != null) && submitRequest.compareTo("true") == 0) out.write(reportDate); else out.write("");%>"/>						</td>
					  <td width="907">&nbsp;<!--onClick="/*submitForm(false, false, false);*/"-->
				
				<script>document.write("<input id=\"saveModified2\"  name=\"saveModified\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["Save modified"][lang]+"\" onClick=\"saveTheModified()\">");</script>

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<script>document.write("<input id=\"closeThisDay\"  name=\"closeThisDay\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["Close this day"][lang]+"\" onClick=\"closeTheDay()\">");</script>&nbsp;&nbsp;<!--onClick="/*validatePassword();*/"-->						</td>
				
					</tr>
					<tr>
						<td width="276" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">
							<b><script>document.write(MultiArray["Select an agent group"][lang]);</script></b>						</td>
						<td width="9" ></td>
						<td width="288" style="border-top-style: none; border-top-width: 1">
							<select id="agtGrp" name="agtGrp" onChange=" if (dataExtracted == 'true') extractAllData(); /*else javascript:getAgentsInGroup(this, document.agentHours.objects, document.agentHours.viewckbox);*/" class="contentText" disabled>
								<option value="AllGroups">- <script>document.write(MultiArray["All groups"][lang]);</script> -</option>
							</select>						</td>
						<td valign="middle" >&nbsp;
							<b><script>//document.write(MultiArray["Show agent by ID"][lang]);</script> <!--<input type="checkbox" name="viewckbox" onClick="javascript:changeAgentListView(document.agentHours.agtGrp, document.agentHours.objects, this);" ID="Checkbox2">--></b>
							<script>document.write("<input id=\"viewAgentsHours\"  name=\"viewAgentsHours\" type=\"button\"  value=\""+MultiArray["View data"][lang]+"\" onClick=\"extractAllData()\">");</script>
						</td>
					</tr>
					<tr>
						<td width="276" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">
							<b><script>//document.write(MultiArray["Select an agent"][lang]);</script></b>						</td>
						<td width="9" ></td>
						<td width="288" id="id_reportDate" style="border-top-style: none; border-top-width: 1">
						<!--
							<select id="objects" name="objects" class="contentText" onChange=" if (dataExtracted == 'true') extractAllData(); ">
								<option value="AllAgents">- <script>document.write(MultiArray["All agents"][lang]);</script> -</option>
							</select>						
						-->
						</td>
						<td valign="top" >&nbsp;
		     <script>//document.write("<input id=\"viewAgentsHours\"  name=\"viewAgentsHours\" type=\"button\"  value=\""+MultiArray["View data"][lang]+"\" onClick=\"extractAllData()\">");</script>

						</td>
					</tr>
					<tr>
						<td height="25" colspan="4">&nbsp;						</td>
					</tr>
	 		</table>
  			</fieldset>
			<%

			String userid = request.getParameter("userid");
			String userinfo = beanAgentLoginProdReportObj.getUserInfo(userid);
			String username = "", userrole = "";
			if(userinfo.indexOf("|") != -1)
			{
				username = userinfo.substring(0, userinfo.indexOf("|"));
				userrole = userinfo.substring(userinfo.indexOf("|")+1, userinfo.length());
			}

			String strToInsert = request.getParameter("strToInsertCell");
			String strToUpdate = request.getParameter("strToUpdateCell");

			if ((strToInsert == null && strToUpdate == null) || (strToInsert.compareTo("") == 0 && strToUpdate.compareTo("") == 0))
			{
			}
			else
			{
				String runningDate = request.getParameter("startDate");
				beanAgentLoginProdReportObj.saveAgentHours(userid, runningDate, strToInsert, strToUpdate, thisDayIsClosed);
				beanAgentLoginProdReportObj.hasExtractData = false;
			}
			if ((submitRequest != null) && submitRequest.compareTo("true") == 0)
			{
			%>
			<div  style="margin-right:20px ">
			<table border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			  <tr>
				<td align="center" width="100"><b><script>document.write(MultiArray["Agent ID"][lang]);</script></b></td>
				<td align="center" width="200"><b><script>document.write(MultiArray["Last name"][lang]);</script>, <script>document.write(MultiArray["First name"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Agent group"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Activity"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Login time"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Paid time"][lang]);</script></b></td>
				<td align="center" width="80"><b><script>document.write(MultiArray["Override"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Correction"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Override time"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Override cause"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Custom cause"][lang]);</script></b></td>
			  </tr>
			</table>
			</div>
			
			<%
			}
			%>
			<div id="tabDailyHours" style="overflow:scroll; height:500px"> <!--  style="display:none ">-->
				<%
				java.util.Vector allAgentsData = new Vector();
				if ((submitRequest != null) && submitRequest.compareTo("true") == 0)
				{
					reportDate = request.getParameter("startDate");
					agentGroupId = request.getParameter("agentGroupId");
					agentId = request.getParameter("agentId");
					boolean include_agents = true;
					//Liste des agents actifs
					if (beanAgentLoginProdReportObj.hasExtractData == false)
					{
						String valeurRetour = beanAgentLoginProdReportObj.buildAgentGroupLoginProdReport(reportDate, include_agents);
						beanAgentLoginProdReportObj.calculateOverPaidNRR(reportDate);
						beanAgentLoginProdReportObj.calculateBillableNRRTime(reportDate);
						beanAgentLoginProdReportObj.hasExtractData = true;
					}
				}
				allAgentsData = (Vector)beanAgentLoginProdReportObj.m_gAllDetails;

				beanAgentLoginProdInfo anAgentActivityData = new beanAgentLoginProdInfo();
				java.util.Vector agentsData = new Vector();

				// Filtrer par agent group
				if (agentGroupId.compareTo("AllGroups") != 0 && agentId.compareTo("AllAgents") != 0)
				{
					for (int i = 0; i < allAgentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
						if (anAgentActivityData.grp_id.compareTo(agentGroupId) == 0 && anAgentActivityData.agt_id.compareTo(agentId) == 0)
							agentsData.add( anAgentActivityData );
					}
				}
				else if (agentGroupId.compareTo("AllGroups") != 0)
				{
					for (int i = 0; i < allAgentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
						if (anAgentActivityData.grp_id.compareTo(agentGroupId) == 0)
							agentsData.add( anAgentActivityData );
					}
				}
				else
				{
					for (int i = 0; i < allAgentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
						agentsData.add( anAgentActivityData );
					}
				}

					%>
					<table border="0">
					<%
					String id_suff = "", already_modified = "", not_already_modified = "", supermodified = "";
					for (int i = 0; i < agentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)agentsData.elementAt(i);
						id_suff = anAgentActivityData.agt_id + "_" + anAgentActivityData.grp_id + "_" + anAgentActivityData.activity_type;
						if(anAgentActivityData.dayClosed == 0) // la journée est encore en cours
						{
							if (anAgentActivityData.override == 1)
								already_modified += id_suff + "|";
							else
								not_already_modified += id_suff + "|";
						}
						if(anAgentActivityData.dayClosed == 1) // la journée est déjà fermée
						{
							supermodified += id_suff + "|";
						}
					  if(i%2 ==0) {
					  %>
					  	<tr class="reportsRowPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
					  <%
					  } else {
					  %>
				  	  <tr class="reportsRowUnPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
                     <%
					 }
					 %>
						<td align="center" id="agentId_<%=id_suff%>" width="100"><%=anAgentActivityData.agt_id%></td>
						<td align="center" width="200">
							<a href="../jsp/events_details.jsp?agentId=<%=anAgentActivityData.agt_id%>&curDate=<%=reportDate%>" target="_blank">
								<%out.write(anAgentActivityData.last_name + ", " + anAgentActivityData.first_name); %>
							</a>
						</td>
						<td align="center" width="150"><%=anAgentActivityData.grp_name%></td>
						<td align="center" width="125" ><%=anAgentActivityData.activity_name%></td>
						<td align="center" width="125">
						  <input type="text" id="logintime<%=id_suff%>" name="logintime<%=id_suff%>" size="10" value="<%=anAgentActivityData.getTotalLoginTime()%>" disabled>
						</td>
						<td align="center" width="125"
							 onMouseOver="showPaidTimeDetails('<%=anAgentActivityData.agt_id%>', '<%=anAgentActivityData.name%>', '<%=anAgentActivityData.getTotalLoginTime()%>', '<%=anAgentActivityData.getNotPaidNRRTime()%>', '<%=anAgentActivityData.getOverPaidNRRTime()%>', '<%=anAgentActivityData.getTotalPaidTime()%>', 1)"
							 onMouseOut="showPaidTimeDetails('<%=anAgentActivityData.agt_id%>', '<%=anAgentActivityData.name%>', '<%=anAgentActivityData.getTotalLoginTime()%>', '<%=anAgentActivityData.getNotPaidNRRTime()%>', '<%=anAgentActivityData.getOverPaidNRRTime()%>', '<%=anAgentActivityData.getTotalPaidTime()%>', 0)"
							 >
							 <%
							 long paid_temp = 0, override_temp = 0;
							 if (anAgentActivityData.totalLoginTime > 0)
							 {
							    paid_temp = anAgentActivityData.totalLoginTime - anAgentActivityData.totalNotPaidNRRTime - anAgentActivityData.overPaidNRR;
								if (anAgentActivityData.override == 1)
									override_temp = paid_temp + anAgentActivityData.totalCorrectionTime;
								else
									override_temp = 0;
							 }
							 else
							 {
							    paid_temp = anAgentActivityData.totalPaidTime;
								if (anAgentActivityData.override == 1)
									override_temp = paid_temp + anAgentActivityData.totalCorrectionTime;
								else
									override_temp = 0;
							 }
							 %>
							<input type="text" id="paidtime<%=id_suff%>" name="paidtime<%=id_suff%>" size="10" value="<%=anAgentActivityData.buildReadableTime(paid_temp)/*getTotalPaidTime()*/%>" disabled >
							<input type="hidden" id="billabletime<%=id_suff%>" name="billabletime<%=id_suff%>" value="<%=anAgentActivityData.getTotalBillableTime()%>" >
							<input type="hidden" id="notpaidnrrtime<%=id_suff%>" name="notpaidnrrtime<%=id_suff%>" value="<%=anAgentActivityData.totalNotPaidNRRTime%>" >
							<input type="hidden" id="overpaidnrrtime<%=id_suff%>" name="overpaidnrrtime<%=id_suff%>" value="<%=anAgentActivityData.overPaidNRR%>" >
						</td>
						<td align="center" width="80">
							<input type="checkbox" id="checkoverride<%=id_suff%>" name="checkoverride<%=id_suff%>" onClick="enableOverrideTime(this.id);"
													 <%if (anAgentActivityData.override == 1) out.write("checked"); else out.write(""); %> <%if (anAgentActivityData.dayClosed == 1) out.write("disabled");%>>
						</td>
						<td align="center" width="125">
						  <input type="text" id="correctiontime<%=id_suff%>" name="correctiontime<%=id_suff%>" size="10" onFocus="this.select()" onBlur="buildOverrideTime(this.id, this.value);buildCorrectionTime(this.id, this.value)" value="<%=anAgentActivityData.getTotalCorrectionTime()%>" disabled>
						</td>
						<td align="center" width="125">
						  <input type="text" id="overridetime<%=id_suff%>" name="overridetime<%=id_suff%>" size="10" value="<%=anAgentActivityData.buildReadableTime(override_temp)/*getTotalOverrideTime()*/%>" disabled>
						</td>
						<td align="center" width="150">
						  <select name="selectoverridecause<%=id_suff%>" id="selectoverridecause<%=id_suff%>" onChange="viewOverrideCause(this.id)" disabled>
							<option value="No comments"><script>document.write(MultiArray[""Select""][lang]);</script></option>
							<option value="Starphone crash"><script>document.write(MultiArray["Starphone crash"][lang]);</script></option>
							<option value="Fire alarm"><script>document.write(MultiArray["Fire alarm"][lang]);</script></option>
							<option value="Computer crash"><script>document.write(MultiArray["Computer crash"][lang]);</script></option>
							<option value="Power failure"><script>document.write(MultiArray["Power failure"][lang]);</script></option>
							<option value="Agent displacement"><script>document.write(MultiArray["Agent displacement"][lang]);</script></option>
							<option value="Sent Home (3hrs paid)"><script>document.write(MultiArray["Sent Home (3hrs paid)"][lang]);</script></option>
							<option value="First day integration"><script>document.write(MultiArray["First day integration"][lang]);</script></option>
							<option value="Floor support"><script>document.write(MultiArray["Floor support"][lang]);</script></option>
							<option value="HR interview"><script>document.write(MultiArray["HR interview"][lang]);</script></option>
							<option value="Other"> <script>document.write(MultiArray["Other"][lang]);</script></option>
						  </select>
						 
						</td>
						<td align="center" width="150">
							<input  style="visibility:hidden" type="text" id="overridecause<%=id_suff%>" name="overridecause<%=id_suff%>" size="18" disabled>
						</td>
					  </tr>
						<%
						 out.write("<script>displayOverrideCause('" + id_suff + "', '" + anAgentActivityData.comments + "'); </script>");
					  } // fin for
					  out.write("<script>hideLoadingDiv(); </script>	");
					  out.write("<script>chaine1 = '" + not_already_modified + "'; </script>	");
					  out.write("<script>chaine2 = '" + already_modified + "'; </script>	");
					  out.write("<script>chaine3 = '" + supermodified + "'; </script>	");
					  %>
					</table>
					 <table>
					 	<tr>
							<td>
								<input id="agentGroupId" name="agentGroupId" type="hidden">
								<input id="agentId" name="agentId" type="hidden">
								<input id="startDate" name="startDate" type="hidden">
								<input id="viewData" name="viewData" type="hidden">
								<input id="tenant_dbid" name="tenant_dbid" type="hidden">
								<input id="type" name="type" type="hidden">
								<input id="userid" name="userid" type="hidden">
								<input id="strToUpdateCell" name="strToUpdateCell" type="hidden">
								<input id="strToInsertCell" name="strToInsertCell" type="hidden">
								<input id="saveAddedRows" name="saveAddedRows" type="hidden">
								<input id="sessionParams" name="sessionParams" type="hidden">
								<input id="dayClosed" name="dayClosed" type="hidden">
								<input id="dateFrom" name="dateFrom" type="hidden">
								<input id="dateTo" name="dateTo" type="hidden">
								<input id="viewExceptionObj" name="viewExceptionObj" type="hidden">
							</td>
						</tr>
					</table>
			</div>
	</div>

	<div id="paidTimeDetails" >  </div>

	<div class="tab-page" id="addRow" >
		<h2 class="tab"><script>document.write(MultiArray["Add a row"][lang]);</script></h2>
		<script type="text/javascript">
				tp1.addTabPage( document.getElementById( "addRow" ) );
		</script>
		<fieldset>
		<%
			userid = request.getParameter("userid");
			if ((submitRequest2 != null) && submitRequest2.compareTo("true") == 0)
			{
				strToInsert = request.getParameter("strToInsert");
				strToUpdate = request.getParameter("strToUpdate");
				if ((strToInsert == null && strToUpdate == null) || (strToInsert.compareTo("") == 0 && strToUpdate.compareTo("") == 0))
				{
				}
				else
				{
					String runningDate2 = request.getParameter("startDate2");
					beanAgentLoginProdReportObj.saveAgentHours(userid, runningDate2, strToInsert, strToUpdate, thisDayIsClosed);
					beanAgentLoginProdReportObj.hasExtractData = false;
				}
			}

		%>
				<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="1455">
					<tr>
						<td height="25" colspan="4">&nbsp;
						</td>
					</tr>
					<tr>
						<td width="47" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">&nbsp;</td>
						<td width="11" ></td>
						<td width="299" style="border-top-style: none; border-top-width: 1">&nbsp;<b><script>document.write(MultiArray["Select an agent group"][lang]);</script></b>
							<select name="agtGrp2" onChange="javascript:getAgentsInGroup(this, document.agentHours.objects2, document.agentHours.viewckbox2)" class="contentText">
								<option value="AllGroups">- <script>document.write(MultiArray["All groups"][lang]);</script> -</option>
							</select>
						</td>
						<td width="948">&nbsp;<b><script>document.write(MultiArray["Select an agent"][lang]);</script></b>
							<select id="objects2" name="objects2" class="contentText" >
								<option value="AllAgents">- All agents -</option>
							</select>
						</td>
					</tr>
					<tr>
						<td width="47" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">&nbsp;
						</td>
						<td width="11" ></td>
						<td valign="middle" >
							&nbsp;<b><script>document.write(MultiArray["Show agent by ID"][lang]);</script> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="viewckbox2" onClick="javascript:changeAgentListView(document.agentHours.agtGrp2, document.agentHours.objects2, this)" id="viewckbox2"></b>
						</td>
						<td width="288" style="border-top-style: none; border-top-width: 1">&nbsp;<b><script>document.write(MultiArray["Select a date"][lang]);</script> &nbsp;&nbsp;&nbsp;</b>
                          <input type="text" size="15" onFocus="showCalendar('',this,this,'','id_reportDate2',0,30,1);this.blur()" name="reportDate2" id="reportDate2" value=""/>
						</td>
					</tr>
					<tr>
						<td height="25">&nbsp;
						</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td width="47" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">&nbsp;
						</td>
						<td width="11" ></td>
						<td width="299" style="border-top-style: none; border-top-width: 1">&nbsp;
							<script>document.write("<input id=\"addARow\"  name=\"addARow\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["Add a row"][lang]+"\" onClick=\"addMyRow(document.agentHours.agtGrp2,document.agentHours.objects2, document.agentHours.viewckbox2)\">");</script>		&nbsp;&nbsp;
						</td>
						<td valign="middle" >&nbsp;
							<script>document.write("<input disabled id=\"saveRows\"  name=\"saveRows\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["Save rows"][lang]+"\" onClick=\"saveMyRows()\">");</script>&nbsp;&nbsp;
						</td>
					</tr>
	 		</table>


			<div id="divAddARow" > 
			</div>


		</fieldset>
	</div>
	
	<div class="tab-page" id="exception">
		<h2 class="tab"><script>document.write(MultiArray["Exceptions"][lang]);</script></h2>
		<script type="text/javascript">
			tp1.addTabPage( document.getElementById( "exception" ) );
		</script>
		<fieldset>
				<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="1625">
					<tr>
						<td height="25" colspan="4">&nbsp;
						</td>
					</tr>
					<tr>
						<td width="47" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">&nbsp;
						</td>
						<td width="11" ></td>
						<td width="299" style="border-top-style: none; border-top-width: 1">&nbsp;<b><script>document.write(MultiArray["Select start date"][lang]);</script></b>
							<input type="text" size="15" onFocus="showCalendar('',this,this,'','id_fromDate',0,30,1);this.blur()" name="fromDate" id="fromDate" value=""/>						
						<td width="948">&nbsp;<b><script>document.write(MultiArray["Select stop date"][lang]);</script></b>
							<input type="text" size="15" onFocus="showCalendar('',this,this,'','id_toDate',0,30,1);this.blur()" name="toDate" id="toDate" value=""/>						
						</td>
					</tr>
					<tr>
						<td height="25">&nbsp;
						</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td width="47" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">&nbsp;
						</td>
						<td width="11" ></td>
						<td width="299" style="border-top-style: none; border-top-width: 1">&nbsp;&nbsp;&nbsp;</td>
						<td valign="middle" >&nbsp;
						<script>document.write("<input id=\"displayExceptions\"  name=\"displayExceptions\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["View exceptions"][lang]+"\" onClick=\"viewExceptions()\">");</script>&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="./Exceptions.csv"><script>document.write(MultiArray["Right-click to download"][lang]);</script></a>
						</td>
					</tr>
	 		</table>
		</fieldset>
			<%
			
			String strToWrite = "";
			
			if ((viewExceptions != null) && viewExceptions.compareTo("true") == 0)
			{
			%>
			<div  style="margin-right:20px ">
			<table border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			  <tr>
			  	<td align="center" width="100"><b><script>document.write(MultiArray["Date"][lang]);</script></b></td>
				<td align="center" width="100"><b><script>document.write(MultiArray["Agent ID"][lang]);</script></b></td>
				<td align="center" width="200"><b><script>document.write(MultiArray["Last name"][lang]);</script>, <script>document.write(MultiArray["First name"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Agent group"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Activity"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Login time"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Paid time"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Correction"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Override time"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Override cause"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Custom cause"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Override by"][lang]);</script></b></td>
		
			  </tr>
			</table>
			</div>
			<%
				strToWrite = "Date,AgentID,Name,Agent Group,Activity,Login Time,Paid Time,Correction,Override Time,Override cause,Override by\r\n";
			}
			%>
			
			<div id="exceptionDiv" style="overflow:scroll; height:500px"> 
				<%
				if ((viewExceptions != null) && viewExceptions.compareTo("true") == 0)
				{
					fromDate = request.getParameter("dateFrom");
					toDate = request.getParameter("dateTo");
					if (fromDate.compareTo("") != 0 && toDate.compareTo("") != 0) 
						beanAgentLoginProdReportObj.getExceptionsRecords(fromDate, toDate );
				}
				java.util.Vector exceptionData = (Vector)beanAgentLoginProdReportObj.m_AllExceptions;
				anAgentActivityData = new beanAgentLoginProdInfo();
				%>
					
        <table height="54" border="0">
          				<%
					
					id_suff = "";
					for (int i = 0; i < exceptionData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)exceptionData.elementAt(i);
						
						id_suff = anAgentActivityData.agt_id + "_" + anAgentActivityData.grp_id + "_" + anAgentActivityData.activity_type;
						  if(i%2 ==0) {
						  %>
					  	<tr class="reportsRowPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
						  <%
						  } else {
						  %>
				  	    <tr class="reportsRowUnPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
						 <%
						 }
						 %>
						<td align="center" width="100">
							<%=anAgentActivityData.event_date%>
						</td>
						<td align="center" id="agentId_<%=id_suff%>" width="100"><%=anAgentActivityData.agt_id%></td>
						<td align="center" width="200">
							<a href="../jsp/events_details.jsp?agentId=<%=anAgentActivityData.agt_id%>&curDate=<%=reportDate%>" target="_blank">
								<%out.write(anAgentActivityData.last_name + ", " + anAgentActivityData.first_name); %>
							</a>
						</td>
						<td align="center" width="150"><%=anAgentActivityData.grp_name%></td>
						<td align="center" width="125" ><%=anAgentActivityData.activity_name%></td>
						<td align="center" width="125">
						  <input type="text" id="logintime<%=id_suff%>" name="logintime<%=id_suff%>" size="10" value="<%=anAgentActivityData.getTotalLoginTime()%>" disabled>
						</td>
						<td align="center" width="125"
							 onMouseOver="showPaidTimeDetails('<%=anAgentActivityData.agt_id%>', '<%=anAgentActivityData.name%>', '<%=anAgentActivityData.getTotalLoginTime()%>', '<%=anAgentActivityData.getNotPaidNRRTime()%>', '<%=anAgentActivityData.getOverPaidNRRTime()%>', '<%=anAgentActivityData.getTotalPaidTime()%>', 1)" 
							 onMouseOut="showPaidTimeDetails('<%=anAgentActivityData.agt_id%>', '<%=anAgentActivityData.name%>', '<%=anAgentActivityData.getTotalLoginTime()%>', '<%=anAgentActivityData.getNotPaidNRRTime()%>', '<%=anAgentActivityData.getOverPaidNRRTime()%>', '<%=anAgentActivityData.getTotalPaidTime()%>', 0)"
							 >
							<input type="text" id="paidtime<%=id_suff%>" name="paidtime<%=id_suff%>" size="10" value="<%=anAgentActivityData.getTotalPaidTime()%>" disabled >
							<input type="hidden" id="billabletime<%=id_suff%>" name="billabletime<%=id_suff%>" value="<%=anAgentActivityData.getTotalBillableTime()%>" >
						</td>
						<td align="center" width="125">
						  <input type="text" id="correctiontime<%=id_suff%>" name="correctiontime<%=id_suff%>" size="10" onFocus="this.select()" onBlur="buildOverrideTime(this.id, this.value);buildReadableTime(this.id, this.value)" value="<%=anAgentActivityData.getTotalCorrectionTime()%>" disabled>
						</td>
						<td align="center" width="125">
						  <input type="text" id="overridetime<%=id_suff%>" name="overridetime<%=id_suff%>" size="10" value="<%=anAgentActivityData.getTotalOverrideTime()%>" disabled>
						</td>
						<td align="center" width="150"><%//=anAgentActivityData.comments%>
						  <select name="selectoverridecause<%=id_suff%>" id="selectoverridecause<%=id_suff%>" onChange="viewOverrideCause(this.id)" disabled>
							<option value="No comments"><script>document.write(MultiArray["Select"][lang]);</script></option>
							<option value="System failure"><script>document.write(MultiArray["System failure"][lang]);</script></option>
							<option value="Working at Fido"><script>document.write(MultiArray["Working at Fido"][lang]);</script></option>
							<option value="Starphone crash">Starphone crash</option>
							<option value="Fire alarm">Fire alarm</option>
							<option value="Computer crash">Computer crash</option>
							<option value="Power failure">Power Failure</option>
							<option value="Agent displacement">Agent displacement</option>
							<option value="Sent Home (3hrs paid)">Sent Home (3hrs paid)</option>
							<option value="First day integration">First day integration</option>
							<option value="Floor support">Floor support</option>
							<option value="HR interview">HR interview</option>
							<option value="Other"><script>document.write(MultiArray["Other"][lang]);</script></option>
						  </select>
						</td>
						<td align="center" width="150">
							<input type="text" id="overridecause<%=id_suff%>" name="overridecause<%=id_suff%>" size="18" disabled>
						</td>
						<%
						String nom = "";
						String userInfo = beanAgentLoginProdReportObj.getUserInfo(anAgentActivityData.acknowledged_by);
						
						if(userInfo.indexOf("|") != -1)
						{
							nom = userInfo.substring(0, userInfo.indexOf("|"));
						}
						
						%>
						<td align="center" width="150">
							<input type="text" id="ack_by<%=id_suff%>" name="ack_by<%=id_suff%>" size="18" value="<%out.write(nom);%>" disabled>
						</td>
						
					  </tr>
						<%
						 out.write("<script>displayOverrideCause('" + id_suff + "', '" + anAgentActivityData.comments + "'); </script>");
						 
						 strToWrite += anAgentActivityData.event_date + ", " + anAgentActivityData.agt_id + ", " + anAgentActivityData.last_name + " " + 
						 				anAgentActivityData.first_name + ", " + anAgentActivityData.grp_name + ", " + anAgentActivityData.activity_name + ", " + 
										anAgentActivityData.getTotalLoginTime() + ", " + anAgentActivityData.getTotalPaidTime() + ", " + 
										anAgentActivityData.getTotalCorrectionTime() + ", " + anAgentActivityData.getTotalOverrideTime() + ", " + 
										anAgentActivityData.comments + ", " + nom + "\r\n";
										
					  } // fin for

						//String strPath = "../webapps/aheevaccs/Manager/Resources_pages/Exceptions.csv";	//VOICI LA LIGNE 	QUI CAUSE LE BUG
						String strPath="Exceptions.csv";
						File strFile = new File(strPath);
						FileWriter myWriter = new FileWriter(strFile);
						BufferedWriter objWriter = new BufferedWriter(myWriter);	
						objWriter.write(strToWrite);	
						objWriter.flush();	
						objWriter.close();
					  %>
				</table>
			</div>
	</div>
	
	
	<div class="tab-page" id="summary">
		<h2 class="tab"><script>document.write(MultiArray["Summary"][lang]);</script></h2>
		<script type="text/javascript">
				tp1.addTabPage( document.getElementById( "summary" ) );
		</script>
		<fieldset>
		<legend><script>document.write(MultiArray["View agent groups hours summary"][lang]);</script></legend>
		<table width="100%">
			<tr border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			<td align="center" width="20%"><b><script>document.write(MultiArray["Name"][lang]);</script></b></td>
			<td align="center" width="35%"><b><script>document.write(MultiArray["Queue"][lang]);</script></b></td>
			<td align="center" width="15%"><b><script>document.write(MultiArray["Login time"][lang]);</script></b></td>
			<td align="center" width="15%"><b><script>document.write(MultiArray["Paid time"][lang]);</script></b></td>
			<td align="center" width="15%"><b><script>document.write(MultiArray["Billable"][lang]);</script></b></td>
			</tr>
		<%
			if ((submitRequest != null) && submitRequest.compareTo("true") == 0)
			{
				reportDate = request.getParameter("startDate");
				agentGroupId = request.getParameter("agentGroupId");
				Vector summaryVector = beanAgentLoginProdReportObj.getSummary( agentGroupId, reportDate);
				beanAgentLoginProdInfo c = new beanAgentLoginProdInfo();
				for(int n=0; n < summaryVector.size(); n++){
					beanAgentLoginProdReport.hoursSummary data = (beanAgentLoginProdReport.hoursSummary)summaryVector.elementAt(n);
					if (n%2 == 0)
					{
					%>
						<tr class="reportsRowUnPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
						<td align="center" width="20%"><%=data.name%></td>
						<td align="center" width="35%"><%=data.queue%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.login_time)%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.paid_time)%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.billable_time)%></td>
						</tr>
					<%
					}
					if (n%2 == 1)
					{
					%>
						<tr class="reportsRowPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
						<td align="center" width="20%"><%=data.name%></td>
						<td align="center" width="35%"><%=data.queue%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.login_time)%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.paid_time)%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.billable_time)%></td>
						</tr>
					<%
					}
				}

		%>
		</table>
		<%
			}
		%>
		</fieldset>
	</div>
<script>
	//fillObjectCombo(document.agentHours.agtGrp, document.agentHours.objects, document.agentHours.viewckbox);
	fillObjectCombo(document.agentHours.agtGrp2, document.agentHours.objects2, document.agentHours.viewckbox2);
</script>
<%
out.write("<script>selectObject(document.getElementById('agtGrp'), '"+agentGroupId +"');</script>");


if ( ((submitRequest != null) && submitRequest.compareTo("true") == 0) || ((viewExceptions != null) && viewExceptions.compareTo("true") == 0))
{
%>
<script>
	document.getElementById("agtGrp").disabled = false;
	//getAgentsInGroup(document.agentHours.agtGrp, document.agentHours.objects, document.agentHours.viewckbox)
</script>
<%
}
else
{
%>
<script>
	document.getElementById("agtGrp").disabled = true;
</script>
<%

}
//out.write("<script>selectObject(document.getElementById('objects'), '"+agentId +"');</script>");
%>
</form>
</div>
<div id="bulleDiv" style=" background-image:url(../img/callout_box.gif); visibility: hidden; position:absolute; left:0px; top:0px; width:283px; height:120px;" >
</div>
	<div class="TempMessages" id="TempMessages"> 
	  <table border="0" width="100%" cellpadding="0" cellspacing="0" height="100%">
		<tr> 
		  <td width="100%" id="TempMsg" align="center"> </td>
		</tr>
	  </table>
	</div>
</body>
</html>
<script>
//window.open('./example.csv','formWindow');
</script>

