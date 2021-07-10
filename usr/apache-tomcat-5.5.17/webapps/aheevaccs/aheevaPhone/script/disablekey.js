setEventListenerkeypress(pushKey);
setEventListenerkeyup(releaseKey);

var focus_on_input = 0;
var prev_num="";
var max_prev_num=10;	//max numbers to remember in cookie

var agentLoginFocus = "";


///////////////////////////////////
function clickIE4(){
	if (event.button==2){
	return false;
	}
}

function clickNS4(e){
	if (document.layers||document.getElementById&&!document.all){
		if (e.which==2||e.which==3){
		return false;
		}
	}
}

if (document.layers){
	document.captureEvents(Event.MOUSEDOWN);
	document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
	document.onmousedown=clickIE4;
}

document.oncontextmenu=new Function("return false");


function disableEvent(str){
	if (event.preventDefault) event.preventDefault();
	
	if (document.all && window.event && !event.preventDefault) {
		
		 if(str == 17);
		 else{
			event.returnValue = false;
			event.keyCode = 0;
		}
   }
   
}

var ok_close = 0;
var dialpad_open = 0;
var agentlogin_open = 0;
var s_dialstring = "";
var shift = 0;

if(dialpad_open == 1)
{
	s_dialstring = window.opener.getDialString()+s_dialstring;
}

function checkClose() {

	if(ok_close == 0){
		window.opener.postJavaEvent('dialpad_cancel','na');
	}
	else{
		window.opener.postJavaEvent('dialpad_ok','na');
	}
	dialpad_open = 0;
}

function setCloseOk() {
	saveNumbers();
	ok_close = 1;
	window.close();
}

function setDiapadOpen() {
	dialpad_open = 1;
}

function setAgentLogin(str) {
	agentlogin_open = str;
}

function setAgentLoginFocus(btn){
	agentLoginFocus = btn;
}


function checkKey(keyCode, shiftCode, ctrlCode){
	var str ='';
	if(dialpad_open == 0){
		if ((keyCode > 110 && keyCode < 124) || ((keyCode !=86 && keyCode !=67 && keyCode !=17) && ctrlCode) ) 
		{
			disableEvent(keyCode);
			return false;
		}
		else
		{
		   if(agentlogin_open == 1 && window.opener != null)
		   {
				if(keyCode == 13)
				{
					if(agentLoginFocus != "Submit" && agentLoginFocus != "Cancel" )
					{
						validateInfo();
					}
				}
			}
		}
	}
    else
	{// shift // ctrl c ctrl v 
	//if( keyCode!=16 )
	//alert(keyCode + shiftCode);
	  if ((keyCode > 110 && keyCode < 124) || ((keyCode !=86 && keyCode !=67 && keyCode !=17) && ctrlCode) || !((keyCode > 47 && keyCode < 58) || (keyCode > 95 && keyCode < 106) || keyCode==42 || keyCode==45 || keyCode==13 || keyCode==27 || keyCode=="clr" || keyCode==126 || keyCode==106 || keyCode==16 || keyCode==8 || keyCode==35 ) ){
		
		disableEvent(keyCode);
		return false;
	  }
	  else if(keyCode == 48 || keyCode == 96 ){
		window.opener.postJavaEvent('digit','0');
		str = '0';
	  }
	   else if(keyCode == 49 || keyCode == 97){
		window.opener.postJavaEvent('digit','1');
		str = '1';
	  
	  }
	   else if(keyCode == 50 || keyCode == 98){
	  
		window.opener.postJavaEvent('digit','2');
		str = '2';
	  
	  }
	   else if(keyCode == 51 || keyCode == 99){
	  
		window.opener.postJavaEvent('digit','3');
		str = '3';
	  
	  }
	   else if(keyCode == 52 || keyCode == 100){
	  
		window.opener.postJavaEvent('digit','4');
		str = '4';
	  
	  }
	   else if(keyCode == 53 || keyCode == 101){
	 
		window.opener.postJavaEvent('digit','5');
		str = '5';
	  
	  }
	  else if(keyCode == 54 || keyCode == 102){
	  
		window.opener.postJavaEvent('digit','6');
		str = '6';
	  
	  }
	  else if(keyCode == 55 || keyCode == 103){
	  
		window.opener.postJavaEvent('digit','7');
		str = '7';
	  
	  }
	  else if(keyCode == 56 || keyCode == 104){
	  
		window.opener.postJavaEvent('digit','8');
		str = '8';
	  
	  }
	  else if(keyCode == 57 || keyCode == 105){
	  
		window.opener.postJavaEvent('digit','9');
		str = '9';
	  
	  }
	  else if(keyCode == 42 || keyCode == 106){
	  
		window.opener.postJavaEvent('digit','*');
		str = '*';
	  
	  }
	  else if(keyCode == 35){
	  
		window.opener.postJavaEvent('digit','#');
		str = '#';
	  
	  }
	 /* else if(keyCode == 8 ){
	   
	  }*/
	  else if(keyCode == 'clr' ){
		s_dialstring = "";
		window.opener.clearDialString();
		document.getElementById('dvObjectHolder_AhPhoneJSDialpad_dialstring').value = s_dialstring;
		str='';
		keyCode = 0;
	  }
	  else if(keyCode == 13){
		setCloseOk();
		window.close();
	  }
	  else if(keyCode == 27){
		window.close();
	  }
	  else{
		return false;
	  }
	  
	 
	 
	 
	 if(str == ''){
		//alert("empty");
	 }else if( window.opener.getDialToneMode()=="normal_dial" ){
				s_dialstring = document.getElementById('dvObjectHolder_AhPhoneJSDialpad_dialstring').value;
				s_dialstring = s_dialstring + str;
				document.getElementById('dvObjectHolder_AhPhoneJSDialpad_dialstring').value = s_dialstring;	
	 }
		str = '';
	}

}


