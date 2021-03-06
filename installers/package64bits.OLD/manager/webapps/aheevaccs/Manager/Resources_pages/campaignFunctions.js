function enabledAddButton()
{
	document.campaign.addButton.disabled = false;
}

function enabledDropButton()
{
	document.campaign.dropButton.disabled = false;
}

function valideCallerID(theID)
{
	v = true;
	if(theID.length == 0)
		v = false;
	else
	{
		theIDArray = theID.split('"');
		if(theIDArray.length != 3)
			v = false;
		else if(theIDArray[0].length > 0)
			v = false;
		else if(theIDArray[1].length < 1)
			v = false;
		else if(theIDArray[2].length < 1)
			v = false;
		else 
		{
			theNumberArray = theIDArray[2].split('<');
			if(theNumberArray.length != 2) 
				v = false;
			else
			{
				theNumberArray2 = theNumberArray[1].split('>');
				if(theNumberArray2.length != 2)
					v = false;
			}
		}
	}
	return v;
}

function enableDialingButton(flag)
{
	if(flag == true)
		document.campaign.load.disabled = false;
}

function enableUpdateButton()
{
	document.campaign.updateInfo.disabled = false;
}

function clickLoadButton()
{
	if(document.campaign.load.value == "Load")
	{
		if(document.campaign.dialingMode.value == 'BROADCAST' && document.campaign.routing_script.value == "")
		{
			alert("You must select a routing script");
			document.campaign.routing_script.focus();
		}
		else
		{
			document.campaign.status.value 		="Loaded";
			document.campaign.start.disabled 	= false;
			document.campaign.load.value  		= "Unload";
			loadCampaign();
		}
	}
	else
	{
	
		var answer = confirm(MultiArray["Are you sure, you wish to unload this campaign? You should only do this at the end of the day"][lang]);
		if(answer)
		{
			document.campaign.load.value  		= "Load";
			document.campaign.status.value 		= "Not Loaded";
			document.campaign.start.value 		= "Start";
			document.campaign.start.disabled 	= true;
			document.campaign.OptimizationParameter.disabled 	= false;
			document.campaign.dialingMode.disabled				= false;
			document.campaign.TargetValue.disabled				= false;
			document.campaign.AbandonRate.disabled				= false;
			unloadCampaign();
		}
	}
}

function clickStartButton()
{
	if(document.campaign.start.value == "Start")
	{
		var nb_ports = document.campaign.cmp_NbrPorts.value;
		/*
		var nb_total_remaining_ports = appletObj.getTotalRemainingPorts(cmpDBID);
		if(nb_total_remaining_ports - nb_ports < 0)
		{
			var yesno = confirm(MultiArray["The total number of ports of started campaigns is higher"][lang] + "\n" + MultiArray["than the total configured number of ports."][lang] + "\n" + MultiArray["Would you like to continue anyway?"][lang]);
			if(!yesno)
				return;
		}
		*/
		if(document.campaign.dialingMode.value == 'BROADCAST' && document.campaign.routing_script.value == "")
		{
			alert("You must select a routing script");
			document.campaign.routing_script.focus();
		}
		else
		{
			document.campaign.status.value		   			= "Campaign Started";
			document.campaign.start.value					= "Stop";
			// once the campaign is started, disabled entry data
			document.campaign.OptimizationParameter.disabled 	= true;
			document.campaign.dialingMode.disabled				= true;
			document.campaign.TargetValue.disabled				= true;
			document.campaign.AbandonRate.disabled				= true;
			document.campaign.routing_script.disabled			= true;
			
			startCampaign();
		}
	}
	else
	{
		document.campaign.status.value					= "Campaign Stopped";
		document.campaign.start.value					= "Start";
//		document.campaign.OptimizationParameter.disabled 	= false;
		document.campaign.dialingMode.disabled				= false;
		setDialingMode();
//		document.campaign.TargetValue.disabled				= false;
//		document.campaign.AbandonRate.disabled				= false;
		stopCampaign();
	}
}
function modifyTargetValue(selected)
{
	if(selected== 0)
		document.campaign.TargetValue.value = 80;
	else
		document.campaign.TargetValue.value = 10;

	if(document.campaign.dialingMode.value == 'PREDICTIVE' && document.campaign.OptimizationParameter.value == '1')
		document.campaign.AbandonRate.disabled = false;
	else
		document.campaign.AbandonRate.disabled = true;
}

