<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="com.mysql.jdbc.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="Manager.ressources.*"%>
<%
	
	beanManagerData pageData = new beanManagerData();
	String SCRIPT_DBID 		= "";
	String SCRIPT_TENANT 	= "";
	SCRIPT_DBID = (request.getParameter("script_dbid") != null) ? request.getParameter("script_dbid") : "";
	SCRIPT_TENANT = (request.getParameter("tenant_dbid") != null) ? request.getParameter("tenant_dbid") : "";
	
	String SCRIPT_TEXT 		= "''";
	
	
	if( SCRIPT_DBID.compareTo("") != 0 )
	{
		String getScriptTextQuery = "SELECT QUOTE(SCRIPT) AS SCRIPT_TEXT FROM cfg_routing_script WHERE DBID = '"+SCRIPT_DBID+"'";
		pageData.openConnection();	
		pageData.executeFromString(getScriptTextQuery);
		Vector <HashMap> getScriptTextDataResult = pageData.CreateVectorFromBean();
		pageData.closeConnection();		
		
		if ( getScriptTextDataResult.size() == 1 )
		{
			SCRIPT_TEXT = (String)getScriptTextDataResult.elementAt(0).get("SCRIPT_TEXT");	
			SCRIPT_TEXT = SCRIPT_TEXT.replaceAll("[\\n\\r\\f]"," ");	
		}
	
	}
	
	
%>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Routing Script</title>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="sbr_xWriter.js"></script>
<script language="javascript" type="text/javascript" src="sbr_xparse.js"></script>
<script language="javascript" type="text/javascript" src="sbr_xReader.js"></script>
<script language="javascript" type="text/javascript" src="sbr_ast_apps.js"></script>
<script language="javascript" type="text/javascript" src="sbr_shortcuts.js"></script>
<script language="javascript" type="text/javascript" src="sbr_validationMessages.js"></script>
				<!-- Boxes -->
<script language="javascript" type="text/javascript" src="sbr_box_callconditions.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_agentpickup.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_callend.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_connexionarrow.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_priority_inc.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_pbx_exec.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_getdtmf.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_sbrquery.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_switch_case.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_counter.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_get_stat.js"></script>
<script language="javascript" type="text/javascript" src="sbr_box_customserver.js"></script>
				<!-- ~Boxes -->
<script type="text/javascript" src="sbr_milonic_src.js"></script>
<script	type="text/javascript">
if(ns4)_d.write("<scr"+"ipt type=text/javascript src=sbr_mmenuns4.js><\/scr"+"ipt>");
else _d.write("<scr"+"ipt type=text/javascript src=sbr_mmenudom.js><\/scr"+"ipt>");
</script>

<script language="javascript" type="text/javascript" src="routingScriptFunctions.js"></script>

<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
</head>

<body class="bottompagebody" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<div class="sbrTitle"><b><script language="javascript" type="text/javascript">document.write(tenantName);</script> <script>document.write(MultiArray["ROUTING SCRIPT"][lang])</script></b></div>

