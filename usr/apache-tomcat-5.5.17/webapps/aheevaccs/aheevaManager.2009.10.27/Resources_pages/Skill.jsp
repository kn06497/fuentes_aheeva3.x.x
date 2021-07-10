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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<title>Add skill</title>
<script language="JavaScript" src="jsUtil.js"> </script>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
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
		errorMsg += "-' + MultiArray['Please enter skill name'][lang] + '\\n";
	}else if(!validName){
		success = false;
		errorMsg += "-' + MultiArray['Skill'][lang] + ' ' + MultiArray['already exists'][lang] + '\\n";
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
		alert(MultiArray["Please enter skill name"][lang]);
		document.skillForm.skillName.focus();
		return false;
	}
	if(validation(document.skillForm.skillName.value)==0){
		alert(MultiArray["Invalid use of character"][lang]);
		document.skillForm.skillName.focus();
		return false;
	}
	return true;
}

function askDelete(){
	var yesno = confirm(MultiArray["You are about to delete this skill.\nDo you want to continue ?"][lang]);
	if(yesno){
		appletObj.deleteSkill(<%= skillId %>);
		document.location.href = "../defaultpage.htm";
		}
}

</script>
</head>
<base target="rbottom">


<body class="bottompagebody" TEXT="#000000" LINK="#000066" VLINK="#666666" >
<form name="skillForm" method="post" onsubmit="return validateInfo();">
		<table border="0">
		<tr>
			<td></td>
			<% if(update){ %>
				<td><b><script>document.write(MultiArray["Modify skill name"][lang])</script></b></td>
			<% }else{ %>
				<td><b><script>document.write(MultiArray["Add new skill"][lang])</script></b></td>
			<% } %>
		</tr>
		<% if(update){ %>
			<tr>
				<td><script>document.write(MultiArray["Skill ID"][lang]);</script></td>
				<td><input type='text' name='skill_id' value='<%= skillId %>' disabled='disabled'/></td>
			</tr>
		<% } %>
		  <tr>
			<td><script>document.write(MultiArray["Name"][lang])</script></td>
			<td><input name="skillName" type="text" value="<%= skillName %>"></td>
		  </tr>
		  <tr>
		  	<td colspan='2' align='center'>
		  <% if(update){ %>
		  		<script>
		  		document.write("<input type='submit' value='" + MultiArray["Update"][lang] + "'/>");
		  		</script>
		  		 
		  		<script>
				document.write("<input type='button' value='" + MultiArray["Delete"][lang] + "' onClick='askDelete();'/>");
				</script>
		  <% }else{ %>
		  		<script>document.write("<input type='submit' value='" + MultiArray["Submit"][lang] + "'");</script>			
		  <% } %>
			</td>
		</tr>
		</table>
		<input type="hidden" name="tenant_dbid" value="<%= tenantDBID %>" />
		</form>
</body>
</html>

<% pageData.closeConnection(); %>