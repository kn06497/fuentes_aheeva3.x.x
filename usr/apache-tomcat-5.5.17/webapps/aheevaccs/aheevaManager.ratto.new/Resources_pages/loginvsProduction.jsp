<%@page contentType="text/html" language = "java"%>
<%@page import ="java.text.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.io.*"%>
<%@page import ="aheevaManager.wfm.*"%>
<%@page import ="java.util.StringTokenizer"%>
<%@page session="true"%>
<jsp:useBean id="beanAgentLoginProdReportObj" scope="session" class="aheevaManager.wfm.beanAgentLoginProdReport" />

<html>
<head>

<%

//if( beanAgentLoginProdReportObj == null )
	beanAgentLoginProdReportObj = new beanAgentLoginProdReport();
//else
	//System.out.println("beanAgentLoginProdReportObj already exists !");
	
beanAgentLoginProdReportObj.setTenantDBID(request.getParameter("tenant_dbid"));
String reportDate = request.getParameter("startDate");
String agentGroupId = request.getParameter("agentGroupId");
String thisDayIsClosed = request.getParameter("dayClosed");
String viewExceptions = request.getParameter("viewExceptionObj");

String fromDate = request.getParameter("dateFrom");
String toDate = request.getParameter("dateTo");

String tenant_dbid = request.getParameter("tenant_dbid");
String agentId = request.getParameter("agentId");
String submitRequest = request.getParameter("viewData");
String sessionParams = request.getParameter("sessionParams");
String submitRequest2 = request.getParameter("saveAddedRows");

StringTokenizer tok = null;
String[] agentList = null;
int numObjects = 0;


//if(sessionParams != null && sessionParams.compareTo("init") == 0)
//{
	beanAgentLoginProdReportObj.hasExtractData = false;
    beanAgentLoginProdReportObj.m_gAllDetails.clear();
	beanAgentLoginProdReportObj.m_AllExceptions.clear();
//}

%>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!-- -->
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" /> 
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" /> 
<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Language" content="en-us">
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}

form {
	margin:		0;
	padding:	0;
}
/* over ride styles from webfxlayout */
body {
	margin:		10px;
	width:		100%;
	height:		100%;
}
.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		100%;
}
.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		100%;
}
.dynamic-tab-pane-control a:hover {
	background: transparent;
}

</style>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script src="./prototype.js"></script>
<!-- Calendrier début -->
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->

<script language="javascript" type="text/javascript" src="loginvsProduction.js"></script>
<script language="javascript" type="text/javascript">
var tenant_dbid  = normalizeString(QueryString('tenant_dbid'));
var startDate = normalizeString(QueryString("startDate"));
var agentGroupId = normalizeString(QueryString("agentGroupId"));
var agentId = normalizeString(QueryString("agentId"));
var dataExtracted = normalizeString(QueryString("viewData")); //alert("data extracted:  "+dataExtracted);
var userid = appletObj.getCurrentUserDBID();



function fillCombos()
{
	document.getElementById('agtGrp').disabled = false;
	fillObjectCombo(document.getElementById('agtGrp'), document.getElementById('objects'), document.getElementById('Checkbox2'));
}

function getSelectedAgents()
{

	selectedObjects = new Array();
	for (i=document.agentHours.objects.selectedIndex;i<document.agentHours.objects.options.length;i++) {
  		if (document.agentHours.objects.options[i].selected) {
  			selectedObjects[selectedObjects.length]=document.agentHours.objects.options[i].value;
			if(i==0)//all agents 
				break;
  		}
  	}
        var url = '';
	if (selectedObjects.length > 0)
	{
		url= escape(selectedObjects.join('/'));
	}
   // alert("agent list : " + url);
	return url;
}

</script>
<%
out.write("<script>agentGroupId = '"+agentGroupId+"'</script>");
//out.write("<script>agentId = '"+agentId+"'</script>");
out.write("<script>tenant_dbid = '"+tenant_dbid+"'</script>");
out.write("<script>dataExtracted = '"+submitRequest+"'</script>");
out.write("<script>startDate = '"+reportDate+"'</script>");

%>
</head>