function loadAllAgentGroups(tenant_dbid)
{
	var myForm = document.campaign;
	var allAgentGroups  = String(appletObj.getAgentGroupByName(tenant_dbid));
	var jsGroups = allAgentGroups  + "";
	arrayGroups = jsGroups.split("|");
	for (j = 0; j <arrayGroups.length; j++)
	{
		myOption = new Option(arrayGroups[j], arrayGroups[j]);
		optionPos = myForm.AgentGroupSelection.options.length;
		myForm.AgentGroupSelection.options[optionPos]=myOption;
	}
}

function loadAllRoutingScripts(tenant_dbid, cmpName)
{
	var myForm = document.campaign;
	var allRoutingScripts = String (appletObj.getAvailableRoutingScriptsForCampaign(tenant_dbid, cmpName));
	if(allRoutingScripts.length > 0)
	{
		var jsScripts = allRoutingScripts  + "";
		arrayScripts = jsScripts.split("|");
		for (j = 0; j <arrayScripts.length; j++)
		{
			aScript = arrayScripts[j].split(",");
			myOption = new Option(aScript[1],aScript[0]);
			optionPos = myForm.routing_script.options.length;
			myForm.routing_script.options[optionPos]=myOption;
		}
	}
}

function loadCallingLists(tenant_dbid, cmpName)
{
	var callList = String(appletObj.getCmpAndAvailableCallingList(cmpName, tenant_dbid));

	// parse the calling list
	var jsCallingLists = callList + "";
	var arrayCallingList = jsCallingLists.split("|");
	var strHTML = "";
	strHTML += '<table border="0" cellpadding="0" cellspacing="1" width="100%">';
	strHTML += '<tr>';
	strHTML += '<td width="45" bgColor="#cccccc"><b>'+MultiArray["Active"][lang] +'</b></td>';
	strHTML += '<td width="226" bgColor="#cccccc"><b>'+MultiArray["Calling list name"][lang] +'</b></td>';
	strHTML += '<td width="56" bgColor="#cccccc"><b>'+MultiArray["Weight"][lang] +'</b></td>';		
	strHTML += '</tr>';
	
	for (j = 0; j <arrayCallingList.length; j++)
	{
		var jsThisList = arrayCallingList[j];
		arrayCurrent   = jsThisList.split(",");
		var listName;
		var weight;
		var active;
		for (m = 0; m <arrayCurrent.length; m++)
		{
			if(m == 0)
				listName = arrayCurrent[m];
			else if(m == 1)
				weight = arrayCurrent[m];
			else if(m == 2 )
				active = arrayCurrent[m];
		}
	
		if(listName.length != 0)
		{
			// add a row only if we are not creating the campaign first
			if(cmpName.length != 0)
			{				
				var actCheck;
				if(active == '1')
					actCheck = "<input id='"+listName+"_check' type=\"checkbox\" name=\""+listName+"_check"+"\" value=\"ON\"  onClick=\"enableUpdateButton()\" checked>";
				else
					actCheck = "<input id='"+listName+"_check' type=\"checkbox\" name=\""+listName+"_check"+"\" value=\"ON\"  onClick=\"enableUpdateButton()\">";
					
				var weightstr	 = "<input id='"+listName+"_weight' type=\"text\" name=\""+listName+"_weight"+"\" size=\"3\" value=\""+ weight+"\"  onChange=\"enableUpdateButton()\">";
				strHTML += '<tr id="availableCallingListTR" listName="'+listName+'">';
				strHTML += '<td width="45">'+actCheck+'</td>';
				strHTML += '<td width="226">'+listName+'</td>';
				strHTML += '<td width="56">'+weightstr+'</td>';		
				strHTML += '</tr>';			   
			}
		}
	}	
	strHTML += '</table>';
	document.getElementById('availableCallingListTD').innerHTML = strHTML;
}


