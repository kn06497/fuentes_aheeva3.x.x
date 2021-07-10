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

<HTML>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<LINK href="Resources_pages/style.css" rel="stylesheet" type="text/css" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">

<script language="JavaScript" src="Resources_pages/jsUtil.js"></script>
<script language="javascript" src="Resources_pages/globFuncsTopHTM.js"></script>
<script language="javascript" src="Resources_pages/Browser.js" type="text/javascript"></script>
<script language="javascript" src="Resources_pages/statsRightsTable.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="lang_browser.js"></script>
<script language="JavaScript" src="language.js"></script>

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
			oElement.className = "tabOff";
			switch(i)
				{
				case 0:
					oElement.style.backgroundImage = "url(img/background_Agents.gif)";
				break;
				case 1:
					oElement.style.backgroundImage = "url(img/background_AgentsGroups.gif)";
				break;
				case 2:
					oElement.style.backgroundImage = "url(img/background_Queue.gif)";
				break;
				case 3:
					oElement.style.backgroundImage = "url(img/background_Campaigns.gif)";
				break;
				case 4:
					oElement.style.backgroundImage = "url(img/background_CallingList.gif)";
				break;
				case 5:
					oElement.style.backgroundImage = "url(img/background_performance.gif)";
				break;
	
				case 6:
					oElement.style.backgroundImage = "url(img/background_TeamList.gif)";
				break;
				case 7:
					oElement.style.backgroundImage = "url(img/background_Adherence.gif)";
					/*var start =  window.top.comm.myApplet.m_adh_start_time;
					var end  =   window.top.comm.myApplet.m_adh_end_time;
					var spacing  =   window.top.comm.myApplet.m_adh_spacing;
					document.getElementById('stats').src="Resources_pages/essai.jsp?startTime="+start+"&endTime="+end+"&spacing="+spacing+"";
					*/
				break;
				
				case 8: 
					oElement.style.backgroundImage = "url(img/background_LineManagement.gif)";
				break;	

				case 9: 
					oElement.style.backgroundImage = "url(img/aheeva_tab_icon.gif)";
				break;
				}
		}
	}

	oElement = document.getElementById(ID);
	//oElement.className = "tabOn";
	if(oElement)
	{
		switch(oElement.style.backgroundImage)
			{
			case "url(img/background_Agents.gif)":
				oElement.style.backgroundImage = "url(img/background_AgentsOn.gif)";
			break;
	
			case "url(img/background_AgentsGroups.gif)":
				oElement.style.backgroundImage = "url(img/background_AgentsGroupsOn.gif)";
			break;
	
			case "url(img/background_Queue.gif)":
				oElement.style.backgroundImage = "url(img/background_QueueOn.gif)";
			break;
	
			case "url(img/background_Campaigns.gif)":
				oElement.style.backgroundImage = "url(img/background_CampaignsOn.gif)";
			break;
	
			case "url(img/background_CallingList.gif)":
				oElement.style.backgroundImage = "url(img/background_CallingListOn.gif)";
			break;
	
			case "url(img/background_performance.gif)":
				oElement.style.backgroundImage = "url(img/background_performanceOn.gif)";
			break;
	
			case "url(img/background_TeamList.gif)":
				oElement.style.backgroundImage = "url(img/background_TeamListOn.gif)";
			break;
			
			case "url(img/background_Adherence.gif)":
				oElement.style.backgroundImage = "url(img/background_AdherenceOn.gif)";
			break;
	
			case "url(img/background_LineManagement.gif)":
				oElement.style.backgroundImage = "url(img/background_LineManagementOn.gif)";
			break;
			
			case "url(img/aheeva_tab_icon.gif)":
				oElement.style.backgroundImage = "url(img/aheeva_tab_icon_on.gif)";
			break;	
			}
	}


	oElement = document.getElementById(ID);
	//oElement.className = "tabOn";

	switch(oElement.style.backgroundImage)
	{
		case "url(img/background_Agents.gif)":
			oElement.style.backgroundImage = "url(img/background_AgentsOn.gif)";
		break;

		case "url(img/background_AgentsGroups.gif)":
			oElement.style.backgroundImage = "url(img/background_AgentsGroupsOn.gif)";
		break;

		case "url(img/background_Queue.gif)":
			oElement.style.backgroundImage = "url(img/background_QueueOn.gif)";
		break;

		case "url(img/background_Campaigns.gif)":
			oElement.style.backgroundImage = "url(img/background_CampaignsOn.gif)";
		break;

		case "url(img/background_CallingList.gif)":
			oElement.style.backgroundImage = "url(img/background_CallingListOn.gif)";
		break;

		case "url(img/background_performance.gif)":
			oElement.style.backgroundImage = "url(img/background_performanceOn.gif)";
		break;

		case "url(img/background_TeamList.gif)":
			oElement.style.backgroundImage = "url(img/background_TeamListOn.gif)";
		break;

		case "url(img/background_Adherence.gif)":
			oElement.style.backgroundImage = "url(img/background_AdherenceOn.gif)";
		break;
		
		case "url(img/background_LineManagement.gif)":
			oElement.style.backgroundImage = "url(img/background_LineManagementOn.gif)";
		break;
		
		case "url(img/aheeva_tab_icon.gif)":
			oElement.style.backgroundImage = "url(img/aheeva_tab_icon_on.gif)";
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
		document.getElementById('stats').src="Resources_pages/rtaview.htm";//?startTime="+start+"&endTime="+end+"&spacing="+spacing+"";
	}
	else
	
	if(currentTab[0] == 'Logo')
	{
		document.getElementById('stats').src="Resources_pages/logo.html";
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
}

