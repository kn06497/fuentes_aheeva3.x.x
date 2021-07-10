package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import aheevaManager.reports.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;

public final class queueReports_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/aheevaManager/jsp/queueReportsDetails.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/queueReportsPercent.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/queueReportsStat.jsp");
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

////open connection to database///////
beanManagerData pageQuRData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageQuRData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageQuRData.openConnection();

      out.write("\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Queue Reports</title>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/style_2.css\" />\r\n");
      out.write("\r\n");
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
      out.write("</script>\r\n");
      out.write("\r\n");
      aheevaManager.reports.beanQueueReport beanQueue = null;
      synchronized (request) {
        beanQueue = (aheevaManager.reports.beanQueueReport) _jspx_page_context.getAttribute("beanQueue", PageContext.REQUEST_SCOPE);
        if (beanQueue == null){
          beanQueue = new aheevaManager.reports.beanQueueReport();
          _jspx_page_context.setAttribute("beanQueue", beanQueue, PageContext.REQUEST_SCOPE);
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
    String reportType   = request.getParameter("reportType");
    String queues       = request.getParameter("objects");
	String[] tabObj =null;
    StringTokenizer tok = null;
    beanQueueDetails queueInfo = null;
	String from ="";
	//table for sevice level agreement (variable in  sec). to change by customer variables 
	int maxChoice =10;
	int[] tabAnswered =null;
	int[] tabAband =null;
	 
	if(queues != null){
        tok = new java.util.StringTokenizer(queues,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
	
	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
	}
	String queue ="";
	
	String startingDate="", endingDate="", sret="";

    if (reportType.compareTo("Daily") ==0)
	{
		startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
		endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    } 
	else 
	{
		if (reportType.compareTo("Monthly") ==0)
		{
			startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
			endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;
    	} 
		else 
			if (reportType.compareTo("Yearly") ==0)
			{
				startingDate=starting_year_yearly + "-01-01" + " 00:00:00" ;
				endingDate=ending_year_yearly + "-12-31"+ " 23:59:59" ;
    		}
	}
	

      out.write("\r\n");
      out.write("<div class=\"img-control\">\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" >\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<form>\r\n");
      out.write("\t\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printQueueReport.jsp?startingDateDaily=");
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
out.write(queues) ;
      out.write("&prec=");
 out.write(prec) ;
      out.write("&suiv=");
 out.write(suiv) ;
      out.write("&current=");
 out.write(current) ;
      out.write("&all_obj=");
 out.write(all_obj) ;
      out.write("&from=");
 out.write("queueReport") ;
      out.write("&lang=");
 out.write(language); 
      out.write("')\"><img src=\"../img/printer.gif\" border=\"0\"></button>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"queueReports.jsp?startingDateDaily=");
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
out.write(queues) ;
      out.write("&prec=");
 out.write(new_prec) ;
      out.write("&suiv=");
 out.write(current) ;
      out.write("&current=");
 out.write(prec) ;
      out.write("&all_obj=0&lang=");
 out.write(language); 
      out.write("\" ><b>");
      out.print( pageQuRData.getWord("Previous"));
      out.write("</b></a>\t\t</td>\n");
      out.write("\t");

	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"queueReports.jsp?startingDateDaily=");
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
out.write(queues) ;
      out.write("&prec=-1&suiv=1&current=0&all_obj=1&lang=");
 out.write(language); 
      out.write("\" ><b>");
      out.print( pageQuRData.getWord("All"));
      out.write("</b></a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	String nb_obj = Integer.toString(numObjects);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"queueReports.jsp?startingDateDaily=");
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
out.write(queues) ;
      out.write("&prec=");
 out.write(current) ;
      out.write("&suiv=");
 out.write(new_suiv) ;
      out.write("&current=");
 out.write(suiv) ;
      out.write("&all_obj=0&lang=");
 out.write(language); 
      out.write("\" ><b>");
      out.print( pageQuRData.getWord("Next"));
      out.write("</b></a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");

if(all_obj.compareTo("0")==0) // un queue
{
	queue =tabObj[Integer.parseInt(current)];
	System.out.println("Queue: " + queue);
	sret = beanQueue.buildQueueReportForPeriod(queue,startingDate,endingDate,reportType);
	//verify if the 10 values for service level are specified for that queue
	tabAnswered = beanQueue.getSVL_AnsweredForQueue(queue);
	if( tabAnswered == null) //no specification for that queue
	{
		tabAnswered =new  int[maxChoice];
		tabAnswered[0] =10; tabAnswered[5] =60;
		tabAnswered[1] =20; tabAnswered[6] =90;
		tabAnswered[2] =30; tabAnswered[7] =120;
		tabAnswered[3] =40; tabAnswered[8] =150;
		tabAnswered[4] =50; tabAnswered[9] =180;
	}
	tabAband = beanQueue.getSVL_AbandForQueue(queue);
	if(tabAband == null) //no specification for that queue
	{
		tabAband =new  int[maxChoice];
		tabAband[0] =10; tabAband[5] =60;
		tabAband[1] =20; tabAband[6] =90;
		tabAband[2] =30; tabAband[7] =120;
		tabAband[3] =40; tabAband[8] =150;
		tabAband[4] =50; tabAband[9] =180;
	}
	beanQueue.buildAnsweredLevelForPeriod(queue,startingDate,endingDate,reportType,tabAnswered);
	beanQueue.buildAbandonnedLevelForPeriod(queue,startingDate,endingDate,reportType,tabAband);
	
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\r\n");
      out.write("<form name=\"queueReports\">\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageQuRData.getWord("General data"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage1\" ) );  \t\t\t \t\t\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			if(sret == "success")
			 {
				
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write('\r');
      out.write('\n');

////open connection to database///////
beanManagerData pageQuRdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageQuRdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageQuRdData.openConnection();

      out.write('\n');

	//String percent ="";
	long NbEntered_det     = 0 , ssTotNbEntered_det = 0, totNbEntered_det = 0 ;
    long NbAnswered_det  = 0 , ssTotNbAnswered_det = 0, totNbAnswered_det = 0 ;
    long NbAbandonned_det  = 0, ssTotNbAbandonned_det = 0, totNbAbandonned_det = 0 ;
	long NbAbandonTimeOut_det = 0, ssTotNbAbandonTimeOut_det = 0, totNbAbandonTimeOut_det = 0 ;
	long NbAbandonNoAgt_det = 0, ssTotNbAbandonNoAgt_det = 0, totNbAbandonNoAgt_det = 0;

   //double ServiceFactor = 0.0;
    queueInfo=null;
    boolean needOneMoreTotalRow_det = false;
	

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"80%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>");
 out.write(""+queue+""); 
      out.write("</b>\r\n");
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

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageQuRdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageQuRdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageQuRdData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageQuRdData.getWord("Queue Reports"));
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
      out.write("\t\t\t\t\t\t");
      out.print( pageQuRdData.getWord("To"));
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
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								//out.write("Count");
								NbEntered_det     = 0 ; ssTotNbEntered_det = 0; totNbEntered_det = 0 ;
								NbAnswered_det  = 0 ; ssTotNbAnswered_det = 0; totNbAnswered_det = 0 ;
								NbAbandonned_det  = 0; ssTotNbAbandonned_det = 0; totNbAbandonned_det = 0 ;
								NbAbandonTimeOut_det = 0; ssTotNbAbandonTimeOut_det = 0; totNbAbandonTimeOut_det = 0 ;
								NbAbandonNoAgt_det = 0; ssTotNbAbandonNoAgt_det = 0; totNbAbandonNoAgt_det = 0;
								
							
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
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" height=\"15\">\r\n");
      out.write("\t\t\t\t<td width=\"25%\" align=\"center\"> ");
      out.print( pageQuRdData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Entered"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Answered"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Abandoned"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Abandoned - time out"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Abandoned - no agent"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanQueue.m_vAllDetails.size(); i++) 
			{
				 queueInfo = (beanQueueDetails)beanQueue.m_vAllDetails.elementAt(i);
				 System.out.println("queueInfo.time.: " + queueInfo.time);
				
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write("  height=\"15\">\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(queueInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbEntered));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbDistributed));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbAbandonned));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbAbandonTimeOut));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbAbandonNoAgt));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t\t");


				ssTotNbEntered_det +=queueInfo.NbEntered;
				totNbEntered_det +=queueInfo.NbEntered;
				ssTotNbAnswered_det +=queueInfo.NbDistributed;
				totNbAnswered_det +=queueInfo.NbDistributed;
				ssTotNbAbandonned_det +=queueInfo.NbAbandonned;
				totNbAbandonned_det +=queueInfo.NbAbandonned;
				ssTotNbAbandonTimeOut_det +=queueInfo.NbAbandonTimeOut;
				totNbAbandonTimeOut_det +=queueInfo.NbAbandonTimeOut;
				ssTotNbAbandonNoAgt_det +=queueInfo.NbAbandonNoAgt;
				totNbAbandonNoAgt_det +=queueInfo.NbAbandonNoAgt;
				
			} //fin for
			if(needOneMoreTotalRow_det)
			{System.out.println("if needOneMoreTotalRow_det");
			
      out.write("\r\n");
      out.write("\t\t\t\t\t <tr  height=\"15\">\r\n");
      out.write("\t\t\t\t\t\t <td width=\"25%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageQuRdData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbEntered_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbAnswered_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbAbandonned_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbAbandonTimeOut_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbAbandonNoAgt_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");

			}
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr  height=\"15\">\r\n");
      out.write("\t\t\t\t <td width=\"25%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageQuRdData.getWord("Total"));
      out.write("</b></font></td>\t\t\t \n");
      out.write("\t\t\t\t <td width=\"15%\"bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbEntered_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbAnswered_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbAbandonned_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbAbandonTimeOut_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbAbandonNoAgt_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("</table>\r\n");
 pageQuRdData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t");

			 }
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage2\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageQuRData.getWord("Percentages"));
      out.write("</h2>\t\t\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage2\" ) );\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			if(sret == "success")
			 {
				
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write('\r');
      out.write('\n');

////open connection to database///////
beanManagerData pageQuRsData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageQuRsData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageQuRsData.openConnection();

      out.write('\r');
      out.write('\n');

	String percent ="";
	long NbEntered     = 0 , ssTotNbEntered = 0, totNbEntered = 0 ;
    long NbAnswered  = 0 , ssTotNbAnswered = 0, totNbAnswered = 0 ;
    long NbAbandonned  = 0, ssTotNbAbandonned = 0, totNbAbandonned = 0 ;
	long NbAbandonTimeOut = 0, ssTotNbAbandonTimeOut = 0, totNbAbandonTimeOut = 0 ;
	long NbAbandonNoAgt = 0, ssTotNbAbandonNoAgt = 0, totNbAbandonNoAgt = 0;

	String percentNbAnswered = "" , tot_percentNbAnswered = "";
	String percentNbAbandonned = "" , tot_percentNbAbandonned = "";
    String ServiceFactor = "", tot_ServiceFactor = "";

    long NAnswTh1 = 0,  ssTotNAnswTh1 =0, totNAnswTh1 =0;
	long NAbandTh2=0 ,  ssTotNAbandTh2 =0, totNAbandTh2 =0;
   //double ServiceFactor = 0.0;
   queueInfo = null;
   boolean needOneMoreTotalRow = false;
   
   //variable changeables compte tenu des tranches importantes pour le client
   /*
   int nbTranchesAnsw =10;
   String typeTranchesAnsw[] =new String[nbTranchesAnsw];
	for (int w =0; w < nbTranchesAnsw; w++)
	{
		typeTranchesAnsw[w] =;
	}
   int nbTranchesAband =10;
   String typeTranchesAband[] =new String[nbTranchesAband];
   */
   
	

      out.write("\r\n");
      out.write("<table width=\"80%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");

	if(from.compareTo("queueReport") != 0)
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
      out.write("\t\t\t\t\t  <b>");
 out.write(""+queue+""); 
      out.write("</b>\r\n");
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

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0)
								  out.write(pageQuRsData.getWord("Daily"));
							else if (reportType.compareTo("Monthly")==0) 
								out.write(pageQuRsData.getWord("Monthly"));						
							else if (reportType.compareTo("Yearly")==0) 
								out.write(pageQuRsData.getWord("Yearly"));
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageQuRsData.getWord("Percentages for queue"));
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
      out.print( pageQuRsData.getWord("To"));
      out.write(" \n");
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
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	}
	 
      out.write("\r\n");
      out.write("\t <!--\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageQuRsData.getWord("Percentages"));
								NbEntered     = 0 ; ssTotNbEntered = 0; totNbEntered = 0 ;
								NbAnswered  = 0 ; ssTotNbAnswered = 0; totNbAnswered = 0 ;
								NbAbandonned  = 0; ssTotNbAbandonned = 0; totNbAbandonned = 0 ;
								NbAbandonTimeOut = 0; ssTotNbAbandonTimeOut = 0; totNbAbandonTimeOut = 0 ;
								NbAbandonNoAgt = 0; ssTotNbAbandonNoAgt = 0; totNbAbandonNoAgt = 0;
								needOneMoreTotalRow =false;
								
							
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t-->\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageQuRsData.getWord("Percentages"));
								NbEntered     = 0 ; ssTotNbEntered = 0; totNbEntered = 0 ;
								NbAnswered  = 0 ; ssTotNbAnswered = 0; totNbAnswered = 0 ;
								NbAbandonned  = 0; ssTotNbAbandonned = 0; totNbAbandonned = 0 ;
								NbAbandonTimeOut = 0; ssTotNbAbandonTimeOut = 0; totNbAbandonTimeOut = 0 ;
								NbAbandonNoAgt = 0; ssTotNbAbandonNoAgt = 0; totNbAbandonNoAgt = 0;
								needOneMoreTotalRow =false;
								
							
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"7\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" height=\"20\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\" >");
      out.print( pageQuRsData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Answered"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Abandoned"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Answered service factor"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanQueue.m_vAllDetails.size(); i++) {
				 queueInfo = (beanQueueDetails)beanQueue.m_vAllDetails.elementAt(i);
				if(( queueInfo.time.length() >10 || queueInfo.otherMonthYear) && i > 0) {
					if((ssTotNbEntered) !=0) {
						percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)((ssTotNbAnswered)*100)/ssTotNbEntered), 2);
						percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)((ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt)*100)/ssTotNbEntered), 2);
					}else{
						percentNbAnswered = "0.00";
						percentNbAbandonned = "0.00";
					}
          			if (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 > 0) {
						ServiceFactor = queueInfo.formatDecimalDouble(( (double) ssTotNAnswTh1 /(double) (ssTotNbAnswered + (ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt) - ssTotNAbandTh2 )) *100 ,2);						
					}else
						ServiceFactor = "0.00";
					
					
      out.write("\r\n");
      out.write("\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t");

					ssTotNbEntered =0;
					ssTotNbAnswered =0;
					ssTotNbAbandonned=0;
					ssTotNbAbandonTimeOut=0;
					ssTotNbAbandonNoAgt=0;
					ssTotNAnswTh1 =0;
					ssTotNAbandTh2 =0;
					percentNbAnswered ="";
					percentNbAbandonned ="";
					ServiceFactor = "";
					needOneMoreTotalRow = true;
				} // fin if agentInfo.time.length() >10
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(">\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" >");
out.write(queueInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"5%\"  align=\"center\"  style=\" border-right:none\">");
out.write(queueInfo.getPercentNbDistributed());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"15%\"  align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t");

						if(queueInfo.getPercentNbDistributed().compareTo("0.00%") !=0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(queueInfo.getPercentNbDistributed()); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"10%\" ");
 if(i%2 == 0) out.write("class=reportsRowPair");
												else out.write("class=reportsRowUnPair");
      out.write("></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t <td width=\"5%\"  align=\"center\"  style=\" border-right:none\">");
