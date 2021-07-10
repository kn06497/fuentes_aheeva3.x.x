// JavaScript Document
function CounterBox()
	{
		this.uID = 0;
		this.variable_name = "";
		this.attachedto = "";
		this.stats = 0;
		this.isInTrackMode = false;
		this.lastStatsBeforeReset = 0;
		this.next = "";
		this.xPos 				= "0px";
		this.yPos 				= "0px";
		this.VUID = 0;
		this.nextVUID = 0;
		this.ownBoxType = "CO";
		
		this.buildHTML = function()
		{
			var sReturn = "";
			
			if(this.variable_name != "" && this.variable_name != null)
				buttonValue = "Counter ["+this.variable_name+"]";
			else
				buttonValue = "Setup";
			
			sReturn += "";
			
			sReturn += '<div id="IDCounterBox_'+this.uID+'"';
			sReturn += ' uID="'+this.uID+'"';
			sReturn += ' variable_name="'+this.variable_name+'"';
			sReturn += ' next="'+this.next+'"';
			sReturn += ' class="defaultCounterBox" style="top:'+this.yPos+'; left:'+this.xPos+'"';
			sReturn += '>';
			sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
			sReturn += '<tr bgcolor="#E1E8E3"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDCounterBox_'+this.uID+'\')"><b>'+MultiArray["Counter"][lang]+' #'+this.uID;
			if(DEBUG)
				sReturn += ' ID['+this.VUID+']';
			sReturn += '</b></td>';
			sReturn += '<td align="right"><a href="javascript:closetheCO('+this.uID+')">';
			sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
			sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'CO\', \''+this.VUID+'\')"><i>'+MultiArray["Entry point"][lang]+'</i></td></tr>';
			sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpCO(\''+this.uID+'\', \''+this.variable_name+'\', \''+this.isInTrackMode+'\', \''+this.attachedto+'\')" ';
			sReturn += 'value="'+buttonValue+'" class="setupButton2"></td></tr>';
			
			if(this.isInTrackMode == 1 || this.isInTrackMode == true || this.isInTrackMode == 'true')
			{				
				sReturn += '<tr><td colspan="2" class="CounterTrack" id="CounterTrack_'+this.uID+'">'+(this.stats-this.lastStatsBeforeReset)+'</td></tr>';
			}
			sReturn += '<tr><td colspan="2" nowrap class="entryTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'OnNext\', \'CO\', \''+this.VUID+'\')"><i>'+MultiArray["Output"][lang]+'';
			if(DEBUG)
				sReturn += ' -->['+this.nextVUID+']';
			sReturn += '</i></td></tr>';
			sReturn += '</table>';
			sReturn += '</div>';
			
			return sReturn;
		}
		
		this.getObj = function()
		{
			return this;
		}
		
		this.validate = function()
		{
			var bReturn = true;
			if(this.variable_name == "")
			{
				alert(MultiArray["Error: Missing counter name for counter #"][lang]+this.uID);
				
				retrieveTmpMessage();
				bReturn = false;
				setUpCO(this.uID, this.variable_name, this.isInTrackMode, this.attachedto);
			}		
			return bReturn;
		}
		
		this.softvalidate = function()
		{
			var rArray = new Array();
			var tmpmess;
			var tmptext = "";
			var tmponclick = 'setUpCO(\''+this.uID+'\', \''+this.variable_name+'\', \''+this.isInTrackMode+'\', \''+this.attachedto+'\')';	
			
			if(this.variable_name == "")
			{
				tmpmess = new softValidationMess();			
				tmptext = 'Error: Missing counter name for Counter #'+this.uID;
				tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
				rArray.push(tmpmess);
			}		
			return rArray;
		}
		
		this.buildString = function()
		{
			var buildString = "";			
			buildString += 'TYPE=COUNTERBOX';
			buildString += '&';
			buildString += 'uID='+this.uID;
			buildString += '&';
			buildString += 'variable_name='+this.variable_name;
			buildString += '&';
			buildString += 'attachedto='+this.attachedto;
			buildString += '&';	
			buildString += 'next='+this.next;
			buildString += '&';	
			buildString += 'VUID='+this.VUID;
			buildString += '&';
			buildString += 'nextVUID='+this.nextVUID;
			buildString += '&';
			buildString += 'xPos='+this.xPos;
			buildString += '&';
			buildString += 'yPos='+this.yPos;
			buildString += '^';
			return buildString;
		}
	}

function closeSetUpCO()
{
	document.getElementById('COSetupDialog').style.visibility = "hidden";
}

function submitSetUpCO()
{
	var i, j;
	for(i = 0; i < vectorCounterBox.length; i++)
	{		
		if(vectorCounterBox[i].uID == document.getElementById('COSetupDialog_TD1').innerText)
		{			
			vectorCounterBox[i].variable_name = document.popUpForm.n_counter_data_name.value;
			for(j=0; j < document.popUpForm.n_conunter_attached_to.length; j++)
			{
				if(document.popUpForm.n_conunter_attached_to[j].checked)
				{
					vectorCounterBox[i].attachedto = document.popUpForm.n_conunter_attached_to[j].value;
					break;
				}
			}
			//document.popUpForm.n_conunter_attached_to
			//alert('value='+document.popUpForm.n_conunter_attached_to.selectted);
			//vectorCounterBox[i].attachedto = document.popUpForm.n_conunter_attached_to.value;
			vectorCounterBox[i].isInTrackMode = document.popUpForm.n_counter_track.checked;
			
			break;
		}
	}
	document.getElementById('COSetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();
	//add this to the call properties
	if(vectorCounterBox[i].attachedto == 'CALL')
	{
		addAddExtraData(vectorCounterBox[i].variable_name);		
	}
	reDisplayObj("IDCounterBox_"+vectorCounterBox[i].uID, vectorCounterBox[i].buildHTML());
	enableSaving();	
}

function setUpCO(p_uID, p_var_name, p_intracMode, p_attachedTo)
{
	hideAllToolsOptions();
	
	document.getElementById('COSetupDialog_TD1').innerText = p_uID;
	
	
	if(p_var_name != "" && p_var_name != "undefined")
		document.popUpForm.n_counter_data_name.value = p_var_name;
	else
		document.popUpForm.n_counter_data_name.value = "";
	
	if(p_intracMode != "" && p_intracMode != "undefined")		
		document.popUpForm.n_counter_track.checked = (p_intracMode==1 || p_intracMode=='1' || p_intracMode=='true');	
	else
		document.popUpForm.n_counter_track.checked = false;
		
	document.popUpForm.n_counter_track.disabled == (p_attachedTo == "CALL");
	   
	var j;
	for(j = 0; j < document.popUpForm.n_conunter_attached_to.length; j++)
	{
		document.popUpForm.n_conunter_attached_to[j].checked = (p_attachedTo == document.popUpForm.n_conunter_attached_to[j].value);
	}
	
	
	var COSetupDialogObj = document.getElementById('COSetupDialog');
	COSetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-COSetupDialogObj.clientHeight/2;
	COSetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-COSetupDialogObj.clientWidth/2;
	COSetupDialogObj.style.visibility = "visible";	
}

function closetheCO(unID)
{
	//Retrieve the unID wanted
	foundAt = 0;
	hasBeenfound = false;
	for(i = 0; i < vectorCounterBox.length; i++)
	{
		if(vectorCounterBox[i].uID == unID) //des qu on le trouve...
		{
			foundAt = i;
			hasBeenfound = true;
		}
		if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
		{
			if(i == vectorCounterBox.length-1)
				vectorCounterBox.pop();
			else
				vectorCounterBox[i] = vectorCounterBox[i+1];
		}
	}	
	
	//LINKS
	if(hasBeenfound)
	{
		var bNewArray = new Array();
		for(i = 0; i < vectorLinks.length; i++)			
		{
			if( (vectorLinks[i].startID != unID || vectorLinks[i].startType != "CO")  && 
				(vectorLinks[i].endID != unID || vectorLinks[i].endType != "CO")  )
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
	reDisplayObj( "IDCounterBox_"+unID, "");
	enableSaving();
		
}
	
	
function addCounterBox()
{	
	var newOne = new CounterBox();
	nbCounterBox++;
	nbScrpElementCreated++;	
	newOne.uID = nbCounterBox;	
	newOne.VUID = nbScrpElementCreated;
	
	vectorCounterBox.push(newOne);	
	
	scriptHasBeenModified = true;
	//refreshDiagramInside();	
	addNewDivisionToDiagram( newOne.buildHTML() );
}


function ResetThisCounterStats()
{
	var cntUid = document.getElementById('COSetupDialog_TD1').innerText;
	//find the right element
	var i; 
	for( i = 0; i < vectorCounterBox.length; i++ )
	{
		if(vectorCounterBox[i].uID == cntUid)
		{
			vectorCounterBox[i].lastStatsBeforeReset = vectorCounterBox[i].stats;
			break;
		}
	}
}


function disableTacker(yesno)
{
	var obj = document.popUpForm.n_counter_track;
	if(yesno) //Disable it
	{
		obj.checked = false;
		obj.disabled = true;
	}
	else
		obj.disabled = false;
}