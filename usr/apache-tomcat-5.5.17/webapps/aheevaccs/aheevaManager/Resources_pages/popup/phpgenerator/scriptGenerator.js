var COMBO = '4';
var TEXT = '3';
var TEXTAREA = '5';
var RADIO = '6';
var CHECKBOX = '7';
var DATABASE = '9';
var PARAMETER = '10';
var DISPLAY = '11';
var STATIC_TEXT = '12';
var IMAGE = '13';
var NUMBER = '14';
var DATE = '15';
var TIME = '16';
var PHONE_NUMBER = '17';
var EMAIL = '18';
var SECTION_BREAK = '19';
var BUTTON = '20';
var SEARCH_ITEM = '21';
function prevPages(){
	if(checkRequired())
	{
		document.getElementById('table'+current_page).style.display='none';
		current_page --;
		document.getElementById('table'+current_page).style.display='block';
		document.getElementById('save').disabled = true;
		try {
			if(current_page == 0){
				document.getElementById('prevPage').disabled = true;
			}
			document.getElementById('nextPage').disabled = false;
		} catch (exp){}
	}
}
function nextPages(){
	if(checkRequired())
	{
		document.getElementById('table'+current_page).style.display='none';
		current_page ++;
		document.getElementById('table'+current_page).style.display='block';
		if(current_page == (page_max-1)){
			try{
				document.getElementById('nextPage').disabled = true;
			}catch (exp){}
			document.getElementById('save').disabled = false;
		}
		try{
			document.getElementById('prevPage').disabled = false;
		}catch(exp){}
	}
}

function search(){
	if(srcType == "Save"){
		var path = newPath = document.location.href;
		var listParam = new Array();
		if(path.lastIndexOf('?') != -1){
			var params = path.substr(path.lastIndexOf('?')+1);
			newPath = path.substr(0,path.lastIndexOf('?'));
			listParam = params.split('&');
		}
		newPath += '?';
		for(var i = 0; i < ListPages.length; i++){
			for(var j = 0; j < ListPages[i].length; j++){
				if(ListPages[i][j].type == SEARCH_ITEM && ListPages[i][j].parameter != '' && ListPages[i][j].Value != ''){
					newPath += ListPages[i][j].parameter+'='+ListPages[i][j].Value+'&';
					for(var k = 0; k < listParam.length; k++){
						if(listParam[k].indexOf(ListPages[i][j].parameter+'=') != -1){
							listParam[k] = -1;
						}
					}
				}
			}
		}
		for(var k = 0; k < listParam.length; k++){
			if(listParam[k] != -1){
				newPath += listParam[k]+'&';
			}
		}
		while((newPath.lastIndexOf('&')+1) == newPath.length){
			newPath = newPath.substr(0,newPath.length-1);
		}
		document.location.href = newPath;
	}
}

