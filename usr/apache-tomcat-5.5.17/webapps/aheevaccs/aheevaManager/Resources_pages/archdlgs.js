// JavaScript Document
//Dialogs String

/* Just copy this template
var DLG_CTI_LIVE_STATS = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Cti Live Statistics</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 ''+
						 ''+
						 ''+
						 ''+
						 ''+
						 ''+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';
**/

var DLG_ADDNEWSITE = ''+
					 '<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="addNewSiteTitle" value=""></td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="smallText" id="newSiteName" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><input name="dlg_addsitetext" type="text" class="inputsmall"></td></tr>'+	
					 '<tr><td colspan="2" class="smallText" id="newSiteIntCodecName" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><select name="dlg_addsiteInternalCodec" class="inputsmall">'+
					 '<option></option>'+
					 '<option value="ulaw">u-law</option>'+
					 '<option value="alaw">a-law</option>'+
					 '<option value="gsm">GSM</option>'+
					 '<option value="ilbc">iLBC</option>'+
					 '<option value="speex">Speex</option></select></td></tr>'+
					 '<tr><td colspan="2" class="smallText" id="newSiteExtCodecName" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><select name="dlg_addsiteExternalCodec" class="inputsmall">'+
					 '<option></option>'+
					 '<option value="ulaw">u-law</option>'+
					 '<option value="alaw">a-law</option>'+
					 '<option value="gsm">GSM</option>'+
					 '<option value="ilbc">iLBC</option>'+
					 '<option value="speex">Speex</option></select></td></tr>'+	 
					 '<tr><td colspan="2" class="smallText" id="newSiteProxyHost" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><input name="dlg_addsiteProxyHost" type="text" class="inputsmall"></td></tr>'+	
					 '<tr><td colspan="2" class="smallText" id="newSiteProxyPort" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><input name="dlg_addsiteProxyPort" type="text" class="inputsmall"></td></tr>'+
					 '<tr><td colspan="2" align="center"><input type="button" id="newSiteSubmitBtn" value="" onClick="sendCreateSite()" class="smallbutton"></td></tr>'+
					 ''+
					 ''+
					 ''+
					 ''+
					 '</table>';
					 
var DLG_SITECFG = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap" id="siteCfgTitle" value=""></td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="smallText" id="siteCfgNameLbl" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><input name="dlg_sitecfgtext" type="text" class="inputsmall"></td></tr>'+
					 '<tr><td colspan="2" class="smallText" id="siteCfgIntCodecName" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><select name="dlg_updatesiteInternalCodec" class="inputsmall">'+
					 '<option></option>'+
					 '<option value="ulaw">u-law</option>'+
					 '<option value="alaw">a-law</option>'+
					 '<option value="gsm">GSM</option>'+
					 '<option value="ilbc">iLBC</option>'+
					 '<option value="speex">Speex</option></select></td></tr>'+
					 '<tr><td colspan="2" class="smallText" id="siteCfgExtCodecName" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><select name="dlg_updatesiteExternalCodec" class="inputsmall">'+
					 '<option></option>'+
					 '<option value="ulaw">u-law</option>'+
					 '<option value="alaw">a-law</option>'+
					 '<option value="gsm">GSM</option>'+
					 '<option value="ilbc">iLBC</option>'+
					 '<option value="speex">Speex</option></select></td></tr>'+
					 '<tr><td colspan="2" class="smallText" id="siteCfgProxyHost" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><input name="dlg_updatesiteProxyHost" type="text" class="inputsmall"></td></tr>'+	
					 '<tr><td colspan="2" class="smallText" id="siteCfgProxyPort" nowrap="nowrap"></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt"><input name="dlg_updatesiteProxyPort" type="text" class="inputsmall"></td></tr>'+
					 '<tr><td colspan="2" align="center"><input type="button" id="siteCfgSubmitBtn" value="" onclick="updateSite()" class="smallbutton">&nbsp;&nbsp;'+
					 '<input type="button" id="siteCfgDelBtn" value="" onclick="deleteSite()" class="smallbutton"></td></tr>'+
					 ''+
					 ''+
					 ''+
					 ''+
					 ''+
					 ''+
					 '</table>';
					 
