<%@ page import="java.util.*" %>

<jsp:useBean id="formHandler" scope="request" class="aheevaManager.reports.beanSchedule">
  <jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script><html>
<body>
<p> <font color="#0000FF" face="Arial"><b> 

<% 

    if ( request.getParameter("AllSchedData") != null ) {
    	String val = request.getParameter("AllSchedData");
    	if(formHandler.saveScheduleData(val))
			
			out.write("<script language='javascript'>document.write(MultiArray[\"Your Schedule Data have been saved properly !\"][lang]);</script>");       
    	else
    		out.write("<script language='javascript'>document.write(MultiArray[\"Error while saving schedule data..Try again. !\"][lang]);</script>"); 
    }
%>

</b></font></p>
</body>
</html>