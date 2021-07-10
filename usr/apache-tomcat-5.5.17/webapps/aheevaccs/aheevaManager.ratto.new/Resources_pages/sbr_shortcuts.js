// JavaScript Document

/* 
 * handleKeyDown(): 
 * Parameters:
 * Return value: 
 */
 
/*global vars*/
var emod; /*the event model*/
var altK = false;
var ctrlK = false;
var shiftK = false;
var pressedK = -1;



function onKeyDownH(e)
{
	   switch (emod) 
	   {
	   case "IE4+":
		  e = window.event;
		 
		  altK = (e.altKey) ? true : false;
		  ctrlK = (e.ctrlKey) ? true : false;
		  shiftK = (e.shiftKey) ? true : false;     
		  
		  if ((e.keyCode<16)||(e.keyCode>18)) 
		  {
			 pressedK = e.keyCode;
		  }
	   break;
	   case "NN4":
		  
		  altK = ((e.modifiers & Event.ALT_MASK) == Event.ALT_MASK);
		  ctrlK = ((e.modifiers & Event.CTRL_MASK) == Event.CTRL_MASK);
		  shiftK = ((e.modifiers & Event.SHIFT_MASK) == Event.SHIFT_MASK);      
		  
		  if ((e.which)&&(e.which!=0))
		  {         
			 pressedK = e.which;
		  }
	   break;
	   case "W3C":
		  altK = (e.altKey) ? true : false;
		  ctrlK = (e.ctrlKey) ? true : false;
		  shiftK = (e.shiftKey) ? true : false;
		  
		  if ((e.which<16)||(e.which>18))
		  {
			 pressedK = e.which; 
		  }
	   break; 
	   }
   
   
   	//Traiter l'assemblage de touches...
	keyPressedDoAction(pressedK, ctrlK, altK, shiftK);
   
   	altK = false;
	ctrlK = false;
	shiftK = false; 
	pressedK = -1;
   
    return true;
}

function onloadH(e)
{	
   /*get the event model*/
   emod = (e) ? (e.eventPhase) ? "W3C" : "NN4" : (window.event) ? "IE4+" : "unknown";
   
   if (emod == "NN4") 
   {
      document.captureEvents(Event.KEYDOWN);
	}

	
   document.onkeydown = onKeyDownH;
   return false;
}

function keyPressedDoAction(key_p, ctrl_p, alt_p, shift_p)
{
	//alert('key_p='+key_p+'\nctrl_p='+ctrl_p+'\nalt_p='+alt_p+'\nshift_p='+shift_p);
	//window.status = 'KeyPressed='+key_p;
	switch(key_p)
	{
		case 9:	 //Tab
				
		break;
		
		case 27: //ESCAPE			
			unselectThisArrow();  //Deselect possible arrow			
			fit();				  //Unzoom all			
		break;
		
						
		case 65: //A
						
		break;
		
		case 67: //C
					
		break;	
		
		case 68: //D
			if(ctrl_p && shift_p)
			{
				DEBUG = !DEBUG;
				refreshDiagramInside();
			}					
		break;
		
		case 69: //E
			if(ctrl_p && shift_p)
			{
				eraseDiagram();
			}
			
		break;
		
		case 72: //H
			if(ctrl_p && shift_p)
			{
				popupHelp();
			}
			
		break;
				
		case 73: //I		
			
		break;
					
		case 78: //N
			if(shift_p && ctrl_p)
			{
				menu_new_script();
			}
		break;
		
		case 79: //O
			if(shift_p && ctrl_p)
			{
				menu_new_open();
			}
		break;
		case 80: //P
			if(shift_p && ctrl_p)
			{
				showCallPropsManager();
			}		
		break;
		
		case 81: //Q
				
		break;
		
		case 82: //R
			if(ctrl_p) //Ctrl+R
			{
				refreshDiagramInside();
			}		
		break;
		
		
		case 83: //S
			if(shift_p && ctrl_p)
			{
				menu_new_save_as();
			}
			else if(ctrl_p) //Ctrl+S
			{
				saveThisScript();
			}		
		break;
		
		case 84: //T
			
		break;
		
		case 86: //V
			if(shift_p && ctrl_p)
			{
				menu_validateWholeSchema();
			}
		break;
		
		case 88: //X
			if(shift_p && ctrl_p)
			{
				menu_new_exit();
			}
		break;
		
		
		
		case 107: // +
			if(ctrl_p) //Ctrl++
			{
				zoomIn();
			}		
		break;
		
		case 109: // -
			if(ctrl_p) //Ctrl+-
			{
				zoomOut();
			}		
		break;	
		
		default:
			
		break;
		
	}
	
}