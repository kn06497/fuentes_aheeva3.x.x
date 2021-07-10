<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<%
	
	beanManagerData pageData = new beanManagerData();
	pageData.setDebug(false);
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else
		pageData.setDefaultLanguage("ENGLISH");	
	
	System.out.println("USER_LANGUAGE : "+(String)session.getAttribute("USER_LANGUAGE"));
	System.out.println("CURRENT_USER_DBID : "+(String)session.getAttribute("CURRENT_USER_DBID"));	
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	
	/* SQL Queries */
	String currentuser_assignedTenants 	= "(select ressource_dbid from cfg_user_authorize_ressources where user_dbid = '"+CURRENT_USER_DBID+"' and ressource_type = 'TENANT')";	
	String currentuser_assignedAgentGroup	= "(select ressource_dbid from cfg_user_authorize_ressources where user_dbid = '"+CURRENT_USER_DBID+"' and ressource_type = 'AGENTGROUP')";
	String userPrivilegesQuery 			= "select * from cfg_user where dbid='"+CURRENT_USER_DBID+"'";
	String tenantsDataQuery 			= "select dbid, name from cfg_tenant_info where (state is NULL || state != '0') and dbid in "+currentuser_assignedTenants + " ORDER BY name";
	//String agentGroupsDataQuery 		= "select dbid, tenant_dbid, name, state from cfg_agent_group where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='AGENTGROUP')";
	String active_agentGroupsDataQuery 	= "select dbid, tenant_dbid, name, state from cfg_agent_group where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='AGENTGROUP') AND cfg_agent_group.state='1' ORDER BY name";
	String inactive_agentGroupsDataQuery= "select dbid, tenant_dbid, name, state from cfg_agent_group where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='AGENTGROUP') AND cfg_agent_group.state<>'1' ORDER BY name";

//	String campaignsDataQuery			= "select dbid, name, tenant_dbid, state from cfg_campaign where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='CAMPAIGN')";
	String active_campaignsDataQuery	= "select dbid, name, tenant_dbid, state from cfg_campaign where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='CAMPAIGN') AND cfg_campaign.state = '1' ORDER BY name";
	String inactive_campaignsDataQuery	= "select dbid, name, tenant_dbid, state from cfg_campaign where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='CAMPAIGN') AND cfg_campaign.state<>'1' ORDER BY name";
	
	//String callinglistDataQuery		= "select dbid, name, table_name, tenant_dbid, state from cfg_calling_list where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='CALLING_LIST')";
	String active_callinglistDataQuery	= "select dbid, name, table_name, tenant_dbid, state from cfg_calling_list where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='CALLING_LIST') AND cfg_calling_list.state='1' ORDER BY name";
	String inactive_callinglistDataQuery= "select dbid, name, table_name, tenant_dbid, state from cfg_calling_list where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='CALLING_LIST') AND cfg_calling_list.state<>'1' ORDER BY name";
	
	String filtersDataQuery				= "select dbid, name, tenant_dbid, state from cfg_filter where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY name";

	//String usersDataQuery 				= "select dbid, username, state from cfg_user";
	String active_usersDataQuery		= "select dbid, username, state from cfg_user where state='1' ORDER BY username";
	String inactive_usersDataQuery		= "select dbid, username, state from cfg_user where state <>'1' ORDER BY username";
	
	String agentsDataQuery				= "select dbid, tenant_dbid, last_name, first_name, state, login_id from cfg_person where tenant_dbid in "+currentuser_assignedTenants + " and ( AGENT_GROUP_DBID IN "+currentuser_assignedAgentGroup + " or AGENT_GROUP_DBID = '0' ) ORDER BY last_name, first_name, login_id";
	String blacklistDataQuery			= "select dbid, name, tenant_dbid from black_list_group where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY name";
	String treatmentsDataQuery 			= "select dbid, tenant_dbid, name, state from cfg_treatment where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY name";
	String notreadyreasonsDataQuery 	= "select dbid, tenant_dbid, name, state from cfg_not_ready_reason where del=0 and tenant_dbid in "+currentuser_assignedTenants + " ORDER BY name"; 
	String queuemanagementDataQuery 	= "select dbid, tenant_dbid, queue from cfg_agent_group where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY queue"; 
	String skillsmanagementDataQuery 	= "select dbid, tenant_dbid, name from cfg_skills where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY name"; 
	String teammanagementDataQuery 		= "select dbid, tenant_dbid, team_name, team_leader from wfm_team where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY team_name"; 
	String currentactivitiesDataQuery 	= "select dbid, tenant_dbid, activity_name from cfg_activity where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY activity_name"; 
	String commissionsDataQuery 		= "select dbid, tenant_dbid, name, status from wfm_treatment where tenant_dbid in "+currentuser_assignedTenants+ " ORDER BY name"; 
	String mopsDataQuery 				= "select dbid, tenant_dbid, mop_name, status from wfm_mop where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY mop_name"; 
	String routingscriptsDataQuery 		= "select cfg_routing_script.dbid as dbid, cfg_routing_script.tenant_dbid as tenant_dbid, cfg_routing_script.script_name as script_name, cfg_routing_script.priority as priority, cfg_routing_script.status as status, cfg_tenant_info.name as tenant_name from cfg_routing_script, cfg_tenant_info where cfg_routing_script.tenant_dbid = cfg_tenant_info.dbid and cfg_routing_script.tenant_dbid in "+currentuser_assignedTenants + " and cfg_routing_script.dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='ROUTING_SCRIPT') ORDER BY script_name"; 

	//Popup Builder
	String popupbuilderDataQuery        = "select dbid, tenant_dbid, calling_list_dbid, description, popup_type, width, height, bgcolor, required_bgcolor, state from cfg_pop_popup where tenant_dbid in "+currentuser_assignedTenants+" or tenant_dbid = 0 ORDER BY description";

	//Evaluation Form
	String formsDataQuery				= "SELECT dbid,name,description,state,tenant_dbid,predefined FROM cfg_evltn_form where tenant_dbid  in "+currentuser_assignedTenants + " ORDER BY name";
	String answersDataQuery				= "SELECT dbid,name,description,state,tenant_dbid FROM cfg_evltn_answer where tenant_dbid  in "+currentuser_assignedTenants + " ORDER BY name";
	String labelsDataQuery				= "SELECT dbid,name,description,state,tenant_dbid FROM cfg_evltn_label where tenant_dbid  in "+currentuser_assignedTenants + " ORDER BY name";

		//message center
	String alertStarPhoneDataQuery		= "select dbid, tenant_dbid, name, state from cfg_mc_alert where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY name";
	//message center
	String statisticStarPhoneDataQuery		= "select dbid, tenant_dbid, name, state from cfg_mc_starphone_statistic where tenant_dbid in "+currentuser_assignedTenants + " ORDER BY name";
	
	pageData.openConnection();	
	pageData.executeFromString(userPrivilegesQuery);
	Vector <HashMap> userPrivilegesDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(tenantsDataQuery);
	Vector <HashMap> tenantsDataResult = pageData.CreateVectorFromBean();
	
	//pageData.executeFromString(agentGroupsDataQuery);
	//Vector <HashMap> agentGroupsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(active_agentGroupsDataQuery);
	Vector <HashMap> active_agentGroupsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(inactive_agentGroupsDataQuery);
	Vector <HashMap> inactive_agentGroupsDataResult = pageData.CreateVectorFromBean();

	//pageData.executeFromString(campaignsDataQuery);
	//Vector <HashMap> campaignsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(active_campaignsDataQuery);
	Vector <HashMap>active_campaignsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(inactive_campaignsDataQuery);
	Vector <HashMap> inactive_campaignsDataResult = pageData.CreateVectorFromBean();
	
	//pageData.executeFromString(callinglistDataQuery);
	//Vector <HashMap> callingListsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(active_callinglistDataQuery);
	Vector <HashMap> active_callingListsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(inactive_callinglistDataQuery);
	Vector <HashMap> inactive_callingListsDataResult = pageData.CreateVectorFromBean();
	//pageData.executeFromString(usersDataQuery);
	//Vector <HashMap> usersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(active_usersDataQuery);
	Vector <HashMap> active_usersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(inactive_usersDataQuery);
	Vector <HashMap> inactive_usersDataResult = pageData.CreateVectorFromBean();
	
	pageData.executeFromString(agentsDataQuery);
	Vector <HashMap> agentsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(blacklistDataQuery);
	Vector <HashMap> blacklistDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(filtersDataQuery);
	Vector <HashMap> filtersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(treatmentsDataQuery);
	Vector <HashMap> treatmentsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(notreadyreasonsDataQuery);
	Vector <HashMap> notreadyreasonsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(queuemanagementDataQuery);
	Vector <HashMap> queuemanagementDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(skillsmanagementDataQuery);
	Vector <HashMap> skillsmanagementDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(teammanagementDataQuery);
	Vector <HashMap> teammanagementDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(currentactivitiesDataQuery);
	Vector <HashMap> currentactivitiesDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(commissionsDataQuery);
	Vector <HashMap> commissionsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(mopsDataQuery);
	Vector <HashMap> mopsDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(routingscriptsDataQuery);
	Vector <HashMap> routingscriptsDataResult = pageData.CreateVectorFromBean();
	
		//message center
	pageData.executeFromString(alertStarPhoneDataQuery);
	Vector <HashMap> alertStarPhoneDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(statisticStarPhoneDataQuery);
	Vector <HashMap> statisticStarPhoneDataResult = pageData.CreateVectorFromBean();
	
	  // Adding Pop up
	pageData.executeFromString(popupbuilderDataQuery);
	Vector <HashMap> popupbuilderDataResult =pageData.CreateVectorFromBean();

	// Quality monitoring form
	pageData.executeFromString(formsDataQuery);
	Vector <HashMap> formsDataResult = pageData.CreateVectorFromBean();
	
	// Quality monitoring answers
	pageData.executeFromString(answersDataQuery);
	Vector <HashMap> answersDataResult = pageData.CreateVectorFromBean();

	// Quality monitoring labels
	pageData.executeFromString(labelsDataQuery);
	Vector <HashMap> labelsDataResult = pageData.CreateVectorFromBean();


	
	long startTime = System.currentTimeMillis();
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Menu</title>
<LINK href="Resources_pages/style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]>
<link href="Resources_pages/styleie6.css" rel="stylesheet" type="text/css" />
<![endif]-->

<base target="rbottom">


</style>


<script language="JavaScript" src="Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Resources_pages/Browser.js"></script>
<script language="javascript" type="text/javascript" src="lang_browser.js"></script>
<script language="JavaScript1.2">
/*
var head="display:''";
img1=new Image();
img1.src="img/fold.gif";
img2=new Image();
img2.src="img/open.gif";
*/


/*  not used ------ check before delete --------
var ns6=document.getElementById&&!document.all
var ie4=document.all&&navigator.userAgent.indexOf("Opera")==-1

function checkcontained(e){
	var iscontained=0
	cur=ns6? e.target : event.srcElement
	i=0
	if (cur.id=="foldheader" || cur.id=="foldheaderconfig")
		iscontained=1
	else
		while (ns6&&cur.parentNode||(ie4&&cur.parentElement))
		{
			if (cur.id=="foldheader"||IsInFoldingLists(cur.id) || cur.id=="foldheaderconfig")
			{
				iscontained=(cur.id=="foldheader" || cur.id=="foldheaderconfig")? 1 : 0;
					break;
			}
			cur=ns6? cur.parentNode : cur.parentElement
		}

	if (iscontained){

		var foldercontent=ns6? cur.nextSibling : cur.all.tags("UL")[0];

		if (foldercontent.style.display=="none"){
			foldercontent.style.display=""
			if(cur.id=="foldheaderconfig")
				cur.style.listStyleImage="url(img/foldco.gif)"
			else
				cur.style.listStyleImage="url(img/open.gif)"

		}
		else{
			foldercontent.style.display="none"
			if(cur.id=="foldheaderconfig")
				cur.style.listStyleImage="url(img/foldcf.gif)"
			else
				cur.style.listStyleImage="url(img/fold.gif)"
		}
	}
}

function IsInFoldingLists(name)
	{
	var sRet = false;
	if(name == "foldinglist")
		sRet = true;
	if(name == "foldinglist_agent")
		sRet = true;
	if(name == "foldinglist_agent_inactive")
		sRet = true;
	if(name == "foldinglist_group")
		sRet = true;
	if(name == "foldinglist_group_inactive")
		sRet = true;
	if(name == "foldinglist_server")
		sRet = true;
	if(name == "foldinglist_user")
		sRet = true;
	if(name == "foldinglist_user_inactive")
		sRet = true;
	if(name == "foldinglist_telephone")
		sRet = true;
	if(name == "foldinglist_historical")
		sRet = true;

	return sRet;
	}
end not used ------ check before delete -------- */	


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

function getRoutingScriptAndQueues(tenant_id)
{
	var rArray = new Array();
	var jsRSCripts = String( appletObj.getRoutingScripts(tenant_id, "1")  );
	var jsRSCRIPTArray = jsRSCripts.split("|");
	
		
	for(var i = 0; i < jsRSCRIPTArray.length; i++)
	{
		if(jsRSCRIPTArray[i].length != 0)
		{
			thisRScript = jsRSCRIPTArray[i].split(",");
			rArray.push(thisRScript[1]);
			//Get virtual queues in this script...
			var thisScriptText = String( appletObj.getRoutingScript(thisRScript[0]) );
			splitedString = thisScriptText.split('^');
			//var rootNoddle;
			for(var j = 0; j < splitedString.length; j++)
			{
				var curElement = splitedString[j];
				myElementTable = StringParse(curElement);
				if(myElementTable['TYPE'] == 'AGENTPICKUP')
				{
					for(var it = 0; it < rArray.length; it++){
						if(myElementTable['queueName'] == rArray[it] )
							break;
					}

					if(it >= rArray.length)
						rArray.push(myElementTable['queueName']);
				}
			}
		}
	}

	//alert(rArray);
	return rArray;
}


/*  not used ------ check before delete --------
function get_cookie(Name) 
{
	//Get cookie routine by Shelley Powers
	var search = Name + "="
	var returnvalue = "";
	if (document.cookie.length > 0) 
	{
		offset = document.cookie.indexOf(search)
		// if cookie exists
		if (offset != -1) 
		{
			offset += search.length
			// set index of beginning of value
			end = document.cookie.indexOf(";", offset);
			// set index of end of cookie value
			if (end == -1) end = document.cookie.length;
				returnvalue=unescape(document.cookie.substring(offset, end))
		}
	}
	return returnvalue;
}

function checkit()
{
  	for (i=0 ; i <= nodelength ; i++)
  	{
    	if ((ns6&&foldercontentarray[i].style.display=='')||(ie4&&foldinglist[i].style.display==''))
       		openones=openones + " " + i
  	}
	//alert('openones='+openones);
  	document.cookie=window.location.pathname+"="+openones
}
end not used ------ check before delete -------- */


/*  not used ------ check before delete --------
if (ie4||ns6)
	document.onclick=checkcontained;
end not used ------ check before delete -------- */		


/*  not used ------ check before delete --------
function refreshdiv(id, div_text)
{
	//alert("id, div_text \n" + id +" \n "+div_text);
	document.getElementById(id).outerHTML = div_text;
}
end not used ------ check before delete -------- */


/*  not used ------ check before delete --------
function alertj()
{
	alert("jadjdjdjd");
}
end not used ------ check before delete -------- */


</script>

<!--  
 ************************
 * Script for the new skin
 *************************
 -->
<script type="text/javascript">

var prefixAheevaMenuItem  =  'AheevaMenuItem';

function visibleTog (obj1){						// show/hide sub-sections in menu tree
	
	var divName2 = ""+(obj1.id)+"_menu";
	var tog01 = document.getElementById (divName2);
	var tog02 = tog01.lastChild;

	if (tog01.style.display == 'none' && tog01.childNodes.length >1 && tog02.previousSibling.tagName == ('SCRIPT') && tog02.previousSibling.childNodes.length <1) {
		tog01.style.display = 'none';
		if(tog01.nextSibling) {
			if(tog01.nextSibling.tagName == ('%')){
				if (tog01.nextSibling.nextSibling.className.match(/menuspacer/)){
					tog02.style.display = '';
				}
			}else{
				if (tog01.nextSibling.className.match(/menuspacer/)){
				tog02.style.display = '';
				}
			}
		}
	}else if (tog01.style.display == 'none' && tog01.childNodes.length >1 ) {
		tog01.style.display = '';
		if(tog01.nextSibling) {
			if(tog01.nextSibling.tagName == ('%'))
			{
				if (tog01.nextSibling.nextSibling.className.match(/menuspacer/)){
					tog02.style.display = 'none';
				}
			}else{	
				if (tog01.nextSibling.className.match(/menuspacer/)){
				tog02.style.display = 'none';
				}
			}
		}
	}else {
		tog01.style.display = 'none';
		if(tog01.nextSibling) {
			if(tog01.nextSibling.tagName == ('%')) {
				if (tog01.nextSibling.nextSibling.className.match(/menuspacer/)){
					tog02.style.display = '';
				}
			}else{
				if (tog01.nextSibling.className.match(/menuspacer/)){
				tog02.style.display = '';
				}
			}
		}
	}
	extendMenuSpace();
};

function imageTog (obj, divName){				// swaps images in tree menu for open/closed sections
	
	var theFullId = obj.id
	var divNameLength = divName.search(/$/);
	var tenantIdBit = theFullId.substr(divNameLength);
	
	var objParent = (document.getElementById (obj.id).parentNode).style.backgroundImage;
	var closed1 = "url(img/"+(divName)+"_closed.gif)";
	var open1 = "url(img/"+(divName)+"_open.gif)";

	var howMany = document.getElementById(""+(obj.id)+"_menu").childNodes.length ;
	var lasttagName = (howMany >1 ) ? (document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling).tagName :  null ;
	
	if (obj.style.backgroundImage == (closed1)){
		obj.style.backgroundImage = (open1);
		if (lasttagName == ('SCRIPT') && document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.childNodes.length <1){
		
		}else if (howMany >1 ){
			if(objParent.match(/_end/)){
			(document.getElementById (obj.id).parentNode).style.backgroundImage = (objParent.replace(/_end/,"_endopen"));
			}else{
			(document.getElementById (obj.id).parentNode).style.backgroundImage = (objParent.replace(/_bg/,"_bgopen"));
			}
		}
		if (lasttagName == ('SCRIPT') && document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.childNodes.length <1){
		
		}else if ((lasttagName != null) &&( lasttagName == ('%')) ){
		
		var lastdivName = (document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.previousSibling.previousSibling).style.backgroundImage;

		(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_bg/,"_end"));
		(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';
		
		}else if (lasttagName != null){

			if (lasttagName == ('A')){
				var lastaName = (document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling).style.backgroundImage;

				(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling).style.backgroundImage = (lastaName.replace(/_bg/,"_end"));
				(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling).style.backgroundRepeat = 'no-repeat';
				
			}else if (lasttagName == ('SCRIPT') && document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.childNodes.length >0){
				var lastaName = (document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.lastChild).style.backgroundImage;

				(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.lastChild).style.backgroundImage = (lastaName.replace(/_bg/,"_end"));
				(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.lastChild).style.backgroundRepeat = 'no-repeat';
		
			}else{
				var lastdivName = (document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.previousSibling).style.backgroundImage;

				(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_bg/,"_end"));
				(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';
				
			}
		buildOpenMenusCookie(divName,tenantIdBit);
		}
		
	
	}else{
		var  listEnd =  "";
		
		obj.style.backgroundImage = (closed1);
		if (lasttagName == ('SCRIPT') && document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.childNodes.length <1){
		
		}else if(objParent.match(/_end/)){
			(document.getElementById (obj.id).parentNode).style.backgroundImage = (objParent.replace(/_endopen/,"_end"));
		}else{
			(document.getElementById (obj.id).parentNode).style.backgroundImage = (objParent.replace(/_bgopen/,"_bg"));
		}
		if (lasttagName == ('SCRIPT') && document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.childNodes.length <1){
		
		}else if (lasttagName == ('A')){
			var lastaName = (document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling).style.backgroundImage;
			
			(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling).style.backgroundImage = (lastaName.replace(/_end/,"_bg"));
			(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling).style.backgroundRepeat = 'no-repeat';
			
		}else{
			var lastdivName = (document.getElementById (""+(obj.id)+"_menu").childNodes.length > 1)  ? (document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling).style.backgroundImage : '';  
			
			if(lastdivName != '') {
				(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_end/,"_bg"));
				(document.getElementById (""+(obj.id)+"_menu").lastChild.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';
				
			}
		}
		buildOpenMenusCookie(divName,tenantIdBit);
		
	};

};

var rememberMenuOpenSections = checkForCookie(prefixAheevaMenuItem);			// stores list of open menu tree sections for persisance on page refresh

