<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "aheevaManager.ressources.*" %>
<%


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
	%>
	<script>window.top.main.left.location.reload();</script>
	<%
	}

	if(saveString.equals("2"))
	{
		vForm.deleteForm(formDbid);
		formDbid = "";
		%>
		<script>window.top.main.left.location.reload();</script>
		<%
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
		
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<LINK href="style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="xc2_default.css" type="text/css">
<meta http-equiv="Content-Language" content="en-us">
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {

}
form {
	margin:		0;
	padding:	0;
}
/* over ride styles from webfxlayout */
body {
	margin:		10px;
	width:		auto;
	height:		auto;
}
.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}
.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
}
.dynamic-tab-pane-control a:hover {
	background: transparent;
}

.hide {
	visibility:hidden;
}

.alertdiv {
	height:	20px;
	background: infobackground;
	width:		600px;
	font-weight:bold;
}

</style>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="formFunction.js"></script>
<script language="javascript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>

<script type="text/javascript" src="slider/js/range.js"></script>
<script type="text/javascript" src="slider/js/timer.js"></script>
<script type="text/javascript" src="slider/js/slider.js"></script>


<script language="javascript" type="text/javascript">
  var tenant_dbid = "<%=tenantDbid%>";
  var newForm 	= <%=newForm%>;
  var formDbid 	= "<%=formDbid%>";
  var grpNum 		= "<%=grpNum%>";
  var questionNum = "<%=questionNum%>";
  var questDepNum = "<%=questDepNum%>";
  var listAnswer 	= "<%=listAnswer%>";
  var styleType 	= "<%=vForm.getDependencyType()%>";
  var add_comment = "<%=pageData.getWord("Add Comment")%>";
  var colls_nbr	= "<%=pageData.getWord("Cols number")%>";
  var rows_nbr 	= "<%=pageData.getWord("Rows number")%>";
  var lbl_notnullname  	= "<%=pageData.getWord("Name should not be empty")%>";
  var formAlreadyExist  	= "<%=pageData.getWord("Form name already exist")%>";
  var mandatoryQuesGrp  	= "<%=pageData.getWord("At least one question group is required")%>";
  var lbl_notnullans      = "<%=pageData.getWord("Answer list should not be empty")%>";
  var lbl_duplicateQuest  = "<%=pageData.getWord("Question's name already exist, Please enter another name")%>";
  var notDeleteAll  = "<%=pageData.getWord("You must have at least one question")%>";
  var listFormName 	= "<%=vForm.getListName()%>";
</script>


<SCRIPT language="JavaScript">
<!--
if (document.images)
{
  pic1= new Image(90,25); 
  pic1.src="../img/add.gif"; 

  pic2= new Image(94,25); 
  pic2.src="../img/tab.active.gif"; 

  pic3= new Image(90,25); 
  pic3.src="../img/tab.hover.gif"; 
}
//-->
</SCRIPT>

<script language="javascript">
  var lbl_desc  = "<%=pageData.getWord("Description")%>";
  var lbl_name  = "<%=pageData.getWord("Name")%>";
  var lbl_answer = "<%=pageData.getWord("Answer")%>";
  var lbl_details  = "<%=pageData.getWord("Add Details")%>";
  var lbl_order  = "<%=pageData.getWord("Order")%>";
  var lbl_type  = "<%=pageData.getWord("Type")%>";
  var lbl_notnullname  	= "<%=pageData.getWord("Name should not be empty")%>";
  var ques_group_alert  	= "<%=pageData.getWord("Are you sure you wish to delete this question group?")%>";
  var ques_alert  	= "<%=pageData.getWord("Are you sure you wish to delete this question?")%>";
  var depen_alert  = "<%=pageData.getWord("Are you sure you wish to delete this dependency?")%>";
  var form_alert = "<%=pageData.getWord("Are you sure you wish to delete this form?")%>";
  var question_alert = "<%=pageData.getWord("Choose a question group before")%>";
  var invalid = "<%=pageData.getWord("Invalid number")%>";
  
    // Associate a default button with pressing the Enter key
	function KeyDownHandler(btn)
    {
        // process only the Enter key
        if (event.keyCode == 13)
        {
            // cancel the default submit
            event.returnValue=false;
            event.cancel = true;
            // submit the form by programmatically clicking the specified button
            btn.click();
        }
    }
	
