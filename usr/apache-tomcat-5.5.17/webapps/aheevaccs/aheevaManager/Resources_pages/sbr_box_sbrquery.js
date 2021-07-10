// JavaScript Document

function SqlQuery()
{
	this.uID = 0;
	this.sql_query = "";
	this.res_name = "";
	this.next = "";
	this.xPos 				= "0px";
	this.yPos 				= "0px";
	this.VUID = 0;
	this.nextVUID = 0;
	
	
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
		if(this.sql_query != "")
			{
			buttonValue = 'Query [';
			if(this.sql_query.length > 20)
				buttonValue += this.sql_query.substring(0, 20)+' ...';
			else
				buttonValue += this.sql_query;				
			buttonValue += ']';			
			}
		else
			buttonValue = "Setup";
		
		
		sReturn =  '<div id="IDSqlQuery_'+this.uID+'"';
		sReturn += ' uID = "'+this.uID+'"';
		sReturn += ' xPos = "'+this.testedPropertyID+'"';
		sReturn += ' yPos = "'+this.LinkType+'"';		
		sReturn += ' class="defaultSqlQuery" style="top:'+this.yPos+'; left:'+this.xPos+'"';
		sReturn += ' ';
		sReturn += ' >';
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';		
		sReturn += '<tr bgcolor="#DECAB6"><td nowrap width="90%" style="cursor:move;" onMouseDown="dragThis(\'IDSqlQuery_'+this.uID+'\')"><b>'+query[0]+' #'+this.uID;
		if(DEBUG)
			sReturn += ' ID['+this.VUID+']';
		sReturn += '</b></td>';
		sReturn += '<td align="right"><a href="javascript:closetheSQ('+this.uID+')">';
		sReturn += '<img src="../img/close2.gif" border="0" alt="Delete" align="right"></a></td></tr>';
		sReturn += '<tr><td colspan="2" class="entryTD" onClick="setUpPotentialEndLnk(\''+this.uID+'\', \'SQ\', \''+this.VUID+'\')"><i>'+query[1]+'</i></td></tr>';
		sReturn += '<tr><td colspan="2"><input type="button" onClick="setUpSQ(\''+this.uID+'\')" ';
		sReturn += 'value="'+buttonValue+'" class="setupButton"></td></tr>';
		sReturn += '<tr><td colspan="2" nowrap class="onsuccedTD" onClick="setUpPotentialStartLnk(\''+this.uID+'\', \'onNext\', \'SQ\', \''+this.VUID+'\')"><i>'+query[2]+'';
		if(DEBUG)
			sReturn += ' -->['+this.nextVUID+']';
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
		if(this.sql_query == "")
		{
			alert(query[3]+this.uID);
			
			retrieveTmpMessage();
			bReturn = false;
			setUpSQ(this.uID);
		}
		else if(this.sql_query.trim().toLowerCase().indexOf("select") == 0)
		{
			if(this.res_name == "")		
			{
				alert(query[4]+this.uID);
				
				retrieveTmpMessage();
				bReturn = false;
				setUpSQ(this.uID);
			}
		}	
		return bReturn;
	}
	
	this.softvalidate = function()
	{
		var rArray = new Array();
		var tmpmess;
		var tmptext = "";
		var tmponclick = 'setUpSQ(\''+this.uID+'\')';
		
		
		if(this.sql_query == "")
		{
			tmpmess = new softValidationMess();			
			tmptext = 'Error: Missing SQL Query for Database Request #'+this.uID;
			tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
			rArray.push(tmpmess);		
		}
		if(this.sql_query.trim().toLowerCase().indexOf("select") == 0)
		{
			if(this.res_name == "")		
			{
				tmpmess = new softValidationMess();			
				tmptext = 'Error: Missing result name for Database Request #'+this.uID;
				tmpmess.setMessage('ERROR', tmptext, SOFT_VALIDATION_ERROR_IMG, tmponclick);
				rArray.push(tmpmess);
			}
		}	
		return rArray;
	}
}

function closeSetUpSQ()
{
	document.getElementById('SQSetupDialog').style.visibility = "hidden";
}

function submitSetUpSQ()
{
	var i;
	var j;
	for(i = 0; i < vectorSqlQueries.length; i++)
	{		
		if(vectorSqlQueries[i].uID == document.getElementById('SQSetupDialog_TD1').innerText)
		{			
			vectorSqlQueries[i].sql_query = replacenewLineCaracters( document.popUpForm.SQSetupDialog_sql_query.value );
			vectorSqlQueries[i].res_name  = document.popUpForm.SQSetupDialog_varname.value;
			
			if(vectorSqlQueries[i].res_name  != "")
			{
				for(j = 0; j < nbFieldsInQuery(vectorSqlQueries[i].sql_query); j++ )
					addAddExtraData(vectorSqlQueries[i].res_name+'['+j+']');
			}
			break;
		}
	}
	document.getElementById('SQSetupDialog').style.visibility = "hidden";
	
	scriptHasBeenModified = true;
	//Display the whole graph
	//refreshDiagramInside();	
	reDisplayObj("IDSqlQuery_"+vectorSqlQueries[i].uID, vectorSqlQueries[i].buildHTML());
	enableSaving();
}




