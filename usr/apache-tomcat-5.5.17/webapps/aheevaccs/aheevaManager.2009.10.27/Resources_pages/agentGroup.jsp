<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "aheevaManager.ressources.*" %>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
	String agentGroupDbid = request.getParameter("dbid");
	String tenantDbid = request.getParameter("tenant_dbid");
	
	String userAssignedTenants = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='TENANT' AND RESSOURCE_DBID='"+tenantDbid+"')";
	String userAssignedAgentGroups = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='AGENTGROUP' AND RESSOURCE_DBID='"+agentGroupDbid+"')";
	String listAllowedUsersQuery = "SELECT U.DBID AS USER_DBID, USERNAME FROM cfg_user_authorize_ressources, cfg_user U "+
		"WHERE RESSOURCE_TYPE='AGENTGROUP' AND U.DBID = USER_DBID AND RESSOURCE_DBID='"+agentGroupDbid+"' ORDER BY USERNAME";
	String listNotAllowedUsersQuery = "SELECT DBID AS USER_DBID, USERNAME FROM cfg_user WHERE ALLOW_AGENT_GROUPS_MANAGEMENT='yes' AND state='1' "+
		"AND DBID NOT IN "+userAssignedAgentGroups+" AND DBID IN "+userAssignedTenants+" ORDER BY USERNAME";
	String userRightsQuery = "SELECT USERNAME, ALLOW_USER_MANAGEMENT, ALLOW_AGENT_GROUPS_MANAGEMENT,ALLOW_MESSAGE_CENTER_MANAGEMENT, ALLOW_MANAGER_SCREEN_MONITORING , ALLOW_MANAGER_AUDIO_MONITORING FROM cfg_user WHERE DBID='"+currentUserDbid+"'";

	String agentGroupSoftDataQuery = "SELECT BT_TRANSF_STATE,BT_CONF_STATE, ADD_PREFIX_TO_CALL, CALL_PREFIX,AGENT_MAX_LINES, REC_DEFAULT_CLIENT,REC_DEFAULT_CAMPAIGN, USE_ENCRYPTION, SCREEN_RECORDING "+
								" FROM cfg_agent_group WHERE TENANT_DBID='"+tenantDbid +"' AND DBID='"+agentGroupDbid+"' LIMIT 0,1";
							
	

	pageData.openConnection();
	pageData.executeFromString(listAllowedUsersQuery);
	Vector <HashMap> listAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(listNotAllowedUsersQuery);
	Vector <HashMap> listNotAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(userRightsQuery);
	Vector <HashMap> userRightsDataResult = pageData.CreateVectorFromBean();
	
	pageData.executeFromString(agentGroupSoftDataQuery);
	Vector <HashMap> agentGroupSoftDataResult = pageData.CreateVectorFromBean();	
	

	String currentUserName = (String)userRightsDataResult.elementAt(0).get("USERNAME");
	boolean userManagementAllowed = pageData.userHasRight(userRightsDataResult, "ALLOW_USER_MANAGEMENT");
	boolean isNewResource = agentGroupDbid.compareTo("") == 0;
	if(!pageData.userHasRight(userRightsDataResult, "ALLOW_AGENT_GROUPS_MANAGEMENT"))
	{ %>
		<jsp:forward page="forbidden.htm"/>
<%	} %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Language" content="en-us">
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {

}
form {
	margin:		0;
	padding:	0;
}
/* over ride styles from webfxlayout */
body {
	margin:		10px;
	width:		auto;
	height:		auto;
}
.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}
.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
}
.dynamic-tab-pane-control a:hover {
	background: transparent;
}
</style>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="agentGroupFunctions.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="javascript" type="text/javascript">
var currentUserDbid = <%=currentUserDbid%>;
var agentGroupDbid = "<%=agentGroupDbid%>";
var isNewResource = <%=isNewResource%>;
var agentGrpDBID       	= '';
var groupname          	= normalizeString(QueryString('grpName'));
var lastName           	= '';
var firstName          	= '';
var tenant_dbid		= "NULL";
var recordingRight      = '';




var nrows = 1 ;
var maxrow = 1;
var mopID = "";



// Statistiques
var sTring = String( appletObj.getAgentGroupsStats( normalizeString(QueryString('grpName')) ) );
sTringArray = sTring.split(",");

