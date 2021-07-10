<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagedtmfData = new beanManagerData();
pagedtmfData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagedtmfData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var dtmf= new Array();
dtmf[0]="<%= pagedtmfData.getWord("Get") %>";
dtmf[1]="<%= pagedtmfData.getWord("Entry point") %>";
dtmf[2]="<%= pagedtmfData.getWord("Output") %>";
dtmf[3]="<%= pagedtmfData.getWord("Error: Missing variable name for GetDtmf #") %>";
dtmf[4]="<%= pagedtmfData.getWord("Error: Missing timeout value for GetDtmf #") %>";


</script>
<% pagedtmfData.closeConnection(); %>