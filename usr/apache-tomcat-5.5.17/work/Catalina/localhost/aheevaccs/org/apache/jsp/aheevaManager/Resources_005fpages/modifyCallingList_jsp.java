package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;

public final class modifyCallingList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


//public String buildChartString(java.sql.ResultSet sql_res);  value=\"Creating Chart - Please Wait.\">

public String buildChart(String legend_label, String legend_title)
{
	StringBuffer retString = new StringBuffer();
	retString.append("<!-- Start Up Parameters -->");
	retString.append("<PARAM name=\"LOADINGMESSAGE\" url(\"./img/chart_loading.gif\")>");
	retString.append("<PARAM name=\"STEXTCOLOR\"     value=\"0,0,100\">");
	retString.append("<PARAM name=\"STARTUPCOLOR\"   value=\"255,255,255\">");
	retString.append("<!-- Character Encoding -->");
	retString.append("<PARAM name=\"charset\"   value=\"8859_1\">			");
	retString.append("<!-- Chart Switches -->");
	retString.append("<PARAM name=\"3D\" value=\"false\">");
	retString.append("<PARAM name=\"Slabels\" value=\"true\">");
	retString.append("<PARAM name=\"legend\" value=\"false\">");
	retString.append("<PARAM name=\"displayPercentages\" value=\"true\">");
	retString.append("<!-- Chart Characteristics -->");
	retString.append("<PARAM name=\"width\"      value=\"160\">");
	retString.append("<PARAM name=\"height\"     value=\"160\">");
	retString.append("<PARAM name=\"nPies\"      value=\"1\">");
	retString.append("<PARAM name=\"depth3D\"    value=\"15\">");
	retString.append("<PARAM name=\"ndecplaces\" value=\"0\">");
	retString.append("<PARAM name=\"3Dangle\"    value=\"50\">");
	retString.append("<!-- Thousand separator -->");
	retString.append("<PARAM name=\"thousandseparator\" value=\".\">");
	retString.append("<!-- Link Cursor -->");
	retString.append("<!--  valid values are - crosshair, default, hand, move, text or wait -->");
	retString.append("<PARAM name=\"linkCursor\" value=\"default\">");
	retString.append("<!-- Popup segment Value Pre & Post Symbols -->");
	retString.append("<PARAM name=\"valuepresym\"  value=\"\">");
	retString.append("<PARAM name=\"valuepostsym\"  value=\" \">");
	retString.append("<!-- Additional font information -->");
	retString.append("<PARAM name=\"popupfont\"  value=\"Arial,B,12\">");
	retString.append("<PARAM name=\"slabelfont\" value=\"Arial,N,10\">");
	retString.append("<!-- Additional color information -->");
	retString.append("<PARAM name=\"bgcolor\"      value=\"255,255,255\">");
	retString.append("<PARAM name=\"labelcolor\"   value=\"50,50,50\">");
	retString.append("<!-- Legend Information -->");
	retString.append("<PARAM name=\"legendfont\"       value=\"Arial,N,10\">");
	retString.append("<PARAM name=\"legendposition\"   value=\"400,10\">");
	retString.append("<PARAM name=\"legendtitle\"      value=\""+legend_title+"\">");
	retString.append("<PARAM name=\"LegendBackground\" value=\"255,255,255\">");
	retString.append("<PARAM name=\"LegendBorder\"     value=\"125,125,125\">");
	retString.append("<PARAM name=\"LegendtextColor\"  value=\"0,0,0\">");
	retString.append("<!-- Title -->");
	retString.append("<!-- title   text|xpos,ypos|Font|Color Defintion\"> -->");
	retString.append("<PARAM name=\"title\" value=\""+legend_label+"|0,15|Arial,BI,10|grey\">");
	retString.append("<!-- Free Form Text -->");
	return retString.toString();
}


  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/Resources_pages/callingListFuncs_labels.jsp");
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
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      aheevaManager.ressources.beanModifyCallingListExtraData extra = null;
      synchronized (request) {
        extra = (aheevaManager.ressources.beanModifyCallingListExtraData) _jspx_page_context.getAttribute("extra", PageContext.REQUEST_SCOPE);
        if (extra == null){
          extra = new aheevaManager.ressources.beanModifyCallingListExtraData();
          _jspx_page_context.setAttribute("extra", extra, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");
 
	//  handle the extra data form summission

	if(request.getParameter("isExtraDataForm") != null && request.getParameter("isExtraDataForm").compareTo("1") == 0) {

		String oldExtraDatas[]     =  request.getParameterValues("oldExtraDatas");
		String newExtraDatas[]     =  request.getParameterValues("newExtraDatas"); 
		String extraDataForAllUrl  = (String) request.getParameter("allextradata");
		String modifyOption        = (String) request.getParameter("modifyScreenPopOption");

		
		if(modifyOption != null) {
			if(modifyOption.equals("all")){
				extra.modifyAllExtraData(extraDataForAllUrl, Integer.parseInt(request.getParameter("dbid")));
			}else{ 
				extra.modifyExtraDatas(oldExtraDatas, newExtraDatas, Integer.parseInt(request.getParameter("dbid")));
			}
		}else{
			out.write("<script>alert('Please chose a type of modification');</script>");
		}
	}


	beanManagerData pageData = new beanManagerData();
	PreparedStatement ps;
	ResultSet rs;
	
	String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
	String callingListDbid = request.getParameter("dbid");
	String tenantDbid = request.getParameter("tenant_dbid");
	int dbid = 0;
	if(callingListDbid != null  && !callingListDbid.equals("")){
		try{
			dbid = Integer.parseInt(callingListDbid);
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
	}
	
	
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	String userAssignedTenants = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='TENANT' AND RESSOURCE_DBID='"+tenantDbid+"')";
	String userAssignedCallingLists = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='CALLING_LIST' AND RESSOURCE_DBID='"+callingListDbid+"')";
	String listAllowedUsersQuery = "SELECT U.DBID AS USER_DBID, USERNAME FROM cfg_user_authorize_ressources, cfg_user U "+
		"WHERE RESSOURCE_TYPE='CALLING_LIST' AND U.DBID = USER_DBID AND RESSOURCE_DBID='"+callingListDbid+"'";
	String listNotAllowedUsersQuery = "SELECT DBID AS USER_DBID, USERNAME FROM cfg_user WHERE ALLOW_CALLING_LIST_MANAGEMENT='yes' AND state='1' "+
		"AND DBID NOT IN "+userAssignedCallingLists+" AND DBID IN "+userAssignedTenants+" ORDER BY USERNAME";
	String userRightsQuery = "SELECT ALLOW_USER_MANAGEMENT, ALLOW_CALLING_LIST_MANAGEMENT, ALLOW_CAMPAIGN_MANAGEMENT FROM cfg_user WHERE DBID='"+currentUserDbid+"'";

	pageData.openConnection();
	pageData.executeFromString(listAllowedUsersQuery);
	Vector <HashMap> listAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(listNotAllowedUsersQuery);
	Vector <HashMap> listNotAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(userRightsQuery);
	Vector <HashMap> userRightsDataResult = pageData.CreateVectorFromBean();

	boolean userManagementAllowed = pageData.userHasRight(userRightsDataResult, "ALLOW_USER_MANAGEMENT") && callingListDbid.compareTo("") != 0;
	if(!pageData.userHasRight(userRightsDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))
	{ 
      out.write("\r\n");
      out.write("\t\t");
      if (true) {
        _jspx_page_context.forward("forbidden.jsp");
        return;
      }
      out.write('\r');
      out.write('\n');
	} 
      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Modify Callinglist</title>\r\n");
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
      out.write("\r\n");
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
      out.write("</style>\r\n");
      out.write('\r');
      out.write('\n');

beanManagerData pageCalFData = new beanManagerData();
pageCalFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCalFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var CAll= new Array();\r\n");
      out.write("CAll[0]=\"");
      out.print(pageCalFData.getWord("cannot be choosen. It causes an order conflict with another treatment") );
      out.write("\";\r\n");
      out.write("CAll[1]=\"");
      out.print(pageCalFData.getWord("You must enter the table name associated with this list") );
      out.write("\";\r\n");
      out.write("CAll[2]=\"");
      out.print(pageCalFData.getWord("Invalid use of character") );
      out.write("\";\r\n");
      out.write("CAll[3]=\"");
      out.print(pageCalFData.getWord("Calling list name cannot start with a number") );
      out.write("\";\r\n");
      out.write("CAll[4]=\"");
      out.print(pageCalFData.getWord("Calling list already exists") );
      out.write("\";\r\n");
      out.write("CAll[5]=\"");
      out.print(pageCalFData.getWord("Are you sure, you wish to delete this calling list?") );
      out.write("\";\r\n");
      out.write("CAll[6]=\"");
      out.print(pageCalFData.getWord("Unable to delete a calling list associated to a running campaign") );
      out.write("\";\r\n");
      out.write("CAll[7]=\"");
      out.print(pageCalFData.getWord("No query specifed.**") );
      out.write("\";\r\n");
      out.write("CAll[8]=\"");
      out.print(pageCalFData.getWord("Invalid list name") );
      out.write("\";\r\n");
      out.write("CAll[9]=\"");
      out.print(pageCalFData.getWord("The name of the associated table to the calling list contains one or more forbidden characters. A calling list must start with a letter and contain only letters, digits and the underscore character(_). Please try again") );
      out.write("\";\r\n");
      out.write("CAll[10]=\"");
      out.print(pageCalFData.getWord("Specify the file extension") );
      out.write("\";\r\n");
      out.write("CAll[11]=\"");
      out.print(pageCalFData.getWord("Specify the CSV file delimiters and quotes") );
      out.write("\";\r\n");
      out.write("CAll[12]=\"");
      out.print(pageCalFData.getWord("Specify the calling list file") );
      out.write("\";\r\n");
      out.write("CAll[13]=\"");
      out.print(pageCalFData.getWord("No association have been made") );
      out.write("\";\r\n");
      out.write("CAll[14]=\"");
      out.print(pageCalFData.getWord("No table in your calling list") );
      out.write("\";\r\n");
      out.write("CAll[15]=\"");
      out.print(pageCalFData.getWord("No association with the phone number field") );
      out.write("\";\r\n");
      out.write("CAll[16]=\"");
      out.print(pageCalFData.getWord("Error: Missing dialing hours \\\"apply to\\\"") );
      out.write("\";\r\n");
      out.write("CAll[17]=\"");
      out.print(pageCalFData.getWord("Error: Missing the extra data for screenpop. Try selecting the \\\'None\\\' option") );
      out.write("\";\r\n");
      out.write("CAll[18]=\"");
      out.print(pageCalFData.getWord("Error: Missing extra data \\\"apply to\\\"") );
      out.write("\";\r\n");
      out.write("CAll[19]=\"");
      out.print(pageCalFData.getWord("Error: Missing non numeric phone number action") );
      out.write("\";\r\n");
      out.write("CAll[20]=\"");
      out.print(pageCalFData.getWord("Error: Missing Time Zone Rules Choice") );
      out.write("\";\r\n");
      out.write("CAll[21]=\"");
      out.print(pageCalFData.getWord("Error: No rule were selected in Time Zone Setup. Try using the \\\'None\\\' option instead.") );
      out.write("\";\r\n");
      out.write("CAll[22]=\"");
      out.print(pageCalFData.getWord("Table columns") );
      out.write("\";\r\n");
      out.write("CAll[23]=\"");
      out.print(pageCalFData.getWord("Specify format name") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageCalFData.closeConnection(); 
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"callingListFuncs.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("var callingListDbid = normalizeString(QueryString('dbid'));\r\n");
      out.write("\r\n");
      out.write("var isNewResource = false;\r\n");
      out.write("</script>\r\n");
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
      out.write("\t\r\n");
      out.write("function setTabPageHeight() {\r\n");
      out.write("\tif (document.getElementById(\"tabGeneral\")) {\r\n");
      out.write("\t\tvar page1Height = document.getElementById(\"field1\").offsetHeight;\r\n");
      out.write("\t\tdocument.getElementById(\"tabGeneral\").style.height = page1Height +\"px\";\r\n");
      out.write("\t}\r\n");
      out.write("\tif (document.getElementById(\"tabPage2\")) {\r\n");
      out.write("\t\tvar page2Height = document.getElementById(\"field2\").offsetHeight;\r\n");
      out.write("\t\tdocument.getElementById(\"tabPage2\").style.height = page2Height +\"px\";\r\n");
      out.write("\t}\r\n");
      out.write("\tif (document.getElementById(\"tabSecurity\")) {\r\n");
      out.write("\t\tvar page3Height = document.getElementById(\"field3\").offsetHeight;\r\n");
      out.write("\t\tdocument.getElementById(\"tabSecurity\").style.height = page3Height +\"px\";\r\n");
      out.write("\t}\r\n");
      out.write("\tif (document.getElementById(\"tabPage4\")) {\r\n");
      out.write("\t\tvar page4Height = document.getElementById(\"field4\").offsetHeight;\r\n");
      out.write("\t\tdocument.getElementById(\"tabPage4\").style.height = page4Height +\"px\";\r\n");
      out.write("\t}\r\n");
      out.write("\tif (document.getElementById(\"tabPage3\")) {\r\n");
      out.write("\t\tvar page5Height = document.getElementById(\"field5\").offsetHeight;\r\n");
      out.write("\t\tdocument.getElementById(\"tabPage3\").style.height = page5Height +\"px\";\r\n");
      out.write("\t}\r\n");
      out.write("//\talert(document.getElementById(\"tabGeneral\").style.height);\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"call_body\" onLoad=\"displayCallingListInfo();setTabPageHeight()\" onUnload=\"return checkOnUnload()\">\r\n");
      out.write("\r\n");

	String totNbEntered ="" ;
    String totNbAnswered = "" ;
    String totNbAbandonned = "" ;
	String lang = "0";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("\t\t<form name=\"callingList\" onKeyDown=\"KeyDownHandler(save)\">\r\n");
      out.write("\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t\t\t</script>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"tab-page\" id=\"tabGeneral\" style=\"height:200px;\">\r\n");
      out.write("\t\t\t\t<h2 class=\"tab\">");
      out.print( pageData.getWord("General"));
      out.write("</h2>\r\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t\t\t\t<fieldset id=\"field1\">\r\n");
      out.write("\t\t\t\t\t<legend>");
      out.print(pageData.getWord("Modify Calling list information"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t<table border=\"0\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print( pageData.getWord("Calling list name"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\"><input name=\"name\" size=\"37\" onfocus=\"enabledUpdateButton()\" style=\"float: left\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td valign=\"top\">");
      out.print( pageData.getWord("Description"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\"><textarea wrap=\"hard\" rows=\"4\" name=\"description\" style=\"width:98% \" onfocus=\"enabledUpdateButton()\"></textarea></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print( pageData.getWord("Associated table name"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\"><input name=\"table_name\" size=\"37\" onChange=\"enabledUpdateButton()\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print( pageData.getWord("Maximum attempts"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"checkbox\" name=\"UnlimitCkB\" value=\"ON\" onClick=\"enabledUpdateButton();validateMaxAttempts();\" checked>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print( pageData.getWord("Unlimited"));
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<input disabled name=\"MaxAttemptsTxt\" size=\"3\" onChange=\"validateMaxAttempts();enabledUpdateButton();\" style=\"float: left\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print( pageData.getWord("Active"));
      out.write("</td> \r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\"><input type=\"checkbox\" name=\"state\" value=\"ON\" onClick=\"enabledUpdateButton()\" checked></td>\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print( pageData.getWord("Campaign") );
      out.write("</td> \r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t");

						ps = pageData.buildPreparedStatement("SELECT name, dbid FROM cfg_campaign WHERE dbid=(SELECT campaign_dbid FROM cfg_calling_list WHERE dbid=?)");
						ps.setInt(1, dbid);
						rs = ps.executeQuery();
						if(rs.next()){
							 if (pageData.userHasRight(userRightsDataResult, "ALLOW_CAMPAIGN_MANAGEMENT")) {
								String campainLink =  "campaign.jsp?campaign_name=" + rs.getString(1) + "&tenant_dbid="+ tenantDbid +"&dbid="+rs.getString(2) ;
							  	out.println( "<a href="+campainLink + ">" + rs.getString(1) + "</a>" );

							  }else{	
								out.println(rs.getString(1));   
							  }
						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</td>\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\" align='center'>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input disabled id=\"save\" name=\"updateInfo\" type=\"button\" value=\"");
      out.print( pageData.getWord("Update"));
      out.write("\" onClick=\"saveCallingList()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"deleteCallList\" type=\"button\" value=\"");
      out.print( pageData.getWord("Delete"));
      out.write("\" onClick=\"askDelete()\">\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\t\t\t\r\n");
      out.write("\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"tab-page\" id=\"tabPage2\" style=\"height:200px;\">\r\n");
      out.write("\t\t\t\t<h2 class=\"tab\">");
      out.print( pageData.getWord("Treatments"));
      out.write("</h2>\r\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage2\" ) );</script>\r\n");
      out.write("\t\t\t\t<table id=\"field2\" width=\"95%\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"15%\">");
      out.print( pageData.getWord("Current filter"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"selectedFilter\" size=\"37\" disabled=\"true\" value=\"\" />\r\n");
      out.write("\t\t\t\t\t\t\t&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t<input name=\"RemoveFilterButton\" type=\"button\" value=\"");
      out.print( pageData.getWord("Delete"));
      out.write("\" onClick=\"removeAssociatedFilter()\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"right\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td valign=\"top\">");
      out.print( pageData.getWord("Available Filters"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t<select size=\"4\" style=\"width:45%; margin-bottom:4px;\" name=\"availableFilters\" onChange=\"enabledAddFilterButton()\">\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t<br />\r\n");
      out.write("\t\t\t\t\t\t\t<font style=\"color: #D40000; font-weight:bold\">\r\n");
      out.write("\t\t\t\t\t\t\t");
 out.println(pageData.getWord("Warning") +": "+pageData.getWord("Applying an invalid filter might block the calling list operations")); 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t\t<br/>\r\n");
      out.write("\t\t\t\t\t\t\t<input  disabled name=\"addFilter\"  class=\"grayBut01\"  type=\"button\" value=\"");
      out.print( pageData.getWord("Apply filter"));
      out.write("\" onClick=\"AddSelectedFilter()\" style=\"margin-top:8px;\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td valign=\"top\">");
      out.print( pageData.getWord("Treatments"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"37%\">\r\n");
      out.write("\t\t\t\t\t\t\t<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
      out.print( pageData.getWord("Available Treatments"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<select name=\"availableTreatments\" size=\"5\" multiple style=\"width:98% \">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</select>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td valign=\"middle\" width=\"10%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"../img/left_to_right.gif\" style=\"cursor:pointer \" onclick=\"javascript:chkAndAddTreatmentToGroup()\" /><br />\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"../img/right_to_left.gif\"  style=\"cursor:pointer \" onclick=\"javascript:chkAndDropTreatmentFromGroup()\"/>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"37%\">\r\n");
      out.write("\t\t\t\t\t\t\t<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>");
      out.print( pageData.getWord("Selected Treatments"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<select  name=\"selectedTreatments\" size=\"5\" multiple style=\"width:98%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\t\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t");
if(userManagementAllowed) { 
      out.write("\r\n");
      out.write("\t\t\t<div class=\"tab-page\" id=\"tabSecurity\" style=\"height:200px;\">\r\n");
      out.write("\t\t\t\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Security"));
      out.write("</h2>\r\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabSecurity\" ) );</script>\r\n");
      out.write("\t\t\t\t<fieldset id=\"field3\">\r\n");
      out.write("\t\t\t\t\t<legend>");
      out.print(pageData.getWord("Security settings"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t<table border=\"0\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(pageData.getWord("Not allowed users"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(pageData.getWord("Allowed users"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<select id=\"notAllowedUsers\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px\" name=\"notAllowedUsers\" size=\"5\" multiple=\"multiple\">\r\n");
      out.write("\t\t\t\t\t");
for(int i = 0; i < listNotAllowedUsersDataResult.size(); i++)
					{
						String userDbid = (String)listNotAllowedUsersDataResult.elementAt(i).get("USER_DBID");
						String userName = (String)listNotAllowedUsersDataResult.elementAt(i).get("USERNAME");
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"");
      out.print(userDbid);
      out.write('"');
      out.write('>');
      out.print(userName);
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t");
}	
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td valign=middle>\r\n");
      out.write("\t\t\t\t\t\t\t\t&nbsp;<img src=\"../img/left_to_right.gif\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('notAllowedUsers', 'allowedUsers')\"/>&nbsp;<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t&nbsp;<img src=\"../img/right_to_left.gif\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('allowedUsers', 'notAllowedUsers')\"/>&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<select id=\"allowedUsers\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px\" name=\"allowedUsers\" size=\"5\" multiple=\"multiple\">\r\n");
      out.write("\t\t\t\t\t");
for(int i = 0; i < listAllowedUsersDataResult.size(); i++)
					{
						String userDbid = (String)listAllowedUsersDataResult.elementAt(i).get("USER_DBID");
						String userName = (String)listAllowedUsersDataResult.elementAt(i).get("USERNAME");
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"");
      out.print(userDbid);
      out.write('"');
      out.write('>');
      out.print(userName);
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t");
}	
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"3\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"3\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"updateInfoSecurity\" type=\"button\" value=\"");
      out.print(pageData.getWord("Update"));
      out.write("\" onClick=\"saveCallingList()\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<div class=\"tab-page\" id=\"tabPage4\" style=\"height:200px;\">\r\n");
      out.write("\t\t\t\t<form method=\"POST\" name=\"screenPop\" action=\"modifyCallingList.jsp\">\r\n");
      out.write("\t\t     \t\t<h2 class=\"tab\">");
      out.print( pageData.getWord("Screen pop"));
      out.write("</h2>\r\n");
      out.write("\t\t     \t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage4\" ) );</script>\r\n");
      out.write("\t\t\t\t\t<div id=\"field4\">\r\n");
      out.write("\t\t\t\t\t\t<table width=\"80%\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"2\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"40%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<fieldset style=\"width:30%; height:70px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<legend>");
      out.print( pageData.getWord("Modification type"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"modifyScreenPopOption\" onClick=\"handleModifyingExtaDataType(this);\" value=\"all\">");
      out.print( pageData.getWord("Modify all URL"));
      out.write("<br/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"modifyScreenPopOption\" onClick=\"handleModifyingExtaDataType(this);\" value=\"each\">");
      out.print( pageData.getWord("Modify each URL"));
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"right\" width=\"20%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<fieldset style=\"height:70px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<legend>");
      out.print( pageData.getWord("Modify all URL"));
      out.write("</legend> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
      out.print( pageData.getWord("New URL"));
      out.write("<input type=\"text\" name=\"allextradata\" id=\"allextradata\"  size=\"50\" value=\"\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t<br/>\r\n");
      out.write("\t\t\t\t\t\t<fieldset style=\"width:79%;\"> \r\n");
      out.write("\t\t\t\t\t\t\t<legend>");
      out.print( pageData.getWord("Modify each URL"));
      out.write("</legend> \r\n");
      out.write("\t\t\t\t\t\t\t<table border=\"1\" cellpadding=\"0\" cellspacing=\"1\" bordercolor=\"#DDDDEE\" bgcolor=\"#DDDDEE\" width=\"100%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td colspan=\"2\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td class=\"reportsTabName\" width=\"55%\" align=\"center\">");
      out.print( pageData.getWord("Old"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td class=\"reportsTabName\" width=\"30%\" align=\"center\">");
      out.print( pageData.getWord("New"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");


							Vector receievedExtradata  = extra.loadExtrada((String) request.getParameter("callinglistName") );
							Iterator extraIt   =  receievedExtradata.iterator();
							int ind =   0;
	 	       					while(extraIt.hasNext()) {
	 	    	   					 String currentData  =  (String) extraIt.next(); 
 
                                                                 String fieldId      =  "newExtraDatas"+ind;
									
                                                                 out.write("<tr> ");

                                                                 String ccsClassName =   (ind % 2 == 0) ?  "reportsRowPair" :  "";
                                                                 out.write("           <td class='"+ccsClassName+"' align='left' style='padding-right:20px;'>"+ currentData +"</td>");
                                                                 out.write("           <td class='"+ccsClassName+"'><input size='50' type='text' name='newExtraDatas' id='"+fieldId+"'></td>" );
                                                                 out.write("           <input size='30' type='hidden' name='oldExtraDatas' value=\""+currentData+"\" >" );

                                                                 out.write("</tr> ");

								 ind++;
	 	       					}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"dbid\" value=\"");
      out.print( callingListDbid );
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"tenant_dbid\" value=\"");
      out.print( tenantDbid );
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"callinglistName\" value=\"");
      out.print( request.getParameter("callinglistName") );
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"isExtraDataForm\" value=\"1\">\r\n");
      out.write("\t\t\t\t\t\t\t<br/>\r\n");
      out.write("\t\t\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t\t\t\t<br/>\r\n");
      out.write("\t\t\t\t\t\t<br/>\r\n");
      out.write("\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"2\" align='left' bgcolor=\"#FFFFFF\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input  id=\"save\" name=\"updateUrl\" type=\"submit\" value=\"");
      out.print( pageData.getWord("Update"));
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t<div class=\"tab-page\" id=\"tabPage3\" style=\"height:200px;\">\r\n");
      out.write("\t\t\t\t<h2 class=\"tab\">");
      out.print( pageData.getWord("Statistics"));
      out.write("</h2>\t\t\r\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage3\" ) );</script>\t\r\n");
      out.write("\t\t\t\t<div id=\"field5\">\r\n");
      out.write("\t\t");
 
		    
			String list_name 	= request.getParameter("callinglistName");
			String tenant_dbid 	= request.getParameter("tenant_dbid");
			String table_name 	= "";
			String _Dials = pageData.getWord("Dials");// used in pie chart applet
			out.write("<b>"+pageData.getWord("List name")+": </b><i>"+list_name+"</i><br />");
			//get the table name
		
			if(list_name.compareTo("") != 0 && tenant_dbid.compareTo("") != 0){
				
				String getTableNameQuery = "SELECT TABLE_NAME FROM `cfg_calling_list` WHERE NAME=\""+list_name+"\" AND TENANT_DBID=\""+tenant_dbid+"\" LIMIT 0,1";
				//out.write("getTableNameQuery="+getTableNameQuery);
				java.sql.Statement  stat = null;
        		java.sql.Connection conn = null;
				DataSource          m_ds = null;
				
				String diagramWidth = "500";
				String diagramHeight = "200";
				String chartXPos = "175";
				String chartYPos = "30";
				String chartDiameter = "125";
				String chartDetachFactor = "5";
				
				
				try{            
					Context init = new InitialContext();
					Context ctx = (Context) init.lookup("java:comp/env");
					if(ctx == null )
						throw new Exception("Boom - No Context");
					
					m_ds = (DataSource) ctx.lookup("jdbc/aheevaccs");
					if (m_ds != null) 
					{
						System.out.println("Got Context");
					}
					conn = m_ds.getConnection();
            		stat = conn.createStatement();
					
					rs = stat.executeQuery(getTableNameQuery);
					if(rs.next()){					
						table_name = rs.getString("TABLE_NAME");
					}
					rs.close();
					String tmp1 = "", tmp2 = "", tmp3 = "";
					int nbColonnes = 0;
					String pos = "";
					java.sql.ResultSet rs_clStats;
					String buildChartString = "";
					String sql_record = "";
					out.write("<table width=\"95%%\" align=\"center\"><tr><td align=\"center\">");
					if(table_name.compareTo("") != 0){
						sql_record 	= "SELECT COUNT(*) AS TOTAL, RECORD_STATUS AS COL_LABEL FROM `"+table_name+"` GROUP BY RECORD_STATUS";
						nbColonnes = 0;
						tmp1 = "";
						tmp2 = "";
						tmp3 = "";
						pos = "1";						
						rs_clStats = stat.executeQuery(sql_record);
						
						//CHART 1 -------------------------
						out.write("<applet code=\"Manager.PieChart.PiechartApplet.class\" archive=\"../sAheevaChart.jar\" width=\""
									+ diagramWidth + "\" height=\"" + diagramHeight + "\" mayscript name=\"graphApplet\">");
						out.write( buildChart(pageData.getWord("Per record status"), _Dials ));						
												
						buildChartString = "";
						while( rs_clStats.next() ){
							nbColonnes++;
							tmp1 	+= "<PARAM name=\"pie" + pos + "label" + nbColonnes + "\" value=\"" + pageData.getWord(rs_clStats.getString("COL_LABEL"))+"\">";
							tmp2 	+= "<PARAM name=\"segment"+nbColonnes+"\" value=\""+(100+nbColonnes*10)+","+(130+nbColonnes*10)+","+(150+nbColonnes*10)+"|"+rs_clStats.getString("COL_LABEL")+"\">";
							tmp3 	+= "<PARAM name=\"data"+nbColonnes+"series"+pos+"\" value=\""+rs_clStats.getString("TOTAL")+"\">";
						}
						buildChartString += "<PARAM name=\"Pie"+pos+"\" value=\"" + chartXPos + "," + chartYPos + "," 
												+ chartDiameter + "," + nbColonnes + "," + chartDetachFactor + "\">";
						buildChartString += tmp1;
						buildChartString += tmp2;						
						buildChartString += tmp3;
						out.write( buildChartString );
						out.write("</applet>");			
						
						out.write("</td></tr><tr><td align=\"center\">");
						
						sql_record = "SELECT COUNT(*) AS TOTAL, CALL_RESULT AS COL_LABEL FROM `"+table_name+"` GROUP BY CALL_RESULT";
						nbColonnes = 0;
						tmp1 = "";
						tmp2 = "";
						tmp3 = "";
						pos = "1";						
						rs_clStats = stat.executeQuery(sql_record);
						
						//CHART 2 ---------------------------
						out.write("<applet code=\"Manager.PieChart.PiechartApplet.class\" archive=\"../sAheevaChart.jar\" width=\""
									+ diagramWidth + "\" height=\"" + diagramHeight + "\" mayscript name=\"graphApplet\">");						
						out.write( buildChart(pageData.getWord("Per call result"), _Dials ));	
						
						buildChartString = "";
						while( rs_clStats.next() ){
							nbColonnes++;
							tmp1 	+= "<PARAM name=\"pie"+pos+"label"+nbColonnes+"\" value=\""+pageData.getWord(rs_clStats.getString("COL_LABEL"))+"\">";
							tmp2 	+= "<PARAM name=\"segment"+nbColonnes+"\" value=\""+(90+nbColonnes*10)+","+(80+nbColonnes*10)+","+(60+nbColonnes*10)+"|"+rs_clStats.getString("COL_LABEL")+"\">";
							tmp3 	+= "<PARAM name=\"data"+nbColonnes+"series"+pos+"\" value=\"" + rs_clStats.getString("TOTAL") + "\">";
						}
						buildChartString += "<PARAM name=\"Pie"+pos+"\" value=\"" + chartXPos + "," + chartYPos + ","
												+ chartDiameter + "," + nbColonnes + "," + chartDetachFactor + "\">";
						buildChartString += tmp1;
						buildChartString += tmp2;						
						buildChartString += tmp3;
						out.write( buildChartString );
						out.write("</applet>");
						
						out.write("</td></tr><tr><td align=\"center\">");
						
						sql_record = "SELECT COUNT(*) AS TOTAL, RECORD_TYPE AS COL_LABEL FROM `"+table_name+"` GROUP BY RECORD_TYPE";
						nbColonnes = 0;
						tmp1 = "";
						tmp2 = "";
						tmp3 = "";
						pos = "1";						
						rs_clStats = stat.executeQuery(sql_record);  	
						
						//CHART 3 -----------------------------------
						out.write("<applet code=\"Manager.PieChart.PiechartApplet.class\" archive=\"../sAheevaChart.jar\" width=\""
									+ diagramWidth + "\" height=\"" + diagramHeight + "\" mayscript name=\"graphApplet\">");
					//	out.write( buildChart("<script>document.write(MultiArray[\"Per record type\"][lang]);</script>") );						
						out.write( buildChart(pageData.getWord("Per record type"), _Dials ));
						
						
						buildChartString = "";
						while( rs_clStats.next() ){
							nbColonnes++;
							tmp1 	+= "<PARAM name=\"pie"+pos+"label"+nbColonnes+"\" value=\""+pageData.getWord(rs_clStats.getString("COL_LABEL"))+"\">";
							tmp2 	+= "<PARAM name=\"segment"+nbColonnes+"\" value=\""+(255-nbColonnes*10)+","+(100+nbColonnes*10)+","+(150-nbColonnes*10)+"|"+rs_clStats.getString("COL_LABEL")+"\">";
							tmp3 	+= "<PARAM name=\"data"+nbColonnes+"series"+pos+"\" value=\""+rs_clStats.getString("TOTAL")+"\">";
						}
						buildChartString += "<PARAM name=\"Pie"+pos+"\" value=\"" + chartXPos + "," + chartYPos + "," 
												+ chartDiameter + "," + nbColonnes + "," + chartDetachFactor + "\">";
						buildChartString += tmp1;
						buildChartString += tmp2;						
						buildChartString += tmp3;
						//out.write( buildChartString( rs_clStats , "1") );
						out.write( buildChartString );
						out.write("</applet>");
						
						out.write("</td></tr><tr><td align=\"center\">");
						
						sql_record = "SELECT COUNT(*) AS TOTAL, DAYNAME(CALL_TIME) AS COL_LABEL FROM `"+table_name+"` WHERE RECORD_STATUS='Updated' and CALL_RESULT='answered' GROUP BY  DAYNAME(CALL_TIME)";
						nbColonnes = 0;
						tmp1 = "";
						tmp2 = "";
						tmp3 = "";
						pos = "1";						
						rs_clStats = stat.executeQuery(sql_record);		
						//CHART 4 -----------------------------------
						out.write("<applet code=\"Manager.PieChart.PiechartApplet.class\" archive=\"../sAheevaChart.jar\" width=\""
									+ diagramWidth + "\" height=\"" + diagramHeight + "\" mayscript name=\"graphApplet\">");
			//			out.write( buildChart("<script>document.write(MultiArray[\"Answers per day\"][lang]);</script>") );						
						out.write( buildChart(pageData.getWord("Answers per day"), _Dials ));
						
						buildChartString = "";
						while( rs_clStats.next() ){
							nbColonnes++;
							tmp1 	+= "<PARAM name=\"pie"+pos+"label"+nbColonnes+"\" value=\""+pageData.getWord(rs_clStats.getString("COL_LABEL"))+"\">";
							tmp2 	+= "<PARAM name=\"segment"+nbColonnes+"\" value=\""+(50+nbColonnes*10)+","+(100+nbColonnes*10)+","+(150+nbColonnes*10)+"|"+rs_clStats.getString("COL_LABEL")+"\">";
							tmp3 	+= "<PARAM name=\"data"+nbColonnes+"series"+pos+"\" value=\""+rs_clStats.getString("TOTAL")+"\">";
						}
						buildChartString += "<PARAM name=\"Pie"+pos+"\" value=\"" + chartXPos + "," + chartYPos + "," 
												+ chartDiameter + "," + nbColonnes + "," + chartDetachFactor + "\">";
						buildChartString += tmp1;
						buildChartString += tmp2;						
						buildChartString += tmp3;
						//out.write( buildChartString( rs_clStats , "1") );
						out.write( buildChartString );
						out.write("</applet>");
						
						out.write("</td></tr></table>");
						
						
						rs_clStats.close();
						
					}			
					
					stat.close();
            		conn.close();
				}catch(Exception e){
					e.printStackTrace();					
					stat.close();
            		conn.close();					
				}
				
			}
			
	
		
		
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t//<![CDATA[\r\n");
      out.write("\tsetupAllTabs();\r\n");
      out.write("\t//]]>\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
 pageData.closeConnection(); 
      out.write("\r\n");
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
