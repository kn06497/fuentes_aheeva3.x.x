<html>

<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<LINK href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<%@ include file="xc2_default_labels.jsp" %>
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
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<!-- End Tab Pane -->


<!-- Calendrier d?but -->
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->
<script language="JavaScript" src="jsUtil.js"></script>
<script>

var vValue = normalizeString(QueryString('type'));
  var tenant_dbid = normalizeString(QueryString('tenant_dbid'));

function loadAgent(){

  while(document.theForm.objects.length > 0){
    document.theForm.objects.options[0]= null;
  }
  var jsAgents;
  var myOption;
  if (ckbox.checked == true)
  {
    //Get all agents name
 ?  var agents = String( appletObj.getAgentsByName(tenant_dbid) );
    jsAgents = agents + "";
    arrayAgents = jsAgents.split("|");
    for (j = 0; j <arrayAgents.length; j++){
		var iStartPos = arrayAgents[j].indexOf('[');
		var iEndPos   = arrayAgents[j].indexOf(']');
		var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
		var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
		if (document.theForm.viewckbox.checked == false)	  		// show agents name as : firstname, lastname[login]
      		myOption = new Option(arrayAgents [j],login)
		else									// show agents name as : login[firstname, lastname]
			myOption = new Option(name,login)
		var optionPos = document.theForm.objects.options.length;
		document.theForm.objects.options[optionPos]= myOption;
    }
  } else {
    //Get all active Agents by Name
    var agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
    jsAgents = agents + "";
    arrayAgents = jsAgents.split("|");
    for (j = 0; j <arrayAgents.length; j++){
      var iStartPos = arrayAgents[j].indexOf('[');
      var iEndPos   = arrayAgents[j].indexOf(']');
      var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
	  var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
	  if (document.theForm.viewckbox.checked == false)
      	myOption = new Option(arrayAgents [j],login)
	  else
	    myOption = new Option(name,login)
     var optionPos = document.theForm.objects.options.length;
      document.theForm.objects.options[optionPos]= myOption;

    }
  }
  //alert(jsAgents)
  sortSelect(document.theForm.objects);
}

function sortSelect(obj)
{
	var o = new Array();
	if (obj.options==null) { return; }
	for (var i=0; i<obj.options.length; i++) {
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;
		}
	if (o.length==0) { return; }
	if(document.theForm.viewckbox.checked == false){
		o = o.sort(
			function(a,b) {

					if ((a.text+"") < (b.text+"")) { return -1; }
					if ((a.text+"") > (b.text+"")) { return 1; }
					return 0;
					}
			);
     }
    else{
		o = o.sort(
			function(a,b) {

					if (parseInt(a.value) < parseInt(b.value)) { return -1; }
					if (parseInt(a.value) > parseInt(b.value)) { return 1; }
					return 0;
					}
			);
    }
	for (var i=0; i<o.length; i++) {
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}

}

function changeAgentListView()
{
  var textvalue,iStartPos,iEndPos,login,name,newtextvalue;
  var o = new Array();
  if (document.theForm.viewckbox.checked == true)
  {
    for (j = 0; j <document.theForm.objects.options.length; j++){
	  textvalue = document.theForm.objects.options[j].text
	  //alert(textvalue + '..'+objects.options[j].value)
	  if(textvalue.length > 0){
		   iStartPos = textvalue.indexOf('[');
		   iEndPos   = textvalue.indexOf(']');
		   login	 = textvalue.substr(iStartPos+1,iEndPos-iStartPos-1);
		   name      = textvalue.substr(0,iStartPos);
	   }
	   newtextvalue = login +'['+name +']'
       document.theForm.objects.options[j].text=newtextvalue
	   //alert(document.theForm.objects.options[j].text)
	   document.theForm.objects.options[j] = new Option( newtextvalue, login, document.theForm.objects.options[j].defaultSelected, document.theForm.objects.options[j].selected) ;

    }
  } else {
    for (j = 0; j <document.theForm.objects.options.length; j++){
	  textvalue = document.theForm.objects.options[j].text
	  //alert(textvalue + '..'+document.theForm.objects.options[j].value)
	  if(textvalue.length > 0){
		   iStartPos = textvalue.indexOf('[');
		   iEndPos   = textvalue.indexOf(']');
		   name	 = textvalue.substr(iStartPos+1,iEndPos-iStartPos-1);
		   login      = textvalue.substr(0,iStartPos);
	   }
	   newtextvalue = name +'['+login +']'
       document.theForm.objects.options[j].text=newtextvalue
	   //alert(document.theForm.objects.options[j].text)
	   document.theForm.objects.options[j] = new Option( newtextvalue, login, document.theForm.objects.options[j].defaultSelected, document.theForm.objects.options[j].selected) ;

    }
  }

  sortSelect(document.theForm.objects);
}

