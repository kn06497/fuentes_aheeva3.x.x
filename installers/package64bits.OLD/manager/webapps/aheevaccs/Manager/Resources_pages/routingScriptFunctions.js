
// JavaScript Document

// routingScript.htm --> Javascript Functions

var tenantDBID = QueryString('tenant_dbid')? normalizeString(QueryString('tenant_dbid')): "";
var tenantName = QueryString('tenantName')? normalizeString(QueryString('tenantName')): "";
var script_dbid = QueryString('script_dbid')? normalizeString(QueryString('script_dbid')): "";
var script_name = QueryString('script_name')? normalizeString(QueryString('script_name')): "";
var script_is_active = QueryString('script_is_active')? normalizeString(QueryString('script_is_active')): "";
var script_priority = QueryString('script_priority')? normalizeString(QueryString('script_priority')): "";

//** Constantes
var SOFT_VALIDATION_ERROR_IMG 		= '../img/stop_mini.gif';
var SOFT_VALIDATION_WARNING_IMG 	= '../img/warning_mini.gif';
var SOFT_VALIDATION_NOTICE_IMG 		= '';
var SOFT_VALIDATION_ERROR_COLOR 	= '#FFD7AE';
var SOFT_VALIDATION_WARNING_COLOR 	= '#FFFFDF';
var SOFT_VALIDATION_NOTICE_COLOR 	= '#FFFFFF';
var CONST_SCRIPT_NAME_MAX_LENGHT	= 30;
var CONST_NB_BACKUPS				= 3;
var DEBUG 							= false;
/***/


//	____Arrays____
var vectorLinks = new Array();				//Liste des liens
var vectorCallConditions = new Array();		//Liste des CallCondition
var vectorCallEnding = new Array();			//Liste des CallEnding
var vectorAgentPickupMethods = new Array();	//Liste des Agent Pickup Method
var vectorPriorityIncrement = new Array();	//Liste des PriorityIncrement
var vectorPbxExec = new Array();			//Liste des PbxExec
var vectorGetDtmf = new Array();			//Liste des getDTMF
var vectorSqlQueries = new Array();			//Liste des SqlQueries
var vectorSwitchCases = new Array();		//Liste des SwitchCases
var vectorCounterBox = new Array();			//Liste des CounterBox
var vectorGetStatisticBox = new Array();	//Liste des GetStatistic
var vectorCustomServer = new Array();		//Liste des CustomServers

var nbCCCreated 	= 0;	//Nombre de CallConditions crees jusque la
var nbLnkCreated 	= 0;	//Nombre de liens crees jusque la
var nbPMCreated 	= 0;	//Nombre de Agent Pickup Method crees jusque la
var nbCECreated 	= 0;	//Nombre de CallEnding crees jusque la
var nbPriorityInc 	= 0;	//Nombre de Priority Increment crees jusque la
var nbPbxExec 		= 0;	//Nombre de Pbx Execute crees jusque la
var nbDTCreated 	= 0;	//Nombre de Get DTMF crees jusque la
var nbSQCreated		= 0;	//Nombre de CallConditions crees jusque la
var nbSCCreated		= 0;	//Nombre de SwitchCase crees jusque la
var nbCounterBox	= 0;	//Nombre de CounterBox crees jusque la
var nbGetStatBox	= 0; 	//Nombre de GetStatistic crees jusque la
var nbCSCreated		= 0;	//Nombre de CustomServer crees jusque la
var nbScrpElementCreated = 0;//Nombre de boites crees jusque la, pour attribution des uniqueID

// Variables globales pour la gestion des liens <-- creation
var tmpLnkStartID 	= "";
var tmpLnkEndID 	= "";
var tmpLnkStartType = "";
var tmpLnkEndType 	= "";
var tmpLinkCreationStep = 0;
var currentArrow;
// ~~~~Variables globales pour la gestion des liens <-- creation

//variables globales pour gerer les undo et redo
var diagramBackupVector = new Array( CONST_NB_BACKUPS );


//
var vectorSoftValidationMessage = new Array();






//


var scriptHasBeenModified = false;	//Specifie si le diagramme a ete modifie
var selectedArrowID = "";			//Numero d'un lien selectionne pour une destruction eventuelle
var selectedBoxID = "";
var selectedBoxType = "";
document.onclick = onDocClickHandle
window.onload = onloadH;
var GSSetupDialog_operators_table = "";

/* ___ initiate the call properties ___ */
var vectorOfCallProperties = new Array();
tOption = new Option("", "");
vectorOfCallProperties.push(tOption);
tOption = new Option("ANI", "ANI");
vectorOfCallProperties.push(tOption);
tOption = new Option("DNID", "DNID");
vectorOfCallProperties.push(tOption);
tOption = new Option("CALLDATE", "CALLDATE");
vectorOfCallProperties.push(tOption);
tOption = new Option("CALLTIME", "CALLTIME");
vectorOfCallProperties.push(tOption);

/*___*/

/* ___ initiate the custom server modules properties ___ */
var vectorOfCustomServerModulesFucntions = new Array();


/* 
 * changeClassTo(): Just change the stylesheet class of an object to an other class
 * Parameters: newClassName [the new obj class], Obj[the object that style class will change]
 * Return value: None
 */
function changeClassTo(newClassName, Obj)
{
	Obj.className = newClassName;
}

/* 
 * refreshDiagramInside():  Clean the whole diagram and display a new one with informations in vectors
 * Parameters: None
 * Return value: None
 */
function refreshDiagramInside()
{
	var diagramInsideObj = document.getElementById('diagramInside');
	diagramInsideObj.innerHTML = "";
	var i;
	
	for(i = 0; i < vectorCallConditions.length; i++)
	{				
		diagramInsideObj.innerHTML += vectorCallConditions[i].buildHTML();			
	}		
	for(i = 0; i < vectorAgentPickupMethods.length; i++)
	{
		diagramInsideObj.innerHTML += vectorAgentPickupMethods[i].buildHTML();
	}
	for(i = 0; i < vectorPriorityIncrement.length; i++)
	{
		diagramInsideObj.innerHTML += vectorPriorityIncrement[i].buildHTML();
	}
	for(i = 0; i < vectorCallEnding.length; i++)
	{
		diagramInsideObj.innerHTML += vectorCallEnding[i].buildHTML();
	}		
	for(i = 0; i < vectorPbxExec.length; i++)
	{			
		diagramInsideObj.innerHTML += vectorPbxExec[i].buildHTML();
	}
	for(i = 0; i < vectorGetDtmf.length; i++)
	{			
		diagramInsideObj.innerHTML += vectorGetDtmf[i].buildHTML();
	}
	for(i = 0; i < vectorSqlQueries.length; i++)
	{			
		diagramInsideObj.innerHTML += vectorSqlQueries[i].buildHTML();
	}
	for(i = 0; i < vectorSwitchCases.length; i++)
	{			
		diagramInsideObj.innerHTML += vectorSwitchCases[i].buildHTML();
	}
	for(i = 0; i < vectorCounterBox.length; i++)
	{			
		diagramInsideObj.innerHTML += vectorCounterBox[i].buildHTML();
	}
	for(i = 0; i < vectorGetStatisticBox.length; i++)
	{
		diagramInsideObj.innerHTML += vectorGetStatisticBox[i].buildHTML();
	}
	for(i = 0; i < vectorCustomServer.length; i++)
	{
		diagramInsideObj.innerHTML += vectorCustomServer[i].buildHTML();
	}
		
	
	for(i = 0; i < vectorLinks.length; i++)
	{
		vectorLinks[i].setMembers();
		diagramInsideObj.innerHTML += vectorLinks[i].buildHTML();
	}
		
	//Make the save button available or not...
	if(scriptHasBeenModified)
	{
		document.getElementById('saveIMG').src = '../img/save.gif';
		document.getElementById('saveIMG').style.cursor = 'pointer';
	}
	else
	{
		document.getElementById('saveIMG').src = '../img/save_disabled.gif';
		document.getElementById('saveIMG').style.cursor = '';
	}	
}

/* 
 * saveThisScript(): Takes the whole diagram and transform it to a text string to be save in the database
 * Parameters: None
 * Return value: string with tokens
 */
function saveThisScript()
{
	var i; var j;
	var bReturn = true;
	if(scriptHasBeenModified) //Verifi that this diagram is validate and a change has been made
	{
		bReturn = validateWholeSchema();
		if(bReturn)
		{
			displayTmpMessage(""+MultiArray["Saving"][lang]+" ...");  //Display the Saving Tmp Message will help the user wait...
			var buildString = "";
			buildString = Schema_to_String();			
			
			scriptHasBeenModified = false;			
			
				
			
			
			isActiveStr = document.theForm.active_box.checked ? "1" : "0";			
			if(script_dbid != "")
				appletObj.saveRoutingScript(script_dbid, document.theForm.n_script_name.value, isActiveStr, document.theForm.priority.value, buildString);
			else
			{
				appletObj.addRoutingScript(tenantDBID, document.theForm.n_script_name.value, isActiveStr, document.theForm.priority.value, buildString);
				/*while( String(appletObj.getScriptDBIDByName(document.theForm.n_script_name.value, tenantDBID)) == "")
				{
					setTimeout('', 500); //
				} 
				script_dbid = appletObj.getScriptDBIDByName(document.theForm.n_script_name.value, tenantDBID);*/
				document.location.href = '../defaultpage.htm';
				
			}
			
			refreshDiagramInside();	//No need to display the whole diagram again
		}
		retrieveTmpMessage(); 	//Retrieve the temporal message
		
	}
	
	return bReturn;	
}

function tryToSaveScript()
{
	saveThisScript();	
}
/* 
 * Schema_to_String(): 
 */
