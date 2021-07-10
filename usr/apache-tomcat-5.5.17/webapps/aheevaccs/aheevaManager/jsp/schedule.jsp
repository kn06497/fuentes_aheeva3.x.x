<%@ page import="java.util.*" %>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData schData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	schData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
schData.openConnection();
%>

<jsp:useBean id="formHandler" scope="request" class="aheevaManager.reports.beanSchedule">
  <jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script><html>
<body>
<p> <font color="#0000FF" face="Arial"><b> 

<% 

    if ( request.getParameter("AllSchedData") != null ) {
    	String val = request.getParameter("AllSchedData");
    	if(formHandler.saveScheduleData(val))
			
			out.write("<script language='javascript'>"+schData.getWord("Your Schedule Data have been saved properly !"));       
    	else
    		out.write("<script language='javascript'>"+schData.getWord("Error while saving schedule data..Try again. !")); 
    }
%>

</b></font></p>
</body>
</html>
<% schData.closeConnection(); %>
