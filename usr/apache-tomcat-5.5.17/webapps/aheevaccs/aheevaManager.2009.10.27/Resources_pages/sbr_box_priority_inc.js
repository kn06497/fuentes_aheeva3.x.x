// JavaScript Document
function PriorityInc()
	{
		this.uID = 0;
		this.Increment = "";
		this.next = "";
		this.xPos 				= "0px";
		this.yPos 				= "0px";
		this.VUID = 0;
		this.nextVUID = 0;
		
		this.buildHTML = function()
		{
			var sReturn = "";
			
			if(this.Increment != "" && this.Increment != null)
				buttonValue = '+'+this.Increment;
			else
				buttonValue = 'Setup';
			
			sReturn += "";
			
			sReturn += '<div id="IDPriority_'+this.uID+'"';
			sReturn += ' uID="'+this.uID+'"';
			sReturn += ' Increment="'+this.Increment+'"';
			sReturn += ' next="'+this.next+'"';
			sReturn += ' class="defaultCallProirity" style="top:'+this.yPos+'; left:'+this.xPos+'"';
			sReturn += '>';
			sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
			sReturn += '<tr bgcolor="#DCEBC7"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDPriority_'+this.uID+'\')"><b>'+MultiArray["Priority"][lang]+' #'+this.uID;
			if(DEBUG)
				sReturn += ' ID['+this.VUID+']';
			sReturn += '</b></td>';
			sReturn += '<td align="right"><a href="javascript:closethePI('+this.uID+')">';
			sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
			sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'PI\', \''+this.VUID+'\')"><i>'+MultiArray["Entry point"][lang]+'</i></td></tr>';
			sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpPI(\''+this.uID+'\', \''+this.Increment+'\')" ';
			sReturn += 'value="'+buttonValue+'" class="setupButton2"></td></tr>';
			sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'OnNext\', \'PI\', \''+this.VUID+'\')"><i>'+MultiArray["Output"][lang]+'</i></td></tr>';
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
			if(this.Increment == "")
			{
				alert(MultiArray["Error: Missing increment for call increment #"][lang]+this.uID);
		
				retrieveTmpMessage();
				bReturn = false;
				setUpPI(this.uID, this.Increment);
			}		
			return bReturn;
		}
		
		
		this.softvalidate = function()
		{
			var rArray = new Array();
			var tmpmess;
			var tmptext = "";
			var tmponclick = 'setUpPI(\''+this.uID+'\', \''+this.Increment+'\')';	
			
			if(this.Increment == "")
			{
				tmpmess = new softValidationMess();			
				tmptext = 'Missing increment for Call Increment #'+this.uID;
				tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
				rArray.push(tmpmess);
			}		
			return rArray;
		}
	}

function closeSetUpPI()
{
	document.getElementById('PISetupDialog').style.visibility = "hidden";
}

function submitSetUpPI()
{
	for(i = 0; i < vectorPriorityIncrement.length; i++)
	{		
		if(vectorPriorityIncrement[i].uID == document.getElementById('PISetupDialog_id').innerText)
		{			
			vectorPriorityIncrement[i].Increment = document.popUpForm.PISetupDialog_callIncrement.value;							
			break;
		}
	}
	document.getElementById('PISetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();	
	reDisplayObj("IDPriority_"+vectorPriorityIncrement[i].uID, vectorPriorityIncrement[i].buildHTML());
	enableSaving();
}

function setUpPI(p_uID, p_inc)
{
	hideAllToolsOptions();
	
	document.getElementById('PISetupDialog_id').innerText = p_uID;
	if(p_inc != "" && p_inc != "undefined")
		chooseSelectObj("PISetupDialog_callIncrement", p_inc);
	else
		chooseSelectObj("PISetupDialog_callIncrement", "");
	
	PISetupDialogObj = document.getElementById('PISetupDialog');
	PISetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-PISetupDialogObj.clientHeight/2;
	PISetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-PISetupDialogObj.clientWidth/2;
	PISetupDialogObj.style.visibility = "visible";	
}

function closethePI(unID)
{
	//Retrieve the unID wanted
	foundAt = 0;
	hasBeenfound = false;
	for(i = 0; i < vectorPriorityIncrement.length; i++)
	{
		if(vectorPriorityIncrement[i].uID == unID) //des qu on le trouve...
		{
			foundAt = i;
			hasBeenfound = true;
		}
		if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
		{
			if(i == vectorPriorityIncrement.length-1)
				vectorPriorityIncrement.pop();
			else
				vectorPriorityIncrement[i] = vectorPriorityIncrement[i+1];
		}
	}	
	
	//LINKS
	if(hasBeenfound)
	{
		var bNewArray = new Array();
		for(i = 0; i < vectorLinks.length; i++)			
		{
			if( (vectorLinks[i].startID != unID || vectorLinks[i].startType != "PI")  && 
				(vectorLinks[i].endID != unID || vectorLinks[i].endType != "PI")  )
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
	reDisplayObj( "IDPriority_"+unID, "");
		
}
	
	
function addPriorityInc()
{
	
	var newOne = new PriorityInc();
	nbPriorityInc++;
	nbScrpElementCreated++;	
	newOne.uID = nbPriorityInc;	
	newOne.VUID = nbScrpElementCreated;
	
	vectorPriorityIncrement.push(newOne);	
	
	scriptHasBeenModified = true;
	//refreshDiagramInside();	
	addNewDivisionToDiagram( newOne.buildHTML() );
}