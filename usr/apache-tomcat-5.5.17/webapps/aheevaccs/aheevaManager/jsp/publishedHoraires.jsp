<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.wfm_schedule.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pagePubHoData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pagePubHoData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pagePubHoData.openConnection();
%>

<head>
<title>AheevaCCS - Group Schedule1</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />

<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../Resources_pages/xc2_default.css" type="text/css">

<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript"  type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		100%;
	

	/*width:      550px;*/
}

html, body {
	background:	#E1F4FF;
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
.imgControl {
	top: 1;
	position:		relative;
}

.skin0{
position:absolute;
width:165px;
border:2px solid black;
background-color:menu;
font-family:Verdana;
line-height:20px;
cursor:default;
font-size:14px;
z-index:100;
visibility:hidden;
}

.menuitems{
padding-left:10px;
padding-right:10px;
}

.legendText {
	font:Tahoma;
	font-size:9px;
	color:#000000
}

.menudiv{
	position:absolute;
	visibility:hidden;
	z-index:10;
	height:20px;
	width:120px;
	border:1px solid;
	font:Verdana, Arial, Helvetica, sans-serif;
	font-size:12px;
	font-weight:bold;
	color:#000000;
	/*	background-image:url(keramik_bubble.gif)*/
}

.menudiv2{
	position:absolute;
	visibility:hidden;
	z-index:10;
	height:20px;
	/*width:150px;*/
	border:1px solid;
	font:Verdana, Arial, Helvetica, sans-serif;
	font-size:12px;
	font-weight:bold;
	color:#000000;
	/*	background-image:url(keramik_bubble.gif)*/
}

.sousmenusched{
	z-index:10;
	position:absolute;
	height:21px;
	width:80px;
	visibility:hidden;
	border:1px solid black;
	border-style: solid;
	border-color: #000000;
	font:Verdana, Arial, Helvetica, sans-serif;
	font-size:12px;
	font-weight:bold;
	background-color:#ffffff;
	color:Black;
	/*background-image:url(keramik_bubble.gif);
		*/
 }

.changelook{
	color:#ffffff;
 }

.paramsDiv{
  position:absolute;
  left:100px;
  top: 25px;
  font:	12px Tahoma;
  color: Black;
 }
 
 .paramsDivText{
	font:			12px Tahoma;
	color:			Black;
	font-weight:    100
}
</style>

</head>
<body>

<div id="ie5menu" class="skin0" onMouseover="highlightie5(event)" onMouseout="lowlightie5(event)" onClick="jumptoie5(event)" display:none>
<div id="day" class="menuitems" url=""></div>
<hr>
<div class="menuitems" url=""><%= pagePubHoData.getWord("Set absent")%></div>
<div class="menuitems" url=""><%= pagePubHoData.getWord("Shift trade")%></div>
</div>

<div id="schedmenuAgt" class="menudiv2" onMouseOver="showAgtMenuItems()" onMouseOut="" align="center"><table width="150px" height="100%" bgcolor="#FFFFFF"  cellspacing="0"><tr><td width="25px" bgcolor="#CCCCCC" align="center"><img src="../img/homme_inactive.gif"></td><td bgcolor="#FFFFFF" align="center"><a id="agtName" style="font-size:11px; font-family:Tahoma, Verdana, Arial; color:#669966; font-weight:bold"><%= pagePubHoData.getWord("Name")%> </a></td></tr></table> </div>

<div id="schedmenuAgtInfo" class="menudiv2"  onMouseOver="" onClick="showAgtMenuItems1()" align="center"><table width="150px" height="100%" bgcolor="#FFFFFF"  cellspacing="0"><tr><td width="25px" bgcolor="#CCCCCC" align="center"><img src="../img/client.gif"></td><td bgcolor="#FFFFFF" align="center"><a style="font-size:11px; font-family:Tahoma, Verdana, Arial; color:#000000; font-weight:bold"  onmouseover="javascript:this.style.color='blue'" onMouseOut="javascript:this.style.color='black'" align="center">  <%= pagePubHoData.getWord("Info")%> </a></td><td width="10%"><img src="../img/arrowmenu.gif"/></td></tr></table> </div>

<div id="schedmenuAgtInfoItem1" class="menudiv2" onClick="" align="center"><table width="120px" height="100%" bgcolor="#FFFFFF"  cellspacing="0"><tr align="center"><td bgcolor="#FFFFFF"><a  id="agtDetailsInfo" style="font-size:11px; font-family:Tahoma, Verdana, Arial; color:#000000; font-weight:bold"  onmouseover="" onMouseOut="" align="center">  <%= pagePubHoData.getWord("Info")%> </a></td></tr></table> </div>

<div id="schedmenuAgtQuit" class="menudiv2" onClick="return setQuit();" align="center" ><table width="150px" height="100%" bgcolor="#FFFFFF"  cellspacing="0"><tr><td width="25px" bgcolor="#CCCCCC" align="center"><img src="../img/client.gif"></td><td bgcolor="#FFFFFF" align="center"><a style="font-size:11px; font-family:Tahoma, Verdana, Arial; color:#000000; font-weight:bold"  onmouseover="javascript:this.style.color='blue'" onMouseOut="javascript:this.style.color='black'" align="center">  <%= pagePubHoData.getWord("Set quit")%> </a></td><td width="10%"></td></tr></table> </div>

<script language="JavaScript1.2">

//set this variable to 1 if you wish the URLs of the highlighted menu to be displayed in the status bar
var nrows = 1 ;
var maxrow = 1;
var display_url=0
var theday='';
var w=0,y=0,s=0,r=0;
var aIdArray = new Array();
var aSunArray = new Array();
var aMonArray = new Array();
var aTueArray = new Array();
var aWedArray = new Array();
var aThuArray = new Array();
var aFriArray = new Array();
var aSatArray = new Array();

var ie5=document.all&&document.getElementById
var ns6=document.getElementById&&!document.all
if (ie5||ns6)
var menuobj=document.getElementById("ie5menu")


function change(selectvalue)
{
	var id = selectvalue.options[ selectvalue.selectedIndex ].value ;
	var chosen;
	for (h=0;h<500;h++){//get the size of the agent list
	 if (aIdArray[h]==id){
	  chosen = h;
	  break;
	 }
	}
	if (s>=1){
	  document.getElementById("agent_shift").removeChild(document.getElementById('s'));
	}

	lyr=document.createElement("DIV");
 	lyr.id ='s';

        var code='';
        code ="<table border='1'><tr>";
        <%-- if (aSunArray[chosen].substring(12,13)=='1'){ --%>
        if (aSunArray[chosen].substring(aSunArray[chosen].length-1, aSunArray[chosen].length) == '1'){
                code+="<td><%= pagePubHoData.getWord("Sunday")%>&nbsp;<input type='checkbox' name='ab_sunday' value='Sunday' CHECKED></td>";

   }else{
        code+="<td><%= pagePubHoData.getWord("Sunday")%>&nbsp;<input type='checkbox' name='ab_sunday' value='Sunday'></td>";

   }

        <%-- if (aMonArray[chosen].substring(12,13)=='1'){ --%>
        if (aMonArray[chosen].substring(aMonArray[chosen].length-1, aMonArray[chosen].length) == '1'){
                code+="<td><%= pagePubHoData.getWord("Monday")%>&nbsp;<input type='checkbox' name='ab_monday' value='Monday' checked></td>";
        }else{
                code+="<td><%= pagePubHoData.getWord("Monday")%>&nbsp;<input type='checkbox' name='ab_monday' value='Monday'></td>";

   }

        <%-- if (aTueArray[chosen].substring(12,13)=='1'){ --%>
        if (aTueArray[chosen].substring(aTueArray[chosen].length-1, aTueArray[chosen].length) == '1'){
                  code+="<td><%= pagePubHoData.getWord("Tuesday")%>&nbsp;<input type='checkbox' name='ab_tuesday' value='Tuesday' checked></td>";
        }else{
                  code+="<td><%= pagePubHoData.getWord("Tuesday")%>&nbsp;<input type='checkbox' name='ab_tuesday' value='Tuesday'></td>";
        }

        <%-- if (aWedArray[chosen].substring(12,13)=='1'){ --%>
        if (aWedArray[chosen].substring(aWedArray[chosen].length-1, aWedArray[chosen].length) == '1'){
                  code+="<td><%= pagePubHoData.getWord("Wednesday")%>&nbsp;<input type='checkbox' name='ab_wednesday' value='Wednesday' checked></td>";
        }else{
                  code+="<td><%= pagePubHoData.getWord("Wednesday")%>&nbsp;<input type='checkbox' name='ab_wednesday' value='Wednesday'></td>";
        }

	<%--if (aThuArray[chosen].substring(12,13)=='1'){ --%>
        if (aThuArray[chosen].substring(aThuArray[chosen].length-1, aThuArray[chosen].length) == '1'){
        code+="<td><%= pagePubHoData.getWord("Thursday")%>&nbsp;<input type='checkbox' name='ab_thursday' value='Thursday' checked></td>";
        }else{
                 code+="<td><%= pagePubHoData.getWord("Thursday")%>&nbsp;<input type='checkbox' name='ab_thursday' value='Thursday'></td>";
        }

        <%-- if (aFriArray[chosen].substring(12,13)=='1'){ --%>
        if (aFriArray[chosen].substring(aFriArray[chosen].length-1, aFriArray[chosen].length) == '1'){
                 code+="<td><%= pagePubHoData.getWord("Friday")%>&nbsp;<input type='checkbox' name='ab_friday' value='Friday' checked></td>";
        }else{
                 code+="<td><%= pagePubHoData.getWord("Friday")%>&nbsp;<input type='checkbox' name='ab_friday' value='Friday'></td>";
        }

        <%-- if (aSatArray[chosen].substring(12,13)=='1'){ --%>
        if (aSatArray[chosen].substring(aSatArray[chosen].length-1, aSatArray[chosen].length) == '1'){
        code+="<td><%= pagePubHoData.getWord("Saturday")%>&nbsp;<input type='checkbox' name='ab_saturday' value='Saturday' checked></td>";
        }else{
        code+="<td><%= pagePubHoData.getWord("Saturday")%>&nbsp;<input type='checkbox' name='ab_saturday' value='Saturday'></td>";
        }
	


	code+="</tr><tr><td align='left' bgcolor='#e6eff4'>"+aSunArray[chosen].substring(0,11)+"</td><td bgcolor='#b4cfff'>"+aMonArray[chosen].substring(0,11)+"</td><td bgcolor='#e6eff4'>"+aTueArray[chosen].substring(0,11)+"</td>";
	code+="<td align='left' bgcolor='#b4cfff'>"+aWedArray[chosen].substring(0,11)+"</td><td bgcolor='#e6eff4'>"+aThuArray[chosen].substring(0,11)+"</td><td bgcolor='#b4cfff'>"+aFriArray[chosen].substring(0,11)+"</td>";
	code+="<td bgcolor='#e6eff4'>"+aSatArray[chosen].substring(0,11)+"</td></tr></table>";

lyr.innerHTML = code;
document.getElementById("agent_shift").appendChild(lyr);
s++;
}

function affiche(selectvalue)
{
	var id = selectvalue.options[ selectvalue.selectedIndex ].value ;
	var chosen;
	for (h=0;h<500;h++){//get the size of the agent list
	 if (aIdArray[h]==id){
	  chosen = h;
	  break;
	 }
	}
	if (r>=1){
	  document.getElementById("man_shifts").removeChild(document.getElementById('r'));
	}

	div=document.createElement("DIV");
 	div.id ='r';

	var code='';
	code ="<table border='1'><tr bgcolor='#b4cfff'><td><%= pagePubHoData.getWord("Sunday")%></td><td><%= pagePubHoData.getWord("Monday")%></td><td><%= pagePubHoData.getWord("Tuesday")%></td><td><%= pagePubHoData.getWord("Wednesday")%></td><td><%= pagePubHoData.getWord("Thursday")%></td><td><%= pagePubHoData.getWord("Friday")%></td><td><%= pagePubHoData.getWord("Saturday")%></td></tr>";
	code+="<tr><td align='left' bgcolor='#e6eff4'>"+aSunArray[chosen]+"</td><td bgcolor='#b4cfff'>"+aMonArray[chosen]+"</td><td bgcolor='#e6eff4'>"+aTueArray[chosen]+"</td>";
	code+="<td align='left' bgcolor='#b4cfff'>"+aWedArray[chosen]+"</td><td bgcolor='#e6eff4'>"+aThuArray[chosen]+"</td><td bgcolor='#b4cfff'>"+aFriArray[chosen]+"</td>";
	code+="<td bgcolor='#e6eff4'>"+aSatArray[chosen]+"</td></tr></table>";

   	div.innerHTML = code;
  	document.getElementById("man_shifts").appendChild(div);
	r++;
}


function bla(selectvalue)
{
	var id = selectvalue.options[ selectvalue.selectedIndex ].value ;
	var chosen;
	//alert(id);
	for (h=0;h<500;h++){//get the size of the agent list
	 if (aIdArray[h]==id){
	  chosen = h;
	//alert(chosen);
	  break;
	 }
	}
	if (w>=1){
	  document.getElementById("agent_shifts1").removeChild(document.getElementById('t'));
	}

	lyr=document.createElement("DIV");
 	lyr.id ='t';

	var code='';
	code ="<table border='1'><tr><td><%= pagePubHoData.getWord("Sunday")%></td><td><%= pagePubHoData.getWord("Monday")%></td><td><%= pagePubHoData.getWord("Tuesday")%></td><td><%= pagePubHoData.getWord("Wednesday")%></td><td><%= pagePubHoData.getWord("Thursday")%></td><td><%= pagePubHoData.getWord("Friday")%></td><td><%= pagePubHoData.getWord("Saturday")%></td></tr>";
	code+="<tr><td align='left' bgcolor='#e6eff4'>"+aSunArray[chosen]+"</td><td bgcolor='#b4cfff'>"+aMonArray[chosen]+"</td><td bgcolor='#e6eff4'>"+aTueArray[chosen]+"</td>";
	code+="<td align='left' bgcolor='#b4cfff'>"+aWedArray[chosen]+"</td><td bgcolor='#e6eff4'>"+aThuArray[chosen]+"</td><td bgcolor='#b4cfff'>"+aFriArray[chosen]+"</td>";
	code+="<td bgcolor='#e6eff4'>"+aSatArray[chosen]+"</td></tr></table>";

   	lyr.innerHTML = code;
  	document.getElementById("agent_shifts1").appendChild(lyr);
	w++;
}

function bla2(selectvalue)
{
	var id = selectvalue.options[ selectvalue.selectedIndex ].value ;
	var chosen;
	for (h=0;h<500;h++){//get the size of the agent list
	 if (aIdArray[h]==id){
	  chosen = h;
	  break;
	 }
	}
	if (y>=1){
	  document.getElementById("agent_shifts2").removeChild(document.getElementById('r'));
	}

	lyr=document.createElement("DIV");
 	lyr.id ='r';

	var code='';
	code ="<table border='1'><tr><td><%= pagePubHoData.getWord("Sunday")%></td><td><%= pagePubHoData.getWord("Monday")%></td><td><%= pagePubHoData.getWord("Tuesday")%></td><td><%= pagePubHoData.getWord("Wednesday")%></td><td><%= pagePubHoData.getWord("Thursday")%></td><td><%= pagePubHoData.getWord("Friday")%></td><td><%= pagePubHoData.getWord("Saturday")%></td></tr>";
	code+="<tr><td align='left' bgcolor='#e6eff4'>"+aSunArray[chosen]+"</td><td bgcolor='#b4cfff'>"+aMonArray[chosen]+"</td><td bgcolor='#e6eff4'>"+aTueArray[chosen]+"</td>";
	code+="<td align='left' bgcolor='#b4cfff'>"+aWedArray[chosen]+"</td><td bgcolor='#e6eff4'>"+aThuArray[chosen]+"</td><td bgcolor='#b4cfff'>"+aFriArray[chosen]+"</td>";
	code+="<td bgcolor='#e6eff4'>"+aSatArray[chosen]+"</td></tr></table>";


   	lyr.innerHTML = code;
  	document.getElementById("agent_shifts2").appendChild(lyr);
    y++;
}

function addBreak()
{
    lyr=document.createElement("DIV");
 	lyr.id ='break'+nrows;
	var nom = 'start'+ nrows;
    var end_nom = 'end'+ nrows;
	var  code='';
    if (maxrow == 1)
	{
    	code ="<table><tr><td align='left'><%= pagePubHoData.getWord("Start")%></td><td align='left'><%= pagePubHoData.getWord("End")%></td><td>&nbsp;</td></tr>";
        code += "<tr><td align='left'><select id= '"+nom+"' name= '"+nom+"' >";
	}
	else{
    	code ="<table><tr><td align='left'><select id= '"+nom+"' name= '"+nom+"' >";
	}
    for (i = 1; i <= 23; i++)
	{
		 code +=" <option value='"+i+":00'>"+i+":00 </option>";
                 code +=" <option value='"+i+":15'>"+i+":15 </option>";
                 code +=" <option value='"+i+":30'>"+i+":30 </option>";
                 code +=" <option value='"+i+":45'>"+i+":45 </option>";
	}

	code +="</select></td><td align='left'><select id= '"+end_nom+"' name= '"+end_nom+"' >";
    for (i = 1; i <= 23; i++)
	{
		 code +=" <option value='"+i+":00'>"+i+":00 </option>";
                 code +=" <option value='"+i+":15'>"+i+":15 </option>";
                 code +=" <option value='"+i+":30'>"+i+":30 </option>";
                 code +=" <option value='"+i+":45'>"+i+":45 </option>";
	}
	code +=" <option value='00:00'>00:45 </option>";
	code +="</select></td>";
	code +="<td align='left'>&nbsp;<a href='javascript:deleteMyRow("+nrows+");'>delete</a></td></tr>";


   	lyr.innerHTML = code;
  	document.getElementById("breaks").appendChild(lyr);
	nrows++;
    maxrow++;
}

function deleteMyRow(f)
{
  var xxx = 'break'+f;
  //var id = 'n'+f;
  //var value = document.getElementById(id).value;
  document.getElementById("breaks").removeChild(document.getElementById(xxx));
  nrows--;

}

function setAbsent()
{
	var param='';
	var ab_sunday='',ab_monday='',ab_tuesday='',ab_wednesday='',ab_thursday='',ab_friday='',ab_saturday='';
	 if (document.getElementById('ab_sunday').checked){
			  ab_sunday=document.getElementById('ab_sunday').value;
	  }
	 if (document.getElementById('ab_monday').checked){
			  ab_monday=document.getElementById('ab_monday').value;
	  }
	 if (document.getElementById('ab_tuesday').checked){
			  ab_tuesday=document.getElementById('ab_tuesday').value;
	  }
	 if (document.getElementById('ab_wednesday').checked){
			  ab_wednesday=document.getElementById('ab_wednesday').value;
	  }
	 if (document.getElementById('ab_thursday').checked){
			  ab_thursday=document.getElementById('ab_thursday').value;
	  }
	 if (document.getElementById('ab_friday').checked){
			  ab_friday=document.getElementById('ab_friday').value;
	  }
	 if (document.getElementById('ab_saturday').checked){
			  ab_saturday=document.getElementById('ab_saturday').value;
	  }

	  document.published.action = '/aheevaccs/servlet/AbServlet?fct=absent&ab_sunday='+ab_sunday+'&ab_monday='+ab_monday+'&ab_tuesday='+ab_tuesday +'&ab_wednesday='+ab_wednesday+'&ab_thursday='+ab_thursday+'&ab_friday='+ab_friday+'&ab_saturday='+ab_saturday+'&lang='+lang+'&sel=1';
	  return true;
}
function trade(){

  document.published.action = '/aheevaccs/servlet/AbServlet?fct=trade&lang='+lang+'&sel=2' ;

  return true;
}

function setQuit(){
//alert(curSelectedAgt);
document.published.action = '/aheevaccs/servlet/AbServlet?fct=quit&lang='+lang+'&agent='+curSelectedAgt+'&sel=2';
document.published.submit();
return true;
}


var curSelectedAgt = '';
var curSelectAgtName = '';
var curSelectAgtDetails = '';
function setAgent(aName,afirstName,aID, aDetails){
    //document.getElementById('day').innerHTML = aName;
	curSelectedAgt = aID;
	curSelectAgtName = aName+','+afirstName;
	curSelectAgtDetails = aDetails;
	//curSelectAgtDetails = 'OutSource 1990- Outsource 1992/OutSource 5000- Outsource 5500/OutSource 6000- Outsource 7000';
}

function setAgentDetails(){
 	//alert(curSelectAgtName+'...'+curSelectedAgt+'..'+curSelectAgtDetails)
	var detailshtml = '';
	var curSelectAgtDetailsArray = curSelectAgtDetails.split('/');
	if(curSelectAgtDetailsArray.length > 0)
	{
		for (var m=0; m < curSelectAgtDetailsArray.length; m++)
		   detailshtml += curSelectAgtDetailsArray[m]+'<br>';
	}
	else
		detailshtml = curSelectAgtDetails;

	document.getElementById('agtDetailsInfo').innerHTML = detailshtml;		       			   //document.getElementById('details_'+curSelectedAgt).value
	document.getElementById('agtName').innerHTML = curSelectAgtName;

}

function saveSchedule(){
	 var nbr_breaks = nrows - 1 ;
	 document.published.action = '/aheevaccs/servlet/SaveScheduleServlet?nbr_breaks='+nbr_breaks+'&sel=3' ;
	 return true;
}

function showmenuie5(e){

	//Find out how close the mouse is to the corner of the window
	var rightedge=ie5? document.body.clientWidth-event.clientX : window.innerWidth-e.clientX
	var bottomedge=ie5? document.body.clientHeight-event.clientY : window.innerHeight-e.clientY

	//if the horizontal distance isn't enough to accomodate the width of the context menu
	if (rightedge<menuobj.offsetWidth)
		//move the horizontal position of the menu to the left by it's width
		menuobj.style.left=ie5? document.body.scrollLeft+event.clientX-menuobj.offsetWidth : window.pageXOffset+e.clientX-menuobj.offsetWidth
	else
		//position the horizontal position of the menu where the mouse was clicked
		menuobj.style.left=ie5? document.body.scrollLeft+event.clientX : window.pageXOffset+e.clientX

	//same concept with the vertical position
	if (bottomedge<menuobj.offsetHeight)
		menuobj.style.top=ie5? document.body.scrollTop+event.clientY-menuobj.offsetHeight : window.pageYOffset+e.clientY-menuobj.offsetHeight
	else
		menuobj.style.top=ie5? document.body.scrollTop+event.clientY : window.pageYOffset+e.clientY

	menuobj.style.visibility="visible"
	return false
}

function hidemenuie5(e){
	menuobj.style.visibility="hidden"
}

function highlightie5(e){
	var firingobj=ie5? event.srcElement : e.target
	if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
		if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode //up one node
		firingobj.style.backgroundColor="highlight"
		firingobj.style.color="white"
		if (display_url==1)
			window.status=event.srcElement.url
	}
}

function lowlightie5(e){
	var firingobj=ie5? event.srcElement : e.target
	if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
	if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode //up one node
	firingobj.style.backgroundColor=""
	firingobj.style.color="black"
	window.status=''
	}
}

function jumptoie5(e){
	var firingobj=ie5? event.srcElement : e.target
	if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
		if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode

		//will open a servlet that will do the job - delete or switch to another agent
		if (firingobj.getAttribute("target"))
		window.open(firingobj.getAttribute("url"),firingobj.getAttribute("target"))
		else
		window.location=firingobj.getAttribute("url")
	}
}

function cursorPos(pX,pY)
{
  this.x = pX;
  this.y = pY;
}
var theClick = new cursorPos(0,0);
function setMousePos()
{
	theClick.x =  window.event.clientX;
	theClick.y =  window.event.clientY;
}

var agtmenuObj;
function showAgtMenu()
{
	setAgentDetails()
	setMousePos();
	agtmenuObj.style.top        = theClick.y + document.body.scrollTop;
 	agtmenuObj.style.left       = theClick.x + document.body.scrollLeft ;
	window.status = (theClick.y+'..'+theClick.x+'.t.'+agtmenuObj.style.top+'.l.'+agtmenuObj.style.left + '.h.'+agtmenuObj.style.maxHeight + '.w..'+ agtmenuObj.style.maxWidth  )

	agtmenuObj.style.visibility = 'visible';
 	document.getElementById('schedmenuAgtInfo').style.left = parseInt(agtmenuObj.style.left.substring(0,agtmenuObj.style.left.length-2),10) ;
	document.getElementById('schedmenuAgtInfo').style.top = 20+ parseInt(agtmenuObj.style.top.substring(0,agtmenuObj.style.top.length-2),10) ;

 	document.getElementById('schedmenuAgtInfoItem1').style.left = 150 + parseInt(agtmenuObj.style.left.substring(0,agtmenuObj.style.left.length-2),10) ;
	document.getElementById('schedmenuAgtInfoItem1').style.top = 20 + parseInt(agtmenuObj.style.top.substring(0,agtmenuObj.style.top.length-2),10) ;

 	/*document.getElementById('menuitems3').style.left = 120 + parseInt(schedmenuObj.style.left.substring(0,schedmenuObj.style.left.length-2),10) ;
	document.getElementById('menuitems3').style.top = 42 + parseInt(schedmenuObj.style.top.substring(0,schedmenuObj.style.top.length-2),10) ;  */
        document.getElementById('schedmenuAgtQuit').style.left =  parseInt(agtmenuObj.style.left.substring(0,agtmenuObj.style.left.length-2),10) ;
	document.getElementById('schedmenuAgtQuit').style.top = 40 + parseInt(agtmenuObj.style.top.substring(0,agtmenuObj.style.top.length-2),10) ;


	return false;
}

function showAgtMenuItems()
{
  	//document.getElementById('agtDetailsInfo').innerHTML = 'bertrand';
  	document.getElementById('schedmenuAgtInfo').style.visibility = 'visible';
 	document.getElementById('schedmenuAgtInfoItem1').style.visibility = 'hidden';
 	//document.getElementById('menuitems3').style.visibility = 'visible';
 	document.getElementById('schedmenuAgtQuit').style.visibility = 'visible';
}
function showAgtMenuItems1()
{
 	document.getElementById('schedmenuAgtInfoItem1').style.visibility = 'visible';
}

function hideAgtMenu()
{
	 document.getElementById('schedmenuAgtInfo').style.visibility = 'hidden';
	 document.getElementById('schedmenuAgtInfoItem1').style.visibility = 'hidden';
	// document.getElementById('menuitems3').style.visibility = 'hidden';
 	document.getElementById('schedmenuAgtQuit').style.visibility = 'hidden';


 	 agtmenuObj.style.visibility = 'hidden';
}

function hideAgtMenuItems()
{
	setMousePos();
	var smenuitemObj = document.getElementById('schedmenuAgtInfo');
	var diffX =document.body.scrollLeft+theClick.x-parseInt(agtmenuObj.style.left.substring(0,agtmenuObj.style.left.length-2));
	var diffY =document.body.scrollTop + theClick.y-parseInt(agtmenuObj.style.top.substring(0,agtmenuObj.style.top.length-2));
	//var maxwidth = parseInt(schedmenuObj.style.width.substring(0,schedmenuObj.style.width.length-2)) + parseInt(smenuitemObj.style.width.substring(0,smenuitemObj.style.width.length-2));
	//diffX = diffX - 23;
	//diffY = diffY - 28;
	if((diffX < 0) || (diffX > 200) ||(diffY < 0) || (diffY > 50)){
            document.getElementById('schedmenuAgtInfo').style.visibility = 'hidden';
	    document.getElementById('schedmenuAgt').style.visibility = 'hidden';
	    document.getElementById('schedmenuAgtInfoItem1').style.visibility = 'hidden';
	    document.getElementById('schedmenuAgtQuit').style.visibility = 'hidden';

 	 }
	//window.status = ('..x='+theClick.x+'..y='+theClick.y+ ' diffX='+diffX+'..diffY='+diffY)
}


if (ie5||ns6){
menuobj.style.display=''
//document.oncontextmenu=showmenuie5
document.onclick=hidemenuie5
}

</script>


<jsp:useBean id="sc" scope="request" class="aheevaManager.wfm_schedule.beanSchedule" />


<%
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String startingDate="";
    String endingDate="";
    String sRet="";
    int i,j,k;
    long tLoginTime;
    String agents = "",myagt="";
    String [] m_Agents;
    String [] m_tLoginTime;

    String agentGroups  = request.getParameter("group");
    StringTokenizer tok = null, tokGrp=null,  tokn = null;
    String agentGroupName ="";
    String agentGroup ="";
    String   aPeriod="";
    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    int numCampaigns = tok.countTokens();
    for( k = 0; k <numCampaigns; k++ ) {
        String agentGroupTemp = tok.nextToken();
        tokGrp = new java.util.StringTokenizer(agentGroupTemp,",");
        agentGroupName =tokGrp.nextToken();
        agentGroup = tokGrp.nextToken();
    }

%>


<form name="published"  method="post" >
<div class="img-control" >
<table align="right" border="0" width="25%">

</table>
</div>
<div class="tab-pane" id="tabPane1" >
	 <script type="text/javascript">
	  tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	 </script>

	<div class="tab-page" id="tabPage1"  align="center">
	  <h2 class="tab"><%= pagePubHoData.getWord("Schedule")%></h2>
	   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );
	   </script>
	  <fieldset >
		<table width="600"  border="0">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="550" class="reportsID"><div align="center"><b>
				<%= pagePubHoData.getWord("Schedule")%>&nbsp; <%= pagePubHoData.getWord("From")%>:
				<%out.write(startingDateDaily);	%>
				to
				<%out.write(endingDateDaily);	%>
				</b></div></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="550" class="reportsID"><div align="center"><b>
					<%= pagePubHoData.getWord("Agent group")%>:  <%out.write(agentGroupName);%>   </b></div>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>


		<span class=clickableSpan  id="spanObj"   onclick= "hideAgtMenu()" onMouseMove="hideAgtMenuItems()">
		<!--//oncontextmenu="showAgtMenu(); return false"<span class=clickableSpan style="position:absolute" oncontextmenu="showmenuie5(); return false" oncontextmenu = "showAgtMenu(); return false" onclick= "hideAgtMenu()" onMouseMove="hideAgtMenuItems()">-->

		<table>
		  <tr bgcolor='#e6eff4'>
<td><%= pagePubHoData.getWord("Name")%>  </td>
<td><%= pagePubHoData.getWord("Sunday")%> </td>
<td><%= pagePubHoData.getWord("Monday")%> </td>
<td><%= pagePubHoData.getWord("Tuesday")%> </td>
<td><%= pagePubHoData.getWord("Wednesday")%> </td>
<td><%= pagePubHoData.getWord("Thursday")%> </td>
<td><%= pagePubHoData.getWord("Friday")%> </td>
<td><%= pagePubHoData.getWord("Saturday")%> </td>
<td><%= pagePubHoData.getWord("Total hours")%> </td>

		  </tr>
		  <%
		   //get the connection
		   try{
                        sc.getConnection();
       			sc.GetGroupAgentPublishedSchedule(startingDateDaily,endingDateDaily, agentGroup);
		   }catch(Exception e){
		   }
		   for (i = 0; i < sc.m_vAllAgents.size(); i++) {
			  beanAgentLoginInfo agent = (beanAgentLoginInfo)sc.m_vAllAgents.elementAt(i); %>


			<%if (i%2==0){%>
			<tr bgcolor='#b4cfff'>
			<%}else{%>
			<tr bgcolor='#e6eff4'>
			<%}%>
				<td> <%out.write(agent.last_name);%>,<%out.write(agent.first_name);%>&nbsp;
				 	[<%out.write(agent.agt_login_id);%>] </td>

				<script language="JavaScript">
				aIdArray[<%= i %>] = '<%= agent.agt_id%>';
				</script>

				<%if (agent.shifts.sunstat.startsWith("1")){%>
				     <td bgcolor='red' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[0]%>')">
				<%}else if(agent.shifts.sunstat.startsWith("2")){%>
                                    <td bgcolor='yellow' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[0]%>')">
                                <%}else{%>
				     <td onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[0]%>')">
				<%}%>
				<% if(agent.shifts.sun.length()>=1){%>

				<% if (agent.shifts.sun.length()>0) {%>
				  <% out.write(agent.shifts.sun.substring(0,5)+ "-" + agent.shifts.sun.substring(agent.shifts.sun.length()-5,agent.shifts.sun.length()) );  %>
				<%}%>

				<%}else{%>
				&nbsp;
				<%}%>
				    </td>
				<script language="JavaScript">
				<% if(agent.shifts.sun.length()>=1){%>
				aSunArray[<%= i %>] = '<%= agent.shifts.sun.toString() %>'+'-'+<%=agent.shifts.sunstat.toString() %>;
				<%}else{%>
				aSunArray[<%= i %>] = '';
				<%}%>
				</script>


				<%if (agent.shifts.monstat.startsWith("1")){%>
				     <td bgcolor='red' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[1]%>')">
				<%}else if(agent.shifts.monstat.startsWith("2")){%>
				    <td bgcolor='yellow' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[1]%>')">
                                <%}else{%>
				     <td onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[1]%>')">
				<%}%>
				<% if (agent.shifts.mon.length()>0) {%>
				<% out.write(agent.shifts.mon.substring(0,5)+ "-" + agent.shifts.mon.substring(agent.shifts.mon.length()-5,agent.shifts.mon.length()) );  %>
				<%}%></td>
				<script language="JavaScript">

				<% if(agent.shifts.mon.length()>=1){%>
				aMonArray[<%= i %>] = '<%= agent.shifts.mon.toString() %>'+'-'+<%=agent.shifts.monstat.toString() %>;
				<%}else{%>
				aMonArray[<%= i %>] = '';
				<%}%>
				</script>

				<%if (agent.shifts.tuesstat.startsWith("1")){%>
				      <td bgcolor='red' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[2]%>')">
                                <%}else if (agent.shifts.tuesstat.startsWith("2")){%>
				      <td bgcolor='yellow' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[2]%>')">
				<%}else{%>
				     <td onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[2]%>')">
				<%}%>
				<%if (agent.shifts.tues.length()>0){%>
				     <% out.write(agent.shifts.tues.substring(0,5)+ "-" + agent.shifts.tues.substring(agent.shifts.tues.length()-5,agent.shifts.tues.length()) );  %>
				<%}%> </td>
				<script language="JavaScript">
				<% if(agent.shifts.tues.length()>=1){%>
				aTueArray[<%= i %>] = '<%= agent.shifts.tues.toString() %>'+'-'+<%=agent.shifts.tuesstat.toString() %>;
				<%}else{%>
				aTueArray[<%= i %>] = '';
				<%}%>
				</script>

				<%if (agent.shifts.wednesstat.startsWith("1")){%>
				      <td bgcolor='red' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[3]%>')">
                               <%}else if (agent.shifts.wednesstat.startsWith("2")){%>
				      <td bgcolor='yellow' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[3]%>')">
				<%}else{%>
				     <td onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[3]%>')">
				<%}%>
				<%if (agent.shifts.wednes.length()>0){%>
				     <% out.write(agent.shifts.wednes.substring(0,5)+ "-" + agent.shifts.wednes.substring(agent.shifts.wednes.length()-5,agent.shifts.wednes.length()) );  %>
				<%}%></td>

				<script language="JavaScript">
				<% if(agent.shifts.wednes.length()>=1){%>
				aWedArray[<%= i %>] = '<%= agent.shifts.wednes.toString() %>'+'-'+<%=agent.shifts.wednesstat.toString() %>;
				<%}else{%>
				aWedArray[<%= i %>] = '';
				<%}%>
				</script>

				<%if (agent.shifts.thursstat.startsWith("1")){%>
				      <td bgcolor='red' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[4]%>')">
                                <%}else if (agent.shifts.thursstat.startsWith("2")){%>
				      <td bgcolor='yellow' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[4]%>')">
				<%}else{%>
				     <td onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[4]%>')">
				<%}%>
				<%if (agent.shifts.thurs.length()>0){%>
				     <% out.write(agent.shifts.thurs.substring(0,5)+ "-" + agent.shifts.thurs.substring(agent.shifts.thurs.length()-5,agent.shifts.thurs.length()) );  %>
				<%}%>
				</td>
				<script language="JavaScript">
				<% if(agent.shifts.thurs.length()>=1){%>
				aThuArray[<%= i %>] = '<%= agent.shifts.thurs.toString() %>'+'-'+<%=agent.shifts.thursstat.toString() %>;
				<%}else{%>
				aThuArray[<%= i %>] = '';
				<%}%>
				</script>

				 <%if (agent.shifts.fristat.startsWith("1")){%>
					  <td bgcolor='red' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[5]%>')">
                                 <%}else if (agent.shifts.fristat.startsWith("2")){%>
					  <td bgcolor='yellow' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[5]%>')">
				<%}else{%>
					 <td onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[5]%>')">
				<%}%>
				<%if (agent.shifts.fri.length()>0){%>
				     <% out.write(agent.shifts.fri.substring(0,5)+ "-" + agent.shifts.fri.substring(agent.shifts.fri.length()-5,agent.shifts.fri.length()) );  %>
				<%}%>

				</td>
				<script language="JavaScript">
				<% if(agent.shifts.fri.length()>=1){%>
				aFriArray[<%= i %>] = '<%= agent.shifts.fri.toString() %>'+'-'+<%=agent.shifts.fristat.toString() %>;
				<%}else{%>
				aFriArray[<%= i %>] = '';
				<%}%>
				</script>

				<%if (agent.shifts.saturstat.startsWith("1")){%>
					  <td bgcolor='red' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[6]%>')">
                                <%}else if (agent.shifts.saturstat.startsWith("2")){%>
					  <td bgcolor='yellow' onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[6]%>')">
				<%}else{%>
					 <td onMouseover="setAgent('<%out.write(agent.last_name);%>','<%out.write(agent.first_name);%>','<%=agent.agt_id%>','<%=agent.shifts.detailsPerDay[6]%>')">
				<%}%>
				<%if (agent.shifts.satur.length()>0){%>
				     <% out.write(agent.shifts.satur.substring(0,5)+ "-" + agent.shifts.satur.substring(agent.shifts.satur.length()-5,agent.shifts.satur.length()) );  %>
				<%}%>

				</td>
				<script language="JavaScript">
				<% if(agent.shifts.satur.length()>=1){%>
				aSatArray[<%= i %>] = '<%= agent.shifts.satur.toString() %>'+'-'+<%=agent.shifts.saturstat.toString() %>;
				<%}else{%>
				aSatArray[<%= i %>] = '';
				<%}%>
				</script>

				<td><% out.write(agent.shifts.getTotal()); %></td>
			 </tr>

		 <%} // fin for
		 //get the connection
		   try{
			   sc.closeConnection();
		   }catch(Exception e){
		   }

		 %>
		</table>

		<table>
			 <tr>
			   <td  style="background-color:red" width="40"></td><td>&nbsp;</td><td><%= pagePubHoData.getWord("agent absent this day")%>  </td>
			 </tr>
                         <tr>
			   <td  style="background-color:yellow" width="40"></td><td>&nbsp;</td><td><%= pagePubHoData.getWord("agent has quit")%>  </td>
			 </tr>
		   </table>

		<script>
		agtmenuObj = document.getElementById('schedmenuAgt');

		</script>
		</span>

	 </fieldset>
	</div>

	<div class="tab-page" id="tabPage2"  align="center">
	  <h2 class="tab"><%= pagePubHoData.getWord("Absence")%> </h2>
	   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );
	   </script>
	  <fieldset>
      <%@ include file="../Resources_pages/xc2_default_labels.jsp" %>
		<!-- Calendrier dbut -->
		<script language="javascript" src="../Resources_pages/xc2_default.js"></script>
		<script language="javascript">xcAutoHide=1000;</script>
		<script language="javascript" src="../Resources_pages/xc2_inpage.js"></script>
		<!-- Calendrier fin -->

		<table width="600"  border="0">
  <tr>
   <td>&nbsp;</td>
  </tr>
 <tr>
    <td width="550" class="reportsID">
     <div align="center">
       <b><%= pagePubHoData.getWord("Absence management for group")%> <br><%out.write(agentGroupName);%><br>
   <%= pagePubHoData.getWord("From")%>  <%out.write(startingDateDaily);%><%= pagePubHoData.getWord("To")%>  <%out.write(endingDateDaily);%></b>
     </div>
    </td>
  </tr>
  <tr>
   <td>&nbsp;</td>
  </tr>
  <tr>
   <td>&nbsp;</td>
  </tr>
</table>
		<input type="hidden" name="start_date" value='<%out.write(startingDateDaily);%>'>
		<input type="hidden" name="end_date" value='<%out.write(endingDateDaily);%>'>
		<input type="hidden" name="group" value='<%out.write(agentGroup);%>'>
		<input type="hidden" name="groupName" value='<%out.write(agentGroupName);%>'>

		<table border=0 align="left">
		   <tr>
			<td align="left"><%= pagePubHoData.getWord("Choose agent")%> </td>
			<td align="left">
			<SELECT NAME="agent" onChange="change(this)">
			<option>
			<% for (i = 0; i < sc.m_vAllAgents.size(); i++) {
			beanAgentLoginInfo agent = (beanAgentLoginInfo)sc.m_vAllAgents.elementAt(i); %>
			<OPTION VALUE="<%out.write(agent.agt_id);%>"><%out.write(agent.last_name);%>,<%out.write(agent.first_name);%>
			<%}%>
			</SELECT>
			</td>
			<td>&nbsp;</td>
		   </tr>
		   <tr>
			<td>&nbsp;</td><td>&nbsp;</td>
		   </tr>
		<!-- mettre en commentaire-->

		<!--Fin commentaire -->
		   <tr>
			<td align="left"><%= pagePubHoData.getWord("Schedule")%> </td>
			<td align="left">
			 <div id="agent_shift" style="MARGIN: 0px 5px">
			 </div>
			</td>

		   </tr>
		   <tr>
			<td>&nbsp;</td><td>&nbsp;</td>
		   </tr>
		   <tr>
			<td align="left">
			<input name="submitButton" type="submit" value="<%= pagePubHoData.getWord("Save")%>" onClick="return setAbsent();"/>
			<td>&nbsp;</td>
		   </tr>
		  </table>
	  </fieldset>
	</div>


	<div class="tab-page" id="tabPage3"  align="center">
	  <h2 class="tab"><%= pagePubHoData.getWord("Shift trade")%> </h2>
	   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) ); </script>
	  	<fieldset>

	  	<table width="600"  border="0">
		  <tr>
		   <td>&nbsp;</td>
		  </tr>
		 <tr>
			<td width="550" class="reportsID"><div align="center">
				<b>
				<%= pagePubHoData.getWord("Shift trade management for group")%> <br><%out.write(agentGroupName);%>
				</b></div>
			</td>
		  </tr>
		  <tr>
		   <td>&nbsp;</td>
		  </tr>
		  <tr>
		   <td>&nbsp;</td>
		  </tr>
		</table>
		<input type="hidden" name="start_date" value='<%out.write(startingDateDaily);%>'>
		<input type="hidden" name="end_date" value='<%out.write(endingDateDaily);%>'>

		<table border=0	 align="left" >
		   <tr>
				<td align="left" width ="115"><%= pagePubHoData.getWord("Choose agent")%> 1</td>
			<td align="left">
			<SELECT NAME="agent1" onChange="bla(this)">
			<option>
			<% for (i = 0; i < sc.m_vAllAgents.size(); i++) {
			beanAgentLoginInfo agent = (beanAgentLoginInfo)sc.m_vAllAgents.elementAt(i);
			//String selectedValue = Integer.toString(i) + "-"+ agent.agent_id;
			%>
			<OPTION VALUE="<%out.write(agent.agt_id);%>" ><%out.write(agent.last_name);%>&nbsp;<%out.write(agent.first_name);%>
			<%}%>
			</SELECT>
			</td>
			<td >&nbsp;</td>
			<td align="left" width ="80"><%= pagePubHoData.getWord("Choose day")%> </td>
			<td align="left" id="id_shift1" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" >
			 <input type="text" size="20" onFocus="showCalendar('',this,this,'','id_shift1',0,30,1);this.blur()" name="shift1" />
			</td>
			<td width=600>&nbsp; </td>
			</tr>
			<tr>
			<td >&nbsp;</td>
			</tr>
			<tr>
			<td align="left" width ="115"><%= pagePubHoData.getWord("Schedule")%></td>
			<td colspan="5"><div id="agent_shifts1" style="MARGIN: 0px 5px"></div></td> 
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr><td align="left" ><%= pagePubHoData.getWord("Choose agent")%> 2</td>
			   <td align="left">
				   <SELECT NAME="agent2" onChange="bla2(this)">
					   <option>
					   <% for (i = 0; i < sc.m_vAllAgents.size(); i++) {
					   beanAgentLoginInfo agent = (beanAgentLoginInfo)sc.m_vAllAgents.elementAt(i); %>
					   <OPTION VALUE="<%out.write(agent.agt_id);%>"><%out.write(agent.last_name);%>&nbsp;<%out.write(agent.first_name);%>
					   <%}%>
				   </SELECT>
				</td>
				<td>&nbsp;</td>
				<td align="left" ><%= pagePubHoData.getWord("Choose day")%></td>
				<td align="left" id="id_shift2" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" >
				 <input type="text" size="20" onFocus="showCalendar('',this,this,'','id_shift2',0,30,1);this.blur()" name="shift2" />
				</td>
				</tr>
				<tr>
				<td>&nbsp;</td>
				</tr>
				<tr>
				<td align="left"><%= pagePubHoData.getWord("Schedule")%></td>
				<td colspan="5"><div id="agent_shifts2" style="MARGIN: 0px 5px"></div></td>
				</tr>
				<tr>
				<td>&nbsp;</td>
				</tr>
				<tr>
				<td>
			<input name="submitButton" type="submit" value="<%= pagePubHoData.getWord("Trade")%>" onClick="return trade();"/>
				</td>
			</tr>
		  </table>
		</fieldset>
	</div>


	<div class="tab-page" id="tabPage4" >
	  <h2 class="tab"><%= pagePubHoData.getWord("Manual schedule")%> </h2>
	   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage4" ) );</script>
		<%@page import="java.text.SimpleDateFormat"%>
		<%@page import="java.util.Date"%>
		<%@page import="aheevaManager.schedule.*"%>
		<%@ include file="../Resources_pages/schedFunctions_labels.jsp" %>
		<%@ include file="../Resources_pages/weeklycalendar_labels.jsp" %>
 		<jsp:useBean id="beanSched" scope="request" class="aheevaManager.schedule.beanAgentSchedule" />

		<script language="JavaScript" type="text/javascript" src="../Resources_pages/schedTable.js"></script>
		<script language="JAVASCRIPT" src="../Resources_pages/BaseLayer.js"></script>
		<LINK REL=StyleSheet HREF="../Resources_pages/calendar.css" TYPE="text/css">
		<script LANGUAGE="JavaScript" SRC="../Resources_pages/weeklycalendar.js"></script>
		<script LANGUAGE="JavaScript" SRC="../Resources_pages/schedFunctions.js"></script>

		<%
		beanWorkScheduleDetails mySchedData = null;
		String sret="";
		String selected_agt_id 	  = request.getParameter("man_agent");
		String selected_agt_login = request.getParameter("man_agent_login");
		String st_date   = request.getParameter("WeeklyDateStart");
		String end_date  = request.getParameter("WeeklyDateEnd");
		String spacing   = request.getParameter("spacing");
		String startTime = request.getParameter("startTime");
		String endTime   = request.getParameter("endTime");
		
		System.out.println(" selected_agt_id ="+selected_agt_id+"  selected_agt_login="+selected_agt_login+" startTime="+startTime+" endTime="+endTime+" st_date="+st_date );
		if((selected_agt_login != null) && (selected_agt_id != null) && (selected_agt_login.length() > 0)){
			int sel = Integer.parseInt(request.getParameter("sel"));
		%>
			<script>
			tp1.setSelectedIndex(<%=sel%>);</script>
		<%
		    SimpleDateFormat sdfOutput =  new SimpleDateFormat( "yyyy-MM-dd");
      		SimpleDateFormat sdfInput = new SimpleDateFormat ( "MM/dd/yy");
  			java.util.Date sDate=null,eDate=null;
      		sDate = sdfInput.parse( st_date );
			eDate = sdfInput.parse( end_date );
       		String st_date_formated=sdfOutput.format(sDate);
	       	String end_date_formated=sdfOutput.format(eDate);

		  	sret=beanSched.getAgentWorkScheduleForWfmManualSchedule(selected_agt_login,"","",st_date_formated, end_date_formated, startTime,endTime,Integer.parseInt(spacing),"Daily") ;
			System.out.println(" sret ="+sret);

			for(int cnt = 0;cnt < beanSched.m_schedDailyDetails.size();cnt++){
				  beanWorkScheduleDetails this_day_schedule_data = ((beanWorkScheduleDetails)(beanSched.m_schedDailyDetails.elementAt(cnt)));
		  %>
		     <script>
			     allAgentScheduleData[allAgentScheduleData.length]= '<%out.write(this_day_schedule_data.schedAdhDetails);%>';
		    </script>
		 <%
		   } // end For


		}
		%>
		<br>
 		<fieldset id="schedfieldset" style="height:850px; left:100px">

		<div id='paramsDivs'  class="paramsDivs" align="left">
		<legend><%= pagePubHoData.getWord("View schedule parameters")%> </legend>
		<table border="1px" bordercolordark="#ffffff" ><tr>
		 <td  bordercolor="#000000">
			<table border="0" bordercolor="#999999" cellpadding="0" cellspacing="0" bgcolor="#ffffff"  width="600"  align="center" >
			<tr>
				<td height="10" colspan="2" width="200"  ><a style="font-family:Tahoma; font-size:12px; font-weight:bold; color:#000000"><%= pagePubHoData.getWord("Select an agent")%>  </a></td>
				<td width="150" >
				 <%--select name="man_agent" onChange="getAgentSchedule(this)" class="paramsDivText"--%>
				 <select name="man_agent" class="paramsDivText">
				   <option></option>
				   <% for (i = 0; i < sc.m_vAllAgents.size(); i++) {
				   beanAgentLoginInfo agent = (beanAgentLoginInfo)sc.m_vAllAgents.elementAt(i) ;%>
				   <option value="<%out.write(agent.agt_id);%>"
				   				  <%if((selected_agt_id != null) && selected_agt_id.compareTo(agent.agt_id)==0)
									  out.write(" selected ");%>>
					<%out.write(agent.last_name);%>,&nbsp;<%out.write(agent.first_name);%>[<%=agent.agt_login_id%>]</option>
				   <%}%>
				 </select>
				</td>
				<td  width="43">&nbsp;</td>
				<td >&nbsp;</td>
				<td  width="112" align="right">&nbsp;</td>
				<td  align="right">&nbsp;</td>
				<td  width="112" align="right" >&nbsp;</td>
			</tr>
			<!--<tr>
				<td height="10" colspan="2"  ><a style="font-family:Tahoma; font-size:12px; font-weight:bold">Date Picker </a></td>
				<td ><input type="text" name="DatePicker" id="DatePicker"></td>
				<td ><label>
				  <input type="button"  value="..." onClick="w_displayCalendar('DatePicker',null);">
				</label></td>
				<td >&nbsp;</td>
				<td  align="right"><a style="font-family:Verdana, Arial; font-size:12px; font-weight:bold"></a></td>
				<td  align="right">&nbsp;</td>
				<td  align="right" ></td>
			</tr>-->
			<tr>
				<td colspan="2" rowspan="2"><a style="font-family:Tahoma; font-size:12px; color:#000000; font-weight:bold"><%= pagePubHoData.getWord("Week selector")%>   </a></td>
				<td height="10" ><input type="text" name="WeeklyDateStart" id="WeeklyDateStart"></td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td  align="right">
					<a style="font-family:Verdana, Arial; font-size:12px; font-weight:bold; color:#000000;"><%= pagePubHoData.getWord("Starting time")%> </a></td>
				<td  align="right">&nbsp;</td>
				<td  align="right" ><a style="font-family:Verdana, Arial; font-size:12px; font-weight:bold;color:#000000;"><%= pagePubHoData.getWord("Ending time")%>  </a></td>
			</tr>

			<tr>
				<td height="10" ><input type="text" name="WeeklyDateEnd" id="WeeklyDateEnd"></td>
				<td ><input type="button"  value="..." onClick="w_displayCalendar('WeeklyDateStart','WeeklyDateEnd');"></td>
				<td >&nbsp;</td>
				<td  align="right">
					<div align="right">
					  <select name="startTime" onChange="setStartTime()" class="paramsDivText">
						 <script>
							fillTimeBox(8);
						 </script>
					  </select>
					 </div></td>
				<td  align="right">&nbsp;</td>
				<td  align="right" >
					<select name="endTime"  onChange="setEndTime()" class="paramsDivText">
						 <script>
							fillTimeBox(24);
						 </script>
					</select>&nbsp;
				</td>
			</tr>

			<tr>
				<td colspan="2"   > <a style="font-family:Tahoma; font-size:12px; font-weight:bold; color:#000000;"><%= pagePubHoData.getWord("Spacing(mn)")%> </a></td>
				<td >
					<select name="spacing" onChange="setSpacing()" class="paramsDivText" >
						<option value="15">15 min</option>
						<option value="30">30 min</option>
						<option value="60">1 h</option>
					</select>
				</td>
				<td  style=" border-bottom-width: 1; border-top-width:1">&nbsp;</td>
				<td  style=" border-bottom-width: 1; border-top-width:1">&nbsp;</td>
				<td  valign"top"  align="left" >
				<div align="right">
				
			<input name="viewSched" type="button" value="<%= pagePubHoData.getWord("View schedule")%>" onClick="viewScheduleTable()"/>
			
				 </div></td>
				<td  valign"top"  align="right" >&nbsp;<input type="hidden" id="allsched" name="allsched" ></td>
				<td  valign"top"  align="right" >
	<input id="saveSched" name="saveSched" type="button" value="<%= pagePubHoData.getWord("Save schedule")%>" onClick="saveScheduleForWeek()"/></td>

			</tr>
			</table>
		 </td>
		 <td rowspan="5" width="150" nowrap="nowrap" ><table><tr><td bgcolor="#0066FF" width="10px"></td><td><a class="legendText"><%= pagePubHoData.getWord("Work manual")%> </a></td></tr>
		 						<tr><td bgcolor="#009900"></td><td><a class="legendText"><%= pagePubHoData.getWord("Break manual")%> </a></td></tr>
								<tr><td bgcolor="#663399"></td><td><a class="legendText"><%= pagePubHoData.getWord("Work schedule")%> </a></td></tr>
								<tr><td bgcolor="#666666"></td><td><a class="legendText"><%= pagePubHoData.getWord("Break schedule")%> </a></td></tr>
								<tr><td bgcolor="#FFFF00"></td><td><a class="legendText"><%= pagePubHoData.getWord("Cell selection")%> </a></tr>
						</table> </td>
		</tr></table>
		</div>
		<input type="hidden" name="start_date_4" id="start_date_4" value='<%if(st_date != null) out.write(st_date);
																			else out.write(startingDateDaily);%>'>
		<input type="hidden" name="end_date_4"  id="end_date_4" value='<% if(end_date != null) out.write(end_date);
																			else out.write(endingDateDaily);%>'>
		<input type="hidden" name="group" value='<%out.write(agentGroup);%>'>
		<input type="hidden" name="groupName" value='<%out.write(agentGroupName);%>'>
	    <input type="hidden" name="man_agent_login" value='<%=(selected_agt_login == null ? "":selected_agt_login)%>'>
	    <input type="hidden" name="sel_agt_id" value='<%=(selected_agt_id == null ? "":selected_agt_id)%>'>

		<div id="schedmenu" class="menudiv" onMouseOver="showMenuItems()" onMouseOut="hideSchedMenuItems()" align="center"><table width="100%" height="100%" bgcolor="#FFFFFF"  cellspacing="0"><tr><td width="25px" bgcolor="#CCCCCC" align="center"><img src="../img/sched-18.jpg"/></td><td bgcolor="#FFFFFF" align="center"><a style="font-size:11px; font-family:Tahoma, Verdana, Arial; color:#000000; font-weight:bold"><%= pagePubHoData.getWord("Set schedule")%>  </a></td> <td width="10%"><img src="../img/arrowmenu.gif"/></td></tr></table> </div>

		<div id="menuitems1" class="sousmenusched" onClick="setWorkPeriod()" align="center"><table width="100%" height="100%" bgcolor="#FFFFFF"  cellspacing="0"><tr><td width="25px" bgcolor="#CCCCCC" align="center"><img  src="../img/work.gif"/></td><td bgcolor="#FFFFFF"><a style="font-size:11px; font-family:Tahoma, Verdana, Arial; color:#000000; font-weight:bold"  onmouseover="javascript:this.style.color='blue'" onMouseOut="javascript:this.style.color='black'" align="center"><%= pagePubHoData.getWord("work")%>  </a></td></tr></table> </div>

		<div id="menuitems2"  class="sousmenusched" onClick="setBreakPeriod()" align="center"> <table width="100%" height="100%" bgcolor="#FFFFFF"  cellspacing="0"><tr><td width="25px" bgcolor="#CCCCCC" align="center"><img src="../img/lunch-schedule-16.gif"/></td><td bgcolor="#FFFFFF"><a style="font-size:11px; font-family:Tahoma, Verdana, Arial; color:#000000; font-weight:bold"   onmouseover="javascript:this.style.color='green'" onMouseOut="javascript:this.style.color='black'" align="center"> <%= pagePubHoData.getWord("break")%>  </a></td></tr></table></div>

		<div id="menuitems3"  class="sousmenusched" onClick="deletePeriod()" align="center"> <table width="100%" height="100%" bgcolor="#FFFFFF"  cellspacing="0"><tr><td width="25px" bgcolor="#CCCCCC" align="center"><img src="../img/deleten.gif"/></td><td bgcolor="#FFFFFF"><a style="font-size:11px; font-family:Tahoma, Verdana, Arial;  color:#000000; font-weight:bold"   onmouseover="javascript:this.style.color='red'" onMouseOut="javascript:this.style.color='black'" align="center"><%= pagePubHoData.getWord("delete")%>  </a></td></tr></table></div>

		<script>
		schedmenuObj = document.getElementById('schedmenu');
		//document.published.oncontextmenu = showSchedMenu;
		//document.published.onclick       = hideSchedMenu;
		//document.published.onmousemove   = hideSchedMenuItems;

		</script>
	   </fieldset>
	</div>
</div>
<%
	if(startTime != null){
 		out.write("<script>selectObject(document.getElementById('startTime'), '"+startTime +"');</script>");
 	}

	if(endTime != null){
 		out.write("<script>selectObject(document.getElementById('endTime'), '"+endTime +"');</script>");
 	}

	if(spacing != null){
 		out.write("<script>selectObject(document.getElementById('spacing'), '"+spacing +"'); setSpacing(); </script>");
 	}
%>
<script type="text/javascript">
	setupAllTabs();
	var stdateObj = document.getElementById('start_date_4');
	if( stdateObj != null && stdateObj.value != null && stdateObj.value.length > 0)
		setSelectionDate(stdateObj.value);
	loadtable();
	document.getElementById('WeeklyDateStart').value = startDateValue;
	document.getElementById('WeeklyDateEnd').value = endDateValue;
 </script>
</form>
</body>
</html>
<% pagePubHoData.closeConnection(); %>