function fillObjectCombo()
{
     if(vValue=='Inbound'){
	 	var agentGroups = String( appletObj.getAgentGroupByName(tenant_dbid) );
		var jsAgentGroups = agentGroups + "";
    	arrayGroups = jsAgentGroups.split("|");
    	for (j = 0; j <arrayGroups.length; j++)
		{
    		myOption = new Option(arrayGroups[j],arrayGroups[j])
			optionPos = document.theForm.objects.options.length				
			document.theForm.objects.options[optionPos]=myOption
    	}
    }

    if(document.theForm.objects.options.length >= 10)
	   	document.theForm.objects.size = 10;
	else
		document.theForm.objects.size = document.theForm.objects.options.length;


}

function getSelectedObjects()
{

	selectedObjects = new Array()
	for (i=0;i<document.theForm.objects.options.length;i++) {
  		if (document.theForm.objects.options[i].selected) {
  			selectedObjects[selectedObjects.length]=document.theForm.objects.options[i].value;
  		}
  	}
    var url = '';
	if (selectedObjects.length > 0)
	{
		url= escape(selectedObjects.join('/'))
	}

	return url;
}

function getSelectedTeams(){
var url = '';

		selectedTeams = new Array()
		for (i=teams.selectedIndex;i<teams.options.length;i++) {
  			if (teams.options[i].selected) {
  				selectedTeams[selectedTeams.length]=teams.options[i].value;
  			}
  		}
		if (selectedObjects.length > 0){
			url= escape(selectedObjects.join('/'))
		}

		return url;
}

function saveAdhViewData()
{
	var selectObjects;
	if(document.theForm.objects.selectedIndex == -1)
	{
		//alert("Please select at least one object");
		//return false;
		selectObjects='All';
	}
	else
	  selectObjects = getSelectedObjects();
	//appletObj.m_firstLoad = true;
        appletObj.updateRTAViewInfo(document.theForm.startTime.value, document.theForm.endTime.value, document.theForm.spacing.value,selectObjects);
	if(document.theForm.saveButton.disabled == false)
		document.theForm.saveButton.disabled = true;
	window.top.main.rtop.stats.firstLoad = true;
}

function sendRTAStartRequest()
{
	var selectObjects;
	if(document.theForm.objects.selectedIndex == -1)
	{
		//alert("Please select at least one object");
		//return false;
		selectObjects='All';
	}
	else
	  selectObjects = getSelectedObjects();
	appletObj.sendRTAStartReq(tenant_dbid,selectObjects);
}

function sendRTAStopRequest()
{
   	var selectObjects;
	if(document.theForm.objects.selectedIndex == -1)
	{
		//alert("Please select at least one object");
		//return false;
		selectObjects='All';
	}
	else
	  selectObjects = getSelectedObjects();
	appletObj.sendRTAStopReq(tenant_dbid,selectObjects);
}

function updateStartButton()
{
	 if(document.theForm.startButton.disabled == true){
		document.theForm.startButton.disabled = false;
		document.theForm.stopButton.disabled = true;
	  }
	 else{
		document.theForm.startButton.disabled = true;
		document.theForm.stopButton.disabled = false;
	 }
}

function updateStopButton()
{
 	if(document.theForm.stopButton.disabled == true){
		document.theForm.startButton.disabled = true;
		document.theForm.stopButton.disabled = false;
	 }
 else{
		document.theForm.startButton.disabled = false;
		document.theForm.stopButton.disabled = true;
	 }
}


function selectAll()
{
  for (j = 0; j <document.theForm.objects.options.length; j++)
	  document.theForm.objects.options[j].selected = true;  
}

function unSelectAll()
{
  for (j = 0; j <document.theForm.objects.options.length; j++)
	  document.theForm.objects.options[j].selected = false;  

}

