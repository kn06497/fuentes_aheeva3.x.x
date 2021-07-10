<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="style.css" rel="stylesheet" type="text/css" />
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
</style>
<title>AheevaCCS - StarPhone Settings</title>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript">

function validateIP(IP)
{
	var ipParts = IP.split(".");
	
	if(ipParts.length != 4 || IP.length > 15)
	{
		alert("<%= pageData.getWord("The IP adress should be like: 192.168.100.100")%>");
		return false;
	}
	else
	{
		for(j = 0; j < 4; j++)
		{
			if(!IsNumeric(ipParts[j]) || ipParts[j].length > 3)
			{
				alert("<%= pageData.getWord("The IP adress should be like: 192.168.100.100")%>");
				return false;
				break;
			}
		}		
	}
	return true;
}

function validateInfo()
{
	valid = true;
	
	if(document.fstarphone_settings.update_enabled.checked)
		update_enabled = "1";
	else
		update_enabled = "0";
	
	if(!validateIP(document.fstarphone_settings.url.value))
	{		
		document.fstarphone_settings.url.focus();
		return false;
	}
	if(!validateIP(document.fstarphone_settings.ext_url.value))
	{
		document.fstarphone_settings.ext_url.focus();
		return false;
	}
	
	if(document.fstarphone_settings.port.value == "" || !IsNumeric(document.fstarphone_settings.port.value)) 
	{
		alert("<%= pageData.getWord("The internal port should be numeric")%>");		
		return false;
	}
	if(document.fstarphone_settings.ext_port.value == "" || !IsNumeric(document.fstarphone_settings.ext_port.value)) 
	{
		alert("<%= pageData.getWord("The external port should be numeric")%>");
		return false;
	}
	
	if(validation(document.fstarphone_settings.port.value)==0)
	{
		alert("<%= pageData.getWord("Invalid use of character")%>");
		return false;
	}
	else if(document.fstarphone_settings.SiteSelection.value.length == 0)
	{
		alert("<%= pageData.getWord("You must select a site.")%>");	
		valid = false;
	}
	else if(validation(document.fstarphone_settings.path.value)==0)
	{
		alert("<%= pageData.getWord("Invalid use of character")%>");
		valid = false;
	}
	else if(validation(document.fstarphone_settings.url.value)==0)
	{
		alert("<%= pageData.getWord("Invalid use of character")%>");
		valid = false;
	}
	else if(validation(document.fstarphone_settings.ext_url.value) == 0)
	{
		alert("<%= pageData.getWord("Invalid use of character")%>");
		valid = false;
	}
	else if(validation(document.fstarphone_settings.ext_port.value) == 0)
	{
		alert("<%= pageData.getWord("Invalid use of character")%>");
		valid = false;
	}
		
	// --- if the form is valid
	if(valid)
	{ 		
		appletObj.saveStarPhoneAutoUpdateSettings(update_enabled, document.fstarphone_settings.url.value, 
				document.fstarphone_settings.port.value, document.fstarphone_settings.path.value,
				document.fstarphone_settings.ext_url.value, document.fstarphone_settings.ext_port.value,
				document.fstarphone_settings.SiteSelection.value);
		
		document.fstarphone_settings.updateInfo.disabled = true;
	}
}

function setValues() 
{
	var values = String( appletObj.getStarPhoneAutoUpdateSettings() );
	loadSitesCombo();
	var valuesArray = values.split("^");
	for(i = 0; i < valuesArray.length; i++)
	{
		if(i == 0)
		{
			if(valuesArray[i] == "1")
				document.fstarphone_settings.update_enabled.checked = true;
			else
				document.fstarphone_settings.update_enabled.checked = false;
		}
		else if(i == 1)
		{	
			if(valuesArray[i] != "NULL")
			{
				document.fstarphone_settings.url.value = valuesArray[i];
			}
		}
		else if(i == 2)
		{
			if(valuesArray[i] != "NULL")
			{
				document.fstarphone_settings.port.value = valuesArray[i];
			}
		}
		else if(i == 3)
		{
			if(valuesArray[i] != "NULL")
			{
				document.fstarphone_settings.path.value = valuesArray[i];
			}
		}
		else if(i == 4)
		{
			if(valuesArray[i] != "NULL")
			{
				document.fstarphone_settings.ext_url.value = valuesArray[i];
			}
		}
		else if(i == 5)
		{
			if(valuesArray[i] != "NULL")
			{
				document.fstarphone_settings.ext_port.value = valuesArray[i];
			}
		}
		else if(i == 6)
			selectObject(document.fstarphone_settings.SiteSelection, valuesArray[i]);
	}
}
	
