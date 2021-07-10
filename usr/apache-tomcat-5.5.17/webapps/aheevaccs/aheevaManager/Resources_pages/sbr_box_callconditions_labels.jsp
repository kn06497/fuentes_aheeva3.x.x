<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageCalcData = new beanManagerData();
pageCalcData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCalcData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var Calc= new Array();
Calc[0]="<%=pageCalcData.getWord("Entry point") %>";
Calc[1]="<%=pageCalcData.getWord("On success") %>";
Calc[2]="<%=pageCalcData.getWord("On failed") %>";
Calc[3]="<%=pageCalcData.getWord("Error: Missing test for call test condition #") %>";
Calc[4]="<%=pageCalcData.getWord("Error: Missing link type for call test condition #") %>";
Calc[5]="<%=pageCalcData.getWord("Error: Missing OnSuccess action for call test condition #") %>";








</script>
<% pageCalcData.closeConnection(); %>