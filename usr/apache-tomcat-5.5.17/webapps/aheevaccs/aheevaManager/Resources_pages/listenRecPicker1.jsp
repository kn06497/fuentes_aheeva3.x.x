
<html>
<head>
<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<title>Record Picker</title>

<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="style.css" rel="stylesheet" type="text/css" />
<%@ include file="xc2_default_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>
<script language="JavaScript" src="jsUtil.js"></script>

<!--<LINK href="style.css" rel="stylesheet" type="text/css" />-->
<script language="JavaScript">
var NS4 = document.layers ? 1:0
var IE4 = document.all ? 1:0
var IE5 = document.getElementById&&document.all ? 1:0
var NS6 = document.getElementById&&!document.all ? 1:0

var x=0;
var y=0;
var closetable = "</TD></TR></TABLE></TD></TR></TABLE>";	
if(!IE4) {
	document.captureEvents(Event.MOUSEMOVE);
	document.onmousemove = GetPos;
}
	
function Desc(text ) {
 	var opentable = "<TABLE BGCOLOR='#000000' BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH=140><TR><TD ALIGN=center><TABLE BGCOLOR='#FFFFE1' BORDER=0 CELLPADDING=3 CELLSPACING=1 WIDTH=138><TR><TD VALIGN=top style='font-size:10px; font-family:Tahoma' align=left><IMG SRC='../img/help.gif' HEIGHT=24 WIDTH=30 VSPACE=0 HSPACE=0 ALIGN=left>";
	 
	if(NS6) {
		document.getElementById("Description").innerHTML  = opentable+text+closetable;
		document.getElementById("Description").style.left = x-12;
		document.getElementById("Description").style.top  = y+10;
		document.getElementById("Description").style.visibility = "visible";
	}
 	if(IE4) {
		
		document.all["Description"].innerHTML = opentable+text+closetable;
		Description.style.pixelLeft = event.clientX-12;
		Description.style.posTop  = document.body.scrollTop+event.clientY+16;
		Description.style.visibility = "visible";
	}
	else {
		var nets = document.layers["Description"];
		nets.document.open();
		nets.document.write(opentable+text+closetable);
		document.Description.left = x-12;
		document.Description.top = y+10;
		nets.visibility = "show";
		document.close();
	}
}

function GetPos(evnt){
	x = evnt.pageX;
	y = evnt.pageY;
	return true;
}

function noDesc() {

	if(NS6) {
		document.getElementById("Description").style.visibility = "hidden";
	}
	if(IE4) {
		Description.style.visibility = "hidden";
	}
	else {
		document.Description.visibility = "hidden";
	}
}
</script>
<style type="text/css">

.dynamic-tab-pane-control .contentText{
	font:			12px Tahoma;
	color:			Black;
}
.dynamic-tab-pane-control .tab-page {
	clear:			both;
	border:			1px solid rgb( 145, 155, 156 );
	background:		rgb( 252, 252, 254 );
	z-index:		2;
	position:		relative;
	top:			-2px;

	font:			11px Tahoma;
	color:			Black;

	filter:			progid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)
					progid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);
	
	/* 244, 243, 238 */ 
	/*145, 155, 156 */
	padding:		10px;
}

.dynamic-tab-pane-control .tab-row {
	z-index:		1;
	white-space:	nowrap;
}
 
.dynamic-tab-pane-control .tab-row .tab.selected {
	width:				74px  ;
	height:				18px  ;
	background-image:	url( "tab.active.png" )  ;
	background-repaet:	no-repeat;

	border-bottom-width:	0;
	z-index:		3;
	padding:		2px 0 0px 0;
	margin:			1px -3px -3px 0px;
	top:			-2px;
	font:			11px Tahoma;
}

.dynamic-tab-pane-control .tab-row .tab a {
	font:				11px Tahoma;
	color:				Black;
	text-decoration:	none;
	cursor:				default;
}

.dynamic-tab-pane-control .tab-row .tab.hover {
	font:				11px Tahoma;
	width:				70px;
	height:				16px;
	background-image:	url( "tab.hover.png" );
	background-repaet:	no-repeat;
}
 
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		200px;
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
 
 .dynamic-tab-pane-control.tab-pane {
	position:	relative;
	width:		100%;		 
	margin-right:	-2px;	 
	height:		200px;
	
}

