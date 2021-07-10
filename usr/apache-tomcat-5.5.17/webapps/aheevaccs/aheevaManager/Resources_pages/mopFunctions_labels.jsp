
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageMopFData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageMopFData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageMopFData.openConnection();
    %>


<script language="javascript" type="text/javascript">
var mop= new Array();
mop[0]="<%= pageMopFData.getWord("You can select only one treatment for this mop !! Please drop the selected treatment and select another one")%>";
mop[1]="<%= pageMopFData.getWord("Save")%>";
mop[2]="<%= pageMopFData.getWord("You must enter a Mop name")%>";
mop[3]="<%= pageMopFData.getWord("Invalid use of character")%>";
mop[4]="<%= pageMopFData.getWord("Are you sure, you wish to delete this method of payment? ** (Please check the agent groups which uses this MOP)")%>";


</script>
<% pageMopFData.closeConnection(); %>