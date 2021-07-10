<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageconxData = new beanManagerData();
pageconxData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageconxData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var conx= new Array();
conx[0]="<%= pageconxData.getWord("Select the entry point of the link") %>";
conx[1]="<%= pageconxData.getWord("Select link start point") %>";
conx[2]="<%= pageconxData.getWord("Select an arrow by double-clicking on it before") %>";







</script>
<% pageconxData.closeConnection(); %>