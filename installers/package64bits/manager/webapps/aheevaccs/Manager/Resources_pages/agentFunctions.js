

function enableUpdateButton()
{
	document.agent.updateInfo.disabled = false;
}

function askDelete()
{


	answer = confirm(MultiArray["Are you sure, you wish to delete this agent"][lang]);
	if(answer)
	{
		appletObj.deleteAgent(agentDBID);
		// refresh the current page
		document.location = "../defaultpage.htm";
	}
}

function loadSitesCombo()
{
	//Getting the list of sites from ComApplet
	var allSites = String(appletObj.getAllSites());
	
	//Creating an empty option
	myOption = new Option("", "");
	document.agent.SiteSelection.options[0] = myOption;

	//Parsing the received string   DBID^SiteName|DBID^SiteName|...
	var jsSites = allSites  + "";
	arraySites = jsSites.split("|");
	for (j = 0; j <arraySites.length; j++)
	{
		arrSiteInfo = arraySites[j].split("^");
		for (p = 0; p < arrSiteInfo.length; p++)
		{
			if(p == 0)
				site_dbid = arrSiteInfo[p];
			else if(p == 1)
				site_name = arrSiteInfo[p];
		}
		if(site_dbid.length > 0 && site_name.length > 0)		//If not all infos was sent, we don't add it in the list
		{
			myOption = new Option(site_name, site_dbid);
			optionPos = document.agent.SiteSelection.options.length;
			document.agent.SiteSelection.options[optionPos]=myOption;
		}
	}
}

function loadAgentGroupsCombo(tenant_dbid)
{
	//Getting the list form ComApplet
	var allAgentGroups  = String(appletObj.getAgentGroupByNameAndStatus(tenant_dbid, 1));
	
	// always add a null agent group
	myOption = new Option("", "");
	document.agent.AgentGroupSelection.options[0] = myOption;
	
	//Parsing the received list		//GroupName1|GroupName2...
	var jsGroups = allAgentGroups + "";
	arrayGroups = jsGroups.split("|");
	for (j = 0; j < arrayGroups.length; j++)
	{
		myOption = new Option(arrayGroups[j], arrayGroups[j]);
		optionPos = document.agent.AgentGroupSelection.options.length;
		document.agent.AgentGroupSelection.options[optionPos] = myOption;
	}
}

function loadPreferredSites(agent_login_id)
{
	var affectedSites = String(appletObj.getPreferSitesForAgent(agent_login_id));

	//Parsing the received string   DBID^SiteName|DBID^SiteName|...
	var jsSites = affectedSites  + "";
	arrayAffectedSites = jsSites.split("|");
	for (j = 0; j <arrayAffectedSites.length; j++)
	{
		arrAffectedSiteInfo = arrayAffectedSites[j].split("^");
		for (p = 0; p < arrAffectedSiteInfo.length; p++)
		{
			if(p == 0)
				site_dbid = arrAffectedSiteInfo[p];
			else if(p == 1)
				site_name = arrAffectedSiteInfo[p];
			else if(p == 2)
				pref_level = arrAffectedSiteInfo[p];
		}
		if(site_dbid.length > 0 && site_name.length > 0)		//If not all infos was sent, we don't add it in the list
		{
			myOption = new Option(site_name, site_dbid);
			optionPos = document.agent.affectedSites.options.length;
			document.agent.affectedSites.options[optionPos] = myOption;
			preferredSites += site_name + "^";
		}
	}
	loadAllPossiblePreferredSites();
}

function loadAllPossiblePreferredSites()
{
	//Getting the list of sites from ComApplet
	var allSites = String(appletObj.getAllSites());
	
	//Parsing the received string   DBID^SiteName|DBID^SiteName|...
	var jsSites = allSites  + "";
	arraySites = jsSites.split("|");
	for (j = 0; j <arraySites.length; j++)
	{
		arrSiteInfo = arraySites[j].split("^");
		for (p = 0; p < arrSiteInfo.length; p++)
		{
			if(p == 0)
				site_dbid = arrSiteInfo[p];
			else if(p == 1)
				site_name = arrSiteInfo[p];
		}
		if(site_dbid.length > 0 && site_name.length > 0)		//If not all infos was sent, we don't add it in the list
		{
			if(preferredSites.indexOf("^" + site_name + "^") == -1)
			{
				myOption = new Option(site_name, site_dbid);
				optionPos = document.agent.availableSites.options.length;
				document.agent.availableSites.options[optionPos] = myOption;
			}
		}
	}
}

