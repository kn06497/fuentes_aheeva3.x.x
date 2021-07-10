
// JavaScript Document

var save_current_custom_role_html 	= '&nbsp;&nbsp;<input type="text" value="" name="new_role_name">&nbsp;&nbsp;<input type="button" value="" id="save_current_custom_role_btn" onClick="save_new_role()">';
var delete_current_role_html 		= '&nbsp;&nbsp;<a href="#" value="" id="delete_current_role_btn" onclick="javascript:deleteSelectedRole()">&nbsp;&nbsp;';
//sort all the PredefinedRolesContained
for( var current_role in PredefinedRolesContained )
	PredefinedRolesContained[current_role].sort();



/* form coherence ----*/
var box_on_must_go_on = new Array(); //if a box (key) is checked, check all other boxes
box_on_must_go_on["ALLOW_TENANT_MANAGEMENT"] = new Array("ALLOW_CONFIGURATION_MANAGEMENT");
box_on_must_go_on["ALLOW_USER_MANAGEMENT"] = new Array("ALLOW_CONFIGURATION_MANAGEMENT");
box_on_must_go_on["ALLOW_NETWORK_CONFIGURATION"] = new Array("ALLOW_CONFIGURATION_MANAGEMENT");
box_on_must_go_on["ALLOW_LIVE_MONITORING_MANAGEMENT"] = new Array("ALLOW_CONFIGURATION_MANAGEMENT");

box_on_must_go_on["ALLOW_RESSOURCES_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW");
box_on_must_go_on["ALLOW_AGENT_GROUPS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");
box_on_must_go_on["ALLOW_AGENT_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");
box_on_must_go_on["ALLOW_CAMPAIGN_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");
box_on_must_go_on["ALLOW_CALLING_LIST_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");
box_on_must_go_on["ALLOW_DONOTCALL_LIST_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");
box_on_must_go_on["ALLOW_FILTER_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");
box_on_must_go_on["ALLOW_TREATMENTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");
box_on_must_go_on["ALLOW_NOT_READY_REASON_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");
box_on_must_go_on["ALLOW_QUEUES_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");
box_on_must_go_on["ALLOW_SKILLS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_RESSOURCES_MANAGEMENT");

box_on_must_go_on["ALLOW_QUALITY_MONITORING_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW");
box_on_must_go_on["ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_QUALITY_MONITORING_MANAGEMENT");
box_on_must_go_on["ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_QUALITY_MONITORING_MANAGEMENT");

box_on_must_go_on["ALLOW_HISTORICAL_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW");
box_on_must_go_on["ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");
box_on_must_go_on["ALLOW_HISTORICAL_LINEMANAGEMENT_REPORTS_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW","ALLOW_HISTORICAL_REPORTS_MANAGEMENT");


box_on_must_go_on["ALLOW_VIEW_AGENT_STATS"] = new Array("ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_VIEW_AGENTGROUP_STATS"] = new Array("ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_VIEW_QUEUES_STATS"] = new Array("ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_VIEW_CAMPAIGN_STATS"] = new Array("ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_VIEW_CALLING_LIST_STATS"] = new Array("ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_VIEW_PERFOMANCE_STATS"] = new Array("ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_VIEW_TEAM_STATS"] = new Array("ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_VIEW_ADHERENCE_STATS"] = new Array("ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_VIEW_LINE_MANAGEMENT_STATS"] = new Array("ALLOW_VIEW_LIVE_STATS");

box_on_must_go_on["ALLOW_MANAGER_CHANGE_AGENT_STATUS"] = new Array("ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_MANAGER_LOGGED_OUT_AGENT"] = new Array("ALLOW_MANAGER_CHANGE_AGENT_STATUS", "ALLOW_VIEW_AGENT_STATS", "ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP"] = new Array("ALLOW_MANAGER_CHANGE_AGENT_STATUS", "ALLOW_VIEW_AGENTGROUP_STATS", "ALLOW_VIEW_LIVE_STATS");
box_on_must_go_on["ALLOW_MANAGER_LIVE_MONITORING"] = new Array("ALLOW_VIEW_LIVE_STATS", "ALLOW_VIEW_AGENT_STATS");

