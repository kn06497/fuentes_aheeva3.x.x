// JavaScript Document //

/*
	Architecture general functions
*/

//	constantes
var NB_DHTML_DIV_POOL 		= 200;
//	~constantes

var currentGraphic 			= null;
var diagramobj				= null;
var diagramoffsettop		= 0;
var ctiServersArray 		= new Array();
var networkWansArray 		= new Array();
var sitesArray				= new Array();
var switchesArray			= new Array();
var recordersArray			= new Array();
var ecryptorsArray			= new Array();
var linkArray				= new Array();
/*
var freeofSiteSwitchesArray 	= new Array();
var freeofSiteRecordersArray	= new Array();
var freeofSiteEncryptorsArray	= new Array();
*/
var divPoolArray			= new Array();
var DialogsdivPool		 	= null;

var contextMenu				= null;
var curdivpoolmover			= null;
var curpleasewaitmesstype 	= null;

//counters
var nbCtiServers = 0;
var nbWans		 = 0;
var nbSites		 = 0;
var nbSwitchs	 = 0;
var nbEncyptors  = 0;
var nbRecorders	 = 0;
var nbLinks		 = 0;

//stats functions
var liveStatsArray		= new Array();



var month	=	new Array(12)
month[0]	= "January";
month[1]	= "February";
month[2]	= "March";
month[3]	= "April";
month[4]	=	"May";
month[5]	=	"June";
month[6]	=	"July";
month[7]	=	"August";
month[8]	=	"September";
month[9]	=	"October";
month[10]	=	"November";
month[11]	=	"December";


//Tmp values
var tmpBeforeDragCoordX = null;
var tmpBeforeDragCoordY = null;

function initialize()
{
	//setup the global variables
	diagramobj = document.getElementById('diagram');
	
	//overload the dd.elements[i] (DDObj) prototype
	DDObj.prototype.containertype 	= null; 
	DDObj.prototype.containerobj	= null;
	
	//setup the new prototypes for diagram
	dd.elements["diagram"].containertype	= "diagram";
	dd.elements["diagram"].containerobj		= diagramobj;
	
	
	diagramoffsettop = dd.elements["diagram"].y;
		
	//initialize the div pool
	var divpoolstrs = '';
	var tmp;
	var xpos, ypos;
	for(var i = 0; i < NB_DHTML_DIV_POOL; i++)
	{
		tmp = new divPool();
		tmp.id = i;
		divPoolArray.push( tmp );
		divpoolstrs += tmp.getHTML();		
	}
	diagramobj.innerHTML = divpoolstrs;
	
	//diagram div elements setup
	showhidegrid(true);
	
	//initialise live stat arrays
	initLiveStatArray();
	
	
	//Create a new cti server... perhaps, we will need to create more than one on day...
	/*
	tmp = new serverCti(nbCtiServers);
	nbCtiServers++;
	tmp.width	= 50;
	tmp.heigth	= 83;
	var adiv = findAndReserveDivPool();
	//make it drageable
	ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);	
	dd.elements[adiv.getdivid()].write(tmp.draw());
	tmp.divPoolid = adiv.getdivid();
	//setup the new prototype properties
	dd.elements[adiv.getdivid()].containertype 	= "serverCti"; 
	dd.elements[adiv.getdivid()].containerobj	= tmp;
	//Move to the middle	
	xpos = 	parseInt(diagramobj.clientWidth/2) - dd.elements[adiv.getdivid()].w/2;
	ypos = 	0 + diagramoffsettop;
	dd.elements[adiv.getdivid()].moveTo(xpos, ypos);
	dd.elements[adiv.getdivid()].show();
	ctiServersArray.push(tmp);
	nbCtiServers++;
	*/
	
	
	//Create a network wan... perhaps, we will need to create more than one on day...
	/*
	tmp = new networkObj(nbWans);
	nbWans++;
	tmp.width	= 60;
	tmp.heigth	= 31;
	adiv = findAndReserveDivPool();
	//make it drageable
	ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);
	dd.elements[adiv.getdivid()].write(tmp.draw());
	tmp.divPoolid = adiv.getdivid();
	//setup the new prototype properties
	dd.elements[adiv.getdivid()].containertype 	= "networkObj"; 
	dd.elements[adiv.getdivid()].containerobj	= tmp;
	//Move to the middle	
	xpos = 	parseInt(diagramobj.clientWidth/2) - dd.elements[adiv.getdivid()].w/2;
	ypos = 	dd.elements['DivPool0'].y + dd.elements['DivPool0'].h + 10; 	//Because we know that this is the cti server	
	dd.elements[adiv.getdivid()].moveTo(xpos, ypos);
	dd.elements[adiv.getdivid()].show();
	networkWansArray.push(tmp);
	nbWans++;
	*/
	
	
	
	//reservee the dialog division
	DialogsdivPool = findAndReserveDivPool();	
	ADD_DHTML(DialogsdivPool.getdivid()+NO_DRAG);
	
	
	displayPleaseWait("Initialization. <br>Please wait...", "WAIT_INITIALIZATION");
	
	
	//Initialize sites...
	initSiteArray();
	//Initialize switches...
	initSwitchesArray();
	//Initialize encryption servers...
	initEncryptionServersArray();
	//Initialize recording servers...
	initRecordingServersArray();
	
	//loadLayout
	loadLayout();
	
	/*
	var thectinetworklnk = addLink(dd.elements['DivPool0'].x + dd.elements['DivPool0'].w/2, dd.elements['DivPool0'].y + dd.elements['DivPool0'].h/2, 
			dd.elements['DivPool1'].x + dd.elements['DivPool1'].w/2, dd.elements['DivPool1'].y + dd.elements['DivPool1'].h/2,
			'DivPool0', 'DivPool1');
	
	if( thectinetworklnk )
	{
		ctiServersArray[0].linksStartingFrom.push(linkArray.length-1);
		networkWansArray[0].linksEndingTo.push(linkArray.length-1);
	}
	*/
	
	
	hidePleaseWaitDlg("WAIT_INITIALIZATION");
	
}



function addSite()
{
	dialogDisplay("DLG_ADDNEWSITE");
	//fill the form...	
	var obj = document.getElementById('addNewSiteTitle');
	obj.innerText = arch[0];
	//alert("1");
	obj = document.getElementById('newSiteName');
	obj.innerText = arch[1];
	//alert("2");
	obj = document.getElementById('newSiteIntCodecName');
	obj.innerText = arch[2];
	//alert("3");
	obj = document.getElementById('newSiteExtCodecName');
	obj.innerText = arch[3];
	//alert("4");	
	obj = document.getElementById('newSiteProxyHost');
	obj.innerText = arch[4];
	//alert("5");
	obj = document.getElementById('newSiteProxyPort');
	obj.innerText = arch[5];
	//alert("6");
	obj = document.getElementById('newSiteSubmitBtn');
	obj.innerText = arch[6];

}

function addSwitch()
{
	//first verify if we have a site defined...
	if( sitesArray.length == 0 )  //no site defined
	{
	
		alert(arch[20].replace("**", "\n"));
	}
	else //show the add site dialog
	{
		dialogDisplay("DLG_ADDNEW_SWITCH");
		//fill the form...
		var obj = document.getElementById('addNewSwitchTitle');
		if( obj )
			obj.innerText = arch[7];
		obj = document.getElementById('addNewSwitchSiteLbl');
		if( obj )
			obj.innerText =arch[8];
	 	obj = document.getElementById('addNewSwitchNameLbl');
		if( obj )
			obj.innerText = arch[9];
		obj = document.getElementById('addNewSwitchPwLbl');
		if( obj )
			obj.innerText = arch[10];
		obj = document.getElementById('addNewSwitch_iaxInterHostLbl');
		if( obj )
			obj.innerText = arch[11];
		obj = document.getElementById('addNewSwitch_iaxInterPortLbl');
		if( obj )
			obj.innerText = arch[12];
		obj = document.getElementById('addNewSwitch_iaxExterHostLbl');
		if( obj )
			obj.innerText = arch[13];
		obj = document.getElementById('addNewSwitch_iaxExterPortLbl');
		if( obj )
			obj.innerText =arch[14];//good up to here
		obj = document.getElementById('addNewSwitch_nbLineAvailForOutbndLbl');
		if( obj )
			obj.innerText = arch[15]; 
		obj = document.getElementById('addNewSwitch_agtLoadBalLbl');
		if( obj )
			obj.innerText = arch[16];
		obj = document.getElementById('addNewSwitch_percentInSiteLbl');
		if( obj )
			obj.innerText = arch[17];
		obj = document.getElementById('addNewSwitch_outbndLoadBalLbl');
		if( obj )
			obj.innerText =arch[18];
		obj = document.getElementById('addNewSwitch_saveBtn');
		if( obj )
			obj.innerText =arch[19];
										  
		obj = document.getElementById('dlg_addnewswitch_siteslist');
		if( obj )
		{
			var tmpopt = new Option("", "");
			obj.options[ obj.options.length ] = tmpopt;
			for(var i = 0; i < sitesArray.length; i++)
			{
				tmpopt = new Option(sitesArray[i].SITE_NAME, sitesArray[i].DBID);
				obj.options[ obj.options.length ] = tmpopt;
			}
		}				
	}	
}

function addEncryption()
{
	//first verify if we have a site defined...
	if( sitesArray.length == 0 )  //no site defined
	{
		alert( arch[20].replace("**", "\n"));
	}
	else //show the add site dialog
	{
		dialogDisplay("DLG_ADD_NEW_ENCRYPTION_SERVER");
		//fill the labels
		var obj = null;
		obj = document.getElementById('addEncrSvr_title');
		if( obj ) 
			obj.innerText =  arch[21];	
		obj = document.getElementById('addEncrSvr_SiteLbl');
		if( obj ) 
			obj.innerText = arch[8];		
		obj = document.getElementById('addEncrSvr_serverNameLbl');
		if( obj )		
			obj.innerText = arch[22];
		obj = document.getElementById('addEncrSvr_protocolLbl');
		if( obj ) 
			obj.innerText =  arch[23];
		obj = document.getElementById('addEncrSvr_intnHostLbl');
		if( obj ) 
			obj.innerText =  arch[24];
		obj = document.getElementById('addEncrSvr_intnPortLbl');
		if( obj ) 
			obj.innerText =  arch[25];
		obj = document.getElementById('addEncrSvr_extHostLbl');
		if( obj ) 
			obj.innerText =  arch[26];
		obj = document.getElementById('addEncrSvr_extPortLbl');
		if( obj ) 
			obj.innerText =  arch[27];
		obj = document.getElementById('addEncrSvr_saveBtn');
		if( obj ) 
			obj.innerText =  arch[19];
		
		//fill the form...
		obj = document.getElementById('dlg_addnewencryption_siteslist');
		if( obj )
		{
			var tmpopt = new Option("", "");
			obj.options[ obj.options.length ] = tmpopt;
			for(var i = 0; i < sitesArray.length; i++)
			{
				tmpopt = new Option(sitesArray[i].SITE_NAME, sitesArray[i].DBID);
				obj.options[ obj.options.length ] = tmpopt;
			}
		}				
	}
}

function addRecordingServer()
{

	//first verify if we have a site defined...
	if( sitesArray.length == 0 )  //no site defined
	{
		alert(arch[20].replace("**", "\n"));
	}
	else //show the add site dialog
	{
		dialogDisplay("DLG_ADDNEW_RECORDING");
		//fill the labels
		var obj = null;//obj = document.getElementById('addEncrSvr_serverNameLbl');
		obj = document.getElementById('addNewRecordingSvr_title');
		if( obj ) 
			obj.innerText = arch[28];
		obj = document.getElementById('addNewRecordingSrv_SiteLbl');
		if( obj ) 
			obj.innerText = arch[8];
		
		obj = document.getElementById('addNewRecordingSrv_nameLbl');
		if( obj ) 
			obj.innerText = arch[9];
		else
			alert("addNewRecordingSrv_nameLbl is null");
		obj = document.getElementById('addNewRecordingSrv_passwordLbl');
		if( obj ) 
			obj.innerText = arch[10];
		obj = document.getElementById('addNewRecordingSrv_intnHostLbl');
		if( obj ) 
			obj.innerText = arch[24];
		obj = document.getElementById('addNewRecordingSrv_intnPortLbl');
		if( obj ) 
			obj.innerText = arch[25];;
		obj = document.getElementById('addNewRecordingSrv_intnSecurePortLbl');
		if( obj ) 
			obj.innerText = arch[29];
		obj = document.getElementById('addNewRecordingSrv_ExtHostLbl');
		if( obj ) 
			obj.innerText = arch[26];
		obj = document.getElementById('addNewRecordingSrv_ExtPortLbl');
		if( obj ) 
			obj.innerText = arch[27];
		obj = document.getElementById('addNewRecordingSrv_ExtSecurePortLbl');
		if( obj ) 
			obj.innerText = arch[30];
			
		obj = document.getElementById('addNewRecordingSrv_TomcatMountDirLbl')
		if( obj ) 
			obj.innerText = arch[31];
		obj = document.getElementById('addNewRecordingSrv_recordDirFullPath_local_Lbl');
		if( obj ) 
			obj.innerText = arch[32];//good up to here
		obj = document.getElementById('addNewRecordingSrv_recSalesDirLbl');
		if( obj ) 
			obj.innerText = arch[33];
		obj = document.getElementById('addNewRecordingSrv_recNoSalesDirLbl');
		if( obj ) 
			obj.innerText = arch[34];
		obj = document.getElementById('addNewRecordingSrv_dailySynchrLbl');
		if( obj ) 
			obj.innerText =arch[35];
		obj = document.getElementById('addNewRecordingSrv_sendRecToLbl');
		if( obj ) 
			obj.innerText = arch[36];
		obj = document.getElementById('addNewRecordingSrv_SynchrTimeHHmmLbl');
		if( obj ) 
			obj.innerText = arch[37];
		obj = document.getElementById('addNewRecordingSrv_agentsLoadBalLbl');
		if( obj ) 
			obj.innerText = arch[16];
		obj = document.getElementById('addNewRecordingSrv_percentInSiteLbl');
		if( obj ) 
			obj.innerText = arch[38];
		obj = document.getElementById('addNewRecordingSrv_maxDiskToUseLbl');
		if( obj ) 
			obj.innerText = arch[39];
		obj = document.getElementById('addNewRecordingSrv_saveBtn');
		if( obj ) 
			obj.innerText = arch[19];
				
		//fill the form...
		
		obj = document.getElementById('dlg_addnewrecorder_siteslist');
		if( obj )
		{
			var tmpopt = new Option("", "");
			obj.options[ obj.options.length ] = tmpopt;
			for(var i = 0; i < sitesArray.length; i++)
			{
				tmpopt = new Option(sitesArray[i].SITE_NAME, sitesArray[i].DBID);
				obj.options[ obj.options.length ] = tmpopt;
			}
		}
		
		//if we have less than two recording servers, disable all the synchronization stuff
		if(recordersArray.length < 1)
		{
			document.getElementById('dlg_adddlg_addnewrecorder_activesync').disabled = true;
			document.getElementById('dlg_addnewrecorder_sendto').disabled = true;
			document.getElementById('dlg_adnewrecorder_synctime').disabled = true;
		}
		else
		{
			var obj2 = 	document.getElementById('dlg_addnewrecorder_sendto');
			var tmpopt = new Option("", "");
			obj2.options[ obj2.options.length ] = tmpopt;
			for(var i = 0; i < recordersArray.length; i++)
			{
				tmpopt = new Option(recordersArray[i].SERVER_NAME, recordersArray[i].DBID);
				obj2.options[ obj2.options.length ] = tmpopt;
			}
			
		}
	}
}

function addLink(xFrom, yFrom, xTo, yTo, fromdiv, todiv)
{
	var tmp = null; 
		
	var adiv = findAndReserveDivPool();
	//make it drageable
	/*
	ADD_DHTML(adiv.getdivid()+TRANSPARENT+NO_DRAG);
	dd.elements[adiv.getdivid()].write(tmp.draw());
	tmp.divPoolid = adiv.getdivid();
	//setup the new prototype properties
	dd.elements[adiv.getdivid()].containertype 	= "archLink"; 
	dd.elements[adiv.getdivid()].containerobj	= tmp;
	*/
	/*
	var lefttopx = Math.min(xFrom, xTo);
	var lefttopy = Math.min(yFrom, yTo);
	var thedivw  = Math.abs(xFrom - xTo);
	var thedivh  = Math.abs(yFrom - yTo);
	*/
	//alert('lefttopx='+lefttopx+'\nlefttopy='+lefttopy+'\nthedivw='+thedivw+'\nthedivh='+thedivh);
	/*
	dd.elements[adiv.getdivid()].moveTo(lefttopx, lefttopy);
	dd.elements[adiv.getdivid()].resizeTo( thedivw, thedivh );	
	dd.elements[adiv.getdivid()].show();
	*/
	//dd.elements[adiv.getdivid()].setZ(-1);
	/*
	var startoflnk_x= parseInt(dd.elements[fromdiv].x + dd.elements[fromdiv].w/2) - lefttopx;
	var startoflnk_y= parseInt(dd.elements[fromdiv].y + dd.elements[fromdiv].h/2) - lefttopy;
	var endoflnk_x 	= parseInt(dd.elements[todiv].x + dd.elements[todiv].w/2) - lefttopx;
	var endoflnk_y 	= parseInt(dd.elements[todiv].y + dd.elements[todiv].h/2) - lefttopy;
	*/
	//alert('startoflnk_x='+startoflnk_x+'\nstartoflnk_y='+startoflnk_y+'\nendoflnk_x='+endoflnk_x+'\nendoflnk_y='+endoflnk_y);
	/*
	tmp.jsGraphObj = new jsGraphics(adiv.getdivid());
	tmp.jsGraphObj.setStroke( 3 );
	tmp.jsGraphObj.setColor("#00FF00"); // green
	tmp.jsGraphObj.drawLine(startoflnk_x, startoflnk_y, endoflnk_x, endoflnk_y);
	tmp.jsGraphObj.paint(); // draws, in this case, directly into the document
	*/
	
	var obj = document.getElementById(adiv.getdivid());
	if(obj)
	{
		tmp = new archLink(nbLinks);
		nbLinks++;
		tmp.xFrom 		= xFrom;
		tmp.yFrom 		= yFrom;
		tmp.xTo			= xTo;
		tmp.yTo			= yTo;
		tmp.fromDivPool = fromdiv;
		tmp.toDivPool	= todiv;
		//alert(tmp.draw());
		tmp.divPoolid 	= adiv.getdivid();
		obj.innerHTML 	= tmp.draw();
		obj.style.left 	= tmp.xFrom;
		obj.style.top 	= tmp.yFrom;
		obj.style.visibility = 'visible';
		linkArray.push( tmp );		
	}
	return tmp;
}


function initSiteArray()
{
	//onload, read the sites and display them
	var sitesStr = String( appletObj.getAllSites() );
	var sitesStrAr = sitesStr.split("|");		
	if(sitesStr.length > 0)
	{
		for(var i = 0; i < sitesStrAr.length; i++)
		{		
			var thissiteElt = sitesStrAr[i].split("^");
			var sitedbid = thissiteElt[0];
			var sitename = thissiteElt[1];
			var siteInternalIaxCodec = thissiteElt[2];
			var siteExternalIaxCodec = thissiteElt[3];
			var siteProxyHost = thissiteElt[4];
			var siteProxyPort = thissiteElt[5];
			var alreadyexist = false;
			for(var j = 0; j < sitesArray.length && !alreadyexist; j++)
			{
				if(sitesArray[j].DBID == sitedbid && sitesArray[j].SITE_NAME == sitename)
					alreadyexist = true;
			}
			
			if( !alreadyexist ) //didn't exist before.
			{
				var tmpobj = new siteObj(nbSites);
				nbSites++;
				tmpobj.DBID		= sitedbid;
				tmpobj.SITE_NAME	= sitename;
				tmpobj.SITE_INTCODEC	= siteInternalIaxCodec;
				tmpobj.SITE_EXTCODEC	= siteExternalIaxCodec;
				tmpobj.SITE_PROXY_HOST = siteProxyHost ;
				tmpobj.SITE_PROXY_PORT = siteProxyPort ;
				tmpobj.xpos 		= 50;
				tmpobj.ypos 		= 60;
				tmpobj.width 		= 300;
				tmpobj.heigth 		= 200;
				tmpobj.color		= "#330066";
				var adiv = findAndReserveDivPool();
				ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);
				dd.elements[adiv.getdivid()].write(tmpobj.draw());
				tmpobj.divPoolid = adiv.getdivid();
				//setup the new prototype properties
				dd.elements[adiv.getdivid()].containertype 	= "siteObj"; 
				dd.elements[adiv.getdivid()].containerobj	= tmpobj;
				dd.elements[adiv.getdivid()].moveTo(tmpobj.xpos, tmpobj.ypos);
				dd.elements[adiv.getdivid()].show();
                                 
                                // alert("doest not exist " +sitename + " " +siteInternalIaxCodec +" " +siteExternalIaxCodec);
                              
				
				//add the link...
				/*
				var thelnk = addLink(dd.elements[adiv.getdivid()].x + dd.elements[adiv.getdivid()].w/2, 
									dd.elements[adiv.getdivid()].y + dd.elements[adiv.getdivid()].h/2, 
									dd.elements['DivPool1'].x + dd.elements['DivPool1'].w/2, 
									dd.elements['DivPool1'].y + dd.elements['DivPool1'].h/2,
									adiv.getdivid(), 'DivPool1');
	
				if( thelnk )
				{
					tmpobj.linksStartingFrom.push(linkArray.length-1);
					networkWansArray[0].linksEndingTo.push(linkArray.length-1);
				}
				*/
				
				sitesArray.push(tmpobj);				
				
			}
		}
	}
}

