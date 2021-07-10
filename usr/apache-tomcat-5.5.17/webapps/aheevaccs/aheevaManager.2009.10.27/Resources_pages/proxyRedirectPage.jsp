<%@page import ="aheevaManager.ressources.*"%>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "java.io.IOException" %>

<html>
<head>
	<title>Screen Capture desktop</title>
</head>
<body>
<% 

beanManagerData pageData = new beanManagerData();
boolean decodeHeader = true;

String query = "SELECT ipaddress FROM datamart_agent_sessions WHERE agent_id =" + request.getParameter("agentID")+" ORDER BY event_time DESC LIMIT 1";
//String query = "SELECT ipaddress FROM datamart_agent_sessions WHERE agent_id = 304  ORDER BY event_time DESC LIMIT 1";

String agentMachineIP ="";
pageData.openConnection();
ResultSet resultSet = pageData.executeFromString(query);
	while(resultSet.next()){
		agentMachineIP = resultSet.getString("ipaddress");
	}
	

String agentHost = request.getParameter("proxyHost");
String agentPort = request.getParameter("proxyPort");

%>

	<APPLET CODE= aheevaManager.vncViewerApplet.screencapviewer.class ARCHIVE=sVncViewerApplet.jar WIDTH=1024 HEIGHT=800>
		<param name=HOST value=<%=agentHost%> />
		<param name=PORT value=<%=agentPort%> />
		<param name=PASS value="atelka"/>
		<param name=agentMachineIP value=<%=agentMachineIP%> />
	</APPLET>
	
</body>
<% pageData.closeConnection(); %>
</html>