<table class="sbrBigTable"><form name="theForm">
	<tr id="IDsbrToolTR" class="sbrToolBarTR">
	<!--
		<td class="sbrToolBar">&nbsp;
	  </td>
		<td class="sbrMenu" id="ID_CallCondition" onMouseClick="changeClassTo('sbrMenuOver', this);" onMouseOut="changeClassTo('sbrMenu', this);" onClick="addCallCondition()">
			Add Call Condition Test</td>
		<td class="sbrMenu" id="ID_AgentPickup" onMouseClick="changeClassTo('sbrMenuOver', this);" onMouseOut="changeClassTo('sbrMenu', this);" onClick="addPickMethod()">
			Add Agent PickUp Method</td>
		<td class="sbrMenu" id="ID_Link" onMouseClick="changeClassTo('sbrMenuOver', this);" onMouseOut="changeClassTo('sbrMenu', this);" onClick="addCallEnding()">
			Add Call Termination</td>
		<td class="sbrMenu" id="ID_Link" onMouseClick="changeClassTo('sbrMenuOver', this);" onMouseOut="changeClassTo('sbrMenu', this);" onClick="addLink()">
			Add Link</td>
		-->
		<td>&nbsp;</td>
		<td colspan="4">
			<script type="text/javascript" src="sbr_menu_data.js"></script>
		</td>
	</tr>
	<tr bgcolor="#F0F0F0">
		<td nowrap><input name="n_script_name" style="width:170px " alt="Script Name" onChange="enableSaving()"></td>
		<td height="20" colspan="3" align="left" nowrap>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr><td nowrap>
						<img src="../img/18_new.gif" height="20" width="20" style="cursor:pointer " onClick="menu_new_script()" alt="New Script">
						<img src="../img/open.gif" height="20" width="20" style="cursor:pointer " onClick="menu_new_open()" alt="Open Script">
						<img id="saveIMG" src="../img/save_disabled.gif" height="18" width="18" style="cursor:pointer " onClick="saveThisScript()" alt="Save Diagram">
						<img src="../img/deleted.gif" width="18" height="18" style="cursor:pointer " onClick="deleteWholeDiagram()" alt="Delete whole script">
						<img src="../img/barre_vert.gif" width="3" height="23">
						<!--
						<img src="../img/18_undo.gif" width="18" height="18" style="cursor:pointer " onClick="undoChanges()" alt="Undo last change">
						<img src="../img/18_redo.gif" width="18" height="18" style="cursor:pointer " onClick="redoChanges()" alt="Redo last change">
						-->
						<img src="../img/18_remove_link.gif" width="20" height="20" style="cursor:pointer " onClick="deleteArrow()" alt="Delete arrow">
						<img src="../img/eraser.gif" width="20" height="20" style="cursor:pointer " onClick="eraseDiagram()" alt="Erase diagram">
						<img src="../img/barre_vert.gif" width="3" height="23">
						<img src="../img/18_if_else.gif" width="20" height="20" style="cursor:pointer " onClick="addCallCondition()" alt="Add Call Condition">
						<img src="../img/18_switch_case.gif" width="20" height="20" style="cursor:pointer " onClick="addSwitchCase()" alt="Add Swicth">
						<img src="../img/20_user_headset.gif" width="20" height="20" style="cursor:pointer " onClick="addPickMethod()" alt="Add Agent Pickup Method">
						<img src="../img/call_up.gif" alt="Increase Call Priority" width="23" height="18" style="cursor:pointer " onClick="addPriorityInc()">
						<img src="../img/pbx_exec.gif" alt="Execute Application" width="17" height="18" style="cursor:pointer " onClick="addPbxExec()">
						<!--<img src="../img/18_onedigit.gif" alt="Get Digit" width="17" height="18" style="cursor:pointer " onClick="addGetDigit()">-->
						<img src="../img/18_string.gif" alt="Get Digit" width="17" height="18" style="cursor:pointer " onClick="addGetDigit()">
						<img src="../img/18_product.gif" alt="SQL Query" width="18" height="18" style="cursor:pointer " onClick="addSqlQuery()">
						<img src="../img/tarte.gif" alt="Get Statistic" width="18" height="18" style="cursor:pointer " onClick="addGetStatistic()">
						<img src="../img/18_phone_end.gif" alt="Terminate Call"  width="18" height="18" style="cursor:pointer " onClick="addCallEnding()">
						<img src="../img/18_links.gif" alt="link Boxes" width="18" height="18" style="cursor:pointer " onClick="addLink()">
						</td>
						<td align="right" nowrap><script>document.write(MultiArray["Priority"][lang])</script>
							<select name="priority" onChange="enableSaving()"><option value=""></option>
								<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
								<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
								<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
								<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
							</select>&nbsp;
						<script>document.write(MultiArray["Active"][lang])</script>
						<input name="active_box" type="checkbox" alt="Activate/Desactivate" onClick="enableSaving()"></td></tr>
				</table>
	  </td>

		<td height="20" colspan="1" align="right" nowrap>
			<img src="../img/stock_zoom_in.gif" width="20" height="20" alt="Zoom in" border="0" onClick="zoomIn()" style="cursor:pointer ">
			<img src="../img/stock_zoom_out.gif" width="20" height="20" alt="Zoom out" border="0" onClick="zoomOut()" style="cursor:pointer ">
			<img src="../img/stock_zoom_fit.gif" width="20" height="20" alt="Fit" onClick="fit()" style="cursor:pointer "></td>
	</tr>
	<tr>
		<td colspan="5" class="sbrGrid" width="100%" height="100%">
		<div style="position:relative; overflow:scroll; width:100%; height:100%; top:0px; left:0px;" id="dCover"> 
          <div id="diagramInside" style="diagramClass" align="left"></div>
        </div>
		</td>
	</tr></form>
</table>


<form name="popUpForm">


