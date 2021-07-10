<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="Manager.reports.*"%>
<head>
<title>AheevaCCS - Print Inbound Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<jsp:useBean id="beanInboundCallReport" scope="request" class="Manager.reports.beanCallReport" />
</head>
<body>
<%
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String phoneNumber  = request.getParameter("dnis");
    String spacing  = request.getParameter("spacing");
	
    String startingDate = "", sRet ="";
    String endingDate = "";

	beanCallReportDetails r1=null;

    if (reportType.compareTo("Daily") ==0){
			startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
			endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    } else if (reportType.compareTo("Monthly") ==0){
			startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
			endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;
    } 

	sRet = beanInboundCallReport.buildGroupReportForDnis(startingDate,endingDate,reportType,spacing,phoneNumber);
	if(sRet == "success")
	{
		%>
		<%@ include file="inboundDetails.jsp" %>
		<%
		System.out.println("sRet: success");
	}
	else
		System.out.println("sRet: no success");
			
%>

</body>
</html>
