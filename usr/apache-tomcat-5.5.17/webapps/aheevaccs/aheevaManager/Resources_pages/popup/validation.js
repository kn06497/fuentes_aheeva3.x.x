function IsRGB(obj) {
	var val = obj.value;
	
	if (val != "") { 
	
		if (val.substr(0,1) !="#") {
			val  ="#"+val; 
		}
		
		if (val.length != 7) {
			obj.focus();
			obj.select();
			return false;
		} 	
		
		if (!IsHexa(val.substr(1,6))) {
			obj.focus();
			obj.select();
			return false;
		}

	
	}
	obj.value = val;
	return true;
	
}


function IsHexa(strString)
   //  check for valid integer strings	
{
   var strValidChars = "0123456789abcdefABCDEF";
   var strChar;
   var blnResult = true;

   if (strString.length == 0) return false;

   //  test strString consists of valid characters listed above
   for (i = 0; i < strString.length && blnResult == true; i++)
      {
      strChar = strString.charAt(i);
      if (strValidChars.indexOf(strChar) == -1)
         {
         blnResult = false;
         }
      }
   return blnResult;
}

function IsPixels(obj) {
	val = obj.value;
	
	if (val !="") {
		val = val.replace("PX","px");
		
		if (val.indexOf("px")<0 ) {
			val +="px";
		}
		if (!IsInteger(val.substr(0,val.indexOf("px")))) {
			obj.focus();
			obj.select();
			return false;
		}
		
		val = val.substr(0,val.indexOf("px")+2);
	
		
		obj.value = val;
		return true;
		
	}
	
	return true;
}

function IsEmail(obj) {
	val = obj.value;
	
	if (val !="") {
		
		var arr_dot = val.split(".");
		var arr_at = val.split("@");
		
		if (val.indexOf("@")<=0 || val.indexOf(".")<=0 || val.indexOf("@.")>=0 || arr_at.length>2 || arr_dot[arr_dot.length-1]=="" || val.indexOf(".",val.indexOf("@"))<0) {
			obj.focus();
			obj.select();
			return false;
		}
	}	
	return true;
}


