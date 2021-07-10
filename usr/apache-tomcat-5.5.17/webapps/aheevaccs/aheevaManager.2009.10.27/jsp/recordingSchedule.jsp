<%@ page import="java.util.*" %>

<jsp:useBean id="beanScheduler" scope="request" class="aheevaManager.reports.beanSchedule">
  <jsp:setProperty name="beanScheduler" property="*"/>
</jsp:useBean>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script><html>
<body>
<p> <font color="#0000FF" face="Arial"><b> 
<% 
    String group = request.getParameter("grp");
    String agent = request.getParameter("agent");
    String nb_rec = request.getParameter("nb_rec_gen");
    String rec_period = request.getParameter("rec_period");   
    
    if(beanScheduler.saveRecordingScheduleData(group,agent,nb_rec,rec_period))
    	out.write("<script language='javascript'>document.write(MultiArray[\"Your Recording Schedule has been saved properly !\"][lang]);</script>");
    else
    	out.write("<script language='javascript'>document.write(MultiArray[\"Error while saving Recording schedule data..Pease, Try again. !\"][lang]);</script>"); 
		
%>

</b></font></p>
</body>
</html>