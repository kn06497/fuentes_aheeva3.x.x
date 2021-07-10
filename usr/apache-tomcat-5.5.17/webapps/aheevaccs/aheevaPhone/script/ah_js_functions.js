

//*************************************************************************************************
// Configuring the ahCommander Applet (warning do not edit anything else ) */
// Copyright Aheeva Technology 2006
// v1.0
//
// iax_udp_port : 					UDP port use to connect to the Asterisk box when doing 
//									the registration
//
// s_aheevaccs_tcp_port :			TCP port used to connect to the AheevaCCS
//
// s_ahcommander_connection_tcp_port : 	TCP port used for the Aheeva AhPhone client on Asterisk
// 									to connect to the ahCommander Applet
// softphone_enable :				if put to 1 the  softphone client will be used


//----------
var messageCenterQueueAlert = new Array();
var messageCenterQueueStat = new Array();
var messageCenterRunning = false;
var displayComplete = true;
var barLeftPosition;
//This is a data structure holding the messages for the MsgCenter. The data patern is  |color|msg|......|color|msg|
//When we receive a statistic we unshift the color and message
//When we receive an alert we unshift the the color and message 
//When it is time we pop a stat and siplays it
//--------------

var iax_udp_port = 4569;
var s_aheevaccs_tcp_port = "8765";
var s_ahcommander_connection_tcp_port = "8570";
var softphone_enabled = 1;
var not_ready_reason_show = 0;
var s_client_mode = "softphone";

//Exdata
var e_key='';
var e_type='';
var e_value='';
var e_auth='';
var e_readonly='';
var e_loginid='';
var e_tracknum='';
var toggle_center = 0;
var global_center="";
var str_color="000000";
var str_type="test";
var str_temps=0;
var toto=0;
var compt=0;
var temp_center = "";
var verif =0;
var rien=0;
var indice = 0;
var cle =0;
var msg_alert="";
//
//*************************************************************************************************

var ipStr ="x.x.x.x";
var hostnameStr = "hostname";
var s_user = "";
var s_switch = "";
var s_password = "";
var s_phonenumber = "";
var s_aheevaccs_ip = "";
var s_dialstring="";
var s_codec = "";
var previous_codec = "";

var lines_number= 0 ;
var list_num = "";
var w_aheeva_phone = null;
var w_distributePopup = null;
var dial_mode = "normal_dial";
var ahPhoneStatus = "";
var s_line_status="";
var show_ready = 0;
var show_notready = 0;
var show_login = 0;
var show_logout = 0;
var show_hold = 0;
var show_unhold = 0; 
var window_size = 0;
var data_line = 0;
var line_status = 0;
var init_toggle = 0;
var closing_applet = 0;
var agent_login_window = 0;
var dialpad_window = 0;
var initiax = 0;


var create_grid=true;

var initaudio = 0;
var nbre_line_selected = 0;
var dial_button_pushed = 0;
var forced_logout = 0;

var line_status_array = new Array();
var dialed_number_list = new Array();
var lines_list = new Array();
var audio_device_name = new Array();
var audio_device_number = new Array();
var audio_device_capabilities = new Array();
var audio_input_device = new audio_input_device_class("default",0);
var audio_output_device = new audio_output_device_class("default",0);
var desiredWindowHeight = 0;

//********************* Audio devices functions ************************
function ahlog(str){
	document.ahPhoneClient.sendToAhPhone(str);
}

function audio_input_device_class(str_text, str_value)
{
	this.text = str_text;
    this.value = str_value;
}

function audio_output_device_class(str_text, str_value)
{
	this.text = str_text;
    this.value = str_value;
}

function set_audio_input_device(str_text, str_value)
{
	audio_input_device.value = str_value;
	audio_input_device.text = str_text;
	//alert("input set: "+audio_input_device.value);
}

function set_audio_output_device(str_text, str_value)
{
	audio_output_device.value = str_value;
	audio_output_device.text = str_text;
	//alert("output set: "+audio_output_device.value);
}

function get_audio_input_device()
{
	return audio_input_device;
}

function get_audio_output_device()
{
	return audio_output_device;
}

function get_audio_device_name()
{
	return audio_device_name;
}


function get_audio_device_number()
{
	return audio_device_number;
}


function get_audio_device_capabilities(){
	return audio_device_capabilities;
}
//**************************************************

function softphone_client_enabled(){
	return softphone_enabled;
	
}

function resizeWindow(str){
	desiredWindowHeight = str;
	try{
		window.resizeTo(320,str);
	}
	catch (e){
			
	}
}

function resizeWindowToDesiredHeight(){
	resizeWindow(desiredWindowHeight);
}

function updateWindowAspect(){
	if(data_line == 1){
		if (navigator.appName.indexOf('Netscape') != -1){
			window_size = 155;
		}else{
			window_size = 145;
		}
	}
	else{
		if (navigator.appName.indexOf('Netscape') != -1){
			window_size = 155;
		}else{
			window_size = 135;
		}
	}
	
	if(lines_number > 0){
		window_size = window_size + (lines_number * 12)//110 without status bar
	
	}
	else{
		
	}
	hideExDataDiv();
	resizeWindow(window_size);
}


var isCloseConfirmed = false;


function getlang()
{
	var lang = "";

	if (navigator.userAgent.indexOf("MSIE") > 0)
	{
		//alert(navigator.browserLanguage);
		if(navigator.browserLanguage.indexOf("us") > 0)
		{
			lang = "us";
		}
			
	}
	else
	{
	   //alert(window.navigator.language);
	   if(window.navigator.language.indexOf("US") > 0)
	   {
			lang = "us";
		}
	}
	return lang;
}

function unloadMess(){
	closing_applet = 1;
	if(getlang() == "us")
	{
		mess = "Pressing OK will close the Aheeva Phone."
	}
	else
	{
		mess = "Pour fermer le Aheeva Phone, appuyez sur OK."
	}
	
	if(w_distributePopup)
		w_distributePopup.close();
	
	if(dialpad_window) //close dialpad window
				dialpad_window.close();
				
	if(agent_login_window) //close agentlogin window
			agent_login_window.close();
			
    if(!isCloseConfirmed){ 

		if(document.getElementById('dvObjectHolder_AhPhoneJSCommander_status').innerHTML != "Status : LOGGED OUT"){
			return mess;
		}
	}
}

function allSolved(){
    isCloseConfirmed = true;
}


function getDialToneMode(){

		return dial_mode
}

function setDialToneMode(str){
		dial_mode = str;	
}

function setBunload(on){
    window.onbeforeunload = (on) ? unloadMess : null;
}

setBunload(false);


function setAheevaPhoneTitle()
{
	window.top.document.title = "AheevaPhone ["+s_user+"]";
}
//**************************** Cookie functions **************************************************/


function setCookie(name, value, expires, path, domain, secure) {


// set time, it's in milliseconds
var today = new Date();
today.setTime( today.getTime() );

/*
if the expires variable is set, make the correct 
expires time, the current script below will set 
it for x number of days, to make it for hours, 
delete * 24, for minutes, delete * 60 * 24
*/
if ( expires )
{
expires = expires * 1000 * 60 * 60 * 24;
}
var expires_date = new Date( today.getTime() + (expires) );



  var curCookie = name + "=" + escape(value) +
      ((expires) ? "; expires=" + expires_date.toGMTString() : "") +
      ((path) ? "; path=" + path : "") +
      ((domain) ? "; domain=" + domain : "") +
      ((secure) ? "; secure" : "");
  document.cookie = curCookie;
}


/*
  name - name of the desired cookie
  return string containing value of specified cookie or null
  if cookie does not exist
*/

function getCookie(name) {
  var dc = document.cookie;
  var prefix = name + "=";
  var begin = dc.indexOf("; " + prefix);
  if (begin == -1) {
    begin = dc.indexOf(prefix);
    if (begin != 0) return null;
  } else
    begin += 2;
  var end = document.cookie.indexOf(";", begin);
  if (end == -1)
    end = dc.length;
  return unescape(dc.substring(begin + prefix.length, end));
}


/*
   name - name of the cookie
   [path] - path of the cookie (must be same as path used to create cookie)
   [domain] - domain of the cookie (must be same as domain used to
     create cookie)
   path and domain default if assigned null or omitted if no explicit
     argument proceeds
*/

var expires = expires * 1000 * 60 * 60 * 24;

function deleteCookie(name, path, domain) {
  if (getCookie(name)) {
    document.cookie = name + "=" +
    ((path) ? "; path=" + path : "") +
    ((domain) ? "; domain=" + domain : "") +
    "; expires=Thu, 01-Jan-70 00:00:01 GMT";
  }
}

// date - any instance of the Date object
// * hand all instances of the Date object to this function for "repairs"

function fixDate(date) {
  var base = new Date(0);
  var skew = base.getTime();
  if (skew > 0)
    date.setTime(date.getTime() - skew);
}

function writeCookie(){

		var c_phone_number;
		if(s_phonenumber.indexOf("SOFT") !=-1 || s_phonenumber.indexOf("HARD") !=-1)
		{
			c_phone_number = s_phonenumber.substring(4);
		}
		else
		{
			c_phone_number = s_phonenumber;
		}
        var cookie = "";
		//alert(get_audio_output_device().text);
        cookie = "<DATA src=\"cookie\"><LOGIN_INFO>" +
        "<AGENT_ID>"
        + s_user +
        "</AGENT_ID>" +
        "<AHEEVACCS_IP>" 
        + s_aheevaccs_ip +       
        "</AHEEVACCS_IP>"+
        "<PHONE_NUMBER>"
        + c_phone_number +       
        "</PHONE_NUMBER>"+
		"<CLIENT_MODE>" 
		+ s_client_mode	+
		"</CLIENT_MODE>" +
		"<AUDIO_INPUT_DEVICE>" 
		+ get_audio_input_device().text	+
		"</AUDIO_INPUT_DEVICE>" +
		"<AUDIO_OUTPUT_DEVICE>" 
		+ get_audio_output_device().text	+
		"</AUDIO_OUTPUT_DEVICE>" +
		"</LOGIN_INFO>";
		cookie = cookie + "<DIALED_NUMBER>"+ list_num +"</DIALED_NUMBER>"; 
        cookie = cookie + "</DATA>')";
		//alert(cookie);
		setCookie('AheevaCCS AhPhone', cookie, '1', '', '', '');
}


