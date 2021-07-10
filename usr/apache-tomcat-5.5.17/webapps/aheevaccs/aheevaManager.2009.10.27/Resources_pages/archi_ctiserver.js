// JavaScript Document

/**
  *
  *
  **/

function CtiServer()
{
	this.xPos	= 0;
	this.yPos 	= 0;
	
	this.buildHTML = function()
	{		
		var sReturn = "";
		sReturn += '<div id="CtiServer" class="CtiServer" style="top:'+this.yPos+'px; left:'+this.xPos+'px;">';		
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';
		sReturn += '<tr><td align="center"><img src="../img/cti_server.gif" width="34" height="56"></td></tr>';
		sReturn += '<tr><td class="archi_title" nowrap>&nbsp;CTI SERVER&nbsp;</td></tr>';
		sReturn += '</table>';
		sReturn += '</div>';
		return sReturn;
	}
	
	this.makeCenter = function()
	{
		var diagramObj 		= document.getElementById('diagramInside');
		var ctiServerObj 	= document.getElementById('CtiServer');
		
		ctiServerObj.style.left = diagramObj.clientWidth/2-ctiServerObj.clientWidth/2;
		ctiServerObj.style.top = diagramObj.clientHeight/10-ctiServerObj.clientHeight/2;
		
		this.xPos  	= diagramObj.clientWidth/2-ctiServerObj.clientWidth/2;
		this.yPos	= diagramObj.clientHeight/10-ctiServerObj.clientHeight/2;		
	}
}