function buildOpenMenusCookie(categoryPart,tenantPart) {						// add/remove sections from the open menu tree list variable
	if(rememberMenuOpenSections.match(categoryPart+"-"+tenantPart+",")){						// if in list...
		var cutMe = rememberMenuOpenSections.replace(categoryPart+"-"+tenantPart+",", "");		// ...remove from list
		rememberMenuOpenSections = cutMe;
	}else{																						// if not in list...
		rememberMenuOpenSections +=categoryPart+"-"+tenantPart+",";								// ...add to list
	}
}


/*  not used ------ check before delete --------
function markMenuItemPersistent(menuItemName, menuItemValue, pesrsistentExpirationdays) {
	if (pesrsistentExpirationdays) {
		var date = new Date();
		date.setTime(date.getTime()+(pesrsistentExpirationdays*24*60*60*1000));
		var expirationTime = "; expires="+date.toGMTString();
	}else{
		var expirationTime = "";	
	}
	document.cookie = menuItemName+"="+menuItemValue + expirationTime;
};
end not used ------ check before delete -------- */


function chekMenuItems() {								// reset menu tree to state before page refresh
//	alert(document.cookie.length);
//	alert(document.cookie);
 	if( document.cookie != null  ||  document.cookie.length > 0) {
	 	var allCookies  =     document.cookie.split(';');
	 	
//		alert(allCookies.length);
		
	 	for(var i=0; i < allCookies.length ; i++){
	 		var aCookie  = makeTrim(allCookies[i]);
	 		if(aCookie.indexOf(prefixAheevaMenuItem ) != -1){ // We have a menu item
				if(aCookie.length >  prefixAheevaMenuItem.length) {
	 				var menuItemList  			=  unescape(aCookie.substr(prefixAheevaMenuItem.length+1));
					var menuItemPairs 			= menuItemList.split(',');
					for(var j=0; j < menuItemPairs.length ; j++){
						var anItemPair  			= menuItemPairs[j];
						if(anItemPair.length >  0) {
							var menuItemElements 		= anItemPair.split('-');
							var categoryIdBit 			= menuItemElements[0];
							var tenantIdBit 			= menuItemElements[1];
							
		 					var divObj      			=  document.getElementById(categoryIdBit+tenantIdBit);  
		 					var divObjMenu      		=  document.getElementById(categoryIdBit+tenantIdBit+'_menu');
							
		 					if(divObjMenu !=  null  && (divObjMenu.hasChildNodes() && divObjMenu.childNodes.length > 1)) {
						
								if(divObjMenu.lastChild.previousSibling.tagName == ('SCRIPT') && divObjMenu.lastChild.previousSibling.childNodes.length <1) {
		 							divObjMenu.style.display 	= 'none';
								}else{
		 							divObj.style.backgroundImage= "url(img/"+categoryIdBit+"_open.gif)";
		 							divObjMenu.style.display 	= '';
								
									var objParent = (divObj.parentNode).style.backgroundImage;
									var howMany = divObjMenu.childNodes.length ;
									var lasttagName = (howMany >1 ) ? (divObjMenu.lastChild.previousSibling).tagName :  null ;
	
								
									if (lasttagName == ('SCRIPT') && divObjMenu.lastChild.previousSibling.childNodes.length <1){
		
									}else if (howMany >1 ){
										if(objParent.match(/_end/)){
											(divObj.parentNode).style.backgroundImage = (objParent.replace(/_end/,"_endopen"));
										}else{
											(divObj.parentNode).style.backgroundImage = (objParent.replace(/_bg/,"_bgopen"));
										}
									}
									if (lasttagName == ('SCRIPT') && divObjMenu.lastChild.previousSibling.childNodes.length <1){
		
									}else if ((lasttagName != null) &&( lasttagName == ('%')) ){
		
										var lastdivName = (divObjMenu.lastChild.previousSibling.previousSibling.previousSibling).style.backgroundImage;

										(divObjMenu.lastChild.previousSibling.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_bg/,"_end"));
										(divObjMenu.lastChild.previousSibling.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';
		
									}else if (lasttagName != null){

										if (lasttagName == ('A')){
											var lastaName = (divObjMenu.lastChild.previousSibling).style.backgroundImage;

											(divObjMenu.lastChild.previousSibling).style.backgroundImage = (lastaName.replace(/_bg/,"_end"));
											(divObjMenu.lastChild.previousSibling).style.backgroundRepeat = 'no-repeat';
				
										}else if (lasttagName == ('SCRIPT') && divObjMenu.lastChild.previousSibling.childNodes.length >0){
											var lastaName = (divObjMenu.lastChild.previousSibling.lastChild).style.backgroundImage;

											(divObjMenu.lastChild.previousSibling.lastChild).style.backgroundImage = (lastaName.replace(/_bg/,"_end"));
											(divObjMenu.lastChild.previousSibling.lastChild).style.backgroundRepeat = 'no-repeat';
		
										}else{
											var lastdivName = (divObjMenu.lastChild.previousSibling.previousSibling).style.backgroundImage;

											(divObjMenu.lastChild.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_bg/,"_end"));
											(divObjMenu.lastChild.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';
				
										}
									}
									if(divObjMenu.nextSibling){
										if(divObjMenu.nextSibling.tagName == ('%')) {
											if (divObjMenu.nextSibling.nextSibling.className.match(/menuspacer/)){
												divObjMenu.lastChild.style.display = 'none';
											}
										}else{	
											if (divObjMenu.nextSibling.className.match(/menuspacer/)){
												divObjMenu.lastChild.style.display = 'none';
											}
										}
									}
								}
		 					}
							
						}
					}
							
					for(var k=0; k < menuItemPairs.length ; k++){
						var anItemPair2  			= menuItemPairs[k];
						if(anItemPair2.length >  0) {
							var menuItemElements2 		= anItemPair2.split('-');
							var categoryIdBit2 			= menuItemElements2[0];
							var tenantIdBit2 			= menuItemElements2[1];
							
							if(divObjMenu2) {
		 						var divObj2      			= document.getElementById(categoryIdBit2+tenantIdBit2);  
		 						var divObjMenu2      		= document.getElementById(categoryIdBit2+tenantIdBit2+'_menu');
								var menuLasttagName      	= (document.getElementById(categoryIdBit2+tenantIdBit2+'_menu').lastChild.previousSibling).tagName;
								var menuObjParent 			= (document.getElementById (categoryIdBit2+tenantIdBit2).parentNode).style.backgroundImage;
								
								if ( menuLasttagName == ('%')){
									divObjMenu2.lastChild.previousSibling.previousSibling.previousSibling.style.backgroundImage = "url(img/"+categoryIdBit2+"_end.gif)";
									divObjMenu2.lastChild.previousSibling.previousSibling.previousSibling.style.backgroundRepeat=  'no-repeat';
							
								}else if ( menuLasttagName == ('A')){
									divObjMenu2.lastChild.previousSibling.style.backgroundImage = "url(img/"+categoryIdBit2+"_end.gif)";
									divObjMenu2.lastChild.previousSibling.style.backgroundRepeat=  'no-repeat';

								}else if ( menuLasttagName == ('SCRIPT') && divObjMenu2.lastChild.previousSibling.childNodes.length >0){
									divObjMenu2.lastChild.previousSibling.lastChild.style.backgroundImage = "url(img/"+categoryIdBit2+"_end.gif)";
									divObjMenu2.lastChild.previousSibling.lastChild.style.backgroundRepeat=  'no-repeat';
						
								}else if ( menuLasttagName == ('SCRIPT') && divObjMenu2.lastChild.previousSibling.childNodes.length <1){
	
								}else{
									divObjMenu2.lastChild.previousSibling.previousSibling.style.backgroundImage = "url(img/"+categoryIdBit2+"_end.gif)";
									divObjMenu2.lastChild.previousSibling.previousSibling.style.backgroundRepeat=  'no-repeat';
							
								}
						
								if(menuLasttagName == ('SCRIPT') && divObjMenu2.lastChild.previousSibling.childNodes.length <1){
						
								}else if(menuObjParent.match(/_end/)){
									(document.getElementById (categoryIdBit2+tenantIdBit2).parentNode).style.backgroundImage = (menuObjParent.replace(/_end/,"_endopen"));
								}else{
									(document.getElementById (categoryIdBit2+tenantIdBit2).parentNode).style.backgroundImage = (menuObjParent.replace(/_bg/,"_bgopen"));
								}
							}
						}
					}
				}
	 		}
	 	}
	}
};


function makeTrim(st) {
		return st.replace(/^\s+|\s+$/g,"");
		
};


/*  not used ------ check before delete --------
function getRealId(partialid){
	var re= new RegExp(partialid,'g');
	var elems = document.getElementsByTagName('*'), i=0, el;
	while(el=elems[i++]){
		if(el.className.match(re)){
		var elSection = (el.className.replace(/_fill/,""));
		var backImage = el.firstChild.style.backgroundImage;
		el.firstChild.style.backgroundImage = (backImage.replace(/inact_but/,""+(elSection)+"_but"));
		}
	}
};
end not used ------ check before delete -------- */


// ---------- rollover fade effect ---------- //
function colorFade(id,element,start,end,steps,speed) {
  var startrgb,endrgb,er,eg,eb,step,rint,gint,bint,step;
  var target = (id);
  steps = steps || 20;
  speed = speed || 20;
  clearInterval(target.timer);
  endrgb = colorConv(end);
  er = endrgb[0];
  eg = endrgb[1];
  eb = endrgb[2];
  if(!target.r) {
    startrgb = colorConv(start);
    r = startrgb[0];
    g = startrgb[1];
    b = startrgb[2];
    target.r = r;
    target.g = g;
    target.b = b;
  }
  rint = Math.round(Math.abs(target.r-er)/steps);
  gint = Math.round(Math.abs(target.g-eg)/steps);
  bint = Math.round(Math.abs(target.b-eb)/steps);
  if(rint == 0) { rint = 1 }
  if(gint == 0) { gint = 1 }
  if(bint == 0) { bint = 1 }
  target.step = 1;
  target.timer = setInterval( function() { animateColor(id,element,steps,er,eg,eb,rint,gint,bint) }, speed);
}

// incrementally close the gap between the two colors //
function animateColor(id,element,steps,er,eg,eb,rint,gint,bint) {
  var target = (id);
  var color;
  if(target.step <= steps) {
    var r = target.r;
    var g = target.g;
    var b = target.b;
    if(r >= er) {
      r = r - rint;
    } else {
      r = parseInt(r) + parseInt(rint);
    }
    if(g >= eg) {
      g = g - gint;
    } else {
      g = parseInt(g) + parseInt(gint);
    }
    if(b >= eb) {
      b = b - bint;
    } else {
      b = parseInt(b) + parseInt(bint);
    }
    color = 'rgb(' + r + ',' + g + ',' + b + ')';
    if(element == 'background') {
      target.style.backgroundColor = color;
    } else if(element == 'border') {
      target.style.borderColor = color;
    } else {
      target.style.color = color;
    }
    target.r = r;
    target.g = g;
    target.b = b;
    target.step = target.step + 1;
  } else {
    clearInterval(target.timer);
    color = 'rgb(' + er + ',' + eg + ',' + eb + ')';
    if(element == 'background') {
      target.style.backgroundColor = color;
    } else if(element == 'border') {
      target.style.borderColor = color;
    } else {
      target.style.color = color;
    }
  }
}

// convert the color to rgb from hex //
function colorConv(color) {
  var rgb = [parseInt(color.substring(0,2),16), 
    parseInt(color.substring(2,4),16), 
    parseInt(color.substring(4,6),16)];
  return rgb;
};
// ---------- end rollover fade effect ---------- //


function openBuilder() {			// open form builder in new window, set initial size and focus to the form builder
									// target set to 'Text' because 'template_outbound' (and any forms that were 'save as' using 'template_outbound' as a base) seems to be renaming the window to 'Text' when loaded into window with other name. (changed in 'active', 'inactive', 'add new' and 'function openBuilder()'. original target name was 'mybuilder'.
	var openPop=window.open("","Text","status=0, location=0, menubar=0, toolbar=0, directories=0, width=1000, height=650, resizable=1");
	openPop.focus();
}

function menuFit() {					//resizes content of menu frame to fit on-the-fly
	var availableHeight = document.getElementById("menuBody").offsetHeight - 20;
	
	if(document.getElementById("menuSearchBox")) {
		var searchBoxHeight = document.getElementById("menuSearchBox").offsetHeight;
	
		document.getElementById("base_level_menu").style.height = (availableHeight-searchBoxHeight) + "px";
	}else{
		document.getElementById("base_level_menu").style.height = availableHeight + "px";
	}
	extendMenuSpace();
}

function extendMenuSpace() {			// alows last item in menu to be scrolled to top of page
	if(document.getElementById("menuBottomPos")) {
		var menuBottom = document.getElementById("menuBottomPos").offsetTop - 20;						// gives the hight of the menu tree
		var visMenuHeight = document.getElementById("base_level_menu").offsetHeight - 20;				// gives the available viewing area height for the menu
		document.getElementById("treeContainerHeight").style.height = visMenuHeight+menuBottom + "px";	// extends space below the menu tree
	}
}


function getSearchBoxState() {			// resets search box when page refresh
	if(document.getElementById("search001")) {														// if search box is on page
	
		document.getElementById("whichTenant").value=tenantVal;										// reset tenant value in search list
		
		if(document.getElementById(categoryVal+"_opt")){	// user category privaleges have not been removed
			document.getElementById("whichCategory").value=categoryVal;								// reset category value in search list
		}else{
			document.getElementById("whichCategory").value="";										// reset category if user privaleges removed
		}

		document.getElementById("serResults").innerHTML=checkForCookie('serResults');				// reset results message to same as before page refresh
		if(document.getElementById(categoryVal+"_opt")){
			document.getElementById("serResults").style.display=checkForCookie('serResultsVis');		// reset results message visibility to same as before page refresh
		}else{
			document.getElementById("serResults").style.display="none";
		}
		document.getElementById("search001").style.display=checkForCookie('search001Vis');		// reset results message visibility to same as before page refresh
		if(document.getElementById("search001").style.display=="none") {							// search box is closed 
			document.getElementById("openArrows").innerHTML=search_openme_str;
		}else {																						// search box is open
			document.getElementById("openArrows").innerHTML=search_closeme_str;
		}
		setupResults();
		document.getElementById("searchfirst").value=checkForCookie('searchfirst');					// put search values back in the fields
		document.getElementById("searchlast").value=checkForCookie('searchlast');
		document.getElementById("searchid").value=checkForCookie('searchid');
		document.getElementById("searchfullname").value=checkForCookie('searchfullname');
		document.getElementById("searchpartname").value=checkForCookie('searchpartname');
	}
	
	document.getElementById("synchroMessage").style.display="none";									// hide synchronizing menu message
	if(document.getElementById("menuSearchBox")) {
		document.getElementById("menuSearchBox").style.visibility="";								// make search box visible
	}
	if(document.getElementById("search001")) {
		catSelection();
	}else{
		menuFit();
	}
	document.getElementById("base_level_menu").scrollTop=scrollHere;								// reset menu position to where it was before page refresh
	document.getElementById("base_level_menu").style.visibility="";									// make menu tree visible
	
}

function closeAllTreeMenu() {			// colapse tree menu
	var allOpenTree = document.getElementById("base_level_menu").getElementsByTagName("div");
	for (var i=0; i<allOpenTree.length; i++) {
		if(allOpenTree[i].id.match("_menu")) {
			if (allOpenTree[i].style.display=="") {
				var dropMenuFromId = allOpenTree[i].id.replace(/_menu/,"");
				var allClassName = allOpenTree[i].previousSibling.className;
				var getIdFromClass = allClassName.replace(/_fill/,"");
				visibleTog(document.getElementById(dropMenuFromId));
				imageTog(document.getElementById(dropMenuFromId),getIdFromClass);
			}
		}
	}
	
	document.getElementById("base_level_menu").scrollTop=0;
}


function onPressKey() {
       
	if (event.keyCode == 13) {					// when the Enter key is pressed...
		if (document.activeElement) {			// for ie
		
			if(document.activeElement.id=="searchfirst" || document.activeElement.id=="searchlast" || document.activeElement.id=="searchid" || document.activeElement.id=="searchfullname" || document.activeElement.id=="searchpartname") {	// ...and focus is in search form fields
				doMenuSearch();
			}
		}else{									// for firefox
		
			if(document.focusNode.id=="searchfirst" || document.focusNode.id=="searchlast" || document.focusNode.id=="searchid" || document.focusNode.id=="searchfullname" || document.focusNode.id=="searchpartname") {				// ...and focus is in search form fields
				doMenuSearch();
			}
		}
	}

// following shortcut key functions only works if focus is in the menu frame. Would be good to make these work across all frames in future release

	if(event.ctrlKey){
		if (event.keyCode == 83){							// when 'ctrl'+'s" is pressed...
			if(document.getElementById("menuSearchBox")){	// ...and search box is present
				openSearch();								// open or close the search box
			}
		}
		if (event.keyCode == 49){							// when 'ctrl'+'1" is pressed
			closeAllTreeMenu();								// collapse the menu tree
		}
	}
}

function rememberMenuSettings() {
	markItemPersistent(prefixAheevaMenuItem, rememberMenuOpenSections);						// remember open menu sections
	markItemPersistent("tenantVal",tenantVal);												// remember tenant
	markItemPersistent("categoryVal",categoryVal);											// remember category
	markItemPersistent("scrollHere",document.getElementById("base_level_menu").scrollTop);	// remember Menu Position
	markItemPersistent("resArrayPos",resArrayPos);											// remember which result was shown last
	var compactResults = resultDivs.join(';');
	
	markItemPersistent("resultDivs",compactResults);										// remember all results
	
	markItemPersistent("searchfirst",document.getElementById("searchfirst").value);			// remember search field properties
	markItemPersistent("searchlast",document.getElementById("searchlast").value);
	markItemPersistent("searchid",document.getElementById("searchid").value);
	markItemPersistent("searchfullname",document.getElementById("searchfullname").value);
	markItemPersistent("searchpartname",document.getElementById("searchpartname").value);
	
}

function markItemPersistent(menuItemName, menuItemValue, pesrsistentExpirationdays) {
	if (pesrsistentExpirationdays) {
		var date = new Date();
		date.setTime(date.getTime()+(pesrsistentExpirationdays*24*60*60*1000));
		var expirationTime = "; expires="+date.toGMTString();
	}else{
		var expirationTime = "";	
	}
	document.cookie = menuItemName+"="+escape(menuItemValue)+expirationTime;
};

function checkForCookie(c_name) {
	if (document.cookie.length>0){
		c_start=document.cookie.indexOf(c_name + "=");
		
		if (c_start!=-1){ 
			c_start=c_start + c_name.length+1; 
			c_end=document.cookie.indexOf(";",c_start);
			if (c_end==-1) c_end=document.cookie.length;
			if(c_name=="tenantVal"){								// check if tenant has been deleted
				var tenToFind = Number(document.cookie.substring(c_start,c_end));
				var tenExists = 0;
				<%
					for(int i = 0; i < tenantsDataResult.size(); i++)
					{
						String tenanttofind_dbid = (String)tenantsDataResult.elementAt(i).get("dbid");
				%>
						if(<%=tenanttofind_dbid%>==tenToFind){
							tenExists=1;
						}
				<%
					}
				%>
				if(tenExists==1){									// not deleted - use the tenant id
					return unescape(document.cookie.substring(c_start,c_end));
				}else{												// been deleted - use the first tenant id in string
					return <%=tenantsDataResult.elementAt(0).get("dbid")%>;
				}
			}else{
				return unescape(document.cookie.substring(c_start,c_end));
			}
		} 
	}
	if(c_name=="scrollHere" || c_name=="resArrayPos") {
		return 0;
	}else if (c_name=="serResultsVis" || c_name=="search001Vis"){
		return "none";
	}else if (c_name=="tenantVal"){
		if (<%=tenantsDataResult.size()%>>0){				// check there are tenants
			return <%=tenantsDataResult.elementAt(0).get("dbid")%>;
		}else{												// if there are no tenants - should never occur
			return 1;
		}
	}else{
		return "";
	}
}

var categoryFocus = "";

//-------------------functions for search------------------------//

var tenantVal		= checkForCookie('tenantVal');
var categoryVal		= checkForCookie('categoryVal');
var scrollHere		= checkForCookie('scrollHere');
var resArrayPos		= Number(checkForCookie('resArrayPos'));

var makeResultArray	= checkForCookie('resultDivs');
if (makeResultArray!=""){
	var resultDivs	= makeResultArray.split(';');
}else{
	var resultDivs	= new Array();
}


var result_str			=	"<div style=\"color:#FFFBF0; padding-bottom:4px;\">result&nbsp;"
							+"<span id=\"ThisResultNum\"></span>&nbsp;of&nbsp;<span id=\"numOfResults\"></span>"
							+"</div>"
							+"<div><nobr>"
							+"<button id=\"resPrev\" onClick=\"nextPrevSearch('back')\" style=\"cursor:pointer; margin-right:15px;\" disabled=\"false\"><%=pageData.getWord("Previous")%></button>"
							+"<button id=\"resNext\" onClick=\"nextPrevSearch('forward')\" style=\"cursor:pointer\" disabled=\"false\">&nbsp;&nbsp;<%=pageData.getWord("Next")%>&nbsp;&nbsp;</button>"
							+"</nobr></div>";

