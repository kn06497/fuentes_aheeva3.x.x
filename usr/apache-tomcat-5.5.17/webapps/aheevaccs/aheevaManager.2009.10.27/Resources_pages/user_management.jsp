<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%> 
<%@page import ="aheevaManager.ressources.*"%>

<%
	
	beanManagerData pageData = new beanManagerData();
	ResultSet rs;
		
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else
		pageData.setDefaultLanguage("ENGLISH");	
		
	
	String currentuser_assignedTenants 	= "(select ressource_dbid from cfg_user_authorize_ressources where user_dbid = '"+((String)session.getAttribute("CURRENT_USER_DBID"))+"' and ressource_type = 'TENANT')";	
	String tenantsDataQuery 			= "select dbid, name from cfg_tenant_info where (state is NULL || state != '0') and dbid in "+currentuser_assignedTenants+" order by name";
	String agentGroupsDataQuery 		= "select dbid, tenant_dbid, name from cfg_agent_group where state = '1' and tenant_dbid in "+currentuser_assignedTenants+" order by name";
	String campaignsDataQuery			= "select dbid, name, tenant_dbid from cfg_campaign where state = '1' and tenant_dbid in "+currentuser_assignedTenants+" order by name";
	String callinglistDataQuery			= "select dbid, name, tenant_dbid from cfg_calling_list where state = '1' and tenant_dbid in "+currentuser_assignedTenants+" order by name";
	String routingscriptDataQuery		= "select dbid, script_name, tenant_dbid from cfg_routing_script where status = '1' and tenant_dbid in "+currentuser_assignedTenants+" order by script_name";
	String authLicenseItemQuery		= "select dbid, ALLOW_MESSAGE_CENTER_MANAGEMENT, ALLOW_MANAGER_SCREEN_MONITORING from  cfg_user where DBID = '"+((String)session.getAttribute("CURRENT_USER_DBID"))+"'";      //Mbassa
	
	String this_user_dbid = "";
	if( request.getParameter("dbid") != null )
		this_user_dbid = (String)request.getParameter("dbid");
		
	boolean IS_IN_ADDMODE = true;
	if( this_user_dbid.compareTo("") != 0 )
		IS_IN_ADDMODE = false;
	
	String this_username 		= "";
	String this_live_username 	= "";
	String this_password 		= "";
	String this_livepassword 	= "";
	String this_active 			= "";	
	
	String tenantsDataQueryAssoc		= "select cfg_tenant_info.dbid as dbid, cfg_tenant_info.name as name from cfg_tenant_info, cfg_user_authorize_ressources where (cfg_tenant_info.state is NULL || cfg_tenant_info.state != '0') and cfg_user_authorize_ressources.ressource_type = 'TENANT' and cfg_user_authorize_ressources.user_dbid = '"+this_user_dbid+"' and cfg_user_authorize_ressources.ressource_dbid = cfg_tenant_info.dbid order by cfg_tenant_info.name";
	String agentGroupsDataQueryAssoc	= "select cfg_agent_group.dbid as dbid, cfg_agent_group.tenant_dbid as tenant_dbid, cfg_agent_group.name as name from cfg_agent_group, cfg_user_authorize_ressources where cfg_agent_group.state = '1' and cfg_user_authorize_ressources.ressource_type = 'AGENTGROUP' and cfg_user_authorize_ressources.user_dbid = '"+this_user_dbid+"' and cfg_user_authorize_ressources.ressource_dbid = cfg_agent_group.dbid order by cfg_agent_group.name";
	String campaignsDataQueryAssoc		= "select cfg_campaign.dbid as dbid, cfg_campaign.name as name, cfg_campaign.tenant_dbid as tenant_dbid from cfg_campaign, cfg_user_authorize_ressources where cfg_campaign.state = '1' and cfg_user_authorize_ressources.ressource_type = 'CAMPAIGN' and cfg_user_authorize_ressources.user_dbid = '"+this_user_dbid+"' and cfg_user_authorize_ressources.ressource_dbid = cfg_campaign.dbid order by cfg_campaign.name ";
	String callinglistDataQueryAssoc	= "select cfg_calling_list.dbid as dbid, cfg_calling_list.name as name, cfg_calling_list.tenant_dbid as tenant_dbid from cfg_calling_list, cfg_user_authorize_ressources where cfg_calling_list.state = '1' and cfg_user_authorize_ressources.ressource_type = 'CALLING_LIST' and cfg_user_authorize_ressources.user_dbid = '"+this_user_dbid+"' and cfg_user_authorize_ressources.ressource_dbid = cfg_calling_list.dbid order by cfg_calling_list.name";
	String routingscriptDataQueryAssoc	= "select cfg_routing_script.dbid as dbid, cfg_routing_script.script_name as script_name, cfg_routing_script.tenant_dbid as tenant_dbid from cfg_routing_script, cfg_user_authorize_ressources where cfg_routing_script.status = '1' and cfg_user_authorize_ressources.ressource_type = 'ROUTING_SCRIPT' and cfg_user_authorize_ressources.user_dbid = '"+this_user_dbid+"' and cfg_user_authorize_ressources.ressource_dbid = cfg_routing_script.dbid order by cfg_routing_script.script_name";
	String getThisUserInfos				= "select * from cfg_user where dbid = '"+this_user_dbid+"'";
	String getCountUsers				= "select count(dbid) as user_count from cfg_user";

	Vector<HashMap> tenantDataAssocResult 			= new Vector<HashMap>();
	Vector<HashMap> agentgroupAssocDataResult 		= new Vector<HashMap>();
	Vector<HashMap> campaignsAssocDataResult 		= new Vector<HashMap>();
	Vector<HashMap> callinglistAssocDataResult 		= new Vector<HashMap>();
	Vector<HashMap> routingscriptsAssocDataResult 	= new Vector<HashMap>();
	Vector<HashMap> getThisUserDataResult			= new Vector<HashMap>();
	
	pageData.openConnection();
	pageData.executeFromString(tenantsDataQuery);
	Vector <HashMap> tenantDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(agentGroupsDataQuery);
	Vector <HashMap> agentgroupDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(campaignsDataQuery);
	Vector <HashMap> campaignsDataResult = pageData.CreateVectorFromBean(); 
	pageData.executeFromString(callinglistDataQuery);
	Vector <HashMap> callinglistDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(routingscriptDataQuery);
	Vector <HashMap> routingscriptsDataResult = pageData.CreateVectorFromBean();

	pageData.executeFromString(getCountUsers);
	Vector<HashMap> getCountUsersDataResult  = pageData.CreateVectorFromBean();
	
	pageData.executeFromString(authLicenseItemQuery);	
	Vector<HashMap> getAuthLicenseItemResult  = pageData.CreateVectorFromBean();  //Mbassa
	
	
	if( !IS_IN_ADDMODE )
	{   
		pageData.executeFromString(tenantsDataQueryAssoc);
		tenantDataAssocResult = pageData.CreateVectorFromBean();
		pageData.executeFromString(agentGroupsDataQueryAssoc);
		agentgroupAssocDataResult = pageData.CreateVectorFromBean();
		pageData.executeFromString(campaignsDataQueryAssoc);
		campaignsAssocDataResult = pageData.CreateVectorFromBean();
		pageData.executeFromString(callinglistDataQueryAssoc);
		callinglistAssocDataResult = pageData.CreateVectorFromBean();
		pageData.executeFromString(routingscriptDataQueryAssoc);
		routingscriptsAssocDataResult = pageData.CreateVectorFromBean();
		pageData.executeFromString(getThisUserInfos);
		getThisUserDataResult = pageData.CreateVectorFromBean();		
	}
	
	
	/* setup informations in */
	if( !IS_IN_ADDMODE )
	{ 
		if( getThisUserDataResult.size() != 1 )
		{
			//out.write("<strong>"+pageData.getWord("CRITICAL ERROR")+" : "+pageData.getWord("Unable to retrieve user informations.")+"</strong>");
			%>
			 <jsp:include page="no_data.htm"></jsp:include>
			<%
			return; /* Do not display anymore exit the page*/
		}
		else
		{
			this_username 		= (String)getThisUserDataResult.elementAt(0).get("USERNAME");
			this_live_username 	= (String)getThisUserDataResult.elementAt(0).get("NUMERIC_LOGIN");
			this_password 		= (String)getThisUserDataResult.elementAt(0).get("PASSWORD");
			this_livepassword 	= (String)getThisUserDataResult.elementAt(0).get("NUMERIC_PASS");
			this_active 		= (String)getThisUserDataResult.elementAt(0).get("STATE");	
		}		
	}	
