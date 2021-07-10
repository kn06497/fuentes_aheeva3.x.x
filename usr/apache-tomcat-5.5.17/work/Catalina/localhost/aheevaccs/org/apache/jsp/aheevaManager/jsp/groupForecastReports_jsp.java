package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import aheevaManager.reports.*;
import java.text.*;
import java.lang.*;
import aheevaManager.wfm.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
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

public final class groupForecastReports_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/jsp/groupForecastReportsDetails.jsp");
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

beanManagerData pageForecastData = new beanManagerData();
pageForecastData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageForecastData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Agent Group Forecast Report1</title>\n");
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
      aheevaManager.reports.beanForecastReport beanGroupForecast = null;
      synchronized (request) {
        beanGroupForecast = (aheevaManager.reports.beanForecastReport) _jspx_page_context.getAttribute("beanGroupForecast", PageContext.REQUEST_SCOPE);
        if (beanGroupForecast == null){
          beanGroupForecast = new aheevaManager.reports.beanForecastReport();
          _jspx_page_context.setAttribute("beanGroupForecast", beanGroupForecast, PageContext.REQUEST_SCOPE);
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
	String spacing =request.getParameter("spacing");
	String interval=request.getParameter("interval");
	String[] tabObj =null;
    StringTokenizer tok = null, tokGrp =null;
   
	String startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) ;
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
	beanForecastInfos r1=null;
	beanForecastInfos r2=null;

      out.write("\r\n");
      out.write("<div class=\"img-control\">\r\n");
      out.write("<table align=\"right\" border=\"0\" width=\"25%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t<tr valign=\"top\">\r\n");
      out.write("\t\t<td width=\"25%\" align=\"center\">\r\n");
      out.write("\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printGroupForecastReport.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&objects=");
out.write(groups) ;
      out.write("&prec=");
 out.write(prec);
      out.write("&suiv=");
 out.write(suiv);
      out.write("&current=");
 out.write(current);
      out.write("&all_obj=");
 out.write(all_obj);
      out.write("&interval=");
out.write(interval);
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
      out.write("\t\t<a href=\"groupForecastReports.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&objects=");
out.write(groups) ;
      out.write("&prec=");
 out.write(new_prec) ;
      out.write("&suiv=");
 out.write(current);
      out.write("&current=");
 out.write(prec);
      out.write("&interval=");
out.write(interval);
      out.write("&all_obj=0&lang=");
out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print( pageForecastData.getWord("Previous"));
      out.write("</a>\t\t</td>\n");
      out.write("\t");

	}
	String nb_obj = Integer.toString(numObjects);
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	
      out.write("\r\n");
      out.write("\t\t<td width=\"50%\" align=\"center\">\r\n");
      out.write("\t\t<a href=\"groupForecastReports.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&objects=");
out.write(groups) ;
      out.write("&prec=");
 out.write(current) ;
      out.write("&suiv=");
 out.write(new_suiv) ;
      out.write("&current=");
 out.write(suiv) ;
      out.write("&interval=");
out.write(interval);
      out.write("&all_obj=0&lang=");
out.write(language); 
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print( pageForecastData.getWord("Next"));
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
      out.write("<form name=\"groupForecastReports\">\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t<fieldset>");