var no_result_str		=	"<div style=\"color:#a00; padding-bottom:4px;\"><nobr><b>- <%=pageData.getWord("no results found")%> -</b></nobr></div>";

var changed_result_str	=	"<div style=\"color:#a00; padding-bottom:4px;\"><span><%=pageData.getWord("menu content has changed")%></span style=\"margin-bottom8:px\"><br /><span><%=pageData.getWord("please search again")%></span>";

var search_openme_str	=	"<%=pageData.getWord("open")%><img src=\"img/menusearchopen.gif\" width=\"9\" height=\"9\" hspace=\"0\" vspace=\"0\" border=\"0\" align=\"middle\" style=\"margin-left:4px\" />";

var search_closeme_str	=	"<%=pageData.getWord("close")%><img src=\"img/menusearchclose.gif\" width=\"9\" height=\"9\" hspace=\"0\" vspace=\"0\" border=\"0\" align=\"middle\" style=\"margin-left:4px\" />";


function searchTitleOver() {
	document.getElementById("searchTitleBar").style.backgroundColor="#AF5";
	document.getElementById("searchTitleBar").style.color="#824100";
}

function searchTitleOut() {
	document.getElementById("searchTitleBar").style.backgroundColor="#AFA";
	document.getElementById("searchTitleBar").style.color="";
}

function openSearch(){
	if(document.getElementById("search001").style.display=="none") {	// open the search box
		document.getElementById("search001").style.display="";
		document.getElementById("openArrows").innerHTML=search_closeme_str;
		markItemPersistent("search001Vis",'block');
	}else{																// close the search box
	 
		document.getElementById("search001").style.display="none";
		document.getElementById("openArrows").innerHTML=search_openme_str;
		markItemPersistent("search001Vis",'none');
	}
	searchTitleOut();
	menuFit();
	
}

function focusCat() {
	categoryFocus=1;		// this variable ==1 only when category section is changed
	catSelection();
}

function catSelection() {
	if (document.getElementById("whichCategory").value == "") { 		// no selection made
		document.getElementById("serAgent").style.display = "none";
		document.getElementById("serOther").style.display = "none";
		document.getElementById("mensearchbut").disabled = true;
	}else if (document.getElementById("whichCategory").value == "age"){	// agents selected
		document.getElementById("serAgent").style.display = "";
		document.getElementById("serOther").style.display = "none";
		document.getElementById("mensearchbut").disabled = false;
		if(document.getElementById("search001").style.display!="none"){
			if(categoryFocus==1){										// will not put focus into this window when page refresh if another window is open
				document.getElementById("searchfirst").focus();			// move focus to first search field only if category section has been changed 
				categoryFocus="";
			}
		}
	}else{																// any other selection
		document.getElementById("serAgent").style.display = "none";
		document.getElementById("serOther").style.display = "";
		document.getElementById("mensearchbut").disabled = false;
		if(document.getElementById("search001").style.display!="none"){
			if(categoryFocus==1){										// will not put focus into this window when page refresh if another window is open
				document.getElementById("searchfullname").focus();		// move focus to first search field only if category section has been changed
				categoryFocus="";
			}
		}
	}
	menuFit();
}

function openMenuTree(){												// opens tree menu branches to the requested sub-menu
		
	switch (categoryVal){
		
		case "age": case "age_gr": case "cam": case "call": case "fil": case "treat": case "no_ready": case "skill":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById("res"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("res"+tenantVal));
				imageTog(document.getElementById("res"+tenantVal),'res');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
		case "no_call_cur":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById("res"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("res"+tenantVal));
				imageTog(document.getElementById("res"+tenantVal),'res');
			}
			if (document.getElementById("no_call"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("no_call"+tenantVal));
				imageTog(document.getElementById("no_call"+tenantVal),'no_call');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
		case "age_qu": case "rout_qu":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById("res"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("res"+tenantVal));
				imageTog(document.getElementById("res"+tenantVal),'res');
			}
			if (document.getElementById("qu"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("qu"+tenantVal));
				imageTog(document.getElementById("qu"+tenantVal),'qu');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
		case "q_m_eval":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById("q_m"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("q_m"+tenantVal));
				imageTog(document.getElementById("q_m"+tenantVal),'q_m');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
		case "q_m_eval_ans": case "q_m_eval_lab":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById("q_m"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("q_m"+tenantVal));
				imageTog(document.getElementById("q_m"+tenantVal),'q_m');
			}
			if (document.getElementById("q_m_eval"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("q_m_eval"+tenantVal));
				imageTog(document.getElementById("q_m_eval"+tenantVal),'q_m_eval');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
		case "team":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById("w_f_man"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("w_f_man"+tenantVal));
				imageTog(document.getElementById("w_f_man"+tenantVal),'w_f_man');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
		case "f_i_act_cur":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById("f_i"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("f_i"+tenantVal));
				imageTog(document.getElementById("f_i"+tenantVal),'f_i');
			}
			if (document.getElementById("f_i_act"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("f_i_act"+tenantVal));
				imageTog(document.getElementById("f_i_act"+tenantVal),'f_i_act');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
		case "f_i_com": case "mop":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById("f_i"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("f_i"+tenantVal));
				imageTog(document.getElementById("f_i"+tenantVal),'f_i');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
		case "stat": case "alert":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById("m_c"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("m_c"+tenantVal));
				imageTog(document.getElementById("m_c"+tenantVal),'m_c');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
		case "rout": case "popu":
			if (document.getElementById("ten"+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById("ten"+tenantVal));
				imageTog(document.getElementById("ten"+tenantVal),'ten');
			}
			if (document.getElementById(categoryVal+tenantVal+"_menu").style.display=="none") {
				visibleTog(document.getElementById(categoryVal+tenantVal));
				imageTog(document.getElementById(categoryVal+tenantVal),categoryVal);
			}
			break;
	}
}

function scrollMenuHere(scrollMe) { 							// scroll selected menu sub-section to top of page
	var scrollFrom = document.getElementById("base_level_menu").scrollTop;
	
	var scrollHere1 = document.getElementById(scrollMe).previousSibling.offsetTop;
	var scrollHere2 = document.getElementById(scrollMe).parentNode.offsetTop;
	var scrollHere3 = document.getElementById(scrollMe).parentNode.parentNode.offsetTop;
	var scrollHere4 = document.getElementById(scrollMe).parentNode.parentNode.parentNode.offsetTop;
	var scrollHere5 = document.getElementById(scrollMe).parentNode.parentNode.parentNode.parentNode.offsetTop;
	
	if (resultDivs.length!=0) {									// if the search finds a result add to scroll value
		
		if(document.getElementById(resultDivs[resArrayPos])) {	// check div is present on page
			var scrollToResult = document.getElementById(resultDivs[resArrayPos]);
		
			if(categoryVal=="age_qu" || categoryVal=="rout_qu" || categoryVal=="no_call_cur" || categoryVal=="f_i_act_cur" || categoryVal=="skill" || categoryVal=="team"){	//if sub menus with no active/inactive sections
			
				var scrollHere6 = ((scrollToResult.parentNode.offsetTop)+(scrollToResult.parentNode.parentNode.previousSibling.offsetHeight))-30;
			
			}else{															//if sub menus has active/inactive sections
				var isInMenu = scrollToResult.parentNode.parentNode.id;		// determine if result is in active or inactive section
				var dropMenu = isInMenu.replace(/_menu/,"");
				var activeMenu = categoryVal+"_a";
				var inactiveMenu = categoryVal+"_i";
			
				var catNameLength = categoryVal.search (/$/);
				var isItActive = isInMenu.substr(catNameLength);
			
			
				if (document.getElementById(isInMenu).style.display=="none") {
					visibleTog(document.getElementById(dropMenu));
					if(isItActive.search("_a")==0) {						// open active sub menu if not already open
						imageTog(document.getElementById(dropMenu),activeMenu);
					}else{													// open inactive sub menu if not already open
						imageTog(document.getElementById(dropMenu),inactiveMenu);
					}
				}
				var scrollHere6 = ((scrollToResult.parentNode.offsetTop)+(scrollToResult.parentNode.parentNode.previousSibling.offsetHeight)+(scrollToResult.parentNode.parentNode.offsetTop))-30;
			}
			scrollHere = scrollHere1+scrollHere2+scrollHere3+scrollHere4+scrollHere5+scrollHere6; // combine distance of sub-menus and result from top of div to give value for distance to scroll
			scrollToResult.parentNode.style.backgroundColor="#AF5";
		}else{
			document.getElementById("serResults").innerHTML=changed_result_str;			// generate 'menu has changed' warning html if div id cannot be found
			markItemPersistent("serResults",changed_result_str);
		}
	}else{
		scrollHere = scrollHere1+scrollHere2+scrollHere3+scrollHere4+scrollHere5;	// combine distance of sub-menus from top of div to give value for distance to scroll
	}
	
	var distanceMove = 50;
	if (scrollFrom>scrollHere) {
		for(var i=scrollFrom; i>scrollHere; i-=distanceMove) {
			if ((i-distanceMove)<scrollHere) {
				document.getElementById("base_level_menu").scrollTop = scrollHere;
			}else{
				document.getElementById("base_level_menu").scrollTop -= distanceMove;
			}
		}
	}else{
		for(var i=scrollFrom; i<scrollHere; i+=distanceMove) {
			if ((i+distanceMove)>scrollHere) {
				document.getElementById("base_level_menu").scrollTop = scrollHere;
			}else{
				document.getElementById("base_level_menu").scrollTop += distanceMove;
			}
		}
	}
}

function validateSearch() {			// varify text search uses valid characters

	if (categoryVal=="age"){
		var thisSearch1 = document.getElementById("searchfirst").value;
		var thisSearch2 = document.getElementById("searchlast").value;
		var thisSearch3 = document.getElementById("searchid").value;
		if (thisSearch1.match(/\?/) || thisSearch1.match(/\*/) || thisSearch1.match(/\(/) || thisSearch1.match(/\)/) || thisSearch1.match(/\+/) || thisSearch1.match(/\[/) || thisSearch1.match(/\]/) || thisSearch1.match(/\</) || thisSearch1.match(/\>/) || thisSearch1.match(/\|/) || thisSearch1.match(/\./) || thisSearch2.match(/\?/) || thisSearch2.match(/\*/) || thisSearch2.match(/\(/) || thisSearch2.match(/\)/) || thisSearch2.match(/\+/) || thisSearch2.match(/\[/) || thisSearch2.match(/\]/) || thisSearch2.match(/\</) || thisSearch2.match(/\>/) || thisSearch2.match(/\|/) || thisSearch2.match(/\./) || thisSearch3.match(/\?/) || thisSearch3.match(/\*/) || thisSearch3.match(/\(/) || thisSearch3.match(/\)/) || thisSearch3.match(/\+/) || thisSearch3.match(/\[/) || thisSearch3.match(/\]/) || thisSearch3.match(/\</) || thisSearch3.match(/\>/) || thisSearch3.match(/\|/) || thisSearch3.match(/\./)) { // disallowed characters
			alert("<%=pageData.getWord("Search query cannot contain")%> '?', '*', '.', '+', '(', ')', '[', ']', '<', '>' <%=pageData.getWord("or")%> '|'");
			return;
		}else{
			searchingFor();
		}
	}else{
		var thisSearch1 = document.getElementById("searchfullname").value;
		var thisSearch2 = document.getElementById("searchpartname").value;
		
		if (thisSearch1.match(/\?/) || thisSearch1.match(/\*/) || thisSearch1.match(/\(/) || thisSearch1.match(/\)/) || thisSearch1.match(/\+/) || thisSearch1.match(/\[/) || thisSearch1.match(/\]/) || thisSearch1.match(/\</) || thisSearch1.match(/\>/) || thisSearch1.match(/\|/) || thisSearch1.match(/\./) || thisSearch2.match(/\?/) || thisSearch2.match(/\*/) || thisSearch2.match(/\(/) || thisSearch2.match(/\)/) || thisSearch2.match(/\+/) || thisSearch2.match(/\[/) || thisSearch2.match(/\]/) || thisSearch2.match(/\</) || thisSearch2.match(/\>/) || thisSearch2.match(/\|/) || thisSearch2.match(/\./)) { // disallowed characters
			alert("<%=pageData.getWord("Search query cannot contain")%> '?', '*', '.', '+', '(', ')', '[', ']', '<', '>' <%=pageData.getWord("or")%> '|'");
			return;
		}else if (document.getElementById("searchfullname").value!="" && document.getElementById("searchpartname").value!=""){ // disalow search when both full and partial name fields are filled
			alert("<%=pageData.getWord("Search for either")%>\n\n'<%=pageData.getWord("Name")%>'\n(<%=pageData.getWord("can be the full name or the begining of the name")%>)\n<%=pageData.getWord("or")%> '<%=pageData.getWord("Name includes")%>'\n(<%=pageData.getWord("search for text that is included anywhere in the name")%>)\n\n<%=pageData.getWord("but not both")%>.");
			return;
		}else{
			searchingFor();
		}
	}
}

function searchingFor() {
	if(categoryVal=="age") {
		var searchId = new RegExp(document.getElementById("searchid").value, "gi");
		var searchFirst = new RegExp(document.getElementById("searchfirst").value, "gi");
		var searchLast = new RegExp(document.getElementById("searchlast").value, "gi");
		resultDivs = new Array();
		
		if (searchId!="//ig" || searchFirst!="//ig" || searchLast!="//ig") {
			if(searchId=="//ig") {
				searchId=null;
			}
			if(searchFirst=="//ig") {
				searchFirst=null;
			}
			if(searchLast=="//ig") {
				searchLast=null;
			}
			
			resArrayPos = 0;
			var searchSelectionName = categoryVal+tenantVal;
			var searchSelectionNameLength = searchSelectionName.search(/$/);
			
			var searchIn = document.getElementById(categoryVal+tenantVal+"_menu");
			var searchDivs = new Array();
			searchDivs = searchIn.getElementsByTagName("div");
			for (var i=0; i<searchDivs.length; i++) {
				if(searchDivs[i].id) {
					var thisDivId = searchDivs[i].id;
					var ignorCatAndTen = thisDivId.substr(searchSelectionNameLength);
					var firstStartPos = ignorCatAndTen.indexOf(',');
					var lastStartPos  = ignorCatAndTen.indexOf('^');
					var iStartPos     = ignorCatAndTen.indexOf('[');
    				var iEndPos       = ignorCatAndTen.indexOf(']');
					var firstn	      = ignorCatAndTen.substr(firstStartPos+1,iStartPos-firstStartPos-1);
					var lastn	      = ignorCatAndTen.substr(lastStartPos+1,firstStartPos-lastStartPos-1);
    				var login	      = ignorCatAndTen.substr(iStartPos+1,iEndPos-iStartPos-1);
					
					if(thisDivId.match(searchSelectionName)) {
						
						if(ignorCatAndTen.search("_")!=0) {
							if((firstn.search(searchFirst)==0 && searchLast==null && searchId==null) || (firstn.search(searchFirst)==0 && lastn.search(searchLast)==0 && searchId==null) || (firstn.search(searchFirst)==0 && searchLast==null && login.search(searchId)==0) || (firstn.search(searchFirst)==0 && lastn.search(searchLast)==0 && login.search(searchId)==0) || (searchFirst==null && lastn.search(searchLast)==0 && searchId==null) || (searchFirst==null && lastn.search(searchLast)==0 && login.search(searchId)==0) || (searchFirst==null && searchLast==null && login.search(searchId)==0)) {
								resultDivs[resArrayPos]=thisDivId;
								resArrayPos++;
							}
						}
					}
				}
			}			
		}
		
		
		if(resultDivs.length==0 && (searchId!="//ig" || searchFirst!="//ig" || searchLast!="//ig")){	// no results and search fields are filled
			document.getElementById("serResults").innerHTML=no_result_str;					// no results found html
			markItemPersistent("serResults",no_result_str);
		}else{																				// there are results or search fields are empty
			resultDivs.sort();																// order all results alphabetically (not active before inactive)
			document.getElementById("serResults").innerHTML=result_str;						// generate result html
			markItemPersistent("serResults",result_str);
		}
		
		resArrayPos = 0;
	}else{
		var searchFull = new RegExp(document.getElementById("searchfullname").value, "gi");
		var searchPart = new RegExp(document.getElementById("searchpartname").value, "gi");
		resultDivs = new Array();
		
		if(searchFull!="//ig" || searchPart!="//ig") {
			resArrayPos = 0;
			var searchSelectionName = categoryVal+tenantVal;
			var searchSelectionNameLength = searchSelectionName.search(/$/);
			
			var searchIn = document.getElementById(categoryVal+tenantVal+"_menu");
			var searchDivs = new Array();
			searchDivs = searchIn.getElementsByTagName("div");
			
			
			if(searchFull!="//ig") { // if full name search
			
				for (i = 0; i <searchDivs.length; i++){
					if(searchDivs[i].id) {
						var thisDivId = searchDivs[i].id;
						var ignorCatAndTen = thisDivId.substr(searchSelectionNameLength);
						if(thisDivId.match(searchSelectionName)) {
							if(ignorCatAndTen.search("_")!=0 && ignorCatAndTen.search(searchFull)==0) {
								resultDivs[resArrayPos]=thisDivId;
								resArrayPos++;
							}
						}
					}
    			}
			}else if(searchPart!="//ig") { // if partial name search
			
				for (i = 0; i <searchDivs.length; i++){
					if(searchDivs[i].id) {
						var thisDivId = searchDivs[i].id;
						var ignorCatAndTen = thisDivId.substr(searchSelectionNameLength);
						
						if(thisDivId.match(searchSelectionName)) {
							if(ignorCatAndTen.search("_")!=0 && ignorCatAndTen.search(searchPart)!=-1) {
								resultDivs[resArrayPos]=thisDivId;
								resArrayPos++;
							}
						}
					}
    			}
			}
		}
		
		if(resultDivs.length==0 && (searchFull!="//ig" || searchPart!="//ig")){				// no results and search fields are filled
			document.getElementById("serResults").innerHTML=no_result_str;					// no results found html
			markItemPersistent("serResults",no_result_str);
		}else{																				// there are results or search fields are empty
			
			resultDivs.sort();																// order all results alphabetically (not active before inactive)
			document.getElementById("serResults").innerHTML=result_str;						// generate result html
			markItemPersistent("serResults",result_str);
		}
		
		resArrayPos = 0;
	}
}

function doMenuSearch() {
	if(resultDivs.length!=0){
		if(document.getElementById(resultDivs[resArrayPos])){
			document.getElementById(resultDivs[resArrayPos]).parentNode.style.backgroundColor="#ffffff";
		}
	}
	tenantVal = document.getElementById("whichTenant").value;
	categoryVal = document.getElementById("whichCategory").value;
	
	
	validateSearch();
	continueMenuSearch();
	
}

function continueMenuSearch() {
	setupResults();
	menuFit();
	openMenuTree();
	scrollMenuHere(categoryVal+tenantVal+"_menu");
}

function setupResults() {
	if(resultDivs.length>1){
		document.getElementById("thisResultNum").innerHTML=resArrayPos+1;
		document.getElementById("numOfResults").innerHTML=resultDivs.length;
		if(resArrayPos==0){										// enable/disable 'previous' button when there are multiple search results
			document.getElementById("resPrev").disabled=true;
		}else{
			document.getElementById("resPrev").disabled=false;
		}
		if(resArrayPos+1==resultDivs.length){					// enable/disable 'next' button when there are multiple search results
			document.getElementById("resNext").disabled=true;
		}else{
			document.getElementById("resNext").disabled=false;
		}
		if(document.getElementById(categoryVal+"_opt")){
			document.getElementById("serResults").style.display="";
			markItemPersistent("serResultsVis",'block');
		}
	}else if(document.getElementById("thisResultNum")){			// make sure the correct inner html is being generated - will not hide 'no results' html
		document.getElementById("serResults").style.display="none";
		markItemPersistent("serResultsVis",'none');
	}else{
		if(document.getElementById(categoryVal+"_opt")){
			document.getElementById("serResults").style.display="";
			markItemPersistent("serResultsVis",'block');
		}
	}
}

function nextPrevSearch(direction) {			
	if(resultDivs.length!=0){
		if(document.getElementById(resultDivs[resArrayPos])){
			document.getElementById(resultDivs[resArrayPos]).parentNode.style.backgroundColor="#ffffff";
		}
	}
	if(direction=="forward") {
		resArrayPos++;
	}
	if(direction=="back") {
		resArrayPos--;
	}
	continueMenuSearch();
}

	
</script>
<style type="text/css">
<!--
html, body {
	height: 100%;
	overflow:hidden;
}
body {
	height: 100%;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

-->
</style>
<!--[if lt IE 7]>
<style type="text/css">

#menuSearchBox {
	margin-top:-16px;
}

</style>
<![endif]-->
</head>

