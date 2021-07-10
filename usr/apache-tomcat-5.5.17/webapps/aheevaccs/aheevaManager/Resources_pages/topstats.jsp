 <%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "aheevaManager.ressources.*" %>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>AheevaCCS - Statistics</title>
<%@ include file="topstatsFunctions_labels.jsp" %>
<%@ include file="agentSpyFunctions_labels.jsp" %>
<%@ include file="jsdomenu_labels.inc.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" src="jsdom_menuvariables.js" type="text/javascript" ></script>
<script language="javascript" src="jsdomenu.config.js" type="text/javascript" ></script>
<script language="javascript" src="jsdomenu.js" type="text/javascript"></script>
<script language="javascript" src="jsdomenu.inc.js" type="text/javascript" ></script>

<script language="javascript" src="jsUtil.js" type="text/javascript"></script>
<script language="javascript" src="Browser.js" type="text/javascript"></script>
<script language="javascript" src="topstatsFunctions.js" type="text/javascript"></script>
<script language="javascript" src="agentSpyFunctions.js" type="text/javascript"></script>

<LINK href="style.css" 	rel="stylesheet" type="text/css" />
<LINK href="office_xp.css" 	rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />

<!--[if lt IE 7]>
<link href="Resources_pages/styleie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<style type="text/css">

div.TableContainer {
	width: 100%;
	overflow:  auto;
	margin: 0 auto; 
}	
tbody	{ 
	overflow: auto; 
	height: 10px;
}
thead tr	{	
	position: relative; 
	top: expression(this.parentNode.parentNode.parentNode.scrollTop-2);

 }
</style>



<SCRIPT language="JavaScript">
<!--
if (document.images)
{
pic1= new Image(20,16); 
pic1.src="../img/inbound.gif"; 

pic2= new Image(20,16); 
pic2.src="../img/outbound.gif"; 

pic3= new Image(20,16); 
pic3.src="../img/coaching.gif"; 

pic4= new Image(20,16); 
pic4.src="../img/conference.gif"; 

pic5= new Image(20,16); 
pic5.src="../img/dialing.gif"; 

pic6= new Image(20,16); 
pic6.src="../img/logged_out.gif"; 

pic7= new Image(20,16); 
pic7.src="../img/not_ready.gif"; 

pic8= new Image(20,16); 
pic8.src="../img/on_break.gif"; 

pic9= new Image(20,16); 
pic9.src="../img/on_hold.gif"; 

pic10= new Image(20,16); 
pic10.src="../img/technical_problem.gif"; 

pic11= new Image(20,16); 
pic11.src="../img/waiting.gif"; 

pic12= new Image(20,16); 
pic12.src="../img/wrap_up.gif"; 

pic13= new Image(20,16); 
pic13.src="../img/follow_up.gif"; 
}

function hei2 (){
	
	document.getElementById('stats_division').style.height = (document.body.clientHeight)-20;
	//alert (document.getElementById('stats_division').style.height);

};
window.onload=hei2;
window.onresize=hei2;
-->
</SCRIPT>



</head>