function Schema_to_String()
{
	var buildString = "";
	var buildString1="", buildString2="", buildString3="", buildString4="", 
			buildString5="", buildString6="", buildString7="", buildString8="", buildString9 = "",
			buildString10 = "", buildString11 = "", buildString12 = "";
	var i;	var j;
			for(i = 0; i < vectorCallConditions.length; i++)
			{
				buildString1 += 'TYPE=CALLCONDITION';
				buildString1 += '&';
				buildString1 += 'uID='+vectorCallConditions[i].uID;
				buildString1 += '&';
				buildString1 += 'testedPropertyID='+vectorCallConditions[i].testedPropertyID;
				buildString1 += '&';
				buildString1 += 'LinkType='+vectorCallConditions[i].LinkType;
				buildString1 += '&';
				buildString1 += 'seekValue='+vectorCallConditions[i].seekValue;
				buildString1 += '&';
				buildString1 += 'OnSuccess='+vectorCallConditions[i].OnSuccess;
				buildString1 += '&';
				buildString1 += 'OnFailed='+vectorCallConditions[i].OnFailed;
				buildString1 += '&';		
				buildString1 += 'VUID='+vectorCallConditions[i].VUID;
				buildString1 += '&';	
				buildString1 += 'OnSuccessVUID='+vectorCallConditions[i].OnSuccessVUID;
				buildString1 += '&';	
				buildString1 += 'OnFailedVUID='+vectorCallConditions[i].OnFailedVUID;	
				buildString1 += '&';	
				buildString1 += 'isStartup='+vectorCallConditions[i].isStartup;
				buildString1 += '&';	
				buildString1 += 'xPos='+vectorCallConditions[i].xPos;
				buildString1 += '&';
				buildString1 += 'yPos='+vectorCallConditions[i].yPos;
				buildString1 += '^';
			}
			if(buildString1.length >= 1)
				buildString1 = buildString1.substring(0, buildString1.length-1);
				
			for(i = 0; i < vectorAgentPickupMethods.length; i++)
			{
				buildString2 += 'TYPE=AGENTPICKUP';
				buildString2 += '&';
				buildString2 += 'uID='+vectorAgentPickupMethods[i].uID;
				buildString2 += '&';
				buildString2 += 'xPos='+vectorAgentPickupMethods[i].xPos;
				buildString2 += '&';
				buildString2 += 'yPos='+vectorAgentPickupMethods[i].yPos;
				buildString2 += '&';			
				var input = vectorAgentPickupMethods[i].havingClause;			
				buildString2 += 'havingClause='+ExpressiontoXML(input);		//Transform the logical expression in XML
				buildString2 += '&';
				buildString2 += 'tieBreaker='+vectorAgentPickupMethods[i].tieBreaker;
				buildString2 += '&';
				buildString2 += 'timeOut='+vectorAgentPickupMethods[i].timeOut;
				buildString2 += '&';
				buildString2 += 'OnTimeOutAction='+vectorAgentPickupMethods[i].OnTimeOutAction;
				buildString2 += '&';
				buildString2 += 'OnTimeOut_uID='+vectorAgentPickupMethods[i].OnTimeOut_uID;
				buildString2 += '&';
				buildString2 += 'OnTimeOut_Type='+vectorAgentPickupMethods[i].OnTimeOut_Type;
				buildString2 += '&';
				buildString2 += 'CallPriority='+ (11-vectorAgentPickupMethods[i].CallPriority); //Flip the call priority (For the user, a less priority means a higher probability to talk to an agent)
				buildString2 += '&';
				buildString2 += 'VUID='+ vectorAgentPickupMethods[i].VUID;
				buildString2 += '&';
				buildString2 += 'OnTimeOutVUID='+ vectorAgentPickupMethods[i].OnTimeOutVUID;
				buildString2 += '&';
				buildString2 += 'queueName='+ vectorAgentPickupMethods[i].queueName;			//The virtual queue name
				buildString2 += '&';	
				buildString2 += 'url='+ replaceUrlSpecChars(vectorAgentPickupMethods[i].url);	//Replace special characters 
				buildString2 += '&';
				buildString2 += 'active_queue_announcements='+ vectorAgentPickupMethods[i].active_queue_announcements;
				buildString2 += '&';
				buildString2 += 'announce_queue_pos='+ vectorAgentPickupMethods[i].announce_queue_pos;
				buildString2 += '&';
				buildString2 += 'announce_estimated_holdtime='+ vectorAgentPickupMethods[i].announce_estimated_holdtime;
				buildString2 += '&';
				buildString2 += 'announce_frequency='+ vectorAgentPickupMethods[i].announce_frequency;
				buildString2 += '&';
				buildString2 += 'startwithannouncements='+ vectorAgentPickupMethods[i].startwithannouncements;
				buildString2 += '&';
				buildString2 += 'voicemess_you_are='+ vectorAgentPickupMethods[i].voicemess_you_are;
				buildString2 += '&';
				buildString2 += 'voicemess_thereare='+ vectorAgentPickupMethods[i].voicemess_thereare;
				buildString2 += '&';
				buildString2 += 'voicemess_callwaitings='+ vectorAgentPickupMethods[i].voicemess_callwaitings;
				buildString2 += '&';
				buildString2 += 'voicemess_holdtime='+ vectorAgentPickupMethods[i].voicemess_holdtime;
				buildString2 += '&';
				buildString2 += 'voicemess_minutes='+ vectorAgentPickupMethods[i].voicemess_minutes;
				buildString2 += '&';
				buildString2 += 'voicemess_thanksyouforyourpatience='+ vectorAgentPickupMethods[i].voicemess_thanksyouforyourpatience;
				buildString2 += '&';
				buildString2 += 'caller_exitkeys='+ vectorAgentPickupMethods[i].caller_exitkeys;
				buildString2 += '^';			
			}
			if(buildString2.length >= 1)
				buildString2 = buildString2.substring(0, buildString2.length-1);
				
			
			for(i = 0; i < vectorCallEnding.length; i++)
			{
				buildString4 += 'TYPE=CALLENDING';
				buildString4 += '&';
				buildString4 += 'uID='+vectorCallEnding[i].uID;
				buildString4 += '&';
				buildString4 += 'action='+vectorCallEnding[i].action;
				buildString4 += '&';
				buildString4 += 'params='+vectorCallEnding[i].params;
				buildString4 += '&';
				buildString4 += 'VUID='+vectorCallEnding[i].VUID;
				buildString4 += '&';
				buildString4 += 'xPos='+vectorCallEnding[i].xPos;
				buildString4 += '&';
				buildString4 += 'yPos='+vectorCallEnding[i].yPos;
				buildString4 += '^';
			}
			if(buildString4.length >= 1)
				buildString4 = buildString4.substring(0, buildString4.length-1);
			
			for(i = 0; i < vectorPriorityIncrement.length; i++)
			{
				buildString5 += 'TYPE=CALLINCREMENT';
				buildString5 += '&';
				buildString5 += 'uID='+vectorPriorityIncrement[i].uID;
				buildString5 += '&';
				buildString5 += 'Increment='+vectorPriorityIncrement[i].Increment;
				buildString5 += '&';
				buildString5 += 'next='+vectorPriorityIncrement[i].next;
				buildString5 += '&';				
				buildString5 += 'VUID='+vectorPriorityIncrement[i].VUID;
				buildString5 += '&';
				buildString5 += 'nextVUID='+vectorPriorityIncrement[i].nextVUID;
				buildString5 += '&';
				buildString5 += 'xPos='+vectorPriorityIncrement[i].xPos;
				buildString5 += '&';
				buildString5 += 'yPos='+vectorPriorityIncrement[i].yPos;
				buildString5 += '^';
			}
			if(buildString5.length >= 1)
				buildString5 = buildString5.substring(0, buildString5.length-1);
				
			for(i = 0; i < vectorPbxExec.length; i++)
			{
				buildString6 += 'TYPE=PBXEXEC';	
				buildString6 += '&';
				buildString6 += 'uID='+vectorPbxExec[i].uID;
				buildString6 += '&';			
				buildString6 += 'VUID='+vectorPbxExec[i].VUID;
				buildString6 += '&';
				buildString6 += 'next='+vectorPbxExec[i].next;
				buildString6 += '&';
				buildString6 += 'nextVUID='+vectorPbxExec[i].nextVUID;
				buildString6 += '&';
				buildString6 += 'xPos='+vectorPbxExec[i].xPos;
				buildString6 += '&';
				buildString6 += 'yPos='+vectorPbxExec[i].yPos;
				buildString6 += '&';
				for(j = 0; j < vectorPbxExec[i].vectorApps.length; j++) //For each application of this PbxExec
				{
					buildString6 += 'action='+vectorPbxExec[i].vectorApps[j];
					buildString6 += '&';
					buildString6 += 'params='+vectorPbxExec[i].vectorParams[j];
					buildString6 += '&';				
				}			
				buildString6 = buildString6.substring(0, buildString6.length-1);
				buildString6 += '^';
			}
			if(buildString6.length >= 1)
				buildString6 = buildString6.substring(0, buildString6.length-1);
				
			
			for(i = 0; i < vectorGetDtmf.length; i++)
			{
				buildString7 += 'TYPE=GETDTMF';	
				buildString7 += '&';
				buildString7 += 'uID='+vectorGetDtmf[i].uID;
				buildString7 += '&';			
				buildString7 += 'VUID='+vectorGetDtmf[i].VUID;
				buildString7 += '&';
				buildString7 += 'next='+vectorGetDtmf[i].next;
				buildString7 += '&';
				buildString7 += 'nextVUID='+vectorGetDtmf[i].nextVUID;
				buildString7 += '&';
				buildString7 += 'variable_name='+vectorGetDtmf[i].variable_name;
				buildString7 += '&';
				buildString7 += 'maxlength='+vectorGetDtmf[i].maxlength;
				buildString7 += '&';
				buildString7 += 'defaultvalue='+vectorGetDtmf[i].defaultvalue;
				buildString7 += '&';
				buildString7 += 'timeout='+vectorGetDtmf[i].timeout;
				buildString7 += '&';
				buildString7 += 'voicemessage='+vectorGetDtmf[i].voicemessage;
				buildString7 += '&';
				buildString7 += 'enders='+vectorGetDtmf[i].enders;
				buildString7 += '&';
				buildString7 += 'xPos='+vectorGetDtmf[i].xPos;
				buildString7 += '&';
				buildString7 += 'yPos='+vectorGetDtmf[i].yPos;
				buildString7 += '^';		
			}		
			if(buildString7.length >= 1)
				buildString7 = buildString7.substring(0, buildString7.length-1);
				
			for(i = 0; i < vectorSqlQueries.length; i++)
			{
				buildString8 += 'TYPE=SQLQUERY';	
				buildString8 += '&';
				buildString8 += 'uID='+vectorSqlQueries[i].uID;
				buildString8 += '&';			
				buildString8 += 'VUID='+vectorSqlQueries[i].VUID;
				buildString8 += '&';
				buildString8 += 'next='+vectorSqlQueries[i].next;
				buildString8 += '&';
				buildString8 += 'nextVUID='+vectorSqlQueries[i].nextVUID;
				buildString8 += '&';
				buildString8 += 'sql_query='+vectorSqlQueries[i].sql_query;
				buildString8 += '&';
				buildString8 += 'res_name='+vectorSqlQueries[i].res_name;
				buildString8 += '&';
				buildString8 += 'xPos='+vectorSqlQueries[i].xPos;
				buildString8 += '&';
				buildString8 += 'yPos='+vectorSqlQueries[i].yPos;
				buildString8 += '^';			
			}
			if(buildString8.length >= 1)
				buildString8 = buildString8.substring(0, buildString8.length-1);
				
			for(i = 0; i < vectorSwitchCases.length; i++)
			{
				buildString9 += 'TYPE=SWITCHCASE';	
				buildString9 += '&';
				buildString9 += 'uID='+vectorSwitchCases[i].uID;
				buildString9 += '&';			
				buildString9 += 'VUID='+vectorSwitchCases[i].VUID;
				buildString9 += '&';
				buildString9 += 'testedPropertyID='+vectorSwitchCases[i].testedPropertyID;
				buildString9 += '&';
				buildString9 += 'onDefault='+vectorSwitchCases[i].onDefault;
				buildString9 += '&';
				buildString9 += 'onDefaultVUID='+vectorSwitchCases[i].onDefaultVUID;
				buildString9 += '&';
				buildString9 += 'xPos='+vectorSwitchCases[i].xPos;
				buildString9 += '&';
				buildString9 += 'yPos='+vectorSwitchCases[i].yPos;
				buildString9 += '&';
				for(j = 0; j < vectorSwitchCases[i].LinkTypeArray.length; j++) //For each application of this PbxExec
				{
					buildString9 += 'LinkType='+vectorSwitchCases[i].LinkTypeArray[j];
					buildString9 += '&';					
					buildString9 += 'OnSuccessVUID='+vectorSwitchCases[i].OnSuccessVUIDArray[j];
					buildString9 += '&';
					buildString9 += 'OnSuccess='+vectorSwitchCases[i].OnSuccessArray[j];
					buildString9 += '&';
					buildString9 += 'SeekValue='+vectorSwitchCases[i].seekValueArray[j];
					buildString9 += '&';
				}			
				buildString9 = buildString9.substring(0, buildString9.length-1);
				buildString9 += '^';
			}
			if(buildString9.length >= 1)
				buildString9 = buildString9.substring(0, buildString9.length-1);
			
			for(i = 0; i < vectorCounterBox.length; i++)
			{
				buildString10 += vectorCounterBox[i].buildString();
			}
			if(buildString10.length >= 1)
				buildString10 = buildString10.substring(0, buildString10.length-1);
			
			for(i = 0; i < vectorGetStatisticBox.length; i++)
			{
				buildString11 += vectorGetStatisticBox[i].buildString();
			}
			if(buildString11.length >= 1)
				buildString11 = buildString11.substring(0, buildString11.length-1);
				
			for(i = 0; i < vectorCustomServer.length; i++)
			{
				buildString12 += vectorCustomServer[i].buildString();
			}
			if(buildString12.length >= 1)
				buildString12 = buildString12.substring(0, buildString12.length-1);
			
			
			
			//Store link also will help to quickly display them... Links are not parse par the CTI	
			for(i = 0; i < vectorLinks.length; i++)
			{
				buildString3 += 'TYPE=LINK';
				buildString3 += '&';
				buildString3 += 'uID='+vectorLinks[i].uID;
				buildString3 += '&';
				buildString3 += 'xFrom='+vectorLinks[i].xFrom;
				buildString3 += '&';
				buildString3 += 'yFrom='+vectorLinks[i].yFrom;
				buildString3 += '&';
				buildString3 += 'xTo='+vectorLinks[i].xTo;
				buildString3 += '&';
				buildString3 += 'yTo='+vectorLinks[i].yTo;
				buildString3 += '&';
				buildString3 += 'color='+vectorLinks[i].color;
				buildString3 += '&';
				buildString3 += 'width='+vectorLinks[i].width;
				buildString3 += '&';
				buildString3 += 'startID='+vectorLinks[i].startID;
				buildString3 += '&';
				buildString3 += 'startVUID='+vectorLinks[i].startVUID;
				buildString3 += '&';
				buildString3 += 'startOn='+vectorLinks[i].startOn;
				buildString3 += '&';
				buildString3 += 'endID='+vectorLinks[i].endID;
				buildString3 += '&';
				buildString3 += 'endVUID='+vectorLinks[i].endVUID;
				buildString3 += '&';
				buildString3 += 'startType='+vectorLinks[i].startType ;
				buildString3 += '&';
				buildString3 += 'endType='+vectorLinks[i].endType;	
				buildString3 += '^';			
			}
			if(buildString3.length >= 1)
				buildString3 = buildString3.substring(0, buildString3.length-1);
			
				
			//Merge all strings
			if(buildString1.length >= 1)
				buildString = buildString1+'^';
			if(buildString2.length >= 1)
				buildString += buildString2+'^';
			if(buildString4.length >= 1)
				buildString += buildString4+'^';
			if(buildString5.length >= 1)
				buildString += buildString5+'^';
			if(buildString6.length >= 1)
				buildString += buildString6+'^';
			if(buildString7.length >= 1)
				buildString += buildString7+'^';
			if(buildString8.length >= 1)
				buildString += buildString8+'^';
			if(buildString9.length >= 1)
				buildString += buildString9+'^';
			if(buildString10.length >= 1)
				buildString += buildString10+'^';
			if(buildString11.length >= 1)
				buildString += buildString11+'^';
			if(buildString12.length >= 1)
				buildString += buildString12+'^'
			if(buildString3.length >= 1)
				buildString += buildString3;
	
	return buildString;	
}

