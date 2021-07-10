package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.io.*;
import java.lang.*;
import com.mysql.jdbc.*;
import javazoom.upload.*;
import java.util.*;
import java.sql.ResultSet;
import aheevaManager.ressources.*;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;

public final class LoadHoraire_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/Resources_pages/xc2_default_labels.jsp");
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

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
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

	boolean upload = false;
	String msg = request.getParameter("msg");
    String directory = request.getRealPath("Manager/uploads");
	String tmpdirectory = request.getRealPath("Manager/uploads");
	String tenantDbid = request.getParameter("tenant_dbid");
	System.out.println("----- TENANT "+tenantDbid);
	
	beanManagerData pageloadhData = new beanManagerData();
	pageloadhData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageloadhData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write('\r');
      out.write('\n');
 boolean createsubfolders = true; 
      out.write('\r');
      out.write('\n');
      javazoom.upload.UploadBean upBean = null;
      synchronized (_jspx_page_context) {
        upBean = (javazoom.upload.UploadBean) _jspx_page_context.getAttribute("upBean", PageContext.PAGE_SCOPE);
        if (upBean == null){
          upBean = new javazoom.upload.UploadBean();
          _jspx_page_context.setAttribute("upBean", upBean, PageContext.PAGE_SCOPE);
          out.write("\r\n");
          out.write("  ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("upBean"), "folderstore",
 directory );
          out.write("\r\n");
          out.write("  ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("upBean"), "parser",
 MultipartFormDataRequest.CFUPARSER );
          out.write("\r\n");
          out.write("  ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("upBean"), "parsertmpdir",
 tmpdirectory );
          out.write("\r\n");
          out.write("  ");
          org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("upBean"), "filesizelimit", "8589934592", null, null, false);
          out.write('\r');
          out.write('\n');
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/style_2.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../Resources_pages/xc2_default.css\" type=\"text/css\">\r\n");
      out.write("<LINK href=\"../Resources_pages/livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Language\" content=\"en-us\">\r\n");
      out.write("\r\n");
      out.write("<link href=\"grid.css\" rel=\"stylesheet\" type=\"text/css\" ></link>\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("var lang = normalizeString(QueryString('lang'));\r\n");
      out.write("if( lang == null || lang == 'null' )\r\n");
      out.write("\tlang = 0;\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pagexc2Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pagexc2Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pagexc2Data.openConnection();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("// variables of labels;// \r\n");
      out.write("var phrase= new Array();\r\n");
      out.write("phrase[0]=\"");
      out.print( pagexc2Data.getWord("January"));
      out.write("\";\r\n");
      out.write("phrase[1]=\"");
      out.print( pagexc2Data.getWord("February"));
      out.write("\";\r\n");
      out.write("phrase[2]=\"");
      out.print( pagexc2Data.getWord("March"));
      out.write("\";\r\n");
      out.write("phrase[3]=\"");
      out.print( pagexc2Data.getWord("April"));
      out.write("\";\r\n");
      out.write("phrase[4]=\"");
      out.print( pagexc2Data.getWord("May"));
      out.write("\";         \r\n");
      out.write("phrase[5]=\"");
      out.print( pagexc2Data.getWord("June"));
      out.write("\";\r\n");
      out.write("phrase[6]=\"");
      out.print( pagexc2Data.getWord("July"));
      out.write("\";\r\n");
      out.write("phrase[7]=\"");
      out.print( pagexc2Data.getWord("August"));
      out.write("\";\r\n");
      out.write("phrase[8]=\"");
      out.print( pagexc2Data.getWord("September"));
      out.write("\";\r\n");
      out.write("phrase[9]=\"");
      out.print( pagexc2Data.getWord("October"));
      out.write("\";\r\n");
      out.write("phrase[10]=\"");
      out.print( pagexc2Data.getWord("November"));
      out.write("\";\r\n");
      out.write("phrase[11]=\"");
      out.print( pagexc2Data.getWord("December"));
      out.write("\";\r\n");
      out.write("phrase[12]=\"");
      out.print( pagexc2Data.getWord("Jan"));
      out.write("\";\r\n");
      out.write("phrase[13]=\"");
      out.print( pagexc2Data.getWord("Feb"));
      out.write("\";\r\n");
      out.write("phrase[14]=\"");
      out.print( pagexc2Data.getWord("Mar"));
      out.write("\";\r\n");
      out.write("phrase[15]=\"");
      out.print( pagexc2Data.getWord("Apr"));
      out.write("\";\r\n");
      out.write("phrase[16]=\"");
      out.print( pagexc2Data.getWord("May"));
      out.write("\";\r\n");
      out.write("phrase[17]=\"");
      out.print( pagexc2Data.getWord("Jun"));
      out.write("\";\r\n");
      out.write("phrase[18]=\"");
      out.print( pagexc2Data.getWord("Jul"));
      out.write("\";\r\n");
      out.write("phrase[19]=\"");
      out.print( pagexc2Data.getWord("Aug"));
      out.write("\";\r\n");
      out.write("phrase[20]=\"");
      out.print( pagexc2Data.getWord("Sep"));
      out.write("\";\r\n");
      out.write("phrase[21]=\"");
      out.print( pagexc2Data.getWord("Oct"));
      out.write("\";\r\n");
      out.write("phrase[22]=\"");
      out.print( pagexc2Data.getWord("Nov"));
      out.write("\";\r\n");
      out.write("phrase[23]=\"");
      out.print( pagexc2Data.getWord("Dec"));
      out.write("\";\r\n");
      out.write("phrase[24]=\"");
      out.print( pagexc2Data.getWord("Sunday"));
      out.write("\";\r\n");
      out.write("phrase[25]=\"");
      out.print( pagexc2Data.getWord("Monday"));
      out.write("\";\r\n");
      out.write("phrase[26]=\"");
      out.print( pagexc2Data.getWord("Tuesday"));
      out.write("\";\r\n");
      out.write("phrase[27]=\"");
      out.print( pagexc2Data.getWord("Wednesday"));
      out.write("\";\r\n");
      out.write("phrase[28]=\"");
      out.print( pagexc2Data.getWord("Thursday"));
      out.write("\";\r\n");
      out.write("phrase[29]=\"");
      out.print( pagexc2Data.getWord("Friday"));
      out.write("\";\r\n");
      out.write("phrase[30]=\"");
      out.print( pagexc2Data.getWord("Saturday"));
      out.write("\";\r\n");
      out.write("phrase[31]=\"");
      out.print( pagexc2Data.getWord("Sun"));
      out.write("\";\r\n");
      out.write("phrase[32]=\"");
      out.print( pagexc2Data.getWord("Mon"));
      out.write("\";\r\n");
      out.write("phrase[33]=\"");
      out.print( pagexc2Data.getWord("Tue"));
      out.write("\";\r\n");
      out.write("phrase[34]=\"");
      out.print( pagexc2Data.getWord("Wed"));
      out.write("\";\r\n");
      out.write("phrase[35]=\"");
      out.print( pagexc2Data.getWord("Thu"));
      out.write("\";\r\n");
      out.write("phrase[36]=\"");
      out.print( pagexc2Data.getWord("Fri"));
      out.write("\";\r\n");
      out.write("phrase[37]=\"");
      out.print( pagexc2Data.getWord("Sat"));
      out.write("\";\r\n");
      out.write("phrase[38]=\"");
      out.print( pagexc2Data.getWord("Su"));
      out.write("\";\r\n");
      out.write("phrase[39]=\"");
      out.print( pagexc2Data.getWord("Mo"));
      out.write("\";\r\n");
      out.write("phrase[40]=\"");
      out.print( pagexc2Data.getWord("Tu"));
      out.write("\";\r\n");
      out.write("phrase[41]=\"");
      out.print( pagexc2Data.getWord("We"));
      out.write("\";\r\n");
      out.write("phrase[42]=\"");
      out.print( pagexc2Data.getWord("Th"));
      out.write("\";\r\n");
      out.write("phrase[43]=\"");
      out.print( pagexc2Data.getWord("Fr"));
      out.write("\";\r\n");
      out.write("phrase[44]=\"");
      out.print( pagexc2Data.getWord("Sa"));
      out.write("\";\r\n");
      out.write("phrase[45]=\"");
      out.print( pagexc2Data.getWord(" Today "));
      out.write("\";\r\n");
      out.write("phrase[46]=\"");
      out.print( pagexc2Data.getWord("Clear"));
      out.write("\";\r\n");
      out.write("phrase[47]=\"");
      out.print( pagexc2Data.getWord("Back"));
      out.write("\";\r\n");
      out.write("phrase[48]=\"");
      out.print( pagexc2Data.getWord("Close"));
      out.write("\";\r\n");
      out.write("phrase[49]=\"");
      out.print( pagexc2Data.getWord("Reset"));
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pagexc2Data.closeConnection(); 
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<!-- Calendrier début -->\r\n");
      out.write("<script language=\"javascript\" src=\"../Resources_pages/xc2_default.js\"></script>\r\n");
      out.write("<script language=\"javascript\">xcAutoHide=1000;</script>\r\n");
      out.write("<script language=\"javascript\" src=\"../Resources_pages/xc2_inpage.js\"></script>\r\n");
      out.write("<!-- Calendrier fin -->\r\n");
      out.write("\r\n");

String source_file_name = "";
  if (MultipartFormDataRequest.isMultipartFormData(request))
  {
      MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

      upBean.store(mrequest);
      //upload = true;
      Vector histVect = upBean.getHistory();
	  if(histVect.size() <= 0)
	  {
	  
      out.write("\r\n");
      out.write("\t  \t<script> alert(\"");
      out.print( pageloadhData.getWord("Please choose a file"));
      out.write("\");</script>\r\n");
      out.write("\t\t\r\n");
      out.write("\t  ");

	  	upload = false;
	  }
	  else
	  {
      	UploadParameters lastParams = (UploadParameters) histVect.elementAt(0);
      	source_file_name = lastParams.getFilename();
	  	if(source_file_name.endsWith(".csv"))
	  		upload = true;
	  	else
	  	{	  	
	 
      out.write("\r\n");
      out.write("\t   \t\t<script> alert(\"");
      out.print( pageloadhData.getWord("Invalid input file"));
      out.write("\");</script>\r\n");
      out.write("\t ");

	 		upload = false;
	  	}
     }//histVect.size()>0
  }//if (MultipartFormDataRequest.isMultipartFormData(request))
    
  Vector<String> groupNames = new Vector();
  Vector<String> groupIds = new Vector();
  String getGrouprQry = "Select DBID, NAME from `cfg_agent_group` where tenant_DBID = '"+tenantDbid +"'";
  //System.out.println("\n****** LOAD HORAIRES ***********************************\n\n");
  //System.out.println("----- la liste des groupes est: "+ getGrouprQry);
  
  //get info from database
  try{
  	
	//get tenant info list
  	ResultSet groupRs = pageloadhData.executeFromString(getGrouprQry);
  	while(groupRs.next())
	{
		groupNames.add(groupRs.getString("NAME"));
		groupIds.add(groupRs.getString("DBID"));
	}//while(tenantRs.next())
	
  	
  }//try
  catch (Exception e) {
 	e.printStackTrace();
  }
  
  
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("/*\theight:\t\t200px;*/\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane\r\n");
      out.write("-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("\t/* background:\tThreeDFace; */\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("}\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write("body {\r\n");
      out.write("\tmargin:\t\t10px;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control h2 {\r\n");
      out.write("\ttext-align:\tcenter;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control h2 a {\r\n");
      out.write("\tdisplay:\tinline;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control a:hover {\r\n");
      out.write("\tbackground: transparent;\r\n");
      out.write("}\r\n");
      out.write(".active-controls-grid {border: 1px solid #ccc}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("function getAction(){\r\n");
      out.write("/******************\r\n");
      out.write("\tvar nbGroup = 0;\r\n");
      out.write("\tfor(i=document.loadhoraire.group_dbid.selectedIndex;i<document.loadhoraire.group_dbid.options.length;i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif (document.loadhoraire.group_dbid.options[i].selected)\r\n");
      out.write("\t\t\tnbGroup++;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(nbGroup<=0)\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"Please select a group.\");\r\n");
      out.write("\t\tdocument.loadhoraire.action = 'LoadHoraire.jsp?source_file_name=");
      out.print(source_file_name);
      out.write("' ;\r\n");
      out.write("\t\t//return false;\r\n");
      out.write("\t\t\r\n");
      out.write("\t} **********************/\r\n");
      out.write("  document.loadhoraire.action = '/aheevaccs/servlet/LoadScheduleServlet?tenant_dbid=");
      out.print(tenantDbid);
      out.write("' ;\r\n");
      out.write("  \r\n");
      out.write("  return true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function upload(){   \r\n");
      out.write("  document.loadhoraire.action = 'LoadHoraire.jsp?tenant_dbid=");
      out.print(tenantDbid);
      out.write("' ;\r\n");
      out.write("return true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<title>Atelka - Load Horaire</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"sched_body\">\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"loadhoraire\"  method=\"post\"\r\n");

		if(upload==false )
			out.write("enctype=\"multipart/form-data\"");
	
      out.write("\r\n");
      out.write(">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( pageloadhData.getWord("Import"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage1\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>");
      out.print( pageloadhData.getWord("load schedule Wizard"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("                  ");
 if(msg != null && msg.compareTo("1")== 0 ){ 
      out.write("\r\n");
      out.write("                  <tr>&nbsp;&nbsp; </tr>\r\n");
      out.write("\t\t\t\t  <tr> <td align=\"left\" style=\"color:blue\" ; font-weight:bold> ");
      out.print( pageloadhData.getWord("Schedule Submited"));
      out.write("   </td></tr>\r\n");
      out.write("\t\t\t\t  ");
}
      out.write("\r\n");
      out.write("\t\t\t\t  ");
 if(msg != null && msg.compareTo("0")== 0 ){ 
      out.write("\r\n");
      out.write("\t\t\t\t  <tr>&nbsp;&nbsp; </tr>\r\n");
      out.write("                  <tr> <td align=\"left\" style=\"color:red\" ; font-weight:bold > ");
      out.print( pageloadhData.getWord("Error occured while submitting schedule"));
      out.write("   </td></tr>\r\n");
      out.write("\t\t\t\t  ");
}
      out.write("\r\n");
      out.write("\t\t\t\t  \r\n");
      out.write("\t\t\t\t  <tr>\r\n");
      out.write("\t\t\t\t  <td>\r\n");
      out.write("\t\t\t\t   ");
      out.print( pageloadhData.getWord("Please upload a file with csv format (*.csv)"));
      out.write("<br>\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t </tr>\r\n");
      out.write("\t\t\t\t <tr>\r\n");
      out.write("\t\t\t\t  <td>\r\n");
      out.write("\t\t\t\t  ");
      out.print( pageloadhData.getWord("Source file name:"));
      out.write("\r\n");
      out.write("                                    ");
 if(upload==false ){ 
      out.write("\r\n");
      out.write("                                     <input name=\"source_file_name\" type=\"file\" size=\"40\" >\r\n");
      out.write("                                    ");
}else{
      out.write("\r\n");
      out.write("                                     ");
out.write(source_file_name);
      out.write("\r\n");
      out.write("                                   ");
}
      out.write("\r\n");
      out.write("                                    <input type=\"hidden\" name=\"fileName\" value='");
out.write(source_file_name);
      out.write("'>\r\n");
      out.write("                                  </td>\r\n");
      out.write("\t\t\t\t\t\t\t\t </tr>\r\n");
      out.write("                                 ");
 if(upload==true ){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr><td>");
      out.print( pageloadhData.getWord("Agent group"));
      out.write("\r\n");
      out.write("                                &nbsp;&nbsp;\r\n");
      out.write("                 \r\n");
      out.write("\t\t\t\t<select name=\"group_dbid\" >\t   \r\n");
      out.write("\t\t\t\t");
for(int i=0; i<groupIds.size(); i++){
      out.write("\r\n");
      out.write("  \t\t\t\t<option value=\"");
      out.print(groupIds.elementAt(i));
      out.write('"');
      out.write('>');
      out.print(groupNames.elementAt(i));
      out.write("</option>\r\n");
      out.write("            \t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("                               </td></tr>\r\n");
      out.write("                               ");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t <td>\r\n");
      out.write("                                                 ");
 if(upload==false ){ 
      out.write("\r\n");
      out.write("                                                 <input type=\"submit\" name=\"loadButton\" value=\"");
      out.print( pageloadhData.getWord("upload"));
      out.write("\" onClick=\"return upload();\">\r\n");
      out.write("                                                 ");
}else{
      out.write("\r\n");
      out.write("\t\t\t\t\t\t <input type=\"submit\" name=\"submitButton\" value=\"");
      out.print( pageloadhData.getWord("submit"));
      out.write("\"  onClick=\"return getAction();\">\r\n");
      out.write("                                                 ");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\tsetupAllTabs();\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"TempMessages\" id=\"TempMessages\">\r\n");
      out.write("  <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\">\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td width=\"100%\" id=\"TempMsg\" align=\"center\" class=\"TempMsg\"></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
pageloadhData.closeConnection(); 
      out.write("\r\n");
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