<body id="menuBody" class="bodysize" scroll="no" onLoad="chekMenuItems(),getSearchBoxState()" onresize="menuFit()" onKeyDown="onPressKey()" onunload="rememberMenuSettings()">

<div id="synchroMessage" style="text-align:center; display:;">
	<div style="border-style:solid; border-width:1px; border-color:#B66001; padding-left:4px; padding-right:4px; padding-bottom:1px; margin-top:20px; margin-left:10px; margin-right:10px; color:#824100"><%=pageData.getWord("Synchronizing menu")%></div>
	<div style="color:#824100;"><%=pageData.getWord("please wait-lc")%></div>
</div>

<div id="base_level_menu" class="menubody" style="padding-top:20px; overflow-y:scroll; overflow-x:hidden; height:; background-repeat:repeat-y; background-image:url(img/base_level_bg.gif); visibility:hidden;">
<div id="treeContainerHeight" style="height:;">
<%
if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CONFIGURATION_MANAGEMENT") )
{
%>
  
	<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="javascript:;" class="config_fill" style="background-image:url(img/base_level_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'config')">
		<div id="config" class="level0" style="background-image:url(img/config_closed.gif)"><b><%=pageData.getWord("Configuration")%></b></div>
	</a>
	<div id="config_menu" style="display:none">
	
		<% // Start Network Configuration
		if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_NETWORK_CONFIGURATION") )
		{
		%>		
			<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="./Resources_pages/architecture.jsp" target="rbottom" class="config_fill" style="background-image:url(img/config_bg.gif)">
				<div class="level1_but" style="background-image:url(img/config_but.gif)"><%=pageData.getWord("Network Configuration")%></div>
			</a>
		
		<%
		}
		
		if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TENANT_MANAGEMENT") )
		{
		%>
			<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="javascript:;" class="ten_man_fill" style="background-image:url(img/config_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'ten_man')">
				<div id="ten_man" class="level1" style="background-image:url(img/ten_man_closed.gif)"><b><%=pageData.getWord("Tenant Management")%></b></div>
			</a>
			<div id="ten_man_menu" style="display:none">
				<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="./Resources_pages/tenant.jsp?dbid=" target="rbottom" class="ten_man_fill" style="background-image:url(img/ten_man_bg.gif)">
					<div class="level2_but" style="background-image:url(img/ten_man_add.gif)">&lt;<%=pageData.getWord("Add tenant")%>&gt;</div>
				</a>
	
		<%
			for(int i = 0; i < tenantsDataResult.size(); i++)
			{
				String tenant_dbid = (String)tenantsDataResult.elementAt(i).get("dbid");
				String tenant_name = (String)tenantsDataResult.elementAt(i).get("name");
		%>
				<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="./Resources_pages/tenant.jsp?dbid=<%=tenant_dbid%>" target="rbottom" class="ten_man_fill" style="background-image:url(img/ten_man_bg.gif)">
					<div class="level2_but" style="background-image:url(img/ten_man_but.gif)"><%=tenant_name%></div>
				</a>
				
		<%	}
		%>	
        		<div class="menuspacer" style="background-image:url(img/config_bg.gif)"></div>
			</div>
		<%	
		}
	
		if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_USER_MANAGEMENT") )
		{
		%>
	
			<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="javascript:;" class="use_man_fill" style="background-image:url(img/config_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'use_man')">
				<div id="use_man" class="level1" style="background-image:url(img/use_man_closed.gif)"><b><%=pageData.getWord("User Management")%></b></div>
			</a>
			<div id="use_man_menu" style="display:none">
				<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="./Resources_pages/user_management.jsp" target="rbottom" class="use_man_fill" style="background-image:url(img/use_man_bg.gif)">
					<div class="level2_but" style="background-image:url(img/use_man_add.gif)">&lt;<%=pageData.getWord("Add a user")%>&gt;</div>
				</a>
				
				<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="javascript:;" class="use_a_fill" style="background-image:url(img/use_man_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'use_a')">
					<div id="use_a" class="level2" style="background-image:url(img/use_a_closed.gif)"><b><%=pageData.getWord("Active Users")%></b></div>
				</a>
				
				<div id="use_a_menu" style="display:none">
					<%
					String active_users_html 	= "";
					if (active_usersDataResult.size()>0) {
						for(int i = 0; i < active_usersDataResult.size(); i++)
						{
							active_users_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"./Resources_pages/user_management.jsp?dbid="+active_usersDataResult.elementAt(i).get("dbid")+"\" target=\"rbottom\" class=\"use_a_fill\" style=\"background-image:url(img/use_a_bg.gif)\" ><div class=\"level3_but\" style=\"background-image:url(img/use_a_but.gif)\">"+active_usersDataResult.elementAt(i).get("username")+ "</div></a>";

						}
					}
					if(active_users_html=="") {
						active_users_html +="<a class=\"use_a_fill\" style=\"background-image:url(img/use_a_bg.gif)\" ><div class=\"level3_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					%>
					<%=active_users_html%>
                    <div class="menuspacer" style="background-image:url(img/use_man_bg.gif)"></div>
				</div>
			
				<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="javascript:;" class="use_i_fill" style="background-image:url(img/use_man_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'use_i')">
					<div id="use_i" class="level2" style="background-image:url(img/use_i_closed.gif)"><b><%=pageData.getWord("Inactive Users")%></b></div>
				</a>
				<div id="use_i_menu" style="display:none">
						<%
						String inactive_users_html 	= "";
						if (inactive_usersDataResult.size()>0) {
							for(int i = 0; i < inactive_usersDataResult.size(); i++)
							{
								inactive_users_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"./Resources_pages/user_management.jsp?dbid="+inactive_usersDataResult.elementAt(i).get("dbid")+"\" target=\"rbottom\" class=\"use_i_fill\" style=\"background-image:url(img/use_i_bg.gif)\" ><div class=\"level3_but\" style=\"background-image:url(img/use_i_but.gif)\">"+inactive_usersDataResult.elementAt(i).get("username")+ "</div></a>";

							}
						}
						if(inactive_users_html=="") {
							inactive_users_html +="<a class=\"use_i_fill\" style=\"background-image:url(img/use_i_bg.gif)\" ><div class=\"level3_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
						}
						%>
						<%=inactive_users_html%>
                        <div class="menuspacer" style="background-image:url(img/use_man_bg.gif)"></div>
				</div>
                
                <div class="menuspacer" style="background-image:url(img/config_bg.gif)"></div>
			</div>
		<%
		}
		%>	
	
		<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="javascript:;" class="a_phone_fill" style="background-image:url(img/config_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'a_phone')">
			<div id="a_phone" class="level1" style="background-image:url(img/a_phone_closed.gif)"><b>AheevaPhone</b></div>
		</a>
		<div id="a_phone_menu" style="display:none">
			<a onmouseover="colorFade(this,'background','ffffff','f9ccca',3,1)" onmouseout="colorFade(this,'background','f9ccca','ffffff',4,1)" href="./Resources_pages/modifyStarPhoneSettings1.jsp" target="rbottom" class="a_phone_fill" style="background-image:url(img/a_phone_bg.gif)">
				<div class="level2_but" style="background-image:url(img/a_phone_but.gif)"><%=pageData.getWord("SoftPhone configuration")%></div>
			</a>
            <div class="menuspacer" style="background-image:url(img/config_bg.gif)"></div>
		</div>
		
		
   <% // End Network Configuration  //<!-- end ALLOW_CONFIGURATION_MANAGEMENT - ALLOW_TENANT_VIEW -->%>
  	<div class="menuspacer" style="background-image:url(img/base_level_bg.gif)"></div>
	</div>
	
  <a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="use_pref_fill" style="background-image:url(img/base_level_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'use_pref')">
		<div id="use_pref" class="level0" style="background-image:url(img/use_pref_closed.gif)"><b><%=pageData.getWord("User preferences")%></b></div>
	</a>
	<div id="use_pref_menu" style="display:none">
		<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/userLiveStatsPreferences.jsp" target="rbottom" class="use_pref_fill" style="background-image:url(img/use_pref_bg.gif)">
			<div class="level1_but" style="background-image:url(img/use_pref_but.gif)"><%=pageData.getWord("User live statistics preferences")%></div>
		</a>
        <div class="menuspacer" style="background-image:url(img/base_level_bg.gif)"></div>
	</div>
<%
} //Fin de pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CONFIGURATION_MANAGEMENT")


if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TENANT_VIEW") )
{
		for (int tenant_pos = 0; tenant_pos < tenantsDataResult.size(); tenant_pos++) // get all tenant
		{
			String current_tenant_dbid 		= (String)tenantsDataResult.elementAt(tenant_pos).get("dbid");
			String current_tenant_name 		= (String)tenantsDataResult.elementAt(tenant_pos).get("name");
			String right_to_change_skills 	= pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT") ? "true" : "false";
			String right_to_quality_monitoring 	= pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT") ? "true" : "false";
		
			
  //<!-- START ALLOW_AGENT_MANAGEMENT -->  %>
		
			<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="ten_fill" style="background-image:url(img/base_level_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'ten')">
				<div id="ten<%=current_tenant_dbid%>" class="level0" style="background-image:url(img/ten_closed.gif)"><b><%=current_tenant_name%></b></div>
			</a>
			<div id="ten<%=current_tenant_dbid%>_menu" style="display:none">

		<%
			if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_RESSOURCES_MANAGEMENT"))
			{
			%>
					
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="res_fill" style="background-image:url(img/ten_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'res')">
						<div id="res<%=current_tenant_dbid%>" class="level1" style="background-image:url(img/res_closed.gif)"><b><%=pageData.getWord("Resources")%></b></div>
					</a>
					<div id="res<%=current_tenant_dbid%>_menu" style="display:none">
					<%
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_MANAGEMENT"))
					{
						String active_agents_html 	= "";
						String inactive_agents_html = "";	
						
						for( int i = 0 ; i < agentsDataResult.size(); i++ )
						{
							String obj_tenant_id = (String)agentsDataResult.elementAt(i).get("tenant_dbid");
							String obj_state 	 = (String)agentsDataResult.elementAt(i).get("state");
							String obj_dbid 	 = (String)agentsDataResult.elementAt(i).get("dbid");
			
							if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
							{
								String full_name = agentsDataResult.elementAt(i).get("last_name")+","+agentsDataResult.elementAt(i).get("first_name")+"["+agentsDataResult.elementAt(i).get("login_id")+"]";
								if( obj_state.compareTo("1") == 0 ){
								
									active_agents_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/agent.jsp?dbid="+obj_dbid+"&agtName="+full_name+"&tenant_dbid="+current_tenant_dbid+"&rightSkills="+right_to_change_skills+"\" target=\"rbottom\" class=\"age_a_fill\" style=\"background-image:url(img/age_a_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/age_a_but.gif)\" id=\"age"+current_tenant_dbid+full_name+"\">"+full_name+ "</div></a> ";
										
								}else{
								
									inactive_agents_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/agent.jsp?dbid="+obj_dbid+"&agtName="+full_name+"&tenant_dbid="+current_tenant_dbid+"&rightSkills="+right_to_change_skills+"\"     target=\"rbottom\" class=\"age_i_fill\" style=\"background-image:url(img/age_i_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/age_i_but.gif)\" id=\"age"+current_tenant_dbid+full_name+"\">"+full_name+ "</div></a> ";
									
								}
							}
						}
						if(active_agents_html=="") {
							active_agents_html +="<a class=\"age_a_fill\" style=\"background-image:url(img/age_a_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a> ";
						}
						if(inactive_agents_html=="") {
							inactive_agents_html +="<a class=\"age_i_fill\" style=\"background-image:url(img/age_i_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a> ";
						}
					%>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="age_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild,  'age')">
							<div id="age<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/age_closed.gif)"><b><%=pageData.getWord("Agents")%></b></div>
						</a>
						
						<div id="age<%=current_tenant_dbid%>_menu" style="display:none">
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/agent.jsp?dbid=&agtName=&tenant_dbid=<%=current_tenant_dbid%>&rightSkills=<%=right_to_change_skills %> " target="rbottom" class="age_fill" style="background-image:url(img/age_bg.gif)">
								<div class="level3_but" style="background-image:url(img/age_add.gif)">&#60;<%=pageData.getWord("Add agent")%>&#62;</div>
							</a>
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="age_a_fill" style="background-image:url(img/age_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'age_a')">
								<div id="age_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/age_a_closed.gif)"><b><%=pageData.getWord("Active agents")%></b></div>
							</a>
							<div id="age_a<%=current_tenant_dbid%>_menu" style="display:none">
								<%=active_agents_html%>
                                <div class="menuspacer" style="background-image:url(img/age_bg.gif)"></div>
							</div>	
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="age_i_fill" style="background-image:url(img/age_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'age_i')">
							<div id="age_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/age_i_closed.gif)"><b><%=pageData.getWord("Inactive agents")%></b></div>
						</a>
						<div id="age_i<%=current_tenant_dbid%>_menu" style="display:none">
							<%=inactive_agents_html%>
                            <div class="menuspacer" style="background-image:url(img/age_bg.gif)"></div>
					</div>
                    <div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>				
			   	</div>

<%  //<!-- End START ALLOW_AGENT_MANAGEMENT -->  		

				
				} //Fin de pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_MANAGEMENT"))

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT"))
				{
					
  //<!-- START ALLOW_AGENT_GROUPS_MANAGEMENT -->  %>		
					
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="age_gr_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'age_gr')">
						<div id="age_gr<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/age_gr_closed.gif)"><b><%=pageData.getWord("Agent Groups")%></b></div>
					</a>
					
					<div id="age_gr<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/agentGroup.jsp?dbid=&grpName=&tenant_dbid=<%=current_tenant_dbid %>&recordingRight=<%=right_to_quality_monitoring %>" target="rbottom" class="age_gr_fill" style="background-image:url(img/age_gr_bg.gif)">
							<div class="level3_but" style="background-image:url(img/age_gr_add.gif)">&#60;<%=pageData.getWord("Add agent group")%>&#62;</div>
						</a>
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="age_gr_a_fill" style="background-image:url(img/age_gr_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'age_gr_a')">
							<div id="age_gr_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/age_gr_a_closed.gif)"><b><%=pageData.getWord("Active agent group")%></b></div>
						</a>
						<div id="age_gr_a<%=current_tenant_dbid%>_menu" style="display:none">
							<%
							String active_agent_groups_html 	= "";
							if (active_agentGroupsDataResult.size()>0) {
								for( int i = 0 ; i < active_agentGroupsDataResult.size(); i++ )
								{
									String obj_tenant_id = (String)active_agentGroupsDataResult.elementAt(i).get("tenant_dbid");
									String obj_dbid = (String)active_agentGroupsDataResult.elementAt(i).get("dbid");
									if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 ) {
										
										active_agent_groups_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/agentGroup.jsp?dbid="+obj_dbid+"&grpName="+active_agentGroupsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"&recordingRight="+right_to_quality_monitoring+"\"     target=\"rbottom\" class=\"age_gr_a_fill\" style=\"background-image:url(img/age_gr_a_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/age_gr_a_but.gif)\" id=\"age_gr"+current_tenant_dbid+active_agentGroupsDataResult.elementAt(i).get("name")+"\">"+active_agentGroupsDataResult.elementAt(i).get("name")+ "</div></a> ";
										
									}
								}
							}
							if(active_agent_groups_html == ""){
								active_agent_groups_html +="<a class=\"age_gr_a_fill\" style=\"background-image:url(img/age_gr_a_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							%>
							<%=active_agent_groups_html%>
                            <div class="menuspacer" style="background-image:url(img/age_gr_bg.gif)"></div>
						</div>	
					
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="age_gr_i_fill" style="background-image:url(img/age_gr_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'age_gr_i')">
							<div id="age_gr_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/age_gr_i_closed.gif)"><b><%=pageData.getWord("Inactive agent group")%></b></div>
						</a>
						<div id="age_gr_i<%=current_tenant_dbid%>_menu" style="display:none">
					
							<%
							String inactive_agent_groups_html 	= "";
							if (inactive_agentGroupsDataResult.size()>0) {
								for( int i = 0 ; i < inactive_agentGroupsDataResult.size(); i++ )
								{
									String obj_tenant_id = (String)inactive_agentGroupsDataResult.elementAt(i).get("tenant_dbid");
									String obj_dbid = (String)inactive_agentGroupsDataResult.elementAt(i).get("dbid");
									if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 ){
										
										inactive_agent_groups_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/agentGroup.jsp?dbid="+obj_dbid+"&grpName="+inactive_agentGroupsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"&recordingRight="+right_to_quality_monitoring+"\"    target=\"rbottom\" class=\"age_gr_i_fill\" style=\"background-image:url(img/age_gr_i_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/age_gr_i_but.gif)\" id=\"age_gr"+current_tenant_dbid+inactive_agentGroupsDataResult.elementAt(i).get("name")+"\">"+inactive_agentGroupsDataResult.elementAt(i).get("name")+ "</div></a> ";
									
									}
								}
							}	
							if(inactive_agent_groups_html == ""){
								inactive_agent_groups_html +="<a class=\"age_gr_i_fill\" style=\"background-image:url(img/age_gr_i_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							%>
							<%=inactive_agent_groups_html%>
                            <div class="menuspacer" style="background-image:url(img/age_gr_bg.gif)"></div>
						</div>
                        <div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>
					</div>					
<% //<!-- end ALLOW_AGENT_GROUPS_MANAGEMENT --> 				
				
				} //END OF pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT")

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))
				{
					
				 
				
 //<!-- START ALLOW_CAMPAIGN_MANAGEMENT --> %>	
					
				
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="cam_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'cam')">
						<div id="cam<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/cam_closed.gif)"><b><%=pageData.getWord("Campaigns")%></b></div>
					</a>
					
					<div id="cam<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/campaign.jsp?dbid=&campaign_name=&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="cam_fill" style="background-image:url(img/cam_bg.gif)">
							<div class="level3_but" style="background-image:url(img/cam_add.gif)">&#60;<%=pageData.getWord("Add campaign") %>&#62;</div>
						</a>
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="cam_a_fill" style="background-image:url(img/cam_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'cam_a')">
							<div id="cam_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/cam_a_closed.gif)"><b><%=pageData.getWord("Active campaigns")%></b></div>
						</a>
						
						<div id="cam_a<%=current_tenant_dbid%>_menu" style="display:none">
					
						<%
						String active_campaigns_html 	= "";
						if (active_campaignsDataResult.size()>0) {
							for( int i = 0 ; i < active_campaignsDataResult.size(); i++ )
							{
								String obj_tenant_id = (String)active_campaignsDataResult.elementAt(i).get("tenant_dbid");
								String obj_dbid = (String)active_campaignsDataResult.elementAt(i).get("dbid");
								if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 ){
									
									active_campaigns_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/campaign.jsp?campaign_name="+active_campaignsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"&dbid="+obj_dbid+"\"    target=\"rbottom\" class=\"cam_a_fill\" style=\"background-image:url(img/cam_a_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/cam_a_but.gif)\" id=\"cam"+current_tenant_dbid+active_campaignsDataResult.elementAt(i).get("name")+"\">"+active_campaignsDataResult.elementAt(i).get("name")+ "</div></a>";
									
								}	
							}
						}
						if(active_campaigns_html == ""){
							active_campaigns_html +="<a class=\"cam_a_fill\" style=\"background-image:url(img/cam_a_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
						}
						%>
						<%=active_campaigns_html%>
                        <div class="menuspacer" style="background-image:url(img/cam_bg.gif)"></div>
						</div>
				
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="cam_i_fill" style="background-image:url(img/cam_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'cam_i')">
							<div id="cam_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/cam_i_closed.gif)"><b><%=pageData.getWord("Inactive campaigns")%></b></div>
						</a>
					
						<div id="cam_i<%=current_tenant_dbid%>_menu" style="display:none">
					
							<%
							String inactive_campaigns_html 	= "";
							if (inactive_campaignsDataResult.size()>0){
								for( int i = 0 ; i < inactive_campaignsDataResult.size(); i++ )
								{
									String obj_tenant_id = (String)inactive_campaignsDataResult.elementAt(i).get("tenant_dbid");
									String obj_dbid = (String)inactive_campaignsDataResult.elementAt(i).get("dbid");
									if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 ){
										
										inactive_campaigns_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/campaign.jsp?campaign_name="+inactive_campaignsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"&dbid="+obj_dbid+"\"    target=\"rbottom\" class=\"cam_i_fill\" style=\"background-image:url(img/cam_i_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/cam_i_but.gif)\" id=\"cam"+current_tenant_dbid+inactive_campaignsDataResult.elementAt(i).get("name")+"\">"+inactive_campaignsDataResult.elementAt(i).get("name")+ "</div></a>";

									}
								}	
							}
							if(inactive_campaigns_html == ""){
								inactive_campaigns_html +="<a class=\"cam_i_fill\" style=\"background-image:url(img/cam_i_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							%>
							<%=inactive_campaigns_html%>
                            <div class="menuspacer" style="background-image:url(img/cam_bg.gif)"></div>
						</div>
                        
                        <div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>
				</div>
	<% //<!-- end ALLOW_CAMPAIGN_MANAGEMENT --> 	
				
				
				} // Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))

				// Calling lists
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))
				{	
				
 //<!-- ALLOW_CALLING_LIST_MANAGEMENT -->   %>
			
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="call_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'call')">
						<div id="call<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/call_closed.gif)"><b><%=pageData.getWord("Calling lists")%></b>
						</div>
					</a>
					<div id="call<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/addCallingList.jsp?callinglistName=&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="call_fill" style="background-image:url(img/call_bg.gif)">
							<div class="level3_but" style="background-image:url(img/call_add.gif)">&#60;<%=pageData.getWord("Add calling list")%>&#62;</div>
						</a>
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="call_a_fill" style="background-image:url(img/call_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'call_a')">
							<div id="call_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/call_a_closed.gif)"><b><%=pageData.getWord("Active lists")%></b></div>
						</a>
						
						<div id="call_a<%=current_tenant_dbid%>_menu" style="display:none">
							<%
							String active_callinglists_html 	= "";
							if (active_callingListsDataResult.size()>0){				
								for( int i = 0 ; i < active_callingListsDataResult.size(); i++ )
								{
									String obj_tenant_id = (String)active_callingListsDataResult.elementAt(i).get("tenant_dbid");
									String obj_dbid = (String)active_callingListsDataResult.elementAt(i).get("dbid");
									if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 ) {
										
										active_callinglists_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/modifyCallingList.jsp?dbid="+obj_dbid+"&callinglistName="+active_callingListsDataResult.elementAt(i).get("name")+"&callingListTableName="+active_callingListsDataResult.elementAt(i).get("table_name")+"&tenant_dbid="+current_tenant_dbid+"\"    target=\"rbottom\" class=\"call_a_fill\" style=\"background-image:url(img/call_a_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/call_a_but.gif)\" id=\"call"+current_tenant_dbid+active_callingListsDataResult.elementAt(i).get("name")+"\">"+active_callingListsDataResult.elementAt(i).get("name")+ "</div></a> ";
										
									}	
								}
							}
							if(active_callinglists_html == ""){
								active_callinglists_html +="<a class=\"call_a_fill\" style=\"background-image:url(img/call_a_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							%>	
							<%=active_callinglists_html%>
                            <div class="menuspacer" style="background-image:url(img/call_bg.gif)"></div>
					</div>		
								
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="call_i_fill" style="background-image:url(img/call_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'call_i')">
						<div id="call_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/call_i_closed.gif)"><b><%=pageData.getWord("Inactive lists")%></b></div>
					</a>
					<div id="call_i<%=current_tenant_dbid%>_menu" style="display:none">
					
						<%
						String inactive_callinglists_html 	= "";
						if (inactive_callingListsDataResult.size()>0){				
							for( int i = 0 ; i < inactive_callingListsDataResult.size(); i++ )
							{
								String obj_tenant_id = (String)inactive_callingListsDataResult.elementAt(i).get("tenant_dbid");
								String obj_dbid = (String)inactive_callingListsDataResult.elementAt(i).get("dbid");
								if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 ) {
									
									inactive_callinglists_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/modifyCallingList.jsp?dbid="+obj_dbid+"&callinglistName="+inactive_callingListsDataResult.elementAt(i).get("name")+"&callingListTableName="+active_callingListsDataResult.elementAt(i).get("table_name")+"&tenant_dbid="+current_tenant_dbid+"\"    target=\"rbottom\" class=\"call_i_fill\" style=\"background-image:url(img/call_i_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/call_i_but.gif)\" id=\"call"+current_tenant_dbid+inactive_callingListsDataResult.elementAt(i).get("name")+"\">"+inactive_callingListsDataResult.elementAt(i).get("name")+ "</div></a>";
									
								}
							}
						}
						if(inactive_callinglists_html == ""){
							inactive_callinglists_html +="<a class=\"call_i_fill\" style=\"background-image:url(img/call_i_bg.gif)\" ><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
						}
						%>
						<%=inactive_callinglists_html%>
                        <div class="menuspacer" style="background-image:url(img/call_bg.gif)"></div>
					</div>
                    
                    <div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>
				  </div>
