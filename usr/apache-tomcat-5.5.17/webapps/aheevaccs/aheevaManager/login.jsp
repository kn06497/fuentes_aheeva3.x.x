<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
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
<!-- AHEEVA_VERSION -->
<title>Aheeva Version 3.1.0</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!-- Fixes the IE6 & IE7 "Press SP
ACEBAR or ENTER to activate and use this control" - must be at the beginning of the file-->
<script language="JScript" type="text/jscript" src="activateActiveX_onload.js"></script>


<SCRIPT LANGUAGE="JavaScript">
function refreshFrame() {
frames['comm'].window.location.href = "CommPage.jsp"; // frame 1's page
}
</SCRIPT>
<script language="javascript" src="Resources_pages/globFuncsIndexHTM.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="Resources_pages/jsUtil.js"> </script>
<script language="javascript" type="text/javascript" src="Resources_pages/Browser.js"></script>
<script language="javascript" src="lang_browser.js"></script>
<link href="Resources_pages/style.css" type="text/css" rel="stylesheet">

<script language="JavaScript">
var i;
var variable = normalizeString(QueryString('lan'));
var ip = '<!--#echo var="REMOTE_ADDR"-->';

var lang_id
function language_changed(lang_id) 
{

var appletObj;
var loginname

	 
	window.top.comm.lang = lang_id;
    appletObj=window.top.comm.myApplet;
    appletObj.setLanguage(lang_id);
	if(document.login != null)
		loginname = document.login.username.value;
	else
		loginname = '';

	if(lang_id == '0') 
		document.location.href = 'login.jsp?login=' + loginname; 
	else if	(lang_id == '1')	
		document.location.href = 'login_fr.jsp?login=' + loginname;
	else if	(lang_id == '2')	
		document.location.href = 'login_sp.jsp?login=' + loginname;
	else if (lang_id == '3')
		document.location.href = 'login_br.jsp?login=' + loginname;
}



function d_funtion()
{
//alert ("in");
//alert(variable);
	if (variable == "en")
	{
		i =0;
		//alert (i);
	}
	else if (variable == "fr")
	{
		i = 1;
		//alert (i);
	}
	else if (variable == "es")
	{
		i = 2;
		//alert (i);
	}
	else if (variable = "br")
	{
		i = 3;
	}
 	//Get the applet object
}

function submitInfo()
{
    if(document.login.username.value =="")
    {
        alert("Please enter your username");
        return false;
    }
    if(document.login.password.value == "")
    {
    	alert("Please enter your password");
    	return false;
    }

 	if(validation(document.login.username.value) == 0)
	{
		alert("You cannot use ^ or | or ~ !!!");
		document.login.username.focus();
		return false;
	}
	else if(validation(document.login.password.value) == 0)
	{
		alert("You cannot use ^ or | or ~ !!!");
		document.login.password.focus();
		return false;

	}
 	//Get the applet object
	var appletObj;
	if(at.b == 'ie')
	{
		appletObj = window.top.comm.myApplet;
		window.top.comm.language = document.login.login_language.value;

	}
	else
	{
		appletObj = parent.frames.comm.document.getElementById("myApplet");	
		top.frames.comm.language = document.login.login_language.value;
	}

	displayTmpMessage("Validating Login<br>Please wait...", "#3366CC");
    appletObj.verifyPassword(document.login.username.value, document.login.password.value);

     return true;
}

function checkTheKey(e)
{	
	var pressedKey = "";

	//emod = (e) ? (e.eventPhase) ? "W3C" : "NN4" : (window.event) ? "IE4+" : "unknown";
	switch(at.b)
	{
		case "ie":
			pressedKey = window.event.keyCode;
		break;
		case "ns":			
			pressedKey = e.which;
		break;
	}

  	if(pressedKey == 13)	//13 = <Enter>
    	submitInfo();
}

