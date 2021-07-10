
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import = "javax.naming.*"%>
<%@page import = "javax.sql.*"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*" %>
<%@page import = "aheevaManager.ressources.*" %>
<jsp:useBean id="extra" scope="request" class="aheevaManager.ressources.beanModifyCallingListExtraData" />

<% 
	//  handle the extra data form summission

	if(request.getParameter("isExtraDataForm") != null && request.getParameter("isExtraDataForm").compareTo("1") == 0) {

		String oldExtraDatas[]     =  request.getParameterValues("oldExtraDatas");
		String newExtraDatas[]     =  request.getParameterValues("newExtraDatas"); 
		String extraDataForAllUrl  = (String) request.getParameter("allextradata");
		String modifyOption        = (String) request.getParameter("modifyScreenPopOption");

		
		if(modifyOption != null) {
			if(modifyOption.equals("all")){
				extra.modifyAllExtraData(extraDataForAllUrl, Integer.parseInt(request.getParameter("dbid")));
			}else{ 
				extra.modifyExtraDatas(oldExtraDatas, newExtraDatas, Integer.parseInt(request.getParameter("dbid")));
			}
		}else{
			out.write("<script>alert('Please chose a type of modification');</script>");
		}
	}


	beanManagerData pageData = new beanManagerData();
	PreparedStatement ps;
	ResultSet rs;
	
	String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
	String callingListDbid = request.getParameter("dbid");
	String tenantDbid = request.getParameter("tenant_dbid");
	int dbid = 0;
	if(callingListDbid != null  && !callingListDbid.equals("")){
		try{
			dbid = Integer.parseInt(callingListDbid);
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
	}
	
	
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	String userAssignedTenants = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='TENANT' AND RESSOURCE_DBID='"+tenantDbid+"')";
	String userAssignedCallingLists = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='CALLING_LIST' AND RESSOURCE_DBID='"+callingListDbid+"')";
	String listAllowedUsersQuery = "SELECT U.DBID AS USER_DBID, USERNAME FROM cfg_user_authorize_ressources, cfg_user U "+
		"WHERE RESSOURCE_TYPE='CALLING_LIST' AND U.DBID = USER_DBID AND RESSOURCE_DBID='"+callingListDbid+"'";
	String listNotAllowedUsersQuery = "SELECT DBID AS USER_DBID, USERNAME FROM cfg_user WHERE ALLOW_CALLING_LIST_MANAGEMENT='yes' AND state='1' "+
		"AND DBID NOT IN "+userAssignedCallingLists+" AND DBID IN "+userAssignedTenants+" ORDER BY USERNAME";
	String userRightsQuery = "SELECT ALLOW_USER_MANAGEMENT, ALLOW_CALLING_LIST_MANAGEMENT, ALLOW_CAMPAIGN_MANAGEMENT FROM cfg_user WHERE DBID='"+currentUserDbid+"'";

	pageData.openConnection();
	pageData.executeFromString(listAllowedUsersQuery);
	Vector <HashMap> listAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(listNotAllowedUsersQuery);
	Vector <HashMap> listNotAllowedUsersDataResult = pageData.CreateVectorFromBean();
	pageData.executeFromString(userRightsQuery);
	Vector <HashMap> userRightsDataResult = pageData.CreateVectorFromBean();

	boolean userManagementAllowed = pageData.userHasRight(userRightsDataResult, "ALLOW_USER_MANAGEMENT") && callingListDbid.compareTo("") != 0;
	if(!pageData.userHasRight(userRightsDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))
	{ %>
		<jsp:forward page="forbidden.jsp"/>
<%	} %>
 

<head>
<title>AheevaCCS - Modify Callinglist</title>
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
<%@ include file="callingListFuncs_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="callingListFuncs.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script>
var callingListDbid = normalizeString(QueryString('dbid'));

var isNewResource = false;
</script>
<%!
//public String buildChartString(java.sql.ResultSet sql_res);  value=\"Creating Chart - Please Wait.\">

