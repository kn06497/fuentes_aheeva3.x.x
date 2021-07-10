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
beanManagerData page1Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	page1Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    page1Data.openConnection();
%>


<head>
<title>AheevaCCS - Agent Group Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<style type="text/css">

.dynamic-tab-pane-control .tab-page {
	height:		100%;
	/*width:      550px;*/
}

html, body {
	background:	#E1F4FF;
}

form {
	margin:		0;
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

<jsp:useBean id="beanAgentGroup" scope="request" class="aheevaManager.reports.beanAgentGroupReport" />
</head>
<body>

<%
	String language =request.getParameter("lang");
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
    String groups  = request.getParameter("objects");
	String[] tabObj =null;
    StringTokenizer tok = null, tokGrp =null;
    beanAgentGlobalInfo groupsInfo = null;
	String from ="";
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
%>
<div class="img-control" >
<table align="right" border="0" width="25%" >
	<tr valign="top">
		<td width="25%" align="center">
			<form>
				<button type="button" style="border:none; background:none; cursor:hand;" onClick="window.open('printGroupReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&detail=<%out.write(detail) ;%>&objects=<%out.write(groups) ;%>&prec=<% out.write(prec) ;%>&suiv=<% out.write(suiv) ;%>&current=<% out.write(current) ;%>&all_obj=<% out.write(all_obj) ;%>&from=<% out.write("groupReport") ;%>&lang=<% out.write(language);  %>')"><img src="../img/printer.gif" border="0"></button>
			</form>
		</td>
	
	<%
	
		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="agentGroupReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&detail=<%out.write(detail) ;%>&objects=<%out.write(groups) ;%>&prec=<% out.write(new_prec) ;%>&suiv=<% out.write(current) ;%>&current=<% out.write(prec) ;%>&all_obj=0&lang=<%out.write(language); %>" ><%= page1Data.getWord("Previous")%></a>		</td>
	<%
	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	%>
		<td width="25%" align="center">
		<a href="agentGroupReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&detail=<%out.write(detail) ;%>&objects=<%out.write(groups) ;%>&prec=-1&suiv=1&current=0&all_obj=1&lang=<%out.write(language); %>" ><%= page1Data.getWord("All")%></a>
		</td>
	<%
	}
	String nb_obj = Integer.toString(numObjects);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="agentGroupReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&detail=<%out.write(detail) ;%>&objects=<%out.write(groups) ;%>&prec=<% out.write(current) ;%>&suiv=<% out.write(new_suiv) ;%>&current=<% out.write(suiv) ;%>&all_obj=0&lang=<%out.write(language); %>" ><%= page1Data.getWord("Next")%></a>
		</td>
	<%
	}
	%>
	</tr>
</table>
</div>
<%
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
	}
	
	if(detail.compareTo("1")==0)
	{
		sret = beanAgentGroup.buildGroupDetailsInfosForPeriod(groupId,reportType,startingDate,endingDate);
		System.out.println("fin buildGroupDetailsInfosForPeriod ds JSP");	
		beanAgentGroup.beanAgentGroupGettingNameNrr(groupId,reportType,startingDate,endingDate);
		System.out.println("fin beanAgentGroupGettingNameNrr ds JSP");
		beanAgentGroup.BuildDetailsNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
		System.out.println("fin BuildDetailsNotReadyReasonForPeriod ds JSP");	
	}
%>
<div class="tab-pane" id="tabPane1">
<form name="groupReports">
	<script type="text/javascript">
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabPage1">
		<h2 class="tab"><%= page1Data.getWord("Answered")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );  			 		</script>
		<fieldset>
	    <%
			
			if(detail.compareTo("0")==0) // rapport non detaille
			{
				if(sret == "success")
				 {
					%>
					<%@ include file="groupReportsAnswered.jsp" %>
					<%
				}
			}
			
			
			if(detail.compareTo("1")==0) // rapport  detaille
			{
				if(sret == "success")
				 {
				%>
				<%@ include file="groupReportsAnsweredDetails.jsp" %>
				<%
			 	}
			}
		
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage2">
		<h2 class="tab"><%= page1Data.getWord("Unanswered")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );		 		</script>
		<fieldset>
	    <%
			if(detail.compareTo("0")==0) // rapport non detaille
			{
				if(sret == "success")
				 {
					%>
					<%@ include file="groupReportsUnAnswered.jsp" %>
					<%
				}
			}
			
			if( detail.compareTo("1")==0) // rapport detaille
			{
				HashMap mapNRR = (HashMap)beanAgentGroup.mapNrr;
				if(sret == "success")
				{
					%>
					<%@ include file="groupReportsUnAnsweredDetails.jsp" %>
					<%
				}
			}
			
			
		
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage3">
		<h2 class="tab"><%= page1Data.getWord("Statistics")%></h2>		
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) ); 			 		</script>
		<fieldset>
	    <%
		sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
			 if(sret == "success")
			 {
				groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
				%>
				<%@ include file="groupReportsStat.jsp" %>
				<%
			}
		%>
		</fieldset>	
	</div>