if(all_obj.compareTo("0")==0) // one group 
{
	sret = beanGroupForecast.buildForecastForPeriod(groupId,startingDate);

System.out.println("all_obj==0");
	if(sret == "success")
	{
		System.out.println("sret == success");
		
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

beanManagerData pageForecastdData = new beanManagerData();
pageForecastdData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageForecastdData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\n");
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var lang =normalizeString(QueryString('lang'));\n");
      out.write("</script>\n");

String aht="";
String phone ="";
String Phone_variance="";
String Phone_variance30="";

      out.write("\n");
      out.write("<table width=\"90%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\n");
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
      out.print( pageForecastdData.getWord("Daily Report for") );
      out.write("\n");
      out.write("\t\t\t\t\t\t\t&nbsp;&nbsp; ");
	out.write(startingDate); 
      out.write("\n");
      out.write("\t\t\t\t\t\t</b>\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("<tr><td height=\"20\"></td></tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"100%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t\t\t  <tr class=\"reportsForecastReport\" height=\"25\">\n");
      out.write("\t\t\t  \t<td width=\"6%\"  align=\"center\" bgcolor=\"#FFFFFF\">&nbsp;</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\" bgcolor=\"#FFFFFF\">&nbsp;</td>\n");
      out.write("\t\t\t  \t<td width=\"8%\"  align=\"center\" >");
      out.print( pageForecastdData.getWord("Agents"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print( pageForecastdData.getWord("Phone"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"7%\"  align=\"center\">");
      out.print( pageForecastdData.getWord("Break"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"7%\"  align=\"center\" >");
      out.print( pageForecastdData.getWord("Lunch"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\" >");
      out.print( pageForecastdData.getWord("Training"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\">");
      out.print( pageForecastdData.getWord("Coaching"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\" >");
      out.print( pageForecastdData.getWord("Abs"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"5%\"  align=\"center\" >");
      out.print( pageForecastdData.getWord("Quit"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\" >");
      out.print( pageForecastdData.getWord("Shrinkage"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"7%\"  align=\"center\" >");
      out.print( pageForecastdData.getWord("Others"));
      out.write("</td>\n");
      out.write("\t\t\t\t<td width=\"8%\"  align=\"center\" >AHT</td>\n");
      out.write("\t\t\t\t<td width=\"7%\"  align=\"center\" >");
      out.print( pageForecastdData.getWord("Call"));
      out.write("</td>\n");
      out.write("\t\t\t  </tr>\n");
      out.write("\t\t\t  ");

				String key="";
				int sched =0;
			  	for(int i =0; i < beanGroupForecast.m_vAllData.size() ; i=i+1 )
				{
					aht="0.00";
				    phone ="0.00";
					r1 = (beanForecastInfos)beanGroupForecast.m_vAllData.elementAt(i);
					 if(r1 !=null){
					/*Phone_variance = r1.formatDecimalDouble(((((double)r1.nb_agts_login_actu -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu))/Long.parseLong(interval))/r1.nb_agts_phone_shed) ,2);*/
					 
					if(interval.compareTo("900")==0){					
					 if(r1.nb_calls_actu > 0)
						aht = r1.formatDecimalDouble( ( (double)(r1.tot_wrap_time +r1.tot_in_out_time+ r1.tot_hold)/(double)r1.nb_calls_actu), 2);
					 phone = r1.formatDecimalDouble((((double)r1.nb_agts_login_actu -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu))/Long.parseLong(interval)) ,2);
					 
					Phone_variance = r1.formatDecimalDouble(((((double)r1.nb_agts_login_actu -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu))/Long.parseLong(interval))/r1.nb_agts_phone_shed) ,2);
					System.out.println("Actual for " + r1.key + " " + r1.nb_agts_login_actu);
					
      out.write("\n");
      out.write("\t\t\t\t\t<tr class=\"reportsForecastShed\" height=\"20\">\n");
      out.write("\t\t\t\t\t\t\t<td   bgcolor=\"#99CCCC\" align=\"center\">");
out.write(r1.key);
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" bgcolor=\"#CC99CC\">");
      out.print( pageForecastdData.getWord("Scheduled"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(Long.toString(r1.nb_agts_login_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_agts_phone_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_agts_break_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_agts_lunch_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_agts_training_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_agts_coaching_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_agts_absent_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_agts_quit_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_agts_shrinkage_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_agts_others_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.aht_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\" >");
out.write(Long.toString(r1.nb_calls_shed));
      out.write("</td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr class=\"reportsForecastActual\" height=\"20\">\n");
      out.write("\t\t\t\t\t\t<td bgcolor=\"#FFFFFF\" >");
out.write("    ");
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFCCCC\">");
      out.print( pageForecastdData.getWord("Actual"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_agts_login_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(phone);
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_agts_break_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_agts_lunch_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_agts_training_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_agts_coaching_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_agts_absent_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_agts_quit_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_login_shed)-(double)r1.nb_agts_login_actu/Long.parseLong(interval)-(double)r1.nb_agts_quit_actu/Long.parseLong(interval)-(double)r1.nb_agts_absent_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_agts_others_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(aht);
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
out.write(Long.toString(Math.round((double)r1.nb_calls_actu)));
      out.write("</td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr class=\"reportsForecastVariance\" height=\"20\">\n");
      out.write("\t\t\t\t\t\t<td bgcolor=\"#FFFFFF\" >");
out.write("    ");
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFCCCC\">");
      out.print( pageForecastdData.getWord("Variance"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_login_shed !=0)  //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_login_actu/Long.parseLong(interval))/((double)r1.nb_agts_login_shed),2));
						   else out.write("N/A");
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_phone_shed !=0) 
				out.write(Phone_variance);
						   else out.write("N/A");
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_break_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_break_actu/Long.parseLong(interval))/((double)r1.nb_agts_break_shed),2));
						   else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_lunch_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_lunch_actu/Long.parseLong(interval))/((double)r1.nb_agts_lunch_shed),2));
						   else out.write("N/A"); 
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_training_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_training_actu/Long.parseLong(interval))/((double)r1.nb_agts_training_shed),2));
						   else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_coaching_shed !=0) //ok 
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_coaching_actu/Long.parseLong(interval))/((double)r1.nb_agts_coaching_shed),2));
						   else out.write("N/A"); 
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_absent_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_absent_actu/Long.parseLong(interval))/((double)r1.nb_agts_absent_shed),2));
						   else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_quit_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_quit_actu/Long.parseLong(interval))/((double)r1.nb_agts_quit_shed),2));
						   else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_shrinkage_shed !=0) //ok		
						out.write(r1.formatDecimalDouble((((double)(r1.nb_agts_login_shed)-(double)r1.nb_agts_login_actu/Long.parseLong(interval)-(double)r1.nb_agts_quit_actu/Long.parseLong(interval)-(double)r1.nb_agts_absent_actu/Long.parseLong(interval))/((double)r1.nb_agts_shrinkage_shed)),2));		
						   else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_agts_others_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_others_actu/Long.parseLong(interval))/((double)r1.nb_agts_others_shed),2));
						   else out.write("N/A"); 
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.aht_shed !=0) //ok
				out.write(r1.formatDecimalDouble((Long.parseLong(aht))/((double)r1.aht_shed ),2));
						   else out.write("N/A");
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if(r1.nb_calls_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_calls_actu)/((double)r1.nb_calls_shed),2));
						   else out.write("N/A"); 
      out.write("</td>\t\t\t\t\t\t  \t\t  \n");
      out.write("\t\t\t\t\t");
 
					}
					if(interval.compareTo("1800")==0){
					//if((i==0) || ((i%2) == 0)  && (i<(beanGroupForecast.m_vAllData.size()-1))){
					if(((i%2) == 0)  && (i<(beanGroupForecast.m_vAllData.size()-1))){
					r2 = (beanForecastInfos)beanGroupForecast.m_vAllData.elementAt(i+1);
					
					if((r1.nb_calls_actu + r2.nb_calls_actu) > 0)
						aht = r1.formatDecimalDouble( ( (double)(r1.tot_wrap_time +r1.tot_in_out_time+ r1.tot_hold+r2.tot_wrap_time +r2.tot_in_out_time+ r2.tot_hold)/(double)(r1.nb_calls_actu + r2.nb_calls_actu)), 2);
					 phone = r1.formatDecimalDouble((((double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu) -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu + r2.nb_agts_break_actu + r2.nb_agts_lunch_actu + r2.nb_agts_training_actu +r2.nb_agts_coaching_actu +r2.nb_agts_absent_actu + r2.nb_agts_quit_actu + r2.nb_agts_others_actu))/Long.parseLong(interval)) ,2);
					 
					/*Phone_variance30 = r1.formatDecimalDouble(((((double)r1.nb_agts_login_actu -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu))/Long.parseLong(interval))/(r1.nb_agts_phone_shed + r2.nb_agts_phone_shed)/2.0) ,2);*/
					
					Phone_variance30 = r1.formatDecimalDouble(((((double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu) -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu + r2.nb_agts_break_actu + r2.nb_agts_lunch_actu + r2.nb_agts_training_actu +r2.nb_agts_coaching_actu +r2.nb_agts_absent_actu + r2.nb_agts_quit_actu + r2.nb_agts_others_actu))/Long.parseLong(interval)))/((r1.nb_agts_phone_shed + r2.nb_agts_phone_shed)),2);
					
					System.out.println("Actual for " + r1.key + " " + r1.nb_agts_login_actu);
					System.out.println("Scheduled for " + r1.key + " " + r1.nb_agts_login_shed);
					System.out.println("Actual for " + r2.key + " " + r2.nb_agts_login_actu);
					System.out.println("Scheduled for " + r2.key + " " + r2.nb_agts_login_shed);
					
      out.write("\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t   \n");
      out.write("\t\t\t<tr class=\"reportsForecastShed\" height=\"20\">\n");
      out.write("\t\t\t<td bgcolor=\"#99CCCC\" align=\"center\">");
