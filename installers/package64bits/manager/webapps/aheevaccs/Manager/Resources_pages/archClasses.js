// JavaScript Document

//
function serverCti(id)
{
	this.unid 			= id;
	this.serverimg		= "../img/cti_server.gif";
	this.xpos 			= 0;
	this.ypos			= 0;
	this.width			= 0;
	this.heigth			= 0;	
	this.divid			= 'serverCti_'+(id != null ? id : '');
	this.divPoolid	 	= null;
	
	this.linksStartingFrom 	= new Array();
	this.linksEndingTo		= new Array();
	
	
	this.draw = function()
	{
		var sReturn = '';		
		sReturn += ''+			
			'<table>'+
			'<tr>'+
				'<td align="center">'+
					'<img src="' + this.serverimg + '" width="' + this.width + '" height="' + this.heigth + '">'+
				'</td>'+
			'</tr>'+
			'<tr>'+
				'<td class="smallText" nowrap="nowrap" align="center">'+
					'<b>Cti Server</b>'+
				'</td>'+
			'</tr>'+
			'</table>';
			//'</div>';		
		return sReturn;
	}
}

function networkObj(id)
{
	this.unid 			= id;
	this.img			= "../img/wan.gif";
	this.xpos 			= 0;
	this.ypos			= 0;
	this.width			= 0;
	this.heigth			= 0;	
	this.divid			= 'networkObj_'+(id != null ? id : '');
	this.divPoolid	 	= null;
	
	this.linksStartingFrom 	= new Array();
	this.linksEndingTo		= new Array();
	
	
	this.draw = function()
	{
		var sReturn = '';		
		sReturn += ''+
			'<table>'+
			'<tr><td align="center">'+	
			'<img src="' + this.img + '" width="' + this.width + '" height="' + this.heigth + '">'+
			'</td></tr>'+
			'<tr><td class="smallText" nowrap="nowrap" align="center">'+	
				'<b>Public Network</b>';
			'</td></tr>'+			
			'</table>'+
			'';
		return sReturn;			
	}
}


//class siteObj
function siteObj(id)
{
	this.unid 		= id;
	this.DBID 		= "";
	this.SITE_NAME 	= "";	
	this.xpos 		= 0;
	this.ypos 		= 0;
	this.width 		= 0;
	this.heigth 	= 0;
	this.color		= "#FF0000";
	this.divPoolid	 = null;
	
	this.linksStartingFrom 	= new Array();
	this.linksEndingTo		= new Array();
	
	
	this.draw = function()
	{		
		var sreturn = '';
		sreturn = 
		'<table style="width:'+this.width+'; height:'+this.heigth+'; left:'+this.xpos+'; top:'+this.ypos+'px; border: 1px '+this.color+' dotted ">'+
		/*
		'<tr style="height:1px">'+
		'<td style="cursor:nw-resize" style="width:1px"></td>'+
		'<td colspan="2" style="cursor:n-resize"></td>'+
		'<td style="cursor:ne-resize" style="width:1px"></td>'+
		'</tr>'+
		*/
		''+
		''+
		''+
		'<tr style=" height:10px">'+
		//'<td style="cursor:e-resize" style="width:1px"></td>'+
		'<td class="smallText" style="vertical-align:top; color:'+this.color+'; font-weight:bold;">'+this.SITE_NAME+'</td>'+
		
		//'<td style="cursor:e-resize" style="width:1px"></td>'+
		'</tr>'+
		''+
		'<tr>'+
		'<td>&nbsp;</td>'+
		''+
		'</tr>'+
		''+
		''+
		''+
		''+
		''+	
		/*
		'<tr style="height:1px">'+
		'<td style="cursor:sw-resize" style="width:1px"></td>'+
		'<td colspan="2" style="cursor:n-resize"></td>'+
		'<td style="cursor:se-resize" style="width:1px"></td>'+
		'</tr>'+
		*/
		'</table>';		
		return sreturn;
	}
}


