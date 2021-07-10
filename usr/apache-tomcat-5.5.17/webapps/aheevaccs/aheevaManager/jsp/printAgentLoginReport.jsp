<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>

<head>
<title>AheevaCCS - Print Agent Login Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<jsp:useBean id="beanAgentLoginReport" scope="request" class="aheevaManager.reports.beanAgentLoginReport" />
</head>
<body>
<%
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
    
	String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_year_yearly = request.getParameter("starting_year_yearly");
    String ending_year_yearly = request.getParameter("ending_year_yearly");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String startingDate="";
    String endingDate="";
    String reportType   = request.getParameter("reportType");
    String agentGroups  = request.getParameter("objects");
    StringTokenizer tok = null, tokGrp=null;
	String[] tabObj =null;
	String from = request.getParameter("from");

    if(reportType.compareTo("Daily") ==0){
		startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
		endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    }else if (reportType.compareTo("Monthly") ==0){
		startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
		endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;					
    }else if (reportType.compareTo("Yearly") == 0){
		startingDate = starting_year_yearly + "-01-01" + " 00:00:00" ;
		endingDate = ending_year_yearly + "-12-31"+ " 23:59:59" ;
    }

    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    int i,j,k;
    String agents = "",myagt="";
    beanAgentLoginInfo r1=null;
    int numCampaigns = tok.countTokens();
	tabObj =new String[numCampaigns];
	for (int w =0; w < numCampaigns; w++)
	{
		tabObj[w] = tok.nextToken();
	}
 String agentGroupTemp ="", agentGroupName ="", agentGroup="", sRet="";
if(all_obj.compareTo("0")==0) // un campaign
{
	agentGroupTemp = tabObj[Integer.parseInt(current)];
	tokGrp = new java.util.StringTokenizer(agentGroupTemp,",");
	agentGroupName =tokGrp.nextToken();
	agentGroup = tokGrp.nextToken();
	System.out.println("Agent Login report for group: " + agentGroupName);
    sRet = beanAgentLoginReport.buildAgentGroupLoginReport(agentGroup,startingDate,endingDate,reportType);
	if(sRet == "success")
	{
		%>
<%@ include file="agentLoginReportsDetails.jsp" %>
<%
	}
}
else
{
    sRet = beanAgentLoginReport.buildAgentGroupLoginReportForAll(tabObj,startingDate,endingDate,reportType);
		%>
		<%@ include file="agentLoginReportsDetailsAll.jsp" %>
		<%
}
%>

</body>
</html>

