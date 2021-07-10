<%@page contentType="text/html"%>
<%@page language="java"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="aheevaManager.java.*"%>
<%@page import="aheevaManager.ressources.*"%>

<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();

	String listParams = request.getParameter("listParams");
	String savedQuest = request.getParameter("questionNum");
	String quesGrp = request.getParameter("quesGrp");
	
	String quesListValue = "";
	String saveString = listParams + "^" + request.getParameter("listQuestions") + "^" + "|";
	Dependency dependency = new Dependency();
	if (savedQuest != null) {
		String[] hiddenQuestions = request.getParameterValues("hiddenQuestions");
		for (int i = 0; hiddenQuestions != null && i < hiddenQuestions.length; i++) {
			saveString += hiddenQuestions[i] + "^";
		}
		dependency.saveHiddenQuestion(saveString);

	}

	String quesGrouId = listParams.substring(0, listParams.indexOf("^"));
	String dependencyId = listParams.substring(listParams.indexOf("^") + 1);

	QuestionGroup questionGroup = new QuestionGroup(quesGrouId);
	Answer answer;
	Question question;
	AnswerDetail answerDetail;
	String selectQuestion = "", listQuestion = "", lstVQuest = "", lstHQuest = "";
	DependencyDetails dependencyDetails;
	boolean questIsHide;
	int j = 0;
	String value = "", groupQuestionDetailDbid = "";
	
	for (int k = 0; k < questionGroup.getDependency().size(); k++) {
		if (questionGroup.getDependency().get(k).getDbid().equals(dependencyId)) {
			dependency = questionGroup.getDependency().get(k);
			if (dependency.getGroupQuestionDetailDbid() != null)
		           quesListValue = dependency.getGroupQuestionDetailDbid() + "^"
				        + dependency.getAnswerDetailDbid();
			break;
		}
	}
	
	if ("".equals(quesListValue)) {
		selectQuestion = "<option value=''></option>";
	}
	
	
	for (j = 0; j < questionGroup.getQuestion().size(); j++) {

		questIsHide = false;
		question = questionGroup.getQuestion().get(j);
		listQuestion += question.getQuesDetail() + "^" + question.getDescription() + "^";
		answer = new Answer(question.getAnswer());
		
		
		for (int i = 0; i < answer.getAnswerDetail().size(); i++) {
			answerDetail = answer.getAnswerDetail().get(i);
			
			selectQuestion += "<option value='" + question.getQuesDetail() + "^" + answerDetail.getDbid()
			+ "'>" + question.getDescription() + " [" + answerDetail.getName() + "]</option>";

		}
		if (!question.getQuesDetail().equals(dependency.getGroupQuestionDetailDbid())) {
			for (int k = 0; k < dependency.getDependencyDetails().size(); k++) {
		           dependencyDetails = dependency.getDependencyDetails().get(k);
		           if (dependencyDetails.getGroupQuestionDetailDbid().equals(question.getQuesDetail())) {
			           questIsHide = true;
		           }
			}
			if (dependency.getDependencyDetails().size() != 0) {
		           if (questIsHide) {
			              lstHQuest += "<option value='" + question.getQuesDetail() + "'>"+
			                            question.getDescription() + "</option>";
		            } else {
			              lstVQuest += "<option value='" + question.getQuesDetail() + "'>"+
			                            question.getDescription() + "</option>";
		            }
			}else{
				lstVQuest += "<option value='" + question.getQuesDetail() + "'>"+
                            question.getDescription() + "</option>";
			}
		}
	}

%>


<html>
<head>
<title>AheevaCCS - Not Applicable</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Language" content="en-us">
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<LINK href="../Resources_pages/livestats.css" rel="stylesheet"
	type="text/css" />
<LINK href="../Resources_pages/style.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="../Resources_pages/xc2_default.css"
	type="text/css">
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	clear: both;
	border: 1px solid rgb(145, 155, 156);
	background: rgb(252, 252, 254);
	z-index: 2;
	position: relative;
	top: -2px;
	font: 11px Tahoma;
	color: Black;
	filter: progid :             DXImageTransform .             Microsoft .
		     
		  
		  
		Gradient(StartColorStr =             #fffcfcfe, EndColorStr =          
		  #fff4f3ee, GradientType =             0) progid :           
		 DXImageTransform .         
		   Microsoft .    
		 
		  
		 
		 Shadow(Color =             #ff919899, Strength =             2,
		Direction =  
		      
		   135);
	padding: 10px;
	height: 95%;
	width: 95%;
}

form {
	margin: 0;
	padding: 0;
}

/* over ride styles from webfxlayout */
body {
	margin: 10px;
	width: auto;
	height: auto;
}

</style>

<script language="javascript">
var questNum = "<%=j%>";
var listParams = "<%=listParams%>";
var selectedQues = "<%=listQuestion%>";
var listQuestion = selectedQues.split("^");
var quesListValue = "<%=quesListValue%>";
var	lstVQuest = "<select name='visibleQuestions'  width='200' height='138'  style='FONT-WEIGHT: bold; FONT-SIZE: 8pt;"+
	                     "' size='10' multiple onchange='enabledQueueAddButton()'>"+
	                     "<option style='background-color:gray; color:white;'>&nbsp;&nbsp;&nbsp;&nbsp;<%=pageData.getWord("Visible Questions")%>&nbsp;&nbsp;&nbsp;&nbsp;</option>"+
	                     "<%=lstVQuest%>";
