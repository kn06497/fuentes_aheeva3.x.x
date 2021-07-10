/**
 * This file contains javascript functions that are used in the datePicker.jsp
 * @author Gildas 
 */

/**
 * Sorts an array of options {Option} based on the text. But when the 
 * optional  parameter @see sortByValue is set to true, it does sort 
 * based on that field
 * @param {Object} o : The Options array to sort 
 * @param [{boolean}sortByValue] 
 */
function sortSelect(o)
{
	if (o.length == 0) { return; }
	if((arguments.length > 1) && (arguments[1]== true)){
		o = o.sort(
			function(a,b) {//Sorts by value
					if (parseInt(a.value) < parseInt(b.value)) { return -1; }
					if (parseInt(a.value) > parseInt(b.value)) { return 1; }
					return 0;
				}
			);
	}//end of if((arguments.length > 1) && (arguments[1]== true))	
	else{
		o = o.sort(
			function(a,b) {//Sorts by text
				if ((a.text + "") < (b.text + "")) { return -1; }
				if ((a.text + "") > (b.text + "")) { return 1; }
				return 0;
				}
			);
	}//end of else
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
/**
 * Changes the agents'List view, and sort them either 
 * by name or ID, according to the 'ckboxAgentByID.checked'
 * value  
 * @param :
 * @return :
 * @version : AheevaCCS 2.3.0
 * @author : HGM
 */
function changeAgentListView()
{
	var cbboxAgents = document.getElementById('objects');
	if(cbboxAgents != null){
		var o = new Array();
			optText = "";
							
		for(var i = 0; i < cbboxAgents.options.length; i++){			
			o.push(cbboxAgents.options[i]);
		}			
		
		//Now sort according to the showAgentsById value
		if(document.getElementById('ckboxAgentByID').checked){						
			o.sort(sortOptionsByValue);//sort by agent id
			for(var i = 0; i < o.length; i++){				
				optText =  '[' + o[i].value + '] ' + o[i].text;//[001]James Bond				
				cbboxAgents.options[i] = new Option(optText, o[i].value, o[i].defaultSelected, o[i].selected)
			}//end of for(var i = 0; i< o.length; i++)
			
		}//end of if(document.getElementById('ckboxAgentByID').checked)
		else{//sort by agents' name
			o.sort(sortOptionsByText);//sort by agents' name
			for(var i = 0; i< o.length; i++){
				//[001] James Bond => James Bond				
				optText =  o[i].text.slice(o[i].text.indexOf(']') + 2);//Remove the [ and the space
				cbboxAgents.options[i] = new Option(optText, o[i].value, o[i].defaultSelected, o[i].selected)
			}//end of for(var i = 0; i< o.length; i++)		
		}//end of else					
				
	}//end of if(cbboxAgents != null)
}

function loadAgent()
{
  var agents ="";
  var name = "";
  while(document.theForm.objects.length > 0){
    document.theForm.objects.options[0]= null;
  }

  if (document.theForm.ckbox.checked == true) //the_box.checked == true)
  {
    var agents = String( appletObj.getAgentsByName(tenant_dbid) );
 	
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
    var agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
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

function changeGroupOrLeaderList()
{
	
	while(document.theForm.objects.length > 0)
		document.theForm.objects.options[0]= null;	  

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
                 arrayTeamData = arrayTeam[j].split("^");
                 team_dbid = arrayTeamData[0];
                 team_name =  arrayTeamData[1];
                 team_leader = arrayTeamData[2];

				 myOption = new Option(team_leader,team_dbid)
				 optionPos = document.theForm.objects.options.length
				 document.theForm.objects.options[optionPos]=myOption
             }
            }
	}		
}

