<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<%
	
	beanManagerData pageData = new beanManagerData();
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
	
	//String callinglistDataQuery		= "select dbid, name, tenant_dbid, state from cfg_calling_list where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='CALLING_LIST')";
	String active_callinglistDataQuery	= "select dbid, name, tenant_dbid, state from cfg_calling_list where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='CALLING_LIST') AND cfg_calling_list.state='1' ORDER BY name";
	String inactive_callinglistDataQuery= "select dbid, name, tenant_dbid, state from cfg_calling_list where tenant_dbid in "+currentuser_assignedTenants+" AND dbid IN (SELECT ressource_dbid FROM cfg_user_authorize_ressources WHERE user_dbid='"+CURRENT_USER_DBID+"' AND ressource_type='CALLING_LIST') AND cfg_calling_list.state<>'1' ORDER BY name";
	
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
	
	

	
	long startTime = System.currentTimeMillis();
		
%>
<html>
<head>

<title>Menu</title>
<LINK href="Resources_pages/style.css" rel="stylesheet" type="text/css" />

<base target="rbottom">


</style>


<script language="JavaScript" src="Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Resources_pages/Browser.js"></script>
<script language="javascript" type="text/javascript" src="lang_browser.js"></script>
<script language="JavaScript" src="language.js"></script>
<script language="JavaScript1.2">

var head="display:''";
img1=new Image();
img1.src="img/fold.gif";
img2=new Image();
img2.src="img/open.gif";

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

if (ie4||ns6)
	document.onclick=checkcontained;
	

function refreshdiv(id, div_text)
{
	//alert("id, div_text \n" + id +" \n "+div_text);
	document.getElementById(id).outerHTML = div_text;
}

function alertj()
{
	alert("jadjdjdjd");
}
</script>

</head>

<!-- <body bgcolor="#C0C0C0" scroll="yes"> -->
<body class=multiLevelMenu_Background scroll="yes">

