var current_div_index = ""; 	//contains the index of the current page --> from ListPagesDiv array
var current_div_obj_index = ""; //contains the index of the current object on the page
var new_cur_index = null;
var listPages = new Array();	//contains the list of pages of a pop up
var rollover = new Array() //contains rollover images
rollover[0]="../../img/popup/up.gif";
rollover[1]="../../img/popup/up_a.gif";
rollover[2]="../../img/popup/down.gif";
rollover[3]="../../img/popup/down_a.gif";
rollover[4]="../../img/popup/add_page.gif";
rollover[5]="../../img/popup/add_page_a.gif";
rollover[6]="../../img/popup/delete.gif";
rollover[7]="../../img/popup/delete_a.gif";
rollover[8]="../../img/popup/helpbut01.gif";
rollover[9]="../../img/popup/helpbut02.gif";

///editable fields bloc
var page_div_width= 1024; //width of the page div
var page_div_height= 1500;//height of the page div
var start_div_left = 145; //left of the drawing canvases
var start_div_top = 45;   //top of the drawing canvases
var selection_width = 1;  //the width of the selection rectangle on an item

var pop_width 		= "700px"; 		//width of the popup window
var pop_height 		= "500px"; 
var pop_bgcolor		= "#FFFFFF";	//default value for the background color
var req_bgcolor		="#FFFF99"; 		//default value for the required field
var gridCol			="pagedivbg2";

var test_removetemp = 1;  

//mandatory fields for outbound
var arr_outbound = new Array();
arr_outbound[0] = "RESULT_CODE";
arr_outbound[1] = "PHONE_NUMBER";
arr_outbound[2] = "CALL_RESULT";
arr_outbound[3] = "DIAL_SCHED_TIME";
//end mandatory fields for outbound

///end editable fields bloc

///make popups draggable
document.onmousemove = mouseMovePop; 
document.onmouseup   = mouseUpPop;
//end makepopupsdraggable


//add page   
function addPage(page_id,page_name,parent_index){	
	var obj 	= new Object();
    obj.page_id  	= page_id;
    obj.page_name 	= page_name;
    
    var ret_index =0;
    //create div for the page
    obj.page_divbg	= document.createElement('div');
  	obj.page_divbg.style.display= "none";
	obj.page_divbg.style.position = "absolute";
	obj.page_divbg.style.width = page_div_width;
	obj.page_divbg.style.height = page_div_height;
	obj.page_divbg.style.background= getPopBgColor() ;
	obj.page_divbg.style.top   = "0";
	obj.page_divbg.style.left   = "0";
	document.getElementById("pagesDiv").appendChild(obj.page_divbg);
    
    
    obj.page_div	= document.createElement('div');
  	obj.page_div.style.display= "none";
	obj.page_div.style.position = "absolute";
	obj.page_div.style.width = page_div_width;
	obj.page_div.style.height = page_div_height;
	obj.page_div.className= getGridColor();
	document.getElementById("pagesDiv").appendChild(obj.page_div);
	 var hiddiv = document.createElement('div');
	 
	 obj.page_div.appendChild(hiddiv);
	
	obj.page_div.style.top   = "0";
	obj.page_div.style.left   = "0";
	obj.listObj = new Array();
	
	obj.page_div.onmousemove = mouseMove;
	obj.page_div.onmouseup   = mouseUp;
	
	if (parent_index == -2){ //
		listPages[listPages.length] = obj;
		ret_index = listPages.length -1;
	}
	else if (parent_index ==-1) {
			listPages[listPages.length] = obj;		
			ret_index = listPages.length -1;
	}
	else
	{
		var listPages_temp = new Array();
		
		for (var i=0 ; i < listPages.length;i++)
		{
			 
			 if (listPages_temp.length==0)
			 {
			 	listPages_temp[0] = listPages[i];
			 }
			 else
			 {
			 	listPages_temp[listPages_temp.length] = listPages[i];
			 }
			 if (i== parent_index) {listPages_temp[listPages_temp.length] = obj;ret_index = listPages.length -1;}
		}
		listPages = listPages_temp;
		
	}
	
	obj.rect = new jsGraphics(obj.page_div);
  	
	drawRectCnv(obj.rect);
	hiddiv.id='hiddiv'+ret_index;
	return ret_index;
	
	
}

//for drawing rect in a page
function drawRectCnv(objt) {
  	objt.clear();
  	objt.setColor("red");
	objt.setStroke(2); 
	objt.setStroke(Stroke.DOTTED);
  	objt.drawRect(0, 0, parseInt(popWidth), parseInt(popHeight));
  	objt.paint();	
}

//remove, move up, move down a page
function removeUpDownPage(rud,index) {
	if (rud=="r") {//remove 
		if (listPages.length > 1){
		var ret = confirm(lab_arr[19]);
		
			if (ret) {
				
				if(index > 0){
					var newIndex = index-1;
					showPageDiv(newIndex);
				}else{
					var newIndex = index+1;
					showPageDiv(newIndex);
				}
			
			
				hidePopupWin();
				var listPages_temp = new Array();
				listPages[index].page_div.style.display="none";
				if (current_div_index == index) {
					current_div_index 		= "";
					current_div_obj_index	= "";		
					fillProperties(-1);	
				}	
				
				for (var i=0; i< listPages[index].listObj.length;i++) {
					removeObject(index,i);
				}
				
						
			
				for (var i=0 ; i < listPages.length;i++) {
					if (i!= index) {listPages_temp[listPages_temp.length] = listPages[i];}
				}
				listPages = listPages_temp;
			}
			
		}else{
			alert(lab_arr[50]);
			return;
		}
	}
	else if (rud=="u") {
		
		hidePopupWin();
		var listPages_temp = new Array();
		
		if (current_div_index == index && index >0) {
			new_cur_index = current_div_index;
			new_cur_index = --new_cur_index;
		}
		
		if(current_div_index == index-1 && index >0 && new_cur_index != null) {
			new_cur_index = current_div_index;
			new_cur_index = ++new_cur_index;
		}
	
		if (index >0) {
			var v1 = listPages[index];
			var v2 = listPages[index-1];
			listPages[index-1] = v1;
			listPages[index] = v2;
			
			var indexminus1 = index-1;
			for (var i=0; i < popupObjects.length ; i++) {
				if(popupObjects[i].fdelete == 0 && popupObjects[i].id==22){
					if (popupObjects[i].eventObjDbid.indexOf(index+"#") >-1) {
						popupObjects[i].eventObjDbid = popupObjects[i].eventObjDbid.replace(index+"#",indexminus1+"#");
					} else if (popupObjects[i].eventObjDbid.indexOf(indexminus1+"#") >-1) {
						popupObjects[i].eventObjDbid = popupObjects[i].eventObjDbid.replace(indexminus1+"#",index+"#");
					}
					
					if (popupObjects[i].actionObjDbid.indexOf(index+"#") >-1) {
						popupObjects[i].actionObjDbid = popupObjects[i].actionObjDbid.replace(index+"#",indexminus1+"#");
					} else if (popupObjects[i].actionObjDbid.indexOf(indexminus1+"#") >-1) {
						popupObjects[i].actionObjDbid = popupObjects[i].actionObjDbid.replace(indexminus1+"#",index+"#");
					}
				}	
			}
			
			
		}
		
		if(new_cur_index != null){
			showPageDiv(new_cur_index);
		}
	}
	else if (rud=="d") {
		
		hidePopupWin();
		var listPages_temp = new Array();
		
		
		
		
		if (current_div_index == index && index <listPages.length -1 && new_cur_index != null) {
			new_cur_index = current_div_index;
			new_cur_index = ++new_cur_index;
		}
		
		if(current_div_index == index+1 && index <listPages.length -1) {
			new_cur_index = current_div_index;
			new_cur_index = --new_cur_index;
		}		
		
		if (index <listPages.length -1) {
			var v1 = listPages[index];
			var v2 = listPages[index+1];
			listPages[index+1] = v1;
			listPages[index] = v2;
			
			var indexplus1 = index+1;
			
			for (var i=0; i < popupObjects.length ; i++) {
				if(popupObjects[i].fdelete == 0 && popupObjects[i].id==22){
					
					if (popupObjects[i].eventObjDbid.indexOf(index+"#") >-1) {
						popupObjects[i].eventObjDbid = popupObjects[i].eventObjDbid.replace(index+"#",indexplus1+"#");
					} else if (popupObjects[i].eventObjDbid.indexOf(indexplus1+"#") >-1) {
						popupObjects[i].eventObjDbid = popupObjects[i].eventObjDbid.replace(indexplus1+"#",index+"#");
					}
					
					if (popupObjects[i].actionObjDbid.indexOf(index+"#") >-1) {
						popupObjects[i].actionObjDbid = popupObjects[i].actionObjDbid.replace(index+"#",indexplus1+"#");
					} else if (popupObjects[i].actionObjDbid.indexOf(indexplus1+"#") >-1) {
						popupObjects[i].actionObjDbid = popupObjects[i].actionObjDbid.replace(indexplus1+"#",index+"#");
					}
				}	
			}
			
			
		}
		
		if(new_cur_index != null){
			showPageDiv(new_cur_index);
		}
	}
	
	
	
	drawPagesLinks();
	/*if (rud=="r" && index == 0) {
		showPageDiv(index);
	}*/
	if (listPages.length>0) {
		document.getElementById("0").click();
	}
	saveChangeState();
}

//open a div for creating a new page
function addPageRequest(parent_index,x_pos,y_pos)
{
	var html_str = "<table border=0 width='100%' cellspacing=0 cellpadding=0>"
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[1]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupWin()'></td></tr></table></td></tr>"
			
			+"<tr><td class=\"propdivbg\" style='padding-bottom:0px; border-top-style:solid; border-top-width:1px; border-top-color:#7d95a7; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#7d95a7;'><div class=\"pUpInnerBorder\" style='width:149px; color:#ffffff; text-transform:capitalize;'>"+lab_arr[2]+"<div style='width:143px; padding-top:1px;'><input class=\"formfields\" type='text' value='' id='pagename' value='' onKeyPress='checkEnterAddPage(event,"+parent_index+")' style=\"width:140px; padding-left:4px;\"></div></div></td></tr>"
			
			
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" type='button' value='"+lab_arr[3]+"' onclick='savePage("+parent_index+")'><input class=\"formfields\" id='closeAddPage' type='button' value='"+lab_arr[24]+"' onclick='hidePopupWin()'></td></tr>"
	        + "</table></td></tr></table>";
	
	
	showPopupWin(x_pos,y_pos,"167px","",html_str);
    document.getElementById("closeAddPage").focus();

}

//add page to the list of pages
function savePage(parent_index) {
    if(validCharacters(document.getElementById("pagename"))){
      return;
    }
	var page_name = cleanVal(document.getElementById("pagename").value);
	document.getElementById("pagename").value = page_name;
	
	
	if (page_name == "") {
		alert(lab_arr[5]);
		document.getElementById("pagename").focus();
		return;
	} else {
		for (var i=0;i<listPages.length;i++) {
			if (listPages[i].page_name  == page_name) {
				alert(lab_arr[78]);
				document.getElementById("pagename").focus();
				document.getElementById("pagename").select();
				return;
			}
		}
	}
	
	var ret_index = addPage("",page_name,parent_index);
	drawPagesLinks();
	document.getElementById(ret_index).click();
	hidePopupWin();
	skinFit();
	saveChangeState();
}

//refresh the lsit of pages names
function drawPagesLinks()
{
	var pages_str = "<table border=0 cellpadding=0 cellspacing=0 id='pagedivtab' class=\"pagesListTable\"><tr class=\"tabheader2\"><td colspan=2 style=\"padding-bottom:5px;\">";
    if(lab_state == "1"){
       pages_str += "<img id='addpage' src='../../img/popup/add_page.gif' border='0' onclick='addPageRequest(-1,window.event.clientX + document.body.scrollLeft - document.body.clientLeft,window.event.clientY + document.body.scrollTop  - document.body.clientTop)' onmouseover='imgOver(this, \"5\")' onmouseout='imgOver(this, \"4\")' align='absmiddle' style=\"margin-left:10px; cursor:pointer\"><span style='padding-left:5px; cursor:pointer; text-transform:capitalize;' onclick='addPageRequest(-1,window.event.clientX + document.body.scrollLeft - document.body.clientLeft,window.event.clientY + document.body.scrollTop  - document.body.clientTop)' onmouseover='imgOver(addpage, \"5\")' onmouseout='imgOver(addpage, \"4\")'>"+lab_arr[0];
    }
    pages_str += "</span></td></tr>";
	for (var i=0 ; i < listPages.length; i++)
	{
		var classname= 'linkpageout';
		if (i==current_div_index && new_cur_index != null) {
			classname='linkpageclick';
		}
		
		pages_str += "<tr><td><div id='"+i+"' onclick='showPageDiv(\""+i+"\")' class="+classname+" onmouseover='linkPageMouseOver(this,"+i+")' onmouseout='linkPageMouseOut(this,"+i+")'><nobr>"+listPages[i].page_name+"</nobr></div></td><td>"
	    if(lab_state == "1"){ 	        
		          pages_str +=  "<img id='up"+i+"' src='../../img/popup/up.gif' hspace='0' vspace='0' border='0' onclick='removeUpDownPage(\"u\","+i+")' onmouseover='imgOver(this, \"1\")' onmouseout='imgOver(this, \"0\")' style=\"cursor:pointer; margin-right:1px\">"
		                    +  "<img id='down"+i+"' src='../../img/popup/down.gif' hspace='0' vspace='0' border='0' onclick='removeUpDownPage(\"d\","+i+")' onmouseover='imgOver(this, \"3\")' onmouseout='imgOver(this, \"2\")' style=\"cursor:pointer\">"
		}         
		          +  "</td></tr>";
	}
	pages_str += "</table>";
	
	document.getElementById("pages").innerHTML = pages_str;
	

}

//show the div related to the the concerned page
function showPageDiv(val)
{
	if (document.getElementById("gridoptions").style.visibility == "hidden") {
		document.getElementById("gridoptions").style.visibility = "visible";
	}
	if (document.getElementById("deleteBin").style.visibility == "hidden") {
		document.getElementById("deleteBin").style.visibility = "visible";
	}
	var tab = document.getElementById("pagedivtab").rows;

	tab[eval(val)+1].firstChild.firstChild.className="linkpageclick";
	
	
	if (new_cur_index != null && val != current_div_index && listPages.length > 1)
	{
		tab[eval(current_div_index)+1].firstChild.firstChild.className="linkpageout";
		listPages[current_div_index].page_div.style.display="none";
		listPages[current_div_index].page_divbg.style.display="none";
		
	}
	listPages[val].page_divbg.style.display="block";
	listPages[val].page_div.style.display="block";
	current_div_index = val;
	new_cur_index = current_div_index;
	fillProperties(-3);
	
	//drawRectCnv(listPages[val].rect);
	
	
}

//show a div without hiding the background , draggable div
function showPopupWin(x_pos,y_pos,width,height,html_str)
{
	var div_pop  = document.getElementById("popupwin");
	div_pop.style.left = x_pos;
	div_pop.style.top  = y_pos;
	div_pop.style.width  = width;
	div_pop.style.height  = height;
	div_pop.style.display = "block";
	div_pop.innerHTML = html_str;
	
}

function hidePopupWin()
{
	document.getElementById("popupwin").innerHTML = "";
	document.getElementById("popupwin").style.display = "none";
	
}

//show an undragable div with hidden background
function showPopupAllWin(width,height,html_str)
{
	fillProperties(-1);	
	var div_pop  = document.getElementById("popupallwin");
	div_pop.style.display = "block";
	var div_pop  = document.getElementById("popupsuballwin");
	div_pop.style.display = "block";
	div_pop.innerHTML = html_str;
	
	return div_pop;

}

function hidePopupAllWin()
{	document.getElementById("popupallwin").innerHTML = "";
	document.getElementById("popupallwin").style.display = "none";
	document.getElementById("popupsuballwin").innerHTML = "";
	document.getElementById("popupsuballwin").style.display = "none";
	hidePopupAllDetWin();
}

//show a detail div from a  "popupallwin" div
function showPopupAllDetWin(x_pos,y_pos,width,height,html_str)
{
	var div_pop  = document.getElementById("popupalldetwin");
	div_pop.style.display = "block";
	div_pop.innerHTML = html_str;
	
	div_pop.style.top = y_pos;
	div_pop.style.left = x_pos;
	div_pop.style.width = width;
	div_pop.style.height = height;
	div_pop.style.position = "absolute";
	return div_pop;
}

function hidePopupAllDetWin()
{
	document.getElementById("popupalldetwin").innerHTML = "";
	document.getElementById("popupalldetwin").style.display = "none";
}

//when user clickon an element
function clickItemMenu(thisParam)
{	if (current_div_index != ""){ // if there is a focus on a page add a copy of the element to the page 
		addPageObj(thisParam);
	}
	
}

//generate the content of the right pannel
function fillProperties(index){
	 hidePopupWin();
	 if (index==-1) { //empty the right pannel div
	 	
	 	propDiv.innerHTML = "";
	 	document.getElementById("popdisplay").className = "popdisplay";
	 }
	 else if (index==-2) { //when the user cilck on the popname in the pages div
	 	removeFocusCurrentPageObj();
	 	propDiv.innerHTML = getDBStr();
	 }
	 else if (index==-3) {//when the user click on page name in the pages div
	    removeFocusCurrentPageObj();
	 	propDiv.innerHTML = getPageStr();
	 	document.getElementById("proppagename").value=listPages[current_div_index].page_name;
	 	
	 	
	 }
	 else { //generate the properties of a page element
	    removeFocusCurrentPageObj(); 
	 	current_div_obj_index = index;
	 	focusCurrentPageObj();
	 	propDiv.innerHTML = getPropStr (current_div_index,current_div_obj_index,1);
		document.getElementById("popdisplay").className = "popdisplay";
	}
	skinFit();
}

function removeFocusCurrentPageObj() {
	try{
	 	   var obj = listPages[current_div_index].listObj[current_div_obj_index].divobj;
	 	      if (obj.className =="obj") {  
	 	   		obj.style.top = parseInt(obj.style.top) + selection_width;
	 	   		obj.style.left = parseInt(obj.style.left) + selection_width;
	 	   		 obj.className="otherobj";
	 	   	  }	
	 }
	 catch(ex){}
}

function focusCurrentPageObj() {
	var obj = listPages[current_div_index].listObj[current_div_obj_index].divobj;
	 	  if (obj.className !="obj") {  
	 	   	  obj.style.top = parseInt(obj.style.top) - selection_width;
	 	   	  obj.style.left = parseInt(obj.style.left) - selection_width;
	 	   	  obj.className="obj";
	 	 }	
}

function fillPropertiesCurrentObj() {
	fillProperties(current_div_obj_index);
}

//type=1 page object instances
//type=3 popupObjects definition (0-> database 1-> Paramenter...)
//type=2 popup object instances  (list of databases , parameters...)
function getObjectFromIndex(page_index , obj_index,type){
	var objectSelected=null; 
	switch(type) {
		case 1: objectSelected = listPages[page_index].listObj[obj_index];
		break;
		case 2:objectSelected = popupObjects[obj_index];
		break;
		case 3:objectSelected = listPopObject[obj_index];
		break;
	}
	return objectSelected;
}

//generate the String of the properties list of an object
function getPropStr (page_index , obj_index,type) {
	

    var objectSelected = getObjectFromIndex(page_index , obj_index,type);

	if (document.getElementById("pdata") != null) {
		var propData = "<table id=\"pdata\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"left\" valign=\"top\" class=\"propdiv_title\">"+(parseInt(obj_index)+1)+". "+listPages[page_index].listObj[obj_index].description+" "+lab_arr[72]+"</td></tr><tr><td align=\"left\" valign=\"middle\"><div class=\"propdiv_border\">"
	}else{

		var propData = "<table id=\"pdata\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"left\" valign=\"top\" class=\"propdiv_title\">"+lab_arr[42]+"</td></tr><tr><td align=\"left\" valign=\"middle\"><div class=\"propdiv_border\">"

	}
	
	for(var prop in objectSelected.propList)
	{
		
					
		if (( objectSelected.propList[prop].type=="MULTI" || objectSelected.propList[prop].type=="PDVLST") &&
		    (type==2|| type==3)) {continue;}
		
		if (objectSelected.propList[prop].type!="HIDDEN" ) {
			propData += "<div style=\"overflow:hidden;"
			if (objectSelected.name=='Database'){
			   propData +="width:210px; "
			}else{
			   propData +="width:178px; "
			}
			
			
			
			if (objectSelected.propList[prop].name=='Name' || objectSelected.propList[prop].name=='Content') {
				propData += "padding-top:0px; ";
				
			}else if (objectSelected.propList[prop].name=='Default') {
				propData += "padding-top:5px; ";
			}else{
				propData += "height:17px; "
				
				
				if (objectSelected.propList[prop].name=='Width' || objectSelected.propList[prop].name=='Datasource' || objectSelected.propList[prop].name=='FontSize' || objectSelected.propList[prop].name=='RadioWidth') {
					propData += "padding-top:8px; ";
				}else if (objectSelected.propList[prop].name=='Top' || objectSelected.propList[prop].name=='ButtonType'  || objectSelected.propList[prop].name=='Font' || objectSelected.propList[prop].name=='Required' || 
							objectSelected.propList[prop].name=='Checked' || objectSelected.propList[prop].name=='CnvWidth' || objectSelected.propList[prop].name=='Bkground' || objectSelected.propList[prop].name=='Border' || objectSelected.propList[prop].name=='File' || objectSelected.propList[prop].name=='Style' || objectSelected.propList[prop].name=='Format'
							|| objectSelected.propList[prop].name=='FormatTime' || (objectSelected.propList[prop].name=='Parameter' && objectSelected.propList[prop].name=='SearchItem') || objectSelected.propList[prop].name== 'DefaultCheck'
							) {
							
					propData += "padding-top:18px; ";
				}else if(objectSelected.propList[prop].name=='Parameter' && objectSelected.propList[prop].name!='SearchItem'){
					propData += "padding-top:8px; ";
				}else{
					propData += "padding-top:4px; ";
				}
				
				
				/*===>>> review the design
				if (objectSelected.propList[prop].name=='Required' || objectSelected.propList[prop].name=='Top' || objectSelected.propList[prop].name=='Datasource' ||
					objectSelected.propList[prop].name=='Checked') {
					propData += "padding-top:18px; ";
				}else{
					propData += "padding-top:4px; ";
				}*/
				
				
			}
			propData += "\">"+objectSelected.propList[prop].desc+"<div style=\""
			
			if (objectSelected.propList[prop].type=="COLOR") {
				propData += "position:relative; left:99px; top:-15px; width:17px; height:17px; border-style:solid; border-width:1px; border-color:#7f9db9; cursor:pointer; background:"+objectSelected.propList[prop].value+"; ";
			}else if (objectSelected.propList[prop].name=='Name' || objectSelected.propList[prop].name=='Content' || objectSelected.propList[prop].name=='Default') {
				propData += "width:178px; padding-top:1px; ";
			}else{
				
				if (objectSelected.name=='Database') {
						propData += "float:right; width:120px; margin-top:-15px; ";
				}else if (objectSelected.propList[prop].lstPropValue) {
					propData += "position:relative; width:79px; left:99px; top:-15px; ";
				}else{
					propData += "position:relative; width:79px; left:99px; top:-16px; ";
				}
			}
				
				
			if (objectSelected.propList[prop].type=="COLOR") {
				propData += "\" onclick='showColorPannel(\""+prop+"\")'>";
			}else{
				propData += "\">";
			}
			
			if (objectSelected.propList[prop].type=="MULTI") {
				propData +="<input type='button' value=' ... '; onclick='showMulti(window.event.clientX + document.body.scrollLeft - document.body.clientLeft,window.event.clientY + document.body.scrollTop  - document.body.clientTop)' class=\"formfields\" /></div>";
			}
			else if (objectSelected.propList[prop].type=="PDVLST") {
				propData +="<input type='button' value=' ... '; onclick='showDatasource(window.event.clientX + document.body.scrollLeft - document.body.clientLeft,window.event.clientY + document.body.scrollTop  - document.body.clientTop)' class=\"formfields\" /></div>";
			}
			else if (objectSelected.propList[prop].name=="Parameter") {
			
				propData +="<select class=\"formfields\" style='width:79px' onchange='setPropertyValueWithObj(\""+prop+"\",this.value,"+current_div_index+","+current_div_obj_index+",1);'><option class=\"formfields\" value=''></option>";
				for(var i=0;i<popupObjects.length;i++){
					if(popupObjects[i].fdelete == 0 && popupObjects[i].id==10){
					   var id = popupObjects[i].det_id;
					   if (id=="") {id=i+"#";}
						propData +="<option class=\"formfields\" value=\""+id+"\" "+((id==objectSelected.propList[prop].value)?"selected":"")+"   >"+popupObjects[i].propList["Name"].value+"</option>"; 
				    }
			    }
			    propData += "</select></div>";
			
			}
			else if (objectSelected.propList[prop].type=="UPLOAD") {
				propData +="<input type='button' value=' ... '; onclick='showUpload()' class=\"formfields\" /></div>";
			}

			else if (objectSelected.propList[prop].type=="COLOR") {
				propData += "</div>";
			}else{
			
				
				if(objectSelected.propList[prop].lstPropValue){
				propData += "<select name='"+prop+"' style=\"width:79px\" class=\"formfields\""
				if (type==1) propData +=" onchange='setPropertyValueWithObj(\""+prop+"\",this.value,"+current_div_index+","+current_div_obj_index+",1);redrawObject(-1,-1);'";
				propData += ">"
					for(var i=0 ;  i <  objectSelected.propList[prop].lstPropValue.length;i++){
					
						propData += "<option class=\"formfields\" value='"+objectSelected.propList[prop].lstPropValue[i].id+"'"
						if (objectSelected.propList[prop].lstPropValue[i].id== objectSelected.propList[prop].value) {
							propData += " selected";
						}
						propData += ">"+objectSelected.propList[prop].lstPropValue[i].name+"</option>";
					}
					propData += "</select></div>";
				}
				else{
					var txt = 'text';
					if (objectSelected.propList[prop].name=='Password'){
						txt='password';
					}
					
					if (objectSelected.propList[prop].name=='Name' || objectSelected.propList[prop].name=='Default' || objectSelected.propList[prop].name=='Content') {
						if (objectSelected.name=="Parameter") {
							propData += "<input class=\"formfields\" type='"+txt+"' name='"+prop+"' onKeyPress='checkEnterParameter(event)' style=\"width:169px; padding-left:4px;\" ";
						}
						else {
							if (objectSelected.propList[prop].name=='Content') {
								propData += "<input class=\"formfields\" type='"+txt+"' name='"+prop+"' onKeyPress='doKeyPressContent(event,this)' style=\"width:169px; padding-left:4px;\" ";
							} else {
							   if (objectSelected.name=='Database'){
							      propData += "<input class=\"formfields\" type='"+txt+"' name='"+prop+"' onKeyPress='doEnter(this,event)' style=\"width:200px; padding-left:4px;\" ";
							   }else{
							      propData += "<input class=\"formfields\" type='"+txt+"' name='"+prop+"' onKeyPress='doEnter(this,event)' style=\"width:169px; padding-left:4px;\" ";
							   } 
							
								
							}
						}
					}else{
					    if (objectSelected.name=='Database'){
					      propData += "<input class=\"formfields\" type='"+txt+"' name='"+prop+"' onKeyPress='doEnter(this,event)' style=\"width:110px; padding-left:4px;\" ";
					    }else{
					      propData += "<input class=\"formfields\" type='"+txt+"' name='"+prop+"' onKeyPress='doEnter(this,event)' style=\"width:70px; padding-left:4px;\" ";
					    }
						
					}
					
					/*page object instances*/
					if (type==1) {propData +="onblur='savePropertyValueWithObj(\""+prop+"\",this,"+page_index+","+obj_index+","+type+")' ";}
					propData +=" value='"+objectSelected.propList[prop].value+"' /></div>";
				}
			}	
			propData += "</div>";
		}
		if(objectSelected.propList[prop].name=='Datasource'){
			var dataBaseField = "";
			for (var i=0 ; i <popupObjects.length;i++) {
				if(popupObjects[i].fdelete == 0 && popupObjects[i].id==9)
			  	{
			  		var lst = popupObjects[i].propList['TablesList'].arrMulti;
				  	for (var j=0 ; j < lst.length ; j++) {
				  		if (lst[j].fdelete==0) {
				  			var val = (lst[j].id=="")?(i+"#"+j):lst[j].id;
				  			if(val==getPropertyValue('Datasource'))
				  				dataBaseField = popupObjects[i].propList['Name'].value+"."+lst[j].valueDesc;
				  			    break;
				  		}
				  	}
				 }
			  }	  
			if(getPropertyValue("Field")=="")
			   propData += "<input class=\"formfields\" type='text' disabled value=\"\" style=\"width:169px; padding-left:4px;\" />";
			else
		       propData += "<input class=\"formfields\" type='text' disabled value=\""+dataBaseField+"."+getPropertyValue("Field")+"\"  style=\"width:169px; padding-left:4px;\" />";
		}
				
	}
		propData += "</div></td></tr>";
		
	if (type==1) {/*page object instances*/
			propData +="<tr><td align=\"right\" style=\"color:#FFFFFF; padding-top:10px\"><span style='padding-right:5px; cursor:pointer;' onmouseover='imgOver(delelement, \"7\")' onmouseout='imgOver(delelement, \"6\")' onclick='removeObject(-1,-1)'>"+lab_arr[51]+"</span><img id='delelement' src=\"../../img/popup/delete.gif\" width=\"20\" height=\"20\" hspace=\"0\" vspace=\"0\" border=\"0\" align=\"absmiddle\" style=\"margin-right:10px; cursor:pointer;\" onmouseover='imgOver(this, \"7\")' onmouseout='imgOver(this, \"6\")' onclick='removeObject(-1,-1)' /></td></tr>";
	}
					
		
		
	propData += "</table>";
		
		

	skinFit();
	return propData;
}

