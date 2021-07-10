<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagecountrData = new beanManagerData();
pagecountrData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagecountrData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var countr= new Array();
countr[0]="<%= pagecountrData.getWord("Counter") %>";
countr[1]="<%= pagecountrData.getWord("Entry point") %>";
countr[2]="<%= pagecountrData.getWord("Output") %>";
countr[3]="<%= pagecountrData.getWord("Error: Missing counter name for counter #") %>";




</script>
<% pagecountrData.closeConnection(); %>