function setUpSQ(p_uID)
{
	hideAllToolsOptions();
	
	//Go and get the Sql and the ResName
	var i;
	for(i = 0; i < vectorSqlQueries.length; i++)
	{
		if(vectorSqlQueries[i].uID == p_uID)
		{
			p_sql = vectorSqlQueries[i].sql_query;
			p_res_name = vectorSqlQueries[i].res_name;			
			break;
		}		
	}	
	
	document.getElementById('SQSetupDialog_TD1').innerText = p_uID;
	buildSelectFromVector(document.popUpForm.SQSetupDialog_callprop, vectorOfCallProperties);
	if(p_sql != "" && p_sql != "undefined")
		document.popUpForm.SQSetupDialog_sql_query.value = p_sql;	
	else
		document.popUpForm.SQSetupDialog_sql_query.value = "";
	
	if(p_res_name != "" && p_res_name != "undefined")
		document.popUpForm.SQSetupDialog_varname.value = p_res_name;		
	else
		document.popUpForm.SQSetupDialog_varname.value = "";		
		
	SQSetupDialogObj = document.getElementById('SQSetupDialog');
	SQSetupDialogObj.style.top = document.body.scrollTop + document.body.clientHeight/2-SQSetupDialogObj.clientHeight/2;
	SQSetupDialogObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-SQSetupDialogObj.clientWidth/2;
	
	SQSetupDialogObj.style.visibility = "visible";	
}

function closetheSQ(unID)
{
	//Retrieve the unID wanted
	var i;
	foundAt = 0;
	hasBeenfound = false;
	for(i = 0; i < vectorSqlQueries.length; i++)
	{
		if(vectorSqlQueries[i].uID == unID) //des qu on le trouve...
		{
			foundAt = i;
			hasBeenfound = true;
		}
		if(i >= foundAt && hasBeenfound)  //Ramener tous les autres des positions precedentes
		{
			if(i == vectorSqlQueries.length-1)
				vectorSqlQueries.pop();
			else
				vectorSqlQueries[i] = vectorSqlQueries[i+1];
		}
	}	
	
	//LINKS
	if(hasBeenfound)
	{
		var bNewArray = new Array();
		for(i = 0; i < vectorLinks.length; i++)			
		{
			if( (vectorLinks[i].startID != unID || vectorLinks[i].startType != "SQ")  && 
				(vectorLinks[i].endID != unID || vectorLinks[i].endType != "SQ")  )
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
	reDisplayObj( "IDSqlQuery_"+unID, "");
	enableSaving();
}


function addSqlQuery()
{	
	var newOne = new SqlQuery();
	nbSQCreated++;
	nbScrpElementCreated++;	
	newOne.uID = nbSQCreated;	
	newOne.VUID = nbScrpElementCreated;
	
	vectorSqlQueries.push(newOne);	
	
	scriptHasBeenModified = true;
	//refreshDiagramInside();	
	addNewDivisionToDiagram( newOne.buildHTML() );
}

function nbFieldsInQuery(q_string)
{
	var nb = 0;
	var i;
	var old_execption = "";
	
	var q_stringt = q_string.trim().toLowerCase();
		
	if( q_stringt.indexOf("select") == 0 ) //only if we have a select query
	{
		var from_place = q_stringt.indexOf(" from");
		var fields = "";
		if(from_place != -1)
		{
			fields = q_stringt.substring("select".length, from_place).trim();
		}
		else
		{
			fields = q_stringt.substring("select".length, q_stringt.length).trim();
		}
			
		if(fields != "")
			nb = 1;
		for(i = 0; i < fields.length; i++)
		{
			switch(fields.charAt(i))
			{
				case ',':						
					if(old_execption == "")
						nb++;					
				break;
				case '(':
					old_execption = fields[i];
				break;
				case ')':
					old_execption = "";
				break;					
			}	
			
		}						
		
	}
	
	return nb;	
}

function addThistoQSArea(text)
{
	insertAtCursor(document.popUpForm.SQSetupDialog_sql_query, text);
}

/* 
 * (): 
 * Parameters
 * Return value: 
 */
function addTextToSQLField()
{
	if(document.popUpForm.SQSetupDialog_callprop.value!='') 
	{
		addThistoQSArea('"$'+document.popUpForm.SQSetupDialog_callprop.options[document.popUpForm.SQSetupDialog_callprop.selectedIndex].text+'"')
	}
}
