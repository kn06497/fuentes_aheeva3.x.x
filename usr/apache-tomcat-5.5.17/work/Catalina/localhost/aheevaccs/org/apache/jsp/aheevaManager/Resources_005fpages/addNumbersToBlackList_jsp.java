package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;

public final class addNumbersToBlackList_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Record Picker1</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"xc2_default.css\" type=\"text/css\">\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" >\r\n");
      out.write("\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<link type=\"text/css\" rel=\"StyleSheet\" href=\"slider/css/luna.css\" />\r\n");
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
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"xc2_default.js\"></script>\r\n");
      out.write("<script language=\"javascript\">xcAutoHide=1000;</script>\r\n");
      out.write("<script language=\"javascript\" src=\"xc2_inpage.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!--<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />-->\r\n");
      out.write("<script language=\"JavaScript\"> \r\n");
      out.write("\r\n");
      out.write("var tenant_dbid = normalizeString(QueryString('tenant_dbid'));\r\n");
      out.write("function chkAndAddGroup()\r\n");
      out.write("{\r\n");
      out.write("    var myForm = document.theForm;\r\n");
      out.write("\tvar o, i;\r\n");
      out.write("\tvar option_len = myForm.availableBlackListGroups.options.length;\r\n");
      out.write("\r\n");
      out.write("\tfor (i = 0; i < option_len; i++) \r\n");
      out.write("\t{\r\n");
      out.write("\t\to = myForm.availableBlackListGroups.options[i];\r\n");
      out.write("\t\tif (o.selected)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tmyForm.selectedBlackListGroups.options[myForm.selectedBlackListGroups.options.length] = new Option( o.text, o.value, false, false);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t// Delete them from original\r\n");
      out.write("\tfor ( i = (myForm.availableBlackListGroups.options.length-1); i >= 0; i--) \r\n");
      out.write("\t{\r\n");
      out.write("\t\to = myForm.availableBlackListGroups.options[i];\r\n");
      out.write("\t\tif (o.selected)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tmyForm.availableBlackListGroups.options[i] = null;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tmyForm.availableBlackListGroups.selectedIndex = -1;\r\n");
      out.write("\tmyForm.selectedBlackListGroups.selectedIndex = -1;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function chkAndDropGroup()\r\n");
      out.write("{\r\n");
      out.write("\tvar myForm = document.theForm;        \r\n");
      out.write("\tvar tmpTreament='';\r\n");
      out.write("\tvar i;\r\n");
      out.write("\tvar o;\r\n");
      out.write("\tvar option_len = myForm.selectedBlackListGroups.options.length;\r\n");
      out.write("\r\n");
      out.write("\tfor (i = 0; i < myForm.selectedBlackListGroups.options.length; i++) \r\n");
      out.write("\t{\r\n");
      out.write("\t\to = myForm.selectedBlackListGroups.options[i];\r\n");
      out.write("\t\tif (o.selected) \r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tmyForm.availableBlackListGroups.options[myForm.availableBlackListGroups.options.length] = new Option( o.text, o.value, false, false);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t// Delete them from original\r\n");
      out.write("\tfor (i = (myForm.selectedBlackListGroups.options.length-1); i>=0; i--) \r\n");
      out.write("\t{\r\n");
      out.write("\t\to = myForm.selectedBlackListGroups.options[i];\r\n");
      out.write("\t\tif (o.selected) \r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tmyForm.selectedBlackListGroups.options[i] = null;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("       \r\n");
      out.write("\tmyForm.selectedBlackListGroups.selectedIndex = -1;\r\n");
      out.write("\tmyForm.availableBlackListGroups.selectedIndex = -1;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function enabledAddButton()\r\n");
      out.write("{\r\n");
      out.write("\tdocument.theForm.addButton.disabled = false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function enabledDropButton()\r\n");
      out.write("{\r\n");
      out.write("\tdocument.theForm.dropButton.disabled = false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function addNumberToBlacklist()\r\n");
      out.write("{\r\n");
      out.write("\tmyForm = document.theForm;\r\n");
      out.write("\r\n");
      out.write("\tvar option_len = myForm.selectedBlackListGroups.options.length;\r\n");
      out.write("\tvar match_type_num = myForm.match_type.value;\r\n");
      out.write("\tvar data = myForm.numbers.value;\r\n");
      out.write("\tfor (i = 0; i < option_len; i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar group_dbid = myForm.selectedBlackListGroups.options[i].value;\r\n");
      out.write("\t\tif (data == '')\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert('");
      out.print(pageData.getWord("You must enter a number to put in blacklist(s)"));
      out.write("');\r\n");
      out.write("\t\t\tmyForm.numbers.focus;\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse  \r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif ( !IsNumeric(data))\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert('");
      out.print(pageData.getWord("The number to put in blacklist must be numeric !"));
      out.write("');\r\n");
      out.write("\t\t\t\tmyForm.numbers.value = '';\r\n");
      out.write("\t\t\t\tmyForm.numbers.focus;\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}  \r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tif (match_type_num > 0 )\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\tappletObj.addNumberToBlacklist(data, match_type_num, group_dbid);\r\n");
      out.write("\t\t\t\t\tmyForm.numbers.value = '';\r\n");
      out.write("\t\t\t\t\tselectObject(document.getElementById(\"match_type\"), \"0\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\telse\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\talert('");
      out.print(pageData.getWord("You must select a rule!"));
      out.write("');\r\n");
      out.write("\t\t\t\t\tmyForm.numbers.value = '';\r\n");
      out.write("\t\t\t\t\tmyForm.numbers.focus;\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function displayBlacklistInfo()\r\n");
      out.write("{\r\n");
      out.write("\tmyForm = document.theForm;\r\n");
      out.write("\tvar blacklistGroups = String(appletObj.getBlacklistGroups(tenant_dbid));\r\n");
      out.write("\tvar jsBlacklistGroups = blacklistGroups + \"\";\r\n");
      out.write("\tvar arrayBlacklistGroups = jsBlacklistGroups.split(\"|\");\r\n");
      out.write("\tfor (var i = 0; i < arrayBlacklistGroups.length; i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar jsThisBlacklist = arrayBlacklistGroups[i];\r\n");
      out.write("\t\tvar arrayCurrent = jsThisBlacklist.split(\"^\");\r\n");
      out.write("\t\tvar dbid = arrayCurrent[0];\r\n");
      out.write("\t\tvar name = arrayCurrent[1];\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tmyOption = new Option(name,dbid);\r\n");
      out.write("\t\tif (name != 'Globals')\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\toptionPos = myForm.availableBlackListGroups.options.length;\r\n");
      out.write("\t\t\tmyForm.availableBlackListGroups.options[optionPos]=myOption;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\toptionPos = myForm.selectedBlackListGroups.options.length;\r\n");
      out.write("\t\t\tmyForm.selectedBlackListGroups.options[optionPos]=myOption;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .contentText{\r\n");
      out.write("\tfont:\t\t\t12px Tahoma;\r\n");
      out.write("\tcolor:\t\t\tBlack;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\tclear:\t\t\tboth;\r\n");
      out.write("\tborder:\t\t\t1px solid rgb( 145, 155, 156 );\r\n");
      out.write("\tbackground:\t\trgb( 252, 252, 254 );\r\n");
      out.write("\tz-index:\t\t2;\r\n");
      out.write("\tposition:\t\trelative;\r\n");
      out.write("\ttop:\t\t\t-2px;\r\n");
      out.write("\r\n");
      out.write("\tfont:\t\t\t11px Tahoma;\r\n");
      out.write("\tcolor:\t\t\tBlack;\r\n");
      out.write("\r\n");
      out.write("\tfilter:\t\t\tprogid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)\r\n");
      out.write("\t\t\t\t\tprogid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);\r\n");
      out.write("\t\r\n");
      out.write("\t/* 244, 243, 238 */ \r\n");
      out.write("\t/*145, 155, 156 */\r\n");
      out.write("\tpadding:\t\t10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-row {\r\n");
      out.write("\tz-index:\t\t1;\r\n");
      out.write("\twhite-space:\tnowrap;\r\n");
      out.write("}\r\n");
      out.write(" \r\n");
      out.write(".dynamic-tab-pane-control .tab-row .tab.selected {\r\n");
      out.write("\twidth:\t\t\t\t74px  ;\r\n");
      out.write("\theight:\t\t\t\t18px  ;\r\n");
      out.write("\tbackground-image:\turl( \"tab.active.png\" )  ;\r\n");
      out.write("\tbackground-repaet:\tno-repeat;\r\n");
      out.write("\r\n");
      out.write("\tborder-bottom-width:\t0;\r\n");
      out.write("\tz-index:\t\t3;\r\n");
      out.write("\tpadding:\t\t2px 0 0px 0;\r\n");
      out.write("\tmargin:\t\t\t1px -3px -3px 0px;\r\n");
      out.write("\ttop:\t\t\t-2px;\r\n");
      out.write("\tfont:\t\t\t11px Tahoma;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-row .tab a {\r\n");
      out.write("\tfont:\t\t\t\t11px Tahoma;\r\n");
      out.write("\tcolor:\t\t\t\tBlack;\r\n");
      out.write("\ttext-decoration:\tnone;\r\n");
      out.write("\tcursor:\t\t\t\tdefault;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-row .tab.hover {\r\n");
      out.write("\tfont:\t\t\t\t11px Tahoma;\r\n");
      out.write("\twidth:\t\t\t\t70px;\r\n");
      out.write("\theight:\t\t\t\t16px;\r\n");
      out.write("\tbackground-image:\turl( \"tab.hover.png\" );\r\n");
      out.write("\tbackground-repaet:\tno-repeat;\r\n");
      out.write("}\r\n");
      out.write(" \r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write(" \r\n");
      out.write("html, body {\r\n");
      out.write("/*\tbackground:\tThreeDFace; */\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("} \r\n");
      out.write("\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write(" \r\n");
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
      out.write(" \r\n");
      out.write(" .dynamic-tab-pane-control.tab-pane {\r\n");
      out.write("\tposition:\trelative;\r\n");
      out.write("\twidth:\t\t100%;\t\t \r\n");
      out.write("\tmargin-right:\t-2px;\t \r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
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
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"bottompagebody\" onLoad=\"displayBlacklistInfo()\">\r\n");
      out.write("<br />\r\n");
      out.write("<DIV ID=\"Description\" STYLE=\"position:absolute; top:5px; left:5px; visibility:hide; z-index:1; background-color:#FFFFCC;\"></DIV>\r\n");
      out.write("\r\n");
      out.write("<div class=\"dynamic-tab-pane-control\">\r\n");
      out.write("\t<div class=\"tab-pane\" id=\"tabPane1\"> \r\n");
      out.write("\t\r\n");
      out.write("\t\t\r\n");
      out.write("    \t<div class=\"tab-page\" id=\"general\"> \r\n");
      out.write("      <fieldset>\r\n");
      out.write("      <legend> \r\n");
      out.write("      ");
      out.print(pageData.getWord("Do-not-call lists rules"));
      out.write("\r\n");
      out.write("      </legend>\r\n");
      out.write("      <form name=\"theForm\" onKeyDown=\"KeyDownHandler(save)\">\r\n");
      out.write("        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\" >\r\n");
      out.write("          <tr> \r\n");
      out.write("            <td style=\"border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1\" colspan=\"5\">&nbsp;</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr> \r\n");
      out.write("            <td align=\"center\" width=\"200\" height=\"26\" style=\"border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1\"> \r\n");
      out.write("              ");
      out.print( pageData.getWord("Do not call numbers when"));
      out.write(" \r\n");
      out.write("            </td>\r\n");
      out.write("            <td width=\"115\" height=\"22\" align=\"left\"> <select id=\"match_type\" name=\"match_type\" class=\"contentText\" >\r\n");
      out.write("                <option value=\"0\"> -- \r\n");
      out.write("               ");
      out.print( pageData.getWord("Select"));
      out.write(" -- </option>\r\n");
      out.write("                <option value=\"1\">  ");
      out.print( pageData.getWord("EQUAL TO"));
      out.write("</option>\r\n");
      out.write("                <option value=\"2\">");
      out.print(pageData.getWord("START WITH"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option value=\"3\">");
      out.print(pageData.getWord("END WITH"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t<option value=\"4\">");
      out.print(pageData.getWord("CONTAIN"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("              </select> </td>\r\n");
      out.write("            <td align=\"right\"><input type=\"text\" id=\"numbers\" name=\"numbers\"></td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr> \r\n");
      out.write("            <td></td>\r\n");
      out.write("            <td></td>\r\n");
      out.write("            <td></td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr> \r\n");
      out.write("          <tr> \r\n");
      out.write("            <td height=\"21\" align=\"center\"><b> \r\n");
      out.write("             ");
      out.print( pageData.getWord("Available do-not-call list groups"));
      out.write("\r\n");
      out.write("              </b> </td>\r\n");
      out.write("            <td></td>\r\n");
      out.write("            <td align=\"center\"><b> \r\n");
      out.write("              ");
      out.print( pageData.getWord("Selected do-not-call list groups"));
      out.write("\r\n");
      out.write("              </b> </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr> \r\n");
      out.write("            <td width=\"200\" height=\"138\" align=\"center\"><select width=\"200\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px\" name=\"availableBlackListGroups\" size=\"10\" multiple onChange=\"enabledAddButton()\">\r\n");
      out.write("              </select></td>\r\n");
      out.write("            <td width=\"115\" height=\"138\" bordercolordark=\"#c0c0c0\" nowrap align=\"center\"> \r\n");
      out.write("              <p> </p>\r\n");
      out.write("              <p> \r\n");
      out.write("                <button name=\"addButton\"  disabled onClick=\"chkAndAddGroup()\" style=\"WIDTH: 40px; HEIGHT: 26px\" type=button> \r\n");
      out.write("                &gt;&gt; </button>\r\n");
      out.write("              </p>\r\n");
      out.write("              <button name=\"dropButton\" disabled onClick=\"chkAndDropGroup()\" style=\"WIDTH: 40px; HEIGHT: 26px\" type=button> \r\n");
      out.write("              &lt;&lt; </button>\r\n");
      out.write("              <p>&nbsp;</p></td>\r\n");
      out.write("            <td width=\"200\" height=\"138\" bordercolor=\"#000000\" align=\"left\"> <select width=\"200\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px\" name=\"selectedBlackListGroups\" size=\"10\" multiple onChange=\"enabledDropButton()\">\r\n");
      out.write("              </select> </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr height=\"25\"> </tr>\r\n");
      out.write("          <tr> \r\n");
      out.write("            <td style=\"border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1\">&nbsp;</td>\r\n");
      out.write("            <td style=\"border-top-style: none; border-top-width: 1\">&nbsp;</td>\r\n");
      out.write("            <td style=\"border-top-style: none; border-top-width: 1\" colspan=\"\">&nbsp;</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("      </form>\r\n");
      out.write("      </fieldset>\r\n");
      out.write("    </div>\r\n");
      out.write(" \t  <div>\r\n");
      out.write("\t  \t <table width=\"182\">\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"165\" height=\"40\" style=\"border-right-style: none; border-right-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1\" align=\"left\" valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t<input id=\"save\" type=\"button\" value='");
      out.print(pageData.getWord("Submit"));
      out.write("' onClick=\"addNumberToBlacklist()\"> \r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td style=\"border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td style=\"border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("  \t    </table>\t\r\n");
      out.write("\t  </div>\t \r\n");
      out.write("   </div>\r\n");
      out.write("</div>\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
 pageData.closeConnection(); 
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