</style>
 
<script type="text/javascript" >
var tenant_dbid  = normalizeString(QueryString('tenant_dbid'));

function sortSelect(o)
{
 	if (o.length==0) { return; }

	if(viewckbox.checked == false){
		o = o.sort(
			function(a,b) {
				if ((a.text+"") < (b.text+"")) { return -1; }
				if ((a.text+"") > (b.text+"")) { return 1; }
				return 0;
				}
			);
	}
	else{
		o = o.sort(
			function(a,b) {

					if (parseInt(a.value) < parseInt(b.value)) { return -1; }
					if (parseInt(a.value) > parseInt(b.value)) { return 1; }
					return 0;
				}
			);
	}
 
}

function fillObjectCombo()
{
 	if(document.theForm.user.options.length <= 1 ) {	
        /*Fill agents group combo box with agent group name*/
        var users = String( appletObj.getUsers() );
		//alert("users = " + users);
        var jsUsers = users + "";
    	arrayUsers = jsUsers.split("|");
    	for (j = 0; j <arrayUsers.length; j++){
		    var jsuserData = (arrayUsers[j]).split(",");
			var dbid =  jsuserData[0];
			var tenant =  jsuserData[1];
			var name =  jsuserData[2];
			//if(tenant == tenant_dbid){
				myOption = new Option(name,dbid)
				optionPos = document.theForm.user.options.length
				document.theForm.user.options[optionPos]=myOption
			//}
    	}
		//sortSelect(objects);
	 }
 }


function getSelectedObjects()
{
	selectedAgents = new Array()
	for (i=objects.selectedIndex;i<objects.options.length;i++) {
  		if (objects.options[i].selected) {
  			selectedAgents[selectedAgents.length]=objects.options[i].value;
  		}
  	}
	var url = '';
	if (selectedAgents.length > 0)
	{
		url= escape(selectedAgents.join('/'))
	}
	return url;
}

function getRequestedReport()
{
		v = true;	
	if(	document.theForm.ip.value.length > 1){
		var ipParts = document.theForm.ip.value.split(".");
	
		if(ipParts.length != 4 || document.theForm.ip.value.length > 15)
			{
				alert("<%= pageData.getWord("The IP adress should be like: 192.168.100.100")%>");
				v = false;
			}
		else
			{
			for(j = 0; j < 4; j++)
				{
				if( !IsNumeric(ipParts[j]) )
					{
						alert("<%= pageData.getWord("The IP adress should be like: 192.168.100.100")%>");
						v=false;
						break;
					}
				}		
			}
       }
    if(v == false)
	  return false;
	  
	var destination = '';

	if(dateChecker() == false)
	{
		return;
	}

 	var selectedUsers = document.theForm.user.value;
 	destination = "../jsp/listenRecording.jsp"
	destination += "?startingDate="
	destination += document.theForm.startingDate.value;
	destination +="&endingDate=";
	destination += document.theForm.endingDate.value;
	destination +="&ip=";
	destination += document.theForm.ip.value;
	destination +="&user=";

	if(document.theForm.user.value == 'AllUsers')
	{
	  selectedUsers = selectedUsers + '/';
	  var i;
	  for(i=1; i<document.theForm.user.options.length; i++){
		 selectedUsers = selectedUsers + document.theForm.user.options[i].value + '!';
	   }
	  if(document.theForm.user.options.length > 1)
		 selectedUsers = selectedUsers.substring(0,selectedUsers.length-1);
	}
	destination += selectedUsers;


	var fonlyeval = 0;

	if (document.theForm.check.checked ==true)
	{
		fonlyeval = 1;
	}

	destination +="&feval=";
	destination += fonlyeval;
  	//alert(destination);
 	document.location = destination;
}


function dateChecker()
{
	var startDate=new Date(document.theForm.startingDate.value);
	var endDate = new Date(document.theForm.endingDate.value);

	if(endDate < startDate)
	{
		alert("<%= pageData.getWord("Your ending date cannnot be smaller than your starting date")%>");
		return false;
	}
	return true;
}

