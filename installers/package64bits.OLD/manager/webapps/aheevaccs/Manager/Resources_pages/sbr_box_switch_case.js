// JavaScript Document


function SwitchCase()
{
	this.uID 				= "";
	this.VUID 				= 0;
	this.testedPropertyID 	= "";
	this.LinkTypeArray		= new Array();	
	this.seekValueArray		= new Array();
	this.OnSuccessArray		= new Array();
	this.OnSuccessVUIDArray = new Array();
	this.onDefault			= "";
	this.onDefaultVUID		= 0;
	
	this.xPos 				= "0px";
	this.yPos 				= "0px";
	this.ownBoxType 		= "SC";	
	
	this.getObj = function()
	{
		return this;
	}
	
	
	this.buildHTML = function()
	{			
		var sReturn = "";
		var buttonValue = "";
		var i;
			
		
		if(this.testedPropertyID != "")			
				buttonValue = "Switch("+ this.testedPropertyID +")";
		else
			buttonValue = 'Setup';
		
		sReturn += "";
		
		sReturn += '<div id="IDSwitchCase_'+this.uID+'"';
		sReturn += ' class="defaultSwitchCase" style="top:'+this.yPos+'; left:'+this.xPos+'"';
		sReturn += '>';
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
		sReturn += '<tr bgcolor="#E8E0DB"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDSwitchCase_'+this.uID+'\')"><b>Switch #'+this.uID;
		if(DEBUG)
			sReturn += ' ID['+this.VUID+']';
		sReturn += '</b></td>';
		sReturn += '<td align="right"><a href="javascript:closetheSC('+this.uID+')">';
		sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
		sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'SC\', \''+this.VUID+'\')"><i>Entry Point</i></td></tr>';
		sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpSC(\''+this.uID+'\')" ';
		sReturn += 'value="'+buttonValue+'" class="setupButton"></td></tr>';
		
		for(i = 0; i < this.LinkTypeArray.length; i++)
		{
			sReturn += '<tr><td nowrap colspan="2" style="background-color:'+getColor(i)+'" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'onSucced_'+i+'\', \'SC\', \''+this.VUID+'\')"><i>'+this.LinkTypeArray[i]+' '+this.seekValueArray[i];
			if(DEBUG)
				sReturn += ' -->['+this.OnSuccessVUIDArray[i]+']';
			sReturn += '</i></td></tr>';
		}
			
		sReturn += '<tr><td colspan="2" nowrap class="onsuccedTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'onDEFAULT\', \'SC\', \''+this.VUID+'\')"><i>Default';
		if(DEBUG)
			sReturn += ' -->['+this.onDefaultVUID+']';
		sReturn += '</i></td></tr>';
		sReturn += '</table>';
		sReturn += '</div>';
		
		return sReturn;			
	}
	
	this.validate = function()
	{
		var bReturn = true;
		if(this.LinkTypeArray.length == 0)
		{
			alert('Error: Missing possible values for Switch #'+this.uID);
			retrieveTmpMessage();
			bReturn = false;
			setUpSC(this.uID);
		}				
		return bReturn;
	}
	
	this.softvalidate = function()
	{
		var rArray = new Array();
		var tmpmess;
		var tmptext = "";
		var tmponclick = 'setUpSC(\''+this.uID+'\')';	
		
		if(this.LinkTypeArray.length == 0)
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Missing possible values for Switch #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}		
		return rArray;
	}
	
}

function addSwitchCase()
{	
	var newOne = new SwitchCase();
	nbSCCreated++;
	nbScrpElementCreated++;	
	newOne.uID = nbSCCreated;	
	newOne.VUID = nbScrpElementCreated;
	
	vectorSwitchCases.push(newOne);	
	
	scriptHasBeenModified = true;
	//refreshDiagramInside();	
	addNewDivisionToDiagram( newOne.buildHTML() );
}

function closetheSC(unID)
	{
		var i;
		//Retrieve the unID wanted
		foundAt = 0;
		hasBeenfound = false;
		for(i = 0; i < vectorSwitchCases.length; i++)
		{
			if(vectorSwitchCases[i].uID == unID) //des qu on le trouve...
			{
				foundAt = i;
				hasBeenfound = true;
			}
			if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
			{
				if(i == vectorSwitchCases.length-1)
					vectorSwitchCases.pop();
				else
					vectorSwitchCases[i] = vectorSwitchCases[i+1];
			}
		}	
		
		//LINKS
		if(hasBeenfound)
		{
			var bNewArray = new Array();
			for(i = 0; i < vectorLinks.length; i++)			
			{
				if( (vectorLinks[i].startID != unID || vectorLinks[i].startType != "SC")  && 
					(vectorLinks[i].endID != unID || vectorLinks[i].endType != "SC")  )
				{
					bNewArray.push(vectorLinks[i]);					
				}
				else
				{
					reDisplayObj("Connexion_ID"+vectorLinks[i].uID, "");
					resetBoxInformations ( vectorLinks[i] );
					enableSaving();
				} 
			}			
			vectorLinks = bNewArray;			
		}
		
		scriptHasBeenModified = true;
		//Display the whole graph
		//refreshDiagramInside();			
		reDisplayObj( "IDSwitchCase_"+unID, "");
		enableSaving();
	}

function closeSetUpSC()
{
	document.getElementById('SCSetupDialog').style.visibility = "hidden";
}


function submitSetUpSC()
{
	var i; 
	var j;
	
	for(i = 0; i < vectorSwitchCases.length; i++)
	{		
		if(vectorSwitchCases[i].uID == document.getElementById('SCSetupDialog_id').innerText)
		{			
			//Clear the arrays			
			vectorSwitchCases[i].testedPropertyID 	= document.popUpForm.n_call_prop2.value;
			vectorSwitchCases[i].LinkTypeArray 		= new Array();
			vectorSwitchCases[i].seekValueArray 	= new Array();			
			
			for(j = 0; j < document.popUpForm.SCSetupDialog_SelectsSCValuesList.length; j++)
			{
				//vectorSwitchCases[i].vectorApps[j] = document.popUpForm.SCSetupDialog_SelectsSCValuesList[j].value;				
				vectorSwitchCases[i].LinkTypeArray[j] = document.popUpForm.SCSetupDialog_SelectsSCValuesList[j].value;
				var first_open_bracket = document.popUpForm.SCSetupDialog_SelectsSCValuesList[j].text.indexOf(' ');
				if(first_open_bracket != -1) //We have parameters here...
					vectorSwitchCases[i].seekValueArray[j] = document.popUpForm.SCSetupDialog_SelectsSCValuesList[j].text.substring(first_open_bracket+1, document.popUpForm.SCSetupDialog_SelectsSCValuesList[j].text.length);
				else
					vectorSwitchCases[i].seekValueArray[j] = "";
					
				vectorSwitchCases[i].OnSuccessArray[j] = "";
				vectorSwitchCases[i].OnSuccessVUIDArray[j] = "";
			}
			break;
		}
	}
	
	document.getElementById('SCSetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();	
	reDisplayObj("IDSwitchCase_"+vectorSwitchCases[i].uID, vectorSwitchCases[i].buildHTML());
	enableSaving();
}

function setUpSC(p_uID)
{	
	var i;
	hideAllToolsOptions();
	
	
	document.getElementById('SCSetupDialog_id').innerText = p_uID;
	
	buildSelectFromVector(document.popUpForm.n_call_prop2, vectorOfCallProperties);
	
	
	
	//Get the rigth Object
	for(i = 0; i < vectorSwitchCases.length; i++ )	
	{		
		if(vectorSwitchCases[i].uID == p_uID )
		{
			//document.popUpForm.n_call_prop2.value = vectorSwitchCases[i].testedPropertyID;
			chooseSelectObj('n_call_prop2', vectorSwitchCases[i].testedPropertyID);
			p_vecApps 	= vectorSwitchCases[i].LinkTypeArray;
			p_vecParams	= vectorSwitchCases[i].seekValueArray;			
			break;
		}		
	}
	
	//clear all options before
	while(document.popUpForm.SCSetupDialog_SelectsSCValuesList.options.length != 0)
		document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[document.popUpForm.SCSetupDialog_SelectsSCValuesList.options.length-1] = null;
	
	for(i = 0; i < p_vecApps.length; i++)
	{		
		var tmpText = p_vecApps[i];		
		//if(p_vecParams[i] != "")
		tmpText += ' '+p_vecParams[i];
		document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i] = new Option(tmpText, p_vecApps[i]);
	}
	//PESetupDialog_SelectsAppsList
		
	SCSetupDialogObj = document.getElementById('SCSetupDialog');
	SCSetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-SCSetupDialogObj.clientHeight/2;
	SCSetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-SCSetupDialogObj.clientWidth/2;
	SCSetupDialogObj.style.visibility = "visible";	
}

/////// ASSOCIATED FUNCTIONS ///////
/*
 *
 *
 *
 */
function addSCValueToList()
{	
	if(document.popUpForm.SCSetupDialog_list_of_SCValues.value != null && document.popUpForm.SCSetupDialog_list_of_SCValues.value != "")
	{
		var theText = document.popUpForm.SCSetupDialog_list_of_SCValues.value;
		if(document.popUpForm.SCSetupDialog_SCValueParams.value != "" && document.popUpForm.SCSetupDialog_SCValueParams.value != null)
			theText += ' '+document.popUpForm.SCSetupDialog_SCValueParams.value;
		newop = new Option(theText, document.popUpForm.SCSetupDialog_list_of_SCValues.value);		
		document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[document.popUpForm.SCSetupDialog_SelectsSCValuesList.length] = newop;
		chooseSelectObj("SCSetupDialog_list_of_SCValues", "");
		document.popUpForm.SCSetupDialog_SCValueParams.value = "";
	}
}

function removeSCValueFromList()
{
	var tmpOption;
	var founded = false;
	var i;
	if(document.popUpForm.SCSetupDialog_SelectsSCValuesList.value != "" && document.popUpForm.SCSetupDialog_SelectsSCValuesList.value != null)	
	{
		for(i = 0; i < document.popUpForm.SCSetupDialog_SelectsSCValuesList.length; i++)
		{
			if(document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i].selected)
			{				
				founded = true;
				break;
			}				
		}		
		if(founded)
		{
			for(j = i; j < document.popUpForm.SCSetupDialog_SelectsSCValuesList.length-1; j++)
			{				
				document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[j] = new Option(document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[j+1].text, document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[j+1].value);							
			}
			document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[document.popUpForm.SCSetupDialog_SelectsSCValuesList.length-1] = null;
		}
	}
}

