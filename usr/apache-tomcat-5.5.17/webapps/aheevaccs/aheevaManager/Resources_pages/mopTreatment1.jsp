<html>
	<head>
	<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
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
		<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css">
			<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css">
				<LINK href="style.css" rel="stylesheet" type="text/css">
					<LINK href="livestats.css" rel="stylesheet" type="text/css">
						<meta http-equiv="Content-Language" content="en-us">
						<style type="text/css"> .dynamic-tab-pane-control .tab-page { height: 100%; overflow: auto; }
	.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page { /*height: 100px; }
	html, body { /* background: ThreeDFace; */ }
	form { margin: 0; padding: 0; }
	/* over ride styles from webfxlayout */ body { margin: 10px; width: auto; height: auto; }
	.dynamic-tab-pane-control h2 { text-align: center; width: auto; }
	.dynamic-tab-pane-control h2 a { display: inline; width: auto; }
	.dynamic-tab-pane-control a:hover { background: transparent; }
	</style>
	<%@ include file="mopTreatmentsFunctions_labels.jsp" %>
						<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
						<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
						<script language="javascript" type="text/javascript" src="Browser.js"></script>
						<script language="javascript" type="text/javascript" src="tabpane.js"></script>
						<script language="javascript" type="text/javascript" src="mopTreatmentsFunctions.js"></script>
						<script language="javascript" type="text/javascript"></script>
						<script>
var nrows = 1 ;
var maxrow = 1;
						</script>
						
