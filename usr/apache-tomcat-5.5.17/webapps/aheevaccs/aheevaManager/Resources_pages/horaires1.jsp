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
<LINK href="style.css" rel="stylesheet" type="text/css" >
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
var complete = normalizeString(QueryString('complete'));

function sortSelect(o)
{
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

}

function sortSelect2(obj)
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



function fillObjectCombo()
{


		var agentGroups = String( appletObj.getAgentGroupByDBIDandName(tenant_dbid) );
		var jsAgentGroups = agentGroups + "";

    	        arrayGroups = jsAgentGroups.split("|");
		for (j = 0; j <arrayGroups.length; j++){
                  var groups = arrayGroups[j].split(",");

    			myOption = new Option(groups[0],arrayGroups[j])
			optionPos = document.theForm.objects.options.length
			document.theForm.objects.options[optionPos]=myOption
    		}

    
    if(document.theForm.objects.options.length >= 10)
	   	document.theForm.objects.size = 10;
	else
		document.theForm.objects.size = document.theForm.objects.options.length;


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

function getRequestedPeriod()
{

	var destination = '';

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
	
	if(dateChecker() == false)
	{
		return;
	}
	
   
if (complete =="no" ){
	destination = "../jsp/horaires.jsp"
}else if (complete =="yes"){
	destination = "../jsp/publishedHoraires.jsp" 
}else{
	destination = "../jsp/report.jsp" 

}

	destination += "?startingDateDaily="
	destination += document.theForm.startingDateDaily.value;
	destination +="&endingDateDaily=";
	destination += document.theForm.endingDateDaily.value;
	destination +="&group=";
	destination += getSelectedObjects();
	
    destination += "&lang="+lang;
	//window.open(destination);
	
	document.location = destination;//ouverture locale
	
}

function dateChecker()
{
	var temp = document.theForm.startingDateDaily.value;
	var start = new Date();
	start.setDate(temp.substring(3, 5));
	start.setMonth(temp.substring(0, 2) - 1);
	start.setYear(temp.substring(6, 10));
	
	var end = Date(document.theForm.endingDateDaily.value);	
	if(start.getDay() != 0)
	{
		alert("<%= pageData.getWord("Report starting date must be Sunday!")%>");
		return false;
	}

	temp = document.theForm.endingDateDaily.value;
	var end = new Date();
	end.setDate(temp.substring(3, 5));
	end.setMonth(temp.substring(0, 2) - 1);
	end.setYear(temp.substring(6, 10));

	if(end.getDay() != 6)
	{
		alert("<%= pageData.getWord("Report ending date must be Saturday!")%>");
		return false;
	}
	if (start > end)
	{
		alert("<%= pageData.getWord("Starting date must be prior to ending date")%>");
		return false;
	}

	if (end.getTime() - start.getTime() > 518400000)
	{
		alert("<%= pageData.getWord("You cannot extract data for more than one week")%>");
		return false;
	}

	return true;
}

function changeDisabled(){

		document.theForm.startingDateDaily.disabled = true;
		document.theForm.endingDateDaily.disabled = true;
				
	
}

/* 
 * StringParse(): Take a list of key-value as string and transform them to an array. ex: abcd=4&efgh=80  ==> stringElements[abcd]=4; stringElements[efgh]=80 
 * Parameters: tobeParsed. The string that will be parse
 * Return value: an associative array key-value
 */
function StringParse(tobeParsed)
{
	stringElements = new Array();
	
	var pairs = tobeParsed.split("&");	//split by the token
	
	for (var i=0;i<pairs.length;i++)	//For each pair, split by the =
	{
		var pos = pairs[i].indexOf('=');
		if (pos >= 0)
		{
			var argname = pairs[i].substring(0,pos);
			var value = pairs[i].substring(pos+1);
			stringElements[argname] = value;			
		}
	}	
	return stringElements;
}

function getRoutingScriptAndQueues(tenant_id)
{
	var rArray = new Array();
	var jsRSCripts = String( appletObj.getRoutingScripts(tenant_id, "1")  );
	var jsRSCRIPTArray = jsRSCripts.split("|");
	for(var i = 0; i < jsRSCRIPTArray.length; i++)
	{
		if(jsRSCRIPTArray[i].length != 0) 
		{
			thisRScript = jsRSCRIPTArray[i].split(",");																				
			rArray.push(thisRScript[1]);
			//Get virtual queues in this script...
			var thisScriptText = String( appletObj.getRoutingScript(thisRScript[0]) );
			splitedString = thisScriptText.split('^');
			//var rootNoddle;
			for(var j = 0; j < splitedString.length; j++)
			{
				var curElement = splitedString[j];		
				myElementTable = StringParse(curElement);
				if(myElementTable['TYPE'] == 'AGENTPICKUP')
				{
					rArray.push(myElementTable['queueName']);				
				}
			}
		}
	}
	
	//alert(rArray);
	return rArray;
}



</script>
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
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

<body class="sched_body" onLoad="fillObjectCombo()">
	<div class="tab-pane" id="tabPane1">
	<form name="theForm" onKeyDown="KeyDownHandler(submit)">
<script type="text/javascript">
				tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
			</script>
			<div class="tab-page" id="tabGeneral">
				<fieldset>
					<legend>
						<script>
							var vComplete =  normalizeString(QueryString('complete'));
							//var vReport   =  normalizeString(QueryString('report');

							if (vComplete == 'no') {
								document.write("<%= pageData.getWord("Assign schedule")%>");
							}else if (vComplete ==  'yes'){
								document.write("<%= pageData.getWord("Review published schedule")%>");
							}else if(normalizeString(QueryString('report') ==  'yes')) {
								document.write("<%= pageData.getWord("Scheduled agents' report")%>");
							}
						</script>
					</legend><br>

<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="69%"  >
  <tr >
    <td valign="top" width="28%" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" colspan="3">
      <div>

       
	<b><%= pageData.getWord("Choose group")%></b>
    <br><br>    
    
      </div>
    </td>
  </tr>
  <tr height="45">
  <script language="JavaScript">
  var vValue = normalizeString(QueryString('type'));

    document.write('<td width="34%" valign="top" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" >')
    document.write('<select name="objects">')
    document.write('</select>')
    document.write('</td>')
    </script>

 <td width="28%" valign="top" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" >
 </td>
  </tr>

  <tr ><td height="20">&nbsp;</td><td height="20">&nbsp;</td><td height="20">&nbsp;</td>
  </tr>
  <tr height="26" valign="top" >
    
    <td width="38%" style="border-top-style: none; border-top-width: 1" >
     <%= pageData.getWord("Starting date")%>
    </td>
    <td width="28%" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" >
     <%= pageData.getWord("Ending date")%>
    </td>
  </tr>
 
  <tr>
   
   <td id="id_startingDateDaily" valign="top" width="34%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" >
   	 <input type="text" size="20" onFocus="showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()" name="startingDateDaily" />

    </td>
    <td id="id_endingDateDaily" valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1">
     	<input type="text" size="20" onFocus="showCalendar('',this,this,'','id_endingDateDaily',0,30,1);this.blur()" name="endingDateDaily"/>
    </td>
  <tr>

   <td  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" >&nbsp;
   </td>
   <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">&nbsp;
   </td>
   <td  valign"top"  align="right" >
	 <input id="submit" type="button" value='<%= pageData.getWord("Submit")%>' onClick="getRequestedPeriod()">
	 
   </td>
  </tr>
</table>
	</fieldset>
			</div>
		</form>
	</div>
</body>
<% pageData.closeConnection(); %>
</html>