var DLG_CTI_LIVE_STATS = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="ctiLiveStatTitle" value="" nowrap="nowrap"></td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td width="50%" class="smallText">&nbsp;</td><td width="25%" class="smallText" id="ctiLiveStatCfg" value="">'+
						         '<b></b></td><td width="25%" class="smallText" id="ctiLiveStatConn" value=""><b></b></td></tr>'+
						 '<tr><td class="smallText" id="ctiLiveStatMngLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText" align="center" id="dlg_ctistats_managers_confs"></td><td class="smallText" align="center" id="dlg_ctistats_managers_connected"></td></tr>'+
						 '<tr><td class="smallText" id="ctiLiveStatAgtLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText" align="center" id="dlg_ctistats_agents_confs"></td><td class="smallText" align="center" id="dlg_ctistats_agents_connected"></td></tr>'+
						 '<tr><td class="smallText" id="ctiLiveStatSwitchLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText" align="center" id="dlg_ctistats_switches_confs"></td><td class="smallText" align="center" id="dlg_ctistats_switches_connected"></td></tr>'+
						 '<tr><td class="smallText" id="ctiLiveStatRcdrSvrLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText" align="center" id="dlg_ctistats_recorders_confs"></td><td class="smallText" align="center" id="dlg_ctistats_recorders_connected"></td></tr>'+
						 '<tr><td class="smallText" id="ctiLiveStatEncrSvrLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText" align="center" id="dlg_ctistats_encryptors_confs"></td><td class="smallText" align="center" id="dlg_ctistats_encryptors_connected"></td></tr>'+
						 ''+
						 ''+
						 ''+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';
					 

var DLG_ADDNEW_SWITCH = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="addNewSwitchTitle" value="" nowrap="nowrap">'+
					 '</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" id="addNewSwitchSiteLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText"><select name="dlg_addnewswitch_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" id="addNewSwitchNameLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText"><input id="dlg_addnewswitch_name" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="addNewSwitchPwLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText"><input id="dlg_addnewswitch_password" type="password" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="addNewSwitch_iaxInterHostLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText"><input id="dlg_addnewswitch_host" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="addNewSwitch_iaxInterPortLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText"><input id="dlg_addnewswitch_port" type="text" value="4569" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addNewSwitch_iaxExterHostLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText"><input id="dlg_addnewswitch_exthost" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="addNewSwitch_iaxExterPortLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText"><input id="dlg_addnewswitch_extport" type="text" value="4569" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addNewSwitch_nbLineAvailForOutbndLbl" value="" nowrap="nowrap"></td>'+
						 '<td class="smallText"><input id="dlg_addnewswitch_numberoflines" type="text" value="" class="inputsmall" maxlength="10" style="width:40px; text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="addNewSwitch_agtLoadBalLbl" value=""  nowrap="nowrap">'+
						 '</td><td class="smallText"><input id="dlg_addnewswitch_agentloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;"></td>'+
						 '<td class="smallText" id="addNewSwitch_percentInSiteLbl" value="" nowrap="nowrap"></td></tr>'+
						 '<tr><td class="smallText" id="addNewSwitch_outbndLoadBalLbl" value="" nowrap="nowrap">'+
						 '</td><td class="smallText"><input id="dlg_addnewswitch_outboundloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" id="addNewSwitch_saveBtn" value="" onClick="sendCreateSwitch()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+
					 '</table>';


