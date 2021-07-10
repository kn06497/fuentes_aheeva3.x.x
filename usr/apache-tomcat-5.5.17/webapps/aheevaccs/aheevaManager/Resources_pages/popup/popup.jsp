
<%@page import="aheevaManager.ressources.popbuilder.*"%>
<%@page import ="aheevaManager.ressources.*,java.util.*"%>
<%


beanManagerData pageData = new beanManagerData();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
else 
	pageData.setDefaultLanguage("ENGLISH");	

String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");

String xmlstr = request.getParameter("xmlstr");
Popup popup =new Popup(pageData);
String popup_dbid = (request.getParameter("popdbid")==null)?"":request.getParameter("popdbid");

String currentpagename =  (request.getParameter("currentpagename")==null)?"":request.getParameter("currentpagename");

if (xmlstr != null) {
	
	String del = request.getParameter("del");
	if ("1".equals(del) ) {
		if ( !"".equals(popup_dbid)) {
			popup.deletePopup(popup_dbid);
			popup_dbid = "";
		}
	} else {
		popup_dbid = popup.savePop(xmlstr,currentUserDbid);
	}
}
	

if ("".equals(popup_dbid)) {
	popup = new Popup(pageData);
	Date d = new Date();
	
	String uniqueid = String.valueOf(d.getTime());
	session.setAttribute("uniqueid",uniqueid);
}
else {
	popup = new Popup(popup_dbid,pageData);
	session.setAttribute("uniqueid","");
}

pageData.openConnection();	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<script>
var lab_state = "<%=popup.getState()%>";
 <%@ include file="include_labels.jsp"%>
