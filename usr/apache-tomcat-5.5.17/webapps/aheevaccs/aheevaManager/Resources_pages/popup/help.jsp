<%@page import ="aheevaManager.ressources.*,java.util.*"%>
<%
beanManagerData pageData = new beanManagerData();
pageData.openConnection();	
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
else 
	pageData.setDefaultLanguage("ENGLISH");
	
	String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<script>
 <%@ include file="include_help_labels.jsp"%>
</script>
<script language="javascript" type="text/javascript" src="popup.js"></script>
<script language="javascript" type="text/javascript" src="help.js"></script>
<script language="javascript" type="text/javascript" src="menu.js"></script>
<style type="text/css">
<!--
html, body {
	height: 100%;
	overflow:hidden;
}
body {
	height: 100%;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

-->
</style>
<LINK href="popup.css" rel="stylesheet" type="text/css" />
<title><%=pageData.getWord("Aheeva Form Builder")%> - <%=pageData.getWord("help-lc")%></title>
</head>
<body id="helpbody" style="padding-bottom:0px;" onResize="helpFit()" onload="addHelpContent('01')">
<div id="helpContainer" class="introContainer" >

	<div id="helpTitle" style="padding-left:5px; padding-top:5px; color:#DFE6EA;"><img src="../../img/popup/popup_icon1.gif" alt="Aheeva Form Builder" width="38" height="26" hspace="0" vspace="0" align="absmiddle" style="margin-right:10px;" /><%=pageData.getWord("Aheeva Form Builder")%> - <%=pageData.getWord("help topics")%>...</div>
	<div id="helpMenus" style="padding-left:80px; padding-top:5px;">
		<%=pageData.getWord("Select a topic")%>:<span style="padding-left:10px;"><select class="formfields" id="menuContent" name="contents" onchange="addHelpContent(this.value), blur()"><option class="formfields" value="01">1. <%=pageData.getWord("User Guide")%></option><option class="formfields" value="02">2. <%=pageData.getWord("Page Elements")%></option></select></span><span id="hSearch1" class="helpsearchback" style="position:absolute; margin-top:-3px;"><input class="formfields" id="helpSearchEntry" type="text" value="" onkeypress="pressEnter(event)" style="position:absolute" /><span id="hSearch2" onmouseover="helpMenuMouseOver(this)" onmouseout="helpMenuMouseOut(this)" onclick="searchInHelp()" class="helpsearchout" style="position:absolute;"><%=pageData.getWord("search-lc")%></span></span>
	</div> 
	
	<div id="helpMain" class="pUpInnerBorder" style="overflow-y:auto; padding-left:0px; cursor:default;">
		
	</div>
	
	<div id="btPreviou" class="helpprevious" style="position:absolute; visibility:hidden;" onclick="scrollToLast()"><%=pageData.getWord("back to previous")%></div>

	<div id="helpFooter" style="padding-left:5px;">
<!-- any footer content for help pages go here -->
	</div> 

</div>
<script>
helpFit();
</script>
</body>
</html>