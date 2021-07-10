package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import aheevaManager.ressources.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.lang.NumberFormatException;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;

public final class cmp_005fcommission_005fcreator_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


	/**
	 * Basically tests a string for a valid date format. Example: will return true on 2008-02-31 even if it doesn't exists
	 */
	boolean validateDate(String date){
		if(date.length() != 10) return false;
		if(date.indexOf("-") != 4 || date.lastIndexOf("-") != 7) return false;
		try{
			int tmp;
			tmp = Integer.parseInt(date.substring(0, 4));
			if(tmp < 2000 || tmp > 3000) return false;
			tmp = Integer.parseInt(date.substring(5, 7));
			if(tmp < 1 || tmp > 12) return false;
			tmp = Integer.parseInt(date.substring(8));
			if(tmp < 1 || tmp > 31) return false;
		} catch(NumberFormatException e){
			return false;
		}
		return true;
	}



	String query;
	beanManagerData pageData;
	ResultSet rs;
	String begin = "";
	String until = "";
	String name = "";
	String description = "";
	String lineClassStr;
	int type = -1;
	int extent = -1;
	int base = -1;
	int lineNum;
	int line;
	ArrayList val1Array = new ArrayList();
	ArrayList val2Array = new ArrayList();
	ArrayList payArray = new ArrayList();
	ArrayList opArray = new ArrayList();
	HashMap selectedIdsMap;//serve error case items recheck
	ArrayList selectedIdsList;//serve MySQL insertion
	HashMap selectedConditionMap;//error case
	ArrayList selectedConditionList;//MySQL insertion

	String getTableHeader(beanManagerData pageCreaData){
		return "<table align='center' border='1' class='reportsTabName' style='border-collapse:collapse ' bordercolor='#CCCCCC'>"
				+			"<tr>"
				+				"<td rowspan='2'></td>"
				+				"<td align='center' rowspan='2'><strong>"+pageCreaData.getWord("Begin")+"</strong></td>"
				+				"<td align='center' rowspan='2'><strong>"+pageCreaData.getWord("Until")+"</strong></td>"
				+				"<td align='center' rowspan='2'><strong>"+pageCreaData.getWord("Name")+"</strong></td>"
				+				"<td align='center' rowspan='2'><strong>"+pageCreaData.getWord("Description")+"</strong></td>"
				+				"<td align='center' rowspan='2'><strong>"+pageCreaData.getWord("Type")+"</strong></td>"
				+				"<td align='center' rowspan='2'><strong>"+pageCreaData.getWord("Extent")+"</strong></td>"
				+				"<td align='center' rowspan='2'><strong>"+pageCreaData.getWord("Base")+"</strong></td>"
				+				"<td align='center' colspan='3'><strong>"+pageCreaData.getWord("Applicable items")+"</strong></td>"
				+				"<td align='center'><strong>"+pageCreaData.getWord("Commission Details")+"</td>"
				+				"<td align='center' rowspan='2'><strong>"+pageCreaData.getWord("Commission Requirement")+"</strong></td>"
				+				"<td align='center' rowspan='2'><strong>"+pageCreaData.getWord("Modify")+"</strong></td>"
				+			"</tr><tr>"
				+				"<td><strong>"+pageCreaData.getWord("Category")+"</strong></td>"
				+				"<td><strong>"+pageCreaData.getWord("Group")+"</strong></td>"
				+				"<td><strong>"+pageCreaData.getWord("Description")+"</strong></td>"
				+				"<td><table width='100%'><tr>"
				+					"<td align='center' width='40%'><strong>"+pageCreaData.getWord("Operator")+"</strong></td>"
				+					"<td align='center' width='30%' colspan='2'><strong>"+pageCreaData.getWord("Value")+"</strong></td>"
				+					"<td align='center' width='30%'><strong>"+pageCreaData.getWord("Pay")+"</strong></td>"
				+					"</tr></table></td>"
				+			"</tr>";
	}
	
	String getTableFooter(String cmp_id,beanManagerData pageCreaData) throws SQLException{
		String returnStr = "<tr valign='top'>";
		returnStr +=	"<td></td>";
		returnStr +=	"<td id='cal3'><input type='text' name='begin' onfocus=\"showCalendar('', this, this, '', 'cal3', 0,30, 1)\" value='" + begin + "' size='10'></td>";
		if(until.compareTo("2001-01-01") == 0) until = "";
		returnStr +=	"<td id='cal2'><input type='text' name='until' onfocus=\"showCalendar('', this, this, '', 'cal2', 0,30, 1)\" value='" + until + "' size='10'></td>";
		if(until.length() == 0) until = "2001-01-01";
		returnStr +=	"<td><input type='text' name='name' value='" + name + "'></td>";
		returnStr +=	"<td><input type='text' name='description' value='" + description + "'></td>";
		returnStr +=	"<td><SELECT name='type'>";
		returnStr +=			"<OPTION value=''></OPTION>";
		returnStr +=			"<OPTION value='0' " + (type == 0 ? "selected='selected'" : "") + ">"+pageCreaData.getWord("Per Item")+"</OPTION>";
		returnStr +=			"<OPTION value='1' " + (type == 1 ? "selected='selected'" : "") + ">"+pageCreaData.getWord("Bonus")+"</OPTION>";
		returnStr += "</SELECT>";
		returnStr +=		"</td>";
		returnStr +=	"<td><SELECT name='extent'>";
		returnStr +=			"<OPTION value=''></OPTION>";
		returnStr +=			"<OPTION value='0' " + (extent == 0 ? "selected='selected'" : "") + ">"+pageCreaData.getWord("Agent")+"</OPTION>";
		//returnStr +=			"<OPTION value='1' " + (extent == 1 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Group'][lang]);</script></OPTION>";
		//returnStr +=			"<OPTION value='2' " + (extent == 2 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Campaign'][lang]);</script></OPTION>";
		returnStr +=		"</SELECT>";
		returnStr +=		"</td>";
		returnStr +=	"<td><SELECT name='base'>";
		returnStr +=			"<OPTION value=''></OPTION>";
		//returnStr +=			"<OPTION value='0' " + (base == 0 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Hour'][lang]);</script></OPTION>";
		returnStr +=			"<OPTION value='1' " + (base == 1 ? "selected='selected'" : "") + ">"+pageCreaData.getWord("Day")+"</OPTION>";
		returnStr +=			"<OPTION value='2' " + (base == 2 ? "selected='selected'" : "") + ">"+pageCreaData.getWord("Week")+"</OPTION>";
		returnStr +=		"</SELECT>";
		returnStr +=	"</td>";
		returnStr +=	"<td colspan='3'>"+pageCreaData.getWord("Select from the list below")+"</td>";
		returnStr +=	"<td>";
		returnStr +=		"<table id='opt_table' width='100%'>";

		int i = 0;
		for(i = 0; i < val1Array.size(); i ++){
			returnStr += "<tr>";
			returnStr += "<td id='op' width='40%' align='center'><SELECT name='" + i + "_op'>";
			returnStr +=	"<OPTION value=''></OPTION>";
			returnStr +=	"<OPTION value='0' " + ((Integer)opArray.get(i) == 0 ? "selected='selected'" : "") + "> < </OPTION>";
			returnStr +=	"<OPTION value='1' " + ((Integer)opArray.get(i) == 1 ? "selected='selected'" : "") + "> >= </OPTION>";
			returnStr +=	"<OPTION value='2' " + ((Integer)opArray.get(i) == 2 ? "selected='selected'" : "") + "> = </OPTION>";
			returnStr +=	"<OPTION value='3' " + ((Integer)opArray.get(i) == 3 ? "selected='selected'" : "") + "> >= < </OPTION>";
			returnStr += "</SELECT>";
			returnStr += "</td>";
			returnStr += "<td id ='val' width='30%' align='center'><input type='text' name='" + i + "_val1' size='4' value='" + val1Array.get(i) + "'/></td>";
			returnStr += "<td id ='val' width='30%' align='center'><input type='text' name='" + i + "_val2' size='4' value='" + val2Array.get(i) + "'/></td>";
			returnStr += "<td id='pay' width='30%' align='center'><input type='text' name='" + i + "_pay' size='4' value='" + payArray.get(i) +"'/></td>";
			returnStr += "</tr>";
		}
		
		if(i == 0){
			returnStr += "<tr>";
			
			returnStr += "<td id='op' width='40%' align='center'><SELECT name='" + i + "_op'>";
			returnStr += "	<OPTION value=''></OPTION>";
			returnStr += "	<OPTION value='0'> < </OPTION>";
			returnStr += "	<OPTION value='1'> >= </OPTION>";
			returnStr += "	<OPTION value='2'> = </OPTION>";
			returnStr += "	<OPTION value='3'> >= < </OPTION>";
			returnStr += "</SELECT>";
			returnStr += "</td>";
			returnStr += "<td id ='val' width='30%' align='center'><input type='text' name='" + i + "_val1' size='4'/></td>";
			returnStr += "<td id ='val' width='30%' align='center'><input type='text' name='" + i + "_val2' size='4'/></td>";
			returnStr += "<td id='pay' width='30%' align='center'><input type='text' name='" + i + "_pay' size='4'/></td>";
			returnStr += "</tr>";
		} else{
			i --;
		}
		returnStr += "</table><script type='text/javascript'>index=" + i +  ";</script>";
		
		returnStr += "</td>";
		returnStr += "<td>"+pageCreaData.getWord("Select from the list below")+"</td>";
		returnStr += "<td></td>";
		returnStr += "</tr>";
							
		returnStr += "<tr>";
		returnStr += "<td colspan='11'></td>";
		returnStr += "<td align='center'><a onclick=\"add_row();\" style=\"cursor: pointer;\">"+pageCreaData.getWord("Add")+"</a></td>";
		returnStr += "<td colspan='2'></td>";
		returnStr += "</tr>";
		returnStr += "</table>";

							
							
		returnStr += "<br />";
		returnStr += "<table align='center' border='1' class='reportsTabName' style='border-collapse:collapse ' bordercolor='#CCCCCC'>";
		returnStr += "<tr>";
		returnStr += "<td colspan='6' align='center'><strong>"+pageCreaData.getWord("Applicable items")+"</strong></td>";
		returnStr += "</tr><tr>";
		returnStr += "<td></td>";
		returnStr += "<td><strong>"+pageCreaData.getWord("Select")+"</strong></td>";
		returnStr += "<td><strong>"+pageCreaData.getWord("Active")+"</strong></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Category")+"</strong></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Group")+"</strong></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Description")+"</strong></td>";
		returnStr += "</tr>";
		
		query = "SELECT dispo.DBID, dispo.CATEGORY, dispo.GRP, dispo.DESCRIPTION, " +
									"dispo_cmp_assoc.ACTIVE " +
									"FROM dispo, dispo_cmp_assoc " + 
									"WHERE dispo.DBID=dispo_cmp_assoc.DISPO_DBID " +
									"AND dispo_cmp_assoc.CAMPAIGN_DBID='" + cmp_id + "'";
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		
		String posted_id = "";
		while(rs.next()){//display all active or previously active sales/options
			lineNum = (lineNum + 1) % 2;
			if(lineNum == 0) lineClassStr = "reportsRowPair";
			else lineClassStr = "reportsRowUnPair";
			returnStr += "<tr class='" + lineClassStr + "'>";
			returnStr += "<td align='right'>" + line + "</td>";
			returnStr += "<td align='center'><input type='checkbox' name='" + rs.getString(1) + "_selected' ";
			if(selectedIdsMap.containsKey(rs.getString(1))) returnStr += "checked='checked'";
			returnStr += "/></td>";
			
			returnStr += "<td align='center'><input type='checkbox' disabled='disabled' name='" + rs.getString(1) + "_enable'";
			posted_id += "-" + rs.getString(1);
			if(rs.getInt(5) == 1){
				returnStr += "checked='checked'";
			}
			returnStr +="/></td>";
			
			returnStr +="<td align='center'>" + rs.getString(2) + "</td>";
			returnStr +="<td align='center'>" + rs.getString(3) + "</td>";
			returnStr +="<td align='center'>" + rs.getString(4) + "</td>";
			returnStr +="</tr>";
			line ++;
		}
		
		returnStr += "<tr><input type='hidden' name='posted_id' value='" + posted_id + "' />"; //this hidden value increases update performances by only updating changes 
		returnStr += "</tr>";
		returnStr += "</table>";
		returnStr += "<br />";
		returnStr += "<table align='center' border='1' class='reportsTabName' style='border-collapse:collapse ' bordercolor='#CCCCCC'>";
		returnStr += "<tr><td colspan='8' align='center'><strong>"+pageCreaData.getWord("Commission Requirement")+"</strong></td></tr>";
		returnStr += "<tr>";
		returnStr += "<td></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Select")+"</bold></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Name")+"</striong></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Extent")+"</striong></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Base")+"</striong></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Rule")+"</striong></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Operator")+"</striong></td>";
		returnStr += "<td align='center'><strong>"+pageCreaData.getWord("Value")+"</striong></td>";
		returnStr += "</tr>";
		query = "SELECT NAME, EXTENT, BASE, RULE, OP, VAL, DBID FROM commission_admissibility_rule";
		rs = pageData.executeFromString(query);
		line = 1;
		lineNum = 0;
		String requirementsIds = "";
		while(rs.next()){
			requirementsIds += "-" + rs.getString(7);
			lineNum = (lineNum + 1) % 2;
			if(lineNum == 0) lineClassStr = "reportsRowPair";
			else lineClassStr = "reportsRowUnPair"; 
			returnStr += "<tr class='" + lineClassStr + "' valign='top'>";
			returnStr += "<td>" + (line ++) + "</td>";
			returnStr += "<td align='center'><input type='checkbox' name='" + rs.getInt(7) + "_rule'" + (selectedConditionMap.containsKey(rs.getString(7)) ? "checked='checked'" : "") + "/></td>";
			returnStr += "<td>" + rs.getString(1) + "</td>";
			returnStr += "<td>"; 
			if(rs.getInt(2) == 0) returnStr += pageCreaData.getWord("Agent");
			else if(rs.getInt(2) == 1) returnStr += pageCreaData.getWord("Group");
			else if(rs.getInt(2) == 2) returnStr += pageCreaData.getWord("Campaign");
			returnStr += "</td>";
			returnStr += "<td>";
			if(rs.getInt(3) == 0) returnStr += pageCreaData.getWord("Hour");
			else if(rs.getInt(3) == 1) returnStr += pageCreaData.getWord("Day");
			else if(rs.getInt(3) == 2) returnStr += pageCreaData.getWord("Week");
			returnStr += "</td>";
			returnStr += "<td>";
			if(rs.getInt(4) == 0) returnStr += pageCreaData.getWord("Work Hours");
			else if(rs.getInt(4) == 1) returnStr += pageCreaData.getWord("Disciplinary Measures");
			else if(rs.getInt(4) == 2) returnStr += pageCreaData.getWord("Productivity Ratio")+" (%)";
			else if(rs.getInt(4) == 3) returnStr +=pageCreaData.getWord("Quality Ratio")+" (%)";
			returnStr += "</td>";
			returnStr += "<td>";
			if(rs.getInt(5) == 0) returnStr += "<";
			else if(rs.getInt(5) == 1) returnStr += "<=";
			else if(rs.getInt(5) == 2) returnStr += "=";
			else if(rs.getInt(5) == 3) returnStr += ">=";
			else if(rs.getInt(5) == 4) returnStr += ">";
			returnStr += "</td>";
			returnStr += "<td>" + rs.getString(6) + "</td>";
			returnStr += "</tr>";
		}
		returnStr += "</table>";
		returnStr += "<input type='hidden' name='requirementIds' value='" + requirementsIds + "' />";
		return returnStr;
	}


  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/aheevaManager/Resources_pages/mopFunctions_labels.jsp");
    _jspx_dependants.add("/aheevaManager/Resources_pages/xc2_default_labels.jsp");
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


