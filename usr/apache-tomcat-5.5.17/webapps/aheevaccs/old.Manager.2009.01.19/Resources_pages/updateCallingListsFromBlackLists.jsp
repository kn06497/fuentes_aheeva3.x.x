<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="Manager.ressources.*"%>

<%
	beanUpdateCallingListsFromBlacklists pageData = new beanUpdateCallingListsFromBlacklists();
	String callingListNames = request.getParameter("callingListNames");
	String group_list = request.getParameter("group_list");
	pageData.openConnection();
	pageData.updateCallingLists(callingListNames, group_list);
	pageData.closeConnection();
%>