var grp_Name 		= sTringArray[0];
var grpCallHandled 	= sTringArray[1];
var grpCallInbound 	= sTringArray[2];
var grpCallOutbound = sTringArray[3];
var grpLoginAgents 	= sTringArray[4];
var grpTotalNotReady= sTringArray[5];
var grpTotalReady 	= sTringArray[6];
var grpTotalWaiting = sTringArray[7];
var grpTotalWrapUp 	= sTringArray[8];
var grpTotalDialing = sTringArray[9];
var grpTotalHold	= sTringArray[10];
var grpTotalConference = sTringArray[11];



//Softphone settings
var btTransfState='';
var btConfState='';
var addPref='';
var Prefix='';
var agmaxlines='';
var recdefcl='';
var recdefcmp='';

if(normalizeString(QueryString('grpName'))!='')
{
	btTransfState='<%if(agentGroupSoftDataResult.size()!=0) out.write((String)agentGroupSoftDataResult.elementAt(0).get("BT_TRANSF_STATE"));%>';
	btConfState='<%if(agentGroupSoftDataResult.size()!=0) out.write((String)agentGroupSoftDataResult.elementAt(0).get("BT_CONF_STATE"));%>';
	addPref='<%if(agentGroupSoftDataResult.size()!=0) out.write((String)agentGroupSoftDataResult.elementAt(0).get("ADD_PREFIX_TO_CALL"));%>';
	Prefix='<%if(agentGroupSoftDataResult.size()!=0) out.write((String)agentGroupSoftDataResult.elementAt(0).get("CALL_PREFIX"));%>';
	agmaxlines='<%if(agentGroupSoftDataResult.size()!=0) out.write((String)agentGroupSoftDataResult.elementAt(0).get("AGENT_MAX_LINES"));%>';
	recdefcl ='<%if(agentGroupSoftDataResult.size()!=0) out.write((String)agentGroupSoftDataResult.elementAt(0).get("REC_DEFAULT_CLIENT"));%>';
	recdefcmp='<%if(agentGroupSoftDataResult.size()!=0) out.write((String)agentGroupSoftDataResult.elementAt(0).get("REC_DEFAULT_CAMPAIGN"));%>';
}
</script>

<script language="javascript">
    // Associate a default button with pressing the Enter key
	function KeyDownHandler(btn)
    {
        // process only the Enter key
        if (event.keyCode == 13)
        {
            // cancel the default submit
            event.returnValue=false;
            event.cancel = true;
            // submit the form by programmatically clicking the specified button
            btn.click();
        }
    }

  function enableEncOpt() {
        if(!appletObj.getIsEncryptionServerAllowed()) {
                document.getElementById("encryptionEnable").checked  = false;
                document.getElementById("encryptionEnable").disabled = true;
        }
   }

</script>

</head>

<body class="bottompagebody" onLoad="displayAgentGroupInfo()">
<div class="tab-pane" id="tabPane1">
<form name="agentGroup" onKeyDown="KeyDownHandler(update)">
<% if(agentGroupDbid != ""){ %>
	<input type="hidden" name="contentUseEnc" id="contentUseEnc" value="<% out.write((String)agentGroupSoftDataResult.elementAt(0).get("USE_ENCRYPTION")); %>">
	<input type="hidden" name="contentUseEncRec" id="contentUseEncRec" value="<% out.write((String)agentGroupSoftDataResult.elementAt(0).get("SCREEN_RECORDING")); %>">
<% }else{ %>
	<input type="hidden" name="contentUseEnc" id="contentUseEnc" value="0">
	<input type="hidden" name="contentUseEncRec" id="contentUseEncRec" value="0">
<% }%>

