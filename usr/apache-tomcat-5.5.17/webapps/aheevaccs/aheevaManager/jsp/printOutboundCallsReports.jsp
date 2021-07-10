
<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>

<head>
<title>AheevaCCS - Print Outbound Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<jsp:useBean id="beanAgentPerf" scope="request" class="aheevaManager.reports.beanAgentPerformanceReport" />
</head>
<body>
<%
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
	String detail =request.getParameter("detail");
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
	String starting_year_yearly = request.getParameter("starting_year_yearly");
	String ending_year_yearly = request.getParameter("ending_year_yearly");
	String starting_month_monthly = request.getParameter("starting_month_monthly");
	String starting_year_monthly = request.getParameter("starting_year_monthly");
	String ending_month_monthly = request.getParameter("ending_month_monthly");
	String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String agentGroups  = request.getParameter("objects");
	String[] tabObj =null;
    StringTokenizer tok = null, tokGrp =null;
    //beanAgentGlobalInfo groupsInfo = null;
	String from ="";
    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
	
	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
		System.out.println("---tabObj : " + tabObj[w]);	
		
	}
	String group ="", groupName="", groupId ="";
	
	String startingDate="", endingDate="", sret="";
    if (reportType.compareTo("Daily") ==0){
			startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
			endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    } else if (reportType.compareTo("Monthly") ==0){
			startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
			endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;
    } else if (reportType.compareTo("Yearly") ==0){
			startingDate=starting_year_yearly + "-01-01" + " 00:00:00" ;
			endingDate=ending_year_yearly + "-12-31"+ " 23:59:59" ;
    }


    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
	
    int i,j,k;
    String agents = "",myagt="";
	String agentGroupName ="",  sRet="";
    beanAgentPerformanceDetails r1=null;
    int numCampaigns = tok.countTokens();
	tabObj =new String[numCampaigns];
	for (int w =0; w < numCampaigns; w++)
	{
		tabObj[w] = tok.nextToken();
	}
	if(all_obj.compareTo("0")==0) // un campaign
	{
		agentGroupName = tabObj[Integer.parseInt(current)];
		System.out.println("Agent performance report for group: " + agentGroupName);
		sRet = beanAgentPerf.buildAgentPerformanceGrpDetailsReportForPeriod(agentGroupName,startingDate,endingDate,reportType);
		if(sRet == "success")
		{
			%>
			<%@ include file="outboundCallsReportsDetails.jsp" %>
			<%
			System.out.println("sRet: success");
		}
		else
			System.out.println("sRet: no success");
	}
	if(all_obj.compareTo("1")==0) 
	{
		
		sRet = beanAgentPerf.buildAgentPerformanceGrpDetailsReportForAll(tabObj,startingDate,endingDate,reportType);
		if(sRet == "success")
		{
			%>
			<%@ include file="outboundCallsReportsDetailsAll.jsp" %>
			<%
		}
		else
		System.out.println("sRet --------------"+sRet);
		

	}
%>
</body>
</html>
