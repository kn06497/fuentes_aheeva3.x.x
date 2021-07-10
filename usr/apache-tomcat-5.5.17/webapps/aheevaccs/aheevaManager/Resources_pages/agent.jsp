<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	boolean newAgent = false;
	boolean agentLoggedIn = true;

	String tenantDbid = request.getParameter("tenant_dbid");
	String agentDbid = request.getParameter("dbid");
	Agent vAgent = null;
	try
	{
		vAgent = new Agent(Integer.parseInt(agentDbid));
	}
	catch(NumberFormatException nfe)
	{
		vAgent = new Agent();
		newAgent = true;
	}

	AgentGroupCollection allGroups = null;
	try {
		allGroups = new AgentGroupCollection(Integer.parseInt(tenantDbid));
	}
	catch (NumberFormatException e) {
		allGroups = new AgentGroupCollection();
	}

	/* Get all available skills */
	SkillsCollection allSkills = null;
	try {
		allSkills = new SkillsCollection(Integer.parseInt(tenantDbid));
	}
	catch (NumberFormatException e) {
		allSkills = new SkillsCollection();
	}
	/* Mix the unassigned skills with the other skills */
	Vector<AgentSkill> allAgentSkills = vAgent.getAssignedSkills();
	for(int i = 0; i < allSkills.size(); i++)
	{
		Skill curSkill = allSkills.elementAt(i);
		AgentSkill curAgentSkill = new AgentSkill(curSkill.getDbid(), curSkill, 0);
		if(!allAgentSkills.contains(curAgentSkill))
		{
			allAgentSkills.add(curAgentSkill);
		}
	}

	SiteCollection allSites = new SiteCollection();

	ActivityCollection activities = null;
	try {
		activities = new ActivityCollection(Integer.parseInt(tenantDbid));
	}
	catch (NumberFormatException e) {
		activities = new ActivityCollection();
	}

	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	String userPrivilegesQuery  = "SELECT * FROM cfg_user WHERE DBID='"+CURRENT_USER_DBID+"'";

	pageData.openConnection();
	Vector <HashMap> userPrivilegesDataResult = pageData.executeFromStringToVector(userPrivilegesQuery);
	Vector<String> agtLoginIdList = new Vector();// list of all existing loginIds
	if(!newAgent)// if this isn't a new agent, he is desactivated if only he is logged out.
	{
		String AGT_LOGIN_ID = ((String)vAgent.getLoginId());
		// retreive agent's latest event
		String agtStatusQurery1 = "SELECT EVENT FROM datamart_agent_details WHERE AGENT_ID='"+AGT_LOGIN_ID+"'";
		String agtStatusQurery2 = "AND EVENT_TIME=(SELECT max(EVENT_TIME) FROM datamart_agent_details WHERE AGENT_ID='"+AGT_LOGIN_ID+"')";
		String agtStatusQurery = agtStatusQurery1.concat(agtStatusQurery2);
		Vector <HashMap> agtCurStatusRs = pageData.executeFromStringToVector(agtStatusQurery);
		//String agtCurStatusStr = (agtCurStatusRs.get(0)).toString();
		if(agtCurStatusRs.size() > 0)
		{
			String agtCurStatusStr = (agtCurStatusRs.get(0)).toString();
			System.out.println(agtCurStatusStr);  
			if(agtCurStatusStr.compareTo("{EVENT=LOGOUT}") == 0)
			{
				agentLoggedIn = false;
			}	
			else
			{
				agentLoggedIn = true;
			}
		}
		else 
		{//no agent's info retrieved
			agentLoggedIn = false;
		}             
	}	
	else// if this is a new agent, retrieve all existing loginIds, later we'll check if another agent has been given the same login id
	{
		String agtLogIdQuery = "SELECT LOGIN_ID FROM cfg_person";
		ResultSet agtLogIdRs = pageData.executeFromString(agtLogIdQuery);
	
		while(agtLogIdRs.next())
		{
			agtLoginIdList.add(agtLogIdRs.getString(1));
		}
	}

	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<LINK href="style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="xc2_default.css" type="text/css">
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
<%@ include file="xc2_default_labels.jsp" %>
<%@ include file="agentFunctions_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="agentFunctions.js"></script>
<script language="javascript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>

<!-- Calendar required javascript -->
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;xcDateFormat="yyyy-mm-dd";</script>
<script language="javascript" src="xc2_inpage.js"></script>
<!-- End of calendar required section -->

<script type="text/javascript" src="slider/js/range.js"></script>
<script type="text/javascript" src="slider/js/timer.js"></script>
<script type="text/javascript" src="slider/js/slider.js"></script>