<style type="text/css"> tr.main_line{ vertical-align:top; }
	td.main1{ text-align:center; width:33%; }
	td.main2{ text-align:center; width:25%; }
	td.main3{ text-align:center; /*prend le width restant*/ }
	td.element_right{ text-align:right; }
	td.element_center{ text-align:center; }
	table.main_line_case{ display:"none"; }
	a.delete{ text-decoration:underline; color:000000; }
	a.delete:hover{ text-decoration:underline; color:000000; }
	a.delete:active{ text-decoration:underline; color:000000; }
	</style>
	</head>

	<body class="f_i_com_body" onLoad="displayMopTreatmentInfo()">
		<div class="tab-pane" id="tabPane1">
			<form name="mop_treatment_form" onKeyDown="KeyDownHandler(save)">
				<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
				</script>
				<div class="tab-page" id="tabGeneral">
					<h2 class="tab"><%= pageData.getWord("General")%></h2>
					<fieldset>
						<legend>
							<%= pageData.getWord("General settings")%>
						</legend>
						<table border="0">
							<tr>
								<td height="22">&nbsp;
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td width="197" height="22"><%= pageData.getWord("Commission name")%><br>
									<%= pageData.getWord("(associated to a MOP)")%>
								</td>
								<td width="292" height="22" align="left"><input type="text" name="mopTreatmentName" onClick="enabledUpdateButton()" size="20"></td>
							</tr>
							<tr>
								<td width="197" height="24"><%= pageData.getWord("Description")%></td>
								<td width="292" height="50"><textarea rows="3" name="mopTreatmentDescription" cols="41" onClick="enabledUpdateButton()"></textarea></td>
							</tr>
							<tr>
								<td width="197" height="25">
									<%= pageData.getWord("Max commission value")%>
								</td>
								<td>
									<input id="maxCommissionValue" type="text" name="maxCommissionValue" size="10" value="0.00"
										onClick="enabledUpdateButton()">
									<%= pageData.getWord("per work hour")%>
								</td>
							</tr>
							<tr>
								<td width="197" height="25">
									<%= pageData.getWord("Active")%>
									<input id="mopTreatmentStatus" type="checkbox" name="mopTreatmentStatus" value="ON" onClick="enabledUpdateButton()"
										checked>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
				<!------------ TAB COMMISSION ----------------------------
				-Fixed commission
				-Sales-based commission:-Average sales per hour
										-Sales per week
										-Sales per unit
				-Commission based on group average:	-Net conversion rate
													-Sales per week
				-Performance-based commission:	-Net conversion rate
												-Sales per week
				-->
				<div class="tab-page" id="tabCommissions">
					<h2 class="tab"><%= pageData.getWord("Commissions")%></h2>
					<fieldset id="FIELDSET2">
						<legend>
						<%= pageData.getWord("Commissions settings")%>
						</legend>
						<table border="0" width="100%" height="100%" ID="Table1">
							<tr class="main_line">
								<td class="main1">
									<fieldset>
										<!--
										Premier field set: Choose commission type
							
										-->
										<legend><%= pageData.getWord("Step")%> #1</legend>
										<b><%= pageData.getWord("Choose commission type")%></b>
										<table  class="main_line_case2">
											<tr>
												<td align="right" height="21"><%= pageData.getWord("Fixed commission")%>
													<input id="Radio1.1" type="radio" name="Radio1" value="1"
														onClick="javascript:toggleLayer('fixed')" onChange="enabledUpdateButton()">
												</td>
											</tr>
											<tr>
												<td align="right" height="20"><%= pageData.getWord("Sales-based commissions")%>
													<input id="Radio1.2" type="radio" name="Radio1" value="2" onClick="javascript:toggleLayer('sales')"
														onChange="enabledUpdateButton()">
												</td>
											</tr>
											<tr>
												<td align="right" height="20"><%= pageData.getWord("Commissions based on group average")%>
													<input id="Radio1.3" type="radio" name="Radio1" value="3" onClick="javascript:toggleLayer('group')"
														onChange="enabledUpdateButton()">
												</td>
											</tr>
											<tr>
												<td align="right" height="20"><%= pageData.getWord("Performance-based commission")%>
													<input id="Radio1.4" type="radio" name="Radio1" value="4" onClick="javascript:toggleLayer('group')"
														onChange="enabledUpdateButton()">
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
								<td class="main2">
									<!--
								2è fieldset: Contient toutes les options relatives au choix du premier field set
								-->
									<fieldset>
										<legend><%= pageData.getWord("Step")%>#2</legend>
										<table id="Sales-based_table" class="main_line_case">
											<tr>
												<td class="element_center"><b><%= pageData.getWord("Based on")%></b></td>
											</tr>
											<tr>
												<td class="element_right"><%= pageData.getWord("Average sales per hour")%>
													<input id="Radio2.1.1" type="radio" name="Radio2_1" value="1" onChange="enabledUpdateButton()" onClick="javascript:toggleLayer('range')">
												</td>
											</tr>
											<tr>
												<td class="element_right"><%= pageData.getWord("Sales per week")%>
													<input id="Radio2.1.2" type="radio" name="Radio2_1" value="2" onChange="enabledUpdateButton()" onClick="javascript:toggleLayer('range')">
												</td>
											</tr>
											<tr>
												<td class="element_right"><%= pageData.getWord("Sales per unit")%>
													<input id="Radio2.1.3" type="radio" name="Radio2_1" value="3" onChange="enabledUpdateButton()" onClick="javascript:toggleLayer('unit')">
												</td>
											</tr>
										</table>
										<table id="group_average" class="main_line_case">
											<tr>
												<td class="element_center"><b><%= pageData.getWord("Based on")%></b></td>
											</tr>
											<tr>
												<td class="element_right"><%= pageData.getWord("Net conversion rate")%>
													<input id="Radio2.2.1" type="radio" name="Radio2_2" value="1" onChange="enabledUpdateButton()" onClick="javascript:toggleLayer('range')">
												</td>
											</tr>
											<tr>
												<td class="element_right"><%= pageData.getWord("Sales per week")%>
													<input id="Radio2.2.2" type="radio" name="Radio2_2" value="2" onChange="enabledUpdateButton()" onClick="javascript:toggleLayer('range')">
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
								<td  class="main3">
								<!--
								3è fieldset: Les box pour entrer les données
								-->
									<fieldset>
										<legend><%= pageData.getWord("Step")%> #3</legend>
										<table ID="field3.1" class="main_line_case">
											<tr><td class="element_center"><b>Set the amount</b></td></tr>
											<tr><td class="element_center">Pay:<input type="text" size="5" id="amount" NAME="amount"></td></tr>
										</table>
										<table ID="field3.2" class="main_line_case">
											<tr>
												<td class="element_center"><b><%= pageData.getWord("Set your ranges")%></b></td>
											</tr>
											<tr>
												<td class="element_center">
												<input id="addRowButton4" name="addRowButton4" type="button" value='<%= pageData.getWord("Add a new range")%>' onClick="addMyRow('', '', '');enabledUpdateButton()">
												</td>
											</tr>
											<tr>
												<td class="element_center">
													<div id="ranges" style="MARGIN: 0px 5px">
													</div>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>						
					</fieldset>
				</div>
				<!------------------------------- tab HELP ------------------------------------------->
				<div class="tab-page" id="tabHelp">
					<h2 class="tab"><%= pageData.getWord("Help")%></h2>
					<fieldset>
						<legend>
							<%= pageData.getWord("Help for commissions")%>
						</legend>
						<table border="0">
							<tr>
								<td height="21">&nbsp;
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td width="600">
									<br>
									<b>
										<%= pageData.getWord("General")%>
									</b>
									<br>
									<%= pageData.getWord("This tab allows you to set a name(mandatory) for your MOP treatment. You can also set a description and a status (active by default) for your MOP treatment.")%>
									<br>
									<br>
									<b>
									<%= pageData.getWord("Commissions")%>
									</b>
									<br>
									<%= pageData.getWord("This tab allows you to set the type of commission for your treatment. If your treatment doesn't need a commission, you must select a fixed commission and set its value to 0.")%>
									<br>
									<br>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
				<tr>
					<td align="center">
						<input disabled id="save" name="updateInfo" type="button" value='<%= pageData.getWord("Update")%>' onClick="validateInfo()">
						<input class="delete-button" name="deleteMopTreatment" type="button" value='<%= pageData.getWord("Delete")%>' onClick="askDelete()">
					</td>
				</tr>
			</form>
		</div>
		<!-- Statistiques -->
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<script type="text/javascript">
		document.getElementById( "tabHelp" ).style.display = "none";
			if(QueryString('mop_treatment_name') != ""){
				tp1.addTabPage( document.getElementById( "tabCommissions" ) );		
				tp1.addTabPage( document.getElementById( "tabHelp" ) );
			document.getElementById( "tabHelp" ).style.display = "block";		
			}
		</script>
</body>
<% pageData.closeConnection(); %>
</html>