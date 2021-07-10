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
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt">Add new site</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">Site Name<br><input name="dlg_addsitetext" type="text" class="inputsmall"></td></tr>'+
					 '<tr><td colspan="2" align="center"><input type="button" value="Submit" onClick="sendCreateSite()" class="smallbutton"></td></tr>'+
					 ''+
					 ''+
					 ''+
					 ''+
					 ''+
					 ''+
					 '</table>';

var DLG_SITECFG = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Site Configuration</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">Site Name<br><input name="dlg_sitecfgtext" type="text" class="inputsmall"></td></tr>'+
					 '<tr><td colspan="2" align="center"><input type="button" value="Submit" onclick="updateSiteName()" class="smallbutton">&nbsp;&nbsp;'+
					 '<input type="button" value="Delete" onclick="deleteSite()" class="smallbutton"></td></tr>'+
					 ''+
					 ''+
					 ''+
					 ''+
					 ''+
					 ''+
					 '</table>';
					 
var DLG_CTI_LIVE_STATS = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Cti Live Statistics</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td width="50%" class="smallText">&nbsp;</td><td width="25%" class="smallText"><b>Configured</b></td><td width="25%" class="smallText"><b>Connected</b></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Managers</td><td class="smallText" align="center" id="dlg_ctistats_managers_confs"></td><td class="smallText" align="center" id="dlg_ctistats_managers_connected"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Agents</td><td class="smallText" align="center" id="dlg_ctistats_agents_confs"></td><td class="smallText" align="center" id="dlg_ctistats_agents_connected"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Switches</td><td class="smallText" align="center" id="dlg_ctistats_switches_confs"></td><td class="smallText" align="center" id="dlg_ctistats_switches_connected"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Recording servers</td><td class="smallText" align="center" id="dlg_ctistats_recorders_confs"></td><td class="smallText" align="center" id="dlg_ctistats_recorders_connected"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Encryption servers</td><td class="smallText" align="center" id="dlg_ctistats_encryptors_confs"></td><td class="smallText" align="center" id="dlg_ctistats_encryptors_connected"></td></tr>'+
						 ''+
						 ''+
						 ''+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';
					 

var DLG_ADDNEW_SWITCH = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Add new switch</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" nowrap="nowrap">Site</td><td class="smallText"><select name="dlg_addnewswitch_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Name</td><td class="smallText"><input id="dlg_addnewswitch_name" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Password</td><td class="smallText"><input id="dlg_addnewswitch_password" type="password" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Iax Internal Host</td><td class="smallText"><input id="dlg_addnewswitch_host" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Iax Internal Port</td><td class="smallText"><input id="dlg_addnewswitch_port" type="text" value="4569" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Iax External Host</td><td class="smallText"><input id="dlg_addnewswitch_exthost" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Iax Internal Port</td><td class="smallText"><input id="dlg_addnewswitch_extport" type="text" value="4569" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Number of lines available <br>for outbound</td><td class="smallText"><input id="dlg_addnewswitch_numberoflines" type="text" value="" class="inputsmall" maxlength="10" style="width:40px; text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Agents load balance</td><td class="smallText"><input id="dlg_addnewswitch_agentloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;">% in site</td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Outbound load balance</td><td class="smallText"><input id="dlg_addnewswitch_outboundloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" value="Save" onClick="sendCreateSwitch()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+
					 '</table>';


var DLG_MODIFY_SWITCH = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Modify Switch</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" nowrap="nowrap">Site</td><td class="smallText"><select name="dlg_addnewswitch_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Name</td><td class="smallText"><input id="dlg_addnewswitch_name" disabled type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Password</td><td class="smallText"><input id="dlg_addnewswitch_password" type="password" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Iax Internal Host</td><td class="smallText"><input id="dlg_addnewswitch_host" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Iax Internal Port</td><td class="smallText"><input id="dlg_addnewswitch_port" type="text" value="4569" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Iax External Host</td><td class="smallText"><input id="dlg_addnewswitch_exthost" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Iax Internal Port</td><td class="smallText"><input id="dlg_addnewswitch_extport" type="text" value="4569" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Number of lines available <br>for outbound</td><td class="smallText"><input id="dlg_addnewswitch_numberoflines" type="text" value="" class="inputsmall" maxlength="10" style="width:40px; text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Agents load balance</td><td class="smallText"><input id="dlg_addnewswitch_agentloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;">% in site</td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Outbound load balance</td><td class="smallText"><input id="dlg_addnewswitch_outboundloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" value="Update" onClick="modifySwitch()">&nbsp;&nbsp;<input type="button" class="smallbutton" value="Delete" onClick="deleteSwitch()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+
					 '</table>';
					 
					 
