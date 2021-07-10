package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;

public final class campaignStatsGraph_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/Resources_pages/agentGroupFunctions_labels.jsp");
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
      response.setContentType("text/html; charset=iso-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

beanManagerData pageCamsData = new beanManagerData();
pageCamsData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCamsData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style.css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<meta http-equiv=\"Content-Language\" content=\"en-us\">\r\n");
      out.write('\r');
      out.write('\n');

beanManagerData pageGrpFData = new beanManagerData();
pageGrpFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageGrpFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var GrpF= new Array();\r\n");
      out.write("GrpF[0]=\"");
      out.print(pageGrpFData.getWord("Save") );
      out.write("\";\r\n");
      out.write("GrpF[1]=\"");
      out.print(pageGrpFData.getWord("AGERR Length") );
      out.write("\";\r\n");
      out.write("GrpF[2]=\"");
      out.print(pageGrpFData.getWord("AGERR Char") );
      out.write("\";\r\n");
      out.write("GrpF[3]=\"");
      out.print(pageGrpFData.getWord("You must enter a GROUP NAME") );
      out.write("\";\r\n");
      out.write("GrpF[4]=\"");
      out.print(pageGrpFData.getWord("Invalid use of character") );
      out.write("\";\r\n");
      out.write("GrpF[5]=\"");
      out.print(pageGrpFData.getWord("Group name") );
      out.write("\";\r\n");
      out.write("GrpF[6]=\"");
      out.print(pageGrpFData.getWord("You must enter a GROUP QUEUE") );
      out.write("\";\r\n");
      out.write("GrpF[7]=\"");
      out.print(pageGrpFData.getWord("Queue name") );
      out.write("\";\r\n");
      out.write("GrpF[8]=\"");
      out.print(pageGrpFData.getWord("Your description should be filled. Use valid characters.") );
      out.write("\";\r\n");
      out.write("GrpF[9]=\"");
      out.print(pageGrpFData.getWord("The maximum wrap up time must be in seconds") );
      out.write("\";\r\n");
      out.write("GrpF[10]=\"");
      out.print(pageGrpFData.getWord("The maximum wrap up time must be less than 99999 seconds") );
      out.write("\";\r\n");
      out.write("GrpF[11]=\"");
      out.print(pageGrpFData.getWord("The maximum wrap up time must be at least 1 second") );
      out.write("\";\r\n");
      out.write("GrpF[12]=\"");
      out.print(pageGrpFData.getWord("The maximum wrap up time that does not affect productivity must be in seconds") );
      out.write("\";\r\n");
      out.write("GrpF[13]=\"");
      out.print(pageGrpFData.getWord("This QUEUE is already assigned. You must enter a NEW QUEUE") );
      out.write("\";\r\n");
      out.write("GrpF[14]=\"");
      out.print(pageGrpFData.getWord("You must enter the encryption server IP or uncheck the encryption box") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("GrpF[15]=\"");
      out.print(pageGrpFData.getWord("You must enter the encryption method or uncheck the encryption box") );
      out.write("\";\r\n");
      out.write("GrpF[16]=\"");
      out.print(pageGrpFData.getWord("Agent group already exists") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("GrpF[17]=\"");
      out.print(pageGrpFData.getWord("Minimum recording time must be smaller than maximum recording time") );
      out.write("\";\r\n");
      out.write("GrpF[18]=\"");
      out.print(pageGrpFData.getWord("Are you sure you wish to delete this group?") );
      out.write("\";\r\n");
      out.write("GrpF[19]=\"");
      out.print(pageGrpFData.getWord("A running campaign uses this group! You can't delete it") );
      out.write("\";\r\n");
      out.write("GrpF[20]=\"");
      out.print(pageGrpFData.getWord("Delete") );
      out.write("\";\r\n");
      out.write("GrpF[21]=\"");
      out.print(pageGrpFData.getWord("There is no active non-global not-ready-reason in the system.") );
      out.write("\";\r\n");
      out.write("GrpF[22]=\"");
      out.print(pageGrpFData.getWord("You cannot select a reason several times") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageGrpFData.closeConnection(); 
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"agentGroupFunctions.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("var this_cmpName = normalizeString(QueryString('campaign_name'));\r\n");
      out.write("var sTring = String( appletObj.getCampaignStats(this_cmpName) );\r\n");
      out.write("sTringArray = sTring.split(\",\");\r\n");
      out.write("\r\n");
      out.write("var cmpTotalAnswers = sTringArray[1];\r\n");
      out.write("var cmpTotalNoAnswers = sTringArray[2];\r\n");
      out.write("var cmpTotalAbandonned = sTringArray[3];\r\n");
      out.write("var cmpTotalAnswerMachine = sTringArray[4];\r\n");
      out.write("var cmpTotalSIT = sTringArray[5];\r\n");
      out.write("var cmpTotalBusy = sTringArray[6];\r\n");
      out.write("var cmpTotalFax = sTringArray[7];\r\n");
      out.write("var cmpTotalDials = parseInt(cmpTotalAnswers) + \r\n");
      out.write("\t\t\t\t\tparseInt(cmpTotalNoAnswers) + \r\n");
      out.write("\t\t\t\t\tparseInt(cmpTotalAbandonned) + \r\n");
      out.write("\t\t\t\t\tparseInt(cmpTotalAnswerMachine) + \r\n");
      out.write("\t\t\t\t\tparseInt(cmpTotalSIT) + \r\n");
      out.write("\t\t\t\t\tparseInt(cmpTotalBusy) + \r\n");
      out.write("\t\t\t\t\tparseInt(cmpTotalFax);\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<fieldset>\r\n");
      out.write("\t\t<legend>");
      out.print( pageCamsData.getWord("Statistics") );
      out.write("</legend>\n");
      out.write("\t\t<table border=\"0\">\r\n");
      out.write("\t\t\t<tr style=\"BACKGROUND-COLOR: #c4e0f0\">\r\n");
      out.write("\t\t\t\t<td colSpan=\"2\">\r\n");
      out.write("\t\t\t\t\t<script>");
      out.print( pageCamsData.getWord("Campaign"));
      out.write(" [\n");
      out.write("\t\t\t\t\t<script language=\"javascript\" type=\"text/javascript\">document.write(this_cmpName);</script>\r\n");
      out.write("\t\t\t\t\t]\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colSpan=\"2\">\r\n");
      out.write("\t\t\t\t\t<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<applet code=\"Manager.PieChart.PiechartApplet.class\" archive=\"../sAheevaChart.jar\" width=\"550\" height=\"250\" mayscript name=\"graphApplet\">');\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Start Up Parameters -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"LOADINGMESSAGE\" value=\"");
      out.print( pageCamsData.getWord("Creating Chart - Please Wait."));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"STEXTCOLOR\"     value=\"0,0,100\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"STARTUPCOLOR\"   value=\"255,255,255\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Character Encoding -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"charset\"   value=\"8859_1\">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Chart Switches -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"3D\"                 value=\"true\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"Slabels\"            value=\"true\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"legend\"             value=\"true\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"displayPercentages\" value=\"true\">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Chart Characteristics -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"width\"      value=\"550\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"height\"     value=\"250\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"nPies\"      value=\"1\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"depth3D\"    value=\"15\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"ndecplaces\" value=\"0\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"3Dangle\"    value=\"50\">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Thousand separator -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"thousandseparator\" value=\".\">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Link Cursor -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!--  valid values are - crosshair, default, hand, move, text or wait -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"linkCursor\" value=\"default\">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Popup segment Value Pre & Post Symbols -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"valuepresym\"  value=\"\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"valuepostsym\"  value=\" \">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Additional font information -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"popupfont\"  value=\"Arial,B,12\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"slabelfont\" value=\"Arial,N,10\">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Additional color information -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"bgcolor\"      value=\"white\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"labelcolor\"   value=\"50,50,50\">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Legend Information -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"legendfont\"       value=\"Arial,N,10\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"legendposition\"   value=\"400,10\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"legendtitle\"      value=\"");
      out.print( pageCamsData.getWord("Dials"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"LegendBackground\" value=\"255,255,255\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"LegendBorder\"     value=\"125,125,125\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"LegendtextColor\"  value=\"0,0,0\">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Title -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- title   text|xpos,ypos|Font|Color Defintion\"> -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!--<PARAM name=\"title\" value=\"Dials statistics|180,15|Arial,BI,16|grey\">-->');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Free Form Text -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!--  textN  text|xpos,ypos|Font|Color Defintion\"> -->');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Pie Data -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!--  PieN   x,y,size,number of segments, seperation -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"Pie1\" value=\"110,50,175,7,5\">');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Pie Segement Labels -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"pie1label1\" value=\"");
      out.print( pageCamsData.getWord("Answered"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"pie1label2\" value=\"");
      out.print( pageCamsData.getWord("No answer"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"pie1label3\" value=\"");
      out.print( pageCamsData.getWord("Abandoned"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"pie1label4\" value=\"");
      out.print( pageCamsData.getWord("Answer machine"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"pie1label5\" value=\"");
      out.print( pageCamsData.getWord("SIT"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"pie1label6\" value=\"");
      out.print( pageCamsData.getWord("Busy"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"pie1label7\" value=\"");
      out.print( pageCamsData.getWord("Fax"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Segment Data -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- segmentN       series color|legend label|URL|Target Frame -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"segment1\" value=\"115,152,164|");
      out.print( pageCamsData.getWord("Answered"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t    document.write('<PARAM name=\"segment2\" value=\"99,99,156|");
      out.print( pageCamsData.getWord("No answer"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"segment3\" value=\"185,53,8|");
      out.print( pageCamsData.getWord("Abandoned"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"segment4\" value=\"239,214,115|");
      out.print( pageCamsData.getWord("Answer machine"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"segment5\" value=\"0,63,68|");
      out.print( pageCamsData.getWord("SIT"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"segment6\" value=\"17,97,158|");
      out.print( pageCamsData.getWord("Busy"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"segment7\" value=\"17,97,0|");
      out.print( pageCamsData.getWord("Fax"));
      out.write("\">');\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Images -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- imageN    imageURL,x position,y position -->');\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!-- Pie Data -->');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<!--                value,URL,Target Frame -->');\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"data1series1\" value=\"'+cmpTotalAnswers+'\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"data2series1\" value=\"'+cmpTotalNoAnswers+'\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"data3series1\" value=\"'+cmpTotalAbandonned+'\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"data4series1\" value=\"'+cmpTotalAnswerMachine+'\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"data5series1\" value=\"'+cmpTotalSIT+'\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"data6series1\" value=\"'+cmpTotalBusy+'\">');\r\n");
      out.write("\t\t\t\t\t\t\tdocument.write('<PARAM name=\"data7series1\" value=\"'+cmpTotalFax+'\">');\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\tdocument.write('</applet>');\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t  \r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
pageCamsData.closeConnection(); 
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
