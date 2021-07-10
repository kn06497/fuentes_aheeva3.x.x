<%
/**
 * @Author FM L'Heureux
 * @Date 2007-08-09
 * @Version 0.1
 * @Description The purpose of this page is to display a commission report
 * 
 *
 */
%>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pagereppData = new beanManagerData();
pagereppData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagereppData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Language" content="en-us">
<link rel=stylesheet href="xc2_default.css" type="text/css">




<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {
/*	background:	ThreeDFace; */

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

a{
	color="#000000";
	 text-decoration:underline;
}
</style>
<%@ include file="mopFunctions_labels.jsp" %>
<%@ include file="xc2_default_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="mopFunctions.js"></script>
<script language="javascript" type="text/javascript" src="xc2_default.js"></script>
<script language="javascript" type="text/javascript">
	xcAutoHide=1000;
	xcDateFormat="YYYY-MM-DD";
</script>
<script language="javascript" type="text/javascript" src="xc2_inpage.js"></script>

<script language="javascript" type="text/javascript">

var easter_count = 0;
function easter(){
	easter_count ++;
	if(easter_count > 10){
		alert("You have found an 'ex'easter egg!");
		easter_count = 0;
		//document.location = "http://www.patate.com";
	}
}
</script>
</head>

<body class="rep_body">
<%
	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	String query;
	String lineClassStr;
	ResultSet rs;
	int lineNum;
	int line;	
	
	//check post
	if(request.getParameter("campaignId") != null && request.getParameter("start") != null && request.getParameter("end") != null){
		if(request.getParameter("campaignId").indexOf("'") != -1 || request.getParameter("campaignId").indexOf('"') != -1){
			%><script type='text/javascript'>alert("Internal Error");</script><%
		} else if(request.getParameter("start").indexOf("'") != -1 || request.getParameter("start").indexOf('"') != -1 || request.getParameter("start").length() == 0){
			%><script type='text/javascript'>alert("Invalid start date");</script><%
		} else if(request.getParameter("end").indexOf("'") != -1 || request.getParameter("end").indexOf('"') != -1 || request.getParameter("end").length() == 0){
			%><script type='text/javascript'>alert("Invalid number of days");</script><%
		} else{//open the report in a new page
			String openStr = "cmp_commission_report2.jsp?id=" + request.getParameter("campaignId") + "&start=" + request.getParameter("start") + "&end=" + request.getParameter("end");
			%><script type='text/javascript'>window.open("<%= openStr %>&lang=" + lang);</script><%
		}
	}
%>

<div class="tab-pane" id="tabPane1">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
/*articleMenu.add(new WebFXMenuItem("Look &amp; Feel", "javascript:showArticleTab( \"looknfeel\" )"));*/
</script>
	<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><%= pagereppData.getWord("General")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<fieldset>
			<legend><%= pagereppData.getWord("General settings")%></legend>
					
				Choose a campaign
				<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
				<tr>
					<td></td>
					<td align="center"><strong><%= pagereppData.getWord("Choose")%></strong></td>
					<td align="center"><strong><%= pagereppData.getWord("Name")%></strong></td>
					<td align="center" onclick="easter();"><strong>Description</strong></td>
				</tr>
				<form name='cmp_chooser' method='post'>
				<%
				query = "SELECT dbid, name, description FROM cfg_campaign";
				rs = pageData.executeFromString(query);
				lineNum = 0;
				line = 1;
				try{
					while(rs.next()){
						lineNum = (lineNum + 1) % 2;
						if(lineNum == 0) lineClassStr = "reportsRowPair";
						else lineClassStr = "reportsRowUnPair";
						out.println("<tr class='" + lineClassStr + "' >");
						out.println("<td>" + line  + "</td>");
						out.println("<td align='center'><input type='radio' name='campaignId' value='" + rs.getString(1) + "' />");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("</tr>");
						line ++;
					}
				} catch(Exception e){
					out.println("SQL rs error --- " + query);
					e.printStackTrace();
				}
				
			%>
				<tr>
					<td colspan='4' align='center'>
						<table><tr>
							<td id='cal1'><%= pagereppData.getWord("Begin")%>:<input type='text' name='start' onfocus="showCalendar('', this, this, '', 'cal1', 0,30, 1)" size='10' /></td>
							<td id='cal2'><%= pagereppData.getWord("End2")%>:<input type='text' name='end' onfocus="showCalendar('', this, this, '', 'cal2', 0,30, 1)" size='10' /></td>
						</tr></table></td>
				<tr>
					<td colspan='4' align='center'><input type='submit' value='<%= pagereppData.getWord("Display")%>' /></td>
				</tr>
			</table>
		</fieldset>
	</div>
</body>
</html>
<%pagereppData.closeConnection(); %>