//****************************Popup functions ********************************************/



function getbrowserwidth()
{
    	if (navigator.userAgent.indexOf("MSIE") > 0)
        {
        	return(document.body.clientWidth);
        }
        else
        {
            	return window.outerWidth;
        }
}

function getbrowserheight()
{
            	if (navigator.userAgent.indexOf("MSIE") > 0)
                {
                	return(document.body.clientHeight);
                }
                else
                {
                    	return(window.outerHeight);
                }
}


function openPopup(URL, x, y)
{
	//alert(y);
 	var str =  "toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width="+x+",height="+y+",titlebar=no";
	var popup = new Object()
	popup = window.open(URL, null, str);
	
	if (navigator.userAgent.indexOf("MSIE") > 0)
	{
		window.opener='x';
	}
	else
	{
		
	}
	
	return popup;

}

function CenterPopup(URL,id, width, height)
{

    var X = getbrowserwidth() / 2
    var Y = getbrowserheight() / 2


	if (navigator.userAgent.indexOf("MSIE") > 0)
	{
		var vtop = window.screenTop + (Y - (width/2))
		var xleft = window.screenLeft + (X - (height/2))
	}
	else
	{
	   var vtop = window.screenY + (Y - (width/2))
	   var xleft = window.screenX + (X - (height/2))
	}

	var str =  "toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width="+width+",height="+height+",left="+xleft+",top="+vtop+",titlebar=no";
	var popup = new Object()
	popup = window.open(URL, "_blank", str);
	if (navigator.userAgent.indexOf("MSIE") > 0)
	{
		window.opener='x';
	}
	else
	{
		
	}
	return popup;

}


//Try to open a popup using the same popup , will fail on cross-domain and open a new popup
function distributePopup(URL)
{


	var str =  "";
	if(w_distributePopup && !w_distributePopup.closed){
		try{
			w_distributePopup.location.href=URL;
		}
		catch(e){
			w_distributePopup = window.open(URL, "_blank", str);
		}
	}
	else{
			w_distributePopup = window.open(URL, "_blank", str);
	}
}

function reloadPage(URL,id, width, height)
{
    var X = getbrowserwidth() / 2
    var Y = getbrowserheight() / 2

		if (navigator.userAgent.indexOf("MSIE") > 0)
        {
        	var vtop = window.screenTop + (Y - (width/2))
			var xleft = window.screenLeft + (X - (height/2))
			 window.opener='x';
        }
        else
        {
           var vtop = window.screenY + (Y - (width/2))
		   var xleft = window.screenX + (X - (height/2))
		  
        }
	//fake the window and makes it think its a popup...
	var popup = new Object()
	popup = window.open(URL,"_parent",'');  
	
	
}


function closePopUp()
{
	var popup = new Object()
	popup.close();
	enableButton('login');

}


function agentLoginPopup(user, aheevaccsip, phone_number){

	agent_login_window = CenterPopup('agentLogin.htm', 'agent_login_popup' ,350, 250);
	start_check_window("agentloginpopup");
}


function dialpadPopup(){

	dial_button_pushed = 1; // toggle to true the dial push button
	start_check_window("dialpopup");
	if(dialpad_window && dialpad_window.open  && !dialpad_window.closed)
	{
		dialpad_window.close();
		dialpad_window = CenterPopup('dialpad.htm', 'dialpad' ,135, 200);
	}
	else
	{
		dialpad_window = CenterPopup('dialpad.htm', 'dialpad' ,135, 200);
	}


	
	
	
}


function aheevaphonePopup(){
	
		if (navigator.userAgent.indexOf("MSIE") > 0)
        {
        	
        }
        else
        {
          opener.close();
        }
	
	w_aheeva_phone = CenterPopup('fakeInterface.htm', 'aheevaphone_fake' ,320,90);
	
}

function aheevaphonePopup_real(){
	reloadPage('Interface.htm', 'aheevaphone_real' ,320, 90);
	
	
}



//****************************Applet graphical functions ********************************************/

function initAppletState(){
		setBunload(true);
		updateLineStatus("");
		enableButton('login');
		disableButton('ready');
		disableButton('hangup');
		disableButton('dial');
		disableButton('dialpad');
		disableButton('transfer');
		disableButton('conference');
		disableButton('unhold');
		disableButton('notready_reason');
		updateStatus('LOGGED OUT');
		updateTimer("00:00:00");
		if(forced_logout == 0)
		{
			updateData("");
		}
		else
		{
			forced_logout = 0;
		}
		disableNrrOption();
		stop_timer();
		
		
}

function startAppletState(){

		initAppletState();

}

function updateElementByid(id ,str){
	if(id !=''){

	document.getElementById(id).innerHTML = str;
	}
}


function stopAppletState(){

		writeCookie();
		enableButton('login');
		disableButton('ready');
		disableButton('hangup');
		disableButton('dial');
		disableButton('transfer');
		disableButton('conference');
		disableButton('unhold');
		updateLineStatus("");
		disableNrrOption();
		
		if(dialpad_window)
			dialpad_window.close();
			
		if(agent_login_window)
			agent_login_window.close();
			
		if(s_client_mode == "softphone")
		{
			document.ahPhoneIaxClient.stopvoip_client();
		}
	
}

function errorAppletState(){

		writeCookie();
		updateLineStatus("");
		disableButton('login');
		disableButton('ready');
		disableButton('hangup');
		disableButton('dial');
		disableButton('transfer');
		disableButton('conference');
		disableButton('unhold');
		disableNrrOption();
	
}


function updateDialString(str){
	s_dialstring = s_dialstring + str;
}


function setDialString(str){
	s_dialstring = str;

}

function getDialString(){
	return s_dialstring;
}

function removeDigitDialString(){
	if(s_dialstring.length > 0){
		s_dialstring = s_dialstring.substring(0,(s_dialstring.length-1)); 
	}
}

function clearDialString(){
	s_dialstring = "";
}

function updateData(str){
	if(str ==""){
			data_line = 0;
	}
	else{
			data_line = 1;
	}
	var col = "#" + str_color;
	//alert(col);
	//updateWindowAspect();
	//document.getElementById('dvObjectHolder_AhPhoneJSCommander_data').style.color = col;
	document.getElementById('dvObjectHolder_AhPhoneJSCommander_data').innerHTML = " " + str;
	//setTimeout(40);*/
	
}

function updateStatus(str){
	document.getElementById('dvObjectHolder_AhPhoneJSCommander_status').innerHTML = " Status : "+ str;
	ahPhoneStatus = str;
	if(ahPhoneStatus == "LOGGED OUT")
	{
		if(dialpad_window && dialpad_window.open  && !dialpad_window.closed)
		{
			dialpad_window.close();
		}
	}
}

function getStatus(str)
{
	return ahPhoneStatus;
}

function updateTimer(str){
	document.getElementById('dvObjectHolder_AhPhoneJSCommander_timer').innerHTML = " " + str;
}

function updateLineStatus(str){
	if(str == "")
	{
		stop_flash();
		lines_number = 0 ;
	}
	else
	{
		start_flash();
	}
	updateWindowAspect();
	document.getElementById('dvObjectHolder_AhPhoneJSCommander_line_status').innerHTML = str;
}




function enableButton(id){

	var str;
	
	if(id == 'login'){
		id = 'login_logout_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/logon.png");
		d.setAttribute("title","Log in");
		d.onclick=function(){
		postJavaEvent('login','na');
		}
		show_login = 1;
	}
	
	else if(id == 'logout'){
		id = 'login_logout_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/logoff.png");
		d.setAttribute("title","Log off");
		d.onclick=function(){
			hideExDataDiv();
			postJavaEvent('logout','na');			
		}
	
		show_logout = 1;
	}
	else if(id == 'ready'){
		id = 'ready_notready_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/not_ready.png");
		d.setAttribute("title","Not ready");
		d.onclick=function(){
		postJavaEvent('ready','na');
		}
		
		show_ready=1;
	}
	else if(id == 'notready'){
		id = 'ready_notready_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/ready.png");
		d.setAttribute("title","Ready");
		d.onclick=function(){
		postJavaEvent('notready','na');
		}
		show_notready=1;
	}
	else if(id == 'notready_reason'){
		id = 'ready_notready_reason_dropdown';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/not_ready_arrow.png");
		d.setAttribute("title","Not ready reason");
		d.onclick=function(){
		postJavaEvent('notready_reason','na');
		}
		show_notready=1;
	}
	else if(id == 'hangup'){
		id = 'hangup_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/hangup.png");
		d.setAttribute("title","Hang up");
		hideExDataDiv();
		d.onclick=function(){
		postJavaEvent('hangup','na');
		}		
	}
	else if(id == 'dial'){
		id = 'dial_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/plus_phone.png");
		d.setAttribute("title","Dial number");
		d.onclick=function(){
		postJavaEvent('add_line','na');
		}
	}
	else if(id == 'dialpad'){
		id = 'dialpad_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/dialpad1_short.png");
		d.setAttribute("title","Dialpad");
		d.onclick=function(){
		postJavaEvent('dial','na');
		}
	}
	else if(id == 'transfer'){
		id = 'transfer_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/transfer1.png");
		d.setAttribute("title","Transfer call");
		d.onclick=function(){
		postJavaEvent('transfer','na');
		}
		
	}
	else if(id == 'conference'){
		id = 'conference_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/conference1.png");
		d.setAttribute("title","Conference");
		d.onclick=function(){
		postJavaEvent('conference','na');
		}
		
	}
	else if(id == 'hold'){
		id = 'hold_unhold_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/hold.png");
		d.setAttribute("title","Hold");
		d.onclick=function(){
		postJavaEvent('hold','na');
		}
		
		show_hold = 1;
	}
	else if(id == 'unhold'){
		id = 'hold_unhold_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/unhold.png");
		d.setAttribute("title","Remove hold");
		d.onclick=function(){
		postJavaEvent('unhold','na');
		}
		
		show_unhold = 1;
	}
	else if(id=='exdata')
	{		
		/********exData******/
		id = 'exdata_input';
		var d=document.getElementById(id);
		d.setAttribute("src","./images/arrowup.gif");
		d.onclick=function(){
			if(document.getElementById("extraDataBlock").style.display == "none"){
				showExDataDiv();
			}else{
				hideExDataDiv();
			}
			//showExDataDiv();
			//postJavaEvent('exdata','na');//-->showExDataDiv()			
		}
		
	}
}

