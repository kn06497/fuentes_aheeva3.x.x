package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.wfm_schedule.*;
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

public final class horaires_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

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
beanManagerData pagehorData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pagehorData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pagehorData.openConnection();

      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<LINK href=\"../Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
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
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      aheevaManager.wfm_schedule.beanSchedule sc = null;
      synchronized (request) {
        sc = (aheevaManager.wfm_schedule.beanSchedule) _jspx_page_context.getAttribute("sc", PageContext.REQUEST_SCOPE);
        if (sc == null){
          sc = new aheevaManager.wfm_schedule.beanSchedule();
          _jspx_page_context.setAttribute("sc", sc, PageContext.REQUEST_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
//@ page session="false" buffer="400kb" 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\"  src=\"../Resources_pages/jsUtil.js\"></script>\r\n");

    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String lang = request.getParameter("lang");
    String startingDate="", endingDate="";
    String sRet="",ssRet="";
    int i,j,k,l;
    long tLoginTime,next_day_off=0,regular_shift=0;
    String agents = "",myagt="";
    String nextDayOff="";

    String agentGroups  = request.getParameter("group");
    StringTokenizer tok = null, tokGrp=null,  tokn = null;
    String agentGroupName ="", agentGroup ="", aPeriod="";

    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    int numCampaigns = tok.countTokens();
    for( k = 0; k <numCampaigns; k++ ) {
        String agentGroupTemp = tok.nextToken();
        tokGrp = new java.util.StringTokenizer(agentGroupTemp,",");
        agentGroupName =tokGrp.nextToken();
        agentGroup = tokGrp.nextToken();
    }

//get the global parameters

try{
    sc.getGlobalParams();
    } catch(Exception e){
    }
   for (int b = 0; b < sc.m_globalParams.size(); b++) {
      parameter prm = (parameter)sc.m_globalParams.elementAt(b);
      if (prm.m_param_name.equalsIgnoreCase("regular_shift")){
         regular_shift = Long.parseLong(prm.m_param_value);
      }
      if (prm.m_param_name.equalsIgnoreCase("next_day_off")){
          next_day_off = Long.parseLong(prm.m_param_value);
      }
   }

 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<br><br>\r\n");
      out.write("<form  method=\"post\" action='/aheevaccs/servlet/PublishServlet?start_date=");
      out.print(startingDateDaily);
      out.write("&end_date=");
      out.print(endingDateDaily);
      out.write("&group_dbid=");
      out.print(agentGroup);
      out.write("&lang=");
      out.print(lang);
      out.write("' >\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\" >\r\n");
      out.write(" <script type=\"text/javascript\">\r\n");
      out.write("  tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write(" </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <div class=\"tab-page\" id=\"tabPage1\"  align=\"center\">\r\n");
      out.write("  <h2 class=\"tab\">");
      out.print( pagehorData.getWord("Shifts"));
      out.write("</h2>\r\n");
      out.write("   <script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage1\" ) );\r\n");
      out.write("   </script>\r\n");
      out.write("  <fieldset>\r\n");
      out.write("\r\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td width=\"100%\" align=\"center\">\r\n");
      out.write("   <table  border=\"0\" align=\"center\">\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td class=\"reportsID\"><b>\r\n");
      out.write("        ");
      out.print( pagehorData.getWord("Available shifts"));
      out.write("&nbsp;");
      out.print( pagehorData.getWord("From"));
      out.write(":\r\n");
      out.write("        ");
out.write(startingDateDaily);	
      out.write("\r\n");
      out.write("        ");
      out.print( pagehorData.getWord("To"));
      out.write("\r\n");
      out.write("        ");
out.write(endingDateDaily);	
      out.write("\r\n");
      out.write("        </b>\r\n");
      out.write("     </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("   </table>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td>\r\n");
      out.write("   <br><br>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("\r\n");
      out.write("   ");
  try{
			sRet=sc.buildScheduleForPeriod(startingDateDaily,endingDateDaily,agentGroup,"");
       } catch(Exception e){
    }
 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write(" <td align=\"center\">\r\n");
      out.write("  <table align=\"center\" border='1'> <!--Tableau de schedule-->\r\n");
      out.write("   <tr  bgcolor='0099FF' style=\"color:#FFFFFF\">\r\n");
      out.write("    <td align=\"center\"> ");
      out.print( pagehorData.getWord("Shift"));
      out.write("</td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Sunday"));
      out.write("</td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Monday"));
      out.write(" </td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Tuesday"));
      out.write("</td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Wednesday"));
      out.write("</td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Thursday"));
      out.write(" </td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Friday"));
      out.write(" </td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Saturday"));
      out.write(" </td>\r\n");
      out.write("   </tr>\r\n");
      out.write("   ");

   long tot_sun=0,tot_mon=0,tot_tue=0,tot_wed=0,tot_thu=0,tot_fri=0,tot_sat=0;
	if(sRet=="success") {
              for (i = 0; i < sc.m_vAllShifts.size(); i++) {
              ScheduleInfo sch = (ScheduleInfo)sc.m_vAllShifts.elementAt(i);
              tot_sun+=sch.sunday;
              tot_mon+=sch.monday;
              tot_tue+=sch.tuesday;
              tot_wed+=sch.wednesday;
              tot_thu+=sch.thursday;
              tot_fri+=sch.friday;
              tot_sat+=sch.saturday ;
      out.write("\r\n");
      out.write("\r\n");
if (i%2==0){
      out.write("\r\n");
      out.write("<tr bgcolor='#e6eff4'>\r\n");
}else{
      out.write("\r\n");
      out.write("<tr bgcolor='#b4cfff'>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("     ");
if (sch.duration < regular_shift) {
      out.write("\r\n");
      out.write("          <td width=\"80\"   align=\"center\" bgcolor='#FFC0CB'>\r\n");
      out.write("     ");
}else if (sch.duration > regular_shift) {
      out.write("\r\n");
      out.write("         <td width=\"80\"   align=\"center\"  bgcolor='#DDA0DD'>\r\n");
      out.write("      ");
}else{
      out.write("\r\n");
      out.write("          <td width=\"80\"   align=\"center\" >\r\n");
      out.write("      ");
}
      out.write("\r\n");
      out.write("         ");
out.write(sch.shift);
      out.write("\r\n");
      out.write("      </td>\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(sch.sunday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(sch.sunday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(sch.monday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(sch.monday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(sch.tuesday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(sch.tuesday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(sch.wednesday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(sch.wednesday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(sch.thursday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(sch.thursday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(sch.friday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(sch.friday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(sch.saturday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(sch.saturday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t\r\n");
      out.write("      ");
} // fin for
    }else {
        System.out.println("NO sucess");
 }//fin if sucess  
      out.write("\r\n");
      out.write("   <tr bgcolor='0099FF' style=\"color:#FFFFFF\">\r\n");
      out.write("    <td><b>");
      out.print( pagehorData.getWord("Total/Day"));
      out.write("</b></td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_sun));
      out.write("</b> </td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_mon));
      out.write("</b> </td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_tue));
      out.write(" </b></td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_wed));
      out.write("</b> </td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_thu));
      out.write("</b> </td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_fri));
      out.write(" </b></td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b>");
out.write(Long.toString(tot_sat));
      out.write(" </b> </td>\r\n");
      out.write("   </tr>\r\n");
      out.write("\r\n");
      out.write("   </table>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td>\r\n");
      out.write("  &nbsp;<br>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td align=\"center\">\r\n");
      out.write("   <table>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td  style=\"background-color:pink\" width=\"40\"></td><td>&nbsp;</td><td>");
      out.print( pagehorData.getWord("part-time shift"));
      out.write("\r\n");
      out.write("    </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td  style=\"background-color:plum\" width=\"40\"></td><td>&nbsp;</td><td>");
      out.print( pagehorData.getWord("split shift"));
      out.write("\r\n");
      out.write("    </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("   </table>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write("  <td>\r\n");
      out.write("  &nbsp;<br>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabPage2\"  align=\"center\">\r\n");
      out.write("  <h2 class=\"tab\">");
      out.print( pagehorData.getWord("Agent group"));
      out.write("&nbsp; ");
      out.print( pagehorData.getWord("view"));
      out.write("</h2>\r\n");
      out.write("   <script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage2\" ) );\r\n");
      out.write("   </script>\r\n");
      out.write("  <fieldset>\r\n");
      out.write("\r\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td align=\"center\">\r\n");
      out.write("   <table width=\"100%\"  border=\"0\" align=\"center\">\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td width=\"100%\" class=\"reportsID\" align=\"center\"><b>\r\n");
      out.write("        ");
      out.print( pagehorData.getWord("Agent group"));
      out.write(":   ");
out.write(agentGroupName);
      out.write("  </b>\r\n");
      out.write("     </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("   </table>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td>\r\n");
      out.write("   <br><br>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td align=\"center\">\r\n");
      out.write("    <table border=\"1\" align=\"center\">\r\n");
      out.write("     <tr bgcolor='#b4cfff' style=\"color:#666666\">\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Name"));
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Sunday"));
      out.write(" </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Monday"));
      out.write(" </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Tuesday"));
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Wednesday"));
      out.write(" </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Thursday"));
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Friday"));
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Saturday"));
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Total hours"));
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Day off"));
      out.write(" </td>\r\n");
      out.write("     </tr>\r\n");
      out.write("  ");

//get the connection
try{
      sc.getConnection();
}catch(Exception e){
      }
 try{
    sc.GetGroupAgentSchedule(startingDateDaily,endingDateDaily,agentGroup);
}catch(Exception e){
      }


for (i = 0; i < sc.m_vAllAgents.size(); i++) {
   beanAgentLoginInfo agent = (beanAgentLoginInfo)sc.m_vAllAgents.elementAt(i); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
if (i%2==0){
      out.write("\r\n");
      out.write("<tr bgcolor='#e6eff4'>\r\n");
}else{
      out.write("\r\n");
      out.write("<tr bgcolor='#b4cfff'>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");

// we should use our variable next_day_off to know how many days an agent can work in a row
if (agent.shifts.lastDayOff.equalsIgnoreCase("Saturday")){
nextDayOff ="OK";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Friday")){
nextDayOff ="Thursday";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Thursday")){
nextDayOff ="Wednesday";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Wednesday")){
nextDayOff ="Tuesday";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Tuesday")){
nextDayOff ="Monday";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Monday")){
nextDayOff ="Sunday";
}else{
nextDayOff ="";
}
      out.write("\r\n");
      out.write("  <td>\r\n");
      out.write("      ");
 String name=agent.first_name+" "+agent.last_name;
      out.write("<a href='/aheevaccs/aheevaManager/jsp/addHoraires.jsp?nextDayOff="+nextDayOff+"&name="+name+"&login_id="+agent.agt_login_id+"&agentGroupName="+agentGroupName+"&group="+agentGroup+"&agentId="+agent.agt_id + "&startDate="+startingDateDaily + "&endDate="+endingDateDaily + "&mon="+agent.shifts.mon + "&tues="+agent.shifts.tues + "&wednes="+agent.shifts.wednes +"&thurs="+agent.shifts.thurs + "&fri="+agent.shifts.fri +"&satur="+agent.shifts.satur + "&sun="+agent.shifts.sun + "&lang=" + lang +"'>"); 
      out.write("\r\n");
      out.write("      ");
out.write(agent.last_name);
      out.write(',');
out.write(agent.first_name);
      out.write("&nbsp; [");
out.write(agent.agt_login_id);
      out.write("]\r\n");
      out.write("      </a>\r\n");
      out.write("   </td>\r\n");
      out.write("\r\n");
if (agent.shifts.sun.length()>0 && agent.shifts.sun.startsWith("p")) {
      out.write("\r\n");
      out.write(" <td style=\"background-color:#BCBCDE\">\r\n");
      out.write("      ");
 out.write(agent.shifts.sun.substring(2,7)+ "-" + agent.shifts.sun.substring(agent.shifts.sun.length()-5,agent.shifts.sun.length()) ); 
      out.write("\r\n");
      out.write(" </td>\r\n");
      out.write("\r\n");
}else if (agent.shifts.sun.length()>0 ){
      out.write("\r\n");
      out.write("  <td>");
 out.write(agent.shifts.sun.substring(0,5)+ "-" + agent.shifts.sun.substring(agent.shifts.sun.length()-5,agent.shifts.sun.length()) ); 
      out.write("\r\n");
      out.write("  </td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td>&nbsp;</td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
if (agent.shifts.mon.length()>0 && agent.shifts.mon.startsWith("p")) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
 out.write(agent.shifts.mon.substring(2,7)+ "-" + agent.shifts.mon.substring(agent.shifts.mon.length()-5,agent.shifts.mon.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else if (agent.shifts.mon.length()>0){
      out.write("\r\n");
      out.write("      <td>");
 out.write(agent.shifts.mon.substring(0,5)+ "-" + agent.shifts.mon.substring(agent.shifts.mon.length()-5,agent.shifts.mon.length()) );  
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td>&nbsp;</td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
if (agent.shifts.tues.length()>0 && agent.shifts.tues.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
      out.write("      ");
 out.write(agent.shifts.tues.substring(2,7)+ "-" + agent.shifts.tues.substring(agent.shifts.tues.length()-5,agent.shifts.tues.length()) );    
      out.write("</td>\r\n");
      out.write("\r\n");
}else if (agent.shifts.tues.length()>0){
      out.write("\r\n");
      out.write("      <td>");
 out.write(agent.shifts.tues.substring(0,5)+ "-" + agent.shifts.tues.substring(agent.shifts.tues.length()-5,agent.shifts.tues.length()) );    
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td>&nbsp;</td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
if (agent.shifts.wednes.length()>0 && agent.shifts.wednes.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
      out.write("      ");
 out.write(agent.shifts.wednes.substring(2,7)+ "-" + agent.shifts.wednes.substring(agent.shifts.wednes.length()-5,agent.shifts.wednes.length()) );    
      out.write("</td>\r\n");
}else if(agent.shifts.wednes.length()>0) {
      out.write("\r\n");
      out.write("      <td>");
 out.write(agent.shifts.wednes.substring(0,5)+ "-" + agent.shifts.wednes.substring(agent.shifts.wednes.length()-5,agent.shifts.wednes.length()) );    
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td>&nbsp;</td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
if (agent.shifts.thurs.length()>0 && agent.shifts.thurs.startsWith("p")) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
      out.write(" ");
 out.write(agent.shifts.thurs.substring(2,7)+ "-" + agent.shifts.thurs.substring(agent.shifts.thurs.length()-5,agent.shifts.thurs.length()) );    
      out.write("</td>\r\n");
}else if(agent.shifts.thurs.length()>0){
      out.write("\r\n");
      out.write(" <td>");
 out.write(agent.shifts.thurs.substring(0,5)+ "-" + agent.shifts.thurs.substring(agent.shifts.thurs.length()-5,agent.shifts.thurs.length()) );    
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td>&nbsp;</td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
if (agent.shifts.fri.length()>0 && agent.shifts.fri.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
      out.write("     ");
 out.write(agent.shifts.fri.substring(2,7)+ "-" + agent.shifts.fri.substring(agent.shifts.fri.length()-5,agent.shifts.fri.length()) );    
      out.write("</td>\r\n");
}else if ( agent.shifts.fri.length()>0){
      out.write("\r\n");
      out.write("     <td>\r\n");
 out.write(agent.shifts.fri.substring(0,5)+ "-" + agent.shifts.fri.substring(agent.shifts.fri.length()-5,agent.shifts.fri.length()) );    
      out.write("\r\n");
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td>&nbsp;</td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");
if (agent.shifts.satur.length()>0 && agent.shifts.satur.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
      out.write("    ");
 out.write(agent.shifts.satur.substring(2,7)+ "-" + agent.shifts.satur.substring(agent.shifts.satur.length()-5,agent.shifts.satur.length()) );    
      out.write("</td>\r\n");
      out.write(" ");
}else if (agent.shifts.satur.length()>0){
      out.write("\r\n");
      out.write("    <td>");
 out.write(agent.shifts.satur.substring(0,5)+ "-" + agent.shifts.satur.substring(agent.shifts.satur.length()-5,agent.shifts.satur.length()) );    
      out.write("</td>\r\n");
}else {
      out.write("\r\n");
      out.write("<td>&nbsp;</td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("  <td>");
out.write(agent.shifts.getTotal());
      out.write("</td>\r\n");
      out.write("  <td>");
out.write(nextDayOff);
      out.write("</td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" ");
} // fin for 
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td align=\"center\">&nbsp;<br>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td align=\"center\">\r\n");
      out.write(" <input  type=\"submit\" value='");
      out.print(pagehorData.getWord("Publish"));
      out.write("' >\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabPage3\"  align=\"center\">\r\n");
      out.write("  <h2 class=\"tab\">");
      out.print( pagehorData.getWord("Teams"));
      out.write("&nbsp; ");
      out.print( pagehorData.getWord("view"));
      out.write("</h2>\r\n");
      out.write("   <script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage3\" ) );\r\n");
      out.write("   </script>\r\n");
      out.write("  <fieldset>\r\n");
      out.write("\r\n");

    try{
       sc.getTeams(agentGroup);
    }   catch(Exception e){
        }
 
      out.write("\r\n");
      out.write("\r\n");
 for (i = 0; i < sc.m_vAllTeams.size(); i++) {
       team team = (team)sc.m_vAllTeams.elementAt(i); 
      out.write("\r\n");
      out.write("<table>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td width=\"100%\" class=\"reportsID\" align=\"center\"><b>\r\n");
      out.write("     ");
 out.write("Schedule for team");
      out.write(' ');
      out.write(':');
      out.write(' ');
out.write(team.m_team_name);
      out.write("</b>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("</table>\r\n");
      out.write("      ");
 try{
          sc.GetTeamAgentSchedule(team.m_dbid,startingDateDaily,endingDateDaily,agentGroup);
         }catch(Exception e){
              }
      
      out.write("\r\n");
      out.write("     <br>\r\n");
      out.write("     <table>\r\n");
      out.write("      <tr bgcolor='#b4cfff'>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Name"));
      out.write(" </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Sunday"));
      out.write(" </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Monday"));
      out.write("  </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Tuesday"));
      out.write(" </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Wednesday"));
      out.write("  </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Thursday"));
      out.write("  </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Friday"));
      out.write(" </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Saturday"));
      out.write("  </td>\r\n");
      out.write("      <td>");
      out.print( pagehorData.getWord("Total hours"));
      out.write(" </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      ");


      for (l = 0; l < sc.m_vAllTeamAgents.size(); l++) {
      beanAgentLoginInfo agentT = (beanAgentLoginInfo)sc.m_vAllTeamAgents.elementAt(l); 
      out.write("\r\n");
      out.write("      ");
if (l%2==0){
      out.write("\r\n");
      out.write("      <tr bgcolor='#e6eff4'>\r\n");
      out.write("      ");
}else{
      out.write("\r\n");
      out.write("      <tr bgcolor='#b4cfff'>\r\n");
      out.write("      ");
}
      out.write("\r\n");
      out.write("      <td>\r\n");
      out.write("       ");
 String agt_name=agentT.first_name+" "+agentT.last_name;
       out.write("<a href='/aheevaccs/aheevaManager/jsp/addHoraires.jsp?name="+agt_name+"&login_id="+agentT.agt_login_id+"&agentGroupName="+agentGroupName+"&group="+agentGroup+"&agentId="+agentT.agt_id + "&startDate="+startingDateDaily + "&endDate="+endingDateDaily + "&mon="+agentT.shifts.mon + "&tues="+agentT.shifts.tues + "&wednes="+agentT.shifts.wednes +"&thurs="+agentT.shifts.thurs + "&fri="+agentT.shifts.fri +"&satur="+agentT.shifts.satur + "&sun="+agentT.shifts.sun + "&lang=" + lang  +"'>"); 
      out.write("\r\n");
      out.write("       ");
out.write(agentT.last_name);
      out.write(',');
out.write(agentT.first_name);
      out.write("&nbsp; [");
out.write(agentT.agt_login_id);
      out.write("]</a>\r\n");
      out.write("      </td>\r\n");
      out.write("\r\n");
if (agentT.shifts.sun.length() >0 && agentT.shifts.sun.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
 out.write(agentT.shifts.sun.substring(2,7)+ "-" + agentT.shifts.sun.substring(agentT.shifts.sun.length()-5,agentT.shifts.sun.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else if(agentT.shifts.sun.length() >0){
      out.write("\r\n");
      out.write("      <td>\r\n");
 out.write(agentT.shifts.sun.substring(0,5)+ "-" + agentT.shifts.sun.substring(agentT.shifts.sun.length()-5,agentT.shifts.sun.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td></td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");
if (agentT.shifts.mon.length() >0 && agentT.shifts.mon.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
 out.write(agentT.shifts.mon.substring(2,7)+ "-" + agentT.shifts.mon.substring(agentT.shifts.mon.length()-5,agentT.shifts.mon.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else if(agentT.shifts.mon.length() >0){
      out.write("\r\n");
      out.write("      <td>");
 out.write(agentT.shifts.mon.substring(0,5)+ "-" + agentT.shifts.mon.substring(agentT.shifts.mon.length()-5,agentT.shifts.mon.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td></td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");
if (agentT.shifts.tues.length() >0 && agentT.shifts.tues.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
 out.write(agentT.shifts.tues.substring(2,7)+ "-" + agentT.shifts.tues.substring(agentT.shifts.tues.length()-5,agentT.shifts.tues.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else if(agentT.shifts.tues.length() >0){
      out.write("\r\n");
      out.write("      <td>");
 out.write(agentT.shifts.tues.substring(0,5)+ "-" + agentT.shifts.tues.substring(agentT.shifts.tues.length()-5,agentT.shifts.tues.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td></td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");
if (agentT.shifts.wednes.length() >0 && agentT.shifts.wednes.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
 out.write(agentT.shifts.wednes.substring(2,7)+ "-" + agentT.shifts.wednes.substring(agentT.shifts.wednes.length()-5,agentT.shifts.wednes.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else if(agentT.shifts.wednes.length() >0){
      out.write("\r\n");
      out.write("      <td>");
 out.write(agentT.shifts.wednes.substring(0,5 )+ "-" + agentT.shifts.wednes.substring(agentT.shifts.wednes.length()-5,agentT.shifts.wednes.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td></td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
if (agentT.shifts.thurs.length() >0 && agentT.shifts.thurs.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
 out.write(agentT.shifts.thurs.substring(2,7)+ "-" + agentT.shifts.thurs.substring(agentT.shifts.thurs.length()-5,agentT.shifts.thurs.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else if(agentT.shifts.thurs.length() >0){
      out.write("\r\n");
      out.write("      <td>");
 out.write(agentT.shifts.thurs.substring(0,5)+ "-" + agentT.shifts.thurs.substring(agentT.shifts.thurs.length()-5,agentT.shifts.thurs.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td></td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
if (agentT.shifts.fri.length() >0 && agentT.shifts.fri.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
 out.write(agentT.shifts.fri.substring(2,7)+ "-" + agentT.shifts.fri.substring(agentT.shifts.fri.length()-5,agentT.shifts.fri.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else if(agentT.shifts.fri.length() >0){
      out.write("\r\n");
      out.write("      <td>");
 out.write(agentT.shifts.fri.substring(0,5)+ "-" + agentT.shifts.fri.substring(agentT.shifts.fri.length()-5,agentT.shifts.fri.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td></td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
if (agentT.shifts.satur.length() >0 && agentT.shifts.satur.startsWith("p") ) {
      out.write("\r\n");
      out.write("      <td style=\"background-color:#BCBCDE\">\r\n");
 out.write(agentT.shifts.satur.substring(2,7)+ "-" + agentT.shifts.satur.substring(agentT.shifts.satur.length()-5,agentT.shifts.satur.length()) ); 
      out.write("\r\n");
      out.write("</td>\r\n");
}else if(agentT.shifts.satur.length() >0){
      out.write("\r\n");
      out.write("      <td>");
 out.write(agentT.shifts.satur.substring(0,5)+ "-" + agentT.shifts.satur.substring(agentT.shifts.satur.length()-5,agentT.shifts.satur.length()) ); 
      out.write("</td>\r\n");
}else{
      out.write("\r\n");
      out.write("<td></td>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("     <td>");
out.write(agentT.shifts.getTotal());
      out.write("</td>\r\n");
      out.write("\r\n");
      out.write("</tr>\r\n");
}//fin for all agents of that team



      out.write("\r\n");
      out.write("    </table>\r\n");
      out.write("<br><br>\r\n");
      out.write("\r\n");
      out.write("\r\n");
}//fin for all teams
  try{
          sc.closeConnection();
      }catch(Exception e){
      }


      out.write("\r\n");
      out.write("\r\n");
      out.write("</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabPage4\"  align=\"center\">\r\n");
      out.write("  <h2 class=\"tab\">");
      out.print( pagehorData.getWord("Assigned shifts"));
      out.write("</h2>\r\n");
      out.write("   <script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage4\" ) );\r\n");
      out.write("   </script>\r\n");
      out.write("  <fieldset>\r\n");
      out.write("\r\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td width=\"100%\" align=\"center\">\r\n");
      out.write("   <table  border=\"0\" align=\"center\">\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td class=\"reportsID\"><b>\r\n");
      out.write("      ");
      out.print( pagehorData.getWord("Assigned shifts"));
      out.write(" &nbsp; ");
      out.print( pagehorData.getWord("From"));
      out.write(":\r\n");
      out.write("        ");
out.write(startingDateDaily);	
      out.write("\r\n");
      out.write("        to\r\n");
      out.write("        ");
out.write(endingDateDaily); 
      out.write("\r\n");
      out.write("        </b>\r\n");
      out.write("     </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("   </table>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td>\r\n");
      out.write("   <br><br>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("\r\n");
      out.write("   ");
  try{
           ssRet=sc.buildAssignedScheduleForPeriod(startingDateDaily,endingDateDaily,agentGroup);
       } catch(Exception e){
    } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write(" <td align=\"center\">\r\n");
      out.write("  <table align=\"center\" border='1'> <!--Tableau de schedule-->\r\n");
      out.write("   <tr  bgcolor='0099FF' style=\"color:#FFFFFF\">\r\n");
      out.write("\t<td align=\"center\"> ");
      out.print( pagehorData.getWord("Shift"));
      out.write(" </td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Sunday"));
      out.write(" </td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Monday"));
      out.write("</td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Tuesday"));
      out.write(" </td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Wednesday"));
      out.write(" </td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Thursday"));
      out.write(" </td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Friday"));
      out.write("</td>\r\n");
      out.write("    <td width=\"70\"  align=\"center\">");
      out.print( pagehorData.getWord("Saturday"));
      out.write("</td>\r\n");
      out.write("\t\r\n");
      out.write("   </tr>\r\n");
      out.write("   ");

    tot_sun=0;tot_mon=0;tot_tue=0;tot_wed=0;tot_thu=0;tot_fri=0;tot_sat=0;
	if(ssRet=="success") {
              for (int a = 0; a < sc.m_vAllAssignedShifts.size(); a++) {
              ScheduleInfo asch = (ScheduleInfo)sc.m_vAllAssignedShifts.elementAt(a);
              tot_sun+=asch.sunday;
              tot_mon+=asch.monday;
              tot_tue+=asch.tuesday;
              tot_wed+=asch.wednesday;
              tot_thu+=asch.thursday;
              tot_fri+=asch.friday;
              tot_sat+=asch.saturday ;
      out.write("\r\n");
      out.write("\r\n");
if (i%2==0){
      out.write("\r\n");
      out.write("<tr bgcolor='#e6eff4'>\r\n");
}else{
      out.write("\r\n");
      out.write("<tr bgcolor='#b4cfff'>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t   ");
if (asch.duration < regular_shift) {
      out.write("\r\n");
      out.write("    \t      <td width=\"80\"   align=\"center\" bgcolor='#FFC0CB'>\r\n");
      out.write("     \t");
}else if (asch.duration > regular_shift) {
      out.write("\r\n");
      out.write("        \t  <td width=\"80\"   align=\"center\"  bgcolor='#DDA0DD'>\r\n");
      out.write("      \t");
}else{
      out.write("\r\n");
      out.write("          \t  <td width=\"80\"   align=\"center\" >\r\n");
      out.write("      ");
}
      out.write("\r\n");
      out.write("         ");
out.write(asch.shift);
      out.write("\r\n");
      out.write("      </td>\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(asch.sunday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(asch.sunday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(asch.monday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(asch.monday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(asch.tuesday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(asch.tuesday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(asch.wednesday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(asch.wednesday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(asch.thursday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(asch.thursday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(asch.friday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(asch.friday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t  ");
 if(asch.saturday !=0) {
      out.write("\t  \r\n");
      out.write("      <td width=\"80\"   align=\"center\"> ");
out.write(Long.toString(asch.saturday));
      out.write("  </td>\r\n");
      out.write("\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t  <td>&nbsp;</td>\r\n");
      out.write("\t  ");
}
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("\t ");
} // fin for
    }else {
        System.out.println("NO sucess");
 }//fin if sucess  
      out.write("\r\n");
      out.write("   <tr bgcolor='0099FF' style=\"color:#FFFFFF\">\r\n");
      out.write("    <td><b>");
      out.print( pagehorData.getWord("Total/Day"));
      out.write("</b></td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_sun));
      out.write("</b> </td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_mon));
      out.write("</b> </td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_tue));
      out.write(" </b></td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_wed));
      out.write("</b> </td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_thu));
      out.write("</b> </td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b> ");
out.write(Long.toString(tot_fri));
      out.write(" </b></td>\r\n");
      out.write("    <td width=\"80\" align=\"center\"><b>");
out.write(Long.toString(tot_sat));
      out.write(" </b> </td>\r\n");
      out.write("   </tr>\r\n");
      out.write("\r\n");
      out.write("   </table>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td>\r\n");
      out.write("  &nbsp;<br>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td align=\"center\">\r\n");
      out.write("   <table>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td  style=\"background-color:pink\" width=\"40\"></td><td>&nbsp;</td><td>");
      out.print( pagehorData.getWord("part-time shift"));
      out.write("\r\n");
      out.write("    </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td  style=\"background-color:plum\" width=\"40\"></td><td>&nbsp;</td><td>");
      out.print( pagehorData.getWord("split shift"));
      out.write("\r\n");
      out.write("    </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("   </table>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write("  <td>\r\n");
      out.write("  &nbsp;<br>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t//setupAllTabs();\r\n");
      out.write("</script>\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pagehorData.closeConnection(); 
      out.write('\r');
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
