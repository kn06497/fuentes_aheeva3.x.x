package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import aheevaManager.ressources.*;

public final class Skill_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");

beanManagerData pageData = new beanManagerData();
pageData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

int tenantDBID = 0;

String skillName = "";
boolean update = false;
int skillId = 0;

if(request.getParameter("tenant_dbid") != null){
	try{
		tenantDBID = Integer.parseInt(request.getParameter("tenant_dbid"));
	}catch(NumberFormatException e){
		e.printStackTrace();
	}
}


      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<link type=\"text/css\" rel=\"StyleSheet\" href=\"slider/css/luna.css\" />\r\n");
      out.write("<title>Add skill</title>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("/*\theight:\t\t200px;*/\r\n");
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
      out.write("<script language=\"JavaScript\" src=\"jsUtil.js\"> </script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("var user_tenant_id = normalizeString(QueryString('tenant_dbid'));\r\n");

if(request.getParameter("skill_id") != null){
	update = true;
	try{
		skillId = Integer.parseInt(request.getParameter("skill_id"));
		PreparedStatement ps = pageData.buildPreparedStatement("SELECT name FROM cfg_skills WHERE dbid=?");
		ps.setInt(1, skillId);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			skillName = rs.getString(1);
		}
		
	}catch(NumberFormatException e){
		e.printStackTrace();
	}
}

if(request.getParameter("skillName") != null){
	skillName = pageData.protectHTMLString(request.getParameter("skillName")).trim();
	boolean success = true;
	String errorMsg = "";
	boolean validName = pageData.nameAvailable(skillName, skillId, "cfg_skills", tenantDBID);
	if(skillName.length() == 0){
		success = false;
		errorMsg += "-"+ pageData.getWord("Please enter skill name")+"\\n";
	}else if(!validName){
		success = false;
		errorMsg += "-"+ pageData.getWord("Skill")+" "+ pageData.getWord("already exists")+"\\n";
	}
	
	if(!success){
		
      out.write("\r\n");
      out.write("\t\talert('");
      out.print( errorMsg );
      out.write("');\r\n");
      out.write("\t\t");

	}else{
		if(update){ 
      out.write("\r\n");
      out.write("\t\t\tappletObj.modifySkill(\"");
      out.print( skillId );
      out.write("\", \"");
      out.print( skillName );
      out.write("\");\t\r\n");
      out.write("\t\t");
 } else { 
      out.write("\r\n");
      out.write("\t\t\tappletObj.addSkill(\"");
      out.print( skillName );
      out.write("\", user_tenant_id);\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tdocument.location.href = \"../defaultpage.htm\";\r\n");
      out.write("\t\t");

	}
}


      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function validateInfo(){\r\n");
      out.write("\tif(document.skillForm.skillName.value == \"\"){\r\n");
      out.write("\t\talert(\"");
      out.print(pageData.getWord("Please enter skill name"));
      out.write("\");\r\n");
      out.write("\t\tdocument.skillForm.skillName.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(validation(document.skillForm.skillName.value)==0){\r\n");
      out.write("\t\talert(\"");
      out.print(pageData.getWord("Invalid use of character"));
      out.write("\");\r\n");
      out.write("\t\tdocument.skillForm.skillName.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\treturn true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function askDelete(){\r\n");
      out.write("var oops=\"");
      out.print(pageData.getWord("You are about to delete this skill.**Do you want to continue?"));
      out.write("\";\r\n");
      out.write("\tvar yesno = confirm(oops.replace(\"**\",\"\\n\"));\r\n");
      out.write("\tif(yesno){\r\n");
      out.write("\t\tappletObj.deleteSkill(");
      out.print( skillId );
      out.write(");\r\n");
      out.write("\t\tdocument.location.href = \"../defaultpage.htm\";\r\n");
      out.write("\t\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<base target=\"rbottom\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body class=\"skill_body\">\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"skillForm\" method=\"post\" onsubmit=\"return validateInfo();\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t<legend id=\"caption\">\r\n");
      out.write("\t\t");
 if(update){ 
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Modify skill name"));
      out.write("\r\n");
      out.write("\t\t\t");
 }else{ 
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Add new skill"));
      out.write("\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</legend>\r\n");
      out.write("\t\t<table border=\"0\" style=\"margin-top:20px;\">\r\n");
      out.write("\t\t");
 if(update){ 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"50\" style=\"padding-right:5px;\">");
      out.print(pageData.getWord("Skill ID"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td align=\"left\"><input type='text' name='skill_id' value='");
      out.print( skillId );
      out.write("' disabled='disabled'/></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("\t\t\t<td width=\"50\" style=\"padding-right:5px;\">");
      out.print(pageData.getWord("Name"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td align=\"left\"><input name=\"skillName\" type=\"text\" value=\"");
      out.print( skillName );
      out.write("\"></td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("\t\t  \t<td colspan='2' align='left' style=\"padding-left:60px; padding-top:8px\">\r\n");
      out.write("\t\t  ");
 if(update){ 
      out.write("\r\n");
      out.write("\t\t  \t\r\n");
      out.write("\t\t  \t\t<input type='submit' value='");
      out.print(pageData.getWord("Update"));
      out.write("'/>\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t  \t\t \r\n");
      out.write("\t\t  \t\t<input type='button' value='");
      out.print(pageData.getWord("Delete"));
      out.write("' onClick='askDelete();'/>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t  ");
 }else{ 
      out.write("\r\n");
      out.write("\t\t  \t\t<input type='submit' value='");
      out.print(pageData.getWord("Submit"));
      out.write("'/>\t\r\n");
      out.write("\t\t  ");
 } 
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"tenant_dbid\" value=\"");
      out.print( tenantDBID );
      out.write("\" />\r\n");
      out.write("\t\t</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pageData.closeConnection(); 
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