function fillActivitiesCombo()
{
	var obj = document.getElementById("activity_type");
	if( obj )
	{
		if(obj.options.length <= 1 )
		{
			var activities = String( appletObj.getActivities() ); // dbid, name
			var jsActivities = activities + "";
			var arrayActivities = jsActivities.split("|");
			for (j = 0; j < arrayActivities.length; j++)
			{
				var activity = arrayActivities[j].split("^");
				myOption = new Option(activity[1],activity[0])
				optionPos = obj.options.length
				obj.options[optionPos]=myOption
			}
		}
	}
	enableUpdateButton();
}



function displayAgentInfo()
{
	var lastName;
	var firstName;
	var login_id;
	//ourCaption   = document.getElementById("caption");
	agentName    = normalizeString(QueryString('agtName'));
	tenant_dbid  = normalizeString(QueryString('tenant_dbid'));
	rightSkills  = normalizeString(QueryString('rightSkills'));
	var myForm   = document.agent;
	fillActivitiesCombo();
	loadSitesCombo();
	loadAgentGroupsCombo(tenant_dbid);

	if (agentName== '' || rightSkills == 'false')
	{
		//ourCaption.innerHTML = "<H3>Add a new agent<H3>";
		document.agent.updateInfo.value = MultiArray["Save"][lang] ;
		loadAllPossiblePreferredSites();
		tp1.setSelectedIndex(0);		//Select the first tab
		document.getElementById("tabSkills").style.position = 'absolute';
		document.getElementById("tabSkills").style.left = '-1000';
		document.getElementById("tabSkills").style.top = '-1000';
	}
	else 
	{
		document.agent.login.disabled = true;
		//ourCaption.innerHTML = "<h3>Modify existing agent information</h3>";
		var jsname = agentName + "";
		if (jsname != '' )
		{
			var arraytemp = jsname.split("[");
			jsname = arraytemp[0];
			arrayName = jsname.split(",");
			for (m = 0; m <arrayName.length; m++)
			{
				if(m == 0)	// get last name
					agentLastName = arrayName[m];
				else if(m == 1) //get firstname
					agentFirstName = arrayName[m];
			}
		}
		document.agent.agtLastName.value = agentLastName;
		document.agent.agtFirstName.value = agentFirstName;

		login_id = agentName.substring(agentName.indexOf("[")+1, agentName.indexOf("]"));
		agentLoginID = login_id;
		loadPreferredSites(agentLoginID);
		var agtDetails  = String(appletObj.getAgentInfo(login_id));

		// parse info received
		var jsDetails = agtDetails + "";
		//alert(jsDetails);
		arrayDetails = jsDetails.split("|");

		for (i = 0; i < arrayDetails.length; i++)
		{
			if(arrayDetails[i] == "NULL")
				arrayDetails[i] = "";
			
			if(i == 0)
				agentDBID = arrayDetails[i];
			else if(i == 1)// group name
			{
				selectObject(document.agent.AgentGroupSelection, arrayDetails[i]);
			}
			else if(i == 2) // lastname
				document.agent.agtLastName.value = arrayDetails[i];
			else if (i == 3) // firstname
				document.agent.agtFirstName.value = arrayDetails[i];
			else if (i == 4) // address1
				document.agent.address.value = arrayDetails[i];
			else if (i == 5) // address2
				document.agent.city.value 	= arrayDetails[i];
			else if (i == 6) // birthdate
				document.agent.birthdate.value = arrayDetails[i];
			else if (i == 7) // comments
				document.agent.comments.value = arrayDetails[i];
			//else if (i == 8) // employee_id
			//document.agent.employee_id.value = arrayDetails[i];
			else if (i == 9) // user name
				document.agent.username.value = arrayDetails[i];
			else if (i == 10) // login
				document.agent.login.value = arrayDetails[i];
			else if (i==11)  //password
				document.agent.password.value = arrayDetails[i];
			else if (i==12)  //state
			{
				if(arrayDetails[i] == '1')
					document.agent.state.checked = true;
				else
					document.agent.state.checked = false;
			}
			else if (i==13)
				document.agent.salary.value = arrayDetails[i];
			else if (i==14)
			{
				if(arrayDetails[i] == "NULL" || arrayDetails[i] == "null" )
					document.agent.startWorkDate.value = '';
				else
					document.agent.startWorkDate.value = arrayDetails[i];
			}
			else if (i==15)
			{
				if(arrayDetails[i] == "NULL" || arrayDetails[i] == "null")
					document.agent.endWorkDate.value = '';
				else
					document.agent.endWorkDate.value = arrayDetails[i];
			}
			else if(i == 16)
				selectObject(document.agent.SiteSelection, arrayDetails[i]);
			else if(i == 17)
				{
					if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION") || userHasRight("ALLOW_FINANCIAL_REPORTS"))
					{
						if (document.agent.activity_type)
							selectObject(document.agent.activity_type, arrayDetails[i]);
					}
					else
					{
						if (document.agent.activity_type)
							document.agent.activity_type.disabled = true;
					}
				}
		}
		setLegends("["+document.agent.login.value+"] "+document.agent.agtLastName.value+", "+document.agent.agtFirstName.value+ " - ");
	}
	loadSkills();
}

