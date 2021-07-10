package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import java.sql.ResultSet;
import aheevaManager.ressources.*;

public final class form_jsp extends org.apache.jasper.runtime.HttpJspBase
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
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	QuestionGroup questionGroup;
	Question question;
	Dependency dependency;

	boolean containGroups,newForm = false;
	String tenantDbid = request.getParameter("tenant_dbid"),alertDIV="";
	Form vForm = new Form(tenantDbid,pageData);

	String formDbid = (request.getParameter("dbid") == null)?"":request.getParameter("dbid");
	if(formDbid.equals("")){
		formDbid = vForm.getIdFromName(request.getParameter("formName"));
		if(formDbid == null){
			formDbid = "";
		}
	}
	String questionGroupHTML = "",availableCampaign = "",selectedCampaign = "",selectedQueues="",availableQueues="",questionHTML = "",DependencyHTML = "";
	String listQuestionGroup = "";
	int grpNum = 1,questionNum = 0,questDepNum = 0;
	
	
	String saveString = (request.getParameter("saveString") == null)?"":request.getParameter("saveString");
	
	if(saveString.equals("1"))
	{
		saveString =formDbid+"^"+tenantDbid+"^"+request.getParameter("formName")+"^"+request.getParameter("formDesc")
		            +"^"+request.getParameter("state")+"^"+request.getParameter("predefined")+"|";
		grpNum = new Integer(request.getParameter("grpNum")).intValue();
		for(int i =1;i<=grpNum;i++)
		{
			if(request.getParameter("quesGprName"+i) != null)
			{
				saveString += request.getParameter("quesGprId"+i)+"^"+request.getParameter("quesGprName"+i)+"^"+request.getParameter("quesGprDesc"+i)+"^";
			}
		}
		
		int savedQuest = new Integer(request.getParameter("questionNum")).intValue();
		
		saveString += "|";
		for(int i =1;i<=savedQuest;i++)
		{
			if(request.getParameter("quesName"+i) != null)
			{
				String fcomment = (request.getParameter("fcomment"+i)==null)?"0":"1";
				String width = (request.getParameter("width"+i)==null)?"":request.getParameter("width"+i);
				String height = (request.getParameter("height"+i)==null)?"":request.getParameter("height"+i);
				
				saveString += request.getParameter("quesId"+i)+"^"+request.getParameter("quesName"+i)+"^"+
				              request.getParameter("ans"+i)+"^"+width+"^"+height+"^"+fcomment+"^"+request.getParameter("quesOrder"+i)+"^";
			}
		}
		
		saveString += "|";

		
		String [] listCampaign = request.getParameterValues("selectedCampaignGroups");

		for(int i =0;listCampaign != null && i<listCampaign.length;i++)
		{
				saveString += listCampaign[i]+"^";
		}
		
	
		saveString += "|";
		String [] listQueue = request.getParameterValues("selectedQueuesGroups");
		for(int i =0;listQueue != null && i<listQueue.length;i++)
		{
				saveString += listQueue[i]+"^";
		}
		
		saveString += "|";
		 
		
		int savedDepQuest = new Integer(request.getParameter("questDepNum")).intValue();
		for(int i =1;i<=savedDepQuest;i++)
		{
			if(request.getParameter("depName"+i) != null)
			{
				saveString += request.getParameter("depId"+i)+"^"+request.getParameter("depType"+i)+"^"+request.getParameter("depName"+i)+"^";
			}
		}
		
	formDbid = vForm.saveData(saveString);
	
      out.write("\r\n");
      out.write("\t<script>window.top.main.left.location.reload();</script>\r\n");
      out.write("\t");

	}

	if(saveString.equals("2"))
	{
		vForm.deleteForm(formDbid);
		formDbid = "";
		
      out.write("\r\n");
      out.write("\t\t<script>window.top.main.left.location.reload();</script>\r\n");
      out.write("\t\t");

	}
	
	
	if(formDbid.equals(""))
	{
		vForm = new Form(tenantDbid,pageData);
		newForm = true;
	}
	else
	{
		vForm = new Form(formDbid,tenantDbid,pageData);
	}

	String listAnswer = "";
	for(int i=0;i < vForm.getListAnswer().size();i++)
	{
		listAnswer += "<option value='"+vForm.getListAnswer().get(i).getDbid()+"'>"+vForm.getListAnswer().get(i).getName()+"</option>";
	}
	
	if(!vForm.getExitingEval().equals("0"))
	{
		alertDIV ="<div class=\"alertdiv\">"+pageData.getWord("Warning evaluation exists")+"</div><br>";
	}
	if(vForm.getQuestionQroup().size() == 0)
	{
		grpNum = 1;
		questionGroupHTML ="<table id='questionGrpId0'>"+
		                        "<tr>"+
		                           "<td><img src='../img/add.gif' onclick='addQuestionGroup(this,1)'></td>" +
		                           "<td><img src='../img/delete2.gif' onclick='deleteQuesGrpRow(this,1)'/></td>"+
		                           "<td><input type='hidden' name='quesGprId1' value='^1^0'></td>"+
		                           "<td>"+pageData.getWord("Name")+"</td>"+
		                           "<td><input type='text' name='quesGprName1' size='27' value='" + vForm.getName() + "' onChange='questionGrpChanged()'></td>"+
		                           "<td>"+pageData.getWord("Description")+"</td>" +
		                           "<td><input type='text' name='quesGprDesc1' " + "size='27' value='"+vForm.getDescription()+"' onChange='enableUpdateButton(true)'></td>" +
		                        "</tr>"+
		                   "</table>";
	}
	else
	{
		grpNum = vForm.getQuestionQroup().size();
		questionGroupHTML = vForm.getQuestionGroupHTML();
		for(int i=0;i < vForm.getQuestionQroup().size();i++)
		{
			questionGroup = vForm.getQuestionQroup().get(i);
			containGroups = true;
			
			for(int j=0;j < vForm.getQuestionQroup().size();j++)
				if(questionGroup.getDbid().equals(vForm.getQuestionQroup().get(j).getQuestionParentGrp()))
					containGroups = false;
			
			if(containGroups)
				listQuestionGroup += "<option value='"+(i+1)+"'>"+questionGroup.getName()+"</option>";
			
				questionHTML +="<tr id='questions"+(i+1)+"' style='display:none'>"+
				                   "<td>"+
				                       "<table>"+
				                          "<tr>"+
				                              "<td>"+
				                                 "<table id='questionTable"+(i+1)+"'>";
				
			
			if(questionGroup.getQuestion().size() != 0)
			{   questionHTML += "<tr>"+
				                   "<th></th>"+
				                   "<td>"+pageData.getWord("Name")+"</td>"+
				                   "<td>"+pageData.getWord("Answer")+"</td>"+
				                   "<td>"+pageData.getWord("Order")+"</td>"+
				                   "<td>"+pageData.getWord("Add Comment")+"</td>"+
				                   "<td>"+pageData.getWord("Cols number")+"</td>"+
				                   "<td>"+pageData.getWord("Rows number")+"</td>"+
				                   "<td></td>"+
				                "</tr>";
				               
				for(int j=0;j < questionGroup.getQuestion().size();j++)
				{
					questionNum++;
					question = questionGroup.getQuestion().get(j);
					questionHTML +="<tr>"+
					                  "<td><input type='hidden' value='"+questionGroup.getDbid()+"^"+question.getDbid()+"' name='quesId"+questionNum+"'></td>"+
					                  "<td><input type='text' name='quesName"+questionNum+"' size='27' value=\"" +question.getDescription() + "\" onChange='enableUpdateButton(true)' onBlur='checkDuplicateQuest(this,"+questionNum+",document.formul.quesName"+questionNum+".value)'  ></td>"+
					                  "<td><select name='ans"+questionNum+"' onChange='enableUpdateButton(true)'>"+listAnswer+"</select><script>document.formul.ans"+questionNum+".value="+question.getAnswer()+"</script></td>"+
					                  "<td><input type='text' name='quesOrder"+questionNum+"' size='4' value='"+question.getOrder()+"' onBlur='validateNumber(this);enableUpdateButton(true)'></td>"+
					                  "<td><input type='checkbox' name='fcomment"+questionNum+"'"+((question.getFcomment()==1)?"checked":"")+" value="+question.getFcomment()+" onClick='manageComment("+questionNum+");enableUpdateButton(true)' ></td>"+
					                  "<td><input type='text' name='width"+questionNum+"' value='"+question.getWidth()+"' size='5' onBlur='validateNumber(this);enableUpdateButton(true)' "+((question.getFcomment()==1)?"":"class=\"grayButton\" disabled")+"> </td>"+
					                  "<td><input type='text' name='height"+questionNum+"' value='"+question.getHeight()+"' size='5' onBlur='validateNumber(this);enableUpdateButton(true)' "+((question.getFcomment()==1)?"":"class=\"grayButton\" disabled")+"> </td>"+
					                  "<td><img src='../img/delete2.gif' onclick='deleteQuestion(this)'></td>"+
					               "</tr>";
				}
			}
			        questionHTML +=    "</table>"+
			                        "</td>"+
			                      "</tr>"+
			                      "<tr>"+
			                         "<td>"+
			                            "<table>"+
			                                "<tr>"+
			                                   "<td>"+pageData.getWord("Add question")+"</td>"+
			                                   "<td><img src='../img/add.gif' onclick='addQuestion("+(i+1)+","+questionGroup.getDbid()+")'></td>"+
			                                "</tr>"+
			                            "</table>"+
			                         "</td>"+
			                      "</tr>"+
			                    "</table>"+
			                  "</td>"+
			                "</tr>";
					
					
					DependencyHTML +="<tr id='Dependency"+(i+1)+"' style='display:none'>"+
					                      "<td>"+
					                         "<table>"+
					                            "<tr>"+
					                               "<td>"+
					                                  "<table id='DependencyTable"+(i+1)+"'>";
					
					if(containGroups){
					    if(questionGroup.getDependency().size() != 0)
					    {
						    for(int j=0;j < questionGroup.getDependency().size();j++)
						    {
							   questDepNum++;
							
							   dependency = questionGroup.getDependency().get(j);
							   DependencyHTML += "<tr>"+
							                        "<td><input type='hidden' value='"+questionGroup.getDbid()+"^"+dependency.getDbid()+"' name='depId"+questDepNum+"'></td>"+
							                        "<td>"+pageData.getWord("Type")+"</td>"+
							                        "<td><select name='depType"+questDepNum+"' onchange='fieldTypeClicked()'>"+vForm.getDependencyType()+"</select>"+
							                             "<script>document.formul.depType"+	questDepNum+".value="+dependency.getDependencyDbid()+"</script>"+
							                        "</td>"+
							                        "<td>"+pageData.getWord("Name")+"</td>"+
							                        "<td><input type='text' name='depName"+questDepNum+"' size='27' value=\""+dependency.getDescription()+"\" onChange='enableUpdateButton(true)'></td>"+
							                        "<td>"+pageData.getWord("Add Details")+"</td>"+
							                        "<td><img src='../img/details.gif' onclick='addDependencyDetail(this,"+questDepNum+")'></td>"+
							                        "<td><img src='../img/delete2.gif' onclick='deleteDependency(this)'></td>"+
							                     "</tr>";
						   }
					    }
					}
					DependencyHTML +=  "</table>"+
					                 "</td>"+
					               "</tr>"+
					               "<tr>"+
					                  "<td>"+
					                    "<table>"+
					                       "<tr>"+
					                          "<td>"+pageData.getWord("Add Dependency")+"</td>"+
					                          "<td><img src='../img/add.gif' onclick='addDependency("+(i+1)+","+questionGroup.getDbid()+")'></td>"+
					                       "</tr>"+
					                    "</table>"+
					                  "</td>"+
					               "</tr>"+
					             "</table>"+
					           "</td></tr>";
      }
	}
	listQuestionGroup += "</select>";
		ListCampaign listCampaign;
		for(int i=0;i < vForm.getListCampaign().size();i++)
		{
			listCampaign = vForm.getListCampaign().get(i);
			if(listCampaign.getActive())
			{
				selectedCampaign += "<option value='"+listCampaign.getDbid()+"'>"+listCampaign.getCampaingDesc()+"</option>";
			}
			else
			{
				availableCampaign += "<option value='"+listCampaign.getDbid()+"'>"+listCampaign.getCampaingDesc()+"</option>";
			}
		}

		ListQueues ListQueues;
		for(int i=0;i < vForm.getListQueues().size();i++)
		{
			ListQueues = vForm.getListQueues().get(i);
			if(ListQueues.getActive())
			{
				selectedQueues += "<option value='"+ListQueues.getQueueId()+"'>"+ListQueues.getQueueName()+"</option>";
			}
			else
			{
				availableQueues  += "<option value='"+ListQueues.getQueueId()+"'>"+ListQueues.getQueueName()+"</option>";
			}
		}
		

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
      out.write("\r\n");
      out.write(".alertdiv {\r\n");
      out.write("\theight:\t20px;\r\n");
      out.write("\tbackground: infobackground;\r\n");
      out.write("\twidth:\t\t600px;\r\n");
      out.write("\tfont-weight:bold;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"formFunction.js\"></script>\r\n");
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
      out.write("  var tenant_dbid = \"");
      out.print(tenantDbid);
      out.write("\";\r\n");
      out.write("  var newForm \t= ");
      out.print(newForm);
      out.write(";\r\n");
      out.write("  var formDbid \t= \"");
      out.print(formDbid);
      out.write("\";\r\n");
      out.write("  var grpNum \t\t= \"");
      out.print(grpNum);
      out.write("\";\r\n");
      out.write("  var questionNum = \"");
      out.print(questionNum);
      out.write("\";\r\n");
      out.write("  var questDepNum = \"");
      out.print(questDepNum);
      out.write("\";\r\n");
      out.write("  var listAnswer \t= \"");
      out.print(listAnswer);
      out.write("\";\r\n");
      out.write("  var styleType \t= \"");
      out.print(vForm.getDependencyType());
      out.write("\";\r\n");
      out.write("  var add_comment = \"");
      out.print(pageData.getWord("Add Comment"));
      out.write("\";\r\n");
      out.write("  var colls_nbr\t= \"");
      out.print(pageData.getWord("Cols number"));
      out.write("\";\r\n");
      out.write("  var rows_nbr \t= \"");
      out.print(pageData.getWord("Rows number"));
      out.write("\";\r\n");
      out.write("  var lbl_notnullname  \t= \"");
      out.print(pageData.getWord("Name should not be empty"));
      out.write("\";\r\n");
      out.write("  var formAlreadyExist  \t= \"");
      out.print(pageData.getWord("Form name already exist"));
      out.write("\";\r\n");
      out.write("  var mandatoryQuesGrp  \t= \"");
      out.print(pageData.getWord("At least one question group is required"));
      out.write("\";\r\n");
      out.write("  var lbl_notnullans      = \"");
      out.print(pageData.getWord("Answer list should not be empty"));
      out.write("\";\r\n");
      out.write("  var lbl_duplicateQuest  = \"");
      out.print(pageData.getWord("Question's name already exist, Please enter another name"));
      out.write("\";\r\n");
      out.write("  var notDeleteAll  = \"");
      out.print(pageData.getWord("You must have at least one question"));
      out.write("\";\r\n");
      out.write("  var listFormName \t= \"");
      out.print(vForm.getListName());
      out.write("\";\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
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
      out.write("  var lbl_desc  = \"");
      out.print(pageData.getWord("Description"));
      out.write("\";\r\n");
      out.write("  var lbl_name  = \"");
      out.print(pageData.getWord("Name"));
      out.write("\";\r\n");
      out.write("  var lbl_answer = \"");
      out.print(pageData.getWord("Answer"));
      out.write("\";\r\n");
      out.write("  var lbl_details  = \"");
      out.print(pageData.getWord("Add Details"));
      out.write("\";\r\n");
      out.write("  var lbl_order  = \"");
      out.print(pageData.getWord("Order"));
      out.write("\";\r\n");
      out.write("  var lbl_type  = \"");
      out.print(pageData.getWord("Type"));
      out.write("\";\r\n");
      out.write("  var lbl_notnullname  \t= \"");
      out.print(pageData.getWord("Name should not be empty"));
      out.write("\";\r\n");
      out.write("  var ques_group_alert  \t= \"");
      out.print(pageData.getWord("Are you sure you wish to delete this question group?"));
      out.write("\";\r\n");
      out.write("  var ques_alert  \t= \"");
      out.print(pageData.getWord("Are you sure you wish to delete this question?"));
      out.write("\";\r\n");
      out.write("  var depen_alert  = \"");
      out.print(pageData.getWord("Are you sure you wish to delete this dependency?"));
      out.write("\";\r\n");
      out.write("  var form_alert = \"");
      out.print(pageData.getWord("Are you sure you wish to delete this form?"));
      out.write("\";\r\n");
      out.write("  var question_alert = \"");
      out.print(pageData.getWord("Choose a question group before"));
      out.write("\";\r\n");
      out.write("  var invalid = \"");
      out.print(pageData.getWord("Invalid number"));
      out.write("\";\r\n");
      out.write("  \r\n");
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
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("<script for=\"window\" event=\"onload\">\r\n");
      out.write("  var isPredefined = \"");
      out.print(vForm.isPredefined());
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("  if(isPredefined == \"1\")\r\n");
      out.write("     changePredefined(true);\r\n");
      out.write("  else\r\n");
      out.write("\t changePredefined(false);\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"bottompagebody\">\r\n");
      out.print(alertDIV);
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"formul\" method=\"post\" action=\"\" onKeyDown=\"KeyDownHandler(save)\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("   tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("General"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabGeneral\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t   <legend>");
      out.print(pageData.getWord("General information"));
      out.write("</legend>\r\n");
      out.write("\t   <table border=\"0\">\r\n");
      out.write("\t\t   <tr>\r\n");
      out.write("\t\t\t   <td>");
      out.print(pageData.getWord("Name"));
      out.write("</td>\r\n");
      out.write("\t\t\t   <td><input type=\"text\" name=\"formName\" size=\"27\"\tvalue=\"");
      out.print(vForm.getName());
      out.write("\"  onChange=\"enableUpdateButton(true)\"></td>\r\n");
      out.write("\t\t   </tr>\r\n");
      out.write("\t\t   <tr>\r\n");
      out.write("\t\t\t   <td>");
      out.print(pageData.getWord("Description"));
      out.write("</td>\r\n");
      out.write("\t\t\t   <td><input type=\"text\" name=\"formDesc\" size=\"27\" value=\"");
      out.print(vForm.getDescription());
      out.write("\"  onChange=\"enableUpdateButton(true)\"></td>\r\n");
      out.write("\t\t   </tr>\r\n");
      out.write("\t\t   <tr>\r\n");
      out.write("\t\t       <td align=\"left\">\r\n");
      out.write("\t\t\t      ");
      out.print(pageData.getWord("Active"));
      out.write("\r\n");
      out.write("\t\t       </td>\r\n");
      out.write("\t\t       <td align=\"left\">\r\n");
      out.write("\t\t         <input type=\"checkbox\" name=\"state\" onClick=\"enableUpdateButton()\" ");
      out.print(((vForm.isActive()).compareTo("1")==0)?"checked":"");
      out.write(" value=\"1\">\r\n");
      out.write("\t\t       </td>\r\n");
      out.write("\t\t       <td align=\"left\">\r\n");
      out.write("\t\t          ");
      out.print(pageData.getWord("Predefined"));
      out.write("\r\n");
      out.write("\t\t       </td>\r\n");
      out.write("\t\t       <td align=\"left\">\r\n");
      out.write("\t\t          <input type=\"checkbox\" name=\"predefined\" onClick=\"predefinedClicked()\" ");
      out.print(((vForm.isPredefined()).compareTo("1")==0)?"checked":"");
      out.write(" value=\"1\">\r\n");
      out.write("\t\t       </td>\r\n");
      out.write("\t      </tr>\r\n");
      out.write("\r\n");
      out.write("\t   </table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabQuestionGroup\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Question group"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabQuestionGroup\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t\t<legend>");
      out.print(pageData.getWord("Question group information"));
      out.write("</legend>\r\n");
      out.write("\t\t<table>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t        ");
      out.print(questionGroupHTML);
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr onclick='addQuestionGroup(this,0)'>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print(pageData.getWord("Add question group"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td><img src='../img/add.gif'></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabQuestion\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Question"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabQuestion\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t\t<legend>");
      out.print(pageData.getWord("Question details"));
      out.write("</legend>\r\n");
      out.write("\t\t<table border=\"0\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(pageData.getWord("Question group"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><select id='quesListComboId' onchange='getListQuestion(this)'><option></option>");
      out.print(listQuestionGroup);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<table id=\"listques\">\r\n");
      out.write("\t\t\t\t\t     ");
      out.print(questionHTML);
      out.write("\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabQuesGrpDep\">\r\n");
      out.write("    <h2 class=\"tab\">");
      out.print(pageData.getWord("Group Dependency"));
      out.write("</h2>\r\n");
      out.write("    <script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabQuesGrpDep\" ) );</script>\r\n");
      out.write("    <fieldset>\r\n");
      out.write("\t    <legend>");
      out.print(pageData.getWord("Group Dependency"));
      out.write("</legend>\r\n");
      out.write("\t    <table border=\"0\">\r\n");
      out.write("\t\t    <tr>\r\n");
      out.write("\t\t\t   <td>\r\n");
      out.write("\t\t\t\t   <table>\r\n");
      out.write("\t\t\t\t\t   <tr>\r\n");
      out.write("\t\t\t\t\t\t   <td>");
      out.print(pageData.getWord("Question group"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t   <td><select id='dependencyCombo' onchange='getListDependency(this)'><option></option> ");
      out.print(listQuestionGroup);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t   </tr>\r\n");
      out.write("\t\t\t\t   </table>\r\n");
      out.write("\t\t\t   </td>\r\n");
      out.write("\t\t   </tr>\r\n");
      out.write("\t\t   <tr>\r\n");
      out.write("\t\t\t   <td>\r\n");
      out.write("\t\t\t \t   <table id=\"listDependency\">\r\n");
      out.write("\t\t\t\t\t   ");
      out.print(DependencyHTML);
      out.write("\r\n");
      out.write("\t\t\t\t   </table>\r\n");
      out.write("\t\t\t   </td>\r\n");
      out.write("\t\t   </tr>\r\n");
      out.write("\t    </table>\r\n");
      out.write("   </fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabCampaignList\">\r\n");
      out.write("    <h2 class=\"tab\">");
      out.print(pageData.getWord("Outbound campaign"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabCampaignList\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t\t<legend>");
      out.print(pageData.getWord("Associated Campaign"));
      out.write("</legend>\r\n");
      out.write("\t\t<table border=\"0\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td vAlign=\"top\" height=\"61\">\r\n");
      out.write("\t\t\t\t\t<table id=\"availableCampaign\" cellSpacing=\"0\" cellPadding=\"0\" width=\"331\" border=\"0\">\r\n");
      out.write("\t\t\t\t\t   <tr>\r\n");
      out.write("\t\t\t\t\t     <td height=\"21\" align=\"center\">");
      out.print(pageData.getWord("Available Campaign"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t     <td></td>\r\n");
      out.write("\t\t\t\t\t     <td align=\"center\">");
      out.print(pageData.getWord("Selected Campaign"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t  <tr>\r\n");
      out.write("\t\t\t\t\t\t <td width=\"200\" height=\"138\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t    <select name=\"availableCampaignGroups\" width=\"200\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px\" name=\"availableCampaignGroups\" size=\"10\" multiple onchange=\"enabledAddButton()\">\r\n");
      out.write("\t\t\t\t\t\t \t   ");
      out.print(availableCampaign);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t    </select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"115\" height=\"138\" bordercolordark=\"#c0c0c0\" nowrap align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t   <p> </p>\r\n");
      out.write("\t\t\t\t\t\t   <p>\r\n");
      out.write("\t\t\t\t\t\t   <button name=\"addButton\"  disabled onClick=\"switchOptionsFromSelectBoxes('availableCampaignGroups', 'selectedCampaignGroups');enableUpdateButton()\" style=\"WIDTH: 40px; HEIGHT: 26px\" type=button> &gt;&gt; </button></p>\r\n");
      out.write("\t\t\t\t\t\t   <button name=\"dropButton\" disabled onClick=\"switchOptionsFromSelectBoxes('selectedCampaignGroups', 'availableCampaignGroups');enableUpdateButton()\" style=\"WIDTH: 40px; HEIGHT: 26px\" type=button> &lt;&lt; </button>\r\n");
      out.write("\t\t\t\t\t\t   <p>&nbsp;</p>\t\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"200\" height=\"138\" bordercolor=\"#000000\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t   <select name=\"selectedCampaignGroups\" width=\"200\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px\" name=\"selectedCampaignGroups\" size=\"10\" multiple onChange=\"enabledDropButton()\">\r\n");
      out.write("\t\t\t\t\t\t \t  ");
      out.print(selectedCampaign);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t   </select>\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t     </table>\r\n");
      out.write("\t\t\t   </td>\r\n");
      out.write("\t\t   </tr>\r\n");
      out.write("\t  </table>\r\n");
      out.write("   </fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"tabInboundQueues\" style=\"visibility: hidden;\">\r\n");
      out.write("\t<h2 class=\"tab\">");
      out.print(pageData.getWord("Inbound queues"));
      out.write("</h2>\r\n");
      out.write("\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabInboundQueues\" ) );</script>\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t   <legend>");
      out.print(pageData.getWord("Associated Queues"));
      out.write("</legend>\r\n");
      out.write("\t   <table border=\"0\">\r\n");
      out.write("\t\t   <tr>\r\n");
      out.write("\t\t\t   <td vAlign=\"top\" height=\"61\">\r\n");
      out.write("\t\t\t\t   <table id=\"availableQueue\" cellSpacing=\"0\" cellPadding=\"0\" width=\"331\" border=\"0\">\r\n");
      out.write("\t\t\t\t     <tr>\r\n");
      out.write("\t\t\t\t        <td height=\"21\" align=\"center\">");
      out.print(pageData.getWord("Available Queues"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t        <td></td>\r\n");
      out.write("\t\t\t\t        <td align=\"center\">");
      out.print(pageData.getWord("Selected Queues"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t     </tr>\r\n");
      out.write("\t\t\t\t     <tr>\r\n");
      out.write("\t\t\t\t\t     <td width=\"200\" height=\"138\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t       <select name=\"availableQueuesGroups\" width=\"200\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px\" name=\"availableQueuesGroups\" size=\"10\" multiple onchange=\"enabledQueueAddButton()\">\r\n");
      out.write("\t\t\t\t\t\t      ");
      out.print(availableQueues);
      out.write("\r\n");
      out.write("\t\t\t\t\t       </select>\r\n");
      out.write("\t\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t\t    <td width=\"115\" height=\"138\" bordercolordark=\"#c0c0c0\" nowrap align=\"center\">\r\n");
      out.write("\t\t\t\t\t       <p> </p>\r\n");
      out.write("\t\t\t\t\t       <p>\r\n");
      out.write("\t\t\t\t\t       <button name=\"addQueueButton\"  disabled onClick=\"switchOptionsFromSelectBoxes('availableQueuesGroups', 'selectedQueuesGroups');enableUpdateButton()\" style=\"WIDTH: 40px; HEIGHT: 26px\" type=button> &gt;&gt; </button></p>\r\n");
      out.write("\t\t\t\t\t       <button name=\"dropQueueButton\" disabled onClick=\"switchOptionsFromSelectBoxes('selectedQueuesGroups', 'availableQueuesGroups');enableUpdateButton()\" style=\"WIDTH: 40px; HEIGHT: 26px\" type=button> &lt;&lt; </button>\r\n");
      out.write("\t\t\t\t\t       <p>&nbsp;</p>\t\r\n");
      out.write("\t\t\t\t\t   </td>\r\n");
      out.write("\t\t\t\t\t   <td width=\"200\" height=\"138\" bordercolor=\"#000000\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t       <select name=\"selectedQueuesGroups\" width=\"200\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px\" name=\"selectedQueuesGroups\" size=\"10\" multiple onChange=\"enabledQueueDropButton()\">\r\n");
      out.write("\t\t\t\t\t \t      ");
      out.print(selectedQueues);
      out.write("\r\n");
      out.write("\t\t\t\t\t       </select>\t\t\r\n");
      out.write("\t\t\t\t\t  </td>\r\n");
      out.write("\t\t\t\t    </tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t  </tr>\r\n");
      out.write("\t  </table>\r\n");
      out.write("    </fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<input disabled name=\"updateInfo\" type=\"button\" value=\"");
      out.print(pageData.getWord("Save"));
      out.write("\" onClick=\"validateInfo()\" id=\"save\">\r\n");
      out.write("<input name=\"deleteAgt\" type=\"button\" value=\"");
      out.print(pageData.getWord("Delete"));
      out.write("\" onClick=\"askDelete()\" ");
      out.print(newForm ? "disabled" : "");
      out.write(">\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");

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
