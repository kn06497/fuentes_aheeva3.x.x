<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>

<head>
<title>AheevaCCS - Campaign Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		auto;
}
html, body {
	background:	#E1F4FF;
}
form {
	margin:		40px;
	padding:	0;
}
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


<jsp:useBean id="beanCampaign" scope="request" class="aheevaManager.reports.beanCallingListReport" />
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
    String campaigns       = request.getParameter("objects");
    String startingDate="";
    String endingDate="", sRet ="";
	String[] tabObj =null;
	beanCallingListDetails r1 =null;
	
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


    StringTokenizer tok = null;
    if(campaigns != null){
        tok = new java.util.StringTokenizer(campaigns,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
	int numObjects = tok.countTokens();
	tabObj =new String[numObjects];
	for (int w =0; w < numObjects; w++)
	{
		tabObj[w] = tok.nextToken();
	}

	String c_campaign ="";
%>
<div class="img-control">
<table align="right" border="0" width="25%" cellpadding="0" cellspacing="0">
	<tr valign="top">
		<td width="25%" align="center">
			<button type="button" style="border:none; background:none; cursor:hand;" onClick="window.open('printCampaignReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(campaigns) ;%>&prec=<% out.write(prec) ;%>&suiv=<% out.write(suiv) ;%>&current=<% out.write(current) ;%>&all_obj=<% out.write(all_obj) ;%>&from=<% out.write("callingListReport") ;%>&lang=<% out.write(language); %>')"><img src="../img/printer.gif" border="0"></button>
		</td>
	<%
		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="campaignReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(campaigns) ;%>&prec=<% out.write(new_prec) ;%>&suiv=<% out.write(current) ;%>&current=<% out.write(prec) ;%>&all_obj=0&lang=<%out.write(language); %>" ><script>document.write(MultiArray["Previous"][lang])</script></a>		</td>
	<%
	}
	if(numObjects >1 && all_obj.compareTo("0") ==0)
	{
	%>
		<td width="25%" align="center">
		<a href="campaignReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(campaigns) ;%>&prec=-1&suiv=1&current=0&all_obj=1&lang=<%out.write(language); %>" ><script>document.write(MultiArray["All"][lang])</script></a>
		</td>
	<%
	}
	String nb_obj = Integer.toString(numObjects);
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="25%" align="center"><a href="campaignReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(campaigns) ;%>&prec=<% out.write(current) ;%>&suiv=<% out.write(new_suiv) ;%>&current=<% out.write(suiv) ;%>&all_obj=0&lang=<%out.write(language); %>" ><script>document.write(MultiArray["Next"][lang])</script></a>
		</td>
	<%
	}
	%>
	</tr>
</table>
</div>
<div class="tab-pane" id="tabPane1">	
<form name="campaignReports">
	<div class="tab-page" id="tabPage1">
	<fieldset>
<%
System.out.println("debut form");
if(all_obj.compareTo("0")==0) // un campaign
{
	System.out.println("debut form");
	c_campaign = tabObj[Integer.parseInt(current)];
    sRet=beanCampaign.buildCampaignReportForPeriod(c_campaign,startingDate,endingDate,reportType);
 	if(sRet == "succes")
	{
		%>
		<%@ include file="campaignReportsDetails.jsp" %>
		<%
	}
}
else
{
	for(int obj =0; obj < numObjects; obj++ )
	{
		c_campaign = tabObj[obj];
		r1 = null;
    	sRet=beanCampaign.buildCampaignReportForPeriod(c_campaign,startingDate,endingDate,reportType);
		if(sRet == "succes")
		 {
			%>
			<%@ include file="campaignReportsDetails.jsp" %>
			<%
		}
	} //fin for
}
%>	
		</fieldset>	
	</div>
</form>
</div>
</body>
</html>