function initSwitchesArray()
{
	var switchesStr = String( appletObj.getAsteriskSwitchs() );
	var switchesStrAr = switchesStr.split("|");
	
	if(switchesStr.length > 0)
	{
		
		for(var i = 0; i < switchesStrAr.length; i++)
		{
			
			var thisSwitchAr = switchesStrAr[i].split(",");			
			var switch_dbid = thisSwitchAr[0];
			var switch_name = thisSwitchAr[1];
			var switch_password = thisSwitchAr[2];
			var switch_site_dbid = thisSwitchAr[3];
			var switch_load_balance_agents = thisSwitchAr[4];
			var switch_load_balance_outbound = thisSwitchAr[5];
			var switch_internal_host = thisSwitchAr[6];
			var switch_internal_port = thisSwitchAr[7];
			var switch_external_host = thisSwitchAr[8];
			var switch_external_port = thisSwitchAr[9];
			var switch_number_of_lines = thisSwitchAr[10];

			//verify if not already exist
			var alreadyexist = false;			
			for(var j = 0; j < switchesArray.length && !alreadyexist; j++)
			{
				if(switchesArray[j].DBID == switch_dbid || switchesArray[j].SWITCH_NAME == switch_name)
					alreadyexist = true;
			}
			
			if( !alreadyexist ) //does not exist... proceed
			{
				var tmpobj = new pbxServerObj(nbSwitchs);
				nbSwitchs++;
				tmpobj.DBID						= switch_dbid;
				tmpobj.SWITCH_NAME				= switch_name;
				tmpobj.SWITCH_PASSWORD			= switch_password;
				tmpobj.HOST						= switch_internal_host;
				tmpobj.PORT						= switch_internal_port;
				tmpobj.EXTERN_HOST				= switch_external_host;
				tmpobj.EXTERN_PORT				= switch_external_port;
				tmpobj.LOAD_BALANCE_FOR_AGENTS	= switch_load_balance_agents;
				tmpobj.LOAD_BALANCE_FOR_OUTBOUND= switch_load_balance_outbound;
				tmpobj.SITE_DBID				= switch_site_dbid;
				tmpobj.SWITCH_TYPE				= "Asterisk"; //if ever we have another type of switch, change this value and get it from database
				tmpobj.NUMBER_OF_LINES			= switch_number_of_lines;
				
				tmpobj.xpos 		= 50;
				tmpobj.ypos 		= 60;
				tmpobj.width 		= 300;
				tmpobj.heigth 		= 80;
				tmpobj.color		= "#330066";
				var adiv = findAndReserveDivPool();
				ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);
				dd.elements[adiv.getdivid()].write(tmpobj.draw());
				tmpobj.divPoolid = adiv.getdivid();
				//setup the new prototype properties
				dd.elements[adiv.getdivid()].containertype 	= "pbxServerObj"; 
				dd.elements[adiv.getdivid()].containerobj	= tmpobj;
				dd.elements[adiv.getdivid()].moveTo(tmpobj.xpos, tmpobj.ypos);
				dd.elements[adiv.getdivid()].show();
				switchesArray.push(tmpobj);
				
				//append this div to the site that it his parent				
				for(var st = 0; st < sitesArray.length; st++)
				{					
					if(sitesArray[st].DBID  == tmpobj.SITE_DBID)
					{						
						dd.elements[ (sitesArray[st].divPoolid) ].addChild( adiv.getdivid() );//dd.elements[adiv.getdivid()] );
						break;
					}
				}
			}
		}
	}	
}

function initEncryptionServersArray()
{
	var encryptStr = String( appletObj.getAllEncServers() );
	var encryptStrArr = encryptStr.split("|"); 
	
	if( encryptStr.length > 0 )
	{
		for(var i = 0; i < encryptStrArr.length; i++)		
		{
			var thisServAr = encryptStrArr[i].split(",");
			var thisserv_dbid  		= thisServAr[0];
			var thisserv_host  		= thisServAr[1];
			var thisserv_port  		= thisServAr[2];
			var thisserv_site_dbid  = thisServAr[3];
			var thisserv_name  		= thisServAr[4];
			var thisserv_url  		= thisServAr[5];
			var thisserv_protocol 	= thisServAr[6];
			var thisserv_exthost  	= thisServAr[7];
			var thisserv_extport  	= thisServAr[8];
			
			var alreadyexist = false;
			for(var j = 0; j < ecryptorsArray.length; j++)
			{
				if(ecryptorsArray[j].DBID == thisserv_dbid && ecryptorsArray[j].SERVERNAME == thisserv_name)
				{
					alreadyexist = true;
					break;
				}
			}
			
			if( !alreadyexist )
			{
				var tmpobj = new encServerObj(nbEncyptors);
				nbEncyptors++;
				tmpobj.DBID			= thisserv_dbid;
				tmpobj.SERVERNAME	= thisserv_name;
				tmpobj.IPADDRESS	= thisserv_host;
				tmpobj.PORT			= thisserv_port;
				tmpobj.SITE_DBID	= thisserv_site_dbid;
				tmpobj.SERVLETURL	= thisserv_url;
				tmpobj.PROTOCOL		= thisserv_protocol;
				tmpobj.EXT_IPADDRESS= thisserv_exthost;
				tmpobj.EXT_PORT 	= thisserv_extport;
				
				tmpobj.xpos 		= 50;
				tmpobj.ypos 		= 60;
				tmpobj.width 		= 300;
				tmpobj.heigth 		= 80;
				tmpobj.color		= "#330066";
				var adiv = findAndReserveDivPool();
				ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);
				dd.elements[adiv.getdivid()].write(tmpobj.draw());
				tmpobj.divPoolid = adiv.getdivid();
				//setup the new prototype properties
				dd.elements[adiv.getdivid()].containertype 	= "encServerObj"; 
				dd.elements[adiv.getdivid()].containerobj	= tmpobj;
				dd.elements[adiv.getdivid()].moveTo(tmpobj.xpos, tmpobj.ypos);
				dd.elements[adiv.getdivid()].show();
				ecryptorsArray.push(tmpobj);
				
				//append this div to the site that it his parent				
				for(var st = 0; st < sitesArray.length; st++)
				{					
					if(sitesArray[st].DBID  == tmpobj.SITE_DBID)
					{						
						dd.elements[ (sitesArray[st].divPoolid) ].addChild( adiv.getdivid() );//dd.elements[adiv.getdivid()] );
						break;
					}
				}				
			}
		}
	}
}

function initRecordingServersArray()
{
	var recordStr = String( appletObj.getAllRecordingServers() );
	var recordStrArr = recordStr.split("|"); 
	
	if( recordStr.length > 0 )
	{
		for(var i = 0; i < recordStrArr.length; i++)		
		{
			var thisServAr = recordStrArr[i].split("^");
			var thisserv_dbid  		= thisServAr[0];
			var thisserv_name  		= thisServAr[1];
			var thisserv_password	= thisServAr[2];
			var thisserv_host		= thisServAr[3];
			var thisserv_port		= thisServAr[4];
			var thisserv_secport	= thisServAr[5];
			var thisserv_exthost  	= thisServAr[6];
			var thisserv_extport  	= thisServAr[7];
			var thisserv_extsecport	= thisServAr[8];
			var thisserv_sellpath  	= thisServAr[9];
			var thisserv_nosellpath	= thisServAr[10];
			var thisserv_site_dbid 	= thisServAr[11];
			var thisserv_rec_sync  	= thisServAr[12];
			var thisserv_masterserv	= thisServAr[13];
			var thisserv_loadbalance= thisServAr[14];
			var thisserv_allorecsync= thisServAr[15];
			var this_recmaxallow 	= thisServAr[16];
			var thisserv_tomcaturl 	= thisServAr[17];
			var thisserv_recordingpath 	= thisServAr[18];
			
			var alreadyexist = false;
			for(var j = 0; j < recordersArray.length; j++)
			{
				if(recordersArray[j].DBID == thisserv_dbid && recordersArray[j].SERVER_NAME == thisserv_name)
				{
					alreadyexist = true;
					break;
				}
			}
			
			if( !alreadyexist )
			{
				var tmpobj = new recordingServer(nbRecorders);
				nbRecorders++;
				tmpobj.DBID 					= thisserv_dbid;
				tmpobj.SERVER_NAME				= thisserv_name;
				tmpobj.SERVER_PASSWORD 			= thisserv_password;
				tmpobj.HOST 					= thisserv_host;
				tmpobj.PORT 					= thisserv_port;
				tmpobj.SEC_PORT 				= thisserv_secport;
				tmpobj.EXTERN_HOST 				= thisserv_exthost;
				tmpobj.EXTERN_PORT 				= thisserv_extport;
				tmpobj.EXTERN_SEC_PORT 			= thisserv_extsecport;
				tmpobj.SALES_PATH 				= thisserv_sellpath;
				tmpobj.NOSALES_PATH 			= thisserv_nosellpath;
				tmpobj.SITE_DBID 				= thisserv_site_dbid;
				tmpobj.REC_SYNC_TIME 			= thisserv_rec_sync;
				tmpobj.MASTER_SERVER 			= thisserv_masterserv;
				tmpobj.LOAD_BALANCE_FOR_AGENTS	= thisserv_loadbalance;
				tmpobj.ALLOW_REC_SYNC 			= thisserv_allorecsync;
				tmpobj.MAX_DISK_TO_USE 			= this_recmaxallow;
				tmpobj.TOMCAT_URL 				= thisserv_tomcaturl;
				tmpobj.RECORDINGS_PATH			= thisserv_recordingpath;
				
				tmpobj.xpos 		= 50;
				tmpobj.ypos 		= 60;
				tmpobj.width 		= 300;
				tmpobj.heigth 		= 80;
				tmpobj.color		= "#330066";
				var adiv = findAndReserveDivPool();
				ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);
				dd.elements[adiv.getdivid()].write(tmpobj.draw());
				tmpobj.divPoolid = adiv.getdivid();
				//setup the new prototype properties
				dd.elements[adiv.getdivid()].containertype 	= "recordingServer"; 
				dd.elements[adiv.getdivid()].containerobj	= tmpobj;
				dd.elements[adiv.getdivid()].moveTo(tmpobj.xpos, tmpobj.ypos);
				dd.elements[adiv.getdivid()].show();
				recordersArray.push(tmpobj);
				
				//append this div to the site that it his parent				
				for(var st = 0; st < sitesArray.length; st++)
				{					
					if(sitesArray[st].DBID  == tmpobj.SITE_DBID)
					{						
						dd.elements[ (sitesArray[st].divPoolid) ].addChild( adiv.getdivid() );//dd.elements[adiv.getdivid()] );
						break;
					}
				}				
			}
		}
	}
}


function loadLayout()
{
	var layoutStr = String( appletObj.getNetworkLayout() );
	
	if( layoutStr.length > 0 )
	{
		var rootElt = Xparse(layoutStr);
		
		for(var i = 0; i < 	rootElt.contents.length; i++)
		{
			if( rootElt.contents[i].name == "DiagramElement")
			{
				var curElt = rootElt.contents[i];
				var curType = curElt.attributes["type"];
				var curDbid = null, curH = null, curW = null, curX = null, curY = null, curZ = null;
				for(var j = 0 ; j < curElt.contents.length; j++)
				{
					switch( curElt.contents[j].name )
					{
						case "dbid":
							curDbid = curElt.contents[j].attributes["value"];
						break;
						case "h":
							curH = curElt.contents[j].attributes["value"];
						break;
						case "w":
							curW = curElt.contents[j].attributes["value"];
						break;
						case "x":
							curX = curElt.contents[j].attributes["value"];
						break;
						case "y":
							curY = curElt.contents[j].attributes["value"];
						break;
						case "z":
							curZ = curElt.contents[j].attributes["value"];
						break;
					}				
				}
				
				var ddelementName = null;
				switch( curType )
				{
					/*
					case "diagram":
						ddelementName = "diagram";
					break;
					*/
					case "serverCti":
						ddelementName = "DivPool0";		//was the first added
					break;
					case "networkObj":
						ddelementName = "DivPool1";		//was the second added
					break;
					case "siteObj":
						for(var findit = 0; findit < sitesArray.length; findit++)
						{
							if( sitesArray[findit].DBID == curDbid )
							{
								ddelementName = sitesArray[findit].divPoolid;
								break;
							}
						}
					break;
					case "pbxServerObj":
						for(var findit = 0; findit < switchesArray.length; findit++)
						{
							if( switchesArray[findit].DBID == curDbid )
							{
								ddelementName = switchesArray[findit].divPoolid;
								break;
							}
						}
					break;
					case "encServerObj":
						for(var findit = 0; findit < ecryptorsArray.length; findit++)
						{
							if( ecryptorsArray[findit].DBID == curDbid )
							{
								ddelementName = ecryptorsArray[findit].divPoolid;
								break;
							}
						}
					break;
					case "recordingServer":
						for(var findit = 0; findit < recordersArray.length; findit++)
						{
							if( recordersArray[findit].DBID == curDbid )
							{
								ddelementName = recordersArray[findit].divPoolid;
								break;
							}
						}
					break;
					
				}
				
				if(ddelementName)
				{
					if(curX && curY)
						dd.elements[ ddelementName ].moveTo(curX, curY);
					if(curW && curH)
						dd.elements[ ddelementName ].resizeTo(curW, curH);					
				}
				
				
			}
			else if( rootElt.contents[i].name == "Visual")
			{
				var curElt = rootElt.contents[i];
				var curgrid = curElt.attributes["grid"];				
				showhidegrid( (curgrid == 'true') );					
			}
		}
	}
}
/***
	Right click handling function..
***/
function my_rightclickhandler()
{
	//we have a right click... rebuild the appropriate context menu	
	if(curdivpoolmover)
	{
		//flush the context menu items	//and remove the div already created
		hideAllMenus();		//TODO: Find a way to delete all unsued menus
		
		
		createjsDOMenu(); //no other method were found without recreate the whole menu		
		
				
		var curobj = dd.elements[curdivpoolmover];
		var subMenu = null;
		var tmpmenuitem = null;
		
		while(curobj) //while we have an object behind
		{
			var iname = "";
			var itemiconclass = "";
			//depending this current object display the appropriate submenu...
			switch(curobj.containertype) //properties added on the prototype (refer function initialize)
			
			{
				case "serverCti":
					iname = "menu_cti_server_"+curobj.containerobj.unid;
					tmpmenuitem = new menuItem("Cti Server", iname, "");
					subMenu = new jsDOMenu(150);
					subMenu.addMenuItem( new menuItem(""+arch[40]+"", "menu_cti_server_cfg_"+curobj.containerobj.uid, "javascript:displayCtiServerCfg('"+curobj.containerobj.unid+"')") );
					subMenu.addMenuItem( new menuItem(""+arch[41]+"", "menu_cti_server_livestats_"+curobj.containerobj.uid, "javascript:displayCtiServerLiveStats('"+curobj.containerobj.unid+"')") );
				break;
				case "networkObj": //no contextual menu for the network for the moment					
				break;
				case "siteObj":
					iname = "menu_siteobj_"+curobj.containerobj.uid;
					tmpmenuitem = new menuItem(curobj.containerobj.SITE_NAME+ arch[8], iname, "");
					subMenu = new jsDOMenu(150);
					subMenu.addMenuItem( new menuItem(""+arch[40]+"", "menu_site_cfg_"+curobj.containerobj.uid, "javascript:displaySiteCfg('"+curobj.containerobj.unid+"')") );
					//subMenu.addMenuItem( new menuItem("Statistics", "menu_site_livestats_"+curobj.containerobj.uid, "javascript:displaySiteLiveStats('"+curobj.containerobj.unid+"')") );
				break;
				case "pbxServerObj":
					iname = "menu_switchobj_"+curobj.containerobj.uid;
					tmpmenuitem = new menuItem(curobj.containerobj.SWITCH_NAME, iname, "");
					itemiconclass = "icon_asterisk";
					subMenu = new jsDOMenu(150);
					subMenu.addMenuItem( new menuItem(""+arch[40]+"", "menu_switch_cfg_"+curobj.containerobj.uid, "javascript:displaySwitchCfg('"+curobj.containerobj.unid+"')") );
					subMenu.addMenuItem( new menuItem(""+arch[41]+"", "menu_switch_livestats_"+curobj.containerobj.uid, "javascript:displaySwitchLiveStats('"+curobj.containerobj.SWITCH_NAME+"')") );
				break;
				case "encServerObj":
					iname = "menu_encserverobj_"+curobj.containerobj.uid;
					tmpmenuitem = new menuItem(curobj.containerobj.SERVERNAME, iname, "");
					itemiconclass = "icon_encryptor";
					subMenu = new jsDOMenu(150);
					subMenu.addMenuItem( new menuItem(""+arch[40]+"", "menu_encserver_cfg_"+curobj.containerobj.uid, "javascript:displayEncryptServerCfg('"+curobj.containerobj.unid+"')") );
					//subMenu.addMenuItem( new menuItem("Statistics", "menu_encserver_livestats_"+curobj.containerobj.uid, "javascript:displayEncryptServerLiveStats('"+curobj.containerobj.SERVERNAME+"')") );
				break;
				case "recordingServer":
					iname = "menu_encserverobj_"+curobj.containerobj.uid;
					tmpmenuitem = new menuItem(curobj.containerobj.SERVER_NAME, iname, "");
					itemiconclass = "icon_recorder";
					subMenu = new jsDOMenu(150);
					subMenu.addMenuItem( new menuItem(""+arch[40]+"", "menu_recserver_cfg_"+curobj.containerobj.uid, "javascript:displayRecordServerCfg('"+curobj.containerobj.unid+"')") );
					subMenu.addMenuItem( new menuItem(""+arch[41]+"", "menu_recserver_livestats_"+curobj.containerobj.uid, "javascript:displayRecordServerLiveStats('"+curobj.containerobj.SERVER_NAME+"')") );				
				
				break;
				case "diagram":
					iname = "menu_diagram";
					tmpmenuitem = new menuItem(""+arch[42]+"", iname, "");
					subMenu = new jsDOMenu(150);
					subMenu.addMenuItem( new menuItem( ""+arch[43]+"", "menu_diagram_savelayout", "javascript:saveLayout()") );
					subMenu.addMenuItem( new menuItem( "-", "", "javascript:saveLayout()") );
					subMenu.addMenuItem( new menuItem(diagramobj.style.backgroundImage=='none'? ""+arch[44]+"" : ""+arch[45]+"", "menu_diagram_grid_", "javascript:showhidegrid(diagramobj.style.backgroundImage=='none')") );					
				break;
			}
			//append the new elements
			
			
			if(tmpmenuitem)
			{								
				contextMenu.addMenuItem(tmpmenuitem);
				if(itemiconclass != '') //we have an icon class
					contextMenu.items[iname].showIcon(itemiconclass, itemiconclass);
				if( subMenu )
				{
					contextMenu.items[iname].setSubMenu(subMenu);
				}				
			}
			
			curobj = curobj.getEltBelow();
			subMenu = null;
			tmpmenuitem = null;
		}
		
	}
}


