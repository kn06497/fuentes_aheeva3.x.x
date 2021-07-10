<%@ page import="java.util.*" %>
<%@page import = "aheevaManager.ressources.*" %>

<jsp:useBean id="beanScheduler" scope="request" class="aheevaManager.reports.beanSchedule">
  <jsp:setProperty name="beanScheduler" property="*"/>
</jsp:useBean>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script><html>
<body>
<p> <font color="#0000FF" face="Arial"><b> 
<% 
	beanManagerData pageDataAgent = new beanManagerData();
	pageDataAgent.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageDataAgent.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

    String group = request.getParameter("grp");
    String agent = request.getParameter("agent");
    String nb_rec = request.getParameter("nb_rec_gen");
    String rec_period = request.getParameter("rec_period");   
    
    if(beanScheduler.saveRecordingScheduleData(group,agent,nb_rec,rec_period))
    	out.write(pageDataAgent.getWord("Your Recording Schedule has been saved properly !"));
    else
    	out.write(pageDataAgent.getWord("Error while saving Recording schedule data..Pease, Try again. !")); 
		
%>

</b></font></p>
</body>
</html>

<%
pageDataAgent.closeConnection();
%>