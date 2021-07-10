/**
 * @author Gildas
 */
var teamData       	= '';
var tenant_dbid		= 'NULL';
var team_dbid		= '';
var teamName 		= '';

 // ourCaption.innerHTML = "<h3>Modify team</h3>

function enabledAddButton()
{
	document.teamInfo.addButton.disabled = false;
}


function enabledDropButton()
{
	document.teamInfo.dropButton.disabled = false;
}

function enabledUpdateButton()
{
	document.teamInfo.updateInfo.disabled = false;
}

function checkOnUnload()
{
	document.teamInfo.updateInfo.disabled = false;
}

function enableReload()
{
   appletObj.fReloadMenu = true;
}

function sortSelect(obj)
{
	var o = new Array();
	if (obj.options==null) { return; }
	for (var i=0; i<obj.options.length; i++) {
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;
		}
	if (o.length==0) { return; }
	o = o.sort(
		function(a,b) {
			if ((a.text+"") < (b.text+"")) { return -1; }
			if ((a.text+"") > (b.text+"")) { return 1; }
			return 0;
			}
		);

	for (var i=0; i<o.length; i++) {
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}
}

function chkAndAddAgentToTeam()
{
        var i;
        var o;
	var myForm = document.teamInfo;
        var name = '';
        var tmpAgentsId ='';
        var option_len = myForm.nonConfiguredAgents.options.length;
	var id,lastName,firstName;
        
        for (i=0;i<=option_len-1;i++){
    	    if(myForm.nonConfiguredAgents.options[i].selected == true ) {
       		name = myForm.nonConfiguredAgents.options[i].value;
       		var jsname = name;
       		if (jsname != '' )  {
                    id = jsname ; 
		    id=id.substring(1,id.length-1);
			                 
        	}
              
                tmpAgentsId  = tmpAgentsId + id + "|"; // should Send agent_id
		
    	    }
        }

        if(tmpAgentsId !=''){
        	appletObj.addAgentToTeam(tmpAgentsId,team_dbid); 
        	enabledUpdateButton();
        }

        
	// Move them over
	for (i=0; i<myForm.nonConfiguredAgents.options.length; i++) {
            o = myForm.nonConfiguredAgents.options[i];
            if (o.selected)
                myForm.availableAgentInTeam.options[myForm.availableAgentInTeam.options.length] = new Option( o.text, o.value, false, false);

          }
	// Delete them from original
	for ( i=(myForm.nonConfiguredAgents.options.length-1); i>=0; i--) {
		o = myForm.nonConfiguredAgents.options[i];
		if (o.selected)
                    myForm.nonConfiguredAgents.options[i] = null;

          }

    	sortSelect(myForm.nonConfiguredAgents);
	sortSelect(myForm.availableAgentInTeam);

	myForm.nonConfiguredAgents.selectedIndex = -1;
	myForm.availableAgentInTeam.selectedIndex = -1;

 }

function chkAndDropAgentFromTeam()
{
        var myForm = document.teamInfo;
        var name = '';
        var tmpAgentsId='';
        var i;
        var o;
		var id;
		var lastName,firstName ;
        var option_len = myForm.availableAgentInTeam.options.length;
        for (i=0;i<option_len;i++){
            if(myForm.availableAgentInTeam.options[i].selected == true )  {
                name = myForm.availableAgentInTeam.options[i].value;
                var jsname = name;
                if (jsname != '' )  {
                    id = jsname ; 
		    id=id.substring(1,id.length-1);
			                    
        	}
                tmpAgentsId =tmpAgentsId + id +"|";
            }
        }

        if(tmpAgentsId != ''){
            appletObj.dropAgentFromTeam(tmpAgentsId,team_dbid);// to do
		}
        enabledUpdateButton();

       // Move them over
        for (i=0; i<myForm.availableAgentInTeam.options.length; i++) {
                o = myForm.availableAgentInTeam.options[i];
		if (o.selected) {
			myForm.nonConfiguredAgents.options[myForm.nonConfiguredAgents.options.length] = new Option( o.text, o.value, false, false);
			}
		}
		// Delete them from original
		for ( i=(myForm.availableAgentInTeam.options.length-1); i>=0; i--) {
			o = myForm.availableAgentInTeam.options[i];
			if (o.selected) {
				myForm.availableAgentInTeam.options[i] = null;
				}
		}

        	sortSelect(myForm.nonConfiguredAgents);
		sortSelect(myForm.availableAgentInTeam);

		myForm.availableAgentInTeam.selectedIndex = -1;
		myForm.nonConfiguredAgents.selectedIndex = -1;
}

