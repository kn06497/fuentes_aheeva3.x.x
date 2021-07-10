<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "Manager.ressources.*" %>
<%
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
	String tenantName = request.getParameter("tName");
	String tenantDbid = request.getParameter("dbid");

	String userAssignedTenants = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='TENANT' AND RESSOURCE_DBID='"+tenantDbid+"')";
	String listAllowedUsersQuery = "SELECT U.DBID AS USER_DBID, USERNAME FROM cfg_user_authorize_ressources, cfg_user U "+
		"WHERE RESSOURCE_TYPE='TENANT' AND U.DBID = USER_DBID AND RESSOURCE_DBID='"+tenantDbid+"' ORDER BY USERNAME";
	String listNotAllowedUsersQuery = "SELECT DBID AS USER_DBID, USERNAME FROM cfg_user WHERE state='1' "+
		"AND DBID NOT IN "+userAssignedTenants+" ORDER BY USERNAME";
	String userRightsQuery = "SELECT USERNAME, ALLOW_USER_MANAGEMENT, ALLOW_TENANT_MANAGEMENT FROM cfg_user WHERE DBID='"+currentUserDbid+"'";

	pageData.openConnection();
	pageData.executeFromString(listAllowedUsersQuery);
	Vector <HashMap> listAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(listNotAllowedUsersQuery);
	Vector <HashMap> listNotAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(userRightsQuery);
	Vector <HashMap> userRightsDataResult = pageData.CreateVectorFromBean();
	pageData.closeConnection();

	String currentUserName = (String)userRightsDataResult.elementAt(0).get("USERNAME");
	boolean userManagementAllowed = pageData.userHasRight(userRightsDataResult, "ALLOW_USER_MANAGEMENT");
	boolean isNewResource = tenantDbid.compareTo("") == 0;
	if(!pageData.userHasRight(userRightsDataResult, "ALLOW_TENANT_MANAGEMENT"))
	{ %>
		<jsp:forward page="forbidden.htm"/>
<%	}
	Tenant tenantInfo = new Tenant(tenantDbid);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Add a new tenant</title>
<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="javascript" type="text/javascript">
var currentUserDbid = "<%=currentUserDbid%>";
var isNewResource = <%=isNewResource%>;
function validateInfo(tenantId)
{
	var tenantName = "";
	if(document.modifytenant.tenant_name)
		tenantName = document.modifytenant.tenant_name.value;
	else
		return;

	if(tenantName == "")
	{
		alert(MultiArray["Please enter tenant name"][lang])
		document.modifytenant.n_tname.focus();		
	}
	else if(validation(tenantName) == 0)
	{
		alert(MultiArray["Invalid use of character"][lang]);
		document.modifytenant.n_tname.focus();		
	}
	else
	{
		var already_use = false;
		var tenants 	= appletObj.getTenantInfo();
		var arrayTenants	= tenants .split("|");
		for(var h = 0; h < arrayTenants.length && !already_use; h++)
		{
			thisTenantInfos = arrayTenants[h].split(",");
			if(thisTenantInfos[0] != tenantId && thisTenantInfos[1] == tenantName)
			{
				alert(MultiArray["Tenant name"][lang]+" "+tenantName+" "+MultiArray["already exists. Please retry"][lang]);
				already_use = true;
			}
		}
		
		if(!already_use)
		{
			appletObj.saveTenant(tenantId, tenantName, getXmlAllowedUsers());
		}
	}
}

function askDelete(tenantDbid, tenantName)
{	
	var tenants 	= appletObj.getTenantInfo();
	var jsTenants	= tenants + "";
	arrayTenants	= jsTenants .split("|");
	if(arrayTenants.length==1)
	{
		thisTenantInfos = arrayTenants[0].split(",");
		alert("You cannot delete the last Tenant: "+thisTenantInfos[1]);
	}
	else
	{
		yesno = confirm(MultiArray["You are about to delete Tenant"][lang]+tenantName+MultiArray["Do you want to continue"][lang]);
		
		if(yesno) // sil desire vraiment deleter
		{
			appletObj.deleteTenant(tenantDbid);
		}
	}
	document.location = "../defaultpage.htm"
}