//
function pbxServerObj( id )
{
	this.unid 							= id;
	this.DBID							= "";
	this.SWITCH_NAME					= "";
	this.SWITCH_PASSWORD				= "";
	this.HOST							= "";
	this.PORT							= "";
	this.EXTERN_HOST					= "";
	this.EXTERN_PORT					= "";
	this.LOAD_BALANCE_FOR_AGENTS		= "";
	this.LOAD_BALANCE_FOR_OUTBOUND		= "";
	this.SITE_DBID						= "";
	this.SWITCH_TYPE					= ""; //if ever we have another type of switch, change this value and get it from database
	this.NUMBER_OF_LINES				= "";
	
	this.xpos 							= 0;
	this.ypos 							= 0;
	this.width 							= 0;
	this.heigth 						= 0;
	this.color							= "#FF0000";
	this.divPoolid	 					= null;
	this.status 						= 'unknow';
	this.connectedAgents 				= 0;
	this.inboundDials					= 0;
	this.outboundDials 					= 0;	
	this.lastStatusTime 				= 0;
	
	this.linksStartingFrom 	= new Array();
	this.linksEndingTo		= new Array();
	
	this.draw = function()
	{
		var sReturn = ''+
		'<table border="0" cellpadding="0" cellspacing="0">'+
		'<tr>'+
		'<td align="center">'+
		'<img src="../img/astpbx_server.gif" width="40" height="50">'+
		'<img id="switchstatus_image_'+this.SWITCH_NAME+'" src="../img/hum.gif" style="position:relative; top:-30px; left:-10px;"'+
		' >'+
		'</td>'+
		'</tr>'+		
		'<tr>'+
		'<td align="center" class="smallText">'+
			this.SWITCH_NAME
		'</td>'+
		'</tr>'+
		'</table>';
		
		return sReturn;
	}
	
}

//
function encServerObj( id )
{
	this.unid 			= id;
	this.DBID			= "";
	this.SERVERNAME		= "";
	this.IPADDRESS		= "";
	this.PORT			= "";
	this.SITE_DBID		= "";
	this.SERVLETURL		= "";
	this.PROTOCOL		= "";
	this.EXT_IPADDRESS	= "";
	this.EXT_PORT		= "";
	
	this.xpos 				= 0;
	this.ypos 				= 0;
	this.width 				= 0;
	this.heigth 			= 0;
	this.color				= "#FF0000";
	this.divPoolid	 		= null;
	this.status 			= 'unknow';
	this.aes_submitted		= 0;
	this.aes_encrypted		= 0;
	this.aes_errors			= 0;
	this.des3_submitted		= 0;
	this.des3_encrypted		= 0;
	this.des2_errors		= 0;
	this.myaes_submitted	= 0;
	this.myaes_encrypted	= 0;
	this.myaes_errors		= 0;
	
	this.lastStatusTime 	= 0;
	
	this.linksStartingFrom 	= new Array();
	this.linksEndingTo		= new Array();
	
	this.draw = function()
	{
		var sReturn = ''+
		'<table border="0" cellpadding="0" cellspacing="0">'+
		'<tr>'+
		'<td align="center">'+
		'<img src="../img/ecryption_server.gif" width="45" height="50">'+
		'<!--<img id="encstatus_image_'+this.DBID+'" src="../img/hum.gif" style="position:relative; top:-30px; left:-10px;"'+
		' >-->'+
		'</td>'+
		'</tr>'+		
		'<tr>'+
		'<td align="center" class="smallText">'+
			this.SERVERNAME
		'</td>'+
		'</tr>'+
		'</table>';
		
		return sReturn;
	}
	
}


function recordingServer(unid)
{
	this.unid 					= unid;
	this.DBID 					= "";
	this.SERVER_NAME			= "";
	this.SERVER_PASSWORD 		= "";
	this.HOST 					= "";
	this.PORT 					= "";
	this.SEC_PORT 				= "";
	this.EXTERN_HOST 			= "";
	this.EXTERN_PORT 			= "";
	this.EXTERN_SEC_PORT 		= "";
	this.SALES_PATH 			= "";
	this.NOSALES_PATH 			= "";
	this.SITE_DBID 				= "";
	this.REC_SYNC_TIME 			= "";
	this.MASTER_SERVER 			= "";
	this.LOAD_BALANCE_FOR_AGENTS= "";
	this.ALLOW_REC_SYNC 		= "";
	this.MAX_DISK_TO_USE		= "";
	
	this.xpos 					= 0;
	this.ypos 					= 0;
	this.width 					= 0;
	this.heigth 				= 0;
	this.color					= "#FF0000";
	this.divPoolid	 			= null;
	this.status 				= 'unknow';
	this.lastStatusTime 		= 0;
	
	this.linksStartingFrom 	= new Array();
	this.linksEndingTo		= new Array();
	
	this.draw = function()
	{		
		var sReturn = ''+
		'<table border="0" cellpadding="0" cellspacing="0">'+
		'<tr>'+
		'<td align="center">'+
		'<img src="../img/recording_server.gif" width="45" height="50">'+
		'<img id="recordserverstatus_image_'+this.SERVER_NAME+'" src="../img/hum.gif" style="position:relative; top:-30px; left:-10px;"'+
		' >'+
		'</td>'+
		'</tr>'+
		'<tr>'+
		'<td align="center" class="smallText">'+
		this.SERVER_NAME+
		'</td>'+
		'</tr>'+
		'</table>';
		
		
		return sReturn;
	}
}