box_on_must_go_on["ALLOW_MANAGER_WHISPER_TOAGENT"] = new Array("ALLOW_MANAGER_LIVE_MONITORING");
//box_on_must_go_on["ALLOW_MANAGER_WHISPER_TOCUSTOMER"] = new Array("ALLOW_MANAGER_LIVE_MONITORING");

box_on_must_go_on["ALLOW_MOP_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW");
box_on_must_go_on["ALLOW_WORK_FORCE_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW");
box_on_must_go_on["ALLOW_PAYROLL_INFORMATION_REPORT"] = new Array("ALLOW_TENANT_VIEW");

box_on_must_go_on["ALLOW_ROUTING_SCRIPT_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW");

box_on_must_go_on["ALLOW_MESSAGE_CENTER_MANAGEMENT"] = new Array("ALLOW_TENANT_VIEW");

  
var box_on_must_go_off = new Array(); //if a box (key) is checked, uncheck all other boxes

var box_off_must_go_on = new Array(); //if a box (key) is unchecked, check all other boxes - transposee de box_on_must_go_off
var box_off_must_go_off = new Array(); //if a box (key) is unchecked, uncheck all other boxes - transposee de box_on_must_go_on

var key;
for( key in box_on_must_go_off )
{
	for( var i = 0; i < box_on_must_go_off[key].length; i++ )
	{
		if( !box_off_must_go_on[box_on_must_go_off[key][i]] )
			box_off_must_go_on[box_on_must_go_off[key][i]] = new Array();
		box_off_must_go_on[box_on_must_go_off[key][i]].push(key);
	}
}

for( key in box_on_must_go_on )
{
	for( var i = 0; i < box_on_must_go_on[key].length; i++ )
	{
		if( !box_off_must_go_off[box_on_must_go_on[key][i]] )
			box_off_must_go_off[box_on_must_go_on[key][i]] = new Array();
		box_off_must_go_off[box_on_must_go_on[key][i]].push(key);
	}
}


function boxclicked_byuser(box_name, box_value)
{
	if( box_value ) //box has been activated
	{
		if( box_on_must_go_on[box_name] )	//if this box activation must force other box activation
		{
			for( var i = 0; i < box_on_must_go_on[box_name].length; i++ )
				if( !isBoxActive(box_on_must_go_on[box_name][i]) )
					changeBoxStatus(box_on_must_go_on[box_name][i], true);
		}
		if( box_on_must_go_off[box_name] )	//if this box activation must force other box activation
		{
			for( var i = 0; i < box_on_must_go_off[box_name].length; i++ )
				if( isBoxActive(box_on_must_go_off[box_name][i]) )
					changeBoxStatus(box_on_must_go_off[box_name][i], false);
		}
	}
	else
	{
		if( box_off_must_go_on[box_name] )	//if this box activation must force other box activation
		{
			for( var i = 0; i < box_off_must_go_on[box_name].length; i++ )
				if( !isBoxActive(box_off_must_go_on[box_name][i]) )
					changeBoxStatus(box_off_must_go_on[box_name][i], true);
		}
		if( box_off_must_go_off[box_name] )	//if this box activation must force other box activation
		{
			for( var i = 0; i < box_off_must_go_off[box_name].length; i++ )
				if( isBoxActive(box_off_must_go_off[box_name][i]) )
					changeBoxStatus(box_off_must_go_off[box_name][i], false);
		}
	}
	
	/* analyze the whole thing to see if this match a role */
	deductRoleFromCheckedOptions();
	
}

function isBoxActive( boxname )
{
	var ret = false;
	var obj = document.getElementById(boxname);
	if( obj )
		ret = obj.checked;
		
	return ret;
}

function changeBoxStatus( boxname, active )
{	
	var obj = document.getElementById(boxname);
	if( obj )
		obj.checked = active;	
}

