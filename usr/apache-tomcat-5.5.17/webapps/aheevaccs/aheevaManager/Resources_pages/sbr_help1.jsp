<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Aheeva SBR Help</title>
<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
</head>

<body class="bottompagebody" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table width="100%">
	<tr>
		<td width="10%"><img src="../img/help_faq.gif" width="20" height="20"></td>
		<td width="90%" class="sbrHelpTitle">
		 <%= pageData.getWord("Routing script documentation")%></td>
	</tr>
	<tr>
		<td width="10%">&nbsp;</td>
		<td width="90%">
			
			<a href="#Shortcuts"> <%= pageData.getWord("Shortcuts")%></a>
		</td>
	</tr>
	
	<tr>
		<td width="10%">&nbsp;</td>
		<td width="90%">
			<a name="Shortcuts"></a>
			<div class="sbrHelpSubTitle"><%= pageData.getWord("Shortcuts")%> <img src="../img/shortcut.gif" width="21" height="16"></div>
			<br>
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="25%" class="sbrHelpGrayBg"><em>Ctrl+S</em></td><td width="25%" class="sbrHelpGrayBg"><%= pageData.getWord("Save")%></td>
					<td width="25%"><em>Ctrl++</em></td><td width="25%"><%= pageData.getWord("Zoom in")%></td>					
				</tr>
				<tr>
					<td width="25%"><em>Ctrl+-</em></td><td width="25%"><%= pageData.getWord("Zoom out")%></td>
					<td width="25%" class="sbrHelpGrayBg"><em>Esc</em></td><td width="25%" class="sbrHelpGrayBg"><%= pageData.getWord("Reset zoom")%></td>					
				</tr>
				<tr>
					<td width="25%" class="sbrHelpGrayBg"><em>Ctrl+Shift+D</em></td><td width="25%" class="sbrHelpGrayBg"><%= pageData.getWord("Debug/NoDebug mode")%></td>
					<td width="25%"><em>Ctrl+Shift+E</em></td><td width="25%"><%= pageData.getWord("Erase diagram")%></td>					
				</tr>
				<tr>
					<td width="25%"><em>Ctrl+Shift+H</em></td><td width="25%"><%= pageData.getWord("Display this help")%></td>
					<td width="25%" class="sbrHelpGrayBg"><em>Ctrl+Shift+N</em></td><td width="25%" class="sbrHelpGrayBg"><%= pageData.getWord("New script")%>...</td>					
				</tr>
				<tr>
					<td width="25%" class="sbrHelpGrayBg"><em>Ctrl+Shift+O</em></td><td width="25%" class="sbrHelpGrayBg"><%= pageData.getWord("Open script")%>...</td>
					<td width="25%"><em>Ctrl+Shift+P</em></td><td width="25%"><%= pageData.getWord("Call properties dialog")%></td>					
				</tr>
				<tr>
					<td width="25%"><em>Ctrl+Shift+R</em></td><td width="25%"><%= pageData.getWord("Refresh diagram")%></td>
					<td width="25%" class="sbrHelpGrayBg"><em>Ctrl+Shift+S</em></td><td width="25%" class="sbrHelpGrayBg"><%= pageData.getWord("Save as")%>...</td>					
				</tr>
				<tr>
					<td width="25%" class="sbrHelpGrayBg"><em>Ctrl+Shift+V</em></td><td width="25%" class="sbrHelpGrayBg"><%= pageData.getWord("Validate whole diagram")%></td>
					<td width="25%"><em>Ctrl+Shift+X</em></td><td width="25%"><%= pageData.getWord("Exit editor")%></td>					
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
<% pageData.closeConnection();%>