function getRequestedReport()
{

	var destination = '';
	if(document.theForm.period[1].checked){
		if(document.theForm.startingDateDaily.value.length == 0)
		{
			alert("<%= pageData.getWord("Please enter a starting date")%>");
			return false;
		}
		if(document.theForm.endingDateDaily.value.length == 0)
		{
			alert("<%= pageData.getWord("Please enter an ending date")%>");
			return false;
		}
	}
	/*
	if(document.theForm.objects.selectedIndex == -1)
	{
		alert("Please select at least one object");
		return;
	}
	*/
	if(dateChecker() == false)
	{
		return;
	}
	if(!IsPhoneNumber(document.theForm.phoneNumber.value))
	{
		alert("<%= pageData.getWord("Please enter a valid phone number")%>");
		return false;
	}
	
	
	if(validation(document.theForm.phoneNumber.value)==0)
	{
		alert("<%= pageData.getWord("Invalid use of character")%>");
		document.theForm.phoneNumber.focus();
		return;
	}
	
 	if(vValue == 'Inbound'){
		destination = "../jsp/inbound.jsp"
	}
	destination += "?startingDateDaily="
	destination += document.theForm.startingDateDaily.value;
	destination +="&endingDateDaily=";
	destination += document.theForm.endingDateDaily.value;
 	destination +="&spacing=";
	destination += document.theForm.spacing.value;
	destination +="&dnis=";
	destination += document.theForm.phoneNumber.value;

	destination +="&starting_month_monthly=";
	destination += document.theForm.starting_month_monthly.value
	destination +="&starting_year_monthly=";
	destination += document.theForm.starting_year_monthly.value
	//destination +="&ending_month_monthly=";
	//destination += document.theForm.ending_month_monthly.value
	//destination +="&ending_year_monthly=";
	//destination += document.theForm.ending_year_monthly.value

	destination +="&reportType=";
	 if(document.theForm.period[0].checked){
		destination += "Monthly";
	 } else if(document.theForm.period[1].checked){
		destination += "Daily";
	 }
     destination += "&lang="+lang;
    //alert("before open window !!!");
	//alert(destination);
	 window.open(destination);
	//document.location = destination;
}
function dateChecker()
{
	if(document.theForm.period[1].checked){// daily
		var startDate=new Date(document.theForm.startingDateDaily.value);
		var endDate = new Date(document.theForm.endingDateDaily.value);
		if(endDate < startDate)
		{
			alert("<%= pageData.getWord("Your ending date cannnot be smaller than your starting date")%>");
			return false;
		}
	}
  else if (document.theForm.period[0].checked)
  { // monthly
		var startDate='01-'+ document.theForm.starting_month_monthly.value + '-' + document.theForm.starting_year_monthly.value;
		startDate = new Date(startDate);
		//var endDate ='01-'+  document.theForm.starting_month_monthly.value+ '-' + document.theForm.starting_year_monthly.value;
		
		//endDate = new Date(endDate);
		
		//var endDate ='01-'+  document.theForm.ending_month_monthly.value+ '-' + document.theForm.ending_year_monthly.value;
		
		//endDate = new Date(endDate);

		//if(endDate < startDate || endDate > startDate)*/
		/*if(endDate < startDate)
		{
			alert(MultiArray["Your ending month-year must be the same as your starting month-year!"][lang]);
			return false;
		}*/

}/*else if (period[0].checked){// yearly
    var startDate=starting_year_yearly.value ;
	var endDate = ending_year_yearly.value ;

	if(endDate < startDate)
	{
		alert("Your ending date cannnot be smaller than your starting date!!");
		return false;
	}
}*/

return true;
}
/*-------- 2006-16-06
function setEndingMonth()
{
	if(document.theForm.period[0].checked)
	{
	  for (i=0; i<ending_month_monthly.options.length; i++)
		  if(ending_month_monthly.options[i].value == starting_month_monthly.value)
			ending_month_monthly.options[i].selected = true;
	}
}
*/