/* 
 * String_to_Schema(): Parse and Transform a raw string into a human readable schema
 * Parameters: wholeString [the string that will be parse]
 * Return value: None 
 */
function String_to_Schema(wholeString)
{
	var i;
	var j;
	splitedString = wholeString.split('^');
	var rootNoddle, rootNoddle2; //XML parsers
	for(i = 0; i < splitedString.length; i++)
	{		
		curElement = splitedString[i];		
		myElementTable = StringParse(curElement);
		
		if( myElementTable['xPos'] )
			if( myElementTable['xPos'].length > 1 )
					if ( myElementTable['xPos'].charAt(0) == '-')
							myElementTable['xPos'] = "0px";

		if( myElementTable['yPos'] )
				if( myElementTable['yPos'].length > 1 )
						if ( myElementTable['yPos'].charAt(0) == '-')
								myElementTable['yPos'] = "0px";
								
		switch(myElementTable['TYPE'])
		{
			case "CALLCONDITION":
				tmp = new CallConditionTest();
				tmp.uID = myElementTable['uID'];
				tmp.testedPropertyID = myElementTable['testedPropertyID'];
				tmp.LinkType = myElementTable['LinkType']; //Link between testedPropertyID and seekValue (eg. ==, >, < etc...)
				tmp.seekValue = myElementTable['seekValue'];
				tmp.OnSuccess = myElementTable['OnSuccess'];
				tmp.OnFailed = myElementTable['OnFailed'];
				tmp.xPos = myElementTable['xPos'];
				tmp.yPos = myElementTable['yPos'];
				tmp.VUID = myElementTable['VUID'];
				tmp.OnSuccessVUID = myElementTable['OnSuccessVUID'];
				tmp.OnFailedVUID = myElementTable['OnFailedVUID'];
				if(parseInt(myElementTable['uID']) > nbCCCreated)
					nbCCCreated = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				
				vectorCallConditions.push(tmp);			
				
				addAddExtraData(tmp.testedPropertyID); //Build list of Call variables
				
			break;
			
			case "AGENTPICKUP":
				tmp = new agentPickUpMethod();
				tmp.uID = myElementTable['uID'];
				tmp.xPos = myElementTable['xPos'];
				tmp.yPos = myElementTable['yPos'];					
				rootNoddle = Xparse(myElementTable['havingClause']);				
				tmp.havingClause = XMLtoExpression(rootNoddle);				
				tmp.tieBreaker = myElementTable['tieBreaker'];
				tmp.timeOut = myElementTable['timeOut'];
				tmp.OnTimeOutAction = myElementTable['OnTimeOutAction'];
				tmp.OnTimeOut_uID = myElementTable['OnTimeOut_uID'];	
				tmp.OnTimeOut_Type = myElementTable['OnTimeOut_Type'];					
				tmp.CallPriority = ( 11-myElementTable['CallPriority'] );
				tmp.VUID = myElementTable['VUID'];
				tmp.OnTimeOutVUID = myElementTable['OnTimeOutVUID'];				
				tmp.url = putUrlSpecChars(myElementTable['url']);
				tmp.queueName = myElementTable['queueName'];
				tmp.active_queue_announcements = myElementTable['active_queue_announcements'];
				tmp.announce_queue_pos = myElementTable['announce_queue_pos'];
				tmp.announce_estimated_holdtime = myElementTable['announce_estimated_holdtime'];
				tmp.announce_frequency = myElementTable['announce_frequency'];
				tmp.startwithannouncements = myElementTable['startwithannouncements'];
				tmp.voicemess_you_are = myElementTable['voicemess_you_are'];
				tmp.voicemess_thereare = myElementTable['voicemess_thereare'];
				tmp.voicemess_callwaitings = myElementTable['voicemess_callwaitings'];
				tmp.voicemess_holdtime = myElementTable['voicemess_holdtime'];
				tmp.voicemess_minutes = myElementTable['voicemess_minutes'];
				tmp.voicemess_thanksyouforyourpatience = myElementTable['voicemess_thanksyouforyourpatience'];
				tmp.caller_exitkeys = myElementTable['caller_exitkeys'];
				if(parseInt(myElementTable['uID']) > nbPMCreated)
					nbPMCreated = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);				
				vectorAgentPickupMethods.push(tmp);			
			break;
			
			case "CALLENDING":
				tmp = new CallEnding();
				tmp.uID = myElementTable['uID'];
				tmp.xPos = myElementTable['xPos'];
				tmp.yPos = myElementTable['yPos'];
				tmp.action = myElementTable['action'];
				tmp.params = myElementTable['params'];
				tmp.VUID = myElementTable['VUID'];
				if(parseInt(myElementTable['uID']) > nbCECreated)
					nbCECreated = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				vectorCallEnding.push(tmp);				
			break;
			
			case "CALLINCREMENT":
				tmp = new PriorityInc();
				tmp.uID = myElementTable['uID'];
				tmp.Increment = myElementTable['Increment'];
				tmp.next = myElementTable['next'];
				tmp.xPos = myElementTable['xPos'];
				tmp.yPos = myElementTable['yPos'];
				tmp.VUID = myElementTable['VUID'];
				tmp.nextVUID = myElementTable['nextVUID'];
				if(parseInt(myElementTable['uID']) > nbPriorityInc)
					nbPriorityInc = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				vectorPriorityIncrement.push(tmp);							
			break;
			
			case "PBXEXEC":
				tmp = new PbxExec();
				tmp.uID	= myElementTable['uID'];
				tmp.VUID = myElementTable['VUID'];
				tmp.xPos = myElementTable['xPos'];
				tmp.yPos = myElementTable['yPos'];
				tmp.next = myElementTable['next'];
				tmp.nextVUID = myElementTable['nextVUID'];
				apps_chars = curElement.substring("TYPE=PBXEXEC".length+
												  "uID=".length+
												  tmp.uID.length+
												  "VUID=".length+
												  tmp.VUID.length+
												  "xPos=".length+
												  tmp.xPos.length+
												  "yPos=".length+
												  tmp.yPos.length+
												  "next=".length+
												  tmp.next.length+
												  "nextVUID=".length+												  
												  tmp.nextVUID.length+7*"&".length);				
				apps_pars = apps_chars.split('&');
				var nbApps = 0;
				for(j = 0; j < apps_pars.length; j++)
				{
					//alert('apps_pars[j]='+apps_pars[j]);
					splequal = apps_pars[j].split('=');
					if(splequal[0] == "action")
						tmp.vectorApps[nbApps] = splequal[1];
					else if(splequal[0] == "params")
					{
						tmp.vectorParams[nbApps] = apps_pars[j].substring("params=".length); //splequal[1];
						nbApps++;
					}
				}
				if(parseInt(myElementTable['uID']) > nbPbxExec)
					nbPbxExec = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				vectorPbxExec.push(tmp);
			break;
			
			case "GETDTMF":
				tmp = new GetDtmf();
				tmp.uID	= myElementTable['uID'];
				tmp.VUID = myElementTable['VUID'];
				tmp.xPos = myElementTable['xPos'];
				tmp.yPos = myElementTable['yPos'];
				tmp.next = myElementTable['next'];
				tmp.nextVUID = myElementTable['nextVUID'];
				tmp.variable_name 	= myElementTable['variable_name'];
				tmp.maxlength		= myElementTable['maxlength'];
				tmp.defaultvalue 	= myElementTable['defaultvalue'];
				tmp.timeout 		= myElementTable['timeout'];
				tmp.voicemessage 	= myElementTable['voicemessage'];
				tmp.enders			= myElementTable['enders'];
				if(parseInt(myElementTable['uID']) > nbDTCreated)
					nbDTCreated = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				vectorGetDtmf.push(tmp);			
				addAddExtraData(tmp.variable_name);
			break;
			
			case "SQLQUERY":
				tmp = new SqlQuery();
				tmp.uID			= myElementTable['uID'];
				tmp.VUID 		= myElementTable['VUID'];
				tmp.xPos 		= myElementTable['xPos'];
				tmp.yPos 		= myElementTable['yPos'];
				tmp.next 		= myElementTable['next'];
				tmp.nextVUID 	= myElementTable['nextVUID'];
				tmp.sql_query 	= myElementTable['sql_query'];
				tmp.res_name	= myElementTable['res_name'];				
				if(tmp.res_name  != "") //Build list of Call variables
				{
					for(var j = 0; j < nbFieldsInQuery(tmp.sql_query); j++ )
						addAddExtraData(tmp.res_name+'['+j+']');
				}
				if(parseInt(myElementTable['uID']) > nbSQCreated)
					nbSQCreated 	= parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				vectorSqlQueries.push(tmp);				
				//addAddExtraData(tmp.res_name);
			break;
			
			case "SWITCHCASE":				
				tmp = new SwitchCase();
				tmp.uID	= myElementTable['uID'];
				tmp.VUID = myElementTable['VUID'];
				tmp.testedPropertyID = myElementTable['testedPropertyID'];
				tmp.xPos = myElementTable['xPos'];
				tmp.yPos = myElementTable['yPos'];
				tmp.onDefault = myElementTable['onDefault'];
				tmp.onDefaultVUID = myElementTable['onDefaultVUID'];
				apps_chars = curElement.substring("TYPE=SWITCHCASE".length+
												  "uID=".length+
												  tmp.uID.length+
												  "VUID=".length+
												  tmp.VUID.length+
												  "testedPropertyID=".length+
												  tmp.testedPropertyID.length+
												  "xPos=".length+
												  tmp.xPos.length+
												  "yPos=".length+
												  tmp.yPos.length+
												  "onDefault=".length+
												  tmp.onDefault.length+
												  "onDefaultVUID=".length+												  
												  tmp.onDefaultVUID.length+
												  8*"&".length);				
				//alert('apps_chars='+apps_chars);
				apps_pars = apps_chars.split('&');
				var nbApps = 0;
				for(j = 0; j < apps_pars.length; j++)
				{
					
					splequal = new Array();
					var firstPlaceOfEqual =  apps_pars[j].indexOf('=');					
					splequal[0] = apps_pars[j].substring(0, firstPlaceOfEqual);
					splequal[1] = apps_pars[j].substring(firstPlaceOfEqual+1, apps_pars[j].length);
					//apps_pars[j].split('=');
					//alert('splequal[0]='+splequal[0]);
					if(splequal[0] == "LinkType")
						tmp.LinkTypeArray[nbApps] = splequal[1];
					if(splequal[0] == "OnSuccessVUID")
						tmp.OnSuccessVUIDArray[nbApps] = splequal[1];
					if(splequal[0] == "OnSuccess")
						tmp.OnSuccessArray[nbApps] = splequal[1];
					else if(splequal[0] == "SeekValue")
					{
						tmp.seekValueArray[nbApps] = apps_pars[j].substring("SeekValue=".length); //splequal[1];
						nbApps++;
					}
				}
				if(parseInt(myElementTable['uID']) > nbSCCreated)
					nbSCCreated = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				vectorSwitchCases.push(tmp);
				addAddExtraData(tmp.testedPropertyID);
			
			break;
			
			case "COUNTERBOX":
				tmp = new CounterBox();
				tmp.uID = myElementTable['uID'];
				tmp.xPos = myElementTable['xPos'];
				tmp.yPos = myElementTable['yPos'];
				tmp.variable_name = myElementTable['variable_name'];
				tmp.attachedto = myElementTable['attachedto'];
				tmp.VUID = myElementTable['VUID'];
				tmp.next = myElementTable['next'];
				tmp.nextVUID = myElementTable['nextVUID'];
				if(parseInt(myElementTable['uID']) > nbCounterBox)
					nbCounterBox = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				vectorCounterBox.push(tmp);
			break;
			
			case "GETSTATISTIC":
				tmp = new GetStatistic();
				tmp.uID = myElementTable['uID'];
				tmp.xPos = myElementTable['xPos'];
				tmp.yPos = myElementTable['yPos'];
				tmp.statType = myElementTable['statType'];
				if(tmp.statType == "GROUP_TOTAL_WAITING_AGENTS" || tmp.statType == "GROUP_TOTAL_LOGIN_AGENTS" || 
				   tmp.statType == "GROUP_TOTAL_CONFIGURED_AGENTS" || tmp.statType == "GROUP_BUSY_FACTOR_GROUP") //data = HavingSkill, send it in XML Format
				{
					rootNoddle2 = Xparse(myElementTable['data']);
					tmp.data = XMLtoExpression(rootNoddle2);					
				}
				else
				{
					tmp.data = myElementTable['data'];
				}				
				tmp.VUID = myElementTable['VUID'];
				tmp.OnNextVUID = myElementTable['OnNextVUID'];
				tmp.OnNext = myElementTable['OnNext'];
				tmp.variableName = myElementTable['variableName'];
				if(parseInt(myElementTable['uID']) > nbGetStatBox)
					nbGetStatBox = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				vectorGetStatisticBox.push(tmp);
				addAddExtraData(tmp.variableName);
			break;
			
			case "CUSTOMSERVER":
				tmp 				= new CustomServer();
				tmp.uID 			= myElementTable['uID'];
				tmp.xPos 			= myElementTable['xPos'];
				tmp.yPos 			= myElementTable['yPos'];
				tmp.VUID 			= myElementTable['VUID'];
				tmp.OnNextVUID 		= myElementTable['OnNextVUID'];
				tmp.OnNext 			= myElementTable['OnNext'];
				tmp.module 			= myElementTable['module'];
				tmp.function_name 	= myElementTable['function_name'];
				tmp.params 			= myElementTable['params'];
				if(parseInt(myElementTable['uID']) > nbCSCreated)
					nbCSCreated = parseInt(myElementTable['uID']);
				if(parseInt(myElementTable['VUID']) > nbScrpElementCreated)
					nbScrpElementCreated = parseInt(myElementTable['VUID']);
				vectorCustomServer.push(tmp);
			break;
			
			case "LINK":
				tmp = new ConnexionArrow();
				tmp.uID = myElementTable['uID'];
				tmp.xFrom = myElementTable['xFrom'];
				tmp.yFrom = myElementTable['yFrom'];
				tmp.xTo = myElementTable['xTo'];
				tmp.yTo = myElementTable['yTo'];
				tmp.color = myElementTable['color'];
				tmp.width = myElementTable['width'];
				tmp.startID = myElementTable['startID'];
				tmp.startOn = myElementTable['startOn'];
				tmp.endID = myElementTable['endID'];
				tmp.startType = myElementTable['startType'];
				tmp.endType = myElementTable['endType'];
				tmp.startVUID = myElementTable['startVUID'];
				tmp.endVUID = myElementTable['endVUID'];
				if(parseInt(myElementTable['uID']) > nbLnkCreated)
					nbLnkCreated = parseInt(myElementTable['uID']);				
				vectorLinks.push(tmp);
			break;		
			
		
		}
	}
		
}