var DLG_MODIFY_SWITCH = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="modifySwitch_Title" value=""  nowrap="nowrap"></td>'+
					 //Modify Switch
					 //'</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" id="modifySwitch_siteLbl" value="" nowrap="nowrap">'+
						 //Site
						 '</td><td class="smallText"><select name="dlg_addnewswitch_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" id="modifySwitch_NameLbl" value="" nowrap="nowrap">'+
						//Name
						 '</td><td class="smallText"><input id="dlg_addnewswitch_name" disabled type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="modifySwitch_pwLbl" value="" nowrap="nowrap">'+
						// Password
						 '</td><td class="smallText"><input id="dlg_addnewswitch_password" type="password" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="modifySwitch_iaxInterHostLbl" value="" nowrap="nowrap">'+
						 //Iax Internal Host
						 '</td><td class="smallText"><input id="dlg_addnewswitch_host" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="modifySwitch_iaxInterPortLbl" value="" nowrap="nowrap">'+
						 //Iax Internal Port
						 '</td><td class="smallText"><input id="dlg_addnewswitch_port" type="text" value="4569" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifySwitch_iaxExHostLbl" value="" nowrap="nowrap">'+
						 // Iax External Host
						 '</td><td class="smallText"><input id="dlg_addnewswitch_exthost" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="modifySwitch_iaxExPortLbl" nowrap="nowrap">'+
						 //Iax External Port
						 '</td><td class="smallText"><input id="dlg_addnewswitch_extport" type="text" value="4569" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifySwitch_nbLineAvailForOutbndLbl" nowrap="nowrap">'+
						 // Number of lines available 
						 //'<br>for outbound
						 '</td><td class="smallText"><input id="dlg_addnewswitch_numberoflines" type="text" value="" class="inputsmall" maxlength="10" style="width:40px; text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="modifySwitch_agtLoadBalLbl" nowrap="nowrap">'+
						 //Agents load balance
						 '</td><td class="smallText"><input id="dlg_addnewswitch_agentloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;"></td>'+
						 '<td class="smallText" id="modifySwitch_percentInSiteLbl" nowrap="nowrap"></td></tr>'+
						 //in site
						 '</td></tr>'+
						 '<tr><td class="smallText" id="modifySwitch_OBLoadBalLbl" nowrap="nowrap">'+
						 //Outbound load balance
						 '</td><td class="smallText"><input id="dlg_addnewswitch_outboundloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" id="modifySwitch_updateBtn" value="" onClick="modifySwitch()">&nbsp;&nbsp;<input type="button" class="smallbutton" id="modifySwitch_delBtn" value="" onClick="deleteSwitch()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+
					 '</table>';
					 
					 
var DLG_SWITCH_STATS = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="swichStatsTitle" nowrap="nowrap">'+
					// Switch Statistics
					 '</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" id="swichStats_swNameLbl" nowrap="nowrap">'+
						 //Switch
						 '</td><td class="smallText" id="dlg_switch_stats_name" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 '<tr><td class="smallText" id="swichStats_statusLbl" nowrap="nowrap">'+
						 //Status
						 '</td><td class="smallText" id="dlg_switch_stats_status" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 '<tr><td class="smallText" id="swichStats_sinceLbl" nowrap="nowrap">'+
						 //Since
						 '</td><td class="smallText" id="dlg_switch_stats_statussince" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 '<tr><td class="smallText" id="swichStats_agentsLbl" nowrap="nowrap">'+
						 //Agents
						 '</td><td class="smallText" id="dlg_switch_stats_agents" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 '<tr><td class="smallText" id="swichStats_inboundCallsLbl" nowrap="nowrap">'+
						 //Inbound calls
						 '</td><td class="smallText" id="dlg_switch_statsinbound" style="text-align:center;" nowrap="nowrap"></td></tr>'+
 						 '<tr><td class="smallText" id="swichStats_outboundDialsLbl"  nowrap="nowrap">'+
						 //Outbound dials
						 '</td><td class="smallText" id="dlg_switch_stats_outbound" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 
						 '<tr><td class="smallText" id="swichStats_linesUsageLbl" nowrap="nowrap" colspan="2"></td></tr>'+
						 //Lines usage<br>'+
									//'<table cellpadding="0" cellspacing="0" width="100%">'+
									 '<tr><td class="smallText" align="left" id="dlg_switch_stats_used_lines"></td class="smallText"><td class="smallText" align="right" id="dlg_switch_stats_remaining_lines"></td></tr>'+
									 //'</table>'+
									 //'<table cellpadding="0" cellspacing="0" width="100%">'+
									 '<tr><td bgcolor="#330099" style="height:5px" id="dlg_switch_stats_used_lines_slide"></td><td bgcolor="#FFFFFF" style="height:5px" id="dlg_switch_stats_rem_lines_slide"></td></tr>'+
									 //'</table>'+
								//'</td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';
					 

