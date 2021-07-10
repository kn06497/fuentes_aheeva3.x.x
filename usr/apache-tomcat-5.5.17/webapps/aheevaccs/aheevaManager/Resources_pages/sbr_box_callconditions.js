// JavaScript Document
/*******************************************
Class CallConditionTest
***********************************************/

function CallConditionTest()
{
	var uID 				= "";
	var testedPropertyID 	= "";
	var LinkType 			= ""; //Link between testedPropertyID and seekValue (eg. ==, >, < etc...)
	var seekValue 			= "";
	var OnSuccess		 	= "";
	var OnFailed 			= "";
	var xPos 				= "0px";
	var yPos 				= "0px";
	
	this.testedPropertyID 	= "";
	this.LinkType 			= "";
	this.seekValue 			= "";
	this.xPos 				= "0px";
	this.yPos 				= "0px";
	this.OnSuccess 			= "";
	this.OnFailed 			= "";
	
	this.OnSuccesGoto 		= "";
	this.OnFailGoto 		= "";
	
	this.ownBoxType 		= "CC";
	this.VUID 				= 0;
	this.OnSuccessVUID 		= 0;
	this.OnFailedVUID 		= 0;
	this.isStartup			= 0;
	
	this.setLink = function(LNK_TYPE)
	{
		this.LinkType = LNK_TYPE;
	}
	
	this.setPos = function(x, y)
	{
		this.xPos = x;
		this.yPos = y;
	}	
	
	this.buildHTML = function()
	{
		var sReturn = "";
		if(this.testedPropertyID != "" && this.LinkType != "")
		{
			buttonValue = 'IF ('+this.testedPropertyID+' ';
			switch(this.LinkType) //Transformer en des caracteres plus lisibles...
			{
				case "<=":
					buttonValue += '&le;';				
				break;
				case ">=":
					buttonValue += '&ge;';				
				break;
				default:
					buttonValue += this.LinkType;					
			} 
			buttonValue += ' '+this.seekValue+')';
		}
		else
			buttonValue = "Setup";
		
		
		sReturn =  '<div id="IDCallCondition_'+this.uID+'"';
		sReturn += ' uID = "'+this.uID+'"';
		sReturn += ' testedPropertyID = "'+this.testedPropertyID+'"';
		sReturn += ' LinkType = "'+this.LinkType+'"';
		sReturn += ' seekValue = "'+this.seekValue+'"';
		sReturn += ' OnSuccess = "'+this.OnSuccess+'"';
		sReturn += ' OnFailed = "'+this.OnFailed+'"';
		sReturn += ' xPos = "'+this.xPos+'"';
		sReturn += ' yPos = "'+this.yPos+'"';
		sReturn += ' class="defaultCallCondition" style="top:'+this.yPos+'; left:'+this.xPos+';"';
		sReturn += ' ';
		sReturn += ' >';
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
		sReturn += '<tr bgcolor="#6AA5D7"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDCallCondition_'+this.uID+'\')"><b>Test #'+this.uID;
		if(DEBUG)
			sReturn += ' ID['+this.VUID+']';
		sReturn += '</b></td>';
		sReturn += '<td align="right"><a href="javascript:closetheCC('+this.uID+')">';
		sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
		sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'CC\', \''+this.VUID+'\')"><i>'+Calc[0]+'</i></td></tr>';
		sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpCC(\''+this.uID+'\', \''+this.testedPropertyID+'\', \''+this.LinkType+'\', \''+this.seekValue+'\')" ';
		sReturn += 'value="'+buttonValue+'" class="setupButton"></td></tr>';
		sReturn += '';
		sReturn += '<tr><td colspan="2" nowrap class="onsuccedTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'onSucced\', \'CC\', \''+this.VUID+'\')"><i>'+Calc[1]+'';
		if(DEBUG)
			sReturn += ' -->['+this.OnSuccessVUID+']';
		sReturn += '</i></td></tr>';
		sReturn += '<tr><td colspan="2" nowrap class="onfailTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'onFailed\', \'CC\', \''+this.VUID+'\')"><i>'+Calc[2]+'';
		if(DEBUG)
			sReturn += ' -->['+this.OnFailedVUID+']';
		sReturn += '</i></td></tr>';
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
		
		if(this.testedPropertyID == "")
		{
			alert(Calc[3]+this.uID);
			
			retrieveTmpMessage();
			bReturn = false;
			setUpCC(this.uID, this.testedPropertyID, this.LinkType, this.seekValue);
		}
		else if(this.LinkType == "")
		{
			alert(Calc[4]+this.uID);

			retrieveTmpMessage();
			bReturn = false;
			setUpCC(this.uID, this.testedPropertyID, this.LinkType, this.seekValue);
		}
		else if(this.OnSuccess == "")
		{
			alert(Calc[5]+this.uID);

			retrieveTmpMessage();
			bReturn = false;
		}
		
		return bReturn;
	}
	
	this.softvalidate = function()
	{
		var rArray = new Array();
		var tmpmess;
		var tmptext = "";
		var tmponclick = 'setUpCC(\''+this.uID+'\', \''+this.testedPropertyID+'\', \''+this.LinkType+'\', \''+this.seekValue+'\')';
		if(this.testedPropertyID == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Missing test for Call Test Condition #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
			/*alert('Error: Missing test for Call Test Condition #'+this.uID);
			retrieveTmpMessage();
			bReturn = false;
			setUpCC(this.uID, this.testedPropertyID, this.LinkType, this.seekValue);
			*/
		}
		if(this.LinkType == "")
		{
			tmpmess = new softValidationMess();
			
			tmptext = 'Missing link type for Call Test Condition #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
			/*
			alert('Error: Missing link type for Call Test Condition #'+this.uID);
			retrieveTmpMessage();
			bReturn = false;
			setUpCC(this.uID, this.testedPropertyID, this.LinkType, this.seekValue);
			*/
		}
		if(this.OnSuccess == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Missing OnSuccess action for Call Test Condition #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);
			/*
			alert('Error: Missing OnSuccess action for Call Test Condition #'+this.uID);
			retrieveTmpMessage();
			bReturn = false;
			*/
		}
		return rArray;
	}
	
	
}

function closeSetUpCC()
{
	document.getElementById('CCSetupDialog').style.visibility = "hidden";
}

/**
	Fonction appellee par le bouton "Set" du champ de Test
*/
function submitSetUpCC()
{
	
	for(i = 0; i < vectorCallConditions.length; i++) //i = le numero du test
	{
		
		if(vectorCallConditions[i].uID == document.getElementById('CCSetupDialog_TD1').innerText)
		{	
			vectorCallConditions[i].testedPropertyID = document.popUpForm.n_call_prop.value;
			vectorCallConditions[i].LinkType = document.popUpForm.n_call_link.value;
			if (document.popUpForm.n_call_prop.value == "WEEKDAY" ||
				document.popUpForm.n_call_prop.value == "DAYNAME" ||
				document.popUpForm.n_call_prop.value == "MONTHNAME"){
						vectorCallConditions[i].LinkType = document.popUpForm.n_call_link2.value;
						vectorCallConditions[i].seekValue = document.popUpForm.n_call_option.value;
			}
			else if (document.popUpForm.n_call_prop.value == "DAYOFWEEK" ||
					  document.popUpForm.n_call_prop.value == "MONTHOFYEAR"){
						vectorCallConditions[i].LinkType = document.popUpForm.n_call_link.value;
						vectorCallConditions[i].seekValue = document.popUpForm.n_call_option.value;				
			}
			else{
				vectorCallConditions[i].LinkType = document.popUpForm.n_call_link.value;
				vectorCallConditions[i].seekValue = document.popUpForm.n_seek_value.value;
			}
			break;
		}
	}
	document.getElementById('CCSetupDialog').style.visibility = "hidden";
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();
	reDisplayObj("IDCallCondition_"+vectorCallConditions[i].uID, vectorCallConditions[i].buildHTML());
	enableSaving();
}

/**
	Fonction appellee quand on ouvre le champ de Test
*/
function setUpCC(p_uID, p_CallProperty, p_Link, p_SeekValue)
{
	var call_option = 0;
	var cas = -1;
	hideAllToolsOptions();

	buildSelectFromVector(document.popUpForm.n_call_prop, vectorOfCallProperties);	
	document.getElementById('CCSetupDialog_TD1').innerText = p_uID;
	if(p_CallProperty != "")
		{			
			chooseSelectObj("n_call_prop", p_CallProperty);
			if (p_CallProperty == "WEEKDAY") cas = 0;
			else if (p_CallProperty == "DAYNAME" || p_CallProperty == "DAYOFWEEK") cas = 1;
			else if (p_CallProperty == "MONTHNAME" || p_CallProperty == "MONTHOFYEAR")	cas = 2;
			else call_option = -1;
		}
	else{		
		chooseSelectObj("n_call_prop", "");	
		call_option = -1;
		}	
			
	if(p_Link != "")
		chooseSelectObj("n_call_link", p_Link);
	else
		chooseSelectObj("n_call_link", "");
		
	if(p_SeekValue != "" && p_SeekValue != "undefined"){
		if (call_option == 0){ //on a WEEKDAY || DAYNAME || MONTHNAME || DAYOFWEEK || MONTHOFYEAR
			document.popUpForm.n_call_option.options.length = 0; //raz de la liste
			document.popUpForm.n_seek_value.style.display = "none";
			document.popUpForm.n_call_option.style.display = "block";
			switch (cas){
			case 0://WEEKDAY
				modifyTestWindow(vectorOfWeekDay, document.getElementById('n_seek_value'), document.getElementById('n_call_option'), document.getElementById('n_call_link'), document.getElementById('n_call_link2'));
				switch (p_SeekValue){
					case "0-NO"://NO
						document.popUpForm.n_call_option.selectedIndex = 0;
						break;
					case "1-YES"://YES
						document.popUpForm.n_call_option.selectedIndex = 1;
						break;
					default:
						alert("ERREUR - sbr_box_callcondition.js" + '\n' + "p_SeekValue invalide case WEEKDAY" + '\n' + "value=" + p_SeekValue);
				}
				break;
			case 1://DAYNAME || DAYOFWEEK
				if (p_CallProperty == "DAYNAME") modifyTestWindow(vectorOfDayName, document.getElementById('n_seek_value'), document.getElementById('n_call_option'), document.getElementById('n_call_link'), document.getElementById('n_call_link2'));
				else modifyTestWindow(vectorOfDayNumber, document.getElementById('n_seek_value'), document.getElementById('n_call_option'), document.getElementById('n_call_link2'), document.getElementById('n_call_link'));
				
				if (p_SeekValue == "1-MONDAY" || p_SeekValue == "1") document.popUpForm.n_call_option.selectedIndex = 0;
				else if (p_SeekValue == "2-TUESDAY" || p_SeekValue == "2") document.popUpForm.n_call_option.selectedIndex = 1;
				else if (p_SeekValue == "3-WEDNESDAY" || p_SeekValue == "3") document.popUpForm.n_call_option.selectedIndex = 2;
				else if (p_SeekValue == "4-THURSDAY" || p_SeekValue == "4") document.popUpForm.n_call_option.selectedIndex = 3;
				else if (p_SeekValue == "5-FRIDAY" || p_SeekValue == "5") document.popUpForm.n_call_option.selectedIndex = 4;
				else if (p_SeekValue == "6-SATURDAY" || p_SeekValue == "6") document.popUpForm.n_call_option.selectedIndex = 5;
				else if (p_SeekValue == "7-SUNDAY" || p_SeekValue == "7") document.popUpForm.n_call_option.selectedIndex = 6;
				else alert("ERREUR - sbr_box_callcondition.js" + '\n' + "p_SeekValue invalide case DAYNAME || DAYOFWEEK" + '\n' + "value=" + p_SeekValue);
				break;
			case 2://MONTHNAME || MONTHOFYEAR
				if (p_CallProperty == "MONTHNAME") modifyTestWindow(vectorOfMonthName, document.getElementById('n_seek_value'), document.getElementById('n_call_option'), document.getElementById('n_call_link'), document.getElementById('n_call_link2'));
				else modifyTestWindow(vectorOfMonthNumber, document.getElementById('n_seek_value'), document.getElementById('n_call_option'), document.getElementById('n_call_link2'), document.getElementById('n_call_link'));
				
				if (p_SeekValue == "1-JANUARY" || p_SeekValue == "1") document.popUpForm.n_call_option.selectedIndex = 0;
				else if (p_SeekValue == "2-FEBRUARY" || p_SeekValue == "2") document.popUpForm.n_call_option.selectedIndex = 1;
				else if (p_SeekValue == "3-MARCH" || p_SeekValue == "3") document.popUpForm.n_call_option.selectedIndex = 2;
				else if (p_SeekValue == "4-APRIL" || p_SeekValue == "4") document.popUpForm.n_call_option.selectedIndex = 3;
				else if (p_SeekValue == "5-MAY" || p_SeekValue == "5") document.popUpForm.n_call_option.selectedIndex = 4;
				else if (p_SeekValue == "6-JUNE" || p_SeekValue == "6") document.popUpForm.n_call_option.selectedIndex = 5;
				else if (p_SeekValue == "7-JULY" || p_SeekValue == "7") document.popUpForm.n_call_option.selectedIndex = 6;
				else if (p_SeekValue == "8-AUGUST" || p_SeekValue == "8") document.popUpForm.n_call_option.selectedIndex = 7;
				else if (p_SeekValue == "9-SEPTEMBER" || p_SeekValue == "9") document.popUpForm.n_call_option.selectedIndex = 8;
				else if (p_SeekValue == "10-OCTOBER" || p_SeekValue == "10") document.popUpForm.n_call_option.selectedIndex = 9;
				else if (p_SeekValue == "11-NOVEMBER" || p_SeekValue == "11") document.popUpForm.n_call_option.selectedIndex = 10;
				else if (p_SeekValue == "12-DECEMBER" || p_SeekValue == "12") document.popUpForm.n_call_option.selectedIndex = 11;
				else alert("ERREUR - sbr_box_callcondition.js" + '\n' + "p_SeekValue invalide case MONTHNAME" + '\n' + "value=" + p_SeekValue);	
			default:
				break;
			}			
		}
		else{ //on n'a pas WEEKDAY || DAYNAME || MONTHNAME || DAYOFWEEK || MONTHOFYEAR
			document.popUpForm.n_seek_value.value = p_SeekValue;
			document.popUpForm.n_call_option.style.display = "none";
			document.popUpForm.n_seek_value.style.display = "block";
		}
	}
	else{
		document.popUpForm.n_seek_value.value = "";
		document.popUpForm.n_seek_value.value = p_SeekValue;
		document.popUpForm.n_call_option.style.display = "none";
		document.popUpForm.n_seek_value.style.display = "block";
	}
	CCSetupDialogObj = document.getElementById('CCSetupDialog');
	CCSetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-CCSetupDialogObj.clientHeight/2;
	CCSetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-CCSetupDialogObj.clientWidth/2;	
	CCSetupDialogObj.style.visibility = "visible";	
}

//This function close the Call Condition text box
function closetheCC(unID)
	{
		backupDiagramNow();
		//Retrieve the unID wanted
		foundAt = 0;
		hasBeenfound = false;
		for(i = 0; i < vectorCallConditions.length; i++)
		{
			if(vectorCallConditions[i].uID == unID) //des qu on le trouve...
			{
				foundAt = i;
				hasBeenfound = true;
			}
			if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
			{
				if(i == vectorCallConditions.length-1)
					vectorCallConditions.pop();
				else
					vectorCallConditions[i] = vectorCallConditions[i+1];
			}
		}	
		
		//LINKS
		if(hasBeenfound)
		{
			var bNewArray = new Array();
			for(i = 0; i < vectorLinks.length; i++)			
			{
				if((vectorLinks[i].startID != unID || vectorLinks[i].startType != "CC")  && 
					(vectorLinks[i].endID != unID || vectorLinks[i].endType != "CC"))
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
		reDisplayObj( "IDCallCondition_"+unID, "" );
		enableSaving();
	}
	
	
function addCallCondition()
{
	var newOne = new CallConditionTest();
	nbCCCreated++;
	nbScrpElementCreated++;
	newOne.uID = nbCCCreated;	
	newOne.VUID = nbScrpElementCreated;	
	//alert('VUID='+VUID)
	vectorCallConditions.push(newOne);	
	scriptHasBeenModified = true;
	//refreshDiagramInside();	
	addNewDivisionToDiagram( newOne.buildHTML() );
}


function clickOnAddExtraData(uId)
{
	//Open the add extra data dialog...
	PMSetupDialog.style.visibility = "hidden";
	CESetupDialog.style.visibility = "hidden";	
	PISetupDialog.style.visibility = "hidden";
	PESetupDialog.style.visibility = "hidden";	
	extraDataMess.style.visibility = "hidden";
	
	extraDataMess.style.top = document.body.clientHeight/2-extraDataMess.clientHeight/2;
	extraDataMess.style.left = document.body.clientWidth/2-extraDataMess.clientWidth/2;	
				
	showMasqueIframe(extraDataMess.style.top, extraDataMess.style.left, extraDataMess.clientWidth, extraDataMess.clientHeight);
	extraDataMess.style.visibility = "visible";
}

function setAddExtraData(uId)
{
	
}


function cancelAddExtraData()
{	
	extraDataMess.style.visibility = "hidden";	
	hideMasqueIframe();
}

