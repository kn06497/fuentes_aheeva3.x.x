
<html>
<head>
<title>Record Picker</title>

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

<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >
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
	/*var o = new Array();
	if (obj.options==null) { return; }
	for (var i=0; i<obj.options.length; i++) {
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;
		}*/
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
	/*for (var i=0; i<o.length; i++) {
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}*/

}

function fillObjectCombo()
{
	if(objects.options.length <= 1 ) {
		/*Fill agents combo box with agents name*/
        var agents = String( appletObj.getAgentsByName(tenant_dbid) ),
			jsAgents = agents + "",
			arrayAgents = jsAgents.split("|"), 
			o = new Array();
       
	   //Fill agents combobox
    	if(agents.length > 0 ){
    		for (j = 0; j <arrayAgents.length; j++){
    			var iStartPos = arrayAgents[j].indexOf('['),
    			 	iEndPos   = arrayAgents[j].indexOf(']'),
    			 	login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1),
				 	name = login + '[' + arrayAgents[j].substr(0,iStartPos) + ']';
					
				myOption = ( viewckbox.checked == false) ? new Option(arrayAgents[j],login) 
														 : new Option(name,login);	// show agents name as : firstname, lastname[login]				
				o.push(myOption);
    		}//end of for (j = 0; j <arrayAgents.length; j++)
		}//end of if(agents.length > 0 ){
		
		o.sort(sortOptionsByText);//Sort by agents name
		for (var i=0, j=1; i<o.length; i++, j++) {
			objects.options[j] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}
	}
	
	if(agtGrp.options.length <= 1 ) {	
        /*Fill agents group combo box with agent group name*/
        var agentGroups = String( appletObj.getAgentGroupDbidAndName(tenant_dbid)),
         	jsAgentGroups = agentGroups + "";
 			o = new Array();
    	arrayGroups = jsAgentGroups.split("|");
    	for (j = 0; j <arrayGroups.length; j++){
			var jsgroupinfos = String(arrayGroups[j]).split(",");			
    		o.push(new Option(jsgroupinfos[1], jsgroupinfos[0]));			
    	}		
		
		o.sort(sortOptionsByText);//Sort by groups name
		for (var i=0, j=1; i<o.length; i++, j++) {
			agtGrp.options[j] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}
		
	 }
 }

function changeAgentListView(){
	var agents;
	var name="";
	var o = new Array();
	objects.length = 0;
    var defaultvalue =  "- All Agents -" ;
	myOption = new Option(defaultvalue,"AllAgents")
	//optionPos = objects.options.length
	o[o.length]=myOption
 
	if(agtGrp.value == 'AllGroups')
		agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
	else
		agents = String( appletObj.getAvailableAgentListInGroupByStatus(agtGrp[agtGrp.selectedIndex].text,1) );		

    var jsAgents = agents + "";
    arrayAgents = jsAgents.split("|");
    for (j = 0; j <arrayAgents.length; j++){
		  var iStartPos = arrayAgents[j].indexOf('[');
		  var iEndPos   = arrayAgents[j].indexOf(']');
		  var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
		  name = login+'['+arrayAgents[j].substr(0,iStartPos)+']'
		  if ( viewckbox.checked == false)  // show agents name as : firstname, lastname[login]
			myOption = new Option(arrayAgents[j],login);  // show agents name as : login[firstname, lastname]
		  else
			myOption = new Option(name,login);
		  //optionPos = objects.options.length;
		  o[o.length]=myOption

   }

   sortSelect(o);

	for (var i=0; i<o.length; i++) {
		objects.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}

}