</script>
<script language="javascript" type="text/javascript" src="popup.js"></script>
<script language="javascript" type="text/javascript" src="validation.js"></script>
<script language="javascript" type="text/javascript" src="../jsUtil.js"></script>
<script type="text/javascript" src="wz_jsgraphics.js"></script>
<style type="text/css">
<!--
html, body {
	height: 100%;
	overflow:auto;
}
body {
	height: 100%;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<LINK href="popup.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
var tenantDbid = <%=request.getParameter("tenant_dbid")%>
<%=popup.getListObject()%>
var uniqueid = "<%=(String)session.getAttribute("uniqueid")%>";

</script>

<script for="window" event="onload">

//alert("starting onload function - call inner html for 'hideloading'");
setPopWidth(popWidth);
setPopHeight(popHeight);
setPopBgColor(popBgColor);
setReqBgColor(reqBgColor);
setGridColor(myGridColor);
gridColor(gridCol.substr(gridCol.length-1,1));
document.getElementById("popw").value= getPopWidth();
document.getElementById("poph").value= getPopHeight();
 
<%=popup.drawPages()%>
// document.getElementById("popname").value = getPopDescription();
setPopDescription(getPopDescription());
initialPopName = popDescription;
<%
if (popup.getDbid().equals("")) {
	%>document.getElementById("introdiv").style.display="block";
	document.getElementById("introback").style.filter="alpha(opacity=90)";
	//document.getElementById("introdiv").style.-moz-opacity=".55";

	<%
};

%>
if (popState=="1") {
	document.getElementById("activeId").checked = true;
}
skinFit();
makeDraggablePop(document.getElementById("popupwin"));
makeDraggablePop(document.getElementById("popupalldetwin"));
fillProperties(-2);

var currentpagename = "<%=currentpagename%>";

var f_selected = 0;
for (var i=0; i < listPages.length;i++) {
	if (listPages[i].page_name==currentpagename) {
		document.getElementById(i).click();
		f_selected=1;
		break;
	}
}

if (f_selected==0 && listPages.length>0) {
	document.getElementById(0).click();
}
startPopType = popType;
//alert("full page loaded - hide 'hideloading");
document.getElementById("hideloading").style.display="none";


</script>
<script language="JavaScript">
<!--
window.onbeforeunload = exitPopup;
//-->
</script>

<title>Aheeva Form Builder</title>
</head>
<body onResize="skinFit()" window.onunload="unloadPopup()">

<div id="hideloading" style="position:absolute; top:0px; left:0px;width:100%; height:100%; z-index:300;" class="propdivbg">

	<table border=0 cellspacing=0 cellpadding=0 align="center" style="margin-top:70px">
		<tr>
			<td class="introContainer">
				<div class="introInnerBorder" style="width:367px; height:150px;">
					<div id="version" style="float:right; padding-right:4px; padding-top:2px; font-weight:normal;"><%=pageData.getWord("Form Builder Version Number") %></div><br /><br />
					<div id="prodname" style="float:right; padding-right:125px; padding-top:100px;"><%=pageData.getWord("FORM BUILDER")%></div>
				</div>
				<div id="actionMessage" style="width:300px; margin-left:40px; padding-top:4px; padding-left:5px; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#52636D;">
					
				</div>
				<div id="progressBar" style="width:300px; margin-left:40px; padding-top:9px; padding-bottom:14px; padding-left:5px; padding-right:0px; border-top-style:solid; border-top-width:1px; border-top-color:#B0CFE2; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#52636D; text-align:center;">
				<%=pageData.getWord("Loading")%>...<br /><br /><%=pageData.getWord("Please wait")%>.
				</div>
				<div style="width:300px; margin-left:40px; padding-bottom:4px; padding-left:5px; border-top-style:solid; border-top-width:1px; border-top-color:#B0CFE2; text-align:center;">
				
				</div>
			</td>
		</tr>
	</table>
</div>


<div id="maindiv" style="width:100%; height:100%;" class="maindivbg">
	<div id="menuDiv" style="position:absolute; top:0px; left:0px; height:62px;" class="toolbardivbg">
		<div id="toolbar"><%=popup.drawToolbar()%></div>
		
		<%if(popup.getState().equals("0")){ %>
		<div id="hidetools" style="position:absolute;top:0px;left:100px;width:0px;height:62px;" class="toolbardivbg">
		<div style="position:absolute;top:15px;left:165px;"><img id="poplock" src="../../img/popup/poplock1.gif" border="0" /></div><div style="position:absolute;top:8px;left:200px;line-height:18px;"><font color="#B2573B"><b><%=pageData.getWord("THIS FORM IS SET TO INACTIVE AND CANNOT BE EDITED")%></b></font><br /><%=pageData.getWord("To make changes set the form state to active")%>.</div>
		</div>
		<%} %>
		
		<div id="activelock" style="position:absolute; top:25px; left:0px;"><%=pageData.getWord("Active")%><input type='checkbox' value='1' id='activeId' onclick='setPopState(this)' <%if(popup.getTenantDbid()!= null && popup.getTenantDbid().equals("0")){out.print("DISABLED");} %> /></div>


	</div>
	
	<div id="pages" style="position:absolute; top:62px; left:0px; width:150px;" class="pagesbg"></div>
	<div id="pageshead" style="position:absolute; top:62px; left:0px; width:150px;" class="pagesbg">
	<div class="popdisplay" id="popdisplay" style="width:125px;" onmouseover='linkOverPopName(this)' onmouseout='linkOutPopName(this)' onClick="linkClickPopName(this);fillProperties(-2)"></div>
	</div>
	<div id="pagesDivOuter" style="position:absolute; top:62px; left:150px; overflow:scroll; background-image: url(../../img/popup/workgrid02.gif);">
		<div id="pagesDiv" class="cnvdivbg"><b><%=pageData.getWord("To start creating your form:")%></b><br /><br /><%=pageData.getWord("Add a new page with the button to the left,")%><br /><%=pageData.getWord("then click the page name to activate the work space")%></div>
	</div>
	<div id="propDiv" style="position:absolute; top:62px; width:200px; text-transform:capitalize;" class="propdivbg"></div>
	<div id="deleteBin" class="bin_off" style="position:absolute; width:39px; height:39px; visibility:hidden;" onmouseup="deleteBin()"></div>
	

	<%if(popup.getState().equals("0")){ %>	
	<div id="disablePropDiv" style="position:absolute;top:62px;width:200px;background-color:#E9E9E9;filter:alpha(opacity=40);"></div>
	<%} %>

	
</div>


<div id="menuBotDiv" style="position:absolute; top:10px; left:0px; width:10px; height:57px; text-transform:capitalize;" class="menubotdivbg">


<table border="0" cellpadding="0" cellspacing="0" class="botDivTable" id="botDivContent">
	<tr>
		<td align="left" valign="top" width="138px" class="botDivTableCol1">&nbsp;
			
		</td>
		<td align="left" valign="top" class="botDivTableCol2">
			<div class="botDivTableCol2Div1">
				<%=pageData.getWord("Form Settings")%>
			</div>
			<div>
				<span style="padding-left:15px; color:#A8A494; cursor:default;">
					<%=pageData.getWord("Width")%>
				</span>
				<input type="text"  value="" onBlur="savePopWidth(this), skinFit()" onkeyPress="doEnter(this,event)" id="popw" size="6" class="textbox1">
				<span style="padding-left:15px; color:#A8A494; cursor:default;">
					<%=pageData.getWord("Height")%>
				</span>
				<input type="text"  value="" onBlur="savePopHeight(this), skinFit()"  onkeyPress="doEnter(this,event)" id="poph" size="6" class="textbox1">
				<span style="padding-left:20px; color:#A8A494; cursor:default;">
					<%=pageData.getWord("Backgd color")%>
				</span>
				<span id='tdpopbg' style='padding-left:20px; background:<%=popup.getPopBgColor()%>' onclick='showColorPannel("popBgColor");' onmouseover='doMouseOverLinkColor(this)' class="borderspan">&nbsp;</span>
				<span style="padding-left:15px; color:#A8A494; cursor:default;">
					<%=pageData.getWord("Required")%>
				</span>
				<span id='tdreqbg' style='padding-left:20px; margin-right:15px; background:<%=popup.getReqBgColor()%>;' onclick='showColorPannel("reqBgColor");' onmouseover='doMouseOverLinkColor(this)' class="borderspan">&nbsp;</span>
			</div>
		</td>
		<td align="left" valign="top" class="botDivTableCol3">&nbsp;
			
		</td>
	</tr>
</table>



</div>





<div id="gridoptions" class="gridoptionsOuter" style="position:absolute; top:10px; visibility:hidden;">
	<div id="gridoptionsInner" class="botDivTableCol2">
		<div id="gridtitle" class="botDivTableCol2Div1" style="width:10px"><%=pageData.getWord("Grid Shade")%></div>
		<div style="padding-top:3px; padding-bottom:2px; width:190px;">
			<span id="gridlist" class="toolbarElementsBox"><span class="gridoptions_off" onmouseover="gridoptMouseOver(this)" onmouseout="gridoptMouseOut(this)" onclick="gridColor(0), saveChangeState()"><img src="../../img/popup/gridopt0.gif" alt="none" name="none" width="35" height="18" hspace="0" vspace="0" border="0" id="none" /></span><span class="gridoptions_off" onmouseover="gridoptMouseOver(this)" onmouseout="gridoptMouseOut(this)" onclick="gridColor(1), saveChangeState()"><img src="../../img/popup/gridopt1.gif" alt="light" name="light" width="35" height="18" hspace="0" vspace="0" border="0" id="none" /></span><span class="gridoptions_on" onmouseover="gridoptMouseOver(this)" onmouseout="gridoptMouseOut(this)" onclick="gridColor(2), saveChangeState()"><img src="../../img/popup/gridopt2.gif" alt="normal" name="normal" width="35" height="18" hspace="0" vspace="0" border="0" id="none" /></span><span class="gridoptions_off" onmouseover="gridoptMouseOver(this)" onmouseout="gridoptMouseOut(this)" onclick="gridColor(3), saveChangeState()"><img src="../../img/popup/gridopt3.gif" alt="dark" name="dark" width="35" height="18" hspace="0" vspace="0" border="0" id="none" /></span></span>
		</div>
	</div>
</div>

<%if(popup.getState().equals("0")){ %>
<div id="disableMenuBotDiv" style="position:absolute;top:10px;left:0px;width:10px;height:57px;" class="menubotdivbg"></div>
<%} %>

<div id="popupwin"  style="position:absolute; display:none" class="popupwindiv"></div>
<div id="popupallwin"   position="absolute" style="position:absolute;top:0px;left:0px;padding:0px;display:none;" class="popallwindivbg" ></div>
<div id="popupsuballwin"   position="absolute" style="position:absolute;top:62px;left:100px;padding:0px;display:none;" class="popsuballwindivbg"></div>



<form method="post" action="popup.jsp" name="frm">
<input type="hidden" name ="xmlstr" value="">
<input type="hidden" name ="del" value="0">
<input type="hidden" name ="popdbid" value="<%=popup_dbid%>">
<input type="hidden" name ="tenant_dbid" value="<%=request.getParameter("tenant_dbid")%>">
<input type="hidden" name ="currentpagename" value="">

<%if(popup.getState().equals("0")){ %>
<div style="position:absolute; top:5px; left:10px;">
	<span id="dynmenu1" onMouseOver="doMouseOver(this,0)" onMouseOut="doMouseOut(this,0)"  onclick="containerClick(this,0)" class="lev0"><%=pageData.getWord("File")%>
		<div id="cdynmenu1"  onMouseOut="doMouseOut(this,1)" class="lev1"  style="display:none;">

			<div id="dynmenu11" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(2,this,2)"><nobr><%=pageData.getWord("New")%></nobr></div>
			<div id="dynmenu12" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(11,this,2)"><nobr><%=pageData.getWord("Open...")%></nobr></div>
			<div id="dynmenu13" class="lev2inact"><nobr><%=pageData.getWord("Save")%></nobr></div>
			<div id="dynmenu14"  onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" onClick="doMouseClick(4,this,2)" class="lev2"><nobr><%=pageData.getWord("Save As...")%></nobr></div>
			<div id="dynmenu15" class="lev2inact"><nobr><%=pageData.getWord("Delete")%></nobr></div>
			<div class="hr"><img src="../../img/popup/spacer.gif" width="100%" height="1"></div>
			<div id="dynmenu16" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(8,this,2)"><nobr><%=pageData.getWord("Preview")%></nobr></div>
			
 	   </div>
	</span>
	<span id="dynmenu2" class="lev0" style="visibility:hidden" ><%=pageData.getWord("Tools") %>
		<div id="cdynmenu2"  onMouseOut="doMouseOut(this,1)" class="lev1"  style="display:none;">

			<div id="dynmenu21" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(7,this,2)"><nobr><%=pageData.getWord("Database Configuration")%></nobr></div>
			<div id="dynmenu22" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(6,this,2)"><nobr><%=pageData.getWord("Table Configuration")%></nobr></div>
			<div id="dynmenu23" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(9,this,2)"><nobr><%=pageData.getWord("Parameters Configuration")%></nobr></div>
			<div id="dynmenu24" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(10,this,2)"><nobr><%=pageData.getWord("Where Clause Config.")%></nobr></div>
			<div id="dynmenu25" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(14,this,2)"><nobr><%=pageData.getWord("Elements triggers") %></nobr></div>	
			<div id="dynmenu26" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(12,this,2)"><nobr><%=pageData.getWord("Global Parameters") %></nobr></div>	
			
	     </div>	
	</span>
</div>
<%}else{ %>
<div style="position:absolute; top:5px; left:10px;">
	<span id="dynmenu1" onMouseOver="doMouseOver(this,0)" onMouseOut="doMouseOut(this,0)"  onclick="containerClick(this,0)" class="lev0"><%=pageData.getWord("File")%>
		<div id="cdynmenu1"  onmouseout="doMouseOut(this,1)" class="lev1"  style="display:none;">

			<div id="dynmenu11" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(2,this,2)"><nobr><%=pageData.getWord("New")%></nobr></div>
			<div id="dynmenu12" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(11,this,2)"><nobr><%=pageData.getWord("Open...")%></nobr></div>
			<div id="dynmenu13"  onmouseover="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" onClick="doMouseClick(3,this,2)" class="lev2"><nobr><%=pageData.getWord("Save")%></nobr></div>
			<div id="dynmenu14"  onmouseover="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" onClick="doMouseClick(4,this,2)" class="lev2"><nobr><%=pageData.getWord("Save As...")%></nobr></div>
			<div id="dynmenu15" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(13,this,2)"><nobr><%=pageData.getWord("Delete")%></nobr></div>
			<div class="hr"><img src="../../img/popup/spacer.gif" width="100%" height="1"></div>
			<div id="dynmenu16" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(8,this,2)"><nobr><%=pageData.getWord("Preview")%></nobr></div>
			
 	   </div>
	</span>
	<span id="dynmenu2"  onMouseOut="doMouseOut(this,0)" onMouseOver="doMouseOver(this,0)" onClick="containerClick(this,0)" class="lev0" ><%=pageData.getWord("Tools") %>
		<div id="cdynmenu2"  onmouseout="doMouseOut(this,1)" class="lev1"  style="display:none;">

			<div id="dynmenu21" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(7,this,2)"><nobr><%=pageData.getWord("Database Configuration")%></nobr></div>
			<div id="dynmenu22" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(6,this,2)"><nobr><%=pageData.getWord("Table Configuration")%></nobr></div>
			<div id="dynmenu23" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(9,this,2)"><nobr><%=pageData.getWord("Parameters Configuration")%></nobr></div>
			<div id="dynmenu24" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(10,this,2)"><nobr><%=pageData.getWord("Where Clause Config.")%></nobr></div>
			<div id="dynmenu25" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(14,this,2)"><nobr><%=pageData.getWord("Elements triggers") %></nobr></div>	
			<div id="dynmenu26" onMouseOver="doMouseOver(this,2)" onMouseOut="doMouseOut(this,2)" class="lev2" onClick="doMouseClick(12,this,2)"><nobr><%=pageData.getWord("Global Parameters") %></nobr></div>	
			
	     </div>	
	</span>
</div>
<%} %>

<div id="introdiv" position="absolute" style="position:absolute; top:0px; left:0px; display:none;">
	<div id="introback" position="absolute" style="position:absolute; top:0px; left:0px; z-index:5" class="popallwindivbg"></div>
	<div id="introfront" position="absolute" style="position:absolute; top:0px; left:0px; z-index:10;">
	
		<table border=0 cellspacing=0 cellpadding=0 align="center" style="margin-top:70px">
			<tr>
				<td class="introContainer">
					<div class="introInnerBorder" style="width:367px; height:150px;">
						<div id="this1" style="float:right; padding-right:4px; padding-top:2px; font-weight:normal;"><%=pageData.getWord("Form Builder Version Number")%></div><br /><br />
						<div id="this2" style="float:right; padding-right:125px; padding-top:100px;"><%=pageData.getWord("FORM BUILDER")%></div>
					</div>
					<div style="width:370px; margin-left:5px; padding-top:4px; padding-bottom:9px; padding-left:5px; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#52636D;">
						<%=pageData.getWord("Open an existing form")%><input class="formfields" id="introdiv_popname2" type="button" value=" ... " onClick="openPopupList('popupwin')" style="margin-left:10px; vertical-align:middle;" />
					</div>
					<div style="width:368px; margin-left:5px; padding-top:9px; padding-bottom:4px; padding-left:5px; padding-right:2px; border-top-style:solid; border-top-width:1px; border-top-color:#B0CFE2;">
						<div style="float:right;">
							<input class="formfields" id="introdiv_type" type="radio" name="poptype" value="OUT" checked /><%=pageData.getWord("Outbound")%><input class="formfields" id="introdiv_type" type="radio" name="poptype" value="IN" style="margin-left:20px" /><%=pageData.getWord("Inbound")%>
						</div>
						<%=pageData.getWord("Create a new form")%>
					</div>
					<div style="width:375px; margin-left:5px; padding-top:4px; padding-bottom:4px; text-align:right;">
						<%=pageData.getWord("Name")%><input class="formfields" id="introdiv_popname" type="text" value="" onKeyPress="checkEnterPopUp(event)" style="margin-left:10px" /><input class="formfields" type="text" style="display:none" />
					</div>
					<div style="width:375px; margin-left:5px; padding-top:4px; padding-bottom:4px; text-align:right;">
						<input class="formfields" type=button value="<%=pageData.getWord("Click here to continue")%>" onClick="goMainDiv(); skinFit(); saveChangeState();" />
					</div>
				</td>
			</tr>
		</table>
		
	</div>
</div>


<div id="helpbar" style="cursor:pointer; position:absolute; top:5px; left:0px;" onclick='doHelp()' onmouseover='imgOver(helpbutton, "9")' onmouseout='imgOver(helpbutton, "8")'><nobr><%=pageData.getWord("Help")%><img id="helpbutton" src="../../img/popup/helpbut01.gif" border="0" align="absmiddle" style="margin-left:5px;" /></nobr>
</div>

<div id="popupalldetwin"   position="absolute" style="position:absolute;top:0px;left:0px;padding:0px;display:none;" class="popallwindetdivbg"></div>

</form>


</body>
</html>
<% pageData.closeConnection(); %>
<%
if (xmlstr != null) {
	%><script>
	try {
		window.opener.location.reload();			
	}
	catch(exp) {
	}
	
	</script><%
}

%>