function savePropertyValueWithObj(prop,obj,current_div_index,current_div_obj_index,type) {
	if (IsValidPropValue(prop,obj,current_div_index,current_div_obj_index,type)) {
		setPropertyValueWithObj(prop,obj.value,current_div_index,current_div_obj_index,type);
		redrawObject(-1,-1);
	}
}
function getPropertyValue(propName){
	if (listPages[current_div_index].listObj[current_div_obj_index].propList[propName])
	{
		
		if (propName=='Font' || propName=='FontStyle' || propName=='FontWeight' || propName=='Style') {
			var arr = listPages[current_div_index].listObj[current_div_obj_index].propList[propName].lstPropValue;
			var val = listPages[current_div_index].listObj[current_div_obj_index].propList[propName].value;
			for (var i = 0 ; i < arr.length; i++) {
				if (arr[i].id== val) return arr[i].name;	
			}			

			
		}
		
		return (listPages[current_div_index].listObj[current_div_obj_index].propList[propName].value);
	}
	return "";
}

function getPropertyValueWithIndex(propName,div_index,obj_index){

	if (listPages[div_index].listObj[obj_index].propList[propName])
	{
		if (propName=='Font' || propName=='FontStyle' || propName=='FontWeight' || propName=='Style'
			 || propName=='Align') {
			var arr = listPages[div_index].listObj[obj_index].propList[propName].lstPropValue;
			var val = listPages[div_index].listObj[obj_index].propList[propName].value;
			for (var i = 0 ; i < arr.length; i++) {
				if (arr[i].id== val) return arr[i].name;	
			}			

			
		}
		return (listPages[div_index].listObj[obj_index].propList[propName].value);
	}
	return "";
}
 
function setPropertyValue(propName,value){

    if (listPages[current_div_index].listObj[current_div_obj_index].propList[propName])
    {
		if (listPages[current_div_index].listObj[current_div_obj_index].propList[propName].value != value) {
			saveChangeState();
		}
	  listPages[current_div_index].listObj[current_div_obj_index].propList[propName].value = value;
	}
}

function setPropertyValueWithIndex(propName,value,div_index,obj_index){
    if (listPages[div_index].listObj[obj_index].propList[propName])
	listPages[div_index].listObj[obj_index].propList[propName].value = value;
}

function setPropertyValueWithObj(propName,value,page_index,obj_index,type){
    var objectSelected = getObjectFromIndex(page_index , obj_index,type);
    if (objectSelected.propList[propName].value != value) {
		saveChangeState();
	}
    if (objectSelected.propList[propName])
	objectSelected.propList[propName].value = value;
}

//and element to a page  --> obj_index is the index of the element definition in the toolbar list array: "ListObject"
function addPageObj(obj_index)
{
	var lstProp = new cloneObject(ListObject[obj_index]); //take a copy of the definition 
	removeFocusCurrentPageObj(); //remove focus from old element
    current_div_obj_index = listPages[current_div_index].listObj.length;
	listPages[current_div_index].listObj[current_div_obj_index] = lstProp; //add the element to the elements list of the page 
	if(listPages[current_div_index].listObj[current_div_obj_index].name=="SectionBreak"){
	   drawObject("10px","0px",current_div_index,current_div_obj_index); //generate the script of the section break
	}else{
	   drawObject("0px","0px",current_div_index,current_div_obj_index); //generate the script of the element
	}
	fillProperties(current_div_obj_index); //display the properties of the element and focus on it
	saveChangeState();
}


//change the cursor style when mouse over a page element
function moveStyle(obj) {
	obj.style.cursor="move";
}

//draw the shape of an element on the page ===>called either from the toolbar when adding a new element or when drawing the element on load of a saved popup
function drawObject(top,left,div_index,obj_index)
{
	
	var objdiv = document.createElement('div'); //main div of the element
	objdiv.style.position = "absolute";
	
	var img = null;	
	name = listPages[div_index].listObj[obj_index].name;
	
	if (name=='Text' || name=='Display' || name=='Number' || name=='Email' || name=='PhoneNumber' || name=='Date' || name=='Time' || name=='SearchItem') {
		img = document.createElement('input');
		img.type = 'text';
		img.disabled=true;
	}
	else if (name=='Button'){
		img = document.createElement('<input type=button style=\'cursor: move;\'>');
	}
	else if (name=='Combo') {
		img = document.createElement('select');
		img.disabled=true;
	}
	else if (name=='Textarea') {
		img = document.createElement('textarea');
		img.disabled=true;
	}
	else if (name=='Radio') {
		img = document.createElement('<input type=\'radio\' checked >');
	}
	else if (name=='Checkbox') {
		img = document.createElement('<input type=\'checkbox\' checked onclick=\'this.checked=true;\' >');
				
	} else if (name=='StaticText') {
		img = document.createElement('div');
		img.style.position="absolute";

	} else if (name=='SectionBreak') {
		img = document.createElement('<div style="background-color:#999999">');
	}else if (name=='Image') {
		img = document.createElement('div');
		img.style.background="#ffffff";
		//img.style.border="1px solid #000000";
		var myimg = document.createElement('img'); //the div of the image placed on the "img" div 
		
		img.appendChild(myimg);
		if (getPropertyValueWithIndex('File',div_index,obj_index)!="") {
			var val = popInitialName;
			
			if (popInitialName=="") {
				val=uniqueid;
			}
			if (getPropertyValueWithIndex('File',div_index,obj_index) == "logoaheeva01.gif") {
			   myimg.src="./phpgenerator/logoaheeva01.gif";
			} else {
				myimg.src="/aheevaccs/servlet/Image?"+popDownPath+val+"/"+getPropertyValueWithIndex('File',div_index,obj_index);
			}	

			myimg.style.top="0";
			myimg.style.left="0";
			
		}
		myimg.style.width=getPropertyValueWithIndex('Width',div_index,obj_index);
		myimg.style.height=getPropertyValueWithIndex('Height',div_index,obj_index);
		img.style.position="absolute";
	}
	
  	
  	img.style.width= getPropertyValueWithIndex('Width',div_index,obj_index);
  	
  	img.style.height= getPropertyValueWithIndex('Height',div_index,obj_index);
  	
  	
    
  	 objdiv.style.top =parseInt(top);
    
  	objdiv.style.left =parseInt(left)-2;
  	
  	
  	//v == "objdiv" if the element is not image else it is the "img" 
  	var v = objdiv;
  	if (name=='Button') {v= img;}
  	
 	v.style.fontFamily  =  getPropertyValueWithIndex('Font',div_index,obj_index);
  	v.style.fontSize    =  getPropertyValueWithIndex('FontSize',div_index,obj_index);
  	v.style.fontStyle    =  getPropertyValueWithIndex('FontStyle',div_index,obj_index);
  	v.style.fontWeight   	=  getPropertyValueWithIndex('FontWeight',div_index,obj_index);
  	v.style.color    	=  getPropertyValueWithIndex('FontColor',div_index,obj_index);
  	
  	var required = getPropertyValueWithIndex('Required',div_index,obj_index);
  	
  	
  	
  	
  	var label = document.createElement('div'); //it is the first child of the "objdiv"
  	label.style.position="absolute";
  	label.style.textAlign=  getPropertyValueWithIndex('Align',div_index,obj_index);
  	
  	if (name=='Button'){
  		img.value =getPropertyValueWithIndex('Name',div_index,obj_index);
  		img.style.textAlign = getPropertyValueWithIndex('Align',div_index,obj_index);
  	} else {
  		label.innerText = getPropertyValueWithIndex('Name',div_index,obj_index);
  	}
	
	setPropertyValueWithIndex("Left", left,div_index,obj_index);
	
	if(getPropertyValueWithIndex('Name',div_index,obj_index)=="")
		   setPropertyValueWithIndex("Name",listPages[div_index].listObj[obj_index].description ,div_index,obj_index);
	
	
	var wid = getPropertyValueWithIndex('LabelWidth',div_index,obj_index);
	
	if (wid==""){wid="0";}
	
	
	left = parseInt(left) - parseInt(wid);
  	
  	if (left < 0) left=0;
  	
  	if (left==0) {setPropertyValueWithIndex("Left", parseInt(wid)+"px",div_index,obj_index);}
  	
  
  	
  	label.style.height	= getPropertyValueWithIndex('Height',div_index,obj_index);
  	label.style.width	= wid;
  	label.innerText = getPropertyValueWithIndex('Name',div_index,obj_index);
  	objdiv.style.left = left;
	
  	setPropertyValueWithIndex("Top" , top ,div_index,obj_index);
	
  	objdiv.onmouseover = new Function('moveStyle(this);'); 
  	
	if(name=='SectionBreak'){
	  document.getElementById('hiddiv'+div_index).insertBefore(objdiv);
	}else{
	  listPages[div_index].page_div.appendChild(objdiv); //and the "objdiv" the div of the page
	}
	objdiv.appendChild(label);
	var img_div = document.createElement('div');
	objdiv.appendChild(img_div);
	img_div.style.position="absolute";
	img_div.style.left = label.style.width;
	
	if(name=='Combo'){
	  img_div.style.top="1px";
	}
	
	if (name=="StaticText") {
		img_div.style.border="1px solid #000000";
		img_div.style.width= getPropertyValueWithIndex('Width',div_index,obj_index);
  		img_div.style.height= getPropertyValueWithIndex('Height',div_index,obj_index);
  		img.innerText= getPropertyValueWithIndex('Content',div_index,obj_index);  	
  		img.style.textAlign= getPropertyValueWithIndex('Align',div_index,obj_index);  	
  			
	}
	
	if(name=='Radio'){
		img_div.style.width= getPropertyValueWithIndex('RadioWidth',div_index,obj_index);
		var objectSelected = listPages[div_index].listObj[obj_index].propList['Values'].arrMulti;
    	var strRadio= "";
     if(objectSelected.length > 0){
    	for (var i = 0 ; i < objectSelected.length ; i++) {
    		var fdefault = "0";
    		
			if (listPages[div_index].listObj[obj_index].propList['Values'].value == objectSelected[i].valueCode) {
				fdefault ="1";
			}
    		strRadio += "<div style='position:absolute;background-color:#FFFFFF;filter:alpha(opacity=0);top:"+getPropertyValueWithIndex('Top',div_index,obj_index)+"px;left:"+getPropertyValueWithIndex('Left',div_index,obj_index)+"px;width:21px;height:21px;'></div><input type='radio' name='radioButton" + (parseInt(obj_index)+1) + "'  "+((fdefault==1)?"checked":"")+">"+objectSelected[i].valueDesc+"</input><br>"
       	}
    	objdiv.childNodes.item(1).innerHTML = strRadio;
     }else{
    	 img_div.appendChild(img);
     }
   }else{
	img_div.appendChild(img);
   }
	 
	if (listPages[div_index].listObj[obj_index].name == 'Image') {
		objdiv.style.height= getPropertyValueWithIndex('CnvHeight',div_index,obj_index);
		objdiv.style.width= getPropertyValueWithIndex('CnvWidth',div_index,obj_index);
		var left = parseInt(getPropertyValueWithIndex('CnvWidth',div_index,obj_index))/2 - parseInt(getPropertyValueWithIndex('Width',div_index,obj_index))/2;
		objdiv.childNodes.item(1).style.left=left;
		var top = parseInt(getPropertyValueWithIndex('CnvHeight',div_index,obj_index))/2 - parseInt(getPropertyValueWithIndex('Height',div_index,obj_index))/2;
		objdiv.childNodes.item(1).style.top=top;
		objdiv.style.background = getPropertyValueWithIndex('Bkground',div_index,obj_index);
	
	} 
	if (listPages[div_index].listObj[obj_index].name == 'SectionBreak') {
		objdiv.style.height = "0";
		label.style.height= "0";
		img.style.borderStyle = getPropertyValueWithIndex('Style',div_index,obj_index);
		img.style.backgroundColor=getPropertyValueWithIndex('Bkground',div_index,obj_index);
		img.style.borderWidth=getPropertyValueWithIndex('Borwidth',div_index,obj_index);
		img.style.borderColor=getPropertyValueWithIndex('Border',div_index,obj_index);
	}
	makeDraggable(objdiv,obj_index);
	listPages[div_index].listObj[obj_index].divobj = objdiv;	
	
	
	if (required=="1") {
	   if(getPropertyValueWithIndex('Height',div_index,obj_index)==""){
	     objdiv.childNodes.item(0).style.height=21 ;
	     objdiv.style.height=21 ;
	     objdiv.childNodes.item(1).style.height=21 ;     
	    }else{
	       objdiv.childNodes.item(0).style.height= 8+parseInt(getPropertyValueWithIndex('Height',div_index,obj_index));
	    }
  		objdiv.childNodes.item(0).style.background  = 	getReqBgColor();
  		objdiv.childNodes.item(1).style.background  = 	getReqBgColor();
  		objdiv.style.background  = 	getReqBgColor();
  	}
  	
  	
  	if (name=='Text' || name=='Display' || name=='Number' || name=='Email' || name=='PhoneNumber' || 
  		name=='Date' || name=='Time'    || name=='Textarea' || name=='SearchItem') {
		img.style.width = parseInt(getPropertyValueWithIndex('Width',div_index,obj_index)) - 6;
	}
  	
//  	alert ("drawObject");
	objdiv.id = "newdiv1";
//	alert (objdiv.id);

	   if(name=='Textarea'){
	      objdiv.style.height = 8 + parseInt(getPropertyValueWithIndex('Height',div_index,obj_index));
	   }else if(name=='Image'){
	      objdiv.style.height = parseInt(getPropertyValueWithIndex('CnvHeight',div_index,obj_index));
       }else if(name=='Button' || name=='StaticText'){
          objdiv.style.height = parseInt(getPropertyValueWithIndex('Height',div_index,obj_index)) + 2;  
       }else if(name=='SectionBreak'){
          objdiv.style.height =  parseInt(getPropertyValueWithIndex('Height',div_index,obj_index)) + (parseInt(getPropertyValueWithIndex('Borwidth',div_index,obj_index))*2); 
       }else if(name=='Checkbox'){
          objdiv.style.height = 21;
       }else if(name=='Radio'){
    	   var objectSelected = listPages[div_index].listObj[obj_index].propList['Values'].arrMulti;
    	   if(!objectSelected.length)
    		   objdiv.style.height = 21;
    	   else
    		   objdiv.style.height = 21 * objectSelected.length;
       }else{
     	  objdiv.style.height = 24;
       }
       
       if(name=='Checkbox'){
          objdiv.style.width = parseInt(objdiv.childNodes.item(0).style.width) + 20;
       }else if(name=='Image'){
           objdiv.style.width= parseInt(getPropertyValueWithIndex('CnvWidth',div_index,obj_index));
       }else if(name=='StaticText'){
          objdiv.style.width = parseInt(getPropertyValueWithIndex('Width',div_index,obj_index)) + 2;         
       }else if(name=='SectionBreak'){
          objdiv.style.width =  parseInt(getPropertyValueWithIndex('Width',div_index,obj_index)) + (parseInt(getPropertyValueWithIndex('Borwidth',div_index,obj_index))*2); 
       }else if(name=='Radio'){
    	   objdiv.style.width = parseInt(getPropertyValueWithIndex('LabelWidth',div_index,obj_index)) + 20 + parseInt(getPropertyValueWithIndex('RadioWidth',div_index,obj_index));
       }else{
  	      objdiv.style.width = parseInt(objdiv.childNodes.item(0).style.width) + parseInt(getPropertyValueWithIndex('Width',div_index,obj_index)) +1;
       }
}	

