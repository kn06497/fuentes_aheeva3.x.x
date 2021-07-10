<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import ="java.io.*"%>
<%@page import = "java.io.File" %>
<%@page import = "java.io.RandomAccessFile" %>
<%@page import = "java.io.FileNotFoundException" %>
<%@page import = "java.io.IOException" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<head>
<title>AheevaCCS - Adherence Reports1</title>
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
<jsp:useBean id="beanAgent" scope="request" class="aheevaManager.schedule.beanAdherenceReport" />
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
    String agents       = request.getParameter("objects");	
    String agtGroup      = request.getParameter("agtGrp");	
  	String orderBy 		 = request.getParameter("order");

    StringTokenizer tok = null;
	String[] tabObj =null;
	String sRet ="";
	
	String startingDate="", endingDate="";	
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

	String groups ="";
	String agentGroupTemp ="";
	 beanAdherenceDetails r1=null;
	int numCampaigns =0;
	
	//all groups
	if(agtGroup != null && agtGroup.substring(0,9).compareTo("AllGroups") == 0)
	{
		groups = agtGroup.substring(10);
		if(groups != null)
        	tok = new java.util.StringTokenizer(groups,"!");
    	else
        	tok = new java.util.StringTokenizer("","/");
		numCampaigns = tok.countTokens();
		tabObj =new String[numCampaigns];
		for (int w =0; w < numCampaigns; w++)
		{
			tabObj[w] = tok.nextToken();
		}	
		agentGroupTemp = tabObj[Integer.parseInt(current)];
	
    }
	if(agentGroupTemp.length() ==0) //one group
	{
		agentGroupTemp =agtGroup;
	}
	
%>
<div class="img-control">
<table align="right" border="0" width="25%" cellpadding="0" cellspacing="0">
	<tr valign="top">
	<%
		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0 && agents.compareTo("AllAgents")== 0 && agtGroup.substring(0,9).compareTo("AllGroups") == 0)
	{	
	%>
		<td width="33%" align="center"><a href="adherenceReport1.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(agents);%>&agtGrp=<%out.write(agtGroup);%>&order=<%out.write(orderBy);%>&prec=<% out.write(new_prec) ;%>&suiv=<% out.write(current) ;%>&current=<% out.write(prec) ;%>&all_obj=0&lang=<%out.write(language); %>" ><%= pageData.getWord("Previous")%></a>		</td>
	<%
	}
	if(numCampaigns >1 && all_obj.compareTo("0") ==0 && agents.compareTo("AllAgents")== 0 && agtGroup.substring(0,9).compareTo("AllGroups") == 0)
	{
	%>
		<td width="33%" align="center">
		<a href="adherenceReport1.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(agents) ;%>&agtGrp=<%out.write(agtGroup);%>&order=<%out.write(orderBy);%>&prec=-1&suiv=1&current=0&all_obj=1&lang=<%out.write(language); %>" ><%= pageData.getWord("All")%></a>
		</td>
	<%
	}
	String nb_obj = Integer.toString(numCampaigns);
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0 && agents.compareTo("AllAgents")== 0 && agtGroup.substring(0,9).compareTo("AllGroups") == 0)
	{	
	%>
		<td width="33%" align="center">
		<a href="adherenceReport1.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ;%>&starting_year_yearly=<%out.write(starting_year_yearly) ;%>&ending_year_yearly=<%out.write(ending_year_yearly) ;%>&starting_month_monthly=<%out.write(starting_month_monthly) ;%>&starting_year_monthly=<%out.write(starting_year_monthly) ;%>&ending_month_monthly=<%out.write(ending_month_monthly) ;%>&ending_year_monthly=<%out.write(ending_year_monthly) ;%>&reportType=<%out.write(reportType) ;%>&objects=<%out.write(agents) ;%>&agtGrp=<%out.write(agtGroup);%>&order=<%out.write(orderBy);%>&prec=<% out.write(current) ;%>&suiv=<% out.write(new_suiv) ;%>&current=<% out.write(suiv) ;%>&all_obj=0&lang=<%out.write(language); %>" ><%= pageData.getWord("Next")%></a>
		</td>
	<%
	}
	%>
	</tr>
</table>
</div>

<div class="tab-pane" id="tabPane1">	
<form name="loginReports">
	<div class="tab-page" id="tabPage1">
	<fieldset>
<%
String agt_full_name ="";
if(all_obj.compareTo("0")==0) // un campaign
{    
	if(agents.compareTo("AllAgents")!= 0)
	{
		sRet = beanAgent.getAdherence(agents,startingDate,endingDate,reportType, "agent",orderBy);
		agt_full_name =beanAgent.getAgentFullName(agents);
	}
	else //all Agent
	{
		sRet = beanAgent.getAdherence(agentGroupTemp,startingDate,endingDate,reportType, "group",orderBy);
		//getAdherenceForGroup(agentGroupTemp,startingDate,endingDate,reportType);
	}
	
	if(sRet == "success")
	{
	    System.out.println("sRet == success");
		%>
		<%@ include file="adherenceReportsDetails.jsp" %>
		<%
	}
	else
		System.out.println("sRet no success");

}
else if(agtGroup.substring(0,9).compareTo("AllGroups") == 0)
{
	for(int w =0; w < numCampaigns ; w ++)
	{
		agentGroupTemp = tabObj[w];
		sRet = beanAgent.getAdherence(agentGroupTemp,startingDate,endingDate,reportType, "group",orderBy);
		if(sRet == "success")
		{
			System.out.println("sRet == success");
			%>
			<%@ include file="adherenceReportsDetails.jsp" %>
			<%
		}
		else
		System.out.println("sRet --------------"+sRet);
	}

}
%>	
		</fieldset>	
	</div>
</form>
</div>
</body>
</html>

<% pageData.closeConnection(); %>