function enableUpdateButton()
{
	document.fstarphone_settings.updateInfo.disabled = false;
}

function loadSitesCombo()
{
	//Getting the list of sites from ComApplet
	var allSites = String(appletObj.getAllSites());
	
	//Creating an empty option
	myOption = new Option("", "");
	document.fstarphone_settings.SiteSelection.options[0] = myOption;

	//Parsing the received string   DBID^SiteName|DBID^SiteName|...
	var jsSites = allSites  + "";
	arraySites = jsSites.split("|");
	for (j = 0; j <arraySites.length; j++)
	{
		arrSiteInfo = arraySites[j].split("^");
		for (p = 0; p < arrSiteInfo.length; p++)
		{
			if(p == 0)
				site_dbid = arrSiteInfo[p];
			else if(p == 1)
				site_name = arrSiteInfo[p];
		}
		if(site_dbid.length > 0 && site_name.length > 0)		//If not all infos was sent, we don't add it in the list
		{
			myOption = new Option(site_name, site_dbid);
			optionPos = document.fstarphone_settings.SiteSelection.options.length;
			document.fstarphone_settings.SiteSelection.options[optionPos]=myOption;
		}
	}
}
</script>

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

<body class="a_phone_body" onLoad="setValues()">
<div class="tab-pane" id="tabPane1">
<form name="fstarphone_settings" method="get" onKeyDown="KeyDownHandler(save)">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
	<div class="tab-page" id="tabPage1">
	<h2 class="tab"><%= pageData.getWord("Auto update")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );</script>
	<fieldset>
	<legend><%= pageData.getWord("Modify Auto update Settings")%></legend>
	<table border="0">
		<tr>
			<td><%= pageData.getWord("Enable Auto update")%></td>
			<td>
				<input name="n_dbid" disabled  type="hidden">
				<input name="update_enabled" type="checkbox" value="ON" onClick="enableUpdateButton()">
			</td>
		</tr>
		<tr>
			<td><%= pageData.getWord("Internal IP")%></td>
			<td><input name="url" type="text" value="" onChange="enableUpdateButton()"></td>
			
		</tr>
		<tr>
			<td><%= pageData.getWord("Internal port:")%></td>
			<td><input name="port" type="text" value="" onChange="enableUpdateButton()" size="5"></td>
		</tr>
		<tr>
			<td><%= pageData.getWord("External IP")%></td>
			<td><input name="ext_url" type="text" value="" onChange="enableUpdateButton()"></td>
		</tr>
		<tr>
			<td><%= pageData.getWord("External port:")%></td>
			<td><input name="ext_port" type="text" value="" onChange="enableUpdateButton()" size="5"></td>
		</tr>
		<tr>
			<td><%= pageData.getWord("Path (relative to WEB ROOT)")%></td>
			<td><input name="path" type="text" value="" onChange="enableUpdateButton()" size="30"></td>
		</tr>
		<tr>
			<td><%= pageData.getWord("Site")%></td>
			<td><select size="1" name="SiteSelection" onChange="enableUpdateButton()"></select></td>
		</tr>
		<tr>
			<td></td>
			<td>
			<input disabled id="save" name="updateInfo" type="button" value='<%= pageData.getWord("Update")%>' onClick="validateInfo()">
		</tr>
	</table>
	</fieldset>
	</div>
</form>
</div>
</body>
<% pageData.closeConnection(); %>
</html>