//used to redraw an element after changin its properties values ==>takes -1,-1 in case you need to redraw the current element 
function redrawObject(div_index,div_obj_index)
{	
	
	var  my_div_index = div_index;
	var  my_div_obj_index =div_obj_index;
	
	if  (div_index==-1) {my_div_index = current_div_index;}
	if  (div_obj_index==-1) {my_div_obj_index = current_div_obj_index;}
	 
	var mydiv = listPages[my_div_index].listObj[my_div_obj_index].divobj;
	
	mydiv.childNodes.item(1).childNodes.item(0).style.height= getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index);
	
	if (listPages[my_div_index].listObj[my_div_obj_index].name=='Button') {
		mydiv.childNodes.item(1).childNodes.item(0).value = getPropertyValueWithIndex('Name',my_div_index,my_div_obj_index);
		mydiv.childNodes.item(1).childNodes.item(0).style.textAlign = getPropertyValueWithIndex('Align',my_div_index,my_div_obj_index);
	}else{
		mydiv.childNodes.item(0).innerText = getPropertyValueWithIndex('Name',my_div_index,my_div_obj_index);
		mydiv.childNodes.item(0).style.textAlign = getPropertyValueWithIndex('Align',my_div_index,my_div_obj_index);
	}
	
	var labwid = getPropertyValueWithIndex('LabelWidth',my_div_index,my_div_obj_index);
	
	if (labwid=="") {labwid="0px";}
	mydiv.childNodes.item(0).style.width=labwid;
	
	
	
	mydiv.childNodes.item(1).childNodes.item(0).style.width = getPropertyValueWithIndex('Width',my_div_index,my_div_obj_index);
	mydiv.childNodes.item(1).style.left = labwid;
	
  	mydiv.childNodes.item(0).style.height= getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index);
  	mydiv.style.top 	= parseInt(getPropertyValueWithIndex('Top',my_div_index,my_div_obj_index)) - selection_width;
  	
  	mydiv.style.left 	= parseInt(getPropertyValueWithIndex('Left',my_div_index,my_div_obj_index)) - parseInt(listPages[my_div_index].listObj[my_div_obj_index].divobj.childNodes.item(0).style.width) - selection_width;
  	
    if (listPages[my_div_index].listObj[my_div_obj_index].name=='Button') {
	    mydiv.childNodes.item(1).childNodes.item(0).style.fontFamily  =  getPropertyValueWithIndex('Font',my_div_index,my_div_obj_index);
	    mydiv.childNodes.item(1).childNodes.item(0).style.fontSize    =  getPropertyValueWithIndex('FontSize',my_div_index,my_div_obj_index);
	    mydiv.childNodes.item(1).childNodes.item(0).style.fontStyle   =  getPropertyValueWithIndex('FontStyle',my_div_index,my_div_obj_index);
	    mydiv.childNodes.item(1).childNodes.item(0).style.fontWeight  =  getPropertyValueWithIndex('FontWeight',my_div_index,my_div_obj_index);
	    mydiv.childNodes.item(1).childNodes.item(0).style.color  		=  getPropertyValueWithIndex('FontColor',my_div_index,my_div_obj_index);
   } else {
	    mydiv.style.fontFamily  =  getPropertyValueWithIndex('Font',my_div_index,my_div_obj_index);
	    mydiv.style.fontSize    =  getPropertyValueWithIndex('FontSize',my_div_index,my_div_obj_index);
	    mydiv.style.fontStyle   =  getPropertyValueWithIndex('FontStyle',my_div_index,my_div_obj_index);
	    mydiv.style.fontWeight  =  getPropertyValueWithIndex('FontWeight',my_div_index,my_div_obj_index);
	    mydiv.style.color  		=  getPropertyValueWithIndex('FontColor',my_div_index,my_div_obj_index);
   }
    
    var required = getPropertyValueWithIndex('Required',my_div_index,my_div_obj_index);
  	
  	if (required=="1") {
  	   if(getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index)==""){
	      mydiv.childNodes.item(0).style.height =21 ;
	      mydiv.style.height =21 ;
	      mydiv.childNodes.item(1).style.height =21 ;  
	    }else{
	        mydiv.childNodes.item(0).style.height = 8+parseInt(getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index));
	    }
  	   
  		mydiv.childNodes.item(0).style.background  = 	getReqBgColor();
  		mydiv.childNodes.item(1).style.background  = 	getReqBgColor();
   		mydiv.style.background  = 	getReqBgColor();
 
  	}
  	else {
  		mydiv.childNodes.item(0).style.background  = "";
  		mydiv.childNodes.item(1).style.background  = "";
   		mydiv.style.background  = "";
  	}
  	
     
   if (listPages[my_div_index].listObj[my_div_obj_index].name=='StaticText') {
		mydiv.childNodes.item(1).style.width = getPropertyValueWithIndex('Width',my_div_index,my_div_obj_index);
		mydiv.childNodes.item(1).style.height = getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index);
		mydiv.childNodes.item(1).childNodes.item(0).innerText = getPropertyValueWithIndex('Content',my_div_index,my_div_obj_index)
		mydiv.childNodes.item(1).childNodes.item(0).style.textAlign = getPropertyValueWithIndex('Align',my_div_index,my_div_obj_index)	
	} 
     
    mydiv.style.height= getPropertyValueWithIndex('CnvHeight',my_div_index,my_div_obj_index);
	mydiv.style.width= getPropertyValueWithIndex('CnvWidth',my_div_index,my_div_obj_index);
    
    if(listPages[my_div_index].listObj[my_div_obj_index].name=='Radio'){
    	mydiv.childNodes.item(1).style.width = getPropertyValueWithIndex('RadioWidth',my_div_index,my_div_obj_index);
    	var objectSelected = listPages[my_div_index].listObj[my_div_obj_index].propList['Values'].arrMulti;
    	var strRadio= "";
      if(objectSelected.length > 0){
    	for (var i = 0 ; i < objectSelected.length ; i++) {
    		var fdefault = "0";
    		
			if (listPages[my_div_index].listObj[my_div_obj_index].propList['Values'].value == objectSelected[i].valueCode) {
				fdefault ="1";
			}
    		strRadio += "<div style='position:absolute;background-color:#FFFFFF;filter:alpha(opacity=0);top:"+getPropertyValueWithIndex('Top',my_div_index,my_div_obj_index)+"px;left:"+getPropertyValueWithIndex('Left',my_div_index,my_div_obj_index)+"px;width:200px;height:21px;'></div><input type='radio' name='radioButton" + (parseInt(my_div_obj_index)+1) + "'  "+((fdefault==1)?"checked":"")+">"+objectSelected[i].valueDesc+"</input><br>"
       	}
    	mydiv.childNodes.item(1).innerHTML = strRadio;
      }
    }
           
  	if (listPages[my_div_index].listObj[my_div_obj_index].name == 'Image') {//align the image in the center of its background
  		var left = parseInt(getPropertyValueWithIndex('CnvWidth',my_div_index,my_div_obj_index))/2 - parseInt(getPropertyValueWithIndex('Width',my_div_index,my_div_obj_index))/2;
		mydiv.childNodes.item(1).style.left=left;
		var top = parseInt(getPropertyValueWithIndex('CnvHeight',my_div_index,my_div_obj_index))/2 - parseInt(getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index))/2;
		mydiv.childNodes.item(1).style.top=top;
		mydiv.style.background= getPropertyValueWithIndex('Bkground',my_div_index,my_div_obj_index);
		
		
		//remove and re add the image in order to get latest file
		var v = mydiv.childNodes.item(1).childNodes.item(0).childNodes.item(0);
		v.removeNode();
		v = mydiv.childNodes.item(1).childNodes.item(0);
		var myimg = document.createElement('img');
		
		v.appendChild(myimg);
		
		myimg.style.position="absolute";
		if(name=='Combo'){
		  mydiv.style.top="1px";
		}else{
		  myimg.style.top = "0";
		}
		myimg.style.left = "0";
		
		if (getPropertyValueWithIndex('File',my_div_index,my_div_obj_index)!="") {
			var val = popInitialName;
			
			if (popInitialName=="") {
				val=uniqueid;
			}
			
			myimg.src="/aheevaccs/servlet/Image?"+popDownPath+val+"/"+getPropertyValueWithIndex('File',my_div_index,my_div_obj_index);

			
		}
		myimg.style.width=getPropertyValueWithIndex('Width',my_div_index,my_div_obj_index);
		myimg.style.height=getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index);
		
		
  	
	} 
	if (listPages[my_div_index].listObj[my_div_obj_index].name == 'SectionBreak') {
		mydiv.style.height = "0";
		mydiv.childNodes.item(0).style.height = "0";
		mydiv.childNodes.item(1).childNodes.item(0).style.borderStyle=getPropertyValueWithIndex('Style',my_div_index,my_div_obj_index);
		mydiv.childNodes.item(1).childNodes.item(0).style.backgroundColor=getPropertyValueWithIndex('Bkground',my_div_index,my_div_obj_index);
		mydiv.childNodes.item(1).childNodes.item(0).style.borderWidth=getPropertyValueWithIndex('Borwidth',my_div_index,my_div_obj_index);
        mydiv.childNodes.item(1).childNodes.item(0).style.borderColor=getPropertyValueWithIndex('Border',my_div_index,my_div_obj_index);
       }
	
	var name = listPages[my_div_index].listObj[my_div_obj_index].name;
	if (name=='Text' || name=='Display' || name=='Number' || name=='Email' || name=='PhoneNumber' || 
  		name=='Date' || name=='Time'    || name=='Textarea' || name=='SearchItem') {
		mydiv.childNodes.item(1).childNodes.item(0).style.width = parseInt(getPropertyValueWithIndex('Width',my_div_index,my_div_obj_index)) - 6;
	}
	
	
	   if(name=='Textarea'){
	        mydiv.style.height = 8 + parseInt(getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index));
	   }else if(name=='Image'){
	        mydiv.style.height = parseInt(getPropertyValueWithIndex('CnvHeight',my_div_index,my_div_obj_index)); 
	   }else if(name=='Button' || name=='StaticText'){
            mydiv.style.height = parseInt(getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index)) + 2;
	   }else if(name=='SectionBreak'){
	       mydiv.style.height = parseInt(getPropertyValueWithIndex('Height',my_div_index,my_div_obj_index)) +(parseInt(getPropertyValueWithIndex('Borwidth',my_div_index,my_div_obj_index))*2);
	   }else if(name=="Checkbox"){
           mydiv.style.height = 21;
	   }else if(name=="Radio"){
		   var objectSelected = listPages[my_div_index].listObj[my_div_obj_index].propList['Values'].arrMulti;
		   if(!objectSelected.length)
			   mydiv.style.height = 21;
    	   else
    		   mydiv.style.height = 21 * objectSelected.length;
	   }else{
     	    mydiv.style.height = 24;
       }
       
       if(name=='Checkbox'){
             mydiv.style.width = parseInt(mydiv.childNodes.item(0).style.width) + 20;
       }else if(name=='Image'){
             mydiv.style.width = parseInt(getPropertyValueWithIndex('CnvWidth',my_div_index,my_div_obj_index));
       }else if(name=='StaticText'){
    	     mydiv.style.width = parseInt(getPropertyValueWithIndex('Width',my_div_index,my_div_obj_index)) + 2;
       }else if(name=='SectionBreak'){
	         mydiv.style.width = parseInt(getPropertyValueWithIndex('Width',my_div_index,my_div_obj_index)) + (parseInt(getPropertyValueWithIndex('Borwidth',my_div_index,my_div_obj_index))*2);
       }else if(name=='Radio'){
    	   mydiv.style.width = parseInt(mydiv.childNodes.item(0).style.width) + 20 + parseInt(getPropertyValueWithIndex('RadioWidth',my_div_index,my_div_obj_index));
       }else{
  	       mydiv.style.width = parseInt(mydiv.childNodes.item(0).style.width) + parseInt(getPropertyValueWithIndex('Width',my_div_index,my_div_obj_index)) + 1;
       } 
}	

//remove the current element from a page ==> is is a logical delete 
function removeObject(p_current_div_index,p_current_div_obj_index)
{
	
	var ret = 1;
	
	var my_current_div_index = p_current_div_index;
	var my_current_div_obj_index = p_current_div_obj_index;
	
	
	if (my_current_div_index==-1) {
		ret = confirm(lab_arr[6]);
	}
	
	if (my_current_div_index==-1) {my_current_div_index = current_div_index;}
	if (my_current_div_obj_index==-1) {my_current_div_obj_index = current_div_obj_index;}
	
	
	if (ret) {
		listPages[my_current_div_index].listObj[my_current_div_obj_index].fdelete = 1;
		listPages[my_current_div_index].listObj[my_current_div_obj_index].divobj.style.display = 'none';
		
		
		
		
		/*delete all events related to this element*/
		var val = listPages[my_current_div_index].listObj[my_current_div_obj_index].det_id;
		
		if (val=="") {
			val = my_current_div_index+"#"+my_current_div_obj_index;
		}
		for (var i=0; i < popupObjects.length ; i++) {
			if(popupObjects[i].fdelete == 0 && popupObjects[i].id==22){
				if (popupObjects[i].eventObjDbid==val || popupObjects[i].actionObjDbid==val) {
					popupObjects[i].fdelete=1;
				}
			}
			
		}
		
		if (p_current_div_index==-1) {
			current_div_obj_index = "";
			fillProperties(-1);
		}
	}
	saveChangeState();
}

function cloneObject(what) {
   
    for (i in what) {
      
     
	  if (i=="lstPropValue") {
	  	this[i] = what[i];
	  	
	  }
	  else {
	  		if (typeof what[i] == 'object') {
            	this[i] = new cloneObject(what[i]);
        	}
       		else {
            	this[i] = what[i];
            }
       }
    }
}



////////////////drag page elements///////////////////
var dragObject  = null;
var mouseOffset = null;

var diffTop	   = 0;
var diffLeft     = 0;

function getMouseOffset(target, ev){
	ev = ev || window.event;

	var docPos    = getPosition(target);
	var mousePos  = mouseCoords(ev);
	return {x:mousePos.x - docPos.x, y:mousePos.y - docPos.y};
}

function getPosition(e){
	var left = 0;
	var top  = 0;
	

	while (e.offsetParent){
		left += e.offsetLeft;
		top  += e.offsetTop;
		e     = e.offsetParent;
	}

	left += e.offsetLeft;
	top  += e.offsetTop;

	return {x:left, y:top};
}

function mouseMove(ev){
 if(lab_state=="1"){
	ev           = ev || window.event;
	var mousePos = mouseCoords(ev);
	
	var binLeft = document.getElementById("pagesDivOuter").clientWidth - 39;
	var binTop = document.getElementById("pagesDivOuter").clientHeight - 39;
	var binDiv = document.getElementById("deleteBin")

	if(dragObject){
	
		dragObject.style.position = 'absolute';
		dragObject.style.top      = mousePos.y - diffTop;
		dragObject.style.left     = mousePos.x -  diffLeft;	
		dragObject.style.cursor   ='move';

// define action area for delete bin
		if (mousePos.x > binLeft && mousePos.y > binTop && binDiv.className != "bin_over") {
			binDiv.className = "bin_over";
			binDiv.style.cursor = "default";
			dragObject.style.visibility = "hidden";
		}else if (binDiv.className != "bin_off") {
			if (mousePos.x < binLeft || mousePos.y < binTop) 
			
			{
				binDiv.className = "bin_off";
				binDiv.style.cursor = "move";
				dragObject.style.visibility = "visible";
			}
		}

		return false;
	}
  }
}

function mouseUp(){
	if(dragObject){
	
	if (dragObject.style.top ==""){dragObject.style.top="0px";}
	if (dragObject.style.left ==""){dragObject.style.left="0px";}
	  var left = parseInt(dragObject.style.left)+parseInt(listPages[current_div_index].listObj[current_div_obj_index].divobj.childNodes.item(0).style.width) + selection_width;
	// dragObject.style.border="1px solid #ff0000";
	  setPropertyValue("Top",(parseInt(dragObject.style.top)+selection_width)+"px");
	  setPropertyValue("Left",left+"px");
	fillProperties(current_div_obj_index);
	
		if (document.getElementById("deleteBin").className == "bin_over") {
			removeObject(-1,-1);
			document.getElementById("deleteBin").className = "bin_off";
			dragObject.style.visibility = "visible";
		}
		
	dragObject = null;
	}
	diffTop	   = 0;
	diffLeft   = 0;
}

function makeDraggable(item,idx){
 
	if(!item) return;
	item.onmousedown = function(ev){
		if (dragObject==null) { 
		dragObject  = this;
		
		try {
			if (dragObject.className!="obj") {
			 dragObject.style.top= parseInt(dragObject.style.top) - selection_width;
			 dragObject.style.left= parseInt(dragObject.style.left) - selection_width;	    	
			}
			  dragObject.className="obj";
	
			if (listPages[current_div_index].listObj[current_div_obj_index].divobj != dragObject) {
			    removeFocusCurrentPageObj();  			
			}
		}
		catch (exp){}
		
		 fillProperties(idx);
		
		mouseOffset = getMouseOffset(this, ev);
		
		var ev1 = ev || window.event;
		var mousePos  = mouseCoords(ev1);
		
		
		diffTop   = parseInt(ev1.y) - parseInt(item.style.top) - start_div_top + document.getElementById("pagesDiv").scrollTop;
        diffLeft  = parseInt(ev1.x)- parseInt(item.style.left) - start_div_left + document.getElementById("pagesDiv").scrollLeft;
              
		return false;
		
		}
	}
}

function mouseCoords(ev){

	var v1 = ev.clientX + document.getElementById("pagesDiv").scrollLeft - document.body.clientLeft -start_div_left;  
	var v2 = ev.clientY + document.getElementById("pagesDiv").scrollTop  - document.body.clientTop  -start_div_top;
	
    if (v1 > page_div_width - diffLeft) v1 = page_div_width - diffLeft;
    if (v1 < diffLeft -2) v1 = diffLeft -2;
    
    if (v2 > page_div_height - diffTop) v2 = page_div_height - diffTop;
    if (v2 < diffTop -2) v2 = diffTop -2;
       
	return {
		x: v1,
		y: v2
	};
}


////////////////end drag page element///////////////////

///////////////drag popup /////////////////

var dragObjectPop  = null;
var mouseOffsetPop = null;

var diffTopPop	   = 0;
var diffLeftPop     = 0;

function getMouseOffsetPop(target, ev){
	ev = ev || window.event;

	var docPos    = getPosition(target);
	var mousePos  = mouseCoordsPop(ev);
	return {x:mousePos.x - docPos.x, y:mousePos.y - docPos.y};
}

function mouseMovePop(ev){
	ev           = ev || window.event;
	var mousePos = mouseCoordsPop(ev);

	if(dragObjectPop){
		dragObjectPop.style.position = 'absolute';
		dragObjectPop.style.top      = mousePos.y - diffTopPop;
		dragObjectPop.style.left     = mousePos.x -  diffLeftPop;	
		dragObjectPop.style.cursor   ='pointer';
		return false;
	}
}

function mouseUpPop(){
	if(dragObjectPop){
	
	if (dragObjectPop.style.top ==""){dragObjectPop.style.top="0px";}
	if (dragObjectPop.style.left ==""){dragObjectPop.style.left="0px";}
	
	dragObjectPop = null;
	}
	diffTopPop	   = 0;
	diffLeftPop   = 0;
}

function makeDraggablePop(item){
	if(!item) return;
	item.onmousedown = function(ev){
		
		var ev1 = ev || window.event;
		var mousePos  = mouseCoordsPop(ev1);
		
		
		diffTopPop   = parseInt(ev1.y) - parseInt(item.style.top)  ;
        diffLeftPop  = parseInt(ev1.x)- parseInt(item.style.left)  ;

		
		
		if (parseInt(ev1.x) <= parseInt(item.style.left) + parseInt(item.style.width) - 20 && parseInt(ev1.y) <= parseInt(item.style.top)+20 ) {
			dragObjectPop  = this;
			
			mouseOffsetPop = getMouseOffsetPop(this, ev);
		
		}
              
		return false;
	}
}

function mouseCoordsPop(ev){
	try {

		var v1 = null; 
		var v2 = null;
			v1 = ev.clientX   -  document.body.clientLeft; 
			v2 = ev.clientY   - document.body.clientTop  ;
		  
		return {
			x: v1,
			y: v2
		};
	} catch(ex) {
	}
	
	
}
/////end drag popup////
var forSaveAs = null;
//save a popup , "f_as" for save as
function savePopup(f_as)
{
        if (initialPopName != "" && initialPopName != getPopDescription()) {
			var nameHasChanged = confirm (lab_arr[117]+"\n\n"+lab_arr[118]+"\n\n'"+initialPopName+"'\n\n\n"+lab_arr[119]+"\n"+lab_arr[120]+".    ");
			if (!nameHasChanged) {
				return false;
			}
		}
		needToSaveChanges=false;
		doMouseOut(dynmenu1,0);
       //send the current page name in order to open the popup after save on this page 
	   if (current_div_index!="") {
	   	document.frm.currentpagename.value = listPages[current_div_index].page_name;
	   }
	   
	   
	   var war_str = "";
	   
	   
	   if (!f_as && popType =="OUT") {//click on save for outbopund popup
	   		if (popupObjects[0].propList['TablesList'].arrMulti.length ==0) { //the user shoudl add a calling list table
	   			war_str = "- "+lab_arr[75]+"\n";
	   		}

			//test wheter mandatory fields of the calling list table are all added to pages
			
	   		var f_exist = 0;
	   		var mywar = "";
	   		for (var i=0; i <  arr_outbound.length ; i++) {
	   		  f_exist = 0;
	   		  for (var j=0; j <listPages.length && f_exist==0; j++) {      
				var pobj = listPages[j].listObj;
				    if (pobj.length > 0) {
				    	for (var k=0 ; k < pobj.length && f_exist==0 ; k++) {
				    		if (pobj[k].fdelete ==0 && getPropertyValueWithIndex("Field",j,k)==arr_outbound[i] ) {
				    			f_exist = 1;
				    		}
				    	}
				    }
				}	
	   		  	
	   		  	if (f_exist==0) {
	   		  		if (mywar=="") {mywar=lab_arr[76]+":\n       - "+arr_outbound[i]+"\n";} else {
	   		  			mywar += "       - "+arr_outbound[i]+"\n";
	   		  		}
	   		  	}
	   		}
	   		
	   		war_str += mywar;
	
		}
	   if (war_str!="") {
	   	alert(lab_arr[87]+"\n\n"+war_str);
	   }

//	   alert("code to run on save or change state - set inner html for hideloading and set visible");
		if (difstate == 1) {
			document.getElementById("progressBar").innerHTML = lab_arr[121]+"<br /><br />"+lab_arr[122]+".";
			document.getElementById("hideloading").style.display="";

		}else{
			document.getElementById("progressBar").innerHTML = lab_arr[123]+"<br /><br />"+lab_arr[122]+".";
	   		document.getElementById("hideloading").style.display="";

		}
		forSaveAs = f_as;
		var waiting = setTimeout("doXml()",1); // allow pause for previous line to complete action before continuing
		
}


function doXml() {
//	alert(forSaveAs);
		var xmlData = getXmlData(forSaveAs);
		document.frm.action = "popup.jsp";
		document.frm.xmlstr.value=xmlData; //send the xml data
		document.frm.target="";
		test_removetemp = 0; //do not delete temporary folder from the repository on the server
	   //window.open().document.writeln(xmlData);
		document.frm.submit();
		
}

//generate the xml data of all object and their properties relatedt to the current popup
function getXmlData(f_as)
{	
//alert(f_as);
	var xml_str 
	        ="<pop>"
	        +"<id>"+ckeckDefined(f_as,popId)+"</id>"
	        +"<desc>"+popDescription+"</desc>"
	        +"<initdesc>"+popInitialName+"</initdesc>"
	        +"<uniqueid>"+uniqueid+"</uniqueid>"
	        +"<tp>"+popType+"</tp>"
	        +"<tenant>"+tenantDbid+"</tenant>"
	        +"<call>"+popCallinglistId+"</call>"
	        +"<width>"+popWidth+"</width>"
	        +"<height>"+popHeight+"</height>"
	        +"<bgcolor>"+popBgColor+"</bgcolor>"
	        +"<reqcolor>"+reqBgColor+"</reqcolor>"
	        +"<state>"+popState+"</state>"
	        +"<filepath>"+popDownPath+"</filepath>"
	        +"<grid>"+gridCol+"</grid>"
	        +"<filedownpath>"+document.location.href.substr(0,document.location.href.lastIndexOf("/"))+"</filedownpath>";

	
    xml_str +="<objs>";  
    for (var i=0; i <popupObjects.length; i++) {
    	  
    	 if (f_as && i !=0 && popupObjects[i].id==9){continue;} 
    
    	 if (popupObjects[i].fdelete ==0) {
		    xml_str +="<obj><objid>"+popupObjects[i].id+"</objid><objdetid>"+ckeckDefined(f_as,popupObjects[i].det_id)+"</objdetid><props>";
		    
			for(var prop in popupObjects[i].propList) {
				xml_str +="<prop><name>"+popupObjects[i].propList[prop].name+"</name><id>"+popupObjects[i].propList[prop].id+"</id><detid>"+ckeckDefined(f_as,popupObjects[i].propList[prop].objPropId)+"</detid><val>"+popupObjects[i].propList[prop].value+"</val>";	
				if (popupObjects[i].propList[prop].type =="MULTI" && (!f_as || popType=='OUT' )) {
					xml_str +="<pvalues>";
					for (var  pvd in popupObjects[i].propList[prop].arrMulti ) {
						if (popupObjects[i].propList[prop].arrMulti[pvd].fdelete==0) {
							xml_str +="<pvalue><id>"+ckeckDefined(f_as,popupObjects[i].propList[prop].arrMulti[pvd].id)+"</id><code>"+popupObjects[i].propList[prop].arrMulti[pvd].valueCode+"</code><desc>"+popupObjects[i].propList[prop].arrMulti[pvd].valueDesc+"</desc><ord>"+popupObjects[i].propList[prop].arrMulti[pvd].valueOrder+"</ord></pvalue>";
						}
					}
					xml_str +="</pvalues>";	    		
				}
				xml_str +="</prop>";	
			}
			xml_str +="</props>";
			
			
			if (popupObjects[i].whereClauseArr) {
				if (popupObjects[i].whereClauseArr.length >0) {
					xml_str +="<wcs>";
					for (var j=0;j < popupObjects[i].whereClauseArr.length; j++) {
						var wc = popupObjects[i].whereClauseArr[j];
						
						var frompdv = wc.frompdv;
						if (frompdv.indexOf("#")>=0) {
							var str = frompdv.split("#");
							frompdv = popupObjects[str[0]].propList['Name'].value+"#"+popupObjects[str[0]].propList['TablesList'].arrMulti[str[1]].valueDesc;
						} else if (f_as) {
							for (var l=0; l < popupObjects[0].propList['TablesList'].arrMulti.length ; l++) {
								if (popupObjects[0].propList['TablesList'].arrMulti[l].id==frompdv && popupObjects[0].propList['TablesList'].arrMulti[l].fdelete==0 ) {
									frompdv=popupObjects[0].propList['Name'].value+"#"+popupObjects[0].propList['TablesList'].arrMulti[l].valueDesc;
									break;
								}
							}
						}
						
						
						
						
						
						var topdv = wc.topdv;
						if (topdv.indexOf("#")>=0) {
							var str = topdv.split("#");
							topdv = popupObjects[str[0]].propList['Name'].value+"#"+popupObjects[str[0]].propList['TablesList'].arrMulti[str[1]].valueDesc;
						}else if (f_as) {
							for (var l=0; l < popupObjects[0].propList['TablesList'].arrMulti.length ; l++) {
								if (popupObjects[0].propList['TablesList'].arrMulti[l].id==topdv && popupObjects[0].propList['TablesList'].arrMulti[l].fdelete==0 ) {
									topdv=popupObjects[0].propList['Name'].value+"#"+popupObjects[0].propList['TablesList'].arrMulti[l].valueDesc;
									break;
								}
							}
						}
						var toparam = wc.toparam;
						if (toparam.indexOf("#")>=0) {
							toparam = toparam.substr(0,toparam.indexOf("#"));
							toparam = popupObjects[toparam].propList['Name'].value+"#";
						} else if (f_as) {
							for (var k=0; k < popupObjects.length ; k++) {
								if(popupObjects[k].fdelete == 0 && popupObjects[k].id==10 && popupObjects[k].det_id==toparam)
							  	{
									toparam = popupObjects[k].propList['Name'].value+"#";
									break;
								}
								
							}
						}
						
						
						
						xml_str +="<wc><id>"+wc.id+"</id><frompdv>"+frompdv+"</frompdv><fromcol>"+wc.fromcol+"</fromcol><topdv>"+topdv+"</topdv><tocol>"+wc.tocol+"</tocol><toparam>"+toparam+"</toparam></wc>";	
					}
					xml_str +="</wcs>";						
				}
			}
			
			if (popupObjects[i].name=="Event") {
				xml_str +="<eventdbid>"+ckeckDefined(f_as,popupObjects[i].eventDbid)+"</eventdbid>"
				         +"<evtval>"+popupObjects[i].eventValue+"</evtval>"
				         +"<evtope>"+popupObjects[i].eventOperator.replace("<","&lt;")+"</evtope>";
				
				var myobj =    popupObjects[i].eventObjDbid;
				if (myobj.indexOf("#") >0 ) {
					var myobj_arr = myobj.split("#");
					myobj=listPages[myobj_arr[0]].page_name+"#"+myobj_arr[1];
				} else if (f_as) {
					var mymyobj = "";
					for (var k=0; k <listPages.length && mymyobj==""; k++) {      
					    var pobj = listPages[k].listObj;
				    	for (var l=0 ; l < pobj.length ; l++) {
				    		if (pobj[l].fdelete ==0 && pobj[l].det_id== myobj) {
				    			mymyobj = listPages[k].page_name+"#"+pobj[l].propList["HiddenIndex"].value;
				    			break;
				    		}
				    	}
					  
					}
					myobj = mymyobj;
					
				}
				
				
				
				xml_str +="<evtobj>"+myobj+"</evtobj>";
				
				
				var myobj =    popupObjects[i].actionObjDbid;
				if (myobj.indexOf("#") >0 ) {
					var myobj_arr = myobj.split("#");
					myobj=listPages[myobj_arr[0]].page_name+"#"+myobj_arr[1];
				}else if (f_as) {
					var mymyobj = "";
					for (var k=0; k <listPages.length && mymyobj==""; k++) {      
					    var pobj = listPages[k].listObj;
				    	for (var l=0 ; l < pobj.length ; l++) {
				    		if (pobj[l].fdelete ==0 && pobj[l].det_id== myobj) {
				    			mymyobj = listPages[k].page_name+"#"+pobj[l].propList["HiddenIndex"].value;
				    			break;
				    		}
				    	}
					  
					}
					myobj = mymyobj;
					
				}
				xml_str +="<actionobj>"+myobj+"</actionobj>";
				
				if (popupObjects[i].listValues) {
					
					xml_str +="<actionobjvalues>";
				
					for (var j =0;j < popupObjects[i].listValues.length;j++) {
						if (popupObjects[i].listValues[j].fdelete==0) {
							xml_str +="<actionobjvalue><valueCode>"+popupObjects[i].listValues[j].value+"</valueCode><dbid>"+ckeckDefined(f_as,popupObjects[i].listValues[j].id)+"</dbid></actionobjvalue>";
						}
					}
					xml_str +="</actionobjvalues>";
				}	           			         
			}
			
			
			
			xml_str+="</obj>";
		  } 
    }	              
	xml_str +="</objs>";         
	       
	if (listPages.length >0) {
		xml_str +="<pages>";
		for (var i=0; i <listPages.length ; i++) {
			xml_str +="<page>"
			        + "<id>"+ckeckDefined(f_as,listPages[i].page_id)+"</id>"
			        + "<name>"+listPages[i].page_name+"</name>"
			        + "<order>"+i+"</order>";
			        
		    var pobj = listPages[i].listObj;
		    if (pobj.length > 0) {
		    	xml_str +="<objs>";
		    	for (var j=0 ; j < pobj.length ; j++) {
		    		if (pobj[j].fdelete ==0) {
		    			xml_str +="<obj><objid>"+pobj[j].id+"</objid><objdetid>"+ckeckDefined(f_as,pobj[j].det_id)+"</objdetid><props>";
		    		
			    		for(var prop in pobj[j].propList) {
							xml_str +="<prop><name>"+pobj[j].propList[prop].name+"</name><id>"+pobj[j].propList[prop].id+"</id><detid>"+ckeckDefined(f_as,pobj[j].propList[prop].objPropId)+"</detid>";
							
							if (pobj[j].propList[prop].name == "Datasource" && pobj[j].propList[prop].value.indexOf("#") >0 &&  (!f_as || popType=='OUT' )) {
								var str = pobj[j].propList[prop].value.split("#");
								
								xml_str += "<val>"+popupObjects[str[0]].propList['Name'].value+"#"+popupObjects[str[0]].propList['TablesList'].arrMulti[str[1]].valueDesc+"</val>";		
							}
							else if (pobj[j].propList[prop].name != "Parameter" ) 
							{
								if ( f_as && popType=='IN' && (pobj[j].propList[prop].name == "Datasource"  ||pobj[j].propList[prop].name == "Field" )) {
									xml_str += "<val></val>";	
						    	} else if(pobj[j].propList[prop].name == "HiddenIndex") {
						    		xml_str += "<val>"+j+"</val>";
						    	}
						    	else {
						    		
						    		if (f_as && popType=='OUT' &&   pobj[j].propList[prop].name == "Datasource" ) {
						    			if 	(pobj[j].propList[prop].name == "Datasource" ) {
						    				var myval = "";
				    						for (var l=0; l < popupObjects[0].propList['TablesList'].arrMulti.length ; l++) {
												if (popupObjects[0].propList['TablesList'].arrMulti[l].id==pobj[j].propList[prop].value && popupObjects[0].propList['TablesList'].arrMulti[l].fdelete==0 ) {
													myval=popupObjects[0].propList['Name'].value+"#"+popupObjects[0].propList['TablesList'].arrMulti[l].valueDesc;
													break;
												}
											}
										
												
										
						    				xml_str += "<val>"+myval+"</val>";	
						    			
						    			} 
						    		}
						    		else {
						    			xml_str += "<val>"+pobj[j].propList[prop].value+"</val>";	
						    		}
						    	}
						    } 
						    
						   
						    if (pobj[j].propList[prop].name == "Parameter" ) {
						    		var val = pobj[j].propList[prop].value;
									if (val.indexOf("#")>=0) {
										val = val.substr(0,val.indexOf("#"));
						
										val = popupObjects[val].propList['Name'].value+"#";
									} else if (f_as) {
									
										var myval = "";
					    				for (var k=0; k < popupObjects.length ; k++) {
											if(popupObjects[k].fdelete == 0 && popupObjects[k].id==10 && popupObjects[k].det_id==val)
										  	{
												
												val = popupObjects[k].propList['Name'].value+"#";
												break;
											}
											
										}
									}
									
									xml_str += "<val>"+val+"</val>";	
									
							}
						    
						    
						     
						     
						     if (pobj[j].propList[prop].type =="MULTI") {
						       xml_str +="<pvalues>";
						       
						    	for (var  pvd in pobj[j].propList[prop].arrMulti) {
						    		if (pobj[j].propList[prop].arrMulti[pvd].fdelete==0) {
						    			xml_str +="<pvalue><id>"+ckeckDefined(f_as,pobj[j].propList[prop].arrMulti[pvd].id)+"</id><code>"+pobj[j].propList[prop].arrMulti[pvd].valueCode+"</code><desc>"+pobj[j].propList[prop].arrMulti[pvd].valueDesc+"</desc></pvalue>";
						    		}
						    	}
						    	xml_str +="</pvalues>";
						    		
						    }
						    
						    xml_str +="</prop>";	
						}
						xml_str +="</props></obj>";
					}

		    	}
		    	xml_str +="</objs>";
		    }
		    xml_str +="</page>";		
		}
		xml_str +="</pages>";	
	}       
	xml_str +="</pop>";
	return xml_str;
}