out.write(queueInfo.getPercentNbAbandonned());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"15%\"  align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t");

						if(queueInfo.getPercentNbAbandonned().compareTo("0.00%") !=0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(queueInfo.getPercentNbAbandonned()); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("<td width=\"10%\" ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write("></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t\t <td width=\"5%\"  align=\"center\"  style=\" border-right:none\">");
out.write(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2)+"%");
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"15%\"  align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t");

						if(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2).compareTo("0.00") !=0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2)+"%"); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("<td width=\"10%\" ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write("></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t\t");


				ssTotNbEntered +=queueInfo.NbEntered;
				totNbEntered +=queueInfo.NbEntered;
				ssTotNbAnswered +=queueInfo.NbDistributed;
				totNbAnswered +=queueInfo.NbDistributed;
				ssTotNbAbandonned +=queueInfo.NbAbandonned;
				totNbAbandonned +=queueInfo.NbAbandonned;
				ssTotNbAbandonTimeOut +=queueInfo.NbAbandonTimeOut;
				totNbAbandonTimeOut +=queueInfo.NbAbandonTimeOut;
				ssTotNbAbandonNoAgt +=queueInfo.NbAbandonNoAgt;
				totNbAbandonNoAgt +=queueInfo.NbAbandonNoAgt;
				ssTotNAnswTh1 +=queueInfo.nAnswTh1;
				totNAnswTh1 +=queueInfo.nAnswTh1;
				ssTotNAbandTh2 +=queueInfo.nAbandTh2;
				totNAbandTh2 +=queueInfo.nAbandTh2;
				
			} //fin for
			if(needOneMoreTotalRow){
				if((ssTotNbEntered) !=0) {
					percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)(ssTotNbAnswered*100)/ssTotNbEntered), 2);
					percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)((ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt)*100)/ssTotNbEntered), 2);
				}else{
					percentNbAnswered = "0.00";
					percentNbAbandonned = "0.00";
				}
				if (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 > 0) {
					ServiceFactor = queueInfo.formatDecimalDouble(( (double) ssTotNAnswTh1 /(double) (ssTotNbAnswered + (ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt) - ssTotNAbandTh2 )) *100 ,2);						
					}else
					ServiceFactor = "0.00";
				
				
      out.write("\r\n");
      out.write("\t\t\t\t\t \r\n");
      out.write("\t\t\t");

			}
			
			if((totNbEntered) !=0) {
				tot_percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)(totNbAnswered*100)/totNbEntered), 2);
				tot_percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)((totNbAbandonned+totNbAbandonTimeOut+totNbAbandonNoAgt)*100)/totNbEntered), 2);
				}else{
				tot_percentNbAnswered = "0.00";
				tot_percentNbAbandonned = "0.00";
			}
			if (totNbAnswered + totNbAbandonned - totNAbandTh2 > 0) {
				tot_ServiceFactor = queueInfo.formatDecimalDouble(( (double) totNAnswTh1 /(double) (totNbAnswered + (totNbAbandonned+totNbAbandonTimeOut+totNbAbandonNoAgt) - totNAbandTh2 )) *100 ,2);						
				}else
				tot_ServiceFactor = "0.00";
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\"  bgcolor=\"#FFECF5\" align=\"center\" ><font  color=\"#000000\"><b>");
      out.print( pageQuRsData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\"  bgcolor=\"#FFECF5\" align=\"center\"  style=\" border-right:none\"><font  color=\"#000000\"><b>");
