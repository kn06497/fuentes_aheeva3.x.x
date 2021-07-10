<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagemenuData = new beanManagerData();
pagemenuData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagemenuData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var menu= new Array();

menu[0]="<%= pagemenuData.getWord("Script") %>";
menu[1]="<%= pagemenuData.getWord("Edit") %>";
menu[2]="<%= pagemenuData.getWord("Tools") %>";
menu[3]="<%= pagemenuData.getWord("Help") %>";
menu[4]="<%= pagemenuData.getWord("New script") %>";
menu[5]="<%= pagemenuData.getWord("Open") %>";
menu[6]="<%= pagemenuData.getWord("Save") %>";
menu[7]="<%= pagemenuData.getWord("Save as") %>";
menu[8]="<%= pagemenuData.getWord("Delete script") %>";
menu[9]="<%= pagemenuData.getWord("Script statistics") %>";
menu[10]="<%= pagemenuData.getWord("Exit") %>";
menu[11]="<%= pagemenuData.getWord("Clear diagram") %>";
menu[12]="<%= pagemenuData.getWord("Validate diagram") %>";
menu[13]="<%= pagemenuData.getWord("Call properties") %>";
menu[14]="<%= pagemenuData.getWord("Delete link") %>";
menu[15]="<%= pagemenuData.getWord("Zoom diagram") %>";
menu[16]="<%= pagemenuData.getWord("Unzoom diagram") %>";
menu[17]="<%= pagemenuData.getWord("Undo zooming") %>";
menu[18]="<%= pagemenuData.getWord("Statements") %>";
menu[19]="<%= pagemenuData.getWord("Actions") %>";
menu[20]="<%= pagemenuData.getWord("Statistics") %>";
menu[21]="<%= pagemenuData.getWord("User manual") %>";
menu[22]="<%= pagemenuData.getWord("Agent pickup method") %>";
menu[23]="<%= pagemenuData.getWord("Caller priority increment") %>";
menu[24]="<%= pagemenuData.getWord("Application execute") %>";
menu[25]="<%= pagemenuData.getWord("Get dtmf") %>";
menu[26]="<%= pagemenuData.getWord("Database query") %>";
menu[27]="<%= pagemenuData.getWord("Custom server") %>";
menu[28]="<%= pagemenuData.getWord("End call") %>";
menu[29]="<%= pagemenuData.getWord("If ... else ...") %>";
menu[30]="<%= pagemenuData.getWord("Switch... case...") %>";
menu[31]="<%= pagemenuData.getWord("Counter") %>";
menu[32]="<%= pagemenuData.getWord("Get statistic") %>";







</script>
<% pagemenuData.closeConnection(); %>