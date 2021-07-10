package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import aheevaManager.reports.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;

public final class inbound_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/jsp/inboundDetails.jsp");
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
      out.write("<LINK href=\"../Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Inbound Reports</title>\r\n");
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
      out.write("\tbackground:\t#E1F4FF;\r\n");
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
      aheevaManager.reports.beanCallReport beanInboundCallReport = null;
      synchronized (request) {
        beanInboundCallReport = (aheevaManager.reports.beanCallReport) _jspx_page_context.getAttribute("beanInboundCallReport", PageContext.REQUEST_SCOPE);
        if (beanInboundCallReport == null){
          beanInboundCallReport = new aheevaManager.reports.beanCallReport();
          _jspx_page_context.setAttribute("beanInboundCallReport", beanInboundCallReport, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String phoneNumber  = request.getParameter("dnis");
    String spacing  = request.getParameter("spacing");
	
    String startingDate = "", sRet ="";
    String endingDate = "";

	beanCallReportDetails r1=null;

    if (reportType.compareTo("Daily") ==0){
			startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
			endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    } else if (reportType.compareTo("Monthly") ==0){
			startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
			//endingDate = starting_year_monthly+ "-"+ starting_month_monthly + "-31"+ " 23:59:59" ;
			endingDate = starting_year_monthly+ "-"+ starting_month_monthly + "-31"+ " 23:59:59" ;
			// For this report it should be stats for the same month
    } 


      out.write("\r\n");
      out.write("<div class=\"img-control\" >\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printInboundCallsReport.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ;
      out.write("&starting_month_monthly=");
out.write(starting_month_monthly) ;
      out.write("&starting_year_monthly=");
out.write(starting_year_monthly) ;
      out.write("&reportType=");
out.write(reportType) ;
      out.write("&dnis=");
out.write(phoneNumber) ;
      out.write("&spacing=");
out.write(spacing) ;
      out.write("&lang=");
 out.write(request.getParameter("lang")); 
      out.write("')\"><img src=\"../img/printer.gif\" border=\"0\"></button>\r\n");
      out.write("\t\t</td>\t\t\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\r\n");
      out.write("<form name=\"inboundReports\">\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");

		sRet = beanInboundCallReport.buildGroupReportForDnis(startingDate,endingDate,reportType,spacing,phoneNumber);
		if(sRet == "success")
		{
			
      out.write("\r\n");
      out.write("\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageInbndData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageInbndData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageInbndData.openConnection();

      out.write('\n');

    int i=0,j=0,k=0;
    long tLoginTime = 0, sstLoginTime = 0;
    long tNotReadyTime = 0, sstNotReadyTime = 0;
    long tTalkTimeInbound = 0, sstTalkTimeInbound = 0;
    long tTalkTimeOutbound = 0, sstTalkTimeOutbound = 0;
    long tTalkTime = 0, sstTalkTime = 0;
    long tTime = 0, sstTime = 0;
    long tWrapUp =0, sstWrapUp=0;
	long tHold = 0, sstHold = 0;
	long tOffered = 0, sstOffered = 0;
	long tHandled =0, sstHandled =0;
    String [] m_Agents;
    String [] m_tLoginTime;
    String [] m_tTalkTimeInbound;
    String [] m_tTalkTimeOutbound;
    String [] m_tWaitTime;


    String tot_ServiceFactor = "", sstot_ServiceFactor = "";
	String time_p="", sstime_p="";

    long  totNAnswTh1 =0,sstotNAnswTh1=0;
	long totNAbandTh2 =0,sstotNAbandTh2 =0;
	long answered = 0,ssAnswered = 0, handled =0,sshandled =0;
	long queued =0,ssQueued =0;
	long abandonned =0,ssAbandonned =0;

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>[");
out.write(phoneNumber);
      out.write("]</b>\t\t\t\t\r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"5\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\" ><font color=\"#003366\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageInbndData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageInbndData.getWord("Monthly"));						
								}
							
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageInbndData.getWord("Inbound calls report"));
      out.write("  <br><br>");
      out.print( pageInbndData.getWord("From"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} 
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageInbndData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} 
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t\t\t");

							 if(spacing.compareTo("15")==0)
							 {
							 	out.write("15 min "+ pageInbndData.getWord("Spacing(mn)"));
							 }
							 if(spacing.compareTo("30")==0)
							 {
							 	out.write("30 min "+ pageInbndData.getWord("Spacing(mn)"));
							 }
							 if(spacing.compareTo("60")==0)
							 {
							 	out.write("60 min "+pageInbndData.getWord("Spacing(mn)"));
							 }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b></font>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" >\r\n");
      out.write("\t\t\t\t  <td width=\"20%\" align=\"center\"><b>");
      out.print( pageInbndData.getWord("Call date"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t  <td width=\"20%\"  align=\"center\"><b>");
      out.print( pageInbndData.getWord("Time period"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t  <td width=\"10%\" align=\"center\"><b>");
      out.print( pageInbndData.getWord("Entered"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t  <td width=\"10%\"  align=\"center\">");
      out.print( pageInbndData.getWord("Answered"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t  <td width=\"10%\"  align=\"center\"><b>");
      out.print( pageInbndData.getWord("Service factor"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t  <td width=\"10%\"  align=\"center\"><b>");
      out.print( pageInbndData.getWord("Talk time"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t  <td width=\"10%\"  align=\"center\"><b>");
      out.print( pageInbndData.getWord("Wrap up time"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t  <td width=\"10%\"  align=\"center\"><b>");
      out.print( pageInbndData.getWord("Hold time"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t  <td width=\"10%\"  align=\"center\"><b>");
      out.print( pageInbndData.getWord("Average answering time"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("<!-- traverse the array -->\r\n");

/*
 	  	   Vector v = new Vector();//(Vector)beanInboundCallReport.m_vAllDetails.values();   
 		  for (Iterator iter =  beanInboundCallReport.m_vAllDetails.values().iterator(); iter.hasNext();j++)
		   {
		   	  v.add( (beanCallReportDetails)iter.next());
		   }
		    
		  Collections.sort(v);
		  */	
		  String key="";
		  int first =0;
		  
		 for(j=0; j < beanInboundCallReport.key_vector.size() ; j++)
		   {
		   	key=(String)beanInboundCallReport.key_vector.elementAt(j);
			 r1 = (beanCallReportDetails)beanInboundCallReport.m_vAllDetails.get(key);

			if(time_p.compareTo(r1.timePeriod) !=0 && first !=0)
			{ 
		
			  String sst_productivity = "", ssavg_ans="";
			  float sst_product =0;
			  if (sstLoginTime == 0){
				sst_productivity = "";
			  } else {
				sst_product = (1-(((float)sstWrapUp + (float)sstNotReadyTime) / (float)sstLoginTime))* 100;
				sst_productivity = Float.toString(sst_product);
			  }
			  
				if (ssAnswered + ssAbandonned - sstotNAbandTh2 > 0) 
				{
					sstot_ServiceFactor = r1.formatDecimalDouble(( (double) sstotNAnswTh1 /(double) (ssAnswered + ssAbandonned - sstotNAbandTh2 )) *100 ,2);						
				}
				else
					sstot_ServiceFactor = "0.00";
				if (sshandled == 0) {
				  ssavg_ans= "00:00:00";
				}
				else {
				  ssavg_ans= r1.buildReadableTime( (sstTalkTime + sstWrapUp + sstHold) / sshandled);
				}				
		
      out.write("\r\n");
      out.write("\t\t\t\t <tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageInbndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssQueued));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(sshandled));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(sstot_ServiceFactor+"%");
      out.write("</b></font></td>\t\t \r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.buildReadableTime(sstTalkTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.buildReadableTime(sstWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.buildReadableTime(sstHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(ssavg_ans);
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t");

			  sstLoginTime =0;
			  sstNotReadyTime =0;
			  sstTalkTime =0;
			  ssQueued =0;
			  ssAnswered =0;
			  sshandled =0;
			  ssAbandonned =0;
			  sstotNAbandTh2 =0;
			  sstotNAnswTh1 =0;
			  sstWrapUp  =0;
			  sstHold =0;
			  first =0;
		}
			 

      out.write("\r\n");
      out.write("\t\t\t  <tr ");
 if(j%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t  <td  align=\"center\">");

						if(time_p.compareTo(r1.timePeriod) !=0)
						{
							out.write("<font color=#800000>");
							out.write(r1.timePeriod);
							out.write("</font>");
						}
						else  out.write(" ");
      out.write("</td>\r\n");
      out.write("\t\t\t    <td align=\"center\">");
out.write(r1.period_min+"-"+r1.period_max);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  <td align=\"center\">");
out.write(Long.toString(r1.queued));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  <td align=\"center\">");
out.write(Long.toString(r1.handled));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  <td align=\"center\">");
out.write(r1.ServiceFactor+"%");
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  <td align=\"center\">");
out.write(r1.buildReadableTime(r1.totalTalkTimeInbound));
      out.write("</td>\r\n");
      out.write("\t\t\t\t  <td align=\"center\">");
out.write(r1.getTotalWrapUpTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  <td align=\"center\">");
out.write(r1.getTotalHoldTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  <td align=\"center\">");
out.write(r1.getAvgDistributedCalls());
      out.write("</td>\r\n");
      out.write("\t\t      </tr>\r\n");
      out.write("<!-- end of array traversal-->\r\n");

			  first =1;
			  tLoginTime += r1.totalLoginTime;
			  sstLoginTime += r1.totalLoginTime;
			  tNotReadyTime += r1.totalNotReadyTime;
			  sstNotReadyTime += r1.totalNotReadyTime;
			  //tTalkTimeInbound += r1.totalTalkTimeInbound;
			  //tTalkTimeOutbound += r1.totalTalkTimeOutbound;
			  tTalkTime += r1.totalTalkTimeInbound;
			  sstTalkTime += r1.totalTalkTimeInbound;
			  
			  queued += r1.queued;
			  ssQueued += r1.queued;
			  answered += r1.distibuted;
			  ssAnswered += r1.distibuted;
			  handled +=r1.handled;
			  sshandled +=r1.handled;
			  abandonned += r1.abandonned;
			  ssAbandonned += r1.abandonned;
			  totNAbandTh2 += r1.nAbandTh2;
			  sstotNAbandTh2 += r1.nAbandTh2;
			  totNAnswTh1 += r1.nAnswTh1;
			  sstotNAnswTh1 += r1.nAnswTh1;
			  
			  tWrapUp  += r1.totalWrapUpTime;
			  sstWrapUp  += r1.totalWrapUpTime;
			  tHold += r1.totalHoldTime;
			  sstHold += r1.totalHoldTime;
			  
			  time_p =r1.timePeriod;
			  sstime_p =r1.timePeriod;
              System.out.println("\n totalTalkTimeInbound jsp=[" + Long.toString(r1.totalTalkTimeInbound) + "]");
			  
      	 }//end for(j = 0; j <  .size()..)
		 if(first ==1)
		 {
			  String sst_productivity = "", ssavg_ans="";
			  float sst_product =0;
			  if (sstLoginTime == 0){
				sst_productivity = "";
			  } else {
				sst_product = (1-(((float)sstWrapUp + (float)sstNotReadyTime) / (float)sstLoginTime))* 100;
				sst_productivity = Float.toString(sst_product);
			  }
			  
				if (ssAnswered + ssAbandonned - sstotNAbandTh2 > 0) 
				{
					sstot_ServiceFactor = r1.formatDecimalDouble(( (double) sstotNAnswTh1 /(double) (ssAnswered + ssAbandonned - sstotNAbandTh2 )) *100 ,2);						
				}
				else
					sstot_ServiceFactor = "0.00";
				if (sshandled == 0) {
				  ssavg_ans= "00:00:00";
				}
				else {
				  ssavg_ans= r1.buildReadableTime( (sstTalkTime + sstWrapUp + sstHold) / sshandled);
				}				
		
      out.write("\r\n");
      out.write("\t\t\t\t <tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageInbndData.getWord("Sub total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(ssQueued));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(sshandled));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(sstot_ServiceFactor+"%");
      out.write("</b></font></td>\t\t \r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.buildReadableTime(sstTalkTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.buildReadableTime(sstWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.buildReadableTime(sstHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(ssavg_ans);
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t\t");

		 }

		  String t_productivity = "", avg_ans="";
		  float t_product =0;
		  if (tLoginTime == 0){
			t_productivity = "";
		  } else {
			t_product = (1-(((float)tWrapUp + (float)tNotReadyTime) / (float)tLoginTime))* 100;
			t_productivity = Float.toString(t_product);
		  }
 		  r1 = new beanCallReportDetails();
			if (answered + abandonned - totNAbandTh2 > 0) 
			{
				tot_ServiceFactor = r1.formatDecimalDouble(( (double) totNAnswTh1 /(double) (answered + abandonned - totNAbandTh2 )) *100 ,2);						
			}
			else
				tot_ServiceFactor = "0.00";
			if (answered == 0) {
			  avg_ans= "00:00:00";
			}
			else {
			  avg_ans= r1.buildReadableTime( (tTalkTime + tWrapUp + tHold) / answered);
			}				
		  //r1.offered = tOffered;
		  //r1.handled = tHandled;
		  r1.totalTalkTime = tTalkTime;
		  r1.totalHoldTime = tHold;
		  //r1.totalTalkTimeInbound = tTalkTimeInbound;
		  //r1.totalTalkTimeOutbound = tTalkTimeOutbound;
		  r1.totalWrapUpTime  = tWrapUp;
		  r1.totalLoginTime = tLoginTime;
	
      out.write("\r\n");
      out.write("\t\t\t\t <tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
      out.print( pageInbndData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t <td  bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(queued));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(Long.toString(handled));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(tot_ServiceFactor+"%");
      out.write("</b></font></td>\t\t \r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.buildReadableTime(tTalkTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.buildReadableTime(tWrapUp));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.buildReadableTime(tHold));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(avg_ans);
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
 pageInbndData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t");

			System.out.println("sRet: success");
		}
		else
			System.out.println("sRet: no success");
			

      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
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
