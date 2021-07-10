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

public final class callingListReports_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/jsp/callingListReportsDetails.jsp");
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
beanManagerData pageCDrepData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCDrepData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageCDrepData.openConnection();
    
      out.write("\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Calling List Reports</title>\r\n");
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
      aheevaManager.reports.beanCallingListReport beanCallingList = null;
      synchronized (request) {
        beanCallingList = (aheevaManager.reports.beanCallingListReport) _jspx_page_context.getAttribute("beanCallingList", PageContext.REQUEST_SCOPE);
        if (beanCallingList == null){
          beanCallingList = new aheevaManager.reports.beanCallingListReport();
          _jspx_page_context.setAttribute("beanCallingList", beanCallingList, PageContext.REQUEST_SCOPE);
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
	beanCallingListDetails r1 =null;
	
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
      out.write("\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printCallingListReports.jsp?startingDateDaily=");
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
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"callingListReports.jsp?startingDateDaily=");
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
      out.print( pageCDrepData.getWord("Previous"));
      out.write("</a>\t\t</td>\n");
      out.write("\t");

	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"callingListReports.jsp?startingDateDaily=");
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
      out.print( pageCDrepData.getWord("All"));
      out.write("</a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	String nb_obj = Integer.toString(numObjects);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"callingListReports.jsp?startingDateDaily=");
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
      out.print( pageCDrepData.getWord("Next"));
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
      out.write("<form name=\"callingListReports\">\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t<fieldset>\r\n");

System.out.println("debut form");
if(all_obj.compareTo("0")==0) // un campaign
{
	System.out.println("debut form");
	c_list = tabObj[Integer.parseInt(current)];
 	sRet=beanCallingList.buildCallingListReportForPeriod(c_list,startingDate,endingDate,reportType);
 	if(sRet == "succes")
	{
		
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
      out.write("\r\n");

////open connection to database///////
beanManagerData pageCDrepdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCDrepdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageCDrepdData.openConnection();
    

boolean needOneMoreTotalRow = false;
    long tNbDials=0,tNbAnswered=0,tNbNoAnswer=0,tNbAbandoned=0,
         tNbAnswerMachine=0,tNbSit=0,tNbBusy=0,tNbFax=0,NbDials=0,
		 NbAnswered=0,NbNoAnswer=0,NbAbandoned=0,NbAnswerMachine=0,
		 NbSit=0,NbBusy=0,NbFax=0;

	long  ssTotNbDials =0 , ssTotNbAnswered =0 , ssTotNbNoAnswer =0,  ssTotNbAbandoned =0,
			   ssTotNbAnswerMachine =0, ssTotNbSit =0, ssTotNbBusy =0, ssTotNbFax =0;/* ssTotNbDials=0,
		 ssTotNbAnswered=0,ssTotNbNoAnswer=0,ssTotNbAbandoned=0,ssTotNbAnswerMachine=0,
		 ssTotNbSit=0,ssTotNbBusy=0,ssTotNbFax=0;*/

    double tHitRate=0; String thRate="0.00";
	String hit = "";
	int ptIndex = 0;

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

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageCDrepdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageCDrepdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageCDrepdData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageCDrepdData.getWord("Calling List Reports"));
      out.write("&nbsp; ");
      out.print( pageCDrepdData.getWord("for"));
      out.write(" <br><br>\n");
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
      out.print( pageCDrepdData.getWord("To"));
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
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t  <td width=\"15%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Time"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("HitRate"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Dials"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Answered"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("No answer"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Abandoned"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"11%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Answer machine"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"8%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("SIT"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"8%\"  align=\"center\">");
      out.print( pageCDrepdData.getWord("Busy"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"8%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Fax"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

    		for( int i = 0;i < beanCallingList.m_vAllDetails.size(); i++ ) 
			{
				r1 = (beanCallingListDetails)beanCallingList.m_vAllDetails.elementAt(i);
				String hitr = Double.toString(r1.HitRate);
				int index = hitr.indexOf(".");
				if(hitr.substring(index+1).length()>2)
				   hitr = hitr.substring(0,index+1)+ hitr.substring(index+1,index+3);
				   
 			if(( r1.time.length() >10 || r1.otherMonthYear) && i > 0) {
				if (ssTotNbDials > 0){
					tHitRate = (double)((double)ssTotNbAnswered /(double)ssTotNbDials)*100;
					hit = Double.toString(tHitRate);
					ptIndex = hit.indexOf(".");
					if(hit.substring(ptIndex+1).length()>2)
					  hit = hit.substring(0,ptIndex+1)+ hit.substring(ptIndex+1,ptIndex+3);
					thRate = new String(hit);
				}
			
			
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(thRate);
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbDials));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAnswered));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbNoAnswer));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAbandoned));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAnswerMachine));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbSit));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbBusy));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbFax));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write(" \t\t\t");

			   ssTotNbDials =0;
			   ssTotNbAnswered =0;
			   ssTotNbNoAnswer =0;
			   ssTotNbAbandoned =0;
			   ssTotNbAnswerMachine =0;
			   ssTotNbSit =0;
			   ssTotNbBusy =0;
			   ssTotNbFax =0;
			   tHitRate=0;
			   thRate="";
			   ptIndex=0;
			   hit = "";
				needOneMoreTotalRow = true;
			}
		
      out.write("\r\n");
      out.write("\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(r1.time);
      out.write("</td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(hitr);
      out.write("</td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbDials));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbAnswered));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbNoAnswer));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbAbandoned));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbAnswerMachine));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbSit));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbBusy));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbFax));
      out.write(" </td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<!-- end of array traversal-->\r\n");
      out.write("\t\t");

	
		   tNbDials +=r1.NbDials;
		   tNbAnswered +=r1.NbAnswered;
		   tNbNoAnswer +=r1.NbNoAnswer;
		   tNbAbandoned += r1.NbAbandoned;
		   tNbAnswerMachine +=r1.NbAnswerMachine;
		   tNbSit += r1.NbSit;
		   tNbBusy += r1.NbBusy;
		   tNbFax += r1.NbFax;
		   
		   ssTotNbDials +=r1.NbDials;
		   ssTotNbAnswered +=r1.NbAnswered;
		   ssTotNbNoAnswer +=r1.NbNoAnswer;
		   ssTotNbAbandoned += r1.NbAbandoned;
		   ssTotNbAnswerMachine +=r1.NbAnswerMachine;
		   ssTotNbSit += r1.NbSit;
		   ssTotNbBusy += r1.NbBusy;
		   ssTotNbFax += r1.NbFax;
		   
    }
		if(needOneMoreTotalRow == true) {
			if (ssTotNbDials > 0){
				tHitRate = (double)((double)ssTotNbAnswered /(double)ssTotNbDials)*100;
				hit = Double.toString(tHitRate);
				ptIndex = hit.indexOf(".");
				if(hit.substring(ptIndex+1).length()>2)
				  hit = hit.substring(0,ptIndex+1)+ hit.substring(ptIndex+1,ptIndex+3);
				thRate = new String(hit);
			}
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(thRate);
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbDials));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAnswered));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbNoAnswer));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAbandoned));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAnswerMachine));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbSit));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbBusy));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbFax));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write(" \t\t\t");

		}
	   tHitRate=0;
	   thRate="0.00";
	   ptIndex=0;
	   hit = "";
    if (tNbDials > 0){
        tHitRate = (double)((double)tNbAnswered /(double)tNbDials)*100;
        hit = Double.toString(tHitRate);
        ptIndex = hit.indexOf(".");
        if(hit.substring(ptIndex+1).length()>2)
          hit = hit.substring(0,ptIndex+1)+ hit.substring(ptIndex+1,ptIndex+3);
        thRate = new String(hit);
		
    }

      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageCDrepdData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(thRate);
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbDials));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbAnswered));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbNoAnswer));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbAbandoned));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbAnswerMachine));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbSit));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbBusy));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbFax));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
 pageCDrepdData.closeConnection(); 
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
 		sRet=beanCallingList.buildCallingListReportForPeriod(c_list,startingDate,endingDate,reportType);
		if(sRet == "succes")
		 {
			
      out.write("\r\n");
      out.write("\t\t\t");
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
beanManagerData pageCDrepdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCDrepdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageCDrepdData.openConnection();
    

boolean needOneMoreTotalRow = false;
    long tNbDials=0,tNbAnswered=0,tNbNoAnswer=0,tNbAbandoned=0,
         tNbAnswerMachine=0,tNbSit=0,tNbBusy=0,tNbFax=0,NbDials=0,
		 NbAnswered=0,NbNoAnswer=0,NbAbandoned=0,NbAnswerMachine=0,
		 NbSit=0,NbBusy=0,NbFax=0;

	long  ssTotNbDials =0 , ssTotNbAnswered =0 , ssTotNbNoAnswer =0,  ssTotNbAbandoned =0,
			   ssTotNbAnswerMachine =0, ssTotNbSit =0, ssTotNbBusy =0, ssTotNbFax =0;/* ssTotNbDials=0,
		 ssTotNbAnswered=0,ssTotNbNoAnswer=0,ssTotNbAbandoned=0,ssTotNbAnswerMachine=0,
		 ssTotNbSit=0,ssTotNbBusy=0,ssTotNbFax=0;*/

    double tHitRate=0; String thRate="0.00";
	String hit = "";
	int ptIndex = 0;

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

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageCDrepdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageCDrepdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageCDrepdData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageCDrepdData.getWord("Calling List Reports"));
      out.write("&nbsp; ");
      out.print( pageCDrepdData.getWord("for"));
      out.write(" <br><br>\n");
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
      out.print( pageCDrepdData.getWord("To"));
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
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\">\r\n");
      out.write("\t\t\t\t  <td width=\"15%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Time"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("HitRate"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Dials"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Answered"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("No answer"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Abandoned"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"11%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Answer machine"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"8%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("SIT"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"8%\"  align=\"center\">");
      out.print( pageCDrepdData.getWord("Busy"));
      out.write("</td>\n");
      out.write("\t\t\t\t  <td width=\"8%\" align=\"center\">");
      out.print( pageCDrepdData.getWord("Fax"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

    		for( int i = 0;i < beanCallingList.m_vAllDetails.size(); i++ ) 
			{
				r1 = (beanCallingListDetails)beanCallingList.m_vAllDetails.elementAt(i);
				String hitr = Double.toString(r1.HitRate);
				int index = hitr.indexOf(".");
				if(hitr.substring(index+1).length()>2)
				   hitr = hitr.substring(0,index+1)+ hitr.substring(index+1,index+3);
				   
 			if(( r1.time.length() >10 || r1.otherMonthYear) && i > 0) {
				if (ssTotNbDials > 0){
					tHitRate = (double)((double)ssTotNbAnswered /(double)ssTotNbDials)*100;
					hit = Double.toString(tHitRate);
					ptIndex = hit.indexOf(".");
					if(hit.substring(ptIndex+1).length()>2)
					  hit = hit.substring(0,ptIndex+1)+ hit.substring(ptIndex+1,ptIndex+3);
					thRate = new String(hit);
				}
			
			
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(thRate);
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbDials));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAnswered));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbNoAnswer));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAbandoned));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAnswerMachine));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbSit));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbBusy));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbFax));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write(" \t\t\t");

			   ssTotNbDials =0;
			   ssTotNbAnswered =0;
			   ssTotNbNoAnswer =0;
			   ssTotNbAbandoned =0;
			   ssTotNbAnswerMachine =0;
			   ssTotNbSit =0;
			   ssTotNbBusy =0;
			   ssTotNbFax =0;
			   tHitRate=0;
			   thRate="";
			   ptIndex=0;
			   hit = "";
				needOneMoreTotalRow = true;
			}
		
      out.write("\r\n");
      out.write("\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(r1.time);
      out.write("</td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(hitr);
      out.write("</td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbDials));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbAnswered));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbNoAnswer));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbAbandoned));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbAnswerMachine));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbSit));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbBusy));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td align=\"center\"> ");
out.write(Long.toString(r1.NbFax));
      out.write(" </td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<!-- end of array traversal-->\r\n");
      out.write("\t\t");

	
		   tNbDials +=r1.NbDials;
		   tNbAnswered +=r1.NbAnswered;
		   tNbNoAnswer +=r1.NbNoAnswer;
		   tNbAbandoned += r1.NbAbandoned;
		   tNbAnswerMachine +=r1.NbAnswerMachine;
		   tNbSit += r1.NbSit;
		   tNbBusy += r1.NbBusy;
		   tNbFax += r1.NbFax;
		   
		   ssTotNbDials +=r1.NbDials;
		   ssTotNbAnswered +=r1.NbAnswered;
		   ssTotNbNoAnswer +=r1.NbNoAnswer;
		   ssTotNbAbandoned += r1.NbAbandoned;
		   ssTotNbAnswerMachine +=r1.NbAnswerMachine;
		   ssTotNbSit += r1.NbSit;
		   ssTotNbBusy += r1.NbBusy;
		   ssTotNbFax += r1.NbFax;
		   
    }
		if(needOneMoreTotalRow == true) {
			if (ssTotNbDials > 0){
				tHitRate = (double)((double)ssTotNbAnswered /(double)ssTotNbDials)*100;
				hit = Double.toString(tHitRate);
				ptIndex = hit.indexOf(".");
				if(hit.substring(ptIndex+1).length()>2)
				  hit = hit.substring(0,ptIndex+1)+ hit.substring(ptIndex+1,ptIndex+3);
				thRate = new String(hit);
			}
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(thRate);
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbDials));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAnswered));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbNoAnswer));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAbandoned));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbAnswerMachine));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbSit));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbBusy));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(ssTotNbFax));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write(" \t\t\t");

		}
	   tHitRate=0;
	   thRate="0.00";
	   ptIndex=0;
	   hit = "";
    if (tNbDials > 0){
        tHitRate = (double)((double)tNbAnswered /(double)tNbDials)*100;
        hit = Double.toString(tHitRate);
        ptIndex = hit.indexOf(".");
        if(hit.substring(ptIndex+1).length()>2)
          hit = hit.substring(0,ptIndex+1)+ hit.substring(ptIndex+1,ptIndex+3);
        thRate = new String(hit);
		
    }

      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
      out.print( pageCDrepdData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(thRate);
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbDials));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbAnswered));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbNoAnswer));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbAbandoned));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbAnswerMachine));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbSit));
      out.write("</b> </font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbBusy));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"> <b>");
out.write(Long.toString(tNbFax));
      out.write(" </b></font></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
 pageCDrepdData.closeConnection(); 
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
 pageCDrepData.closeConnection(); 
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
