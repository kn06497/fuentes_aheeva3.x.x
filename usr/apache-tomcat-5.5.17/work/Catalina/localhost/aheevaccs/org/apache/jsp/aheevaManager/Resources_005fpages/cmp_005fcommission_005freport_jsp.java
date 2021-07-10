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
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;

public final class cmp_005fcommission_005freport_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
 * @Description The purpose of this page is to display a commission report
 * 
 *
 */

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

beanManagerData pagereppData = new beanManagerData();
pagereppData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagereppData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


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
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"xc2_default.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\txcAutoHide=1000;\r\n");
      out.write("\txcDateFormat=\"YYYY-MM-DD\";\r\n");
      out.write("</script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"xc2_inpage.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("var easter_count = 0;\r\n");
      out.write("function easter(){\r\n");
      out.write("\teaster_count ++;\r\n");
      out.write("\tif(easter_count > 10){\r\n");
      out.write("\t\talert(\"You have found an 'ex'easter egg!\");\r\n");
      out.write("\t\teaster_count = 0;\r\n");
      out.write("\t\t//document.location = \"http://www.patate.com\";\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"rep_body\">\r\n");

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	String query;
	String lineClassStr;
	ResultSet rs;
	int lineNum;
	int line;	
	
	//check post
	if(request.getParameter("campaignId") != null && request.getParameter("start") != null && request.getParameter("end") != null){
		if(request.getParameter("campaignId").indexOf("'") != -1 || request.getParameter("campaignId").indexOf('"') != -1){
			
      out.write("<script type='text/javascript'>alert(\"Internal Error\");</script>");

		} else if(request.getParameter("start").indexOf("'") != -1 || request.getParameter("start").indexOf('"') != -1 || request.getParameter("start").length() == 0){
			
      out.write("<script type='text/javascript'>alert(\"Invalid start date\");</script>");

		} else if(request.getParameter("end").indexOf("'") != -1 || request.getParameter("end").indexOf('"') != -1 || request.getParameter("end").length() == 0){
			
      out.write("<script type='text/javascript'>alert(\"Invalid number of days\");</script>");

		} else{//open the report in a new page
			String openStr = "cmp_commission_report2.jsp?id=" + request.getParameter("campaignId") + "&start=" + request.getParameter("start") + "&end=" + request.getParameter("end");
			
      out.write("<script type='text/javascript'>window.open(\"");
      out.print( openStr );
      out.write("&lang=\" + lang);</script>");

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
      out.print( pagereppData.getWord("General"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pagereppData.getWord("General settings"));
      out.write("</legend>\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\tChoose a campaign\r\n");
      out.write("\t\t\t\t<table align=\"center\" border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pagereppData.getWord("Choose"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\"><strong>");
      out.print( pagereppData.getWord("Name"));
      out.write("</strong></td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" onclick=\"easter();\"><strong>Description</strong></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<form name='cmp_chooser' method='post'>\r\n");
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
						out.println("<td align='center'><input type='radio' name='campaignId' value='" + rs.getString(1) + "' />");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("</tr>");
						line ++;
					}
				} catch(Exception e){
					out.println("SQL rs error --- " + query);
					e.printStackTrace();
				}
				
			
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td colspan='4' align='center'>\r\n");
      out.write("\t\t\t\t\t\t<table><tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td id='cal1'>");
      out.print( pagereppData.getWord("Begin"));
      out.write(":<input type='text' name='start' onfocus=\"showCalendar('', this, this, '', 'cal1', 0,30, 1)\" size='10' /></td>\n");
      out.write("\t\t\t\t\t\t\t<td id='cal2'>");
      out.print( pagereppData.getWord("End2"));
      out.write(":<input type='text' name='end' onfocus=\"showCalendar('', this, this, '', 'cal2', 0,30, 1)\" size='10' /></td>\n");
      out.write("\t\t\t\t\t\t</tr></table></td>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td colspan='4' align='center'><input type='submit' value='");
      out.print( pagereppData.getWord("Display"));
      out.write("' /></td>\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
pagereppData.closeConnection(); 
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