function moveSCValueUp()
{
	var tmpOption;
	var founded = false;
	var i;
	if(document.popUpForm.SCSetupDialog_SelectsSCValuesList.value != "" && document.popUpForm.SCSetupDialog_SelectsSCValuesList.value != null)	
	{
		for(i = 0; i < document.popUpForm.SCSetupDialog_SelectsSCValuesList.length; i++)
		{
			if(document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i].selected)
			{				
				founded = true;
				break;
			}				
		}		
		if(founded && i != 0)
		{
			tmpOption = new Option(document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i].text, document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i].value);
			document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i] = new Option(document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i-1].text, document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i-1].value);
			document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i-1] = new Option(tmpOption.text, tmpOption.value);
			document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i-1].selected = true;
		}
	}
}

function moveSCValueDown()
{
	var tmpOption;
	var founded = false;
	var i;
	if(document.popUpForm.SCSetupDialog_SelectsSCValuesList.value != "" && document.popUpForm.SCSetupDialog_SelectsSCValuesList.value != null)	
	{
		for(i = 0; i < document.popUpForm.SCSetupDialog_SelectsSCValuesList.length; i++)
		{
			if(document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i].selected)
			{				
				founded = true;
				break;
			}				
		}		
		if(founded && i != document.popUpForm.SCSetupDialog_SelectsSCValuesList.length-1)
		{
			tmpOption = new Option(document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i].text, document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i].value);
			document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i] = new Option(document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i+1].text, document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i+1].value);
			document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i+1] = new Option(tmpOption.text, tmpOption.value);
			document.popUpForm.SCSetupDialog_SelectsSCValuesList.options[i+1].selected = true;
		}
	}
}


