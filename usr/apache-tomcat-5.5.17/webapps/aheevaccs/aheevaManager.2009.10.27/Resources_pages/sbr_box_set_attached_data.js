// JavaScript Document
function associativeArrayLength(array)
{
	var length = 0;
	for (var object in array) 
	{
		length++;
	}
	return length;
}

function SetAttachedData()
{
	this.uID = 0;
	this.xPos 				= "0px";
	this.yPos 				= "0px";
	this.variableMap 		= new Array();
	this.VUID 				= 0;
	this.ownBoxType 		= "SAD";
	this.next 				= "";
	this.nextVUID 			= 0;
	
	this.buildHTML = function()
		{			
			var sReturn = "";
			var buttonValue = "";
			var mapLength = associativeArrayLength(this.variableMap);

			if(mapLength != 0)
			{
				toomuch = false;
				if(mapLength >= 4) 
					toomuch = true;
				var i = 0;
				for(key in this.variableMap)
				{
					if(i == 3 && toomuch)
					{
						buttonValue += '...\n';
						break;
					}
					buttonValue += key;
					buttonValue += '=' + this.variableMap[key];
					if(i < mapLength -1)
						buttonValue += '\n';
					i++;
				}
			}
			else
				buttonValue = 'Setup';
			
			sReturn += "";
			
			sReturn += '<div id="IDSetAttachedData_'+this.uID+'"';
			sReturn += ' class="defaultSetAttachedData" style="top:'+this.yPos+'; left:'+this.xPos+'"';
			sReturn += '>';
			sReturn += '<table width="100%" height="100%" cellspacing="0" cellpadding="0">';		
			sReturn += '<tr bgcolor="#8fbc8f"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDSetAttachedData_'+this.uID+'\')"><b>'+MultiArray["Set Attached Data"][lang]+' #'+this.uID;
			if(DEBUG)
				sReturn += ' ID['+this.VUID+']';
			sReturn += '</b></td>';
			sReturn += '<td align="right"><a href="javascript:closetheSAD('+this.uID+')">';
			sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
			sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'SAD\', \''+this.VUID+'\')"><i>'+MultiArray["Entry point"][lang]+'</i></td></tr>';
			sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpSAD(\''+this.uID+'\')" ';
			sReturn += 'value="'+buttonValue+'" class="setupButton3"></td></tr>';
			sReturn += '<tr><td colspan="2" nowrap class="entryTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'OnNext\', \'SAD\', \''+this.VUID+'\')"><i>'+MultiArray["Next"][lang]+'';
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
			if(associativeArrayLength(this.variableMap) == 0)
			{
				alert("Error: Missing content for Set Attached Data #" + this.uID);
				retrieveTmpMessage();
				bReturn = false;
				setUpSAD(this.uID);
			}				
			return bReturn;
		}
		
		
		this.softvalidate = function()
		{
			var rArray = new Array();
			var tmpmess;
			var tmptext = "";
			var tmponclick = 'setUpSAD(\''+this.uID+'\')';	
			
			if(associativeArrayLength(this.variableMap) == 0)
			{
				tmpmess = new softValidationMess();			
				tmptext = "Error: Missing content for Set Call Variable #"+this.uID;
				tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
				rArray.push(tmpmess);
			}		
			return rArray;
		}
}


function closeSetUpSAD()
{
	document.getElementById('SADSetupDialog').style.visibility = "hidden";
}

function submitSetUpSAD()
{
	var i; 
	var j;
	for(i = 0; i < vectorSetAttachedData.length; i++)
	{		
		if(vectorSetAttachedData[i].uID == document.getElementById('SADSetupDialog_id').innerText)
		{			
			//Clear the arrays
			vectorSetAttachedData[i].variableMap = new Array();
			for(j = 0; j < document.popUpForm.SADSetupDialog_VariableList.length; j++)
			{
				var equal_position = document.popUpForm.SADSetupDialog_VariableList[j].text.indexOf('=');
				if(equal_position != -1) //We have parameters here...
				{
					var key = document.popUpForm.SADSetupDialog_VariableList[j].text.substring(0, equal_position);
					var value = document.popUpForm.SADSetupDialog_VariableList[j].text.substring(equal_position + 1, document.popUpForm.SADSetupDialog_VariableList[j].text.length);
					vectorSetAttachedData[i].variableMap[key] = value;
				}
			}
			break;
		}
	}

	// Call properties are now changed
	updateCallProperties();
	
	document.getElementById('SADSetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();	
	
	reDisplayObj("IDSetAttachedData_"+vectorSetAttachedData[i].uID, vectorSetAttachedData[i].buildHTML());
	enableSaving();
}

function setUpSAD(p_uID)
{	
	var i;
	hideAllToolsOptions();

	document.getElementById('SADSetupDialog_id').innerText = p_uID;
	
	
	//Get the rigth Object
	for(i = 0; i < vectorSetAttachedData.length; i++ )	
	{		
		if(vectorSetAttachedData[i].uID == p_uID )
		{
			p_varMap = vectorSetAttachedData[i].variableMap;
			break;
		}		
	}
	
	//clear all options before
	while(document.popUpForm.SADSetupDialog_VariableList.options.length != 0)
		document.popUpForm.SADSetupDialog_VariableList.options[document.popUpForm.SADSetupDialog_VariableList.options.length-1] = null;
	
	i = 0;
	for(var key in p_varMap)
	{		
		var tmpText = key;		
		if(p_varMap[key] != "")
			tmpText += '='+p_varMap[key];
		document.popUpForm.SADSetupDialog_VariableList.options[i] = new Option(tmpText, key);
		i++;
	}
		
	var SADSetupDialogObj = document.getElementById('SADSetupDialog');
	SADSetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-SADSetupDialogObj.clientHeight/2;
	SADSetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-SADSetupDialogObj.clientWidth/2;
	SADSetupDialogObj.style.visibility = "visible";
}

function closetheSAD(unID)
	{
		var i;
		//Retrieve the unID wanted
		foundAt = 0;
		hasBeenfound = false;
		for(i = 0; i < vectorSetAttachedData.length; i++)
		{
			if(vectorSetAttachedData[i].uID == unID) //des qu on le trouve...
			{
				foundAt = i;
				hasBeenfound = true;
			}
			if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
			{
				if(i == vectorSetAttachedData.length-1)
					vectorSetAttachedData.pop();
				else
					vectorSetAttachedData[i] = vectorSetAttachedData[i+1];
			}
		}	
		
		//LINKS
		if(hasBeenfound)
		{
			var bNewArray = new Array();
			for(i = 0; i < vectorLinks.length; i++)			
			{
				if( (vectorLinks[i].startID != unID || vectorLinks[i].startType != "SAD")  && 
					(vectorLinks[i].endID != unID || vectorLinks[i].endType != "SAD")  )
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
		
		updateCallProperties();
		scriptHasBeenModified = true;
		//Display the whole graph
		//refreshDiagramInside();			
		reDisplayObj( "IDSetAttachedData_"+unID, "");
		enableSaving();
	}
	
	
function addSetAttachedData()
{
	var newOne = new SetAttachedData();
	nbSetAttachedData++;
	nbScrpElementCreated++;	
	newOne.uID = nbSetAttachedData;	
	newOne.VUID = nbScrpElementCreated;
	
	vectorSetAttachedData.push(newOne);
	
	scriptHasBeenModified = true;
	//refreshDiagramInside();	
	addNewDivisionToDiagram( newOne.buildHTML() );
}

function addVariableToList()
{
	if(document.popUpForm.SADNewVariableKey.value != null && document.popUpForm.SADNewVariableKey.value != "" &&
	   document.popUpForm.SADNewVariableValue.value != null)
	{
		var theOption = null;
		for(var i = 0; i < document.popUpForm.SADSetupDialog_VariableList.length; i++)
		{
			var curOption = document.popUpForm.SADSetupDialog_VariableList.options[i];
			if(curOption.value == document.popUpForm.SADNewVariableKey.value)
			{
				theOption = curOption;
				break;
			}
		}
		var theText = document.popUpForm.SADNewVariableKey.value + '=' + document.popUpForm.SADNewVariableValue.value;
		if(theOption == null)
		{
			theOption = new Option(theText, document.popUpForm.SADNewVariableKey.value);
			document.popUpForm.SADSetupDialog_VariableList.options[document.popUpForm.SADSetupDialog_VariableList.length] = theOption;
		}
		else
			theOption.text = theText;
		document.popUpForm.SADNewVariableKey.value = "";
		document.popUpForm.SADNewVariableValue.value = "";
	}
}

function removeVariableFromList()
{
	var tmpOption;
	var found = false;
	var i; var j;
	if(document.popUpForm.SADSetupDialog_VariableList.value != "" && document.popUpForm.SADSetupDialog_VariableList.value != null)	
	{
		for(i = 0; i < document.popUpForm.SADSetupDialog_VariableList.length; i++)
		{
			if(document.popUpForm.SADSetupDialog_VariableList.options[i].selected)
			{				
				found = true;
				break;
			}				
		}
		if(found)
		{
			for(j = i; j < document.popUpForm.SADSetupDialog_VariableList.length-1; j++)
			{				
				document.popUpForm.SADSetupDialog_VariableList.options[j] = new Option(document.popUpForm.SADSetupDialog_VariableList.options[j+1].text, document.popUpForm.SADSetupDialog_VariableList.options[j+1].value);							
			}
			document.popUpForm.SADSetupDialog_VariableList.options[document.popUpForm.SADSetupDialog_VariableList.length-1] = null;
		}
	}
}

function editVariable()
{
	var selectedIndex = document.popUpForm.SADSetupDialog_VariableList.selectedIndex;
	if(selectedIndex >= 0)
	{
		var theOption = document.popUpForm.SADSetupDialog_VariableList.options[selectedIndex];
		if(theOption)
		{
			document.popUpForm.SADNewVariableKey.value = theOption.value;
			var equal_position = theOption.text.indexOf('=');
			if(equal_position != -1)
			{
				var value = theOption.text.substring(equal_position + 1, theOption.text.length);
				document.popUpForm.SADNewVariableValue.value = value;
			}
		}
	}
}
