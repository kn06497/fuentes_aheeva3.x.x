<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "aheevaManager.java.*" %>
<%@page import = "aheevaManager.ressources.*" %>

<% 
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	
	String listParams = request.getParameter("listParams");
	String savedQuest = request.getParameter("questionNum");
	String quesGrp = request.getParameter("quesGrp");
	String saveString = listParams + "^|";
	Dependency dependency = new Dependency();
	if(savedQuest != null)
	{
		int intQuest = new Integer(savedQuest).intValue();
		for(int i=0;i < intQuest;i++)
		{
			saveString +=(request.getParameter("radio"+i) == null?"^^":request.getParameter("radio"+i))+"^";
		}
		dependency.saveNotAppData(saveString);
	}

	
	String quesGrouId = listParams.substring(0, listParams.indexOf("^"));
	String dependencyId = listParams.substring(listParams.indexOf("^")+1);
	
	QuestionGroup questionGroup = new QuestionGroup(quesGrouId);
	Answer answer;
	Question question;
	AnswerDetail answerDetail;
	String questionHTML = "",questionHeader="";
	DependencyDetails dependencyDetails;
	int j=0;
	String value="";
	
	if(questionGroup.getQuestion().size()==0){
		questionHTML=pageData.getWord("No question added to the question group");
	}else{
		
    	for(j=0;j < questionGroup.getQuestion().size();j++)
	    {
	    	question = questionGroup.getQuestion().get(j);
		    questionHTML +="<tr><td width='3px;'></td><th style='color:#0000FF;font-size:13px;' align='left'>"+question.getDescription()+"</th><td width='20px;'></td>";
		    answer = new Answer(question.getAnswer());
		    
		    boolean checked = true;
		    for(int i=0;i < answer.getAnswerDetail().size();i++)
		    {
			    value="value='^";
			    answerDetail = answer.getAnswerDetail().get(i);
		        for(int k=0;k < questionGroup.getDependency().size();k++){
				    if(questionGroup.getDependency().get(k).getDbid().equals(dependencyId)){
				    	dependency = questionGroup.getDependency().get(k);
				    	break;
				    }
			    }
			    for(int k=0;k < dependency.getDependencyDetails().size();k++){
				   dependencyDetails = dependency.getDependencyDetails().get(k);
				   if(dependencyDetails.getAnswerDetailDbid().equals(answerDetail.getDbid()) && 
				 		  dependencyDetails.getGroupQuestionDetailDbid().equals(question.getQuesDetail())){
					           value = " checked value='"+dependencyDetails.getDbid()+"^";
					  checked = false;
				  }
			   }
			   value += question.getQuesDetail()+"^"+answerDetail.getDbid()+"'";
			   questionHTML +="<td>"+answerDetail.getName()+"</td><td><input type='radio' onClick='enableUpdateButton(true)' "+value+" name='radio"+j+"'></td>";
		    }
		   questionHTML +="<td>"+ pageData.getWord("Cancel N/A") +"</td><td><input type='radio' onClick='enableUpdateButton(true)'";
		   if(checked){
			   questionHTML += " checked";	
		    }
		    questionHTML +=" value='^^' name='radio"+j+"'></td></tr>";
	     }
	}
	questionHeader = "<tr>"+ questionHeader + "<th>"+pageData.getWord("Cancel N/A")+"</th></tr>";
%>


<html>
<head>
<title>AheevaCCS - Not Applicable</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Language" content="en-us">
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<LINK href="../Resources_pages/livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../Resources_pages/xc2_default.css" type="text/css">
<style type="text/css">


.dynamic-tab-pane-control .tab-page {
	clear:			both;
	border:			1px solid rgb( 145, 155, 156 );
	background:		rgb( 252, 252, 254 );
	z-index:		2;
	position:		relative;
	top:			-2px;

	font:			11px Tahoma;
	color:			Black;

	filter:			progid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)
					progid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);
	
	padding:		10px;
	height:			95%  ;
	width:			95%	;
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

</style>

<script language="javascript">
var questNum = "<%=j%>";
var listParams = "<%=listParams%>";
function enableUpdateButton()
{	
	if(arguments.length > 0 && arguments[0] != null)
		isAgentNameChanged = arguments[0];		
	
	document.evaluation.updateInfo.disabled = false;
}

function validateInfo()
{
	document.evaluation.action = "notApplicable.jsp?listParams="+listParams+"&questionNum="+questNum+"&quesGrp="+"<%=quesGrp%>";
	document.evaluation.submit();
}

</script>


</head>

<body class="bottompagebody" >

<form name="evaluation" method="post">
<div class="dynamic-tab-pane-control">
    <div class="tab-page" id="general"> 
      <fieldset>
        <legend><%=dependency.getDescription() + " on " + quesGrp%></legend>
      	<table>
		   <%=questionHTML%>
		</table>
			
     </fieldset>
    </div>
</div>

<input disabled name="updateInfo" type="button" value="<%=pageData.getWord("Save")%>" onClick="validateInfo()" id="save">
</form>
</body>
</html>
<%
pageData.closeConnection();
%>
