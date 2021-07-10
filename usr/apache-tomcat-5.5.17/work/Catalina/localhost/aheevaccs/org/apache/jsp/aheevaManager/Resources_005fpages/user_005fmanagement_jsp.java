package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;

public final class user_005fmanagement_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/Resources_pages/userManagementFunctions_labels.jsp");
  }

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");

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
			
      out.write("\r\n");
      out.write("\t\t\t ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "no_data.htm", out, false);
      out.write("\r\n");
      out.write("\t\t\t");

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

      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("\tbackground:\t#E1F4FF;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write("\r\n");
      out.write("body {\r\n");
      out.write("\tmargin:\t\t10px;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control h2 {\r\n");
      out.write("\ttext-align:\tcenter;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control h2 a {\r\n");
      out.write("\tdisplay:\tinline;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control a:hover {\r\n");
      out.write("\tbackground: transparent;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<title>User Management</title>\r\n");
      out.write("\r\n");
      out.write("<script language=\"JavaScript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("var systemRoles = new Array();//this array holds the system-defined roles\r\n");

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
			if( rs.getBoolean("ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT\"); ");
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
						
			//PopUp Builder
			if(rs.getBoolean("ALLOW_POPUP_BUILDER"))
				out.println(" PredefinedRolesContained[\""+current_role+"\"].push(\"ALLOW_POPUP_BUILDER\"); ");
				
			previous_role = current_role;
		
	}

      out.write("\r\n");
      out.write("</script>\r\n");
      out.write('\r');
      out.write('\n');

beanManagerData pageUsrMaData = new beanManagerData();
pageUsrMaData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageUsrMaData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var UsrMa= new Array();\r\n");
      out.write("\r\n");
      out.write("UsrMa[0]=\"");
      out.print( pageUsrMaData.getWord("Enter the same password") );
      out.write("\";\r\n");
      out.write("UsrMa[1]=\"");
      out.print( pageUsrMaData.getWord("Remove this role") );
      out.write("\";\r\n");
      out.write("UsrMa[2]=\"");
      out.print( pageUsrMaData.getWord("Save") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageUsrMaData.closeConnection(); 
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"userManagementFunctions.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
 out.write( "var is_in_addmode = "+(IS_IN_ADDMODE ? "true" : "false" )+";" ); 
      out.write(" /* build the javascript variable */\r\n");
      out.write("\r\n");
      out.write("/* home javascript */\r\n");
      out.write("/* validate -- add info */\r\n");
      out.write("function UserValidateInfo()\r\n");
      out.write("{\r\n");
      out.write("\tvar valid_info = true;\r\n");
      out.write("\tvar active_value = null;\r\n");
      out.write("\tvar assigned_ressources = \"\";\r\n");
      out.write("\tvar xml_message = \"\";\r\n");
      out.write("\tvar password = \"\";\r\n");
      out.write("\tvar live_password = \"\";\r\n");
      out.write("\tvar curr_username =\"\";\r\n");
      out.write("\tvar old_username=\"\";\r\n");
      out.write("\tvar old_live_username=\"\";\r\n");
      out.write("\tvar curr_num_login=\"\";\r\n");
      out.write("\tvar i =0;\r\n");
      out.write("\tvar allUsers = String(appletObj.getUsers());\r\n");
      out.write("\tvar all_users = allUsers  + \"\";\r\n");
      out.write("\tarray_users = all_users.split(\"|\");\r\n");
      out.write("\t\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t\tif(document.theForm.assigned_TENANTS.options.length == 0)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Assign at least one tenant"));
      out.write("\");\r\n");
      out.write("\t\t\ttp1.setSelectedIndex( 2 );\r\n");
      out.write("\t\t\tvalid_info = false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t\tif(document.theForm.username.value == \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Specify User name"));
      out.write("\");\r\n");
      out.write("\t\t\ttp1.setSelectedIndex( 0 );\r\n");
      out.write("\t\t\tdocument.theForm.username.focus();\r\n");
      out.write("\t\t\tvalid_info = false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(is_in_addmode)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(document.theForm.password.value == \"\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"");
      out.print(pageData.getWord("Specify user password"));
      out.write("\");\r\n");
      out.write("\t\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\t\ttp1.setSelectedIndex( 0 );\r\n");
      out.write("\t\t\t\tdocument.theForm.password.focus();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t\tif(document.theForm.livemonitoringlogin.value == \"\" && document.theForm.livemonitoringpassword.value != \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Specify live monitoring numeric login"));
      out.write("\");\r\n");
      out.write("\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\ttp1.setSelectedIndex( 0 );\r\n");
      out.write("\t\t\tdocument.theForm.livemonitoringlogin.focus();\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t\tif(document.theForm.livemonitoringpassword.value == \"\" && document.theForm.livemonitoringlogin.value != \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(is_in_addmode){\r\n");
      out.write("\t\t\t\talert(\"");
      out.print(pageData.getWord("Specify live monitoring numeric password"));
      out.write("\");\r\n");
      out.write("\t\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\t\ttp1.setSelectedIndex( 0 );\r\n");
      out.write("\t\t\t\tdocument.theForm.livemonitoringpassword.focus();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t\tif((document.theForm.livemonitoringlogin.value != \"\" && !IsNumeric(document.theForm.livemonitoringlogin.value)))\t\t\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("The live monitoring login must be numeric"));
      out.write("\");\r\n");
      out.write("\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\ttp1.setSelectedIndex( 0 );\r\n");
      out.write("\t\t\tdocument.theForm.livemonitoringlogin.focus();\t\t\t\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t\tif((document.theForm.livemonitoringpassword.value != \"\" && !IsNumeric(document.theForm.livemonitoringpassword.value)))\t\t\t\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("The live monitoring password must be numeric"));
      out.write("\");\r\n");
      out.write("\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\ttp1.setSelectedIndex( 0 );\r\n");
      out.write("\t\t\tdocument.theForm.livemonitoringlogin.focus();\t\t\t\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif( is_in_addmode )\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(document.theForm.password.value != document.theForm.password2.value)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"");
      out.print(pageData.getWord("Passwords do not match."));
      out.write("\");\r\n");
      out.write("\t\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\t\ttp1.setSelectedIndex( 0 );\r\n");
      out.write("\t\t\t\tdocument.theForm.password.focus();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t\tif(document.theForm.livemonitoringpassword.value != document.theForm.livemonitoringpassword2.value)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Live monitoring passwords do not match."));
      out.write("\");\r\n");
      out.write("\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\ttp1.setSelectedIndex( 0 );\r\n");
      out.write("\t\t\tdocument.theForm.livemonitoringpassword.focus();\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\tvar this_user_dbid =\"");
      out.print((String)session.getAttribute("CURRENT_USER_DBID"));
      out.write("\";\r\n");
      out.write("\tvar dbid = document.theForm.userdbid.value;\t\t\r\n");
      out.write("\tif(document.theForm.active.checked)\r\n");
      out.write("\t\tactive_value = \"1\";\r\n");
      out.write("\telse if(this_user_dbid == dbid){\r\n");
      out.write("\t\t\talert(\"You cannot desactiavate your own account while logged in. Please log in with another account with adequate privileges and desactivate the desired account.\");\r\n");
      out.write("\t\t\tdocument.theForm.active.checked = true;\r\n");
      out.write("\t\t\tvalid_info = false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t\tactive_value = \"0\";\r\n");
      out.write("\t\t\r\n");
      out.write("\tif( valid_info )\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif( is_in_addmode )\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tpassword \t\t= document.theForm.password.value;\r\n");
      out.write("\t\t\tlive_password \t= document.theForm.livemonitoringpassword.value;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(document.theForm.password.value != \"\") \r\n");
      out.write("\t\t\t\tpassword = document.theForm.password.value;\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t\tpassword = document.theForm.old_password.value;\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\tif( document.theForm.livemonitoringpassword.value != \"\" )\r\n");
      out.write("\t\t\t\tlive_password = document.theForm.livemonitoringpassword.value;\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t\tlive_password = document.theForm.old_live_password.value;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("/***************************************************/\t\r\n");
      out.write("\tif(valid_info)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tcurr_username = document.theForm.username.value;\r\n");
      out.write("\t\tif(is_in_addmode)\r\n");
      out.write("\t\t{\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tfor (i = 0; i <array_users.length; i++)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\ta_user = array_users[i].split(\",\");\r\n");
      out.write("\t\t\t\t//alert(\"username: \"+a_user);\r\n");
      out.write("\t\t\t\tif(a_user[2]==curr_username)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\talert(\"");
      out.print(pageData.getWord("The username entered is already in use. Please, choose another one."));
      out.write("\");\r\n");
      out.write("\t\t\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse{\r\n");
      out.write("\t\t\told_username = \"");
      out.print(this_username);
      out.write("\";\r\n");
      out.write("\t\t\tif(old_username!=curr_username)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tfor (i = 0; i <array_users.length; i++)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\ta_user = array_users[i].split(\",\");\r\n");
      out.write("\t\t\t\t\t//alert(\"username: \"+a_user);\r\n");
      out.write("\t\t\t\t\tif(a_user[2]==curr_username)\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\talert(\"");
      out.print(pageData.getWord("The username entered is already in use. Please, choose another one."));
      out.write("\");\r\n");
      out.write("\t\t\t\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\t\t\t\t\t\t\r\n");
      out.write("\t\t\t}\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\t\r\n");
      out.write("\t\r\n");
      out.write("\tif(valid_info)\r\n");
      out.write("\t{\t\r\n");
      out.write("\t\tcurr_num_login = document.theForm.livemonitoringlogin.value;\r\n");
      out.write("\t\tif(is_in_addmode)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tfor (i = 0; i <array_users.length; i++)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\ta_user = array_users[i].split(\",\");\r\n");
      out.write("\t\t\t\tif (a_user[5]==curr_num_login && curr_num_login!=\"\")\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\talert(\"");
      out.print(pageData.getWord("The 'Live monitoring login' entered is already in use. Please, choose another one."));
      out.write("\");\r\n");
      out.write("\t\t\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\told_live_username=\"");
      out.print(this_live_username);
      out.write("\";\r\n");
      out.write("\t\t\tif(old_live_username!=curr_num_login && curr_num_login!=\"\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tfor (i = 0; i <array_users.length; i++)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\ta_user = array_users[i].split(\",\");\r\n");
      out.write("\t\t\t\t\tif (a_user[5]==curr_num_login)\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\talert(\"");
      out.print(pageData.getWord("The 'Live monitoring login' entered is already in use. Please, choose another one."));
      out.write("\");\r\n");
      out.write("\t\t\t\t\t\tvalid_info = false;\r\n");
      out.write("\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\t\t\r\n");
      out.write("\t\t\t}\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("/**********************************************************/\t\r\n");
      out.write("\t/// From here, we know if form is valide\r\n");
      out.write("\tif(valid_info)\r\n");
      out.write("\t{\r\n");
      out.write("\t\txml_message += \"<MSG_TYPE_MODIFY_USER>\";\r\n");
      out.write("\t\t\txml_message += \"<dbid>\"+document.theForm.userdbid.value+\"</dbid>\";\r\n");
      out.write("\t\t\txml_message += \"<name>\"+document.theForm.username.value+\"</name>\";\r\n");
      out.write("\t\t\t//the is_in_addmode is superfluous in this statement since\r\n");
      out.write("\t\t\t//we already checked that the value is not null when in addmode\r\n");
      out.write("\t\t\tif(is_in_addmode || document.theForm.password.value != \"\"){\r\n");
      out.write("\t\t\t\txml_message += \"<password>\"+appletObj.getSHA1Password(password)+\"</password>\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse{\r\n");
      out.write("\t\t\t\txml_message += \"<password>\"+ password + \"</password>\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\txml_message += \"<livemonitoringlogin>\"+document.theForm.livemonitoringlogin.value+\"</livemonitoringlogin>\";\r\n");
      out.write("\t\t\txml_message += \"<livemonitoringpassword>\"+live_password+\"</livemonitoringpassword>\";\r\n");
      out.write("\t\t\txml_message += \"<active>\"+active_value+\"</active>\";\r\n");
      out.write("\t\t\txml_message += \"<privileges>\"+getNewRitghsStr()+\"</privileges>\";\r\n");
      out.write("\t\t\txml_message += \"<allow_ressources>\"+packageAllowRessources()+\"</allow_ressources>\";\r\n");
      out.write("\t\txml_message += \"</MSG_TYPE_MODIFY_USER>\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tappletObj.saveUser(xml_message);\t\t\r\n");
      out.write("\t\tdocument.location.href = \"../defaultpage.htm\";\r\n");
      out.write("\t}\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function deleteUser()\r\n");
      out.write("{\r\n");
      out.write("\tvar this_user_dbid =\"");
      out.print((String)session.getAttribute("CURRENT_USER_DBID"));
      out.write("\";\r\n");
      out.write("\tvar dbid = document.theForm.userdbid.value;\r\n");
      out.write("\t\r\n");
      out.write("\t//alert(\"document.theForm.userdbid.value= \"+document.theForm.userdbid.value);\r\n");
      out.write("\tvar user_count =");
      out.print((String)getCountUsersDataResult.elementAt(0).get("user_count"));
      out.write(";\r\n");
      out.write("\t\r\n");
      out.write("\tif(this_user_dbid==dbid)\r\n");
      out.write("\t\talert(\"");
      out.print(pageData.getWord("You cannot delete your own account while logged in. Please log in with another account with adequate privileges and delete the desired account."));
      out.write("\");\r\n");
      out.write("\telse if(user_count==\"1\")\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("You cannot delete the last active account. Subsequent logins would be impossible"));
      out.write("\");\t\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar yesno = confirm(\"");
      out.print(pageData.getWord("Are you sure that you want to delete this user?"));
      out.write("\");\r\n");
      out.write("\t\tif( yesno )\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tvar dbid = document.theForm.userdbid.value;\r\n");
      out.write("\t\t\tif( dbid != \"\" && dbid != null )\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tvar message = dbid;\r\n");
      out.write("\t\t\t\tappletObj.deleteUser( dbid );\r\n");
      out.write("\t\t\t\tdocument.location.href = \"../defaultpage.htm\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function save_new_role()\r\n");
      out.write("{\r\n");
      out.write("\tvar new_role_name = \"\";\r\n");
      out.write("\tvar obj = document.getElementById('new_role_name');\r\n");
      out.write("\tif( obj )\t\r\n");
      out.write("\t{\t\t\r\n");
      out.write("\t\tnew_role_name = obj.value;\r\n");
      out.write("\t\tif( (new_role_name == \"\") || (allSpaces(new_role_name)=='0') )\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Please specify the new role name."));
      out.write("\");\r\n");
      out.write("\t\telse if(!isValidName(new_role_name))\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Invalid use of character"));
      out.write("\");\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tvar already_exist = false;\r\n");
      out.write("\t\t\tnew_role_name = trimLeadingSpace(new_role_name);\r\n");
      out.write("\t\t\tnew_role_name = trimTrailingSpace(new_role_name);\r\n");
      out.write("\t\t\tfor(var role in PredefinedRolesContained)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tif( role == new_role_name )\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\talready_exist = true;\r\n");
      out.write("\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif( already_exist )\r\n");
      out.write("\t\t\t\talert(\"");
      out.print(pageData.getWord("A role with same name already exists."));
      out.write("\");\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tvar array_strings = new Array();\r\n");
      out.write("\t\t\t\tvar objs = document.getElementsByTagName('input');\t\r\n");
      out.write("\t\t\t\tfor(var i = 0; i < objs.length; i++)\r\n");
      out.write("\t\t\t\t\tif( objs[i].type == 'checkbox' )\r\n");
      out.write("\t\t\t\t\t\tif( objs[i].id.indexOf(\"ALLOW_\") == 0 || objs[i].name.indexOf(\"ALLOW_\") == 0)\r\n");
      out.write("\t\t\t\t\t\t\tif( objs[i].checked )\r\n");
      out.write("\t\t\t\t\t\t\t\tarray_strings.push((objs[i].id.indexOf(\"ALLOW_\") == 0 ? objs[i].id : objs[i].name) + '=');\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif( array_strings.length == 0 )\r\n");
      out.write("\t\t\t\t\talert(\"");
      out.print(pageData.getWord("Please check at least one privilege."));
      out.write("\");\r\n");
      out.write("\t\t\t\telse\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\tvar privileges_str = array_strings.join('&');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tvar tmpFile = null;\t\t\t\r\n");
      out.write("\t\t\t\t\ttmpFile = document.createElement(\"script\");\t\r\n");
      out.write("\t\t\t\t\ttmpFile.src = \"user_management_roles.js.jsp?actionType=SAVE_ROLE&role_name=\"+new_role_name+\"&\"+privileges_str+\"&rand=\"+Math.random();\t\t\t\t\r\n");
      out.write("\t\t\t\t\ttmpFile.type = \"text/javascript\"; \r\n");
      out.write("\t\t\t\t\tdocument.body.appendChild(tmpFile);\r\n");
      out.write("\t\t\t\t\tvar test = privileges_str.replace(/=&/g, \",\").replace(/=/, \"\");// alert(\"test = \"+test);\r\n");
      out.write("\t\t\t\t\t/* add the new role */\r\n");
      out.write("\t\t\t\t\taddOptionToSelect(document.theForm.role, new_role_name, test);\r\n");
      out.write("\t\t\t\t\tdeductRoleFromCheckedOptions();\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function deleteSelectedRole()\r\n");
      out.write("{\r\n");
      out.write("\tvar role_name = \"\";\r\n");
      out.write("\tvar obj = document.theForm.role;\r\n");
      out.write("\t\r\n");
      out.write("\tfor( var i = 0; i < obj.options.length; i++ )\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif( obj.options[i].selected )\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\trole_name = obj.options[i].value; \r\n");
      out.write("\t\t\tbreak;\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tif( role_name != \"\" )\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar yesno = confirm(\"\"+role_name+\" --- \"+\"");
      out.print(pageData.getWord("Are you sure that you want to delete this role?"));
      out.write("\");\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif( yesno )\r\n");
      out.write("\t\t{\t\t\r\n");
      out.write("\t\t\tvar tmpFile = null;\t\t\t\r\n");
      out.write("\t\t\ttmpFile = document.createElement(\"script\");\t\r\n");
      out.write("\t\t\ttmpFile.src = \"user_management_roles.js.jsp?actionType=REMOVE_ROLE&role_name=\"+role_name+\"&rand=\"+Math.random();\t\t\t\t\r\n");
      out.write("\t\t\ttmpFile.type = \"text/javascript\";\r\n");
      out.write("\t\t\tdocument.body.appendChild(tmpFile);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t/* remove the role from the list of all roles */\r\n");
      out.write("\t\t\tretrieveOptionFromSelect( document.theForm.role, role_name );\r\n");
      out.write("\t\t\tdelete PredefinedRolesContained[role_name];\r\n");
      out.write("\t\t\tdeductRoleFromCheckedOptions();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function fill_fields()\r\n");
      out.write("{\r\n");
      out.write("\t//Remplir les differents champs\r\n");
      out.write("\tvar agentGroups = String( appletObj.getAgentGroupsByStatusAndTenant(\"1\", document.theForm.tenant_id.value) );\r\n");
      out.write("\tjsagentGroupsArray = agentGroups.split(\"|\");\r\n");
      out.write("\tfor(i=0; i < jsagentGroupsArray.length; i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tthisAgentGroup = jsagentGroupsArray[i].split(\",\");\r\n");
      out.write("\t\ttmpOption = new Option(thisAgentGroup[1], thisAgentGroup[0]);\r\n");
      out.write("\t\t//document.write(\"<option value=\\\"\"+thisAgentGroup[0]+\"\\\" >\"+thisAgentGroup[1]+\"</option>\");\r\n");
      out.write("\t\tvar nb_options = document.theForm.available_groups.options.length;\r\n");
      out.write("\t\tdocument.theForm.available_groups.options[nb_options] = tmpOption;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function KeyDownHandler(btn)\r\n");
      out.write("{\r\n");
      out.write("\t// process only the Enter key\r\n");
      out.write("\tif (event.keyCode == 13)\r\n");
      out.write("\t{\r\n");
      out.write("\t\t// cancel the default submit\r\n");
      out.write("\t\tevent.returnValue=false;\r\n");
      out.write("\t\tevent.cancel = true;\r\n");
      out.write("\t\t// submit the form by programmatically clicking the specified button\r\n");
      out.write("\t\tbtn.click();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function displayMC() {\r\n");
      out.write("\tif(!appletObj.getIsMessageCenterAllowed()){\r\n");
      out.write("\t\t document.getElementById('ALLOW_MESSAGE_CENTER_MANAGEMENT').checked = false; \r\n");
      out.write("\t\tdocument.getElementById('ALLOW_MESSAGE_CENTER_MANAGEMENT').disabled = true;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function displaySC() {\r\n");
      out.write("        if(!appletObj.getIsScreenCaptureAllowed()){\r\n");
      out.write("                 document.getElementById('ALLOW_MANAGER_SCREEN_MONITORING').checked = false;\r\n");
      out.write("                document.getElementById('ALLOW_MANAGER_SCREEN_MONITORING').disabled = true;\r\n");
      out.write("        }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"use_man_body\" TEXT=\"#000000\" LINK=\"#000066\" VLINK=\"#666666\" > \r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"theForm\" onKeyDown=\"KeyDownHandler(save)\">\r\n");
      out.write("<input type=\"hidden\" name=\"userdbid\" id=\"userdbid\" value=\"");
      out.print(this_user_dbid);
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"old_password\" id=\"old_password\" value=\"");
      out.print(this_password);
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"old_live_password\" id=\"old_live_password\" value=\"");
      out.print(this_livepassword);
      out.write("\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print(pageData.getWord("General"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t\t<table border=\"0\">\t\t  \r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("User name"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td><input name=\"username\" type=\"text\" value=\"");
      out.print(this_username);
      out.write("\"></td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Password"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td><input name=\"password\" id=\"password\" type=\"password\"></td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Retype password"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td><input name=\"password2\" id=\"password2\" type=\"password\" onBlur=\"return validPassword();\"></td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Live monitoring login"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td><input name=\"livemonitoringlogin\" type=\"text\" size=\"10\" value=\"");
      out.print(this_live_username);
      out.write("\"></td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Live monitoring password"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td><input name=\"livemonitoringpassword\" type=\"password\" size=\"10\"></td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Retype live monitoring password"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td><input name=\"livemonitoringpassword2\" type=\"password\" size=\"10\"></td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Active"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td><input name=\"active\" type=\"checkbox\" ");
 if( IS_IN_ADDMODE ) out.write("checked"); else if(this_active.compareTo("1") == 0) out.write("checked"); 
      out.write("></td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\t\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPrivileges\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Privilegies"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPrivileges\" ) );</script>\r\n");
      out.write("\t\t<table cellpadding=\"0\" cellspacing=\"0\"><tr><td>\r\n");
      out.write("\t\t");
      out.print(pageData.getWord("Predefined Roles"));
      out.write(" : \r\n");
      out.write("\t\t\t<select onChange=\"roleSelected(this.value)\" name=\"role\">\t\t\t\r\n");
      out.write("\t\t\t\t");

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
			
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<option value=\"");
      out.print(predefineRole );
      out.write('"');
      out.write('>');
      out.print(predefineRole );
      out.write("</option>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t");

						}else{		
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<option value=\"");
      out.print(predefineRole );
      out.write('"');
      out.write('>');
      out.print(pageData.getWord(predefineRole) );
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t<!-- //out.write(\"<option value=\\\"\"+predefineRole+\"\\\">\"+pageData.getWord(predefineRole)+\"</option>\"); --->\r\n");
      out.write("\t\t\t\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\t\t\tsystemRoles.push(\"");
      out.print(predefineRole );
      out.write("\");\r\n");
      out.write("\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t");

						}
					}//while
				
      out.write("\r\n");
      out.write("\t\t\t\t<option value=\"ROLE_CUSTOM\" selected=\"selected\">");
      out.print(pageData.getWord("Custom"));
      out.write("</option>\t\t\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</td><td id=\"save_current_custom_role_td\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</td></tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t<table width=\"100%\"><tr><td width=\"50%\" align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("System configurations"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Configuration management"));
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_CONFIGURATION_MANAGEMENT\" name=\"ALLOW_CONFIGURATION_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Tenant Management"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_TENANT_MANAGEMENT\" name=\"ALLOW_TENANT_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("User Management"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_USER_MANAGEMENT\" name=\"ALLOW_USER_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Network Configuration"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_NETWORK_CONFIGURATION\" name=\"ALLOW_NETWORK_CONFIGURATION\"></td></tr>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("Quality Monitoring and reports"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Quality Monitoring"));
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_QUALITY_MONITORING_MANAGEMENT\" name=\"ALLOW_QUALITY_MONITORING_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Evaluation forms"));
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT\" name=\"ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agents conversation"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT\" name=\"ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agent listening report"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT\" name=\"ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Historical Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agent Details Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agent Groups Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agent summary reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Outbound call reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Inbound call reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agent Login Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Campaign Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Calling List Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Queue Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Group Forecast Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Group Summary Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Line Management Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_HISTORICAL_LINEMANAGEMENT_REPORTS_MANAGEMENT\" name=\"ALLOW_HISTORICAL_LINEMANAGEMENT_REPORTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("Live statistics"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("View live statistics"));
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_LIVE_STATS\" name=\"ALLOW_VIEW_LIVE_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agents"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_AGENT_STATS\" name=\"ALLOW_VIEW_AGENT_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agent Groups"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_AGENTGROUP_STATS\" name=\"ALLOW_VIEW_AGENTGROUP_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Queues"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_QUEUES_STATS\" name=\"ALLOW_VIEW_QUEUES_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Campaigns"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_CAMPAIGN_STATS\" name=\"ALLOW_VIEW_CAMPAIGN_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Calling lists"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_CALLING_LIST_STATS\" name=\"ALLOW_VIEW_CALLING_LIST_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Performance"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_PERFOMANCE_STATS\" name=\"ALLOW_VIEW_PERFOMANCE_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Teams"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_TEAM_STATS\" name=\"ALLOW_VIEW_TEAM_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("adherence"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_ADHERENCE_STATS\" name=\"ALLOW_VIEW_ADHERENCE_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Line management"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_VIEW_LINE_MANAGEMENT_STATS\" name=\"ALLOW_VIEW_LINE_MANAGEMENT_STATS\"></td></tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset><br>\t\t\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t</td><td width=\"50%\" align=\"right\" valign=\"top\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("Tenants and Ressources"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Tenant"));
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_TENANT_VIEW\" name=\"ALLOW_TENANT_VIEW\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Resources"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_RESSOURCES_MANAGEMENT\" name=\"ALLOW_RESSOURCES_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agent Groups"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_AGENT_GROUPS_MANAGEMENT\" name=\"ALLOW_AGENT_GROUPS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agents"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_AGENT_MANAGEMENT\" name=\"ALLOW_AGENT_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Campaigns"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_CAMPAIGN_MANAGEMENT\" name=\"ALLOW_CAMPAIGN_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Calling lists"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_CALLING_LIST_MANAGEMENT\" name=\"ALLOW_CALLING_LIST_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Do-not-call lists"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_DONOTCALL_LIST_MANAGEMENT\" name=\"ALLOW_DONOTCALL_LIST_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Filters"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_FILTER_MANAGEMENT\" name=\"ALLOW_FILTER_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Treatments"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_TREATMENTS_MANAGEMENT\" name=\"ALLOW_TREATMENTS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Not-ready reasons"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_NOT_READY_REASON_MANAGEMENT\" name=\"ALLOW_NOT_READY_REASON_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Queues"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_QUEUES_MANAGEMENT\" name=\"ALLOW_QUEUES_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Agent skills"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_SKILLS_MANAGEMENT\" name=\"ALLOW_SKILLS_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("Finances and Methods of payment"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Financial configuration"));
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_FINANCIAL_CONFIGURATION\" name=\"ALLOW_FINANCIAL_CONFIGURATION\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Financial Reports"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_FINANCIAL_REPORTS\" name=\"ALLOW_FINANCIAL_REPORTS\"></td></tr>\t\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("Work Force"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Work Force Management"));
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_WORK_FORCE_MANAGEMENT\" name=\"ALLOW_WORK_FORCE_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("Message center"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Message center"));
      out.write("</td><td width=\"20\">\r\n");
      out.write("\t\t\t\t\t");

						if(pageData.userHasRight(getAuthLicenseItemResult, "ALLOW_MESSAGE_CENTER_MANAGEMENT")) {
							out.write("<input type='checkbox' onClick='boxclicked_byuser(this.name, this.checked)'  id='ALLOW_MESSAGE_CENTER_MANAGEMENT' name='ALLOW_MESSAGE_CENTER_MANAGEMENT'>");
						}else{
							out.write("<input type='checkbox'id='ALLOW_MESSAGE_CENTER_MANAGEMENT' name='ALLOW_MESSAGE_CENTER_MANAGEMENT' >");
							out.write("<script>displayMC();</script>");
						} 
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</td></tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("Call routing scripts"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Routing scripts"));
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_ROUTING_SCRIPT_MANAGEMENT\" name=\"ALLOW_ROUTING_SCRIPT_MANAGEMENT\"></td></tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("Manager features"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Change agent status"));
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_MANAGER_CHANGE_AGENT_STATUS\" name=\"ALLOW_MANAGER_CHANGE_AGENT_STATUS\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Logged agents out"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_MANAGER_LOGGED_OUT_AGENT\" name=\"ALLOW_MANAGER_LOGGED_OUT_AGENT\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Logged agents group out"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP\" name=\"ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Live monitoring"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_MANAGER_LIVE_MONITORING\" name=\"ALLOW_MANAGER_LIVE_MONITORING\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Whisper to agent"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_MANAGER_WHISPER_TOAGENT\" name=\"ALLOW_MANAGER_WHISPER_TOAGENT\"></td></tr>\r\n");
      out.write("\t\t\t\t   <tr><td>");
      out.print(pageData.getWord("Audio monitoring"));
      out.write("</td><td><input type='checkbox' onClick='boxclicked_byuser(this.name, this.checked)'  id='ALLOW_MANAGER_AUDIO_MONITORING' name='ALLOW_MANAGER_AUDIO_MONITORING'></td></tr>\r\n");
      out.write("\t\t\t\t<tr><td>");
      out.print(pageData.getWord("Screen monitoring"));
      out.write("</td><td>\r\n");
      out.write("\t\t\t\t");
 
						if(pageData.userHasRight(getAuthLicenseItemResult, "ALLOW_MANAGER_SCREEN_MONITORING")) {
							out.write("<input type='checkbox' onClick='boxclicked_byuser(this.name, this.checked)'  id='ALLOW_MANAGER_SCREEN_MONITORING' name='ALLOW_MANAGER_SCREEN_MONITORING'>");
						}else{
							out.write("<input type='checkbox' onClick='boxclicked_byuser(this.name, this.checked)'  id='ALLOW_MANAGER_SCREEN_MONITORING' name='ALLOW_MANAGER_SCREEN_MONITORING'>");
							out.write("<script>displaySC();</script>");
						} 
				
      out.write("\r\n");
      out.write("\t\t\t\t</td></tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t<!--\t<tr><td>");
      out.print(pageData.getWord("Whisper to customer"));
      out.write("</td><td><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\"  id=\"ALLOW_MANAGER_WHISPER_TOCUSTOMER\" name=\"ALLOW_MANAGER_WHISPER_TOCUSTOMER\"></td></tr>\t\r\n");
      out.write("\t\t\t\t\t-->\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<fieldset><legend>");
      out.print(pageData.getWord("Form Builder") );
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("\t\t\t\t   <tr><td>");
      out.print(pageData.getWord("Form Builder") );
      out.write("</td><td width=\"20\"><input type=\"checkbox\" onClick=\"boxclicked_byuser(this.name, this.checked)\" id=\"ALLOW_POPUP_BUILDER\" name=\"ALLOW_POPUP_BUILDER\"></td></tr>\r\n");
      out.write("\t\t\t\t</table>   \r\n");
      out.write("\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t</tr></table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabRessources\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Resources"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabRessources\" ) );</script>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<table width=\"100%\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t<fieldset style=\"width:75%\">\r\n");
      out.write("\t\t\t\t<legend>");
      out.print(pageData.getWord("Tenants"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Available"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td >&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Assigned"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<select multiple size=\"7\" name=\"available_TENANTS\" style=\"width:100%\" onChange=\"changeMoveButtons('TENANTS','LEFT')\">\t\t\t\t\t\t\r\n");
      out.write("                          ");

									for(int i = 0; i < tenantDataResult.size(); i++)
										out.write("<option value=\""+tenantDataResult.elementAt(i).get("dbid")+"\">"+tenantDataResult.elementAt(i).get("name")+"</option>");
								
      out.write("\r\n");
      out.write("                        </select></td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_add_TENANTS\" name=\"b_add_TENANTS\" type=\"button\" value=\"&gt;&gt;\" disabled onClick=\"move_left_right('TENANTS')\"><br><br>\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_retrieve_TENANTS\" name=\"b_retrieve_TENANTS\" type=\"button\" value=\"&lt;&lt;\" disabled onClick=\"move_right_left('TENANTS')\">\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<select multiple size=\"7\" name=\"assigned_TENANTS\" style=\"width:100%\" onChange=\"changeMoveButtons('TENANTS','RIGHT')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for( int i = 0; i < tenantDataAssocResult.size(); i++ )
										out.write("<option value=\""+tenantDataAssocResult.elementAt(i).get("dbid")+"\">"+tenantDataAssocResult.elementAt(i).get("name")+"</option>");
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\t\t\t\t\t\t</td>\t\t\t\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</fieldset>\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t<fieldset style=\"width:75%\">\r\n");
      out.write("\t\t\t\t<legend>");
      out.print(pageData.getWord("Campaigns"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Available"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Assigned"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<select multiple size=\"7\" name=\"available_CAMPAIGNS\" style=\"width:100%\" onChange=\"changeMoveButtons('CAMPAIGNS','LEFT')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for(int i = 0; i < campaignsDataResult.size(); i++)
										out.write("<option value=\""+campaignsDataResult.elementAt(i).get("dbid")+"\">"+campaignsDataResult.elementAt(i).get("name")+"</option>");
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_add_CAMPAIGNS\" name=\"b_add_CAMPAIGNS\" type=\"button\" value=\"&gt;&gt;\" disabled onClick=\"move_left_right('CAMPAIGNS')\"><br><br>\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_retrieve_CAMPAIGNS\" name=\"b_retrieve_CAMPAIGNS\" type=\"button\" value=\"&lt;&lt;\" disabled onClick=\"move_right_left('CAMPAIGNS')\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\t\r\n");
      out.write("\t\t\t\t\t\t\t<select multiple size=\"7\" name=\"assigned_CAMPAIGNS\" style=\"width:100%\" onChange=\"changeMoveButtons('CAMPAIGNS','RIGHT')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for(int i = 0; i < campaignsAssocDataResult.size(); i++)
										out.write("<option value=\""+campaignsAssocDataResult.elementAt(i).get("dbid")+"\">"+campaignsAssocDataResult.elementAt(i).get("name")+"</option>");
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\t\t\t\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</fieldset>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t<fieldset style=\"width:75%\">\t\t\t\t\r\n");
      out.write("\t\t\t\t<legend>");
      out.print(pageData.getWord("Calling lists"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Available"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Assigned"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<select multiple size=\"7\" name=\"available_CALLINGLISTS\" style=\"width:100%\" onChange=\"changeMoveButtons('CALLINGLISTS','LEFT')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for(int i = 0; i < callinglistDataResult.size(); i++)
										out.write("<option value=\""+callinglistDataResult.elementAt(i).get("dbid")+"\">"+callinglistDataResult.elementAt(i).get("name")+"</option>");
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_add_CALLINGLISTS\" name=\"b_add_CALLINGLISTS\" type=\"button\" value=\"&gt;&gt;\" disabled onClick=\"move_left_right('CALLINGLISTS')\"><br><br>\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_retrieve_CALLINGLISTS\" name=\"b_retrieve_CALLINGLISTS\" type=\"button\" value=\"&lt;&lt;\" disabled onClick=\"move_right_left('CALLINGLISTS')\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<select multiple size=\"7\" name=\"assigned_CALLINGLISTS\" style=\"width:100%\" onChange=\"changeMoveButtons('CALLINGLISTS','RIGHT')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for(int i = 0; i < callinglistAssocDataResult.size(); i++)
										out.write("<option value=\""+callinglistAssocDataResult.elementAt(i).get("dbid")+"\">"+callinglistAssocDataResult.elementAt(i).get("name")+"</option>");
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\t\t\t\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\t\t\r\n");
      out.write("\t\t\t</fieldset>\t\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"50%\" align=\"left\" valign=\"top\">\t\t\t\r\n");
      out.write("\t\t\t<fieldset style=\"width:75%\">\t\t\t\t\r\n");
      out.write("\t\t\t\t<legend>");
      out.print(pageData.getWord("Agent Groups"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Available"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Assigned"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<select multiple size=\"7\" name=\"available_AGENTGROUPS\" style=\"width:100%\" onChange=\"changeMoveButtons('AGENTGROUPS', 'LEFT')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for(int i = 0; i < agentgroupDataResult.size(); i++)
										out.write("<option value=\""+agentgroupDataResult.elementAt(i).get("dbid")+"\">"+agentgroupDataResult.elementAt(i).get("name")+"</option>");
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_add_AGENTGROUPS\" name=\"b_add_AGENTGROUPS\" type=\"button\" value=\"&gt;&gt;\" disabled onClick=\"move_left_right('AGENTGROUPS')\"><br><br>\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_retrieve_AGENTGROUPS\" name=\"b_retrieve_AGENTGROUPS\" type=\"button\" value=\"&lt;&lt;\" disabled onClick=\"move_right_left('AGENTGROUPS')\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<select multiple size=\"7\" name=\"assigned_AGENTGROUPS\" style=\"width:100%\" onChange=\"changeMoveButtons('AGENTGROUPS', 'RIGHT')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for(int i = 0; i < agentgroupAssocDataResult.size(); i++)
										out.write("<option value=\""+agentgroupAssocDataResult.elementAt(i).get("dbid")+"\">"+agentgroupAssocDataResult.elementAt(i).get("name")+"</option>");
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\t\t\t\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\t\t\r\n");
      out.write("\t\t\t</fieldset>\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t<fieldset style=\"width:75%\">\t\t\t\t\r\n");
      out.write("\t\t\t\t<legend>");
      out.print(pageData.getWord("Routing scripts"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Available"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"45%\">");
      out.print(pageData.getWord("Assigned"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<select multiple size=\"7\" name=\"available_ROUTINGSCRIPTS\" style=\"width:100%\" onChange=\"changeMoveButtons('ROUTINGSCRIPTS', 'LEFT')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for(int i = 0; i < routingscriptsDataResult.size(); i++)
										out.write("<option value=\""+routingscriptsDataResult.elementAt(i).get("dbid")+"\">"+routingscriptsDataResult.elementAt(i).get("script_name")+"</option>");
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_add_ROUTINGSCRIPTS\" name=\"b_add_ROUTINGSCRIPTS\" type=\"button\" value=\"&gt;&gt;\" disabled onClick=\"move_left_right('ROUTINGSCRIPTS')\"><br><br>\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"b_retrieve_ROUTINGSCRIPTS\" name=\"b_retrieve_ROUTINGSCRIPTS\" type=\"button\" value=\"&lt;&lt;\" disabled onClick=\"move_right_left('ROUTINGSCRIPTS')\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<select multiple size=\"7\" name=\"assigned_ROUTINGSCRIPTS\" style=\"width:100%\" onChange=\"changeMoveButtons('ROUTINGSCRIPTS', 'RIGHT')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for(int i = 0; i < routingscriptsAssocDataResult.size(); i++)
										out.write("<option value=\""+routingscriptsAssocDataResult.elementAt(i).get("dbid")+"\">"+routingscriptsAssocDataResult.elementAt(i).get("script_name")+"</option>");
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\t\t\t\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\t\t\r\n");
      out.write("\t\t\t</fieldset>\t\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t");
 if( IS_IN_ADDMODE ) 
	{
	
      out.write("\r\n");
      out.write("\t\t<input id=\"save\" name=\"\" type=\"button\" value=\"");
      out.print(pageData.getWord("Add user"));
      out.write("\" onClick=\"UserValidateInfo()\">\r\n");
      out.write("\t");
 
	}
	else 
	{	
      out.write("\r\n");
      out.write("\t\t<input id=\"save\" name=\"\" type=\"button\" value=\"");
      out.print(pageData.getWord("Modify user"));
      out.write("\" onClick=\"UserValidateInfo()\">\r\n");
      out.write("\t\t<input name=\"\" type=\"button\" value=\"");
      out.print(pageData.getWord("Delete user"));
      out.write("\" onClick=\"deleteUser()\">\r\n");
      out.write("\t\t");

	}
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");

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

      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("   displayMC();\r\n");
      out.write("   displaySC();\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
 pageData.closeConnection(); 
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
