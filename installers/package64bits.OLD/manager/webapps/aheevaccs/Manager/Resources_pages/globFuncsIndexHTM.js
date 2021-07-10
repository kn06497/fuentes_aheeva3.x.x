// JavaScript Document

// GLOBAL FUNCTION OF Index.HTM
function switchFrameSet(doDisplay, endSize)
{
	if(doDisplay) // Descendre le commPage
	{
		document.body.rows = endSize+"%,"+(100-endSize)+"%";
		//document.body.rows = endSize+",*";
	}
	else //le ramener a la position initiale
	{
		document.body.rows = "*,100%";			
	}
	//alert("Inside switchFrameSet()");
}


