var isAgentNameChanged = false; //Indicates that the agent name changed and that the left menu has to bu updated
/**
 * Enables the update button when agent's information has chaged
 * @param {boolean} : A value that when present and set to true indicates
 * 			that the agent's name and/or first name has changed. Then we set
 * 			the global variable 'isAgentNameChanged' to true and use in @see validateInfo()
 */ 
function enableUpdateButton()
{	
	if(arguments.length > 0 && arguments[0] != null)
		isAgentNameChanged = arguments[0];		
	
	document.agent.updateInfo.disabled = false;
}

function askDelete()
{
	answer = confirm(string[0]);
	if(answer)
	{
		appletObj.deleteAgent(agentDbid);
		// Reload the left menu
		window.top.main.left.location.reload();	
		// refresh the current page
		document.location = "../defaultpage.htm";
	}
}

function LoginIdFound(id)//see if new loginID was used by another agent
{ 
	var found = 0;
	if(loginIdArraySize > 0)
	{
		var j;
	    for(j=0; j<loginIdArraySize; j++)
		{
			if(agtLoginIdArray[j] == id)
			{
				found = 1;
				break;
			}
		}
	}
	return found;
}
function validateInfo()
{
	saveskills();
	var tempName = '';
	var agtState = '';
	var idExisted= 0;//var validID = '1';
	var agent_activity = "";
	var agentGroupName = "";
	
	agent_activity = document.agent.activity_type.value;

	// Verify that the agent name, login and password are set
	if (document.agent.agtLastName.value == '' || document.agent.agtFirstName.value == '')
		alert(string[1]);
	else if (document.agent.login.value =='' || document.agent.password.value == '')
		alert(string[2]);
	else if (document.agent.SiteSelection.value == '' )
	{
		alert(string[3]);
	}
	else if(document.agent.affectedSites.length == 0)
	{
		alert(string[4]);
	}
	else 
	{
		if (validation(document.agent.agtLastName.value) == 0)
		{
			alert(string[5]); 
			return false;
		}
		if (validation(document.agent.agtFirstName.value) == 0)
		{
			alert(string[5]); 
			return false;
		}
		
		if((document.agent.address.value != "") && validation(document.agent.address.value) == 0)
		{
			alert(string[5]); 
			return false;		
		}
		if((document.agent.city.value != "") && validation(document.agent.city.value) == 0)
		{
			alert(string[5]); 
			return false;
		}
		if(validation(document.agent.comments.value) == 0)
		{
			alert(string[5]); 
			return false;
		}
		if(document.agent.login.value != "" && validation(document.agent.login.value) == 0)
		{
			alert(string[5]); 
			return false;
		}
		if(document.agent.password.value != "" && validation(document.agent.password.value) == 0)
		{
			alert(string[5]); 
			return false;
		}
		if(document.agent.salary.value != "" && validation(document.agent.salary.value) == 0)
		{
			alert(string[5]); 	
			return false;
		}

		//Now check if another agent has been given the same login id..
		if(newAgent)
		{
			idExisted = LoginIdFound(document.agent.login.value); // validID = String(appletObj.chkAgentInfo(document.agent.login.value));
			if(idExisted == 1)
			{
				alert(string[6]);
			   	return false;
			}			
		}
		agtState = document.agent.state.checked ? 1 : 0;

		// save agent details
		if(newAgent)
		{
			agentGroupName = document.agent.AgentGroupSelection[document.agent.AgentGroupSelection.selectedIndex].text
			appletObj.saveAgent(agentDbid, tenant_dbid, agentGroupName, document.agent.agtLastName.value,
			document.agent.agtFirstName.value, document.agent.address.value, document.agent.city.value,
			document.agent.birthdate.value, document.agent.comments.value, "", "", 
			document.agent.login.value, document.agent.password.value, agtState, document.agent.salary.value, 
			document.agent.startWorkDate.value,document.agent.endWorkDate.value,
			document.agent.SiteSelection.value, agent_activity);
		}
		else
		{
			var saveString = "5,"; 
			if( (agtState == '0') && (agentLoggedIn) )
			{
				// if agent is not logged out, force him to be logged out before deactivate him
				appletObj.sendForceAgentStatus(document.agent.login.value, 'LOGGED_OUT', "agent", "forced log out to be deactivated");
			}
				
			saveString += agentDbid + "^";
			saveString += tenant_dbid + "^";
			saveString += document.agent.AgentGroupSelection.value + "^";
			saveString += document.agent.agtLastName.value + "^";
			saveString += document.agent.agtFirstName.value + "^";
			saveString += document.agent.address.value + "^";
			saveString += document.agent.city.value + "^";
			saveString += "^";
			saveString += "^";
			saveString += "^";
			saveString += document.agent.birthdate.value + "^";
			saveString += document.agent.comments.value + "^";
			saveString += document.agent.employeeId.value + "^";
			saveString += "^";
			saveString += document.agent.login.value + "^";
			saveString += document.agent.password.value + "^";
			saveString += "^";
			saveString += agtState + "^";
			saveString += document.agent.salary.value + "^";
			saveString += document.agent.startWorkDate.value + "^";
			saveString += document.agent.endWorkDate.value + "^";
			saveString += document.agent.SiteSelection.value + "^";
			saveString += agent_activity;
			appletObj.sendInfo(saveString);
		}

		appletObj.savePreferSite(document.agent.login.value, buildPreferredSiteString());
		
		if(originalAgentState != agtState || newAgent || isAgentNameChanged){	//Reload menu
			window.top.main.left.location.reload();
			isAgentNameChanged = false;
		}
		originalAgentState = agtState;
		
		//Disable login and password field
		document.agent.login.disabled = true;

		// reset the button to disabled
		document.agent.updateInfo.disabled = true;
	}	
}

