package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.*;

public final class treatment1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>Add a Treatment </title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<title>Add a Treatment1 </title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
System.out.println(session.getAttribute("USER_LANGUAGE"));
String treatname=(request.getParameter("treatment_name")==null)?"":request.getParameter("treatment_name");
String tenant_dbid=(request.getParameter("tenant_dbid")==null)?"":request.getParameter("tenant_dbid");



////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();


      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("\r\n");
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
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("var tenant_dbid = \"NULL\";\r\n");
      out.write("var treatmentDBID = '';\r\n");
      out.write("var treatName='';\r\n");
      out.write("\r\n");
      out.write("function enableUpdateButton()\r\n");
      out.write("{\r\n");
      out.write("\tif(document.treatment.name.value.length > 0){\r\n");
      out.write("\t\tdocument.treatment.updateInfo.disabled = false;\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tdocument.treatment.updateInfo.disabled = true;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function displayTreatmentInfo()\r\n");
      out.write("{\r\n");
      out.write("\tourCaption  = document.getElementById(\"caption\");\r\n");
      out.write("\ttreatName   = normalizeString(QueryString('treatment_name'));\r\n");
      out.write("\ttenant_dbid\t= normalizeString(QueryString('tenant_dbid'));\r\n");
      out.write("\tvar i;\r\n");
      out.write("\r\n");
      out.write("\tif (treatName== '')\r\n");
      out.write("\t{\r\n");
      out.write("\t\tourCaption.innerHTML = \"");
      out.print( pageData.getWord("Add a new treatment"));
      out.write("\";\r\n");
      out.write("\t\tdocument.treatment.updateInfo.value = \"");
      out.print( pageData.getWord("Save"));
      out.write("\";\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tourCaption.innerHTML  = \"");
      out.print( pageData.getWord("Modify treatment"));
      out.write("\";\r\n");
      out.write("\t\tvar treatmentDetails  =  String( appletObj.getTreatmentDetails(treatName) );\r\n");
      out.write("\t\t// parse info received\r\n");
      out.write("\t\tvar jsDetails = treatmentDetails  + \"\";\r\n");
      out.write("\t\tarrayDetails = jsDetails.split(\"|\");\r\n");
      out.write("\t\tfor (i = 0; i <arrayDetails.length; i++)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(i == 0)\r\n");
      out.write("\t\t\t\ttreatmentDBID = arrayDetails[i];\r\n");
      out.write("\t\t\telse if (i == 1)\r\n");
      out.write("\t\t\t\tdocument.treatment.name.value = arrayDetails[i];\t\t\t\t\r\n");
      out.write("\t\t\telse if(i == 2)\r\n");
      out.write("\t\t\t\tdocument.treatment.description.value = arrayDetails[i] == 'NULL' ? '' : arrayDetails[i];\r\n");
      out.write("\t\t\telse if (i == 3)\r\n");
      out.write("\t\t\t\tdocument.treatment.callResult.value = arrayDetails[i];\r\n");
      out.write("\t\t\telse if (i == 4)\r\n");
      out.write("\t\t\t\tdocument.treatment.order.value = arrayDetails[i];\r\n");
      out.write("\t\t\telse if (i == 5)\r\n");
      out.write("\t\t\t\tdocument.treatment.interval.value = arrayDetails[i];\r\n");
      out.write("\t\t\telse if (i == 6)\r\n");
      out.write("\t\t\t\tdocument.treatment.increment.value = arrayDetails[i];\r\n");
      out.write("\t\t\telse if (i == 7)\r\n");
      out.write("\t\t\t\tdocument.treatment.attempts.value = arrayDetails[i];\r\n");
      out.write("\t\t\telse if (i == 8)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\t//document.treatment.cycle_attempt.value = arrayDetails[i];\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse if (i == 9)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tif(arrayDetails[i] == '1')\r\n");
      out.write("\t\t\t\t\tdocument.treatment.state.checked = true;\r\n");
      out.write("\t\t\t\telse\r\n");
      out.write("\t\t\t\t\tdocument.treatment.state.checked = false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse if(i == 10)\r\n");
      out.write("\t\t\t\tdocument.treatment.personal_callback_timeout.value = arrayDetails[i];\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write(" }\r\n");
      out.write("\r\n");
      out.write("function saveTreatment()\r\n");
      out.write("{\r\n");
      out.write("\tvar state = 0;\r\n");
      out.write("\tif(document.treatment.state.checked)\r\n");
      out.write("\t\tstate = 1;\r\n");
      out.write("\telse\r\n");
      out.write("\t\tstate = 0;\r\n");
      out.write("\r\n");
      out.write("\tvar alReadyExist = false;\r\n");
      out.write("\tvar treatments = String(appletObj.getTreatmentByName(tenant_dbid));\r\n");
      out.write("\tjstreatments = treatments.split(\"|\");\r\n");
      out.write("\tfor(q = 0; q < jstreatments.length; q++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(document.treatment.name.value == jstreatments[q] && document.treatment.name.value != treatName) //le groupe existe deja\t\t\t\t\t\t\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talReadyExist = true;\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tif(validation(document.treatment.name.value)==0 || !document.treatment.name.value.match(/^[a-zA-Z0-9\\-\\_]+$/)){\r\n");
      out.write("\t\talert('");
      out.print( pageData.getWord("Invalid use of character"));
      out.write("');\r\n");
      out.write("\t\tdocument.treatment.name.focus();\r\n");
      out.write("\t}else if(validation(document.treatment.description.value)==0){\r\n");
      out.write("\t\talert('");
      out.print( pageData.getWord("Invalid use of character"));
      out.write("');\r\n");
      out.write("\t\tdocument.treatment.description.focus();\t\r\n");
      out.write("\t}else if(alReadyExist){\r\n");
      out.write("\t\talert('");
      out.print( pageData.getWord("Treatment already exists"));
      out.write("');\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tappletObj.saveTreatmentInfo(treatmentDBID,tenant_dbid,\r\n");
      out.write("\t\t\tdocument.treatment.name.value,\r\n");
      out.write("\t\t\tdocument.treatment.description.value,\r\n");
      out.write("\t\t\tdocument.treatment.callResult.value,\r\n");
      out.write("\t\t\tdocument.treatment.order.value,\r\n");
      out.write("\t\t\tdocument.treatment.interval.value,\r\n");
      out.write("\t\t\tdocument.treatment.increment.value,\r\n");
      out.write("\t\t\tdocument.treatment.attempts.value,\r\n");
      out.write("\t\t\t\"\",//document.treatment.cycle_attempt.value,\r\n");
      out.write("\t\t\tstate,\r\n");
      out.write("\t\t\tdocument.treatment.personal_callback_timeout.value);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t// disable the update button\r\n");
      out.write("\t\tdocument.treatment.updateInfo.disabled = true;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function askDelete()\r\n");
      out.write("{\r\n");
      out.write("\t answer = confirm('");
      out.print( pageData.getWord("Are you sure, you wish to delete this treatment? "));
      out.write("');\r\n");
      out.write("\tif(answer)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tappletObj.deleteTreatment(treatmentDBID);\r\n");
      out.write("\t\t// refresh the current page\r\n");
      out.write("\t\tdocument.location.href = \"../defaultpage.htm\";\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkCallResult()\r\n");
      out.write("{\r\n");
      out.write("\tif(document.treatment.callResult.value == \"agent_unavailable\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\tshowLayer(\"agentUnavailable_Options\");\r\n");
      out.write("\t\thideLayer(\"treatment_Options\");\r\n");
      out.write("\t\t//hideLayer(\"agentError_Options\");\r\n");
      out.write("\t}\r\n");
      out.write("\t/*else if(document.treatment.callResult.value == \"agent_error\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\thideLayer(\"agentUnavailable_Options\");\r\n");
      out.write("\t\thideLayer(\"treatment_Options\");\r\n");
      out.write("\t\tshowLayer(\"agentError_Options\");\r\n");
      out.write("\t}*/\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\thideLayer(\"agentUnavailable_Options\");\r\n");
      out.write("\t\tshowLayer(\"treatment_Options\");\r\n");
      out.write("\t\t//hideLayer(\"agentError_Options\");\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write(" \r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("    // Associate a default button with pressing the Enter key\r\n");
      out.write("\tfunction KeyDownHandler(btn)\r\n");
      out.write("    {\r\n");
      out.write("        // process only the Enter key\r\n");
      out.write("        if (event.keyCode == 13)\r\n");
      out.write("        {\r\n");
      out.write("            // cancel the default submit\r\n");
      out.write("            event.returnValue=false;\r\n");
      out.write("            event.cancel = true;\r\n");
      out.write("            // submit the form by programmatically clicking the specified button\r\n");
      out.write("            btn.click();\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<body class=\"treat_body\" onLoad=\"displayTreatmentInfo();checkCallResult()\">\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"treatment\" onKeyDown=\"KeyDownHandler(update)\">\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t<legend id=\"caption\"></legend>\r\n");
      out.write("<table width=\"75%\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"left\" valign=\"top\" style=\"padding-top:15px; padding-bottom:10px\">\r\n");
      out.write("\t\t\t");
      out.print( pageData.getWord("Name"));
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td align=\"left\" valign=\"top\" style=\"padding-top:15px; padding-bottom:10px\">\r\n");
      out.write("\t\t\t<input name=\"name\" size=\"37\" onChange=\"enableUpdateButton()\" style=\"float: left\" >\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr height=\"33px\">\r\n");
      out.write("\t\t<td align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t");
      out.print( pageData.getWord("Description"));
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td valign=\"top\">\r\n");
      out.write("\t\t\t<textarea rows=\"3\" name=\"description\" cols=\"36\" onChange=\"enableUpdateButton()\"></textarea>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td colspan=\"2\"></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"left\" valign=\"top\" style=\"padding-bottom:10px\"> \r\n");
      out.write("\t\t\t");
      out.print( pageData.getWord("Call result"));
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td valign=\"top\" style=\"padding-bottom:5px\">\r\n");
      out.write("\t\t\t<select size=\"1\" name=\"callResult\" onChange=\"enableUpdateButton();checkCallResult()\">\r\n");
      out.write("\t\t\t\t<option value=\"busy\">");
      out.print( pageData.getWord("Busy"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option value=\"abandoned\">");
      out.print( pageData.getWord("Abandoned"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option value=\"no_answer\">");
      out.print( pageData.getWord("No answer"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option value=\"answer_machine\">");
      out.print( pageData.getWord("Answering machine"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option value=\"sit\">");
      out.print( pageData.getWord("Sit"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option value=\"no_more_trunk\">");
      out.print( pageData.getWord("No more trunk"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option value=\"agent_unavailable\">");
      out.print( pageData.getWord("Agent Unavailable (Personal CallBack)"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<!--<option value=\"agent_error\">Agent Error (Personal CallBack)</option>-->\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td colspan=\"2\" valign=\"top\">\r\n");
      out.write("\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td nowrap valign=\"middle\" align=\"right\" width=\"135\" style=\"padding-right:5px\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( pageData.getWord("Order"));
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td valign=\"middle\" align=\"left\" width=\"80\">\r\n");
      out.write("\t\t\t\t\t\t<select size=\"1\"  name=\"order\" onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"1\">1</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"2\">2</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"3\">3</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"4\">4</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td height=\"33\" valign=\"middle\" align=\"right\" width=\"150\" style=\"padding-right:5px\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print( pageData.getWord("Attempts"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td height=\"33\" align=\"left\" valign=\"middle\">\r\n");
      out.write("\t\t\t\t\t\t<select size=\"1\"  name=\"attempts\" onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"1\">1</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"2\">2</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"3\">3</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"4\">4</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"5\">5</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"6\">6</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"7\">7</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"8\">8</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"9\">9</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"10\">10</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"11\">11</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"12\">12</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"13\">13</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"14\">14</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"15\">15</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td valign=\"top\" colspan=\"2\">\r\n");
      out.write("\t\t\t<div id=\"treatment_Options\" style=\"display:;\">\r\n");
      out.write("\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td nowrap valign=\"middle\" align=\"right\" width=\"135\" style=\"padding-right:5px\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageData.getWord("Interval (min)"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"left\" valign=\"middle\" width=\"80\">\r\n");
      out.write("\t\t\t\t\t\t\t<select size=\"1\"  name=\"interval\" onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"5\">5</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"10\">10</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"15\">15</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"20\">20</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"25\">25</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"30\">30</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"35\">35</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"40\">40</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"45\">45</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"50\">50</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"55\">55</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"60\">60</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"75\">75</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"90\">90</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"120\">2h</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"180\">3h</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"300\">5h</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"1440\">1 ");
      out.print( pageData.getWord("day"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"2880\">2 ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"4320\">3 ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"5760\">4 ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"7200\">5 ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"8640\">6 ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"10080\">1 ");
      out.print( pageData.getWord("week"));
      out.write("</option></option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td nowrap valign=\"middle\" align=\"right\" width=\"150\" style=\"padding-right:5px\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( pageData.getWord("Increment (min)"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"left\" valign=\"middle\">\r\n");
      out.write("\t\t\t\t\t\t\t<select size=\"1\"  name=\"increment\" onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"0\">0</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"5\">5</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"10\">10</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"15\">15</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"20\">20</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"25\">25</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"30\">30</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"35\">35</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"40\">40</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"45\">45</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"50\">50</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"55\">55</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"60\">60</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"75\">75</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"90\">90</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"120\">120</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"180\">180</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"300\">5h</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"1440\">1 &nbsp; ");
      out.print( pageData.getWord("day"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"2880\">2 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"4320\">3 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"5760\">4 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"7200\">5 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"8640\">6 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"10080\">1 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<!-- <td width=\"19%\" height=\"33\" align=\"left\" valign=\"top\" style=\"border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t<b>Attempt Cycle&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"15%\" height=\"33\" align=\"left\" valign=\"top\" style=\"border-top-style: none; border-top-width: 1\">\r\n");
      out.write("\t\t\t\t\t\t<b>\r\n");
      out.write("\t\t\t\t\t\t<select size=\"1\"  name=\"cycle_attempt\" disabled onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t\t\t\t<option value=\"1\" disabled >1</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"2\">2</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"3\">3</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"4\">4</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t</td>-->\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t<div id=\"agentUnavailable_Options\" style=\"margin: 0px 0px 0px 0px;display:;\">\r\n");
      out.write("\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td nowrap valign=\"middle\" align=\"right\" width=\"370\" style=\"padding-right:5px\">");
      out.print( pageData.getWord("Personal CallBack time out (min)"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td valign=\"middle\">\r\n");
      out.write("\t\t\t\t\t\t\t<select size=\"1\"  name=\"personal_callback_timeout\" onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"5\">5</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"10\">10</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"15\">15</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"20\">20</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"25\">25</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"30\">30</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"35\">35</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"40\">40</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"45\">45</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"50\">50</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"55\">55</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"60\">60</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"75\">75</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"90\">90</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"120\">120</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"180\">180</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"300\">5h</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"1440\">1 &nbsp; ");
      out.print( pageData.getWord("day"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"2880\">2 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"4320\">3 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"5760\">4 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"7200\">5 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"8640\">6 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"10080\">1 &nbsp; ");
      out.print( pageData.getWord("days"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div><!--\r\n");
      out.write("\t\t\t<div id=\"agentError_Options\" style=\"margin: 0px 0px 0px 0px;display:;\">\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td nowrap valign=\"middle\"><b>Action on agent error</b></td>\r\n");
      out.write("\t\t\t\t\t\t<td valign=\"middle\">\r\n");
      out.write("\t\t\t\t\t\t\t<select size=\"1\" name=\"agent_error_action\" onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"hang_up\">Hang Up</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"distribute_other_agent\">Distribute to another agent</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"queue_script\">Queue until agent is ready</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>-->\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td height=\"33px\" align=\"left\" valign=\"top\" colspan=\"2\">\r\n");
      out.write("\t\t\t<span style=\"padding-right:0px; width:135px; text-align:right;\">");
      out.print( pageData.getWord("Active"));
      out.write("</span><input type=\"checkbox\" name=\"state\" value=\"ON\" onClick=\"enableUpdateButton()\">\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<script>document.write(\"<input disabled=\\\"true\\\"  id=\\\"update\\\" name=\\\"updateInfo\\\" type=\\\"button\\\" value=\\\"");
      out.print(pageData.getWord("Update"));
      out.write("\\\" onClick=\\\"saveTreatment()\\\" style=\\\"margin-left:140px;\\\">\")</script>\r\n");
      out.write("\r\n");
      out.write("&nbsp;&nbsp;\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("\tvar treatmentName = normalizeString(QueryString('treatment_name'));\r\n");
      out.write("\r\n");
      out.write("\tif (treatmentName== '')\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.write('&nbsp;');\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.write(' <input type=\"button\" name=\"deleteAgt\" onclick=\"askDelete()\"  value=\"");
      out.print(pageData.getWord("Delete"));
      out.write("\">');\r\n");
      out.write("\t} \r\n");
      out.write("</script>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("   </form>\r\n");
      out.write("  </div>\r\n");
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