%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<style type="text/css">

.dynamic-tab-pane-control .tab-page {
	height:		200px;
}

.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}

html, body {
	background:	#E1F4FF;
}

form {
	margin:		0;
	padding:	0;
}

/* over ride styles from webfxlayout */

body {
	margin:		10px;
	width:		auto;
	height:		auto;
}

.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}

.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
}

.dynamic-tab-pane-control a:hover {
	background: transparent;
}
</style>
<title>User Management</title>

<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script>
var systemRoles = new Array();//this array holds the system-defined roles
<%
	String previous_role 	= "";
	String current_role		= "";
	rs = pageData.executeFromString("SELECT * FROM `cfg_predefined_user_roles`");
	out.println("var PredefinedRolesContained = new Array();");
	while(rs.next()){
		current_role = rs.getString("ROLE_NAME");
			out.println(" PredefinedRolesContained[\""+current_role+"\"] = new Array();");
					
		 	//System config
			if(rs.getBoolean("ALLOW_CONFIGURATION_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_CONFIGURATION_MANAGEMENT\"); ");
			//System.out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_CONFIGURATION_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_TENANT_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_TENANT_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_USER_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_USER_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_NETWORK_CONFIGURATION"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_NETWORK_CONFIGURATION\"); ");
				
			// Quality Monitoring and reports
			if( rs.getBoolean("ALLOW_QUALITY_MONITORING_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_QUALITY_MONITORING_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_HISTORICAL_LINEMANAGEMENT_REPORTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_HISTORICAL_LINEMANAGEMENT_REPORTS_MANAGEMENT\"); ");
				
			//Live statistics				
			if( rs.getBoolean("ALLOW_VIEW_LIVE_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_LIVE_STATS\"); ");
			if( rs.getBoolean("ALLOW_VIEW_AGENT_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_AGENT_STATS\"); ");
			if( rs.getBoolean("ALLOW_VIEW_AGENTGROUP_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_AGENTGROUP_STATS\"); ");
			if( rs.getBoolean("ALLOW_VIEW_QUEUES_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_QUEUES_STATS\"); ");
			if( rs.getBoolean("ALLOW_VIEW_CAMPAIGN_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_CAMPAIGN_STATS\"); ");
			if( rs.getBoolean("ALLOW_VIEW_CALLING_LIST_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_CALLING_LIST_STATS\"); ");
			if( rs.getBoolean("ALLOW_VIEW_PERFOMANCE_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_PERFOMANCE_STATS\"); ");
			if( rs.getBoolean("ALLOW_VIEW_TEAM_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_TEAM_STATS\"); ");
			if( rs.getBoolean("ALLOW_VIEW_ADHERENCE_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_ADHERENCE_STATS\"); ");
			if( rs.getBoolean("ALLOW_VIEW_LINE_MANAGEMENT_STATS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_VIEW_LINE_MANAGEMENT_STATS\"); ");
				
			//Tenants and Ressources			
			if( rs.getBoolean("ALLOW_TENANT_VIEW"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_TENANT_VIEW\"); ");
			if( rs.getBoolean("ALLOW_RESSOURCES_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_RESSOURCES_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_AGENT_GROUPS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_AGENT_GROUPS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_AGENT_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_AGENT_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_CAMPAIGN_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_CAMPAIGN_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_CALLING_LIST_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_CALLING_LIST_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_DONOTCALL_LIST_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_DONOTCALL_LIST_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_FILTER_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_FILTER_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_TREATMENTS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_TREATMENTS_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_NOT_READY_REASON_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_NOT_READY_REASON_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_QUEUES_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_QUEUES_MANAGEMENT\"); ");
			if( rs.getBoolean("ALLOW_SKILLS_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_SKILLS_MANAGEMENT\"); ");
				
			//Finances and Methods of payment			
			if( rs.getBoolean("ALLOW_FINANCIAL_CONFIGURATION"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_FINANCIAL_CONFIGURATION\"); ");
			if( rs.getBoolean("ALLOW_FINANCIAL_REPORTS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_FINANCIAL_REPORTS\"); ");
				
			//Work Force
			if( rs.getBoolean("ALLOW_WORK_FORCE_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_WORK_FORCE_MANAGEMENT\"); ");
				
			//Message center
			if( rs.getBoolean("ALLOW_MESSAGE_CENTER_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_MESSAGE_CENTER_MANAGEMENT\"); ");
				
			//Call routing scripts
			if( rs.getBoolean("ALLOW_ROUTING_SCRIPT_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_ROUTING_SCRIPT_MANAGEMENT\"); ");
				
			//Manager features
			if( rs.getBoolean("ALLOW_MANAGER_CHANGE_AGENT_STATUS"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_MANAGER_CHANGE_AGENT_STATUS\"); ");
			if( rs.getBoolean("ALLOW_MANAGER_LOGGED_OUT_AGENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_MANAGER_LOGGED_OUT_AGENT\"); ");
			if( rs.getBoolean("ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP\"); ");
			if( rs.getBoolean("ALLOW_MANAGER_LIVE_MONITORING"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_MANAGER_LIVE_MONITORING\"); ");
			if( rs.getBoolean("ALLOW_MANAGER_WHISPER_TOAGENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_MANAGER_WHISPER_TOAGENT\"); ");
			if( rs.getBoolean("ALLOW_MANAGER_AUDIO_MONITORING"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_MANAGER_AUDIO_MONITORING\"); ");
				
			//Screen monitoring
			if( rs.getBoolean("ALLOW_MANAGER_SCREEN_MONITORING"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_MANAGER_SCREEN_MONITORING\"); ");
						
			previous_role = current_role;
		
	}
%>
</script>
<script language="javascript" type="text/javascript" src="userManagementFunctions.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script>

<% out.write( "var is_in_addmode = "+(IS_IN_ADDMODE ? "true" : "false" )+";" ); %> /* build the javascript variable */

/* home javascript */
/* validate -- add info */
function UserValidateInfo()
{
	var valid_info = true;
	var active_value = null;
	var assigned_ressources = "";
	var xml_message = "";
	var password = "";
	var live_password = "";
	var curr_username ="";
	var old_username="";
	var old_live_username="";
	var curr_num_login="";
	var i =0;
	var allUsers = String(appletObj.getUsers());
	var all_users = allUsers  + "";
	array_users = all_users.split("|");
	
	if( valid_info )
		if(document.theForm.assigned_TENANTS.options.length == 0)
		{
			alert("<%=pageData.getWord("Assign at least one tenant")%>");
			tp1.setSelectedIndex( 2 );
			valid_info = false;
		}
	
	if( valid_info )
		if(document.theForm.username.value == "")
		{
			alert("<%=pageData.getWord("Specify User name")%>");
			tp1.setSelectedIndex( 0 );
			document.theForm.username.focus();
			valid_info = false;
		}
		
	if( valid_info )
	{
		if(is_in_addmode)
		{
			if(document.theForm.password.value == "")
			{
				alert("<%=pageData.getWord("Specify user password")%>");
				valid_info = false;
				tp1.setSelectedIndex( 0 );
				document.theForm.password.focus();
			}
		}		
	}
	if( valid_info )
		if(document.theForm.livemonitoringlogin.value == "" && document.theForm.livemonitoringpassword.value != "")
		{
			alert("<%=pageData.getWord("Specify live monitoring numeric login")%>");
			valid_info = false;
			tp1.setSelectedIndex( 0 );
			document.theForm.livemonitoringlogin.focus();	
		}
	if( valid_info )
		if(document.theForm.livemonitoringpassword.value == "" && document.theForm.livemonitoringlogin.value != "")
		{
			if(is_in_addmode){
				alert("<%=pageData.getWord("Specify live monitoring numeric password")%>");
				valid_info = false;
				tp1.setSelectedIndex( 0 );
				document.theForm.livemonitoringpassword.focus();
			}
		}
	if( valid_info )
		if((document.theForm.livemonitoringlogin.value != "" && !IsNumeric(document.theForm.livemonitoringlogin.value)))		
		{
			alert("<%=pageData.getWord("The live monitoring login must be numeric")%>");
			valid_info = false;
			tp1.setSelectedIndex( 0 );
			document.theForm.livemonitoringlogin.focus();						
		}
	if( valid_info )
		if((document.theForm.livemonitoringpassword.value != "" && !IsNumeric(document.theForm.livemonitoringpassword.value)))			
		{
			alert("<%=pageData.getWord("The live monitoring password must be numeric")%>");
			valid_info = false;
			tp1.setSelectedIndex( 0 );
			document.theForm.livemonitoringlogin.focus();						
		}
	if( valid_info )
	{
		if( is_in_addmode )
		{
			if(document.theForm.password.value != document.theForm.password2.value)
			{
				alert("<%=pageData.getWord("Passwords do not match.")%>");
				valid_info = false;
				tp1.setSelectedIndex( 0 );
				document.theForm.password.focus();
			}
		}
	}
	if( valid_info )
		if(document.theForm.livemonitoringpassword.value != document.theForm.livemonitoringpassword2.value)
		{
			alert("<%=pageData.getWord("Live monitoring passwords do not match.")%>");
			valid_info = false;
			tp1.setSelectedIndex( 0 );
			document.theForm.livemonitoringpassword.focus();	
		}
	var this_user_dbid ="<%=(String)session.getAttribute("CURRENT_USER_DBID")%>";
	var dbid = document.theForm.userdbid.value;		
	if(document.theForm.active.checked)
		active_value = "1";
	else if(this_user_dbid == dbid){
			alert("You cannot desactiavate your own account while logged in. Please log in with another account with adequate privileges and desactivate the desired account.");
			document.theForm.active.checked = true;
			valid_info = false;
		}
	else
		active_value = "0";
		
	if( valid_info )
	{
		if( is_in_addmode )
		{
			password 		= document.theForm.password.value;
			live_password 	= document.theForm.livemonitoringpassword.value;
		}
		else
		{
			if(document.theForm.password.value != "") 
				password = document.theForm.password.value;
			else
				password = document.theForm.old_password.value;
				
			if( document.theForm.livemonitoringpassword.value != "" )
				live_password = document.theForm.livemonitoringpassword.value;
			else
				live_password = document.theForm.old_live_password.value;
		}
	}
/***************************************************/	
	if(valid_info)
	{
		curr_username = document.theForm.username.value;
		if(is_in_addmode)
		{	
			
			for (i = 0; i <array_users.length; i++)
			{
				a_user = array_users[i].split(",");
				//alert("username: "+a_user);
				if(a_user[2]==curr_username)
				{
					alert("<%=pageData.getWord("The username entered is already in use. Please, choose another one.")%>");
					valid_info = false;
					break;
				}
			}
		}
		else{
			old_username = "<%=this_username%>";
			if(old_username!=curr_username)
			{
				for (i = 0; i <array_users.length; i++)
				{
					a_user = array_users[i].split(",");
					//alert("username: "+a_user);
					if(a_user[2]==curr_username)
					{
						alert("<%=pageData.getWord("The username entered is already in use. Please, choose another one.")%>");
						valid_info = false;
						break;
					}
				}						
			}		
		}
	}	
	
	if(valid_info)
	{	
		curr_num_login = document.theForm.livemonitoringlogin.value;
		if(is_in_addmode)
		{
			for (i = 0; i <array_users.length; i++)
			{
				a_user = array_users[i].split(",");
				if (a_user[5]==curr_num_login && curr_num_login!="")
				{
					alert("<%=pageData.getWord("The 'Live monitoring login' entered is already in use. Please, choose another one.")%>");
					valid_info = false;
					break;
				}
			}
		}
		else
		{
			old_live_username="<%=this_live_username%>";
			if(old_live_username!=curr_num_login && curr_num_login!="")
			{
				for (i = 0; i <array_users.length; i++)
				{
					a_user = array_users[i].split(",");
					if (a_user[5]==curr_num_login)
					{
						alert("<%=pageData.getWord("The 'Live monitoring login' entered is already in use. Please, choose another one.")%>");
						valid_info = false;
						break;
					}
				}		
			}	
		}
	}
/**********************************************************/	
	/// From here, we know if form is valide
	if(valid_info)
	{
		xml_message += "<MSG_TYPE_MODIFY_USER>";
			xml_message += "<dbid>"+document.theForm.userdbid.value+"</dbid>";
			xml_message += "<name>"+document.theForm.username.value+"</name>";
			//the is_in_addmode is superfluous in this statement since
			//we already checked that the value is not null when in addmode
			if(is_in_addmode || document.theForm.password.value != ""){
				xml_message += "<password>"+appletObj.getSHA1Password(password)+"</password>";
			}
			else{
				xml_message += "<password>"+ password + "</password>";
			}
			xml_message += "<livemonitoringlogin>"+document.theForm.livemonitoringlogin.value+"</livemonitoringlogin>";
			xml_message += "<livemonitoringpassword>"+live_password+"</livemonitoringpassword>";
			xml_message += "<active>"+active_value+"</active>";
			xml_message += "<privileges>"+getNewRitghsStr()+"</privileges>";
			xml_message += "<allow_ressources>"+packageAllowRessources()+"</allow_ressources>";
		xml_message += "</MSG_TYPE_MODIFY_USER>";
		
		appletObj.saveUser(xml_message);		
		document.location.href = "../defaultpage.htm";
	}	
}

function deleteUser()
{
	var this_user_dbid ="<%=(String)session.getAttribute("CURRENT_USER_DBID")%>";
	var dbid = document.theForm.userdbid.value;
	
	//alert("document.theForm.userdbid.value= "+document.theForm.userdbid.value);
	var user_count =<%=(String)getCountUsersDataResult.elementAt(0).get("user_count")%>;
	
	if(this_user_dbid==dbid)
		alert("<%=pageData.getWord("You cannot delete your own account while logged in. Please log in with another account with adequate privileges and delete the desired account.")%>");
	else if(user_count=="1")
			alert("<%=pageData.getWord("You cannot delete the last active account. Subsequent logins would be impossible")%>");	
	else
	{
		var yesno = confirm("<%=pageData.getWord("Are you sure that you want to delete this user?")%>");
		if( yesno )
		{
			var dbid = document.theForm.userdbid.value;
			if( dbid != "" && dbid != null )
			{
				var message = dbid;
				appletObj.deleteUser( dbid );
				document.location.href = "../defaultpage.htm";
			}
		}
	}
}

function save_new_role()
{
	var new_role_name = "";
	var obj = document.getElementById('new_role_name');
	if( obj )	
	{		
		new_role_name = obj.value;
		if( (new_role_name == "") || (allSpaces(new_role_name)=='0') )
			alert("<%=pageData.getWord("Please specify the new role name.")%>");
		else if(!isValidName(new_role_name))
			alert(MultiArray["Invalid use of character"][lang]);
		else
		{
			var already_exist = false;
			new_role_name = trimLeadingSpace(new_role_name);
			new_role_name = trimTrailingSpace(new_role_name);
			for(var role in PredefinedRolesContained)
			{
				if( role == new_role_name )
				{
					already_exist = true;
					break;
				}
			}
			
			if( already_exist )
				alert("<%=pageData.getWord("A role with same name already exists.")%>");
			else
			{
				var array_strings = new Array();
				var objs = document.getElementsByTagName('input');	
				for(var i = 0; i < objs.length; i++)
					if( objs[i].type == 'checkbox' )
						if( objs[i].id.indexOf("ALLOW_") == 0 || objs[i].name.indexOf("ALLOW_") == 0)
							if( objs[i].checked )
								array_strings.push((objs[i].id.indexOf("ALLOW_") == 0 ? objs[i].id : objs[i].name) + '=');
				
				if( array_strings.length == 0 )
					alert("<%=pageData.getWord("Please check at least one privilege.")%>");
				else
				{
					var privileges_str = array_strings.join('&');
							
					var tmpFile = null;			
					tmpFile = document.createElement("script");	
					tmpFile.src = "user_management_roles.js.jsp?actionType=SAVE_ROLE&role_name="+new_role_name+"&"+privileges_str+"&rand="+Math.random();				
					tmpFile.type = "text/javascript"; 
					document.body.appendChild(tmpFile);
					var test = privileges_str.replace(/=&/g, ",").replace(/=/, "");// alert("test = "+test);
					/* add the new role */
					addOptionToSelect(document.theForm.role, new_role_name, test);
					deductRoleFromCheckedOptions();
				}
			}
		}
	}
}

function deleteSelectedRole()
{
	var role_name = "";
	var obj = document.theForm.role;
	
	for( var i = 0; i < obj.options.length; i++ )
	{
		if( obj.options[i].selected )
		{
			role_name = obj.options[i].value; 
			break;		
		}
	}
	
	if( role_name != "" )
	{
		var yesno = confirm(""+role_name+" --- "+"<%=pageData.getWord("Are you sure that you want to delete this role?")%>");
		
		if( yesno )
		{		
			var tmpFile = null;			
			tmpFile = document.createElement("script");	
			tmpFile.src = "user_management_roles.js.jsp?actionType=REMOVE_ROLE&role_name="+role_name+"&rand="+Math.random();				
			tmpFile.type = "text/javascript";
			document.body.appendChild(tmpFile);
			
			/* remove the role from the list of all roles */
			retrieveOptionFromSelect( document.theForm.role, role_name );
			delete PredefinedRolesContained[role_name];
			deductRoleFromCheckedOptions();
		}
	}
}
function fill_fields()
{
	//Remplir les differents champs
	var agentGroups = String( appletObj.getAgentGroupsByStatusAndTenant("1", document.theForm.tenant_id.value) );
	jsagentGroupsArray = agentGroups.split("|");
	for(i=0; i < jsagentGroupsArray.length; i++)
	{
		thisAgentGroup = jsagentGroupsArray[i].split(",");
		tmpOption = new Option(thisAgentGroup[1], thisAgentGroup[0]);
		//document.write("<option value=\""+thisAgentGroup[0]+"\" >"+thisAgentGroup[1]+"</option>");
		var nb_options = document.theForm.available_groups.options.length;
		document.theForm.available_groups.options[nb_options] = tmpOption;
	}
}
function KeyDownHandler(btn)
{
	// process only the Enter key
	if (event.keyCode == 13)
	{
		// cancel the default submit
		event.returnValue=false;
		event.cancel = true;
		// submit the form by programmatically clicking the specified button
		btn.click();
	}
}

function displayMC() {
	if(!appletObj.getIsMessageCenterAllowed()){
		 document.getElementById('ALLOW_MESSAGE_CENTER_MANAGEMENT').checked = false; 
		document.getElementById('ALLOW_MESSAGE_CENTER_MANAGEMENT').disabled = true;
	}
}

function displaySC() {
        if(!appletObj.getIsScreenCaptureAllowed()){
                 document.getElementById('ALLOW_MANAGER_SCREEN_MONITORING').checked = false;
                document.getElementById('ALLOW_MANAGER_SCREEN_MONITORING').disabled = true;
        }
}

</script>
</head>

<body class="bottompagebody" TEXT="#000000" LINK="#000066" VLINK="#666666" > 
<div class="tab-pane" id="tabPane1">
<form name="theForm" onKeyDown="KeyDownHandler(save)">
<input type="hidden" name="userdbid" id="userdbid" value="<%=this_user_dbid%>">
<input type="hidden" name="old_password" id="old_password" value="<%=this_password%>">
<input type="hidden" name="old_live_password" id="old_live_password" value="<%=this_livepassword%>">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
	<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><%=pageData.getWord("General")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<table border="0">		  
		  <tr>
			<td><%=pageData.getWord("User name")%></td>
			<td><input name="username" type="text" value="<%=this_username%>"></td>
		  </tr>
		  <tr>
			<td><%=pageData.getWord("Password")%></td>
			<td><input name="password" id="password" type="password"></td>
		  </tr>
		  <tr>
			<td><%=pageData.getWord("Retype password")%></td>
			<td><input name="password2" id="password2" type="password" onBlur="return validPassword();"></td>
		  </tr>
		  <tr>
			<td><%=pageData.getWord("Live monitoring login")%></td>
			<td><input name="livemonitoringlogin" type="text" size="10" value="<%=this_live_username%>"></td>
		  </tr>
		  <tr>
			<td><%=pageData.getWord("Live monitoring password")%></td>
			<td><input name="livemonitoringpassword" type="password" size="10"></td>
		  </tr>
		  <tr>
			<td><%=pageData.getWord("Retype live monitoring password")%></td>
			<td><input name="livemonitoringpassword2" type="password" size="10"></td>
		  </tr>
		  <tr>
			<td><%=pageData.getWord("Active")%></td>
			<td><input name="active" type="checkbox" <% if( IS_IN_ADDMODE ) out.write("checked"); else if(this_active.compareTo("1") == 0) out.write("checked"); %>></td>
		  </tr>
		</table>
	</div>	
	
	<div class="tab-page" id="tabPrivileges">
		<h2 class="tab"><%=pageData.getWord("Privilegies")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPrivileges" ) );</script>
		<table cellpadding="0" cellspacing="0"><tr><td>
		<%=pageData.getWord("Predefined Roles")%> : 
			<select onChange="roleSelected(this.value)" name="role">			
				<%
					String predefineRole = "";
					boolean custom = false;
					//int numOfRoles = rolesFullDataResult.size();
					rs.beforeFirst();
					while(rs.next()){
						predefineRole = (rs.getString("ROLE_NAME"));
						custom = (rs.getBoolean("CUSTOM"));
						System.out.println("predefineRole: " + predefineRole + " custom: " + custom);
						//get the role name's translation if this is a user-defined role.
						if(custom){
			%>						
						<option value="<%=predefineRole %>"><%=predefineRole %></option>						
			<%
						}else{		%>
						
						<option value="<%=predefineRole %>"><%=pageData.getWord(predefineRole) %></option>
							<!-- //out.write("<option value=\""+predefineRole+"\">"+pageData.getWord(predefineRole)+"</option>"); --->
						<script type="text/javascript">
							systemRoles.push("<%=predefineRole %>");
						</script>
						
			<%
						}
					}//while
				%>
				<option value="ROLE_CUSTOM" selected="selected"><%=pageData.getWord("Custom")%></option>		
			</select>
		</td><td id="save_current_custom_role_td">
			
		</td></tr>
		</table>
		
		<br>
		<table width="100%"><tr><td width="50%" align="left" valign="top">
				
				<fieldset><legend><%=pageData.getWord("System configurations")%></legend>
				<table cellpadding="0" cellspacing="0" width="100%">					
					<tr><td><%=pageData.getWord("Configuration management")%></td><td width="20"><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_CONFIGURATION_MANAGEMENT" name="ALLOW_CONFIGURATION_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Tenant Management")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_TENANT_MANAGEMENT" name="ALLOW_TENANT_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("User Management")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_USER_MANAGEMENT" name="ALLOW_USER_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Network Configuration")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_NETWORK_CONFIGURATION" name="ALLOW_NETWORK_CONFIGURATION"></td></tr>					
				</table>
				</fieldset><br>
				
				<fieldset><legend><%=pageData.getWord("Quality Monitoring and reports")%></legend>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr><td><%=pageData.getWord("Quality Monitoring")%></td><td width="20"><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_QUALITY_MONITORING_MANAGEMENT" name="ALLOW_QUALITY_MONITORING_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Agents conversation")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT" name="ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Agent listening report")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT" name="ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Historical Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Agent Details Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Agent Groups Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Agent summary reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Outbound call reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Inbound call reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Agent Login Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Campaign Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Calling List Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Queue Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Group Forecast Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Group Summary Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Line Management Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_HISTORICAL_LINEMANAGEMENT_REPORTS_MANAGEMENT" name="ALLOW_HISTORICAL_LINEMANAGEMENT_REPORTS_MANAGEMENT"></td></tr>

				</table>
				</fieldset><br>
				
				<fieldset><legend><%=pageData.getWord("Live statistics")%></legend>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr><td><%=pageData.getWord("View live statistics")%></td><td width="20"><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_LIVE_STATS" name="ALLOW_VIEW_LIVE_STATS"></td></tr>
					<tr><td><%=pageData.getWord("Agents")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_AGENT_STATS" name="ALLOW_VIEW_AGENT_STATS"></td></tr>
					<tr><td><%=pageData.getWord("Agent Groups")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_AGENTGROUP_STATS" name="ALLOW_VIEW_AGENTGROUP_STATS"></td></tr>
					<tr><td><%=pageData.getWord("Queues")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_QUEUES_STATS" name="ALLOW_VIEW_QUEUES_STATS"></td></tr>
					<tr><td><%=pageData.getWord("Campaigns")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_CAMPAIGN_STATS" name="ALLOW_VIEW_CAMPAIGN_STATS"></td></tr>
					<tr><td><%=pageData.getWord("Calling lists")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_CALLING_LIST_STATS" name="ALLOW_VIEW_CALLING_LIST_STATS"></td></tr>
					<tr><td><%=pageData.getWord("Performance")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_PERFOMANCE_STATS" name="ALLOW_VIEW_PERFOMANCE_STATS"></td></tr>
					<tr><td><%=pageData.getWord("Teams")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_TEAM_STATS" name="ALLOW_VIEW_TEAM_STATS"></td></tr>
					<tr><td><%=pageData.getWord("adherence")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_ADHERENCE_STATS" name="ALLOW_VIEW_ADHERENCE_STATS"></td></tr>
					<tr><td><%=pageData.getWord("Line management")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_VIEW_LINE_MANAGEMENT_STATS" name="ALLOW_VIEW_LINE_MANAGEMENT_STATS"></td></tr>
				</table>
				</fieldset><br>				
		
		</td><td width="50%" align="right" valign="top">
		
				<fieldset><legend><%=pageData.getWord("Tenants and Ressources")%></legend>
				<table cellpadding="0" cellspacing="0" width="100%">					
					<tr><td><%=pageData.getWord("Tenant")%></td><td width="20"><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_TENANT_VIEW" name="ALLOW_TENANT_VIEW"></td></tr>
					<tr><td><%=pageData.getWord("Resources")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_RESSOURCES_MANAGEMENT" name="ALLOW_RESSOURCES_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Agent Groups")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_AGENT_GROUPS_MANAGEMENT" name="ALLOW_AGENT_GROUPS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Agents")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_AGENT_MANAGEMENT" name="ALLOW_AGENT_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Campaigns")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_CAMPAIGN_MANAGEMENT" name="ALLOW_CAMPAIGN_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Calling lists")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_CALLING_LIST_MANAGEMENT" name="ALLOW_CALLING_LIST_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Do-not-call lists")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_DONOTCALL_LIST_MANAGEMENT" name="ALLOW_DONOTCALL_LIST_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Filters")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_FILTER_MANAGEMENT" name="ALLOW_FILTER_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Treatments")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_TREATMENTS_MANAGEMENT" name="ALLOW_TREATMENTS_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Not-ready reasons")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_NOT_READY_REASON_MANAGEMENT" name="ALLOW_NOT_READY_REASON_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Queues")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_QUEUES_MANAGEMENT" name="ALLOW_QUEUES_MANAGEMENT"></td></tr>
					<tr><td><%=pageData.getWord("Agent skills")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_SKILLS_MANAGEMENT" name="ALLOW_SKILLS_MANAGEMENT"></td></tr>
				</table>
				</fieldset><br>
				<fieldset><legend><%=pageData.getWord("Finances and Methods of payment")%></legend>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr><td><%=pageData.getWord("Financial configuration")%></td><td width="20"><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_FINANCIAL_CONFIGURATION" name="ALLOW_FINANCIAL_CONFIGURATION"></td></tr>
					<tr><td><%=pageData.getWord("Financial Reports")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_FINANCIAL_REPORTS" name="ALLOW_FINANCIAL_REPORTS"></td></tr>				
				</table>
				</fieldset><br>
				
				<fieldset><legend><%=pageData.getWord("Work Force")%></legend>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr><td><%=pageData.getWord("Work Force Management")%></td><td width="20"><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_WORK_FORCE_MANAGEMENT" name="ALLOW_WORK_FORCE_MANAGEMENT"></td></tr>
				</table>
				</fieldset><br>
				
				<fieldset><legend><%=pageData.getWord("Message center")%></legend>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr><td><%=pageData.getWord("Message center")%></td><td width="20">
					<%
						if(pageData.userHasRight(getAuthLicenseItemResult, "ALLOW_MESSAGE_CENTER_MANAGEMENT")) {
							out.write("<input type='checkbox' onClick='boxclicked_byuser(this.name, this.checked)'  id='ALLOW_MESSAGE_CENTER_MANAGEMENT' name='ALLOW_MESSAGE_CENTER_MANAGEMENT'>");
						}else{
							out.write("<input type='checkbox'id='ALLOW_MESSAGE_CENTER_MANAGEMENT' name='ALLOW_MESSAGE_CENTER_MANAGEMENT' >");
							out.write("<script>displayMC();</script>");
						} 
					%>
					</td></tr>
				</table>
				</fieldset><br>
				
				<fieldset><legend><%=pageData.getWord("Call routing scripts")%></legend>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr><td><%=pageData.getWord("Routing scripts")%></td><td width="20"><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_ROUTING_SCRIPT_MANAGEMENT" name="ALLOW_ROUTING_SCRIPT_MANAGEMENT"></td></tr>
				</table>
				</fieldset><br>
				<fieldset><legend><%=pageData.getWord("Manager features")%></legend>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr><td><%=pageData.getWord("Change agent status")%></td><td width="20"><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_MANAGER_CHANGE_AGENT_STATUS" name="ALLOW_MANAGER_CHANGE_AGENT_STATUS"></td></tr>
					<tr><td><%=pageData.getWord("Logged agents out")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_MANAGER_LOGGED_OUT_AGENT" name="ALLOW_MANAGER_LOGGED_OUT_AGENT"></td></tr>
					<tr><td><%=pageData.getWord("Logged agents group out")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP" name="ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP"></td></tr>
					<tr><td><%=pageData.getWord("Live monitoring")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_MANAGER_LIVE_MONITORING" name="ALLOW_MANAGER_LIVE_MONITORING"></td></tr>
					<tr><td><%=pageData.getWord("Whisper to agent")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_MANAGER_WHISPER_TOAGENT" name="ALLOW_MANAGER_WHISPER_TOAGENT"></td></tr>
				   <tr><td><%=pageData.getWord("Audio monitoring")%></td><td><input type='checkbox' onClick='boxclicked_byuser(this.name, this.checked)'  id='ALLOW_MANAGER_AUDIO_MONITORING' name='ALLOW_MANAGER_AUDIO_MONITORING'></td></tr>
				<tr><td><%=pageData.getWord("Screen monitoring")%></td><td>
				<% 
						if(pageData.userHasRight(getAuthLicenseItemResult, "ALLOW_MANAGER_SCREEN_MONITORING")) {
							out.write("<input type='checkbox' onClick='boxclicked_byuser(this.name, this.checked)'  id='ALLOW_MANAGER_SCREEN_MONITORING' name='ALLOW_MANAGER_SCREEN_MONITORING'>");
						}else{
							out.write("<input type='checkbox' onClick='boxclicked_byuser(this.name, this.checked)'  id='ALLOW_MANAGER_SCREEN_MONITORING' name='ALLOW_MANAGER_SCREEN_MONITORING'>");
							out.write("<script>displaySC();</script>");
						} 
				%>
				</td></tr>
	
				<!--	<tr><td><%=pageData.getWord("Whisper to customer")%></td><td><input type="checkbox" onClick="boxclicked_byuser(this.name, this.checked)"  id="ALLOW_MANAGER_WHISPER_TOCUSTOMER" name="ALLOW_MANAGER_WHISPER_TOCUSTOMER"></td></tr>	
					-->
				</table>
				</fieldset><br>
		</tr></table>
	</div>
	
	<div class="tab-page" id="tabRessources">
		<h2 class="tab"><%=pageData.getWord("Resources")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabRessources" ) );</script>
		
		<table width="100%">
		<tr>
			<td align="left" valign="top">
			<fieldset style="width:75%">
				<legend><%=pageData.getWord("Tenants")%></legend>
				<table width="100%">
					<tr >
						<td width="45%"><%=pageData.getWord("Available")%></td>
						<td >&nbsp;</td>
						<td width="45%"><%=pageData.getWord("Assigned")%></td>
					</tr>
					<tr>
						<td>
						<select multiple size="7" name="available_TENANTS" style="width:100%" onChange="changeMoveButtons('TENANTS','LEFT')">						
                          <%
									for(int i = 0; i < tenantDataResult.size(); i++)
										out.write("<option value=\""+tenantDataResult.elementAt(i).get("dbid")+"\">"+tenantDataResult.elementAt(i).get("name")+"</option>");
								%>
                        </select></td>
						<td align="center">
							<input id="b_add_TENANTS" name="b_add_TENANTS" type="button" value="&gt;&gt;" disabled onClick="move_left_right('TENANTS')"><br><br>
							<input id="b_retrieve_TENANTS" name="b_retrieve_TENANTS" type="button" value="&lt;&lt;" disabled onClick="move_right_left('TENANTS')">						</td>
						<td>
							<select multiple size="7" name="assigned_TENANTS" style="width:100%" onChange="changeMoveButtons('TENANTS','RIGHT')">
								<%
									for( int i = 0; i < tenantDataAssocResult.size(); i++ )
										out.write("<option value=\""+tenantDataAssocResult.elementAt(i).get("dbid")+"\">"+tenantDataAssocResult.elementAt(i).get("name")+"</option>");
								%>
							</select>						</td>			
					</tr>			
				</table>
			</fieldset>	
			</td>
		</tr>
		<tr>
			<td align="left" valign="top">
			<fieldset style="width:75%">
				<legend><%=pageData.getWord("Campaigns")%></legend>
				<table width="100%">
					<tr>
						<td width="45%"><%=pageData.getWord("Available")%></td>
						<td>&nbsp;</td>
						<td width="45%"><%=pageData.getWord("Assigned")%></td>
					</tr>
					<tr>
						<td>
							<select multiple size="7" name="available_CAMPAIGNS" style="width:100%" onChange="changeMoveButtons('CAMPAIGNS','LEFT')">
								<%
									for(int i = 0; i < campaignsDataResult.size(); i++)
										out.write("<option value=\""+campaignsDataResult.elementAt(i).get("dbid")+"\">"+campaignsDataResult.elementAt(i).get("name")+"</option>");
								%>
							</select>
						</td>
						<td align="center">
							<input id="b_add_CAMPAIGNS" name="b_add_CAMPAIGNS" type="button" value="&gt;&gt;" disabled onClick="move_left_right('CAMPAIGNS')"><br><br>
							<input id="b_retrieve_CAMPAIGNS" name="b_retrieve_CAMPAIGNS" type="button" value="&lt;&lt;" disabled onClick="move_right_left('CAMPAIGNS')">
						</td>
						<td>	
							<select multiple size="7" name="assigned_CAMPAIGNS" style="width:100%" onChange="changeMoveButtons('CAMPAIGNS','RIGHT')">
								<%
									for(int i = 0; i < campaignsAssocDataResult.size(); i++)
										out.write("<option value=\""+campaignsAssocDataResult.elementAt(i).get("dbid")+"\">"+campaignsAssocDataResult.elementAt(i).get("name")+"</option>");
								%>
							</select>
						</td>			
					</tr>			
				</table>
			</fieldset>
			</td>
		</tr>
		<tr>
			<td align="left" valign="top">
			<fieldset style="width:75%">				
				<legend><%=pageData.getWord("Calling lists")%></legend>
				<table width="100%">
					<tr>
						<td width="45%"><%=pageData.getWord("Available")%></td>
						<td>&nbsp;</td>
						<td width="45%"><%=pageData.getWord("Assigned")%></td>
					</tr>
					<tr>
						<td>
							<select multiple size="7" name="available_CALLINGLISTS" style="width:100%" onChange="changeMoveButtons('CALLINGLISTS','LEFT')">
								<%
									for(int i = 0; i < callinglistDataResult.size(); i++)
										out.write("<option value=\""+callinglistDataResult.elementAt(i).get("dbid")+"\">"+callinglistDataResult.elementAt(i).get("name")+"</option>");
								%>
							</select>
						</td>
						<td align="center">
							<input id="b_add_CALLINGLISTS" name="b_add_CALLINGLISTS" type="button" value="&gt;&gt;" disabled onClick="move_left_right('CALLINGLISTS')"><br><br>
							<input id="b_retrieve_CALLINGLISTS" name="b_retrieve_CALLINGLISTS" type="button" value="&lt;&lt;" disabled onClick="move_right_left('CALLINGLISTS')">
						</td>
						<td>					
							<select multiple size="7" name="assigned_CALLINGLISTS" style="width:100%" onChange="changeMoveButtons('CALLINGLISTS','RIGHT')">
								<%
									for(int i = 0; i < callinglistAssocDataResult.size(); i++)
										out.write("<option value=\""+callinglistAssocDataResult.elementAt(i).get("dbid")+"\">"+callinglistAssocDataResult.elementAt(i).get("name")+"</option>");
								%>
							</select>
						</td>			
					</tr>			
				</table>		
			</fieldset>		
			</td>
		</tr>
		<tr>
			<td width="50%" align="left" valign="top">			
			<fieldset style="width:75%">				
				<legend><%=pageData.getWord("Agent Groups")%></legend>
				<table width="100%">
					<tr>
						<td width="45%"><%=pageData.getWord("Available")%></td>
						<td>&nbsp;</td>
						<td width="45%"><%=pageData.getWord("Assigned")%></td>
					</tr>
					<tr>
						<td>
							<select multiple size="7" name="available_AGENTGROUPS" style="width:100%" onChange="changeMoveButtons('AGENTGROUPS', 'LEFT')">
								<%
									for(int i = 0; i < agentgroupDataResult.size(); i++)
										out.write("<option value=\""+agentgroupDataResult.elementAt(i).get("dbid")+"\">"+agentgroupDataResult.elementAt(i).get("name")+"</option>");
								%>
							</select>
						</td>
						<td align="center">
							<input id="b_add_AGENTGROUPS" name="b_add_AGENTGROUPS" type="button" value="&gt;&gt;" disabled onClick="move_left_right('AGENTGROUPS')"><br><br>
							<input id="b_retrieve_AGENTGROUPS" name="b_retrieve_AGENTGROUPS" type="button" value="&lt;&lt;" disabled onClick="move_right_left('AGENTGROUPS')">
						</td>
						<td>					
							<select multiple size="7" name="assigned_AGENTGROUPS" style="width:100%" onChange="changeMoveButtons('AGENTGROUPS', 'RIGHT')">
								<%
									for(int i = 0; i < agentgroupAssocDataResult.size(); i++)
										out.write("<option value=\""+agentgroupAssocDataResult.elementAt(i).get("dbid")+"\">"+agentgroupAssocDataResult.elementAt(i).get("name")+"</option>");
								%>
							</select>
						</td>			
					</tr>			
				</table>		
			</fieldset>	
			</td>
		</tr>
		<tr>
			<td align="left" valign="top">
			<fieldset style="width:75%">				
				<legend><%=pageData.getWord("Routing scripts")%></legend>
				<table width="100%">
					<tr>
						<td width="45%"><%=pageData.getWord("Available")%></td>
						<td>&nbsp;</td>
						<td width="45%"><%=pageData.getWord("Assigned")%></td>
					</tr>
					<tr>
						<td>
							<select multiple size="7" name="available_ROUTINGSCRIPTS" style="width:100%" onChange="changeMoveButtons('ROUTINGSCRIPTS', 'LEFT')">
								<%
									for(int i = 0; i < routingscriptsDataResult.size(); i++)
										out.write("<option value=\""+routingscriptsDataResult.elementAt(i).get("dbid")+"\">"+routingscriptsDataResult.elementAt(i).get("script_name")+"</option>");
								%>
							</select>
						</td>
						<td align="center">
							<input id="b_add_ROUTINGSCRIPTS" name="b_add_ROUTINGSCRIPTS" type="button" value="&gt;&gt;" disabled onClick="move_left_right('ROUTINGSCRIPTS')"><br><br>
							<input id="b_retrieve_ROUTINGSCRIPTS" name="b_retrieve_ROUTINGSCRIPTS" type="button" value="&lt;&lt;" disabled onClick="move_right_left('ROUTINGSCRIPTS')">
						</td>
						<td>
							<select multiple size="7" name="assigned_ROUTINGSCRIPTS" style="width:100%" onChange="changeMoveButtons('ROUTINGSCRIPTS', 'RIGHT')">
								<%
									for(int i = 0; i < routingscriptsAssocDataResult.size(); i++)
										out.write("<option value=\""+routingscriptsAssocDataResult.elementAt(i).get("dbid")+"\">"+routingscriptsAssocDataResult.elementAt(i).get("script_name")+"</option>");
								%>
							</select>
						</td>			
					</tr>			
				</table>		
			</fieldset>		
			</td>
		</tr>
		</table>
			
	</div>
	
	<% if( IS_IN_ADDMODE ) 
	{
	%>
		<input id="save" name="" type="button" value="<%=pageData.getWord("Add user")%>" onClick="UserValidateInfo()">
	<% 
	}
	else 
	{	%>
		<input id="save" name="" type="button" value="<%=pageData.getWord("Modify user")%>" onClick="UserValidateInfo()">
		<input name="" type="button" value="<%=pageData.getWord("Delete user")%>" onClick="deleteUser()">
		<%
	}
	%>
	
</form>
</div>
<%
	/* remove the left allow ressources who are already on the right */
	
	out.write("<script>");
	for( int i = 0 ; i < tenantDataAssocResult.size(); i++ )
		out.write("retrieveOptionFromSelect( document.theForm.available_TENANTS , '"+tenantDataAssocResult.elementAt(i).get("dbid")+"' );");
	for( int i = 0 ; i < agentgroupAssocDataResult.size(); i++ )
		out.write("retrieveOptionFromSelect( document.theForm.available_AGENTGROUPS , '"+agentgroupAssocDataResult.elementAt(i).get("dbid")+"' );");
	for( int i = 0 ; i < campaignsAssocDataResult.size(); i++ )
		out.write("retrieveOptionFromSelect( document.theForm.available_CAMPAIGNS , '"+campaignsAssocDataResult.elementAt(i).get("dbid")+"' );");
	for( int i = 0 ; i < callinglistAssocDataResult.size(); i++ )
		out.write("retrieveOptionFromSelect( document.theForm.available_CALLINGLISTS , '"+callinglistAssocDataResult.elementAt(i).get("dbid")+"' );");
	for( int i = 0 ; i < routingscriptsAssocDataResult.size(); i++ )
		out.write("retrieveOptionFromSelect( document.theForm.available_ROUTINGSCRIPTS , '"+routingscriptsAssocDataResult.elementAt(i).get("dbid")+"' );");
	
	
	/* check all allow ressources */
	if( !IS_IN_ADDMODE )
	{ 
		if( getThisUserDataResult.size() == 1 )
		{
			HashMap this_user_row = (HashMap) getThisUserDataResult.elementAt(0);
			Set keys = this_user_row.keySet();
			Iterator it = keys.iterator();
			while( it.hasNext() )
			{
				String cur_key 		= (String)it.next();
				String cur_value 	= (String)this_user_row.get(cur_key);
				
				if( cur_key.indexOf("ALLOW_") == 0)
					out.println("changeBoxStatus('"+cur_key+"', "+( cur_value.compareTo("yes")==0 ? "true" : "false" )+");");
			}
			
			out.write("deductRoleFromCheckedOptions();");
		}
	}
	
	out.write("</script>");	
%>
<script>
   displayMC();
   displaySC();
</script>
</body>
<% pageData.closeConnection(); %>
</html>
