<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageGlobFData = new beanManagerData();
pageGlobFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageGlobFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var glob= new Array();
glob[0]="<%=pageGlobFData.getWord("Data has been changed in") %>";
glob[1]="<%=pageGlobFData.getWord("Do you want to reload information?") %>";
glob[2]="<%=pageGlobFData.getWord("yes") %>";
glob[3]="<%=pageGlobFData.getWord("no") %>";
glob[4]="<%=pageGlobFData.getWord("Close") %>";
glob[5]="<%=pageGlobFData.getWord("Notice") %>";
glob[6]="<%=pageGlobFData.getWord("ALERT") %>";
glob[7]="<%=pageGlobFData.getWord("Couldn't get connection from") %>";
glob[8]="<%=pageGlobFData.getWord("WARNING") %>";
glob[9]="<%=pageGlobFData.getWord("Connection successfull to") %>";
glob[10]="<%=pageGlobFData.getWord("MESSAGE") %>";



</script>
<% pageGlobFData.closeConnection(); %>