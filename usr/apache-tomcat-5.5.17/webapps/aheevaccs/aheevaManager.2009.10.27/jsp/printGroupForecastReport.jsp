<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>
<head>
<title>AheevaCCS - Print Agent Group Forecast Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>

<jsp:useBean id="beanGroupForecast" scope="request" class="aheevaManager.reports.beanForecastReport" />
</head>
<body>

<%
	String language =request.getParameter("lang");
	String prec =request.getParameter("prec");
	String suiv =request.getParameter("suiv");
	String current =request.getParameter("current");
	String all_obj=request.getParameter("all_obj");
    String groups  = request.getParameter("objects");
	String startingDateDaily = request.getParameter("startingDateDaily");
	String spacing =request.getParameter("spacing");
	String interval=request.getParameter("interval");
	String[] tabObj =null;
    StringTokenizer tok = null, tokGrp =null;
	
	System.out.println("---LOLO===== : " + interval);	
   
	String startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) ;
	String from ="";
    if(groups != null)
	{
        tok = new java.util.StringTokenizer(groups,"/");
    }
	else{
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
	String  sret="";   
	if(all_obj.compareTo("0")==0) // un group
	{
		group =tabObj[Integer.parseInt(current)];
		tokGrp = new java.util.StringTokenizer(group,",");
		groupName =tokGrp.nextToken();
		groupId = tokGrp.nextToken();
	}	
	beanForecastInfos r1=null;
	beanForecastInfos r2=null;

if(all_obj.compareTo("0")==0) // one group 
{
	sret = beanGroupForecast.buildForecastForPeriod(groupId,startingDate);

System.out.println("all_obj==0");
	if(sret == "success")
	{
		System.out.println("sret == success");
		%>
		<%@ include file="groupForecastReportsDetails.jsp" %>
		<% 
	}
}	%>

</body>
</html>

