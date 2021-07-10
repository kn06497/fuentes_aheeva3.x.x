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
		%>
		<script>window.top.main.left.location.reload();</script>
		<%
	}
	
	if(saveString.equals("2"))
	{
		vAnswer.deleteAnswersList(answerDbid);
		answerDbid = "";
		%>
		<script>window.top.main.left.location.reload();</script>
		<%
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
</style>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="answerFunction.js"></script>
<script language="javascript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>

<script type="text/javascript" src="slider/js/range.js"></script>
<script type="text/javascript" src="slider/js/timer.js"></script>
<script type="text/javascript" src="slider/js/slider.js"></script>


<script language="javascript" type="text/javascript">
var tenant_dbid = "<%=tenantDbid%>";
var newAnswer = <%=newAnswer%>;
var answerDbid = "<%=answerDbid%>";
var ansDetNum = "<%=ansDetNum%>";
var lbl_rank  = "<%=pageData.getWord("Score")%>";
var lbl_desc  = "<%=pageData.getWord("Description")%>";
var lbl_name  = "<%=pageData.getWord("Name")%>";
var lbl_notnullrank  	= "<%=pageData.getWord("Score should not be empty")%>";
var lbl_notnulldesc  	= "<%=pageData.getWord("Description should not be empty")%>";
var lbl_notnullname  	= "<%=pageData.getWord("Name should not be empty")%>";
var lbl_invalidnumber	= "<%=pageData.getWord("Invalid number")%>";
var answer_alert = "<%=pageData.getWord("Are you sure you wish to delete this answer?")%>";
var answer_list_alert = "<%=pageData.getWord("Are you sure you wish to delete this answers list?")%>";
var answer_style_check  	= "<%=pageData.getWord("The Minimum should be less then Maximum")%>";
var lbl_stylenull  	= "<%=pageData.getWord("Type should not be empty")%>";
var lbl_active = "<%=pageData.getWord("The list is used in an active form")%>";
var lbl_ansunique = "<%=pageData.getWord("Another answers list with the same name exists")%>";
var check= "<%=vAnswer.getStatus()%>";
</script>

<script for="window" event="onload">
	document.formul.fieldType.value="<%=vAnswer.getStyleValue()%>";
	enableDisableMinMax();
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

</head>
<body class="bottompagebody">
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
			<td>
				<input type="text" name="answerName" size="27"	value="<%=vAnswer.getName()%>"  onChange="enableUpdateButton()">
			</td>
		</tr>
		<tr>
			<td><%=pageData.getWord("Description")%></td>
			<td>
				<input type="text" name="answerDesc" size="27" value="<%=vAnswer.getDescription()%>"  onChange="enableUpdateButton()">
			</td>
		</tr>

		
		<tr>
			<td><%=pageData.getWord("Type")%></td>
			<td>
				<%=vAnswer.getStyle()%>
			</td>
		</tr>
		<tr>
			<td><%=pageData.getWord("Minimum")%></td>
			<td>
				<input type="text" name="minScore" size="27" value="<%=vAnswer.getMinScore()%>"  onChange="enableUpdateButton()">
			</td>
		</tr>
		<tr>
			<td><%=pageData.getWord("Maximum")%></td>
			<td>
				<input type="text" name="maxScore" size="27" value="<%=vAnswer.getMaxScore()%>"  onChange="enableUpdateButton()">
			</td>
		</tr>

		<tr>
			<td align="left">
				<%=pageData.getWord("Active")%>
			</td>
			<td align="left">
			<input type="checkbox" name="state" onClick="enableUpdateButton()" <%=((vAnswer.getState()).compareTo("1")==0)?"checked":""%> value="1">
			</td>
		</tr>
	</table>
	</fieldset>
</div>

<div class="tab-page" id="tabAnswerDetail">
	<h2 class="tab"><%=pageData.getWord("Answer details")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabAnswerDetail" ) );</script>
	<fieldset>
		<legend><%=pageData.getWord("Answer details information")%></legend>
		<table>
		<tr>
			<td>
				<table border="0" id="answerDetailId">
					<%=answerDetailHTML%>			
				</table>
			</td>
		</tr>
		<tr>
			<table>
				<tr onclick='addAnswerDetail()'>
					<td><%=pageData.getWord("Add answer")%></td>
					<td><img src='../img/add.gif'></td>
				</tr>
			</table>
		</tr>
	</table>
	</fieldset>
</div>


<input disabled name="updateInfo" type="button" value="<%=pageData.getWord("Save")%>" onClick="validateInfo()" id="save">
<input name="deleteAnsDet" type="button" value="<%=pageData.getWord("Delete")%>" onClick="askDelete()" <%=newAnswer ? "disabled" : ""%>>
</form>
</div>
</body>
</html>
<script>
tp = tp1.pages[1];
tp.disable();
tp.enable();
</script>
<%
pageData.closeConnection();
%>