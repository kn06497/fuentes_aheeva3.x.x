<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<%
	
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else	
		pageData.setDefaultLanguage("ENGLISH");	
	
	System.out.println("top.jsp "+session.getAttribute("USER_LANGUAGE"));
		
	
		
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	
	String userPrivilegesQuery 			= "select * from cfg_user where dbid='"+CURRENT_USER_DBID+"'";
	String userPreferencesQuery = "SELECT * FROM cfg_user_live_stats_preferences WHERE USER_DBID='"+CURRENT_USER_DBID+"'";
	

	
	
	
	pageData.openConnection();
	pageData.executeFromString(userPrivilegesQuery);
	Vector <HashMap> userPrivilegesDataResult = pageData.CreateVectorFromBean();	
	pageData.executeFromString(userPreferencesQuery);
	Vector <HashMap<String,String>> userPreferences = pageData.CreateVectorFromBean();
	
	
	
		
	
%>

<!--<HTML>-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<LINK href="Resources_pages/style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]>
<link href="Resources_pages/styleie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">-->


<script language="JavaScript" src="Resources_pages/jsUtil.js"></script>
<script language="javascript" src="Resources_pages/globFuncsTopHTM.js"></script>
<script language="javascript" src="Resources_pages/Browser.js" type="text/javascript"></script>
<script language="javascript" src="Resources_pages/statsRightsTable.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="lang_browser.js"></script>
<script type="text/javascript" src="Resources_pages/mootools-release2222.js"></script>


<SCRIPT LANGUAGE="JavaScript">
var agentStats		= "";
var agentGroupStats	= "";
var campaignStats	= "";
var callingListStats= "";
var queueStats		= "";
var aPerfStats		= "";
var teamStats		= "";
var adherenceStats  = "";
var logoTab         = ""; 
var rClickMenu;
// Align Tab: LEFT, CENTER, RIGHT
var tabAlign = "LEFT";
var currentTab;
var currentTabID; //store the id of the current live stat tab
var iRecordPwd = window.top.comm.myApplet.getIRecordPwd();

function updateAgentStats(svalue)
{	
    if(currentTab[0] == 'Agents')
		{
			if(at.b == "ie")
			{
				if( stats.document.readyState == 'complete')
				{
					stats.replaceStatDivision(svalue);
				}
				//stats.document.body.innerHTML = svalue;	
			}
			else
			{
				/*var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.body.innerHTML = svalue;*/
				var statsObj = document.getElementById('stats');
						
				statsObj.contentDocument.replaceStatDivision(svalue);
			}
		}
		
		showLayer("divTabFrame");
}

function updateAgentGroupStats(svalue)
{
	agentGroupStats = svalue;
	
    if(currentTab[0] == 'AgentGroups')
    	{
			if(at.b == "ie")
			{
				if( stats.document.readyState == 'complete')
				{
					stats.replaceStatDivision(svalue);
				}
				//stats.document.body.innerHTML = svalue;	
			}
			else
			{
				/*var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.body.innerHTML = svalue;*/
				var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.replaceStatDivision(svalue);
			}
		}
		
	showLayer("divTabFrame");
	
}

function updateQueueStats(svalue)
{
	queueStats = svalue;
	
	if(currentTab[0] == 'Queues')
		{
			if(at.b == "ie")
			{
				if( stats.document.readyState == 'complete')
				{
					stats.replaceStatDivision(svalue);
				}
				//stats.document.body.innerHTML = svalue;	
			}
			else
			{
				/*var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.body.innerHTML = svalue;*/
				var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.replaceStatDivision(svalue);
			}
		}
		
	showLayer("divTabFrame");
}