out.write(tot_percentNbAnswered+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\"  bgcolor=\"#FFECF5\" align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t ");

						 	if(tot_percentNbAnswered.compareTo("0.00") !=0 ){
						 
      out.write("\r\n");
      out.write("\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(tot_percentNbAnswered+"%"); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"10%\" style=\"background-color:#FFECF5\"></td>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t");

					}
					
      out.write("\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\"  bgcolor=\"#FFECF5\" align=\"center\"  style=\" border-right:none\"><font  color=\"#000000\"><b>");
out.write(tot_percentNbAbandonned+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\"  bgcolor=\"#FFECF5\" align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t ");

						 	if(tot_percentNbAbandonned.compareTo("0.00") !=0 ){
						 
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write((totNbAbandonned+totNbAbandonTimeOut+totNbAbandonNoAgt)+"%"); 
      out.write("\" height=\"7\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"10%\" style=\"background-color:#FFECF5\"></td>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t");

					}
					
      out.write("\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\"  bgcolor=\"#FFECF5\" align=\"center\"  style=\" border-right:none\"><font  color=\"#000000\"><b>");
out.write(tot_ServiceFactor+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\"  bgcolor=\"#FFECF5\" align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t ");

						 	if(tot_ServiceFactor.compareTo("0.00") !=0 ){
						 
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(tot_ServiceFactor+"%"); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"10%\" style=\"background-color:#FFECF5\"></td>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t");

					}
					
      out.write("\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( pageQuRsData.getWord("Service level")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"7\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\" class=\"reportsID\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageQuRsData.getWord("Answered calls")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"7\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" height=\"20\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" >");
      out.print( pageQuRsData.getWord("Answered"));
      out.write(" </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\" > ");
      out.print( pageQuRsData.getWord("Answered count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Percentages"));
      out.write("</td>\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			long nbqueue =(long)beanQueue.nbQueue;
			long nbEvent =0;
			String carac="";
			percent="";
			for (int i = 0; i < beanQueue.m_AnsweredSL.size(); i++){
				if(i < beanQueue.m_AnsweredSL.size() - 1){
					carac =Integer.toString(tabAnswered[i]);
				}
				beanQueueReport.SLdata tmpSLdata = (beanQueueReport.SLdata)beanQueue.m_AnsweredSL.elementAt(i);
				nbEvent = tmpSLdata.eventCount;
				percent =  tmpSLdata.percent;
			
      out.write("\r\n");
      out.write("\t\t\t\t<tr class=\"reportsQueueRow\">\r\n");
      out.write("\t\t\t\t\t");
 if(i < beanQueue.m_AnsweredSL.size() - 1){  
      out.write("\r\n");
      out.write("\t\t\t\t\t \t<td width=\"20%\"  align=\"center\" >");
out.write(pageQuRsData.getWord("Within") + carac +pageQuRsData.getWord("seconds"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t ");
 }else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t \t<td width=\"20%\"  align=\"center\" >");
out.write("&gt; "+ carac +pageQuRsData.getWord("seconds"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t ");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" >");
out.write(Long.toString(nbEvent));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" style=\"border-right:none\">\r\n");
      out.write("\t\t\t\t\t ");
	out.write(percent); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"40%\"  align=\"center\" style=\"border-left:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						if(nbqueue > 0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"10%\" class=\"reportsQueueRow\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");

			} //fin for
				
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\" class=\"reportsID\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageQuRsData.getWord("Abandoned calls")
								);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"7\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" height=\"20\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" >");
      out.print( pageQuRsData.getWord("Abandoned"));
      out.write(" </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\" > ");
      out.print( pageQuRsData.getWord("Abandon count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Percentages"));
      out.write("</td>\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			nbEvent =0;
			//System.out.println("tmpSLdata nb queue: "+Long.toString(nbqueue));
			carac="";
			percent="";
			for (int i =0; i < beanQueue.m_AbandSL.size(); i++){
				//percent = (String)beanQueue.m_AnsweredSL.elementAt(i);
				if(i < beanQueue.m_AbandSL.size() - 1){
					carac = Integer.toString(tabAband[i]);
				}
				beanQueueReport.SLdata tmpSLdata = (beanQueueReport.SLdata)beanQueue.m_AbandSL.elementAt(i);
				nbEvent = tmpSLdata.eventCount;
				percent =  tmpSLdata.percent;
				//System.out.println("tmpSLdata nb aband: "+percent);
			
      out.write("\r\n");
      out.write("\t\t\t\t<tr class=\"reportsQueueRow\">\r\n");
      out.write("\t\t\t\t");
if(i < beanQueue.m_AbandSL.size() - 1){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" >");
out.write(pageQuRsData.getWord("Within") + carac +pageQuRsData.getWord("seconds"));
      out.write("</td>\n");
      out.write("\t\t\t\t");
}else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<td width=\"20%\"  align=\"center\" >");
out.write("&gt; " + carac +pageQuRsData.getWord("seconds"));
      out.write("</td>\n");
      out.write("\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" >");
out.write(Long.toString(nbEvent));
      out.write("</td>\r\n");
      out.write("\t\t\t\t  <td width=\"20%\"  align=\"center\" style=\"border-right:none\">\r\n");
      out.write("\t\t\t\t\t ");
	out.write(percent); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"40%\"  align=\"center\" style=\"border-left:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						if(nbqueue > 0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"10%\" class=\"reportsQueueRow\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");

			} //fin for

      out.write("\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("</table>\r\n");
 pageQuRsData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t");

			}
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage3\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageQuRData.getWord("Statistics"));
      out.write("</h2>\t\t\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage3\" ) );\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			
			 sret = beanQueue.buildGlobalQueueReportForPeriod(queue,startingDate,endingDate,reportType);
			 if(sret == "success")
			 {
				
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");

	String totNbEntered ="" ;
    String totNbAnswered = "" ;
    String totNbAbandonned = "" ;
	String lang = "0";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");
		
	beanManagerData pageQuRStData = new beanManagerData();
	pageQuRStData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageQuRStData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

      out.write("\r\n");
      out.write("\r\n");
      out.write("<table width=\"80%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t");

	if(from.compareTo("queueReport") !=0)
	{
	
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<b>");
 out.write(""+queue+""); 
      out.write("</b>\r\n");
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
      out.print( pageQuRStData.getWord("Generals statistics"));
      out.write("&nbsp; ");
      out.print( pageQuRStData.getWord("for"));
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
      out.print( pageQuRStData.getWord("To"));
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
      out.write("\t");

	}
	else
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"110%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageQuRStData.getWord("Generals statistics"));
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
      out.write("\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t");

					queueInfo = (beanQueueDetails)beanQueue.period;
					if(queueInfo ==null)
						System.out.println("\n queueInfo = NULL !!!!! ");
					else
						System.out.println("\n queueInfo = NON NULL !!!!! ");
						/*
					if(period ==null)
						System.out.println("\n period = NULL !!!!! ");
					else
						System.out.println("\n period = NON NULL !!!!! ");
						*/
						
					totNbAnswered = Long.toString(queueInfo.NbDistributed);
					totNbAbandonned =Long.toString(queueInfo.NbAbandonned);

					out.write("<applet code='Manager.PieChart.PiechartApplet.class'  archive='../sAheevaChart.jar' width='550' height='300' mayscript name='graphApplet'>");
						// Start Up Parameters -->
						
					out.write("<PARAM name='LOADINGMESSAGE' value='"+pageQuRStData.getWord("graphloadingmessage")+"'>");
				
				
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
					
					out.write("<PARAM name='legendtitle'   value='"+ pageQuRStData.getWord("calls") +"'>");					
					
					out.write("<PARAM name='LegendBackground' value='255,255,255'>");
					out.write("<PARAM name='LegendBorder'     value='125,125,125'>");
					out.write("<PARAM name='LegendtextColor'  value='0,0,0'>");
						
						//Pie Data -->
						//  PieN   x,y,size,number of segments, seperation -->
					out.write("<PARAM name='Pie1' value='110,50,175,2,5'>");
					
						//Pie Segement Labels -->
					out.write("<PARAM name='pie1label1' value=''>");
					out.write("<PARAM name='pie1label2' value=''>");						
					
					out.write("<PARAM name='segment1'   value='115,152,164|"+ pageQuRStData.getWord("Answered") +"'>");	
									 
					out.write("<PARAM name='segment2'   value='185,53,8|"+ pageQuRStData.getWord("Abandoned") +"'>");	
					

					out.write("<PARAM name='data1series1' value=\""+totNbAnswered+"\">");
					out.write("<PARAM name='data2series1' value=\""+totNbAbandonned+"\">");
					 
						
					out.write("</applet>");
				
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\t\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pageQuRStData.closeConnection(); 
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
else //all
{
	
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\r\n");
      out.write("<form name=\"queueReports\">\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageQuRData.getWord("Data"));
      out.write("</h2>\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage1\" ) );  \t\t\t \t\t\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			for(int obj =0; obj < numObjects; obj++ )
			{
				queue = tabObj[obj];
				queueInfo = null;
				sret = beanQueue.buildQueueReportForPeriod(queue,startingDate,endingDate,reportType);
				if(sret == "success")
				 {
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.write('\r');
      out.write('\n');

////open connection to database///////
beanManagerData pageQuRdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageQuRdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageQuRdData.openConnection();

      out.write('\n');

	//String percent ="";
	long NbEntered_det     = 0 , ssTotNbEntered_det = 0, totNbEntered_det = 0 ;
    long NbAnswered_det  = 0 , ssTotNbAnswered_det = 0, totNbAnswered_det = 0 ;
    long NbAbandonned_det  = 0, ssTotNbAbandonned_det = 0, totNbAbandonned_det = 0 ;
	long NbAbandonTimeOut_det = 0, ssTotNbAbandonTimeOut_det = 0, totNbAbandonTimeOut_det = 0 ;
	long NbAbandonNoAgt_det = 0, ssTotNbAbandonNoAgt_det = 0, totNbAbandonNoAgt_det = 0;

   //double ServiceFactor = 0.0;
    queueInfo=null;
    boolean needOneMoreTotalRow_det = false;
	

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"80%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>");
 out.write(""+queue+""); 
      out.write("</b>\r\n");
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

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageQuRdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageQuRdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageQuRdData.getWord("Yearly"));
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageQuRdData.getWord("Queue Reports"));
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
      out.write("\t\t\t\t\t\t");
      out.print( pageQuRdData.getWord("To"));
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
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								//out.write("Count");
								NbEntered_det     = 0 ; ssTotNbEntered_det = 0; totNbEntered_det = 0 ;
								NbAnswered_det  = 0 ; ssTotNbAnswered_det = 0; totNbAnswered_det = 0 ;
								NbAbandonned_det  = 0; ssTotNbAbandonned_det = 0; totNbAbandonned_det = 0 ;
								NbAbandonTimeOut_det = 0; ssTotNbAbandonTimeOut_det = 0; totNbAbandonTimeOut_det = 0 ;
								NbAbandonNoAgt_det = 0; ssTotNbAbandonNoAgt_det = 0; totNbAbandonNoAgt_det = 0;
								
							
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
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" height=\"15\">\r\n");
      out.write("\t\t\t\t<td width=\"25%\" align=\"center\"> ");
      out.print( pageQuRdData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Entered"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Answered"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Abandoned"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Abandoned - time out"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"15%\"  align=\"center\">");
      out.print( pageQuRdData.getWord("Abandoned - no agent"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanQueue.m_vAllDetails.size(); i++) 
			{
				 queueInfo = (beanQueueDetails)beanQueue.m_vAllDetails.elementAt(i);
				 System.out.println("queueInfo.time.: " + queueInfo.time);
				
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write("  height=\"15\">\r\n");
      out.write("\t\t\t\t\t<td   align=\"center\">");
out.write(queueInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbEntered));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbDistributed));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbAbandonned));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbAbandonTimeOut));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"> ");
out.write(Long.toString(queueInfo.NbAbandonNoAgt));
      out.write("  </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t\t");


				ssTotNbEntered_det +=queueInfo.NbEntered;
				totNbEntered_det +=queueInfo.NbEntered;
				ssTotNbAnswered_det +=queueInfo.NbDistributed;
				totNbAnswered_det +=queueInfo.NbDistributed;
				ssTotNbAbandonned_det +=queueInfo.NbAbandonned;
				totNbAbandonned_det +=queueInfo.NbAbandonned;
				ssTotNbAbandonTimeOut_det +=queueInfo.NbAbandonTimeOut;
				totNbAbandonTimeOut_det +=queueInfo.NbAbandonTimeOut;
				ssTotNbAbandonNoAgt_det +=queueInfo.NbAbandonNoAgt;
				totNbAbandonNoAgt_det +=queueInfo.NbAbandonNoAgt;
				
			} //fin for
			if(needOneMoreTotalRow_det)
			{System.out.println("if needOneMoreTotalRow_det");
			
      out.write("\r\n");
      out.write("\t\t\t\t\t <tr  height=\"15\">\r\n");
      out.write("\t\t\t\t\t\t <td width=\"25%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageQuRdData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbEntered_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbAnswered_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbAbandonned_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbAbandonTimeOut_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssTotNbAbandonNoAgt_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");

			}
			
      out.write("\r\n");
      out.write("\t \t\t\t<tr  height=\"15\">\r\n");
      out.write("\t\t\t\t <td width=\"25%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageQuRdData.getWord("Total"));
      out.write("</b></font></td>\t\t\t \n");
      out.write("\t\t\t\t <td width=\"15%\"bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbEntered_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbAnswered_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbAbandonned_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbAbandonTimeOut_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\" bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(totNbAbandonNoAgt_det));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("</table>\r\n");
 pageQuRdData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t\t\t");

				 }
			 }
		
      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage2\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageQuRData.getWord("Percentages"));
      out.write("</h2>\t\t\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage2\" ) );\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			for(int obj =0; obj < numObjects; obj++ )
			{
				queue = tabObj[obj];
				queueInfo =null;
				sret = beanQueue.buildQueueReportForPeriod(queue,startingDate,endingDate,reportType);
				tabAnswered = beanQueue.getSVL_AnsweredForQueue(queue);
				if( tabAnswered == null) //no specification for that queue
				{
					tabAnswered =new  int[maxChoice];
					tabAnswered[0] =10; tabAnswered[5] =60;
					tabAnswered[1] =20; tabAnswered[6] =90;
					tabAnswered[2] =30; tabAnswered[7] =120;
					tabAnswered[3] =40; tabAnswered[8] =150;
					tabAnswered[4] =50; tabAnswered[9] =180;
				}
				tabAband = beanQueue.getSVL_AbandForQueue(queue);
				if(tabAband == null) //no specification for that queue
				{
					tabAband =new  int[maxChoice];
					tabAband[0] =10; tabAband[5] =60;
					tabAband[1] =20; tabAband[6] =90;
					tabAband[2] =30; tabAband[7] =120;
					tabAband[3] =40; tabAband[8] =150;
					tabAband[4] =50; tabAband[9] =180;
				}
				beanQueue.buildAnsweredLevelForPeriod(queue,startingDate,endingDate,reportType,tabAnswered);
				beanQueue.buildAbandonnedLevelForPeriod(queue,startingDate,endingDate,reportType,tabAband);
 
				 if(sret == "success")
				 {
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.write('\r');
      out.write('\n');

////open connection to database///////
beanManagerData pageQuRsData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageQuRsData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageQuRsData.openConnection();

      out.write('\r');
      out.write('\n');

	String percent ="";
	long NbEntered     = 0 , ssTotNbEntered = 0, totNbEntered = 0 ;
    long NbAnswered  = 0 , ssTotNbAnswered = 0, totNbAnswered = 0 ;
    long NbAbandonned  = 0, ssTotNbAbandonned = 0, totNbAbandonned = 0 ;
	long NbAbandonTimeOut = 0, ssTotNbAbandonTimeOut = 0, totNbAbandonTimeOut = 0 ;
	long NbAbandonNoAgt = 0, ssTotNbAbandonNoAgt = 0, totNbAbandonNoAgt = 0;

	String percentNbAnswered = "" , tot_percentNbAnswered = "";
	String percentNbAbandonned = "" , tot_percentNbAbandonned = "";
    String ServiceFactor = "", tot_ServiceFactor = "";

    long NAnswTh1 = 0,  ssTotNAnswTh1 =0, totNAnswTh1 =0;
	long NAbandTh2=0 ,  ssTotNAbandTh2 =0, totNAbandTh2 =0;
   //double ServiceFactor = 0.0;
   queueInfo = null;
   boolean needOneMoreTotalRow = false;
   
   //variable changeables compte tenu des tranches importantes pour le client
   /*
   int nbTranchesAnsw =10;
   String typeTranchesAnsw[] =new String[nbTranchesAnsw];
	for (int w =0; w < nbTranchesAnsw; w++)
	{
		typeTranchesAnsw[w] =;
	}
   int nbTranchesAband =10;
   String typeTranchesAband[] =new String[nbTranchesAband];
   */
   
	

      out.write("\r\n");
      out.write("<table width=\"80%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");

	if(from.compareTo("queueReport") != 0)
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
      out.write("\t\t\t\t\t  <b>");
 out.write(""+queue+""); 
      out.write("</b>\r\n");
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

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0)
								  out.write(pageQuRsData.getWord("Daily"));
							else if (reportType.compareTo("Monthly")==0) 
								out.write(pageQuRsData.getWord("Monthly"));						
							else if (reportType.compareTo("Yearly")==0) 
								out.write(pageQuRsData.getWord("Yearly"));
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageQuRsData.getWord("Percentages for queue"));
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
      out.print( pageQuRsData.getWord("To"));
      out.write(" \n");
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
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

	}
	 
      out.write("\r\n");
      out.write("\t <!--\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageQuRsData.getWord("Percentages"));
								NbEntered     = 0 ; ssTotNbEntered = 0; totNbEntered = 0 ;
								NbAnswered  = 0 ; ssTotNbAnswered = 0; totNbAnswered = 0 ;
								NbAbandonned  = 0; ssTotNbAbandonned = 0; totNbAbandonned = 0 ;
								NbAbandonTimeOut = 0; ssTotNbAbandonTimeOut = 0; totNbAbandonTimeOut = 0 ;
								NbAbandonNoAgt = 0; ssTotNbAbandonNoAgt = 0; totNbAbandonNoAgt = 0;
								needOneMoreTotalRow =false;
								
							
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t-->\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageQuRsData.getWord("Percentages"));
								NbEntered     = 0 ; ssTotNbEntered = 0; totNbEntered = 0 ;
								NbAnswered  = 0 ; ssTotNbAnswered = 0; totNbAnswered = 0 ;
								NbAbandonned  = 0; ssTotNbAbandonned = 0; totNbAbandonned = 0 ;
								NbAbandonTimeOut = 0; ssTotNbAbandonTimeOut = 0; totNbAbandonTimeOut = 0 ;
								NbAbandonNoAgt = 0; ssTotNbAbandonNoAgt = 0; totNbAbandonNoAgt = 0;
								needOneMoreTotalRow =false;
								
							
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"7\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" height=\"20\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\" >");
      out.print( pageQuRsData.getWord("Time period"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Answered"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Abandoned"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Answered service factor"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			for (int i = 0; i < beanQueue.m_vAllDetails.size(); i++) {
				 queueInfo = (beanQueueDetails)beanQueue.m_vAllDetails.elementAt(i);
				if(( queueInfo.time.length() >10 || queueInfo.otherMonthYear) && i > 0) {
					if((ssTotNbEntered) !=0) {
						percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)((ssTotNbAnswered)*100)/ssTotNbEntered), 2);
						percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)((ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt)*100)/ssTotNbEntered), 2);
					}else{
						percentNbAnswered = "0.00";
						percentNbAbandonned = "0.00";
					}
          			if (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 > 0) {
						ServiceFactor = queueInfo.formatDecimalDouble(( (double) ssTotNAnswTh1 /(double) (ssTotNbAnswered + (ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt) - ssTotNAbandTh2 )) *100 ,2);						
					}else
						ServiceFactor = "0.00";
					
					
      out.write("\r\n");
      out.write("\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t");

					ssTotNbEntered =0;
					ssTotNbAnswered =0;
					ssTotNbAbandonned=0;
					ssTotNbAbandonTimeOut=0;
					ssTotNbAbandonNoAgt=0;
					ssTotNAnswTh1 =0;
					ssTotNAbandTh2 =0;
					percentNbAnswered ="";
					percentNbAbandonned ="";
					ServiceFactor = "";
					needOneMoreTotalRow = true;
				} // fin if agentInfo.time.length() >10
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(">\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" >");
out.write(queueInfo.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"5%\"  align=\"center\"  style=\" border-right:none\">");
out.write(queueInfo.getPercentNbDistributed());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"15%\"  align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t");

						if(queueInfo.getPercentNbDistributed().compareTo("0.00%") !=0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(queueInfo.getPercentNbDistributed()); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"10%\" ");
 if(i%2 == 0) out.write("class=reportsRowPair");
												else out.write("class=reportsRowUnPair");
      out.write("></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t <td width=\"5%\"  align=\"center\"  style=\" border-right:none\">");