//generate neccesary information to connect to a database in xml format
function getXMLDBConn(db_index , tab_index) {
  var xml_str ="<obj><objid>"+popupObjects[db_index].id+"</objid><objdetid>"+popupObjects[db_index].det_id+"</objdetid><props>";
		    		
  for(var prop in popupObjects[db_index].propList) {
		xml_str +="<prop><id>"+popupObjects[db_index].propList[prop].id+"</id><detid>"+popupObjects[db_index].propList[prop].objPropId+"</detid><val>"+popupObjects[db_index].propList[prop].value+"</val>";	
	    
	    
	    if (tab_index>=0) {
	    	if (popupObjects[db_index].propList[prop].type =="MULTI") {
	       		xml_str +="<pvalue><id>"+popupObjects[db_index].propList[prop].arrMulti[tab_index].id+"</id><code>"+popupObjects[db_index].propList[prop].arrMulti[tab_index].valueCode+"</code><desc>"+popupObjects[db_index].propList[prop].arrMulti[tab_index].valueDesc+"</desc></pvalue>";
	    	}
	    }
    	xml_str +="</prop>";	
   }
   xml_str +="</props></obj>";
	
   return 	xml_str;		
}

//see a preview of the popup ==> menu= 8
function viewPopup() {
  doMouseOut(dynmenu1,0);
  var xmlData = getXmlData();
  document.frm.xmlstr.value=xmlData;
  //window.open().document.writeln(xmlData);
  document.frm.action="scriptgenerator.jsp";
  window.open("", 'previewwindow','scrollbars=yes,menubar=no,height='+getPopHeight()+',width='+getPopWidth()+',resizable=yes,toolbar=no,status=no');
  document.frm.target="previewwindow";
  document.frm.submit();
}

function goMainDiv() {
    if(validCharacters(document.getElementById("introdiv_popname"))){
      return;
    }
	var val = cleanVal(document.getElementById("introdiv_popname").value);
	
	document.getElementById("introdiv_popname").value = val;
	if ( val == "") {
		alert(lab_arr[20]);
		document.getElementById("introdiv_popname").focus();
		return;	
	}
	
	//check if popup with same name already exist
	var fexixst_dbid = ckeckPopUniqueId(document.getElementById("introdiv_popname").value,"0");
	
	if (fexixst_dbid !="0") {
		alert(lab_arr[52]);
		document.getElementById("introdiv_popname").focus();
		document.getElementById("introdiv_popname").select();
		return;
	}
	
	
	setPopDescription(document.getElementById("introdiv_popname").value);
//	document.getElementById("popname").value = getPopDescription();
	if (document.frm.poptype[0].checked) {popType = document.frm.poptype[0].value;}
	if (document.frm.poptype[1].checked) {popType = document.frm.poptype[1].value;}
	document.getElementById("introdiv").style.display="none";
	fillProperties(-2);
}
		
function showMulti(x_pos , y_pos) {
	var str = "<table border=0 width='100%' cellspacing=0 cellpadding=0>"
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[10]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupWin()'></td></tr></table></td></tr>"
			
			+"<tr><td class=\"pUpContainer\" style='padding-top:2px;'><table border=0 cellspacing=0 cellpadding=0>"
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class='tabheader2'><td><img src='../../img/popup/add.gif' border=0 align='absmiddle'onclick='addRowTablePdv(\"\",\"\",\"\",\"\")'>&nbsp;"+lab_arr[7]+"</td></tr></table></td></tr>"
			
	        + "<tr><td><div class=\"pUpInnerBorder\" style='width:440px;'><div  style='overflow:auto; height:200px'><table border='0' cellspacing=1 cellpadding=2 width='420' id='tablepdv'>"
	        + "<tr class='tabheader2'><td style='padding-right:12px;width:128px;'>"+lab_arr[18]+"</td><td style='padding-right:12px;width:128px;'>"+lab_arr[11]+"</td><td align='right' style='width:67px;'>"+lab_arr[12]+"<input class=\"formfields\" type='radio' name='default' /></td><td>"+lab_arr[8]+"</td></tr>"
	        + "</table></div></div></td></tr></table></tr></td>";
	        
	    str+= "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" type='button' value='"+lab_arr[9]+"' onclick='fillPdv(), saveChangeState()'><input class=\"formfields\" id='closeMulti' type='button' value='"+lab_arr[24]+"' onclick='hidePopupWin()'></td></tr>"
	        + "</table></td></tr></table>";
	        
	showPopupWin(x_pos - 460,y_pos,"460","",str);
	
	var objectSelected = listPages[current_div_index].listObj[current_div_obj_index].propList['Values'].arrMulti;
	for (var i = 0 ; i < objectSelected.length ; i++) {
		if(objectSelected[i].fdelete==0) {
			var fdefault = "0";
	
			if (listPages[current_div_index].listObj[current_div_obj_index].propList['Values'].value == objectSelected[i].valueCode) {
				fdefault ="1";
			}
			addRowTablePdv(objectSelected[i].id,objectSelected[i].valueCode,objectSelected[i].valueDesc,fdefault);
		}	
	}
	document.getElementById("closeMulti").focus();
	
}

function showDatasource(x_pos , y_pos) {

	var str ="<table border=0 width='100%' cellspacing=0 cellpadding=0>"
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[13]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupWin()'></td></tr></table></td></tr>"
			
			+ "<tr><td class=\"pUpContainer\"><table border=0 cellspacing=0 cellpadding=0>"
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class='tabheader2'><td style='padding-left:5px;'>"+lab_arr[14]+"</td><td><div id='tab_list'></td></tr>"
	        + "<tr class='tabheader2'><td style='padding-left:5px;'>"+lab_arr[21]+"</td><td valign=top>"
	        + "<input class=\"formfields\" type=text size='34' id=\"labfield\"/ disabled><input class=\"formfields\" type='button' value='...' onclick='getFieldList(document.getElementById(\"tab_list\").firstChild.value,document.getElementById(\"lstfield\"),\"labfield\")'></td></tr>"
			+ "</table></td></tr>"
			
			+"<tr><td><div class=\"pUpInnerBorder\" style='width:282px;'><div id='lstfield' style='overflow: auto; height:100px;'></div></div></td></tr></table></td></tr>"
			
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" type='button' value='"+lab_arr[9]+"' onclick='fillDataSource(), saveChangeState()'><input class=\"formfields\" id='closeDatasource' type='button' value='"+lab_arr[24]+"' onclick='hidePopupWin()'></td></tr>"
	        + "</table></td></tr></table>";
	  
	  showPopupWin(x_pos - 300,y_pos,"300","",str);
	
	  var obj_tab_id = getPropertyValue("Datasource");
	  var field = getPropertyValue("Field");
	  
	  var tables_str = "<select class=\"formfields\" style='width:220px;' onchange='emptyDatasource()'><option class=\"formfields\" value=''></option>";
	  
	  
	  for (var i=0 ; i <popupObjects.length;i++) {
	  	if(popupObjects[i].fdelete == 0 && popupObjects[i].id==9)
	  	{
	  		var lst = popupObjects[i].propList['TablesList'].arrMulti;
		  	for (var j=0 ; j < lst.length ; j++) {
		  		if (lst[j].fdelete==0) {
		  			var val = (lst[j].id=="")?(i+"#"+j):lst[j].id;
		  			tables_str +="<option value='"+val+"'>"+popupObjects[i].propList['Name'].value+"."+lst[j].valueDesc+"</option>";
		  		}
		  	}
		 }
	  }	  
	  tables_str +="</select>";

      document.getElementById("tab_list").innerHTML = tables_str;
	  
      document.getElementById("tab_list").firstChild.value=obj_tab_id;	  
	  document.getElementById("labfield").value=field;
	  document.getElementById("closeDatasource").focus();
	  
}

function getTableIndexes(val) {
	
	if (val=="") { return {x: -1,y: -1}; }
	
	if (val.indexOf("#")>0) { return {x: val.substr(0,val.indexOf("#")),y: val.substr(val.indexOf("#")+1)}; }
	
	for (var i=0; i < popupObjects.length ; i++) {
		if(popupObjects[i].fdelete == 0 && popupObjects[i].id==9)
	  	{
			for (var j=0; j < popupObjects[i].propList['TablesList'].arrMulti.length ; j++) {
				if (popupObjects[i].propList['TablesList'].arrMulti[j].id==val && popupObjects[i].propList['TablesList'].arrMulti[j].fdelete==0 ) {
					return {x:i,y:j};
				}
			}
		}
		
	}
	
	return  {x: -1,y: -1};
	
}

function fillDataSource() {
	setPropertyValue("Datasource",document.getElementById("tab_list").firstChild.value);
	setPropertyValue("Field",document.getElementById("labfield").value);
	
	var val = getPropertyValue("Name"); 
	
	if (val=="" || val == listPages[current_div_index].listObj[current_div_obj_index].description ) {
		setPropertyValue("Name",processLabel(getPropertyValue("Field")));
		
		redrawObject(-1,-1);
	}
	fillProperties(current_div_obj_index);
	hidePopupWin();
}

function emptyDatasource() {
	document.getElementById("labfield").value = "";
	document.getElementById("lstfield").innerHTML = "";
	
}

function addRowTablePdv(id,code,description,fdefault) {
	
	var tab = document.getElementById("tablepdv");	
	var row_index = tab.children.length -1;
	
	var myNewRow = tab.insertRow();
	var td1 = document.createElement("<TD></TD>");
		var input = document.createElement("<input class=\"formfields\" type='text'   value='"+code+"' onBlur='validCharacters(this)'/>");
		td1.appendChild(input);
		var input = document.createElement("<input type='hidden'   value='"+id+"' />");
		td1.appendChild(input);
		
		
	var td2 = document.createElement("<TD></TD>");
		var input = document.createElement("<input class=\"formfields\" type='text'   value='"+description+"' onBlur='validCharacters(this)' />");
		td2.appendChild(input);
	
	var td3 = document.createElement("<TD align='right'></TD>");
	   var input = document.createElement("<input class=\"formfields\" type='radio' name='default'  "+((fdefault==1)?"checked":"")+"/>");
	   td3.appendChild(input);
	   
	var td4 = document.createElement("<TD align='right' style='padding-right:10px'></TD>");
		var img = document.createElement("<img src='../../img/popup/delete2.gif' border=0 onclick='deletePdv(this);'/>");
		td4.appendChild(img);
	
	var td5 = document.createElement("<TD ></TD>");
		var img = document.createElement("<input type='hidden'   value='"+code+"'/>");
		td5.appendChild(img);
	   
	myNewRow.appendChild(td1);
	myNewRow.appendChild(td2);
	myNewRow.appendChild(td3);
	myNewRow.appendChild(td4);
	myNewRow.appendChild(td5);
	
}

function fillPdv() {
	var tab = document.getElementById("tablepdv").rows;	
	
	for (var i = 1 ; i < tab.length ; i++) {
	
		for (var j=1; j<tab.length;j++) {
			if (j!=i) {
				if (tab[i].cells[0].children(0).value == tab[j].cells[0].children(0).value) {
					alert(lab_arr[80]);
					tab[i].cells[0].children(0).focus();
					tab[i].cells[0].children(0).select();
					return;
				}
				if (tab[i].cells[1].children(0).value == tab[j].cells[1].children(0).value) {
					alert(lab_arr[81]);
					tab[i].cells[1].children(0).focus();
					tab[i].cells[1].children(0).select();
					return;
				}
			}
		}
	}
	
	
	
	var arr = listPages[current_div_index].listObj[current_div_obj_index].propList['Values'].arrMulti;
	arr= new Array();
	
	listPages[current_div_index].listObj[current_div_obj_index].propList['Values'].value = "";
	
	
	
	
	for (var i = 1 ; i < tab.length ; i++) {
	
		for (var j=1; j<tab.length;j++) {
			if (j!=i) {
				if (tab[i].cells[0].children(0).value == tab[j].cells[0].children(0).value) {
					alert(lab_arr[80]);
					tab[i].cells[0].children(0).focus();
					tab[i].cells[0].children(0).select();
					return;
				}
				if (tab[i].cells[1].children(0).value == tab[j].cells[1].children(0).value) {
					alert(lab_arr[81]);
					tab[i].cells[1].children(0).focus();
					tab[i].cells[1].children(0).select();
					return;
				}
			}
		}
	
		var obj = addPdv(tab[i].cells[0].children(1).value,tab[i].cells[0].children(0).value,tab[i].cells[1].children(0).value);
		
		/*affect the action elements*/
		var val = listPages[current_div_index].listObj[current_div_obj_index].det_id;
		
		if (val=="") {
			val = current_div_index+"#"+current_div_obj_index;
		}
		for (var k=0; k < popupObjects.length ; k++) {
			if(popupObjects[k].fdelete == 0 && popupObjects[k].id==22){
				if (popupObjects[k].actionObjDbid==val) {
					if (popupObjects[k].propList["ActionType"].value == '136') {//fill
						for (var j=0; j< popupObjects[k].listValues.length;j++) {
							if (popupObjects[k].listValues[j].value== tab[i].cells[4].children(0).value) {
								popupObjects[k].listValues[j].value = tab[i].cells[0].children(0).value;
								break;
							}
						}
					}
				}
				
				if (popupObjects[k].eventObjDbid==val && popupObjects[k].eventValue==tab[i].cells[4].children(0).value) {
					popupObjects[k].eventValue=tab[i].cells[0].children(0).value;
				}
			}
		}
				
		if (tab[i].cells[2].children(0).checked) {
			listPages[current_div_index].listObj[current_div_obj_index].propList['Values'].value = 	tab[i].cells[0].children(0).value;
		}
		arr[arr.length] = obj;
	}
	listPages[current_div_index].listObj[current_div_obj_index].propList['Values'].arrMulti = arr;
	hidePopupWin();
	redrawObject(-1,-1);
}

function addPdv(id,code,desc) {
	var obj = new Object();
	obj.id = id;
	obj.valueCode = code;
	obj.valueDesc = desc;
	obj.fdelete	  = 0;
	return obj;
	
}

function setPopDescription(val) {
	popDescription = val;
	
	document.getElementById("popdisplay").innerHTML = popDescription;
//	document.getElementById("popname").value = popDescription;
}

function savePopDescription(obj) {
	dragObject = null;
	diffTop	   = 0;
	diffLeft   = 0;
	var val = obj.value;
	if(validCharacters(obj)){
	     return;
	   }	
	val = cleanVal(val);
	obj.value = val;

	if (val=="") {
		alert(lab_arr[20]);
		obj.focus();
		return;
	}
	
	//check if popup with same name already exist
	var fexixst_dbid = ckeckPopUniqueId(val,(popId=="")?"0":popId);
	
	if (fexixst_dbid !="0") {
		alert(lab_arr[52]);
		obj.focus();
		obj.select();
		return;
	}
	
	setPopDescription(val);
	fillProperties(-2);
	saveChangeState();
}

function getPopDescription() {
	return popDescription;
}

function setPopWidth(val) {
	if (val=="") popWidth = pop_width;
	else
		popWidth = val;
	
	for (var i=0;i<listPages.length;i++) {
			drawRectCnv(listPages[i].rect);	
	}
}

function getPopWidth() {
	return popWidth;
}

function setPopHeight(val) {
	if (val=="") popHeight = pop_height;
	else
		popHeight = val;
	
	for (var i=0;i<listPages.length;i++) {
			drawRectCnv(listPages[i].rect);	
	}
		
}

function savePopHeight(obj) {
    dragObject = null;
	diffTop	   = 0;
	diffLeft   = 0;
    if (IsPixels(obj)) {
		if (obj.value != popHeight) {
			saveChangeState();
		}
		setPopHeight(obj.value);
	}
}

function savePopWidth(obj) {
   	dragObject = null;
	diffTop	   = 0;
	diffLeft   = 0;
	if (IsPixels(obj)) {
		if (obj.value != popWidth) {
			saveChangeState();
		}
		setPopWidth(obj.value);
	}
}


function getPopHeight() {
	return popHeight;
}

function setPopBgColor(val) {
	if (val=="") popBgColor = pop_bgcolor;
	else
		popBgColor = val;
		
	document.getElementById("tdpopbg").style.background = popBgColor;
			
}

function getPopBgColor() {
	return popBgColor;
}

function setReqBgColor(val) {
	if (val=="") reqBgColor = req_bgcolor;
	else
		reqBgColor = val;
		
	document.getElementById("tdreqbg").style.background = reqBgColor;			
}

function getReqBgColor() {
	return reqBgColor;
}

function setPopState(obj){
//	saveChangeState();
 	if(obj.checked) {
		popState = 1;	
		difstate = 1;
		savePopup();
	}else{
		if (initialPopName != "" && initialPopName != getPopDescription()) {
			var actcheck = confirm (lab_arr[117]+"\n\n"+lab_arr[118]+"\n\n'"+initialPopName+"'\n\n\n"+lab_arr[119]+"\n"+lab_arr[120]+"    \n"+lab_arr[124]);
			if (!actcheck) {
				obj.checked = true;
				return false;
			}else{
//				popState = 0;
				initialPopName = getPopDescription();
				needToSaveChanges = false;
//				savePopup();
//				return true;
			}
		}
		if (needToSaveChanges) {
			var actcheck = confirm (lab_arr[125]+"\n"+lab_arr[126]+"\n\n("+lab_arr[127]+")");
			if (!actcheck) {
				obj.checked = true;
				return false;
			}else{
//				popState = 0;
//				savePopup();
//				return true;
			}
		}
		popState = 0;
		difstate = 1;
		savePopup();
	}
}

function getPopState(){
   return popState;
}

function showColorPannel(val) {
	
	var x_pos2 = (document.getElementById("botDivContent").offsetWidth);
	var y_pos2 = (document.getElementById("maindiv").offsetHeight);
	
	var x_pos3 = (document.getElementById("maindiv").offsetWidth);
	
	var x_pos = window.event.clientX + document.body.scrollLeft - document.body.clientLeft-250;
	var y_pos = window.event.clientY + document.body.scrollTop  - document.body.clientTop;
	
	var color_arr = new Array('00','33','66','99','CC','FF');
	var color_str = "<table style='background-color:#f2f2f2'>";
	var max_cols = 15;
	var counter = 0;
	for (var i=0; i < color_arr.length ; i++)
		for (var j=0; j < color_arr.length ; j++)
			for (var k=0; k < color_arr.length ; k++) {
				if (counter==0) color_str +="<tr>";
				color_str+="<td style='width:15;height:15;' style='background:"+"#"+color_arr[i]+color_arr[j]+color_arr[k]+";' onclick='doMouseClickColor(this); saveColor(\""+val+"\")' onmouseover='doMouseOverColor(this)'></td>";
				counter++;
				if (counter==max_cols) { counter=0;color_str +="</tr>";}
				
			}
	
	color_str +="</tr></table>";
	
	
	
	var html_str = "<table border=0 cellspacing=0 cellpadding=0>"
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[16]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupWin()'></td></tr></table></td></tr>"
			
			+ "<tr><td class=\"pUpContainer\"><table border=0 cellspacing=0 cellpadding=0>"
	        + "<tr><td><div class=\"pUpInnerBorder\">"+color_str+"</div></td></tr>"
			
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2></tr><td align='left'><div class=\"pUpBorderOnly\" style='width:60px; height:15px; margin-left:5px; margin-right:5px;' id='colortd'></div></td><td align='center' style='color:#52636D; font-size:14px;'>#&nbsp;<input type='text' id='colorinput' size=8  onKeyPress='doEnter(this,event)' onblur='fillColor(this)' /></td><td align='right'><div class=\"pUpBorderOnly\" style='width:60px; height:15px; margin-left:5px; margin-right:5px;' id='colortdchoose'></div></td></tr></table></td></tr>"
			+ "</table></td></tr>"
			
	        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td width='50px'></td><td align='center'><input id='closeColorPanel' type='button' value='"+lab_arr[24]+"' onclick='hidePopupWin()'></td><td width='50px' align='right'><input id='colsave' type='button' value='"+lab_arr[17]+"' onclick='saveColor(\""+val+"\");' style='display:none; margin-right:10px;'></td></tr>"
	        + "</table></td></tr>"
	        + "</table>";
	
	
	
	
	
	
	
	if (val=='popBgColor') {
		showPopupWin(x_pos2-305,y_pos2-413,"","",html_str);
		document.getElementById("colorinput").value = getPopBgColor();
		document.getElementById("colortd").style.background = getPopBgColor();
		document.getElementById("colortdchoose").style.background = getPopBgColor();
		
	}
	
	if (val=='FontColor') {
		showPopupWin(x_pos3-425,y_pos2-413,"","",html_str);
		document.getElementById("colorinput").value = getPropertyValue('FontColor');
		document.getElementById("colortd").style.background = getPropertyValue('FontColor');
		document.getElementById("colortdchoose").style.background = getPropertyValue('FontColor');
	}
	
	if (val=='Bkground') {
		showPopupWin(x_pos3-425,y_pos2-413,"","",html_str);
		document.getElementById("colorinput").value = getPropertyValue('Bkground');
		document.getElementById("colortd").style.background = getPropertyValue('Bkground');
		document.getElementById("colortdchoose").style.background = getPropertyValue('Bkground');
	}
	
	if (val=='reqBgColor') {
		showPopupWin(x_pos2-305,y_pos2-413,"","",html_str);
		document.getElementById("colorinput").value = getReqBgColor();
		document.getElementById("colortd").style.background = getReqBgColor();
		document.getElementById("colortdchoose").style.background = getReqBgColor();	
	}	
	if (val=='Border') {
		showPopupWin(x_pos3-425,y_pos2-413,"","",html_str);
		document.getElementById("colorinput").value = getPropertyValue('Border');
		document.getElementById("colortd").style.background = getPropertyValue('Border');
		document.getElementById("colortdchoose").style.background = getPropertyValue('Border');
	}	
	document.getElementById("closeColorPanel").focus();
}