</script>
<script for="window" event="onload">
  var isPredefined = "<%=vForm.isPredefined()%>";

  if(isPredefined == "1")
     changePredefined(true);
  else
	 changePredefined(false);
</script>
</head>
<body class="bottompagebody">
<%=alertDIV%>
<div class="tab-pane" id="tabPane1">
<form name="formul" method="post" action="" onKeyDown="KeyDownHandler(save)">
<script type="text/javascript">
   tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
<div class="tab-page" id="tabGeneral">
	<h2 class="tab"><%=pageData.getWord("General")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
	<fieldset>
	   <legend><%=pageData.getWord("General information")%></legend>
	   <table border="0">
		   <tr>
			   <td><%=pageData.getWord("Name")%></td>
			   <td><input type="text" name="formName" size="27"	value="<%=vForm.getName()%>"  onChange="enableUpdateButton(true)"></td>
		   </tr>
		   <tr>
			   <td><%=pageData.getWord("Description")%></td>
			   <td><input type="text" name="formDesc" size="27" value="<%=vForm.getDescription()%>"  onChange="enableUpdateButton(true)"></td>
		   </tr>
		   <tr>
		       <td align="left">
			      <%=pageData.getWord("Active")%>
		       </td>
		       <td align="left">
		         <input type="checkbox" name="state" onClick="enableUpdateButton()" <%=((vForm.isActive()).compareTo("1")==0)?"checked":""%> value="1">
		       </td>
		       <td align="left">
		          <%=pageData.getWord("Predefined")%>
		       </td>
		       <td align="left">
		          <input type="checkbox" name="predefined" onClick="predefinedClicked()" <%=((vForm.isPredefined()).compareTo("1")==0)?"checked":""%> value="1">
		       </td>
	      </tr>

	   </table>
	</fieldset>
</div>

<div class="tab-page" id="tabQuestionGroup">
	<h2 class="tab"><%=pageData.getWord("Question group")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabQuestionGroup" ) );</script>
	<fieldset>
		<legend><%=pageData.getWord("Question group information")%></legend>
		<table>
			<tr>
				<td>
				        <%=questionGroupHTML%>			
				</td>
			</tr>
			<tr>
				<table>
					<tr onclick='addQuestionGroup(this,0)'>
						<td><%=pageData.getWord("Add question group")%></td>
						<td><img src='../img/add.gif'></td>
					</tr>
				</table>
			</tr>
		</table>
	</fieldset>
</div>

<div class="tab-page" id="tabQuestion">
	<h2 class="tab"><%=pageData.getWord("Question")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabQuestion" ) );</script>
	<fieldset>
		<legend><%=pageData.getWord("Question details")%></legend>
		<table border="0">
			<tr>
				<td>
					<table>
						<tr>
							<td><%=pageData.getWord("Question group")%></td>
							<td><select id='quesListComboId' onchange='getListQuestion(this)'><option></option><%=listQuestionGroup%></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id="listques">
					     <%=questionHTML%>
					</table>
				</td>
			</tr>
		</table>
	</fieldset>
</div>


<div class="tab-page" id="tabQuesGrpDep">
    <h2 class="tab"><%=pageData.getWord("Group Dependency")%></h2>
    <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabQuesGrpDep" ) );</script>
    <fieldset>
	    <legend><%=pageData.getWord("Group Dependency")%></legend>
	    <table border="0">
		    <tr>
			   <td>
				   <table>
					   <tr>
						   <td><%=pageData.getWord("Question group")%></td>
						   <td><select id='dependencyCombo' onchange='getListDependency(this)'><option></option> <%=listQuestionGroup%></td>
					   </tr>
				   </table>
			   </td>
		   </tr>
		   <tr>
			   <td>
			 	   <table id="listDependency">
					   <%=DependencyHTML%>
				   </table>
			   </td>
		   </tr>
	    </table>
   </fieldset>
</div>