function changeDisabled(){
	if(document.theForm.period[0].checked){
		document.theForm.startingDateDaily.disabled = true;
		document.theForm.endingDateDaily.disabled = true;
		/*starting_year_yearly.disabled = false;
		ending_year_yearly.disabled = false;*/
		document.theForm.starting_month_monthly.disabled = false;
		document.theForm.starting_year_monthly.disabled = false;
		//document.theForm.ending_month_monthly.disabled = false;
		//document.theForm.ending_year_monthly.disabled = false;
	}/* else if(period[1].checked){
		startingDateDaily.disabled = true;
		endingDateDaily.disabled = true;
		starting_year_yearly.disabled = true;
		ending_year_yearly.disabled = true;
		starting_month_monthly.disabled = false;
		starting_year_monthly.disabled = false;
		ending_month_monthly.disabled = false;
		ending_year_monthly.disabled = false;
	} else*/
	if(document.theForm.period[1].checked){
		document.theForm.startingDateDaily.disabled = false;
		document.theForm.endingDateDaily.disabled = false;
		/*starting_year_yearly.disabled = true;
		ending_year_yearly.disabled = true;*/
		document.theForm.starting_month_monthly.disabled = true;
		document.theForm.starting_year_monthly.disabled = true;
		//document.theForm.ending_month_monthly.disabled = true;
		//document.theForm.ending_year_monthly.disabled = true;
	}
 }

 function enableUpdateButton()
 {
     var vValue = normalizeString(QueryString('type'));
 	 if (vValue == 'AgentGroupsRTA'){
	    document.theForm.saveButton.value = 'Update';
		document.theForm.saveButton.disabled = false;
	 }
  }

 function setDefaultValue()
 {
     var vValue = normalizeString(QueryString('type'));

 	 if (vValue == 'AgentGroupsRTA' || vValue == 'Agents'){
	 
        	for (j = 0; j <document.theForm.startTime.length; j++){
		   		if(document.theForm.startTime.options[j].value == String( appletObj.m_adh_start_time ) )
					{document.theForm.startTime.options[j].selected = true;
					 break;}
        	}

			for (j = 0; j <document.theForm.endTime.length; j++){
		   		if(document.theForm.endTime.options[j].value == String( appletObj.m_adh_end_time ) )
					{document.theForm.endTime.options[j].selected = true;
					 break;
					 }
        	}

			for (j = 0; j <document.theForm.spacing.length; j++){
		   		if(document.theForm.spacing.options[j].value == String( appletObj.m_adh_spacing ))
					{document.theForm.spacing.options[j].selected = true;
					 break;
					 }
        	}        	
		
	 }
	 
	if(vValue == 'Agents'){
		var thetime =new Date();
		var thisYear = thetime.getYear();
		var thisMonth =thetime.getMonth()+1;
	    
		for (j = 0; j <document.theForm.starting_year_monthly.length; j++){
			if(document.theForm.starting_year_monthly.options[j].value == thisYear)
				{document.theForm.starting_year_monthly.options[j].selected = true;
					break;
					}
		}
		for (j = 0; j <document.theForm.starting_month_monthly.length; j++){
			if(document.theForm.starting_month_monthly.options[j].value == thisMonth)
				{document.theForm.starting_month_monthly.options[j].selected = true;
					break;
					}
		}
	    
		for (j = 0; j <document.theForm.ending_year_monthly.length; j++){
			if(document.theForm.ending_year_monthly.options[j].value == thisYear)
				{document.theForm.ending_year_monthly.options[j].selected = true;
					break;
					}
		}
/*------- 2006-16-06    
		for (j = 0; j <document.theForm.ending_month_monthly.length; j++)
		{
			if(document.theForm.ending_month_monthly.options[j].value == thisMonth)
				{
				document.theForm.ending_month_monthly.options[j].selected = true;
					break;
					}
		}
*/		
	}
 }

