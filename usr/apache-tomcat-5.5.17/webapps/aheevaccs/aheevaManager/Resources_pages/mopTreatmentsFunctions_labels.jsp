<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageMopTrFData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageMopTrFData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageMopTrFData.openConnection();
    %>


<script language="javascript" type="text/javascript">
var mopTreat= new Array();
mopTreat[0]="<%= pageMopTrFData.getWord("Save")%>";
mopTreat[1]="<%= pageMopTrFData.getWord("MOP Fill Fields")%>";
mopTreat[2]="<%= pageMopTrFData.getWord("MOP Error Max")%>";
mopTreat[3]="<%= pageMopTrFData.getWord("MOP Error Negative")%>";
mopTreat[4]="<%= pageMopTrFData.getWord("You must enter a Mop Treatment name")%>";
mopTreat[5]="<%= pageMopTrFData.getWord("Invalid use of character")%>";
mopTreat[6]="<%= pageMopTrFData.getWord("MOP Error Max Negative")%>";
mopTreat[7]="<%= pageMopTrFData.getWord("MOP Change Name")%>";
mopTreat[8]="<%= pageMopTrFData.getWord("Are you sure you wish to delete this commission?")%>";
mopTreat[9]="<%= pageMopTrFData.getWord("Delete")%>";




</script>
<% pageMopTrFData.closeConnection(); %>