<% //<!-- end ALLOW_CALLING_LIST_MANAGEMENT --> 

			   
					
			   	} // Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_DONOTCALL_LIST_MANAGEMENT"))
				{
					String black_list_html  	= "";					
					
					for( int i = 0 ; i < blacklistDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)blacklistDataResult.elementAt(i).get("tenant_dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 ) {
							 black_list_html	 +=	"<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/blackList1.jsp?blacklist_dbid="+blacklistDataResult.elementAt(i).get("dbid")+"&blacklist_name="+blacklistDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"no_call_cur_fill\" style=\"background-image:url(img/no_call_cur_bg.gif) \">";
							 black_list_html	 += "	<div class=\"level4_but\" style=\"background-image:url(img/no_call_cur_but.gif)\" id=\"no_call_cur"+current_tenant_dbid+blacklistDataResult.elementAt(i).get("name")+"\">" + blacklistDataResult.elementAt(i).get("name") + "</div> ";
							 black_list_html	 += "</a>";
						}
					}
					if (black_list_html==""){
						black_list_html	 +=	"<a class=\"no_call_cur_fill\" style=\"background-image:url(img/no_call_cur_bg.gif) \"><div class=\"level4_but\" style=\"background-image:url(img/empty_1_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					%> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="no_call_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'no_call')">
						<div id="no_call<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/no_call_closed.gif)"><b><%=pageData.getWord("Do-not-call lists")%></b></div>
					</a>
					
					<div id="no_call<%=current_tenant_dbid%>_menu" style="display:none">
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/blackList1.jsp?blacklist_dbid=&blacklist_name=&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="no_call_fill" style="background-image:url(img/no_call_bg.gif)">
								<div class="level3_but" style="background-image:url(img/no_call_add.gif)">&#60;<%=pageData.getWord("Create a do-not-call list")%>&#62;</div>
							</a>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="no_call_cur_fill" style="background-image:url(img/no_call_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'no_call_cur')">
								<div id="no_call_cur<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/no_call_cur_closed.gif)"><b><%=pageData.getWord("Current do-not-call lists")%></b></div>
							</a>
					
							<div id="no_call_cur<%=current_tenant_dbid%>_menu" style="display:none">
								<%=black_list_html%>
                                <div class="menuspacer" style="background-image:url(img/no_call_bg.gif)"></div>
							</div>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="no_call_act_fill" style="background-image:url(img/no_call_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'no_call_act')">
								<div id="no_call_act<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/no_call_act_closed.gif)"><b><%=pageData.getWord("Actions on do-not-call lists")%></b></div>
							</a>
			
			

							<div id="no_call_act<%=current_tenant_dbid%>_menu" style="display:none">
								<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/addNumbersToBlackList.jsp?tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="no_call_act_fill" style="background-image:url(img/no_call_act_bg.gif)">
									<div class="level4_but" style="background-image:url(img/no_call_act_but.gif)"><%=pageData.getWord("Add numbers to Do-not-call list")%></div>
								</a>
								<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/blackListNumberInCampaign1.jsp?tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="no_call_act_fill" style="background-image:url(img/no_call_act_bg.gif)">
									<div class="level4_but" style="background-image:url(img/no_call_act_but.gif)"><%=pageData.getWord("Search campaign for Do-not-call list number")%></div>
								</a>
								<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/viewBlacklistContents1.jsp?tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="no_call_act_fill" style="background-image:url(img/no_call_act_bg.gif)">
									<div class="level4_but" style="background-image:url(img/no_call_act_but.gif)"><%=pageData.getWord("Display Do-not-call list contents")%></div></a>
                                    <div class="menuspacer" style="background-image:url(img/no_call_bg.gif)"></div>
							</div>
                            <div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>
					</div>
							
<% //<!-- end ALLOW_DONOTCALL_LIST_MANAGEMENT -->   
  //<!-- ALLOW_FILTER_MANAGEMENT -->  

				
				}
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FILTER_MANAGEMENT"))
				{
					String active_filters_html  	= "";
					String inactive_filters_html 	= "";
					
					for( int i = 0 ; i < filtersDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)filtersDataResult.elementAt(i).get("tenant_dbid");
						String obj_state 	 = (String)filtersDataResult.elementAt(i).get("state");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{
							if( obj_state.compareTo("1") == 0 ) {
								active_filters_html 	 += " <a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/filter1.jsp?filter_name="+filtersDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"fil_a_fill\" style=\"background-image:url(img/fil_a_bg.gif)\">";
								active_filters_html 	 += "	<div class=\"level4_but\" style=\"background-image:url(img/fil_a_but.gif)\" id=\"fil"+current_tenant_dbid+filtersDataResult.elementAt(i).get("name")+"\">"+filtersDataResult.elementAt(i).get("name")+"</div>";
								active_filters_html 	 += " </a>";
							}
							else{
								inactive_filters_html 	 += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/filter1.jsp?filter_name="+filtersDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"fil_i_fill\" style=\"background-image:url(img/fil_i_bg.gif)\">";
								inactive_filters_html 	 += "	<div class=\"level4_but\" style=\"background-image:url(img/fil_i_but.gif)\" id=\"fil"+current_tenant_dbid+filtersDataResult.elementAt(i).get("name")+"\">"+ filtersDataResult.elementAt(i).get("name")+"</div>";
								inactive_filters_html 	 += "</a>";
							}
						}
					}
					if (active_filters_html=="") {
						active_filters_html 	 += "<a class=\"fil_a_fill\" style=\"background-image:url(img/fil_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					if (inactive_filters_html=="") {
						inactive_filters_html 	 += "<a class=\"fil_i_fill\" style=\"background-image:url(img/fil_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					%>
					
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="fil_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'fil')">
						<div id="fil<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/fil_closed.gif)"><b><%=pageData.getWord("Filters")%></b></div>
					</a>
					<div id="fil<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/filter1.jsp?filter_name=&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="fil_fill" style="background-image:url(img/fil_bg.gif)">
							<div class="level3_but" style="background-image:url(img/fil_add.gif)">&#60;<%=pageData.getWord("Add filter")%>&#62;</div>
						</a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="fil_a_fill" style="background-image:url(img/fil_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'fil_a')">
							<div id="fil_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/fil_a_closed.gif)"><b><%=pageData.getWord("Active filter")%></b></div>
						</a>
						<div id="fil_a<%=current_tenant_dbid%>_menu" style="display:none">
							<%=active_filters_html%>
                            <div class="menuspacer" style="background-image:url(img/fil_bg.gif)"></div>
						</div>
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="fil_i_fill" style="background-image:url(img/fil_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'fil_i')">
							<div id="fil_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/fil_i_closed.gif)"><b><%=pageData.getWord("Inactive filter")%></b></div>
						</a>
						<div id="fil_i<%=current_tenant_dbid%>_menu" style="display:none">
							<%=inactive_filters_html%>
                            <div class="menuspacer" style="background-image:url(img/fil_bg.gif)"></div>
						</div>
                        <div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>
					</div>
<%  //<!-- end ALLOW_FILTER_MANAGEMENT -->  
  //<!-- ALLOW_TREATMENTS_MANAGEMENT -->  				
				

				} // Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FILTER_MANAGEMENT"))


				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TREATMENTS_MANAGEMENT"))
				{
					String active_treatments_html  		= "";
					String inactive_treatments_html 	= "";
					
					for( int i = 0 ; i < treatmentsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)treatmentsDataResult.elementAt(i).get("tenant_dbid");
						String obj_state 	 = (String)treatmentsDataResult.elementAt(i).get("state");
						if(obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{
							if( obj_state.compareTo("1") == 0 ) {
								active_treatments_html 	 += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/treatment1.jsp?treatment_name="+treatmentsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"treat_a_fill\" style=\"background-image:url(img/treat_a_bg.gif)\">";
								active_treatments_html 	 += "<div class=\"level4_but\" style=\"background-image:url(img/treat_a_but.gif)\" id=\"treat"+current_tenant_dbid+treatmentsDataResult.elementAt(i).get("name")+"\">"+treatmentsDataResult.elementAt(i).get("name")+"</div>";
								active_treatments_html 	 += "</a>";
							}
							else{
								inactive_treatments_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/treatment1.jsp?treatment_name="+treatmentsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"treat_i_fill\" style=\"background-image:url(img/treat_i_bg.gif)\">";
								inactive_treatments_html += "<div class=\"level4_but\" style=\"background-image:url(img/treat_i_but.gif)\" id=\"treat"+current_tenant_dbid+treatmentsDataResult.elementAt(i).get("name")+"\">"+treatmentsDataResult.elementAt(i).get("name")+"</div>";
								inactive_treatments_html += "</a>";
							}
						}
					}
					if (active_treatments_html=="") {
						active_treatments_html 	 += "<a class=\"treat_a_fill\" style=\"background-image:url(img/treat_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					if (inactive_treatments_html=="") {
						inactive_treatments_html += "<a class=\"treat_i_fill\" style=\"background-image:url(img/treat_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					
					%>
					
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="treat_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'treat')">
						<div id="treat<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/treat_closed.gif)"><b>Treatments</b></div>
					</a>
					<div id="treat<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/treatment1.jsp?treatment_name=&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="treat_fill" style="background-image:url(img/treat_bg.gif)">
							<div class="level3_but" style="background-image:url(img/treat_add.gif)">&#60;<%=pageData.getWord("Add treatment")%>&#62;</div>
						</a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="treat_a_fill" style="background-image:url(img/treat_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'treat_a')">
							<div id="treat_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/treat_a_closed.gif)"><b><%=pageData.getWord("Active Treatments")%></b></div>
						</a>
						
						<div id="treat_a<%=current_tenant_dbid%>_menu" style="display:none">
							<%=active_treatments_html%>
                            <div class="menuspacer" style="background-image:url(img/treat_bg.gif)"></div>
						</div>
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="treat_i_fill" style="background-image:url(img/treat_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'treat_i')">
							<div id="treat_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/treat_i_closed.gif)"><b><%=pageData.getWord("Inactive Treatments")%></b></div>
						</a>
						<div id="treat_i<%=current_tenant_dbid%>_menu" style="display:none">
							<%=inactive_treatments_html%>
                            <div class="menuspacer" style="background-image:url(img/treat_bg.gif)"></div>
						</div>
                        <div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>
					</div>	
					
<% //<!-- end ALLOW_TREATMENTS_MANAGEMENT --> 
  //<!-- ALLOW_NOT_READY_REASON_MANAGEMENT --> 


					
				}//if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TREATMENTS_MANAGEMENT"))

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_NOT_READY_REASON_MANAGEMENT"))
				{
					
					String active_notreadyreasons_html  	= "";
					String inactive_notreadyreasons_html 	= "";
					
					for( int i = 0 ; i < notreadyreasonsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)notreadyreasonsDataResult.elementAt(i).get("tenant_dbid");
						String obj_state 	 = (String)notreadyreasonsDataResult.elementAt(i).get("state");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{
							if( obj_state.compareTo("1") == 0 ) {
								active_notreadyreasons_html   += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/notReadyReason1.jsp?NRR_name="+notreadyreasonsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"no_ready_a_fill\" style=\"background-image:url(img/no_ready_a_bg.gif)\">";
								active_notreadyreasons_html   += "<div class=\"level4_but\" style=\"background-image:url(img/no_ready_a_but.gif)\" id=\"no_ready"+current_tenant_dbid+notreadyreasonsDataResult.elementAt(i).get("name")+"\">"+notreadyreasonsDataResult.elementAt(i).get("name")+"</div>";
								active_notreadyreasons_html   += "</a>";
							}
							else{
								inactive_notreadyreasons_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/notReadyReason1.jsp?NRR_name="+notreadyreasonsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"no_ready_i_fill\" style=\"background-image:url(img/no_ready_i_bg.gif)\">";
								inactive_notreadyreasons_html += "<div class=\"level4_but\" style=\"background-image:url(img/no_ready_i_but.gif)\" id=\"no_ready"+current_tenant_dbid+notreadyreasonsDataResult.elementAt(i).get("name")+"\">"+notreadyreasonsDataResult.elementAt(i).get("name")+"</div>";
								inactive_notreadyreasons_html += "</a>";
							}
						}
					}
					if (active_notreadyreasons_html=="") {
						active_notreadyreasons_html   += "<a class=\"no_ready_a_fill\" style=\"background-image:url(img/no_ready_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					if (inactive_notreadyreasons_html=="") {
						inactive_notreadyreasons_html += "<a class=\"no_ready_i_fill\" style=\"background-image:url(img/no_ready_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					%>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="no_ready_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'no_ready')">
						<div id="no_ready<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/no_ready_closed.gif)"><b><%=pageData.getWord("Not-ready reasons")%></b></div>
					</a>
					<div id="no_ready<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/notReadyReason1.jsp?NRR_name=&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="no_ready_fill" style="background-image:url(img/no_ready_bg.gif)">
							<div class="level3_but" style="background-image:url(img/no_ready_add.gif)">&#60;<%=pageData.getWord("Add Not-ready reason")%>&#62;</div>
						</a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="no_ready_a_fill" style="background-image:url(img/no_ready_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'no_ready_a')">
							<div id="no_ready_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/no_ready_a_closed.gif)"><b><%=pageData.getWord("Active Not-ready reasons")%></b></div>
						</a>
						<div id="no_ready_a<%=current_tenant_dbid%>_menu" style="display:none">
							<%=active_notreadyreasons_html%>
                            <div class="menuspacer" style="background-image:url(img/no_ready_bg.gif)"></div>
						</div>
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="no_ready_i_fill" style="background-image:url(img/no_ready_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'no_ready_i')">
							<div id="no_ready_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/no_ready_i_closed.gif)"><b><%=pageData.getWord("Inactive Not-ready reasons")%></b></div>
						</a>				
						<div id="no_ready_i<%=current_tenant_dbid%>_menu" style="display:none">
							<%=inactive_notreadyreasons_html%>
                            <div class="menuspacer" style="background-image:url(img/no_ready_bg.gif)"></div>
						</div>
                        <div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>
					</div>
					
<% //<!-- end ALLOW_NOT_READY_REASON_MANAGEMENT --> 
 //<!-- ALLOW_QUEUES_MANAGEMENT --> 

				

				}//Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_NOT_READY_REASON_MANAGEMENT"))


				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUEUES_MANAGEMENT"))
				{
					String agent_group_queues_html  	= "";
					
					for( int i = 0 ; i < queuemanagementDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)queuemanagementDataResult.elementAt(i).get("tenant_dbid");						
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{
							agent_group_queues_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/queues.jsp?queue_name="+queuemanagementDataResult.elementAt(i).get("queue")+"&tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"age_qu_fill\" style=\"background-image:url(img/age_qu_bg.gif)\">";
							agent_group_queues_html += "	<div class=\"level4_but\" style=\"background-image:url(img/age_gr_qu_but.gif)\" id=\"age_qu"+current_tenant_dbid+queuemanagementDataResult.elementAt(i).get("queue")+"\">"+queuemanagementDataResult.elementAt(i).get("queue")+"</div>";
							agent_group_queues_html += "</a>";							
						}					
					}
					if (agent_group_queues_html=="") {
						agent_group_queues_html += "<a class=\"age_qu_fill\" style=\"background-image:url(img/age_qu_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_1_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					%>
					
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="qu_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'qu')">
						<div id="qu<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/qu_closed.gif)"><b><%=pageData.getWord("Queues")%></b></div>
					</a>
					
					<div id="qu<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="age_qu_fill" style="background-image:url(img/qu_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'age_qu')">
							<div id="age_qu<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/age_qu_closed.gif)"><b><%=pageData.getWord("Agent group queues")%></b></div>
						</a>
						<div id="age_qu<%=current_tenant_dbid%>_menu" style="display:none">
						<%=agent_group_queues_html%>
                        	<div class="menuspacer" style="background-image:url(img/qu_bg.gif)"></div>
						</div>
						
						<% 
						if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT"))
						{
						 //<!-- ALLOW_ROUTING_SCRIPT_MANAGEMENT --> %>
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="rout_qu_fill" style="background-image:url(img/qu_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'rout_qu')">
								<div id="rout_qu<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/rout_qu_closed.gif)"><b><%=pageData.getWord("Routing script queues")%></b></div>
							</a>
							<div id="rout_qu<%=current_tenant_dbid%>_menu" style="display:none">
							
							<script>
							tenantDBID = "<%=current_tenant_dbid%>";
							var arrayQueues = this.getRoutingScriptAndQueues(tenantDBID);
							var arrayqueues_html = "";
							if (arrayQueues.length>0) {
								for (i = 0; i < arrayQueues.length; i++)
								{
									arrayqueues_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/queues.jsp?queue_name="+arrayQueues[i]+"&tenant_dbid="+tenantDBID+"\" target=\"rbottom\" class=\"rout_qu_fill\" style=\"background-image:url(img/rout_qu_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/rout_qu_but.gif)\" id=\"rout_qu"+tenantDBID+arrayQueues[i]+"\">"+arrayQueues[i]+"</div></a>";
								
								}
							}
							if(arrayqueues_html=="") {
								arrayqueues_html += "<a class=\"rout_qu_fill\" style=\"background-image:url(img/rout_qu_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_1_but.gif)\">&#40;<%=pageData.getWord("empty")%>&#41;</div></a>";
							}
							document.write(arrayqueues_html);
							</script>
								<div class="menuspacer" style="background-image:url(img/qu_bg.gif)"></div>
							</div>
						
						<%} 
						//<!-- end ALLOW_ROUTING_SCRIPT_MANAGEMENT --> 
						%>
						<div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>
					</div>					
<% //<!-- end ALLOW_QUEUES_MANAGEMENT -->  
 //<!-- ALLOW_SKILLS_MANAGEMENT --> 

				}//Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUEUES_MANAGEMENT"))

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT"))
				{
					String skills_queues_html  	= "";
					for( int i = 0 ; i < skillsmanagementDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)skillsmanagementDataResult.elementAt(i).get("tenant_dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{	
							skills_queues_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/Skill.jsp?skill_id="+skillsmanagementDataResult.elementAt(i).get("dbid") + "\" target=\"rbottom\" class=\"skill_fill\" style=\"background-image:url(img/skill_bg.gif)\">";
							skills_queues_html += "	<div class=\"level3_but\" style=\"background-image:url(img/skill_but.gif)\" id=\"skill"+current_tenant_dbid+skillsmanagementDataResult.elementAt(i).get("name")+"\">"+skillsmanagementDataResult.elementAt(i).get("name")+"</div>";
							skills_queues_html += "</a>";
						}	
					} %>
					
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="skill_fill" style="background-image:url(img/res_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'skill')">
						<div id="skill<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/skill_closed.gif)"><b><%=pageData.getWord("Skills")%></b></div>
					</a>
					<div id="skill<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/Skill.jsp?tenant_dbid=<%=current_tenant_dbid%>"  target="rbottom" class="skill_fill" style="background-image:url(img/skill_bg.gif)">
							<div class="level3_but" style="background-image:url(img/skill_add.gif)">&#60;<%=pageData.getWord("Add skills")%>&#62;</div>
						</a>
					
						<%=skills_queues_html%>
                        <div class="menuspacer" style="background-image:url(img/res_bg.gif)"></div>
					</div>
					
				<%}//FIN de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT"))%>
                	<div class="menuspacer" style="background-image:url(img/ten_bg.gif)"></div>
				</div>
			<%}//Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_RESSOURCES_MANAGEMENT"))


			 if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_REPORTS_MANAGEMENT"))
			{
 //<!-- ALLOW_HISTORICAL_REPORTS_MANAGEMENT --> %>

			<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="rep_h_fill" style="background-image:url(img/ten_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'rep_h')">
				<div id="rep_h<%=current_tenant_dbid%>" class="level1" style="background-image:url(img/rep_h_closed.gif)"><b>Historic reports</b></div>
			</a>
			<div id="rep_h<%=current_tenant_dbid%>_menu" style="display:none">
<%	// ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT %>
				<%if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT")) { %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/datePicker.jsp?type=Agents&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Agent Details Reports") %></div>
					</a>
				<% } 
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT")){ %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/datePicker.jsp?type=AgentGroups&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%= pageData.getWord("Agent Groups Reports")%></div>
					</a>
				<% } 
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT")){ %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/datePicker.jsp?type=AgentSummary&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%= pageData.getWord("Agent summary reports") %></div>
					</a>	
				<% }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT")){ %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/datePicker.jsp?type=Outbound&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Outbound call reports") %></div>
					</a>
				<% }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT")){ %>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/inboundCalls1.jsp?type=Inbound&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Inbound Calls Reports") %></div>
					</a>
				<% }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT")){ %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/datePicker.jsp?type=AgentLoginReport&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Agent Login Reports") %></div>
					</a>
				<% }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT")){ %>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/datePicker.jsp?type=Campaigns&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Campaign Reports") %></div>
					</a>
				<% }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT")){ %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/datePicker.jsp?type=CallingsLists&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Calling List Reports")%></div>
					</a>
				<% }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT")){ %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/datePicker.jsp?type=CallDetails&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Calling List Report Details")%></div>
					</a>
				<% }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT")){ %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/datePicker.jsp?type=Queues&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Queue Reports") %></div>
					</a>
				<% }
					
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT")){ %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/groupReport1.jsp?type=GroupForecast&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Group Forecast Reports") %></div>
					</a>
				<% }
					
				{ %> 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/groupReport1.jsp?type=GroupSummary&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Group Summary Reports") %></div>
					</a>
				<% }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT")){ %> 
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/lineReport1.jsp?type=LineReport&tenant_dbid=<%=current_tenant_dbid %>" target="rbottom" class="rep_h_fill" style="background-image:url(img/rep_h_bg.gif)">
						<div class="level2_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Line Report") %></div>
				</a>
				<% }%>
                
					<div class="menuspacer" style="background-image:url(img/ten_bg.gif)"></div>
			</div>
		
