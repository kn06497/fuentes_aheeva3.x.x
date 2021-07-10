<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.net.*"%>
<head>
<script language="javascript" src="Resources_pages/globFuncs.js"></script>
<script language="javascript" src="Resources_pages/jsUtil.js"></script>
<script language="JavaScript" src="language.js"></script>

<script language="JavaScript">
var i;
var user = 0;
var lang = 0; 
</script>

</head>
<base target="contents">
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

<% 
String remoteIp = request.getRemoteAddr();
%>

<!-- Loading the Communication applet with the JSP plugin special tag -->
<jsp:plugin type="applet" archive="sManager.jar" code="aheevaManager.java.ComApplet.class" name="myApplet" height="0" width="0" jreversion="1.5">
	<jsp:params>
		<jsp:param name="debug" value="0"/>
		<jsp:param name="host" value="<%= (remoteIp.substring(0, 7).compareTo("192.168") == 0 ? "200.124.238.203" : "200.124.238.203)%>"/>
                <jsp:param name="port" value="<%= (remoteIp.substring(0, 7).compareTo("192.168") == 0 ? "8765" : "8765")%>"/>
                <jsp:param name="remoteConnection" value="<%= (remoteIp.substring(0, 7).compareTo("192.168") == 0 ? "false" : "true")%>"/>
<jsp:param name="initial_focus" value="false" />
	</jsp:params>
	<jsp:fallback>Your browser does not support Java Applets</jsp:fallback>
</jsp:plugin>

<div id="dropin" name="dropin" style="position:absolute;visibility:hidden; width:100%;left:0px;top:0px;background-color:#FFFFEB; font-family:verdana; font-size:11px;"></div>
</body>
</html>
