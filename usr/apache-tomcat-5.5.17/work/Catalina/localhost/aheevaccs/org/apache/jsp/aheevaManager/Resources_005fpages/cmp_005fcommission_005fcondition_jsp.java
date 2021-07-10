package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import java.sql.ResultSet;
import aheevaManager.ressources.*;
import java.lang.NumberFormatException;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;

public final class cmp_005fcommission_005fcondition_jsp extends org.apache.jasper.runtime.HttpJspBase
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


/**
 * @Author FM L'Heureux
 * @Date 2007-08-09
 * @Version 0.1
 * @Description The purpose of this page is to create commissions requirements an agent needs to meet to be eligible ex.:40h/week
 */

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

beanManagerData pageCmpData = new beanManagerData();
pageCmpData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCmpData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


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
      out.write("a{\r\n");
      out.write("\tcolor=\"#000000\";\r\n");
      out.write("\t text-decoration:underline;\r\n");
      out.write("}\r\n");
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
      out.write("<body class=\"f_i_com_body\">\r\n");

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	String query;
	String lineClassStr;
	ResultSet rs;
	int lineNum;
	int line;
	String name = "";
	int extent = -1;
	int base = -1;
	int rule = -1;
	int operator = -1;
	String value = "";
	
	if(request.getParameter("name") != null && request.getParameter("extent") != null && request.getParameter("base") != null && request.getParameter("rule") != null && 
		request.getParameter("operator") != null && request.getParameter("value") != null){
		try{
			name = request.getParameter("name");
			extent  = Integer.parseInt(request.getParameter("extent"));
			base = Integer.parseInt(request.getParameter("base"));
			rule = Integer.parseInt(request.getParameter("rule"));
			operator =Integer.parseInt(request.getParameter("operator"));
			value = request.getParameter("value");
			Double.parseDouble(request.getParameter("value"));
			if(name.indexOf("'") != -1 || name.indexOf('"') != -1){
				
      out.write("<script type='text/javascript'>alert(\"Incorrect parameter. ' and \\\" are not allowed.\");</script>");

			} else{//check if a duplicate exists
				query = "SELECT COUNT(*) FROM commission_admissibility_rule " + 
						"WHERE EXTENT='" + extent + "' AND BASE='" + base + "' AND RULE='" + rule + "' AND OP='" + operator + "' " +
						"AND VAL='" + Double.parseDouble(request.getParameter("value")) + "'";
				rs = pageData.executeFromString(query);
				rs.next();
				if(rs.getInt(1) == 0){//insert
					query = "INSERT INTO commission_admissibility_rule (`NAME`, `EXTENT`, `BASE`, `RULE`, `OP`, `VAL`) " +
							"VALUES('" + name + "', '" + extent + "', '" + base + "', '" + rule + "', '" + operator + "', '" + Double.parseDouble(request.getParameter("value")) + "')";
					pageData.executeModification(query);
					//reset values
					name = "";
					extent = -1;
					base = -1;
					rule = -1;
					operator = -1;
					value = "";
				}else{
					query = "SELECT NAME FROM commission_admissibility_rule " + 
							"WHERE EXTENT='" + extent + "' AND BASE='" + base + "' AND RULE='" + rule + "' AND OP='" + operator + "' " +
							"AND VAL='" + Double.parseDouble(request.getParameter("value")) + "'";
					rs = pageData.executeFromString(query);
					rs.next();
					
      out.write("<script type='text/javascript'>alert(\"This rule already exists under the name \\\"");
      out.print( rs.getString(1) );
      out.write("\\\"\");</script>");

				}
			}
		} catch (NumberFormatException e){
			
      out.write("<script type='text/javascript'>alert(\"Incorrect parameter\");</script>");

		}
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("/*articleMenu.add(new WebFXMenuItem(\"Look &amp; Feel\", \"javascript:showArticleTab( \\\"looknfeel\\\" )\"));*/\r\n");
      out.write("</script>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageCmpData.getWord("General"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageCmpData.getWord("General settings"));
      out.write("</legend>\n");
      out.write("\t\t\t<form name='commission_condition' method='post'>\r\n");
      out.write("\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align='center'><strong>");
      out.print( pageCmpData.getWord("Name"));
      out.write("</striong></td>\n");
      out.write("\t\t\t\t<td align='center'><strong>");
      out.print( pageCmpData.getWord("Extent"));
      out.write("</striong></td>\n");
      out.write("\t\t\t\t<td align='center'><strong>");
      out.print( pageCmpData.getWord("Base"));
      out.write("</striong></td>\n");
      out.write("\t\t\t\t<td align='center'><strong>");
      out.print( pageCmpData.getWord("Rule"));
      out.write("</striong></td>\n");
      out.write("\t\t\t\t<td align='center'><strong>");
      out.print( pageCmpData.getWord("Operator"));
      out.write("</striong></td>\n");
      out.write("\t\t\t\t<td align='center'><strong>");
      out.print( pageCmpData.getWord("Value"));
      out.write("</striong></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

			query = "SELECT NAME, EXTENT, BASE, RULE, OP, VAL FROM commission_admissibility_rule";
			rs = pageData.executeFromString(query);
			line = 1;
			lineNum = 0;
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair"; 
      out.write("\r\n");
      out.write("\t\t\t\t<tr class='");
      out.print( lineClassStr );
      out.write("' valign='top'>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print( line ++ );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print( rs.getString(1) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td>");
 if(rs.getInt(2) == 0) out.print(pageCmpData.getWord("Agent"));
							else if(rs.getInt(2) == 1) out.print(pageCmpData.getWord("Group"));
							else if(rs.getInt(2) == 2) out.print(pageCmpData.getWord("Campaign")); 
      out.write("\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>");
 if(rs.getInt(3) == 0) out.print(pageCmpData.getWord("Hour"));
							else if(rs.getInt(3) == 1) out.print(pageCmpData.getWord("Day"));
							else if(rs.getInt(3) == 2) out.print(pageCmpData.getWord("Week")); 
      out.write("\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>");
 if(rs.getInt(4) == 0) out.print(pageCmpData.getWord("Work Hours"));
							else if(rs.getInt(4) == 1) out.print(pageCmpData.getWord("Disciplinary Measures"));
							else if(rs.getInt(4) == 2) out.print(pageCmpData.getWord("Productivity Ratio")+"(%)");
							else if(rs.getInt(4) == 3) out.print(pageCmpData.getWord("Quality Ratio") +"(%)"); 
      out.write("\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>");
 if(rs.getInt(5) == 0) out.print("<");
							else if(rs.getInt(5) == 1) out.print("<=");
							else if(rs.getInt(5) == 2) out.print("=");
							else if(rs.getInt(5) == 3) out.print(">=");
							else if(rs.getInt(5) == 4) out.print(">"); 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print( rs.getString(6) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

			}	
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<td align='center'><input type='text' name='name' value='");
      out.print( name );
      out.write("'/></td>\r\n");
      out.write("\t\t\t\t<td align='center'><SELECT name='extent'>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=''></OPTION>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value='0' ");
 if (extent == 0) out.print("selected='selected'"); 
      out.write('>');
      out.print( pageCmpData.getWord("Agent"));
      out.write("</OPTION>\n");
      out.write("\t\t\t\t\t\t<!-- <OPTION value='1' ");
 if (extent == 1) out.print("selected='selected'"); 
      out.write("><script>document.write(MultiArray['Group'][lang]);</script></OPTION> -->\r\n");
      out.write("\t\t\t\t\t\t<!-- <OPTION value='2' ");
 if (extent == 2) out.print("selected='selected'"); 
      out.write("><script>document.write(MultiArray['Campaign'][lang]);</script></OPTION> -->\r\n");
      out.write("\t\t\t\t\t</SELECT></td>\r\n");
      out.write("\t\t\t\t<td align='center'><SELECT name='base'>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=''></OPTION>\r\n");
      out.write("\t\t\t\t\t\t<!-- <OPTION value='0' ");
 if (base == 0) out.print("selected='selected'"); 
      out.write("><script>document.write(MultiArray['Hour'][lang]);</script></OPTION> -->\r\n");
      out.write("\t\t\t\t\t\t<OPTION value='1' ");
 if (base == 1) out.print("selected='selected'"); 
      out.write('>');
      out.print( pageCmpData.getWord("Day"));
      out.write("</OPTION>\n");
      out.write("\t\t\t\t\t\t<OPTION value='2' ");
 if (base == 2) out.print("selected='selected'"); 
      out.write('>');
      out.print( pageCmpData.getWord("Week"));
      out.write("</OPTION>\n");
      out.write("\t\t\t\t\t</SELECT></td>\r\n");
      out.write("\t\t\t\t<td align='center'><SELECT name='rule'>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=''></OPTION>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value='0' ");
 if (rule == 0) out.print("selected='selected'"); 
      out.write('>');
      out.print( pageCmpData.getWord("Work Hours"));
      out.write("</OPTION>\n");
      out.write("\t\t\t\t\t\t<!-- <OPTION value='1' ");
 if (rule == 1) out.print("selected='selected'"); 
      out.write("> pageCmpData.getWord(\"Disciplinary Measures\")%></OPTION> \n");
      out.write("\t\t\t\t\t\t<OPTION value='2' ");
 if (rule == 2) out.print("selected='selected'"); 
      out.write(">pageCmpData.getWord(\"Productivity Ratio\")%> (%)</OPTION>\n");
      out.write("\t\t\t\t\t\t<OPTION value='3' ");
 if (rule == 3) out.print("selected='selected'"); 
      out.write("> pageCmpData.getWord(\"Quality Ratio\")%> (%)</OPTION> -->\n");
      out.write("\t\t\t\t\t</SELECT></td>\r\n");
      out.write("\t\t\t\t<td align='center'><SELECT name='operator'>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=''></OPTION>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value='0' ");
 if (operator == 0) out.print("selected='selected'"); 
      out.write("> < </OPTION>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value='1' ");
 if (operator == 1) out.print("selected='selected'"); 
      out.write("> <= </OPTION>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value='2' ");
 if (operator == 2) out.print("selected='selected'"); 
      out.write("> = </OPTION>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value='3' ");
 if (operator == 3) out.print("selected='selected'"); 
      out.write("> >= </OPTION>\r\n");
      out.write("\t\t\t\t\t\t<OPTION value='4' ");
 if (operator == 4) out.print("selected='selected'"); 
      out.write("> > </OPTION>\r\n");
      out.write("\t\t\t\t\t</SELECT></td>\r\n");
      out.write("\t\t\t\t<td align='center'><input type='text' name='value' size='3' value='");
      out.print( value );
      out.write("'/></td>\r\n");
      out.write("\t\t\t</tr><tr>\r\n");
      out.write("\t\t\t\t<td colspan='7' align='center'>\r\n");
      out.write("\t\t\t\t<input type='submit' value=\"");
      out.print( pageCmpData.getWord("Create"));
      out.write("\" />\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
pageCmpData.closeConnection(); 
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