<body  class="bottompagebody" onLoad="fillCombos()">
<div class="tab-pane" id="tabPane1">
<form name="agentHours"  action="./loginvsProduction.jsp" method="post"  >
	<script type="text/javascript">
		tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</script>
	  <div class="tab-page" id="searchoptions">
	  	<h2 class="tab"><script>document.write(MultiArray["Daily hours"][lang]);</script></h2>

			<script type="text/javascript">
				tp1.addTabPage( document.getElementById( "searchoptions" ) );
			</script>
			<fieldset>
				<legend><script>document.write(MultiArray["Search options"][lang]);</script></legend>
				<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="1455">
					<tr>
						<td height="25" colspan="4">&nbsp;						</td>
					</tr>
					<tr>
						<td width="276" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">
							<b><script>document.write(MultiArray["Select a date"][lang]);</script> </b>						</td>
						<td width="9" ></td>
						<td width="288" style="border-top-style: none; border-top-width: 1">
							<input type="text" size="15" onFocus="showCalendar('',this,this,'','id_reportDate',0,30,1);this.blur()" onChange="<% sessionParams = "init";%>" name="reportDate" value="<%if((submitRequest != null) && submitRequest.compareTo("true") == 0) out.write(reportDate); else out.write("");%>"/>						</td>
						<td width="907">
							<script>document.write("<input disabled id=\"saveModified2\"  name=\"saveModified\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["Save modified"][lang]+"\" onClick=\"saveTheModified()\">");</script>
							<script>document.write("<input disabled id=\"closeThisDay\"  name=\"closeThisDay\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["Close this day"][lang]+"\" onClick=\"closeTheDay()\">");</script>&nbsp;&nbsp;<!--onClick="/*validatePassword();*/"-->						</td>
					</tr>
					<tr>
						<td width="276" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">
							<b><script>document.write(MultiArray["Select an agent group"][lang]);</script></b>						</td>
						<td width="9" ></td>
						<td width="288" style="border-top-style: none; border-top-width: 1">
							<select id="agtGrp" name="agtGrp" onChange="javascript:getAgentsInGroup(this,document.agentHours.objects,document.agentHours.Checkbox2)" class="contentText" >
								<option value="AllGroups">- <script>document.write(MultiArray["All groups"][lang]);</script> -</option>
							</select>						</td>
						<td valign="middle" >&nbsp;
							<b><script>document.write(MultiArray["Show agent by ID"][lang]);</script> <input type="checkbox" name="viewckbox" onClick="javascript:changeAgentListView(document.agentHours.agtGrp, document.agentHours.objects, this);" id="Checkbox2"></b>
							<script>//document.write("<input id=\"viewAgentsHours\"  name=\"viewAgentsHours\" type=\"button\"  value=\""+MultiArray["View data"][lang]+"\" onClick=\"extractAllData()\">");</script>
						</td>
					</tr>
					<tr>
						<td width="276" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">
							<b><script>document.write(MultiArray["Select an agent"][lang]);</script></b>						</td>
						<td width="9" ></td>
						<td width="288" id="id_reportDate" style="border-top-style: none; border-top-width: 1">
						
							<select id="objects" name="objects" multiple="multiple" class="contentText">
								<option value="AllAgents" selected>- <script>document.write(MultiArray["All agents"][lang]);</script> -</option>
							</select>						
						
						</td>
						<td valign="top">
		     <script>document.write("<input id=\"viewAgentsHours\"  name=\"viewAgentsHours\" type=\"button\"  value=\"   "+MultiArray["View data"][lang]+"   \" onClick=\"extractAllData()\">");</script>

						</td>
					</tr>
					<tr>
						<td height="25" colspan="4">&nbsp;						</td>
					</tr>
	 		</table>
  			</fieldset>
			<%

			//String userid = request.getParameter("userid");
			String userid = (String)session.getAttribute("CURRENT_USER_DBID");
			String userinfo = beanAgentLoginProdReportObj.getUserInfo(userid);
			String username = "", userrole = "";
			if(userinfo.indexOf("|") != -1)
			{
				username = userinfo.substring(0, userinfo.indexOf("|"));
				userrole = userinfo.substring(userinfo.indexOf("|")+1, userinfo.length());
			}

			String strToInsert = request.getParameter("strToInsertCell");
			String strToUpdate = request.getParameter("strToUpdateCell");

			if ((strToInsert == null && strToUpdate == null) || (strToInsert.compareTo("") == 0 && strToUpdate.compareTo("") == 0))
			{
			}
			else
			{
				String runningDate = request.getParameter("startDate");
				beanAgentLoginProdReportObj.saveAgentHours(userid, runningDate, strToInsert, strToUpdate, thisDayIsClosed);
				beanAgentLoginProdReportObj.hasExtractData = false;
			}
			if ((submitRequest != null) && submitRequest.compareTo("true") == 0)
			{
			%>
			<div  style="margin-right:20px ">
			<table border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			  <tr>
				<td align="center" width="100"><b><script>document.write(MultiArray["Agent ID"][lang]);</script></b></td>
				<td align="center" width="200"><b><script>document.write(MultiArray["Last name"][lang]);</script>, <script>document.write(MultiArray["First name"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Agent group"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Activity"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Login time"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Paid time"][lang]);</script></b></td>
				<td align="center" width="80"><b><script>document.write(MultiArray["Override"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Correction"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Override time"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Override cause"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Custom cause"][lang]);</script></b></td>
			  </tr>
			</table>
			</div>
			
			<%
			}
			%>
			<div id="tabDailyHours" style="overflow:scroll; height:500px"> <!--  style="display:none ">-->
				<%
				java.util.Vector allAgentsData = new Vector();
				if ((submitRequest != null) && submitRequest.compareTo("true") == 0)
				{
					reportDate = request.getParameter("startDate");
					agentGroupId = request.getParameter("agentGroupId");
					System.out.println("Inside tab DailyHours: -------------- agentGroupId: "+ agentGroupId);
					String agentIdInput = request.getParameter("agentId");
					System.out.println("agentId list: "+agentIdInput);
					boolean include_agents = true;
					
							
					//parse the input string of agent ids
					if(agentIdInput != ""){
						tok = new java.util.StringTokenizer(agentIdInput,"/");
					}else{
						tok = new java.util.StringTokenizer("","/");
					}
					numObjects = tok.countTokens();
					
					if(numObjects>0)
					{
						agentList = new String[numObjects];
						
						for (int w =0; w < numObjects; w++)
						{
							agentList[w] = tok.nextToken();
							System.out.println("agentId: "+agentList[w]);
						}
					}
					else
					{agentList[0] = "";}
					
					
					//Liste des agents actifs
					if (beanAgentLoginProdReportObj.hasExtractData == false)
					{
						String valeurRetour = beanAgentLoginProdReportObj.buildAgentGroupLoginProdReport(reportDate, include_agents);
						beanAgentLoginProdReportObj.calculateOverPaidNRR(reportDate);
						beanAgentLoginProdReportObj.calculateBillableNRRTime(reportDate);
						beanAgentLoginProdReportObj.hasExtractData = true;
					}
				}
				allAgentsData = (Vector)beanAgentLoginProdReportObj.m_gAllDetails;
				System.out.println("allAgentsData - size: "+allAgentsData.size());
				
				if(allAgentsData.size() > 0)
				{
					%>
					<script type="text/javascript">
						document.getElementById("closeThisDay").disabled = false;
						document.getElementById("saveModified2").disabled = false;
					</script>
					<%
				}
				
				beanAgentLoginProdInfo anAgentActivityData = new beanAgentLoginProdInfo();
				java.util.Vector agentsData = new Vector();
				
				//Filter by agent group and agent id ------------------------------------------
				
				if (agentId.compareTo("AllAgents") == 0 && agentGroupId.compareTo("AllGroups") == 0 )
				{
					for (int i = 0; i < allAgentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
						agentsData.add( anAgentActivityData );
					}
				}
				else if(agentId.compareTo("AllAgents") == 0 && agentGroupId.compareTo("AllGroups") != 0 )// 1 group, all agents
 				{
					for (int i = 0; i < allAgentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
						if (anAgentActivityData.grp_id.compareTo(agentGroupId) == 0)
							agentsData.add( anAgentActivityData );
					}
				}
				else if(agentId.compareTo("AllAgents") != 0 && agentGroupId.compareTo("AllGroups") == 0)//all groups, not all agents
				{
					for(int w=0; w < numObjects; w++)
					{
						for (int i = 0; i < allAgentsData.size(); i++)
						{
							anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
							if (anAgentActivityData.agt_id.compareTo(agentList[w]) == 0)
							{
								agentsData.add( anAgentActivityData );
							}
						}
					}//for(w=0; w<agentList.length(); w++)
				}
				else // 1 group, 1 or more agents
				{
					for(int w=0; w < numObjects; w++)
					{
						for (int i = 0; i < allAgentsData.size(); i++)
						{
							anAgentActivityData = (beanAgentLoginProdInfo)allAgentsData.elementAt(i);
							if (anAgentActivityData.grp_id.compareTo(agentGroupId) == 0 && anAgentActivityData.agt_id.compareTo(agentList[w]) == 0)
							{
								agentsData.add( anAgentActivityData );
							}
						}
					}//for(w=0; w<agentList.length(); w++)
				}//else
				// end filtering -----------------------------------------------
					%>
					<table border="0">
					<%
					String id_suff = "", already_modified = "", not_already_modified = "", supermodified = "";
					for (int i = 0; i < agentsData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)agentsData.elementAt(i);
						id_suff = anAgentActivityData.agt_id + "_" + anAgentActivityData.grp_id + "_" + anAgentActivityData.activity_type;
						if(anAgentActivityData.dayClosed == 0) // la journée est encore en cours
						{
							if (anAgentActivityData.override == 1)
								already_modified += id_suff + "|";
							else
								not_already_modified += id_suff + "|";
						}
						if(anAgentActivityData.dayClosed == 1) // la journée est déjà fermée
						{
							supermodified += id_suff + "|";
						}
					  if(i%2 ==0) {
					  %>
					  	<tr class="reportsRowPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
					  <%
					  } else {
					  %>
				  	  <tr class="reportsRowUnPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
                     <%
					 }
					 %>
						<td align="center" id="agentId_<%=id_suff%>" width="100"><%=anAgentActivityData.agt_id%></td>
						<td align="center" width="200">
							<script type='text/javascript'>document.write("<a href='../jsp/events_details.jsp?agentId=<%=anAgentActivityData.agt_id%>&curDate=<%=reportDate%>&lang=" + lang + "' target='_blank'>");</script>
								<%out.write(anAgentActivityData.last_name + ", " + anAgentActivityData.first_name); %>
							</a>
						</td>
						<td align="center" width="150"><%=anAgentActivityData.grp_name%></td>
						<td align="center" width="125" ><%=anAgentActivityData.activity_name%></td>
						<td align="center" width="125">
						  <input type="text" id="logintime<%=id_suff%>" name="logintime<%=id_suff%>" size="10" value="<%=anAgentActivityData.getTotalLoginTime()%>" disabled>
						</td>
						<td align="center" width="125"
							 onMouseOver="showPaidTimeDetails('<%=anAgentActivityData.agt_id%>', '<%=anAgentActivityData.name%>', '<%=anAgentActivityData.getTotalLoginTime()%>', '<%=anAgentActivityData.getNotPaidNRRTime()%>', '<%=anAgentActivityData.getOverPaidNRRTime()%>', '<%=anAgentActivityData.getTotalPaidTime()%>', 1)"
							 onMouseOut="showPaidTimeDetails('<%=anAgentActivityData.agt_id%>', '<%=anAgentActivityData.name%>', '<%=anAgentActivityData.getTotalLoginTime()%>', '<%=anAgentActivityData.getNotPaidNRRTime()%>', '<%=anAgentActivityData.getOverPaidNRRTime()%>', '<%=anAgentActivityData.getTotalPaidTime()%>', 0)"
							 >
							 <%
							 long paid_temp = 0, override_temp = 0;
							 if (anAgentActivityData.totalLoginTime > 0)
							 {
							    paid_temp = anAgentActivityData.totalLoginTime - anAgentActivityData.totalNotPaidNRRTime - anAgentActivityData.overPaidNRR;
								if (anAgentActivityData.override == 1)
									override_temp = paid_temp + anAgentActivityData.totalCorrectionTime;
								else
									override_temp = 0;
							 }
							 else
							 {
							    paid_temp = anAgentActivityData.totalPaidTime;
								if (anAgentActivityData.override == 1)
									override_temp = paid_temp + anAgentActivityData.totalCorrectionTime;
								else
									override_temp = 0;
							 }
							 %>
							<input type="text" id="paidtime<%=id_suff%>" name="paidtime<%=id_suff%>" size="10" value="<%=anAgentActivityData.buildReadableTime(paid_temp)/*getTotalPaidTime()*/%>" disabled >
							<input type="hidden" id="billabletime<%=id_suff%>" name="billabletime<%=id_suff%>" value="<%=anAgentActivityData.getTotalBillableTime()%>" >
							<input type="hidden" id="notpaidnrrtime<%=id_suff%>" name="notpaidnrrtime<%=id_suff%>" value="<%=anAgentActivityData.totalNotPaidNRRTime%>" >
							<input type="hidden" id="overpaidnrrtime<%=id_suff%>" name="overpaidnrrtime<%=id_suff%>" value="<%=anAgentActivityData.overPaidNRR%>" >
						</td>
						<td align="center" width="80">
							<input type="checkbox" id="checkoverride<%=id_suff%>" name="checkoverride<%=id_suff%>" onClick="enableOverrideTime(this.id);"
													 <%if (anAgentActivityData.override == 1) out.write("checked"); else out.write(""); %> <%if (anAgentActivityData.dayClosed == 1) out.write("disabled");%>>
						</td>
						<td align="center" width="125">
						  <input type="text" id="correctiontime<%=id_suff%>" name="correctiontime<%=id_suff%>" size="10" onFocus="this.select()" onBlur="buildOverrideTime(this.id, this.value);buildCorrectionTime(this.id, this.value)" value="<%=anAgentActivityData.getTotalCorrectionTime()%>" disabled>
						</td>
						<td align="center" width="125">
						  <input type="text" id="overridetime<%=id_suff%>" name="overridetime<%=id_suff%>" size="10" value="<%=anAgentActivityData.buildReadableTime(override_temp)/*getTotalOverrideTime()*/%>" disabled>
						</td>
						<td align="center" width="150">
						  <select name="selectoverridecause<%=id_suff%>" id="selectoverridecause<%=id_suff%>" onChange="viewOverrideCause(this.id)" disabled>
							<option value="No comments"><script>document.write(MultiArray["Select"][lang]);</script></option>
							<option value="Starphone crash"><script>document.write(MultiArray["Starphone crash"][lang]);</script></option>
							<option value="Fire alarm"><script>document.write(MultiArray["Fire alarm"][lang]);</script></option>
							<option value="Computer crash"><script>document.write(MultiArray["Computer crash"][lang]);</script></option>
							<option value="Power failure"><script>document.write(MultiArray["Power failure"][lang]);</script></option>
							<option value="Agent displacement"><script>document.write(MultiArray["Agent displacement"][lang]);</script></option>
							<option value="Sent Home (3hrs paid)"><script>document.write(MultiArray["Sent Home (3hrs paid)"][lang]);</script></option>
							<option value="First day integration"><script>document.write(MultiArray["First day integration"][lang]);</script></option>
							<option value="Floor support"><script>document.write(MultiArray["Floor support"][lang]);</script></option>
							<option value="HR interview"><script>document.write(MultiArray["HR interview"][lang]);</script></option>
							<option value="Other"> <script>document.write(MultiArray["Other"][lang]);</script></option>
						  </select>
						 
						</td>
						<td align="center" width="150">
							<input  style="visibility:hidden" type="text" id="overridecause<%=id_suff%>" name="overridecause<%=id_suff%>" size="18" disabled>
						</td>
					  </tr>
						<%
						 out.write("<script>displayOverrideCause('" + id_suff + "', '" + anAgentActivityData.comments + "'); </script>");
					  } // fin for
					  out.write("<script>hideLoadingDiv(); </script>	");
					  out.write("<script>chaine1 = '" + not_already_modified + "'; </script>	");
					  out.write("<script>chaine2 = '" + already_modified + "'; </script>	");
					  out.write("<script>chaine3 = '" + supermodified + "'; </script>	");
					  %>
					</table>
					 <table>
					 	<tr>
							<td>
								<input id="agentGroupId" name="agentGroupId" type="hidden">
								<input id="agentId" name="agentId" type="hidden">
								<input id="startDate" name="startDate" type="hidden">
								<input id="viewData" name="viewData" type="hidden">
								<input id="tenant_dbid" name="tenant_dbid" type="hidden">
								<input id="type" name="type" type="hidden">
								<input id="userid" name="userid" type="hidden">
								<input id="strToUpdateCell" name="strToUpdateCell" type="hidden">
								<input id="strToInsertCell" name="strToInsertCell" type="hidden">
								<input id="saveAddedRows" name="saveAddedRows" type="hidden">
								<input id="sessionParams" name="sessionParams" type="hidden">
								<input id="dayClosed" name="dayClosed" type="hidden">
								<input id="dateFrom" name="dateFrom" type="hidden">
								<input id="dateTo" name="dateTo" type="hidden">
								<input id="viewExceptionObj" name="viewExceptionObj" type="hidden">
							</td>
						</tr>
					</table>
			</div>
	</div>

	<div id="paidTimeDetails" >  </div>

	<div class="tab-page" id="addRow" >
		<h2 class="tab"><script>document.write(MultiArray["Add a row"][lang]);</script></h2>
		<script type="text/javascript">
				tp1.addTabPage( document.getElementById( "addRow" ) );
		</script>
		<fieldset>
		<%
			//userid = request.getParameter("userid");
			userid = (String)session.getAttribute("CURRENT_USER_DBID");
			if ((submitRequest2 != null) && submitRequest2.compareTo("true") == 0)
			{
				strToInsert = request.getParameter("strToInsert");
				strToUpdate = request.getParameter("strToUpdate");
				if ((strToInsert == null && strToUpdate == null) || (strToInsert.compareTo("") == 0 && strToUpdate.compareTo("") == 0))
				{
				}
				else
				{
					String runningDate2 = request.getParameter("startDate2");
					beanAgentLoginProdReportObj.saveAgentHours(userid, runningDate2, strToInsert, strToUpdate, thisDayIsClosed);
					beanAgentLoginProdReportObj.hasExtractData = false;
				}
			}

		%>				
			<table border="0" width="80%" cellpadding="2" cellspacing="0" style="border-collapse: collapse">
				<tr>			
					<td style="border-top-style: none; border-top-width: 1">
						<label for="agtGrp2"><b><script>document.write(MultiArray["Select an agent group"][lang]);</script></b></label>					
					</td>
					<td colspan="2" align="left">  
						<select name="agtGrp2" id="agtGrp2" onChange="javascript:getAgentsInGroup(this, document.agentHours.objects2, document.agentHours.viewckbox2)" class="contentText">
							<option value="AllGroups">- <script>document.write(MultiArray["All groups"][lang]);</script> -</option>
						</select>					
					</td>								
				</tr>
				<tr>			
					<td><label for="objects2"><b><script>document.write(MultiArray["Select an agent"][lang]);</script></b></label></td>
					<td align="left" >
						<select id="objects2" name="objects2" class="contentText" >
							<option value="AllAgents">- <script>document.write(MultiArray["All agents"][lang]);</script> -</option>
						</select>					
					</td>					
				    <td align="left">		
						<label for"viewckbox2"><b><script>document.write(MultiArray["Show agent by ID"][lang]);</script></b></label>
						<input type="checkbox" id="viewckbox2" name="viewckbox2" onClick="javascript:changeAgentListView(document.agentHours.agtGrp2, document.agentHours.objects2, this)">
					</td>					
				</tr>
				<tr>
				  <td><label for="reportDate2"><b><script>document.write(MultiArray["Select a date"][lang]);</script></b></label></td>
				  <td align="left" style="border-top-style: none; border-top-width: 1" colspan="5">
					<input type="text" size="15" onFocus="showCalendar('',this,this,'','id_reportDate2',0,30,1);this.blur()" name="reportDate2" id="reportDate2" value=""/>				  </td>			
				</tr>
				<tr>
					<td align="center" colspan="3">
						<table>
							<td style="border-top-style: none; border-top-width: 1">
								<script>document.write("<input id=\"addARow\"  name=\"addARow\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["Add a row"][lang]+"\" onClick=\"addMyRow(document.agentHours.agtGrp2,document.agentHours.objects2, document.agentHours.viewckbox2)\">");</script>							</td>
							<td valign="middle">
								<script>document.write("<input disabled id=\"saveRows\"  name=\"saveRows\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["Save rows"][lang]+"\" onClick=\"saveMyRows()\">");</script>							</td>
						</table>					
					</td>					
				</tr>
			</table>

			<div id="divAddARow" > 
			</div>
			
		</fieldset>
	</div>
	
	<div class="tab-page" id="exception">
		<h2 class="tab"><script>document.write(MultiArray["Exceptions"][lang]);</script></h2>
		<script type="text/javascript">
			tp1.addTabPage( document.getElementById( "exception" ) );
		</script>
		<fieldset>
				<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="1625">
					<tr>
						<td height="25" colspan="4">&nbsp;
						</td>
					</tr>
					<tr>
						<td width="47" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">&nbsp;
						</td>
						<td width="11" ></td>
						<td width="299" style="border-top-style: none; border-top-width: 1">&nbsp;<b><script>document.write(MultiArray["Select start date"][lang]);</script></b>
							<input type="text" size="15" onFocus="showCalendar('',this,this,'','id_fromDate',0,30,1);this.blur()" name="fromDate" id="fromDate" value=""/>						
						<td width="948">&nbsp;<b><script>document.write(MultiArray["Select stop date"][lang]);</script></b>
							<input type="text" size="15" onFocus="showCalendar('',this,this,'','id_toDate',0,30,1);this.blur()" name="toDate" id="toDate" value="" />						
						</td>
					</tr>
					<tr>
						<td height="25">&nbsp;
						</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td width="47" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">&nbsp;
						</td>
						<td width="11" ></td>
						<td width="299" style="border-top-style: none; border-top-width: 1">&nbsp;&nbsp;&nbsp;</td>
						<td valign="middle" >&nbsp;
						<script>document.write("<input id=\"displayExceptions\"  name=\"displayExceptions\" type=\"button\" style=\"visibility:visible;\" value=\""+MultiArray["View exceptions"][lang]+"\" onClick=\"viewExceptions()\">");</script>&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;
							<!--<a href="./Exceptions.csv"><script>document.write(MultiArray["Right-click to download"][lang]);</script></a>-->
						</td>
					</tr>
	 		</table>
		</fieldset>
			<%
			
			String strToWrite = "";
			
			if ((viewExceptions != null) && viewExceptions.compareTo("true") == 0)
			{
			%>
			<div  style="margin-right:20px ">
			<table border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			  <tr>
			  	<td align="center" width="100"><b><script>document.write(MultiArray["Date"][lang]);</script></b></td>
				<td align="center" width="100"><b><script>document.write(MultiArray["Agent ID"][lang]);</script></b></td>
				<td align="center" width="200"><b><script>document.write(MultiArray["Last name"][lang]);</script>, <script>document.write(MultiArray["First name"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Agent group"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Activity"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Login time"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Paid time"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Correction"][lang]);</script></b></td>
				<td align="center" width="125"><b><script>document.write(MultiArray["Override time"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Override cause"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Custom cause"][lang]);</script></b></td>
				<td align="center" width="150"><b><script>document.write(MultiArray["Override by"][lang]);</script></b></td>
		
			  </tr>
			</table>
			</div>
			<%
				strToWrite = "Date,AgentID,Name,Agent Group,Activity,Login Time,Paid Time,Correction,Override Time,Override cause,Override by\r\n";
			}
			%>
			
			<div id="exceptionDiv" style="overflow:scroll; height:500px"> 
				<%
				if ((viewExceptions != null) && viewExceptions.compareTo("true") == 0)
				{
					fromDate = request.getParameter("dateFrom");
					toDate = request.getParameter("dateTo");
					if (fromDate.compareTo("") != 0 && toDate.compareTo("") != 0) 
						beanAgentLoginProdReportObj.getExceptionsRecords(fromDate, toDate );
				}
				java.util.Vector exceptionData = (Vector)beanAgentLoginProdReportObj.m_AllExceptions;
				anAgentActivityData = new beanAgentLoginProdInfo();
				%>
					
        <table height="54" border="0">
          				<%
					
					id_suff = "";
					for (int i = 0; i < exceptionData.size(); i++)
					{
						anAgentActivityData = (beanAgentLoginProdInfo)exceptionData.elementAt(i);
						
						id_suff = anAgentActivityData.agt_id + "_" + anAgentActivityData.grp_id + "_" + anAgentActivityData.activity_type;
						  if(i%2 ==0) {
						  %>
					  	<tr class="reportsRowPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
						  <%
						  } else {
						  %>
				  	    <tr class="reportsRowUnPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
						 <%
						 }
						 %>
						<td align="center" width="100">
							<%=anAgentActivityData.event_date%>
						</td>
						<td align="center" id="agentId_<%=id_suff%>" width="100"><%=anAgentActivityData.agt_id%></td>
						<td align="center" width="200">
							<a href="../jsp/events_details.jsp?agentId=<%=anAgentActivityData.agt_id%>&curDate=<%=reportDate%>" target="_blank">
								<%out.write(anAgentActivityData.last_name + ", " + anAgentActivityData.first_name); %>
							</a>
						</td>
						<td align="center" width="150"><%=anAgentActivityData.grp_name%></td>
						<td align="center" width="125" ><%=anAgentActivityData.activity_name%></td>
						<td align="center" width="125">
						  <input type="text" id="logintime<%=id_suff%>" name="logintime<%=id_suff%>" size="10" value="<%=anAgentActivityData.getTotalLoginTime()%>" disabled>
						</td>
						<td align="center" width="125"
							 onMouseOver="showPaidTimeDetails('<%=anAgentActivityData.agt_id%>', '<%=anAgentActivityData.name%>', '<%=anAgentActivityData.getTotalLoginTime()%>', '<%=anAgentActivityData.getNotPaidNRRTime()%>', '<%=anAgentActivityData.getOverPaidNRRTime()%>', '<%=anAgentActivityData.getTotalPaidTime()%>', 1)" 
							 onMouseOut="showPaidTimeDetails('<%=anAgentActivityData.agt_id%>', '<%=anAgentActivityData.name%>', '<%=anAgentActivityData.getTotalLoginTime()%>', '<%=anAgentActivityData.getNotPaidNRRTime()%>', '<%=anAgentActivityData.getOverPaidNRRTime()%>', '<%=anAgentActivityData.getTotalPaidTime()%>', 0)"
							 >
							<input type="text" id="paidtime<%=id_suff%>" name="paidtime<%=id_suff%>" size="10" value="<%=anAgentActivityData.getTotalPaidTime()%>" disabled >
							<input type="hidden" id="billabletime<%=id_suff%>" name="billabletime<%=id_suff%>" value="<%=anAgentActivityData.getTotalBillableTime()%>" >
						</td>
						<td align="center" width="125">
						  <input type="text" id="correctiontime<%=id_suff%>" name="correctiontime<%=id_suff%>" size="10" onFocus="this.select()" onBlur="buildOverrideTime(this.id, this.value);buildReadableTime(this.id, this.value)" value="<%=anAgentActivityData.getTotalCorrectionTime()%>" disabled>
						</td>
						<td align="center" width="125">
						  <input type="text" id="overridetime<%=id_suff%>" name="overridetime<%=id_suff%>" size="10" value="<%=anAgentActivityData.getTotalOverrideTime()%>" disabled>
						</td>
						<td align="center" width="150"><%//=anAgentActivityData.comments%>
						  <select name="selectoverridecause<%=id_suff%>" id="selectoverridecause<%=id_suff%>" onChange="viewOverrideCause(this.id)" disabled>
							<option value="No comments"><script>document.write(MultiArray["Select"][lang]);</script></option>
							<option value="System failure"><script>document.write(MultiArray["System failure"][lang]);</script></option>
							<option value="Working at Fido"><script>document.write(MultiArray["Working at Fido"][lang]);</script></option>
							<option value="Starphone crash">Starphone crash</option>
							<option value="Fire alarm">Fire alarm</option>
							<option value="Computer crash">Computer crash</option>
							<option value="Power failure">Power Failure</option>
							<option value="Agent displacement">Agent displacement</option>
							<option value="Sent Home (3hrs paid)">Sent Home (3hrs paid)</option>
							<option value="First day integration">First day integration</option>
							<option value="Floor support">Floor support</option>
							<option value="HR interview">HR interview</option>
							<option value="Other"><script>document.write(MultiArray["Other"][lang]);</script></option>
						  </select>
						</td>
						<td align="center" width="150">
							<input type="text" id="overridecause<%=id_suff%>" name="overridecause<%=id_suff%>" size="18" disabled>
						</td>
						<%
						String nom = "";
						String userInfo = beanAgentLoginProdReportObj.getUserInfo(anAgentActivityData.acknowledged_by);
						
						if(userInfo.indexOf("|") != -1)
						{
							nom = userInfo.substring(0, userInfo.indexOf("|"));
						}
						
						%>
						<td align="center" width="150">
							<input type="text" id="ack_by<%=id_suff%>" name="ack_by<%=id_suff%>" size="18" value="<%out.write(nom);%>" disabled>
						</td>
						
					  </tr>
						<%
						 out.write("<script>displayOverrideCause('" + id_suff + "', '" + anAgentActivityData.comments + "'); </script>");
						 
						 strToWrite += anAgentActivityData.event_date + ", " + anAgentActivityData.agt_id + ", " + anAgentActivityData.last_name + " " + 
						 				anAgentActivityData.first_name + ", " + anAgentActivityData.grp_name + ", " + anAgentActivityData.activity_name + ", " + 
										anAgentActivityData.getTotalLoginTime() + ", " + anAgentActivityData.getTotalPaidTime() + ", " + 
										anAgentActivityData.getTotalCorrectionTime() + ", " + anAgentActivityData.getTotalOverrideTime() + ", " + 
										anAgentActivityData.comments + ", " + nom + "\r\n";
										
					  } // fin for

						//String strPath = "../webapps/aheevaccs/Manager/Resources_pages/Exceptions.csv";	//VOICI LA LIGNE 	QUI CAUSE LE BUG
						String strPath="Exceptions.csv";
						File strFile = new File(strPath);
						FileWriter myWriter = new FileWriter(strFile);
						BufferedWriter objWriter = new BufferedWriter(myWriter);	
						objWriter.write(strToWrite);	
						objWriter.flush();	
						objWriter.close();
					  %>
				</table>
			</div>
	</div>
	
	
	<div class="tab-page" id="summary">
		<h2 class="tab"><script>document.write(MultiArray["Summary"][lang]);</script></h2>
		<script type="text/javascript">
				tp1.addTabPage( document.getElementById( "summary" ) );
		</script>
		<fieldset>
		<legend><script>document.write(MultiArray["View agent groups hours summary"][lang]);</script></legend>
		<table width="100%">
			<tr border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			<td align="center" width="20%"><b><script>document.write(MultiArray["Name"][lang]);</script></b></td>
			<td align="center" width="35%"><b><script>document.write(MultiArray["Queue"][lang]);</script></b></td>
			<td align="center" width="15%"><b><script>document.write(MultiArray["Login time"][lang]);</script></b></td>
			<td align="center" width="15%"><b><script>document.write(MultiArray["Paid time"][lang]);</script></b></td>
			<td align="center" width="15%"><b><script>document.write(MultiArray["Billable"][lang]);</script></b></td>
			</tr>
		<%
			if ((submitRequest != null) && submitRequest.compareTo("true") == 0)
			{
				reportDate = request.getParameter("startDate");
				agentGroupId = request.getParameter("agentGroupId");
				System.out.println("Inside tab Summary: ----- agentGroupId: "+ agentGroupId);
				Vector summaryVector = beanAgentLoginProdReportObj.getSummary( agentGroupId, reportDate);
				beanAgentLoginProdInfo c = new beanAgentLoginProdInfo();
				System.out.println("summaryVector-size: "+summaryVector.size());
				for(int n=0; n < summaryVector.size(); n++){
					beanAgentLoginProdReport.hoursSummary data = (beanAgentLoginProdReport.hoursSummary)summaryVector.elementAt(n);
					if (n%2 == 0)
					{
					%>
						<tr class="reportsRowUnPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
						<td align="center" width="20%"><%=data.name%></td>
						<td align="center" width="35%"><%=data.queue%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.login_time)%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.paid_time)%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.billable_time)%></td>
						</tr>
					<%
					}
					if (n%2 == 1)
					{
					%>
						<tr class="reportsRowPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
						<td align="center" width="20%"><%=data.name%></td>
						<td align="center" width="35%"><%=data.queue%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.login_time)%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.paid_time)%></td>
						<td align="center" width="15%"><%=c.buildReadableTime(data.billable_time)%></td>
						</tr>
					<%
					}
				}

		%>
		</table>
		<%
			}
		%>
		</fieldset>
	</div>