function disableButton(id){

	var str;
	
	if(id == 'login'){
		id = 'login_logout_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/logoff_off.png");
		d.setAttribute("title","Log out");
		d.onclick=function(){
		return false;
		}
		show_login = 1;
	}
	
	else if(id == 'logout'){
		id = 'login_logout_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/logon_off.png");
		d.setAttribute("title","Log in");
		d.onclick=function(){
		return false;
		}
	
		show_logout = 1;
	}
	else if(id == 'ready'){
		id = 'ready_notready_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/not_ready_off.png");
		d.setAttribute("title","Not ready");
		d.onclick=function(){
		return false;
		}
		
		show_ready=1;
	}
	else if(id == 'notready'){
		id = 'ready_notready_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/ready_off.png");
		d.setAttribute("title","Ready");
		d.onclick=function(){
		return false;
		}
		
		show_notready=1;
	}
	else if(id == 'notready_reason'){
		id = 'ready_notready_reason_dropdown';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/not_ready_arrow_off.png");
		d.setAttribute("title","Not ready reason");
		d.onclick=function(){
		return false;
		}
	
	}
	else if(id == 'hangup'){
		id = 'hangup_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/hangup_off.png");
		d.setAttribute("title","Hang up");
		postJavaEvent
		d.onclick=function(){
		return false;
		}
	
	}
	else if(id == 'dial'){
		id = 'dial_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/plus_phone_off.png");
		d.setAttribute("title","Dial number");
		d.onclick=function(){
		return false;
		}
		
		
	}
	else if(id == 'dialpad'){
		id = 'dialpad_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/dialpad2_short.png");
		d.setAttribute("title","Dialpad");
		d.onclick=function(){
		return false;
		}
	
	}
	else if(id == 'transfer'){
		id = 'transfer_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/transfer1_off.png");
		d.setAttribute("title","Transfer call");
		d.onclick=function(){
		return false;
		}
	
	}
	else if(id == 'conference'){
		id = 'conference_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/conference1_off.png");
		d.setAttribute("title","Conference");
		d.onclick=function(){
		return false;
		}
	
	}
	else if(id == 'hold'){
		id = 'hold_unhold_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/hold_off.png");
		d.setAttribute("title","Hold");
		d.onclick=function(){
		return false;
		}
		
		show_hold = 1;
	}
	else if(id == 'unhold'){
		id = 'hold_unhold_input';
		var d = document.getElementById(id);
		d.setAttribute("src","./images/unhold_off.png");
		d.setAttribute("title","Remove hold");
		d.onclick=function(){
		return false;
		}	
		show_unhold = 1;
	}
	else if(id=='exdata')
	{
		/********exData******/		
		id = 'exdata_input';
		var d=document.getElementById(id);
		d.setAttribute("src","./images/arrowupdis.gif");
		d.onclick=function(){
			return false;
		}	
	}
	
	
}



//************************************* Timer function ************************************//

var _myTimer_ms = null;
var _myTimer_s  = null;
var _myTimer_m  = null;
var _myTimer_h  = null;

var seconds		= 0;
var minutes		= 0;
var hours		= 0;
var s_seconds	= "";
var s_minutes	= "";
var s_hours		= "";

//function updateMS() { document.exf1.mssec.value = (100+parseInt(document.exf1.mssec.value)) % 1000; }

function updateS()
{ 
		seconds   = (1+parseInt(seconds)) % 60;  
		/* formating */
		if(seconds < 10)
			s_seconds = "0" + seconds;
		else
			s_seconds = "" + seconds;
			
		if (minutes < 10)
			s_minutes = "0" + minutes;
		else
			s_minutes = "" + minutes;
	
		if (hours < 10)
			s_hours = "0" + hours;
		else
			s_hours = "" + hours;
			
		updateTimer(s_hours + ":"  + s_minutes + ":"  + s_seconds);		
}

function updateM()
{ 		
		minutes  = (1+parseInt(minutes))   % 60;   


}
function updateH()
{
		hours  = (1+parseInt(hours));          
}


function resetTime()
{
	var seconds		= null;
	var minutes		= null;
	var hours		= null
	var s_seconds	= null;
	var s_minutes	= null;
	var s_hours		= null;
	updateTimer("00:00:00");
}


function start_timer() {
	stop_timer();
	resetTime();
// _myTimer_ms = setInterval("updateMS()",100);
  _myTimer_s  = setInterval("updateS()",1000);
  _myTimer_m  = setInterval("updateM()",1000*60);
  _myTimer_h  = setInterval("updateH()",1000*60*60);
}

function stop_timer() {
    clearInterval(_myTimer_s);
	clearInterval(_myTimer_m);
	clearInterval(_myTimer_h);
	seconds		= 0;
	minutes		= 0;
	hours		= 0;
}



//***************** flashing text function , used when line on hold **************/
var timer_qa = 0;
var qa_lapse = 10000;

function start_qa() {

	timer_qa  = setTimeout("update_qa()", qa_lapse);
}

function update_qa() {

	document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>HANGUP</BUTTONPUSHED>");   
	
	
	//alert("now");
	s_user = "302"
	s_password = "302"; 
	s_aheevaccs_ip = "302"
	s_phonenumber = "2288";
	//postJavaEvent("login","");
	//document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>LOGIN</BUTTONPUSHED>");
	//attempsConnect(s_user, s_password, "192.168.10.90", s_phonenumber )
	/*
	clearTimeout(timer_qa);
	timer_qa = setTimeout("update_qa()", qa_lapse);
	*/
	
	document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>ADD_LINE</BUTTONPUSHED>");
	document.ahPhoneClient.sendToAhPhone("<MSG_TYPE_SEND_NUMBER>" + "95144484905" + "</MSG_TYPE_SEND_NUMBER>");  
	clearTimeout(timer_qa);
	timer_qa = setTimeout("update_qa()", qa_lapse);
}

var timer_check_window = 0;
var check_window_lapse = 3000;
var dialpopup = 0;
var agentloginpopup = 0;

function start_check_window(str) {

	if(str == "dialpopup")
	{
		dialpopup = 1;
	}
	else if(str == "agentloginpopup")
	{
		agentloginpopup = 1;
	}

	timer_check_window  = setTimeout("update_check_window()", check_window_lapse);
}

function stop_check_window(str) 
{
	
	dial_button_pushed = 0; // toggle dial button push state 
	if(str == "dialpopup")
	{
		dialpopup = 0;
	}
	else if(str == "agentloginpopup")
	{
		agentloginpopup = 0;
	}
   if(timer_check_window) 
   {
      clearTimeout(timer_check_window); 
   }  
   
   
}

function update_check_window() {

	clearTimeout(timer_check_window);
	timer_check_window = setTimeout("update_check_window()", check_window_lapse);
	if(agentloginpopup == 1)
	{
	
		if(!agent_login_window.closed)
		{
		}
		else
		{
			initAppletState();
			stop_check_window("agentloginpopup");
		}
		
	}
	else if(dialpopup == 1)
	{
		
		if(!dialpad_window.closed)
		{
			//ahlog( "!dialpad_window.closed")
		}
		else
		{
			//ahlog( "dialpad_window.closed fermeeeeee")
			postJavaEvent('dialpad_cancel','na');
			stop_check_window("dialpad_cancel");
		}
		
	
	
	
	}
}

var timer_flash = 0;
var flash_lapse = 1000;

function start_flash() {

	timer_flash  = setTimeout("update_flash()", flash_lapse);
}

var i = 0;
function update_flash() {
    var f_lps = flash_lapse;
	if(timer_flash) {
		clearTimeout(timer_flash);
	}
	for(var k = 1 ; k <= lines_number ; k++)
	{
			if( lines_list[k][2]=='MUTED')
			{
				var id = 'table_id_'+lines_list[k][5];
				var d = document.getElementById(id);
				
				if(lines_list[k][9] == 0)
				{
					lines_list[k][9] = 1;
					d.setAttribute("class","ctable_hold");
					d.className="ctable_hold";
				}
				else
				{		
					lines_list[k][9] = 0;
					d.setAttribute("class","ctable_unhold");
					d.className="ctable_unhold";
				}
			}
	}
	
   timer_flash = setTimeout("update_flash()", f_lps);
}