public String buildChart(String legend_label, String legend_title)
{
	StringBuffer retString = new StringBuffer();
	retString.append("<!-- Start Up Parameters -->");
	retString.append("<PARAM name=\"LOADINGMESSAGE\" url(\"./img/chart_loading.gif\")>");
	retString.append("<PARAM name=\"STEXTCOLOR\"     value=\"0,0,100\">");
	retString.append("<PARAM name=\"STARTUPCOLOR\"   value=\"255,255,255\">");
	retString.append("<!-- Character Encoding -->");
	retString.append("<PARAM name=\"charset\"   value=\"8859_1\">			");
	retString.append("<!-- Chart Switches -->");
	retString.append("<PARAM name=\"3D\" value=\"false\">");
	retString.append("<PARAM name=\"Slabels\" value=\"true\">");
	retString.append("<PARAM name=\"legend\" value=\"false\">");
	retString.append("<PARAM name=\"displayPercentages\" value=\"true\">");
	retString.append("<!-- Chart Characteristics -->");
	retString.append("<PARAM name=\"width\"      value=\"160\">");
	retString.append("<PARAM name=\"height\"     value=\"160\">");
	retString.append("<PARAM name=\"nPies\"      value=\"1\">");
	retString.append("<PARAM name=\"depth3D\"    value=\"15\">");
	retString.append("<PARAM name=\"ndecplaces\" value=\"0\">");
	retString.append("<PARAM name=\"3Dangle\"    value=\"50\">");
	retString.append("<!-- Thousand separator -->");
	retString.append("<PARAM name=\"thousandseparator\" value=\".\">");
	retString.append("<!-- Link Cursor -->");
	retString.append("<!--  valid values are - crosshair, default, hand, move, text or wait -->");
	retString.append("<PARAM name=\"linkCursor\" value=\"default\">");
	retString.append("<!-- Popup segment Value Pre & Post Symbols -->");
	retString.append("<PARAM name=\"valuepresym\"  value=\"\">");
	retString.append("<PARAM name=\"valuepostsym\"  value=\" \">");
	retString.append("<!-- Additional font information -->");
	retString.append("<PARAM name=\"popupfont\"  value=\"Arial,B,12\">");
	retString.append("<PARAM name=\"slabelfont\" value=\"Arial,N,10\">");
	retString.append("<!-- Additional color information -->");
	retString.append("<PARAM name=\"bgcolor\"      value=\"255,255,255\">");
	retString.append("<PARAM name=\"labelcolor\"   value=\"50,50,50\">");
	retString.append("<!-- Legend Information -->");
	retString.append("<PARAM name=\"legendfont\"       value=\"Arial,N,10\">");
	retString.append("<PARAM name=\"legendposition\"   value=\"400,10\">");
	retString.append("<PARAM name=\"legendtitle\"      value=\""+legend_title+"\">");
	retString.append("<PARAM name=\"LegendBackground\" value=\"255,255,255\">");
	retString.append("<PARAM name=\"LegendBorder\"     value=\"125,125,125\">");
	retString.append("<PARAM name=\"LegendtextColor\"  value=\"0,0,0\">");
	retString.append("<!-- Title -->");
	retString.append("<!-- title   text|xpos,ypos|Font|Color Defintion\"> -->");
	retString.append("<PARAM name=\"title\" value=\""+legend_label+"|0,15|Arial,BI,10|grey\">");
	retString.append("<!-- Free Form Text -->");
	return retString.toString();
}

%>
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
	
function setTabPageHeight() {
	if (document.getElementById("tabGeneral")) {
		var page1Height = document.getElementById("field1").offsetHeight;
		document.getElementById("tabGeneral").style.height = page1Height +"px";
	}
	if (document.getElementById("tabPage2")) {
		var page2Height = document.getElementById("field2").offsetHeight;
		document.getElementById("tabPage2").style.height = page2Height +"px";
	}
	if (document.getElementById("tabSecurity")) {
		var page3Height = document.getElementById("field3").offsetHeight;
		document.getElementById("tabSecurity").style.height = page3Height +"px";
	}
	if (document.getElementById("tabPage4")) {
		var page4Height = document.getElementById("field4").offsetHeight;
		document.getElementById("tabPage4").style.height = page4Height +"px";
	}
	if (document.getElementById("tabPage3")) {
		var page5Height = document.getElementById("field5").offsetHeight;
		document.getElementById("tabPage3").style.height = page5Height +"px";
	}
//	alert(document.getElementById("tabGeneral").style.height);
}
</script>
</head>
<body class="call_body" onLoad="displayCallingListInfo();setTabPageHeight()" onUnload="return checkOnUnload()">

