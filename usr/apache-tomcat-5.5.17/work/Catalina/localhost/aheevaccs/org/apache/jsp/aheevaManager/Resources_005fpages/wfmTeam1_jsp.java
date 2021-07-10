package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.*;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;

public final class wfmTeam1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/Resources_pages/wfmTeam_labels.jsp");
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
      out.write("\r\n");
      out.write("<head>\r\n");
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
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write("<!-- Start Tab pane -->\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<link type=\"text/css\" rel=\"StyleSheet\" href=\"slider/css/luna.css\" />\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100px;\r\n");
      out.write("}\r\n");
      out.write("html, body {\r\n");
      out.write("\t/*background:\tThreeDFace;*/\r\n");
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
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Language\" content=\"en-us\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pagewfmData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pagewfmData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pagewfmData.openConnection();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("var wfm= new Array();\r\n");
      out.write("wfm[0]=\"");
      out.print( pagewfmData.getWord("Add a new team"));
      out.write("\";\r\n");
      out.write("wfm[1]=\"");
      out.print( pagewfmData.getWord("Modify the team"));
      out.write("\";\r\n");
      out.write("wfm[2]=\"");
      out.print( pagewfmData.getWord("Update team"));
      out.write("\";\r\n");
      out.write("wfm[3]=\"");
      out.print( pagewfmData.getWord("You must enter a TEAM NAME"));
      out.write("\";\r\n");
      out.write("wfm[4]=\"");
      out.print( pagewfmData.getWord("You must enter a TEAM LEADER NAME"));
      out.write("\";\r\n");
      out.write("wfm[5]=\"");
      out.print( pagewfmData.getWord("Invalid use of character"));
      out.write("\";\r\n");
      out.write("wfm[6]=\"");
      out.print( pagewfmData.getWord("Are you sure, you wish to delete this team ?"));
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pagewfmData.closeConnection(); 
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"wfmTeam.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"team_body\" onLoad=\"displayTeamInfo()\" onUnload=\" return checkOnUnload()\" >\r\n");
      out.write("\t<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("\t<form name=\"teamInfo\" onKeyDown=\"KeyDownHandler(save)\">\r\n");
      out.write(" <script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t\t\t\t\t<fieldset>\r\n");
      out.write("\t\t\t\t\t<legend id=\"caption\"></legend>\r\n");
      out.write(" <table border=\"0\" style=\"margin-top:10px;\">\r\n");
      out.write("    \r\n");
      out.write("    <tr>\r\n");
      out.write("      <td>");
      out.print( pageData.getWord("Team Name"));
      out.write("</td>\r\n");
      out.write("      <td colspan=\"2\"><input name=\"teamname\" type=\"text\" onClick=\"enabledUpdateButton()\"></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td>");
      out.print( pageData.getWord("Team Leader"));
      out.write("</td>\r\n");
      out.write("      <td colspan=\"2\"><input name=\"teamleader\" type=\"text\" onClick=\"enabledUpdateButton()\"></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("<!--Assign an agent -->\r\n");
      out.write("\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"561\" id=\"AutoNumber2\" height=\"157\">\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td height=\"10\" width=\"75\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td  height=\"146\">\r\n");
      out.write("     <table border=\"0\" width=\"100%\" id=\"AutoNumber3\" height=\"58\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#C0C0C0\" style=\"border-collapse: collapse\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td colspan=\"3\" align=\"center\" valign=\"center\" >");
      out.print( pageData.getWord("Non-configured agent"));
      out.write("</td>\r\n");
      out.write("            <td align=\"center\">&nbsp;</td>\r\n");
      out.write("            <td align=\"center\" valign=\"center\">");
      out.print( pageData.getWord("Assigned agent"));
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td height=\"52\" colspan=\"3\" align=\"center\" valign=\"top\" style=\"border-style: solid; border-width:0; padding-top:5px;\"> \r\n");
      out.write("             <select width=\"200\" style=\"width: 200px;font-size: 8pt; font-weight: bold\" name=\"nonConfiguredAgents\" size=\"10\" multiple onChange=\"enabledAddButton()\"> \r\n");
      out.write("             </select>\r\n");
      out.write("            </td>\r\n");
      out.write("            <td width=\"40\" height=\"52\" bordercolordark=\"#C0C0C0\" nowrap align=\"center\" style=\"padding-top:15px\">\r\n");
      out.write("              <input type=\"button\" name=\"addButton\"  disabled=\"true\" onClick=\"chkAndAddAgentToTeam()\" style=\"width: 40; height: 26\" value=\"&gt;&gt;\">\r\n");
      out.write("              <p>&nbsp;</p>\r\n");
      out.write("              <input type=\"button\" name=\"dropButton\" disabled=\"true\" onClick=\"chkAndDropAgentFromTeam()\" style=\"width: 40; height: 26\" value=\"&lt;&lt;\">\r\n");
      out.write("              <p>&nbsp;</p></td>\r\n");
      out.write("            <td width=\"1314\" height=\"52\" valign=\"top\" style=\"border-style: none; border-width:0; padding-top:5px;\" bordercolor=\"#000000\" align=\"center\"> <select width=\"200\" name=\"availableAgentInTeam\" size=\"10\" multiple  style=\"width: 200px; font-size: 8pt; font-weight: bold\" onChange=\"enabledDropButton()\"> </select>\r\n");
      out.write("            </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <!-- update or delete your the changes -->\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td width=\"351\">&nbsp;</td>\r\n");
      out.write("            <td width=\"734\">\r\n");
      out.write("\t\t<input id=\"save\" name=\"updateInfo\" type=\"button\" disabled=\"true\" value='");
      out.print( pageData.getWord("Add team"));
      out.write("' onClick=\"return saveInfo()\">\r\n");
      out.write("\r\n");
      out.write("\t    </td>\r\n");
      out.write("\r\n");
      out.write("            <td width=\"205\">\r\n");
      out.write("\t\t\t<input name=\"deleteInfo\" type=\"button\" disabled=\"true\" value='");
      out.print( pageData.getWord("Delete team"));
      out.write("' onClick=\"askDelete()\">\r\n");
      out.write(" \r\n");
      out.write("            </td>\r\n");
      out.write("            <td width=\"40\">&nbsp; </td>\r\n");
      out.write("            <td width=\"1314\">&nbsp;</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</form >\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
 pageData.closeConnection(); 
      out.write("\r\n");
      out.write("</html>");
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