function my_architectureDropFunc()
{	
	//make sure this is drop on a site
	if ( dd.obj )
	{
		if( dd.obj.containertype )
		{
			if( dd.obj.containertype == 'pbxServerObj' || dd.obj.containertype == 'encServerObj' || dd.obj.containertype == 'recordingServer' )
			{
				var ddobj = dd.obj;
				var elBellow = ddobj.getEltBelow();
				var droppedinasite = false;
				var newsite_dbid = null;
				while( elBellow )
				{
					//if the element bellow is an site who is different of the old site...
					if( elBellow.containertype == 'siteObj' )
					{
						droppedinasite = true;
						if( elBellow.containerobj.DBID != ddobj.containerobj.SITE_DBID )	//has been dropped in a different site
						{
							newsite_dbid = elBellow.containerobj.DBID;							
						}
						break;
					}					   
					elBellow = elBellow.getEltBelow();
				}
				
				//window.status = 'droppedinasite'+droppedinasite+' newsite_dbid='+newsite_dbid;
				
				if( !droppedinasite ) //this stuff haven't been drop in anysite... rollback to previous position
				{
					dd.obj.moveTo(tmpBeforeDragCoordX, tmpBeforeDragCoordY);
				}
				else	//it has been drop in site
				{
					if( newsite_dbid != null ) //and drop in a new site
					{
						//put the right values one more time
						switch( dd.obj.containertype )
						{
							case "pbxServerObj":
								for(var m = 0; m < switchesArray.length; m++)
								{
									if( switchesArray[m].DBID == dd.obj.containerobj.DBID )
									{
										switchesArray[m].SITE_DBID = newsite_dbid;
										dd.obj.containerobj = switchesArray[m];
										saveThisPbxServer( switchesArray[m] );
										break;	
									}									
								}
							break;
							case "encServerObj":
								for(var m = 0; m < ecryptorsArray.length; m++)
								{
									if( ecryptorsArray[m].DBID == dd.obj.containerobj.DBID )
									{
										ecryptorsArray[m].SITE_DBID = newsite_dbid;
										dd.obj.containerobj = ecryptorsArray[m];
										saveThisEncryptionServer( ecryptorsArray[m] );
										break;	
									}									
								}
							break;
							case "recordingServer":
								for(var m = 0; m < recordersArray.length; m++)
								{
									if( recordersArray[m].DBID == dd.obj.containerobj.DBID )
									{
										recordersArray[m].SITE_DBID = newsite_dbid;
										dd.obj.containerobj = recordersArray[m];
										saveThisRecordingServer( recordersArray[m] );
										break;	
									}									
								}
							break;							
						}
						
						//attach it to the new site						
						elBellow.addChild( dd.obj.containerobj.divPoolid );
						
						/* this element position has changed - force a layout save */
						saveLayout();
						
					}					
				}
				
				
				
			}
		}		
	}
	tmpBeforeDragCoordX = null;
	tmpBeforeDragCoordY = null;
	
	
	//redraw the links
	/*
	var thectinetworklnk = addLink(dd.elements['DivPool0'].x + dd.elements['DivPool0'].w/2, 
								dd.elements['DivPool0'].y + dd.elements['DivPool0'].h/2, 
			dd.elements['DivPool1'].x + dd.elements['DivPool1'].w/2, dd.elements['DivPool1'].y + dd.elements['DivPool1'].h/2,
			'DivPool0', 'DivPool1');
	*/
	/*
	if( dd.obj )
	{
		if( dd.obj.containerobj )
		{
			window.status = 'linksStartingFrom.length='+dd.obj.containerobj.linksStartingFrom.length+' linksEndingTo.length='+dd.obj.containerobj.linksEndingTo.length;
			//window.status = 'dd.elements.' + dd.obj.name + '.x  = ' + dd.obj.x + '	 dd.elements.' + dd.obj.name + '.y = ' + dd.obj.y;
			for(var i = 0; i < 	dd.obj.containerobj.linksStartingFrom.length; i++) //for each link starting from here...
			{
				var pos = dd.obj.containerobj.linksStartingFrom[i];
				if( linkArray[pos] )
				{
					linkArray[pos].xFrom = dd.obj.x + dd.obj.w/2;
					linkArray[pos].yFrom = dd.obj.y + dd.obj.h/2;
					var redrObj = document.getElementById(linkArray[pos].divPoolid);
					if( redrObj )
					{
						redrObj.innerHTML 	= linkArray[pos].draw();
						redrObj.style.left 	= linkArray[pos].xFrom;
						redrObj.style.top 	= linkArray[pos].yFrom;
					}
				}
			}
			
			for(var i = 0; i < 	dd.obj.containerobj.linksEndingTo.length; i++) //for each link starting from here...
			{
				var pos = dd.obj.containerobj.linksEndingTo[i];
				if( linkArray[pos] )
				{
					linkArray[pos].xTo = dd.obj.x + dd.obj.w/2;
					linkArray[pos].yTo = dd.obj.y + dd.obj.h/2;
					var redrObj = document.getElementById(linkArray[pos].divPoolid);
					
					if( redrObj )
					{
						redrObj.innerHTML 	= linkArray[pos].draw();
						redrObj.style.left 	= linkArray[pos].xTo;
						redrObj.style.top 	= linkArray[pos].yTo;
					}
				}
			}
		}
	}
	*/


}


function my_architecturePickFunc()
{
	if( dd.obj )
	{		
		if( dd.obj.containertype == 'pbxServerObj' || dd.obj.containertype == 'encServerObj' || dd.obj.containertype == 'recordingServer' )
		{
			tmpBeforeDragCoordX	= dd.obj.x;
			tmpBeforeDragCoordY	= dd.obj.y;
		}
	}
}

function my_architectureDragFunc()
{
		
}

/***
	Interface with commapplet functions
***/
function sendCreateSite() //create a new site with the name in field id=dlg_addsitetext
{	
	var obj = document.getElementById('dlg_addsitetext');
	var internalIaxCodec_str = document.getElementById('dlg_addsiteInternalCodec').value;
	var externalIaxCodec_str = document.getElementById('dlg_addsiteExternalCodec').value;
	var proxyHost_str = document.getElementById('dlg_addsiteProxyHost').value;
	var proxyPort_str = document.getElementById('dlg_addsiteProxyPort').value;
	var good = true;
	
	if( obj )
	{		
		if(obj.value == "")
		{
		
			alert(arch[46]);
			good = false;
		}
		else //verify is the site name doesn t not already exist
		{
			for(var i = 0 ; i < sitesArray.length; i++)
			{
				if(	 obj.value == sitesArray[i].SITE_NAME)
				{
				
					alert(arch[47]);
					good = false;
					break;
				}
			}
		}
		if(good)
		{			
			displayPleaseWait("Please wait for site creation...", "WAIT_FOR_SITE_CREATION");
			var str = '';
			str += '3'; //the change type
			str += '^NULL^'
			str += obj.value;
			str += '^';
			str += internalIaxCodec_str;
			str += '^';
			str += externalIaxCodec_str;
			str += '^';
			str += proxyHost_str;
			str += '^';
			str += proxyPort_str;
			appletObj.sendModifySites(str);

		}
	}	
}

function updateSite() //update the site configuration
{
	var obj = document.getElementById('dlg_sitecfgtext');

	var internalIaxCodec = document.getElementById("dlg_updatesiteInternalCodec");
	internalIaxCodec.options[internalIaxCodec.selectedIndex].value;
	var internalIaxCodec_str = internalIaxCodec.options[internalIaxCodec.selectedIndex].value;

	var externalIaxCodec = document.getElementById("dlg_updatesiteExternalCodec");
	externalIaxCodec.options[externalIaxCodec.selectedIndex].value;
	var externalIaxCodec_str = externalIaxCodec.options[externalIaxCodec.selectedIndex].value;
	
	var proxyHost = document.getElementById("dlg_updatesiteProxyHost");
	//proxyHost.options[proxyHost.selectedIndex].value;
	//var proxyHost_str = proxyHost.options[proxyHost.selectedIndex].value;
	var proxyHost_str = proxyHost.value;
	
	var proxyPort = document.getElementById("dlg_updatesiteProxyPort");
	//proxyPort.options[proxyPort.selectedIndex].value;
	//var proxyPort_str = proxyPort.options[proxyPort.selectedIndex].value;
	var proxyPort_str = proxyPort.value;
	
	
	
	
	

	var good = true;
	var mod_dbid = null;
	var site_index = 0;
	
	if( obj )
	{
		if(obj.value == "")
		{
			alert(arch[46]);
			good = false;
		}
		else //verify is the site name doesn t not already exist
		{			
			mod_dbid = obj.getAttribute("site_dbid");			
			for(i = 0 ; i < sitesArray.length; i++)
			{
				if(obj.value == sitesArray[i].SITE_NAME)
			{
					site_index = i;	
				}
				if(mod_dbid != sitesArray[i].DBID && obj.value == sitesArray[i].SITE_NAME)
				{
					good = false;
					alert(arch[47]);
					break;
				}
				else if(mod_dbid == sitesArray[i].DBID && obj.value == sitesArray[i].SITE_NAME) //no change has been made, no need to update some thing
				{
					if(internalIaxCodec_str  == sitesArray[i].SITE_INTCODEC && externalIaxCodec_str == sitesArray[i].SITE_EXTCODEC 
					&&  proxyHost_str == sitesArray[i].SITE_PROXY_HOST && proxyPort_str == sitesArray[i].SITE_PROXY_PORT)
					{
					good = false;
					dialogHide();
					break;
				}
			}			
			
			}			
		}
		if(good)
		{
			displayPleaseWait("Please wait for site modification...", "WAIT_FOR_SITE_MODIFICATION");
			var str = '';
			str += '2'; //the change type
			str += '^'+mod_dbid+'^';
			str += obj.value;
			str += '^';
			str += internalIaxCodec_str;
			str += '^';
			str += externalIaxCodec_str;
			str += '^';
			str += proxyHost_str;
			str += '^';
			str += proxyPort_str;

			sitesArray[site_index].SITE_INTCODEC = internalIaxCodec_str;
			sitesArray[site_index].SITE_EXTCODEC = externalIaxCodec_str;
			sitesArray[site_index].SITE_PROXY_HOST = proxyHost_str;
			sitesArray[site_index].SITE_PROXY_PORT = proxyPort_str;
			//alert(str);
			appletObj.sendModifySites(str);
		}
	}
}

function deleteSite() //delete this site
{
	var obj = document.getElementById('dlg_sitecfgtext');
	var good = false;
	if( obj )
	{
		if( obj.value == "" )
		{
		alert(arch[48]);
			
			good = false;
		}
		else
		{
			var found = false;
			var deldbid = null;
			for(var i = 0 ; i < sitesArray.length; i++)
			{
				if( sitesArray[i].SITE_NAME == obj.value )
				{
					found = true;
					good = true;
					deldbid = sitesArray[i].DBID;
					break;
				}
			}
			
			//verify if any element is not in the site...
			for(var i = 0; i < switchesArray.length && good; i++)
			{
				if( switchesArray[i].SITE_DBID == deldbid )
				{
				
				alert(arch[49].replace("**", "\n") + switchesArray[i].SWITCH_NAME + arch[50].replace("**", "\n"));

					good = false;
				}
			}
			for(var i = 0; i < recordersArray.length && good; i++)
			{
				if( recordersArray[i].SITE_DBID == deldbid )
				{
				
				alert(arch[51].replace("**", "\n") + switchesArray[i].SWITCH_NAME + arch[50].replace("**", "\n"));
				good = false;
				}
			}
			for(var i = 0; i < ecryptorsArray.length && good; i++)
			{
				if( ecryptorsArray[i].SITE_DBID == deldbid )
				{
					alert(arch[52].replace("**", "\n") + switchesArray[i].SWITCH_NAME + arch[50].replace("**", "\n"));
					good = false;
				}
			}
			if(good && found)
			{
			
				var yesno = confirm(arch[53] +obj.value+ arch[54].replace("**", "\n"));
				if( yesno )
				{
					displayPleaseWait(arch[55], "WAIT_FOR_SITE_DESTRUCTION");
					var str = '';
					str = '1^'+deldbid+'^NULL';
					appletObj.sendModifySites(str);
				}
			}
		}
	}
}

function sendCreateSwitch()
{
	var good = true;
	var obj = document.getElementById('dlg_addnewswitch_siteslist');

	if( obj.value == null || obj.value == '' )
	{
		alert(arch[56]);
		obj.focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_name').value == null 
				||	document.getElementById('dlg_addnewswitch_name').value == "")
	{
		alert(arch[57]);
		document.getElementById('dlg_addnewswitch_name').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_password').value == null 
				||	document.getElementById('dlg_addnewswitch_password').value == "")
	{
		alert(arch[58]);
		document.getElementById('dlg_addnewswitch_password').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_host').value == null 
				||	document.getElementById('dlg_addnewswitch_host').value == "")
	{
		alert(arch[59]);
		document.getElementById('dlg_addnewswitch_host').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_port').value == null 
				||	document.getElementById('dlg_addnewswitch_port').value == "" 
				|| !IsNumeric(document.getElementById('dlg_addnewswitch_port').value))
	{
		alert(arch[60]);
		document.getElementById('dlg_addnewswitch_port').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_exthost').value == null 
				||	document.getElementById('dlg_addnewswitch_exthost').value == "")
	{
		alert(arch[61]);
		document.getElementById('dlg_addnewswitch_exthost').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_extport').value == null 
				||	document.getElementById('dlg_addnewswitch_extport').value == ""
				|| !IsNumeric(document.getElementById('dlg_addnewswitch_extport').value))
	{
		alert(arch[60]);
		document.getElementById('dlg_addnewswitch_extport').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_numberoflines').value == null 
				||	document.getElementById('dlg_addnewswitch_numberoflines').value == ""
				|| isNaN(parseInt((document.getElementById('dlg_addnewswitch_numberoflines').value), 10)))
	{
		alert('Invalid number of lines.');
		document.getElementById('dlg_addnewswitch_numberoflines').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_agentloadbalance').value == null 
				||	document.getElementById('dlg_addnewswitch_agentloadbalance').value == ""
				|| !IsNumeric(document.getElementById('dlg_addnewswitch_agentloadbalance').value)
				|| document.getElementById('dlg_addnewswitch_agentloadbalance').value < 0 
				|| document.getElementById('dlg_addnewswitch_agentloadbalance').value > 100)
	{
		alert(arch[62]);
		document.getElementById('dlg_addnewswitch_agentloadbalance').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_outboundloadbalance').value == null 
				||	document.getElementById('dlg_addnewswitch_outboundloadbalance').value == ""
				|| !IsNumeric(document.getElementById('dlg_addnewswitch_outboundloadbalance').value)
				|| document.getElementById('dlg_addnewswitch_outboundloadbalance').value < 0 
				|| document.getElementById('dlg_addnewswitch_outboundloadbalance').value > 100)
	{
		alert(arch[63]);
		document.getElementById('dlg_addnewswitch_outboundloadbalance').focus();
		good = false;
	}
	else
	{
		//verify is site does not already exists !!
		for(var i = 0; i < switchesArray.length; i++)
		{
			if(switchesArray[i].SWITCH_NAME == document.getElementById('dlg_addnewswitch_name').value)	
			{
				alert(arch[64] +switchesArray[i].SWITCH_NAME +arch[65]);
				document.getElementById('dlg_addnewswitch_name').focus();
				good = false;
				break;
			}
		}
	}
	
	if( good ) //proceed
	{
		var save_str = '';
		save_str += document.getElementById('dlg_addnewswitch_name').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_siteslist').value + '^';
		save_str += document.getElementById('dlg_addnewswitch_password').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_host').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_port').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_exthost').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_extport').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_agentloadbalance').value + '^';
		save_str += document.getElementById('dlg_addnewswitch_outboundloadbalance').value + '^';
		save_str += parseInt(document.getElementById('dlg_addnewswitch_numberoflines').value, 10);
		
		displayPleaseWait(arch[66], "WAIT_FOR_SWITCH_CREATION");			
		appletObj.saveAsteriskSwitches( save_str );
	}	
}


function modifySwitch()
{
	var good = true;
	var obj = document.getElementById('dlg_addnewswitch_siteslist');
	
	var mod_dbid = "";
	if( obj.value == null || obj.value == '' )
	{
		alert(arch[56]);
		obj.focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_name').value == null 
				||	document.getElementById('dlg_addnewswitch_name').value == "")
	{
		alert(arch[57]);

		document.getElementById('dlg_addnewswitch_name').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_password').value == null 
				||	document.getElementById('dlg_addnewswitch_password').value == "")
	{
		alert(arch[58]);
		document.getElementById('dlg_addnewswitch_password').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_host').value == null 
				||	document.getElementById('dlg_addnewswitch_host').value == "")
	{
		alert(arch[59]);
		document.getElementById('dlg_addnewswitch_host').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_port').value == null 
				||	document.getElementById('dlg_addnewswitch_port').value == "" 
				|| !IsNumeric(document.getElementById('dlg_addnewswitch_port').value))
	{
		alert(arch[60]);

		document.getElementById('dlg_addnewswitch_port').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_exthost').value == null 
				||	document.getElementById('dlg_addnewswitch_exthost').value == "")
	{
		alert(arch[61]);
		document.getElementById('dlg_addnewswitch_exthost').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_extport').value == null 
				||	document.getElementById('dlg_addnewswitch_extport').value == ""
				|| !IsNumeric(document.getElementById('dlg_addnewswitch_extport').value))
	{
		alert(arch[60]);
		document.getElementById('dlg_addnewswitch_extport').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_numberoflines').value == null 
				||	document.getElementById('dlg_addnewswitch_numberoflines').value == ""
				|| isNaN(parseInt(document.getElementById('dlg_addnewswitch_numberoflines').value), 10))
	{
		alert('Invalid number of lines.');
		document.getElementById('dlg_addnewswitch_numberoflines').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_agentloadbalance').value == null 
				||	document.getElementById('dlg_addnewswitch_agentloadbalance').value == ""
				|| !IsNumeric(document.getElementById('dlg_addnewswitch_agentloadbalance').value)
				|| document.getElementById('dlg_addnewswitch_agentloadbalance').value < 0 
				|| document.getElementById('dlg_addnewswitch_agentloadbalance').value > 100)
	{
		alert(arch[62]);

		document.getElementById('dlg_addnewswitch_agentloadbalance').focus();
		good = false;
	}
	else if(document.getElementById('dlg_addnewswitch_outboundloadbalance').value == null 
				||	document.getElementById('dlg_addnewswitch_outboundloadbalance').value == ""
				|| !IsNumeric(document.getElementById('dlg_addnewswitch_outboundloadbalance').value)
				|| document.getElementById('dlg_addnewswitch_outboundloadbalance').value < 0 
				|| document.getElementById('dlg_addnewswitch_outboundloadbalance').value > 100)
	{
		alert(arch[63]);

		document.getElementById('dlg_addnewswitch_outboundloadbalance').focus();
		good = false;
	}
	else
	{
		//verify is site does not already exists !!
		//TODO
		/*
		for(var i = 0; i < switchesArray.length; i++)
		{
			if(switchesArray[i].SWITCH_NAME == document.getElementById('dlg_addnewswitch_name').value)	
			{
				alert('Error: Switch '+switchesArray[i].SWITCH_NAME+' already exists.');
				document.getElementById('dlg_addnewswitch_name').focus();
				good = false;
				break;
			}
		}*/
	}
	
	if( good ) //proceed
	{
		var save_str = '';
		save_str += document.getElementById('dlg_addnewswitch_name').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_siteslist').value + '^';
		save_str += document.getElementById('dlg_addnewswitch_password').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_host').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_port').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_exthost').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_extport').value 	+ '^';
		save_str += document.getElementById('dlg_addnewswitch_agentloadbalance').value + '^';
		save_str += document.getElementById('dlg_addnewswitch_outboundloadbalance').value + '^';
		save_str += parseInt(document.getElementById('dlg_addnewswitch_numberoflines').value, 10);
		
		displayPleaseWait(arch[67], "WAIT_FOR_SWITCH_MODIFICATION");			
		appletObj.saveAsteriskSwitches( save_str );
	}
}


function deleteSwitch()
{
	var obj = document.getElementById('dlg_addnewswitch_name');
	if( obj )
	{
		var good = true;
		var found = false;
		var delid = null;
		if( obj.value == "")
		{
		
			alert(arch[68]);
			obj.focus();
			good = false;
		}
		else
		{
			for(var i = 0; i < 	switchesArray.length; i++)
			{
				if(	switchesArray[i].SWITCH_NAME == obj.value )
				{					
					found = true;
					break;
				}
			}
			
			if( !found )
			{
				alert(arch[70] +obj.value );
				obj.focus();
				good = false;
			}
		}	
		
		if( good && found) //proceed
		{
			var yesno = confirm(arch[53] +obj.value+arch[69].replace("**", "\n"));
		
			if(yesno)
			{
				displayPleaseWait(arch[71], "WAIT_FOR_SWITCH_DELETING");
				appletObj.deleteAsteriskSwitch( obj.value );
			}
		}
	}
}