<%
	String totNbEntered ="" ;
    String totNbAnswered = "" ;
    String totNbAbandonned = "" ;
	String lang = "0";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");
%>

	<div class="tab-pane" id="tabPane1">
		<form name="callingList" onKeyDown="KeyDownHandler(save)">
			<script type="text/javascript">
				tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
			</script>

			<div class="tab-page" id="tabGeneral" style="height:200px;">
				<h2 class="tab"><%= pageData.getWord("General")%></h2>
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
				<fieldset id="field1">
					<legend><%=pageData.getWord("Modify Calling list information")%></legend>
					<table border="0">
						<tr>						
							<td><%= pageData.getWord("Calling list name")%></td>
							<td colspan="2"><input name="name" size="37" onfocus="enabledUpdateButton()" style="float: left"></td>
						</tr>
						<tr>						
							<td valign="top"><%= pageData.getWord("Description")%></td>
							<td colspan="2"><textarea wrap="hard" rows="4" name="description" style="width:98% " onfocus="enabledUpdateButton()"></textarea></td>
						</tr>
						<tr>						
							<td><%= pageData.getWord("Associated table name")%></td>
							<td colspan="2"><input name="table_name" size="37" onChange="enabledUpdateButton()"></td>
						</tr>
						<tr>	
							<td><%= pageData.getWord("Maximum attempts")%></td>
							<td colspan="2">
								<input type="checkbox" name="UnlimitCkB" value="ON" onClick="enabledUpdateButton();validateMaxAttempts();" checked>
								<%= pageData.getWord("Unlimited")%>						
								<input disabled name="MaxAttemptsTxt" size="3" onChange="validateMaxAttempts();enabledUpdateButton();" style="float: left">
							</td>
						</tr>
						<tr>
							<td><%= pageData.getWord("Active")%></td> 
							<td colspan="2"><input type="checkbox" name="state" value="ON" onClick="enabledUpdateButton()" checked></td>	
						</tr>
						<tr>
							<td><%= pageData.getWord("Campaign") %></td> 
							<td colspan="2">
						<%
						ps = pageData.buildPreparedStatement("SELECT name, dbid FROM cfg_campaign WHERE dbid=(SELECT campaign_dbid FROM cfg_calling_list WHERE dbid=?)");
						ps.setInt(1, dbid);
						rs = ps.executeQuery();
						if(rs.next()){
							 if (pageData.userHasRight(userRightsDataResult, "ALLOW_CAMPAIGN_MANAGEMENT")) {
								String campainLink =  "campaign.jsp?campaign_name=" + rs.getString(1) + "&tenant_dbid="+ tenantDbid +"&dbid="+rs.getString(2) ;
							  	out.println( "<a href="+campainLink + ">" + rs.getString(1) + "</a>" );

							  }else{	
								out.println(rs.getString(1));   
							  }
						}
						%>
							</td>	
						</tr>
						<tr>
							<td colspan="2" align='center'>
								<input disabled id="save" name="updateInfo" type="button" value="<%= pageData.getWord("Update")%>" onClick="saveCallingList()">
								<input name="deleteCallList" type="button" value="<%= pageData.getWord("Delete")%>" onClick="askDelete()">
							
							</td>						
						</tr>
					</table>			
				</fieldset>
			</div>


			<div class="tab-page" id="tabPage2" style="height:200px;">
				<h2 class="tab"><%= pageData.getWord("Treatments")%></h2>
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );</script>
				<table id="field2" width="95%">
					<tr>
						<td width="15%"><%= pageData.getWord("Current filter")%></td>
						<td colspan="2">
							<input type="text" name="selectedFilter" size="37" disabled="true" value="" />
							&nbsp;
							<input name="RemoveFilterButton" type="button" value="<%= pageData.getWord("Delete")%>" onClick="removeAssociatedFilter()">
						</td>
						<td align="right"></td>
					</tr>
					<tr>
						<td valign="top"><%= pageData.getWord("Available Filters")%></td>
						<td colspan="3">
							<select size="4" style="width:45%; margin-bottom:4px;" name="availableFilters" onChange="enabledAddFilterButton()">
							</select>
							<br />
							<font style="color: #D40000; font-weight:bold">
							<% out.println(pageData.getWord("Warning") +": "+pageData.getWord("Applying an invalid filter might block the calling list operations")); %>
							</font>
							<br/>
							<input  disabled name="addFilter"  class="grayBut01"  type="button" value="<%= pageData.getWord("Apply filter")%>" onClick="AddSelectedFilter()" style="margin-top:8px;">
						</td>
					</tr>
					<tr>
						<td valign="top"><%= pageData.getWord("Treatments")%></td>
						<td width="37%">
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td><%= pageData.getWord("Available Treatments")%></td>
								</tr>
								<tr>
									<td>
										<select name="availableTreatments" size="5" multiple style="width:98% ">
										</select>							
									</td>
								</tr>
							</table>
						</td>
						<td valign="middle" width="10%" align="center">
							<img src="../img/left_to_right.gif" style="cursor:pointer " onclick="javascript:chkAndAddTreatmentToGroup()" /><br />
							<img src="../img/right_to_left.gif"  style="cursor:pointer " onclick="javascript:chkAndDropTreatmentFromGroup()"/>
						</td>
						<td width="37%">
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td><%= pageData.getWord("Selected Treatments")%></td>
								</tr>
								<tr>
									<td>
										<select  name="selectedTreatments" size="5" multiple style="width:98%">
										</select>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>				
			</div>
			
			
	<%if(userManagementAllowed) { %>
			<div class="tab-page" id="tabSecurity" style="height:200px;">
				<h2 class="tab"><%=pageData.getWord("Security")%></h2>
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabSecurity" ) );</script>
				<fieldset id="field3">
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
					%>
									<option value="<%=userDbid%>"><%=userName%></option>
					<%}	%>
								</select>
							</td>
							<td valign=middle>
								&nbsp;<img src="../img/left_to_right.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('notAllowedUsers', 'allowedUsers')"/>&nbsp;<br>
								&nbsp;<img src="../img/right_to_left.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('allowedUsers', 'notAllowedUsers')"/>&nbsp;
							</td>
							<td align="center">
								<select id="allowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="allowedUsers" size="5" multiple="multiple">
					<%for(int i = 0; i < listAllowedUsersDataResult.size(); i++)
					{
						String userDbid = (String)listAllowedUsersDataResult.elementAt(i).get("USER_DBID");
						String userName = (String)listAllowedUsersDataResult.elementAt(i).get("USERNAME");
					%>
									<option value="<%=userDbid%>"><%=userName%></option>
					<%}	%>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3" align="left">
								<input name="updateInfoSecurity" type="button" value="<%=pageData.getWord("Update")%>" onClick="saveCallingList()">
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
	<% } %>
		
			<div class="tab-page" id="tabPage4" style="height:200px;">
				<form method="POST" name="screenPop" action="modifyCallingList.jsp">
		     		<h2 class="tab"><%= pageData.getWord("Screen pop")%></h2>
		     		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage4" ) );</script>
					<div id="field4">
						<table width="80%">
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td width="40%">
									<fieldset style="width:30%; height:70px;">
										<legend><%= pageData.getWord("Modification type")%></legend>
										<input type="radio" name="modifyScreenPopOption" onClick="handleModifyingExtaDataType(this);" value="all"><%= pageData.getWord("Modify all URL")%><br/>
										<input type="radio" name="modifyScreenPopOption" onClick="handleModifyingExtaDataType(this);" value="each"><%= pageData.getWord("Modify each URL")%> 
									</fieldset>
								</td>
								<td align="right" width="20%">
									<fieldset style="height:70px;">
										<legend><%= pageData.getWord("Modify all URL")%></legend> 
										<%= pageData.getWord("New URL")%><input type="text" name="allextradata" id="allextradata"  size="50" value="" >
									</fieldset>
								</td>
							</tr>
						</table>
						<br/>
						<fieldset style="width:79%;"> 
							<legend><%= pageData.getWord("Modify each URL")%></legend> 
							<table border="1" cellpadding="0" cellspacing="1" bordercolor="#DDDDEE" bgcolor="#DDDDEE" width="100%">
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>						
									<td class="reportsTabName" width="55%" align="center"><%= pageData.getWord("Old")%></td>
									<td class="reportsTabName" width="30%" align="center"><%= pageData.getWord("New")%></td>
								</tr>
								
						<%

							Vector receievedExtradata  = extra.loadExtrada((String) request.getParameter("callinglistName") );
							Iterator extraIt   =  receievedExtradata.iterator();
							int ind =   0;
	 	       					while(extraIt.hasNext()) {
	 	    	   					 String currentData  =  (String) extraIt.next(); 
 
                                                                 String fieldId      =  "newExtraDatas"+ind;
									
                                                                 out.write("<tr> ");

                                                                 String ccsClassName =   (ind % 2 == 0) ?  "reportsRowPair" :  "";
                                                                 out.write("           <td class='"+ccsClassName+"' align='left' style='padding-right:20px;'>"+ currentData +"</td>");
                                                                 out.write("           <td class='"+ccsClassName+"'><input size='50' type='text' name='newExtraDatas' id='"+fieldId+"'></td>" );
                                                                 out.write("           <input size='30' type='hidden' name='oldExtraDatas' value=\""+currentData+"\" >" );

                                                                 out.write("</tr> ");

								 ind++;
	 	       					}
						%>
										
							</table>
							<input type="hidden" name="dbid" value="<%= callingListDbid %>">
							<input type="hidden" name="tenant_dbid" value="<%= tenantDbid %>">
							<input type="hidden" name="callinglistName" value="<%= request.getParameter("callinglistName") %>">
							<input type="hidden" name="isExtraDataForm" value="1">
							<br/>
						</fieldset>
						<br/>
						<br/>
						<table>
							<tr>
								<td colspan="2" align='left' bgcolor="#FFFFFF" >
									<input  id="save" name="updateUrl" type="submit" value="<%= pageData.getWord("Update")%>">
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
	
	
	
			<div class="tab-page" id="tabPage3" style="height:200px;">
				<h2 class="tab"><%= pageData.getWord("Statistics")%></h2>		
				<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) );</script>	
				<div id="field5">
		<% 
		    
			String list_name 	= request.getParameter("callinglistName");
			String tenant_dbid 	= request.getParameter("tenant_dbid");
			String table_name 	= "";
			String _Dials = pageData.getWord("Dials");// used in pie chart applet
			out.write("<b>"+pageData.getWord("List name")+": </b><i>"+list_name+"</i><br />");
			//get the table name
		
			if(list_name.compareTo("") != 0 && tenant_dbid.compareTo("") != 0){
				
				String getTableNameQuery = "SELECT TABLE_NAME FROM `cfg_calling_list` WHERE NAME=\""+list_name+"\" AND TENANT_DBID=\""+tenant_dbid+"\" LIMIT 0,1";
				//out.write("getTableNameQuery="+getTableNameQuery);
				java.sql.Statement  stat = null;
        		java.sql.Connection conn = null;
				DataSource          m_ds = null;
				
				String diagramWidth = "500";
				String diagramHeight = "200";
				String chartXPos = "175";
				String chartYPos = "30";
				String chartDiameter = "125";
				String chartDetachFactor = "5";
				
				
				try{            
					Context init = new InitialContext();
					Context ctx = (Context) init.lookup("java:comp/env");
					if(ctx == null )
						throw new Exception("Boom - No Context");
					
					m_ds = (DataSource) ctx.lookup("jdbc/aheevaccs");
					if (m_ds != null) 
					{
						System.out.println("Got Context");
					}
					conn = m_ds.getConnection();
            		stat = conn.createStatement();
					
					rs = stat.executeQuery(getTableNameQuery);
					if(rs.next()){					
						table_name = rs.getString("TABLE_NAME");
					}
					rs.close();
					String tmp1 = "", tmp2 = "", tmp3 = "";
					int nbColonnes = 0;
					String pos = "";
					java.sql.ResultSet rs_clStats;
					String buildChartString = "";
					String sql_record = "";
					out.write("<table width=\"95%%\" align=\"center\"><tr><td align=\"center\">");
					if(table_name.compareTo("") != 0){
						sql_record 	= "SELECT COUNT(*) AS TOTAL, RECORD_STATUS AS COL_LABEL FROM `"+table_name+"` GROUP BY RECORD_STATUS";
						nbColonnes = 0;
						tmp1 = "";
						tmp2 = "";
						tmp3 = "";
						pos = "1";						
						rs_clStats = stat.executeQuery(sql_record);
						
						//CHART 1 -------------------------
						out.write("<applet code=\"Manager.PieChart.PiechartApplet.class\" archive=\"../sAheevaChart.jar\" width=\""
									+ diagramWidth + "\" height=\"" + diagramHeight + "\" mayscript name=\"graphApplet\">");
						out.write( buildChart(pageData.getWord("Per record status"), _Dials ));						
												
						buildChartString = "";
						while( rs_clStats.next() ){
							nbColonnes++;
							tmp1 	+= "<PARAM name=\"pie" + pos + "label" + nbColonnes + "\" value=\"" + pageData.getWord(rs_clStats.getString("COL_LABEL"))+"\">";
							tmp2 	+= "<PARAM name=\"segment"+nbColonnes+"\" value=\""+(100+nbColonnes*10)+","+(130+nbColonnes*10)+","+(150+nbColonnes*10)+"|"+rs_clStats.getString("COL_LABEL")+"\">";
							tmp3 	+= "<PARAM name=\"data"+nbColonnes+"series"+pos+"\" value=\""+rs_clStats.getString("TOTAL")+"\">";
						}
						buildChartString += "<PARAM name=\"Pie"+pos+"\" value=\"" + chartXPos + "," + chartYPos + "," 
												+ chartDiameter + "," + nbColonnes + "," + chartDetachFactor + "\">";
						buildChartString += tmp1;
						buildChartString += tmp2;						
						buildChartString += tmp3;
						out.write( buildChartString );
						out.write("</applet>");			
						
						out.write("</td></tr><tr><td align=\"center\">");
						
						sql_record = "SELECT COUNT(*) AS TOTAL, CALL_RESULT AS COL_LABEL FROM `"+table_name+"` GROUP BY CALL_RESULT";
						nbColonnes = 0;
						tmp1 = "";
						tmp2 = "";
						tmp3 = "";
						pos = "1";						
						rs_clStats = stat.executeQuery(sql_record);
						
						//CHART 2 ---------------------------
						out.write("<applet code=\"Manager.PieChart.PiechartApplet.class\" archive=\"../sAheevaChart.jar\" width=\""
									+ diagramWidth + "\" height=\"" + diagramHeight + "\" mayscript name=\"graphApplet\">");						
						out.write( buildChart(pageData.getWord("Per call result"), _Dials ));	
						
						buildChartString = "";
						while( rs_clStats.next() ){
							nbColonnes++;
							tmp1 	+= "<PARAM name=\"pie"+pos+"label"+nbColonnes+"\" value=\""+pageData.getWord(rs_clStats.getString("COL_LABEL"))+"\">";
							tmp2 	+= "<PARAM name=\"segment"+nbColonnes+"\" value=\""+(90+nbColonnes*10)+","+(80+nbColonnes*10)+","+(60+nbColonnes*10)+"|"+rs_clStats.getString("COL_LABEL")+"\">";
							tmp3 	+= "<PARAM name=\"data"+nbColonnes+"series"+pos+"\" value=\"" + rs_clStats.getString("TOTAL") + "\">";
						}
						buildChartString += "<PARAM name=\"Pie"+pos+"\" value=\"" + chartXPos + "," + chartYPos + ","
												+ chartDiameter + "," + nbColonnes + "," + chartDetachFactor + "\">";
						buildChartString += tmp1;
						buildChartString += tmp2;						
						buildChartString += tmp3;
						out.write( buildChartString );
						out.write("</applet>");
						
						out.write("</td></tr><tr><td align=\"center\">");
						
						sql_record = "SELECT COUNT(*) AS TOTAL, RECORD_TYPE AS COL_LABEL FROM `"+table_name+"` GROUP BY RECORD_TYPE";
						nbColonnes = 0;
						tmp1 = "";
						tmp2 = "";
						tmp3 = "";
						pos = "1";						
						rs_clStats = stat.executeQuery(sql_record);  	
						
						//CHART 3 -----------------------------------
						out.write("<applet code=\"Manager.PieChart.PiechartApplet.class\" archive=\"../sAheevaChart.jar\" width=\""
									+ diagramWidth + "\" height=\"" + diagramHeight + "\" mayscript name=\"graphApplet\">");
					//	out.write( buildChart("<script>document.write(MultiArray[\"Per record type\"][lang]);</script>") );						
						out.write( buildChart(pageData.getWord("Per record type"), _Dials ));
						
						
						buildChartString = "";
						while( rs_clStats.next() ){
							nbColonnes++;
							tmp1 	+= "<PARAM name=\"pie"+pos+"label"+nbColonnes+"\" value=\""+pageData.getWord(rs_clStats.getString("COL_LABEL"))+"\">";
							tmp2 	+= "<PARAM name=\"segment"+nbColonnes+"\" value=\""+(255-nbColonnes*10)+","+(100+nbColonnes*10)+","+(150-nbColonnes*10)+"|"+rs_clStats.getString("COL_LABEL")+"\">";
							tmp3 	+= "<PARAM name=\"data"+nbColonnes+"series"+pos+"\" value=\""+rs_clStats.getString("TOTAL")+"\">";
						}
						buildChartString += "<PARAM name=\"Pie"+pos+"\" value=\"" + chartXPos + "," + chartYPos + "," 
												+ chartDiameter + "," + nbColonnes + "," + chartDetachFactor + "\">";
						buildChartString += tmp1;
						buildChartString += tmp2;						
						buildChartString += tmp3;
						//out.write( buildChartString( rs_clStats , "1") );
						out.write( buildChartString );
						out.write("</applet>");
						
						out.write("</td></tr><tr><td align=\"center\">");
						
						sql_record = "SELECT COUNT(*) AS TOTAL, DAYNAME(CALL_TIME) AS COL_LABEL FROM `"+table_name+"` WHERE RECORD_STATUS='Updated' and CALL_RESULT='answered' GROUP BY  DAYNAME(CALL_TIME)";
						nbColonnes = 0;
						tmp1 = "";
						tmp2 = "";
						tmp3 = "";
						pos = "1";						
						rs_clStats = stat.executeQuery(sql_record);		
						//CHART 4 -----------------------------------
						out.write("<applet code=\"Manager.PieChart.PiechartApplet.class\" archive=\"../sAheevaChart.jar\" width=\""
									+ diagramWidth + "\" height=\"" + diagramHeight + "\" mayscript name=\"graphApplet\">");
			//			out.write( buildChart("<script>document.write(MultiArray[\"Answers per day\"][lang]);</script>") );						
						out.write( buildChart(pageData.getWord("Answers per day"), _Dials ));
						
						buildChartString = "";
						while( rs_clStats.next() ){
							nbColonnes++;
							tmp1 	+= "<PARAM name=\"pie"+pos+"label"+nbColonnes+"\" value=\""+pageData.getWord(rs_clStats.getString("COL_LABEL"))+"\">";
							tmp2 	+= "<PARAM name=\"segment"+nbColonnes+"\" value=\""+(50+nbColonnes*10)+","+(100+nbColonnes*10)+","+(150+nbColonnes*10)+"|"+rs_clStats.getString("COL_LABEL")+"\">";
							tmp3 	+= "<PARAM name=\"data"+nbColonnes+"series"+pos+"\" value=\""+rs_clStats.getString("TOTAL")+"\">";
						}
						buildChartString += "<PARAM name=\"Pie"+pos+"\" value=\"" + chartXPos + "," + chartYPos + "," 
												+ chartDiameter + "," + nbColonnes + "," + chartDetachFactor + "\">";
						buildChartString += tmp1;
						buildChartString += tmp2;						
						buildChartString += tmp3;
						//out.write( buildChartString( rs_clStats , "1") );
						out.write( buildChartString );
						out.write("</applet>");
						
						out.write("</td></tr></table>");
						
						
						rs_clStats.close();
						
					}			
					
					stat.close();
            		conn.close();
				}catch(Exception e){
					e.printStackTrace();					
					stat.close();
            		conn.close();					
				}
				
			}
			
	
		
		%>
		
				</div>
			</div>
	
		</form>

	</div>
<script type="text/javascript">
	//<![CDATA[
	setupAllTabs();
	//]]>
</script>

</body>
<% pageData.closeConnection(); %>
</html>
