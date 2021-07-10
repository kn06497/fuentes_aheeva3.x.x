<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.reports.*"%>

<head>
<title>AheevaCCS - Print Staffing Daily Condition Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />


</style>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>

<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>

<jsp:useBean id="beanDailyCondition" scope="request" class="aheevaManager.reports.beanDailyConditionReport" />
</head>
<body>
<%
	String language =request.getParameter("lang");
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
    String startingDateDaily = request.getParameter("startingDateDaily");
	//======================================
	int NUM_INTVL = 48;// there are 48 time intervals of length 30 mins. between 0:00 and 24:00 
	String[] intervalStart = null;
  
	String startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) ;
	String  sret=""; 
	beanDailyConditionInfo dailyCondInfo = null;  
	
	// build the start point of half-hour intervals from 0:00 to 23:59
	intervalStart = new String[NUM_INTVL];
	int i = 0;
	int h = 0;
	while(h <= 23)
	{
		if(h <= 9)
		{
			intervalStart[i++] = "0"+h+":00";
			intervalStart[i++] = "0"+h+":30";
			
		}
		else
		{
			intervalStart[i++] = ""+h+":00";
			intervalStart[i++] = ""+h+":30";
		}
		h++;
	}		
	
    String reportType   = request.getParameter("reportType");
    String queues       = request.getParameter("objects");
	String[] tabObj =null;
    StringTokenizer tok = null;
    
	String from ="";
	
	 
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
	

if(all_obj.compareTo("0")==0) // one group 
{
	queue =tabObj[Integer.parseInt(current)];
	sret =  beanDailyCondition.buildDailyCondDetailsForPeriod(queue, startingDate);

System.out.println("all_obj==0");
	if(sret == "success")
	{
		System.out.println("sret == success");
		%>
		<%@ include file="dailyConditionReportsDetails.jsp" %>
		<% 
	}
}
%>	
</div>
</body>
</html>