var DLG_SWITCH_STATS = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Switch Statistics</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" nowrap="nowrap">Switch</td><td class="smallText" id="dlg_switch_stats_name" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Status</td><td class="smallText" id="dlg_switch_stats_status" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Since</td><td class="smallText" id="dlg_switch_stats_statussince" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Agents</td><td class="smallText" id="dlg_switch_stats_agents" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Inbound calls</td><td class="smallText" id="dlg_switch_statsinbound" style="text-align:center;" nowrap="nowrap"></td></tr>'+
 						 '<tr><td class="smallText" nowrap="nowrap">Outbound dials</td><td class="smallText" id="dlg_switch_stats_outbound" style="text-align:center;" nowrap="nowrap"></td></tr>'+
						 
						 '<tr><td class="smallText" nowrap="nowrap" colspan="2">Lines usage<br>'+
									'<table cellpadding="0" cellspacing="0" width="100%">'+
									 '<tr><td class="smallText" align="left" id="dlg_switch_stats_used_lines"></td class="smallText"><td class="smallText" align="right" id="dlg_switch_stats_remaining_lines"></td></tr>'+
									 '</table>'+
									 '<table cellpadding="0" cellspacing="0" width="100%">'+
									 '<tr><td bgcolor="#330099" style="height:5px" id="dlg_switch_stats_used_lines_slide"></td><td bgcolor="#FFFFFF" style="height:5px" id="dlg_switch_stats_rem_lines_slide"></td></tr>'+
									 '</table>'+
								'</td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';
					 

var DLG_RECORDING_STATS = ''+
						'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 	'<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Recording Server Statistics</td>'+
					 	'<td align="right"><a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 	'<tr><td colspan="2" class="dialoginsidetxt">'+						
							//inside stuff
								'<table style="background-color:buttonface" border="0" width="100%">'+
								'<tr><td class="smallText" nowrap="nowrap">Server name</td><td class="smallText" id="dlg_recordingsserver_stats_name" style="text-align:center;" nowrap="nowrap"></td></tr>'+
								'<tr><td class="smallText" nowrap="nowrap">Status</td><td class="smallText" id="dlg_recordingsserver_stats_status" style="text-align:center;" nowrap="nowrap"></td></tr>'+
								 '<tr><td class="smallText" nowrap="nowrap">Since</td><td class="smallText" id="dlg_recordingsserver_stats_statussince" style="text-align:center;" nowrap="nowrap"></td></tr>'+
								 '<tr><td class="smallText" nowrap="nowrap">Total recordings</td><td class="smallText" id="dlg_recordingsserver_stats_total_recordings" style="text-align:center;" nowrap="nowrap"></td></tr>'+
								 '<tr><td class="smallText" nowrap="nowrap">Daily Total recordings</td><td class="smallText" id="dlg_recordingsserver_stats_daily_recordings" style="text-align:center;" nowrap="nowrap"></td></tr>'+								 
								 '<tr><td class="smallText" nowrap="nowrap" colspan="2">Disk usage<br>'+
									'<table cellpadding="0" cellspacing="0" width="100%">'+
									 '<tr><td class="smallText" align="left" id="dlg_recordingsserver_stats_used_disk"></td class="smallText"><td class="smallText" align="right" id="dlg_recordingsserver_stats_remaining_disk"></td></tr>'+
									 '</table>'+
									 '<table cellpadding="0" cellspacing="0" width="100%">'+
									 '<tr><td bgcolor="#330099" style="height:5px" id="dlg_recordingsserver_stats_used_disk_slide"></td><td bgcolor="#FFFFFF" style="height:5px" id="dlg_recordingsserver_stats_used_rem_slide"></td></tr>'+
									 '</table>'+
								'</td></tr>'+
								'</table>'+
							//~inside stuff
					 	'</td></tr>'+
					 	'</table>';
					 