function stop_flash() {
   if(timer_flash) {
      clearTimeout(timer_flash);
     
   }  
}
//****************************Flash du message Center ************************************************************

function updateData_MSG_CENTER(str, col){
	if(str.length > 1){
		document.getElementById('messageBar').style.left     = "0px";
		document.getElementById('messageBar').style.color = col;
		document.getElementById('messageBar').innerHTML = " " + str;
		setTimeout("updateData_MSG_CENTER('','')", 3500);
	} else{
		document.getElementById('messageBar').innerHTML = " ";
		displayComplete = true;
	}
	
}

function scroll_msg_launch(str, col){
	if(col.length == 6 && col.match(/^[A-F0-9\-\_]+$/))
		document.getElementById('messageBar').style.color = "#" + col;
	else if(col.length == 7 && col.charAt(0) == '#' && col.substr(1, 6).match(/^[A-F0-9\-\_]+$/))
		document.getElementById('messageBar').style.color = col;
	else //invalid color
		document.getElementById('messageBar').style.color = "#000000";
	barLeftPosition = 260;
	document.getElementById('messageBar').style.left = barLeftPosition + "px";
	document.getElementById('messageBar').innerHTML = msg_alert;
	msg_alert = str;
	scroll_msg();
}

function scroll_msg(){ 
    var lchar;
	if(msg_alert.length * -6 <  barLeftPosition){
		barLeftPosition --;
		document.getElementById('messageBar').style.left = barLeftPosition + "px";
		setTimeout("scroll_msg()",25);
		return;
	}else{
		document.getElementById('messageBar').innerHTML = " ";
		document.getElementById('messageBar').style.left     = 0;
		displayComplete = true;
	}	
}    






//********************************************************************************************************************


//***************** Not ready reason functions ***********************************/


function showNotReadyReason()
{
	var nrr =  document.getElementById('not_ready_reasons_select');
	if(nrr.options.length > 0){
		var d = document.getElementById("not_ready_reasons_div");
		d.style.display = '';
		document.getElementById('not_ready_reasons_select').focus();
	}
	not_ready_reason_show = 1;
}

function hideNotReadyReason()
{
    var d = document.getElementById("not_ready_reasons_div");
	d.style.display =   'none';
	not_ready_reason_show = 0;
}

function toggleNotReadyReason()
{
	if(not_ready_reason_show == 1){
		hideNotReadyReason();
		not_ready_reason_show = 0;
	}
	else{
		showNotReadyReason();	
		not_ready_reason_show = 1;
	}
}


function removeAllNrrOptions()
{
	var nrr =  document.getElementById('not_ready_reasons_select');
	var i;
	
		for(i=nrr.options.length-1;i>=0;i--)
		{
			nrr.remove(i);
		}
}

function addNrrOption( text )
{

	var nrr =  document.getElementById('not_ready_reasons_select');
	var optn = document.createElement("OPTION");
	optn.text = text;
	optn.value = text;
	nrr.options.add(optn);
}


function disableNrrOption(){
	disableButton('notready_reason');
	hideNotReadyReason();	
}


function enableNrrOption(){
	 showNotReadyReason();
}

function onChangeNrrOption(nrr_selected){
	
	var str;
	if(nrr_selected != "Select Reason")
	{
		str = "<NOT_READY_REASON>"+nrr_selected+"</NOT_READY_REASON>";
		document.ahPhoneClient.sendToAhPhone(str);
		var nrr = document.getElementById('not_ready_reasons_select');
		nrr.selectedIndex = 0;
		
	}
	hideNotReadyReason();
}

//****************************Applet Commununication functions  ********************************************/

function ahPhone_client_connected(){
	updateData("");

}

function attempsConnect(loginid, passwordid, ctiadd, phone_num, iax_format)
{
	if(agent_login_window)
		agent_login_window.close();
	
	s_user = loginid;
	e_loginid=loginid;
	s_password = passwordid; 
	s_aheevaccs_ip = ctiadd;
	s_phonenumber = phone_num;
	/*
	s_user = loginid;
	//Extradata
	e_loginid=loginid;
	s_password = passwordid; 
	s_aheevaccs_ip = ctiadd;
	s_phonenumber = phone_num;
	var id = get_audio_input_device().value;
	var od = get_audio_output_device().value;
	//alert("get: "+id+" "+od);
	if(s_phonenumber.indexOf("SOFT")!=-1)
	{
			s_client_mode = "softphone";
			
		if(initiax == 0)
		{ //initialize iaxclient 
				
			document.ahPhoneIaxClient.initvoip_client(iax_format);
			document.ahPhoneIaxClient.getTheAudioDevices();
			document.ahPhoneIaxClient.setTheAudioDevices(id,od);
			document.ahPhoneIaxClient.stopvoip_client();
			document.ahPhoneIaxClient.startvoip_client();
			initiax = 1;
			//alert(initiax);
		}
		else
		{
			document.ahPhoneIaxClient.setTheAudioDevices(id,od);
			document.ahPhoneIaxClient.stopvoip_client();
			document.ahPhoneIaxClient.startvoip_client();
			
			//alert("seting audio device now to!!!!: "+id+" "+od);
		}
	}
	else
	{
		s_client_mode = "hardphone";
	}
	*/
	document.ahPhoneClient.InitConnection(ctiadd, s_aheevaccs_tcp_port, s_ahcommander_connection_tcp_port );
	stop_check_window("agentloginpopup");
	
}


function sendAuthenticationtoAheevaccs(){
		
		var str = "";
		str = "0,ahphoneclient^NULL^"+  s_aheevaccs_ip + "^" + s_user + "^"+  s_password + "";
		document.ahPhoneClient.sendToAheevaccs(str);  
		
}
 
function sendAuthenticationtoAhPhone(){
		
		var str = "";	
		str = "<MSG_TYPE_IDENTIFICATION><AgentId>"+ s_user +"</AgentId><AgentPassword>"+ s_password +"</AgentPassword><IpAddress>"+ ipStr +"</IpAddress><Hostname>"+ hostnameStr +"</Hostname><ClientMode>socket_mode</ClientMode><PhoneNumber>"+ s_phonenumber+ "</PhoneNumber></MSG_TYPE_IDENTIFICATION>~";
		disableButton('login');
		document.ahPhoneClient.sendToAhPhone(str); 
		if(s_client_mode == "softphone")
		{
			updateData("Waiting for IAX client answer");
		}
		else
		{
			updateData("Waiting for line answer");
		}
		
}



/* Applet create cookie from user data */
function setLoginData(str)
{
	setCookie('AheevaCCS AhPhone', str, '1', '', '', '');
}



function postJavaEvent(e,e_data)
{
	
	hideNotReadyReason();
	if(e == "login"){	
		var xml = getCookie('AheevaCCS AhPhone');
		//alert(xml);
		startParser(xml);
		disableButton('logout');
		agentLoginPopup(s_user, s_switch, s_phonenumber);
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>LOGIN</BUTTONPUSHED>");
		stop_timer();

	}
	else if(e == "logout"){
		stop_timer();
		errorAppletState();
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>LOGOUT</BUTTONPUSHED>"); 
		updateStatus('CLOSING'); 
		if(initiax == 1)
		{
			//document.ahPhoneIaxClient.stopvoip_client();
			//initiax = 0;
		}
		
		//Exdata
		var d=document.getElementById('exdata_input');
		var url = d.getAttribute("src");
		var arr= url.split("/");
		var last = arr.pop();
		
		if(last=="arrowdown.gif" || last =="arrowup.gif")		{
			d.setAttribute("src","./images/arrowupdis.gif");
			d.onclick=function(){
				return false;
			}		
		}
		
		if(create_grid==false)		{
			mygrid.destructor();
			create_grid = true;			
		}	
		
	}
	else if(e == "ready"){
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>READY</BUTTONPUSHED>");   
	}
	else if(e == "notready"){
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>NOT_READY</BUTTONPUSHED>");   
	
	}
	else if(e == "notready_reason"){
		toggleNotReadyReason();
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>NOT_READY_REASON</BUTTONPUSHED>");
   
	}
	else if(e == "hangup"){
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>HANGUP</BUTTONPUSHED>");   
	
	}
	else if(e == "dial"){
		setDialToneMode("dialtone_only");	
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>DIAL</BUTTONPUSHED>"); 
		clearDialString();
		dialpadPopup();	
	}
	else if(e == "transfer"){
		clearDialString();
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>TRANSFER</BUTTONPUSHED>");  
		setDialToneMode("normal_dial");
		dialpadPopup();
	}
	else if(e == "conference"){
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>CONFERENCE</BUTTONPUSHED>");  
		
	}
	
	else if(e == "add_line"){
		setDialToneMode("normal_dial");
		clearDialString();
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>ADD_LINE</BUTTONPUSHED>");  
		//dialpadPopup();
		/* qa stufff */
		
		//document.ahPhoneClient.sendToAhPhone("<MSG_TYPE_SEND_NUMBER>" + "95144484905" + "</MSG_TYPE_SEND_NUMBER>");  
		//start_qa();
		
		
	}
	else if(e == "hold"){
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>HOLD</BUTTONPUSHED>");  
		
	}
	else if(e == "unhold"){
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>UNHOLD</BUTTONPUSHED>");  
	
	}
	else if(e == "dialpad_ok"){
		if(s_dialstring.length > 0){
			document.ahPhoneClient.sendToAhPhone("<MSG_TYPE_SEND_NUMBER>" + s_dialstring + "</MSG_TYPE_SEND_NUMBER>");  
		}
		else{
			document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>DIALPAD_CANCEL</BUTTONPUSHED>"); 
		}
		clearDialString();
		//document.ahPhoneClient.sendToAhPhone("test 123test 123");
		//document.ahPhoneClient.sendToAhPhone("test 123test 123");
		stop_check_window("dialpopup");
	}
	else if(e == "dialpad_cancel"){
		clearDialString();
		document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>DIALPAD_CANCEL</BUTTONPUSHED>");  
		stop_check_window("dialpopup");
	
	}
	else if(e == "not_ready_reason"){
		 updateDialString(e_data);
		 document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>"+e_data+"</BUTTONPUSHED>");
	
	}
	else if(e == "digit"){
		 updateDialString(e_data);
		 document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>"+e_data+"</BUTTONPUSHED>");
	
	}
	else if(e == "bkspc"){
		 removeDigitDialString();
	
	}
	else if(e == "select_line"){
	
		if(dialpad_window && dialpad_window.open  && !dialpad_window.closed)
		{
		//	dialpad_window.close();
		}
		
		document.ahPhoneClient.sendToAhPhone("<MSG_TYPE_SELECT_LINE>"+e_data+"</MSG_TYPE_SELECT_LINE>");
		
		
	}
	else if(e == "selected_for_conference"){
		document.ahPhoneClient.sendToAhPhone("<MSG_TYPE_SELECT_FOR_CONFERENCE>"+e_data+"</MSG_TYPE_SELECT_FOR_CONFERENCE>");
		e_td = "td_id_"+e_data;
		div = document.getElementById(e_td); 
		div.innerHTML =  "<a href=\"\" onClick=\"parent.postJavaEvent('unselected_for_conference','"+e_data+"');return false;\">" + " unconf " + "</a>";
	
	}
	else if(e == "unselected_for_conference"){
		/* send command unselect_for_conference with tracknum */
		 document.ahPhoneClient.sendToAhPhone("<MSG_TYPE_UNSELECT_FOR_CONFERENCE>"+e_data+"</MSG_TYPE_UNSELECT_FOR_CONFERENCE>");
		/* update web page so that next time we send select */
		 e_td = "td_id_"+e_data;
		 div = document.getElementById(e_td); 
		div.innerHTML =  "<a href=\"\" onClick=\"parent.postJavaEvent('selected_for_conference','"+e_data+"');return false;\">" + " conf " + "</a>";
	
	}
	else if(e=="exdata")
	{
		 //document.ahPhoneClient.sendToAhPhone("<BUTTONPUSHED>EXTRADATA</BUTTONPUSHED>");
		// alert("in e=exdata");
		 showExDataDiv();
	}
}


