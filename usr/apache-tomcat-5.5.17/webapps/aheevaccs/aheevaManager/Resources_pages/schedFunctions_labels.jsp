 <%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import = "aheevaManager.ressources.*" %>

<%
////open connection to database///////
beanManagerData pageschedData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageschedData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageschedData.openConnection();
    %>
 <script language="javascript" type="text/javascript">
// variables of labels;// 
var sched= new Array();
sched[0]="<%= pageschedData.getWord("Time hh:mm") %>";
sched[4]="<%= pageschedData.getWord("Sunday")%>";
sched[5]="<%= pageschedData.getWord("Monday")%>";
sched[6]="<%= pageschedData.getWord("Tuesday")%>";
sched[7]="<%= pageschedData.getWord("Wednesday")%>";
sched[8]="<%= pageschedData.getWord("Thursday")%>";
sched[9]="<%= pageschedData.getWord("Friday")%>";
sched[10]="<%= pageschedData.getWord("Saturday")%>";

 </script>
    
    
    
    
    <% pageschedData.closeConnection(); %>