function displayBlacklistInfo()
{
	myForm = document.campaign;
	var blacklistGroups = String(appletObj.getBlacklistGroups(tenant_dbid));
	jsBlacklistGroups = blacklistGroups + "";
	//alert("=="+jsBlacklistGroups);
	arrayBlacklistGroups = jsBlacklistGroups.split("|");

	for (i = 0; i < arrayBlacklistGroups.length; i++)
	{
		var jsThisBlacklist = arrayBlacklistGroups[i];
		var arrayCurrent = jsThisBlacklist.split("^");
		for (j = 0; j < arrayCurrent.length; j++)
		{
			if (j == 0) dbid = arrayCurrent[j];
			else if (j == 1) name = arrayCurrent[j];
		}
		myOption = new Option(name,dbid);
		if (name != '')
		{
			
			if (name != 'Globals')
			{
				optionPos = myForm.availableBlackListGroups.options.length;
				myForm.availableBlackListGroups.options[optionPos]=myOption;
			}
			else
			{
				optionPos = myForm.selectedBlackListGroups.options.length;
				myForm.selectedBlackListGroups.options[optionPos]=myOption;
			}
		} // fin if (name != '')
	}
	
}




function displayCampaignInfo()
{
	cmpName = normalizeString(QueryString('campaign_name'));
	tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	
	hideLayer('leave_message_div');
	
	loadCallingLists(tenant_dbid, cmpName);
	loadAllAgentGroups(tenant_dbid);
	loadAllRoutingScripts(tenant_dbid, cmpName);
	var myForm = document.campaign;

	// default value for target value
	document.campaign.TargetValue.value = 10;
	document.campaign.campaignName.value = cmpName;

	var cmpDetails = String( appletObj.getCampaignInfo(cmpName) );

	// parse info received
	var jsDetails = cmpDetails + "";
    arrayDetails = jsDetails.split("|");
	for (i = 0; i <arrayDetails.length; i++)
	{
		if(i == 0)
			cmpDBID = arrayDetails[i];
		else if(i == 1)
		{
			if(arrayDetails[i] != "null" || arrayDetails[i] != "NULL" || arrayDetails[i])
				document.campaign.cmpDescription.value = arrayDetails[i];
			else
				document.campaign.cmpDescription.value = "";
		}
		else if( i == 2)
				document.campaign.cmp_NbrPorts.value = arrayDetails[i];
		else if( i == 3)
			selectObject(document.campaign.AgentGroupSelection, arrayDetails[i]);
    	else if ( i == 4)
		{
			if(arrayDetails[i] == '1')
				document.campaign.cmpState.checked = true;
			else
				document.campaign.cmpState.checked = false;
    	}
		else if ( i == 5)
		{
			if(arrayDetails[i] == '1')
			{
				document.campaign.AMD.checked = true;
				showLayer("leave_message_div");
				document.campaign.leave_message.checked = false;
			}
			else
			{
				document.campaign.AMD.checked = false;
				hideLayer("leave_message_div");
				document.campaign.leave_message.checked = false;
			}
		}
		else if( i == 6)
		{
			if(arrayDetails[i] != "" && arrayDetails[i] != "null" && arrayDetails[i] != "NULL")
				document.campaign.callerID.value = arrayDetails[i];			
		}
		else if(i == 7)
		{
			if(arrayDetails[i] == '1')
			{
				showLayer("leave_message_div");
				document.campaign.leave_message.checked = true;
			}
			else
				document.campaign.leave_message.checked = false;
		}
	}




	if (cmpName== '')
	{
		document.campaign.updateInfo.value =  MultiArray["Save"][lang] ;
		tp1.setSelectedIndex(0);
	}
	else
	{
		enableDialingButton(true);
		showCampaignCurrentStatus();
		setLegends(cmpName + " - ");
		// prendre le dbid de la campagne
		cmpdbid = String(appletObj.getCampaignDbidByName(cmpName));
		
		//Prendre tous les blacklist groups
		var blacklistGroups = String(appletObj.getBlacklistGroups(tenant_dbid));
		if(blacklistGroups.length > 0)
		{
			jsBlacklistGroups = blacklistGroups + "";
			//alert("=="+jsBlacklistGroups);
			arrayBlacklistGroups = jsBlacklistGroups.split("|");

			for (k = 0; k < arrayBlacklistGroups.length; k++)
			{
				var jsThisBlacklist = arrayBlacklistGroups[k];
				var arrayCurrentBlacklistGroup = jsThisBlacklist.split("^");

				var blacklistCampaigns = String(appletObj.getAllBlacklistCampaigns(cmpdbid));
				//alert("liste des blcmp pour cette cmp : "+blacklistCampaigns);
				//if (blacklistCampaigns != '') //(Trim(blacklistCampaigns) != '')
				//{		 
					jsBlacklistCampaigns = blacklistCampaigns + "";
					arrayBlacklistCampaigns = jsBlacklistCampaigns.split("|");
					//alert("tab de longueur : "+arrayBlacklistCampaigns.length+" et de valeur "+blacklistCampaigns);
					var avail = false;
					for (i = 0; i < arrayBlacklistCampaigns.length; i++)
					{
						var group_dbid = "";
						var jsThisBlacklistCampaign = arrayBlacklistCampaigns[i];
						//alert("toute la string : "+arrayBlacklistCampaigns[i]);
						var arrayCurrent = jsThisBlacklistCampaign.split(",");
						for (j = 0; j < arrayCurrent.length; j++)
						{
							if (j == 0) dbid = arrayCurrent[j];
							else if (j == 1) cmp_dbid = arrayCurrent[j];
							else if (j == 2) group_dbid = arrayCurrent[j];
						}

						group_name = "";
						if (j > 0)
							group_name = String(appletObj.getBlacklistGroupNameByDbid(group_dbid));
						//alert("group name = "+ group_name);
						//alert("je compare "+arrayCurrentBlacklistGroup[1]+ " et " +group_name)
						if (arrayCurrentBlacklistGroup[1] != group_name)
						{
							avail = true;
						} // fin if (group_name != '')
						else
						{
							avail = false;
							break;
						}
					}// fin for (i = 0;

					//alert("value = " + group_dbid + " et name = "+ arrayCurrentBlacklistGroup[1]);
					if (arrayCurrentBlacklistGroup[1] == "Globals")
					{
						myOption = new Option(arrayCurrentBlacklistGroup[1],arrayCurrentBlacklistGroup[0]);
						optionPos = document.campaign.selectedBlackListGroups.options.length;
						document.campaign.selectedBlackListGroups.options[optionPos]=myOption;
					}
					else if (avail == true)
					{	
						//myOption = new Option(arrayCurrentBlacklistGroup[1],group_dbid);
						myOption = new Option(arrayCurrentBlacklistGroup[1],arrayCurrentBlacklistGroup[0]);
						optionPos = document.campaign.availableBlackListGroups.options.length;
						document.campaign.availableBlackListGroups.options[optionPos]=myOption;
					}
					else  //if (group_name != "Globals")
					{	
						//myOption = new Option(arrayCurrentBlacklistGroup[1],group_dbid);
						myOption = new Option(arrayCurrentBlacklistGroup[1],arrayCurrentBlacklistGroup[0]);
						optionPos = document.campaign.selectedBlackListGroups.options.length;
						document.campaign.selectedBlackListGroups.options[optionPos]=myOption;
					}
				//} //fin if (trim(blacklistCampaigns) != '')
			}// fin for (k = 0;
		}
	}
}