<%
if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CONFIGURATION_MANAGEMENT") )
{
%>
  	
	<ul id="mainfoldheader">	
	<li id="foldheaderconfig"><%=pageData.getWord("Configuration")%></li>
	<ul id="foldinglist" style="display:none; ">
	
	<%
	if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_NETWORK_CONFIGURATION") )
	{
	%>
		<li id="menuli"><a href="./Resources_pages/architecture.htm"><%=pageData.getWord("Network Configuration")%></a></li>
	<%
	}
		
	if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TENANT_MANAGEMENT") )
	{
	%>
		<li id="foldheader"><%=pageData.getWord("Tenant Management")%></li>
		<ul id="foldinglist" style="display:none">
			<li id="menuli"><a href="./Resources_pages/tenant.jsp?dbid=">&lt;<%=pageData.getWord("Add tenant")%>&gt;</a></li>
	<%
			for(int i = 0; i < tenantsDataResult.size(); i++)
			{
				String tenant_dbid = (String)tenantsDataResult.elementAt(i).get("dbid");
				String tenant_name = (String)tenantsDataResult.elementAt(i).get("name");
%>
				<li id="menuli"><a href="./Resources_pages/tenant.jsp?dbid=<%=tenant_dbid%>"><%=tenant_name%></a></li>
<%			}
	%>	
		</ul>
	<%	
	}
		

	if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_USER_MANAGEMENT") )
	{
	%>
		<li id="foldheader"><%=pageData.getWord("User Management")%></li>
		<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">
		<li id="menuli"><a href="./Resources_pages/user_management.jsp">&lt;<%=pageData.getWord("Add a user")%>&gt;</a></li>
		<li id="foldheader"><%=pageData.getWord("Active Users")%></li>
		<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">
		
		<div id="active_users">
		<%
		for(int i = 0; i < active_usersDataResult.size(); i++)
		{
				out.write("<li id=\"menuli\"><a href=\"./Resources_pages/user_management.jsp?dbid="+active_usersDataResult.elementAt(i).get("dbid")+"\">"+active_usersDataResult.elementAt(i).get("username")+"</a></li>");
		}
		%>
		</div>
		</ul>
		<li id="foldheader"><%=pageData.getWord("Inactive Users")%></li>
		<ul id="foldinglist" style="display:none; list-style-image:url('img/user_inactive.gif')">
		<div id="inactive_users">
		<%
		for(int i = 0; i < inactive_usersDataResult.size(); i++)
		{
				out.write("<li id=\"menuli\"><a href=\"./Resources_pages/user_management.jsp?dbid="+inactive_usersDataResult.elementAt(i).get("dbid")+"\">"+inactive_usersDataResult.elementAt(i).get("username")+"</a></li>");
		}
		%>
		</div>
		</ul>
		</ul>
		
	<%
	}
	%>	
	<li id="foldheader">AheevaPhone</li>
		<ul id="foldinglist" style="display:none; list-style-image:url('img/starphone.gif')">
		<li id="menuli"><a href="./Resources_pages/modifyStarPhoneSettings.htm"><%=pageData.getWord("SoftPhone configuration")%></a></li>
	</ul>
	
	</ul>
	
	<li id="foldheader"><%=pageData.getWord("User preferences")%></li>
		<ul id="foldinglist" style="display:none; list-style-image:url('img/homme.gif')">
		<li id="menuli"><a href="./Resources_pages/userLiveStatsPreferences.jsp"><%=pageData.getWord("User live statistics preferences")%></a></li>
	</ul>
	</li>
	
	</ul>
	
	
	
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
		%>
			

			<ul id="mainfoldheader">
			<li id="foldheader"><%=current_tenant_name%></li>
			<ul id="foldinglist" style="display:none">
			
			
			
			
		<%
			if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_RESSOURCES_MANAGEMENT"))
			{
			%>
				<li id="foldheader"><%=pageData.getWord("Resources")%></li>
				<ul id="foldinglist" style="display:none">
				<%
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_MANAGEMENT"))
				{
					String active_agents_html 	= "";
					String inactive_agents_html = "";					
					%>
					
						<li id="foldheader"><%=pageData.getWord("Agents")%></li>
						<ul id="foldinglist" style="display:none; list-style-image:url('img/homme.gif')">					
						<li id="menuli">
						<%	out.write("<a href=\"./Resources_pages/agent.jsp?dbid=&agtName=&tenant_dbid="+current_tenant_dbid+"&rightSkills="+right_to_change_skills+"\">&lt;"+pageData.getWord("Add agent")+"&gt;</a>"); %>
						</li>
						<li id="foldheader"><%=pageData.getWord("Active agents")%></li>
						<ul id="foldinglist" style="display:none; list-style-image:url('img/homme.gif')">
					
					<div id="active_agents_tenant_<%=current_tenant_dbid%>">
					<%
					for( int i = 0 ; i < agentsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)agentsDataResult.elementAt(i).get("tenant_dbid");
						String obj_state 	 = (String)agentsDataResult.elementAt(i).get("state");
						String obj_dbid 	 = (String)agentsDataResult.elementAt(i).get("dbid");

						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{
							String full_name = agentsDataResult.elementAt(i).get("last_name")+","+agentsDataResult.elementAt(i).get("first_name")+"["+agentsDataResult.elementAt(i).get("login_id")+"]";
							if( obj_state.compareTo("1") == 0 )
								out.write("<li id=\"menuli\"><a href=\"./Resources_pages/agent.jsp?dbid="+obj_dbid+"&agtName="+full_name+"&tenant_dbid="+current_tenant_dbid+"&rightSkills="+right_to_change_skills+"\">"+full_name+"</a></li>");
						}
					}
					%>
					</div>										
					</ul>		
					<li id="foldheader"><%=pageData.getWord("Inactive agents")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/homme_inactive.gif')">

					<div id="inactive_agents_tenant_<%=current_tenant_dbid%>">
					<%
					for( int i = 0 ; i < agentsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)agentsDataResult.elementAt(i).get("tenant_dbid");
						String obj_state 	 = (String)agentsDataResult.elementAt(i).get("state");
                                                String obj_dbid          = (String)agentsDataResult.elementAt(i).get("dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{
							String full_name = agentsDataResult.elementAt(i).get("last_name")+","+agentsDataResult.elementAt(i).get("first_name")+"["+agentsDataResult.elementAt(i).get("login_id")+"]";
							if( obj_state.compareTo("1") != 0 )
								out.write("<li id=\"menuli\"><a href=\"./Resources_pages/agent.jsp?dbid="+obj_dbid+"&agtName="+full_name+"&tenant_dbid="+current_tenant_dbid+"&rightSkills="+right_to_change_skills+"\">"+full_name+"</a></li>");
						}
					}
					%>
					</div>					
			   		</ul>
			   		</ul>
				<%
		   		} //Fin de pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_MANAGEMENT"))

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT"))
				{
					%>
					<li id="foldheader"><%=pageData.getWord("Agent Groups")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/couple.gif')">
					<% out.write("<li id=\"menuli\"><a href=\"./Resources_pages/agentGroup.jsp?dbid=&grpName=&tenant_dbid="+current_tenant_dbid+"&recordingRight="+right_to_quality_monitoring+"\">&lt;"+pageData.getWord("Add agent group")+"&gt;</a></li>"); %>

					<li id="foldheader"><%=pageData.getWord("Active agent group")%></li>					
					<!-- Add an a line to add the possibility to add agents groups -->
					<ul id="foldinglist" style="display:none; list-style-image:url('img/couple.gif')">
					<div id="active_agents_groups_tenant_<%=current_tenant_dbid%>">
					<%
					for( int i = 0 ; i < active_agentGroupsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)active_agentGroupsDataResult.elementAt(i).get("tenant_dbid");
						String obj_dbid = (String)active_agentGroupsDataResult.elementAt(i).get("dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
							out.write("<li id=\"menuli\"><a href=\"./Resources_pages/agentGroup.jsp?dbid="+obj_dbid+"&grpName="+active_agentGroupsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"&recordingRight="+right_to_quality_monitoring+"\">"+active_agentGroupsDataResult.elementAt(i).get("name")+"</a></li>");
					}					
					%>
					</div>					
					</ul>					
					<li id="foldheader"><%=pageData.getWord("Inactive agent group")%></li>
					<!-- Add an a line to add the possibility to add agents groups -->
					<ul id="foldinglist" style="display:none; list-style-image:url('img/couple_inactive.gif')">
					<div id="inactive_agents_groups_tenant_<%=current_tenant_dbid%>">
					<%
					for( int i = 0 ; i < inactive_agentGroupsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)inactive_agentGroupsDataResult.elementAt(i).get("tenant_dbid");
						String obj_dbid = (String)inactive_agentGroupsDataResult.elementAt(i).get("dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
							out.write("<li id=\"menuli\"><a href=\"./Resources_pages/agentGroup.jsp?dbid="+obj_dbid+"&grpName="+inactive_agentGroupsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"&recordingRight="+right_to_quality_monitoring+"\">"+inactive_agentGroupsDataResult.elementAt(i).get("name")+"</a></li>");
					}					
					%>
					</div>
					</ul>					
					</ul>
				<%
				} //END OF pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT")


				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))
				{
				%>
					<li id="foldheader"><%=pageData.getWord("Campaigns")%></li>
					<ul id="foldinglist" style="display:none;  list-style-image:url('img/campaign.gif')">
					<% out.write("<li id=\"menuli\"><a href=\"./Resources_pages/campaign.jsp?dbid=&campaign_name=&tenant_dbid="+current_tenant_dbid+"\">&lt;"+pageData.getWord("Add campaigns")+"&gt;</a></li>"); %>
					<li id="foldheader"><%=pageData.getWord("Active campaigns")%></li>
					<ul id="foldinglist" style="display:none;   list-style-image:url('img/campaign_menu.gif')">
					<div id="active_campaign_tenant_<%=current_tenant_dbid%>">
					<%
					for( int i = 0 ; i < active_campaignsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)active_campaignsDataResult.elementAt(i).get("tenant_dbid");
						String obj_dbid = (String)active_campaignsDataResult.elementAt(i).get("dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
								out.write("<li id=\"menuli\"><a href=\"./Resources_pages/campaign.jsp?campaign_name="+active_campaignsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"&dbid="+obj_dbid+"\">"+active_campaignsDataResult.elementAt(i).get("name")+"</a></li>");					}					
					%>
					</div>
					</ul>
					<li id="foldheader"><%=pageData.getWord("Inactive campaigns")%></li>
					<ul id="foldinglist" style="display:none;   list-style-image:url('img/campaign_inactive.gif')">
					<div id="inactive_campaigns_tenant_<%=current_tenant_dbid%>">
					<%
					for( int i = 0 ; i < inactive_campaignsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)inactive_campaignsDataResult.elementAt(i).get("tenant_dbid");
						String obj_dbid = (String)inactive_campaignsDataResult.elementAt(i).get("dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
								out.write("<li id=\"menuli\"><a href=\"./Resources_pages/campaign.jsp?campaign_name="+inactive_campaignsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"&dbid="+obj_dbid+"\">"+inactive_campaignsDataResult.elementAt(i).get("name")+"</a></li>");
					}					
					%>
					</div>
					</ul>
					</ul>
				<%
				} // Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))

				// Calling lists
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))
				{	
				%>
				<li id="foldheader"><%=pageData.getWord("Calling lists")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/telephone.gif')">				
					<% out.write("<li id=\"menuli\"><a href=\"./Resources_pages/addCallingList.jsp?callinglistName=&tenant_dbid="+current_tenant_dbid+"\">&lt;"+pageData.getWord("Add calling list")+"&gt;</a></li>"); %>
					<li id="foldheader"><%=pageData.getWord("Active lists")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/telephone.gif')">
					<div id="active_calling_lists_tenant_<%=current_tenant_dbid%>">
					<%				
					for( int i = 0 ; i < active_callingListsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)active_callingListsDataResult.elementAt(i).get("tenant_dbid");
						String obj_dbid = (String)active_callingListsDataResult.elementAt(i).get("dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
								out.write("<li id=\"menuli\"><a href=\"./Resources_pages/modifyCallingList.jsp?dbid="+obj_dbid+"&callinglistName="+active_callingListsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\">"+active_callingListsDataResult.elementAt(i).get("name")+"</a></li>");
					}
					%>	
					</div>		
					</ul>					
					<li id="foldheader"><%=pageData.getWord("Inactive lists")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/telephone.gif')">
					<div id="inactive_calling_lists_tenant_<%=current_tenant_dbid%>">
					<%				
						for( int i = 0 ; i < inactive_callingListsDataResult.size(); i++ )
						{
						String obj_tenant_id = (String)inactive_callingListsDataResult.elementAt(i).get("tenant_dbid");
						String obj_dbid = (String)inactive_callingListsDataResult.elementAt(i).get("dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
								out.write("<li id=\"menuli\"><a href=\"./Resources_pages/modifyCallingList.jsp?dbid="+obj_dbid+"&callinglistName="+inactive_callingListsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\">"+inactive_callingListsDataResult.elementAt(i).get("name")+"</a></li>");
						}
					%>
					</div>
				   	</ul>
				   	</ul>
					<%
			   	} // Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_DONOTCALL_LIST_MANAGEMENT"))
				{
					String black_list_html  	= "";					
					
					for( int i = 0 ; i < blacklistDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)blacklistDataResult.elementAt(i).get("tenant_dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
							black_list_html	 += "<li id=\"menuli\"><a href=\"./Resources_pages/blackList.htm?blacklist_dbid="+blacklistDataResult.elementAt(i).get("dbid")+"&blacklist_name="+blacklistDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\">"+blacklistDataResult.elementAt(i).get("name")+"</a></li>";
					}				
					%>
					<li id="foldheader"><%=pageData.getWord("Do-not-call lists")%></li>					
					
				    <ul id="foldinglist" style="display:none; list-style-image:url('img/telephone.gif')">
				    <li id="menuli"> <a href="./Resources_pages/blackList.htm?blacklist_dbid=&blacklist_name=&tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Create a do-not-call list")%></a></li>
				    
					<li id="foldheader"><%=pageData.getWord("Current do-not-call lists")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/telephone.gif')">
					<div id="current_do_not_call_lists_tenant_<%=current_tenant_dbid%>">
					<%=black_list_html%>
					</div>
					</ul>
					
					<li id="foldheader"><%=pageData.getWord("Actions on do-not-call lists")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/telephone.gif')">
					<div id="actions_on_DNCL_tenant_<%=current_tenant_dbid%>">
						<li id="menuli"> <a href="./Resources_pages/addNumbersToBlackList.htm?tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Add numbers to Do-not-call list")%></a></li>
						<li id="menuli"> <a href="./Resources_pages/blackListNumberInCampaign.htm?tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Search campaign for Do-not-call list number")%></a></li>
						<li id="menuli"> <a href="./Resources_pages/viewBlacklistContents.htm?tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Display Do-not-call list contents")%></a></li>
					</div>	
				    </ul>
					</ul>
					
				<%
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
							if( obj_state.compareTo("1") == 0 )
								active_filters_html 	 += "<li id=\"menuli\"> <a href=\"./Resources_pages/filter.htm?filter_name="+filtersDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\">"+filtersDataResult.elementAt(i).get("name")+"</a></li>";
							else
								inactive_filters_html 	 += "<li id=\"menuli\"> <a href=\"./Resources_pages/filter.htm?filter_name="+filtersDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\">"+filtersDataResult.elementAt(i).get("name")+"</a></li>";
						}
					}
					
					%>
					<li id="foldheader"><%=pageData.getWord("Filters")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/filtre.gif')">
					<li id="menuli"> <a href="./Resources_pages/filter.htm?filter_name=&tenant_dbid=<%=current_tenant_dbid%>">&lt;<%=pageData.getWord("Add filter")%>&gt;</a></li>
					<li id="foldheader"><%=pageData.getWord("Active filter")%></li>
					<ul id="foldinglist"  style="display:none; list-style-image:url('img/filtre.gif')">
					<div id="active_filters_tenant_<%=current_tenant_dbid%>">
						<%=active_filters_html%>
					</div>
					</ul>
					<li id="foldheader"><%=pageData.getWord("Inactive filter")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/filtre_inactive.gif')">
					<div id="inactive_filters_tenant_<%=current_tenant_dbid%>">
						<%=inactive_filters_html%>
					</div>
					</ul>
					</ul>
				<%
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
							if( obj_state.compareTo("1") == 0 )
								active_treatments_html 	 += "<li id=\"menuli\"> <a href=\"./Resources_pages/treatment.htm?treatment_name="+treatmentsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\">"+treatmentsDataResult.elementAt(i).get("name")+"</a></li>";
							else
								inactive_treatments_html += "<li id=\"menuli\"> <a href=\"./Resources_pages/treatment.htm?treatment_name="+treatmentsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\">"+treatmentsDataResult.elementAt(i).get("name")+"</a></li>";
						}
					}
					
					%>
					<li id="foldheader"><%=pageData.getWord("Treatments")%></li>
					<ul id="foldinglist" style="display:none;  list-style-image:url('img/treatment.gif')">					
					<li id="menuli"> <a href="./Resources_pages/treatment.htm?treatment_name=&tenant_dbid=<%=current_tenant_dbid%>">&lt;<%=pageData.getWord("Add treatment")%>&gt;</a></li>
					<li id="foldheader"><%=pageData.getWord("Active Treatments")%></li>
					<ul id="foldinglist" style="display:none;  list-style-image:url('img/treatment_active.gif')">
					<div id="active_treatments_tenant_<%=current_tenant_dbid%>">
						<%=active_treatments_html%>
					</div>
					</ul>
					<li id="foldheader"><%=pageData.getWord("Inactive Treatments")%></li>					
					<ul id="foldinglist" style="display:none;  list-style-image:url('img/treatment_inactive.gif')">
					<div id="inactive_treatments_tenant_<%=current_tenant_dbid%>">
						<%=inactive_treatments_html%>
					</div>
					</ul>
					</ul>
					<%
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
							if( obj_state.compareTo("1") == 0 )
								active_notreadyreasons_html   += "<li id=\"menuli\"><a href=\"./Resources_pages/notReadyReason.htm?NRR_name="+notreadyreasonsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\">"+notreadyreasonsDataResult.elementAt(i).get("name")+"</a></li>";
							else
								inactive_notreadyreasons_html += "<li id=\"menuli\"><a href=\"./Resources_pages/notReadyReason.htm?NRR_name="+notreadyreasonsDataResult.elementAt(i).get("name")+"&tenant_dbid="+current_tenant_dbid+"\">"+notreadyreasonsDataResult.elementAt(i).get("name")+"</a></li>";
						}
					}
					%>
					<li id="foldheader"><%=pageData.getWord("Not-ready reasons")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/couple.gif')">
					<li id="menuli"> <a href="./Resources_pages/notReadyReason.htm?NRR_name=&tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Add Not-ready reason")%></a></li>
					<li id="foldheader"><%=pageData.getWord("Active Not-ready reasons")%></li>					
					<ul id="foldinglist" style="display:none; list-style-image:url('img/couple.gif')">
					<div id="active_notreadyreasons_tenant_<%=current_tenant_dbid%>">
						<%=active_notreadyreasons_html%>
					</div>
					</ul>					
					<li id="foldheader"><%=pageData.getWord("Inactive Not-ready reasons")%></li>					
					<ul id="foldinglist" style="display:none; list-style-image:url('img/couple.gif')">
					<div id="inactive_notreadyreasons_tenant_<%=current_tenant_dbid%>">
						<%=inactive_notreadyreasons_html%>
					</div>
					</ul>
					</ul>
				<%

				}//Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_NOT_READY_REASON_MANAGEMENT"))


				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUEUES_MANAGEMENT"))
				{
					String agent_group_queues_html  	= "";
					
					for( int i = 0 ; i < queuemanagementDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)queuemanagementDataResult.elementAt(i).get("tenant_dbid");						
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{
							agent_group_queues_html += "<li id=\"menuli\"> <a href=\"./Resources_pages/queues.jsp?queue_name="+queuemanagementDataResult.elementAt(i).get("queue")+"&tenant_dbid="+current_tenant_dbid+"\">"+queuemanagementDataResult.elementAt(i).get("queue")+"</a></li>";
						}					
					}
					%>
					
					<li id="foldheader"><%=pageData.getWord("Queues")%></li>
					<ul id="foldinglist" style="display:none ">
					<!--Agent Groups Queues-->
					<li id="foldheader"><%=pageData.getWord("Agent group queues")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/queues.gif')">
					<div id="agentgroup_queues_tenant_<%=current_tenant_dbid%>">
						<%=agent_group_queues_html%>
					</div>
					</ul>
					
					<% 
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT"))
					{%>
						<li id="foldheader"><%=pageData.getWord("Routing script queues")%></li>
						<ul id="foldinglist" style="display:none; list-style-image:url('img/queues.gif')">
						<script>
						tenantDBID = "<%=current_tenant_dbid%>";
						var arrayQueues = this.getRoutingScriptAndQueues(tenantDBID);
						for (i = 0; i < arrayQueues.length; i++)
						{
							document.write("<li id=\"menuli\"> <a href=\"./Resources_pages/queues.jsp?queue_name="+arrayQueues[i]+"&tenant_dbid="+tenantDBID+"\">"+arrayQueues[i]+"</a></li>");
						}
						</script>
						</ul>
					<%}%>
					</ul>

				<%}//Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUEUES_MANAGEMENT"))

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT"))
				{
					String skills_queues_html  	= "";
					for( int i = 0 ; i < skillsmanagementDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)skillsmanagementDataResult.elementAt(i).get("tenant_dbid");
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{	
							skills_queues_html += "<li id=\"menuli\"><a href=\"./Resources_pages/Skill.jsp?skill_id="+skillsmanagementDataResult.elementAt(i).get("dbid") + "\">" + skillsmanagementDataResult.elementAt(i).get("name") + "</a></li>";
						}	
					} %>
					<li id="foldheader"><%=pageData.getWord("Skills")%></li>
					<ul id="foldinglist" style="display:none">
					<li id="menuli"><a href="./Resources_pages/Skill.jsp?tenant_dbid=<%=current_tenant_dbid%>">&lt;<%=pageData.getWord("Add skills")%>&gt;</a></li>
					<div id="skills_queues_tenant_<%=current_tenant_dbid%>">
					<%=skills_queues_html%>
					</div>
					</ul>
				<%}//FIN de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT"))%>
				</ul>
			<%}//Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_RESSOURCES_MANAGEMENT"))


			 if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_REPORTS_MANAGEMENT"))
			{%>
				<li id="foldheader"><%=pageData.getWord("Historical Reports")%></li>
				<ul id="foldinglist" style="display:none; list-style-image:url('img/tarte.gif')">
				<%if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/datePicker.jsp?type=Agents&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Agent Details Reports")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/datePicker.jsp?type=AgentGroups&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Agent Groups Reports")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/datePicker.jsp?type=AgentSummary&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Agent summary reports")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/datePicker.jsp?type=Outbound&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Outbound call reports")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/inboundCalls.htm?type=Inbound&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Inbound Calls Reports")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/datePicker.jsp?type=AgentLoginReport&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Agent Login Reports")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/datePicker.jsp?type=Campaigns&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Campaign Reports")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/datePicker.jsp?type=CallingsLists&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Calling List Reports")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/datePicker.jsp?type=CallDetails&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Calling List Report Details")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\"><a href=\"./Resources_pages/datePicker.jsp?type=Queues&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Queue Reports")+"</a></li>");
 				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT"))
                   out.write("<li id=\"menuli\"><a href=\"./Resources_pages/groupReport.htm?type=GroupForecast&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Group Forecast Reports")+"</a></li>");
 				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT"))
                   out.write("<li id=\"menuli\"><a href=\"./Resources_pages/groupReport.htm?type=GroupSummary&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Group Summary Reports")+"</a></li>");
                if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_LINEMANAGEMENT_REPORTS_MANAGEMENT"))
                   out.write("<li id=\"menuli\"><a href=\"./Resources_pages/lineReport.htm?type=LineReport&tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Line Report")+"</a></li>");
			%>

				
				</ul>
			<%}// Fin de iif(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_REPORTS_MANAGEMENT"))

			
			if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_MANAGEMENT"))
			{				
			%>
				<li id="foldheader"><%=pageData.getWord("Quality Monitoring")%></li>
				<ul id="foldinglist" style="display:none" >
				<%if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\" style=\"list-style-image:url('img/audio.gif')\"><a href=\"./Resources_pages/conversationRecPicker.htm?tenant_dbid="+current_tenant_dbid+"\">"+pageData.getWord("Agent's recordings")+"</a></li>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT"))
					out.write("<li id=\"menuli\" style=\"list-style-image:url('img/tarte.gif')\"><a href=\"./Resources_pages/listenRecPicker.htm?tenant_dbid="+current_tenant_dbid+"&group=\">"+pageData.getWord("Agent monitoring report")+"</a></li>");
			%>
				</ul>

			<%				
			} //Fin de if(RIGHTS["TENANT_QUALITY_MONITORING"])
			
			if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_WORK_FORCE_MANAGEMENT"))
			{
					String team_management_html  	= "";
					for( int i = 0 ; i <teammanagementDataResult.size(); i++ )
					{						
						String obj_tenant_id = (String)teammanagementDataResult.elementAt(i).get("tenant_dbid");
											
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{	
							 team_management_html += "<li id=\"menuli\"><a href=\"./Resources_pages/wfmTeam.htm?team="+teammanagementDataResult.elementAt(i).get("dbid")+"^"+ teammanagementDataResult.elementAt(i).get("team_name")+"^"+teammanagementDataResult.elementAt(i).get("team_leader") +"&tenant_dbid="+teammanagementDataResult.elementAt(i).get("tenant_dbid")+"\">"+teammanagementDataResult.elementAt(i).get("team_name")+"</a></li>";
						}
					}%>
				<li id="foldheader"><%=pageData.getWord("Work Force Management")%></li>
				<ul id="foldinglist" style="display:none">
				 <!--Teams-->
				<li id="foldheader"><%=pageData.getWord("Teams")%> </li>
				<ul id="foldinglist" style="display:none">
				<li id="menuli"><a href="./Resources_pages/wfmTeam.htm?team=&tenant_dbid=<%=current_tenant_dbid%>">&lt;<%=pageData.getWord("Add a team")%>&gt;</a></li>
				<div id="team_management_tenant_<%=current_tenant_dbid%>">
				<%=team_management_html%>
				</div>
				</ul>
												
				<li id="foldheader">  <%=pageData.getWord("Schedule")%> </li>
				<ul id="foldinglist" style="display:none">
				
				<li id="menuli"><a href="./Resources_pages/LoadHoraire.jsp?tenant_dbid=<%=current_tenant_dbid%>&tenantName=<%=current_tenant_name%>"><%=pageData.getWord("Import schedule")%> </a></li>				
				
									<li id="menuli"><a href="./Resources_pages/horaires.htm?tenant_dbid=<%=current_tenant_dbid%>&complete=no"> <%=pageData.getWord("Assign schedule")%>  </a></li>
				<li id="menuli"><a href="./Resources_pages/horaires.htm?tenant_dbid=<%=current_tenant_dbid%>&complete=yes">  <%=pageData.getWord("Review published schedule")%>  </a></li>
									<li id="menuli"><a href="./Resources_pages/horaires.htm?tenant_dbid=<%=current_tenant_dbid%>&report=yes"> <%=pageData.getWord("Scheduled agents' report")%>  </a></li>

				</ul>

				
				<li id="foldheader"><%=pageData.getWord("adherence")%></li>
				<ul id="foldinglist" style="display:none; list-style-image:url('img/adherence.gif')">
					<li id="menuli"><a href="./Resources_pages/rta.htm?type=AgentGroupsRTA&tenant_dbid=<%=current_tenant_dbid%>"> <%=pageData.getWord("Real Time Adherence")%></a></li>
					<li id="menuli"><a href="./Resources_pages/rta.htm?type=Agents&tenant_dbid=<%=current_tenant_dbid%>"> <%=pageData.getWord("View Adherence Graph")%></a></li>
					<li id="menuli"><a href="./Resources_pages/adherenceReport.htm?type=AgentAdherenceReport&tenant_dbid=<%=current_tenant_dbid%>"> <%=pageData.getWord("Adherence Report")%></a></li>
				</ul>
				</ul>
			<%
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
						current_activities_html +=	"<li id=\"menuli\"><a href=\"./Resources_pages/Activity.htm?activity_dbid="+currentactivitiesDataResult.elementAt(i).get("dbid")+"&activity_name="+currentactivitiesDataResult.elementAt(i).get("activity_name")+"&tenant_dbid="+current_tenant_dbid+"\">"+currentactivitiesDataResult.elementAt(i).get("activity_name")+"</a></li>";					
					}
				}
				
				%>
				<li id="foldheader"><%=pageData.getWord("Financial information")%></li>
				<ul id="foldinglist" style="display:none">
				<%
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_CONFIGURATION"))
				{
				%>
				
					<li id="foldheader"><%=pageData.getWord("Activity")%></li>
					<ul id="foldinglist" style="display:none">
						<li id="menuli"><a href="./Resources_pages/Activity.htm?tenant_dbid=<%=current_tenant_dbid%>">&nbsp;<%=pageData.getWord("Add an activity")%></a></li>
						<li id="foldheader"><%=pageData.getWord("Current activities")%></li>
						<ul id="foldinglist" style="display:none;">
						<div id="current_activities_tenant_<%=current_tenant_dbid%>">
							<%=current_activities_html%>
						</div>
						</ul>
					</ul>
					
					<li id="foldheader"><%=pageData.getWord("Configuration")%></li>
					<ul id="foldinglist" style="display:none">
						<li id="menuli"> <a href="./Resources_pages/generalConfigDemo.htm?tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Payroll configuration")%></a></li>
					</ul>
		
					<li id="foldheader"><%=pageData.getWord("Commissions")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">
						<% 
							for( int i = 0 ; i < commissionsDataResult.size(); i++ )
							{							
								String obj_state 	 = (String)commissionsDataResult.elementAt(i).get("status");
								if( obj_state.compareTo("1") == 0 )
									active_commission_html += "<li id=\"menuli\"> <a href=\"./Resources_pages/mopTreatment.htm?mop_treatment_dbid="+commissionsDataResult.elementAt(i).get("dbid")+"&mop_treatment_name="+commissionsDataResult.elementAt(i).get("name")+"&tenant_dbid="+commissionsDataResult.elementAt(i).get("tenant_dbid")+"\">"+commissionsDataResult.elementAt(i).get("name")+"</a></li>";
								else
									inactive_commission_html += "<li id=\"menuli\"> <a href=\"./Resources_pages/mopTreatment.htm?mop_treatment_dbid="+commissionsDataResult.elementAt(i).get("dbid")+"&mop_treatment_name="+commissionsDataResult.elementAt(i).get("name")+"&tenant_dbid="+commissionsDataResult.elementAt(i).get("tenant_dbid")+"\">"+commissionsDataResult.elementAt(i).get("name")+"</a></li>";						
							}
							%>	
							<li id="menuli"> <a href="./Resources_pages/mopTreatment.htm?mop_treatment_dbid=&mop_treatment_name=&tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Add commission")%></a></li>
							<li id="foldheader"><%=pageData.getWord("Active commissions")%></li>
							<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">
							<div id="active_commission_tenant_<%=current_tenant_dbid%>">
								<%=active_commission_html%>			
							</div>	
							</ul>
							<li id="foldheader"><%=pageData.getWord("Inactive commissions")%></li>
							<ul id="foldinglist" style="display:none; list-style-image:url('img/user_inactive.gif')">
							<div id="inactive_commission_tenant_<%=current_tenant_dbid%>">
								<%=inactive_commission_html%>
							</div>
							</ul>

							<li id="menuli"><a href="./Resources_pages/cmp_commission_creator.jsp"><script>document.write(MultiArray['Create Commission V2'][lang]);</script></a></li>
							<li id="menuli"><a href="./Resources_pages/cmp_commission_condition.jsp"><script>document.write(MultiArray['Create commissions V2 conditions'][lang]);</script></a></li>
					</ul>
	
					
					<li id="foldheader"><%=pageData.getWord("Methods Of Payment")%></li>
					<%  
					String active_mops_html  		= "";
					String inactive_mops_html  		= "";
					
					for( int i = 0 ; i <mopsDataResult.size(); i++ )
					{
						String obj_tenant_id = (String)mopsDataResult.elementAt(i).get("tenant_dbid");
						String obj_state 	 = (String)mopsDataResult.elementAt(i).get("status");
							
						if( obj_tenant_id.compareTo(current_tenant_dbid) == 0 )
						{
							if( obj_state.compareTo("1") == 0 )
								active_mops_html +="<li id=\"menuli\"> <a href=\"./Resources_pages/mop.htm?mopDBID="+mopsDataResult.elementAt(i).get("dbid")+"&mopName="+mopsDataResult.elementAt(i).get("mop_name")+"&tenant_dbid="+mopsDataResult.elementAt(i).get("tenant_dbid")+"\">"+mopsDataResult.elementAt(i).get("mop_name")+"</a></li>";
							else
								inactive_mops_html += "<li id=\"menuli\"> <a href=\"./Resources_pages/mop.htm?mopDBID="+mopsDataResult.elementAt(i).get("dbid")+"&mopName="+mopsDataResult.elementAt(i).get("mop_name")+"&tenant_dbid="+mopsDataResult.elementAt(i).get("tenant_dbid")+"\">"+mopsDataResult.elementAt(i).get("mop_name")+"</a></li>";
						}
					}%>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">
						<li id="menuli"> <a href="./Resources_pages/mop.htm?tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Add Method of Payment")%></a></li>
						<li id="foldheader"><%=pageData.getWord("Active MOPs")%></li>
						<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">
						<div id="active_mops_tenant_<%=current_tenant_dbid%>">
							<%=active_mops_html%>
						</div>
						</ul>			
						<li id="foldheader"><%=pageData.getWord("Inactive MOPs")%></li>
						<ul id="foldinglist" style="display:none; list-style-image:url('img/user_inactive.gif')">
						<div id="inactive_mops_tenant_<%=current_tenant_dbid%>">
							<%=inactive_mops_html%>
						</div>
						</ul>
					</ul>
					<li id="foldheader">Dispo</li>
					<ul id="foldinglist" style="display:none">
						<li><a href="./Resources_pages/dispo_creator.jsp"><script>document.write(MultiArray['Dispo Creator'][lang]);</script></a>
						<li><a href="./Resources_pages/dispo_options_creator.jsp"><script>document.write(MultiArray['Dispo Options Creator'][lang]);</script></a>
						<li><a href="./Resources_pages/dispo_cmp_assoc.jsp"><script>document.write(MultiArray['Dispo-Cmp association'][lang]);</script></a></li>
					</ul>
				<%	
				}
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_REPORTS"))
				{
				%>
					<!-- Add an a line to add the possibility to add  -->
					<li id="foldheader"><%=pageData.getWord("Reports")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">
						<li id="menuli"><a href="./Resources_pages/loginvsProduction.jsp?type=report&sessionParams=init&viewData=&saveAddedRows=&startDate=&agentGroupId=&agentId=&tenant_dbid=<%=current_tenant_dbid%>&strToInsert=&strToUpdate="><%=pageData.getWord("Agent Hours report")%></a></li>
						<li id="menuli"><a href="./jsp/extractPayrollData.jsp"><%=pageData.getWord("Extract payroll data")%></a></li>
						<li id="menuli"><a href="./jsp/commissionReport.jsp?viewData=&tenant_dbid=<%=current_tenant_dbid%>&fromDate=&toDate=&reqType=&objId="><%=pageData.getWord("Commission details")%></a></li>
						<li id="menuli"><a href="./Resources_pages/cmp_commission_report.jsp"><script>document.write(MultiArray['Commission V2 Report'][lang]);</script></a></li>
					</ul>				
				</ul>   
				<%
				}else{			
				 out.write("</ul>");  //21/04/08 : This </ul> tag was missed. It is mandatory for the Message Center and the tenants to be dispalyed properly in the left menu.		
				} //Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_WORK_FORCE_MANAGEMENT"))
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
				if( obj_state.compareTo("1") == 0 )
					active_alertStarPhone_html += "<li id=\"menuli\"> <a href=\"./Resources_pages/McAlert.jsp?dbid=" + alertStarPhoneDataResult.elementAt(i).get("dbid")+"&tenant_dbid="+alertStarPhoneDataResult.elementAt(i).get("tenant_dbid")+"\">"+alertStarPhoneDataResult.elementAt(i).get("name")+"</a></li>";
				else
					inactive_alertStarPhone_html += "<li id=\"menuli\"> <a href=\"./Resources_pages/McAlert.jsp?dbid="+alertStarPhoneDataResult.elementAt(i).get("dbid")+"&tenant_dbid="+alertStarPhoneDataResult.elementAt(i).get("tenant_dbid")+"\">"+alertStarPhoneDataResult.elementAt(i).get("name")+"</a></li>";					
					
			}
		
			
			//for the starPhone statistics
			for( int i = 0 ; i < statisticStarPhoneDataResult.size(); i++ )
			{
				String obj_state =(String)statisticStarPhoneDataResult.elementAt(i).get("state");
				
				if( obj_state.compareTo("1") == 0 )
					active_statisticStarPhone_html += "<li id=\"menuli\"> <a href=\"./Resources_pages/McStatistics.jsp?tenant_dbid="+statisticStarPhoneDataResult.elementAt(i).get("tenant_dbid")+"&dbid=" + statisticStarPhoneDataResult.elementAt(i).get("dbid") + "\">"+statisticStarPhoneDataResult.elementAt(i).get("name")+"</a></li>";
				else
					inactive_statisticStarPhone_html += "<li id=\"menuli\"> <a href=\"./Resources_pages/McStatistics.jsp?tenant_dbid="+statisticStarPhoneDataResult.elementAt(i).get("tenant_dbid")+"&dbid=" + statisticStarPhoneDataResult.elementAt(i).get("dbid") + "\">"+statisticStarPhoneDataResult.elementAt(i).get("name")+"</a></li>";
			}
			
			%>
				
		    	<li id="foldheader"><%=pageData.getWord("Message center")%></li>
			<ul id="foldinglist" style="display:none">
				<li id="foldheader"><%=pageData.getWord("Statistics")%></li>
				<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">	
					<li id="menuli"> <a href="./Resources_pages/McStatistics.jsp?tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Add statistic")%></a></li>					
					<li id="foldheader"><%=pageData.getWord("Active statistics")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">
						<div id="active_starPhoneStatistics_tenant_<%=current_tenant_dbid%>">
							<%=active_statisticStarPhone_html%>			
						</div>	
					</ul>
					<li id="foldheader"><%=pageData.getWord("Inactive statistics")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/user_inactive.gif')">
						<div id="inactive_starPhoneStatistics_tenant_<%=current_tenant_dbid%>">
							<%=inactive_statisticStarPhone_html%>
						</div>
					</ul>
				</ul>
			 					
				<li id="foldheader"><%=pageData.getWord("Alerts")%></li>
				<ul id="foldinglist" style="display:none; list-style-image:url('img/user.gif')">
					<li id="menuli"><a href="./Resources_pages/McAlert.jsp?tenant_dbid=<%=current_tenant_dbid%>"><%=pageData.getWord("Add alert")%></a></li>
					
					<li id="foldheader"><%=pageData.getWord("Active alerts")%></li>
					<ul id=	"foldinglist" style="display:none; list-style-image:url('img/user.gif')">
						<div id="active_starPhoneAlerts_tenant_<%=current_tenant_dbid%>">
							<%=active_alertStarPhone_html%>			
						</div>	
					</ul>
					<li id="foldheader"><%=pageData.getWord("Inactive alerts")%></li>
					<ul id="foldinglist" style="display:none; list-style-image:url('img/user_inactive.gif')">
						<div id="inactive_starPhoneAlerts_tenant_<%=current_tenant_dbid%>">
							<%=inactive_alertStarPhone_html%>
						</div>
					</ul>
				</ul>
			</ul>
			

			<%		
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
						if( obj_state.compareTo("1") == 0 )
							active_routing_scripts_html   += "<li id=\"menuli\"><a href=\"./Resources_pages/routingScript.jsp?tenant_dbid="+routingscriptsDataResult.elementAt(i).get("tenant_dbid")+"&tenantName="+routingscriptsDataResult.elementAt(i).get("tenant_name")+"&script_dbid="+routingscriptsDataResult.elementAt(i).get("dbid")+"&script_name="+routingscriptsDataResult.elementAt(i).get("script_name")+"&script_is_active="+routingscriptsDataResult.elementAt(i).get("status")+"&script_priority="+routingscriptsDataResult.elementAt(i).get("priority")+"\">"+routingscriptsDataResult.elementAt(i).get("script_name")+"</a></li>";
						else
							inactive_routing_scripts_html += "<li id=\"menuli\"><a href=\"./Resources_pages/routingScript.jsp?tenant_dbid="+routingscriptsDataResult.elementAt(i).get("tenant_dbid")+"&tenantName="+routingscriptsDataResult.elementAt(i).get("tenant_name")+"&script_dbid="+routingscriptsDataResult.elementAt(i).get("dbid")+"&script_name="+routingscriptsDataResult.elementAt(i).get("script_name")+"&script_is_active="+routingscriptsDataResult.elementAt(i).get("status")+"&script_priority="+routingscriptsDataResult.elementAt(i).get("priority")+"\">"+routingscriptsDataResult.elementAt(i).get("script_name")+"</a></li>";
					}
				}%>
			
		
			<li id="foldheader"><%=pageData.getWord("Routing scripts")%></li>
			<ul id="foldinglist" style="display:none">
				<li id="menuli"><a href="./Resources_pages/routingScript.jsp?tenant_dbid=<%=current_tenant_dbid%>&tenantName=<%=current_tenant_name%>">&lt;<%=pageData.getWord("Add Routing Script")%>&gt;</a></li>
				<li id="foldheader"><%=pageData.getWord("Active scripts")%></li>
				<ul id="foldinglist" style="display:none">
				<div id="active_routing_scripts_tenant_<%=current_tenant_dbid%>">
					<%=active_routing_scripts_html%>
				</div>
				</ul>
				<li id="foldheader"><%=pageData.getWord("Inactive scripts")%></li>
				<ul id="foldinglist" style="display:none">
				<div id="inactive_routing_scripts_tenant_tenant_<%=current_tenant_dbid%>">
					<%=inactive_routing_scripts_html%>
				</div>
				</ul>
			</ul>
		<%}// END of if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT")
			%>
			
			</ul>
			
			
			
			</ul>
			
			
		<%
		} //Fin du for...
	}
