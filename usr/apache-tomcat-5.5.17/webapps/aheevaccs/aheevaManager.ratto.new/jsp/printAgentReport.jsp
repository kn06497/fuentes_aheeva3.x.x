<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>
<head>
<title>AheevaCCS - Print Agent Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="javascript" type="text/javascript">
var lang =normalizeString(QueryString('lang'));
</script>
<jsp:useBean id="beanAgent" scope="request" class="aheevaManager.reports.beanAgentGlobalInfoReport" />
<jsp:useBean id="beanAgentDetail" scope="request" class="aheevaManager.reports.beanAgentDetailsInfoReport" />
</head>
<body>

<%
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
	String detail =request.getParameter("detail");
	String viewFirst =request.getParameter("viewFirst");
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
	String starting_year_yearly = request.getParameter("starting_year_yearly");
	String ending_year_yearly = request.getParameter("ending_year_yearly");
	String starting_month_monthly = request.getParameter("starting_month_monthly");
	String starting_year_monthly = request.getParameter("starting_year_monthly");
	String ending_month_monthly = request.getParameter("ending_month_monthly");
	String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
	String from =request.getParameter("from");

        //String[] agents = request.getParameterValues("objects");
	String agentsStr = request.getParameter("objects");
  	String[] agentList ;

    StringTokenizer tok = null;
	if(agentsStr!= null) {
		tok = new java.util.StringTokenizer(agentsStr,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
    int numObj = tok.countTokens();

    agentList = new String[numObj];
    for(int i=0; i<numObj; i++)
    {
	   agentList[i] = tok.nextToken();
    }
	
    beanAgentGlobalInfo agentInfo = null;

    /*if(agents != null){
        tok = new java.util.StringTokenizer(agents,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

      int numObjects = tok.countTokens();
      tabObj =new String[numObjects];
      for (int w =0; w < numObjects; w++)
      {
              tabObj[w] = tok.nextToken();
      }
      */

	String agentId = "",
        startingDate = "",
        endingDate = "",
        sret = "";
    if (reportType.compareTo("Daily") == 0){
			startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
			endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;
    } else if (reportType.compareTo("Monthly") == 0){
			startingDate = starting_year_monthly + "-"+ starting_month_monthly+ "-"+ "01" + " 00:00:00" ;
			endingDate = ending_year_monthly+ "-"+ ending_month_monthly + "-31"+ " 23:59:59" ;
    } else if (reportType.compareTo("Yearly") == 0){
			startingDate = starting_year_yearly + "-01-01" + " 00:00:00" ;
			endingDate = ending_year_yearly + "-12-31"+ " 23:59:59" ;
    }
	if(all_obj.compareTo("0")==0)
	{
		agentId = agentList[Integer.parseInt(current)];//agents[Integer.parseInt(current)];
		if(detail.compareTo("0") == 0)
		{
			sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
			if(sret == "success")
			{
				agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
				%>
				<%@ include file="agentReportPrintFile.jsp" %>
				<%@ include file="agentReportsStat.jsp" %>
				<%
			}
		}
		else
		{
			if(detail.compareTo("1")==0) //detaille
			{
				sret = beanAgentDetail.buildAgentDetailsInfosForPeriod(agentId,reportType,startingDate,endingDate);
				beanAgentDetail.beanAgentDetailsGettingNameNrr(agentId,reportType,startingDate,endingDate);
				beanAgentDetail.BuildNotReadyReasonForPeriod(agentId,reportType,startingDate,endingDate);
				HashMap mapNRR = (HashMap)beanAgentDetail.mapNrr;
				if(sret == "success")
				{
					%>
					<%@ include file="agentReportsAnsweredDetails.jsp" %>
					<%@ include file="agentReportsUnAnsweredDetails.jsp" %>
					<%
				}
				sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
				if(sret == "success")
				{
					agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
					%>
					<%@ include file="agentReportsStat.jsp" %>
					<%
				}
			}
		}
	}
	else
	{
		for(int obj = 0; obj < numObj; obj++ )
		{
			agentId = agentList[obj];
			agentInfo = null;
			if(detail.compareTo("0")==0)
			{
					sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
					if(sret == "success")
					{
						agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
						%>
						<%@ include file="agentReportPrintFile.jsp" %>
						<%@ include file="agentReportsStat.jsp" %>
						<%
					}
			}
			else
			{
				if(detail.compareTo("1")==0) //detaille
				{
					sret = beanAgentDetail.buildAgentDetailsInfosForPeriod(agentId,reportType,startingDate,endingDate);
					beanAgentDetail.beanAgentDetailsGettingNameNrr(agentId,reportType,startingDate,endingDate);
					beanAgentDetail.BuildNotReadyReasonForPeriod(agentId,reportType,startingDate,endingDate);
					HashMap mapNRR = (HashMap)beanAgentDetail.mapNrr;
					if(sret == "success")
					{
						%>
						<%@ include file="agentReportsAnsweredDetails.jsp" %>
						<%@ include file="agentReportsUnAnsweredDetails.jsp" %>
						<%
					}
					sret =beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
					if(sret == "success")
					{
						agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
						%>
						<%@ include file="agentReportsStat.jsp" %>
						<%
					}
				}
			}
		}
	}
%>
</body>
</html>