function getAgentsInGroup()
{
	var o = new Array();
	if(agtGrp.value =='AllGroups')
	{
		//Empty the agent group combo box
		agtGrp.options.length=1;
		objects.length = 0;
        var defaultvalue =  "- All Agents -" ;
		myOption = new Option(defaultvalue,"AllAgents")
		optionPos = objects.options.length
		objects.options[optionPos]=myOption

		fillObjectCombo();
	}
	else
	{
		var agents = String( appletObj.getAvailableAgentListInGroupByStatus(agtGrp[agtGrp.selectedIndex].text,1) );
		var jsAgents = agents + "";
		// Remove all agents from agents option field
		var i=objects.options.length;
        if (i>0){
              objects.length = 0;
        }
        var defaultvalue =  "-All agents-" ;
		myOption = new Option(defaultvalue,"AllAgents")
		//optionPos = objects.options.length
		//objects.options[optionPos]=myOption
		o[o.length]= myOption;

		if(agents.length > 0 ){
			arrayAgents = jsAgents.split("|");
    		for (j = 0; j <arrayAgents.length; j++){
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
    			//myOption = new Option(arrayAgents [j],login)
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if ( viewckbox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents[j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)

				//optionPos = objects.options.length
				//objects.options[optionPos]=myOption
				o[o.length]= myOption;

			}
         }

	}

	sortSelect(o);

	for (var i=0; i<o.length; i++) {
		objects.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}

	return;
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


function checkSelectedPeriod()
{ 
	var startdate = document.theForm.startingDate.value;
	var enddate = document.theForm.endingDate.value;
	var numdays = checkSelectedPeriod.arguments[0]; 
		
	if (startdate.length <1) {
		alert('<%= pageData.getWord("You must set up the start date")%>');
		return false;
	}
	
	if (enddate.length <1) {
		alert('<%= pageData.getWord("You must set up the end date")%>');

		return false;
	}
	
	var month = parseInt(startdate.substring(0,2)-1,10);
	var date  = parseInt(startdate.substring(3,5),10);
	var year  = parseInt(startdate.substring(6),10);
	var stDate=new Date();
	stDate.setFullYear(year,month,date)	;
	
	month = parseInt(enddate.substring(0,2)-1,10);
	date  = parseInt(enddate.substring(3,5),10);
	year  = parseInt(enddate.substring(6),10);
	eDate=new Date();
	eDate.setFullYear(year,month,date);

	if (stDate>eDate){
		alert('<%= pageData.getWord("The end date cannot be smaller than the start date")%>');
		return false;
	}
	 
	if (eDate.getTime()-stDate.getTime()>numdays*86400*1000) { //86400 secondes per day
		alert('<%= pageData.getWord("You cannot select a period more than 7 days")%>');		
		return false;
	}
	
	return true;
}

function EnableSelect(){

if (call_length.checked){
	  min.disabled = false;
	  max.disabled = false;
	  }
else{	  
	min.disabled = true;
	max.disabled = true;
	}
}

function getRequestedReport()
{
   //var cur_user = String(appletObj.getCurrentUserDBID());
	var phone =  phoneNumber.value;
 	//var dnis =  dnid.value;
	var destination = '';

	if(phone.length == 0){
		if(dateChecker() == false)
		{
			return;
		}

		if(checkSelectedPeriod(7) == false)
		{					
			return;							
		}
	}
	var get_listened = '0';
	var get_not_listened = '0';
	var get_sales = '0';
	var get_no_sales ='0';
	var get_qm ='0';
	var get_audio ='0';
	var get_video ='0';
	var get_call_length ='0';
	var selectedGroups = agtGrp.value;
	
	/*if(validation(document.theForm.phoneNumber.value)==0)
	{
		alert("You cannot use ~ or ^ or | !!!");
		document.theForm.phoneNumber.focus();
		return;
	}*/

	destination = "../jsp/conversationRecording.jsp"
	destination += "?startingDate="
	destination += document.theForm.startingDate.value;
	destination +="&endingDate=";
	destination += document.theForm.endingDate.value;
	destination +="&phoneNumber=";
	destination += escape(phoneNumber.value);
	//alert(escape(phoneNumber.value));
	destination +="&page=";
	destination += "1";
	destination +="&limit=";
	destination += limit.value;
	
	destination +="&min=";
	destination += min.value;
	destination +="&max=";
	destination += max.value;
	
	if((min.value > max.value) && call_length.checked){
		alert("<%=pageData.getWord("Your Max time cannot be smaller than your Min time")%>");
		return false;
	}
	
	destination +="&numpages=";
	destination +="&firstload=true";	
	destination +="&agentGrp=";


	if(agtGrp.value == 'AllGroups' && objects.value =='AllAgents' && phone.length == 0)
	{	 
		 alert("<%=pageData.getWord("Please select a group or an agent")%>");
		 return false;
	}
	
	if(agtGrp.value == 'AllGroups'){
		selectedGroups = selectedGroups + '/';
		var i;
		for(i=1; i<agtGrp.options.length; i++){
			 selectedGroups = selectedGroups + agtGrp.options[i].value + '!';
		   }
		if(agtGrp.options.length > 1)
			 selectedGroups = selectedGroups.substring(0,selectedGroups.length-1);		
	} 
	
	destination += selectedGroups;
	destination +="&agents=";
	destination += getSelectedObjects();
	
	if( call_length.checked)
		get_call_length ='1';
		
	destination +="&call_length=";
	destination +=get_call_length;
	

 	if( sales.checked)
		get_sales ='1';
	if( no_sales.checked)
		get_no_sales='1';
 	destination +="&option_not_listened=";
	destination += get_not_listened;
	destination +="&option_listened=";
	destination += get_listened;
	destination +="&sales=";
	destination +=get_sales;
	destination +="&no_sales=";
	destination += get_no_sales;
	destination +="&qm=";
	destination += get_qm;
	
	if( document.theForm.Audio.checked)
		get_audio ='1';
	if( document.theForm.Video.checked)
		get_video='1';
	destination +="&audio=";
	destination += get_audio;
	destination +="&video=";
	destination += get_video;
	destination +="&tenant=";
	destination +=tenant_dbid;
	//alert(destination);
	//alert(window.top.main.rbottom.bottom.location.href)
	//window.top.main.rbottom.bottom.location.href = destination;
	//alert(window.top.bottom.location.href)
	
	
	
	document.location = destination;
}


function dateChecker()
{
	var startDate=new Date(document.theForm.startingDate.value);
	var endDate = new Date(document.theForm.endingDate.value);

	if(endDate < startDate)
	{
		alert('<%= pageData.getWord("Your ending date cannnot be smaller than your starting date")%>');
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
  
function validateRecordingsType()
{
	//option du audio recordings
	if(document.theForm.Audio.checked && document.theForm.Video.checked)
	{
		document.theForm.AudioAndVideo.checked = true;
	}
	else
	{
		document.theForm.AudioAndVideo.checked = false;
	}
}
/*function validateRecordingsTypeBoth()
{
	//option du audio recordings
	if(document.theForm.AudioAndVideo.checked )
	{
		document.theForm.Audio.checked = true;
		document.theForm.Video.checked = true;
	}
	else
	{
		document.theForm.Audio.checked = false;
		document.theForm.Video.checked = false;
	}
}*/
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
      		<%= pageData.getWord("Recordings selection") %>
      	</legend>
      	<form name="theForm" >
			<table>
				<tr>
					<td colspan="6">&nbsp;
						
					</td>
				</tr>
				<tr>
					<td colspan="6"><strong>
						<%= pageData.getWord("Recordings type") %>
						</strong>
					</td>
				</tr>
				<tr>
					<td>
						<%= pageData.getWord("Audio") %>
					</td>
					<td width="50">
						<input id="Audio" type="checkbox" name="Audio" value="ON"  onclick="validateRecordingsType()" checked>
					</td>
					<td>
						<%= pageData.getWord("Video") %>
					</td>
					<td width="50">
						<input id="Video" type="checkbox" name="Video" value="ON"  onclick="validateRecordingsType()" checked>
					</td>
					<!-- <td>
						<%= pageData.getWord("Both") %>
					</td>
					<td width="50">
						<input id="AudioAndVideo" type="checkbox" name="AudioAndVideo" value="ON"  onclick="validateRecordingsTypeBoth()" checked>
					</td>
					 -->
				</tr>
			</table>
			
			<table>
				<tr>
					<td colspan="4">&nbsp;
						
					</td>
				</tr>
				<tr>
					<td colspan="4"><strong>
						<%= pageData.getWord("Call time (Max. 7 days)") %>
						</strong>
					</td>
				</tr>
				<tr>
					<td>
						<%= pageData.getWord("From") %>:&nbsp;
					</td>
					<td>
						<input id="id_startingDate" type="text" size="18" onfocus="showCalendar('',this,this,'','id_startingDate',0,30,1);this.blur()" name="startingDate" class="contentText" />
					</td>
					<td>
						&nbsp;&nbsp;<%= pageData.getWord("To") %>:&nbsp;
					</td>
					<td>
						<input id="id_endingDate" type="text" size="20" onfocus="showCalendar('',this,this,'','id_endingDate',0,30,1);this.blur()" name="endingDate" class="contentText"/>
					</td>
				</tr>
				
				<tr>
				<td colspan="4">&nbsp;
				</td>
				</tr>
			</table>
		</form>
		
		
		<table>
			<tr>
				<td colspan="3">&nbsp;
					
				</td>
			</tr>
			<tr>
				<td> 
					<%= pageData.getWord("Agent group") %>
				</td>
		  		<td colspan="2"> 
					<select name="agtGrp" onChange="getAgentsInGroup()" class="contentText">
			  			<option value="AllGroups">- 
			  				<%= pageData.getWord("Select a group") %>
			  			-</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<%= pageData.getWord("Agents") %>
				</td>
				<td>
					<select name="objects" class="contentText">
						<option value="AllAgents">-
							<%= pageData.getWord("All agents") %>
						-</option>
					</select>
				</td>
				<td>
					&nbsp;&nbsp;<%= pageData.getWord("Show agent by ID") %>
					<input type="checkbox" name="viewckbox" onClick="changeAgentListView()" ID="Checkbox2">
				</td>
			</tr>
			<tr> 
				<td>
					<%= pageData.getWord("Phone number") %>
				</td>
				<td>
			  		<input type="text" name="phoneNumber" class="contentText" />
				</td>
				<td> 
			  		<a style="color:#400040 "  onMouseover="Desc('Would you like to list all the records which dnid contains the string 5678, write  %5678% in the box as search criteria' );" onMouseout="noDesc();" > 
			  		<script>//document.write(MultiArray["You may use (%Phonenumber%)"][lang])</script>
			  		</a>
				</td>
			</tr>
			<tr>
				<td> 
					<%= pageData.getWord("Records/page") %> 
				</td>
		  		<td colspan="2"> 
					<select name="limit">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="100">100</option>
			 		</select>
				</td>
			</tr>
			
			<tr>
				<td> 
					<%= pageData.getWord("Call length") %>
				</td>
		  		<td > 
					<input type="checkbox" name="call_length" value="0" Onclick ="EnableSelect()">
				</td>
			
			
				<td> 
					<%= pageData.getWord("Min") %>&nbsp;
				
					<select name="min" disabled>
						<option value="0">0s</option>
						<option value="15">15s</option>
						<option value="30">30s</option>
						<option value="45">45s</option>
						<option value="60">60s</option>
						<option value="90">1:30</option>
						<option value="120">2:00</option>
						<option value="150">2:30</option>
						<option value="180">3:00</option>
						<option value="240">4:00</option>
						<option value="300">5:00</option>
						<option value="360">6:00</option>
						<option value="420">7:00</option>
						<option value="480">8:00</option>
						<option value="540">9:00</option>
						<option value="600">10:00</option>
						<option value="900">15:00</option>
						<option value="1200">20:00</option>
						<option value="1500">25:00</option>
						<option value="1800">30:00</option>						
			 		</select>
				 </td>
			</tr>
			
			<tr>
			<td>
			&nbsp;&nbsp;
			</td>
			<td>
			&nbsp;&nbsp;
			</td>
			<td > 
			<%= pageData.getWord("Max") %>
				 
					<select name="max" disabled>
						<option value="15">15s</option>
						<option value="30">30s</option>
						<option value="45">45s</option>
						<option value="60">60s</option>
						<option value="90">1:30</option>
						<option value="120">2:00</option>
						<option value="150">2:30</option>
						<option value="180">3:00</option>
						<option value="240">4:00</option>
						<option value="300">5:00</option>
						<option value="360">6:00</option>
						<option value="420">7:00</option>
						<option value="480">8:00</option>
						<option value="540">9:00</option>
						<option value="600">10:00</option>
						<option value="900">15:00</option>
						<option value="1200">20:00</option>
						<option value="1500">25:00</option>
						<option value="1800">30:00</option>
						<option value="3600">1h</option>
						<option value="7200">2h</option>
			 		</select>
				</td>
			</tr>
			<tr>
				<td> 
					<%= pageData.getWord("Sales")%> 
				</td>
		  		<td colspan="2"> 
					<input type="checkbox" name="sales" value="0">
				</td>
			</tr>
			<tr>
				<td> 
					<%= pageData.getWord("No sales")%>  
				</td>
		  		<td colspan="2"> 
					<input type="checkbox" name="no_sales" value="0">
				</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;
					
				</td>
			</tr>
			<tr>
				<td colspan="3"> 
					<input type="button" value='<%= pageData.getWord("Submit")%> ' onClick="getRequestedReport()">
				</td>
			</tr>
		</table>
      </fieldset>
    </div>
    </div>
</div>
  
<script type="text/javascript">  
fillObjectCombo(); 
</script>

</body>
<% pageData.closeConnection(); %>
</html>