out.write(queueInfo.getPercentNbAbandonned());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"15%\"  align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t");

						if(queueInfo.getPercentNbAbandonned().compareTo("0.00%") !=0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(queueInfo.getPercentNbAbandonned()); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("<td width=\"10%\" ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write("></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t\t <td width=\"5%\"  align=\"center\"  style=\" border-right:none\">");
out.write(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2)+"%");
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"15%\"  align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t");

						if(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2).compareTo("0.00") !=0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2)+"%"); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("<td width=\"10%\" ");
 if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write("></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t\t");


				ssTotNbEntered +=queueInfo.NbEntered;
				totNbEntered +=queueInfo.NbEntered;
				ssTotNbAnswered +=queueInfo.NbDistributed;
				totNbAnswered +=queueInfo.NbDistributed;
				ssTotNbAbandonned +=queueInfo.NbAbandonned;
				totNbAbandonned +=queueInfo.NbAbandonned;
				ssTotNbAbandonTimeOut +=queueInfo.NbAbandonTimeOut;
				totNbAbandonTimeOut +=queueInfo.NbAbandonTimeOut;
				ssTotNbAbandonNoAgt +=queueInfo.NbAbandonNoAgt;
				totNbAbandonNoAgt +=queueInfo.NbAbandonNoAgt;
				ssTotNAnswTh1 +=queueInfo.nAnswTh1;
				totNAnswTh1 +=queueInfo.nAnswTh1;
				ssTotNAbandTh2 +=queueInfo.nAbandTh2;
				totNAbandTh2 +=queueInfo.nAbandTh2;
				
			} //fin for
			if(needOneMoreTotalRow){
				if((ssTotNbEntered) !=0) {
					percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)(ssTotNbAnswered*100)/ssTotNbEntered), 2);
					percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)((ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt)*100)/ssTotNbEntered), 2);
				}else{
					percentNbAnswered = "0.00";
					percentNbAbandonned = "0.00";
				}
				if (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 > 0) {
					ServiceFactor = queueInfo.formatDecimalDouble(( (double) ssTotNAnswTh1 /(double) (ssTotNbAnswered + (ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt) - ssTotNAbandTh2 )) *100 ,2);						
					}else
					ServiceFactor = "0.00";
				
				
      out.write("\r\n");
      out.write("\t\t\t\t\t \r\n");
      out.write("\t\t\t");

			}
			
			if((totNbEntered) !=0) {
				tot_percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)(totNbAnswered*100)/totNbEntered), 2);
				tot_percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)((totNbAbandonned+totNbAbandonTimeOut+totNbAbandonNoAgt)*100)/totNbEntered), 2);
				}else{
				tot_percentNbAnswered = "0.00";
				tot_percentNbAbandonned = "0.00";
			}
			if (totNbAnswered + totNbAbandonned - totNAbandTh2 > 0) {
				tot_ServiceFactor = queueInfo.formatDecimalDouble(( (double) totNAnswTh1 /(double) (totNbAnswered + (totNbAbandonned+totNbAbandonTimeOut+totNbAbandonNoAgt) - totNAbandTh2 )) *100 ,2);						
				}else
				tot_ServiceFactor = "0.00";
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t <td width=\"20%\"  bgcolor=\"#FFECF5\" align=\"center\" ><font  color=\"#000000\"><b>");
      out.print( pageQuRsData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t <td width=\"5%\"  bgcolor=\"#FFECF5\" align=\"center\"  style=\" border-right:none\"><font  color=\"#000000\"><b>");