var DLG_RECORDING_STATS = ''+
						'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 	'<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="recorderSvr_title" nowrap="nowrap">'+
						//Recording Server Statistics
						'</td>'+
					 	'<td align="right"><a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 	'<tr><td colspan="2" class="dialoginsidetxt">'+						
							//inside stuff
								'<table style="background-color:buttonface" border="0" width="100%">'+
								'<tr><td class="smallText" id="recorderSvr_serverNameLbl" nowrap="nowrap">'+
								//Server name
								'</td><td class="smallText" id="dlg_recordingsserver_stats_name" style="text-align:center;" nowrap="nowrap"></td></tr>'+
								'<tr><td class="smallText" id="recorderSvr_statusLbl" nowrap="nowrap">'+
								//Status 
								'</td><td class="smallText" id="dlg_recordingsserver_stats_status" style="text-align:center;" nowrap="nowrap"></td></tr>'+
								 '<tr><td class="smallText" id="recorderSvr_SinceLbl" nowrap="nowrap">'+
								 //Since
								 '</td><td class="smallText" id="dlg_recordingsserver_stats_statussince" style="text-align:center;" nowrap="nowrap"></td></tr>'+
								 '<tr><td class="smallText" id="recorderSvr_totalRecordingsLbl" nowrap="nowrap">'+
								 //Total recordings
								 '</td><td class="smallText" id="dlg_recordingsserver_stats_total_recordings" style="text-align:center;" nowrap="nowrap"></td></tr>'+
								 '<tr><td class="smallText" id="recorderSvr_dailyTotalRecordingsLbl" nowrap="nowrap">'+
								 //Daily Total recordings
								 '</td><td class="smallText" id="dlg_recordingsserver_stats_daily_recordings" style="text-align:center;" nowrap="nowrap"></td></tr>'+								 
								 '<tr><td class="smallText" id="recorderSvr_diskUsageLbl" nowrap="nowrap" colspan="2"></td></tr>'+
								 //Disk usage
								// '<br>'+
									//'<table cellpadding="0" cellspacing="0" width="100%">'+
									 '<tr><td class="smallText" align="left" id="dlg_recordingsserver_stats_used_disk"></td class="smallText"><td class="smallText" align="right" id="dlg_recordingsserver_stats_remaining_disk"></td></tr>'+
									 //'</table>'+
									 //'<table cellpadding="0" cellspacing="0" width="100%">'+
									 '<tr><td bgcolor="#330099" style="height:5px" id="dlg_recordingsserver_stats_used_disk_slide"></td><td bgcolor="#FFFFFF" style="height:5px" id="dlg_recordingsserver_stats_used_rem_slide"></td></tr>'+
									 //'</table>'+
								//'</td></tr>'+
								'</table>'+
							//~inside stuff
					 	'</td></tr>'+
					 	'</table>';
					 

var DLG_ADD_NEW_ENCRYPTION_SERVER = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="addEncrSvr_title" nowrap="nowrap">'+
					 //Add new encryption server
					 '</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" id="addEncrSvr_SiteLbl" nowrap="nowrap">'+
						 //Site
						 '</td><td class="smallText"><select name="dlg_addnewencryption_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" id="addEncrSvr_serverNameLbl" nowrap="nowrap">'+
						// Server Name
						 '</td><td class="smallText"><input name="dlg_addnewencryption_name" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addEncrSvr_protocolLbl" nowrap="nowrap">'+
						 //Protocol
						 '</td><td class="smallText"><select name="dlg_addnewencryption_protocol" class="inputsmall"><option></option>' +
						 //<option value="http">http</option>
						 '<option value="https">https</option></select></td></tr>'+
						 '<tr><td class="smallText" id="addEncrSvr_intnHostLbl" nowrap="nowrap">'+
						// Internal Host
						 '</td><td class="smallText"><input name="dlg_addnewencryption_host" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addEncrSvr_intnPortLbl" nowrap="nowrap">'+
						// Internal Port
						 '</td><td class="smallText"><input name="dlg_addnewencryption_port" value="9443" class="inputsmall" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addEncrSvr_extHostLbl" nowrap="nowrap">'+
						 //External Host
						 '</td><td class="smallText"><input name="dlg_addnewencryption_exthost" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addEncrSvr_extPortLbl" nowrap="nowrap">'+
						// External Port
						 '</td><td class="smallText"><input name="dlg_addnewencryption_extport" value="9443" class="inputsmall" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Url</td><td class="smallText"><input name="dlg_addnewencryption_url" class="inputsmall" value="/cgi-bin/enc_server.cgi" style="text-align:center"></td></tr>'+
						 ''+
						 ''+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" id="addEncrSvr_saveBtn" value="" onClick="sendCreateEncryption()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';
					 
					 

