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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >
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
/*	background:	ThreeDFace; */

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
<%@ include file="mopFunctions_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="mopFunctions.js"></script>
<script>
function askHelp(URL) {
day = new Date();
id = day.getTime();
eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=300');");
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
</script>

</head>

<body class="mop_body" onLoad="displayMopInfo()" >


<div class="tab-pane" id="tabPane1">
<form name="mop_form" onKeyDown="KeyDownHandler(save)">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
	<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><%= pageData.getWord("General")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<fieldset>
			<legend><%= pageData.getWord("General settings")%></legend>
			<table border="0">
			  <tr>
			   <td height="21">&nbsp;			   </td>
			   <td>			   </td>
			  </tr>
				<tr>
					<td width="197" height="22"><%= pageData.getWord("Method of payment")%></td>
					<td width="292" height="22" align="left"><input type="text" name="mopName" onClick="enabledUpdateButton()" size="20"></td>
				</tr>
				<tr>
					<td width="197" height="24"><%= pageData.getWord("Description")%></td>
					<td width="292"height="50"><textarea rows="3" name="mopDescription" cols="41" onChange="enabledUpdateButton()"></textarea></td>
				</tr>
				<tr>
					<td width="197" height="25">
						<%= pageData.getWord("Active")%>
						<input id="mopStatus" type="checkbox" name="mopStatus" value="ON" onClick="enabledUpdateButton()" checked>					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div class="tab-page" id="tabCodes">
		<h2 class="tab"><%= pageData.getWord("Codes")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabCodes" ) );</script>
		<fieldset>
		<legend><%= pageData.getWord("MOP Codes")%></legend>
			<table border="0">
			  <tr>
			   <td height="21">&nbsp;			   </td>
			   <td>			   </td>
			  </tr>
				<tr>
					<td width="197" height="36"><%= pageData.getWord("Training Code")%></td>
					<td  width="293" height="36">
						<input type="text" maxlength="5" size="5" name="trainingCode" onClick="enabledUpdateButton()">
						<%= pageData.getWord("Hours")%><input type="radio" name="trainingCodeTag" value="1" checked>&nbsp;&nbsp;
						<%= pageData.getWord("Dollars")%><input type="radio" name="trainingCodeTag" value="2" disabled>					</td>
				</tr>
				<tr>
					<td width="197" height="36"><%= pageData.getWord("Integration Code")%></td>
					<td  width="293" height="36">
						<input type="text" maxlength="5" size="5" name="integrationCode" onClick="enabledUpdateButton()">
						<%= pageData.getWord("Hours")%><input type="radio" name="integrationCodeTag" value="1" checked>&nbsp;&nbsp;
						<%= pageData.getWord("Dollars")%><input type="radio" name="integrationCodeTag" value="2" disabled>				  </td>
				</tr>
				<tr>
					<td width="197" height="36"><%= pageData.getWord("Production Code")%></td>
					<td  width="293" height="36">
						<input type="text" maxlength="5" size="5" name="productionCode" onClick="enabledUpdateButton()">
						<%= pageData.getWord("Hours")%><input type="radio" name="productionCodeTag" value="1" checked>&nbsp;&nbsp;
						<%= pageData.getWord("Dollars")%><input type="radio" name="productionCodeTag" value="2" disabled>					</td>
				</tr>
				<tr>
					<td width="197" height="36"><%= pageData.getWord("Overtime Code")%></td>
					<td  width="293" height="36">
						<input type="text" maxlength="5" size="5" name="overtimeCode" onClick="enabledUpdateButton()">
						<%= pageData.getWord("Hours")%><input type="radio" name="overtimeCodeTag" value="1" checked>&nbsp;&nbsp;
						<%= pageData.getWord("Dollars")%><input type="radio" name="overtimeCodeTag" value="2" disabled>					</td>
				</tr>
				<tr>
					<td width="197" height="36"><%= pageData.getWord("Commission Code")%></td>
					<td  width="293" height="36">
						<input type="text" maxlength="5" size="5" name="commissionCode" onClick="enabledUpdateButton()">
						<%= pageData.getWord("Hours")%><input type="radio" name="commissionCodeTag" value="1" disabled>&nbsp;&nbsp;
						<%= pageData.getWord("Dollars")%><input type="radio" name="commissionCodeTag" value="2" checked>					</td>
				</tr>
				<tr>
					<td width="197" height="36"><%= pageData.getWord("Continuing training Code")%></td>
					<td  width="293" height="36">
						<input type="text" maxlength="5" size="5" name="continuingTrainingCode" onClick="enabledUpdateButton()">
						<%= pageData.getWord("Hours")%><input type="radio" name="continuingTrainingCodeTag" value="1" checked>&nbsp;&nbsp;
						<%= pageData.getWord("Dollars")%><input type="radio" name="continuingTrainingCodeTag" value="2" disabled>					</td>
				</tr>
			</table>
		</fieldset>	
	</div>
	<div class="tab-page" id="tabTreats">
		<h2 class="tab"> <%= pageData.getWord("Commissions")%></h2>
		<script type="text/javascript">
			if(QueryString('mopName') != null)
				tp1.addTabPage( document.getElementById( "tabTreats" ) );
		</script>
		<fieldset>
		<legend><%= pageData.getWord("Select a MOP commission")%></legend>
			<table border="0">
			  <tr>
			   <td height="21" align="center"><b><%= pageData.getWord("Available commissions")%></b>
			   </td>
			   <td>
			   </td>
			   <td align="center"><b><%= pageData.getWord("Selected commissions")%></b></td>
			  </tr>
			   <tr>
				<td width="43%" height="138" align="center">
				 <select width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="availableTreatments" size="10" multiple onChange="enabledAddButton()">
				 </select>
				</td>
				<td width="11%" height="138" bordercolordark="#c0c0c0" nowrap align="center">
				 <p> </p>
				 <p>
				 <button name="addButton"  disabled onClick="chkAndAddTreatmentToMop()" style="WIDTH: 40px; HEIGHT: 26px" type=button> &gt;&gt; </button></p>
				 <button name="dropButton" disabled onClick="chkAndDropTreatmentFromMop()" style="WIDTH: 40px; HEIGHT: 26px" type=button> &lt;&lt; </button>
				 <p>&nbsp;</p>
				</td>
				<td width="288%" height="138" bordercolor="#000000" align="center">
				 <select width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="selectedTreatments" size="10" multiple onChange="enabledDropButton()">
				 </select>
				</td>
			   </tr>
			
			</table>
		</fieldset>	
	</div>
<!--
	<div class="tab-page" id="tabHolidays">
		<h2 class="tab">Holidays</h2>
		<script type="text/javascript">
			if(QueryString('mopName') != null)
				tp1.addTabPage( document.getElementById( "tabHolidays" ) );
		</script>
		<fieldset>
		<legend>Holidays</legend>
			<table border="0">
			  <tr>
			   <td height="21">&nbsp;
			   </td>
			  </tr>
				<tr>
					<td width="197" height="36"><b>Select a date</b></td>
					<td  width="293" height="36">
						<input onClick="" type="text">
					</td>
				</tr>
			</table>
		</fieldset>	
	</div>
-->	
	<div class="tab-page" id="tabOvertime">
		<h2 class="tab"><%= pageData.getWord("Overtime")%></h2>
		<script type="text/javascript">
			tp1.addTabPage( document.getElementById( "tabOvertime" ) );
		</script>
		<fieldset>
		<legend><%= pageData.getWord("Overtime properties")%></legend>
			<table border="0">
			  <tr>
			   <td height="21">&nbsp;
			   </td>
			   <td>
			   </td>
			  </tr>
				<tr>
					<td width="197" height="36"><%= pageData.getWord("Number of weekly hours")%></td>
					<td  width="293" height="36">
						<input type="text" maxlength="5" size="10" name="weeklyHours" onKeyPress="enabledUpdateButton()">
					</td>
				</tr>
				<!--<tr>
					<td width="197" height="36"><b>Multiplicative factor</b><br>(in overtime)</td>
					<td  width="293" height="36">
						<input type="text" maxlength="5" size="10" name="multFactor">
					</td>
				</tr>-->
			</table>
		
      <p>&nbsp;</p>
      </fieldset>	
	</div>




	<div class="tab-page" id="tabHelp">
		<h2 class="tab"><%= pageData.getWord("Help")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabHelp" ) );</script>
		<fieldset>
			<legend><%= pageData.getWord("Help for methods of payment")%></legend>
			<table border="0">
			  <tr>
			   <td height="21">&nbsp;			   </td>
			   <td>			   </td>
			  </tr>
				<tr>
					<td width="600" >
					
		     <b><%= pageData.getWord("General")%></b><br>
		     <%= pageData.getWord("This tab allows you to set a name(mandatory) for your MOP. You can also set a description and a status (active by default) for your MOP.")%>
			<br><br>
			<b><%= pageData.getWord("Codes")%></b><br>
			<%= pageData.getWord("This tab allows you to set some codes for different activities. These activities are training, integration, production, commission and continuing training. These codes represent hourly rates(by default) or amount of money.")%>
			<br><br>
			<!-- <b><script>document.write(MultiArray["Commissions"][lang])</script> </b><br>
			<script>document.write(MultiArray["This tab allows you to choose a treatment for your MOP. You cannot choose more than one treatment."][lang])</script> 
			<br><br>  -->
			<b><%= pageData.getWord("Overtime")%></b><br>
			<%= pageData.getWord("This tab allows you to set a limit from which overtime hours will be counted. You can also set the multiplicative factor for overtime hours.")%>
			<br><br>
					
					</td>
					
				</tr>
				
			</table>
		</fieldset>
	</div>

<tr>
	   <td align="center">
	   
	   <input disabled id="save" name="updateInfo" type="button" value='<%= pageData.getWord("Update")%>'onClick="validateInfo()">
		<input name="deleteMop" type="button" value='<%= pageData.getWord("Delete")%>' onClick="askDelete()">
		
	
        </td>
	</tr>
</form>
</div>



</body>
<% pageData.closeConnection(); %>
</html>
