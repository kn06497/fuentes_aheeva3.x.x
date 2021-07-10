// JavaScript Document

// Global Functions Call By CommApplet

/* FUNCTION FOR RELOAD ACTIONS **/
var glob_context = "";
function askforMenuReload(context) 
{
	glob_context = context;
	
	var today = new Date();
	message = today+"<br>&nbsp;&nbsp; "+MultiArray["Data has been changed in"][lang]+" "+context+". "+MultiArray["Do you want to reload information?"][lang]+" &nbsp;&nbsp;";
	
	message += "<input name=\"\" type=\"button\" value='"+MultiArray["yes"][lang]+"' onClick=\"reloadRBottom()\" style=\"font-family:verdana; font-size:11px; background-color:#EFEFEF; border:1px solid #000000; width:50px \">&nbsp;&nbsp;";
	
	message += "<input name=\"\" type=\"button\" value='"+MultiArray["no"][lang]+"'  onClick=\"dismissbox()\" style=\"font-family:verdana; font-size:11px; background-color:#EFEFEF; border:1px solid #000000; width:50px\">&nbsp;&nbsp;";
	message += "<input name=\"\" type=\"button\" value='"+MultiArray["Close"][lang]+"'  onClick=\"dismissbox()\" style=\"font-family:verdana; font-size:11px; background-color:#EFEFEF; border:1px solid #000000; width:50px\">";
	//window.frames['comm'].switchFrameSet(true, 6.05);
	window.top.switchFrameSet(true, 6.05);	
	startDropinMessage(message," "+MultiArray["Notice"][lang]+" ");	
	
}


function reloadRBottom()
	{
		context = glob_context;
		window.top.main.left.location.reload(); //Refreshing the menu
		if(rBottomPageInContext(context))
			window.top.main.rbottom.location.reload();
		//Retract popup
		dismissbox();
		
	}
	
function rBottomPageInContext(context)
{
	bRet = false;
	var rBottomPage = window.top.main.rbottom.location.href;
	//alert("rBottomPage ="+rBottomPage)
	if(context == "AGENTS")
	{
	if( rBottomPage.indexOf("agent.jsp") != -1 )
		bRet = true;
	}
	else if(context == "CAMPAIGNS")
	{
	if( rBottomPage.indexOf("campaign.htm") != -1 )
		bRet = true;
	}
	else if(context == "AGENT GROUPS")
	{
	if( rBottomPage.indexOf("agentGroup.htm") != -1 )
		bRet = true;
	}
	else if(context == "TREATMENTS")
	{
	if( rBottomPage.indexOf("treatment.htm") != -1 )
		bRet = true;
	}
	else if(context == "FILTERS")
	{
	if( rBottomPage.indexOf("filter.htm") != -1 )
		bRet = true;
	}
	else if(context == "CALLING LISTS")
	{
	if( rBottomPage.indexOf("callingList.htm") != -1 )
		bRet = true;
	}
	else if(context == "TENANTS")
	{
	if( rBottomPage.indexOf("addtenant.htm") != -1 )
		bRet = true;
	}
	else if(context == "LIST OF TREATMENTS")
	{
	//if( rBottomPage.indexOf("agent.jsp") != -1 )
	//	bRet = true;
	}
	else if(context == "LIVE MONITORING USERS")
	{
	if( rBottomPage.indexOf("addLiveuser.htm") != -1 || rBottomPage.indexOf("modifyLiveuser.htm") != -1)
		bRet = true;
	}
	else if(context == "SWITCHS")
	{
	if( rBottomPage.indexOf("addSwitch.htm") != -1 || rBottomPage.indexOf("modifySwitch.htm") != -1)
		bRet = true;
	} else if(context == "USERS")
	{
	if( rBottomPage.indexOf("user_management.jsp") != -1 )
		bRet = true;
	}
	
	return bRet;
}

function updateCampaignButtons()
{
	var rBottomPage = window.top.main.rbottom.location.href;

	if( rBottomPage.indexOf("campaign.htm") != -1 )
	{
		// window.top.main.rbottom.showCampaignCurrentStatus();
	}
}

/* -- NOTICE IF WE HAVE AN UPDATE --*/
var ie=document.all;
var dom=document.getElementById;
var ns4=document.layers;
var calunits=document.layers? "" : "px";
var direction="up";

function initbox()
	{
	if (!dom&&!ie&&!ns4)
	return
	crossobj=(dom)?document.getElementById("dropin").style : ie? document.all.dropin : document.dropin;
	scroll_top=(ie)? truebody().scrollTop : document.pageYOffset;
	if(scroll_top == null)
		scroll_top = 0;		
		
	crossobj.top=(scroll_top-100)+calunits;
	crossobj.visibility=(dom||ie)? "visible" : "show";
	
	dropin();
	}

function dropin()
	{		
		
		scroll_top=(ie)? truebody().scrollTop : document.pageYOffset;
		if( scroll_top == null )
			scroll_top = 0;
		
		if (parseInt(crossobj.top) < parseInt(scroll_top) )
		{
			/*window.status = "parseInt(crossobj.top)="+parseInt(crossobj.top);
			window.status = "parseInt(scroll_top)="+parseInt(scroll_top);*/
			crossobj.top=parseInt(crossobj.top)+5+calunits
			setTimeout("dropin()", 20);
		}
	}

function dismissbox()
	{		
		
		crossobj.visibility="hidden";
			
		//Retracter le CommPage
		window.top.switchFrameSet(false, 0); //
	}

function truebody()
	{
		return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
	}


