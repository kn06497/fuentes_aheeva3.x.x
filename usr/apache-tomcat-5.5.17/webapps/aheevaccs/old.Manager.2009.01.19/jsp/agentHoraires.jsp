<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="com.mysql.jdbc.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="Manager.reports.*"%>


<head>
<title>AheevaCCS - Agent Schedule</title>
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



<style>
  .menuItem {

 font-family:ms sans serif,helvetica,arial,sans-serif;


 width:100%;

 padding-left:16;

 background-Color:menu;

 color:black;

 padding-top: 2px;

 padding-bottom: 2px;

 margin-bottom:0;

 margin-top:0;

 cursor: default; }
  .menuItemDefault {

 font-family:ms sans serif,helvetica,arial,sans-serif;


 font-weight:bold;

 width:100%;

 padding-left:16;

 background-Color:menu;

 color:black;

 padding-top: 2px;

 padding-bottom: 2px;

 cursor: default; }
  .highlightItem {

 font-family:ms sans serif,helvetica,arial, sans-serif;


 width:100%;

 padding-left:16;

 background-Color:#DDDDEE;

 color:white;

 padding-top: 2px;

 padding-bottom: 2px;

 cursor: default; }
</style>

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>

<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>


<jsp:useBean id="sc" scope="request" class="Manager.reports.beanSchedule"/>





<script language="JavaScript1.2">

function setDay(aDay){

theDay = aDay;
document.getElementById('day').innerHTML = aDay;

}

function displayMenu() {
  //contextMenu.style.leftPos+=10;
  contextMenu.style.posLeft=event.clientX;
  contextMenu.style.posTop=event.clientY;
  contextMenu.style.display="";
  contextMenu.setCapture();
}

function clickMenu() {
  contextMenu.releaseCapture();
  contextMenu.style.display="none";
  el=event.srcElement;
  if (el.id=="menuEdit") {
    doEdit();
  } else if (el.id=="menuDelete") {
    doDelete();
  }
}


function switchMenu() {
el=event.srcElement;
if (el.className=="menuItem") {
el.className="highlightItem";
} else if (el.className=="highlightItem") {
el.className="menuItem";
}
}
</script>



</head>
<body>