function showCampaignCurrentStatus()
{
	var status = String( appletObj.getCampaingRunningInfo(cmpDBID) );
	if(status.length != 0)
	{
		var target 		= '';
		var dialMode 	= '';
		//var status 		= '';
		var optimization= '';
		var jsStatus = status + "";
    	arrayStatus = jsStatus.split("|");

  		for (j = 0; j <arrayStatus.length; j++)
		{
   			if(j == 0)
			{
   				target 		= arrayStatus[j];
		   		document.campaign.TargetValue.value = target;
   			}
			else if (j == 1)
			{
   				dialMode 	= arrayStatus[j];
   				if(dialMode == 'PREVIEW')
   					document.campaign.dialingMode.options[0].selected = true;
		   		else if(dialMode == 'PREDICTIVE')
	  				document.campaign.dialingMode.options[2].selected = true;
  				else if(dialMode == 'BROADCAST')
  				{
  					document.campaign.dialingMode.options[3].selected = true;
                    document.campaign.OptimizationParameter.disabled=true;
                    document.campaign.TargetValue.disabled = true;
  				}
                else if(dialMode == 'PROGRESSIVE')
  					document.campaign.dialingMode.options[1].selected = true;
   			}
			else if (j == 2)
   				status		= arrayStatus[j];
   			else if (j == 3)
			{
   				optimization = arrayStatus[j];
   				if(optimization == '0')
   					document.campaign.OptimizationParameter.options[0].selected = true;
   				else if(optimization == '1')
   					document.campaign.OptimizationParameter.options[1].selected = true;
   			}
			else if(j == 4)
					document.campaign.AbandonRate.value = arrayStatus[j];
			else if(j == 5)
			{
				associated_script = arrayStatus[j];
				var selectSBR = document.campaign.routing_script;
				for(k=0; k < selectSBR.length; k++)
				{
					sbrOption = selectSBR[k];
					if(sbrOption.value == associated_script)
					{
						sbrOption.selected = true;
						break;
					}
				}
			}
   		}
		if(status == 'PAUSED')
		{
			document.campaign.load.value  						= "Unload";
			document.campaign.status.value 						= "Campaign Loaded";
			document.campaign.start.value 						= "Start";
			document.campaign.start.disabled 					= false;
			document.campaign.dialingMode.disabled 				= false;
			document.campaign.OptimizationParameter.disabled 	= false;
			document.campaign.TargetValue.disabled 				= false;
			document.campaign.AbandonRate.disabled 				= false;
		}
		else if(status == 'RUNNING')
		{
			document.campaign.load.value						= "Unload";
			document.campaign.status.value						= "Campaign running";
			document.campaign.start.value						= "Stop";
			document.campaign.start.disabled    				= false;
			document.campaign.dialingMode.disabled 				= true;
			document.campaign.OptimizationParameter.disabled 	= true;
			document.campaign.TargetValue.disabled 				= true;
			document.campaign.AbandonRate.disabled 				= true;
			document.campaign.routing_script.disabled			= true;
		}
		else if(status == 'STOPPED')
		{
			document.campaign.load.value						= "Unload";
			document.campaign.status.value						= "Campaign Stopped";
			document.campaign.start.value						= "Start";
			document.campaign.start.disabled    				= false;
			document.campaign.dialingMode.disabled 				= false;
			document.campaign.OptimizationParameter.disabled 	= false;
			document.campaign.TargetValue.disabled 				= false;
			document.campaign.AbandonRate.disabled 				= false;
		}
	}
}