function loadCallingLists()
{
	while(document.theForm.objects.length > 0)
		document.theForm.objects.options[0]= null;
	  
	  if (document.theForm.ckbox.checked == true) 
	  {		
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
		var agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
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
		
        for (j = 0; j <arrayCampaigns.length; j++){
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
    }else if(vValue == 'Queues')
	{
    	var queues = String( appletObj.getQueueByName(tenant_dbid) );
		var jsQueues = queues + "";
    	arrayQueues = jsQueues.split("|");
        for (j = 0; j <arrayQueues .length; j++)
		{
    		myOption = new Option(arrayQueues [j],arrayQueues [j])
			optionPos = document.theForm.objects.options.length
			document.theForm.objects.options[optionPos]=myOption
    	} 
		 
		arrayQueues = getRoutingScriptAndQueues(tenant_dbid);
		 for (j = 0; j <arrayQueues.length; j++)
		 {
    		myOption = new Option(arrayQueues [j],arrayQueues [j])
			optionPos = document.theForm.objects.options.length
			document.theForm.objects.options[optionPos]=myOption
    	}
    }
	else if (vValue=='RacByCallType') 
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

function getSelectedTeams()
{
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
		return false;
	}
	if(document.theForm.objects.selectedIndex != -1 && document.theForm.objects.options[0].value=='')
	{
		alert(MultiArray["Please select at least one object"][lang]);
		return false;
	}
	if(dateChecker() == false)
	{
		return false;
	}
	
/*	if(vValue == 'Agents'){
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
	
	alert(destination);
	
	if(vValue == 'AgentAdherenceReport')
		document.location = destination;
	else
		window.open(destination);
	//document.location = destination;
	*/
	
	return true;
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

function changeDisabled()
{
	if(document.theForm.period[0].checked){
		document.theForm.startingDateDaily.disabled = true;
		document.theForm.endingDateDaily.disabled = true;
		document.theForm.starting_year_yearly.disabled = false;
		document.theForm.ending_year_yearly.disabled = false;
		document.theForm.starting_month_monthly.disabled = true;
		document.theForm.starting_year_monthly.disabled = true;
		document.theForm.ending_month_monthly.disabled = true;
		document.theForm.ending_year_monthly.disabled = true;
	/*	if(vValue == 'AgentAdherenceReport')
		{   document.theForm.period[0].checked = false;
			document.theForm.startingDateDaily.disabled = false;
			document.theForm.endingDateDaily.disabled = false;
			document.theForm.starting_year_yearly.disabled = true;
			document.theForm.ending_year_yearly.disabled = true;
		}*/
	} else if(document.theForm.period[1].checked){
		document.theForm.startingDateDaily.disabled = true;
		document.theForm.endingDateDaily.disabled = true;
		document.theForm.starting_year_yearly.disabled = true;
		document.theForm.ending_year_yearly.disabled = true;
		document.theForm.starting_month_monthly.disabled = false;
		document.theForm.starting_year_monthly.disabled = false;
		document.theForm.ending_month_monthly.disabled = false;
		document.theForm.ending_year_monthly.disabled = false;
		
	/*	if(vValue == 'AgentAdherenceReport')
		{   document.theForm.period[1].checked = false;
			document.theForm.startingDateDaily.disabled = false;
			document.theForm.endingDateDaily.disabled = false;
			document.theForm.starting_year_yearly.disabled = true;
			document.theForm.ending_year_yearly.disabled = true;
			document.theForm.starting_month_monthly.disabled = true;
			document.theForm.starting_year_monthly.disabled = true;
			document.theForm.ending_month_monthly.disabled = true;
			document.theForm.ending_year_monthly.disabled = true;

		}*/

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

// Associate a default button with pressing the Enter key
function KeyDownHandler(btn)
{
    // process only the Enter key
    if (event.keyCode == 13)
    {
        // cancel the default submit
        event.returnValue = false;
        event.cancel = true;
        // submit the form by programmatically clicking the specified button
        btn.click();
    }
}
/**
 * Changes the frame's url in order to set the 
 * agents' offset to show in the agents' select box  
 * @param {Object} agentsOffset : the agents' offset to show
 * @remark : It supposes that the offset is the last paramater 
 * in the url's query string 
 */
function setAgentsOffset(agentsOffset)
{	
	var url = document.location.href;		
	if(normalizeString(QueryString('offset')) == 'null' )				
		url += '&offset=' + agentsOffset;			
	else		
		url = url.slice(0, url.lastIndexOf('=') + 1) + agentsOffset;		

	document.location.replace(url);
}