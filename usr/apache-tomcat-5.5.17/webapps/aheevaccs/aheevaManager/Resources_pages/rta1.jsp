<html>

<head>
	<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
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
  if (document.theForm.ckbox.checked == true)
  {
    //Get all agents name
    var agents = String( appletObj.getAgentsByName(tenant_dbid) );
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
  sortSelect2(document.theForm.objects);
}

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

function changeAgentListView(){

	var agents;
	var name="";
	var o = new Array();
	document.theForm.objects.length = 0;
   	if (document.theForm.ckbox.checked == true)
    	agents = String( appletObj.getAgentsByName(tenant_dbid) );
	else
		agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
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
		  o[o.length]=myOption

   }

	sortSelect(o);

	for (var i=0; i<o.length; i++) {
		document.theForm.objects.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}

}

var doingSearch = 0; // shows if a search is being performed

function fillObjectCombo()
{
	document.getElementById("noresult").style.visibility="hidden";
	var o = new Array();
	
	
	if((vValue == 'Agents') || (vValue == 'AgentPerformance') ||(vValue =='AgentPerformanceDetails'))
	{
		var searchId = new RegExp(document.getElementById("searchid").value, "gi");
		var searchFirst = new RegExp(document.getElementById("searchfirst").value, "gi");
		var searchLast = new RegExp(document.getElementById("searchlast").value, "gi");
		
		var agents;
		if (document.theForm.ckbox.checked == false) {	//shows all agents
    		agents = String( appletObj.getAgentsByName(tenant_dbid) );
		}else{											// shows only active agents
			agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
		}
		
		var jsAgents = agents + "";
    	arrayAgents = jsAgents.split("|");
		
		document.theForm.objects.options.length=0; //remove 'loading' text
		
		if (searchId!="//ig" || searchFirst!="//ig" || searchLast!="//ig" && doingSearch==1) {
			if(searchId=="//ig") {
				searchId=null;
			}
			if(searchFirst=="//ig") {
				searchFirst=null;
			}
			if(searchLast=="//ig") {
				searchLast=null;
			}
			doingSearch=0;
    		for (j = 0; j <arrayAgents.length; j++){
    			var firstStartPos = arrayAgents[j].indexOf(',');
				var lastStartPos  = arrayAgents[j].indexOf('^');
				var iStartPos     = arrayAgents[j].indexOf('[');
    			var iEndPos       = arrayAgents[j].indexOf(']');
				var firstn	      = arrayAgents[j].substr(firstStartPos+1,iStartPos-firstStartPos-1);
				var lastn	      = arrayAgents[j].substr(lastStartPos+1,firstStartPos-lastStartPos-1);
    			var login	      = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if((firstn.search(searchFirst)==0 && searchLast==null && searchId==null) || (firstn.search(searchFirst)==0 && lastn.search(searchLast)==0 && searchId==null) || (firstn.search(searchFirst)==0 && searchLast==null && login.search(searchId)==0) || (firstn.search(searchFirst)==0 && lastn.search(searchLast)==0 && login.search(searchId)==0) || (searchFirst==null && lastn.search(searchLast)==0 && searchId==null) || (searchFirst==null && lastn.search(searchLast)==0 && login.search(searchId)==0) || (searchFirst==null && searchLast==null && login.search(searchId)==0)) {
					if (document.theForm.viewckbox.checked == false) {  // show agents name as : firstname, lastname[login]
						myOption = new Option(arrayAgents [j],login);  // show agents name as : login[firstname, lastname]
					}else{
						myOption = new Option(name,login);
					}
					
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
					o[o.length]=myOption
				}
			}
		}else{
			for (j = 0; j <arrayAgents.length; j++){
				var iStartPos     = arrayAgents[j].indexOf('[');
    			var iEndPos       = arrayAgents[j].indexOf(']');
    			var login	      = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
		  		if (document.theForm.viewckbox.checked == false) {  // show agents name as : firstname, lastname[login]
					myOption = new Option(arrayAgents [j],login);  // show agents name as : login[firstname, lastname]
				}else{
					myOption = new Option(name,login);
				}
    			
				optionPos = document.theForm.objects.options.length
				document.theForm.objects.options[optionPos]=myOption
				o[o.length]=myOption
    		}
		}
		sortSelect(o);
		
		for (var i=0; i<o.length; i++) {
		document.theForm.objects.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}
		
		if(document.theForm.objects.options.length==0) {
			document.getElementById("noresult").style.visibility="";
		}
		
		
		
    }else if((vValue=='AgentGroupsRTA')||(vValue =='AgentPerformanceByGrp')||(vValue =='AgentPerformanceDetailsByGrp')){
		var searchFull = new RegExp(document.getElementById("searchfullname").value, "gi");
		var searchPart = new RegExp(document.getElementById("searchpartname").value, "gi");
   		var agentGroups = String( appletObj.getAgentGroupByName(tenant_dbid) );
		var jsAgentGroups = agentGroups + "";
    	arrayGroups = jsAgentGroups.split("|");
		
		document.theForm.objects.options.length=0; //remove 'loading' text
		if(searchFull!="//ig" && doingSearch==1) { // if full name search
			doingSearch=0;
    		for (j = 0; j <arrayGroups.length; j++){
				if(arrayGroups[j].search(searchFull)==0) {
					myOption = new Option(arrayGroups[j],arrayGroups[j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
    		}
		}else if(searchPart!="//ig" && doingSearch==1) { // if partial name search
			doingSearch=0;
			for (j = 0; j <arrayGroups.length; j++){
				if(arrayGroups[j].search(searchPart)!=-1) {
					myOption = new Option(arrayGroups[j],arrayGroups[j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
    		}
		}else{
			for (j = 0; j <arrayGroups.length; j++){
    			myOption = new Option(arrayGroups[j],arrayGroups[j])
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
function hourChecker()
{
	var star_hour =parseInt(document.theForm.startTime.value.substring(0,2));
    var star_min =parseInt(document.theForm.startTime.value.substring(3,5));
	var end_hour =parseInt(document.theForm.endTime.value.substring(0,2));
	var end_min =parseInt(document.theForm.endTime.value.substring(3,5));
	if((star_hour*60 + star_min) >= (end_hour*60 + end_min))
	{
		alert("<%= pageData.getWord("Your ending time cannnot be smaller than your starting time!")%>");
		return false;
	}
	return true;
}

function saveAdhViewData()
{
	var selectObjects;
	
	if(document.theForm.objects.selectedIndex == -1)
	{
		selectObjects='None'; //no object selected for adherence
		alert("Please select one agent group, before vizualizing adherence.");
	}
	else
	{
		if(hourChecker())
		{
		  selectObjects = document.theForm.objects.value;
		  var adhRunning= appletObj.isAdherenceStarted();
			
		  if(adhRunning=="true")
		  { 
				appletObj.sendRTAStopReq();
		  }
		  appletObj.updateRTAViewInfo(document.theForm.startTime.value, document.theForm.endTime.value, document.theForm.spacing.value,selectObjects);
		  appletObj.m_ScheduleAdherenceData="";
		   if(adhRunning=="true")
		  { 
				  appletObj.sendRTAStartReq();
		  }
		
			if(document.theForm.saveButton.disabled == false)
				document.theForm.saveButton.disabled = true;
			window.top.main.rtop.stats.firstLoad = true;
		}
	}

   
}

function sendRTAStartRequest()
{
	if(hourChecker())
	{
		//sends the start request to the CTI
		saveAdhViewData();
		var ret=appletObj.sendRTAStartReq();
		updateStartButton();
		return ret;
	}
}

function sendRTAStopRequest()
{
 	//sends the stop request to the CTI
	appletObj.sendRTAStopReq();
	
}

function updateStartButton()
{
if(hourChecker()){
	 if(document.theForm.startButton.disabled == true){
		document.theForm.startButton.disabled = false;
		document.theForm.stopButton.disabled = true;
	  }
	 else{
		document.theForm.startButton.disabled = true;
		document.theForm.stopButton.disabled = false;
	 }
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
	if(document.theForm.period[0].checked){
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
	if(document.theForm.objects.selectedIndex == -1)
	{
		alert("<%= pageData.getWord("Please select at least one object")%>");
		return;
	}
	if(dateChecker() == false)
	{
		return;
	}
	if(vValue == 'Agents'){
		destination = "../jsp/agentAdherenceReportView.jsp"
	}

	destination += "?startingDate="
	destination += document.theForm.startingDateDaily.value;
	destination +="&endingDate=";
	destination += document.theForm.endingDateDaily.value;
	destination +="&startTime=";
	destination += document.theForm.startTime.value;
	destination +="&endTime=";
	destination += document.theForm.endTime.value;
	destination +="&spacing=";
	destination += document.theForm.spacing.value;

	/*destination +="&starting_year_yearly=";
	destination += starting_year_yearly.value
	destination +="&ending_year_yearly=";
	destination += ending_year_yearly.value*/
	destination +="&starting_month_monthly=";
	destination += document.theForm.starting_month_monthly.value
	destination +="&starting_year_monthly=";
	destination += document.theForm.starting_year_monthly.value
	destination +="&starting_month_monthly=";
	destination += document.theForm.starting_month_monthly.value
	destination +="&ending_year_monthly=";
	destination += document.theForm.starting_year_monthly.value

	destination +="&reportType=";
	/*if(period[0].checked){
		destination += "Yearly";
	} else*/
	 if(document.theForm.period[1].checked){
		destination += "Monthly";
	} else if(document.theForm.period[0].checked){
		destination += "Daily";
	}

	if(vValue == 'AgentPerformanceReportsByLeader'){
		destination +="&teams=";
		destination += getSelectedObjects();
	}else{
	    destination +="&objects=";
	    destination += getSelectedObjects();
	}

	destination += "&lang="+lang;
    //alert(destination)
	//window.open(destination);
	document.location = destination;
}
function dateChecker()
{
	if(document.theForm.period[0].checked){// daily
		var startDate=new Date(document.theForm.startingDateDaily.value);
		var endDate = new Date(document.theForm.endingDateDaily.value);
		if(endDate < startDate)
		{
			alert("<%= pageData.getWord("Your ending date cannnot be smaller than your starting date")%>");
			return false;
		}
	}
  else if (document.theForm.period[1].checked){ // monthly
	var startDate='01-'+ document.theForm.starting_month_monthly.value + '-' + document.theForm.starting_year_monthly.value;
	var endDate ='01-'+  document.theForm.starting_month_monthly.value+ '-' + document.theForm.starting_year_monthly.value;
	startDate = new Date(startDate);
	endDate = new Date(endDate);

	if(endDate < startDate || endDate > startDate)
	{
		alert("Your ending month-year must be the same as your starting month-year!!");
		return false;
	}

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

function setEndingMonth(){
	if(document.theForm.period[1].checked){
	  for (i=0; i<document.theForm.starting_month_monthly.options.length; i++)
		  if(document.theForm.starting_month_monthly.options[i].value == document.theForm.starting_month_monthly.value)
			document.theForm.starting_month_monthly.options[i].selected = true;
	}
}



function changeDisabled(){
	if(document.theForm.period[1].checked){
		document.theForm.startingDateDaily.disabled = true;
		document.theForm.endingDateDaily.disabled = true;
		/*starting_year_yearly.disabled = false;
		ending_year_yearly.disabled = false;*/
		document.theForm.starting_month_monthly.disabled = false;
		document.theForm.starting_year_monthly.disabled = false;
		document.theForm.starting_month_monthly.disabled = false;
		document.theForm.starting_year_monthly.disabled = false;
	}/* else if(period[1].checked){
		startingDateDaily.disabled = true;
		endingDateDaily.disabled = true;
		starting_year_yearly.disabled = true;
		ending_year_yearly.disabled = true;
		starting_month_monthly.disabled = false;
		starting_year_monthly.disabled = false;
		starting_month_monthly.disabled = false;
		ending_year_monthly.disabled = false;
	} else*/
	if(document.theForm.period[0].checked){
		document.theForm.startingDateDaily.disabled = false;
		document.theForm.endingDateDaily.disabled = false;
		/*starting_year_yearly.disabled = true;
		ending_year_yearly.disabled = true;*/
		document.theForm.starting_month_monthly.disabled = true;
		document.theForm.starting_year_monthly.disabled = true;
		document.theForm.starting_month_monthly.disabled = true;
		document.theForm.starting_year_monthly.disabled = true;
	}
 }

 function enableUpdateButton()
 {
     var vValue = normalizeString(QueryString('type'));
 	 if (vValue == 'AgentGroupsRTA'){
	    document.theForm.saveButton.value = "<%= pageData.getWord("Update")%>";
		document.theForm.saveButton.disabled = false;
	 }
  }

 function setDefaultValue()
 {
     var vValue = normalizeString(QueryString('type'));

 	 if (vValue == 'AgentGroupsRTA' || vValue == 'Agents'){
			//window.top.comm.myApplet.m_adh_start_time = startTime.value;//normalizeString(QueryString('startTime'));
			//window.top.comm.myApplet.m_adh_end_time   = endTime.value;//normalizeString(QueryString('endTime'));
			//window.top.comm.myApplet.m_adh_spacing    = spacing.value;
			//window.top.comm.myApplet.m_reloadAdherenceView = true;

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

	if(  vValue == 'Agents'){
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
            if (document.activeElement) { // for ie
				if(document.activeElement.id=="searchfirst" || document.activeElement.id=="searchlast" || document.activeElement.id=="searchid" || document.activeElement.id=="searchfullname" || document.activeElement.id=="searchpartname") {
					searchFor();
/*					
				}else{
					// cancel the default submit
           			event.returnValue=false;
          		  	event.cancel = true;
          		  	// submit the form by programmatically clicking the specified button
            		btn.click();
*/				
				}
				
			}else{ // for firefox
				if(document.focusNode.id=="searchfirst" || document.focusNode.id=="searchlast" || document.focusNode.id=="searchid" || document.focusNode.id=="searchfullname" || document.focusNode.id=="searchpartname") {
					searchFor();
/*					
				}else{
					// cancel the default submit
           			event.returnValue=false;
          		  	event.cancel = true;
          		  	// submit the form by programmatically clicking the specified button
            		btn.click();
*/				
				}
				
			}
        }
    }
	
	

function searchFor() { // varify text search

	if (document.getElementById("searchfirst")){
		var thisSearch1 = document.getElementById("searchfirst").value;
		var thisSearch2 = document.getElementById("searchlast").value;
		var thisSearch3 = document.getElementById("searchid").value;
		if (thisSearch1.match(/\?/) || thisSearch1.match(/\*/) || thisSearch1.match(/\(/) || thisSearch1.match(/\)/) || thisSearch1.match(/\+/) || thisSearch1.match(/\[/) || thisSearch1.match(/\]/) || thisSearch1.match(/\</) || thisSearch1.match(/\>/) || thisSearch1.match(/\|/) || thisSearch1.match(/\./) || thisSearch2.match(/\?/) || thisSearch2.match(/\*/) || thisSearch2.match(/\(/) || thisSearch2.match(/\)/) || thisSearch2.match(/\+/) || thisSearch2.match(/\[/) || thisSearch2.match(/\]/) || thisSearch2.match(/\</) || thisSearch2.match(/\>/) || thisSearch2.match(/\|/) || thisSearch2.match(/\./) || thisSearch3.match(/\?/) || thisSearch3.match(/\*/) || thisSearch3.match(/\(/) || thisSearch3.match(/\)/) || thisSearch3.match(/\+/) || thisSearch3.match(/\[/) || thisSearch3.match(/\]/) || thisSearch3.match(/\</) || thisSearch3.match(/\>/) || thisSearch3.match(/\|/) || thisSearch3.match(/\./)) { // disallowed characters
			alert("<%=pageData.getWord("Search query cannot contain")%> '?', '*', '.', '+', '(', ')', '[', ']', '<', '>' <%=pageData.getWord("or")%> '|'");
		}else{
			doingSearch=1;
			fillObjectCombo();
		}
	}else{
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
}

function resetResults() {
	if (document.getElementById("searchfirst")){
		document.getElementById("searchfirst").value="";
		document.getElementById("searchlast").value="";
		document.getElementById("searchid").value="";
		fillObjectCombo();
	}else{
		document.getElementById("searchfullname").value="";
		document.getElementById("searchpartname").value="";
		fillObjectCombo();
	}
}
</script>

</head>

<body class="adher_body" onLoad="fillObjectCombo()">
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
    						if (vValue == 'Agents'){
       							document.write("<%= pageData.getWord("Agent adherence view")%>");
    						}else if (vValue == 'AgentGroupsRTA'){
       							document.write("<%= pageData.getWord("Agent Group Real-Time Adherence View")%>");
    						}
    					</script>
					</legend>
					<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse;"  width="574">
  						<tr height="45">
							<script language="JavaScript">
								var vValue = normalizeString(QueryString('type'));
								if (vValue != ''){
									if (vValue == 'Agents'){
										document.write('<td valign="top" style="border-left-style:none; border-left-width:1; border-top-style:none; border-top-width:1;" >')
			    						document.write('<br>')
			    						document.write('<select id="objects" name="objects" multiple>')
										document.write('<option value="">&nbsp;</option>')
										document.write('<option value="">&nbsp;&nbsp;<%=pageData.getWord("Loading")%>...</option>')
										document.write('<option value="">&nbsp;&nbsp;<%=pageData.getWord("Please wait")%>.</option>')
			    						document.write('</select>')
			    						document.write('</td>')
										
     								}else{
										document.write('<td valign="top" style="border-left-style:none; border-left-width:1; border-top-style:none; border-top-width:1;" >')
			    						document.write('<br>')
			    						document.write('<select id="objects" name="objects" multiple onClick="enableUpdateButton()">')
										document.write('<option value="">&nbsp;</option>')
										document.write('<option value="">&nbsp;&nbsp;<%=pageData.getWord("Loading")%>...</option>')
										document.write('<option value="">&nbsp;&nbsp;<%=pageData.getWord("Please wait")%>.</option>')
			    						document.write('</select>')
			    						document.write('</td>')
										

    								}

    								if (vValue == 'Agents'){
										document.write('<td valign="top" style="padding-left:15px;">')
					 					document.write('<div style="width:450px;">')
					 					document.write('<div style="padding-top:8px; padding-bottom:4px;">search for:</div>')
					 					document.write('<span style="width:130px"><%=pageData.getWord("First name")%></span>')
					 					document.write('<span style="width:130px"><%=pageData.getWord("Last name")%></span>')
					 					document.write('<span style="width:110px"><%=pageData.getWord("Agent ID")%></span>')
					 					document.write('<br>')
					 					document.write('<span style="width:130px"><input id="searchfirst" type="text" value="" size="16" name="searchfirst" /></span>')
					 					document.write('<span style="width:130px"><input id="searchlast" type="text" value="" size="16" name="searchlast" /></span>')
					 					document.write('<span style="width:110px"><input id="searchid" type="text" value="" size="12" name="searchid" /></span>')
					 					document.write('<button id="searchbut" onClick="searchFor()" style="cursor:pointer"><%=pageData.getWord("Search")%></button>')
					 					document.write('<br>')
					 					document.write('<span style="width:300px; padding top:5px;">')
					 					document.write('<input type=checkbox name=ckbox checked onClick="searchFor()">')
					 					document.write('<%=pageData.getWord("Show only active agents")%>'); // previously unchecked and text - Show all agents
					 					document.write('<br>')
					 					document.write('<input type=checkbox name=viewckbox onClick="searchFor()" >')
					 					document.write("<%=pageData.getWord("Show agent by ID")%>");
					 					document.write('</span>')
					 					document.write('<span><button onClick="resetResults()" style="cursor:pointer; margin-top:5px;"><%=pageData.getWord("show full list")%></button></span>')
					 					document.write('</div>')
					 					document.write('</td>')
										

    								}else{
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
					 					document.write('<span><button onClick="resetResults()" style="cursor:pointer; margin-top:5px;"><%=pageData.getWord("show full list")%></button></span>')
					 					document.write('</div>')
					 					document.write('</td>')
										
    								}
								}else{

									document.write('<td>&nbsp;</td>')
									document.write('<td>&nbsp;</td>')
									document.write('<td>&nbsp;</td>')

								}
							</script>
						</tr>
						<tr>
							<td width="28%"  valign="top" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" >
							</td>
						</tr>
					</table>
					<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-top:10px;" width="700">
						<tr style="padding-bottom:4px;">
							<td width="100">&nbsp;</td>
							<td width="150"><b><%= pageData.getWord("Starting time")%></b></td>
							<td width="150"><b><%= pageData.getWord("Ending time")%></b></td>
							<td width="250">&nbsp;</td>
						</tr>
						<tr style="padding-bottom:20px;">
							<td width="100"><%= pageData.getWord("Time period")%></td>
							<td width="170">
								<select name="startTime" onChange="enableUpdateButton()">
									<option value=""></option>
									<option value="00:00">00:00</option>
									<option value="00:15">00:15</option>
									<option value="00:30">00:30</option>
									<option value="00:45">00:45</option>
									<option value="01:00">01:00</option>
									<option value="01:15">01:15</option>
									<option value="01:30">01:30</option>
									<option value="01:45">01:45</option>
									<option value="02:00">02:00</option>
									<option value="02:15">02:15</option>
									<option value="02:30">02:30</option>
									<option value="02:45">02:45</option>
									<option value="03:00">03:00</option>
									<option value="03:15">03:15</option>
									<option value="03:30">03:30</option>
									<option value="03:45">03:45</option>
									<option value="04:00">04:00</option>
									<option value="04:15">04:15</option>
									<option value="04:30">04:30</option>
									<option value="04:45">04:45</option>
   									<option value="05:00">05:00</option>
									<option value="05:15">05:15</option>
									<option value="05:30">05:30</option>
									<option value="05:45">05:45</option>

									<option value="06:00">06:00</option>
									<option value="06:15">06:15</option>
									<option value="06:30">06:30</option>
									<option value="06:45">06:45</option>
									<option value="07:00">07:00</option>
									<option value="07:15">07:15</option>
									<option value="07:30">07:30</option>
									<option value="07:45">07:45</option>
									<option value="08:00">08:00</option>
									<option value="08:15">08:15</option>
									<option value="08:30">08:30</option>
									<option value="08:45">08:45</option>

									<option value="09:00">09:00</option>
									<option value="09:15">09:15</option>
									<option value="09:30">09:30</option>
									<option value="09:45">09:45</option>
									<option value="10:00" selected>10:00</option>
									<option value="10:15">10:15</option>
									<option value="10:30">10:30</option>
									<option value="10:45">10:45</option>
									<option value="11:00">11:00</option>
									<option value="11:15">11:15</option>
									<option value="11:30">11:30</option>
									<option value="11:45">11:45</option>
									<option value="12:00">12:00</option>
									<option value="12:15">12:15</option>
									<option value="12:30">12:30</option>
									<option value="12:45">12:45</option>
									<option value="13:00">13:00</option>
									<option value="13:15">13:15</option>
									<option value="13:30">13:30</option>
									<option value="13:45">13:45</option>
									<option value="14:00">14:00</option>
									<option value="14:15">14:15</option>
									<option value="14:30">14:30</option>
									<option value="14:45">14:45</option>
									<option value="15:00">15:00</option>
									<option value="15:15">15:15</option>
									<option value="15:30">15:30</option>
									<option value="15:45">15:45</option>
									<option value="16:00">16:00</option>
									<option value="16:15">16:15</option>
									<option value="16:30">16:30</option>
									<option value="16:45">16:45</option>
									<option value="17:00">17:00</option>
									<option value="17:15">17:15</option>
									<option value="17:30">17:30</option>
									<option value="17:45">17:45</option>
									<option value="18:00">18:00</option>
									<option value="18:15">18:15</option>
									<option value="18:30">18:30</option>
									<option value="18:45">18:45</option>
									<option value="19:00">19:00</option>
									<option value="19:15">19:15</option>
									<option value="19:30">19:30</option>
									<option value="19:45">19:45</option>
									<option value="20:00">20:00</option>
									<option value="20:15">20:15</option>
									<option value="20:30">20:30</option>
									<option value="20:45">20:45</option>
									<option value="21:00">21:00</option>

									<option value="21:15">21:15</option>
									<option value="21:30">21:30</option>
									<option value="21:45">21:45</option>
									<option value="22:00">22:00</option>
									<option value="22:15">22:15</option>
									<option value="22:30">22:30</option>
									<option value="22:45">22:45</option>
									<option value="23:00">23:00</option>
									<option value="23:15">23:15</option>
									<option value="23:30">23:30</option>
									<option value="23:45">23:45</option>
									<option value="24:00">24:00</option>

								</select>
							</td>
							<td width="150">
								<select name="endTime"  onChange="enableUpdateButton()">
									<option value=""></option>
									<option value="00:00">00:00</option>
									<option value="00:15">00:15</option>
									<option value="00:30">00:30</option>
									<option value="00:45">00:45</option>
									<option value="01:00">01:00</option>
									<option value="01:15">01:15</option>
									<option value="01:30">01:30</option>
									<option value="01:45">01:45</option>
									<option value="02:00">02:00</option>
									<option value="02:15">02:15</option>
									<option value="02:30">02:30</option>
									<option value="02:45">02:45</option>
									<option value="03:00">03:00</option>
									<option value="03:15">03:15</option>
									<option value="03:30">03:30</option>
									<option value="03:45">03:45</option>
									<option value="04:00">04:00</option>
									<option value="04:15">04:15</option>
									<option value="04:30">04:30</option>
									<option value="04:45">04:45</option>
									<option value="05:00">05:00</option>
									<option value="05:15">05:15</option>
									<option value="05:30">05:30</option>
									<option value="05:45">05:45</option>

									<option value="06:00">06:00</option>
									<option value="06:15">06:15</option>
									<option value="06:30">06:30</option>
									<option value="06:45">06:45</option>
									<option value="07:00">07:00</option>
									<option value="07:15">07:15</option>
									<option value="07:30">07:30</option>
									<option value="07:45">07:45</option>
									<option value="08:00">08:00</option>
									<option value="08:15">08:15</option>
									<option value="08:30">08:30</option>
									<option value="08:45">08:45</option>

									<option value="09:00">09:00</option>
									<option value="09:15">09:15</option>
									<option value="09:30">09:30</option>
									<option value="09:45">09:45</option>
									<option value="10:00">10:00</option>
									<option value="10:15">10:15</option>
									<option value="10:30">10:30</option>
									<option value="10:45">10:45</option>
									<option value="11:00">11:00</option>
									<option value="11:15">11:15</option>
									<option value="11:30">11:30</option>
									<option value="11:45">11:45</option>
									<option value="12:00">12:00</option>
									<option value="12:15">12:15</option>
									<option value="12:30">12:30</option>
									<option value="12:45">12:45</option>
									<option value="13:00">13:00</option>
									<option value="13:15">13:15</option>
									<option value="13:30">13:30</option>
									<option value="13:45">13:45</option>
									<option value="14:00">14:00</option>
									<option value="14:15">14:15</option>
									<option value="14:30">14:30</option>
									<option value="14:45">14:45</option>
									<option value="15:00">15:00</option>
									<option value="15:15">15:15</option>
									<option value="15:30">15:30</option>
									<option value="15:45">15:45</option>
 									<option value="16:00">16:00</option>
									<option value="16:15">16:15</option>
									<option value="16:30">16:30</option>
									<option value="16:45">16:45</option>
									<option value="17:00" selected>17:00</option>
									<option value="17:15">17:15</option>
									<option value="17:30">17:30</option>
									<option value="17:45">17:45</option>
									<option value="18:00">18:00</option>
									<option value="18:15">18:15</option>
									<option value="18:30">18:30</option>
									<option value="18:45">18:45</option>
									<option value="19:00">19:00</option>
									<option value="19:15">19:15</option>
									<option value="19:30">19:30</option>
									<option value="19:45">19:45</option>
									<option value="20:00">20:00</option>
									<option value="20:15">20:15</option>
									<option value="20:30">20:30</option>
									<option value="20:45">20:45</option>
									<option value="21:00">21:00</option>

									<option value="21:15">21:15</option>
									<option value="21:30">21:30</option>
									<option value="21:45">21:45</option>
									<option value="22:00">22:00</option>
									<option value="22:15">22:15</option>
									<option value="22:30">22:30</option>
									<option value="22:45">22:45</option>
									<option value="23:00">23:00</option>
									<option value="23:15">23:15</option>
									<option value="23:30">23:30</option>
									<option value="23:45">23:45</option>
									<option value="24:00">24:00</option>
								</select>
							</td>
							<td width="230">
								<%= pageData.getWord("Spacing(mn)")%>
								<select name="spacing" onChange="enableUpdateButton()" >
									<option value="15" selected>15</option>
									<option value="30">30</option>
									<option value="45">45</option>
									<option value="60">60</option>
      
									<!--<option value="120">2h</option>-->
								</select>
							</td>
						</tr>
						
						
						<script language="javascript" type="text/javascript">
							if (vValue == 'Agents'){
								document.write('<tr style="padding-bottom:4px;">');
								document.write('<td width="100"><%= pageData.getWord("Report")%></td>');
								document.write('<td width="170"><b><%= pageData.getWord("Starting date")%></b></td>');
								document.write('<td width="380" colspan="2"><b><%= pageData.getWord("Ending date")%></b></td>');
								document.write('</tr>');
								
								document.write('<tr>');
								document.write('<td width="100"><input name="period" type="radio" value="daily"  onClick="changeDisabled()" checked style="margin-right:10px;"><%= pageData.getWord("Daily")%></td>');
								document.write('<td width="170"><input id="id_startingDateDaily" type="text" size="20" onFocus="showCalendar(\'\',this,this,\'\',\'id_startingDateDaily\',0,30,1);this.blur()" name="startingDateDaily" /></td>');
								document.write('<td width="380" colspan="2"><input id="id_endingDateDaily" type="text" size="20" onFocus="showCalendar(\'\',this,this,\'\',\'id_endingDateDaily\',0,30,1);this.blur()" name="endingDateDaily"/></td>');
								document.write('</tr>');
								
								document.write('<tr style="padding-top:4px;">');
								document.write('<td width="100"><input name="period" type="radio" value="monthly"  onClick="changeDisabled()" style="margin-right:10px;"><%= pageData.getWord("Monthly")%></td>');
								document.write('<td width="170">');
								document.write('<select name="starting_month_monthly" disabled="true" onChange="setEndingMonth()" style="margin-right:4px;">');
								document.write('<option value="01">01</option>');
								document.write('<option value="02">02</option>');
								document.write('<option value="03">03</option>');
								document.write('<option value="04">04</option>');
								document.write('<option value="05">05</option>');
								document.write('<option value="06">06</option>');
								document.write('<option value="07">07</option>');
								document.write('<option value="08">08</option>');
								document.write('<option value="09">09</option>');
								document.write('<option value="10">10</option>');
								document.write('<option value="11">11</option>');
								document.write('<option value="12">12</option>');
								document.write('</select>');
								document.write('<select name="starting_year_monthly" disabled="true">');
								document.write('<option value="2004">2004</option>');
								document.write('<option value="2005">2005</option>');
								document.write('<option value="2006">2006</option>');
								document.write('<option value="2007">2007</option>');
								document.write('<option value="2008">2008</option>');
								document.write('<option value="2009">2009</option>');
								document.write('<option value="2010">2010</option>');
								document.write('<option value="2011">2011</option>');
								document.write('<option value="2012">2012</option>');
								document.write('<option value="2013">2013</option>');
								document.write('<option value="2014">2014</option>');
								document.write('<option value="2015">2015</option>');
								document.write('</select>');
								document.write('</td>');
								document.write('<td width="380" colspan="2"></td>');
								document.write('</tr>');
								
								
								
								document.write('<tr style="padding-bottom:4px;">');
								document.write('<td width="100">&nbsp;</td>');
								document.write('<td width="550" colspan="3"><button onClick="getRequestedReport()"><%= pageData.getWord("Submit")%></button></td>');
								document.write('</tr>');
							
							}else if(vValue == 'AgentGroupsRTA'){
								document.write('<tr style="padding-bottom:4px;">');
								document.write('<td width="100">&nbsp;</td>');
								var showAdherenceValue = String( appletObj.m_showAdherenceValue );
								if (showAdherenceValue == 'true')		{
//									document.startButton.disabled = true;
//									document.stopButton.disabled = false;
	  								if(String(appletObj.m_gotAdherence) == 'false'){
										document.write('<td width="550" colspan="3">');
										document.write('<button name="saveButton" disabled onClick="saveAdhViewData()"><%= pageData.getWord("Save")%></button>');
										document.write('<button name="startButton" onClick="var sret=sendRTAStartRequest()"><%= pageData.getWord("Start")%></button>');
										document.write('<button name="stopButton" onClick="sendRTAStopRequest(); updateStopButton()"><%= pageData.getWord("Stop")%></button>');
										document.write('</td>');
									}else{
										document.write('<td width="550" colspan="3">');
										document.write('<button name="saveButton" disabled onClick="saveAdhViewData()"><%= pageData.getWord("Save")%></button>');
										document.write('<button name="startButton" disabled onClick="var sret=sendRTAStartRequest()"><%= pageData.getWord("Start")%></button>');
										document.write('<button name="stopButton" onClick="sendRTAStopRequest(); updateStopButton()"><%= pageData.getWord("Stop")%></button>');
										document.write('</td>');
									}
								}else{
									document.write('<td width="550" colspan="3">');
									document.write('<button name="saveButton" disabled onClick="saveAdhViewData()"><%= pageData.getWord("Save")%></button>');
									document.write('<button name="startButton" onClick="var sret=sendRTAStartRequest()"><%= pageData.getWord("Start")%></button>');
									document.write('<button name="stopButton" disabled onClick="sendRTAStopRequest(); updateStopButton()"><%= pageData.getWord("Stop")%></button>');
									document.write('</td>');
								}
								document.write('</tr>');
							}
						</script>
						
					</table>
						
						
					
					<script language="javascript" type="text/javascript">
						setDefaultValue();
					</script>
				</fieldset>
			</div>
		</form>
	</div>
	<div id="noresult" style="position:absolute; top:60px; left:60px; visibility:hidden">No match.</div>
</body>
<% pageData.closeConnection(); %>
</html>