<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
	<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><script>document.write(MultiArray["General"][lang]);</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<fieldset>
			<legend><script>document.write(MultiArray["General settings"][lang]);</script></legend>
            <table border="0">
              <tr>
                <td><label for="grpName"><script>document.write(MultiArray["Group name"][lang]);</script></label></td>
                <td align="left"><input type="text" name="grpName" id="grpName" onChange="enableUpdateButton()" size="20"></td>
              </tr>
              <tr>
                <td><label for="grpDescription"><script>document.write(MultiArray["Description"][lang]);</script></label></td>
                <td><textarea rows="3" name="grpDescription" id="grpDescription" cols="41" onChange="enableUpdateButton()"></textarea></td>
              </tr>
              <tr>
                <td><label for="grpQueue"><script>document.write(MultiArray["Associated queue"][lang]);</script></label></td>
                <td><input type="text" name="grpQueue" id="grpQueue" onChange="enableUpdateButton()"></td>
              </tr>
              <tr>
                <td colspan="2" align="left">
					<table align="left" width="100%">
						<tr align="left">
							<td>
								<label for="wrapUpTimeOut"><script>document.write(MultiArray["Wrap-up time out"][lang]);</script></label>
                    			<input name="wrapUpTimeOut" type="checkbox" id="wrapUpTimeOut" onClick="enableUpdateButton(); changeSecondWrapUpStatus()" value="">
							</td>
							<td width="2%">&nbsp;</td>
							<td>
								<input name="maxWrapUpTime" id="maxWrapUpTime" type="text" onChange="enableUpdateButton()" size="5" disabled>
								<script>document.write(MultiArray["seconds"][lang]);</script>
							</td>
							<td width="2%">&nbsp;</td>
							<td>
								<select name="ActionAfterTimeOut" id="ActionAfterTimeOut" onChange="enableUpdateButton()" disabled>
									<option value="NOT_READY"><script>document.write(MultiArray["Not ready"][lang]);</script></option>
									<option value="READY"><script>document.write(MultiArray["Ready"][lang]);</script></option>
									<option value="LOGGED_OUT">
									</option>
								</select>
								<script>document.write(MultiArray["Action after Time out"][lang]);</script>
							</td>
						</tr>
					</table>					
				</td>
              </tr>
              <tr>
                <td>
					<script>document.write(MultiArray["Max Wrap-up time For Productivity"][lang]);</script>
				</td>
                <td>
					<input type="text" id="maxWrapTimeForProductivity" name="maxWrapTimeForProductivity" onChange="enableUpdateButton()" size="5">&nbsp;
					<script>document.write(MultiArray["seconds"][lang]);</script>
				</td>
              </tr>
              <tr>
                <td height="25" colspan="2">
					<label for="grpState"><script>document.write(MultiArray["Active"][lang]);</script></label>
                    <input id="grpState" type="checkbox" name="grpState" value="ON" onClick="enableUpdateButton()" checked>
                </td>				
              </tr>
			  <tr>
			  	<td colspan="2">	
			  		<%
					String buttonTicket = "";
					if (agentGroupDbid != null && agentGroupDbid.length() > 0){
						 buttonTicket = "Update";
					}else{
						buttonTicket = "Save";
					}
					%>				
					<script>document.write("<input id=\"update\" name=\"updateInfo\" type=\"button\" value=\""+MultiArray["<%= buttonTicket %>"][lang]+"\" onClick=\"validateInfo()\">")</script>
					<script>document.write("<input name=\"deleteAgtGrp\" type=\"button\" value=\""+MultiArray["Delete"][lang]+"\" onClick=\"askDelete()\">")</script>
				</td>				
			  </tr>
            </table>
		</fieldset>
	</div>
	<div class="tab-page" id="tabAgents">
		<h2 class="tab"><script>document.write(MultiArray["Agents"][lang]);</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabAgents" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Agents configuration"][lang]);</script></legend>
		<table border="0">			
			<tr>
				<td>
					<table border="0" width="100%" height="58" cellspacing="0" cellpadding="0" bordercolor="#c0c0c0" style="BORDER-COLLAPSE: collapse">
						<tr>
							<td align="center" valign="middle" ><script>document.write(MultiArray["Agents assigned to "][lang] + groupname);</script></td>
							<td align="center">&nbsp;</td>
							<td align="center" valign="middle"><script>document.write(MultiArray["View agents from "][lang]);</script>
							<!-- Ici on doit ajouter un select box pour lister les agent groups -->
								<select size="1" name="AgentGroupSelection" onChange="filterGroupAgents();enableUpdateButton();">
								</select>
				
							<!-- -->
							</td>
						</tr>
						<tr height="10">
				<td width="197" height="25">
					<input id="agtlist" type="checkbox" name="orderView" value="ON" onClick="changeAgentListView(); enableUpdateButton()">
					<script>document.write(MultiArray["Show agent by ID"][lang]);</script>
				</td>
			</tr>
			</td>
						<td></td>
						<td></td>
						</tr>
						<tr>
							<td width="43%" height="52" align="center">
								<select style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 250px" name="availableAgentInGroup" size="10" multiple>
								</select>
							</td>
							<td width="11%" valign=middle height="52" bordercolordark="#c0c0c0" nowrap align="center">
								&nbsp;<img src="../img/left_to_right.gif" style="cursor:pointer " onClick="chkAndAddAgentToGroup()" />&nbsp;<br><br><br><br>
								&nbsp;<img src="../img/right_to_left.gif"  style="cursor:pointer " onClick="chkAndDropAgentFromGroup()"/>&nbsp;
							</td>
							<td width="288%" height="52" bordercolor="#000000" align="center">
								<select width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 250px" name="nonConfiguredAgents" size="10" multiple>
								</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</fieldset>
	</div>
	<div class="tab-page" id="tabNRR">
		<h2 class="tab"><script>document.write(MultiArray["Not-ready reasons"][lang]);</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabNRR" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Not-ready reasons configuration"][lang]);</script></legend>
			<table border="0">
				<tr>
					<td>
						<script language="javascript" type="text/javascript">
						document.write("<input id=\"addNRR\" name=\"addRowButton\" type=\"button\" value=\""+MultiArray["Add a new reason"][lang]+"\" onClick=\"addMyNotGlobalRow();enableUpdateButton()\">");</script>	
					</td>
					<td>&nbsp;</td>					
				</tr>
				<tr>
					<td>
						<div id="NRR_items" style="MARGIN: 0px 5px">
						</div>
					</td>
				</tr>				
			</table>
		</fieldset>
		<br><script language="javascript" type="text/javascript">document.write("<input id=\"update\" name=\"updateInfo\" type=\"button\" value=\""+MultiArray["Update"][lang]+"\" onClick=\"validateInfo()\">")</script>
	</div>

	<div class="tab-page" id="tabStarphone">
		<h2 class="tab"><script>document.write(MultiArray["SoftPhone"][lang]);</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabStarphone" ) );</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Softphone Settings"][lang]);</script></legend>
			<table border="0">           
			  <tr>			  
                <td height="10" colspan="2">
					<label for="grpEnableDialing"><script language="javascript" type="text/javascript">document.write(MultiArray["Enable Dialing"][lang]);</script></label>
                    <input id="grpEnableDialing" type="checkbox" name="grpEnableDialing" value="ON" onClick="enableDial();enableUpdateButton()" checked>
                </td>
				</tr>
				<tr>
					<td height="10" colspan="2">
						<label for="grpReadyButtonState"><script>document.write(MultiArray["Be ready after login"][lang]);</script></label>						
						<input id="grpReadyButtonState" type="checkbox" name="grpReadyButtonState" value="OFF" onClick="enableUpdateButton()">
					</td>					
              </tr>
			  <tr>
				<td height="10">
					<label for="callPrefix"><script>document.write(MultiArray["Prefix manual calls with"][lang]);</script></label>
				</td>
				<td>
					<input id="callPrefix" name="callPrefix" maxlength="10" size="10" onChange="enableUpdateButton();">
				</td>
			 </tr>
			 <tr>
			 	<td colspan="2">
					<fieldset>
					<legend><script language="javascript" type="text/javascript">document.write(MultiArray["AheevaPhone Settings"][lang]);</script></legend>
						<table>							
							 <tr>
								<td height="10">
									<label for="nbMaxLines"><script>document.write(MultiArray["Maximum lines per agent"][lang])</script></label>
								</td>
								<td>
									<select id="nbMaxLines" name="nbMaxLines" style="width:60">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="9">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="-1"><script language="javascript" type="text/javascript">document.write(MultiArray["Unlimited"][lang])</script></option>
									 </select>
								</td>
							</tr>
							<tr>
								<td height="10" colspan="2" width="100%"><!--Enable conference initiation and/or transfer-->
									<table>
										<tr>
											<td>
												<script language="javascript" type="text/javascript">document.write(MultiArray["Enable"][lang])</script>:&nbsp;
											</td>
											<td>
												<label for="enTransf"><script language="javascript" type="text/javascript">document.write(MultiArray["Transfer"][lang])</script></label>
												<input type="checkbox" id="enTransf" name="enTransf" checked="checked" onClick="enableDial();enableUpdateButton()">
											</td>
											<td>
												<label for="enConf"><script language="javascript" type="text/javascript">document.write(MultiArray["Initiate Conference"][lang])</script></label>
												<input type="checkbox" id="enConf" name="enConf" checked="checked" onClick="enableDial();enableUpdateButton()">&nbsp;
											</td>
										</tr>
									</table>					
								 </td>
							</tr>
						</table>
					</fieldset>
				</td>			  
			</tr>			
		</table>		
		</fieldset>
		<br>
		<script>document.write("<input id=\"update\" name=\"updateInfo\" type=\"button\" value=\""+MultiArray["Update"][lang]+"\" onClick=\"validateInfo()\">")</script>
	</div>

	<div class="tab-page" id="tabRecording">
		<h2 class="tab"><script>document.write(MultiArray["Recordings"][lang]);</script></h2>
		<script type="text/javascript">
			recordingRight = normalizeString(QueryString('recordingRight'));
			if( recordingRight != 'false')
				tp1.addTabPage( document.getElementById( "tabRecording" ) );
		</script>
		<fieldset>
		<legend><script>document.write(MultiArray["Recording options"][lang]);</script></legend>
		<table>
			<tr>
				<td>
					&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<fieldset style="width:300px; height:180px">
					<legend align="center"><script>document.write(MultiArray["Audio recording options"][lang]);</script></legend>
					<table>
						<tr>
							<td>
								<script>document.write(MultiArray["Enable audio recording"][lang]);</script>
							</td>
							<td>
								<input id="recording" type="checkbox" name="recordingsState" value="ON" onClick="enableUpdateButton();validateRecordings()" checked>
							</td>
						</tr>
						<tr height="10"><td>&nbsp;&nbsp;</td></tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Audio recordings stay local"][lang]);</script>
							</td>
							<td>
								<input id="local" type="checkbox" name="localRecording" value="ON" onClick="enableUpdateButton()">
							</td>
						</tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Encode audio recordings to MP3"][lang]);</script>
							</td>
							<td>
								<input id="mp3" type="checkbox" name="mp3Encoding" value="ON" onClick="enableUpdateButton();enableMp3Quality()" checked>
							</td>
						</tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Low quality MP3(smaller files)"][lang]);</script>
							</td>
							<td>
								<input type="radio" name="mp3Quality" value="low" onClick="enableUpdateButton()" checked>
							</td>
						</tr>
						<tr>
							<td>
								<script>document.write(MultiArray["High quality MP3(bigger files)"][lang]);</script>
								
							</td>
							<td>
								<input type="radio" name="mp3Quality" value="high" onClick="enableUpdateButton()">
							</td>
						</tr>
					</table>
					</fieldset>
				</td>
				<td>&nbsp;
					
				</td>
				<td>
					<fieldset style="width:300px; height:180px">
					<legend align="center"><script>document.write(MultiArray["Screen capture options"][lang]);</script></legend>
					<table>
						<tr>
							<td>
								<script>document.write(MultiArray["Enable screen capture"][lang]);</script>
							</td>
							<td>

							 <%   
							     if(pageData.userHasRight(userRightsDataResult, "ALLOW_MANAGER_SCREEN_MONITORING")) {
                                                        %>
								<input id='screenRecording' type='checkbox' name='screenRecording' value='ON' onClick='enableUpdateButton();validateRecordings();updateScreenCaptureBox()' > 
							<%
							      }else{
							 %>
								 <input id='screenRecording' type='checkbox' name='screenRecording' value='' disabled>
							 <%  } %>
							</td>
						</tr>
						<tr height="10"><td>&nbsp;&nbsp;</td></tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Recording percentage"][lang]);</script></td>
							<td>
								<% 
									if(pageData.userHasRight(userRightsDataResult, "ALLOW_MANAGER_SCREEN_MONITORING")) {
								%>							
										<select name='screenRecPer' onChange='enableUpdateButton()'>
											<option value='5'>5 %</option>
											<option value='10'>10 %</option>
											<option value='20'>20 %</option>
											<option value='25'>25 %</option>
											<option value='30'>30 %</option>
											<option value='35'>35 %</option>
											<option value='40'>40 %</option>
											<option value='45'>45 %</option>
											<option value='50' selected>50 %</option>
											<option value='55'>55 %</option>
											<option value='60'>60 %</option>
											<option value='65'>65 %</option>
											<option value='70'>70 %</option>
											<option value='75'>75 %</option>
											<option value='80'>80 %</option>
											<option value='85'>85 %</option>
										</select>
								<% 
									}else{
								%>
									<select name='screenRecPer' disabled>
										<option value='0'></option>
										<option value='5'>5 %</option>
                                                                                <option value='10'>10 %</option>
                                                                                <option value='20'>20 %</option>
                                                                                <option value='25'>25 %</option>
                                                                                <option value='30'>30 %</option>
                                                                                <option value='35'>35 %</option>
                                                                                <option value='40'>40 %</option>
                                                                                <option value='45'>45 %</option>
                                                                                <option value='50'>50 %</option>
                                                                                <option value='55'>55 %</option>
                                                                                <option value='60'>60 %</option>
                                                                                <option value='65'>65 %</option>
                                                                                <option value='70'>70 %</option>
                                                                                <option value='75'>75 %</option>
                                                                                <option value='80'>80 %</option>
                                                                                <option value='85'>85 %</option>

									</select>	
							 	<%
									}
								%>
							</td>
							<tr><td>
								
								<script>document.write(MultiArray["Compression level"][lang]);</script>
							</td><td>

								 <%
                                                                        if(pageData.userHasRight(userRightsDataResult, "ALLOW_MANAGER_SCREEN_MONITORING")) {
                                                                %>
									<select name='screenRecCompression' onChange='enableUpdateButton()'>
										<option value='0'>0</option>
										<option value='1'>1</option>
                                                                      		<option value='2'>2</option>
	                                                                      	<option value='3'>3</option>
                                                                      		<option value='4'>4</option>
                                                                      		<option value='5'>5</option>
                                                                      		<option value='6'>6</option>
                                                                      		<option value='7'>7</option>
                                                                      		<option value='8'>8</option>
                                                                      		<option value='9'>9</option>
                                                                 	</select>

								<% }else{ %>
									<select name='screenRecCompression' disabled>
										<option value=''></option>
                                                                                <option value='1'>1</option>
                                                                                <option value='2'>2</option>
                                                                                <option value='3'>3</option>
                                                                                <option value='4'>4</option>
                                                                                <option value='5'>5</option>
                                                                                <option value='6'>6</option>
                                                                                <option value='7'>7</option>
                                                                                <option value='8'>8</option>
                                                                                <option value='9'>9</option>

									</select>
								<%} %>

								<!-- <script>
                                				if(!appletObj.getIsScreenCaptureAllowed()) {
								   	document.write("<select name='screenRecCompression' disabled><option value='0'></option></select>");
									}else {
								   document.write("<select name='screenRecCompression' onChange='enableUpdateButton()'>");
                                                                      document.write("<option value='0'>0</option>");
                                                                      document.write("<option value='1'>1</option>");
                                                                      document.write("<option value='2'>2</option>");
                                                                      document.write("<option value='3'>3</option>");
                                                                      document.write("<option value='4'>4</option>");
                                                                      document.write("<option value='5'>5</option>");
                                                                      document.write("<option value='6'>6</option>");
                                                                      document.write("<option value='7'>7</option>");
                                                                      document.write("<option value='8'>8</option>");
                                                                      document.write("<option value='9'>9</option>");
                                                                  document.write("</select>");
								}
								</script> -->
							</td></tr>
							<!--
							<tr><td>
								<script>document.write(MultiArray["Colors"][lang]);</script>
							</td><td>
								
								<select name="screenRecColors" onChange="enableUpdateButton()">
									<option value="16b">16bits</option>
									<option value="32b">24bits</option>
								</select>
							</td></tr> -->
						</tr>
					</table>
					</fieldset>
				</td>
			</tr>
			<tr height="10"><td>&nbsp;&nbsp;</td></tr>
			<tr>
				<td colspan="3">
					<fieldset style="width:610px">
					<legend align="center"><script>document.write(MultiArray["Audio and screen recording options"][lang]);</script></legend>
					<table>
						<tr>
							<td>
								<script>document.write(MultiArray["Enable encryption"][lang]);</script>
							</td>
							<td>
								 <script>
                                    if(appletObj.getIsEncryptionServerAllowed()) {
										document.write( " <input id='encryption' type='checkbox' name='encryptionEnable' value='ON' " + 
											 	 "  onClick='enableUpdateButton(); updateEncServerBox() '> "
										       	       );
									}else{
									 	document.write( " <input id='encryption' type='checkbox' name='encryptionEnable' value='' disabled> "); 	
									}
								</script>
							</td>
						</tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Encryption server"][lang]);</script>
							</td>
							<td>
								<%
                                                                        if(pageData.userHasRight(userRightsDataResult, "ALLOW_MANAGER_AUDIO_MONITORING")) {
                                                                %>
										<select name="encServer" onChange="enableUpdateButton()" disabled></select>
								<% }else{ %>
										<select name="encServer" disabled><option value=''></option></select>
								<% }  %>
							</td>
						</tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Encryption method"][lang]);</script>
							</td>
							<td>
								<% 
									//if(pageData.userHasRight(userRightsDataResult, "ALLOW_MANAGER_AUDIO_MONITORING")) {
								%>	
										<select name="encMethod" onChange="enableUpdateButton()" disabled>
                                                                        		<option value="" selected> </option>
                                                                        		<option value="AES">AES</option>
                                                                        		<!-- <option value="MyAES"  disabled="disabled">MyAES</option> -->
                                                                        		<!-- <option value="DES3" disabled="disabled">DES3</option> -->
                                                                		</select>
								<%
								//	}else {
								%>
								<!-- 		 <select name="encMethod"  disabled><option value=''></option></select> -->
								<%
								 //     }
								%>
								
							<!--	<select name="encMethod" onChange="enableUpdateButton()" disabled>
									<option value="" selected> </option>
									<option value="AES">AES</option>
									<option value="MyAES"  disabled="disabled">MyAES</option>
									<option value="DES3" disabled="disabled">DES3</option>
								</select>  -->
							</td>
						</tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Minimum Recording Time"][lang]);</script>
							</td>
							<td>
								<select name="minRecTime" onChange="enableUpdateButton()">
									<option value="0">0 sec</option>
									<option value="5">5 secs</option>
									<option value="10">10 secs</option>
									<option value="15">15 secs</option>
									<option value="20">20 secs</option>
									<option value="25">25 secs</option>
									<option value="30" selected>30 secs</option>
									<option value="35">35 secs</option>
									<option value="40">40 secs</option>
									<option value="45">45 secs</option>
									<option value="50">50 secs</option>
									<option value="55">55 secs</option>
									<option value="60">60 secs</option>
									<option value="65">65 secs</option>
									<option value="70">70 secs</option>
									<option value="75">75 secs</option>
									<option value="80">80 secs</option>
									<option value="85">85 secs</option>
									<option value="90">90 secs</option>
									<option value="95">95 secs</option>
									<option value="100">100 secs</option>
									<option value="105">105 secs</option>
									<option value="110">110 secs</option>
									<option value="115">115 secs</option>
									<option value="120">120 secs</option>
									<option value="125">125 secs</option>
									<option value="130">130 secs</option>
									<option value="135">135 secs</option>
									<option value="140">140 secs</option>
									<option value="145">145 secs</option>
									<option value="150">150 secs</option>
									<option value="155">155 secs</option>
									<option value="160">160 secs</option>
									<option value="165">165 secs</option>
									<option value="170">170 secs</option>
									<option value="175">175 secs</option>
									<option value="180">180 secs</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Maximum Recording Time"][lang]);</script>
							</td>
							<td>
								<select name="maxRecTime" onChange="enableUpdateButton()">
									<option value="5">5 mins</option>
									<option value="10">10 mins</option>
									<option value="15">15 mins</option>
									<option value="20">20 mins</option>
									<option value="25">25 mins</option>
									<option value="30" selected>30 mins</option>
									<option value="35">35 mins</option>
									<option value="40">40 mins</option>
									<option value="45">45 mins</option>
									<option value="50">50 mins</option>
									<option value="55">55 mins</option>
									<option value="60">60 mins</option>
									<option value="65">65 mins</option>
									<option value="70">70 mins</option>
									<option value="75">75 mins</option>
									<option value="80">80 mins</option>
									<option value="85">85 mins</option>
									<option value="90">90 mins</option>
									<option value="95">95 mins</option>
									<option value="100">100 mins</option>
									<option value="105">105 mins</option>
									<option value="110">110 mins</option>
									<option value="115">115 mins</option>
									<option value="120">120 mins</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;&nbsp;
							</td>
						</tr>
						<tr>		
							<td><strong>
								<script>document.write(MultiArray["Recordings prefix name"][lang]);</script></strong>
							</td>
						</tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Campaign name"][lang]);</script> &nbsp;
							</td>
							<td>
								<input name="default_campaign_name" id="default_campaign_name" value="Campaign">
							</td>
						</tr>
						<tr>
							<td>
								<script>document.write(MultiArray["Client name"][lang]);</script>&nbsp;
							</td>
							<td>
								<input name="default_client_name_inbound" id="default_client_name_inbound" value="Client">
							</td>
						</tr>
						<tr>
							<td>
								<input style="visibility:hidden" name="default_client_name_outbound" id="default_client_name_outbound" value="ClientOutbound">
							</td>
						</tr>				
					</table>
					</fieldset>
				</td>
			</tr>
			<tr height="10"><td>&nbsp;&nbsp;</td></tr>
			<tr>
				<td>
					<script>document.write("<input id=\"update\" name=\"updateInfo\" type=\"button\" value=\""+MultiArray["Update"][lang]+"\" onClick=\"validateInfo()\">")</script>				
				</td>
			</tr>
			<tr height="10"><td>&nbsp;&nbsp;</td></tr>
		</table>
	
		</fieldset>
	</div>
	
