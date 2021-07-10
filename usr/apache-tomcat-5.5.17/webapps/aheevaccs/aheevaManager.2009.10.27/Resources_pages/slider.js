// Store a value from 0 to 100 related to the slider's position
sldValue=0

// Slider's head left and top
sldTop=0
sldLeft=0

// Drag action is on going is set to true
doDrag=false

// Mouse cursor position relatively to the slider's head
sldMouseLeft=0
sldMouseTop=0

// Slider's container left and top boundaries
minLeft=0
maxLeft=0

// Get and set positions
function getAbsLeft(o) {
	oLeft = o.offsetLeft
	while(o.offsetParent!=null) {
		oParent = o.offsetParent
		oLeft += oParent.offsetLeft
		o = oParent
	}
	return oLeft
}

function getAbsTop(o) {
	oTop = o.offsetTop
	while(o.offsetParent!=null) {
		oParent = o.offsetParent
		oTop += oParent.offsetTop
		o = oParent
	}
	return oTop
}

function setLeft(o,oLeft) {
	o.style.left = oLeft + "px"
}

function setTop(o,oTop) {
	o.style.top = oTop + "px"
}

function setPosition(o,oLeft,oTop) {
	setLeft(o,oLeft)
	setTop(o,oTop)
}

// Slider's head mouse down handler
function sldMouseDown(e)
{
	// Get event object for IE
	if (!e) {e = window.event}
	
	// Drag action begins
	doDrag=true
	
	o1=document.getElementById("sldHead")
	o2=document.getElementById("sldContainer")
//	sldLeft = o2.left
//sldTop = o2.top
	// Get slider's head position
	sldLeft=o1.offsetLeft
	sldTop=o1.offsetTop
//alert(sldTop)

	// Get mouse cursor position relatively to the slider's head
	sldMouseLeft=e.clientX-sldLeft
	sldMouseTop=e.clientY-sldTop

	// Get slider's container boundaries
	minLeft=getAbsLeft(o2)
	maxLeft=o2.offsetWidth-o1.offsetWidth
	
	// DEBUG
	//document.getElementById("mouseCapt").innerHTML = "Mouse Position on Mouse Down event : " + e.clientX + "/" + e.clientY
	//document.getElementById("headPos").innerHTML = "Head Position on Mouse Down event : " + sldLeft + "/" + sldTop
	//document.getElementById("mousePosRel").innerHTML = "Relative Mouse Position on Mouse Down event : " + sldMouseLeft + "/" + sldMouseTop
	//document.getElementById("bounds").innerHTML = "minLeft/maxLeft : " + minLeft + "/" + maxLeft
}

// Generic mouse up handler
function sldMouseUp(e)
{
	// Drag action stops
	doDrag=false
}

// Generic mouse move handler
function sldMouseMove(e)
{
	// Get event object for IE
	if (!e) {e = window.event}
	
	// If drag action is on going...
	if (doDrag)
	{
		o=document.getElementById("sldHead")
		
		// Get slider's head new position
		newPos = e.clientX-sldMouseLeft
		
		// Check slider's container boundaries
		if(newPos<=minLeft){newPos=0}
		if(newPos>=maxLeft) {newPos=maxLeft}
		
		// Set slider's head new position
		setPosition(o,newPos,sldTop)
		
		// Get slider's value (0 to 100)
		sldValue = Math.round((newPos * 100)/maxLeft)

		// DEBUG
		document.getElementById("watcher").innerHTML = sldValue + "%"
		
		// Stop event propagation
		return false
	}

	// DEBUG
	//if (document.getElementById("mousePos"))
	//{
	//	document.getElementById("mousePos").innerHTML = "Mouse Position : " + e.clientX + "/" + e.clientY
	//	document.getElementById("dragStatus").innerHTML = "doDrag : " + doDrag
	//}

}

// Set generic handlers
document.onmousemove = sldMouseMove
document.onmouseup= sldMouseUp
