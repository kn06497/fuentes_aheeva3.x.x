package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import java.sql.ResultSet;
import aheevaManager.ressources.*;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;
import aheevaManager.ressources.*;

public final class agent_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/aheevaManager/Resources_pages/xc2_default_labels.jsp");
    _jspx_dependants.add("/aheevaManager/Resources_pages/agentFunctions_labels.jsp");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	boolean newAgent = false;
	boolean agentLoggedIn = true;

	String tenantDbid = request.getParameter("tenant_dbid");
	String agentDbid = request.getParameter("dbid");
	Agent vAgent = null;
	try
	{
		vAgent = new Agent(Integer.parseInt(agentDbid));
	}
	catch(NumberFormatException nfe)
	{
		vAgent = new Agent();
		newAgent = true;
	}

	AgentGroupCollection allGroups = null;
	try {
		allGroups = new AgentGroupCollection(Integer.parseInt(tenantDbid));
	}
	catch (NumberFormatException e) {
		allGroups = new AgentGroupCollection();
	}

	/* Get all available skills */
	SkillsCollection allSkills = null;
	try {
		allSkills = new SkillsCollection(Integer.parseInt(tenantDbid));
	}
	catch (NumberFormatException e) {
		allSkills = new SkillsCollection();
	}
	/* Mix the unassigned skills with the other skills */
	Vector<AgentSkill> allAgentSkills = vAgent.getAssignedSkills();
	for(int i = 0; i < allSkills.size(); i++)
	{
		Skill curSkill = allSkills.elementAt(i);
		AgentSkill curAgentSkill = new AgentSkill(curSkill.getDbid(), curSkill, 0);
		if(!allAgentSkills.contains(curAgentSkill))
		{
			allAgentSkills.add(curAgentSkill);
		}
	}

	SiteCollection allSites = new SiteCollection();

	ActivityCollection activities = null;
	try {
		activities = new ActivityCollection(Integer.parseInt(tenantDbid));
	}
	catch (NumberFormatException e) {
		activities = new ActivityCollection();
	}

	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	String userPrivilegesQuery  = "SELECT * FROM cfg_user WHERE DBID='"+CURRENT_USER_DBID+"'";

	pageData.openConnection();
	Vector <HashMap> userPrivilegesDataResult = pageData.executeFromStringToVector(userPrivilegesQuery);
	Vector<String> agtLoginIdList = new Vector();// list of all existing loginIds
	if(!newAgent)// if this isn't a new agent, he is desactivated if only he is logged out.
	{
		String AGT_LOGIN_ID = ((String)vAgent.getLoginId());
		// retreive agent's latest event
		String agtStatusQurery1 = "SELECT EVENT FROM datamart_agent_details WHERE AGENT_ID='"+AGT_LOGIN_ID+"'";
		String agtStatusQurery2 = "AND EVENT_TIME=(SELECT max(EVENT_TIME) FROM datamart_agent_details WHERE AGENT_ID='"+AGT_LOGIN_ID+"')";
		String agtStatusQurery = agtStatusQurery1.concat(agtStatusQurery2);
		Vector <HashMap> agtCurStatusRs = pageData.executeFromStringToVector(agtStatusQurery);
		//String agtCurStatusStr = (agtCurStatusRs.get(0)).toString();
		if(agtCurStatusRs.size() > 0)
		{
			String agtCurStatusStr = (agtCurStatusRs.get(0)).toString();
			System.out.println(agtCurStatusStr);  
			if(agtCurStatusStr.compareTo("{EVENT=LOGOUT}") == 0)
			{
				agentLoggedIn = false;
			}	
			else
			{
				agentLoggedIn = true;
			}
		}
		else 
		{//no agent's info retrieved
			agentLoggedIn = false;
		}             
	}	
	else// if this is a new agent, retrieve all existing loginIds, later we'll check if another agent has been given the same login id
	{
		String agtLogIdQuery = "SELECT LOGIN_ID FROM cfg_person";
		ResultSet agtLogIdRs = pageData.executeFromString(agtLogIdQuery);
	
		while(agtLogIdRs.next())
		{
			agtLoginIdList.add(agtLogIdRs.getString(1));
		}
	}

	

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style.css\" />\r\n");
      out.write("<link type=\"text/css\" rel=\"StyleSheet\" href=\"slider/css/luna.css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"xc2_default.css\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Language\" content=\"en-us\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100px;\r\n");
      out.write("}\r\n");
      out.write("html, body {\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("}\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write("body {\r\n");
      out.write("\tmargin:\t\t10px;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control h2 {\r\n");
      out.write("\ttext-align:\tcenter;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control h2 a {\r\n");
      out.write("\tdisplay:\tinline;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control a:hover {\r\n");
      out.write("\tbackground: transparent;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pagexc2Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pagexc2Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pagexc2Data.openConnection();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("// variables of labels;// \r\n");
      out.write("var phrase= new Array();\r\n");
      out.write("phrase[0]=\"");
      out.print( pagexc2Data.getWord("January"));
      out.write("\";\r\n");
      out.write("phrase[1]=\"");
      out.print( pagexc2Data.getWord("February"));
      out.write("\";\r\n");
      out.write("phrase[2]=\"");
      out.print( pagexc2Data.getWord("March"));
      out.write("\";\r\n");
      out.write("phrase[3]=\"");
      out.print( pagexc2Data.getWord("April"));
      out.write("\";\r\n");
      out.write("phrase[4]=\"");
      out.print( pagexc2Data.getWord("May"));
      out.write("\";         \r\n");
      out.write("phrase[5]=\"");
      out.print( pagexc2Data.getWord("June"));
      out.write("\";\r\n");
      out.write("phrase[6]=\"");
      out.print( pagexc2Data.getWord("July"));
      out.write("\";\r\n");
      out.write("phrase[7]=\"");
      out.print( pagexc2Data.getWord("August"));
      out.write("\";\r\n");
      out.write("phrase[8]=\"");
      out.print( pagexc2Data.getWord("September"));
      out.write("\";\r\n");
      out.write("phrase[9]=\"");
      out.print( pagexc2Data.getWord("October"));
      out.write("\";\r\n");
      out.write("phrase[10]=\"");
      out.print( pagexc2Data.getWord("November"));
      out.write("\";\r\n");
      out.write("phrase[11]=\"");
      out.print( pagexc2Data.getWord("December"));
      out.write("\";\r\n");
      out.write("phrase[12]=\"");
      out.print( pagexc2Data.getWord("Jan"));
      out.write("\";\r\n");
      out.write("phrase[13]=\"");
      out.print( pagexc2Data.getWord("Feb"));
      out.write("\";\r\n");
      out.write("phrase[14]=\"");
      out.print( pagexc2Data.getWord("Mar"));
      out.write("\";\r\n");
      out.write("phrase[15]=\"");
      out.print( pagexc2Data.getWord("Apr"));
      out.write("\";\r\n");
      out.write("phrase[16]=\"");
      out.print( pagexc2Data.getWord("May"));
      out.write("\";\r\n");
      out.write("phrase[17]=\"");
      out.print( pagexc2Data.getWord("Jun"));
      out.write("\";\r\n");
      out.write("phrase[18]=\"");
      out.print( pagexc2Data.getWord("Jul"));
      out.write("\";\r\n");
      out.write("phrase[19]=\"");
      out.print( pagexc2Data.getWord("Aug"));
      out.write("\";\r\n");
      out.write("phrase[20]=\"");
      out.print( pagexc2Data.getWord("Sep"));
      out.write("\";\r\n");
      out.write("phrase[21]=\"");
      out.print( pagexc2Data.getWord("Oct"));
      out.write("\";\r\n");
      out.write("phrase[22]=\"");
      out.print( pagexc2Data.getWord("Nov"));
      out.write("\";\r\n");
      out.write("phrase[23]=\"");
      out.print( pagexc2Data.getWord("Dec"));
      out.write("\";\r\n");
      out.write("phrase[24]=\"");
      out.print( pagexc2Data.getWord("Sunday"));
      out.write("\";\r\n");
      out.write("phrase[25]=\"");
      out.print( pagexc2Data.getWord("Monday"));
      out.write("\";\r\n");
      out.write("phrase[26]=\"");
      out.print( pagexc2Data.getWord("Tuesday"));
      out.write("\";\r\n");
      out.write("phrase[27]=\"");
      out.print( pagexc2Data.getWord("Wednesday"));
      out.write("\";\r\n");
      out.write("phrase[28]=\"");
      out.print( pagexc2Data.getWord("Thursday"));
      out.write("\";\r\n");
      out.write("phrase[29]=\"");
      out.print( pagexc2Data.getWord("Friday"));
      out.write("\";\r\n");
      out.write("phrase[30]=\"");
      out.print( pagexc2Data.getWord("Saturday"));
      out.write("\";\r\n");
      out.write("phrase[31]=\"");
      out.print( pagexc2Data.getWord("Sun"));
      out.write("\";\r\n");
      out.write("phrase[32]=\"");
      out.print( pagexc2Data.getWord("Mon"));
      out.write("\";\r\n");
      out.write("phrase[33]=\"");
      out.print( pagexc2Data.getWord("Tue"));
      out.write("\";\r\n");
      out.write("phrase[34]=\"");
      out.print( pagexc2Data.getWord("Wed"));
      out.write("\";\r\n");
      out.write("phrase[35]=\"");
      out.print( pagexc2Data.getWord("Thu"));
      out.write("\";\r\n");
      out.write("phrase[36]=\"");
      out.print( pagexc2Data.getWord("Fri"));
      out.write("\";\r\n");
      out.write("phrase[37]=\"");
      out.print( pagexc2Data.getWord("Sat"));
      out.write("\";\r\n");
      out.write("phrase[38]=\"");
      out.print( pagexc2Data.getWord("Su"));
      out.write("\";\r\n");
      out.write("phrase[39]=\"");
      out.print( pagexc2Data.getWord("Mo"));
      out.write("\";\r\n");
      out.write("phrase[40]=\"");
      out.print( pagexc2Data.getWord("Tu"));
      out.write("\";\r\n");
      out.write("phrase[41]=\"");
      out.print( pagexc2Data.getWord("We"));
      out.write("\";\r\n");
      out.write("phrase[42]=\"");
      out.print( pagexc2Data.getWord("Th"));
      out.write("\";\r\n");
      out.write("phrase[43]=\"");
      out.print( pagexc2Data.getWord("Fr"));
      out.write("\";\r\n");
      out.write("phrase[44]=\"");
      out.print( pagexc2Data.getWord("Sa"));
      out.write("\";\r\n");
      out.write("phrase[45]=\"");
      out.print( pagexc2Data.getWord(" Today "));
      out.write("\";\r\n");
      out.write("phrase[46]=\"");
      out.print( pagexc2Data.getWord("Clear"));
      out.write("\";\r\n");
      out.write("phrase[47]=\"");
      out.print( pagexc2Data.getWord("Back"));
      out.write("\";\r\n");
      out.write("phrase[48]=\"");
      out.print( pagexc2Data.getWord("Close"));
      out.write("\";\r\n");
      out.write("phrase[49]=\"");
      out.print( pagexc2Data.getWord("Reset"));
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pagexc2Data.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');

beanManagerData pageAgntFData = new beanManagerData();
pageAgntFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageAgntFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var string= new Array();\r\n");
      out.write("string[0]=\"");
      out.print(pageAgntFData.getWord("Are you sure, you wish to delete this agent?") );
      out.write("\";\r\n");
      out.write("string[1]=\"");
      out.print(pageAgntFData.getWord("name fields: First name and Last name required") );
      out.write("\";\r\n");
      out.write("string[2]=\"");
      out.print(pageAgntFData.getWord("Login and Password required") );
      out.write("\";\r\n");
      out.write("string[3]=\"");
      out.print(pageAgntFData.getWord("You must select a site.") );
      out.write("\";\r\n");
      out.write("string[4]=\"");
      out.print(pageAgntFData.getWord("Agent must have at least one preferred site") );
      out.write("\";\r\n");
      out.write("string[5]=\"");
      out.print(pageAgntFData.getWord("Invalid use of character") );
      out.write("\";\r\n");
      out.write("string[6]=\"");
      out.print(pageAgntFData.getWord("Invalid login. Already given to another agent") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageAgntFData.closeConnection(); 
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"agentFunctions.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- Calendar required javascript -->\r\n");
      out.write("<script language=\"javascript\" src=\"xc2_default.js\"></script>\r\n");
      out.write("<script language=\"javascript\">xcAutoHide=1000;xcDateFormat=\"yyyy-mm-dd\";</script>\r\n");
      out.write("<script language=\"javascript\" src=\"xc2_inpage.js\"></script>\r\n");
      out.write("<!-- End of calendar required section -->\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"slider/js/range.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"slider/js/timer.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"slider/js/slider.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("var tenant_dbid = \"");
      out.print(tenantDbid);
      out.write("\";\r\n");
      out.write("var agentLoginID = \"");
      out.print(vAgent.getLoginId());
      out.write("\";\r\n");
      out.write("var newAgent = ");
      out.print(newAgent);
      out.write(";\r\n");
      out.write("var agentDbid = \"");
      out.print(agentDbid);
      out.write("\";\r\n");
      out.write("var agentLoggedIn = ");
      out.print(agentLoggedIn);
      out.write(";\r\n");
      out.write("\r\n");

if(vAgent.getDbid() > 0)
{
	out.println("agentDbid = '" + vAgent.getDbid() + "';");
}

      out.write("\r\n");
      out.write("var originalAgentState = ");
      out.print(vAgent.getIsActive() ? "1" : "0");
      out.write(';');
      out.write('\r');
      out.write('\n');
 if(newAgent)
{// store all loginIds retrieved from DB in an array to check for new loginId's uniqueness

      out.write("\r\n");
      out.write("\tvar agtLoginIdArray = new Array();\r\n");
 
	//int i=0;
	int sizeAgtLoginIdList = agtLoginIdList.size();
	System.out.println("sizeAgtLoginIdList -------"+sizeAgtLoginIdList);
	if(sizeAgtLoginIdList>0)
	{
	 	for(int i=0; i<sizeAgtLoginIdList; i++)
		{
	
      out.write("\r\n");
      out.write("\t\t\tagtLoginIdArray[");
      out.print(i);
      out.write("] = \"");
      out.print(agtLoginIdList.elementAt(i));
      out.write("\";\n");
      out.write("\t");
	
		}
	}
	
      out.write("\r\n");
      out.write("\tvar loginIdArraySize = ");
      out.print(sizeAgtLoginIdList);
      out.write(";\r\n");
      out.write("\t");

}

      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<SCRIPT language=\"JavaScript\">\r\n");
      out.write("<!--\r\n");
      out.write("if (document.images)\r\n");
      out.write("{\r\n");
      out.write("  pic1= new Image(90,25); \r\n");
      out.write("  pic1.src=\"../img/tab.gif\"; \r\n");
      out.write("\r\n");
      out.write("  pic2= new Image(94,25); \r\n");
      out.write("  pic2.src=\"../img/tab.active.gif\"; \r\n");
      out.write("\r\n");
      out.write("  pic3= new Image(90,25); \r\n");
      out.write("  pic3.src=\"../img/tab.hover.gif\"; \r\n");
      out.write("}\r\n");
      out.write("//-->\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("    // Associate a default button with pressing the Enter key\r\n");
      out.write("\tfunction KeyDownHandler(btn)\r\n");
      out.write("    {\r\n");
      out.write("        // process only the Enter key\r\n");
      out.write("        if (event.keyCode == 13)\r\n");
      out.write("        {\r\n");
      out.write("            // cancel the default submit\r\n");
      out.write("            event.returnValue=false;\r\n");
      out.write("            event.cancel = true;\r\n");
      out.write("            // submit the form by programmatically clicking the specified button\r\n");
      out.write("            btn.click();\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"age_body\">\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"agent\" onKeyDown=\"KeyDownHandler(save)\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("General"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t<legend>");
      out.print(pageData.getWord("General information"));
      out.write("</legend>\r\n");
      out.write("\t<table border=\"0\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Group ID"));
      out.write("\r\n");
      out.write("\t\t\t</td> \r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"AgentGroupSelection\" onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t\t\t<option value=\"\"></option>\r\n");
      out.write("\t\t\t\t");

					//iterate on the groups collection
					for (int i = 0; i < allGroups.size(); i++) {
						AgentGroup curGroup = allGroups.elementAt(i);
						String groupSelected = curGroup.equals(vAgent.getAgentGroup()) ? "selected" : "";
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<option value=\"");
      out.print(curGroup.getDbid());
      out.write('"');
      out.write(' ');
      out.print(groupSelected);
      out.write('>');
      out.print(curGroup.getName());
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t");

					}
				
      out.write("\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td colspan=\"2\">&nbsp;</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Last name"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"agtLastName\" size=\"27\" onChange=\"enableUpdateButton(true)\"\tvalue=\"");
      out.print(vAgent.getLastName());
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("First name"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"agtFirstName\" size=\"27\" onChange=\"enableUpdateButton(true)\" value=\"");
      out.print(vAgent.getFirstName());
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td valign=\"top\">");
      out.print(pageData.getWord("Comments"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t<textarea rows=\"3\" name=\"comments\" cols=\"70\" onChange=\"enableUpdateButton()\">");
      out.print(vAgent.getComments());
      out.write("</textarea>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100\">\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Login"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"login\" size=\"10\" onChange=\"enableUpdateButton()\"\r\n");
      out.write("\t\t\t\tvalue=\"");
      out.print(vAgent.getLoginId());
      out.write('"');
      out.write(' ');
      out.print(newAgent ? "" : "disabled");
      out.write(">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Password"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"password\" name=\"password\" size=\"10\" onChange=\"enableUpdateButton()\"\r\n");
      out.write("\t\t\t\tvalue=\"");
      out.print(vAgent.getPassword());
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Start Date"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td valign=\"top\" align=\"left\">\r\n");
      out.write("\t\t\t\t<input type=\"text\"  size=\"10\" onClick=\"enableUpdateButton()\" onFocus=\"showCalendar('',this,this,'','startWorkDate',0,30,1);this.blur()\" id=\"startWorkDate\"  name=\"startWorkDate\" \r\n");
      out.write("\t\t\t\tvalue=\"");
      out.print(vAgent.getStartDate());
      out.write("\"/>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("End Date"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td valign=\"top\" align=\"left\">\r\n");
      out.write("\t\t\t\t<input type=\"text\"  size=\"10\" onClick=\"enableUpdateButton()\" onFocus=\"showCalendar('',this,this,'','endWorkDate',0,30,1);this.blur()\" id=\"endWorkDate\" name=\"endWorkDate\" \r\n");
      out.write("\t\t\t\tvalue=\"");
      out.print(vAgent.getEndDate());
      out.write("\"/>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Active"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t<input type=\"checkbox\" name=\"state\" onClick=\"enableUpdateButton()\" ");
      out.print(vAgent.getIsActive() ? "checked" : "");
      out.write(">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Activity"));
      out.write("\t\t\t\t\t    \t\t\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td valign=\"top\" align=\"left\">\r\n");
      out.write("\t\t\t\t");

				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_CONFIGURATION") || 
					pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_REPORTS"))
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t<select id=\"activity_type\" name=\"activity_type\" onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t\t");

				}
				else //---------------
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t<select id=\"activity_type\" name=\"activity_type\" disabled=\"disabled\">\r\n");
      out.write("\t\t\t\t");

				}//if
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<option value=\"\">");
      out.print(pageData.getWord("Select"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					for(int i=0; i < activities.size(); i++) {
						Activity curActivity = activities.elementAt(i);
						String activitySelected = curActivity.equals(vAgent.getActivity()) ? "selected" : "";
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<option value=\"");
      out.print(curActivity.getDbid());
      out.write('"');
      out.write(' ');
      out.print(activitySelected);
      out.write('>');
      out.print(curActivity.getName());
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
				
      out.write("\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"tab-page\" id=\"tabPersonal\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Personal"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPersonal\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t<legend>");
      out.print(pageData.getWord("Personal information"));
      out.write("</legend>\r\n");
      out.write("\t<table border=\"0\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td valign=\"top\" align=\"left\">");
      out.print(pageData.getWord("Birth date"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td valign=\"top\" align=\"left\"><input type=\"text\" name=\"birthDate\" size=\"27\" onClick=\"enableUpdateButton(true)\" onFocus=\"showCalendar('',this,this,'','birthdate',0,30,1);this.blur()\" id=\"birthdate\" \r\n");
      out.write("\t\t\tvalue=\"");
      out.print(vAgent.getBirthDate());
      out.write("\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td valign=\"top\" align=\"left\" >\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Address"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td valign=\"top\" align=\"left\">\r\n");
      out.write("\t\t\t\t<textarea rows=\"3\" name=\"address\" cols=\"26\" onChange=\"enableUpdateButton(true)\">");
      out.print(vAgent.getAddress());
      out.write("</textarea>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td valign=\"top\" align=\"left\" >\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("City"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td valign=\"top\" align=\"left\" >\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"city\" size=\"27\" onChange=\"enableUpdateButton(true)\"\r\n");
      out.write("\t\t\t\tvalue=\"");
      out.print(vAgent.getCity());
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Salary"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td  valign=\"top\" align=\"left\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"salary\" size=\"20\" onChange=\"enableUpdateButton(true)\"\r\n");
      out.write("\t\t\t\tvalue=\"");
      out.print(vAgent.getSalary());
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"tab-page\" id=\"tabSite\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Site"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabSite\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t<legend>");
      out.print(pageData.getWord("Site details"));
      out.write("</legend>\r\n");
      out.write("\t<table border=\"0\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Site"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td  valign=\"top\" align=\"left\">\r\n");
      out.write("\t\t\t\t<select size=\"1\" name=\"SiteSelection\" onChange=\"enableUpdateButton();addDefaultPreferredSite()\">\r\n");
      out.write("\t\t\t\t\t<option value=\"\"></option>\r\n");
      out.write("\t\t\t\t");

					for(int i = 0; i < allSites.size(); i++)
					{
						Site curSite = allSites.elementAt(i);
						String siteSelected = curSite.equals(vAgent.getSite()) ? "selected" : "";
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<option value=\"");
      out.print(curSite.getDbid());
      out.write('"');
      out.write(' ');
      out.print(siteSelected);
      out.write('>');
      out.print(curSite.getName());
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

					}
				
      out.write("\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t<table border=\"0\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\">");
      out.print(pageData.getWord("Preferred sites"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"../img/arrowUp.gif\" width=\"16\" height=\"16\" class=\"img1\" alt=\"+\" onClick=\"bringUpSite()\">&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"../img/arrow_down.gif\" width=\"16\" height=\"16\" class=\"img1\" alt=\"-\" onClick=\"bringDownSite()\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("                <td height=\"94\" align=\"center\"> \r\n");
      out.write("                  <select name=\"availableSites\" multiple=\"multiple\" onChange=\"enableUpdateButton()\" style=\"width:150px\" size=\"5\" >\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");

							
							for(int i = 0; i < allSites.size(); i++)
							{
								Site curSite = allSites.elementAt(i);
								if(!vAgent.getPreferredSites().contains(curSite))
								{
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"");
      out.print(curSite.getDbid());
      out.write('"');
      out.write('>');
      out.print(curSite.getName());
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t");

								}
							}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"../img/left_to_right.gif\" alt=\">>\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('availableSites', 'affectedSites')\" /><br><br>\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"../img/right_to_left.gif\" alt=\"<<\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('affectedSites', 'availableSites')\"/>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<select name=\"affectedSites\" multiple=\"multiple\" onChange=\"enableUpdateButton()\" style=\"width:150px\" size=\"5\" >\r\n");
      out.write("\t\t\t\t\t\t\t");

								for(int i=0; i < vAgent.getPreferredSites().size(); i++)
								{
									Site curSite = vAgent.getPreferredSites().elementAt(i);
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"");
      out.print(curSite.getDbid());
      out.write('"');
      out.write('>');
      out.print(curSite.getName());
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t");

								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr valign=\"top\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
      out.print(pageData.getWord("Most preferred"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr><td align=\"center\">&nbsp;</td></tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr><td align=\"center\">&nbsp;</td></tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr valign=\"bottom\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td valign=\"bottom\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
      out.print(pageData.getWord("Less preferred"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");

if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT") && !newAgent) {

      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabSkills\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Skill"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage(document.getElementById(\"tabSkills\"));</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t<legend>");
      out.print(pageData.getWord("Set agent skills"));
      out.write(" </legend>\r\n");
      out.write("\t<table border=\"0\" onClick=\"enableUpdateButton()\">\r\n");
      out.write("\t");

	if(allAgentSkills.size() > 0) {
		for(int i = 0; i < allAgentSkills.size(); i++) {
			AgentSkill curAgentSkill = allAgentSkills.elementAt(i);
			Skill curSkill = curAgentSkill.getSkill();
	
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\" width=\"100\">\r\n");
      out.write("\t\t\t\t");
      out.print(curSkill.getName());
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td id=\"td_agentSkillId\" skillDBID=\"");
      out.print(curSkill.getDbid());
      out.write("\" oldWeight=\"");
      out.print(curAgentSkill.getWeight());
      out.write("\" dbid=\"");
      out.print(curAgentSkill.getDbid());
      out.write("\" align=\"right\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" size=\"2\" maxlength=\"3\" id=\"skill_value");
      out.print(curSkill.getDbid());
      out.write("\" onChange=\"s");
      out.print(curSkill.getDbid());
      out.write(".setValue(validateSkillWeight(this));\" value=\"");
      out.print(curAgentSkill.getWeight());
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td width=\"60%\">\r\n");
      out.write("\t\t\t\t<div class=\"slider\" id=\"slider-");
      out.print(curSkill.getDbid());
      out.write("\" style=\"margin: 2px; width:auto;\">\r\n");
      out.write("\t\t\t\t\t<input class=\"slider-input\" id=\"slider-input-");
      out.print(curSkill.getDbid());
      out.write("\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");

		}
	} else { 
	
      out.write("\r\n");
      out.write("\t\t<tr><td>");
      out.print(pageData.getWord("There is no skill available"));
      out.write("</td></tr>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");

}

      out.write("\r\n");
      out.write("<input disabled name=\"updateInfo\" type=\"button\" value=\"");
      out.print(pageData.getWord("Save"));
      out.write("\" onClick=\"validateInfo()\" id=\"save\">\r\n");
      out.write("<input name=\"deleteAgt\" type=\"button\" value=\"");
      out.print(pageData.getWord("Delete"));
      out.write("\" onClick=\"askDelete()\" ");
      out.print(newAgent ? "disabled" : "");
      out.write(">\r\n");
      out.write("<input name=\"employeeId\" type=\"hidden\" value=\"");
      out.print(vAgent.getEmployeeId());
      out.write("\">\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");

if(!newAgent && allAgentSkills.size() > 0) {

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("/* Script to create the skill sliders */\r\n");

for(int i = 0; i < allAgentSkills.size(); i++) {
	AgentSkill curAgentSkill = allAgentSkills.elementAt(i);
	Skill curSkill = curAgentSkill.getSkill();

      out.write("\r\n");
      out.write("\ts");
      out.print(curSkill.getDbid());
      out.write(" = new Slider(document.getElementById('slider-");
      out.print(curSkill.getDbid());
      out.write("'), document.getElementById('slider-input-");
      out.print(curSkill.getDbid());
      out.write("'));\r\n");
      out.write("\ts");
      out.print(curSkill.getDbid());
      out.write(".onchange = function() {\r\n");
      out.write("\t\tdocument.getElementById('skill_value");
      out.print(curSkill.getDbid());
      out.write("').value = s");
      out.print(curSkill.getDbid());
      out.write(".getValue();\r\n");
      out.write("\t\tcolor = getColor(s");
      out.print(curSkill.getDbid());
      out.write(".getValue());\r\n");
      out.write("\t\tdocument.getElementById('skill_value");
      out.print(curSkill.getDbid());
      out.write("').style.backgroundColor = color;\r\n");
      out.write("\t};\r\n");
      out.write("\ts");
      out.print(curSkill.getDbid());
      out.write(".setValue(");
      out.print(curAgentSkill.getWeight());
      out.write(");\r\n");
      out.write("\ts");
      out.print(curSkill.getDbid());
      out.write(".setMinimum(0);\r\n");
      out.write("\ts");
      out.print(curSkill.getDbid());
      out.write(".setMaximum(100);\r\n");
      out.write("\tcolor = getColor(s");
      out.print(curSkill.getDbid());
      out.write(".getValue());\r\n");
      out.write("\tdocument.getElementById('skill_value");
      out.print(curSkill.getDbid());
      out.write("').style.backgroundColor = color;\r\n");
      out.write("\ts");
      out.print(curSkill.getDbid());
      out.write(".recalculate();\r\n");

}

      out.write("\r\n");
      out.write("</script>\r\n");

}
pageData.closeConnection();

      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
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
