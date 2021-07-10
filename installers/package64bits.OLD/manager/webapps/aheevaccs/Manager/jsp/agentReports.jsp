<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="com.mysql.jdbc.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="Manager.reports.*"%>

<head>
<title>AheevaCCS - Agent Reports</title>
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

<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));

</script>

<jsp:useBean id="beanAgent" scope="request" class="Manager.reports.beanAgentGlobalInfoReport" />
<jsp:useBean id="beanAgentDetail" scope="request" class="Manager.reports.beanAgentDetailsInfoReport" />

</head>
<body>

<%

	String language =request.getParameter("lang");
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
	String detail =request.getParameter("detail");
	//String viewFirst =request.getParameter("viewFirst");
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
	String starting_year_yearly = request.getParameter("starting_year_yearly");
	String ending_year_yearly = request.getParameter("ending_year_yearly");
	String starting_month_monthly = request.getParameter("starting_month_monthly");
	String starting_year_monthly = request.getParameter("starting_year_monthly");
	String ending_month_monthly = request.getParameter("ending_month_monthly");
	String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String agents       = request.getParameter("objects");
	String[] tabObj =null;
    StringTokenizer tok = null;
    beanAgentGlobalInfo agentInfo = null;
	String from ="";
    if(agents != null){
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
	String agentId ="";
	
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
				<button type="button" style="border:none; background:none; cursor:hand;" onClick="window.open('printAgentReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&detail=<%out.write(detail) ;%>&objects=<%out.write(agents) ;%>&prec=<% out.write(prec) ;%>&suiv=<% out.write(suiv) ;%>&current=<% out.write(current) ;%>&all_obj=<% out.write(all_obj) ;%>&from=<% out.write("agentReport") ;%>&lang=<% out.write(request.getParameter("lang")); %>')"><img src="../img/printer.gif" border="0"></button>
			</form>
		</td>
	
	<%
	
		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="agentReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&detail=<%out.write(detail) ;%>&objects=<%out.write(agents) ;%>&prec=<% out.write(new_prec) ;%>&suiv=<% out.write(current) ;%>&current=<% out.write(prec) ;%>&all_obj=0&lang=<%out.write(language); %>" ><script>document.write(MultiArray["Preview"][lang])</script></a>		</td>
	<%
	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	%>
		<td width="25%" align="center">
		<a href="agentReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&detail=<%out.write(detail) ;%>&objects=<%out.write(agents) ;%>&prec=-1&suiv=1&current=0&all_obj=1&lang=<%out.write(language); %>" ><script>document.write(MultiArray["All"][lang])</script></a>
		</td>
	<%
	}
	String nb_obj = Integer.toString(numObjects);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="agentReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&detail=<%out.write(detail) ;%>&objects=<%out.write(agents) ;%>&prec=<% out.write(current) ;%>&suiv=<% out.write(new_suiv) ;%>&current=<% out.write(suiv) ;%>&all_obj=0&lang=<%out.write(language); %>" ><script>document.write(MultiArray["Next"][lang])</script></a>
		</td>
	<%
	}
	%>
	</tr>