/* 
 * onDocClickHandle(): Define all functions that will be call if user clicks anyway in the document
 * Parameters: None
 * Return value: None
 */
function onDocClickHandle()
{
	//Unselect an arrow who could be selected
	//unselectThisArrow(); 
}



/* 
 * StringParse(): Take a list of key-value as string and transform them to an array. ex: abcd=4&efgh=80  ==> stringElements[abcd]=4; stringElements[efgh]=80 
 * Parameters: tobeParsed. The string that will be parse
 * Return value: an associative array key-value
 */
function StringParse(tobeParsed)
{
	stringElements = new Array();
	
	var pairs = tobeParsed.split("&");	//split by the token
	
	for (var i=0;i<pairs.length;i++)	//For each pair, split by the =
	{
		var pos = pairs[i].indexOf('=');
		if (pos >= 0)
		{
			var argname = pairs[i].substring(0,pos);
			var value = pairs[i].substring(pos+1);
			stringElements[argname] = value;			
		}
	}	
	return stringElements;
}

/* 
 * validateWholeSchema(): Help the user to correct possible exceptions
 * Parameters: None
 * Return value: True if the whle schema is valide and false otherwise
 */
function validateWholeSchema()
{
	displayTmpMessage(""+MultiArray["Validating diagram"][lang]+"..."); //Display a temporal message
	var tmpBool;
	
	//Make sure we have a script name ...
	if(document.theForm.n_script_name.value == null || document.theForm.n_script_name.value == "")
	{
	
	
	alert(MultiArray["Error: Specify script name"][lang]);
		retrieveTmpMessage();
		document.theForm.n_script_name.focus();
		return false;
	}
	//Make sure we have a script priority ... 
	if(document.theForm.priority.value == null || document.theForm.priority.value == "")
	{
		alert(MultiArray["Error: Specify script priority"][lang]);
		retrieveTmpMessage();
		document.theForm.priority.focus();
		return false;
	}	
	
	var i;
	//Validate CallConditions	
	for(i = 0; i < vectorCallConditions.length; i++)
	{
		if( !vectorCallConditions[i].validate() ) //des que le ieme n'est pas valide,
			return false;
	}
	//Validate GetDTMFs
	for(i = 0; i < vectorGetDtmf.length; i++)
	{
		if( !vectorGetDtmf[i].validate() ) //des que le ieme n'est pas valide,
			return false;
	}
	//Validate AgentPickupMethods
	for(i = 0; i < vectorAgentPickupMethods.length; i++)
	{
		if( !vectorAgentPickupMethods[i].validate() ) //des que le ieme n'est pas valide,
			return false;		
	}
	//Validate CallEndings
	for(i = 0; i < vectorCallEnding.length; i++)
	{
		if( !vectorCallEnding[i].validate() ) //des que le ieme n'est pas valide,
			return false;		
	}	
	//Validate PBxExec
	for(i = 0; i < vectorPbxExec.length; i++)
	{
		if( !vectorPbxExec[i].validate() ) //des que le ieme n'est pas valide,
			return false;		
	}
	//Validate CallIncrement
	for(i = 0; i < vectorPriorityIncrement.length; i++)
	{
		if( !vectorPriorityIncrement[i].validate() ) //des que le ieme n'est pas valide,
			return false;		
	}
	//Validate SqlQueries
	for(i = 0; i < vectorSqlQueries.length; i++)
	{
		if( !vectorSqlQueries[i].validate() ) //des que le ieme n'est pas valide,
			return false;		
	}
	//Validate SwitchCase
	for(i = 0; i < vectorSwitchCases.length; i++)
	{
		if( !vectorSwitchCases[i].validate() ) //des que le ieme n'est pas valide,
			return false;		
	}
	//Validate CounterBox
	for(i = 0; i < vectorCounterBox.length; i++)
	{
		if( !vectorCounterBox[i].validate() ) //des que le ieme n'est pas valide,
			return false;		
	}
	//Validate CounterBox
	for(i = 0; i < vectorGetStatisticBox.length; i++)
	{
		if( !vectorGetStatisticBox[i].validate() ) //des que le ieme n'est pas valide,
			return false;		
	}
	//Validate CounterBox
	for(i = 0; i < vectorCustomServer.length; i++)
	{
		if( !vectorCustomServer[i].validate() ) //des que le ieme n'est pas valide,
			return false;		
	}
	
	//Validate if we don't have at least one call condition
	if( !valideNotMultipleStartingPoints() )
		return false;
		
	
	
	return true;
}

