function QueryString(key)
{	
	var value = null;
	for (var i=0;i<QueryString.keys.length;i++)
	{
		
		if (QueryString.keys[i]==key)
		{
			value = QueryString.values[i];
			break;
		}		
	}
	
	return value;
}
QueryString.keys = new Array();
QueryString.values = new Array();

function QueryString_Parse()
{
	var query = window.location.search.substring(1);
	var pairs = query.split("&");
	
	for (var i=0;i<pairs.length;i++)
	{
		var pos = pairs[i].indexOf('=');
		if (pos >= 0)
		{
			var argname = pairs[i].substring(0,pos);
			var value = pairs[i].substring(pos+1);
			QueryString.keys[QueryString.keys.length] = argname;
			QueryString.values[QueryString.values.length] = value;		
		}
	}

}

function normalizeString(input)
{
	var inputStr = String(input);
	while(true)
	{
		iPos = inputStr.lastIndexOf("%20");
		if(iPos != -1)
			inputStr = inputStr.substr(0,iPos) + " "+inputStr.substr(iPos+3);
		else
			break;
	}
	return inputStr;
}
QueryString_Parse();

function IsNumeric(strString)
{
	//  check for valid numeric strings	
	var strValidChars = "0123456789.,";
	var strChar;
	var blnResult = true;

	if (strString.length == 0) return false;

	//  test strString consists of valid characters listed above
	for (var i = 0; i < strString.length && blnResult == true; i++)
	{
		strChar = strString.charAt(i);
		if (strValidChars.indexOf(strChar) == -1)
		{
			blnResult = false;
		}
	}
	return blnResult;
}