function saveThisPbxServer( rServer )
{
	var save_str = '';
	save_str += rServer.SWITCH_NAME + '^';
	save_str += rServer.SITE_DBID + '^';
	save_str += rServer.SWITCH_PASSWORD + '^';
	save_str += rServer.HOST + '^';
	save_str += rServer.PORT + '^';
	save_str += rServer.EXTERN_HOST	+ '^';
	save_str += rServer.EXTERN_PORT	+ '^';
	save_str += rServer.LOAD_BALANCE_FOR_AGENTS + '^';
	save_str += rServer.LOAD_BALANCE_FOR_OUTBOUND;
	
	displayPleaseWait(arch[67], "WAIT_FOR_SWITCH_MODIFICATION");			
	appletObj.saveAsteriskSwitches( save_str );
}

function sendCreateEncryption()
{
	var good = true;
	var obj = document.getElementById('dlg_addnewencryption_siteslist');
	if(obj.value == null || obj.value == "")
	{
	
		alert(arch[72]);
		obj.focus();
		good = false;
	} else if(document.getElementById('dlg_addnewencryption_name').value == null ||
			document.getElementById('dlg_addnewencryption_name').value == "")
	{
		alert(arch[73]);
		document.getElementById('dlg_addnewencryption_name').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_protocol').value == null ||
			document.getElementById('dlg_addnewencryption_protocol').value == "")
	{
		alert(arch[74]);
		document.getElementById('dlg_addnewencryption_protocol').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_host').value == null ||
			document.getElementById('dlg_addnewencryption_host').value == "")
	{
		alert(arch[75]);
		document.getElementById('dlg_addnewencryption_host').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_port').value == null ||
			document.getElementById('dlg_addnewencryption_port').value == "")
	{
	
		alert(arch[78]);
		document.getElementById('dlg_addnewencryption_port').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_exthost').value == null ||
			document.getElementById('dlg_addnewencryption_exthost').value == "")
	{
	
		alert(arch[76]);
		document.getElementById('dlg_addnewencryption_exthost').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_extport').value == null ||
			document.getElementById('dlg_addnewencryption_extport').value == "")
	{
	
		alert(arch[79]);
		document.getElementById('dlg_addnewencryption_extport').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_url').value == null ||
			document.getElementById('dlg_addnewencryption_url').value == "")
	{
	
		alert(arch[77]);
		document.getElementById('dlg_addnewencryption_url').focus();
		good = false;	
	}
	
	else
	{
		//verify if the encryption server does not already exists
		for(var i = 0; i < ecryptorsArray.length; i++)
		{
			if(ecryptorsArray[i].SERVERNAME == document.getElementById('dlg_addnewencryption_name').value)	
			{
				alert(arch[80] +" "+ecryptorsArray[i].SERVERNAME +" "+arch[65]);
				document.getElementById('dlg_addnewencryption_name').focus();
				good = false;
				break;
			}
		}
	}	
	
	if( good ) //proceed
	{
		appletObj.saveEncryptionServer( 
					"", 
					document.getElementById('dlg_addnewencryption_name').value,
					document.getElementById('dlg_addnewencryption_host').value,
					document.getElementById('dlg_addnewencryption_port').value,
					document.getElementById('dlg_addnewencryption_siteslist').value,
					document.getElementById('dlg_addnewencryption_url').value,
					document.getElementById('dlg_addnewencryption_protocol').value,
					document.getElementById('dlg_addnewencryption_exthost').value,
					document.getElementById('dlg_addnewencryption_extport').value  );
		displayPleaseWait("Please wait for encryption server creation...", "WAIT_FOR_ENCRYPTION_CREATION");
	}
}

function modifyEncryption()
{	
	var good = true;
	var obj = document.getElementById('dlg_addnewencryption_siteslist');
	if(obj.value == null || obj.value == "")
	{
		alert(arch[72]);
		obj.focus();
		good = false;
	} else if(document.getElementById('dlg_addnewencryption_name').value == null ||
			document.getElementById('dlg_addnewencryption_name').value == "")
	{
		alert(arch[73]);

		document.getElementById('dlg_addnewencryption_name').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_protocol').value == null ||
			document.getElementById('dlg_addnewencryption_protocol').value == "")
	{
		alert(arch[74]);

		document.getElementById('dlg_addnewencryption_protocol').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_host').value == null ||
			document.getElementById('dlg_addnewencryption_host').value == "")
	{
		alert(arch[75]);

		document.getElementById('dlg_addnewencryption_host').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_port').value == null ||
			document.getElementById('dlg_addnewencryption_port').value == "")
	{
		alert(arch[78]);

		document.getElementById('dlg_addnewencryption_port').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_exthost').value == null ||
			document.getElementById('dlg_addnewencryption_exthost').value == "")
	{
		alert(arch[76]);
		document.getElementById('dlg_addnewencryption_exthost').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_extport').value == null ||
			document.getElementById('dlg_addnewencryption_extport').value == "")
	{
		alert(arch[79]);

		document.getElementById('dlg_addnewencryption_extport').focus();
		good = false;	
	} else if(document.getElementById('dlg_addnewencryption_url').value == null ||
			document.getElementById('dlg_addnewencryption_url').value == "")
	{
		alert(arch[77]);

		document.getElementById('dlg_addnewencryption_url').focus();
		good = false;	
	}
	
	if( good ) //proceed
	{
		//go and get the dbid
		var dbid = '';
		for(var i = 0; i < ecryptorsArray.length; i++)
		{
			if(ecryptorsArray[i].SERVERNAME == document.getElementById('dlg_addnewencryption_name').value)
			{
				dbid = ecryptorsArray[i].DBID;
				break;
			}
		}
		appletObj.saveEncryptionServer( 
					dbid, 
					document.getElementById('dlg_addnewencryption_name').value,
					document.getElementById('dlg_addnewencryption_host').value,
					document.getElementById('dlg_addnewencryption_port').value,
					document.getElementById('dlg_addnewencryption_siteslist').value,
					document.getElementById('dlg_addnewencryption_url').value,
					document.getElementById('dlg_addnewencryption_protocol').value,
					document.getElementById('dlg_addnewencryption_exthost').value,
					document.getElementById('dlg_addnewencryption_extport').value  );
		displayPleaseWait(arch[67], "WAIT_FOR_ENCRYPTION_MODIFICATION");
	}	
}

function deleteEncryption()
{
	var obj = document.getElementById('dlg_addnewencryption_name');
	var name = obj.value;
	obj = document.getElementById('dlg_addnewencryption_siteslist');
	var site = obj.value;
	var dbid = null;
	for(var i = 0; i < ecryptorsArray.length; i++)
	{
		if(ecryptorsArray[i].SITE_DBID == site && ecryptorsArray[i].SERVERNAME == name)
		{
			dbid = ecryptorsArray[i].DBID;
			break;	
		}
	}
	if(dbid)
	{
		var yesno = confirm('Warning. You are about to delete this encryption server.\nDo you want to continue ?');
		if(yesno)
		{
			displayPleaseWait("Please wait while deleting encryption server ...", "WAIT_FOR_ENCRYPTION_DELETING");
			appletObj.deleteEncServer(dbid);	
			/*initialize();*/
		}			
	}
}

function saveThisEncryptionServer(rServer)
{
	appletObj.saveEncryptionServer( 
					rServer.DBID ,
					rServer.SERVERNAME ,
					rServer.IPADDRESS ,
					rServer.PORT ,
					rServer.SITE_DBID ,
					rServer.SERVLETURL ,
					rServer.PROTOCOL ,
					rServer.EXT_IPADDRESS,
					rServer.EXT_PORT  );
	displayPleaseWait("Please wait for encryption server modification...", "WAIT_FOR_ENCRYPTION_MODIFICATION");	
}