<%
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");

    String startingDate="";
    String endingDate="";
    String sRet="";
    int i,j,k;
    long tLoginTime;
    String myagt="",myagt_id="";
    String test="";

    String [] m_Agents;
    String [] m_tLoginTime;

    String agents     = request.getParameter("agent");
    StringTokenizer tok = null, tok1=null,  tokn = null;

    String   aPeriod="";

    if(agents != null){
        tok = new java.util.StringTokenizer(agents,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    int numObjects = tok.countTokens();
    for( k = 0; k <numObjects; k++ ) {
         myagt = tok.nextToken();
         tok1 = new java.util.StringTokenizer(myagt,"^");
         myagt = tok1.nextToken();
         myagt_id = tok1.nextToken();
    }

%>


<div class="img-control" >
<table align="right" border="0" width="25%" >

</table>
</div>

<div class="tab-pane" id="tabPaneA" >
<form name="agentSchedule" >
	<script type="text/javascript">
	tp1 = new WebFXTabPane( document.getElementById( "tabPaneA" ) );
	</script>
<div class="tab-page" id="tabPageA"  align="center">
<h2 class="tab"><script>document.write(MultiArray["Schedule"][lang])</script></h2>
<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPageA" ) );
 </script>
 <fieldset>



<div id=contextMenu onclick="clickMenu()" onmouseover="switchMenu()" onmouseout="switchMenu()" style="position:absolute; display:none; width:130;
 background-Color:menu;
 border: 2px outset; ">
 <div id="day" class="menuitem" url=""></div>
<hr>
<div class="menuitem" url=""><script>document.write(MultiArray["Set absent"][lang])</script></div>
<div class="menuitem" url=""><script>document.write(MultiArray["Shift trade"][lang])</script></div>

</div>


<table width="600"  border="0">
  <tr>
   <td>&nbsp;</td>
  </tr>
 <tr>
    <td width="550" class="reportsID"><div align="center"><b>
        <script>document.write(MultiArray["Schedule"][lang])</script> <script>document.write(MultiArray["From"][lang])</script>:
        <%out.write(startingDateDaily);	%>
        <script>document.write(MultiArray["To"][lang])</script>
        <%out.write(endingDateDaily);	%>
        </b></div></td>
  </tr>
   <tr>
   <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="550" class="reportsID">
     <div align="center">
     <b> <script>document.write(MultiArray["Agent"][lang])</script> :   <%out.write(myagt);%>   </b>

    </div>
    </td>
  </tr>
 <tr>
   <td>&nbsp;</td>
  </tr>
</table>

<table align="center" border="1" cellpadding="0" cellspacing="0"  bordercolor="#CCCCCC" style="border-collapse:collapse ">
<span class=clickableSpan oncontextmenu="displayMenu(); return false">
<tr>
 <td height="10" class="reportsTabName" style="border-style:solid; border-width:medium"><script>document.write(MultiArray["Day"][lang])</script></td>
 <td class="horairesTabName"><script>document.write(MultiArray["Shift"][lang])</script></td>

</tr>


<%
try{
   test = sc.getdAgentSchedule2(myagt_id,startingDateDaily,endingDateDaily);
}catch(Exception e){
}
if(test=="success") {
     ScheduleInfo agentSht = (ScheduleInfo)sc.m_vAllAgentPublishedShifts.elementAt(0);

%>
     <tr onMouseover="setDay('Sunday')"><td class="horairesTabName" style="border-style:solid; border-width:medium"><script>document.write(MultiArray["Sunday"][lang])</script> </td> <td class="reportsTabValue" style="border-style:solid; border-width:medium"><% out.write(agentSht.sun ); %></td></tr>
     <tr onMouseover="setDay('Monday')"> <td class="horairesTabName" style="border-style:solid; border-width:medium"><script>document.write(MultiArray["Monday"][lang])</script> </td>  <td  class="reportsTabValue" style="border-style:solid; border-width:medium"><% out.write(agentSht.mon ); %></td></tr>
     <tr onMouseover="setDay('Tuesday')"> <td class="horairesTabName" style="border-style:solid; border-width:medium"><script>document.write(MultiArray["Tuesday"][lang])</script> </td> <td class="reportsTabValue" style="border-style:solid; border-width:medium"><% out.write(agentSht.tues); %></td></tr>
     <tr onMouseover="setDay('Wednesday')"> <td class="horairesTabName" style="border-style:solid; border-width:medium"><script>document.write(MultiArray["Wednesday"][lang])</script> </td>  <td class="reportsTabValue" style="border-style:solid; border-width:medium"><%out.write(agentSht.wednes); %></td></tr>
     <tr onMouseover="setDay('Thursday')"> <td class="horairesTabName" style="border-style:solid; border-width:medium"><script>document.write(MultiArray["Thursday"][lang])</script> </td>  <td class="reportsTabValue" style="border-style:solid; border-width:medium"><% out.write(agentSht.thurs); %></td></tr>
     <tr onMouseover="setDay('Friday')"> <td class="horairesTabName" style="border-style:solid; border-width:medium"><script>document.write(MultiArray["Friday"][lang])</script> </td> <td class="reportsTabValue" style="border-style:solid; border-width:medium"><% out.write(agentSht.fri); %></td></tr>
     <tr onMouseover="setDay('Saturday')"> <td class="horairesTabName" style="border-style:solid; border-width:medium"><script>document.write(MultiArray["Saturday"][lang])</script> </td>  <td class="reportsTabValue" style="border-style:solid; border-width:medium"><% out.write(agentSht.satur); %></td></tr>

<%}else{%>
     <tr> <td><script>document.write(MultiArray["Sunday"][lang])</script> </td> <td>&nbsp;</td></tr>
     <tr><td><script>document.write(MultiArray["Monday"][lang])</script> </td>  <td>&nbsp;</td></tr>
     <tr> <td><script>document.write(MultiArray["Tuesday"][lang])</script> </td> <td>&nbsp;</td></tr>
     <tr> <td><script>document.write(MultiArray["Wednesday"][lang])</script> </td>  <td>&nbsp;</td></tr>
    <tr> <td><script>document.write(MultiArray["Thursday"][lang])</script> </td>   <td>&nbsp;</td></tr>
     <tr><td><script>document.write(MultiArray["Friday"][lang])</script> </td>  <td>&nbsp;</td></tr>
     <tr> <td><script>document.write(MultiArray["Saturday"][lang])</script> </td>  <td>&nbsp;</td></tr>

<%}%>
</span>
</table>



</fieldset>
</div>


</form>
</div>
<script type="text/javascript">
	setupAllTabs();
</script>


</body>
</html>
