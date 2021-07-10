<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagesetdData = new beanManagerData();
pagesetdData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagesetdData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var setd= new Array();
setd[0]="<%= pagesetdData.getWord("Set Attached Data") %>";
setd[1]="<%= pagesetdData.getWord("Entry point") %>";
setd[2]="<%= pagesetdData.getWord("Next") %>";
setd[3]="<%= pagesetdData.getWord("Error: Missing module name for custom server #") %>";
setd[4]="<%= pagesetdData.getWord("Error: Missing function name for custom server #") %>";

</script>
<% pagesetdData.closeConnection(); %>