</script>
<style type="text/css">
<!--
.style1 {
    font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
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
<!-- onLoad="fillObjectCombo()"-->
<body  class="rep_body">
	<div class="tab-pane" id="tabPane1">
<form name="theForm" onKeyDown="KeyDownHandler(submit)">
	<script type="text/javascript">
				tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
			</script>
			<div class="tab-page" id="tabGeneral">
				<fieldset>
				<legend id="caption">
					<script language="JavaScript">
    				var vValue = normalizeString(QueryString('type'));
    				if (vValue == 'Inbound'){
       					document.write("<%= pageData.getWord("Inbound call report")%>");
    				}
    				</script>
				</legend>

<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-top:10px;"  width="75%" align="left">
  
   <tr>
     <td  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" >&nbsp;&nbsp;&nbsp;<%= pageData.getWord("Phone number")%> </td>
     <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">
     <input type="text" name="phoneNumber" size="20"> </td>
     <td colspan="2"  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" ></td>
     <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1"></td>
   </tr>
   <tr><td height="20">&nbsp;</td>
   <tr>
     <td  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" >&nbsp;&nbsp;&nbsp;<%= pageData.getWord("Spacing (min)")%></td>
     <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">
	 <select name="spacing" onChange="enableUpdateButton()" >
       <!--<option value=""></option>-->     
      <option value="15">15</option>
       <option value="30" selected>30</option>
       <option value="60">60</option>
       <!--<option value="120">120</option>--> 
     </select></td>
     <td colspan="2"  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" ></td>
     <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1"></td>
   </tr>
   
   </tr>
   <tr height="20" valign="top" >
     <td >&nbsp;</td>
   </tr>
  <tr >
    <td width="34%" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" >
     <b>&nbsp;&nbsp;&nbsp;<%= pageData.getWord("Report type")%></b>
    </td>
</tr>

  <tr>
   <td>&nbsp;&nbsp;&nbsp;
   	<input name="period" type="radio" value="monthly" onClick="changeDisabled()">&nbsp;<%= pageData.getWord("Monthly")%>
   </td>
   <td valign="top" width="34%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" >
     <select name="starting_month_monthly" disabled="true">
    		<option value="01">01</option>
    		<option value="02">02</option>
    		<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
    </select>
	 <select name="starting_year_monthly" disabled="true">
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008" selected>2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
    </select>
	</td> 
	<!--
    <td valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1">
     <select name="ending_month_monthly" disabled="false">
    		<option value="01">01</option>
    		<option value="02">02</option>
    		<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
    </select>
	 <select name="ending_year_monthly" disabled="false">
    		<option value="2004">2004</option>
    		<option value="2005">2005</option>
    		<option value="2006" selected>2006</option>
			<option value="2007">2007</option>
			<option value="2008">2008</option>
			<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
    </select> 
    </td> -->
  </tr>
  <tr>
 	<td width="34%" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" >
     <b>&nbsp;&nbsp;&nbsp;</b>
    </td> 
    <td width="38%" style="border-top-style: none; border-top-width: 1" >
     <b><%= pageData.getWord("Starting date")%></b>   
    </td>
    <td width="28%" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" >
     <b><<%= pageData.getWord("Ending date")%></b>
    </td>
  </tr>
   <tr>
   <td>&nbsp;&nbsp;&nbsp;
    <input name="period" type="radio" value="daily"  onClick="changeDisabled()" checked>&nbsp;<%= pageData.getWord("Daily")%>
   </td>
   <td id="id_startingDateDaily" valign="top" width="34%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" >
   	 <input type="text" size="20" onFocus="showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()" name="startingDateDaily" />

    </td>
    <td id="id_endingDateDaily" valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1">
     	<input type="text" size="20" onFocus="showCalendar('',this,this,'','id_endingDateDaily',0,30,1);this.blur()" name="endingDateDaily"/>
    </td>
  <tr>

  <tr>
	<td colspan="2"  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" >&nbsp;</td>
	<td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">&nbsp;</td>
	<td  valign="top"  align="right" >
	<input id="submit" type="button" value='<%= pageData.getWord("Submit")%>' onClick="getRequestedReport()">
	</td>
 </tr>
 <script language="javascript" type="text/javascript">
	document.writeln("	<td  valign=\"top\"  align=\"left\" ></td>");
	document.writeln("	<td  style=\"border-bottom-width: 1; border-top-width:1\">&nbsp;</td>");
	document.writeln("	<td  style=\"border-bottom-width: 1;  border-top-width:1\">&nbsp; </td>");
	document.writeln("	<td  valign=\"top\"  align=\"right\" >&nbsp;</td>");
	document.writeln("	<td  valign=\"top\"  align=\"right\" >&nbsp;</td> ");
	document.writeln("</tr>");

  </script>
</table>
 <script language="javascript" type="text/javascript">
 setDefaultValue();
 </script>
		</fieldset>
			</div>
		 </form>
	</div>

</body>
<% pageData.closeConnection(); %>
</html>