function updateCampaignStats(svalue)
{
	campaignStats = svalue;
	
	if(currentTab[0] == 'Campaigns')
		{
			if(at.b == "ie")
			{
				if( stats.document.readyState == 'complete')
				{
					stats.replaceStatDivision(svalue);
				}
				//stats.document.body.innerHTML = svalue;	
			}
			else
			{
				/*var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.body.innerHTML = svalue;*/
				var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.replaceStatDivision(svalue);
			}
		}
	
	showLayer("divTabFrame");
}

function updateCallingListStats(svalue)
{
	callingListStats = svalue;
	
	if(currentTab[0] == 'CallingLists')
		{
			if(at.b == "ie")
			{
				if( stats.document.readyState == 'complete')
				{
					stats.replaceStatDivision(svalue);
				}
				//stats.document.body.innerHTML = svalue;	
			}
			else
			{
				/*var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.body.innerHTML = svalue;*/
				var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.replaceStatDivision(svalue);
			}
		}
		
	showLayer("divTabFrame");
		
}

function updateAgentPerfStats(svalue)
{
    aPerfStats= svalue;
	
    if(currentTab[0] == 'Performance')
	{
		if(at.b == "ie")
			{
				if( stats.document.readyState == 'complete')
				{
					stats.replaceStatDivision(svalue);
				}
				//stats.document.body.innerHTML = svalue;	
			}
			else
			{
				/*var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.body.innerHTML = svalue;*/
				var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.replaceStatDivision(svalue);
			}
	}
	
	showLayer("divTabFrame");		
}

function updateAgentTeamStats(svalue)
{
	teamStats = svalue;
	
	if(currentTab[0] == 'Teams')
		{
			if(at.b == "ie")
			{
				if( stats.document.readyState == 'complete')
				{
					stats.replaceStatDivision(svalue);
				}
				//stats.document.body.innerHTML = svalue;	
			}
			else
			{
				/*var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.body.innerHTML = svalue;*/
				var statsObj = document.getElementById('stats');				
				statsObj.contentDocument.replaceStatDivision(svalue);
			}
		}
		
	showLayer("divTabFrame");
		
}


function updateAgentAdherenceStats()
{ 
	//alert("updateAgentAdherenceStats------");
	refreshAgentAdherenceStats(); 
	/*alert('Inside updateAgentAdherenceStats');
	
	if(currentTab[0] == 'Adherence')
	{
		appletObj.updateRTAViewInfo(appletObj.m_adh_start_time, appletObj.m_adh_end_time, appletObj.m_adh_spacing,"All");							
			
	}*/
	if(appletObj.getShowAdhValue() != "true")
		return;
	
	
	
		
	//showLayer("divTabFrame");
	if(at.b == "ie")	
	{	
		stats.refreshRtaView();// alert("stats.refreshRtaView.....");
	}
	else
	{
		var statsObj = document.getElementById('stats');				
		statsObj.contentDocument.refreshRtaView();//	alert("statsObj.contentDocument.refreshRtaView...");					
	} 
	
	
	
}

function refreshAgentAdherenceStats()
{
       var svalue="" ;    //is given as  '^0-17:2,18-29:5,30-30:3,31-31:6,32-41:5^0-26:2,27-27:0|0-35:2,36-41:5^0-27:2|';
       var statsObj;
	   svalue = appletObj.m_ScheduleAdherenceData;
	  
       //var allAgentScheduleData;                       //Tab containing all schedule and adherence data received from CTI
       var nrow = 0;
       data = svalue + "";
       jsArray = data.split("|");
       nrow = jsArray.length;
      if(nrow >= 0) 
	  {       	
       	if(at.b == "ie")
          	stats.allAgentScheduleData=new Array(nrow);
        else{
 			statsObj = document.getElementById('stats');				
			statsObj.contentDocument.allAgentScheduleData=new Array(nrow);							
       	
        	}
         for (i=0; i < nrow; i++)
          {
	        if(at.b == "ie")
	          	stats.allAgentScheduleData[i] = jsArray[i];
	        else{
	 			statsObj = document.getElementById('stats');				
				statsObj.contentDocument.allAgentScheduleData[i] = jsArray[i];					
        
        
        	}
          }
       }
		//appletObj.m_ScheduleAdherenceData="";
	   // fin if
}

