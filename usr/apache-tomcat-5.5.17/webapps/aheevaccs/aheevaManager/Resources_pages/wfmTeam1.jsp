<html>

<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import = "aheevaManager.ressources.*" %>

<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />

<!-- Start Tab pane -->
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {
	/*background:	ThreeDFace;*/
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
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>

<meta http-equiv="Content-Language" content="en-us">
<%@ include file="wfmTeam_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="wfmTeam.js"></script>

</head>

<body class="team_body" onLoad="displayTeamInfo()" onUnload=" return checkOnUnload()" >
	<div class="tab-pane" id="tabPane1">
	<form name="teamInfo" onKeyDown="KeyDownHandler(save)">
 <script type="text/javascript">
					tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
				</script>
				<div class="tab-page" id="tabGeneral">
					<fieldset>
					<legend id="caption"></legend>
 <table border="0" style="margin-top:10px;">
    
    <tr>
      <td><%= pageData.getWord("Team Name")%></td>
      <td colspan="2"><input name="teamname" type="text" onClick="enabledUpdateButton()"></td>
    </tr>
    <tr>
      <td><%= pageData.getWord("Team Leader")%></td>
      <td colspan="2"><input name="teamleader" type="text" onClick="enabledUpdateButton()"></td>
    </tr>
  </table>
<!--Assign an agent -->

<table border="0" cellpadding="0" cellspacing="0" width="561" id="AutoNumber2" height="157">
  <tr>
   <td height="10" width="75">&nbsp;</td>
  </tr>
  <tr>
   <td  height="146">
     <table border="0" width="100%" id="AutoNumber3" height="58" cellspacing="0" cellpadding="0" bordercolor="#C0C0C0" style="border-collapse: collapse">
          <tr>
            <td colspan="3" align="center" valign="center" ><%= pageData.getWord("Non-configured agent")%></td>
            <td align="center">&nbsp;</td>
            <td align="center" valign="center"><%= pageData.getWord("Assigned agent")%></td>
          </tr>
          <tr>
            <td height="52" colspan="3" align="center" valign="top" style="border-style: solid; border-width:0; padding-top:5px;"> 
             <select width="200" style="width: 200px;font-size: 8pt; font-weight: bold" name="nonConfiguredAgents" size="10" multiple onChange="enabledAddButton()"> 
             </select>
            </td>
            <td width="40" height="52" bordercolordark="#C0C0C0" nowrap align="center" style="padding-top:15px">
              <input type="button" name="addButton"  disabled="true" onClick="chkAndAddAgentToTeam()" style="width: 40; height: 26" value="&gt;&gt;">
              <p>&nbsp;</p>
              <input type="button" name="dropButton" disabled="true" onClick="chkAndDropAgentFromTeam()" style="width: 40; height: 26" value="&lt;&lt;">
              <p>&nbsp;</p></td>
            <td width="1314" height="52" valign="top" style="border-style: none; border-width:0; padding-top:5px;" bordercolor="#000000" align="center"> <select width="200" name="availableAgentInTeam" size="10" multiple  style="width: 200px; font-size: 8pt; font-weight: bold" onChange="enabledDropButton()"> </select>
            </td>
          </tr>
          <!-- update or delete your the changes -->
          <tr>
            <td width="351">&nbsp;</td>
            <td width="734">
		<input id="save" name="updateInfo" type="button" disabled="true" value='<%= pageData.getWord("Add team")%>' onClick="return saveInfo()">

	    </td>

            <td width="205">
			<input name="deleteInfo" type="button" disabled="true" value='<%= pageData.getWord("Delete team")%>' onClick="askDelete()">
 
            </td>
            <td width="40">&nbsp; </td>
            <td width="1314">&nbsp;</td>
          </tr>
        </table>
    </td>
  </tr>
</table>
				</fieldset>
				</div>
			</form >
	</div>
</body>
<% pageData.closeConnection(); %>
</html>