<script>
	//fillObjectCombo(document.agentHours.agtGrp, document.agentHours.objects, document.agentHours.viewckbox);
	fillObjectCombo(document.agentHours.agtGrp2, document.agentHours.objects2, document.agentHours.viewckbox2);
</script>
<%
out.write("<script>selectObject(document.getElementById('agtGrp'), '"+agentGroupId +"');</script>");


if ( ((submitRequest != null) && submitRequest.compareTo("true") == 0) || ((viewExceptions != null) && viewExceptions.compareTo("true") == 0))
{
%>
<script>
	document.getElementById("agtGrp").disabled = false;
	//getAgentsInGroup(document.agentHours.agtGrp, document.agentHours.objects, document.agentHours.viewckbox)
</script>
<%
}
else
{
%>
<script>
	document.getElementById("agtGrp").disabled = true;
</script>
<%

}
//out.write("<script>selectObject(document.getElementById('objects'), '"+agentId +"');</script>");
%>
</form>
</div>
<div id="bulleDiv" style=" background-image:url(../img/callout_box.gif); visibility: hidden; position:absolute; left:0px; top:0px; width:283px; height:120px;" >
</div>
	<div class="TempMessages" id="TempMessages"> 
	  <table border="0" width="100%" cellpadding="0" cellspacing="0" height="100%">
		<tr> 
		  <td width="100%" id="TempMsg" align="center"> </td>
		</tr>
	  </table>
	</div>
</body>
</html>
<script>
//window.open('./example.csv','formWindow');
</script>

