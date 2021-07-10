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

public final class dispo_005foptions_005fcreator_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/Resources_pages/mopFunctions_labels.jsp");
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

/**
 * @Author FM L'Heureux
 * @Date 2007-08-06
 * @Version 0.1
 * @Description The purpose of this page is to create the numerous options that will be used in the dispo_creator. It facilitates the creation process and terms unification
 */

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
beanManagerData pageDispcData = new beanManagerData();
pageDispcData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDispcData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" >\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<meta http-equiv=\"Content-Language\" content=\"en-us\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100px;\r\n");
      out.write("}\r\n");
      out.write("html, body {\r\n");
      out.write("/*\tbackground:\tThreeDFace; */\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("\tbackground-color: #a3cccc;\r\n");
      out.write("\tbackground-image: url(../img/dispo_body.png);\r\n");
      out.write("\tbackground-repeat: repeat-x;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("body {\r\n");
      out.write("\t/* margin:\t\t10px; */\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("\t/*height:\t\tauto; */\r\n");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageMopFData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageMopFData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageMopFData.openConnection();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("var mop= new Array();\r\n");
      out.write("mop[0]=\"");
      out.print( pageMopFData.getWord("You can select only one treatment for this mop !! Please drop the selected treatment and select another one"));
      out.write("\";\r\n");
      out.write("mop[1]=\"");
      out.print( pageMopFData.getWord("Save"));
      out.write("\";\r\n");
      out.write("mop[2]=\"");
      out.print( pageMopFData.getWord("You must enter a Mop name"));
      out.write("\";\r\n");
      out.write("mop[3]=\"");
      out.print( pageMopFData.getWord("Invalid use of character"));
      out.write("\";\r\n");
      out.write("mop[4]=\"");
      out.print( pageMopFData.getWord("Are you sure, you wish to delete this method of payment? ** (Please check the agent groups which uses this MOP)"));
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageMopFData.closeConnection(); 
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"mopFunctions.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"dispo_body\">\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("</script>\r\n");

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	String query;
	String lineClassStr;
	ResultSet rs;
	int lineNum;
	int line;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tab2\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageDispcData.getWord("Category"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tab2\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageDispcData.getWord("Add a category"));
      out.write("</legend>\n");
      out.write("\t\t\t<form method=\"post\" name=\"new_category\">\r\n");
      out.write("\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispcData.getWord("Category"));
      out.write("</strong></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t");

		String category = "";
		if (request.getParameter("category") != null){//we have a category post
			category = request.getParameter("category");
			
			if(category.indexOf("'") != -1 || category.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Category contains an invalid character');</script>");
			} else if(category.length() == 0){
				out.println("<script type='text/javascript'>alert('Category cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_category VALUES('" + category + "')";
				pageData.executeModification(query);
				category = "";
			}
		}
		query = "SELECT * FROM dispo_category";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display category
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"category\" value=\"");
      out.print( category );
      out.write("\" /></td>\r\n");
      out.write("\t\t\t</tr><tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><input type='submit' value='");
      out.print( pageDispcData.getWord("Add"));
      out.write("'/></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tab3\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageDispcData.getWord("Group"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tab3\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageDispcData.getWord("Add a group"));
      out.write("</legend>\n");
      out.write("\t\t\t<form method=\"post\" name=\"new_group\">\r\n");
      out.write("\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispcData.getWord("Group"));
      out.write("</strong></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

		String group = "";
		if (request.getParameter("group") != null){//we have a group post
			group = request.getParameter("group");
			
			if(group.indexOf("'") != -1 || group.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Group contains an invalid character');</script>");
			} else if(group.length() == 0){
				out.println("<script type='text/javascript'>alert('Group cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_grp VALUES('" + group + "')";
				pageData.executeModification(query);
				group = "";
			}
		}
		query = "SELECT * FROM dispo_grp";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display group
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"group\" value=\"");
      out.print( group);
      out.write("\" /></td>\r\n");
      out.write("\t\t\t</tr><tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><input type='submit' value='");
      out.print( pageDispcData.getWord("Add"));
      out.write("'/></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tab5\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageDispcData.getWord("Call result"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tab5\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageDispcData.getWord("Add a Call Result"));
      out.write("</legend>\n");
      out.write("\t\t\t<form method=\"post\" name=\"new_group\">\r\n");
      out.write("\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispcData.getWord("Call result"));
      out.write("</strong></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

		String call_result = "";
		if (request.getParameter("call_result") != null){//we have a call_result post
			call_result = request.getParameter("call_result");
			
			if(call_result.indexOf("'") != -1 || call_result.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Call Result contains an invalid character');</script>");
			} else if(call_result.length() == 0){
				out.println("<script type='text/javascript'>alert('Call result cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_call_result VALUES('" + call_result + "')";
				pageData.executeModification(query);
				call_result = "";
			}
		}
		query = "SELECT * FROM dispo_call_result";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display call_result
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"call_result\" value=\"");
      out.print( call_result );
      out.write("\" /></td>\r\n");
      out.write("\t\t\t</tr><tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><input type='submit' value='");
      out.print( pageDispcData.getWord("Add"));
      out.write("'/></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tab6\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageDispcData.getWord("Record Status"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tab6\" ), \"javascript:showArticleTab( \\\"tab6\\\" )\");</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageDispcData.getWord("Add a Record Status"));
      out.write("</legend>\n");
      out.write("\t\t\t<form method=\"post\" name=\"new_group\">\r\n");
      out.write("\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispcData.getWord("Record Status"));
      out.write("</strong></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

		String record_status = "";
		if (request.getParameter("record_status") != null){//we have a record_status post
			record_status = request.getParameter("record_status");
			
			if(record_status.indexOf("'") != -1 || record_status.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Record Status contains an invalid character');</script>");
			} else if(record_status.length() == 0){
				out.println("<script type='text/javascript'>alert('Record status cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_record_status VALUES('" + record_status + "')";
				pageData.executeModification(query);
				record_status = "";
			}
		}
		query = "SELECT * FROM dispo_record_status";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display record_status
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"record_status\" value=\"");
      out.print( record_status );
      out.write("\" /></td>\r\n");
      out.write("\t\t\t</tr><tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><input type='submit' value='");
      out.print( pageDispcData.getWord("Add"));
      out.write("'/></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tab7\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageDispcData.getWord("Call Code Type"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tab7\" ), \"javascript:showArticleTab( \\\"tab7\\\" )\");</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageDispcData.getWord("Add a Call Code Type"));
      out.write("</legend>\n");
      out.write("\t\t\t<form method=\"post\" name=\"new_group\">\r\n");
      out.write("\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispcData.getWord("Call Code Type"));
      out.write("</strong></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

		String call_code_type = "";
		if (request.getParameter("call_code_type") != null){//we have a call_code_type post
			call_code_type = request.getParameter("call_code_type");
			
			if(call_code_type.indexOf("'") != -1 || call_code_type.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Call Code Type contains an invalid character');</script>");
			} else if(call_code_type.length() == 0){
				out.println("<script type='text/javascript'>alert('Call code type cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_call_code_type VALUES('" + call_code_type + "')";
				pageData.executeModification(query);
				call_code_type = "";
			}
		}
		query = "SELECT * FROM dispo_call_code_type";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display call_code_type
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"call_code_type\" value=\"");
      out.print( call_code_type );
      out.write("\" /></td>\r\n");
      out.write("\t\t\t</tr><tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><input type='submit' value='");
      out.print( pageDispcData.getWord("Add"));
      out.write("'/></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
 pageData.closeConnection(); 
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
 pageDispcData.closeConnection(); 
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
