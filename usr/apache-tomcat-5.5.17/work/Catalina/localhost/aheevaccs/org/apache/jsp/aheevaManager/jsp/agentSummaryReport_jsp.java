package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.lang.*;
import aheevaManager.reports.*;
import aheevaManager.schedule.*;
import java.io.*;
import java.io.File;
import java.io.RandomAccessFile;
import java.io.FileNotFoundException;
import java.io.IOException;
import aheevaManager.csvinterface.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.lang.*;
import aheevaManager.reports.*;
import aheevaManager.schedule.*;
import java.io.*;
import java.io.File;
import java.io.RandomAccessFile;
import java.io.FileNotFoundException;
import java.io.IOException;
import aheevaManager.csvinterface.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.lang.*;
import aheevaManager.reports.*;
import aheevaManager.schedule.*;
import java.io.*;
import java.io.File;
import java.io.RandomAccessFile;
import java.io.FileNotFoundException;
import java.io.IOException;
import aheevaManager.csvinterface.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;

public final class agentSummaryReport_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/jsp/agentSummaryReportsDetails.jsp");
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

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\r\n");
      out.write("\t\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n");
      out.write("<html>\r\n");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageSumData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSumData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageSumData.openConnection();
    
      out.write("\n");
      out.write("<LINK href=\"../Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Agent Summary Reports</title>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/style_2.css\" />\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("\t/*width:      550px;*/\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("\tbackground: #E1F4FF;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t40px;\r\n");
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
      out.write(".imgControl {\r\n");
      out.write("\ttop: 1;\r\n");
      out.write("\tposition:\t\trelative;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      aheevaManager.reports.beanAgentGlobalInfoReport beanAgent = null;
      synchronized (request) {
        beanAgent = (aheevaManager.reports.beanAgentGlobalInfoReport) _jspx_page_context.getAttribute("beanAgent", PageContext.REQUEST_SCOPE);
        if (beanAgent == null){
          beanAgent = new aheevaManager.reports.beanAgentGlobalInfoReport();
          _jspx_page_context.setAttribute("beanAgent", beanAgent, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

	String language =request.getParameter("lang");
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
	String reportSummary =request.getParameter("reportSummary");
	String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_year_yearly = request.getParameter("starting_year_yearly");
    String ending_year_yearly = request.getParameter("ending_year_yearly");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String groupOrLeader  = request.getParameter("objects");
    StringTokenizer tok = null, tokGrpOrLead=null;
	String[] tabObj =null;
    beanAgentGlobalInfo agentInfo = null;
	String from ="";
    if(groupOrLeader != null){
        tok = new java.util.StringTokenizer(groupOrLeader,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    String grpOrLead = "",mygrpOrLead="";
	String grpOrLeadTemp ="", grpOrLeadName ="", grpOrLeadId="";

	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
	}
	String agentId ="";
	String startingDate="", endingDate="", sret="";
    if(reportType.compareTo("Daily") ==0){
		startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
		endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    }else if (reportType.compareTo("Monthly") ==0)
	{
		startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
		endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;					
    }else if (reportType.compareTo("Yearly") == 0){
		startingDate = starting_year_yearly + "-01-01" + " 00:00:00" ;
		endingDate = ending_year_yearly + "-12-31"+ " 23:59:59" ;
    }
	

      out.write("\r\n");
      out.write("<div class=\"img-control\">\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printAgentSummaryReport.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ;
      out.write("&starting_year_yearly=");
out.write(starting_year_yearly) ;
      out.write("&ending_year_yearly=");
out.write(ending_year_yearly) ;
      out.write("&starting_month_monthly=");
out.write(starting_month_monthly) ;
      out.write("&starting_year_monthly=");
out.write(starting_year_monthly) ;
      out.write("&ending_month_monthly=");
out.write(ending_month_monthly) ;
      out.write("&ending_year_monthly=");
out.write(ending_year_monthly) ;
      out.write("&reportType=");
out.write(reportType) ;
      out.write("&objects=");
out.write(groupOrLeader) ;
      out.write("&reportSummary=");
 out.write(reportSummary) ;
      out.write("&prec=");
 out.write(prec) ;
      out.write("&suiv=");
 out.write(suiv) ;
      out.write("&current=");
 out.write(current) ;
      out.write("&all_obj=");
 out.write(all_obj) ;
      out.write("&from=");
 out.write("agentLoginReport") ;
      out.write("&lang=");
 out.write(language); 
      out.write("')\"><img src=\"../img/printer.gif\" border=\"0\"></button>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"agentSummaryReport.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ;
      out.write("&starting_year_yearly=");
out.write(starting_year_yearly) ;
      out.write("&ending_year_yearly=");
out.write(ending_year_yearly) ;
      out.write("&starting_month_monthly=");
out.write(starting_month_monthly) ;
      out.write("&starting_year_monthly=");
out.write(starting_year_monthly) ;
      out.write("&ending_month_monthly=");
out.write(ending_month_monthly) ;
      out.write("&ending_year_monthly=");
out.write(ending_year_monthly) ;
      out.write("&reportType=");
out.write(reportType) ;
      out.write("&objects=");
out.write(groupOrLeader) ;
      out.write("&reportSummary=");
 out.write(reportSummary) ;
      out.write("&prec=");
 out.write(new_prec) ;
      out.write("&suiv=");
 out.write(current) ;
      out.write("&current=");
 out.write(prec) ;
      out.write("&all_obj=0&lang=");
out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print(pageSumData.getWord("Previous"));
      out.write("</a>\t\t</td>\n");
      out.write("\t\t\r\n");
      out.write("\t");

	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"agentSummaryReport.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ;
      out.write("&starting_year_yearly=");
out.write(starting_year_yearly) ;
      out.write("&ending_year_yearly=");
out.write(ending_year_yearly) ;
      out.write("&starting_month_monthly=");
out.write(starting_month_monthly) ;
      out.write("&starting_year_monthly=");
out.write(starting_year_monthly) ;
      out.write("&ending_month_monthly=");
out.write(ending_month_monthly) ;
      out.write("&ending_year_monthly=");
out.write(ending_year_monthly) ;
      out.write("&reportType=");
out.write(reportType) ;
      out.write("&objects=");
out.write(groupOrLeader) ;
      out.write("&reportSummary=");
 out.write(reportSummary) ;
      out.write("&prec=-1&suiv=1&current=0&all_obj=1&lang=");
out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print(pageSumData.getWord("All"));
      out.write("</a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	String nb_obj = Integer.toString(numObjects);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"agentSummaryReport.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ;
      out.write("&starting_year_yearly=");
out.write(starting_year_yearly) ;
      out.write("&ending_year_yearly=");
out.write(ending_year_yearly) ;
      out.write("&starting_month_monthly=");
out.write(starting_month_monthly) ;
      out.write("&starting_year_monthly=");
out.write(starting_year_monthly) ;
      out.write("&ending_month_monthly=");
out.write(ending_month_monthly) ;
      out.write("&ending_year_monthly=");
out.write(ending_year_monthly) ;
      out.write("&reportType=");
out.write(reportType) ;
      out.write("&objects=");
out.write(groupOrLeader) ;
      out.write("&reportSummary=");
 out.write(reportSummary) ;
      out.write("&prec=");
 out.write(current) ;
      out.write("&suiv=");
 out.write(new_suiv) ;
      out.write("&current=");
 out.write(suiv) ;
      out.write("&all_obj=0&lang=");
out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print(pageSumData.getWord("Next"));
      out.write("</a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<!--<table width=\"100%\"><tr><td width=\"100%\" height=\"30\"></td></tr></table>-->\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\r\n");
      out.write("<form name=\"summaryReports\">\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t<fieldset>\r\n");


System.out.println("debut form");
System.out.println("current value == "+ current);
System.out.println("prec value == "+ prec);
System.out.println("suiv value == "+ suiv);
System.out.println("reportSummary value == "+ reportSummary);
System.out.println("groupOrLeader value == "+ groupOrLeader);

if(all_obj.compareTo("0")==0) // one group or leader
{
System.out.println("all_obj==0");
	grpOrLeadTemp = tabObj[Integer.parseInt(current)];
	if(reportSummary.compareTo("leader")==0)
	{
		grpOrLeadId = grpOrLeadTemp;//new java.util.StringTokenizer(grpOrLeadTemp,"^");
		System.out.println("Summary report for group or leader :  [ "+grpOrLeadId +" ]" );
	}
	if(reportSummary.compareTo("group")==0)
	{
		
		tokGrpOrLead = new java.util.StringTokenizer(grpOrLeadTemp,",");
		grpOrLeadName =tokGrpOrLead.nextToken();
		grpOrLeadId = tokGrpOrLead.nextToken();
		System.out.println("Summary report for group or leader : " + grpOrLeadName + " [ "+grpOrLeadId +" ]" );
	}
	
	 beanAgent.buildAgentSummaryInfosForPeriod(grpOrLeadId,startingDate,endingDate, reportSummary);
	
      out.write('\r');
      out.write('\n');
      out.write('	');
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageSumdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSumdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageSumdData.openConnection();
    
      out.write('\r');
      out.write('\n');

long tLoginTime=0 ,totLoginTime=0;
long scheduledTime =0,totscheduledTime=0;
int n_no =0, totn_no=0, n_yes=0, totn_yes =0;
long n_inbound =0, totn_inbound=0, n_outbound=0, totn_outbound =0;
long n_WrapUp =0, totn_WrapUp =0 ;
long ssTotTalkTimeInbound = 0 ,totTalkTimeInbound = 0;
long ssTotTalkTimeOutbound = 0 ,totTalkTimeOutbound = 0;
long ssTotWrapUp = 0 , totWrapUp =0;
long tot_non_prod_wrap = 0, tot_non_prod_nrr=0;
long non_prod_wrap = 0, non_prod_nrr=0;

long ssTotSingleTransfert = 0 ,totSingleTransfert = 0;
long ssTotTwoTransfert = 0 ,totTwoTransfert = 0;
long ssTotTransfert = 0 , totTransfert =0;
long n_Transfet = 0 , totn_transfert =0;


long ssTotHold = 0 , totHold = 0 ;
long ssTotWait = 0 , totWait = 0 ;
long n_Hold = 0 , totn_Hold = 0 ;
long n_Wait = 0 , totn_Wait = 0 ;

long ssTotNotReady = 0 , totNotReady =0;
long n_NotReady = 0 , totn_NotReady =0;
String percentGap="0.00%", percentAdherence ="0.00%";
String percentNRR="0.00%", percentTransfert ="0.00%";
String callsPerHour="0.00%";
String productivity="" ;
String avgHandle="00:00:00";
String avgWrapUp="00:00:00";

String avgNRR="00:00:00";
String avgInbound="00:00:00";
String avgOutbound="00:00:00";
String avgTransfert="00:00:00";
String avgHold="00:00:00";
String avgWait="00:00:00";

String percentOutIn="0.00%";
String percentOut="0.00%";
String percentIn="0.00%";
String tempGrpOrLeader_name="", writeName="";
long GroupForAgent =1, first =1;
long total = 0;
double NbCallsPerHour =0;
agentInfo =null;
HashMap map_Agent_forProduc = (HashMap)beanAgent.map_Agent_forProduc;
HashMap map_AgentSummaryNRR = (HashMap)beanAgent.map_AgentSummaryNRR;


      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var lang =normalizeString(QueryString('lang'));\n");
      out.write("</script>\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t\t  <b>\n");
      out.write("\t\t\t\t\t\t\t");

								try { 
								if(reportSummary.compareTo("leader")==0)
									out.write(beanAgent.getLeaderName(grpOrLeadId)); 
								if(reportSummary.compareTo("group")==0)
									out.write(beanAgent.getGroupName(grpOrLeadId)); 
									}
								catch(Exception e) { out.write(""); }
							
      out.write('[');
      out.write(' ');
      out.write(' ');
 out.println(grpOrLeadId); 
      out.write(" \t ]\n");
      out.write("\t\t\t\t\t  </b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageSumdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageSumdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageSumdData.getWord("Yearly"));
								}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageSumdData.getWord("Summary report"));
      out.write(" &nbsp; ");
      out.print(pageSumdData.getWord("for"));
      out.write("<br><br>\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(pageSumdData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							pageSumdData.getWord("Data")
							);
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t  <td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t  \t<td width=\"19%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Agent name"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Scheduled"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Actual"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Inbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Outbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Wrap up calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Hold calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Waiting calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Not ready calls"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write(" \t\t<tr class=\"reportsNRRCol\">\n");
      out.write(" \t\t\t<td align=\"center\">");
out.write(" ");
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(" ");
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(" ");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t  </tr>\n");
      out.write("\t\t\t  \n");

	for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) {
			 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
			if(agentInfo !=null) 
			{
		
      out.write("\n");
      out.write("\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.last_name+", "+agentInfo.first_name+" ["+agentInfo.agent_id+"] ");
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getScheduled());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_Inbound));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_Outbound));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalWrapUpInTime+ agentInfo.totalWrapUpOutTime)));
      out.write("</td>\n");
      out.write("\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_hold));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalHoldTime)));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_Wait));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalWaitTime)));
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_single_transfer + agentInfo.n_two_step_transfer));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalSingleTransfer +agentInfo.totalTwoStepTranfer)));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_NotReady));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalNotReadyTime)));
      out.write("</td>\n");
      out.write("\t\t  </tr>\n");
      out.write("\t\t  ");

		
        tLoginTime += agentInfo.totalLoginTime;   totLoginTime+= agentInfo.totalLoginTime;
		scheduledTime +=agentInfo.Scheduled ; totscheduledTime  +=agentInfo.Scheduled ;
		//n_no += agentInfo.n_no ; totn_no += agentInfo.n_no; 
		//n_yes +=agentInfo.n_yes;  totn_yes+=agentInfo.n_yes;
		n_inbound +=agentInfo.n_Inbound; totn_inbound +=agentInfo.n_Inbound;
		n_outbound +=agentInfo.n_Outbound;  totn_outbound +=agentInfo.n_Outbound; 
		ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound; totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
		ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
		
		ssTotWrapUp += agentInfo.totalWrapUpInTime ; totWrapUp += agentInfo.totalWrapUpInTime;
		ssTotWrapUp += agentInfo.totalWrapUpOutTime ; totWrapUp += agentInfo.totalWrapUpOutTime;
		n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
		totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
		
		ssTotTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		totTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		n_Transfet += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
		totn_transfert += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;

		ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
		n_NotReady += agentInfo.n_NotReady ; totn_NotReady += agentInfo.n_NotReady;
		
		totHold += agentInfo.totalHoldTime;		totn_Hold+= agentInfo.n_hold;
		totWait += agentInfo.totalWaitTime;		totn_Wait += agentInfo.n_Wait;	
		first =0; 
 		tempGrpOrLeader_name= agentInfo.grpOrLeader_name;
		}		
    } //end for
	agentInfo = new beanAgentGlobalInfo();
	if(agentInfo !=null) 
	{

      out.write("\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b>");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(scheduledTime));
      out.write("</b></font></td>\n");
      out.write("\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>\n");
      out.write("\t\t\t \n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_inbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_outbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_WrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totWrapUp));
      out.write("</b></font></td>\n");
      out.write("\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_Hold ));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totHold));
      out.write("</b></font></td> \n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_Wait));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totWait));
      out.write("</b></font></td>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_transfert));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTransfert));
      out.write("</b></font></td> \n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_NotReady));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totNotReady));
      out.write("</b></font></td>\n");
      out.write("\t\t</tr>\n");


	}
	else
	{
	
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t\n");
      out.write("\t");

	}

      out.write("\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");

							out.write(pageSumdData.getWord("Average"));
					tLoginTime =0;   totLoginTime=0;
					scheduledTime =0; totscheduledTime  =0;
					n_inbound =0; totn_inbound =0;
					n_outbound =0;  totn_outbound =0;
					ssTotTalkTimeInbound =0; totTalkTimeInbound =0;
					ssTotTalkTimeOutbound =0;totTalkTimeOutbound =0;
					ssTotWrapUp =0; totWrapUp =0;
					ssTotWrapUp =0; totWrapUp =0;
					n_WrapUp =0; totn_WrapUp =0;
					ssTotTransfert =0; totTransfert =0;	n_Transfet =0;totn_transfert =0;
					ssTotNotReady =0; totNotReady =0;n_NotReady =0; totn_NotReady =0;
					ssTotHold=0; totHold =0;
						tot_non_prod_wrap=0; tot_non_prod_nrr=0;
					
					ssTotWait =0 ; totWait = 0 ;
					n_Hold = 0; totn_Hold = 0 ;
					n_Wait = 0 ; totn_Wait = 0 ;
	
					first =0; 
					tempGrpOrLeader_name= "";	
								
							
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t  <td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t  \t<td width=\"20%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Agent name"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Inbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Outbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Wrap up time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Hold time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Handling time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Transfer time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Not ready time"));
      out.write("</td>\n");
      out.write("\t\t\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\n");

	for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) {
			 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
			if(agentInfo !=null) 
			{
		
      out.write("\n");
      out.write("\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.last_name+", "+agentInfo.first_name+" ["+agentInfo.agent_id+"] ");
      out.write("</td>\n");
      out.write("\t\t\t<!--<td align=\"center\">");
//out.write(agentInfo.getScheduled());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
//out.write(agentInfo.buildReadableTime((agentInfo.totalLoginTime)));
      out.write("</td>-->\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.getAvgTalktimeInbound());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgTalktimeOutbound());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgWrapUpTime());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgTalktimeHold());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgHandlingTime());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgWaitingTime());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgTransferTime());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgNotReadyTime() );
      out.write("</td>\n");
      out.write("\t\t\t\n");
      out.write("\t\t  </tr>\n");
      out.write("\t\t  ");

		
        tLoginTime += agentInfo.totalLoginTime;   totLoginTime+= agentInfo.totalLoginTime;
		scheduledTime +=agentInfo.Scheduled ; totscheduledTime  +=agentInfo.Scheduled ;
		//n_no += agentInfo.n_no ; totn_no += agentInfo.n_no; 
		//n_yes +=agentInfo.n_yes;  totn_yes+=agentInfo.n_yes;
		n_inbound +=agentInfo.n_Inbound; totn_inbound +=agentInfo.n_Inbound;
		n_outbound +=agentInfo.n_Outbound;  totn_outbound +=agentInfo.n_Outbound; 
		ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound; totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
		ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
		
		ssTotWrapUp += agentInfo.totalWrapUpInTime ; totWrapUp += agentInfo.totalWrapUpInTime;
		ssTotWrapUp += agentInfo.totalWrapUpOutTime ; totWrapUp += agentInfo.totalWrapUpOutTime;
		n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
		totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
		tot_non_prod_wrap += agentInfo.non_prod_wrap;
		tot_non_prod_nrr += agentInfo.non_prod_nrr;
		
		ssTotTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		totTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		n_Transfet += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
		totn_transfert += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;

		ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
		n_NotReady += agentInfo.n_NotReady ; totn_NotReady += agentInfo.n_NotReady;
		
		totHold += agentInfo.totalHoldTime;		totn_Hold+= agentInfo.n_hold;
		totWait += agentInfo.totalWaitTime;		totn_Wait += agentInfo.n_Wait;	
		
		first =0; 
 		tempGrpOrLeader_name= agentInfo.grpOrLeader_name;
		}		
    } //end for
	agentInfo = new beanAgentGlobalInfo();
	if(agentInfo !=null) 
	{
		
		avgHandle="00:00:00";avgWrapUp="00:00:00";
		avgNRR="00:00:00";avgInbound="00:00:00";
		avgOutbound="00:00:00";avgTransfert="00:00:00";

		total = totn_inbound + totn_outbound;
		if(total > 0)
			avgHandle = agentInfo.buildReadableTime( (totTalkTimeInbound + totTalkTimeOutbound + totWrapUp + totHold) / total);
		if (total > 0)
		  avgWrapUp = agentInfo.buildReadableTime( totWrapUp/total);
		if (totn_NotReady > 0)
		  avgNRR = agentInfo.buildReadableTime( totNotReady / totn_NotReady);
		if (totn_inbound > 0)
		  avgInbound = agentInfo.buildReadableTime( totTalkTimeInbound / totn_inbound);
		if (totn_outbound > 0)
		  avgOutbound = agentInfo.buildReadableTime( totTalkTimeOutbound / totn_outbound);
		if (totn_transfert > 0)
		  avgTransfert = agentInfo.buildReadableTime( totTransfert / totn_transfert);
		if(total >0)
			avgHold = agentInfo.buildReadableTime( totHold / total);
		if(totn_Wait >0)
			avgWait = agentInfo.buildReadableTime( totWait / totn_Wait);


      out.write("\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t <!--<td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
//out.write(agentInfo.buildReadableTime(scheduledTime));
      out.write("</font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
//out.write(agentInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>-->\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(avgInbound);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgOutbound);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgWrapUp);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgHold);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgHandle);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgWait);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgTransfert);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgNRR);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t</tr>\n");


	}
	else
	{
	
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b>");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t <!--<td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
//out.write("00:00:00");
      out.write("</font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
//out.write("00:00:00");
      out.write("</b></font></td>-->\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t\n");
      out.write("\t");

	}

      out.write("\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageSumdData.getWord("Percentages"));
					tLoginTime =0;   totLoginTime=0;
					scheduledTime =0; totscheduledTime  =0;
					n_inbound =0; totn_inbound =0;
					n_outbound =0;  totn_outbound =0;
					ssTotTalkTimeInbound =0; totTalkTimeInbound =0;
					ssTotTalkTimeOutbound =0;totTalkTimeOutbound =0;
					ssTotWrapUp =0; totWrapUp =0;
					ssTotWrapUp =0; totWrapUp =0;
					n_WrapUp =0; totn_WrapUp =0;
					ssTotTransfert =0; totTransfert =0;	n_Transfet =0;totn_transfert =0;
					ssTotNotReady =0; totNotReady =0;n_NotReady =0; totn_NotReady =0;
					ssTotHold=0; totHold =0;		
					first =0; 
					tempGrpOrLeader_name= "";	
					long totWrapUpForProduc =0;
					long totNrrForProduc=0;
					long totlogForProduc=0;
								
							
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t  <td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t  \t<td width=\"20%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Agent name"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Scheduled"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Actual"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Adherence"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("GAP"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Productivity"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Calls out/Calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Calls in/Calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Not ready"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");

			for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) 
			{
					 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
					if(agentInfo !=null) 
					{
					String key="";
					productivity="";
					key = agentInfo.agent_id;
					//System.out.println("\n************** key----: "+ key);
					//beanAgentGlobalInfoReport.agentData tmpNrrElt = (beanAgentGlobalInfoReport.agentData)map_Agent_forProduc.get(key);

						if(agentInfo !=null)
						{
							if(agentInfo.totalLoginTime >0)
							{
								productivity =agentInfo.formatDecimalDouble(100*(1-((double)(agentInfo.non_prod_wrap)+(double)(agentInfo.non_prod_nrr))/ (double)agentInfo.totalLoginTime),2)+" %";
							}
							totWrapUpForProduc +=agentInfo.non_prod_wrap;
							totNrrForProduc +=agentInfo.non_prod_nrr;
							totlogForProduc +=agentInfo.totalLoginTime;
						}

					
      out.write("\n");
      out.write("\t\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
								else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.last_name+", "+agentInfo.first_name+" ["+agentInfo.agent_id+"] ");
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getScheduled());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalLoginTime)));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td  align=\"center\">");
out.write(agentInfo.getAdherence());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentActualScheduledLogin());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(productivity);
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getCallPerHour());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentOut());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentIn());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentTransferTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentNotReadyTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t  </tr>\n");
      out.write("\t\t\t\t\t  ");

		
				tLoginTime += agentInfo.totalLoginTime;   totLoginTime+= agentInfo.totalLoginTime;
				scheduledTime +=agentInfo.Scheduled ; totscheduledTime  +=agentInfo.Scheduled ;
				n_no += agentInfo.n_no ; totn_no += agentInfo.n_no; 
				n_yes +=agentInfo.n_yes;  totn_yes+=agentInfo.n_yes;
				n_inbound +=agentInfo.n_Inbound; totn_inbound +=agentInfo.n_Inbound;
				n_outbound +=agentInfo.n_Outbound;  totn_outbound +=agentInfo.n_Outbound; 
				ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound; totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
				ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
				
				ssTotWrapUp += agentInfo.totalWrapUpInTime ; totWrapUp += agentInfo.totalWrapUpInTime;
				ssTotWrapUp += agentInfo.totalWrapUpOutTime ; totWrapUp += agentInfo.totalWrapUpOutTime;
				n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
				totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
				
				ssTotTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
				totTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
				n_Transfet += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
				totn_transfert += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
		
				ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
				n_NotReady += agentInfo.n_NotReady ; totn_NotReady += agentInfo.n_NotReady;
				
				ssTotHold += agentInfo.totalHoldTime; totHold += agentInfo.totalHoldTime;
				
				first =0; 
				tempGrpOrLeader_name= agentInfo.grpOrLeader_name;
				}		
			} //end for
			
			agentInfo = new beanAgentGlobalInfo();
			if(agentInfo !=null) 
			{
				percentGap="0.00%"; percentAdherence ="0.00%";callsPerHour="0.00%";
				 productivity="0.00" ;
				 percentOutIn="0.00%"; 
				 percentOut="0.00%"; 
				 percentIn="0.00%"; 
				 percentNRR="0.00%"; percentTransfert ="0.00%";
		
				//System.out.println("agentInfo no null");	
				total = totn_inbound + totn_outbound;
				if (totn_no + totn_yes > 0) 
				  percentAdherence = agentInfo.formatDecimalDouble((( (double)totn_yes * 100) / (totn_yes + totn_no)), 2) + " %";
				if (totscheduledTime > 0) 
					percentGap = agentInfo.formatDecimalDouble(((double) ( (totLoginTime - totscheduledTime) * 100) / totscheduledTime ), 2) + " %";					
				if (totLoginTime > 3600) 
				  NbCallsPerHour = (double) total / ( (double) totLoginTime / 3600);
				else  
				  NbCallsPerHour = total;
				callsPerHour = agentInfo.formatDecimalDouble( (NbCallsPerHour + 0.005), 2);
				if(totLoginTime >0)
				{
					//productivity =agentInfo.formatDecimalDouble(100*(1-((double)(totWrapUp+totNotReady)/ (double)totLoginTime)),2)+" %";
					percentNRR = agentInfo.formatDecimalDouble((( (double)totNotReady * 100) / (totLoginTime)), 2) + " %";
					percentTransfert = agentInfo.formatDecimalDouble((( (double)totTransfert * 100) / (totLoginTime)), 2) + " %";
				}
				if (total > 0) {
				  percentOut = agentInfo.formatDecimalDouble((( (double) totn_outbound * 100) / total), 2) + " %";
				  percentIn = agentInfo.formatDecimalDouble((( (double) totn_inbound * 100) / total), 2) + " %";
				}
					if(totLoginTime >0)
					{
						productivity =agentInfo.formatDecimalDouble(100*(1-((double)(totWrapUpForProduc+totNrrForProduc)/ (double)totLoginTime)),2)+" %";
					}
			
		
      out.write("\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(scheduledTime));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentAdherence);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentGap);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(productivity );
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(callsPerHour);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentOut);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentIn);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentTransfert);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentNRR);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t");

		
			}
			else
			{
			
      out.write("\n");
      out.write("\t\t\t\t\t <tr>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t");

			}
		
      out.write("\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\t\t\t\t  \n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\n");
      out.write("\t\t\t\t\t  ");

								out.write(pageSumdData.getWord("Not ready reason"));
								long [] totNotReadyReason =null;
								long [] tot_nNotReadyReason =null;
								percentNRR="";
								totNotReady =0; totn_NotReady =0;
   								int nb_NRR = beanAgent.m_vAllNRR.size();
								String lg_table="";
								if(nb_NRR < 6) lg_table = Integer.toString(100 -(6-nb_NRR)*10)+"%";
								else  lg_table = Integer.toString(100)+"%";
							
      out.write("\n");
      out.write("\t\t\t\t\t</b></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"");
out.write(lg_table);
      out.write("\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
      out.print(pageSumdData.getWord("Agent name"));
      out.write(" </td>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t");

				   totNotReadyReason = new long[beanAgent.m_vAllNRR.size()];
				   tot_nNotReadyReason = new long[beanAgent.m_vAllNRR.size()];
				   
					for(int k =0; k < beanAgent.m_vAllNRR.size(); k++)
					{ 
						//creer autant de variable que de raison
					  totNotReadyReason[k]=0;
					   tot_nNotReadyReason[k] =0;
					  
					
      out.write(" \n");
      out.write("\t\t\t\t\t\t<td width=\"6%\" colspan=\"3\" align=\"center\" style=\"border-style:solid; border-right-color: #949494\">");
      out.print(beanAgent.m_vAllNRR.elementAt(k) );
      out.write("</td>\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  \n");
      out.write("\t\t\t  <tr class=\"reportsNRRCol\">\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
 out.write(" "); 
      out.write("</td>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t");

					for(int k =0; k < beanAgent.m_vAllNRR.size(); k++)
					{ 
					
      out.write(" \n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid;border-right-color:#CCCCCC\">");
 out.write("Time"); 
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write("Nb"); 
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid;border-right-color: #949494\">");
 out.write(" % "); 
      out.write("</td>\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
				 if(agentInfo !=null) 
				 {
				totNotReady += agentInfo.totalNotReadyTime ;
		
      out.write("\n");
      out.write("\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
out.write(beanAgent.getAgentFullName(agentInfo.agent_id)+" ["+agentInfo.agent_id+"] ");
      out.write("</td>\n");
      out.write("\t\t\t\t");

					for (int n = 0; n < beanAgent.m_vAllNRR.size(); n++) 
					{ 
						String key="";
						String nreadyreason = (String)beanAgent.m_vAllNRR.elementAt(n);
						key = agentInfo.agent_id+"-"+ nreadyreason;
						//System.out.println("**********key************: "+key);
						beanAgentGlobalInfoReport.nrrData tmpNrrElt = (beanAgentGlobalInfoReport.nrrData)map_AgentSummaryNRR.get(key);
						if(tmpNrrElt != null)
						{
						totNotReadyReason[n] += tmpNrrElt.nrrDuration;
						tot_nNotReadyReason[n] += tmpNrrElt.nrrCount;
						
      out.write("\n");
      out.write("\t\t\t\t<td align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write( agentInfo.buildReadableTime(tmpNrrElt.nrrDuration)); 						 						
      out.write("</td>\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\"> ");
 out.write(Long.toString(tmpNrrElt.nrrCount));  
      out.write("\t</td>\t\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\"> ");
 out.write(tmpNrrElt.nrrPercent);  
      out.write("\t</td>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t");
	
						
						}
						else
						{
						totNotReadyReason[n] += 0;
						tot_nNotReadyReason[n] += 0;
						
      out.write("\n");
      out.write("\t\t\t\t<td align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write( "00:00:00"); 						 						
      out.write("</td>\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\"> ");
 out.write("0");  
      out.write("\t</td>\t\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\"> ");
 out.write("0.00");  
      out.write("\t</td>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t");
	
						
						}
			} //fin for n  
      out.write("\n");
      out.write("\t  </tr>\n");
      out.write("\t\t");

		}
	} //fin for
	agentInfo = new beanAgentGlobalInfo();
			  
		
      out.write("\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td   width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
      out.print(pageSumdData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgent.m_vAllNRR.size(); n++) 
				{ 
				if((totNotReady) !=0) 
				{
					percentNRR = agentInfo.formatDecimalDouble( ( (double)((totNotReadyReason[n])*100)/totNotReady), 2);
				}
				else 
				 percentNRR ="0.00";
				
					
      out.write("\n");
      out.write("\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( agentInfo.buildReadableTime(totNotReadyReason[n])); 
      out.write("</b></font></td>\n");
      out.write("\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ tot_nNotReadyReason[n]);  
      out.write("</b></font></td>\t\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>\n");
      out.write("\t\t\t\t  ");
 out.write(percentNRR);  
      out.write("\n");
      out.write("\t\t\t\t</b></font></td>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t");
	
					} //fin for n  
      out.write("\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("</table>\n");
 pageSumdData.closeConnection(); 
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('	');
 
}

else
{
	for(int obj =0; obj < numObjects; obj++ )
	{
		grpOrLeadTemp = tabObj[obj];
		if(reportSummary.compareTo("leader")==0)
		{
			grpOrLeadId = grpOrLeadTemp;
			System.out.println("Summary report for group or leader :  [ "+grpOrLeadId +" ]" );
		}
		if(reportSummary.compareTo("group")==0)
		{
			tokGrpOrLead = new java.util.StringTokenizer(grpOrLeadTemp,",");
			grpOrLeadName =tokGrpOrLead.nextToken();
			grpOrLeadId = tokGrpOrLead.nextToken();
			System.out.println("Summary report for group or leader : " + grpOrLeadName + " [ "+grpOrLeadId +" ]" );
		}
		 beanAgent.buildAgentSummaryInfosForPeriod(grpOrLeadId,startingDate,endingDate, reportSummary);
		
      out.write("\r\n");
      out.write("\t\t");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageSumdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSumdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageSumdData.openConnection();
    
      out.write('\r');
      out.write('\n');

long tLoginTime=0 ,totLoginTime=0;
long scheduledTime =0,totscheduledTime=0;
int n_no =0, totn_no=0, n_yes=0, totn_yes =0;
long n_inbound =0, totn_inbound=0, n_outbound=0, totn_outbound =0;
long n_WrapUp =0, totn_WrapUp =0 ;
long ssTotTalkTimeInbound = 0 ,totTalkTimeInbound = 0;
long ssTotTalkTimeOutbound = 0 ,totTalkTimeOutbound = 0;
long ssTotWrapUp = 0 , totWrapUp =0;
long tot_non_prod_wrap = 0, tot_non_prod_nrr=0;
long non_prod_wrap = 0, non_prod_nrr=0;

long ssTotSingleTransfert = 0 ,totSingleTransfert = 0;
long ssTotTwoTransfert = 0 ,totTwoTransfert = 0;
long ssTotTransfert = 0 , totTransfert =0;
long n_Transfet = 0 , totn_transfert =0;


long ssTotHold = 0 , totHold = 0 ;
long ssTotWait = 0 , totWait = 0 ;
long n_Hold = 0 , totn_Hold = 0 ;
long n_Wait = 0 , totn_Wait = 0 ;

long ssTotNotReady = 0 , totNotReady =0;
long n_NotReady = 0 , totn_NotReady =0;
String percentGap="0.00%", percentAdherence ="0.00%";
String percentNRR="0.00%", percentTransfert ="0.00%";
String callsPerHour="0.00%";
String productivity="" ;
String avgHandle="00:00:00";
String avgWrapUp="00:00:00";

String avgNRR="00:00:00";
String avgInbound="00:00:00";
String avgOutbound="00:00:00";
String avgTransfert="00:00:00";
String avgHold="00:00:00";
String avgWait="00:00:00";

String percentOutIn="0.00%";
String percentOut="0.00%";
String percentIn="0.00%";
String tempGrpOrLeader_name="", writeName="";
long GroupForAgent =1, first =1;
long total = 0;
double NbCallsPerHour =0;
agentInfo =null;
HashMap map_Agent_forProduc = (HashMap)beanAgent.map_Agent_forProduc;
HashMap map_AgentSummaryNRR = (HashMap)beanAgent.map_AgentSummaryNRR;


      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var lang =normalizeString(QueryString('lang'));\n");
      out.write("</script>\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t\t  <b>\n");
      out.write("\t\t\t\t\t\t\t");

								try { 
								if(reportSummary.compareTo("leader")==0)
									out.write(beanAgent.getLeaderName(grpOrLeadId)); 
								if(reportSummary.compareTo("group")==0)
									out.write(beanAgent.getGroupName(grpOrLeadId)); 
									}
								catch(Exception e) { out.write(""); }
							
      out.write('[');
      out.write(' ');
      out.write(' ');
 out.println(grpOrLeadId); 
      out.write(" \t ]\n");
      out.write("\t\t\t\t\t  </b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageSumdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageSumdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageSumdData.getWord("Yearly"));
								}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageSumdData.getWord("Summary report"));
      out.write(" &nbsp; ");
      out.print(pageSumdData.getWord("for"));
      out.write("<br><br>\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(pageSumdData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							pageSumdData.getWord("Data")
							);
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t  <td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t  \t<td width=\"19%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Agent name"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Scheduled"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Actual"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Inbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Outbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Wrap up calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Hold calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Waiting calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"9%\"  align=\"center\" colspan=\"2\">");
      out.print(pageSumdData.getWord("Not ready calls"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write(" \t\t<tr class=\"reportsNRRCol\">\n");
      out.write(" \t\t\t<td align=\"center\">");
out.write(" ");
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(" ");
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(" ");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("NB");
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write("Time");
      out.write("</td>\n");
      out.write("\t\t  </tr>\n");
      out.write("\t\t\t  \n");

	for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) {
			 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
			if(agentInfo !=null) 
			{
		
      out.write("\n");
      out.write("\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.last_name+", "+agentInfo.first_name+" ["+agentInfo.agent_id+"] ");
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getScheduled());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_Inbound));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_Outbound));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalWrapUpInTime+ agentInfo.totalWrapUpOutTime)));
      out.write("</td>\n");
      out.write("\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_hold));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalHoldTime)));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_Wait));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalWaitTime)));
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_single_transfer + agentInfo.n_two_step_transfer));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalSingleTransfer +agentInfo.totalTwoStepTranfer)));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(Long.toString(agentInfo.n_NotReady));
      out.write("</td>\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalNotReadyTime)));
      out.write("</td>\n");
      out.write("\t\t  </tr>\n");
      out.write("\t\t  ");

		
        tLoginTime += agentInfo.totalLoginTime;   totLoginTime+= agentInfo.totalLoginTime;
		scheduledTime +=agentInfo.Scheduled ; totscheduledTime  +=agentInfo.Scheduled ;
		//n_no += agentInfo.n_no ; totn_no += agentInfo.n_no; 
		//n_yes +=agentInfo.n_yes;  totn_yes+=agentInfo.n_yes;
		n_inbound +=agentInfo.n_Inbound; totn_inbound +=agentInfo.n_Inbound;
		n_outbound +=agentInfo.n_Outbound;  totn_outbound +=agentInfo.n_Outbound; 
		ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound; totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
		ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
		
		ssTotWrapUp += agentInfo.totalWrapUpInTime ; totWrapUp += agentInfo.totalWrapUpInTime;
		ssTotWrapUp += agentInfo.totalWrapUpOutTime ; totWrapUp += agentInfo.totalWrapUpOutTime;
		n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
		totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
		
		ssTotTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		totTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		n_Transfet += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
		totn_transfert += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;

		ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
		n_NotReady += agentInfo.n_NotReady ; totn_NotReady += agentInfo.n_NotReady;
		
		totHold += agentInfo.totalHoldTime;		totn_Hold+= agentInfo.n_hold;
		totWait += agentInfo.totalWaitTime;		totn_Wait += agentInfo.n_Wait;	
		first =0; 
 		tempGrpOrLeader_name= agentInfo.grpOrLeader_name;
		}		
    } //end for
	agentInfo = new beanAgentGlobalInfo();
	if(agentInfo !=null) 
	{

      out.write("\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b>");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(scheduledTime));
      out.write("</b></font></td>\n");
      out.write("\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>\n");
      out.write("\t\t\t \n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_inbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_outbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_WrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totWrapUp));
      out.write("</b></font></td>\n");
      out.write("\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_Hold ));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totHold));
      out.write("</b></font></td> \n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_Wait));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totWait));
      out.write("</b></font></td>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_transfert));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTransfert));
      out.write("</b></font></td> \n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totn_NotReady));
      out.write("</b></font></td>\n");
      out.write("\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totNotReady));
      out.write("</b></font></td>\n");
      out.write("\t\t</tr>\n");


	}
	else
	{
	
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t<td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t\n");
      out.write("\t");

	}

      out.write("\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");

							out.write(pageSumdData.getWord("Average"));
					tLoginTime =0;   totLoginTime=0;
					scheduledTime =0; totscheduledTime  =0;
					n_inbound =0; totn_inbound =0;
					n_outbound =0;  totn_outbound =0;
					ssTotTalkTimeInbound =0; totTalkTimeInbound =0;
					ssTotTalkTimeOutbound =0;totTalkTimeOutbound =0;
					ssTotWrapUp =0; totWrapUp =0;
					ssTotWrapUp =0; totWrapUp =0;
					n_WrapUp =0; totn_WrapUp =0;
					ssTotTransfert =0; totTransfert =0;	n_Transfet =0;totn_transfert =0;
					ssTotNotReady =0; totNotReady =0;n_NotReady =0; totn_NotReady =0;
					ssTotHold=0; totHold =0;
						tot_non_prod_wrap=0; tot_non_prod_nrr=0;
					
					ssTotWait =0 ; totWait = 0 ;
					n_Hold = 0; totn_Hold = 0 ;
					n_Wait = 0 ; totn_Wait = 0 ;
	
					first =0; 
					tempGrpOrLeader_name= "";	
								
							
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t  <td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t  \t<td width=\"20%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Agent name"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Inbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Outbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Wrap up time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Hold time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Handling time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Transfer time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print(pageSumdData.getWord("Not ready time"));
      out.write("</td>\n");
      out.write("\t\t\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\n");

	for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) {
			 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
			if(agentInfo !=null) 
			{
		
      out.write("\n");
      out.write("\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.last_name+", "+agentInfo.first_name+" ["+agentInfo.agent_id+"] ");
      out.write("</td>\n");
      out.write("\t\t\t<!--<td align=\"center\">");
//out.write(agentInfo.getScheduled());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
//out.write(agentInfo.buildReadableTime((agentInfo.totalLoginTime)));
      out.write("</td>-->\n");
      out.write("\t\t\t<td  align=\"center\">");
out.write(agentInfo.getAvgTalktimeInbound());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgTalktimeOutbound());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgWrapUpTime());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgTalktimeHold());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgHandlingTime());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgWaitingTime());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgTransferTime());
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">");
out.write(agentInfo.getAvgNotReadyTime() );
      out.write("</td>\n");
      out.write("\t\t\t\n");
      out.write("\t\t  </tr>\n");
      out.write("\t\t  ");

		
        tLoginTime += agentInfo.totalLoginTime;   totLoginTime+= agentInfo.totalLoginTime;
		scheduledTime +=agentInfo.Scheduled ; totscheduledTime  +=agentInfo.Scheduled ;
		//n_no += agentInfo.n_no ; totn_no += agentInfo.n_no; 
		//n_yes +=agentInfo.n_yes;  totn_yes+=agentInfo.n_yes;
		n_inbound +=agentInfo.n_Inbound; totn_inbound +=agentInfo.n_Inbound;
		n_outbound +=agentInfo.n_Outbound;  totn_outbound +=agentInfo.n_Outbound; 
		ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound; totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
		ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
		
		ssTotWrapUp += agentInfo.totalWrapUpInTime ; totWrapUp += agentInfo.totalWrapUpInTime;
		ssTotWrapUp += agentInfo.totalWrapUpOutTime ; totWrapUp += agentInfo.totalWrapUpOutTime;
		n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
		totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
		tot_non_prod_wrap += agentInfo.non_prod_wrap;
		tot_non_prod_nrr += agentInfo.non_prod_nrr;
		
		ssTotTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		totTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		n_Transfet += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
		totn_transfert += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;

		ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
		n_NotReady += agentInfo.n_NotReady ; totn_NotReady += agentInfo.n_NotReady;
		
		totHold += agentInfo.totalHoldTime;		totn_Hold+= agentInfo.n_hold;
		totWait += agentInfo.totalWaitTime;		totn_Wait += agentInfo.n_Wait;	
		
		first =0; 
 		tempGrpOrLeader_name= agentInfo.grpOrLeader_name;
		}		
    } //end for
	agentInfo = new beanAgentGlobalInfo();
	if(agentInfo !=null) 
	{
		
		avgHandle="00:00:00";avgWrapUp="00:00:00";
		avgNRR="00:00:00";avgInbound="00:00:00";
		avgOutbound="00:00:00";avgTransfert="00:00:00";

		total = totn_inbound + totn_outbound;
		if(total > 0)
			avgHandle = agentInfo.buildReadableTime( (totTalkTimeInbound + totTalkTimeOutbound + totWrapUp + totHold) / total);
		if (total > 0)
		  avgWrapUp = agentInfo.buildReadableTime( totWrapUp/total);
		if (totn_NotReady > 0)
		  avgNRR = agentInfo.buildReadableTime( totNotReady / totn_NotReady);
		if (totn_inbound > 0)
		  avgInbound = agentInfo.buildReadableTime( totTalkTimeInbound / totn_inbound);
		if (totn_outbound > 0)
		  avgOutbound = agentInfo.buildReadableTime( totTalkTimeOutbound / totn_outbound);
		if (totn_transfert > 0)
		  avgTransfert = agentInfo.buildReadableTime( totTransfert / totn_transfert);
		if(total >0)
			avgHold = agentInfo.buildReadableTime( totHold / total);
		if(totn_Wait >0)
			avgWait = agentInfo.buildReadableTime( totWait / totn_Wait);


      out.write("\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t <!--<td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
//out.write(agentInfo.buildReadableTime(scheduledTime));
      out.write("</font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
//out.write(agentInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>-->\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(avgInbound);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgOutbound);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgWrapUp);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgHold);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgHandle);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgWait);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgTransfert);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(avgNRR);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t</tr>\n");


	}
	else
	{
	
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b>");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t <!--<td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
//out.write("00:00:00");
      out.write("</font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
//out.write("00:00:00");
      out.write("</b></font></td>-->\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t\n");
      out.write("\t");

	}

      out.write("\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageSumdData.getWord("Percentages"));
					tLoginTime =0;   totLoginTime=0;
					scheduledTime =0; totscheduledTime  =0;
					n_inbound =0; totn_inbound =0;
					n_outbound =0;  totn_outbound =0;
					ssTotTalkTimeInbound =0; totTalkTimeInbound =0;
					ssTotTalkTimeOutbound =0;totTalkTimeOutbound =0;
					ssTotWrapUp =0; totWrapUp =0;
					ssTotWrapUp =0; totWrapUp =0;
					n_WrapUp =0; totn_WrapUp =0;
					ssTotTransfert =0; totTransfert =0;	n_Transfet =0;totn_transfert =0;
					ssTotNotReady =0; totNotReady =0;n_NotReady =0; totn_NotReady =0;
					ssTotHold=0; totHold =0;		
					first =0; 
					tempGrpOrLeader_name= "";	
					long totWrapUpForProduc =0;
					long totNrrForProduc=0;
					long totlogForProduc=0;
								
							
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t  <td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t  \t<td width=\"20%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Agent name"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Scheduled"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Actual"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Adherence"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("GAP"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Productivity"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Calls out/Calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Calls in/Calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print(pageSumdData.getWord("Not ready"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");

			for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) 
			{
					 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
					if(agentInfo !=null) 
					{
					String key="";
					productivity="";
					key = agentInfo.agent_id;
					//System.out.println("\n************** key----: "+ key);
					//beanAgentGlobalInfoReport.agentData tmpNrrElt = (beanAgentGlobalInfoReport.agentData)map_Agent_forProduc.get(key);

						if(agentInfo !=null)
						{
							if(agentInfo.totalLoginTime >0)
							{
								productivity =agentInfo.formatDecimalDouble(100*(1-((double)(agentInfo.non_prod_wrap)+(double)(agentInfo.non_prod_nrr))/ (double)agentInfo.totalLoginTime),2)+" %";
							}
							totWrapUpForProduc +=agentInfo.non_prod_wrap;
							totNrrForProduc +=agentInfo.non_prod_nrr;
							totlogForProduc +=agentInfo.totalLoginTime;
						}

					
      out.write("\n");
      out.write("\t\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
								else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.last_name+", "+agentInfo.first_name+" ["+agentInfo.agent_id+"] ");
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getScheduled());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.buildReadableTime((agentInfo.totalLoginTime)));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td  align=\"center\">");
out.write(agentInfo.getAdherence());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentActualScheduledLogin());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(productivity);
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getCallPerHour());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentOut());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentIn());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentTransferTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(agentInfo.getPercentNotReadyTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t  </tr>\n");
      out.write("\t\t\t\t\t  ");

		
				tLoginTime += agentInfo.totalLoginTime;   totLoginTime+= agentInfo.totalLoginTime;
				scheduledTime +=agentInfo.Scheduled ; totscheduledTime  +=agentInfo.Scheduled ;
				n_no += agentInfo.n_no ; totn_no += agentInfo.n_no; 
				n_yes +=agentInfo.n_yes;  totn_yes+=agentInfo.n_yes;
				n_inbound +=agentInfo.n_Inbound; totn_inbound +=agentInfo.n_Inbound;
				n_outbound +=agentInfo.n_Outbound;  totn_outbound +=agentInfo.n_Outbound; 
				ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound; totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
				ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
				
				ssTotWrapUp += agentInfo.totalWrapUpInTime ; totWrapUp += agentInfo.totalWrapUpInTime;
				ssTotWrapUp += agentInfo.totalWrapUpOutTime ; totWrapUp += agentInfo.totalWrapUpOutTime;
				n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
				totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
				
				ssTotTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
				totTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
				n_Transfet += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
				totn_transfert += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
		
				ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
				n_NotReady += agentInfo.n_NotReady ; totn_NotReady += agentInfo.n_NotReady;
				
				ssTotHold += agentInfo.totalHoldTime; totHold += agentInfo.totalHoldTime;
				
				first =0; 
				tempGrpOrLeader_name= agentInfo.grpOrLeader_name;
				}		
			} //end for
			
			agentInfo = new beanAgentGlobalInfo();
			if(agentInfo !=null) 
			{
				percentGap="0.00%"; percentAdherence ="0.00%";callsPerHour="0.00%";
				 productivity="0.00" ;
				 percentOutIn="0.00%"; 
				 percentOut="0.00%"; 
				 percentIn="0.00%"; 
				 percentNRR="0.00%"; percentTransfert ="0.00%";
		
				//System.out.println("agentInfo no null");	
				total = totn_inbound + totn_outbound;
				if (totn_no + totn_yes > 0) 
				  percentAdherence = agentInfo.formatDecimalDouble((( (double)totn_yes * 100) / (totn_yes + totn_no)), 2) + " %";
				if (totscheduledTime > 0) 
					percentGap = agentInfo.formatDecimalDouble(((double) ( (totLoginTime - totscheduledTime) * 100) / totscheduledTime ), 2) + " %";					
				if (totLoginTime > 3600) 
				  NbCallsPerHour = (double) total / ( (double) totLoginTime / 3600);
				else  
				  NbCallsPerHour = total;
				callsPerHour = agentInfo.formatDecimalDouble( (NbCallsPerHour + 0.005), 2);
				if(totLoginTime >0)
				{
					//productivity =agentInfo.formatDecimalDouble(100*(1-((double)(totWrapUp+totNotReady)/ (double)totLoginTime)),2)+" %";
					percentNRR = agentInfo.formatDecimalDouble((( (double)totNotReady * 100) / (totLoginTime)), 2) + " %";
					percentTransfert = agentInfo.formatDecimalDouble((( (double)totTransfert * 100) / (totLoginTime)), 2) + " %";
				}
				if (total > 0) {
				  percentOut = agentInfo.formatDecimalDouble((( (double) totn_outbound * 100) / total), 2) + " %";
				  percentIn = agentInfo.formatDecimalDouble((( (double) totn_inbound * 100) / total), 2) + " %";
				}
					if(totLoginTime >0)
					{
						productivity =agentInfo.formatDecimalDouble(100*(1-((double)(totWrapUpForProduc+totNrrForProduc)/ (double)totLoginTime)),2)+" %";
					}
			
		
      out.write("\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(scheduledTime));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentAdherence);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentGap);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(productivity );
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(callsPerHour);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentOut);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentIn);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentTransfert);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(percentNRR);
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t");

		
			}
			else
			{
			
      out.write("\n");
      out.write("\t\t\t\t\t <tr>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print(pageSumdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("00:00:00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write("0.00%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t");

			}
		
      out.write("\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\t\t\t\t  \n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\n");
      out.write("\t\t\t\t\t  ");

								out.write(pageSumdData.getWord("Not ready reason"));
								long [] totNotReadyReason =null;
								long [] tot_nNotReadyReason =null;
								percentNRR="";
								totNotReady =0; totn_NotReady =0;
   								int nb_NRR = beanAgent.m_vAllNRR.size();
								String lg_table="";
								if(nb_NRR < 6) lg_table = Integer.toString(100 -(6-nb_NRR)*10)+"%";
								else  lg_table = Integer.toString(100)+"%";
							
      out.write("\n");
      out.write("\t\t\t\t\t</b></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"");
out.write(lg_table);
      out.write("\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
      out.print(pageSumdData.getWord("Agent name"));
      out.write(" </td>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t");

				   totNotReadyReason = new long[beanAgent.m_vAllNRR.size()];
				   tot_nNotReadyReason = new long[beanAgent.m_vAllNRR.size()];
				   
					for(int k =0; k < beanAgent.m_vAllNRR.size(); k++)
					{ 
						//creer autant de variable que de raison
					  totNotReadyReason[k]=0;
					   tot_nNotReadyReason[k] =0;
					  
					
      out.write(" \n");
      out.write("\t\t\t\t\t\t<td width=\"6%\" colspan=\"3\" align=\"center\" style=\"border-style:solid; border-right-color: #949494\">");
      out.print(beanAgent.m_vAllNRR.elementAt(k) );
      out.write("</td>\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  \n");
      out.write("\t\t\t  <tr class=\"reportsNRRCol\">\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
 out.write(" "); 
      out.write("</td>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t");

					for(int k =0; k < beanAgent.m_vAllNRR.size(); k++)
					{ 
					
      out.write(" \n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid;border-right-color:#CCCCCC\">");
 out.write("Time"); 
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write("Nb"); 
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid;border-right-color: #949494\">");
 out.write(" % "); 
      out.write("</td>\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
				 if(agentInfo !=null) 
				 {
				totNotReady += agentInfo.totalNotReadyTime ;
		
      out.write("\n");
      out.write("\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
out.write(beanAgent.getAgentFullName(agentInfo.agent_id)+" ["+agentInfo.agent_id+"] ");
      out.write("</td>\n");
      out.write("\t\t\t\t");

					for (int n = 0; n < beanAgent.m_vAllNRR.size(); n++) 
					{ 
						String key="";
						String nreadyreason = (String)beanAgent.m_vAllNRR.elementAt(n);
						key = agentInfo.agent_id+"-"+ nreadyreason;
						//System.out.println("**********key************: "+key);
						beanAgentGlobalInfoReport.nrrData tmpNrrElt = (beanAgentGlobalInfoReport.nrrData)map_AgentSummaryNRR.get(key);
						if(tmpNrrElt != null)
						{
						totNotReadyReason[n] += tmpNrrElt.nrrDuration;
						tot_nNotReadyReason[n] += tmpNrrElt.nrrCount;
						
      out.write("\n");
      out.write("\t\t\t\t<td align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write( agentInfo.buildReadableTime(tmpNrrElt.nrrDuration)); 						 						
      out.write("</td>\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\"> ");
 out.write(Long.toString(tmpNrrElt.nrrCount));  
      out.write("\t</td>\t\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\"> ");
 out.write(tmpNrrElt.nrrPercent);  
      out.write("\t</td>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t");
	
						
						}
						else
						{
						totNotReadyReason[n] += 0;
						tot_nNotReadyReason[n] += 0;
						
      out.write("\n");
      out.write("\t\t\t\t<td align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write( "00:00:00"); 						 						
      out.write("</td>\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\"> ");
 out.write("0");  
      out.write("\t</td>\t\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\"> ");
 out.write("0.00");  
      out.write("\t</td>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t");
	
						
						}
			} //fin for n  
      out.write("\n");
      out.write("\t  </tr>\n");
      out.write("\t\t");

		}
	} //fin for
	agentInfo = new beanAgentGlobalInfo();
			  
		
      out.write("\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td   width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
      out.print(pageSumdData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgent.m_vAllNRR.size(); n++) 
				{ 
				if((totNotReady) !=0) 
				{
					percentNRR = agentInfo.formatDecimalDouble( ( (double)((totNotReadyReason[n])*100)/totNotReady), 2);
				}
				else 
				 percentNRR ="0.00";
				
					
      out.write("\n");
      out.write("\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( agentInfo.buildReadableTime(totNotReadyReason[n])); 
      out.write("</b></font></td>\n");
      out.write("\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ tot_nNotReadyReason[n]);  
      out.write("</b></font></td>\t\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>\n");
      out.write("\t\t\t\t  ");
 out.write(percentNRR);  
      out.write("\n");
      out.write("\t\t\t\t</b></font></td>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t");
	
					} //fin for n  
      out.write("\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("</table>\n");
 pageSumdData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t");

	}
	
}

      out.write("\t\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 pageSumData.closeConnection(); 
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