function pushKey(event)
{
	var keyCode = null;
	var shiftCode = null;
	var ctrlCode = null;
	
	if (!event) 
		event = window.event;
	if (!event)
		return;
	
	keyCode = event.keyCode ? event.keyCode : event.charCode;
	if(keyCode == null)
		keyCode =  event.keyCode ? event.keyCode : event.which //mozilla
	
	if(keyCode == null);
	else
		checkKey(keyCode,event.shiftKey, event.ctrlKey);
}

function releaseKey(event) {
	if(event != 'dialpad'){	
		if (!event) event = window.event;
		if (!event) return;
		var keyCode = event.keyCode ? event.keyCode : event.charCode;
		
		if(keyCode == 8 || keyCode == 46 || keyCode == 127 ){
			if(dialpad_open == 1){
				if(document.getElementById('dvObjectHolder_AhPhoneJSDialpad_dialstring').value==s_dialstring){
					s_dialstring = s_dialstring.substring(0,(s_dialstring.length-1)); 
					document.getElementById('dvObjectHolder_AhPhoneJSDialpad_dialstring').value = s_dialstring;
					window.opener.setDialString(document.getElementById('dvObjectHolder_AhPhoneJSDialpad_dialstring').value);
				}else{
					s_dialstring = document.getElementById('dvObjectHolder_AhPhoneJSDialpad_dialstring').value;
					window.opener.setDialString(document.getElementById('dvObjectHolder_AhPhoneJSDialpad_dialstring').value);
				}
			}
		}
		shift = 0;
	}
	if(dialpad_open == 1) s_dialstring = document.getElementById('dvObjectHolder_AhPhoneJSDialpad_dialstring').value;
}


function input_on_focus(){
	focus_on_input = 1;
	
}

function input_out_of_focus(){
	focus_on_input = 0;
}

function setEventListenerkeyup(eventListener) {
	if (document.addEventListener){
		document.addEventListener('keyup', eventListener, true);
	}
	else if (document.attachEvent) {
		document.attachEvent('onkeyup', eventListener);
  
	}
	else document.onkeyup = eventListener;
}

