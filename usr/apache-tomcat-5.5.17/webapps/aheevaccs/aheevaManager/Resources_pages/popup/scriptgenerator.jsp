<%@page import="aheevaManager.ressources.popbuilder.*"%>
<%
ScriptGenerator scriptGenerator=new ScriptGenerator();
out.print(scriptGenerator.getScript(request));
%>