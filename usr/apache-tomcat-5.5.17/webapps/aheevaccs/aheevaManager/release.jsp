<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<%
	
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else	
		pageData.setDefaultLanguage("ENGLISH");	
	
	System.out.println("top.jsp "+session.getAttribute("USER_LANGUAGE"));
		
	
		
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	
	String userPrivilegesQuery 			= "select * from cfg_user where dbid='"+CURRENT_USER_DBID+"'";
	String userPreferencesQuery = "SELECT * FROM cfg_user_live_stats_preferences WHERE USER_DBID='"+CURRENT_USER_DBID+"'";
	

	
	
	
	pageData.openConnection();
	pageData.executeFromString(userPrivilegesQuery);
	Vector <HashMap> userPrivilegesDataResult = pageData.CreateVectorFromBean();	
	pageData.executeFromString(userPreferencesQuery);
	Vector <HashMap<String,String>> userPreferences = pageData.CreateVectorFromBean();
	
	
	
		
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>release number</title>
<link href="Resources_pages/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="lang_browser.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(img/release_bg.gif);
	background-position: left bottom;
	background-repeat: no-repeat;
}

   html, body, #wrapper2 {
      height:100%;
      margin: 0px;
      padding: 0px;
      border: none;
      text-align: left;
   }
-->
</style>
</head>

<body>
   <table border="0" cellpadding="0" cellspacing="0" id="wrapper2">
      <tr>
         <td align="left" valign="bottom">
		 <nobr>
		 	<div align="left" style="padding-left:0px">
				<span class="vers_name">Aheeva </span>
				<span class="vers_numb">
				
				<%=pageData.getWord("AHRelease")%>

				</span>
			</div>
			</nobr>
		 </td>
      </tr>
</table>
</body>
</html>
