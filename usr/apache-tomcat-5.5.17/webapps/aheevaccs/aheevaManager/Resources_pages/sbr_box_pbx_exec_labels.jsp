<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagepbxData = new beanManagerData();
pagepbxData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagepbxData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var pbx= new Array();
pbx[0]="<%= pagepbxData.getWord("Execution") %>";
pbx[1]="<%= pagepbxData.getWord("Entry point") %>";
pbx[2]="<%= pagepbxData.getWord("Output") %>";
pbx[3]="<%= pagepbxData.getWord("Error: Missing applications for Execution #") %>";





</script>
<% pagepbxData.closeConnection(); %>