<div class="tab-page" id="tabCampaignList">
    <h2 class="tab"><%=pageData.getWord("Outbound campaign")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabCampaignList" ) );</script>
	<fieldset>
		<legend><%=pageData.getWord("Associated Campaign")%></legend>
		<table border="0">
			<tr>
				<td vAlign="top" height="61">
					<table id="availableCampaign" cellSpacing="0" cellPadding="0" width="331" border="0">
					   <tr>
					     <td height="21" align="center"><%=pageData.getWord("Available Campaign")%></td>
					     <td></td>
					     <td align="center"><%=pageData.getWord("Selected Campaign")%></td>
					  </tr>
					
					  <tr>
						 <td width="200" height="138" align="center">
						    <select name="availableCampaignGroups" width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="availableCampaignGroups" size="10" multiple onchange="enabledAddButton()">
						 	   <%=availableCampaign%>
						    </select>
						</td>
						<td width="115" height="138" bordercolordark="#c0c0c0" nowrap align="center">
						   <p> </p>
						   <p>
						   <button name="addButton"  disabled onClick="switchOptionsFromSelectBoxes('availableCampaignGroups', 'selectedCampaignGroups');enableUpdateButton()" style="WIDTH: 40px; HEIGHT: 26px" type=button> &gt;&gt; </button></p>
						   <button name="dropButton" disabled onClick="switchOptionsFromSelectBoxes('selectedCampaignGroups', 'availableCampaignGroups');enableUpdateButton()" style="WIDTH: 40px; HEIGHT: 26px" type=button> &lt;&lt; </button>
						   <p>&nbsp;</p>	
						</td>
						<td width="200" height="138" bordercolor="#000000" align="left">
						   <select name="selectedCampaignGroups" width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="selectedCampaignGroups" size="10" multiple onChange="enabledDropButton()">
						 	  <%=selectedCampaign%>
						   </select>				
						</td>
					</tr>
			     </table>
			   </td>
		   </tr>
	  </table>
   </fieldset>
</div>

<div class="tab-page" id="tabInboundQueues" style="visibility: hidden;">
	<h2 class="tab"><%=pageData.getWord("Inbound queues")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabInboundQueues" ) );</script>
	<fieldset>
	   <legend><%=pageData.getWord("Associated Queues")%></legend>
	   <table border="0">
		   <tr>
			   <td vAlign="top" height="61">
				   <table id="availableQueue" cellSpacing="0" cellPadding="0" width="331" border="0">
				     <tr>
				        <td height="21" align="center"><%=pageData.getWord("Available Queues")%></td>
				        <td></td>
				        <td align="center"><%=pageData.getWord("Selected Queues")%></td>
				     </tr>
				     <tr>
					     <td width="200" height="138" align="center">
					       <select name="availableQueuesGroups" width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="availableQueuesGroups" size="10" multiple onchange="enabledQueueAddButton()">
						      <%=availableQueues%>
					       </select>
					    </td>
					    <td width="115" height="138" bordercolordark="#c0c0c0" nowrap align="center">
					       <p> </p>
					       <p>
					       <button name="addQueueButton"  disabled onClick="switchOptionsFromSelectBoxes('availableQueuesGroups', 'selectedQueuesGroups');enableUpdateButton()" style="WIDTH: 40px; HEIGHT: 26px" type=button> &gt;&gt; </button></p>
					       <button name="dropQueueButton" disabled onClick="switchOptionsFromSelectBoxes('selectedQueuesGroups', 'availableQueuesGroups');enableUpdateButton()" style="WIDTH: 40px; HEIGHT: 26px" type=button> &lt;&lt; </button>
					       <p>&nbsp;</p>	
					   </td>
					   <td width="200" height="138" bordercolor="#000000" align="left">
					       <select name="selectedQueuesGroups" width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="selectedQueuesGroups" size="10" multiple onChange="enabledQueueDropButton()">
					 	      <%=selectedQueues%>
					       </select>		
					  </td>
				    </tr>
				</table>
			</td>
		  </tr>
	  </table>
    </fieldset>
</div>


<input disabled name="updateInfo" type="button" value="<%=pageData.getWord("Save")%>" onClick="validateInfo()" id="save">
<input name="deleteAgt" type="button" value="<%=pageData.getWord("Delete")%>" onClick="askDelete()" <%=newForm ? "disabled" : ""%>>
</form>
</div>
</body>
</html>
<%
pageData.closeConnection();
%>