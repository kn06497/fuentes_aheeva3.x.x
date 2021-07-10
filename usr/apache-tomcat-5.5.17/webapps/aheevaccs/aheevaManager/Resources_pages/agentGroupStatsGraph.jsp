<%@ page contentType="text/html; charset=iso-8859-1"%>
<%@page import ="aheevaManager.ressources.*"%>
<%beanManagerData pageGrpsData = new beanManagerData();
pageGrpsData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageGrpsData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Language" content="en-us">
<%@ include file="agentGroupFunctions_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="agentGroupFunctions.js"></script>
<script language="javascript" type="text/javascript">

var sTring = String( appletObj.getAgentGroupsStats( normalizeString(QueryString('grpName')) ) );
sTringArray = sTring.split(",");

var grp_Name 		= sTringArray[0];
var grpCallHandled 	= sTringArray[1];
var grpCallInbound 	= sTringArray[2];
var grpCallOutbound = sTringArray[3];
var grpLoginAgents 	= sTringArray[4];
var grpTotalNotReady= sTringArray[5];
var grpTotalReady 	= sTringArray[6];
var grpTotalWaiting = sTringArray[7];
var grpTotalWrapUp 	= sTringArray[8];
var grpTotalDialing = sTringArray[9];
var grpTotalHold	= sTringArray[10];
var grpTotalConference = sTringArray[11];
</script>

</head>
<body>
<fieldset>
		<legend><%=pageGrpsData.getWord("Statistics")%></legend>
		<table border="0">
			<tr>
				<td>
					<!-- table width="450" style="BORDER-RIGHT:#000000 1px solid; BORDER-TOP:#000000 1px solid; BORDER-LEFT:#000000 1px solid; BORDER-BOTTOM:#000000 1px solid; BACKGROUND-COLOR:#ffffff" -->
					<table border="0">
						<tr style="BACKGROUND-COLOR:#EAD8C1">
							<td colspan="2"><b><%=pageGrpsData.getWord("Agent group")%> [<script language="javascript" type="text/javascript">document.write(normalizeString(QueryString('grpName')));</script>]</b></td>
						</tr>
						<tr>
							<td colspan="2">
								<script language="javascript" type="text/javascript">
									document.write('<applet code="Manager.PieChart.PiechartApplet.class" archive="../sAheevaChart.jar" width="550" height="250" mayscript name="graphApplet">');
									
									document.write('<PARAM name="LOADINGMESSAGE" value= "<%=pageGrpsData.getWord("Creating Chart - Please Wait.")%>">');//good
									document.write('<PARAM name="STEXTCOLOR"     value="0,0,100">');
									document.write('<PARAM name="STARTUPCOLOR"   value="255,255,255">');
									document.write('<PARAM name="charset"   value="8859_1">');
	
									document.write('<PARAM name="3D"                 value="true">');
									document.write('<PARAM name="Slabels"            value="true">');
									document.write('<PARAM name="legend"             value="true">');
									document.write('<PARAM name="displayPercentages" value="true">');
	
									document.write('<PARAM name="width"      value="550">');
									document.write('<PARAM name="height"     value="250">');
									document.write('<PARAM name="nPies"      value="1">');
									document.write('<PARAM name="depth3D"    value="15">');
									document.write('<PARAM name="ndecplaces" value="0">');
									document.write('<PARAM name="3Dangle"    value="50">');
	
									document.write('<PARAM name="thousandseparator" value=".">');
	
									document.write('<PARAM name="linkCursor" value="default">');
	
									document.write('<PARAM name="valuepresym"  value="">');
									document.write('<PARAM name="valuepostsym"  value=" ">');
	
									document.write('<PARAM name="popupfont"  value="Arial,B,12">');
									document.write('<PARAM name="slabelfont" value="Arial,N,10">');
	
									document.write('<PARAM name="bgcolor"      value="white">');
									document.write('<PARAM name="labelcolor"   value="50,50,50">');
	
	
									document.write('<PARAM name="legendfont"       value="Arial,N,10">');
									document.write('<PARAM name="legendposition"   value="400,10">');
									document.write('<PARAM name="legendtitle"      value="<%=pageGrpsData.getWord("Dials")%>">');
									document.write('<PARAM name="LegendBackground" value="255,255,255">');
									document.write('<PARAM name="LegendBorder"     value="125,125,125">');
									document.write('<PARAM name="LegendtextColor"  value="0,0,0">');
	
									document.write('<PARAM name="Pie1" value="110,50,175,7,5">');
	
									document.write('<PARAM name="pie1label1" value="<%=pageGrpsData.getWord("Not ready agents")%>">');
									document.write('<PARAM name="pie1label2" value="<%=pageGrpsData.getWord("Ready agents")%>">');
									document.write('<PARAM name="pie1label3" value="<%=pageGrpsData.getWord("Waiting agents")%>">');
									document.write('<PARAM name="pie1label4" value="<%=pageGrpsData.getWord("Wrap up agents")%>">');
									document.write('<PARAM name="pie1label5" value="<%=pageGrpsData.getWord("Dialing agents")%>">');
									document.write('<PARAM name="pie1label6" value="<%=pageGrpsData.getWord("OnHold agents")%>">');
									document.write('<PARAM name="pie1label7" value="<%=pageGrpsData.getWord("In Conference agents")%>">');


									document.write('<PARAM name="segment1" value="115,152,164|<%=pageGrpsData.getWord("Not ready")%>">');
									document.write('<PARAM name="segment2" value="99,99,156|<%=pageGrpsData.getWord("Ready")%>">');
									document.write('<PARAM name="segment3" value="185,53,8|<%=pageGrpsData.getWord("Waiting")%>">');
									document.write('<PARAM name="segment4" value="239,214,115|<%=pageGrpsData.getWord("Wrapup")%>">');
									document.write('<PARAM name="segment5" value="250,200,115|<%=pageGrpsData.getWord("Dialing")%>">');
									document.write('<PARAM name="segment6" value="239,100,115|<%=pageGrpsData.getWord("On hold")%>">');
									document.write('<PARAM name="segment7" value="100,214,50|<%=pageGrpsData.getWord("In conference")%>">');
									
									
									document.write('<PARAM name="data1series1" value="'+grpTotalNotReady+'">');
									document.write('<PARAM name="data2series1" value="'+grpTotalReady+'">');
									document.write('<PARAM name="data3series1" value="'+grpTotalWaiting+'">');
									document.write('<PARAM name="data4series1" value="'+grpTotalWrapUp+'">');
									document.write('<PARAM name="data5series1" value="'+grpTotalDialing+'">');
									document.write('<PARAM name="data6series1" value="'+grpTotalHold+'">');
									document.write('<PARAM name="data7series1" value="'+grpTotalConference+'">');
									
									
									document.write('</applet>');
								</script>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</fieldset>
</body>
</html>
