<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageBlaklata = new beanManagerData();
pageBlaklata.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageBlaklata.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var Blakl= new Array();

Blakl[0]="<%= pageBlaklata.getWord("The number must be numeric") %>";
Blakl[1]="<%= pageBlaklata.getWord("This number cannot be reached for these campaigns") %>";
Blakl[2]="<%= pageBlaklata.getWord("This number is not assigned to any campaign") %>";


</script>
<% pageBlaklata.closeConnection(); %>