function doMouseClickColor(obj) {
	obj.className="mouseclickcolor";

	document.getElementById("colortd").style.background = obj.style.background;
	if (document.getElementById("colorinput")) {
		document.getElementById("colorinput").value = obj.style.background;
	}
	document.getElementById("colortdchoose").style.background = obj.style.background;	
}

function doMouseOverColor(obj) {
	obj.className="mouseovercolor";

	document.getElementById("colortd").style.background = obj.style.background;
}

function fillColor(obj) {
	if (IsRGB(obj)) {
		if (document.getElementById("colorinput").value != getPopBgColor()) {
			document.getElementById("colortd").style.background = obj.value;
			document.getElementById("colortdchoose").style.background  = obj.value;
			document.getElementById("colsave").style.display = "";
			document.getElementById("colsave").focus();
		}
	}else{
	alert(lab_arr[77]);
	document.getElementById("colorinput").value = getPopBgColor();
	document.getElementById("colorinput").focus();
	}
}

function doMouseOverLinkColor(obj) {
	obj.className="mouseoverlinkcolor";
}

function saveColor(val) {
	
		saveChangeState();

	if (val=='reqBgColor') {
		//setReqBgColor(document.getElementById("colortdchoose").style.background);
		setReqBgColor(document.getElementById("colorinput").value);
		hidePopupWin();
		for (var i=0 ; i < listPages.length ; i++) {
			for (var j=0 ; j < listPages[i].listObj.length ; j++) {
				redrawObject(i,j);
			}
		}
	}
	else {
	

		if (IsRGB(document.getElementById("colorinput"))) {
	
			if (val=='popBgColor') {
				setPopBgColor(document.getElementById("colorinput").value);
				hidePopupWin();
				
				for (var i = 0; i < listPages.length ; i++) {
					listPages[i].page_divbg.style.background= getPopBgColor() ;
				}
				
					
			}
			if (val=='FontColor') {
				
				if (document.getElementById("colorinput").value =="") {
					alert(lab_arr[79]);
					document.getElementById("colorinput").focus();
					return;
				}
				
				setPropertyValue('FontColor',document.getElementById("colorinput").value);
				fillProperties(current_div_obj_index);
				redrawObject(-1,-1);
				hidePopupWin();
			}
			
			if (val=='Bkground') {
				setPropertyValue('Bkground',document.getElementById("colorinput").value);
				fillProperties(current_div_obj_index);
				redrawObject(-1,-1);
				hidePopupWin();
			}
			
			if (val=='Border') {
			    setPropertyValue('Border',document.getElementById("colorinput").value);
				fillProperties(current_div_obj_index);
				redrawObject(-1,-1);
				hidePopupWin();
	        }	
			
			
			
		}
	}
}

// control for resizing elements to fit screen and general layout //

function skinFit() {

	var mainWidth = document.getElementById("maindiv").offsetWidth;
	var mainHeight = document.getElementById("maindiv").offsetHeight;
	
	var menuTopWidth = document.getElementById("menuDiv").offsetWidth;
	var menuTopHeight = document.getElementById("menuDiv").offsetHeight;
	
	var pagesWidth = document.getElementById("pages").offsetWidth;
	var pagesHeight = document.getElementById("pages").offsetHeight;
	
	var pagesheadHeight = document.getElementById("pageshead").offsetHeight;
	
	var pagedivtabHeight = document.getElementById("pagedivtab").offsetHeight;
	
	var propDivWidth = document.getElementById("propDiv").offsetWidth;
	var propDivHeight = document.getElementById("propDiv").offsetHeight;
	
	var menuBotWidth = document.getElementById("menuBotDiv").offsetWidth;
	var menuBotHeight = document.getElementById("menuBotDiv").offsetHeight;
	
	var botDivContentWidth = document.getElementById("botDivContent").offsetWidth;
		
	var gridoptionsWidth = document.getElementById("gridoptions").offsetWidth;
	var gridoptionsHeight = document.getElementById("gridoptions").offsetHeight;
	
	var gridoptionsInnerWidth = document.getElementById("gridoptionsInner").offsetWidth;
	
	var toolbarTableWidth = document.getElementById("toolbarTable").offsetWidth +10;
	var activelockWidth = document.getElementById("activelock").offsetWidth + 30;
	var helpbarWidth = document.getElementById("helpbar").offsetWidth;
	
	document.getElementById("activelock").style.left = (toolbarTableWidth + 30) + "px";
	
	var pagelistContent = (pagesheadHeight + pagedivtabHeight) + 15;
	
	if (document.getElementById("pdata") != null && document.getElementById("pdata").offsetHeight > pagelistContent) {
		var contentHeight = document.getElementById("pdata").offsetHeight;
	}else{
		var contentHeight = pagelistContent;
	}
	
	var topBarContent = toolbarTableWidth + activelockWidth;
	var bottomBarContent = (botDivContentWidth + gridoptionsWidth) + 20;
	
	if (mainWidth < topBarContent || mainWidth < bottomBarContent ){ // if toolbars (top or bottom) are wider than browser window fix width to widest toolbar
		if (topBarContent > bottomBarContent) {
			mainWidth = topBarContent;
		}else{
			mainWidth = bottomBarContent;
		}
	}
	if (mainHeight < contentHeight + 119){
		mainHeight = contentHeight + 119;
	}
	
	
	document.getElementById("menuDiv").style.width = mainWidth + "px";
	document.getElementById("helpbar").style.left = (mainWidth - helpbarWidth - 5) + "px";
	
	document.getElementById("pages").style.height = ((mainHeight - pagesheadHeight) - 119) + "px";
	document.getElementById("pages").style.top = (pagesheadHeight + 62) + "px";
	
	document.getElementById("pagesDivOuter").style.height = (mainHeight - 119) + "px";
	document.getElementById("pagesDivOuter").style.width = (mainWidth - 350) + "px";
	document.getElementById("propDiv").style.height = (mainHeight - 119) + "px";
	document.getElementById("propDiv").style.left = (mainWidth - 200) + "px";
	
	document.getElementById("menuBotDiv").style.top = (mainHeight - 57) + "px";
	document.getElementById("menuBotDiv").style.width = mainWidth + "px";
	
	if(lab_state=="0"){
		document.getElementById("disablePropDiv").style.height = (mainHeight - 119) + "px";
		document.getElementById("disablePropDiv").style.left = (mainWidth - 200) + "px";
	  
		document.getElementById("disableMenuBotDiv").style.top = (mainHeight - 57) + "px";
		document.getElementById("disableMenuBotDiv").style.width = mainWidth + "px";
		
		document.getElementById("hidetools").style.width = mainWidth + "px";
	}
	
	document.getElementById("gridoptions").style.top = (mainHeight - 49) + "px";
	document.getElementById("gridoptions").style.left = (mainWidth - gridoptionsWidth - 5) + "px";
	
	document.getElementById("gridtitle").style.width = (gridoptionsInnerWidth - 5) + "px";
	
//	document.getElementById("xyDiv").style.top = (mainHeight - xydivHeight - 15) + "px";
//	document.getElementById("xyDiv").style.left = (mainWidth - xydivWidth - 15) + "px";
	
	document.getElementById("introdiv").style.height = mainHeight + "px";
	document.getElementById("introdiv").style.width = mainWidth + "px";
	document.getElementById("introback").style.height = mainHeight + "px";
	document.getElementById("introback").style.width = mainWidth + "px";
	document.getElementById("introfront").style.height = mainHeight + "px";
	document.getElementById("introfront").style.width = mainWidth + "px";
	document.getElementById("popupallwin").style.height = mainHeight + "px";
	document.getElementById("popupallwin").style.width = mainWidth + "px";
	
	
	
	var pagesDivWidth = document.getElementById("pagesDivOuter").offsetWidth;
	var pagesDivHeight = document.getElementById("pagesDivOuter").offsetHeight;
	
	
	if (listPages.length > 0) {
		var pw = popWidth.replace(/px/,"");
		if (pw > 1024 && pw > pagesDivWidth) {
			page_div_width = pw;     //sets work area width to popup width
		}else{
			if (pagesDivWidth > 1024) {
				page_div_width = pagesDivWidth;     //sets work area width to available screen space
			}else{
				page_div_width = 1024;     //sets work area width to default size
			}
		}
		var ph = popHeight.replace(/px/,"");
		if (ph > 1500 && ph > pagesDivHeight) {
			page_div_height = ph;     //sets work area height to popup height
		}else{
			if (pagesDivHeight > 1500) {
				page_div_height = pagesDivHeight;     //sets work area height to available screen space
			}else{
				page_div_height = 1500;     //sets work area height to default size
			}
		}
		
		for (var i = 0; i < listPages.length ; i++) {
			listPages[i].page_div.style.width=page_div_width;
			listPages[i].page_div.style.height=page_div_height;
			listPages[i].page_divbg.style.width=page_div_width;
			listPages[i].page_divbg.style.height=page_div_height;
		}
	}
	var horScrollHeight = ((document.getElementById("pagesDivOuter").offsetHeight)-(document.getElementById("pagesDivOuter").clientHeight));
	var verScrollWidth = ((document.getElementById("pagesDivOuter").offsetWidth)-(document.getElementById("pagesDivOuter").clientWidth));
	document.getElementById("deleteBin").style.top = (mainHeight-horScrollHeight-96) + "px";;
	document.getElementById("deleteBin").style.left =(mainWidth-verScrollWidth-239) + "px";

}

function helpFit() {
	var helpbodyWidth = document.getElementById("helpbody").offsetWidth;
	var helpbodyHeight = document.getElementById("helpbody").offsetHeight;
	
	var helpTitleWidth = document.getElementById("helpTitle").offsetWidth;
	var helpTitleHeight = document.getElementById("helpTitle").offsetHeight;
	
	var helpMenusWidth = document.getElementById("helpMenus").offsetWidth;
	var helpMenusHeight = document.getElementById("helpMenus").offsetHeight;
	
	var helpFooterWidth = document.getElementById("helpFooter").offsetWidth;
	var helpFooterHeight = document.getElementById("helpFooter").offsetHeight;
	
	
	var helpSearchEntryHeight = document.getElementById("helpSearchEntry").offsetHeight;
	var helpSearchEntryWidth = document.getElementById("helpSearchEntry").offsetWidth;
	
	var hSearch2Width = document.getElementById("hSearch2").offsetWidth;
	
	document.getElementById("hSearch1").style.height = (helpSearchEntryHeight) + "px";
	document.getElementById("hSearch2").style.height = (helpSearchEntryHeight - 2) + "px";
	document.getElementById("hSearch2").style.marginLeft = (helpSearchEntryWidth) + "px";
	document.getElementById("hSearch1").style.width = (helpSearchEntryWidth + hSearch2Width) + "px";
	
	document.getElementById("helpContainer").style.height = (helpbodyHeight-7) + "px";
	if(helpbodyHeight - (helpTitleHeight + helpMenusHeight + helpFooterHeight)>29){
		document.getElementById("helpMain").style.height = ((helpbodyHeight - (helpTitleHeight + helpMenusHeight + helpFooterHeight))-29) + "px";
	}else{
		document.getElementById("helpMain").style.height = 0 + "px";
	}
	document.getElementById("btPreviou").style.top = (helpTitleHeight + helpMenusHeight + 7) + "px";
	document.getElementById("btPreviou").style.left = ((document.getElementById("helpMain").clientWidth - document.getElementById("btPreviou").offsetWidth)+7) + "px";
}


// end control for resizing elements to fit screen and general layout //

// mouseover change class name - for toolbar //

function toolbarMouseOver(obj){
	obj.className = obj.className.replace(/_off/,"_on");
}

function toolbarMouseOut(obj){
	obj.className = obj.className.replace(/_on/,"_off");
}

function gridoptMouseOver(obj){
	if(obj.className != "gridoptions_on") {
		obj.style.backgroundColor = "#CDF9D7";
	}
}

function gridoptMouseOut(obj){
	if(obj.className != "gridoptions_on") {
		obj.style.backgroundColor = "";
	}
}
// end mouseover change class name - for toolbar //

// mouseover change image //
 
function imgOver(thisimg, number){ // number refers to image in rollover array
	(document.getElementById (thisimg.id)).src = rollover[number];
	return true;
}

// end mouseover change image //

// change grid color //

function gridColor(val){
	var howmany = document.getElementById ("gridlist").childNodes;
	
	for (var i=0; i<howmany.length; i++) {
		if (i == val) {
			howmany[i].className = "gridoptions_on";
			howmany[i].style.backgroundColor = "#E5E3E1";
		}else{
			howmany[i].className = "gridoptions_off";
		}
	}
	gridCol = "pagedivbg"+val;
	for (var j = 0; j < listPages.length ; j++)
	{
		listPages[j].page_div.className=gridCol;
	}
}

function getGridColor(){
	return gridCol;
}

function setGridColor(val){
	if (val != "") {gridCol = val;}
}

// end change grid color //

function checkEnterPopUp(e){ 
   var characterCode 
   
   if(e && e.which){ 
      e = e;
      characterCode = e.which;
    }
    else {
      e = event;
      characterCode = e.keyCode; 
    }

   	if(characterCode == 13){ 
        goMainDiv();  
        return;
        
    }else{
        return;
    }
}

function doKeyPressContent(e,obj) {
	var characterCode 
   
   if(e && e.which){ 
      e = e;
      characterCode = e.which;
    }
    else {
      e = event;
      characterCode = e.keyCode; 
    }

   	if(characterCode == 13){ 
        obj.blur(); 
        return;
        
    }else{
         savePropertyValueWithObj('Content',obj,current_div_index,current_div_obj_index,1);
    }
}

function checkEnterAddPage(e,parent_index){ 
   var characterCode 
   
   if(e && e.which){ 
      e = e;
      characterCode = e.which;
    }
    else {
      e = event;
      characterCode = e.keyCode; 
    }

   	if(characterCode == 13){ 
        savePage(parent_index);  
        return;
        
    }else{
        return;
    }
}

function checkEnterParameter(e,rownum){ 
   var characterCode 
   
   if(e && e.which){ 
      e = e;
      characterCode = e.which;
    }
    else {
      e = event;
      characterCode = e.keyCode; 
    }

   	if(characterCode == 13){ 
        document.getElementById("but_save_param").click();  
        return;
        
    }else{
        return;
    }
}

function getDBStr() {
	//var dbList = "<table id=\"pdata\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"left\" valign=\"top\" class=\"propdiv_title\">"+lab_arr[49]+"</td></tr><tr><td align=\"left\" valign=\"middle\"><div class=\"propdiv_border\">"
	var dbList = "<table id=\"pdata\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"left\" valign=\"top\" class=\"propdiv_title\">"+lab_arr[99]+"</td></tr><tr><td align=\"left\" valign=\"middle\"><div class=\"propdiv_border\">"
	
	var tp = lab_arr[90]+" ";
	
	if (popType=="OUT") {
	 tp +=lab_arr[97];
	} else {
	 tp +=lab_arr[98];		
	}

	dbList += "<div style=\"overflow:hidden; padding-top:5px; width:178px; \"><div  style=\"width:178px; padding-top:1px; text-transform:none;\">"+lab_arr[91]+" "+getPopDescription()+"</div>"
	       +  "<div id='proppopname' style=\"width:178px; padding-top:1px;\">"+tp+"</div>"
	       +  "</div>";

	dbList += "</div></td></tr>";
	
	dbList += "<tr><td align=\"left\" valign=\"middle\"><div class=\"propdiv_border\">"
	        + "<div style=\"overflow:hidden; padding-top:5px; width:178px; \">"+lab_arr[92]+" "+createDate+"</div>"
	        + "<div style=\"overflow:hidden; padding-top:5px; width:178px; \">"+lab_arr[93]+" "+createUser+"</div>"
	        + "<div style=\"overflow:hidden; padding-top:5px; width:178px; \">"+lab_arr[94]+" "+updateDate+"</div>"
	        + "<div style=\"overflow:hidden; padding-top:5px; width:178px; \">"+lab_arr[95]+" "+updateUser+"</div>"
	        + "</div></td></tr>";
	
	dbList +="<tr><td align=\"left\" valign=\"middle\"><div class=\"propdiv_border\">"+lab_arr[96];
	
	for(var i=0;i<popupObjects.length;i++){
			if(popupObjects[i].fdelete == 0 && popupObjects[i].id==9) {
	    		dbList += "<div style=\"overflow:hidden; padding-top:5px; padding-bottom:5px; width:178px;\">"+popupObjects[i].propList["Name"].value;
				if (popupObjects[i].propList["TablesList"].arrMulti.length >0) {
					
					for (var j=0 ; j < popupObjects[i].propList["TablesList"].arrMulti.length; j++) {
	    				dbList +="<div style=\"width:178px; margin-top:1px; background-color:#52636D; padding-left:5px; padding-bottom:3px; padding-top:2px\">"+getPartString(popupObjects[i].propList["TablesList"].arrMulti[j].valueDesc,24)+"</div>";
	    			}
					
				}
				dbList += "</div>"
			}
	}
				
	dbList += "</div></td></tr>"
	       + "<tr><td align=\"left\" valign=\"middle\"><div class=\"propdiv_border\" style=\"margin-top:10px;\">"
		   
		   + "<div style=\"overflow:hidden; padding-top:5px; width:178px; \">"+lab_arr[63]+"<div style=\"width:178px; padding-top:1px;\"><input type=\"text\"  value=\""+getPopDescription()+"\" onBlur=\"savePopDescription(this); skinFit()\" onkeyPress=\"doEnter(this,event)\" id=\"popname\" class=\"formfields\" style=\"width:169px;padding-left:4px\" /></div></div>"
		   
		   + "<div style=\"overflow:hidden; padding-top:5px; width:178px; \">"+lab_arr[116]+"<div style=\"width:178px; padding-top:1px;\"><input class=\"formfields\" id=\"properties_type\" type=\"radio\" name=\"poptype\" value=\"OUT\" ";
		   
		   if (popType=="OUT") {
				dbList += "checked";
			}
		   
	dbList += " onclick='typeOut()' />"+lab_arr[97]+"<input class=\"formfields\" id=\"properties_type\" type=\"radio\" name=\"poptype\" value=\"IN\" style=\"margin-left:20px\" ";
	
			if (popType=="IN") {
				dbList += "checked";
			}
	
	dbList += " onclick='typeIn()' />"+lab_arr[98]+"</div></div>"
		   
		   + "</div></td></tr>"
		   + "<tr><td align=\"right\" style=\"color:#FFFFFF; padding-top:10px\"><span style='padding-right:5px; cursor:pointer;' onmouseover='imgOver(delelement, \"7\")' onmouseout='imgOver(delelement, \"6\")' onclick='deletePopUp()'>"+lab_arr[84]+"</span><img id='delelement' src=\"../../img/popup/delete.gif\" width=\"20\" height=\"20\" hspace=\"0\" vspace=\"0\" border=\"0\" align=\"absmiddle\" style=\"margin-right:10px; cursor:pointer;\" onmouseover='imgOver(this, \"7\")' onmouseout='imgOver(this, \"6\")' onclick='deletePopUp()' /></td></tr>"
	       +"</table>";
	
	
	return dbList;

}

function getPageStr() {
	var pageList = "<table id=\"pdata\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"left\" valign=\"top\" class=\"propdiv_title\">"+lab_arr[53]+"</td></tr><tr><td align=\"left\" valign=\"middle\"><div class=\"propdiv_border\">"
	

	pageList += "<div style=\"overflow:hidden; padding-top:5px; width:178px; \">"+lab_arr[71]+"<div style=\"width:178px; padding-top:1px;\"><input type='text' id='proppagename' onKeyPress='doEnter(this,event)' onblur='changePageName()' class=\"formfields\" style=\"width:169px;padding-left:4px\" /></div></div>";

	pageList += "</div></td></tr>"

	pageList += "<tr><td align=\"right\" style=\"color:#FFFFFF; padding-top:10px\"><span style='padding-right:5px; cursor:pointer;' onmouseover='imgOver(delelement, \"7\")' onmouseout='imgOver(delelement, \"6\")' onclick='removeUpDownPage(\"r\","+current_div_index+")'>"+lab_arr[54]+"</span><img id='delelement' src=\"../../img/popup/delete.gif\" width=\"20\" height=\"20\" hspace=\"0\" vspace=\"0\" border=\"0\" align=\"absmiddle\" style=\"margin-right:10px; cursor:pointer;\" onmouseover='imgOver(this, \"7\")' onmouseout='imgOver(this, \"6\")' onclick='removeUpDownPage(\"r\","+current_div_index+")' /></td></tr>"
	
	pageList += "</table>";
	   
	return pageList;
}

function changePageName() {
    if(validCharacters(document.getElementById("proppagename"))){
       return;
    }
	var page_name = cleanVal(document.getElementById("proppagename").value);
	document.getElementById("proppagename").value = page_name;
	if (page_name == "") {
		alert(lab_arr[5]);
		document.getElementById("proppagename").focus();
		return;
	}
	else {
		for (var i=0;i<listPages.length;i++) {
			if (listPages[i].page_name == page_name && i !=current_div_index ) {
				alert(lab_arr[78]);
				document.getElementById("proppagename").focus();
				document.getElementById("proppagename").select();
				return;
			}
		}
	}
	document.getElementById("proppagename").value=listPages[current_div_index].page_name = page_name;
	
	var tab = document.getElementById("pagedivtab").rows;

	tab[eval(current_div_index)+1].firstChild.firstChild.firstChild.innerHTML=page_name;
	saveChangeState();
}

//open upload window for file propeties of the image element
function showUpload() {
	var pos_x = window.event.clientX + document.body.scrollLeft - document.body.clientLeft -300;
	var pos_y = window.event.clientY + document.body.scrollTop  - document.body.clientTop +100;
	
	
	var prop="left="+pos_x+",top="+pos_y+",width=400,height=300,resizable=1,scrollbars=0";
	
	var param="path="+popDownPath+"&popdbid="+popId+"&popname="+popInitialName+"&uniqueid="+uniqueid+"&filename="+getPropertyValue('File');
	document.open("upload.jsp?"+param,"upload",prop);

}

function doHelp(){
  window.open("help.jsp","mywindow",'status=0,location=0,menubar=0,toolbar=0,directories=0,width=900,height=650,resizable=yes');
}

///menu.js

var obj_width = 150;
var obj_height= 20;
var contState = 0;

	function containerClick(subobj,sublevel){
		/*start test if the user can click*/
		if (document.getElementById("introdiv").style.display=="block" 		|| 
			document.getElementById("popupallwin").style.display=="block") {
			return;	
		}
		
		/*end test if user can click*/
		contState = 1;
		doMouseOver(subobj,sublevel);
	}
	
	function containerOut(){
		if(document.getElementById("dynmenu1").className=="lev0" && document.getElementById("dynmenu2").className=="lev0"){
			contState = 0;
		}
	}

   function doMouseOver(obj,level)
   {
	   /*start test if the user can click*/
		if (document.getElementById("introdiv").style.display=="block" 		|| 
			document.getElementById("popupallwin").style.display=="block") {
			return;	
		}
		
		/*end test if user can click*/
   		
   		
   		obj.className="lev"+level+"over";

		var obj_top    = obj.style.top;
		var obj_left    = obj.style.left;

   		if (obj.childNodes.length >0)
   		{
   			for(var i=0;i<obj.childNodes.length;i++)
			{
				if (obj.childNodes[i].nodeType==1)
				{
					if (level==0)
					{
						val = obj.offsetHeight;
						obj.childNodes[i].style.top=val+"px";
						
						if(obj.previousSibling != null){
							obj.childNodes[i].style.left=obj.previousSibling.offsetWidth+"px";
						}else{
							obj.childNodes[i].style.left="0px";
						}				
					}
					else
					{
							val = obj_width;
							obj.childNodes[i].style.left=val+"px";
							obj.childNodes[i].style.top="0px";
					}	
					if (contState == 1){
						obj.childNodes[i].style.display="block";
					};
		
					if (obj.childNodes[i].id == "c"+ obj.id)
					{
							var curr_top = 0;
							for(var j=0;j<obj.childNodes[i].childNodes.length;j++)
							{
								if (obj.childNodes[i].childNodes[j].nodeType==1)
								{
									obj.childNodes[i].childNodes[j].style.top=curr_top+"px";
									obj.childNodes[i].childNodes[j].style.left="0px";
									curr_top = curr_top+obj_height;
									obj.childNodes[i].childNodes[j].style.display="block";
								}
							}
					}
				}
			}
   		}

   }
   

	function doMouseOut(obj,level)
	{ 
		var str_id = obj.id;
		document.getElementById(str_id).className="lev"+level;
		if (obj.childNodes.length >0)
		   		{
		   			for(var i=0;i<obj.childNodes.length;i++)
					{
						if (obj.childNodes[i].nodeType==1)
						{
							if (obj.childNodes[i].id == "c"+ obj.id)
							
							{
									for(var j=0;j<obj.childNodes[i].childNodes.length;j++)
									{
										if (obj.childNodes[i].childNodes[j].nodeType==1)
										{
											obj.childNodes[i].style.display="none";
											obj.childNodes[i].childNodes[j].style.display="none";
											setTimeout("containerOut()",100);
										}
									}
							}

						}
					}
   		}
	}

