// JavaScript Document

/* Top.html global functions */

//set this variable to 1 if you wish the URLs of the highlighted menu to be displayed in the status bar
var display_url=0
var curAgentName = "";
var curAgentLoginID = "";
var curAgentTenant = "";
var curAgentDbid = "";
var menuobj;

var ie5=document.all&&document.getElementById
var ns6=document.getElementById&&!document.all


if (document.layers) { // Netscape
    document.captureEvents(Event.MOUSEMOVE);
    document.onmousemove = captureMousePosition;
	
} else if (document.all) { // Internet Explorer
    document.onmousemove = captureMousePosition;
	
} else if (document.getElementById) { // Netcsape 6
    document.onmousemove = captureMousePosition;
	
}


// Global variables
var xMousePos = 0; // Horizontal position of the mouse on the screen
var yMousePos = 0; // Vertical position of the mouse on the screen
var xMousePosMax = 0; // Width of the page
var yMousePosMax = 0; // Height of the page

// Global variables
var xMousePosFrame = 0; // Horizontal position of the mouse on the screen
var yMousePosFrame = 0; // Vertical position of the mouse on the screen
var xMousePosMaxFrame = 0; // Width of the page
var yMousePosMaxFrame = 0; // Height of the page

function captureMousePosition(e) 
{
    if (document.layers) {
        xMousePos = e.pageX;
        yMousePos = e.pageY;
        xMousePosMax = window.innerWidth+window.pageXOffset;
        yMousePosMax = window.innerHeight+window.pageYOffset;
    } else if (document.all) {
        xMousePos = window.event.x+document.body.scrollLeft;
        yMousePos = window.event.y+document.body.scrollTop;
        xMousePosMax = document.body.clientWidth+document.body.scrollLeft;
        yMousePosMax = document.body.clientHeight+document.body.scrollTop;
    } else if (document.getElementById) {
        xMousePos = e.pageX;
        yMousePos = e.pageY;
        xMousePosMax = window.innerWidth+window.pageXOffset;
        yMousePosMax = window.innerHeight+window.pageYOffset;
    }
	
}


function captureMousePositionInFrame(e)
{
    if (document.layers) {
        xMousePosFrame = e.pageX;
        yMousePosFrame = e.pageY;
        xMousePosMaxFrame = window.innerWidth+window.pageXOffset;
        yMousePosMaxFrame = window.innerHeight+window.pageYOffset;
    } else if (document.all) {
        xMousePosFrame = window.event.x+document.body.scrollLeft;
        yMousePosFrame = window.event.y+document.body.scrollTop;
        xMousePosMaxFrame = document.body.clientWidth+document.body.scrollLeft;
        yMousePosMaxFrame = document.body.clientHeight+document.body.scrollTop;
    } else if (document.getElementById) {
        xMousePosFrame = e.pageX;
        yMousePosFrame = e.pageY;
        xMousePosMaxFrame = window.innerWidth+window.pageXOffset;
        yMousePosMaxFrame = window.innerHeight+window.pageYOffset;
    }
}


function setmenuObj()
{	
	if (ie5||ns6)	
		menuobj=document.getElementById("ie5menu");		
}

function showmenuie5(e){

//Build the context menu before...
buildContextMenu();
setmenuObj();	
hideObj();

//menuobj.style.top = yMousePos;
//menuobj.style.left = xMousePos;

menuobj.style.top 	= yMousePosMax/2-menuobj.clientHeight/2;
menuobj.style.left 	= xMousePosMax/2-menuobj.clientWidth/2;


menuobj.style.visibility="visible";
return false
}

function hidemenuie5(e){
menuobj.style.visibility="hidden"
}

function highlightie5(e){
var firingobj=ie5? event.srcElement : e.target
if (firingobj.className=="contextMenuInStatsViewItems"||ns6&&firingobj.parentNode.className=="contextMenuInStatsViewItems"){
if (ns6&&firingobj.parentNode.className=="contextMenuInStatsViewItems") firingobj=firingobj.parentNode //up one node
firingobj.style.backgroundColor="highlight"
firingobj.style.color="white"
if (display_url==1)
window.status=event.srcElement.url
}
}

function lowlightie5(e){
var firingobj=ie5? event.srcElement : e.target
if (firingobj.className=="contextMenuInStatsViewItems"||ns6&&firingobj.parentNode.className=="contextMenuInStatsViewItems"){
if (ns6&&firingobj.parentNode.className=="contextMenuInStatsViewItems") firingobj=firingobj.parentNode //up one node
firingobj.style.backgroundColor=""
firingobj.style.color="black"
window.status=''
}
}

function jumptoie5(e){
var firingobj=ie5? event.srcElement : e.target
if (firingobj.className=="contextMenuInStatsViewItems"||ns6&&firingobj.parentNode.className=="contextMenuInStatsViewItems"){
if (ns6&&firingobj.parentNode.className=="contextMenuInStatsViewItems") firingobj=firingobj.parentNode
if (firingobj.getAttribute("target"))
	{	
	window.top.main.rbottom.location = firingobj.getAttribute("url");
	//open(firingobj.getAttribute("url"),firingobj.getAttribute("target"))		
	}
else
window.location=firingobj.getAttribute("url")
}
}

function hideObj()
{	
	
	if (ie5||ns6){		
		menuobj.style.display=''
				
		document.onclick=hidemenuie5;
	}
}

function setGlobals(parAgentName, parAgentLoginID, parAgentTenant)
{	
	curAgentName = parAgentName;
	curAgentLoginID = parAgentLoginID;
	curAgentTenant = parAgentTenant;
	curAgentDbid = appletObj.getAgentDBID(curAgentLoginID);
}

function buildContextMenu()
{
	var titleObj;
	var PropertyObj;
	var LogOutAgentObj;
	var PutAgentReady;
	titleObj = document.getElementById("contextTitle");
	titleObj.innerText = "Agent: "+curAgentName+" ["+curAgentLoginID+"]";	
	PropertyObj = document.getElementById("contextProps");
	PropertyObj.url = "Resources_pages/agent.jsp?dbid="+curAgentDbid+"&agtName="+curAgentName+"["+curAgentLoginID+"]&tenant_dbid="+curAgentTenant;
	PropertyObj.target = "parent.rBottom";
	LogOutAgentObj = document.getElementById("contextLogoutAgent");
	LogOutAgentObj.url = "javascript:askForlogoutAgent('"+curAgentLoginID+"')";
	/*
	PutAgentReady = document.getElementById("contextPutAgentReady");
	PutAgentReady.url = "javascript:forceAgentStatus('"+curAgentLoginID+"', 'READY')";
	*/
}

function askForlogoutAgent(theAgentID)
{
	var yesno = confirm('Warning:\nYou are about to log out the agent '+theAgentID+'\nDo you want to continue ?');
	if(yesno)
		appletObj.sendForceAgentStatus(theAgentID, "LOGGED_OUT", "agent");
	
}

function forceAgentStatus(theAgentID, newStatus)
{
	var yesno = confirm('Notice:\nYou are about to force the agent '+theAgentID+' status to '+newStatus+'\nDo you want to continue ?');	
	if(yesno)
		appletObj.sendForceAgentStatus(theAgentID, newStatus, "agent");
}