function validateInfo()
{
	var count = document.agent.elements.length;
	var tempName = '';
	var agtState = '';
	var  validID = '1';
	// Verify that the agent name, login and password are set
	if (document.agent.agtLastName.value =='' || document.agent.agtFirstName.value == '')
		
		alert(MultiArray["name fields: First name and Last name required"][lang]);
	else if (document.agent.login.value =='' || document.agent.password.value == '')
	
		alert(MultiArray["Login and Password required"][lang]);
	else if (document.agent.SiteSelection.value == '' )
	{
		alert(MultiArray["You must select a site."][lang]);
		//document.agent.SiteSelection.focus();
	}
	else if(document.agent.affectedSites.length == 0)
	{
	
		alert(MultiArray["Agent must have at least one preferred site"][lang]);
		//document.agent.availableSites.focus();
	}
	else 
	{
		if (document.agent.agtLastName.value !='' && validation(document.agent.agtLastName.value) == 0)
		{
		
			alert(MultiArray["Invalid use of character"][lang]); 
			return ;
		}
		if (document.agent.agtFirstName.value != '' && validation(document.agent.agtFirstName.value) == 0)
		{
			alert(MultiArray["Invalid use of character"][lang]); 
			return ;
		}
		
		if((document.agent.address.value != "") && validation(document.agent.address.value) == 0)
		{
			alert(MultiArray["Invalid use of character"][lang]); 
			return ;		
		}
		if((document.agent.city.value != "") && validation(document.agent.city.value) == 0)
		{
			alert(MultiArray["Invalid use of character"][lang]); 
			return ;
		}
		if(validation(document.agent.comments.value) == 0)
		{
			alert(MultiArray["Invalid use of character"][lang]); 
			return ;
		}
		if(document.agent.login.value != "" && validation(document.agent.login.value) == 0)
		{
			alert(MultiArray["Invalid use of character"][lang]); 
			return ;
		}
		if(document.agent.password.value != "" && validation(document.agent.password.value) == 0)
		{
			alert(MultiArray["Invalid use of character"][lang]); 
			return ;
		}
		if(document.agent.salary.value != "" && validation(document.agent.salary.value) == 0)
		{
			alert(MultiArray["Invalid use of character"][lang]); 	
			return ;
		}
		var agent_activity = "";
		if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION") || userHasRight("ALLOW_FINANCIAL_REPORTS"))
		{
			if(document.agent.activity_type.value == "") 
			{
				alert(MultiArray["You must select an activity for this agent"][lang]);
				return ;
			}
			else
				agent_activity = document.agent.activity_type.value;
		}
		else
		{
			agent_activity = "";
		}

		//Now check if another agent has been given the same login id..
		if(agentDBID == '')
			validID = String( appletObj.chkAgentInfo(document.agent.login.value) );
		if(validID == '0')
		{
		
			alert(MultiArray["Invalid login. Already given to another agent"][lang]);
			return;
		}
		if(document.agent.state.checked)
			agtState = 1;
		else
			agtState = 0;

		
		// save agent details
		
		appletObj.saveAgent(agentDBID, tenant_dbid, document.agent.AgentGroupSelection.value, document.agent.agtLastName.value,
		document.agent.agtFirstName.value, document.agent.address.value, document.agent.city.value,
		document.agent.birthdate.value, document.agent.comments.value, "", //document.agent.employee_id.value,
		document.agent.username.value, document.agent.login.value, document.agent.password.value,
		agtState, document.agent.salary.value, document.agent.startWorkDate.value,document.agent.endWorkDate.value,
		document.agent.SiteSelection.value, agent_activity);
		
		appletObj.savePreferSite(document.agent.login.value, buildPreferredSiteString());
		
		// if the agent has been modified...reload the menu page		
		if(agentDBID.length != 0)
			window.top.main.left.location.reload();	
			//appletObj.reloadMenu();
		
		// reset the button to disabled
		document.agent.updateInfo.disabled = true;
	}	
}

