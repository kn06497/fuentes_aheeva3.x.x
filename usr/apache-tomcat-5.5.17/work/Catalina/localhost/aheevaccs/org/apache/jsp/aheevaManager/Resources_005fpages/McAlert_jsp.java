package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import aheevaManager.ressources.*;
import java.util.HashMap;
import java.util.Iterator;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public final class McAlert_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	if (session.getAttribute("USER_LANGUAGE") != null)
		pageData.setDefaultLanguage((String) session
		.getAttribute("USER_LANGUAGE"));

	String currentUserDbid = (String) session
			.getAttribute("CURRENT_USER_DBID");
	int tenant_dbid = -1;
	try {
		tenant_dbid = Integer.parseInt(request
		.getParameter("tenant_dbid"));
	} catch (NumberFormatException e) {
		//do nothing
	}

	pageData.openConnection();

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=JavaScript src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=javascript src=\"Browser.js\" type=text/javascript></script>\r\n");
      out.write("<script language=javascript src=\"AnchorPosition.js\" type=text/javascript></script>\r\n");
      out.write("<script language=javascript src=\"ColorPicker2.js\" type=text/javascript></script>\r\n");
      out.write("<script language=javascript src=\"PopupWindow.js\" type=text/javascript></script>\r\n");
      out.write("<script language=javascript src=\"alert_xparse.js\" type=text/javascript></script>\r\n");
      out.write("<script language=javascript src=\"alert_xReader.js\" type=text/javascript></script>\r\n");
      out.write("<script language=javascript src=\"alert_xWriter.js\" type=text/javascript></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"alert_tabpane.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<title>addAlert</title>\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" >\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("/*\tbackground:\tThreeDFace; */\r\n");
      out.write("\r\n");
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
      out.write("\r\n");
      out.write("table.msg{\r\n");
      out.write("\tbackground-color: #80FF80;\r\n");
      out.write("\tborder-color: black;\r\n");
      out.write("\tborder-width: 1px;\r\n");
      out.write("\tborder-style: dashed;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" >\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("var client_id='';\r\n");
      out.write("var tabIndex;\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");

	ResultSet rs;
	String m_name = "";
	boolean m_state= false;
	int m_agentGroup = -1;
	String m_conditions= "";
	String m_message= "";
	String m_color = "#000000";
	int m_time= -1;
	String m_queue = "";

	String sqlQuery = "";
	int dbid = -1;
	String errorMsg = "";
	boolean error = false;
	boolean sendSoftphone = false;
	boolean sendManager = false;
	boolean gotQueue = false;
	boolean needGroup = false; //for manager

	int j = 0;

	if(request.getParameter("dbid") != null){
		try{
			dbid = Integer.parseInt(request.getParameter("dbid"));
		}catch(NumberFormatException e){
			dbid = -1;
		}
	}

	if(dbid != -1 && request.getParameter("delete") != null && request.getParameter("delete").compareTo("1") == 0){
		PreparedStatement ps = pageData.buildPreparedStatement("SELECT manager, softphone FROM cfg_mc_alert WHERE DBID=?");
		ps.setInt(1, dbid);
		rs = ps.executeQuery();
		if(rs.next()){
			boolean manager = rs.getBoolean(1);
			boolean softphone = rs.getBoolean(2);
			pageData.executeModification("DELETE FROM cfg_mc_alert WHERE DBID=" + dbid);
			if(manager){
				
      out.write("\r\n");
      out.write("\t\t\t\t<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\t\t\t\tappletObj.sendInfo(\"196,");
      out.print( dbid );
      out.write("\");\r\n");
      out.write("\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t");
	
			}else if(softphone){
				
      out.write("\r\n");
      out.write("\t\t\t\t<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\t\t\t\tappletObj.sendInfo(\"195,");
      out.print( dbid );
      out.write("\");\r\n");
      out.write("\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t");

			}
		}
		
      out.write("\r\n");
      out.write("\t\t<script>\r\n");
      out.write("\t\tappletObj.fReloadMenu = true;\r\n");
      out.write("\t\t// refresh the current page\r\n");
      out.write("\t\tdocument.location = \"../defaultpage.htm\";\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t</html>\r\n");
      out.write("\t\t");

		return;
	}
if(request.getParameter("alertNameStarPhone") != null){
	m_name = request.getParameter("alertNameStarPhone").trim();
	if (request.getParameter("alertStateStarPhone") != null)m_state = true;
	m_conditions = request.getParameter("alertConditionsStarPhone").trim();
	m_message = request.getParameter("alertMessageStarPhone").trim();
	m_color = request.getParameter("statisticColor2");
	if(request.getParameter("sendTo") != null){
		if(request.getParameter("sendTo").compareTo("Softphone") == 0) sendSoftphone = true;
		else if(request.getParameter("sendTo").compareTo("Manager") == 0)sendManager = true;
	}
	try{
		m_agentGroup = Integer.parseInt(request.getParameter("assigneGroups"));
	}catch(NumberFormatException e){
		m_agentGroup = -1;
	}
	
	try{
		m_time = Integer.parseInt(request.getParameter("alertTimeStarPhone"));
	}catch(NumberFormatException e){
		m_time = -1;
	}
	
	
	//verifier si ce nom n'existe pas dans la base de donnee
			
	if (!pageData.nameAvailable(m_name, dbid, "cfg_mc_alert")) {
		error = true;
		errorMsg += "-" + pageData.getWord("This name already exists") + "\\n";
	} else if (m_name.length() == 0) {
		error = true;
		errorMsg += "-" + pageData.getWord("You must enter a name") + "\\n";
	}
	
	if(!sendSoftphone && ! sendManager){
		error = true;
		errorMsg += "-" +pageData.getWord("You must select a destination") + "\\n";
	}

	
	if(!pageData.isValidExpression(m_conditions)){
		error = true;
		errorMsg += "-" + pageData.getValidationErrorMsg() + "\\n";
	}
	
//	{
		ArrayList<String> varAL = pageData.getExpressionVariables(m_conditions);
		ArrayList<String> validVariables = new ArrayList<String>();
		
		validVariables.add("WA");
		validVariables.add("WC");
		validVariables.add("AWT");
		validVariables.add("LWC");
		if(sendManager){
			validVariables.add("AHTG");
			validVariables.add("PRG");
			validVariables.add("WA");
			validVariables.add("AWU");
		}else{
			validVariables.add("AHTA");
			validVariables.add("PRA");
		}
		
		if(!pageData.areValidVariables(varAL, validVariables)){
			error = true;
			errorMsg += "-" +pageData.getWord("Unknown expression variable") + " (" + pageData.getValidationErrorMsg() + ")\\n";
		}
		
		varAL = pageData.getExpressionVariables(m_message);
		if(!pageData.areValidVariables(varAL, validVariables)){
			error = true;
			errorMsg += "-" + pageData.getWord("Unknown message variable") + " (" + pageData.getValidationErrorMsg() + ")\\n";
		}
//	}
	
	if(m_message.length() == 0){
		error = true;
		errorMsg += "-" + pageData.getWord("You must enter a message") + "\\n";
	}else if(m_message.length() > 256){
		error = true;
		errorMsg += "-" + pageData.getWord("The message must not exceed 256 characters") + "(" + pageData.getWord("variables included")+" )\\n";
	}
	
	
	//check group selection
	if(m_agentGroup == -1 && (sendSoftphone || needGroup)){
		error = true;
		errorMsg += "-" + pageData.getWord("You must select an agent group") + "\\n";
	}
	
	//check if a queue is required
	if(m_conditions.indexOf("$WC") != -1 || m_conditions.indexOf("$AWT") != -1 || m_conditions.indexOf("$LWC") != -1
			|| m_message.indexOf("$WC") != -1 || m_message.indexOf("$AWT") != -1 || m_message.indexOf("$LWC") != -1){
		m_queue = request.getParameter("queue");
		gotQueue = true;
		if(m_queue.length() == 0){
			error = true;
			errorMsg += "-" + pageData.getWord("You must select a queue") +" \\n";
		}
	}
	
	if(m_time < 1){
		error = true;
		errorMsg += "-" + pageData.getWord("You must specify a broadcast time period") + "\\n";
	}
	
	if(error){
		
      out.write("\r\n");
      out.write("\t\t<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\t\talert('");
      out.print( errorMsg );
      out.write("');\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t");

		}else{
			PreparedStatement ps;
			boolean update = false;
			if(dbid == -1){
				ps = pageData.buildPreparedStatement("INSERT INTO cfg_mc_alert ("
					+ "`TENANT_DBID`, `NAME`, `STATE`, `GRP_DBID`, `CONDITIONS`, "
					+ "`MESSAGE`, `COLOR`, `BCAST_PERIOD`, `MANAGER`, `SOFTPHONE`, `QUEUE_NAME`) VALUES ("
					+ "?, ?, ?, ?, ?, "
					+ "?, ?, ?, ?, ?, ?)");
			}else{
				update = true;
				ps = pageData.buildPreparedStatement("UPDATE cfg_mc_alert SET "
					+ "`TENANT_DBID`=?, `NAME`=?, `STATE`=?, `GRP_DBID`=?, `CONDITIONS`=?, "
					+ "`MESSAGE`=?, `COLOR`=?, `BCAST_PERIOD`=?, `MANAGER`=?, `SOFTPHONE`=?, `QUEUE_NAME`=? "
					+ "WHERE `DBID`=?");
			}
			ps.setInt(1, tenant_dbid);
			ps.setString(2, m_name);
			ps.setBoolean(3, m_state);
			ps.setInt(4, (m_agentGroup == -1 ? 0 : m_agentGroup));
			ps.setString(5, XMLTool.expressionToXML(m_conditions));
			ps.setString(6, m_message);
			ps.setString(7, m_color);
			ps.setInt(8, m_time);
			ps.setBoolean(9, sendManager);
			ps.setBoolean(10, sendSoftphone);
			ps.setString(11, m_queue);
			if(dbid != -1) ps.setInt(12, dbid);
			ps.execute();
			
			ps = pageData.buildPreparedStatement("select dbid from cfg_mc_alert where tenant_dbid=? and name=?");
			ps.setInt(1, tenant_dbid);
			ps.setString(2, m_name);
			ps.execute();
			rs = ps.getResultSet();
			
			if (rs.next() && (dbid = rs.getInt(1)) != -1) {
				
      out.write("\r\n");
      out.write("\t\t\t\t<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\t\t\t\tappletObj.fReloadMenu = true;\r\n");
      out.write("\t\t\t\tif(");
      out.print( sendManager );
      out.write(") appletObj.sendInfo(\"196,");
      out.print( dbid );
      out.write("\"); //Manager\r\n");
      out.write("\t\t\t\telse appletObj.sendInfo(\"195,");
      out.print( dbid );
      out.write("\");\t//softphone\r\n");
      out.write("\t\t\t\tdocument.location='?tenant_dbid=");
      out.print( tenant_dbid );
      out.write("&dbid=");
      out.print( dbid );
      out.write("&update=");
      out.print( update );
      out.write("';\r\n");
      out.write("\t\t\t\t</script>\r\n");

			} else {//Error
			
      out.write("\r\n");
      out.write("\t\t\t\talert(pageData.getWord(\"An unknown database error occurred while saving your entry\"));\r\n");

		}
	}
}

if(dbid == -1){
	m_state = true;
}else if(request.getParameter("alertNameStarPhone") == null){
	rs = pageData.executeFromString("SELECT `NAME`, `STATE`, `GRP_DBID`, `CONDITIONS`, `MESSAGE`, "
			+ "`COLOR`, `BCAST_PERIOD`, `MANAGER`, `SOFTPHONE`, `QUEUE_NAME` FROM cfg_mc_alert WHERE dbid=" + dbid);
	try{
		if(rs.next()){
			m_name = rs.getString(1);
			m_state = rs.getBoolean(2);
			m_agentGroup = rs.getInt(3);
			m_conditions = XMLTool.xmlToExpression(rs.getString(4));
			m_message = rs.getString(5);
			m_color = rs.getString(6);
			m_time = rs.getInt(7);
			sendManager = rs.getBoolean(8);
			sendSoftphone = rs.getBoolean(9);
			if(m_conditions.indexOf("$WC") != -1 || m_conditions.indexOf("$AWT") != -1 || m_conditions.indexOf("$LWC") != -1
					|| m_message.indexOf("$WC") != -1 || m_message.indexOf("$AWT") != -1 || m_message.indexOf("$LWC") != -1){
				m_queue = rs.getString(10);
				gotQueue = true;
			}
			
		}else{
			
      out.write("\r\n");
      out.write("\t\t\talert(pageData.getWord(\"No data was retrieved\"));\r\n");
      out.write("\t\t\t");

		}
	}catch(SQLException e){
		e.printStackTrace();
		
      out.write("\r\n");
      out.write("\t\talert(pageData.getWord(\"Unknown SQL error while loading the data\"));\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t");

	}
}
	
	//************************************************************


      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("function updateAlertConditions(client){\r\n");
      out.write("\tvar alertConditions='alertConditionsStarPhone';\r\n");
      out.write(" \tif(document.getElementById(alertConditions).value=='");
      out.print( "--" + pageData.getWord("Define message condition(s)") + "--");
      out.write("'){\r\n");
      out.write("\t\tdocument.getElementById(alertConditions).value='';\r\n");
      out.write("\t\tdocument.getElementById(alertConditions).style.fontStyle ='normal';\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("\r\n");
      out.write("function updateAlertMessage(client)\r\n");
      out.write("{\r\n");
      out.write("\tvar alertMessage='alertMessageStarPhone';\r\n");
      out.write("\tif(document.getElementById(alertMessage).value=='");
      out.print( "--" + pageData.getWord("Click to write the message") + "--");
      out.write("'){\r\n");
      out.write("\t\t\tdocument.getElementById(alertMessage).value='';\r\n");
      out.write("\t\t\tdocument.getElementById(alertMessage).style.fontStyle ='normal';\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("\r\n");
      out.write("function pickColor(color) {\r\n");
      out.write("\tdocument.getElementById('alertColorStarPhone').style.backgroundColor = color;\r\n");
      out.write("\tdocument.getElementById('statisticColor2').value = color;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("\r\n");
      out.write("function checkQueue(){\r\n");
      out.write("\tdocument.getElementById('queueSelect').disabled = !(checkQueueMsg(document.getElementById(\"alertConditionsStarPhone\").value) \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t|| checkQueueMsg(document.getElementById(\"alertMessageStarPhone\").value));\r\n");
      out.write("\tif(document.getElementById('queueSelect').disabled) document.getElementById(\"queueSelect\").selectedIndex = 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkQueueMsg(theText){\r\n");
      out.write("\tif(theText.indexOf('$WC') != -1 || theText.indexOf('$AWT') != -1 || theText.indexOf('$LWC') != -1){\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t}\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkEmpty(msgBox){\r\n");
      out.write("\tif(msgBox.value == \"\"){\r\n");
      out.write("\t\tif(msgBox.name == \"alertConditionsStarPhone\"){\r\n");
      out.write("\t\t\tmsgBox.value = '");
      out.print( "--" + pageData.getWord("Define message condition(s)") + "--" );
      out.write("';\r\n");
      out.write("\t\t}else if(msgBox.name == \"alertMessageStarPhone\"){\r\n");
      out.write("\t\t\tmsgBox.value = '");
      out.print( "--" + pageData.getWord("Click to write the message") + "--" );
      out.write("';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tmsgBox.style.fontStyle ='italic';\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("\r\n");
      out.write("function getAssignedAgentGroups(){\r\n");
      out.write("\treturn document.getElementById('assigneGroups').options.value;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("\r\n");
      out.write("function addThistoAlertMessageArea(text, client)\r\n");
      out.write("{\r\n");
      out.write("\tvar alertMessage= 'alertMessage' +client;\r\n");
      out.write("\tvar option1Message = 'option1Message' + client;\r\n");
      out.write("\tupdateAlertMessage(client);\r\n");
      out.write("\tinsertAtCursor(document.getElementById(alertMessage), text);\r\n");
      out.write("\tdocument.getElementById(option1Message).selected=true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("\r\n");
      out.write("function addThistoAlertConditionsArea(text, client)\r\n");
      out.write("{\r\n");
      out.write("\t\r\n");
      out.write("\tvar alertConditions= 'alertConditions' +client;\r\n");
      out.write("\tvar option1Condition = 'option1Condition' + client;\r\n");
      out.write("\tupdateAlertConditions(client);\r\n");
      out.write("\tinsertAtCursor(document.getElementById(alertConditions), text);\r\n");
      out.write("\tdocument.getElementById(option1Condition).selected=true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("\r\n");
      out.write("function insertAtCursor(myField, myValue) \r\n");
      out.write("{\r\n");
      out.write("\t//IE support\r\n");
      out.write("\tif (document.selection) {\r\n");
      out.write("\tmyField.focus();\r\n");
      out.write("\tsel = document.selection.createRange();\r\n");
      out.write("\tsel.text = myValue;\r\n");
      out.write("\t}\r\n");
      out.write("\t//MOZILLA/NETSCAPE support\r\n");
      out.write("\telse if (myField.selectionStart || myField.selectionStart == '0') {\r\n");
      out.write("\talert(\"nonIE\");\r\n");
      out.write("\tvar startPos = myField.selectionStart;\r\n");
      out.write("\tvar endPos = myField.selectionEnd;\r\n");
      out.write("\tmyField.value = myField.value.substring(0, startPos)\r\n");
      out.write("\t+ myValue\r\n");
      out.write("\t+ myField.value.substring(endPos, myField.value.length);\r\n");
      out.write("\t} else {\r\n");
      out.write("\tmyField.value += myValue;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkDelete(){\r\n");
      out.write("\tif(document.getElementById('delete').value == 1){\r\n");
      out.write("\t\tif(");
      out.print( dbid );
      out.write(" > -1){\r\n");
      out.write("\t\t\tvar answer = confirm(\"");
      out.print(pageData.getWord("Are you sure you wish to delete this alert?"));
      out.write("\");\r\n");
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
      out.write("function checkGroup(){\r\n");
      out.write("\tif(document.getElementById(\"sendSoftphone\").checked){\r\n");
      out.write("\t\tdocument.getElementById(\"assigneGroups\").disabled = false;\r\n");
      out.write("\t}else if(checkGroupMsg(document.getElementById(\"alertConditionsStarPhone\").value)\r\n");
      out.write("\t\t\t|| checkGroupMsg(document.getElementById(\"alertMessageStarPhone\").value)){\r\n");
      out.write("\t\tdocument.getElementById(\"assigneGroups\").disabled = false;\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tdocument.getElementById(\"assigneGroups\").disabled = true;\r\n");
      out.write("\t\tdocument.getElementById(\"assigneGroups\").selectedIndex = 0;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tif(document.getElementById(\"sendSoftphone\").checked || document.getElementById(\"sendManager\").checked){\r\n");
      out.write("\t\tdocument.getElementById(\"selMessage\").disabled = false;\r\n");
      out.write("\t\tdocument.getElementById(\"selAlert\").disabled = false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkGroupMsg(theText){\r\n");
      out.write("\tif(theText.indexOf('$AHT') != -1 || theText.indexOf('$PR') != -1 || theText.indexOf('$WA') != -1 || theText.indexOf('$AWU') != -1){\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t}\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkVariables(){\r\n");
      out.write("\t\r\n");
      out.write("\tif(document.getElementById(\"sendManager\").checked){\r\n");
      out.write("\t\tdocument.getElementById(\"selMessage\").options[1] = new Option(\"");
      out.print(pageData.getWord("Average handling time"));
      out.write("\",\"$AHTG\");\r\n");
      out.write("\t\tdocument.getElementById(\"selAlert\").options[1] = new Option(\"");
      out.print(pageData.getWord("Average handling time"));
      out.write("\",\"$AHTG\");\r\n");
      out.write("\t\tdocument.getElementById(\"selMessage\").options[2] = new Option(\"");
      out.print(pageData.getWord("Productivity ratio"));
      out.write("\",\"$PRG\");\r\n");
      out.write("\t\tdocument.getElementById(\"selAlert\").options[2] = new Option(\"");
      out.print(pageData.getWord("Productivity ratio"));
      out.write("\",\"$PRG\");\t\r\n");
      out.write("\t\tdocument.getElementById(\"selMessage\").options[6] = new Option(\"");
      out.print(pageData.getWord("Waiting agents"));
      out.write("\",\"$WA\");\r\n");
      out.write("\t\tdocument.getElementById(\"selAlert\").options[6] = new Option(\"");
      out.print(pageData.getWord("Waiting agents"));
      out.write("\",\"$WA\");\r\n");
      out.write("\t\tdocument.getElementById(\"selMessage\").options[7] = new Option(\"");
      out.print(pageData.getWord("Agents in wrap up"));
      out.write("\",\"$AWU\");\t\t\r\n");
      out.write("\t\tdocument.getElementById(\"selAlert\").options[7] = new Option(\"");
      out.print(pageData.getWord("Agents in wrap up"));
      out.write("\",\"$AWU\");\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tdocument.getElementById(\"selMessage\").options[1] = new Option(\"");
      out.print(pageData.getWord("Average handling time"));
      out.write("\",\"$AHTA\");\r\n");
      out.write("\t\tdocument.getElementById(\"selAlert\").options[1] = new Option(\"");
      out.print(pageData.getWord("Average handling time"));
      out.write("\",\"$AHTA\");\r\n");
      out.write("\t\tdocument.getElementById(\"selMessage\").options[2] = new Option(\"");
      out.print(pageData.getWord("Productivity ratio"));
      out.write("\",\"$PRA\");\r\n");
      out.write("\t\tdocument.getElementById(\"selAlert\").options[2] = new Option(\"");
      out.print(pageData.getWord("Productivity ratio"));
      out.write("\",\"$PRA\");\r\n");
      out.write("\t\tdocument.getElementById(\"selMessage\").length = 6;\r\n");
      out.write("\t\tdocument.getElementById(\"selAlert\").length = 6;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/***********************************************************************\r\n");
      out.write("************************************************************************/\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"alert_body\" onload=\"checkGroup(); pickColor('");
      out.print( m_color );
      out.write("'); checkVariables();\" >\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\tvar cp = new ColorPicker('window');\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"tab-page\" id=\"pageStarPhone\">\r\n");
      out.write("<h2 class=\"tab\" >");
      out.print( pageData.getWord("Add alert"));
      out.write("</h2>\r\n");
      out.write("<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"pageStarPhone\" ) );</script>\r\n");
      out.write("\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t");

		if (request.getParameter("update") != null && !error) {
		
      out.write("\r\n");
      out.write("\t<table class=\"msg\">\r\n");
      out.write("\t<tr><td>\r\n");
      out.write("\t");

			if (request.getParameter("update").compareTo("true") == 0) {
				out.write( pageData.getWord("Update succeeded"));
			} else {
				out.write(pageData.getWord("Creation succeeded"));
			}
	
      out.write("</td></tr></table>\r\n");
      out.write("\t<br/>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print(pageData.getWord("Add alert for softPhone"));
      out.write("</legend>\r\n");
      out.write("\t\t\t<form method=\"post\" onsubmit=\"return checkDelete();\">\r\n");
      out.write("\t\t\t<table>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( pageData.getWord("Alert name"));
      out.write(" &nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input id=\"alertNameStarPhone\"  type=\"text\" name=\"alertNameStarPhone\" value=\"");
      out.print( pageData.protectHTMLString(m_name) );
      out.write("\">\r\n");
      out.write("\t\t\t\t\t</td> \r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td rowspan=\"2\" valign=\"top\">Sent to</td><td><input type=\"radio\" id='sendManager' name='sendTo' value=\"Manager\" checked=\"checked\"  ");
 if(sendManager) out.print("checked='checked'");
      out.write(" onClick=\"checkGroup(); checkVariables();\"/>Manager</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"radio\" id='sendSoftphone' name='sendTo' value=\"Softphone\" ");
 if(sendSoftphone) out.print("checked='checked'");
      out.write(" onClick=\"checkGroup(); checkVariables();\"/>Softphone</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"4\">&nbsp; </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(pageData.getWord("Message condition"));
      out.write(" &nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td> \r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" value=\"()\" onClick=\"addThistoAlertConditionsArea('()','StarPhone')\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" value=\"AND\" onClick=\"addThistoAlertConditionsArea(' AND ','StarPhone') \">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" value=\"OR\" onClick=\"addThistoAlertConditionsArea(' OR ','StarPhone') \">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<select id=\"selAlert\" name=\"selectStatisticConditionStarPhone\" onChange=\" if(this.value!='') addThistoAlertConditionsArea(this.options[this.selectedIndex].value,'StarPhone' )\"\r\n");
      out.write("\t\t\t\t\t\t\t\tdisabled=\"disabled\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option  id=\"option1ConditionStarPhone\" value=\"\" style=\"font-style:italic\" >--");
      out.print( pageData.getWord("Select a statistic"));
      out.write("--</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$AHT\">");
      out.print( pageData.getWord("Average handling time"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$PR\">");
      out.print( pageData.getWord("Productivity ratio"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$WC\">");
      out.print( pageData.getWord("Waiting calls"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$AWT\">");
      out.print( pageData.getWord("Average waiting time"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$LWC\">");
      out.print( pageData.getWord("Longest waiting call"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$WA\" style=\"display:none\">");
      out.print( pageData.getWord("Waiting agents"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$AWU\">");
      out.print( pageData.getWord("Agents in wrap up"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td id=\"alertOperandsStarPhone\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" value='&lt' onClick=\"addThistoAlertConditionsArea('&lt;','StarPhone') \">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" value=\"=\" onClick=\"addThistoAlertConditionsArea('=','StarPhone')\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" value=\"&gt\" onClick=\"addThistoAlertConditionsArea('&gt;','StarPhone') \">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"1\">&nbsp; </td>\r\n");
      out.write("\t\t\t\t\t\t<td  colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t<textarea name=\"alertConditionsStarPhone\"  onFocus=\"updateAlertConditions('StarPhone'); checkQueue(); checkGroup();\" onBlur=\"checkQueue(); checkEmpty(this); checkGroup();\"  rows=\"3\" style=\" width:98%; font-style:italic\" >");
      out.print(m_conditions.length() == 0 ? "--"
					+ pageData.getWord("Define message condition(s)") + "--" : pageData.protectHTMLString(m_conditions));
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"4\">&nbsp; </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageData.getWord("Message to send"));
      out.write("&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t<select id=\"selMessage\" name=\"selectStatisticMessageStarPhone\" onChange=\"if(this.value!='') addThistoAlertMessageArea(this.options[this.selectedIndex].value,'StarPhone') \"\r\n");
      out.write("\t\t\t\t\t\t\t\tdisabled=\"disabled\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option id=\"option1MessageStarPhone\" value=\"\" style=\" font-style:italic \">    --");
      out.print( pageData.getWord("Select a statistic"));
      out.write("--</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$AHT\">");
      out.print( pageData.getWord("Average handling time"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$PR\">");
      out.print( pageData.getWord("Productivity ratio"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$WC\">");
      out.print( pageData.getWord("Waiting calls"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$AWT\">");
      out.print( pageData.getWord("Average waiting time"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$LWC\">");
      out.print( pageData.getWord("Longest waiting call"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$WA\">");
      out.print( pageData.getWord("Waiting agents"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"$AWU\">");
      out.print( pageData.getWord("Agents in wrap up"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"1\">&nbsp; </td>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t<textarea name=\"alertMessageStarPhone\"  onFocus=\"updateAlertMessage('StarPhone'); checkQueue(); checkGroup();\" onBlur=\"checkQueue(); checkEmpty(this); checkGroup();\" rows=\"3\" style=\" width:98%; font-style:italic\" >");
      out.print(m_message.length() == 0 ? "--"
					+ pageData.getWord("Click to write the message") + "--"	: pageData.protectHTMLString(m_message));
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\" align=\"center\">&nbsp; </td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print( pageData.getWord("(256 characters maximum)"));
      out.write("&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"4\">&nbsp; </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( pageData.getWord("Group"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td><td>\r\n");
      out.write("\t\t\t\t\t\t\t<select id=\"assigneGroups\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px\" name=\"assigneGroups\" ");
      out.print( sendSoftphone ? "" : "disabled='disabled'"  );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t\t<OPTION value=''></OPTION>\r\n");
      out.write("\t\t\t\t\t\t\t");

										rs = pageData
										.executeFromString("select name, dbid from cfg_agent_group where tenant_dbid='"
										+ tenant_dbid + "' and state='1' order by name");
								try {
									while (rs.next()) {
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"");
      out.print(rs.getInt("dbid"));
      out.write('"');
      out.write(' ');
 if(m_agentGroup == rs.getInt("dbid")) out.print("selected='selected'"); 
      out.write('>');
      out.print(rs.getString("name"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t");

								}
								} catch (SQLException e) {
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\t\t\t\talert(\"");
      out.print( pageData.getWord("Unknown error while retrieving the groups"));
      out.write("\");\r\n");
      out.write("\t\t\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\t\t");

							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t\t\t\t<td vAlign=top>");
      out.print( pageData.getWord("Queue"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<SELECT name='queue' id='queueSelect' ");
if(!gotQueue) out.write("disabled='disabled'"); 
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"\"></option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");
      out.print(pageData.getQueuesHTMLSelectBox(m_queue));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</SELECT>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t\t\t\t<td> \r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageData.getWord("Broadcast period (min)"));
      out.write("&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t<SELECT id=\"alertTimeStarPhone\" name=\"alertTimeStarPhone\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option></option> \r\n");
      out.write("\t\t\t\t\t\t\t\t<OPTION value=1 ");
 if(m_time == 1) out.print("selected='selected'"); 
      out.write(">1</OPTION> \r\n");
      out.write("\t\t\t\t\t\t\t\t<OPTION value=5 ");
 if(m_time == 5) out.print("selected='selected'"); 
      out.write(">5</OPTION> \r\n");
      out.write("\t\t\t\t\t\t\t\t<OPTION value=10 ");
 if(m_time == 10) out.print("selected='selected'"); 
      out.write(">10</OPTION> \r\n");
      out.write("\t\t\t\t\t\t\t\t<OPTION value=15 ");
 if(m_time == 15) out.print("selected='selected'"); 
      out.write(">15</OPTION>\r\n");
      out.write("\t\t\t\t\t\t\t\t<OPTION value=20 ");
 if(m_time == 20) out.print("selected='selected'"); 
      out.write(">20</OPTION> \r\n");
      out.write("\t\t\t\t\t\t\t\t<OPTION value=25 ");
 if(m_time == 25) out.print("selected='selected'"); 
      out.write(">25</OPTION>  \r\n");
      out.write("\t\t\t\t\t\t\t\t<OPTION value=30 ");
 if(m_time == 30) out.print("selected='selected'"); 
      out.write(">30</OPTION> \r\n");
      out.write("\t\t\t\t\t\t\t</SELECT> \r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageData.getWord("Message color"));
      out.write("&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"alertColorStarPhone\" type=\"text\" readonly=\"\" size=5\r\n");
      out.write("\t\t\t\t\t\t\t\tonClick=\"cp.show('pick');return false ; \" name=\"statisticColor\"\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"\" style=\"cursor: pointer\" /> <A HREF=\"#\"\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"color: #000000\"\r\n");
      out.write("\t\t\t\t\t\t\t\tonClick=\"cp.show('pick');\"\r\n");
      out.write("\t\t\t\t\t\t\t\tNAME=\"pick\" ID=\"pick\"></A> \r\n");
      out.write("\t\t\t\t\t\t\t\t<input type='hidden' name=\"statisticColor2\" value=\"");
      out.print( m_color );
      out.write("\" />\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageData.getWord("Active"));
      out.write(" &nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"alertStateStarPhone\"  align=\"center\" type=\"checkbox\" name=\"alertStateStarPhone\" ");
 if(m_state) out.print("checked='checked'"); 
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t</td> \r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\">&nbsp; </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"1\">\r\n");
      out.write("\t\t\t\t\t\t<input type='hidden' name='delete' id='delete' value='0'/>\r\n");
      out.write("\t\t\t\t\t\t");

						if (dbid == -1) {
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<input type='submit' id='updateInfoStarPhone' style='HEIGHT:25px' value='");
      out.print( pageData.getWord("Save"));
      out.write("' onClick='updateAlertMessage(\"\"); updateAlertConditions(\"\");'/>\r\n");
      out.write("\t\t\t\t\t\t");

						} else {
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<input type='submit' id='updateInfoStarPhone' style='HEIGHT:25px' value='");
      out.print( pageData.getWord("Update"));
      out.write("' onClick='updateAlertMessage(\"\"); updateAlertConditions(\"\");'/>\r\n");
      out.write("\t\t\t\t\t\t\t <input type='submit' id='deleteButton' style='HEIGHT:25px' onClick='setDelete();' value='");
      out.print( pageData.getWord("Delete"));
      out.write("'/>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"3\">&nbsp; </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</body><script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\r\n");

if(m_message.length() > 0) out.print("document.getElementById('alertMessageStarPhone').style.fontStyle ='normal';");
if(m_conditions.length() > 0) out.print("document.getElementById('alertConditionsStarPhone').style.fontStyle ='normal';");

      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</html>\r\n");

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