function checkRequired()
{
	var trueFalse = true;
	
	for(var i = 0; ListPages[current_page] && i < ListPages[current_page].length; i++){
		if(document.getElementById('p'+current_page+'o'+i) && ListPages[current_page][i]){
		if(document.getElementById('p'+current_page+'o'+i+'d2').style.visibility != "hidden"){
			if(ListPages[current_page][i].Required == '1' && ListPages[current_page][i].Value == ''){
				alert('You have to fill all required elements');
				if(ListPages[current_page][i].type == DATE){
					document.getElementById('tp'+current_page+'o'+i).click();
					return false;
				}else{
					if(document.getElementById('p'+current_page+'o'+i))
						document.getElementById('p'+current_page+'o'+i).focus();
					return false;
				}
			}
			if(ListPages[current_page][i].type == EMAIL){
					if(IsEmail(document.getElementById('p'+current_page+'o'+i))==false){
							alert('You must enter a correct Email')
							return false;
					}
			}
			if(ListPages[current_page][i].type == PHONE_NUMBER){
					if(IsPhoneNumber(document.getElementById('p'+current_page+'o'+i).value)==false){
							alert('You must enter a correct Phone Number')
							document.getElementById('p'+current_page+'o'+i).focus();
							return false;
					}
			}
			if(ListPages[current_page][i].type == NUMBER){
					if(IsNumeric(document.getElementById('p'+current_page+'o'+i).value)==false){
							alert('You must enter a correct Number')
							document.getElementById('p'+current_page+'o'+i).focus();
							return false;
					}
					if(ListPages[current_page][i].Value != ''){
						if(parseInt(ListPages[current_page][i].Value) < parseInt(ListPages[current_page][i].Minimum)){
							alert('Value should be bigger then:'+ListPages[current_page][i].Minimum);
							document.getElementById('p'+current_page+'o'+i).focus();
							return false;
						}
						if(parseInt(ListPages[current_page][i].Value) > parseInt(ListPages[current_page][i].Maximum)){
							alert('Value should be less then:'+ListPages[current_page][i].Maximum);
							document.getElementById('p'+current_page+'o'+i).focus();
							return false;
						}
					}
			}
			if(ListPages[current_page][i].type == TIME){
				if(IsTime(document.getElementById('p'+current_page+'o'+i))==false){
						alert('You must enter a correct Time')
						document.getElementById('p'+current_page+'o'+i).focus();
						return false;
				}
			}
		}
		}
		
	}
	return trueFalse;
}

function valueChanged(objNum,pageNum,thisParam,index){
	ListPages[current_page][objNum].Value = thisParam.value;
	
	executeEvent(thisParam.value,index)
}
function runAllEvents(){
	for(var j = 0; j < page_max; j++){
		for(var k = 0; k < ListPages[j].length; k++){
			if(ListPages[j][k]){
				executeEvent(ListPages[j][k].Value,ListPages[j][k].hiddenIndex);
			}
		}
	}
}
function executeEvent(value,index){
	for(var i = 0; i < listEvents.length; i++){
		if(listEvents[i].evtobj == index){
			if(value != "" && (listEvents[i].evtope == "<" || listEvents[i].evtope == "<=" || listEvents[i].evtope == ">" || listEvents[i].evtope == ">=")){
				value = parseInt(value);
			}
			if(eval('value ' + listEvents[i].evtope + ' listEvents[i].evtval')){
				for(var j = 0; j < page_max; j++){
					for(var k = 0; k < ListPages[j].length; k++){
						if(ListPages[j][k]){
							if(listEvents[i].actionobj == ListPages[j][k].hiddenIndex){
								if(listEvents[i].type == '134'){//SHOW
									document.getElementById('p'+j+'o'+k+'d1').style.visibility = 'visible';
									document.getElementById('p'+j+'o'+k+'d2').style.visibility = 'visible';
									if(document.getElementById('p'+j+'o'+k+'d3'))
										document.getElementById('p'+j+'o'+k+'d3').style.visibility = 'visible';
								}else if(listEvents[i].type == '135'){//HIDE
									document.getElementById('p'+j+'o'+k+'d1').style.visibility = 'hidden';
									document.getElementById('p'+j+'o'+k+'d2').style.visibility = 'hidden';
									if(document.getElementById('p'+j+'o'+k+'d3'))
										document.getElementById('p'+j+'o'+k+'d3').style.visibility = 'hidden';
								}else if(listEvents[i].type == '136'){//FILL
									if(listEvents[i].actionValues && listEvents[i].actionValues.length > 0){
										ListPages[j][k].Value = listEvents[i].actionValues[0];
										if(ListPages[j][k].type == COMBO){
											var listData = eval('listElements.p'+j+'o'+k);
											var old = document.getElementById('p'+j+'o'+k).value;
											var res = document.getElementById('p'+j+'o'+k+'d2').innerHTML;
											var resss = document.getElementById('p'+j+'o'+k+'d2').innerHTML.substr(0,res.indexOf('<OPTION'));
											var optionValue = "";
											for (var l = 0; l < listEvents[i].actionValues.length; l++){
												for (var h = 0; h < listData.length; h=h+2){
													if(listData[h] == listEvents[i].actionValues[l]){
														optionValue = listData[h+1];
														break;
													}
												}
												resss+="<OPTION value='"+listEvents[i].actionValues[l]+"'>"+optionValue+'</OPTION>';
											}
											resss += document.getElementById('p'+j+'o'+k+'d2').innerHTML.substr(res.indexOf('</SELECT>'));
											document.getElementById('p'+j+'o'+k+'d2').innerHTML = resss;
											ListPages[j][k].Value = document.getElementById('p'+j+'o'+k).value = old;
										}else if(ListPages[j][k].type == RADIO){
											for (var l = 0; l < eval('document.myform.'+ListPages[j][k].radioName).length; l++){
													if(eval('document.myform.'+ListPages[j][k].radioName)[l].value == listEvents[i].actionValues[0]){
														eval('document.myform.'+ListPages[j][k].radioName)[l].checked = true; 
													}
												}
										}else if(ListPages[j][k].type == CHECKBOX){
											for (var l = 0; l < listEvents[i].actionValues.length; l++){
											    if(listEvents[i].actionValues[l] == '1'){
											   		document.getElementById('p'+j+'o'+k).checked = true;
											    }else{
											   		document.getElementById('p'+j+'o'+k).checked = false;
											    }
											}
										}else{
											if(listEvents[i].actionValues){
												for (var l = 0; l < listEvents[i].actionValues.length; l++){
												   	document.getElementById('p'+j+'o'+k).value = listEvents[i].actionValues[l];
												}
											}
										}
									}else{
										if(ListPages[j][k].type == COMBO){
											var res = document.getElementById('p'+j+'o'+k+'d2').innerHTML;
											var resss = document.getElementById('p'+j+'o'+k+'d2').innerHTML.substr(0,res.indexOf('<OPTION'));
											resss+="<OPTION value=''></OPTION>";
											resss += document.getElementById('p'+j+'o'+k+'d2').innerHTML.substr(res.indexOf('</SELECT>'));
											document.getElementById('p'+j+'o'+k+'d2').innerHTML = resss;
										}
									}
								}
							}
						}
						
						
						
						
					}
				}	
			}
		}
	}

}