function sendCreateRecordingServer()
{
	var good = true;
	
	if(document.getElementById('dlg_addnewrecorder_siteslist').value == null || 
							   	document.getElementById('dlg_addnewrecorder_siteslist').value == '')
	{
		good = false;
		
		alert(arch[81]);

		document.getElementById('dlg_addnewrecorder_siteslist').focus();		
	} 
	else if(document.getElementById('dlg_addnewrecorder_name').value == null || 
							   	document.getElementById('dlg_addnewrecorder_name').value == '')
	{
		good = false;
		alert(arch[82]);
		document.getElementById('dlg_addnewrecorder_name').focus();		
	} 
	else if(document.getElementById('dlg_addnewrecorder_password').value == null || 
							   	document.getElementById('dlg_addnewrecorder_password').value == '')
	{
		good = false;
		
		alert(arch[83]);
		document.getElementById('dlg_addnewrecorder_password').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_host').value == null || 
							   	document.getElementById('dlg_addnewrecorder_host').value == '')
	{
		good = false;
		
		alert(arch[84]);
		document.getElementById('dlg_addnewrecorder_host').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_port').value == null || 
							   	document.getElementById('dlg_addnewrecorder_port').value == '')
	{
		good = false;
		
		alert(arch[85]);
		document.getElementById('dlg_addnewrecorder_port').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_secport').value == null || 
							   	document.getElementById('dlg_addnewrecorder_secport').value == '')
	{
		good = false;
		
		alert(arch[86]);
		document.getElementById('dlg_addnewrecorder_secport').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_exthost').value == null || 
							   	document.getElementById('dlg_addnewrecorder_exthost').value == '')
	{
		good = false;
		
		alert(arch[87]);
		document.getElementById('dlg_addnewrecorder_exthost').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_extport').value == null || 
							   	document.getElementById('dlg_addnewrecorder_extport').value == '')
	{
		good = false;
		
		alert(arch[88]);
		document.getElementById('dlg_addnewrecorder_extport').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_extsecport').value == null || 
							   	document.getElementById('dlg_addnewrecorder_extsecport').value == '')
	{
		good = false;
		
		alert(arch[89]);
		document.getElementById('dlg_addnewrecorder_extsecport').focus();
	} 
	else if(document.getElementById('dlg_adddlg_addnewrecorder_Path').value == null || 
							   	document.getElementById('dlg_adddlg_addnewrecorder_Path').value == '')
	{
		good = false;
		
		alert(arch[90]);
		document.getElementById('dlg_adddlg_addnewrecorder_Path').focus();
	} 	
	else if(document.getElementById('dlg_adddlg_addnewrecorder_salesPath').value == null || 
							   	document.getElementById('dlg_adddlg_addnewrecorder_salesPath').value == '')
	{
		good = false;
		
		alert(arch[91]);
		document.getElementById('dlg_adddlg_addnewrecorder_salesPath').focus();
	} 
	else if(document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath').value == null || 
							   	document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath').value == '')
	{
		good = false;
		
		alert(arch[92]);
		document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_agentloadbalance').value == null || 
							   	document.getElementById('dlg_addnewrecorder_agentloadbalance').value == '')
	{
		good = false;
		
		alert(arch[93]);
		document.getElementById('dlg_addnewrecorder_agentloadbalance').focus();
	}
	else if(document.getElementById('dlg_adddlg_addnewrecorder_activesync').checked)
	{
		if(document.getElementById('dlg_adnewrecorder_synctime').value == null || document.getElementById('dlg_adnewrecorder_synctime').value.length == 0)
		{
			good = false;
			alert(arch[94]);

			document.getElementById('dlg_adnewrecorder_synctime').focus();
		}
		else if(document.getElementById('dlg_addnewrecorder_sendto').value == null || document.getElementById('dlg_addnewrecorder_sendto').value.length == 0)
		{
			good = false;
			alert(arch[95]);

			document.getElementById('dlg_addnewrecorder_sendto').focus();
		}
	}
	
	if(document.getElementById('dlg_adnewrecorder_synctime').value.length > 0 )
	{
		var synctime = document.getElementById('dlg_adnewrecorder_synctime').value;
		if((synctime.charAt(2) != ':') || (synctime.length != 5)){
			good = false;
			alert(arch[96]);
			if(!document.getElementById('dlg_adnewrecorder_synctime').disabled)
				document.getElementById('dlg_adnewrecorder_synctime').focus();
		}
		else {
			  var tmpsnctimehr = synctime.substring(0,synctime.indexOf(':'));
			  var tmpsnctimemin = synctime.substring(synctime.indexOf(':')+1) 
			  if((!IsInteger(tmpsnctimehr)) || (!IsInteger(tmpsnctimemin))){
			  	good = false;
				alert(arch[97]);
				if(!document.getElementById('dlg_adnewrecorder_synctime').disabled)
					document.getElementById('dlg_adnewrecorder_synctime').focus();
			  }
			  else if(tmpsnctimehr>23 || tmpsnctimemin>59){
				good = false;
				alert(arch[98]);
				if(!document.getElementById('dlg_adnewrecorder_synctime').disabled)
					document.getElementById('dlg_adnewrecorder_synctime').focus();  
			  }
	   } 	
	}
	else if(document.getElementById('dlg_addnewrecorder_tomcaturl').value == null || 
							   	document.getElementById('dlg_addnewrecorder_tomcaturl').value == '')
	{
		good = false;
		
		alert(arch[99]);
		document.getElementById('dlg_addnewrecorder_tomcaturl').focus();
								
	}
	else
	{		
		for( var i = 0; i < recordersArray.length; i++)
		{
			if(recordersArray[i].SERVER_NAME == document.getElementById('dlg_addnewrecorder_name').value)
			{
				good = false;
				alert(arch[100]+" "+recordersArray[i].SERVER_NAME+" "+arch[65]);
				break;	
			}
		}
	}
	
	if( good )
	{
		//verify if the record server does not already exists
		for(var i = 0; i < recordersArray.length; i++)
		{
			if(recordersArray[i].SERVER_NAME == document.getElementById('dlg_addnewrecorder_name').value)	
			{
				alert(arch[101]+" "+recordersArray[i].SERVER_NAME +" "+arch[65]);
				document.getElementById('dlg_addnewrecorder_name').focus();
				good = false;
				break;
			}
		}	
	}
	
	if( good ) //proceed
	{
		var str = '';
		str += 	document.getElementById('dlg_addnewrecorder_name').value +'^'+
				document.getElementById('dlg_addnewrecorder_password').value +'^'+
				document.getElementById('dlg_addnewrecorder_host').value +'^'+
				document.getElementById('dlg_addnewrecorder_port').value +'^'+
				document.getElementById('dlg_addnewrecorder_secport').value +'^'+
				document.getElementById('dlg_addnewrecorder_exthost').value +'^'+
				document.getElementById('dlg_addnewrecorder_extport').value +'^'+
				document.getElementById('dlg_addnewrecorder_extsecport').value +'^'+
				document.getElementById('dlg_adddlg_addnewrecorder_salesPath').value +'^'+
				document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath').value +'^'+
				document.getElementById('dlg_addnewrecorder_siteslist').value +'^'+
				document.getElementById('dlg_adnewrecorder_synctime').value +'^'+
				document.getElementById('dlg_addnewrecorder_agentloadbalance').value +'^'+				
				document.getElementById('dlg_addnewrecorder_sendto').value +'^'+				
				(document.getElementById('dlg_adddlg_addnewrecorder_activesync').checked ? "1" : "0") + '^' +
				document.getElementById('dlg_addnewrecorder_maxdisktouse').value+'^'+
				document.getElementById('dlg_addnewrecorder_tomcaturl').value+'^'+
				document.getElementById('dlg_adddlg_addnewrecorder_Path').value;
				
				
		displayPleaseWait("Please wait while creating new recording server ...", "WAIT_FOR_RECORDINGSERVER_CREATION");
		appletObj.sendAddRecordingServer( str );				
				
	}
	
	
}

function sendModifyRecordingServer()
{
	var good = true;
	
	if(document.getElementById('dlg_addnewrecorder_siteslist').value == null || 
							   	document.getElementById('dlg_addnewrecorder_siteslist').value == '')
	{
		good = false;
		alert(arch[81]);
		document.getElementById('dlg_addnewrecorder_siteslist').focus();		
	} 
	else if(document.getElementById('dlg_addnewrecorder_name').value == null || 
							   	document.getElementById('dlg_addnewrecorder_name').value == '')
	{
		good = false;
		alert(arch[82]);
		document.getElementById('dlg_addnewrecorder_name').focus();		
	} 
	else if(document.getElementById('dlg_addnewrecorder_password').value == null || 
							   	document.getElementById('dlg_addnewrecorder_password').value == '')
	{
		good = false;
		alert(arch[83]);

		document.getElementById('dlg_addnewrecorder_password').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_host').value == null || 
							   	document.getElementById('dlg_addnewrecorder_host').value == '')
	{
		good = false;
		alert(arch[84]);

		document.getElementById('dlg_addnewrecorder_host').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_port').value == null || 
							   	document.getElementById('dlg_addnewrecorder_port').value == '')
	{
		good = false;
		alert(arch[85]);

		document.getElementById('dlg_addnewrecorder_port').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_secport').value == null || 
							   	document.getElementById('dlg_addnewrecorder_secport').value == '')
	{
		good = false;
		alert(arch[86]);

		document.getElementById('dlg_addnewrecorder_secport').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_exthost').value == null || 
							   	document.getElementById('dlg_addnewrecorder_exthost').value == '')
	{
		good = false;
		alert(arch[87]);

		document.getElementById('dlg_addnewrecorder_exthost').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_extport').value == null || 
							   	document.getElementById('dlg_addnewrecorder_extport').value == '')
	{
		good = false;
		alert(arch[88]);

		document.getElementById('dlg_addnewrecorder_extport').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_extsecport').value == null || 
							   	document.getElementById('dlg_addnewrecorder_extsecport').value == '')
	{
		good = false;
		alert(arch[89]);

		document.getElementById('dlg_addnewrecorder_extsecport').focus();
	} 
	else if(document.getElementById('dlg_adddlg_addnewrecorder_salesPath').value == null || 
							   	document.getElementById('dlg_adddlg_addnewrecorder_salesPath').value == '')
	{
		good = false;
		alert(arch[91]);

		document.getElementById('dlg_adddlg_addnewrecorder_salesPath').focus();
	} 
	else if(document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath').value == null || 
							   	document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath').value == '')
	{
		good = false;
		alert(arch[92]);

		document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath').focus();
	} 
	else if(document.getElementById('dlg_addnewrecorder_agentloadbalance').value == null || 
							   	document.getElementById('dlg_addnewrecorder_agentloadbalance').value == '')
	{
		good = false;
		alert(arch[93]);

		document.getElementById('dlg_addnewrecorder_agentloadbalance').focus();
	}
	else if(document.getElementById('dlg_adddlg_addnewrecorder_activesync').checked)
	{
		if(document.getElementById('dlg_adnewrecorder_synctime').value == null || document.getElementById('dlg_adnewrecorder_synctime').value.length == 0)
		{
			good = false;
			alert(arch[94]);

			document.getElementById('dlg_adnewrecorder_synctime').focus();
		}
		else if(document.getElementById('dlg_addnewrecorder_sendto').value == null || document.getElementById('dlg_addnewrecorder_sendto').value.length == 0)
		{
			good = false;
			alert(arch[95]);

			document.getElementById('dlg_addnewrecorder_sendto').focus();
		}
	}
	
	if(document.getElementById('dlg_adnewrecorder_synctime').value.length > 0 )
	{
		var synctime = document.getElementById('dlg_adnewrecorder_synctime').value;		
		if((synctime.charAt(2) != ':') || (synctime.length != 5)){
			good = false;
			alert(arch[96]);
			if(!document.getElementById('dlg_adnewrecorder_synctime').disabled)
				document.getElementById('dlg_adnewrecorder_synctime').focus();
		}
		else {
		  var tmpsnctimehr = synctime.substring(0,synctime.indexOf(':'));
		  var tmpsnctimemin = synctime.substring(synctime.indexOf(':')+1) 
		  if((!IsInteger(tmpsnctimehr)) || (!IsInteger(tmpsnctimemin))){
		  	good = false;
			alert(arch[97]);
			if(!document.getElementById('dlg_adnewrecorder_synctime').disabled)
				document.getElementById('dlg_adnewrecorder_synctime').focus();
		  }
		  else if(tmpsnctimehr>23 || tmpsnctimemin>59){
			good = false;
			alert(arch[98]);
			if(!document.getElementById('dlg_adnewrecorder_synctime').disabled)
				document.getElementById('dlg_adnewrecorder_synctime').focus();  
		  }
		} 
		
	}
	else if(document.getElementById('dlg_addnewrecorder_tomcaturl').value == null || 
							   	document.getElementById('dlg_addnewrecorder_tomcaturl').value == '')
	{
		good = false;
		
		alert(arch[99]);
		document.getElementById('dlg_addnewrecorder_tomcaturl').focus();
	}	
	else
	{		 
		/*for( var i = 0; i < recordersArray.length; i++)
		{
			if(recordersArray[i].SERVER_NAME == document.getElementById('dlg_addnewrecorder_name').value)
			{
				good = false;
				alert('A recording server named '+recordersArray[i].SERVER_NAME+' already exists.');
				break;
			}
		}*/
	}
	
	
	if( good ) //proceed
	{
		var str = '';
		var thedbid = null;
		
		var siteHasChanged=false;
		var sitedbid = document.getElementById('dlg_addnewrecorder_siteslist').value;	

		for(var i = 0; i < recordersArray.length; i++)
		{
			if(recordersArray[i].SERVER_NAME == document.getElementById('dlg_addnewrecorder_name').value)
			{
				thedbid = recordersArray[i].DBID;
				if(recordersArray[i].SITE_DBID != sitedbid)
					siteHasChanged = true;
				break;
			}
		}
		
		if(siteHasChanged)
		{
			var foundedat = null;
			
			//we will need to determine if the (sitedbid, sitename) already exist (nochange) or had just his name changed
			for(var j = 0; j < sitesArray.length; j++)	//already exist sites...
			{
				if(sitedbid == sitesArray[j].DBID ) //the same dbid and the same name
				{					 
					foundedat = j;					 
					break;
				}				 
			}
				
			//Search for the new site xpos and ypos					
			var tmpobj=sitesArray[foundedat];		
			var newx = dd.elements[ (sitesArray[foundedat].divPoolid) ].x + 0;
			var newy = dd.elements[ (sitesArray[foundedat].divPoolid) ].y + 10;			
			//alert('foundedat='+foundedat+'..x='+newx+'..y='+newy)
			dd.elements[recordersArray[i].divPoolid].moveTo(newx, newy); 	 		
			dd.elements[recordersArray[i].divPoolid].show();
			
			//add the record server to the new site
			dd.elements[(sitesArray[foundedat].divPoolid)].addChild( recordersArray[i].divPoolid );
			//TODO: remove it from the old site
		}
		str +=	thedbid + '^'+
				document.getElementById('dlg_addnewrecorder_name').value +'^'+
				document.getElementById('dlg_addnewrecorder_password').value +'^'+
				document.getElementById('dlg_addnewrecorder_host').value +'^'+
				document.getElementById('dlg_addnewrecorder_port').value +'^'+
				document.getElementById('dlg_addnewrecorder_secport').value +'^'+
				document.getElementById('dlg_addnewrecorder_exthost').value +'^'+
				document.getElementById('dlg_addnewrecorder_extport').value +'^'+
				document.getElementById('dlg_addnewrecorder_extsecport').value +'^'+
				document.getElementById('dlg_adddlg_addnewrecorder_salesPath').value +'^'+
				document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath').value +'^'+
				document.getElementById('dlg_addnewrecorder_siteslist').value +'^'+
				document.getElementById('dlg_adnewrecorder_synctime').value +'^'+
				document.getElementById('dlg_addnewrecorder_agentloadbalance').value +'^'+
				document.getElementById('dlg_addnewrecorder_sendto').value +'^'+
				(document.getElementById('dlg_adddlg_addnewrecorder_activesync').checked ? "1" : "0") +'^'+
				document.getElementById('dlg_addnewrecorder_maxdisktouse').value+'^'+				
				document.getElementById('dlg_addnewrecorder_tomcaturl').value+'^'+ 
				document.getElementById('dlg_adddlg_addnewrecorder_Path').value;
				

		displayPleaseWait(arch[102], "WAIT_FOR_RECORDINGSERVER_MODIFICATION");
		appletObj.sendModifyRecordingServer( str );				
				
	}	
}


function sendDeleteRecordingServer()
{
	var obj = document.getElementById('dlg_addnewrecorder_name');
	if( obj )
	{
		var yesno = confirm("You are about to delete "+obj.value+" recording server.\nDo you want to continue ?");
		if( yesno )
		{			
			for(var i = 0; i < recordersArray.length; i++)
			{
				if(recordersArray[i].SERVER_NAME == obj.value)
				{
					displayPleaseWait("Please wait while deleting recording server ...", "WAIT_FOR_RECORDINGSERVER_DELETING");
					appletObj.sendDeleteRecordingServer( recordersArray[i].DBID );	
					//document
					break;
				}				
			}			
		}
	}
}

function saveThisRecordingServer(rServer)
{
	var str = "";	
	str +=	rServer.DBID + '^'+
	rServer.SERVER_NAME +'^'+
	rServer.SERVER_PASSWORD +'^'+
	rServer.HOST +'^'+
	rServer.PORT +'^'+
	rServer.SEC_PORT +'^'+
	rServer.EXTERN_HOST +'^'+
	rServer.EXTERN_PORT +'^'+
	rServer.EXTERN_SEC_PORT +'^'+
	rServer.SALES_PATH +'^'+
	rServer.NOSALES_PATH +'^'+
	rServer.SITE_DBID +'^'+
	rServer.REC_SYNC_TIME +'^'+
	rServer.LOAD_BALANCE_FOR_AGENTS +'^'+
	rServer.MASTER_SERVER +'^'+
	(rServer.ALLOW_REC_SYNC ? "1" : "0") +'^'+
	rServer.MAX_DISK_TO_USE+'^'+
	rServer.TOMCAT_URL+'^'+
	rServer.RECORDINGS_PATH;
	
	displayPleaseWait(arch[102], "WAIT_FOR_RECORDINGSERVER_MODIFICATION");
	appletObj.sendModifyRecordingServer( str );
}
/***
	Context Menu Functions
***/
function displaySiteCfg(siteid)
{	
	//find the site
	for(var i = 0 ; i < sitesArray.length; i++)
	{		
		if(	sitesArray[i].unid == siteid)
		{			
			dialogDisplay("DLG_SITECFG");
			//fill the form...
			var obj = document.getElementById('siteCfgTitle');
			obj.innerText = arch[103];
			obj = document.getElementById('siteCfgNameLbl');
			obj.innerText = arch[1];
			obj = document.getElementById('siteCfgSubmitBtn');
			
			obj = document.getElementById('siteCfgIntCodecName');
			obj.innerText = arch[2];
	
			obj = document.getElementById('siteCfgExtCodecName');
			obj.innerText = arch[3];
			
			obj = document.getElementById('siteCfgProxyHost');
			obj.innerText = arch[4];
			
			obj = document.getElementById('siteCfgProxyPort');
			obj.innerText = arch[5];
			
			siteCfgSubmitBtn
			obj = document.getElementById('siteCfgSubmitBtn');
			obj.innerText = arch[6];
			obj = document.getElementById('siteCfgDelBtn');
			obj.innerText =arch[104];
			
			var txtobj = document.getElementById('dlg_sitecfgtext');		
			var internalIaxCodec_obj = document.getElementById('dlg_updatesiteInternalCodec');
			var externalIaxCodec_obj = document.getElementById('dlg_updatesiteExternalCodec');
			var proxyhost_obj = document.getElementById('dlg_updatesiteProxyHost');
			var proxyport_obj = document.getElementById('dlg_updatesiteProxyPort');

			if( txtobj )
			{				
				txtobj.value = sitesArray[i].SITE_NAME;	
				txtobj.setAttribute("site_dbid", sitesArray[i].DBID);
			}
			//alert( sitesArray[i].SITE_INTCODEC );
			//alert( sitesArray[i].SITE_EXTCODEC );
			if( internalIaxCodec_obj )
			{
				for(var j = 0; j < internalIaxCodec_obj.options.length; j++)
   				{
				     	if(internalIaxCodec_obj.options[j].value == sitesArray[i].SITE_INTCODEC)
       					{
         					internalIaxCodec_obj.options[j].selected = true;
       					}
					else
					{
						internalIaxCodec_obj.options[j].selected = false;
					}
   				}
			}
			
			if( externalIaxCodec_obj )
			{
				for(var k = 0; k < externalIaxCodec_obj.options.length; k++)
   				{
     					if(externalIaxCodec_obj.options[k].value == sitesArray[i].SITE_EXTCODEC)
       					{
         					externalIaxCodec_obj.options[k].selected = true;
       					}
					else
					{
						externalIaxCodec_obj.options[k].selected = false;
					}
   				}

			}
			
			if( proxyhost_obj )
			{				
				proxyhost_obj.value = sitesArray[i].SITE_PROXY_HOST;	
				//proxyhost_obj.setAttribute("site_dbid", sitesArray[i].DBID);
			}
			
			if( proxyport_obj )
			{				
				proxyport_obj.value = sitesArray[i].SITE_PROXY_PORT;	
				//proxyport_obj.setAttribute("site_dbid", sitesArray[i].DBID);
			}

			break;
		}
	}
}


function displayCtiServerLiveStats()
{
	dialogDisplay("DLG_CTI_LIVE_STATS");
	
	//fill the boxes...	
	var obj = null;
	
	obj = document.getElementById('ctiLiveStatTitle');
	if( obj )
		obj.innerText = arch[105];
	obj = document.getElementById('ctiLiveStatCfg');
	if( obj )
		obj.innerText = arch[106];
	obj = document.getElementById('ctiLiveStatConn');
	if( obj )
		obj.innerText = arch[107];
	obj = document.getElementById('ctiLiveStatMngLbl');
	if( obj )
		obj.innerText = arch[108];
	obj = document.getElementById('ctiLiveStatAgtLbl');
	if( obj )
		obj.innerText = arch[109];
	obj = document.getElementById('ctiLiveStatSwitchLbl');
	if( obj )
		obj.innerText = arch[110];
 	obj = document.getElementById('ctiLiveStatRcdrSvrLbl');
	if( obj )
		obj.innerText = arch[111];
	obj = document.getElementById('ctiLiveStatEncrSvrLbl');
	if( obj )
		obj.innerText = arch[112];
		
	obj = document.getElementById('dlg_ctistats_managers_confs');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Managers"]["Configured"];
	obj = document.getElementById('dlg_ctistats_managers_connected');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Managers"]["Connected"];
	obj = document.getElementById('dlg_ctistats_agents_confs');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Agents"]["Configured"];
	obj = document.getElementById('dlg_ctistats_agents_connected');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Agents"]["Connected"];
	obj = document.getElementById('dlg_ctistats_switches_confs');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Switches"]["Configured"];
	obj = document.getElementById('dlg_ctistats_switches_connected');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Switches"]["Connected"];
	obj = document.getElementById('dlg_ctistats_recorders_confs');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["RecordingServers"]["Configured"];
	obj = document.getElementById('dlg_ctistats_recorders_connected');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["RecordingServers"]["Connected"];
	obj = document.getElementById('dlg_ctistats_encryptors_confs');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["EncryptionServers"]["Configured"];
	obj = document.getElementById('dlg_ctistats_encryptors_connected');
	if( obj )
		obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["EncryptionServers"]["Connected"];
}

function displaySwitchCfg(sid)
{
	for(var i = 0; i < switchesArray.length; i++)
	{
		if(switchesArray[i].unid == sid)
		{
			dialogDisplay("DLG_MODIFY_SWITCH");
			//fill the form
			var obj = null;
			
			//obj = document.getElementById('');
			obj = document.getElementById('modifySwitch_Title');
			if( obj )
				obj.innerText = arch[113];
			obj = document.getElementById('modifySwitch_siteLbl');
			if( obj )
				obj.innerText = arch[8];
			obj = document.getElementById('modifySwitch_NameLbl');
			if( obj )
				obj.innerText = arch[9];
			obj = document.getElementById('modifySwitch_pwLbl');
			if( obj )
				obj.innerText = arch[10];
			obj = document.getElementById('modifySwitch_iaxInterHostLbl');
			if( obj )
				obj.innerText =arch[11];
			obj = document.getElementById('modifySwitch_iaxInterPortLbl');
			if( obj )
				obj.innerText = arch[12];
			obj = document.getElementById('modifySwitch_iaxExHostLbl');
			if( obj )
			obj.innerText = arch[13];
			obj = document.getElementById('modifySwitch_iaxExPortLbl');
			if( obj )
				obj.innerText = arch[14];				
			obj = document.getElementById('modifySwitch_nbLineAvailForOutbndLbl');
			if( obj )
				obj.innerText = arch[15]; 
			obj = document.getElementById('modifySwitch_agtLoadBalLbl');
			if( obj )
				obj.innerText = arch[16];
			obj = document.getElementById('modifySwitch_percentInSiteLbl');
			if( obj )
				obj.innerText = arch[17];
			obj = document.getElementById('modifySwitch_OBLoadBalLbl');
			if( obj )
				obj.innerText = arch[18];
			obj = document.getElementById('modifySwitch_updateBtn');
			if( obj )
				obj.innerText = arch[114];
			obj = document.getElementById('modifySwitch_delBtn');
			if( obj )
				obj.innerText = arch[104];
										 						
			obj = document.getElementById('dlg_addnewswitch_siteslist');
			//fill the sites
			var tmpopt = new Option("", "");
			obj.options[ obj.options.length ] = tmpopt;
			for(var j = 0; j < sitesArray.length; j++)
			{
				tmpopt = new Option(sitesArray[j].SITE_NAME, sitesArray[j].DBID);
				obj.options[ obj.options.length ] = tmpopt;
				if(sitesArray[j].DBID == switchesArray[i].SITE_DBID)
				{
					obj.options[ obj.options.length-1 ].selected = true;
				}
			}
			
			obj = document.getElementById('dlg_addnewswitch_name');
			if( obj )
				obj.value = switchesArray[i].SWITCH_NAME;
			obj = document.getElementById('dlg_addnewswitch_password');
			if( obj )
				obj.value = switchesArray[i].SWITCH_PASSWORD;
			obj = document.getElementById('dlg_addnewswitch_host');
			if( obj )
				obj.value = switchesArray[i].HOST;
			obj = document.getElementById('dlg_addnewswitch_port');
			if( obj )
				obj.value = switchesArray[i].PORT;
			obj = document.getElementById('dlg_addnewswitch_exthost');
			if( obj )
				obj.value = switchesArray[i].EXTERN_HOST;
			obj = document.getElementById('dlg_addnewswitch_extport');
			if( obj )
				obj.value = switchesArray[i].EXTERN_PORT;
			obj = document.getElementById('dlg_addnewswitch_agentloadbalance');
			if( obj )
				obj.value = switchesArray[i].LOAD_BALANCE_FOR_AGENTS;
			obj = document.getElementById('dlg_addnewswitch_outboundloadbalance');
			if( obj )
				obj.value = switchesArray[i].LOAD_BALANCE_FOR_OUTBOUND;
			obj = document.getElementById('dlg_addnewswitch_numberoflines');
			if( obj )
				obj.value = switchesArray[i].NUMBER_OF_LINES;
			break;
		}		
	}
}


function displaySwitchLiveStats(switch_name)
{
	for(var i = 0; i < 	switchesArray.length; i++)
	{
		if( switchesArray[i].SWITCH_NAME == switch_name)	
		{			
			dialogDisplay("DLG_SWITCH_STATS");
			//fill with informations
			//fill the boxes...	
			var obj = null;
			obj = document.getElementById('swichStatsTitle');
			if( obj )
				obj.innerText = arch[115];
			obj = document.getElementById('swichStats_swNameLbl');
			if( obj )
				obj.innerText = arch[110];
			obj = document.getElementById('swichStats_statusLbl');
			if( obj )
				obj.innerText = arch[116];
			obj = document.getElementById('swichStats_sinceLbl');
			if( obj )
				obj.innerText = arch[117];
			obj = document.getElementById('swichStats_agentsLbl');
			if( obj )
				obj.innerText = arch[118];
			obj = document.getElementById('swichStats_inboundCallsLbl');
			if( obj )
				obj.innerText = arch[119];
			obj = document.getElementById('swichStats_outboundDialsLbl');
			if( obj )
				obj.innerText = arch[120];
				// ========================
			obj = document.getElementById('swichStats_linesUsageLbl');
			if( obj )
				obj.innerText = arch[125];//
			
			//get the site name
			var site_name = '';
			for(var j = 0; j < sitesArray.length; j++)
			{
				if(sitesArray[j].DBID == switchesArray[i].SITE_DBID)
				{
					site_name = sitesArray[j].SITE_NAME;
					break;
				}
			}
			
			var obj = null;
			obj = document.getElementById('dlg_switch_stats_name');
			if( obj )
				obj.innerText = switchesArray[i].SWITCH_NAME+'@'+site_name;
			obj = document.getElementById('dlg_switch_stats_status');
			if( obj )
			{
				var s = 'Unknow';
				obj.style.color = 'black';
				if(liveStatsArray[switchesArray[i].SWITCH_NAME])
				{
					if(liveStatsArray[switchesArray[i].SWITCH_NAME]["Status"] == 'true')
					{
						s = 'Connected';
						obj.style.color = 'green';
						obj.innerText =arch[107];
					}
					else if(liveStatsArray[switchesArray[i].SWITCH_NAME]["Status"] == 'false')
					{
						s = 'Disconnected';
						obj.style.color = 'red';
						obj.innerText =arch[137];
					}
				}
				 
			}
			obj = document.getElementById('dlg_switch_stats_statussince');
			if( obj )
				obj.innerText = liveStatsArray[switchesArray[i].SWITCH_NAME] ? (liveStatsArray[switchesArray[i].SWITCH_NAME]["StatusSince"] ? liveStatsArray[switchesArray[i].SWITCH_NAME]["StatusSince"] : "") : "n/a";
			obj = document.getElementById('dlg_switch_stats_agents');
			if( obj )
				obj.innerText = liveStatsArray[switchesArray[i].SWITCH_NAME] ? (liveStatsArray[switchesArray[i].SWITCH_NAME]["LoggedAgents"] ? liveStatsArray[switchesArray[i].SWITCH_NAME]["LoggedAgents"] : "0") : "0";
			obj = document.getElementById('dlg_switch_statsinbound');
			if( obj )
				obj.innerText = liveStatsArray[switchesArray[i].SWITCH_NAME] ? (liveStatsArray[switchesArray[i].SWITCH_NAME]["TotalInbound"] ? liveStatsArray[switchesArray[i].SWITCH_NAME]["TotalInbound"] : "0") : "0";
			obj = document.getElementById('dlg_switch_stats_outbound');
			if( obj )
				obj.innerText = liveStatsArray[switchesArray[i].SWITCH_NAME] ? (liveStatsArray[switchesArray[i].SWITCH_NAME]["TotalOutbound"] ? liveStatsArray[switchesArray[i].SWITCH_NAME]["TotalOutbound"] : "0") : "0";
			obj = document.getElementById('dlg_switch_stats_used_lines');
			var obj2 = document.getElementById('dlg_switch_stats_remaining_lines');
			if( obj && obj2 ) 
			{
				if( liveStatsArray[switchesArray[i].SWITCH_NAME] )
				{
					var linesUsed = liveStatsArray[switchesArray[i].SWITCH_NAME]["LinesUsed"];
					var linesTotal = switchesArray[i].NUMBER_OF_LINES;
					var linesRem = linesTotal - linesUsed;
					obj.innerText = arch[126]+linesUsed;//'Used. '+linesUsed;
					obj2.innerText 	= arch[127]+linesTotal;//'Total. '+linesTotal;
					var obj3 = document.getElementById('dlg_switch_stats_used_lines_slide');
					var obj4 = document.getElementById('dlg_switch_stats_rem_lines_slide');
					var slide_width;
					if( obj3 )
					{
						if(linesTotal)
						{
							if(linesUsed > linesTotal)
								slide_width = 100;
							else if(linesTotal != 0)
								slide_width = String((linesUsed/linesTotal)*100);
							else
								slide_width = 0;
						}
						else
							slide_width = 0;
						obj3.style.width = slide_width;
					}						
					if( obj4 )
					{
						if(linesTotal)
						{
							if(linesRem < 0)
								slide_width = 0;
							else if(linesTotal != 0)
								slide_width = String((linesRem/linesTotal)*100);
							else
								slide_width = 100;
						}
						else
							slide_width = 0;
						obj4.style.width = slide_width;
					}
				}
			}
			break;
		}
	}
}

function displayEncryptServerCfg(eid)
{
	for(var i = 0; i < ecryptorsArray.length; i++)
	{		
		if(ecryptorsArray[i].unid == eid)
		{
			//
			
			dialogDisplay("DLG_MODIFY_ENCRYPTION_SERVER");
			//fill the form
			var obj = null;
			obj = document.getElementById('modifyEncrSvr_title');
			if( obj ) 
				obj.innerText =arch[128];
			obj = document.getElementById('modifyEncrSvr_SiteLbl');
			if( obj ) 
				obj.innerText = arch[8];
			obj = document.getElementById('modifyEncrSvr_serverNameLbl');
			if( obj ) 
				obj.innerText =arch[22];	
			obj = document.getElementById('modifyEncrSvr_protocolLbl');
			if( obj ) 
				obj.innerText = arch[23];
			obj = document.getElementById('modifyEncrSvr_intnHostLbl');
			if( obj ) 
				obj.innerText = arch[24];
			obj = document.getElementById('modifyEncrSvr_intnPortLbl');
			if( obj ) 
				obj.innerText = arch[25];
			obj = document.getElementById('modifyEncrSvr_ExtHostLbl');
			if( obj ) 
				obj.innerText = arch[26];
			obj = document.getElementById('modifyEncrSvr_ExtPortLbl');
			if( obj ) 
				obj.innerText = arch[27];
			obj = document.getElementById('modifyEncrSvr_saveBtn');
			if( obj ) 
				obj.innerText =arch[19];
			obj = document.getElementById('modifyEncrSvr_DeleteBtn');
			if( obj ) 
				obj.innerText =arch[104];
			
			obj = document.getElementById('dlg_addnewencryption_siteslist');
			var tmpopt = new Option("", "");
			obj.options[ obj.options.length ] = tmpopt;
			for(var j = 0; j < sitesArray.length; j++)
			{
				tmpopt = new Option(sitesArray[j].SITE_NAME, sitesArray[j].DBID);
				obj.options[ obj.options.length ] = tmpopt;
				if(sitesArray[j].DBID == ecryptorsArray[i].SITE_DBID)
				{
					obj.options[ obj.options.length-1 ].selected = true;
				}
			}
			obj = document.getElementById('dlg_addnewencryption_name');
			if( obj )
				obj.value = ecryptorsArray[i].SERVERNAME ;
			obj = document.getElementById('dlg_addnewencryption_protocol');
			if( obj )
				selectObject(obj, ecryptorsArray[i].PROTOCOL, true);
			obj = document.getElementById('dlg_addnewencryption_host');
			if( obj )
				obj.value = ecryptorsArray[i].IPADDRESS ;
			obj = document.getElementById('dlg_addnewencryption_port');
			if( obj )
				obj.value = ecryptorsArray[i].PORT ;
			obj = document.getElementById('dlg_addnewencryption_exthost');
			if( obj )
				obj.value = ecryptorsArray[i].EXT_IPADDRESS ;
			obj = document.getElementById('dlg_addnewencryption_extport');
			if( obj )
				obj.value = ecryptorsArray[i].EXT_PORT ;
			obj = document.getElementById('dlg_addnewencryption_url');
			if( obj )
				obj.value = ecryptorsArray[i].SERVLETURL ;
			break;
		}
	}	
}

function displayRecordServerCfg(rid)
{	
	for(var i = 0; i < recordersArray.length; i++)
	{		
		if(recordersArray[i].unid == rid)
		{
			//
			
			dialogDisplay("DLG_MODIFY_RECORDING");
			//fill the labels
			var obj = null;
			obj = document.getElementById('modifyRecSvr_title');
			if( obj ) 
				obj.innerText = arch[129];
			obj = document.getElementById('modifyRecSvr_SiteLbl');
			if( obj ) 
				obj.innerText =arch[8];
			obj = document.getElementById('modifyRecSvr_NameLbl');
			if( obj ) 
				obj.innerText = arch[9];
			obj = document.getElementById('modifyRecSvr_passwordLbl');
			if( obj ) 
				obj.innerText = arch[10];
			obj = document.getElementById('modifyRecSvr_intnHostLbl');
			if( obj ) 
				obj.innerText = arch[24];
			obj = document.getElementById('modifyRecSvr_intnPortLbl');
			if( obj ) 
				obj.innerText = arch[25];
			obj = document.getElementById('modifyRecSvr_intnSecurePortLbl');
			if( obj ) 
				obj.innerText = arch[29];
			obj = document.getElementById('modifyRecSvr_extHostLbl');
			if( obj ) 
				obj.innerText = arch[26];
			obj = document.getElementById('modifyRecSvr_extPortLbl');
			if( obj ) 
				obj.innerText = arch[27];
			obj = document.getElementById('modifyRecSvr_extSecurePortLbl');
			if( obj ) 
				obj.innerText = arch[30];
			obj = document.getElementById('modifyRecSvr_TomcatMountDirLbl');
			if( obj ) 
				obj.innerText =arch[31];
			obj = document.getElementById('modifyRecSvr_recDirAbsPath_local_lbl');
			if( obj ) 
				obj.innerText = arch[32];
			obj = document.getElementById('modifyRecSvr_recSalesDirLbl');
			if( obj ) 
				obj.innerText =arch[33];
			obj = document.getElementById('modifyRecSvr_recNoSalesDirLbl');
			if( obj ) 
				obj.innerText = arch[34];
			obj = document.getElementById('modifyRecSvr_dailySynchrLbl');
			if( obj ) 
				obj.innerText = arch[35];
			obj = document.getElementById('modifyRecSvr_sendRecToLbl');
			if( obj ) 
				obj.innerText = arch[36];
			obj = document.getElementById('modifyRecSvr_SynchrTimeHHmmLbl');
			if( obj ) 
				obj.innerText = arch[37];
			obj = document.getElementById('modifyRecSvr_agentsLoadBalLbl');
			if( obj ) 
				obj.innerText = arch[16];
			obj = document.getElementById('modifyRecSvr_percentInSiteLbl');
			if( obj ) 
				obj.innerText = arch[38];
			obj = document.getElementById('modifyRecSvr_maxDiskToUseLbl');
			if( obj ) 
				obj.innerText = arch[39];
			obj = document.getElementById('modifyRecSvr_modifyBtn');
			if( obj ) 
				obj.innerText = arch[130];
			obj = document.getElementById('modifyRecSvr_delBtn');
			if( obj ) 
				obj.innerText = arch[104];
				
			
			
			//fill the form
			obj = null;
			obj = document.getElementById('dlg_addnewrecorder_siteslist');
			var tmpopt = new Option("", "");
			obj.options[ obj.options.length ] = tmpopt;
			for(var j = 0; j < sitesArray.length; j++)
			{
				tmpopt = new Option(sitesArray[j].SITE_NAME, sitesArray[j].DBID);
				obj.options[ obj.options.length ] = tmpopt;
				if(sitesArray[j].DBID == recordersArray[i].SITE_DBID)
				{
					obj.options[ obj.options.length-1 ].selected = true;
				}
			}			
			
			obj = document.getElementById('dlg_addnewrecorder_name');
			if( obj )
				obj.value = recordersArray[i].SERVER_NAME ;
			obj = document.getElementById('dlg_addnewrecorder_password');
			if( obj )
				obj.value = recordersArray[i].SERVER_PASSWORD ;
			obj = document.getElementById('dlg_addnewrecorder_host');
			if( obj )
				obj.value = recordersArray[i].HOST ;
			obj = document.getElementById('dlg_addnewrecorder_port');
			if( obj )
				obj.value = recordersArray[i].PORT ;
			obj = document.getElementById('dlg_addnewrecorder_secport');
			if( obj )
				obj.value = recordersArray[i].SEC_PORT ;
			obj = document.getElementById('dlg_addnewrecorder_exthost');
			if( obj )
				obj.value = recordersArray[i].EXTERN_HOST ;
			obj = document.getElementById('dlg_addnewrecorder_extport');
			if( obj )
				obj.value = recordersArray[i].EXTERN_PORT ;
			obj = document.getElementById('dlg_addnewrecorder_extsecport');
			if( obj )
				obj.value = recordersArray[i].EXTERN_SEC_PORT ;
			obj = document.getElementById('dlg_adddlg_addnewrecorder_salesPath');
			if( obj )
				obj.value = recordersArray[i].SALES_PATH ;
			obj = document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath');
			if( obj )
				obj.value = recordersArray[i].NOSALES_PATH ;
			obj = document.getElementById('dlg_adddlg_addnewrecorder_activesync');
			if( obj )
				obj.checked = (recordersArray[i].ALLOW_REC_SYNC == "1") ;
			obj = document.getElementById('dlg_adddlg_addnewrecorder_Path');
			if( obj )
				obj.value = recordersArray[i].RECORDINGS_PATH;
					
				
			//if we have less than two recording servers, disable all the synchronization stuff
			if(recordersArray.length < 1)
			{
				document.getElementById('dlg_adddlg_addnewrecorder_activesync').disabled = true;
				document.getElementById('dlg_addnewrecorder_sendto').disabled = true;
				document.getElementById('dlg_adnewrecorder_synctime').disabled = true;
			}
			else
			{
				var obj2 = 	document.getElementById('dlg_addnewrecorder_sendto');
				var tmpopt = new Option("", "");
				obj2.options[ obj2.options.length ] = tmpopt;
				for(var m = 0; m < recordersArray.length; m++)
				{
					if(recordersArray[m].SERVER_NAME != recordersArray[i].SERVER_NAME)
					{
						tmpopt = new Option(recordersArray[m].SERVER_NAME, recordersArray[m].DBID);
						obj2.options[ obj2.options.length ] = tmpopt;
					}
				}
				
			}
			
			
			obj = document.getElementById('dlg_addnewrecorder_sendto');
			if( obj )
			{
				if(recordersArray[i].ALLOW_REC_SYNC != "1")
				{
					obj.disabled = true;					
				}
				selectObject(obj, recordersArray[i].MASTER_SERVER , true);				
			}
			obj = document.getElementById('dlg_adnewrecorder_synctime');
			if( obj )
			{
				if(recordersArray[i].ALLOW_REC_SYNC != "1")
				{
					obj.disabled = true;					
				}
				obj.value = (recordersArray[i].REC_SYNC_TIME == "0" ? "00:00" : recordersArray[i].REC_SYNC_TIME);
			}
			obj = document.getElementById('dlg_addnewrecorder_agentloadbalance');
			if( obj )
				obj.value = recordersArray[i].LOAD_BALANCE_FOR_AGENTS ;
			obj = document.getElementById('dlg_addnewrecorder_maxdisktouse');
			if( obj )
				obj.value = recordersArray[i].MAX_DISK_TO_USE ;
			obj = document.getElementById('dlg_addnewrecorder_tomcaturl');
			if( obj )
				obj.value = recordersArray[i].TOMCAT_URL ;				
				
			break;
		}
	}	
}


function displayRecordServerLiveStats(servname)
{
	for(var i = 0; i < recordersArray.length; i++)
	{
		if( recordersArray[i].SERVER_NAME == servname )
		{
			dialogDisplay("DLG_RECORDING_STATS"); 
			
			//fill the boxes...	
			var obj = null;
			obj = document.getElementById('recorderSvr_title');
			if( obj ) 
				obj.innerText =arch[131];
			obj = document.getElementById('recorderSvr_serverNameLbl');
			if( obj ) 
				obj.innerText = arch[22];
				
			obj = document.getElementById('recorderSvr_statusLbl');
			if( obj ) 
				obj.innerText = arch[116];
				
			obj = document.getElementById('recorderSvr_SinceLbl');
			if( obj ) 
				obj.innerText = arch[117];
			obj = document.getElementById('recorderSvr_totalRecordingsLbl');if( obj ) 
			if( obj )
				obj.innerText = arch[132];
			obj = document.getElementById('recorderSvr_dailyTotalRecordingsLbl');
			if( obj ) 
				obj.innerText = arch[133];	
			obj = document.getElementById('recorderSvr_diskUsageLbl');
			if( obj ) 
				obj.innerText = arch[134];	
				
			var site_name = '';
			for(var j = 0; j < sitesArray.length; j++)
			{
				if(sitesArray[j].DBID == recordersArray[i].SITE_DBID)
				{
					site_name = sitesArray[j].SITE_NAME;
					break;
				}
			}
			
			//var obj = null;
			obj = document.getElementById('dlg_recordingsserver_stats_name');
			if( obj ) 
				obj.innerText = recordersArray[i].SERVER_NAME+'@'+site_name;
			obj = document.getElementById('dlg_recordingsserver_stats_status');
			if( obj ) 
			{
				var s = 'Unknow';
				obj.style.color = 'black';
				if(liveStatsArray[recordersArray[i].SERVER_NAME])
				{
					if(liveStatsArray[recordersArray[i].SERVER_NAME]["Status"] == 'true')
					{
						s = 'Connected';
						obj.style.color = 'green';
						obj.innerText =arch[107];
					}
					else if(liveStatsArray[recordersArray[i].SERVER_NAME]["Status"] == 'false')
					{
						s = 'Disconnected';
						obj.style.color = 'red';
						obj.innerText =arch[137];
					}
				}
				
			}
			
			obj = document.getElementById('dlg_recordingsserver_stats_statussince');
			if( obj ) 
				obj.innerText = liveStatsArray[recordersArray[i].SERVER_NAME] ? (liveStatsArray[recordersArray[i].SERVER_NAME]["StatusSince"] ? liveStatsArray[recordersArray[i].SERVER_NAME]["StatusSince"] : "") : "n/a";
			obj = document.getElementById('dlg_recordingsserver_stats_total_recordings');
			if( obj ) 
				obj.innerText = liveStatsArray[recordersArray[i].SERVER_NAME] ? (liveStatsArray[recordersArray[i].SERVER_NAME]["TotalRecordings"] ?  liveStatsArray[recordersArray[i].SERVER_NAME]["TotalRecordings"] : "0") : "n/a";
			obj = document.getElementById('dlg_recordingsserver_stats_daily_recordings');
			if( obj ) 
				obj.innerText = liveStatsArray[recordersArray[i].SERVER_NAME] ? (liveStatsArray[recordersArray[i].SERVER_NAME]["TotalRecordingsDaily"] ?  liveStatsArray[recordersArray[i].SERVER_NAME]["TotalRecordingsDaily"] : "0") : "n/a";
			obj = document.getElementById('dlg_recordingsserver_stats_used_disk');
			var obj2 = document.getElementById('dlg_recordingsserver_stats_remaining_disk');
			if( obj && obj2 ) 
			{
				if( liveStatsArray[recordersArray[i].SERVER_NAME] )
				{
					var diskTotal 	= Math.round((parseFloat( liveStatsArray[recordersArray[i].SERVER_NAME]["DiskTotalSpace"] )/1024/1024)*100)/100;
					var diskRem 	= Math.round((parseFloat( liveStatsArray[recordersArray[i].SERVER_NAME]["DiskTotalRemainingSpace"] )/1024/1024)*100)/100;
					var diskUsed 	= Math.round((diskTotal-diskRem)*100)/100;
					obj.innerText 	= arch[126]+diskUsed+' '+arch[136];// 'Used. '+diskUsed+' Go';
					obj2.innerText 	= arch[135]+diskRem+' '+arch[136];//'Rem. '+diskRem+' Go';
					var obj3 = document.getElementById('dlg_recordingsserver_stats_used_disk_slide');
					var obj4 = document.getElementById('dlg_recordingsserver_stats_used_rem_slide');
					if( obj3 )
						obj3.style.width = diskTotal ? String((diskUsed/diskTotal)*100) : 0;
					if( obj4 )
						obj4.style.width = diskTotal ? String((diskRem/diskTotal)*100) : 0;
				}
			}
			break;
		}		
	}	
}


function saveLayout()
{
	var saveStr = '';
	/* add other settings */
	saveStr += '<Visual grid="'+((diagramobj.style.backgroundImage=='none') ? 'false' : 'true')+'" />';
	for(var i = 0; i < dd.elements.length; i++)
	{
		if( dd.elements[i].containerobj != null && dd.elements[i].containertype != null)
		{	//this is a real object that we should backup
			var theobject = dd.elements[i];
			saveStr += getElementLayout( theobject );	
		}		
	}
	appletObj.saveNetWorkLayout(saveStr);
}

function getElementLayout(theobject, parentforce)
{
	var sret = '';
	if(theobject)
	{
		
			sret += '<DiagramElement type="'+theobject.containertype+'">';
			sret += '<dbid value="'+(theobject.containerobj ? theobject.containerobj.DBID: "" )+'" />';
			sret += '<name value="'+theobject.name+'" />';
			sret += '<h value="'+theobject.h+'" />';
			sret += '<w value="'+theobject.w+'" />';
			sret += '<x value="'+theobject.x+'" />';
			sret += '<y value="'+theobject.y+'" />';
			sret += '<z value="'+theobject.z+'" />';
			
			//now, include the children
			/*
			sret += '<children>';
			for(var i = 0; i < theobject.children.length; i++)
			{
				sret += getElementLayout(theobject.children[i], true);				
			}
			sret += '</children>';
			*/
			sret += '</DiagramElement>';
		
	}
	return sret;
}
/***
	Updaters and handlers asked for commapplet
***/
function handleSwitchStats(statistics)
{
	if(statistics.length > 0)
	{
		var xmlDoc = loadXML(statistics);
		if(xmlDoc != null)
		{
			var PbxServerList = xmlDoc.getElementsByTagName('PbxServer');
			for(var i = 0; i < PbxServerList.length; i++)
			{
				var curPbxServer = PbxServerList[i];
				var switch_name = getXmlValue(curPbxServer, "Name");
				
				var curPbxServerStats = getXmlChildByName(curPbxServer, "ServerStats");
				var switch_status = getXmlValue(curPbxServerStats, "Connected");
				var switch_agents = getXmlValue(curPbxServerStats, "NbAgentConnected");
				var switch_outbound = getXmlValue(curPbxServerStats, "NbOutboundCalls");
				var switch_inbound = getXmlValue(curPbxServerStats, "NbInboundCalls");
				var switch_connected_since  = getXmlValue(curPbxServerStats, "ConnectedSince");
				var switch_lines_used = getXmlValue(curPbxServerStats, "NbLinesUsed");

				if( !liveStatsArray[switch_name] )
					liveStatsArray[switch_name] = new Array();
				liveStatsArray[switch_name]["Status"]		 = switch_status;
				liveStatsArray[switch_name]["StatusSince"]	 = buildReadableDatetime(switch_connected_since); 
				liveStatsArray[switch_name]["LoggedAgents"]	 = switch_agents;
				liveStatsArray[switch_name]["TotalInbound"]	 = switch_inbound;
				liveStatsArray[switch_name]["TotalOutbound"] = switch_outbound;
				liveStatsArray[switch_name]["LinesUsed"]	 = switch_lines_used;

				//fill informations if already open
				//live images
				var objimg = document.getElementById('switchstatus_image_'+switch_name);			
				if( objimg )
				{
					objimg.src = '../img/hum.gif';
					if( liveStatsArray[switch_name]["Status"] ==  'true')
						objimg.src = '../img/ok.gif';
					else if( liveStatsArray[switch_name]["Status"] ==  'false')
						objimg.src = '../img/off.gif';
				}

				var obj = null;
				obj = document.getElementById('dlg_switch_stats_name');
				if( obj )
				{
					if( obj.innerText.indexOf(switch_name) == 0 )
					{
						obj = document.getElementById('dlg_switch_stats_status');
						if( obj )
						{
							var s = 'Unknow';
							obj.style.color = 'black';

							if(liveStatsArray[switch_name])
							{
								if(liveStatsArray[switch_name]["Status"] == 'true')
								{
									s = 'Connected';
									obj.style.color = 'green';	
									obj.innerText = arch[107] ;								
								}
								else if(liveStatsArray[switch_name]["Status"] == 'false')
								{
									s = 'Disconnected';
									obj.style.color = 'red';
									obj.innerText = arch[137] ;															
								}
							}
							
						}
						obj = document.getElementById('dlg_switch_stats_statussince');
						if( obj )
							obj.innerText = liveStatsArray[switch_name] ? (liveStatsArray[switch_name]["StatusSince"] ? liveStatsArray[switch_name]["StatusSince"] : "") : "n/a";
						obj = document.getElementById('dlg_switch_stats_agents');
						if( obj )
							obj.innerText = liveStatsArray[switch_name] ? (liveStatsArray[switch_name]["LoggedAgents"] ? liveStatsArray[switch_name]["LoggedAgents"] : "0") : "0";
						obj = document.getElementById('dlg_switch_statsinbound');
						if( obj )
							obj.innerText = liveStatsArray[switch_name] ? (liveStatsArray[switch_name]["TotalInbound"] ? liveStatsArray[switch_name]["TotalInbound"] : "0") : "0";
						obj = document.getElementById('dlg_switch_stats_outbound');
						if( obj )
							obj.innerText = liveStatsArray[switch_name] ? (liveStatsArray[switch_name]["TotalOutbound"] ? liveStatsArray[switch_name]["TotalOutbound"] : "0") : "0";
						obj = document.getElementById('dlg_switch_stats_used_lines');
						var obj2 = document.getElementById('dlg_switch_stats_remaining_lines');
						if( obj && obj2 ) 
						{
							if( liveStatsArray[switch_name] )
							{
								var cur_switch = null;
								for(var i = 0; i < 	switchesArray.length; i++)
								{
									if( switchesArray[i].SWITCH_NAME == switch_name)
									{
										cur_switch = switchesArray[i];
										break;
									}
								}
								if(cur_switch)
								{
									var linesUsed = liveStatsArray[switch_name]["LinesUsed"];
									var linesTotal = cur_switch.NUMBER_OF_LINES;
									var linesRem = linesTotal - linesUsed;
									obj.innerText 	= arch[126]+linesUsed;//obj.innerText 	= 'Used. '+linesUsed;good up to here
									obj2.innerText 	= arch[127]+linesTotal;//obj2.innerText 	= 'Total. '+linesTotal;
									var obj3 = document.getElementById('dlg_switch_stats_used_lines_slide');
									var obj4 = document.getElementById('dlg_switch_stats_rem_lines_slide');
									var slide_width;
									if( obj3 )
									{
										if(linesTotal)
										{
											if(linesUsed > linesTotal)
												slide_width = 100;
											else if(linesTotal != 0)
												slide_width = String((linesUsed/linesTotal)*100);
											else
												slide_width = 0;
										}
										else
											slide_width = 0;
										obj3.style.width = slide_width;
									}						
									if( obj4 )
									{
										if(linesTotal)
										{
											if(linesRem < 0)
												slide_width = 0;
											else if(linesTotal != 0)
												slide_width = String((linesRem/linesTotal)*100);
											else
												slide_width = 100;
										}
										else
											slide_width = 0;
										obj4.style.width = slide_width;
									}
								}
							}
						}
					}
				}
			}
		}
	}	
}

function handleCtiServerStats(xmlStr)
{
	if( xmlStr.length > 0)
	{
		var rootNode = Xparse(xmlStr);
		if( rootNode.name == 'ROOT' )
		{
			for(var i = 0;  i < rootNode.contents.length; i++)
			{
				var curnode = rootNode.contents[i];					
				
				for(var j = 0; j < curnode.contents.length; j++)
				{
					var curnode2 = curnode.contents[j];
					if( !liveStatsArray["CTI_SERVER_STATS"] ) 
						liveStatsArray["CTI_SERVER_STATS"] = new Array();
					if( !liveStatsArray["CTI_SERVER_STATS"][curnode.name] )
						liveStatsArray["CTI_SERVER_STATS"][curnode.name] = new Array();
					if( !liveStatsArray["CTI_SERVER_STATS"][curnode.name][curnode2.name] )
						liveStatsArray["CTI_SERVER_STATS"][curnode.name][curnode2.name] = new Array();
					
					liveStatsArray["CTI_SERVER_STATS"][curnode.name][curnode2.name] = (curnode2.contents[0] ? curnode2.contents[0].value : "");
				}
			}			
		}

		//fill the boxes...	
		var obj = null;
		obj = document.getElementById('dlg_ctistats_managers_confs');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Managers"]["Configured"];
		obj = document.getElementById('dlg_ctistats_managers_connected');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Managers"]["Connected"];
		obj = document.getElementById('dlg_ctistats_agents_confs');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Agents"]["Configured"];
		obj = document.getElementById('dlg_ctistats_agents_connected');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Agents"]["Connected"];
		obj = document.getElementById('dlg_ctistats_switches_confs');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Switches"]["Configured"];
		obj = document.getElementById('dlg_ctistats_switches_connected');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["Switches"]["Connected"];
		obj = document.getElementById('dlg_ctistats_recorders_confs');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["RecordingServers"]["Configured"];
		obj = document.getElementById('dlg_ctistats_recorders_connected');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["RecordingServers"]["Connected"];
		obj = document.getElementById('dlg_ctistats_encryptors_confs');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["EncryptionServers"]["Configured"];
		obj = document.getElementById('dlg_ctistats_encryptors_connected');
		if( obj )
			obj.innerText = liveStatsArray["CTI_SERVER_STATS"]["EncryptionServers"]["Connected"];
	}
}

function handleRecordingsServersStats(data)
{
	if(data.length > 0)
	{
		var recordServAr = data.split("|");
		for(var i = 0 ; i < recordServAr.length; i++)
		{
			var thisrecordserverAr = recordServAr[i].split("^");
			var thisServName = thisrecordserverAr[0];
			var thisServIsConnected = thisrecordserverAr[1];
			var thisServTotalDisk = thisrecordserverAr[2];
			var thisServDiskRemaining = thisrecordserverAr[3];
			var thisServNTotalToday = thisrecordserverAr[4];
			var thisServNTotal = thisrecordserverAr[5];
			var thisServConnectSince = thisrecordserverAr[6];
			
			var objimg = document.getElementById('recordserverstatus_image_'+thisServName);			
			if( objimg )
			{
				objimg.src = '../img/hum.gif';
				if( thisServIsConnected ==  'true')
					objimg.src = '../img/ok.gif';
				else if( thisServIsConnected ==  'false')
					objimg.src = '../img/off.gif';
			}
			
			if( !liveStatsArray[thisServName] )
				liveStatsArray[thisServName] = new Array();
			liveStatsArray[thisServName]["Status"] 					= thisServIsConnected;
			liveStatsArray[thisServName]["StatusSince"] 			= buildReadableDatetime(thisServConnectSince);
			liveStatsArray[thisServName]["TotalRecordings"] 		= thisServNTotal;
			liveStatsArray[thisServName]["TotalRecordingsDaily"]	= thisServNTotalToday;
			liveStatsArray[thisServName]["DiskTotalSpace"] 			= thisServTotalDisk;
			liveStatsArray[thisServName]["DiskTotalRemainingSpace"] = thisServDiskRemaining;

			var obj = null;
			obj = document.getElementById('dlg_recordingsserver_stats_name');
			if( obj )
			{
				if( obj.innerText.indexOf(thisServName) == 0 )
				{			
					obj = document.getElementById('dlg_recordingsserver_stats_status');
					if( obj ) 
					{
						var s = 'Unknow';
						obj.style.color = 'black';
						if(liveStatsArray[thisServName])
						{
							if(liveStatsArray[thisServName]["Status"] == 'true')
							{
								s = 'Connected';
								obj.style.color = 'green';
								obj.innerText =arch[107];
							}
							else if(liveStatsArray[thisServName]["Status"] == 'false')
							{
								s = 'Disconnected';
								obj.style.color = 'red';
								obj.innerText =arch[137];
							}
						}
						
					}
					
					obj = document.getElementById('dlg_recordingsserver_stats_statussince');
					if( obj ) 
						obj.innerText = liveStatsArray[thisServName] ? (liveStatsArray[thisServName]["StatusSince"] ? liveStatsArray[thisServName]["StatusSince"] : "") : "n/a";
					obj = document.getElementById('dlg_recordingsserver_stats_total_recordings');
					if( obj ) 
						obj.innerText = liveStatsArray[thisServName] ? (liveStatsArray[thisServName]["TotalRecordings"] ?  liveStatsArray[thisServName]["TotalRecordings"] : "0") : "n/a";
					obj = document.getElementById('dlg_recordingsserver_stats_daily_recordings');
					if( obj ) 
						obj.innerText = liveStatsArray[thisServName] ? (liveStatsArray[thisServName]["TotalRecordingsDaily"] ?  liveStatsArray[thisServName]["TotalRecordingsDaily"] : "0") : "n/a";
					obj = document.getElementById('dlg_recordingsserver_stats_used_disk');
					var obj2 = document.getElementById('dlg_recordingsserver_stats_remaining_disk');
					if( obj && obj2 ) 
					{
						if( liveStatsArray[thisServName] )
						{
							var diskTotal 	= Math.round((parseFloat( liveStatsArray[thisServName]["DiskTotalSpace"] )/1024/1024)*100)/100;
							var diskRem 	= Math.round(parseFloat( liveStatsArray[thisServName]["DiskTotalRemainingSpace"] )/1024/1024*100)/100;
							var diskUsed 	= Math.round((diskTotal-diskRem)*100)/100;
							obj.innerText 	= arch[126]+diskUsed+' '+arch[136];// 'Used. '+diskUsed+' Go';
							obj2.innerText 	= arch[135]+diskRem+' '+arch[136];//'Rem. '+diskRem+' Go';
												
						}
					}
				}
			}
				
		}
	}
}

function handleGetAllSites() //new sites received...
{	
	//look for new sites and add the brand new one.
	var sitesStr = String( appletObj.getAllSites() );
	var sitesStrAr =  sitesStr.split("|");
        // alert("list of site received : " + sitesStr);
	
	if(sitesStr.length > 0)
	{
		var hasbeendeletedIndexvector 	= new Array(sitesArray.length);
		for(var i = 0; i < hasbeendeletedIndexvector.length; i++) //fill the vector with something
			hasbeendeletedIndexvector[i] = 1;
		
		for(var i = 0; i < sitesStrAr.length; i++)
		{		
			var thissiteElt = sitesStrAr[i].split("^");
			var sitedbid = thissiteElt[0];
			var sitename = thissiteElt[1];
            var siteInternalIaxCodec = thissiteElt[2];
			var siteExternalIaxCodec = thissiteElt[3];
			var siteProxyHost = thissiteElt[4];
			var siteProxyPort = thissiteElt[5];
			var alreadyexist = false;
			var justnamechanged = false;
			var foundedat = null;
			
			//we will need to determine if the (sitedbid, sitename) already exist (nochange) or had just his name changed
			for(var j = 0; j < sitesArray.length; j++)	//already exist sites...
			{
				if(sitedbid == sitesArray[j].DBID && sitename == sitesArray[j].SITE_NAME) //the same dbid and the same name
				{
					alreadyexist = true;
					foundedat = j;
					hasbeendeletedIndexvector[j] = 0; //mark this as not deleted
					break;
				}
				else if(sitedbid == sitesArray[j].DBID) //the dbid remains the same but not the name
				{
					alreadyexist = true;
					justnamechanged = true;
					foundedat = j;
					hasbeendeletedIndexvector[j] = 0; //mark this as not deleted
					break;
				}
			}
			
			
			if( !alreadyexist ) //didn't exist before, create a brand new one
			{
				var tmpobj = new siteObj(nbSites);
				nbSites++;
				tmpobj.DBID			= sitedbid;
				tmpobj.SITE_NAME	= sitename;
                tmpobj.SITE_INTCODEC	= siteInternalIaxCodec;
				tmpobj.SITE_EXTCODEC	= siteExternalIaxCodec;
				tmpobj.SITE_PROXY_HOST = siteProxyHost ;
				tmpobj.SITE_PROXY_PORT = siteProxyPort ;
				tmpobj.xpos 		= 50;
				tmpobj.ypos 		= 60;
				tmpobj.width 		= 300;
				tmpobj.heigth 		= 200;
				tmpobj.color		= "#330066";
				var adiv = findAndReserveDivPool();
				ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);
				dd.elements[adiv.getdivid()].write(tmpobj.draw());
				tmpobj.divPoolid = adiv.getdivid();
				//setup the new prototype properties
				dd.elements[adiv.getdivid()].containertype 	= "siteObj"; 
				dd.elements[adiv.getdivid()].containerobj	= tmpobj;
				dd.elements[adiv.getdivid()].moveTo(tmpobj.xpos, tmpobj.ypos);
				dd.elements[adiv.getdivid()].show();
				hasbeendeletedIndexvector[sitesArray.length]  = 0; //mark the brand new one as not deleted of course
				sitesArray.push(tmpobj);
				
				//add the link
				
				
			}
			else if( justnamechanged ) //just the name changed... update informations
			{
				sitesArray[	foundedat ].SITE_NAME = sitename;
				dd.elements[(sitesArray[foundedat].divPoolid)].write(sitesArray[foundedat].draw()); //display the new informations
				dd.elements[(sitesArray[foundedat].divPoolid)].containerobj	= sitesArray[foundedat];			
			}
		}
				
		//Search for those you have been deleted ... look inside the hasbeendeletedIndexvector for non null indexes
		var nSitesArray = new Array();		
		for(var i = 0; i < hasbeendeletedIndexvector.length; i++)
		{			
			if( hasbeendeletedIndexvector[i] == 1 ) //this one at i has been deleted
			{  //site deleting procedure
				releaseDivPool(sitesArray[i].divPoolid);
				/*
				delete sitesArray[i];
				sitesArray[i] = null;	
				*/
			}
			else //keep this one
			{
				nSitesArray.push( sitesArray[i] );
			}
		}
		sitesArray = nSitesArray;		
	}
	else //empty switch string... no switches, delete all we had in the map
	{
		while(sitesArray.length > 0)	//start from behind
		{
			releaseDivPool(sitesArray[(sitesArray.length-1)].divPoolid);
			delete sitesArray[(sitesArray.length-1)];
			sitesArray[(sitesArray.length-1)] = null;
			sitesArray.length--;						
		}
	}
	
	//hide the wait for site creation display if we had one...
	hidePleaseWaitDlg("WAIT_FOR_SITE_CREATION");
	hidePleaseWaitDlg("WAIT_FOR_SITE_MODIFICATION");
	hidePleaseWaitDlg("WAIT_FOR_SITE_DESTRUCTION");
}

function handleGetAllSwitches()
{
	var do_delayed_save_layout = false;
	//rebuild the switches ...
	var rswitchStr = String( appletObj.getAsteriskSwitchs() );
	
	
	var hasbeendeleted = new Array(switchesArray.length);
	for(var i = 0; i < switchesArray.length; i++)	//make all this as they were deleted
		hasbeendeleted[i] = true;
		
	if(rswitchStr.length > 0)
	{
		var rswitchAr = rswitchStr.split("|");
		for(var i = 0; i < rswitchAr.length; i++)
		{
			//for each received switch
			var newcreated 		= true;
			var rthisSwitchAr 	= rswitchAr[i].split(",");
			var this_dbid 		= rthisSwitchAr[0];
			var this_name 		= rthisSwitchAr[1];
			var this_password 	= rthisSwitchAr[2];
			var this_sitedbid 	= rthisSwitchAr[3];
			var this_loadagents = rthisSwitchAr[4];
			var this_outbound 	= rthisSwitchAr[5];
			var this_host 		= rthisSwitchAr[6];
			var this_port 		= rthisSwitchAr[7];
			var this_exthost 	= rthisSwitchAr[8];
			var this_extport 	= rthisSwitchAr[9];
			var this_number_of_lines = rthisSwitchAr[10];

			var foundat = null;
			for(var j = 0; j < switchesArray.length; j++)
			{
				if(switchesArray[j].DBID == this_dbid && switchesArray[j].SWITCH_NAME == this_name)
				{
					newcreated = false;
					foundat = j;
					hasbeendeleted[j] = false;
					break;
				}
			}

			if( newcreated ) //add the brand new switch to the list
			{
				var tmpobj = new pbxServerObj(nbSwitchs);
				nbSwitchs++;
				tmpobj.DBID						= this_dbid;
				tmpobj.SWITCH_NAME				= this_name;
				tmpobj.SWITCH_PASSWORD			= this_password;
				tmpobj.HOST						= this_host;
				tmpobj.PORT						= this_port;
				tmpobj.EXTERN_HOST				= this_exthost;
				tmpobj.EXTERN_PORT				= this_extport;
				tmpobj.LOAD_BALANCE_FOR_AGENTS	= this_loadagents;
				tmpobj.LOAD_BALANCE_FOR_OUTBOUND= this_outbound;
				tmpobj.SITE_DBID				= this_sitedbid;
				tmpobj.SWITCH_TYPE				= "Asterisk"; //if ever we have another type of switch, change this value and get it from database
				tmpobj.NUMBER_OF_LINES			= this_number_of_lines;

				var attached_site = null;
				//append this div to the site that it his parent				
				for(var st = 0; st < sitesArray.length; st++)
				{					
					if(sitesArray[st].DBID  == tmpobj.SITE_DBID)
					{						
						attached_site = st; //dd.elements[ (sitesArray[st].divPoolid) ].addChild( adiv.getdivid() );//dd.elements[adiv.getdivid()] );
						break;
					}
				}
				tmpobj.xpos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].x + 0;
				tmpobj.ypos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].y + 10;
				tmpobj.width 		= 300;
				tmpobj.heigth 		= 80;
				tmpobj.color		= "#330066";
				var adiv = findAndReserveDivPool();
				ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);
				dd.elements[adiv.getdivid()].write(tmpobj.draw());
				tmpobj.divPoolid = adiv.getdivid();
				//setup the new prototype properties
				dd.elements[adiv.getdivid()].containertype 	= "pbxServerObj"; 
				dd.elements[adiv.getdivid()].containerobj	= tmpobj;
				dd.elements[adiv.getdivid()].moveTo(tmpobj.xpos, tmpobj.ypos);
				dd.elements[adiv.getdivid()].show();
				hasbeendeleted[switchesArray.length] = false;
				switchesArray.push(tmpobj);			

				//add as site child...
				dd.elements[ (sitesArray[attached_site].divPoolid) ].addChild( adiv.getdivid() );
			}
			else if(foundat != null) //we have founded one... so, it is a modification
			{
				if( switchesArray[foundat].SITE_DBID != this_sitedbid )
				{
					var attached_site = null;
					//append this div to the site that it his parent				
					for(var st = 0; st < sitesArray.length; st++)
					{					
						if(sitesArray[st].DBID  == this_sitedbid)
						{						
							attached_site = st; //dd.elements[ (sitesArray[st].divPoolid) ].addChild( adiv.getdivid() );//dd.elements[adiv.getdivid()] );
							break;
						}
					}
					
					//attached_site is the new site
					if(attached_site != null)
					{	//update this switch informations and move it to new site
						switchesArray[foundat].xpos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].x + 0;
						switchesArray[foundat].ypos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].y + 10;
						switchesArray[foundat].width 		= 300;
						switchesArray[foundat].heigth 		= 80;
						switchesArray[foundat].color		= "#330066";
						dd.elements[switchesArray[foundat].divPoolid].moveTo(switchesArray[foundat].xpos, switchesArray[foundat].ypos);
						
						//add as site child...
						dd.elements[ (sitesArray[attached_site].divPoolid) ].addChild( switchesArray[foundat].divPoolid );
						/* element was moved, force an layout save */
						do_delayed_save_layout = true;
					}
					
					
					
					
				}
				switchesArray[foundat].DBID				= this_dbid;
				switchesArray[foundat].SWITCH_NAME		= this_name;
				switchesArray[foundat].SWITCH_PASSWORD	= this_password;
				switchesArray[foundat].HOST				= this_host;
				switchesArray[foundat].PORT				= this_port;
				switchesArray[foundat].EXTERN_HOST		= this_exthost;
				switchesArray[foundat].EXTERN_PORT		= this_extport;
				switchesArray[foundat].LOAD_BALANCE_FOR_AGENTS		= this_loadagents;
				switchesArray[foundat].LOAD_BALANCE_FOR_OUTBOUND	= this_outbound;
				switchesArray[foundat].SITE_DBID		= this_sitedbid;
				switchesArray[foundat].SWITCH_TYPE						= "Asterisk"; //if ever we have another type of switch, change this value and get it from database
				switchesArray[foundat].NUMBER_OF_LINES	= this_number_of_lines;

				//display the div again... //no need.. the name is never change			
			}
		}
	}
	var nswitchesArray = new Array();
	for(var i = 0; i < hasbeendeleted.length; i++)
	{
		if( !hasbeendeleted[i] ) //the number i has been deleted
			nswitchesArray.push( switchesArray[i] );
		else
			releaseDivPool(switchesArray[i].divPoolid);
	}
	switchesArray = nswitchesArray;

	hidePleaseWaitDlg("WAIT_FOR_SWITCH_CREATION");
	hidePleaseWaitDlg("WAIT_FOR_SWITCH_MODIFICATION");
	hidePleaseWaitDlg("WAIT_FOR_SWITCH_DELETING");
	
	if(do_delayed_save_layout)
		setTimeout('saveLayout()', 200);		
}

