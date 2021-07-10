<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="Manager.reports.*"%>

<head>
<title>AheevaCCS - Print Queue Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<jsp:useBean id="beanQueue" scope="request" class="Manager.reports.beanQueueReport" />
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
    String reportType   = request.getParameter("reportType");
    String queues       = request.getParameter("objects");
	String[] tabObj =null;
    StringTokenizer tok = null;
    beanQueueDetails queueInfo = null;
	String from ="";
	//table for sevice level agreement (variable in  sec). to change by customer variables 
	int maxChoice =10;
	int[] tabAnswered =null;
	int[] tabAband =null;
	 
	if(queues != null){
        tok = new java.util.StringTokenizer(queues,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
	
	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
	}
	String queue ="";
	
	String startingDate="", endingDate="", sret="";

    if (reportType.compareTo("Daily") ==0)
	{
		startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
		endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    } 
	else 
	{
		if (reportType.compareTo("Monthly") ==0)
		{
			startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
			endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;
    	} 
		else 
			if (reportType.compareTo("Yearly") ==0)
			{
				startingDate=starting_year_yearly + "-01-01" + " 00:00:00" ;
				endingDate=ending_year_yearly + "-12-31"+ " 23:59:59" ;
    		}
	}
	
if(all_obj.compareTo("0")==0) // un queue
{
	queue =tabObj[Integer.parseInt(current)];
	System.out.println("Queue: " + queue);
	sret = beanQueue.buildQueueReportForPeriod(queue,startingDate,endingDate,reportType);
	//verify if the 10 values for service level are specified for that queue
	tabAnswered = beanQueue.getSVL_AnsweredForQueue(queue);
	if( tabAnswered == null) //no specification for that queue
	{
		tabAnswered =new  int[maxChoice];
		tabAnswered[0] =10; tabAnswered[5] =60;
		tabAnswered[1] =20; tabAnswered[6] =90;
		tabAnswered[2] =30; tabAnswered[7] =120;
		tabAnswered[3] =40; tabAnswered[8] =150;
		tabAnswered[4] =50; tabAnswered[9] =180;
	}
	tabAband = beanQueue.getSVL_AbandForQueue(queue);
	if(tabAband == null) //no specification for that queue
	{
		tabAband =new  int[maxChoice];
		tabAband[0] =10; tabAband[5] =60;
		tabAband[1] =20; tabAband[6] =90;
		tabAband[2] =30; tabAband[7] =120;
		tabAband[3] =40; tabAband[8] =150;
		tabAband[4] =50; tabAband[9] =180;
	}
	beanQueue.buildAnsweredLevelForPeriod(queue,startingDate,endingDate,reportType,tabAnswered);
	beanQueue.buildAbandonnedLevelForPeriod(queue,startingDate,endingDate,reportType,tabAband);

	if(sret == "success")
	 {
		%>
		<%@ include file="queueReportsDetails.jsp" %>
		<%@ include file="queueReportsPercent.jsp" %>
		<%
	}
	 sret = beanQueue.buildGlobalQueueReportForPeriod(queue,startingDate,endingDate,reportType);
	 if(sret == "success")
	 {
		%>
		<%@ include file="queueReportsStat.jsp" %>
		<%
	 }
	
}
else //all
{
			for(int obj =0; obj < numObjects; obj++ )
			{
				queue = tabObj[obj];
				queueInfo = null;
				sret = beanQueue.buildQueueReportForPeriod(queue,startingDate,endingDate,reportType);
				/*
				if(sret == "success")
				 {
					%>
					<%@ include file="queueReportsDetails.jsp" %>
					<%
				 }
				 */
				sret = beanQueue.buildQueueReportForPeriod(queue,startingDate,endingDate,reportType);
				tabAnswered = beanQueue.getSVL_AnsweredForQueue(queue);
				if( tabAnswered == null) //no specification for that queue
				{
					tabAnswered =new  int[maxChoice];
					tabAnswered[0] =10; tabAnswered[5] =60;
					tabAnswered[1] =20; tabAnswered[6] =90;
					tabAnswered[2] =30; tabAnswered[7] =120;
					tabAnswered[3] =40; tabAnswered[8] =150;
					tabAnswered[4] =50; tabAnswered[9] =180;
				}
				tabAband = beanQueue.getSVL_AbandForQueue(queue);
				if(tabAband == null) //no specification for that queue
				{
					tabAband =new  int[maxChoice];
					tabAband[0] =10; tabAband[5] =60;
					tabAband[1] =20; tabAband[6] =90;
					tabAband[2] =30; tabAband[7] =120;
					tabAband[3] =40; tabAband[8] =150;
					tabAband[4] =50; tabAband[9] =180;
				}
				beanQueue.buildAnsweredLevelForPeriod(queue,startingDate,endingDate,reportType,tabAnswered);
				beanQueue.buildAbandonnedLevelForPeriod(queue,startingDate,endingDate,reportType,tabAband);
 
				 if(sret == "success")
				 {
					%>
					<%@ include file="queuePrintFile.jsp" %>
					<%
				}
				queueInfo =null;
				sret = beanQueue.buildGlobalQueueReportForPeriod(queue,startingDate,endingDate,reportType);
				 if(sret == "success")
				 {
					queueInfo = (beanQueueDetails)beanQueue.period;	
					%>
					<%@ include file="queueReportsStat.jsp" %>
					<%
				}
			}
}
%>
</body>
</html>