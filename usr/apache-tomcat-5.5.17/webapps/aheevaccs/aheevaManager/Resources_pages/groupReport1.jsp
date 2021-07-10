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


<!-- Calendrier début -->
<%@ include file="xc2_default_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->
<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script>

var vValue = normalizeString(QueryString('type'));
var tenant_dbid = normalizeString(QueryString('tenant_dbid'));
//alert("vValue"+vValue);
var doingSearch = 0; // shows if a search is being performed

function fillObjectCombo()
{
	document.getElementById("noresult").style.visibility="hidden";

		
    if((vValue=='GroupForecast') || (vValue=='GroupSummary') )
	{
		var searchFull = new RegExp(document.getElementById("searchfullname").value, "gi");
		var searchPart = new RegExp(document.getElementById("searchpartname").value, "gi");
		var agentGroups = String( appletObj.getAgentGroupByDBIDandName(tenant_dbid) );
		var jsAgentGroups = agentGroups + "";
    	arrayGroups = jsAgentGroups.split("|");
		
		document.theForm.objects.options.length=0; //remove 'loading' text
		if(searchFull!="//ig" && doingSearch==1) { // if full name search
			doingSearch=0;
			for (j = 0; j <arrayGroups.length; j++){
				if(arrayGroups[j].search(searchFull)==0) {
					var groups = arrayGroups[j].split(",");
					myOption = new Option(groups[0],arrayGroups[j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
			}
		}else if(searchPart!="//ig" && doingSearch==1) { // if partial name search
			doingSearch=0;
			for (j = 0; j <arrayGroups.length; j++){
				if(arrayGroups[j].search(searchPart)!=-1) {
					var groups = arrayGroups[j].split(",");
					myOption = new Option(groups[0],arrayGroups[j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
			}
		}else{
			for (j = 0; j <arrayGroups.length; j++){
				var groups = arrayGroups[j].split(",");

				myOption = new Option(groups[0],arrayGroups[j])
				optionPos = document.theForm.objects.options.length
				document.theForm.objects.options[optionPos]=myOption
			}
		}
		if(document.theForm.objects.options.length==0) {
			document.getElementById("noresult").style.visibility="";
		}
    }

	formObjectsResize();
}

function formObjectsResize() {
	if(document.theForm.objects.options.length >= 7)
	   	document.theForm.objects.size = 7;
	else if(document.theForm.objects.options.length < 3)
		document.theForm.objects.size = 3;
	else
		document.theForm.objects.size = document.theForm.objects.options.length+1;
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

function KeyDownHandler(btn){
	
	// process only the Enter key
	if (event.keyCode == 13){
		
		if (document.activeElement) { // for ie
			if(document.activeElement.id=="searchfirst" || document.activeElement.id=="searchlast" || document.activeElement.id=="searchid" || document.activeElement.id=="searchfullname" || document.activeElement.id=="searchpartname") {
				searchFor();
			}else{
				// cancel the default submit
				event.returnValue=false;
				event.cancel = true;
				// submit the form by programmatically clicking the specified button
				btn.click();
			}
		}else{ // for firefox
			if(document.focusNode.id=="searchfirst" || document.focusNode.id=="searchlast" || document.focusNode.id=="searchid" || document.focusNode.id=="searchfullname" || document.focusNode.id=="searchpartname") {
				searchFor();
			}else{
				// cancel the default submit
				event.returnValue=false;
				event.cancel = true;
				// submit the form by programmatically clicking the specified button
				btn.click();
			}
		}
	}
}

function searchFor() { // varify text search

	var thisSearch1 = document.getElementById("searchfullname").value;
	var thisSearch2 = document.getElementById("searchpartname").value;
		
	if (thisSearch1.match(/\?/) || thisSearch1.match(/\*/) || thisSearch1.match(/\(/) || thisSearch1.match(/\)/) || thisSearch1.match(/\+/) || thisSearch1.match(/\[/) || thisSearch1.match(/\]/) || thisSearch1.match(/\</) || thisSearch1.match(/\>/) || thisSearch1.match(/\|/) || thisSearch1.match(/\./) || thisSearch2.match(/\?/) || thisSearch2.match(/\*/) || thisSearch2.match(/\(/) || thisSearch2.match(/\)/) || thisSearch2.match(/\+/) || thisSearch2.match(/\[/) || thisSearch2.match(/\]/) || thisSearch2.match(/\</) || thisSearch2.match(/\>/) || thisSearch2.match(/\|/) || thisSearch2.match(/\./)) { // disallowed characters
		alert("<%=pageData.getWord("Search query cannot contain")%> '?', '*', '.', '+', '(', ')', '[', ']', '<', '>' <%=pageData.getWord("or")%> '|'");
	}else if (document.getElementById("searchfullname").value!="" && document.getElementById("searchpartname").value!=""){
		alert("<%=pageData.getWord("Search for either")%>\n\n'<%=pageData.getWord("Name")%>'\n(<%=pageData.getWord("can be the full name or the begining of the name")%>)\n<%=pageData.getWord("or")%> '<%=pageData.getWord("Name includes")%>'\n(<%=pageData.getWord("search for text that is included anywhere in the name")%>)\n\n<%=pageData.getWord("but not both")%>.");
	}else{
		doingSearch=1;
		fillObjectCombo();
	}
}

function resetResults() {
	
	document.getElementById("searchfullname").value="";
	document.getElementById("searchpartname").value="";
	fillObjectCombo();
}



function getSelectedObjects()
{

	selectedObjects = new Array()
	for (i=document.theForm.objects.selectedIndex;i<document.theForm.objects.options.length;i++) {
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

function getRequestedReport()
{

	var destination = '';
	if(document.theForm.objects.selectedIndex == -1)
	{
		alert("<%= pageData.getWord("Please select at least one object")%>");
		return;
	}
	else
	{
		if( vValue=='GroupForecast' )
		{
			if(document.theForm.startingDateDaily.value.length == 0)
			{
			alert("<%= pageData.getWord("Please enter a date for report")%>");
			return false;
			}
		}
		else if( vValue=='GroupSummary' )
		{
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
	}
	if(vValue == 'GroupForecast')
	{
		destination = "../jsp/groupForecastReports.jsp"
	}
	else if( vValue=='GroupSummary' )
	{
		destination = "../jsp/groupSummaryReports.jsp"
	}
	
	destination += "?lang="+lang;
	destination += "&startingDateDaily="
	destination += document.theForm.startingDateDaily.value;
	if( vValue=='GroupSummary' ){
		destination +="&endingDateDaily=";
		destination += document.theForm.endingDateDaily.value;	
	}	
	if(vValue == 'GroupForecast')
	{
		destination +="&interval=";
		destination +=document.theForm.interval.value;
	}
	destination +="&objects=";
	destination += getSelectedObjects();
	destination +="&prec=-1&suiv=1&current=0&all_obj=0";	
	
	window.open(destination);
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
</head>

<body class="rep_body" onLoad="fillObjectCombo()">
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
						if (vValue == 'GroupForecast'){
			  				document.write("<%= pageData.getWord("Group Forecast Daily Report")%>");
						}
						else if( vValue=='GroupSummary' )
						{
							document.write("<%= pageData.getWord("Group Summary Reports")%>");
						}
						</script>
					</legend>
					<table width="100%">
						<tr>
							<td width="100%">
								<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="70%">
	  								<tr height="45">
										<script language="JavaScript">
											var vValue = normalizeString(QueryString('type'));
											if (vValue != '')
											{
												
												document.write('<td valign="top" style="border-left-style:none; border-left-width:1; border-top-style:none; border-top-width:1;" >')
			    								document.write('<br>')
			    								document.write('<select id="objects" name="objects" multiple>')
												document.write('<option value="">&nbsp;</option>')
												document.write('<option value="">&nbsp;&nbsp;<%=pageData.getWord("Loading")%>...</option>')
												document.write('<option value="">&nbsp;&nbsp;<%=pageData.getWord("Please wait")%>.</option>')
			    								document.write('</select>')
			    								document.write('</td>')
												
												if((vValue == 'GroupForecast') ||( vValue=='GroupSummary' ) )
												{
													
													document.write('<td valign="top" style="padding-left:15px;">')
					 								document.write('<div style="width:450px;">')
					 								document.write('<div style="padding-top:8px; padding-bottom:4px;"><%=pageData.getWord("Search for either")%>:</div>')
					 								document.write('<span style="width:130px"><%=pageData.getWord("Name")%></span>')
					 								document.write('<span style="width:130px"><%=pageData.getWord("Name includes")%></span>')
					 								document.write('<br>')
					 								document.write('<span style="width:130px"><input id="searchfullname" type="text" value="" size="16" name="searchfullname" /></span>')
					 								document.write('<span style="width:130px"><input id="searchpartname" type="text" value="" size="16" name="searchpartname" /></span>')
					 								document.write('<button id="searchbut" onClick="searchFor()" style="cursor:pointer"><%=pageData.getWord("Search")%></button>')
					 								document.write('<br>')
					 								document.write('<button name=\"selectAllButton\" onClick=\"selectAll()\" ID="Button1" style="cursor:pointer; margin-right:5px; margin-top:15px;"><%=pageData.getWord("Select all")%></button>')
					 								document.write('<button name=\"unSelectButton\" onClick=\"unSelectAll()\" ID="Button2" style="cursor:pointer; margin-right:30px; margin-top:15px;"><%=pageData.getWord("Select none")%></button>');
					 								document.write('<button onClick="resetResults()" style="cursor:pointer; margin-top:15px;"><%=pageData.getWord("show full list")%></button>')
					 								document.write('</div>')
					 								document.write('</td>')
			 
												} 
											}
											else
											{
		  										document.write('<td>&nbsp;</td>')
		  										document.write('<td>&nbsp;</td>')
		  										document.write('<td>&nbsp;</td>')
											}
										</script>
									</tr>
									<tr>
			 							<td width="28%" valign="top" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" >
			 							</td>
			  						</tr>
  									<tr>
										<td height="20">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="100%">
								<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="100%" align="left">
  									<tr>
										<script>
											if( vValue=='GroupForecast'){
												
												document.write('<td id=\"id_startingDateDaily\" valign=\"top\" width=\"50%\" style=\"border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1\">');
												document.write('&nbsp;&nbsp;&nbsp;');
												document.write("<%= pageData.getWord("Daily Report For")%>");
												document.write('&nbsp;&nbsp;&nbsp;');
												document.writeln("<input type=\"text\" size=\"20\" onFocus=\"showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()\" name=\"startingDateDaily\" />");
												document.write('</td>');
												
											}else if( vValue=='GroupSummary'){
												
												document.write('<td id=\"id_startingDateDaily\" valign=\"top\" width=\"50%\" style=\"border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1\">');
												document.write('&nbsp;&nbsp;&nbsp;');
												document.write("<%= pageData.getWord("Daily Report From")%>");
												document.write('&nbsp;&nbsp;&nbsp;');
												document.writeln("<input type=\"text\" size=\"20\" onFocus=\"showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()\" name=\"startingDateDaily\" />");
												document.write('</td>');
			
												document.write('<td id=\"id_endingDateDaily\" valign=\"top\" width=\"50%\" style=\"border-bottom-style: none; border-bottom-width: 1\" align=\"left"\>');
												document.write('&nbsp;&nbsp;&nbsp;');
												document.write("<%= pageData.getWord("To")%>");
												document.write('&nbsp;&nbsp;&nbsp;');
												document.writeln("<input type=\"text\" size=\"20\" onFocus=\"showCalendar('',this,this,'','id_endingDateDaily',0,30,1);this.blur()\" name=\"endingDateDaily\" />");
												document.write('</td>');
			
											}
										</script>
   									</tr>
   									<tr>
										<td height="20">&nbsp;</td>
									</tr>
								</table>  
							</td>
						</tr>
						<tr>
							<td width="100%">
								<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="100%" align="left" >
  									<tr>
										<script>
	
											if( vValue=='GroupForecast'){
												
												document.write('<td id=\"id_startingDateDaily\" valign=\"top\" width=\"50%\" style=\"border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1\">');
												document.write('&nbsp;&nbsp;&nbsp;');
												document.write("<%= pageData.getWord("Interval Selection")%>");
												document.write('&nbsp;&nbsp;&nbsp;');
												document.write('<select name="interval">');
												document.write('<option value="900">15</option>');
												document.write('<option value="1800">30</option>');
												document.write('</select></td>');
												
											}			
										</script>
   									</tr>
   									<tr>
										<td height="20">&nbsp;</td>
									</tr>
								</table>  	
							</td>
						</tr>
						<tr>
							<td width="100%">
								<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="50%" align="left">
									<tr>
										<td height="20">&nbsp;</td>
									</tr>
									<tr>
										<td>
	  										<input id="submit" type="button" value='<%= pageData.getWord("Submit")%>' onClick="getRequestedReport()" />
										</td>
  									</tr>
								</table>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
		</form>
	</div>
	<div id="noresult" style="position:absolute; top:60px; left:60px; visibility:hidden">No match.</div>
</body>
<% pageData.closeConnection(); %>
</html>