function handleReceiveManagerAlertMessage(alertMessage)
{
	var mess = alertMessage.split("|");	//split by the token
	var mess_color = mess[0];
	var alertMsg = mess[1];

	var today = new Date();
	message = today+"<br>&nbsp;&nbsp;"+alertMsg+" &nbsp;&nbsp;&nbsp;&nbsp;";
	
	message += "<input name=\"\" type=\"button\" value='"+MultiArray["Close"][lang]+"'  onClick=\"dismissbox()\" style=\"font-family:verdana; font-size:11px; background-color:#EFEFEF; border:1px solid #000000; width:50px\">";
	//window.frames['comm'].switchFrameSet(true, 6.05);
	window.top.switchFrameSet(true, 6.05);	
	bouncelimit=0;
	direction="up";
	
	/* Setter la couleur du message et mettre le message ...*/
	//message = '<B>&nbsp;&nbsp;'+level+':</B> ';//+message;
	crossobj=(dom)?document.getElementById("dropin").style : ie? document.all.dropin : document.dropin;	
	var crossMainObj =(dom)?document.getElementById("dropin") : ie? document.all.dropin : document.dropin;
	
	//Changement de couleur
	crossobj.backgroundColor = mess_color;
	//Changement de message
	crossMainObj.innerHTML = '<B>&nbsp;&nbsp;'+""+MultiArray["ALERT"][lang]+""+':</B> '+message;	
	
	initbox();
}

	
function startDropinMessage(message, level)
{
	bouncelimit=0;
	direction="up";
	
	//Regler la couleur du message suivant le level
	var mess_color;
	switch(level)
		{
			case "MESSAGE":
				mess_color = "#E1F4FF";
				break;
			case "NOTICE":
				mess_color = "#E1F4FF";
				break;
			case "WARNING":
				mess_color = "#E1F4FF";
				break;
			case "ERROR":
				mess_color = "#E1F4FF";
				break;	
			default:
				mess_color = "#E1F4FF";
				break;	
		}
	
	/* Setter la couleur du message et mettre le message ...*/
	//message = '<B>&nbsp;&nbsp;'+level+':</B> ';//+message;
	crossobj=(dom)?document.getElementById("dropin").style : ie? document.all.dropin : document.dropin;	
	var crossMainObj =(dom)?document.getElementById("dropin") : ie? document.all.dropin : document.dropin;
	
	//Changement de couleur
	crossobj.backgroundColor = mess_color;
	//Changement de message
	crossMainObj.innerHTML = '<B>&nbsp;&nbsp;'+level+':</B> '+message;	
	
	initbox();
}
	
/* Screen Pop if the CTI IS down */
nb_wait = 4;
count_nb = nb_wait;

function popUpNoConnectionWarning(theCTI_IP)
{
	var now_date = new Date();
	if(count_nb == nb_wait)
		{
		
		message = now_date+"<br>&nbsp;&nbsp;"+MultiArray["Couldn't get connection from"][lang]+"  "+theCTI_IP+" !!";
		window.top.switchFrameSet(true, 5.25); //
		startDropinMessage(message, " "+MultiArray["WARNING"][lang]+"");	
		//alert(now_date+"\nCouldn't get connection from "+theCTI_IP);	
		count_nb = 0;		
		}
	count_nb++;
}
	
function popUpRetriveConnectionMessage(theCTI_IP)
{
	var now_date = new Date();
	
	message = now_date+"<br>&nbsp;&nbsp;"+MultiArray["Connection successfull to"][lang]+"  aheevaccs@"+theCTI_IP+" !!";
	window.top.switchFrameSet(true, 5.25); //
	startDropinMessage(message, ""+MultiArray["MESSAGE"][lang]+"");	
	//alert(now_date+"\nCouldn't get connection from "+theCTI_IP);			
	setTimeout("window.top.switchFrameSet(false, 0);", 6000);
}
	
function updateRoutingScriptCounterStats(str)
{
	//
	var rBottomPage = window.top.main.rbottom.location.href;
	var i; 
	if( rBottomPage.indexOf("routingScript.htm") != -1 )
	{
		/*if( rBottomPage.document.readyState == 'complete' )
		{*/
			str = String(str);
			strArray = str.split("|");
			for(i = 0; i < strArray.length; i++)
			{
				var thisStats = 	strArray[i].split("^");			
				window.top.main.rbottom.updateCounterStats(thisStats[0], thisStats[1], thisStats[2]);
			}
		//}
	}
	
	
}
	
function handleSwitchStats(str)
{	
	var rBottomPage = window.top.main.rbottom.location.href;
	if( rBottomPage.indexOf("architecture.htm") != -1 )
	{
		window.top.main.rbottom.handleSwitchStats(str);
	}
}

//this function is to call any function in the network configuration page
function callNetworkPageFunction()
{
	if(arguments.length <= 0) //we should have at least one argument (function name)
		return;
	else
	{
		//verify if we are on the right page
		if(window.top.main && window.top.main.rbottom && 
		   	window.top.main.rbottom.location && window.top.main.rbottom.location.href &&
			window.top.main.rbottom.location.href.indexOf('architecture.htm') != -1)
		{
			var params = '';
			var fcall = '';
			for(var i = 1; i < arguments.length; i++) //for all others parameters
			{
				params += '"'+arguments[i]+'"';
				if(i != arguments.length-1)
					params += ' , ';
			}		
			fcall = arguments[0] + '('+params+')';
			
			fcall = 'window.top.main.rbottom.'+fcall;
			
			eval(fcall);
		}		
	}
}

function handleAllDataReceived()
{
	if(window.top.main)
	{
		if(window.top.main.rbottom)
		{			
			window.top.main.rbottom.location.href = "./defaultpage.htm";			
		}
	}
}