function IsPhoneNumber(strString)
{
	//  check for valid numeric strings	
	var strValidChars = "0123456789";
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

function IsInteger(strString)
   //  check for valid integer strings	
{
   var strValidChars = "0123456789";
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
  
function validation(name)
{	
	if (name.indexOf('|')>=0 )
		return '0';
	else if  ( name.indexOf('^')>=0)
		return '0';
	else if  ( name.indexOf('~')>=0)
		return '0';
	else if  ( name.indexOf('\'')>=0)
		return '0';
	/*else if  ( name.length == 0)
		return '0';*/
	else
		return '1'; 
}

function isValidName(inStr)
{
	var curCode;
	
	for(var i=0; i< inStr.length; i++)
	{
		 curCode = inStr.charCodeAt(i);
		  //accept only space or '-' or '_' or numeric or alphabetic char
		 if(! ((curCode==32) || (curCode==45) || (curCode==95) || (curCode >= 48 && curCode <= 57) || (curCode>=65 && curCode<=90) || (curCode>=97 && curCode<=122) || (curCode>=128 && curCode<=165))){
		  // this character is invalid
		 	return false;
		 }
	}
	return true;
}

function allSpaces(name)
{
	var nameLen = name.length;
	for(var i=0; i<nameLen; i++)
	{
		if(name.charAt(i) != ' ')
			return '1'; // this string contains a character different to a space character
	}
	return '0'; // this string contains only spaces
}

// This function checks if a string has leading spaces and trims these spaces if they exist
function trimLeadingSpace(inStr)
{
	var objRegExp = /^(\s*)(\b[\w\W]*)$/;
	if(inStr.charAt(0) == ' ')
	{
		var outStr = inStr.replace(objRegExp, '$2');
		return outStr;
	}
	else 
		return inStr;
}

// This function checks if a string has trailing spaces and trims these spaces if they exist
function trimTrailingSpace(inStr)
{
	var objRegExp = /^([\w\W]*)(\b\s*)$/;
	if( inStr.lastIndexOf(" ") == (inStr.length -1) )
	{
		var outStr = inStr.replace(objRegExp, '$1');
		return outStr;
	}
	else 
		return inStr;
}

function selectObject(objSelect, objValue, firstout)
{
	//var objObject = document.getElementById(objName);
	for(var i=0; i<objSelect.options.length; i++)
   	{
     	if(objSelect.options[i].value ==  objValue)
       	{
         	objSelect.options[i].selected = true;
			if(firstout)
				break;
       	}
   	}
}

function userHasRight(right_name)
{
	if( appletObj )	
		return appletObj.userHasRight(right_name);
	else
	{
		window.status = 'Err: userHasRight(\''+right_name+'\') : appletObj is null';
		return false;
	}
}

/*
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
}*/


// EXTRA FUNCTIONS ....
function getColor(weight)
{
	if(weight == "N/A")
		return "#FFFFFF";
	redcolor = (112-255)/100*weight+255;
	redcolor = dechex(redcolor);
	greencolor = (223-165)/100*weight+165;
	greencolor = dechex(greencolor);
	//bluecolor = (108-59)/100*new_weight+59;
	bluecolor = '00';
	//bluecolor = dechex(bluecolor);	
	color = "#"+redcolor+""+greencolor+""+bluecolor;	
	
	return color;
}

function dechex(f1) 
{  
	rhex = tohex(f1);
	return rhex;
}

function tohex(i)
{
	a2 = ''
	ihex = hexQuot(i);
	idiff = eval(i + '-(' + ihex + '*16)')
	a2 = itohex(idiff) + a2;
	while( ihex >= 16) 
	{
		itmp = hexQuot(ihex);
		idiff = eval(ihex + '-(' + itmp + '*16)');
		a2 = itohex(idiff) + a2;
		ihex = itmp;
	} 
	a1 = itohex(ihex);
	return a1 + a2 ;
}

function hexQuot(i) 
{
	return Math.floor(eval(i +'/16'));
}

function itohex(i) 
{
	aa = '0';
	if( i == 0) { aa = '0' } else { if( i== 1) { aa = '1'} else {if( i== 2) { aa = '2'} else {if( i == 3) { aa = '3' } else {if( i== 4) { aa = '4'} else {if( i == 5) { aa = '5' } else {if( i== 6) { aa = '6'} else {if( i == 7) { aa = '7' } else {if( i== 8) { aa = '8'} else {if( i == 9) { aa = '9'} else {if( i==10) { aa = 'A'} else {if( i==11) { aa = 'B'} else {if( i==12) { aa = 'C'} else {if( i==13) { aa = 'D'} else {if( i==14) { aa = 'E'}  else {if( i==15) { aa = 'F'} } } } } } } } } } } } } } } }
	return aa
}

function setLegends(text_to_append)
{
	for(i = 0; i < document.getElementsByTagName('legend').length; i++)
	{
		var curObj = document.getElementsByTagName('legend')[i];
		curObj.innerHTML = text_to_append + curObj.innerHTML;
	}
}

// sort function - ascending (case-insensitive)
function sortFuncAsc(record1, record2) 
{
	var value1 = parseInt(record1.optValue.toLowerCase());
	var value2 = parseInt(record2.optValue.toLowerCase());
	if (value1 > value2) return(1);
	if (value1 < value2) return(-1);
	return(0);
}

// sort function - descending (case-insensitive)
function sortFuncDesc(record1, record2) 
{
	var value1 = parseInt(record1.optValue.toLowerCase());
	var value2 = parseInt(record2.optValue.toLowerCase());
	if (value1 > value2) return(-1);
	if (value1 < value2) return(1);
	return(0);
}

function sortSelectBox(selectToSort, ascendingOrder) 
{
	if (arguments.length == 1) ascendingOrder = true;    // default to ascending sort

	// copy options into an array
	var myOptions = [];
	for (var loop=0; loop<selectToSort.options.length; loop++) {
		myOptions[loop] = { optText:selectToSort.options[loop].text, optValue:selectToSort.options[loop].value };
	}

	// sort array
	if (ascendingOrder) {
		myOptions.sort(sortFuncAsc);
	} else {
		myOptions.sort(sortFuncDesc);
	}

	// copy sorted options from array back to select box
	selectToSort.options.length = 0;
	for (var loop=0; loop<myOptions.length; loop++) {
		var optObj = document.createElement('option');
		optObj.text = myOptions[loop].optText;
		optObj.value = myOptions[loop].optValue;
		selectToSort.options.add(optObj);
	}
}

function sortSelect(obj)
{
	var o = new Array();
	if (obj.options==null) { return; }
	for (var i=0; i<obj.options.length; i++) 
	{
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;
	}
	if (o.length==0) { return; }
	//used when we just need to sort a combobox options by their text value whith no need
	//to check a box (ex. agentsGroups in loginvsProduction.jsp) 
	sortByTextValue = (arguments.length > 1) ? arguments[1] : false; 	
	if( (document.agentGroup.orderView.checked == false) || (sortByTextValue))
	{
		o = o.sort(
			function(a,b) 
			{
				if ((a.text+"") < (b.text+"")) { return -1; }
				if ((a.text+"") > (b.text+"")) { return 1; }
				return 0;
			}
		);
	}
	else
	{
		o = o.sort(
			function(a,b) 
			{
				if (parseInt(a.value) < parseInt(b.value)) { return -1; }
				if (parseInt(a.value) > parseInt(b.value)) { return 1; }
				return 0;
			}				
		);   	
	}
	
	for (var i=0; i<o.length; i++) 
	{
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}
}

//Function to hide a div layer
function hideLayer(whichLayer)
{
	if (document.getElementById)
	{
		// this is the way the standards work
		var style2 = document.getElementById(whichLayer).style;
		style2.display = "none";
	}
	else if (document.all)
	{
		// this is the way old msie versions work
		var style2 = document.all[whichLayer].style;
		style2.display = "none";
	}
	else if (document.layers)
	{		
		// this is the way nn4 works
		var style2 = document.layers[whichLayer].style;
		style2.display = "none";
	}
}

//Function to show a div layer
function showLayer(whichLayer)
{
	if (document.getElementById)
	{
		// this is the way the standards work
		var style2 = document.getElementById(whichLayer).style;
		style2.display = "";
	}
	else if (document.all)
	{
		// this is the way old msie versions work
		var style2 = document.all[whichLayer].style;
		style2.display = "";
	}
	else if (document.layers)
	{
		// this is the way nn4 works
		var style2 = document.layers[whichLayer].style;
		style2.display = "";
	}
}

//If the layer is hidden, show it, otherwise, hide it
function toggleLayer(whichLayer)
{
	var hidden = false;
	if (document.getElementById)
	{
		// this is the way the standards work
		hidden = (document.getElementById(whichLayer).style.display == "none");
	}
	else if (document.all)
	{
		// this is the way old msie versions work
		hidden = (document.all[whichLayer].style.display == "none");
	}
	else if (document.layers)
	{
		// this is the way nn4 works
		hidden = (document.layers[whichLayer].style.display == "none");
	}
	if(hidden)
		showLayer(whichLayer);
	else
		hideLayer(whichLayer);
}

/* Function to send an option from an HTML select box to another one 
 * In parameter:
 * fromSelectId : A string representing the ID of the 'from' select box
 * toSelectId   : A string representing the ID of the 'to' select box
 */
function switchOptionsFromSelectBoxes(fromSelectId, toSelectId)
{	
	if(document.getElementById)
	{
		var fromSelectObj = document.getElementById(fromSelectId);
		var toSelectObj = document.getElementById(toSelectId);
		var curOption = null;
	
		for (var i = 0; i < fromSelectObj.options.length; i++)
		{
			curOption = fromSelectObj.options[i];
			if(curOption.selected)
			{
				toSelectObj.options[toSelectObj.options.length] = new Option(curOption.text, curOption.value, false, false);
			}
		}
	
		for(var i = fromSelectObj.options.length - 1; i >= 0; i--)
		{
			curOption = fromSelectObj.options[i];
			if(curOption.selected)
				fromSelectObj.options[i] = null;
			curOption.selected = false;
		}
	
		fromSelectObj.selectedIndex = -1;
		toSelectObj.selectedIndex = -1;
	}
}

/* Function for Ajax programming 
   Returns an instance of an XML HTTP Request
*/
function getXMLObjInstance()
{
	var xhr = null;
	if(window.XMLHttpRequest) // Firefox et autres
	xhr = new XMLHttpRequest();
	else if(window.ActiveXObject) // Internet Explorer
	{
		try 
		{
			xhr = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	else
	{ // XMLHttpRequest non supporté par le navigateur
		alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
		xhr = null; 
	} 
	return xhr;
}

/* function to check if a select object contains a certain value */
function selectContainsValue(selectId, seekedValue)
{
	var foundValue = false;
	var selectObj = document.getElementById(selectId);
	if(selectObj)
	{
		for(var i = 0; i < selectObj.length; i++)
		{
			if(selectObj[i].value == seekedValue)
			{
				foundValue = true;
				break;
			}
		}
	}
	return foundValue;
}

/**
 * Is used to Sort an array of options object {Option} based on 
 * their text field value 
 * Ex. var arr = new Array(); 
 * 	   arr.push(new Option('text', value));
 *     arr.sort(sortOptionsByText) 
 * @param {Object} opt1 
 * @param {Object} opt2 
 * @remarks: We now just sort alphabetical ascending 
 * @author: HGM
 */
function sortOptionsByText (opt1, opt2)
{
	var ret = 0;	
	ret = (opt1.text.toLowerCase() < opt2.text.toLowerCase()) ? -1 : 1;						
	return (ret);
}

function sortOptionsByValue(opt1, opt2)
{
	var ret = 0;
	ret = (parseInt(opt1.value) < parseInt(opt2.value)) ? -1 : 1;					
	return (ret);
}