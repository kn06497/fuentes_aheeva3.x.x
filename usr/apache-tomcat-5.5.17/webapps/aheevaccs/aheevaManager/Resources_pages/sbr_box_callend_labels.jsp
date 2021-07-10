<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagecallEndData = new beanManagerData();
pagecallEndData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagecallEndData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var callEnd= new Array();
callEnd[0]="<%= pagecallEndData.getWord("End") %>";
callEnd[1]="<%= pagecallEndData.getWord("Entry point") %>";
callEnd[2]="<%= pagecallEndData.getWord("Error: Missing variable name for call ending #") %>";








</script>
<% pagecallEndData.closeConnection(); %>