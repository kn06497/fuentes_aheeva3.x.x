<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pageGenCData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageGenCData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageGenCData.openConnection();
    %>


<script language="javascript" type="text/javascript">
var configDemo= new Array();
configDemo[0]="<%=pageGenCData.getWord("Login time") %>";
configDemo[1]="<%=pageGenCData.getWord("Tolerance") %>";
configDemo[2]="<%=pageGenCData.getWord("This duration is numeric, please change") %>";
configDemo[3]="<%=pageGenCData.getWord("Invalid use of character") %>";
configDemo[4]="<%=pageGenCData.getWord("Please fill all duration fields") %>";
configDemo[5]="<%=pageGenCData.getWord("Duration") %>";
configDemo[6]="<%=pageGenCData.getWord("Delete") %>";
configDemo[7]="<%=pageGenCData.getWord("This tolerance is numeric, please change") %>";
configDemo[8]="<%=pageGenCData.getWord("Please fill all tolerance fields") %>";
configDemo[9]="<%=pageGenCData.getWord("Agent group") %>";
configDemo[10]="<%=pageGenCData.getWord("Paid time formula") %>";
configDemo[11]="<%=pageGenCData.getWord("Billable time formula") %>";
configDemo[12]="<%=pageGenCData.getWord("Not-ready reasons") %>";
configDemo[13]="<%=pageGenCData.getWord("Paid time") %>";
configDemo[14]="<%=pageGenCData.getWord("Billable time") %>";








</script>
<% pageGenCData.closeConnection(); %>