//

function divPool()
{
	this.id 	= -1;
	this.inuse 	= false;
	
	this.getHTML = function()
	{
		var str = '';
		str = '<div id="'+this.getdivid()+'" onmouseover="curdivpoolmover=this.id;" onmouseout="curdivpoolmover=\'diagram\';" style="position:absolute;left:0px;top:0px;visibility:hidden;"></div>';
		return str;
	}
	
	this.getdivid = function()
	{
		return (this.id == -1 ? null : 'DivPool'+this.id);		
	}
}


function archLink(unid)
{
	this.uid = unid;
	
	this.xFrom 			= 0;
	this.yFrom  		= 0;
	this.xTo 			= 0;
	this.yTo	  		= 0;	
	this.xpos 			= 0;
	this.ypos 			= 0;
	this.width 			= 0;
	this.height 		= 0;
	this.color			= "#FF0000";
	this.divPoolid	 	= null;
	this.stroke			= 2;
	
	
	this.recalculate = function()
	{
		this.width = Math.abs(this.xTo - this.yTo);
		this.height = Math.abs(this.yFrom - this.xFrom);
	}
	
	this.draw = function()
	{
		this.recalculate();
		var linkType = null;
		var upX 	= 0;
		var upY		= 0;
		var dwX		= 0;
		var dwY		= 0;
		
		if( this.yTo > this.yFrom )
		{
			upX = 	this.xFrom;
			upY = 	this.yFrom;
			dwX = 	this.xTo;
			dwY = 	this.yTo;
		}
		else
		{
			upX = 	this.xTo;
			upY = 	this.yYo;
			upX = 	this.xFrom;
			upY = 	this.yFrom;
		}
		
		if( upX < dwX )
			linkType = 'down-left-down';
		else
			linkType = 'down-right-down';
		
		var sReturn = '';
		
		var lwidth 	= parseInt( (this.width-3*this.stroke)/2 )
		var lheight = parseInt( (this.height-3*this.stroke)/2 );
		var bg		= 'bgcolor="'+this.color+'"';
		var nobg	= '';
		if(linkType == 'down-left-down')
		{
			sReturn =
			'<table border="0" cellpadding="0" cellspacing="0" width="'+this.width+'" height="'+this.height+'">'+
			'<tr height="'+this.stroke+'">'+
				'<td height="'+this.stroke+'" width="'+this.stroke+'" '+bg+'></td><td height="'+this.stroke+'" width="'+lwidth+'" '+nobg+'></td><td height="'+this.stroke+'" width="'+this.stroke+'" '+nobg+'></td>'+
			'</tr>'+
			'<tr height="'+lheight+'">'+
				'<td height="'+lheight+'" width="'+this.stroke+'" '+bg+'></td><td height="'+lheight+'" width="'+lwidth+'" '+nobg+'></td><td height="'+lheight+'" width="'+this.stroke+'" '+nobg+'></td>'+
			'</tr>'+
			'<tr height="'+this.stroke+'">'+
				'<td height="'+this.stroke+'" width="'+this.stroke+'" '+bg+'></td><td height="'+this.stroke+'" width="'+lwidth+'" '+bg+'></td><td height="'+this.stroke+'" width="'+this.stroke+'" '+bg+'></td>'+
			'</tr>'+
			'<tr height="'+lheight+'">'+
				'<td height="'+lheight+'" width="'+this.stroke+'" '+nobg+'></td><td height="'+lheight+'" width="'+lwidth+'" '+nobg+'></td><td height="'+lheight+'" width="'+this.stroke+'" '+bg+'></td>'+
			'</tr>'+
			'<tr height="'+this.stroke+'">'+
				'<td height="'+this.stroke+'" width="'+this.stroke+'" '+nobg+'></td><td height="'+this.stroke+'" width="'+lwidth+'" '+nobg+'></td><td height="'+this.stroke+'" width="'+this.stroke+'" '+bg+'></td>'+
			'</tr>'+
			'</table>';
		} else if(linkType == 'down-right-down')
		{
			sReturn =
			'<table border="0" cellpadding="0" cellspacing="0" width="'+this.width+'" height="'+this.height+'">'+
			'<tr height="'+this.stroke+'">'+
				'<td height="'+this.stroke+'" width="'+this.stroke+'" '+nobg+'></td><td height="'+this.stroke+'" width="'+lwidth+'" '+nobg+'></td><td height="'+this.stroke+'" width="'+this.stroke+'" '+bg+'></td>'+
			'</tr>'+
			'<tr height="'+lheight+'">'+
				'<td height="'+lheight+'" width="'+this.stroke+'" '+nobg+'></td><td height="'+lheight+'" width="'+lwidth+'" '+nobg+'></td><td height="'+lheight+'" width="'+this.stroke+'" '+bg+'></td>'+
			'</tr>'+
			'<tr height="'+this.stroke+'">'+
				'<td height="'+this.stroke+'" width="'+this.stroke+'" '+bg+'></td><td height="'+this.stroke+'" width="'+lwidth+'" '+bg+'></td><td height="'+this.stroke+'" width="'+this.stroke+'" '+bg+'></td>'+
			'</tr>'+
			'<tr height="'+lheight+'">'+
				'<td height="'+lheight+'" width="'+this.stroke+'" '+bg+'></td><td height="'+lheight+'" width="'+lwidth+'" '+nobg+'></td><td height="'+lheight+'" width="'+this.stroke+'" '+nobg+'></td>'+
			'</tr>'+
			'<tr height="'+this.stroke+'">'+
				'<td height="'+this.stroke+'" width="'+this.stroke+'" '+bg+'></td><td height="'+this.stroke+'" width="'+lwidth+'" '+nobg+'></td><td height="'+this.stroke+'" width="'+this.stroke+'" '+nobg+'></td>'+
			'</tr>'+
			'</table>';
		}
		
		
		return sReturn;
	}
}