function handleGetAllEncServers()
{
	var do_delayed_save_layout = false;
	//rebuild the switches ...
	var rencryptionStr = String( appletObj.getAllEncServers() );
	

	var hasbeendeleted = new Array(ecryptorsArray.length);
	for(var i = 0; i < ecryptorsArray.length; i++)	//make all this as they were deleted
		hasbeendeleted[i] = true;
		

	if(rencryptionStr.length > 0)
	{
		var rencryptionAr = rencryptionStr.split("|");
		for(var i = 0; i < rencryptionAr.length; i++)
		{

			//for each received switch
			var newcreated 		= true;
			var rthisEncryptorAr 	= rencryptionAr[i].split(",");
			var this_dbid 		= rthisEncryptorAr[0];
			var this_host 		= rthisEncryptorAr[1];
			var this_port	 	= rthisEncryptorAr[2];
			var this_sitedbid 	= rthisEncryptorAr[3];
			var this_name		= rthisEncryptorAr[4];
			var this_url	 	= rthisEncryptorAr[5];
			var this_protocol	= rthisEncryptorAr[6];
			var this_extip		= rthisEncryptorAr[7];
			var this_extport 	= rthisEncryptorAr[8];
			
			var foundat = null;

			for(var j = 0; j < ecryptorsArray.length; j++)
			{
				if(ecryptorsArray[j].DBID == this_dbid)
				{
					newcreated = false;
					foundat = j;
					hasbeendeleted[j] = false;
					break;
				}
			}	
			

			if( newcreated ) //add the brand new switch to the list
			{

				var tmpobj = new encServerObj(nbEncyptors);
				nbEncyptors++;
				tmpobj.DBID						= this_dbid;
				tmpobj.SERVERNAME				= this_name;
				tmpobj.IPADDRESS				= this_host;
				tmpobj.PORT						= this_port;
				tmpobj.SITE_DBID				= this_sitedbid;
				tmpobj.SERVLETURL				= this_url;
				tmpobj.PROTOCOL					= this_protocol;
				tmpobj.EXT_IPADDRESS			= this_extip;
				tmpobj.EXT_PORT					= this_extport;

				var attached_site = null;
				//append this div to the site that it his parent				
				for(var st = 0; st < sitesArray.length; st++)
				{					
					if(sitesArray[st].DBID  == tmpobj.SITE_DBID)
					{						
						attached_site = st; //dd.elements[ (sitesArray[st].divPoolid) ].addChild( adiv.getdivid() );//dd.elements[adiv.getdivid()] );
						break;
					}
				}
				tmpobj.xpos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].x + 0;
				tmpobj.ypos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].y + 10;
				tmpobj.width 		= 300;
				tmpobj.heigth 		= 80;
				tmpobj.color		= "#330066";
				var adiv = findAndReserveDivPool();
				ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);

				dd.elements[adiv.getdivid()].write(tmpobj.draw());

				tmpobj.divPoolid = adiv.getdivid();
				//setup the new prototype properties
				dd.elements[adiv.getdivid()].containertype 	= "encServerObj"; 
				dd.elements[adiv.getdivid()].containerobj	= tmpobj;
				dd.elements[adiv.getdivid()].moveTo(tmpobj.xpos, tmpobj.ypos);
				dd.elements[adiv.getdivid()].show();
				hasbeendeleted[ecryptorsArray.length] = false;
				ecryptorsArray.push(tmpobj);
				

				//add as site child...
				dd.elements[ (sitesArray[attached_site].divPoolid) ].addChild( adiv.getdivid() );
			}
			else if(foundat != null) //we have founded one... so, it is a modification
			{
				if( ecryptorsArray[foundat].SITE_DBID != this_sitedbid )
				{
					var attached_site = null;
					//append this div to the site that it his parent				
					for(var st = 0; st < ecryptorsArray.length; st++)
					{					
						if(ecryptorsArray[st].DBID  == this_sitedbid)
						{						
							attached_site = st; //dd.elements[ (sitesArray[st].divPoolid) ].addChild( adiv.getdivid() );//dd.elements[adiv.getdivid()] );
							break;
						}
					}
					
					//attached_site is the new site
					if(attached_site != null)
					{	//update this switch informations and move it to new site
						ecryptorsArray[foundat].xpos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].x + 0;
						ecryptorsArray[foundat].ypos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].y + 10;
						ecryptorsArray[foundat].width 		= 300;
						ecryptorsArray[foundat].heigth 		= 80;
						ecryptorsArray[foundat].color		= "#330066";
						dd.elements[ecryptorsArray[foundat].divPoolid].moveTo(ecryptorsArray[foundat].xpos, ecryptorsArray[foundat].ypos);
						//add as site child...
						dd.elements[ (sitesArray[attached_site].divPoolid) ].addChild( ecryptorsArray[foundat].divPoolid );
						
						/* element was moved, force an layout save */
						do_delayed_save_layout = true;
					}
				}
				
				ecryptorsArray[foundat].DBID			= this_dbid;
				ecryptorsArray[foundat].SERVERNAME		= this_name;
				ecryptorsArray[foundat].IPADDRESS		= this_host;
				ecryptorsArray[foundat].PORT			= this_port;
				ecryptorsArray[foundat].SITE_DBID		= this_sitedbid;
				ecryptorsArray[foundat].SERVLETURL		= this_url;
				ecryptorsArray[foundat].PROTOCOL		= this_protocol;
				ecryptorsArray[foundat].EXT_IPADDRESS	= this_extip;
				ecryptorsArray[foundat].EXT_PORT		= this_extport;

				//display the div again... //no need.. the name is never change			
			}
		}	
	}
	var necryArray = new Array();
	for(var i = 0; i < hasbeendeleted.length; i++)
	{
		if( !hasbeendeleted[i] ) //the number i has been deleted
			necryArray.push( ecryptorsArray[i] );
		else
			releaseDivPool(ecryptorsArray[i].divPoolid);
	}
	ecryptorsArray = necryArray;	
	hidePleaseWaitDlg("WAIT_FOR_ENCRYPTION_CREATION");
	hidePleaseWaitDlg("WAIT_FOR_ENCRYPTION_MODIFICATION");
	hidePleaseWaitDlg("WAIT_FOR_ENCRYPTION_DELETING");
	
	if(do_delayed_save_layout)
		setTimeout('saveLayout()', 200);
}