function loadCampaign()
{
	var dialingMode				= document.campaign.dialingMode.value;
	var optimizationParameter 	= document.campaign.OptimizationParameter.value;
	var target 					= document.campaign.TargetValue.value;
	var abandonRate 			= document.campaign.AbandonRate.value;
	var routing_script			= document.campaign.routing_script.value;

	if(target.length == 0)
		target = 0;

	if(document.campaign.updateInfo.disabled == false)
	{
		// info was changed...save it first
		validateInfo();
	}
	appletObj.loadCampaign(cmpName,target,dialingMode,optimizationParameter,abandonRate,routing_script);
}

function unloadCampaign()
{
	appletObj.unloadCampaign(cmpName);
}

function startCampaign()
{
	// get AgentBusyFactor
	// get Dialing Mode
	var target 					= document.campaign.TargetValue.value;
	var dialingMode				= document.campaign.dialingMode.value;
	var optimizationParameter 	= document.campaign.OptimizationParameter.value;
	var abandonRate 			= document.campaign.AbandonRate.value;
	var routing_script			= document.campaign.routing_script.value;

	appletObj.startCampaign(cmpName,target,dialingMode,optimizationParameter,abandonRate, routing_script);
}

function stopCampaign()
{
	appletObj.stopCampaign(cmpName);
}