<script language="javascript" type="text/javascript">
var tenant_dbid = "<%=tenantDbid%>";
var agentLoginID = "<%=vAgent.getLoginId()%>";
var newAgent = <%=newAgent%>;
var agentDbid = "<%=agentDbid%>";
var agentLoggedIn = <%=agentLoggedIn%>;

<%
if(vAgent.getDbid() > 0)
{
	out.println("agentDbid = '" + vAgent.getDbid() + "';");
}
%>
var originalAgentState = <%=vAgent.getIsActive() ? "1" : "0"%>;
<% if(newAgent)
{// store all loginIds retrieved from DB in an array to check for new loginId's uniqueness
%>
	var agtLoginIdArray = new Array();
<% 
	//int i=0;
	int sizeAgtLoginIdList = agtLoginIdList.size();
	System.out.println("sizeAgtLoginIdList -------"+sizeAgtLoginIdList);
	if(sizeAgtLoginIdList>0)
	{
	 	for(int i=0; i<sizeAgtLoginIdList; i++)
		{
	%>
			agtLoginIdArray[<%=i%>] = "<%=agtLoginIdList.elementAt(i)%>";
	<%	
		}
	}
	%>
	var loginIdArraySize = <%=sizeAgtLoginIdList%>;
	<%
}
%>
</script>


<SCRIPT language="JavaScript">
<!--
if (document.images)
{
  pic1= new Image(90,25); 
  pic1.src="../img/tab.gif"; 

  pic2= new Image(94,25); 
  pic2.src="../img/tab.active.gif"; 

  pic3= new Image(90,25); 
  pic3.src="../img/tab.hover.gif"; 
}
//-->
</SCRIPT>

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
</script>

</head>