function handleGetAllRecordingsServers()
{
	var do_delayed_save_layout = false;
	//rebuild the switches ...
	var rrecordingStr = String( appletObj.getAllRecordingServers() );
	
 
	var hasbeendeleted = new Array(recordersArray.length);
	for(var i = 0; i < recordersArray.length; i++)	//make all this as they were deleted
		hasbeendeleted[i] = true;
	
	if(rrecordingStr.length > 0)
	{
		var rrecordingAr = rrecordingStr.split("|");
		for(var i = 0; i < rrecordingAr.length; i++)
		{
			//for each received switch
			var newcreated 		= true;
			var rthisRecorderAr = rrecordingAr[i].split("^");
			var this_dbid 		= rthisRecorderAr[0];
			var this_name 		= rthisRecorderAr[1];
			var this_password 	= rthisRecorderAr[2];
			var this_host	 	= rthisRecorderAr[3];
			var this_port		= rthisRecorderAr[4];
			var this_secport 	= rthisRecorderAr[5];
			var this_exthost	= rthisRecorderAr[6];
			var this_extport	= rthisRecorderAr[7];
			var this_extsecport	= rthisRecorderAr[8];
			var this_sellpath 	= rthisRecorderAr[9];
			var this_nosellpath	= rthisRecorderAr[10];
			var this_sitedbid 	= rthisRecorderAr[11];
			var this_recsynctime= rthisRecorderAr[12];
			var this_masterserv	= rthisRecorderAr[13];
			var this_loadAgents	= rthisRecorderAr[14];
			var this_allowrec 	= rthisRecorderAr[15];
			var this_recmaxallow = rthisRecorderAr[16];
			var this_tomcaturl  = rthisRecorderAr[17];
			var this_recordingspath = rthisRecorderAr[18];
			
			var foundat = null;

			for(var j = 0; j < recordersArray.length; j++)
			{
				if(recordersArray[j].DBID == this_dbid)
				{
					newcreated = false;
					foundat = j;
					hasbeendeleted[j] = false;
					break;
				}
			}

			if( newcreated ) //add the brand new record Server to the list
			{
				var tmpobj = new recordingServer(nbRecorders);
				nbRecorders++;
				tmpobj.DBID						= this_dbid;
				tmpobj.SERVER_NAME				= this_name;
				tmpobj.SERVER_PASSWORD			= this_password;
				tmpobj.HOST						= this_host;
				tmpobj.PORT						= this_port;
				tmpobj.SEC_PORT					= this_secport;
				tmpobj.EXTERN_HOST				= this_exthost;
				tmpobj.EXTERN_PORT				= this_extport;
				tmpobj.EXTERN_SEC_PORT			= this_extsecport;
				tmpobj.SALES_PATH				= this_sellpath;
				tmpobj.NOSALES_PATH				= this_nosellpath;
				tmpobj.SITE_DBID				= this_sitedbid;
				tmpobj.REC_SYNC_TIME			= this_recsynctime;
				tmpobj.MASTER_SERVER			= this_masterserv;
				tmpobj.LOAD_BALANCE_FOR_AGENTS	= this_loadAgents;
				tmpobj.ALLOW_REC_SYNC			= this_allowrec;
				tmpobj.MAX_DISK_TO_USE			= this_recmaxallow;
				tmpobj.TOMCAT_URL				= this_tomcaturl;
				tmpobj.RECORDINGS_PATH			= this_recordingspath;
				
				var attached_site = null;

				//append this div to the site that it his parent				
				for(var st = 0; st < sitesArray.length; st++)
				{			
					if(sitesArray[st].DBID  == tmpobj.SITE_DBID)
					{						
						attached_site = st; //dd.elements[ (sitesArray[st].divPoolid) ].addChild( adiv.getdivid() );//dd.elements[adiv.getdivid()] );
						break;
					}
				}

				tmpobj.xpos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].x + 0;
				tmpobj.ypos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].y + 10;
				tmpobj.width 		= 300;
				tmpobj.heigth 		= 80;
				tmpobj.color		= "#330066";
				var adiv = findAndReserveDivPool();
				ADD_DHTML(adiv.getdivid()+TRANSPARENT+CURSOR_MOVE);
				dd.elements[adiv.getdivid()].write(tmpobj.draw());
				tmpobj.divPoolid = adiv.getdivid();
				//setup the new prototype properties
				dd.elements[adiv.getdivid()].containertype 	= "recordingServer"; 
				dd.elements[adiv.getdivid()].containerobj	= tmpobj;
				dd.elements[adiv.getdivid()].moveTo(tmpobj.xpos, tmpobj.ypos);
				dd.elements[adiv.getdivid()].show();
				hasbeendeleted[recordersArray.length] = false;
				recordersArray.push(tmpobj);


				//add as site child...
				dd.elements[ (sitesArray[attached_site].divPoolid) ].addChild( adiv.getdivid() );
			}
			else if(foundat != null) //we have founded one... so, it is a modification
			{
				if( recordersArray[foundat].SITE_DBID != this_sitedbid )
				{
					var attached_site = null;
					//append this div to the site that it his parent				
					for(var st = 0; st < recordersArray.length; st++)
					{					
						if(recordersArray[st].DBID  == this_sitedbid)
						{						
							attached_site = st; //dd.elements[ (sitesArray[st].divPoolid) ].addChild( adiv.getdivid() );//dd.elements[adiv.getdivid()] );
							break;
						}
					}
					
					//attached_site is the new site
					if(attached_site != null)
					{	//update this switch informations and move it to new site
						recordersArray[foundat].xpos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].x + 0;
						recordersArray[foundat].ypos 		= dd.elements[ (sitesArray[attached_site].divPoolid) ].y + 10;
						recordersArray[foundat].width 		= 300;
						recordersArray[foundat].heigth 		= 80;
						recordersArray[foundat].color		= "#330066";
						dd.elements[recordersArray[foundat].divPoolid].moveTo(recordersArray[foundat].xpos, recordersArray[foundat].ypos);
						//add as site child...
						dd.elements[ (sitesArray[attached_site].divPoolid) ].addChild( recordersArray[foundat].divPoolid );
						
						/* element was moved, force an layout save */
						do_delayed_save_layout = true;
					}
				}
				
				recordersArray[foundat].DBID					= this_dbid;
				recordersArray[foundat].SERVER_NAME				= this_name;
				recordersArray[foundat].SERVER_PASSWORD			= this_password;
				recordersArray[foundat].HOST					= this_host;
				recordersArray[foundat].PORT					= this_port;
				recordersArray[foundat].SEC_PORT				= this_secport;
				recordersArray[foundat].EXTERN_HOST				= this_exthost;
				recordersArray[foundat].EXTERN_PORT				= this_extport;
				recordersArray[foundat].EXTERN_SEC_PORT			= this_extsecport;
				recordersArray[foundat].SALES_PATH				= this_sellpath;
				recordersArray[foundat].NOSALES_PATH			= this_nosellpath;
				recordersArray[foundat].SITE_DBID				= this_sitedbid;
				recordersArray[foundat].REC_SYNC_TIME			= this_recsynctime;
				recordersArray[foundat].MASTER_SERVER			= this_masterserv;
				recordersArray[foundat].LOAD_BALANCE_FOR_AGENTS	= this_loadAgents;
				recordersArray[foundat].ALLOW_REC_SYNC			= this_allowrec;
				recordersArray[foundat].MAX_DISK_TO_USE			= this_recmaxallow;
				recordersArray[foundat].TOMCAT_URL				= this_tomcaturl;
				recordersArray[foundat].RECORDINGS_PATH			= this_recordingspath;
				//display the div again... //no need.. the name is never change			
			}
		}
	}
	
	var newrecArray = new Array();	
	for(var i = 0; i < hasbeendeleted.length; i++)
	{		
		if( !hasbeendeleted[i] ) //the number i has been deleted
			newrecArray.push( recordersArray[i] );
		else
			releaseDivPool(recordersArray[i].divPoolid);		
	}
	recordersArray = newrecArray;
	
	hidePleaseWaitDlg("WAIT_FOR_RECORDINGSERVER_CREATION");
	hidePleaseWaitDlg("WAIT_FOR_RECORDINGSERVER_MODIFICATION");
	hidePleaseWaitDlg("WAIT_FOR_RECORDINGSERVER_DELETING");
	
	if(do_delayed_save_layout)
		setTimeout('saveLayout()', 200);
}