var DLG_ADD_NEW_ENCRYPTION_SERVER = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Add new encryption server</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" nowrap="nowrap">Site</td><td class="smallText"><select name="dlg_addnewencryption_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Server Name</td><td class="smallText"><input name="dlg_addnewencryption_name" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Protocol</td><td class="smallText"><select name="dlg_addnewencryption_protocol" class="inputsmall"><option></option><option value="http">http</option><option value="https">https</option></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Host</td><td class="smallText"><input name="dlg_addnewencryption_host" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Port</td><td class="smallText"><input name="dlg_addnewencryption_port" value="8443" class="inputsmall" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Host</td><td class="smallText"><input name="dlg_addnewencryption_exthost" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Port</td><td class="smallText"><input name="dlg_addnewencryption_extport" value="8443" class="inputsmall" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Url</td><td class="smallText"><input name="dlg_addnewencryption_url" class="inputsmall" value="/" style="text-align:center"></td></tr>'+
						 ''+
						 ''+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" value="Save" onClick="sendCreateEncryption()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';
					 
					 

var DLG_MODIFY_ENCRYPTION_SERVER = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Modify encryption server</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" nowrap="nowrap">Site</td><td class="smallText"><select name="dlg_addnewencryption_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Server Name</td><td class="smallText"><input name="dlg_addnewencryption_name" disabled class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Protocol</td><td class="smallText"><select name="dlg_addnewencryption_protocol" class="inputsmall"><option></option><option value="http">http</option><option value="https">https</option></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Host</td><td class="smallText"><input name="dlg_addnewencryption_host" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Port</td><td class="smallText"><input name="dlg_addnewencryption_port" value="8443" class="inputsmall" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Host</td><td class="smallText"><input name="dlg_addnewencryption_exthost" class="inputsmall" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Port</td><td class="smallText"><input name="dlg_addnewencryption_extport" value="8443" class="inputsmall" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Url</td><td class="smallText"><input name="dlg_addnewencryption_url" class="inputsmall" value="/" style="text-align:center"></td></tr>'+
						 ''+
						 ''+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" value="Save" onClick="modifyEncryption()">&nbsp;&nbsp;<input type="button" class="smallbutton" value="Delete" onClick="deleteEncryption()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';
					 
					 

var DLG_ADDNEW_RECORDING = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Add new recording server</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" nowrap="nowrap">Site</td><td class="smallText"><select name="dlg_addnewrecorder_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Name</td><td class="smallText"><input id="dlg_addnewrecorder_name" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Password</td><td class="smallText"><input id="dlg_addnewrecorder_password" type="password" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Host</td><td class="smallText"><input id="dlg_addnewrecorder_host" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Port</td><td class="smallText"><input id="dlg_addnewrecorder_port" type="text" value="4555" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Secure Port</td><td class="smallText"><input id="dlg_addnewrecorder_secport" type="text" value="4560" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Host</td><td class="smallText"><input id="dlg_addnewrecorder_exthost" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Port</td><td class="smallText"><input id="dlg_addnewrecorder_extport" type="text" value="4555" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Secure Port</td><td class="smallText"><input id="dlg_addnewrecorder_extsecport" type="text" value="4560" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Recording Sales Directory</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_salesPath" type="text" value="./recordings/sales/" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Recording NoSales Directory</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_nosalesPath" type="text" class="inputsmall" value="./recordings/nosales/" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Daily Synchronization</td><td align="center" class="smallText"><input type="checkbox" id="dlg_adddlg_addnewrecorder_activesync" onclick="abledisableoptions(this)" ></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Send recordings to</td><td class="smallText"><select id="dlg_addnewrecorder_sendto" style="text-align:center"></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Synchronization time</td><td class="smallText"><input id="dlg_adnewrecorder_synctime" type="text" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 
						 
						 '<tr><td class="smallText" nowrap="nowrap">Agents load balance</td><td class="smallText"><input id="dlg_addnewrecorder_agentloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;">% in site</td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Max. disk to use</td><td class="smallText"><input id="dlg_addnewrecorder_maxdisktouse" type="text" value="100" class="inputsmall" maxlength="3" style="width:40px; text-align:center;">%</td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" value="Save" onClick="sendCreateRecordingServer()"></td></tr>'+
						 '</table>'+
						//~~ inside stuff
					 '</td></tr>'+					 
					 '</table>';


