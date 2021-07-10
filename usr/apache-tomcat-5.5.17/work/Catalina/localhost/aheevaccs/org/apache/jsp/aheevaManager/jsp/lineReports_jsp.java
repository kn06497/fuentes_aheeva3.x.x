package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import aheevaManager.reports.*;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import aheevaManager.ressources.*;
import jxl.*;

public final class lineReports_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n");
      out.write("\t\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
      out.write("<html>\n");
      out.write("<LINK href=\"../Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageLineRData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageLineRData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageLineRData.openConnection();

      out.write("\n");
      out.write("<head>\n");
      out.write("<title>AheevaCCS - Line Usage Details Report1</title>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/tab_luna.css\" />\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/style_2.css\" />\n");
      out.write("<style type=\"text/css\">\n");
      out.write(".dynamic-tab-pane-control .tab-page {\n");
      out.write("\theight:\t\tauto;\n");
      out.write("\t/*width:      550px;*/\n");
      out.write("}\n");
      out.write("\n");
      out.write("html, body { \n");
      out.write("\tbackground:\t#E1F4FF;\n");
      out.write("}\n");
      out.write("\n");
      out.write("form {\n");
      out.write("\tmargin:\t\t40px;\n");
      out.write("\tpadding:\t0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* over ride styles from webfxlayout */\n");
      out.write("\n");
      out.write("body {\n");
      out.write("\tmargin:\t\t10px;\n");
      out.write("\twidth:\t\tauto;\n");
      out.write("\theight:\t\tauto;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dynamic-tab-pane-control h2 {\n");
      out.write("\ttext-align:\tcenter;\n");
      out.write("\twidth:\t\tauto;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dynamic-tab-pane-control h2 a {\n");
      out.write("\tdisplay:\tinline;\n");
      out.write("\twidth:\t\tauto;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dynamic-tab-pane-control a:hover {\n");
      out.write("\tbackground: transparent;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".imgControl {\n");
      out.write("\ttop: 1;\n");
      out.write("\tposition:\t\trelative;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var lang =normalizeString(QueryString('lang'));\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("<!---\n");
      aheevaManager.reports.beanSummaryReport beanGroupSummary = null;
      synchronized (request) {
        beanGroupSummary = (aheevaManager.reports.beanSummaryReport) _jspx_page_context.getAttribute("beanGroupSummary", PageContext.REQUEST_SCOPE);
        if (beanGroupSummary == null){
          beanGroupSummary = new aheevaManager.reports.beanSummaryReport();
          _jspx_page_context.setAttribute("beanGroupSummary", beanGroupSummary, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\n");
      out.write("--->\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");

	String language =request.getParameter("lang");
	String startingDateDaily = request.getParameter("startingDateDaily");
	String endingDateDaily = request.getParameter("endingDateDaily");
	//String[] tabObj =null;
    //StringTokenizer tok = null, tokGrp =null;
   
	String startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
	String endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) +" 23:59:59";
	String from ="";

      out.write("\n");
      out.write("\n");
      out.write("\t<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\n");
      out.write("\t<tr valign=\"top\">\n");
      out.write("\t\t<td width=\"25%\" align=\"right\">\n");
      out.write("\t\t\t<button type=\"button\" style=\"border:none; background:none; cursor:hand;\" onClick=\"window.open('printLineReports.jsp?startingDateDaily=");
out.write(startingDateDaily) ;
      out.write("&endingDateDaily=");
out.write(endingDateDaily) ; 
      out.write("&lang=");
out.write(language); 
      out.write("')\"><img src=\"../img/printer.gif\" border=\"0\"></button>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t</table>\n");
      out.write("\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\n");
      out.write("<form name=\"lineReports\">\n");
      out.write("<div class=\"tab-page\" id=\"tabPage1\">\n");
      out.write("\n");
      out.write("<fieldset>\n");
      out.write("\n");
      out.write("\t<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\n");
      out.write("\t\n");
      out.write("\t\t</td>\n");
      out.write("\t\t<tr><td width=\"100%\" align=\"center\"><table width=\"70%\" align=\"center\"><tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t<tr><td width=\"100%\" align=\"center\"><b>");
      out.print( pageLineRData.getWord("Line usage details")  );
      out.write("</b></td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\t\n");
      out.write("\t</table>\t\t\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"100%\" align=\"center\">\n");
      out.write("\t\t\t<table width=\"70%\" align=\"center\">\n");
      out.write("\t\t\t\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td width=\"100%\" align=\"center\"> \n");
      out.write("\t\t\t\t\t\t<b>\n");
      out.write("\t\t\t\t\t\t\t");
 out.write(pageLineRData.getWord("From")); 
      out.write("\n");
      out.write("\t\t\t\t\t\t\t&nbsp;&nbsp; ");
	
							out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							
      out.write("&nbsp; ");

							out.write(pageLineRData.getWord("To"));
							
      out.write("&nbsp; ");

							out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							
      out.write("\n");
      out.write("\t\t\t\t\t\t</b>\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\t\t\t\n");
      out.write("\t\t\t</table>\t\t\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr><td height=\"20\"></td></tr>\n");
      out.write("\t");
 	//beanManagerData pageData = new beanManagerData();
		String query = "SELECT DATE_FORMAT(EVENT_TIME, '%Y-%m-%d %H:00:00') AS DATE_HOUR, MAX(TOTAL_USED_LINES) AS PEAK_USED, MAX(AVALAIBLE_LINES) AS AVALAIBLE_LINES";
		query += " FROM(SELECT EVENT_TIME, SUM(NB_LINES_USED_GLOBAL) AS TOTAL_USED_LINES, SUM(IF(TOTAL_LINES_AVAILABLE >= 0, TOTAL_LINES_AVAILABLE, 0)) AS AVALAIBLE_LINES FROM (";
		query += "SELECT EVENT_TIME, SERVER_NAME, NB_LINES_USED_GLOBAL, TOTAL_LINES_AVAILABLE FROM datamart_line_status";
		query += " WHERE event_time BETWEEN '"+startingDate+"' and '" +endingDate + "'";
		query += " GROUP BY EVENT_TIME,SERVER_NAME) BY_SERVER GROUP BY EVENT_TIME) BY_HOUR GROUP BY DATE_FORMAT(EVENT_TIME, '%Y-%m-%d %H:00:00')" ;
		
		DataSource m_ds = null;
		try {
      		Context init = new InitialContext();
      		Context ctx = (Context) init.lookup("java:comp/env");
      		if (ctx == null) {
        	throw new Exception("Line report - No Context");
     	 	}
     	 	m_ds = (DataSource) ctx.lookup("jdbc/aheevaccs_report");
      		if (m_ds != null) {
        		System.out.println("Line report ---Got Context");
      		}      
    	}
    	catch (Exception e) {
      		e.printStackTrace();
    	}//good up to here
		
		java.sql.Statement stat = null;
    	java.sql.ResultSet rs =null;
		Connection conn = null;
	
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\t \n");
      out.write("\t  <td width=\"100%\" align=\"center\"><table  width=\"70%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" style=\"border-collapse:collapse \">\n");
      out.write("\t  \t<tr class=\"reportsForecastReport\" height=\"25\" bgcolor=\"#FFECF5\">\n");
      out.write("\t  \t<td align=\"center\" >");
      out.print( pageLineRData.getWord("Date & Time"));
      out.write("</td>\n");
      out.write("        <td  align=\"center\">");
      out.print( pageLineRData.getWord("Peak within the hour"));
      out.write("</td>\n");
      out.write("\t\t<td  align=\"center\">");
      out.print( pageLineRData.getWord("Number of available lines"));
      out.write("</script></td>\t\n");
      out.write("\t\t</tr>\t\t   \t \n");
      out.write("\t  ");

	  try{
			conn = m_ds.getConnection();
      		stat = conn.createStatement();
			rs = stat.executeQuery(query);
			//if(rs != null)
				//System.out.println("Line report ---------rs not null");
			int i =0;
	 		while(rs.next()){
	  
      out.write("\n");
      out.write("\t  \t    \t\n");
      out.write("\t  <tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
								else out.write("class=reportsRowUnPair");
      out.write(">\n");
      out.write("\t  \t  <td  align=\"center\">");
out.write( rs.getString(1) );
      out.write("</td>\n");
      out.write("\t  \t  <td  align=\"center\">");
out.write( rs.getString(2) );
      out.write("</td>\n");
      out.write("\t  \t  <td  align=\"center\">");
out.write( rs.getString(3) );
      out.write("</td>\n");
      out.write("\t  </tr>\n");
      out.write("\t  \n");
      out.write("\t  ");
 	i++;
	  	 }// while(rs.next())
	  
      out.write("\t  \n");
      out.write("\t\t</table>\n");
      out.write("   </tr>\n");
      out.write("\t\n");
      out.write("</table>\n");
      out.write("\n");

	  rs.close();
      rs = null;
      stat.close();
      stat = null;
      conn.close();
      conn = null;
	  }//try
	  catch (Exception ee) {
	  	System.out.println("line report -----error");
      	ee.printStackTrace();
      }
	 finally {
       try {
         if (stat != null) {
           stat.close();
         }
         if (conn != null) {
           conn.close();
         }
       }
       catch (Exception e) {
         e.printStackTrace();
       }
     }//finally 

      out.write("\n");
      out.write("\t\n");
      out.write("</fieldset>\t\n");
      out.write("</div>\n");
      out.write("</form>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
 pageLineRData.closeConnection(); 
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
