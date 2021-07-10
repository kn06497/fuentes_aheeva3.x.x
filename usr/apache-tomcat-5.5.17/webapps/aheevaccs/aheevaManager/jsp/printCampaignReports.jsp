<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>

<head>
<title>AheevaCCS - Print Campaign Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>

<jsp:useBean id="beanCampaign" scope="request" class="aheevaManager.reports.beanCallingListReport" />
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
    String reportType  = request.getParameter("reportType");
    String campaigns   = request.getParameter("objects");
    String startingDate="", endingDate="", sRet ="";
	String[] tabObj =null;
	beanCallingListDetails r1 =null;
	
    if(reportType.compareTo("Daily") ==0){
		startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
		endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    }else if (reportType.compareTo("Monthly") ==0)
	{
		startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
		endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;					
    }else if (reportType.compareTo("Yearly") == 0){
		startingDate = starting_year_yearly + "-01-01" + " 00:00:00" ;
		endingDate = ending_year_yearly + "-12-31"+ " 23:59:59" ;
    }

    StringTokenizer tok = null;
    if(campaigns != null){
        tok = new java.util.StringTokenizer(campaigns,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
	}

	String c_campaign ="";
if(all_obj.compareTo("0")==0) // un campaign
{
	System.out.println("debut form");
	c_campaign = tabObj[Integer.parseInt(current)];
    sRet=beanCampaign.buildCampaignReportForPeriod(c_campaign,startingDate,endingDate,reportType);
 	if(sRet == "succes")
	{
		%>
		<%@ include file="campaignReportsDetails.jsp" %>
		<%
	}
}

else
{
	for(int obj =0; obj < numObjects; obj++ )
	{
		c_campaign = tabObj[obj];
		r1 = null;
    	sRet=beanCampaign.buildCampaignReportForPeriod(c_campaign,startingDate,endingDate,reportType);
		if(sRet == "succes")
		 {
			%>
			<%@ include file="campaignReportsDetails.jsp" %>
			<%
		}
	} //fin for
}
%>	
