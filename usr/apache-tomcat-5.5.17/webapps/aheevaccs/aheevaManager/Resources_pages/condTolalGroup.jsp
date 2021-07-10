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
	String savedQuest = request.getParameter("savedQuest");
	String quesGrp = request.getParameter("quesGrp");

	Dependency dependency = new Dependency();
	if (savedQuest != null) {
		String saveString = listParams + "^"
		+ request.getParameter("operator") + "^"
		+ request.getParameter("prcMaxScore") + "^"
		+ request.getParameter("prcScore") + "^" + "|";
		dependency.saveCondTotalGroup(saveString);
	}

	String quesGrouId = listParams
			.substring(0, listParams.indexOf("^"));
	String dependencyId = listParams
			.substring(listParams.indexOf("^") + 1);

	QuestionGroup questionGroup = new QuestionGroup(quesGrouId);
	int j = 0;
	String value = "";

	for (int k = 0; k < questionGroup.getDependency().size(); k++) {
		if (questionGroup.getDependency().get(k).getDbid().equals(dependencyId)) {
			dependency = questionGroup.getDependency().get(k);
			break;
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
	filter: progid : DXImageTransform . Microsoft .
		Gradient(StartColorStr = #fffcfcfe, EndColorStr = #fff4f3ee,
		GradientType = 0) progid : DXImageTransform . Microsoft .
		Shadow(Color = #ff919899, Strength = 2, Direction = 135);
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

<script for='window' event='onload'>
document.evaluation.operator.value = "<%=dependency.getOperator()%>";
</script>

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
	
	document.evaluation.action = "condTolalGroup.jsp?listParams="+listParams+"&savedQuest=1"+"&quesGrp="+"<%=quesGrp%>";
	document.evaluation.submit();
}

</script>


</head>

<body class="bottompagebody">

<form name="evaluation" method="post">
<div class="dynamic-tab-pane-control">
<div class="tab-page" id="general">
<fieldset>
  <legend><%=dependency.getDescription() + " on " + quesGrp%></legend>
  <table>
	<tr>
		<td><%=pageData.getWord("If current score")%>
		   <select	name="operator" name='opeSelect' onchange="enableUpdateButton(true)">
			    <option	value="<"><</option>
				<option value=">">></option>
				<option value="=">=</option>
				<option value="<="><=</option>
				<option value=">=">>=</option>
		   </select>
			<input name="prcMaxScore" size="8" value="<%=dependency.getPrcMaxScore()%>" onChange="enableUpdateButton(true)" type='text'>%
			<%=pageData.getWord("of total score, current score")%>=
			<input name="prcScore" size="8" value="<%=dependency.getPrcScore()%>" onChange="enableUpdateButton(true)" type='text'>
			%<%=pageData.getWord("of current score")%>
	   </td>
	</tr>
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
