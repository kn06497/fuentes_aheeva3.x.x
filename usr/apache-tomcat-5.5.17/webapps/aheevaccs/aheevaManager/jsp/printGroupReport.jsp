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
<title>AheevaCCS - Print Group Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<jsp:useBean id="beanAgentGroup" scope="request" class="aheevaManager.reports.beanAgentGroupReport" />
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
    String from =request.getParameter("from");
	String groups  = request.getParameter("objects");
	String[] tabObj =null;
    StringTokenizer tok = null, tokGrp =null;
    beanAgentGlobalInfo groupsInfo = null;
    if(groups != null){
        tok = new java.util.StringTokenizer(groups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
	
	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
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

	if(all_obj.compareTo("0")==0) // un agent
	{
		group =tabObj[Integer.parseInt(current)];
		tokGrp = new java.util.StringTokenizer(group,",");
		groupName =tokGrp.nextToken();
		groupId = tokGrp.nextToken();
		System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	
		
		if(detail.compareTo("0")==0)
		{
			sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
			beanAgentGroup.BuildGlobalNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
			System.out.println("fin BuildGlobalNotReadyReasonForPeriod ds JSP");	
			groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
			if(sret == "success")
			{
				%>
				<%@ include file="groupReportPrintFile.jsp" %>
				<%@ include file="groupReportsStat.jsp" %>
				<%
			}
			
		}
		else
		{
			if(detail.compareTo("1")==0) //detaille
			{
				sret = beanAgentGroup.buildGroupDetailsInfosForPeriod(groupId,reportType,startingDate,endingDate);
				System.out.println("fin buildGroupDetailsInfosForPeriod ds JSP");	
				beanAgentGroup.beanAgentGroupGettingNameNrr(groupId,reportType,startingDate,endingDate);
				System.out.println("fin beanAgentGroupGettingNameNrr ds JSP");
				beanAgentGroup.BuildDetailsNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
				System.out.println("fin BuildDetailsNotReadyReasonForPeriod ds JSP");	
				HashMap mapNRR = (HashMap)beanAgentGroup.mapNrr;
				if(sret == "success")
				{
					%>
					<jsp:include page="/groupReportsAnsweredDetails.jsp" />
					<%@ include file="groupReportsUnAnsweredDetails.jsp" %>
					<%
				}
				sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
				if(sret == "success")
				{
					groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
					%>
					<%@ include file="groupReportsStat.jsp" %>
					<%
				}
			}
		
		}
	}



	else
	{
	    HashMap mapNRR = new HashMap();	
		for(int obj =0; obj < numObjects; obj++ )
		{
			group =tabObj[obj];
			tokGrp = new java.util.StringTokenizer(group,",");
			groupName =tokGrp.nextToken();
			groupId = tokGrp.nextToken();
			System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	
		
			if(detail.compareTo("0")==0) // rapport non detaille
			{
				sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
				beanAgentGroup.BuildGlobalNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
				System.out.println("fin BuildGlobalNotReadyReasonForPeriod ds JSP");	
				groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
				if(sret == "success")
				{
					%>
					<%@ include file="groupReportPrintFile.jsp" %>
					<%@ include file="groupReportsStat.jsp" %>
					<%
				}
			}
			else
			{
				if(detail.compareTo("1")==0) //detaille
				{
					mapNRR.clear();	
					sret = beanAgentGroup.buildGroupDetailsInfosForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin buildGroupDetailsInfosForPeriod ds JSP");	
					beanAgentGroup.beanAgentGroupGettingNameNrr(groupId,reportType,startingDate,endingDate);
					System.out.println("fin beanAgentGroupGettingNameNrr ds JSP");
					beanAgentGroup.BuildDetailsNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin BuildDetailsNotReadyReasonForPeriod ds JSP");	
					//HashMap mapNRR = (HashMap)beanAgentGroup.mapNrr;
					if(sret == "success")
					{
						mapNRR = (HashMap)beanAgentGroup.mapNrr;
						%>
						<jsp:include page="/groupReportsAnsweredDetails.jsp" />
						<%@ include file="groupReportsUnAnsweredDetails.jsp" %>
						<%
					}
					sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
					if(sret == "success")
					{
						groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
						%>
						<%@ include file="groupReportsStat.jsp" %>
						<%
					}
				}
			}
		} //fin for
	}
%>
</body>
</html>