/*
function archLink(unid)
{
	this.uid 	= unid;
	this.uname  = '';
	this.xFrom 	= 0;
	this.yFrom 	= 0;
	this.xTo	= 0;
	this.yTo	= 0;	
	this.fromDivPool = '';
	this.toDivPool	 = '';
	this.jsGraphObj  = null;
	this.divPoolid 	 = null;
	this.color		 = "#00FF00";
	this.width 		 = 3;
	
	
	this.draw = function()
	{
		var sReturn = "";
		this.xFrom	= parseInt(this.xFrom);
		this.xTo	= parseInt(this.xTo);
		this.yFrom	= parseInt(this.yFrom);
		this.yTo	= parseInt(this.yTo);
		
		
		var divLeft = Math.min(this.xFrom, this.xTo);
		var divTop = Math.min(this.yFrom, this.yTo);		
		var divWidth = Math.abs(this.xTo-this.xFrom);
		var divHeight = Math.abs(this.yTo-this.yFrom);
		
		
		if(this.xFrom < this.xTo)
		{
			leftX = this.xFrom;
			leftY = this.yFrom;
			rightX = this.xTo;
			rightY = this.yTo;
		}
		else
		{
			rightX = this.xFrom;
			rightY = this.yFrom;
			leftX = this.xTo;
			leftY = this.yTo;
		}
		
		var drawType = 0;
		if(this.xFrom < this.xTo)
		{
			//alert('this.yFrom='+this.yFrom+'\nthis.yTo='+this.yTo);
			if(this.yFrom > this.yTo)
				drawType = 1;
			else
				drawType = 2;
			//alert('drawType='+drawType);
		}
		else
		{
			var destDivName = this.toDivPool;
			var dest_larg = parseInt(document.getElementById(destDivName).clientWidth);
			var startDivName = this.fromDivPool;
			var start_larg = parseInt(document.getElementById(startDivName).clientWidth);
			if( (this.xFrom - dest_larg) < (this.xTo + start_larg) )
			{
				if(this.yFrom > this.yTo)
					drawType = 3;
				else
					drawType = 4;
			}
			else
			{
				if(this.yFrom < this.yTo)
					drawType = 4;
				else
					drawType = 5;				
			}
		}
		
		
		switch(drawType)
		{
			case 0: //should never happen
			break;
			case 1:
				var colorsArray = new Array("",this.color,this.color,
										"",this.color,"",
										this.color,this.color,"");
//				var onDblClickArray = new Array("",ondbclkStr,ondbclkStr,
//											"",ondbclkStr,"",
//											ondbclkStr,ondbclkStr,"");
			break;
			case 2:
				var colorsArray = new Array(this.color,this.color,"",
										"",this.color,"",
										"",this.color,this.color);
//				var onDblClickArray = new Array(ondbclkStr,ondbclkStr,"",
//											"",ondbclkStr,"",
//											"",ondbclkStr,ondbclkStr);
			break;
			case 3:
				var colorsArray = new Array(this.color,this.color,"","","",
										this.color,"","","","",
										this.color,this.color,this.color,this.color,this.color,
										"","","","",this.color,
										"","","",this.color,this.color);
//				var onDblClickArray = new Array(ondbclkStr,ondbclkStr,"","","",
//											ondbclkStr,"","","","",
//											ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,
//											"","","","",ondbclkStr,
//											"","","",ondbclkStr,ondbclkStr);
			break;
			case 4:
				var colorsArray = new Array("","","",this.color,this.color,
										"","","","",this.color,
										this.color,this.color,this.color,this.color,this.color,
										this.color,"","","","",
										this.color,this.color,"","","");
//				var onDblClickArray = new Array("","","",ondbclkStr,ondbclkStr,
//											"","","","",ondbclkStr,
//											ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,
//											ondbclkStr,"","","","",
//											ondbclkStr,ondbclkStr,"","","");
			break;
			case 5:
				var colorsArray = new Array(this.color,this.color,"","","",
										this.color,"","","","",
										this.color,"","",this.color,this.color,
										this.color,"","","",this.color,
										this.color,this.color,this.color,this.color,this.color);
//				var onDblClickArray = new Array(ondbclkStr,ondbclkStr,"","","",
//											ondbclkStr,"","","","",
//											ondbclkStr,"","",ondbclkStr,ondbclkStr,
//											ondbclkStr,"","","",ondbclkStr,
//											ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr);
			break;			
		}
		
		
		if(drawType == 1 || drawType == 2)
		{
			//sReturn += '<div id="Connexion_ID'+this.uID+'" style="left:'+divLeft+'; top:'+divTop+'; width:'+divWidth+'; height:'+divHeight+';" class="defaultConnection">';
			sReturn += '<table width="'+divWidth+'" height="'+divHeight+'"  cellpadding="0" cellspacing="0">';		
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[0]+'"></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[1]+'"></td>';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[2]+'"></td>';
			sReturn += '</tr>';
			
			sReturn += '<tr height="'+parseInt((divHeight-2))+'">';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[3]+'" ></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[4]+'"></td>';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[5]+'"></td>';
			sReturn += '</tr>';
			
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[6]+'"></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[7]+'"></td>';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[8]+'"></td>';
			sReturn += '</tr>';	
			
			sReturn += '</table>';	
			//sReturn += '</div>';
		}
		else if(drawType == 3 || drawType == 4 || drawType == 5)
		{
			var h;
			if(drawType == 3 || drawType == 4)
			{
				h = divHeight;
				h1 = ((h-3*this.width)/2);
				h2 = ((h-3*this.width)/2);
			}
			else
			{
				var startTop = parseInt(document.getElementById(startDivName).style.top.substring(0, document.getElementById(startDivName).style.top.length-2));
				var endTop = parseInt(document.getElementById(destDivName).style.top.substring(0, document.getElementById(destDivName).style.top.length-2));
				var startEndY = (startTop + document.getElementById(startDivName).clientHeight);
				var endEndY  = (endTop + document.getElementById(destDivName).clientHeight);
				var realEnd = Math.max(startEndY, endEndY);
				//h =  Math.abs(this.yTo-document.getElementByID(startDivName).top)  + 20;
				h = Math.abs( realEnd - this.yTo ) + 10;
				h1 = (divHeight-this.width);
				h2 = ""; //the second one will ajdjust himself..
			}
				
			//sReturn += '<div id="Connexion_ID'+this.uID+'" style="left:'+(divLeft-10)+'; top:'+divTop+'; width:'+(divWidth+30)+'; height:'+h+';" class="defaultConnection">';
			sReturn += '<table width="'+(divWidth+30)+'" height="'+h+'"  cellpadding="0" cellspacing="0">';
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[0]+'"></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[1]+'"></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[2]+'" ></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[3]+'"></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[4]+'"></td>';
			sReturn += '</tr>';	
			//sReturn += '<tr height="'+parseInt((divHeight-3))+'">';
			sReturn += '<tr height="'+h1+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[5]+'"></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[6]+'"></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[7]+'"></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[8]+'"></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[9]+'"></td>';
			sReturn += '</tr>';		
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[10]+'"></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[11]+'"></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[12]+'"></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[13]+'"></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[14]+'"></td>';
			sReturn += '</tr>';
			//sReturn += '<tr height="'+parseInt((divHeight-3))+'">';
			sReturn += '<tr height="'+h2+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[15]+'"></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[16]+'"></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[17]+'"></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[18]+'"></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[19]+'"></td>';
			sReturn += '</tr>';			
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[20]+'"></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[21]+'"></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[22]+'"></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[23]+'"></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[24]+'"></td>';
			sReturn += '</tr>';				
			sReturn += '</table>';	
			//sReturn += '</div>';		
		}
		
		
		return sReturn;
	
	}	
}
*/