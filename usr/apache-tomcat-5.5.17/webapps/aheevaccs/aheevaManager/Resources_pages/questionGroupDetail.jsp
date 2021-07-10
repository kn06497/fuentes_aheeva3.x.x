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
	
	
	String grpDetId = request.getParameter("grpDetId");
	String labelCombo = request.getParameter("label");
	String grpName = request.getParameter("grpName");
	
	QuestionGroup questionGroup = new QuestionGroup(grpDetId);
	
	if (labelCombo==null) {labelCombo = "";}
	
	
	String saveData = request.getParameter("saveData");
	
	if(saveData != null)
	{
		
		
		String checkComment  = (request.getParameter("commentCheck")==null)?"0":"1";
		String checkTotal    = (request.getParameter("totalCheck")==null)?"0":"1";
		String commentWidth  = (request.getParameter("colNumber")==null)?"":request.getParameter("colNumber");
		String commentHeight = (request.getParameter("rowNumber")==null)?"":request.getParameter("rowNumber");
		
		commentWidth = (commentWidth.compareTo("")==0)?null:commentWidth;
		commentHeight = (commentHeight.compareTo("")==0)?null:commentHeight;
		
		
		questionGroup.insertUpdate(checkComment,commentWidth,commentHeight,checkTotal,labelCombo);
		questionGroup = new QuestionGroup(grpDetId);
		
	}
	
	
	
	

	
%>


<html>
<head>
<title><%=pageData.getWord("Comments and score labels")%> </title>
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
function enableUpdateButton()
{	

	document.evaluation.updateInfo.disabled = false;
}

function validateInfo()
{
	
	document.evaluation.action = "questionGroupDetail.jsp?saveData=1&grpName="+"<%=grpName%>";
	document.evaluation.submit();
}

function validateCheckComboComment()
{
	if (document.evaluation.commentCheck.checked==true)
	{
		document.evaluation.rowNumber.disabled=false;
		document.evaluation.colNumber.disabled=false;
		document.evaluation.colNumber.className = "";
		document.evaluation.rowNumber.className = "";
		
	}
	else
	{
		document.evaluation.rowNumber.value="";
		document.evaluation.colNumber.value="";
		document.evaluation.rowNumber.disabled=true;
		document.evaluation.colNumber.disabled=true;
		document.evaluation.colNumber.className = "grayButton";
		document.evaluation.rowNumber.className = "grayButton";
	}
}

function validateCheckComboTotal()
{
	if (document.evaluation.totalCheck.checked==true)
	{
		document.evaluation.label.disabled=false;
		document.evaluation.label.className = "";
		
	}
	else
	{
		document.evaluation.label.value="";
		document.evaluation.label.disabled=true;
		document.evaluation.label.className = "grayButton";
	}
}


function validateNumber(obj)
{
	var val = IsInteger(obj.value);
	if (!val && obj.value != "")
	{
		alert("<%=pageData.getWord("Invalid number")%>");
		obj.focus();
		obj.value="";					
	}
}

</script>

<script for="window" event="onload">
validateCheckComboComment();
validateCheckComboTotal();
</script>

</head>

<body class="bottompagebody" >

<form name="evaluation" method="post">
<div class="dynamic-tab-pane-control">
    <div class="tab-page" id="general"> 
      <fieldset>
      <legend><%=grpName +" : "+ pageData.getWord("Comments and score labels")%></legend>
      	<table>
      		<tr>
	      		<td ><%=pageData.getWord("Add Comment")%></td>
	      		<td><input type="checkbox" name="commentCheck" <%=(questionGroup.getFcomment().compareTo("1")==0)?"checked":""%>  onclick="validateCheckComboComment();enableUpdateButton();"></td>
	      		<td><%=pageData.getWord("Rows Number")%></td>
	      		<td><input type="text" name="rowNumber" value="<%=questionGroup.getRowsnbr()%>" onBlur="validateNumber(this);enableUpdateButton();"></td>
	      		<td><%=pageData.getWord("Cols number")%></td>
	      		<td><input type="text" name="colNumber" value="<%=questionGroup.getColsnbr()%>" onBlur="validateNumber(this);enableUpdateButton();"></td>
     		</tr>
     		<tr>
     		<td height="10">
     		</td>
     		</tr>
			<tr>
				<td ><%=pageData.getWord("Display total")%></td>
				<td><input type="checkbox" name="totalCheck" <%=(questionGroup.getFtotal().compareTo("1")==0)?"checked":""%>  onclick="validateCheckComboTotal();enableUpdateButton();"></td>
	      		<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=pageData.getWord("Labels list")%></td>	
	      		<td >
	      			<select name="label" onChange="enableUpdateButton();">
	      				<option value="">
	      				<%
	      				String selected;
	      				for ( Label lab : questionGroup.getLabel())
	      				{
	      					if (questionGroup.getLabelDbid().compareTo(lab.getDbid())==0  )
	      					{selected="selected";}else{selected="";}
	      							
	      					%><option value="<%=lab.getDbid()%>" <%=selected %>><%=lab.getName()%></option> <%	
	      				}
	      				%>
	      			</select> 
	      		</td>	
	      				
			</tr>
	</table>
	
			
     </fieldset>
    </div>
    
</div>
<input type="hidden" name="grpDetId" value="<%=grpDetId%>">
<input type="hidden" name="labelId" value="<%=questionGroup.getLabelDbid()%>">
<input disabled name="updateInfo" type="button" value="<%=pageData.getWord("Save")%>" onClick="validateInfo()" id="save">
</form>
<script>

</script>

</body>
</html>

<% 
pageData.closeConnection();
%>
