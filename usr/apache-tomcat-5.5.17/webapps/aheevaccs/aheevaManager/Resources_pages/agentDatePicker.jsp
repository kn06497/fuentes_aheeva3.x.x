<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<%
	
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else
		pageData.setDefaultLanguage("ENGLISH");	
		
	System.out.println("USER_LANGUAGE : "+(String)session.getAttribute("USER_LANGUAGE"));
	System.out.println("CURRENT_USER_DBID : "+(String)session.getAttribute("CURRENT_USER_DBID"));
		
	
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	String currentuser_assignedTenants 	= "(select ressource_dbid from cfg_user_authorize_ressources where user_dbid = '"+CURRENT_USER_DBID+"' and ressource_type = 'TENANT')";	
	
	String tenantDbid = request.getParameter("tenant_dbid");


%>

<html>

<head>
<LINK href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
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

function sortSelect(o)
{
	if (o.length==0) { return; }

	if(document.agentReportForm.viewckbox.checked == false){
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

	if(document.agentReportForm.viewckbox.checked == false){
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
	document.agentReportForm.objects.length = 0;
	/*while(document.agentReportForm.objects.length > 0){
		document.agentReportForm.objects.options[0]= null;
	 }
	*/
   	if (document.agentReportForm.ckbox.checked == true)
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
		  if (document.agentReportForm.viewckbox.checked == false)  // show agents name as : firstname, lastname[login]
			myOption = new Option(arrayAgents [j],login);  // show agents name as : login[firstname, lastname]
		  else
			myOption = new Option(name,login);
		  o[o.length]=myOption

   }

	sortSelect(o);

	for (var i=0; i<o.length; i++) {
		document.agentReportForm.objects.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}

}


function loadAgent(){
  var agents ="";
  var name = "";
  while(document.agentReportForm.objects.length > 0){
    document.agentReportForm.objects.options[0]= null;
  }

  if (document.agentReportForm.ckbox.checked == true) //the_box.checked == true)
  {
    var agents = String( appletObj.getAgentsByName(tenant_dbid) );
    var jsAgents = agents + "";
    arrayAgents = jsAgents .split("|");
    for (j = 0; j <arrayAgents.length; j++){
      var iStartPos = arrayAgents[j].indexOf('[');
      var iEndPos   = arrayAgents[j].indexOf(']');
      var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
	  name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
	  if (document.agentReportForm.viewckbox.checked == false)// show agents name as : firstname, lastname[login]
		myOption = new Option(arrayAgents [j],login);
	 else // show agents name as : login[firstname, lastname]
		myOption = new Option(name,login);
      optionPos = document.agentReportForm.objects.options.length
      document.agentReportForm.objects.options[optionPos]=myOption
    }
  } else {
    var agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
    var jsAgents = agents + "";
    arrayAgents = jsAgents .split("|");
    for (j = 0; j <arrayAgents.length; j++){
      var iStartPos = arrayAgents[j].indexOf('[');
      var iEndPos   = arrayAgents[j].indexOf(']');
      var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
	  name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
	  if (document.agentReportForm.viewckbox.checked == false)// show agents name as : firstname, lastname[login]
		myOption = new Option(arrayAgents [j],login);
	  else // show agents name as : login[firstname, lastname]
		myOption = new Option(name,login);
      optionPos = document.agentReportForm.objects.options.length
      document.agentReportForm.objects.options[optionPos]=myOption
    }
  }
  sortSelect2(document.agentReportForm.objects);
}
function changeGroupOrLeaderList()
{
	
	while(document.agentReportForm.objects.length > 0){
		document.agentReportForm.objects.options[0]= null;
	  }

	if (document.agentReportForm.groupOrLeader[0].checked == true) //load group list
	{
		var agentGroups = String( appletObj.getAgentGroupByDBIDandName(tenant_dbid) );
		
		var jsAgentGroups = agentGroups + "";
    	        arrayGroups = jsAgentGroups.split("|");
		for (j = 0; j <arrayGroups.length; j++){
                  var groups = arrayGroups[j].split(",");

    			myOption = new Option(groups[0],arrayGroups[j])
			optionPos = document.agentReportForm.objects.options.length
			document.agentReportForm.objects.options[optionPos]=myOption
			
			}
	}
		
	if (document.agentReportForm.groupOrLeader[1].checked == true) //load  leader liste
	{
    	var teamLeaders = String( appletObj.getAllTeams(tenant_dbid) );
        var jsTeamleaders = teamLeaders + "";
    	arrayTeam = jsTeamleaders.split("|");
		var ob

    	for (j = 0; j <arrayTeam.length; j++){
             if(arrayTeam[j].length != 0){
			 //alert(arrayTeam[j]);
                 arrayTeamData = arrayTeam[j].split("^");
                 team_dbid = arrayTeamData[0];
                 team_name =  arrayTeamData[1];
                 team_leader = arrayTeamData[2];
				 /*
alert('team_dbid ' + team_dbid);
alert('team_name ' +team_name);
alert('team_leader ' +team_leader);
*/
				 myOption = new Option(team_leader,team_dbid)
				 optionPos = document.agentReportForm.objects.options.length
				 document.agentReportForm.objects.options[optionPos]=myOption
             }
            }
	}
	
		
}
function loadCallingLists(){
	while(document.agentReportForm.objects.length > 0){
		document.agentReportForm.objects.options[0]= null;
	  }
	  if (document.agentReportForm.ckbox.checked == true) 
	  {		/*var calling_lists = String( appletObj.getCallingListByName(tenant_dbid,1) );
			//var jsCallingList = calling_lists+ "|";
	  		var jsCallingList =  String( appletObj.getCallingListByName(tenant_dbid,0) );
	 		// jsCallingList = jsCallingList + "|" + calling_lists ;
	
			arrayCallingList = jsCallingList.split("|");
			for (j = 0; j <arrayCallingList .length; j++)
			{	
				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
				optionPos = document.agentReportForm.objects.options.length
				document.agentReportForm.objects.options[optionPos]=myOption
		   	}*/
			var calling_lists = String( appletObj.getAllCallingListByName(tenant_dbid) );
			var jsCallingList = calling_lists+ "";
			arrayCallingList = jsCallingList.split("|");
			for (j = 0; j <arrayCallingList .length; j++)
			{
				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
				optionPos = document.agentReportForm.objects.options.length
				document.agentReportForm.objects.options[optionPos]=myOption
		   }
			
	  }else
	  {
			var calling_lists = String( appletObj.getCallingListByName(tenant_dbid,1) );
			var jsCallingList = calling_lists+ "";
			arrayCallingList = jsCallingList.split("|");
			for (j = 0; j <arrayCallingList .length; j++)
			{
				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
				optionPos = document.agentReportForm.objects.options.length
				document.agentReportForm.objects.options[optionPos]=myOption
		   }
	   }


}

function fillObjectCombo()
{

	if((vValue == 'Agents') || (vValue == 'AgentPerformance') ||(vValue =='AgentAdherenceReport') )
	{
		var agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
		var jsAgents = agents + "";
    	arrayAgents = jsAgents .split("|");
    	for (j = 0; j <arrayAgents.length; j++){
    		var iStartPos = arrayAgents[j].indexOf('[');
    		var iEndPos   = arrayAgents[j].indexOf(']');
    		var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
    		myOption = new Option(arrayAgents [j],login)
			optionPos = document.agentReportForm.objects.options.length
			document.agentReportForm.objects.options[optionPos]=myOption
    	}
    }else if((vValue =='AgentPerformanceByGrp')||(vValue =='Outbound')){
   		var agentGroups = String( appletObj.getAgentGroupByName(tenant_dbid) );
		var jsAgentGroups = agentGroups + "";
    	arrayGroups = jsAgentGroups.split("|");
    	for (j = 0; j <arrayGroups.length; j++){
    		myOption = new Option(arrayGroups[j],arrayGroups[j])
			optionPos = document.agentReportForm.objects.options.length
			document.agentReportForm.objects.options[optionPos]=myOption
    	}
    }else if((vValue=='AgentGroups') || (vValue == 'AgentLoginReport') || vValue == 'AgentSummary'){
		var agentGroups = String( appletObj.getAgentGroupByDBIDandName(tenant_dbid) );
		var jsAgentGroups = agentGroups + "";
    	        arrayGroups = jsAgentGroups.split("|");
		for (j = 0; j <arrayGroups.length; j++){
                  var groups = arrayGroups[j].split(",");

    			myOption = new Option(groups[0],arrayGroups[j])
			optionPos = document.agentReportForm.objects.options.length
			document.agentReportForm.objects.options[optionPos]=myOption
    		}

    }else if(vValue == 'Campaigns'){
    	var campaigns = String( appletObj.getCampaignsByName(tenant_dbid) );
		var jsCampaigns = campaigns + "";
    	arrayCampaigns = jsCampaigns.split("|");
        for (j = 0; j <arrayCampaigns .length; j++){
    		myOption = new Option(arrayCampaigns [j],arrayCampaigns [j])
			optionPos = document.agentReportForm.objects.options.length
			document.agentReportForm.objects.options[optionPos]=myOption
    	}
    }else if(vValue == 'CallingsLists'){
    	var calling_lists = String( appletObj.getCallingListByName(tenant_dbid,1) );
		var jsCallingList = calling_lists+ "";
    	arrayCallingList = jsCallingList.split("|");
        for (j = 0; j <arrayCallingList .length; j++){
    		myOption = new Option(arrayCallingList [j],arrayCallingList [j])
			optionPos = document.agentReportForm.objects.options.length
			document.agentReportForm.objects.options[optionPos]=myOption
    	}
    }else if(vValue == 'Queues')
	{
    	var queues = String( appletObj.getQueueByName(tenant_dbid) );
		var jsQueues = queues + "";
    	arrayQueues = jsQueues.split("|");
        for (j = 0; j <arrayQueues .length; j++)
		{
    		myOption = new Option(arrayQueues [j],arrayQueues [j])
			optionPos = document.agentReportForm.objects.options.length
			document.agentReportForm.objects.options[optionPos]=myOption
    	} 
		 
		arrayQueues = getRoutingScriptAndQueues(tenant_dbid);
		 for (j = 0; j <arrayQueues.length; j++)
		 {
    		myOption = new Option(arrayQueues [j],arrayQueues [j])
			optionPos = document.agentReportForm.objects.options.length
			document.agentReportForm.objects.options[optionPos]=myOption
    	}

    }/*else if (vValue == 'AgentSummary'){

    	var teamLeaders = String( appletObj.getAllTeams(tenant_dbid) );
        var jsTeamleaders = teamLeaders + "";
    	arrayTeam = jsTeamleaders.split("|");

    	for (j = 0; j <arrayTeam.length; j++){
             if(arrayTeam[j].length != 0){
                 arrayTeamData = arrayTeam[j].split("^");
                 team_dbid = arrayTeamData[0];
                 team_name =  arrayTeamData[1];
                 team_leader = arrayTeamData[2];

				 myOption = new Option(team_leader,arrayTeam[j])
				 optionPos = document.agentReportForm.objects.options.length
				 document.agentReportForm.objects.options[optionPos]=myOption
             }
            }

    }*/else if (vValue=='RacByCallType') 
	{
		myOption = new Option('rac_french','5142232985')
		optionPos = document.agentReportForm.objects.options.length
		document.agentReportForm.objects.options[optionPos]=myOption

   }
//*************** new for the CallDetails
   else if(vValue == 'CallDetails')
   {
    	var calling_lists = String( appletObj.getCallingListByName(tenant_dbid,1) );
		var jsCallingList = calling_lists+ "";
    	arrayCallingList = jsCallingList.split("|");
        for (j = 0; j <arrayCallingList .length; j++)
		{
    		myOption = new Option(arrayCallingList [j],arrayCallingList [j])
			optionPos = document.agentReportForm.objects.options.length
			document.agentReportForm.objects.options[optionPos]=myOption
    	}
	}


    if(document.agentReportForm.objects.options.length >= 10)
	   	document.agentReportForm.objects.size = 10;
	else
		document.agentReportForm.objects.size = document.agentReportForm.objects.options.length;


}

function selectAll()
{
  for (j = 0; j <document.agentReportForm.objects.options.length; j++)
	  document.agentReportForm.objects.options[j].selected = true;  
}

function unSelectAll()
{
  for (j = 0; j <document.agentReportForm.objects.options.length; j++)
	  document.agentReportForm.objects.options[j].selected = false;  

}
/*
function settingsServiceLevel()
{
	var url ='../jsp/settingsServiceLevel.jsp';
	window.open(url);
}
*/
function getSelectedObjects()
{

	selectedObjects = new Array()
	for (i=document.agentReportForm.objects.selectedIndex;i<document.agentReportForm.objects.options.length;i++) {
  		if (document.agentReportForm.objects.options[i].selected) {
  			selectedObjects[selectedObjects.length]=document.agentReportForm.objects.options[i].value;
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

function getRequestedReport()
{

	var destination = '';
	if(document.agentReportForm.period[2].checked){
		if(document.agentReportForm.startingDateDaily.value.length == 0)
		{
			alert(<%=pageData.getWord("Please enter a starting date")%>);
			return false;
		}
		if(document.agentReportForm.endingDateDaily.value.length == 0)
		{
			alert(<%=pageData.getWord("Please enter an ending date")%>);
			return false;
		}
	}
	if(document.agentReportForm.objects.selectedIndex == -1)
	{
		alert(<%=pageData.getWord("Please select at least one object")%>);
		return;
	}
	if(document.agentReportForm.objects.selectedIndex != -1 && document.agentReportForm.objects.options[0].value=='')
	{
		alert(<%=pageData.getWord("Please select at least one object")%>);
		return;
	}
	if(dateChecker() == false)
	{
		return;
	}
	
	destination = "../jsp/agentReports.jsp"
	destination += "?startingDateDaily="
	destination += document.agentReportForm.startingDateDaily.value;
	destination +="&endingDateDaily=";
	destination += document.agentReportForm.endingDateDaily.value;
	destination +="&starting_year_yearly=";
	destination += document.agentReportForm.starting_year_yearly.value
	destination +="&ending_year_yearly=";
	destination += document.agentReportForm.ending_year_yearly.value
	destination +="&starting_month_monthly=";
	destination += document.agentReportForm.starting_month_monthly.value
	destination +="&starting_year_monthly=";
	destination += document.agentReportForm.starting_year_monthly.value
	destination +="&ending_month_monthly=";
	destination += document.agentReportForm.ending_month_monthly.value
	destination +="&ending_year_monthly=";
	destination += document.agentReportForm.ending_year_monthly.value	

	destination +="&reportType=";
	if(document.agentReportForm.period[0].checked){
		destination += "Yearly";
	} else if(document.agentReportForm.period[1].checked){
		destination += "Monthly";
	} else if(document.agentReportForm.period[2].checked){
		destination += "Daily";
	}
	
	
	destination += "&lang="+lang;

	destination +="&objects=";
	destination += getSelectedObjects();
	
	destination +="&prec=-1&suiv=1&current=0&all_obj=0";
	if (document.agentReportForm.detailReport.checked == true)
	{
		destination +="&detail=1";
	}
	else
	{ 
		destination +="&detail=0";
	}
	
	window.open(destination);
	
}
function dateChecker()
{
if(document.agentReportForm.period[2].checked){// daily
	var startDate=new Date(document.agentReportForm.startingDateDaily.value);
	var endDate = new Date(document.agentReportForm.endingDateDaily.value);
	if(endDate < startDate)
	{
		alert(<%=pageData.getWord("Your ending date cannnot be smaller than your starting date")%>);
		return false;
	}
} else if (document.agentReportForm.period[1].checked){ // monthly
	var startDate='01-'+ document.agentReportForm.starting_month_monthly.value + '-' + document.agentReportForm.starting_year_monthly.value;
	var endDate ='01-'+  document.agentReportForm.ending_month_monthly.value+ '-' + document.agentReportForm.ending_year_monthly.value;
	startDate = new Date(startDate);
	endDate = new Date(endDate);

	if(endDate < startDate)
	{
		alert(<%=pageData.getWord("Your ending date cannnot be smaller than your starting date")%>);
		return false;
	}


}else if (document.agentReportForm.period[0].checked){// yearly
    var startDate=document.agentReportForm.starting_year_yearly.value ;
	var endDate = document.agentReportForm.ending_year_yearly.value ;

	if(endDate < startDate)
	{
		alert(<%=pageData.getWord("Your ending date cannnot be smaller than your starting date")%>);
		return false;
	}
}

return true;
}

function changeDisabled(){
	if(document.agentReportForm.period[0].checked){
		document.agentReportForm.startingDateDaily.disabled = true;
		document.agentReportForm.endingDateDaily.disabled = true;
		document.agentReportForm.starting_year_yearly.disabled = false;
		document.agentReportForm.ending_year_yearly.disabled = false;
		document.agentReportForm.starting_month_monthly.disabled = true;
		document.agentReportForm.starting_year_monthly.disabled = true;
		document.agentReportForm.ending_month_monthly.disabled = true;
		document.agentReportForm.ending_year_monthly.disabled = true;
		
	} else if(document.agentReportForm.period[1].checked){
		document.agentReportForm.startingDateDaily.disabled = true;
		document.agentReportForm.endingDateDaily.disabled = true;
		document.agentReportForm.starting_year_yearly.disabled = true;
		document.agentReportForm.ending_year_yearly.disabled = true;
		document.agentReportForm.starting_month_monthly.disabled = false;
		document.agentReportForm.starting_year_monthly.disabled = false;
		document.agentReportForm.ending_month_monthly.disabled = false;
		document.agentReportForm.ending_year_monthly.disabled = false;

	} else if(document.agentReportForm.period[2].checked){
		document.agentReportForm.startingDateDaily.disabled = false;
		document.agentReportForm.endingDateDaily.disabled = false;
		document.agentReportForm.starting_year_yearly.disabled = true;
		document.agentReportForm.ending_year_yearly.disabled = true;
		document.agentReportForm.starting_month_monthly.disabled = true;
		document.agentReportForm.starting_year_monthly.disabled = true;
		document.agentReportForm.ending_month_monthly.disabled = true;
		document.agentReportForm.ending_year_monthly.disabled = true;
	}
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


</script>
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
</head>

<body class="bottompagebody">
<form name="agentReportForm" id="agentReportForm">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="69%"  >
  <tr >
    <td width="40%" colspan="2" valign="top" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1">
   	    <div align="center">
    	  <p class="style1"><%=pageData.getWord("Agent details report")%></p>
    	  <p align="center">
    	    <select name="objects" size="15" multiple id="objects">
              <%
			AgentsCollection allAgents = new AgentsCollection(Integer.parseInt(tenantDbid));
			for(int i=0; i<allAgents.size();i++)
			{
				
		%>
              <option value="<%=allAgents.elementAt(i).getLoginId()%>"><%="["+allAgents.elementAt(i).getLoginId()+"] "+allAgents.elementAt(i).getLastName()+", "+allAgents.elementAt(i).getFirstName()%></option>
              <%
			}
		
		%>
            </select>
    	  </p>
   	    </div>   	    <br>		</td>
    <td width="40%" valign="top" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1"><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="100%"  >
      <tr height="26" valign="top" >
        <td width="34%" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" ><div align="center"><b><%=pageData.getWord("Report type")%></b> </div></td>
        <td width="38%" style="border-top-style: none; border-top-width: 1" ><div align="center"><b><%=pageData.getWord("Starting date")%></b> </div></td>
        <td width="38%" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" ><div align="center"><b> <%=pageData.getWord("Ending date")%></b> </div></td>
      </tr>
      <tr height="26">
        <td><input name="period" type="radio" value="yearly" onClick="changeDisabled()">
             <%=pageData.getWord("For each year")%> </td>
        <td valign="top" width="38%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" ><select name="starting_year_yearly" disabled="true">
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
          </select>        </td>
        <td valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1"><select name="ending_year_yearly" disabled="true">
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
          </select>        </td>
      </tr>
      <tr>
        <td><input name="period" type="radio" value="monthly" onClick="changeDisabled()">
            <%=pageData.getWord("For each month")%> </td>
        <td valign="top" width="38%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" ><select name="starting_month_monthly" disabled="true">
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
            </select>        </td>
        <td valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1"><select name="ending_month_monthly" disabled="true">
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
            <select name="ending_year_monthly" disabled="true">
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
            </select>        </td>
      </tr>
      <tr>
        <td><input name="period" type="radio" value="daily"  onClick="changeDisabled()" checked>
            <%=pageData.getWord("For each day")%> </td>
        <td id="id_startingDateDaily" valign="top" width="38%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" ><input type="text" size="20" onFocus="showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()" name="startingDateDaily" />        </td>
        <td id="id_endingDateDaily" valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1"><input type="text" size="20" onFocus="showCalendar('',this,this,'','id_endingDateDaily',0,30,1);this.blur()" name="endingDateDaily"/>        </td>
      <tr>
        <td height="10">      </tr>
      <tr>
        <td  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" >&nbsp;</td>
        <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1"><span style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">
          <input type="checkbox" name="detailReport" id="detailReport">
          <%=pageData.getWord("detailed information")%> </span> </td>
        <td  valign"top"  align="right" >&nbsp;</td>
      </tr>

    </table>
      <p>&nbsp;</p>
	  <script>document.write("<input type=\"button\" value=\""+<%=pageData.getWord("Submit")%>+"\" onClick=\"getRequestedReport()\">")</script>
	  </td>
  </tr>
</table>
</form>
</body>

</html>