function IsNumeric(strString){
	var strValidChars = '0123456789.,';
	var strChar;
	var blnResult = true;
	if (strString.length != 0){
		for (var i = 0; i < strString.length && blnResult == true; i++)
		{
			strChar = strString.charAt(i);
			if (strValidChars.indexOf(strChar) == -1)
			{
				blnResult = false;
			}
		}
	}
	return blnResult;
}
function IsPhoneNumber(strString){
	var strValidChars = '0123456789';
	var strChar;
	var blnResult = true;
	if(strString.length != 0){
		for (i = 0; i < strString.length && blnResult == true; i++)
		{
			strChar = strString.charAt(i);
			if (strValidChars.indexOf(strChar) == -1)
			{
				blnResult = false;
			}
		}
	}
	return blnResult;
}
function IsEmail(obj) {
	val = obj.value;
	if (val !='') {
		var arr_dot = val.split('.');
		var arr_at = val.split('@');
		if (val.indexOf('@')<=0 || val.indexOf('.')<=0 || val.indexOf('@.')>=0 || arr_at.length>2 || arr_dot[arr_dot.length-1]=='' || val.indexOf('.',val.indexOf('@'))<0) {
			obj.focus();
			obj.select();
			return false;
		}
	}
	return true;
}
function IsTime(obj) {
	var val = obj.value;
	if (val !='') {
		var arr_2pt = val.split(':');
		if (arr_2pt.length>0) {
			val = '';
			for(var i =0;i<arr_2pt.length;i++) {
				val +=arr_2pt[i];
			}
		}
		if (val.length > 6) {
			val = val.substr(0,6);
		}
		if (val.length<6) {
			var len = val.length
				for (var i=0; i< 6- len;i++) {
					val = val+'0';
				}
		}
		for (var i=0; i< 6;i++) {
			if (!IsInteger(val.substr(i,i+1))) {
				obj.focus();
				obj.select();
				return false;
			}
		}
		var char2 = val.substr(0,2);
		if (parseInt(char2) >23 || parseInt(char2)<0) {
			obj.focus();
			obj.select();
			return false;
		}
		var char2 = val.substr(2,2);
		if (parseInt(char2) >59 || parseInt(char2)<0) {
			obj.focus();
			obj.select();
			return false;
		}
		var char2 = val.substr(4,2);
		if (parseInt(char2) >59 || parseInt(char2)<0) {
			obj.focus();
			obj.select();
			return false;
		}
		obj.value= val.substr(0,2)+':'+val.substr(2,2)+':'+val.substr(4,2);
		return true;
	}
}
function IsInteger(strString){
	var strValidChars = '0123456789';
	var strChar;
	var blnResult = true;
	if (strString.length == 0) return false;
	for (i = 0; i < strString.length && blnResult == true; i++){
			strChar = strString.charAt(i);
			if (strValidChars.indexOf(strChar) == -1)
			{
				blnResult = false;
			}
	}
	return blnResult;
}
function fitTosize() {
	var obj = document.getElementById('next');
	if (parseInt(navigator.appVersion)>3) {
		if (navigator.appName=='Netscape') {
			obj.style.left = window.innerWidth - parseInt(obj.style.width) + window.pageXOffset - 20 +"px";
			obj.style.top  = window.innerHeight - parseInt(obj.style.height) + window.pageYOffset -10 +"px";
		}
		if (navigator.appName.indexOf('Microsoft')!=-1) {
			obj.style.left  = document.body.offsetWidth- parseInt(obj.style.width) + document.documentElement.scrollLeft + 4 + "px";
			obj.style.top  = document.body.parentNode.clientHeight - parseInt(obj.style.height) + document.documentElement.scrollTop +"px";
		}
	}
}
function resize() {	
	 fitTosize();
	 browserType();
	 if (parseInt(navigator.appVersion)>3) {
	    if (navigator.appName=='Netscape') {
		    window.resizeTo(parseInt(width)-20,parseInt(height)-100);
	    }
	    if (navigator.appName.indexOf('Microsoft')!=-1) {
		    window.resizeTo(parseInt(width),parseInt(height));
	    }
	 }	
	 var wdt = parseInt(width) - parseInt((navigator.appName.indexOf('Microsoft')!=-1)?document.body.offsetWidth:window.innerWidth);
	if (parseInt(navigator.appVersion)>3) {
	    if (navigator.appName=='Netscape') {
			window.resizeTo(parseInt(width)+10,parseInt(height)+210);
	    }
	    if (navigator.appName.indexOf('Microsoft')!=-1) {
			if(srcType=="View Sample"){
				window.resizeTo(parseInt(width)+wdt-19,parseInt(height)+150);
			}else{
			   window.resizeTo(parseInt(width)+wdt-19,parseInt(height)+225);
			}
	    }
	}
	if(page_max == 1 || page_max == 0){
		document.getElementById('save').disabled = false;
	}
	runAllEvents();
	var form = document.forms[0];
	var field_arr = new Array();
		for(var i=0;i<form.length;i++){
			if(form[i].name.indexOf('DIAL_SCHED_TIME') != -1){
				var str = form[i].onchange+'';
				str = str.substr(str.indexOf('valueChanged(')+13);
				field_arr[field_arr.length] = str.substr(0,str.indexOf(','));
				str = str.substr(str.indexOf(',')+1);
				field_arr[field_arr.length] = str.substr(0,str.indexOf(','));
				field_arr[field_arr.length] = i;
			}
		}
		
		if(field_arr.length == 6){
			var date,time;
			if(ListPages[field_arr[1]][field_arr[0]].type == TIME)
				time = ListPages[field_arr[1]][field_arr[0]];
			else
				date = ListPages[field_arr[1]][field_arr[0]];
				
			if(ListPages[field_arr[4]][field_arr[3]].type == DATE)
				date = ListPages[field_arr[4]][field_arr[3]];
			else
				time = ListPages[field_arr[4]][field_arr[3]];
				if(date.Value.length > 15){		
				date.Value = form[field_arr[2]].value = date.Value.substr(0,10);
				time.Value = form[field_arr[5]].value = time.Value.substr(11);
				
			}
	
	}
}
function disableItem(width,height){
   var div_str="";
   if(parseInt(navigator.appVersion)){
      if(navigator.appName=='Netscape'){
         div_str = "<div style='position:absolute;top:1px;left:0px;width:"+width+"px;height:"+(height+2)+"px;'></div>";
      }
      if(navigator.appName.indexOf('Microsoft')!=-1){
         div_str = "<div style='position:absolute;top:1px;left:0px;width:"+width+"px;height:"+(height+2)+"px;background-color:#E9E9E9;filter:alpha(opacity=60);'></div>";
      }
   } 
   return div_str;
}

