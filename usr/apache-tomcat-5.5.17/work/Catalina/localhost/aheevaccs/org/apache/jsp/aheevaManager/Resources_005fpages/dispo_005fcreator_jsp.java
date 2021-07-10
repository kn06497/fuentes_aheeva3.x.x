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

public final class dispo_005fcreator_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {



	beanManagerData pageData = new beanManagerData();
	ResultSet rs;
	String query;
	boolean  emptyField = false;
	String emptyFieldMessage = "Before you can use this page, you must create elements for the following field(s):\\n";
	String category = "";
	String group = "";
	String description = "";
	String call_code_type = "";
	String call_result = "";
	String record_status = "";
	
	String getCategoryOptions() throws Exception{
		String category_options = "<select name='category'>";
		category_options += "<option></option>";
		query = "SELECT * FROM dispo_category";
		rs = pageData.executeFromString(query);
		int rsLength = 0;
		while(rs.next()){
			rsLength ++;
			category_options += "<option value='" + rs.getString(1) + "' ";
			if(rs.getString(1).compareTo(category) == 0) category_options += "selected='selected' ";
			category_options += ">" + rs.getString(1) + "</option>";
		}
		category_options += "</select>";
		if(rsLength == 0){
			emptyField = true;
			emptyFieldMessage += "-Category\\n";
		}
		return category_options;
	}
	
	String getGroupOptions() throws Exception{
		String group_options = "<select name='group'>";
			group_options += "<option></option>";
			group_options += "<option value='Any'";
			if(group.compareTo("Any") == 0) group_options += "selected='selected' ";
			group_options += ">-Any-</option>";
			query = "SELECT * FROM dispo_grp";
			rs = pageData.executeFromString(query);
			int rsLength = 0;
			while(rs.next()){
				rsLength ++;
				group_options += "<option value='" + rs.getString(1) + "' ";
				if(rs.getString(1).compareTo(group) == 0) group_options += "selected='selected' ";
				group_options += ">" + rs.getString(1) + "</option>";
			}
			group_options += "</select>";
		return group_options;
	}
		
	String getCallCodeTypeOptions() throws Exception{
		String call_code_type_option = "<select name='call_code_type'>";
		call_code_type_option += "<option></option>";
		query = "SELECT * FROM dispo_call_code_type";
		rs = pageData.executeFromString(query);
		int rsLength = 0;
		while(rs.next()){
			rsLength ++;
			call_code_type_option += "<option value='" + rs.getString(1) + "' ";
			if(rs.getString(1).compareTo(call_code_type) == 0) call_code_type_option += "selected='selected' ";
			call_code_type_option += ">" + rs.getString(1) + "</option>";
		}
		call_code_type_option += "</select>";
		if(rsLength == 0){
			emptyField = true;
			emptyFieldMessage += "-Call Code Type\\n";
		}
		return call_code_type_option;
	}
	
	
	String getCallResultOptions() throws Exception{
		String call_result_option = "<select name='call_result'>";
		call_result_option += "<option></option>";
		query = "SELECT * FROM dispo_call_result";
		rs = pageData.executeFromString(query);
		int rsLength = 0;
		while(rs.next()){
			rsLength ++;
			call_result_option += "<option value='" + rs.getString(1) + "' ";
			if(rs.getString(1).compareTo(call_result) == 0) call_result_option += "selected='selected' ";
			call_result_option += ">" + rs.getString(1) + "</option>";
		}
		call_result_option += "</select>";
		if(rsLength == 0){
			emptyField = true;
			emptyFieldMessage += "-Call Result\\n";
		}
		return call_result_option;
	}
	
	String getRecordStatusOptions() throws Exception{
		String record_status_option = "<select name='record_status'>";
		record_status_option += "<option></option>";
		query = "SELECT * FROM dispo_record_status";
		rs = pageData.executeFromString(query);
		int rsLength = 0;
		while(rs.next()){
			rsLength ++;
			record_status_option += "<option value='" + rs.getString(1) + "' ";
			if(rs.getString(1).compareTo(record_status) == 0) record_status_option += "selected='selected' ";
			record_status_option += ">" + rs.getString(1) + "</option>";
		}
		record_status_option += "</select>";
		if(rsLength == 0){
			emptyField = true;
			emptyFieldMessage += "-Record Status\\n";
		}
		return record_status_option;
	}

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
 * @Description The purpose of this page is to create the sells options
 */

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
beanManagerData pageDispData = new beanManagerData();
pageDispData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDispData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


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
      out.write("\r\n");
      out.write("div.red{\r\n");
      out.write("\tcolor:#FF0000;\r\n");
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
	
