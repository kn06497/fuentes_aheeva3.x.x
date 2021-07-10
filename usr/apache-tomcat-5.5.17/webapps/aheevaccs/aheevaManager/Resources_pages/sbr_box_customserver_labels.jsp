<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagecustomData = new beanManagerData();
pagecustomData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagecustomData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var custom= new Array();
custom[0]="<%= pagecustomData.getWord("Custom server") %>";
custom[1]="<%= pagecustomData.getWord("Entry point") %>";
custom[2]="<%= pagecustomData.getWord("Next") %>";
custom[3]="<%= pagecustomData.getWord("Error: Missing module name for custom server #") %>";
custom[4]="<%= pagecustomData.getWord("Error: Missing function name for custom server #") %>";

</script>
<% pagecustomData.closeConnection(); %>