<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>
<%@page import ="java.text.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.wfm.*"%>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageForecastData = new beanManagerData();
pageForecastData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageForecastData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<head>
<title>AheevaCCS - Agent Group Forecast Report1</title>
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
%>
<div class="img-control">
<table align="right" border="0" width="25%" cellpadding="0" cellspacing="0">
	<tr valign="top">
		<td width="25%" align="center">
			<button type="button" style="border:none; background:none; cursor:hand;" onClick="window.open('printGroupForecastReport.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&objects=<%out.write(groups) ;%>&prec=<% out.write(prec);%>&suiv=<% out.write(suiv);%>&current=<% out.write(current);%>&all_obj=<% out.write(all_obj);%>&interval=<%out.write(interval);%>&lang=<%out.write(language);%>')"><img src="../img/printer.gif" border="0"></button>
		</td>
	<%
		String new_suiv = Integer.toString((Integer.parseInt(suiv)+1));
		String new_prec = Integer.toString((Integer.parseInt(prec)-1));
	if(prec.compareTo("-1") !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="50%" align="center">
		<a href="groupForecastReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&objects=<%out.write(groups) ;%>&prec=<% out.write(new_prec) ;%>&suiv=<% out.write(current);%>&current=<% out.write(prec);%>&interval=<%out.write(interval);%>&all_obj=0&lang=<%out.write(language); %>" ><%= pageForecastData.getWord("Previous")%></a>		</td>
	<%
	}
	String nb_obj = Integer.toString(numObjects);
	if(suiv.compareTo(nb_obj) !=0 && all_obj.compareTo("0") ==0)
	{	
	%>
		<td width="50%" align="center">
		<a href="groupForecastReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&objects=<%out.write(groups) ;%>&prec=<% out.write(current) ;%>&suiv=<% out.write(new_suiv) ;%>&current=<% out.write(suiv) ;%>&interval=<%out.write(interval);%>&all_obj=0&lang=<%out.write(language); %>" ><%= pageForecastData.getWord("Next")%></a>
		</td>
	<%
	}
	%>
	</tr>
</table>
<!--<table width="100%"><tr><td width="100%" height="30"></td></tr></table>-->
</div>
<div class="tab-pane" id="tabPane1">	
<form name="groupForecastReports">
	<div class="tab-page" id="tabPage1">
	<fieldset><%
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
	</fieldset>	
	</div>
</form>
</div>
</body>
</html>
<% pageForecastData.closeConnection(); %>