/* 
 * validateWholeSchema(): Help the user to correct possible exceptions
 * Parameters: None
 * Return value: none... clear the vectorValidationMessage vector and rebuild it
 */
function SoftValidateWholeSchema()
{
	vectorSoftValidationMessage.length = 0; //weird way to clear an array
	var tmpmess;
	
	//Make sure we have a script name ...
	if(document.theForm.n_script_name.value == null || document.theForm.n_script_name.value == "")
	{
		tmpmess = new softValidationMess();
		tmpmess.setMessage("ERROR", "No script name specified.", SOFT_VALIDATION_ERROR_IMG, "document.theForm.n_script_name.focus()");
		vectorSoftValidationMessage.push(tmpmess);
	} else if(document.theForm.n_script_name.value.length >= CONST_SCRIPT_NAME_MAX_LENGHT)
	{
		tmpmess = new softValidationMess();
		tmpmess.setMessage("WARNING", "Script Name cannot exceed "+CONST_SCRIPT_NAME_MAX_LENGHT+" caracters. The name will be truncated.", SOFT_VALIDATION_ERROR_IMG, "");
		vectorSoftValidationMessage.push(tmpmess);
	}
	
	//Make sure we have a script priority ...
	if(document.theForm.priority.value == null || document.theForm.priority.value == "")
	{
		tmpmess = new softValidationMess();
		tmpmess.setMessage("ERROR", "Script priority not specified.", SOFT_VALIDATION_ERROR_IMG, "document.theForm.priority.focus()");
		vectorSoftValidationMessage.push(tmpmess);
	}
	
	var i;
	
	//Validate CallConditions	
	for(i = 0; i < vectorCallConditions.length; i++)
	{		
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorCallConditions[i].softvalidate() );
	}	
	
	//Validate GetDTMFs
	for(i = 0; i < vectorGetDtmf.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorGetDtmf[i].softvalidate() );
	}
	//Validate AgentPickupMethods
	for(i = 0; i < vectorAgentPickupMethods.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorAgentPickupMethods[i].softvalidate() );	
	}
	//Validate CallEndings
	for(i = 0; i < vectorCallEnding.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorCallEnding[i].softvalidate() );
	}	
	//Validate PBxExec
	for(i = 0; i < vectorPbxExec.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorPbxExec[i].softvalidate() );
	}
	//Validate CallIncrement
	for(i = 0; i < vectorPriorityIncrement.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorPriorityIncrement[i].softvalidate() );
	}
	//Validate SqlQueries
	for(i = 0; i < vectorSqlQueries.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorSqlQueries[i].softvalidate() );
	}
	//Validate SwitchCase
	for(i = 0; i < vectorSwitchCases.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorSwitchCases[i].softvalidate() );
	}
	//Validate CounterBox
	for(i = 0; i < vectorCounterBox.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorCounterBox[i].softvalidate() );
	}
	//Validate CounterBox
	for(i = 0; i < vectorGetStatisticBox.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorGetStatisticBox[i].softvalidate() );
	}
	
	//Validate CounterBox
	for(i = 0; i < vectorCustomServer.length; i++)
	{
		vectorSoftValidationMessage = vectorSoftValidationMessage.concat( vectorCustomServer[i].softvalidate() );
	}
	
	vectorSoftValidationMessage = vectorSoftValidationMessage.concat( softvalideNotMultipleStartingPoints() );
}

/* 
 * eraseDiagram(): Erase the whole diagram ... doesn't delete it
 * Parameters: None
 * Return value: None
 */
function eraseDiagram()
{
	var yesno = confirm("Warning:\nYou are about to erase the whole routing script.\nDo you want to continue ?");
	if(yesno)
	{
		backupDiagramNow();
		//Reset all vectors
		vectorLinks = new Array();
		vectorCallConditions = new Array();
		vectorCallEnding = new Array();
		vectorAgentPickupMethods = new Array();		
		vectorPriorityIncrement = new Array();
		vectorPbxExec	= new Array();
		vectorGetDtmf = new Array();
		vectorSqlQueries = new Array();
		vectorSwitchCases = new Array();
		vectorCounterBox = new Array();
		vectorGetStatisticBox = new Array();
				
		//Put back the counters
		nbCCCreated = 0;
		nbLnkCreated = 0;
		nbPMCreated = 0;
		nbCECreated = 0;
		nbPriorityInc = 0;
		nbPbxExec	= 0;
		nbGetDtmf = 0;
		nbSQCreated = 0;
		nbSCCreated = 0;
		nbCounterBox = 0;
		nbGetStatBox = 0;
		nbScrpElementCreated = 0;

		//Reset global variables
		tmpLnkStartID = "";
		tmpLnkEndID = "";
		tmpLnkStartType = "";
		tmpLnkEndType = "";
		tmpLinkCreationStep = 0;
		selectedArrowID = "";
		scriptHasBeenModified = true;
		refreshDiagramInside();
	}
}

/*
**************************************************************************************************
					** Main Menu javascript functions **
**************************************************************************************************
******																						******/
function menu_new_script()
{
	var cango = true;
	if(scriptHasBeenModified)
	{
		var yesno;
		yesno = confirm(MultiArray["The current script has been modified.\nDo you want to save it?"][lang]);
		
		if(yesno)
			cango = saveThisScript();
	}
	
	if(cango)
	{
		var newloc = 'routingScript.htm?tenant_dbid='+tenantDBID+'&tenantName='+tenantName;
		document.location.href = newloc;
	}
}

function menu_new_exit()
{
	var cango = true;
	if(scriptHasBeenModified)
	{
		var yesno;
		yesno = confirm(MultiArray["The current script has been modified.\nDo you want to save it?"][lang]);
		if(yesno)
			cango = saveThisScript();
	}
	
	if(cango)
	{
		var newloc = '../defaultpage.htm';
		document.location.href = newloc;
	}	
}

function menu_validateWholeSchema()
{
	SoftValidateWholeSchema();
	
	var nbErrors = 0, nbWarnings = 0, nbNotices = 0;
	var bHtml = '';
	bHtml += '<table>';	
	for(var i = 0; i < vectorSoftValidationMessage.length; i++)
	{
		bHtml += '<tr>'; 
		bHtml += '<td width="17">';
		if(vectorSoftValidationMessage[i].messImg != "" && vectorSoftValidationMessage[i].messImg != null)
			bHtml += '<img src="'+vectorSoftValidationMessage[i].messImg+'" border="0">';
		bHtml += '</td>';
		bHtml += '<td nowrap align="center" bgcolor="';
		switch(vectorSoftValidationMessage[i].messType)
		{
			case "ERROR":
				bHtml += SOFT_VALIDATION_ERROR_COLOR;
				nbErrors++;
			break;
			case "WARNING":
				bHtml += SOFT_VALIDATION_WARNING_COLOR;
				nbWarnings++;
			break;
			case "NOTICE":
				nbNotices++;
			case "":			
				bHtml += SOFT_VALIDATION_NOTICE_COLOR;				
			break;
		}
		bHtml += '">';
		bHtml += vectorSoftValidationMessage[i].messType+'</td>';
		bHtml += '<td nowrap onclick="closeValidationDiv(); '+vectorSoftValidationMessage[i].clickonme+'" style="cursor:pointer">'+vectorSoftValidationMessage[i].messText+'</td>';
		bHtml += '</tr>';		
	}
	
	bHtml += '<tr><td></td><td></td><td>';
	bHtml += nbErrors+' error';
	if(nbErrors > 1)
		bHtml += 's';
	bHtml +=', '+nbWarnings+' warning';
	if(nbWarnings > 1)
		bHtml += 's';
	bHtml +=', '+nbNotices+ ' notice';
	if(nbNotices > 1)
		bHtml += 's';	
	
	bHtml += '</td></tr>';
	bHtml += '</table>';
	
	var valInsObj = document.getElementById('validationDiv_inside');	
	if(valInsObj)
	{
		valInsObj.innerHTML = bHtml;
		var validationDivObj = document.getElementById('validationDiv');
		if( validationDivObj )
		{
			validationDivObj.style.top = document.body.clientHeight/2-validationDivObj.clientHeight/2;
			validationDivObj.style.left = document.body.clientWidth/2-validationDivObj.clientWidth/2;
			validationDivObj.style.visibility = 'visible';
			
		}
	}
	
}

function popupHelp()
{
	//Documentation...
	var obj = document.getElementById('helppopDiv');
	
	if(obj)
	{
		obj.style.top = document.body.clientHeight/2-obj.clientHeight/2;
		obj.style.left = document.body.clientWidth/2-obj.clientWidth/2;
		obj.style.visibility = "visible";
	}
}

function hideHelp()
{
	//Documentation...
	var obj = document.getElementById('helppopDiv');
	
	if(obj)	
		obj.style.visibility = "hidden";	
	
}

/*
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************
					** Autres Fonctions **
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************
******																						******/

/* 
 * zoomIn(): makes a zoom in a diagram by a factor of 10%
 * Parameters: None
 * Return value: None
 */
function zoomIn() 
{

  if(document.getElementById('dCover').style.zoom == "")
  	document.getElementById('dCover').style.zoom = 1.0;
 
  var newZoom = parseFloat(document.getElementById('dCover').style.zoom)*1.1;  
  document.getElementById('dCover').style.zoom = newZoom;
} 