function IsValidPropValue(prop,obj,current_div_index,current_div_obj_index,type) {
	dragObject = null;
	diffTop	   = 0;
	diffLeft   = 0;
	var objectSelected = getObjectFromIndex(current_div_index , current_div_obj_index,type);
	var pageObjProp = objectSelected.propList[prop];
	if (Trim(obj.value)=="" && pageObjProp.required=='Y') {
		alert(pageObjProp.name+" "+lab_arr[68]);
		obj.focus();
		return false;
	}
	var name = objectSelected.name;
	if (pageObjProp.type=="TEXT") {
		if(validCharacters(obj)) {
			return false;
		}
		if(name!="StaticText"){
	      obj.value = cleanVal(obj.value);
	    }
	}
	
	
	
	var f_num 	= 0;
	var f_email = 0;
	var f_phone	= 0;
	var f_time	= 0;
	var f_image = 0;
	var f_font = 0; 
	var f_section = 0;
	var f_textarea = 0;
		
	if (name=="Number") {
		if (pageObjProp.name=="Default") {
			f_num = 1;
		}
	}
	if (name=="Email") {
		if (pageObjProp.name=="Default") {
			f_email = 1;
		}
	}	   
	if (name=="PhoneNumber") {
		if (pageObjProp.name=="Default") {
			f_phone = 1;
		}
	}
	if (name=="Time") {
		if (pageObjProp.name=="Default") {
			f_time = 1;
		}
	}
	
	if (name=="Image") {
		if (pageObjProp.name=="Width" || pageObjProp.name=="Height" || pageObjProp.name=="CnvWidth" || pageObjProp.name=="CnvHeight") {
			f_image = 1;
		}
	}
	
	if(name!="StaticText"){
	    if(pageObjProp.name=="FontSize"){
	        f_font = 1;
	    }
	}
	
	if(name=="SectionBreak"){
	   if(pageObjProp.name=="Borwidth"){
	        f_section = 1;
	   }	  
	}
	
	if(name=="Textarea"){
	  if(pageObjProp.name=="Height"){
	        f_textarea = 1;
	   }
	}
	
	if (obj.value !="") {
		if (pageObjProp.category=='PIXELS') {
			if (!IsPixels(obj)) {
				return false;
			}
			if (pageObjProp.min != "") {
				if (parseInt(obj.value) < parseInt(pageObjProp.min) && (pageObjProp.name !="Height" || 
					(pageObjProp.name =="Height" && name !='SectionBreak') ) && (pageObjProp.name != "LabelWidth") ) {				
						alert(lab_arr[69]+" "+pageObjProp.min);
						obj.focus();
						obj.select();
						return false;					
				}
			} 
			if (pageObjProp.max != "" && name !="Image") {
				
				if (parseInt(obj.value) > parseInt(pageObjProp.max) && (name!='SectionBreak' || pageObjProp.name !="Height") && (name!='SectionBreak' && pageObjProp.name =="Width")) {
					alert(lab_arr[70]+" "+pageObjProp.max);
					obj.focus();
					obj.select();
					return false;
				}
				
				
			} 		
		}
		if (pageObjProp.category=='PORT') {
			if(!IsValidPort(obj)){return false;}
			
		}
		
		if (pageObjProp.category=='NUMBER' || f_num==1) {
			if (!IsNumeric(obj.value)) {
				obj.focus();
				obj.select();
				return false;
			}
			
			if (pageObjProp.min != "") {
				if (parseFloat(obj.value) < parseFloat(pageObjProp.min)) {
					alert(lab_arr[69]+" "+pageObjProp.min);
					obj.focus();
					obj.select();
					return false;
				}
			} 
			if (pageObjProp.max != "") {
				if (parseFloat(obj.value) > parseFloat(pageObjProp.max)) {
					alert(lab_arr[70]+" "+pageObjProp.max);
					obj.focus();
					obj.select();
					return false;
				}
			}
		
			if (pageObjProp.name=="Default") {
				var min_val = ""; 
				var max_val = "";
				if (objectSelected.propList["Minimum"]) {

					min_val = objectSelected.propList["Minimum"].value;
				}
				if (objectSelected.propList["Maximum"]) {
					max_val = objectSelected.propList["Maximum"].value;
				}
			
				

				
				if (min_val!="") {if (parseFloat(obj.value)<parseFloat(min_val)) {obj.focus();obj.select();return false;}      }
				if (max_val!="") {if (parseFloat(obj.value)>parseFloat(max_val)) {obj.focus();obj.select();return false;}      }

			}	
			
			
			if (pageObjProp.name=="Minimum") {
				var val = ""; 
				if (objectSelected.propList["Default"]) {
					val = objectSelected.propList["Default"].value;
				}
				if (val!="") {if (parseFloat(obj.value)>parseFloat(val)) {obj.focus();obj.select();return false;}      }
				
				val="";
				if (objectSelected.propList["Maximum"]) {
					val = objectSelected.propList["Maximum"].value;
				}
				if (val!="") {if (parseFloat(obj.value)>parseFloat(val)) {obj.focus();obj.select();return false;}      }
				
				
			
			}	
			 	
			if (pageObjProp.name=="Maximum") {
				var val = ""; 
				if (objectSelected.propList["Default"]) {
					val = objectSelected.propList["Default"].value;
				}
				if (val!="") {if (parseFloat(obj.value)<parseFloat(val)) {obj.focus();obj.select();return false;}      }
			
				val="";
				if (objectSelected.propList["Minimum"]) {
					val = objectSelected.propList["Minimum"].value;
				}
				if (val!="") {if (parseFloat(obj.value)<parseFloat(val)) {obj.focus();obj.select();return false;}      }
				
			}	 				
		}
		
		
		
		if (pageObjProp.category=='IP') {
			if(!IsValidIp(obj)){return false;}			
		}
		
		if (f_email) {
			if (!IsEmail(obj)) {
				return false;
			}
		}
		
		if (f_phone) {
			if (!IsPhoneNumber(obj.value)) {
				obj.focus();
				obj.select();
				return false;
			}
		}
		
		if (f_time) {
			if (!IsTime(obj)) {
				return false;
			}
		}
		
		if (f_image) {
			if(pageObjProp.name=="Width"){
			    var val = "";
			    if(objectSelected.propList["CnvWidth"]){
			       val = objectSelected.propList["CnvWidth"].value;			      
			    }
			    objectSelected.propList["Width"].value =obj.value ;
			    if(val!=""){
			      if(parseFloat(obj.value) > parseFloat(val)){
			        objectSelected.propList["CnvWidth"].value =obj.value ;
			      }
			    }
			}
			if(pageObjProp.name=="CnvWidth"){
			    var val = "";
			    if(objectSelected.propList["Width"]){
			       val = objectSelected.propList["Width"].value;			      
			    }
			    objectSelected.propList["CnvWidth"].value =obj.value ;
			    if(val!=""){
			      if(parseFloat(obj.value) < parseFloat(val)){
			        objectSelected.propList["Width"].value =obj.value ;
			        
			      }
			    }
			}
			if(pageObjProp.name=="Height"){
			    var val = "";
			    if(objectSelected.propList["CnvHeight"]){
			       val = objectSelected.propList["CnvHeight"].value;			      
			    }
			    objectSelected.propList["Height"].value =obj.value ;
			    if(val!=""){
			      if(parseFloat(obj.value) > parseFloat(val)){
			        objectSelected.propList["CnvHeight"].value =obj.value ;
			        
			      }
			    }
			}
			if(pageObjProp.name=="CnvHeight"){
			    var val = "";
			    if(objectSelected.propList["Height"]){
			       val = objectSelected.propList["Height"].value;			      
			    }
			    objectSelected.propList["CnvHeight"].value =obj.value ;
			    if(val!=""){
			      if(parseFloat(obj.value) < parseFloat(val)){			        
			         objectSelected.propList["Height"].value =obj.value ; 
			      }
			    }
			}
			fillPropertiesCurrentObj();
	    }
	    
	    if(f_font){
	      if(parseInt(obj.value) > 20){
	        alert(lab_arr[70]+" "+20);
	        obj.focus();
	        obj.select();
	        return false;
	     } 
	   } 
	   
	   if(f_section){
	      if(parseInt(obj.value) > 10){
	        alert(lab_arr[70]+" "+10);
	        obj.focus();
	        obj.select();
	        return false;
	      }
	   }
	   
	   if(f_textarea){
	      if(parseInt(obj.value)>400){
	        alert(lab_arr[70]+" "+400);
	        obj.focus();
	        obj.select();
	        return false;
	      }
	   }
	}	
	return true;
}