out.write(r1.key);
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"#CC99CC\">");
      out.print( pageForecastdData.getWord("Scheduled"));
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_login_shed+r2.nb_agts_login_shed),2));
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_phone_shed+r2.nb_agts_phone_shed),2));
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_break_shed+r2.nb_agts_break_shed),2));
      out.write("</td>\t\t\t\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_lunch_shed+r2.nb_agts_lunch_shed),2));
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_training_shed+r2.nb_agts_training_shed),2));
      out.write("</td>\t\t\t\t\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_coaching_shed+r2.nb_agts_coaching_shed),2));
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_absent_shed+r2.nb_agts_absent_shed),2));
      out.write("</td>\t\t\t\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_quit_shed+r2.nb_agts_quit_shed),2));
      out.write("</td>\n");
      out.write("\t\t    <td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_shrinkage_shed+r2.nb_agts_shrinkage_shed),2));
      out.write("</td>\t\t\t\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.nb_agts_others_shed+r2.nb_agts_others_shed),2));
      out.write("</td>\t\t\t\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"\">");
out.write(r1.formatDecimalDouble((double)(r1.aht_shed+r2.aht_shed),2));
      out.write("</td>\t\t\t\t\t\t\n");
      out.write("\t\t\t<td align=\"center\" >");
out.write(Long.toString(Math.round((double)(r1.nb_calls_shed + r2.nb_calls_shed))));
      out.write("</td>\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t<tr class=\"reportsForecastActual\" height=\"20\">\n");
      out.write("\t\t\t  <td bgcolor=\"#FFFFFF\" >");
out.write("    ");
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" bgcolor=\"#FFCCCC\">");
      out.print( pageForecastdData.getWord("Actual"));
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu)/Long.parseLong(interval)) ,2));
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\">");
out.write(phone);
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\">");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_break_actu+r2.nb_agts_break_actu)/Long.parseLong(interval)) ,2));
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_lunch_actu+r2.nb_agts_lunch_actu)/Long.parseLong(interval)) ,2));
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_training_actu+r2.nb_agts_training_actu)/Long.parseLong(interval)) ,2));
      out.write("</td>\t\t\t\t\t\t\t              \n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_coaching_actu+r2.nb_agts_coaching_actu)/Long.parseLong(interval)) ,2));
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_absent_actu+r2.nb_agts_absent_actu)/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_quit_actu+r2.nb_agts_quit_actu)/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_login_shed+r2.nb_agts_login_shed)-(double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu)/Long.parseLong(interval) -(double)r1.nb_agts_quit_actu/Long.parseLong(interval) - (double)r2.nb_agts_quit_actu/Long.parseLong(interval)- (double)r1.nb_agts_absent_actu/Long.parseLong(interval) - (double)r2.nb_agts_absent_actu/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_others_actu+r2.nb_agts_others_actu)/Long.parseLong(interval)),2));
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(aht);
      out.write("</td>\n");
      out.write("\t\t\t  <td align=\"center\" >");