//**********************************Extra Data Functions*******************************************/
function initGrid()
{
	if(create_grid==true)	//first time
	{
		mygrid = new dhtmlXGridObject('dvExtraData');
		mygrid.setImagePath("script/grid/imgs/");
		mygrid.setSkin("xp");
		mygrid.setHeader("Key, Value"); 
		mygrid.setInitWidths("77,214")
		mygrid.setColAlign("left,left")
		mygrid.setColTypes("ed,ed");
		mygrid.setColSorting("str,str");
		mygrid.enableMultiselect(false);
		mygrid.enableAlterCss("even","uneven");
		mygrid.setOnRowSelectHandler(doOnRowSelected);
		mygrid.setOnEditCellHandler(doOnCellEdit)
		//mygrid.enableAutoHeigth(true,"100");
		mygrid.init(); 
		//mygrid.loadXML("../grid.xml");
				
		var d=document.getElementById('add')
		d.setAttribute("src","./images/add.gif");
		d.onclick=function(){
			var ctime=getCurrentTime()
			addLine('Key', 'Value', 'STRINGDATA',e_loginid,'FALSE');
		}	
		
		create_grid=false;		//don't come here again.	
	}


}


function showExDataDiv(){
	var d=document.getElementById('exdata_input');
	d.setAttribute("src","./images/arrowdown.gif");
	d.setAttribute("title","Hide extradata");
	document.getElementById("extraDataBlock").style.display = "block";
	
	if(create_grid==true) 
		initGrid();
	//slideWindow(320)	
	resizeWindow(295);
	checkGridStatus();
	toggleLayer('outer_exdatadiv');
	//testexdata();
}

function hideExDataDiv(){
	if(document.getElementById("extraDataBlock").style.display == "block"){
		var d=document.getElementById('exdata_input');
		d.setAttribute("src","./images/arrowup.gif");	
		d.setAttribute("title","Show extradata")
		document.getElementById("extraDataBlock").style.display = "none";
		toggleLayer('outer_exdatadiv');
	}
}

function slideWindow(finalheight)
{
	var curheight=document.documentElement.clientHeight;
	for(var sw=curheight; sw<finalheight; sw=sw+10)
	{
		resizeWindow(sw);
	}
	
}


function getCurrentTime()
{
	var currentTime = new Date()
	var month = currentTime.getMonth() + 1
	var day = currentTime.getDate()
	var year = currentTime.getFullYear()
	var hours = currentTime.getHours()
	var minutes = currentTime.getMinutes()
	if (minutes < 10)
		minutes = "0" + minutes
	return(year + "/" + month + "/" + day +" "+ hours + ":" +minutes);
}

function toggleLayer(whichLayer){
	
	if (document.getElementById)
	{
		// this is the way the standards work
		var style2 = document.getElementById(whichLayer).style;
		if(style2.display=="block"){
			updateWindowAspect();	
		}
		style2.display =(style2.display=="block"? "none":"block");
	}
	else if (document.all)
	{
		// this is the way old msie versions work
		var style2 = document.all[whichLayer].style;
		style2.display = style2.display? "":"block";
	}
	else if (document.layers)
	{
		// this is the way nn4 works
		var style2 = document.layers[whichLayer].style;
		style2.display = style2.display? "":"block";
	}
}

function addLine(key, val, thetype, auth, rdonly)
{
	//alert('key= '+key+', val='+val+' ,thetyp=e'+thetype+' , auth='+auth+ ', rdnly='+rdonly);
	var all_ids= mygrid.getAllItemIds('|');	
	var numrows;
	if(all_ids!='')
	{
		var arr= all_ids.split("|");
		var last = arr.pop();
		numrows= parseInt(last)+ 1;
	}
	else
		numrows=1;	
	
	mygrid.addRow(numrows,' , ',numrows);
	mygrid.cells(numrows,0).setValue(key);
	mygrid.cells(numrows,1).setValue(val);
	
	mygrid.setUserData(numrows,'READ_ONLY',rdonly);
	mygrid.setUserData(numrows,'TYPE',thetype);
	mygrid.setUserData(numrows,'AUTHOR',auth);
	checkGridStatus();
	enableAttach();
	
}

function enableAttach()
{
	var d=document.getElementById('attach');
	var url = d.getAttribute("src");
	var arr= url.split("/");
	var last = arr.pop();
	
	if(last=="attachdis.gif")
	{
		d.setAttribute("src","./images/attach.gif");
		d.onclick=function(){
			attachData();
		}		

	}
}


function disableAttach()
{
	var d=document.getElementById('attach');
	var url = d.getAttribute("src");
	var arr= url.split("/");
	var last = arr.pop();
	
	if(last=="attach.gif")
	{
		d.setAttribute("src","./images/attachdis.gif");
		d.onclick=function(){
			return false;
		}		

	}

}

function attachData()
{			
	var key='';
	var val='';
	var thetype='';
	var author='';
	var rdonly='';		
	var all_ids= mygrid.getAllItemIds('|');
	var arr= all_ids.split("|");
	var a_i=0;	
	
	var e_data ='<MSG_TYPE_ADD_ATTACHED_DATA><TRACKNUM>';
	e_data += e_tracknum;
	e_data += '</TRACKNUM>';
	
	while (a_i < arr.length)
 	{
	  key 	  = mygrid.cells(arr[a_i],0).getValue();
	  val 	  = mygrid.cells(arr[a_i],1).getValue();
	  author  = mygrid.getUserData(arr[a_i], 'AUTHOR');
	  thetype = mygrid.getUserData(arr[a_i], 'TYPE');
	  rdonly  = mygrid.getUserData(arr[a_i], 'READ_ONLY');
	 
	  
	  
	  if(key!='' && val!='' && (key!='Key'|| val!='Value'))
	  {
	  	e_data+='<ATTACHED_DATA>';
		e_data+='<TYPE>'+thetype+'</TYPE>'
	  	e_data+='<KEY>'+key+'</KEY>';
		e_data+='<VALUE>'+val+'</VALUE>';
		e_data+='<AUTHOR>'+author+'</AUTHOR>';
		e_data+='<READ_ONLY>'+rdonly+'</READ_ONLY>';
		e_data+='</ATTACHED_DATA>';
		mygrid.setUserData(a_i,'READ_ONLY','-1');
		//alert("a_i="+a_i+" userdata= "+mygrid.getUserData(arr[a_i], 'READ_ONLY'));
	  }	  
	  a_i+=1;
  	}			
	e_data+='</MSG_TYPE_ADD_ATTACHED_DATA>'
		
	//alert(e_data);
	document.ahPhoneClient.sendToAhPhone(e_data);
	disableAttach();
}


function removeLine(){	
	if(mygrid.getSelectedId()==null)
		alert("No rows were selected");
	else if(mygrid.getUserData(mygrid.getSelectedId(), 'READ_ONLY').toUpperCase()=='-1')
		alert('Sorry, This line cannot be currently removed.')
	else	
		mygrid.deleteSelectedItem();
	
	checkGridStatus();
	doOnRowSelected(mygrid.getSelectedId());
}

