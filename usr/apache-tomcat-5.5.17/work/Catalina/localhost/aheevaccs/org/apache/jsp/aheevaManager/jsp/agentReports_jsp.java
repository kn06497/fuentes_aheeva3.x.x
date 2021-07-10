package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import java.lang.*;
import aheevaManager.reports.*;
import aheevaManager.schedule.*;
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
import aheevaManager.ressources.*;
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
import aheevaManager.ressources.*;

public final class agentReports_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(5);
    _jspx_dependants.add("/aheevaManager/jsp/agentReportsAnswered.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/agentReportsAnsweredDetails.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/agentReportsUnAnswered.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/agentReportsUnAnsweredDetails.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/agentReportsStat.jsp");
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

////open connection to database///////
beanManagerData page1Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	page1Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    page1Data.openConnection();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Agent Reports1</title>\r\n");
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
      out.write("\tbackground: #E1F4FF;\r\n");
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
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">var lang = normalizeString(QueryString('lang'));</script>\r\n");
      out.write("\r\n");
      aheevaManager.reports.beanAgentGlobalInfoReport beanAgent = null;
      synchronized (request) {
        beanAgent = (aheevaManager.reports.beanAgentGlobalInfoReport) _jspx_page_context.getAttribute("beanAgent", PageContext.REQUEST_SCOPE);
        if (beanAgent == null){
          beanAgent = new aheevaManager.reports.beanAgentGlobalInfoReport();
          _jspx_page_context.setAttribute("beanAgent", beanAgent, PageContext.REQUEST_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      aheevaManager.reports.beanAgentDetailsInfoReport beanAgentDetail = null;
      synchronized (request) {
        beanAgentDetail = (aheevaManager.reports.beanAgentDetailsInfoReport) _jspx_page_context.getAttribute("beanAgentDetail", PageContext.REQUEST_SCOPE);
        if (beanAgentDetail == null){
          beanAgentDetail = new aheevaManager.reports.beanAgentDetailsInfoReport();
          _jspx_page_context.setAttribute("beanAgentDetail", beanAgentDetail, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");

	String language = request.getParameter("lang");
	String prec = request.getParameter("prec");
	String suiv = request.getParameter("suiv");
	String current = request.getParameter("current");
	String all_obj= request.getParameter("all_obj");
	String detail = (request.getParameter("detail") != null ) ? ( (request.getParameter("detail").compareToIgnoreCase("on") == 0) ? "1" : request.getParameter("detail") ) : "0";
	String startingDateDaily = request.getParameter("startingDateDaily");
	String endingDateDaily   = request.getParameter("endingDateDaily");
	String starting_year_yearly = request.getParameter("starting_year_yearly");
	String ending_year_yearly = request.getParameter("ending_year_yearly");
	String starting_month_monthly = request.getParameter("starting_month_monthly");
	String starting_year_monthly = request.getParameter("starting_year_monthly");
	String ending_month_monthly = request.getParameter("ending_month_monthly");
	String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
	
	String from = "",
		   agentId = "",
	  	   startingDate = "",
		   endingDate = "",
		   sret = "";

    //String[] agents = request.getParameterValues("objects");	
	StringBuilder queryStringBuilder = new StringBuilder(),
	 			  tempQueryStringBuilder = null;
String agentsStr = request.getParameter("objects");
String[] agentList ;
    StringTokenizer tok = null;
    if(agentsStr!= null) {
		tok = new java.util.StringTokenizer(agentsStr,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
    int numObj = tok.countTokens();

    agentList = new String[numObj];
    for(int i=0; i<numObj; i++)
    {
	   agentList[i] = tok.nextToken();
    }

    beanAgentGlobalInfo agentInfo = null; 

    if (reportType.compareToIgnoreCase("Daily") == 0){
		startingDate = startingDateDaily.substring(6) + "-" + startingDateDaily.substring(0,2) + "-"
					  + startingDateDaily.substring(3,5) + " 00:00:00" ;
		endingDate = endingDateDaily.substring(6) + "-" + endingDateDaily.substring(0,2) + "-"
					+ endingDateDaily.substring(3,5) + " 23:59:59" ;

		queryStringBuilder.append("startingDateDaily=" + startingDateDaily);
		queryStringBuilder.append("&endingDateDaily=" + endingDateDaily);
    } else if (reportType.compareToIgnoreCase("Monthly") == 0){
			startingDate = starting_year_monthly + "-"+ starting_month_monthly + "-"+ "01" + " 00:00:00" ;
			endingDate = ending_year_monthly + "-" + ending_month_monthly + "-31" + " 23:59:59" ;

			queryStringBuilder.append("starting_month_monthly=" + starting_month_monthly);
			queryStringBuilder.append("&starting_year_monthly=" + starting_year_monthly);
			queryStringBuilder.append("&ending_month_monthly=" + ending_month_monthly);
			queryStringBuilder.append("&ending_year_monthly=" + ending_year_monthly);
    } else if (reportType.compareToIgnoreCase("Yearly") == 0){
			startingDate = starting_year_yearly + "-01-01" + " 00:00:00" ;
			endingDate = ending_year_yearly + "-12-31" + " 23:59:59" ;

			queryStringBuilder.append("starting_year_yearly=" + starting_year_yearly);
			queryStringBuilder.append("&ending_year_yearly=" + ending_year_yearly);
    }

	queryStringBuilder.append("&reportType=" + reportType);
	queryStringBuilder.append("&detail=" + detail);
	queryStringBuilder.append("&lang=" + language);
	queryStringBuilder.append("&objects=" + agentsStr);

	//The query string that is used with the print link
	tempQueryStringBuilder = new StringBuilder("&prec=" + prec); 
	tempQueryStringBuilder.append("&suiv=" + suiv);
	tempQueryStringBuilder.append("&current=" + current);
	tempQueryStringBuilder.append("&all_obj=" + all_obj);
	tempQueryStringBuilder.append("&from=agentReport");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"img-control\" >\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" >\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<form action=\"\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\"\r\n");
      out.write("\t\t\t\t\t\tonClick=\"window.open('printAgentReport.jsp?");
      out.print(queryStringBuilder.toString() + tempQueryStringBuilder.toString());
      out.write("')\"%>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<img src=\"../img/printer.gif\" border=\"0\" alt=\"\">\r\n");
      out.write("\t\t\t\t</button>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\r\n");
      out.write("\t");

		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1)),
		 	   new_prec = Integer.toString((Integer.parseInt(prec)-1));                

	if( (prec.compareTo("-1") != 0) && (all_obj.compareTo("0") == 0) )
	{
          tempQueryStringBuilder = new StringBuilder("&prec=" + new_prec);
          tempQueryStringBuilder.append("&suiv=" + current);
          tempQueryStringBuilder.append("&current=" + prec);
          tempQueryStringBuilder.append("&all_obj=0");

	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<a href=\"agentReports.jsp?");
      out.print(queryStringBuilder.toString() + tempQueryStringBuilder.toString());
      out.write("\">\r\n");
      out.write("\t\t\t\t");
      out.print( page1Data.getWord("Previous"));
      out.write("\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	if(numObj > 1 && all_obj.compareTo("0") == 0)
	{
		tempQueryStringBuilder = new StringBuilder("&prec=-1");
		tempQueryStringBuilder.append("&suiv=1");
		tempQueryStringBuilder.append("&current=0");
		tempQueryStringBuilder.append("&all_obj=1");
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<a href=\"agentReports.jsp?");
      out.print(queryStringBuilder.toString() + tempQueryStringBuilder.toString());
      out.write("\" >\r\n");
      out.write("\t\t\t\t");
      out.print( page1Data.getWord("All"));
      out.write("\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	String nb_obj = Integer.toString(numObj);
	
	if( (suiv.compareTo(nb_obj) != 0) && (all_obj.compareTo("0") == 0) )
	{
		tempQueryStringBuilder = new StringBuilder("&prec=" + current);
		tempQueryStringBuilder.append("&suiv=" + new_suiv);
		tempQueryStringBuilder.append("&current=" + suiv);
		tempQueryStringBuilder.append("&all_obj=0");
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<a href=\"agentReports.jsp?");
      out.print(queryStringBuilder.toString() + tempQueryStringBuilder.toString());
      out.write("\" >\r\n");
      out.write("\t\t\t\t");
      out.print( page1Data.getWord("Next"));
      out.write("\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>");

if(all_obj.compareTo("0")== 0) // pour un agent
{
	agentId = agentList[Integer.parseInt(current)];

	if(detail.compareTo("0") == 0)
	{
		sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId, reportType, startingDate, endingDate);
	}
	if(detail.compareTo("1") == 0)
	{
		sret = beanAgentDetail.buildAgentDetailsInfosForPeriod(agentId, reportType, startingDate, endingDate);
		beanAgentDetail.beanAgentDetailsGettingNameNrr(agentId, reportType, startingDate, endingDate);
		beanAgentDetail.BuildNotReadyReasonForPeriod(agentId, reportType, startingDate, endingDate);
	}

	if(sret == "success")
		agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;

      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"agentReports\" action=\"\">\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Answered"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage(document.getElementById( \"tabPage1\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t");

			if(detail.compareTo("0")==0) // rapport non detaille
			{
				if(sret == "success")
				 {
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
 String percent_Ans =""; 
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
      out.write("\r\n");

////open connection to database///////
beanManagerData page2Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	page2Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    page2Data.openConnection();
    
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javaScript\" type=\"text/javascript\">\r\n");
      out.write("var lang = normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(beanAgent.getAgentFullName(agentId)); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(agentId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\t\t\t\t\t  </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
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
								  out.write(page2Data.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0)
							    {
								out.write(page2Data.getWord("Monthly"));
								}
							else if (reportType.compareTo("Yearly")==0)
							    {
								out.write(page2Data.getWord("Yearly"));
								}

							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( page2Data.getWord("Details Report for answered calls"));
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
      out.print( page2Data.getWord("To"));
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
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	if(from.compareTo("agentReport") == 0)
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( page2Data.getWord("Answered calls"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
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
							 page2Data.getWord("Login details")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("First login"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(beanAgent.getfirstLoginTime());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Last logout"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(beanAgent.getLastLogoutTime().substring(0,19));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Login time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Login count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(Long.toString(agentInfo.n_login));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
							 page2Data.getWord("Inbound calls")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
      out.print( page2Data.getWord("Inbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_Inbound));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getInboundPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Inbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Inbound average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgTalktimeInbound());
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
							 page2Data.getWord("Outbound calls")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Outbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(Long.toString(agentInfo.n_Outbound));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(agentInfo.getOutboundPerHour());
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Outbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Outbound average"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						try {
							out.write(agentInfo.getAvgTalktimeOutbound());
						}catch(Exception e){
							out.write("-");
						}

					
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
							 page2Data.getWord("Wrap up calls")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Wrap up count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Wrap_up/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getWrapUpPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Wrap up time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Wrap up average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgWrapUpTime());
					}catch(Exception e){
						out.write("-");
					}

				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
							 page2Data.getWord("Hold calls")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Hold count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\"  style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_hold));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Hold/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getHoldPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Hold time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalHoldTime));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Hold average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgTalktimeHold());
					}catch(Exception e){
						out.write("-");
					}

				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	if(agentInfo.totalLoginTime > 0)
	{

      out.write("\r\n");
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
							 page2Data.getWord("Percentages compared to login time")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Login"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"100%\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\"  style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Handling"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentHandlingTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}

						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Busy"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentBusyTime();
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Inbound"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentInboundTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Outbound"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentOutboundTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Wrapup"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentWrapUpTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Hold"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentHoldTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("</table>\r\n");
 page2Data.closeConnection(); 
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageAnsDetData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageAnsDetData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageAnsDetData.openConnection();
    
      out.write("\r\n");
      out.write("    ");

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
    agentInfo =null;

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(beanAgentDetail.getAgentFullName(agentId)); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(agentId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\t\t\t\t\t  </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
								  out.write(pageAnsDetData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageAnsDetData.getWord("Monthly"));					
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageAnsDetData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageAnsDetData.getWord("Details Report for answered calls"));
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
      out.print( pageAnsDetData.getWord("To"));
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

	if(from.compareTo("agentReport") == 0)
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageAnsDetData.getWord("Answered calls"));
      out.write("\t\t\t\r\n");
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
      out.write("\t\t\t\t\t\t\t");
      out.print(
							 pageAnsDetData.getWord("Telephony data")
							);
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
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\">");
      out.print( pageAnsDetData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Login time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Login count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Inbound time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Inbound count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Outbound time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Outbound count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Wrap up time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Wrap up count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Hold time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Hold count"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");

    for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) {
         agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);

      out.write("\r\n");
      out.write(" \t\t\t");
 if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) {
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tLoginTime_Ans));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_N_login));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Inbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Outbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Wrap_up));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Hold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
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
 		 if(agentInfo.totalLoginTime > 0){
		
      out.write("\r\n");
      out.write("\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t<td    align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_login));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_Inbound));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_Outbound));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up) );
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalHoldTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_hold));
      out.write("</td>\r\n");
      out.write("\t  </tr>\r\n");

        tLoginTime_Ans += agentInfo.totalLoginTime;   totLoginTime_Ans += agentInfo.totalLoginTime;
        tTalkTimeInbound += agentInfo.totalTalkTimeInbound;  totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
        tTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
        tWrapUp  += agentInfo.totalWrapUpInTime; totWrapUp  += agentInfo.totalWrapUpInTime;
        tWrapUp  += agentInfo.totalWrapUpOutTime; totWrapUp  += agentInfo.totalWrapUpOutTime;
        tHold += agentInfo.totalHoldTime; totHold += agentInfo.totalHoldTime;

        t_N_login += agentInfo.n_login; tot_N_login += agentInfo.n_login;
        t_n_Inbound += agentInfo.n_Inbound; tot_n_Inbound += agentInfo.n_Inbound;
        t_n_Outbound += agentInfo.n_Outbound; tot_n_Outbound += agentInfo.n_Outbound;

        t_n_Wrap_up += agentInfo.n_Wrap_In_up;  tot_n_Wrap_up += agentInfo.n_Wrap_In_up;
        t_n_Wrap_up += agentInfo.n_Wrap_Out_up;  tot_n_Wrap_up += agentInfo.n_Wrap_Out_up;
        t_n_Hold += agentInfo.n_hold; tot_n_Hold += agentInfo.n_hold;
        }
    }
 	agentInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow_Ans == true){
	
      out.write("\r\n");
      out.write("\t <tr>\r\n");
      out.write("\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tLoginTime_Ans));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_N_login));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Inbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Outbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Wrap_up));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Hold));
      out.write("</b></font></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

		  }
	
      out.write("\r\n");
      out.write("\t <tr>\r\n");
      out.write("\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totLoginTime_Ans));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_N_login));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Inbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Outbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Wrap_up));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Hold));
      out.write("</b></font></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageAnsDetData.getWord("Average"));
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
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageAnsDetData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Inbound calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print( pageAnsDetData.getWord("Outbound calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Wrap up calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Hold calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Handling"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("AHT in"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("AHT out"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) {
				agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0){
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
					if((ssNInbound + ssNOutbound) !=0) avgWrapUp = (ssTotWrapUp/(ssNInbound + ssNOutbound));
					if((ssNInbound + ssNOutbound) !=0) avgHold = (ssTotHold/(ssNInbound + ssNOutbound));
					if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
					
      out.write("\r\n");
      out.write("\t\t\t\t \t<tr>\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgHandling));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(ahtIn));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(ahtOut));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t \t\t\t");

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
				}
			    if(agentInfo.totalLoginTime > 0){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgTalktimeInbound());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgTalktimeOutbound());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgWrapUpTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgTalktimeHold());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgHandlingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAhtIn());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAhtOut());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  \t</tr>\r\n");
      out.write("\t\t\t\t\t");

					ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound ;
					ssNInbound+= agentInfo.n_Inbound;
					totTalkTimeInbound +=agentInfo.totalTalkTimeInbound ;
					tot_n_Inbound +=agentInfo.n_Inbound  ; 
					tTalkTimeInbound = agentInfo.totalTalkTimeInbound ; 
					t_n_Inbound =agentInfo.n_Inbound  ; 
		
					ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound ;
					ssNOutbound += agentInfo.n_Outbound;
					totTalkTimeOutbound +=agentInfo.totalTalkTimeOutbound ;
					tot_n_Outbound +=agentInfo.n_Outbound  ; 
					tTalkTimeOutbound = agentInfo.totalTalkTimeOutbound ; 
					t_n_Outbound =agentInfo.n_Outbound  ; 
		
					ssTotWrapUp += agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime ;
					ssNWrap_up+= agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up;
					totWrapUp +=agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ;
					tot_n_Wrap_up +=agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
					tWrapUp = agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ; 
					t_n_Wrap_up =agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up;
		
					ssTotWrapUpIn += agentInfo.totalWrapUpInTime;
					ssTotWrapUpOut += agentInfo.totalWrapUpOutTime ;
					totWrapUpIn+= agentInfo.totalWrapUpInTime;
					totWrapUpOut += agentInfo.totalWrapUpOutTime ;
		
					ssTotHold += agentInfo.totalHoldTime ;
					ssNHold+= agentInfo.n_hold;
					totHold +=agentInfo.totalHoldTime ;
					tot_n_Hold +=agentInfo.n_hold  ; 
					tHold = agentInfo.totalHoldTime ; 
					t_n_Hold =agentInfo.n_hold  ; 
					ssTotHandling += agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
					ssNHandling+= agentInfo.n_Inbound + agentInfo.n_Outbound;
					totHandling +=agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
					tot_n_Handling += agentInfo.n_Inbound + agentInfo.n_Outbound;
					tHandling = agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
					t_n_Handling = agentInfo.n_Inbound + agentInfo.n_Outbound;
			    }
			} 
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true){
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
				if((ssNOutbound + ssNInbound ) !=0) avgWrapUp = (ssTotWrapUp/(ssNOutbound + ssNInbound) );
				if((ssNOutbound + ssNInbound ) !=0) avgHold = (ssTotHold/(ssNOutbound + ssNInbound ));
				if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
				
      out.write("\r\n");
      out.write("\t\t\t \t\t<tr>\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgHandling));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(ahtIn));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(ahtOut));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

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
			if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgWrapUp = (totWrapUp/(tot_n_Outbound + tot_n_Inbound));
			if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgHold = (totHold/(tot_n_Outbound + tot_n_Inbound));
			if((tot_n_Handling) !=0) tot_avgHandling = (totHandling/tot_n_Handling);
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgHandling));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_ahtIn));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_ahtOut));
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

								out.write(pageAnsDetData.getWord("Percentages compared to login time"));
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
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageAnsDetData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Inbound calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Outbound calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Wrap up calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Hold calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Handling"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Busy"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = agentInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = agentInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = agentInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = agentInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeInbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWrapUp+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHold+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHandling+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentBusy+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
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
				} 
			    if(agentInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentInboundTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentOutboundTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentWrapUpTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentHoldTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentHandlingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentBusyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");


			ssTotLoginTime_Ans	+=agentInfo.totalLoginTime;
			totLoginTime_Ans +=agentInfo.totalLoginTime;
			tLoginTime_Ans =agentInfo.totalLoginTime;
			ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound ;
			totTalkTimeInbound +=agentInfo.totalTalkTimeInbound ;
			tTalkTimeInbound = agentInfo.totalTalkTimeInbound ; 
			ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound ;
			totTalkTimeOutbound +=agentInfo.totalTalkTimeOutbound ;
			tTalkTimeOutbound = agentInfo.totalTalkTimeOutbound ; 
			ssTotWrapUp += agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime ;
			totWrapUp +=agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ;
			tWrapUp = agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ; 
			ssTotHold += agentInfo.totalHoldTime ;
			totHold +=agentInfo.totalHoldTime ;
			tHold = agentInfo.totalHoldTime ; 
			ssTotHandling += agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
			totHandling +=agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
			tHandling = agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
			ssTotBusy += agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime;
			totBusy +=agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime;
			tBusy = agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime;
			
			    }
			}
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true)
			{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = agentInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = agentInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = agentInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = agentInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeInbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWrapUp+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHold+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHandling+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentBusy+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

				  }
				if((totLoginTime_Ans) !=0) 
				{
					tot_percentTalkTimeInbound = agentInfo.formatDecimalDouble( ( (double)(totTalkTimeInbound*100)/totLoginTime_Ans), 2);
					tot_percentTalkTimeOutbound  = agentInfo.formatDecimalDouble( ( (double)(totTalkTimeOutbound*100)/totLoginTime_Ans), 2);
					tot_percentWrapUp = agentInfo.formatDecimalDouble( ( (double)(totWrapUp*100)/totLoginTime_Ans), 2);
					tot_percentHold = agentInfo.formatDecimalDouble( ( (double)(totHold*100)/totLoginTime_Ans), 2);
					tot_percentHandling = agentInfo.formatDecimalDouble( ( (double)(totHandling*100)/totLoginTime_Ans), 2);
					tot_percentBusy = agentInfo.formatDecimalDouble( ( (double)(totBusy*100)/totLoginTime_Ans), 2);
				}
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTalkTimeInbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentWrapUp+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentHold +"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentHandling+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentBusy+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
 pageAnsDetData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t");

			 	}
			}
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\r\n");
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
beanManagerData pageUnAnsData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageUnAnsData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageUnAnsData.openConnection();
    
      out.write('\n');

	String percent ="";

      out.write("\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");

	if(from.compareTo("agentReport") != 0)
	{


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

								try { out.write(beanAgent.getAgentFullName(agentId)); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(agentId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\t\t\t\t\t  </b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
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
								  out.write( pageUnAnsData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageUnAnsData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageUnAnsData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageUnAnsData.getWord("Report for unanswered calls"));
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
      out.print( pageUnAnsData.getWord("To"));
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
      out.print( pageUnAnsData.getWord("Unanswered calls"));
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
							 pageUnAnsData.getWord("Waiting calls")
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
      out.print( pageUnAnsData.getWord("Waiting count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_Wait));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Waiting/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getWaitingPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalWaitTime));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Waiting average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgWaitingTime());
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
							pageUnAnsData.getWord("Transfer calls")
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
      out.print( pageUnAnsData.getWord("Transfert count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_single_transfer + agentInfo.n_two_step_transfer));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Transfer/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getTransferPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Transfert time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Transfert average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgTransferTime());
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
							 pageUnAnsData.getWord("Not ready calls")
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
      out.print( pageUnAnsData.getWord("Not ready count"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(Long.toString(agentInfo.n_NotReady));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageUnAnsData.getWord("Not-Ready/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(agentInfo.getNotReadyPerHour());
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageUnAnsData.getWord("Not ready time"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(agentInfo.buildReadableTime(agentInfo.totalNotReadyTime));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageUnAnsData.getWord("Not ready average"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						try {
							out.write(agentInfo.getAvgNotReadyTime());
						}catch(Exception e){
							out.write("-");
						}
			
					
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	if(agentInfo.totalNotReadyTime > 0)
	{
		String name ="" , nombre="";
		String duree ="", nrr_percent="";
		int nb_not_ready_reason = (agentInfo.NRR_vector.size())/4;
		//int nb_not_ready_reason=9;

      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t  ");
      out.print(
					pageUnAnsData.getWord("Not ready reason")
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
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"35%\" align=\"center\" style=\"border:solid\">");
      out.print(
           pageUnAnsData.getWord("Reason")
						);
      out.write("          </td>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"5%\" align=\"center\" style=\"border:solid\">\n");
      out.write("          ");
      out.print( pageUnAnsData.getWord("Count")
						);
      out.write("          </td>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"15%\" align=\"center\" style=\"border:solid\">\n");
      out.write("          ");
      out.print( pageUnAnsData.getWord("Time")
						);
      out.write("          </td>\r\n");
      out.write("          <td colspan=\"2\" height=\"20\" class=\"reportsID\" width=\"45%\" align=\"center\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\n");
      out.write("          ");
      out.print( pageUnAnsData.getWord("Percentages compared to Not ready time")
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

							
							name =(String)agentInfo.NRR_vector.elementAt(j);
							out.write(name);
						
      out.write("\r\n");
      out.write("          </b> </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"5%\" style=\"border:solid\">");

							w=j+1;
							nombre =(String)agentInfo.NRR_vector.elementAt(w);
							out.write(nombre);
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"15%\" style=\"border:solid\">");

							v=j+2;
							duree =(String)agentInfo.NRR_vector.elementAt(v);
							out.write(duree);
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"10%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");

							y=j+3;
							nrr_percent =(String)agentInfo.NRR_vector.elementAt(y);
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
	
	if(agentInfo.totalLoginTime > 0)
	{

      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							 pageUnAnsData.getWord("Percentages compared to login time")
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
      out.print( pageUnAnsData.getWord("Login"));
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
      out.print( pageUnAnsData.getWord("Wait"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = agentInfo.getPercentWaitingTime() ;
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
      out.print( pageUnAnsData.getWord("Single transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = agentInfo.getPercentSingleTransferTime();
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
      out.print( pageUnAnsData.getWord("Two step transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = agentInfo.getPercentTwoStepTranferTime() ;
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
      out.print( pageUnAnsData.getWord("Not ready"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = agentInfo.getPercentNotReadyTime() ;
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
 pageUnAnsData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t");

				}
			}
			if( detail.compareTo("1")==0) // rapport detaille
			{
				HashMap mapNRR = (HashMap)beanAgentDetail.mapNrr;
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

beanManagerData pageUnAnsdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageUnAnsdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageUnAnsdData.openConnection();
    

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
    agentInfo =null;
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
if(from.compareTo("agentReport") != 0){
      out.write("\r\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr><td width=\"100%\" align=\"center\"><b>\r\n");
      out.write("\t\t\t\t\t\t\t");
out.write(beanAgentDetail.getAgentFullName(agentId));
      out.write('[');
 out.println(agentId); 
      out.write("]</b></td></tr></table></td></tr>\r\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr><td  class=\"reportsID\" width=\"100%\" align=\"center\"><b>\r\n");
      out.write("\t\t\t\t\t\t\t");
if (reportType.compareTo("Daily")==0) 
							    { out.write(pageUnAnsdData.getWord("Daily"));}
							else if (reportType.compareTo("Monthly")==0){out.write(pageUnAnsdData.getWord("Monthly"));}
							else if (reportType.compareTo("Yearly")==0) 
							    {out.write(pageUnAnsdData.getWord("Yearly"));}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageUnAnsdData.getWord("Detail report for unanswered calls"));
      out.write("<br><br>\r\n");
      out.write("\t\t\t\t\t\t\t");
if (reportType.compareTo("Daily") ==0){out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){out.write(starting_year_yearly);}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageUnAnsdData.getWord("To"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
if (reportType.compareTo("Daily") ==0){out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){out.write(ending_year_yearly);}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b></td></tr></table></td></tr>\r\n");
}else{
      out.write("\r\n");
      out.write("\t\t<tr><td width=\"100%\" align=\"center\"><table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageUnAnsdData.getWord("Unanswered calls"));
      out.write("</b></font></td></tr></table></td></tr>\r\n");
      out.write("\t");
}
      out.write("\r\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\"><table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageUnAnsdData.getWord("Telephony data"));
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b></td></tr><tr><td height=\"10\"></td></tr></table></td></tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\"> ");
      out.print( pageUnAnsdData.getWord("Time period"));
      out.write("</td><td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Login time"));
      out.write("</td><td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Login count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Waiting time"));
      out.write("</td><td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Waiting count"));
      out.write("</td><td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Single transfer time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Single transfer count"));
      out.write("</td><td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Two step transfer time"));
      out.write("</td><td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Two step transfer count"));
      out.write("</td><td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Not ready time"));
      out.write("</td><td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Not ready count"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) {
 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
      out.write("\r\n");
      out.write(" \t\t\t");
 if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) {
      out.write("\r\n");
      out.write("\t\t\t <tr><td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tLoginTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nlogin));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tWaitTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nWaitTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nSingleTransferTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTwoStepTransferTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nTwoStepTransferTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tNotReadyTime));
      out.write("</b></font></td> <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
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
				needOneMoreTotalRow = true;}if(agentInfo.totalLoginTime > 0){
      out.write("\r\n");
      out.write("\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t<td    align=\"center\">");
out.write(agentInfo.time);
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_login));
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalWaitTime));
      out.write("</td><td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_Wait));
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalSingleTransfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_single_transfer));
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTwoStepTranfer));
      out.write("</td><td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_two_step_transfer));
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalNotReadyTime));
      out.write("</td><td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_NotReady));
      out.write("</td>\r\n");
      out.write("\t  </tr>\r\n");
tLoginTime += agentInfo.totalLoginTime;   totLoginTime += agentInfo.totalLoginTime;
	tNotReadyTime +=agentInfo.totalNotReadyTime ;  totNotReadyTime +=agentInfo.totalNotReadyTime ;
	 tWaitTime +=agentInfo.totalWaitTime  ;  totWaitTime +=agentInfo.totalWaitTime  ; 
	 tSingleTransferTime +=agentInfo.totalSingleTransfer  ;  totSingleTransferTime +=agentInfo.totalSingleTransfer ; 
	 tTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ;  totTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ; 

     nlogin += agentInfo.n_login; tot_nlogin += agentInfo.n_login;
	 nNotReadyTime +=agentInfo.n_NotReady  ;  tot_nNotReadyTime +=agentInfo.n_NotReady  ; 
	 nWaitTime +=agentInfo.n_Wait  ;  tot_nWaitTime +=agentInfo.n_Wait  ; 
	 nSingleTransferTime +=agentInfo.n_single_transfer  ;  tot_nSingleTransferTime +=agentInfo.n_single_transfer ; 
	 nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; tot_nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; 
        }}agentInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true){
      out.write("\r\n");
      out.write("\t\t\t <tr><td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nlogin));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tWaitTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nWaitTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tSingleTransferTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nSingleTransferTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTwoStepTransferTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nTwoStepTransferTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tNotReadyTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nNotReadyTime));
      out.write("</b></font></td></tr>\r\n");
      out.write("\t");
}
      out.write("<tr>\r\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nlogin));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
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

								out.write(pageUnAnsdData.getWord("Not ready reason"));
								needOneMoreTotalRow = false;
							    tNotReadyTime = 0; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								nb_NRR = beanAgentDetail.m_vAllNRR.size();
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
      out.print( pageUnAnsdData.getWord("Time period"));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t");

				   tNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   totNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   nNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   tot_nNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   ssNNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   ssTotNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
					for(int k =0; k < beanAgentDetail.m_vAllNRR.size(); k++)
					{ 
					  tNotReadyReason[k] = 0;
					  totNotReadyReason[k]=0;
					   nNotReadyReason[k] =0;
					   tot_nNotReadyReason[k] =0;
					   ssNNotReadyReason[k] =0;
					   ssTotNotReadyReason[k] =0;
					
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t<td width=\"6%\" colspan=\"3\" align=\"center\" style=\"border-style:solid; border-right-color: #949494\">");
      out.print(beanAgentDetail.m_vAllNRR.elementAt(k) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr class=\"reportsNRRCol\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
 out.write(" "); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");

					for(int k =0; k < beanAgentDetail.m_vAllNRR.size(); k++)
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

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				 System.out.println("-------agentInfo.time-------"+ agentInfo.time);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
			
      out.write("\r\n");
      out.write("\t\t \t<tr>\r\n");
      out.write("\t\t\t \t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
				{ 
						if((ssTotNotReadyTime) !=0) 
						{
							percentNRR = agentInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
						}
						else 
						 percentNRR ="0.00";
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( agentInfo.buildReadableTime(ssTotNotReadyReason[n])); 
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
		}
      out.write("\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t");

			ssTotNotReadyTime =0;
			percentNRR = "" ;
			needOneMoreTotalRow = true;
		}
			tNotReadyTime = agentInfo.totalNotReadyTime ; 
			totNotReadyTime += agentInfo.totalNotReadyTime ;
			ssTotNotReadyTime +=agentInfo.totalNotReadyTime ;
		
      out.write("\r\n");
      out.write("\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t");

					for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
					{ 
						String key="";
						String nreadyreason = (String)beanAgentDetail.m_vAllNRR.elementAt(n);
						key = agentInfo.datehour+"-"+ nreadyreason;
						beanAgentDetailsInfoReport.nrrdata tmpNrrElt = (beanAgentDetailsInfoReport.nrrdata)mapNRR.get(key);

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
						percentNRR = agentInfo.formatDecimalDouble( ( (double)((tNotReadyReason[n])*100)/tNotReadyTime), 2);	
						}
						else 
						 percentNRR ="0.00";
						
						
      out.write("\r\n");
      out.write("\t\t\t\t<td align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write( agentInfo.buildReadableTime(tNotReadyReason[n])); 						 						
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\"> ");
 out.write(""+ nNotReadyReason[n]);  
      out.write("\t</td>\t\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\"> ");
 out.write(percentNRR);  
      out.write("\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
	
			} 
      out.write("\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t\t");

	}
	agentInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true)
	{
		
      out.write("\r\n");
      out.write("\t <tr>\r\n");
      out.write("\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t ");

		for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
		{ 
				if((ssTotNotReadyTime) !=0) 
				{
					percentNRR = agentInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
				}
				else 
				 percentNRR ="0.00";
			
      out.write("\r\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( agentInfo.buildReadableTime(ssTotNotReadyReason[n])); 
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

			} 		  
		
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
				{ 
				if((totNotReadyTime) !=0) 
				{
					tot_percentNRR = agentInfo.formatDecimalDouble( ( (double)((totNotReadyReason[n])*100)/totNotReadyTime), 2);
				}
				else 
				 tot_percentNRR ="0.00";
				
					
      out.write("\r\n");
      out.write("\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( agentInfo.buildReadableTime(totNotReadyReason[n])); 
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ tot_nNotReadyReason[n]);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>\r\n");
      out.write("\t\t\t\t  ");
 out.write(tot_percentNRR);  
      out.write("\r\n");
      out.write("\t\t\t\t</b></font></td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
	
					} 
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

								out.write(pageUnAnsdData.getWord("Average"));
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
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageUnAnsdData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Waiting calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Single transfer calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Two step transfer calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Not ready calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
				if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
				if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
				if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
				if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgNotReadyTime));
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
				}
			    if(agentInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgWaitingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgSingleTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgTwoStepTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgNotReadyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

			ssTotNotReadyTime += agentInfo.totalNotReadyTime ;
			ssNNotReadyTime += agentInfo.n_NotReady;
			totNotReadyTime +=agentInfo.totalNotReadyTime ; 
			tot_nNotReadyTime +=agentInfo.n_NotReady  ; 
			tNotReadyTime = agentInfo.totalNotReadyTime ;  
			nNotReadyTime =agentInfo.n_NotReady  ; 
			
			ssTotWaitTime += agentInfo.totalWaitTime;
			ssNWaitTime += agentInfo.n_Wait;
			totWaitTime +=agentInfo.totalWaitTime  ; 
			tot_nWaitTime +=agentInfo.n_Wait  ;
			tWaitTime =agentInfo.totalWaitTime  ;  
			nWaitTime =agentInfo.n_Wait  ;  

			ssTotSingleTransferTime += agentInfo.totalSingleTransfer;
			ssNSingleTransferTime += agentInfo.n_single_transfer;
			totSingleTransferTime +=agentInfo.totalSingleTransfer ; 
			tot_nSingleTransferTime +=agentInfo.n_single_transfer ; 
	 		tSingleTransferTime +=agentInfo.totalSingleTransfer  ;  
	 		nSingleTransferTime +=agentInfo.n_single_transfer  ; 

			ssTotTwoStepTransferTime = agentInfo.totalTwoStepTranfer;
			ssNTwoStepTransferTime = agentInfo.n_two_step_transfer;
			totTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ; 
			tot_nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; 
			tTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ;  
			nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; 
			    }
			} 
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
			if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
			if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
			if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
			if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
			
      out.write("\r\n");
      out.write("\t\t\t \t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgNotReadyTime));
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
      out.print( pageUnAnsdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgNotReadyTime));
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

								out.write(pageUnAnsdData.getWord("Percentages compared to login time"));
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
      out.print( pageUnAnsdData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Waiting calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Single transfer calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Two step transfer calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Not ready calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime) !=0) 
				{
					percentNotReadyTime = agentInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = agentInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
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
				} 
			    if(agentInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentWaitingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentSingleTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentTwoStepTranferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentNotReadyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");

			ssTotLoginTime	+=agentInfo.totalLoginTime;
			totLoginTime +=agentInfo.totalLoginTime;
			tLoginTime =agentInfo.totalLoginTime;
					
			ssTotNotReadyTime += agentInfo.totalNotReadyTime;
			totNotReadyTime +=agentInfo.totalNotReadyTime; ;
			tNotReadyTime = agentInfo.totalNotReadyTime; ; 

			ssTotWaitTime += agentInfo.totalWaitTime ;
			totWaitTime += agentInfo.totalWaitTime ;
			tWaitTime = agentInfo.totalWaitTime ; 

			ssTotSingleTransferTime += agentInfo.totalSingleTransfer;
			totSingleTransferTime += agentInfo.totalSingleTransfer;
			tSingleTransferTime = agentInfo.totalSingleTransfer;

			ssTotTwoStepTransferTime += agentInfo.totalTwoStepTranfer ;
			totTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ;
			tTwoStepTransferTime = agentInfo.totalTwoStepTranfer  ; 

			    }
			} 
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
				if((ssTotLoginTime) !=0) 
				{
					percentNotReadyTime = agentInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = agentInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
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
      out.write("\t\t\t");

				  }
				if((totLoginTime) !=0) 
				{
					tot_percentNotReadyTime = agentInfo.formatDecimalDouble( ( (double)(totNotReadyTime*100)/totLoginTime), 2);
					tot_percentWaitTime  = agentInfo.formatDecimalDouble( ( (double)(totWaitTime*100)/totLoginTime), 2);
					tot_percentSingleTransferTime = agentInfo.formatDecimalDouble( ( (double)(totSingleTransferTime*100)/totLoginTime), 2);
					tot_percentTwoStepTransferTime = agentInfo.formatDecimalDouble( ( (double)(totTwoStepTransferTime*100)/totLoginTime), 2);
				}
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
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
 pageUnAnsdData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t");

				}
			}
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div><div class=\"tab-page\" id=\"tabPage3\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Statistics"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage3\" ) ); \t\t\t \t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
			 if(sret == "success")
			 {
				agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
				
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	String totNotReadyTime_Percent = "10" , totTalkTimeInbound_Percent = "10";
    String totTalkTimeOutbound_Percent = "20", totWaitTime_Percent = "10" , totWrapUp_Percent ="10";
	String totHold_Percent = "0" , totSingleTransfert_Percent ="10", totTwoStepTransfert_Percent ="10";
	String totOther_Percent = "10";
	String lang = "10";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");
		
	beanManagerData pageRepStData = new beanManagerData();
	pageRepStData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageRepStData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	

      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("var test =\"");
      out.print( pageRepStData.getWord("Generals statistics"));
      out.write("\";\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">");
if(from.compareTo("agentReport") !=0){
      out.write("<tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"center\"><b>");
try { out.write(beanAgent.getAgentFullName(agentId)); }catch(Exception e) { out.write(""); }
      out.write('[');
      out.write(' ');
 out.println(agentId); 
      out.write("] </b></td></tr></table></td></tr><tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td  class=\"reportsID\" width=\"100%\" align=\"center\"><b>");
      out.print( pageRepStData.getWord("Generals statistics"));
      out.write(" &nbsp;");
      out.print( pageRepStData.getWord("for"));
      out.write("<br><br>");
if (reportType.compareTo("Daily") ==0){out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));} else if (reportType.compareTo("Monthly") ==0){out.write(starting_year_monthly+"-"+starting_month_monthly);} else if (reportType.compareTo("Yearly") ==0){out.write(starting_year_yearly);}
      out.print( pageRepStData.getWord("To"));
if (reportType.compareTo("Daily") ==0){out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));}else if (reportType.compareTo("Monthly") ==0){out.write(ending_year_monthly+"-"+ending_month_monthly);} else if (reportType.compareTo("Yearly") ==0){out.write(ending_year_yearly);}
      out.write("</b></td></tr>\t</table></td></tr>\r\n");
      out.write("\t");
}else{String wd1 ="100%", wd2 ="70%"; 
      out.write("<tr><td width=\"100%\" align=\"center\"><table   ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}else { out.write ("width=70%"); out.write("align=center"); }
      out.write("><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\"><b>");
      out.print( pageRepStData.getWord("Generals statistics"));
      out.write("</b></font></td>\t</tr></table></td></tr>");
}
      out.write("<tr><td width=\"100%\" align=\"center\"><table width=\"100%\" ");
 if(detail.compareTo("1")==0 )  { out.write("align=left");}else {out.write("align=center"); }
      out.write("><tr><td height=\"20\"></td></tr><tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");

					totNotReadyTime_Percent = Long.toString(agentInfo.totalNotReadyTime);
					totTalkTimeInbound_Percent = Long.toString(agentInfo.totalTalkTimeInbound);
					totTalkTimeOutbound_Percent =Long.toString(agentInfo.totalTalkTimeOutbound);
					totWaitTime_Percent = Long.toString(agentInfo.totalWaitTime);
					totWrapUp_Percent =Long.toString(agentInfo.totalWrapUpOutTime + agentInfo.totalWrapUpInTime);
					totHold_Percent = Long.toString(agentInfo.totalHoldTime) ;
					//totSingleTransfert_Percent = Long.toString(agentInfo.totalSingleTransfer);
					//totTwoStepTransfert_Percent = Long.toString(agentInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(agentInfo.totalLoginTime - agentInfo.totalNotReadyTime - 
														agentInfo.totalTalkTimeInbound - agentInfo.totalTalkTimeOutbound -
														agentInfo.totalWaitTime - agentInfo.totalWrapUpOutTime -
														agentInfo.totalWrapUpInTime - agentInfo.totalHoldTime ); 
														//agentInfo.totalSingleTransfer - agentInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(agentInfo.totalLoginTime - agentInfo.totalNotReadyTime - 
														agentInfo.totalTalkTimeInbound - agentInfo.totalTalkTimeOutbound -
														agentInfo.totalWaitTime - agentInfo.totalWrapUpOutTime -
														agentInfo.totalWrapUpInTime - agentInfo.totalHoldTime - 
														agentInfo.totalSingleTransfer - agentInfo.totalTwoStepTranfer);
					
					
					out.write("<applet code='Manager.PieChart.PiechartApplet.class'  archive='../sAheevaChart.jar' width='650' height='320' mayscript name='graphApplet'>");
					// Start Up Parameters -->
					
				//out.write("<PARAM name='LOADINGMESSAGE' value='"+pageRepstatsData.getWord("graphloadingmessage")+"'>");					
				
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
				
				out.write("<PARAM name='legendtitle'   value='"+pageRepStData.getWord("calls") +"'>");
				
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
				out.write("<PARAM name='pie1label8' value=''>");
					
					
				out.write("<PARAM name='segment1'   value='115,152,164|"+ pageRepStData.getWord("inbound") +"'>");				
				
				out.write("<PARAM name='segment2'   value='99,99,156|"+ pageRepStData.getWord("outbound") +"'>");				
				
				out.write("<PARAM name='segment3'   value='185,53,8|"+ pageRepStData.getWord("wrapup") +"'>");
				
				out.write("<PARAM name='segment4'   value='239,214,115|"+ pageRepStData.getWord("hold") +"'>");
								
				out.write("<PARAM name='segment5'   value='100,100,60|"+ pageRepStData.getWord("waiting") +"'>");
												
				out.write("<PARAM name='segment6'   value='17,97,158|"+ pageRepStData.getWord("notready") +"'>");
								
				out.write("<PARAM name='segment7'   value='100,214,50|"+ pageRepStData.getWord("singletransfer") +"'>");
										
				out.write("<PARAM name='segment8'   value='180,0,230|"+ pageRepStData.getWord("twosteptransfer") +"'>");	
				
				out.write("<PARAM name='segment9'   value='228,115,64|"+ pageRepStData.getWord("Dialing") +"'>");	
				
				
				out.write("<PARAM name='data1series1' value=\""+totTalkTimeInbound_Percent+"\">");
				out.write("<PARAM name='data2series1' value=\""+totTalkTimeOutbound_Percent+"\">");
				out.write("<PARAM name='data3series1' value=\""+totWrapUp_Percent+"\">");
				out.write("<PARAM name='data4series1' value=\""+totHold_Percent+"\">");
				out.write("<PARAM name='data5series1' value=\""+totWaitTime_Percent+"\">");
				out.write("<PARAM name='data6series1' value=\""+totNotReadyTime_Percent+"\">");
				//out.write("<PARAM name='data7series1' value=\""+totSingleTransfert_Percent+"\">");
				//out.write("<PARAM name='data8series1' value=\""+totTwoStepTransfert_Percent+"\">");
				out.write("<PARAM name='data7series1' value=\""+totOther_Percent+"\">");
				out.write("<PARAM name='data8series1' value=\""+totOther_Percent+"\">");
				 
					
				out.write("</applet>");

					
					
					
					
					
					
      out.write("</td></tr></table></td></tr>\r\n");
      out.write("\t");