out.write(Long.toString(Math.round((double)(r1.nb_calls_actu+r2.nb_calls_actu))));
      out.write("</td>\n");
      out.write("\t\t  </tr>\n");
      out.write("\t\t  \t\n");
      out.write("\t\t<tr class=\"reportsForecastVariance\" height=\"20\">\n");
      out.write("\t\t\t<td bgcolor=\"#FFFFFF\" >");
out.write("    ");
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"#FFCCCC\">");
      out.print( pageForecastdData.getWord("Variance"));
      out.write("</td>\n");
      out.write("\t\t\t<td align=\"center\">\t\t\n");
      out.write("\t\t\t");
 if((r1.nb_agts_login_shed + r2.nb_agts_login_shed) !=0)  //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_login_actu/Long.parseLong(interval))/((double)(r1.nb_agts_login_shed+r2.nb_agts_login_shed)),2));
			  else out.write("N/A");
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t");
 if(r1.nb_agts_phone_shed !=0)  //ok
			   out.write(Phone_variance30);
				else out.write("N/A");
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t");
 if((r1.nb_agts_break_shed + r2.nb_agts_break_shed)!=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_break_actu+r2.nb_agts_break_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_break_shed + r2.nb_agts_break_shed)),2));
				else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t");
 if((r1.nb_agts_lunch_shed + r2.nb_agts_lunch_shed) !=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_lunch_actu+r2.nb_agts_lunch_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_lunch_shed + r2.nb_agts_lunch_shed)),2));
			    else out.write("N/A"); 
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t");
 if((r1.nb_agts_training_shed + r2.nb_agts_training_shed) !=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_training_actu+r2.nb_agts_training_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_training_shed + r2.nb_agts_training_shed)),2));
			    else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t");
 if((r1.nb_agts_coaching_shed + r2.nb_agts_coaching_shed) !=0) //ok 
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_coaching_actu+r2.nb_agts_coaching_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_coaching_shed + r2.nb_agts_coaching_shed)),2));
				else out.write("N/A"); 
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t");
 if((r1.nb_agts_absent_shed + r2.nb_agts_absent_shed)!=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_absent_actu+r2.nb_agts_absent_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_absent_shed + r2.nb_agts_absent_shed)),2));
				else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t");
 if((r1.nb_agts_quit_shed + r2.nb_agts_quit_shed)!=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_quit_actu+r2.nb_agts_quit_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_quit_shed + r2.nb_agts_quit_shed)),2));
				else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t");
 if((r1.nb_agts_shrinkage_shed + r2.nb_agts_shrinkage_shed) !=0) //ok		
				out.write(r1.formatDecimalDouble((((double)(r1.nb_agts_login_shed+r2.nb_agts_login_shed)-(double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu)/Long.parseLong(interval)-(double)(r1.nb_agts_quit_actu+r2.nb_agts_quit_actu)/Long.parseLong(interval)-(double)(r1.nb_agts_absent_actu+r2.nb_agts_absent_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_shrinkage_shed + r2.nb_agts_shrinkage_shed))),2));		
				else out.write("N/A"); 
      out.write("</td><td align=\"center\">\n");
      out.write("\t\t\t\t");
 if((r1.nb_agts_others_shed + r2.nb_agts_others_shed) !=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_others_actu+r2.nb_agts_others_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_others_shed + r2.nb_agts_others_shed)),2));
				else out.write("N/A"); 
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t\t");
 if((r1.aht_shed + r2.aht_shed) !=0) //ok
				out.write(r1.formatDecimalDouble((Long.parseLong(aht))/((double)(r1.aht_shed + r2.aht_shed )),2));
				else out.write("N/A");
      out.write(" </td><td align=\"center\">\n");
      out.write("\t\t\t\t\t\t");
 if((r1.nb_calls_shed + r2.nb_calls_shed) !=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_calls_actu+r2.nb_calls_actu))/((double)(r1.nb_calls_shed + r2.nb_calls_shed)),2));
						   else out.write("N/A"); 
      out.write("</td>\t\t\n");
      out.write("\t\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t\t\t");

					}//%2==0
				}//fin interval 1800
			}
		}
					
      out.write("\n");
      out.write("\t\t\t  \n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
 pageForecastdData.closeConnection(); 
      out.write('\n');
      out.write("\r\n");
      out.write("\t\t");
 
	}
}	
      out.write("\r\n");
      out.write("\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 pageForecastData.closeConnection(); 
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
