// JavaScript Document

function PbxExec()
{
	this.uID = 0;
	this.xPos 				= "0px";
	this.yPos 				= "0px";
	this.vectorApps 		= new Array();
	this.vectorParams 		= new Array();
	this.VUID 				= 0;
	this.ownBoxType 		= "PE";
	this.next 				= "";
	this.nextVUID 			= 0;
	
	this.buildHTML = function()
		{			
			var sReturn = "";
			var buttonValue = "";
			
			
			if(this.vectorApps.length != 0)
				{
					toomuch = false;
					if(this.vectorApps.length >= 4) 
						toomuch = true;
					var i;
					for(i = 0; i < this.vectorApps.length; i++)
					{
						
						if(i == 2 && toomuch)
						{
							buttonValue += '...\n';
							buttonValue += this.vectorApps[this.vectorApps.length-1];
							if(this.vectorParams[this.vectorParams.length-1] != "")
								buttonValue += '('+this.vectorParams[this.vectorParams.length-1]+')';
							break;
						}
						buttonValue += this.vectorApps[i];
						if(this.vectorParams[i] != "")
								buttonValue += '('+this.vectorParams[i]+')';
								
						if(i != this.vectorApps.length-1)
							buttonValue += '\n';
					}
				}
			else
				buttonValue = 'Setup';
			
			sReturn += "";
			
			sReturn += '<div id="IDPbxExec_'+this.uID+'"';
			sReturn += ' class="defaultPbxExec" style="top:'+this.yPos+'; left:'+this.xPos+'"';
			sReturn += '>';
			sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
			sReturn += '<tr bgcolor="#C8D6D7"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDPbxExec_'+this.uID+'\')"><b>Execution #'+this.uID;
			if(DEBUG)
				sReturn += ' ID['+this.VUID+']';
			sReturn += '</b></td>';
			sReturn += '<td align="right"><a href="javascript:closethePE('+this.uID+')">';
			sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
			sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'PE\', \''+this.VUID+'\')"><i>Entry Point</i></td></tr>';
			sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpPE(\''+this.uID+'\')" ';
			sReturn += 'value="'+buttonValue+'" class="setupButton3"></td></tr>';
			sReturn += '<tr><td colspan="2" nowrap class="entryTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'OnNext\', \'PE\', \''+this.VUID+'\')"><i>Output';
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
			if(this.vectorApps.length == 0)
			{
				alert('Error: Missing applications for Execution #'+this.uID);
				retrieveTmpMessage();
				bReturn = false;
				setUpPE(this.uID);
			}				
			return bReturn;
		}
		
		
		this.softvalidate = function()
		{
			var rArray = new Array();
			var tmpmess;
			var tmptext = "";
			var tmponclick = 'setUpPE(\''+this.uID+'\')';	
			
			if(this.vectorApps.length == 0)
			{
				tmpmess = new softValidationMess();			
				tmptext = 'Missing applications for Execution #'+this.uID;
				tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
				rArray.push(tmpmess);
			}		
			return rArray;
		}
}


function closeSetUpPE()
{
	document.getElementById('PESetupDialog').style.visibility = "hidden";
}

function submitSetUpPE()
{
	var i; 
	var j;
	for(i = 0; i < vectorPbxExec.length; i++)
	{		
		if(vectorPbxExec[i].uID == document.getElementById('PESetupDialog_id').innerText)
		{			
			//Clear the arrays
			vectorPbxExec[i].vectorApps 	= new Array();
			vectorPbxExec[i].vectorParams 	= new Array();
			for(j = 0; j < document.popUpForm.PESetupDialog_SelectsAppsList.length; j++)
			{
				vectorPbxExec[i].vectorApps[j] = document.popUpForm.PESetupDialog_SelectsAppsList[j].value;
				var first_open_bracket = document.popUpForm.PESetupDialog_SelectsAppsList[j].text.indexOf('(');
				if(first_open_bracket != -1) //We have parameters here...
					vectorPbxExec[i].vectorParams[j] = document.popUpForm.PESetupDialog_SelectsAppsList[j].text.substring(first_open_bracket+1, document.popUpForm.PESetupDialog_SelectsAppsList[j].text.length-1);
				else
					vectorPbxExec[i].vectorParams[j] = "";
			}
			break;
		}
	}
	
	document.getElementById('PESetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();	
	
	reDisplayObj("IDPbxExec_"+vectorPbxExec[i].uID, vectorPbxExec[i].buildHTML());
	enableSaving();
}

function setUpPE(p_uID)
{	
	var i;
	hideAllToolsOptions();
	
	
	document.getElementById('PESetupDialog_id').innerText = p_uID;
	
	
	//Get the rigth Object
	for(i = 0; i < vectorPbxExec.length; i++ )	
	{		
		if(vectorPbxExec[i].uID == p_uID )
		{			
			p_vecApps 	= vectorPbxExec[i].vectorApps;
			p_vecParams	= vectorPbxExec[i].vectorParams;			
			break;
		}		
	}
	
	//clear all options before
	/*for(i = 0; i < document.popUpForm.PESetupDialog_SelectsAppsList.options.length; i++)
		document.popUpForm.PESetupDialog_SelectsAppsList.options[i] = null;*/
	while(document.popUpForm.PESetupDialog_SelectsAppsList.options.length != 0)
		document.popUpForm.PESetupDialog_SelectsAppsList.options[document.popUpForm.PESetupDialog_SelectsAppsList.options.length-1] = null;
	
	
	for(i = 0; i < p_vecApps.length; i++)
	{		
		var tmpText = p_vecApps[i];		
		if(p_vecParams[i] != "")
			tmpText += '('+p_vecParams[i]+')';
		document.popUpForm.PESetupDialog_SelectsAppsList.options[i] = new Option(tmpText, p_vecApps[i]);
	}
	//PESetupDialog_SelectsAppsList
		
	PESetupDialogObj = document.getElementById('PESetupDialog');
	PESetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-PESetupDialogObj.clientHeight/2;
	PESetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-PESetupDialogObj.clientWidth/2;
	PESetupDialogObj.style.visibility = "visible";	
}

function closethePE(unID)
	{
		var i;
		//Retrieve the unID wanted
		foundAt = 0;
		hasBeenfound = false;
		for(i = 0; i < vectorPbxExec.length; i++)
		{
			if(vectorPbxExec[i].uID == unID) //des qu on le trouve...
			{
				foundAt = i;
				hasBeenfound = true;
			}
			if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
			{
				if(i == vectorPbxExec.length-1)
					vectorPbxExec.pop();
				else
					vectorPbxExec[i] = vectorPbxExec[i+1];
			}
		}	
		
		//LINKS
		if(hasBeenfound)
		{
			var bNewArray = new Array();
			for(i = 0; i < vectorLinks.length; i++)			
			{
				if( (vectorLinks[i].startID != unID || vectorLinks[i].startType != "PE")  && 
					(vectorLinks[i].endID != unID || vectorLinks[i].endType != "PE")  )
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
		reDisplayObj( "IDPbxExec_"+unID, "");
		enableSaving();
	}
	
	
function addPbxExec()
{
	
	var newOne = new PbxExec();
	nbPbxExec++;
	nbScrpElementCreated++;	
	newOne.uID = nbPbxExec;	
	newOne.VUID = nbScrpElementCreated;
	
	vectorPbxExec.push(newOne);	
	
	scriptHasBeenModified = true;
	//refreshDiagramInside();	
	addNewDivisionToDiagram( newOne.buildHTML() );
}

function showAstAppsDescr()
{
	document.getElementById('PESetupDialog_descr').innerText = ast_apps_list[document.popUpForm.PESetupDialog_list_of_apps.value];	
}

function addAppToList()
{	
	if(document.popUpForm.PESetupDialog_list_of_apps.value != null && document.popUpForm.PESetupDialog_list_of_apps.value != "")
	{
		var theText = document.popUpForm.PESetupDialog_list_of_apps.value;
		if(document.popUpForm.PESetupDialog_AppParams.value != "" && document.popUpForm.PESetupDialog_AppParams.value != null)
			theText += '('+document.popUpForm.PESetupDialog_AppParams.value+')';
		newop = new Option(theText, document.popUpForm.PESetupDialog_list_of_apps.value);		
		document.popUpForm.PESetupDialog_SelectsAppsList.options[document.popUpForm.PESetupDialog_SelectsAppsList.length] = newop;
		chooseSelectObj("PESetupDialog_list_of_apps", "");
		document.popUpForm.PESetupDialog_AppParams.value = "";
	}
}

function removeAppFromList()
{
	var tmpOption;
	var founded = false;
	var i; var j;
	if(document.popUpForm.PESetupDialog_SelectsAppsList.value != "" && document.popUpForm.PESetupDialog_SelectsAppsList.value != null)	
	{
		for(i = 0; i < document.popUpForm.PESetupDialog_SelectsAppsList.length; i++)
		{
			if(document.popUpForm.PESetupDialog_SelectsAppsList.options[i].selected)
			{				
				founded = true;
				break;
			}				
		}		
		if(founded)
		{
			for(j = i; j < document.popUpForm.PESetupDialog_SelectsAppsList.length-1; j++)
			{				
				document.popUpForm.PESetupDialog_SelectsAppsList.options[j] = new Option(document.popUpForm.PESetupDialog_SelectsAppsList.options[j+1].text, document.popUpForm.PESetupDialog_SelectsAppsList.options[j+1].value);							
			}
			document.popUpForm.PESetupDialog_SelectsAppsList.options[document.popUpForm.PESetupDialog_SelectsAppsList.length-1] = null;
		}
	}
}

function moveAppUp()
{
	var tmpOption;
	var founded = false;
	var i;
	if(document.popUpForm.PESetupDialog_SelectsAppsList.value != "" && document.popUpForm.PESetupDialog_SelectsAppsList.value != null)	
	{
		for(i = 0; i < document.popUpForm.PESetupDialog_SelectsAppsList.length; i++)
		{
			if(document.popUpForm.PESetupDialog_SelectsAppsList.options[i].selected)
			{				
				founded = true;
				break;
			}				
		}		
		if(founded && i != 0)
		{
			tmpOption = new Option(document.popUpForm.PESetupDialog_SelectsAppsList.options[i].text, document.popUpForm.PESetupDialog_SelectsAppsList.options[i].value);
			document.popUpForm.PESetupDialog_SelectsAppsList.options[i] = new Option(document.popUpForm.PESetupDialog_SelectsAppsList.options[i-1].text, document.popUpForm.PESetupDialog_SelectsAppsList.options[i-1].value);
			document.popUpForm.PESetupDialog_SelectsAppsList.options[i-1] = new Option(tmpOption.text, tmpOption.value);
			document.popUpForm.PESetupDialog_SelectsAppsList.options[i-1].selected = true;
		}
	}
}

function moveAppDown()
{
	var tmpOption;
	var founded = false;
	var i;
	if(document.popUpForm.PESetupDialog_SelectsAppsList.value != "" && document.popUpForm.PESetupDialog_SelectsAppsList.value != null)	
	{
		for(i = 0; i < document.popUpForm.PESetupDialog_SelectsAppsList.length; i++)
		{
			if(document.popUpForm.PESetupDialog_SelectsAppsList.options[i].selected)
			{				
				founded = true;
				break;
			}				
		}		
		if(founded && i != document.popUpForm.PESetupDialog_SelectsAppsList.length-1)
		{
			tmpOption = new Option(document.popUpForm.PESetupDialog_SelectsAppsList.options[i].text, document.popUpForm.PESetupDialog_SelectsAppsList.options[i].value);
			document.popUpForm.PESetupDialog_SelectsAppsList.options[i] = new Option(document.popUpForm.PESetupDialog_SelectsAppsList.options[i+1].text, document.popUpForm.PESetupDialog_SelectsAppsList.options[i+1].value);
			document.popUpForm.PESetupDialog_SelectsAppsList.options[i+1] = new Option(tmpOption.text, tmpOption.value);
			document.popUpForm.PESetupDialog_SelectsAppsList.options[i+1].selected = true;
		}
	}
}