<body class="topstatsbody" onLoad="initjsDOMenu();window.top.main.rtop.tabOnClick(window.top.main.rtop.currentTabID);" SCROLL="NO">
<div id="stats_division" class="TableContainer">
<!--	<IFRAME ID="current_stats_frm" name="current_stats_frm" border="0" frameborder="0" CLASS="tabFrame" src="">-->
</div>
	
	
	<div id="changeStatusDialog" class="changeStatusDialog">
	<table>
		<tr>
			<td bgcolor="#AFCEEF" colspan="2"><%=pageData.getWord("Notice")%>:</td>
		</tr>
		<tr>
			<td id="changeStatusDialog_text" colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2"><%=pageData.getWord("Message")%><input name="changeStatusDialog_mess" value="" class="changeStatusDialog_input" maxlength="256"></td>
		</tr>
		<tr>
			<td align="right" id="changeStatusDialog_okButton" width="50%">&nbsp;</td>
			<td align="left" width="50%">
	      		<input type="button" value="<%=pageData.getWord("Cancel")%>" onClick="hidechangeStatusDialog()">
		</td></tr>
	</table>
	</div>
	
	<div id="showLiveListeningDialog" style="visibility:hidden; position:absolute; top:0px; left:0px; z-index:500;">
	
	<table width="180" height="74" border="0" align="center" cellpadding="0" cellspacing="0" style="border: 1px solid rgb(136, 136, 136);">
			<tr style="background-image:url(../img/tile_blue.gif)">
			<td  style="background-image:url(../img/tile_blue.gif);cursor:move;" width="253" height="16" valign="top" onMouseDown="dragThis('showLiveListeningDialog')">
		  &nbsp;&nbsp;<font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=pageData.getWord("Agent spying")%></strong></font></td>
		<td width="15" align="right" style="background-image:url(../img/tile_blue.gif)"><div align="right"><img src="../img/x.gif" width="15" height="14" border="0"  onClick="javascript:hideSpyInterface()" style="cursor:pointer"></div></td>
	  </tr>
	  <tr bgcolor="#FFFFF0">
		<td height="2" colspan="2" align="left" valign="top"><img src="../img/line_gray.gif" width="100%" height="1"></td>
	  </tr>
	  <tr bgcolor="#FFFFF0">
		<td height="30" colspan="2" valign="middle">&nbsp;&nbsp; 
			<img id="listen_img" src="../img/listen.gif" title="Listen to agent" width="32" height="32" style="cursor:pointer" onClick="javascript:spy_start()">&nbsp&nbsp
		  	<img src="../img/stop_inactive.gif" id="stop_whisper" title="Stop listening to agent" width="32" height="32" style="cursor:pointer" onClick="javascript:spy_stop()">&nbsp&nbsp
			<script>
			if(userHasRight("ALLOW_MANAGER_WHISPER_TOAGENT"))
				document.write('<img src="../img/talk_to_agent_inactive.gif" alt="Whisper to agent" width="32" height="32" id="whisper_agent_img" style="cursor:pointer" onClick="javascript:whisper_agent()">&nbsp&nbsp');
			</script>
			
			<script>
			if(appletObj.getIsScreenCaptureAllowed()) {
				document.write('<img src="../img/tv_icon.gif" alt="Watch agent monitor" width="32" height="32" id="watch_agent" style="cursor:pointer" onClick="javascript:startWatcher()">&nbsp&nbsp');
			}else {
				  document.write('<img src="../img/spy-audio-screen_bw.gif" alt="Watch agent monitor disabled" width="32" height="32" id="watch_agent" style="" >&nbsp&nbsp');
			}
			</script>
			<!--<img src="../img/talk_to_customer_inactive.gif" alt="Whisper to customer" width="32" height="32" id="whisper_customer_img" style="cursor:pointer" onClick="javascript:whisper_customer()">&nbsp&nbsp -->
		</td>
	  </tr>
	  <tr bgcolor="#EAF4F3">
		<td height="2" colspan="2" align="left" valign="top"><img src="../img/line_gray.gif" width="100%" height="1"></td>
	  </tr>
	  <tr bgcolor="#EAF4F3">
		<td height="15" colspan="2" id="agtSpyTicker" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px">&nbsp; </td>
	  </tr>
	</table>
	</div>
	<!-- INCLUDE THE IAX JAVA STARPHONE -->
	<jsp:plugin type="applet" archive="../siaxPhone.jar" code="aheevaManager.iaxclient.iaxPhone.class"
		name="myPhoneApplet" height="0" width="0">
		<jsp:params>
			<jsp:param name="scriptable" value="true" />
			<jsp:param name="INPUT" value="0" />
			<jsp:param name="OUTPUT" value="0" />
			<jsp:param name="MAYSCRIPT" value="true" />
			<jsp:param name="USER" value="aheeva_spy" />
			<jsp:param name="PASS" value="aheeva_spy" />
			<jsp:param name="REGISTER" value="false" />
			<jsp:param name="NUMBER" value="" />
			<jsp:param name="DEBUG" value="false" />
		</jsp:params>
	</jsp:plugin>
	<!-- END OF IAX STARPHONE -->

	<!-- ERROR MESSAGES DIV -->
	<div id="showMessageDialogError" class="showMessageDialogError">
	<table width="100%">
		<tr>
			<td width="30"><img src="../img/error.gif" width="30" height="30"></td>
			<td id="showMessageDialogError_text" class="showMessageDialogError_text"></td>
		</tr>
	</table>
	</div>
	<!-- ~ ERROR MESSAGES DIV  -->

<!-- Fixes the IE6 & IE7 "Press SPACEBAR or ENTER to activate and use this control" - must be at the end of the file-->
<script language="javascript" type="text/javascript" src="../activateActiveX.js"></script>
</body>
<% pageData.closeConnection(); %>
</html>
