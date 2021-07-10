
// JavaScript Document

/*=====================================================
	===================================================
	===================================================
	===================================================
	===================================================
	==================================================*/
/// Globals ...
var vectoroflivelistennings = new Array();
var iswhisper_toagent 		= false;
var iswhisper_tocustomer 	= false;

var CONST_DIGIT_DO_START_CUSTOMER_WHISPER 	= "4";
var CONST_DIGIT_DO_STOP_CUSTOMER_WHISPER 	= "6";
var CONST_DIGIT_DO_START_AGENT_WHISPER 		= "7";
var CONST_DIGIT_DO_STOP_AGENT_WHISPER 		= "9";

function startLiveMonitoring()
{
	var obj = null;
	changeSpyTicker('Agent: '+curAgtName);
	showSpyInterface();	
}

function changeSpyTicker(text)
{
	var obj = document.getElementById('agtSpyTicker');
	if( obj )
		obj.innerHTML = text;
}

function showSpyInterface()
{
	var obj = document.getElementById('showLiveListeningDialog');
	if( obj )
	{
		obj.style.top = document.body.scrollTop + document.body.clientHeight/2-obj.clientHeight/2;
		obj.style.left = document.body.scrollLeft + document.body.clientWidth/2-obj.clientWidth/2;		
		obj.style.visibility = 'visible';
		//start the iax phone ...
		var phoneAppletObj = null;
		if(at.b == 'ie')
			phoneAppletObj = document.myPhoneApplet;
		else
			phoneAppletObj = document.getElementById("myPhoneApplet");
		if(phoneAppletObj)
			phoneAppletObj.startIaxc();
	}
}

function hideSpyInterface()
{
	//stop stying first
	spy_stop();
	var obj = document.getElementById('showLiveListeningDialog');
	if( obj )
	{
		obj.style.visibility = 'hidden';
		//close the iax phone behind...
		var phoneAppletObj = null;
		if(at.b == 'ie')
			phoneAppletObj = document.myPhoneApplet;
		else
			phoneAppletObj = document.getElementById("myPhoneApplet");
		if(phoneAppletObj)
		{
			phoneAppletObj.stopIaxc();
			clearLiveListeningVectors();
		}
	}
}

function spy_start()
{		
	var currentIpAdress = "";
	var host_ip = null;
	var host_port = null;
	var listSwitches = appletObj.getAsteriskSwitchs();
	var listSwitchesAr = listSwitches.split("|");
	for(var i = 0; i < listSwitchesAr.length; i++)
	{
		if(listSwitchesAr[i].length > 0)
		{
			var tmpAr = listSwitchesAr[i].split(",");
			if(tmpAr[1] == curAgtAst)
			{
				host_ip = tmpAr[6];
				host_port = tmpAr[7];
				//TO DO: FIND A WAY TO DECIDE IF WE NEED TO TAKE THE INTERNAL HOST OR NOT !!!
			}
		}
	}
	
	if( host_ip && host_port )
	{
		var phoneAppletObj = null;
		if(at.b == 'ie')
			phoneAppletObj = document.myPhoneApplet;
		else
			phoneAppletObj = document.getElementById("myPhoneApplet");
		if(phoneAppletObj)
		{
			phoneAppletObj.setHost(host_ip);
			phoneAppletObj.setPort(host_port);
			//make sure that this agent is not already been spyed ...
			if( !isagentspy_alreadyexist( curAgtLogin ) )
			{
				phoneAppletObj.placeCall("AGSPY"+curAgtLogin);
				var imgobj = document.getElementById('listen_img');
				if(imgobj)
					imgobj.src = '../img/in_call.gif';
				changeSpyTicker("Spying agent "+curAgtLogin);
				var callid = phoneAppletObj.getCurrentCallId();
			}
			else
				displayErrormessage('You are already spying agent #'+curAgtLogin+'.');
		}
	}
	else
	{
		changeSpyTicker("<font color='red'>Unable to find agent switch !!</font>");
	}
}

