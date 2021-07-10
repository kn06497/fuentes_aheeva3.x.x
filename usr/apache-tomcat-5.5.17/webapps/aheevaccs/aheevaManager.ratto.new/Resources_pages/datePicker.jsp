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
	pageData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else
		pageData.setDefaultLanguage("ENGLISH");	
		
	System.out.println("USER_LANGUAGE : "+(String)session.getAttribute("USER_LANGUAGE"));
	System.out.println("CURRENT_USER_DBID : "+(String)session.getAttribute("CURRENT_USER_DBID"));
		
		
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	
	String yearSelectBox = pageData.buildYearSelectOptions();
	


%>


<html>

<head>
<LINK href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<!-- Calendrier début -->
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->
<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript">

var vValue = normalizeString(QueryString('type'));
var tenant_dbid = normalizeString(QueryString('tenant_dbid'));

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


function changeGroupOrLeaderList()
{
	
	while(document.theForm.objects.length > 0){
		document.theForm.objects.options[0]= null;
	  }

	if (document.theForm.groupOrLeader[0].checked == true) //load group list
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
	}
		
	if (document.theForm.groupOrLeader[1].checked == true) //load  leader liste
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
				 optionPos = document.theForm.objects.options.length
				 document.theForm.objects.options[optionPos]=myOption
             }
            }
	}
	
		
}
function loadCallingLists(){
	while(document.theForm.objects.length > 0){
		document.theForm.objects.options[0]= null;
	  }
	  if (document.theForm.ckbox.checked == true) 
	  {		/*var calling_lists = String( appletObj.getCallingListByName(tenant_dbid,1) );
			//var jsCallingList = calling_lists+ "|";
	  		var jsCallingList =  String( appletObj.getCallingListByName(tenant_dbid,0) );
	 		// jsCallingList = jsCallingList + "|" + calling_lists ;
	
			arrayCallingList = jsCallingList.split("|");
			for (j = 0; j <arrayCallingList .length; j++)
			{	
				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
				optionPos = document.theForm.objects.options.length
				document.theForm.objects.options[optionPos]=myOption
		   	}*/
			var calling_lists = String( appletObj.getAllCallingListByName(tenant_dbid) );
			var jsCallingList = calling_lists+ "";
			arrayCallingList = jsCallingList.split("|");
			for (j = 0; j <arrayCallingList .length; j++)
			{
				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
				optionPos = document.theForm.objects.options.length
				document.theForm.objects.options[optionPos]=myOption
		   }
			
	  }else
	  {
			var calling_lists = String( appletObj.getCallingListByName(tenant_dbid,1) );
			var jsCallingList = calling_lists+ "";
			arrayCallingList = jsCallingList.split("|");
			for (j = 0; j <arrayCallingList .length; j++)
			{
				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
				optionPos = document.theForm.objects.options.length
				document.theForm.objects.options[optionPos]=myOption
		   }
	   }


}

