<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.reports.*"%>

<head>
<title>AheevaCCS - Queue Reports</title>
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
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>

<jsp:useBean id="beanQueue" scope="request" class="aheevaManager.reports.beanQueueReport" />
</head>
<body>
<%
	String language =request.getParameter("lang");
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
	
%>
<div class="img-control">
<table align="right" border="0" width="25%" >
	<tr valign="top">
		<td width="25%" align="center">
			<form>
				<button type="button" style="border:none; background:none; cursor:hand;" onClick="window.open('printQueueReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(queues) ;%>&prec=<% out.write(prec) ;%>&suiv=<% out.write(suiv) ;%>&current=<% out.write(current) ;%>&all_obj=<% out.write(all_obj) ;%>&from=<% out.write("queueReport") ;%>&lang=<% out.write(language); %>')"><img src="../img/printer.gif" border="0"></button>
			</form>
		</td>
	<%
		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="queueReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(queues) ;%>&prec=<% out.write(new_prec) ;%>&suiv=<% out.write(current) ;%>&current=<% out.write(prec) ;%>&all_obj=0&lang=<% out.write(language); %>" ><b><script>document.write(MultiArray["Previous"][lang])</script></b></a>		</td>
	<%
	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	%>
		<td width="25%" align="center">
		<a href="queueReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(queues) ;%>&prec=-1&suiv=1&current=0&all_obj=1&lang=<% out.write(language); %>" ><b><script>document.write(MultiArray["All"][lang])</script></b></a>
		</td>
	<%
	}
	String nb_obj = Integer.toString(numObjects);
	//System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="queueReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(queues) ;%>&prec=<% out.write(current) ;%>&suiv=<% out.write(new_suiv) ;%>&current=<% out.write(suiv) ;%>&all_obj=0&lang=<% out.write(language); %>" ><b><script>document.write(MultiArray["Next"][lang])</script></b></a>
		</td>
	<%
	}
	%>
	</tr>
</table>
</div>
<%
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
	%>
<div class="tab-pane" id="tabPane1">	
<form name="queueReports">
	<script type="text/javascript">
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabPage1">
		<h2 class="tab"><script>document.write(MultiArray["General data"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );  			 		
		</script>
		<fieldset>
	    <%
			if(sret == "success")
			 {
				%>
				<%@ include file="queueReportsDetails.jsp" %>
				<%
			 }
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage2">
		<h2 class="tab"><script>document.write(MultiArray["Percentages"][lang])</script></h2>		
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );
		</script>
		<fieldset>
	    <%
			if(sret == "success")
			 {
				%>
				<%@ include file="queueReportsPercent.jsp" %>
				<%
			}
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage3">
		<h2 class="tab"><script>document.write(MultiArray["Statistics"][lang])</script></h2>		
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) );
		</script>
		<fieldset>
	    <%
			
			 sret = beanQueue.buildGlobalQueueReportForPeriod(queue,startingDate,endingDate,reportType);
			 if(sret == "success")
			 {
				%>
				<%@ include file="queueReportsStat.jsp" %>
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
else //all
{
	%>
<div class="tab-pane" id="tabPane1">	
<form name="queueReports">
	<script type="text/javascript">
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	<div class="tab-page" id="tabPage1">
		<h2 class="tab"><script>document.write(MultiArray["Data"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );  			 		
		</script>
		<fieldset>
	    <%
			for(int obj =0; obj < numObjects; obj++ )
			{
				queue = tabObj[obj];
				queueInfo = null;
				sret = beanQueue.buildQueueReportForPeriod(queue,startingDate,endingDate,reportType);
				if(sret == "success")
				 {
					%>
					<%@ include file="queueReportsDetails.jsp" %>
					<%
				 }
			 }
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage2">
		<h2 class="tab"><script>document.write(MultiArray["Percentages"][lang])</script></h2>		
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );
		</script>
		<fieldset>
	    <%
			for(int obj =0; obj < numObjects; obj++ )
			{
				queue = tabObj[obj];
				queueInfo =null;
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
					<%@ include file="queueReportsPercent.jsp" %>
					<%
				}
			}
		%>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabPage3">
		<h2 class="tab"><script>document.write(MultiArray["Statistics"][lang])</script></h2>		
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) );
		</script>
		<fieldset>
	    <%
			for(int obj =0; obj < numObjects; obj++ )
			{
				queue = tabObj[obj];
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