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
import aheevaManager.ressources.*;
import java.lang.*;
import java.util.*;
import aheevaManager.reports.*;
import java.text.*;
import aheevaManager.wfm.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import javax.naming.*;
import aheevaManager.ressources.*;
import java.lang.*;
import java.util.*;
import aheevaManager.reports.*;
import java.text.*;
import aheevaManager.wfm.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;

public final class agentGroupReports_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(5);
    _jspx_dependants.add("/aheevaManager/jsp/groupReportsAnswered.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/groupReportsAnsweredDetails.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/groupReportsUnAnswered.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/groupReportsUnAnsweredDetails.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/groupReportsStat.jsp");
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
beanManagerData page1Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	page1Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    page1Data.openConnection();

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Agent Group Reports</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/style_2.css\" />\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100%;\r\n");
      out.write("\t/*width:      550px;*/\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("\tbackground:\t#E1F4FF;\r\n");
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
      out.write(".imgControl {\r\n");
      out.write("\ttop: 1;\r\n");
      out.write("\tposition:\t\trelative;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      aheevaManager.reports.beanAgentGroupReport beanAgentGroup = null;
      synchronized (request) {
        beanAgentGroup = (aheevaManager.reports.beanAgentGroupReport) _jspx_page_context.getAttribute("beanAgentGroup", PageContext.REQUEST_SCOPE);
        if (beanAgentGroup == null){
          beanAgentGroup = new aheevaManager.reports.beanAgentGroupReport();
          _jspx_page_context.setAttribute("beanAgentGroup", beanAgentGroup, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");

	String language =request.getParameter("lang");
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
	String detail =request.getParameter("detail");
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
	String starting_year_yearly = request.getParameter("starting_year_yearly");
	String ending_year_yearly = request.getParameter("ending_year_yearly");
	String starting_month_monthly = request.getParameter("starting_month_monthly");
	String starting_year_monthly = request.getParameter("starting_year_monthly");
	String ending_month_monthly = request.getParameter("ending_month_monthly");
	String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String groups  = request.getParameter("objects");
	String[] tabObj =null;
    StringTokenizer tok = null, tokGrp =null;
    beanAgentGlobalInfo groupsInfo = null;
	String from ="";
    if(groups != null){
        tok = new java.util.StringTokenizer(groups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
	
	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
		System.out.println("---tabObj : " + tabObj[w]);	
		
	}
	String group ="", groupName="", groupId ="";
	
	String startingDate="", endingDate="", sret="";
    if (reportType.compareTo("Daily") ==0){
			startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
			endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    } else if (reportType.compareTo("Monthly") ==0){
			startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
			endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;
    } else if (reportType.compareTo("Yearly") ==0){
			startingDate=starting_year_yearly + "-01-01" + " 00:00:00" ;
			endingDate=ending_year_yearly + "-12-31"+ " 23:59:59" ;
    }

      out.write("\r\n");
      out.write("<div class=\"img-control\" >\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" >\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<form>\r\n");
      out.write("\t\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printGroupReport.jsp?startingDateDaily=");
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
      out.write("&detail=");
out.write(detail) ;
      out.write("&objects=");
out.write(groups) ;
      out.write("&prec=");
 out.write(prec) ;
      out.write("&suiv=");
 out.write(suiv) ;
      out.write("&current=");
 out.write(current) ;
      out.write("&all_obj=");
 out.write(all_obj) ;
      out.write("&from=");
 out.write("groupReport") ;
      out.write("&lang=");
 out.write(language);  
      out.write("')\"><img src=\"../img/printer.gif\" border=\"0\"></button>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\r\n");
      out.write("\t");

	
		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"agentGroupReports.jsp?startingDateDaily=");
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
      out.write("&detail=");
out.write(detail) ;
      out.write("&objects=");
out.write(groups) ;
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
      out.print( page1Data.getWord("Previous"));
      out.write("</a>\t\t</td>\r\n");
      out.write("\t");

	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"agentGroupReports.jsp?startingDateDaily=");
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
      out.write("&detail=");
out.write(detail) ;
      out.write("&objects=");
out.write(groups) ;
      out.write("&prec=-1&suiv=1&current=0&all_obj=1&lang=");
out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print( page1Data.getWord("All"));
      out.write("</a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	String nb_obj = Integer.toString(numObjects);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"agentGroupReports.jsp?startingDateDaily=");
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
      out.write("&detail=");
out.write(detail) ;
      out.write("&objects=");
out.write(groups) ;
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
      out.print( page1Data.getWord("Next"));
      out.write("</a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");

if(all_obj.compareTo("0")==0) // un agent
{
	group =tabObj[Integer.parseInt(current)];
	tokGrp = new java.util.StringTokenizer(group,",");
	groupName =tokGrp.nextToken();
	groupId = tokGrp.nextToken();
	System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	
	
	if(detail.compareTo("0")==0)
	{
		sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
		beanAgentGroup.BuildGlobalNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
		System.out.println("fin BuildGlobalNotReadyReasonForPeriod ds JSP");	
		groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
	}
	
	if(detail.compareTo("1")==0)
	{
		sret = beanAgentGroup.buildGroupDetailsInfosForPeriod(groupId,reportType,startingDate,endingDate);
		System.out.println("fin buildGroupDetailsInfosForPeriod ds JSP");	
		beanAgentGroup.beanAgentGroupGettingNameNrr(groupId,reportType,startingDate,endingDate);
		System.out.println("fin beanAgentGroupGettingNameNrr ds JSP");
		beanAgentGroup.BuildDetailsNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
		System.out.println("fin BuildDetailsNotReadyReasonForPeriod ds JSP");	
	}

      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"groupReports\">\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Answered"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage1\" ) );  \t\t\t \t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			
			if(detail.compareTo("0")==0) // rapport non detaille
			{
				if(sret == "success")
				 {
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageRepAData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepAData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageRepAData.openConnection();

	String percent_Ans ="";

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var lang =normalizeString(QueryString('lang'));\n");
      out.write("</script>\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t\t  <b>\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\n");
      out.write("\t\t\t\t\t\t  [\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\n");
      out.write("\t\t\t\t\t  \t ]\n");
      out.write("\t\t\t\t\t  </b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
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
								  out.write(pageRepAData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepAData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepAData.getWord("Yearly"));
								}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepAData.getWord("Report for answered calls"));
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
      out.print( pageRepAData.getWord("To"));
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
      out.write("\t");

	if(from.compareTo("groupReport") == 0)
	{
	 
      out.write("\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepAData.getWord("Answered calls"));
      out.write("\t\n");
      out.write("\t\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t\t\t</font>\n");
      out.write("\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t\t</table>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t");

	}
	
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepAData.getWord("Login details"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Login time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Login count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(Long.toString(groupsInfo.n_login));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepAData.getWord("Inbound calls"));
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Inbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(groupsInfo.n_Inbound));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.getInboundPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Inbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeInbound));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Inbound average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(groupsInfo.getAvgTalktimeInbound());
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepAData.getWord("Outbound calls"));
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table></td></tr><tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepAData.getWord("Outbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(Long.toString(groupsInfo.n_Outbound));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\n");
      out.write("\t\t\t\t  </tr>\n");
      out.write("\t\t\t\t  <tr >\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepAData.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {out.write(groupsInfo.getOutboundPerHour());}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr><tr >\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Outbound time"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeOutbound));}catch(Exception e){out.write("unknown");}
      out.write("</td></tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Outbound average"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
try {out.write(groupsInfo.getAvgTalktimeOutbound());}catch(Exception e){out.write("unknown");}
      out.write(" </td></tr></table></td></tr><tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><b>");
      out.print( pageRepAData.getWord("Wrap up calls"));
      out.write("</b></td></tr></table></td></tr><tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \"><tr><td height=\"10\"></td></tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrap up count"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(Long.toString(groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up));}catch(Exception e){out.write("unknown");}
      out.write("</td></tr> <tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrap_up/hour"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.getWrapUpPerHour());}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrap up time"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.buildReadableTime(groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime));}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr> <tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrap up average"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
try {out.write(groupsInfo.getAvgWrapUpTime());}catch(Exception e){out.write("unknown");}
      out.write(" </td> </tr></table></td></tr><tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><b>");
      out.print( pageRepAData.getWord("Hold calls"));
      out.write("</b></td></tr></table></td></tr><tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \"> <tr><td height=\"10\"></td></tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold count"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\"  style=\"border-style:solid; border-width:medium\">");
 try {out.write(Long.toString(groupsInfo.n_hold));}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr> <tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold/hour"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.getHoldPerHour());}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold time"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.buildReadableTime(groupsInfo.totalHoldTime));}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr> <tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold average"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
try {out.write(groupsInfo.getAvgTalktimeHold());}catch(Exception e){out.write("unknown");}
      out.write(" </td> </tr></table></td></tr>");
if(groupsInfo.totalLoginTime > 0){
      out.write("<tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><b>");
      out.print( pageRepAData.getWord("Percentages compared to login time"));
      out.write("</b></td></tr></table></td></tr><tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \"><tr><td height=\"10\"></td></tr><tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Login"));
      out.write("</td><td class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\"></td><td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"100%\" height=\"10\" align=\"left\"><tr><td width=\"95%\"  style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td></tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Handling"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentHandlingTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td><td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr> </table></td></tr><tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Busy"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentBusyTime();out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td><td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td></tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Inbound"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentInboundTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr> </table></td> </tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Outbound"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentOutboundTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td><td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td> </tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrapup"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try{percent_Ans = groupsInfo.getPercentWrapUpTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td> </tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentHoldTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td></tr></table></td></tr>");
}
      out.write("</table>\n");
 pageRepAData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t");

				}
			}
			
			
			if(detail.compareTo("1")==0) // rapport  detaille
			{
				if(sret == "success")
				 {
				
      out.write("\r\n");
      out.write("\t\t\t\t");
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

beanManagerData pageRepdeData = new beanManagerData();
pageRepdeData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepdeData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write('\n');

	//String percent ="";
    long tLoginTime_Ans = 0, ssTotLoginTime_Ans = 0, totLoginTime_Ans = 0 ;
    long tTalkTimeInbound = 0, ssTotTalkTimeInbound = 0 ,totTalkTimeInbound = 0;
    long tTalkTimeOutbound = 0, ssTotTalkTimeOutbound = 0 ,totTalkTimeOutbound = 0;
    long tTime = 0, totTime = 0;
    long tWrapUp =0, ssTotWrapUp = 0 , totWrapUp =0;
	long tHold = 0, ssTotHold = 0 , totHold = 0 ;
    long t_N_login =0, ssNLoginTime = 0, tot_N_login =0;
    long t_n_Inbound =0, ssNInbound =0, tot_n_Inbound =0;
    long t_n_Outbound =0, ssNOutbound =0, tot_n_Outbound =0;
    long t_n_Wrap_up =0, ssNWrap_up =0, tot_n_Wrap_up =0 ;
	long t_n_Hold = 0, ssNHold =0, tot_n_Hold = 0;
    long tHandling = 0, ssTotHandling = 0 ,totHandling = 0;
    long t_n_Handling =0, ssNHandling =0, tot_n_Handling =0;
    long tBusy = 0, ssTotBusy = 0 ,totBusy = 0;
    long t_n_Busy =0, ssNBusy =0, tot_n_Busy =0;
	long ssTotWrapUpIn =0, ssTotWrapUpOut =0, totWrapUpIn =0, totWrapUpOut =0;

	long avgTalkTimeInbound = 0 , tot_avgTalkTimeInbound = 0;
    long avgTalkTimeOutbound = 0, tot_avgTalkTimeOutbound = 0;
    long avgWrapUp = 0, tot_avgWrapUp = 0;
    long avgHold = 0, tot_avgHold = 0;
    long avgHandling = 0, tot_avgHandling = 0;
	long ahtIn =0, tot_ahtIn=0, ahtOut=0, tot_ahtOut =0;

	String percentTalkTimeInbound = "" , tot_percentTalkTimeInbound = "";
    String percentTalkTimeOutbound = "", tot_percentTalkTimeOutbound = "";
    String percentWrapUp = "", tot_percentWrapUp = "";
    String percentHold = "", tot_percentHold = "";
    String percentHandling = "", tot_percentHandling = "";
    String percentBusy = "", tot_percentBusy = "";

	boolean needOneMoreTotalRow_Ans = false;
    groupsInfo =null;

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

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\n");
      out.write("\t\t\t\t\t\t  [\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\n");
      out.write("\t\t\t\t\t  \t ]\n");
      out.write("\t\t\t\t\t  </b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
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
								  out.write(pageRepdeData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepdeData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepdeData.getWord("Yearly"));
								}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepdeData.getWord("Details Report for answered calls"));
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
      out.print( pageRepdeData.getWord("To"));
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
      out.write("\t");

	if(from.compareTo("groupReport") == 0)
	{
	 
      out.write("\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepdeData.getWord("Answered calls"));
      out.write("\t\n");
      out.write("\t\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t\t\t</font>\n");
      out.write("\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t\t</table>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t");

	}
	
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
						 pageRepdeData.getWord("Telephony data")
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
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\">");
      out.print( pageRepdeData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Login time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Login count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Inbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Inbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Outbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Outbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Wrap up time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Wrap up count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Hold time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Hold count"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");

    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);


      out.write("\n");
      out.write(" \t\t\t");
 if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) {
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tLoginTime_Ans));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_N_login));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Inbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Outbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Wrap_up));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tHold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Hold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\n");
      out.write(" \t\t\t");

				tLoginTime_Ans = 0;
				tTalkTimeInbound = 0;
				tTalkTimeOutbound = 0;
				tWrapUp  = 0;
				tHold =0;
				t_N_login =0;
				t_n_Inbound =0;
				t_n_Outbound =0;
				t_n_Wrap_up =0;
				t_n_Hold = 0;
				needOneMoreTotalRow_Ans = true;
			 }
 		 if(groupsInfo.totalLoginTime > 0){
		
      out.write("\n");
      out.write("\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t<td    align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_login));
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeInbound));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_Inbound));
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeOutbound));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_Outbound));
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalWrapUpInTime+groupsInfo.totalWrapUpOutTime));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_Wrap_In_up+groupsInfo.n_Wrap_Out_up) );
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalHoldTime));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_hold));
      out.write("</td>\n");
      out.write("\t  </tr>\n");
      out.write("\t<!-- end of array traversal-->\n");

        tLoginTime_Ans += groupsInfo.totalLoginTime;   totLoginTime_Ans += groupsInfo.totalLoginTime;
        tTalkTimeInbound += groupsInfo.totalTalkTimeInbound;  totTalkTimeInbound += groupsInfo.totalTalkTimeInbound;
        tTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound; totTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound;
        tWrapUp  += groupsInfo.totalWrapUpInTime; totWrapUp  += groupsInfo.totalWrapUpInTime;
        tWrapUp  += groupsInfo.totalWrapUpOutTime; totWrapUp  += groupsInfo.totalWrapUpOutTime;
        tHold += groupsInfo.totalHoldTime; totHold += groupsInfo.totalHoldTime;

        t_N_login += groupsInfo.n_login; tot_N_login += groupsInfo.n_login;
        t_n_Inbound += groupsInfo.n_Inbound; tot_n_Inbound += groupsInfo.n_Inbound;
        t_n_Outbound += groupsInfo.n_Outbound; tot_n_Outbound += groupsInfo.n_Outbound;

        t_n_Wrap_up += groupsInfo.n_Wrap_In_up;  tot_n_Wrap_up += groupsInfo.n_Wrap_In_up;
        t_n_Wrap_up += groupsInfo.n_Wrap_Out_up;  tot_n_Wrap_up += groupsInfo.n_Wrap_Out_up;
        t_n_Hold += groupsInfo.n_hold; tot_n_Hold += groupsInfo.n_hold;
        }
    }
 	groupsInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow_Ans == true){
	
      out.write("\n");
      out.write("\t <tr>\n");
      out.write("\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tLoginTime_Ans));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_N_login));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Inbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Outbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Wrap_up));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tHold));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Hold));
      out.write("</b></font></td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t");

		  }
	
      out.write("\n");
      out.write("\t <tr>\n");
      out.write("\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totLoginTime_Ans));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_N_login));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Inbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Outbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Wrap_up));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totHold));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Hold));
      out.write("</b></font></td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
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

								out.write(pageRepdeData.getWord("Average"));
								needOneMoreTotalRow_Ans = false;
								tTalkTimeInbound = 0; ssTotTalkTimeInbound = 0 ; 
								totTalkTimeInbound = 0; 		    
								tTalkTimeOutbound = 0; ssTotTalkTimeOutbound = 0 ; 
								totTalkTimeOutbound = 0;
    							tWrapUp =0; ssTotWrapUp = 0 ; totWrapUp =0;
								tHold = 0; ssTotHold = 0 ; totHold = 0 ;
    							tHandling = 0; ssTotHandling = 0 ;totHandling = 0;
    							tBusy = 0; ssTotBusy = 0; totBusy = 0;

    							t_n_Inbound =0; ssNInbound =0; tot_n_Inbound =0;
								t_n_Outbound =0; ssNOutbound =0; tot_n_Outbound =0;
								t_n_Wrap_up =0; ssNWrap_up =0; tot_n_Wrap_up =0 ;
								t_n_Hold = 0; ssNHold =0; tot_n_Hold = 0;
								tHandling = 0; ssTotHandling = 0 ;totHandling = 0;
								t_n_Handling =0; ssNHandling =0; tot_n_Handling =0;
								tBusy = 0; ssTotBusy = 0 ;totBusy = 0;
								t_n_Busy =0; ssNBusy =0; tot_n_Busy =0;
								
							
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageRepdeData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Inbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print( pageRepdeData.getWord("Outbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Wrap up calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Hold calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("AHT in"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("AHT out"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t");

		for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
			 groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);

				if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssNInbound) !=0) {
				avgTalkTimeInbound = (ssTotTalkTimeInbound/ssNInbound);
				// Add Hold Time to inbound only if agent were spent more time on Inbound calls than on Outbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)>=(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn+ ssTotHold)/ssNInbound;
						} else {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn)/ssNInbound;
						}
					}
					if((ssNOutbound) !=0){
						avgTalkTimeOutbound = (ssTotTalkTimeOutbound/ssNOutbound);
						
						// Add Hold Time to outbound only if agent were spent more time on Outbound calls than on Inbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)<(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut+ ssTotHold)/ssNOutbound;
						} else {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut)/ssNOutbound;						
						}
				 }
				if((ssNOutbound + ssNOutbound) !=0) avgWrapUp = (ssTotWrapUp/(ssNOutbound + ssNOutbound));
				if((ssNOutbound + ssNOutbound) !=0) avgHold = (ssTotHold/(ssNOutbound + ssNOutbound));
				if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
				System.out.println("ahtOut 1 : " + groupsInfo.buildReadableTime(ahtOut));
				
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgHold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(ahtIn));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(ahtOut));
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write(" \t\t\t");

				ssTotTalkTimeInbound = 0;
				ssNInbound = 0;
				avgTalkTimeInbound = 0 ;
				
				ssTotTalkTimeOutbound = 0;
				ssNOutbound = 0;
				avgTalkTimeOutbound  = 0;
				
				ssTotWrapUp = 0;
				ssNWrap_up = 0;
				avgWrapUp = 0;

				ssTotWrapUpIn =0;
				ssTotWrapUpOut =0;

				ssTotHold = 0;
				ssNHold = 0;
				avgHold = 0;
				
    			ssTotHandling = 0 ;
				ssNHandling =0;
    			avgHandling = 0;
				ahtIn=0;
				ahtOut=0;
				
				needOneMoreTotalRow_Ans = true;
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				
      out.write("\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgTalktimeInbound());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgTalktimeOutbound());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgWrapUpTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgTalktimeHold());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAhtIn());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAhtOut());
      out.write("</td>\n");
      out.write("\t\t\t\t  </tr>\n");
      out.write("\t\t\t\t");


			System.out.println("ahtOut 2 : " + groupsInfo.getAhtOut());
			System.out.println("test : " + groupsInfo.totalTalkTimeOutbound + groupsInfo.totalWrapUpOutTime + ssTotHold + groupsInfo.n_Outbound);

			ssTotTalkTimeInbound += groupsInfo.totalTalkTimeInbound ;
			ssNInbound+= groupsInfo.n_Inbound;
			totTalkTimeInbound +=groupsInfo.totalTalkTimeInbound ;
			tot_n_Inbound +=groupsInfo.n_Inbound  ; 
			tTalkTimeInbound = groupsInfo.totalTalkTimeInbound ; 
			t_n_Inbound =groupsInfo.n_Inbound  ; 

			ssTotTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound ;
			ssNOutbound += groupsInfo.n_Outbound;
			totTalkTimeOutbound +=groupsInfo.totalTalkTimeOutbound ;
			tot_n_Outbound +=groupsInfo.n_Outbound  ; 
			tTalkTimeOutbound = groupsInfo.totalTalkTimeOutbound ; 
			t_n_Outbound =groupsInfo.n_Outbound  ; 

			ssTotWrapUp += groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime ;
			ssNWrap_up+= groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up;
			totWrapUp +=groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ;
			tot_n_Wrap_up +=groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up; 
			tWrapUp = groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ; 
			t_n_Wrap_up =groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up;

			ssTotWrapUpIn += groupsInfo.totalWrapUpInTime;
			ssTotWrapUpOut += groupsInfo.totalWrapUpOutTime ;
			totWrapUpIn+= groupsInfo.totalWrapUpInTime;
			totWrapUpOut += groupsInfo.totalWrapUpOutTime ;

			ssTotHold += groupsInfo.totalHoldTime ;
			ssNHold+= groupsInfo.n_hold;
			totHold +=groupsInfo.totalHoldTime ;
			tot_n_Hold +=groupsInfo.n_hold  ; 
			tHold = groupsInfo.totalHoldTime ; 
			t_n_Hold =groupsInfo.n_hold  ; 


			System.out.println("ssTotWrapUpOut : " + ssTotWrapUpOut);
			System.out.println("ssTotTalkTimeOutbound : " + ssTotTalkTimeOutbound);
			System.out.println("ssTotHold : " + ssTotHold);
			System.out.println("ssNOutbound : " + ssNOutbound);
			

			ssTotHandling += groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			ssNHandling+= groupsInfo.n_Inbound + groupsInfo.n_Outbound;
			totHandling +=groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			tot_n_Handling += groupsInfo.n_Inbound + groupsInfo.n_Outbound;
			tHandling = groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			t_n_Handling = groupsInfo.n_Inbound + groupsInfo.n_Outbound;
			
			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true)
			{
				if((ssNInbound) !=0) {
				avgTalkTimeInbound = (ssTotTalkTimeInbound/ssNInbound);
				// Add Hold Time to inbound only if agent were spent more time on Inbound calls than on Outbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)>=(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn+ ssTotHold)/ssNInbound;
						} else {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn)/ssNInbound;
						}
					}
					if((ssNOutbound) !=0){
						avgTalkTimeOutbound = (ssTotTalkTimeOutbound/ssNOutbound);
						
						// Add Hold Time to outbound only if agent were spent more time on Outbound calls than on Inbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)<(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut+ ssTotHold)/ssNOutbound;
						} else {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut)/ssNOutbound;						
						}
				 }
				if((ssNOutbound + ssNInbound) !=0) avgWrapUp = (ssTotWrapUp/(ssNOutbound + ssNInbound));
				if((ssNOutbound + ssNInbound) !=0) avgHold = (ssTotHold/(ssNOutbound + ssNInbound));
				if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
				
				System.out.println("ahtOut 3 : " + groupsInfo.buildReadableTime(ahtOut));
			
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgHold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(ahtIn));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(ahtOut));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t");

				  }
				  if((tot_n_Inbound) !=0) {
				  tot_avgTalkTimeInbound = (totTalkTimeInbound/tot_n_Inbound);
				  // Add Hold Time to inbound only if agent were spent more time on Inbound calls than on Outbound cals
						if ((totTalkTimeInbound +totWrapUpIn)>=(totTalkTimeOutbound +totWrapUpOut)) {
							tot_ahtIn = (totTalkTimeInbound +totWrapUpIn +totHold) /tot_n_Inbound;
						} else {
							tot_ahtIn = (totTalkTimeInbound +totWrapUpIn) /tot_n_Inbound;
						}
					}
					if((tot_n_Outbound) !=0){
						tot_avgTalkTimeOutbound = (totTalkTimeOutbound/tot_n_Outbound);
						
						// Add Hold Time to outbound only if agent were spent more time on Outbound calls than on Inbound cals
						if ((totTalkTimeInbound +totWrapUpIn)<(totTalkTimeOutbound +totWrapUpOut)) {
							tot_ahtOut =(totTalkTimeOutbound +totWrapUpOut +totHold) /tot_n_Outbound;
						} else {
							tot_ahtOut =(totTalkTimeOutbound +totWrapUpOut) /tot_n_Outbound;						
						}
				}
				if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgWrapUp = (totWrapUp/(tot_n_Outbound + tot_n_Inbound ));
				if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgHold = (totHold/(tot_n_Outbound + tot_n_Inbound ));
				if((tot_n_Handling) !=0) tot_avgHandling = (totHandling/tot_n_Handling);
				
				System.out.println("tot_ahtOut : " + groupsInfo.buildReadableTime(tot_ahtOut));

			
      out.write("\n");
      out.write("\t \t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgHold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_ahtIn));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_ahtOut));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\t\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageRepdeData.getWord("Percentages compared to login time"));
								needOneMoreTotalRow_Ans = false;
    							tLoginTime_Ans = 0; ssTotLoginTime_Ans = 0; totLoginTime_Ans = 0 ;
								tTalkTimeInbound = 0; ssTotTalkTimeInbound = 0 ; 
								totTalkTimeInbound = 0; 		    
								tTalkTimeOutbound = 0; ssTotTalkTimeOutbound = 0 ; 
								totTalkTimeOutbound = 0;
    							tWrapUp =0; ssTotWrapUp = 0 ; totWrapUp =0;
								tHold = 0; ssTotHold = 0 ; totHold = 0 ;
    							tHandling = 0; ssTotHandling = 0 ;totHandling = 0;
    							tBusy = 0; ssTotBusy = 0; totBusy = 0;
								
							
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageRepdeData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Inbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Outbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Wrap up calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Hold calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Productivity"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Busy"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
				 groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);

				if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = groupsInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = groupsInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = groupsInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = groupsInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeInbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWrapUp+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHold+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHandling+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentBusy+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write(" \t\t\t");

				ssTotLoginTime_Ans =0;
				
				ssTotTalkTimeInbound = 0;
				percentTalkTimeInbound = "" ;
				
				ssTotTalkTimeOutbound = 0;
				percentTalkTimeOutbound ="" ;
				
				ssTotWrapUp = 0;
				percentWrapUp ="" ;
				
				ssTotHold = 0;
				percentHold ="" ;
				
    			ssTotHandling = 0 ;
				percentHandling ="" ;
				
    			ssTotBusy = 0 ;
				percentBusy ="" ;

				needOneMoreTotalRow_Ans = true;
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				
      out.write("\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentInboundTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentOutboundTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentWrapUpTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentHoldTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getProductivityRatio());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentBusyTime());
      out.write("</td>\n");
      out.write("\t\t\t\t  </tr>\n");
      out.write("\t\t\t\t");


			ssTotLoginTime_Ans	+=groupsInfo.totalLoginTime;
			totLoginTime_Ans +=groupsInfo.totalLoginTime;
			tLoginTime_Ans =groupsInfo.totalLoginTime;
					
			ssTotTalkTimeInbound += groupsInfo.totalTalkTimeInbound ;
			totTalkTimeInbound +=groupsInfo.totalTalkTimeInbound ;
			tTalkTimeInbound = groupsInfo.totalTalkTimeInbound ; 


			ssTotTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound ;
			totTalkTimeOutbound +=groupsInfo.totalTalkTimeOutbound ;
			tTalkTimeOutbound = groupsInfo.totalTalkTimeOutbound ; 

			ssTotWrapUp += groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime ;
			totWrapUp +=groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ;
			tWrapUp = groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ; 

			ssTotHold += groupsInfo.totalHoldTime ;
			totHold +=groupsInfo.totalHoldTime ;
			tHold = groupsInfo.totalHoldTime ; 

			ssTotHandling += groupsInfo.totalLoginTime - groupsInfo.non_prod_wrap - groupsInfo.non_prod_nrr;
			totHandling += groupsInfo.totalLoginTime - groupsInfo.non_prod_wrap - groupsInfo.non_prod_nrr;
			tHandling = groupsInfo.totalLoginTime - groupsInfo.non_prod_wrap - groupsInfo.non_prod_nrr;
			//ssTotHandling +=Long.parseLong(groupsInfo.getProductivityTime());
			//totHandling +=Long.parseLong(groupsInfo.getProductivityTime());
			//tHandling = Long.parseLong(groupsInfo.getProductivityTime());
			
			ssTotBusy += groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime;
			totBusy +=groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime;
			tBusy = groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime;
			

			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true)
			{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = groupsInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = groupsInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = groupsInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = groupsInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeInbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWrapUp+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHold+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHandling+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentBusy+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\n");
      out.write("\t\t\t");

				  }
				if((totLoginTime_Ans) !=0) 
				{


					tot_percentTalkTimeInbound = groupsInfo.formatDecimalDouble( ( (double)(totTalkTimeInbound*100)/totLoginTime_Ans), 2);
					tot_percentTalkTimeOutbound  = groupsInfo.formatDecimalDouble( ( (double)(totTalkTimeOutbound*100)/totLoginTime_Ans), 2);
					tot_percentWrapUp = groupsInfo.formatDecimalDouble( ( (double)(totWrapUp*100)/totLoginTime_Ans), 2);
					tot_percentHold = groupsInfo.formatDecimalDouble( ( (double)(totHold*100)/totLoginTime_Ans), 2);
					tot_percentHandling = groupsInfo.formatDecimalDouble( ( (double)(totHandling*100)/totLoginTime_Ans), 2);
					tot_percentBusy = groupsInfo.formatDecimalDouble( ( (double)(totBusy*100)/totLoginTime_Ans), 2);
					
				}
				  
			
      out.write("\n");
      out.write("\t \t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTalkTimeInbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentWrapUp+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentHold +"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentHandling+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentBusy+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
 pageRepdeData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t");

			 	}
			}
		
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage2\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Unanswered"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage2\" ) );\t\t \t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			if(detail.compareTo("0")==0) // rapport non detaille
			{
				if(sret == "success")
				 {
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.write('\r');
      out.write('\n');

beanManagerData pageRepUnData = new beanManagerData();
pageRepUnData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepUnData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	String percent ="";

      out.write("\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");

if(from.compareTo("groupReport") != 0){

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\t\t\t\t\t\t  </b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageRepUnData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepUnData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepUnData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Report for unanswered calls"));
      out.write("<br><br>\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUnData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	}
	else
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepUnData.getWord("Unanswered calls"));
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");

	}

      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
								 pageRepUnData.getWord("Waiting calls")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Waiting count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(groupsInfo.n_Wait));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Waiting/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.getWaitingPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\t\t\t \r\n");
      out.write("\t\t\t   <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalWaitTime));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Waiting average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(groupsInfo.getAvgWaitingTime());
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							pageRepUnData.getWord("Transfer calls")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Transfert count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(groupsInfo.n_single_transfer + groupsInfo.n_two_step_transfer));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Transfer/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.getTransferPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Transfert time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalSingleTransfer + groupsInfo.totalTwoStepTranfer));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Transfert average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(groupsInfo.getAvgTransferTime());
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							 pageRepUnData.getWord("Not ready calls")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not ready count"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(Long.toString(groupsInfo.n_NotReady));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not-Ready/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(groupsInfo.getNotReadyPerHour());
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not ready time"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(groupsInfo.buildReadableTime(groupsInfo.totalNotReadyTime));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not ready average"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						try {
							out.write(groupsInfo.getAvgNotReadyTime());
						}catch(Exception e){
							out.write("-");
						}
			
					
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	if(groupsInfo.totalNotReadyTime > 0){
		String name ="" , nombre="";
		String duree ="", nrr_percent="";
		int nb_not_ready_reason = (groupsInfo.NRR_vector.size())/4;

      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t  ");
      out.print(
					  pageRepUnData.getWord("Not ready reason")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t</b></td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t  <td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"20\"></td>\r\n");
      out.write("          <td></td>\r\n");
      out.write("          <td></td>\r\n");
      out.write("          <td></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"35%\" align=\"center\" style=\"border:solid\">\r\n");
      out.write("          ");
      out.print( pageRepUnData.getWord("Reason")
						);
      out.write("          </td>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"5%\" align=\"center\" style=\"border:solid\">\r\n");
      out.write("          ");
      out.print( pageRepUnData.getWord("Count")
						);
      out.write("          </td>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"15%\" align=\"center\" style=\"border:solid\">\r\n");
      out.write("          ");
      out.print( pageRepUnData.getWord("Time")
						);
      out.write("          </td>\r\n");
      out.write("          <td colspan=\"2\" height=\"20\" class=\"reportsID\" width=\"45%\" align=\"center\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("          ");
      out.print( pageRepUnData.getWord("Percentages compared to Not ready time")
						);
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        ");

		int j=0, v=0, w=0, y=0;
		for(int i=0; i < nb_not_ready_reason ; i++)
		{
			j=i*4;
	
      out.write("\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td class=\"reportsTabName\" width=\"35%\" style=\"border:solid\"><b>\r\n");
      out.write("            ");

							
							name =(String)groupsInfo.NRR_vector.elementAt(j);
							out.write(name);
						
      out.write("\r\n");
      out.write("          </b> </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"5%\" style=\"border:solid\">");

							w=j+1;
							nombre =(String)groupsInfo.NRR_vector.elementAt(w);
							out.write(nombre);
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"15%\" style=\"border:solid\">");

							v=j+2;
							duree =(String)groupsInfo.NRR_vector.elementAt(v);
							out.write(duree);
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"10%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");

							y=j+3;
							nrr_percent =(String)groupsInfo.NRR_vector.elementAt(y);
							out.write(nrr_percent);
							if (nrr_percent.compareTo("0.99%")<0 && nrr_percent.compareTo("0.00%")>0) {
								nrr_percent="1.00%";
							}
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"35%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(nrr_percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td width=\"95%\"  style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("                <td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("          </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        ");

		}
	
      out.write("\r\n");
      out.write("      </table></td>\r\n");
      out.write("\t</tr>\r\n");

	}
	if(groupsInfo.totalLoginTime > 0){

      out.write("\t\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Percentages compared to login time")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Login"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"100%\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\"  style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Wait"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = groupsInfo.getPercentWaitingTime() ;
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						
						
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Single transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = groupsInfo.getPercentSingleTransferTime();
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Two step transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = groupsInfo.getPercentTwoStepTranferTime() ;
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not ready"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = groupsInfo.getPercentNotReadyTime() ;
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	}
	
      out.write("\t\r\n");
      out.write("</table>\r\n");
 pageRepUnData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t");

				}
			}
			
			if( detail.compareTo("1")==0) // rapport detaille
			{
				HashMap mapNRR = (HashMap)beanAgentGroup.mapNrr;
				if(sret == "success")
				{
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.write('\r');
      out.write('\n');

beanManagerData pageRepUndData = new beanManagerData();
pageRepUndData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepUndData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write('\n');

    long tLoginTime = 0, ssTotLoginTime = 0, totLoginTime = 0 ;
	boolean needOneMoreTotalRow = false;
	
    long tNotReadyTime = 0 , ssTotNotReadyTime = 0, totNotReadyTime = 0;
    long tWaitTime = 0, ssTotWaitTime = 0, totWaitTime = 0;
    long tSingleTransferTime = 0, ssTotSingleTransferTime =0 , totSingleTransferTime = 0;
    long tTwoStepTransferTime = 0, ssTotTwoStepTransferTime =0 , totTwoStepTransferTime = 0;
	long nlogin =0, tot_nlogin=0;
	long nNotReadyTime = 0 , ssNNotReadyTime = 0, tot_nNotReadyTime = 0;
    long nWaitTime = 0, ssNWaitTime = 0, tot_nWaitTime = 0;
    long nSingleTransferTime = 0, ssNSingleTransferTime =0 , tot_nSingleTransferTime = 0;
    long nTwoStepTransferTime = 0, ssNTwoStepTransferTime =0 , tot_nTwoStepTransferTime = 0;

	long avglogin =0, tot_avglogin=0;
	long avgNotReadyTime = 0 , tot_avgNotReadyTime = 0;
    long avgWaitTime = 0, tot_avgWaitTime = 0;
    long avgSingleTransferTime = 0, tot_avgSingleTransferTime = 0;
    long avgTwoStepTransferTime = 0, tot_avgTwoStepTransferTime = 0;


	String percentNotReadyTime = "" , tot_percentNotReadyTime = "";
    String percentWaitTime = "", tot_percentWaitTime = "";
    String percentSingleTransferTime = "", tot_percentSingleTransferTime = "";
    String percentTwoStepTransferTime = "", tot_percentTwoStepTransferTime = "";

	String percentNRR = "", tot_percentNRR = "";
    groupsInfo =null;
	
    long [] tNotReadyReason =null;
    long [] totNotReadyReason =null;
    long [] ssTotNotReadyReason =null;
    long [] nNotReadyReason =null;
    long [] tot_nNotReadyReason =null;
    long [] ssNNotReadyReason =null;
	
	long tNotReadyTime_Nrr = 0,totNotReadyTime_Nrr = 0;
	int nb_NRR = 0;
	

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");

	if(from.compareTo("groupReport") != 0)
	{


      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageRepUndData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepUndData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepUndData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUndData.getWord("Detail report for unanswered calls"));
      out.write("<br><br>\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUndData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	}
	else
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepUndData.getWord("Unanswered calls"));
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");

	}

      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( pageRepUndData.getWord("Telephony data")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\"> ");
      out.print( pageRepUndData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Login time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Login count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Waiting count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Single transfer time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Single transfer count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Two step transfer time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Two step transfer count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Not ready time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Not ready count"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");

    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);


      out.write("\r\n");
      out.write(" \t\t\t");
 if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) {
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nlogin));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write(" \t\t\t");

				tLoginTime = 0;
				tNotReadyTime = 0;
    			tWaitTime = 0;
				tSingleTransferTime = 0;
				tTwoStepTransferTime = 0;
				nlogin =0;
				nNotReadyTime = 0 ;
				nWaitTime = 0;
				nSingleTransferTime = 0;
				nTwoStepTransferTime = 0;
				
				needOneMoreTotalRow = true;
			 }
 		 if(groupsInfo.totalLoginTime > 0){
		
      out.write("\r\n");
      out.write("\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t<td    align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_login));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalWaitTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_Wait));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalSingleTransfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_single_transfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalTwoStepTranfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_two_step_transfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalNotReadyTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_NotReady));
      out.write("</td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t<!-- end of array traversal-->\r\n");

    tLoginTime += groupsInfo.totalLoginTime;   totLoginTime += groupsInfo.totalLoginTime;
	tNotReadyTime +=groupsInfo.totalNotReadyTime ;  totNotReadyTime +=groupsInfo.totalNotReadyTime ;
	 tWaitTime +=groupsInfo.totalWaitTime  ;  totWaitTime +=groupsInfo.totalWaitTime  ; 
	 tSingleTransferTime +=groupsInfo.totalSingleTransfer  ;  totSingleTransferTime +=groupsInfo.totalSingleTransfer ; 
	 tTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ;  totTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ; 

     nlogin += groupsInfo.n_login; tot_nlogin += groupsInfo.n_login;
	 nNotReadyTime +=groupsInfo.n_NotReady  ;  tot_nNotReadyTime +=groupsInfo.n_NotReady  ; 
	 nWaitTime +=groupsInfo.n_Wait  ;  tot_nWaitTime +=groupsInfo.n_Wait  ; 
	 nSingleTransferTime +=groupsInfo.n_single_transfer  ;  tot_nSingleTransferTime +=groupsInfo.n_single_transfer ; 
	 nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; tot_nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; 
        
        }
    }
 	groupsInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true){
	
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nlogin));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t");

		  }
	
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nlogin));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t  ");

								out.write(pageRepUndData.getWord("Not ready reason"));
								needOneMoreTotalRow = false;
							    tNotReadyTime = 0; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								nb_NRR = beanAgentGroup.m_vAllNRR.size();
								String lg_table="";
								if(nb_NRR < 6) lg_table = Integer.toString(100 -(6-nb_NRR)*10)+"%";
								else  lg_table = Integer.toString(100)+"%";
							
      out.write("\r\n");
      out.write("\t\t\t\t\t</b></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"");
out.write(lg_table);
      out.write("\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
      out.print( pageRepUndData.getWord("Time period"));
      out.write(" </td>\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");

				   tNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   totNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   nNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   tot_nNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   ssNNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   ssTotNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   
					for(int k =0; k < beanAgentGroup.m_vAllNRR.size(); k++)
					{ 
						//creer autant de variable que de raison
					  tNotReadyReason[k] = 0;
					  totNotReadyReason[k]=0;
					   nNotReadyReason[k] =0;
					   tot_nNotReadyReason[k] =0;
					   ssNNotReadyReason[k] =0;
					   ssTotNotReadyReason[k] =0;
					  
					
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t<td width=\"6%\" colspan=\"3\" align=\"center\" style=\"border-style:solid; border-right-color: #949494\">");
      out.print(beanAgentGroup.m_vAllNRR.elementAt(k) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t  <tr class=\"reportsNRRCol\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
 out.write(" "); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");

					for(int k =0; k < beanAgentGroup.m_vAllNRR.size(); k++)
					{ 
					
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid;border-right-color:#CCCCCC\">");
 out.write("Time"); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write("Nb"); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid;border-right-color: #949494\">");
 out.write(" % "); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");
    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);
if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
			
      out.write("\r\n");
      out.write("\t\t \t<tr>\r\n");
      out.write("\t\t\t \t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
				{ 
						if((ssTotNotReadyTime) !=0) 
						{
							percentNRR = groupsInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
						}
						else 
						 percentNRR ="0.00";
						
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( groupsInfo.buildReadableTime(ssTotNotReadyReason[n])); 
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ ssNNotReadyReason[n]);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
 out.write(percentNRR);  
      out.write("</b></font></td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t");
	
					ssNNotReadyReason[n] =0;
					ssTotNotReadyReason[n] =0;
		} //fin for n  
      out.write("\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t");

			ssTotNotReadyTime =0;
			percentNRR = "" ;
			needOneMoreTotalRow = true;
		} // fin if groupsInfo.time.length() >10
			tNotReadyTime = groupsInfo.totalNotReadyTime ; 
			totNotReadyTime += groupsInfo.totalNotReadyTime ;
			ssTotNotReadyTime +=groupsInfo.totalNotReadyTime ;
		
      out.write("\r\n");
      out.write("\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
out.write(groupsInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t");

					for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
					{ 
						String key="";
						String nreadyreason = (String)beanAgentGroup.m_vAllNRR.elementAt(n);
						key = groupsInfo.datehour+"-"+ nreadyreason;
						beanAgentGroupReport.nrrdata tmpNrrElt = (beanAgentGroupReport.nrrdata)mapNRR.get(key);

						if(tmpNrrElt != null)
						{
						tNotReadyReason[n] = tmpNrrElt.nrrtime;	
						totNotReadyReason[n] += tmpNrrElt.nrrtime;
						ssTotNotReadyReason[n] += tmpNrrElt.nrrtime;
						nNotReadyReason[n] = tmpNrrElt.nrrcount;
						tot_nNotReadyReason[n] += tmpNrrElt.nrrcount;
						ssNNotReadyReason[n] += tmpNrrElt.nrrcount;
						}
						else
						{
						tNotReadyReason[n] = 0;	
						totNotReadyReason[n] += 0;
						ssTotNotReadyReason[n] += 0;
						nNotReadyReason[n] = 0;
						tot_nNotReadyReason[n] += 0;
						ssNNotReadyReason[n] += 0;
						}
						if(tNotReadyTime !=0)
						{
						percentNRR = groupsInfo.formatDecimalDouble( ( (double)((tNotReadyReason[n])*100)/tNotReadyTime), 2);	
						}
						else 
						 percentNRR ="0.00";
						
						
      out.write("\r\n");
      out.write("\t\t\t\t<td align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write( groupsInfo.buildReadableTime(tNotReadyReason[n])); 						 						
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\"> ");
 out.write(""+ nNotReadyReason[n]);  
      out.write("\t</td>\t\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\"> ");
 out.write(percentNRR);  
      out.write("\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
	
						
			} //fin for n  
      out.write("\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t\t");

		
	} //fin for
	groupsInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true)
	{
		
      out.write("\r\n");
      out.write("\t <tr>\r\n");
      out.write("\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t ");

		for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
		{ 
				if((ssTotNotReadyTime) !=0) 
				{
					percentNRR = groupsInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
				}
				else 
				 percentNRR ="0.00";
			
      out.write("\r\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( groupsInfo.buildReadableTime(ssTotNotReadyReason[n])); 
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ ssNNotReadyReason[n]);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
 out.write(percentNRR);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t");

			}
			
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t");

			} // fin for n
			  
		
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
				{ 
				if((totNotReadyTime) !=0) 
				{
					tot_percentNRR = groupsInfo.formatDecimalDouble( ( (double)((totNotReadyReason[n])*100)/totNotReadyTime), 2);
				}
				else 
				 tot_percentNRR ="0.00";
				
					
      out.write("\r\n");
      out.write("\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( groupsInfo.buildReadableTime(totNotReadyReason[n])); 
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ tot_nNotReadyReason[n]);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>\r\n");
      out.write("\t\t\t\t  ");
 out.write(tot_percentNRR);  
      out.write("\r\n");
      out.write("\t\t\t\t</b></font></td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
	
					} //fin for n  
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"24\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t  ");

								out.write(pageRepUndData.getWord("Average"));
								needOneMoreTotalRow = false;
								tNotReadyTime = 0 ; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								tWaitTime = 0; ssTotWaitTime = 0; totWaitTime = 0;
								tSingleTransferTime = 0; ssTotSingleTransferTime =0 ;
								totSingleTransferTime = 0;
								tTwoStepTransferTime = 0; ssTotTwoStepTransferTime =0 ;
								totTwoStepTransferTime = 0;
								nNotReadyTime = 0 ; ssNNotReadyTime = 0; tot_nNotReadyTime = 0;
								nWaitTime = 0; ssNWaitTime = 0; tot_nWaitTime = 0;
								nSingleTransferTime = 0; ssNSingleTransferTime =0 ;
								tot_nSingleTransferTime = 0;
								nTwoStepTransferTime = 0; ssNTwoStepTransferTime =0 ;
								tot_nTwoStepTransferTime = 0;
								
							
      out.write("\r\n");
      out.write("\t\t\t\t\t</b></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageRepUndData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Waiting calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Single transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Two step transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Not ready calls"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");
    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);
if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
				if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
				if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
				if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
				
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write(" \t\t\t");

				ssTotNotReadyTime = 0;
				ssNNotReadyTime = 0;
				avgNotReadyTime = 0 ;
				
				ssTotWaitTime = 0;
				ssNWaitTime = 0;
				avgWaitTime = 0;
				
				ssTotSingleTransferTime = 0;
				ssNSingleTransferTime = 0;
				avgSingleTransferTime = 0;
				
				ssTotTwoStepTransferTime = 0;
				ssNTwoStepTransferTime = 0;
				avgTwoStepTransferTime = 0;
				
				needOneMoreTotalRow = true;
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgWaitingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgSingleTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgTwoStepTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgNotReadyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");


			ssTotNotReadyTime += groupsInfo.totalNotReadyTime ;
			ssNNotReadyTime += groupsInfo.n_NotReady;
			totNotReadyTime +=groupsInfo.totalNotReadyTime ; 
			tot_nNotReadyTime +=groupsInfo.n_NotReady  ; 
			tNotReadyTime = groupsInfo.totalNotReadyTime ;  
			nNotReadyTime =groupsInfo.n_NotReady  ; 
			
			ssTotWaitTime += groupsInfo.totalWaitTime;
			ssNWaitTime += groupsInfo.n_Wait;
			totWaitTime +=groupsInfo.totalWaitTime  ; 
			tot_nWaitTime +=groupsInfo.n_Wait  ;
			tWaitTime =groupsInfo.totalWaitTime  ;  
			nWaitTime =groupsInfo.n_Wait  ;  

			ssTotSingleTransferTime += groupsInfo.totalSingleTransfer;
			ssNSingleTransferTime += groupsInfo.n_single_transfer;
			totSingleTransferTime +=groupsInfo.totalSingleTransfer ; 
			tot_nSingleTransferTime +=groupsInfo.n_single_transfer ; 
	 		tSingleTransferTime +=groupsInfo.totalSingleTransfer  ;  
	 		nSingleTransferTime +=groupsInfo.n_single_transfer  ; 

			ssTotTwoStepTransferTime = groupsInfo.totalTwoStepTranfer;
			ssNTwoStepTransferTime = groupsInfo.n_two_step_transfer;
			totTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ; 
			tot_nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; 
			tTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ;  
			nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; 
				
			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
			if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
			if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
			if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
			if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
						
			
      out.write("\r\n");
      out.write("\t\t\t \t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");

				  }
				  if((tot_nNotReadyTime) !=0) tot_avgNotReadyTime = (totNotReadyTime/tot_nNotReadyTime);
				if((tot_nWaitTime) !=0) tot_avgWaitTime = (totWaitTime/tot_nWaitTime);
				if((tot_nSingleTransferTime) !=0) tot_avgSingleTransferTime = (totSingleTransferTime/tot_nSingleTransferTime);
				if((tot_nTwoStepTransferTime) !=0) tot_avgTwoStepTransferTime = (totTwoStepTransferTime/tot_nTwoStepTransferTime);
				  
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageRepUndData.getWord("Percentages compared to login time"));
								needOneMoreTotalRow = false;
    							tLoginTime = 0; ssTotLoginTime = 0; totLoginTime = 0 ;
								tNotReadyTime = 0 ; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								tWaitTime = 0; ssTotWaitTime = 0; totWaitTime = 0;
								tSingleTransferTime = 0; ssTotSingleTransferTime =0 ;
								totSingleTransferTime = 0;
								tTwoStepTransferTime = 0; ssTotTwoStepTransferTime =0 ;
								totTwoStepTransferTime = 0;
								
							
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\">");
      out.print( pageRepUndData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Waiting calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Single transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Two step transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Not ready calls"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t");
    
			for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
        	 groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);
			if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime) !=0) 
				{

					percentNotReadyTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWaitTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentSingleTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTwoStepTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentNotReadyTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write(" \t\t\t");

				ssTotLoginTime =0;

				ssTotNotReadyTime = 0; 
				ssTotWaitTime = 0;
				ssTotSingleTransferTime =0 ;
				ssTotTwoStepTransferTime =0 ;

				percentNotReadyTime = "" ;
				percentWaitTime = "";
				percentSingleTransferTime = "";
				percentTwoStepTransferTime = "";

				needOneMoreTotalRow = true;
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentWaitingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentSingleTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentTwoStepTranferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentNotReadyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");


			ssTotLoginTime	+=groupsInfo.totalLoginTime;
			totLoginTime +=groupsInfo.totalLoginTime;
			tLoginTime =groupsInfo.totalLoginTime;
					
			ssTotNotReadyTime += groupsInfo.totalNotReadyTime;
			totNotReadyTime +=groupsInfo.totalNotReadyTime; ;
			tNotReadyTime = groupsInfo.totalNotReadyTime; ; 

			ssTotWaitTime += groupsInfo.totalWaitTime ;
			totWaitTime += groupsInfo.totalWaitTime ;
			tWaitTime = groupsInfo.totalWaitTime ; 

			ssTotSingleTransferTime += groupsInfo.totalSingleTransfer;
			totSingleTransferTime += groupsInfo.totalSingleTransfer;
			tSingleTransferTime = groupsInfo.totalSingleTransfer;

			ssTotTwoStepTransferTime += groupsInfo.totalTwoStepTranfer ;
			totTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ;
			tTwoStepTransferTime = groupsInfo.totalTwoStepTranfer  ; 

			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
				if((ssTotLoginTime) !=0) 
				{
					percentNotReadyTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWaitTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentSingleTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTwoStepTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentNotReadyTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t");

				  }
				if((totLoginTime) !=0) 
				{
					tot_percentNotReadyTime = groupsInfo.formatDecimalDouble( ( (double)(totNotReadyTime*100)/totLoginTime), 2);
					tot_percentWaitTime  = groupsInfo.formatDecimalDouble( ( (double)(totWaitTime*100)/totLoginTime), 2);
					tot_percentSingleTransferTime = groupsInfo.formatDecimalDouble( ( (double)(totSingleTransferTime*100)/totLoginTime), 2);
					tot_percentTwoStepTransferTime = groupsInfo.formatDecimalDouble( ( (double)(totTwoStepTransferTime*100)/totLoginTime), 2);

				}
				  
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentWaitTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentSingleTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTwoStepTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentNotReadyTime +"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
 pageRepUndData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t");

				}
			}
			
			
		
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage3\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Statistics"));
      out.write("</h2>\t\t\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage3\" ) ); \t\t\t \t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

		sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
			 if(sret == "success")
			 {
				groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
				
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write('\r');
      out.write('\n');

	//String percent ="";
	String totNotReadyTime_Percent = "" , totTalkTimeInbound_Percent = "";
    String totTalkTimeOutbound_Percent = "", totWaitTime_Percent = "" , totWrapUp_Percent ="";
	String totHold_Percent = "" , totSingleTransfert_Percent ="", totTwoStepTransfert_Percent ="";
	String totOther_Percent = "";
	String lang = "0";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");
		
	beanManagerData pageRepstatsData = new beanManagerData();
	pageRepstatsData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageRepstatsData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	
		

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t");

	if(from.compareTo("groupReport") !=0)
	{
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\t\t\t\t\t  </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("Generals statistics"));
      out.write("&nbsp;");
      out.print( pageRepstatsData.getWord("for"));
      out.write("<br><br>\r\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("To"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	}
	else
	{
		String wd1 ="100%", wd2 ="70%";
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table   ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}
				else { out.write ("width=70%"); out.write("align=center"); }
      out.write(">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepstatsData.getWord("Generals statistics"));
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" ");
 if(detail.compareTo("1")==0 )  { out.write("align=left");}
				else {out.write("align=center"); }
      out.write(">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");

					totNotReadyTime_Percent = Long.toString(groupsInfo.totalNotReadyTime);
					totTalkTimeInbound_Percent = Long.toString(groupsInfo.totalTalkTimeInbound);
					totTalkTimeOutbound_Percent =Long.toString(groupsInfo.totalTalkTimeOutbound);
					totWaitTime_Percent = Long.toString(groupsInfo.totalWaitTime);
					totWrapUp_Percent =Long.toString(groupsInfo.totalWrapUpOutTime + groupsInfo.totalWrapUpInTime);
					totHold_Percent = Long.toString(groupsInfo.totalHoldTime) ;
					//totSingleTransfert_Percent = Long.toString(groupsInfo.totalSingleTransfer);
					//totTwoStepTransfert_Percent = Long.toString(groupsInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(groupsInfo.totalLoginTime - groupsInfo.totalNotReadyTime - 
														groupsInfo.totalTalkTimeInbound - groupsInfo.totalTalkTimeOutbound -
														groupsInfo.totalWaitTime - groupsInfo.totalWrapUpOutTime -
														groupsInfo.totalWrapUpInTime - groupsInfo.totalHoldTime ); 
														//groupsInfo.totalSingleTransfer - groupsInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(groupsInfo.totalLoginTime - groupsInfo.totalNotReadyTime - 
														groupsInfo.totalTalkTimeInbound - groupsInfo.totalTalkTimeOutbound -
														groupsInfo.totalWaitTime - groupsInfo.totalWrapUpOutTime -
														groupsInfo.totalWrapUpInTime - groupsInfo.totalHoldTime - 
														groupsInfo.totalSingleTransfer - groupsInfo.totalTwoStepTranfer);

					out.write("<applet code='Manager.PieChart.PiechartApplet.class'  archive='../sAheevaChart.jar' width='650' height='320' mayscript name='graphApplet'>");
						// Start Up Parameters -->
						
					out.write("<PARAM name='LOADINGMESSAGE' value='"+pageRepstatsData.getWord("graphloadingmessage")+"'>");					
					
					out.write("<PARAM name='STEXTCOLOR'     value='0,0,100'>");
					out.write("<PARAM name='STARTUPCOLOR'   value='255,255,255'>");
						//Character Encoding -->
					out.write("<PARAM name='charset'   value='8859_1'>");
						
						//Chart Switches -->
					out.write("<PARAM name='3D' value='true'>");
					out.write("<PARAM name='Slabels' value='true'>");
					out.write("<PARAM name='legend'  value='true'>");
					out.write("<PARAM name='displayPercentages' value='true'>");
						
						//Chart Characteristics -->
					out.write("<PARAM name='width'      value='550'>");
					out.write("<PARAM name='height'     value='250'>");
					out.write("<PARAM name='nPies'      value='1'>");
					out.write("<PARAM name='depth3D'    value='15'>");
					out.write("<PARAM name='ndecplaces' value='0'>");
					out.write("<PARAM name='3Dangle'    value='50'>");
						 
						// Thousand separator -->
					out.write("<PARAM name='thousandseparator' value=''>");
						
						//Link Cursor -->
						//valid values are - crosshair, default, hand, move, text or wait -->
					out.write("<PARAM name='linkCursor' value='default'>");
						
						//Popup segment Value Pre & Post Symbols -->
					out.write("<PARAM name='valuepresym'  value=''>");
					out.write("<PARAM name='valuepostsym'  value=' '>");
						
						//Additional font information -->
					out.write("<PARAM name='popupfont'  value='Arial,B,12'>");
					out.write("<PARAM name='slabelfont' value='Arial,N,10'>");
						
						// Additional color information -->				
					out.write("<PARAM name='bgcolor'      value='white'>");
					out.write("<PARAM name='labelcolor'   value='50,50,50'>");
						
						
						// Legend Information -->
					out.write("<PARAM name='legendfont'       value='Arial,N,10'>");
					out.write("<PARAM name='legendposition'   value='420,10'>");
					
					out.write("<PARAM name='legendtitle'   value='"+ pageRepstatsData.getWord("calls") +"'>");
					
					out.write("<PARAM name='LegendBackground' value='255,255,255'>");
					out.write("<PARAM name='LegendBorder'     value='125,125,125'>");
					out.write("<PARAM name='LegendtextColor'  value='0,0,0'>");
						
						//Pie Data -->
						//  PieN   x,y,size,number of segments, seperation -->
					out.write("<PARAM name='Pie1' value='110,50,175,9,5'>");
					
						//Pie Segement Labels -->
					out.write("<PARAM name='pie1label1' value=''>");
					out.write("<PARAM name='pie1label2' value=''>");
					out.write("<PARAM name='pie1label3' value=''>");
					out.write("<PARAM name='pie1label4' value=''>");
					out.write("<PARAM name='pie1label5' value=''>");
					out.write("<PARAM name='pie1label6' value=''>");
					out.write("<PARAM name='pie1label7' value=''>");
					//out.write("<PARAM name='pie1label8' value=''>");
					//out.write("<PARAM name='pie1label9' value=''>");
					out.write("<PARAM name='pie1label9' value=''>");
						
						
					out.write("<PARAM name='segment1'   value='115,152,164|"+ pageRepstatsData.getWord("inbound") +"'>");				
					
					out.write("<PARAM name='segment2'   value='99,99,156|"+ pageRepstatsData.getWord("outbound") +"'>");				
					
					out.write("<PARAM name='segment3'   value='185,53,8|"+ pageRepstatsData.getWord("wrapup") +"'>");
					
					out.write("<PARAM name='segment4'   value='239,214,115|"+ pageRepstatsData.getWord("hold") +"'>");
									
					out.write("<PARAM name='segment5'   value='100,100,60|"+ pageRepstatsData.getWord("waiting") +"'>");
													
					out.write("<PARAM name='segment6'   value='17,97,158|"+ pageRepstatsData.getWord("notready") +"'>");
									
					out.write("<PARAM name='segment7'   value='100,214,50|"+ pageRepstatsData.getWord("singletransfer") +"'>");
											
					out.write("<PARAM name='segment8'   value='180,0,230|"+ pageRepstatsData.getWord("twosteptransfer") +"'>");	
					
					out.write("<PARAM name='segment9'   value='228,115,64|"+ pageRepstatsData.getWord("Dialing") +"'>");	
					
					
					out.write("<PARAM name='data1series1' value=\""+totTalkTimeInbound_Percent+"\">");
					out.write("<PARAM name='data2series1' value=\""+totTalkTimeOutbound_Percent+"\">");
					out.write("<PARAM name='data3series1' value=\""+totWrapUp_Percent+"\">");
					out.write("<PARAM name='data4series1' value=\""+totHold_Percent+"\">");
					out.write("<PARAM name='data5series1' value=\""+totWaitTime_Percent+"\">");
					out.write("<PARAM name='data6series1' value=\""+totNotReadyTime_Percent+"\">");
					//out.write("<PARAM name='data7series1' value=\""+totSingleTransfert_Percent+"\">");
					//out.write("<PARAM name='data8series1' value=\""+totTwoStepTransfert_Percent+"\">");
					out.write("<PARAM name='data7series1' value=\""+totOther_Percent+"\">");
					out.write("<PARAM name='data9series1' value=\""+totOther_Percent+"\">");
					 
						
					out.write("</applet>");
				
					
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	if(from.compareTo("groupReport") !=0)
	{
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<b>\t");
      out.print( pageRepstatsData.getWord("Other statistics"));
      out.write(" </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	}
	else
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}
				else { out.write ("width=70%"); out.write("align=center"); }
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepstatsData.getWord("Other statistics"));
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}
				else { out.write ("width=70%"); out.write("align=center"); }
      out.write(" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\"style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"15%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("Sheduled time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t  ");

						out.write(groupsInfo.getScheduled());
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("Login"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
					
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <!--\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\tTotal Productivity Time</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(groupsInfo.getProductivityTime());
					
      out.write("\t\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>-->\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("Adherence"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(groupsInfo.getAdherence());
					
      out.write("\t\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  \r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("</table>\t\t\r\n");
 pageRepstatsData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t");

			}
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tsetupAllTabs();\r\n");
      out.write("</script>\r\n");

}

else
{


      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"groupReports\">\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Answered"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage1\" ) );  \t\t\t \t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			
			if(detail.compareTo("0")==0) // non non detaille
			{
				for(int obj =0; obj < numObjects; obj++ )
				{
					group =tabObj[obj];
					tokGrp = new java.util.StringTokenizer(group,",");
					groupName =tokGrp.nextToken();
					groupId = tokGrp.nextToken();
					System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	
					
					sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
					beanAgentGroup.BuildGlobalNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin BuildGlobalNotReadyReasonForPeriod ds JSP");	
					groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
					if(sret == "success")
					 {
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageRepAData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepAData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageRepAData.openConnection();

	String percent_Ans ="";

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var lang =normalizeString(QueryString('lang'));\n");
      out.write("</script>\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t\t  <b>\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\n");
      out.write("\t\t\t\t\t\t  [\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\n");
      out.write("\t\t\t\t\t  \t ]\n");
      out.write("\t\t\t\t\t  </b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
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
								  out.write(pageRepAData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepAData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepAData.getWord("Yearly"));
								}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepAData.getWord("Report for answered calls"));
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
      out.print( pageRepAData.getWord("To"));
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
      out.write("\t");

	if(from.compareTo("groupReport") == 0)
	{
	 
      out.write("\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepAData.getWord("Answered calls"));
      out.write("\t\n");
      out.write("\t\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t\t\t</font>\n");
      out.write("\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t\t</table>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t");

	}
	
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepAData.getWord("Login details"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Login time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Login count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(Long.toString(groupsInfo.n_login));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepAData.getWord("Inbound calls"));
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Inbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(groupsInfo.n_Inbound));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.getInboundPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Inbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeInbound));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  <tr >\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepAData.getWord("Inbound average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(groupsInfo.getAvgTalktimeInbound());
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepAData.getWord("Outbound calls"));
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table></td></tr><tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepAData.getWord("Outbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(Long.toString(groupsInfo.n_Outbound));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\n");
      out.write("\t\t\t\t  </tr>\n");
      out.write("\t\t\t\t  <tr >\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepAData.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {out.write(groupsInfo.getOutboundPerHour());}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr><tr >\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Outbound time"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeOutbound));}catch(Exception e){out.write("unknown");}
      out.write("</td></tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Outbound average"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
try {out.write(groupsInfo.getAvgTalktimeOutbound());}catch(Exception e){out.write("unknown");}
      out.write(" </td></tr></table></td></tr><tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><b>");
      out.print( pageRepAData.getWord("Wrap up calls"));
      out.write("</b></td></tr></table></td></tr><tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \"><tr><td height=\"10\"></td></tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrap up count"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(Long.toString(groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up));}catch(Exception e){out.write("unknown");}
      out.write("</td></tr> <tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrap_up/hour"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.getWrapUpPerHour());}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrap up time"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.buildReadableTime(groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime));}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr> <tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrap up average"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
try {out.write(groupsInfo.getAvgWrapUpTime());}catch(Exception e){out.write("unknown");}
      out.write(" </td> </tr></table></td></tr><tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><b>");
      out.print( pageRepAData.getWord("Hold calls"));
      out.write("</b></td></tr></table></td></tr><tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \"> <tr><td height=\"10\"></td></tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold count"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\"  style=\"border-style:solid; border-width:medium\">");
 try {out.write(Long.toString(groupsInfo.n_hold));}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr> <tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold/hour"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.getHoldPerHour());}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr><tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold time"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
 try {out.write(groupsInfo.buildReadableTime(groupsInfo.totalHoldTime));}catch(Exception e){out.write("unknown");}
      out.write("</td> </tr> <tr ><td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold average"));
      out.write("</td><td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">");
try {out.write(groupsInfo.getAvgTalktimeHold());}catch(Exception e){out.write("unknown");}
      out.write(" </td> </tr></table></td></tr>");
if(groupsInfo.totalLoginTime > 0){
      out.write("<tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><b>");
      out.print( pageRepAData.getWord("Percentages compared to login time"));
      out.write("</b></td></tr></table></td></tr><tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \"><tr><td height=\"10\"></td></tr><tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Login"));
      out.write("</td><td class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\"></td><td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"100%\" height=\"10\" align=\"left\"><tr><td width=\"95%\"  style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td></tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Handling"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentHandlingTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td><td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr> </table></td></tr><tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Busy"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentBusyTime();out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td><td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td></tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Inbound"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentInboundTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr> </table></td> </tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Outbound"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentOutboundTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td><td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td> </tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Wrapup"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try{percent_Ans = groupsInfo.getPercentWrapUpTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td> </tr> <tr ><td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">");
      out.print( pageRepAData.getWord("Hold"));
      out.write("</td><td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");
try {percent_Ans = groupsInfo.getPercentHoldTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\"><tr><td width=\"95%\" style=\"background-color:#BCBCDE\"></td><td width=\"5%\" style=\"background-color:#F4F4F4\"></td></tr></table></td></tr></table></td></tr>");
}
      out.write("</table>\n");
 pageRepAData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");

					}
					
					
				
			    } //fin for
			}	
			if(detail.compareTo("1")==0) // rapport detaille
			{
				for(int obj =0; obj < numObjects; obj++ )
				{
					group =tabObj[obj];
					tokGrp = new java.util.StringTokenizer(group,",");
					groupName =tokGrp.nextToken();
					groupId = tokGrp.nextToken();
					System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	
				
					sret = beanAgentGroup.buildGroupDetailsInfosForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin buildGroupDetailsInfosForPeriod ds JSP");	
					beanAgentGroup.beanAgentGroupGettingNameNrr(groupId,reportType,startingDate,endingDate);
					System.out.println("fin beanAgentGroupGettingNameNrr ds JSP");
					beanAgentGroup.BuildDetailsNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin BuildDetailsNotReadyReasonForPeriod ds JSP");	
					
					if(sret == "success")
					 {
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
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

beanManagerData pageRepdeData = new beanManagerData();
pageRepdeData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepdeData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write('\n');

	//String percent ="";
    long tLoginTime_Ans = 0, ssTotLoginTime_Ans = 0, totLoginTime_Ans = 0 ;
    long tTalkTimeInbound = 0, ssTotTalkTimeInbound = 0 ,totTalkTimeInbound = 0;
    long tTalkTimeOutbound = 0, ssTotTalkTimeOutbound = 0 ,totTalkTimeOutbound = 0;
    long tTime = 0, totTime = 0;
    long tWrapUp =0, ssTotWrapUp = 0 , totWrapUp =0;
	long tHold = 0, ssTotHold = 0 , totHold = 0 ;
    long t_N_login =0, ssNLoginTime = 0, tot_N_login =0;
    long t_n_Inbound =0, ssNInbound =0, tot_n_Inbound =0;
    long t_n_Outbound =0, ssNOutbound =0, tot_n_Outbound =0;
    long t_n_Wrap_up =0, ssNWrap_up =0, tot_n_Wrap_up =0 ;
	long t_n_Hold = 0, ssNHold =0, tot_n_Hold = 0;
    long tHandling = 0, ssTotHandling = 0 ,totHandling = 0;
    long t_n_Handling =0, ssNHandling =0, tot_n_Handling =0;
    long tBusy = 0, ssTotBusy = 0 ,totBusy = 0;
    long t_n_Busy =0, ssNBusy =0, tot_n_Busy =0;
	long ssTotWrapUpIn =0, ssTotWrapUpOut =0, totWrapUpIn =0, totWrapUpOut =0;

	long avgTalkTimeInbound = 0 , tot_avgTalkTimeInbound = 0;
    long avgTalkTimeOutbound = 0, tot_avgTalkTimeOutbound = 0;
    long avgWrapUp = 0, tot_avgWrapUp = 0;
    long avgHold = 0, tot_avgHold = 0;
    long avgHandling = 0, tot_avgHandling = 0;
	long ahtIn =0, tot_ahtIn=0, ahtOut=0, tot_ahtOut =0;

	String percentTalkTimeInbound = "" , tot_percentTalkTimeInbound = "";
    String percentTalkTimeOutbound = "", tot_percentTalkTimeOutbound = "";
    String percentWrapUp = "", tot_percentWrapUp = "";
    String percentHold = "", tot_percentHold = "";
    String percentHandling = "", tot_percentHandling = "";
    String percentBusy = "", tot_percentBusy = "";

	boolean needOneMoreTotalRow_Ans = false;
    groupsInfo =null;

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

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\n");
      out.write("\t\t\t\t\t\t  [\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\n");
      out.write("\t\t\t\t\t  \t ]\n");
      out.write("\t\t\t\t\t  </b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
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
								  out.write(pageRepdeData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepdeData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepdeData.getWord("Yearly"));
								}
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepdeData.getWord("Details Report for answered calls"));
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
      out.print( pageRepdeData.getWord("To"));
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
      out.write("\t");

	if(from.compareTo("groupReport") == 0)
	{
	 
      out.write("\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepdeData.getWord("Answered calls"));
      out.write("\t\n");
      out.write("\t\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t\t\t</font>\n");
      out.write("\t\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t\t</table>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t");

	}
	
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
						 pageRepdeData.getWord("Telephony data")
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
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\">");
      out.print( pageRepdeData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Login time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Login count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Inbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Inbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Outbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Outbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Wrap up time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Wrap up count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Hold time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Hold count"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");

    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);


      out.write("\n");
      out.write(" \t\t\t");
 if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) {
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tLoginTime_Ans));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_N_login));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Inbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Outbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Wrap_up));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tHold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Hold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\n");
      out.write(" \t\t\t");

				tLoginTime_Ans = 0;
				tTalkTimeInbound = 0;
				tTalkTimeOutbound = 0;
				tWrapUp  = 0;
				tHold =0;
				t_N_login =0;
				t_n_Inbound =0;
				t_n_Outbound =0;
				t_n_Wrap_up =0;
				t_n_Hold = 0;
				needOneMoreTotalRow_Ans = true;
			 }
 		 if(groupsInfo.totalLoginTime > 0){
		
      out.write("\n");
      out.write("\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t<td    align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_login));
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeInbound));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_Inbound));
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeOutbound));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_Outbound));
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalWrapUpInTime+groupsInfo.totalWrapUpOutTime));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_Wrap_In_up+groupsInfo.n_Wrap_Out_up) );
      out.write("</td>\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalHoldTime));
      out.write("</td>\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_hold));
      out.write("</td>\n");
      out.write("\t  </tr>\n");
      out.write("\t<!-- end of array traversal-->\n");

        tLoginTime_Ans += groupsInfo.totalLoginTime;   totLoginTime_Ans += groupsInfo.totalLoginTime;
        tTalkTimeInbound += groupsInfo.totalTalkTimeInbound;  totTalkTimeInbound += groupsInfo.totalTalkTimeInbound;
        tTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound; totTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound;
        tWrapUp  += groupsInfo.totalWrapUpInTime; totWrapUp  += groupsInfo.totalWrapUpInTime;
        tWrapUp  += groupsInfo.totalWrapUpOutTime; totWrapUp  += groupsInfo.totalWrapUpOutTime;
        tHold += groupsInfo.totalHoldTime; totHold += groupsInfo.totalHoldTime;

        t_N_login += groupsInfo.n_login; tot_N_login += groupsInfo.n_login;
        t_n_Inbound += groupsInfo.n_Inbound; tot_n_Inbound += groupsInfo.n_Inbound;
        t_n_Outbound += groupsInfo.n_Outbound; tot_n_Outbound += groupsInfo.n_Outbound;

        t_n_Wrap_up += groupsInfo.n_Wrap_In_up;  tot_n_Wrap_up += groupsInfo.n_Wrap_In_up;
        t_n_Wrap_up += groupsInfo.n_Wrap_Out_up;  tot_n_Wrap_up += groupsInfo.n_Wrap_Out_up;
        t_n_Hold += groupsInfo.n_hold; tot_n_Hold += groupsInfo.n_hold;
        }
    }
 	groupsInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow_Ans == true){
	
      out.write("\n");
      out.write("\t <tr>\n");
      out.write("\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tLoginTime_Ans));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_N_login));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Inbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Outbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Wrap_up));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tHold));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Hold));
      out.write("</b></font></td>\n");
      out.write("\t</tr>\n");
      out.write("\n");
      out.write("\t");

		  }
	
      out.write("\n");
      out.write("\t <tr>\n");
      out.write("\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totLoginTime_Ans));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_N_login));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Inbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Outbound));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Wrap_up));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totHold));
      out.write("</b></font></td>\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Hold));
      out.write("</b></font></td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
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

								out.write(pageRepdeData.getWord("Average"));
								needOneMoreTotalRow_Ans = false;
								tTalkTimeInbound = 0; ssTotTalkTimeInbound = 0 ; 
								totTalkTimeInbound = 0; 		    
								tTalkTimeOutbound = 0; ssTotTalkTimeOutbound = 0 ; 
								totTalkTimeOutbound = 0;
    							tWrapUp =0; ssTotWrapUp = 0 ; totWrapUp =0;
								tHold = 0; ssTotHold = 0 ; totHold = 0 ;
    							tHandling = 0; ssTotHandling = 0 ;totHandling = 0;
    							tBusy = 0; ssTotBusy = 0; totBusy = 0;

    							t_n_Inbound =0; ssNInbound =0; tot_n_Inbound =0;
								t_n_Outbound =0; ssNOutbound =0; tot_n_Outbound =0;
								t_n_Wrap_up =0; ssNWrap_up =0; tot_n_Wrap_up =0 ;
								t_n_Hold = 0; ssNHold =0; tot_n_Hold = 0;
								tHandling = 0; ssTotHandling = 0 ;totHandling = 0;
								t_n_Handling =0; ssNHandling =0; tot_n_Handling =0;
								tBusy = 0; ssTotBusy = 0 ;totBusy = 0;
								t_n_Busy =0; ssNBusy =0; tot_n_Busy =0;
								
							
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageRepdeData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Inbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print( pageRepdeData.getWord("Outbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Wrap up calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Hold calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("AHT in"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("AHT out"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t");

		for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
			 groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);

				if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssNInbound) !=0) {
				avgTalkTimeInbound = (ssTotTalkTimeInbound/ssNInbound);
				// Add Hold Time to inbound only if agent were spent more time on Inbound calls than on Outbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)>=(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn+ ssTotHold)/ssNInbound;
						} else {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn)/ssNInbound;
						}
					}
					if((ssNOutbound) !=0){
						avgTalkTimeOutbound = (ssTotTalkTimeOutbound/ssNOutbound);
						
						// Add Hold Time to outbound only if agent were spent more time on Outbound calls than on Inbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)<(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut+ ssTotHold)/ssNOutbound;
						} else {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut)/ssNOutbound;						
						}
				 }
				if((ssNOutbound + ssNOutbound) !=0) avgWrapUp = (ssTotWrapUp/(ssNOutbound + ssNOutbound));
				if((ssNOutbound + ssNOutbound) !=0) avgHold = (ssTotHold/(ssNOutbound + ssNOutbound));
				if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
				System.out.println("ahtOut 1 : " + groupsInfo.buildReadableTime(ahtOut));
				
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgHold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(ahtIn));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(ahtOut));
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write(" \t\t\t");

				ssTotTalkTimeInbound = 0;
				ssNInbound = 0;
				avgTalkTimeInbound = 0 ;
				
				ssTotTalkTimeOutbound = 0;
				ssNOutbound = 0;
				avgTalkTimeOutbound  = 0;
				
				ssTotWrapUp = 0;
				ssNWrap_up = 0;
				avgWrapUp = 0;

				ssTotWrapUpIn =0;
				ssTotWrapUpOut =0;

				ssTotHold = 0;
				ssNHold = 0;
				avgHold = 0;
				
    			ssTotHandling = 0 ;
				ssNHandling =0;
    			avgHandling = 0;
				ahtIn=0;
				ahtOut=0;
				
				needOneMoreTotalRow_Ans = true;
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				
      out.write("\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgTalktimeInbound());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgTalktimeOutbound());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgWrapUpTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgTalktimeHold());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAhtIn());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAhtOut());
      out.write("</td>\n");
      out.write("\t\t\t\t  </tr>\n");
      out.write("\t\t\t\t");


			System.out.println("ahtOut 2 : " + groupsInfo.getAhtOut());
			System.out.println("test : " + groupsInfo.totalTalkTimeOutbound + groupsInfo.totalWrapUpOutTime + ssTotHold + groupsInfo.n_Outbound);

			ssTotTalkTimeInbound += groupsInfo.totalTalkTimeInbound ;
			ssNInbound+= groupsInfo.n_Inbound;
			totTalkTimeInbound +=groupsInfo.totalTalkTimeInbound ;
			tot_n_Inbound +=groupsInfo.n_Inbound  ; 
			tTalkTimeInbound = groupsInfo.totalTalkTimeInbound ; 
			t_n_Inbound =groupsInfo.n_Inbound  ; 

			ssTotTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound ;
			ssNOutbound += groupsInfo.n_Outbound;
			totTalkTimeOutbound +=groupsInfo.totalTalkTimeOutbound ;
			tot_n_Outbound +=groupsInfo.n_Outbound  ; 
			tTalkTimeOutbound = groupsInfo.totalTalkTimeOutbound ; 
			t_n_Outbound =groupsInfo.n_Outbound  ; 

			ssTotWrapUp += groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime ;
			ssNWrap_up+= groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up;
			totWrapUp +=groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ;
			tot_n_Wrap_up +=groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up; 
			tWrapUp = groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ; 
			t_n_Wrap_up =groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up;

			ssTotWrapUpIn += groupsInfo.totalWrapUpInTime;
			ssTotWrapUpOut += groupsInfo.totalWrapUpOutTime ;
			totWrapUpIn+= groupsInfo.totalWrapUpInTime;
			totWrapUpOut += groupsInfo.totalWrapUpOutTime ;

			ssTotHold += groupsInfo.totalHoldTime ;
			ssNHold+= groupsInfo.n_hold;
			totHold +=groupsInfo.totalHoldTime ;
			tot_n_Hold +=groupsInfo.n_hold  ; 
			tHold = groupsInfo.totalHoldTime ; 
			t_n_Hold =groupsInfo.n_hold  ; 


			System.out.println("ssTotWrapUpOut : " + ssTotWrapUpOut);
			System.out.println("ssTotTalkTimeOutbound : " + ssTotTalkTimeOutbound);
			System.out.println("ssTotHold : " + ssTotHold);
			System.out.println("ssNOutbound : " + ssNOutbound);
			

			ssTotHandling += groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			ssNHandling+= groupsInfo.n_Inbound + groupsInfo.n_Outbound;
			totHandling +=groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			tot_n_Handling += groupsInfo.n_Inbound + groupsInfo.n_Outbound;
			tHandling = groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			t_n_Handling = groupsInfo.n_Inbound + groupsInfo.n_Outbound;
			
			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true)
			{
				if((ssNInbound) !=0) {
				avgTalkTimeInbound = (ssTotTalkTimeInbound/ssNInbound);
				// Add Hold Time to inbound only if agent were spent more time on Inbound calls than on Outbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)>=(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn+ ssTotHold)/ssNInbound;
						} else {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn)/ssNInbound;
						}
					}
					if((ssNOutbound) !=0){
						avgTalkTimeOutbound = (ssTotTalkTimeOutbound/ssNOutbound);
						
						// Add Hold Time to outbound only if agent were spent more time on Outbound calls than on Inbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)<(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut+ ssTotHold)/ssNOutbound;
						} else {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut)/ssNOutbound;						
						}
				 }
				if((ssNOutbound + ssNInbound) !=0) avgWrapUp = (ssTotWrapUp/(ssNOutbound + ssNInbound));
				if((ssNOutbound + ssNInbound) !=0) avgHold = (ssTotHold/(ssNOutbound + ssNInbound));
				if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
				
				System.out.println("ahtOut 3 : " + groupsInfo.buildReadableTime(ahtOut));
			
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgHold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(ahtIn));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(ahtOut));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t");

				  }
				  if((tot_n_Inbound) !=0) {
				  tot_avgTalkTimeInbound = (totTalkTimeInbound/tot_n_Inbound);
				  // Add Hold Time to inbound only if agent were spent more time on Inbound calls than on Outbound cals
						if ((totTalkTimeInbound +totWrapUpIn)>=(totTalkTimeOutbound +totWrapUpOut)) {
							tot_ahtIn = (totTalkTimeInbound +totWrapUpIn +totHold) /tot_n_Inbound;
						} else {
							tot_ahtIn = (totTalkTimeInbound +totWrapUpIn) /tot_n_Inbound;
						}
					}
					if((tot_n_Outbound) !=0){
						tot_avgTalkTimeOutbound = (totTalkTimeOutbound/tot_n_Outbound);
						
						// Add Hold Time to outbound only if agent were spent more time on Outbound calls than on Inbound cals
						if ((totTalkTimeInbound +totWrapUpIn)<(totTalkTimeOutbound +totWrapUpOut)) {
							tot_ahtOut =(totTalkTimeOutbound +totWrapUpOut +totHold) /tot_n_Outbound;
						} else {
							tot_ahtOut =(totTalkTimeOutbound +totWrapUpOut) /tot_n_Outbound;						
						}
				}
				if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgWrapUp = (totWrapUp/(tot_n_Outbound + tot_n_Inbound ));
				if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgHold = (totHold/(tot_n_Outbound + tot_n_Inbound ));
				if((tot_n_Handling) !=0) tot_avgHandling = (totHandling/tot_n_Handling);
				
				System.out.println("tot_ahtOut : " + groupsInfo.buildReadableTime(tot_ahtOut));

			
      out.write("\n");
      out.write("\t \t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgTalkTimeInbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgTalkTimeOutbound));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgWrapUp));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgHold));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_ahtIn));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_ahtOut));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\t\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageRepdeData.getWord("Percentages compared to login time"));
								needOneMoreTotalRow_Ans = false;
    							tLoginTime_Ans = 0; ssTotLoginTime_Ans = 0; totLoginTime_Ans = 0 ;
								tTalkTimeInbound = 0; ssTotTalkTimeInbound = 0 ; 
								totTalkTimeInbound = 0; 		    
								tTalkTimeOutbound = 0; ssTotTalkTimeOutbound = 0 ; 
								totTalkTimeOutbound = 0;
    							tWrapUp =0; ssTotWrapUp = 0 ; totWrapUp =0;
								tHold = 0; ssTotHold = 0 ; totHold = 0 ;
    							tHandling = 0; ssTotHandling = 0 ;totHandling = 0;
    							tBusy = 0; ssTotBusy = 0; totBusy = 0;
								
							
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageRepdeData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Inbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Outbound calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Wrap up calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Hold calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Productivity"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageRepdeData.getWord("Busy"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
				 groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);

				if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = groupsInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = groupsInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = groupsInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = groupsInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeInbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWrapUp+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHold+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHandling+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentBusy+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write(" \t\t\t");

				ssTotLoginTime_Ans =0;
				
				ssTotTalkTimeInbound = 0;
				percentTalkTimeInbound = "" ;
				
				ssTotTalkTimeOutbound = 0;
				percentTalkTimeOutbound ="" ;
				
				ssTotWrapUp = 0;
				percentWrapUp ="" ;
				
				ssTotHold = 0;
				percentHold ="" ;
				
    			ssTotHandling = 0 ;
				percentHandling ="" ;
				
    			ssTotBusy = 0 ;
				percentBusy ="" ;

				needOneMoreTotalRow_Ans = true;
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				
      out.write("\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentInboundTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentOutboundTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentWrapUpTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentHoldTime());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getProductivityRatio());
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentBusyTime());
      out.write("</td>\n");
      out.write("\t\t\t\t  </tr>\n");
      out.write("\t\t\t\t");


			ssTotLoginTime_Ans	+=groupsInfo.totalLoginTime;
			totLoginTime_Ans +=groupsInfo.totalLoginTime;
			tLoginTime_Ans =groupsInfo.totalLoginTime;
					
			ssTotTalkTimeInbound += groupsInfo.totalTalkTimeInbound ;
			totTalkTimeInbound +=groupsInfo.totalTalkTimeInbound ;
			tTalkTimeInbound = groupsInfo.totalTalkTimeInbound ; 


			ssTotTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound ;
			totTalkTimeOutbound +=groupsInfo.totalTalkTimeOutbound ;
			tTalkTimeOutbound = groupsInfo.totalTalkTimeOutbound ; 

			ssTotWrapUp += groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime ;
			totWrapUp +=groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ;
			tWrapUp = groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ; 

			ssTotHold += groupsInfo.totalHoldTime ;
			totHold +=groupsInfo.totalHoldTime ;
			tHold = groupsInfo.totalHoldTime ; 

			ssTotHandling += groupsInfo.totalLoginTime - groupsInfo.non_prod_wrap - groupsInfo.non_prod_nrr;
			totHandling += groupsInfo.totalLoginTime - groupsInfo.non_prod_wrap - groupsInfo.non_prod_nrr;
			tHandling = groupsInfo.totalLoginTime - groupsInfo.non_prod_wrap - groupsInfo.non_prod_nrr;
			//ssTotHandling +=Long.parseLong(groupsInfo.getProductivityTime());
			//totHandling +=Long.parseLong(groupsInfo.getProductivityTime());
			//tHandling = Long.parseLong(groupsInfo.getProductivityTime());
			
			ssTotBusy += groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime;
			totBusy +=groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime;
			tBusy = groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime;
			

			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true)
			{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = groupsInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = groupsInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = groupsInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = groupsInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				
      out.write("\n");
      out.write("\t\t\t <tr>\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeInbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWrapUp+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHold+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHandling+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentBusy+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\n");
      out.write("\t\t\t");

				  }
				if((totLoginTime_Ans) !=0) 
				{


					tot_percentTalkTimeInbound = groupsInfo.formatDecimalDouble( ( (double)(totTalkTimeInbound*100)/totLoginTime_Ans), 2);
					tot_percentTalkTimeOutbound  = groupsInfo.formatDecimalDouble( ( (double)(totTalkTimeOutbound*100)/totLoginTime_Ans), 2);
					tot_percentWrapUp = groupsInfo.formatDecimalDouble( ( (double)(totWrapUp*100)/totLoginTime_Ans), 2);
					tot_percentHold = groupsInfo.formatDecimalDouble( ( (double)(totHold*100)/totLoginTime_Ans), 2);
					tot_percentHandling = groupsInfo.formatDecimalDouble( ( (double)(totHandling*100)/totLoginTime_Ans), 2);
					tot_percentBusy = groupsInfo.formatDecimalDouble( ( (double)(totBusy*100)/totLoginTime_Ans), 2);
					
				}
				  
			
      out.write("\n");
      out.write("\t \t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepdeData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTalkTimeInbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentWrapUp+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentHold +"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentHandling+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentBusy+"%");
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
 pageRepdeData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t");

					}
					
				
			    } //fin for
			}	
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage2\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Unanswered"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage2\" ) );\t\t \t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");
if(detail.compareTo("0")==0) // rapport non detaille
		{
			for(int obj =0; obj < numObjects; obj++ )
			{
				group =tabObj[obj];
				tokGrp = new java.util.StringTokenizer(group,",");
				groupName =tokGrp.nextToken();
				groupId = tokGrp.nextToken();
				System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	

				sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
				beanAgentGroup.BuildGlobalNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
				System.out.println("fin BuildGlobalNotReadyReasonForPeriod ds JSP");	
				groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;

				if(sret == "success")
				 {
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.write('\r');
      out.write('\n');

beanManagerData pageRepUnData = new beanManagerData();
pageRepUnData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepUnData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	String percent ="";

      out.write("\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");

if(from.compareTo("groupReport") != 0){

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\t\t\t\t\t\t  </b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageRepUnData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepUnData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepUnData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Report for unanswered calls"));
      out.write("<br><br>\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUnData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	}
	else
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepUnData.getWord("Unanswered calls"));
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");

	}

      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
								 pageRepUnData.getWord("Waiting calls")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Waiting count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(groupsInfo.n_Wait));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Waiting/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.getWaitingPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\t\t\t \r\n");
      out.write("\t\t\t   <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalWaitTime));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Waiting average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(groupsInfo.getAvgWaitingTime());
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							pageRepUnData.getWord("Transfer calls")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Transfert count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(groupsInfo.n_single_transfer + groupsInfo.n_two_step_transfer));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Transfer/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.getTransferPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Transfert time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalSingleTransfer + groupsInfo.totalTwoStepTranfer));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageRepUnData.getWord("Transfert average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(groupsInfo.getAvgTransferTime());
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							 pageRepUnData.getWord("Not ready calls")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not ready count"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(Long.toString(groupsInfo.n_NotReady));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not-Ready/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(groupsInfo.getNotReadyPerHour());
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not ready time"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(groupsInfo.buildReadableTime(groupsInfo.totalNotReadyTime));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not ready average"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						try {
							out.write(groupsInfo.getAvgNotReadyTime());
						}catch(Exception e){
							out.write("-");
						}
			
					
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	if(groupsInfo.totalNotReadyTime > 0){
		String name ="" , nombre="";
		String duree ="", nrr_percent="";
		int nb_not_ready_reason = (groupsInfo.NRR_vector.size())/4;

      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t  ");
      out.print(
					  pageRepUnData.getWord("Not ready reason")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t</b></td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t  <td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"20\"></td>\r\n");
      out.write("          <td></td>\r\n");
      out.write("          <td></td>\r\n");
      out.write("          <td></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"35%\" align=\"center\" style=\"border:solid\">\r\n");
      out.write("          ");
      out.print( pageRepUnData.getWord("Reason")
						);
      out.write("          </td>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"5%\" align=\"center\" style=\"border:solid\">\r\n");
      out.write("          ");
      out.print( pageRepUnData.getWord("Count")
						);
      out.write("          </td>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"15%\" align=\"center\" style=\"border:solid\">\r\n");
      out.write("          ");
      out.print( pageRepUnData.getWord("Time")
						);
      out.write("          </td>\r\n");
      out.write("          <td colspan=\"2\" height=\"20\" class=\"reportsID\" width=\"45%\" align=\"center\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("          ");
      out.print( pageRepUnData.getWord("Percentages compared to Not ready time")
						);
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        ");

		int j=0, v=0, w=0, y=0;
		for(int i=0; i < nb_not_ready_reason ; i++)
		{
			j=i*4;
	
      out.write("\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td class=\"reportsTabName\" width=\"35%\" style=\"border:solid\"><b>\r\n");
      out.write("            ");

							
							name =(String)groupsInfo.NRR_vector.elementAt(j);
							out.write(name);
						
      out.write("\r\n");
      out.write("          </b> </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"5%\" style=\"border:solid\">");

							w=j+1;
							nombre =(String)groupsInfo.NRR_vector.elementAt(w);
							out.write(nombre);
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"15%\" style=\"border:solid\">");

							v=j+2;
							duree =(String)groupsInfo.NRR_vector.elementAt(v);
							out.write(duree);
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"10%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");

							y=j+3;
							nrr_percent =(String)groupsInfo.NRR_vector.elementAt(y);
							out.write(nrr_percent);
							if (nrr_percent.compareTo("0.99%")<0 && nrr_percent.compareTo("0.00%")>0) {
								nrr_percent="1.00%";
							}
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"35%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(nrr_percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td width=\"95%\"  style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("                <td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("          </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        ");

		}
	
      out.write("\r\n");
      out.write("      </table></td>\r\n");
      out.write("\t</tr>\r\n");

	}
	if(groupsInfo.totalLoginTime > 0){

      out.write("\t\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Percentages compared to login time")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Login"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"100%\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\"  style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Wait"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = groupsInfo.getPercentWaitingTime() ;
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						
						
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Single transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = groupsInfo.getPercentSingleTransferTime();
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Two step transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = groupsInfo.getPercentTwoStepTranferTime() ;
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepUnData.getWord("Not ready"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = groupsInfo.getPercentNotReadyTime() ;
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\t\t      \t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t  </table>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	}
	
      out.write("\t\r\n");
      out.write("</table>\r\n");
 pageRepUnData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t");

				}
					
			
		    } //fin for
		}