</table>
</div>
<%
if(all_obj.compareTo("0")==0) // pour un agent
{
	agentId =tabObj[Integer.parseInt(current)];
	if(detail.compareTo("0")==0)
	{
		sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
	}
	if(detail.compareTo("1")==0)
	{
		sret = beanAgentDetail.buildAgentDetailsInfosForPeriod(agentId,reportType,startingDate,endingDate);
		beanAgentDetail.beanAgentDetailsGettingNameNrr(agentId,reportType,startingDate,endingDate);
		beanAgentDetail.BuildNotReadyReasonForPeriod(agentId,reportType,startingDate,endingDate);	
	}
	if(sret == "success")
		agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
%>
<div class="tab-pane" id="tabPane1">
<form name="agentReports">
	<script type="text/javascript">
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabPage1">
		<h2 class="tab"><script>document.write(MultiArray["Answered"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );  			 		</script>
		<fieldset>
		<%
			if(detail.compareTo("0")==0) // rapport non detaille
			{
				if(sret == "success")
				 {
					%>
					<%@ include file="agentReportsAnswered.jsp" %>
					<%
				}
			}
			if(detail.compareTo("1")==0) // rapport  detaille
			{
				if(sret == "success")
				 {
				%>
				<%@ include file="agentReportsAnsweredDetails.jsp" %>
				<%
			 	}
			}
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage2">
		<h2 class="tab"><script>document.write(MultiArray["Unanswered"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );		 		</script>
		<fieldset>
	    <%
			if(detail.compareTo("0")==0) // rapport non detaille
			{
				if(sret == "success")
				 {
					%>
					<%@ include file="agentReportsUnAnswered.jsp" %>
					<%
				}
			}
			if( detail.compareTo("1")==0) // rapport detaille
			{
				HashMap mapNRR = (HashMap)beanAgentDetail.mapNrr;
				if(sret == "success")
				{
					%>
					<%@ include file="agentReportsUnAnsweredDetails.jsp" %>
					<%
				}
			}
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage3">
		<h2 class="tab"><script>document.write(MultiArray["Statistics"][lang])</script></h2>		
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) ); 			 		</script>
		<fieldset>
	    <%
			sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
			 if(sret == "success")
			 {
				agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;	
				%>
				<%@ include file="agentReportsStat.jsp" %>
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
else // tous les agents selectionnes
{

%>
<div class="tab-pane" id="tabPane1">
<form name="agentReports">
	<script type="text/javascript">
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabPage1">
		<h2 class="tab"><script>document.write(MultiArray["Answered"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );  			 		</script>
		<fieldset>
	    <%
			
			if(detail.compareTo("0")==0) // non non detaille
			{
				for(int obj =0; obj < numObjects; obj++ )
				{
					agentId = tabObj[obj];
					agentInfo = null;
					sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
					if(sret == "success")
					 {
						agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;						
						%>
						<%@ include file="agentReportsAnswered.jsp" %>
						<%
					}
			    } //fin for
			}	
			if(detail.compareTo("1")==0) // rapport detaille
			{
				for(int obj =0; obj < numObjects; obj++ )
				{
					agentId = tabObj[obj];
					agentInfo = null;
					sret = beanAgentDetail.buildAgentDetailsInfosForPeriod(agentId,reportType,startingDate,endingDate);
					if(sret == "success")
					{
						//agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;	
						%>
						<%@ include file="agentReportsAnsweredDetails.jsp" %>
						<%
					}
			    } //fin for
			}	
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage2">
		<h2 class="tab"><script>document.write(MultiArray["Unanswered"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );		 		</script>
		<fieldset>
	    <%
			if(detail.compareTo("0")==0) // rapport non detaille
			{
				for(int obj =0; obj < numObjects; obj++ )
				{
					agentId = tabObj[obj];
					agentInfo = null;
					sret =beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
					if(sret == "success")
					 {
						agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
						%>
						<%@ include file="agentReportsUnAnswered.jsp" %>
						<%
					}
			    } //fin for
			}
			if( detail.compareTo("1")==0) // rapport detaille
			{
				HashMap mapNRR = new HashMap();					
				for(int obj =0; obj < numObjects; obj++ )
				{
					agentId = tabObj[obj];
					agentInfo = null;
					mapNRR.clear();				
					sret =beanAgentDetail.buildAgentDetailsInfosForPeriod(agentId,reportType,startingDate,endingDate);
					beanAgentDetail.beanAgentDetailsGettingNameNrr(agentId,reportType,startingDate,endingDate);
					beanAgentDetail.BuildNotReadyReasonForPeriod(agentId,reportType,startingDate,endingDate);	
					if(sret == "success")
					{
						//agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;
						mapNRR = (HashMap)beanAgentDetail.mapNrr;	
						%>
						<%@ include file="agentReportsUnAnsweredDetails.jsp" %>
						<%
					}
			    } //fin for
			}	
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage3">
		<h2 class="tab"><script>document.write(MultiArray["Statistics"][lang])</script></h2>		
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) ); 			 		</script>
		<fieldset>
	    <%
			for(int obj =0; obj < numObjects; obj++ )
			{
				agentId = tabObj[obj];
				agentInfo = null;
				//System.out.println("OBJ  : " +obj+ "-------Agent ID "+agentId+"\n"); 
				sret = beanAgent.buildAgentGlobalInfosForPeriod(agentId,reportType,startingDate,endingDate);
				 if(sret == "success")
				 {
					agentInfo = (beanAgentGlobalInfo)beanAgent.globalInfo;	
					%>
					<%@ include file="agentReportsStat.jsp" %>
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