function getXmlAllowedUsers()
{
	var theForm = document.modifytenant;
	var allowed = "";
	if(theForm.allowedUsers)
	{
		allowed = "<AllowedUsers>";
		for(var i = 0; i < theForm.allowedUsers.length; i++)
			allowed += "<Dbid>" + theForm.allowedUsers.options[i].value + "</Dbid>";
		allowed += "</AllowedUsers>";
	}
	else if(isNewResource)
		allowed += "<AllowedUsers><Dbid>" + currentUserDbid + "</Dbid></AllowedUsers>";
	return allowed;
}
</script>
</head>

<body class="bottompagebody" TEXT="#000000" LINK="#000066" VLINK="#666666" >
<form name="modifytenant" method="get">
<table border="0">
	<tr>
		<td>&nbsp;</td>
		<td class="contentTitles"><%=isNewResource? pageData.getWord("Add new tenant") : pageData.getWord("Modify tenant name")%></td>
	</tr>
<% if(!isNewResource)
{ %>
	<tr>
		<td><strong><%=pageData.getWord("Tenant ID")%></strong></td>
		<td><input name="tenant_id" type="text" disabled value="<%=tenantInfo.getDbid()%>"></td>
	</tr>
<%
} %>
	<tr>
		<td><strong><%=pageData.getWord("Tenant name")%></strong></td>
		<td><input name="tenant_name" type="text" value="<%=tenantInfo.getName()%>"></td>
	</tr>
<%if(userManagementAllowed)
{%>
	<tr>
		<td colspan="2"><strong><%=pageData.getWord("Security")%></strong></td>
	</tr>
	<tr>
		<td colspan="2">
			<table>			
				<tr>
					<td><%=pageData.getWord("Not allowed users")%></td>
					<td>&nbsp;</td>
					<td><%=pageData.getWord("Allowed users")%></td>
				</tr>	
				<tr>
					<td align="center">
						<select id="notAllowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="notAllowedUsers" size="5" multiple="multiple">
						<%for(int i = 0; i < listNotAllowedUsersDataResult.size(); i++)
						{
							String userDbid = (String)listNotAllowedUsersDataResult.elementAt(i).get("USER_DBID");
							String userName = (String)listNotAllowedUsersDataResult.elementAt(i).get("USERNAME");
							if(userDbid.compareTo(currentUserDbid) != 0)
							{
						%>
							<option value="<%=userDbid%>"><%=userName%></option>
						<%	}
						} %>
						</select>
					</td>
					<td valign=middle>
						&nbsp;<img src="../img/left_to_right.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('notAllowedUsers', 'allowedUsers');enableUpdateButton()"/>&nbsp;<br>
						&nbsp;<img src="../img/right_to_left.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('allowedUsers', 'notAllowedUsers');enableUpdateButton()"/>&nbsp;
					</td>
					<td align="center">
						<select id="allowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="allowedUsers" size="5" multiple="multiple">
						<%for(int i = 0; i < listAllowedUsersDataResult.size(); i++)
						{
							String userDbid = (String)listAllowedUsersDataResult.elementAt(i).get("USER_DBID");
							String userName = (String)listAllowedUsersDataResult.elementAt(i).get("USERNAME");
						%>
							<option value="<%=userDbid%>"><%=userName%></option>
						<%}	
						if(isNewResource)
						{%>
							<option value="<%=currentUserDbid%>"><%=currentUserName%></option>
						<%}
						%>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
<%}
%>
	<tr>
		<td>&nbsp;</td>
		<td>
			<input name="save" type="button" value="<%=pageData.getWord("Save")%>" onClick="validateInfo('<%=tenantInfo.getDbid()%>')">
<% if(!isNewResource)
{ %>			
			&nbsp;&nbsp;
			<input name="delete" type="button" value="<%=pageData.getWord("Delete")%>" onClick="askDelete('<%=tenantInfo.getDbid()%>', '<%=tenantInfo.getName()%>')">
<% 
} %>
		</td>
	</tr>
</table>
</form>
</body>
</html>