function setAgentScheduleData()
{
	   var schedule_data ='';
	   schedule_data  = appletObj.m_all_ScheduleData;
       var nrow = 0;
       data = schedule_data + "";
       var jsSchArray = data.split("|");
       nrow = jsSchArray.length;
       if(nrow > 0) {
         stats.thisDayScheduleInfo=new Array(nrow);
         for (i=0; i < nrow; i++)
          {
              stats.thisDayScheduleInfo[i] = jsSchArray[i];
          }
       }	

}
//#93BEE2 ancien couleur pour TAB ON
//#c4e0f0 ancien couleur pour TAB OFF
// Tab Name | URL | * (Default Selected Tab)

function updateLineManagementStats(svalue)
{
	lineStats = svalue;
	if(currentTab[0] == 'Line Management')
	{
		if(at.b == "ie")
		{
			if( stats.document.readyState == 'complete')
			{
				stats.replaceStatDivision(svalue);
			}
		}
		else
		{
			var statsObj = document.getElementById('stats');
			statsObj.contentDocument.replaceStatDivision(svalue);
		}
	}
	showLayer("divTabFrame");
}


var tabs = new Array
(
	"Agents|agentStats",
	"AgentGroups|agentGroupStats",
	"Queues|queueStats",
	"Campaigns|campaignStats",
	"CallingLists|callingListStats",
	"Performance|aPerfStats",
	"Teams|teamStats",
	"Adherence|adherenceStats",
	"Line Management|lineStats",
	"Logo|logoTab|*"
);

/*********************************************/

