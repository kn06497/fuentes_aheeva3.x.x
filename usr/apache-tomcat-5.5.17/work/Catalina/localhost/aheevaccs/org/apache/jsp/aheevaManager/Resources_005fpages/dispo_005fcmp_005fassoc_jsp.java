package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import java.lang.NumberFormatException;
import java.sql.ResultSet;
import aheevaManager.ressources.*;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;

public final class dispo_005fcmp_005fassoc_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 * @Date 2007-08-09
 * @Version 0.1
 * @Description The purpose of this page is to associate the campaigns with the sells options and then to configure the way they are shown on reports
 */

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
beanManagerData pageDisData = new beanManagerData();
pageDisData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDisData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
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
      out.write("<body class=\"dispo_body\">\r\n");

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	String query;
	String lineClassStr;
	ResultSet rs;
	int lineNum;
	int line;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("/*articleMenu.add(new WebFXMenuItem(\"Look &amp; Feel\", \"javascript:showArticleTab( \\\"looknfeel\\\" )\"));*/\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageDisData.getWord("General"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageDisData.getWord("General settings"));
      out.write("</legend>\n");
      out.write("\t\t\t");

			String posted_id;
			String checked_id;
			//cmp_id -> post for campaign available results
			if (request.getParameter("posted_id") != null && request.getParameter("checked_id") != null && request.getParameter("cmp_id") != null && request.getParameter("cmp_id").length() != 0){
				//check for invalid characters
				if(request.getParameter("cmp_id").indexOf('"') != -1 || request.getParameter("cmp_id").indexOf("'") != -1){
					
      out.write("<script type=\"text/javascript\">alert(\"Invalid campaign id\");\r\n");
      out.write("\t\t\t\t\t\tdocument.location=\"dispo_cmp_assoc.jsp\";\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t");

				} else{
					posted_id = request.getParameter("posted_id");
					checked_id = request.getParameter("checked_id");
					int index;
					String current_id;
					boolean update;
					int active = 0;
					//loop through the posted items. The algorithm is made to avoid useless queries since it checks if there has been a modification before making an insertion/update
					while((index = posted_id.lastIndexOf('-')) != -1){//loop while we have ids
						current_id = posted_id.substring(index + 1);
						update = false;
						if(request.getParameter(current_id + "_enable") == null){
							//off
							if(checked_id.indexOf("-" + current_id + "-") != -1){
								//ON->OFF
								update = true;
								active = 0;
							}
						}else{
							//on
							if(checked_id.indexOf("-" + current_id + "-") == -1){
								//OFF->ON
								update = true;
								active = 1;
							}
						}
						
						if(update){
							query = "LOCK TABLE dispo_cmp_assoc WRITE";
							pageData.executeModification(query);
							query = "SELECT COUNT(*) FROM dispo_cmp_assoc " +
									"WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "' " +
									"AND DISPO_DBID='" + current_id + "'";
							rs = pageData.executeFromString(query);
							try{
								rs.next();
								if(rs.getInt(1) == 1){//update (there is already a row matching this campaign_dbid and dispo_dbid)
									query = "UPDATE dispo_cmp_assoc SET `ACTIVE`='" + active + "'" +  
											"WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "' " +
											"AND DISPO_DBID='" + current_id + "'";
									
								} else{//insert
									query = "INSERT INTO dispo_cmp_assoc (`CAMPAIGN_DBID`, `DISPO_DBID`, `REPORT_ORDER`, `CALL_CODE_MENU`,  `ACTIVE`) " +
											"VALUES ('" + request.getParameter("cmp_id") + "', '" + current_id + "', '0', '', '1')"; 
								}
								pageData.executeModification(query);
							}catch(Exception e){
								out.println("SQL rs error:" + query + "---" );
								e.printStackTrace();
							}
							query = "UNLOCK TABLES";
							pageData.executeModification(query);
						}
						
						
						posted_id = posted_id.substring(0, index);//chop the end of the string
					}
				}
			} else if(request.getParameter("posted_id") != null && request.getParameter("cmp2_id") != null){//cmp2_id = post for sells options details (for reports and pop-up)
				if(request.getParameter("cmp2_id").indexOf('"') != -1 || request.getParameter("cmp2_id").indexOf("'") != -1){//invalid char
					
      out.write("<script type=\"text/javascript\">alert(\"Invalid campaign id\");\r\n");
      out.write("\t\t\t\t\t\tdocument.location=\"dispo_cmp_assoc.jsp\";\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t");

				}else{
					posted_id = request.getParameter("posted_id");
					checked_id = request.getParameter("checked_id");
					int index;
					String current_id;
					String errorMsg = "The following entries contain invalid characters \n";
					boolean errorCase = false;
					int active = 0;
					while((index = posted_id.lastIndexOf('-')) != -1){//loop through the ids. This time we update every valid entry.
						current_id = posted_id.substring(index + 1);
						if(request.getParameter(current_id + "_ro") != null && request.getParameter(current_id + "_ccm") != null)
							if(request.getParameter(current_id + "_ro").indexOf("'") != -1 || request.getParameter(current_id + "_ro").indexOf('"') != -1){//invalid Report Order
								errorCase = true;
								errorMsg += "-" + request.getParameter(current_id + "_ro") + "\n";
							} else if(request.getParameter(current_id + "_ccm").indexOf("'") != -1 || request.getParameter(current_id + "_ccm").indexOf('"') != -1){//invalid call code menu
								errorCase = true;
								errorMsg += "-" + request.getParameter(current_id + "_ccm") + "\n";
							}else{//ok, we may insert
								try{
									Integer.parseInt(request.getParameter(current_id + "_ro"));//invalid non numeric Report Order goes in the catch block
									query = "UPDATE dispo_cmp_assoc SET `REPORT_ORDER`='" + request.getParameter(current_id + "_ro") + "', " + 
																		"`CALL_CODE_MENU`='" + request.getParameter(current_id + "_ccm") + "' " +
											"WHERE CAMPAIGN_DBID='" + request.getParameter("cmp2_id") + "' " +
												"AND DISPO_DBID='" + current_id + "'";
									pageData.executeModification(query);
								} catch(NumberFormatException e){
									errorCase = true;
									errorMsg += "-" + request.getParameter(current_id + "_ro") + "\n";
								}
							
						} //else ignore...
						posted_id = posted_id.substring(0, index);//chop the end of the string
					}
					if(errorCase){
						
      out.write("<script type='text/javascript'>alert(\"Errors detected\");</script> ");

					}
				}
			}
			
			if (request.getParameter("cmp_id") != null){//display the sells/options page
				if(request.getParameter("cmp_id").indexOf("'") != -1 || request.getParameter("cmp_id").indexOf('"') != -1 || request.getParameter("cmp_id").length() == 0){//error in the campaign id
					
      out.write("<script type=\"text/javascript\">alert(\"Invalid campaign id\");\r\n");
      out.write("\t\t\t\t\t\tdocument.location=\"dispo_cmp_assoc.jsp\";\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t");

				} else{
					query = "SELECT name, description FROM cfg_campaign WHERE dbid='" + request.getParameter("cmp_id") + "'";
					rs = pageData.executeFromString(query);
					try{
						rs.next();
						
      out.print( pageDisData.getWord("Showing properties for"));
      out.write(':');
      out.write(' ');
      out.print( rs.getString(1) );
      out.write(" <a href=\"dispo_cmp_assoc.jsp\">[");
      out.print( pageDisData.getWord("Switch"));
      out.write("]</a>\n");
      out.write("\t\t\t\t\t\t<br />\r\n");
      out.write("\t\t\t\t\t\t<form name=\"dispo_cmp_assoc_form\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><strong>");
      out.print( pageDisData.getWord("Active"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td><strong>");
      out.print( pageDisData.getWord("Used"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Category"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Group"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Description"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Call Code Type"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Call result"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Record Status"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");

						query = "SELECT dispo.DBID, dispo.CATEGORY, dispo.GRP, dispo.DESCRIPTION, dispo.CALL_CODE_TYPE, " +
								"dispo.CALL_RESULT, dispo.RECORD_STATUS, dispo_cmp_assoc2.ACTIVE " +
								"FROM dispo LEFT JOIN " +
									"(SELECT ACTIVE, DISPO_DBID FROM dispo_cmp_assoc  WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "') AS dispo_cmp_assoc2 " + 
									"ON dispo.dbid=dispo_cmp_assoc2.dispo_dbid ";
						rs = pageData.executeFromString(query);
						lineNum = 0;
						line = 1;
						checked_id = "-";
						posted_id = "";
						while(rs.next()){//prints all the available options
							lineNum = (lineNum + 1) % 2;
							if(lineNum == 0) lineClassStr = "reportsRowPair";
							else lineClassStr = "reportsRowUnPair";
							out.println("<tr class='" + lineClassStr + "'>");
							out.println("<td align='right'>" + line + "</td>");
							
							out.print("<td align='center'><input type='checkbox' name='" + rs.getString(1) + "_enable'");
							posted_id += "-" + rs.getString(1);
							if(rs.getInt(8) == 1){
								out.print("checked='checked'");
								checked_id += rs.getString(1) + "-";
							}
							out.println("/></td>");
							
							out.print("<td align='center'><input type='checkbox' disabled='disabled'");
							if(rs.getString(8) != null) out.print("checked='checked'");
							out.println("/></td>");
							
							out.println("<td align='center'>" + rs.getString(2) + "</td>");
							out.println("<td align='center'>" + rs.getString(3) + "</td>");
							out.println("<td align='center'>" + rs.getString(4) + "</td>");
							out.println("<td align='center'>" + rs.getString(5) + "</td>");
							out.println("<td align='center'>" + rs.getString(6) + "</td>");
							out.println("<td align='center'>" + rs.getString(7) + "</td>");
							out.println("</tr>");
							line ++;
						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"9\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"posted_id\" value=\"");
      out.print( posted_id );
      out.write("\" /> ");
 //this hidden value increases update performances by only updating changes  
																								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"checked_id\" value=\"");
      out.print( checked_id );
      out.write("\" /> ");
 //this hidden value increases update performances by only updating changes 
																								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<input type='submit' value='");
      out.print( pageDisData.getWord("Update"));
      out.write("'/>\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t");

					}catch(Exception e){
						out.println("SQL rs error ---" + query );
						e.printStackTrace();
					}
				}
			}else if(request.getParameter("cmp2_id") != null){//display the campaign configuration for selected sell/options
				if(request.getParameter("cmp2_id").indexOf("'") != -1 || request.getParameter("cmp2_id").indexOf('"') != -1 || request.getParameter("cmp2_id").length() == 0){//invalid campaign id
					
      out.write("<script type=\"text/javascript\">alert(\"Invalid campaign id\");\r\n");
      out.write("\t\t\t\t\t\tdocument.location=\"dispo_cmp_assoc.jsp\";\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t");

				}else{
					query = "SELECT name, description FROM cfg_campaign WHERE dbid='" + request.getParameter("cmp2_id") + "'";
					rs = pageData.executeFromString(query);
					try{
						rs.next();
						
      out.print( pageDisData.getWord("Showing configuration for"));
      out.write(':');
      out.write(' ');
      out.print( rs.getString(1) );
      out.write(" <a href=\"dispo_cmp_assoc.jsp\">[");
      out.print( pageDisData.getWord("Switch"));
      out.write("]</a>\n");
      out.write("\t\t\t\t\t\t<br />\r\n");
      out.write("\t\t\t\t\t\t<form name=\"dispo_cmp_assoc_conf_form\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><strong>");
      out.print( pageDisData.getWord("Active"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Category"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Group"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Description"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Call Code Type"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Call result"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Record Status"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Report Order"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Call Code Menu"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");

						query = "SELECT dispo.DBID, dispo.CATEGORY, dispo.GRP, dispo.DESCRIPTION, dispo.CALL_CODE_TYPE, " +
								"dispo.CALL_RESULT, dispo.RECORD_STATUS, dispo_cmp_assoc.ACTIVE, dispo_cmp_assoc.REPORT_ORDER, dispo_cmp_assoc.CALL_CODE_MENU " +
								"FROM dispo, dispo_cmp_assoc " + 
								"WHERE dispo.DBID=dispo_cmp_assoc.DISPO_DBID " +
								"AND dispo_cmp_assoc.CAMPAIGN_DBID='" + request.getParameter("cmp2_id") +"'";
						rs = pageData.executeFromString(query);
						lineNum = 0;
						line = 1;
						checked_id = "-";
						posted_id = "";
						while(rs.next()){//display all active or previously active sales/options
							lineNum = (lineNum + 1) % 2;
							if(lineNum == 0) lineClassStr = "reportsRowPair";
							else lineClassStr = "reportsRowUnPair";
							out.println("<tr class='" + lineClassStr + "'>");
							out.println("<td align='right'>" + line + "</td>");
							
							out.print("<td align='center'><input type='checkbox' disabled='disabled' name='" + rs.getString(1) + "_enable'");
							posted_id += "-" + rs.getString(1);
							if(rs.getInt(8) == 1){
								out.print("checked='checked'");
								checked_id += rs.getString(1) + "-";
							}
							out.println("/></td>");
							
							out.println("<td align='center'>" + rs.getString(2) + "</td>");
							out.println("<td align='center'>" + rs.getString(3) + "</td>");
							out.println("<td align='center'>" + rs.getString(4) + "</td>");
							out.println("<td align='center'>" + rs.getString(5) + "</td>");
							out.println("<td align='center'>" + rs.getString(6) + "</td>");
							out.println("<td align='center'>" + rs.getString(7) + "</td>");
							out.println("<td align='center'><input type='text' size='1' name='" + rs.getString(1) + "_ro' value='" + rs.getString(9) + "'/></td>");
							out.println("<td align='center'><input type='text' size='30' name='" + rs.getString(1) + "_ccm' value='" + rs.getString(10) + "'/></td>");
							out.println("</tr>");
							line ++;
						}
						
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr><input type=\"hidden\" name=\"posted_id\" value=\"");
      out.print( posted_id );
      out.write("\" /> ");
 //this hidden value increases update performances by only updating changes 
																		
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan='10' align='center'><input type='submit' value='");
      out.print( pageDisData.getWord("Update"));
      out.write("'/></td>\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<table>");

					}catch(Exception e){
						out.println("SQL rs error ---" + query );
						e.printStackTrace();
					}					
				}
			} else{//nothing selected, show all campaigns
			
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.print( pageDisData.getWord("Choose a campaign"));
      out.write("\n");
      out.write("\t\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Name"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Description"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Choose results"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pageDisData.getWord("Configure results"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

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
						out.println("<td align='center'><input type='button' onclick=\"document.location='dispo_cmp_assoc.jsp?cmp_id=" + rs.getString(1) + "'\"; /></td>");
						out.println("<td align='center'><input type='button' onclick=\"document.location='dispo_cmp_assoc.jsp?cmp2_id=" + rs.getString(1) + "'\"; /></td>");
						out.println("</tr>");
						line ++;
					}
				} catch(Exception e){
					out.println("SQL rs error --- " + query);
					e.printStackTrace();
				}
				
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t");

			}
			
      out.write("\r\n");
      out.write("\t\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 pageDisData.closeConnection(); 
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