var	lstHQuest = "<select name='hiddenQuestions' style='FONT-WEIGHT: bold; FONT-SIZE: 8pt;'"+
	                    "  width='200' height='138' size='10' multiple onChange='enabledQueueDropButton()'>"+
	                     "<option style='background-color:gray; color:white;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=pageData.getWord("Hidden Questions")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>"+
	                     "<%=lstHQuest%>";
	      

function enableUpdateButton()
{	
	if(arguments.length > 0 && arguments[0] != null)
		isAgentNameChanged = arguments[0];		
	
	document.evaluation.updateInfo.disabled = false;
}

function validateInfo()
{
	if (document.evaluation.listQuestions.value=="") {
		alert("<%=pageData.getWord("You should select a question from the list of question[answer]")%>");
		document.evaluation.listQuestions.focus();
		return false;
	}


	var sel = document.evaluation.hiddenQuestions.options;
		for (var i=0;i<sel.length;i++)
		{
			sel[i].selected=true;
		}
		
	document.evaluation.action = "hideQuestions.jsp?listParams="+listParams+"&questionNum="+questNum+"&quesGrp="+"<%=quesGrp%>";
	document.evaluation.submit();
}

function enabledQueueAddButton()
{
   	document.evaluation.addQuestionButton.disabled = false;
}

function enabledQueueDropButton()
{
	document.evaluation.dropQuestionButton.disabled = false;
}

function fillListQuestions()
{
	lstVQuest = "<select name='visibleQuestions'  width='200' height='138'  style='FONT-WEIGHT: bold; FONT-SIZE: 8pt;"+
                 "' size='10' multiple onchange='enabledQueueAddButton()'>"+
                 "<option style='background-color:gray; color:white;'>&nbsp;&nbsp;&nbsp;&nbsp;<%=pageData.getWord("Visible Questions")%>&nbsp;&nbsp;&nbsp;&nbsp;</option>";
    lstHQuest = "<select name='hiddenQuestions' style='FONT-WEIGHT: bold; FONT-SIZE: 8pt;'"+
                 "  width='200' height='138' size='10' multiple onChange='enabledQueueDropButton()'>"+
                  "<option style='background-color:gray; color:white;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=pageData.getWord("Hidden Questions")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>";
                  
      
	for(var i=0;i+1<listQuestion.length;i=i+2)
	{
		if(document.evaluation.listQuestions.value.substr(0,document.evaluation.listQuestions.value.indexOf("^")) != listQuestion[i])
		{
			lstVQuest += "<option value='"+listQuestion[i]+"'>"+listQuestion[i+1]+"</option>";
		}
	}
	lstVQuest += "</select>";
	lstHQuest += "</select>";
	 
	    vQuestions.innerHTML = lstVQuest;
	     hQuestions.innerHTML = lstHQuest;
	 

    
}

function doSwitch(val1,val2) {
	if (document.getElementById(val1).selectedIndex!=0) {
		switchOptionsFromSelectBoxes(val1,val2);
	}
}

</script>

<script for="window" event="onload">
	
		if (quesListValue!="" && quesListValue!="0")
			document.evaluation.listQuestions.value = quesListValue;
		vQuestions.innerHTML = lstVQuest;
	    hQuestions.innerHTML = lstHQuest;
	
</script>
</head>

<body class="bottompagebody">

<form name="evaluation" method="post">
<div class="dynamic-tab-pane-control">
<div class="tab-page" id="general">
<fieldset><legend><%=dependency.getDescription() + " on " + quesGrp%></legend>
<table>
	<tr>
		<td>
			<select name="listQuestions" onChange="fillListQuestions()">
				<%=selectQuestion%>
			</select>
		</td>
	</tr>	
</table>
<table border="0">
	<tr>
		<td vAlign="top">
		<table id="availableQuestions" cellSpacing="0" cellPadding="0"
			border="0">
			<tr>
				<td width="200" height="138" align="center">
				<div id="vQuestions" style="width:200px; height:138px; overflow-x:scroll;">
				 <input id="vq" type="text"  style="FONT-WEIGHT: bold; width:200px; height:138px" multiple size="10"/>
			    </div>
				</td>
				<td width="115" height="138" bordercolordark="#c0c0c0" nowrap
					align="center">
				<p></p>
				<p>
				<button name="addQuestionButton" disabled
					onclick="doSwitch('visibleQuestions', 'hiddenQuestions');enableUpdateButton()"
					style="WIDTH: 40px; HEIGHT: 26px" type=button>&gt;&gt;</button>
				</p>
				<button name="dropQuestionButton" disabled
					onclick="doSwitch('hiddenQuestions','visibleQuestions');enableUpdateButton()"
					style="WIDTH: 40px; HEIGHT: 26px" type=button>&lt;&lt;</button>
				<p>&nbsp;</p>
				</td>
				<td width="200" height="138" bordercolor="#000000" align="left">
				<div id="hQuestions" style="width:200px; height:138px; overflow-x:scroll;" >
				   <input id="hq" type="text" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; width: 200px; height:138px;" size="10" multiple/ >
				</div>
				</td>

			</tr>
		</table>
		</td>
	</tr>
</table>

</fieldset>
</div>

</div>

<input disabled name="updateInfo" type="button"
	value="<%=pageData.getWord("Save")%>" onClick="validateInfo()"
	id="save"></form>
</body>
</html>
<%
pageData.closeConnection();
%>