function fillObjectCombo()
{
	
	if((vValue == 'Agents') || (vValue == 'AgentPerformance') ||(vValue =='AgentAdherenceReport') )
	{
		<%
				/* SQL Queries */
	String currentuser_assignedTenants 	= "(select ressource_dbid from cfg_user_authorize_ressources where user_dbid = '"+CURRENT_USER_DBID+"' and ressource_type = 'TENANT')";	
	String currentuser_assignedAgentGroup	= "(select ressource_dbid from cfg_user_authorize_ressources where user_dbid = '"+CURRENT_USER_DBID+"' and ressource_type = 'AGENTGROUP')";
		/*build agent list*/
	String agentsDataQuery				= "select dbid, tenant_dbid, last_name, first_name, state, login_id from cfg_person where tenant_dbid in "+currentuser_assignedTenants + " and ( AGENT_GROUP_DBID IN "+currentuser_assignedAgentGroup + " or AGENT_GROUP_DBID = '0' ) ORDER BY last_name, first_name, login_id";
	
		//pageData.openConnection();	
		pageData.executeFromString(agentsDataQuery);
		System.out.println(agentsDataQuery);
		Vector <HashMap> agentsDataResult = pageData.CreateVectorFromBean();
		/*pageData.closeConnection();*/
		
		String tenant_dbid = "";
		tenant_dbid = request.getParameter("tenant_dbid");
		//Get agent list
		String agent_list = "";
		String agent_full_list = "";
		for( int i = 0 ; i < agentsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)agentsDataResult.elementAt(i).get("tenant_dbid");
						String obj_state 	 = (String)agentsDataResult.elementAt(i).get("state");
						String obj_dbid 	 = (String)agentsDataResult.elementAt(i).get("dbid");

						if( obj_tenant_id.compareTo(tenant_dbid) == 0 )
						{
							String full_name = agentsDataResult.elementAt(i).get("last_name")+","+agentsDataResult.elementAt(i).get("first_name")+"["+agentsDataResult.elementAt(i).get("login_id")+"]";
							if( obj_state.compareTo("1") == 0 ) {
								agent_list += full_name;
								agent_list += "|";
							}
							
							agent_full_list += full_name;
							agent_full_list += "|";
						}
					}
		//remove last symbol |
		if (agent_list.length() >= 1)
        {

            agent_list = agent_list.substring(0, agent_list.length() - 1);

        }
		if (agent_full_list.length() >= 1)
        {

            agent_full_list = agent_full_list.substring(0, agent_full_list.length() - 1);

        }
		agent_list = agent_list.replaceAll("\"","\'");
		agent_full_list = agent_full_list.replaceAll("\"","\'");
		System.out.println(agent_list);
		
		System.out.println(agent_full_list);
		%>

		var agents = new String("<% out.print(new String(agent_list.getBytes())); %>");
		
		
		
		var jsAgents = agents + "";
    	arrayAgents = jsAgents .split("|");
    	for (j = 0; j <arrayAgents.length; j++){
    		var iStartPos = arrayAgents[j].indexOf('[');
    		var iEndPos   = arrayAgents[j].indexOf(']');
    		var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
    		myOption = new Option(arrayAgents [j],login)
			optionPos = document.theForm.objects.options.length
			document.theForm.objects.options[optionPos]=myOption
    	}
    }else if((vValue =='AgentPerformanceByGrp')||(vValue =='Outbound')){
   		var agentGroups = String( appletObj.getAgentGroupByName(tenant_dbid) );
		var jsAgentGroups = agentGroups + "";
    	arrayGroups = jsAgentGroups.split("|");
    	for (j = 0; j <arrayGroups.length; j++){
    		myOption = new Option(arrayGroups[j],arrayGroups[j])
			optionPos = document.theForm.objects.options.length
			document.theForm.objects.options[optionPos]=myOption
    	}
    }else if((vValue=='AgentGroups') || (vValue == 'AgentLoginReport') || vValue == 'AgentSummary'){
		var agentGroups = String( appletObj.getAgentGroupByDBIDandName(tenant_dbid) );
		var jsAgentGroups = agentGroups + "";
    	        arrayGroups = jsAgentGroups.split("|");
		for (j = 0; j <arrayGroups.length; j++){
                  var groups = arrayGroups[j].split(",");

    			myOption = new Option(groups[0],arrayGroups[j])
			optionPos = document.theForm.objects.options.length
			document.theForm.objects.options[optionPos]=myOption
    		}

    }else if(vValue == 'Campaigns'){
    	var campaigns = String( appletObj.getCampaignsByName(tenant_dbid) ),
		 	jsCampaigns = campaigns + "",
			o = new Array();
			
    	arrayCampaigns = jsCampaigns.split("|");
		
        for (j = 0; j <arrayCampaigns .length; j++){
			o.push( new Option(arrayCampaigns [j], arrayCampaigns [j]) );
    		o.sort(sortOptionsByText);			
    	}
		
		for(j = 0; j < o.length; j++){		
			document.theForm.objects.options[j] = o[j];
		}
    }else if(vValue == 'CallingsLists'){
    	var calling_lists = String( appletObj.getCallingListByName(tenant_dbid,1) );
		var jsCallingList = calling_lists+ "";
    	arrayCallingList = jsCallingList.split("|");
        for (j = 0; j <arrayCallingList .length; j++){
    		myOption = new Option(arrayCallingList [j],arrayCallingList [j])
			optionPos = document.theForm.objects.options.length
			document.theForm.objects.options[optionPos]=myOption
    	}
    }else if(vValue == 'Queues'){
    	var queues = "<%= pageData.getQueuesString(request.getParameter("tenant_dbid")) %>";
		var jsQueues = queues + "";
    	arrayQueues = jsQueues.split("|");
        for (j = 0; j < arrayQueues .length; j++){
    		myOption = new Option(arrayQueues [j],arrayQueues [j])
			optionPos = document.theForm.objects.options.length
			document.theForm.objects.options[optionPos]=myOption
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
				 optionPos = document.theForm.objects.options.length
				 document.theForm.objects.options[optionPos]=myOption
             }
            }

    }*/else if (vValue=='RacByCallType') 
	{
		myOption = new Option('rac_french','5142232985')
		optionPos = document.theForm.objects.options.length
		document.theForm.objects.options[optionPos]=myOption

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
			optionPos = document.theForm.objects.options.length
			document.theForm.objects.options[optionPos]=myOption
    	}
	}


    if(document.theForm.objects.options.length >= 10)
	   	document.theForm.objects.size = 10;
	else
		document.theForm.objects.size = document.theForm.objects.options.length;


}