function saveCallList(campaignName, listName, weight, active)
{
	appletObj.saveCmpCallingList(campaignName, listName, weight, active);
}

function performBlacklistOperations()
{
	// Find the names of calling lists associated to the campaign
	var callingListNames = "";
	//alert("ca cce!")
	for(i = 0; i < document.getElementsByTagName("tr").length; i++)
	{
		var current = document.getElementsByTagName("tr")[i];
		if(current.id == "availableCallingListTR")
		{
			var listName = current.getAttribute("listName");
			var weight = parseInt(document.getElementById(listName+"_weight").value, 10);
			var checked = document.getElementById(listName+"_check").checked;
			//alert(checked);

			if(weight < 0 || isNaN(weight))
				weight = 0;
			else if (weight > 100)
				weight = 100;
			document.getElementById(listName+"_weight").value = weight;
			//alert("weight="+weight+" checked="+checked+" listName="+listName+" cmpName="+cmpName);
			if(weight > 0 && checked && listName.length != 0 && cmpName.length != 0)
			{
				callingListNames += listName + "|";
			}
		}
	} // fin for
	if (callingListNames.length > 0)
	{
		callingListNames = callingListNames.substr(0, callingListNames.length - 1);
	}
    //alert(callingListNames);
	// Find the blacklist groups dbids
	var option_len = document.campaign.selectedBlackListGroups.options.length;
	var group_list = "";
	for (i = 0; i < option_len; i++)
	{
		var group_dbid = document.campaign.selectedBlackListGroups.options[i].value;
		group_list += group_dbid + "|";
	}
	if (group_list.length > 0)
	{
		group_list = group_list.substring(0, group_list.length-1);
	}
	//alert(group_list);
	//showPleaseWait("Please wait while applying blacklists to calling list. Do not close your browser !!!");
	refresh_field(callingListNames, group_list);
	}

function refresh_field(callingListNames, group_list)
{
	var xhr = getXMLObjInstance();
	// When http request returns
	if(xhr != null)
	{
		//alert("updateCallingListsFromBlackLists.jsp?callingListNames="+callingListNames+"&group_list="+group_list);
		xhr.open("GET", "updateCallingListsFromBlackLists.jsp?callingListNames="+callingListNames+"&group_list="+group_list, true);
		xhr.send('');
	}
}

