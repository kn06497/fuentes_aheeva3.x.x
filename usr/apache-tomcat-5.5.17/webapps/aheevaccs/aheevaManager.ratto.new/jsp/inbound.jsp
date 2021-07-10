<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />


<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>
<head>
<title>AheevaCCS - Inbound Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		auto;
	/*width:      550px;*/
}

html, body {
	background:	#E1F4FF;
}

form {
	margin:		40px;
	padding:	0;
}

/* over ride styles from webfxlayout */

body {
	margin:		10px;
	width:		auto;
	height:		auto;
}

.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}

.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
}

.dynamic-tab-pane-control a:hover {
	background: transparent;
}
.imgControl {
	top: 1;
	position:		relative;
	
}
</style>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<jsp:useBean id="beanInboundCallReport" scope="request" class="aheevaManager.reports.beanCallReport" />
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
			//endingDate = starting_year_monthly+ "-"+ starting_month_monthly + "-31"+ " 23:59:59" ;
			endingDate = starting_year_monthly+ "-"+ starting_month_monthly + "-31"+ " 23:59:59" ;
			// For this report it should be stats for the same month
    } 

%>
<div class="img-control" >
<table align="right" border="0" width="25%" cellpadding="0" cellspacing="0">
	<tr valign="top">
		<td width="25%" align="center">
				<button type="button" style="border:none; background:none; cursor:hand;" onClick="window.open('printInboundCallsReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&dnis=<%out.write(phoneNumber) ;%>&spacing=<%out.write(spacing) ;%>&lang=<% out.write(request.getParameter("lang")); %>')"><img src="../img/printer.gif" border="0"></button>
		</td>		
	</tr>
</table>
</div>

<div class="tab-pane" id="tabPane1">	
<form name="inboundReports">
	<div class="tab-page" id="tabPage1">
	<fieldset>
	
	
<%
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
		</fieldset>	
	</div>
</form>
</div>
</body>
</html>