out.write(tot_percentNbAnswered+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\"  bgcolor=\"#FFECF5\" align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t ");

						 	if(tot_percentNbAnswered.compareTo("0.00") !=0 ){
						 
      out.write("\r\n");
      out.write("\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(tot_percentNbAnswered+"%"); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"10%\" style=\"background-color:#FFECF5\"></td>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t");

					}
					
      out.write("\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\"  bgcolor=\"#FFECF5\" align=\"center\"  style=\" border-right:none\"><font  color=\"#000000\"><b>");
out.write(tot_percentNbAbandonned+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\"  bgcolor=\"#FFECF5\" align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t ");

						 	if(tot_percentNbAbandonned.compareTo("0.00") !=0 ){
						 
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write((totNbAbandonned+totNbAbandonTimeOut+totNbAbandonNoAgt)+"%"); 
      out.write("\" height=\"7\" align=\"left\">\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"10%\" style=\"background-color:#FFECF5\"></td>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t");

					}
					
      out.write("\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t <td width=\"5%\"  bgcolor=\"#FFECF5\" align=\"center\"  style=\" border-right:none\"><font  color=\"#000000\"><b>");
out.write(tot_ServiceFactor+"%");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t <td width=\"15%\"  bgcolor=\"#FFECF5\" align=\"center\" style=\" border-left:none\" >\r\n");
      out.write("\t\t\t\t\t\t ");

						 	if(tot_ServiceFactor.compareTo("0.00") !=0 ){
						 
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(tot_ServiceFactor+"%"); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"10%\" style=\"background-color:#FFECF5\"></td>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t");

					}
					
      out.write("\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( pageQuRsData.getWord("Service level")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"7\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\" class=\"reportsID\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageQuRsData.getWord("Answered calls")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"7\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" height=\"20\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" >");
      out.print( pageQuRsData.getWord("Answered"));
      out.write(" </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\" > ");
      out.print( pageQuRsData.getWord("Answered count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Percentages"));
      out.write("</td>\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			long nbqueue =(long)beanQueue.nbQueue;
			long nbEvent =0;
			String carac="";
			percent="";
			for (int i = 0; i < beanQueue.m_AnsweredSL.size(); i++){
				if(i < beanQueue.m_AnsweredSL.size() - 1){
					carac =Integer.toString(tabAnswered[i]);
				}
				beanQueueReport.SLdata tmpSLdata = (beanQueueReport.SLdata)beanQueue.m_AnsweredSL.elementAt(i);
				nbEvent = tmpSLdata.eventCount;
				percent =  tmpSLdata.percent;
			
      out.write("\r\n");
      out.write("\t\t\t\t<tr class=\"reportsQueueRow\">\r\n");
      out.write("\t\t\t\t\t");
 if(i < beanQueue.m_AnsweredSL.size() - 1){  
      out.write("\r\n");
      out.write("\t\t\t\t\t \t<td width=\"20%\"  align=\"center\" >");
out.write(pageQuRsData.getWord("Within") + carac +pageQuRsData.getWord("seconds"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t ");
 }else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t \t<td width=\"20%\"  align=\"center\" >");
out.write("&gt; "+ carac +pageQuRsData.getWord("seconds"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t ");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" >");
out.write(Long.toString(nbEvent));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" style=\"border-right:none\">\r\n");
      out.write("\t\t\t\t\t ");
	out.write(percent); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"40%\"  align=\"center\" style=\"border-left:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						if(nbqueue > 0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"10%\" class=\"reportsQueueRow\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");

			} //fin for
				
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\" class=\"reportsID\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageQuRsData.getWord("Abandoned calls")
								);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"7\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" height=\"20\">\r\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" >");
      out.print( pageQuRsData.getWord("Abandoned"));
      out.write(" </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\" > ");
      out.print( pageQuRsData.getWord("Abandon count"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"20%\"  align=\"center\" colspan=\"2\" >");
      out.print( pageQuRsData.getWord("Percentages"));
      out.write("</td>\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

			nbEvent =0;
			//System.out.println("tmpSLdata nb queue: "+Long.toString(nbqueue));
			carac="";
			percent="";
			for (int i =0; i < beanQueue.m_AbandSL.size(); i++){
				//percent = (String)beanQueue.m_AnsweredSL.elementAt(i);
				if(i < beanQueue.m_AbandSL.size() - 1){
					carac = Integer.toString(tabAband[i]);
				}
				beanQueueReport.SLdata tmpSLdata = (beanQueueReport.SLdata)beanQueue.m_AbandSL.elementAt(i);
				nbEvent = tmpSLdata.eventCount;
				percent =  tmpSLdata.percent;
				//System.out.println("tmpSLdata nb aband: "+percent);
			
      out.write("\r\n");
      out.write("\t\t\t\t<tr class=\"reportsQueueRow\">\r\n");
      out.write("\t\t\t\t");
if(i < beanQueue.m_AbandSL.size() - 1){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" >");
out.write(pageQuRsData.getWord("Within") + carac +pageQuRsData.getWord("seconds"));
      out.write("</td>\n");
      out.write("\t\t\t\t");
}else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<td width=\"20%\"  align=\"center\" >");
out.write("&gt; " + carac +pageQuRsData.getWord("seconds"));
      out.write("</td>\n");
      out.write("\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t <td width=\"20%\"  align=\"center\" >");
out.write(Long.toString(nbEvent));
      out.write("</td>\r\n");
      out.write("\t\t\t\t  <td width=\"20%\"  align=\"center\" style=\"border-right:none\">\r\n");
      out.write("\t\t\t\t\t ");
	out.write(percent); 
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td width=\"40%\"  align=\"center\" style=\"border-left:none\">\r\n");
      out.write("\t\t\t\t\t\t");

						if(nbqueue > 0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#BCBCDE\" style=\"background-color:#CC9999\" width=\"");
 out.write(percent); 
      out.write("\" height=\"7\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"90%\" style=\"background-color:#BCBCDE\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"10%\" class=\"reportsQueueRow\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t");

			} //fin for

      out.write("\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("</table>\r\n");
 pageQuRsData.closeConnection(); 
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
      out.print( pageQuRData.getWord("Statistics"));
      out.write("</h2>\t\t\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage3\" ) );\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t    ");

			for(int obj =0; obj < numObjects; obj++ )
			{
				queue = tabObj[obj];
				queueInfo =null;
				sret = beanQueue.buildGlobalQueueReportForPeriod(queue,startingDate,endingDate,reportType);
				 if(sret == "success")
				 {
					queueInfo = (beanQueueDetails)beanQueue.period;	
					
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");

	String totNbEntered ="" ;
    String totNbAnswered = "" ;
    String totNbAbandonned = "" ;
	String lang = "0";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");
		
	beanManagerData pageQuRStData = new beanManagerData();
	pageQuRStData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageQuRStData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

      out.write("\r\n");
      out.write("\r\n");
      out.write("<table width=\"80%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t");

	if(from.compareTo("queueReport") !=0)
	{
	
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<b>");
 out.write(""+queue+""); 
      out.write("</b>\r\n");
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
      out.print( pageQuRStData.getWord("Generals statistics"));
      out.write("&nbsp; ");
      out.print( pageQuRStData.getWord("for"));
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
      out.print( pageQuRStData.getWord("To"));
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
      out.write("\t");

	}
	else
	{
	 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<table width=\"110%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100%\" align=\"left\"><font style=\"background-color:#FFC5A8\">\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageQuRStData.getWord("Generals statistics"));
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
      out.write("\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t");

					queueInfo = (beanQueueDetails)beanQueue.period;
					if(queueInfo ==null)
						System.out.println("\n queueInfo = NULL !!!!! ");
					else
						System.out.println("\n queueInfo = NON NULL !!!!! ");
						/*
					if(period ==null)
						System.out.println("\n period = NULL !!!!! ");
					else
						System.out.println("\n period = NON NULL !!!!! ");
						*/
						
					totNbAnswered = Long.toString(queueInfo.NbDistributed);
					totNbAbandonned =Long.toString(queueInfo.NbAbandonned);

					out.write("<applet code='Manager.PieChart.PiechartApplet.class'  archive='../sAheevaChart.jar' width='550' height='300' mayscript name='graphApplet'>");
						// Start Up Parameters -->
						
					out.write("<PARAM name='LOADINGMESSAGE' value='"+pageQuRStData.getWord("graphloadingmessage")+"'>");
				
				
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
					
					out.write("<PARAM name='legendtitle'   value='"+ pageQuRStData.getWord("calls") +"'>");					
					
					out.write("<PARAM name='LegendBackground' value='255,255,255'>");
					out.write("<PARAM name='LegendBorder'     value='125,125,125'>");
					out.write("<PARAM name='LegendtextColor'  value='0,0,0'>");
						
						//Pie Data -->
						//  PieN   x,y,size,number of segments, seperation -->
					out.write("<PARAM name='Pie1' value='110,50,175,2,5'>");
					
						//Pie Segement Labels -->
					out.write("<PARAM name='pie1label1' value=''>");
					out.write("<PARAM name='pie1label2' value=''>");						
					
					out.write("<PARAM name='segment1'   value='115,152,164|"+ pageQuRStData.getWord("Answered") +"'>");	
									 
					out.write("<PARAM name='segment2'   value='185,53,8|"+ pageQuRStData.getWord("Abandoned") +"'>");	
					

					out.write("<PARAM name='data1series1' value=\""+totNbAnswered+"\">");
					out.write("<PARAM name='data2series1' value=\""+totNbAbandonned+"\">");
					 
						
					out.write("</applet>");
				
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\t\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pageQuRStData.closeConnection(); 
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
 pageQuRData.closeConnection(); 
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