/***
	Utils
***/
function findAndReserveDivPool()
{
	var obj = null;
	for(var i = 0; i < 	divPoolArray.length; i++)
	{
		if(	!divPoolArray[i].inuse )
		{
			obj = divPoolArray[i];
			divPoolArray[i].inuse = true; //now i'm in use
			break;
		}
	}
	if(!obj)
		alert("ALERT: DIV POOL EXHAUSTED !!");
	return obj;
}

function releaseDivPool(poolname)
{
	var index = parseInt(poolname.substr('DivPool'.length));
	dd.elements[poolname].write(""); //flush inside html
	dd.elements[poolname].hide();	 //hide it
	dd.elements[poolname].containertype = null; 
	dd.elements[poolname].containerobj	= null;
	divPoolArray[index].inuse 			= false;	//make it available
}

function showhidegrid(tf)
{
	if(tf)	 //true or false
	{
		diagramobj.style.backgroundImage = 'url(../img/grid5.jpg)';	
	}
	else
	{
		diagramobj.style.backgroundImage = 'none';
	}
}

function initLiveStatArray()
{
	/*
	liveStatsArray["dlg_ctistats_managers_confs"]		= 0;
	liveStatsArray["dlg_ctistats_managers_connected"]	= 0;
	liveStatsArray["dlg_ctistats_agents_confs"]			= 0;
	liveStatsArray["dlg_ctistats_agents_connected"]		= 0;
	liveStatsArray["dlg_ctistats_switches_confs"]		= 0;
	liveStatsArray["dlg_ctistats_switches_connected"]	= 0;
	liveStatsArray["dlg_ctistats_recorders_confs"]		= 0;
	liveStatsArray["dlg_ctistats_recorders_connected"]	= 0;
	liveStatsArray["dlg_ctistats_encryptors_confs"]		= 0;
	liveStatsArray["dlg_ctistats_encryptors_connected"]	= 0;*/	
}

function dialogDisplay(type)
{
	var txt = eval(type);
	if( !txt )
	{
		alert('ERROR: Unable to diplay dialog of type '+type);
		return;
	}
	dd.elements[DialogsdivPool.getdivid()].write( txt ); //write the innerhtml
	//center the dialog
	var xpos = 	parseInt(diagramobj.clientWidth/2) - dd.elements[DialogsdivPool.getdivid()].w/2;
	var ypos = 	parseInt(diagramobj.clientHeight/2) - dd.elements[DialogsdivPool.getdivid()].h/2 + diagramoffsettop;
	dd.elements[DialogsdivPool.getdivid()].moveTo(xpos, ypos);
	dd.elements[DialogsdivPool.getdivid()].maximizeZ(); //make on all top
	/* we can set all others to non drageable to make sure that people don't drag them then filling a form
	for(var i = 0 ; i < dd.elements.length; i++)
	{
		dd.elements[i].initiallyDrageable = !dd.elements[i].nodrag;
		dd.elements[i].setDraggable(false);		
	}
	*/
	dd.elements[DialogsdivPool.getdivid()].show();
}

function dialogHide()
{
	dd.elements[DialogsdivPool.getdivid()].hide();
	/*
	for(var i = 0 ; i < dd.elements.length; i++)
	{
		if(dd.elements[i].initiallyDrageable)
			dd.elements[i].setDraggable(true);		
	}
	*/
}

function displayPleaseWait(message, messageType)
{
	dialogDisplay("DLG_TEMP_MESSAGES");
	var obj = null;
	obj = document.getElementById('dlg_temp_messages');
	if (obj )
		obj.innerHTML = message;
	curpleasewaitmesstype = messageType;
}

function hidePleaseWaitDlg(messageType)
{
	if( curpleasewaitmesstype )	
		if(curpleasewaitmesstype == messageType)
		{
			dialogHide();
			curpleasewaitmesstype = null;
		}
}

function buildReadableDatetime( timestamp )
{
	var rstr = '';
	var thatDay = new Date(timestamp*1000);
	rstr = arr_months[month[thatDay.getMonth()]];//rstr = month[thatDay.getMonth()];
	rstr += ',';
	if( thatDay.getDate() < 10 )
		rstr += '0'+thatDay.getDate();
	else
		rstr += thatDay.getDate();
	rstr += ' ';
	if( thatDay.getHours() < 10 )
		rstr += '0'+thatDay.getHours();
	else
		rstr += thatDay.getHours();
	rstr += ':';	
	if( thatDay.getMinutes() < 10 )
		rstr += '0'+thatDay.getMinutes();
	else
		rstr += thatDay.getMinutes();
	rstr += ':';		
	if( thatDay.getSeconds() < 10 )
		rstr += '0'+thatDay.getSeconds();
	else
		rstr += thatDay.getSeconds();
		
	//thatDay.getHours()+':'+thatDay.getMinutes()+':'+thatDay.getSeconds();
	
	return rstr; 	
}

function abledisableoptions(obj)
{
	if( obj.checked )
	{
		document.getElementById('dlg_addnewrecorder_sendto').disabled = false;
		document.getElementById('dlg_adnewrecorder_synctime').disabled = false;	
	}
	else
	{
		//disable all
		document.getElementById('dlg_addnewrecorder_sendto').disabled = true;
		document.getElementById('dlg_adnewrecorder_synctime').disabled = true;
	}
}

function fillsalesnosalesbox()
{	 
	var val = document.getElementById('dlg_adddlg_addnewrecorder_Path').value;
	val = (val.charAt(val.length -1) == '/') ? val : val + "/";
	document.getElementById('dlg_adddlg_addnewrecorder_salesPath').value = val + "sales/";
	document.getElementById('dlg_adddlg_addnewrecorder_nosalesPath').value = val + "nosales/";   
}


function setmountdir()
{
 	var val = document.getElementById('dlg_addnewrecorder_name').value;	 
	document.getElementById('dlg_addnewrecorder_tomcaturl').value = "mnt_" + val + "/";
	  
}
