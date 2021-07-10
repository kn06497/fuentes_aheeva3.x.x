// JavaScript Document
/*****************************************
 Class CallEnding()
*****************************************/
function CallEnding()
{
	this.uID = 0;
	this.xPos 				= "0px";
	this.yPos 				= "0px";
	this.action = "";
	this.params = "";
	this.VUID = 0;
	
	
	this.ownBoxType = "CE";
	
	this.buildHTML = function()
	{			
		if(this.action != "" && this.action != null)
			buttonValue = this.action+'('+this.params+')';
		else
			buttonValue = 'Setup';
			
		sReturn = "";			
		sReturn += '<div id="IDCallEnding_'+this.uID+'"';
		sReturn += ' uID = "'+this.uID+'"';
		sReturn += ' xPos = "'+this.testedPropertyID+'"';
		sReturn += ' yPos = "'+this.LinkType+'"';
		sReturn += ' action = "'+this.action+'";'
		sReturn += ' params = "'+this.params+'"';
		sReturn += ' class="defaultCallEnding" style="top:'+this.yPos+'; left:'+this.xPos+'"';
		sReturn += ' ';
		sReturn += ' >';
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
		sReturn += '<tr bgcolor="#F5CDA0"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDCallEnding_'+this.uID+'\')"><b>End #'+this.uID;
		if(DEBUG)
			sReturn += ' ID['+this.VUID+']';
		sReturn += '</b></td>';
		sReturn += '<td align="right"><a href="javascript:closetheCE('+this.uID+')">';
		sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
		sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'CE\', \''+this.VUID+'\')"><i>Entry Point</i></td></tr>';
		sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpCE(\''+this.uID+'\', \''+this.action+'\', \''+this.params+'\')" ';
		sReturn += 'value="'+buttonValue+'" class="setupButton"></td></tr>';
		sReturn += '';
		sReturn += '</table>';
		sReturn += '</div>';
		sReturn += '';
		return sReturn;
	}
	
	this.getObj = function ()
	{
		return this;
	}
	
	
	this.validate = function()
	{
		var bReturn = true;
		
		if(this.action == "")
		{
			alert('Error: Missing variable name for Call Ending #'+this.uID);
			retrieveTmpMessage();
			bReturn = false;
			setUpCE(this.uID, this.action, this.params);
		}			
		return bReturn;
	}
	
	
	this.softvalidate = function()
	{
		var rArray = new Array();
		var tmpmess;
		var tmptext = "";
		var tmponclick = 'setUpCE(\''+this.uID+'\', \''+this.action+'\', \''+this.params+'\')';	
		
		if(this.action == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Missing variable name for Call Ending #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}		
		return rArray;
	}
	
}
	
	
/******************
OTHERS FUNCTIONS
******************/
function CEDialogChange()
{
	
	switch(document.popUpForm.n_call_ending_action.value)
	{
		case "Hangup":
		case "SoftHangup":
			document.popUpForm.n_call_ending_param.value = '';			
			document.popUpForm.n_call_ending_param.disabled = true;
		break;
		
		case "Transfer":
		case "VoiceMail":
			document.popUpForm.n_call_ending_param.disabled = false;
		break;		
	}
	
}

function closeSetUpCE()
{
	document.getElementById('CESetupDialog').style.visibility = "hidden";	
}

function submitSetUpCE()
{
	for(i = 0; i < vectorCallEnding.length; i++)
	{		
		if(vectorCallEnding[i].uID == document.getElementById('CESetupDialog_TD1').innerText)
		{			
			vectorCallEnding[i].action = document.popUpForm.n_call_ending_action.value;			
			vectorCallEnding[i].params = document.popUpForm.n_call_ending_param.value;
						
			break;
		}
	}
	document.getElementById('CESetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();	
	reDisplayObj("IDCallEnding_"+vectorCallEnding[i].uID, vectorCallEnding[i].buildHTML());
	enableSaving();
}

function setUpCE(p_uID, p_Action, p_Params)
{
	//Hide all others...
	hideAllToolsOptions();
	
	
	document.getElementById('CESetupDialog_TD1').innerText = p_uID;
	
	if(p_Action != "" && p_Action != "undefined")	
		chooseSelectObj("n_call_ending_action", p_Action); 	
	else
		chooseSelectObj("n_call_ending_action", "");
	
	if(p_Params != "" && p_Params != "undefined")
		document.popUpForm.n_call_ending_param.value = p_Params;
	else
		document.popUpForm.n_call_ending_param.value = "";
	
	CESetupDialogObj = document.getElementById('CESetupDialog');
	CESetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-CESetupDialogObj.clientHeight/2;
	CESetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-CESetupDialogObj.clientWidth/2;
	CESetupDialogObj.style.visibility = "visible";
}

//This function close the Call Condition text box
function closetheCE(unID)
	{
		//Retrieve the unID wanted
		foundAt = 0;
		hasBeenfound = false;
		for(i = 0; i < vectorCallEnding.length; i++)
		{
			if(vectorCallEnding[i].uID == unID) //des qu on le trouve...
			{
				foundAt = i;
				hasBeenfound = true;
			}
			if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
			{
				if(i == vectorCallEnding.length-1)
					vectorCallEnding.pop();
				else
					vectorCallEnding[i] = vectorCallEnding[i+1];
			}
		}	
		
		//LINKS
		if(hasBeenfound)
		{
			var bNewArray = new Array();
			for(i = 0; i < vectorLinks.length; i++)			
			{
				if( (vectorLinks[i].startID != unID || vectorLinks[i].startType != "CE")  && 
					(vectorLinks[i].endID != unID || vectorLinks[i].endType != "CE")  )
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
		
		scriptHasBeenModified = true;
		//Display the whole graph
		//refreshDiagramInside();				
		reDisplayObj( "IDCallEnding_"+unID, "");
		enableSaving();
	}

function addCallEnding()
{
	var newOne = new CallEnding();
	nbCECreated++;
	nbScrpElementCreated++;
	newOne.uID = nbCECreated;	
	newOne.VUID = nbScrpElementCreated;	
	vectorCallEnding.push(newOne);	
	scriptHasBeenModified = true;
	//refreshDiagramInside();
	addNewDivisionToDiagram( newOne.buildHTML() );
}