function displayTeamInfo()
{
 	var lastName='';
	var firstName='';
	var name='';
	var loginId='';
	var freeAgtList='';
	var agtList='';
	
	var myForm = document.teamInfo;
	tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	teamData  = normalizeString(QueryString('team'));
	var i=myForm.availableAgentInTeam.options.length;
	var j=myForm.nonConfiguredAgents.options.length; 
	ourCaption   = document.getElementById("caption");
	
	if(teamData.length > 0 )
	{
		jsTeamData = teamData.split("^");
		for(q = 0; q < jsTeamData.length; q++)
		{
			if(q == 0)
				team_dbid = jsTeamData[q];
			if(q == 1)
			{
				myForm.teamname.value = jsTeamData[q];
				teamName = jsTeamData[q];
			}
			if(q == 2)
				myForm.teamleader.value = jsTeamData[q];
		}
		myForm.updateInfo.value = " Update ";
		myForm.deleteInfo.disabled = false;
	}
	
	if(teamName== '')
	{
		ourCaption.innerHTML = "<b>"+MultiArray["Add a new team"][lang]+"</b>";
		document.teamInfo.updateInfo.value =  ""+MultiArray["Add a new team"][lang]+"";
		document.teamInfo.nonConfiguredAgents.disabled = true;
		document.teamInfo.availableAgentInTeam.disabled = true;
	}
	else
	{
		ourCaption.innerHTML = "<b>"+MultiArray["Modify the team"][lang]+"</b>";
		document.teamInfo.updateInfo.value = ""+MultiArray["Update team"][lang]+"";
	}

	// Remove all agents from availableAgentInTeam option field
	if (i > 0)
	{
		for (i - 1; i >= 0; i--)
			myForm.availableAgentInTeam.options[i] = null;
	}
	
	// Remove all agents from NonConfiguredAgent option field
	if (j > 0)
	{
		for (j - 1; j >= 0; j--)
			myForm.nonConfiguredAgents.options[j] = null;
	}
	myForm.availableAgentInTeam.options.length = 0;
	
	freeAgtList = String(appletObj.getNonConfiguredAgentListInTeam(tenant_dbid));
	
	if (team_dbid != '')
	{
		agtList  = String(appletObj.getAvailableAgentListInTeam(team_dbid));
	}
	
	// parse the available agent list
	var jsAgtLists = agtList+ "";
	arrayAgtList = jsAgtLists.split("|");
	
	for (j = 0; j <arrayAgtList.length; j++)
	{
		var jsThisList = arrayAgtList[j];
		arrayCurrent   = jsThisList.split(",");
		for (m = 0; m <arrayCurrent.length; m++)
		{
			if(m == 0)
				lastName = arrayCurrent[m];
			else if(m == 1)
				firstName = arrayCurrent[m];
			else if(m == 2)
				loginId = arrayCurrent[m];
		}
		if(arrayAgtList[j] != '' )
		{
			name = lastName + ',' + firstName + loginId;
			myOption = new Option(name,loginId);
			optionPos = myForm.availableAgentInTeam.options.length ;
			myForm.availableAgentInTeam.options[optionPos]=myOption;
		}
	}
	sortSelect(myForm.availableAgentInTeam);
	
	// parse the Non configured agent list
	var jsNCAgtLists = freeAgtList+ "";
	arrayNCAgtList = jsNCAgtLists.split("|");
	
	for (j = 0; j <arrayNCAgtList.length; j++)
	{
		var jsThisList = arrayNCAgtList[j];
		arrayCurrent   = jsThisList.split(",");
		for (m = 0; m <arrayCurrent.length; m++)
		{
			if(m == 0)
				lastName = arrayCurrent[m];
			else if(m == 1)
				firstName = arrayCurrent[m];
			else if(m == 2)
				loginId = arrayCurrent[m];
		}
	
		if(arrayNCAgtList[j] != '' )   	
		{
			name = lastName + ','+ firstName + loginId;
			myOption = new Option(name,loginId) ;
			optionPos = myForm.nonConfiguredAgents.options.length;
			myForm.nonConfiguredAgents.options[optionPos]=myOption;
		}
	}
	sortSelect(myForm.nonConfiguredAgents);
	document.teamInfo.addButton.disabled = true;
	document.teamInfo.dropButton.disabled = true;
}

function saveInfo()
{	
	if (document.teamInfo.teamname.value ==''){
		alert (MultiArray["You must enter a TEAM NAME"][lang]);
		return false;	
	}	  
	else if (document.teamInfo.teamleader.value ==''){
		alert (MultiArray["You must enter a TEAM LEADER NAME"][lang]);
		return false;	
	}		  
	else if(validation(document.teamInfo.teamname.value)==0)
	{
		alert (MultiArray["Invalid use of character"][lang]);
		document.teamInfo.teamname.focus();
		return false;
	}
	else if(validation(document.teamInfo.teamleader.value)==0)
	{
		alert (MultiArray["Invalid use of character"][lang]);
		document.teamInfo.teamleader.focus();
		return false;
	}	
		
	var previous_team_name ="";	
	/* check if we don't have a another team with the same name */
	var duplicated = false,				
	 	allteams = String(appletObj.getAllTeams(tenant_dbid)),		
	 	allteamsarr = allteams.split('|');
			
	if((allteamsarr != null) && (allteamsarr.length > 0)){
		var teamName = document.teamInfo.teamname.value;
			thisteam = '',
			thisteamarr = null;
		for(var i = 0; i < allteamsarr.length && !duplicated; i++)
		{
			thisteam = allteamsarr[i];			
			thisteamarr = thisteam.split('^');
			if(thisteamarr[0] == team_dbid)
				previous_team_name = thisteamarr[1];
			else if(thisteamarr[1] == teamName)
			{
				document.teamInfo.teamname.value = previous_team_name;
				duplicated = true;
				break;			
			}				
		}
		if(duplicated)
		{
			alert('A team with the same name already exists');
			return false;
		}
		var t_name = document.teamInfo.teamname.value,
			t_leader = document.teamInfo.teamleader.value;
			
		appletObj.saveTeamInfo(team_dbid,t_name,t_leader,tenant_dbid);
		return true;		

	}//end of if if((allteamsarr != null) && (allteamsarr.length > 0))
	else
		return false;
	
}


function askDelete()
{
	answer = confirm(MultiArray["Are you sure, you wish to delete this team ?"][lang])
	if(answer){
		appletObj.deleteTeam(team_dbid,tenant_dbid);
		// refresh the current page
		document.location = "../defaultpage.htm";
	}
}
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