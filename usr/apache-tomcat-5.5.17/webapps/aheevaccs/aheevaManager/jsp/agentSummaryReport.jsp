<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.reports.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import ="java.io.*"%>
<%@page import = "java.io.File" %>
<%@page import = "java.io.RandomAccessFile" %>
<%@page import = "java.io.FileNotFoundException" %>
<%@page import = "java.io.IOException" %>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pageSumData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSumData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageSumData.openConnection();
    %>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

<head>
<title>AheevaCCS - Agent Summary Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		auto;
	/*width:      550px;*/
}

html, body {
	background: #E1F4FF;
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
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<jsp:useBean id="beanAgent" scope="request" class="aheevaManager.reports.beanAgentGlobalInfoReport" />
</head>
<body>
<%
	String language =request.getParameter("lang");
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
	
%>
<div class="img-control">
<table align="right" border="0" width="25%" cellpadding="0" cellspacing="0">
	<tr valign="top">
		<td width="25%" align="center">
			<button type="button" style="border:none; background:none; cursor:hand;" onClick="window.open('printAgentSummaryReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(groupOrLeader) ;%>&reportSummary=<% out.write(reportSummary) ;%>&prec=<% out.write(prec) ;%>&suiv=<% out.write(suiv) ;%>&current=<% out.write(current) ;%>&all_obj=<% out.write(all_obj) ;%>&from=<% out.write("agentLoginReport") ;%>&lang=<% out.write(language); %>')"><img src="../img/printer.gif" border="0"></button>
		</td>
	<%
		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="agentSummaryReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(groupOrLeader) ;%>&reportSummary=<% out.write(reportSummary) ;%>&prec=<% out.write(new_prec) ;%>&suiv=<% out.write(current) ;%>&current=<% out.write(prec) ;%>&all_obj=0&lang=<%out.write(language); %>" ><%=pageSumData.getWord("Previous")%></a>		</td>
		
	<%
	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	%>
		<td width="25%" align="center">
		<a href="agentSummaryReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(groupOrLeader) ;%>&reportSummary=<% out.write(reportSummary) ;%>&prec=-1&suiv=1&current=0&all_obj=1&lang=<%out.write(language); %>" ><%=pageSumData.getWord("All")%></a>
		</td>
	<%
	}
	String nb_obj = Integer.toString(numObjects);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="agentSummaryReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(groupOrLeader) ;%>&reportSummary=<% out.write(reportSummary) ;%>&prec=<% out.write(current) ;%>&suiv=<% out.write(new_suiv) ;%>&current=<% out.write(suiv) ;%>&all_obj=0&lang=<%out.write(language); %>" ><%=pageSumData.getWord("Next")%></a>
		</td>
	<%
	}
	%>
	</tr>
</table>
<!--<table width="100%"><tr><td width="100%" height="30"></td></tr></table>-->
</div>

<div class="tab-pane" id="tabPane1">	
<form name="summaryReports">
	<div class="tab-page" id="tabPage1">
	<fieldset>
<%

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
		grpOrLeadId = grpOrLeadTemp;//new java.util.StringTokenizer(grpOrLeadTemp,"^");
		System.out.println("Summary report for group or leader :  [ "+grpOrLeadId +" ]" );
	}
	if(reportSummary.compareTo("group")==0)
	{
		
		tokGrpOrLead = new java.util.StringTokenizer(grpOrLeadTemp,",");
		grpOrLeadName =tokGrpOrLead.nextToken();
		grpOrLeadId = tokGrpOrLead.nextToken();
		System.out.println("Summary report for group or leader : " + grpOrLeadName + " [ "+grpOrLeadId +" ]" );
	}
	
	 beanAgent.buildAgentSummaryInfosForPeriod(grpOrLeadId,startingDate,endingDate, reportSummary);
	%>
	<%@ include file="agentSummaryReportsDetails.jsp" %>
	<% 
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
		 beanAgent.buildAgentSummaryInfosForPeriod(grpOrLeadId,startingDate,endingDate, reportSummary);
		%>
		<%@ include file="agentSummaryReportsDetails.jsp" %>
		<%
	}
	
}
%>	
		</fieldset>	
	</div>
</form>
</div>
</body>
</html>
<% pageSumData.closeConnection(); %>
