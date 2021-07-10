<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageprioData = new beanManagerData();
pageprioData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageprioData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var prio= new Array();
prio[0]="<%= pageprioData.getWord("Priority") %>";
prio[1]="<%= pageprioData.getWord("Entry point") %>";
prio[2]="<%= pageprioData.getWord("Output") %>";
prio[3]="<%= pageprioData.getWord("Error: Missing increment for call increment #") %>";




</script>
<% pageprioData.closeConnection(); %>