if( detail.compareTo("1")==0) // rapport detaille
			{
				HashMap mapNRR = new HashMap();					
				for(int obj =0; obj < numObjects; obj++ )
				{
					group =tabObj[obj];
					tokGrp = new java.util.StringTokenizer(group,",");
					groupName =tokGrp.nextToken();
					groupId = tokGrp.nextToken();
					System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	
					mapNRR.clear();	
					sret = beanAgentGroup.buildGroupDetailsInfosForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin buildGroupDetailsInfosForPeriod ds JSP");	
					beanAgentGroup.beanAgentGroupGettingNameNrr(groupId,reportType,startingDate,endingDate);
					System.out.println("fin beanAgentGroupGettingNameNrr ds JSP");
					beanAgentGroup.BuildDetailsNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin BuildDetailsNotReadyReasonForPeriod ds JSP");	
					
								
					if(sret == "success")
					{
						mapNRR = (HashMap)beanAgentGroup.mapNrr;
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write('\r');
      out.write('\n');

beanManagerData pageRepUndData = new beanManagerData();
pageRepUndData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepUndData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write('\n');

    long tLoginTime = 0, ssTotLoginTime = 0, totLoginTime = 0 ;
	boolean needOneMoreTotalRow = false;
	
    long tNotReadyTime = 0 , ssTotNotReadyTime = 0, totNotReadyTime = 0;
    long tWaitTime = 0, ssTotWaitTime = 0, totWaitTime = 0;
    long tSingleTransferTime = 0, ssTotSingleTransferTime =0 , totSingleTransferTime = 0;
    long tTwoStepTransferTime = 0, ssTotTwoStepTransferTime =0 , totTwoStepTransferTime = 0;
	long nlogin =0, tot_nlogin=0;
	long nNotReadyTime = 0 , ssNNotReadyTime = 0, tot_nNotReadyTime = 0;
    long nWaitTime = 0, ssNWaitTime = 0, tot_nWaitTime = 0;
    long nSingleTransferTime = 0, ssNSingleTransferTime =0 , tot_nSingleTransferTime = 0;
    long nTwoStepTransferTime = 0, ssNTwoStepTransferTime =0 , tot_nTwoStepTransferTime = 0;

	long avglogin =0, tot_avglogin=0;
	long avgNotReadyTime = 0 , tot_avgNotReadyTime = 0;
    long avgWaitTime = 0, tot_avgWaitTime = 0;
    long avgSingleTransferTime = 0, tot_avgSingleTransferTime = 0;
    long avgTwoStepTransferTime = 0, tot_avgTwoStepTransferTime = 0;


	String percentNotReadyTime = "" , tot_percentNotReadyTime = "";
    String percentWaitTime = "", tot_percentWaitTime = "";
    String percentSingleTransferTime = "", tot_percentSingleTransferTime = "";
    String percentTwoStepTransferTime = "", tot_percentTwoStepTransferTime = "";

	String percentNRR = "", tot_percentNRR = "";
    groupsInfo =null;
	
    long [] tNotReadyReason =null;
    long [] totNotReadyReason =null;
    long [] ssTotNotReadyReason =null;
    long [] nNotReadyReason =null;
    long [] tot_nNotReadyReason =null;
    long [] ssNNotReadyReason =null;
	
	long tNotReadyTime_Nrr = 0,totNotReadyTime_Nrr = 0;
	int nb_NRR = 0;
	

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");

	if(from.compareTo("groupReport") != 0)
	{


      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageRepUndData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepUndData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepUndData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUndData.getWord("Detail report for unanswered calls"));
      out.write("<br><br>\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepUndData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	}
	else
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepUndData.getWord("Unanswered calls"));
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");

	}

      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( pageRepUndData.getWord("Telephony data")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\"> ");
      out.print( pageRepUndData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Login time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Login count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Waiting count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Single transfer time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Single transfer count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Two step transfer time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Two step transfer count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Not ready time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Not ready count"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");

    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);


      out.write("\r\n");
      out.write(" \t\t\t");
 if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) {
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nlogin));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write(" \t\t\t");

				tLoginTime = 0;
				tNotReadyTime = 0;
    			tWaitTime = 0;
				tSingleTransferTime = 0;
				tTwoStepTransferTime = 0;
				nlogin =0;
				nNotReadyTime = 0 ;
				nWaitTime = 0;
				nSingleTransferTime = 0;
				nTwoStepTransferTime = 0;
				
				needOneMoreTotalRow = true;
			 }
 		 if(groupsInfo.totalLoginTime > 0){
		
      out.write("\r\n");
      out.write("\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t<td    align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_login));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalWaitTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_Wait));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalSingleTransfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_single_transfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalTwoStepTranfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_two_step_transfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"12%\"  align=\"center\">");
out.write(groupsInfo.buildReadableTime(groupsInfo.totalNotReadyTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(groupsInfo.n_NotReady));
      out.write("</td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t<!-- end of array traversal-->\r\n");

    tLoginTime += groupsInfo.totalLoginTime;   totLoginTime += groupsInfo.totalLoginTime;
	tNotReadyTime +=groupsInfo.totalNotReadyTime ;  totNotReadyTime +=groupsInfo.totalNotReadyTime ;
	 tWaitTime +=groupsInfo.totalWaitTime  ;  totWaitTime +=groupsInfo.totalWaitTime  ; 
	 tSingleTransferTime +=groupsInfo.totalSingleTransfer  ;  totSingleTransferTime +=groupsInfo.totalSingleTransfer ; 
	 tTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ;  totTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ; 

     nlogin += groupsInfo.n_login; tot_nlogin += groupsInfo.n_login;
	 nNotReadyTime +=groupsInfo.n_NotReady  ;  tot_nNotReadyTime +=groupsInfo.n_NotReady  ; 
	 nWaitTime +=groupsInfo.n_Wait  ;  tot_nWaitTime +=groupsInfo.n_Wait  ; 
	 nSingleTransferTime +=groupsInfo.n_single_transfer  ;  tot_nSingleTransferTime +=groupsInfo.n_single_transfer ; 
	 nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; tot_nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; 
        
        }
    }
 	groupsInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true){
	
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nlogin));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t");

		  }
	
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nlogin));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(totNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t  ");

								out.write(pageRepUndData.getWord("Not ready reason"));
								needOneMoreTotalRow = false;
							    tNotReadyTime = 0; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								nb_NRR = beanAgentGroup.m_vAllNRR.size();
								String lg_table="";
								if(nb_NRR < 6) lg_table = Integer.toString(100 -(6-nb_NRR)*10)+"%";
								else  lg_table = Integer.toString(100)+"%";
							
      out.write("\r\n");
      out.write("\t\t\t\t\t</b></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"");
out.write(lg_table);
      out.write("\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
      out.print( pageRepUndData.getWord("Time period"));
      out.write(" </td>\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");

				   tNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   totNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   nNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   tot_nNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   ssNNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   ssTotNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   
					for(int k =0; k < beanAgentGroup.m_vAllNRR.size(); k++)
					{ 
						//creer autant de variable que de raison
					  tNotReadyReason[k] = 0;
					  totNotReadyReason[k]=0;
					   nNotReadyReason[k] =0;
					   tot_nNotReadyReason[k] =0;
					   ssNNotReadyReason[k] =0;
					   ssTotNotReadyReason[k] =0;
					  
					
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t<td width=\"6%\" colspan=\"3\" align=\"center\" style=\"border-style:solid; border-right-color: #949494\">");
      out.print(beanAgentGroup.m_vAllNRR.elementAt(k) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t  <tr class=\"reportsNRRCol\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
 out.write(" "); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");

					for(int k =0; k < beanAgentGroup.m_vAllNRR.size(); k++)
					{ 
					
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid;border-right-color:#CCCCCC\">");
 out.write("Time"); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write("Nb"); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"2%\" align=\"center\" style=\"border-style:solid;border-right-color: #949494\">");
 out.write(" % "); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");
    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);
if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
			
      out.write("\r\n");
      out.write("\t\t \t<tr>\r\n");
      out.write("\t\t\t \t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
				{ 
						if((ssTotNotReadyTime) !=0) 
						{
							percentNRR = groupsInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
						}
						else 
						 percentNRR ="0.00";
						
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( groupsInfo.buildReadableTime(ssTotNotReadyReason[n])); 
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ ssNNotReadyReason[n]);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
 out.write(percentNRR);  
      out.write("</b></font></td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t");
	
					ssNNotReadyReason[n] =0;
					ssTotNotReadyReason[n] =0;
		} //fin for n  
      out.write("\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t");

			ssTotNotReadyTime =0;
			percentNRR = "" ;
			needOneMoreTotalRow = true;
		} // fin if groupsInfo.time.length() >10
			tNotReadyTime = groupsInfo.totalNotReadyTime ; 
			totNotReadyTime += groupsInfo.totalNotReadyTime ;
			ssTotNotReadyTime +=groupsInfo.totalNotReadyTime ;
		
      out.write("\r\n");
      out.write("\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
out.write(groupsInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t");

					for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
					{ 
						String key="";
						String nreadyreason = (String)beanAgentGroup.m_vAllNRR.elementAt(n);
						key = groupsInfo.datehour+"-"+ nreadyreason;
						beanAgentGroupReport.nrrdata tmpNrrElt = (beanAgentGroupReport.nrrdata)mapNRR.get(key);

						if(tmpNrrElt != null)
						{
						tNotReadyReason[n] = tmpNrrElt.nrrtime;	
						totNotReadyReason[n] += tmpNrrElt.nrrtime;
						ssTotNotReadyReason[n] += tmpNrrElt.nrrtime;
						nNotReadyReason[n] = tmpNrrElt.nrrcount;
						tot_nNotReadyReason[n] += tmpNrrElt.nrrcount;
						ssNNotReadyReason[n] += tmpNrrElt.nrrcount;
						}
						else
						{
						tNotReadyReason[n] = 0;	
						totNotReadyReason[n] += 0;
						ssTotNotReadyReason[n] += 0;
						nNotReadyReason[n] = 0;
						tot_nNotReadyReason[n] += 0;
						ssNNotReadyReason[n] += 0;
						}
						if(tNotReadyTime !=0)
						{
						percentNRR = groupsInfo.formatDecimalDouble( ( (double)((tNotReadyReason[n])*100)/tNotReadyTime), 2);	
						}
						else 
						 percentNRR ="0.00";
						
						
      out.write("\r\n");
      out.write("\t\t\t\t<td align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write( groupsInfo.buildReadableTime(tNotReadyReason[n])); 						 						
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\"> ");
 out.write(""+ nNotReadyReason[n]);  
      out.write("\t</td>\t\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\"> ");
 out.write(percentNRR);  
      out.write("\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
	
						
			} //fin for n  
      out.write("\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t\t");

		
	} //fin for
	groupsInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true)
	{
		
      out.write("\r\n");
      out.write("\t <tr>\r\n");
      out.write("\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t ");

		for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
		{ 
				if((ssTotNotReadyTime) !=0) 
				{
					percentNRR = groupsInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
				}
				else 
				 percentNRR ="0.00";
			
      out.write("\r\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( groupsInfo.buildReadableTime(ssTotNotReadyReason[n])); 
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ ssNNotReadyReason[n]);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
 out.write(percentNRR);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t");

			}
			
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t");

			} // fin for n
			  
		
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
				{ 
				if((totNotReadyTime) !=0) 
				{
					tot_percentNRR = groupsInfo.formatDecimalDouble( ( (double)((totNotReadyReason[n])*100)/totNotReadyTime), 2);
				}
				else 
				 tot_percentNRR ="0.00";
				
					
      out.write("\r\n");
      out.write("\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( groupsInfo.buildReadableTime(totNotReadyReason[n])); 
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ tot_nNotReadyReason[n]);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>\r\n");
      out.write("\t\t\t\t  ");
 out.write(tot_percentNRR);  
      out.write("\r\n");
      out.write("\t\t\t\t</b></font></td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
	
					} //fin for n  
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"24\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t  ");

								out.write(pageRepUndData.getWord("Average"));
								needOneMoreTotalRow = false;
								tNotReadyTime = 0 ; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								tWaitTime = 0; ssTotWaitTime = 0; totWaitTime = 0;
								tSingleTransferTime = 0; ssTotSingleTransferTime =0 ;
								totSingleTransferTime = 0;
								tTwoStepTransferTime = 0; ssTotTwoStepTransferTime =0 ;
								totTwoStepTransferTime = 0;
								nNotReadyTime = 0 ; ssNNotReadyTime = 0; tot_nNotReadyTime = 0;
								nWaitTime = 0; ssNWaitTime = 0; tot_nWaitTime = 0;
								nSingleTransferTime = 0; ssNSingleTransferTime =0 ;
								tot_nSingleTransferTime = 0;
								nTwoStepTransferTime = 0; ssNTwoStepTransferTime =0 ;
								tot_nTwoStepTransferTime = 0;
								
							
      out.write("\r\n");
      out.write("\t\t\t\t\t</b></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageRepUndData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Waiting calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Single transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Two step transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Not ready calls"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");
    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);
if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
				if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
				if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
				if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
				
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write(" \t\t\t");

				ssTotNotReadyTime = 0;
				ssNNotReadyTime = 0;
				avgNotReadyTime = 0 ;
				
				ssTotWaitTime = 0;
				ssNWaitTime = 0;
				avgWaitTime = 0;
				
				ssTotSingleTransferTime = 0;
				ssNSingleTransferTime = 0;
				avgSingleTransferTime = 0;
				
				ssTotTwoStepTransferTime = 0;
				ssNTwoStepTransferTime = 0;
				avgTwoStepTransferTime = 0;
				
				needOneMoreTotalRow = true;
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgWaitingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgSingleTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgTwoStepTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getAvgNotReadyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");


			ssTotNotReadyTime += groupsInfo.totalNotReadyTime ;
			ssNNotReadyTime += groupsInfo.n_NotReady;
			totNotReadyTime +=groupsInfo.totalNotReadyTime ; 
			tot_nNotReadyTime +=groupsInfo.n_NotReady  ; 
			tNotReadyTime = groupsInfo.totalNotReadyTime ;  
			nNotReadyTime =groupsInfo.n_NotReady  ; 
			
			ssTotWaitTime += groupsInfo.totalWaitTime;
			ssNWaitTime += groupsInfo.n_Wait;
			totWaitTime +=groupsInfo.totalWaitTime  ; 
			tot_nWaitTime +=groupsInfo.n_Wait  ;
			tWaitTime =groupsInfo.totalWaitTime  ;  
			nWaitTime =groupsInfo.n_Wait  ;  

			ssTotSingleTransferTime += groupsInfo.totalSingleTransfer;
			ssNSingleTransferTime += groupsInfo.n_single_transfer;
			totSingleTransferTime +=groupsInfo.totalSingleTransfer ; 
			tot_nSingleTransferTime +=groupsInfo.n_single_transfer ; 
	 		tSingleTransferTime +=groupsInfo.totalSingleTransfer  ;  
	 		nSingleTransferTime +=groupsInfo.n_single_transfer  ; 

			ssTotTwoStepTransferTime = groupsInfo.totalTwoStepTranfer;
			ssNTwoStepTransferTime = groupsInfo.n_two_step_transfer;
			totTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ; 
			tot_nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; 
			tTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ;  
			nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; 
				
			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
			if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
			if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
			if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
			if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
						
			
      out.write("\r\n");
      out.write("\t\t\t \t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(avgNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");

				  }
				  if((tot_nNotReadyTime) !=0) tot_avgNotReadyTime = (totNotReadyTime/tot_nNotReadyTime);
				if((tot_nWaitTime) !=0) tot_avgWaitTime = (totWaitTime/tot_nWaitTime);
				if((tot_nSingleTransferTime) !=0) tot_avgSingleTransferTime = (totSingleTransferTime/tot_nSingleTransferTime);
				if((tot_nTwoStepTransferTime) !=0) tot_avgTwoStepTransferTime = (totTwoStepTransferTime/tot_nTwoStepTransferTime);
				  
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(groupsInfo.buildReadableTime(tot_avgNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageRepUndData.getWord("Percentages compared to login time"));
								needOneMoreTotalRow = false;
    							tLoginTime = 0; ssTotLoginTime = 0; totLoginTime = 0 ;
								tNotReadyTime = 0 ; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								tWaitTime = 0; ssTotWaitTime = 0; totWaitTime = 0;
								tSingleTransferTime = 0; ssTotSingleTransferTime =0 ;
								totSingleTransferTime = 0;
								tTwoStepTransferTime = 0; ssTotTwoStepTransferTime =0 ;
								totTwoStepTransferTime = 0;
								
							
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\">");
      out.print( pageRepUndData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Waiting calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Single transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Two step transfer calls"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageRepUndData.getWord("Not ready calls"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t");
    
			for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
        	 groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);
			if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime) !=0) 
				{

					percentNotReadyTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWaitTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentSingleTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTwoStepTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentNotReadyTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write(" \t\t\t");

				ssTotLoginTime =0;

				ssTotNotReadyTime = 0; 
				ssTotWaitTime = 0;
				ssTotSingleTransferTime =0 ;
				ssTotTwoStepTransferTime =0 ;

				percentNotReadyTime = "" ;
				percentWaitTime = "";
				percentSingleTransferTime = "";
				percentTwoStepTransferTime = "";

				needOneMoreTotalRow = true;
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentWaitingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentSingleTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentTwoStepTranferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(groupsInfo.getPercentNotReadyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");


			ssTotLoginTime	+=groupsInfo.totalLoginTime;
			totLoginTime +=groupsInfo.totalLoginTime;
			tLoginTime =groupsInfo.totalLoginTime;
					
			ssTotNotReadyTime += groupsInfo.totalNotReadyTime;
			totNotReadyTime +=groupsInfo.totalNotReadyTime; ;
			tNotReadyTime = groupsInfo.totalNotReadyTime; ; 

			ssTotWaitTime += groupsInfo.totalWaitTime ;
			totWaitTime += groupsInfo.totalWaitTime ;
			tWaitTime = groupsInfo.totalWaitTime ; 

			ssTotSingleTransferTime += groupsInfo.totalSingleTransfer;
			totSingleTransferTime += groupsInfo.totalSingleTransfer;
			tSingleTransferTime = groupsInfo.totalSingleTransfer;

			ssTotTwoStepTransferTime += groupsInfo.totalTwoStepTranfer ;
			totTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ;
			tTwoStepTransferTime = groupsInfo.totalTwoStepTranfer  ; 

			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
				if((ssTotLoginTime) !=0) 
				{
					percentNotReadyTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWaitTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentSingleTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTwoStepTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentNotReadyTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t");

				  }
				if((totLoginTime) !=0) 
				{
					tot_percentNotReadyTime = groupsInfo.formatDecimalDouble( ( (double)(totNotReadyTime*100)/totLoginTime), 2);
					tot_percentWaitTime  = groupsInfo.formatDecimalDouble( ( (double)(totWaitTime*100)/totLoginTime), 2);
					tot_percentSingleTransferTime = groupsInfo.formatDecimalDouble( ( (double)(totSingleTransferTime*100)/totLoginTime), 2);
					tot_percentTwoStepTransferTime = groupsInfo.formatDecimalDouble( ( (double)(totTwoStepTransferTime*100)/totLoginTime), 2);

				}
				  
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageRepUndData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentWaitTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentSingleTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTwoStepTransferTime+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentNotReadyTime +"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
 pageRepUndData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");

					}
			    } //fin for
			}	
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage3\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Statistics"));
      out.write("</h2>\t\t\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage3\" ) ); \t\t\t \t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			for(int obj =0; obj < numObjects; obj++ )
			{
				group =tabObj[obj];
				tokGrp = new java.util.StringTokenizer(group,",");
				groupName =tokGrp.nextToken();
				groupId = tokGrp.nextToken();
				System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	

				sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
				 if(sret == "success")
				 {
					groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.write('\r');
      out.write('\n');

	//String percent ="";
	String totNotReadyTime_Percent = "" , totTalkTimeInbound_Percent = "";
    String totTalkTimeOutbound_Percent = "", totWaitTime_Percent = "" , totWrapUp_Percent ="";
	String totHold_Percent = "" , totSingleTransfert_Percent ="", totTwoStepTransfert_Percent ="";
	String totOther_Percent = "";
	String lang = "0";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");
		
	beanManagerData pageRepstatsData = new beanManagerData();
	pageRepstatsData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageRepstatsData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	
		

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t");

	if(from.compareTo("groupReport") !=0)
	{
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(groupId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\t\t\t\t\t  </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("Generals statistics"));
      out.write("&nbsp;");
      out.print( pageRepstatsData.getWord("for"));
      out.write("<br><br>\r\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("To"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	}
	else
	{
		String wd1 ="100%", wd2 ="70%";
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table   ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}
				else { out.write ("width=70%"); out.write("align=center"); }
      out.write(">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepstatsData.getWord("Generals statistics"));
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" ");
 if(detail.compareTo("1")==0 )  { out.write("align=left");}
				else {out.write("align=center"); }
      out.write(">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");

					totNotReadyTime_Percent = Long.toString(groupsInfo.totalNotReadyTime);
					totTalkTimeInbound_Percent = Long.toString(groupsInfo.totalTalkTimeInbound);
					totTalkTimeOutbound_Percent =Long.toString(groupsInfo.totalTalkTimeOutbound);
					totWaitTime_Percent = Long.toString(groupsInfo.totalWaitTime);
					totWrapUp_Percent =Long.toString(groupsInfo.totalWrapUpOutTime + groupsInfo.totalWrapUpInTime);
					totHold_Percent = Long.toString(groupsInfo.totalHoldTime) ;
					//totSingleTransfert_Percent = Long.toString(groupsInfo.totalSingleTransfer);
					//totTwoStepTransfert_Percent = Long.toString(groupsInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(groupsInfo.totalLoginTime - groupsInfo.totalNotReadyTime - 
														groupsInfo.totalTalkTimeInbound - groupsInfo.totalTalkTimeOutbound -
														groupsInfo.totalWaitTime - groupsInfo.totalWrapUpOutTime -
														groupsInfo.totalWrapUpInTime - groupsInfo.totalHoldTime ); 
														//groupsInfo.totalSingleTransfer - groupsInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(groupsInfo.totalLoginTime - groupsInfo.totalNotReadyTime - 
														groupsInfo.totalTalkTimeInbound - groupsInfo.totalTalkTimeOutbound -
														groupsInfo.totalWaitTime - groupsInfo.totalWrapUpOutTime -
														groupsInfo.totalWrapUpInTime - groupsInfo.totalHoldTime - 
														groupsInfo.totalSingleTransfer - groupsInfo.totalTwoStepTranfer);

					out.write("<applet code='Manager.PieChart.PiechartApplet.class'  archive='../sAheevaChart.jar' width='650' height='320' mayscript name='graphApplet'>");
						// Start Up Parameters -->
						
					out.write("<PARAM name='LOADINGMESSAGE' value='"+pageRepstatsData.getWord("graphloadingmessage")+"'>");					
					
					out.write("<PARAM name='STEXTCOLOR'     value='0,0,100'>");
					out.write("<PARAM name='STARTUPCOLOR'   value='255,255,255'>");
						//Character Encoding -->
					out.write("<PARAM name='charset'   value='8859_1'>");
						
						//Chart Switches -->
					out.write("<PARAM name='3D' value='true'>");
					out.write("<PARAM name='Slabels' value='true'>");
					out.write("<PARAM name='legend'  value='true'>");
					out.write("<PARAM name='displayPercentages' value='true'>");
						
						//Chart Characteristics -->
					out.write("<PARAM name='width'      value='550'>");
					out.write("<PARAM name='height'     value='250'>");
					out.write("<PARAM name='nPies'      value='1'>");
					out.write("<PARAM name='depth3D'    value='15'>");
					out.write("<PARAM name='ndecplaces' value='0'>");
					out.write("<PARAM name='3Dangle'    value='50'>");
						 
						// Thousand separator -->
					out.write("<PARAM name='thousandseparator' value=''>");
						
						//Link Cursor -->
						//valid values are - crosshair, default, hand, move, text or wait -->
					out.write("<PARAM name='linkCursor' value='default'>");
						
						//Popup segment Value Pre & Post Symbols -->
					out.write("<PARAM name='valuepresym'  value=''>");
					out.write("<PARAM name='valuepostsym'  value=' '>");
						
						//Additional font information -->
					out.write("<PARAM name='popupfont'  value='Arial,B,12'>");
					out.write("<PARAM name='slabelfont' value='Arial,N,10'>");
						
						// Additional color information -->				
					out.write("<PARAM name='bgcolor'      value='white'>");
					out.write("<PARAM name='labelcolor'   value='50,50,50'>");
						
						
						// Legend Information -->
					out.write("<PARAM name='legendfont'       value='Arial,N,10'>");
					out.write("<PARAM name='legendposition'   value='420,10'>");
					
					out.write("<PARAM name='legendtitle'   value='"+ pageRepstatsData.getWord("calls") +"'>");
					
					out.write("<PARAM name='LegendBackground' value='255,255,255'>");
					out.write("<PARAM name='LegendBorder'     value='125,125,125'>");
					out.write("<PARAM name='LegendtextColor'  value='0,0,0'>");
						
						//Pie Data -->
						//  PieN   x,y,size,number of segments, seperation -->
					out.write("<PARAM name='Pie1' value='110,50,175,9,5'>");
					
						//Pie Segement Labels -->
					out.write("<PARAM name='pie1label1' value=''>");
					out.write("<PARAM name='pie1label2' value=''>");
					out.write("<PARAM name='pie1label3' value=''>");
					out.write("<PARAM name='pie1label4' value=''>");
					out.write("<PARAM name='pie1label5' value=''>");
					out.write("<PARAM name='pie1label6' value=''>");
					out.write("<PARAM name='pie1label7' value=''>");
					//out.write("<PARAM name='pie1label8' value=''>");
					//out.write("<PARAM name='pie1label9' value=''>");
					out.write("<PARAM name='pie1label9' value=''>");
						
						
					out.write("<PARAM name='segment1'   value='115,152,164|"+ pageRepstatsData.getWord("inbound") +"'>");				
					
					out.write("<PARAM name='segment2'   value='99,99,156|"+ pageRepstatsData.getWord("outbound") +"'>");				
					
					out.write("<PARAM name='segment3'   value='185,53,8|"+ pageRepstatsData.getWord("wrapup") +"'>");
					
					out.write("<PARAM name='segment4'   value='239,214,115|"+ pageRepstatsData.getWord("hold") +"'>");
									
					out.write("<PARAM name='segment5'   value='100,100,60|"+ pageRepstatsData.getWord("waiting") +"'>");
													
					out.write("<PARAM name='segment6'   value='17,97,158|"+ pageRepstatsData.getWord("notready") +"'>");
									
					out.write("<PARAM name='segment7'   value='100,214,50|"+ pageRepstatsData.getWord("singletransfer") +"'>");
											
					out.write("<PARAM name='segment8'   value='180,0,230|"+ pageRepstatsData.getWord("twosteptransfer") +"'>");	
					
					out.write("<PARAM name='segment9'   value='228,115,64|"+ pageRepstatsData.getWord("Dialing") +"'>");	
					
					
					out.write("<PARAM name='data1series1' value=\""+totTalkTimeInbound_Percent+"\">");
					out.write("<PARAM name='data2series1' value=\""+totTalkTimeOutbound_Percent+"\">");
					out.write("<PARAM name='data3series1' value=\""+totWrapUp_Percent+"\">");
					out.write("<PARAM name='data4series1' value=\""+totHold_Percent+"\">");
					out.write("<PARAM name='data5series1' value=\""+totWaitTime_Percent+"\">");
					out.write("<PARAM name='data6series1' value=\""+totNotReadyTime_Percent+"\">");
					//out.write("<PARAM name='data7series1' value=\""+totSingleTransfert_Percent+"\">");
					//out.write("<PARAM name='data8series1' value=\""+totTwoStepTransfert_Percent+"\">");
					out.write("<PARAM name='data7series1' value=\""+totOther_Percent+"\">");
					out.write("<PARAM name='data9series1' value=\""+totOther_Percent+"\">");
					 
						
					out.write("</applet>");
				
					
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	if(from.compareTo("groupReport") !=0)
	{
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<b>\t");
      out.print( pageRepstatsData.getWord("Other statistics"));
      out.write(" </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	}
	else
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}
				else { out.write ("width=70%"); out.write("align=center"); }
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageRepstatsData.getWord("Other statistics"));
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}
				else { out.write ("width=70%"); out.write("align=center"); }
      out.write(" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\"style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"15%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("Sheduled time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t  ");

						out.write(groupsInfo.getScheduled());
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("Login"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
					
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <!--\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\tTotal Productivity Time</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(groupsInfo.getProductivityTime());
					
      out.write("\t\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>-->\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepstatsData.getWord("Adherence"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(groupsInfo.getAdherence());
					
      out.write("\t\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  \r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("</table>\t\t\r\n");
 pageRepstatsData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t");

				}
			}
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tsetupAllTabs();\r\n");
      out.write("</script>\r\n");

}

      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 page1Data.closeConnection(); 
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