function openDiv(){
 var open_div="";
  if(parseInt(navigator.appVersion)){
	if(navigator.appName=='Netscape'){
		open_div = "<div style='position:absolute;top:1px;left:1px;'>";
	}
  }
  return open_div;
}

function closeDiv(){
 var close_div="";
 if(parseInt(navigator.appVersion)){
	if(navigator.appName=='Netscape'){
	   close_div = "</div>";
	}
  }
  return close_div;
}

function browserType(){
  for(var j = 0; j < page_max; j++){
	for(var k = 0; k < ListPages[j].length; k++){
		if(ListPages[j][k]){
		   if(parseInt(navigator.appVersion)){
	               if(navigator.appName=='Netscape'){
		              if(ListPages[j][k].type == 4){
		                 document.getElementById('p'+j+'o'+k).style.width = parseInt(document.getElementById('p'+j+'o'+k).style.width) + 1 +"px";
			             document.getElementById('p'+j+'o'+k+'d2').style.width = parseInt(document.getElementById('p'+j+'o'+k+'d2').style.width) + 1+"px";
		              }
		              if(ListPages[j][k].type == 3 || ListPages[j][k].type==16 || ListPages[j][k].type==14 || ListPages[j][k].type==15 || ListPages[j][k].type==17 || ListPages[j][k].type== 18){
			             document.getElementById('p'+j+'o'+k).style.width = parseInt(document.getElementById('p'+j+'o'+k).style.width) +2 +"px";
		                 document.getElementById('p'+j+'o'+k+'d2').style.width = parseInt(document.getElementById('p'+j+'o'+k+'d2').style.width) +1 +"px";
		              }
		              if(ListPages[j][k].type == 5){
		                 document.getElementById('p'+j+'o'+k).style.width = parseInt(document.getElementById('p'+j+'o'+k).style.width) + 3 +"px";
			             document.getElementById('p'+j+'o'+k+'d2').style.width = parseInt(document.getElementById('p'+j+'o'+k+'d2').style.width) +1 +"px";
		                 document.getElementById('p'+j+'o'+k).style.height = parseInt(document.getElementById('p'+j+'o'+k).style.height) + 2 +"px";
		             }
		             if(ListPages[j][k].type==20){
		                 document.getElementById('p'+j+'o'+k).style.width = parseInt(document.getElementById('p'+j+'o'+k).style.width) +1 +"px";
		             }
		             if(ListPages[j][k].type==21){
		                 document.getElementById('p'+j+'o'+k).style.width = parseInt(document.getElementById('p'+j+'o'+k).style.width) +2 +"px";
		             }
		          }
		   }
	   }
	}
  }
}
