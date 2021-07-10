<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageVsProData = new beanManagerData();
pageVsProData .openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageVsProData .setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var VsPro= new Array();
VsPro[0]="<%=pageVsProData.getWord("Don't forget to select an override cause") %>";
VsPro[1]="<%=pageVsProData.getWord("Please enter a date for report") %>";
VsPro[2]="<%=pageVsProData.getWord("Please select a group") %>";
VsPro[3]="<%=pageVsProData.getWord("Please select an agent") %>";
VsPro[4]="<%=pageVsProData.getWord("Do you really want to close this day") %>";
VsPro[5]="<%=pageVsProData.getWord("Agent ID") %>";
VsPro[6]="<%=pageVsProData.getWord("Last name") %>";
VsPro[7]="<%=pageVsProData.getWord("Agent group") %>";
VsPro[8]="<%=pageVsProData.getWord("First name") %>";
VsPro[9]="<%=pageVsProData.getWord("Activity") %>";
VsPro[10]="<%=pageVsProData.getWord("Paid time") %>";
VsPro[11]="<%=pageVsProData.getWord("Comments") %>";
VsPro[12]="<%=pageVsProData.getWord("Delete") %>";
VsPro[13]="<%=pageVsProData.getWord("Select") %>";
VsPro[14]="<%=pageVsProData.getWord("You must select an activity for each row, please verify") %>";
VsPro[15]="<%=pageVsProData.getWord("You must enter a paid time for each row, and respect the format. Please verify !") %>";
VsPro[16]="<%=pageVsProData.getWord("Login time") %>";
VsPro[17]="<%=pageVsProData.getWord("Not paid NRR time") %>";
VsPro[18]="<%=pageVsProData.getWord("Extra paid NRR time") %>";
VsPro[19]="<%=pageVsProData.getWord("Total paid time") %>";
VsPro[20]="<%=pageVsProData.getWord("Select a date") %>";

</script>
<% pageVsProData.closeConnection(); %>