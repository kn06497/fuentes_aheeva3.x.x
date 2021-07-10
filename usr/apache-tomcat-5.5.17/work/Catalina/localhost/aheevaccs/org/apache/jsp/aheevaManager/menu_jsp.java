package org.apache.jsp.aheevaManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import aheevaManager.ressources.*;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	
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
		

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<title>Menu</title>\r\n");
      out.write("<LINK href=\"Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<!--[if lt IE 7]>\r\n");
      out.write("<link href=\"Resources_pages/styleie6.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<![endif]-->\r\n");
      out.write("\r\n");
      out.write("<base target=\"rbottom\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"JavaScript\" src=\"Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Resources_pages/Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"lang_browser.js\"></script>\r\n");
      out.write("<script language=\"JavaScript1.2\">\r\n");
      out.write("/*\r\n");
      out.write("var head=\"display:''\";\r\n");
      out.write("img1=new Image();\r\n");
      out.write("img1.src=\"img/fold.gif\";\r\n");
      out.write("img2=new Image();\r\n");
      out.write("img2.src=\"img/open.gif\";\r\n");
      out.write("*/\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/*  not used ------ check before delete --------\r\n");
      out.write("var ns6=document.getElementById&&!document.all\r\n");
      out.write("var ie4=document.all&&navigator.userAgent.indexOf(\"Opera\")==-1\r\n");
      out.write("\r\n");
      out.write("function checkcontained(e){\r\n");
      out.write("\tvar iscontained=0\r\n");
      out.write("\tcur=ns6? e.target : event.srcElement\r\n");
      out.write("\ti=0\r\n");
      out.write("\tif (cur.id==\"foldheader\" || cur.id==\"foldheaderconfig\")\r\n");
      out.write("\t\tiscontained=1\r\n");
      out.write("\telse\r\n");
      out.write("\t\twhile (ns6&&cur.parentNode||(ie4&&cur.parentElement))\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif (cur.id==\"foldheader\"||IsInFoldingLists(cur.id) || cur.id==\"foldheaderconfig\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tiscontained=(cur.id==\"foldheader\" || cur.id==\"foldheaderconfig\")? 1 : 0;\r\n");
      out.write("\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tcur=ns6? cur.parentNode : cur.parentElement\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\tif (iscontained){\r\n");
      out.write("\r\n");
      out.write("\t\tvar foldercontent=ns6? cur.nextSibling : cur.all.tags(\"UL\")[0];\r\n");
      out.write("\r\n");
      out.write("\t\tif (foldercontent.style.display==\"none\"){\r\n");
      out.write("\t\t\tfoldercontent.style.display=\"\"\r\n");
      out.write("\t\t\tif(cur.id==\"foldheaderconfig\")\r\n");
      out.write("\t\t\t\tcur.style.listStyleImage=\"url(img/foldco.gif)\"\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t\tcur.style.listStyleImage=\"url(img/open.gif)\"\r\n");
      out.write("\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse{\r\n");
      out.write("\t\t\tfoldercontent.style.display=\"none\"\r\n");
      out.write("\t\t\tif(cur.id==\"foldheaderconfig\")\r\n");
      out.write("\t\t\t\tcur.style.listStyleImage=\"url(img/foldcf.gif)\"\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t\tcur.style.listStyleImage=\"url(img/fold.gif)\"\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function IsInFoldingLists(name)\r\n");
      out.write("\t{\r\n");
      out.write("\tvar sRet = false;\r\n");
      out.write("\tif(name == \"foldinglist\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\tif(name == \"foldinglist_agent\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\tif(name == \"foldinglist_agent_inactive\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\tif(name == \"foldinglist_group\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\tif(name == \"foldinglist_group_inactive\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\tif(name == \"foldinglist_server\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\tif(name == \"foldinglist_user\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\tif(name == \"foldinglist_user_inactive\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\tif(name == \"foldinglist_telephone\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\tif(name == \"foldinglist_historical\")\r\n");
      out.write("\t\tsRet = true;\r\n");
      out.write("\r\n");
      out.write("\treturn sRet;\r\n");
      out.write("\t}\r\n");
      out.write("end not used ------ check before delete -------- */\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function StringParse(tobeParsed)\r\n");
      out.write("{\r\n");
      out.write("\tstringElements = new Array();\r\n");
      out.write("\r\n");
      out.write("\tvar pairs = tobeParsed.split(\"&\");\t//split by the token\r\n");
      out.write("\r\n");
      out.write("\tfor (var i=0;i<pairs.length;i++)\t//For each pair, split by the =\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar pos = pairs[i].indexOf('=');\r\n");
      out.write("\t\tif (pos >= 0)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tvar argname = pairs[i].substring(0,pos);\r\n");
      out.write("\t\t\tvar value = pairs[i].substring(pos+1);\r\n");
      out.write("\t\t\tstringElements[argname] = value;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\treturn stringElements;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function getRoutingScriptAndQueues(tenant_id)\r\n");
      out.write("{\r\n");
      out.write("\tvar rArray = new Array();\r\n");
      out.write("\tvar jsRSCripts = String( appletObj.getRoutingScripts(tenant_id, \"1\")  );\r\n");
      out.write("\tvar jsRSCRIPTArray = jsRSCripts.split(\"|\");\r\n");
      out.write("\t\r\n");
      out.write("\t\t\r\n");
      out.write("\tfor(var i = 0; i < jsRSCRIPTArray.length; i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(jsRSCRIPTArray[i].length != 0)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tthisRScript = jsRSCRIPTArray[i].split(\",\");\r\n");
      out.write("\t\t\trArray.push(thisRScript[1]);\r\n");
      out.write("\t\t\t//Get virtual queues in this script...\r\n");
      out.write("\t\t\tvar thisScriptText = String( appletObj.getRoutingScript(thisRScript[0]) );\r\n");
      out.write("\t\t\tsplitedString = thisScriptText.split('^');\r\n");
      out.write("\t\t\t//var rootNoddle;\r\n");
      out.write("\t\t\tfor(var j = 0; j < splitedString.length; j++)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tvar curElement = splitedString[j];\r\n");
      out.write("\t\t\t\tmyElementTable = StringParse(curElement);\r\n");
      out.write("\t\t\t\tif(myElementTable['TYPE'] == 'AGENTPICKUP')\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\tfor(var it = 0; it < rArray.length; it++){\r\n");
      out.write("\t\t\t\t\t\tif(myElementTable['queueName'] == rArray[it] )\r\n");
      out.write("\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\tif(it >= rArray.length)\r\n");
      out.write("\t\t\t\t\t\trArray.push(myElementTable['queueName']);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t//alert(rArray);\r\n");
      out.write("\treturn rArray;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/*  not used ------ check before delete --------\r\n");
      out.write("function get_cookie(Name) \r\n");
      out.write("{\r\n");
      out.write("\t//Get cookie routine by Shelley Powers\r\n");
      out.write("\tvar search = Name + \"=\"\r\n");
      out.write("\tvar returnvalue = \"\";\r\n");
      out.write("\tif (document.cookie.length > 0) \r\n");
      out.write("\t{\r\n");
      out.write("\t\toffset = document.cookie.indexOf(search)\r\n");
      out.write("\t\t// if cookie exists\r\n");
      out.write("\t\tif (offset != -1) \r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\toffset += search.length\r\n");
      out.write("\t\t\t// set index of beginning of value\r\n");
      out.write("\t\t\tend = document.cookie.indexOf(\";\", offset);\r\n");
      out.write("\t\t\t// set index of end of cookie value\r\n");
      out.write("\t\t\tif (end == -1) end = document.cookie.length;\r\n");
      out.write("\t\t\t\treturnvalue=unescape(document.cookie.substring(offset, end))\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\treturn returnvalue;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkit()\r\n");
      out.write("{\r\n");
      out.write("  \tfor (i=0 ; i <= nodelength ; i++)\r\n");
      out.write("  \t{\r\n");
      out.write("    \tif ((ns6&&foldercontentarray[i].style.display=='')||(ie4&&foldinglist[i].style.display==''))\r\n");
      out.write("       \t\topenones=openones + \" \" + i\r\n");
      out.write("  \t}\r\n");
      out.write("\t//alert('openones='+openones);\r\n");
      out.write("  \tdocument.cookie=window.location.pathname+\"=\"+openones\r\n");
      out.write("}\r\n");
      out.write("end not used ------ check before delete -------- */\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/*  not used ------ check before delete --------\r\n");
      out.write("if (ie4||ns6)\r\n");
      out.write("\tdocument.onclick=checkcontained;\r\n");
      out.write("end not used ------ check before delete -------- */\t\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/*  not used ------ check before delete --------\r\n");
      out.write("function refreshdiv(id, div_text)\r\n");
      out.write("{\r\n");
      out.write("\t//alert(\"id, div_text \\n\" + id +\" \\n \"+div_text);\r\n");
      out.write("\tdocument.getElementById(id).outerHTML = div_text;\r\n");
      out.write("}\r\n");
      out.write("end not used ------ check before delete -------- */\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/*  not used ------ check before delete --------\r\n");
      out.write("function alertj()\r\n");
      out.write("{\r\n");
      out.write("\talert(\"jadjdjdjd\");\r\n");
      out.write("}\r\n");
      out.write("end not used ------ check before delete -------- */\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<!--  \r\n");
      out.write(" ************************\r\n");
      out.write(" * Script for the new skin\r\n");
      out.write(" *************************\r\n");
      out.write(" -->\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("var prefixAheevaMenuItem  =  'AheevaMenuItem';\r\n");
      out.write("\r\n");
      out.write("function visibleTog (obj1){\t\t\t\t\t\t// show/hide sub-sections in menu tree\r\n");
      out.write("\t\r\n");
      out.write("\tvar divName2 = \"\"+(obj1.id)+\"_menu\";\r\n");
      out.write("\tvar tog01 = document.getElementById (divName2);\r\n");
      out.write("\tvar tog02 = tog01.lastChild;\r\n");
      out.write("\r\n");
      out.write("\tif (tog01.style.display == 'none' && tog01.childNodes.length >1 && tog02.previousSibling.tagName == ('SCRIPT') && tog02.previousSibling.childNodes.length <1) {\r\n");
      out.write("\t\ttog01.style.display = 'none';\r\n");
      out.write("\t\tif(tog01.nextSibling) {\r\n");
      out.write("\t\t\tif(tog01.nextSibling.tagName == ('%')){\r\n");
      out.write("\t\t\t\tif (tog01.nextSibling.nextSibling.className.match(/menuspacer/)){\r\n");
      out.write("\t\t\t\t\ttog02.style.display = '';\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\tif (tog01.nextSibling.className.match(/menuspacer/)){\r\n");
      out.write("\t\t\t\ttog02.style.display = '';\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}else if (tog01.style.display == 'none' && tog01.childNodes.length >1 ) {\r\n");
      out.write("\t\ttog01.style.display = '';\r\n");
      out.write("\t\tif(tog01.nextSibling) {\r\n");
      out.write("\t\t\tif(tog01.nextSibling.tagName == ('%'))\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tif (tog01.nextSibling.nextSibling.className.match(/menuspacer/)){\r\n");
      out.write("\t\t\t\t\ttog02.style.display = 'none';\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}else{\t\r\n");
      out.write("\t\t\t\tif (tog01.nextSibling.className.match(/menuspacer/)){\r\n");
      out.write("\t\t\t\ttog02.style.display = 'none';\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}else {\r\n");
      out.write("\t\ttog01.style.display = 'none';\r\n");
      out.write("\t\tif(tog01.nextSibling) {\r\n");
      out.write("\t\t\tif(tog01.nextSibling.tagName == ('%')) {\r\n");
      out.write("\t\t\t\tif (tog01.nextSibling.nextSibling.className.match(/menuspacer/)){\r\n");
      out.write("\t\t\t\t\ttog02.style.display = '';\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\tif (tog01.nextSibling.className.match(/menuspacer/)){\r\n");
      out.write("\t\t\t\ttog02.style.display = '';\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\textendMenuSpace();\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("function imageTog (obj, divName){\t\t\t\t// swaps images in tree menu for open/closed sections\r\n");
      out.write("\t\r\n");
      out.write("\tvar theFullId = obj.id\r\n");
      out.write("\tvar divNameLength = divName.search(/$/);\r\n");
      out.write("\tvar tenantIdBit = theFullId.substr(divNameLength);\r\n");
      out.write("\t\r\n");
      out.write("\tvar objParent = (document.getElementById (obj.id).parentNode).style.backgroundImage;\r\n");
      out.write("\tvar closed1 = \"url(img/\"+(divName)+\"_closed.gif)\";\r\n");
      out.write("\tvar open1 = \"url(img/\"+(divName)+\"_open.gif)\";\r\n");
      out.write("\r\n");
      out.write("\tvar howMany = document.getElementById(\"\"+(obj.id)+\"_menu\").childNodes.length ;\r\n");
      out.write("\tvar lasttagName = (howMany >1 ) ? (document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling).tagName :  null ;\r\n");
      out.write("\t\r\n");
      out.write("\tif (obj.style.backgroundImage == (closed1)){\r\n");
      out.write("\t\tobj.style.backgroundImage = (open1);\r\n");
      out.write("\t\tif (lasttagName == ('SCRIPT') && document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.childNodes.length <1){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t}else if (howMany >1 ){\r\n");
      out.write("\t\t\tif(objParent.match(/_end/)){\r\n");
      out.write("\t\t\t(document.getElementById (obj.id).parentNode).style.backgroundImage = (objParent.replace(/_end/,\"_endopen\"));\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t(document.getElementById (obj.id).parentNode).style.backgroundImage = (objParent.replace(/_bg/,\"_bgopen\"));\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif (lasttagName == ('SCRIPT') && document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.childNodes.length <1){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t}else if ((lasttagName != null) &&( lasttagName == ('%')) ){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar lastdivName = (document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.previousSibling.previousSibling).style.backgroundImage;\r\n");
      out.write("\r\n");
      out.write("\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_bg/,\"_end\"));\r\n");
      out.write("\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t}else if (lasttagName != null){\r\n");
      out.write("\r\n");
      out.write("\t\t\tif (lasttagName == ('A')){\r\n");
      out.write("\t\t\t\tvar lastaName = (document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling).style.backgroundImage;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling).style.backgroundImage = (lastaName.replace(/_bg/,\"_end\"));\r\n");
      out.write("\t\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}else if (lasttagName == ('SCRIPT') && document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.childNodes.length >0){\r\n");
      out.write("\t\t\t\tvar lastaName = (document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.lastChild).style.backgroundImage;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.lastChild).style.backgroundImage = (lastaName.replace(/_bg/,\"_end\"));\r\n");
      out.write("\t\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.lastChild).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\tvar lastdivName = (document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.previousSibling).style.backgroundImage;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_bg/,\"_end\"));\r\n");
      out.write("\t\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\tbuildOpenMenusCookie(divName,tenantIdBit);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tvar  listEnd =  \"\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tobj.style.backgroundImage = (closed1);\r\n");
      out.write("\t\tif (lasttagName == ('SCRIPT') && document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.childNodes.length <1){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t}else if(objParent.match(/_end/)){\r\n");
      out.write("\t\t\t(document.getElementById (obj.id).parentNode).style.backgroundImage = (objParent.replace(/_endopen/,\"_end\"));\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\t(document.getElementById (obj.id).parentNode).style.backgroundImage = (objParent.replace(/_bgopen/,\"_bg\"));\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif (lasttagName == ('SCRIPT') && document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.childNodes.length <1){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t}else if (lasttagName == ('A')){\r\n");
      out.write("\t\t\tvar lastaName = (document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling).style.backgroundImage;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling).style.backgroundImage = (lastaName.replace(/_end/,\"_bg\"));\r\n");
      out.write("\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tvar lastdivName = (document.getElementById (\"\"+(obj.id)+\"_menu\").childNodes.length > 1)  ? (document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling).style.backgroundImage : '';  \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(lastdivName != '') {\r\n");
      out.write("\t\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_end/,\"_bg\"));\r\n");
      out.write("\t\t\t\t(document.getElementById (\"\"+(obj.id)+\"_menu\").lastChild.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tbuildOpenMenusCookie(divName,tenantIdBit);\r\n");
      out.write("\t\t\r\n");
      out.write("\t};\r\n");
      out.write("\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("var rememberMenuOpenSections = checkForCookie(prefixAheevaMenuItem);\t\t\t// stores list of open menu tree sections for persisance on page refresh\r\n");
      out.write("\r\n");
      out.write("function buildOpenMenusCookie(categoryPart,tenantPart) {\t\t\t\t\t\t// add/remove sections from the open menu tree list variable\r\n");
      out.write("\tif(rememberMenuOpenSections.match(categoryPart+\"-\"+tenantPart+\",\")){\t\t\t\t\t\t// if in list...\r\n");
      out.write("\t\tvar cutMe = rememberMenuOpenSections.replace(categoryPart+\"-\"+tenantPart+\",\", \"\");\t\t// ...remove from list\r\n");
      out.write("\t\trememberMenuOpenSections = cutMe;\r\n");
      out.write("\t}else{\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t// if not in list...\r\n");
      out.write("\t\trememberMenuOpenSections +=categoryPart+\"-\"+tenantPart+\",\";\t\t\t\t\t\t\t\t// ...add to list\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/*  not used ------ check before delete --------\r\n");
      out.write("function markMenuItemPersistent(menuItemName, menuItemValue, pesrsistentExpirationdays) {\r\n");
      out.write("\tif (pesrsistentExpirationdays) {\r\n");
      out.write("\t\tvar date = new Date();\r\n");
      out.write("\t\tdate.setTime(date.getTime()+(pesrsistentExpirationdays*24*60*60*1000));\r\n");
      out.write("\t\tvar expirationTime = \"; expires=\"+date.toGMTString();\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tvar expirationTime = \"\";\t\r\n");
      out.write("\t}\r\n");
      out.write("\tdocument.cookie = menuItemName+\"=\"+menuItemValue + expirationTime;\r\n");
      out.write("};\r\n");
      out.write("end not used ------ check before delete -------- */\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function chekMenuItems() {\t\t\t\t\t\t\t\t// reset menu tree to state before page refresh\r\n");
      out.write("//\talert(document.cookie.length);\r\n");
      out.write("//\talert(document.cookie);\r\n");
      out.write(" \tif( document.cookie != null  ||  document.cookie.length > 0) {\r\n");
      out.write("\t \tvar allCookies  =     document.cookie.split(';');\r\n");
      out.write("\t \t\r\n");
      out.write("//\t\talert(allCookies.length);\r\n");
      out.write("\t\t\r\n");
      out.write("\t \tfor(var i=0; i < allCookies.length ; i++){\r\n");
      out.write("\t \t\tvar aCookie  = makeTrim(allCookies[i]);\r\n");
      out.write("\t \t\tif(aCookie.indexOf(prefixAheevaMenuItem ) != -1){ // We have a menu item\r\n");
      out.write("\t\t\t\tif(aCookie.length >  prefixAheevaMenuItem.length) {\r\n");
      out.write("\t \t\t\t\tvar menuItemList  \t\t\t=  unescape(aCookie.substr(prefixAheevaMenuItem.length+1));\r\n");
      out.write("\t\t\t\t\tvar menuItemPairs \t\t\t= menuItemList.split(',');\r\n");
      out.write("\t\t\t\t\tfor(var j=0; j < menuItemPairs.length ; j++){\r\n");
      out.write("\t\t\t\t\t\tvar anItemPair  \t\t\t= menuItemPairs[j];\r\n");
      out.write("\t\t\t\t\t\tif(anItemPair.length >  0) {\r\n");
      out.write("\t\t\t\t\t\t\tvar menuItemElements \t\t= anItemPair.split('-');\r\n");
      out.write("\t\t\t\t\t\t\tvar categoryIdBit \t\t\t= menuItemElements[0];\r\n");
      out.write("\t\t\t\t\t\t\tvar tenantIdBit \t\t\t= menuItemElements[1];\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t \t\t\t\t\tvar divObj      \t\t\t=  document.getElementById(categoryIdBit+tenantIdBit);  \r\n");
      out.write("\t\t \t\t\t\t\tvar divObjMenu      \t\t=  document.getElementById(categoryIdBit+tenantIdBit+'_menu');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t \t\t\t\t\tif(divObjMenu !=  null  && (divObjMenu.hasChildNodes() && divObjMenu.childNodes.length > 1)) {\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\tif(divObjMenu.lastChild.previousSibling.tagName == ('SCRIPT') && divObjMenu.lastChild.previousSibling.childNodes.length <1) {\r\n");
      out.write("\t\t \t\t\t\t\t\t\tdivObjMenu.style.display \t= 'none';\r\n");
      out.write("\t\t\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t \t\t\t\t\t\t\tdivObj.style.backgroundImage= \"url(img/\"+categoryIdBit+\"_open.gif)\";\r\n");
      out.write("\t\t \t\t\t\t\t\t\tdivObjMenu.style.display \t= '';\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\tvar objParent = (divObj.parentNode).style.backgroundImage;\r\n");
      out.write("\t\t\t\t\t\t\t\t\tvar howMany = divObjMenu.childNodes.length ;\r\n");
      out.write("\t\t\t\t\t\t\t\t\tvar lasttagName = (howMany >1 ) ? (divObjMenu.lastChild.previousSibling).tagName :  null ;\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\tif (lasttagName == ('SCRIPT') && divObjMenu.lastChild.previousSibling.childNodes.length <1){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}else if (howMany >1 ){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tif(objParent.match(/_end/)){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t(divObj.parentNode).style.backgroundImage = (objParent.replace(/_end/,\"_endopen\"));\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t(divObj.parentNode).style.backgroundImage = (objParent.replace(/_bg/,\"_bgopen\"));\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\tif (lasttagName == ('SCRIPT') && divObjMenu.lastChild.previousSibling.childNodes.length <1){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}else if ((lasttagName != null) &&( lasttagName == ('%')) ){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tvar lastdivName = (divObjMenu.lastChild.previousSibling.previousSibling.previousSibling).style.backgroundImage;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t(divObjMenu.lastChild.previousSibling.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_bg/,\"_end\"));\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t(divObjMenu.lastChild.previousSibling.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}else if (lasttagName != null){\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tif (lasttagName == ('A')){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tvar lastaName = (divObjMenu.lastChild.previousSibling).style.backgroundImage;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t(divObjMenu.lastChild.previousSibling).style.backgroundImage = (lastaName.replace(/_bg/,\"_end\"));\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t(divObjMenu.lastChild.previousSibling).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}else if (lasttagName == ('SCRIPT') && divObjMenu.lastChild.previousSibling.childNodes.length >0){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tvar lastaName = (divObjMenu.lastChild.previousSibling.lastChild).style.backgroundImage;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t(divObjMenu.lastChild.previousSibling.lastChild).style.backgroundImage = (lastaName.replace(/_bg/,\"_end\"));\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t(divObjMenu.lastChild.previousSibling.lastChild).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tvar lastdivName = (divObjMenu.lastChild.previousSibling.previousSibling).style.backgroundImage;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t(divObjMenu.lastChild.previousSibling.previousSibling).style.backgroundImage = (lastdivName.replace(/_bg/,\"_end\"));\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t(divObjMenu.lastChild.previousSibling.previousSibling).style.backgroundRepeat = 'no-repeat';\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\tif(divObjMenu.nextSibling){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tif(divObjMenu.nextSibling.tagName == ('%')) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tif (divObjMenu.nextSibling.nextSibling.className.match(/menuspacer/)){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tdivObjMenu.lastChild.style.display = 'none';\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}else{\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tif (divObjMenu.nextSibling.className.match(/menuspacer/)){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tdivObjMenu.lastChild.style.display = 'none';\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t \t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tfor(var k=0; k < menuItemPairs.length ; k++){\r\n");
      out.write("\t\t\t\t\t\tvar anItemPair2  \t\t\t= menuItemPairs[k];\r\n");
      out.write("\t\t\t\t\t\tif(anItemPair2.length >  0) {\r\n");
      out.write("\t\t\t\t\t\t\tvar menuItemElements2 \t\t= anItemPair2.split('-');\r\n");
      out.write("\t\t\t\t\t\t\tvar categoryIdBit2 \t\t\t= menuItemElements2[0];\r\n");
      out.write("\t\t\t\t\t\t\tvar tenantIdBit2 \t\t\t= menuItemElements2[1];\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tif(divObjMenu2) {\r\n");
      out.write("\t\t \t\t\t\t\t\tvar divObj2      \t\t\t= document.getElementById(categoryIdBit2+tenantIdBit2);  \r\n");
      out.write("\t\t \t\t\t\t\t\tvar divObjMenu2      \t\t= document.getElementById(categoryIdBit2+tenantIdBit2+'_menu');\r\n");
      out.write("\t\t\t\t\t\t\t\tvar menuLasttagName      \t= (document.getElementById(categoryIdBit2+tenantIdBit2+'_menu').lastChild.previousSibling).tagName;\r\n");
      out.write("\t\t\t\t\t\t\t\tvar menuObjParent \t\t\t= (document.getElementById (categoryIdBit2+tenantIdBit2).parentNode).style.backgroundImage;\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\tif ( menuLasttagName == ('%')){\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdivObjMenu2.lastChild.previousSibling.previousSibling.previousSibling.style.backgroundImage = \"url(img/\"+categoryIdBit2+\"_end.gif)\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdivObjMenu2.lastChild.previousSibling.previousSibling.previousSibling.style.backgroundRepeat=  'no-repeat';\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t}else if ( menuLasttagName == ('A')){\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdivObjMenu2.lastChild.previousSibling.style.backgroundImage = \"url(img/\"+categoryIdBit2+\"_end.gif)\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdivObjMenu2.lastChild.previousSibling.style.backgroundRepeat=  'no-repeat';\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t}else if ( menuLasttagName == ('SCRIPT') && divObjMenu2.lastChild.previousSibling.childNodes.length >0){\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdivObjMenu2.lastChild.previousSibling.lastChild.style.backgroundImage = \"url(img/\"+categoryIdBit2+\"_end.gif)\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdivObjMenu2.lastChild.previousSibling.lastChild.style.backgroundRepeat=  'no-repeat';\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t}else if ( menuLasttagName == ('SCRIPT') && divObjMenu2.lastChild.previousSibling.childNodes.length <1){\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdivObjMenu2.lastChild.previousSibling.previousSibling.style.backgroundImage = \"url(img/\"+categoryIdBit2+\"_end.gif)\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdivObjMenu2.lastChild.previousSibling.previousSibling.style.backgroundRepeat=  'no-repeat';\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\tif(menuLasttagName == ('SCRIPT') && divObjMenu2.lastChild.previousSibling.childNodes.length <1){\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t}else if(menuObjParent.match(/_end/)){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t(document.getElementById (categoryIdBit2+tenantIdBit2).parentNode).style.backgroundImage = (menuObjParent.replace(/_end/,\"_endopen\"));\r\n");
      out.write("\t\t\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t(document.getElementById (categoryIdBit2+tenantIdBit2).parentNode).style.backgroundImage = (menuObjParent.replace(/_bg/,\"_bgopen\"));\r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t \t\t}\r\n");
      out.write("\t \t}\r\n");
      out.write("\t}\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function makeTrim(st) {\r\n");
      out.write("\t\treturn st.replace(/^\\s+|\\s+$/g,\"\");\r\n");
      out.write("\t\t\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/*  not used ------ check before delete --------\r\n");
      out.write("function getRealId(partialid){\r\n");
      out.write("\tvar re= new RegExp(partialid,'g');\r\n");
      out.write("\tvar elems = document.getElementsByTagName('*'), i=0, el;\r\n");
      out.write("\twhile(el=elems[i++]){\r\n");
      out.write("\t\tif(el.className.match(re)){\r\n");
      out.write("\t\tvar elSection = (el.className.replace(/_fill/,\"\"));\r\n");
      out.write("\t\tvar backImage = el.firstChild.style.backgroundImage;\r\n");
      out.write("\t\tel.firstChild.style.backgroundImage = (backImage.replace(/inact_but/,\"\"+(elSection)+\"_but\"));\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("};\r\n");
      out.write("end not used ------ check before delete -------- */\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("// ---------- rollover fade effect ---------- //\r\n");
      out.write("function colorFade(id,element,start,end,steps,speed) {\r\n");
      out.write("  var startrgb,endrgb,er,eg,eb,step,rint,gint,bint,step;\r\n");
      out.write("  var target = (id);\r\n");
      out.write("  steps = steps || 20;\r\n");
      out.write("  speed = speed || 20;\r\n");
      out.write("  clearInterval(target.timer);\r\n");
      out.write("  endrgb = colorConv(end);\r\n");
      out.write("  er = endrgb[0];\r\n");
      out.write("  eg = endrgb[1];\r\n");
      out.write("  eb = endrgb[2];\r\n");
      out.write("  if(!target.r) {\r\n");
      out.write("    startrgb = colorConv(start);\r\n");
      out.write("    r = startrgb[0];\r\n");
      out.write("    g = startrgb[1];\r\n");
      out.write("    b = startrgb[2];\r\n");
      out.write("    target.r = r;\r\n");
      out.write("    target.g = g;\r\n");
      out.write("    target.b = b;\r\n");
      out.write("  }\r\n");
      out.write("  rint = Math.round(Math.abs(target.r-er)/steps);\r\n");
      out.write("  gint = Math.round(Math.abs(target.g-eg)/steps);\r\n");
      out.write("  bint = Math.round(Math.abs(target.b-eb)/steps);\r\n");
      out.write("  if(rint == 0) { rint = 1 }\r\n");
      out.write("  if(gint == 0) { gint = 1 }\r\n");
      out.write("  if(bint == 0) { bint = 1 }\r\n");
      out.write("  target.step = 1;\r\n");
      out.write("  target.timer = setInterval( function() { animateColor(id,element,steps,er,eg,eb,rint,gint,bint) }, speed);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("// incrementally close the gap between the two colors //\r\n");
      out.write("function animateColor(id,element,steps,er,eg,eb,rint,gint,bint) {\r\n");
      out.write("  var target = (id);\r\n");
      out.write("  var color;\r\n");
      out.write("  if(target.step <= steps) {\r\n");
      out.write("    var r = target.r;\r\n");
      out.write("    var g = target.g;\r\n");
      out.write("    var b = target.b;\r\n");
      out.write("    if(r >= er) {\r\n");
      out.write("      r = r - rint;\r\n");
      out.write("    } else {\r\n");
      out.write("      r = parseInt(r) + parseInt(rint);\r\n");
      out.write("    }\r\n");
      out.write("    if(g >= eg) {\r\n");
      out.write("      g = g - gint;\r\n");
      out.write("    } else {\r\n");
      out.write("      g = parseInt(g) + parseInt(gint);\r\n");
      out.write("    }\r\n");
      out.write("    if(b >= eb) {\r\n");
      out.write("      b = b - bint;\r\n");
      out.write("    } else {\r\n");
      out.write("      b = parseInt(b) + parseInt(bint);\r\n");
      out.write("    }\r\n");
      out.write("    color = 'rgb(' + r + ',' + g + ',' + b + ')';\r\n");
      out.write("    if(element == 'background') {\r\n");
      out.write("      target.style.backgroundColor = color;\r\n");
      out.write("    } else if(element == 'border') {\r\n");
      out.write("      target.style.borderColor = color;\r\n");
      out.write("    } else {\r\n");
      out.write("      target.style.color = color;\r\n");
      out.write("    }\r\n");
      out.write("    target.r = r;\r\n");
      out.write("    target.g = g;\r\n");
      out.write("    target.b = b;\r\n");
      out.write("    target.step = target.step + 1;\r\n");
      out.write("  } else {\r\n");
      out.write("    clearInterval(target.timer);\r\n");
      out.write("    color = 'rgb(' + er + ',' + eg + ',' + eb + ')';\r\n");
      out.write("    if(element == 'background') {\r\n");
      out.write("      target.style.backgroundColor = color;\r\n");
      out.write("    } else if(element == 'border') {\r\n");
      out.write("      target.style.borderColor = color;\r\n");
      out.write("    } else {\r\n");
      out.write("      target.style.color = color;\r\n");
      out.write("    }\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("// convert the color to rgb from hex //\r\n");
      out.write("function colorConv(color) {\r\n");
      out.write("  var rgb = [parseInt(color.substring(0,2),16), \r\n");
      out.write("    parseInt(color.substring(2,4),16), \r\n");
      out.write("    parseInt(color.substring(4,6),16)];\r\n");
      out.write("  return rgb;\r\n");
      out.write("};\r\n");
      out.write("// ---------- end rollover fade effect ---------- //\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function openBuilder() {\t\t\t// open form builder in new window, set initial size and focus to the form builder\r\n");
      out.write("\t\t\t\t\t\t\t\t\t// target set to 'Text' because 'template_outbound' (and any forms that were 'save as' using 'template_outbound' as a base) seems to be renaming the window to 'Text' when loaded into window with other name. (changed in 'active', 'inactive', 'add new' and 'function openBuilder()'. original target name was 'mybuilder'.\r\n");
      out.write("\tvar openPop=window.open(\"\",\"Text\",\"status=0, location=0, menubar=0, toolbar=0, directories=0, width=1000, height=650, resizable=1\");\r\n");
      out.write("\topenPop.focus();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function menuFit() {\t\t\t\t\t//resizes content of menu frame to fit on-the-fly\r\n");
      out.write("\tvar availableHeight = document.getElementById(\"menuBody\").offsetHeight - 20;\r\n");
      out.write("\t\r\n");
      out.write("\tif(document.getElementById(\"menuSearchBox\")) {\r\n");
      out.write("\t\tvar searchBoxHeight = document.getElementById(\"menuSearchBox\").offsetHeight;\r\n");
      out.write("\t\r\n");
      out.write("\t\tdocument.getElementById(\"base_level_menu\").style.height = (availableHeight-searchBoxHeight) + \"px\";\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tdocument.getElementById(\"base_level_menu\").style.height = availableHeight + \"px\";\r\n");
      out.write("\t}\r\n");
      out.write("\textendMenuSpace();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function extendMenuSpace() {\t\t\t// alows last item in menu to be scrolled to top of page\r\n");
      out.write("\tif(document.getElementById(\"menuBottomPos\")) {\r\n");
      out.write("\t\tvar menuBottom = document.getElementById(\"menuBottomPos\").offsetTop - 20;\t\t\t\t\t\t// gives the hight of the menu tree\r\n");
      out.write("\t\tvar visMenuHeight = document.getElementById(\"base_level_menu\").offsetHeight - 20;\t\t\t\t// gives the available viewing area height for the menu\r\n");
      out.write("\t\tdocument.getElementById(\"treeContainerHeight\").style.height = visMenuHeight+menuBottom + \"px\";\t// extends space below the menu tree\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function getSearchBoxState() {\t\t\t// resets search box when page refresh\r\n");
      out.write("\tif(document.getElementById(\"search001\")) {\t\t\t\t\t\t\t\t\t\t\t\t\t\t// if search box is on page\r\n");
      out.write("\t\r\n");
      out.write("\t\tdocument.getElementById(\"whichTenant\").value=tenantVal;\t\t\t\t\t\t\t\t\t\t// reset tenant value in search list\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(document.getElementById(categoryVal+\"_opt\")){\t// user category privaleges have not been removed\r\n");
      out.write("\t\t\tdocument.getElementById(\"whichCategory\").value=categoryVal;\t\t\t\t\t\t\t\t// reset category value in search list\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tdocument.getElementById(\"whichCategory\").value=\"\";\t\t\t\t\t\t\t\t\t\t// reset category if user privaleges removed\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tdocument.getElementById(\"serResults\").innerHTML=checkForCookie('serResults');\t\t\t\t// reset results message to same as before page refresh\r\n");
      out.write("\t\tif(document.getElementById(categoryVal+\"_opt\")){\r\n");
      out.write("\t\t\tdocument.getElementById(\"serResults\").style.display=checkForCookie('serResultsVis');\t\t// reset results message visibility to same as before page refresh\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tdocument.getElementById(\"serResults\").style.display=\"none\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tdocument.getElementById(\"search001\").style.display=checkForCookie('search001Vis');\t\t// reset results message visibility to same as before page refresh\r\n");
      out.write("\t\tif(document.getElementById(\"search001\").style.display==\"none\") {\t\t\t\t\t\t\t// search box is closed \r\n");
      out.write("\t\t\tdocument.getElementById(\"openArrows\").innerHTML=search_openme_str;\r\n");
      out.write("\t\t}else {\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t// search box is open\r\n");
      out.write("\t\t\tdocument.getElementById(\"openArrows\").innerHTML=search_closeme_str;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tsetupResults();\r\n");
      out.write("\t\tdocument.getElementById(\"searchfirst\").value=checkForCookie('searchfirst');\t\t\t\t\t// put search values back in the fields\r\n");
      out.write("\t\tdocument.getElementById(\"searchlast\").value=checkForCookie('searchlast');\r\n");
      out.write("\t\tdocument.getElementById(\"searchid\").value=checkForCookie('searchid');\r\n");
      out.write("\t\tdocument.getElementById(\"searchfullname\").value=checkForCookie('searchfullname');\r\n");
      out.write("\t\tdocument.getElementById(\"searchpartname\").value=checkForCookie('searchpartname');\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tdocument.getElementById(\"synchroMessage\").style.display=\"none\";\t\t\t\t\t\t\t\t\t// hide synchronizing menu message\r\n");
      out.write("\tif(document.getElementById(\"menuSearchBox\")) {\r\n");
      out.write("\t\tdocument.getElementById(\"menuSearchBox\").style.visibility=\"\";\t\t\t\t\t\t\t\t// make search box visible\r\n");
      out.write("\t}\r\n");
      out.write("\tif(document.getElementById(\"search001\")) {\r\n");
      out.write("\t\tcatSelection();\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tmenuFit();\r\n");
      out.write("\t}\r\n");
      out.write("\tdocument.getElementById(\"base_level_menu\").scrollTop=scrollHere;\t\t\t\t\t\t\t\t// reset menu position to where it was before page refresh\r\n");
      out.write("\tdocument.getElementById(\"base_level_menu\").style.visibility=\"\";\t\t\t\t\t\t\t\t\t// make menu tree visible\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function closeAllTreeMenu() {\t\t\t// colapse tree menu\r\n");
      out.write("\tvar allOpenTree = document.getElementById(\"base_level_menu\").getElementsByTagName(\"div\");\r\n");
      out.write("\tfor (var i=0; i<allOpenTree.length; i++) {\r\n");
      out.write("\t\tif(allOpenTree[i].id.match(\"_menu\")) {\r\n");
      out.write("\t\t\tif (allOpenTree[i].style.display==\"\") {\r\n");
      out.write("\t\t\t\tvar dropMenuFromId = allOpenTree[i].id.replace(/_menu/,\"\");\r\n");
      out.write("\t\t\t\tvar allClassName = allOpenTree[i].previousSibling.className;\r\n");
      out.write("\t\t\t\tvar getIdFromClass = allClassName.replace(/_fill/,\"\");\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(dropMenuFromId));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(dropMenuFromId),getIdFromClass);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tdocument.getElementById(\"base_level_menu\").scrollTop=0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function onPressKey() {\r\n");
      out.write("       \r\n");
      out.write("\tif (event.keyCode == 13) {\t\t\t\t\t// when the Enter key is pressed...\r\n");
      out.write("\t\tif (document.activeElement) {\t\t\t// for ie\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\tif(document.activeElement.id==\"searchfirst\" || document.activeElement.id==\"searchlast\" || document.activeElement.id==\"searchid\" || document.activeElement.id==\"searchfullname\" || document.activeElement.id==\"searchpartname\") {\t// ...and focus is in search form fields\r\n");
      out.write("\t\t\t\tdoMenuSearch();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}else{\t\t\t\t\t\t\t\t\t// for firefox\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\tif(document.focusNode.id==\"searchfirst\" || document.focusNode.id==\"searchlast\" || document.focusNode.id==\"searchid\" || document.focusNode.id==\"searchfullname\" || document.focusNode.id==\"searchpartname\") {\t\t\t\t// ...and focus is in search form fields\r\n");
      out.write("\t\t\t\tdoMenuSearch();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("// following shortcut key functions only works if focus is in the menu frame. Would be good to make these work across all frames in future release\r\n");
      out.write("\r\n");
      out.write("\tif(event.ctrlKey){\r\n");
      out.write("\t\tif (event.keyCode == 83){\t\t\t\t\t\t\t// when 'ctrl'+'s\" is pressed...\r\n");
      out.write("\t\t\tif(document.getElementById(\"menuSearchBox\")){\t// ...and search box is present\r\n");
      out.write("\t\t\t\topenSearch();\t\t\t\t\t\t\t\t// open or close the search box\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif (event.keyCode == 49){\t\t\t\t\t\t\t// when 'ctrl'+'1\" is pressed\r\n");
      out.write("\t\t\tcloseAllTreeMenu();\t\t\t\t\t\t\t\t// collapse the menu tree\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function rememberMenuSettings() {\r\n");
      out.write("\tmarkItemPersistent(prefixAheevaMenuItem, rememberMenuOpenSections);\t\t\t\t\t\t// remember open menu sections\r\n");
      out.write("\tmarkItemPersistent(\"tenantVal\",tenantVal);\t\t\t\t\t\t\t\t\t\t\t\t// remember tenant\r\n");
      out.write("\tmarkItemPersistent(\"categoryVal\",categoryVal);\t\t\t\t\t\t\t\t\t\t\t// remember category\r\n");
      out.write("\tmarkItemPersistent(\"scrollHere\",document.getElementById(\"base_level_menu\").scrollTop);\t// remember Menu Position\r\n");
      out.write("\tmarkItemPersistent(\"resArrayPos\",resArrayPos);\t\t\t\t\t\t\t\t\t\t\t// remember which result was shown last\r\n");
      out.write("\tvar compactResults = resultDivs.join(';');\r\n");
      out.write("\t\r\n");
      out.write("\tmarkItemPersistent(\"resultDivs\",compactResults);\t\t\t\t\t\t\t\t\t\t// remember all results\r\n");
      out.write("\t\r\n");
      out.write("\tmarkItemPersistent(\"searchfirst\",document.getElementById(\"searchfirst\").value);\t\t\t// remember search field properties\r\n");
      out.write("\tmarkItemPersistent(\"searchlast\",document.getElementById(\"searchlast\").value);\r\n");
      out.write("\tmarkItemPersistent(\"searchid\",document.getElementById(\"searchid\").value);\r\n");
      out.write("\tmarkItemPersistent(\"searchfullname\",document.getElementById(\"searchfullname\").value);\r\n");
      out.write("\tmarkItemPersistent(\"searchpartname\",document.getElementById(\"searchpartname\").value);\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function markItemPersistent(menuItemName, menuItemValue, pesrsistentExpirationdays) {\r\n");
      out.write("\tif (pesrsistentExpirationdays) {\r\n");
      out.write("\t\tvar date = new Date();\r\n");
      out.write("\t\tdate.setTime(date.getTime()+(pesrsistentExpirationdays*24*60*60*1000));\r\n");
      out.write("\t\tvar expirationTime = \"; expires=\"+date.toGMTString();\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tvar expirationTime = \"\";\t\r\n");
      out.write("\t}\r\n");
      out.write("\tdocument.cookie = menuItemName+\"=\"+escape(menuItemValue)+expirationTime;\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("function checkForCookie(c_name) {\r\n");
      out.write("\tif (document.cookie.length>0){\r\n");
      out.write("\t\tc_start=document.cookie.indexOf(c_name + \"=\");\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif (c_start!=-1){ \r\n");
      out.write("\t\t\tc_start=c_start + c_name.length+1; \r\n");
      out.write("\t\t\tc_end=document.cookie.indexOf(\";\",c_start);\r\n");
      out.write("\t\t\tif (c_end==-1) c_end=document.cookie.length;\r\n");
      out.write("\t\t\tif(c_name==\"tenantVal\"){\t\t\t\t\t\t\t\t// check if tenant has been deleted\r\n");
      out.write("\t\t\t\tvar tenToFind = Number(document.cookie.substring(c_start,c_end));\r\n");
      out.write("\t\t\t\tvar tenExists = 0;\r\n");
      out.write("\t\t\t\t");

					for(int i = 0; i < tenantsDataResult.size(); i++)
					{
						String tenanttofind_dbid = (String)tenantsDataResult.elementAt(i).get("dbid");
				
      out.write("\r\n");
      out.write("\t\t\t\t\t\tif(");
      out.print(tenanttofind_dbid);
      out.write("==tenToFind){\r\n");
      out.write("\t\t\t\t\t\t\ttenExists=1;\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t");

					}
				
      out.write("\r\n");
      out.write("\t\t\t\tif(tenExists==1){\t\t\t\t\t\t\t\t\t// not deleted - use the tenant id\r\n");
      out.write("\t\t\t\t\treturn unescape(document.cookie.substring(c_start,c_end));\r\n");
      out.write("\t\t\t\t}else{\t\t\t\t\t\t\t\t\t\t\t\t// been deleted - use the first tenant id in string\r\n");
      out.write("\t\t\t\t\treturn ");
      out.print(tenantsDataResult.elementAt(0).get("dbid"));
      out.write(";\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\treturn unescape(document.cookie.substring(c_start,c_end));\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t} \r\n");
      out.write("\t}\r\n");
      out.write("\tif(c_name==\"scrollHere\" || c_name==\"resArrayPos\") {\r\n");
      out.write("\t\treturn 0;\r\n");
      out.write("\t}else if (c_name==\"serResultsVis\" || c_name==\"search001Vis\"){\r\n");
      out.write("\t\treturn \"none\";\r\n");
      out.write("\t}else if (c_name==\"tenantVal\"){\r\n");
      out.write("\t\tif (");
      out.print(tenantsDataResult.size());
      out.write(">0){\t\t\t\t// check there are tenants\r\n");
      out.write("\t\t\treturn ");
      out.print(tenantsDataResult.elementAt(0).get("dbid"));
      out.write(";\r\n");
      out.write("\t\t}else{\t\t\t\t\t\t\t\t\t\t\t\t// if there are no tenants - should never occur\r\n");
      out.write("\t\t\treturn 1;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\treturn \"\";\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("var categoryFocus = \"\";\r\n");
      out.write("\r\n");
      out.write("//-------------------functions for search------------------------//\r\n");
      out.write("\r\n");
      out.write("var tenantVal\t\t= checkForCookie('tenantVal');\r\n");
      out.write("var categoryVal\t\t= checkForCookie('categoryVal');\r\n");
      out.write("var scrollHere\t\t= checkForCookie('scrollHere');\r\n");
      out.write("var resArrayPos\t\t= Number(checkForCookie('resArrayPos'));\r\n");
      out.write("\r\n");
      out.write("var makeResultArray\t= checkForCookie('resultDivs');\r\n");
      out.write("if (makeResultArray!=\"\"){\r\n");
      out.write("\tvar resultDivs\t= makeResultArray.split(';');\r\n");
      out.write("}else{\r\n");
      out.write("\tvar resultDivs\t= new Array();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("var result_str\t\t\t=\t\"<div style=\\\"color:#FFFBF0; padding-bottom:4px;\\\">result&nbsp;\"\r\n");
      out.write("\t\t\t\t\t\t\t+\"<span id=\\\"ThisResultNum\\\"></span>&nbsp;of&nbsp;<span id=\\\"numOfResults\\\"></span>\"\r\n");
      out.write("\t\t\t\t\t\t\t+\"</div>\"\r\n");
      out.write("\t\t\t\t\t\t\t+\"<div><nobr>\"\r\n");
      out.write("\t\t\t\t\t\t\t+\"<button id=\\\"resPrev\\\" onClick=\\\"nextPrevSearch('back')\\\" style=\\\"cursor:pointer; margin-right:15px;\\\" disabled=\\\"false\\\">");
      out.print(pageData.getWord("Previous"));
      out.write("</button>\"\r\n");
      out.write("\t\t\t\t\t\t\t+\"<button id=\\\"resNext\\\" onClick=\\\"nextPrevSearch('forward')\\\" style=\\\"cursor:pointer\\\" disabled=\\\"false\\\">&nbsp;&nbsp;");
      out.print(pageData.getWord("Next"));
      out.write("&nbsp;&nbsp;</button>\"\r\n");
      out.write("\t\t\t\t\t\t\t+\"</nobr></div>\";\r\n");
      out.write("\r\n");
      out.write("var no_result_str\t\t=\t\"<div style=\\\"color:#a00; padding-bottom:4px;\\\"><nobr><b>- ");
      out.print(pageData.getWord("no results found"));
      out.write(" -</b></nobr></div>\";\r\n");
      out.write("\r\n");
      out.write("var changed_result_str\t=\t\"<div style=\\\"color:#a00; padding-bottom:4px;\\\"><span>");
      out.print(pageData.getWord("menu content has changed"));
      out.write("</span style=\\\"margin-bottom8:px\\\"><br /><span>");
      out.print(pageData.getWord("please search again"));
      out.write("</span>\";\r\n");
      out.write("\r\n");
      out.write("var search_openme_str\t=\t\"");
      out.print(pageData.getWord("open"));
      out.write("<img src=\\\"img/menusearchopen.gif\\\" width=\\\"9\\\" height=\\\"9\\\" hspace=\\\"0\\\" vspace=\\\"0\\\" border=\\\"0\\\" align=\\\"middle\\\" style=\\\"margin-left:4px\\\" />\";\r\n");
      out.write("\r\n");
      out.write("var search_closeme_str\t=\t\"");
      out.print(pageData.getWord("close"));
      out.write("<img src=\\\"img/menusearchclose.gif\\\" width=\\\"9\\\" height=\\\"9\\\" hspace=\\\"0\\\" vspace=\\\"0\\\" border=\\\"0\\\" align=\\\"middle\\\" style=\\\"margin-left:4px\\\" />\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function searchTitleOver() {\r\n");
      out.write("\tdocument.getElementById(\"searchTitleBar\").style.backgroundColor=\"#AF5\";\r\n");
      out.write("\tdocument.getElementById(\"searchTitleBar\").style.color=\"#824100\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function searchTitleOut() {\r\n");
      out.write("\tdocument.getElementById(\"searchTitleBar\").style.backgroundColor=\"#AFA\";\r\n");
      out.write("\tdocument.getElementById(\"searchTitleBar\").style.color=\"\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function openSearch(){\r\n");
      out.write("\tif(document.getElementById(\"search001\").style.display==\"none\") {\t// open the search box\r\n");
      out.write("\t\tdocument.getElementById(\"search001\").style.display=\"\";\r\n");
      out.write("\t\tdocument.getElementById(\"openArrows\").innerHTML=search_closeme_str;\r\n");
      out.write("\t\tmarkItemPersistent(\"search001Vis\",'block');\r\n");
      out.write("\t}else{\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t// close the search box\r\n");
      out.write("\t \r\n");
      out.write("\t\tdocument.getElementById(\"search001\").style.display=\"none\";\r\n");
      out.write("\t\tdocument.getElementById(\"openArrows\").innerHTML=search_openme_str;\r\n");
      out.write("\t\tmarkItemPersistent(\"search001Vis\",'none');\r\n");
      out.write("\t}\r\n");
      out.write("\tsearchTitleOut();\r\n");
      out.write("\tmenuFit();\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function focusCat() {\r\n");
      out.write("\tcategoryFocus=1;\t\t// this variable ==1 only when category section is changed\r\n");
      out.write("\tcatSelection();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function catSelection() {\r\n");
      out.write("\tif (document.getElementById(\"whichCategory\").value == \"\") { \t\t// no selection made\r\n");
      out.write("\t\tdocument.getElementById(\"serAgent\").style.display = \"none\";\r\n");
      out.write("\t\tdocument.getElementById(\"serOther\").style.display = \"none\";\r\n");
      out.write("\t\tdocument.getElementById(\"mensearchbut\").disabled = true;\r\n");
      out.write("\t}else if (document.getElementById(\"whichCategory\").value == \"age\"){\t// agents selected\r\n");
      out.write("\t\tdocument.getElementById(\"serAgent\").style.display = \"\";\r\n");
      out.write("\t\tdocument.getElementById(\"serOther\").style.display = \"none\";\r\n");
      out.write("\t\tdocument.getElementById(\"mensearchbut\").disabled = false;\r\n");
      out.write("\t\tif(document.getElementById(\"search001\").style.display!=\"none\"){\r\n");
      out.write("\t\t\tif(categoryFocus==1){\t\t\t\t\t\t\t\t\t\t// will not put focus into this window when page refresh if another window is open\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"searchfirst\").focus();\t\t\t// move focus to first search field only if category section has been changed \r\n");
      out.write("\t\t\t\tcategoryFocus=\"\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}else{\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t// any other selection\r\n");
      out.write("\t\tdocument.getElementById(\"serAgent\").style.display = \"none\";\r\n");
      out.write("\t\tdocument.getElementById(\"serOther\").style.display = \"\";\r\n");
      out.write("\t\tdocument.getElementById(\"mensearchbut\").disabled = false;\r\n");
      out.write("\t\tif(document.getElementById(\"search001\").style.display!=\"none\"){\r\n");
      out.write("\t\t\tif(categoryFocus==1){\t\t\t\t\t\t\t\t\t\t// will not put focus into this window when page refresh if another window is open\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"searchfullname\").focus();\t\t// move focus to first search field only if category section has been changed\r\n");
      out.write("\t\t\t\tcategoryFocus=\"\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tmenuFit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function openMenuTree(){\t\t\t\t\t\t\t\t\t\t\t\t// opens tree menu branches to the requested sub-menu\r\n");
      out.write("\t\t\r\n");
      out.write("\tswitch (categoryVal){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tcase \"age\": case \"age_gr\": case \"cam\": case \"call\": case \"fil\": case \"treat\": case \"no_ready\": case \"skill\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"res\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"res\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"res\"+tenantVal),'res');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase \"no_call_cur\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"res\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"res\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"res\"+tenantVal),'res');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"no_call\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"no_call\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"no_call\"+tenantVal),'no_call');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase \"age_qu\": case \"rout_qu\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"res\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"res\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"res\"+tenantVal),'res');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"qu\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"qu\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"qu\"+tenantVal),'qu');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase \"q_m_eval\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"q_m\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"q_m\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"q_m\"+tenantVal),'q_m');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase \"q_m_eval_ans\": case \"q_m_eval_lab\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"q_m\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"q_m\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"q_m\"+tenantVal),'q_m');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"q_m_eval\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"q_m_eval\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"q_m_eval\"+tenantVal),'q_m_eval');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase \"team\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"w_f_man\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"w_f_man\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"w_f_man\"+tenantVal),'w_f_man');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase \"f_i_act_cur\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"f_i\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"f_i\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"f_i\"+tenantVal),'f_i');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"f_i_act\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"f_i_act\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"f_i_act\"+tenantVal),'f_i_act');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase \"f_i_com\": case \"mop\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"f_i\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"f_i\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"f_i\"+tenantVal),'f_i');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase \"stat\": case \"alert\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(\"m_c\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"m_c\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"m_c\"+tenantVal),'m_c');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase \"rout\": case \"popu\":\r\n");
      out.write("\t\t\tif (document.getElementById(\"ten\"+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(\"ten\"+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(\"ten\"+tenantVal),'ten');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (document.getElementById(categoryVal+tenantVal+\"_menu\").style.display==\"none\") {\r\n");
      out.write("\t\t\t\tvisibleTog(document.getElementById(categoryVal+tenantVal));\r\n");
      out.write("\t\t\t\timageTog(document.getElementById(categoryVal+tenantVal),categoryVal);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function scrollMenuHere(scrollMe) { \t\t\t\t\t\t\t// scroll selected menu sub-section to top of page\r\n");
      out.write("\tvar scrollFrom = document.getElementById(\"base_level_menu\").scrollTop;\r\n");
      out.write("\t\r\n");
      out.write("\tvar scrollHere1 = document.getElementById(scrollMe).previousSibling.offsetTop;\r\n");
      out.write("\tvar scrollHere2 = document.getElementById(scrollMe).parentNode.offsetTop;\r\n");
      out.write("\tvar scrollHere3 = document.getElementById(scrollMe).parentNode.parentNode.offsetTop;\r\n");
      out.write("\tvar scrollHere4 = document.getElementById(scrollMe).parentNode.parentNode.parentNode.offsetTop;\r\n");
      out.write("\tvar scrollHere5 = document.getElementById(scrollMe).parentNode.parentNode.parentNode.parentNode.offsetTop;\r\n");
      out.write("\t\r\n");
      out.write("\tif (resultDivs.length!=0) {\t\t\t\t\t\t\t\t\t// if the search finds a result add to scroll value\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(document.getElementById(resultDivs[resArrayPos])) {\t// check div is present on page\r\n");
      out.write("\t\t\tvar scrollToResult = document.getElementById(resultDivs[resArrayPos]);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\tif(categoryVal==\"age_qu\" || categoryVal==\"rout_qu\" || categoryVal==\"no_call_cur\" || categoryVal==\"f_i_act_cur\" || categoryVal==\"skill\" || categoryVal==\"team\"){\t//if sub menus with no active/inactive sections\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\tvar scrollHere6 = ((scrollToResult.parentNode.offsetTop)+(scrollToResult.parentNode.parentNode.previousSibling.offsetHeight))-30;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t}else{\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t//if sub menus has active/inactive sections\r\n");
      out.write("\t\t\t\tvar isInMenu = scrollToResult.parentNode.parentNode.id;\t\t// determine if result is in active or inactive section\r\n");
      out.write("\t\t\t\tvar dropMenu = isInMenu.replace(/_menu/,\"\");\r\n");
      out.write("\t\t\t\tvar activeMenu = categoryVal+\"_a\";\r\n");
      out.write("\t\t\t\tvar inactiveMenu = categoryVal+\"_i\";\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\tvar catNameLength = categoryVal.search (/$/);\r\n");
      out.write("\t\t\t\tvar isItActive = isInMenu.substr(catNameLength);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\tif (document.getElementById(isInMenu).style.display==\"none\") {\r\n");
      out.write("\t\t\t\t\tvisibleTog(document.getElementById(dropMenu));\r\n");
      out.write("\t\t\t\t\tif(isItActive.search(\"_a\")==0) {\t\t\t\t\t\t// open active sub menu if not already open\r\n");
      out.write("\t\t\t\t\t\timageTog(document.getElementById(dropMenu),activeMenu);\r\n");
      out.write("\t\t\t\t\t}else{\t\t\t\t\t\t\t\t\t\t\t\t\t// open inactive sub menu if not already open\r\n");
      out.write("\t\t\t\t\t\timageTog(document.getElementById(dropMenu),inactiveMenu);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tvar scrollHere6 = ((scrollToResult.parentNode.offsetTop)+(scrollToResult.parentNode.parentNode.previousSibling.offsetHeight)+(scrollToResult.parentNode.parentNode.offsetTop))-30;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tscrollHere = scrollHere1+scrollHere2+scrollHere3+scrollHere4+scrollHere5+scrollHere6; // combine distance of sub-menus and result from top of div to give value for distance to scroll\r\n");
      out.write("\t\t\tscrollToResult.parentNode.style.backgroundColor=\"#AF5\";\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tdocument.getElementById(\"serResults\").innerHTML=changed_result_str;\t\t\t// generate 'menu has changed' warning html if div id cannot be found\r\n");
      out.write("\t\t\tmarkItemPersistent(\"serResults\",changed_result_str);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tscrollHere = scrollHere1+scrollHere2+scrollHere3+scrollHere4+scrollHere5;\t// combine distance of sub-menus from top of div to give value for distance to scroll\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tvar distanceMove = 50;\r\n");
      out.write("\tif (scrollFrom>scrollHere) {\r\n");
      out.write("\t\tfor(var i=scrollFrom; i>scrollHere; i-=distanceMove) {\r\n");
      out.write("\t\t\tif ((i-distanceMove)<scrollHere) {\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"base_level_menu\").scrollTop = scrollHere;\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"base_level_menu\").scrollTop -= distanceMove;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tfor(var i=scrollFrom; i<scrollHere; i+=distanceMove) {\r\n");
      out.write("\t\t\tif ((i+distanceMove)>scrollHere) {\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"base_level_menu\").scrollTop = scrollHere;\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"base_level_menu\").scrollTop += distanceMove;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function validateSearch() {\t\t\t// varify text search uses valid characters\r\n");
      out.write("\r\n");
      out.write("\tif (categoryVal==\"age\"){\r\n");
      out.write("\t\tvar thisSearch1 = document.getElementById(\"searchfirst\").value;\r\n");
      out.write("\t\tvar thisSearch2 = document.getElementById(\"searchlast\").value;\r\n");
      out.write("\t\tvar thisSearch3 = document.getElementById(\"searchid\").value;\r\n");
      out.write("\t\tif (thisSearch1.match(/\\?/) || thisSearch1.match(/\\*/) || thisSearch1.match(/\\(/) || thisSearch1.match(/\\)/) || thisSearch1.match(/\\+/) || thisSearch1.match(/\\[/) || thisSearch1.match(/\\]/) || thisSearch1.match(/\\</) || thisSearch1.match(/\\>/) || thisSearch1.match(/\\|/) || thisSearch1.match(/\\./) || thisSearch2.match(/\\?/) || thisSearch2.match(/\\*/) || thisSearch2.match(/\\(/) || thisSearch2.match(/\\)/) || thisSearch2.match(/\\+/) || thisSearch2.match(/\\[/) || thisSearch2.match(/\\]/) || thisSearch2.match(/\\</) || thisSearch2.match(/\\>/) || thisSearch2.match(/\\|/) || thisSearch2.match(/\\./) || thisSearch3.match(/\\?/) || thisSearch3.match(/\\*/) || thisSearch3.match(/\\(/) || thisSearch3.match(/\\)/) || thisSearch3.match(/\\+/) || thisSearch3.match(/\\[/) || thisSearch3.match(/\\]/) || thisSearch3.match(/\\</) || thisSearch3.match(/\\>/) || thisSearch3.match(/\\|/) || thisSearch3.match(/\\./)) { // disallowed characters\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Search query cannot contain"));
      out.write(" '?', '*', '.', '+', '(', ')', '[', ']', '<', '>' ");
      out.print(pageData.getWord("or"));
      out.write(" '|'\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tsearchingFor();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tvar thisSearch1 = document.getElementById(\"searchfullname\").value;\r\n");
      out.write("\t\tvar thisSearch2 = document.getElementById(\"searchpartname\").value;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif (thisSearch1.match(/\\?/) || thisSearch1.match(/\\*/) || thisSearch1.match(/\\(/) || thisSearch1.match(/\\)/) || thisSearch1.match(/\\+/) || thisSearch1.match(/\\[/) || thisSearch1.match(/\\]/) || thisSearch1.match(/\\</) || thisSearch1.match(/\\>/) || thisSearch1.match(/\\|/) || thisSearch1.match(/\\./) || thisSearch2.match(/\\?/) || thisSearch2.match(/\\*/) || thisSearch2.match(/\\(/) || thisSearch2.match(/\\)/) || thisSearch2.match(/\\+/) || thisSearch2.match(/\\[/) || thisSearch2.match(/\\]/) || thisSearch2.match(/\\</) || thisSearch2.match(/\\>/) || thisSearch2.match(/\\|/) || thisSearch2.match(/\\./)) { // disallowed characters\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Search query cannot contain"));
      out.write(" '?', '*', '.', '+', '(', ')', '[', ']', '<', '>' ");
      out.print(pageData.getWord("or"));
      out.write(" '|'\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}else if (document.getElementById(\"searchfullname\").value!=\"\" && document.getElementById(\"searchpartname\").value!=\"\"){ // disalow search when both full and partial name fields are filled\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Search for either"));
      out.write("\\n\\n'");
      out.print(pageData.getWord("Name"));
      out.write("'\\n(");
      out.print(pageData.getWord("can be the full name or the begining of the name"));
      out.write(')');
      out.write('\\');
      out.write('n');
      out.print(pageData.getWord("or"));
      out.write(' ');
      out.write('\'');
      out.print(pageData.getWord("Name includes"));
      out.write("'\\n(");
      out.print(pageData.getWord("search for text that is included anywhere in the name"));
      out.write(")\\n\\n");
      out.print(pageData.getWord("but not both"));
      out.write(".\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tsearchingFor();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function searchingFor() {\r\n");
      out.write("\tif(categoryVal==\"age\") {\r\n");
      out.write("\t\tvar searchId = new RegExp(document.getElementById(\"searchid\").value, \"gi\");\r\n");
      out.write("\t\tvar searchFirst = new RegExp(document.getElementById(\"searchfirst\").value, \"gi\");\r\n");
      out.write("\t\tvar searchLast = new RegExp(document.getElementById(\"searchlast\").value, \"gi\");\r\n");
      out.write("\t\tresultDivs = new Array();\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif (searchId!=\"//ig\" || searchFirst!=\"//ig\" || searchLast!=\"//ig\") {\r\n");
      out.write("\t\t\tif(searchId==\"//ig\") {\r\n");
      out.write("\t\t\t\tsearchId=null;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(searchFirst==\"//ig\") {\r\n");
      out.write("\t\t\t\tsearchFirst=null;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(searchLast==\"//ig\") {\r\n");
      out.write("\t\t\t\tsearchLast=null;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tresArrayPos = 0;\r\n");
      out.write("\t\t\tvar searchSelectionName = categoryVal+tenantVal;\r\n");
      out.write("\t\t\tvar searchSelectionNameLength = searchSelectionName.search(/$/);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar searchIn = document.getElementById(categoryVal+tenantVal+\"_menu\");\r\n");
      out.write("\t\t\tvar searchDivs = new Array();\r\n");
      out.write("\t\t\tsearchDivs = searchIn.getElementsByTagName(\"div\");\r\n");
      out.write("\t\t\tfor (var i=0; i<searchDivs.length; i++) {\r\n");
      out.write("\t\t\t\tif(searchDivs[i].id) {\r\n");
      out.write("\t\t\t\t\tvar thisDivId = searchDivs[i].id;\r\n");
      out.write("\t\t\t\t\tvar ignorCatAndTen = thisDivId.substr(searchSelectionNameLength);\r\n");
      out.write("\t\t\t\t\tvar firstStartPos = ignorCatAndTen.indexOf(',');\r\n");
      out.write("\t\t\t\t\tvar lastStartPos  = ignorCatAndTen.indexOf('^');\r\n");
      out.write("\t\t\t\t\tvar iStartPos     = ignorCatAndTen.indexOf('[');\r\n");
      out.write("    \t\t\t\tvar iEndPos       = ignorCatAndTen.indexOf(']');\r\n");
      out.write("\t\t\t\t\tvar firstn\t      = ignorCatAndTen.substr(firstStartPos+1,iStartPos-firstStartPos-1);\r\n");
      out.write("\t\t\t\t\tvar lastn\t      = ignorCatAndTen.substr(lastStartPos+1,firstStartPos-lastStartPos-1);\r\n");
      out.write("    \t\t\t\tvar login\t      = ignorCatAndTen.substr(iStartPos+1,iEndPos-iStartPos-1);\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tif(thisDivId.match(searchSelectionName)) {\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\tif(ignorCatAndTen.search(\"_\")!=0) {\r\n");
      out.write("\t\t\t\t\t\t\tif((firstn.search(searchFirst)==0 && searchLast==null && searchId==null) || (firstn.search(searchFirst)==0 && lastn.search(searchLast)==0 && searchId==null) || (firstn.search(searchFirst)==0 && searchLast==null && login.search(searchId)==0) || (firstn.search(searchFirst)==0 && lastn.search(searchLast)==0 && login.search(searchId)==0) || (searchFirst==null && lastn.search(searchLast)==0 && searchId==null) || (searchFirst==null && lastn.search(searchLast)==0 && login.search(searchId)==0) || (searchFirst==null && searchLast==null && login.search(searchId)==0)) {\r\n");
      out.write("\t\t\t\t\t\t\t\tresultDivs[resArrayPos]=thisDivId;\r\n");
      out.write("\t\t\t\t\t\t\t\tresArrayPos++;\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(resultDivs.length==0 && (searchId!=\"//ig\" || searchFirst!=\"//ig\" || searchLast!=\"//ig\")){\t// no results and search fields are filled\r\n");
      out.write("\t\t\tdocument.getElementById(\"serResults\").innerHTML=no_result_str;\t\t\t\t\t// no results found html\r\n");
      out.write("\t\t\tmarkItemPersistent(\"serResults\",no_result_str);\r\n");
      out.write("\t\t}else{\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t// there are results or search fields are empty\r\n");
      out.write("\t\t\tresultDivs.sort();\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t// order all results alphabetically (not active before inactive)\r\n");
      out.write("\t\t\tdocument.getElementById(\"serResults\").innerHTML=result_str;\t\t\t\t\t\t// generate result html\r\n");
      out.write("\t\t\tmarkItemPersistent(\"serResults\",result_str);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tresArrayPos = 0;\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tvar searchFull = new RegExp(document.getElementById(\"searchfullname\").value, \"gi\");\r\n");
      out.write("\t\tvar searchPart = new RegExp(document.getElementById(\"searchpartname\").value, \"gi\");\r\n");
      out.write("\t\tresultDivs = new Array();\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(searchFull!=\"//ig\" || searchPart!=\"//ig\") {\r\n");
      out.write("\t\t\tresArrayPos = 0;\r\n");
      out.write("\t\t\tvar searchSelectionName = categoryVal+tenantVal;\r\n");
      out.write("\t\t\tvar searchSelectionNameLength = searchSelectionName.search(/$/);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar searchIn = document.getElementById(categoryVal+tenantVal+\"_menu\");\r\n");
      out.write("\t\t\tvar searchDivs = new Array();\r\n");
      out.write("\t\t\tsearchDivs = searchIn.getElementsByTagName(\"div\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(searchFull!=\"//ig\") { // if full name search\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\tfor (i = 0; i <searchDivs.length; i++){\r\n");
      out.write("\t\t\t\t\tif(searchDivs[i].id) {\r\n");
      out.write("\t\t\t\t\t\tvar thisDivId = searchDivs[i].id;\r\n");
      out.write("\t\t\t\t\t\tvar ignorCatAndTen = thisDivId.substr(searchSelectionNameLength);\r\n");
      out.write("\t\t\t\t\t\tif(thisDivId.match(searchSelectionName)) {\r\n");
      out.write("\t\t\t\t\t\t\tif(ignorCatAndTen.search(\"_\")!=0 && ignorCatAndTen.search(searchFull)==0) {\r\n");
      out.write("\t\t\t\t\t\t\t\tresultDivs[resArrayPos]=thisDivId;\r\n");
      out.write("\t\t\t\t\t\t\t\tresArrayPos++;\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("    \t\t\t}\r\n");
      out.write("\t\t\t}else if(searchPart!=\"//ig\") { // if partial name search\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\tfor (i = 0; i <searchDivs.length; i++){\r\n");
      out.write("\t\t\t\t\tif(searchDivs[i].id) {\r\n");
      out.write("\t\t\t\t\t\tvar thisDivId = searchDivs[i].id;\r\n");
      out.write("\t\t\t\t\t\tvar ignorCatAndTen = thisDivId.substr(searchSelectionNameLength);\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\tif(thisDivId.match(searchSelectionName)) {\r\n");
      out.write("\t\t\t\t\t\t\tif(ignorCatAndTen.search(\"_\")!=0 && ignorCatAndTen.search(searchPart)!=-1) {\r\n");
      out.write("\t\t\t\t\t\t\t\tresultDivs[resArrayPos]=thisDivId;\r\n");
      out.write("\t\t\t\t\t\t\t\tresArrayPos++;\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("    \t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(resultDivs.length==0 && (searchFull!=\"//ig\" || searchPart!=\"//ig\")){\t\t\t\t// no results and search fields are filled\r\n");
      out.write("\t\t\tdocument.getElementById(\"serResults\").innerHTML=no_result_str;\t\t\t\t\t// no results found html\r\n");
      out.write("\t\t\tmarkItemPersistent(\"serResults\",no_result_str);\r\n");
      out.write("\t\t}else{\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t// there are results or search fields are empty\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tresultDivs.sort();\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t// order all results alphabetically (not active before inactive)\r\n");
      out.write("\t\t\tdocument.getElementById(\"serResults\").innerHTML=result_str;\t\t\t\t\t\t// generate result html\r\n");
      out.write("\t\t\tmarkItemPersistent(\"serResults\",result_str);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tresArrayPos = 0;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function doMenuSearch() {\r\n");
      out.write("\tif(resultDivs.length!=0){\r\n");
      out.write("\t\tif(document.getElementById(resultDivs[resArrayPos])){\r\n");
      out.write("\t\t\tdocument.getElementById(resultDivs[resArrayPos]).parentNode.style.backgroundColor=\"#ffffff\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\ttenantVal = document.getElementById(\"whichTenant\").value;\r\n");
      out.write("\tcategoryVal = document.getElementById(\"whichCategory\").value;\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\tvalidateSearch();\r\n");
      out.write("\tcontinueMenuSearch();\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function continueMenuSearch() {\r\n");
      out.write("\tsetupResults();\r\n");
      out.write("\tmenuFit();\r\n");
      out.write("\topenMenuTree();\r\n");
      out.write("\tscrollMenuHere(categoryVal+tenantVal+\"_menu\");\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function setupResults() {\r\n");
      out.write("\tif(resultDivs.length>1){\r\n");
      out.write("\t\tdocument.getElementById(\"thisResultNum\").innerHTML=resArrayPos+1;\r\n");
      out.write("\t\tdocument.getElementById(\"numOfResults\").innerHTML=resultDivs.length;\r\n");
      out.write("\t\tif(resArrayPos==0){\t\t\t\t\t\t\t\t\t\t// enable/disable 'previous' button when there are multiple search results\r\n");
      out.write("\t\t\tdocument.getElementById(\"resPrev\").disabled=true;\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tdocument.getElementById(\"resPrev\").disabled=false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(resArrayPos+1==resultDivs.length){\t\t\t\t\t// enable/disable 'next' button when there are multiple search results\r\n");
      out.write("\t\t\tdocument.getElementById(\"resNext\").disabled=true;\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tdocument.getElementById(\"resNext\").disabled=false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.getElementById(categoryVal+\"_opt\")){\r\n");
      out.write("\t\t\tdocument.getElementById(\"serResults\").style.display=\"\";\r\n");
      out.write("\t\t\tmarkItemPersistent(\"serResultsVis\",'block');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}else if(document.getElementById(\"thisResultNum\")){\t\t\t// make sure the correct inner html is being generated - will not hide 'no results' html\r\n");
      out.write("\t\tdocument.getElementById(\"serResults\").style.display=\"none\";\r\n");
      out.write("\t\tmarkItemPersistent(\"serResultsVis\",'none');\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tif(document.getElementById(categoryVal+\"_opt\")){\r\n");
      out.write("\t\t\tdocument.getElementById(\"serResults\").style.display=\"\";\r\n");
      out.write("\t\t\tmarkItemPersistent(\"serResultsVis\",'block');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function nextPrevSearch(direction) {\t\t\t\r\n");
      out.write("\tif(resultDivs.length!=0){\r\n");
      out.write("\t\tif(document.getElementById(resultDivs[resArrayPos])){\r\n");
      out.write("\t\t\tdocument.getElementById(resultDivs[resArrayPos]).parentNode.style.backgroundColor=\"#ffffff\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif(direction==\"forward\") {\r\n");
      out.write("\t\tresArrayPos++;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(direction==\"back\") {\r\n");
      out.write("\t\tresArrayPos--;\r\n");
      out.write("\t}\r\n");
      out.write("\tcontinueMenuSearch();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write("html, body {\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\toverflow:hidden;\r\n");
      out.write("}\r\n");
      out.write("body {\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tmargin-left: 0px;\r\n");
      out.write("\tmargin-top: 0px;\r\n");
      out.write("\tmargin-right: 0px;\r\n");
      out.write("\tmargin-bottom: 0px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("-->\r\n");
      out.write("</style>\r\n");
      out.write("<!--[if lt IE 7]>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("#menuSearchBox {\r\n");
      out.write("\tmargin-top:-16px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<![endif]-->\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body id=\"menuBody\" class=\"bodysize\" scroll=\"no\" onLoad=\"chekMenuItems(),getSearchBoxState()\" onresize=\"menuFit()\" onKeyDown=\"onPressKey()\" onunload=\"rememberMenuSettings()\">\r\n");
      out.write("\r\n");
      out.write("<div id=\"synchroMessage\" style=\"text-align:center; display:;\">\r\n");
      out.write("\t<div style=\"border-style:solid; border-width:1px; border-color:#B66001; padding-left:4px; padding-right:4px; padding-bottom:1px; margin-top:20px; margin-left:10px; margin-right:10px; color:#824100\">");
      out.print(pageData.getWord("Synchronizing menu"));
      out.write("</div>\r\n");
      out.write("\t<div style=\"color:#824100;\">");
      out.print(pageData.getWord("please wait-lc"));
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div id=\"base_level_menu\" class=\"menubody\" style=\"padding-top:20px; overflow-y:scroll; overflow-x:hidden; height:; background-repeat:repeat-y; background-image:url(img/base_level_bg.gif); visibility:hidden;\">\r\n");
      out.write("<div id=\"treeContainerHeight\" style=\"height:;\">\r\n");

if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CONFIGURATION_MANAGEMENT") )
{

      out.write("\r\n");
      out.write("  \r\n");
      out.write("\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"javascript:;\" class=\"config_fill\" style=\"background-image:url(img/base_level_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'config')\">\r\n");
      out.write("\t\t<div id=\"config\" class=\"level0\" style=\"background-image:url(img/config_closed.gif)\"><b>");
      out.print(pageData.getWord("Configuration"));
      out.write("</b></div>\r\n");
      out.write("\t</a>\r\n");
      out.write("\t<div id=\"config_menu\" style=\"display:none\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t");
 // Start Network Configuration
		if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_NETWORK_CONFIGURATION") )
		{
		
      out.write("\t\t\r\n");
      out.write("\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"./Resources_pages/architecture.jsp\" target=\"rbottom\" class=\"config_fill\" style=\"background-image:url(img/config_bg.gif)\">\r\n");
      out.write("\t\t\t\t<div class=\"level1_but\" style=\"background-image:url(img/config_but.gif)\">");
      out.print(pageData.getWord("Network Configuration"));
      out.write("</div>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t");

		}
		
		if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TENANT_MANAGEMENT") )
		{
		
      out.write("\r\n");
      out.write("\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"javascript:;\" class=\"ten_man_fill\" style=\"background-image:url(img/config_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'ten_man')\">\r\n");
      out.write("\t\t\t\t<div id=\"ten_man\" class=\"level1\" style=\"background-image:url(img/ten_man_closed.gif)\"><b>");
      out.print(pageData.getWord("Tenant Management"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\t<div id=\"ten_man_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"./Resources_pages/tenant.jsp?dbid=\" target=\"rbottom\" class=\"ten_man_fill\" style=\"background-image:url(img/ten_man_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/ten_man_add.gif)\">&lt;");
      out.print(pageData.getWord("Add tenant"));
      out.write("&gt;</div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\r\n");
      out.write("\t\t");

			for(int i = 0; i < tenantsDataResult.size(); i++)
			{
				String tenant_dbid = (String)tenantsDataResult.elementAt(i).get("dbid");
				String tenant_name = (String)tenantsDataResult.elementAt(i).get("name");
		
      out.write("\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"./Resources_pages/tenant.jsp?dbid=");
      out.print(tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"ten_man_fill\" style=\"background-image:url(img/ten_man_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/ten_man_but.gif)\">");
      out.print(tenant_name);
      out.write("</div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t");
	}
		
      out.write("\t\r\n");
      out.write("        \t\t<div class=\"menuspacer\" style=\"background-image:url(img/config_bg.gif)\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t");
	
		}
	
		if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_USER_MANAGEMENT") )
		{
		
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"javascript:;\" class=\"use_man_fill\" style=\"background-image:url(img/config_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'use_man')\">\r\n");
      out.write("\t\t\t\t<div id=\"use_man\" class=\"level1\" style=\"background-image:url(img/use_man_closed.gif)\"><b>");
      out.print(pageData.getWord("User Management"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\t<div id=\"use_man_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"./Resources_pages/user_management.jsp\" target=\"rbottom\" class=\"use_man_fill\" style=\"background-image:url(img/use_man_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/use_man_add.gif)\">&lt;");
      out.print(pageData.getWord("Add a user"));
      out.write("&gt;</div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"javascript:;\" class=\"use_a_fill\" style=\"background-image:url(img/use_man_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'use_a')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"use_a\" class=\"level2\" style=\"background-image:url(img/use_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active Users"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div id=\"use_a_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t");

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
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.print(active_users_html);
      out.write("\r\n");
      out.write("                    <div class=\"menuspacer\" style=\"background-image:url(img/use_man_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"javascript:;\" class=\"use_i_fill\" style=\"background-image:url(img/use_man_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'use_i')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"use_i\" class=\"level2\" style=\"background-image:url(img/use_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive Users"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t<div id=\"use_i_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t");

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
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(inactive_users_html);
      out.write("\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/use_man_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"menuspacer\" style=\"background-image:url(img/config_bg.gif)\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t");

		}
		
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"javascript:;\" class=\"a_phone_fill\" style=\"background-image:url(img/config_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'a_phone')\">\r\n");
      out.write("\t\t\t<div id=\"a_phone\" class=\"level1\" style=\"background-image:url(img/a_phone_closed.gif)\"><b>AheevaPhone</b></div>\r\n");
      out.write("\t\t</a>\r\n");
      out.write("\t\t<div id=\"a_phone_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9ccca',3,1)\" onmouseout=\"colorFade(this,'background','f9ccca','ffffff',4,1)\" href=\"./Resources_pages/modifyStarPhoneSettings1.jsp\" target=\"rbottom\" class=\"a_phone_fill\" style=\"background-image:url(img/a_phone_bg.gif)\">\r\n");
      out.write("\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/a_phone_but.gif)\">");
      out.print(pageData.getWord("SoftPhone configuration"));
      out.write("</div>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("            <div class=\"menuspacer\" style=\"background-image:url(img/config_bg.gif)\"></div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("   ");
 // End Network Configuration  //<!-- end ALLOW_CONFIGURATION_MANAGEMENT - ALLOW_TENANT_VIEW -->
      out.write("\r\n");
      out.write("  \t<div class=\"menuspacer\" style=\"background-image:url(img/base_level_bg.gif)\"></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("  <a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"use_pref_fill\" style=\"background-image:url(img/base_level_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'use_pref')\">\r\n");
      out.write("\t\t<div id=\"use_pref\" class=\"level0\" style=\"background-image:url(img/use_pref_closed.gif)\"><b>");
      out.print(pageData.getWord("User preferences"));
      out.write("</b></div>\r\n");
      out.write("\t</a>\r\n");
      out.write("\t<div id=\"use_pref_menu\" style=\"display:none\">\r\n");
      out.write("\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/userLiveStatsPreferences.jsp\" target=\"rbottom\" class=\"use_pref_fill\" style=\"background-image:url(img/use_pref_bg.gif)\">\r\n");
      out.write("\t\t\t<div class=\"level1_but\" style=\"background-image:url(img/use_pref_but.gif)\">");
      out.print(pageData.getWord("User live statistics preferences"));
      out.write("</div>\r\n");
      out.write("\t\t</a>\r\n");
      out.write("        <div class=\"menuspacer\" style=\"background-image:url(img/base_level_bg.gif)\"></div>\r\n");
      out.write("\t</div>\r\n");

} //Fin de pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CONFIGURATION_MANAGEMENT")


if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TENANT_VIEW") )
{
		for (int tenant_pos = 0; tenant_pos < tenantsDataResult.size(); tenant_pos++) // get all tenant
		{
			String current_tenant_dbid 		= (String)tenantsDataResult.elementAt(tenant_pos).get("dbid");
			String current_tenant_name 		= (String)tenantsDataResult.elementAt(tenant_pos).get("name");
			String right_to_change_skills 	= pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT") ? "true" : "false";
			String right_to_quality_monitoring 	= pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT") ? "true" : "false";
		
			
  //<!-- START ALLOW_AGENT_MANAGEMENT -->  
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"ten_fill\" style=\"background-image:url(img/base_level_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'ten')\">\r\n");
      out.write("\t\t\t\t<div id=\"ten");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level0\" style=\"background-image:url(img/ten_closed.gif)\"><b>");
      out.print(current_tenant_name);
      out.write("</b></div>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\t<div id=\"ten");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\r\n");
      out.write("\t\t");

			if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_RESSOURCES_MANAGEMENT"))
			{
			
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"res_fill\" style=\"background-image:url(img/ten_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'res')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"res");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level1\" style=\"background-image:url(img/res_closed.gif)\"><b>");
      out.print(pageData.getWord("Resources"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"res");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t");

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
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"age_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild,  'age')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"age");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/age_closed.gif)\"><b>");
      out.print(pageData.getWord("Agents"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"age");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/agent.jsp?dbid=&agtName=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("&rightSkills=");
      out.print(right_to_change_skills );
      out.write(" \" target=\"rbottom\" class=\"age_fill\" style=\"background-image:url(img/age_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/age_add.gif)\">&#60;");
      out.print(pageData.getWord("Add agent"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"age_a_fill\" style=\"background-image:url(img/age_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'age_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"age_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/age_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active agents"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"age_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(active_agents_html);
      out.write("\r\n");
      out.write("                                <div class=\"menuspacer\" style=\"background-image:url(img/age_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"age_i_fill\" style=\"background-image:url(img/age_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'age_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"age_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/age_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive agents"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"age_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(inactive_agents_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/age_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("                    <div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\t\t\t\t\r\n");
      out.write("\t\t\t   \t</div>\r\n");
      out.write("\r\n");
  //<!-- End START ALLOW_AGENT_MANAGEMENT -->  		

				
				} //Fin de pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_MANAGEMENT"))

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT"))
				{
					
  //<!-- START ALLOW_AGENT_GROUPS_MANAGEMENT -->  
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"age_gr_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'age_gr')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"age_gr");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/age_gr_closed.gif)\"><b>");
      out.print(pageData.getWord("Agent Groups"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"age_gr");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/agentGroup.jsp?dbid=&grpName=&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("&recordingRight=");
      out.print(right_to_quality_monitoring );
      out.write("\" target=\"rbottom\" class=\"age_gr_fill\" style=\"background-image:url(img/age_gr_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/age_gr_add.gif)\">&#60;");
      out.print(pageData.getWord("Add agent group"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"age_gr_a_fill\" style=\"background-image:url(img/age_gr_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'age_gr_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"age_gr_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/age_gr_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active agent group"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"age_gr_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");

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
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(active_agent_groups_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/age_gr_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"age_gr_i_fill\" style=\"background-image:url(img/age_gr_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'age_gr_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"age_gr_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/age_gr_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive agent group"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"age_gr_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t");

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
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(inactive_agent_groups_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/age_gr_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\t\t\t\t\t\r\n");
 //<!-- end ALLOW_AGENT_GROUPS_MANAGEMENT --> 				
				
				} //END OF pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT")

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))
				{
					
				 
				
 //<!-- START ALLOW_CAMPAIGN_MANAGEMENT --> 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"cam_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'cam')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"cam");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/cam_closed.gif)\"><b>");
      out.print(pageData.getWord("Campaigns"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"cam");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/campaign.jsp?dbid=&campaign_name=&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"cam_fill\" style=\"background-image:url(img/cam_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/cam_add.gif)\">&#60;");
      out.print(pageData.getWord("Add campaign") );
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"cam_a_fill\" style=\"background-image:url(img/cam_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'cam_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"cam_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/cam_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active campaigns"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"cam_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");

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
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(active_campaigns_html);
      out.write("\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/cam_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"cam_i_fill\" style=\"background-image:url(img/cam_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'cam_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"cam_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/cam_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive campaigns"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"cam_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t");

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
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(inactive_campaigns_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/cam_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("                        \r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t");
 //<!-- end ALLOW_CAMPAIGN_MANAGEMENT --> 	
				
				
				} // Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))

				// Calling lists
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))
				{	
				
 //<!-- ALLOW_CALLING_LIST_MANAGEMENT -->   
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"call_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'call')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"call");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/call_closed.gif)\"><b>");
      out.print(pageData.getWord("Calling lists"));
      out.write("</b>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"call");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/addCallingList.jsp?callinglistName=&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"call_fill\" style=\"background-image:url(img/call_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/call_add.gif)\">&#60;");
      out.print(pageData.getWord("Add calling list"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"call_a_fill\" style=\"background-image:url(img/call_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'call_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"call_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/call_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active lists"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"call_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");

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
							
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(active_callinglists_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/call_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"call_i_fill\" style=\"background-image:url(img/call_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'call_i')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"call_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/call_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive lists"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"call_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");

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
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(inactive_callinglists_html);
      out.write("\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/call_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("                    \r\n");
      out.write("                    <div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t  </div>\r\n");
 //<!-- end ALLOW_CALLING_LIST_MANAGEMENT --> 

			   
					
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
					
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"no_call_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'no_call')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"no_call");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/no_call_closed.gif)\"><b>");
      out.print(pageData.getWord("Do-not-call lists"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"no_call");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/blackList1.jsp?blacklist_dbid=&blacklist_name=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"no_call_fill\" style=\"background-image:url(img/no_call_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/no_call_add.gif)\">&#60;");
      out.print(pageData.getWord("Create a do-not-call list"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"no_call_cur_fill\" style=\"background-image:url(img/no_call_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'no_call_cur')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"no_call_cur");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/no_call_cur_closed.gif)\"><b>");
      out.print(pageData.getWord("Current do-not-call lists"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"no_call_cur");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(black_list_html);
      out.write("\r\n");
      out.write("                                <div class=\"menuspacer\" style=\"background-image:url(img/no_call_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"no_call_act_fill\" style=\"background-image:url(img/no_call_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'no_call_act')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"no_call_act");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/no_call_act_closed.gif)\"><b>");
      out.print(pageData.getWord("Actions on do-not-call lists"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"no_call_act");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/addNumbersToBlackList.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"no_call_act_fill\" style=\"background-image:url(img/no_call_act_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"level4_but\" style=\"background-image:url(img/no_call_act_but.gif)\">");
      out.print(pageData.getWord("Add numbers to Do-not-call list"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/blackListNumberInCampaign1.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"no_call_act_fill\" style=\"background-image:url(img/no_call_act_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"level4_but\" style=\"background-image:url(img/no_call_act_but.gif)\">");
      out.print(pageData.getWord("Search campaign for Do-not-call list number"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/viewBlacklistContents1.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"no_call_act_fill\" style=\"background-image:url(img/no_call_act_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"level4_but\" style=\"background-image:url(img/no_call_act_but.gif)\">");
      out.print(pageData.getWord("Display Do-not-call list contents"));
      out.write("</div></a>\r\n");
      out.write("                                    <div class=\"menuspacer\" style=\"background-image:url(img/no_call_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
 //<!-- end ALLOW_DONOTCALL_LIST_MANAGEMENT -->   
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
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"fil_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'fil')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"fil");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/fil_closed.gif)\"><b>");
      out.print(pageData.getWord("Filters"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"fil");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/filter1.jsp?filter_name=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"fil_fill\" style=\"background-image:url(img/fil_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/fil_add.gif)\">&#60;");
      out.print(pageData.getWord("Add filter"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"fil_a_fill\" style=\"background-image:url(img/fil_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'fil_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"fil_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/fil_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active filter"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"fil_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(active_filters_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/fil_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"fil_i_fill\" style=\"background-image:url(img/fil_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'fil_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"fil_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/fil_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive filter"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"fil_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(inactive_filters_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/fil_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
  //<!-- end ALLOW_FILTER_MANAGEMENT -->  
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
					
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"treat_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'treat')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"treat");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/treat_closed.gif)\"><b>Treatments</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"treat");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/treatment1.jsp?treatment_name=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"treat_fill\" style=\"background-image:url(img/treat_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/treat_add.gif)\">&#60;");
      out.print(pageData.getWord("Add treatment"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"treat_a_fill\" style=\"background-image:url(img/treat_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'treat_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"treat_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/treat_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active Treatments"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"treat_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(active_treatments_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/treat_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"treat_i_fill\" style=\"background-image:url(img/treat_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'treat_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"treat_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/treat_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive Treatments"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"treat_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(inactive_treatments_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/treat_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t\r\n");
 //<!-- end ALLOW_TREATMENTS_MANAGEMENT --> 
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
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"no_ready_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'no_ready')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"no_ready");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/no_ready_closed.gif)\"><b>");
      out.print(pageData.getWord("Not-ready reasons"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"no_ready");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/notReadyReason1.jsp?NRR_name=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"no_ready_fill\" style=\"background-image:url(img/no_ready_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/no_ready_add.gif)\">&#60;");
      out.print(pageData.getWord("Add Not-ready reason"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"no_ready_a_fill\" style=\"background-image:url(img/no_ready_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'no_ready_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"no_ready_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/no_ready_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active Not-ready reasons"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"no_ready_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(active_notreadyreasons_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/no_ready_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"no_ready_i_fill\" style=\"background-image:url(img/no_ready_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'no_ready_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"no_ready_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/no_ready_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive Not-ready reasons"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"no_ready_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(inactive_notreadyreasons_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/no_ready_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
 //<!-- end ALLOW_NOT_READY_REASON_MANAGEMENT --> 
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
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"qu_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'qu')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"qu");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/qu_closed.gif)\"><b>");
      out.print(pageData.getWord("Queues"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"qu");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"age_qu_fill\" style=\"background-image:url(img/qu_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'age_qu')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"age_qu");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/age_qu_closed.gif)\"><b>");
      out.print(pageData.getWord("Agent group queues"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"age_qu");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(agent_group_queues_html);
      out.write("\r\n");
      out.write("                        \t<div class=\"menuspacer\" style=\"background-image:url(img/qu_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
 
						if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT"))
						{
						 //<!-- ALLOW_ROUTING_SCRIPT_MANAGEMENT --> 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"rout_qu_fill\" style=\"background-image:url(img/qu_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'rout_qu')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"rout_qu");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/rout_qu_closed.gif)\"><b>");
      out.print(pageData.getWord("Routing script queues"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"rout_qu");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<script>\r\n");
      out.write("\t\t\t\t\t\t\ttenantDBID = \"");
      out.print(current_tenant_dbid);
      out.write("\";\r\n");
      out.write("\t\t\t\t\t\t\tvar arrayQueues = this.getRoutingScriptAndQueues(tenantDBID);\r\n");
      out.write("\t\t\t\t\t\t\tvar arrayqueues_html = \"\";\r\n");
      out.write("\t\t\t\t\t\t\tif (arrayQueues.length>0) {\r\n");
      out.write("\t\t\t\t\t\t\t\tfor (i = 0; i < arrayQueues.length; i++)\r\n");
      out.write("\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\tarrayqueues_html += \"<a onmouseover=\\\"colorFade(this,'background','ffffff','f9dfc2',3,1)\\\" onmouseout=\\\"colorFade(this,'background','f9dfc2','ffffff',4,1)\\\" href=\\\"./Resources_pages/queues.jsp?queue_name=\"+arrayQueues[i]+\"&tenant_dbid=\"+tenantDBID+\"\\\" target=\\\"rbottom\\\" class=\\\"rout_qu_fill\\\" style=\\\"background-image:url(img/rout_qu_bg.gif)\\\"><div class=\\\"level4_but\\\" style=\\\"background-image:url(img/rout_qu_but.gif)\\\" id=\\\"rout_qu\"+tenantDBID+arrayQueues[i]+\"\\\">\"+arrayQueues[i]+\"</div></a>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\tif(arrayqueues_html==\"\") {\r\n");
      out.write("\t\t\t\t\t\t\t\tarrayqueues_html += \"<a class=\\\"rout_qu_fill\\\" style=\\\"background-image:url(img/rout_qu_bg.gif)\\\"><div class=\\\"level4_but\\\" style=\\\"background-image:url(img/empty_1_but.gif)\\\">&#40;");
      out.print(pageData.getWord("empty"));
      out.write("&#41;</div></a>\";\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write(arrayqueues_html);\r\n");
      out.write("\t\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/qu_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
} 
						//<!-- end ALLOW_ROUTING_SCRIPT_MANAGEMENT --> 
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\t\t\t\t\t\r\n");
 //<!-- end ALLOW_QUEUES_MANAGEMENT -->  
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
					} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"skill_fill\" style=\"background-image:url(img/res_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'skill')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"skill");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/skill_closed.gif)\"><b>");
      out.print(pageData.getWord("Skills"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"skill");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/Skill.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\"  target=\"rbottom\" class=\"skill_fill\" style=\"background-image:url(img/skill_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/skill_add.gif)\">&#60;");
      out.print(pageData.getWord("Add skills"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(skills_queues_html);
      out.write("\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/res_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t");
}//FIN de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT"))
      out.write("\r\n");
      out.write("                \t<div class=\"menuspacer\" style=\"background-image:url(img/ten_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t");
}//Fin de if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_RESSOURCES_MANAGEMENT"))


			 if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_REPORTS_MANAGEMENT"))
			{
 //<!-- ALLOW_HISTORICAL_REPORTS_MANAGEMENT --> 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"rep_h_fill\" style=\"background-image:url(img/ten_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'rep_h')\">\r\n");
      out.write("\t\t\t\t<div id=\"rep_h");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level1\" style=\"background-image:url(img/rep_h_closed.gif)\"><b>Historic reports</b></div>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\t<div id=\"rep_h");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
	// ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT 
      out.write("\r\n");
      out.write("\t\t\t\t");
if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT")) { 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/datePicker.jsp?type=Agents&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Agent Details Reports") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 } 
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT")){ 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/datePicker.jsp?type=AgentGroups&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print( pageData.getWord("Agent Groups Reports"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 } 
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT")){ 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/datePicker.jsp?type=AgentSummary&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print( pageData.getWord("Agent summary reports") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\t\r\n");
      out.write("\t\t\t\t");
 }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT")){ 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/datePicker.jsp?type=Outbound&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Outbound call reports") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/inboundCalls1.jsp?type=Inbound&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Inbound Calls Reports") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT")){ 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/datePicker.jsp?type=AgentLoginReport&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Agent Login Reports") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/datePicker.jsp?type=Campaigns&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Campaign Reports") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT")){ 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/datePicker.jsp?type=CallingsLists&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Calling List Reports"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT")){ 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/datePicker.jsp?type=CallDetails&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Calling List Report Details"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT")){ 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/datePicker.jsp?type=Queues&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Queue Reports") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
					
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_GROUPFORECAST_REPORTS_MANAGEMENT")){ 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/groupReport1.jsp?type=GroupForecast&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Group Forecast Reports") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
					
				{ 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/groupReport1.jsp?type=GroupSummary&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Group Summary Reports") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
				
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_GROUPSUMMARY_REPORTS_MANAGEMENT")){ 
      out.write(" \r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/lineReport1.jsp?type=LineReport&tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("\" target=\"rbottom\" class=\"rep_h_fill\" style=\"background-image:url(img/rep_h_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Line Report") );
      out.write("</div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t");
 }
      out.write("\r\n");
      out.write("                \r\n");
      out.write("\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/ten_bg.gif)\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\r\n");
 //<!-- end ALLOW_HISTORICAL_REPORTS_MANAGEMENT --> 
 //<!-- ALLOW_QUALITY_MONITORING_MANAGEMENT --> 
			
			}// Fin de iif(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_HISTORICAL_REPORTS_MANAGEMENT"))

			if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_MANAGEMENT"))
			{				
			 
      out.write("\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_fill\" style=\"background-image:url(img/ten_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"q_m");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level1\" style=\"background-image:url(img/q_m_closed.gif)\"><b>");
      out.print(pageData.getWord("Quality Monitoring"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div id=\"q_m");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t");
if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT"))
					out.write("<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/conversationRecPicker1.jsp?tenant_dbid="+current_tenant_dbid+"\" target=\"rbottom\" class=\"q_m_fill\" style=\"background-image:url(img/q_m_bg.gif)\"><div class=\"level2_but\" style=\"background-image:url(img/q_m_but.gif)\">"+pageData.getWord("Agent's recordings")+"</div></a>");
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT"))
					out.write("<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/listenRecPicker1.jsp?tenant_dbid="+current_tenant_dbid+"&group=\" target=\"rbottom\" class=\"q_m_fill\" style=\"background-image:url(img/q_m_bg.gif)\"><div class=\"level2_but\" style=\"background-image:url(img/rep_but.gif)\">"+pageData.getWord("Agent monitoring report")+"</div></a>");
				
				
				
				
				
				//Start of Evaluation form ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT"))
				{
			
      out.write("\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_eval_fill\" style=\"background-image:url(img/q_m_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"q_m_eval");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/q_m_eval_closed.gif)\"><b>");
      out.print(pageData.getWord("Evaluation forms"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"q_m_eval");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
 //try{
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
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/form.jsp?dbid=&name=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"q_m_eval_fill\" style=\"background-image:url(img/q_m_eval_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/q_m_eval_add.gif)\">&#60;");
      out.print(pageData.getWord("Add a form "));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_eval_a_fill\" style=\"background-image:url(img/q_m_eval_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"q_m_eval_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/q_m_eval_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active forms"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"q_m_eval_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(active_evaluations_html);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/q_m_eval_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_eval_i_fill\" style=\"background-image:url(img/q_m_eval_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"q_m_eval_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/q_m_eval_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive forms"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"q_m_eval_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(inactive_evaluations_html);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/q_m_eval_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_eval_ans_fill\" style=\"background-image:url(img/q_m_eval_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_ans')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"q_m_eval_ans");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/q_m_eval_ans_closed.gif)\"><b>");
      out.print(pageData.getWord("Answers list"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"q_m_eval_ans");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t        \r\n");
      out.write("\t\t\t\t\t        ");
 
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
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/answer.jsp?dbid=&name=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"q_m_eval_ans_fill\" style=\"background-image:url(img/q_m_eval_ans_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"level4_but\" style=\"background-image:url(img/q_m_eval_ans_add.gif)\">&#60;");
      out.print(pageData.getWord("Add answers list"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_eval_ans_a_fill\" style=\"background-image:url(img/q_m_eval_ans_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_ans_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"q_m_eval_ans_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level4\" style=\"background-image:url(img/q_m_eval_ans_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active answers list"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"q_m_eval_ans_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(active_answers_html);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/q_m_eval_ans_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_eval_ans_i_fill\" style=\"background-image:url(img/q_m_eval_ans_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_ans_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"q_m_eval_ans_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level4\" style=\"background-image:url(img/q_m_eval_ans_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive answers list"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"q_m_eval_ans_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(inactive_answers_html);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/q_m_eval_ans_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/q_m_eval_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_eval_lab_fill\" style=\"background-image:url(img/q_m_eval_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_lab')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"q_m_eval_lab");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/q_m_eval_lab_closed.gif)\"><b>");
      out.print(pageData.getWord("Labels list"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"q_m_eval_lab");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t        \r\n");
      out.write("\t\t\t\t\t        ");
 
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
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/label.jsp?dbid=&name=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"q_m_eval_lab_fill\" style=\"background-image:url(img/q_m_eval_lab_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"level4_but\" style=\"background-image:url(img/q_m_eval_lab_add.gif)\">&#60;");
      out.print(pageData.getWord("Add labels list"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_eval_lab_a_fill\" style=\"background-image:url(img/q_m_eval_lab_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_lab_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"q_m_eval_lab_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level4\" style=\"background-image:url(img/q_m_eval_lab_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active labels list"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"q_m_eval_lab_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(active_labels_html);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/q_m_eval_lab_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"q_m_eval_lab_i_fill\" style=\"background-image:url(img/q_m_eval_lab_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'q_m_eval_lab_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"q_m_eval_lab_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level4\" style=\"background-image:url(img/q_m_eval_lab_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive labels list"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"q_m_eval_lab_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(inactive_labels_html);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/q_m_eval_lab_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/q_m_eval_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/q_m_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("                    \t\t\t\r\n");
      out.write("            ");
				
//				}catch(Exception e){e.printStackTrace();}//Fin de if Right("ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT")      			
                   }	
      out.write("  \t\t\r\n");
      out.write("\t\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/ten_bg.gif)\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t");
	
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
					}
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"w_f_man_fill\" style=\"background-image:url(img/ten_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'w_f_man')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"w_f_man");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level1\" style=\"background-image:url(img/w_f_man_closed.gif)\"><b>");
      out.print(pageData.getWord("Work Force Management"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div id=\"w_f_man");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
 //Teams 
      out.write("\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"team_fill\" style=\"background-image:url(img/w_f_man_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'team')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"team");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/team_closed.gif)\"><b>");
      out.print(pageData.getWord("Teams"));
      out.write(" </b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"team");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/wfmTeam1.jsp?team=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"team_fill\" style=\"background-image:url(img/team_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/team_add.gif)\">&#60;");
      out.print(pageData.getWord("Add a team"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(team_management_html);
      out.write("\t\r\n");
      out.write("                        \t<div class=\"menuspacer\" style=\"background-image:url(img/w_f_man_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
 //Schedule 
      out.write("\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"sched_fill\" style=\"background-image:url(img/w_f_man_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'sched')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"sched");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/sched_closed.gif)\"><b>");
      out.print(pageData.getWord("Schedule"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"sched");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/LoadHoraire.jsp?tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("&tenantName=");
      out.print(current_tenant_name);
      out.write("\" target=\"rbottom\" class=\"sched_fill\" style=\"background-image:url(img/sched_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/sched_but.gif)\">");
      out.print(pageData.getWord("Import schedule"));
      out.write("</div></a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/horaires1.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("&complete=no\" target=\"rbottom\" class=\"sched_fill\" style=\"background-image:url(img/sched_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/sched_but.gif)\">");
      out.print(pageData.getWord("Assign schedule"));
      out.write("</div></a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/horaires1.jsp?tenant_dbid=");
      out.print(current_tenant_dbid );
      out.write("&complete=yes\" target=\"rbottom\" class=\"sched_fill\" style=\"background-image:url(img/sched_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/sched_but.gif)\">");
      out.print(pageData.getWord("Review published schedule"));
      out.write("</div></a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/horaires1.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("&report=yes\" target=\"rbottom\" class=\"sched_fill\" style=\"background-image:url(img/sched_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Scheduled agents' report"));
      out.write("</div></a>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/w_f_man_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
 //adherence 
      out.write("\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"adher_fill\" style=\"background-image:url(img/w_f_man_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'adher')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"adher");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/adher_closed.gif)\"><b>");
      out.print(pageData.getWord("adherence"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"adher");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/rta1.jsp?type=AgentGroupsRTA&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"adher_fill\" style=\"background-image:url(img/adher_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/adher_but.gif)\">");
      out.print(pageData.getWord("Real Time Adherence"));
      out.write("</div></a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/rta1.jsp?type=Agents&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"adher_fill\" style=\"background-image:url(img/adher_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/adher_but.gif)\">");
      out.print(pageData.getWord("View Adherence Graph"));
      out.write("</div></a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/adherenceReport1.jsp?type=AgentAdherenceReport&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"adher_fill\" style=\"background-image:url(img/adher_bg.gif)\"><div class=\"level3_but\" style=\"background-image:url(img/rep_but.gif)\">");
      out.print(pageData.getWord("Adherence Report"));
      out.write("</div></a>\r\n");
      out.write("                        \t<div class=\"menuspacer\" style=\"background-image:url(img/w_f_man_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("                    \t<div class=\"menuspacer\" style=\"background-image:url(img/ten_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t");

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
				
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"f_i_fill\" style=\"background-image:url(img/ten_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"f_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level1\" style=\"background-image:url(img/f_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Financial information"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t<div id=\"f_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t");

					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_CONFIGURATION"))
					{
						//ALLOW_FINANCIAL_CONFIGURATION
					
      out.write("\r\n");
      out.write("\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"f_i_act_fill\" style=\"background-image:url(img/f_i_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_act')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"f_i_act");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/f_i_act_closed.gif)\"><b>");
      out.print(pageData.getWord("Activity"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"f_i_act");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/Activity1.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"f_i_act_fill\" style=\"background-image:url(img/f_i_act_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/f_i_act_add.gif)\">&#60;");
      out.print(pageData.getWord("Add an activity"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"f_i_act_cur_fill\" style=\"background-image:url(img/f_i_act_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_act_cur')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"f_i_act_cur");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/f_i_act_cur_closed.gif)\"><b>");
      out.print(pageData.getWord("Current activities"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"f_i_act_cur");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(current_activities_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/f_i_act_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/f_i_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"f_i_conf_fill\" style=\"background-image:url(img/f_i_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_conf')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"f_i_conf");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/f_i_conf_closed.gif)\"><b>");
      out.print(pageData.getWord("Configuration"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"f_i_conf");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/generalConfigDemo1.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"f_i_conf_fill\" style=\"background-image:url(img/f_i_conf_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/f_i_conf_but.gif)\">");
      out.print(pageData.getWord("Payroll configuration"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/f_i_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"f_i_com_fill\" style=\"background-image:url(img/f_i_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_com')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"f_i_com");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/f_i_com_closed.gif)\"><b>");
      out.print(pageData.getWord("Commissions"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"f_i_com");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
 
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
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/mopTreatment1.jsp?mop_treatment_dbid=&mop_treatment_name=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"f_i_com_fill\" style=\"background-image:url(img/f_i_com_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/f_i_com_add.gif)\">&#60;");
      out.print(pageData.getWord("Add commission"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"f_i_com_a_fill\" style=\"background-image:url(img/f_i_com_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_com_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"f_i_com_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/f_i_com_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active commissions"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"f_i_com_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(active_commission_html);
      out.write("\r\n");
      out.write("                                <div class=\"menuspacer\" style=\"background-image:url(img/f_i_com_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"f_i_com_i_fill\" style=\"background-image:url(img/f_i_com_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'f_i_com_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"f_i_com_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/f_i_com_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive commissions"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"f_i_com_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(inactive_commission_html);
      out.write("\r\n");
      out.write("                                <div class=\"menuspacer\" style=\"background-image:url(img/f_i_com_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/cmp_commission_creator.jsp\" target=\"rbottom\" class=\"f_i_com_fill\" style=\"background-image:url(img/f_i_com_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/f_i_com_but.gif)\">");
      out.print(pageData.getWord("Create Commission V2"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/cmp_commission_condition.jsp\" target=\"rbottom\" class=\"f_i_com_fill\" style=\"background-image:url(img/f_i_com_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/f_i_com_but.gif)\">");
      out.print(pageData.getWord("Create commissions V2 conditions"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/f_i_bg.gif)\"></div>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t");

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
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"mop_fill\" style=\"background-image:url(img/f_i_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'mop')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"mop");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/mop_closed.gif)\"><b>");
      out.print(pageData.getWord("Methods Of Payment"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"mop");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/mop1.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"mop_fill\" style=\"background-image:url(img/mop_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/mop_add.gif)\">&#60;");
      out.print(pageData.getWord("Add Method of Payment"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"mop_a_fill\" style=\"background-image:url(img/mop_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'mop_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"mop_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/mop_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active MOPs"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"mop_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(active_mops_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/mop_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"mop_i_fill\" style=\"background-image:url(img/mop_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'mop_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"mop_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/mop_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive MOPs"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"mop_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(inactive_mops_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/mop_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/f_i_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<!-- Dispo -->\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"dispo_fill\" style=\"background-image:url(img/f_i_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'dispo')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"dispo");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/dispo_closed.gif)\"><b>Dispo</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"dispo");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/dispo_creator.jsp\" target=\"rbottom\" class=\"dispo_fill\" style=\"background-image:url(img/dispo_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/dispo_but.gif)\">");
      out.print(pageData.getWord("Dispo Creator"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/dispo_options_creator.jsp\" target=\"rbottom\" class=\"dispo_fill\" style=\"background-image:url(img/dispo_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/dispo_but.gif)\">");
      out.print(pageData.getWord("Dispo Options Creator"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/dispo_cmp_assoc.jsp\" target=\"rbottom\" class=\"dispo_fill\" style=\"background-image:url(img/dispo_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/dispo_but.gif)\">");
      out.print(pageData.getWord("Dispo-Cmp association"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/f_i_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
 //<!-- end ALLOW_FINANCIAL_CONFIGURATION --> 

					
				}
					
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_REPORTS"))
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t<!-- Add an a line to add the possibility to add  -->\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"rep_fill\" style=\"background-image:url(img/f_i_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'rep')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"rep");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/rep_closed.gif)\"><b>");
      out.print(pageData.getWord("Reports"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t<div id=\"rep");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/loginvsProduction.jsp?type=report&sessionParams=init&viewData=&saveAddedRows=&startDate=&agentGroupId=&agentId=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("&strToInsert=&strToUpdate=\" target=\"rbottom\" class=\"rep_fill\" style=\"background-image:url(img/rep_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/f_i_rep_but.gif)\">");
      out.print(pageData.getWord("Agent Hours report"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./jsp/extractPayrollData.jsp\" target=\"rbottom\" class=\"rep_fill\" style=\"background-image:url(img/rep_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/f_i_rep_but.gif)\">");
      out.print(pageData.getWord("Extract payroll data"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./jsp/commissionReport.jsp?viewData=&tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("&fromDate=&toDate=&reqType=&objId=\" target=\"rbottom\" class=\"rep_fill\" style=\"background-image:url(img/rep_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/f_i_rep_but.gif)\">");
      out.print(pageData.getWord("Commission details"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/cmp_commission_report.jsp\" target=\"rbottom\" class=\"rep_fill\" style=\"background-image:url(img/rep_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/f_i_rep_but.gif)\">");
      out.print(pageData.getWord("Commission V2 Report"));
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("                    <div class=\"menuspacer\" style=\"background-image:url(img/f_i_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t");
 }
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
			
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"m_c_fill\" style=\"background-image:url(img/ten_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'm_c')\">\r\n");
      out.write("\t\t\t\t<div id=\"m_c");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level1\" style=\"background-image:url(img/m_c_closed.gif)\"><b>");
      out.print(pageData.getWord("Message center"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\t<div id=\"m_c");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"stat_fill\" style=\"background-image:url(img/m_c_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'stat')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"stat");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/stat_closed.gif)\"><b>");
      out.print(pageData.getWord("Statistics"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div id=\"stat");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/McStatistics.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"stat_fill\" style=\"background-image:url(img/stat_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/stat_add.gif)\">&#60;");
      out.print(pageData.getWord("Add statistic"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"stat_a_fill\" style=\"background-image:url(img/stat_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'stat_a')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"stat_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/stat_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active statistics"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"stat_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(active_statisticStarPhone_html);
      out.write("\t\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/stat_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"stat_i_fill\" style=\"background-image:url(img/stat_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'stat_i')\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"stat_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/stat_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive statistics"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"stat_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(inactive_statisticStarPhone_html);
      out.write("\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/alert_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("                    <div class=\"menuspacer\" style=\"background-image:url(img/m_c_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"alert_fill\" style=\"background-image:url(img/m_c_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'alert')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"alert");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/alert_closed.gif)\"><b>Alerts</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t<div id=\"alert");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/McAlert.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("\" target=\"rbottom\" class=\"alert_fill\" style=\"background-image:url(img/alert_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"level3_but\" style=\"background-image:url(img/alert_add.gif)\">&#60;");
      out.print(pageData.getWord("Add alert"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"alert_a_fill\" style=\"background-image:url(img/alert_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'alert_a')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"alert_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/alert_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active alerts"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"alert_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(active_alertStarPhone_html);
      out.write("\t\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/alert_bg.gif)\"></div>\t\t\r\n");
      out.write("\t\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"alert_i_fill\" style=\"background-image:url(img/alert_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'alert_i')\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"alert_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level3\" style=\"background-image:url(img/alert_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive alerts"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"alert_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(inactive_alertStarPhone_html);
      out.write("\r\n");
      out.write("                            <div class=\"menuspacer\" style=\"background-image:url(img/alert_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("                        <div class=\"menuspacer\" style=\"background-image:url(img/m_c_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("                <div class=\"menuspacer\" style=\"background-image:url(img/ten_bg.gif)\"></div>\r\n");
      out.write("\t\t</div>\r\n");
  //<!-- end ALLOW_MESSAGE_CENTER_MANAGEMENT --> 
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
				
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"rout_fill\" style=\"background-image:url(img/ten_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild,  'rout')\">\r\n");
      out.write("\t\t\t\t<div id=\"rout");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level1\" style=\"background-image:url(img/rout_closed.gif)\"><b>");
      out.print(pageData.getWord("Routing scripts"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\t<div id=\"rout");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"./Resources_pages/routingScript.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("&tenantName=");
      out.print(current_tenant_name);
      out.write("\" target=\"rbottom\" class=\"rout_fill\" style=\"background-image:url(img/rout_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/rout_add.gif)\">&#60;");
      out.print(pageData.getWord("Add Routing Script"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"rout_a_fill\" style=\"background-image:url(img/rout_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'rout_a')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"rout_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/rout_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active scripts"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t<div id=\"rout_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t");
      out.print(active_routing_scripts_html);
      out.write("\r\n");
      out.write("                    <div class=\"menuspacer\" style=\"background-image:url(img/rout_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"rout_i_fill\" style=\"background-image:url(img/rout_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'rout_i')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"rout_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/rout_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive scripts"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div id=\"rout_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t");
      out.print(inactive_routing_scripts_html);
      out.write("\r\n");
      out.write("                    <div class=\"menuspacer\" style=\"background-image:url(img/rout_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("                <div class=\"menuspacer\" style=\"background-image:url(img/ten_bg.gif)\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t");
}
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
			
      out.write("\r\n");
      out.write("\t <a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"popu_fill\" style=\"background-image: url(img/ten_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'popu')\">\r\n");
      out.write("     <div id=\"popu");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level1\" style=\"background-image:url(img/popu_closed.gif)\"><b>");
      out.print(pageData.getWord("Form Builder"));
      out.write("</b></div>\r\n");
      out.write("             </a>\r\n");
      out.write("\t\t\t<div id=\"popu");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" onclick=\"openBuilder()\" href=\"./Resources_pages/popup/popup.jsp?tenant_dbid=");
      out.print(current_tenant_dbid);
      out.write("&tenantName=");
      out.print(current_tenant_name);
      out.write("\" target=\"Text\" class=\"popu_fill\" style=\"background-image:url(img/popu_bg.gif)\">\r\n");
      out.write("\t\t\t\t\t<div class=\"level2_but\" style=\"background-image:url(img/popu_add.gif)\">&#60;");
      out.print(pageData.getWord("Add New Form"));
      out.write("&#62;</div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"popu_a_fill\" style=\"background-image:url(img/popu_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'popu_a')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"popu_a");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/popu_a_closed.gif)\"><b>");
      out.print(pageData.getWord("Active Forms"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t<div id=\"popu_a");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t  ");
      out.print(active_popup_builder_html);
      out.write("\r\n");
      out.write("                    <div class=\"menuspacer\" style=\"background-image:url(img/popu_bg.gif)\" ></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<a onmouseover=\"colorFade(this,'background','ffffff','f9dfc2',3,1)\" onmouseout=\"colorFade(this,'background','f9dfc2','ffffff',4,1)\" href=\"javascript:;\" class=\"popu_i_fill\" style=\"background-image:url(img/popu_bg.gif)\" onclick=\"visibleTog(this.firstChild),imageTog(this.firstChild, 'popu_i')\">\r\n");
      out.write("\t\t\t\t\t<div id=\"popu_i");
      out.print(current_tenant_dbid);
      out.write("\" class=\"level2\" style=\"background-image:url(img/popu_i_closed.gif)\"><b>");
      out.print(pageData.getWord("Inactive Forms"));
      out.write("</b></div>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div id=\"popu_i");
      out.print(current_tenant_dbid);
      out.write("_menu\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t");
      out.print(inactive_popup_builder_html);
      out.write("\r\n");
      out.write("                    <div class=\"menuspacer\" style=\"background-image:url(img/popu_bg.gif)\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("                <div class=\"menuspacer\" style=\"background-image:url(img/ten_bg.gif)\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t");
}
		// END of if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_POPUP_BUILDER")
			
      out.write("\r\n");
      out.write("\t\t\t<div class=\"menuspacer\" style=\"background-image:url(img/base_level_bg.gif)\"></div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t");

		} //Fin du for...
		
      out.write("\r\n");
      out.write("\t\t<div class=\"menuspacer\" style=\"background-image:url(img/base_level_bg.gif)\"></div>\r\n");
      out.write("\t<div id=\"menuBottomPos\"></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");

	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");

// search box - available if user has ALLOW_TENANT_VIEW privalege
if( pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TENANT_VIEW") )
{

      out.write("\r\n");
      out.write("<div id=\"menuSearchBox\" style=\"background-color:#e58025; height:; visibility:hidden;\">\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"SearchTitleBar\" style=\"border-style:solid; border-width:1px; border-color:#AA473C; background-color:#AFA; padding-left:10px;\" onclick=\"openSearch()\" onmouseover=\"searchTitleOver()\" onmouseout=\"searchTitleOut()\">\r\n");
      out.write("\t\t<span id=\"openArrows\" style=\"float:right; padding-right:8px\"></span>\r\n");
      out.write("\t\t<font color=\"#8D630A\">");
      out.print(pageData.getWord("search-lc"));
      out.write("</font>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"search001\" style=\"display:none; padding-top:4px;\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t<div id=\"serTenant\" style=\"color:#FFFBF0; padding-left:10px; padding-bottom:4px\">\r\n");
      out.write("\t\t\t");

				if (tenantsDataResult.size() > 1){			// if more than one tenant give drop down box to choose tenant
			
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.print(pageData.getWord("Tenant"));
      out.write("<br />\r\n");
      out.write("\t\t\t\t\t\t<select name=\"whichTenant\" style=\"font-size:10px;\">\r\n");
      out.write("\t\t\t");

					for(int i = 0; i < tenantsDataResult.size(); i++)
					{
						String tenant_dbid = (String)tenantsDataResult.elementAt(i).get("dbid");
						String tenant_name = (String)tenantsDataResult.elementAt(i).get("name");
			
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"");
      out.print(tenant_dbid);
      out.write('"');
      out.write('>');
      out.print(tenant_name);
      out.write("</option>\r\n");
      out.write("\t\t\t");

					}
			
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t");

				}else{										// one tenant - no drop down and set values
					String tenant_dbid = (String)tenantsDataResult.elementAt(0).get("dbid");
					String tenant_name = (String)tenantsDataResult.elementAt(0).get("name");
			
      out.write("\r\n");
      out.write("\t\t\t\t<span style=\"border-style:solid; border-width:1px; border-color:#B66001; padding-left:4px; padding-right:4px; color:#824100\"><b>");
      out.print(tenant_name);
      out.write("</b></span><input type=\"hidden\" name=\"whichTenant\" value=\"");
      out.print(tenant_dbid);
      out.write("\" />\r\n");
      out.write("\t\t\t");

				}
			
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"serCategory\" style=\"color:#FFFBF0; padding-left:10px;\">\r\n");
      out.write("\t\t\t<select name=\"whichCategory\" style=\"font-size:10px; margin-bottom:8px;\" onchange=\"focusCat()\">\r\n");
      out.write("\t\t\t\t<option value=\"\" style=\"color:#A0A0A4;\" selected>- ");
      out.print(pageData.getWord("select a category"));
      out.write(" -</option>\r\n");
      out.write("\t\t\t\t");
											// which options appear in the drop down list depend on the user privaleges
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t    <option id=\"age_opt\" value=\"age\">");
      out.print(pageData.getWord("Agents"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"age_gr_opt\" value=\"age_gr\">");
      out.print(pageData.getWord("Agent Groups"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CAMPAIGN_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"cam_opt\" value=\"cam\">");
      out.print(pageData.getWord("Campaigns"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"call_opt\" value=\"call\">");
      out.print(pageData.getWord("Calling Lists"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_DONOTCALL_LIST_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"no_call_cur_opt\" value=\"no_call_cur\">");
      out.print(pageData.getWord("Do-not-call lists"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FILTER_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"fil_opt\" value=\"fil\">");
      out.print(pageData.getWord("Filters"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_TREATMENTS_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"treat_opt\" value=\"treat\">");
      out.print(pageData.getWord("Treatments"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_NOT_READY_REASON_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"no_ready_opt\" value=\"no_ready\">");
      out.print(pageData.getWord("Not-ready reasons"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUEUES_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"age_qu_opt\" value=\"age_qu\">");
      out.print(pageData.getWord("Agent group queues"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					
						if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT"))
						{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"rout_qu_opt\" value=\"rout_qu\">");
      out.print(pageData.getWord("Routing script queues"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

						}
					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"skill_opt\" value=\"skill\">");
      out.print(pageData.getWord("Skills"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_QUALITY_MONITORING_AGENTLISTENING_FORM_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"q_m_eval_opt\" value=\"q_m_eval\">");
      out.print(pageData.getWord("Evaluation forms"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option id=\"q_m_eval_ans_opt\" value=\"q_m_eval_ans\">");
      out.print(pageData.getWord("Answers list"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option id=\"q_m_eval_lab_opt\" value=\"q_m_eval_lab\">");
      out.print(pageData.getWord("Labels list"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_WORK_FORCE_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"team_opt\" value=\"team\">");
      out.print(pageData.getWord("Teams"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_MESSAGE_CENTER_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"stat_opt\" value=\"stat\">");
      out.print(pageData.getWord("Statistics"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option id=\"alert_opt\" value=\"alert\">");
      out.print(pageData.getWord("Alerts"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_ROUTING_SCRIPT_MANAGEMENT"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"rout_opt\" value=\"rout\">");
      out.print(pageData.getWord("Routing scripts"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_POPUP_BUILDER"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<option id=\"popu_opt\" value=\"popu\">");
      out.print(pageData.getWord("Form Builder"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
					if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_CONFIGURATION"))
					{
				
      out.write("\r\n");
      out.write("\t\t\t\t<optgroup label=\"-");
      out.print(pageData.getWord("Financial information"));
      out.write(":\" style=\"color:#007FAA;\">\r\n");
      out.write("\t\t\t\t\t<option id=\"f_i_act_cur_opt\" value=\"f_i_act_cur\" style=\"color:#000000;\">");
      out.print(pageData.getWord("Current activities"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t<option id=\"f_i_com_opt\" value=\"f_i_com\" style=\"color:#000000;\">");
      out.print(pageData.getWord("Commissions"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t<option id=\"mop_opt\" value=\"mop\" style=\"color:#000000;\">");
      out.print(pageData.getWord("Methods of payment"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t</optgroup>\r\n");
      out.write("\t\t\t\t");

					}
				
      out.write("\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"serAgent\" style=\"color:#FFFBF0; margin-left:5px; margin-right:5px; margin-bottom:4px; padding-left:5px; padding-right:5px; border-style:solid; border-width:1px; border-color:#B66001; display:none\">\r\n");
      out.write("\t\t\t");
      out.print(pageData.getWord("First name"));
      out.write("<br />\r\n");
      out.write("\t\t\t<input id=\"searchfirst\" type=\"text\" value=\"\" size=\"18\" name=\"searchfirst\" style=\"font-size:10px; margin-bottom:4px;\" /><br />\r\n");
      out.write("\t\t\t");
      out.print(pageData.getWord("Last name"));
      out.write("<br />\r\n");
      out.write("\t\t\t<input id=\"searchlast\" type=\"text\" value=\"\" size=\"18\" name=\"searchlast\" style=\"font-size:10px; margin-bottom:4px;\" /><br />\r\n");
      out.write("\t\t\t<font color=\"#824100\">- ");
      out.print(pageData.getWord("or-lc"));
      out.write(" -</font><br />\r\n");
      out.write("\t\t\t");
      out.print(pageData.getWord("Agent ID"));
      out.write("<br />\r\n");
      out.write("\t\t\t<input id=\"searchid\" type=\"text\" value=\"\" size=\"12\" name=\"searchid\" style=\"font-size:10px; margin-bottom:4px;\" />\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"serOther\" style=\"color:#FFFBF0; margin-left:5px; margin-right:5px; margin-bottom:4px; padding-left:5px; padding-right:5px; border-style:solid; border-width:1px; border-color:#B66001; display:none\">\r\n");
      out.write("\t\t\t");
      out.print(pageData.getWord("Name"));
      out.write("<br />\r\n");
      out.write("\t\t\t<input id=\"searchfullname\" type=\"text\" value=\"\" size=\"20\" name=\"searchfullname\" style=\"font-size:10px; margin-bottom:4px;\" /><br />\r\n");
      out.write("\t\t\t<font color=\"#824100\">- ");
      out.print(pageData.getWord("or-lc"));
      out.write(" -</font><br />\r\n");
      out.write("\t\t\t");
      out.print(pageData.getWord("Name includes"));
      out.write("<br />\r\n");
      out.write("\t\t\t<input id=\"searchpartname\" type=\"text\" value=\"\" size=\"20\" name=\"searchpartname\" style=\"font-size:10px; margin-bottom:4px;\" />\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"serGo\" style=\"padding-bottom:4px; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#FFF; text-align:right; padding-right:10px\">\r\n");
      out.write("\t\t\t<button id=\"mensearchbut\" onClick=\"doMenuSearch()\" style=\"cursor:pointer\" disabled=\"true\">");
      out.print(pageData.getWord("Search"));
      out.write("</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"serResults\" style=\"padding-bottom:4px; padding-top:4px; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#FFF; border-top-style:solid; border-top-width:1px; border-top-color:#B66001; text-align:center; display:none\"></div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"treeColapse\" style=\"padding-top:4px; padding-bottom:2px; padding-left:10px; border-top-style:solid; border-top-width:1px; border-top-color:#B66001; color:#FFFBF0;\">\r\n");
      out.write("\t\t\t<span style=\"float:right; padding-right:10px; cursor:pointer;\" onclick=\"closeAllTreeMenu()\"><img src=\"img/menutreeclose.gif\" width=\"14\" height=\"13\" hspace=\"0\" vspace=\"0\" border=\"0\" align=\"middle\" /></span><font color=\"#824100\">");
      out.print(pageData.getWord("close all open menus"));
      out.write("</font>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("</div>\r\n");

}
// end search box

      out.write("\r\n");
      out.write("<!-- Fixes the IE6 & IE7 \"Press SPACEBAR or ENTER to activate and use this control\" - must be at the end of the file-->\r\n");
      out.write("<script language=\"JScript\" type=\"text/jscript\" src=\"activateActiveX.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pageData.closeConnection(); 
      out.write("\r\n");
      out.write("\r\n");
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
