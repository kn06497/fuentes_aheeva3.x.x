<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageAgntPData = new beanManagerData();
pageAgntPData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageAgntPData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var AgntP= new Array();
AgntP[0]="<%=pageAgntPData.getWord("Pick Up Method") %>";
AgntP[1]="<%=pageAgntPData.getWord("Entry point") %>";
AgntP[2]="<%=pageAgntPData.getWord("On timeout") %>";
AgntP[3]="<%=pageAgntPData.getWord("Error: Missing minimum required for agent pickup method #") %>";
AgntP[4]="<%=pageAgntPData.getWord("Error: Missing tiebreaker for agent pickup method #") %>";
AgntP[5]="<%=pageAgntPData.getWord("Error: Missing call priority for agent pickup method #") %>";
AgntP[6]="<%=pageAgntPData.getWord("Error: Missing virtual queue name for agent pickup method #") %>";
AgntP[7]="<%=pageAgntPData.getWord("Error:Virtual queue name for agent pickup method #") %>";
AgntP[8]="<%=pageAgntPData.getWord("cannot be the routing script name") %>";
AgntP[9]="<%=pageAgntPData.getWord("Error: Unexpected token in agent pickup method #") %>";
AgntP[10]="<%=pageAgntPData.getWord(" having clause.**Near: ") %>";
AgntP[11]="<%=pageAgntPData.getWord("Error: Too much open brackets in agent pickup method #") %>";
AgntP[12]="<%=pageAgntPData.getWord("** Char:") %>";







</script>
<% pageAgntPData.closeConnection(); %>