
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<title>Document sans nom</title>
</head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<body>
<%
	beanUpdateCallingListsFromBlacklists pageData = new beanUpdateCallingListsFromBlacklists();
	String callingListNames = request.getParameter("callingListNames");
	String group_list = request.getParameter("group_list");
	pageData.openConnection();
	pageData.updateCallingLists(callingListNames, group_list);
	pageData.closeConnection();
	pageData = null;
	out.write("bean !");
%>
</body>
</html>