function roleSelected(role_name)
{
	/* uncheck all + check selected */
	//see if this role is a system-defined one
	var found = 0;
	for(var j = 0; j<systemRoles.length; j++)
	{
		if(role_name == systemRoles[j])
		{
			found =1;
			break;
		}
	} //alert("found: "+found );
	if(found == 1)
	{
		var obj = document.getElementById('save_current_custom_role_td');
		if( obj )
			obj.innerHTML = "";
			
		uncheck_all();
		if( PredefinedRolesContained[role_name] )
			for( var i = 0; i < PredefinedRolesContained[role_name].length; i++ )
				if( !isBoxActive( PredefinedRolesContained[role_name][i] ) )
					changeBoxStatus( PredefinedRolesContained[role_name][i], true );
	}
	
	else if( role_name != "ROLE_CUSTOM" )
	{
		
		var obj = document.getElementById('save_current_custom_role_td');
		if( obj )
			obj.innerHTML = delete_current_role_html;
		obj = document.getElementById('delete_current_role_btn');
		if( obj )
			obj.innerText = UsrMa[1];
		
		
		uncheck_all();
		if( PredefinedRolesContained[role_name] )
			for( var i = 0; i < PredefinedRolesContained[role_name].length; i++ )
				if( !isBoxActive( PredefinedRolesContained[role_name][i] ) )
					changeBoxStatus( PredefinedRolesContained[role_name][i], true );
	}
	else /* role custom has been selected - display the save as div */
	{
		var obj = document.getElementById('save_current_custom_role_td');
		if( obj )
			obj.innerHTML = save_current_custom_role_html;	
		obj= document.getElementById('save_current_custom_role_btn');
		if( obj )
			obj.innerText =UsrMa[2];
	}
}

function deductRoleFromCheckedOptions()
{
	var checkoptions_array = new Array();
	
	// calculate the array of checkoptions_array
	var objs = document.getElementsByTagName('input');
	for(var i = 0; i < objs.length; i++)
		if( objs[i].type == 'checkbox' )
			if( objs[i].id.indexOf("ALLOW_") == 0 || objs[i].name.indexOf("ALLOW_") == 0)
				if(objs[i].checked)
					checkoptions_array.push((objs[i].id.length != 0) ? objs[i].id : objs[i].name);
	checkoptions_array.sort();

	// 
	var role_founded 	= false;
	var selected_role 	= null;
	for( var current_role in PredefinedRolesContained )
	{		
		if( identicArrays(PredefinedRolesContained[current_role], checkoptions_array) )
		{
			
			role_founded = true;
			selected_role = current_role;
			break;
		}		
	}	
	if( !role_founded )	/* no role has been found - custom role then */
		selected_role = "ROLE_CUSTOM";		
	selectRole(selected_role);
	
} 

function selectRole( role_name )
{	
	var obj = document.getElementById("role");
	if( obj )
	{
		for( var i = 0; i < obj.options.length; i++ )
		{
			if( obj.options[i].value == role_name )
			{
				obj.options[i].selected = true;
				break;
			}
		}
		
		if( role_name == "ROLE_CUSTOM" )
		{
			obj = document.getElementById('save_current_custom_role_td');
			if( obj )
				obj.innerHTML = save_current_custom_role_html;	
			obj= document.getElementById('save_current_custom_role_btn');
			if( obj )
			obj.innerText = UsrMa[2];
		}	
		else
		{
			obj = document.getElementById('save_current_custom_role_td');
			if( obj )
				obj.innerHTML = delete_current_role_html;
		}
						
	}
}

function uncheck_all()
{
	var objs = document.getElementsByTagName('input');
	for(var i = 0; i < objs.length; i++)
		if( objs[i].type == 'checkbox' )
			if( objs[i].id.indexOf("ALLOW_") == 0 || objs[i].name.indexOf("ALLOW_") == 0)
				objs[i].checked = false;
}