function spy_stop()
{
	iswhisper_toagent 		= false;
	iswhisper_tocustomer 	= false;
	var phoneAppletObj = null;
	if(at.b == 'ie')
		phoneAppletObj = document.myPhoneApplet;
	else
		phoneAppletObj = document.getElementById("myPhoneApplet");

	if( phoneAppletObj )
	{
		var curcallid = phoneAppletObj.getCurrentCallId();
		if( curcallid != -1 )
		{
			//removeLiveListening(curcallid);
			phoneAppletObj.hangupCurrentCall();
			var imgobj = document.getElementById('listen_img');
			if(imgobj)
				imgobj.src = '../img/listen.gif';
			changeSpyTicker("");
		}
		else
			displayErrormessage('Err: Unable to get call and hangup !');
	}
}


function sendDTMF(dtmfStr)
{
	var phoneAppletObj = null;
	if(at.b == 'ie')
		phoneAppletObj = document.myPhoneApplet;
	else
		phoneAppletObj = document.getElementById("myPhoneApplet");
		
	if( phoneAppletObj )
		phoneAppletObj.pressKey(dtmfStr);
}

/**
 * Dialogs
*/

function displayErrormessage(str)
{
	var obj = document.getElementById('showMessageDialogError_text');
	if(obj)
		obj.innerHTML = str;
	displayDiv('showMessageDialogError');
	setTimeout('hideDiv("showMessageDialogError")', 3000);
}

function displayDiv(divName)
{
	var obj = document.getElementById(divName);
	if( obj )
	{
		obj.style.top = document.body.scrollTop + document.body.clientHeight/2-obj.clientHeight/2;
		obj.style.left = document.body.scrollLeft + document.body.clientWidth/2-obj.clientWidth/2;		
		obj.style.visibility = 'visible';	
	}
	
}

function hideDiv(divName)
{
	var obj = document.getElementById(divName);
	if( obj )
		obj.style.visibility = 'hidden';	
}


/********
Drag and drop functions
**********/
is_opera = (navigator.userAgent.toLowerCase().indexOf("opera") != -1);
var curObj = null; /* current object wich be drag */
var mouseY = 0;	/* mouse X */
var moousX = 0;	/* mouse Y */
var dx = 0;
var dy = 0;

/* 
 * dragThis(): helps to drag an object on the screen
 * Parameters: The obj that will be drag
 * Return value: None
 */
function dragThis(what)
{
	var tmp;
		
	/*
	if (document.all) tmp = document.all[what].style;
	else if (document.getElementById) tmp = document.getElementById(what).style;
	else if (document.layers) tmp=document.layers[what];
	*/
	
	tmp = document.getElementById(what).style;
	curObj = tmp;
	var str = "";
	var i=0;
	str = tmp.left;	/* in ie style.left="12px" and in opere style.left="12" */	
	i= (!is_opera) ? str.substr(0,str.length-2) : str;
	
	dx = mouseX - i;
	str = tmp.top;
	i= (!is_opera) ? str.substr(0,str.length-2) : str;
	dy = mouseY - i;
	
}

/* 
 * mouseMove(): Take mouse coordonates
 * Parameters: e [event]
 * Return value: None
 */
function mouseMove(e)
{	
	if (!e) var e = window.event;
	if (e.pageX || e.pageY)
	{
		mouseX = e.pageX;
		mouseY = e.pageY;
	}
	else if (e.clientX || e.clientY)
	{
		mouseX = e.clientX + document.body.scrollLeft;
		mouseY = e.clientY + document.body.scrollTop;
	}
		
    if (curObj)
	{
        curObj.left= mouseX - dx;
        curObj.top = mouseY - dy;
    }
	
}

function mouseUp(e)
{
	curObj = null;
}


if (document.layers)document.captureEvents(Event.MOUSEMOVE);
document.onmousemove=mouseMove;
document.onmouseup=mouseUp;



/**
 *
 *
 */
 
function iaxphone_event_callback(eventype, data)
{
	//window.status = 'Iax phone debug: eventype = '+eventype+' data: '+data;
	
	switch(eventype)
	{
		case "TextEvent":
			if(data.toLowerCase() == 'call rejected by remote')
				displayErrormessage('Error ! Call rejected.');
			else if(data.toLowerCase() == 'call disconnected by remote')
			{
				displayErrormessage('Error ! Call disconnected.');
				var imgobj = document.getElementById('listen_img');
				if(imgobj)
					imgobj.src = '../img/listen.gif';
				changeSpyTicker("");				
			}
		break;
		case "":
		break;
		case "":
		break;
		case "":
		break;		
	}
}


