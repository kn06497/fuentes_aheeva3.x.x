<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "aheevaManager.ressources.*" %>
<%
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

%>

<html>
<head>

<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<title>Add skill</title>
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
/*	height:		200px;*/
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {
	/*background:	ThreeDFace;*/
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
</style>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" src="jsUtil.js"> </script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript">

var user_tenant_id = normalizeString(QueryString('tenant_dbid'));
<%
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
		%>
		alert('<%= errorMsg %>');
		<%
	}else{
		if(update){ %>
			appletObj.modifySkill("<%= skillId %>", "<%= skillName %>");	
		<% } else { %>
			appletObj.addSkill("<%= skillName %>", user_tenant_id);
		<% } %>
		
		document.location.href = "../defaultpage.htm";
		<%
	}
}

%>	



function validateInfo(){
	if(document.skillForm.skillName.value == ""){
		alert("<%=pageData.getWord("Please enter skill name")%>");
		document.skillForm.skillName.focus();
		return false;
	}
	if(validation(document.skillForm.skillName.value)==0){
		alert("<%=pageData.getWord("Invalid use of character")%>");
		document.skillForm.skillName.focus();
		return false;
	}
	return true;
}

function askDelete(){
var oops="<%=pageData.getWord("You are about to delete this skill.**Do you want to continue?")%>";
	var yesno = confirm(oops.replace("**","\n"));
	if(yesno){
		appletObj.deleteSkill(<%= skillId %>);
		document.location.href = "../defaultpage.htm";
		}
}


</script>
</head>
<base target="rbottom">


<body class="skill_body">
<div class="tab-pane" id="tabPane1">
<form name="skillForm" method="post" onsubmit="return validateInfo();">
<script type="text/javascript">
		tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabGeneral">

		<fieldset>
		<legend id="caption">
		<% if(update){ %>
				<%=pageData.getWord("Modify skill name")%>
			<% }else{ %>
				<%=pageData.getWord("Add new skill")%>
			<% } %>
		</legend>
		<table border="0" style="margin-top:20px;">
		<% if(update){ %>
			<tr>
				<td width="50" style="padding-right:5px;"><%=pageData.getWord("Skill ID")%></td>
				<td align="left"><input type='text' name='skill_id' value='<%= skillId %>' disabled='disabled'/></td>
			</tr>
		<% } %>
		  <tr>
			<td width="50" style="padding-right:5px;"><%=pageData.getWord("Name")%></td>
			<td align="left"><input name="skillName" type="text" value="<%= skillName %>"></td>
		  </tr>
		  <tr>
		  	<td colspan='2' align='left' style="padding-left:60px; padding-top:8px">
		  <% if(update){ %>
		  	
		  		<input type='submit' value='<%=pageData.getWord("Update")%>'/>
		 
		  		 
		  		<input type='button' value='<%=pageData.getWord("Delete")%>' onClick='askDelete();'/>
			
		  <% }else{ %>
		  		<input type='submit' value='<%=pageData.getWord("Submit")%>'/>	
		  <% } %>
			</td>
		</tr>
		</table>
		</fieldset>
		</div>
		<input type="hidden" name="tenant_dbid" value="<%= tenantDBID %>" />
		</form>
</div>
</body>
</html>

<% pageData.closeConnection(); %>
