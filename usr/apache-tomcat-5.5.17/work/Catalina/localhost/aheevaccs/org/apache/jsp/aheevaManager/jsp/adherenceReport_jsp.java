package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.schedule.*;
import java.io.*;
import java.io.File;
import java.io.RandomAccessFile;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import aheevaManager.csvinterface.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;
import aheevaManager.schedule.*;
import java.io.*;
import java.io.File;
import java.io.RandomAccessFile;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import aheevaManager.csvinterface.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;
import aheevaManager.schedule.*;
import java.io.*;
import java.io.File;
import java.io.RandomAccessFile;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import aheevaManager.csvinterface.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;

public final class adherenceReport_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/jsp/adherenceReportsDetails.jsp");
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
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();

      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Adherence Reports1</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/style_2.css\" />\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("\t/*width:      550px;*/\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html, body { \r\n");
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
      aheevaManager.schedule.beanAdherenceReport beanAgent = null;
      synchronized (request) {
        beanAgent = (aheevaManager.schedule.beanAdherenceReport) _jspx_page_context.getAttribute("beanAgent", PageContext.REQUEST_SCOPE);
        if (beanAgent == null){
          beanAgent = new aheevaManager.schedule.beanAdherenceReport();
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
	

    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
	String starting_year_yearly = request.getParameter("starting_year_yearly");
	String ending_year_yearly = request.getParameter("ending_year_yearly");
	String starting_month_monthly = request.getParameter("starting_month_monthly");
	String starting_year_monthly = request.getParameter("starting_year_monthly");
	String ending_month_monthly = request.getParameter("ending_month_monthly");
	String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String agents       = request.getParameter("objects");	
    String agtGroup      = request.getParameter("agtGrp");	
  	String orderBy 		 = request.getParameter("order");

    StringTokenizer tok = null;
	String[] tabObj =null;
	String sRet ="";
	
	String startingDate="", endingDate="";	
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

	String groups ="";
	String agentGroupTemp ="";
	 beanAdherenceDetails r1=null;
	int numCampaigns =0;
	
	//all groups
	if(agtGroup != null && agtGroup.substring(0,9).compareTo("AllGroups") == 0)
	{
		groups = agtGroup.substring(10);
		if(groups != null)
        	tok = new java.util.StringTokenizer(groups,"!");
    	else
        	tok = new java.util.StringTokenizer("","/");
		numCampaigns = tok.countTokens();
		tabObj =new String[numCampaigns];
		for (int w =0; w < numCampaigns; w++)
		{
			tabObj[w] = tok.nextToken();
		}	
		agentGroupTemp = tabObj[Integer.parseInt(current)];
	
    }
	if(agentGroupTemp.length() ==0) //one group
	{
		agentGroupTemp =agtGroup;
	}
	

      out.write("\r\n");
      out.write("<div class=\"img-control\">\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t");

		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0 && agents.compareTo("AllAgents")== 0 && agtGroup.substring(0,9).compareTo("AllGroups") == 0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"33%\" align=\"center\"><a href=\"adherenceReport1.jsp?startingDateDaily=");
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
out.write(agents);
      out.write("&agtGrp=");
out.write(agtGroup);
      out.write("&order=");
out.write(orderBy);
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
      out.print( pageData.getWord("Previous"));
      out.write("</a>\t\t</td>\r\n");
      out.write("\t");

	}
	if(numCampaigns >1 && all_obj.compareTo("0") ==0 && agents.compareTo("AllAgents")== 0 && agtGroup.substring(0,9).compareTo("AllGroups") == 0)
	{
	
      out.write("\r\n");
      out.write("\t\t<td width=\"33%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"adherenceReport1.jsp?startingDateDaily=");
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
out.write(agents) ;
      out.write("&agtGrp=");
out.write(agtGroup);
      out.write("&order=");
out.write(orderBy);
      out.write("&prec=-1&suiv=1&current=0&all_obj=1&lang=");
out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print( pageData.getWord("All"));
      out.write("</a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	String nb_obj = Integer.toString(numCampaigns);
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0 && agents.compareTo("AllAgents")== 0 && agtGroup.substring(0,9).compareTo("AllGroups") == 0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"33%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"adherenceReport1.jsp?startingDateDaily=");
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
out.write(agents) ;
      out.write("&agtGrp=");
out.write(agtGroup);
      out.write("&order=");
out.write(orderBy);
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
      out.print( pageData.getWord("Next"));
      out.write("</a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\r\n");
      out.write("<form name=\"loginReports\">\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t<fieldset>\r\n");

String agt_full_name ="";
if(all_obj.compareTo("0")==0) // un campaign
{    
	if(agents.compareTo("AllAgents")!= 0)
	{
		sRet = beanAgent.getAdherence(agents,startingDate,endingDate,reportType, "agent",orderBy);
		agt_full_name =beanAgent.getAgentFullName(agents);
	}
	else //all Agent
	{
		sRet = beanAgent.getAdherence(agentGroupTemp,startingDate,endingDate,reportType, "group",orderBy);
		//getAdherenceForGroup(agentGroupTemp,startingDate,endingDate,reportType);
	}
	
	if(sRet == "success")
	{
	    System.out.println("sRet == success");
		
      out.write("\r\n");
      out.write("\t\t");
      out.write("<head>\r\n");
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
beanManagerData pageadRData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageadRData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageadRData.openConnection();

      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");

long num_no_adherence = 0;
long num_adherence = 0;
long tot_num_no_adherence = 0;
long tot_num_adherence = 0;
boolean needOneMoreTotalRow= false;


      out.write("\r\n");
      out.write("<body>\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>");

					  	if(agents.compareTo("AllAgents")!= 0) //one agent
							out.write(agt_full_name);
						else //alle agent
							out.write(agentGroupTemp);
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\r\n");
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
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageadRData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageadRData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageadRData.getWord("Yearly"));	
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageadRData.getWord("Agent Adherence Reports"));
      out.write("</b><br><br>\n");
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
      out.print( pageadRData.getWord("To"));
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
      out.write("\t\t\t<table width=\"80%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" >\r\n");
      out.write("\t\t\t  ");
  if(agents.compareTo("AllAgents")!= 0){ //one agent 
      out.write("\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageadRData.getWord("Date"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print(pageadRData.getWord("Agent adherence"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  ");
}
			  	else{ 
      out.write("\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageadRData.getWord("Date"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageadRData.getWord("Agent"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageadRData.getWord("Agent adherence"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  \t");
}
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("<!-- traverse the array -->\r\n");
      out.write("\t\t\t");

				int i=0 ;
				int j =0;
				for (i = 0; i < beanAgent.m_schedDailyAdherence.size(); i++)
				{
				
				r1 = (beanAdherenceDetails)beanAgent.m_schedDailyAdherence.elementAt(i);
				//System.out.println("i == "+i +" Time == " + r1.time + " otherMonthYear ==  " + Boolean.toString(r1.otherMonthYear) +" j == "+j ) ;				
				if(agents.compareTo("AllAgents")!= 0)
				{
					
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.getAdherence());
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

					num_no_adherence += r1.num_no_adherence;
					num_adherence += r1.num_adherence;			
					tot_num_no_adherence +=r1.num_no_adherence;
					tot_num_adherence +=r1.num_adherence;	
					j ++;
					
				}	
				else
				{
					
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.name);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.getAdherence());
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

					num_no_adherence += r1.num_no_adherence;
					num_adherence += r1.num_adherence;			
					tot_num_no_adherence +=r1.num_no_adherence;
					tot_num_adherence +=r1.num_adherence;	
					j ++;
					} //fin else
				}	//fin for
				r1 = new beanAdherenceDetails();
				if(agents.compareTo("AllAgents")!= 0){
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(pageadRData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.getAdherenceFromNyesNno(tot_num_adherence,tot_num_no_adherence));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

				}
				else
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(pageadRData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("  ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.getAdherenceFromNyesNno(tot_num_adherence,tot_num_no_adherence));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

				}
				
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pageadRData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t");

	}
	else
		System.out.println("sRet no success");

}
else if(agtGroup.substring(0,9).compareTo("AllGroups") == 0)
{
	for(int w =0; w < numCampaigns ; w ++)
	{
		agentGroupTemp = tabObj[w];
		sRet = beanAgent.getAdherence(agentGroupTemp,startingDate,endingDate,reportType, "group",orderBy);
		if(sRet == "success")
		{
			System.out.println("sRet == success");
			
      out.write("\r\n");
      out.write("\t\t\t");
      out.write("<head>\r\n");
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
beanManagerData pageadRData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageadRData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageadRData.openConnection();

      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");

long num_no_adherence = 0;
long num_adherence = 0;
long tot_num_no_adherence = 0;
long tot_num_adherence = 0;
boolean needOneMoreTotalRow= false;


      out.write("\r\n");
      out.write("<body>\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"80%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t  <b>");

					  	if(agents.compareTo("AllAgents")!= 0) //one agent
							out.write(agt_full_name);
						else //alle agent
							out.write(agentGroupTemp);
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\r\n");
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
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageadRData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageadRData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageadRData.getWord("Yearly"));	
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageadRData.getWord("Agent Adherence Reports"));
      out.write("</b><br><br>\n");
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
      out.print( pageadRData.getWord("To"));
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
      out.write("\t\t\t<table width=\"80%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" >\r\n");
      out.write("\t\t\t  ");
  if(agents.compareTo("AllAgents")!= 0){ //one agent 
      out.write("\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageadRData.getWord("Date"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print(pageadRData.getWord("Agent adherence"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  ");
}
			  	else{ 
      out.write("\r\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageadRData.getWord("Date"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageadRData.getWord("Agent"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageadRData.getWord("Agent adherence"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  \t");
}
      out.write("\r\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("<!-- traverse the array -->\r\n");
      out.write("\t\t\t");

				int i=0 ;
				int j =0;
				for (i = 0; i < beanAgent.m_schedDailyAdherence.size(); i++)
				{
				
				r1 = (beanAdherenceDetails)beanAgent.m_schedDailyAdherence.elementAt(i);
				//System.out.println("i == "+i +" Time == " + r1.time + " otherMonthYear ==  " + Boolean.toString(r1.otherMonthYear) +" j == "+j ) ;				
				if(agents.compareTo("AllAgents")!= 0)
				{
					
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.getAdherence());
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

					num_no_adherence += r1.num_no_adherence;
					num_adherence += r1.num_adherence;			
					tot_num_no_adherence +=r1.num_no_adherence;
					tot_num_adherence +=r1.num_adherence;	
					j ++;
					
				}	
				else
				{
					
      out.write("\r\n");
      out.write("\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.time);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.name);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.getAdherence());
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

					num_no_adherence += r1.num_no_adherence;
					num_adherence += r1.num_adherence;			
					tot_num_no_adherence +=r1.num_no_adherence;
					tot_num_adherence +=r1.num_adherence;	
					j ++;
					} //fin else
				}	//fin for
				r1 = new beanAdherenceDetails();
				if(agents.compareTo("AllAgents")!= 0){
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(pageadRData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.getAdherenceFromNyesNno(tot_num_adherence,tot_num_no_adherence));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

				}
				else
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(pageadRData.getWord("Total"));
      out.write("</b></font></td>\n");
      out.write("\t\t\t\t\t<td   bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write("  ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t<td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b>");
out.write(r1.getAdherenceFromNyesNno(tot_num_adherence,tot_num_no_adherence));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

				}
				
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pageadRData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t");

		}
		else
		System.out.println("sRet --------------"+sRet);
	}

}

      out.write("\t\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pageData.closeConnection(); 
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
