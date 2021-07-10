<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageswitchData = new beanManagerData();
pageswitchData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageswitchData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var swtch= new Array();
swtch[0]="<%= pageswitchData.getWord("Switch") %>";
swtch[1]="<%= pageswitchData.getWord("Entry point") %>";
swtch[2]="<%= pageswitchData.getWord("Default") %>";
swtch[3]="<%= pageswitchData.getWord("Error: Missing possible values for switch #") %>";




</script>
<% pageswitchData.closeConnection(); %>