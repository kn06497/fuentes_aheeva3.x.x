package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.reports.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.lang.*;
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
import aheevaManager.reports.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.lang.*;
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
import aheevaManager.reports.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.lang.*;
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

public final class callDetailsReports_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/jsp/callDetailsReportsDetails.jsp");
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
beanManagerData pageDrepData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDrepData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageDrepData.openConnection();
    
      out.write("\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Calling List Report Details</title>\n");
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
      out.write("\tbackground:\t\t#E1F4FF;\r\n");
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
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("\r\n");
      aheevaManager.reports.beanCallDetailsReport beanCall = null;
      synchronized (request) {
        beanCall = (aheevaManager.reports.beanCallDetailsReport) _jspx_page_context.getAttribute("beanCall", PageContext.REQUEST_SCOPE);
        if (beanCall == null){
          beanCall = new aheevaManager.reports.beanCallDetailsReport();
          _jspx_page_context.setAttribute("beanCall", beanCall, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"rep_body\">\r\n");

	String language =request.getParameter("lang");
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_year_yearly = request.getParameter("starting_year_yearly");
    String ending_year_yearly = request.getParameter("ending_year_yearly");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType  = request.getParameter("reportType");
    String call_lists  = request.getParameter("objects");
    String startingDate="", endingDate="", sRet ="";
	String[] tabObj =null;
	beanCallDetails r1 =null;
	
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

	StringTokenizer tok = null;
    if(call_lists != null){
        tok = new java.util.StringTokenizer(call_lists,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
	}

	String c_list ="";
System.out.println(" avant img print ");


      out.write("\r\n");
      out.write("<div class=\"img-control\">\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printCallDetailsReports.jsp?startingDateDaily=");
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
out.write(call_lists) ;
      out.write("&prec=");
 out.write(prec) ;
      out.write("&suiv=");
 out.write(suiv) ;
      out.write("&current=");
 out.write(current) ;
      out.write("&all_obj=");
 out.write(all_obj) ;
      out.write("&from=");
 out.write("callingListReport") ;
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
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"callDetailsReports.jsp?startingDateDaily=");
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
out.write(call_lists) ;
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
      out.print(pageDrepData.getWord("Previous"));
      out.write("</a>\t\t</td>\n");
      out.write("\t");

	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"callDetailsReports.jsp?startingDateDaily=");
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
out.write(call_lists) ;
      out.write("&prec=-1&suiv=1&current=0&all_obj=1&lang=");
 out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print(pageDrepData.getWord("All"));
      out.write("</a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	String nb_obj = Integer.toString(numObjects);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"callDetailsReports.jsp?startingDateDaily=");
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
out.write(call_lists) ;
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
      out.print(pageDrepData.getWord("Next"));
      out.write("</a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
System.out.println(" apres img print ");


      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\r\n");
      out.write("<form name=\"callDetailsReports\">\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t<fieldset>\r\n");

System.out.println("debut form");
if(all_obj.compareTo("0")==0) // un campaign
{
	System.out.println("debut form");
	c_list = tabObj[Integer.parseInt(current)];
		
	sRet =beanCall.buildCallDetailsReportForPeriod(c_list,startingDate,endingDate,reportType);
	if(sRet == "succes")
	{
		
      out.write("\r\n");
      out.write("\t\t");
      out.write('\r');
      out.write('\n');

boolean needOneMoreTotalRow = false;
boolean timeWritten = false;

//---------------------
	long tRecords= 0,tRemainingRecords=0,tCallbacks=0,tWrongNumber=0,tNotSatisfied=0,tCallbacksSched=0;
  	long sTRecords= 0, sTRemainingRecords= 0 ,sTCallbacks = 0,sTCallbacksSched = 0;
//---------------------

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
beanManagerData pageDrepdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDrepdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageDrepdData.openConnection();
    
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
      out.write("\t\t\t\t\t  <b>");
 out.write("["+c_list+"]"); 
      out.write(" </b>\r\n");
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
/*
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageDrepdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageDrepdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageDrepdData.getWord("Yearly"));
								}*/
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageDrepdData.getWord("Calling List Report Details"));
      out.write("&nbsp; \r\n");
      out.write("\t\t\t\t\t\t\t");
/*
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<script>document.write(MultiArray[\"To\"][lang])</script>\r\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}*/
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<!-- Remaining records -->\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							 pageDrepdData.getWord("Remaining records")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<table width=\"30%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t\t<tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Time zones"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Remaining records"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t");
 
				
				for( int i = 0;i < beanCall.m_vAllDetails.size(); i++ ) 
				{
					r1 = (beanCallDetails)beanCall.m_vAllDetails.elementAt(i);	
					tRemainingRecords += r1.NbRemainingRecords;						
	
      out.write(" \t\t\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\"> ");
out.write(r1.TimeZone);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbRemainingRecords));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
			   		
   				}// fin du for						

      out.write("\t\t\t\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tRemainingRecords));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t</tr>\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("<!-- Fin  -->\r\n");
      out.write("\t\r\n");
      out.write("\t\t\r\n");
      out.write("<!-- Scheduled callbacks -->\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
						 pageDrepdData.getWord("Scheduled callbacks")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<table width=\"30%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t\t<tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Time zones"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Scheduled callbacks"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t");
 
				// Remise a 0 et declaration
				needOneMoreTotalRow = false;
				sTCallbacksSched = 0;
				
				for( int i = 0;i < beanCall.m_vAllDetails.size(); i++ ) 
				{
					r1 = (beanCallDetails)beanCall.m_vAllDetails.elementAt(i);
				 
 					if(( r1.time.length() >10 || r1.otherMonthYear) && i > 0) 
					{						
			
	
      out.write("\r\n");
      out.write("\t\t\t\t<tr> \r\n");
      out.write("\t\t\t\t   <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <!-- <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
//out.write(" ");
      out.write(" </b></font></td>-->\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTCallbacksSched));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t </tr>\r\n");
      out.write("\r\n");
      out.write(" ");
						
				needOneMoreTotalRow = true;				
				sTCallbacksSched = 0;										
				
					}// fin du if							
					 
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t  <!--<td align=\"center\"> ");
//out.write(r1.time);
      out.write("</td>-->\r\n");
      out.write("\t\t\t\t\t\t  <td align=\"center\"> ");
out.write(r1.TimeZone);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbCallbacksSched));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");
				
					
				sTCallbacksSched  += r1.NbCallbacksSched;				
				tCallbacksSched += r1.NbCallbacksSched;				
				
		   		
   			}// fin du for	
				if(needOneMoreTotalRow == true) 
				{
					if(sTCallbacksSched!=0) 
					{

      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTCallbacksSched));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write(" ");

					}
				}// fin du if		

      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tCallbacksSched));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Fin  -->\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Completed callbacks-->\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							pageDrepdData.getWord("Completed callbacks")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<table width=\"45%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Time zones"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Total Records"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Callbacks"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			needOneMoreTotalRow = false;			
			sTRecords= 0;
			sTCallbacks = 0;
			tRecords= 0;
			tCallbacks = 0;
    		for( int i = 0;i < beanCall.m_vAllDetails.size(); i++ ) 
			{
				r1 = (beanCallDetails)beanCall.m_vAllDetails.elementAt(i);
				 
 				if(( r1.time.length() >10 || r1.otherMonthYear) && i > 0) 
				{			
			
      out.write("\r\n");
      out.write("\t\t\t<tr> \r\n");
      out.write("\t\t\t\t   <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTRecords));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTCallbacks));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write(" \t\t\t");

				needOneMoreTotalRow = true;
				
				//-----
				sTRecords= 0;
				sTCallbacks = 0;
				//------
				
				
			}// fin du if
		
      out.write("\r\n");
      out.write("\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t <!-- <td align=\"center\"> ");
//out.write(r1.time);
      out.write("</td>-->\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(r1.TimeZone);
      out.write("</td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.TotalRecords));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbCallbacks));
      out.write(" </td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t");

	   ///---------
		   	sTRecords += r1.TotalRecords;			
			sTCallbacks += r1.NbCallbacks;			
			tRecords += r1.TotalRecords;			
			tCallbacks += r1.NbCallbacks;
			
			///----------
		   
    }// fin du for
		if(needOneMoreTotalRow == true) 
		{
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTRecords));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTCallbacks));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write(" \t\t\t");

		}// fin du if
		

      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tRecords));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tCallbacks));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"40\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</tr>\r\n");
      out.write("<!-- Fin -->\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("</table>\r\n");
 pageDrepdData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t");
 
	}

}