function validateInfo()
{
	// save campaign
	group = document.campaign.AgentGroupSelection.value;
	var state = '';
	var amd = '';
	var leave_message = '';
	
	if(document.campaign.cmpState.checked)
		state = 1;
	else
		state = 0;
	
	if(document.campaign.AMD.checked)
		amd = 1;
	else
		amd = 0;

	if(document.campaign.leave_message.checked)
		leave_message = 1;
	else
		leave_message = 0;

	var nb_ports = document.campaign.cmp_NbrPorts.value;
	if(nb_ports.length < 1)
		nb_ports = '0';

	if(document.campaign.status.value == "Campaign Started" || document.campaign.status.value == "Campaign running")
	{
		var nb_total_remaining_ports = appletObj.getTotalRemainingPorts(cmpDBID);
		if(nb_total_remaining_ports - nb_ports < 0)
		{
			var yesno = confirm(MultiArray["The total number of ports of started campaigns is higher"][lang] + "\n" + MultiArray["than the total configured number of ports."][lang] + "\n" + MultiArray["Would you like to continue anyway?"][lang]);
			if(!yesno)
				return;
		}
	}
	var alReadyExist = false;

	var allCampaigns = String(appletObj.getCampaignsByName(tenant_dbid));
	jsCampaigns = allCampaigns.split("|");
	for(q = 0; q < jsCampaigns.length; q++)
	{
		if(document.campaign.campaignName.value == jsCampaigns[q] && cmpName != document.campaign.campaignName.value) //le groupe existe deja						
		{
			alReadyExist = true;
			break;
		}							
	}


	if(!valideCallerID(document.campaign.callerID.value))
		alert(MultiArray["CallerID should be like \"CallerName\" <(514) 222-2222>"][lang]);

	else if(document.campaign.callerID.value.length > 99)
	
	alert(MultiArray["The caller id cannot be more than 100 characters"][lang]);
	else if(alReadyExist)
	
		alert(MultiArray["Campaign already exists"][lang]);
	else if(validation(document.campaign.callerID.value)==0)
	{
		alert(MultiArray["Invalid use of character"][lang]);
		//document.campaign.callerID.focus();				
	}
	else if(validation(document.campaign.cmpDescription.value)==0)
	{
		alert(MultiArray["Invalid use of character"][lang]);
		//document.campaign.cmpDescription.focus();				
	}
	else if(validation(document.campaign.campaignName.value)==0)
	{
		alert(MultiArray["Invalid use of character"][lang]);
		//document.campaign.campaignName.focus();				
	}
	else if(validation(document.campaign.cmp_NbrPorts.value)==0)
	{
		alert(MultiArray["Invalid use of character"][lang]);
		//document.campaign.cmp_NbrPorts.focus();				
	}
	else
	{
		
		if(document.campaign.callerID.value=="")
			document.campaign.callerID.value = "NULL";
		if(document.campaign.cmpDescription.value=="")
			document.campaign.cmpDescription.value = "NULL";


		//alert("suis dans le bon");
		//performBlacklistOperations();

	
		appletObj.saveCampaign(
				cmpDBID,
				tenant_dbid,
				document.campaign.campaignName.value,
				document.campaign.cmpDescription.value,
				nb_ports,
				group,
				state,
				amd,
				document.campaign.daily_from_monday.value,
				document.campaign.daily_from_tuesday.value,
				document.campaign.daily_from_wednesday.value,
				document.campaign.daily_from_thursday.value,
				document.campaign.daily_from_friday.value,
				document.campaign.daily_from_saturday.value,
				document.campaign.daily_from_sunday.value,
				document.campaign.daily_to_monday.value,
				document.campaign.daily_to_tuesday.value,
				document.campaign.daily_to_wednesday.value,
				document.campaign.daily_to_thursday.value,
				document.campaign.daily_to_friday.value,
				document.campaign.daily_to_saturday.value,
				document.campaign.daily_to_sunday.value,
				document.campaign.callerID.value,
				leave_message,
				getXmlAllowedUsers()
				);

		validateCallingLists(cmpName);
		
		//alert("Avant getCmpDbidByName");
		var cmp_dbid = String(appletObj.getCmpDbidByName(cmpName));
		//alert("Apres getCmpDbidByName - cmp_id = "+cmp_dbid);
		
		var option_len = document.campaign.selectedBlackListGroups.options.length;
		var group_list = "";
		//alert("Nb de groupes selectionn?s : "+option_len);
		for (i = 0; i < option_len; i++)
		{
			var group_dbid = document.campaign.selectedBlackListGroups.options[i].value;
			//alert("group_dbid"+group_dbid);
			group_list += group_dbid + "^";
		}
		group_list = group_list.substring(0, group_list.length-1);
		//alert(group_list);
		appletObj.addBlacklistToCampaign(cmp_dbid, group_list);

	
		// reset the button to disabled
		document.campaign.updateInfo.disabled=true;
		//document.location.href = "../defaultpage.htm";
		return false;
	}
}