function toggleLayer(whichLayer)
{
	if (document.getElementById)
	{
		// this is the way the standards work
		var style2 = document.getElementById(whichLayer).style;
		style2.display = style2.display? "":"none";
	}
	else if (document.all)
	{
		// this is the way old msie versions work
		var style2 = document.all[whichLayer].style;
		style2.display = style2.display? "":"none";
	}
	else if (document.layers)
	{
		// this is the way nn4 works
		var style2 = document.layers[whichLayer].style;
		style2.display = style2.display? "":"none";
	}
}
  
</script>

</head>

<body class="q_m_body">
<br />
<DIV ID="Description" STYLE="position:absolute; top:5px; left:5px; visibility:hide; z-index:1; background-color:#FFFFCC;"></DIV>

<div class="dynamic-tab-pane-control">
	<div class="tab-pane" id="tabPane1">
 		
    <div class="tab-page" id="general"> 
      <fieldset>
      <legend> 
      <%= pageData.getWord("Record parameters")%>
      </legend>
      <form name="theForm">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="650">
          <tr> 
            <td style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1"
							colspan="5">&nbsp;</td>
          </tr>
          <tr> 
            <td width="136" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1"> 
              <%= pageData.getWord("IP")%></td>
            <td width="30" style="border-top-style: none; border-top-width: 1">&nbsp; 
            </td>
            <td width="156" style="border-top-style: none; border-top-width: 1" colspan="">&nbsp; 
              <input type="text" name="ip" class="contentText"  /> </td>
            <td width="313" style="border-top-style: none; border-top-width: 1"><a style="color:#400040 "  onMouseover="Desc('Would you like to list all the records which phone number contains the string 5678, write  %5678% in the box as search criteria' );" onMouseout="noDesc();" > 
              (e.g : 192.168.10.100) </a></td>
          </tr>
          <tr> 
            <td height="26" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1"> 
              <%= pageData.getWord("Listen time")%></td>
            <td height="26" colspan="2" style="border-top-style: none; border-top-width: 1"> 
              <%= pageData.getWord("From")%> <input id="id_startingDate" type="text" size="20" onFocus="showCalendar('',this,this,'','id_startingDate',0,30,1);this.blur()" class="contentText" name="startingDate" /></td>
            <td height="26" colspan="2" style="border-top-style: none; border-top-width: 1;border-right-style: none; border-right-width: 1"> 
              <%= pageData.getWord("To")%> &nbsp; <input id="id_endingDate" type="text" size="20" onFocus="showCalendar('',this,this,'','id_endingDate',0,30,1);this.blur()" class="contentText" name="endingDate" /> 
            </td>
          </tr>
          <tr> 
            <td style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1"><%= pageData.getWord("User")%></td>
            <td style="border-top-style: none; border-top-width: 1">&nbsp;</td>
            <td style="border-top-style: none; border-top-width: 1" colspan=""> 
              <select name="user"  class="contentText">
                <option value="AllUsers">- 
                <%= pageData.getWord("All Users")%>
                -</option>
              </select> </td>
              <td><input type="checkbox" name="check" value="1">&nbsp;<%= pageData.getWord("Show only evaluated")%>
              </td>
            <td style="border-top-style: none; border-top-width: 1"><a style="color:#400040 "  onmouseover="Desc('Would you like to list all the records which IP address contains the string 5678, write  %5678% in the box as search criteria' );" onmouseout="noDesc();" > 
 </a></td>
          </tr>
          <tr> 
            <td style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">&nbsp;</td>
            <td style="border-top-style: none; border-top-width: 1">&nbsp;</td>
            <td style="border-top-style: none; border-top-width: 1" colspan="">&nbsp;</td>
            <td style="border-top-style: none; border-top-width: 1">&nbsp;</td>
            <td width="15" style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1"> 
            </td>
          </tr>
        </table>
      </form>
      </fieldset>
    </div>
 	  <div>
	  	 <table border="0" height="40" cellpadding="0" cellspacing="0">	
			<tr valign="top">
				<td width="165" height="40" style="border-right-style: none; border-right-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" align="left">

					<input type="button" value="<%= pageData.getWord("Submit")%>" onClick="getRequestedReport()">
				</td>
				<td style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">
				</td>
				<td style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">
				</td>
			</tr>
  	    </table>	
	  </div> 
   </div>
</div>
  
<script type="text/javascript">  
fillObjectCombo(); 
</script>

</body>
</html>
<% pageData.closeConnection(); %>