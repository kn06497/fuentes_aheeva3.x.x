//---------------------------------+
//  CARPE  S l i d e r        1.3  |
//  2005 - 12 - 10                 |
//  By Tom Hermansson Snickars     |
//  Copyright CARPE Design         |
//  http://carpe.ambiprospect.com/ |
//---------------------------------+

// carpeGetElementByID: Cross-browser version of "document.getElementById()"
function carpeGetElementById(element)
{
	if (document.getElementById) element = document.getElementById(element);
	else if (document.all) element = document.all[element];
	else element = null;
	return element;
}
// carpeLeft: Cross-browser version of "element.style.left"
function carpeLeft(elmnt, pos)
{
	if (!(elmnt = carpeGetElementById(elmnt))) return 0;
	if (elmnt.style && (typeof(elmnt.style.left) == 'string')) {
		if (typeof(pos) == 'number') elmnt.style.left = pos + 'px';
		else {
			pos = parseInt(elmnt.style.left);
			if (isNaN(pos)) pos = 0;
		}
	}
	else if (elmnt.style && elmnt.style.pixelLeft) {
		if (typeof(pos) == 'number') elmnt.style.pixelLeft = pos;
		else pos = elmnt.style.pixelLeft;
	}
	return pos;
}

// moveSlider: Handles slider and display while dragging
function moveSlider(evnt)
{
	var evnt = (!evnt) ? window.event : evnt; // The mousemove event
	if (mouseover) { // Only if slider is dragged
		x = pxLeft + evnt.screenX - xCoord // Horizontal mouse position relative to allowed slider positions
			//alert(String(evnt.screenX) + "   " + String(xCoord));
		if (x > xMax) x = xMax // Limit horizontal movement
		if (x < 0) x = 0 // Limit horizontal movement
		carpeLeft(sliderObj.id, x)  // move slider to new horizontal position
		sliderVal = x // pixel value of slider regardless of orientation
		return false
	}
	return
}
// moveSlider: Handles the start of a slider move.
function slide(evnt, from, to, display)
{
	if (!evnt) evnt = window.event;

	var length = to - from;

	sliderObj = (evnt.target) ? evnt.target : evnt.srcElement; // Get the activated slider element.
	sliderObj.pxLen = length // The allowed slider movement in pixels.
	sliderObj.valCount = length // Allowed number of values in the interval.
	sliderObj.func = display

	sliderObj.fromVal = from
	xMax = length
	
	pxLeft = carpeLeft(sliderObj.id) // Sliders horizontal position at start of slide.
	//alert(pxLeft);
	xCoord = evnt.screenX // Horizontal mouse position at start of slide.
	mouseover = true
	document.onmousemove = moveSlider // Start the action if the mouse is dragged.
	document.onmouseup = sliderMouseUp // Stop sliding.
}
// sliderMouseup: Handles the mouseup event after moving a slider.
// Snaps the slider position to allowed/displayed value. 
function sliderMouseUp()
{
	eval(sliderObj.func + "(sliderVal/sliderObj.pxLen)");

	mouseover = false // Stop the sliding.
	//v = (displayObj.value) ? displayObj.value : 0 // Find last display value.
	//pos = (v - sliderObj.fromVal)/(sliderObj.scale) // Calculate slider position (regardless of orientation).
	//if (yMax == 0) carpeLeft(sliderObj.id, pos) // Snap horizontal slider to corresponding display position.
	//if (xMax == 0) carpeTop(sliderObj.id, pos) // Snap vertical slider to corresponding display position.
	if (document.removeEventListener) { // Remove event listeners from 'document' (Moz&co).
		document.removeEventListener('mousemove', moveSlider)
		document.removeEventListener('mouseup', sliderMouseUp)
	}
	else if (document.detachEvent) { // Remove event listeners from 'document' (IE&co).
		document.detachEvent('onmousemove', moveSlider)
		document.detachEvent('onmouseup', sliderMouseUp)
	}
}