function tabOnClick(ID){
	var oElement = null;
	
	for (var i = 0; i < tabs.length; i++)
	{
		oElement = document.getElementById(i);
		if(oElement != null)
		{
			//oElement.className = "kwick";
			switch(i)
				{
				case 0:
					oElement.className = "kwick";
				break;
				case 1:
					oElement.className = "kwick";
				break;
				case 2:
					oElement.className = "kwick";
				break;
				case 3:
					oElement.className = "kwick";
				break;
				case 4:
					oElement.className = "kwick";
				break;
				case 5:
					oElement.className = "kwick";
				break;
	
				case 6:
					oElement.className = "kwick";
				break;
				case 7:
					oElement.className = "kwick";
					/*var start =  window.top.comm.myApplet.m_adh_start_time;
					var end  =   window.top.comm.myApplet.m_adh_end_time;
					var spacing  =   window.top.comm.myApplet.m_adh_spacing;
					document.getElementById('stats').src="Resources_pages/essai.jsp?startTime="+start+"&endTime="+end+"&spacing="+spacing+"";
					*/
				break;
				
				case 8: 
					oElement.className = "kwick";
				break;	

				case 9: 
					oElement.className = "";
				break;
				}
		}
	}



/*
	oElement = document.getElementById(ID);
	//oElement.className = "tabOn";
	if(oElement)
	{
		switch(oElement.id)
			{
			case "0":
				//oElement.className = "";
			break;
	
			case "url(img/background_AgentsGroups.gif)":
				//oElement.style.backgroundImage = "url(img/background_AgentsGroupsOn.gif)";
			break;
	
			case "url(img/background_Queue.gif)":
				oElement.style.backgroundImage = "url(img/background_QueueOn.gif)";
			break;
	
			case "url(img/background_Campaigns.gif)":
				//oElement.style.backgroundImage = "url(img/background_CampaignsOn.gif)";
			break;
	
			case "url(img/background_CallingList.gif)":
				//oElement.style.backgroundImage = "url(img/background_CallingListOn.gif)";
			break;
	
			case "url(img/background_performance.gif)":
				//oElement.style.backgroundImage = "url(img/background_performanceOn.gif)";
			break;
	
			case "url(img/background_TeamList.gif)":
				//oElement.style.backgroundImage = "url(img/background_TeamListOn.gif)";
			break;
			
			case "url(img/background_Adherence.gif)":
				//oElement.style.backgroundImage = "url(img/background_AdherenceOn.gif)";
			break;
	
			case "url(img/background_LineManagement.gif)":
				//oElement.style.backgroundImage = "url(img/background_LineManagementOn.gif)";
			break;
			
			case "url(img/aheeva_tab_icon.gif)":
				//oElement.style.backgroundImage = "url(img/aheeva_tab_icon_on.gif)";
			break;	
			}
	}
*/




	oElement = document.getElementById(ID);
	//oElement.className = "tabOn";

	switch(oElement.id)
	{
		case "0":
			oElement.className = "koff";
		break;

		case "1":
			oElement.className = "koff";
		break;

		case "2":
			oElement.className = "koff";
		break;

		case "3":
			oElement.className = "koff";
		break;

		case "4":
			oElement.className = "koff";
		break;

		case "5":
			oElement.className = "koff";
		break;

		case "6":
			oElement.className = "koff";
		break;

		case "7":
			oElement.className = "koff";
		break;
		
		case "8":
			oElement.className = "koff";
		break;
		
		case "9":
			oElement.className = "";
		break;
	}
	
	//alert(oElement.style.backgroundImage)

	currentTab = tabs[ID].split("|");
	currentTabID=ID; //store the id of the current tab
	hideLayer("divTabFrame");

	//clearing all the livestats data
	agentStats		= "";
	agentGroupStats	= "";
	ampaignStats	= "";
	callingListStats= "";
	queueStats		= "";
	aPerfStats		= "";
	teamStats		= "";
	adherenceStats  = "";
	lineStats       = "";
	logoTab         = "";  
	var divTabFrameObj = document.getElementById('divTabFrame');
	/*divTabFrameObj.innerHTML = "<IFRAME ID='stats' CLASS='tabFrame'></IFRAME>";*/
	
	if(currentTab[0] == 'Adherence')
	{
		// var start =  window.top.comm.myApplet.m_adh_start_time;
		//var end  =   window.top.comm.myApplet.m_adh_end_time;
		// var spacing  =  5;// window.top.comm.myApplet.m_adh_spacing;
		document.getElementById('stats').src="Resources_pages/rtaview1.jsp";//?startTime="+start+"&endTime="+end+"&spacing="+spacing+"";
		document.getElementById('stats').className="tabFrameAdher";
	}
	else
	
	if(currentTab[0] == 'Logo')
	{
		document.getElementById('stats').src="Resources_pages/logo1.jsp";
		document.getElementById('stats').className="tabFrame";
	}
	else
	{
		/*
		if(at.b=="ie")		
		{
			if(stats.document.body)
				stats.document.body.innerHTML = eval(currentTab[1]);
		}
		else
		{
			var statsObj = document.getElementById('stats');			
			setTimeout("", 100);			
			statsObj.contentDocument.body.innerHTML = eval(currentTab[1]);			
		}
		*/
		if( document.getElementById('stats').src.indexOf("Resources_pages/topstats.jsp") == -1 )
			document.getElementById('stats').src="Resources_pages/topstats.jsp";
			document.getElementById('stats').className="tabFrame";
		if(at.b == "ie")
		{
			//alert('stats.document='+stats.document);			
			if( stats.document.readyState == 'complete')
			{				
				stats.hideAllContextMenus(ID);
				stats.replaceStatDivision( eval(currentTab[1]) );
			}
		}
		else
		{
			var statObj = document.getElementById('stats').contentDocument;
			alert(eval(currentTab[1]));
			//document.getElementById('stats').contentDocument.replaceStatDivision( eval(currentTab[1]) );
		}
					
	}
	//document.body.contentWindow.focus();
	//document.body.focus();

	if(currentTabID==7){
		appletObj.enableShowAdherence(); 
		showLayer("divTabFrame");
	}else{
		if(currentTabID!=9){
			if( stats.document.readyState == 'complete'){				
				appletObj.updateLiveStatView(currentTabID); //update the comApplet live stat view property
				appletObj.disableShowAdherence();
			}
		}else{
			appletObj.updateLiveStatView(currentTabID);
			showLayer("divTabFrame");
		}
	}
};

