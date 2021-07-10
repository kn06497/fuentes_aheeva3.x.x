<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageSimdData = new beanManagerData();
pageSimdData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSimdData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var Simd= new Array();

Simd[0]="<%= pageSimdData.getWord("Please enter a starting date") %>";
Simd[1]="<%= pageSimdData.getWord("Please enter an ending date") %>";
Simd[2]="<%= pageSimdData.getWord("Your ending date cannnot be smaller than your starting date") %>";


</script>
<% pageSimdData.closeConnection(); %>