function whisper_agent()
{
	if( iswhisper_toagent )		//we are already in whisper_toagent mode
	{
		iswhisper_toagent = false;
		var imgobj = document.getElementById('whisper_agent_img');
		if( imgobj )
		{
			imgobj.src = '../img/talk_to_agent_inactive.gif';
			sendDTMF(CONST_DIGIT_DO_STOP_AGENT_WHISPER);
		}
	}
	else
	{
		iswhisper_toagent = true;
		var imgobj = document.getElementById('whisper_agent_img');
		if( imgobj )
		{
			imgobj.src = '../img/talk_to_agent_active.gif';	
			sendDTMF(CONST_DIGIT_DO_START_AGENT_WHISPER);
		}
	}
	
}


function whisper_customer()
{
	if( iswhisper_tocustomer )		//we are already in whisper_toagent mode
	{
		iswhisper_tocustomer = false;
		var imgobj = document.getElementById('whisper_customer_img');
		if( imgobj )
		{
			imgobj.src = '../img/talk_to_customer_inactive.gif';
			sendDTMF(CONST_DIGIT_DO_STOP_CUSTOMER_WHISPER);
		}
	}
	else
	{
		iswhisper_tocustomer = true;
		var imgobj = document.getElementById('whisper_customer_img');
		if( imgobj )
		{
			imgobj.src = '../img/talk_to_customer_active.gif';
			sendDTMF(CONST_DIGIT_DO_START_CUSTOMER_WHISPER);
		}
	}
}







function liveListenObject()
{
	this.callid			= "";
	this.agentfullname 	= "";
	this.agentid		= "";
	this.hostadress		= "";
	this.portnumber		= "";
	
	this.init = function(callid, agentname, agentid, hostaddress, portnum)
	{
		this.callid			= callid;
		this.agentfullname	= agentname;
		this.agentid		= agentid;
		this.hostadress		= hostaddress;
		this.portnumber		= portnum;
	}
}

function createnewlistenobj(callid, agentname, agentid, hostaddress, portnum)
{
	var obj = new liveListenObject();
	obj.init(callid, agentname, agentid, hostaddress, portnum);
	addnewLiveListening(obj);
}

function addnewLiveListening(obj)
{
	var notfound = true;
	for(var i = 0; i < vectoroflivelistennings.length; i++)
	{
		if( obj.callid == vectoroflivelistennings.callid )
		{
			notfound = false;
			break;
		}
	}
	
	if(notfound)
		vectoroflivelistennings.push(obj);
	else
		displayErrormessage('JErr: Element '+obj.callid+ ' already exist !');
}


function removeLiveListening(id)
{
	var found = false;
	var pos = null;
	var len = vectoroflivelistennings.length;
	for(var i = 0; i < vectoroflivelistennings.length; i++)
	{
		if(	vectoroflivelistennings[i].callid == id )
		{
			pos = i;
			found = true;
			break;
		}
	}
	
	if(pos != null && found)
	{
		for(var j = i; j < vectoroflivelistennings.length - 1; j++)
		{
			vectoroflivelistennings[j] = vectoroflivelistennings[j+1];
		}
		vectoroflivelistennings[len - 1] = null;
		vectoroflivelistennings.length = len - 1;
	}
	else
		displayErrormessage('JErr: Unable to remove call '+id);
}

function isagentspy_alreadyexist(agentid)
{
	var ret = false;
	for(var i = 0; i < 	vectoroflivelistennings.length && !ret; i++)
	{
		if(	vectoroflivelistennings[i].agentid == agentid )
			ret = true;
	}
	return ret;
}

function clearLiveListeningVectors()
{
	for(var i = 0; i < 	vectoroflivelistennings.length; i++)
		vectoroflivelistennings[i] = null;
	vectoroflivelistennings.length = 0;
}