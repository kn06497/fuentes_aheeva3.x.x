<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagetopsData = new beanManagerData();
pagetopsData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagetopsData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var tops= new Array();

tops[0]="<%= pagetopsData.getWord("Host [") %>";
tops[1]="<%= pagetopsData.getWord("Switch [") %>";
tops[2]="<%= pagetopsData.getWord("Phone [") %>";


</script>
<% pagetopsData.closeConnection(); %>