<!--    _________ POPUP DIVISIONS _________     -->
	
  <div class="CCSetupDialog" id="CCSetupDialog"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr> 
        <td colspan="2" align="center" bgcolor="#6AA5D7"><b>
          <script>document.write(MultiArray["Call condition test [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Test"][lang])</script>
          #</td>
        <td id="CCSetupDialog_TD1"> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Call property"][lang])</script></td>
        <td> <select name="n_call_prop">
          </select> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Operator"][lang])</script></td>
        <td> <select name="n_call_link">
            <option value=""></option>
            <option value="=">=</option>
            <option value="<=">&le;</option>
            <option value="<">&lt;</option>
            <option value=">">&gt;</option>
            <option value=">=">&ge;</option>
            <option value="!=">!=</option>
            <option value="Like">
            <script>document.write(MultiArray["Like"][lang])</script>
            </option>
          </select> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Seek value"][lang])</script></td>
        <td><input name="n_seek_value" type="text" size="15"></td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
        <td> <script>document.write("<input name=\"Submit\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpCC()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input name=\"\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpCC()\">")</script> 
        </td>
      </tr>
    </table>
  </div>

	
  <div class="DTSetupDialog" id="DTSetupDialog"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr> 
        <td colspan="2" align="center" bgcolor="#CCCCCC"><b>
          <script>document.write(MultiArray["Get DTMF [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["ID"][lang])</script>
          #</td>
        <td id="DTSetupDialog_TD1"> </td>
      </tr>
      <tr> 
        <td><i>
          <script>document.write(MultiArray["Data name"][lang])</script>
          :</i></td>
        <td><input name="n_dtmf_data_name"></td>
      </tr>
      <tr> 
        <td><i>
          <script>document.write(MultiArray["Maximum length"][lang])</script>
          :</i></td>
        <td><input name="n_dtmf_max_length"></td>
      </tr>
      <tr> 
        <td><i>
          <script>document.write(MultiArray["Timeout"][lang])</script>
          :</i></td>
        <td><input name="n_dtmf_timeout" size="3">
          s &nbsp;<i>
          <script>document.write(MultiArray["Enders"][lang])</script>
          :</i> <input name="n_dtmf_enders" size="4" value="#">
        <td></td>
      </tr>
      <tr> 
        <td><i>
          <script>document.write(MultiArray["Default value"][lang])</script>
          :</i></td>
        <td><input name="n_dtmf_default_value"></td>
      </tr>
      <tr> 
        <td><i>
          <script>document.write(MultiArray["Voice message"][lang])</script>
          :</i></td>
        <td><input name="n_dtmf_voice_mess"></td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> <script>document.write("<input name=\"Submit\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpDT()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input name=\"\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpDT()\">")</script> 
        </td>
      </tr>
    </table>
  </div>


	
  <div class="CESetupDialog" id="CESetupDialog"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr> 
        <td colspan="2" align="center" bgcolor="#F5CDA0"><b>
          <script>document.write(MultiArray["Call Ending [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["ID"][lang])</script>
          #</td>
        <td id="CESetupDialog_TD1"> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Action"][lang])</script></td>
        <td> <select name="n_call_ending_action" onChange="CEDialogChange();">
            <option value=""></option>
            <option value="Hangup">
            <script>document.write(MultiArray["Hangup"][lang])</script>
            </option>
            <option value="SoftHangup">
            <script>document.write(MultiArray["Soft hangup"][lang])</script>
            </option>
            <option value="Transfer">
            <script>document.write(MultiArray["Transfer"][lang])</script>
            </option>
            <option value="VoiceMail">
            <script>document.write(MultiArray["Voicemail"][lang])</script>
            </option>
          </select> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Parameters"][lang])</script></td>
        <td> <input name="n_call_ending_param"> </td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
        <td> <script>document.write("<input name=\"Submit\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpCE()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input name=\"\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpCE()\">")</script> 
        </td>
      </tr>
    </table>
  </div>


  <div class="PMSetupDialog" id="PMSetupDialog"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr> 
        <td align="center" bgcolor="#6AA5D7"><b>
          <script>document.write(MultiArray["Agent pickup method [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td> <table width="100%" cellpadding="0" cellspacing="0">
            <td width="10%"><script>document.write(MultiArray["ID"][lang])</script>
              #</td>
            <td id="PMSetupDialog_id" width="90%"></td>
          </table></td>
      </tr>
      <tr> 
        <td> <table border="0" cellspacing="0" cellpadding=""="0">
            <tr> 
              <td> <input type="button" value="()" onClick="addThistoPMArea('()')"> 
                <script>document.write("<input  type=\"button\" value=\""+MultiArray["AND"][lang]+"\" onClick=\"addThistoPMArea(' AND ')\">")</script> 
                <script>document.write("<input  type=\"button\" value=\""+MultiArray["OR"][lang]+"\" onClick=\"addThistoPMArea(' OR ')\">")</script>	
              </td>
              <td> <select name="PMSetupDialog_AgentProps" onChange="if(this.value!='') addThistoPMArea(this.options[this.selectedIndex].text); changePMSetupInterface(this.value);">
                  <option value="">&nbsp;&nbsp;-- 
                  <script>document.write(MultiArray["Properties"][lang])</script>
                  --</option>
                  <option value="AgentGroup=">
					AgentGroup=
				  </option>
                  <option value="Agent=">
                    Agent=
				  </option>
                  <option value="">&nbsp;&nbsp;-- 
                  <script>document.write(MultiArray["Skills"][lang])</script>
                  --</option>
                  <script language="javascript" type="text/javascript">
									var allSkills = String(appletObj.getAllSkills(tenantDBID));
									allSkillsArray = allSkills.split("|");
									for(i = 0; i < allSkillsArray.length; i++)
									{
										parts = allSkillsArray[i].split(",");
										document.write('<option id="PMSetupDialog_SkillList_'+parts[0]+'" value="'+parts[0]+'">'+parts[1]+'</option>');
									}
									//alert("allSkills="+allSkills);
									</script>
                </select> 
                <!-- -->
              </td>
              <td id="PMSetupDialog_optionbuttons"> <input type="button" value="<" onClick="addThistoPMArea('&lt;')"> 
                <input type="button" value="=" onClick="addThistoPMArea('=')"> 
                <input type="button" value=">" onClick="addThistoPMArea('&gt;')"> 
              </td>
            </tr>
          </table></td>
      </tr>
      <tr> 
        <td> <i>
          <script>document.write(MultiArray["Minimum required"][lang])</script>
          </i><br> <textarea name="PMSetupDialog_mininumString" style="width:100% " rows="3" ></textarea> 
        </td>
      </tr>
      <tr> 
        <td> <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left"> <i>
                <script>document.write(MultiArray["Timeout"][lang])</script>
                :</i> <input name="PMSetupDialog_timeout" type="text" size="2" value="0">
                s &nbsp;&nbsp;&nbsp; </td>
              <td align="right"> <i>
                <script>document.write(MultiArray["Action during timeout"][lang])</script>
                :</i> <select name="PMSetupDialog_actionduringTimeout">
                  <option value=""></option>
                  <option value="MusicOnHold">
                  <script>document.write(MultiArray["On hold"][lang])</script>
                  </option>
                </select> </td>
            </tr>
          </table></td>
      </tr>
      <tr> 
        <td> <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left"> <i>
                <script>document.write(MultiArray["Tie breaker"][lang])</script>
                :</i> <select name="PMSetupDialog_tieBreaker">
                  <option value=""></option>
                  <option value="MostIdle">
                  <script>document.write(MultiArray["Most idle"][lang])</script>
                  </option>
                  <option value="LeastBusy">
                  <script>document.write(MultiArray["Least busy"][lang])</script>
                  </option>
                </select> </td>
              <td align="right"> <i>
                <script>document.write(MultiArray["Call priority"][lang])</script>
                :</i> <select name="PMSetupDialog_callPriority">
                  <option value=""></option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                </select> </td>
            </tr>
          </table></td>
      </tr>
      <tr> 
        <td> <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left"> <i>
                <script>document.write(MultiArray["Queue name"][lang])</script>
                :</i> <input name="PMSetupDialog_queuename" value="" size="8"> 
              </td>
              <td align="right"> <script>document.write("<input style=\"background-color:#F7F7F7; border:1px solid #000000\"  name=\"AgentPickupUrlButton\" type=\"button\" value=\""+MultiArray["Url"][lang]+"\" onClick=\"changeAgentPickupUrlButton()\">")</script>
                : 
                <input name="PMSetupDialog_url" value=""> </td>
            </tr>
          </table></td>
      </tr>
      <tr> 
        <td> <table width="100%" cellpadding="0" cellspacing="0">
            <tr> 
              <td colspan="2"><br>
                <script>document.write(MultiArray["Announcements active"][lang])</script>
                <input type="checkbox" name="PMSetupDialog_active_queue_announcements" onClick="activateAnnoucementOptions()"></td>
            </tr>
            <tr> 
              <td width="50%"><script>document.write(MultiArray["Start with announcement"][lang])</script>
                <input type="checkbox" name="PMSetupDialog_startwithannouncements"></td>
              <td width="50%"><script>document.write(MultiArray["Frequency"][lang])</script> 
                <input type="text" value="30" size="3" name="PMSetupDialog_announce_frequency">
                s</td>
            </tr>
            <tr> 
              <td colspan="2"><script>document.write(MultiArray["Announcement of current hold time"][lang])</script>
                <input type="checkbox" name="PMSetupDialog_announce_estimated_holdtime" onClick="activateAvgTimeBoxes()"></td>
            </tr>
            <tr> 
              <td colspan="2"><br>
                <i>
                <script>document.write(MultiArray["Voice messages"][lang])</script>
                :</i></td>
            </tr>
            <tr> 
              <td width="50%"><script>document.write(MultiArray["Thank you message"][lang])</script> 
                <br>
                <input type="text" name="PMSetupDialog_voicemess_thanksyouforyourpatience"></td>
              <!--<td width="50%">Message before distribute<br><input type="text" value="30" name="PMSetupDialog_voicemess_you_are"></td>-->
            </tr>
            <tr> 
              <td width="50%"><script>document.write(MultiArray["Current average time message"][lang])</script>
                <br>
                <input type="text" value="30" name="PMSetupDialog_voicemess_holdtime"></td>
              <td width="50%"><script>document.write(MultiArray["Minutes message"][lang])</script>
                <br>
                <input type="text" name="PMSetupDialog_voicemess_minutes"></td>
            </tr>
          </table></td>
      </tr>
      <tr> 
        <td align="center"> <script>document.write("<input name=\"Set\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpPM()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input name=\"Cancel\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpPM()\">")</script>	
        </td>
      </tr>
    </table>
  </div>

  <div class="PISetupDialog" id="PISetupDialog"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr> 
        <td align="center" bgcolor="#DCEBC7" colspan="2"><b>
          <script>document.write(MultiArray["Priority increment [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["ID"][lang])</script>
          #</td>
        <td id="PISetupDialog_id"></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Add"][lang])</script></td>
        <td> <select name="PISetupDialog_callIncrement">
            <option value=""></option>
            <option value="1">+1</option>
            <option value="2">+2</option>
            <option value="3">+3</option>
            <option value="4">+4</option>
            <option value="5">+5</option>
            <option value="6">+6</option>
            <option value="7">+7</option>
            <option value="8">+8</option>
            <option value="9">+9</option>
            <option value="10">+10</option>
          </select> </td>
      </tr>
      <tr> 
        <td align="center" colspan="2"> <script>document.write("<input name=\"Set\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpPI()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input name=\"Cancel\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpPI()\">")</script> 
        </td>
      </tr>
    </table>
  </div>



  <div class="PESetupDialog" id="PESetupDialog"> 
    <table border="0" width="100%" cellpadding="1" cellspacing="0">
      <tr> 
        <td align="center" bgcolor="#C8D6D7" colspan="2"><b>
          <script>document.write(MultiArray["Applications execute [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["ID"][lang])</script>
          #</td>
        <td id="PESetupDialog_id"></td>
      </tr>
      <tr> 
        <td valign="top" width="35%"><script>document.write(MultiArray["Selected applications"][lang])</script></td>
        <td align="left"> <img src="../img/add.gif" width="16" height="16" class="img1" alt="Add Application" onClick="addAppToList()"> 
          <img src="../img/delete2.gif" width="16" height="16" class="img1" alt="Remove Application" onClick="removeAppFromList()"> 
          <img src="../img/arrowUp.gif" width="16" height="16" class="img1" alt="Move Application Up" onClick="moveAppUp()"> 
          <img src="../img/arrow_down.gif" width="16" height="16" class="img1" alt="Move Application Down" onClick="moveAppDown()"> 
        </td>
      </tr>
      <tr> 
        <td></td>
        <td> <select name="PESetupDialog_SelectsAppsList" size="5" style="width:100% ">
          </select> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Available applications"][lang])</script></td>
        <td> <select name="PESetupDialog_list_of_apps" style="width:100% " onChange="showAstAppsDescr()">
            <script language="javascript" type="text/javascript">
						var ast_app;
						for(ast_app in ast_apps_list)
						{
							document.write("<option value=\""+ast_app+"\">"+ast_app+"</option>");
						}
					</script>
          </select> </td>
      </tr>
      <tr> 
        <td class="PESetupAppDescr" id="PESetupDialog_descr"></td>
        <td valign="top"> <script>document.write(MultiArray["Parameters"][lang])</script>
          <br> <input name="PESetupDialog_AppParams"> </td>
      </tr>
      <tr> 
        <td align="center" colspan="2"> <script>document.write("<input name=\"Set\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpPE()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input name=\"Cancel\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpPE()\">")</script> 
        </td>
      </tr>
    </table>
  </div>

  <div class="SQSetupDialog" id="SQSetupDialog"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr> 
        <td colspan="2" align="center" bgcolor="#DECAB6"><b>
          <script>document.write(MultiArray["Database query [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td width="25%"><script>document.write(MultiArray["ID"][lang])</script>
          #</td>
        <td id="SQSetupDialog_TD1"> </td>
      </tr>
      <tr> 
        <td colspan="2"><i>
          <script>document.write(MultiArray["Call properties"][lang])</script>
          </i> <select name="SQSetupDialog_callprop" onChange="addTextToSQLField();">
          </select> </td>
      </tr>
      <tr> 
        <td colspan="2"><i>
          <script>document.write(MultiArray["MySQL query"][lang])</script>
          </i><br> <textarea name="SQSetupDialog_sql_query" style="width:100% " rows="3" ></textarea> 
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="right"><i>
          <script>document.write(MultiArray["Result name"][lang])</script>
          :</i>
          <input type="text" name="SQSetupDialog_varname"> </td>
      </tr>
      <tr> 
        <td align="center" colspan="2"> <script>document.write("<input name=\"Set\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpSQ()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input name=\"Cancel\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpSQ()\">")</script> 
        </td>
      </tr>
    </table>
  </div>


  <div class="SCSetupDialog" id="SCSetupDialog"> 
    <table border="0" width="100%" cellpadding="1" cellspacing="0">
      <tr> 
        <td align="center" bgcolor="#E8E0DB" colspan="2"><b>
          <script>document.write(MultiArray["Switch statement [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["ID"][lang])</script>
          #</td>
        <td id="SCSetupDialog_id"></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Properties"][lang])</script></td>
        <td> <select name="n_call_prop2">
          </select> </td>
      </tr>
      <tr> 
        <td valign="top" width="35%"><script>document.write(MultiArray["Values"][lang])</script></td>
        <td align="left"> <img src="../img/add.gif" width="16" height="16" class="img1" alt="Add Application" onClick="addSCValueToList()"> 
          <img src="../img/delete2.gif" width="16" height="16" class="img1" alt="Remove Application" onClick="removeSCValueFromList()"> 
          <img src="../img/arrowUp.gif" width="16" height="16" class="img1" alt="Move Application Up" onClick="moveSCValueUp()"> 
          <img src="../img/arrow_down.gif" width="16" height="16" class="img1" alt="Move Application Down" onClick="moveSCValueDown()"> 
        </td>
      </tr>
      <tr> 
        <td></td>
        <td> <select name="SCSetupDialog_SelectsSCValuesList" size="5" style="width:100% ">
          </select> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Operators"][lang])</script></td>
        <td> <select name="SCSetupDialog_list_of_SCValues">
            <option value=""></option>
            <option value="=">=</option>
            <option value="<=">&le;</option>
            <option value="<">&lt;</option>
            <option value=">">&gt;</option>
            <option value=">=">&ge;</option>
            <option value="!=">!=</option>
            <option value="Like">
            <script>document.write(MultiArray["Like"][lang])</script>
            </option>
          </select> </td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
        <td valign="top"> <script>document.write(MultiArray["Parameters"][lang])</script>
          <br> <input name="SCSetupDialog_SCValueParams"> </td>
      </tr>
      <tr> 
        <td align="center" colspan="2"> <script>document.write("<input name=\"Set\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpSC()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input name=\"Cancel\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpSC()\">")</script>	
        </td>
      </tr>
    </table>
  </div>


  <div class="COSetupDialog" id="COSetupDialog"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr> 
        <td colspan="2" align="center" bgcolor="#E1E8E3"><b>
          <script>document.write(MultiArray["Counter [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["ID"][lang])</script>
          #</td>
        <td id="COSetupDialog_TD1"> </td>
      </tr>
      <tr> 
        <td><i>
          <script>document.write(MultiArray["Data name"][lang])</script>
          :</i></td>
        <td><input name="n_counter_data_name" value=""></td>
      </tr>
      <tr> 
        <td><i>
          <script>document.write(MultiArray["Attached to"][lang])</script>
          :</i></td>
        <td> <input type="radio" name="n_conunter_attached_to" value="ROUTING_SCRIPT" onClick="disableTacker(0)">
          <script>document.write(MultiArray["Routing script"][lang])</script> 
          <input type="radio" name="n_conunter_attached_to" value="CALL" onClick="disableTacker(1)">
          <script>document.write(MultiArray["Call"][lang])</script> </td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
        <td><input type="checkbox" name="n_counter_track">
          <script>document.write(MultiArray["Show statistics"][lang])</script>
        <td></td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> <script>document.write("<input name=\"Submit\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpCO()\">")</script> 
          <script>document.write("<input name=\"\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpCO()\">")</script> 
          <script>document.write("<input name=\"\" type=\"button\" value=\""+MultiArray["Reset"][lang]+"\" onClick=\"ResetThisCounterStats()\">")</script> 
        </td>
      </tr>
    </table>
  </div>




  <div class="GSSetupDialog" id="GSSetupDialog"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr> 
        <td align="center" bgcolor="#D1D8C2"><b>
          <script>document.write(MultiArray["Get statistic [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td> <table width="100%" cellpadding="0" cellspacing="0">
            <td width="10%"><script>document.write(MultiArray["ID"][lang])</script>
              #</td>
            <td id="GSSetupDialog_id" width="90%"></td>
          </table></td>
      </tr>
      <tr> 
        <td> <table width="100%" cellpadding="0" cellspacing="0">
            <td width="10%"><script>document.write(MultiArray["Type"][lang])</script>
              :&nbsp;</td>
            <td width="90%"> <script>
							document.write('<select name="GSSetupDialog_Type" onChange="changeGSDataText(this.value); ">');
								document.write('<option value="">-- '+MultiArray["Queues statistics"][lang]+'--</option>');
								document.write('<option value="QUEUE_WAITING_CALLS">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Waiting calls"][lang]+'</option>');
								document.write('<option value="QUEUE_ENTERED_CALLS">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Calls entered"][lang]+'</option>');
								document.write('<option value="QUEUE_DISTRIBUTED_CALLS">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Calls distributed"][lang]+'</option>');
								document.write('<option value="QUEUE_ABANDONNED_CALLS">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Abandonned calls"][lang]+'</option>');
								document.write('<option value="QUEUE_LONGUESTWAITING_CALL">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Longest waiting call"][lang]+'</option>');
								document.write('<option value="QUEUE_SERVICE_FACTOR">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Service factor"][lang]+'</option>');
								document.write('<option value="QUEUE_CURRENT_AVG_WAITING_TIME">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Current average waiting time"][lang]+'</option>');
								document.write('<option value="QUEUE_AVG_WAITING_TIME">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Average waiting time"][lang]+'</option>');
								document.write('<option value="">-- '+MultiArray["Agents statistics"][lang]+'--</option>');
								document.write('<option value="GROUP_TOTAL_WAITING_AGENTS">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Waiting agents"][lang]+'</option>');
								document.write('<option value="GROUP_TOTAL_LOGIN_AGENTS">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Login agents"][lang]+'</option>');
								document.write('<option value="GROUP_TOTAL_CONFIGURED_AGENTS">&nbsp;&nbsp;&nbsp;&nbsp;'+MultiArray["Configured agents"][lang]+'</option>');
							document.write('</select>');
						</script> </td>
          </table></td>
      </tr>
      <tr> 
        <td id="GSSetupDialog_operators_td"> <script>
						GSSetupDialog_operators_table = '<table border="0" cellspacing="0" cellpadding=""="0">';
						GSSetupDialog_operators_table += '<tr>';
						GSSetupDialog_operators_table += '<td>';
						GSSetupDialog_operators_table += '<input type="button" value="()" onClick="addThistoGSArea(\'()\')">';
						GSSetupDialog_operators_table += '<input type="button"  value="'+MultiArray["AND"][lang]+'"  onClick="addThistoGSArea(\' AND \')">';
						GSSetupDialog_operators_table += '<input type="button" value="'+MultiArray["OR"][lang]+'"  onClick="addThistoGSArea(\' OR \')">';
						GSSetupDialog_operators_table += '</td>';
						GSSetupDialog_operators_table += '<td>';
						GSSetupDialog_operators_table += '<select name="GSSetupDialog_AgentProps" onChange="if(this.value!=\'\') addThistoGSArea(this.options[this.selectedIndex].text); changeGSSetupInterface(this.value);">';
						GSSetupDialog_operators_table += '<option value="">&nbsp;&nbsp;-- '+MultiArray["Properties"][lang]+'--</option>';
						GSSetupDialog_operators_table += '<option value="AgentGroup=">'+MultiArray["Agent group"][lang]+'=</option>';
						GSSetupDialog_operators_table += '<option value="">&nbsp;&nbsp;-- '+MultiArray["Skills"][lang]+'  --</option>';
						var allSkills = String(appletObj.getAllSkills(tenantDBID));
						if(allSkills.length != 0)
						{
							var allSkillsArray = allSkills.split("|");
							for(var i = 0; i < allSkillsArray.length; i++)
							{
								parts = allSkillsArray[i].split(",");
								GSSetupDialog_operators_table += '<option id="GSSetupDialog_SkillList_'+parts[0]+'" value="'+parts[0]+'">'+parts[1]+'</option>';
							}
						}
						GSSetupDialog_operators_table += '</select>';
						GSSetupDialog_operators_table += '<!-- -->';
						GSSetupDialog_operators_table += '</td>';
						GSSetupDialog_operators_table += '<td id="GSSetupDialog_optionbuttons">';
						GSSetupDialog_operators_table += '<input type="button" value="<" onClick="addThistoGSArea(\'&lt;\')">';
						GSSetupDialog_operators_table += '<input type="button" value="=" onClick="addThistoGSArea(\'=\')">';
						GSSetupDialog_operators_table += '<input type="button" value=">" onClick="addThistoGSArea(\'&gt;\')">';
						GSSetupDialog_operators_table += '</td>';
						GSSetupDialog_operators_table += '</tr>';
						GSSetupDialog_operators_table += '</table>';

						document.write(GSSetupDialog_operators_table);
					</script> </td>
      </tr>
      <tr> 
        <td id="GSSetupDialog_data_text"></td>
      </tr>
      <tr> 
        <td> <textarea name="GSSetupDialog_data" style="width:100% " rows="3" ></textarea> 
        </td>
      </tr>
      <tr> 
        <td> <script>document.write(MultiArray["Variable name"][lang])</script>
          : 
          <input name="GSSetupDialog_variable_name" value="" size="20"> </td>
      </tr>
      <tr> 
        <td align="center"> <script>document.write("<input name=\"Set\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpGS()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input name=\"Cancel\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpGS()\">")</script> 
        </td>
      </tr>
    </table>
  </div>


  <div class="CSSetupDialog" id="CSSetupDialog"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr> 
        <td colspan="2" align="center" bgcolor="#F0D7CA"><b>
          <script>document.write(MultiArray["Custom server [Setup]"][lang])</script>
          </b></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["ID"][lang])</script>
          #</td>
        <td id="CSSetupDialog_TD1"> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Library"][lang])</script></td>
        <td> <select name="n_custom_server_module" onChange="CSChangeModule(this.value);">
          </select> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Function"][lang])</script></td>
        <td> <select name="n_custom_server_function">
          </select> </td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Parameters"][lang])</script></td>
        <td> <input name="n_custom_server_param"> </td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
        <td> <script>document.write("<input name=\"Submit\" type=\"button\" value=\""+MultiArray["Set"][lang]+"\" onClick=\"submitSetUpCS()\">")</script> 
          <script>document.write("<input name=\"\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSetUpCS()\">")</script> 
        </td>
      </tr>
    </table>
  </div>

<!--    _________ OTHER DIVISIONS _________     -->

  <div class="TempMessages" id="TempMessages"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0" height="100%">
      <tr> 
        <td width="100%" id="TempMsg" align="center" class="TempMsg"> </td>
      </tr>
    </table>
  </div>


  <div class="extraDataMess" id="extraDataMess"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="0" height="100%">
      <tr> 
        <td width="100%" align="center" class="extraData" bgcolor="#FFFFFF"> <script>document.write(MultiArray["Enter extra data name"][lang])</script>
          :<br> <input name="n_extra_data" value="">
          <br> <script>document.write("<input class=\"button1\" type=\"button\" value=\""+MultiArray["Add"][lang]+"\" onClick=\"addAddExtraData(document.popUpForm.n_extra_data.value)\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input class=\"button1\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"cancelAddExtraData()\">")</script> 
        </td>
      </tr>
    </table>
  </div>
  <div class="CallPropertiesManager" id="CallPropertiesManager"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="2">
      <tr> 
        <td class="CallPropertiesManager1" align="center"><script>document.write(MultiArray["Call properties"][lang])</script></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Available properties"][lang])</script>
          <br> <select name="available_call_props" size="5" style=" width:100%">
          </select> </td>
      </tr>
      <tr> 
        <td> <script>document.write(MultiArray["New property"][lang])</script>
          <br> <input type="text" name="new_call_property"> <script>document.write("<input class=\"grayButton\" type=\"button\" value=\""+MultiArray["Add"][lang]+"\" onClick=\"addNewCallProperty()\">")</script> 
        </td>
      </tr>
      <tr> 
        <td align="center"> <script>document.write("<input class=\"grayButton\" type=\"button\" value=\""+MultiArray["Close"][lang]+"\" onClick=\"closeCallPropertiesManager()\">")</script> 
        </td>
      </tr>
    </table>
  </div>
  <div class="OpenScript" id="OpenScript"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="2">
      <tr> 
        <td class="CallPropertiesManager1" align="center"><script>document.write(MultiArray["Open script"][lang])</script></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Scripts"][lang])</script>
          <br> <select name="open_script_scripts" size="5" style=" width:100%">
          </select> </td>
      </tr>
      <tr> 
        <td align="center"> <script>document.write("<input class=\"grayButton\" type=\"button\" value=\""+MultiArray["Open"][lang]+"\" onClick=\"OpenThisScript()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input class=\"grayButton\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeOpenScript()\">")</script>	
        </td>
      </tr>
    </table>
  </div>
  <div class="SaveScriptAs" id="SaveScriptAs"> 
    <table border="0" width="100%" cellpadding="0" cellspacing="2">
      <tr> 
        <td class="CallPropertiesManager1" align="center"><script>document.write(MultiArray["Save script as"][lang])</script></td>
      </tr>
      <tr> 
        <td><script>document.write(MultiArray["Script name"][lang])</script>
          <br> <input type="text" name="save_as_text" value=""> <select name="save_as_scripts" size="5" style=" width:100%" onChange="document.popUpForm.save_as_text.value=this.options[this.selectedIndex].text">
          </select> </td>
      </tr>
      <tr> 
        <td align="center"> <script>document.write("<input class=\"grayButton\" type=\"button\" value=\""+MultiArray["Save as"][lang]+"\" onClick=\"SaveThisAsScript()\">")</script> 
          &nbsp;&nbsp; <script>document.write("<input class=\"grayButton\" type=\"button\" value=\""+MultiArray["Cancel"][lang]+"\" onClick=\"closeSaveScriptAs()\">")</script>	
        </td>
      </tr>
    </table>
  </div>

  <div class="ScriptStats" id="ScriptStats"> 
    <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
      <tr height="10"> 
        <td class="ScriptStats_title" id="ScriptStats_title" bgcolor="#3366CC"></td>
      </tr>
      <tr> 
        <td valign="top"> <div style="overflow:scroll " id="ScriptStats_inside"> 
          </div></td>
      </tr>
      <tr height="10"> 
        <td align="center"> 
          <script>document.write("<input class=\"grayButton\" type=\"button\" value=\""+MultiArray["Close"][lang]+"\" onClick=\"closeScriptStats()\">")</script>	
        </td>
      </tr>
    </table>
  </div>

  <div class="validationDiv" id="validationDiv"> 
    <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
      <tr height="10"> 
        <td bgcolor="#F2F2F2" align="center"><script>document.write(MultiArray["Whole script validation"][lang])</script></td>
      </tr>
      <tr> 
        <td valign="top"> <div style="overflow:auto; width:100%; height:150 " id="validationDiv_inside"> 
          </div></td>
      </tr>
      <tr height="10"> 
        <td align="center"> <script>document.write("<input class=\"grayButton\" type=\"button\" value=\""+MultiArray["Close"][lang]+"\" onClick=\"closeValidationDiv()\">")</script> 
        </td>
      </tr>
    </table>
  </div>

  <div class="helppopDiv" id="helppopDiv"> 
    <table>
      <tr>
        <td><iframe src="sbr_help.htm"></iframe></td>
      </tr>
      <tr>
        <td align="center"> <script>document.write("<input class=\"grayButton\" type=\"button\" value=\""+MultiArray["Close"][lang]+"\" onClick=\"hideHelp()\">")</script> 
        </td>
      </tr>
    </table>
  </div>
</form>

<!-- This IFrame is use to hide other -->
<IFRAME id="iframe_masque" name="iframe_masque"
style="position:absolute;display:none;" frameborder=0 scrolling=no marginwidth=0 src="" marginheight=0>
</iframe>


<script language="javascript" type="text/javascript">

	var curSkillString = <%=SCRIPT_TEXT%>;
	
	String(appletObj.getRoutingScript(script_dbid));
	
	//var curSkillString = "";
	String_to_Schema(curSkillString);

	refreshDiagramInside();
	document.theForm.n_script_name.value = script_name;
	if(script_is_active == '1')
		document.theForm.active_box.checked = true;
	else
		document.theForm.active_box.checked = false;
	chooseSelectObj("priority", script_priority);

	setupCustomServerModulesFucntions();
</script>
</body>

</html>