if(from.compareTo("agentReport") !=0){
      out.write("<tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td  class=\"reportsID\" width=\"100%\" align=\"center\"><b>");
      out.print( pageRepStData.getWord("Other statistics"));
      out.write(" </b></td></tr>\t</table></td></tr>");
}else{
      out.write("<tr><td width=\"100%\" align=\"center\"><table ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}else { out.write ("width=70%"); out.write("align=center"); }
      out.write(" ><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\"><b>");
      out.print( pageRepStData.getWord("Other statistics"));
      out.write(" \t\t</b></font></td></tr></table></td></tr>");
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
      out.print( pageRepStData.getWord("Sheduled time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t  ");

						out.write(agentInfo.getScheduled());
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepStData.getWord("Login"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
					
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepStData.getWord("Adherence"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(agentInfo.getAdherence());
					
      out.write("\t\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\t\t\r\n");
 pageRepStData.closeConnection();
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t");

			}
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tsetupAllTabs();\r\n");
      out.write("</script>\r\n");

}
else // tous les agents selectionnes
{

      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"agentReports\" action=\"\">\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Answered"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage1\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			if(detail.compareTo("0") == 0) // non non detaille
			{
				for(int obj = 0; obj < numObj; obj++ )
				{
					agentId = agentList[obj];
					agentInfo = null;
					sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId, reportType, startingDate, endingDate);
					if(sret == "success")
					 {
						agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
						
      out.write("\r\n");
      out.write("                                                ");
 String percent_Ans =""; 
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
      out.write("\r\n");

////open connection to database///////
beanManagerData page2Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	page2Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    page2Data.openConnection();
    
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javaScript\" type=\"text/javascript\">\r\n");
      out.write("var lang = normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(beanAgent.getAgentFullName(agentId)); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(agentId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\t\t\t\t\t  </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
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
								  out.write(page2Data.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0)
							    {
								out.write(page2Data.getWord("Monthly"));
								}
							else if (reportType.compareTo("Yearly")==0)
							    {
								out.write(page2Data.getWord("Yearly"));
								}

							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( page2Data.getWord("Details Report for answered calls"));
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
      out.print( page2Data.getWord("To"));
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
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	if(from.compareTo("agentReport") == 0)
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( page2Data.getWord("Answered calls"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
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
							 page2Data.getWord("Login details")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("First login"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(beanAgent.getfirstLoginTime());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Last logout"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(beanAgent.getLastLogoutTime().substring(0,19));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Login time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Login count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(Long.toString(agentInfo.n_login));
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
							 page2Data.getWord("Inbound calls")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
      out.print( page2Data.getWord("Inbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_Inbound));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getInboundPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Inbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Inbound average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgTalktimeInbound());
					}catch(Exception e){
						out.write("-");
					}
				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
							 page2Data.getWord("Outbound calls")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Outbound count"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(Long.toString(agentInfo.n_Outbound));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Calls/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(agentInfo.getOutboundPerHour());
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Outbound time"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Outbound average"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						try {
							out.write(agentInfo.getAvgTalktimeOutbound());
						}catch(Exception e){
							out.write("-");
						}

					
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
							 page2Data.getWord("Wrap up calls")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Wrap up count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Wrap_up/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getWrapUpPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Wrap up time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Wrap up average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgWrapUpTime());
					}catch(Exception e){
						out.write("-");
					}

				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
							 page2Data.getWord("Hold calls")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Hold count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\"  style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_hold));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Hold/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getHoldPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Hold time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalHoldTime));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Hold average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgTalktimeHold());
					}catch(Exception e){
						out.write("-");
					}

				
      out.write(" </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	if(agentInfo.totalLoginTime > 0)
	{

      out.write("\r\n");
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
							 page2Data.getWord("Percentages compared to login time")
							);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Login"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"100%\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\"  style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Handling"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentHandlingTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}

						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Busy"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentBusyTime();
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Inbound"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentInboundTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( page2Data.getWord("Outbound"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentOutboundTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Wrapup"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentWrapUpTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"25%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( page2Data.getWord("Hold"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try
						{
							percent_Ans = agentInfo.getPercentHoldTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
						}
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"50%\" valign=\"middle\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent_Ans); 
      out.write("\" height=\"10\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"95%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"5%\" style=\"background-color:#F4F4F4\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  </table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("</table>\r\n");
 page2Data.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");

					}
			    } //fin for
			}
			if(detail.compareTo("1")==0) // rapport detaille
			{
				for(int obj = 0; obj < numObj; obj++ )
				{
					agentId = agentList[obj];
					agentInfo = null;
					sret = beanAgentDetail.buildAgentDetailsInfosForPeriod(agentId, reportType, startingDate, endingDate);
					if(sret == "success")
					{
						//agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
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
beanManagerData pageAnsDetData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageAnsDetData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageAnsDetData.openConnection();
    
      out.write("\r\n");
      out.write("    ");

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
    agentInfo =null;

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								try { out.write(beanAgentDetail.getAgentFullName(agentId)); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(agentId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\r\n");
      out.write("\t\t\t\t\t  </b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
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
								  out.write(pageAnsDetData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageAnsDetData.getWord("Monthly"));					
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageAnsDetData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageAnsDetData.getWord("Details Report for answered calls"));
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
      out.print( pageAnsDetData.getWord("To"));
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

	if(from.compareTo("agentReport") == 0)
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageAnsDetData.getWord("Answered calls"));
      out.write("\t\t\t\r\n");
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
      out.write("\t\t\t\t\t\t\t");
      out.print(
							 pageAnsDetData.getWord("Telephony data")
							);
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
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\">");
      out.print( pageAnsDetData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Login time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Login count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Inbound time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Inbound count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Outbound time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Outbound count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Wrap up time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Wrap up count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Hold time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Hold count"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");

    for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) {
         agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);

      out.write("\r\n");
      out.write(" \t\t\t");
 if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) {
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tLoginTime_Ans));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_N_login));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Inbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Outbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Wrap_up));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Hold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
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
 		 if(agentInfo.totalLoginTime > 0){
		
      out.write("\r\n");
      out.write("\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t<td    align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_login));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_Inbound));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_Outbound));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up) );
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"10%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalHoldTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_hold));
      out.write("</td>\r\n");
      out.write("\t  </tr>\r\n");

        tLoginTime_Ans += agentInfo.totalLoginTime;   totLoginTime_Ans += agentInfo.totalLoginTime;
        tTalkTimeInbound += agentInfo.totalTalkTimeInbound;  totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
        tTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
        tWrapUp  += agentInfo.totalWrapUpInTime; totWrapUp  += agentInfo.totalWrapUpInTime;
        tWrapUp  += agentInfo.totalWrapUpOutTime; totWrapUp  += agentInfo.totalWrapUpOutTime;
        tHold += agentInfo.totalHoldTime; totHold += agentInfo.totalHoldTime;

        t_N_login += agentInfo.n_login; tot_N_login += agentInfo.n_login;
        t_n_Inbound += agentInfo.n_Inbound; tot_n_Inbound += agentInfo.n_Inbound;
        t_n_Outbound += agentInfo.n_Outbound; tot_n_Outbound += agentInfo.n_Outbound;

        t_n_Wrap_up += agentInfo.n_Wrap_In_up;  tot_n_Wrap_up += agentInfo.n_Wrap_In_up;
        t_n_Wrap_up += agentInfo.n_Wrap_Out_up;  tot_n_Wrap_up += agentInfo.n_Wrap_Out_up;
        t_n_Hold += agentInfo.n_hold; tot_n_Hold += agentInfo.n_hold;
        }
    }
 	agentInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow_Ans == true){
	
      out.write("\r\n");
      out.write("\t <tr>\r\n");
      out.write("\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tLoginTime_Ans));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_N_login));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Inbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Outbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Wrap_up));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(t_n_Hold));
      out.write("</b></font></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

		  }
	
      out.write("\r\n");
      out.write("\t <tr>\r\n");
      out.write("\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totLoginTime_Ans));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_N_login));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Inbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Outbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Wrap_up));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_n_Hold));
      out.write("</b></font></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageAnsDetData.getWord("Average"));
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
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageAnsDetData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Inbound calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\"> ");
      out.print( pageAnsDetData.getWord("Outbound calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Wrap up calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Hold calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Handling"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("AHT in"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("AHT out"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) {
				agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0){
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
					if((ssNInbound + ssNOutbound) !=0) avgWrapUp = (ssTotWrapUp/(ssNInbound + ssNOutbound));
					if((ssNInbound + ssNOutbound) !=0) avgHold = (ssTotHold/(ssNInbound + ssNOutbound));
					if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
					
      out.write("\r\n");
      out.write("\t\t\t\t \t<tr>\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgHandling));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(ahtIn));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(ahtOut));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t \t\t\t");

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
				}
			    if(agentInfo.totalLoginTime > 0){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgTalktimeInbound());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgTalktimeOutbound());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgWrapUpTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgTalktimeHold());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgHandlingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAhtIn());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAhtOut());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  \t</tr>\r\n");
      out.write("\t\t\t\t\t");

					ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound ;
					ssNInbound+= agentInfo.n_Inbound;
					totTalkTimeInbound +=agentInfo.totalTalkTimeInbound ;
					tot_n_Inbound +=agentInfo.n_Inbound  ; 
					tTalkTimeInbound = agentInfo.totalTalkTimeInbound ; 
					t_n_Inbound =agentInfo.n_Inbound  ; 
		
					ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound ;
					ssNOutbound += agentInfo.n_Outbound;
					totTalkTimeOutbound +=agentInfo.totalTalkTimeOutbound ;
					tot_n_Outbound +=agentInfo.n_Outbound  ; 
					tTalkTimeOutbound = agentInfo.totalTalkTimeOutbound ; 
					t_n_Outbound =agentInfo.n_Outbound  ; 
		
					ssTotWrapUp += agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime ;
					ssNWrap_up+= agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up;
					totWrapUp +=agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ;
					tot_n_Wrap_up +=agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
					tWrapUp = agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ; 
					t_n_Wrap_up =agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up;
		
					ssTotWrapUpIn += agentInfo.totalWrapUpInTime;
					ssTotWrapUpOut += agentInfo.totalWrapUpOutTime ;
					totWrapUpIn+= agentInfo.totalWrapUpInTime;
					totWrapUpOut += agentInfo.totalWrapUpOutTime ;
		
					ssTotHold += agentInfo.totalHoldTime ;
					ssNHold+= agentInfo.n_hold;
					totHold +=agentInfo.totalHoldTime ;
					tot_n_Hold +=agentInfo.n_hold  ; 
					tHold = agentInfo.totalHoldTime ; 
					t_n_Hold =agentInfo.n_hold  ; 
					ssTotHandling += agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
					ssNHandling+= agentInfo.n_Inbound + agentInfo.n_Outbound;
					totHandling +=agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
					tot_n_Handling += agentInfo.n_Inbound + agentInfo.n_Outbound;
					tHandling = agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
					t_n_Handling = agentInfo.n_Inbound + agentInfo.n_Outbound;
			    }
			} 
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true){
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
				if((ssNOutbound + ssNInbound ) !=0) avgWrapUp = (ssTotWrapUp/(ssNOutbound + ssNInbound) );
				if((ssNOutbound + ssNInbound ) !=0) avgHold = (ssTotHold/(ssNOutbound + ssNInbound ));
				if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
				
      out.write("\r\n");
      out.write("\t\t\t \t\t<tr>\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgHandling));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(ahtIn));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(ahtOut));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

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
			if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgWrapUp = (totWrapUp/(tot_n_Outbound + tot_n_Inbound));
			if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgHold = (totHold/(tot_n_Outbound + tot_n_Inbound));
			if((tot_n_Handling) !=0) tot_avgHandling = (totHandling/tot_n_Handling);
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgTalkTimeInbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgTalkTimeOutbound));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgHandling));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_ahtIn));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_ahtOut));
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

								out.write(pageAnsDetData.getWord("Percentages compared to login time"));
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
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageAnsDetData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Inbound calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Outbound calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Wrap up calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Hold calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Handling"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\"  align=\"center\">");
      out.print( pageAnsDetData.getWord("Busy"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = agentInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = agentInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = agentInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = agentInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeInbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWrapUp+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHold+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHandling+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentBusy+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
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
				} 
			    if(agentInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentInboundTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentOutboundTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentWrapUpTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentHoldTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentHandlingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentBusyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");


			ssTotLoginTime_Ans	+=agentInfo.totalLoginTime;
			totLoginTime_Ans +=agentInfo.totalLoginTime;
			tLoginTime_Ans =agentInfo.totalLoginTime;
			ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound ;
			totTalkTimeInbound +=agentInfo.totalTalkTimeInbound ;
			tTalkTimeInbound = agentInfo.totalTalkTimeInbound ; 
			ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound ;
			totTalkTimeOutbound +=agentInfo.totalTalkTimeOutbound ;
			tTalkTimeOutbound = agentInfo.totalTalkTimeOutbound ; 
			ssTotWrapUp += agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime ;
			totWrapUp +=agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ;
			tWrapUp = agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ; 
			ssTotHold += agentInfo.totalHoldTime ;
			totHold +=agentInfo.totalHoldTime ;
			tHold = agentInfo.totalHoldTime ; 
			ssTotHandling += agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
			totHandling +=agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
			tHandling = agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
			ssTotBusy += agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime;
			totBusy +=agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime;
			tBusy = agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime;
			
			    }
			}
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true)
			{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = agentInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = agentInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = agentInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = agentInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeInbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentWrapUp+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHold+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentHandling+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(percentBusy+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

				  }
				if((totLoginTime_Ans) !=0) 
				{
					tot_percentTalkTimeInbound = agentInfo.formatDecimalDouble( ( (double)(totTalkTimeInbound*100)/totLoginTime_Ans), 2);
					tot_percentTalkTimeOutbound  = agentInfo.formatDecimalDouble( ( (double)(totTalkTimeOutbound*100)/totLoginTime_Ans), 2);
					tot_percentWrapUp = agentInfo.formatDecimalDouble( ( (double)(totWrapUp*100)/totLoginTime_Ans), 2);
					tot_percentHold = agentInfo.formatDecimalDouble( ( (double)(totHold*100)/totLoginTime_Ans), 2);
					tot_percentHandling = agentInfo.formatDecimalDouble( ( (double)(totHandling*100)/totLoginTime_Ans), 2);
					tot_percentBusy = agentInfo.formatDecimalDouble( ( (double)(totBusy*100)/totLoginTime_Ans), 2);
				}
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageAnsDetData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTalkTimeInbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentTalkTimeOutbound+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentWrapUp+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentHold +"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentHandling+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"10%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_percentBusy+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
 pageAnsDetData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");

					}
			    } //fin for
			}
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div><div class=\"tab-page\" id=\"tabPage2\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Unanswered"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage2\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			if(detail.compareTo("0") == 0) // rapport non detaille
			{
				for(int obj = 0; obj < numObj; obj++ )
				{
					agentId = agentList[obj];
					agentInfo = null;
					sret =beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
					if(sret == "success")
					 {
						agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
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
beanManagerData pageUnAnsData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageUnAnsData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageUnAnsData.openConnection();
    
      out.write('\n');

	String percent ="";

      out.write("\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");

	if(from.compareTo("agentReport") != 0)
	{


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

								try { out.write(beanAgent.getAgentFullName(agentId)); }
								catch(Exception e) { out.write(""); }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  [\r\n");
      out.write("\t\t\t\t\t\t  ");
 out.println(agentId); 
      out.write("\r\n");
      out.write("\t\t\t\t\t  \t ]\t\t\t\t\t  </b>\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
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
								  out.write( pageUnAnsData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageUnAnsData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageUnAnsData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageUnAnsData.getWord("Report for unanswered calls"));
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
      out.print( pageUnAnsData.getWord("To"));
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
      out.print( pageUnAnsData.getWord("Unanswered calls"));
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
							 pageUnAnsData.getWord("Waiting calls")
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
      out.print( pageUnAnsData.getWord("Waiting count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_Wait));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Waiting/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getWaitingPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalWaitTime));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Waiting average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgWaitingTime());
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
							pageUnAnsData.getWord("Transfer calls")
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
      out.print( pageUnAnsData.getWord("Transfert count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(Long.toString(agentInfo.n_single_transfer + agentInfo.n_two_step_transfer));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Transfer/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.getTransferPerHour());
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Transfert time"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
 try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer));
						}catch(Exception e){
							out.write("-");
						}
					
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");
      out.print( pageUnAnsData.getWord("Transfert average"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t");

					try {
						out.write(agentInfo.getAvgTransferTime());
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
							 pageUnAnsData.getWord("Not ready calls")
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
      out.print( pageUnAnsData.getWord("Not ready count"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(Long.toString(agentInfo.n_NotReady));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageUnAnsData.getWord("Not-Ready/hour"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(agentInfo.getNotReadyPerHour());
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageUnAnsData.getWord("Not ready time"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t\t");
 try {
								out.write(agentInfo.buildReadableTime(agentInfo.totalNotReadyTime));
							}catch(Exception e){
								out.write("-");
							}
						
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabName\" width=\"40%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageUnAnsData.getWord("Not ready average"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"60%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						try {
							out.write(agentInfo.getAvgNotReadyTime());
						}catch(Exception e){
							out.write("-");
						}
			
					
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	if(agentInfo.totalNotReadyTime > 0)
	{
		String name ="" , nombre="";
		String duree ="", nrr_percent="";
		int nb_not_ready_reason = (agentInfo.NRR_vector.size())/4;
		//int nb_not_ready_reason=9;

      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t  ");
      out.print(
					pageUnAnsData.getWord("Not ready reason")
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
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"35%\" align=\"center\" style=\"border:solid\">");
      out.print(
           pageUnAnsData.getWord("Reason")
						);
      out.write("          </td>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"5%\" align=\"center\" style=\"border:solid\">\n");
      out.write("          ");
      out.print( pageUnAnsData.getWord("Count")
						);
      out.write("          </td>\r\n");
      out.write("          <td height=\"20\" class=\"reportsID\" width=\"15%\" align=\"center\" style=\"border:solid\">\n");
      out.write("          ");
      out.print( pageUnAnsData.getWord("Time")
						);
      out.write("          </td>\r\n");
      out.write("          <td colspan=\"2\" height=\"20\" class=\"reportsID\" width=\"45%\" align=\"center\" style=\"border-left:none; border-top:solid; border-bottom:solid; border-right:solid\">\n");
      out.write("          ");
      out.print( pageUnAnsData.getWord("Percentages compared to Not ready time")
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

							
							name =(String)agentInfo.NRR_vector.elementAt(j);
							out.write(name);
						
      out.write("\r\n");
      out.write("          </b> </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"5%\" style=\"border:solid\">");

							w=j+1;
							nombre =(String)agentInfo.NRR_vector.elementAt(w);
							out.write(nombre);
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"15%\" style=\"border:solid\">");

							v=j+2;
							duree =(String)agentInfo.NRR_vector.elementAt(v);
							out.write(duree);
						
      out.write("          </td>\r\n");
      out.write("          <td class=\"reportsTabValues\" width=\"10%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">");

							y=j+3;
							nrr_percent =(String)agentInfo.NRR_vector.elementAt(y);
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
	
	if(agentInfo.totalLoginTime > 0)
	{

      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							 pageUnAnsData.getWord("Percentages compared to login time")
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
      out.print( pageUnAnsData.getWord("Login"));
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
      out.print( pageUnAnsData.getWord("Wait"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = agentInfo.getPercentWaitingTime() ;
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
      out.print( pageUnAnsData.getWord("Single transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = agentInfo.getPercentSingleTransferTime();
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
      out.print( pageUnAnsData.getWord("Two step transfer"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = agentInfo.getPercentTwoStepTranferTime() ;
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
      out.print( pageUnAnsData.getWord("Not ready"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t<td align=\"center\" class=\"reportsTabValues\" width=\"15%\" style=\"border-left:solid; border-top:solid; border-bottom:solid; border-right:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						try 
						{
							percent = agentInfo.getPercentNotReadyTime() ;
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
 pageUnAnsData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");

					}
			    } //fin for
			}
			if( detail.compareTo("1")==0) // rapport detaille
			{
				HashMap mapNRR = new HashMap();
				for(int obj =0; obj < numObj; obj++ )
				{
					agentId = agentList[obj];
					agentInfo = null;
					mapNRR.clear();
					sret = beanAgentDetail.buildAgentDetailsInfosForPeriod(agentId,reportType,startingDate,endingDate);
					beanAgentDetail.beanAgentDetailsGettingNameNrr(agentId,reportType,startingDate,endingDate);
					beanAgentDetail.BuildNotReadyReasonForPeriod(agentId,reportType,startingDate,endingDate);
					if(sret == "success")
					{
						//agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
						mapNRR = (HashMap)beanAgentDetail.mapNrr;
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
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

beanManagerData pageUnAnsdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageUnAnsdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageUnAnsdData.openConnection();
    

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
    agentInfo =null;
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
if(from.compareTo("agentReport") != 0){
      out.write("\r\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr><td width=\"100%\" align=\"center\"><b>\r\n");
      out.write("\t\t\t\t\t\t\t");
out.write(beanAgentDetail.getAgentFullName(agentId));
      out.write('[');
 out.println(agentId); 
      out.write("]</b></td></tr></table></td></tr>\r\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr><td  class=\"reportsID\" width=\"100%\" align=\"center\"><b>\r\n");
      out.write("\t\t\t\t\t\t\t");
if (reportType.compareTo("Daily")==0) 
							    { out.write(pageUnAnsdData.getWord("Daily"));}
							else if (reportType.compareTo("Monthly")==0){out.write(pageUnAnsdData.getWord("Monthly"));}
							else if (reportType.compareTo("Yearly")==0) 
							    {out.write(pageUnAnsdData.getWord("Yearly"));}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageUnAnsdData.getWord("Detail report for unanswered calls"));
      out.write("<br><br>\r\n");
      out.write("\t\t\t\t\t\t\t");
if (reportType.compareTo("Daily") ==0){out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){out.write(starting_year_yearly);}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageUnAnsdData.getWord("To"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
if (reportType.compareTo("Daily") ==0){out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){out.write(ending_year_yearly);}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b></td></tr></table></td></tr>\r\n");
}else{
      out.write("\r\n");
      out.write("\t\t<tr><td width=\"100%\" align=\"center\"><table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr><td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageUnAnsdData.getWord("Unanswered calls"));
      out.write("</b></font></td></tr></table></td></tr>\r\n");
      out.write("\t");
}
      out.write("\r\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\"><table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageUnAnsdData.getWord("Telephony data"));
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b></td></tr><tr><td height=\"10\"></td></tr></table></td></tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\"> ");
      out.print( pageUnAnsdData.getWord("Time period"));
      out.write("</td><td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Login time"));
      out.write("</td><td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Login count"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Waiting time"));
      out.write("</td><td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Waiting count"));
      out.write("</td><td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Single transfer time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Single transfer count"));
      out.write("</td><td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Two step transfer time"));
      out.write("</td><td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Two step transfer count"));
      out.write("</td><td width=\"12%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Not ready time"));
      out.write("</td><td width=\"5%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Not ready count"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) {
 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
      out.write("\r\n");
      out.write(" \t\t\t");
 if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) {
      out.write("\r\n");
      out.write("\t\t\t <tr><td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tLoginTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nlogin));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tWaitTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nWaitTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nSingleTransferTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTwoStepTransferTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nTwoStepTransferTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tNotReadyTime));
      out.write("</b></font></td> <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
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
				needOneMoreTotalRow = true;}if(agentInfo.totalLoginTime > 0){
      out.write("\r\n");
      out.write("\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t<td    align=\"center\">");
out.write(agentInfo.time);
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_login));
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalWaitTime));
      out.write("</td><td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_Wait));
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalSingleTransfer));
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_single_transfer));
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalTwoStepTranfer));
      out.write("</td><td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_two_step_transfer));
      out.write("</td><td width=\"12%\"  align=\"center\">");
out.write(agentInfo.buildReadableTime(agentInfo.totalNotReadyTime));
      out.write("</td><td width=\"5%\"  align=\"center\">");
out.write(Long.toString(agentInfo.n_NotReady));
      out.write("</td>\r\n");
      out.write("\t  </tr>\r\n");
tLoginTime += agentInfo.totalLoginTime;   totLoginTime += agentInfo.totalLoginTime;
	tNotReadyTime +=agentInfo.totalNotReadyTime ;  totNotReadyTime +=agentInfo.totalNotReadyTime ;
	 tWaitTime +=agentInfo.totalWaitTime  ;  totWaitTime +=agentInfo.totalWaitTime  ; 
	 tSingleTransferTime +=agentInfo.totalSingleTransfer  ;  totSingleTransferTime +=agentInfo.totalSingleTransfer ; 
	 tTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ;  totTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ; 

     nlogin += agentInfo.n_login; tot_nlogin += agentInfo.n_login;
	 nNotReadyTime +=agentInfo.n_NotReady  ;  tot_nNotReadyTime +=agentInfo.n_NotReady  ; 
	 nWaitTime +=agentInfo.n_Wait  ;  tot_nWaitTime +=agentInfo.n_Wait  ; 
	 nSingleTransferTime +=agentInfo.n_single_transfer  ;  tot_nSingleTransferTime +=agentInfo.n_single_transfer ; 
	 nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; tot_nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; 
        }}agentInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true){
      out.write("\r\n");
      out.write("\t\t\t <tr><td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nlogin));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tWaitTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nWaitTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tSingleTransferTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nSingleTransferTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tTwoStepTransferTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nTwoStepTransferTime));
      out.write("</b></font></td><td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tNotReadyTime));
      out.write("</b></font></td><td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(nNotReadyTime));
      out.write("</b></font></td></tr>\r\n");
      out.write("\t");
}
      out.write("<tr>\r\n");
      out.write("\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nlogin));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"12%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(totNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(tot_nNotReadyTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
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

								out.write(pageUnAnsdData.getWord("Not ready reason"));
								needOneMoreTotalRow = false;
							    tNotReadyTime = 0; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								nb_NRR = beanAgentDetail.m_vAllNRR.size();
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
      out.print( pageUnAnsdData.getWord("Time period"));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t");

				   tNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   totNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   nNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   tot_nNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   ssNNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   ssTotNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
					for(int k =0; k < beanAgentDetail.m_vAllNRR.size(); k++)
					{ 
					  tNotReadyReason[k] = 0;
					  totNotReadyReason[k]=0;
					   nNotReadyReason[k] =0;
					   tot_nNotReadyReason[k] =0;
					   ssNNotReadyReason[k] =0;
					   ssTotNotReadyReason[k] =0;
					
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t<td width=\"6%\" colspan=\"3\" align=\"center\" style=\"border-style:solid; border-right-color: #949494\">");
      out.print(beanAgentDetail.m_vAllNRR.elementAt(k) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t");

					}	
				
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t  <tr class=\"reportsNRRCol\">\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
 out.write(" "); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");

					for(int k =0; k < beanAgentDetail.m_vAllNRR.size(); k++)
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

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				 System.out.println("-------agentInfo.time-------"+ agentInfo.time);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
			
      out.write("\r\n");
      out.write("\t\t \t<tr>\r\n");
      out.write("\t\t\t \t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
				{ 
						if((ssTotNotReadyTime) !=0) 
						{
							percentNRR = agentInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
						}
						else 
						 percentNRR ="0.00";
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( agentInfo.buildReadableTime(ssTotNotReadyReason[n])); 
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
		}
      out.write("\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t");

			ssTotNotReadyTime =0;
			percentNRR = "" ;
			needOneMoreTotalRow = true;
		}
			tNotReadyTime = agentInfo.totalNotReadyTime ; 
			totNotReadyTime += agentInfo.totalNotReadyTime ;
			ssTotNotReadyTime +=agentInfo.totalNotReadyTime ;
		
      out.write("\r\n");
      out.write("\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t");

					for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
					{ 
						String key="";
						String nreadyreason = (String)beanAgentDetail.m_vAllNRR.elementAt(n);
						key = agentInfo.datehour+"-"+ nreadyreason;
						beanAgentDetailsInfoReport.nrrdata tmpNrrElt = (beanAgentDetailsInfoReport.nrrdata)mapNRR.get(key);

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
						percentNRR = agentInfo.formatDecimalDouble( ( (double)((tNotReadyReason[n])*100)/tNotReadyTime), 2);	
						}
						else 
						 percentNRR ="0.00";
						
						
      out.write("\r\n");
      out.write("\t\t\t\t<td align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\">");
 out.write( agentInfo.buildReadableTime(tNotReadyReason[n])); 						 						
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#CCCCCC\"> ");
 out.write(""+ nNotReadyReason[n]);  
      out.write("\t</td>\t\r\n");
      out.write("\t\t\t\t<td   align=\"center\" style=\"border-style:solid; border-right-color:#949494\"> ");
 out.write(percentNRR);  
      out.write("\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
	
			} 
      out.write("\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t\t");

	}
	agentInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true)
	{
		
      out.write("\r\n");
      out.write("\t <tr>\r\n");
      out.write("\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t ");

		for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
		{ 
				if((ssTotNotReadyTime) !=0) 
				{
					percentNRR = agentInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
				}
				else 
				 percentNRR ="0.00";
			
      out.write("\r\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( agentInfo.buildReadableTime(ssTotNotReadyReason[n])); 
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

			} 		  
		
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t ");

				for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
				{ 
				if((totNotReadyTime) !=0) 
				{
					tot_percentNRR = agentInfo.formatDecimalDouble( ( (double)((totNotReadyReason[n])*100)/totNotReadyTime), 2);
				}
				else 
				 tot_percentNRR ="0.00";
				
					
      out.write("\r\n");
      out.write("\t\t\t\t<td align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write( agentInfo.buildReadableTime(totNotReadyReason[n])); 
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#CCCCCC\"><font  color=\"#000000\"><b>");
 out.write(""+ tot_nNotReadyReason[n]);  
      out.write("</b></font></td>\t\r\n");
      out.write("\t\t\t\t<td   align=\"center\" bgcolor=\"#FFECF5\" style=\"border-style:solid; border-right-color:#949494\"><font  color=\"#000000\"><b>\r\n");
      out.write("\t\t\t\t  ");
 out.write(tot_percentNRR);  
      out.write("\r\n");
      out.write("\t\t\t\t</b></font></td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");
	
					} 
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

								out.write(pageUnAnsdData.getWord("Average"));
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
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> ");
      out.print( pageUnAnsdData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Waiting calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Single transfer calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Two step transfer calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Not ready calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
				if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
				if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
				if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
				if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgNotReadyTime));
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
				}
			    if(agentInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgWaitingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgSingleTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgTwoStepTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getAvgNotReadyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

			ssTotNotReadyTime += agentInfo.totalNotReadyTime ;
			ssNNotReadyTime += agentInfo.n_NotReady;
			totNotReadyTime +=agentInfo.totalNotReadyTime ; 
			tot_nNotReadyTime +=agentInfo.n_NotReady  ; 
			tNotReadyTime = agentInfo.totalNotReadyTime ;  
			nNotReadyTime =agentInfo.n_NotReady  ; 
			
			ssTotWaitTime += agentInfo.totalWaitTime;
			ssNWaitTime += agentInfo.n_Wait;
			totWaitTime +=agentInfo.totalWaitTime  ; 
			tot_nWaitTime +=agentInfo.n_Wait  ;
			tWaitTime =agentInfo.totalWaitTime  ;  
			nWaitTime =agentInfo.n_Wait  ;  

			ssTotSingleTransferTime += agentInfo.totalSingleTransfer;
			ssNSingleTransferTime += agentInfo.n_single_transfer;
			totSingleTransferTime +=agentInfo.totalSingleTransfer ; 
			tot_nSingleTransferTime +=agentInfo.n_single_transfer ; 
	 		tSingleTransferTime +=agentInfo.totalSingleTransfer  ;  
	 		nSingleTransferTime +=agentInfo.n_single_transfer  ; 

			ssTotTwoStepTransferTime = agentInfo.totalTwoStepTranfer;
			ssNTwoStepTransferTime = agentInfo.n_two_step_transfer;
			totTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ; 
			tot_nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; 
			tTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ;  
			nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; 
			    }
			} 
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
			if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
			if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
			if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
			if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
			
      out.write("\r\n");
      out.write("\t\t\t \t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t <td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(avgNotReadyTime));
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
      out.print( pageUnAnsdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgWaitTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgSingleTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgTwoStepTransferTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(agentInfo.buildReadableTime(tot_avgNotReadyTime));
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

								out.write(pageUnAnsdData.getWord("Percentages compared to login time"));
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
      out.print( pageUnAnsdData.getWord("Time period"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Waiting calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Single transfer calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Two step transfer calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageUnAnsdData.getWord("Not ready calls"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime) !=0) 
				{
					percentNotReadyTime = agentInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = agentInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
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
				} 
			    if(agentInfo.totalLoginTime > 0)
			    {
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentWaitingTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentSingleTransferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentTwoStepTranferTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td   align=\"center\">");
out.write(agentInfo.getPercentNotReadyTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");

			ssTotLoginTime	+=agentInfo.totalLoginTime;
			totLoginTime +=agentInfo.totalLoginTime;
			tLoginTime =agentInfo.totalLoginTime;
					
			ssTotNotReadyTime += agentInfo.totalNotReadyTime;
			totNotReadyTime +=agentInfo.totalNotReadyTime; ;
			tNotReadyTime = agentInfo.totalNotReadyTime; ; 

			ssTotWaitTime += agentInfo.totalWaitTime ;
			totWaitTime += agentInfo.totalWaitTime ;
			tWaitTime = agentInfo.totalWaitTime ; 

			ssTotSingleTransferTime += agentInfo.totalSingleTransfer;
			totSingleTransferTime += agentInfo.totalSingleTransfer;
			tSingleTransferTime = agentInfo.totalSingleTransfer;

			ssTotTwoStepTransferTime += agentInfo.totalTwoStepTranfer ;
			totTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ;
			tTwoStepTransferTime = agentInfo.totalTwoStepTranfer  ; 

			    }
			} 
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
				if((ssTotLoginTime) !=0) 
				{
					percentNotReadyTime = agentInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = agentInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				
      out.write("\r\n");
      out.write("\t\t\t <tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
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
      out.write("\t\t\t");

				  }
				if((totLoginTime) !=0) 
				{
					tot_percentNotReadyTime = agentInfo.formatDecimalDouble( ( (double)(totNotReadyTime*100)/totLoginTime), 2);
					tot_percentWaitTime  = agentInfo.formatDecimalDouble( ( (double)(totWaitTime*100)/totLoginTime), 2);
					tot_percentSingleTransferTime = agentInfo.formatDecimalDouble( ( (double)(totSingleTransferTime*100)/totLoginTime), 2);
					tot_percentTwoStepTransferTime = agentInfo.formatDecimalDouble( ( (double)(totTwoStepTransferTime*100)/totLoginTime), 2);
				}
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   width=\"20%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageUnAnsdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
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
 pageUnAnsdData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");

					}
			    } //fin for
			}
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div><div class=\"tab-page\" id=\"tabPage3\">\r\n");
      out.write("\t\t\t\t<h2 class=\"tab\">");
      out.print( page1Data.getWord("Statistics"));
      out.write("</h2>\r\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage3\" ) );</script>\r\n");
      out.write("\t\t\t\t<fieldset>\r\n");
      out.write("\t\t\t    ");

					for(int obj =0; obj < numObj; obj++ )
					{
						agentId = agentList[obj];
						agentInfo = null;	
						sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
						 if(sret == "success")
						 {
							agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	String totNotReadyTime_Percent = "10" , totTalkTimeInbound_Percent = "10";
    String totTalkTimeOutbound_Percent = "20", totWaitTime_Percent = "10" , totWrapUp_Percent ="10";
	String totHold_Percent = "0" , totSingleTransfert_Percent ="10", totTwoStepTransfert_Percent ="10";
	String totOther_Percent = "10";
	String lang = "10";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");
		
	beanManagerData pageRepStData = new beanManagerData();
	pageRepStData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageRepStData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	

      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("var test =\"");
      out.print( pageRepStData.getWord("Generals statistics"));
      out.write("\";\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"75%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">");
if(from.compareTo("agentReport") !=0){
      out.write("<tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"center\"><b>");
try { out.write(beanAgent.getAgentFullName(agentId)); }catch(Exception e) { out.write(""); }
      out.write('[');
      out.write(' ');
 out.println(agentId); 
      out.write("] </b></td></tr></table></td></tr><tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td  class=\"reportsID\" width=\"100%\" align=\"center\"><b>");
      out.print( pageRepStData.getWord("Generals statistics"));
      out.write(" &nbsp;");
      out.print( pageRepStData.getWord("for"));
      out.write("<br><br>");
if (reportType.compareTo("Daily") ==0){out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));} else if (reportType.compareTo("Monthly") ==0){out.write(starting_year_monthly+"-"+starting_month_monthly);} else if (reportType.compareTo("Yearly") ==0){out.write(starting_year_yearly);}
      out.print( pageRepStData.getWord("To"));
if (reportType.compareTo("Daily") ==0){out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));}else if (reportType.compareTo("Monthly") ==0){out.write(ending_year_monthly+"-"+ending_month_monthly);} else if (reportType.compareTo("Yearly") ==0){out.write(ending_year_yearly);}
      out.write("</b></td></tr>\t</table></td></tr>\r\n");
      out.write("\t");
}else{String wd1 ="100%", wd2 ="70%"; 
      out.write("<tr><td width=\"100%\" align=\"center\"><table   ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}else { out.write ("width=70%"); out.write("align=center"); }
      out.write("><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\"><b>");
      out.print( pageRepStData.getWord("Generals statistics"));
      out.write("</b></font></td>\t</tr></table></td></tr>");
}
      out.write("<tr><td width=\"100%\" align=\"center\"><table width=\"100%\" ");
 if(detail.compareTo("1")==0 )  { out.write("align=left");}else {out.write("align=center"); }
      out.write("><tr><td height=\"20\"></td></tr><tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");

					totNotReadyTime_Percent = Long.toString(agentInfo.totalNotReadyTime);
					totTalkTimeInbound_Percent = Long.toString(agentInfo.totalTalkTimeInbound);
					totTalkTimeOutbound_Percent =Long.toString(agentInfo.totalTalkTimeOutbound);
					totWaitTime_Percent = Long.toString(agentInfo.totalWaitTime);
					totWrapUp_Percent =Long.toString(agentInfo.totalWrapUpOutTime + agentInfo.totalWrapUpInTime);
					totHold_Percent = Long.toString(agentInfo.totalHoldTime) ;
					//totSingleTransfert_Percent = Long.toString(agentInfo.totalSingleTransfer);
					//totTwoStepTransfert_Percent = Long.toString(agentInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(agentInfo.totalLoginTime - agentInfo.totalNotReadyTime - 
														agentInfo.totalTalkTimeInbound - agentInfo.totalTalkTimeOutbound -
														agentInfo.totalWaitTime - agentInfo.totalWrapUpOutTime -
														agentInfo.totalWrapUpInTime - agentInfo.totalHoldTime ); 
														//agentInfo.totalSingleTransfer - agentInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(agentInfo.totalLoginTime - agentInfo.totalNotReadyTime - 
														agentInfo.totalTalkTimeInbound - agentInfo.totalTalkTimeOutbound -
														agentInfo.totalWaitTime - agentInfo.totalWrapUpOutTime -
														agentInfo.totalWrapUpInTime - agentInfo.totalHoldTime - 
														agentInfo.totalSingleTransfer - agentInfo.totalTwoStepTranfer);
					
					
					out.write("<applet code='Manager.PieChart.PiechartApplet.class'  archive='../sAheevaChart.jar' width='650' height='320' mayscript name='graphApplet'>");
					// Start Up Parameters -->
					
				//out.write("<PARAM name='LOADINGMESSAGE' value='"+pageRepstatsData.getWord("graphloadingmessage")+"'>");					
				
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
				
				out.write("<PARAM name='legendtitle'   value='"+pageRepStData.getWord("calls") +"'>");
				
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
				out.write("<PARAM name='pie1label8' value=''>");
					
					
				out.write("<PARAM name='segment1'   value='115,152,164|"+ pageRepStData.getWord("inbound") +"'>");				
				
				out.write("<PARAM name='segment2'   value='99,99,156|"+ pageRepStData.getWord("outbound") +"'>");				
				
				out.write("<PARAM name='segment3'   value='185,53,8|"+ pageRepStData.getWord("wrapup") +"'>");
				
				out.write("<PARAM name='segment4'   value='239,214,115|"+ pageRepStData.getWord("hold") +"'>");
								
				out.write("<PARAM name='segment5'   value='100,100,60|"+ pageRepStData.getWord("waiting") +"'>");
												
				out.write("<PARAM name='segment6'   value='17,97,158|"+ pageRepStData.getWord("notready") +"'>");
								
				out.write("<PARAM name='segment7'   value='100,214,50|"+ pageRepStData.getWord("singletransfer") +"'>");
										
				out.write("<PARAM name='segment8'   value='180,0,230|"+ pageRepStData.getWord("twosteptransfer") +"'>");	
				
				out.write("<PARAM name='segment9'   value='228,115,64|"+ pageRepStData.getWord("Dialing") +"'>");	
				
				
				out.write("<PARAM name='data1series1' value=\""+totTalkTimeInbound_Percent+"\">");
				out.write("<PARAM name='data2series1' value=\""+totTalkTimeOutbound_Percent+"\">");
				out.write("<PARAM name='data3series1' value=\""+totWrapUp_Percent+"\">");
				out.write("<PARAM name='data4series1' value=\""+totHold_Percent+"\">");
				out.write("<PARAM name='data5series1' value=\""+totWaitTime_Percent+"\">");
				out.write("<PARAM name='data6series1' value=\""+totNotReadyTime_Percent+"\">");
				//out.write("<PARAM name='data7series1' value=\""+totSingleTransfert_Percent+"\">");
				//out.write("<PARAM name='data8series1' value=\""+totTwoStepTransfert_Percent+"\">");
				out.write("<PARAM name='data7series1' value=\""+totOther_Percent+"\">");
				out.write("<PARAM name='data8series1' value=\""+totOther_Percent+"\">");
				 
					
				out.write("</applet>");

					
					
					
					
					
					
      out.write("</td></tr></table></td></tr>\r\n");
      out.write("\t");
if(from.compareTo("agentReport") !=0){
      out.write("<tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr><tr><td  class=\"reportsID\" width=\"100%\" align=\"center\"><b>");
      out.print( pageRepStData.getWord("Other statistics"));
      out.write(" </b></td></tr>\t</table></td></tr>");
}else{
      out.write("<tr><td width=\"100%\" align=\"center\"><table ");
 if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}else { out.write ("width=70%"); out.write("align=center"); }
      out.write(" ><tr><td height=\"20\"></td></tr><tr><td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\"><b>");
      out.print( pageRepStData.getWord("Other statistics"));
      out.write(" \t\t</b></font></td></tr></table></td></tr>");
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
      out.print( pageRepStData.getWord("Sheduled time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t  ");

						out.write(agentInfo.getScheduled());
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepStData.getWord("Login"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
					
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t  <tr >\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"35%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");
      out.print( pageRepStData.getWord("Adherence"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"reportsTabValues\" width=\"20%\" style=\"border-style:solid; border-width:medium\">\r\n");
      out.write("\t\t\t\t\t");

						out.write(agentInfo.getAdherence());
					
      out.write("\t\r\n");
      out.write("\t\t\t\t\t</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\t\t\r\n");
 pageRepStData.closeConnection();
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");

						}
					}
				
      out.write("\r\n");
      out.write("\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\tsetupAllTabs();\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t");

		}
		
      out.write("</body>\r\n");
      out.write("\t\t</html>\r\n");
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