var DLG_MODIFY_ENCRYPTION_SERVER = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="modifyEncrSvr_title" nowrap="nowrap">'+
					 //Modify encryption server
					 '</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" id="modifyEncrSvr_SiteLbl" nowrap="nowrap">'+
						 //Site
						 '</td><td class="smallText"><select name="dlg_addnewencryption_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" id="modifyEncrSvr_serverNameLbl" nowrap="nowrap">'+
						 //Server Name
						 '</td><td class="smallText"><input name="dlg_addnewencryption_name" disabled class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifyEncrSvr_protocolLbl" nowrap="nowrap">'+
						// Protocol
						 '</td><td class="smallText"><select name="dlg_addnewencryption_protocol" class="inputsmall"><option></option>'+
						 //'<option value="http">http</option>'
						 '<option value="https">https</option></select></td></tr>'+
						 '<tr><td class="smallText" id="modifyEncrSvr_intnHostLbl" nowrap="nowrap">'+
						 //Internal Host
						 '</td><td class="smallText"><input name="dlg_addnewencryption_host" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifyEncrSvr_intnPortLbl" nowrap="nowrap">'+
						 //Internal Port
						 '</td><td class="smallText"><input name="dlg_addnewencryption_port" value="8443" class="inputsmall" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifyEncrSvr_ExtHostLbl" nowrap="nowrap">'+
						 //External Host
						 '</td><td class="smallText"><input name="dlg_addnewencryption_exthost" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifyEncrSvr_ExtPortLbl" nowrap="nowrap">'+
						// External Port//good up to here
						 '</td><td class="smallText"><input name="dlg_addnewencryption_extport" value="8443" class="inputsmall" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Url</td><td class="smallText"><input name="dlg_addnewencryption_url" class="inputsmall" value="/" style="text-align:center"></td></tr>'+
						 ''+
						 ''+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" id="modifyEncrSvr_saveBtn" value="" onClick="modifyEncryption()">&nbsp;&nbsp;<input type="button" class="smallbutton" id="modifyEncrSvr_DeleteBtn" value="" onClick="deleteEncryption()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';
					 
					 

