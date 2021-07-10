package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import aheevaManager.wfm_schedule.*;
import aheevaManager.ressources.*;

public final class report_jsp extends org.apache.jasper.runtime.HttpJspBase
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
beanManagerData reportData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	reportData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
reportData.openConnection();

      out.write("\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>AheevaCCS - Sheduled Agent's Reports1</title>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"../Resources_pages/style_2.css\" />\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write("html, body { \r\n");
      out.write("\tbackground:\t#E1F4FF;\r\n");
      out.write("}\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t40px;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("}\r\n");
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
      out.write(".imgControl {\r\n");
      out.write("\ttop: 1;\r\n");
      out.write("\tposition:\t\trelative;\t\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      aheevaManager.wfm_schedule.beanWeekReport rp = null;
      synchronized (request) {
        rp = (aheevaManager.wfm_schedule.beanWeekReport) _jspx_page_context.getAttribute("rp", PageContext.REQUEST_SCOPE);
        if (rp == null){
          rp = new aheevaManager.wfm_schedule.beanWeekReport();
          _jspx_page_context.setAttribute("rp", rp, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

	String language =request.getParameter("lang");
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
	
    String sRet= "", startDate ="", endDate ="";
    int i,j,k;
	String[] tabObj =null;
	
	startDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
	endDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;

    String agentGroups  = request.getParameter("group");
    StringTokenizer tok = null, tokGrp=null,  tokn = null;
    String agentGroupName ="", agentGroup ="";

    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    int numCampaigns = tok.countTokens();
	tabObj =new String[numCampaigns];
    for( k = 0; k <numCampaigns; k++ ) {
        String agentGroupTemp = tok.nextToken();
        tokGrp = new java.util.StringTokenizer(agentGroupTemp,",");
        agentGroupName =tokGrp.nextToken();
        agentGroup = tokGrp.nextToken();
    }	

	
	//System.out.println("fin for tabObj ");

      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\t\r\n");
      out.write("<form>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t<fieldset>\r\n");

	System.out.println("Agent Login report for group: " + agentGroup);
    sRet = 	rp.buildSheduledReportForPeriod(agentGroup,startDate,endDate);
	if(sRet == "success")
	{
		System.out.println("sRet == success");
		
      out.write("\r\n");
      out.write("\t\t\t<table  border=\"0\" align=\"center\">\r\n");
      out.write("\t\t\t<tr height=\"20\"></tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"100%\" class=\"reportsID\" align=\"center\"><b>\r\n");
      out.write("\t\t\t\t\t<b>");
      out.print( reportData.getWord("Agent group"));
      out.write("</b>:   ");
out.write(rp.getGroupName(agentGroup));
      out.write("  </b>\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t <td class=\"reportsID\"><b>\r\n");
      out.write("\t\t\t\t\t <b>");
      out.print( reportData.getWord("Scheduled"));
      out.write(' ');
      out.print( reportData.getWord("agents"));
      out.write(' ');
      out.print( reportData.getWord("From"));
      out.write(":\n");
      out.write("\t\t\t\t\t");
out.write(startingDateDaily);	
      out.write("\r\n");
      out.write("\t\t\t\t   ");
      out.print( reportData.getWord("To"));
      out.write("\n");
      out.write("\t\t\t\t\t");
out.write(endingDateDaily);	
      out.write("\r\n");
      out.write("\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t   </table>\r\n");
      out.write("\t\t\t<br><br>\r\n");
      out.write("\t\t\t<table border=0 align=\"center\">\r\n");
      out.write("\t\t\t<tr bgcolor=\"#D9ECEC\">\r\n");
      out.write("\t\t\t<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>\r\n");
      out.write("\t\t\t<td bgcolor='#ffffff'>&nbsp;</td>\r\n");
      out.write("\t\t\t<td colspan=\"2\" width=\"80\" align=\"center\">");
      out.print( reportData.getWord("Sunday"));
      out.write("</td>\n");
      out.write("\t\t\t<td colspan=\"2\" width=\"80\" align=\"center\">");
      out.print( reportData.getWord("Monday"));
      out.write("</td>\n");
      out.write("\t\t\t<td colspan=\"2\" width=\"80\" align=\"center\">");
      out.print( reportData.getWord("Tuesday"));
      out.write("</td>\n");
      out.write("\t\t\t<td colspan=\"2\" width=\"80\" align=\"center\">");
      out.print( reportData.getWord("Wednesday"));
      out.write("</td>\n");
      out.write("\t\t\t<td colspan=\"2\" width=\"80\" align=\"center\">");
      out.print( reportData.getWord("Thursday"));
      out.write("</td>\n");
      out.write("\t\t\t<td colspan=\"2\" width=\"80\" align=\"center\">");
      out.print( reportData.getWord("Friday"));
      out.write("</td>\n");
      out.write("\t\t\t<td colspan=\"2\" width=\"80\" align=\"center\">");
      out.print( reportData.getWord("Saturday"));
      out.write("</td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t\t<td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Log in"));
      out.write("</td><td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Sched"));
      out.write("</td>\n");
      out.write("\t\t\t<td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Log in"));
      out.write("</td><td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Sched"));
      out.write("</td>\n");
      out.write("\t\t\t<td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Log in"));
      out.write("</td><td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Sched"));
      out.write("</td>\n");
      out.write("\t\t\t<td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Log in"));
      out.write("</td><td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Sched"));
      out.write("</td>\n");
      out.write("\t\t\t<td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Log in"));
      out.write("</td><td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Sched"));
      out.write("</td>\n");
      out.write("\t\t\t<td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Log in"));
      out.write("</td><td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Sched"));
      out.write("</td>\n");
      out.write("\t\t\t<td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Log in"));
      out.write("</td><td width=\"40\" align=\"center\">");
      out.print( reportData.getWord("Sched"));
      out.write("</td>\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

			String key="";
			beanWeekInfos r1 =null;
			for( i =0; i < rp.keys.size() ; i++ )
			{
				key ="";
				key = (String)rp.keys.elementAt(i);
				r1 =(beanWeekInfos)rp.key_vector.get(key);
				if(r1 !=null)
				{
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr ");
 if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");
      out.write(" >\r\n");
      out.write("\t\t\t\t\t<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
out.write(r1.key);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECEC\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_sunday_login/900.0) ,2));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#E7CFCF\">");
out.write(Long.toString(r1.nb_sunday_shed));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECEC\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_monday_login/900.0) ,2));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#E7CFCF\">");
out.write(Long.toString(r1.nb_monday_shed));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECEC\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_tuesday_login/900.0) ,2));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#E7CFCF\">");
out.write(Long.toString(r1.nb_tuesday_shed));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECEC\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_wednesday_login/900.0) ,2));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#E7CFCF\">");
out.write(Long.toString(r1.nb_wednesday_shed));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECEC\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_thursday_login/900.0) ,2));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#E7CFCF\">");
out.write(Long.toString(r1.nb_thursday_shed));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECEC\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_friday_login/900.0) ,2));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#E7CFCF\">");
out.write(Long.toString(r1.nb_friday_shed));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#FFECEC\">");
out.write(r1.formatDecimalDouble(((double)r1.nb_saturday_login/900.0) ,2));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" bgcolor=\"#E7CFCF\">");
out.write(Long.toString(r1.nb_saturday_shed));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

				}
				else
				{
					System.out.println("\n In JSP Not found in vector Key: " +key);
				}
				
			
			}
			
      out.write("\r\n");
      out.write("\t\t\t<tr  bgcolor='#ffffff' height=\"10\" ><td colspan=\"17\">&nbsp;</td></tr>\r\n");
      out.write("\t\t\t");

			r1 =null;
			r1 =(beanWeekInfos)rp.m_vScheduledHours.elementAt(0);
			if(r1 !=null)
			{
			
      out.write("\r\n");
      out.write("\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>\r\n");
      out.write("\t\t\t\t<td bgcolor='#E4E4E4' align=\"center\"><b>");
      out.print( reportData.getWord("Scheduled Hours"));
//out.write("Scheduled Hours***");
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_sunday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_monday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4' colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_tuesday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_wednesday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4' colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_thursday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_friday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_saturday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");

			}
			r1 =null;
			r1 =(beanWeekInfos)rp.m_vScheduledHours.elementAt(1);
			if(r1 !=null)
			{
			
      out.write("\r\n");
      out.write("\t\t\t\t<tr  bgcolor=\"#FF91C8\">\r\n");
      out.write("\t\t\t\t<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>\r\n");
      out.write("\t\t\t\t<td bgcolor='#E4E4E4' align=\"center\"><b>");
      out.print( reportData.getWord("Real hours (without breaks)"));
//out.write("Real hours (without breaks)");
      out.write("</b></td>\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_sunday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_monday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4' colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_tuesday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_wednesday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4' colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_thursday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_friday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td  bgcolor='#E4E4E4'  colspan=\"2\" align=\"center\">");
out.write(Long.toString(r1.tot_time_saturday));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");
	
			}
			
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t");

	}
	else
		System.out.println("sRet no success");


      out.write("\t\r\n");
      out.write("\t\t</fieldset>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 reportData.closeConnection(); 
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
