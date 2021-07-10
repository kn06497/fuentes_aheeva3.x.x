<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagequeryData = new beanManagerData();
pagequeryData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagequeryData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var query= new Array();

query[0]="<%= pagequeryData.getWord("Database query") %>";
query[1]="<%= pagequeryData.getWord("Entry point") %>";
query[2]="<%= pagequeryData.getWord("Next") %>";
query[3]="<%= pagequeryData.getWord("Error: Missing SQL query for database request #") %>";
query[4]="<%= pagequeryData.getWord("Error: Missing result name for database request #") %>";



</script>
<% pagequeryData.closeConnection(); %>