</form>
</div>
<script type="text/javascript">
	setupAllTabs();
</script>
<%
}

else
{

%>
<div class="tab-pane" id="tabPane1">
<form name="groupReports">
	<script type="text/javascript">
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabPage1">
		<h2 class="tab"><%= page1Data.getWord("Answered")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );  			 		</script>
		<fieldset>
	    <%
			
			if(detail.compareTo("0")==0) // non non detaille
			{
				for(int obj =0; obj < numObjects; obj++ )
				{
					group =tabObj[obj];
					tokGrp = new java.util.StringTokenizer(group,",");
					groupName =tokGrp.nextToken();
					groupId = tokGrp.nextToken();
					System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	
					
					sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
					beanAgentGroup.BuildGlobalNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin BuildGlobalNotReadyReasonForPeriod ds JSP");	
					groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
					if(sret == "success")
					 {
						%>
						<%@ include file="groupReportsAnswered.jsp" %>
						<%
					}
					
					
				
			    } //fin for
			}	
			if(detail.compareTo("1")==0) // rapport detaille
			{
				for(int obj =0; obj < numObjects; obj++ )
				{
					group =tabObj[obj];
					tokGrp = new java.util.StringTokenizer(group,",");
					groupName =tokGrp.nextToken();
					groupId = tokGrp.nextToken();
					System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	
				
					sret = beanAgentGroup.buildGroupDetailsInfosForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin buildGroupDetailsInfosForPeriod ds JSP");	
					beanAgentGroup.beanAgentGroupGettingNameNrr(groupId,reportType,startingDate,endingDate);
					System.out.println("fin beanAgentGroupGettingNameNrr ds JSP");
					beanAgentGroup.BuildDetailsNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin BuildDetailsNotReadyReasonForPeriod ds JSP");	
					
					if(sret == "success")
					 {
					%>
					<%@ include file="groupReportsAnsweredDetails.jsp" %>
					<%
					}
					
				
			    } //fin for
			}	
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage2">
		<h2 class="tab"><%= page1Data.getWord("Unanswered")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );		 		</script>
		<fieldset>
	    <%if(detail.compareTo("0")==0) // rapport non detaille
		{
			for(int obj =0; obj < numObjects; obj++ )
			{
				group =tabObj[obj];
				tokGrp = new java.util.StringTokenizer(group,",");
				groupName =tokGrp.nextToken();
				groupId = tokGrp.nextToken();
				System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	

				sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
				beanAgentGroup.BuildGlobalNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
				System.out.println("fin BuildGlobalNotReadyReasonForPeriod ds JSP");	
				groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;

				if(sret == "success")
				 {
					%>
					<%@ include file="groupReportsUnAnswered.jsp" %>
					<%
				}
					
			
		    } //fin for
		}
if( detail.compareTo("1")==0) // rapport detaille
			{
				HashMap mapNRR = new HashMap();					
				for(int obj =0; obj < numObjects; obj++ )
				{
					group =tabObj[obj];
					tokGrp = new java.util.StringTokenizer(group,",");
					groupName =tokGrp.nextToken();
					groupId = tokGrp.nextToken();
					System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	
					mapNRR.clear();	
					sret = beanAgentGroup.buildGroupDetailsInfosForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin buildGroupDetailsInfosForPeriod ds JSP");	
					beanAgentGroup.beanAgentGroupGettingNameNrr(groupId,reportType,startingDate,endingDate);
					System.out.println("fin beanAgentGroupGettingNameNrr ds JSP");
					beanAgentGroup.BuildDetailsNotReadyReasonForPeriod(groupId,reportType,startingDate,endingDate);
					System.out.println("fin BuildDetailsNotReadyReasonForPeriod ds JSP");	
					
								
					if(sret == "success")
					{
						mapNRR = (HashMap)beanAgentGroup.mapNrr;
						%>
						<%@ include file="groupReportsUnAnsweredDetails.jsp" %>
						<%
					}
			    } //fin for
			}	
		%>
		</fieldset>	
	</div>
	
			
	<div class="tab-page" id="tabPage3">
		<h2 class="tab"><%= page1Data.getWord("Statistics")%></h2>		
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) ); 			 		</script>
		<fieldset>
	    <%
			for(int obj =0; obj < numObjects; obj++ )
			{
				group =tabObj[obj];
				tokGrp = new java.util.StringTokenizer(group,",");
				groupName =tokGrp.nextToken();
				groupId = tokGrp.nextToken();
				System.out.println("---groupName : " + groupName + "---groupId : " + groupId);	

				sret = beanAgentGroup.buildGroupGlobalInfosForPeriod(groupId,reportType,startingDate,endingDate);
				 if(sret == "success")
				 {
					groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.globalInfo;
					%>
					<%@ include file="groupReportsStat.jsp" %>
					<%
				}
			}
		%>
		</fieldset>	
	</div>
</form>
</div>
<script type="text/javascript">
	setupAllTabs();
</script>
<%
}
%>
</body>
</html>
<% page1Data.closeConnection(); %>
