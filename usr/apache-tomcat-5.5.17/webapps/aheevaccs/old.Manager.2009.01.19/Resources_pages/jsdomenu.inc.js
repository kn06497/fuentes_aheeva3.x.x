function createjsDOMenu() 
{
	ah_separator 	= new menuItem("-");

	/**** AGENTS ****/
	/* Main Menu */
	ah_AgtMenuObj 	= new jsDOMenu(150);
	ah_MenuAgtName 	= new menuItem("", "menu_AgtName", "", "", "jsdomenuitem_title", "jsdomenuitemover_title");	
	ah_AgtMenuObj.addMenuItem( ah_MenuAgtName );

	/* Agent Status change */
	ah_AgtMenuObj.addMenuItem( ah_separator );	
	if( userHasRight("ALLOW_MANAGER_CHANGE_AGENT_STATUS") )
	{
		ah_MenuSetAgtStatus = new menuItem(""+MultiArray["Change status"][lang]+" ", "menu_AgtStatus");
		ah_MenuSetAgtStatus_1 = new jsDOMenu(150);
		/**** For future use ******
		if( userHasRight("ALLOW_MANAGER_READY_AGENT") )
		{
			ah_MenuSetAgtStatus_ready = new menuItem("Ready", "menu_AgtStatus_ready", "javascript:forceAgentStatus('READY')", true);
			ah_MenuSetAgtStatus_1.addMenuItem( ah_MenuSetAgtStatus_ready );
		}
		
		if( userHasRight("ALLOW_MANAGER_NOT_READY_AGENT") )
		{
			ah_MenuSetAgtStatus_notready = new menuItem("Not Ready", "menu_AgtStatus_notready", "javascript:forceAgentStatus('NOT_READY')", true);
			ah_MenuSetAgtStatus_1.addMenuItem( ah_MenuSetAgtStatus_notready );
		}
		*/
		
		if( userHasRight("ALLOW_MANAGER_LOGGED_OUT_AGENT") )
		{
			ah_MenuSetAgtStatus_logout = new menuItem(""+MultiArray["Logged out"][lang]+"", "menu_AgtStatus_logout", "javascript:forceAgentStatus('LOGGED_OUT')", true);
			ah_MenuSetAgtStatus_1.addMenuItem( ah_MenuSetAgtStatus_logout );
			if(ah_MenuSetAgtStatus_1.items["menu_AgtStatus_logout"])
				ah_MenuSetAgtStatus_1.items.menu_AgtStatus_logout.showIcon("icon_logout");
		}
		
		if( userHasRight("ALLOW_MANAGER_LOGGED_OUT_AGENT") ) //if the user have at most one right on agent status
		{
			ah_AgtMenuObj.addMenuItem( ah_MenuSetAgtStatus );
			if(ah_AgtMenuObj.items["menu_AgtStatus"])
			{
				ah_AgtMenuObj.items["menu_AgtStatus"].setSubMenu(ah_MenuSetAgtStatus_1);
				ah_AgtMenuObj.items["menu_AgtStatus"].showIcon("icon_change_status");
			}
		}
	}

	/* Agent informations */
	ah_MenuSeeAgtInfos = new menuItem(""+MultiArray["Information"][lang]+" ", "menu_AgtInfos");
	ah_MenuSeeAgtInfos_1 = new jsDOMenu(175);
	
	ah_MenuSeeAgtInfos_ip = new menuItem("", "menu_AgtSeeInfosIP", "", true);
	ah_MenuSeeAgtInfos_host = new menuItem("", "menu_AgtSeeInfosHost", "", true);
	ah_MenuSeeAgtInfos_Asterisk = new menuItem("", "menu_AgtSeeInfosAsterisk", "", true);
	ah_MenuSeeAgtInfos_StarPhone = new menuItem("", "menu_AgtSeeInfosStarPhone", "", true);
	ah_AgtMenuObj.addMenuItem( ah_MenuSeeAgtInfos );	
	ah_MenuSeeAgtInfos_1.addMenuItem( ah_separator );
	ah_MenuSeeAgtInfos_1.addMenuItem( ah_MenuSeeAgtInfos_ip );
	ah_MenuSeeAgtInfos_1.addMenuItem( ah_MenuSeeAgtInfos_host );
	ah_MenuSeeAgtInfos_1.addMenuItem( ah_MenuSeeAgtInfos_Asterisk );
	ah_MenuSeeAgtInfos_1.addMenuItem( ah_MenuSeeAgtInfos_StarPhone );
	if(ah_AgtMenuObj.items["menu_AgtInfos"])
	{
		ah_AgtMenuObj.items["menu_AgtInfos"].setSubMenu(ah_MenuSeeAgtInfos_1);
		ah_AgtMenuObj.items["menu_AgtInfos"].showIcon("icon_informations");
		
		if(ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosIP"])
			ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosIP"].showIcon("icon_ip");
		if(ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosHost"])
			ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosHost"].showIcon("icon_host");
		if(ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosAsterisk"])
			ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosAsterisk"].showIcon("icon_switch");
		if(ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosStarPhone"])
			ah_MenuSeeAgtInfos_1.items["menu_AgtSeeInfosStarPhone"].showIcon("icon_aheevaphone");
	}

	/* Live monitoring */
	if(userHasRight("ALLOW_MANAGER_LIVE_MONITORING"))
	{
		ah_MenuSeeAgtMonitoring = new menuItem(""+MultiArray["Monitoring"][lang]+" ", "menu_AgtMonitor");
		ah_MenuSeeAgtMonitoring_1 = new jsDOMenu(150);
		ah_MenuSeeAgtMonitoring_listen = new menuItem(""+MultiArray["Listen live"][lang]+" ", "menu_AgtSeeMonitorListen", "javascript:startLiveMonitoring()", true);
		
		ah_MenuSeeAgtMonitoring_1.addMenuItem( ah_MenuSeeAgtMonitoring_listen );
		ah_AgtMenuObj.addMenuItem( ah_MenuSeeAgtMonitoring );
		
		if(ah_AgtMenuObj.items["menu_AgtMonitor"])
		{
			ah_AgtMenuObj.items["menu_AgtMonitor"].setSubMenu(ah_MenuSeeAgtMonitoring_1);
			ah_AgtMenuObj.items["menu_AgtMonitor"].showIcon("icon_monitoring");
		}
		
		if(ah_MenuSeeAgtMonitoring_1.items["menu_AgtSeeMonitorListen"])
			ah_MenuSeeAgtMonitoring_1.items["menu_AgtSeeMonitorListen"].showIcon("icon_listen_live");
	}

	/* Agent properties */
	if(userHasRight("ALLOW_AGENT_MANAGEMENT"))
	{
		ah_MenuSetAgtPorperties = new menuItem(""+MultiArray["Properties"][lang]+" ", "menu_AgtPorperties", "javascript:showAgentProps()");
		ah_AgtMenuObj.addMenuItem( ah_MenuSetAgtPorperties );
		if(ah_AgtMenuObj.items["menu_AgtPorperties"])
			ah_AgtMenuObj.items["menu_AgtPorperties"].showIcon("icon_props");	
	}

	setPopUpMenu(ah_AgtMenuObj);
  	activatePopUpMenuBy(1, 2);

	//Set a filter to enable the click only on the <td> lines with id specified
	ah_AgtFilter = new Array("td.agentStatsLine","IMG.*");
	ah_AgtMenuObj.setNoneExceptFilter(ah_AgtFilter);
	
	
	/**** AGENTS GROUPS ****/		
	ah_GrpMenuObj 	= new jsDOMenu(150);
	ah_MenuGrpName 	= new menuItem("", "menu_GrpName", "", "", "jsdomenuitem_title", "jsdomenuitemover_title");
	ah_GrpMenuObj.addMenuItem( ah_MenuGrpName );
	ah_GrpMenuObj.addMenuItem( ah_separator );
	if(userHasRight("ALLOW_MANAGER_CHANGE_AGENT_STATUS"))
	{
		ah_MenuSetGrpStatus = new menuItem(""+MultiArray["Change status"][lang]+"", "menu_GrpStatus");
		ah_MenuSetGrpStatus_1 = new jsDOMenu(150);
		/*****  For future use ******
		ah_MenuSetGrpStatus_ready = new menuItem("Ready", "menu_GrpStatus_ready", "javascript:forceGroupStatus('READY')", true);
		ah_MenuSetGrpStatus_notready = new menuItem("Not Ready", "menu_GrpStatus_notready", "javascript:forceGroupStatus('NOT_READY')", true);*/
		if(userHasRight("ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP"))
		{
			ah_MenuSetGrpStatus_logout = new menuItem(""+MultiArray["Logged out"][lang]+"", "menu_GrpStatus_logout", "javascript:forceGroupStatus('LOGGED_OUT')", true);
			ah_MenuSetGrpStatus_1.addMenuItem( ah_MenuSetGrpStatus_logout );
			if(ah_MenuSetGrpStatus_1.items["menu_GrpStatus_logout"])
			{
				ah_MenuSetGrpStatus_1.items["menu_GrpStatus_logout"].showIcon("icon_logout");
			}
		}
		
		/***** For future use *******
		ah_MenuSetGrpStatus_1.addMenuItem( ah_MenuSetGrpStatus_ready );
		ah_MenuSetGrpStatus_1.addMenuItem( ah_MenuSetGrpStatus_notready );
		ah_MenuSetGrpStatus_1.items.menu_GrpStatus_ready.showIcon("icon_ready");
		ah_MenuSetGrpStatus_1.items.menu_GrpStatus_notready.showIcon("icon_not_ready");*/
		
		ah_GrpMenuObj.addMenuItem( ah_MenuSetGrpStatus );

		if(ah_GrpMenuObj.items["menu_GrpStatus"])
			ah_GrpMenuObj.items["menu_GrpStatus"].setSubMenu(ah_MenuSetGrpStatus_1);
	}
		
	if(userHasRight("ALLOW_AGENT_GROUPS_MANAGEMENT"))
	{
		ah_MenuSetGrpPorperties = new menuItem(""+MultiArray["Properties"][lang]+" ", "menu_GrpPorperties", "javascript:showGroupProps()");
		
		ah_GrpMenuObj.addMenuItem( ah_MenuSetGrpPorperties );
		if(ah_GrpMenuObj.items["menu_GrpPorperties"])
			ah_GrpMenuObj.items.menu_GrpPorperties.showIcon("icon_props");
	}
	//setPopUpMenu(ah_GrpMenuObj);
	//activatePopUpMenuBy(1, 2);

	//Filter
	ah_GrpFilter = new Array("td.agentgroupStatsLine");
	ah_GrpMenuObj.setNoneExceptFilter(ah_GrpFilter);

	/**** CAMPAIGN ****/	
	/*
	ah_CamMenuObj 	= new jsDOMenu(150);
	ah_MenuCamName 	= new menuItem("", "menu_CamName", "", "", "jsdomenuitem_title", "jsdomenuitemover_title");
	ah_MenuSetCamMode = new menuItem("Change Mode", "menu_CamStatus");
	ah_MenuSetCamMode_1 = new jsDOMenu(150);
		ah_MenuSetCamMode_PREVIEW 	 = new menuItem("PREVIEW", "menu_CamMode_preview", "javascript:forceCampaignMode('PREVIEW')", true);
		ah_MenuSetCamMode_PROGRESSIVE= new menuItem("PROGRESSIVE", "menu_CamMode_progressive", "javascript:forceCampaignMode('PROGRESSIVE')", true);
		ah_MenuSetCamMode_PREDICTIVE = new menuItem("PREDICTIVE", "menu_CamMode_predictive", "javascript:forceCampaignMode('PREDICTIVE')", true);
		ah_MenuSetCamMode_BROADCAST	 = new menuItem("BROADCAST", "menu_CamMode_broadcast", "javascript:forceCampaignMode('BROADCAST')", true);
	
	ah_MenuSetCamRunning = new menuItem("Actions", "menu_CamRunning");
	ah_MenuSetCamRunning_1 = new jsDOMenu(150);
		ah_MenuSetCamRunning_LOAD 	= new menuItem("Load", "menu_CamRunning_load", "javascript:forceCampaignStatus('LOAD')", true);
		ah_MenuSetCamRunning_UNLOAD	= new menuItem("Unload", "menu_CamRunning_unload", "javascript:forceCampaignStatus('UNLOAD')", true);
		ah_MenuSetCamRunning_START 	= new menuItem("Start", "menu_CamRunning_start", "javascript:forceCampaignStatus('START')", true);
		ah_MenuSetCamRunning_STOP	= new menuItem("Stop", "menu_CamRunning_stop", "javascript:forceCampaignStatus('STOP')", true);
		
	
	ah_MenuSetCamPorperties = new menuItem("Properties", "menu_CamPorperties", "javascript:showCampaignProps()");
	ah_CamMenuObj.addMenuItem( ah_MenuCamName );
	ah_CamMenuObj.addMenuItem( ah_separator );
	ah_CamMenuObj.addMenuItem( ah_MenuSetCamMode );
		ah_MenuSetCamMode_1.addMenuItem( ah_MenuSetCamMode_PREVIEW );
		ah_MenuSetCamMode_1.addMenuItem( ah_MenuSetCamMode_PROGRESSIVE );
		ah_MenuSetCamMode_1.addMenuItem( ah_MenuSetCamMode_PREDICTIVE );
		ah_MenuSetCamMode_1.addMenuItem( ah_MenuSetCamMode_BROADCAST );
	ah_CamMenuObj.addMenuItem( ah_MenuSetCamRunning );
		ah_MenuSetCamRunning_1.addMenuItem( ah_MenuSetCamRunning_LOAD );
		ah_MenuSetCamRunning_1.addMenuItem( ah_MenuSetCamRunning_UNLOAD );
		ah_MenuSetCamRunning_1.addMenuItem( ah_MenuSetCamRunning_START );
		ah_MenuSetCamRunning_1.addMenuItem( ah_MenuSetCamRunning_STOP );
	ah_CamMenuObj.addMenuItem( ah_MenuSetCamPorperties );
			
	//setPopUpMenu(ah_CamMenuObj);
  	//activatePopUpMenuBy(1, 2);		
	ah_CamMenuObj.items["menu_CamStatus"].setSubMenu(ah_MenuSetCamMode_1);
	ah_CamMenuObj.items["menu_CamRunning"].setSubMenu(ah_MenuSetCamRunning_1);
	
	//Filter
	ah_CamFilter = new Array("td.campaignStatsLine");
	ah_CamMenuObj.setNoneExceptFilter(ah_CamFilter);
	*/
	//Icons...		
	/*
	ah_MenuSetCamStatus_1.items.menu_CamStatus_ready.showIcon("icon_ready");
	ah_MenuSetCamStatus_1.items.menu_CamStatus_notready.showIcon("icon_not_ready");
	ah_MenuSetCamStatus_1.items.menu_CamStatus_logout.showIcon("icon_logout");
	*/
	/*
	ah_CamMenuObj.items.menu_CamPorperties.showIcon("icon_props");
	ah_MenuSetCamRunning_1.items.menu_CamRunning_start.showIcon("icon_start");
	ah_MenuSetCamRunning_1.items.menu_CamRunning_stop.showIcon("icon_stop");
	ah_MenuSetCamRunning_1.items.menu_CamRunning_load.showIcon("icon_load");
	ah_MenuSetCamRunning_1.items.menu_CamRunning_unload.showIcon("icon_unload");
	*/
	
}
