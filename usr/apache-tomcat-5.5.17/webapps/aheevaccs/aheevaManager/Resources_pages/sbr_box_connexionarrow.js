// JavaScript Document

/****************************************************
 Class ConnexionArrow()
*****************************************************/

function ConnexionArrow()
{
	var uID = 0;
	var xFrom = 0;
	var yFrom = 0;
	var xTo = 0;
	var yTo = 0;
	var color = "";
	var width = "";
	
	this.uID = 0;
	this.xFrom = 0;
	this.yFrom = 0;
	this.xTo = 0;
	this.yTo = 0;
	this.color = "FF0000";
	this.width = 3;
	this.startID = "";
	this.startVUID = 0;
	this.startOn = "";
	this.endID = "";
	this.endVUID = 0;
	this.startType = "";
	this.endType = "";
	
	
	
	
	this.buildHTML = function()
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
			var destDivName = getBoxDivName(this.endType, this.endID);
			var dest_larg = parseInt(document.getElementById(destDivName).clientWidth);
			var startDivName = getBoxDivName(this.startType, this.startID);
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
			
		//alert('drawType='+drawType);
		var ondbclkStr = 'onDblClick="selectThisArrow('+this.uID+')"';
		switch(drawType)
		{
			case 0: //should never happen
			break;
			case 1:
				var colorsArray = new Array("",this.color,this.color,
										"",this.color,"",
										this.color,this.color,"");
				var onDblClickArray = new Array("",ondbclkStr,ondbclkStr,
											"",ondbclkStr,"",
											ondbclkStr,ondbclkStr,"");
			break;
			case 2:
				var colorsArray = new Array(this.color,this.color,"",
										"",this.color,"",
										"",this.color,this.color);
				var onDblClickArray = new Array(ondbclkStr,ondbclkStr,"",
											"",ondbclkStr,"",
											"",ondbclkStr,ondbclkStr);
			break;
			case 3:
				var colorsArray = new Array(this.color,this.color,"","","",
										this.color,"","","","",
										this.color,this.color,this.color,this.color,this.color,
										"","","","",this.color,
										"","","",this.color,this.color);
				var onDblClickArray = new Array(ondbclkStr,ondbclkStr,"","","",
											ondbclkStr,"","","","",
											ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,
											"","","","",ondbclkStr,
											"","","",ondbclkStr,ondbclkStr);
			break;
			case 4:
				var colorsArray = new Array("","","",this.color,this.color,
										"","","","",this.color,
										this.color,this.color,this.color,this.color,this.color,
										this.color,"","","","",
										this.color,this.color,"","","");
				var onDblClickArray = new Array("","","",ondbclkStr,ondbclkStr,
											"","","","",ondbclkStr,
											ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,
											ondbclkStr,"","","","",
											ondbclkStr,ondbclkStr,"","","");
			break;
			case 5:
				var colorsArray = new Array(this.color,this.color,"","","",
										this.color,"","","","",
										this.color,"","",this.color,this.color,
										this.color,"","","",this.color,
										this.color,this.color,this.color,this.color,this.color);
				var onDblClickArray = new Array(ondbclkStr,ondbclkStr,"","","",
											ondbclkStr,"","","","",
											ondbclkStr,"","",ondbclkStr,ondbclkStr,
											ondbclkStr,"","","",ondbclkStr,
											ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr,ondbclkStr);
			break;			
		}
		
		if(drawType == 1 || drawType == 2)
		{			
			sReturn += '<div id="Connexion_ID'+this.uID+'" style="left:'+divLeft+'; top:'+divTop+'; width:'+divWidth+'; height:'+divHeight+';" class="defaultConnection">';
			sReturn += '<table width="'+divWidth+'" height="'+divHeight+'"  cellpadding="0" cellspacing="0">';		
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[0]+'" '+onDblClickArray[0]+'></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[1]+'" '+onDblClickArray[1]+'></td>';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[2]+'" '+onDblClickArray[2]+'></td>';
			sReturn += '</tr>';
			
			sReturn += '<tr height="'+parseInt((divHeight-2))+'">';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[3]+'" '+onDblClickArray[3]+'></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[4]+'" '+onDblClickArray[4]+'></td>';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[5]+'" '+onDblClickArray[5]+'></td>';
			sReturn += '</tr>';
			
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[6]+'" '+onDblClickArray[6]+'></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[7]+'" '+onDblClickArray[7]+'></td>';
			sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[8]+'" '+onDblClickArray[8]+'></td>';
			sReturn += '</tr>';	
			
			sReturn += '</table>';	
			sReturn += '</div>';
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
				
			sReturn += '<div id="Connexion_ID'+this.uID+'" style="left:'+(divLeft-10)+'; top:'+divTop+'; width:'+(divWidth+30)+'; height:'+h+';" class="defaultConnection">';
			sReturn += '<table width="'+(divWidth+30)+'" height="'+h+'"  cellpadding="0" cellspacing="0">';
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[0]+'" '+onDblClickArray[0]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[1]+'" '+onDblClickArray[1]+'></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[2]+'" '+onDblClickArray[2]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[3]+'" '+onDblClickArray[3]+'></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[4]+'" '+onDblClickArray[4]+'></td>';
			sReturn += '</tr>';	
			//sReturn += '<tr height="'+parseInt((divHeight-3))+'">';
			sReturn += '<tr height="'+h1+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[5]+'" '+onDblClickArray[5]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[6]+'" '+onDblClickArray[6]+'></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[7]+'" '+onDblClickArray[7]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[8]+'" '+onDblClickArray[8]+'></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[9]+'" '+onDblClickArray[9]+'></td>';
			sReturn += '</tr>';		
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[10]+'" '+onDblClickArray[10]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[11]+'" '+onDblClickArray[11]+'></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[12]+'" '+onDblClickArray[12]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[13]+'" '+onDblClickArray[13]+'></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[14]+'" '+onDblClickArray[14]+'></td>';
			sReturn += '</tr>';
			//sReturn += '<tr height="'+parseInt((divHeight-3))+'">';
			sReturn += '<tr height="'+h2+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[15]+'" '+onDblClickArray[15]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[16]+'" '+onDblClickArray[16]+'></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[17]+'" '+onDblClickArray[17]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[18]+'" '+onDblClickArray[18]+'></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[19]+'" '+onDblClickArray[19]+'></td>';
			sReturn += '</tr>';			
			sReturn += '<tr height="'+this.width+'">';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[20]+'" '+onDblClickArray[20]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[21]+'" '+onDblClickArray[21]+'></td>';
			sReturn += '<td width="'+parseInt(divWidth-2*this.width-10)+'" bgcolor="'+colorsArray[22]+'" '+onDblClickArray[22]+'></td>';
			sReturn += '<td width="'+(this.width+10)+'" bgcolor="'+colorsArray[23]+'" '+onDblClickArray[23]+'></td>';
			sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[24]+'" '+onDblClickArray[24]+'></td>';
			sReturn += '</tr>';				
			sReturn += '</table>';	
			sReturn += '</div>';		
		}
		/*var upDown = (parseInt(leftY) < parseInt(rightY)) ? true : false;
		
		var ondbclkStr = 'onDblClick="selectThisArrow('+this.uID+')"';
		if(upDown)
		{
			colorsArray = new Array(this.color, this.color, "", "", this.color, "", "", this.color, this.color);
			onDblClickArray = new Array(ondbclkStr, ondbclkStr, "", "", ondbclkStr, "", "", ondbclkStr, ondbclkStr);
			//onDblClick=""
		}
		else
		{
			colorsArray = new Array("", this.color, this.color, "", this.color, "", this.color, this.color, "");
			onDblClickArray = new Array("", ondbclkStr, ondbclkStr, "", ondbclkStr, "", ondbclkStr, ondbclkStr, "");
		}*/
		
		//
		
		/*sReturn += '<div id="Connexion_ID'+this.uID+'" style="left:'+divLeft+'; top:'+divTop+'; width:'+divWidth+'; height:'+divHeight+';" class="defaultConnection">';
		sReturn += '<table width="'+divWidth+'" height="'+divHeight+'"  cellpadding="0" cellspacing="0">';		
		sReturn += '<tr height="'+this.width+'">';
		sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[0]+'" '+onDblClickArray[0]+'></td>';
		sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[1]+'" '+onDblClickArray[1]+'></td>';
		sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[2]+'" '+onDblClickArray[2]+'></td>';
		sReturn += '</tr>';
		
		sReturn += '<tr height="'+parseInt((divHeight-2))+'">';
		sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[3]+'" '+onDblClickArray[3]+'></td>';
		sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[4]+'" '+onDblClickArray[4]+'></td>';
		sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[5]+'" '+onDblClickArray[5]+'></td>';
		sReturn += '</tr>';
		
		sReturn += '<tr height="'+this.width+'">';
		sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[6]+'" '+onDblClickArray[6]+'></td>';
		sReturn += '<td width="'+this.width+'" bgcolor="'+colorsArray[7]+'" '+onDblClickArray[7]+'></td>';
		sReturn += '<td width="'+parseInt((divWidth-this.width)/2)+'" bgcolor="'+colorsArray[8]+'" '+onDblClickArray[8]+'></td>';
		sReturn += '</tr>';		
		
		sReturn += '</table>';	
		sReturn += '</div>';*/
		
		return sReturn;
	}
	
	this.setMembers = function()
	{		
		if(this.startType == "CC")
		{
			for(i = 0; i < vectorCallConditions.length; i++)
			{
				
				if(vectorCallConditions[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorCallConditions[i].xPos.substring(0, vectorCallConditions[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorCallConditions[i].yPos.substring(0, vectorCallConditions[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 			
					if(this.startOn == 'onSucced')
						{
						this.color = "#FF0000";
						vectorCallConditions[i].OnSuccess = this.uID;
						vectorCallConditions[i].OnSuccessVUID = this.endVUID;
						}
					else
						{
						this.color = "#000000";
						vectorCallConditions[i].OnFailed = this.uID;
						vectorCallConditions[i].OnFailedVUID = this.endVUID;
						}
					
					this.width = 3;
					break;
				}
			}
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			this.xFrom += document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth-5;
			if(this.startOn == 'onSucced')
				this.yFrom += 83;
			else
				this.yFrom += 95;
		} else if(this.startType == "PM")
		{			
			for(i = 0; i < vectorAgentPickupMethods.length; i++)
			{
				
				if(vectorAgentPickupMethods[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorAgentPickupMethods[i].xPos.substring(0, vectorAgentPickupMethods[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorAgentPickupMethods[i].yPos.substring(0, vectorAgentPickupMethods[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 			
					/*if(this.startOn == 'onSucced')
						this.color = "#FF0000";
					else*/
					vectorAgentPickupMethods[i].onTimeOut_uID = this.uID;
					vectorAgentPickupMethods[i].OnTimeOutVUID = this.endVUID;
						this.color = "#000000";
					
					this.width = 3;
					break;
				}
			}
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			this.xFrom += document.getElementById('IDPickMethod_'+vectorAgentPickupMethods[i].uID).clientWidth-5;
			//if(this.startOn == 'onTimeOut')
			this.yFrom += 83;
			
		}else if(this.startType == "CE")
		{			
			for(i = 0; i < vectorCallEnding.length; i++)
			{
				if(vectorCallEnding[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorCallEnding[i].xPos.substring(0, vectorCallEnding[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorCallEnding[i].yPos.substring(0, vectorCallEnding[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 							
					
					this.color = "#000000";
					
					this.width = 3;
					break;
				}			
			}
		
		}else if(this.startType == "PI")
		{			
			for(i = 0; i < vectorPriorityIncrement.length; i++)
			{
				if(vectorPriorityIncrement[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorPriorityIncrement[i].xPos.substring(0, vectorPriorityIncrement[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorPriorityIncrement[i].yPos.substring(0, vectorPriorityIncrement[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 								
					
					vectorPriorityIncrement[i].next = this.uID;
					vectorPriorityIncrement[i].nextVUID = this.endVUID;
					//alert('vectorPriorityIncrement[i].next='+vectorPriorityIncrement[i].next);
					
					this.color = "#000000";
					
					this.width = 3;
					break;
				}			
			}
			
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			this.xFrom += document.getElementById('IDPriority_'+vectorPriorityIncrement[i].uID).clientWidth-5;
			//if(this.startOn == 'onTimeOut')
			this.yFrom += 55;		
		} else if(this.startType == "DT")
		{			
			for(i = 0; i < vectorGetDtmf.length; i++)
			{
				if(vectorGetDtmf[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorGetDtmf[i].xPos.substring(0, vectorGetDtmf[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorGetDtmf[i].yPos.substring(0, vectorGetDtmf[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 								
					
					vectorGetDtmf[i].next = this.uID;
					vectorGetDtmf[i].nextVUID = this.endVUID;
					//alert('vectorPriorityIncrement[i].next='+vectorPriorityIncrement[i].next);
					
					this.color = "#000000";
					
					this.width = 3;
					break;
				}			
			}
			
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			this.xFrom += document.getElementById('IDGetDtfm_'+vectorGetDtmf[i].uID).clientWidth-5;
			//if(this.startOn == 'onTimeOut')
			this.yFrom += 55;		
		}else if(this.startType == "PE")
		{			
			for(i = 0; i < vectorPbxExec.length; i++)
			{				
				if(vectorPbxExec[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorPbxExec[i].xPos.substring(0, vectorPbxExec[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorPbxExec[i].yPos.substring(0, vectorPbxExec[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 								
					
					vectorPbxExec[i].next = this.uID;
					vectorPbxExec[i].nextVUID = this.endVUID;
					//alert('vectorPriorityIncrement[i].next='+vectorPriorityIncrement[i].next);
					
					this.color = "#000000";
					
					this.width = 3;
					break;
				}			
			}
			
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			this.xFrom += document.getElementById('IDPbxExec_'+vectorPbxExec[i].uID).clientWidth-5;
			//if(this.startOn == 'onTimeOut')
			this.yFrom += 105;		
		} else if(this.startType == "SQ")
		{			
			
			for(i = 0; i < vectorSqlQueries.length; i++)
			{
				if(vectorSqlQueries[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorSqlQueries[i].xPos.substring(0, vectorSqlQueries[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorSqlQueries[i].yPos.substring(0, vectorSqlQueries[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 								
					
					vectorSqlQueries[i].next = this.uID;
					vectorSqlQueries[i].nextVUID = this.endVUID;
					//alert('vectorPriorityIncrement[i].next='+vectorPriorityIncrement[i].next);
					
					this.color = "#000000";
					
					this.width = 3;
					break;
				}			
			}
			
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			this.xFrom += document.getElementById('IDSqlQuery_'+vectorSqlQueries[i].uID).clientWidth-5;
			
			this.yFrom += 83;		
		} else if(this.startType == "SC") 
		{
			for(i = 0; i < vectorSwitchCases.length; i++)
			{
				
				if(vectorSwitchCases[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorSwitchCases[i].xPos.substring(0, vectorSwitchCases[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorSwitchCases[i].yPos.substring(0, vectorSwitchCases[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos;
					
					
					//onSucced_
					if(this.startOn == 'onDEFAULT')
						{
						this.color = "#FF0000";
						vectorSwitchCases[i].onDefault = this.uID;
						vectorSwitchCases[i].onDefaultVUID = this.endVUID;
						this.color = "#000000";
						}
					else
						{							
						var nb = parseInt( this.startOn.substring("onSucced_".length, this.startOn.length) );						
						this.color = "#000000";
						vectorSwitchCases[i].OnSuccessArray[nb] = this.uID;
						vectorSwitchCases[i].OnSuccessVUIDArray[nb] = this.endVUID;
						this.color = getColor(nb);//"#000000";
						}
					
					//this.color = "#000000";
					this.width = 3;
					//alert('vectorSwitchCases[i]='+vectorSwitchCases[i].uID);
					this.xFrom += document.getElementById('IDSwitchCase_'+vectorSwitchCases[i].uID).clientWidth-5;
					/*alert('this.xFrom='+this.xFrom);
					alert('this.startOn='+this.startOn);*/
					if(this.startOn == 'onDEFAULT')
						this.yFrom += 83 + 13*vectorSwitchCases[i].LinkTypeArray.length;
					else
						this.yFrom += 83 + 13*nb;
					break;
				}
			}
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			
		}else if(this.startType == "CO")
		{			
			for(i = 0; i < vectorCounterBox.length; i++)
			{
				if(vectorCounterBox[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorCounterBox[i].xPos.substring(0, vectorCounterBox[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorCounterBox[i].yPos.substring(0, vectorCounterBox[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 								
					
					vectorCounterBox[i].next = this.uID;
					vectorCounterBox[i].nextVUID = this.endVUID;
					//alert('vectorPriorityIncrement[i].next='+vectorPriorityIncrement[i].next);
					
					this.color = "#000000";
					
					this.width = 3;
					break;
				}			
			}
			
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			this.xFrom += document.getElementById('IDCounterBox_'+vectorCounterBox[i].uID).clientWidth-5;
			//if(this.startOn == 'onTimeOut')
			this.yFrom += 55;
			if(vectorCounterBox[i].isInTrackMode == 1 || vectorCounterBox[i].isInTrackMode == true || vectorCounterBox[i].isInTrackMode == 'true')
				this.yFrom += 13;
		}else if(this.startType == "GS")
		{			
			for(i = 0; i < vectorGetStatisticBox.length; i++)
			{
				
				if(vectorGetStatisticBox[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorGetStatisticBox[i].xPos.substring(0, vectorGetStatisticBox[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorGetStatisticBox[i].yPos.substring(0, vectorGetStatisticBox[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 			
					/*if(this.startOn == 'onSucced')
						this.color = "#FF0000";
					else*/
					vectorGetStatisticBox[i].OnNext = this.uID;
					vectorGetStatisticBox[i].OnNextVUID = this.endVUID;
						this.color = "#000000";
					
					this.width = 3;
					break;
				}
			}
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			this.xFrom += document.getElementById('IDGetStatistic_'+vectorGetStatisticBox[i].uID).clientWidth-5;
			//if(this.startOn == 'onTimeOut')
			this.yFrom += 83;
			
		} else if(this.startType == "CS")
		{			
			for(i = 0; i < vectorCustomServer.length; i++)
			{
				
				if(vectorCustomServer[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorCustomServer[i].xPos.substring(0, vectorCustomServer[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorCustomServer[i].yPos.substring(0, vectorCustomServer[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos;
										
					vectorCustomServer[i].OnNext = this.uID;
					vectorCustomServer[i].OnNextVUID = this.endVUID;
					this.color = "#000000";
					
					this.width = 3;
					break;
				}
			}
			//alert( document.getElementById('IDCallCondition_'+vectorCallConditions[i].uID).clientWidth  );
			this.xFrom += document.getElementById('IDCustomServer_'+vectorCustomServer[i].uID).clientWidth-5;
			//if(this.startOn == 'onTimeOut')
			this.yFrom += 83;			
		}else if(this.startType == "SAD")
		{			
			for(i = 0; i < vectorSetAttachedData.length; i++)
			{				
				if(vectorSetAttachedData[i].uID == this.startID)
				{							
					n_x_pos = parseInt(vectorSetAttachedData[i].xPos.substring(0, vectorSetAttachedData[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorSetAttachedData[i].yPos.substring(0, vectorSetAttachedData[i].yPos.length-2) );					
					this.xFrom = n_x_pos; 
					this.yFrom = n_y_pos; 								
					
					vectorSetAttachedData[i].next = this.uID;
					vectorSetAttachedData[i].nextVUID = this.endVUID;
					
					this.color = "#000000";
					
					this.width = 3;
					break;
				}			
			}
			
			this.xFrom += document.getElementById('IDSetAttachedData_'+vectorSetAttachedData[i].uID).clientWidth-5;
			this.yFrom += 105;		
		}
		
		
		
		
		
		
		//END
		if(this.endType == "CC")
		{
			for(i = 0; i < vectorCallConditions.length; i++)
			{
				if(vectorCallConditions[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorCallConditions[i].xPos.substring(0, vectorCallConditions[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorCallConditions[i].yPos.substring(0, vectorCallConditions[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					//this.color = "#FF0000";
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		}
		else if(this.endType == "PM")
		{
			for(i = 0; i < vectorAgentPickupMethods.length; i++)
			{
				if(vectorAgentPickupMethods[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorAgentPickupMethods[i].xPos.substring(0, vectorAgentPickupMethods[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorAgentPickupMethods[i].yPos.substring(0, vectorAgentPickupMethods[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		}else if(this.endType == "SQ")
		{
			for(i = 0; i < vectorSqlQueries.length; i++)
			{
				
				if(vectorSqlQueries[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorSqlQueries[i].xPos.substring(0, vectorSqlQueries[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorSqlQueries[i].yPos.substring(0, vectorSqlQueries[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		} else if(this.endType == "CE")
		{			
			for(i = 0; i < vectorCallEnding.length; i++)
			{
				if(vectorCallEnding[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorCallEnding[i].xPos.substring(0, vectorCallEnding[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorCallEnding[i].yPos.substring(0, vectorCallEnding[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		} else if(this.endType == "PI")
		{			
			for(i = 0; i < vectorPriorityIncrement.length; i++)
			{
				if(vectorPriorityIncrement[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorPriorityIncrement[i].xPos.substring(0, vectorPriorityIncrement[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorPriorityIncrement[i].yPos.substring(0, vectorPriorityIncrement[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		} else if(this.endType == "DT")
		{			
			for(i = 0; i < vectorGetDtmf.length; i++)
			{
				if(vectorGetDtmf[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorGetDtmf[i].xPos.substring(0, vectorGetDtmf[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorGetDtmf[i].yPos.substring(0, vectorGetDtmf[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		} else if(this.endType == "PE")
		{			
			for(i = 0; i < vectorPbxExec.length; i++)
			{
				if(vectorPbxExec[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorPbxExec[i].xPos.substring(0, vectorPbxExec[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorPbxExec[i].yPos.substring(0, vectorPbxExec[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		} else if(this.endType == "SC")
		{			
			for(i = 0; i < vectorSwitchCases.length; i++)
			{
				if(vectorSwitchCases[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorSwitchCases[i].xPos.substring(0, vectorSwitchCases[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorSwitchCases[i].yPos.substring(0, vectorSwitchCases[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		}else if(this.endType == "CO")
		{			
			for(i = 0; i < vectorCounterBox.length; i++)
			{
				if(vectorCounterBox[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorCounterBox[i].xPos.substring(0, vectorCounterBox[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorCounterBox[i].yPos.substring(0, vectorCounterBox[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		} else if(this.endType == "GS")
		{
			for(i = 0; i < vectorGetStatisticBox.length; i++)
			{
				if(vectorGetStatisticBox[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorGetStatisticBox[i].xPos.substring(0, vectorGetStatisticBox[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorGetStatisticBox[i].yPos.substring(0, vectorGetStatisticBox[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		} else if(this.endType == "CS")
		{
			for(i = 0; i < vectorCustomServer.length; i++)
			{
				if(vectorCustomServer[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorCustomServer[i].xPos.substring(0, vectorCustomServer[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorCustomServer[i].yPos.substring(0, vectorCustomServer[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		} else if(this.endType == "SAD")
		{			
			for(i = 0; i < vectorSetAttachedData.length; i++)
			{
				if(vectorSetAttachedData[i].uID == this.endID)
				{					
					n_x_pos = parseInt(vectorSetAttachedData[i].xPos.substring(0, vectorSetAttachedData[i].xPos.length-2)  );
					n_y_pos = parseInt(vectorSetAttachedData[i].yPos.substring(0, vectorSetAttachedData[i].yPos.length-2) );					
					this.xTo = n_x_pos;
					this.yTo = n_y_pos;
					this.width = 3;
					break;
				}
			}
			//this.xTo += 5;
			this.yTo += 18;
		}
		
	}	
	
	
}


/*****************
LNK Functions
*****************/

function setUpPotentialStartLnk(theID, theOn, theObjType, theVUID)
{
	if(tmpLinkCreationStep == 1)
	{	
		currentArrow = new ConnexionArrow();
		
		nbLnkCreated++;
		currentArrow.uID = nbLnkCreated;			
		currentArrow.startID = theID;
		currentArrow.startVUID = theVUID;
		currentArrow.startOn = theOn;
		currentArrow.startType = theObjType;
		tmpLinkCreationStep = 2;			
		window.status = conx[0];
	}
}

function setUpPotentialEndLnk(theID, theObjType, theVUID)
{
	if(tmpLinkCreationStep == 2)
	{		
		currentArrow.endID = theID;		
		currentArrow.endVUID = theVUID;
		currentArrow.endType = theObjType;
		window.status = "";
		tmpLinkCreationStep = 0;		

		//verify if another link was not going from this box...		
		for(var i = 0 ; i < vectorLinks.length; i++)
		{			
			if(vectorLinks[i].startID == currentArrow.startID && 
			   		vectorLinks[i].startVUID == currentArrow.startVUID && 
					vectorLinks[i].startOn	== currentArrow.startOn && 
					vectorLinks[i].startType == currentArrow.startType)
			{				
				deleteThisArrow(vectorLinks[i].uID);				
				break;
			}
		}
		
		currentArrow.setMembers();		
		vectorLinks.push(currentArrow);
		scriptHasBeenModified = true;

		//Display the whole graph
		addNewDivisionToDiagram( currentArrow.buildHTML() );

		currentArrow = null;
	}
}

function selectThisArrow(theID)
{	
	divName = "Connexion_ID"+theID;	
	if(document.getElementById(divName))
	{
		Obj = document.getElementById(divName);
		Obj.style.border = '1px dashed #000000';
		selectedArrowID = theID;
	}	
}

function unselectThisArrow()
{
	divName = "Connexion_ID"+selectedArrowID;	
	if(document.getElementById(divName))
	{
		Obj = document.getElementById(divName);
		Obj.style.border = '';
		selectedArrowID = "";
	}
}


function addLink()
{

 	window.status = conx[1];
	tmpLinkCreationStep = 1;
}

function deleteArrow()
{
	if(selectedArrowID != "" && selectedArrowID != null)
	{
		var bLinks = new Array();
		for(i = 0; i < vectorLinks.length; i++)
		{
			if(vectorLinks[i].uID != selectedArrowID)
			{
				bLinks.push(vectorLinks[i]);
			}
			else
			{
				reDisplayObj("Connexion_ID"+vectorLinks[i].uID, "");
				
				//find what this arrow was connected to... and reset all infos
				resetBoxInformations( vectorLinks[i] );
				//vectorLinks[i].endVUID
				
				enableSaving();
				selectedArrowID = "";
			}
		}
		vectorLinks = bLinks;
		scriptHasBeenModified = true;		
	}
	else
		alert(conx[2]);
		
}

function deleteThisArrow(arrowID)
{
	var bLinks = new Array();
	for(i = 0; i < vectorLinks.length; i++)
	{
		if(vectorLinks[i].uID != arrowID)
		{
			bLinks.push(vectorLinks[i]);
		}
		else
		{
			reDisplayObj("Connexion_ID"+vectorLinks[i].uID, "");
			
			//find what this arrow was connected to... and reset all infos
			resetBoxInformations( vectorLinks[i] );
			//vectorLinks[i].endVUID
			
			enableSaving();
		}
	}
	vectorLinks = bLinks;
	scriptHasBeenModified = true;
}


function resetBoxInformations( delLink )
{	
	switch( delLink.startType )
	{
		case "CC":
		for(var i = 0; i < vectorCallConditions.length; i++)
		{
			if( vectorCallConditions[i].uID == delLink.startID )
			{
				if( delLink.startOn == 'onSucced' )
				{
					vectorCallConditions[i].OnSuccess = "";
					vectorCallConditions[i].OnSuccessVUID = 0;
				}
				else
				{
					vectorCallConditions[i].OnFailed = "";
					vectorCallConditions[i].OnFailedVUID = 0;
				}
				break;
			}			
		}
		break;
		case "PM":
		for(var i = 0; i < vectorAgentPickupMethods.length; i++)
		{
			if( vectorAgentPickupMethods[i].uID ==  delLink.startID)
			{
				vectorAgentPickupMethods[i].OnTimeOutVUID = 0;
				vectorAgentPickupMethods[i].OnTimeOut_uID = "";
				vectorAgentPickupMethods[i].OnTimeOutGoto = "";
				break;
			}
		}		
		break;
		case "CE":
			//Situation impossible
		break;
		case "CO":
		for(var i = 0; i < vectorCounterBox.length; i++)
		{
			if( vectorCounterBox[i].uID ==  delLink.startID)
			{
				vectorCounterBox[i].nextVUID = 0;
				vectorCounterBox[i].next = "";
				break;
			}
		}		
		break;
		case "DT":
		for(var i = 0; i < vectorGetDtmf.length; i++)
		{
			if( vectorGetDtmf[i].uID ==  delLink.startID)
			{
				vectorGetDtmf[i].nextVUID = 0;
				vectorGetDtmf[i].next = "";
				break;
			}
		}		
		break;
		case "PE":
		for(var i = 0; i < vectorPbxExec.length; i++)
		{
			if( vectorPbxExec[i].uID ==  delLink.startID)
			{
				vectorPbxExec[i].nextVUID = 0;
				vectorPbxExec[i].next = "";				
				break;
			}
		}		
		break;
		case "PI":
		for(var i = 0; i < vectorPriorityIncrement.length; i++)
		{
			if( vectorPriorityIncrement[i].uID ==  delLink.startID)
			{
				vectorPriorityIncrement[i].nextVUID = 0;
				vectorPriorityIncrement[i].next = "";
				break;
			}
		}		
		break;
		case "SQ":
		for(var i = 0; i < vectorSqlQueries.length; i++)
		{
			if( vectorSqlQueries[i].uID ==  delLink.startID)
			{
				vectorSqlQueries[i].nextVUID = 0;
				vectorSqlQueries[i].next = "";
				break;
			}
		}		
		break;
		case "SC":
		for(var i = 0; i < vectorSwitchCases.length; i++)
		{
			if( vectorSwitchCases[i].uID ==  delLink.startID)
			{
				if( delLink.startOn == 'onDEFAULT' )
				{
					vectorSwitchCases[i].onDefault = "";
					vectorSwitchCases[i].onDefaultVUID = 0;
				}
				else
				{
					var nb = parseInt( delLink.startOn.substring("onSucced_".length, delLink.startOn.length) );
					vectorSwitchCases[i].OnSuccessArray[nb] = "";
					vectorSwitchCases[i].OnSuccessVUIDArray[nb] = "";
				}				
				break;
			}
		}		
		break;
		case "GS":
		for(var i = 0; i < vectorGetStatisticBox.length; i++)
		{
			if( vectorGetStatisticBox[i].uID ==  delLink.startID)
			{			
				vectorGetStatisticBox[i].OnNext = 0;
				vectorGetStatisticBox[i].OnNextVUID = "";
				break;
			}
		}		
		break;
		case "CS":
		for(var i = 0; i < vectorCustomServer.length; i++)
		{
			if( vectorCustomServer[i].uID ==  delLink.startID)
			{			
				vectorCustomServer[i].OnNext = 0;
				vectorCustomServer[i].OnNextVUID = "";
				break;
			}
		}		
		break;
		case "SAD":
		for(var i = 0; i < vectorSetAttachedData.length; i++)
		{
			if( vectorSetAttachedData[i].uID ==  delLink.startID)
			{
				vectorSetAttachedData[i].nextVUID = 0;
				vectorSetAttachedData[i].next = "";				
				break;
			}
		}		
		break;
	}
	
	
	
}