/* 
 * zoomOut(): makes the zoom out of a diagram by a factor of 10%
 * Parameters: None
 * Return value: None
 */
function zoomOut() 
{
 if(document.getElementById('dCover').style.zoom == "")
  	document.getElementById('dCover').style.zoom = 1.0;
	
 var newZoom = parseFloat(document.getElementById('dCover').style.zoom)*0.9;
 document.getElementById('dCover').style.zoom =newZoom;
}

/* 
 * fit(): Cancel any previous zoom effect
 * Parameters: None
 * Return value: None
 */
function fit()
{
	document.getElementById('dCover').style.zoom = 1.0;
}

/* 
 * chooseSelectObj(): Select a specific option in a select
 * Parameters: objName[ObjectName or identifier] , objValue[Value of the option that will be select]
 * Return value: None
 */
function chooseSelectObj(objName, objValue)
{	
	var objObject = MM_findObj(objName);	
	
	for(var i=0; i<objObject.options.length; i++)
   	{
		
     	if(objObject.options[i].value ==  objValue)
       	{
         	objObject.options[i].selected = true;
			break;			
       	}
   	}
}

/* 
 * deleteWholeDiagram(): This function delete the diagram and send a message to CTI to delete it in the database also
 * Parameters: None
 * Return value: None
 */
function deleteWholeDiagram()
{
	var yesno = confirm(MultiArray["Warning:\nYou are about to delete this routing script.\nDo you want to continue"][lang]);
	if(yesno)
	{
		appletObj.deleteRoutingScript(script_dbid);
		document.location.href = "../defaultpage.htm";
	}
}


/********
Drag and drop functions
**********/
is_opera = (navigator.userAgent.toLowerCase().indexOf("opera") != -1);
var curObj = null; /* current object wich be drag */
var lastDragCCName = "";
var mouseY = 0;	/* mouse X */
var moousX = 0;	/* mouse Y */
var dx = 0;
var dy = 0;

/* 
 * dragThis(): helps to drag an object on the screen
 * Parameters: The obj that will be drag
 * Return value: None
 */
function dragThis(what)
{
	var tmp;
	lastDragCCName = what;
	
	/*
	if (document.all) tmp = document.all[what].style;
	else if (document.getElementById) tmp = document.getElementById(what).style;
	else if (document.layers) tmp=document.layers[what];
	*/
	
	tmp = document.getElementById(what).style;
	curObj = tmp;
	var str = "";
	var i=0;
	str = tmp.left;	/* in ie style.left="12px" and in opere style.left="12" */	
	i= (!is_opera) ? str.substr(0,str.length-2) : str;
	
	dx = mouseX - i;
	str = tmp.top;
	i= (!is_opera) ? str.substr(0,str.length-2) : str;
	dy = mouseY - i;
	
}

/* 
 * mouseMove(): Take mouse coordonates
 * Parameters: e [event]
 * Return value: None
 */
function mouseMove(e)
{
	/*
    mouseX = (document.all)? event.clientX : e.x;
    mouseY = (document.all)? event.clientY : e.y;
	*/
	if (!e) var e = window.event;
	if (e.pageX || e.pageY)
	{
		mouseX = e.pageX;
		mouseY = e.pageY;
	}
	else if (e.clientX || e.clientY)
	{
		mouseX = e.clientX + document.body.scrollLeft;
		mouseY = e.clientY + document.body.scrollTop;
	}
		
    if (curObj)
	{
        curObj.left= ((mouseX - dx) < 0) ? 0 : (mouseX - dx);
        curObj.top = ((mouseY - dy) < 0) ? 0 : (mouseY - dy);
    }
	
}

/* 
 * mouseUp(): Call when the user's mouse comes up... a possible drag end, if it's a drag end, update links...
 * Parameters; None
 * Return value: None
 */
function mouseUp() 
{		
	if(curObj)
		{
			backupDiagramNow();
			var i;
			for(i = 0; i < vectorCallConditions.length; i++)
			{
				divName = "IDCallCondition_"+vectorCallConditions[i].uID;
				if(divName == lastDragCCName)
				{					
					vectorCallConditions[i].xPos = curObj.left;
					vectorCallConditions[i].yPos = curObj.top;	
					ObjDeplaceID = vectorCallConditions[i].uID;
					ObjDeplaceType = "CC";
					break;
				}
			}	
			var k;
			for(k = 0; k < vectorAgentPickupMethods.length; k++)
			{
				divName = "IDPickMethod_"+vectorAgentPickupMethods[k].uID;				
				if(divName == lastDragCCName)
				{
					vectorAgentPickupMethods[k].xPos = curObj.left;
					vectorAgentPickupMethods[k].yPos = curObj.top;	
					ObjDeplaceID = vectorAgentPickupMethods[k].uID;
					ObjDeplaceType = "PM";
					break;
				}
			}
			var m;
			for(m = 0; m < vectorCallEnding.length; m++)
			{
				divName = "IDCallEnding_"+vectorCallEnding[m].uID;				
				if(divName == lastDragCCName)
				{
					vectorCallEnding[m].xPos = curObj.left;
					vectorCallEnding[m].yPos = curObj.top;	
					ObjDeplaceID = vectorCallEnding[m].uID;
					ObjDeplaceType = "CE";
					break;
				}
			}
			var n;
			for(n = 0; n < vectorPbxExec.length; n++)
			{
				divName = "IDPbxExec_"+vectorPbxExec[n].uID;				
				if(divName == lastDragCCName)
				{
					vectorPbxExec[n].xPos = curObj.left;
					vectorPbxExec[n].yPos = curObj.top;	
					ObjDeplaceID = vectorPbxExec[n].uID;
					ObjDeplaceType = "PE";
					break;
				}
			}
			var o;
			for(o = 0; o < vectorPriorityIncrement.length; o++)
			{
				divName = "IDPriority_"+vectorPriorityIncrement[o].uID;				
				if(divName == lastDragCCName)
				{
					vectorPriorityIncrement[o].xPos = curObj.left;
					vectorPriorityIncrement[o].yPos = curObj.top;	
					ObjDeplaceID = vectorPriorityIncrement[o].uID;
					ObjDeplaceType = "PI";
					break;
				}
			}
			var p;
			for(p = 0; p < vectorGetDtmf.length; p++)
			{
				divName = "IDGetDtfm_"+vectorGetDtmf[p].uID;				
				if(divName == lastDragCCName)
				{
					vectorGetDtmf[p].xPos = curObj.left;
					vectorGetDtmf[p].yPos = curObj.top;	
					ObjDeplaceID = vectorGetDtmf[p].uID;
					ObjDeplaceType = "DT";
					break;
				}
			}
			var q;
			for(q = 0; q < vectorSqlQueries.length; q++)
			{
				divName = "IDSqlQuery_"+vectorSqlQueries[q].uID;				
				if(divName == lastDragCCName)
				{
					vectorSqlQueries[q].xPos = curObj.left;
					vectorSqlQueries[q].yPos = curObj.top;						
					ObjDeplaceID = vectorSqlQueries[q].uID;					
					ObjDeplaceType = "SQ";
					break;
				}
			}
			var r;
			for(r = 0; r < vectorSwitchCases.length; r++)
			{
				divName = "IDSwitchCase_"+vectorSwitchCases[r].uID;				
				if(divName == lastDragCCName)
				{
					vectorSwitchCases[r].xPos = curObj.left;
					vectorSwitchCases[r].yPos = curObj.top;						
					ObjDeplaceID = vectorSwitchCases[r].uID;					
					ObjDeplaceType = "SC";
					break;
				}
			}
			var s;
			for(s = 0; s < vectorCounterBox.length; s++)
			{
				divName = "IDCounterBox_"+vectorCounterBox[s].uID;				
				if(divName == lastDragCCName)
				{
					vectorCounterBox[s].xPos = curObj.left;
					vectorCounterBox[s].yPos = curObj.top;						
					ObjDeplaceID = vectorCounterBox[s].uID;					
					ObjDeplaceType = "CO";
					break;
				}
			}
			var t;
			for(t = 0; t < vectorGetStatisticBox.length; t++)
			{
				divName = "IDGetStatistic_"+vectorGetStatisticBox[t].uID;				
				if(divName == lastDragCCName)
				{
					vectorGetStatisticBox[t].xPos = curObj.left;
					vectorGetStatisticBox[t].yPos = curObj.top;						
					ObjDeplaceID = vectorGetStatisticBox[t].uID;					
					ObjDeplaceType = "GS";
					break;
				}
			}
			var u;
			for(u = 0; u < vectorCustomServer.length; u++)
			{
				divName = "IDCustomServer_"+vectorCustomServer[u].uID;				
				if(divName == lastDragCCName)
				{
					vectorCustomServer[u].xPos = curObj.left;
					vectorCustomServer[u].yPos = curObj.top;						
					ObjDeplaceID = vectorCustomServer[u].uID;					
					ObjDeplaceType = "CS";
					break;
				}
			}
			
			var j;
			for(j = 0; j < vectorLinks.length; j++)
			{				
				if( (vectorLinks[j].startID == ObjDeplaceID && vectorLinks[j].startType == ObjDeplaceType) || (vectorLinks[j].endID == ObjDeplaceID && vectorLinks[j].endType == ObjDeplaceType) )
				{
					vectorLinks[j].setMembers();
					//Redisplay this object
					reDisplayObj("Connexion_ID"+vectorLinks[j].uID, vectorLinks[j].buildHTML());
					enableSaving();
				}				
			}
			
			scriptHasBeenModified = true;
			//refreshDiagramInside();			
		}
	curObj = null;	
}
if (document.layers)document.captureEvents(Event.MOUSEMOVE);
document.onmousemove=mouseMove;
document.onmouseup=mouseUp;


/* 
 * enableSaving(): Enable the saving button and make the script ready to be save
 * Parameters: None
 * Return value: None
 */
function enableSaving()
{
	document.getElementById('saveIMG').src = '../img/save.gif';
	document.getElementById('saveIMG').style.cursor = 'pointer';
	scriptHasBeenModified = true;	
}

/* 
 * displayTmpMessage(): Display temporal notice messages
 * Parameters: theMess [Message to be displayed]
 * Return value: None
 */
function displayTmpMessage(theMess)
{
	var TempMsgObj = document.getElementById('TempMsg');
	var TempMessagesObj = document.getElementById('TempMessages');
	TempMsgObj.innerHTML = theMess;	
	TempMessagesObj.style.top = document.body.clientHeight/2-TempMessagesObj.clientHeight/2;
	TempMessagesObj.style.left = document.body.clientWidth/2-TempMessagesObj.clientWidth/2;
	TempMessagesObj.style.visibility = "visible";		
}

/* 
 * retrieveTmpMessage(): removes the displayTmpMessage box
 * Parameters: None
 * Return value: None
 */
function retrieveTmpMessage()
{
	var TempMsgObj = document.getElementById('TempMsg');
	var TempMessagesObj = document.getElementById('TempMessages');
	TempMsgObj.innerHTML = "";
	TempMessagesObj.style.visibility = "hidden";	
}