function check_all()
{
	var objs = document.getElementsByTagName('input');	
	for(var i = 0; i < objs.length; i++)
		if( objs[i].type == 'checkbox' )
			if( objs[i].id.indexOf("ALLOW_") == 0 || objs[i].name.indexOf("ALLOW_") == 0)
				objs[i].checked = true;	
}

/* interface functions */
function changeMoveButtons( type, position )
{
	var button_name 	= "";
	var button_name2 	= "";
	switch( position )
	{
		case "LEFT":
			button_name = "b_add_";
			button_name2 = "b_retrieve_";
		break;
		case "RIGHT":
			button_name = "b_retrieve_";
			button_name2 = "b_add_";
		break;
	}
	button_name  += type;
	button_name2 += type;
		
	var obj = null;
	obj = document.getElementById(button_name);
	if( obj )
		obj.disabled = false;
	obj = document.getElementById(button_name2);
	if( obj )
		obj.disabled = true;
}


function move_option( type, direction )
{
	var button_name 	= "";
	var button_name2 	= "";
	var left_select_obj	= null;
	var right_select_obj= null;
	
	var button_obj1		= null;
	var button_obj2		= null;
	
	button_name = "b_add_";
	button_name2 = "b_retrieve_";	
	button_name  += type;
	button_name2 += type;
	
	button_obj1 = document.getElementById( button_name );
	button_obj2 = document.getElementById( button_name2 );
	
	if( direction == "LEFT_RIGHT" )
	{
		left_select_obj		= 'available_'+type;
		right_select_obj	= 'assigned_'+type;
	} 
	else
	{
		right_select_obj		= 'available_'+type;
		left_select_obj			= 'assigned_'+type;	
	}
	
	switchOptionsFromSelectBoxes(left_select_obj, right_select_obj);
	
	//var maPos;
	//var myOption;
	
	
	////Trouver le option selectionnee
	//	for(var i=0; i < left_select_obj.options.length; i++)	
	//	{
	//		if( left_select_obj.options[i].selected )
	//		{
	//			maPos = i;
	//			myOption = new Option(left_select_obj.options[i].text, left_select_obj.options[i].value);
	//			break;
	//		}
	//	}
	//		
	//	// ajouter l option
	//	right_select_obj.options[right_select_obj.length] = myOption;
	//	
	//	//Enlever  l option deja chosiie et remonter les autres
	//	
	//	for(var i=0; i < (left_select_obj.options.length-1); i++)
	//	{		
	//		if(i >= maPos)
	//		{
	//			uneOption = new Option(left_select_obj.options[i+1].text, left_select_obj.options[i+1].value);
	//			left_select_obj.options[i] = uneOption;
	//		}
	//	}
	//	left_select_obj.length = left_select_obj.length - 1;	
	
	button_obj1.disabled = true;
	button_obj2.disabled = true;	
}

function move_left_right( type )
{
	move_option( type, "LEFT_RIGHT" );
}

function move_right_left( type )
{
	move_option( type, "RIGHT_LEFT" );
}

function retrieveOptionFromSelect(select_object, obj_value)
{
	if( select_object )
	{
		var pos = null;
		for( var i = 0; i < select_object.options.length; i++ )
		{
			if( select_object.options[i].value == obj_value)
			{
				pos = i;
				break;
			}
		}
		
		if( pos != null)
		{
			for(var i=0; i < (select_object.options.length-1); i++)
			{		
				if(i >= pos)
				{
					var uneOption = new Option(select_object.options[i+1].text, select_object.options[i+1].value);
					select_object.options[i] = uneOption;
				}
			}
			select_object.length = select_object.length - 1;
		}
	}
}

function addOptionToSelect(select_object, name, value)
{
	if(select_object) 
	{
		var already_exist = false;
		for(var i = 0; i < select_object.options.length && !already_exist; i++)
		{
			if( select_object.options[i].value == name)
				already_exist = true;
		}
		
		if( !already_exist )
		{
			var uneOption = new Option(name, name);
			select_object.options[select_object.options.length] = uneOption;
			PredefinedRolesContained[name] = value.split(",").sort();
		}
	}
}