function doOnRowSelected(id)
{
/*	if(mygrid.getSelectedId()!=null)
	{
		var f=document.getElementById('info');
		f.setAttribute("src","./images/info.gif");
		f.onclick=function(){
			showLineInfo();
		}		
	}
	else
	{
		var f=document.getElementById('info');
		f.setAttribute("src","./images/infodis.gif");
		f.onclick=function(){
			return false;
		}		
	}	
	*/ 
}

function doOnCellEdit(stage, rowId,cellInd)
{
	if(stage==0)
	{
		//alert(mygrid.getUserData(mygrid.getSelectedId(), 'READ_ONLY'));
		//alert(mygrid.getUserData(mygrid.getSelectedId(), 'TYPE'));
		//alert(mygrid.getUserData(mygrid.getSelectedId(), 'AUTHOR'));
		if(mygrid.getUserData(mygrid.getSelectedId(), 'READ_ONLY').toUpperCase()=='-1')
		{
			alert('Sorry, This field cannot be currently modified.')
			return false;
		}
	}
	else if(stage==1)	{
		
	}
	else if(stage==2)
	{
		/*var ctime=getCurrentTime();
		mygrid.setUserData(rowId,'LAST_MODIFICATION',ctime);*/
	}
	return true;
}

function testexdata()
{
	
	var xml_data="<DATA src=\"ahphone\"><EXTRADATA><ATTACHED_DATA>"+
		"<TYPE>STRINGDATA</TYPE>"+
		"<KEY>CALLDATE</KEY>"+
		"<VALUE>20070105</VALUE>"+
		"<AUTHOR>ROUTING_SCRIPT</AUTHOR>"+
		"<READ_ONLY>true</READ_ONLY>"+
		"</ATTACHED_DATA></EXTRADATA>"+
		"</DATA>"
		
	
		//alert(xml_data);
		startParser(xml_data);
}

function showLineInfo()
{		
	var display='Name:'+ mygrid.cells(mygrid.getSelectedId(),0).getValue();
	display+='\nValue:'+ mygrid.cells(mygrid.getSelectedId(),1).getValue();
	display+='\nCreated by:' + mygrid.getUserData(mygrid.getSelectedId(), 'AUTHOR');	
	display+='\nIs read-only?:' + mygrid.getUserData(mygrid.getSelectedId(), 'READ_ONLY');
	alert(display);
}

function checkGridStatus()
{
	if(mygrid.getRowsNum()==0)
	{
		var d=document.getElementById('remove')
		d.setAttribute("src","./images/delonedis.gif");
		d.onclick=function(){
			return false;
		}
		
		d=document.getElementById('attach')
		d.setAttribute("src","./images/attachdis.gif");
		d.onclick=function(){
			return false;
		}
		
	}
	else
	{
		var d=document.getElementById('remove')
		d.setAttribute("src","./images/delone.gif");
		d.onclick=function(){
			removeLine();
		}
		
		d=document.getElementById('attach')
		d.setAttribute("src","./images/attach.gif");
		d.onclick=function(){
			attachData();
		}		
		
	}
	
	
}

function appendLine(ptype,pkey, pvalue, pauth, prdonly)
{
	var key='';
	var val='';
	var all_ids='';
	var arr='';
	var iter_i=0;
	if(mygrid.getRowsNum()!=0) 
	{
		all_ids= mygrid.getAllItemIds('|');	
		arr= all_ids.split("|");		
		while (iter_i < arr.length)
	 	{
		  key = mygrid.cells(arr[iter_i],0).getValue();
		  val = mygrid.cells(arr[iter_i],1).getValue();
		  	  
		  if(key!='' && val!='' && (key!='Key'|| val!='Value'))
		  {
			  	if(pkey==key)	//already exists, just modify and return
			  	{	
				//alert(pkey+"="+key)	
				mygrid.cells(arr[iter_i],1).setValue(pvalue);
				mygrid.setUserData(iter_i,'TYPE',ptype);
				mygrid.setUserData(iter_i,'AUTHOR',pauth);
				mygrid.setUserData(iter_i,'READ_ONLY',prdonly);
				return;			
			}
		  }	  
		  iter_i++;
	  	}
	}
	//Ever reach here means new value
	//alert("here"+ptype+pkey+ pvalue+ pauth+ prdonly)
	if(pkey.toUpperCase()!="URL")	//Don't show url
		addLine(pkey, pvalue, ptype, pauth, prdonly);
}



//****************************Applet XML parsing functions ********************************************/

var message_src = "unknown";
var waitingforregistration = 0;
var authenticated = 0;


function ah_get_message_param(xpath, param){
	if(xmlAttrArray[xpath]){	
			var arr=xmlAttrArray[xpath]
			var atts=''
			for (j in arr){
				if(j == param){
					return arr[j];
				}
			}
		}	
}

