// JavaScript Document
// JavaScript Document

/**
  *
  *
  **/

function NetworkLink()
{
	this.xPos	= 0;
	this.yPos 	= 0;
	
	this.buildHTML = function()
	{		
		var sReturn = "";
		sReturn += '<div id="NetworkLink" class="NetworkLink" style="top:'+this.yPos+'px; left:'+this.xPos+'px;">';		
		sReturn += '<table width="100%" heigth="100%" cellspacing="0" cellpadding="0">';
		sReturn += '<tr><td align="center"><img src="../img/wan.gif" width="60" height="35"></td></tr>';
		sReturn += '<tr><td class="archi_title" nowrap>&nbsp;Network&nbsp;</td></tr>';
		sReturn += '</table>';
		sReturn += '</div>';
		return sReturn;
	}
	
	this.makeCenter = function()
	{
		var diagramObj = document.getElementById('diagramInside');
		var networkLnkObj = document.getElementById('NetworkLink');
		
		networkLnkObj.style.left = diagramObj.clientWidth/2-networkLnkObj.clientWidth/2;
		networkLnkObj.style.top = diagramObj.clientHeight/3-networkLnkObj.clientHeight/2;		
		this.xPos  	= diagramObj.clientWidth/2-networkLnkObj.clientWidth/2;
		this.yPos	= diagramObj.clientHeight/3-networkLnkObj.clientHeight/2;		
	}
}