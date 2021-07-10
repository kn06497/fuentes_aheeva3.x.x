<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>

<head>
<title>AheevaCCS -Print Agent Summary Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<jsp:useBean id="beanAgent" scope="request" class="aheevaManager.reports.beanAgentGlobalInfoReport" />
</head>
<body>
<%
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
	String reportSummary =request.getParameter("reportSummary");
	String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_year_yearly = request.getParameter("starting_year_yearly");
    String ending_year_yearly = request.getParameter("ending_year_yearly");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String groupOrLeader  = request.getParameter("objects");
    StringTokenizer tok = null, tokGrpOrLead=null;
	String[] tabObj =null;
    beanAgentGlobalInfo agentInfo = null;
	String from ="";
    if(groupOrLeader != null){
        tok = new java.util.StringTokenizer(groupOrLeader,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    String grpOrLead = "",mygrpOrLead="";
	String grpOrLeadTemp ="", grpOrLeadName ="", grpOrLeadId="";

	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
	}
	String agentId ="";
	String startingDate="", endingDate="", sret="";
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
	

System.out.println("debut form");
System.out.println("current value == "+ current);
System.out.println("prec value == "+ prec);
System.out.println("suiv value == "+ suiv);
System.out.println("reportSummary value == "+ reportSummary);
System.out.println("groupOrLeader value == "+ groupOrLeader);

if(all_obj.compareTo("0")==0) // one group or leader
{
System.out.println("all_obj==0");
	grpOrLeadTemp = tabObj[Integer.parseInt(current)];
	if(reportSummary.compareTo("leader")==0)
	{
		grpOrLeadId = grpOrLeadTemp;
		System.out.println("Summary report for group or leader :  [ "+grpOrLeadId +" ]" );
	}
	if(reportSummary.compareTo("group")==0)
	{
		tokGrpOrLead = new java.util.StringTokenizer(grpOrLeadTemp,",");
		grpOrLeadName =tokGrpOrLead.nextToken();
		grpOrLeadId = tokGrpOrLead.nextToken();
		System.out.println("Summary report for group or leader : " + grpOrLeadName + " [ "+grpOrLeadId +" ]" );
	}
	sret = beanAgent.buildAgentSummaryInfosForPeriod(grpOrLeadId,startingDate,endingDate, reportSummary);//beanAgent.buildAgentSummaryInfosForPeriod(grpOrLeadId,reportType,startingDate,endingDate, reportSummary);

	if(sret == "success")
	{
		System.out.println("sret == success");
		%>
		<%@ include file="agentSummaryReportsDetails.jsp" %>
		<%
	}

}

else
{
	for(int obj =0; obj < numObjects; obj++ )
	{
		grpOrLeadTemp = tabObj[obj];
		if(reportSummary.compareTo("leader")==0)
		{
			grpOrLeadId = grpOrLeadTemp;
			System.out.println("Summary report for group or leader :  [ "+grpOrLeadId +" ]" );
		}
		if(reportSummary.compareTo("group")==0)
		{
			tokGrpOrLead = new java.util.StringTokenizer(grpOrLeadTemp,",");
			grpOrLeadName =tokGrpOrLead.nextToken();
			grpOrLeadId = tokGrpOrLead.nextToken();
			System.out.println("Summary report for group or leader : " + grpOrLeadName + " [ "+grpOrLeadId +" ]" );
		}
		sret = beanAgent.buildAgentSummaryInfosForPeriod(grpOrLeadId,startingDate,endingDate, reportSummary);//beanAgent.buildAgentSummaryInfosForPeriod(grpOrLeadId,reportType,startingDate,endingDate, reportSummary);
		if(sret == "success")
		{
			System.out.println("sret == success");
			%>
			<%@ include file="agentSummaryReportsDetails.jsp" %>
			<%
		}
	}
	
}

%>	
</body>
</html>