/*********************************************/


window.addEvent('domready', function () {

var szNormal = 14, szSmall  = 14, szFull   = 25, szUp   = 5, szDown   = 16;
 
var kwicks = $$(".kwick");
var fx = new Fx.Elements(kwicks, {wait: false, duration: 300, transition: Fx.Transitions.Back.easeOut});
kwicks.each(function(kwick, i) {
	
	kwick.addEvent("mouseenter", function(event) {
		var o = {};
		o[i] = {height: [kwick.getStyle("height").toInt(), szFull], top: [kwick.getStyle("top").toInt(), szUp]}
		kwicks.each(function(other, j) {
			if(i != j) {
			// -- to keep active tab always elevated --
			/*if(other.className.match(/koff/)) {
			o[j] = {height: [other.getStyle("height").toInt(), szFull], top: [other.getStyle("top").toInt(), szUp]}
			}else{	*/		
				var w = other.getStyle("height").toInt();
				var w2 = other.getStyle("top").toInt();
				if(w != szSmall) o[j] = {height: [w, szSmall], top: [w2, szDown]};
			/*}*/
			}
		});
		fx.start(o);
	});
});
 
$("kwicks").addEvent("mouseleave", function(event) {
	var o = {};
	kwicks.each(function(kwick, i) {
	if(kwick.className.match(/koff/)) {
	o[i] = {height: [kwick.getStyle("height").toInt(), szFull], top: [kwick.getStyle("top").toInt(), szUp]}
	}else{
		o[i] = {height: [kwick.getStyle("height").toInt(), szNormal], top: [kwick.getStyle("top").toInt(), szDown]}
	}
	});
	fx.start(o);
})

});

function tabOver(id) {
var overTab = document.getElementById(id);
overTab.className = (overTab.className.replace(/kwick/,"kwickover"));

};

function tabOut(id) {
var overTab = document.getElementById(id);
overTab.className = (overTab.className.replace(/kwickover/,"kwick"));
//this.style.backgroundImage = (this.style.backgroundImage.replace(/_a/,"_r"));
};

function logoOver(idlogo) {
var logoTab = document.getElementById(idlogo);
logoTab.className = "logoover";
};

function logoOut(idlogo) {
var logoTab = document.getElementById(idlogo);
logoTab.className = "";
};

function hei1 (){
	
	if(document.body.clientHeight>30){
		document.getElementById('stats').style.height = (document.body.clientHeight)-30 + "px";
	}else{
		document.getElementById('stats').style.height = 0 + "px";
	}

};
window.onload=hei1;
window.onresize=hei1;
//-->


</SCRIPT>


