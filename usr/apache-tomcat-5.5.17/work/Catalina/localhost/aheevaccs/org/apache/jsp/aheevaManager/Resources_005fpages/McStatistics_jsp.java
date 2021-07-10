package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import aheevaManager.ressources.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public final class McStatistics_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

      out.write('\r');
      out.write('\n');

	beanManagerData pageData = new beanManagerData();
	if (session.getAttribute("USER_LANGUAGE") != null)
		pageData.setDefaultLanguage((String) session.getAttribute("USER_LANGUAGE"));

	String currentUserDbid = (String) session.getAttribute("CURRENT_USER_DBID");
	int tenant_dbid = -1;
	try{
		tenant_dbid = Integer.parseInt(request.getParameter("tenant_dbid"));
	}catch(NumberFormatException e){
		e.printStackTrace();
	}


      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<script language=JavaScript src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\"\r\n");
      out.write("\tsrc=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=javascript src=\"Browser.js\" type=text/javascript></script>\r\n");
      out.write("<script language=javascript src=\"AnchorPosition.js\" type=text/javascript></script>\r\n");
      out.write("<script language=javascript src=\"ColorPicker2.js\" type=text/javascript></script>\r\n");
      out.write("<script language=javascript src=\"PopupWindow.js\" type=text/javascript></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\"\r\n");
      out.write("\tsrc=\"alert_tabpane.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<title>addStatistics</title>\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\"\r\n");
      out.write("\thref=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\"\r\n");
      out.write("\thref=\"style_2.css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page\r\n");
      out.write("\t{\r\n");
      out.write("\theight: 100px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html,body { /*\tbackground:\tThreeDFace; */\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("form {\r\n");
      out.write("\tmargin: 0;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write("body {\r\n");
      out.write("\tmargin: 10px;\r\n");
      out.write("\twidth: auto;\r\n");
      out.write("\theight: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control h2 {\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\twidth: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control h2 a {\r\n");
      out.write("\tdisplay: inline;\r\n");
      out.write("\twidth: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control a:hover {\r\n");
      out.write("\tbackground: transparent;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("table.msg{\r\n");
      out.write("\tbackground-color: #80FF80;\r\n");
      out.write("\tborder-color: black;\r\n");
      out.write("\tborder-width: 1px;\r\n");
      out.write("\tborder-style: dashed;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	pageData.openConnection();
	ResultSet rs;
	String m_name = "";
	boolean m_state = false;
	String m_color = "#000000";
	String m_time = "";
	int m_agentGroups = -1;
	String m_queueName = "";
	boolean m_aht_group = false;
	boolean m_aht_agent = false;
	boolean m_ncr_group = false;
	boolean m_ncr_agent = false;
	boolean m_sph_group = false;
	boolean m_sph_agent = false;
	boolean m_pro_rat_group = false;
	boolean m_pro_rat_agent = false;
	boolean m_busy_fact_group = false;
	boolean m_busy_fact_agent = false;
	boolean m_login_time_agent = false;
	boolean m_total_calls_group = false;
	boolean m_total_calls_agent = false;
	boolean m_waiting_calls_group = false;
	boolean m_abandoned_calls_group = false;

	boolean m_averageWaitingTime = false;
	boolean m_longestWaitingCall = false;
	boolean error = false;
	String errorMsg = "";

	int dbid = -1;
	String sqlQuery = new String();
	int j = 0;

	if(request.getParameter("dbid") != null){
		try{
			dbid = Integer.parseInt(request.getParameter("dbid"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
	}
	
	if(dbid != -1 && request.getParameter("delete") != null && request.getParameter("delete").compareTo("1") == 0){
		pageData.executeModification("DELETE FROM cfg_mc_starphone_statistic WHERE DBID=" + dbid);
		
      out.write("\r\n");
      out.write("\t\t<script>\r\n");
      out.write("\t\tappletObj.sendInfo(\"197,");
      out.print( dbid );
      out.write("\");\r\n");
      out.write("\t\tappletObj.fReloadMenu = true;\r\n");
      out.write("\t\t// refresh the current page\r\n");
      out.write("\t\tdocument.location = \"../defaultpage.htm\";\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t</html>\r\n");
      out.write("\t\t");

		return;
	}
	
	if (request.getParameter("statisticName") != null) {
		m_name = request.getParameter("statisticName").trim();
		try{
			m_agentGroups = Integer.parseInt(request.getParameter("assigneGroups"));
		}catch(NumberFormatException e){
			m_agentGroups = -1;
		}
		if (request.getParameter("ahtGroup") != null)m_aht_group = true;
		if (request.getParameter("ahtAgent") != null)	m_aht_agent = true;
		if (request.getParameter("netConvRateGroup") != null)m_ncr_group = true;
		if (request.getParameter("netConvRateAgent") != null)m_ncr_agent = true;
		if (request.getParameter("salesPerHourGroup") != null)m_sph_group = true;
		if (request.getParameter("salesPerHourAgent") != null)m_sph_agent = true;
		if (request.getParameter("productRatioGroup") != null)m_pro_rat_group = true;
		if (request.getParameter("productRatioAgent") != null)m_pro_rat_agent = true;
		if (request.getParameter("busyFactorGroup") != null)m_busy_fact_group = true;
		if (request.getParameter("busyFactorAgent") != null)m_busy_fact_agent = true;
		if (request.getParameter("loginTimeAgent") != null)m_login_time_agent = true;
		if (request.getParameter("totalCallsGroup") != null)m_total_calls_group = true;
		if (request.getParameter("totalCallsAgent") != null)m_total_calls_agent = true;
		if (request.getParameter("waitingCallsGroup") != null)m_waiting_calls_group = true;
		if (request.getParameter("abandonedCallsGroup") != null)m_abandoned_calls_group = true;
		if (request.getParameter("averageWaitingTime") != null)	m_averageWaitingTime = true;
		if (request.getParameter("longestWaitingCall") != null)	m_longestWaitingCall = true;
		if (request.getParameter("queue") != null)	m_queueName = request.getParameter("queue");
		m_time = request.getParameter("statisticTime");
		m_color = request.getParameter("statisticColor2");
		if (request.getParameter("statisticState") != null)m_state = true;
		//verifier si ce nom n'existe pas dans la base de donnee

		if (!pageData.nameAvailable(m_name, dbid, "cfg_mc_starphone_statistic")) {
			error = true;
			errorMsg += "-"+ pageData.getWord("This name already exists")+ "\\n";
		} else if (m_name.length() == 0) {
			error = true;
			errorMsg += "-"+ pageData.getWord("You must define a name") + "\\n";
		}

		if (m_agentGroups < 1) {
			error = true;
			errorMsg += "-"+ pageData.getWord("You must select an agent group") + "\\n";
		}

		if ((m_waiting_calls_group || m_abandoned_calls_group
		|| m_averageWaitingTime || m_longestWaitingCall)
		&& m_queueName.length() == 0) {
			error = true;
			errorMsg += "-"+ pageData.getWord("You must select a queue") + "\\n";
		}
		
		if(!(m_aht_group || m_aht_agent || m_ncr_group || m_ncr_agent || m_sph_group || m_sph_agent || m_pro_rat_group ||
			m_pro_rat_agent || m_busy_fact_group || m_busy_fact_agent || m_login_time_agent || m_total_calls_group ||
			m_total_calls_agent || m_waiting_calls_group || m_abandoned_calls_group || m_averageWaitingTime ||
			m_longestWaitingCall)){
			error = true;
			errorMsg += "-"+ pageData.getWord("You must select at least one statistic") + "\\n";
		}	

		if (!error){
			PreparedStatement ps;
			boolean update = false;
			if(dbid == -1){
				ps = pageData.buildPreparedStatement("INSERT INTO cfg_mc_starphone_statistic " +
					"(NAME,TENANT_DBID,STATE,BCAST_PERIOD,COLOR,AHT_GROUP, " + //1-6
					"AHT_AGENT, NCR_GROUP,NCR_AGENT,SPH_GROUP,SPH_AGENT,PRO_RAT_GROUP,PRO_RAT_AGENT,BUSY_FACT_GROUP, " + //7-14
					"BUSY_FACT_AGENT, LOGIN_TIME_AGENT,TOTAL_CALLS_GROUP,TOTAL_CALLS_AGENT,WAITING_CALLS, " + //15-19
					"ABANDONED_CALLS, AVERAGE_WAITING_TIME, LONGEST_WAITING_CALL, QUEUE_NAME, GRP_DBID) VALUES( " + //20-24
					" ?, ?, ?, ?, ?, ?, " + //1-6
					" ?, ?, ?, ?, ?, ?, ?, ?, " + //7-14
					" ?, ?, ?, ?, ?, " + //15-19
					" ?, ?, ?, ?, ? )"); //20-24
			}else{
				update = true;
				ps = pageData.buildPreparedStatement("UPDATE cfg_mc_starphone_statistic SET " +
					"NAME=?, TENANT_DBID=?,STATE=?,BCAST_PERIOD=?,COLOR=?,AHT_GROUP=?, " + //1-6
					"AHT_AGENT=?, NCR_GROUP=?,NCR_AGENT=?,SPH_GROUP=?,SPH_AGENT=?,PRO_RAT_GROUP=?,PRO_RAT_AGENT=?, " + //7-13
					"BUSY_FACT_GROUP=?, BUSY_FACT_AGENT=?, LOGIN_TIME_AGENT=?,TOTAL_CALLS_GROUP=?,TOTAL_CALLS_AGENT=?, " + //14-18
					"WAITING_CALLS=?, ABANDONED_CALLS=?, AVERAGE_WAITING_TIME=?, LONGEST_WAITING_CALL=?, " + //19-22
					"QUEUE_NAME=?, GRP_DBID=? " + //23-24
					"WHERE DBID=?");//25
			}
			ps.setString(1, m_name);
			ps.setInt(2, tenant_dbid);
			ps.setBoolean(3, m_state);
			ps.setString(4, m_time);
			ps.setString(5, m_color);
			ps.setBoolean(6, m_aht_group);
			ps.setBoolean(7, m_aht_agent);
			ps.setBoolean(8, m_ncr_group);
			ps.setBoolean(9, m_ncr_agent);
			ps.setBoolean(10, m_sph_group);
			ps.setBoolean(11, m_sph_agent);
			ps.setBoolean(12, m_pro_rat_group);
			ps.setBoolean(13, m_pro_rat_agent);
			ps.setBoolean(14, m_busy_fact_group);
			ps.setBoolean(15, m_busy_fact_agent);
			ps.setBoolean(16, m_login_time_agent);
			ps.setBoolean(17, m_total_calls_group);
			ps.setBoolean(18, m_total_calls_agent);
			ps.setBoolean(19, m_waiting_calls_group);
			ps.setBoolean(20, m_abandoned_calls_group);
			ps.setBoolean(21, m_averageWaitingTime);
			ps.setBoolean(22, m_longestWaitingCall);
			ps.setString(23, m_queueName);
			ps.setInt(24, m_agentGroups);
			if(dbid > 0) ps.setInt(25, dbid);
			ps.execute();
			
			ps = pageData.buildPreparedStatement("select dbid from cfg_mc_starphone_statistic where tenant_dbid=? and name=?");
			ps.setInt(1, tenant_dbid);
			ps.setString(2, m_name);
			ps.execute();
			rs = ps.getResultSet();
			if (rs.next() && (dbid = rs.getInt(1)) != -1) {	
				
      out.write("<script type='text/javascript'>\r\n");
      out.write("\t\t\t\tappletObj.fReloadMenu = true;\r\n");
      out.write("\t\t\t\tappletObj.sendInfo(\"197,");
      out.print( dbid );
      out.write("\");\r\n");
      out.write("\t\t\t\tdocument.location='?tenant_dbid=");
      out.print( tenant_dbid );
      out.write("&dbid=");
      out.print( dbid );
      out.write("&update=");
      out.print( update );
      out.write("';\r\n");
      out.write("\t\t\t\t</script>\r\n");

			} else {
		//Error

      out.write("\r\n");
      out.write("<script type='text/javascript'>\r\n");
      out.write("\t\t\talert(\"");
      out.print( pageData.getWord("An unknown database error occurred while saving your entry"));
      out.write("\");\r\n");
      out.write("\t\t\t</script>\r\n");

			}
		} else {

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\t\talert('");
      out.print( errorMsg );
      out.write("');\r\n");
      out.write("\t\t</script>\r\n");

		}
	}
	if(dbid == -1)m_state = true;

	if (request.getParameter("dbid") != null && request.getParameter("statisticName") == null) {
		rs = pageData.executeFromString("SELECT STATE, BCAST_PERIOD, COLOR, AHT_GROUP, AHT_AGENT, NCR_GROUP, NCR_AGENT, SPH_GROUP, "
				+ "SPH_AGENT, PRO_RAT_GROUP, PRO_RAT_AGENT, BUSY_FACT_GROUP, BUSY_FACT_AGENT, LOGIN_TIME_AGENT, "
				+ "TOTAL_CALLS_GROUP, TOTAL_CALLS_AGENT, WAITING_CALLS, ABANDONED_CALLS, QUEUE_NAME, "
				+ " LONGEST_WAITING_CALL, AVERAGE_WAITING_TIME, NAME, GRP_DBID FROM cfg_mc_starphone_statistic WHERE "
				+ "DBID=" + request.getParameter("dbid"));
		try {
			if (rs.next()) {
				m_name = rs.getString("NAME");
				m_agentGroups = rs.getInt("GRP_DBID");
		
				if (rs.getBoolean("AHT_GROUP")) m_aht_group = true;
				if (rs.getBoolean("AHT_AGENT")) m_aht_agent = true;
				if (rs.getBoolean("NCR_GROUP")) m_ncr_group = true;
				if (rs.getBoolean("NCR_AGENT")) m_ncr_agent = true;
				if (rs.getBoolean("SPH_GROUP")) m_sph_group = true;
				if (rs.getBoolean("SPH_AGENT")) m_sph_agent = true;
				if (rs.getBoolean("PRO_RAT_GROUP")) m_pro_rat_group = true;
				if (rs.getBoolean("PRO_RAT_AGENT")) m_pro_rat_agent = true;
				if (rs.getBoolean("BUSY_FACT_GROUP")) m_busy_fact_group = true;
				if (rs.getBoolean("BUSY_FACT_AGENT")) m_busy_fact_agent = true;
				if (rs.getBoolean("LOGIN_TIME_AGENT")) m_login_time_agent = true;
				if (rs.getBoolean("TOTAL_CALLS_GROUP")) m_total_calls_group = true;
				if (rs.getBoolean("TOTAL_CALLS_AGENT")) m_total_calls_agent = true;
				if (rs.getBoolean("WAITING_CALLS")) m_waiting_calls_group = true;
				if (rs.getBoolean("ABANDONED_CALLS")) m_abandoned_calls_group = true;
				if (rs.getBoolean("AVERAGE_WAITING_TIME")) m_averageWaitingTime = true;
				if (rs.getBoolean("LONGEST_WAITING_CALL")) m_longestWaitingCall = true;
				m_queueName = rs.getString("QUEUE_NAME");
				m_time = rs.getString("BCAST_PERIOD");
				m_color = rs.getString("COLOR");
				if (rs.getBoolean("STATE")) m_state = true;
			}else{
				
      out.write("<script language=\"javascript\">\r\n");
      out.write("\t\t\t\talert(\"");
      out.print( pageData.getWord("No data was retrieved"));
      out.write("\");\r\n");
      out.write("\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t");

			}
		} catch (SQLException e) {
			e.printStackTrace();

      out.write("<script language=\"javascript\">\r\n");
      out.write("\t\talert(\"");
      out.print( pageData.getWord("Unknown SQL error while loading the data"));
      out.write("\");\r\n");
      out.write("\t\t</script>\r\n");

	}
	}

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("var tenant_dbid =");
out.write((String)"'"+tenant_dbid + "'");
      out.write(";\r\n");
      out.write("function pickColor(color) \r\n");
      out.write("{\r\n");
      out.write("\tdocument.getElementById('statisticColor').style.backgroundColor = color;\r\n");
      out.write("\tdocument.getElementById('statisticColor2').value = color;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/**\r\n");
      out.write(" * Enables or disables the queue select box \r\n");
      out.write(" */ \t\r\n");
      out.write("function checkQueue(){\r\n");
      out.write("\tif(document.getElementById('waitingCallsGroup').checked || \r\n");
      out.write("\t\t\tdocument.getElementById('abandonedCallsGroup').checked ||\r\n");
      out.write("\t\t\tdocument.getElementById('averageWaitingTime').checked ||\r\n");
      out.write("\t\t\tdocument.getElementById('longestWaitingCall').checked){\r\n");
      out.write("\t\tdocument.getElementById('queueSelect').disabled = false;\r\n");
      out.write("\t} else{\r\n");
      out.write("\t\tdocument.getElementById('queueSelect').disabled = true;\r\n");
      out.write("\t\tdocument.getElementById('queueSelect').selectedIndex = 0;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("\r\n");
      out.write("function getAssignedAgentGroups(){\r\n");
      out.write("\treturn document.getElementById('assigneGroups').options.value;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkDelete(){\r\n");
      out.write("\tif(document.getElementById('delete').value == 1){\r\n");
      out.write("\t\tif(");
      out.print( dbid );
      out.write(" > -1){\r\n");
      out.write("\t\t\tvar answer = confirm('");
      out.print( pageData.getWord("Are you sure you wish to delete this Statistic?"));
      out.write("');\r\n");
      out.write("\t\t\tif(!answer){\r\n");
      out.write("\t\t\t\tdocument.getElementById('delete').value = 0;\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\talert(\"DBID error on delete prompt.\");\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\treturn true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function setDelete(){\r\n");
      out.write("\tdocument.getElementById('delete').value = 1;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"stat_body\">\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\"><script type=\"text/javascript\">\r\n");
      out.write("\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\tvar cp = new ColorPicker('window');\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"tab-page\" id=\"pageStarPhone\">\r\n");
      out.write("<h2 class=\"tab\">");
      out.print( pageData.getWord("SoftPhone"));
      out.write("</h2>\r\n");
      out.write("<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"pageStarPhone\" ) );</script>\r\n");

if(request.getParameter("update") != null  && !error){
	
      out.write("\r\n");
      out.write("\t<table class=\"msg\">\r\n");
      out.write("\t<tr><td>\r\n");
      out.write("\t");

	if(request.getParameter("update").compareTo("true") == 0){
		out.write(pageData.getWord("Update succeeded"));
	}else{
		out.write(pageData.getWord("Creation succeeded"));
	}
	
      out.write("</td></tr></table>\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t");

}

      out.write("\r\n");
      out.write("<fieldset><legend>");
      out.print(pageData.getWord("Add statistic for softPhone"));
      out.write("</legend>\r\n");
      out.write("<form name=\"MCStats\" method=\"post\" onsubmit='return checkDelete();'\">\r\n");
      out.write("<table>\r\n");
      out.write("\t<tr height=\"25\">\r\n");
      out.write("\t\t<td>");
      out.print(pageData.getWord("Statistic name"));
      out.write("</td>\r\n");
      out.write("\t\t<td><input id=\"statisticName\" type=\"text\" name=\"statisticName\"\r\n");
      out.write("\t\t\tvalue=\"");
      out.print( pageData.protectHTMLString(m_name) );
      out.write("\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t&nbsp;\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<table>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"center\">");
      out.print( pageData.getWord("Group"));
      out.write("\r\n");
      out.write("\t\t\t<select id=\"assigneGroups\"\r\n");
      out.write("\t\t\t\tstyle=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px\"\r\n");
      out.write("\t\t\t\tname=\"assigneGroups\">\r\n");
      out.write("\t\t\t\t<option value='-1'></option>\r\n");
      out.write("\t\t\t\t");

					rs = pageData.executeFromString("select name, dbid from cfg_agent_group where tenant_dbid='"
													+ tenant_dbid + "' and state='1' order by name");
					try {
						while (rs.next()) {
				
      out.write("\r\n");
      out.write("\t\t\t\t<option value=\"");
      out.print(rs.getInt("dbid"));
      out.write('"');
      out.write(' ');
 if(m_agentGroups == rs.getInt("dbid")) out.print("selected='selected'"); 
      out.write('>');
      out.print(pageData.protectHTMLString(rs.getString("name")));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");

						}
					} catch (SQLException e) {
				
      out.write("\r\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\talert(\"");
      out.print( pageData.getWord("Unknown error while retrieving the groups"));
      out.write("\");\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t");

				}
				
      out.write("\r\n");
      out.write("\t\t\t</select></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"3\">&nbsp;</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<fieldset style=\"width: 450px;\">\r\n");
      out.write("\t<table>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td height=20 width=200><b>");
      out.print( pageData.getWord("Statistics"));
      out.write(":</b>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td height=20 width=100></td>\r\n");
      out.write("\t\t\t<td height=20 width=125 colspan=\"2\"><b>");
      out.print( pageData.getWord("Stats related to"));
      out.write(":</b></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr align=left>\r\n");
      out.write("\t\t\t<td colspan=\"2\" height=20><b>&nbsp </b></td>\r\n");
      out.write("\t\t\t<td height=20><b>");
      out.print( pageData.getWord("Group"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t<td height=20><b>");
      out.print( pageData.getWord("Agent"));
      out.write("</b></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr bgcolor=#b4cfff>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Average handling time"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"ahtGroup\"\r\n");
      out.write("\t\t\t\ttype=\"checkbox\" name=\"ahtGroup\"\r\n");
      out.write("\t\t\t\t");
 if(m_aht_group) out.print("checked='checked'"); 
      out.write(" /></td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"ahtAgent\" type=checkbox\r\n");
      out.write("\t\t\t\tname=\"ahtAgent\"\r\n");
      out.write("\t\t\t\t");
 if(m_aht_agent) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr bgcolor=#e6eff4>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Net conversion rate"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"netConvRateGroup\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"netConvRateGroup\"\r\n");
      out.write("\t\t\t\t");
 if(m_ncr_group) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"netConvRateAgent\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"netConvRateAgent\"\r\n");
      out.write("\t\t\t\t");
 if(m_ncr_agent) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr bgcolor=#b4cfff>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Sales per hour"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"salesPerHourGroup\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"salesPerHourGroup\"\r\n");
      out.write("\t\t\t\t");
 if(m_sph_group) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"salesPerHourAgent\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"salesPerHourAgent\"\r\n");
      out.write("\t\t\t\t");
 if(m_sph_agent) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr bgcolor=#e6eff4>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Productivity ratio"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"productRatioGroup\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"productRatioGroup\"\r\n");
      out.write("\t\t\t\t");
 if(m_pro_rat_group) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"productRatioAgent\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"productRatioAgent\"\r\n");
      out.write("\t\t\t\t");
 if(m_pro_rat_agent) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<TR bgcolor=#b4cfff>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Busy factor"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"busyFactorGroup\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"busyFactorGroup\"\r\n");
      out.write("\t\t\t\t");
 if(m_busy_fact_group) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"busyFactorAgent\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"busyFactorAgent\"\r\n");
      out.write("\t\t\t\t");
 if(m_busy_fact_agent) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<TR bgcolor=#e6eff4>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Total login time"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"loginTimeAgent\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"loginTimeAgent\"\r\n");
      out.write("\t\t\t\t");
 if(m_login_time_agent) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<TR bgcolor=#b4cfff>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Total calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"totalCallsGroup\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"totalCallsGroup\"\r\n");
      out.write("\t\t\t\t");
 if(m_total_calls_group) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"totalCallsAgent\"\r\n");
      out.write("\t\t\t\ttype=checkbox name=\"totalCallsAgent\"\r\n");
      out.write("\t\t\t\t");
 if(m_total_calls_agent) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<TR bgcolor=#e6eff4>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Waiting calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"waitingCallsGroup\"\r\n");
      out.write("\t\t\t\ttype=checkbox onclick='checkQueue();' name=\"waitingCallsGroup\"\r\n");
      out.write("\t\t\t\t");
 if(m_waiting_calls_group) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<TR bgcolor=#b4cfff>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Abandoned calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id=\"abandonedCallsGroup\"\r\n");
      out.write("\t\t\t\ttype=checkbox onclick='checkQueue();' name=\"abandonedCallsGroup\"\r\n");
      out.write("\t\t\t\t");
 if(m_abandoned_calls_group) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<TR bgcolor=#e6eff4>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Average waiting time"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id='averageWaitingTime'\r\n");
      out.write("\t\t\t\ttype=checkbox onclick='checkQueue();' name='averageWaitingTime'\r\n");
      out.write("\t\t\t\t");
 if(m_averageWaitingTime) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<TR bgcolor=#b4cfff>\r\n");
      out.write("\t\t\t<td vAlign=top colspan=\"2\">");
      out.print( pageData.getWord("Longest waiting call"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td vAlign=top align=\"center\"><input id='longestWaitingCall'\r\n");
      out.write("\t\t\t\ttype=checkbox onclick='checkQueue();' name='longestWaitingCall'\r\n");
      out.write("\t\t\t\t");
 if(m_longestWaitingCall) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"4\">&nbsp;</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("\r\n");
      out.write("\t<table>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>");
      out.print( pageData.getWord("Queue"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td><SELECT name='queue' id='queueSelect'\r\n");
      out.write("\t\t\t\t");
 if(!m_waiting_calls_group && !m_abandoned_calls_group && !m_averageWaitingTime && !m_longestWaitingCall) out.print("disabled='disabled'"); 
      out.write(">\r\n");
      out.write("\t\t\t\t<option value=''></option>\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getQueuesHTMLSelectBox(m_queueName));
      out.write("\r\n");
      out.write("\t\t\t</SELECT></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t<td>");
      out.print( pageData.getWord("Broadcast period (min)"));
      out.write("&nbsp;\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td><SELECT id=\"statisticTime\" name=\"statisticTime\">\r\n");
      out.write("\t\t\t\t<OPTION value=''></OPTION>\r\n");
      out.write("\t\t\t\t<OPTION value='1'\r\n");
      out.write("\t\t\t\t\t");
 if(m_time.compareTo("1") == 0) out.print("selected='selected'"); 
      out.write(">1</OPTION>\r\n");
      out.write("\t\t\t\t<OPTION value='5'\r\n");
      out.write("\t\t\t\t\t");
 if(m_time.compareTo("5") == 0) out.print("selected='selected'"); 
      out.write(">5</OPTION>\r\n");
      out.write("\t\t\t\t<OPTION value='10'\r\n");
      out.write("\t\t\t\t\t");
 if(m_time.compareTo("10") == 0) out.print("selected='selected'"); 
      out.write(">10</OPTION>\r\n");
      out.write("\t\t\t\t<OPTION value='15'\r\n");
      out.write("\t\t\t\t\t");
 if(m_time.compareTo("15") == 0) out.print("selected='selected'"); 
      out.write(">15</OPTION>\r\n");
      out.write("\t\t\t\t<OPTION value='20'\r\n");
      out.write("\t\t\t\t\t");
 if(m_time.compareTo("20") == 0) out.print("selected='selected'"); 
      out.write(">20</OPTION>\r\n");
      out.write("\t\t\t\t<OPTION value='25'\r\n");
      out.write("\t\t\t\t\t");
 if(m_time.compareTo("25") == 0) out.print("selected='selected'"); 
      out.write(">25</OPTION>\r\n");
      out.write("\t\t\t\t<OPTION value='30'\r\n");
      out.write("\t\t\t\t\t");
 if(m_time.compareTo("30") == 0) out.print("selected='selected'"); 
      out.write(">30</OPTION>\r\n");
      out.write("\t\t\t</SELECT></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t<td>");
      out.print( pageData.getWord("Message color"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td><input id=\"statisticColor\" type=\"text\" readonly=\"\" size=5\r\n");
      out.write("\t\t\t\tonClick=\"cp.show('pick');return false ; \" name=\"statisticColor\"\r\n");
      out.write("\t\t\t\tstyle=\"\" style=\"cursor: pointer\" /> <A HREF=\"#\"\r\n");
      out.write("\t\t\t\tstyle=\"color: #000000\"\r\n");
      out.write("\t\t\t\tonClick=\"cp.show('pick');return false ; \"\r\n");
      out.write("\t\t\t\tNAME=\"pick\" ID=\"pick\"></A> <input type='hidden'\r\n");
      out.write("\t\t\t\tname=\"statisticColor2\" value=\"");
      out.print( m_color );
      out.write("\" /></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t<td>");
      out.print( pageData.getWord("Active"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td><input id=\"statisticState\" type='checkbox' name=\"statisticState\" ");
 if(m_state) out.print("checked='checked'"); 
      out.write("></td>\r\n");
      out.write("\t\t\t<input type='hidden' name='delete' id='delete' value='0'/>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t");
 if(dbid == -1){ 
      out.write(" <input type='submit' id='saveButton' style='HEIGHT:25px' value='");
      out.print( pageData.getWord("Save"));
      out.write("'/>\r\n");
      out.write("\t\t\t");
 }else{ 
      out.write("\r\n");
      out.write("\t\t\t\t<input type='submit' id='updateButton' style='HEIGHT:25px' value='");
      out.print( pageData.getWord("Update"));
      out.write("'/>\r\n");
      out.write("\t\t\t\t<input type='submit' id='deleteButton' style='HEIGHT:25px' onClick='setDelete();' value='");
      out.print( pageData.getWord("Delete"));
      out.write("'/>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("pickColor(\"");
      out.print( m_color );
      out.write("\");\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");

pageData.closeConnection();

      out.write('\r');
      out.write('\n');
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