function doMouseClick(gotolink,obj,level)
	{ 
		/*start test if the user can click*/
		if (document.getElementById("introdiv").style.display=="block" 		|| 
			document.getElementById("popupallwin").style.display=="block") {
			return;	
		}
		/*end test if user can click*/
	switch (gotolink) {
		case 2 ://new
			openPopUp("0");
		    break;
		case 3 : //Save
			savePopup();	
			break;
		case 4 : //Save as
			saveAs();
			break;	
   		case 6 : // Table Configuration
   			fillTablesList();
   			break;
   		case 7: // Database Configuration
   			databaseConfig();
   			break;
   		case 8: // View Sample
   			viewPopup();
   			break;
   		case 9: //Parameters configuration
   			parameterConfig();
   			break;
   		case 10: //Where clause config.
   			whereClauseConfig();
   			break;	
   		case 11://Open list popup
   			openPopupList("popupallwin");
   			break;
   		case 12://global parameters
   			globalParams();
   			break;	
   		case 13://delete popup
   			deletePopUp();
   			break;	
   		case 14://elements triggers
   			eventsConfig();
   			break;	
       }
}

function getHTTPRequest()
{
	var xmlhttp;
	if (window.ActiveXObject)
	{
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	}
	else
	{
		xmlhttp = new XMLHttpRequest();
	}	
	return xmlhttp;
}

//called from database config menu
function databaseConfig(){
            removeFocusCurrentPageObj();
            doMouseOut(dynmenu2,0);
	     	var htmlValue ="<table border=0 width='250px' cellspacing=0 cellpadding=0 align='center'>"
	                		 +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[22]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllWin()'></td></tr></table></td></tr>"
	        		         +"<tr><td class=\"pUpContainer\"><table border=0 cellspacing=0 cellpadding=0><tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class='tabheader2'><td><img src='../../img/popup/add.gif' border=0 align='absmiddle' onclick='addDatabaseClick(-1)'>&nbsp;"+lab_arr[23]+"</td></tr></table></td></tr>"
	        		         +"<tr><td><div class=\"pUpInnerBorder\" style='width:240px;'><div id='listDatabases' style='overflow: auto; height:100px;'></div></div></td></tr></table></tr></td>"
	        		         +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" type='button' id='closeDatabaseConfig' value='"+lab_arr[24]+"' onclick='hidePopupAllWin()'></td></tr>"
	        		         +"</table></td></tr></table>";
	       
		              
		
	        showPopupAllWin("","",htmlValue);
	        drawDatabasesList();
	        document.getElementById("closeDatabaseConfig").focus();

}

//called from parameters config of the menu
function parameterConfig(){
         removeFocusCurrentPageObj();
         doMouseOut(dynmenu2,0);
	     var htmlValue ="<table border=0 width='250px' cellspacing=0 cellpadding=0 align='center' >"
	           		    +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[26]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllWin()'></td></tr></table></td></tr>"
	        		    +"<tr><td class=\"pUpContainer\"><table border=0 cellspacing=0 cellpadding=0><tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class='tabheader2'><td><img src='../../img/popup/add.gif' border=0 align='absmiddle' onclick='addParameterClick(-1)'>&nbsp;"+lab_arr[25]+"</td></tr></table></td></tr>"
	        		    +"<tr><td><div class=\"pUpInnerBorder\" style='width:240px;'><div id='listParameters' style='overflow: auto; height:100px;'></div></div></td></tr></table></tr></td>"
	        		    +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" id='closeParameterConfig' type='button' value='"+lab_arr[24]+"' onclick='hidePopupAllWin()'></td></tr>"
	        		    +"</table></td></tr></table>";
   
	     showPopupAllWin("","",htmlValue);
	     parameterTable();
	     document.getElementById("closeParameterConfig").focus();
	 
}

//called on click on where clause config menu
function whereClauseConfig(){ 
            removeFocusCurrentPageObj();   
            doMouseOut(dynmenu2,0);
            var selectValue = "<select class=\"formfields\" id=\"dblist\" onChange=\"fillListWhereClause(this.value)\">";
	          	for(var i=0;i<popupObjects.length;i++){
		         	if(popupObjects[i].fdelete == 0 && popupObjects[i].id==9)
	    	           selectValue += "<option class=\"formfields\" value="+i+">"+popupObjects[i].propList["Name"].value+"</option>";
	            }
		    selectValue += "</select>"; 
		
		    var htmlValue ="<table border=0 width='1000px' cellspacing=0 cellpadding=0 align='center' >"
	        		        +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[27]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllWin()'></td></tr></table></td></tr>"
							+"<tr><td class=\"pUpContainer\" style='padding-top:2px;'><table border=0 cellspacing=0 cellpadding=0>"
	        		        +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class='tabheader2'><td style='padding-left:5px'>"+lab_arr[28]+" "+selectValue+"</td></tr></table></td></tr>"
	        		        +"<tr><td><table border=0 width='100%' cellspacing=1 cellpadding=2><tr class='tabheader2'><td><img src='../../img/popup/add.gif' border=0 align='absmiddle' onclick='addRowWhereClause(document.getElementById(\"dblist\").value,\"\",\"\",\"\",\"\",\"\",\"\",\"\")'>&nbsp;"+lab_arr[29]+"</td></tr></table></td></tr>"
	        		        +"<tr><td><div class=\"pUpInnerBorder\" style='width:980px;'><div style='overflow:auto; height:300px'><table id='listWhereClause' border=0 cellspacing=0 cellpadding=0>"
	        		        +"<tr class='tabheader2' style='font-weight:normal;'><td style='padding-right:12px; width:130px;'><nobr>"+lab_arr[30]+"</nobr></td><td style='padding-right:3px; width:112px;'><nobr>"+lab_arr[31]+"</nobr></td><td style='padding-right:9px;width:40px;'></td><td style='padding-right:3px;width:40px;'></td><td style='padding-right:12px;width:80px;'><nobr>"+lab_arr[32]+"</nobr></td><td style='padding-right:12px;width:130px;'><nobr>"+lab_arr[33]+"</nobr></td><td style='padding-right:3px;width:112px;'><nobr>"+lab_arr[34]+"</nobr></td><td style='padding-right:9px;width:40px;'></td><td style='padding-right:12px;width:112px;'><nobr>"+lab_arr[35]+"</nobr></td><td></td><td></td></tr>"
	        		        +"</table></div></div></td></tr></table></tr></td>"
	        		        +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" type='button' onclick='saveListWhereClause(document.getElementById(\"dblist\").value), saveChangeState()' value='"+lab_arr[9]+"'/><input class=\"formfields\" id='closeWhereConfig' type='button' onclick='closeListWhereClause()' value='"+lab_arr[24]+"'/></td></tr>"
	        		        +"</table></td></tr></table>";
		    var t = showPopupAllWin("","",htmlValue);
		    fillListWhereClause(document.getElementById("dblist").value);	//draw the lsit of where clause of the current db	
		    document.getElementById("closeWhereConfig").focus();
 
}

//called on click on Elements triggers menu
function eventsConfig() {  
            removeFocusCurrentPageObj();  
            doMouseOut(dynmenu2,0);
		    var htmlValue ="<table border=0 width='1000px' cellspacing=0 cellpadding=0 align='center' >"
	        		        +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[100]+"</td><td align='right'><img src='../../img/close2.gif' onclick='closeEvents()'></td></tr></table></td></tr>"
							+"<tr><td class=\"pUpContainer\" style='padding-top:2px;'><table border=0 cellspacing=0 cellpadding=0>"
	        		        +"<tr><td><table border=0 width='100%' cellspacing=1 cellpadding=2><tr class='tabheader2'><td><img src='../../img/popup/add.gif' border=0 align='absmiddle' onclick='addRowEvent(\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\")'>&nbsp;"+lab_arr[101]+"</td></tr></table></td></tr>"
	        		        +"<tr><td><div class=\"pUpInnerBorder\" style='width:px;'><div style='overflow:auto; height:300px'><table id='listEvent' border=0 cellspacing=0 cellpadding=0>"
	        		        +"<tr class='tabheader2' style='font-weight:normal;'><td style='padding-right:12px;width:112px'><nobr>"+lab_arr[114]+"</nobr></td><td style='padding-right:12px;width:112px'><nobr>"+lab_arr[102]+"</nobr></td><td style='padding-right:12px;width:137px'><nobr>"+lab_arr[103]+"</nobr></td><td style='padding-right:12px;width:62px'><nobr>"+lab_arr[104]+"</nobr></td><td style='padding-right:12px;width:82px'><nobr>"+lab_arr[105]+"</nobr></td><td style='padding-right:12px;width:62px'><nobr>"+lab_arr[106]+"</nobr></td><td style='padding-right:12px;width:112px'><nobr>"+lab_arr[107]+"</nobr></td><td style='padding-right:12px;width:137px'><nobr>"+lab_arr[103]+"</nobr></td><td style='padding-right:12px;width:52px'><nobr>"+lab_arr[108]+"</nobr></td><td style='width:20px'></td><td></td><td></td></tr>"
	        		        +"</table></div></div></td></tr></table></tr></td>"
	        		        +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" type='button' onclick='saveEvents(), saveChangeState()' value='"+lab_arr[9]+"'/><input class=\"formfields\" id='closeEventsConfig' type='button' onclick='closeEvents()' value='"+lab_arr[24]+"'/></td></tr>"
	        		        +"</table></td></tr></table>";
		    var t = showPopupAllWin("","",htmlValue);
		    
		    document.getElementById("closeEventsConfig").focus();
 			drawEvents();
}

function drawEvents() {
	for(var i=0;i<popupObjects.length;i++){
		if(popupObjects[i].fdelete == 0 && popupObjects[i].id==22){ //event object
		   addRowEvent(popupObjects[i].det_id,popupObjects[i].propList["Name"].value,popupObjects[i].eventObjDbid,popupObjects[i].eventOperator,popupObjects[i].eventValue,popupObjects[i].propList["ActionType"].value,popupObjects[i].actionObjDbid,"",i);
		}
    }
}

function saveEvents() {
	var mymaintab = document.getElementById("listEvent").rows;
	for (var i=1; i < mymaintab.length;i++) {
		var mytab = mymaintab[i];
		if (mytab.cells[0].firstChild.value == "") {
			alert(lab_arr[128]);
			mytab.cells[0].firstChild.focus();
			return false;
		}
		
		if (mytab.cells[1].firstChild.value == "") {
			alert(lab_arr[129]);
			mytab.cells[1].firstChild.focus();
			return false;
		}
		
		if (mytab.cells[2].firstChild.value == "") {
			alert(lab_arr[130]);
			mytab.cells[2].firstChild.focus();
			return false;
		}
		if (mytab.cells[6].firstChild.value == "") {
			alert(lab_arr[131]);
			mytab.cells[6].firstChild.focus();
			return false;
		}
		if (mytab.cells[7].firstChild.value == "") {
			alert(lab_arr[132]);
			mytab.cells[7].firstChild.focus();
			return false;
		}
		
		for (var j=0; j < i; j++) {
			curtab = mymaintab[j];
			if (mytab.cells[1].firstChild.value == curtab.cells[1].firstChild.value && 
				mytab.cells[2].firstChild.value == curtab.cells[2].firstChild.value &&
				mytab.cells[3].firstChild.value == curtab.cells[3].firstChild.value &&
				mytab.cells[4].firstChild.value == curtab.cells[4].firstChild.value &&
				mytab.cells[5].firstChild.value == curtab.cells[5].firstChild.value &&
				mytab.cells[6].firstChild.value == curtab.cells[6].firstChild.value &&
				mytab.cells[7].firstChild.value == curtab.cells[7].firstChild.value ) {
				alert(lab_arr[133]);
				mytab.cells[0].firstChild.focus();
				return false;
			}
		}
		
		
	}
	for (var i=1; i < mymaintab.length;i++) {
		var mytab = mymaintab[i];
		var obj = null;
		
		if (mytab.cells[11].firstChild.value=="") {
			obj =  new cloneObject(listPopObject[2]);
			popupObjects[popupObjects.length] = obj;
			obj = popupObjects[popupObjects.length-1];
			obj.listValues = new Array();
		} else {
			obj = popupObjects[parseInt(mytab.cells[11].firstChild.value)];
		}
		
		obj.propList["Name"].value = mytab.cells[0].firstChild.value;
		obj.eventOperator 	= mytab.cells[3].firstChild.value;
		obj.eventValue 		= mytab.cells[4].firstChild.value;
		obj.propList["ActionType"].value 		= mytab.cells[5].firstChild.value;
		
		if (listPages[parseInt(mytab.cells[1].firstChild.value)].listObj[parseInt(mytab.cells[2].firstChild.value)].det_id =="") {
			obj.eventObjDbid= mytab.cells[1].firstChild.value+"#"+mytab.cells[2].firstChild.value;
		} else {
			obj.eventObjDbid = listPages[parseInt(mytab.cells[1].firstChild.value)].listObj[parseInt(mytab.cells[2].firstChild.value)].det_id;
		}
		
		var old = obj.actionObjDbid;
		if (listPages[parseInt(mytab.cells[6].firstChild.value)].listObj[parseInt(mytab.cells[7].firstChild.value)].det_id =="") {
			obj.actionObjDbid= mytab.cells[6].firstChild.value+"#"+mytab.cells[7].firstChild.value;
		} else {
			obj.actionObjDbid = listPages[parseInt(mytab.cells[6].firstChild.value)].listObj[parseInt(mytab.cells[7].firstChild.value)].det_id;
		}
		
		if (obj.actionObjDbid != old) {obj.listValues = new Array();};

	}
	
	closeEvents();
	return true;
}

//add a <tr> for an event to the <table> of the events
function addRowEvent(dbid,name,eventelement,operator,value,action,actionelement,valueslist,obj_idx) {
	var tab = document.getElementById("listEvent");
	
	var row_index = tab.rows.length;
	
	var myNewRow = tab.insertRow();
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	td.innerHTML = "<input class=\"formfields\" type=\"text\"  value='"+name+"' style=\"width:100px; padding-left:4px;\"  onkeyPress='doEnter(this,event)'  onblur='checkName(this)'  />";
	myNewRow.appendChild(td);
		
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select class=\"formfields\"  style=\"width:100px; padding-left:4px;\" onchange='changePage(this,\"event\")'><option value=''></option>";
	
	for (var i=0;i<listPages.length;i++) {
		str +="<option class=\"formfields\" value='"+i+"'>"+listPages[i].page_name+"</option>";
	}
	str +="</select>";
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select class=\"formfields\"  style=\"width:125px; padding-left:4px;\" onchange='changeElement(this,\"event\")'><option value=''></option></select>";
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select class=\"formfields\"  style=\"width:50px; padding-left:4px;\"><option class=\"formfields\" value='==' "+((operator=="==")?"selected":"")+" >=</option><option class=\"formfields\" value='<' "+((operator=="<")?"selected":"")+"><</option><option class=\"formfields\" value='>' "+((operator==">")?"selected":"")+">></option><option class=\"formfields\" value='<=' "+((operator=="<=")?"selected":"")+"><=</option><option class=\"formfields\" value='!=' "+((operator=="!=")?"selected":"")+"><></option><option class=\"formfields\" value='>=' "+((operator==">=")?"selected":"")+" >>=</option></select>";
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	td.innerHTML = "";
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select class=\"formfields\" style=\"width:70px; padding-left:4px;\"    onchange='changActionType(this)'>";
	
	var myArr = listPopObject[2].propList['ActionType'].lstPropValue;
	
	for (var i=0;i<myArr.length;i++) {
		str +="<option class=\"formfields\" value='"+myArr[i].id+"'"+ ( (myArr[i].id==action)?"selected":""  )  +">"+myArr[i].name+"</option>";
	}
	str +="</select>";
	td.innerHTML=str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select class=\"formfields\"  style=\"width:100px; padding-left:4px;\" onchange='changePage(this,\"action\")'><option class=\"formfields\" value=''></option>";
	
	for (var i=0;i<listPages.length;i++) {
		str +="<option class=\"formfields\" value='"+i+"'>"+listPages[i].page_name+"</option>";
	}
	str +="</select>";
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select class=\"formfields\" style=\"width:125px; padding-left:4px;\" onchange='changeElement(this,\"action\")'><option class=\"formfields\" value=''></option></select>";
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	
	var td = document.createElement("<TD style='padding-right:12px;width:40px' ></TD>");
	var str = "<input class=\"formfields\" type='button' value=' ... ' onclick='viewEventDet(this)' />";
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='width:20px'></TD>");
	td.innerHTML = "<img src='../../img/popup/delete2.gif' border=0 onclick='deleteEvent(this);'>";
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD></TD>");
	td.innerHTML = "<input class=\"formfields\" type=\"hidden\" value='"+dbid+"'  />";
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD></TD>");
	td.innerHTML = "<input class=\"formfields\" type=\"hidden\" value='"+obj_idx+"'  />";
	myNewRow.appendChild(td);
	
	if (eventelement !="") {
		if (eventelement.indexOf("#") >0){
			var element_arr = eventelement.split("#");
			myNewRow.cells[1].firstChild.value = element_arr[0];
			changePage(myNewRow.cells[1].firstChild,"event");
			myNewRow.cells[2].firstChild.value = element_arr[1];
		} else {
			for (var i=0; i< listPages.length;i++) {
				for (var j=0;j <listPages[i].listObj.length;j++) {
					if (listPages[i].listObj[j].det_id==eventelement) {
						myNewRow.cells[1].firstChild.value = i;
						changePage(myNewRow.cells[1].firstChild,"event");
						myNewRow.cells[2].firstChild.value = j;
						break;
					}
				}
			}
		}
	}
	
	changeElement(myNewRow.cells[2].firstChild,"event");
	myNewRow.cells[4].firstChild.value = value;
		
	if (actionelement !="") {	
		if (actionelement.indexOf("#") >0){
			var element_arr = actionelement.split("#");
			myNewRow.cells[6].firstChild.value = element_arr[0];
			changePage(myNewRow.cells[6].firstChild,"action");
			myNewRow.cells[7].firstChild.value = element_arr[1];
		} else {
			for (var i=0; i< listPages.length;i++) {
				for (var j=0;j <listPages[i].listObj.length;j++) {
					if (listPages[i].listObj[j].det_id==actionelement) {
						myNewRow.cells[6].firstChild.value = i;
						changePage(myNewRow.cells[6].firstChild,"action");
						myNewRow.cells[7].firstChild.value = j;
						break;
					}
				}
			}
		}
	}
	
	changActionType(myNewRow.cells[5].firstChild);
}

function checkName(obj) {
	var mymaintab = document.getElementById("listEvent").rows;
	
	if (validCharacters(obj)) {
		return;
	}
	
	for (var i=1;i <mymaintab.length;i++) {
		if (mymaintab[i] != obj.parentElement.parentElement && obj.value == mymaintab[i].cells[0].firstChild.value && obj.value !="") {
			alert(lab_arr[134]);
			obj.focus();
			obj.value='';
			return;	
		}
	}	
}

var test_save = 0;

function viewEventDet(obj) {
	var name = obj.parentElement.parentElement.cells[0].firstChild.value;
	if (test_save==0) {
		if (!saveEvents()) {return;} 
			else {
				test_save = 1;
				eventsConfig(); 
				var evtab  = document.getElementById("listEvent").rows;
				for (var i=1; i < evtab.length ; i++) {
					if (evtab[i].cells[0].firstChild.value == name) {evtab[i].cells[8].firstChild.click();return;}
				}
			
				return;
		}	
	} else {
		test_save = 0;
	}
	
	if (obj.parentElement.parentElement.cells[7].value !="") {
	
		var pos_x = window.event.clientX + document.body.scrollLeft - document.body.clientLeft -100 ;
		var pos_y = window.event.clientY + document.body.scrollTop  - document.body.clientTop ;
		
		
		var cnv = showPopupAllDetWin(pos_x - 175,pos_y,"268","","");
	    
	    
	    var myobj = listPages[parseInt(obj.parentElement.parentElement.cells[6].firstChild.value)].listObj[parseInt(obj.parentElement.parentElement.cells[7].firstChild.value)];
	  
	    var arr = popupObjects[parseInt(obj.parentElement.parentElement.cells[11].firstChild.value)].listValues;
	    
	    var str = "";
	    
	    if (myobj.name=="Combo" || myobj.name=="Radio") {
	    	str = "<table id='tabeventdet'><tr><td colspan='2'></td></tr>";
	    	
	    	if (myobj.propList['Values'].arrMulti) {
	    		for (var i=0; i < myobj.propList['Values'].arrMulti.length; i++) {
	    			if (myobj.propList['Values'].arrMulti[i].fdelete==0) {
	    				var id = "";
	    				var checked="";
	    				for (var j=0; j < arr.length ; j++) {
	    					if (arr[j].value == myobj.propList['Values'].arrMulti[i].valueCode && arr[j].fdelete==0) {
	    						
	    						id = arr[j].id;
	    						checked="checked";
	    						break;
	    					}
	    				}
	    				
	    				str+="<tr class='linkout' onmouseover='linkTableMouseOver(this)' onmouseout='linkTableMouseOut(this)'><td><input class=\"formfields\" type='checkbox' "+checked+" value='"+myobj.propList['Values'].arrMulti[i].valueCode+"'></td><td width='220px'>"+myobj.propList['Values'].arrMulti[i].valueDesc+"("+myobj.propList['Values'].arrMulti[i].valueCode+")</td><td style='width:0'><input class=\"formfields\" type='hidden' value ='"+id+"'></td></tr>";
	    			}
	    		}
	    	}
	    	
	    	str += "</table>";
	    	
	    } else if (myobj.name=="Checkbox") {
	    
	    	   	var val1 = "";
	    	   	var val2 = "";
	    	   	
	    	var id  = "";
	    	if (arr.length>0) {if (arr[0].value=="0"){val2="checked";}else{val1="checked";}              id=arr[0].id;        }
	    	str="<table id='tabeventdet'><tr><td class='tabheader2'>"+lab_arr[106]+"</td></tr><tr><td class='linkout' style='width:90px'><input class=\"formfields\" type='radio' name='rad' "+val1+">"+lab_arr[110]+"</td><td class='linkout' style='width:90px'><input class=\"formfields\" type='radio' name='rad' "+val2+">"+lab_arr[111]+"</td><td><input class=\"formfields\" type='hidden' value='"+id+"'></td></tr></table>";
	    } else {
	    	var val = "";
	    	var id  = "";
	    	if (arr.length>0) {val = arr[0].value;id=arr[0].id}
	    	str="<table id='tabeventdet'><tr><td></td><td><input class=\"formfields\" type='text' style='width:220px' value='"+val+"' onKeyPress='doEnter(this,event)' onblur='validCharacters(this)'></td><td><input class=\"formfields\" type='hidden' value='"+id+"'></td></tr></table>";
	    }
    
	    var html_str  ="<table border=0  cellspacing=0 cellpadding=0>"
		        	  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[108]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllDetWin()'></td></tr></table></td></tr>"
					   +"<tr><td class=\"pUpContainer\"><div class=\"pUpInnerBorder\" style='width:250px; '><div id='subcnv' style='overflow:auto;height:200px;'>"+str+"</div></div></td></tr>"
		              +"</td></tr>"
					  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input type='button' class=\"formfields\" value='"+lab_arr[9]+"' onclick='saveEventDet("+obj.parentElement.parentElement.cells[6].firstChild.value+","+obj.parentElement.parentElement.cells[7].firstChild.value+","+obj.parentElement.parentElement.cells[11].firstChild.value+")'><input class=\"formfields\" id='closeValuesList' type='button' value='"+lab_arr[24]+"' onclick='hidePopupAllDetWin()'></td></tr>"
	                  +"</table></td></tr></table>";
		
		cnv.innerHTML = html_str;
	    
	    document.getElementById("closeValuesList").focus(); 
	 }
}

function saveEventDet(x,y,obj_idx) {
	 var myobj = listPages[x].listObj[y];
	  
	 var arr = popupObjects[obj_idx].listValues;
	 
	 var mytab = document.getElementById("tabeventdet").rows;
	 
	 if (myobj.name=="Combo" || myobj.name=="Radio") {
	    	arr = new Array();
	    	
	    	for (var i=1;i < mytab.length;i++) {
	    		if (mytab[i].cells[0].firstChild.checked) {
	    			var obj = new Object();
	    			obj.id = "" ;
	    			obj.value = mytab[i].cells[0].firstChild.value ;
	    			obj.fdelete = 0;
	    			arr[arr.length] = obj;
	    		}
	    	}

	    	popupObjects[obj_idx].listValues = arr;
	    } else if (myobj.name=="Checkbox") {
	    	var val = "0";
	    	var id  = "";
	    	
	    	if (mytab[1].cells[0].firstChild.checked) {val=1;}
	    	
	    	if (arr.length>0) {arr[0].value = val ;arr[0].id = mytab[1].cells[2].firstChild.value;}
	    	else {
	    		var obj = new Object();
	    		obj.id = mytab[1].cells[2].firstChild.value ;
	    		obj.value = val; ;
	    		obj.fdelete = 0;
	    		arr[0] = obj;
	    	}
	    } else {
	    	
	    	var val = "";
	    	var id  = "";
	   	
	    	if (arr.length>0) {arr[0].value = mytab[0].cells[1].firstChild.value ;arr[0].id = mytab[0].cells[2].firstChild.value;}
	    	else {
	    		var obj = new Object();
	    		obj.id = mytab[0].cells[2].firstChild.value ;
	    		obj.value = mytab[0].cells[1].firstChild.value ;
	    		obj.fdelete = 0;
	    		arr[0] = obj;
	    	}	
	    }
	 	hidePopupAllDetWin();
}