function bringDownSite()
{
	var o, o2;
	var nbAffectedSites = document.agent.affectedSites.options.length;
	for(i = 0; i < nbAffectedSites; i++)
	{
		if(i + 1 != nbAffectedSites)
		{
			o = document.agent.affectedSites.options[i];
			if(o.selected)
			{
				o2 = document.agent.affectedSites.options[i + 1];
				document.agent.affectedSites.options[i] = new Option(o2.text, o2.value);
				document.agent.affectedSites.options[i + 1] = new Option(o.text, o.value);
				document.agent.affectedSites.options[i + 1].selected = true;
				break;
			}
		}
	}
}

function bringUpSite()
{
	var o, o2;
	for(i = 0; i < document.agent.affectedSites.options.length; i++)
	{
		if(i != 0)
		{
			o = document.agent.affectedSites.options[i];
			if(o.selected)
			{
				o2 = document.agent.affectedSites.options[i - 1];
				document.agent.affectedSites.options[i] = new Option(o2.text, o2.value);
				document.agent.affectedSites.options[i - 1] = new Option(o.text, o.value);
				document.agent.affectedSites.options[i - 1].selected = true;
				break;
			}
		}
	}
}

function buildPreferredSiteString()
{
	//site1^level|site2^level|...
	var o ;
	sRet = "";
	for(i = 0; i < document.agent.affectedSites.options.length; i++)
	{
		o = document.agent.affectedSites.options[i];
		sRet += o.value + "^" + (i + 1) + "|";
	}
	return sRet;
}

function addDefaultPreferredSite()
{
	if(document.agent.affectedSites.options.length == 0)
	{
		if(document.agent.SiteSelection.value != "")
		{
			document.agent.availableSites.selectedIndex = -1;
			selectObject(document.agent.availableSites, document.agent.SiteSelection.value);
			switchOptionsFromSelectBoxes("availableSites", "affectedSites");
		}
	}
}

function validateSkillWeight(oldWeight)
{
	var newWeight = parseInt(oldWeight.value, 10);
	if(isNaN(newWeight))
		newWeight = 0;
	oldWeight.value = newWeight;
	return newWeight;
}

function saveskills()
{
	var AgentSkillString = "";

	for(i = 0; i < document.getElementsByTagName('td').length; i++)
	{
		var curObj = document.getElementsByTagName('td')[i];
		if(curObj.id == 'td_agentSkillId')
		{
			var agentDBID = agentDbid;
			var skillDBID = curObj.getAttribute('skillDBID');
			var oldWeight = curObj.getAttribute('oldWeight');
			var newWeight = document.getElementById('skill_value'+skillDBID).value;
			var mDBID	  = curObj.getAttribute('dbid');

			if(oldWeight == "N/A") oldWeight = "0";
			if(newWeight == "N/A") newWeight = "0";

			if(oldWeight != newWeight ) //alors un changement a eu lieu,
			{
				if(oldWeight == "0") //, donc NewWeight != "N/a" ==> ajout d'un nouvel element...					
				{
					AgentSkillString += "-1"+"^"+agentDBID+"^"+skillDBID+"^"+newWeight;
				}
				else
				{
					if(newWeight == "0") //donc olDWEight != "N/A" ==> delete d'un elemnt existant
					{
						AgentSkillString += "-2"+"^"+mDBID;
					}
					else  // le oldWeight est different de NewWeight et sont tous les deux non N/A, modify
					{
						AgentSkillString += mDBID+"^"+newWeight;
					}
				}			
				
				AgentSkillString += "|";
				curObj.oldWeight = newWeight;
			}
		
		}//End IF
	}

	if(AgentSkillString.length > 1)
		AgentSkillString = AgentSkillString.substring(0, AgentSkillString.length-1);
	
	if(AgentSkillString != "")
	{
		appletObj.saveAgentSkills(AgentSkillString);
	}
}
