// JavaScript Document
/*****************************************
 Class CustomServer()
*****************************************/
function CustomServer()
{
	this.uID 			= 0;
	this.xPos 			= "0px";
	this.yPos 			= "0px";
	this.module 		= "";
	this.function_name 	= ""
	this.params 		= "";
	this.VUID 			= 0;
	this.OnNextVUID = 0;
	this.OnNext = 0;
	this.ownBoxType = "CS";
	
	this.buildHTML = function()
	{
		var buttonValue = "";
		if(this.module != "" && this.function_name != null)
		{
			buttonValue = this.function_name+'('+this.params+')\n';
			buttonValue += ' ['+this.module+' module]';			
		}
		else
			buttonValue = 'Setup';
			
		sReturn = "";			
		sReturn += '<div id="IDCustomServer_'+this.uID+'"';
		sReturn += ' uID = "'+this.uID+'"';
		sReturn += ' xPos = "'+this.testedPropertyID+'"';
		sReturn += ' yPos = "'+this.LinkType+'"';
		sReturn += ' class="defaultCustomServer" style="top:'+this.yPos+'; left:'+this.xPos+'"';
		sReturn += ' ';
		sReturn += ' >';
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
		sReturn += '<tr bgcolor="#F0D7CA"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDCustomServer_'+this.uID+'\')"><b>'+MultiArray["Custom server"][lang]+' #'+this.uID;
		if(DEBUG)
			sReturn += ' ID['+this.VUID+']';
		sReturn += '</b></td>';
		sReturn += '<td align="right"><a href="javascript:closetheCS('+this.uID+')">';
		sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
		sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'CS\', \''+this.VUID+'\')"><i>'+MultiArray["Entry point"][lang]+'</i></td></tr>';
		sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpCS(\''+this.uID+'\', \''+this.module+'\', \''+this.function_name+'\', \''+this.params+'\')" ';
		sReturn += 'value="'+buttonValue+'" class="setupButton"></td></tr>';
		sReturn += '';
		sReturn += '<tr><td colspan="2" nowrap class="onsuccedTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'onNext\', \'CS\', \''+this.VUID+'\')"><i>'+MultiArray["Next"][lang]+'';
		if(DEBUG)
			sReturn += ' -->['+this.OnNextVUID+']';
		sReturn += '</i></td></tr>';
		sReturn += '</table>';
		sReturn += '</div>';
		sReturn += '';
		return sReturn;
	}
	
	this.getObj = function()
	{
		return this;
	}
	
	
	this.validate = function()
	{
		var bReturn = true;
		
		if(this.module == "")
		{
			alert(MultiArray["Error: Missing module name for custom server #"][lang]+this.uID);
			
			retrieveTmpMessage();
			bReturn = false;
			setUpCS(this.uID, this.module, this.function_name, this.params);
		}
		else if(this.function_name == "")
		{
			alert(MultiArray["Error: Missing function name for custom server #"][lang]+this.uID);
			
			retrieveTmpMessage();
			bReturn = false;
			setUpCS(this.uID, this.module, this.function_name, this.params);
		}			
		return bReturn;
	}
	
	
	this.softvalidate = function()
	{
		var rArray = new Array();
		var tmpmess;
		var tmptext = "";
		var tmponclick = 'setUpCS(\''+this.uID+'\', \''+this.module+'\', \''+this.function_name+'\', \''+this.params+'\')';	
		
		
		if(this.module == "")
		{
			tmpmess = new softValidationMess();
			tmptext = 'Missing module name for Custom Server #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}
		else if(this.function_name == "")
		{
			tmpmess = new softValidationMess();
			tmptext = 'Missing function name for Custom Server #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}
		
	
		return rArray;
	}
	
	this.buildString = function()
	{
		var sReturn = "";
		
		sReturn += 'TYPE=CUSTOMSERVER';
		sReturn += '&';		
		sReturn += 'uID='+this.uID;
		sReturn += '&';
		sReturn += 'VUID='+this.VUID;
		sReturn += '&';
		sReturn += 'module='+this.module;
		sReturn += '&';
		sReturn += 'function_name='+this.function_name;
		sReturn += '&';
		sReturn += 'params='+this.params;
		sReturn += '&';
		sReturn += 'OnNextVUID='+this.OnNextVUID;
		sReturn += '&';
		sReturn += 'OnNext='+this.OnNext;
		sReturn += '&';
		sReturn += 'xPos='+this.xPos;
		sReturn += '&';
		sReturn += 'yPos='+this.yPos;
		sReturn += '^';		
		return sReturn;		
	}
	
}
	
	
/******************
OTHERS FUNCTIONS
**********************/
function CSChangeModule(modulename)
{
	var obj =  document.popUpForm.n_custom_server_function;
	obj.options.length = 0;
	if(vectorOfCustomServerModulesFucntions[modulename] != null)
	{
		var vec = vectorOfCustomServerModulesFucntions[modulename];
		for(var i = 0; i < vec.length; i++)
		{
			var opt = new Option(vec[i], vec[i]);
			obj.options[obj.options.length] = opt;
		}
	}	
}

function closeSetUpCS()
{
	document.getElementById('CSSetupDialog').style.visibility = "hidden";	
}

function submitSetUpCS()
{
	for(var i = 0; i < vectorCustomServer.length; i++)
	{		
		if(vectorCustomServer[i].uID == document.getElementById('CSSetupDialog_TD1').innerText)
		{			
			vectorCustomServer[i].module 		= document.popUpForm.n_custom_server_module.value;			
			vectorCustomServer[i].function_name = document.popUpForm.n_custom_server_function.value;
			vectorCustomServer[i].params		= document.popUpForm.n_custom_server_param.value;
			break;
		}
	}
	document.getElementById('CSSetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();	
	reDisplayObj("IDCustomServer_"+vectorCustomServer[i].uID, vectorCustomServer[i].buildHTML());
	enableSaving();
}

function setUpCS(p_uID, p_Module, p_functionName, p_Params)
{
	//Hide all others...
	hideAllToolsOptions();	
	
	document.getElementById('CSSetupDialog_TD1').innerText = p_uID;
	
	if(p_Module != "" && p_Module != "undefined")	
		chooseSelectObj("n_custom_server_module", p_Module); 	
	else
		chooseSelectObj("n_custom_server_module", "");
		
	if(p_functionName != "" && p_functionName != "undefined")	
		chooseSelectObj("n_custom_server_function", p_functionName); 	
	else
		chooseSelectObj("n_custom_server_function", "");
	
	if(p_Params != "" && p_Params != "undefined")
		document.popUpForm.n_custom_server_param.value = p_Params;
	else
		document.popUpForm.n_custom_server_param.value = "";
	
	CSSetupDialogObj = document.getElementById('CSSetupDialog');
	CSSetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-CSSetupDialogObj.clientHeight/2;
	CSSetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-CSSetupDialogObj.clientWidth/2;
	CSSetupDialogObj.style.visibility = "visible";
}

//This function close the Call Condition text box
function closetheCS(unID)
{
	//Retrieve the unID wanted
	foundAt = 0;
	hasBeenfound = false;
	for(i = 0; i < vectorCustomServer.length; i++)
	{
		if(vectorCustomServer[i].uID == unID) //des qu on le trouve...
		{
			foundAt = i;
			hasBeenfound = true;
		}
		if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
		{
			if(i == vectorCustomServer.length-1)
				vectorCustomServer.pop();
			else
				vectorCustomServer[i] = vectorCustomServer[i+1];
		}
	}	
	
	//LINKS
	if(hasBeenfound)
	{
		var bNewArray = new Array();
		for(i = 0; i < vectorLinks.length; i++)			
		{
			if( (vectorLinks[i].startID != unID || vectorLinks[i].startType != "CS")  && 
				(vectorLinks[i].endID != unID || vectorLinks[i].endType != "CS")  )
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
	reDisplayObj( "IDCustomServer_"+unID, "");
	enableSaving();
}

function addCustomServer()
{
	var newOne = new CustomServer();
	nbCSCreated++;
	nbScrpElementCreated++;
	newOne.uID = nbCSCreated;	
	newOne.VUID = nbScrpElementCreated;	
	vectorCustomServer.push(newOne);	
	scriptHasBeenModified = true;
	//refreshDiagramInside();
	addNewDivisionToDiagram( newOne.buildHTML() );
}