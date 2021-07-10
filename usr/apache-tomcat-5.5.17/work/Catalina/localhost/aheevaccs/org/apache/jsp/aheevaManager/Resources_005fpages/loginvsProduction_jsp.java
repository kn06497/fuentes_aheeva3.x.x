package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.*;
import java.lang.*;
import java.util.*;
import java.io.*;
import aheevaManager.wfm.*;
import java.util.StringTokenizer;
import aheevaManager.ressources.*;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;
import aheevaManager.ressources.*;

public final class loginvsProduction_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/aheevaManager/Resources_pages/xc2_default_labels.jsp");
    _jspx_dependants.add("/aheevaManager/Resources_pages/loginvsProduction_labels.jsp");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
beanManagerData pageLogvData = new beanManagerData();
pageLogvData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageLogvData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write('\n');
      aheevaManager.wfm.beanAgentLoginProdReport beanAgentLoginProdReportObj = null;
      synchronized (session) {
        beanAgentLoginProdReportObj = (aheevaManager.wfm.beanAgentLoginProdReport) _jspx_page_context.getAttribute("beanAgentLoginProdReportObj", PageContext.SESSION_SCOPE);
        if (beanAgentLoginProdReportObj == null){
          beanAgentLoginProdReportObj = new aheevaManager.wfm.beanAgentLoginProdReport();
          _jspx_page_context.setAttribute("beanAgentLoginProdReportObj", beanAgentLoginProdReportObj, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Login</title>\n");
      out.write("\r\n");


//if( beanAgentLoginProdReportObj == null )
	beanAgentLoginProdReportObj = new beanAgentLoginProdReport();
//else
	//System.out.println("beanAgentLoginProdReportObj already exists !");
	
beanAgentLoginProdReportObj.setTenantDBID(request.getParameter("tenant_dbid"));
String reportDate = request.getParameter("startDate");
String agentGroupId = request.getParameter("agentGroupId");
String thisDayIsClosed = request.getParameter("dayClosed");
String viewExceptions = request.getParameter("viewExceptionObj");

String fromDate = request.getParameter("dateFrom");
String toDate = request.getParameter("dateTo");

String tenant_dbid = request.getParameter("tenant_dbid");
String agentId = request.getParameter("agentId");
String submitRequest = request.getParameter("viewData");
String sessionParams = request.getParameter("sessionParams");
String submitRequest2 = request.getParameter("saveAddedRows");

StringTokenizer tok = null;
String[] agentList = null;
int numObjects = 0;


//if(sessionParams != null && sessionParams.compareTo("init") == 0)
//{
	beanAgentLoginProdReportObj.hasExtractData = false;
    beanAgentLoginProdReportObj.m_gAllDetails.clear();
	beanAgentLoginProdReportObj.m_AllExceptions.clear();
//}


      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("\r\n");
      out.write("<!-- -->\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" /> \r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" /> \r\n");
      out.write("<link rel=\"stylesheet\" href=\"xc2_default.css\" type=\"text/css\">\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<meta http-equiv=\"Content-Language\" content=\"en-us\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("}\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write("body {\r\n");
      out.write("\tmargin:\t\t10px;\r\n");
      out.write("\twidth:\t\t100%;\r\n");
      out.write("\theight:\t\t100%;\r\n");
      out.write("\t\r\n");
      out.write("\tbackground-color: #b8ced9;\r\n");
      out.write("\tbackground-image: url(../img/rep_body.png);\r\n");
      out.write("\tbackground-repeat: repeat-x;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control h2 {\r\n");
      out.write("\ttext-align:\tcenter;\r\n");
      out.write("\twidth:\t\t100%;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control h2 a {\r\n");
      out.write("\tdisplay:\tinline;\r\n");
      out.write("\twidth:\t\t100%;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control a:hover {\r\n");
      out.write("\tbackground: transparent;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
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
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("<script src=\"./prototype.js\"></script>\r\n");
      out.write("<!-- Calendrier début -->\r\n");
      out.write('\r');
      out.write('\n');

beanManagerData pageVsProData = new beanManagerData();
pageVsProData .openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageVsProData .setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var VsPro= new Array();\r\n");
      out.write("VsPro[0]=\"");
      out.print(pageVsProData.getWord("Don't forget to select an override cause") );
      out.write("\";\r\n");
      out.write("VsPro[1]=\"");
      out.print(pageVsProData.getWord("Please enter a date for report") );
      out.write("\";\r\n");
      out.write("VsPro[2]=\"");
      out.print(pageVsProData.getWord("Please select a group") );
      out.write("\";\r\n");
      out.write("VsPro[3]=\"");
      out.print(pageVsProData.getWord("Please select an agent") );
      out.write("\";\r\n");
      out.write("VsPro[4]=\"");
      out.print(pageVsProData.getWord("Do you really want to close this day") );
      out.write("\";\r\n");
      out.write("VsPro[5]=\"");
      out.print(pageVsProData.getWord("Agent ID") );
      out.write("\";\r\n");
      out.write("VsPro[6]=\"");
      out.print(pageVsProData.getWord("Last name") );
      out.write("\";\r\n");
      out.write("VsPro[7]=\"");
      out.print(pageVsProData.getWord("Agent group") );
      out.write("\";\r\n");
      out.write("VsPro[8]=\"");
      out.print(pageVsProData.getWord("First name") );
      out.write("\";\r\n");
      out.write("VsPro[9]=\"");
      out.print(pageVsProData.getWord("Activity") );
      out.write("\";\r\n");
      out.write("VsPro[10]=\"");
      out.print(pageVsProData.getWord("Paid time") );
      out.write("\";\r\n");
      out.write("VsPro[11]=\"");
      out.print(pageVsProData.getWord("Comments") );
      out.write("\";\r\n");
      out.write("VsPro[12]=\"");
      out.print(pageVsProData.getWord("Delete") );
      out.write("\";\r\n");
      out.write("VsPro[13]=\"");
      out.print(pageVsProData.getWord("Select") );
      out.write("\";\r\n");
      out.write("VsPro[14]=\"");
      out.print(pageVsProData.getWord("You must select an activity for each row, please verify") );
      out.write("\";\r\n");
      out.write("VsPro[15]=\"");
      out.print(pageVsProData.getWord("You must enter a paid time for each row, and respect the format. Please verify !") );
      out.write("\";\r\n");
      out.write("VsPro[16]=\"");
      out.print(pageVsProData.getWord("Login time") );
      out.write("\";\r\n");
      out.write("VsPro[17]=\"");
      out.print(pageVsProData.getWord("Not paid NRR time") );
      out.write("\";\r\n");
      out.write("VsPro[18]=\"");
      out.print(pageVsProData.getWord("Extra paid NRR time") );
      out.write("\";\r\n");
      out.write("VsPro[19]=\"");
      out.print(pageVsProData.getWord("Total paid time") );
      out.write("\";\r\n");
      out.write("VsPro[20]=\"");
      out.print(pageVsProData.getWord("Select a date") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageVsProData.closeConnection(); 
      out.write("\r\n");
      out.write("<script language=\"javascript\" src=\"xc2_default.js\"></script>\r\n");
      out.write("<script language=\"javascript\">xcAutoHide=1000;</script>\r\n");
      out.write("<script language=\"javascript\" src=\"xc2_inpage.js\"></script>\r\n");
      out.write("<!-- Calendrier fin -->\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"loginvsProduction.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("var tenant_dbid  = normalizeString(QueryString('tenant_dbid'));\r\n");
      out.write("var startDate = normalizeString(QueryString(\"startDate\"));\r\n");
      out.write("var agentGroupId = normalizeString(QueryString(\"agentGroupId\"));\r\n");
      out.write("var agentId = normalizeString(QueryString(\"agentId\"));\r\n");
      out.write("var dataExtracted = normalizeString(QueryString(\"viewData\")); //alert(\"data extracted:  \"+dataExtracted);\r\n");
      out.write("var userid = appletObj.getCurrentUserDBID();\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function fillCombos()\r\n");
      out.write("{\r\n");
      out.write("\tdocument.getElementById('agtGrp').disabled = false;\r\n");
      out.write("\tfillObjectCombo(document.getElementById('agtGrp'), document.getElementById('objects'), document.getElementById('Checkbox2'));\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function getSelectedAgents()\r\n");
      out.write("{\r\n");
      out.write("\r\n");
      out.write("\tselectedObjects = new Array();\r\n");
      out.write("\tfor (i=document.agentHours.objects.selectedIndex;i<document.agentHours.objects.options.length;i++) {\r\n");
      out.write("  \t\tif (document.agentHours.objects.options[i].selected) {\r\n");
      out.write("  \t\t\tselectedObjects[selectedObjects.length]=document.agentHours.objects.options[i].value;\r\n");
      out.write("\t\t\tif(i==0)//all agents \r\n");
      out.write("\t\t\t\tbreak;\r\n");
      out.write("  \t\t}\r\n");
      out.write("  \t}\r\n");
      out.write("        var url = '';\r\n");
      out.write("\tif (selectedObjects.length > 0)\r\n");
      out.write("\t{\r\n");
      out.write("\t\turl= escape(selectedObjects.join('/'));\r\n");
      out.write("\t}\r\n");
      out.write("   // alert(\"agent list : \" + url);\r\n");
      out.write("\treturn url;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");

out.write("<script>agentGroupId = '"+agentGroupId+"'</script>");
//out.write("<script>agentId = '"+agentId+"'</script>");
out.write("<script>tenant_dbid = '"+tenant_dbid+"'</script>");
out.write("<script>dataExtracted = '"+submitRequest+"'</script>");
out.write("<script>startDate = '"+reportDate+"'</script>");


      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body  class=\"rep_body\" onLoad=\"fillCombos()\">\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"agentHours\"  action=\"./loginvsProduction.jsp\" method=\"post\"  >\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t  <div class=\"tab-page\" id=\"searchoptions\">\r\n");
      out.write("\t  \t<h2 class=\"tab\">");
      out.print( pageLogvData.getWord("Daily hours"));
      out.write("</h2>\n");
      out.write("\r\n");
      out.write("\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\ttp1.addTabPage( document.getElementById( \"searchoptions\" ) );\r\n");
      out.write("\t\t\t</script>\r\n");
      out.write("\t\t\t<fieldset>\r\n");
      out.write("\t\t\t\t<legend>");
      out.print( pageLogvData.getWord("Search options"));
      out.write("</legend>\n");
      out.write("\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\" width=\"1455\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td height=\"25\" colspan=\"4\">&nbsp;\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"276\" height=\"23\" style=\"border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageLogvData.getWord("Select a date"));
      out.write(" </b>\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t\t<td width=\"9\" ></td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"288\" style=\"border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" size=\"15\" onFocus=\"showCalendar('',this,this,'','id_reportDate',0,30,1);this.blur()\" onChange=\"");
 sessionParams = "init";
      out.write("\" name=\"reportDate\" value=\"");
if((submitRequest != null) && submitRequest.compareTo("true") == 0) out.write(reportDate); else out.write("");
      out.write("\"/>\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"907\">\r\n");
      out.write("\t\t\t\t\t\t\t<input disabled id=\"saveModified2\"  name=\"saveModified\" type=\"button\" style=\"visibility:visible;\" value=\"");
      out.print( pageLogvData.getWord("Save modified"));
      out.write("\" onClick=\"saveTheModified()\">\n");
      out.write("\t\t\t\t\t\t\t<input disabled id=\"closeThisDay\"  name=\"closeThisDay\" type=\"button\" style=\"visibility:visible;\" value=\"");
      out.print( pageLogvData.getWord("Close this day"));
      out.write("\" onClick=\"closeTheDay()\">&nbsp;&nbsp;<!--onClick=\"/*validatePassword();*/\"-->\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"276\" height=\"23\" style=\"border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageLogvData.getWord("Select an agent group"));
      out.write("</b>\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t\t<td width=\"9\" ></td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"288\" style=\"border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t\t<select id=\"agtGrp\" name=\"agtGrp\" onChange=\"javascript:getAgentsInGroup(this,document.agentHours.objects,document.agentHours.Checkbox2)\" class=\"contentText\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"AllGroups\">- ");
      out.print( pageLogvData.getWord("All groups"));
      out.write(" -</option>\n");
      out.write("\t\t\t\t\t\t\t</select>\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td valign=\"middle\" >&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageLogvData.getWord("Show agent by ID"));
      out.write(" <input type=\"checkbox\" name=\"viewckbox\" onClick=\"javascript:changeAgentListView(document.agentHours.agtGrp, document.agentHours.objects, this);\" id=\"Checkbox2\"></b>\n");
      out.write("\t\t\t\t\t\t\t<script>//document.write(\"<input id=\\\"viewAgentsHours\\\"  name=\\\"viewAgentsHours\\\" type=\\\"button\\\"  value=\\\"\"+MultiArray[\"View data\"][lang]+\"\\\" onClick=\\\"extractAllData()\\\">\");</script>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"276\" height=\"23\" style=\"border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageLogvData.getWord("Select an agent"));
      out.write("</b>\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t\t<td width=\"9\" ></td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"288\" id=\"id_reportDate\" style=\"border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<select id=\"objects\" name=\"objects\" multiple=\"multiple\" class=\"contentText\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"AllAgents\" selected>- ");
      out.print( pageLogvData.getWord("All agents"));
      out.write(" -</option>\n");
      out.write("\t\t\t\t\t\t\t</select>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td valign=\"top\">\r\n");
      out.write("\t\t    <input id=\"viewAgentsHours\"  name=\"viewAgentsHours\" type=\"button\"  value=\"");
      out.print( pageLogvData.getWord("View data"));
      out.write("\" onClick=\"extractAllData()\">\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td height=\"25\" colspan=\"4\">&nbsp;\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t \t\t</table>\r\n");
      out.write("  \t\t\t</fieldset>\r\n");
      out.write("\t\t\t");


			//String userid = request.getParameter("userid");
			String userid = (String)session.getAttribute("CURRENT_USER_DBID");
			String userinfo = beanAgentLoginProdReportObj.getUserInfo(userid);
			String username = "", userrole = "";
			if(userinfo.indexOf("|") != -1)
			{
				username = userinfo.substring(0, userinfo.indexOf("|"));
				userrole = userinfo.substring(userinfo.indexOf("|")+1, userinfo.length());
			}

			String strToInsert = request.getParameter("strToInsertCell");
			String strToUpdate = request.getParameter("strToUpdateCell");

			if ((strToInsert == null && strToUpdate == null) || (strToInsert.compareTo("") == 0 && strToUpdate.compareTo("") == 0))
			{
			}
			else
			{
				String runningDate = request.getParameter("startDate");
				beanAgentLoginProdReportObj.saveAgentHours(userid, runningDate, strToInsert, strToUpdate, thisDayIsClosed);
				beanAgentLoginProdReportObj.hasExtractData = false;
			}
			if ((submitRequest != null) && submitRequest.compareTo("true") == 0)
			{
			
      out.write("\r\n");
      out.write("\t\t\t<div  style=\"margin-right:20px \">\r\n");
      out.write("\t\t\t<table border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t  <tr>\r\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"100\"><b>");
      out.print( pageLogvData.getWord("Agent ID"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"200\"><b>");
      out.print( pageLogvData.getWord("Last name"));
      out.write(',');
      out.print( pageLogvData.getWord("First name"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"150\"><b>");
      out.print( pageLogvData.getWord("Agent group"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Activity"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Login time"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Paid time"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"80\"><b>");
      out.print( pageLogvData.getWord("Override"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Correction"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Override time"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"150\"><b>");
      out.print( pageLogvData.getWord("Override cause"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"150\"><b>");
      out.print( pageLogvData.getWord("Custom cause"));
      out.write("</b></td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t");

			}
			
      out.write("\r\n");
      out.write("\t\t\t<div id=\"tabDailyHours\" style=\"overflow:scroll; height:500px\"> <!--  style=\"display:none \">-->\r\n");
      out.write("\t\t\t\t");

				java.util.Vector allAgentsData = new Vector();
				if ((submitRequest != null) && submitRequest.compareTo("true") == 0)
				{
					reportDate = request.getParameter("startDate");
					agentGroupId = request.getParameter("agentGroupId");
					System.out.println("Inside tab DailyHours: -------------- agentGroupId: "+ agentGroupId);
					String agentIdInput = request.getParameter("agentId");
					System.out.println("agentId list: "+agentIdInput);
					boolean include_agents = true;
					
							
					//parse the input string of agent ids
					if(agentIdInput != ""){
						tok = new java.util.StringTokenizer(agentIdInput,"/");
					}else{
						tok = new java.util.StringTokenizer("","/");
					}
					numObjects = tok.countTokens();
					
					if(numObjects>0)
					{
						agentList = new String[numObjects];
						
						for (int w =0; w < numObjects; w++)
						{
							agentList[w] = tok.nextToken();
							System.out.println("agentId: "+agentList[w]);
						}
					}
					else
					{agentList[0] = "";}
					
					
					//Liste des agents actifs
					if (beanAgentLoginProdReportObj.hasExtractData == false)
					{
						String valeurRetour = beanAgentLoginProdReportObj.buildAgentGroupLoginProdReport(reportDate, include_agents);
						beanAgentLoginProdReportObj.calculateOverPaidNRR(reportDate);
						beanAgentLoginProdReportObj.calculateBillableNRRTime(reportDate);
						beanAgentLoginProdReportObj.hasExtractData = true;
					}
				}
				allAgentsData = (Vector)beanAgentLoginProdReportObj.m_gAllDetails;
				System.out.println("allAgentsData - size: "+allAgentsData.size());
				
				if(allAgentsData.size() > 0)
				{
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\t\tdocument.getElementById(\"closeThisDay\").disabled = false;\r\n");
      out.write("\t\t\t\t\t\tdocument.getElementById(\"saveModified2\").disabled = false;\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t");

				}
				
				beanAgentLoginProdInfo anAgentActivityData = new beanAgentLoginProdInfo();
				java.util.Vector agentsData = new Vector();
				
				//Filter by agent group and agent id ------------------------------------------
				
				if (agentId.compareTo("AllAgents") == 0 && agentGroupId.compareTo("AllGroups") == 0 )
				{
					for (int i = 0; i < allAgentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
						agentsData.add( anAgentActivityData );
					}
				}
				else if(agentId.compareTo("AllAgents") == 0 && agentGroupId.compareTo("AllGroups") != 0 )// 1 group, all agents
 				{
					for (int i = 0; i < allAgentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
						if (anAgentActivityData.grp_id.compareTo(agentGroupId) == 0)
							agentsData.add( anAgentActivityData );
					}
				}
				else if(agentId.compareTo("AllAgents") != 0 && agentGroupId.compareTo("AllGroups") == 0)//all groups, not all agents
				{
					for(int w=0; w < numObjects; w++)
					{
						for (int i = 0; i < allAgentsData.size(); i++)
						{
							anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
							if (anAgentActivityData.agt_id.compareTo(agentList[w]) == 0)
							{
								agentsData.add( anAgentActivityData );
							}
						}
					}//for(w=0; w<agentList.length(); w++)
				}
				else // 1 group, 1 or more agents
				{
					for(int w=0; w < numObjects; w++)
					{
						for (int i = 0; i < allAgentsData.size(); i++)
						{
							anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
							if (anAgentActivityData.grp_id.compareTo(agentGroupId) == 0 && anAgentActivityData.agt_id.compareTo(agentList[w]) == 0)
							{
								agentsData.add( anAgentActivityData );
							}
						}
					}//for(w=0; w<agentList.length(); w++)
				}//else
				// end filtering -----------------------------------------------
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<table border=\"0\">\r\n");
      out.write("\t\t\t\t\t");

					String id_suff = "", already_modified = "", not_already_modified = "", supermodified = "";
					for (int i = 0; i < agentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)agentsData.elementAt(i);
						id_suff = anAgentActivityData.agt_id + "_" + anAgentActivityData.grp_id + "_" + anAgentActivityData.activity_type;
						if(anAgentActivityData.dayClosed == 0) // la journée est encore en cours
						{
							if (anAgentActivityData.override == 1)
								already_modified += id_suff + "|";
							else
								not_already_modified += id_suff + "|";
						}
						if(anAgentActivityData.dayClosed == 1) // la journée est déjà fermée
						{
							supermodified += id_suff + "|";
						}
					  if(i%2 ==0) {
					  
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t<tr class=\"reportsRowPair\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t\t\t  ");

					  } else {
					  
      out.write("\r\n");
      out.write("\t\t\t\t  \t  <tr class=\"reportsRowUnPair\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("                     ");

					 }
					 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" id=\"agentId_");
      out.print(id_suff);
      out.write("\" width=\"100\">");
      out.print(anAgentActivityData.agt_id);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"200\">\r\n");
      out.write("\t\t\t\t\t\t\t<script type='text/javascript'>document.write(\"<a href='../jsp/events_details.jsp?agentId=");
      out.print(anAgentActivityData.agt_id);
      out.write("&curDate=");
      out.print(reportDate);
      out.write("&lang=\" + lang + \"' target='_blank'>\");</script>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
out.write(anAgentActivityData.last_name + ", " + anAgentActivityData.first_name); 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"150\">");
      out.print(anAgentActivityData.grp_name);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\" >");
      out.print(anAgentActivityData.activity_name);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\">\r\n");
      out.write("\t\t\t\t\t\t  <input type=\"text\" id=\"logintime");
      out.print(id_suff);
      out.write("\" name=\"logintime");
      out.print(id_suff);
      out.write("\" size=\"10\" value=\"");
      out.print(anAgentActivityData.getTotalLoginTime());
      out.write("\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\"\r\n");
      out.write("\t\t\t\t\t\t\t onMouseOver=\"showPaidTimeDetails('");
      out.print(anAgentActivityData.agt_id);
      out.write("', '");
      out.print(anAgentActivityData.name);
      out.write("', '");
      out.print(anAgentActivityData.getTotalLoginTime());
      out.write("', '");
      out.print(anAgentActivityData.getNotPaidNRRTime());
      out.write("', '");
      out.print(anAgentActivityData.getOverPaidNRRTime());
      out.write("', '");
      out.print(anAgentActivityData.getTotalPaidTime());
      out.write("', 1)\"\r\n");
      out.write("\t\t\t\t\t\t\t onMouseOut=\"showPaidTimeDetails('");
      out.print(anAgentActivityData.agt_id);
      out.write("', '");
      out.print(anAgentActivityData.name);
      out.write("', '");
      out.print(anAgentActivityData.getTotalLoginTime());
      out.write("', '");
      out.print(anAgentActivityData.getNotPaidNRRTime());
      out.write("', '");
      out.print(anAgentActivityData.getOverPaidNRRTime());
      out.write("', '");
      out.print(anAgentActivityData.getTotalPaidTime());
      out.write("', 0)\"\r\n");
      out.write("\t\t\t\t\t\t\t >\r\n");
      out.write("\t\t\t\t\t\t\t ");

							 long paid_temp = 0, override_temp = 0;
							 if (anAgentActivityData.totalLoginTime > 0)
							 {
							    paid_temp = anAgentActivityData.totalLoginTime - anAgentActivityData.totalNotPaidNRRTime - anAgentActivityData.overPaidNRR;
								if (anAgentActivityData.override == 1)
									override_temp = paid_temp + anAgentActivityData.totalCorrectionTime;
								else
									override_temp = 0;
							 }
							 else
							 {
							    paid_temp = anAgentActivityData.totalPaidTime;
								if (anAgentActivityData.override == 1)
									override_temp = paid_temp + anAgentActivityData.totalCorrectionTime;
								else
									override_temp = 0;
							 }
							 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"paidtime");
      out.print(id_suff);
      out.write("\" name=\"paidtime");
      out.print(id_suff);
      out.write("\" size=\"10\" value=\"");
      out.print(anAgentActivityData.buildReadableTime(paid_temp)/*getTotalPaidTime()*/);
      out.write("\" disabled >\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" id=\"billabletime");
      out.print(id_suff);
      out.write("\" name=\"billabletime");
      out.print(id_suff);
      out.write("\" value=\"");
      out.print(anAgentActivityData.getTotalBillableTime());
      out.write("\" >\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" id=\"notpaidnrrtime");
      out.print(id_suff);
      out.write("\" name=\"notpaidnrrtime");
      out.print(id_suff);
      out.write("\" value=\"");
      out.print(anAgentActivityData.totalNotPaidNRRTime);
      out.write("\" >\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" id=\"overpaidnrrtime");
      out.print(id_suff);
      out.write("\" name=\"overpaidnrrtime");
      out.print(id_suff);
      out.write("\" value=\"");
      out.print(anAgentActivityData.overPaidNRR);
      out.write("\" >\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"80\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"checkoverride");
      out.print(id_suff);
      out.write("\" name=\"checkoverride");
      out.print(id_suff);
      out.write("\" onClick=\"enableOverrideTime(this.id);\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t ");
if (anAgentActivityData.override == 1) out.write("checked"); else out.write(""); 
      out.write(' ');
if (anAgentActivityData.dayClosed == 1) out.write("disabled");
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\">\r\n");
      out.write("\t\t\t\t\t\t  <input type=\"text\" id=\"correctiontime");
      out.print(id_suff);
      out.write("\" name=\"correctiontime");
      out.print(id_suff);
      out.write("\" size=\"10\" onFocus=\"this.select()\" onBlur=\"buildOverrideTime(this.id, this.value);buildCorrectionTime(this.id, this.value)\" value=\"");
      out.print(anAgentActivityData.getTotalCorrectionTime());
      out.write("\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\">\r\n");
      out.write("\t\t\t\t\t\t  <input type=\"text\" id=\"overridetime");
      out.print(id_suff);
      out.write("\" name=\"overridetime");
      out.print(id_suff);
      out.write("\" size=\"10\" value=\"");
      out.print(anAgentActivityData.buildReadableTime(override_temp)/*getTotalOverrideTime()*/);
      out.write("\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"150\">\r\n");
      out.write("\t\t\t\t\t\t  <select name=\"selectoverridecause");
      out.print(id_suff);
      out.write("\" id=\"selectoverridecause");
      out.print(id_suff);
      out.write("\" onChange=\"viewOverrideCause(this.id)\" disabled>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"No comments\">");
      out.print( pageLogvData.getWord("Select"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Starphone crash\">");
      out.print( pageLogvData.getWord("Starphone crash"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Fire alarm\">");
      out.print( pageLogvData.getWord("Fire alarm"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Computer crash\">");
      out.print( pageLogvData.getWord("Computer crash"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Power failure\">");
      out.print( pageLogvData.getWord("Power failure"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Agent displacement\">");
      out.print( pageLogvData.getWord("Agent displacement"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Sent Home (3hrs paid)\">");
      out.print( pageLogvData.getWord("Sent Home (3hrs paid)"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"First day integration\">");
      out.print( pageLogvData.getWord("First day integration"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Floor support\">");
      out.print( pageLogvData.getWord("Floor support"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"HR interview\">");
      out.print( pageLogvData.getWord("HR interview"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Other\"> ");
      out.print( pageLogvData.getWord("Other"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t  </select>\r\n");
      out.write("\t\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"150\">\r\n");
      out.write("\t\t\t\t\t\t\t<input  style=\"visibility:hidden\" type=\"text\" id=\"overridecause");
      out.print(id_suff);
      out.write("\" name=\"overridecause");
      out.print(id_suff);
      out.write("\" size=\"18\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t\t\t");

						 out.write("<script>displayOverrideCause('" + id_suff + "', '" + anAgentActivityData.comments + "'); </script>");
					  } // fin for
					  out.write("<script>hideLoadingDiv(); </script>	");
					  out.write("<script>chaine1 = '" + not_already_modified + "'; </script>	");
					  out.write("<script>chaine2 = '" + already_modified + "'; </script>	");
					  out.write("<script>chaine3 = '" + supermodified + "'; </script>	");
					  
      out.write("\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t <table>\r\n");
      out.write("\t\t\t\t\t \t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"agentGroupId\" name=\"agentGroupId\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"agentId\" name=\"agentId\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"startDate\" name=\"startDate\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"viewData\" name=\"viewData\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"tenant_dbid\" name=\"tenant_dbid\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"type\" name=\"type\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"userid\" name=\"userid\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"strToUpdateCell\" name=\"strToUpdateCell\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"strToInsertCell\" name=\"strToInsertCell\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"saveAddedRows\" name=\"saveAddedRows\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"sessionParams\" name=\"sessionParams\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"dayClosed\" name=\"dayClosed\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"dateFrom\" name=\"dateFrom\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"dateTo\" name=\"dateTo\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input id=\"viewExceptionObj\" name=\"viewExceptionObj\" type=\"hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"paidTimeDetails\" >  </div>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"tab-page\" id=\"addRow\" >\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageLogvData.getWord("Add a row"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\ttp1.addTabPage( document.getElementById( \"addRow\" ) );\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t");

			//userid = request.getParameter("userid");
			userid = (String)session.getAttribute("CURRENT_USER_DBID");
			if ((submitRequest2 != null) && submitRequest2.compareTo("true") == 0)
			{
				strToInsert = request.getParameter("strToInsert");
				strToUpdate = request.getParameter("strToUpdate");
				if ((strToInsert == null && strToUpdate == null) || (strToInsert.compareTo("") == 0 && strToUpdate.compareTo("") == 0))
				{
				}
				else
				{
					String runningDate2 = request.getParameter("startDate2");
					beanAgentLoginProdReportObj.saveAgentHours(userid, runningDate2, strToInsert, strToUpdate, thisDayIsClosed);
					beanAgentLoginProdReportObj.hasExtractData = false;
				}
			}

		
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t<table border=\"0\" width=\"80%\" cellpadding=\"2\" cellspacing=\"0\" style=\"border-collapse: collapse\">\r\n");
      out.write("\t\t\t\t<tr>\t\t\t\r\n");
      out.write("\t\t\t\t\t<td style=\"border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"agtGrp2\"><b>");
      out.print( pageLogvData.getWord("Select an agent group"));
      out.write("</b></label>\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td colspan=\"2\" align=\"left\">  \r\n");
      out.write("\t\t\t\t\t\t<select name=\"agtGrp2\" id=\"agtGrp2\" onChange=\"javascript:getAgentsInGroup(this, document.agentHours.objects2, document.agentHours.viewckbox2)\" class=\"contentText\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"AllGroups\">- ");
      out.print( pageLogvData.getWord("All groups"));
      out.write(" -</option>\n");
      out.write("\t\t\t\t\t\t</select>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\t\t\t\r\n");
      out.write("\t\t\t\t\t<td><label for=\"objects2\"><b>");
      out.print( pageLogvData.getWord("Select an agent"));
      out.write("</b></label></td>\n");
      out.write("\t\t\t\t\t<td align=\"left\" >\r\n");
      out.write("\t\t\t\t\t\t<select id=\"objects2\" name=\"objects2\" class=\"contentText\" >\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"AllAgents\">- ");
      out.print( pageLogvData.getWord("All agents"));
      out.write(" -</option>\n");
      out.write("\t\t\t\t\t\t</select>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t    <td align=\"left\">\t\t\r\n");
      out.write("\t\t\t\t\t\t<label for\"viewckbox2\"><b>");
      out.print( pageLogvData.getWord("Show agent by ID"));
      out.write("</b></label>\n");
      out.write("\t\t\t\t\t\t<input type=\"checkbox\" id=\"viewckbox2\" name=\"viewckbox2\" onClick=\"javascript:changeAgentListView(document.agentHours.agtGrp2, document.agentHours.objects2, this)\">\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t  <td><label for=\"reportDate2\"><b>");
      out.print( pageLogvData.getWord("Select a date"));
      out.write("</b></label></td>\n");
      out.write("\t\t\t\t  <td align=\"left\" style=\"border-top-style: none; border-top-width: 1\" colspan=\"5\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" size=\"15\" onFocus=\"showCalendar('',this,this,'','id_reportDate2',0,30,1);this.blur()\" name=\"reportDate2\" id=\"reportDate2\" value=\"\"/>\t\t\t\t  </td>\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t<td style=\"border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"addARow\"  name=\"addARow\" type=\"button\" style=\"visibility:visible;\" value=\"");
      out.print( pageLogvData.getWord("Add a row"));
      out.write("\" onClick=\"addMyRow(document.agentHours.agtGrp2,document.agentHours.objects2, document.agentHours.viewckbox2)\">\t</td>\n");
      out.write("\t\t\t\t\t\t\t<td valign=\"middle\">\r\n");
      out.write("\t\t\t\t\t\t\t<input disabled id=\"saveRows\"  name=\"saveRows\" type=\"button\" style=\"visibility:visible;\" value=\"");
      out.print( pageLogvData.getWord("Save rows"));
      out.write("\" onClick=\"saveMyRows()\">\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t\t</table>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div id=\"divAddARow\" > \r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"exception\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageLogvData.getWord("Exceptions"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\ttp1.addTabPage( document.getElementById( \"exception\" ) );\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\" width=\"1625\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td height=\"25\" colspan=\"4\">&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"47\" height=\"23\" style=\"border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1\">&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"11\" ></td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"299\" style=\"border-top-style: none; border-top-width: 1\">&nbsp;<b>");
      out.print( pageLogvData.getWord("Select start date"));
      out.write("</b>\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" size=\"15\" onFocus=\"showCalendar('',this,this,'','id_fromDate',0,30,1);this.blur()\" name=\"fromDate\" id=\"fromDate\" value=\"\"/>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<td width=\"948\">&nbsp;<b>");
      out.print( pageLogvData.getWord("Select stop date"));
      out.write("</b>\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" size=\"15\" onFocus=\"showCalendar('',this,this,'','id_toDate',0,30,1);this.blur()\" name=\"toDate\" id=\"toDate\" value=\"\" />\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td height=\"25\">&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"47\" height=\"23\" style=\"border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1\">&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"11\" ></td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"299\" style=\"border-top-style: none; border-top-width: 1\">&nbsp;&nbsp;&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t<td valign=\"middle\" >&nbsp;\r\n");
      out.write("\t\t\t\t\t\t<input id=\"displayExceptions\"  name=\"displayExceptions\" type=\"button\" style=\"visibility:visible;\" value=\"");
      out.print( pageLogvData.getWord("View exceptions"));
      out.write("\" onClick=\"viewExceptions()\">&nbsp;&nbsp;\n");
      out.write("\t\t\t\t\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t<!--<a href=\"./Exceptions.csv\"><script>document.write(MultiArray[\"Right-click to download\"][lang]);</script></a>-->\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t \t\t</table>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t\t\t");

			
			String strToWrite = "";
			
			if ((viewExceptions != null) && viewExceptions.compareTo("true") == 0)
			{
			
      out.write("\r\n");
      out.write("\t\t\t<div  style=\"margin-right:20px \">\r\n");
      out.write("\t\t\t<table border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t  <tr>\r\n");
      out.write("\t\t\t  \t<td align=\"center\" width=\"100\"><b>");
      out.print( pageLogvData.getWord("Date"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"100\"><b>");
      out.print( pageLogvData.getWord("Agent ID"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"200\"><b>");
      out.print( pageLogvData.getWord("Last name"));
      out.write(',');
      out.print( pageLogvData.getWord("First name"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"150\"><b>");
      out.print( pageLogvData.getWord("Agent group"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Activity"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Login time"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Paid time"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Correction"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"125\"><b>");
      out.print( pageLogvData.getWord("Override time"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"150\"><b>");
      out.print( pageLogvData.getWord("Override cause"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"150\"><b>");
      out.print( pageLogvData.getWord("Custom cause"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" width=\"150\"><b>");
      out.print( pageLogvData.getWord("Override by"));
      out.write("</b></td>\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t");

				strToWrite = "Date,AgentID,Name,Agent Group,Activity,Login Time,Paid Time,Correction,Override Time,Override cause,Override by\r\n";
			}
			
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div id=\"exceptionDiv\" style=\"overflow:scroll; height:500px\"> \r\n");
      out.write("\t\t\t\t");

				if ((viewExceptions != null) && viewExceptions.compareTo("true") == 0)
				{
					fromDate = request.getParameter("dateFrom");
					toDate = request.getParameter("dateTo");
					if (fromDate.compareTo("") != 0 && toDate.compareTo("") != 0) 
						beanAgentLoginProdReportObj.getExceptionsRecords(fromDate, toDate );
				}
				java.util.Vector exceptionData = (Vector)beanAgentLoginProdReportObj.m_AllExceptions;
				anAgentActivityData = new beanAgentLoginProdInfo();
				
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("        <table height=\"54\" border=\"0\">\r\n");
      out.write("          \t\t\t\t");

					
					id_suff = "";
					for (int i = 0; i < exceptionData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)exceptionData.elementAt(i);
						
						id_suff = anAgentActivityData.agt_id + "_" + anAgentActivityData.grp_id + "_" + anAgentActivityData.activity_type;
						  if(i%2 ==0) {
						  
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t<tr class=\"reportsRowPair\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t\t\t\t  ");

						  } else {
						  
      out.write("\r\n");
      out.write("\t\t\t\t  \t    <tr class=\"reportsRowUnPair\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t\t\t\t ");

						 }
						 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"100\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(anAgentActivityData.event_date);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" id=\"agentId_");
      out.print(id_suff);
      out.write("\" width=\"100\">");
      out.print(anAgentActivityData.agt_id);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"200\">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"../jsp/events_details.jsp?agentId=");
      out.print(anAgentActivityData.agt_id);
      out.write("&curDate=");
      out.print(reportDate);
      out.write("\" target=\"_blank\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
out.write(anAgentActivityData.last_name + ", " + anAgentActivityData.first_name); 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"150\">");
      out.print(anAgentActivityData.grp_name);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\" >");
      out.print(anAgentActivityData.activity_name);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\">\r\n");
      out.write("\t\t\t\t\t\t  <input type=\"text\" id=\"logintime");
      out.print(id_suff);
      out.write("\" name=\"logintime");
      out.print(id_suff);
      out.write("\" size=\"10\" value=\"");
      out.print(anAgentActivityData.getTotalLoginTime());
      out.write("\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\"\r\n");
      out.write("\t\t\t\t\t\t\t onMouseOver=\"showPaidTimeDetails('");
      out.print(anAgentActivityData.agt_id);
      out.write("', '");
      out.print(anAgentActivityData.name);
      out.write("', '");
      out.print(anAgentActivityData.getTotalLoginTime());
      out.write("', '");
      out.print(anAgentActivityData.getNotPaidNRRTime());
      out.write("', '");
      out.print(anAgentActivityData.getOverPaidNRRTime());
      out.write("', '");
      out.print(anAgentActivityData.getTotalPaidTime());
      out.write("', 1)\" \r\n");
      out.write("\t\t\t\t\t\t\t onMouseOut=\"showPaidTimeDetails('");
      out.print(anAgentActivityData.agt_id);
      out.write("', '");
      out.print(anAgentActivityData.name);
      out.write("', '");
      out.print(anAgentActivityData.getTotalLoginTime());
      out.write("', '");
      out.print(anAgentActivityData.getNotPaidNRRTime());
      out.write("', '");
      out.print(anAgentActivityData.getOverPaidNRRTime());
      out.write("', '");
      out.print(anAgentActivityData.getTotalPaidTime());
      out.write("', 0)\"\r\n");
      out.write("\t\t\t\t\t\t\t >\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"paidtime");
      out.print(id_suff);
      out.write("\" name=\"paidtime");
      out.print(id_suff);
      out.write("\" size=\"10\" value=\"");
      out.print(anAgentActivityData.getTotalPaidTime());
      out.write("\" disabled >\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" id=\"billabletime");
      out.print(id_suff);
      out.write("\" name=\"billabletime");
      out.print(id_suff);
      out.write("\" value=\"");
      out.print(anAgentActivityData.getTotalBillableTime());
      out.write("\" >\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\">\r\n");
      out.write("\t\t\t\t\t\t  <input type=\"text\" id=\"correctiontime");
      out.print(id_suff);
      out.write("\" name=\"correctiontime");
      out.print(id_suff);
      out.write("\" size=\"10\" onFocus=\"this.select()\" onBlur=\"buildOverrideTime(this.id, this.value);buildReadableTime(this.id, this.value)\" value=\"");
      out.print(anAgentActivityData.getTotalCorrectionTime());
      out.write("\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"125\">\r\n");
      out.write("\t\t\t\t\t\t  <input type=\"text\" id=\"overridetime");
      out.print(id_suff);
      out.write("\" name=\"overridetime");
      out.print(id_suff);
      out.write("\" size=\"10\" value=\"");
      out.print(anAgentActivityData.getTotalOverrideTime());
      out.write("\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"150\">");
//=anAgentActivityData.comments
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  <select name=\"selectoverridecause");
      out.print(id_suff);
      out.write("\" id=\"selectoverridecause");
      out.print(id_suff);
      out.write("\" onChange=\"viewOverrideCause(this.id)\" disabled>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"No comments\">");
      out.print( pageLogvData.getWord("Select"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"System failure\">");
      out.print( pageLogvData.getWord("System failure"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Working at Fido\">");
      out.print( pageLogvData.getWord("Working at Fido"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Starphone crash\">Starphone crash</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Fire alarm\">Fire alarm</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Computer crash\">Computer crash</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Power failure\">Power Failure</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Agent displacement\">Agent displacement</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Sent Home (3hrs paid)\">Sent Home (3hrs paid)</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"First day integration\">First day integration</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Floor support\">Floor support</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"HR interview\">HR interview</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"Other\">");
      out.print( pageLogvData.getWord("Other"));
      out.write("</option>\n");
      out.write("\t\t\t\t\t\t  </select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"150\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"overridecause");
      out.print(id_suff);
      out.write("\" name=\"overridecause");
      out.print(id_suff);
      out.write("\" size=\"18\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t");

						String nom = "";
						String userInfo = beanAgentLoginProdReportObj.getUserInfo(anAgentActivityData.acknowledged_by);
						
						if(userInfo.indexOf("|") != -1)
						{
							nom = userInfo.substring(0, userInfo.indexOf("|"));
						}
						
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"150\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"ack_by");
      out.print(id_suff);
      out.write("\" name=\"ack_by");
      out.print(id_suff);
      out.write("\" size=\"18\" value=\"");
out.write(nom);
      out.write("\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t\t\t");

						 out.write("<script>displayOverrideCause('" + id_suff + "', '" + anAgentActivityData.comments + "'); </script>");
						 
						 strToWrite += anAgentActivityData.event_date + ", " + anAgentActivityData.agt_id + ", " + anAgentActivityData.last_name + " " + 
						 				anAgentActivityData.first_name + ", " + anAgentActivityData.grp_name + ", " + anAgentActivityData.activity_name + ", " + 
										anAgentActivityData.getTotalLoginTime() + ", " + anAgentActivityData.getTotalPaidTime() + ", " + 
										anAgentActivityData.getTotalCorrectionTime() + ", " + anAgentActivityData.getTotalOverrideTime() + ", " + 
										anAgentActivityData.comments + ", " + nom + "\r\n";
										
					  } // fin for

						//String strPath = "../webapps/aheevaccs/Manager/Resources_pages/Exceptions.csv";	//VOICI LA LIGNE 	QUI CAUSE LE BUG
						String strPath="Exceptions.csv";
						File strFile = new File(strPath);
						FileWriter myWriter = new FileWriter(strFile);
						BufferedWriter objWriter = new BufferedWriter(myWriter);	
						objWriter.write(strToWrite);	
						objWriter.flush();	
						objWriter.close();
					  
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"summary\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageLogvData.getWord("Summary"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\ttp1.addTabPage( document.getElementById( \"summary\" ) );\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t<legend>");
      out.print( pageLogvData.getWord("View agent groups hours summary"));
      out.write("</legend>\n");
      out.write("\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t<tr border=\"1\" class=\"reportsTabName\" style=\"border-collapse:collapse \" bordercolor=\"#CCCCCC\">\r\n");
      out.write("\t\t\t<td align=\"center\" width=\"20%\"><b>");
      out.print( pageLogvData.getWord("Name"));
      out.write("</b></td>\n");
      out.write("\t\t\t<td align=\"center\" width=\"35%\"><b>");
      out.print( pageLogvData.getWord("Queue"));
      out.write("</b></td>\n");
      out.write("\t\t\t<td align=\"center\" width=\"15%\"><b>");
      out.print( pageLogvData.getWord("Login time"));
      out.write("</b></td>\n");
      out.write("\t\t\t<td align=\"center\" width=\"15%\"><b>");
      out.print( pageLogvData.getWord("Paid time"));
      out.write("</b></td>\n");
      out.write("\t\t\t<td align=\"center\" width=\"15%\"><b>");
      out.print( pageLogvData.getWord("Billable"));
      out.write("</b></td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");

			if ((submitRequest != null) && submitRequest.compareTo("true") == 0)
			{
				reportDate = request.getParameter("startDate");
				agentGroupId = request.getParameter("agentGroupId");
				System.out.println("Inside tab Summary: ----- agentGroupId: "+ agentGroupId);
				Vector summaryVector = beanAgentLoginProdReportObj.getSummary( agentGroupId, reportDate);
				beanAgentLoginProdInfo c = new beanAgentLoginProdInfo();
				System.out.println("summaryVector-size: "+summaryVector.size());
				for(int n=0; n < summaryVector.size(); n++){
					beanAgentLoginProdReport.hoursSummary data = (beanAgentLoginProdReport.hoursSummary)summaryVector.elementAt(n);
					if (n%2 == 0)
					{
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr class=\"reportsRowUnPair\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"20%\">");
      out.print(data.name);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"35%\">");
      out.print(data.queue);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"15%\">");
      out.print(c.buildReadableTime(data.login_time));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"15%\">");
      out.print(c.buildReadableTime(data.paid_time));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"15%\">");
      out.print(c.buildReadableTime(data.billable_time));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

					}
					if (n%2 == 1)
					{
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr class=\"reportsRowPair\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"20%\">");
      out.print(data.name);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"35%\">");
      out.print(data.queue);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"15%\">");
      out.print(c.buildReadableTime(data.login_time));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"15%\">");
      out.print(c.buildReadableTime(data.paid_time));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" width=\"15%\">");
      out.print(c.buildReadableTime(data.billable_time));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

					}
				}

		
      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t");

			}
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("<script>\r\n");
      out.write("\t//fillObjectCombo(document.agentHours.agtGrp, document.agentHours.objects, document.agentHours.viewckbox);\r\n");
      out.write("\tfillObjectCombo(document.agentHours.agtGrp2, document.agentHours.objects2, document.agentHours.viewckbox2);\r\n");
      out.write("</script>\r\n");

out.write("<script>selectObject(document.getElementById('agtGrp'), '"+agentGroupId +"');</script>");


if ( ((submitRequest != null) && submitRequest.compareTo("true") == 0) || ((viewExceptions != null) && viewExceptions.compareTo("true") == 0))
{

      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tdocument.getElementById(\"agtGrp\").disabled = false;\r\n");
      out.write("\t//getAgentsInGroup(document.agentHours.agtGrp, document.agentHours.objects, document.agentHours.viewckbox)\r\n");
      out.write("</script>\r\n");

}
else
{

      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tdocument.getElementById(\"agtGrp\").disabled = true;\r\n");
      out.write("</script>\r\n");


}
//out.write("<script>selectObject(document.getElementById('objects'), '"+agentId +"');</script>");

      out.write("\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"bulleDiv\" style=\" background-image:url(../img/callout_box.gif); visibility: hidden; position:absolute; left:0px; top:0px; width:283px; height:120px;\" >\r\n");
      out.write("</div>\r\n");
      out.write("\t<div class=\"TempMessages\" id=\"TempMessages\"> \r\n");
      out.write("\t  <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\">\r\n");
      out.write("\t\t<tr> \r\n");
      out.write("\t\t  <td width=\"100%\" id=\"TempMsg\" align=\"center\"> </td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t  </table>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<script>\r\n");
      out.write("//window.open('./example.csv','formWindow');\r\n");
      out.write("</script>\r\n");
 pageLogvData.closeConnection(); 
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