/* 
 * (): 
 * Parameters
 * Return value: 
 */
function showMasqueIframe(x, y, w, h)
{	
	document.getElementById("iframe_masque").style.top=x;
	document.getElementById("iframe_masque").style.left=y;
	document.getElementById("iframe_masque").style.width=w;
	document.getElementById("iframe_masque").style.height=h;
	document.getElementById("iframe_masque").style.zIndex=799;	
	document.getElementById("iframe_masque").style.display = "inline";		
}

/* 
 * (): 
 * Parameters
 * Return value: 
 */
function hideMasqueIframe()
{
	document.getElementById("iframe_masque").style.display = "none"; 
}

/* 
 * buildSelectFromVector(): create a select object from a vector of strings
 * Parameters: selectObj[the html select object], vectorList[list of strings]
 * Return value: None
 */
function buildSelectFromVector(selectObj, vectorList)
{
	var i;
	var tmp;	
	for(i = 0; i < vectorList.length; i++ )
	{
		tmp = new Option(vectorList[i].text, vectorList[i].value);
		
		selectObj.options[i] = tmp;		
	}
}

/* 
 * addAddExtraData(): add a new variable if not exist to call properties 
 * Parameters: Variable name
 * Return value: None
 */
function addAddExtraData(theValue)
{
	if(!option_already_existInCallProps(theValue))
	{
		var neopp = new Option(theValue, theValue);	
		vectorOfCallProperties.push(neopp);	
	}
}

/* 
 * option_already_existInCallProps(): Indicate if the call property already exist
 * Parameters: Call property
 * Return value: true if yes, false otherwise
 */
function option_already_existInCallProps(theValue)
{
	var bReturn = false;
	var i;
	for(i = 0; i < vectorOfCallProperties.length; i++)
	{
		if(vectorOfCallProperties[i].value == theValue)
		{
			bReturn = true;
			break;
		}		
	}	
	return bReturn;	
}

function MM_findObj(n, d)
{ //v4.01
	  var p,i,x;
	  if(!d) d=document;
	  if((p=n.indexOf("?"))>0&&parent.frames.length)
		{d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all)
		x=d.all[n];
	  for (i=0;!x&&i<d.forms.length;i++)
		x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++)
		x=MM_findObj(n,d.layers[i].document);
	  if(!x && d.getElementById)
		x=d.getElementById(n);
	  return x;
}

function hideAllToolsOptions()
{
	//Hide all others...
	document.getElementById('PMSetupDialog').style.visibility = "hidden";
	document.getElementById('CESetupDialog').style.visibility = "hidden";
	document.getElementById('CCSetupDialog').style.visibility = "hidden";
	document.getElementById('PISetupDialog').style.visibility = "hidden";
	document.getElementById('PESetupDialog').style.visibility = "hidden";
	document.getElementById('DTSetupDialog').style.visibility = "hidden";
	document.getElementById('SQSetupDialog').style.visibility = "hidden";
	document.getElementById('SCSetupDialog').style.visibility = "hidden";
	document.getElementById('COSetupDialog').style.visibility = "hidden";
	document.getElementById('GSSetupDialog').style.visibility = "hidden";
	document.getElementById('CallPropertiesManager').style.visibility = "hidden";
	document.getElementById('helppopDiv').style.visibility = "hidden";
}


function reDisplayObj(objName, newHTML)
{
	var Obj;
	Obj = document.getElementById(objName);
	
	if(Obj)
		Obj.outerHTML = newHTML;	
}

function addNewDivisionToDiagram(divHTML)
{
	var diagramInsideObj = document.getElementById('diagramInside');
	diagramInsideObj.innerHTML += divHTML;
}
/*
	backup and Undo functions
*/
/*
 *  
 *
 */
function backupDiagramNow()
{
	
}



/**
 *
 *
 */
 
function showCallPropsManager()
{
	buildSelectFromVector(document.popUpForm.available_call_props, vectorOfCallProperties);
	var CallPropertiesManagerObj = document.getElementById('CallPropertiesManager');
	CallPropertiesManagerObj.style.top = document.body.clientHeight/2-CallPropertiesManagerObj.clientHeight/2;
	CallPropertiesManagerObj.style.left = document.body.clientWidth/2-CallPropertiesManagerObj.clientWidth/2;
	CallPropertiesManagerObj.style.visibility = "visible";
}

function addNewCallProperty()
{
	if(document.popUpForm.new_call_property.value != "")
	{
		addAddExtraData(document.popUpForm.new_call_property.value);
		buildSelectFromVector(document.popUpForm.available_call_props, vectorOfCallProperties);
	}
	document.popUpForm.new_call_property.value = "";
}

function closeCallPropertiesManager()
{
	document.getElementById('CallPropertiesManager').style.visibility = "hidden";
}


function menu_new_open()
{
	var i;	
	var vectorOfScripts = new Array();
	var jsRSCripts = String( appletObj.getRoutingScripts(tenantDBID, "1") );
	var jsRSCRIPTArray = jsRSCripts.split("|");
	for(i = 0; i < jsRSCRIPTArray.length; i++)
	{
		if(jsRSCRIPTArray[i].length != 0) 
		{
			var thisRScript = jsRSCRIPTArray[i].split(",");
			var the_url = "./routingScript.htm?tenant_dbid="+tenantDBID+"&tenantName="+tenantName+"&script_dbid="+thisRScript[0]+"&script_name="+thisRScript[1]+"&script_is_active="+thisRScript[2]+"&script_priority="+thisRScript[3];
			var nOption = new Option(thisRScript[1], the_url);
			vectorOfScripts.push(nOption); //document.theFopen_script_scripts			
		}
	}
	
	var jsRSCripts = String( appletObj.getRoutingScripts(tenantDBID, "0") );
	var jsRSCRIPTArray = jsRSCripts.split("|");
	for(i = 0; i < jsRSCRIPTArray.length; i++)
	{
		if(jsRSCRIPTArray[i].length != 0) 
		{
			var thisRScript = jsRSCRIPTArray[i].split(",");
			var the_url = "./routingScript.htm?tenant_dbid="+tenantDBID+"&tenantName="+tenantName+"&script_dbid="+thisRScript[0]+"&script_name="+thisRScript[1]+"&script_is_active="+thisRScript[2]+"&script_priority="+thisRScript[3];
			var nOption = new Option(thisRScript[1], the_url);
			vectorOfScripts.push(nOption); //document.theFopen_script_scripts			
		}
	}
	
	
	buildSelectFromVector(document.popUpForm.open_script_scripts, vectorOfScripts);
	var OpenScriptObj = document.getElementById('OpenScript');
	OpenScriptObj.style.top = document.body.clientHeight/2-OpenScriptObj.clientHeight/2;
	OpenScriptObj.style.left = document.body.clientWidth/2-OpenScriptObj.clientWidth/2;
	OpenScriptObj.style.visibility = "visible";	
}

function menu_new_save_as()
{
	var i;	
	var vectorOfScripts = new Array();
	var jsRSCripts = String( appletObj.getRoutingScripts(tenantDBID, "1") );
	var jsRSCRIPTArray = jsRSCripts.split("|");
	for(i = 0; i < jsRSCRIPTArray.length; i++)
	{
		if(jsRSCRIPTArray[i].length != 0) 
		{
			var thisRScript = jsRSCRIPTArray[i].split(",");
			var the_url = "./routingScript.htm?tenant_dbid="+tenantDBID+"&tenantName="+tenantName+"&script_dbid="+thisRScript[0]+"&script_name="+thisRScript[1]+"&script_is_active="+thisRScript[2]+"&script_priority="+thisRScript[3];
			var nOption = new Option(thisRScript[1], the_url);
			vectorOfScripts.push(nOption); //document.theFopen_script_scripts			
		}
	}
	
	var jsRSCripts = String( appletObj.getRoutingScripts(tenantDBID, "0") );
	var jsRSCRIPTArray = jsRSCripts.split("|");
	for(i = 0; i < jsRSCRIPTArray.length; i++)
	{
		if(jsRSCRIPTArray[i].length != 0) 
		{
			var thisRScript = jsRSCRIPTArray[i].split(",");
			var the_url = "./routingScript.htm?tenant_dbid="+tenantDBID+"&tenantName="+tenantName+"&script_dbid="+thisRScript[0]+"&script_name="+thisRScript[1]+"&script_is_active="+thisRScript[2]+"&script_priority="+thisRScript[3];
			var nOption = new Option(thisRScript[1], the_url);
			//alert('nOption.onclick='+nOption.onclick);
			vectorOfScripts.push(nOption); //document.theFopen_script_scripts			
		}
	}
	document.popUpForm.save_as_text.value = "";
	buildSelectFromVector(document.popUpForm.save_as_scripts, vectorOfScripts);
	var SaveScriptAsObj = document.getElementById('SaveScriptAs');
	SaveScriptAsObj.style.top = document.body.clientHeight/2-SaveScriptAsObj.clientHeight/2;
	SaveScriptAsObj.style.left = document.body.clientWidth/2-SaveScriptAsObj.clientWidth/2;
	SaveScriptAsObj.style.visibility = "visible";
}

function OpenThisScript()
{
	if(document.popUpForm.open_script_scripts.value != "")
	{
		var cango = true;
		if(scriptHasBeenModified)
		{
			var yesno;
			yesno = confirm(MultiArray["The current script has been modified.\nDo you want to save it?"][lang]);
			if(yesno)
				cango = saveThisScript();
		}
		
		if(cango)
		{
			var newloc = document.popUpForm.open_script_scripts.value;
			document.location.href = newloc;
		}
	}
	document.getElementById('OpenScript').style.visibility = "hidden";	
}

function closeOpenScript()
{
	document.getElementById('OpenScript').style.visibility = "hidden";
}

function closeSaveScriptAs()
{
	document.getElementById('SaveScriptAs').style.visibility = "hidden";
}

function SaveThisAsScript()
{
	var buildString = "";
	buildString = Schema_to_String();
	var isActiveStr = document.theForm.active_box.checked ? "1" : "0";
	if(document.popUpForm.save_as_text.value == "")
		alert(MultiArray["Please, enter a name for the script."][lang]);
	else
	{	
		var allRoutingScripts = "";
		
		var script_name = document.popUpForm.save_as_text.value;
		allRoutingScripts = String(appletObj.getRoutingScripts(tenantDBID, "1" ));
		allRoutingScripts += "|";
		allRoutingScripts += String(appletObj.getRoutingScripts(tenantDBID, "0" ));
	 	allRoutingScripts =  allRoutingScripts + "";
		array_routingScripts = allRoutingScripts.split("|");
		var s_founded = false;
		for(var i = 0; i <array_routingScripts.length && !s_founded; i++)
		{
			if( array_routingScripts[i] != "" )
			{
				a_routing = array_routingScripts[i].split(",");
				if(a_routing[1]== script_name)
					s_founded = true;
			}
		}
		
		if( s_founded )
		{
			var yesno = confirm(MultiArray["This routing script already exists. Do you want to overwrite it?"][lang]);
			if(yesno)
				appletObj.saveRoutingScript(a_routing[0], document.popUpForm.save_as_text.value, isActiveStr, document.theForm.priority.value, buildString);
		}
		else
			appletObj.addRoutingScript(tenantDBID, document.popUpForm.save_as_text.value, isActiveStr, document.theForm.priority.value, buildString);
		
		closeSaveScriptAs();
	}
}