function validateCallingLists(cmpName)
{
	// verify calling list
	for(i = 0; i < document.getElementsByTagName("tr").length; i++)
	{
		var current = document.getElementsByTagName("tr")[i];
		if(current.id == "availableCallingListTR")
		{
			var listName = current.getAttribute("listName");
			var weight = parseInt(document.getElementById(listName+"_weight").value, 10);
			var checked = document.getElementById(listName+"_check").checked;
			if(weight < 0 || isNaN(weight))
				weight = 0;
			else if (weight > 100)
				weight = 100;
			document.getElementById(listName+"_weight").value = weight;

			if(weight > 0 && checked && listName.length != 0 && cmpName.length != 0)
			{
				// we have everithing, save this calling list now
				saveCallList(cmpName, listName, weight, checked);
			}
		}
	}
}

function askDelete()
{
	if((document.campaign.load.value  == "Unload") | (document.campaign.start.value == "Stop"))
	{
	
		alert(MultiArray["Please Unload/Stop the campaign before deleting it"][lang]);
		return;
	}

	answer = confirm(MultiArray["Are you sure, you wish to delete this campaign"][lang]);
	if(answer)
	{
		appletObj.deleteCampaign(cmpDBID);
		// refresh the current page
		document.location = "about:blank";
	}
}

function setDialingMode()
{
	if(document.campaign.start.value == "Start")
	{
		if((document.campaign.dialingMode.value =='BROADCAST') ||
		(document.campaign.dialingMode.value =='PREVIEW') ||
		(document.campaign.dialingMode.value =='PROGRESSIVE') )
		{
			document.campaign.OptimizationParameter.disabled=true;
			document.campaign.TargetValue.disabled = true;
			document.campaign.AbandonRate.disabled = true;
		}
		else
		{
			document.campaign.OptimizationParameter.disabled=false;
			document.campaign.TargetValue.disabled = false;
			document.campaign.AbandonRate.disabled = false;
		}
		if(document.campaign.dialingMode.value =='BROADCAST')
		{
			document.campaign.routing_script.disabled = false;
			if(document.campaign.AMD.checked)
				showLayer("leave_message_div");
		}
		else
			hideLayer("leave_message_div");
	}
	
	if(document.campaign.dialingMode.value =='BROADCAST')
	{
		showLayer('routing_script_div');
		hideLayer('agent_group_div');
	}
	else
	{
		hideLayer('routing_script_div');
		showLayer('agent_group_div');
	}
	
	if(document.campaign.dialingMode.value =='PREVIEW')
	{
		document.campaign.AMD.checked = false; 
		document.campaign.AMD.disabled = true;
		document.campaign.leave_message.checked = false;
		hideLayer("leave_message_div");
	} 
	else
	{
		document.campaign.AMD.disabled = false;
	}
}

function getXmlAllowedUsers()
{
	var theForm = document.campaign;
	var allowed = "";
	if(theForm.allowedUsers)
	{
		allowed = "<AllowedUsers>";
		for(var i = 0; i < theForm.allowedUsers.length; i++)
			allowed += "<Dbid>" + theForm.allowedUsers.options[i].value + "</Dbid>";
		allowed += "</AllowedUsers>";
	}
	else if(isNewResource)
		allowed += "<AllowedUsers><Dbid>" + currentUserDbid + "</Dbid></AllowedUsers>";
	return allowed;
}

function checkAnswerMachine()
{
	if(document.getElementById)
	{
		var amd_check = document.getElementById("AMD");	
		if(amd_check.checked && document.campaign.dialingMode.value == 'BROADCAST')
			showLayer("leave_message_div");
		else
		{
			var leave_message_check = document.getElementById("leave_message");
			leave_message_check.checked = false;
			hideLayer("leave_message_div");
		}
	}
}
