<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pagewfmData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pagewfmData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pagewfmData.openConnection();
    %>


<script language="javascript" type="text/javascript">
var wfm= new Array();
wfm[0]="<%= pagewfmData.getWord("Add a new team")%>";
wfm[1]="<%= pagewfmData.getWord("Modify the team")%>";
wfm[2]="<%= pagewfmData.getWord("Update team")%>";
wfm[3]="<%= pagewfmData.getWord("You must enter a TEAM NAME")%>";
wfm[4]="<%= pagewfmData.getWord("You must enter a TEAM LEADER NAME")%>";
wfm[5]="<%= pagewfmData.getWord("Invalid use of character")%>";
wfm[6]="<%= pagewfmData.getWord("Are you sure, you wish to delete this team ?")%>";




</script>
<% pagewfmData.closeConnection(); %>