/**
 * @Author FM L'Heureux
 * @Date 2007-08-09
 * @Version 0.1
 * @Description The purpose of this page is to create commissions from campaign Sells/Options ex.:3$/Television
 * 
 * Commission groups and prioryties could be added
 */

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
      out.write("\r\n");

beanManagerData pageCreaData = new beanManagerData();
pageCreaData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCreaData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" >\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<meta http-equiv=\"Content-Language\" content=\"en-us\">\r\n");
      out.write("<link rel=stylesheet href=\"xc2_default.css\" type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
      out.write("a{\r\n");
      out.write("\tcolor=\"#000000\";\r\n");
      out.write("\t text-decoration:underline;\r\n");
      out.write("}\r\n");
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
      out.write('\r');
      out.write('\n');
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
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"mopFunctions.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"xc2_default.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\txcAutoHide=1000;\r\n");
      out.write("\txcDateFormat=\"YYYY-MM-DD\";\r\n");
      out.write("</script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"xc2_inpage.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" >\r\n");
      out.write("var index = 1;\r\n");
      out.write("function add_row(){//op val pay\r\n");
      out.write("index ++;\r\n");
      out.write("\tvar tblBody = document.getElementById('opt_table').tBodies[0];\r\n");
      out.write("\tvar newRow = tblBody.insertRow(-1);\r\n");
      out.write("\tvar newCell0 = newRow.insertCell(0);\r\n");
      out.write("\tnewCell0.innerHTML = \"<SELECT name='\" + index + \"_op'><OPTION value=''></OPTION><OPTION value='0'> < </OPTION>\" +\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\"<OPTION value='1'> >= </OPTION><OPTION value='2'> = </OPTION><OPTION value='3'> >= < </OPTION></SELECT>\";\r\n");
      out.write("\r\n");
      out.write("\tvar newCell1 = newRow.insertCell(1);\r\n");
      out.write("\tnewCell1.innerHTML = \"<input type='text' name='\" + index + \"_val1' size='4' />\";\r\n");
      out.write("\r\n");
      out.write("\tvar newCell2 = newRow.insertCell(2);\r\n");
      out.write("\tnewCell2.innerHTML = \"<input type='text' name='\" + index + \"_val2' size='4' />\";\r\n");
      out.write("\t\r\n");
      out.write("\tvar newCell3 = newRow.insertCell(3);\r\n");
      out.write("\tnewCell3.innerHTML = \"<input type='text' name='\" + index + \"_pay' size='4' />\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"f_i_com_body\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	pageData = new beanManagerData();
	pageData.openConnection();
	
	begin = "";
	until = "";
	name = "";
	description = "";	
	type = -1;
	extent = -1;
	base = -1;
	String errorTxt = "The following field(s) must be corrected\\n";
	opArray = new ArrayList();
	val1Array = new ArrayList();
	val2Array = new ArrayList();
	payArray = new ArrayList();
	selectedIdsMap = new HashMap();//serve error case items recheck
	selectedIdsList = new ArrayList();//serve MySQL insertion
	selectedConditionMap = new HashMap();//error case
	selectedConditionList = new ArrayList();//MySQL insertion
	boolean cleanParam = true;
		
	
	//check for post	
	if(request.getParameter("setup_id2") != null && request.getParameter("change_date") != null){
	
		if(request.getParameter("setup_id2").indexOf("'") != -1 || request.getParameter("setup_id2").indexOf('"') != -1){
			
      out.write("<script type='text/javascript'>alert(\"Internal Error\");</script>");

		} else if(request.getParameter("change_date").indexOf("'") != -1 || request.getParameter("change_date").indexOf('"') != -1){
			
      out.write("<script type='text/javascript'>alert(\"Erronous date\");</script>");

		}
		query = "UPDATE commission_setup SET `UNTIL`='" + request.getParameter("change_date") + "' " +
				"WHERE DBID='" + request.getParameter("setup_id2") + "'";
		
		pageData.executeModification(query);
	}
	else if(request.getParameter("cmp_id") != null && request.getParameter("until") != null && request.getParameter("name") != null && request.getParameter("description") != null && 
		request.getParameter("type") != null && request.getParameter("extent") != null && request.getParameter("base") != null && request.getParameter("posted_id") != null && 
		request.getParameter("0_val1") != null && request.getParameter("0_val2") != null &&request.getParameter("0_pay") != null && request.getParameter("0_op") != null &&
		request.getParameter("requirementIds") != null && request.getParameter("begin") != null){
		begin = request.getParameter("begin").trim();
		until = request.getParameter("until").trim();
		name = request.getParameter("name").trim();
		description = request.getParameter("description").trim();
		try{
			type = Integer.parseInt(request.getParameter("type").trim());
			if(type < 0 || type > 1){
				cleanParam = false;
				errorTxt += "-Type\\n";
			}
		} catch (NumberFormatException e){
			cleanParam = false;
			errorTxt += "-Type\\n";
		}
		try{
			extent = Integer.parseInt(request.getParameter("extent").trim());
			if(extent < 0 || extent > 2){
				cleanParam = false;
				errorTxt += "-Extent\\n";
			}
		} catch (NumberFormatException e){
			cleanParam = false;
			errorTxt += "-Extent\\n";
		}
		try{
			base = Integer.parseInt(request.getParameter("base").trim());
			if(base < 0 || base > 2){
				cleanParam = false;
				errorTxt += "-Base\\n";
			}
		} catch (NumberFormatException e){
			cleanParam = false;
			errorTxt += "-Base\\n";
		}
		int index = 0;
		while(request.getParameter(index + "_val1") != null && request.getParameter(index + "_val2") != null && request.getParameter(index + "_pay") != null && request.getParameter(index + "_op") != null){
			if(request.getParameter(index + "_op").trim().compareTo("") != 0 || request.getParameter(index + "_pay").trim().compareTo("") != 0 || request.getParameter(index + "_val1").trim().compareTo("") != 0){
				try{
					opArray.add(Integer.parseInt(request.getParameter(index + "_op").trim()));
				}catch (NumberFormatException e){
					opArray.add("");
					if(cleanParam){
						cleanParam = false;
						errorTxt += "-Commission Details (invalid number)\\n";
					}
				}
				try{
					payArray.add(Double.parseDouble(request.getParameter(index + "_pay").trim()));
				}catch (NumberFormatException e){
					payArray.add("");
					if(cleanParam){
						cleanParam = false;
						errorTxt += "-Commission Details (invalid number)\\n";
					}
				}
				try{
					val1Array.add(Double.parseDouble(request.getParameter(index + "_val1").trim()));
				}catch (NumberFormatException e){
					val1Array.add("");
					if(cleanParam){
						cleanParam = false;
						errorTxt += "-Commission Details (invalid number)\\n";
					}
				}
				try{
					if(Integer.parseInt(request.getParameter(index + "_op").trim()) == 3) val2Array.add(Double.parseDouble(request.getParameter(index + "_val2").trim()));
					else val2Array.add("");
				}catch (NumberFormatException e){
					val2Array.add("");
					if(cleanParam){
						cleanParam = false;
						errorTxt += "-Commission Details (invalid number)\\n";
					}
				}
			}
			index ++;
		}
		
		String posted_id = request.getParameter("posted_id");
		String current_id;
		int posted_index;
		//create the list and map of the refernced Items
		while((posted_index = posted_id.lastIndexOf('-')) != -1){//loop while we have ids
			current_id = posted_id.substring(posted_index + 1);
			if(request.getParameter(current_id + "_selected") != null){
				selectedIdsMap.put(current_id, current_id);
				selectedIdsList.add(current_id);
			}
			posted_id = posted_id.substring(0, posted_index);//chop the end of the string
		}
		
		//create the list of the referenced conditions
		posted_id = request.getParameter("requirementIds");
		while((posted_index = posted_id.lastIndexOf('-')) != -1){//loop while we have ids
			current_id = posted_id.substring(posted_index + 1);
			if(request.getParameter(current_id + "_rule") != null){
				selectedConditionMap.put(current_id, current_id);
				selectedConditionList.add(current_id);
			}
			posted_id = posted_id.substring(0, posted_index);//chop the end of the string
		}
		
		index = 0;
		
		if(request.getParameter("cmp_id").indexOf("'") != -1 || request.getParameter("cmp_id").indexOf('"') != -1){
			
      out.write("<script type='text/javascript'>alert(\"Invalid campaign id\");</script>");

		} 
		if(begin.indexOf("'") != -1 || begin.indexOf('"') != -1 || !validateDate(begin)){
			errorTxt += "-Begin\\n";//TODO must be a date
			cleanParam = false;
		}
		if(until.indexOf("'") != -1 || until.indexOf('"') != -1 || (until.length() > 0 && !validateDate(until))){
			errorTxt += "-Until\\n";//TODO must be a date
			cleanParam = false;
		}
		if(name.indexOf("'") != -1 || name.indexOf('"') != -1){
			errorTxt += "-Name\\n";
			cleanParam = false;
		}
		if(name.length() == 0){
			errorTxt += "-Name (must not be empty)\\n";
			cleanParam = false;
		}
		if(description.indexOf("'") != -1 || description.indexOf('"') != -1){
			errorTxt += "-Description\\n";
			cleanParam = false;
		}
		if(request.getParameter("posted_id").indexOf("'") != -1 || request.getParameter("posted_id").indexOf('"') != -1){
			errorTxt += "\\nInternal parameter error\\n";
			cleanParam = false;
		}
		if(val1Array.size() == 0){
			errorTxt += "\\nYou must define at least one Commission Detail\\n";
			cleanParam = false;
		}
		if(selectedIdsList.size() == 0){
			errorTxt += "\\nYou muste select at least one Commission Item\\n";
			cleanParam = false;
		}
		
		while(request.getParameter(index + "_val") != null && request.getParameter(index + "_pay") != null && request.getParameter(index + "_op") != null){
			if(request.getParameter(index + "_val").indexOf("'") != -1 || request.getParameter(index + "_val").indexOf('"') != -1){//TODO numerical test with -
				errorTxt += "\\nInvalid Value #" + index;
				cleanParam = false;
			}else if(request.getParameter(index + "_op").indexOf("'") != -1 || request.getParameter(index + "_op").indexOf('"') != -1 ||
					(request.getParameter(index + "_op").compareTo("<") != 0 && request.getParameter(index + "_op").compareTo(">") != 0 && 
					 request.getParameter(index + "_op").compareTo("=") != 0 && request.getParameter(index + "_op").compareTo("><") != 0 &&
					 request.getParameter(index + "_op").compareTo("") != 0)){
				errorTxt += "\\nInvalid Operator #" + index;
				cleanParam = false;
			}else if(request.getParameter(index + "_pay").indexOf("'") != -1 || request.getParameter(index + "_pay").indexOf('"') != -1){//numerical
				errorTxt += "\\nInvalid pay #" + index;
				cleanParam = false;
			}else if(request.getParameter(index + "_op").compareTo("><") == 0 && request.getParameter(index + "_val").indexOf('-') == -1){
				errorTxt += "\\n\\nInvalid value #" + index + "\nWhen used with '><', it must contain be  value-value";
				cleanParam = false;
			}  
			if(!cleanParam) break;

			index ++;
		}
		index --;
		
		if(request.getParameter("update_id") != null && (request.getParameter("update_id").indexOf("'") != -1 || request.getParameter("update_id").indexOf('"') != -1)){
				cleanParam = false;
				errorTxt += "\\nCannot update. An error occured with the commission id to update";
		}
		
		if(cleanParam){ //parameters are clean, proceed we may make the insertions
			if(request.getParameter("update_id") != null){//update case. delete old infos (False update... delete old and insert new)
				query = "DELETE FROM commission_setup WHERE DBID='" + request.getParameter("update_id") + "'";
				pageData.executeModification(query);
				query = "DELETE FROM commission_rule WHERE COMMISSION_DBID='" + request.getParameter("update_id") + "'";
				pageData.executeModification(query);
				query = "DELETE FROM commission_object WHERE COMMISSION_SETUP_DBID='" + request.getParameter("update_id") + "'";
				pageData.executeModification(query);
				query = "DELETE FROM commission_admi_assoc WHERE COMMISSION_SETUP_DBID='" + request.getParameter("update_id") + "'";
				pageData.executeModification(query);
			}
			if(until.length() == 0) until= "2001-01-01";
			query = "INSERT INTO commission_setup (`CAMPAIGN_DBID`, `UNTIL`, `NAME`, `DESCRIPTION`, `CALCULATION_TYPE`, `CALCULATION_EXTENT`, `BASE`, `DEBUT`) " +
					"VALUES ('" + request.getParameter("cmp_id") + "', '" + until + "', '" + name + "', '" + description + "', '" + type + "', '" + extent + "', '" + base + "', '" + begin + "')";
			pageData.executeModification(query);
			query = "SELECT LAST_INSERT_ID()";
			rs = pageData.executeFromString(query);
			try{
				rs.next();
				for(int i = 0; i < selectedIdsList.size(); i ++){
					query = "INSERT INTO commission_object (`COMMISSION_SETUP_DBID`, `DISPO_DBID`) " +
							"VALUES ('" + rs.getString(1) + "', '" +  (String)selectedIdsList.get(i) + "')";
							
					pageData.executeModification(query);
				}
				for(int i = 0; i < opArray.size(); i ++){//op, val and pay theoritically have the same size
					if((Integer)opArray.get(i) == 3){
						query = "INSERT INTO commission_rule (`COMMISSION_DBID`, `OP`, `VAL1`, `VAL2`, `PAY`) " +
								"VALUES('" + rs.getString(1) + "', '" + (Integer)opArray.get(i) + "', '" + (Double)val1Array.get(i) + "', '" + (Double)val2Array.get(i) + "', '" + (Double)payArray.get(i) + "')";
					} else{
						query = "INSERT INTO commission_rule (`COMMISSION_DBID`, `OP`, `VAL1`, `PAY`) " +
								"VALUES('" + rs.getString(1) + "', '" + (Integer)opArray.get(i) + "', '" + (Double)val1Array.get(i) + "', '" + (Double)payArray.get(i) + "')";
					}
					
					pageData.executeModification(query);
				}
				

				for(int i = 0 ; i < selectedConditionList.size(); i ++){//conditions
					query = "INSERT INTO commission_admi_assoc (`COMMISSION_SETUP_DBID`, `COMMISSION_ADMI_DBID`) " +
							"VALUES('" + rs.getString(1) + "', '" + selectedConditionList.get(i) + "')";
					
					pageData.executeModification(query);
				}
				
				//reseting parameter
				begin = "";
				until = "";
				name = "";
				description = "";
				type = -1;
				extent = -1;
				base = -1;
				selectedIdsList = new ArrayList();
				opArray = new ArrayList();
				val1Array = new ArrayList();
				val2Array = new ArrayList();
				payArray = new ArrayList();
				selectedIdsMap = new HashMap();
				selectedConditionMap = new HashMap();
				selectedConditionList = new ArrayList();
				out.println("<script type='text/javascript'>document.location='?cmp_id=" + request.getParameter("cmp_id") + "'</script>"); 
			}catch(Exception e){
				out.println("SQL rs error --- " + query);
				e.printStackTrace();
			}
		}else{
			
      out.write("<script type='text/javascript'>alert(\"");
      out.print( errorTxt );
      out.write("\");</script>");

		}
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("/*articleMenu.add(new WebFXMenuItem(\"Look &amp; Feel\", \"javascript:showArticleTab( \\\"looknfeel\\\" )\"));*/\r\n");
      out.write("</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageCreaData.getWord("General"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageCreaData.getWord("General settings"));
      out.write("</legend>\n");
      out.write("\t\t\t\t\t");

				if(request.getParameter("modify") != null && request.getParameter("modify").indexOf("'") == -1 && request.getParameter("modify").indexOf('"') == -1 &&
						request.getParameter("cmp_id") != null && request.getParameter("cmp_id").indexOf("'") == -1 && request.getParameter("cmp_id").indexOf('"') == -1){
					//Update display
					query = "SELECT UNTIL, NAME, DESCRIPTION, CALCULATION_TYPE, CALCULATION_EXTENT, BASE, DEBUT " +
								"FROM commission_setup WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "' " +
								"AND DBID='" + request.getParameter("modify") + "'";
					try{
						rs = pageData.executeFromString(query);
						rs.next();
						if (name.length() == 0){//means that it's the first access. otherwise it's a failed update and we already have the post infos
							until = rs.getString(1);
							begin = rs.getString(7);
							name = rs.getString(2);
							description = rs.getString(3);
							type = rs.getInt(4);
							extent = rs.getInt(5);
							base = rs.getInt(6);
							query = "SELECT dispo.DBID FROM dispo, commission_object " +
									"WHERE dispo.DBID=commission_object.DISPO_DBID " +
									"AND commission_object.COMMISSION_SETUP_DBID='" + request.getParameter("modify") + "' ";
							ResultSet rs2 = pageData.executeFromString(query);
							while(rs2.next()){//reload the dispos
								selectedIdsMap.put(rs2.getString(1), rs2.getString(1));
							}
							
							query = "SELECT DBID FROM commission_admissibility_rule, commission_admi_assoc " + 
									"WHERE commission_admi_assoc.COMMISSION_SETUP_DBID='" + request.getParameter("modify") + "' " +
									"AND commission_admissibility_rule.DBID=commission_admi_assoc.COMMISSION_ADMI_DBID ";
							rs2 = pageData.executeFromString(query);
							while(rs2.next()){//reload conditions
								selectedConditionMap.put(rs2.getString(1), rs2.getString(1));
							}
							
							query = "SELECT OP, VAL1, VAL2, PAY FROM commission_rule WHERE COMMISSION_DBID='" + request.getParameter("modify") + "'";
							rs2 = pageData.executeFromString(query);
							while(rs2.next()){//reload operations
								opArray.add(rs2.getInt(1));
								payArray.add(rs2.getInt(4));
								val1Array.add(rs2.getDouble(2));
								if(rs2.getInt(1) == 3) val2Array.add(rs2.getDouble(3));
								else val2Array.add("");
							}
						}
						
						out.println(getTableHeader(pageCreaData));				
						out.println("<form name='comm_creator' method='post'>");
						out.println(getTableFooter(request.getParameter("cmp_id"),pageCreaData));
						out.println("<br />");
						out.println("<div align='center'><input type='submit' value='"+ pageCreaData.getWord("Update") + "' />");
						out.println("<input type='hidden' name='update_id' value='" + request.getParameter("modify") + "' />");
						out.println("<input type='submit' value='" + pageCreaData.getWord("Cancel")+ "' onclick=\\\"document.location='?cmp_id=" + request.getParameter("cmp_id") + "'\\\" />");
						//out.println("<input type='button' value='Cancel' onclick=\"document.location='?cmp_id=" + request.getParameter("cmp_id") + "'\" /></div>");
						out.println("</form>");
						out.println("<br />");
					} catch (SQLException e){
						out.println("SQLException - Last query:" + query);
					} catch (Exception e){
						out.println("Error on page. Last query was:" + query);
					}
				}else if(request.getParameter("cmp_id") != null){
					//Input display
					if(request.getParameter("cmp_id").indexOf("'") != -1 || request.getParameter("cmp_id").indexOf('"') != -1 || request.getParameter("cmp_id").length() == 0){//error in the campaign id
						
      out.write("<script type=\"text/javascript\">alert(\"Invalid campaign id\");\r\n");
      out.write("\t\t\t\t\t\t\tdocument.location=\"dispo_cmp_assoc.jsp\";\r\n");
      out.write("\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");

					} else{
						
						query = "SELECT name, description FROM cfg_campaign WHERE dbid='" + request.getParameter("cmp_id") + "'";
						rs = pageData.executeFromString(query);
						try{
							rs.next();
							
      out.print( pageCreaData.getWord("Showing properties for"));
      out.write(':');
      out.write(' ');
      out.print( rs.getString(1) );
      out.write(" <a href=\"cmp_commission_creator.jsp\">[");
      out.print( pageCreaData.getWord("Switch"));
      out.write("]</a></br>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageCreaData.getWord("Only active objects for the selected campaign are displayed"));
      out.write(".</br>\n");
      out.write("\t\t\t\t\t\t\t");

							out.println(getTableHeader(pageCreaData));
							query = "SELECT DBID, UNTIL, NAME, DESCRIPTION, CALCULATION_TYPE, CALCULATION_EXTENT, BASE, DEBUT " +
									"FROM commission_setup WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "'";
							rs = pageData.executeFromString(query);
							lineNum = 0;
							line = 1;
							ResultSet rs2;
							String op = "";
							String val = "";
							String pay = "";
							while(rs.next()){//loop through all commissions for this campaign
								lineNum = (lineNum + 1) % 2;
								if(lineNum == 0) lineClassStr = "reportsRowPair";
								else lineClassStr = "reportsRowUnPair"; 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr class='");
      out.print( lineClassStr );
      out.write("' valign='top'>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
      out.print( line ++ );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
      out.print( rs.getString(8)  );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");

										if(rs.getString(2).compareTo("2001-01-01") != 0) out.print(rs.getString(2)); 
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
 out.print(rs.getString(3)); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
 out.print(rs.getString(4)); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
 
										if(rs.getInt(5) == 0) out.print("Per Item");
										else if(rs.getInt(5) == 1) out.print("Bonus");
										
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
 
										if(rs.getInt(6) == 0) out.print("Agent");
										else if(rs.getInt(6) == 1) out.print("Group");
										else if(rs.getInt(6) == 2) out.print("Campaign"); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
 if(rs.getInt(7) == 0) out.print("Hour");
										else if(rs.getInt(7) == 1) out.print("Day");
										else if(rs.getInt(7) == 2) out.print("Week"); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

									query = "SELECT dispo.CATEGORY, dispo.GRP, dispo.DESCRIPTION FROM dispo, commission_object " +
											"WHERE dispo.DBID=commission_object.DISPO_DBID " +
												"AND commission_object.COMMISSION_SETUP_DBID='" + rs.getString(1) + "' ";
									rs2 = pageData.executeFromString(query);
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

									while(rs2.next()){
										out.println("<tr><td>" + rs2.getString(1) + "</td></tr>");
									}
									rs2.beforeFirst();
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

									while(rs2.next()){
										out.println("<tr><td>" + rs2.getString(2) + "</td></tr>");
									}
									rs2.beforeFirst();
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

									while(rs2.next()){
										out.println("<tr><td>" + rs2.getString(3) + "</td></tr>");
									}
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

									query = "SELECT OP, VAL1, VAL2, PAY FROM commission_rule WHERE COMMISSION_DBID='" + rs.getString(1) + "'";
									rs2 = pageData.executeFromString(query);
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td><table width='100%'>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

									String sign = "";
									while(rs2.next()){										
										if(rs2.getInt(1) == 0) sign = "<";
										else if(rs2.getInt(1) == 1) sign = ">=";
										else if(rs2.getInt(1) == 2) sign = "=";
										else if(rs2.getInt(1) == 3) sign = ">= <";
										out.println("<tr><td align='center'>" + sign + "</td>");
										out.println("<td align='center'>" + rs2.getDouble(2) + "</td>");
										if(rs2.getInt(1) == 3){
											out.println("<td align='center'>" + rs2.getDouble(3) + "</td>");
										}else{
											out.println("<td></td>");
										}
										out.println("<td align='center'>" + rs2.getDouble(4) + "</td></tr>");
									}
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

										query = "SELECT NAME FROM commission_admissibility_rule, commission_admi_assoc " + 
												"WHERE commission_admi_assoc.COMMISSION_SETUP_DBID='" + rs.getString(1) + "' " +
												"AND commission_admissibility_rule.DBID=commission_admi_assoc.COMMISSION_ADMI_DBID ";
										rs2 = pageData.executeFromString(query);
										while(rs2.next()){
											out.println(rs2.getString(1) + "<br />");
										}
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td align='center' valign='middle'><input type='button' value='' onClick='document.location=\"?modify=");
      out.print( rs.getString(1) );
      out.write("&cmp_id=");
      out.print( request.getParameter("cmp_id") );
      out.write("\"'/></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t");

							}
							//now display a "make commission" box
							out.println("<form name='comm_creator' method='post'>");
							out.println(getTableFooter(request.getParameter("cmp_id"),pageCreaData));
							out.println("<div align='center'><input type='submit' value='" + pageCreaData.getWord("Create")+"' /></div>"); //<input type='submit' value='Create'/>");
							out.println("</form>");
							
						} catch(Exception e){
							out.println("SQL rs error --- " + query);
							e.printStackTrace();
						}
					}
				}else{	
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageCreaData.getWord("Choose a campaign"));
      out.write("\n");
      out.write("\t\t\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageCreaData.getWord("Name"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageCreaData.getWord("Description"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageCreaData.getWord("Choose"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

					query = "SELECT dbid, name, description FROM cfg_campaign";
					rs = pageData.executeFromString(query);
					lineNum = 0;
					line = 1;
					try{
						while(rs.next()){
							lineNum = (lineNum + 1) % 2;
							if(lineNum == 0) lineClassStr = "reportsRowPair";
							else lineClassStr = "reportsRowUnPair";
							out.println("<tr class='" + lineClassStr + "' >");
							out.println("<td>" + line  + "</td>");
							out.println("<td>" + rs.getString(2) + "</td>");
							out.println("<td>" + rs.getString(3) + "</td>");
							out.println("<td align='center'>");
							out.println("<input type='button' onclick=\"document.location='cmp_commission_creator.jsp?cmp_id=" + rs.getString(1) + "'\"; /></td>");
							out.println("</tr>");
							line ++;
						}
					} catch(Exception e){
						out.println("SQL rs error --- " + query);
						e.printStackTrace();
					}
					out.print("</table>");
				}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
pageCreaData.closeConnection(); 
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
