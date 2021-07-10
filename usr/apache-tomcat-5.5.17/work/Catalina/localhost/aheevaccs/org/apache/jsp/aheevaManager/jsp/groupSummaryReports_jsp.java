package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import aheevaManager.reports.*;
import aheevaManager.ressources.*;
import java.lang.*;
import aheevaManager.ressources.*;
import java.lang.*;
import aheevaManager.ressources.*;

public final class groupSummaryReports_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/jsp/groupSummaryReportsDetails.jsp");
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

beanManagerData pageSumRepData = new beanManagerData();
pageSumRepData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSumRepData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Group Summary Report</title>\n");
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
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      aheevaManager.reports.beanSummaryReport beanGroupSummary = null;
      synchronized (request) {
        beanGroupSummary = (aheevaManager.reports.beanSummaryReport) _jspx_page_context.getAttribute("beanGroupSummary", PageContext.REQUEST_SCOPE);
        if (beanGroupSummary == null){
          beanGroupSummary = new aheevaManager.reports.beanSummaryReport();
          _jspx_page_context.setAttribute("beanGroupSummary", beanGroupSummary, PageContext.REQUEST_SCOPE);
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
    String groups  = request.getParameter("objects");
	String startingDateDaily = request.getParameter("startingDateDaily");
	String endingDateDaily = request.getParameter("endingDateDaily");
	String spacing =request.getParameter("spacing");
	String[] tabObj =null;
    StringTokenizer tok = null, tokGrp =null;
   
	String startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
	String endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) +" 23:59:59";
	String from ="";
    if(groups != null)
	{
        tok = new java.util.StringTokenizer(groups,"/");
    }
	else{
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
	String  sret="";   
	if(all_obj.compareTo("0")==0) // un group
	{
		group =tabObj[Integer.parseInt(current)];
		tokGrp = new java.util.StringTokenizer(group,",");
		groupName =tokGrp.nextToken();
		groupId = tokGrp.nextToken();
	}	
	beanSummaryInfos r1=null;

      out.write("\r\n");
      out.write("<div class=\"img-control\">\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printGroupSummaryReport.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ; 
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
      out.write("\t\t<td width=\"50%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"groupSummaryReports.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ; 
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
      out.print( pageSumRepData.getWord("Previous"));
      out.write("</a>\t\t</td>\n");
      out.write("\t");

	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	
      out.write("\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"groupSummaryReports.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ;
      out.write("&objects=");
out.write(groups) ;
      out.write("&prec=-1&suiv=1&current=0&all_obj=1&lang=");
out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print( pageSumRepData.getWord("All"));
      out.write("</a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}	
	String nb_obj = Integer.toString(numObjects);
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"50%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"groupSummaryReports.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ; 
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
      out.print( pageSumRepData.getWord("Next"));
      out.write("</a>\n");
      out.write("\t\t</td>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\r\n");
      out.write("<form name=\"groupsummaryReports\">\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t<fieldset>");

if(all_obj.compareTo("0")==0) // one group 
{
		group =tabObj[Integer.parseInt(current)];
		tokGrp = new java.util.StringTokenizer(group,",");
		groupName =tokGrp.nextToken();
		groupId = tokGrp.nextToken();
		
	sret = beanGroupSummary.buildGroupSummaryForPeriod(groupId,startingDate,endingDate);
	if(sret == "success")
	{
		System.out.println("sret == success");
		
      out.write("\r\n");
      out.write("\t\t");
      out.write("\n");
      out.write("\r\n");
      out.write("\r\n");

beanManagerData pageSumRepdData = new beanManagerData();
pageSumRepdData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSumRepdData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var lang =normalizeString(QueryString('lang'));\n");
      out.write("</script>\n");


	long [] totNotReadyReason =null;
 	long tot_loginTime = 0;
 	long tot_talkTime = 0;
 	long totOthers= 0; 
 	long talk_time = 0;
 	long wrap_time = 0;
	long tot_holdTime = 0;
	long tot_waitTime = 0;
	long tot_wrapTime = 0;
 	


      out.write("\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr>\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\"><b>");

			try { out.write(groupName); } catch(Exception e) { out.write(""); } 
      out.write('\n');
      out.write('	');
      out.write('[');
 out.println(groupId); 
      out.write("]\n");
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
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\"> \n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageSumRepdData.getWord("Daily Report for"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t&nbsp;&nbsp; ");
	
							out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageSumRepdData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							
      out.write("\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("<tr><td height=\"20\"></td></tr>\n");

			String lg_table="";
			int nb_NRR = beanGroupSummary.m_vAllNRR.size();
			if(nb_NRR < 6) lg_table = Integer.toString(100 -(6-nb_NRR)*10)+"%";
			else  lg_table = Integer.toString(100)+"%";

      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t  <td width=\"100%\" align=\"center\"><table  width=\"");
out.write(lg_table);
      out.write("\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("        <tr class=\"reportsForecastReport\" height=\"25\">\n");
      out.write("          <td align=\"center\" >");
      out.print( pageSumRepdData.getWord("Date"));
      out.write("</td>\n");
      out.write("          <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Login time"));
      out.write("</td>\n");
      out.write("          ");

			
					totNotReadyReason = new long[beanGroupSummary.m_vAllNRR.size()];
					for(int k =0; k < beanGroupSummary.m_vAllNRR.size(); k++)
					{ 
					  totNotReadyReason[k]=0;
					
      out.write("\n");
      out.write("          <td align=\"center\" >");
      out.print(beanGroupSummary.m_vAllNRR.elementAt(k) );
      out.write("</td>\n");
      out.write("          ");

					}	
				
				
      out.write("\n");
      out.write("          <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Talk time"));
      out.write("</td>\n");
      out.write("\t\t  <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Wrap up time"));
      out.write("</td>\n");
      out.write("          <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Hold time"));
      out.write("</td>\n");
      out.write("          <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
      out.print( pageSumRepdData.getWord("Others"));
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        ");

				String key="";
				HashMap mapNRR = (HashMap)beanGroupSummary.mapNrr;
			  	for(int i =0; i < beanGroupSummary.key_vector.size() ; i++ )
				{
					r1 = (beanSummaryInfos)beanGroupSummary.m_vAllData.get(beanGroupSummary.key_vector.elementAt(i));
					 if(r1 !=null)
					 {
					 
						talk_time =r1.totTalkTime_in + r1.totTalkTime_out ;
						wrap_time =r1.totWrapTime_in + r1.totWrapTime_out ;
						tot_holdTime +=r1.totHoldTime ;
						tot_waitTime +=r1.totWaitTime ;
						tot_loginTime +=r1.totLoginTime;
						tot_talkTime +=talk_time;
						tot_wrapTime +=wrap_time;
						totOthers +=r1.totOthers_evtTime;
					
      out.write("\n");
      out.write("        <tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");
      out.write(">\n");
      out.write("          <td  align=\"center\">");
out.write(r1.reportDate);
      out.write("</td>\n");
      out.write("          <td align=\"center\" >");
out.write(r1.buildReadableTime(r1.totLoginTime));
      out.write("</td>\n");
      out.write("          ");

				//get NRRR
				for (int n = 0; n < beanGroupSummary.m_vAllNRR.size(); n++) 
				{
					String nreadyreason = (String)beanGroupSummary.m_vAllNRR.elementAt(n);
					String nrr_key=r1.reportDate+"_"+nreadyreason;
					//System.out.println("---totRRRTime =["+ r1.totRRRTime+"]  ");
					beanSummaryReport.nrrdata tmpNrrElt = (beanSummaryReport.nrrdata)mapNRR.get(nrr_key);
					if (tmpNrrElt != null) 
					{
						
      out.write("\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" >");
out.write( r1.buildReadableTime(tmpNrrElt.nrrtime)); 
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t  ");
						
						totNotReadyReason[n] += tmpNrrElt.nrrtime;	
					}
					else
					{
						
      out.write("<td align=\"center\" >");
out.write("00:00:00"); 
      out.write("</td>");

					}
				}		  
			
      out.write("\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(talk_time));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(wrap_time));
      out.write("</td>\n");
      out.write("\t\t  <td align=\"center\">");
out.write(r1.buildReadableTime(r1.totHoldTime ));
      out.write("</td>\n");
      out.write("\t\t  <td align=\"center\">");
out.write(r1.buildReadableTime(r1.totWaitTime ));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(r1.totOthers_evtTime ));
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        ");

					}
				}
			   r1 =new beanSummaryInfos();
			  
      out.write("\n");
      out.write("\t\t\t<tr  bgcolor=\"#FFECF5\" >\n");
      out.write("\t\t\t\t<td align=\"center\" ><b>");
      out.print( pageSumRepdData.getWord("Total"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" >");
out.write(r1.buildReadableTime(tot_loginTime));
      out.write("</td>\n");
      out.write("          ");

				//get NRRR
				for (int n = 0; n < beanGroupSummary.m_vAllNRR.size(); n++) 
				{
				
      out.write("\n");
      out.write("\t\t\t\t<td align=\"center\" >");
out.write( r1.buildReadableTime(totNotReadyReason[n])); 
      out.write("</td>\n");
      out.write("\t\t\t\t  ");
						
				}		  
			
      out.write("\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(tot_talkTime));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(tot_wrapTime));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(tot_holdTime));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(tot_waitTime));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(totOthers));
      out.write("</td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("      </table></td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
 pageSumRepdData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t");
 
	}
}	
else
{
	for(int obj =0; obj< numObjects; obj++)
	{
		group =tabObj[obj];
		tokGrp = new java.util.StringTokenizer(group,",");
		groupName =tokGrp.nextToken();
		groupId = tokGrp.nextToken();
		sret = beanGroupSummary.buildGroupSummaryForPeriod(groupId,startingDate,endingDate);
		if(sret == "success")
		{
			System.out.println("sret == success");
			
      out.write("\r\n");
      out.write("\t\t\t");
      out.write("\n");
      out.write("\r\n");
      out.write("\r\n");

beanManagerData pageSumRepdData = new beanManagerData();
pageSumRepdData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSumRepdData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var lang =normalizeString(QueryString('lang'));\n");
      out.write("</script>\n");


	long [] totNotReadyReason =null;
 	long tot_loginTime = 0;
 	long tot_talkTime = 0;
 	long totOthers= 0; 
 	long talk_time = 0;
 	long wrap_time = 0;
	long tot_holdTime = 0;
	long tot_waitTime = 0;
	long tot_wrapTime = 0;
 	


      out.write("\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr>\n");
      out.write("\t<tr><td width=\"100%\" align=\"center\"><b>");

			try { out.write(groupName); } catch(Exception e) { out.write(""); } 
      out.write('\n');
      out.write('	');
      out.write('[');
 out.println(groupId); 
      out.write("]\n");
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
      out.write("\t\t\t\t\t<td  class=\"reportsID\" width=\"100%\" align=\"center\"> \n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageSumRepdData.getWord("Daily Report for"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t&nbsp;&nbsp; ");
	
							out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageSumRepdData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t");

							out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							
      out.write("\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("<tr><td height=\"20\"></td></tr>\n");

			String lg_table="";
			int nb_NRR = beanGroupSummary.m_vAllNRR.size();
			if(nb_NRR < 6) lg_table = Integer.toString(100 -(6-nb_NRR)*10)+"%";
			else  lg_table = Integer.toString(100)+"%";

      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t  <td width=\"100%\" align=\"center\"><table  width=\"");
out.write(lg_table);
      out.write("\" align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("        <tr class=\"reportsForecastReport\" height=\"25\">\n");
      out.write("          <td align=\"center\" >");
      out.print( pageSumRepdData.getWord("Date"));
      out.write("</td>\n");
      out.write("          <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Login time"));
      out.write("</td>\n");
      out.write("          ");

			
					totNotReadyReason = new long[beanGroupSummary.m_vAllNRR.size()];
					for(int k =0; k < beanGroupSummary.m_vAllNRR.size(); k++)
					{ 
					  totNotReadyReason[k]=0;
					
      out.write("\n");
      out.write("          <td align=\"center\" >");
      out.print(beanGroupSummary.m_vAllNRR.elementAt(k) );
      out.write("</td>\n");
      out.write("          ");

					}	
				
				
      out.write("\n");
      out.write("          <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Talk time"));
      out.write("</td>\n");
      out.write("\t\t  <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Wrap up time"));
      out.write("</td>\n");
      out.write("          <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Hold time"));
      out.write("</td>\n");
      out.write("          <td  align=\"center\">");
      out.print( pageSumRepdData.getWord("Waiting time"));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
      out.print( pageSumRepdData.getWord("Others"));
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        ");

				String key="";
				HashMap mapNRR = (HashMap)beanGroupSummary.mapNrr;
			  	for(int i =0; i < beanGroupSummary.key_vector.size() ; i++ )
				{
					r1 = (beanSummaryInfos)beanGroupSummary.m_vAllData.get(beanGroupSummary.key_vector.elementAt(i));
					 if(r1 !=null)
					 {
					 
						talk_time =r1.totTalkTime_in + r1.totTalkTime_out ;
						wrap_time =r1.totWrapTime_in + r1.totWrapTime_out ;
						tot_holdTime +=r1.totHoldTime ;
						tot_waitTime +=r1.totWaitTime ;
						tot_loginTime +=r1.totLoginTime;
						tot_talkTime +=talk_time;
						tot_wrapTime +=wrap_time;
						totOthers +=r1.totOthers_evtTime;
					
      out.write("\n");
      out.write("        <tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");
      out.write(">\n");
      out.write("          <td  align=\"center\">");
out.write(r1.reportDate);
      out.write("</td>\n");
      out.write("          <td align=\"center\" >");
out.write(r1.buildReadableTime(r1.totLoginTime));
      out.write("</td>\n");
      out.write("          ");

				//get NRRR
				for (int n = 0; n < beanGroupSummary.m_vAllNRR.size(); n++) 
				{
					String nreadyreason = (String)beanGroupSummary.m_vAllNRR.elementAt(n);
					String nrr_key=r1.reportDate+"_"+nreadyreason;
					//System.out.println("---totRRRTime =["+ r1.totRRRTime+"]  ");
					beanSummaryReport.nrrdata tmpNrrElt = (beanSummaryReport.nrrdata)mapNRR.get(nrr_key);
					if (tmpNrrElt != null) 
					{
						
      out.write("\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" >");
out.write( r1.buildReadableTime(tmpNrrElt.nrrtime)); 
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t  ");
						
						totNotReadyReason[n] += tmpNrrElt.nrrtime;	
					}
					else
					{
						
      out.write("<td align=\"center\" >");
out.write("00:00:00"); 
      out.write("</td>");

					}
				}		  
			
      out.write("\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(talk_time));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(wrap_time));
      out.write("</td>\n");
      out.write("\t\t  <td align=\"center\">");
out.write(r1.buildReadableTime(r1.totHoldTime ));
      out.write("</td>\n");
      out.write("\t\t  <td align=\"center\">");
out.write(r1.buildReadableTime(r1.totWaitTime ));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(r1.totOthers_evtTime ));
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        ");

					}
				}
			   r1 =new beanSummaryInfos();
			  
      out.write("\n");
      out.write("\t\t\t<tr  bgcolor=\"#FFECF5\" >\n");
      out.write("\t\t\t\t<td align=\"center\" ><b>");
      out.print( pageSumRepdData.getWord("Total"));
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td align=\"center\" >");
out.write(r1.buildReadableTime(tot_loginTime));
      out.write("</td>\n");
      out.write("          ");

				//get NRRR
				for (int n = 0; n < beanGroupSummary.m_vAllNRR.size(); n++) 
				{
				
      out.write("\n");
      out.write("\t\t\t\t<td align=\"center\" >");
out.write( r1.buildReadableTime(totNotReadyReason[n])); 
      out.write("</td>\n");
      out.write("\t\t\t\t  ");
						
				}		  
			
      out.write("\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(tot_talkTime));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(tot_wrapTime));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(tot_holdTime));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(tot_waitTime));
      out.write("</td>\n");
      out.write("          <td align=\"center\">");
out.write(r1.buildReadableTime(totOthers));
      out.write("</td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("      </table></td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
 pageSumRepdData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t\t");
 
		}		
	}
}


      out.write("\r\n");
      out.write("\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 pageSumRepData.closeConnection(); 
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
