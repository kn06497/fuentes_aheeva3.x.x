<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageDoMenuData = new beanManagerData();
pageDoMenuData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDoMenuData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var DoMenu= new Array();

DoMenu[0]="<%= pageDoMenuData.getWord("Log out") %>";
DoMenu[1]="<%= pageDoMenuData.getWord("On hold") %>";
DoMenu[2]="<%= pageDoMenuData.getWord("Information") %>";
DoMenu[3]="<%= pageDoMenuData.getWord("Monitoring") %>";
DoMenu[4]="<%= pageDoMenuData.getWord("Properties") %>";
DoMenu[5]="<%= pageDoMenuData.getWord("Change status") %>";
DoMenu[6]="<%= pageDoMenuData.getWord("Logged out") %>";
DoMenu[7]="<%= pageDoMenuData.getWord("Statistics") %>";


</script>
<% pageDoMenuData.closeConnection(); %>