else
{
	for(int obj =0; obj < numObjects; obj++ )
	{
		c_list = tabObj[obj];
		r1 = null;
 		sRet =beanCall.buildCallDetailsReportForPeriod(c_list,startingDate,endingDate,reportType);
		
		if(sRet == "succes")
		 {
			
      out.write("\r\n");
      out.write("\t\t\t");
      out.write('\r');
      out.write('\n');

boolean needOneMoreTotalRow = false;
boolean timeWritten = false;

//---------------------
	long tRecords= 0,tRemainingRecords=0,tCallbacks=0,tWrongNumber=0,tNotSatisfied=0,tCallbacksSched=0;
  	long sTRecords= 0, sTRemainingRecords= 0 ,sTCallbacks = 0,sTCallbacksSched = 0;
//---------------------

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
beanManagerData pageDrepdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDrepdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageDrepdData.openConnection();
    
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
      out.write("\t\t\t\t\t  <b>");
 out.write("["+c_list+"]"); 
      out.write(" </b>\r\n");
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
/*
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageDrepdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageDrepdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageDrepdData.getWord("Yearly"));
								}*/
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageDrepdData.getWord("Calling List Report Details"));
      out.write("&nbsp; \r\n");
      out.write("\t\t\t\t\t\t\t");
/*
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<script>document.write(MultiArray[\"To\"][lang])</script>\r\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}*/
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<!-- Remaining records -->\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							 pageDrepdData.getWord("Remaining records")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<table width=\"30%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t\t<tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Time zones"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Remaining records"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t");
 
				
				for( int i = 0;i < beanCall.m_vAllDetails.size(); i++ ) 
				{
					r1 = (beanCallDetails)beanCall.m_vAllDetails.elementAt(i);	
					tRemainingRecords += r1.NbRemainingRecords;						
	
      out.write(" \t\t\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\"> ");
out.write(r1.TimeZone);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbRemainingRecords));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
			   		
   				}// fin du for						

      out.write("\t\t\t\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tRemainingRecords));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t</tr>\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("<!-- Fin  -->\r\n");
      out.write("\t\r\n");
      out.write("\t\t\r\n");
      out.write("<!-- Scheduled callbacks -->\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
						 pageDrepdData.getWord("Scheduled callbacks")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<table width=\"30%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t\t<tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Time zones"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Scheduled callbacks"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t");
 
				// Remise a 0 et declaration
				needOneMoreTotalRow = false;
				sTCallbacksSched = 0;
				
				for( int i = 0;i < beanCall.m_vAllDetails.size(); i++ ) 
				{
					r1 = (beanCallDetails)beanCall.m_vAllDetails.elementAt(i);
				 
 					if(( r1.time.length() >10 || r1.otherMonthYear) && i > 0) 
					{						
			
	
      out.write("\r\n");
      out.write("\t\t\t\t<tr> \r\n");
      out.write("\t\t\t\t   <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <!-- <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
//out.write(" ");
      out.write(" </b></font></td>-->\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTCallbacksSched));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t </tr>\r\n");
      out.write("\r\n");
      out.write(" ");
						
				needOneMoreTotalRow = true;				
				sTCallbacksSched = 0;										
				
					}// fin du if							
					 
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t  <!--<td align=\"center\"> ");
//out.write(r1.time);
      out.write("</td>-->\r\n");
      out.write("\t\t\t\t\t\t  <td align=\"center\"> ");
out.write(r1.TimeZone);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbCallbacksSched));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");
				
					
				sTCallbacksSched  += r1.NbCallbacksSched;				
				tCallbacksSched += r1.NbCallbacksSched;				
				
		   		
   			}// fin du for	
				if(needOneMoreTotalRow == true) 
				{
					if(sTCallbacksSched!=0) 
					{

      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTCallbacksSched));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write(" ");

					}
				}// fin du if		

      out.write("\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tCallbacksSched));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Fin  -->\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Completed callbacks-->\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(
							pageDrepdData.getWord("Completed callbacks")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<table width=\"45%\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Time zones"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Total Records"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t  <td width=\"7%\" align=\"center\">");
      out.print( pageDrepdData.getWord("Callbacks"));
      out.write("</td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			needOneMoreTotalRow = false;			
			sTRecords= 0;
			sTCallbacks = 0;
			tRecords= 0;
			tCallbacks = 0;
    		for( int i = 0;i < beanCall.m_vAllDetails.size(); i++ ) 
			{
				r1 = (beanCallDetails)beanCall.m_vAllDetails.elementAt(i);
				 
 				if(( r1.time.length() >10 || r1.otherMonthYear) && i > 0) 
				{			
			
      out.write("\r\n");
      out.write("\t\t\t<tr> \r\n");
      out.write("\t\t\t\t   <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTRecords));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTCallbacks));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write(" \t\t\t");

				needOneMoreTotalRow = true;
				
				//-----
				sTRecords= 0;
				sTCallbacks = 0;
				//------
				
				
			}// fin du if
		
      out.write("\r\n");
      out.write("\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t <!-- <td align=\"center\"> ");
//out.write(r1.time);
      out.write("</td>-->\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(r1.TimeZone);
      out.write("</td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.TotalRecords));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbCallbacks));
      out.write(" </td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t");

	   ///---------
		   	sTRecords += r1.TotalRecords;			
			sTCallbacks += r1.NbCallbacks;			
			tRecords += r1.TotalRecords;			
			tCallbacks += r1.NbCallbacks;
			
			///----------
		   
    }// fin du for
		if(needOneMoreTotalRow == true) 
		{
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Sub total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTRecords));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(sTCallbacks));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write(" \t\t\t");

		}// fin du if
		

      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageDrepdData.getWord("Total"));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tRecords));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tCallbacks));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"40\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</tr>\r\n");
      out.write("<!-- Fin -->\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("</table>\r\n");
 pageDrepdData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t");

		}
	} //fin for
}

      out.write("\t\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 pageDrepData.closeConnection(); 
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