function changePage(obj,event_or_action) {
	
	var str = "<select class=\"formfields\"  style=\"width:125px; padding-left:4px;\" onchange='changeElement(this,\""+event_or_action+"\")'><option value=''></option>";
	
	if (obj.value !="") {
	
		for (var i=0;i< listPages[parseInt(obj.value)].listObj.length;i++) {
			if (listPages[parseInt(obj.value)].listObj[i].fdelete==0 && listPages[parseInt(obj.value)].listObj[i].grpNbr==0) {
				
				var desc = getPropertyValueWithIndex("Name",obj.value,i);
				
				if (desc=="") {
					desc = "["+listPages[parseInt(obj.value)].listObj[i].description+"]";
				}
				str +="<option class=\"formfields\" value='"+i+"'>"+(i+1)+". "+desc+"</option>";
			}
		}
	}
	
	str +="</select>";
	
	if (event_or_action=="event") {
		obj.parentElement.parentElement.childNodes[2].innerHTML = str;
	} else{
		obj.parentElement.parentElement.childNodes[7].innerHTML = str;
		hidePopupAllDetWin();
	}

}

function changActionType(obj) {
	if (obj.value=="136") {//fill
		obj.parentElement.parentElement.childNodes[8].firstChild.style.display="block";
	} else {
		obj.parentElement.parentElement.childNodes[8].firstChild.style.display="none";
	}
	hidePopupAllDetWin();
}

function changeElement(obj,event_action) {
	if (obj.parentElement.parentElement.childNodes[1].firstChild.value==obj.parentElement.parentElement.childNodes[6].firstChild.value &&
		obj.parentElement.parentElement.childNodes[2].firstChild.value==obj.parentElement.parentElement.childNodes[7].firstChild.value &&
		obj.parentElement.parentElement.childNodes[2].firstChild.value != "") {
		alert(lab_arr[109]);
		obj.value="";	
	}
	hidePopupAllDetWin();	
	
	if (event_action=="event") {
			var str = "<input class=\"formfields\" type=\"text\"  value='' on style=\"width:100px; padding-left:4px;\"  onKeyPress='doEnter(this,event)' onblur='validCharacters(this)'  />";
			if (obj.value != "") {
				var myobj = listPages[obj.parentElement.parentElement.childNodes[1].firstChild.value].listObj[obj.value];
				
				
				if (myobj.propList['Values']) {
					obj.parentElement.parentElement.childNodes[3].firstChild.disabled = false;
					
					str = "<select class=\"formfields\" style=\"width:110px; padding-left:4px;\"><option value=''></option>";
					
					for (var i=0;i<myobj.propList['Values'].arrMulti.length;i++) {
						str +="<option class=\"formfields\" value="+myobj.propList['Values'].arrMulti[i].valueCode+">"+myobj.propList['Values'].arrMulti[i].valueDesc+"</option>";
					}
					
					str +="</select>";
					
				} else if (myobj.name=='Checkbox') {
					obj.parentElement.parentElement.childNodes[3].firstChild.value="==";
					obj.parentElement.parentElement.childNodes[3].firstChild.disabled =true;
					str  = "<select class=\"formfields\" style=\"width:110px; padding-left:4px;\"><option class=\"formfields\" value='0'>Unchecked</option><option class=\"formfields\" value='1'>Checked</option></select>";
				} else {
					obj.parentElement.parentElement.childNodes[3].firstChild.disabled = false;
				}
			}
			obj.parentElement.parentElement.childNodes[4].innerHTML = str;
	}
	
	
}

function deleteEvent(obj) {
	var v = confirm(lab_arr[112]);
	
	if (v) {
		var val = obj.parentElement.parentElement.cells[11].firstChild.value;
		
		if (val !="") {
			popupObjects[parseInt(val)].fdelete=1;
			
		}
		saveChangeState();
		obj.parentElement.parentElement.removeNode(true);
	}
}

function deletePdv(obj) {
	var v = confirm(lab_arr[113]);
	if (v) {
		var arr = listPages[current_div_index].listObj[current_div_obj_index].propList['Values'].arrMulti;
		if (arr) {
			for (var i=0; i < arr.length;i++) {
				if (arr[i].fdelete==0 && arr[i].valueCode == obj.parentElement.parentElement.cells[0].firstChild.value) {
					arr[i].fdelete=1;
				}
			}
		}
		
		/*affect the action elements*/
		var val = listPages[current_div_index].listObj[current_div_obj_index].det_id;
		
		if (val=="") {
			val = current_div_index+"#"+current_div_obj_index;
		}
		for (var k=0; k < popupObjects.length ; k++) {
			if(popupObjects[k].fdelete == 0 && popupObjects[k].id==22){
				if ( popupObjects[k].actionObjDbid==val) {
					if (popupObjects[k].propList["ActionType"].value == '136') {//fill
						for (var j=0; j< popupObjects[k].listValues.length;j++) {
							if (popupObjects[k].listValues[j].value== obj.parentElement.parentElement.cells[4].firstChild.value && popupObjects[k].listValues[j].fdelete==0) {
								popupObjects[k].listValues[j].fdelete = 1;
								break;
							}
						}
					}
				}
				if ( popupObjects[k].eventObjDbid==val) {
						if (obj.parentElement.parentElement.cells[4].firstChild.value == popupObjects[k].eventValue) {
							popupObjects[k].eventValue = "";
						}
				}
			}
		}
		saveChangeState();
		obj.parentElement.parentElement.removeNode(true);
	}
}

//add a <tr> for a where clause to the <table> of the where clause
function addRowWhereClause(db_index,dbid,fromtab,fromfield,totab,tofield,toparam) {
	var tab = document.getElementById("listWhereClause");
	
	var row_index = tab.rows.length;
	
	var myNewRow = tab.insertRow();
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var arrTable = popupObjects[db_index].propList['TablesList'].arrMulti;
	var str = "<select class=\"formfields\" id='fromtab"+row_index+"' onchange='changeWhereClause(this,\"from\");'><option value=''>";
	for (var i=0 ; i < arrTable.length ; i++) {
		if (arrTable[i].fdelete==0) {
			var id = arrTable[i].id;
			if (id=="") {id=db_index+"#"+i;}
			
			str +="<option class=\"formfields\" value='"+id+"' "+((id==fromtab)?"selected":"")+">"+arrTable[i].valueCode+"</option>";
		}
	}
	str +="</select>";
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:3px;'></TD>");
	td.innerHTML = "<input class=\"formfields\" type=\"text\" disabled id='fromfield"+row_index+"' value='"+fromfield+"' style=\"width:100px; padding-left:4px;\" />";
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD  style='padding-right:12px;'></TD>");
	td.innerHTML = "<input class=\"formfields\" type=\"button\" value=' ... ' onclick='getWhereClauseField(document.getElementById(\"fromtab"+row_index+"\").value,\"fromfield"+row_index+"\",window.event.clientX + document.body.scrollLeft,window.event.clientY + document.body.scrollTop)'>";
	myNewRow.appendChild(td);
	
    var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select disabled><option>=</option></select>";
	td.innerHTML = str;
	myNewRow.appendChild(td);
    
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select class=\"formfields\" id='parortab"+row_index+"' onchange='showHideParam("+row_index+");hidePopupAllDetWin();'><option class=\"formfields\" value='param' "+((toparam!="" && toparam!="0")?"selected":"")+"  >Parameter</option><option class=\"formfields\" value='table' "+((toparam!="" && toparam !="0")?"":"selected")+" >Table</option></select>";
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select class=\"formfields\" id='totab"+row_index+"' onchange='changeWhereClause(this,\"to\");' ><option class=\"formfields\" value=''>";
	for (var i=0 ; i < arrTable.length ; i++) {
		if (arrTable[i].fdelete==0) {
			var id = arrTable[i].id;
			if (id=="") {id=db_index+"#"+i;}
		
			str +="<option class=\"formfields\" value='"+id+"' "+((id==totab)?"selected":"")+">"+arrTable[i].valueCode+"</option>";
		}
	}
	str +="</select>";
	
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:3px;'></TD>");
	td.innerHTML = "<input class=\"formfields\" type=\"text\" disabled  id='tofield"+row_index+"' value='"+tofield+"' style=\"width:100px; padding-left:4px;\" />";
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	td.innerHTML = "<input class=\"formfields\" type=\"button\" value=' ... ' onclick='getWhereClauseField(document.getElementById(\"totab"+row_index+"\").value,\"tofield"+row_index+"\",window.event.clientX + document.body.scrollLeft,window.event.clientY + document.body.scrollTop)'>";
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD style='padding-right:12px;'></TD>");
	var str = "<select class=\"formfields\" id='param"+row_index+"'>";
	for(var i=0;i<popupObjects.length;i++){
		if(popupObjects[i].fdelete == 0 && popupObjects[i].id==10){
		   var id = popupObjects[i].det_id;
		   if (id=="") {id=i+"#";}
	  
			str +="<option class=\"formfields\" value=\""+id+"\" "+((id==toparam)?"selected":"")+"   >"+popupObjects[i].propList["Name"].value+"</option>"; 
	    }
    }
    str += "</select>";
	td.innerHTML = str;
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD></TD>");
	td.innerHTML = "<img src='../../img/popup/delete2.gif' border=0 onclick='deleteWhereClause(this);'>";
	myNewRow.appendChild(td);
	
	var td = document.createElement("<TD></TD>");
	td.innerHTML = "<input class=\"formfields\" type=\"hidden\" value='"+dbid+"' id='id"+row_index+"' />";
	myNewRow.appendChild(td);
	
	showHideParam(row_index);
		
}

//show/hide fields of the where clause row according to the dest type [param or table] 
function showHideParam(row_index) {
	var myrow = document.getElementById("listWhereClause").rows[row_index];
	
	if(myrow.cells[4].firstChild.value =="table"){ //if dest = table hide the parameter combo and show the dest table and field
	    myrow.cells[5].firstChild.style.display = "block";
		myrow.cells[6].firstChild.style.display = "block";
		myrow.cells[7].firstChild.style.display = "block";
		myrow.cells[8].firstChild.style.display = "none";
	}else { //hide the dest table and field and show the param
	   myrow.cells[5].firstChild.style.display = "none";
		myrow.cells[6].firstChild.style.display = "none";
		myrow.cells[7].firstChild.style.display = "none";
		myrow.cells[8].firstChild.style.display = "block";
	}	
}

// *************** to be changed *************** (field lists from where clause config.)
//when user click on "..." in a where clause row
function getWhereClauseField(val,dest_id,pos_x,pos_y) {
    var cnv = showPopupAllDetWin(pos_x-150,pos_y,"268","","");
    
    var html_str  ="<table border=0  cellspacing=0 cellpadding=0>"
	        	  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[36]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllDetWin()'></td></tr></table></td></tr>"
				   +"<tr><td class=\"pUpContainer\"><div class=\"pUpInnerBorder\" style='width:250px; height:200px;'><div id='subcnv' style='overflow: auto;'></div></div></td></tr>"
	              +"</td></tr>"
				  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" id='closeFieldList' type='button' value='"+lab_arr[24]+"' onclick='hidePopupAllDetWin()'></td></tr>"
                  +"</table></td></tr></table>";
	
	cnv.innerHTML = html_str;
    
   
    getFieldList(val,document.getElementById("subcnv"),dest_id);
    document.getElementById("closeFieldList").focus();    
}

//when user click on save button of the where clause config
function saveListWhereClause(db_index) {
	
	popupObjects[db_index].whereClauseArr = new Array(); //empty the where clause object of the current db
	
	var tab = document.getElementById("listWhereClause"); //pointer on the list list  where clause <table>
	
	for (var i=1; i < tab.rows.length ; i++) { //process row by from after the 1 rst row
		
		//from table
		if (!validateWhereClause(tab.rows[i].cells[0].firstChild,"from")) {
			tab.rows[i].cells[0].firstChild.focus();
			return;	
		}
		 
		//to table
		if (!validateWhereClause(tab.rows[i].cells[5].firstChild,"to")) {
			tab.rows[i].cells[6].firstChild.focus();
			return;
		}
		
		//from table
		if (tab.rows[i].cells[0].firstChild.value=="") {
			alert(lab_arr[55]);
			tab.rows[i].cells[0].firstChild.focus();
			return;
		}
		//where field
		if (tab.rows[i].cells[1].firstChild.value=="") {
			alert(lab_arr[56]);
			tab.rows[i].cells[2].firstChild.focus();
			return;
		}
		
		//if dest type parameter
		if (tab.rows[i].cells[4].firstChild.value=="param") {
			//param
			if (tab.rows[i].cells[8].firstChild.value=="") {
				alert(lab_arr[57]);
				tab.rows[i].cells[8].firstChild.focus();
				return;
			}	
		}else {
			//dest table
			if (tab.rows[i].cells[5].firstChild.value=="") {
				alert(lab_arr[58]);
				tab.rows[i].cells[5].firstChild.focus();
				return;
			}
			//dest field
			if (tab.rows[i].cells[6].firstChild.value=="") {
				alert(lab_arr[59]);
				tab.rows[i].cells[7].firstChild.focus();
				return;
			}
		}
		
		//is valid row create and add object to the whereClauseArr
		var obj = new Object();
		
		obj.id = tab.rows[i].cells[10].firstChild.value;
		obj.fromcol = tab.rows[i].cells[1].firstChild.value;
		obj.frompdv = tab.rows[i].cells[0].firstChild.value;
		if (tab.rows[i].cells[4].firstChild.value=="param") {
			obj.toparam = tab.rows[i].cells[8].firstChild.value;
			obj.tocol = "";
			obj.topdv = "";		
		}else {
			obj.toparam = "";
			obj.tocol = tab.rows[i].cells[6].firstChild.value;
			obj.topdv = tab.rows[i].cells[5].firstChild.value;
		}
		popupObjects[db_index].whereClauseArr[popupObjects[db_index].whereClauseArr.length] = obj;	
	}
	closeListWhereClause();
}

//fill the list of databases in the database config popup
function drawDatabasesList(){
 var databaseTable = "<table width='100%'><tr><td>";
		for(var i=0;i<popupObjects.length;i++){
		if(popupObjects[i].fdelete == 0 && popupObjects[i].id==9){
	    	if (i!=0) { 
	    		databaseTable +="<tr><td class='linkout' onmouseover='linkTableMouseOver(this)' onmouseout='linkTableMouseOut(this)' onclick='addDatabaseClick("+i+")' height='18px' style='padding-left:3px; border-top-style:solid; border-top-width:1px; border-top-color:#52636D; border-left-style:solid; border-left-width:1px; border-left-color:#52636D; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#B0CFE2;'>"+popupObjects[i].propList["Name"].value+"</td><td class='linkout' align='center' width='30px' height='18px' style='border-top-style:solid; border-top-width:1px; border-top-color:#52636D; border-right-style:solid; border-right-width:1px; border-right-color:#B0CFE2; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#B0CFE2' onmouseover='linkTableMouseOver(this.previousSibling)' onmouseout='linkTableMouseOut(this.previousSibling)'><img src='../../img/popup/delete2.gif' border=0 onclick='deleteDatabase("+i+",this);' /></td>";
	    	}else {
	    		databaseTable +="<tr><td class='linkout' height='16px' style='padding-left:3px; border-left-style:solid; border-left-width:1px; border-left-color:#52636D;'>"+popupObjects[i].propList["Name"].value+"</td><td class='linkout' width='30px' style='border-right-style:solid; border-right-width:1px; border-right-color:#B0CFE2;'><img src='../../img/popup/spacer.gif' border=0 /></td>";
	    	}
	    		
	    	databaseTable += "</tr>";
	    	}
	    }
	    databaseTable += "</table>";
	document.getElementById("listDatabases").innerHTML = databaseTable;
}

function parameterTable(){
 var parameterTable = "<table width='100%'><tr><td>";

		for(var i=0;i<popupObjects.length;i++){
		if(popupObjects[i].fdelete == 0 && popupObjects[i].id==10){
	    	parameterTable += "<tr><td class='linkout' onmouseover='linkTableMouseOver(this)' onmouseout='linkTableMouseOut(this)' onclick='addParameterClick("+i+")' height='18px' style='padding-left:3px; border-top-style:solid; border-top-width:1px; border-top-color:#52636D; border-left-style:solid; border-left-width:1px; border-left-color:#52636D; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#B0CFE2;'>"+popupObjects[i].propList["Name"].value+"</td>"
	    	  +"<td class='linkout' align='center' width='30px' height='18px' style='border-top-style:solid; border-top-width:1px; border-top-color:#52636D; border-right-style:solid; border-right-width:1px; border-right-color:#B0CFE2; border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:#B0CFE2' onmouseover='linkTableMouseOver(this.previousSibling)' onmouseout='linkTableMouseOut(this.previousSibling)'><img src='../../img/popup/delete2.gif' border=0 onclick='deleteParameter("+i+",this);'/></td>"
	    	  +"</tr>";
	    	}
	    }
	    parameterTable += "</table>";
		document.getElementById("listParameters").innerHTML = parameterTable;
}

//delete a parameter and adjust related obj
function deleteParameter(rowNum,obj){
	var ret = confirm(lab_arr[37]);
	
	if (ret) {
		popupObjects[rowNum].fdelete = 1;
		var val = popupObjects[rowNum].det_id;
		if (val==""){val=rowNum+"#";}
		
		//delete where clauses related to it
		for(var i=0;i<popupObjects.length;i++){
			if(popupObjects[i].fdelete == 0 && popupObjects[i].id==9){
		    	for (var j=0;j < popupObjects[i].propList['TablesList'].arrMulti.length;j++) {
		    		var wcList = popupObjects[i].whereClauseArr;
		    		if (wcList) {
			    		for (var k=0;k < wcList.length;k++) {
			    			if (wcList[k].toparam==val) {
			    				var newWcList = new Array();
								for (var l=0;l<wcList.length; l++) {
									if (k!=l)
										newWcList[newWcList.length] = wcList[l];
								} 
								wcList = newWcList;
				    		}	    		
			    		}
		    		}
		    		popupObjects[i].whereClauseArr = wcList;
		    	}
		    } 	    
		 }
		 
		 //empty all parameters properties for the pages element 
		 if (listPages.length >0) {
			for (var i=0; i <listPages.length ; i++) {      
			    var pobj = listPages[i].listObj;
			    if (pobj.length > 0) {
			    	for (var j=0 ; j < pobj.length ; j++) {
			    		if (pobj[j].fdelete ==0 && getPropertyValueWithIndex("Parameter",i,j)==val ) {
			    			setPropertyValueWithIndex("Parameter","",i,j);
			    		}
			    	}
			    }
			}
		}
		saveChangeState();
		obj.parentElement.parentElement.removeNode(true);
	}
}

//delete database and adjsut related objects
function deleteDatabase(rowNum,obj){
	var ret  = confirm(lab_arr[38]);
	
	if (ret) {
		popupObjects[rowNum].fdelete = 1; //logically delete it
		
		for (var i= 0; i < popupObjects[rowNum].propList['TablesList'].arrMulti.length;i++) {//remove all tables and their dependencies
			removeDatabaseTable(rowNum,i,popupObjects[rowNum].propList['TablesList'].arrMulti[i].id);
		}
		saveChangeState();
		obj.parentElement.parentElement.removeNode(true);
	}
		
}

function getXMLDoc(filePath)
{
	var xmlDoc;
	if (window.ActiveXObject)
	{
		xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
	    xmlDoc.async=false;
	    xmlDoc.load(filePath);
	}
	else
	{
		xmlDoc = document.implementation.createDocument("", "", null);
	    xmlDoc.async=false;
		xmlDoc.load(filePath);
	}
	return xmlDoc;
}

