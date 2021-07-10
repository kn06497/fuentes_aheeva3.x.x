package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import java.sql.ResultSet;
import aheevaManager.ressources.*;

public final class answer_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	AnswerDetail answerDetail ;
	
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	boolean newAnswer = false;

	String tenantDbid = request.getParameter("tenant_dbid");
	String answerDbid = (request.getParameter("dbid") == null)?"":request.getParameter("dbid");
	String answerDetailHTML = "";
	int ansDetNum = 1;
	
	Answer vAnswer = new Answer();
	String saveString = (request.getParameter("saveString") == null)?"":request.getParameter("saveString");

	if(saveString.equals("1"))
	{
		String state = (request.getParameter("state")==null)?"0":request.getParameter("state");
		saveString = answerDbid+"^"+tenantDbid+"^"+request.getParameter("answerName")+
			         "^"+request.getParameter("answerDesc")+"^"+state+"^"+request.getParameter("fieldType")
			         +"^"+request.getParameter("minScore")+"^"+request.getParameter("maxScore")+"|";
		ansDetNum = new Integer(request.getParameter("ansDetNum")).intValue();
		
		
		if (!request.getParameter("fieldType").equals("3")) {
			for(int i =1;i<=ansDetNum;i++)
			{
				if(request.getParameter("ansDetName"+i) != null)
				{
					saveString += request.getParameter("ansDetId"+i)+"^"+request.getParameter("ansDetName"+i)+"^"+request.getParameter("ansDetDesc"+i)+"^"+request.getParameter("ansDetRank"+i)+"^";
				}
			
			}
		}
	
		answerDbid = vAnswer.saveData(saveString);
		
      out.write("\r\n");
      out.write("\t\t<script>window.top.main.left.location.reload();</script>\r\n");
      out.write("\t\t");

	}
	
	if(saveString.equals("2"))
	{
		vAnswer.deleteAnswersList(answerDbid);
		answerDbid = "";
		
      out.write("\r\n");
      out.write("\t\t<script>window.top.main.left.location.reload();</script>\r\n");
      out.write("\t\t");

	}

	if(answerDbid.equals(""))
	{
		vAnswer = new Answer();
		newAnswer = true;
	}
	else
	{
		vAnswer = new Answer(answerDbid);
	}

	
	if(vAnswer.getAnswerDetail().size() == 0)
	{
		answerDetailHTML ="<tr>"+
		                     "<td><input type='hidden' name='ansDetId1'></td>"+
		                     "<td>"+pageData.getWord("Name")+"</td>"+
		                     "<td><input type='text' name='ansDetName1' size='27' value='' onChange='enableUpdateButton()'></td>"+
		                     "<td>"+pageData.getWord("Description")+"</td>"+
		                     "<td><input type='text' name='ansDetDesc1' size='27' value='' onChange='enableUpdateButton()'></td>"+
		                     "<td>"+pageData.getWord("Score")+"</td>"+
		                     "<td><input type='text' name='ansDetRank1' size='2' value='' onChange='validateRank(this)'></td>"+
		                     "<td><img src='../img/delete2.gif' onclick='deleteAnsDetRow(this)'/></td>"+
		                  "</tr>";
	}
	else
	{
		ansDetNum = vAnswer.getAnswerDetail().size();
		for(int i=0;i < vAnswer.getAnswerDetail().size();i++)
		{
			answerDetail = vAnswer.getAnswerDetail().get(i);
			answerDetailHTML +="<tr>"+
			                      "<td><input type='hidden' name='ansDetId"+(i+1)+"' value='"+answerDetail.getDbid()+"'></td>"+
			                      "<td>"+pageData.getWord("Name")+"</td>"+
			                      "<td><input type='text' name='ansDetName"+(i+1)+"' size='27' value='" + answerDetail.getName() +"' onChange='enableUpdateButton()'></td>"+
			                      "<td>"+pageData.getWord("Description")+"</td>"+
			                      "<td><input type='text' name='ansDetDesc"+(i+1)+"' size='27' value='"+answerDetail.getDescription()+"' onChange='enableUpdateButton()'></td>"+
			                      "<td>"+pageData.getWord("Score")+"</td>"+
			                      "<td><input type='text' name='ansDetRank"+(i+1)+"' size='2' value='"+answerDetail.getRank()+"' onChange='validateRank(this)'></td>"+
			                      "<td><img src='../img/delete2.gif' onclick='deleteAnsDetRow(this)'/></td>"+
			                   "</tr>";
		}
	}
	
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	String userPrivilegesQuery  = "SELECT * FROM cfg_user WHERE DBID='"+CURRENT_USER_DBID+"'";

	Vector <HashMap> userPrivilegesDataResult = pageData.executeFromStringToVector(userPrivilegesQuery);

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style.css\" />\r\n");
      out.write("<link type=\"text/css\" rel=\"StyleSheet\" href=\"slider/css/luna.css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"xc2_default.css\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Language\" content=\"en-us\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100px;\r\n");
      out.write("}\r\n");
      out.write("html, body {\r\n");
      out.write("\r\n");
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
      out.write("\r\n");
      out.write(".hide {\r\n");
      out.write("\tvisibility:hidden;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"answerFunction.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"slider/js/range.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"slider/js/timer.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"slider/js/slider.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("var tenant_dbid = \"");
      out.print(tenantDbid);
      out.write("\";\r\n");
      out.write("var newAnswer = ");
      out.print(newAnswer);
      out.write(";\r\n");
      out.write("var answerDbid = \"");
      out.print(answerDbid);
      out.write("\";\r\n");
      out.write("var ansDetNum = \"");
      out.print(ansDetNum);
      out.write("\";\r\n");
      out.write("var lbl_rank  = \"");
      out.print(pageData.getWord("Score"));
      out.write("\";\r\n");
      out.write("var lbl_desc  = \"");
      out.print(pageData.getWord("Description"));
      out.write("\";\r\n");
      out.write("var lbl_name  = \"");
      out.print(pageData.getWord("Name"));
      out.write("\";\r\n");
      out.write("var lbl_notnullrank  \t= \"");
      out.print(pageData.getWord("Score should not be empty"));
      out.write("\";\r\n");
      out.write("var lbl_notnulldesc  \t= \"");
      out.print(pageData.getWord("Description should not be empty"));
      out.write("\";\r\n");
      out.write("var lbl_notnullname  \t= \"");
      out.print(pageData.getWord("Name should not be empty"));
      out.write("\";\r\n");
      out.write("var lbl_invalidnumber\t= \"");
      out.print(pageData.getWord("Invalid number"));
      out.write("\";\r\n");
      out.write("var answer_alert = \"");
      out.print(pageData.getWord("Are you sure you wish to delete this answer?"));
      out.write("\";\r\n");
      out.write("var answer_list_alert = \"");
      out.print(pageData.getWord("Are you sure you wish to delete this answers list?"));
      out.write("\";\r\n");
      out.write("var answer_style_check  \t= \"");
      out.print(pageData.getWord("The Minimum should be less then Maximum"));
      out.write("\";\r\n");
      out.write("var lbl_stylenull  \t= \"");
      out.print(pageData.getWord("Type should not be empty"));
      out.write("\";\r\n");
      out.write("var lbl_active = \"");
      out.print(pageData.getWord("The list is used in an active form"));
      out.write("\";\r\n");
      out.write("var lbl_ansunique = \"");
      out.print(pageData.getWord("Another answers list with the same name exists"));
      out.write("\";\r\n");
      out.write("var check= \"");
      out.print(vAnswer.getStatus());
      out.write("\";\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<script for=\"window\" event=\"onload\">\r\n");
      out.write("\tdocument.formul.fieldType.value=\"");
      out.print(vAnswer.getStyleValue());
      out.write("\";\r\n");
      out.write("\tenableDisableMinMax();\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<SCRIPT language=\"JavaScript\">\r\n");
      out.write("<!--\r\n");
      out.write("if (document.images)\r\n");
      out.write("{\r\n");
      out.write("  pic1= new Image(90,25); \r\n");
      out.write("  pic1.src=\"../img/add.gif\"; \r\n");
      out.write("\r\n");
      out.write("  pic2= new Image(94,25); \r\n");
      out.write("  pic2.src=\"../img/tab.active.gif\"; \r\n");
      out.write("\r\n");
      out.write("  pic3= new Image(90,25); \r\n");
      out.write("  pic3.src=\"../img/tab.hover.gif\"; \r\n");
      out.write("}\r\n");
      out.write("//-->\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("\r\n");
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
      out.write("<body class=\"bottompagebody\">\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"formul\" method=\"post\" action=\"\" onKeyDown=\"KeyDownHandler(save)\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("General"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t<legend>");
      out.print(pageData.getWord("General information"));
      out.write("</legend>\r\n");
      out.write("\t<table border=\"0\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Name"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"answerName\" size=\"27\"\tvalue=\"");
      out.print(vAnswer.getName());
      out.write("\"  onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Description"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"answerDesc\" size=\"27\" value=\"");
      out.print(vAnswer.getDescription());
      out.write("\"  onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Type"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t");
      out.print(vAnswer.getStyle());
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Minimum"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"minScore\" size=\"27\" value=\"");
      out.print(vAnswer.getMinScore());
      out.write("\"  onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>");
      out.print(pageData.getWord("Maximum"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"maxScore\" size=\"27\" value=\"");
      out.print(vAnswer.getMaxScore());
      out.write("\"  onChange=\"enableUpdateButton()\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t");
      out.print(pageData.getWord("Active"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t<input type=\"checkbox\" name=\"state\" onClick=\"enableUpdateButton()\" ");
      out.print(((vAnswer.getState()).compareTo("1")==0)?"checked":"");
      out.write(" value=\"1\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabAnswerDetail\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Answer details"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabAnswerDetail\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t\t<legend>");
      out.print(pageData.getWord("Answer details information"));
      out.write("</legend>\r\n");
      out.write("\t\t<table>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<table border=\"0\" id=\"answerDetailId\">\r\n");
      out.write("\t\t\t\t\t");
      out.print(answerDetailHTML);
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<tr onclick='addAnswerDetail()'>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(pageData.getWord("Add answer"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td><img src='../img/add.gif'></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<input disabled name=\"updateInfo\" type=\"button\" value=\"");
      out.print(pageData.getWord("Save"));
      out.write("\" onClick=\"validateInfo()\" id=\"save\">\r\n");
      out.write("<input name=\"deleteAnsDet\" type=\"button\" value=\"");
      out.print(pageData.getWord("Delete"));
      out.write("\" onClick=\"askDelete()\" ");
      out.print(newAnswer ? "disabled" : "");
      out.write(">\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<script>\r\n");
      out.write("tp = tp1.pages[1];\r\n");
      out.write("tp.disable();\r\n");
      out.write("tp.enable();\r\n");
      out.write("</script>\r\n");

pageData.closeConnection();

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