function changeAgentListView(){

	var agents;
	var name="";
	var o = new Array();
	document.theForm.objects.length = 0;
	/*while(document.theForm.objects.length > 0){
		document.theForm.objects.options[0]= null;
	 }
	*/
	
	if (document.theForm.ckbox.checked == true) 
		agents=String("<%=agent_full_list%>");
	else
		agents=String("<%=agent_list%>");
	 	
   	/*if (document.theForm.ckbox.checked == true)
    	agents = String( appletObj.getAgentsByName(tenant_dbid) );
	else
		agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );*/
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


function loadAgent(){
  var agents ="";
  var name = "";
  while(document.theForm.objects.length > 0){
    document.theForm.objects.options[0]= null;
  }

  if (document.theForm.ckbox.checked == true) //the_box.checked == true)
  {
    agents = String( "<%=agent_full_list%>");
	
	//var agents = String( appletObj.getAgentsByNameAndStatus(tenant_dbid, 1) );
    var jsAgents = agents + "";
    arrayAgents = jsAgents .split("|");
    for (j = 0; j <arrayAgents.length; j++){
      var iStartPos = arrayAgents[j].indexOf('[');
      var iEndPos   = arrayAgents[j].indexOf(']');
      var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
	  name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
	  if (document.theForm.viewckbox.checked == false)// show agents name as : firstname, lastname[login]
		myOption = new Option(arrayAgents [j],login);
	 else // show agents name as : login[firstname, lastname]
		myOption = new Option(name,login);
      optionPos = document.theForm.objects.options.length
      document.theForm.objects.options[optionPos]=myOption
    }
  } else {
  
  agents = String( "<%=agent_list%>");
	
    //var agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
    var jsAgents = agents + "";
    arrayAgents = jsAgents .split("|");
    for (j = 0; j <arrayAgents.length; j++){
      var iStartPos = arrayAgents[j].indexOf('[');
      var iEndPos   = arrayAgents[j].indexOf(']');
      var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
	  name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
	  if (document.theForm.viewckbox.checked == false)// show agents name as : firstname, lastname[login]
		myOption = new Option(arrayAgents [j],login);
	  else // show agents name as : login[firstname, lastname]
		myOption = new Option(name,login);
      optionPos = document.theForm.objects.options.length
      document.theForm.objects.options[optionPos]=myOption
    }
  }
  sortSelect2(document.theForm.objects);
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

function getRequestedReport()
{

	var destination = '';
	if(document.theForm.period[2].checked){
		if(document.theForm.startingDateDaily.value.length == 0)
		{
			alert(MultiArray["Please enter a starting date"][lang]);
			return false;
		}
		if(document.theForm.endingDateDaily.value.length == 0)
		{
			alert(MultiArray["Please enter an ending date"][lang]);
			return false;
		}
	}
	if(document.theForm.objects.selectedIndex == -1)
	{
		alert(MultiArray["Please select at least one object"][lang]);
		return;
	}
	if(document.theForm.objects.selectedIndex != -1 && document.theForm.objects.options[0].value=='')
	{
		alert(MultiArray["Please select at least one object"][lang]);
		return;
	}
	if(dateChecker() == false)
	{
		return;
	}
	if(vValue == 'Agents'){
		destination = "../jsp/agentReports.jsp"
	}else if(vValue == 'AgentGroups'){
		destination = "../jsp/agentGroupReports.jsp"
	}else if(vValue == 'AgentLoginReport'){
                destination = "../jsp/agentLoginReports.jsp"
	}else if(vValue == 'Campaigns'){
		destination = "../jsp/campaignReports.jsp"
	}else if(vValue == 'CallingsLists'){
		destination = "../jsp/callingListReports.jsp"
	}else if(vValue == 'Queues'){
		destination = "../jsp/queueReports.jsp"
	}else if(vValue == 'AgentPerformance'){
		destination = "../jsp/agentPerformanceReports.jsp"
	}else if(vValue == 'AgentPerformanceByGrp'){
		destination = "../jsp/agentPerformanceReportsByGrp.jsp"
	}else if(vValue == 'Outbound'){
		destination = "../jsp/outboundCallsReports.jsp"
	}else if(vValue == 'AgentSummary'){
		destination = "../jsp/agentSummaryReport.jsp"
	}else if (vValue == 'RacByCallType'){
        destination = "../jsp/MicrocellRacReportByCallType.jsp"
    }else if (vValue == 'AgentAdherenceReport'){
        destination = "../jsp/adherenceReport.jsp"
    }else if (vValue == 'Inbound'){
		destination = "../jsp/inboundReport.jsp"
	}else if (vValue == 'CallDetails'){
		destination = "../jsp/callDetailsReports.jsp"
	}
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
	
	
	destination += "&lang="+lang;
/*
	if(vValue == 'AgentSummary'){
		destination +="&objects=";
		destination += getSelectedObjects();
	}else  {
		destination +="&objects=";
		destination += getSelectedObjects();
	}*/
	destination +="&objects=";
	destination += getSelectedObjects();
	if(vValue == 'Agents' || vValue == 'AgentGroups')
	{
		destination +="&prec=-1&suiv=1&current=0&all_obj=0";
		if (document.theForm.detailReport.checked == true)
			destination +="&detail=1";
		else 
			destination +="&detail=0";
	}
	if(vValue == 'Queues' || vValue == 'Outbound' || vValue == 'AgentLoginReport' || vValue == 'CallingsLists' || vValue == 'Campaigns' || vValue == 'CallDetails')
	{
		destination +="&viewFirst=1&prec=-1&suiv=1&current=0&all_obj=0";
	}
	if(vValue == 'AgentSummary')
	{
		destination +="&prec=-1&suiv=1&current=0&all_obj=0";
		destination +="&reportSummary=";
		if (document.theForm.groupOrLeader[0].checked == true)
			destination +="group";
		if (document.theForm.groupOrLeader[1].checked == true)
			destination +="leader";
	}
	if(vValue == 'AgentAdherenceReport')
		document.location = destination;
	else
		window.open(destination);
	//document.location = destination;
}
function dateChecker()
{
if(document.theForm.period[2].checked){// daily
	var startDate=new Date(document.theForm.startingDateDaily.value);
	var endDate = new Date(document.theForm.endingDateDaily.value);
	if(endDate < startDate)
	{
		alert(MultiArray["Your ending date cannnot be smaller than your starting date"][lang]);
		return false;
	}
} else if (document.theForm.period[1].checked){ // monthly
	var startDate='01-'+ document.theForm.starting_month_monthly.value + '-' + document.theForm.starting_year_monthly.value;
	var endDate ='01-'+  document.theForm.ending_month_monthly.value+ '-' + document.theForm.ending_year_monthly.value;
	startDate = new Date(startDate);
	endDate = new Date(endDate);

	if(endDate < startDate)
	{
		alert(MultiArray["Your ending date cannnot be smaller than your starting date"][lang]);
		return false;
	}


}else if (document.theForm.period[0].checked){// yearly
    var startDate=document.theForm.starting_year_yearly.value ;
	var endDate = document.theForm.ending_year_yearly.value ;

	if(endDate < startDate)
	{
		alert(MultiArray["Your ending date cannnot be smaller than your starting date"][lang]);
		return false;
	}
}

return true;
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
		if(vValue == 'AgentAdherenceReport')
		{   document.theForm.period[0].checked = false;
			document.theForm.startingDateDaily.disabled = false;
			document.theForm.endingDateDaily.disabled = false;
			document.theForm.starting_year_yearly.disabled = true;
			document.theForm.ending_year_yearly.disabled = true;
		}
	} else if(document.theForm.period[1].checked){
		document.theForm.startingDateDaily.disabled = true;
		document.theForm.endingDateDaily.disabled = true;
		document.theForm.starting_year_yearly.disabled = true;
		document.theForm.ending_year_yearly.disabled = true;
		document.theForm.starting_month_monthly.disabled = false;
		document.theForm.starting_year_monthly.disabled = false;
		document.theForm.ending_month_monthly.disabled = false;
		document.theForm.ending_year_monthly.disabled = false;
		if(vValue == 'AgentAdherenceReport')
		{   document.theForm.period[1].checked = false;
			document.theForm.startingDateDaily.disabled = false;
			document.theForm.endingDateDaily.disabled = false;
			document.theForm.starting_year_yearly.disabled = true;
			document.theForm.ending_year_yearly.disabled = true;
			document.theForm.starting_month_monthly.disabled = true;
			document.theForm.starting_year_monthly.disabled = true;
			document.theForm.ending_month_monthly.disabled = true;
			document.theForm.ending_year_monthly.disabled = true;

		}

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

/* 
 * StringParse(): Take a list of key-value as string and transform them to an array. ex: abcd=4&efgh=80  ==> stringElements[abcd]=4; stringElements[efgh]=80 
 * Parameters: tobeParsed. The string that will be parse
 * Return value: an associative array key-value
 */
function StringParse(tobeParsed)
{
	stringElements = new Array();
	
	var pairs = tobeParsed.split('&');	//split by the token
	
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
					for(var it = 0; it < rArray.length; it++){
						if(myElementTable['queueName'] == rArray[it] )
							break;
					}
					
					if(it >= rArray.length)
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

<body class="bottompagebody" onLoad="fillObjectCombo()">
<form name="theForm" onKeyDown="KeyDownHandler(submit)">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="69%"  >
  <tr >
    <td valign="top" width="28%" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" colspan="3">
      <div align="center">

     <span class="style1">
    <script language="JavaScript">
    var vValue = normalizeString(QueryString('type'));
    if (vValue == 'Agents'){
       document.write(MultiArray["Agent Details Reports"][lang])
    }
    else if (vValue == 'AgentGroups'){
      document.write(MultiArray["Agent Groups Reports"][lang])
    }
    else if (vValue == 'AgentLoginReport'){
       document.write(MultiArray["Agent Login Reports"][lang])
    }
    else if (vValue == 'Campaigns'){
       document.write(MultiArray["Campaign Reports"][lang])
    }
    else if (vValue == 'CallingsLists'){
       document.write(MultiArray["Calling List Reports"][lang])
    }
    else if (vValue == 'Queues'){
      document.write(MultiArray["Queue Reports"][lang])
    }
    else if(vValue =='Outbound') {
       document.write(MultiArray["Outbound call reports"][lang])
    }
    else if(vValue=='AgentSummary'){
       document.write(MultiArray["Agent summary reports"][lang])
    }
	else if(vValue=='RacByCallType'){
	   document.write(MultiArray["Report by call type for Microcell Rac"][lang])
    }
	else if(vValue=='AgentAdherenceReport'){
	  document.write(MultiArray["Agent Adherence Report"][lang])
	}
	else if (vValue == 'CallDetails'){
       document.write(MultiArray["Calling List Report Details"][lang])
	   }
    </script>
    </span>
      </div>
    </td>
  </tr>
  </table>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="69%"  >
  
  <tr height="45">
<script language="JavaScript">
 var vValue = normalizeString(QueryString('type'));
if (vValue != ''){

    document.write('<td width="34%" valign="top" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" >')
    document.write('<br>')
    document.write('<select name="objects" multiple>')
    document.write('</select>')
    document.write('</td>')
    


    if ((vValue == 'Agents') || (vValue == 'AgentPerformance') ||(vValue == 'AgentAdherenceReport') ){
	     
		 document.write('<tr>')
		 document.write('<td valign="top" width="45%" style="border-top-style: none; border-top-width: 1" >')
		 document.write('')
		 document.write('<br>')
		 document.write('<input type=checkbox name=ckbox onClick="loadAgent()" >')
		 document.write(MultiArray["Show all agents"][lang])
		 document.write('<br>')
		// document.write('</b>')
		// document.write('</td>')
		// document.write('<td width="1"  height="25"><input id ="agtlist" type="checkbox" name="orderView" value="ON" onClick="changeAgentListView();" >')
		// document.write('<td width="197" height="25"><b>Show agent by ID</b> </td>')
		 
		 document.write('<input type=checkbox name=viewckbox onClick="changeAgentListView()" >')
		 document.write(MultiArray["Show agent by ID"][lang])
		 document.write('')
		 document.write('</td>')
		 document.write('</tr>')

    } else if(vValue=='CallingsLists'){
		 document.write('<td valign="top" width="38%" style="border-top-style: none; border-top-width: 1" >')
		 document.write('')
		 document.write('<br>')
		 document.write(MultiArray["Show all lists"][lang])
		 document.write('<input type=checkbox name=ckbox onClick="loadCallingLists()" >')
		 document.write('')
		 document.write('</td>')

    } else if((vValue == 'AgentSummary') || (vValue == 'AgentGroups') || (vValue == 'AgentLoginReport') || (vValue == 'Campaigns') || (vValue == 'CallingsLists') || (vValue== 'Outbound')){ 	 
	 	document.write('<tr><td colspan="8" height=10></td></tr><tr><td></td></tr>');
	 	document.write('<tr><td colspan=4><button name=\"selectAllButton\" onClick=\"selectAll()\" ID="Button1">'+MultiArray["Select all"][lang]+'</button> &nbsp;&nbsp; <button name=\"unSelectButton\"  onClick=\"unSelectAll()\" ID="Button2">'+MultiArray["Select none"][lang]+'</button> </td></tr>')
	 
	} else {
       document.write('<td valign="top" width="38%" style="border-top-style: none; border-top-width: 1" >&nbsp;</td>')
    }
}else {

  document.write('<td>&nbsp;</td>')
  document.write('<td>&nbsp;</td>')
  document.write('<td>&nbsp;</td>')

}
    </script>

 <td width="28%" valign="top" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" >
 </td>
  </tr>

  <tr ><td height="20">&nbsp;</td><td height="20">&nbsp;</td><td height="20">&nbsp;</td>
  </tr>
  </table>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="69%"  >
  
  <tr height="26" valign="top" >
    <td width="34%" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" >
     <b><script>document.write(MultiArray["Report type"][lang]);</script></b>
    </td>
    <td width="38%" style="border-top-style: none; border-top-width: 1" >
     <b><script>document.write(MultiArray["Starting date"][lang]);</script></b>
    </td>
    <td width="28%" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" >
   <b>  <script>document.write(MultiArray["Ending date"][lang]);</script></b>
    </td>
  </tr>
  <tr height="26">
  	<td>
		<input name="period" type="radio" value="yearly" onClick="changeDisabled()">
	<script>   
		if(vValue=='Agents' || vValue == 'AgentGroups')
		{
			document.write(MultiArray["for each year"][lang]);
		}
		else
		{
			document.write(MultiArray["detail for each year"][lang]);
		}
	 </script>  
   </td>
    <td valign="top" width="34%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" >
     <select name="starting_year_yearly" disabled="true">
    		<%= yearSelectBox %>
    </select>
    </td>
    <td valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1">
	<select name="ending_year_yearly" disabled="true">
    		<%= yearSelectBox %>
    </select>

    </td>
  </tr>
  <tr>
   <td>
   	<input name="period" type="radio" value="monthly" onClick="changeDisabled()">
	<script>   
		if(vValue=='Agents' || vValue == 'AgentGroups')
		{
			document.write(MultiArray["for each month"][lang]);
		}
		else
		{
			document.write(MultiArray["detail for each month"][lang]);
		}
	 </script>  
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
    		<%= yearSelectBox %>
    </select>
    </td>
    <td valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1">
     <select name="ending_month_monthly" disabled="true">
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
    		<%= yearSelectBox %>
    </select>
    </td>
  </tr>
   <tr>
   <td>
    <input name="period" type="radio" value="daily"  onClick="changeDisabled()" checked>
	<script>   
		if(vValue=='Agents' || vValue == 'AgentGroups')
		{
			document.write(MultiArray["for each day"][lang]);
		}
		else
		{
			document.write(MultiArray["detail for each day"][lang]);
		}
	 </script>  
   </td>
   <td id="id_startingDateDaily" valign="top" width="34%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" >
   	 <input type="text" size="20" onFocus="showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()" name="startingDateDaily" />

    </td>
    <td id="id_endingDateDaily" valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1">
     	<input type="text" size="20" onFocus="showCalendar('',this,this,'','id_endingDateDaily',0,30,1);this.blur()" name="endingDateDaily"/>
    </td>
  <tr>

  <tr><td height="10"></tr>
<tr>
   <td  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" >
	<script>   
		if(vValue=='Agents' || vValue == 'AgentGroups')
		{
			document.write('<input type=checkbox name=detailReport >')
			document.write(MultiArray["detailed information"][lang]);
		}
		if(vValue=='AgentSummary')
		{
			document.write('<input type=radio name=groupOrLeader value=group onClick="changeGroupOrLeaderList()" checked >')
			document.write(MultiArray["By Group"][lang]);
		}
		
	 </script>  
   </td>
   <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">&nbsp;
   </td>
   <td  valign"top"  align="right" >&nbsp;
   </td>
  </tr>
<tr>
   <td  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" >
	<script>   
		if(vValue=='AgentSummary')
		{
			document.write('<input type=radio name=groupOrLeader value=leader onClick="changeGroupOrLeaderList()">')
			document.write(MultiArray["By Leader"][lang]);
		}
		
	 </script>  
   </td>
   <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">&nbsp;
   </td>
   <td  valign"top"  align="right" >&nbsp;
   </td>
  </tr>
   <tr><td colspan="3" height="20"></tr>
  <tr>
   <td  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" >&nbsp;
 	<script>  
	/* 
		if(vValue=='Queues')
		{
			document.write('<button name=\"settings\" onClick=\"settingsServiceLevel()\" ID="Button1">Settings for SL</button>')
		} */
	 </script>  
	
   </td>
   <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">&nbsp;
   </td>
   <td  valign"top"  align="right" >

	  <script>document.write("<input id=\"submit\" type=\"button\" value=\""+MultiArray["Submit"][lang]+"\" onClick=\"getRequestedReport()\">")</script>
		
   </td>
  </tr>
</table>
</form>
</body>
<% pageData.closeConnection(); %>
</html>