	emptyFieldMessage = "Before you can use this page, you must create elements for the following field(s):\\n";
	category = "";
	group = "";
	description = "";
	call_code_type = "";
	call_result = "";
	record_status = "";
	pageData.openConnection();
	
	if (request.getParameter("category") != null){//we have a post
		category = request.getParameter("category");
		group = request.getParameter("group");
		description = request.getParameter("description");
		call_code_type = request.getParameter("call_code_type");
		call_result = request.getParameter("call_result");
		record_status = request.getParameter("record_status");
		//check all fields for invalid characters
		if(category.indexOf("'") != -1 || category.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Category contains an invalid character');</script>");
		} else if(group.indexOf("'") != -1 || group.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Group contains an invalid character');</script>");
		}else if(description.indexOf("'") != -1 || description.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Description contains an invalid character');</script>");
		}else if(call_code_type.indexOf("'") != -1 || call_code_type.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Call code type contains an invalid character');</script>");
		}else if(call_result.indexOf("'") != -1 || call_result.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Call result contains an invalid character');</script>");
		}else if(record_status.indexOf("'") != -1 || record_status.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Record status contains an invalid character');</script>");
		}else if(category.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a category');</script>");
		}else if(group.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a group');</script>");
		}else if(description.length() == 0){
			out.println("<script type='text/javascript'>alert('You must enter a description');</script>");
		}else if(call_code_type.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a call code type');</script>");
		}else if(call_result.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a call_result');</script>");
		}else if(record_status.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a record_status');</script>");
		}else{//no invalid char, proceed
			if(request.getParameter("update_dbid") != null){
				if(request.getParameter("update_dbid").indexOf("'") == -1 && request.getParameter("update_dbid").indexOf('"') == -1){
					query = "UPDATE dispo SET `CATEGORY`='" + category + "', " +
											"`GRP`='" + group + "', " + 
											"`DESCRIPTION`='" + description + "', " +
											"`CALL_CODE_TYPE`='" + call_code_type + "', " + 
											"`CALL_RESULT`='" + call_result + "', " +
											"`RECORD_STATUS`='" + record_status + "' " +
							"WHERE DBID='" + request.getParameter("update_dbid") + "'";
					pageData.executeModification(query);
					category = "";
					group = "";
					description = "";
					call_code_type = "";
					call_result = "";
					record_status = "";
					out.println("<script type='text/javascript'>document.location='?'</script>");
				} else{
					out.println("<div class='red'>Bad dispo DBID. Update failed</div>");
				}
				
			} else{
				query = "INSERT INTO dispo (`CATEGORY`, `GRP`, `DESCRIPTION`, `CALL_CODE_TYPE`, `CALL_RESULT`, `RECORD_STATUS`) " +
					"VALUES ('" + category + "', '" + group + "', '" + description + "', '" + call_code_type + "', '" + call_result + "', '" + record_status + "')";
				pageData.executeModification(query);
				category = "";
				group = "";
				description = "";
				call_code_type = "";
				call_result = "";
				record_status = "";
			}
		}
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"bottompagebody\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"tabPane1\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("</script>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageDispData.getWord("General"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageDispData.getWord("General settings"));
      out.write("</legend>\n");
      out.write("\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispData.getWord("Category"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispData.getWord("Group"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispData.getWord("Description"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispData.getWord("Call Code Type"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispData.getWord("Call result"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispData.getWord("Record Status"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDispData.getWord("Edit"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t");

		if(request.getParameter("mod_id") != null){
			if(request.getParameter("mod_id").indexOf("'") == -1 && request.getParameter("mod_id").indexOf('"') == -1){
				query = "SELECT CATEGORY, GRP, DESCRIPTION, CALL_CODE_TYPE, CALL_RESULT, RECORD_STATUS FROM dispo " +
						"WHERE DBID='" + request.getParameter("mod_id") + "'";
				rs = pageData.executeFromString(query);
				if(rs.next()){
					category = rs.getString(1);
					group = rs.getString(2);
					description = rs.getString(3);
					call_code_type = rs.getString(4);
					call_result = rs.getString(5);
					record_status = rs.getString(6);
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<h4>WARNING: Editing these settings after they have been used in production may corrupt data integrity.<br />\r\n");
      out.write("\t\t\t\t\tNOTE: Since the group option is only used for sorting purposes, it can be modified at any time without risk.</h4>\r\n");
      out.write("\t\t\t\t\t<form name='edit' method='post'>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print( getCategoryOptions() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print( getGroupOptions() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type='text' name='description' value='");
      out.print( description );
      out.write("'/></td>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print( getCallCodeTypeOptions() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print( getCallResultOptions() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print( getRecordStatusOptions() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type='submit' /></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<input type='hidden' name='update_dbid' value='");
      out.print( request.getParameter("mod_id") );
      out.write("' />\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t");

				}else{
					out.println("<td colspan='8' align='center'>DBID ERROR</td>");
				}
			} else{
				out.println("<td colspan='8' align='center'>DBID ERROR</td>");

			}
			out.println("<tr><td colspan='8' align='center'><input type='button' value='Cancel' onclick=\"document.location='?'\" /></td></tr>");
			out.println("</table>");
		} else{
		
			query = "SELECT CATEGORY, GRP, DESCRIPTION, CALL_CODE_TYPE, CALL_RESULT, RECORD_STATUS, DBID FROM dispo";
			rs = pageData.executeFromString(query);
			int lineNum = 0;
			int line = 1;
			int rsLength;
			String lineClassStr;
			try{
				while(rs.next()){//show all options
					lineNum = (lineNum + 1) % 2;
					if(lineNum == 0) lineClassStr = "reportsRowPair";
					else lineClassStr = "reportsRowUnPair";
					out.println("<tr class=" + lineClassStr + ">");
					out.println("<td>" + line  + "</td>");
					out.println("<td>" + rs.getString(1) + "</td>");
					out.println("<td>" + rs.getString(2) + "</td>");
					out.println("<td>" + rs.getString(3) + "</td>");
					out.println("<td>" + rs.getString(4) + "</td>");
					out.println("<td>" + rs.getString(5) + "</td>");
					out.println("<td>" + rs.getString(6) + "</td>");
					out.println("<td align='center'><input type='button' value='' onclick=\"document.location='?mod_id=" + rs.getString(7) + "'\"/></td>");
					out.println("</tr>");
					line ++;
				}
			} catch(Exception e){
				out.println("SQL rs error");
				e.printStackTrace();
			}
			
			//build all select input type
			String category_options = getCategoryOptions();			
			String group_options = getGroupOptions();	
			String call_code_type_option = getCallCodeTypeOptions();
			String call_result_option = getCallResultOptions();
			String record_status_option = getRecordStatusOptions();
			if(emptyField){
				out.println("<script type='text/javascript'>alert('" + emptyFieldMessage + "');</script>");
			}
			pageData.closeConnection();
			//display input line
			
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr><form name=\"new_dispo\" method=\"POST\">\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t<td align='center'>");
      out.print( category_options );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align='center'>");
      out.print( group_options );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align='center'><input type=\"text\" size='50' name=\"description\" value=\"");
      out.print( description );
      out.write("\" /></td>\r\n");
      out.write("\t\t\t\t\t<td align='center'>");
      out.print( call_code_type_option );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align='center'>");
      out.print( call_result_option );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align='center'>");
      out.print( record_status_option );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align='center'></td>\r\n");
      out.write("\t\t\t\t\t</tr><tr>\r\n");
      out.write("\t\t\t\t\t<td colspan=\"8\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<input type='submit' value='");
      out.print( pageDispData.getWord("Add"));
      out.write("'/>\n");
      out.write("\t\t\t\t\t</td></tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t");
 } 
		
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
 pageDispData.closeConnection(); 
      out.write('\n');
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
