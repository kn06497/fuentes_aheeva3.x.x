package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import aheevaManager.ressources.*;

public final class tenant_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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
	{ 
      out.write("\r\n");
      out.write("\t\t");
      if (true) {
        _jspx_page_context.forward("forbidden.jsp");
        return;
      }
      out.write('\n');
	}
	Tenant tenantInfo = new Tenant(tenantDbid);

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n");
      out.write("\"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<title>Add a new tenant</title>\r\n");
      out.write("\r\n");
      out.write("<!-- Start Tab pane -->\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<link type=\"text/css\" rel=\"StyleSheet\" href=\"slider/css/luna.css\" />\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write("html, body {\r\n");
      out.write("\t/*background:\tThreeDFace;*/\r\n");
      out.write("}\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("}\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write("body {\r\n");
      out.write("\tmargin:\t\t10px;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control h2 {\r\n");
      out.write("\ttext-align:\tcenter;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control h2 a {\r\n");
      out.write("\tdisplay:\tinline;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control a:hover {\r\n");
      out.write("\tbackground: transparent;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/tabpane.js\"></script>\r\n");
      out.write("<!-- End Tab Pane -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"JavaScript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\">xcAutoHide=1000;</script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("var currentUserDbid = \"");
      out.print(currentUserDbid);
      out.write("\";\r\n");
      out.write("var isNewResource = ");
      out.print(isNewResource);
      out.write(";\r\n");
      out.write("var tenantValid = ");
      out.print(validTenant);
      out.write(";\r\n");
      out.write("var submitTenantInfo = ");
      out.print(submitTenantInfo);
      out.write(";\r\n");
      out.write("var xmlAllowedUsers = \"");
      out.print(xmlAllowedUsers);
      out.write("\";\r\n");
      out.write("var tenantId = \"");
      out.print(tenantDbid);
      out.write("\";\r\n");
      out.write("var tenantName = \"");
      out.print(tenantName);
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("function validateInput()\r\n");
      out.write("{\r\n");
      out.write("\tvar valid = true;\r\n");
      out.write("\tvar tenantName = \"\";\r\n");
      out.write("\tif(document.modifytenant.tenant_name)\r\n");
      out.write("\t\ttenantName = document.modifytenant.tenant_name.value;\r\n");
      out.write("\r\n");
      out.write("\tif(tenantName == \"\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pageData.getWord("Please enter tenant name"));
      out.write("\");\n");
      out.write("\t\tvalid = false;\r\n");
      out.write("\t}\r\n");
      out.write("\telse if(validation(tenantName) == 0)\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pageData.getWord("Invalid use of character"));
      out.write("\");\n");
      out.write("\t\tvalid = false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(valid)\r\n");
      out.write("\t{\r\n");
      out.write("\t\t/* Select all allowed users so they are sent with the form */\r\n");
      out.write("\t\tfor(var i = 0; i < document.modifytenant.allowedUsers.length; i++)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tdocument.modifytenant.allowedUsers.options[i].selected = true;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\treturn valid;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function saveTenantInfo()\r\n");
      out.write("{\r\n");
      out.write("\tif(submitTenantInfo)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(tenantValid)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(isNewResource)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tappletObj.saveTenant(\"\", tenantName, xmlAllowedUsers);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tappletObj.saveTenant(tenantId, tenantName, xmlAllowedUsers);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tdocument.location = \"../defaultpage.htm\";\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t{var oops=\" ");
      out.print( pageData.getWord("already exists. Please retry!"));
      out.write("\";\n");
      out.write("\t\t\talert(\"");
      out.print( pageData.getWord("Tenant name"));
      out.write(" \"+tenantName+oops.replace('**','\\n'));\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function askDelete(tenantDbid, tenantName)\r\n");
      out.write("{\t\r\n");
      out.write("\tvar tenants \t= appletObj.getTenantInfo();\r\n");
      out.write("\tvar jsTenants\t= tenants + \"\";\r\n");
      out.write("\tarrayTenants\t= jsTenants.split(\"|\");\r\n");
      out.write("\tif(arrayTenants.length == 1)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tthisTenantInfos = arrayTenants[0].split(\",\");\r\n");
      out.write("\t\talert(\"You cannot delete the last Tenant: \"+thisTenantInfos[1]);\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{    var cont=\"");
      out.print( pageData.getWord("Do you want to continue?"));
      out.write("\";\n");
      out.write("\t\tyesno = confirm(\"");
      out.print( pageData.getWord("You are about to delete Tenant"));
      out.write("\"+tenantName+cont.replace('**','\\n'));\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(yesno) // sil desire vraiment deleter\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tappletObj.deleteTenant(tenantDbid);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tdocument.location = \"../defaultpage.htm\"\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"ten_man_body\" TEXT=\"#000000\" LINK=\"#000066\" VLINK=\"#666666\" onLoad=\"saveTenantInfo()\" >\r\n");
      out.write("\t<div class=\"tab-pane\" id=\"tabPane1\" style=\"top:0px;\">\t\r\n");
      out.write("\t\t\t\t<form name=\"modifytenant\" method=\"get\" action=\"");
      out.print(request.getRequestURI());
      out.write("\" onSubmit=\"return validateInput()\">\r\n");
      out.write("\t\t\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\t\ttp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t  <div class=\"tab-page\" id=\"tabGeneral\">\r\n");
      out.write("\t\t\t\t\t<fieldset>\r\n");
      out.write("\t\t\t\t\t\t<legend>");
      out.print(isNewResource? pageData.getWord("Add new tenant") : pageData.getWord("Modify tenant name"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<table border=\"0\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"contentTitles\">");
 //=isNewResource? pageData.getWord("Add new tenant") : pageData.getWord("Modify tenant name")
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");
 if(!isNewResource)
						{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><strong>");
      out.print(pageData.getWord("Tenant ID"));
      out.write("</strong></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input name=\"tenant_id\" type=\"text\" disabled value=\"");
      out.print(tenantInfo.getDbid());
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");

						} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><strong>");
      out.print(pageData.getWord("Tenant name"));
      out.write("</strong></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input name=\"tenant_name\" type=\"text\" value=\"");
      out.print(tenantInfo.getName());
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");
if(userManagementAllowed)
						{
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr><td colspan=\"2\">&nbsp;</td></tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"2\"><strong>");
      out.print(pageData.getWord("Security"));
      out.write("</strong></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<table>\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>");
      out.print(pageData.getWord("Not allowed users"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>");
      out.print(pageData.getWord("Allowed users"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<select id=\"notAllowedUsers\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px\" name=\"notAllowedUsers\" size=\"5\" multiple=\"multiple\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
for(int i = 0; i < listNotAllowedUsersDataResult.size(); i++)
												{
													String userDbid = (String)listNotAllowedUsersDataResult.elementAt(i).get("USER_DBID");
													String userName = (String)listNotAllowedUsersDataResult.elementAt(i).get("USERNAME");
													if(userDbid.compareTo(currentUserDbid) != 0)
													{
												
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<option value=\"");
      out.print(userDbid);
      out.write('"');
      out.write('>');
      out.print(userName);
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
	}
												} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td valign=middle>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t&nbsp;<img src=\"../img/left_to_right.gif\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('notAllowedUsers', 'allowedUsers');\"/>&nbsp;<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t&nbsp;<img src=\"../img/right_to_left.gif\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('allowedUsers', 'notAllowedUsers');\"/>&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<select id=\"allowedUsers\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px\" name=\"allowedUsers\" size=\"5\" multiple=\"multiple\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
for(int i = 0; i < listAllowedUsersDataResult.size(); i++)
												{
													String userDbid = (String)listAllowedUsersDataResult.elementAt(i).get("USER_DBID");
													String userName = (String)listAllowedUsersDataResult.elementAt(i).get("USERNAME");
												
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<option value=\"");
      out.print(userDbid);
      out.write('"');
      out.write('>');
      out.print(userName);
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
}	
												if(isNewResource)
												{
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<option value=\"");
      out.print(currentUserDbid);
      out.write('"');
      out.write('>');
      out.print(currentUserName);
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
}
												
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");
}
						else {
							for(int i = 0; i < listAllowedUsersDataResult.size(); i++)
							{
							String userDbid = (String)listAllowedUsersDataResult.elementAt(i).get("USER_DBID");
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"allowedUsers\" value=\"");
      out.print(userDbid);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t");
}	
							if(isNewResource)
							{
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"allowedUsers\" value=\"");
      out.print(currentUserDbid);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t");
}
						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input id=\"save\" name=\"save\" type=\"submit\" value=\"");
      out.print(pageData.getWord("Save"));
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t");
 if(!isNewResource)
						{ 
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input name=\"delete\" type=\"button\" value=\"");
      out.print(pageData.getWord("Delete"));
      out.write("\" onClick=\"askDelete('");
      out.print(tenantInfo.getDbid());
      out.write("', '");
      out.print(tenantInfo.getName());
      out.write("')\">\r\n");
      out.write("\t\t\t\t\t\t");
 
						} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" name=\"dbid\" value=\"");
      out.print(tenantInfo.getDbid());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" name=\"tenantSubmitted\" value=\"1\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" name=\"originalName\" value=\"");
      out.print(tenantInfo.getName());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" name=\"isNewResource\" value=\"");
      out.print(isNewResource ? "1" : "0" );
      out.write("\">\r\n");
      out.write("\t\t\t</fieldset>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("  </div>\r\n");
      out.write("</body>\r\n");
 pageData.closeConnection(); 
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
