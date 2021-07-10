 <%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import = "aheevaManager.ressources.*" %>

<%
////open connection to database///////
beanManagerData pageDatepiData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDatepiData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageDatepiData.openConnection();
    %>
 <script language="javascript" type="text/javascript">
// variables of labels;// 
var label= new Array();
labell[0]="<%= pageDatepiData.getWord("Please enter a starting date") %>";
labell[1]="<%= pageDatepiData.getWord("Please enter an ending date") %>";
labell[2]="<%= pageDatepiData.getWord("Please select at least one object") %>";
labell[3]="<%= pageDatepiData.getWord("Your ending date cannnot be smaller than your starting date") %>";

 </script>
    
    
    
    
    <% pageDatepiData.closeConnection(); %>