<html>
<head>


<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<title>Record Picker11</title>

<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<%@ include file="xc2_default_labels.jsp" %>
<%@ include file="blackListNumberInCampaignFunctions_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>

<!--<LINK href="style.css" rel="stylesheet" type="text/css" />-->
<script language="JavaScript">
var NS4 = document.layers ? 1:0
var IE4 = document.all ? 1:0
var IE5 = document.getElementById&&document.all ? 1:0
var NS6 = document.getElementById&&!document.all ? 1:0

var x=0;
var y=0;
var closetable = "</TD></TR></TABLE></TD></TR></TABLE>";	
if(!IE4) {
	document.captureEvents(Event.MOUSEMOVE);
	document.onmousemove = GetPos;
}
	
function Desc(text ) {
 	var opentable = "<TABLE BGCOLOR='#000000' BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH=140><TR><TD ALIGN=center><TABLE BGCOLOR='#FFFFE1' BORDER=0 CELLPADDING=3 CELLSPACING=1 WIDTH=138><TR><TD VALIGN=top style='font-size:10px; font-family:Tahoma' align=left><IMG SRC='../img/help.gif' HEIGHT=24 WIDTH=30 VSPACE=0 HSPACE=0 ALIGN=left>";
	 
	if(NS6) {
		document.getElementById("Description").innerHTML  = opentable+text+closetable;
		document.getElementById("Description").style.left = x-12;
		document.getElementById("Description").style.top  = y+10;
		document.getElementById("Description").style.visibility = "visible";
	}
 	if(IE4) {
		
		document.all["Description"].innerHTML = opentable+text+closetable;
		Description.style.pixelLeft = event.clientX-12;
		Description.style.posTop  = document.body.scrollTop+event.clientY+16;
		Description.style.visibility = "visible";
	}
	else {
		var nets = document.layers["Description"];
		nets.document.open();
		nets.document.write(opentable+text+closetable);
		document.Description.left = x-12;
		document.Description.top = y+10;
		nets.visibility = "show";
		document.close();
	}
}

function GetPos(evnt){
	x = evnt.pageX;
	y = evnt.pageY;
	return true;
}

function noDesc() {

	if(NS6) {
		document.getElementById("Description").style.visibility = "hidden";
	}
	if(IE4) {
		Description.style.visibility = "hidden";
	}
	else {
		document.Description.visibility = "hidden";
	}
}
</script>
<style type="text/css">

.dynamic-tab-pane-control .contentText{
	font:			12px Tahoma;
	color:			Black;
}
.dynamic-tab-pane-control .tab-page {
	clear:			both;
	border:			1px solid rgb( 145, 155, 156 );
	background:		rgb( 252, 252, 254 );
	z-index:		2;
	position:		relative;
	top:			-2px;

	font:			11px Tahoma;
	color:			Black;

	filter:			progid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)
					progid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);
	
	/* 244, 243, 238 */ 
	/*145, 155, 156 */
	padding:		10px;
}

.dynamic-tab-pane-control .tab-row {
	z-index:		1;
	white-space:	nowrap;
}
 
.dynamic-tab-pane-control .tab-row .tab.selected {
	width:				74px  ;
	height:				18px  ;
	background-image:	url( "tab.active.png" )  ;
	background-repaet:	no-repeat;

	border-bottom-width:	0;
	z-index:		3;
	padding:		2px 0 0px 0;
	margin:			1px -3px -3px 0px;
	top:			-2px;
	font:			11px Tahoma;
}

.dynamic-tab-pane-control .tab-row .tab a {
	font:				11px Tahoma;
	color:				Black;
	text-decoration:	none;
	cursor:				default;
}

.dynamic-tab-pane-control .tab-row .tab.hover {
	font:				11px Tahoma;
	width:				70px;
	height:				16px;
	background-image:	url( "tab.hover.png" );
	background-repaet:	no-repeat;
}
 
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		200px;
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
 
 .dynamic-tab-pane-control.tab-pane {
	position:	relative;
	width:		100%;		 
	margin-right:	-2px;	 
	height:		200px;
	
}

</style>

<script type="text/javascript" src="blackListNumberInCampaignFunctions.js">

</script>

 
</head>

<body class="no_call_act_body">
<br />
<DIV ID="Description" STYLE="position:absolute; top:5px; left:5px; visibility:hide; z-index:1; background-color:#FFFFCC;"></DIV>

<div class="dynamic-tab-pane-control">
	<div class="tab-pane" id="tabPane1"> 
	
 		
    	<div class="tab-page" id="general"> 
      <fieldset>
      <legend> 
      <%=pageData.getWord("Do-not-call list number search")%>
      </legend>
      <form name="theForm">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
          <tr> 
            <td style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td width="30%" align="right" height="26" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1"> 
              <%= pageData.getWord("Enter a number")%> 
              &nbsp;&nbsp;</td>
            <td width="70%" height="26" align="left"> <input type="text" id="blacklistNumber" name="blacklistNumber" size="15"/> 
              &nbsp;<input type="button"  name="searchBlacklistNumberInCampaign" id="searchBlacklistNumberInCampaign" value='<%= pageData.getWord("Search")%>' onClick="addRows()">
              <!-- &nbsp; <input type="button"  name="saveBlacklistCampaign" id="saveBlacklistCampaign" value='<%= pageData.getWord("Save")%>' onClick="removeFromBlacklistCampaign()"> -->
              &nbsp; <input type="button"  name="refresh_blacklist_number" id="refresh_blacklist_number" value='<%= pageData.getWord("Refresh")%>' onClick="clear_form()">
            </td>
          </tr>
          <tr height="40" colspan="2"> </tr>
          <tr height="40"> 
            <td colspan="2"> <div id="campaign_ranges"> </div></td>
          </tr>
        </table>
      </form>
      </fieldset>
    </div>
   </div>
</div>
</body>
<% pageData.closeConnection(); %>
</html>
