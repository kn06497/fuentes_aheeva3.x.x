// JavaScript Document
var curAgtName = "", curAgtLogin = "", curAgtTenant = "", curAgtIP = "", curAgtHost = "", curAgtAst = "", curAgtDbid = "";
var curGrpName = "", curGrpDbid = "", curGrpTenant = "";
var curCmpName = "", curCmpDbid = "", curCmpTenant = "", curCmpMode = "", curCmpStatus = "";

function replaceStatDivision(newHtml)
{
	var theDiv = document.getElementById('stats_division');
	if(theDiv)
	{
		theDiv.innerHTML = newHtml;
		var x = theDiv.getElementsByTagName("script"); 
		for(var i=0;i<x.length;i++)
		{
			eval(x[i].text);
		}
	}
}

function setCurrentAgentGlobals(agtName, agtLogin, agtTenant, agtIP, agtHost, agtAst, agtPhoneVersion)
{
	curAgtName 	= agtName;
	curAgtLogin = agtLogin;
	curAgtTenant = agtTenant;
	curAgtIP = agtIP;
	curAgtHost = agtHost;
	curAgtAst = agtAst;
	curAgtPhoneVersion = agtPhoneVersion;
	curAgtDbid = appletObj.getAgentDBID(curAgtLogin);

	//Setup popup values...	
	ah_AgtMenuObj.items["menu_AgtName"].setDisplayText( curAgtName );
	ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosIP"].setDisplayText("IP ["+curAgtIP+"]");
	ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosHost"].setDisplayText(MultiArray["Host ["][lang]+curAgtHost+"]");
	ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosAsterisk"].setDisplayText(MultiArray["Switch ["][lang]+curAgtAst+"]");
	ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosStarPhone"].setDisplayText(MultiArray["Phone ["][lang]+curAgtPhoneVersion+"]");
	ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosIP"].actionOnClick = 'javascript:copy_toclip("'+curAgtIP+'")';
	ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosHost"].actionOnClick = 'javascript:copy_toclip("'+curAgtHost+'")';
	ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosAsterisk"].actionOnClick = 'javascript:copy_toclip("'+curAgtAst+'")';
	ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosStarPhone"].actionOnClick = 'javascript:copy_toclip("'+curAgtPhoneVersion+'")';
}

function setCurrentGroupGlobals(grpName, grpDBID, grpTenant)
{
	curGrpName = grpName;
	curGrpDbid = grpDBID;
	curGrpTenant = grpTenant;
	
	//Setup popup values...	
	if(ah_GrpMenuObj)
		ah_GrpMenuObj.items["menu_GrpName"].setDisplayText( curGrpName );
}

function setCurrentCampaignGlobals(cmpName, cmpDbid, cmpTenant, cmpStatus, cmpMode)
{
	curCmpName = cmpName;
	curCmpDbid = cmpDbid;
	curCmpTenant = cmpTenant;
	curCmpMode = cmpMode;
	curCmpStatus = cmpStatus;
	
	//Set popup values
	//ah_CamMenuObj.items["menu_CamName"].setDisplayText( cmpName );		
}


function forceAgentStatus(newStatus) //will just take the current agent
{
	/*
	var yesno = confirm('Notice:\nYou are about to force the agent '+curAgtLogin+' status to '+newStatus+'\nDo you want to continue ?');	
	if(yesno)
		appletObj.sendForceAgentStatus(curAgtLogin, newStatus, "agent");
	*/
	var noticeObj = document.getElementById('changeStatusDialog_text');	
	noticeObj.innerText = 'You are about to force the agent '+curAgtLogin+' status to '+newStatus+'\nDo you want to continue ?';
	
	var agreeObj = 	document.getElementById('changeStatusDialog_okButton');	
	agreeObj.innerHTML = '<input type="button" value="OK" onClick="sendForceAgentStatus(\''+newStatus+'\')">';
	
	var dialogBoxObj = document.getElementById('changeStatusDialog');
	dialogBoxObj.style.top = document.body.scrollTop + document.body.clientHeight/2-dialogBoxObj.clientHeight/2;
	dialogBoxObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-dialogBoxObj.clientWidth/2;	
	dialogBoxObj.style.visibility = "visible";	
}

function forceGroupStatus(newStatus) //will just take the current agent
{
	/*var yesno = confirm(MultiArray['Notice:\nYou are about to force all agents in group '][lang]+curGrpName+ MultiArray['status to'][lang]+newStatus+ MultiArray['Do you want to continue'][lang]);	
	if(yesno)
		appletObj.sendForceAgentStatus(curGrpDbid, newStatus, "agentgroup", "");*/
		
	var noticeObj = document.getElementById('changeStatusDialog_text');
	noticeObj.innerText = 'You are about to force all agents in group '+curGrpName+' status to '+newStatus+'\nDo you want to continue ?';
	
	var agreeObj = 	document.getElementById('changeStatusDialog_okButton');	
	agreeObj.innerHTML = '<input type="button" value="OK" onClick="sendForceAgentGroupStatus(\''+newStatus+'\')">';
	
	var dialogBoxObj = document.getElementById('changeStatusDialog');
	dialogBoxObj.style.top = document.body.scrollTop + document.body.clientHeight/2-dialogBoxObj.clientHeight/2;
	dialogBoxObj.style.left = document.body.scrollLeft + document.body.clientWidth/2-dialogBoxObj.clientWidth/2;	
	dialogBoxObj.style.visibility = "visible";	
}

