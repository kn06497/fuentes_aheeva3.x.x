<%@ page contentType="text/html; charset=iso-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Language" content="en-us">
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="agentGroupFunctions.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="javascript" type="text/javascript">
var this_cmpName = normalizeString(QueryString('campaign_name'));
var sTring = String( appletObj.getCampaignStats(this_cmpName) );
sTringArray = sTring.split(",");

var cmpTotalAnswers = sTringArray[1];
var cmpTotalNoAnswers = sTringArray[2];
var cmpTotalAbandonned = sTringArray[3];
var cmpTotalAnswerMachine = sTringArray[4];
var cmpTotalSIT = sTringArray[5];
var cmpTotalBusy = sTringArray[6];
var cmpTotalFax = sTringArray[7];
var cmpTotalDials = parseInt(cmpTotalAnswers) + 
					parseInt(cmpTotalNoAnswers) + 
					parseInt(cmpTotalAbandonned) + 
					parseInt(cmpTotalAnswerMachine) + 
					parseInt(cmpTotalSIT) + 
					parseInt(cmpTotalBusy) + 
					parseInt(cmpTotalFax);

</script>

</head>
<body>
<fieldset>
		<legend><script>document.write(MultiArray["Statistics"][lang])</script></legend>
		<table border="0">
			<tr style="BACKGROUND-COLOR: #c4e0f0">
				<td colSpan="2">
					<script>document.write(MultiArray["Campaign"][lang])</script> [
					<script language="javascript" type="text/javascript">document.write(this_cmpName);</script>
					]
				</td>
			</tr>
			<tr>
				<td colSpan="2">
					<script language="javascript" type="text/javascript">
							document.write('<applet code="Manager.PieChart.PiechartApplet.class" archive="../sAheevaChart.jar" width="550" height="250" mayscript name="graphApplet">');
			
							document.write('<!-- Start Up Parameters -->');
							document.write('<PARAM name="LOADINGMESSAGE" value="'+MultiArray["Creating Chart - Please Wait."][lang]+'">');
							document.write('<PARAM name="STEXTCOLOR"     value="0,0,100">');
							document.write('<PARAM name="STARTUPCOLOR"   value="255,255,255">');
							document.write('<!-- Character Encoding -->');
							document.write('<PARAM name="charset"   value="8859_1">');
							
							document.write('<!-- Chart Switches -->');
							document.write('<PARAM name="3D"                 value="true">');
							document.write('<PARAM name="Slabels"            value="true">');
							document.write('<PARAM name="legend"             value="true">');
							document.write('<PARAM name="displayPercentages" value="true">');
							
							document.write('<!-- Chart Characteristics -->');
							document.write('<PARAM name="width"      value="550">');
							document.write('<PARAM name="height"     value="250">');
							document.write('<PARAM name="nPies"      value="1">');
							document.write('<PARAM name="depth3D"    value="15">');
							document.write('<PARAM name="ndecplaces" value="0">');
							document.write('<PARAM name="3Dangle"    value="50">');
							
							document.write('<!-- Thousand separator -->');
							document.write('<PARAM name="thousandseparator" value=".">');
							
							document.write('<!-- Link Cursor -->');
							document.write('<!--  valid values are - crosshair, default, hand, move, text or wait -->');
							document.write('<PARAM name="linkCursor" value="default">');
							
							document.write('<!-- Popup segment Value Pre & Post Symbols -->');
							document.write('<PARAM name="valuepresym"  value="">');
							document.write('<PARAM name="valuepostsym"  value=" ">');
							
							document.write('<!-- Additional font information -->');
							document.write('<PARAM name="popupfont"  value="Arial,B,12">');
							document.write('<PARAM name="slabelfont" value="Arial,N,10">');
							
							document.write('<!-- Additional color information -->');
							document.write('<PARAM name="bgcolor"      value="white">');
							document.write('<PARAM name="labelcolor"   value="50,50,50">');
							
							
							document.write('<!-- Legend Information -->');
							document.write('<PARAM name="legendfont"       value="Arial,N,10">');
							document.write('<PARAM name="legendposition"   value="400,10">');
							document.write('<PARAM name="legendtitle"      value="'+MultiArray["Dials"][lang]+'">');
							document.write('<PARAM name="LegendBackground" value="255,255,255">');
							document.write('<PARAM name="LegendBorder"     value="125,125,125">');
							document.write('<PARAM name="LegendtextColor"  value="0,0,0">');
							
							document.write('<!-- Title -->');
							document.write('<!-- title   text|xpos,ypos|Font|Color Defintion"> -->');
							document.write('<!--<PARAM name="title" value="Dials statistics|180,15|Arial,BI,16|grey">-->');
							
							document.write('<!-- Free Form Text -->');
							document.write('<!--  textN  text|xpos,ypos|Font|Color Defintion"> -->');
							
							
							document.write('<!-- Pie Data -->');
							document.write('<!--  PieN   x,y,size,number of segments, seperation -->');
							document.write('<PARAM name="Pie1" value="110,50,175,7,5">');
							
							document.write('<!-- Pie Segement Labels -->');
							document.write('<PARAM name="pie1label1" value="'+MultiArray["Answered"][lang]+'">');
							document.write('<PARAM name="pie1label2" value="'+MultiArray["No answer"][lang]+'">');
							document.write('<PARAM name="pie1label3" value="'+MultiArray["Abandoned"][lang]+'">');
							document.write('<PARAM name="pie1label4" value="'+MultiArray["Answer machine"][lang]+'">');
							document.write('<PARAM name="pie1label5" value="'+MultiArray["SIT"][lang]+'">');
							document.write('<PARAM name="pie1label6" value="'+MultiArray["Busy"][lang]+'">');
							document.write('<PARAM name="pie1label7" value="'+MultiArray["Fax"][lang]+'">');
							
							
							document.write('<!-- Segment Data -->');
							document.write('<!-- segmentN       series color|legend label|URL|Target Frame -->');
							document.write('<PARAM name="segment1" value="115,152,164|'+MultiArray["Answered"][lang]+'">');
						    document.write('<PARAM name="segment2" value="99,99,156|'+MultiArray["No answer"][lang]+'">');
							document.write('<PARAM name="segment3" value="185,53,8|'+MultiArray["Abandoned"][lang]+'">');
							document.write('<PARAM name="segment4" value="239,214,115|'+MultiArray["Answer machine"][lang]+'">');
							document.write('<PARAM name="segment5" value="0,63,68|'+MultiArray["SIT"][lang]+'">');
							document.write('<PARAM name="segment6" value="17,97,158|'+MultiArray["Busy"][lang]+'">');
							document.write('<PARAM name="segment7" value="17,97,0|'+MultiArray["Fax"][lang]+'">');
						
							document.write('<!-- Images -->');
							document.write('<!-- imageN    imageURL,x position,y position -->');
							
							
							document.write('<!-- Pie Data -->');
							document.write('<!--                value,URL,Target Frame -->');
						
							document.write('<PARAM name="data1series1" value="'+cmpTotalAnswers+'">');
							document.write('<PARAM name="data2series1" value="'+cmpTotalNoAnswers+'">');
							document.write('<PARAM name="data3series1" value="'+cmpTotalAbandonned+'">');
							document.write('<PARAM name="data4series1" value="'+cmpTotalAnswerMachine+'">');
							document.write('<PARAM name="data5series1" value="'+cmpTotalSIT+'">');
							document.write('<PARAM name="data6series1" value="'+cmpTotalBusy+'">');
							document.write('<PARAM name="data7series1" value="'+cmpTotalFax+'">');
													
						
						document.write('</applet>');
					</script>
					  
				
					
				</td>
			</tr>
		</table>
		</fieldset>
</body>
</html>
