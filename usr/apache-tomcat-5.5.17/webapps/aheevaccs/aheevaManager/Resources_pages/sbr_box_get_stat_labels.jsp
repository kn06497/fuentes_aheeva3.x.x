<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagestatData = new beanManagerData();
pagestatData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagestatData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var stat= new Array();
stat[0]="<%= pagestatData.getWord("Get statistic") %>";
stat[1]="<%= pagestatData.getWord("Entry point") %>";
stat[2]="<%= pagestatData.getWord("Next") %>";
stat[3]="<%= pagestatData.getWord("Error: Missing statistic type for get statistic box #") %>";
stat[4]="<%= pagestatData.getWord("Error: Missing statistic data for get statistic box #") %>";
stat[5]="<%= pagestatData.getWord("Error: Missing statistic variable name for get statistic box #") %>";
stat[6]="<%= pagestatData.getWord("Agent Groups") %>";
stat[7]="<%= pagestatData.getWord("Queue name") %>";
stat[8]="<%= pagestatData.getWord("Agent properties") %>";
</script>
<% pagestatData.closeConnection(); %>