function setLoginValidationForUser(result, dbid, state)
{	
	retrieveTmpMessage();
	if( String(result) == "SUCCEED" )
	{
		document.location ="./mainWindow.jsp?&lang="+lang+"&user_dbid="+dbid;
	}
	else
	{			
		displayTmpMessage("Invalid Informations.<br>Please retry...", "#FF0000");
		setTimeout("retrieveTmpMessage()", 2000);
	}
}

function displayTmpMessage(theMess, color)
{	
	var TempMsgObj = document.getElementById('TempMsg');
	var TempMessagesObj = document.getElementById('TempMessages');
	TempMsgObj.innerHTML = theMess;
	if(color != "")
		TempMsgObj.style.color = color;
	TempMessagesObj.style.top = document.body.clientHeight/2-TempMessagesObj.clientHeight/2;
	TempMessagesObj.style.left = document.body.clientWidth/2-TempMessagesObj.clientWidth/2;
	var selectobj = document.getElementById('login_language');
	if( selectobj )
		selectobj.style.visibility = 'hidden';
	TempMessagesObj.style.visibility = "visible";
}

function retrieveTmpMessage()
{	
	var TempMsgObj = document.getElementById('TempMsg');
	var TempMessagesObj = document.getElementById('TempMessages');
	TempMsgObj.innerHTML = "";
	TempMessagesObj.style.visibility = "hidden";
	
	var selectobj = document.getElementById('login_language');
	if( selectobj )
		selectobj.style.visibility = 'visible';
}
</script>
<script language="JavaScript">

	if(at.b == "ie")
	{
		if(window.top.comm == null || window.top.comm == undefined)
			document.location.href = "./index.htm";
	}
	else
	{
		if(top.frames.comm == null || top.frames.comm == undefined)
			document.location.href = "./index.htm";
	}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>


<SCRIPT LANGUAGE="JavaScript">
<!-- Original: Ronnie T. Moore -->
<!-- Web Site: The JavaScript Source -->
<!-- Begin -->
var expDays = 30;
var exp = new Date();
exp.setTime(exp.getTime() + (expDays*24*60*60*1000));
function getCookieVal (offset) {
var endstr = document.cookie.indexOf (";", offset);
if (endstr == -1)
endstr = document.cookie.length;
return unescape(document.cookie.substring(offset, endstr));
}
function GetCookie (name) {
var arg = name + "=";
var alen = arg.length;
var clen = document.cookie.length;
var i = 0;
while (i < clen) {
var j = i + alen;
if (document.cookie.substring(i, j) == arg)
return getCookieVal (j);
i = document.cookie.indexOf(" ", i) + 1;
if (i == 0) break;
}
return null;
}
function SetCookie (name, value) {
var argv = SetCookie.arguments;
var argc = SetCookie.arguments.length;
var expires = (argc > 2) ? argv[2] : null;
var path = (argc > 3) ? argv[3] : null;
var domain = (argc > 4) ? argv[4] : null;
var secure = (argc > 5) ? argv[5] : false;
document.cookie = name + "=" + escape (value) +
((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
((path == null) ? "" : ("; path=" + path)) +
((domain == null) ? "" : ("; domain=" + domain)) +
((secure == true) ? "; secure" : "");
}
function DeleteCookie (name) {
var exp = new Date();
exp.setTime (exp.getTime() - 1);
var cval = GetCookie (name);
document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
}
var favorite = GetCookie('animal');
var url
if (favorite != null && favorite != '0') {
var url;
switch (favorite) {
case '1' : language_changed('1');
break;
case '2' : language_changed('2');
break;
case '3' : language_changed('3');
break;
}
//window.location.href = url;
}

function loginAlign() {
	var availableWidth = document.getElementById("poweredBy").offsetWidth;
	var loginFormTableWidth = document.getElementById("loginFormTable").offsetWidth;
	var loginFormTableHeight = document.getElementById("loginFormTable").offsetHeight;
	var halfLoginBoxWidth = (loginFormTableWidth +10)/2;
	
	document.getElementById("loginBack").style.width = availableWidth - 4 + "px";
	document.getElementById("loginFront").style.width = availableWidth - 4 + "px";
	document.getElementById("copyLine").style.width = availableWidth + "px";
	document.getElementById("powerLine").style.width = availableWidth - 155 + "px";
	
	document.getElementById("loginBox").style.width = loginFormTableWidth +10 + "px";
	document.getElementById("loginBox").style.height = loginFormTableHeight +10 + "px";
	document.getElementById("loginBox").style.left = ((availableWidth /2)-halfLoginBoxWidth) + "px";
	
	if (document.getElementById("loginBack").style.visibility == "hidden") {
		document.getElementById("loginBack").style.visibility = "visible";
		document.getElementById("loginFront").style.visibility = "visible";
		document.getElementById("loginBox").style.visibility = "visible";
		document.getElementById("copyLine").style.visibility = "visible";
	}
}
</script>
 
 
<style type="text/css">

.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #FF6600;
   	font-weight: bold;
}
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000099;
   	font-weight: bold;
}
.style6 {
	font-size: 11px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #49392A;
}

