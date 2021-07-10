package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import aheevaManager.reports.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;

public final class outboundCallsReports_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/aheevaManager/jsp/outboundCallsReportsDetails.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/outboundCallsReportsDetailsAll.jsp");
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

////open connection to database///////
beanManagerData pageOutData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageOutData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageOutData.openConnection();

      out.write("\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Outbound Reports</title>\r\n");
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
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      aheevaManager.reports.beanAgentPerformanceReport beanAgentPerf = null;
      synchronized (request) {
        beanAgentPerf = (aheevaManager.reports.beanAgentPerformanceReport) _jspx_page_context.getAttribute("beanAgentPerf", PageContext.REQUEST_SCOPE);
        if (beanAgentPerf == null){
          beanAgentPerf = new aheevaManager.reports.beanAgentPerformanceReport();
          _jspx_page_context.setAttribute("beanAgentPerf", beanAgentPerf, PageContext.REQUEST_SCOPE);
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
	//String detail =request.getParameter("detail");
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
	String starting_year_yearly = request.getParameter("starting_year_yearly");
	String ending_year_yearly = request.getParameter("ending_year_yearly");
	String starting_month_monthly = request.getParameter("starting_month_monthly");
	String starting_year_monthly = request.getParameter("starting_year_monthly");
	String ending_month_monthly = request.getParameter("ending_month_monthly");
	String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String agentGroups  = request.getParameter("objects");
	String[] tabObj =null;
    StringTokenizer tok = null, tokGrp =null;
    //beanAgentGlobalInfo groupsInfo = null;
	String from ="";
	/*
    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
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
	*/
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


    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
	
    int i,j,k;
    String agents = "",myagt="";
	String agentGroupName ="",  sRet="";
    beanAgentPerformanceDetails r1=null;
    int numCampaigns = tok.countTokens();
	tabObj =new String[numCampaigns];
	for (int w =0; w < numCampaigns; w++)
	{
		tabObj[w] = tok.nextToken(); 
    }

      out.write("\r\n");
      out.write("<div class=\"img-control\">\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printOutboundCallsReports.jsp?startingDateDaily=");
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
out.write(agentGroups) ;
      out.write("&prec=");
 out.write(prec) ;
      out.write("&suiv=");
 out.write(suiv) ;
      out.write("&current=");
 out.write(current) ;
      out.write("&all_obj=");
 out.write(all_obj) ;
      out.write("&from=");
 out.write("outboundReport") ;
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
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"outboundCallsReports.jsp?startingDateDaily=");
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
out.write(agentGroups) ;
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
      out.print( pageOutData.getWord("Previous"));
      out.write("</a>\t\t</td>\n");
      out.write("\t");

	}
	if(numCampaigns >1 && all_obj.compareTo("0") ==0)
	{
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"outboundCallsReports.jsp?startingDateDaily=");
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
out.write(agentGroups) ;
      out.write("&prec=-1&suiv=1&current=0&all_obj=1&lang=");
