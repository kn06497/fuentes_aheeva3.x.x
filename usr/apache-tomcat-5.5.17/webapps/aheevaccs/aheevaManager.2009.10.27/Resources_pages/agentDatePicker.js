/**
 * This file contains javascript functions that are used in the agentDatePicker.jsp
 * @author Gildas 
 */

/**
 * Changes the agents'List view, and sort them either 
 * by name or ID, according to the 'ckboxAgentByID.checked'
 * value  
 * @param :
 * @return :
 * @version : AheevaCCS 2.3.0
 * @author : HGM
 */
function changeAgentListView()
{
	var cbboxAgents = document.getElementById('objects');
	if(cbboxAgents != null){
		var o = new Array();
			optText = "";
							
		for(var i = 0; i < cbboxAgents.options.length; i++){			
			o.push(cbboxAgents.options[i]);
		}			
		
		//Now sort according to the showAgentsById value
		if(document.getElementById('ckboxAgentByID').checked){						
			o.sort(sortOptionsByValue);//sort by agent id
			for(var i = 0; i < o.length; i++){				
				optText =  o[i].value + ' [' + o[i].text.substring(0, o[i].text.indexOf('[') - 1) + ']' ;//James Bond [001] => 001 [James Bond]				
				cbboxAgents.options[i] = new Option(optText, o[i].value, o[i].defaultSelected, o[i].selected)
			}//end of for(var i = 0; i< o.length; i++)
			
		}//end of if(document.getElementById('ckboxAgentByID').checked)
		else{//sort by agents' name
			o.sort(sortOptionsByText);//sort by agents' name
			for(var i = 0; i< o.length; i++){								
				optText =  o[i].text.substring(o[i].text.indexOf('[') + 1, o[i].text.indexOf(']')) + ' [' + o[i].value + ']';//001 [James Bond] => James Bond [001]
				cbboxAgents.options[i] = new Option(optText, o[i].value, o[i].defaultSelected, o[i].selected)
			}//end of for(var i = 0; i< o.length; i++)		
		}//end of else					
				
	}//end of if(cbboxAgents != null)
}

function selectAll()
{
  for (j = 0; j <document.theForm.objects.options.length; j++)
	  document.theForm.objects.options[j].selected = true;  
}

function unSelectAll()
{
  for (j = 0; j <document.theForm.objects.options.length; j++)
	  document.theForm.objects.options[j].selected = false;
}
/**
 * Returns an array containing the selected options from 
 * a multiple-select element
 * @param {Object} objSelect
 * @return {Array} : An array of selected Options
 */
function getSelectedOptions(objSelect)
{	
	var selectedOptions = null;
	if(objSelect != null){
		selectedOptions = new Array();		
		for (var i = 0; i<objSelect.options.length; i++) {
	  		if (objSelect.options[i].selected && !selectedOptions.contains(objSelect.options[i].value)) {
	  			selectedOptions.push(objSelect.options[i].value);
	  		}
  		}		
	}//end of if(objSelect != null)
	
	return selectedOptions;
}

function getRequestedReport()
{	
	var destination = '',
		periodValid,	
		isReportPerioValid = validReportPeriod();
		
	if(!isReportPerioValid)
		return false;
	
	if(document.theForm.objects.selectedIndex == -1)
	{
		alert(MultiArray["Please select at least one object"][lang]);
		return false;
	}
	if(document.theForm.objects.selectedIndex != -1 && document.theForm.objects.options[0].value=='')
	{
		alert(MultiArray["Please select at least one object"][lang]);
		return false;
	}		

	return true;
}
/* 
 * StringParse(): Take a list of key-value as string and transform them to an array. ex: abcd=4&efgh=80  ==> stringElements[abcd]=4; stringElements[efgh]=80 
 * Parameters: tobeParsed. The string that will be parse
 * Return value: an associative array key-value
 */
function StringParse(tobeParsed)
{
	stringElements = new Array();
	
	var pairs = tobeParsed.split("&");	//split by the token
	
	for (var i=0;i<pairs.length;i++)	//For each pair, split by the =
	{
		var pos = pairs[i].indexOf('=');
		if (pos >= 0)
		{
			var argname = pairs[i].substring(0,pos);
			var value = pairs[i].substring(pos+1);
			stringElements[argname] = value;			
		}
	}	
	return stringElements;
}

// Associate a default button with pressing the Enter key
function KeyDownHandler(btn)
{
    // process only the Enter key
    if (event.keyCode == 13)
    {
        // cancel the default submit
        event.returnValue = false;
        event.cancel = true;
        // submit the form by programmatically clicking the specified button
        btn.click();
    }
}
/**
 * Changes the frame's url in order to set the 
 * agents' offset to show in the agents' select box  
 * @param {Object} agentsOffset : the agents' offset to show
 * @remark : It supposes that the offset is the last paramater 
 * in the url's query string 
 */
function setAgentsOffset(agentsOffset)
{	
	var url = document.location.href;		
	if(normalizeString(QueryString('offset')) == 'null' )				
		url += '&offset=' + agentsOffset;			
	else		
		url = url.slice(0, url.lastIndexOf('=') + 1) + agentsOffset;
			
	document.location.replace(url);
}