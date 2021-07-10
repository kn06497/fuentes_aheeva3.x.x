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
   //  check for valid numeric strings	
   {
   var strValidChars = "0123456789.,";
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
   
// -------------------------------------------------------------------
// hasOptions(obj)
//  Utility function to determine if a select object has an options array
// -------------------------------------------------------------------
function hasOptions(obj) {
	if (obj!=null && obj.options!=null) { return true; }
	return false;
	}
		
// -------------------------------------------------------------------
// sortSelect(select_object)
//   Pass this function a SELECT object and the options will be sorted
//   by their text (display) values
// -------------------------------------------------------------------
function sortSelect(obj) 
{
	var o = new Array();
	if (!hasOptions(obj)) { return; }
	for (var i=0; i<obj.options.length; i++) 
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;

	if (o.length==0) { return; }
	o = o.sort( 
		function(a,b) 
		{ 
			if ((a.text+"") < (b.text+"")) { return -1; }
			if ((a.text+"") > (b.text+"")) { return 1; }
			return 0;
		} 
	);

	for (var i=0; i<o.length; i++) 
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
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

