<%@page contentType="text/html"%>
<%@page language = "java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Login and Production time report</title>
</head>
<frameset rows="123,*" cols="*" frameborder="no">
  <frame src="agentLoginProduction_search.jsp?<%=request.getQueryString()%>" name="topFrame"scrolling="no" noresize>
  <frame src="agentLoginProduction_inside.jsp?<%=request.getQueryString()%>" name="mainFrame">
</frameset>
<noframes><body>
</body></noframes>
</html>
