// JavaScript Document
/*****************************************
 Class getStatistic()
*****************************************/

function GetStatistic()
{
	this.uID 	= 0;
	this.xPos	= "0px";
	this.yPos 	= "0px";
	this.statType = "";
	this.data	= "";
	this.ownBoxType = "GS";
	this.VUID = 0;
	this.OnNextVUID = 0;
	this.OnNext = 0;
	this.variableName = "";
    this.MaxWaitTimeAnswer = "20";
    this.MinAbandonTime = "5";
    this.MaxStatsAge = "0";


	this.buildHTML = function()
	{
		var sReturn = "";
		var buttonValue = "";
		if(this.variableName != "")
			{
			buttonValue += 'Get [';
			buttonValue += this.variableName;
			buttonValue += ']';
			}
		else
			buttonValue = 'Setup';


		sReturn =  '<div id="IDGetStatistic_'+this.uID+'"';
		sReturn += ' uID = "'+this.uID+'"';
		sReturn += ' xPos = "'+this.xPos+'"';
		sReturn += ' yPos = "'+this.yPos+'"';
		sReturn += ' class="defaultGetStatistic" style="top:'+this.yPos+'; left:'+this.xPos+'"';
		sReturn += ' ';
		sReturn += ' >';
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';
		sReturn += '<tr bgcolor="#D1D8C2"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDGetStatistic_'+this.uID+'\')"><b>'+stat[0]+' #'+this.uID;
		if(DEBUG)

			sReturn += ' ID['+this.VUID+']';
		sReturn += '</b></td>';
		sReturn += '<td align="right"><a href="javascript:closetheGS('+this.uID+')">';
		sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
		sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'GS\', \''+this.VUID+'\')"><i>'+stat[1]+'</i></td></tr>';
		sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpGS(\''+this.uID+'\', \''+this.statType+'\', \''+this.data+'\', \''+this.variableName+'\', \''+this.MaxWaitTimeAnswer+'\', \''+this.MinAbandonTime+'\', \''+this.MaxStatsAge+'\')" ';
		sReturn += 'value="'+buttonValue+'" class="setupButton"></td></tr>';
		sReturn += '<tr><td colspan="2" nowrap class="onsuccedTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'onNext\', \'GS\', \''+this.VUID+'\')"><i>'+stat[2]+'';
		if(DEBUG)
			sReturn += ' -->['+this.OnNextVUID+']';
		sReturn += '</i></td></tr>';
		sReturn += '</table>';
		sReturn += '</div>';
		sReturn += '';

		return sReturn;
	}

	this.buildString = function()
	{
		var sReturn = "";

		sReturn += 'TYPE=GETSTATISTIC';
		sReturn += '&';
		sReturn += 'uID='+this.uID;
		sReturn += '&';
		sReturn += 'statType='+this.statType;
		sReturn += '&';
		if(this.statType == "GROUP_TOTAL_WAITING_AGENTS" || this.statType == "GROUP_TOTAL_LOGIN_AGENTS" ||
		   this.statType == "GROUP_TOTAL_CONFIGURED_AGENTS" || this.statType == "GROUP_BUSY_FACTOR_GROUP") //data = HavingSkill, send it in XML Format
		{
			var xml_out_put = ExpressiontoXML(this.data);
			sReturn += 'data='+xml_out_put;
		}
		else
		{
			sReturn += 'data='+this.data;
		}
		sReturn += '&';
		sReturn += 'VUID='+this.VUID;
		sReturn += '&';
		sReturn += 'OnNextVUID='+this.OnNextVUID;
		sReturn += '&';
		sReturn += 'OnNext='+this.OnNext;
		sReturn += '&';
		sReturn += 'variableName='+this.variableName;
		sReturn += '&';
        sReturn += 'MaxWaitTimeAnswer='+this.MaxWaitTimeAnswer;
		sReturn += '&';
        sReturn += 'MinAbandonTime='+this.MinAbandonTime;
		sReturn += '&';
        sReturn += 'MaxStatsAge='+this.MaxStatsAge;
		sReturn += '&';
		sReturn += 'xPos='+this.xPos;
		sReturn += '&';
		sReturn += 'yPos='+this.yPos;
		sReturn += '^';

		return sReturn;
	}

	this.validate = function()
	{
		var bReturn = true;

		if(this.statType == null || this.statType == "")
		{
			alert(stat[3]+this.uID);

			retrieveTmpMessage();
			bReturn = false;
			setUpGS(this.uID, this.statType, this.data, this.variableName, this.MaxWaitTimeAnswer, this.MinAbandonTime, this.MaxStatsAge);
		} else if(this.data == null || this.data == "")
		{
			alert(stat[4]+this.uID);

			retrieveTmpMessage();
			bReturn = false;
			setUpGS(this.uID, this.statType, this.data, this.variableName, this.MaxWaitTimeAnswer, this.MinAbandonTime, this.MaxStatsAge);
		} else if(this.variableName == null || this.variableName == "")
		{
			alert(stat[5]+this.uID);

			retrieveTmpMessage();
			bReturn = false;
			setUpGS(this.uID, this.statType, this.data, this.variableName, this.MaxWaitTimeAnswer, this.MinAbandonTime, this.MaxStatsAge);
		}

		return bReturn;
	}

	this.softvalidate = function()
	{
		var rArray = new Array();
		var tmpmess;
		var tmptext = "";
		var tmponclick = 'setUpGS(\''+this.uID+'\', \''+this.statType+'\', \''+this.data+'\', \''+this.variableName+'\', \''+this.MaxWaitTimeAnswer+'\', \''+this.MinAbandonTime+'\', \''+this.MaxStatsAge+'\')';

		if(this.statType == "")
		{
			tmpmess = new softValidationMess();
			tmptext = 'Missing statistic type for Get Statistic Box #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}
		if(this.data == "")
		{
			tmpmess = new softValidationMess();
			tmptext = 'Missing statistic data for Get Statistic Box #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}
		if(this.variableName == "")
		{
			tmpmess = new softValidationMess();
			tmptext = 'Missing statistic variable name for Get Statistic Box #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
		}
		return rArray;
	}
}






/********************
	OTHERS FUNCTIONS
********************/

function addThistoGSArea(text)
{
	insertAtCursor(document.popUpForm.GSSetupDialog_data, text);
}

function changeGSSetupInterface(vl)
{
	var inHTML;
	inHTML = '';
	if(vl == 'AgentGroup=') //si on a l'option group de selectionner,
		{
		inHTML += '<select onChange="if(this.value!=\'\') addThistoGSArea(this.options[this.selectedIndex].text);" >';
		inHTML += '<option>-- '+stat[6]+' --</option>';
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
	else
		{
		inHTML += '<input type="button" value="<" onClick="addThistoGSArea(\'&lt;\')">';
		inHTML += '<input type="button" value="=" onClick="addThistoGSArea(\'=\')">';
		inHTML += '<input type="button" value=">" onClick="addThistoGSArea(\'&gt;\')">';
		}
	GSSetupDialog_optionbuttons.innerHTML = inHTML;
}

function closeSetUpGS()
{
	document.getElementById('GSSetupDialog').style.visibility = "hidden";
    document.getElementById('GSSetupDialog_MaxWaitTimeAnswerID').style.visibility = "hidden";
    document.getElementById('GSSetupDialog_MinAbandonTimeID').style.visibility = "hidden";
    document.getElementById('GSSetupDialog_MaxStatsAgeID').style.visibility = "hidden";
}


function submitSetUpGS()
{

	for(var i = 0; i < vectorGetStatisticBox.length; i++)
	{
		if(vectorGetStatisticBox[i].uID == GSSetupDialog_id.innerText)
		{
			vectorGetStatisticBox[i].statType 		= document.popUpForm.GSSetupDialog_Type.value;
			vectorGetStatisticBox[i].data 			= replacenewLineCaracters(document.popUpForm.GSSetupDialog_data.value);
			vectorGetStatisticBox[i].variableName 	= document.popUpForm.GSSetupDialog_variable_name.value;
            vectorGetStatisticBox[i].MaxWaitTimeAnswer 	= document.popUpForm.GSSetupDialog_MaxWaitTimeAnswer.value;
            vectorGetStatisticBox[i].MinAbandonTime 	= document.popUpForm.GSSetupDialog_MinAbandonTime.value;
            vectorGetStatisticBox[i].MaxStatsAge 	= document.popUpForm.GSSetupDialog_MaxStatsAge.value;

			if( !option_already_existInCallProps(vectorGetStatisticBox[i].variableName) )
			{
				addAddExtraData(vectorGetStatisticBox[i].variableName);
			}
			break;
		}
	}
	document.getElementById('GSSetupDialog').style.visibility = "hidden";
    document.getElementById('GSSetupDialog_MaxWaitTimeAnswerID').style.visibility = "hidden";
    document.getElementById('GSSetupDialog_MinAbandonTimeID').style.visibility = "hidden";
    document.getElementById('GSSetupDialog_MaxStatsAgeID').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();
	reDisplayObj("IDGetStatistic_"+vectorGetStatisticBox[i].uID, vectorGetStatisticBox[i].buildHTML());
	enableSaving();
}

function setUpGS(p_uID, p_statType, p_data, p_storevariable, p_MaxWaitTimeAnswer, p_MinAbandonTime, p_MaxStatsAge)
{
	//Hide all others...
	hideAllToolsOptions();

	document.getElementById('GSSetupDialog_id').innerText = p_uID;

	if(p_data != "" && p_data != "undefined")
		document.popUpForm.GSSetupDialog_data.value = p_data;
	else
		document.popUpForm.GSSetupDialog_data.value = "";

	if(p_statType != "" && p_statType != "undefined")
	{
		chooseSelectObj("GSSetupDialog_Type", p_statType); //PMSetupDialog_tieBreaker.value = p_tieBreaker;
		changeGSDataText(p_statType);
	}
	else
	{
		chooseSelectObj("GSSetupDialog_Type", "");
		changeGSDataText("");
	}

	if(p_data != "" && p_data != "undefined")
		document.popUpForm.GSSetupDialog_data.value = p_data;
	else
		document.popUpForm.GSSetupDialog_data.value = "";

	if(p_storevariable != "" && p_storevariable != "undefined")
		document.popUpForm.GSSetupDialog_variable_name.value = p_storevariable;
	else
		document.popUpForm.GSSetupDialog_variable_name.value = "";

    if(p_MaxWaitTimeAnswer != "" && p_MaxWaitTimeAnswer != "undefined")
		document.popUpForm.GSSetupDialog_MaxWaitTimeAnswer.value = p_MaxWaitTimeAnswer;
	else
		document.popUpForm.GSSetupDialog_MaxWaitTimeAnswer.value = "20";

    if(p_MinAbandonTime != "" && p_MinAbandonTime != "undefined")
		document.popUpForm.GSSetupDialog_MinAbandonTime.value = p_MinAbandonTime;
	else
		document.popUpForm.GSSetupDialog_MinAbandonTime.value = "5";

    if(p_MaxStatsAge != "" && p_MaxStatsAge != "undefined")
		document.popUpForm.GSSetupDialog_MaxStatsAge.value = p_MaxStatsAge;
	else
		document.popUpForm.GSSetupDialog_MaxStatsAge.value = "0";


	GSSetupDialogObj = document.getElementById('GSSetupDialog');
	GSSetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-GSSetupDialogObj.clientHeight/2;
	GSSetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-GSSetupDialogObj.clientWidth/2;
	GSSetupDialogObj.style.visibility = "visible";

    GSSetupMaxWaitObj = document.getElementById('GSSetupDialog_MaxWaitTimeAnswerID');
	GSSetupMaxWaitObj.style.visibility = "hidden";
    GSSetupMinAbandonObj = document.getElementById('GSSetupDialog_MinAbandonTimeID');
	GSSetupMinAbandonObj.style.visibility = "hidden";
    GSSetupMaxAgeObj = document.getElementById('GSSetupDialog_MaxStatsAgeID');
	GSSetupMaxAgeObj.style.visibility = "hidden";
    if(p_statType == "QUEUE_SERVICE_FACTOR")
    {
        GSSetupMaxWaitObj.style.visibility = "visible";
        GSSetupMinAbandonObj.style.visibility = "visible";
        GSSetupMaxAgeObj.style.visibility = "visible";
    }
    if(p_statType == "QUEUE_AVG_WAITING_TIME")
    {
        GSSetupMaxAgeObj.style.visibility = "visible";
    }
}


function closetheGS(unID)
{
	foundAt = 0;
	hasBeenFound = false;

	var tmpVector = new Array();
	for(i = 0; i < vectorGetStatisticBox.length; i ++)
	{

		if(vectorGetStatisticBox[i].uID == unID)
		{
			foundAt = i;
			hasBeenFound = true;
		}
		else
			tmpVector.push(vectorGetStatisticBox[i]);
	}

	if(hasBeenFound)
	{
		var bNewArray = new Array();
			for(i = 0; i < vectorLinks.length; i++)
			{
				if((vectorLinks[i].startID != unID || vectorLinks[i].startType != "GS")  &&
					(vectorLinks[i].endID != unID || vectorLinks[i].endType != "GS"))
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

	vectorGetStatisticBox = tmpVector;

	//Display the whole graph
	scriptHasBeenModified = true;
	//refreshDiagramInside();
    reDisplayObj( "IDGetStatistic_"+unID, "");
	enableSaving();
}

function addGetStatistic()
{

	var newOne = new GetStatistic();
	nbGetStatBox++;
	nbScrpElementCreated++;
	newOne.uID = nbGetStatBox;
	newOne.VUID = nbScrpElementCreated;
	vectorGetStatisticBox.push(newOne);
	scriptHasBeenModified = true;
	//refreshDiagramInside();
	addNewDivisionToDiagram( newOne.buildHTML() );
}

function changeGSDataText( curvalue )
{
	var obj = document.getElementById('GSSetupDialog_data_text');
	if( obj )
	{
		var text = "";
        GSSetupMaxWaitObj = document.getElementById('GSSetupDialog_MaxWaitTimeAnswerID');
        GSSetupMaxWaitObj.style.visibility = "hidden";
        GSSetupMinAbandonObj = document.getElementById('GSSetupDialog_MinAbandonTimeID');
        GSSetupMinAbandonObj.style.visibility = "hidden";
        GSSetupMaxAgeObj = document.getElementById('GSSetupDialog_MaxStatsAgeID');
        GSSetupMaxAgeObj.style.visibility = "hidden";
		switch( curvalue )
		{
			case "QUEUE_WAITING_CALLS":
			case "QUEUE_ENTERED_CALLS":
			case "QUEUE_DISTRIBUTED_CALLS":
			case "QUEUE_ABANDONNED_CALLS":
			case "QUEUE_LONGUESTWAITING_CALL":
			case "QUEUE_CURRENT_AVG_WAITING_CALLS":
				text = stat[7];
				var obj2 = document.getElementById('GSSetupDialog_operators_td');
				if( obj2 )
					obj2.innerHTML = '';
			break;
            case "QUEUE_SERVICE_FACTOR":
                text = stat[7];
                var obj2 = document.getElementById('GSSetupDialog_operators_td');
				if( obj2 )
					obj2.innerHTML = '';
                GSSetupMaxWaitObj.style.visibility = "visible";
                GSSetupMinAbandonObj.style.visibility = "visible";
                GSSetupMaxAgeObj.style.visibility = "visible";
            break;
            case "QUEUE_AVG_WAITING_TIME":
                text = stat[7];
                var obj2 = document.getElementById('GSSetupDialog_operators_td');
				if( obj2 )
					obj2.innerHTML = '';
                GSSetupMaxAgeObj.style.visibility = "visible";
            break;
			case "GROUP_TOTAL_WAITING_AGENTS":
			case "GROUP_TOTAL_LOGIN_AGENTS":
			case "GROUP_TOTAL_CONFIGURED_AGENTS":
			case "GROUP_BUSY_FACTOR_GROUP":

				text = stat[8];
				var obj2 = document.getElementById('GSSetupDialog_operators_td');
				if( obj2 )
				{
					obj2.innerHTML = GSSetupDialog_operators_table;
				}
			break;

		}
		obj.innerText = text;
	}
}



/*
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
*/
