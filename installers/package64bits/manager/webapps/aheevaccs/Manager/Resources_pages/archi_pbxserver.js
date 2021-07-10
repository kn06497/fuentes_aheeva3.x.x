// JavaScript Document

function PbxServer()
{
	this.asteriskUid = 0;
	this.switch_name = "";
	this.switch_pass = "";
	this.siwtch_site_uId = -1;
	this.switch_site_name = "";
	this.switch_load_balance_agents = "";
	this.switch_load_balance_outbound  = "";
	this.internal_host = "";
	this.internal_port = "";
	this.external_host = "";
	this.external_port = "";
	this.status = 'unknow';
	this.connectedAgents = 0;
	this.outboundDials = 0;
	this.lastStatusTime = 0;
	this.deleted = 'false';
	this.oldswitch_name = '';
	
	this.xPos = 0;
	this.yPos = 0;
	
	this.buildHTML = function()
	{
		var sReturn = "";
		sReturn += '<div id="ArchiPBX_'+this.asteriskUid+'"';
		if(this.siwtch_site_uId == -1)
			sReturn += ' class="ArchiPBX" style="top:'+this.yPos+'px; left:'+this.xPos+'px;"';
		sReturn += '>';
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';
		sReturn += '<tr><td valign="bottom" align="center" onMouseDown="dragThis(\'ArchiPBX_'+this.asteriskUid+'\')">';
		sReturn += '<img src="../img/pbx_server.gif" width="40" height="50" ';
		sReturn += ' style="cursor: pointer" onClick="setupPBX('+this.asteriskUid+')">';
		
		
		if(this.status == 'unknow')
		{
			sReturn += '<img id="status_image_'+this.asteriskUid+'" src="../img/hum.gif" width="16" height="16" style="position:absolute;"';
			sReturn += ' onmouseover="displaySwitchInfos(event, '+this.asteriskUid+')" onmouseout="retriveSwitchInfos(event)">';
		}
		
				
		sReturn += '</td></tr>';
		sReturn += '<tr><td nowrap><input name="ArchiPBX_name_'+this.asteriskUid+'" value="'+this.switch_name+'" ';
		sReturn += 'class="archi_input_title" onBlur="setAsteriskName('+this.asteriskUid+')" old_value="'+this.oldswitch_name+'" ';
		if(this.switch_name != '')
			sReturn += 'disabled';
		sReturn += ' deleted="'+this.deleted+'" switch_uid="'+this.asteriskUid+'">';
		sReturn += '</td></tr>';
		if(this.switch_name != '')
		{
			sReturn += '<tr><td nowrap align="center" class="archi_text2">';
			sReturn += '[Site: ';
			if(this.switch_site_name == '')
				sReturn += 'None';
			else
				sReturn += this.switch_site_name;
			sReturn += ']';
			sReturn += '</td></tr>';			
		}
		if(this.deleted == 'true')
		{
			sReturn += '<tr><td nowrap align="center" class="archi_redtd">';
			sReturn += 'Deleted';
			sReturn += '</td></tr>';
		}
		
		
		sReturn += '</table>';
		sReturn += '</div>';		
		return sReturn;
	}	
	
	this.makeCenter = function(leftTab)
	{
		if(leftTab == null)
			leftTab = 0;
			
		var diagramObj = document.getElementById('diagramInside');
		var networkLnkObj = document.getElementById('NetworkLink');
		var pbxObj = document.getElementById('ArchiPBX_'+this.asteriskUid);	
		
		
		pbxObj.style.left 	= leftTab*(pbxObj.clientWidth+5);		
		pbxObj.style.top 	= theNetworkLink.yPos + networkLnkObj.clientHeight + 20;
		
		this.xPos  	= leftTab*(pbxObj.clientWidth+5);
		this.yPos	= theNetworkLink.yPos + networkLnkObj.clientHeight + 20;
	}
}


function add_switch()
{
	var newOne = new PbxServer();
	SwitchList.push(newOne);
	newOne.asteriskUid = SwitchList.length;
	addDivisionToDiagram(newOne.buildHTML());
	
	//Add the link to the CTI server
	var newLink = new Link();	
	newLink.switch_start_Uid = newOne.asteriskUid;
	newLink.setMembers();
	LinkList.push(newLink);
	newLink.linkUid = LinkList.length;
	addDivisionToDiagram(newLink.buildHTML());	
}


function getSwitchByUid(uid)
{
	var bReturn = null;
	for(var i = 0; i < SwitchList.length; i++)
	{
		if(SwitchList[i].asteriskUid == uid)
		{
			bReturn = SwitchList[i];
			break;
		}		
	}
	return bReturn;
}

function setAsteriskName(astUid)
{
	for(var i = 0; i < 	SwitchList.length; i++)
	{
		if(SwitchList[i].asteriskUid == astUid)
		{
			var str = 'document.theForm.ArchiPBX_name_'+SwitchList[i].asteriskUid+'.value';
			SwitchList[i].switch_name = eval(str);
			break;
		}	
	}
}


function setupPBX(pbxUid)
{
	buildSitesArray(document.theForm.pbxSetup_siteid);
	curasteriskUid = pbxUid;
		
	selectObjFromList(document.theForm.pbxSetup_siteid, "");
	document.theForm.pbxSetup_astname.value = "";
	document.theForm.pbxSetup_password.value = "";
	document.theForm.pbxSetup_internal_host.value = "";
	document.theForm.pbxSetup_internal_port.value = "4569";
	document.theForm.pbxSetup_external_host.value = "";
	document.theForm.pbxSetup_external_port.value = "4569";
	document.theForm.pbxSetup_load_agents.value = "";
	document.theForm.pbxSetup_load_outbound.value = "";
	
	for(var i = 0 ; i < SwitchList.length; i++)
	{
		if(pbxUid == SwitchList[i].asteriskUid && SwitchList[i].switch_site_name != "")
		{						
			selectObjFromList(document.theForm.pbxSetup_siteid, SwitchList[i].switch_site_name);
			document.theForm.pbxSetup_astname.value = SwitchList[i].switch_name;
			document.theForm.pbxSetup_password.value = SwitchList[i].switch_pass;
			document.theForm.pbxSetup_internal_host.value = SwitchList[i].internal_host;
			document.theForm.pbxSetup_internal_port.value = SwitchList[i].internal_port;
			document.theForm.pbxSetup_external_host.value = SwitchList[i].external_host;
			document.theForm.pbxSetup_external_port.value = SwitchList[i].external_port;
			document.theForm.pbxSetup_load_agents.value = SwitchList[i].switch_load_balance_agents;
			document.theForm.pbxSetup_load_outbound.value = SwitchList[i].switch_load_balance_outbound;
			break;
		}
	}
	
	var PbxSetupDialogObj = document.getElementById('PbxSetupDialog');	
	PbxSetupDialogObj.style.top = document.body.clientHeight/2-PbxSetupDialogObj.clientHeight/2;
	PbxSetupDialogObj.style.left = document.body.clientWidth/2-PbxSetupDialogObj.clientWidth/2;
	PbxSetupDialogObj.style.visibility = "visible";	
}