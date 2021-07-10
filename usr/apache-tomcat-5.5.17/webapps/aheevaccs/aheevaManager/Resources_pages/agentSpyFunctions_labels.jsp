<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageSpyFData = new beanManagerData();
pageSpyFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSpyFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var Spy= new Array();

Spy[0]="<%= pageSpyFData.getWord("You are already spying agent #") %>";
Spy[1]="<%= pageSpyFData.getWord("Unable to find agent switch!") %>";
Spy[2]="<%= pageSpyFData.getWord("Error: Unable to get call and hangup!") %>";
Spy[3]="<%= pageSpyFData.getWord("Error: Unable to remove call ") %>";

</script>
<% pageSpyFData.closeConnection(); %>