function getColor(weight)
{
	if(weight == "N/A")
		return "#FFFFFF";
	var redcolor, greencolor, bluecolor, color;
	redcolor = Math.abs((171-175)/10*weight+175);
	redcolor = dechex(redcolor);
	greencolor = Math.abs((202-237)/10*weight+237);
	greencolor = dechex(greencolor);
	//bluecolor = (108-59)/100*new_weight+59;
	bluecolor = Math.abs((237-205)/10*weight+205);
	bluecolor = dechex(bluecolor);
	//bluecolor = dechex(bluecolor);	
	color = "#"+redcolor+""+greencolor+""+bluecolor;	
	
	return color;
}

function dechex(f1) {  
  rhex = tohex(f1);
  return rhex;
}

function tohex(i) {
  a2 = ''
  ihex = hexQuot(i);
  idiff = eval(i + '-(' + ihex + '*16)')
  a2 = itohex(idiff) + a2;
  while( ihex >= 16) {
	 itmp = hexQuot(ihex);
	 idiff = eval(ihex + '-(' + itmp + '*16)');
	 a2 = itohex(idiff) + a2;
	 ihex = itmp;
  } 
  a1 = itohex(ihex);
  return a1 + a2 ;
}
function hexQuot(i) {
  return Math.floor(eval(i +'/16'));
}
function itohex(i) {
		aa = '0';
      if( i == 0) { aa = '0' } else { if( i== 1) { aa = '1'} else {if( i== 2) { aa = '2'} else {if( i == 3) { aa = '3' } else {if( i== 4) { aa = '4'} else {if( i == 5) { aa = '5' } else {if( i== 6) { aa = '6'} else {if( i == 7) { aa = '7' } else {if( i== 8) { aa = '8'} else {if( i == 9) { aa = '9'} else {if( i==10) { aa = 'A'} else {if( i==11) { aa = 'B'} else {if( i==12) { aa = 'C'} else {if( i==13) { aa = 'D'} else {if( i==14) { aa = 'E'}  else {if( i==15) { aa = 'F'} } } } } } } } } } } } } } } }
      return aa
   }