</head>
<base target="rbottom">
<BODY class="toppagebody"  scroll="no"> 
	<div id="kwicks_container">
		<div id="kwicks">
			<div id="0" class="kwick" onMouseOver="tabOver(0)" onMouseOut="tabOut(0)" onClick="tabOnClick(0)" style="display:<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_AGENT_STATS") && userPreferences.elementAt(0).get("AGENT_STATS").compareTo("1")==0?"":"none"%>">
			<%=pageData.getWord("Agents")%></div>
			<div id="1" class="kwick" onMouseOver="tabOver(1)" onMouseOut="tabOut(1)" onClick="tabOnClick(1)" style="display:<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_AGENT_STATS") && userPreferences.elementAt(0).get("AGENT_GROUP_STATS").compareTo("1")==0?"":"none"%>">
			<%=pageData.getWord("Agent Groups")%></div>
			<div id="2" class="kwick" onMouseOver="tabOver(2)" onMouseOut="tabOut(2)" onClick="tabOnClick(2)" style="display:<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_QUEUES_STATS") && userPreferences.elementAt(0).get("QUEUE_STATS").compareTo("1")==0?"":"none"%>">
			<%=pageData.getWord("Queues")%></div>
			<div id="3" class="kwick" onMouseOver="tabOver(3)" onMouseOut="tabOut(3)" onClick="tabOnClick(3)" style="display:<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_CAMPAIGN_STATS") && userPreferences.elementAt(0).get("CAMPAIGN_STATS").compareTo("1")==0?"":"none"%>">
			<%=pageData.getWord("Campaigns")%></div>
			<div id="4" class="kwick" onMouseOver="tabOver(4)" onMouseOut="tabOut(4)" onClick="tabOnClick(4)" style="display:<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_CALLING_LIST_STATS") && userPreferences.elementAt(0).get("CALLING_LIST_STATS").compareTo("1")==0?"":"none"%>">
			<%=pageData.getWord("Calling lists")%></div>
			<div id="5" class="kwick" onMouseOver="tabOver(5)" onMouseOut="tabOut(5)" onClick="tabOnClick(5)" style="display:<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_PERFOMANCE_STATS") && userPreferences.elementAt(0).get("PERFORMANCE_STATS").compareTo("1")==0?"":"none"%>">
			<%=pageData.getWord("Performance")%></div>
			<div id="6" class="kwick" onMouseOver="tabOver(6)" onMouseOut="tabOut(6)" onClick="tabOnClick(6)" style="display:<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_TEAM_STATS") && userPreferences.elementAt(0).get("TEAMS_STATS").compareTo("1")==0?"":"none"%>">
			<%=pageData.getWord("Teams")%></div>
			<div id="7" class="kwick" onMouseOver="tabOver(7)" onMouseOut="tabOut(7)" onClick="tabOnClick(7)" style="display:<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_ADHERENCE_STATS") && userPreferences.elementAt(0).get("ADHERENCE_STATS").compareTo("1")==0?"":"none"%>">
			<%=pageData.getWord("adherence")%></div>
			<div id="8" class="kwick" onMouseOver="tabOver(8)" onMouseOut="tabOut(8)" onClick="tabOnClick(8)" style="display:<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_LINE_MANAGEMENT_STATS") && userPreferences.elementAt(0).get("LINE_MANAGEMENT_STATS").compareTo("1")==0?"":"none"%>">
			<%=pageData.getWord("Line management")%></div>
			<div id="9" onMouseOver="logoOver(9)" onMouseOut="logoOut(9)" onClick="tabOnClick(9)"></div>
		</div>
	</div>

<DIV ID="divTabFrame"><IFRAME ID="stats" name="stats" border="0" frameborder="0" CLASS="tabFrame" src="Resources_pages/topstats.jsp" style="height:1px;"></IFRAME></DIV>

<DIV id="divLoadingState">
	<table class="topstatsbody" width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td align="center" valign="middle">	
		<img src="img/aheeva_loading_stat.gif">
	</td>
	</tr>
	</table>
</DIV>
	
	
	<script>
	/* select default view */
	//var divTabButtonsObj = document.getElementById('divTabButtons');
	//divTabButtonsObj.innerHTML = HTML;	
	for(var i = 0; i < tabs.length; i++)
	{
		var tab = tabs[i].split("|");
		if (tab[2] == "*")
		{
			tabOnClick(i);
			break;
		}
	}
	</script>
<br>

<!-- Fixes the IE6 & IE7 "Press SPACEBAR or ENTER to activate and use this control" - must be at the end of the file-->
<script language="JScript" type="text/jscript" src="activateActiveX.js"></script>	
	
</BODY>
<% pageData.closeConnection(); %>
</HTML>