function chkAndAddPreferredSite()
{
	var i;
	var o;
	// Move them over
	for (i = 0; i < document.agent.availableSites.options.length; i++) 
	{
		o = document.agent.availableSites.options[i];
		if (o.selected)
			document.agent.affectedSites.options[document.agent.affectedSites.options.length] = new Option(o.text, o.value);
	}
	
	// Delete them from original
	for (i = (document.agent.availableSites.options.length - 1); i >= 0; i--)
	{
		o = document.agent.availableSites.options[i];
		if (o.selected)
			document.agent.availableSites.options[i] = null;
	}
	document.agent.availableSites.selectedIndex = -1;
	document.agent.affectedSites.selectedIndex = -1;
}

function chkAndRemovePreferredSite()
{
	var i;
	var o;
	// Move them over
	for (i = 0; i < document.agent.affectedSites.options.length; i++) 
	{
		o = document.agent.affectedSites.options[i];
		if (o.selected)
			document.agent.availableSites.options[document.agent.availableSites.options.length] = new Option(o.text, o.value);
	}
	
	// Delete them from original
	for (i = (document.agent.affectedSites.options.length - 1); i >= 0; i--)
	{
		o = document.agent.affectedSites.options[i];
		if (o.selected)
			document.agent.affectedSites.options[i] = null;
	}
	document.agent.availableSites.selectedIndex = -1;
	document.agent.affectedSites.selectedIndex = -1;
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
	if(agentName == '' && document.agent.affectedSites.options.length == 0)
	{
		if(document.agent.SiteSelection.value != "")
		{
			document.agent.availableSites.selectedIndex = -1;
			selectObject(document.agent.availableSites, document.agent.SiteSelection.value);
			chkAndAddPreferredSite();
		}
	}
}

function loadSkills()
{
	var div_to_fill = document.getElementById("skills_div");
	var jsSkillList = String(appletObj.getAllSkills(tenant_dbid));
	var skill_html = "<table border='0'>";
	if(jsSkillList.length > 0)
	{
		var skillList = "";
		jsSkillListArray = jsSkillList.split("|");
		for(i = 0; i < jsSkillListArray.length; i++)
		{
			thisOne = jsSkillListArray[i].split(",");
			skillList += thisOne[0]+",";
		}
		if(skillList.length > 1)
			skillList = skillList.substring(0, skillList.length-1);
		jsAskedAgentSkills = String( appletObj.getAgentsSkills(skillList, agentLoginID) );
		jsAskedAgentSkillsArray = jsAskedAgentSkills.split("^");
		thecolor = '#FFFFFF';
	
		if(jsAskedAgentSkills.length > 1)
		{
			for(i = 0; i < jsAskedAgentSkillsArray.length; i++)
			{
				thisOne = jsSkillListArray[i].split(",");
				thisOne2 = jsAskedAgentSkillsArray[i].split(",");
		
				skillDBID = thisOne[0];
				skillWeight = thisOne2[1];
				if(skillWeight == "N/A")
					skillWeight = 0;
				vectorOfSkillDbid.push(skillDBID);
				vectorOfWeight.push(skillWeight);
		
				skill_html += "<tr>";
					//skill_html += "<td ALIGN='LEFT' BGCOLOR='"+thecolor+"'>"+thisOne[1]+"</td>";
					skill_html += "<td ALIGN='LEFT' width='100'>"+thisOne[1]+"</td>";
					skill_html += "<td ID='td_agentSkillId'";
					skill_html += " agentDBID='"+thisOne2[2]+"'";
					skill_html += " skillDBID='"+thisOne[0]+"'";
					skill_html += " oldWeight='"+thisOne2[1]+"'";
					skill_html += " dbid='"+thisOne2[0]+"'";
					skill_html += " ALIGN='RIGHT'><input type='text' size='2' maxlength='3' id='skill_value"+skillDBID+"' onchange='s"+skillDBID+".setValue(validateSkillWeight(this));' value='"+skillWeight+"'></td>";
					skill_html += "<td width='60%'><div class='slider' id='slider-"+skillDBID+"' style='margin: 2px; width:auto;'>";
					skill_html += "<input class='slider-input' id='slider-input-"+skillDBID+"'></div></td>";
				skill_html += "</tr>";
			}
			skill_html += "<tr><td><input type='button' name='btnSaveSkills' value='"+MultiArray["Set skills"][lang]+"' onClick='saveskills()'></td></tr>";
		}
		else
		{

		
			skill_html += "<tr><td> "+MultiArray["You must first save the agent to set the skills"][lang] +"</td></tr>";
		}
	}
	else
		skill_html += "<tr><td> " +MultiArray["There is no skill available"][lang] +"</td></tr>";
	skill_html += "</table>";
	//alert(skill_html);
	div_to_fill.innerHTML = skill_html;
}

 +MultiArray["There is no skill available"][lang] +
 