//-->


</SCRIPT>


</head>
<base target="rbottom">
<BODY class="toppagebody"  scroll="no"> 
<DIV ID="divTabButtons" >

  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
	  <td > 
        <INPUT TYPE="<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_AGENT_STATS") && userPreferences.elementAt(0).get("AGENT_STATS").compareTo("1")==0?"BUTTON":"HIDDEN"%>" ID=0 CLASS='tabOff' VALUE="<%=pageData.getWord("Agents")%>"  onClick='tabOnClick(0)' style='width:65px;background-image:url(img/background_Agents.gif);'></td>
	<td >
	<INPUT TYPE="<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_AGENT_STATS") && userPreferences.elementAt(0).get("AGENT_GROUP_STATS").compareTo("1")==0?"BUTTON":"HIDDEN"%>" ID=1 CLASS='tabOff' VALUE="<%=pageData.getWord("Agent Groups")%>"  onClick='tabOnClick(1)' style='width:110px;background-image:url(img/background_AgentsGroups.gif);'> 
	</td>
	<td>		
	<INPUT TYPE="<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_QUEUES_STATS") && userPreferences.elementAt(0).get("QUEUE_STATS").compareTo("1")==0?"BUTTON":"HIDDEN"%>" ID=2 CLASS='tabOff'  VALUE="<%=pageData.getWord("Queues")%>" onClick='tabOnClick(2)' style='width:80px;background-image:url(img/background_Queue.gif);'>	
	</td>
	<td >
	<INPUT TYPE="<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_CAMPAIGN_STATS") && userPreferences.elementAt(0).get("CAMPAIGN_STATS").compareTo("1")==0?"BUTTON":"HIDDEN"%>" ID=3 CLASS='tabOff'  VALUE="<%=pageData.getWord("Campaigns")%>" onClick='tabOnClick(3)' style='width:80px;background-image:url(img/background_Campaigns.gif);'> 	
	</td>
	<td width="">
	<INPUT TYPE="<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_CALLING_LIST_STATS") && userPreferences.elementAt(0).get("CALLING_LIST_STATS").compareTo("1")==0?"BUTTON":"HIDDEN"%>" ID=4 CLASS='tabOff'  VALUE="<%=pageData.getWord("Calling lists")%>"  onClick='tabOnClick(4)' style='width:95px;background-image:url(img/background_CallingList.gif);'>		
	</td>
	<td width="">
	<INPUT TYPE="<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_PERFOMANCE_STATS") && userPreferences.elementAt(0).get("PERFORMANCE_STATS").compareTo("1")==0?"BUTTON":"HIDDEN"%>" ID=5 CLASS='tabOff' VALUE="<%=pageData.getWord("Performance")%>" onClick='tabOnClick(5)' style='width:85px;background-image:url(img/background_performance.gif);'>	
	</td>
	<td width="">
	<INPUT TYPE="<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_TEAM_STATS") && userPreferences.elementAt(0).get("TEAMS_STATS").compareTo("1")==0?"BUTTON":"HIDDEN"%>" ID=6 CLASS='tabOff' VALUE="<%=pageData.getWord("Teams")%>"  onClick='tabOnClick(6)' style='width:65px;background-image:url(img/background_TeamList.gif);'>	
	</td>
	<td width="">
	<INPUT TYPE="<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_ADHERENCE_STATS") && userPreferences.elementAt(0).get("ADHERENCE_STATS").compareTo("1")==0?"BUTTON":"HIDDEN"%>" ID=7 CLASS='tabOff' VALUE="<%=pageData.getWord("adherence")%>" onClick='tabOnClick(7)' style='width:75px;background-image:url(img/background_Adherence.gif);'>
	</td>
	<td width="">
	<INPUT TYPE="<%=pageData.userHasRight(userPrivilegesDataResult, "ALLOW_VIEW_LINE_MANAGEMENT_STATS") && userPreferences.elementAt(0).get("LINE_MANAGEMENT_STATS").compareTo("1")==0?"BUTTON":"HIDDEN"%>" ID=8 CLASS='tabOff' VALUE="<%=pageData.getWord("Line management")%>" onClick='tabOnClick(8)' style='width:115px;background-image:url(img/background_LineManagement.gif);'>
	</td>
	<td > 
    <INPUT TYPE="BUTTON" ID=9 CLASS='tabOff' VALUE="&nbsp;"  onClick='tabOnClick(9)' style='width:25px;background-image:url(img/aheeva_tab_icon.gif);'></td>
	<td > 

	
	<td width="100%">&nbsp;
	</td>
	</tr>
	</table>
</DIV> 

<DIV ID="divTabFrame"><IFRAME ID="stats" name="stats" border="0" frameborder="0" CLASS="tabFrame" src="Resources_pages/topstats.jsp"></IFRAME></DIV>

<DIV id="divLoadingState">
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
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
