package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import aheevaManager.ressources.*;

public final class queues_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
	String tenantDbid = request.getParameter("tenant_dbid");
	String queueName = request.getParameter("queue_name");
	QueueManagement vQueue = new QueueManagement(queueName);

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\r\n");
      out.write("\t\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Add an agent</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<link type=\"text/css\" rel=\"StyleSheet\" href=\"slider/css/luna.css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
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
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=JavaScript src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=javascript src=\"Browser.js\" type=text/javascript></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<script language=javascript type=text/javascript>\r\n");
      out.write("var queueName = \"");
      out.print(queueName);
      out.write("\";\r\n");
      out.write("var dbid = \"");
      out.print(vQueue.getDbid() > 0 ? vQueue.getDbid() : 0 );
      out.write("\";\r\n");
      out.write("var tenant_dbid = \"");
      out.print(tenantDbid);
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("function enableUpdateButton()\r\n");
      out.write("{\r\n");
      out.write("\tdocument.getElementById(\"updateInfo\").disabled = false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function disableUpdateButton()\r\n");
      out.write("{\r\n");
      out.write("\tdocument.getElementById(\"updateInfo\").disabled = true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function enableReload()\r\n");
      out.write("{\r\n");
      out.write("   appletObj.fReloadMenu = true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function recalculateCounter(counterId, selectOneId, selectTwoId)\r\n");
      out.write("{\r\n");
      out.write("\tvar counter = document.getElementById(counterId);\r\n");
      out.write("\tif(counter)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar selectObj = document.getElementById(selectOneId);\r\n");
      out.write("\t\tif(selectObj)\r\n");
      out.write("\t\t\tcounter.value = selectObj.length;\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t\tcounter.value = 0;\r\n");
      out.write("\t}\r\n");
      out.write("\t//Now let's sort the select objects\r\n");
      out.write("\tvar selectOne = document.getElementById(selectOneId);\r\n");
      out.write("\tif(selectOne)\r\n");
      out.write("\t\tsortSelectBox(selectOne);\r\n");
      out.write("\r\n");
      out.write("\tvar selectTwo = document.getElementById(selectTwoId);\r\n");
      out.write("\tif(selectTwo)\r\n");
      out.write("\t\tsortSelectBox(selectTwo);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function validateInfo()\r\n");
      out.write("{\r\n");
      out.write("\tvar o;\r\n");
      out.write("\tvar SVL_answered = \"\";\r\n");
      out.write("\tvar SVL_abandonned = \"\";\r\n");
      out.write("\r\n");
      out.write("\tif (!IsInteger(document.getElementById(\"threshold_answered\").value))\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pageData.getWord("The longest waiting time for response must be in seconds"));
      out.write("\");\n");
      out.write("\t}\r\n");
      out.write("\telse if(!IsInteger(document.getElementById(\"threshold_abandonned\").value))\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pageData.getWord("The abandoned shortest time must be in seconds"));
      out.write("\");\n");
      out.write("\t}\r\n");
      out.write("\telse if( parseInt(document.getElementById(\"threshold_abandonned\").value) >= parseInt(document.getElementById(\"threshold_answered\").value))\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pageData.getWord("The abandoned shortest time must be less than the longuest waiting time for response"));
      out.write("\");\n");
      out.write("\t}\r\n");
      out.write("\telse if(document.queue.serviceLevel_answered.options.length != 10)\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pageData.getWord("Select 10 values for service level answered times"));
      out.write("\");\n");
      out.write("\t}\r\n");
      out.write("\telse if(document.queue.serviceLevel_abandonned.options.length != 10)\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pageData.getWord("Select 10 values for service level answered times"));
      out.write("\");\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tfor (var i = 0; i < document.queue.serviceLevel_answered.options.length; i++)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\to = document.queue.serviceLevel_answered.options[i];\r\n");
      out.write("\t\t\tSVL_answered = SVL_answered + o.value + \"/\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tSVL_answered = SVL_answered.substring(0, SVL_answered.length - 1); // remove the last '/'\r\n");
      out.write("\r\n");
      out.write("\t\tfor (var i = 0; i < document.queue.serviceLevel_abandonned.options.length; i++)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\to = document.queue.serviceLevel_abandonned.options[i];\r\n");
      out.write("\t\t\tSVL_abandonned = SVL_abandonned + o.value + \"/\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tSVL_abandonned = SVL_abandonned.substring(0, SVL_abandonned.length - 1); // remove the last '/'\r\n");
      out.write("\t\tappletObj.saveQueue(dbid, tenant_dbid, queueName, document.getElementById(\"threshold_answered\").value,\r\n");
      out.write("\t\t\t\t\t\t\tdocument.getElementById(\"threshold_abandonned\").value,\r\n");
      out.write("\t\t\t\t\t\t\tSVL_answered, SVL_abandonned);\r\n");
      out.write("\t\tdisableUpdateButton();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"qu_body\">\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"queue\" >\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Service factor"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend class=\"contentTitles\">");
      out.print(queueName);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print(pageData.getWord("General information for service factor"));
      out.write("</legend>\r\n");
      out.write("\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\" width=\"80%\">\r\n");
      out.write("\t\t\t\t<tr height=\"50px\">\r\n");
      out.write("\t\t\t\t\t<td width=\"40%\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(pageData.getWord("Longest waiting time for response"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"left\" width=\"60%\">\r\n");
      out.write("\t\t\t\t\t\t<input id=\"threshold_answered\" type=\"text\" value=\"");
      out.print(vQueue.getThresholdAnswered());
      out.write("\" onChange=\"enableUpdateButton()\"  size=\"10\" name=\"threshold_answered\">sec\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr height=\"50px\">\r\n");
      out.write("\t\t\t\t\t<td width=\"40%\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(pageData.getWord("Shortest time for abandon"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"left\" width=\"60%\">\r\n");
      out.write("\t\t\t\t\t\t<input id=\"threshold_abandonned\" type=\"text\" value=\"");
      out.print(vQueue.getThresholdAbandoned());
      out.write("\" onChange=\"enableUpdateButton()\" size=\"10\" name=\"threshold_abandonned\">sec\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabAns\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Service level"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabAns\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend class=\"contentTitles\">");
      out.print(queueName);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print(pageData.getWord("Answered times"));
      out.write("</legend>\r\n");
      out.write("\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<select id=\"availableANS_Level\" name=\"availableANS_Level\" multiple=\"multiple\" onchange=\"enableUpdateButton()\" style=\"width:200px\" size=\"5\">\r\n");
      out.write("\t\t\t\t\t\t");

						for(int i = 1; i <= 180; i++) {
							if((i <= 60 || i % 15 == 0) && !vQueue.getServiceLevelAnsweredValues().contains(i)) {
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(pageData.getWord("Within"));
      out.write(' ');
      out.print(i);
      out.write(" sec</option>\r\n");
      out.write("\t\t\t\t\t\t");
		
							}
						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" width=\"10%\">\r\n");
      out.write("\t\t\t\t\t\t<img src=\"../img/left_to_right.gif\" alt=\">>\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('availableANS_Level', 'serviceLevel_answered');recalculateCounter('nb_ans_for_svl_select', 'serviceLevel_answered', 'availableANS_Level')\" /><br><br>\r\n");
      out.write("\t\t\t\t\t\t<img src=\"../img/right_to_left.gif\" alt=\"<<\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('serviceLevel_answered', 'availableANS_Level');recalculateCounter('nb_ans_for_svl_select', 'serviceLevel_answered', 'availableANS_Level')\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" >\r\n");
      out.write("\t\t\t\t\t\t<select id=\"serviceLevel_answered\" name=\"serviceLevel_answered\" multiple onChange=\"enableUpdateButton()\" style=\"width:200px\" size=\"5\">\r\n");
      out.write("\t\t\t\t\t\t");

						for(int i = 0; i < vQueue.getServiceLevelAnsweredValues().size(); i++) { 
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"");
      out.print(vQueue.getServiceLevelAnsweredValues().elementAt(i));
      out.write('"');
      out.write('>');
      out.print(pageData.getWord("Within"));
      out.write(' ');
      out.print(vQueue.getServiceLevelAnsweredValues().elementAt(i));
      out.write(" sec</option>\r\n");
      out.write("\t\t\t\t\t\t");

						} 
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"right\" valign=\"bottom\" width=\"10%\">\r\n");
      out.write("\t\t\t\t\t\t<input name=\"nb_ans_for_svl_select\" id=\"nb_ans_for_svl_select\" type=\"text\" size=\"2\" disabled value=\"10\">\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t\t<br /><br />\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend class=\"contentTitles\">");
      out.print(queueName);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print(pageData.getWord("Abandonned times"));
      out.write("</legend>\r\n");
      out.write("\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<select id=\"availableABD_Level\" name=\"availableABD_Level\" multiple onChange=\"enableUpdateButton()\" style=\"width:200px\" size=\"5\">\r\n");
      out.write("\t\t\t\t\t\t");

						for(int i = 1; i <= 180; i++) {
							if((i <= 60 || i % 15 == 0) && !vQueue.getServiceLevelAbandonedValues().contains(i)) {
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(pageData.getWord("Within"));
      out.write(' ');
      out.print(i);
      out.write(" sec</option>\r\n");
      out.write("\t\t\t\t\t\t");

							}
						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\" width=\"10%\">\r\n");
      out.write("\t\t\t\t\t\t<img src=\"../img/left_to_right.gif\" alt=\">>\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('availableABD_Level', 'serviceLevel_abandonned');recalculateCounter('nb_abd_for_svl_select', 'serviceLevel_abandonned', 'availableABD_Level')\" /><br><br>\r\n");
      out.write("\t\t\t\t\t\t<img src=\"../img/right_to_left.gif\" alt=\"<<\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('serviceLevel_abandonned', 'availableABD_Level');recalculateCounter('nb_abd_for_svl_select', 'serviceLevel_abandonned', 'availableABD_Level')\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t<select id=\"serviceLevel_abandonned\" name=\"serviceLevel_abandonned\" multiple onChange=\"enableUpdateButton()\" style=\"width:200px\" size=\"5\">\r\n");
      out.write("\t\t\t\t\t\t");

						for(int i = 0; i < vQueue.getServiceLevelAbandonedValues().size(); i++) {
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"");
      out.print(vQueue.getServiceLevelAbandonedValues().elementAt(i));
      out.write('"');
      out.write('>');
      out.print(pageData.getWord("Within"));
      out.write(' ');
      out.print(vQueue.getServiceLevelAbandonedValues().elementAt(i));
      out.write(" sec</option>\r\n");
      out.write("\t\t\t\t\t\t");
			
						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<td align=\"right\" valign=\"bottom\" width=\"10%\">\r\n");
      out.write("\t\t\t\t\t\t<input name=\"nb_abd_for_svl_select\" id=\"nb_abd_for_svl_select\" type=\"text\" size=\"2\" disabled value=\"10\">\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<input disabled=\"disabled\" name=\"updateInfo\" type=\"button\" value=\"");
      out.print(pageData.getWord("Update"));
      out.write("\" onclick=\"validateInfo()\" />\r\n");
      out.write("</form>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tsetupAllTabs();\r\n");
      out.write("</script>\r\n");
      out.write("</div>\r\n");
 pageData.closeConnection(); 
      out.write("\r\n");
      out.write("</body>\r\n");
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