<% //<!-- end ALLOW_HISTORICAL_REPORTS_MANAGEMENT --> 
 //<!-- ALLOW_QUALITY_MONITORING_MANAGEMENT --> 
			
			}// Fin de iif(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_REPORTS_MANAGEMENT"))

			if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_MANAGEMENT"))
			{				
			 %>
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_fill" style="background-image:url(img/ten_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m')">
					<div id="q_m<%=current_tenant_dbid%>" class="level1" style="background-image:url(img/q_m_closed.gif)"><b><%=pageData.getWord("Quality Monitoring")%></b></div>
				</a>
				
				<div id="q_m<%=current_tenant_dbid%>_menu" style="display:none">
				<%if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT"))
					out.write("<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/conversationRecPicker1.jsp?tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"q_m_fill\" style=\"background-image:url(img/q_m_bg.gif)\"><div class=\"level2_but\" style=\"background-image:url(img/q_m_but.gif)\">"+pageData.getWord("Agent's recordings")+"</div></a>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT"))
					out.write("<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/listenRecPicker1.jsp?tenant_dbid="+current_tenant_dbid+"&group=\" target=\"rbottom\" class=\"q_m_fill\" style=\"background-image:url(img/q_m_bg.gif)\"><div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">"+pageData.getWord("Agent monitoring report")+"</div></a>");
				
				
				
				
				
				//Start of Evaluation form ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT"))
				{
			%>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_eval_fill" style="background-image:url(img/q_m_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval')">
						<div id="q_m_eval<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/q_m_eval_closed.gif)"><b><%=pageData.getWord("Evaluation forms")%></b></div>
					</a>
					<div id="q_m_eval<%=current_tenant_dbid%>_menu" style="display:none">
									
						<% //try{
								String active_evaluations_html  	= "";
								String inactive_evaluations_html  	= "";
							for( int i = 0 ; i < formsDataResult.size(); i++ )
							{
							
								String obj_state 	 = (String)formsDataResult.elementAt(i).get("state");
								if( obj_state.compareTo("1") == 0 ){
									active_evaluations_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/form.jsp?dbid="+formsDataResult.elementAt(i).get("dbid")+"&name="+formsDataResult.elementAt(i).get("name")+"&tenant_dbid="+formsDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"q_m_eval_a_fill\" style=\"background-image:url(img/q_m_eval_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/q_m_eval_a_but.gif)\" id=\"q_m_eval"+current_tenant_dbid+formsDataResult.elementAt(i).get("name")+"\">"+formsDataResult.elementAt(i).get("name")+"</div></a>";
								}
								else{
									inactive_evaluations_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/form.jsp?dbid="+formsDataResult.elementAt(i).get("dbid")+"&name="+formsDataResult.elementAt(i).get("name")+"&tenant_dbid="+formsDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"q_m_eval_i_fill\" style=\"background-image:url(img/q_m_eval_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/q_m_eval_i_but.gif)\" id=\"q_m_eval"+current_tenant_dbid+formsDataResult.elementAt(i).get("name")+"\">"+formsDataResult.elementAt(i).get("name")+"</div></a>";
								}
							}
						if (active_evaluations_html=="") {
							active_evaluations_html += "<a class=\"q_m_eval_a_fill\" style=\"background-image:url(img/q_m_eval_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
						}
						if (inactive_evaluations_html=="") {
							inactive_evaluations_html += "<a class=\"q_m_eval_i_fill\" style=\"background-image:url(img/q_m_eval_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
						}
						%>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/form.jsp?dbid=&name=&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="q_m_eval_fill" style="background-image:url(img/q_m_eval_bg.gif)">
							<div class="level3_but" style="background-image:url(img/q_m_eval_add.gif)">&#60;<%=pageData.getWord("Add a form ")%>&#62;</div>
						</a>
							
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_eval_a_fill" style="background-image:url(img/q_m_eval_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_a')">
							<div id="q_m_eval_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/q_m_eval_a_closed.gif)"><b><%=pageData.getWord("Active forms")%></b></div>
						</a>
							
						<div id="q_m_eval_a<%=current_tenant_dbid%>_menu" style="display:none">
							<%=active_evaluations_html%>
							<div class="menuspacer" style="background-image:url(img/q_m_eval_bg.gif)"></div>
						</div>
							
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_eval_i_fill" style="background-image:url(img/q_m_eval_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_i')">
							<div id="q_m_eval_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/q_m_eval_i_closed.gif)"><b><%=pageData.getWord("Inactive forms")%></b></div>
						</a>
					
						<div id="q_m_eval_i<%=current_tenant_dbid%>_menu" style="display:none">
							<%=inactive_evaluations_html%>
							<div class="menuspacer" style="background-image:url(img/q_m_eval_bg.gif)"></div>
						</div>
							
							
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_eval_ans_fill" style="background-image:url(img/q_m_eval_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_ans')">
							<div id="q_m_eval_ans<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/q_m_eval_ans_closed.gif)"><b><%=pageData.getWord("Answers list")%></b></div>
						</a>
					
						<div id="q_m_eval_ans<%=current_tenant_dbid%>_menu" style="display:none">
					        
					        <% 
								String active_answers_html  	= "";
								String inactive_answers_html  	= "";
							for( int i = 0 ; i < answersDataResult.size(); i++ )
							{			
							
								String obj_state 	 = (String)answersDataResult.elementAt(i).get("state");
								if( obj_state.compareTo("1") == 0 ){
									active_answers_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/answer.jsp?dbid="+answersDataResult.elementAt(i).get("dbid")+"&name="+answersDataResult.elementAt(i).get("name")+"&tenant_dbid="+answersDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"q_m_eval_ans_a_fill\" style=\"background-image:url(img/q_m_eval_ans_a_bg.gif)\"><div class=\"level5_but\" style=\"background-image:url(img/q_m_eval_ans_a_but.gif)\" id=\"q_m_eval_ans"+current_tenant_dbid+answersDataResult.elementAt(i).get("name")+"\">"+answersDataResult.elementAt(i).get("name")+"</div></a>";
								}
								else{
									inactive_answers_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/answer.jsp?dbid="+answersDataResult.elementAt(i).get("dbid")+"&name="+answersDataResult.elementAt(i).get("name")+"&tenant_dbid="+answersDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"q_m_eval_ans_i_fill\" style=\"background-image:url(img/q_m_eval_ans_i_bg.gif)\"><div class=\"level5_but\" style=\"background-image:url(img/q_m_eval_ans_i_but.gif)\" id=\"q_m_eval_ans"+current_tenant_dbid+answersDataResult.elementAt(i).get("name")+"\">"+answersDataResult.elementAt(i).get("name")+"</div></a>";
								}
							}
							if (active_answers_html=="") {
								active_answers_html += "<a class=\"q_m_eval_ans_a_fill\" style=\"background-image:url(img/q_m_eval_ans_a_bg.gif)\"><div class=\"level5_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							if (inactive_answers_html=="") {
								inactive_answers_html += "<a class=\"q_m_eval_ans_i_fill\" style=\"background-image:url(img/q_m_eval_ans_i_bg.gif)\"><div class=\"level5_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							%>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/answer.jsp?dbid=&name=&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="q_m_eval_ans_fill" style="background-image:url(img/q_m_eval_ans_bg.gif)">
								<div class="level4_but" style="background-image:url(img/q_m_eval_ans_add.gif)">&#60;<%=pageData.getWord("Add answers list")%>&#62;</div>
							</a>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_eval_ans_a_fill" style="background-image:url(img/q_m_eval_ans_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_ans_a')">
								<div id="q_m_eval_ans_a<%=current_tenant_dbid%>" class="level4" style="background-image:url(img/q_m_eval_ans_a_closed.gif)"><b><%=pageData.getWord("Active answers list")%></b></div>
							</a>
							
							<div id="q_m_eval_ans_a<%=current_tenant_dbid%>_menu" style="display:none">
								<%=active_answers_html%>
								<div class="menuspacer" style="background-image:url(img/q_m_eval_ans_bg.gif)"></div>
							</div>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_eval_ans_i_fill" style="background-image:url(img/q_m_eval_ans_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_ans_i')">
								<div id="q_m_eval_ans_i<%=current_tenant_dbid%>" class="level4" style="background-image:url(img/q_m_eval_ans_i_closed.gif)"><b><%=pageData.getWord("Inactive answers list")%></b></div>
							</a>
						
							<div id="q_m_eval_ans_i<%=current_tenant_dbid%>_menu" style="display:none">
								<%=inactive_answers_html%>
								<div class="menuspacer" style="background-image:url(img/q_m_eval_ans_bg.gif)"></div>
							</div>
					
							<div class="menuspacer" style="background-image:url(img/q_m_eval_bg.gif)"></div>
						</div>
					
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_eval_lab_fill" style="background-image:url(img/q_m_eval_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_lab')">
							<div id="q_m_eval_lab<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/q_m_eval_lab_closed.gif)"><b><%=pageData.getWord("Labels list")%></b></div>
						</a>
					
						<div id="q_m_eval_lab<%=current_tenant_dbid%>_menu" style="display:none">
					        
					        <% 
								String active_labels_html  		= "";
								String inactive_labels_html  	= "";
							for( int i = 0 ; i < labelsDataResult.size(); i++ )
							{
							
								String obj_state 	 = (String)labelsDataResult.elementAt(i).get("state");
								if( obj_state.compareTo("1") == 0 ){
									active_labels_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/label.jsp?dbid="+labelsDataResult.elementAt(i).get("dbid")+"&name="+labelsDataResult.elementAt(i).get("name")+"&tenant_dbid="+labelsDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"q_m_eval_lab_a_fill\" style=\"background-image:url(img/q_m_eval_lab_a_bg.gif)\"><div class=\"level5_but\" style=\"background-image:url(img/q_m_eval_lab_a_but.gif)\" id=\"q_m_eval_lab"+current_tenant_dbid+labelsDataResult.elementAt(i).get("name")+"\">"+labelsDataResult.elementAt(i).get("name")+"</div></a>";
								}
								else{
									inactive_labels_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/label.jsp?dbid="+labelsDataResult.elementAt(i).get("dbid")+"&name="+labelsDataResult.elementAt(i).get("name")+"&tenant_dbid="+labelsDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"q_m_eval_lab_i_fill\" style=\"background-image:url(img/q_m_eval_lab_i_bg.gif)\"><div class=\"level5_but\" style=\"background-image:url(img/q_m_eval_lab_i_but.gif)\" id=\"q_m_eval_lab"+current_tenant_dbid+labelsDataResult.elementAt(i).get("name")+"\">"+labelsDataResult.elementAt(i).get("name")+"</div></a>";
								}
							}
							if (active_labels_html=="") {
								active_labels_html += "<a class=\"q_m_eval_lab_a_fill\" style=\"background-image:url(img/q_m_eval_lab_a_bg.gif)\"><div class=\"level5_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							if (inactive_labels_html=="") {
								inactive_labels_html += "<a class=\"q_m_eval_lab_i_fill\" style=\"background-image:url(img/q_m_eval_lab_i_bg.gif)\"><div class=\"level5_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							%>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/label.jsp?dbid=&name=&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="q_m_eval_lab_fill" style="background-image:url(img/q_m_eval_lab_bg.gif)">
								<div class="level4_but" style="background-image:url(img/q_m_eval_lab_add.gif)">&#60;<%=pageData.getWord("Add labels list")%>&#62;</div>
							</a>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_eval_lab_a_fill" style="background-image:url(img/q_m_eval_lab_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_lab_a')">
								<div id="q_m_eval_lab_a<%=current_tenant_dbid%>" class="level4" style="background-image:url(img/q_m_eval_lab_a_closed.gif)"><b><%=pageData.getWord("Active labels list")%></b></div>
							</a>
							
							<div id="q_m_eval_lab_a<%=current_tenant_dbid%>_menu" style="display:none">
								<%=active_labels_html%>
								<div class="menuspacer" style="background-image:url(img/q_m_eval_lab_bg.gif)"></div>
							</div>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="q_m_eval_lab_i_fill" style="background-image:url(img/q_m_eval_lab_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_lab_i')">
								<div id="q_m_eval_lab_i<%=current_tenant_dbid%>" class="level4" style="background-image:url(img/q_m_eval_lab_i_closed.gif)"><b><%=pageData.getWord("Inactive labels list")%></b></div>
							</a>
						
							<div id="q_m_eval_lab_i<%=current_tenant_dbid%>_menu" style="display:none">
								<%=inactive_labels_html%>
								<div class="menuspacer" style="background-image:url(img/q_m_eval_lab_bg.gif)"></div>
							</div>
					
							<div class="menuspacer" style="background-image:url(img/q_m_eval_bg.gif)"></div>
						</div>
					
						<div class="menuspacer" style="background-image:url(img/q_m_bg.gif)"></div>
					</div>
                    			
            <%				
//				}catch(Exception e){e.printStackTrace();}//Fin de if Right("ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT")      			
                   }	%>  		
				<div class="menuspacer" style="background-image:url(img/ten_bg.gif)"></div>
			</div>
						
			
				
				
				
				
				
				
			<%	
			} //Fin de if(RIGHTS["TENANT_QUALITY_MONITORING"])
			 //<!-- end ALLOW_QUALITY_MONITORING_MANAGEMENT --> 
			 //<!-- ALLOW_WORK_FORCE_MANAGEMENT --> 
			
			if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_WORK_FORCE_MANAGEMENT"))
			{
					String team_management_html  	= "";
					for( int i = 0 ; i <teammanagementDataResult.size(); i++ )
					{						
						String obj_tenant_id = (String)teammanagementDataResult.elementAt(i).get("tenant_dbid");
											
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{	
							team_management_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/wfmTeam1.jsp?team="+teammanagementDataResult.elementAt(i).get("dbid")+"^"+ teammanagementDataResult.elementAt(i).get("team_name")+"^"+teammanagementDataResult.elementAt(i).get("team_leader") +"&tenant_dbid="+teammanagementDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"team_fill\" style=\"background-image:url(img/team_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/team_but.gif)\" id=\"team"+current_tenant_dbid+teammanagementDataResult.elementAt(i).get("team_name")+"\">"+teammanagementDataResult.elementAt(i).get("team_name")+"</div></a>";
						}
					}%>
					
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="w_f_man_fill" style="background-image:url(img/ten_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'w_f_man')">
					<div id="w_f_man<%=current_tenant_dbid%>" class="level1" style="background-image:url(img/w_f_man_closed.gif)"><b><%=pageData.getWord("Work Force Management")%></b></div>
				</a>
				
				<div id="w_f_man<%=current_tenant_dbid%>_menu" style="display:none">
<% //Teams %>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="team_fill" style="background-image:url(img/w_f_man_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'team')">
						<div id="team<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/team_closed.gif)"><b><%=pageData.getWord("Teams")%> </b></div>
					</a>
		
					<div id="team<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/wfmTeam1.jsp?team=&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="team_fill" style="background-image:url(img/team_bg.gif)">
							<div class="level3_but" style="background-image:url(img/team_add.gif)">&#60;<%=pageData.getWord("Add a team")%>&#62;</div>
						</a>
						<%=team_management_html%>	
                        	<div class="menuspacer" style="background-image:url(img/w_f_man_bg.gif)"></div>
					</div>
					
<% //Schedule %>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="sched_fill" style="background-image:url(img/w_f_man_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'sched')">
						<div id="sched<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/sched_closed.gif)"><b><%=pageData.getWord("Schedule")%></b></div>
					</a>
					<div id="sched<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/LoadHoraire.jsp?tenant_dbid=<%=current_tenant_dbid %>&tenantName=<%=current_tenant_name%>" target="rbottom" class="sched_fill" style="background-image:url(img/sched_bg.gif)"><div class="level3_but" style="background-image:url(img/sched_but.gif)"><%=pageData.getWord("Import schedule")%></div></a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/horaires1.jsp?tenant_dbid=<%=current_tenant_dbid%>&complete=no" target="rbottom" class="sched_fill" style="background-image:url(img/sched_bg.gif)"><div class="level3_but" style="background-image:url(img/sched_but.gif)"><%=pageData.getWord("Assign schedule")%></div></a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/horaires1.jsp?tenant_dbid=<%=current_tenant_dbid %>&complete=yes" target="rbottom" class="sched_fill" style="background-image:url(img/sched_bg.gif)"><div class="level3_but" style="background-image:url(img/sched_but.gif)"><%=pageData.getWord("Review published schedule")%></div></a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/horaires1.jsp?tenant_dbid=<%=current_tenant_dbid%>&report=yes" target="rbottom" class="sched_fill" style="background-image:url(img/sched_bg.gif)"><div class="level3_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Scheduled agents' report")%></div></a>
                        <div class="menuspacer" style="background-image:url(img/w_f_man_bg.gif)"></div>
					</div>
					
<% //adherence %>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="adher_fill" style="background-image:url(img/w_f_man_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'adher')">
						<div id="adher<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/adher_closed.gif)"><b><%=pageData.getWord("adherence")%></b></div>
					</a>
					<div id="adher<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/rta1.jsp?type=AgentGroupsRTA&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="adher_fill" style="background-image:url(img/adher_bg.gif)"><div class="level3_but" style="background-image:url(img/adher_but.gif)"><%=pageData.getWord("Real Time Adherence")%></div></a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/rta1.jsp?type=Agents&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="adher_fill" style="background-image:url(img/adher_bg.gif)"><div class="level3_but" style="background-image:url(img/adher_but.gif)"><%=pageData.getWord("View Adherence Graph")%></div></a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/adherenceReport1.jsp?type=AgentAdherenceReport&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="adher_fill" style="background-image:url(img/adher_bg.gif)"><div class="level3_but" style="background-image:url(img/rep_but.gif)"><%=pageData.getWord("Adherence Report")%></div></a>
                        	<div class="menuspacer" style="background-image:url(img/w_f_man_bg.gif)"></div>
					</div>
                    	<div class="menuspacer" style="background-image:url(img/ten_bg.gif)"></div>
				</div>
				
	<%
// end ALLOW_WORK_FORCE_MANAGEMENT
// ALLOW_FINANCIAL_CONFIGURATION || ALLOW_FINANCIAL_REPORTS

			} //Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_WORK_FORCE_MANAGEMENT"))

			
			if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_CONFIGURATION") ||
			   pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_REPORTS") )
			{
				
				String current_activities_html  	= "";
				String active_commission_html  		= "";
				String inactive_commission_html  	= "";
				
				for( int i = 0 ; i < currentactivitiesDataResult.size(); i++ )
				{
					String obj_tenant_id = (String)currentactivitiesDataResult.elementAt(i).get("tenant_dbid");
					if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
					{
						current_activities_html +=	"<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/Activity1.jsp?activity_dbid="+currentactivitiesDataResult.elementAt(i).get("dbid")+"&activity_name="+currentactivitiesDataResult.elementAt(i).get("activity_name")+"&tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"f_i_act_cur_fill\" style=\"background-image:url(img/f_i_act_cur_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/f_i_act_cur_but.gif)\" id=\"f_i_act_cur"+current_tenant_dbid+currentactivitiesDataResult.elementAt(i).get("activity_name")+"\">"+currentactivitiesDataResult.elementAt(i).get("activity_name")+"</div></a>";
					}
				}
				if (current_activities_html=="") {
								current_activities_html += "<a class=\"f_i_act_cur_fill\" style=\"background-image:url(img/f_i_act_cur_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_1_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
				%>
				
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="f_i_fill" style="background-image:url(img/ten_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i')">
					<div id="f_i<%=current_tenant_dbid%>" class="level1" style="background-image:url(img/f_i_closed.gif)"><b><%=pageData.getWord("Financial information")%></b></div>
				</a>
	
				<div id="f_i<%=current_tenant_dbid%>_menu" style="display:none">
					<%
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_CONFIGURATION"))
					{
						//ALLOW_FINANCIAL_CONFIGURATION
					%>
					 
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="f_i_act_fill" style="background-image:url(img/f_i_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_act')">
						<div id="f_i_act<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/f_i_act_closed.gif)"><b><%=pageData.getWord("Activity")%></b></div>
					</a>
					
					<div id="f_i_act<%=current_tenant_dbid%>_menu" style="display:none">
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/Activity1.jsp?tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="f_i_act_fill" style="background-image:url(img/f_i_act_bg.gif)">
							<div class="level3_but" style="background-image:url(img/f_i_act_add.gif)">&#60;<%=pageData.getWord("Add an activity")%>&#62;</div>
						</a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="f_i_act_cur_fill" style="background-image:url(img/f_i_act_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_act_cur')">
							<div id="f_i_act_cur<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/f_i_act_cur_closed.gif)"><b><%=pageData.getWord("Current activities")%></b></div>
						</a>
					
						<div id="f_i_act_cur<%=current_tenant_dbid%>_menu" style="display:none">
							<%=current_activities_html%>
                            <div class="menuspacer" style="background-image:url(img/f_i_act_bg.gif)"></div>
						</div>
                        <div class="menuspacer" style="background-image:url(img/f_i_bg.gif)"></div>
					</div>
					
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="f_i_conf_fill" style="background-image:url(img/f_i_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_conf')">
						<div id="f_i_conf<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/f_i_conf_closed.gif)"><b><%=pageData.getWord("Configuration")%></b></div>
					</a>
		
					<div id="f_i_conf<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/generalConfigDemo1.jsp?tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="f_i_conf_fill" style="background-image:url(img/f_i_conf_bg.gif)">
							<div class="level3_but" style="background-image:url(img/f_i_conf_but.gif)"><%=pageData.getWord("Payroll configuration")%></div>
						</a>
                        <div class="menuspacer" style="background-image:url(img/f_i_bg.gif)"></div>
					</div>

					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="f_i_com_fill" style="background-image:url(img/f_i_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_com')">
						<div id="f_i_com<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/f_i_com_closed.gif)"><b><%=pageData.getWord("Commissions")%></b></div>
					</a>
					<div id="f_i_com<%=current_tenant_dbid%>_menu" style="display:none">
									
						<% 
							for( int i = 0 ; i < commissionsDataResult.size(); i++ )
							{							
								String obj_state 	 = (String)commissionsDataResult.elementAt(i).get("status");
								if( obj_state.compareTo("1") == 0 ){
									active_commission_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/mopTreatment1.jsp?mop_treatment_dbid="+commissionsDataResult.elementAt(i).get("dbid")+"&mop_treatment_name="+commissionsDataResult.elementAt(i).get("name")+"&tenant_dbid="+commissionsDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"f_i_com_a_fill\" style=\"background-image:url(img/f_i_com_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/f_i_com_a_but.gif)\" id=\"f_i_com"+current_tenant_dbid+commissionsDataResult.elementAt(i).get("name")+"\">"+commissionsDataResult.elementAt(i).get("name")+"</div></a>";
								}
								else{
									inactive_commission_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/mopTreatment1.jsp?mop_treatment_dbid="+commissionsDataResult.elementAt(i).get("dbid")+"&mop_treatment_name="+commissionsDataResult.elementAt(i).get("name")+"&tenant_dbid="+commissionsDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"f_i_com_i_fill\" style=\"background-image:url(img/f_i_com_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/f_i_com_i_but.gif)\" id=\"f_i_com"+current_tenant_dbid+commissionsDataResult.elementAt(i).get("name")+"\">"+commissionsDataResult.elementAt(i).get("name")+"</div></a>";
								}
							}
							if (active_commission_html=="") {
								active_commission_html += "<a class=\"f_i_com_a_fill\" style=\"background-image:url(img/f_i_com_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							if (inactive_commission_html=="") {
								inactive_commission_html += "<a class=\"f_i_com_i_fill\" style=\"background-image:url(img/f_i_com_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
							}
							%>
						
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/mopTreatment1.jsp?mop_treatment_dbid=&mop_treatment_name=&tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="f_i_com_fill" style="background-image:url(img/f_i_com_bg.gif)">
								<div class="level3_but" style="background-image:url(img/f_i_com_add.gif)">&#60;<%=pageData.getWord("Add commission")%>&#62;</div>
							</a>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="f_i_com_a_fill" style="background-image:url(img/f_i_com_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_com_a')">
								<div id="f_i_com_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/f_i_com_a_closed.gif)"><b><%=pageData.getWord("Active commissions")%></b></div>
							</a>
							
							<div id="f_i_com_a<%=current_tenant_dbid%>_menu" style="display:none">
								<%=active_commission_html%>
                                <div class="menuspacer" style="background-image:url(img/f_i_com_bg.gif)"></div>
							</div>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="f_i_com_i_fill" style="background-image:url(img/f_i_com_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_com_i')">
								<div id="f_i_com_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/f_i_com_i_closed.gif)"><b><%=pageData.getWord("Inactive commissions")%></b></div>
							</a>
							<div id="f_i_com_i<%=current_tenant_dbid%>_menu" style="display:none">
								<%=inactive_commission_html%>
                                <div class="menuspacer" style="background-image:url(img/f_i_com_bg.gif)"></div>
							</div>
							
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/cmp_commission_creator.jsp" target="rbottom" class="f_i_com_fill" style="background-image:url(img/f_i_com_bg.gif)">
								<div class="level3_but" style="background-image:url(img/f_i_com_but.gif)"><%=pageData.getWord("Create Commission V2")%></div>
							</a>
							<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/cmp_commission_condition.jsp" target="rbottom" class="f_i_com_fill" style="background-image:url(img/f_i_com_bg.gif)">
								<div class="level3_but" style="background-image:url(img/f_i_com_but.gif)"><%=pageData.getWord("Create commissions V2 conditions")%></div>
							</a>
                            <div class="menuspacer" style="background-image:url(img/f_i_bg.gif)"></div>					
					</div>
					
					
					<%
					// Methods of Payments
								
					String active_mops_html  		= "";
					String inactive_mops_html  		= "";
					
					for( int i = 0 ; i <mopsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)mopsDataResult.elementAt(i).get("tenant_dbid");
						String obj_state 	 = (String)mopsDataResult.elementAt(i).get("status");
							
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{
							if( obj_state.compareTo("1") == 0 ){
								active_mops_html +="<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/mop1.jsp?mopDBID="+mopsDataResult.elementAt(i).get("dbid")+"&mopName="+mopsDataResult.elementAt(i).get("mop_name")+"&tenant_dbid="+mopsDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"mop_a_fill\" style=\"background-image:url(img/mop_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/mop_a_but.gif)\" id=\"mop"+current_tenant_dbid+mopsDataResult.elementAt(i).get("mop_name")+"\">"+mopsDataResult.elementAt(i).get("mop_name")+"</div></a>";
							}
							else{
								inactive_mops_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/mop1.jsp?mopDBID="+mopsDataResult.elementAt(i).get("dbid")+"&mopName="+mopsDataResult.elementAt(i).get("mop_name")+"&tenant_dbid="+mopsDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"mop_i_fill\" style=\"background-image:url(img/mop_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/mop_i_but.gif)\" id=\"mop"+current_tenant_dbid+mopsDataResult.elementAt(i).get("mop_name")+"\">"+mopsDataResult.elementAt(i).get("mop_name")+"</div></a>";
							}
						}
					}
					if (active_mops_html=="") {
						active_mops_html +="<a class=\"mop_a_fill\" style=\"background-image:url(img/mop_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					if (inactive_mops_html=="") {
						inactive_mops_html += "<a class=\"mop_i_fill\" style=\"background-image:url(img/mop_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
					}
					%>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="mop_fill" style="background-image:url(img/f_i_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'mop')">
						<div id="mop<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/mop_closed.gif)"><b><%=pageData.getWord("Methods Of Payment")%></b></div>
					</a>
					<div id="mop<%=current_tenant_dbid%>_menu" style="display:none">
			
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/mop1.jsp?tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="mop_fill" style="background-image:url(img/mop_bg.gif)">
							<div class="level3_but" style="background-image:url(img/mop_add.gif)">&#60;<%=pageData.getWord("Add Method of Payment")%>&#62;</div>
						</a>
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="mop_a_fill" style="background-image:url(img/mop_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'mop_a')">
							<div id="mop_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/mop_a_closed.gif)"><b><%=pageData.getWord("Active MOPs")%></b></div>
						</a>
						<div id="mop_a<%=current_tenant_dbid%>_menu" style="display:none">
							<%=active_mops_html%>
                            <div class="menuspacer" style="background-image:url(img/mop_bg.gif)"></div>
						</div>
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="mop_i_fill" style="background-image:url(img/mop_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'mop_i')">
							<div id="mop_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/mop_i_closed.gif)"><b><%=pageData.getWord("Inactive MOPs")%></b></div>
						</a>
						<div id="mop_i<%=current_tenant_dbid%>_menu" style="display:none">
							<%=inactive_mops_html%>
                            <div class="menuspacer" style="background-image:url(img/mop_bg.gif)"></div>
						</div>
                        <div class="menuspacer" style="background-image:url(img/f_i_bg.gif)"></div>
					</div>
					
					<!-- Dispo -->	
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="dispo_fill" style="background-image:url(img/f_i_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'dispo')">
						<div id="dispo<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/dispo_closed.gif)"><b>Dispo</b></div>
					</a>
					<div id="dispo<%=current_tenant_dbid%>_menu" style="display:none">
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/dispo_creator.jsp" target="rbottom" class="dispo_fill" style="background-image:url(img/dispo_bg.gif)">
							<div class="level3_but" style="background-image:url(img/dispo_but.gif)"><%=pageData.getWord("Dispo Creator")%></div>
						</a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/dispo_options_creator.jsp" target="rbottom" class="dispo_fill" style="background-image:url(img/dispo_bg.gif)">
							<div class="level3_but" style="background-image:url(img/dispo_but.gif)"><%=pageData.getWord("Dispo Options Creator")%></div>
						</a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/dispo_cmp_assoc.jsp" target="rbottom" class="dispo_fill" style="background-image:url(img/dispo_bg.gif)">
							<div class="level3_but" style="background-image:url(img/dispo_but.gif)"><%=pageData.getWord("Dispo-Cmp association")%></div>
						</a>
                        <div class="menuspacer" style="background-image:url(img/f_i_bg.gif)"></div>
					</div>

<% //<!-- end ALLOW_FINANCIAL_CONFIGURATION --> 

					
				}
					
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_REPORTS"))
				{
				%>
				<!-- Add an a line to add the possibility to add  -->
				
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="rep_fill" style="background-image:url(img/f_i_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'rep')">
					<div id="rep<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/rep_closed.gif)"><b><%=pageData.getWord("Reports")%></b></div>
				</a>
				<div id="rep<%=current_tenant_dbid%>_menu" style="display:none">
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/loginvsProduction.jsp?type=report&sessionParams=init&viewData=&saveAddedRows=&startDate=&agentGroupId=&agentId=&tenant_dbid=<%=current_tenant_dbid%>&strToInsert=&strToUpdate=" target="rbottom" class="rep_fill" style="background-image:url(img/rep_bg.gif)">
						<div class="level3_but" style="background-image:url(img/f_i_rep_but.gif)"><%=pageData.getWord("Agent Hours report")%></div>
					</a>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./jsp/extractPayrollData.jsp" target="rbottom" class="rep_fill" style="background-image:url(img/rep_bg.gif)">
						<div class="level3_but" style="background-image:url(img/f_i_rep_but.gif)"><%=pageData.getWord("Extract payroll data")%></div>
					</a>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./jsp/commissionReport.jsp?viewData=&tenant_dbid=<%=current_tenant_dbid%>&fromDate=&toDate=&reqType=&objId=" target="rbottom" class="rep_fill" style="background-image:url(img/rep_bg.gif)">
						<div class="level3_but" style="background-image:url(img/f_i_rep_but.gif)"><%=pageData.getWord("Commission details")%></div>
					</a>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/cmp_commission_report.jsp" target="rbottom" class="rep_fill" style="background-image:url(img/rep_bg.gif)">
						<div class="level3_but" style="background-image:url(img/f_i_rep_but.gif)"><%=pageData.getWord("Commission V2 Report")%></div>
					</a>
                    <div class="menuspacer" style="background-image:url(img/f_i_bg.gif)"></div>
				</div>
					
				<% }
					// <!-- end ALLOW_FINANCIAL_CONFIGURATION || ALLOW_FINANCIAL_REPORTS --> 
					// <!-- ALLOW_MESSAGE_CENTER_MANAGEMENT -->
					out.write("<div class=\"menuspacer\" style=\"background-image:url(img/ten_bg.gif)\"></div>");
				out.write("</div>");
			}
		/***************************************************************
		message center jsp
		***************************************************************/
		if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_MESSAGE_CENTER_MANAGEMENT"))
		{
			String active_alertStarPhone_html ="";
			String inactive_alertStarPhone_html ="";
			String active_alertManager_html ="";
			String inactive_alertManager_html ="";
			
			String active_statisticStarPhone_html ="";
			String inactive_statisticStarPhone_html ="";
			
			//for the starPhone alerts
			for( int i = 0 ; i < alertStarPhoneDataResult.size(); i++ )
			{
				String obj_state =(String)alertStarPhoneDataResult.elementAt(i).get("state");
				if( obj_state.compareTo("1") == 0 ){
					active_alertStarPhone_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/McAlert.jsp?dbid=" + alertStarPhoneDataResult.elementAt(i).get("dbid")+"&tenant_dbid="+alertStarPhoneDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"alert_a_fill\" style=\"background-image:url(img/alert_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/alert_a_but.gif)\" id=\"alert"+current_tenant_dbid+alertStarPhoneDataResult.elementAt(i).get("name")+"\">"+alertStarPhoneDataResult.elementAt(i).get("name")+"</div></a>";
				}
				else{
					inactive_alertStarPhone_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/McAlert.jsp?dbid="+alertStarPhoneDataResult.elementAt(i).get("dbid")+"&tenant_dbid="+alertStarPhoneDataResult.elementAt(i).get("tenant_dbid")+"\" target=\"rbottom\" class=\"alert_i_fill\" style=\"background-image:url(img/alert_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/alert_i_but.gif)\" id=\"alert"+current_tenant_dbid+alertStarPhoneDataResult.elementAt(i).get("name")+"\">"+alertStarPhoneDataResult.elementAt(i).get("name")+"</div></a>";
				}
					
			}
			if (active_alertStarPhone_html=="") {
				active_alertStarPhone_html += "<a class=\"alert_a_fill\" style=\"background-image:url(img/alert_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
			}
			if (inactive_alertStarPhone_html=="") {
				inactive_alertStarPhone_html += "<a class=\"alert_i_fill\" style=\"background-image:url(img/alert_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
			}
			
			
			//for the starPhone statistics
			for( int i = 0 ; i < statisticStarPhoneDataResult.size(); i++ )
			{
				String obj_state =(String)statisticStarPhoneDataResult.elementAt(i).get("state");
				
				if( obj_state.compareTo("1") == 0 ){
					active_statisticStarPhone_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/McStatistics.jsp?tenant_dbid="+statisticStarPhoneDataResult.elementAt(i).get("tenant_dbid")+"&dbid=" + statisticStarPhoneDataResult.elementAt(i).get("dbid") + "\" target=\"rbottom\" class=\"stat_a_fill\" style=\"background-image:url(img/stat_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/stat_a_but.gif)\" id=\"stat"+current_tenant_dbid+statisticStarPhoneDataResult.elementAt(i).get("name")+"\">"+statisticStarPhoneDataResult.elementAt(i).get("name")+"</div></a>";
				}
				else{
					inactive_statisticStarPhone_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/McStatistics.jsp?tenant_dbid="+statisticStarPhoneDataResult.elementAt(i).get("tenant_dbid")+"&dbid=" + statisticStarPhoneDataResult.elementAt(i).get("dbid") + "\" target=\"rbottom\" class=\"stat_i_fill\" style=\"background-image:url(img/stat_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/stat_i_but.gif)\" id=\"stat"+current_tenant_dbid+statisticStarPhoneDataResult.elementAt(i).get("name")+"\">"+statisticStarPhoneDataResult.elementAt(i).get("name")+"</div></a>";
				}
			}
			if (active_statisticStarPhone_html=="") {
				active_statisticStarPhone_html += "<a class=\"stat_a_fill\" style=\"background-image:url(img/stat_a_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
			}
			if (inactive_statisticStarPhone_html=="") {
				inactive_statisticStarPhone_html += "<a class=\"stat_i_fill\" style=\"background-image:url(img/stat_i_bg.gif)\"><div class=\"level4_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
			}
			%>
			
			<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="m_c_fill" style="background-image:url(img/ten_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'm_c')">
				<div id="m_c<%=current_tenant_dbid%>" class="level1" style="background-image:url(img/m_c_closed.gif)"><b><%=pageData.getWord("Message center")%></b></div>
			</a>
			<div id="m_c<%=current_tenant_dbid%>_menu" style="display:none">
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="stat_fill" style="background-image:url(img/m_c_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'stat')">
					<div id="stat<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/stat_closed.gif)"><b><%=pageData.getWord("Statistics")%></b></div>
				</a>
				
				<div id="stat<%=current_tenant_dbid%>_menu" style="display:none">
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/McStatistics.jsp?tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="stat_fill" style="background-image:url(img/stat_bg.gif)">
						<div class="level3_but" style="background-image:url(img/stat_add.gif)">&#60;<%=pageData.getWord("Add statistic")%>&#62;</div>
					</a>
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="stat_a_fill" style="background-image:url(img/stat_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'stat_a')">
						<div id="stat_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/stat_a_closed.gif)"><b><%=pageData.getWord("Active statistics")%></b></div>
					</a>
					<div id="stat_a<%=current_tenant_dbid%>_menu" style="display:none">
						<%=active_statisticStarPhone_html%>	
                        <div class="menuspacer" style="background-image:url(img/stat_bg.gif)"></div>
					</div>
					
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="stat_i_fill" style="background-image:url(img/stat_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'stat_i')">
						<div id="stat_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/stat_i_closed.gif)"><b><%=pageData.getWord("Inactive statistics")%></b></div>
					</a>
			
					<div id="stat_i<%=current_tenant_dbid%>_menu" style="display:none">
						<%=inactive_statisticStarPhone_html%>
                        <div class="menuspacer" style="background-image:url(img/alert_bg.gif)"></div>
					</div>
                    <div class="menuspacer" style="background-image:url(img/m_c_bg.gif)"></div>
				</div>
				
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="alert_fill" style="background-image:url(img/m_c_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'alert')">
					<div id="alert<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/alert_closed.gif)"><b>Alerts</b></div>
				</a>
				<div id="alert<%=current_tenant_dbid%>_menu" style="display:none">
					<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/McAlert.jsp?tenant_dbid=<%=current_tenant_dbid%>" target="rbottom" class="alert_fill" style="background-image:url(img/alert_bg.gif)">
						<div class="level3_but" style="background-image:url(img/alert_add.gif)">&#60;<%=pageData.getWord("Add alert")%>&#62;</div>
					</a>
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="alert_a_fill" style="background-image:url(img/alert_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'alert_a')">
							<div id="alert_a<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/alert_a_closed.gif)"><b><%=pageData.getWord("Active alerts")%></b></div>
						</a>
						<div id="alert_a<%=current_tenant_dbid%>_menu" style="display:none">
							<%=active_alertStarPhone_html%>	
                            <div class="menuspacer" style="background-image:url(img/alert_bg.gif)"></div>		
						</div>	
						
						<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="alert_i_fill" style="background-image:url(img/alert_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'alert_i')">
							<div id="alert_i<%=current_tenant_dbid%>" class="level3" style="background-image:url(img/alert_i_closed.gif)"><b><%=pageData.getWord("Inactive alerts")%></b></div>
						</a>
						<div id="alert_i<%=current_tenant_dbid%>_menu" style="display:none">
							<%=inactive_alertStarPhone_html%>
                            <div class="menuspacer" style="background-image:url(img/alert_bg.gif)"></div>
						</div>
                        <div class="menuspacer" style="background-image:url(img/m_c_bg.gif)"></div>
				</div>
                <div class="menuspacer" style="background-image:url(img/ten_bg.gif)"></div>
		</div>
<%  //<!-- end ALLOW_MESSAGE_CENTER_MANAGEMENT --> 
  //<!-- ALLOW_ROUTING_SCRIPT_MANAGEMENT --> 
	
					
		} //Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_MESSAGE_CENTER_MANAGEMENT"))
		/***************************************************************
		fin message center jsp
		***************************************************************/
		
		if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT"))
		{
				String active_routing_scripts_html  		= "";
				String inactive_routing_scripts_html  		= "";
				for( int i = 0 ; i < routingscriptsDataResult.size(); i++ )
				{
					String obj_tenant_id = (String)routingscriptsDataResult.elementAt(i).get("tenant_dbid");
					String obj_state 	 = (String)routingscriptsDataResult.elementAt(i).get("status");
					if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
					{	
						if( obj_state.compareTo("1") == 0 ){
							active_routing_scripts_html   += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/routingScript.jsp?tenant_dbid="+routingscriptsDataResult.elementAt(i).get("tenant_dbid")+"&tenantName="+routingscriptsDataResult.elementAt(i).get("tenant_name")+"&script_dbid="+routingscriptsDataResult.elementAt(i).get("dbid")+"&script_name="+routingscriptsDataResult.elementAt(i).get("script_name")+"&script_is_active="+routingscriptsDataResult.elementAt(i).get("status")+"&script_priority="+routingscriptsDataResult.elementAt(i).get("priority")+"\" target=\"rbottom\" class=\"rout_a_fill\" style=\"background-image:url(img/rout_a_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/rout_a_but.gif)\" id=\"rout"+current_tenant_dbid+routingscriptsDataResult.elementAt(i).get("script_name")+"\">"+routingscriptsDataResult.elementAt(i).get("script_name")+"</div></a>";
						}
						else{
							inactive_routing_scripts_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/routingScript.jsp?tenant_dbid="+routingscriptsDataResult.elementAt(i).get("tenant_dbid")+"&tenantName="+routingscriptsDataResult.elementAt(i).get("tenant_name")+"&script_dbid="+routingscriptsDataResult.elementAt(i).get("dbid")+"&script_name="+routingscriptsDataResult.elementAt(i).get("script_name")+"&script_is_active="+routingscriptsDataResult.elementAt(i).get("status")+"&script_priority="+routingscriptsDataResult.elementAt(i).get("priority")+"\" target=\"rbottom\" class=\"rout_i_fill\" style=\"background-image:url(img/rout_i_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/rout_i_but.gif)\" id=\"rout"+current_tenant_dbid+routingscriptsDataResult.elementAt(i).get("script_name")+"\">"+routingscriptsDataResult.elementAt(i).get("script_name")+"</div></a>";
						}
					}
				}
				if (active_routing_scripts_html=="") {
					active_routing_scripts_html   += "<a class=\"rout_a_fill\" style=\"background-image:url(img/rout_a_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
				}
				if (inactive_routing_scripts_html=="") {
					inactive_routing_scripts_html += "<a class=\"rout_i_fill\" style=\"background-image:url(img/rout_i_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
				}
				%>
			
		
			<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="rout_fill" style="background-image:url(img/ten_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild,  'rout')">
				<div id="rout<%=current_tenant_dbid%>" class="level1" style="background-image:url(img/rout_closed.gif)"><b><%=pageData.getWord("Routing scripts")%></b></div>
			</a>
			<div id="rout<%=current_tenant_dbid%>_menu" style="display:none">
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="./Resources_pages/routingScript.jsp?tenant_dbid=<%=current_tenant_dbid%>&tenantName=<%=current_tenant_name%>" target="rbottom" class="rout_fill" style="background-image:url(img/rout_bg.gif)">
					<div class="level2_but" style="background-image:url(img/rout_add.gif)">&#60;<%=pageData.getWord("Add Routing Script")%>&#62;</div>
				</a>
				
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="rout_a_fill" style="background-image:url(img/rout_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'rout_a')">
					<div id="rout_a<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/rout_a_closed.gif)"><b><%=pageData.getWord("Active scripts")%></b></div>
				</a>
				<div id="rout_a<%=current_tenant_dbid%>_menu" style="display:none">
					<%=active_routing_scripts_html%>
                    <div class="menuspacer" style="background-image:url(img/rout_bg.gif)"></div>
				</div>
				
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="rout_i_fill" style="background-image:url(img/rout_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'rout_i')">
					<div id="rout_i<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/rout_i_closed.gif)"><b><%=pageData.getWord("Inactive scripts")%></b></div>
				</a>
				
				<div id="rout_i<%=current_tenant_dbid%>_menu" style="display:none">
					<%=inactive_routing_scripts_html%>
                    <div class="menuspacer" style="background-image:url(img/rout_bg.gif)"></div>
				</div>
                <div class="menuspacer" style="background-image:url(img/ten_bg.gif)"></div>
			</div>

		<%}
		// END of if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT")
			
			


   // Adding POp Up ALLOW_POPUP_BUILDER
		if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_POPUP_BUILDER"))
		{
		
			String active_popup_builder_html    ="";
			String inactive_popup_builder_html  ="";
			for( int i = 0 ; i < popupbuilderDataResult.size() ; i++)
			{   
				String obj_tenant_id = (String)popupbuilderDataResult.elementAt(i).get("tenant_dbid");
				String obj_state 	 = (String)popupbuilderDataResult.elementAt(i).get("state");
				if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 || "0".equals(obj_tenant_id) )
				{	
					if( obj_state.compareTo("1") == 0 )
					{
						active_popup_builder_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" onclick=\"openBuilder()\" href=\"./Resources_pages/popup/popup.jsp?tenant_dbid=" + current_tenant_dbid + "&popdbid="+popupbuilderDataResult.elementAt(i).get("dbid")+"\" target=\"Text\" class=\"popu_a_fill\" style=\"background-image:url(img/popu_a_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/popu_a_but.gif)\" id=\"popu"+current_tenant_dbid+popupbuilderDataResult.elementAt(i).get("description")+"\">"+popupbuilderDataResult.elementAt(i).get("description")+"</div></a>";
					}
					else
					{ 
						inactive_popup_builder_html += "<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" onclick=\"openBuilder()\" href=\"./Resources_pages/popup/popup.jsp?tenant_dbid="+ current_tenant_dbid + "&popdbid="+popupbuilderDataResult.elementAt(i).get("dbid")+"\" target=\"Text\" class=\"popu_i_fill\" style=\"background-image:url(img/popu_i_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/popu_i_but.gif)\" id=\"popu"+current_tenant_dbid+popupbuilderDataResult.elementAt(i).get("description")+"\">"+popupbuilderDataResult.elementAt(i).get("description")+"</div></a>";			
					}
				}
			}
			// target set to 'Text' because 'template_outbound' (and any forms that were 'save as' using 'template_outbound' as a base) seems to be renaming the window to 'Text' when loaded into window with other name. (changed in 'active', 'inactive', 'add new' and 'function openBuilder()'.
			if (active_popup_builder_html==""){
				active_popup_builder_html += "<a class=\"popu_a_fill\" style=\"background-image:url(img/popu_a_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/empty_a_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
			}
			if (inactive_popup_builder_html==""){
				inactive_popup_builder_html += "<a class=\"popu_i_fill\" style=\"background-image:url(img/popu_i_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/empty_i_but.gif)\">&#40;"+pageData.getWord("empty")+"&#41;</div></a>";
			}
			%>
	 <a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="popu_fill" style="background-image: url(img/ten_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'popu')">
     <div id="popu<%=current_tenant_dbid%>" class="level1" style="background-image:url(img/popu_closed.gif)"><b><%=pageData.getWord("Form Builder")%></b></div>
             </a>
			<div id="popu<%=current_tenant_dbid%>_menu" style="display:none">
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" onclick="openBuilder()" href="./Resources_pages/popup/popup.jsp?tenant_dbid=<%=current_tenant_dbid%>&tenantName=<%=current_tenant_name%>" target="Text" class="popu_fill" style="background-image:url(img/popu_bg.gif)">
					<div class="level2_but" style="background-image:url(img/popu_add.gif)">&#60;<%=pageData.getWord("Add New Form")%>&#62;</div>
				</a>
				
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="popu_a_fill" style="background-image:url(img/popu_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'popu_a')">
					<div id="popu_a<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/popu_a_closed.gif)"><b><%=pageData.getWord("Active Forms")%></b></div>
				</a>
				<div id="popu_a<%=current_tenant_dbid%>_menu" style="display:none">
					  <%=active_popup_builder_html%>
                    <div class="menuspacer" style="background-image:url(img/popu_bg.gif)" ></div>
				</div>
				
				<a onmouseover="colorFade(this,'background','ffffff','f9dfc2',3,1)" onmouseout="colorFade(this,'background','f9dfc2','ffffff',4,1)" href="javascript:;" class="popu_i_fill" style="background-image:url(img/popu_bg.gif)" onclick="visibleTog(this.firstChild),imageTog(this.firstChild, 'popu_i')">
					<div id="popu_i<%=current_tenant_dbid%>" class="level2" style="background-image:url(img/popu_i_closed.gif)"><b><%=pageData.getWord("Inactive Forms")%></b></div>
				</a>
				
				<div id="popu_i<%=current_tenant_dbid%>_menu" style="display:none">
					<%=inactive_popup_builder_html%>
                    <div class="menuspacer" style="background-image:url(img/popu_bg.gif)"></div>
				</div>
                <div class="menuspacer" style="background-image:url(img/ten_bg.gif)"></div>
			</div>
			
		<%}
		// END of if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_POPUP_BUILDER")
			%>
			<div class="menuspacer" style="background-image:url(img/base_level_bg.gif)"></div>
		</div>

	<%
		} //Fin du for...
		%>
		<div class="menuspacer" style="background-image:url(img/base_level_bg.gif)"></div>
	<div id="menuBottomPos"></div>
	</div>
			
			
<%
	}
%>

</div>
</div>


<%
// search box - available if user has ALLOW_TENANT_VIEW privalege
if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TENANT_VIEW") )
{
%>
<div id="menuSearchBox" style="background-color:#e58025; height:; visibility:hidden;">

	<div id="SearchTitleBar" style="border-style:solid; border-width:1px; border-color:#AA473C; background-color:#AFA; padding-left:10px;" onclick="openSearch()" onmouseover="searchTitleOver()" onmouseout="searchTitleOut()">
		<span id="openArrows" style="float:right; padding-right:8px"></span>
		<font color="#8D630A"><%=pageData.getWord("search-lc")%></font>
	</div>
	
	<div id="search001" style="display:none; padding-top:4px;">
	
		<div id="serTenant" style="color:#FFFBF0; padding-left:10px; padding-bottom:4px">
			<%
				if (tenantsDataResult.size() > 1){			// if more than one tenant give drop down box to choose tenant
			%>
					<%=pageData.getWord("Tenant")%><br />
						<select name="whichTenant" style="font-size:10px;">
			<%
					for(int i = 0; i < tenantsDataResult.size(); i++)
					{
						String tenant_dbid = (String)tenantsDataResult.elementAt(i).get("dbid");
						String tenant_name = (String)tenantsDataResult.elementAt(i).get("name");
			%>
							<option value="<%=tenant_dbid%>"><%=tenant_name%></option>
			<%
					}
			%>
						</select>
			<%
				}else{										// one tenant - no drop down and set values
					String tenant_dbid = (String)tenantsDataResult.elementAt(0).get("dbid");
					String tenant_name = (String)tenantsDataResult.elementAt(0).get("name");
			%>
				<span style="border-style:solid; border-width:1px; border-color:#B66001; padding-left:4px; padding-right:4px; color:#824100"><b><%=tenant_name%></b></span><input type="hidden" name="whichTenant" value="<%=tenant_dbid%>" />
			<%
				}
			%>
		</div>
		
		<div id="serCategory" style="color:#FFFBF0; padding-left:10px;">
			<select name="whichCategory" style="font-size:10px; margin-bottom:8px;" onchange="focusCat()">
				<option value="" style="color:#A0A0A4;" selected>- <%=pageData.getWord("select a category")%> -</option>
				<%											// which options appear in the drop down list depend on the user privaleges
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_MANAGEMENT"))
					{
				%>
			    <option id="age_opt" value="age"><%=pageData.getWord("Agents")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT"))
					{
				%>
				<option id="age_gr_opt" value="age_gr"><%=pageData.getWord("Agent Groups")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))
					{
				%>
				<option id="cam_opt" value="cam"><%=pageData.getWord("Campaigns")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))
					{
				%>
				<option id="call_opt" value="call"><%=pageData.getWord("Calling Lists")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_DONOTCALL_LIST_MANAGEMENT"))
					{
				%>
				<option id="no_call_cur_opt" value="no_call_cur"><%=pageData.getWord("Do-not-call lists")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FILTER_MANAGEMENT"))
					{
				%>
				<option id="fil_opt" value="fil"><%=pageData.getWord("Filters")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TREATMENTS_MANAGEMENT"))
					{
				%>
				<option id="treat_opt" value="treat"><%=pageData.getWord("Treatments")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_NOT_READY_REASON_MANAGEMENT"))
					{
				%>
				<option id="no_ready_opt" value="no_ready"><%=pageData.getWord("Not-ready reasons")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUEUES_MANAGEMENT"))
					{
				%>
				<option id="age_qu_opt" value="age_qu"><%=pageData.getWord("Agent group queues")%></option>
				<%
					
						if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT"))
						{
				%>
				<option id="rout_qu_opt" value="rout_qu"><%=pageData.getWord("Routing script queues")%></option>
				<%
						}
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT"))
					{
				%>
				<option id="skill_opt" value="skill"><%=pageData.getWord("Skills")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT"))
					{
				%>
				<option id="q_m_eval_opt" value="q_m_eval"><%=pageData.getWord("Evaluation forms")%></option>
				<option id="q_m_eval_ans_opt" value="q_m_eval_ans"><%=pageData.getWord("Answers list")%></option>
				<option id="q_m_eval_lab_opt" value="q_m_eval_lab"><%=pageData.getWord("Labels list")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_WORK_FORCE_MANAGEMENT"))
					{
				%>
				<option id="team_opt" value="team"><%=pageData.getWord("Teams")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_MESSAGE_CENTER_MANAGEMENT"))
					{
				%>
				<option id="stat_opt" value="stat"><%=pageData.getWord("Statistics")%></option>
				<option id="alert_opt" value="alert"><%=pageData.getWord("Alerts")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT"))
					{
				%>
				<option id="rout_opt" value="rout"><%=pageData.getWord("Routing scripts")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_POPUP_BUILDER"))
					{
				%>
				<option id="popu_opt" value="popu"><%=pageData.getWord("Form Builder")%></option>
				<%
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_CONFIGURATION"))
					{
				%>
				<optgroup label="-<%=pageData.getWord("Financial information")%>:" style="color:#007FAA;">
					<option id="f_i_act_cur_opt" value="f_i_act_cur" style="color:#000000;"><%=pageData.getWord("Current activities")%></option>
					<option id="f_i_com_opt" value="f_i_com" style="color:#000000;"><%=pageData.getWord("Commissions")%></option>
					<option id="mop_opt" value="mop" style="color:#000000;"><%=pageData.getWord("Methods of payment")%></option>
				</optgroup>
				<%
					}
				%>
			</select>
		</div>
		
		<div id="serAgent" style="color:#FFFBF0; margin-left:5px; margin-right:5px; margin-bottom:4px; padding-left:5px; padding-right:5px; border-style:solid; border-width:1px; border-color:#B66001; display:none">
			<%=pageData.getWord("First name")%><br />
			<input id="searchfirst" type="text" value="" size="18" name="searchfirst" style="font-size:10px; margin-bottom:4px;" /><br />
			<%=pageData.getWord("Last name")%><br />
			<input id="searchlast" type="text" value="" size="18" name="searchlast" style="font-size:10px; margin-bottom:4px;" /><br />
			<font color="#824100">- <%=pageData.getWord("or-lc")%> -</font><br />
			<%=pageData.getWord("Agent ID")%><br />
			<input id="searchid" type="text" value="" size="12" name="searchid" style="font-size:10px; margin-bottom:4px;" />
		</div>
		
		<div id="serOther" style="color:#FFFBF0; margin-left:5px; margin-right:5px; margin-bottom:4px; padding-left:5px; padding-right:5px; border-style:solid; border-width:1px; border-color:#B66001; display:none">
			<%=pageData.getWord("Name")%><br />
			<input id="searchfullname" type="text" value="" size="20" name="searchfullname" style="font-size:10px; margin-bottom:4px;" /><br />
			<font color="#824100">- <%=pageData.getWord("or-lc")%> -</font><br />
			<%=pageData.getWord("Name includes")%><br />
			<input id="searchpartname" type="text" value="" size="20" name="searchpartname" style="font-size:10px; margin-bottom:4px;" />
		</div>
		
		<div id="serGo" style="padding-bottom:4px; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#FFF; text-align:right; padding-right:10px">
			<button id="mensearchbut" onClick="doMenuSearch()" style="cursor:pointer" disabled="true"><%=pageData.getWord("Search")%></button>
		</div>
		
		<div id="serResults" style="padding-bottom:4px; padding-top:4px; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#FFF; border-top-style:solid; border-top-width:1px; border-top-color:#B66001; text-align:center; display:none"></div>
		
		<div id="treeColapse" style="padding-top:4px; padding-bottom:2px; padding-left:10px; border-top-style:solid; border-top-width:1px; border-top-color:#B66001; color:#FFFBF0;">
			<span style="float:right; padding-right:10px; cursor:pointer;" onclick="closeAllTreeMenu()"><img src="img/menutreeclose.gif" width="14" height="13" hspace="0" vspace="0" border="0" align="middle" /></span><font color="#824100"><%=pageData.getWord("close all open menus")%></font>
		</div>
		
	</div>
	
</div>
<%
}
// end search box
%>
<!-- Fixes the IE6 & IE7 "Press SPACEBAR or ENTER to activate and use this control" - must be at the end of the file-->
<script language="JScript" type="text/jscript" src="activateActiveX.js"></script>

</body>
</html>

<% pageData.closeConnection(); %>