%>


<script language="JavaScript1.2">
if(document.getElementById("foldinglist"))
{
	var foldercontentarray=new Array()
	var c=0
	
	if (ns6)
	{
		for (i=0; i < document.getElementsByTagName("UL").length; i++)
		{
			if ( IsInFoldingLists(document.getElementsByTagName("UL")[i].id) )
			{
				foldercontentarray[c]=document.getElementsByTagName("UL")[i];
				c++;
			}
		}
	}

	if (get_cookie(window.location.pathname) != '')
	{
		var openresults=String( get_cookie(window.location.pathname)).split(" ");
		//alert('openresults='+openresults);
		for (i=0 ; i < openresults.length ; i++)
		{
			if (ns6)
			{
				if(foldercontentarray[parseInt(openresults[i])] != null)
				{
					//alert('parseInt(openresults[i])='+parseInt(openresults[i]));
					foldercontentarray[parseInt(openresults[i])].style.display=''
					foldercontentarray[parseInt(openresults[i])].previousSibling.style.listStyleImage="url(img/open.gif)"
				}
			}
			else
			{
				if(foldinglist[openresults[i]] != null)
				{
					foldinglist[openresults[i]].style.display=''
					document.all[foldinglist[openresults[i]].sourceIndex -1].style.listStyleImage="url(img/open.gif)"
				}
			}
		}
	}
	
	if (ns6||ie4)
	{
		var nodelength=ns6? c-1 : (foldinglist.length-1);
		var nodes = null;
		if( nodelength > 0 )
			nodes = new Array(nodelength)
		else 
			nodes = new Array()
		var openones=''
		window.onunload=checkit
	}
}


</script>

<script>
       if(!appletObj.getIsMessageCenterAllowed() ) {
         //  document.getElementById("filterMessageCenterDisplay0").style.display='none';
	 //  document.getElementById("filterMessageCenterDisplay1").style.display='none';
       }
</script>
<!-- Fixes the IE6 & IE7 "Press SPACEBAR or ENTER to activate and use this control" - must be at the end of the file-->
<script language="JScript" type="text/jscript" src="activateActiveX.js"></script>

</body>
</html>

<% pageData.closeConnection(); %>