function sendForceAgentStatus(newStatus)
{
	var messObj = document.getElementById('changeStatusDialog_mess');
	var message = messObj.value;
	appletObj.sendForceAgentStatus(curAgtLogin, newStatus, "agent", message);
	messObj.value = "";
	hidechangeStatusDialog();
}

function sendForceAgentGroupStatus(newStatus)
{
	var messObj = document.getElementById('changeStatusDialog_mess');
	var message = messObj.value;
	appletObj.sendForceAgentStatus(curGrpDbid, newStatus, "agentgroup", message);
	messObj.value = "";
	hidechangeStatusDialog();
}

function hidechangeStatusDialog()
{
	var dialogBoxObj = document.getElementById('changeStatusDialog');
	dialogBoxObj.style.visibility = "hidden";	
}

function showAgentProps()
{
	var newUrl = "./agent.jsp?dbid="+curAgtDbid+"&agtName="+curAgtName+"["+curAgtLogin+"]&tenant_dbid="+curAgtTenant;
	var downWindow = window.top.main.rbottom;
	if(downWindow)
	{
		downWindow.location.href = newUrl;
	}	
}

function showGroupProps()
{
	var newUrl = "./agentGroup.jsp?dbid="+curGrpDbid+"&grpName="+curGrpName+"&tenant_dbid="+curGrpTenant;
//	var newUrl = './agentGroup.jsp?grpName='+curGrpName+'&tenant_dbid='+curGrpTenant;
	var downWindow = window.top.main.rbottom;
	if(downWindow)
	{
		downWindow.location.href = newUrl;
	}	
}

function showGroupStats()
{
	var newUrl = "./agentGroupStatsGraph.jsp?grpName="+curGrpName;
	var downWindow = window.top.main.rbottom;
	if(downWindow)
	{
		downWindow.location.href = newUrl;
	}	
}

function showCmpStats()
{
	var newUrl = "./campaignStatsGraph.jsp?campaign_name="+curCmpName;
	var downWindow = window.top.main.rbottom;
	if(downWindow)
	{
		downWindow.location.href = newUrl;
	}	
	
}

function showCampaignProps()
{
	var newUrl = './campaign.htm?campaign_name='+curCmpName+'&tenant_dbid='+curCmpTenant;
	var downWindow = window.top.main.rbottom;
	if(downWindow)
	{
		downWindow.location.href = newUrl;
	}
}

function hideAllContextMenus(tabName)
{	
	hideAllMenus();	
	switch(tabName)
	{
		case 0:
			setPopUpMenu(ah_AgtMenuObj);
		break;
		case 1:
			setPopUpMenu(ah_GrpMenuObj);
		break;
		case 2:
		
		break;
		case 3:
			setPopUpMenu(ah_CamMenuObj);
		break;
		case 4:
		
		break;
		case 5:
		
		break;
		case 6:
		
		break;
		
		case 8:
		
		break;
		case 9:
		
		break;
	}	
}

function livestatsorderby(panel_name, orderby_column)
{
	appletObj.sortLiveStatsByColumn(panel_name, orderby_column);
}


function livestatsAgentPannelCollapseGroup(group_name, collapse_type)
{
	if( collapse_type == 'UNCOLLAPSE' )
	{
		appletObj.liveAgentStatsRemoveAgentgroupCollapse( group_name );
	}
	else if( collapse_type == 'COLLAPSE' )
	{
		appletObj.liveAgentStatsAddAgentgroupCollapse( group_name );
	}
}

function livestatsAgentTeamPannelCollapseGroup(team_name, collapse_type)
{
	if( collapse_type == 'UNCOLLAPSE' )
	{
		appletObj.liveTeamAgentStatsRemoveAgentgroupCollapse( team_name );
	}
	else if( collapse_type == 'COLLAPSE' )
	{
		appletObj.liveTeamAgentStatsAddAgentgroupCollapse( team_name );
	}
}



function copy_toclip(meintext)
{
	
 if (window.clipboardData) 
   {
   
   // the IE-manier
   window.clipboardData.setData("Text", meintext);
   
   // waarschijnlijk niet de beste manier om Moz/NS te detecteren;
   // het is mij echter onbekend vanaf welke versie dit precies werkt:
   }
   else if (window.netscape) 
   { 
   
   // dit is belangrijk maar staat nergens duidelijk vermeld:
   // you have to sign the code to enable this, or see notes below 
   netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
   
   // maak een interface naar het clipboard
   var clip = Components.classes['@mozilla.org/widget/clipboard;1']
                 .createInstance(Components.interfaces.nsIClipboard);
   //if (!clip) return;
   
   // maak een transferable
   var trans = Components.classes['@mozilla.org/widget/transferable;1']
                  .createInstance(Components.interfaces.nsITransferable);
   //if (!trans) return;
   
   // specificeer wat voor soort data we op willen halen; text in dit geval
   trans.addDataFlavor('text/unicode');
   
   // om de data uit de transferable te halen hebben we 2 nieuwe objecten 
   // nodig om het in op te slaan
   var str = new Object();
   var len = new Object();
   
   var str = Components.classes["@mozilla.org/supports-string;1"]
                .createInstance(Components.interfaces.nsISupportsString);
   
   var copytext=meintext;
   
   str.data=copytext;
   
   trans.setTransferData("text/unicode",str,copytext.length*2);
   
   var clipid=Components.interfaces.nsIClipboard;
   
   //if (!clip) return false;
   
   clip.setData(trans,null,clipid.kGlobalClipboard);
   
   }
   //alert("Following info was copied to your clipboard:\n\n" + meintext);
   //return false;
}