function ah_get_text_param(xpath){

	var s=trim(xmlTextArray[xpath]);
	if(s == "")
	{
		return "";
	}
	else
		return s;
}



	
function ah_decode_message(xpath, i , lenght){
	if(i == 0 ){ //reset button state ( this is to know if one was activated before disabling a button that is over it.	
		show_ready = 0;
		show_notready = 0;
		show_login = 0;
		show_logout = 0;
		show_hold = 0;
		show_unhold = 0;		
	}
	
	if ( xpath == "/DATA"){
		waitingforregistration = 0;
		authenticated = 0;
		message_src = "unknown";
		var p = ah_get_message_param(xpath, "src");
		
		if(p == "ahphone"){	
			message_src = "ahphone";
		}
		else if(p == "aheevaccs"){			
			message_src = "aheevaccs";
		}
		else if(p == "cookie"){
			message_src = "cookie";
		}		
	}
	var tag ;	
	if(xpath.indexOf("DATA/")==1)
	{
		tag = xpath.substring(6); 
		//alert(tag);
	}
	else
	{
		//alert("else "+xpath);
		tag = xpath;
	}
	
	if(message_src == "ahphone"){
		if ( tag == "LOGOUT"){
			if(ah_get_message_param(xpath, "enable") == '1'){
				enableButton('logout');
				show_logout = 1;
				enableButton('exdata');
			}else{
				if(show_login == 0){
					disableButton('login');
				}
			}

		}else if ( tag == "LOGIN"){
			if(ah_get_message_param(xpath, "enable") == '1'){
				enableButton('login');
				show_login = 1;
				disableButton('exdata');
			}else{
				disableButton('login');
				if(show_logout == 0){
					disableButton('login');
				}
			}
		}else if ( tag == "READY"){
			if(ah_get_message_param(xpath, "enable") == '1'){	
				enableButton('ready');
				show_ready = 1;
			}else{
				if(show_notready == 0){
					disableButton('ready');
				}
			}		
		}else if ( tag == "NOT_READY"){
			if(ah_get_message_param(xpath, "enable") == '1'){
				enableButton('notready');
				show_notready = 1;
			}else{
				if(show_ready == 0){
					disableButton('notready');
				}
			}
		}else if ( tag == "DIAL"){
			if(ah_get_message_param(xpath, "enable") == 1 ){
				enableButton('dialpad');	
			}else{
				disableButton('dialpad');
			}
		}else if ( tag == "HANGUP"){
			if(ah_get_message_param(xpath, "enable") == '1'){
				enableButton('hangup');
			}else{
				disableButton('hangup');
			}
		
		}else if ( tag == "TRANSFER"){
			if(ah_get_message_param(xpath, "enable") == '1'){
				enableButton('transfer');
			}else{
				disableButton('transfer');
			}
		
		}else if ( tag == "ADD_LINE"){
			if(ah_get_message_param(xpath, "enable") == '1'){
				enableButton('dial');
			}else{
				disableButton('dial');
			}
		
		}else if ( tag == "CONFERENCE"){
			if(ah_get_message_param(xpath, "enable") == '1'){
				enableButton('conference');
			}else{
				disableButton('conference');
			}		
		}else if ( tag == "CLOSE_PHONE"){
			if(ah_get_message_param(xpath, "enable") == '1'){
				
			}else{
				
			}
		
		}else if ( tag == "HOLD"){
			if(ah_get_message_param(xpath, "enable") == '1'){	
				enableButton('hold');		
				show_hold = 1;
			}else{
				if(show_unhold == 0){
					disableButton('hold');
				}
					
			}
		}else if ( tag == "UNHOLD"){
			if(ah_get_message_param(xpath, "enable") == '1'){	
				enableButton('unhold');
				show_unhold = 1;
			}else{				
				if(show_hold == 0){
					hideButton('unhold');
				}
			}
		}else if ( tag == "MSG_TYPE_NOT_READY_REASONS"){				
			if(lenght ==1){
				removeAllNrrOptions();
				disableNrrOption();
				
			}else{
				enableButton('notready_reason');
				removeAllNrrOptions();
				addNrrOption( "Select Reason");
			}
		}else if ( tag.indexOf("MSG_TYPE_NOT_READY_REASONS/Reason")!=-1){
			addNrrOption( ah_get_text_param(xpath) );
		}else if ( tag == "MSG_TYPE_START_TIMER"){
			//ahlog("MSG_TYPE_START_TIMER");
			start_timer();
		}else if ( tag == "MSG_TYPE_STOP_TIMER"){
			//ahlog("MSG_TYPE_STOP_TIMER");
			stop_timer();
		}else if ( tag == "MSG_TYPE_ADD_LINE"){
			setDialToneMode("normal_dial");
			clearDialString();
			dialpadPopup();
		}else if ( tag == "MSG_TYPE_TICKER"){
			var str = ah_get_text_param(xpath);
			if(str.indexOf("forced_logout:") !=-1 && str.length > 0 ){
				forced_logout = 1;
				str = str.substr(str.indexOf(":")+1,str.length);
			}else{
				forced_logout = 0;
			}
			updateData(str);
		}else if ( tag == "MSG_TYPE_MESSAGE_CENTER/Type"){
			str_type = ah_get_text_param(xpath);
		}else if ( tag == "MSG_TYPE_MESSAGE_CENTER/Color"){
			
			str_color = ah_get_text_param(xpath);
		}else if ( tag == "MSG_TYPE_MESSAGE_CENTER/Temps"){			
			str_temps = ah_get_text_param(xpath);
		}else if ( tag == "MSG_TYPE_MESSAGE_CENTER/Message_Body"){
			if(str_type == "STAT"){
				global_center = ah_get_text_param(xpath);
				temp_center = global_center.split("^");
				for(var i=0; i < temp_center.length; i++) {
					messageCenterQueueStat.unshift(str_color, temp_center[i]);
				}
				//long = temp_center.length;
				//updateData_MSG_CENTER(" ");
			}else{
			//updateData("Message d'alerte");
			//alert =1;
			msg_alert = ah_get_text_param(xpath);
			msg_alert = msg_alert.replace(/ /g,"&nbsp;"); //Ajout
			messageCenterQueueAlert.unshift(str_color, msg_alert);
			//scroll_msg();
		    }
			if(!messageCenterRunning){
				messageCenterRunning = true;
				displayMessages();
			}
	    }else if ( tag == "MSG_TYPE_PHONE_STATUS"){
			updateStatus(ah_get_text_param(xpath));
		}else if ( tag == "AHPVERSION"){
			document.getElementById("version").innerHTML = "Version: " + ah_get_text_param(xpath);
		}else if ( tag == "MSG_TYPE_URL"){
		
			var str = ah_get_text_param(xpath);
			if(str ==""){
				alert("URL empty.");
			}else{
				distributePopup(str);
			}
		}else if ( tag == "MSG_TYPE_PREVIEW/Url"){		
			var str = ah_get_text_param(xpath);
			if(str ==""){
				//alert("URL empty.");
			}else{
				distributePopup(str);
			}
		}else if ( tag == "MSG_TYPE_PREVIEW/Dial_Number"){		
			var str = ah_get_text_param(xpath);
			if(str ==""){
				alert("Number to dial empty.");
			}else{
				setDialToneMode("normal_dial");
				clearDialString();
				setDialString(str);
				dialpadPopup();
			}
		}else if ( tag == "MSG_TYPE_HEARTBEAT"){
		
					document.ahPhoneClient.sendToAhPhone("<MSG_TYPE_HEARTBEAT></MSG_TYPE_HEARTBEAT>");
		}else if( tag == "MSG_TYPE_LOGIN_SUCCESS" ){
			updateData("");
			setAheevaPhoneTitle();
			
			//postJavaEvent('logout','na');
			//clearTimeout(timer_qa);
			//timer_qa = setTimeout("update_qa()", qa_lapse);
			
		}else if( tag == "MSG_TYPE_LOGIN_FAILED/reason" ){
			var text_value = ah_get_text_param(xpath);
			updateData(text_value);
			
		}else if(tag=="ATTACHED_DATA"){
			//Reinitialise all exdata variables
			e_key='';
			e_type='';
			e_value='';
			e_creattime='';
			e_lastmod='';
			e_auth='';
			e_autodisp='';
			e_readonly='';
				
		}else if(tag=="ATTACHED_DATA/TYPE"){
			e_type=ah_get_text_param(xpath);
		}else if(tag=="ATTACHED_DATA/KEY"){
			e_key=ah_get_text_param(xpath);
		}else if(tag=="ATTACHED_DATA/VALUE"){
			//alert("here")
			e_value=ah_get_text_param(xpath);		
		}else if(tag=="ATTACHED_DATA/AUTHOR"){
			e_auth=ah_get_text_param(xpath);		
		}else if(tag=="ATTACHED_DATA/READ_ONLY"){			
			e_readonly=ah_get_text_param(xpath);
			//alert("here");
			appendLine(e_type,e_key, e_value, e_auth, e_readonly);
		}else if(tag=="MSG_TYPE_CLEAR_EXTRADATAS"){
			mygrid.clearAll(false);
		}else if(tag=="MSG_TYPE_CALL_INFOS/TRACKNUM"){
			e_tracknum=ah_get_text_param(xpath);
		}else if(tag=="MSG_TYPE_CLOSE_DIAL"){
			if(dialpad_window && dialpad_window.open  && !dialpad_window.closed){
				dialpad_window.close();
			}
		}else if(tag=="MSG_TYPE_CLOSE_TRANSFER"){
			//e_tracknum=ah_get_text_param(xpath);
		}else if(tag=="MSG_TYPE_NEWCALL"){
			if(typeof ( mygrid ) != "undefined")
				mygrid.clearAll();
			if(create_grid==true){
				showExDataDiv();
				enableAttach();
			}
		}else if(tag=="EXTRA_DATA_DROPDOWN"){
			if(ah_get_message_param(xpath, "enable") == '1'){
				enableAttach();
			}else{
				disableAttach();
			}
		}
						
		if(!init_toggle){
			ipStr = ah_get_message_param(xpath, "ip");
			hostnameStr = ah_get_message_param(xpath, "hostname");
			init_toggle = 1;
		
		}	
		else if ( tag.indexOf("MSG_TYPE_LINE_STATUS")!=-1){
				
				
				if(lenght == 1){ //empty tag
					s_line_status = "<table border=1></table>";
					lines_number = 0 ;
					updateData("");	
					disableButton('unhold');		
					show_hold = 0;
					disableButton('hold');		
					show_unhold = 0;
					if(dialpad_window && dialpad_window.open  && (ahPhoneStatus == "IN CALL"))
					{
						dialpad_window.close();
					}
					
					for(var k = 1 ; k <= lines_number ; k++){
									lines_list[k]= " ";
					}
					for (j = 0 ; j < line_status_array.length;  j++)
					{	
						line_status_array[j] = " "
					}
					updateLineStatus(s_line_status);
				
				}
				else{
					if ( tag == "MSG_TYPE_LINE_STATUS"){
							
							if(i == 1){
								nbre_line_selected = 0;
								setDialToneMode("normal_dial");
								s_line_status = "";
								lines_number = 0 ;
								disableButton('unhold');		
								show_hold = 0;
								disableButton('hold');		
								show_unhold = 0;
								
								for(var k = 1 ; k <= lines_number ; k++)
								{
									lines_list[k]= " ";
								}
								for (j = 0 ; j < line_status_array.length;  j++)
								{	
									line_status_array[j] = " "
								}
							}
							
					}
				
									if(tag.indexOf("tracknum")!=-1){
											lines_number++;
											line_status_array[7]='unselected';
											line_status_array[5]=ah_get_text_param(xpath);
											
									}
									else if(tag.indexOf("callername")!=-1){
											line_status_array[3]=ah_get_text_param(xpath);	
									}
									else if(tag.indexOf("status")!=-1){
											line_status_array[2]=ah_get_text_param(xpath);	
											
									}
									else if(tag.indexOf("name")!=-1){
											line_status_array[1]=ah_get_text_param(xpath);	
									}
									else if(tag.indexOf("select_for_extconf")!=-1){
											line_status_array[6]=ah_get_text_param(xpath);	
									}
									else if(tag.indexOf("selected")!=-1){
											
											if(ah_get_text_param(xpath) == 1){
												line_status_array[7]='selected';
												nbre_line_selected = nbre_line_selected + 1;
											
											}
											else{
												line_status_array[7]='unselected';
											}
											
									}
									else if(tag.indexOf("callerid")!=-1){
											var str = ah_get_text_param(xpath);
											if( str.indexOf("OUT")!=-1){
												line_status_array[4]= str.substr(3);
											}
											else{
												line_status_array[4]= str;
											}
												
	
											var sline_status;
											var left_td_margin;
											var right_td_margin;
											var table_border=0;
											
											
											var bgcolor;
											if( line_status_array[6] == 0){
												if(line_status_array[7]=='selected'){
													bgcolor="#ABCDEF";
													//bgcolor="";
												
												}
								
												else{
													bgcolor="";
												}
											}
											else{
												bgcolor="#ABCDEF";
											}
											
											if(line_status_array[6]=='1'){
												disableButton('hold');
												sline_status = " CONFERENCE ";
												left_td_margin="<table  bgColor='"+bgcolor+"'' id='table_id_"+line_status_array[5]+ "' cellspacing=0 cellpadding=0 style='border: 0px solid #000;'>";
												right_td_margin="</table>";
												table_border=1;

											}
											else{
												table_border=0;
												if(line_status_array[7]=='selected'){
													//alert("AAAAA");
														if(line_status_array[2]=='UNMUTED'){
																			if(dialpopup == 1)
																			{
																				disableButton('hold');
																				disableButton('unhold');
																				//ahlog( "line unmuted / dialpopup =1")
																			}
																			else
																			{
																				enableButton('hold');	
																				//ahlog( "line unmuted / dialpopup =0")
																	
																			}
																				
																			show_hold = 1;
																			//sline_status = "&nbsp;UP&nbsp ";
																			
														}
														else
														{
																			if(dialpopup == 1)
																			{
																				disableButton('hold');
																				disableButton('unhold');
																				//ahlog( "line muted / dialpopup =1")
																			}
																			else
																			{
																				enableButton('unhold');
																				//ahlog( "line muted / dialpopup =0")
																					
																			}
																			
																			show_unhold = 1;
								
																			//sline_status = " HOLD ";	
														}
														left_td_margin="<table  bgColor='"+bgcolor+"'' id='table_id_"+line_status_array[5]+ "'  OnMouseDown=\"postJavaEvent('select_line','"+line_status_array[5]+"')\" cellspacing=0 cellpadding=0 style='border: 1px solid #000;'>";
														right_td_margin="</table>";
												}
												else{
													if(line_status_array[2]=='UNMUTED'){					
																		
																		//sline_status = " UP ";
																		
													}
													else{				
																		//sline_status = " HOLD ";
																		
													}
													left_td_margin="<table  bgColor='"+bgcolor+"'' id='table_id_"+line_status_array[5]+ "'  OnMouseDown=\"postJavaEvent('select_line','"+line_status_array[5]+"')\" cellspacing=0 cellpadding=0 style='border: 0px solid #000;  margin-left: 1px; margin-top: 1px; margin-bottom: 1px; margin-right: 1px;'>";
													right_td_margin="</table>";
												
												}
											}
											var str= " ";
											str = str + "<td>"+left_td_margin+"</td>"
											str = str + "<td>&nbsp;</td><td>"+ line_status_array[0] + "&nbsp;</td>"
											str = str + "<td>" + line_status_array[3] + "&nbsp;</td>"
											str = str + "<td>" + line_status_array[4] + "&nbsp;</td>"
											str = str + "<td>"+right_td_margin+"</td>"
										
											line_status_array[8] = bgcolor; //keep the background color for flash purposes
											line_status_array[9] = 0; // flash toggle 
											
											s_line_status = s_line_status + "<tr>"+str+"</tr>";
											
											var line_status_array_tmp = new Array();
											for(var o = 0 ; o < 9 ; o ++){
												line_status_array_tmp[o] = line_status_array[o];
											}
										
											lines_list[lines_number]=line_status_array_tmp;

											if(i == lenght){
			
												s_line_status = "<table cellspacing=0 cellpadding=0 style='border: "+table_border+"px solid #000;'>"+s_line_status+"</table>";
												updateLineStatus(s_line_status);
												s_line_status = "";	
												//if no line selected close dialpad
												//alert(nbre_line_selected);
												if(dialpad_window && dialpad_window.open  && (ahPhoneStatus == "IN CALL"))
												{
													if(nbre_line_selected == 0 && dial_button_pushed == 0)
													{
														dialpad_window.close();
														dial_button_pushed = 0;
														
													}
												}
											}
											
											
									}
									else if(tag.indexOf("number")!=-1){
											if(ah_get_text_param(xpath)!=""){
												line_status_array[0]=ah_get_text_param(xpath);
												
											}
									}
				} // lenght == 1 
		} //MSG_TYPE_LINE_STATUS
	}
	else if( message_src == "aheevaccs" ){
		if( tag == "MSG_TYPE_AHPHONE_AUTHENTICATE/SWITCH" ){
			var text_value = ah_get_text_param(xpath);
			// This command is for access to AheevaPhone exteranly uncomment
			//text_value = "XXX.XXX.XXX.XXX"; //EXTERNAL IP ADDRESS
			s_switch = text_value;
			if(s_client_mode == "hardphone"){
				updateData("Successfull Authentication : please wait for connection to AheevaPhone");
				document.ahPhoneClient.InitAhPhoneConnection( s_switch  , s_ahcommander_connection_tcp_port);
			}
			else{
					waitingforregistration = 0;
					var id = get_audio_input_device().value;
					var od = get_audio_output_device().value;
					//alert("get: "+id+" "+od);
					if(s_phonenumber.indexOf("SOFT")!=-1)
					{
							s_client_mode = "softphone";
							
						if(initiax == 0)
						{ //initialize iaxclient 
						
							if(s_codec == "")
								s_codec = "ulaw";
						
							ahlog("Going to init the aheevaphone with codec " +  s_codec);
							document.ahPhoneIaxClient.initvoip_client(s_codec);
							document.ahPhoneIaxClient.getTheAudioDevices();
							document.ahPhoneIaxClient.setTheAudioDevices(id,od);
							document.ahPhoneIaxClient.stopvoip_client();
							document.ahPhoneIaxClient.startvoip_client();
							initiax = 1;
							previous_codec = s_codec;
							//alert(initiax);
						}
						else
						{
							if(s_codec == "")
								s_codec = "ulaw";
								
							document.ahPhoneIaxClient.setTheAudioDevices(id,od);
							if(previous_codec != s_codec){
								document.ahPhoneIaxClient.modifyIaxcFormats(s_codec);
							}
							document.ahPhoneIaxClient.stopvoip_client();
							document.ahPhoneIaxClient.startvoip_client();
							previous_codec = s_codec;
							//alert("seting audio device now to!!!!: "+id+" "+od);
						}
					}
					else
					{
						s_client_mode = "hardphone";
					}
					updateData("Successfull Authentication : please wait registering");
					document.ahPhoneIaxClient.registerAhPhone(s_user, s_password, text_value, parseInt( iax_udp_port ) );
			}
		}
		else if ( tag == "MSG_TYPE_AHPHONE_AUTHENTICATE/RESPONSE"){
			 var text_value = ah_get_text_param(xpath);
			 if(text_value == "success"){
				authenticated = 1;
				if(s_client_mode == "softphone"){
					waitingforregistration = 1;
				}
				else{
					waitingforregistration = 0;
				}
			 }
			 else{
				authenticated = 0;	
			 }
		}
		else if ( tag == "MSG_TYPE_AHPHONE_AUTHENTICATE/REASON"){
				var text_value = ah_get_text_param(xpath);

				if(authenticated == 0 ){
					authenticated = 0;
					if(s_client_mode == "softphone")
						document.ahPhoneClient.CloseAheevaccsConnection();
					enableButton('login');
					updateData(text_value);
				}	
		}	
		else if ( tag == "MSG_TYPE_AHPHONE_AUTHENTICATE/IAX_CODEC"){
				var text_value = ah_get_text_param(xpath);
				s_codec = text_value;
				ahlog("IAXCODEC " + text_value);
				
		
		}	
		else if ( tag == "MSG_TYPE_EXCEPTION"){
		
			var str = ah_get_text_param(xpath);
			if(str ==""){
				
			}
			else if( str == "Can\'t connect to AheevaCCS"){
				updateData(str);
				enableButton('login');	
			}
		
		}
		else if ( tag == "MSG_TYPE_CONNECTION"){
		
			var str = ah_get_text_param(xpath);
			if(str ==""){
				
			}
			else if( str == "Connecting to AheevaCCS"){
				updateData(str);
			}
		
		}
		tag = "";
	}
	else if( message_src == "cookie"){
	
	
		if ( tag == "LOGIN_INFO/AGENT_ID"){
				s_user=ah_get_text_param(xpath);
		}
		else if ( tag == "LOGIN_INFO/AHEEVACCS_IP"){
				s_aheevaccs_ip=ah_get_text_param(xpath);
		}
		else if ( tag == "LOGIN_INFO/PHONE_NUMBER"){
				s_phonenumber=ah_get_text_param(xpath);
		}
		else if ( tag == "LOGIN_INFO/CLIENT_MODE"){
				s_client_mode=ah_get_text_param(xpath);
		}
		else if ( tag == "LOGIN_INFO/CLIENT_MODE"){
				s_client_mode=ah_get_text_param(xpath);
		}
		else if ( tag == "LOGIN_INFO/AUDIO_INPUT_DEVICE")
		{
				set_audio_input_device(ah_get_text_param(xpath), 0);	
		}
		else if ( tag == "LOGIN_INFO/AUDIO_OUTPUT_DEVICE")
		{
				set_audio_output_device(ah_get_text_param(xpath), 0);
		}
		else if ( tag == "DIALED_NUMBER"){
			list_num = ah_get_text_param(xpath);			
		}
	}
}

	
//****************************AppletIaxClient registration feedback ********************************************/	
	
