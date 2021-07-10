<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!-- Fixes the IE6 & IE7 "Press SPACEBAR or ENTER to activate and use this control" - must be at the beginning of the file-->
<script language="JScript" type="text/jscript" src="../activateActiveX_onload.js"></script>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<link href="style.css" type="text/css" rel="stylesheet">
<style type="text/css">

.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #999999;
   	font-weight: normal;
}

.style1 a {
	color: #999999;
	text-decoration: none;
}

.style1 a:link {
	color: #999999;
	text-decoration: none;
}

.style1 a:visited {
	color: #999999;
	text-decoration: none;
}

.style1 a:hover {
	color: #666666;
	text-decoration: none;
}


.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000099;
   	font-weight: bold;
}
.style3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #ff0000;
   	font-weight: bold;
}
</style>
<!--[if lt IE 7]>
<style type="text/css">

#wrapper {
	background-image: url(../img/intro_bg03.gif);
	background-repeat: no-repeat;
	background-position: right top;
	height:100%;
	width:100%;
	margin: 0;
	padding: 0;
	border: none;
	text-align: center;
}

</style>
<![endif]-->
</head>

<body class="startback" SCROLL="NO">

<table border="0" cellpadding="0" cellspacing="0" id="wrapper">
    <tr>
        <td>
	
	    </td>
      </tr>
</table>

<!-- Fixes the IE6 & IE7 "Press SPACEBAR or ENTER to activate and use this control" - must be at the end of the file-->
<script language="JScript" type="text/jscript" src="../activateActiveX.js"></script>
</body>
</html>
<% pageData.closeConnection(); %>