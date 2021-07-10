<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pagexc2Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pagexc2Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pagexc2Data.openConnection();
    %>


<script language="javascript" type="text/javascript">
// variables of labels;// 
var phrase= new Array();
phrase[0]="<%= pagexc2Data.getWord("January")%>";
phrase[1]="<%= pagexc2Data.getWord("February")%>";
phrase[2]="<%= pagexc2Data.getWord("March")%>";
phrase[3]="<%= pagexc2Data.getWord("April")%>";
phrase[4]="<%= pagexc2Data.getWord("May")%>";         
phrase[5]="<%= pagexc2Data.getWord("June")%>";
phrase[6]="<%= pagexc2Data.getWord("July")%>";
phrase[7]="<%= pagexc2Data.getWord("August")%>";
phrase[8]="<%= pagexc2Data.getWord("September")%>";
phrase[9]="<%= pagexc2Data.getWord("October")%>";
phrase[10]="<%= pagexc2Data.getWord("November")%>";
phrase[11]="<%= pagexc2Data.getWord("December")%>";
phrase[12]="<%= pagexc2Data.getWord("Jan")%>";
phrase[13]="<%= pagexc2Data.getWord("Feb")%>";
phrase[14]="<%= pagexc2Data.getWord("Mar")%>";
phrase[15]="<%= pagexc2Data.getWord("Apr")%>";
phrase[16]="<%= pagexc2Data.getWord("May")%>";
phrase[17]="<%= pagexc2Data.getWord("Jun")%>";
phrase[18]="<%= pagexc2Data.getWord("Jul")%>";
phrase[19]="<%= pagexc2Data.getWord("Aug")%>";
phrase[20]="<%= pagexc2Data.getWord("Sep")%>";
phrase[21]="<%= pagexc2Data.getWord("Oct")%>";
phrase[22]="<%= pagexc2Data.getWord("Nov")%>";
phrase[23]="<%= pagexc2Data.getWord("Dec")%>";
phrase[24]="<%= pagexc2Data.getWord("Sunday")%>";
phrase[25]="<%= pagexc2Data.getWord("Monday")%>";
phrase[26]="<%= pagexc2Data.getWord("Tuesday")%>";
phrase[27]="<%= pagexc2Data.getWord("Wednesday")%>";
phrase[28]="<%= pagexc2Data.getWord("Thursday")%>";
phrase[29]="<%= pagexc2Data.getWord("Friday")%>";
phrase[30]="<%= pagexc2Data.getWord("Saturday")%>";
phrase[31]="<%= pagexc2Data.getWord("Sun")%>";
phrase[32]="<%= pagexc2Data.getWord("Mon")%>";
phrase[33]="<%= pagexc2Data.getWord("Tue")%>";
phrase[34]="<%= pagexc2Data.getWord("Wed")%>";
phrase[35]="<%= pagexc2Data.getWord("Thu")%>";
phrase[36]="<%= pagexc2Data.getWord("Fri")%>";
phrase[37]="<%= pagexc2Data.getWord("Sat")%>";
phrase[38]="<%= pagexc2Data.getWord("Su")%>";
phrase[39]="<%= pagexc2Data.getWord("Mo")%>";
phrase[40]="<%= pagexc2Data.getWord("Tu")%>";
phrase[41]="<%= pagexc2Data.getWord("We")%>";
phrase[42]="<%= pagexc2Data.getWord("Th")%>";
phrase[43]="<%= pagexc2Data.getWord("Fr")%>";
phrase[44]="<%= pagexc2Data.getWord("Sa")%>";
phrase[45]="<%= pagexc2Data.getWord(" Today ")%>";
phrase[46]="<%= pagexc2Data.getWord("Clear")%>";
phrase[47]="<%= pagexc2Data.getWord("Back")%>";
phrase[48]="<%= pagexc2Data.getWord("Close")%>";
phrase[49]="<%= pagexc2Data.getWord("Reset")%>";


</script>
<% pagexc2Data.closeConnection(); %>