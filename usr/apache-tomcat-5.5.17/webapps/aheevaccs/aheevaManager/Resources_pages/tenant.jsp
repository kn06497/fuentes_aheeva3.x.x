<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "aheevaManager.ressources.*" %>
<%
	beanManagerData pageData = new beanManagerData();
	if(session.getAttribute("USER_LANGUAGE") != null)
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
	int tenantDbid = -1;
	try {
		tenantDbid = Integer.parseInt(request.getParameter("dbid"));
	}
	catch (java.lang.NumberFormatException nfe) {
	}

	boolean isNewResource = tenantDbid == -1;

	boolean validTenant = true, submitTenantInfo = false;
	String xmlAllowedUsers = "", tenantName = "", tenantId = "";

	String userAssignedTenants = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='TENANT' AND RESSOURCE_DBID='"+tenantDbid+"')";
	String listAllowedUsersQuery = "SELECT U.DBID AS USER_DBID, USERNAME FROM cfg_user_authorize_ressources, cfg_user U "+
		"WHERE RESSOURCE_TYPE='TENANT' AND U.DBID = USER_DBID AND RESSOURCE_DBID='"+tenantDbid+"' ORDER BY USERNAME";
	String listNotAllowedUsersQuery = "SELECT DBID AS USER_DBID, USERNAME FROM cfg_user WHERE state='1' "+
		"AND DBID NOT IN "+userAssignedTenants+" ORDER BY USERNAME";
	String userRightsQuery = "SELECT USERNAME, ALLOW_USER_MANAGEMENT, ALLOW_TENANT_MANAGEMENT FROM cfg_user WHERE DBID='"+currentUserDbid+"'";

	pageData.openConnection();
	Vector <HashMap> listAllowedUsersDataResult = pageData.executeFromStringToVector(listAllowedUsersQuery);
	Vector <HashMap> listNotAllowedUsersDataResult = pageData.executeFromStringToVector(listNotAllowedUsersQuery);
	Vector <HashMap> userRightsDataResult = pageData.executeFromStringToVector(userRightsQuery);
	String tenantSubmitted = request.getParameter("tenantSubmitted");
	if(tenantSubmitted != null)
	{
		if(tenantSubmitted.compareTo("1") == 0)
		{
			TenantCollection allTenants = new TenantCollection();
			submitTenantInfo = true;
			tenantName = request.getParameter("tenant_name");
			String originalName = request.getParameter("originalName") != null ? request.getParameter("originalName") : "";
			if(tenantName != null)
			{
				boolean nameAvailable = allTenants.checkTenantNameAvailable(tenantName);
				if(isNewResource)
					validTenant = nameAvailable;
				else if(originalName.compareTo(tenantName) != 0)
					validTenant = nameAvailable;
			}
			String[] allowedUsers = request.getParameterValues("allowedUsers");
			if(allowedUsers != null)
			{
				xmlAllowedUsers = "<AllowedUsers>";
				for(int i = 0; i < allowedUsers.length; i++)
				{
					xmlAllowedUsers += "<Dbid>" + allowedUsers[i] + "</Dbid>";
				}
				xmlAllowedUsers += "</AllowedUsers>";
			}
		}
	}


	String currentUserName = (String)userRightsDataResult.elementAt(0).get("USERNAME");
	boolean userManagementAllowed = pageData.userHasRight(userRightsDataResult, "ALLOW_USER_MANAGEMENT");
	if(!pageData.userHasRight(userRightsDataResult, "ALLOW_TENANT_MANAGEMENT"))
	{ %>
		<jsp:forward page="forbidden.jsp"/>
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

<!-- Start Tab pane -->
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<style type="text/css">
dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		auto;
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
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<!-- End Tab Pane -->


<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" type="text/javascript">
var currentUserDbid = "<%=currentUserDbid%>";
var isNewResource = <%=isNewResource%>;
var tenantValid = <%=validTenant%>;
var submitTenantInfo = <%=submitTenantInfo%>;
var xmlAllowedUsers = "<%=xmlAllowedUsers%>";
var tenantId = "<%=tenantDbid%>";
var tenantName = "<%=tenantName%>";

function validateInput()
{
	var valid = true;
	var tenantName = "";
	if(document.modifytenant.tenant_name)
		tenantName = document.modifytenant.tenant_name.value;

	if(tenantName == "")
	{
		alert("<%= pageData.getWord("Please enter tenant name")%>");
		valid = false;
	}
	else if(validation(tenantName) == 0)
	{
		alert("<%= pageData.getWord("Invalid use of character")%>");
		valid = false;
	}
	if(valid)
	{
		/* Select all allowed users so they are sent with the form */
		for(var i = 0; i < document.modifytenant.allowedUsers.length; i++)
		{
			document.modifytenant.allowedUsers.options[i].selected = true;
		}
	}
	return valid;
}

function saveTenantInfo()
{
	if(submitTenantInfo)
	{
		if(tenantValid)
		{
			if(isNewResource)
			{
				appletObj.saveTenant("", tenantName, xmlAllowedUsers);
			}
			else
			{
				appletObj.saveTenant(tenantId, tenantName, xmlAllowedUsers);
			}
			document.location = "../defaultpage.htm";
		}
		else
		{var oops=" <%= pageData.getWord("already exists. Please retry!")%>";
			alert("<%= pageData.getWord("Tenant name")%> "+tenantName+oops.replace('**','\n'));
		}
	}
}

function askDelete(tenantDbid, tenantName)
{	
	var tenants 	= appletObj.getTenantInfo();
	var jsTenants	= tenants + "";
	arrayTenants	= jsTenants.split("|");
	if(arrayTenants.length == 1)
	{
		thisTenantInfos = arrayTenants[0].split(",");
		alert("You cannot delete the last Tenant: "+thisTenantInfos[1]);
	}
	else
	{    var cont="<%= pageData.getWord("Do you want to continue?")%>";
		yesno = confirm("<%= pageData.getWord("You are about to delete Tenant")%>"+tenantName+cont.replace('**','\n'));
		
		if(yesno) // sil desire vraiment deleter
		{
			appletObj.deleteTenant(tenantDbid);
		}
	}
	document.location = "../defaultpage.htm"
}
</script>
</head>

<body class="ten_man_body" TEXT="#000000" LINK="#000066" VLINK="#666666" onLoad="saveTenantInfo()" >
	<div class="tab-pane" id="tabPane1" style="top:0px;">	
				<form name="modifytenant" method="get" action="<%=request.getRequestURI()%>" onSubmit="return validateInput()">
					<script type="text/javascript">
						tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
					</script>
					
				  <div class="tab-page" id="tabGeneral">
					<fieldset>
						<legend><%=isNewResource? pageData.getWord("Add new tenant") : pageData.getWord("Modify tenant name")%></legend>
						
						<table border="0">
							<tr>
								<td>&nbsp;</td>
								<td class="contentTitles"><% //=isNewResource? pageData.getWord("Add new tenant") : pageData.getWord("Modify tenant name")%></td>
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
							<tr><td colspan="2">&nbsp;</td></tr>
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
												&nbsp;<img src="../img/left_to_right.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('notAllowedUsers', 'allowedUsers');"/>&nbsp;<br>
												&nbsp;<img src="../img/right_to_left.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('allowedUsers', 'notAllowedUsers');"/>&nbsp;
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
						else {
							for(int i = 0; i < listAllowedUsersDataResult.size(); i++)
							{
							String userDbid = (String)listAllowedUsersDataResult.elementAt(i).get("USER_DBID");
							%>
							<input type="hidden" name="allowedUsers" value="<%=userDbid%>">
							<%}	
							if(isNewResource)
							{%>
							<input type="hidden" name="allowedUsers" value="<%=currentUserDbid%>">
							<%}
						}
						%>
							<tr>
								<td>&nbsp;</td>
								<td>
									<input id="save" name="save" type="submit" value="<%=pageData.getWord("Save")%>">
						<% if(!isNewResource)
						{ %>			
									&nbsp;&nbsp;
									<input name="delete" type="button" value="<%=pageData.getWord("Delete")%>" onClick="askDelete('<%=tenantInfo.getDbid()%>', '<%=tenantInfo.getName()%>')">
						<% 
						} %>
								</td>
							</tr>
						</table>
						
						<input type="hidden" name="dbid" value="<%=tenantInfo.getDbid()%>">
						<input type="hidden" name="tenantSubmitted" value="1">
						<input type="hidden" name="originalName" value="<%=tenantInfo.getName()%>">
						<input type="hidden" name="isNewResource" value="<%=isNewResource ? "1" : "0" %>">
			</fieldset>
		</div>
	</form>
  </div>
</body>
<% pageData.closeConnection(); %>
</html>
