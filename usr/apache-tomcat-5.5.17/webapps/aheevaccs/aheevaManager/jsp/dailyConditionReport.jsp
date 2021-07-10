<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.reports.*"%>
<%@page import = "aheevaManager.ressources.*" %>

<head>
<title>AheevaCCS - Staffing daily condition report</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />

<style type="text/css">

.dynamic-tab-pane-control .tab-page {
	height:		auto;
	/*width:      550px;*/
}

html, body {
	background:	#E1F4FF;
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

<jsp:useBean id="beanDailyCondition" scope="request" class="aheevaManager.reports.beanDailyConditionReport" />
</head>
<body>
<%
	beanManagerData pageDataAgent = new beanManagerData();
	pageDataAgent.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageDataAgent.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

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
	
%>
<div class="img-control">
<table align="right" border="0" width="25%" cellpadding="0" cellspacing="0">
	<tr valign="top">
		<td width="25%" align="center">
			
				<button type="button" style="border:none; background:none; cursor:hand;" onClick="window.open('printDailyConditionReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&objects=<%out.write(queues) ;%>&prec=<% out.write(prec) ;%>&suiv=<% out.write(suiv) ;%>&current=<% out.write(current) ;%>&all_obj=<% out.write(all_obj) ;%>&lang=<% out.write(language); %>')"><img src="../img/printer.gif" border="0"></button>
			
		</td>
	<%
		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="50%" align="center">
		<a href="dailyConditionReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&objects=<%out.write(queues) ;%>&prec=<% out.write(new_prec) ;%>&suiv=<% out.write(current) ;%>&current=<% out.write(prec) ;%>&all_obj=0&lang=<%out.write(language); %>" ><%=pageDataAgent.getWord("Previous")%></a>		</td>
	<%
	}
	String nb_obj = Integer.toString(numObjects);
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="50%" align="center">
		<a href="dailyConditionReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&objects=<%out.write(queues) ;%>&prec=<% out.write(current) ;%>&suiv=<% out.write(new_suiv) ;%>&current=<% out.write(suiv) ;%>&all_obj=0&lang=<%out.write(language); %>" ><%=pageDataAgent.getWord("Next")%></a>
		</td>
	<%
	}
	%>
	</tr>
</table>
</div>

	
<div class="tab-pane" id="tabPane1">	
<form name="groupForecastReports">
	<div class="tab-page" id="tabPage1">
	 <fieldset> 
	<%
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
}	%>
	 </fieldset> 	
	</div>
</form>
</div>
</body>
</html>
<%
pageDataAgent.closeConnection();
%>