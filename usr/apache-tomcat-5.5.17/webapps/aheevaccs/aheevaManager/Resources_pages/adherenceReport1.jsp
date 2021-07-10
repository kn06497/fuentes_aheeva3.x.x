<html>
<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<LINK href="style.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >

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

<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<!-- Calendrier début -->
<%@ include file="xc2_default_labels.jsp" %>
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->
<script language="JavaScript" src="jsUtil.js">
</script>
<script language="JavaScript">

var tenant_dbid = normalizeString(QueryString('tenant_dbid'));
var agentGroups = String( appletObj.getAgentGroupByName(tenant_dbid) );

function sortSelect(o)
{
	/*var o = new Array();
	if (obj.options==null) { return; }
	for (var i=0; i<obj.options.length; i++) {
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;
		}*/
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
	/*for (var i=0; i<o.length; i++) {
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}*/

}

function fillObjectCombo()
{
	//var vValue = normalizeString(QueryString('type'));
		var agents = String( appletObj.getAgentsByName(tenant_dbid) );
		var o = new Array();

	/*Fill agents combo box with agents name*/
        var jsAgents = agents + "";
    	arrayAgents = jsAgents.split("|");
    	if(agents.length > 0 ){
    		for (j = 0; j <arrayAgents.length; j++){
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if (document.theForm.viewckbox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents [j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)
				//optionPos = objects.options.length
				//objects.options[optionPos]=myOption
				o[o.length]= myOption;

    		}
		}
		//Sort the object
		sortSelect(o);
		/*o = o.sort(
				function(a,b) {

						if (parseInt(a.value) < parseInt(b.value)) { return -1; }
						if (parseInt(a.value) > parseInt(b.value)) { return 1; }
						return 0;
					}
				); */
		for (var i=0; i<o.length; i++) {
			document.theForm.objects.options[i+1] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}

        /*Fill agents group combo box with agent group name*/
        var jsAgentGroups = agentGroups + "";
    	arrayGroups = jsAgentGroups.split("|");
    	for (j = 0; j <arrayGroups.length; j++){
    		myOption = new Option(arrayGroups[j],arrayGroups[j])
			optionPos = document.theForm.agtGrp.options.length
			document.theForm.agtGrp.options[optionPos]=myOption
    	}
  // sortSelect(document.theForm.objects);

 }


function getAgentsInGroup()
{
	var o = new Array();
	if(document.theForm.agtGrp.value =='AllGroups')
	{
		//Empty the agents combo box
		var j=document.theForm.objects.options.length;
        if (j>0){
           document.theForm.objects.length = 0;
        }
        var defaultvalue =  "- All Agents -" ;
		myOption = new Option(defaultvalue,"AllAgents")
		//optionPos = document.theForm.objects.options.length
		//document.theForm.objects.options[optionPos]=myOption
		o[o.length]= myOption;

		//fillObjectCombo();
        var agents = String( appletObj.getAgentsByName(tenant_dbid) );
        var jsAgents = agents + "";
    	arrayAgents = jsAgents.split("|");
    	if(agents.length > 0 ){
    		for (j = 0; j <arrayAgents.length; j++){
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if (document.theForm.viewckbox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents [j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)
				//optionPos = document.theForm.objects.options.length
				//document.theForm.objects.options[optionPos]=myOption
				o[o.length]= myOption;
    		}

		 }

	}
	else
	{

		var agents = String( appletObj.getAvailableAgentListInGroupByStatus(document.theForm.agtGrp.value,1) );
		var jsAgents = agents + "";

		// Remove all agents from agents option field
		var i=document.theForm.objects.options.length;
        if (i>0){
              document.theForm.objects.length = 0;
        }
        var defaultvalue =  "- All Agents -" ;
		myOption = new Option(defaultvalue,"AllAgents")
		//optionPos = document.theForm.objects.options.length
		//document.theForm.objects.options[optionPos]=myOption
		o[o.length]= myOption;

		if(agents.length > 0 ){
			arrayAgents = jsAgents.split("|");
    		for (j = 0; j <arrayAgents.length; j++){
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
    			//myOption = new Option(arrayAgents [j],login)
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if (document.theForm.viewckbox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents [j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)

				//optionPos = document.theForm.objects.options.length
				//document.theForm.objects.options[optionPos]=myOption
				o[o.length]= myOption;

			}
         }

	}

	sortSelect(o);

	for (var i=0; i<o.length; i++) {
		document.theForm.objects.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}

	return;
}

function changeAgentListView(){
	var agents;
	var name="";
	var o = new Array();
	document.theForm.objects.length = 0;
	/*while(document.theForm.objects.length > 0){
		document.theForm.objects.options[0]= null;
	 }
	if (ckbox.checked == true)
    	agents = appletObj.getAgentsByName(tenant_dbid);
	else
	agents = appletObj.getAgentsByNameActif(tenant_dbid);*/
    var defaultvalue =  "- All Agents -" ;
	myOption = new Option(defaultvalue,"AllAgents")
	//optionPos = document.theForm.objects.options.length
	o[o.length]=myOption

	if(document.theForm.agtGrp.value == 'AllGroups')
		agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
	else
		agents = String( appletObj.getAvailableAgentListInGroupByStatus(document.theForm.agtGrp.value,1) );
    var jsAgents = agents + "";
    arrayAgents = jsAgents.split("|");
    for (j = 0; j <arrayAgents.length; j++){
		  var iStartPos = arrayAgents[j].indexOf('[');
		  var iEndPos   = arrayAgents[j].indexOf(']');
		  var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
		  name = login+'['+arrayAgents[j].substr(0,iStartPos)+']'
		  if (document.theForm.viewckbox.checked == false)  // show agents name as : firstname, lastname[login]
			myOption = new Option(arrayAgents [j],login);  // show agents name as : login[firstname, lastname]
		  else
			myOption = new Option(name,login);
		  //optionPos = document.theForm.objects.options.length;
		  o[o.length]=myOption

   }

	sortSelect(o);

	for (var i=0; i<o.length; i++) {
		document.theForm.objects.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}

}

function changeDisabled(){
	if(document.theForm.period[0].checked){
		document.theForm.startingDateDaily.disabled = true;
		document.theForm.endingDateDaily.disabled = true;
		document.theForm.starting_year_yearly.disabled = false;
		document.theForm.ending_year_yearly.disabled = false;
		document.theForm.starting_month_monthly.disabled = true;
		document.theForm.starting_year_monthly.disabled = true;
		document.theForm.ending_month_monthly.disabled = true;
		document.theForm.ending_year_monthly.disabled = true;
	} else if(document.theForm.period[1].checked){
		document.theForm.startingDateDaily.disabled = true;
		document.theForm.endingDateDaily.disabled = true;
		document.theForm.starting_year_yearly.disabled = true;
		document.theForm.ending_year_yearly.disabled = true;
		document.theForm.starting_month_monthly.disabled = false;
		document.theForm.starting_year_monthly.disabled = false;
		document.theForm.ending_month_monthly.disabled = false;
		document.theForm.ending_year_monthly.disabled = false;
	} else if(document.theForm.period[2].checked){
		document.theForm.startingDateDaily.disabled = false;
		document.theForm.endingDateDaily.disabled = false;
		document.theForm.starting_year_yearly.disabled = true;
		document.theForm.ending_year_yearly.disabled = true;
		document.theForm.starting_month_monthly.disabled = true;
		document.theForm.starting_year_monthly.disabled = true;
		document.theForm.ending_month_monthly.disabled = true;
		document.theForm.ending_year_monthly.disabled = true;
	}
}


function getSelectedObjects()
{
	selectedAgents = new Array()
	for (i=document.theForm.objects.selectedIndex;i<document.theForm.objects.options.length;i++) {
  		if (document.theForm.objects.options[i].selected) {
  			selectedAgents[selectedAgents.length]=document.theForm.objects.options[i].value;
  		}
  	}
	var url = '';
	if (selectedAgents.length > 0)
	{
		url= escape(selectedAgents.join('/'))
	}
	return url;
}


function getRequestedReport()
{

	var destination = '';
	if(document.theForm.period[2].checked){
		if(document.theForm.startingDateDaily.value.length == 0)
		{
			alert('<%= pageData.getWord("Please enter a starting date")%>');
			return false;
		}
		if(document.theForm.endingDateDaily.value.length == 0)
		{
			alert('<%= pageData.getWord("Please enter an ending date")%>');
			return false;
		}
	}
	if(document.theForm.objects.selectedIndex == -1)
	{
		alert('<%= pageData.getWord("Please select at least one object")%>');
		return;
	}
	if(dateChecker() == false)
	{
		return;
	}


    destination = "../jsp/adherenceReport.jsp";
	destination += "?startingDateDaily="
	destination += document.theForm.startingDateDaily.value;
	destination +="&endingDateDaily=";
	destination += document.theForm.endingDateDaily.value;
	destination +="&starting_year_yearly=";
	destination += document.theForm.starting_year_yearly.value
	destination +="&ending_year_yearly=";
	destination += document.theForm.ending_year_yearly.value
	destination +="&starting_month_monthly=";
	destination += document.theForm.starting_month_monthly.value
	destination +="&starting_year_monthly=";
	destination += document.theForm.starting_year_monthly.value
	destination +="&ending_month_monthly=";
	destination += document.theForm.ending_month_monthly.value
	destination +="&ending_year_monthly=";
	destination += document.theForm.ending_year_monthly.value

	destination +="&reportType=";
	if(document.theForm.period[0].checked){
		destination += "Yearly";
	} else if(document.theForm.period[1].checked){
		destination += "Monthly";
	} else if(document.theForm.period[2].checked){
		destination += "Daily";
	}


	destination +="&objects=";
	destination += getSelectedObjects();
	destination +="&agtGrp=";
	//destination += agtGrp.value;

	var selectedGroups = document.theForm.agtGrp.value;
	if(document.theForm.agtGrp.value == 'AllGroups')
	{
	  selectedGroups = selectedGroups + '/';
	  var i;
	  for(i=1; i<document.theForm.agtGrp.options.length; i++){
		 selectedGroups = selectedGroups + document.theForm.agtGrp.options[i].value + '!';
	   }
	  if(document.theForm.agtGrp.options.length > 1)
		 selectedGroups = selectedGroups.substring(0,selectedGroups.length-1);
	}
	destination += selectedGroups;

	
	destination +="&order=";
	if(document.theForm.adherenceOrder[0].checked){
		destination += "desc";
	} else if(document.theForm.adherenceOrder[1].checked){
		destination += "loginID";
	} else if(document.theForm.adherenceOrder[2].checked){
		destination += "asc";
	} else if(document.theForm.adherenceOrder[3].checked){
		destination += "name";
	}	
	

	destination += "&lang="+lang;
	destination +="&prec=-1&suiv=1&current=0&all_obj=0";
	//document.location = destination;
	window.open(destination);
}



function dateChecker()
{
	if(document.theForm.period[2].checked){// daily
		var startDate=new Date(document.theForm.startingDateDaily.value);
		var endDate = new Date(document.theForm.endingDateDaily.value);
		if(endDate < startDate)
		{
			alert('<%= pageData.getWord("Your ending date cannnot be smaller than your starting date")%>');
			return false;
		}
	} else if (document.theForm.period[1].checked){ // monthly
		var startDate='01-'+ document.theForm.starting_month_monthly.value + '-' + document.theForm.starting_year_monthly.value;
		var endDate ='01-'+  document.theForm.ending_month_monthly.value+ '-' + document.theForm.ending_year_monthly.value;
		startDate = new Date(startDate);
		endDate = new Date(endDate);

		if(endDate < startDate)
		{
			alert('<%= pageData.getWord("Your ending date cannnot be smaller than your starting date")%>');
			return false;
		}

	}else if (document.theForm.period[0].checked){// yearly
		var startDate=document.theForm.starting_year_yearly.value ;
		var endDate = document.theForm.ending_year_yearly.value ;

		if(endDate < startDate)
		{
			alert('<%= pageData.getWord("Your ending date cannnot be smaller than your starting date")%>');
			return false;
		}
	}

	return true;
}

 function setDefaultValue()
 {
     var vValue = normalizeString(QueryString('type'));	 
	 if(  vValue == 'AgentAdherenceReport'){
		var thetime = new Date();
		var thisYear = thetime.getYear();
		var thisMonth = thetime.getMonth()+1;
	    
		for (j = 0; j <document.theForm.starting_year_yearly.length; j++){
			if(document.theForm.starting_year_yearly.options[j].value == thisYear)
				{document.theForm.starting_year_yearly.options[j].selected = true;
					break;
					}
		}
		for (j = 0; j <document.theForm.ending_year_yearly.length; j++){
			if(document.theForm.ending_year_yearly.options[j].value == thisYear)
				{document.theForm.ending_year_yearly.options[j].selected = true;
					break;
					}
		}	    
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
    
		for (j = 0; j <document.theForm.ending_month_monthly.length; j++){
			if(document.theForm.ending_month_monthly.options[j].value == thisMonth)
				{document.theForm.ending_month_monthly.options[j].selected = true;
					break;
					}
		}
		
	}
 }


function displayStats()
{
	//alert(window.top.main.body.rows)

 if (statsChk.checked)
  {
  	document.body.rows = "*,100%,*";	
  }
  else{    	
	document.body.rows = "60%,40%,*";	
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
	
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
	
<body class="adher_body" onLoad="fillObjectCombo()">
	<div class="tab-pane" id="tabPane1">
<form name="theForm" onKeyDown="KeyDownHandler(submit)">
  	<script type="text/javascript">
				tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
			</script>
			<div class="tab-page" id="tabGeneral">
				<fieldset>
				<legend id="caption">
					<%= pageData.getWord("Adherence Report")%>
				</legend>
  
  <table style="BORDER-COLLAPSE: collapse" cellSpacing="0" cellPadding="0" width="650" border="0">
			<tr>
				<td colSpan="4">&nbsp;</td>
			</tr>
			<tr>
				<td width="136" height="23"><%= pageData.getWord("Agent Groups")%>
				</td>
				<td width="201"><select onChange="getAgentsInGroup()" name="agtGrp">
						<option value="AllGroups" selected>- <%= pageData.getWord("All groups")%> -</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="136" height="23"><%= pageData.getWord("Agent")%>
				</td>
				<td width="201"><select name="objects">
						<option value="AllAgents" selected>- <%= pageData.getWord("All agents")%> -</option>
					</select>
				</td>
				<td valign="top" width="45%" >
					<%= pageData.getWord("Show agent by ID")%><input type="checkbox" name="viewckbox" onClick="changeAgentListView()" ID="Checkbox2">
				</td>
			</tr>
			<tr>
				<td width="136"></td>
				<td width="201" colSpan="2"></td>
			</tr>
			<!--<tr>
				<td height="23"><b>Call time </b>
				</td>
				<td height="23"><b>From</b> <input onfocus="getCalendarFor(this); this.blur()" type="text" size="20" name="startingDate"></td>
				<td colSpan="2" height="23"><b>To</b> <input onfocus="getCalendarFor(this); this.blur()" type="text" size="20" name="endingDate">
				</td>
			</tr>-->
			<tr>
				<td align="left"></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td height="20">&nbsp;</td>
				<td height="20">&nbsp;</td>
				<td height="20">&nbsp;</td>
			</tr>
			<tr height="26" valign="top">
				<td width="34%">
					<b><%= pageData.getWord("Report type")%></b>
				</td>
				<td width="38%">
					<b><%= pageData.getWord("Starting date")%></b>
				</td>
				<td width="28%">
					<b><%= pageData.getWord("Ending date")%></b>
				</td>
			</tr>
			<tr height="26">
				<td>
					<input name="period" type="radio" value="yearly" onClick="changeDisabled()" ID="Radio4"><%= pageData.getWord("detail for each year")%>
				</td>
				<td valign="top" width="34%">
					<select name="starting_year_yearly" disabled ID="Select8">
						<option value="2004">2004</option>
						<option value="2005" selected>2005</option>
						<option value="2006">2006</option>
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
				</td>
				<td valign="top" width="38%">
					<select name="ending_year_yearly" disabled ID="Select9">
						<option value="2004">2004</option>
						<option value="2005" selected>2005</option>
						<option value="2006">2006</option>
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
				</td>
			</tr>
			<tr>
				<td>
					<input name="period" type="radio" value="monthly" onClick="changeDisabled()" ID="Radio5"><%= pageData.getWord("detail for each month")%>
				</td>
				<td valign="top" width="34%">
					<select name="starting_month_monthly" disabled ID="Select10">
						<option value="01" selected>01</option>
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
					<select name="starting_year_monthly" disabled ID="Select11">
						<option value="2004" selected>2004</option>
						<option value="2005">2005</option>
						<option value="2006">2006</option>
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
				</td>
				<td valign="top" width="38%">
					<select name="ending_month_monthly" disabled ID="Select12">
						<option value="01" selected>01</option>
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
					<select name="ending_year_monthly" disabled ID="Select13">
						<option value="2004">2004</option>
						<option value="2005" selected>2005</option>
						<option value="2006">2006</option>
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
				</td>
			</tr>
			<tr>
				<td>
					<input name="period" type="radio" value="daily" onClick="changeDisabled()" checked ID="Radio6"><%= pageData.getWord("detail for each day")%>
				</td>
				<td valign="top" width="34%">
					<input type="text" size="20" onFocus="showCalendar('',this,this,'','Text3',0,30,1);this.blur()" name="startingDateDaily"
						ID="Text3">
				</td>
				<td valign="top" width="38%">
					<input type="text" size="20" onFocus="showCalendar('',this,this,'','Text4',0,30,1);this.blur()" name="endingDateDaily"
						ID="Text4">
				</td>
			</tr>
			<tr>
			  <td align="left"></td>
			  <td></td>
			  <td align="right">&nbsp;</td>
			  <td></td>
		  </tr>
			<tr>
			  <td align="left"><b><%= pageData.getWord("Show report order by")%> </b></td>
			  <td><input name="adherenceOrder" type="radio" value="desc"  checked ID="Radioa1">
<%= pageData.getWord("adherence value descending")%> </td>
			  <td align="right"><div align="left">
      <input name="adherenceOrder" type="radio" value="loginID"   ID="Radioa2">
<%= pageData.getWord("agent login ID")%> </div></td>
			  <td></td>
		  </tr>
			<tr>
			  <td align="left"></td>
			  <td><input name="adherenceOrder" type="radio" value="asc"   ID="Radioa3">
		      <%= pageData.getWord("adherence value ascending")%></td>
			  <td align="right"><div align="left">
			    <input name="adherenceOrder" type="radio" value="agtname"   ID="Radioa4">
<%= pageData.getWord("agent name")%> </div></td>
			  <td></td>
		  </tr>
			<tr>
				<td align="left"></td>
				<td></td>
				<td align="right">&nbsp;</td>
				<td></td>
			</tr>
			<tr>
				<td align="left" width="155" height="40">
			<input id="submit" type="button" value='<%= pageData.getWord("Submit")%>' onClick="getRequestedReport()">
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<script>setDefaultValue();</script>
				</fieldset>
				</div>
			</form>
		</div>
</body>
<% pageData.closeConnection(); %>
</html>