out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print( pageOutData.getWord("All"));
      out.write("</a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	String nb_obj = Integer.toString(numCampaigns);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{
      out.write("\t\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\"><a href=\"outboundCallsReports.jsp?startingDateDaily=");
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
out.write(agentGroups) ;
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
      out.print( pageOutData.getWord("Next"));
      out.write("</a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<!--<table width=\"100%\"><tr><td width=\"100%\" height=\"30\"></td></tr></table>-->\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\r\n");
      out.write("<form name=\"outboundReports\">\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t<fieldset>\r\n");

	if(all_obj.compareTo("0")==0) // un campaign
	{
		agentGroupName = tabObj[Integer.parseInt(current)];
		System.out.println(pageOutData.getWord("Agent performance report for group")+": " + agentGroupName);
		sRet = beanAgentPerf.buildAgentPerformanceGrpDetailsReportForPeriod(agentGroupName,startingDate,endingDate,reportType);
		if(sRet == "success")
		{
			
      out.write("\r\n");
      out.write("\t\t\t");
      out.write('\r');
      out.write('\n');

////open connection to database///////
beanManagerData pageOutRData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageOutRData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageOutRData.openConnection();

      out.write('\n');

long totLoginTime=0;
String writeName="";
long totnbContacts=0,totnbSucess=0 ,totnbRefusals=0,totnbCallsBacks =0,	 totRContacts=0, totalContacts = 0; 
String callsPerHour="0.00", sallesPerHour ="0.00", refusalsPerHour ="0.00", netContRate ="0.00", totalContactsPerHour="0.00";

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
      out.write("\t\t\t\t\t  <b>");
out.write(agentGroupName);
      out.write("</b>\t\t\t\t\r\n");
      out.write("\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\" ><font color=\"#003366\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) {
								  out.write(pageOutRData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) {
								out.write(pageOutRData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) {
								out.write(pageOutRData.getWord("Yearly"));
								}
							
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageOutRData.getWord("Outbound calls"));
      out.write("&nbsp; ");
      out.print( pageOutRData.getWord("Report"));
      out.write("&nbsp; ");
      out.print( pageOutRData.getWord("From"));
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
      out.print( pageOutRData.getWord("To"));
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
      out.write("\t\t\t\t\t\t</b></font>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageOutRData.getWord("Data")
							);
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" >\r\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Agent ID"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"25%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Agent name"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"14%\" align=\"center\"> <b> ");
      out.print( pageOutRData.getWord("Total login time"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Total calls"));
      out.write(" </b> </td>\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Total contacts"));
      out.write(" </b> </td>\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b><");
      out.print( pageOutRData.getWord("Success"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Refusals"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"16%\"   align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Callbacks"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

					  for (j = 0; j < beanAgentPerf.m_gAllDetails.size(); j++)
					   {
						 r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_gAllDetails.elementAt(j);
						 if(r1.agentFullName != null) writeName=r1.agentFullName;
						 else writeName= " ";
			
      out.write("\r\n");
      out.write("\t\t\t\t  <tr ");
 if(j%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(r1.agentId);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td   align=\"left\" >&nbsp;&nbsp;");
out.write(writeName);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(r1.getTotalLoginTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" >");
out.write(Long.toString(r1.NbContacts));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" >");
out.write(Long.toString(r1.totalContacts));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" >");
out.write(Long.toString(r1.NbSales));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(Long.toString(r1.NbNoSales));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" >");
out.write(Long.toString(r1.NbCallBacks));
      out.write(" </td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t<!-- end of array traversal-->\r\n");
      out.write("\t\t");

				totLoginTime += r1.totalLoginTime;
				totnbContacts += r1.NbContacts;
				totnbSucess += r1.NbSales;
				totnbRefusals += r1.NbNoSales;
				totnbCallsBacks += r1.NbCallBacks;
				totalContacts += r1.totalContacts;
			   
			  } //fin for
			r1 = new beanAgentPerformanceDetails();

      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print( pageOutRData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(r1.buildReadableTime(totLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(totnbContacts));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(totalContacts));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(totnbSucess));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(totnbRefusals));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(totnbCallsBacks));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageOutRData.getWord("Statistics"));
								totLoginTime=0;
								writeName="";
								totnbContacts=0;totnbSucess=0 ;totnbRefusals=0; totnbCallsBacks =0; totalContacts = 0;
								totRContacts=0;
								callsPerHour="0.00"; sallesPerHour ="0.00"; refusalsPerHour ="0.00"; netContRate ="0.00";totalContactsPerHour="0.00";
								
							
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" >\r\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Agent ID"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"25%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Agent name"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Calls/hour"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Contact/hour"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Sales/hour"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Refusals/hour"));
      out.write("</b> </td><!-- rEFUSALS/H FROM DATABASE -->\n");
      out.write("\t\t\t\t<td width=\"16%\"   align=\"center\"> <b>");
      out.print( pageOutRData.getWord("Net Conv. Rate"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

					  for (j = 0; j < beanAgentPerf.m_gAllDetails.size(); j++)
					   {
						 r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_gAllDetails.elementAt(j);
						 if(r1.agentFullName != null) writeName=r1.agentFullName;
						 else writeName= " ";
						 if(r1.totalLoginTime !=0)
						 {
							 callsPerHour =r1.formatDecimalDouble( ( (double)r1.NbContacts*3600/r1.totalLoginTime), 2);
							 sallesPerHour = r1.formatDecimalDouble( ( (double)r1.NbSales*3600/r1.totalLoginTime), 2);
							 refusalsPerHour = r1.formatDecimalDouble( ( (double)r1.NbNoSales*3600/r1.totalLoginTime), 2);
							 totalContactsPerHour = r1.formatDecimalDouble( ( (double)r1.totalContacts*3600/r1.totalLoginTime), 2);
							
						 }
						 if(r1.RContacts >0)
						 {
						 netContRate = r1.formatDecimalDouble( ( (double)r1.NbSales*100/r1.RContacts), 2);
						 }
						 else
			 				netContRate ="0.00";
						 
						 
			
      out.write("\r\n");
      out.write("\t\t\t\t  <tr ");
 if(j%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(r1.agentId);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td   align=\"left\" >&nbsp;&nbsp;");
out.write(writeName);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(callsPerHour);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(totalContactsPerHour);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" >");
out.write(sallesPerHour);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" >");
out.write(refusalsPerHour);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(netContRate + "%");
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t<!-- end of array traversal-->\r\n");
      out.write("\t\t");

			callsPerHour ="0.00";sallesPerHour="0.00";refusalsPerHour="0.00";netContRate="0.00";totalContactsPerHour="0.00";
				totLoginTime += r1.totalLoginTime;
				totnbContacts += r1.NbContacts;
				totnbSucess += r1.NbSales;
				totnbRefusals += r1.NbNoSales;
				totRContacts += r1.RContacts;
				totalContacts += r1.totalContacts;
				//System.out.println("---------totnbSucess--------"+Long.toString(totnbSucess));
				//System.out.println("---------totRContacts--------"+Long.toString(totRContacts));
			  }
			r1 = new beanAgentPerformanceDetails();
			 if(totLoginTime !=0)
			 {
				 callsPerHour =r1.formatDecimalDouble( ( (double)totnbContacts*3600/totLoginTime), 2);
				 sallesPerHour = r1.formatDecimalDouble( ( (double)totnbSucess*3600/totLoginTime), 2);
				 refusalsPerHour = r1.formatDecimalDouble( ( (double)totnbRefusals*3600/totLoginTime), 2);
				 totalContactsPerHour = r1.formatDecimalDouble( ( (double)totalContacts*3600/totLoginTime), 2);
			}
			 if(totRContacts >0)
			 {
			 netContRate = r1.formatDecimalDouble( ( (double)totnbSucess*100/totRContacts), 2);
			 }
			 else
			 	netContRate ="0.00";


      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print( pageOutRData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(callsPerHour);
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(totalContactsPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t  <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(sallesPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(refusalsPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(netContRate+ "%");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
 pageOutRData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t");

			System.out.println("sRet: success");
		}
		else
			System.out.println("sRet: no success");
	}
	if(all_obj.compareTo("1")==0) 
	{
		
		sRet = beanAgentPerf.buildAgentPerformanceGrpDetailsReportForAll(tabObj,startingDate,endingDate,reportType);
		if(sRet == "success")
		{
			
      out.write("\r\n");
      out.write("\t\t\t");
      out.write('\r');
      out.write('\n');

////open connection to database///////
beanManagerData pageOutRdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageOutRdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageOutRdData.openConnection();

      out.write('\n');

long tLoginTime = 0, ssLoginTime =0, totLoginTime=0;
String tempLastName="", tempFirstName ="", LastName="", FirstName ="", writeName="";
long GroupForAgent =1, first =1;
long nbContacts=0, totnbContacts=0, nbSucess=0 ,totnbSucess=0 ,nbRefusals=0,totnbRefusals=0, nbCallsBacks=0, totnbCallsBacks =0,
	 RContacts =0, totRContacts=0, tContacts=0, TContacts=0;
String callsPerHour="0.00", sallesPerHour ="0.00", refusalsPerHour ="0.00", netContRate ="0.00", totalContactsPerHour ="0.00";


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
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\" ><font color=\"#003366\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageOutRdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageOutRdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageOutRdData.getWord("Yearly"));
								}
							
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageOutRdData.getWord("Outbound calls"));
      out.write("&nbsp;");
      out.print( pageOutRdData.getWord("Report"));
      out.write("&nbsp; ");
      out.print( pageOutRdData.getWord("From"));
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
      out.print( pageOutRdData.getWord("To"));
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
      out.write("\t\t\t\t\t\t</b></font>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( pageOutRdData.getWord("Data")
							);
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" >\r\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Agent ID"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"25%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Agent name"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Campaign"));
      out.write(" </b> </td>\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Total login time"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"10%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Total calls"));
      out.write(" </b> </td>\n");
      out.write("\t\t\t\t<td width=\"10%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Total contacts"));
      out.write(" </b> </td>\n");
      out.write("\t\t\t\t<td width=\"10%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Success"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"10%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Refusals"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"13%\"   align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Callbacks"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("<!-- traverse the array -->\r\n");
      out.write("\t\t\t");

			  for (j = 0; j < beanAgentPerf.m_vAllDetails.size(); j++)
			   {
				 r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_vAllDetails.elementAt(j);
				 if(r1.agentFullName != null) writeName=r1.agentFullName;
				 else writeName= " ";
				 if(r1.agentLastName != null) LastName=r1.agentLastName;
				 else LastName= " ";
				 if(r1.agentFirstName != null) FirstName =r1.agentFirstName;
				 else FirstName = " ";
				// System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
			   if(LastName.compareTo(tempLastName) == 0 && FirstName.compareTo(tempFirstName) ==0)
			   {	
					writeName =" ";
					GroupForAgent =GroupForAgent +1;
			   }
			  else
				{
				
					if(first ==0 && GroupForAgent >1) //previous agent has 2 group
					{
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
out.write("Sub total");
      out.write(" </b></font></td>\r\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(tempLastName+" "+tempFirstName);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(r1.buildReadableTime(tLoginTime));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(nbContacts));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(tContacts));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(nbSucess));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(nbRefusals));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(Long.toString(nbCallsBacks));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");

						GroupForAgent =1;
					}
					tLoginTime=0;nbContacts =0; nbSucess =0; nbRefusals =0; nbCallsBacks=0; tContacts=0;
					writeName =LastName+" "+FirstName;
			   } //fin else
				
      out.write("\r\n");
      out.write("\t\t  <tr ");
 if(j%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t  <td  align=\"center\">");
out.write(r1.agentId);
      out.write("</td>\r\n");
      out.write("\t\t\t  <td   align=\"left\" >&nbsp;&nbsp;");
out.write(writeName);
      out.write("</td>\r\n");
      out.write("\t\t\t  <td    align=\"center\" nowrap><font color=\"#800000\">");
out.write(r1.campaignName);
      out.write("</font></td>\r\n");
      out.write("\t\t\t  <td  align=\"center\">");
out.write(r1.getTotalLoginTime());
      out.write("</td>\r\n");
      out.write("\t\t\t  <td    align=\"center\" >");
out.write(Long.toString(r1.NbContacts));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td    align=\"center\" >");
out.write(Long.toString(r1.totalContacts));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td    align=\"center\" >");
out.write(Long.toString(r1.NbSales));
      out.write(" </td>\r\n");
      out.write("\t\t\t  <td  align=\"center\">");
