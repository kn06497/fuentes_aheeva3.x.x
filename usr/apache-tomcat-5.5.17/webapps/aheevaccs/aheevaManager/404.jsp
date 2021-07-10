<%@ page isErrorPage="true" %>
<!--
Unless this text is here, if your page is less than 513 bytes, Internet Explorer will display it's "Friendly HTTP Error Message",
and your custom error will never be displayed.  This text is just used as filler.
This is a useless buffer to fill the page to 513 bytes to avoid display of Friendly Error Pages in Internet Explorer
This is a useless buffer to fill the page to 513 bytes to avoid display of Friendly Error Pages in Internet Explorer
This is a useless buffer to fill the page to 513 bytes to avoid display of Friendly Error Pages in Internet Explorer
-->
<html>
<head>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData page404Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	page404Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    page404Data.openConnection();
%>
<style type="text/css">

td.text{
font-size:large;
}


</style>
</head>
<body bgcolor="#E1F4FF">
<script language="javascript" type="text/javascript" src="/aheevaccs/Manager/lang_browser.js"></script>
<script language="javascript">
if (lang == "" || lang == null) lang = "DEFAULT";
</script>

<table width="528" height="93" border="0" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" style="border: 1px solid rgb(136, 136, 136);">
  <tr> 
    <td height="21" colspan="3">&nbsp;</td>
  </tr>
  <tr> 
    <td width="56" height="24" valign=top><img src="/aheevaccs/Manager/img/Aheeva-logo_small.jpg" width="142" height="80"></td>
    <td width="435" class="text"><script>
	if (lang != "DEFAULT") document.write("<%= page404Data.getWord("Error note")%>");
	else document.write("We apologise for the inconvenience, but the page requested can not be displayed.");
	</script></td>
    <td width="1">&nbsp;</td>
  </tr>
</table>

</body>
<% page404Data.closeConnection(); %>
</html>