// JavaScript Document

/*
Class: SBR_GETDIGIT

*/

function GetDtmf()
{
	var uID = "";
	var xPos = "0px";
	var yPos = "0px";	
	var ownBoxType 	= "DT";
	var VUID 			= 0;
	var variable_name 	= "";
	var maxlength		= "";
	var defaultvalue 	= "";
	var timeout 		= "";
	var voicemessage 	= "";
	var enders		 	= "";
	var next			= "";
	var nextVUID		= 0;
	
	this.uID = "";
	this.xPos = "0px";
	this.yPos = "0px";	
	this.ownBoxType 	= "DT";
	this.VUID 			= 0;
	this.variable_name 	= "";
	this.maxlength		= "";
	this.defaultvalue 	= "";
	this.timeout 		= "";
	this.voicemessage 	= "";
	this.enders			= "";
	this.next			= "";
	this.nextVUID		= 0;
	
	
	this.buildHTML = function()
	{
		var sReturn = "";
		var buttonValue = "";
		if(this.variable_name != "" && this.variable_name != null)
			buttonValue = "Get ["+this.variable_name+"]";
		else
			buttonValue = 'Setup';
			
		sReturn += "";
			
		sReturn += '<div id="IDGetDtfm_'+this.uID+'"';
		sReturn += ' uID="'+this.uID+'"';
		sReturn += ' varname="'+this.variable_name+'"';		
		sReturn += ' class="defaultGetDtmf" style="top:'+this.yPos+'; left:'+this.xPos+'"';
		sReturn += '>';
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
		sReturn += '<tr bgcolor="#CCCCCC"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDGetDtfm_'+this.uID+'\')"><b>'+dtmf[0]+' Dtmf #'+this.uID;
		if(DEBUG)
			sReturn += ' ID['+this.VUID+']';
		sReturn += '</b></td>';
		sReturn += '<td align="right"><a href="javascript:closetheDT('+this.uID+')">';
		sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
		sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'DT\', \''+this.VUID+'\')"><i>'+dtmf[1]+'</i></td></tr>';
		sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpDT(\''+this.uID+'\', \''+this.variable_name+'\', \''+this.maxlength+'\', \''+this.defaultvalue+'\', \''+this.timeout+'\', \''+this.voicemessage+'\', \''+this.enders+'\')" ';
		sReturn += 'value="'+buttonValue+'" class="setupButton2"></td></tr>';
		sReturn += '<tr><td colspan="2" nowrap class="entryTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'OnNext\', \'DT\', \''+this.VUID+'\')"><i>'+dtmf[2]+'';
		if(DEBUG)
			sReturn += ' --> ['+this.nextVUID+']';		
		sReturn += '</i></td></tr>';
		sReturn += '</table>';
		sReturn += '</div>';
		
		return sReturn;
	}
	
	
	
	this.setPos = function(x, y)
	{
		this.xPos = x;
		this.yPos = y;
	}
	
	
	
	this.getObj = function ()
	{
		return this;
	}
	
	this.setLink = function(LNK_TYPE)
	{
		this.LinkType = LNK_TYPE;
	}
	
	
	this.validate = function()
	{
		var bReturn = true;
		
		if(this.variable_name == "")
		{
			alert(dtmf[3]+this.uID);
			
			retrieveTmpMessage();
			bReturn = false;
			setUpDT(this.uID, this.variable_name, this.maxlength, this.defaultvalue, this.timeout, this.voicemessage, this.enders);
		}
		else if(this.timeout == "")
		{
			alert(dtmf[4]+this.uID);
			
			retrieveTmpMessage();
			bReturn = false;
			setUpDT(this.uID, this.variable_name, this.maxlength, this.defaultvalue, this.timeout, this.voicemessage, this.enders);
		}
		return bReturn;
	}
	
	this.softvalidate = function()
	{
		var rArray = new Array();
		var tmpmess;
		var tmptext = "";
		var tmponclick = 'setUpDT(\''+this.uID+'\', \''+this.variable_name+'\', \''+this.maxlength+'\', \''+this.defaultvalue+'\', \''+this.timeout+'\', \''+this.voicemessage+'\', \''+this.enders+'\')';	
		
		if(this.variable_name == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Missing variable name for GetDtmf #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}
		if(this.timeout == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Missing timeout value for GetDtmf #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}
		if(this.voicemessage == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'NoVoice Message for GetDtmf #'+this.uID;
			tmpmess.setMessage('WARNING', tmptext, SOFT_VALIDATION_WARNING_IMG, tmponclick);
			rArray.push(tmpmess);
		}
		return rArray;
	}
	
	
	
}


function addGetDigit()
{
	var newOne = new GetDtmf();
	nbDTCreated++;
	nbScrpElementCreated++;
	newOne.uID = nbDTCreated;	
	newOne.VUID = nbScrpElementCreated;		
	vectorGetDtmf.push(newOne);	
	scriptHasBeenModified = true;
	//refreshDiagramInside();	
	addNewDivisionToDiagram( newOne.buildHTML() );
}


function closeSetUpDT()
{
	document.getElementById('DTSetupDialog').style.visibility = "hidden";	
}


function submitSetUpDT()
{
	for(i = 0; i < vectorGetDtmf.length; i++)
	{		
		if(vectorGetDtmf[i].uID == document.getElementById('DTSetupDialog_TD1').innerText)
		{							
			vectorGetDtmf[i].variable_name 	= document.popUpForm.n_dtmf_data_name.value;
			vectorGetDtmf[i].maxlength		= document.popUpForm.n_dtmf_max_length.value;
			vectorGetDtmf[i].defaultvalue 	= document.popUpForm.n_dtmf_default_value.value;
			vectorGetDtmf[i].timeout 		= document.popUpForm.n_dtmf_timeout.value;
			vectorGetDtmf[i].voicemessage 	= document.popUpForm.n_dtmf_voice_mess.value;
			vectorGetDtmf[i].enders 		= document.popUpForm.n_dtmf_enders.value;
			
			//add the call prop in the select list if not exist yet
			//Si la valeur n'est pas dans les combos,  l'ajouter			
			if( !option_already_existInCallProps(vectorGetDtmf[i].variable_name) )
			{
				addAddExtraData(vectorGetDtmf[i].variable_name);
			}
			break;
		}
	}
	document.getElementById('DTSetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();	
	reDisplayObj("IDGetDtfm_"+vectorGetDtmf[i].uID, vectorGetDtmf[i].buildHTML());
	enableSaving();
}


function setUpDT(p_uID, p_VariableName, p_MaxLenght, p_defaultValue, p_timeout, p_voicemess, p_enders)
{
	//Hide all others...
	hideAllToolsOptions();
	

	document.getElementById('DTSetupDialog_TD1').innerText = p_uID;
			
	if(p_VariableName != "" && p_VariableName != "undefined")
		document.popUpForm.n_dtmf_data_name.value = p_VariableName;
	else
		document.popUpForm.n_dtmf_data_name.value = "";
		
	if(p_MaxLenght != "" && p_MaxLenght != "undefined")
		document.popUpForm.n_dtmf_max_length.value = p_MaxLenght;
	else
		document.popUpForm.n_dtmf_max_length.value = "";
		
	if(p_defaultValue != "" && p_defaultValue != "undefined")
		document.popUpForm.n_dtmf_default_value.value = p_defaultValue;
	else
		document.popUpForm.n_dtmf_default_value.value = "";
		
	if(p_timeout != "" && p_timeout != "undefined")
		document.popUpForm.n_dtmf_timeout.value = p_timeout;
	else
		document.popUpForm.n_dtmf_timeout.value = "";
		
	if(p_voicemess != "" && p_voicemess != "undefined")
		document.popUpForm.n_dtmf_voice_mess.value = p_voicemess;
	else
		document.popUpForm.n_dtmf_voice_mess.value = "";
		
	if(p_enders != "" && p_enders != "undefined")
		document.popUpForm.n_dtmf_enders.value = p_enders;
	else
		document.popUpForm.n_dtmf_enders.value = "";
		
	DTSetupDialogObj = document.getElementById('DTSetupDialog');
	DTSetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-DTSetupDialogObj.clientHeight/2;
	DTSetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-DTSetupDialogObj.clientWidth/2;
	DTSetupDialogObj.style.visibility = "visible";	
}



function closetheDT(unID)
{
	var i;
	//Retrieve the unID wanted
	foundAt = 0;
	hasBeenfound = false;
	for(i = 0; i < vectorGetDtmf.length; i++)
	{
		if(vectorGetDtmf[i].uID == unID) //des qu on le trouve...
		{
			foundAt = i;
			hasBeenfound = true;
		}
		if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
		{
			if(i == vectorGetDtmf.length-1)
				vectorGetDtmf.pop();
			else
				vectorGetDtmf[i] = vectorGetDtmf[i+1];
		}
	}	
	
	//LINKS
	if(hasBeenfound)
	{
		var bNewArray = new Array();
		for(i = 0; i < vectorLinks.length; i++)			
		{
			if( (vectorLinks[i].startID != unID || vectorLinks[i].startType != "DT")  && 
				(vectorLinks[i].endID != unID || vectorLinks[i].endType != "DT")  )
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
	reDisplayObj( "IDGetDtfm_"+unID, "");
	enableSaving();
}
