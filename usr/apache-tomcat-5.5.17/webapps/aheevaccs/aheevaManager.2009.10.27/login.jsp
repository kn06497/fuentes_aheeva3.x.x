<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<head>
<!-- AHEEVA_VERSION -->
<title>Aheeva CCS Manager Version 3.0.2.2</title>
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
<script language="JavaScript" src="language.js"></script>
<script language="javascript" src="lang_browser.js"></script>
<link href="Resources_pages/style.css" type="text/css" rel="stylesheet">

<script language="JavaScript">
var i

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
	color: #000000;
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
	color: #000000;
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
</style>

<script type="text/javascript" src="flashobject.js"></script>

</head>

<body onLoad="document.login.username.focus();MM_preloadImages('img/login2.jpg')">

<div align="right"><img src="img/powered_by.jpg" width="200" height="42"></div>
<table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
  <tr>
    <td height="2"> <div align="center"><img src="img/line_gray.gif" width="100%" height="1"></div></td>
  </tr>
  <tr>
    <td height="21" background="img/tile_orange.jpg"><div align="center"></div></td>
  </tr>
  <tr>
    <td height="2"><img src="img/line_gray.gif" width="100%" height="1"></td>
  </tr>
</table>
<br>
<table width="100%" height="220" border="0" align="center">
  <tr align="left">
    <td width="33%" height="223"> 
      <div align="center"><img src="img/Aheeva-logo_medium.jpg" width="210" height="130"></div></td>
    <td>
      <table width="358" height="165" border="0" align="center" cellpadding="0" cellspacing="0" style="border: 1px solid rgb(136, 136, 136);">
        <form action="" method="" name="login" id="login">
        
        <tbody>
  	  <tr valign="top"> 
              <td width="178" height="42" align="right" class="style2" style="border-bottom: 1px solid rgb(187, 187, 187); padding: 4px; background-color: rgb(255, 255, 255);"> 
                <div align="left"><span class="vers_name">Aheeva CCS </span><span class="vers_numb"><script language="javascript">document.write(MultiArray["AHVersion"][lang])</script></span><br>
                  <img src="img/white_spacer.gif" width="170" height="2">
                </div></td>
              <td width="178" align="right" class="style13" style="border-bottom: 1px solid rgb(187, 187, 187); padding: 4px; background-color: rgb(255, 255, 255);">
                <img src="img/white_spacer.gif" width="170" height="2"> </td>
            </tr>
          <tr>
              <td colspan="2"  align="center" background="img/chain_b2.jpg" style="padding: 5px; background-color: rgb(221, 221, 221);"> 
                <table align="center" border="0" cellpadding="0" cellspacing="2" width="99%">
                  <tbody>
                    <tr> 
                      <td height="23" colspan="2" class="style6" style="padding-bottom: 5px;">Please 
                        enter your username and password.</font></td>
                    </tr>
                    <tr> 
                      <td class="style11" width="143">User Name:</td>
                      <td width="194">
<% String user = "";
   if(request.getParameter("login") != null)
     user = request.getParameter("login");
%>

<input size="20" name="username" onKeyPress="checkTheKey(event)" value="<%=user%>" type="text" class="style11"></td>
                    </tr>
                    <tr> 
                      <td width="143" class="style11">Password:</td>
                      <td>
<input size="20" name="password" value="" type="password" onFocus="this.select()" onKeyPress="checkTheKey(event)" class="style11"></td>
                    </tr>
                    <tr> 
                      <td width="143">&nbsp;</td>
                      <td> <a href="javascript:;" onMouseOver="MM_swapImage('img_button','','img/login2.jpg',1)" onMouseOut="MM_swapImgRestore()"><img src="img/login.jpg" name="img_button" width="70" height="20" border="0" id="img_button" onClick="return submitInfo();"></a> 
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
                </div></td>
          </tr>
        </tbody>
		
		</form>
		
      </table>
    </td>
    <td width="33%">&nbsp;</td>
  </tr>
</table>
<br>
<br>
<table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
  <tr>
    <td height="2">
      <div align="center"><img src="img/line_gray.gif" width="100%" height="1"></div></td>
  </tr>
  <tr>
    <td class="style13" height="21" background="img/tile_orange.jpg"><div align="center">&copy;
		<%
			java.util.Calendar cal = java.util.Calendar.getInstance();
			cal.setTime(new java.util.Date());
			int year = cal.get(Calendar.YEAR);
		%>
        2002-<%= year %> Aheeva Technologie. All Rights Reserved.</div></td>
  </tr>
  <tr>
    <td height="2"><img src="img/line_gray.gif" width="100%" height="1"></td>
  </tr>
</table>
<br>
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
</html>