function getPartString(val, max_length) {
	if (val.length > max_length) {
		val = val.substr(0,max_length)+"...";
	}
	return val;
}

function ckeckDefined(f_defined , val) {
	if (f_defined) return "";
	
	return val;
}

function validatePath(obj) {
	var val = obj.value;
	if (val!="") {
		val = val.replace("\\","/");
		if (val.substr(val.length-1)!="/") {
			val +="/";
		}
	}
	obj.value=val;
	
}

function IsValidPort(obj) {
	if (!IsInteger(obj.value)) {
		obj.focus();
		obj.select();
		return false;
	}
	
	if (obj.value.length!=4) {
		obj.focus();
		obj.select();
		return false;
	}
	return true;
}

function IsValidIp(obj) {
	var arr_str = obj.value.split(".");
			
	if (arr_str.length != 4) {
		obj.focus();
		obj.select();
		return false;
	}
	for (var i=0;i < arr_str.length; i++) {
		if (!IsInteger(arr_str[i])) {
			obj.focus();
			obj.select();
			return false;
		}
		
		if (parseInt(arr_str[i])>255 || (i==0 && parseInt(arr_str[i])==0)) {
			obj.focus();
			obj.select();
			return false;
		} 		
	}
	return true;
}

function IsTime(obj) {
	
	var val = obj.value;
	if (val !="") {
		var arr_2pt = val.split(":");
		
		if (arr_2pt.length>0) {
			val = "";
			for(var i =0;i<arr_2pt.length;i++) {
				val +=arr_2pt[i];
			}
		}
		
		if (val.length > 6) {val = val.substr(0,6);}
		if (val.length<6) {
		    var len = val.length
			for (var i=0; i< 6- len;i++) {
				val = val+"0";
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
		
		obj.value= val.substr(0,2)+":"+val.substr(2,2)+":"+val.substr(4,2);
		
		return true;			
	}
	
}

function processLabel(val) {
	if (val !="") {
	    var pattern = /_/g;
		val = val.replace(pattern," ");
		val = val.substr(0,1)+val.substr(1).toLowerCase();	
	}
	return val;
}
function Trim(s) 
{
  // Remove leading spaces and carriage returns
  
  while ((s.substring(0,1) == ' ') || (s.substring(0,1) == '\n') || (s.substring(0,1) == '\r'))
  {
    s = s.substring(1,s.length);
  }

  // Remove trailing spaces and carriage returns

  while ((s.substring(s.length-1,s.length) == ' ') || (s.substring(s.length-1,s.length) == '\n') || (s.substring(s.length-1,s.length) == '\r'))
  {
    s = s.substring(0,s.length-1);
  }
  return s;
}

function cleanVal(inp) {
  var tmp = "";
  var l = inp.length;
  for (var index = 0; index < l; index++)
  {
    if (inp.charAt(index) != ' ')
    {
      tmp += inp.charAt(index);
    }
    else
    {
      if (tmp.length > 0)
      {
        if (inp.charAt(index+1) != ' ' && index != (l-1))
        {
          tmp += inp.charAt(index);
        }
      }
    }
  }
	if (inp.charAt(0) == ' ' && inp.length == 1) tmp = '';
  	return tmp;
}

function validCharacters(obj){
  var val = obj.value;
  if(val.indexOf("^")>-1 || val.indexOf("\"")>-1 || val.indexOf("'")>-1 || val.indexOf("\\")>-1 || val.indexOf("/")>-1 || val.indexOf(";")>-1 || val.indexOf("#")>-1){
    alert(lab_arr[82]);
    obj.focus();
    obj.select();
    
    return  true;
  }
  return false;
}

function doEnter(obj,e){
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
        return;
    }
}