out.write(Long.toString(r1.NbNoSales));
      out.write("</td>\r\n");
      out.write("\t\t\t  <td    align=\"center\" >");
out.write(Long.toString(r1.NbCallBacks));
      out.write(" </td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t<!-- end of array traversal-->\r\n");
      out.write("\t");

		tLoginTime += r1.totalLoginTime;
		tempLastName=LastName;  tempFirstName =FirstName;
		first =0;	
		totLoginTime += r1.totalLoginTime;
		totnbContacts += r1.NbContacts;
		nbContacts += r1.NbContacts;
		totnbSucess += r1.NbSales;
		nbSucess += r1.NbSales;
		totnbRefusals += r1.NbNoSales;
		nbRefusals += r1.NbNoSales;
		totnbCallsBacks += r1.NbCallBacks;
		nbCallsBacks += r1.NbCallBacks;
		tContacts += r1.totalContacts;
		TContacts += r1.totalContacts;
	  }
	r1 = new beanAgentPerformanceDetails();
	
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print( pageOutRdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(r1.buildReadableTime(totLoginTime));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(totnbContacts));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(TContacts));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(totnbSucess));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(totnbRefusals));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(Long.toString(totnbCallsBacks));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t\t");

								out.write(pageOutRdData.getWord("Statistics"));
								tLoginTime = 0; ssLoginTime =0; totLoginTime=0;
								tempLastName=""; tempFirstName =""; LastName=""; FirstName =""; writeName="";
								GroupForAgent =1; first =1;
								nbContacts=0; totnbContacts=0; nbSucess=0 ;totnbSucess=0 ;nbRefusals=0;totnbRefusals=0; nbCallsBacks=0; totnbCallsBacks =0;TContacts=0; tContacts=0;
								RContacts =0; totRContacts=0;
								callsPerHour="0.00"; sallesPerHour ="0.00"; refusalsPerHour ="0.00"; netContRate ="0.00"; totalContactsPerHour="0.00";
							
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t  <td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" >\r\n");
      out.write("\t\t\t\t<td width=\"12%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Agent ID"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"25%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Agent name"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"16%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Campaign"));
      out.write(" </b> </td>\n");
      out.write("\t\t\t\t<td width=\"10%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Calls/hour"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"10%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Contact/hour"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"10%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Sales/hour"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"10%\" align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Refusals/hour"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"13%\"   align=\"center\"> <b>");
      out.print( pageOutRdData.getWord("Net Conv. Rate"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("\t\t\t");

					  for (j = 0; j < beanAgentPerf.m_vAllDetails.size(); j++)
					   {
							r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_vAllDetails.elementAt(j);
							if(r1.agentFullName != null) writeName=r1.agentFullName;
							else writeName= " ";
							if(r1.agentLastName != null) LastName=r1.agentLastName;
							else LastName= " ";
							if(r1.agentFirstName != null) FirstName =r1.agentFirstName;
							else FirstName = " ";
							if(LastName.compareTo(tempLastName) == 0 && FirstName.compareTo(tempFirstName) ==0)
							{	
								writeName =" ";
								GroupForAgent =GroupForAgent +1;
							}
							else
							{
							
								if(first ==0 && GroupForAgent >1) //previous agent has 2 group
								{
									if(tLoginTime !=0)
									{
									 callsPerHour =r1.formatDecimalDouble( ( (double)nbContacts*3600/tLoginTime), 2);
									 sallesPerHour = r1.formatDecimalDouble( ( (double)nbSucess*3600/tLoginTime), 2);
									 refusalsPerHour = r1.formatDecimalDouble( ( (double)nbRefusals*3600/tLoginTime), 2);
									 totalContactsPerHour = r1.formatDecimalDouble( ( (double)tContacts*3600/tLoginTime), 2);
									}
									else
									{
										callsPerHour ="0.00";sallesPerHour="0.00";refusalsPerHour="0.00";totalContactsPerHour="0.00";
									}
									
									 if(RContacts >0)
									 {
									 netContRate = r1.formatDecimalDouble( ( (double)nbSucess*100/ RContacts), 2);
									 }
									 else
									 	netContRate ="0.00";

								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print( pageOutRdData.getWord("Sub total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(tempLastName+" "+tempFirstName);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(callsPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(totalContactsPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(sallesPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(refusalsPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(netContRate +"%");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

									GroupForAgent =1;
								}
								tLoginTime=0;nbContacts =0; nbSucess =0; nbRefusals =0; tContacts=0;
								RContacts =0;
								writeName =LastName+" "+FirstName;
							}
							if(r1.totalLoginTime !=0)
							{
							 callsPerHour =r1.formatDecimalDouble( ( (double)r1.NbContacts*3600/r1.totalLoginTime), 2);
							 sallesPerHour = r1.formatDecimalDouble( ( (double)r1.NbSales*3600/r1.totalLoginTime), 2);
							 refusalsPerHour = r1.formatDecimalDouble( ( (double)r1.NbNoSales*3600/r1.totalLoginTime), 2);
							 totalContactsPerHour = r1.formatDecimalDouble( ( (double)r1.totalContacts*3600/r1.totalLoginTime), 2);
							}
							else
							{
								callsPerHour ="0.00";sallesPerHour="0.00";refusalsPerHour="0.00";totalContactsPerHour="0.00";
							}
							 if(r1.RContacts >0)
							 {
							 netContRate = r1.formatDecimalDouble( ( (double)r1.NbSales*100/r1.RContacts), 2);
							 }
							 else
							 	netContRate ="0.00";
							
			
      out.write("\r\n");
      out.write("\t\t\t\t  <tr ");
 if(j%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\">");
out.write(r1.agentId);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td align=\"left\" >&nbsp;&nbsp;");
out.write(writeName);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\"><font color=\"#800000\">");
out.write(r1.campaignName);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\" >");
out.write(callsPerHour);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\" >");
out.write(totalContactsPerHour);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\" >");
out.write(sallesPerHour);
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\">");
out.write(refusalsPerHour);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td align=\"center\">");
out.write(netContRate + "%");
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t<!-- end of array traversal-->\r\n");
      out.write("\t\t");

				tLoginTime += r1.totalLoginTime;
				totLoginTime += r1.totalLoginTime;
				totnbContacts += r1.NbContacts;
				nbContacts += r1.NbContacts;
				totnbSucess += r1.NbSales;
				nbSucess += r1.NbSales;
				totnbRefusals += r1.NbNoSales;
				nbRefusals += r1.NbNoSales;
				RContacts += r1.RContacts;
				totRContacts += r1.RContacts;
				tempLastName=LastName;  tempFirstName =FirstName;
				first =0;	
				tContacts += r1.totalContacts;
				TContacts += r1.totalContacts;
				
				
			  }
			r1 = new beanAgentPerformanceDetails();
			 if(totLoginTime !=0)
			 {
				 callsPerHour =r1.formatDecimalDouble( ( (double)totnbContacts*3600/totLoginTime), 2);
				 sallesPerHour = r1.formatDecimalDouble( ( (double)totnbSucess*3600/totLoginTime), 2);
				 refusalsPerHour = r1.formatDecimalDouble( ( (double)totnbRefusals*3600/totLoginTime), 2);
				 totalContactsPerHour = r1.formatDecimalDouble( ( (double)TContacts*3600/totLoginTime), 2);
			 }
			else
			{
				callsPerHour ="0.00";sallesPerHour="0.00";refusalsPerHour="0.00"; totalContactsPerHour ="0.00";
			}
			 if(totRContacts >0)
			 {
			 netContRate = r1.formatDecimalDouble( ( (double)totnbSucess*100/totRContacts), 2);
			 }
			 else
			 	netContRate ="0.00";

      out.write("<!--\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print( pageOutRdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(callsPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(totalContactsPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(sallesPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(refusalsPerHour);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(netContRate + "%");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t</tr>-->\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
 pageOutRdData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t");

		}
		else
		System.out.println("sRet --------------"+sRet);


	}

      out.write("\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 pageOutData.closeConnection(); 
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