//called when clicking on the tables config menu
function fillTablesList(){	
        removeFocusCurrentPageObj();
        doMouseOut(dynmenu2,0);
		var selectValue = "<select id=\"dblist\" onChange=\"fillListDatabaseTable(this.value)\">";
		for(var i=0;i<popupObjects.length;i++){
			if(popupObjects[i].fdelete == 0 && popupObjects[i].id==9)
	    	selectValue += "<option value="+i+">"+popupObjects[i].propList["Name"].value+"</option>";
	    }
		selectValue += "</select>"; 
		
		var htmlValue ="<table border=0 width='350px' cellspacing=0 cellpadding=0 align='center'>"
	        		  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[39]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hideTablesList(document.getElementById(\"dblist\").value)'></td></tr></table></td></tr>"
	        		  +"<tr><td class=\"pUpContainer\"><table border=0 cellspacing=0 cellpadding=0><tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class='tabheader2'><td>"+selectValue+"<input class=\"formfields\" type='button' value='...' onclick='fillListTables(window.event.clientX + document.body.scrollLeft,window.event.clientY + document.body.scrollTop,document.getElementById(\"dblist\").value)'></td></tr></table></td></tr>"
	        		  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class='tabheader2'><td>"+lab_arr[86]+"</td></tr></table></td></tr>"
	        		  +"<tr><td><div class=\"pUpInnerBorder\" style='width:340px;'><div id='listDatabaseTable' style='overflow: auto; height:200px;'></div></div></td></tr></table></td></tr>"
	        		  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" id='closeTableConf' type='button' value='"+lab_arr[24]+"' onclick='hideTablesList(document.getElementById(\"dblist\").value)'></td></tr>"
	        		  +"</table></td></tr></table>";
	  
		
		var t = showPopupAllWin("","",htmlValue);
		fillListDatabaseTable(document.getElementById("dblist").value);
		document.getElementById("closeTableConf").focus();
}

//fill the list of tabled related to the chosen db of the tables config popup
function fillListDatabaseTable (db_index) {
  hidePopupAllDetWin();
  var myDiv = document.getElementById("listDatabaseTable");
  var str = "<table>";
  var listTab = popupObjects[db_index].propList['TablesList'].arrMulti;
  
  var arr_displayed = new Array(); //used to display the tables list in "valueOrder" properties
  
  //fill arr_displayed in order
  for (var i=0; i < listTab.length ; i++) {
   	if (listTab[i].fdelete==0) {
       if (arr_displayed.length==0) {
       		arr_displayed[0] = i;
       } else {
	       var valid_pos = 0;
	       for (var j=0;j<arr_displayed.length;j++) {
	       		if (parseInt(listTab[i].valueOrder) < parseInt(listTab[arr_displayed[j]].valueOrder)) {
	       			valid_pos=j;
	       			break;
	       		}
	       		if (j==arr_displayed.length-1) {
	       			valid_pos = j+1;
	       		}
	       }
	       
	       if (arr_displayed.length==valid_pos) {
	       	arr_displayed[valid_pos] = i;
	       }
	       else {
	       	 for (var j=arr_displayed.length;j >= valid_pos;j--) {
	       	 	arr_displayed[j]=arr_displayed[j-1];
	       	 }
	       	 arr_displayed[valid_pos]=i;
	       }  	       
       }   	  	 	
   	 }			
  }	
  
  //display the tables of listTab in arr_displayed order
  for (var i=0; i < arr_displayed.length ; i++) {
   	 	
  	 	var minus_one =-1;
  	 	var plus_one  =-1;
  	 	
  	 	if (i>0){minus_one=arr_displayed[i-1];}
  	 	if (i<arr_displayed.length-1){plus_one=arr_displayed[i+1];}
  	 	listTab[arr_displayed[i]].valueOrder=i+1;
  	 	//str += "<tr><td>"+(i+1)+".</td><td>"+listTab[arr_displayed[i]].valueCode+"</td><td><img src='../../img/popup/up.gif' onclick='moveTab("+db_index+","+minus_one+","+arr_displayed[i]+")'/></td><td><img src='../../img/popup/down.gif' onclick='moveTab("+db_index+","+arr_displayed[i]+","+plus_one+")'/></td></tr>";		
  		str += "<tr><td><div class='tabname' style='background-color:#e9e9e9'><nobr>"+(i+1)+". "+listTab[arr_displayed[i]].valueCode+"</nobr></div></td><td><img  id='uptb"+i+"' src='../../img/popup/up.gif' hspace='0' vspace='0' border='0' onclick='moveTab("+db_index+","+minus_one+","+arr_displayed[i]+")' onmouseover='imgOver(this, \"1\")' onmouseout='imgOver(this, \"0\")' style=\"cursor:pointer; margin-right:1px\"/><img  id='dotb"+i+"' src='../../img/popup/down.gif' hspace='0' vspace='0' border='0' onclick='moveTab("+db_index+","+arr_displayed[i]+","+plus_one+")' onmouseover='imgOver(this, \"3\")' onmouseout='imgOver(this, \"2\")' style=\"cursor:pointer\"/></td></tr>";
  
  }  
  str +="</table>";
  myDiv.innerHTML = str;
  
}

//fill the list of where clauses related to the chosen db in the where clause config popup
function fillListWhereClause(db_index) {
	var whereList =popupObjects[db_index].whereClauseArr;
	var tab = document.getElementById("listWhereClause").rows;

	//empty the div from old where clauses
	for (var i=tab.length -1; i >= 1 ; i--) {
	
		tab[i].removeNode(true);
	}
	
	//refill the where clauses of the current db
	if (whereList) {
	
		for (var i=0; i< whereList.length; i++) {
			var obj = 	whereList[i];		
			addRowWhereClause(db_index,obj.id,obj.frompdv,obj.fromcol,obj.topdv,obj.tocol,obj.toparam);			
		}
	}
}

//get the list of tables when user click on "..." on the tables configuration popup 
function fillListTables(x_pos,y_pos,db_index) {
	var cnv = showPopupAllDetWin(x_pos,y_pos,"218","","");
	
	var html_str  ="<table border=0  cellspacing=0 cellpadding=0>"
	        	  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[40]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllDetWin()'></td></tr></table></td></tr>"
				  +"<tr><td class=\"pUpContainer\"><div class=\"pUpInnerBorder\" style='width:200px; height:200px;'><div id='mytabs' style='overflow: auto;height:195px;'></div></div></td></tr>"
	              +"</td></tr>"
				  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" type='button' value='"+lab_arr[9]+"' onclick='saveTable("+db_index+"), saveChangeState()'><input class=\"formfields\" id='closeTableList' type='button' value='"+lab_arr[24]+"' onclick='hidePopupAllDetWin();'></td></tr>"
                  +"</table></td></tr></table>";
	
	cnv.innerHTML = html_str;
	
	//get the list of tables/calling lst tables related to db_index and place them on "mytabs" div according the the popup type [IN/OUT]
	fillFieldOrTableList(db_index,-1,document.getElementById("mytabs"),popType);
	
	var listTab = popupObjects[db_index].propList['TablesList'].arrMulti;
	
	//process the genrated list to check the already chosen table
	for (var i=0; i < listTab.length ; i++) {
		if (listTab[i].fdelete==0) {
			var tabs = document.getElementById("tabs");
			for(var j=0;j<tabs.rows.length;j++){
	    		var cells=tabs.rows[j].cells;
	    		
	    		if (cells[0].firstChild.value == listTab[i].valueCode) {
	    			cells[0].firstChild.checked = true;
	    			break;
	    		}
	
	   		}
	   	}
    }	
    document.getElementById("closeTableList").focus();	
}

function hideTablesList(db_index) {
	var listTab = popupObjects[db_index].propList['TablesList'].arrMulti;
	var fexist = 0;
	for (var i= 0; i < listTab.length ; i++ ) {
			if ( listTab[i].fdelete==0) {
				fexist ++;
			}
	}		
	if (fexist > 1) {
		alert(lab_arr[89]);
	}
	hidePopupAllWin();
}
	
//called when usrr click on the save button of the detail popup of the tables configuration window
function saveTable(db_index){
	var temp = new Array();
	var tabs = document.getElementById("tabs");
	for(var i=0;i<tabs.rows.length;i++){
    	var cells=tabs.rows[i].cells;
    	
    	if (cells[0].firstChild.checked==true) {
    		temp[temp.length] = cells[0].firstChild.value;
    	}
   	}
	var listTab = popupObjects[db_index].propList['TablesList'].arrMulti;
	
	
	if (popType=='OUT' && db_index==0) {
		if 	(popupObjects[db_index].propList['TablesList'].arrMulti) {
			if (popupObjects[db_index].propList['TablesList'].arrMulti.length==1) {
				if (temp.length==1) {
					popupObjects[db_index].propList['TablesList'].arrMulti[0].valueCode = temp[0];
					popupObjects[db_index].propList['TablesList'].arrMulti[0].valueDesc = temp[0];				
				}
				fillListDatabaseTable(db_index);
				hidePopupAllDetWin();
				return;
			}
		}
			
	}

	for (var i= 0; i < listTab.length ; i++ ) {
		var fexist = 0;
		for (var j=0 ; j < temp.length ; j++) {
			if (temp[j] ==  listTab[i].valueCode && listTab[i].fdelete==0) {
				fexist = 1; break;
			}
		}
		
		if (fexist == 0) {
			listTab[i].fdelete=1;
			removeDatabaseTable(db_index,i,listTab[i].id);
		}
	}
	
	for (var i=0 ; i < temp.length ; i++) {
		var fexist = 0;
		for (var j=0 ; j < listTab.length ; j++) {
			if (temp[i] == listTab[j].valueCode && listTab[j].fdelete==0 ) {
				
				fexist = 1; break;
			}
		}

		if (fexist==0) {

			listTab[listTab.length] = addPdv("",temp[i],temp[i]);
			listTab[listTab.length-1].valueOrder = listTab.length;
		}	
	}

	fillListDatabaseTable(db_index);
	hidePopupAllDetWin();
}

function emptyListTables() {
	document.getElementById("listDatabaseTable").innerHTML = "";
	document.getElementById("listDatabaseTable").style.height = "";
	
}

//get the list of tables[x !=-1 and y=-1] or fields of a table[x !=-1 and y!=-1]
//x 		==>db index in listPopObject
//y 		==>tab index in listPopObject[x].propList['TablesList'].arrMulti
//obj 		==>where to place the result string
//dest_id	==>[y!=-1](get fields) the id of the div when to put theresult when user click in the obj area 
//			   [y=-1](get tables)  send the type of popup 'IN' or 'OUT'
function fillFieldOrTableList(x,y,obj,dest_id){
		    
     if (x != "-1" ) {
        var xmlhttp = getHTTPRequest(); 
	    xmlhttp.open("POST","popupdetail.jsp?mn=fillFieldOrTableList&x="+x+"&y="+y+"&dest="+dest_id ,false);
	    xmlhttp.onreadystatechange = handleSendUpdateReponse;
	    xmlhttp.send(getXMLDBConn(x,y));
	    if(xmlhttp.responseText != null){
	    	obj.innerHTML =xmlhttp.responseText;	
	    }	        
	 }
	 else {
	 	obj.innerHTML ="";
	 }     
}

function handleSendUpdateReponse(){
}

//get the list of fields for a table
function getFieldList(val,obj,dest_id) {
	var coord = getTableIndexes(val); //get the db index an tab index of the current table
	fillFieldOrTableList(coord.x,coord.y,obj,dest_id); 
	
}

//get the list of tenant popups 
function getListPopUps(obj) {

  obj.innerHTML ="";
  var xmlhttp = getHTTPRequest(); 
  xmlhttp.open("POST","popupdetail.jsp?mn=getListPopUps&tenant="+tenantDbid ,false);
  xmlhttp.onreadystatechange = handleSendUpdateReponse;
  xmlhttp.send();
  if(xmlhttp.responseText != null){
  	obj.innerHTML =xmlhttp.responseText;	
  }	        
}

//test if the popname is unique
function ckeckPopUniqueId(name,id) {
	var ret = "0";
	var xmlhttp = getHTTPRequest(); 
  xmlhttp.open("POST","popupdetail.jsp?mn=ckeckPopUniqueId&tenant="+tenantDbid+"&name="+name+"&id="+id ,false);
  xmlhttp.onreadystatechange = handleSendUpdateReponse;
  xmlhttp.send(); //send request to the server
  if(xmlhttp.responseText != null){
  	ret =xmlhttp.responseText;	
  }	 	
  return ret;
}

//called when user click on add /update a databse in the db popup ==>generate the code of the detail window 
function addDatabaseClick(rowNum){
	if (document.getElementById("popupalldetwin").style.display == "none") {

		var x_pos = window.event.clientX + document.body.scrollLeft - document.body.clientLeft;
		var y_pos = window.event.clientY + document.body.scrollTop  - document.body.clientTop;

		var databaseWindow ="<table border=0 width='300' cellspacing=0 cellpadding=0>"
		        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[28]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllDetWin()'></td></tr></table></td></tr>"
		        + "<tr><td align='center' class=\"pUpContainer\">";
		if(rowNum == -1) {//click to add a new db
			databaseWindow += getPropStr (0,0,3);
		}
		else { //click to update a db
		   databaseWindow += getPropStr (0,rowNum,2);
		} 
	
		databaseWindow +="</td></tr>"
					   +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" type='button' value='"+lab_arr[9]+"' onclick='addDatabaseobject("+rowNum+"), saveChangeState()'><input class=\"formfields\" id='closeDatabase' type='button' value='"+lab_arr[24]+"' onclick='hidePopupAllDetWin()'><input class=\"formfields\" type='button' value='"+lab_arr[41]+"' onclick='testConnection()'/></td></tr>"
	                   +"</table></td></tr></table>";

		showPopupAllDetWin(x_pos,y_pos,"300","",databaseWindow);
	    document.getElementById("closeDatabase").focus();
	 }
}

//called when user click on add /update a parameter in the parameter popup ==>generate the code of the detail window 
function addParameterClick(rowNum){
	if (document.getElementById("popupalldetwin").style.display == "none") {
		var x_pos = window.event.clientX + document.body.scrollLeft - document.body.clientLeft;
		var y_pos = window.event.clientY + document.body.scrollTop  - document.body.clientTop;

		var parameterWindow ="<table border=0 width='300' cellspacing=0 cellpadding=0>"
		        + "<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[46]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllDetWin()'></td></tr></table></td></tr>"
		        + "<tr><td align='center' class=\"pUpContainer\">";
		if(rowNum == -1) {//click on "+"
			parameterWindow += getPropStr (0,1,3);    
		}
		else {//click on existing param
		   parameterWindow += getPropStr (0,rowNum,2);
		} 
	
		parameterWindow +="</td></tr>"
					   +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" type='button' value='"+lab_arr[9]+"' id='but_save_param' onclick='addParameterobject("+rowNum+"), saveChangeState()'><input class=\"formfields\" id='closeParameter' type='button' value='"+lab_arr[24]+"' onclick='hidePopupAllDetWin()'></td></tr>"
	                   +"</table></td></tr></table>";
		
				  
		showPopupAllDetWin(x_pos,y_pos,"300","",parameterWindow);
		document.getElementById("closeParameter").focus();
	}
}

//called when user click on test connection
function testConnection(){
        var xmlhttp = getHTTPRequest(); 
        var databaseData =  getObjectFromIndex(0,0,2);
        //build the xml string necessary for testing the connection
        var result = "<root>";
        
        //loop on the properties of the database definition object and pass the value from the input values of the screen
        for(var prop in databaseData.propList)
		{
			if(prop != "TablesList")
			{
				result +="<"+prop+">"+ document.getElementById(prop).value +"</"+prop+">";
			}
		}
		result += "</root>";
	    xmlhttp.open("POST","popupdetail.jsp?mn=testConnection" ,false);
	    xmlhttp.onreadystatechange = handleSendUpdateReponse;
	    xmlhttp.send(result);
	    //send the request to the server
    	if(xmlhttp.responseText.indexOf("null") >= 0){ //test failed
    		alert(lab_arr[45]);
    	}
    	else{//succeeded
    		alert(lab_arr[44]);
    	}        
}

//called to modify or add a database ==> when user click on save button
function addDatabaseobject(rowNum)
{
	var intialRowNum = rowNum;
	
	//test the unicity of the name
	for(var i=0;i<popupObjects.length;i++){
			if(popupObjects[i].fdelete == 0 && popupObjects[i].id==9 && (popupObjects[i].propList['Name'].value==document.getElementById('Name').value && rowNum !=i)) {
				alert(lab_arr[61]);
				return;
			}
	}
	
	if(rowNum == -1){ // add a database
		rowNum = popupObjects.length;
		var obj = new cloneObject(listPopObject[0]);
		obj.propList['TablesList'].arrMulti = new Array();
		popupObjects[rowNum] = obj;
		
	}
	
	//validate the properties list values
	for (var i in  popupObjects[rowNum].propList) {	
			if(i != "TablesList") {
				if (IsValidPropValue(i,document.getElementById(i),0,rowNum,2)) {
					popupObjects[rowNum].propList[i].value = document.getElementById(i).value;
				}
				else {//if trying to add remove the last cloned object
					if (intialRowNum==-1) {popupObjects.length = popupObjects.length-1;}
					return;
				}	
			}
	}

	hidePopupAllDetWin();
	drawDatabasesList();
}

//called to modify or add a parameter ==> when user click on save button
function addParameterobject(rowNum)
{
	intialRowNum = rowNum; 
	if(rowNum == -1){ // add parameter
		rowNum = popupObjects.length;
		var obj = new cloneObject(listPopObject[1]); //1==> index of parameter object in listPopObject
		popupObjects[rowNum] = obj;	
	}
	for (var i in  popupObjects[rowNum].propList) {	
	       
	       //test unicity of the parameter name
	       if (i=='Name') {
		       for(var j=0;j<popupObjects.length;j++){
		          if(popupObjects[j].propList[i].value==document.getElementById(i).value && j!=rowNum && popupObjects[j].fdelete == 0 && popupObjects[j].id==10  ){
		            alert(lab_arr[85])
		            document.getElementById(i).focus();
		            document.getElementById(i).select();
		            if (intialRowNum==-1) {popupObjects.length = popupObjects.length-1;}
		            return;
		          }
		       }
	       }
	       
	       //validate the value 
		   if (IsValidPropValue(i,document.getElementById(i),0,rowNum,2)) {		
			    popupObjects[rowNum].propList[i].value = document.getElementById(i).value;
		    } else { //if it is not vaild and trying to add parameter ==> remove the cloned object
				if (intialRowNum==-1) {popupObjects.length = popupObjects.length-1;}
				return;
		    }
	}

	hidePopupAllDetWin(); //hide the detail popup
	parameterTable();//redraw the parameters list  popup
}

function closeListTable(){
	hidePopupAllWin();
}

function closeListWhereClause(){
	hidePopupAllWin();
}
function closeEvents(){
	hidePopupAllWin();
}
function closePathFile() {
	hidePopupAllWin();
}

var rowClick =null;
function linkTableMouseOver(thisParam){
	rowClick = thisParam;
	thisParam.className = "linkover";
}
function linkTableMouseOut(thisParam){
	rowClick.className = "linkout";
}

function linkPageMouseOver(thisParam,div_index){
	rowClick = thisParam;
	if (div_index !=current_div_index || new_cur_index == null) {	
		thisParam.className = "linkpageover";
	}
}
function linkPageMouseOut(thisParam,div_index){
	if (div_index !=current_div_index || new_cur_index == null) {	
		rowClick.className = "linkpageout";
	}
}

function linkOverPopName(thisParam) {
	if (thisParam.className=="popdisplay") {
		thisParam.className = "popdisplayover";
	}
}
function linkOutPopName(thisParam) {

	if (thisParam.className=="popdisplayover") {
		thisParam.className = "popdisplay";
	}
}

function linkClickPopName(thisParam) {
//	thisParam.className = "popdisplayclick";
	thisParam.className = "popdisplay";
}

function linkFieldClick(thisParam,id,dest_id){
	document.getElementById(dest_id).value = id;
	hidePopupAllDetWin();
}

//remove a database table ==> adjust all related objects
function removeDatabaseTable(db_index,tab_index,tab_dbid) {
	
	var val = tab_dbid;
	if (tab_dbid=="" || tab_dbid =="0") {
		val = db_index+"#"+tab_index;
	}
	
	//remove all bindings to this table and their fields from all pages elements
	for (var i = 0 ; i < listPages.length; i++) {
		for (var j = 0 ; j < listPages[i].listObj.length; j++) {
			
			if (getPropertyValueWithIndex("Datasource",i,j)==val) {
				setPropertyValueWithIndex("Datasource","",i,j);
				setPropertyValueWithIndex("Field","",i,j);	
			}
		}
	}
	//remove all where clauses related to this table
	for (var i = 0 ; i < popupObjects[db_index].whereClauseArr.length; i++) {
		var wcList = popupObjects[db_index].whereClauseArr;
		
		if (wcList) {
			for (var j = wcList.length -1  ; j >=0 ; j--) {
				if (wcList[j].topdv == val || wcList[j].frompdv == val ) {
					var newWcList = new Array();
					for (var k=0;k<wcList.length; k++) {
						if (k!=j)
							newWcList[newWcList.length] = wcList[k];
					} 
					wcList = newWcList;
				}
				
			}
			popupObjects[db_index].whereClauseArr = wcList;
		}					
	}
	
	saveChangeState();
}

//remore a whereclause row
function deleteWhereClause(obj) {
	var ret = confirm(lab_arr[88]);
	if (ret) {
		saveChangeState();
		obj.parentElement.parentElement.removeNode(true);
	}
}

function openPopUp(val) {
	if (needToSaveChanges) {
		var delChanges = confirm (lab_arr[135]+"\n"+lab_arr[136]);
		if (!delChanges) {
			return false;
		}
		needToSaveChanges=false;
	}
	if (document.getElementById("listPop")) {
		document.getElementById("listPop").innerHTML = "<div style='padding-left:15px; padding-top:25px; color:#ffffff'>"+lab_arr[137]+"<br /><br />"+lab_arr[122]+".</div>";
	}
	
     document.getElementById("cdynmenu1").style.visibility="hidden";
	 if (val=="0") {
		  document.location.href="popup.jsp?tenant_dbid="+tenantDbid;
	 }else {
		  document.location.href="popup.jsp?popdbid="+val+"&tenant_dbid="+tenantDbid;
	}
}

function openPopupList(val) {
	      doMouseOut(dynmenu1,0); 
	      var htmlValue ="<table border=0 width='300' cellspacing=0 cellpadding=0 align='center' >"
	        	      	  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[47]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllWin()'></td></tr></table></td></tr>"		  
						  +"<tr><td class=\"pUpContainer\"><div class=\"pUpInnerBorder\" style='width:282px; height:100px; overflow: auto;'><div id='listPop' style='overflow: auto;'></div></div></td></tr>"
	        	     	  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\" id='closeDivPopname2' type='button' value='"+lab_arr[24]+"' onclick='hidePopupAllWin()'></td></tr>"
	        		      +"</table></td></tr></table>";
	       
	      var x_pos = window.event.clientX + document.body.scrollLeft - document.body.clientLeft;
	      var y_pos = window.event.clientY + document.body.scrollTop  - document.body.clientTop;
	
	
	      if (val=="popupallwin") {
	        	showPopupAllWin("","",htmlValue);
	      }else {
		        showPopupAllDetWin(x_pos ,y_pos,"300","",htmlValue);
	      }
	
	
	
          document.getElementById("closeDivPopname2").focus();

	      getListPopUps(document.getElementById("listPop"));
}

function saveAs() {
		  doMouseOut(dynmenu1,0);
          var htmlValue ="<table border=0 width='250px' cellspacing=0 cellpadding=0 align='center' >"
	             		  +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popheadbg\"><td>"+lab_arr[62]+"</td><td align='right'><img src='../../img/close2.gif' onclick='hidePopupAllWin()'></td></tr></table></td></tr>"
	        	    	  +"<tr><td class=\"pUpContainer\" style='padding-bottom:0px;'><div class=\"pUpInnerBorder\" style='width:200px; color:#ffffff;'>"+lab_arr[63]+"<div style='width:178px; padding-top:1px;'><input class=\"formfields\" type='text' value='"+popDescription+"' id='saveasname' onBlur='validCharacters(this)' style=\"width:169px; padding-left:4px;\"></div></div></td></tr>"
	        		      +"<tr><td><table border=0 width='100%' cellspacing=0 cellpadding=2><tr class=\"popbottombg\" ><td align='center'><input class=\"formfields\"  type='button' value='"+lab_arr[9]+"' onclick='saveAsPopup()'><input class=\"formfields\" id='closeDivPopname2' type='button' value='"+lab_arr[24]+"' onclick='hidePopupAllWin()'></td></tr>"
	        		      +"</table></td></tr></table>";
	       

	       showPopupAllWin("","",htmlValue);
           document.getElementById("closeDivPopname2").focus();    
}

function saveAsPopup() {
	if (document.getElementById("saveasname").value == "") {
		alert(lab_arr[20]);
		document.getElementById("saveasname").focus();
		return;	
	}
	var fexixst_dbid = ckeckPopUniqueId(document.getElementById("saveasname").value,"0");
	
	if (fexixst_dbid !="0") {
		alert(lab_arr[52]);
		document.getElementById("saveasname").focus();
		document.getElementById("saveasname").select();
		return;
	}
	popDescription = document.getElementById("saveasname").value;
	if (popId=="") {
		
		initialPopName = getPopDescription();
		savePopup();
	}else {
		initialPopName = getPopDescription();
		savePopup("saveas");
	}
}

//when source or dest table changed in the where clause ==> call the validation method
function changeWhereClause(obj,from_or_to) {
	var curr_row = obj.parentNode.parentNode;
	
	if (validateWhereClause(obj,from_or_to)) {
		if (from_or_to=="from") {
			curr_row.cells[1].firstChild.value="";		
		}	
		if (from_or_to=="to") {
			curr_row.cells[6].firstChild.value="";					
		}
	}
	//document.getElementById(from_or_to+"field"+idx).value="";
	hidePopupAllDetWin();
}

//for validation of a where clause
function validateWhereClause(obj,from_or_to) {
	var wctab =obj.parentNode.parentNode.parentNode.rows; //pointer to the container of the <tr>
	var curr_row = obj.parentNode.parentNode; //pointer to the current row 
	
	//validation of the from table
	if (from_or_to=="from") { 	
		for (var i=1; i <wctab.length; i++) { //loop from the first row to the current row ==> if table exist in the dest part of a row stop execution
			if (wctab[i]==curr_row) {
				break;
			}	
			//if from table of curr row == dest table of the i row   ==> empty the from table and field
			if (wctab[i].cells[5].firstChild.value == obj.value && wctab[i].cells[4].firstChild.value=="table") {
				alert(lab_arr[64]);
				curr_row.cells[0].firstChild.value = "";
				curr_row.cells[1].firstChild.value="";
				return false;
			}
		}		
	}
	//validation of the dest table (test if the curr dest table is already used in previous rows as "from table" )
	if (from_or_to=="to") { 
		var f_exist = 0; 
		//if dest table is not empty and type of dest==table
		if (curr_row.cells[4].firstChild.value=="table" && curr_row.cells[5].firstChild.value !="") {
			//loop from first row to the current row
			for (var i=1; i <wctab.length; i++) {	
				if (wctab[i]==curr_row) { //if loop attends the curent row exit loop
					break;
				}	
				
				//if the from table of the 'i' row == the dest of the curr row ==> therer is a filter on the curr table 
				if (wctab[i].cells[0].firstChild.value == curr_row.cells[5].firstChild.value) { 
					f_exist=1;
					break;
				}
			}	
			//if no filter already exist for the current row ==> stop the process and empty the dest. table and field
			if (f_exist==0) {
				alert(lab_arr[65]);
					curr_row.cells[5].firstChild.value = "";
					curr_row.cells[6].firstChild.value="";
					return false;	
			}
		}
	}
	return true;

}

//open globar params window
function globalParams() {
    doMouseOut(dynmenu2,0);
	var prop="width=500,height=250,resizable=0,scrollbars=1";
	var param="tenant_dbid="+tenantDbid+"&frompop=1";
	document.open("params.jsp?"+param,"GlobalParams",prop);       
}

//delete current popup
function deletePopUp() {
    doMouseOut(dynmenu1,0);
	var v = confirm(lab_arr[83]);
	if (v) {
		needToSaveChanges=false;
		document.frm.del.value="1";
		document.frm.action="popup.jsp";
		document.frm.target="";
		document.frm.submit();
	}
}

function moveTab(db_index,tab_index1,tab_index2) {
   var listTab = popupObjects[db_index].propList['TablesList'].arrMulti;

  if ( tab_index1!=-1 && tab_index2!=-1 ) {
  	var temp = listTab[tab_index1].valueOrder;
  	listTab[tab_index1].valueOrder = listTab[tab_index2].valueOrder;
  	listTab[tab_index2].valueOrder = temp;  	
  }
  fillListDatabaseTable (db_index); 
}

// set warning if page is being closed or updated without changes being saved
var needToSaveChanges = false;
var initialPopName = ""; // to identify last saved name of popup so warning can be made if overwriting a popup with a new name (in case the user meant to use 'save as')
var difstate = 0; // identify if the popup state is being changed

function changeTimeDone() {
	timeDone = 1;
}

function saveChangeState() {
	needToSaveChanges = true;
}

function exitPopup() {
	if (needToSaveChanges) {
	
		return lab_arr[125]+"\n"+lab_arr[138]
	}
}


//called on unload of the popup.jsp==> it deletes temporary folder from the server 
function unloadPopup() {
	if (test_removetemp ==1 && document.frm.popdbid.value =="") {  //if it is a new popup and the user doesn't want to save it ==> delete the folder from server repo.
		//remove temporary folder
		var path =popDownPath+uniqueid; //path of the temp. folder
		
		var xmlhttp = getHTTPRequest(); 
	    xmlhttp.open("POST","popupdetail.jsp?mn=unloadPopup&path="+path ,false); 
	    xmlhttp.send(); //send asynchron request to server
	
	}	
}

var startPopType;

function typeOut() {
	popType= "OUT";
	document.getElementById("proppopname").innerHTML = lab_arr[90]+" "+lab_arr[97];
	if (startPopType != popType) {
		needToSaveChanges = true;
	}else{
		needToSaveChanges = false;
	}
}

function typeIn() {
	popType= "IN";
	document.getElementById("proppopname").innerHTML = lab_arr[90]+" "+lab_arr[98];
	if (startPopType != popType) {
		needToSaveChanges = true;
	}else{
		needToSaveChanges = false;
	}
}

/*************** delete bin functions ***************/

function deleteBin() {
	if (document.getElementById("deleteBin").className == "bin_over") {
//		alert ("delete function");
		mouseUp();
	}
}