//Update the counters statistics
function updateCounterStats(destScriptDBID, destCntName, destCntValue)
{
	if(destScriptDBID == script_dbid) //if we are on the right page
	{
		destCntValue = parseInt(destCntValue);
		var i;
		for(i = 0; i < vectorCounterBox.length; i++)
		{
			if(vectorCounterBox[i].variable_name == destCntName)
			{
				vectorCounterBox[i].stats = destCntValue;
				//Update the visible statistics
				if(vectorCounterBox[i].isInTrackMode == 1 || vectorCounterBox[i].isInTrackMode == vectorCounterBox[i] || this.isInTrackMode == 'true')
				{
					var objStats = document.getElementById("CounterTrack_"+vectorCounterBox[i].uID);
					var curvalue = objStats.innerText;					
					if(objStats)
					{						
						objStats.innerText = (destCntValue-vectorCounterBox[i].lastStatsBeforeReset);
						if(curvalue != objStats.innerText)
							objStats.style.color = "#FF0000";
						else
							objStats.style.color = "#000000";
					}
				}
				break;
			}
		}
	}	
}


function getBoxDivName(boxType, boxUid)
{
	var startString = "";
	switch(boxType)
	{
		case "SC":
			startString = "IDSwitchCase_";
		break;
		case "PM":
			startString = "IDPickMethod_";
		break;
		case "CC":
			startString = "IDCallCondition_";
		break;
		case "CE":
			startString = "IDCallEnding_";
		break;
		case "CO":
			startString = "IDCounterBox_";
		break;
		case "DT":
			startString = "IDGetDtfm_";
		break;
		case "PE":
			startString = "IDPbxExec_";
		break;
		case "PI":
			startString = "IDPriority_";
		break;
		case "SQ":
			startString = "IDSqlQuery_";
		break;
		case "GS":
			startString = "IDGetStatistic_";
		break;
		case "CS":
			startString = "IDCustomServer_";
		break;
	}
	return (startString+boxUid);
}

/*
 * This shows the menu properties and it's statistics
 *
 */

function menu_new_props()
{
	var ScriptStatsObj = document.getElementById('ScriptStats');	
	var ScriptStats_insideObj = document.getElementById('ScriptStats_inside');
	var ScriptStats_titleObj = document.getElementById('ScriptStats_title');	
	ScriptStatsObj.style.top = document.body.clientHeight/2-ScriptStatsObj.clientHeight/2;
	ScriptStatsObj.style.left = document.body.clientWidth/2-ScriptStatsObj.clientWidth/2;
	
	ScriptStats_titleObj.innerHTML = '&nbsp;' +document.theForm.n_script_name.value+' [Statistics]';
	var buildHTML = "";	
	buildHTML += '<table width="100%" cellpadding="1">';
	buildHTML += '<tr><td>Name</td><td>'+document.theForm.n_script_name.value+'</td></tr>';
	buildHTML += '<tr><td>Tenant</td><td>'+tenantName+'</td></tr>';
	buildHTML += '<tr><td colspan="2">&nbsp;</td></tr>';
	buildHTML += '<tr><td colspan="2"><b>"'+MultiArray["Counters"][lang]+'</b></td></tr>';
	var color = "#EEEEEE";
	for(var i = 0; i < vectorCounterBox.length; i++)
	{
	
		buildHTML += '<tr bgcolor="'+color+'"><td><i>'+vectorCounterBox[i].variable_name+'</i></td>';
		buildHTML += '<td align="right">'+(vectorCounterBox[i].stats-vectorCounterBox[i].lastStatsBeforeReset)+'</td></tr>';
		if(color == "#EEEEEE")
			color = "#FFFFFF";
		else
			color = "#EEEEEE";
	}
	
	buildHTML += '</table>';
	ScriptStats_insideObj.innerHTML = buildHTML;
	ScriptStatsObj.style.visibility = "visible";	
}


function closeScriptStats()
{
	var	ScriptStatsObj = document.getElementById('ScriptStats');
	ScriptStatsObj.style.visibility = 'hidden';
}

function valideNotMultipleStartingPoints()
{
	var bReturn = true;
	
	if( vectorCallConditions.length == 0)
	{
	
alert(MultiArray["Error: No starting box found in this script. Please add a call condition"][lang]);

		bReturn = false;
	} else
	{
		var list_cc_not_startup = new Array();
		for(var i = 0; i < vectorLinks.length; i++)
		{
			if( vectorLinks[i].endType == 'CC' )
				list_cc_not_startup.push( vectorLinks[i].endID );
		}
		
		var list_of_cc_StartPoints = new Array();
		var list_of_cc_notStartPoints = new Array();
		var pos = null;
		for(var j = 0; j < vectorCallConditions.length; j++)
		{
			//alert('vectorCallConditions[j].uID='+vectorCallConditions[j].uID);
			if(  findEltInArray( list_cc_not_startup,  vectorCallConditions[j].uID ) == -1  )   //this one is a starting point
			{
				list_of_cc_StartPoints.push( vectorCallConditions[j].uID );
				pos = j;
			}
			else
			{
				list_of_cc_notStartPoints.push( vectorCallConditions[j].uID );
			}			
		}
		
		/*
		alert('list_of_cc_StartPoints='+list_of_cc_StartPoints);
		alert('list_of_cc_notStartPoints='+list_of_cc_notStartPoints);		
		*/
		
		if(list_of_cc_StartPoints.length == 0)
		{
		
	alert(MultiArray["Error: No starting box found in this script"][lang]);

			bReturn = false;			
		}
		else
		{
			if(list_of_cc_StartPoints.length > 1)
			{
				var alertmess = '';
				alertmess += 'Error: More than one starting box were found.\n';
				alertmess += 'Possible Call Conditions are:\n';
				for(var p = 0; p < list_of_cc_StartPoints.length; p++)
					alertmess += '#'+list_of_cc_StartPoints[p] + ', ';
				alert(alertmess);
				bReturn = false;
			}
			else
			{
				//alert('pos='+pos);
				if(pos != null)
				{
					vectorCallConditions[pos].isStartup = 1;
					bReturn = true;
				}
				else
					bReturn = false;
			}
		}		
	}
	retrieveTmpMessage();
	return bReturn;	
}

function softvalideNotMultipleStartingPoints()
{
	var rArray = new Array();
	var tmpmess;
	var tmptext = "";
	var tmponclick = "";	
	
	if( vectorCallConditions.length == 0)
	{
		tmpmess = new softValidationMess();	
		tmptext = 'No starting box found in this script. Please add a call condition.';
		tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, "addCallCondition()");
		rArray.push(tmpmess);
	} else
	{
		var list_cc_not_startup = new Array();
		for(var i = 0; i < vectorLinks.length; i++)
		{
			if( vectorLinks[i].endType == 'CC' )
				list_cc_not_startup.push( vectorLinks[i].endID );
		}
		
		var list_of_cc_StartPoints = new Array();
		var list_of_cc_notStartPoints = new Array();
		var pos = null;
		for(var j = 0; j < vectorCallConditions.length; j++)
		{
			//alert('vectorCallConditions[j].uID='+vectorCallConditions[j].uID);
			if(  findEltInArray( list_cc_not_startup,  vectorCallConditions[j].uID ) == -1  )   //this one is a starting point
			{
				list_of_cc_StartPoints.push( vectorCallConditions[j].uID );
				pos = j;
			}
			else
			{
				list_of_cc_notStartPoints.push( vectorCallConditions[j].uID );
			}			
		}
						
		if(list_of_cc_StartPoints.length == 0)
		{
			//alert('Error: No starting box found in this script.');
			tmpmess = new softValidationMess();	
			tmptext = 'No starting box found in this script.';
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
			
		}
		else
		{
			if(list_of_cc_StartPoints.length > 1)
			{
				tmptext = '';
				tmptext += MultiArray["More than one starting box were found.\n"][lang];
				tmptext += MultiArray["Possible Call Conditions are:\n"][lang];
				for(var p = 0; p < list_of_cc_StartPoints.length; p++)
					tmptext += '#'+list_of_cc_StartPoints[p] + ', ';
				tmpmess = new softValidationMess();
				tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);				
			}
		}		
	}
	
	return rArray;	
}


function findEltInArray( theArray, theValue) 
{
	var pos = -1;
	for(var i = 0 ; i < theArray.length; i++)
	{
		if( theArray[i] == theValue)
		{
			pos = i;
			break;
		}
	}
	return pos;
}

function closeValidationDiv()
{
	var obj = document.getElementById('validationDiv');
	if( obj )
		obj.style.visibility = 'hidden';
}


function setupCustomServerModulesFucntions()
{
	vectorOfCustomServerModulesFucntions.length = 0; //clear the array
	
	var str = String(appletObj.getDynamicModulesStr());
	
	var strar = str.split("|");
	for(var i = 0; i < strar.length; i++)
	{
		if(strar[i].length != "")
		{
			var str2ar = strar[i].split("^");
			if(vectorOfCustomServerModulesFucntions[str2ar[0]] == null) //the module did not exist before
			{
				vectorOfCustomServerModulesFucntions[str2ar[0]] = new Array();	
			}
			vectorOfCustomServerModulesFucntions[str2ar[0]].push(str2ar[1]);			
		}
	}
	
	///resetup the select boxes
	var obj1 = document.popUpForm.n_custom_server_module;
	if(obj1)
	{
		obj1.options.length = 0;
		var cur;
		nopt = new Option("", "");
		obj1.options[obj1.options.length] = nopt;
		for(cur in vectorOfCustomServerModulesFucntions)
		{
		 
			var nopt = new Option(cur, cur);
			obj1.options[obj1.options.length] = nopt;
		}
	}	
	
	//The function boxes
	var obj2 = document.popUpForm.n_custom_server_function;
	if(obj2)
	{
		obj2.options.length = 0;
		var cur, newfunc, cnt;
		nopt = new Option("", "");
		obj2.options[obj2.options.length] = nopt;
		for(cur in vectorOfCustomServerModulesFucntions)
		{
		   for(cnt=0; cnt < vectorOfCustomServerModulesFucntions[cur].length; cnt++)
		   {	newfunc = vectorOfCustomServerModulesFucntions[cur][cnt];
			var nopt = new Option(newfunc, newfunc);
			obj2.options[obj2.options.length] = nopt;
		   }
		}
	}	
	
	
}

// Retrieve all the undesired caracters from a text
function replacenewLineCaracters(str)
{
	var rStr = "";
	
	rStr = str.replace(/\n|\r/gi," ");
	
	return rStr;	
}