.style11 {
	font-size: 11px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #000000;
}
.style11 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #63513F;
}
.style12 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #000000;
}
.style13 {
  font-family: Verdana, Arial, Helvetica, sans-serif; 
  font-size: 9px; 
  color: #666666; 
}

.introbg1 {
	position: absolute;
	height: 310px;
	width: 5px;
	left: 2px;
	top: 50px;
	background-image: url(img/intro_bg01.png);
	background-position: left top;
	background-repeat: no-repeat;
}

.introbg2 {
	position: absolute;
	height: 70px;
	width: 5px;
	left: 2px;
	top: 290px;
	background-image: url(img/intro_bg04.gif);
	background-position: right bottom;
	background-repeat: no-repeat;
	font-family: Verdana, Arial, Helvetica, sans-serif; 
	font-size: 9px; 
	color: #938970; 
	text-align: center;
	padding-top:52px;
/*	border-bottom: 2px solid #680D12;*/
}
body {
	margin-left: 0px;
	margin-top: 4px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>

<script type="text/javascript" src="flashobject.js"></script>

</head>

<body onLoad="loginAlign();document.login.username.focus();MM_preloadImages('img/login2.jpg')" onResize="loginAlign()">


<div style="width:74px; height:2px; text-align:center; position:absolute; top:30px; left:0px; border-top: 1px solid #E0DBCD;"></div>
<div id="powerLine" style="width:10px; height:2px; text-align:center; position:absolute; top:30px; left:155px; border-top: 1px solid #E0DBCD;"></div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="poweredBy">
	<tr>
		<td height="42px" align="left" style="padding-left:10px; padding-bottom:1px; border-bottom: 1px solid #A39D86;"><img src="img/powered_by.jpg" width="145" height="42"></td>
	</tr>
</table>
<div id="loginBack" class="introbg1" style="visibility:hidden"></div>
<div id="loginFront" class="introbg2" style="visibility:hidden">
<b>
&copy;
		<%
			java.util.Calendar cal = java.util.Calendar.getInstance();
			cal.setTime(new java.util.Date());
			int year = cal.get(Calendar.YEAR);
		%>
        2002-<%= year %> Aheeva Technology. All Rights Reserved.
</b>
</div>
<div id="loginBox" style="width:368px; height:183px; position:absolute; top:106px; left:0px; visibility:hidden; padding-top:4px; background-color:#d1cdbc; border-left: 1px solid #888888; border-top: 1px solid #888888; border-right: 1px solid #ffffff; border-bottom: 1px solid #ffffff;">
	<table id="loginFormTable" width="358" height="165" align="center" cellpadding="0" cellspacing="0" style=" border-left: 1px solid #ffffff; border-top: 1px solid #ffffff; border-right: 1px solid #888888; border-bottom: 1px solid #888888;">
		<form action="" method="" name="login" id="login">
        
			<tbody>
				<tr valign="top" style="background-image:url(img/loginbx1.jpg); background-position:right bottom; background-repeat:no-repeat"> 
					<td width="318" height="42" align="right" class="style2" style="border-bottom: 1px solid #ffffff; padding: 4px; background-color: #ffffff;"> 
						<div align="left"><span class="vers_name">Aheeva </span><span class="vers_numb"><%= pageData.getWord("AHVersion")%></span><br>
						<img src="img/spacer.gif" width="310" height="2">
						</div>
					</td>
					<td width="38" align="right" class="style13" style="border-bottom: 1px solid #ffffff; padding: 4px; background-color: #ffffff;">
						<img src="img/spacer.gif" width="30" height="2">
					</td>
				</tr>
				<tr>
					<td colspan="2"  align="center" background="img/chain_b2.jpg" style="padding: 5px; background-color: rgb(221, 221, 221)"> 
						<table align="center" border="0" cellpadding="0" cellspacing="2" width="99%">
							<tbody>
								<tr> 
									<td height="23" colspan="2" class="style6" style="padding-bottom: 5px;">Please enter your username and password.</td>
								</tr>
								<tr> 
									<td class="style11" width="143">User Name:</td>
									<td width="194">
<% String user = "";
   if(request.getParameter("login") != null)
     user = request.getParameter("login");
%>

										<input size="20" name="username" onKeyPress="checkTheKey(event)" value="<%=user%>" type="text" class="style11">
									</td>
								</tr>
								<tr> 
									<td width="143" class="style11">Password:</td>
									<td>
										<input size="20" name="password" value="" type="password" onFocus="this.select()" onKeyPress="checkTheKey(event)" class="style11">
									</td>
								</tr>
								<tr> 
									<td width="143">&nbsp;</td>
									<td>
										<a href="javascript:;" onMouseOver="MM_swapImage('img_button','','img/login2.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="img/login.jpg" name="img_button" width="70" height="20" border="0" id="img_button" onClick="return submitInfo();"></a> 
									</td>
								</tr>
							</tbody>
						</table>
						<div id="more">
							<table align="center" border="0" cellpadding="0" cellspacing="2" width="99%">
								<tbody>
									<tr> 
										<td width="143" height="20" class="style11">Language:</td>
										<td width="194"> 
											<select onChange="SetCookie('animal', this.value, exp);language_changed(this.options[this.selectedIndex].value)" id="login_language" name="login_language" class="style11">
												<option value="0">US English</option>
												<option value="1">Français</option>
												<option value="2">Espanol</option>
												<option value="3">Português (BR)</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
 			</tbody>
		
		</form>
		
	</table>
</div>
<div id="copyLine" class="style13" style="width:10px; height:12px; text-align:center; position:absolute; top:360px; left:0px; margin-top:2px; padding-top:4px; border-top: 1px solid #A39D86; border-bottom: 1px solid #E0DBCD; visibility:hidden;"></div>
<div style="position:absolute; top:210px; left:20px; height:15px; width:120px;"><a href="http://www.aheeva.com" target="_blank"><img src="img/spacer.gif" width="120" height="15" hspace="0" vspace="0" border="0"></a></div>





<div class="TempMessages" id="TempMessages"> 
  <table border="0" width="100%" cellpadding="0" cellspacing="0" height="100%">
    <tr> 
      <td width="100%" id="TempMsg" align="center" class="TempMsg"> </td>
    </tr>
  </table>
</div>
<!-- Fixes the IE6 & IE7 "Press SPACEBAR or ENTER to activate and use this control" - must be at the end of the file-->
<script language="JScript" type="text/jscript" src="activateActiveX.js"></script>
</body>
<% pageData.closeConnection(); %>
</html>
