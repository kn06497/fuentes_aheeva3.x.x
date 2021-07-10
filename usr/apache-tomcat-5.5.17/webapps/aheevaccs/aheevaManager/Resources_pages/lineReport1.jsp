<html>

<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<LINK href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<%@ include file="xc2_default_labels.jsp" %>
<!-- Start Tab pane -->
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
/*	height:		200px;*/
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {
	/*background:	ThreeDFace;*/
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
</style>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<!-- End Tab Pane -->
<!-- Calendrier début -->
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->
<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script>

var vValue = normalizeString(QueryString('type'));
//var tenant_dbid = normalizeString(QueryString('tenant_dbid'));
//alert("vValue"+vValue);

function getRequestedReport()
{

	var destination = '';
	
	if(document.theForm.startingDateDaily.value.length == 0)
		{
			alert("<%= pageData.getWord("Please enter a starting date")%>");
			return false;
		}
	if(document.theForm.endingDateDaily.value.length == 0)
	{
		alert("<%= pageData.getWord("Please enter an ending date")%>");
		return false;
	}
	
	var startDate = new Date(document.theForm.startingDateDaily.value);
	var endDate =new Date(document.theForm.endingDateDaily.value);
	
	if(endDate < startDate)
	{
		alert("<%= pageData.getWord("Your ending date cannnot be smaller than your starting date")%>");
		return false;
	}
	if( ( (endDate.getTime() - startDate.getTime()) / (24*3600*1000) ) > 31)
	{
		alert("<%= pageData.getWord("range is greater than 31 days")%>");
		return false;
	}
	
	destination = "../jsp/lineReports.jsp"
	destination += "?lang="+lang;
	destination += "&startingDateDaily="
	destination += document.theForm.startingDateDaily.value;
	
	destination +="&endingDateDaily=";
	destination += document.theForm.endingDateDaily.value;	

	window.open(destination);
}
</script>
<style type="text/css">
<!--
.style1 {
    font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>

<body class="rep_body">
	<div class="tab-pane" id="tabPane1">
		<form name="theForm">
			<script type="text/javascript">
				tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
			</script>
			<div class="tab-page" id="tabGeneral">
				<fieldset>
				<legend id="caption">
					<script language="JavaScript">
						var vValue = normalizeString(QueryString('type'));
						document.write("<%= pageData.getWord("Line usage details")%>");
			/*
			if (vValue == 'GroupForecast'){
			  document.write(MultiArray["Group Forecast Daily Report"][lang])
			}
			else if( vValue=='GroupSummary' )
			{
				document.write(MultiArray["Group Summary Report"][lang])
			} */
					</script>
				</legend>
					<table width="100%">
						<tr>
							<td width="100%">
								<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse; margin-top:10px"  width="70%">
									<tr>
										<td id="id_startingDateDaily" valign="top" width="50%" style="border-left-style:none; border-left-width:1; border-bottom-style:none; border-bottom-width:1">&nbsp;&nbsp;&nbsp;
		<%= pageData.getWord("The report cannot be generated for a date range greater than 31 days.")%>
		&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td height="20">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="100%">
								<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="100%" align="left">
  									<tr>
										<td id="id_startingDateDaily" valign="top" width="50%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1">
											&nbsp;&nbsp;&nbsp;
											<%= pageData.getWord("From")%>&nbsp;&nbsp;&nbsp;
											<input type="text" size="20" onFocus="showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()" name="startingDateDaily" />
										</td>
										<td id="id_endingDateDaily" valign="top" width="50%" style="border-bottom-style: none; border-bottom-width: 1" align="left">&nbsp;&nbsp;&nbsp;
											<%= pageData.getWord("To")%>&nbsp;&nbsp;&nbsp;
											<input type="text" size="20" onFocus="showCalendar('',this,this,'','id_endingDateDaily',0,30,1);this.blur()" name="endingDateDaily" />
										</td>
   									</tr>
   									<tr>
										<td height="20">&nbsp;</td>
									</tr>
									<tr>
										<td>
	  										<input type="button" value='<%= pageData.getWord("Submit")%>' onClick="getRequestedReport()">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
		</form>
	</div>
	
</body>
<% pageData.closeConnection(); %>
</html>