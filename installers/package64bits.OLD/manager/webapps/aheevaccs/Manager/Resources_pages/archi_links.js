// JavaScript Document


function Link()
{
	this.linkUid = 0;
	this.switch_start_Uid = "";	
	this.startX = "";
	this.startY = "";
	this.endX = "";
	this.endY = "";
	this.color = "#000000";
	this.width = 3;
	
	this.buildHTML = function()
	{
		var sReturn = "";
		var vertical = "RIGHT";
		var horizontal = "UP";
		
		if(parseInt(this.startY) < parseInt(this.endY))		
			horizontal = "DOWN";
		if(parseInt(this.startX) < parseInt(this.endX))
			vertical = "LEFT";
			
		var resteW = Math.abs(this.endX-this.startX)-this.width;
		var resteH = Math.abs(this.endY-this.startY)-this.width;
		if(horizontal == "UP")
		{
			if(vertical == "LEFT")
			{
				var colorsArray = new Array(this.color, this.color, this.color, "");
				var widths 		= new Array(this.width, resteW, this.width, resteW);
				var heigths		= new Array(this.width, this.width, resteH, resteH);
			}
			else
			{
				var colorsArray = new Array(this.color, this.color, "", this.color);
				var widths 		= new Array(resteW, this.width, resteW, this.width);
				var heigths		= new Array(this.width, this.width, resteH, resteH);				
			}
		}
		else
		{
			if(vertical == "LEFT")
			{
				var colorsArray = new Array(this.color, "", this.color, this.color);
				var widths 		= new Array(this.width, resteW, this.width, resteW);
				var heigths		= new Array(resteH, resteH, this.width, this.width);
			}
			else
			{
				var colorsArray = new Array(this.color, this.color, this.color, "");
				var widths 		= new Array(this.width, resteW, this.width, resteW);
				var heigths		= new Array(this.width, this.width, resteH, resteH);
				
			}
		}
		
		var xPos = Math.min(parseInt(this.startX), parseInt(this.endX));
		var yPos = Math.min(parseInt(this.startY), parseInt(this.endY));
		var divWidth = Math.abs(parseInt(this.endX) - parseInt(this.startX));
		var divheight = Math.abs(parseInt(this.endY) - parseInt(this.startY));
					
		sReturn += '<div id="Link_'+this.linkUid+'" class="archi_link" style="top:'+yPos+'; left:'+xPos+'; width:'+divWidth+'; height:'+divheight+';" >';
		sReturn += '<table width="100%" height="100%" cellpadding="0" cellspacing="0">';
		sReturn += '<tr>';
		sReturn += '<td bgcolor="'+colorsArray[0]+'" width="'+widths[0]+'" height="'+heigths[0]+'"></td>';
		sReturn += '<td bgcolor="'+colorsArray[1]+'" width="'+widths[1]+'" height="'+heigths[1]+'"></td>';
		sReturn += '</tr>';
		sReturn += '<tr>';
		sReturn += '<td bgcolor="'+colorsArray[2]+'" width="'+widths[2]+'" height="'+heigths[2]+'"></td>';
		sReturn += '<td bgcolor="'+colorsArray[3]+'" width="'+widths[3]+'" height="'+heigths[3]+'"></td>';
		sReturn += '</tr>';		
		sReturn += '</table>';
		sReturn += '</div>';	
		
		return sReturn;
	}
	
	this.setMembers = function()
	{
		var networkLnkObj = document.getElementById('NetworkLink');
		var networkLnkObjX = parseInt(networkLnkObj.style.left.substring(0, networkLnkObj.style.left.length-2));
		var networkLnkObjY = parseInt(networkLnkObj.style.top.substring(0, networkLnkObj.style.top.length-2));
		this.endX = networkLnkObjX + networkLnkObj.clientWidth/2;	
		this.endY = networkLnkObjY + networkLnkObj.clientHeight/2;
		
		for(var i = 0; i < SwitchList.length; i++)
		{
			if(SwitchList[i].asteriskUid == this.switch_start_Uid)
			{
				var switchObj = document.getElementById('ArchiPBX_'+SwitchList[i].asteriskUid);				
				var switchObjX = parseInt(switchObj.style.left.substring(0, switchObj.style.left.length-2));
				var switchObjY = parseInt(switchObj.style.top.substring(0, switchObj.style.top.length-2));
				this.startX = switchObjX + switchObj.clientWidth/2;	
				this.startY = switchObjY + switchObj.clientHeight/2;
				break;
			}			
		}	
	}
}