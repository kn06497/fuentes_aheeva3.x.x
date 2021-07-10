package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import aheevaManager.reports.*;
import aheevaManager.reports.*;
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
import aheevaManager.reports.*;
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

public final class printAgentLoginReport_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/aheevaManager/jsp/agentLoginReportsDetails.jsp");
    _jspx_dependants.add("/aheevaManager/jsp/agentLoginReportsDetailsAll.jsp");
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

      out.write("<html>\r\n");
      out.write("<LINK href=\"../Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Print Agent Login Reports</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/style_2.css\" />\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      aheevaManager.reports.beanAgentLoginReport beanAgentLoginReport = null;
      synchronized (request) {
        beanAgentLoginReport = (aheevaManager.reports.beanAgentLoginReport) _jspx_page_context.getAttribute("beanAgentLoginReport", PageContext.REQUEST_SCOPE);
        if (beanAgentLoginReport == null){
          beanAgentLoginReport = new aheevaManager.reports.beanAgentLoginReport();
          _jspx_page_context.setAttribute("beanAgentLoginReport", beanAgentLoginReport, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

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
    String startingDate="";
    String endingDate="";
    String reportType   = request.getParameter("reportType");
    String agentGroups  = request.getParameter("objects");
    StringTokenizer tok = null, tokGrp=null;
	String[] tabObj =null;
	String from = request.getParameter("from");

    if(reportType.compareTo("Daily") ==0){
		startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
		endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    }else if (reportType.compareTo("Monthly") ==0){
		startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
		endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;					
    }else if (reportType.compareTo("Yearly") == 0){
		startingDate = starting_year_yearly + "-01-01" + " 00:00:00" ;
		endingDate = ending_year_yearly + "-12-31"+ " 23:59:59" ;
    }

    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    int i,j,k;
    String agents = "",myagt="";
    beanAgentLoginInfo r1=null;
    int numCampaigns = tok.countTokens();
	tabObj =new String[numCampaigns];
	for (int w =0; w < numCampaigns; w++)
	{
		tabObj[w] = tok.nextToken();
	}
 String agentGroupTemp ="", agentGroupName ="", agentGroup="", sRet="";
if(all_obj.compareTo("0")==0) // un campaign
{
	agentGroupTemp = tabObj[Integer.parseInt(current)];
	tokGrp = new java.util.StringTokenizer(agentGroupTemp,",");
	agentGroupName =tokGrp.nextToken();
	agentGroup = tokGrp.nextToken();
	System.out.println("Agent Login report for group: " + agentGroupName);
    sRet = beanAgentLoginReport.buildAgentGroupLoginReport(agentGroup,startingDate,endingDate,reportType);
	if(sRet == "success")
	{
		
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');

long tLoginTime = 0;
String LastName="", FirstName ="", writeName="";


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
beanManagerData pageLogdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageLogdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageLogdData.openConnection();

      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
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
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageLogdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageLogdData.getWord("Monthly"));					
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageLogdData.getWord("Yearly"));		
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<b>");
      out.print( pageLogdData.getWord("Agent Login Reports"));
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
      out.print( pageLogdData.getWord("To"));
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
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageLogdData.getWord("Agent ID"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageLogdData.getWord("Agent name"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageLogdData.getWord("First login"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageLogdData.getWord("Last Logout"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageLogdData.getWord("Total login time"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("<!-- traverse the array -->\r\n");
      out.write("\t\t\t");

					  for (j = 0; j < beanAgentLoginReport.m_gAllDetails.size(); j++)
					   {
					   //System.out.println("j =="+j);
						 r1 = (beanAgentLoginInfo)beanAgentLoginReport.m_gAllDetails.elementAt(j);
						 if(r1.last_name != null) LastName=r1.last_name;
						 else LastName= " ";
						 if(r1.first_name != null) FirstName =r1.first_name;
						 else FirstName = " ";
						 writeName =LastName+" "+FirstName;
						 System.out.println("j =="+j+" writeName");
						 
			
      out.write("\r\n");
      out.write("\t\t\t\t  <tr ");
 if(j%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(r1.agt_id);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td   align=\"left\" nowrap>&nbsp;&nbsp;");
out.write(writeName);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" nowrap>");
 out.write(r1.getFirstLoginTime());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" nowrap>");
out.write(r1.getLastLogoutTime());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(r1.getTotalLoginTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t<!-- end of array traversal-->\r\n");
      out.write("\t\t");

			   tLoginTime += r1.totalLoginTime;
			   if(r1.getLastLogoutTime().compareTo("Unknow")==0)
			   {
			   System.out.println("\n begin lastLogoutTime==Unknow");
			   
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#DCEDED\" align=\"right\" colspan=\"3\"><font color=\"#000000\"><b>\r\n");
      out.write("\t\t\t\t\t ");
out.write(" Next logout ");
      out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#DCEDED\" align=\"center\">");
out.write(r1.getNextLogoutTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#DCEDED\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t   ");

			   System.out.println("\n end lastLogoutTime==Unknow");
			   }
			 }
			r1 = new beanAgentLoginInfo();
		  System.out.println("fin for");
		  if(r1 !=null)
		  {
		  System.out.println("r1 !=null");

      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b>");
      out.print( pageLogdData.getWord("Total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(r1.buildReadableTime(tLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");
 }
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
 pageLogdData.closeConnection(); 
      out.write('\n');
      out.write('\r');
      out.write('\n');

	}
}
else
{
    sRet = beanAgentLoginReport.buildAgentGroupLoginReportForAll(tabObj,startingDate,endingDate,reportType);
		
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

////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();

long tLoginTime = 0, ssLoginTime =0, totLoginTime=0;
String tempLastName="", tempFirstName ="", LastName="", FirstName ="", writeName="";
long GroupForAgent =1, first =1;

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t<table width=\"90%\" align=\"center\">\r\n");
      out.write("\t\t\t\t<tr><td height=\"30\"></td></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\" ><font color=\"#003366\">\r\n");
      out.write("\t\t\t\t\t\t<b>");
 
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageData.getWord("Yearly"));
								}
						 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageData.getWord("Agent Login Reports"));
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
      out.print( pageData.getWord("To"));
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
      out.write("\t\t\t<table width=\"90%\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\r\n");
      out.write("\t\t\t  <tr class=\"reportsTabName\" >\r\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\"> <b>");
      out.print( pageData.getWord("Agent ID"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\"> <b>");
      out.print( pageData.getWord("Agent name"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\"> <b>");
      out.print( pageData.getWord("Group name"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageData.getWord("First login"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"20%\" align=\"center\"> <b>");
      out.print( pageData.getWord("Last Logout"));
      out.write("</b> </td>\n");
      out.write("\t\t\t\t<td width=\"15%\" align=\"center\"> <b>");
      out.print( pageData.getWord("Total login time"));
      out.write("</b> </td>\n");
      out.write("\t\t\t  </tr>\r\n");
      out.write("<!-- traverse the array -->\r\n");
      out.write("\t\t\t");

				try {
					  for (j = 0; j < beanAgentLoginReport.m_vAllDetails.size(); j++)
					   {
						 r1 = (beanAgentLoginInfo)beanAgentLoginReport.m_vAllDetails.elementAt(j);
						 //if(r1 ==null) System.out.println("r1 ==null");
						 //else System.out.println("r1 !=null");
						 if(r1.last_name != null) LastName=r1.last_name;
						 else LastName= " ";
						 if(r1.first_name != null) FirstName =r1.first_name;
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
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font color=\"#000000\"><b> ");
      out.print( pageData.getWord("Sub total"));
      out.write(" </b></font></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(tempLastName+" "+tempFirstName);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\">");
out.write(" ");
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t <td bgcolor=\"#FFECF5\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(r1.buildReadableTime(tLoginTime));
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t");

								GroupForAgent =1;
							}
							tLoginTime=0;
							writeName =LastName+" "+FirstName;
					   }
						
      out.write("\r\n");
      out.write("\t\t\t\t  <tr ");
 if(j%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(r1.agt_id);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td   align=\"left\" nowrap>&nbsp;&nbsp;");
out.write(writeName);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" nowrap><font color=\"#800000\">");
out.write(r1.grp_name);
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" nowrap>");
out.write(r1.getFirstLoginTime());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td    align=\"center\" nowrap>");
out.write(r1.getLastLogoutTime());
      out.write(" </td>\r\n");
      out.write("\t\t\t\t\t  <td  align=\"center\">");
out.write(r1.getTotalLoginTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t<!-- end of array traversal-->\r\n");
      out.write("\t\t");

			   if(r1.getLastLogoutTime().compareTo("Unknow")==0)
			   {
			   System.out.println("\n begin lastLogoutTime==Unknow");
			   
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#DCEDED\" align=\"right\" colspan=\"4\"><font color=\"#000000\"><b>\r\n");
      out.write("\t\t\t\t\t ");
      out.print( pageData.getWord("Next logout"));
      out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#DCEDED\" align=\"center\">");
out.write(r1.getNextLogoutTime());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t <td bgcolor=\"#DCEDED\" align=\"center\"><font  color=\"#000000\"><b> ");
out.write(" ");
      out.write("</b></font></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t   ");

			   System.out.println("\n end lastLogoutTime==Unknow");
			   }
		
			   tLoginTime += r1.totalLoginTime;
			   tempLastName=LastName;  tempFirstName =FirstName;
				first =0;	
			   if(GroupForAgent >1)
			   		System.out.println("GroupForAgent " + Long.toString(GroupForAgent));
			  } //end for
			//r1 = new beanAgentLoginInfo();
		  }//end try
		  catch( Exception e){
				out.write("<tr><td><p><font size=2>"+ pageData.getWord("Error while generating agent login report") +" </font></p></td></tr>");
		  }// end catch
		  catch (Error e){
				out.write(" ");
		  }

      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
 pageData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t");

}

      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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