var DLG_MODIFY_RECORDING = ''+
					'<table class="dlgTable"  cellpadding="0" cellspacing="0">'+
					 '<tr class="dialogtitle"><td align="left" class="dialogtitletxt" nowrap="nowrap">Modify recording server</td>'+
					 '<td align="right">'+
					 '<a href="javascript:dialogHide()"><img src="../img/close2.gif" border="0"></a></td></tr>'+
					 '<tr><td colspan="2" class="dialoginsidetxt">'+
					 	//inside stuff
						 '<table style="background-color:buttonface" border="0">'+
						 '<tr><td class="smallText" nowrap="nowrap">Site</td><td class="smallText"><select name="dlg_addnewrecorder_siteslist" class="inputsmall"></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Name</td><td class="smallText"><input id="dlg_addnewrecorder_name" disabled type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Password</td><td class="smallText"><input id="dlg_addnewrecorder_password" type="password" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Host</td><td class="smallText"><input id="dlg_addnewrecorder_host" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Port</td><td class="smallText"><input id="dlg_addnewrecorder_port" type="text" value="4555" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Internal Secure Port</td><td class="smallText"><input id="dlg_addnewrecorder_secport" type="text" value="4560" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Host</td><td class="smallText"><input id="dlg_addnewrecorder_exthost" type="text" value="" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Port</td><td class="smallText"><input id="dlg_addnewrecorder_extport" type="text" value="4555" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">External Secure Port</td><td class="smallText"><input id="dlg_addnewrecorder_extsecport" type="text" value="4560" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Recording Sales Directory</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_salesPath" type="text" value="./recordings/sales/" class="inputsmall" style="text-align:center;"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Recording NoSales Directory</td><td class="smallText"><input id="dlg_adddlg_addnewrecorder_nosalesPath" type="text" class="inputsmall" value="./recordings/nosales/" style="text-align:center"></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Daily Synchronization</td><td align="center" class="smallText"><input type="checkbox" id="dlg_adddlg_addnewrecorder_activesync" checked onclick="abledisableoptions(this)" ></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Send recordings to</td><td class="smallText"><select id="dlg_addnewrecorder_sendto" style="text-align:center"></select></td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Synchronization time</td><td class="smallText"><input id="dlg_adnewrecorder_synctime" type="text" class="inputsmall" maxlength="5" style="width:40px; text-align:center"></td></tr>'+
						 
						 
						 '<tr><td class="smallText" nowrap="nowrap">Agents load balance</td><td class="smallText"><input id="dlg_addnewrecorder_agentloadbalance" type="text" value="0" class="inputsmall" maxlength="3" style="width:40px; text-align:center;">% in site</td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">Max. disk to use</td><td class="smallText"><input id="dlg_addnewrecorder_maxdisktouse" type="text" value="100" class="inputsmall" maxlength="3" style="width:40px; text-align:center;">%</td></tr>'+
						 '<tr><td class="smallText" nowrap="nowrap">&nbsp;</td><td width="25%" class="smallText"><input type="button" class="smallbutton" value="Modify" onClick="sendModifyRecordingServer()">&nbsp;&nbsp;<input type="button" class="smallbutton" value="Delete" onClick="sendDeleteRecordingServer()"></td></tr>'+
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
	