var DLG_ADDNEW_RECORDING = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="addNewRecordingSvr_title" nowrap="nowrap">'+
					 //Add new recording server
					 '</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_SiteLbl" nowrap="nowrap">'+
						 //Site
						 '</td><td class="smallText"><select name="dlg_addnewrecorder_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_nameLbl" nowrap="nowrap">'+
						 //Name
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_name" type="text" value="" class="inputsmall" style="text-align:center;" onchange="setmountdir()"></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_passwordLbl" nowrap="nowrap">'+
						 //Password
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_password" type="password" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_intnHostLbl" nowrap="nowrap">'+
						 //Internal Host
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_host" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_intnPortLbl" nowrap="nowrap">'+
						 //Internal Port
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_port" type="text" value="4555" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_intnSecurePortLbl" nowrap="nowrap">'+
						//Internal Secure Port
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_secport" type="text" value="4560" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_ExtHostLbl" nowrap="nowrap">'+
						// External Host
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_exthost" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_ExtPortLbl" nowrap="nowrap">'+
						//External Port
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_extport" type="text" value="4555" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_ExtSecurePortLbl" nowrap="nowrap">'+
						 //External Secure Port
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_extsecport" type="text" value="4560" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_TomcatMountDirLbl" ></td><td class="smallText"><input id="dlg_addnewrecorder_tomcaturl" type="text" value="recordings/" class="inputsmall" style="text-align:center;"></td></tr>'+
						 //Tomcat Mount Dir. on Web server
						// ', $TOMCAT_DIR/webapps/aheevaccs/</td><td class="smallText"><input id="dlg_addnewrecorder_tomcaturl" type="text" value="mnt/" class="inputsmall" style="text-align:center;"></td></tr>'+
					     '<tr><td class="smallText" id="addNewRecordingSrv_recordDirFullPath_local_Lbl" nowrap="nowrap">'+
						 //recordingDirFullPath_local[lang]+//Recording Dir. full path(local)
						 '</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_Path" type="text" value="/usr/apache-tomcat-5.5.17/webapps/aheevaccs/recordings/" class="inputsmall" style="text-align:center;" onchange="fillsalesnosalesbox()"></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_recSalesDirLbl" nowrap="nowrap">'+
						 //Recording Sales Directory
						 '</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_salesPath" type="text" value="/usr/apache-tomcat-5.5.17/webapps/aheevaccs/recordings/sales/" class="inputsmall" style="text-align:center;" disabled></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_recNoSalesDirLbl" nowrap="nowrap">'+
						 //Recording NoSales Directory'
						 '</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_nosalesPath" type="text" class="inputsmall" value="/usr/apache-tomcat-5.5.17/webapps/aheevaccs/recordings/nosales/" style="text-align:center" disabled></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_dailySynchrLbl" nowrap="nowrap">'+
						 //Daily Synchronization
						 '</td><td align="center" class="smallText"><input type="checkbox" id="dlg_adddlg_addnewrecorder_activesync" onclick="abledisableoptions(this)" ></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_sendRecToLbl" nowrap="nowrap">'+
						 //Send recordings to//good up to here
						 '</td><td class="smallText"><select id="dlg_addnewrecorder_sendto" style="text-align:center"></select></td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_SynchrTimeHHmmLbl" nowrap="nowrap">'+
						 //Synchronization time(HH:mm)
						 '</td><td class="smallText"><input id="dlg_adnewrecorder_synctime" type="text" class="inputsmall" maxlength="5" style="width:40px; text-align:center" value="00:00"></td></tr>'+
						 						 
						 '<tr><td class="smallText" id="addNewRecordingSrv_agentsLoadBalLbl" nowrap="nowrap">'+
						 //Agents load balance
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_agentloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;"></td>'+
						 '<td class="smallText" id="addNewRecordingSrv_percentInSiteLbl" nowrap="nowrap"></td></tr>'+
						 //% in site</td></tr>'+
						 '</td></tr>'+
						 '<tr><td class="smallText" id="addNewRecordingSrv_maxDiskToUseLbl" nowrap="nowrap">'+
						 //Max. disk to use
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_maxdisktouse" type="text" value="100" class="inputsmall" maxlength="3" style="width:40px; text-align:center;">%</td></tr>'+						 
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" id="addNewRecordingSrv_saveBtn" value="'+
						// Save
						 '" onClick="sendCreateRecordingServer()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';