<body class="age_body">
<div class="tab-pane" id="tabPane1">
<form name="agent" onKeyDown="KeyDownHandler(save)">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
<div class="tab-page" id="tabGeneral">
	<h2 class="tab"><%=pageData.getWord("General")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
	<fieldset>
	<legend><%=pageData.getWord("General information")%></legend>
	<table border="0">
		<tr>
			<td>
				<%=pageData.getWord("Group ID")%>
			</td> 
			<td>
				<select name="AgentGroupSelection" onChange="enableUpdateButton()">
					<option value=""></option>
				<%
					//iterate on the groups collection
					for (int i = 0; i < allGroups.size(); i++) {
						AgentGroup curGroup = allGroups.elementAt(i);
						String groupSelected = curGroup.equals(vAgent.getAgentGroup()) ? "selected" : "";
					%>
						<option value="<%=curGroup.getDbid()%>" <%=groupSelected%>><%=curGroup.getName()%></option>
					<%
					}
				%>
				</select>
			</td>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td><%=pageData.getWord("Last name")%></td>
			<td>
				<input type="text" name="agtLastName" size="27" onChange="enableUpdateButton(true)"	value="<%=vAgent.getLastName()%>">
			</td>
			<td><%=pageData.getWord("First name")%></td>
			<td>
				<input type="text" name="agtFirstName" size="27" onChange="enableUpdateButton(true)" value="<%=vAgent.getFirstName()%>">
			</td>
		</tr>
		<tr>
			<td valign="top"><%=pageData.getWord("Comments")%></td>
			<td colspan="3">
				<textarea rows="3" name="comments" cols="70" onChange="enableUpdateButton()"><%=vAgent.getComments()%></textarea>
			</td>
		</tr>
		<tr>
			<td width="100">
				<%=pageData.getWord("Login")%>
			</td>
			<td>
				<input type="text" name="login" size="10" onChange="enableUpdateButton()"
				value="<%=vAgent.getLoginId()%>" <%=newAgent ? "" : "disabled"%>>
			</td>
			<td>
				<%=pageData.getWord("Password")%>
			</td>
			<td>
				<input type="password" name="password" size="10" onChange="enableUpdateButton()"
				value="<%=vAgent.getPassword()%>">
			</td>
		</tr>
		<tr>
			<td align="left" valign="top">
				<%=pageData.getWord("Start Date")%>
			</td>
			<td valign="top" align="left">
				<input type="text"  size="10" onClick="enableUpdateButton()" onFocus="showCalendar('',this,this,'','startWorkDate',0,30,1);this.blur()" id="startWorkDate"  name="startWorkDate" 
				value="<%=vAgent.getStartDate()%>"/>
			</td>
			<td align="left" valign="top">
				<%=pageData.getWord("End Date")%>
			</td>
			<td valign="top" align="left">
				<input type="text"  size="10" onClick="enableUpdateButton()" onFocus="showCalendar('',this,this,'','endWorkDate',0,30,1);this.blur()" id="endWorkDate" name="endWorkDate" 
				value="<%=vAgent.getEndDate()%>"/>
			</td>
		</tr>
		<tr>
			<td align="left">
				<%=pageData.getWord("Active")%>
			</td>
			<td align="left">
			<input type="checkbox" name="state" onClick="enableUpdateButton()" <%=vAgent.getIsActive() ? "checked" : ""%>>
			</td>
			<td align="left" valign="top">
				<%=pageData.getWord("Activity")%>					    			
			</td>
			<td valign="top" align="left">
				<%
				if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_CONFIGURATION") || 
					pageData.userHasRight(userPrivilegesDataResult, "ALLOW_FINANCIAL_REPORTS"))
				{
				%>
				<select id="activity_type" name="activity_type" onChange="enableUpdateButton()">
				<%
				}
				else //---------------
				{
				%>
				<select id="activity_type" name="activity_type" disabled="disabled">
				<%
				}//if
				%>
					<option value=""><%=pageData.getWord("Select")%></option>
				<%
					for(int i=0; i < activities.size(); i++) {
						Activity curActivity = activities.elementAt(i);
						String activitySelected = curActivity.equals(vAgent.getActivity()) ? "selected" : "";
				%>
					<option value="<%=curActivity.getDbid()%>" <%=activitySelected%>><%=curActivity.getName()%></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
	</table>
	</fieldset>
</div>
<div class="tab-page" id="tabPersonal">
	<h2 class="tab"><%=pageData.getWord("Personal")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPersonal" ) );</script>
	<fieldset>
	<legend><%=pageData.getWord("Personal information")%></legend>
	<table border="0">
		<tr>
			<td valign="top" align="left"><%=pageData.getWord("Birth date")%></td>
			<td valign="top" align="left"><input type="text" name="birthDate" size="27" onClick="enableUpdateButton(true)" onFocus="showCalendar('',this,this,'','birthdate',0,30,1);this.blur()" id="birthdate" 
			value="<%=vAgent.getBirthDate()%>"></td>
		</tr>
		<tr>
			<td valign="top" align="left" >
				<%=pageData.getWord("Address")%>
			</td>
			<td valign="top" align="left">
				<textarea rows="3" name="address" cols="26" onChange="enableUpdateButton(true)"><%=vAgent.getAddress()%></textarea>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" >
				<%=pageData.getWord("City")%>
			</td>
			<td valign="top" align="left" >
				<input type="text" name="city" size="27" onChange="enableUpdateButton(true)"
				value="<%=vAgent.getCity()%>">
			</td>
		</tr>
		<tr>
			<td align="left" valign="top">
				<%=pageData.getWord("Salary")%>
			</td>
			<td  valign="top" align="left">
				<input type="text" name="salary" size="20" onChange="enableUpdateButton(true)"
				value="<%=vAgent.getSalary()%>">
			</td>
		</tr>
	</table>
	</fieldset>
</div>
<div class="tab-page" id="tabSite">
	<h2 class="tab"><%=pageData.getWord("Site")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabSite" ) );</script>
	<fieldset>
	<legend><%=pageData.getWord("Site details")%></legend>
	<table border="0">
		<tr>
			<td align="left" valign="top">
				<%=pageData.getWord("Site")%>
			</td>
			<td  valign="top" align="left">
				<select size="1" name="SiteSelection" onChange="enableUpdateButton();addDefaultPreferredSite()">
					<option value=""></option>
				<%
					for(int i = 0; i < allSites.size(); i++)
					{
						Site curSite = allSites.elementAt(i);
						String siteSelected = curSite.equals(vAgent.getSite()) ? "selected" : "";
				%>
					<option value="<%=curSite.getDbid()%>" <%=siteSelected%>><%=curSite.getName()%></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			
			
			
			
				<table border="0">
					<tr>
						<td colspan="2"><%=pageData.getWord("Preferred sites")%></td>
						<td align="center">
							<img src="../img/arrowUp.gif" width="16" height="16" class="img1" alt="+" onClick="bringUpSite()">&nbsp;
							<img src="../img/arrow_down.gif" width="16" height="16" class="img1" alt="-" onClick="bringDownSite()">
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						
                <td height="94" align="center"> 
                  <select name="availableSites" multiple="multiple" onChange="enableUpdateButton()" style="width:150px" size="5" >

						<%
							
							for(int i = 0; i < allSites.size(); i++)
							{
								Site curSite = allSites.elementAt(i);
								if(!vAgent.getPreferredSites().contains(curSite))
								{
						%>
								<option value="<%=curSite.getDbid()%>"><%=curSite.getName()%></option>
						<%
								}
							}
						%>
							</select>
						</td>
						<td align="center">
							<img src="../img/left_to_right.gif" alt=">>" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('availableSites', 'affectedSites')" /><br><br>
							<img src="../img/right_to_left.gif" alt="<<" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('affectedSites', 'availableSites')"/>
						</td>
						<td align="center">
							<select name="affectedSites" multiple="multiple" onChange="enableUpdateButton()" style="width:150px" size="5" >
							<%
								for(int i=0; i < vAgent.getPreferredSites().size(); i++)
								{
									Site curSite = vAgent.getPreferredSites().elementAt(i);
							%>
								<option value="<%=curSite.getDbid()%>"><%=curSite.getName()%></option>
							<%
								}
							%>
							</select>
						</td>
						<td>
							<table>
								<tr valign="top" align="left">
									<td valign="top">
										<%=pageData.getWord("Most preferred")%>
									</td>
								</tr>
								<tr><td align="center">&nbsp;</td></tr>
								<tr><td align="center">&nbsp;</td></tr>
								<tr valign="bottom" align="left">
									<td valign="bottom">
										<%=pageData.getWord("Less preferred")%>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</fieldset>
</div>
<%
if(pageData.userHasRight(userPrivilegesDataResult, "ALLOW_SKILLS_MANAGEMENT") && !newAgent) {
%>
<div class="tab-page" id="tabSkills">
	<h2 class="tab"><%=pageData.getWord("Skill")%></h2>
	<script type="text/javascript">tp1.addTabPage(document.getElementById("tabSkills"));</script>
	<fieldset>
	<legend><%=pageData.getWord("Set agent skills")%> </legend>
	<table border="0" onClick="enableUpdateButton()">
	<%
	if(allAgentSkills.size() > 0) {
		for(int i = 0; i < allAgentSkills.size(); i++) {
			AgentSkill curAgentSkill = allAgentSkills.elementAt(i);
			Skill curSkill = curAgentSkill.getSkill();
	%>
		<tr>
			<td align="left" width="100">
				<%=curSkill.getName()%>
			</td>
			<td id="td_agentSkillId" skillDBID="<%=curSkill.getDbid()%>" oldWeight="<%=curAgentSkill.getWeight()%>" dbid="<%=curAgentSkill.getDbid()%>" align="right">
				<input type="text" size="2" maxlength="3" id="skill_value<%=curSkill.getDbid()%>" onChange="s<%=curSkill.getDbid()%>.setValue(validateSkillWeight(this));" value="<%=curAgentSkill.getWeight()%>">
			</td>
			<td width="60%">
				<div class="slider" id="slider-<%=curSkill.getDbid()%>" style="margin: 2px; width:auto;">
					<input class="slider-input" id="slider-input-<%=curSkill.getDbid()%>">
				</div>
			</td>
		</tr>
	<%
		}
	} else { 
	%>
		<tr><td><%=pageData.getWord("There is no skill available")%></td></tr>
	<%
	}
	%>
	</table>
	</fieldset>
</div>
<%
}
%>
<input disabled name="updateInfo" type="button" value="<%=pageData.getWord("Save")%>" onClick="validateInfo()" id="save">
<input name="deleteAgt" type="button" value="<%=pageData.getWord("Delete")%>" onClick="askDelete()" <%=newAgent ? "disabled" : ""%>>
<input name="employeeId" type="hidden" value="<%=vAgent.getEmployeeId()%>">
</form>
</div>
<%
if(!newAgent && allAgentSkills.size() > 0) {
%>
<script language="javascript" type="text/javascript">
/* Script to create the skill sliders */
<%
for(int i = 0; i < allAgentSkills.size(); i++) {
	AgentSkill curAgentSkill = allAgentSkills.elementAt(i);
	Skill curSkill = curAgentSkill.getSkill();
%>
	s<%=curSkill.getDbid()%> = new Slider(document.getElementById('slider-<%=curSkill.getDbid()%>'), document.getElementById('slider-input-<%=curSkill.getDbid()%>'));
	s<%=curSkill.getDbid()%>.onchange = function() {
		document.getElementById('skill_value<%=curSkill.getDbid()%>').value = s<%=curSkill.getDbid()%>.getValue();
		color = getColor(s<%=curSkill.getDbid()%>.getValue());
		document.getElementById('skill_value<%=curSkill.getDbid()%>').style.backgroundColor = color;
	};
	s<%=curSkill.getDbid()%>.setValue(<%=curAgentSkill.getWeight()%>);
	s<%=curSkill.getDbid()%>.setMinimum(0);
	s<%=curSkill.getDbid()%>.setMaximum(100);
	color = getColor(s<%=curSkill.getDbid()%>.getValue());
	document.getElementById('skill_value<%=curSkill.getDbid()%>').style.backgroundColor = color;
	s<%=curSkill.getDbid()%>.recalculate();
<%
}
%>
</script>
<%
}
pageData.closeConnection();
%>

</body>
</html>