function setEventListenerkeypress(eventListener) {
	if (document.addEventListener){
		document.addEventListener('keypress', eventListener, true);
	}
	else if (document.attachEvent) {
		document.attachEvent('onkeydown', eventListener);
  
	}
	else document.onkeydown = eventListener;
}

function unsetEventListener(eventListener) {
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

function mouseSelect(e)
{
	if (fActiveMenu)
	{
		if (oOverMenu == false)
		{
			oOverMenu = false;
			document.getElementById(fActiveMenu).style.display = "none";
			fActiveMenu = false;
			return false;
		}
		return false;
	}
	return true;
}

function menuActivate(idEdit, idMenu, idSel)
{
	if (fActiveMenu) return mouseSelect(0);

	oMenu = document.getElementById(idMenu);
	oEdit = document.getElementById(idEdit);
	nTop = oEdit.offsetTop + oEdit.offsetHeight;
	nLeft = oEdit.offsetLeft;
	while (oEdit.offsetParent != document.body)
	{
		oEdit = oEdit.offsetParent;
		nTop += oEdit.offsetTop;
		nLeft += oEdit.offsetLeft;
	}
	oMenu.style.left = nLeft;
	oMenu.style.top = nTop;
	oMenu.style.display = "";
	fActiveMenu = idMenu;
	document.getElementById(idSel).focus();
	return false;
}

function textSet(idEdit, text)
{
	document.getElementById(idEdit).value = text;
	oOverMenu = false;
	mouseSelect(0);
	document.getElementById(idEdit).focus();
	window.opener.setDialString(text);
}

function comboKey(idEdit, idSel)
{
	if (window.event.keyCode == 13 || window.event.keyCode == 32)
		textSet(idEdit,idSel.value);
	else if (window.event.keyCode == 27)
	{
		mouseSelect(0);
		document.getElementById(idEdit).focus();
	}
}

function dlbclickHandler(digit)
{
	if (navigator.userAgent.indexOf("MSIE") > 0)
        {
        	clickHandler(digit);
        }
       //mozilla handles double click like single click
}

function clickHandler(digit)
{	
	if(digit == "1")
	{
		MM_swapImage('digit_1_btn','','./images/1-2.png',1);
		checkKey(49,0,0);
	
	}
	else if(digit == "2")
	{
		MM_swapImage('digit_2_btn','','./images/2-2.png',1);
		checkKey(50,0,0);
	
	}
	else if(digit == "3")
	{
		MM_swapImage('digit_3_btn','','./images/3-2.png',1);
		checkKey(51,0,0);
	
	}
	else if(digit == "4")
	{
		MM_swapImage('digit_4_btn','','./images/4-2.png',1);
		checkKey(52,0,0);
	
	}
	else if(digit == "5")
	{
		MM_swapImage('digit_5_btn','','./images/5-2.png',1);
		checkKey(53,0,0);
	
	}
	else if(digit == "6")
	{
		MM_swapImage('digit_6_btn','','./images/6-2.png',1);
		checkKey(54,0,0);
	
	}
	else if(digit == "7")
	{
		MM_swapImage('digit_7_btn','','./images/7-2.png',1);
		checkKey(55,0,0);
	
	}
	else if(digit == "8")
	{
		MM_swapImage('digit_8_btn','','./images/8-2.png',1);
		checkKey(56,0,0);
	
	}
	else if(digit == "9")
	{
		MM_swapImage('digit_9_btn','','./images/9-2.png',1);
		checkKey(57,0,0);
	
	}
	else if(digit == "*")
	{
		MM_swapImage('digit_*_btn','','./images/star-2.png',1);
		checkKey(42,0,0);
	
	}
	else if(digit == "#")
	{
		MM_swapImage('digit_#_btn','','./images/pound-2.png',1);
		checkKey(35,0,0);
	
	}
	else if(digit == "0")
	{
		MM_swapImage('digit_0_btn','','./images/0-2.png',1);
		checkKey(48,0,0);
	
	}
	
	



}
