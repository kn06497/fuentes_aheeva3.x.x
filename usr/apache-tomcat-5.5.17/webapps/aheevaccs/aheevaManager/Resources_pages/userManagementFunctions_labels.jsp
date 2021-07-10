<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageUsrMaData = new beanManagerData();
pageUsrMaData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageUsrMaData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var UsrMa= new Array();

UsrMa[0]="<%= pageUsrMaData.getWord("Enter the same password") %>";
UsrMa[1]="<%= pageUsrMaData.getWord("Remove this role") %>";
UsrMa[2]="<%= pageUsrMaData.getWord("Save") %>";


</script>
<% pageUsrMaData.closeConnection(); %>