function validateSkillWeight(oldWeight)
{
	var newWeight = parseInt(oldWeight.value, 10);
	if(isNaN(newWeight))
		newWeight = 0;
	oldWeight.value = newWeight;
	return newWeight;
}

function createSliders()
{
	var skill_html = "";
	var slider_recalculate = "";
	for (var i = 0; i < vectorOfSkillDbid.length; i++)
	{		
		skill_html += "s"+vectorOfSkillDbid[i]+" = new Slider(document.getElementById('slider-"+vectorOfSkillDbid[i]+"'), document.getElementById('slider-input-"+vectorOfSkillDbid[i]+"'));";
		skill_html += "s"+vectorOfSkillDbid[i]+".onchange = function() {";
		skill_html += "document.getElementById('skill_value"+vectorOfSkillDbid[i]+"').value = s"+vectorOfSkillDbid[i]+".getValue();"
		skill_html += "color = getColor(s"+vectorOfSkillDbid[i]+".getValue());";
		skill_html += "document.getElementById('skill_value"+vectorOfSkillDbid[i]+"').style.backgroundColor = color;};";
		skill_html += "s"+vectorOfSkillDbid[i]+".setValue("+vectorOfWeight[i]+");";
		skill_html += "s"+vectorOfSkillDbid[i]+".setMinimum(0);";
		skill_html += "s"+vectorOfSkillDbid[i]+".setMaximum(100);";
		skill_html += "s"+vectorOfSkillDbid[i]+".recalculate();";
		skill_html += "color = getColor(s"+vectorOfSkillDbid[i]+".getValue());";
		skill_html += "document.getElementById('skill_value"+vectorOfSkillDbid[i]+"').style.backgroundColor = color;";
		slider_recalculate += "s"+vectorOfSkillDbid[i]+".recalculate();";
	}
	skill_html += "document.body.onresize = function(){"+slider_recalculate+"};";
	eval(skill_html);
}

function saveskills()
{
	var AgentSkillString = "";
	var agentDBID		 = "";
	var skillDBID		 = "";
	var olDWEight		 = "";
	var NewWeight		 = "";
	var mDBID		  	 = "";
	
	//alert('len='+document.getElementsById('td_agentSkillId').length);
	for(i = 0; i < document.getElementsByTagName('td').length; i++)
	{
		var curObj = document.getElementsByTagName('td')[i];
		if(curObj.id == 'td_agentSkillId')
		{		
			//agentSkillDBID = td_agentSkillId[i].agentSkillDBID;
			
			var agentDBID = curObj.getAttribute('agentDBID');
			var skillDBID = curObj.getAttribute('skillDBID');
			var olDWEight = curObj.getAttribute('oldWeight');
			var NewWeight = document.getElementById('skill_value'+skillDBID).value;
			var mDBID	  = curObj.getAttribute('dbid');

			if(olDWEight == "N/A") olDWEight = "0";
			if(NewWeight == "N/A") NewWeight = "0";

			if(olDWEight != NewWeight ) //alors un changement a eu lieu,
			{
				if(olDWEight == "0") //, donc NewWeight != "N/a" ==> ajout d'un nouvel element...					
				{
					AgentSkillString += "-1"+"^"+agentDBID+"^"+skillDBID+"^"+NewWeight;
				}
				else
				{
					if(NewWeight == "0") //donc olDWEight != "N/A" ==> delete d'un elemnt existant
					{
						AgentSkillString += "-2"+"^"+mDBID;
					}
					else  // le oldWeight est different de NewWeight et sont tous les deux non N/A, modify
					{
						AgentSkillString += mDBID+"^"+NewWeight;
					}
				}			
				
				AgentSkillString += "|";
				curObj.oldWeight = NewWeight;
			}
		
		}//End IF
	}

	//alert('AgentSkillString='+AgentSkillString);
	if(AgentSkillString.length > 1)
		AgentSkillString = AgentSkillString.substring(0, AgentSkillString.length-1);
	
	if(AgentSkillString != "")
	{
		appletObj.saveAgentSkills(AgentSkillString);
	}
}