function ahPhoneIaxClient_register(str){

	if( str == "regAcknowledged" ){
		updateData("");
		document.ahPhoneClient.InitAhPhoneConnection(  s_switch , s_ahcommander_connection_tcp_port);
	}
	else if( str == "regRejected" ){
		updateData("IAX Client registration rejected");
		if(s_client_mode == "softphone"){
			document.ahPhoneClient.CloseAheevaccsConnection();
			enableButton('login');
		}
	}
	else if( str == "regTimedout" ){
		updateData("IAX Client registration timeout");
		if(s_client_mode == "softphone"){
			document.ahPhoneClient.CloseAheevaccsConnection();
			enableButton('login');
		}
	}

}


function ahPhoneIaxClient_clear_audio_device(){
	audio_device_name.length = 0;
	audio_device_number.length = 0;
	audio_device_capabilities.length = 0;
}

function ahPhoneIaxClient_audio_device(str,i,cap){
	//alert(str +" " +i+" " +cap);
	audio_device_name.push(str);
	audio_device_number.push(i);
	audio_device_capabilities.push(cap);
}

/**
 * uses the array to display the messages as long as the array is not empty
 */
function displayMessages(){
	var color;
	var msg;
	//greater than 1 because we need at least 2 objects and we have no mutex so we cannot have full control
	while(messageCenterQueueStat.length > 1 || messageCenterQueueAlert.length > 1){
		if(displayComplete){
			if(messageCenterQueueAlert.length > 0){
				msg = messageCenterQueueAlert.pop();
				color = messageCenterQueueAlert.pop();
				displayComplete = false;
				scroll_msg_launch(msg, color);
			}else{
				msg = messageCenterQueueStat.pop();
				color = messageCenterQueueStat.pop();
				displayComplete = false;
				updateData_MSG_CENTER(msg, color);
			}
		}
		setTimeout("displayMessages()",600);
		return;
	}
	messageCenterRunning = false;
}