<script>
if(userHasRight("ALLOW_WORK_FORCE_MANAGEMENT"))
{
	document.write('<div class="tab-page" id="tabPage5">');
		document.write('<h2 class="tab">');		
		document.write(MultiArray["Methods Of Payment"][lang]);
		document.write('</h2>');
		tp1.addTabPage( document.getElementById( "tabPage5" ) );
		document.write('<fieldset>');
		document.write('<legend>');
		document.write(MultiArray["Methods Of Payment info"][lang]);
		document.write('</legend>');
			document.write('<table border="0">');
			  document.write('<tr>');
			  	document.write('<td colspan="2" width="394" height="50">');
					document.write('<select onChange="enableUpdateButton()" name="MopSelection" >');
						document.write('<option value="">');
						document.write(MultiArray["Select MOP"][lang]);
						document.write('</option>');
					document.write('</select>');
				document.write('</td>');
			  document.write('</tr>');
			  document.write('<tr>');
			   document.write('<td width="197" height="50">');				
				document.write('</td>');
				  document.write('<td width="197" height="50">');				
					 document.write('</td>');
			  document.write('</tr>');
			document.write('</table>');
		document.write('</fieldset>');
		document.write('<br>');
		document.write("<input id=\"update\" name=\"updateInfo\" type=\"button\" value=\""+MultiArray["Update"][lang]+"\" onClick=\"validateInfo()\">");
	document.write('</div>');
}	
</script>
	<% if(userManagementAllowed) { %>
	<div class="tab-page" id="tabSecurity">
		<h2 class="tab"><%=pageData.getWord("Security")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabSecurity" ) );</script>
		<fieldset>
		<legend><%=pageData.getWord("Security settings")%></legend>
		<table border="0">
			<tr>
				<td><%=pageData.getWord("Not allowed users")%></td>
				<td>&nbsp;</td>
				<td><%=pageData.getWord("Allowed users")%></td>
			</tr>		
			<tr>
				<td align="center">
					<select id="notAllowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="notAllowedUsers" size="5" multiple="multiple">
					<%for(int i = 0; i < listNotAllowedUsersDataResult.size(); i++)
					{
						String userDbid = (String)listNotAllowedUsersDataResult.elementAt(i).get("USER_DBID");
						String userName = (String)listNotAllowedUsersDataResult.elementAt(i).get("USERNAME");
						if(userDbid.compareTo(currentUserDbid) != 0)
						{
					%>
						<option value="<%=userDbid%>"><%=userName%></option>
					<%	}
					} %>
					</select>
				</td>
				<td valign=middle>
					&nbsp;<img src="../img/left_to_right.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('notAllowedUsers', 'allowedUsers');enableUpdateButton()"/>&nbsp;<br>
					&nbsp;<img src="../img/right_to_left.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('allowedUsers', 'notAllowedUsers');enableUpdateButton()"/>&nbsp;
				</td>
				<td align="center">
					<select id="allowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="allowedUsers" size="5" multiple="multiple">
					<%for(int i = 0; i < listAllowedUsersDataResult.size(); i++)
					{
						String userDbid = (String)listAllowedUsersDataResult.elementAt(i).get("USER_DBID");
						String userName = (String)listAllowedUsersDataResult.elementAt(i).get("USERNAME");
					%>
						<option value="<%=userDbid%>"><%=userName%></option>
					<%}	
					if(isNewResource)
					{%>
						<option value="<%=currentUserDbid%>"><%=currentUserName%></option>
					<%}
					%>
					</select>
				</td>
			</tr>
		</table>
		</fieldset>
		<br>
		<script>document.write("<input id=\"update\" name=\"updateInfo\" type=\"button\" value=\""+MultiArray["update"][lang]+"\" onClick=\"validateInfo()\">")</script>
	</div>
	<% } %>	
</form>
</div>
</body>
<% pageData.closeConnection(); %>
</html>