var DLG_MODIFY_RECORDING = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" id="modifyRecSvr_title" nowrap="nowrap">'+
					 //Modify recording server
					 '</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" id="modifyRecSvr_SiteLbl" nowrap="nowrap">'+
						 //Site
						 '</td><td class="smallText"><select name="dlg_addnewrecorder_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_NameLbl" nowrap="nowrap">'+
						 //Name
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_name" disabled type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_passwordLbl" nowrap="nowrap">'+
						// Password
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_password" type="password" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_intnHostLbl" nowrap="nowrap">'+
						 //Internal Host
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_host" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_intnPortLbl" nowrap="nowrap">'+
						 //Internal Port
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_port" type="text" value="4555" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_intnSecurePortLbl" nowrap="nowrap">'+
						 //Internal Secure Port
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_secport" type="text" value="4560" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_extHostLbl" nowrap="nowrap">'+
						 //External Host
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_exthost" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_extPortLbl" nowrap="nowrap">'+
						 //External Port
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_extport" type="text" value="4555" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_extSecurePortLbl" nowrap="nowrap">'+
						 //External Secure Port
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_extsecport" type="text" value="4560" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_TomcatMountDirLbl" ></td><td class="smallText"><input id="dlg_addnewrecorder_tomcaturl" type="text" value="mnt/" class="inputsmall" style="text-align:center;"></td></tr>'+
						 //Tomcat Mount Dir. on Web server
						 //', $TOMCAT_DIR/webapps/aheevaccs/</td><td class="smallText"><input id="dlg_addnewrecorder_tomcaturl" type="text" value="mnt/" class="inputsmall" style="text-align:center;"></td></tr>'+
					     '<tr><td class="smallText" id="modifyRecSvr_recDirAbsPath_local_lbl" nowrap="nowrap">'+
						 //Recording Dir. absolute path(local)
						 '</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_Path" type="text" value="/usr/apache-tomcat-5.5.17/webapps/aheevaccs/recordings" class="inputsmall" style="text-align:center;" onchange="fillsalesnosalesbox()"></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_recSalesDirLbl" nowrap="nowrap">'+
						 //Recording Sales Directory
						 '</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_salesPath" type="text" value="/usr/apache-tomcat-5.5.17/webapps/aheevaccs/recordings/sales/" class="inputsmall" style="text-align:center;" disabled></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_recNoSalesDirLbl" nowrap="nowrap">'+
						 //Recording NoSales Directory
						 '</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_nosalesPath" type="text" class="inputsmall" value="/usr/apache-tomcat-5.5.17/webapps/aheevaccs/recordings/nosales/" style="text-align:center" disabled></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_dailySynchrLbl" nowrap="nowrap">'+
						 //Daily Synchronization
						 '</td><td align="center" class="smallText"><input type="checkbox" id="dlg_adddlg_addnewrecorder_activesync" onclick="abledisableoptions(this)" ></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_sendRecToLbl" nowrap="nowrap">'+
						 //Send recordings to
						 '</td><td class="smallText"><select id="dlg_addnewrecorder_sendto" style="text-align:center"></select></td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_SynchrTimeHHmmLbl" nowrap="nowrap">'+
						 //Synchronization time(HH:mm)
						 '</td><td class="smallText"><input id="dlg_adnewrecorder_synctime" type="text" class="inputsmall" maxlength="5" style="width:40px; text-align:center" value="00:00"></td></tr>'+
						 				 
						 '<tr><td class="smallText" id="modifyRecSvr_agentsLoadBalLbl" nowrap="nowrap">'+
						 //Agents load balance
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_agentloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;"></td>'+
						 '<td class="smallText" id="modifyRecSvr_percentInSiteLbl" nowrap="nowrap"></td></tr>'+
						 //inSite[lang]+//in site
						 '</td></tr>'+
						 '<tr><td class="smallText" id="modifyRecSvr_maxDiskToUseLbl" nowrap="nowrap">'+
						// Max. disk to use
						 '</td><td class="smallText"><input id="dlg_addnewrecorder_maxdisktouse" type="text" value="100" class="inputsmall" maxlength="3" style="width:40px; text-align:center;">%</td></tr>'+				   						 
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" id="modifyRecSvr_modifyBtn" value="" onClick="sendModifyRecordingServer()">&nbsp;&nbsp;<input type="button" class="smallbutton" id="modifyRecSvr_delBtn" value="" onClick="sendDeleteRecordingServer()"></td></tr>'+
						// Modify
						 //'" onClick="sendModifyRecordingServer()">&nbsp;&nbsp;<input type="button" class="smallbutton" value="'+
						 //Delete
						 //'" onClick="sendDeleteRecordingServer()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';

/***
	Temp messages
**/
var DLG_TEMP_MESSAGES = ''+
					'<table class="dlgTable2" cellpadding="0" cellspacing="0">'+
						'<tr>'+
						'<td id="dlg_temp_messages" class="pleasewaitclass">'+
						''+
						''+
						''+
						'</td>'+
						'</tr>'+
					'</table>';
	
