// JavaScript Document
/*****************************************
 Class agentPickUpMethod()
*****************************************/

function agentPickUpMethod()
{
	this.uID = 0;
	this.xPos 				= "0px";
	this.yPos 				= "0px";
	this.havingClause = "";
	this.tieBreaker = "";
	this.timeOut = 0;
	this.OnTimeOutAction = "";
	this.OnTimeOut_uID = 0;	
	this.OnTimeOut_Type = "";
	this.CallPriority = "";	
	this.OnTimeOutGoto = "";
	this.ownBoxType = "PM";
	this.VUID = 0;
	this.OnTimeOutVUID = 0;
	this.url	= "";
	this.queueName = "";
	this.active_queue_announcements	= "off";
	this.announce_queue_pos			= "off";
	this.announce_estimated_holdtime= "off";
	this.announce_frequency			= "0";
	this.startwithannouncements		= "off";
	
	this.voicemess_you_are			= "queue-youarenext";
	this.voicemess_thereare			= "queue-thereare";
	this.voicemess_callwaitings		= "queue-callswaiting";
	this.voicemess_holdtime			= "queue-holdtime";
	this.voicemess_minutes			= "queue-minutes";
	this.voicemess_thanksyouforyourpatience	= "queue-thankyou";
	this.caller_exitkeys			= "";
	
	this.buildHTML = function()
	{	
		if(this.havingClause != "")
			{
			buttonValue = 'Having [';
			if(this.havingClause.length > 20)
				buttonValue += this.havingClause.substring(0, 20)+' ...';
			else
				buttonValue += this.havingClause;				
			buttonValue += ']';			
			}
		else
			buttonValue = "Setup";
		
				
		sReturn =  '<div id="IDPickMethod_'+this.uID+'"';
		sReturn += ' uID = "'+this.uID+'"';
		sReturn += ' xPos = "'+this.testedPropertyID+'"';
		sReturn += ' yPos = "'+this.LinkType+'"';
		sReturn += ' havingClause = "'+this.havingClause+'";'
		sReturn += ' tieBreaker = "'+this.tieBreaker+'"';
		sReturn += ' timeOut = "'+this.seekValue+'"';
		sReturn += ' OnTimeOutAction = "'+this.OnTimeOutAction+'"';
		sReturn += ' OnTimeOut_uID = "'+this.OnTimeOut_uID+'"';
		sReturn += ' OnTimeOut_Type = "'+this.OnTimeOut_Type+'"';
		sReturn += ' class="defaultAgentPickUp" style="top:'+this.yPos+'; left:'+this.xPos+'"';
		sReturn += ' ';
		sReturn += ' >';
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
		sReturn += '<tr bgcolor="#C5D3EB"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDPickMethod_'+this.uID+'\')"><b>Pick UP Method #'+this.uID;
		if(DEBUG)
			sReturn += ' ID['+this.VUID+']';
		sReturn += '</b></td>';
		sReturn += '<td align="right"><a href="javascript:closethePM('+this.uID+')">';
		sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';		
		sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'PM\', \''+this.VUID+'\')"><i>Entry Point</i></td></tr>';
		sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpPM(\''+this.uID+'\', \''+this.havingClause+'\', \''+this.tieBreaker+'\', \''+this.timeOut+'\', \''+this.OnTimeOutAction+'\', \''+this.CallPriority+'\', \''+this.queueName+'\', \''+this.url+'\', \''+this.active_queue_announcements+'\', \''+this.announce_estimated_holdtime+'\', \''+this.announce_frequency+'\', \''+this.startwithannouncements+'\', \''+this.voicemess_you_are+'\', \''+this.voicemess_holdtime+'\', \''+this.voicemess_minutes+'\', \''+this.voicemess_thanksyouforyourpatience+'\')" ';
		sReturn += 'value="'+buttonValue+'" class="setupButton"></td></tr>';
		sReturn += '<tr><td colspan="2" nowrap class="onsuccedTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'onTimeOut\', \'PM\', \''+this.VUID+'\')"><i>On Timeout';
		if(DEBUG)
			sReturn += ' -->['+this.OnTimeOutVUID+']';
		sReturn += '</i></td></tr>';
		sReturn += '</table>';
		sReturn += '</div>';
		sReturn += '';
		
		return sReturn;
	}
	
	
	this.validate = function()
	{
		var bReturn = true;
		
		if(this.havingClause == "")
			{
			alert('Error: Missing Minimum Required for Agent Pickup Method #'+this.uID);
			retrieveTmpMessage();
			bReturn = false;
			setUpPM(this.uID, this.havingClause, this.tieBreaker, this.timeOut, this.OnTimeOutAction, this.CallPriority, this.queueName, this.url, this.active_queue_announcements, this.announce_estimated_holdtime, this.announce_frequency, this.startwithannouncements, this.voicemess_you_are, this.voicemess_holdtime, this.voicemess_minutes, this.voicemess_thanksyouforyourpatience);
			}
		else if( !isValideExpression(this.havingClause, this.uID) )
			{
			retrieveTmpMessage();
			bReturn = false;
			setUpPM(this.uID, this.havingClause, this.tieBreaker, this.timeOut, this.OnTimeOutAction, this.CallPriority, this.queueName, this.url, this.active_queue_announcements, this.announce_estimated_holdtime, this.announce_frequency, this.startwithannouncements, this.voicemess_you_are, this.voicemess_holdtime, this.voicemess_minutes, this.voicemess_thanksyouforyourpatience);
			}			
		else if(this.tieBreaker == "")
			{
			alert('Error: Missing TieBreaker for Agent Pickup Method #'+this.uID);
			retrieveTmpMessage();
			bReturn = false;
			setUpPM(this.uID, this.havingClause, this.tieBreaker, this.timeOut, this.OnTimeOutAction, this.CallPriority, this.queueName, this.url, this.active_queue_announcements, this.announce_estimated_holdtime, this.announce_frequency, this.startwithannouncements, this.voicemess_you_are, this.voicemess_holdtime, this.voicemess_minutes, this.voicemess_thanksyouforyourpatience);
			}
		else if(this.CallPriority == "")
			{
			alert('Error: Missing Call Priority for Agent Pickup Method #'+this.uID);
			retrieveTmpMessage();
			bReturn = false;
			setUpPM(this.uID, this.havingClause, this.tieBreaker, this.timeOut, this.OnTimeOutAction, this.CallPriority, this.queueName, this.url, this.active_queue_announcements, this.announce_estimated_holdtime, this.announce_frequency, this.startwithannouncements, this.voicemess_you_are, this.voicemess_holdtime, this.voicemess_minutes, this.voicemess_thanksyouforyourpatience);
			}
		else if(this.queueName == "")
			{
			alert('Error: Missing virtual queue name for Agent Pickup Method #'+this.uID);
			retrieveTmpMessage();
			bReturn = false;
			setUpPM(this.uID, this.havingClause, this.tieBreaker, this.timeOut, this.OnTimeOutAction, this.CallPriority, this.queueName, this.url, this.active_queue_announcements, this.announce_estimated_holdtime, this.announce_frequency, this.startwithannouncements, this.voicemess_you_are, this.voicemess_holdtime, this.voicemess_minutes, this.voicemess_thanksyouforyourpatience);
			}
		else if(this.queueName == document.theForm.n_script_name.value)
			{
			alert('Error:Virtual queue name for Agent Pickup Method #'+this.uID+' cannot be the routing script name.');	
			retrieveTmpMessage();
			bReturn = false;
			setUpPM(this.uID, this.havingClause, this.tieBreaker, this.timeOut, this.OnTimeOutAction, this.CallPriority, this.queueName, this.url, this.active_queue_announcements, this.announce_estimated_holdtime, this.announce_frequency, this.startwithannouncements, this.voicemess_you_are, this.voicemess_holdtime, this.voicemess_minutes, this.voicemess_thanksyouforyourpatience);			
			}
		
		
		return bReturn;
	}
	
	this.softvalidate = function()
	{
		var rArray = new Array();
		var tmpmess;
		var tmptext = "";
		var tmponclick = 'setUpPM(\''+this.uID+'\', \''+this.havingClause+'\', \''+this.tieBreaker+'\', \''+this.OnTimeOutAction+'\', \''+this.CallPriority+'\', \''+this.queueName+'\', \''+this.url+'\', \''+this.active_queue_announcements+'\', \''+this.announce_estimated_holdtime+'\', \''+this.announce_frequency+'\', \''+this.startwithannouncements+'\', \''+this.voicemess_you_are+'\', \''+this.voicemess_holdtime+'\', \''+this.voicemess_minutes+'\', \''+this.voicemess_thanksyouforyourpatience+'\')';
		
		if(this.havingClause == "")
		{			
			tmpmess = new softValidationMess();			
			tmptext = 'Missing Minimum Required for Agent Pickup Method #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);		
		}
		if(this.tieBreaker == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Missing TieBreaker for Agent Pickup Method #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}
		if(this.CallPriority == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Missing Call Priority for Agent Pickup Method #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);		
		}
		if(this.queueName == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Missing virtual queue name for Agent Pickup Method #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);	
		}
		return rArray;
	}
}






/********************
	OTHERS FUNCTIONS
********************/

function addThistoPMArea(text)
{
	insertAtCursor(document.popUpForm.PMSetupDialog_mininumString, text);
}

function insertAtCursor(myField, myValue) 
{
	//IE support
	if (document.selection) {
	myField.focus();
	sel = document.selection.createRange();
	sel.text = myValue;
	}
	//MOZILLA/NETSCAPE support
	else if (myField.selectionStart || myField.selectionStart == '0') {
	var startPos = myField.selectionStart;
	var endPos = myField.selectionEnd;
	myField.value = myField.value.substring(0, startPos)
	+ myValue
	+ myField.value.substring(endPos, myField.value.length);
	} else {
	myField.value += myValue;
	}
}

function changePMSetupInterface(vl)
{
	inHTML = '';
	if(vl == 'AgentGroup=') //si on a l'option group de selectionner, 
	{
		inHTML += '<select onChange="if(this.value!=\'\') addThistoPMArea(this.options[this.selectedIndex].text);" >';
		inHTML += '<option>-- Agent Groups --</option>';
		var agentGroups = String(appletObj.getAgentGroupsByStatusAndTenant("1", tenantDBID ));
		var jsGroups = agentGroups + "";
		arrayGroups = jsGroups .split("|");		
		if(agentGroups.length != 0)
		{
			for (i = 0; i <arrayGroups.length; i++)
			{
				thisGrpElement = arrayGroups[i].split(",");
				inHTML += '<option value="'+thisGrpElement[0]+'">'+thisGrpElement[1]+'</option>';
			} //Fin de for (i = 0; i <arrayGroups.length; i++)
		}
		//inHTML += '<option>dasdas</option><option>asdad</option><option>asdasd</option>';
		inHTML += '</select>';		
	}
	else if(vl == 'Agent=')
	{
		///	
	}
	else
	{
		inHTML += '<input type="button" value="<" onClick="addThistoPMArea(\'&lt;\')">';
		inHTML += '<input type="button" value="=" onClick="addThistoPMArea(\'=\')">';
		inHTML += '<input type="button" value=">" onClick="addThistoPMArea(\'&gt;\')">';
	}
	PMSetupDialog_optionbuttons.innerHTML = inHTML;
}

function closeSetUpPM()
{
	document.getElementById('PMSetupDialog').style.visibility = "hidden";	
}


function submitSetUpPM()
{
	//alert("INSIDE...submitSetUpPM()")
	for(i = 0; i < vectorAgentPickupMethods.length; i++)
	{
		
		if(vectorAgentPickupMethods[i].uID == PMSetupDialog_id.innerText)
		{			
			vectorAgentPickupMethods[i].havingClause 	= replacenewLineCaracters(document.popUpForm.PMSetupDialog_mininumString.value);
			vectorAgentPickupMethods[i].timeOut 		= document.popUpForm.PMSetupDialog_timeout.value;
			vectorAgentPickupMethods[i].OnTimeOutAction = document.popUpForm.PMSetupDialog_actionduringTimeout.value;
			vectorAgentPickupMethods[i].tieBreaker 		= document.popUpForm.PMSetupDialog_tieBreaker.value;
			vectorAgentPickupMethods[i].CallPriority 	= document.popUpForm.PMSetupDialog_callPriority.value;
			vectorAgentPickupMethods[i].queueName 		= document.popUpForm.PMSetupDialog_queuename.value;
			vectorAgentPickupMethods[i].url 			= document.popUpForm.PMSetupDialog_url.value;
			vectorAgentPickupMethods[i].active_queue_announcements 			= document.popUpForm.PMSetupDialog_active_queue_announcements.checked ? "on" : "off";
			vectorAgentPickupMethods[i].announce_estimated_holdtime 			= document.popUpForm.PMSetupDialog_announce_estimated_holdtime.checked ? "on" : "off";
			vectorAgentPickupMethods[i].announce_frequency 			= document.popUpForm.PMSetupDialog_announce_frequency.value;
			vectorAgentPickupMethods[i].startwithannouncements 			= document.popUpForm.PMSetupDialog_startwithannouncements.checked ? "on" : "off";
			//vectorAgentPickupMethods[i].voicemess_you_are 			= document.popUpForm.PMSetupDialog_voicemess_you_are.value;
			vectorAgentPickupMethods[i].voicemess_holdtime 			= document.popUpForm.PMSetupDialog_voicemess_holdtime.value;
			vectorAgentPickupMethods[i].voicemess_minutes 			= document.popUpForm.PMSetupDialog_voicemess_minutes.value;
			vectorAgentPickupMethods[i].voicemess_thanksyouforyourpatience 			= document.popUpForm.PMSetupDialog_voicemess_thanksyouforyourpatience.value;
			/*vectorAgentPickupMethods[i].url 			= document.popUpForm.PMSetupDialog_url.value;
			vectorAgentPickupMethods[i].url 			= document.popUpForm.PMSetupDialog_url.value;
			vectorAgentPickupMethods[i].url 			= document.popUpForm.PMSetupDialog_url.value;
			vectorAgentPickupMethods[i].url 			= document.popUpForm.PMSetupDialog_url.value;*/
						
			break;
		}
	}
	document.getElementById('PMSetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();	
	reDisplayObj("IDPickMethod_"+vectorAgentPickupMethods[i].uID, vectorAgentPickupMethods[i].buildHTML());
	enableSaving();
}

function setUpPM(p_uID, p_havingClause, p_tieBreaker, p_timeOut, p_OnTimeOutAction, p_callPriority, p_QueueName, p_Url,
				 p_active_queue_announcements, p_announce_estimated_holdtime, p_announce_frequency, p_startwithannouncements, 
				 p_voicemess_you_are, p_voicemess_holdtime, p_voicemess_minutes, p_voicemess_thanksyouforyourpatience)
{
	//Hide all others...
	hideAllToolsOptions();

	document.getElementById('PMSetupDialog_id').innerText = p_uID;
	
	if(p_havingClause != "" && p_havingClause != "undefined")
		document.popUpForm.PMSetupDialog_mininumString.value = p_havingClause;
	else
		document.popUpForm.PMSetupDialog_mininumString.value = "";
		
	if(p_tieBreaker != "" && p_tieBreaker != "undefined")
		chooseSelectObj("PMSetupDialog_tieBreaker", p_tieBreaker); //PMSetupDialog_tieBreaker.value = p_tieBreaker;
	else
		chooseSelectObj("PMSetupDialog_tieBreaker", "");
		
	if(p_QueueName != "" && p_QueueName != "undefined")
		document.popUpForm.PMSetupDialog_queuename.value = p_QueueName;
	else
		document.popUpForm.PMSetupDialog_queuename.value = "";
		
	if(p_Url != "" && p_Url != "undefined")
		document.popUpForm.PMSetupDialog_url.value = p_Url;
	else
		document.popUpForm.PMSetupDialog_url.value = "";
	
	if(p_active_queue_announcements != "" && p_active_queue_announcements != "undefined")
		document.popUpForm.PMSetupDialog_active_queue_announcements.checked = p_active_queue_announcements == "on";
	else
		document.popUpForm.PMSetupDialog_active_queue_announcements.checked = false;
	
	if(p_announce_estimated_holdtime != "" && p_announce_estimated_holdtime != "undefined")
		document.popUpForm.PMSetupDialog_announce_estimated_holdtime.checked = p_announce_estimated_holdtime == "on";
	else
		document.popUpForm.PMSetupDialog_announce_estimated_holdtime.checked = false;
	
	if(p_announce_frequency != "" && p_announce_frequency != "undefined")
		document.popUpForm.PMSetupDialog_announce_frequency.value = p_announce_frequency;
	else
		document.popUpForm.PMSetupDialog_announce_frequency.value = "";
	
	if(p_startwithannouncements != "" && p_startwithannouncements != "undefined")
		document.popUpForm.PMSetupDialog_startwithannouncements.checked = p_startwithannouncements == "on";
	else
		document.popUpForm.PMSetupDialog_startwithannouncements.checked = false;
	/*
	if(p_voicemess_you_are != "" && p_voicemess_you_are != "undefined")
		document.popUpForm.PMSetupDialog_voicemess_you_are.value = p_voicemess_you_are;
	else
		document.popUpForm.PMSetupDialog_voicemess_you_are.value = "";
	*/
	if(p_voicemess_holdtime != "" && p_voicemess_holdtime != "undefined")
		document.popUpForm.PMSetupDialog_voicemess_holdtime.value = p_voicemess_holdtime;
	else
		document.popUpForm.PMSetupDialog_voicemess_holdtime.value = "";
	
	if(p_voicemess_minutes != "" && p_voicemess_minutes != "undefined")
		document.popUpForm.PMSetupDialog_voicemess_minutes.value = p_voicemess_minutes;
	else
		document.popUpForm.PMSetupDialog_voicemess_minutes.value = "";
	
	if(p_voicemess_thanksyouforyourpatience != "" && p_voicemess_thanksyouforyourpatience != "undefined")
		document.popUpForm.PMSetupDialog_voicemess_thanksyouforyourpatience.value = p_voicemess_thanksyouforyourpatience;
	else
		document.popUpForm.PMSetupDialog_voicemess_thanksyouforyourpatience.value = "";

	if(p_timeOut != "" && p_timeOut != "undefined")
		document.popUpForm.PMSetupDialog_timeout.value = p_timeOut;
	else
		document.popUpForm.PMSetupDialog_timeout.value = "";
	
	if(p_callPriority != "" && p_callPriority != "undefined")
		chooseSelectObj("PMSetupDialog_callPriority", p_callPriority);
	else
		chooseSelectObj("PMSetupDialog_callPriority", "");
		
	if(p_OnTimeOutAction != "" && p_OnTimeOutAction != "undefined")
		chooseSelectObj("PMSetupDialog_actionduringTimeout", p_OnTimeOutAction);
	else
		chooseSelectObj("PMSetupDialog_actionduringTimeout", "");
		
		
	PMSetupDialogObj = document.getElementById('PMSetupDialog');
	PMSetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-PMSetupDialogObj.clientHeight/2;
	PMSetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-PMSetupDialogObj.clientWidth/2;
	PMSetupDialogObj.style.visibility = "visible";
	
	activateAnnoucementOptions();
	activateAvgTimeBoxes();
}


function closethePM(unID)
{
	foundAt = 0;
	hasBeenFound = false;
	
	var tmpVector = new Array();
	for(i = 0; i < vectorAgentPickupMethods.length; i ++)
	{
		
		if(vectorAgentPickupMethods[i].uID == unID)
		{
			foundAt = i;
			hasBeenFound = true;
		}
		else
			tmpVector.push(vectorAgentPickupMethods[i]);
	}
	
	if(hasBeenFound)
	{
		var bNewArray = new Array();
			for(i = 0; i < vectorLinks.length; i++)			
			{
				if((vectorLinks[i].startID != unID || vectorLinks[i].startType != "PM")  && 
					(vectorLinks[i].endID != unID || vectorLinks[i].endType != "PM"))
				{
					bNewArray.push(vectorLinks[i]);					
				}
				else
				{
					reDisplayObj("Connexion_ID"+vectorLinks[i].uID, "");
					resetBoxInformations( vectorLinks[i] );
					enableSaving();
				}
			}			
		vectorLinks = bNewArray;
	}	
	
	vectorAgentPickupMethods = tmpVector;
	
	//Display the whole graph
	scriptHasBeenModified = true;
	//refreshDiagramInside();
	reDisplayObj( "IDPickMethod_"+unID, "");
	enableSaving();
}

function addPickMethod()
{
	
	var newOne = new agentPickUpMethod();
	nbPMCreated++;
	nbScrpElementCreated++;
	newOne.uID = nbPMCreated;	
	newOne.VUID = nbScrpElementCreated;
	vectorAgentPickupMethods.push(newOne);
	scriptHasBeenModified = true;
	//refreshDiagramInside();
	addNewDivisionToDiagram( newOne.buildHTML() );
}


function isValideExpression(expr, uid)
{
	
	var bReturn = true;
	var j; var k;
	var left = '', right = '';
	//Verifier les parentheses...
	var nbParen = 0;
	for(j = 0; j < expr.length; j++)
	{		
		if(expr.charAt(j) == '(')
			nbParen++;
		else if(expr.charAt(j) == ')')
			nbParen--;
		if(nbParen == -1)
		{
			if( expr.length-j > 20 )
				subExpr = expr.substring(j, j+20);
			else
				subExpr = expr.substring(j);				
			alert('Error: Unexpected token in Agent Pickup Method #'+uid+' Having Clause.\n Near: "'+subExpr+'"\n Char:'+j);
			bReturn = false;
			break;
		} 
	}
	
	if(!bReturn && nbParen != 0)
	{
		alert('Error: Too much open brackets in Agent Pickup Method #'+uid);
		bReturn = false;
	}
	
	return bReturn;
}


function replaceUrlSpecChars(theUrl)
{
	var sTring = "";
	
	if(theUrl == null || theUrl == 'undefined')
		return "";
	
	//This will replace all the & in the url for !	
	var re = /\&/gi;
	sTring = theUrl.replace(re ,"*");
	re = /\//gi;
	sTring = sTring.replace(re, "!");
	
	return sTring;
}

function putUrlSpecChars(sTring)
{
	var theUrl = "";
	
	if(sTring == null || sTring == 'undefined')
		return "";	
	//This will replace all the ! in the url for &	
	var re = /\*/gi;	
	theUrl = sTring.replace(re, "&");	
	re = /\!/gi;	
	theUrl = theUrl.replace(re, "/");	
	return theUrl;
}



function changeAgentPickupUrlButton()
{
	if(document.popUpForm.AgentPickupUrlButton.value == 'Url:')
		{		
		document.popUpForm.AgentPickupUrlButton.value = 'Data:';
		if(document.popUpForm.PMSetupDialog_url.value.indexOf('http://') != -1) //Si cela commence par http
			{
				document.popUpForm.PMSetupDialog_url.value = 'data:' + document.popUpForm.PMSetupDialog_url.value.substring( 'http://'.length );				
			}
		else if(document.popUpForm.PMSetupDialog_url.value.indexOf('data:') != 0) //Si cela ne commence pas deja par data:
			{
				document.popUpForm.PMSetupDialog_url.value = 'data:' + document.popUpForm.PMSetupDialog_url.value;				
			}
			
		}
	else
		{
		document.popUpForm.AgentPickupUrlButton.value = 'Url:';
		if(document.popUpForm.PMSetupDialog_url.value.indexOf('data:') != -1) //Si cela commence par data
			{
				document.popUpForm.PMSetupDialog_url.value = 'http://' + document.popUpForm.PMSetupDialog_url.value.substring( 'data:'.length );				
			}
		else if(document.popUpForm.PMSetupDialog_url.value.indexOf('http://') != 0) //Si cela ne commence pas deja par data:
			{
				document.popUpForm.PMSetupDialog_url.value = 'http://' + document.popUpForm.PMSetupDialog_url.value;				
			}
		}
	
}

function activateAnnoucementOptions()
{
	if(document.popUpForm.PMSetupDialog_active_queue_announcements.checked)
	{
		document.popUpForm.PMSetupDialog_startwithannouncements.disabled = false;
		document.popUpForm.PMSetupDialog_announce_frequency.disabled = false;
		document.popUpForm.PMSetupDialog_announce_estimated_holdtime.disabled = false;
		document.popUpForm.PMSetupDialog_voicemess_thanksyouforyourpatience.disabled = false;
		document.popUpForm.PMSetupDialog_voicemess_holdtime.disabled = false;
		document.popUpForm.PMSetupDialog_voicemess_minutes.disabled = false;
	}
	else
	{
		document.popUpForm.PMSetupDialog_startwithannouncements.disabled = true;
		document.popUpForm.PMSetupDialog_announce_frequency.disabled = true;
		document.popUpForm.PMSetupDialog_announce_estimated_holdtime.disabled = true;
		document.popUpForm.PMSetupDialog_voicemess_thanksyouforyourpatience.disabled = true;
		document.popUpForm.PMSetupDialog_voicemess_holdtime.disabled = true;
		document.popUpForm.PMSetupDialog_voicemess_minutes.disabled = true;
	}
}

function activateAvgTimeBoxes()
{
	if(document.popUpForm.PMSetupDialog_announce_estimated_holdtime.checked && !document.popUpForm.PMSetupDialog_announce_estimated_holdtime.disabled)
	{
		document.popUpForm.PMSetupDialog_voicemess_holdtime.disabled = false;
		document.popUpForm.PMSetupDialog_voicemess_minutes.disabled = false;
	}
	else
	{
		document.popUpForm.PMSetupDialog_voicemess_holdtime.disabled = true;
		document.popUpForm.PMSetupDialog_voicemess_minutes.disabled = true;
	}
}