/* utils - */
function identicArrays(array01, array02)
{	
	var ret = true;	
	if( array01.length != array02.length )
		ret = false;
	else
	{
		for( var i = 0; i < array01.length; i++ )
		{
			if( array01[i] != array02[i] )
			{
				ret = false;
				break;
			}
		}	
	}	
	return ret;
}

function getNewRitghsStr()
{
	var sreturn = '';
	var objs = document.getElementsByTagName('input');
	
	for(var i = 0; i < objs.length; i++)
		if( objs[i].type == 'checkbox' )
			if( objs[i].id.indexOf("ALLOW_") == 0 || objs[i].name.indexOf("ALLOW_") == 0)
				sreturn += '<'+objs[i].name+' value="'+(objs[i].checked ? "yes" : "no")+'"/>';	
	return sreturn;
}

function packageAllowRessources()
{
	var sreturn = '';
	for(var i = 0; i < document.theForm.assigned_TENANTS.options.length; i++)
		sreturn += '<resource ressource_type="TENANT" dbid="'+document.theForm.assigned_TENANTS.options[i].getAttribute("dbid")+'" resource_dbid="'+document.theForm.assigned_TENANTS.options[i].value+'" user_dbid="'+document.theForm.userdbid.value+'"/>';
	for(var i = 0; i < document.theForm.assigned_AGENTGROUPS.options.length; i++)
		sreturn += '<resource ressource_type="AGENTGROUP" dbid="'+document.theForm.assigned_AGENTGROUPS.options[i].getAttribute("dbid")+'"  resource_dbid="'+document.theForm.assigned_AGENTGROUPS.options[i].value+'" user_dbid="'+document.theForm.userdbid.value+'"/>';
	for(var i = 0; i < document.theForm.assigned_CAMPAIGNS.options.length; i++)
		sreturn += '<resource ressource_type="CAMPAIGN" dbid="'+document.theForm.assigned_CAMPAIGNS.options[i].getAttribute("dbid")+'"  resource_dbid="'+document.theForm.assigned_CAMPAIGNS.options[i].value+'" user_dbid="'+document.theForm.userdbid.value+'"/>';
	for(var i = 0; i < document.theForm.assigned_ROUTINGSCRIPTS.options.length; i++)
		sreturn += '<resource ressource_type="ROUTING_SCRIPT" dbid="'+document.theForm.assigned_ROUTINGSCRIPTS.options[i].getAttribute("dbid")+'"  resource_dbid="'+document.theForm.assigned_ROUTINGSCRIPTS.options[i].value+'" user_dbid="'+document.theForm.userdbid.value+'"/>';
	for(var i = 0; i < document.theForm.assigned_CALLINGLISTS.options.length; i++)
		sreturn += '<resource ressource_type="CALLING_LIST" dbid="'+document.theForm.assigned_CALLINGLISTS.options[i].getAttribute("dbid")+'"  resource_dbid="'+document.theForm.assigned_CALLINGLISTS.options[i].value+'" user_dbid="'+document.theForm.userdbid.value+'"/>';
	return sreturn;
}
/**
 * Validate that the password and its confirmation have the same value
 */
function validPassword()
{	
	var objPwd = document.getElementById("password"),
		objConfirmPwd = document.getElementById("password2"),
		ret = false;
		
	if((objPwd != null) && (objConfirmPwd != null) ){
		if(objPwd.value == objConfirmPwd.value)
			ret = true;
		else{
			alert(UsrMa[0]);
			objPwd.value = '';
			objConfirmPwd.value = '';
			objPwd.focus();
		}//end of else if(objPwd.value == objConfirmPwd.value)				
			
	}//end of if((objPwd != null) && (objConfirmPwd != null) )
	
	return ret;
}

