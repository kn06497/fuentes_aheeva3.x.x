<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<%
	
	beanManagerData pageDatePData = new beanManagerData();
pageDatePData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageDatePData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else
		pageDatePData.setDefaultLanguage("ENGLISH");	
		
	System.out.println("USER_LANGUAGE : "+(String)session.getAttribute("USER_LANGUAGE"));
	System.out.println("CURRENT_USER_DBID : "+(String)session.getAttribute("CURRENT_USER_DBID"));
		
		
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	
	String yearSelectBox = pageDatePData.buildYearSelectOptions();
	
	


	


%>


<html>

<head>
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


<!-- Calendrier début -->
<%@ include file="xc2_default_labels.jsp" %>
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
	  if (document.theForm.ckbox.checked == false) 
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

var doingSearch = 0; // shows if a search is being performed

function fillObjectCombo()
{
	document.getElementById("noresult").style.visibility="hidden";
	var o = new Array();
//	alert("pause");
	
	if((vValue == 'Agents') || (vValue == 'AgentPerformance') ||(vValue =='AgentAdherenceReport') )
	{
		var searchId = new RegExp(document.getElementById("searchid").value, "gi");
		var searchFirst = new RegExp(document.getElementById("searchfirst").value, "gi");
		var searchLast = new RegExp(document.getElementById("searchlast").value, "gi");
		
		<%
				/* SQL Queries */
	String currentuser_assignedTenants 	= "(select ressource_dbid from cfg_user_authorize_ressources where user_dbid = '"+CURRENT_USER_DBID+"' and ressource_type = 'TENANT')";	
	String currentuser_assignedAgentGroup	= "(select ressource_dbid from cfg_user_authorize_ressources where user_dbid = '"+CURRENT_USER_DBID+"' and ressource_type = 'AGENTGROUP')";
		/*build agent list*/
	String agentsDataQuery				= "select dbid, tenant_dbid, last_name, first_name, state, login_id from cfg_person where tenant_dbid in "+currentuser_assignedTenants + " and ( AGENT_GROUP_DBID IN "+currentuser_assignedAgentGroup + " or AGENT_GROUP_DBID = '0' ) ORDER BY last_name, first_name, login_id";
	
		//pageData.openConnection();	
		pageDatePData.executeFromString(agentsDataQuery);
		System.out.println(agentsDataQuery);
		Vector <HashMap> agentsDataResult = pageDatePData.CreateVectorFromBean();
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
		
		if (document.theForm.ckbox.checked == false) { 	//shows all agents
			agents=String("<%=agent_full_list%>");
		}else{ 											// shows only active agents
			agents=String("<%=agent_list%>");
		}
		
		var jsAgents = agents + "";
    	arrayAgents = jsAgents .split("|");
		
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
		
    }else if((vValue =='AgentPerformanceByGrp')||(vValue =='Outbound')){
   		var searchFull = new RegExp(document.getElementById("searchfullname").value, "gi");
		var searchPart = new RegExp(document.getElementById("searchpartname").value, "gi");
   		var agentGroups = String( appletObj.getAgentGroupByName(tenant_dbid) )
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
		
		
    	
    }else if((vValue=='AgentGroups') || (vValue == 'AgentLoginReport') || vValue == 'AgentSummary'){
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

    }else if(vValue == 'Campaigns'){
		var searchFull = new RegExp(document.getElementById("searchfullname").value, "gi");
		var searchPart = new RegExp(document.getElementById("searchpartname").value, "gi");
    	var campaigns = String( appletObj.getCampaignsByName(tenant_dbid) ),
		 	jsCampaigns = campaigns + "",
			o = new Array();
			
    	arrayCampaigns = jsCampaigns.split("|");
		document.theForm.objects.options.length=0; //remove 'loading' text
		if(searchFull!="//ig" && doingSearch==1) { // if full name search
			doingSearch=0;
        	for (j = 0; j <arrayCampaigns.length; j++){
				if(arrayCampaigns[j].search(searchFull)==0) {
					o.push( new Option(arrayCampaigns [j], arrayCampaigns [j]) );
    				o.sort(sortOptionsByText);	
				}
    		}
		}else if(searchPart!="//ig" && doingSearch==1) { // if partial name search
			doingSearch=0;
			for (j = 0; j <arrayCampaigns.length; j++){
				if(arrayCampaigns[j].search(searchPart)!=-1) {
					o.push( new Option(arrayCampaigns [j], arrayCampaigns [j]) );
    				o.sort(sortOptionsByText);	
				}
    		}
		}else{
			for (j = 0; j <arrayCampaigns.length; j++){
				o.push( new Option(arrayCampaigns [j], arrayCampaigns [j]) );
    			o.sort(sortOptionsByText);
    		}
		}
		for(j = 0; j < o.length; j++){		
			document.theForm.objects.options[j] = o[j];
		}
		if(document.theForm.objects.options.length==0) {
			document.getElementById("noresult").style.visibility="";
		}
		
		
    }else if(vValue == 'CallingsLists'){
		var searchFull = new RegExp(document.getElementById("searchfullname").value, "gi");
		var searchPart = new RegExp(document.getElementById("searchpartname").value, "gi");
		if (document.theForm.ckbox.checked == false) {
			var calling_lists = String( appletObj.getAllCallingListByName(tenant_dbid) );
		}else{
    		var calling_lists = String( appletObj.getCallingListByName(tenant_dbid,1) );
		}
		var jsCallingList = calling_lists+ "";
    	arrayCallingList = jsCallingList.split("|");
		
		document.theForm.objects.options.length=0; //remove 'loading' text
		if(searchFull!="//ig" && doingSearch==1) { // if full name search
			doingSearch=0;
			for (j = 0; j <arrayCallingList.length; j++){
				if(arrayCallingList[j].search(searchFull)==0) {
    				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
    		}
		}else if(searchPart!="//ig" && doingSearch==1) { // if partial name search
			doingSearch=0;
			for (j = 0; j <arrayCallingList.length; j++){
				if(arrayCallingList[j].search(searchPart)!=-1) {
    				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
    		}
		}else{
			for (j = 0; j <arrayCallingList.length; j++){
    			myOption = new Option(arrayCallingList [j],arrayCallingList [j])
				optionPos = document.theForm.objects.options.length
				document.theForm.objects.options[optionPos]=myOption
    		}
		}
		if(document.theForm.objects.options.length==0) {
			document.getElementById("noresult").style.visibility="";
		}
		
    }else if(vValue == 'Queues'){
		var searchFull = new RegExp(document.getElementById("searchfullname").value, "gi");
		var searchPart = new RegExp(document.getElementById("searchpartname").value, "gi");
    	var queues = "<%= pageDatePData.getQueuesString(request.getParameter("tenant_dbid")) %>";
		var jsQueues = queues + "";
    	arrayQueues = jsQueues.split("|");
		
		document.theForm.objects.options.length=0; //remove 'loading' text
		if(searchFull!="//ig" && doingSearch==1) { // if full name search
			doingSearch=0;
        	for (j = 0; j < arrayQueues.length; j++){
				if(arrayQueues[j].search(searchFull)==0) {
    				myOption = new Option(arrayQueues [j],arrayQueues [j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
    		}
		}else if(searchPart!="//ig" && doingSearch==1) { // if partial name search
			doingSearch=0;
			for (j = 0; j < arrayQueues.length; j++){
				if(arrayQueues[j].search(searchPart)!=-1) {
    				myOption = new Option(arrayQueues [j],arrayQueues [j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
    		}
		}else{
			for (j = 0; j < arrayQueues .length; j++){
    			myOption = new Option(arrayQueues [j],arrayQueues [j])
				optionPos = document.theForm.objects.options.length
				document.theForm.objects.options[optionPos]=myOption
    		}
		}
		if(document.theForm.objects.options.length==0) {
			document.getElementById("noresult").style.visibility="";
		}

    }/*else if (vValue == 'AgentSummary'){

    	var teamLeaders = String( appletObj.getAllTeams(tenant_dbid) );
        var jsTeamleaders = teamLeaders + "";
    	arrayTeam = jsTeamleaders.split("|");
		
		document.theForm.objects.options.length=0; //remove 'loading' text

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

    }*/
	else if (vValue=='RacByCallType') 
	{
		document.theForm.objects.options.length=0; //remove 'loading' text
		
		myOption = new Option('rac_french','5142232985')
		optionPos = document.theForm.objects.options.length
		document.theForm.objects.options[optionPos]=myOption

   }
//*************** new for the CallDetails
   else if(vValue == 'CallDetails')
   {
    	
		var searchFull = new RegExp(document.getElementById("searchfullname").value, "gi");
		var searchPart = new RegExp(document.getElementById("searchpartname").value, "gi");
		var calling_lists = String( appletObj.getCallingListByName(tenant_dbid,1) );
		var jsCallingList = calling_lists+ "";
    	arrayCallingList = jsCallingList.split("|");
		
		document.theForm.objects.options.length=0; //remove 'loading' text
		if(searchFull!="//ig" && doingSearch==1) { // if full name search
			doingSearch=0;
        	for (j = 0; j <arrayCallingList.length; j++) {
				if(arrayCallingList[j].search(searchFull)==0) {
    				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
    		}
		}else if(searchPart!="//ig" && doingSearch==1) { // if partial name search
			doingSearch=0;
			for (j = 0; j <arrayCallingList.length; j++) {
				if(arrayCallingList[j].search(searchPart)!=-1) {
    				myOption = new Option(arrayCallingList [j],arrayCallingList [j])
					optionPos = document.theForm.objects.options.length
					document.theForm.objects.options[optionPos]=myOption
				}
    		}
		}else{
			for (j = 0; j <arrayCallingList .length; j++) {
    			myOption = new Option(arrayCallingList [j],arrayCallingList [j])
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

function changeAgentListView(){

	var agents;
	var name="";
	var o = new Array();
	document.theForm.objects.length = 0;
	/*while(document.theForm.objects.length > 0){
		document.theForm.objects.options[0]= null;
	 }
	*/
	
	if (document.theForm.ckbox.checked == false) 
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

  if (document.theForm.ckbox.checked == false) //the_box.checked == true)
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
			alert("<%= pageDatePData.getWord("Please enter a starting date")%>");
			return false;
		}
		if(document.theForm.endingDateDaily.value.length == 0)
		{
			alert("<%= pageDatePData.getWord("Please enter an ending date")%>");
			return false;
		}
	}
	if(document.theForm.objects.selectedIndex == -1)
	{
		alert("<%= pageDatePData.getWord("Please select at least one object")%>");
		return;
	}
	if(document.theForm.objects.selectedIndex != -1 && document.theForm.objects.options[0].value=='')
	{
		alert("<%= pageDatePData.getWord("Please select at least one object")%>");
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
		alert("<%= pageDatePData.getWord("Your ending date cannnot be smaller than your starting date")%>");
		return false;
	}
} else if (document.theForm.period[1].checked){ // monthly
	var startDate='01-'+ document.theForm.starting_month_monthly.value + '-' + document.theForm.starting_year_monthly.value;
	var endDate ='01-'+  document.theForm.ending_month_monthly.value+ '-' + document.theForm.ending_year_monthly.value;
	startDate = new Date(startDate);
	endDate = new Date(endDate);

	if(endDate < startDate)
	{
		alert("<%= pageDatePData.getWord("Your ending date cannnot be smaller than your starting date")%>");
		return false;
	}


}else if (document.theForm.period[0].checked){// yearly
    var startDate=document.theForm.starting_year_yearly.value ;
	var endDate = document.theForm.ending_year_yearly.value ;

	if(endDate < startDate)
	{
		alert(" <%= pageDatePData.getWord("Your ending date cannnot be smaller than your starting date")%>");
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

 
//  StringParse(): Take a list of key-value as string and transform them to an array. ex: abcd=4&efgh=80  ==> stringElements[abcd]=4; stringElements[efgh]=80 
//  Parameters: tobeParsed. The string that will be parse
//  Return value: an associative array key-value

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

	if (document.getElementById("searchfirst")){
		var thisSearch1 = document.getElementById("searchfirst").value;
		var thisSearch2 = document.getElementById("searchlast").value;
		var thisSearch3 = document.getElementById("searchid").value;
		if (thisSearch1.match(/\?/) || thisSearch1.match(/\*/) || thisSearch1.match(/\(/) || thisSearch1.match(/\)/) || thisSearch1.match(/\+/) || thisSearch1.match(/\[/) || thisSearch1.match(/\]/) || thisSearch1.match(/\</) || thisSearch1.match(/\>/) || thisSearch1.match(/\|/) || thisSearch1.match(/\./) || thisSearch2.match(/\?/) || thisSearch2.match(/\*/) || thisSearch2.match(/\(/) || thisSearch2.match(/\)/) || thisSearch2.match(/\+/) || thisSearch2.match(/\[/) || thisSearch2.match(/\]/) || thisSearch2.match(/\</) || thisSearch2.match(/\>/) || thisSearch2.match(/\|/) || thisSearch2.match(/\./) || thisSearch3.match(/\?/) || thisSearch3.match(/\*/) || thisSearch3.match(/\(/) || thisSearch3.match(/\)/) || thisSearch3.match(/\+/) || thisSearch3.match(/\[/) || thisSearch3.match(/\]/) || thisSearch3.match(/\</) || thisSearch3.match(/\>/) || thisSearch3.match(/\|/) || thisSearch3.match(/\./)) { // disallowed characters
			alert("<%=pageDatePData.getWord("Search query cannot contain")%> '?', '*', '.', '+', '(', ')', '[', ']', '<', '>' <%=pageDatePData.getWord("or")%> '|'");
		}else{
			doingSearch=1;
			fillObjectCombo();
		}
	}else{
		var thisSearch1 = document.getElementById("searchfullname").value;
		var thisSearch2 = document.getElementById("searchpartname").value;
		
		if (thisSearch1.match(/\?/) || thisSearch1.match(/\*/) || thisSearch1.match(/\(/) || thisSearch1.match(/\)/) || thisSearch1.match(/\+/) || thisSearch1.match(/\[/) || thisSearch1.match(/\]/) || thisSearch1.match(/\</) || thisSearch1.match(/\>/) || thisSearch1.match(/\|/) || thisSearch1.match(/\./) || thisSearch2.match(/\?/) || thisSearch2.match(/\*/) || thisSearch2.match(/\(/) || thisSearch2.match(/\)/) || thisSearch2.match(/\+/) || thisSearch2.match(/\[/) || thisSearch2.match(/\]/) || thisSearch2.match(/\</) || thisSearch2.match(/\>/) || thisSearch2.match(/\|/) || thisSearch2.match(/\./)) { // disallowed characters
			alert("<%=pageDatePData.getWord("Search query cannot contain")%> '?', '*', '.', '+', '(', ')', '[', ']', '<', '>' <%=pageDatePData.getWord("or")%> '|'");
		}else if (document.getElementById("searchfullname").value!="" && document.getElementById("searchpartname").value!=""){
			alert("<%=pageDatePData.getWord("Search for either")%>\n\n'<%=pageDatePData.getWord("Name")%>'\n(<%=pageDatePData.getWord("can be the full name or the begining of the name")%>)\n<%=pageDatePData.getWord("or")%> '<%=pageDatePData.getWord("Name includes")%>'\n(<%=pageDatePData.getWord("search for text that is included anywhere in the name")%>)\n\n<%=pageDatePData.getWord("but not both")%>.");
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
			    
			    if (vValue == 'Agents'){
			    	document.write("<%=pageDatePData.getWord("Agent Details Reports")%>");
			    }
			    else if (vValue == 'AgentGroups'){
			    	document.write("<%=pageDatePData.getWord("Agent Groups Reports")%>");
			    }
			    else if (vValue == 'AgentLoginReport'){
			    	document.write("<%=pageDatePData.getWord("Agent Login Reports")%>");
			    }
			    else if (vValue == 'Campaigns'){
			    	document.write("<%=pageDatePData.getWord("Campaign Reports")%>");
			    }
			    else if (vValue == 'CallingsLists'){
			    	document.write("<%=pageDatePData.getWord("Calling List Reports")%>");
			    }
			    else if (vValue == 'Queues'){
			    	document.write("<%=pageDatePData.getWord("Queue Reports")%>");
			    }
			    else if(vValue =='Outbound') {
			    	document.write("<%=pageDatePData.getWord("Outbound call reports")%>");
			    }
			    else if(vValue=='AgentSummary'){
			    	document.write("<%=pageDatePData.getWord("Agent summary reports")%>");
			    }
				else if(vValue=='RacByCallType'){
					document.write("<%=pageDatePData.getWord("Report by call type for Microcell Rac")%>");
			    }
				else if(vValue=='AgentAdherenceReport'){
					document.write("<%=pageDatePData.getWord("Agent Adherence Report")%>");
				}
				else if (vValue == 'CallDetails'){
					document.write("<%=pageDatePData.getWord("Calling List Report Details")%>");
				}
			    </script>
			</legend>
			
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
			  
			  <tr height="45">
			<script language="JavaScript">
			 var vValue = normalizeString(QueryString('type'));
			if (vValue != ''){
			
			    document.write('<td valign="top" style="border-left-style:none; border-left-width:1; border-top-style:none; border-top-width:1;" >')
			    document.write('<br>')
			    document.write('<select id="objects" name="objects" multiple>')
				document.write('<option value="">&nbsp;</option>')
				document.write('<option value="">&nbsp;&nbsp;<%=pageDatePData.getWord("Loading")%>...</option>')
				document.write('<option value="">&nbsp;&nbsp;<%=pageDatePData.getWord("Please wait")%>.</option>')
			    document.write('</select>')
			    document.write('</td>')
			    
			
			
			    if ((vValue == 'Agents') || (vValue == 'AgentPerformance') ||(vValue == 'AgentAdherenceReport') ){
				     
					 
					 document.write('<td valign="top" style="padding-left:15px;">')
					 document.write('<div style="width:450px;">')
					 document.write('<div style="padding-top:8px; padding-bottom:4px;">search for:</div>')
					 document.write('<span style="width:130px"><%=pageDatePData.getWord("First name")%></span>')
					 document.write('<span style="width:130px"><%=pageDatePData.getWord("Last name")%></span>')
					 document.write('<span style="width:110px"><%=pageDatePData.getWord("Agent ID")%></span>')
					 document.write('<br>')
					 document.write('<span style="width:130px"><input id="searchfirst" type="text" value="" size="16" name="searchfirst" /></span>')
					 document.write('<span style="width:130px"><input id="searchlast" type="text" value="" size="16" name="searchlast" /></span>')
					 document.write('<span style="width:110px"><input id="searchid" type="text" value="" size="12" name="searchid" /></span>')
					 document.write('<button id="searchbut" onClick="searchFor()" style="cursor:pointer"><%=pageDatePData.getWord("Search")%></button>')
					 document.write('<br>')
					 document.write('<span style="width:300px; padding top:5px;">')
					 document.write('<input type=checkbox name=ckbox checked onClick="searchFor()">')
					 document.write('<%=pageDatePData.getWord("Show only active agents")%>'); // previously unchecked and text - Show all agents
					 document.write('<br>')
					 document.write('<input type=checkbox name=viewckbox onClick="searchFor()" >')
					 document.write("<%=pageDatePData.getWord("Show agent by ID")%>");
					 document.write('</span>')
					 document.write('<span><button onClick="resetResults()" style="cursor:pointer; margin-top:5px;"><%=pageDatePData.getWord("show full list")%></button></span>')
					 document.write('</div>')
					 document.write('</td>')
					 
			
			    } else if(vValue=='CallingsLists'){
					
					
					 document.write('<td valign="top" style="padding-left:15px;">')
					 document.write('<div style="width:450px;">')
					 document.write('<div style="padding-top:8px; padding-bottom:4px;"><%=pageDatePData.getWord("Search for either")%>:</div>')
					 document.write('<span style="width:130px"><%=pageDatePData.getWord("Name")%></span>')
					 document.write('<span style="width:130px"><%=pageDatePData.getWord("Name includes")%></span>')
					 document.write('<br>')
					 document.write('<span style="width:130px"><input id="searchfullname" type="text" value="" size="16" name="searchfullname" /></span>')
					 document.write('<span style="width:130px"><input id="searchpartname" type="text" value="" size="16" name="searchpartname" /></span>')
					 document.write('<button id="searchbut" onClick="searchFor()" style="cursor:pointer"><%=pageDatePData.getWord("Search")%></button>')
					 document.write('<br>')
					 document.write('<span style="width:190px; padding top:5px;">')
					 document.write('<input type=checkbox name=ckbox checked onClick="searchFor()">') // previously onClick="loadCallingLists()"
					 document.write('<%=pageDatePData.getWord("Show only active lists")%>'); // previously unchecked and text - Show all lists
					 document.write('<br />&nbsp;')
					 document.write('</span>')
					 document.write('<span><button onClick="resetResults()" style="cursor:pointer; margin-top:5px;"><%=pageDatePData.getWord("show full list")%></button></span>')
					 document.write('</div>')
					 document.write('</td>')
					
					
			
			    } else if((vValue == 'AgentSummary') || (vValue == 'AgentGroups') || (vValue == 'AgentLoginReport') || (vValue == 'Campaigns') || (vValue == 'CallingsLists') || (vValue== 'Outbound') || (vValue == 'Queues') || (vValue == 'CallDetails')){ 	 
				 	
					 document.write('<td valign="top" style="padding-left:15px;">')
					 document.write('<div style="width:450px;">')
					 document.write('<div style="padding-top:8px; padding-bottom:4px;"><%=pageDatePData.getWord("Search for either")%>:</div>')
					 document.write('<span style="width:130px"><%=pageDatePData.getWord("Name")%></span>')
					 document.write('<span style="width:130px"><%=pageDatePData.getWord("Name includes")%></span>')
					 document.write('<br>')
					 document.write('<span style="width:130px"><input id="searchfullname" type="text" value="" size="16" name="searchfullname" /></span>')
					 document.write('<span style="width:130px"><input id="searchpartname" type="text" value="" size="16" name="searchpartname" /></span>')
					 document.write('<button id="searchbut" onClick="searchFor()" style="cursor:pointer"><%=pageDatePData.getWord("Search")%></button>')
					 document.write('<br>')
					 document.write('<button name=\"selectAllButton\" onClick=\"selectAll()\" ID="Button1" style="cursor:pointer; margin-right:5px; margin-top:15px;"><%=pageDatePData.getWord("Select all")%></button>')
					 document.write('<button name=\"unSelectButton\" onClick=\"unSelectAll()\" ID="Button2" style="cursor:pointer; margin-right:30px; margin-top:15px;"><%=pageDatePData.getWord("Select none")%></button>');
					 document.write('<button onClick="resetResults()" style="cursor:pointer; margin-top:15px;"><%=pageDatePData.getWord("show full list")%></button>')
					 document.write('</div>')
					 document.write('</td>')
					
				 
				} else {
			       document.write('<td valign="top" width="38%" style="border-top-style: none; border-top-width: 1" >&nbsp;</td>')
			    }
			}else {
			
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
			
			  <tr ><td height="20">&nbsp;</td><td height="20">&nbsp;</td><td height="20">&nbsp;</td>
			  </tr>
			  </table>
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="69%"  >
			  
			  <tr height="26" valign="top" >
			    <td width="34%" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" >
			     <b><%=pageDatePData.getWord("Report type")%></b>
			    </td>
			    <td width="38%" style="border-top-style: none; border-top-width: 1" >
			     <b><%=pageDatePData.getWord("Starting date")%></b>
			    </td>
			    <td width="28%" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" >
			   <b><%=pageDatePData.getWord("Ending date")%></b>
			    </td>
			  </tr>
			  <tr height="26">
			  	<td>
					<input name="period" type="radio" value="yearly" onClick="changeDisabled()">
				<script>   
					if(vValue=='Agents' || vValue == 'AgentGroups')
					{
						document.write("<%=pageDatePData.getWord("for each year")%>");
					}
					else
					{
						document.write("<%=pageDatePData.getWord("detail for each year")%>");
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
						document.write("<%=pageDatePData.getWord("for each month")%>");
					}
					else
					{
						document.write("<%=pageDatePData.getWord("detail for each month")%>");
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
						document.write("<%=pageDatePData.getWord("for each day")%>");
					}
					else
					{
						document.write("<%=pageDatePData.getWord("detail for each day")%>");
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
						document.write("<%=pageDatePData.getWord("detailed information")%>");
					}
					if(vValue=='AgentSummary')
					{
						document.write('<input type=radio name=groupOrLeader value=group onClick="changeGroupOrLeaderList()" checked >')
						document.write("<%=pageDatePData.getWord("By Group")%>");
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
						document.write("<%=pageDatePData.getWord("By Leader")%>");
					}
					
				 </script>  
			   </td>
			   <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">&nbsp;
			   </td>
			   <td  valign"top"  align="right" >&nbsp;
			   </td>
			  </tr>
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
			
	 			<input id="submit" type="button" value="<%=pageDatePData.getWord("Submit")%>" onClick="getRequestedReport()">
					
			   </td>
			  </tr>
			</table>
		</fieldset>
		</div>
		</form>
	</div>
	
	<div id="noresult" style="position:absolute; top:60px; left:60px; visibility:hidden">No match.</div>
</body>
<% pageDatePData.closeConnection(); %>
</html>
