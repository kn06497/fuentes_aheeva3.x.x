/**
 * @author Gildas
 */
var tableArr = new Array();// array of html code of added rows
function toggleLayer(whichLayer)
{
	if (document.getElementById)
	{
		// this is the way the standards work
		//if (document.getElementById("objects").value != '')
		//{
			var style2 = document.getElementById(whichLayer).style;
			style2.display = style2.display? "":"none";
		//}
	}
	else if (document.all)
	{
		// this is the way old msie versions work
		var style2 = document.all[whichLayer].style;
		style2.display = style2.display? "":"none";
	}
	else if (document.layers)
	{
		// this is the way nn4 works
		var style2 = document.layers[whichLayer].style;
		style2.display = style2.display? "":"none";
	}
}


function enableOverrideTime(checkoverrideid)
{
	var id = checkoverrideid.substring(13, checkoverrideid.length);
	if (document.getElementById(checkoverrideid).checked == true)
	{
		alert(MultiArray["Don't forget to select an override cause"][lang]);
		document.getElementById("correctiontime"+id).disabled = false;
		document.getElementById("selectoverridecause"+id).disabled = false;
		document.getElementById("overridecause"+id).disabled = false;
	}
	else
	{
		document.getElementById("overridetime"+id).value = "00:00:00";
		document.getElementById("correctiontime"+id).value = "00:00:00";
		document.getElementById("correctiontime"+id).disabled = true;
		document.getElementById("selectoverridecause"+id).disabled = true;
		document.getElementById("overridecause"+id).disabled = true;
		sendRemoveRequest(id);
	}
}

function sendRemoveRequest(item_id)
{
	var server = "http://192.168.10.207:8467/aheevaccs/Manager/Resources_pages/mopRowsManagement.jsp";
	var args="item_id="+item_id+"&operation=1&startDate="+startDate+"+&currentTime="+new Date();
	
	var do_removeRequest = new Ajax.Request(server, {method: 'get', parameters: args, onComplete:alert("request sent") });	
	
}

function viewOverrideCause(id)
{
  	var agt_id = id.substring(19, id.length);
	if (document.getElementById(id).value == "Other")
		document.getElementById("overridecause"+agt_id).style.visibility = 'visible';
	else
		document.getElementById("overridecause"+agt_id).style.visibility = 'hidden';

}

function fillObjectCombo(groupBox, agentBox, viewBox)
{
	if(agentBox.options.length <= 1 )
	{
		var agents = String( appletObj.getAgentsByName(tenant_dbid) );
		var o = new Array();

		//Fill agents combo box with agents name
        var jsAgents = agents + "";
    	arrayAgents = jsAgents.split("|");
    	if(agents.length > 0 )
		{
    		for (j = 0; j <arrayAgents.length; j++)
			{
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if ( viewBox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents [j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)

				o.push(myOption);
    		}			
		}

		//Sort the agent's list
		o.sort(sortOptionsByText);
		for (var i=0; i<o.length; i++)
		{
			agentBox.options[i+1] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}

	}

	if(groupBox.options.length <= 1 )
	{
		var agentGroups = String( appletObj.getAgentGroupDbidAndName(tenant_dbid) ); // dbid. name
		var jsAgentGroups = agentGroups + "";
		var arrayGroups = jsAgentGroups.split("|");
		var o = new Array();
		for (var j = 0; j < arrayGroups.length; j++)
		{
			var agtGrp = arrayGroups[j].split(",");
			o.push(new Option(agtGrp[1],agtGrp[0]));			
		}
		
		//sort agents' groups
		o.sort(sortOptionsByText);
		for (var i=0; i<o.length; i++)
		{			
			groupBox.options[i+1] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}
	 }
}

function getAgentsInGroup(groupBox, agentBox, viewBox)
{
	var o = new Array();
	if(groupBox.value =='AllGroups')
	{
		//Empty the agent group combo box
		groupBox.options.length=1;
		agentBox.length = 0;
        var defaultvalue =  "- All Agents -" ;
		myOption = new Option(defaultvalue,"AllAgents")
		optionPos = agentBox.options.length
		agentBox.options[optionPos]=myOption

		fillObjectCombo(groupBox, agentBox, viewBox);
	}
	else
	{

		var agtGroupName = "";
		for (var i = 0; i < groupBox.length; i++)
		{
			if (groupBox.options[i].selected == true)
			{
				agtGroupName = groupBox.options[i].text;
				break;
			}
		}

		var agents = String( appletObj.getAvailableAgentListInGroupByStatus(agtGroupName,1) );
		var jsAgents = agents + "";

		// Remove all agents from agents option field
		var i = agentBox.options.length;
        if (i>0){
              agentBox.length = 0;
        }
        var defaultvalue =  "- All Agents -" ;
		myOption = new Option(defaultvalue,"AllAgents")
		myOption.selected=true;
		o[o.length]= myOption;

		if(agents.length > 0 ){
			arrayAgents = jsAgents.split("|");
    		for (j = 0; j <arrayAgents.length; j++){
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if ( viewBox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents [j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)

				o[o.length]= myOption;

			}
         }

	}

	sortSelect(o);

	for (var i=0; i<o.length; i++) {
		agentBox.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}

	return;
}

function changeAgentListView(groupBox, agentBox, viewBox)
{
	var agents;
	var name="";
	var o = new Array();
	agentBox.length = 0;
    var defaultvalue =  "- All Agents -" ;
	myOption = new Option(defaultvalue,"AllAgents")
	o[o.length]=myOption
	myOption.selected=true;
		
	
	if(groupBox.value == 'AllGroups')
		agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
	else
		agents = String( appletObj.getAvailableAgentListInGroupByStatus(groupBox.options[groupBox.selectedIndex].text,1) );

	var jsAgents = agents + "";
	//alert(jsAgents);
    arrayAgents = jsAgents.split("|");
    for (j = 0; j <arrayAgents.length; j++)
	{
		  var iStartPos = arrayAgents[j].indexOf('[');
		  var iEndPos   = arrayAgents[j].indexOf(']');
		  var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
		  name = login+'['+arrayAgents[j].substr(0,iStartPos)+']'
		  if ( viewBox.checked == false)  // show agents name as : firstname, lastname[login]
			myOption = new Option(arrayAgents[j],login);  
		  else // show agents name as : login[firstname, lastname]
			myOption = new Option(name,login);
		  o[o.length]=myOption
   }   
		
	if (viewBox.checked == false)	
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
		agentBox.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}

  //sortSelect(agentBox);
}

function convertTimeToSeconds(time)
{
	total_time = 0;
	hour = 0;
	minute = 0;
	second = 0;
	if(time.indexOf(":") != -1)
	{
		time_array = time.split(":");
		hour = time_array[0] != null && IsNumeric(time_array[0]) ? time_array[0] : 0;
		minute = time_array[1] != null && IsNumeric(time_array[0]) ? time_array[1] : 0;
		second = time_array[2] != null && IsNumeric(time_array[0]) ? time_array[2] : 0;
	}
	else
		hour = time;
	total_time += hour * 3600 + minute * 60 + second * 1;
	return total_time;
}

function buildOverrideTime(id, time_format)
{
	var override_time = 0;
	var time_format_sec = 0;
	var agt_id = id.substring(14, id.length);
	var paid_time = document.getElementById("paidtime"+agt_id).value;
	//alert(convertTimeToSeconds(paid_time));
	
	if (time_format.substring(0, 1) == '-')
	{
		time_format_sec = time_format.substring(1, time_format.length);
		//alert(convertTimeToSeconds(time_format_sec));
		override_time = convertTimeToSeconds(paid_time) - convertTimeToSeconds(time_format_sec);
	}
	else
	{
		time_format_sec = time_format.substring(0, time_format.length);
		//alert(convertTimeToSeconds(time_format_sec));
		override_time = convertTimeToSeconds(paid_time) + convertTimeToSeconds(time_format_sec);
	}
	
	var dest_id = "overridetime"+agt_id;
	//alert(override_time);
	var override_hour = override_time / 3600;
	//alert(override_hour);
	buildReadableTime(dest_id, override_hour);
}

function buildCorrectionTime(id, value)
{
	if (value.substring(0, 1) == '-')
	{
		document.getElementById(id).value = "(" + value.substring(1, value.length) + ")";
	}
	else
	{
		document.getElementById(id).value = value;
	}
	
}

function buildReadableTime(id, time_hr)
{
	var signe = 1;
	if (time_hr < 0)
	{
		signe = -1;
		time_hr = -1*time_hr;
	}
	var time_sec = time_hr*3600;
	var time = "";
	var hours = 0;
	var minutes = 0;
	var seconds = 0;

	if (time_hr < 0)
	{
		time_sec = -1*time_sec;
	}
	hours = parseInt(time_sec / 3600);
	if ((hours < 10) && (hours > 0))
	{
		time += "0";
		time += hours;
	}
	else if ((hours >= 10) && (hours > 0))
		time += hours;
	if (hours == 0)
		time += "00";
	time += ":";

	minutes = parseInt((time_sec - hours * 3600) / 60);
	if ((minutes < 10) && (minutes > 0))
	{
		time += "0";
		time += minutes;
	}
	else if ((minutes >= 10) && (minutes > 0))
		time += minutes;
	if (minutes == 0)
		time += "00";
	time += ":";

	seconds = parseInt((time_sec - minutes * 60) % 3600);
	if (seconds < 10)
	{
		time += "0";
		time += seconds;
	}
	else
		time += seconds;

	if (signe == -1)
	{
		time = "(" + time + ")";
	}

	document.getElementById(id).value = time;
}

function extractAllData()
{
	var startDate = document.getElementById("reportDate").value;
	var agentGroupId = document.getElementById("agtGrp").value;
	var agentId = getSelectedAgents();//alert("list of agents: "+agentId );
	//var agentId = '';
	if(startDate == '')
	{
		alert(MultiArray["Please enter a date for report"][lang]);
		return ;
	}
	if( agentGroupId == null || agentGroupId.length == 0)
	{
		alert(MultiArray["Please select a group"][lang]);
	  	return;
	}
	if( agentId == null || agentId.length == 0)
	{
     	alert(MultiArray["Please select an agent"][lang]);
	  	return;
	}
	
	document.getElementById("agtGrp").disabled = true;
	document.getElementById("objects").disabled = true;
	document.location = "./loginvsProduction.jsp?type=report&userid="+userid+"&viewData=true&saveAddedRows=&startDate="+startDate+"&agentGroupId="+agentGroupId+"&agentId="+agentId+"&tenant_dbid="+tenant_dbid;
	
}

function displayOverrideCause(id_suff, comments)
{
	if (comments == 'No comments' || comments == ' '  || comments == 'null')
	{
	}
	else
	{
		document.getElementById("selectoverridecause" + id_suff).disabled = true;
		if (comments.length >= 5 && comments.substring(0, 5) != 'Other')
		{
			selectObject(document.getElementById("selectoverridecause" + id_suff), comments);
		}
		else
		{
			document.getElementById("overridecause"+id_suff).style.visibility = 'visible';
			document.getElementById("overridecause" + id_suff).disabled = true;
			var custom_comments = comments.split("~");
			selectObject(document.getElementById("selectoverridecause" + id_suff), custom_comments[0]);
			document.getElementById("overridecause" + id_suff).value = custom_comments[1];
		}
	}

}

var chaine1 = ""; // contient les infos à inserer (not_already_modified)
var chaine2 = ""; // contient les infos à updater (already_modified)
var chaine3 = ""; // contient les infos à updater après CloseTheDay
var nrows = 1;
var maxrow = 1;

function saveTheModified()
{
	var strToInsert = "", strToUpdate = "";
	if (chaine1 != '')
	{
		//alert("chaine1 = "+chaine1);
		chaine1 = chaine1.substring(0, chaine1.length-1);
		strToInsert = "", strToUpdate = "";
		tabInfos = chaine1.split("|");
		for(var i = 0; i < tabInfos.length; i++)
		{
			if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
			{
				
				strToInsert += tabInfos[i] + "_";
				var elt_id = "logintime" + tabInfos[i];
				strToInsert += document.getElementById("logintime" + tabInfos[i]).value + "_";
				strToInsert += document.getElementById("paidtime" + tabInfos[i]).value + "_";
				if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
					strToInsert += "1" + "_";
				else
					strToInsert += "0" + "_";
				strToInsert += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
				strToInsert += document.getElementById("overridetime" + tabInfos[i]).value + "_";
				var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
				if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
				{
					strToInsert += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
				}
				else
					strToInsert += selectbox + "_";
				strToInsert += document.getElementById("billabletime" + tabInfos[i]).value + "_";
				strToInsert += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
				strToInsert += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
				strToInsert += "0|";
				
				//alert("String to insert:"+strToInsert);
			}
		}
	}
	if (strToInsert != '')
		strToInsert = strToInsert.substring(0, strToInsert.length-1);

	if (chaine2 != '')
	{
		strToUpdate = "";
		chaine2 = chaine2.substring(0, chaine2.length-1);
		tabInfos = chaine2.split("|");
		for(var i = 0; i < tabInfos.length; i++)
		{
			strToUpdate += tabInfos[i] + "_";
			strToUpdate += document.getElementById("logintime" + tabInfos[i]).value + "_";
			strToUpdate += document.getElementById("paidtime" + tabInfos[i]).value + "_";
			if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
				strToUpdate += "1" + "_";
			else
				strToUpdate += "0" + "_";
			strToUpdate += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
			strToUpdate += document.getElementById("overridetime" + tabInfos[i]).value + "_";
			var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
			if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
			{
				strToUpdate += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
			}
			else
				strToUpdate += selectbox + "_";

			strToUpdate += document.getElementById("billabletime" + tabInfos[i]).value + "_";
			strToUpdate += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
			strToUpdate += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
			
			strToUpdate += "0|";
		}
		strToUpdate = strToUpdate.substring(0, strToUpdate.length-1);
	}

	if(document.getElementById("strToInsertCell") != null){
		document.agentHours.strToInsertCell.value = strToInsert;
	}
	if(document.getElementById("strToUpdateCell") != null){
		document.agentHours.strToUpdateCell.value = strToUpdate;
	}
	if(document.getElementById("type") != null){
		document.agentHours.type.value = "report";
	}
	if(document.getElementById("tenant_dbid") != null){
		document.agentHours.tenant_dbid.value = tenant_dbid;
	}
	if(document.getElementById("userid") != null){
		document.agentHours.userid.value = userid;
	}
	if(document.getElementById("viewData") != null){
		document.agentHours.viewData.value = "true";
	}
	if(document.getElementById("startDate") != null){
		document.agentHours.startDate.value = startDate;
	}
	if(document.getElementById("agentGroupId") != null){
		document.agentHours.agentGroupId.value = agentGroupId;
	}
	if(document.getElementById("agentId") != null){
		document.agentHours.agentId.value = agentId;
	}
	if(document.getElementById("saveAddedRows") != null){
		document.agentHours.saveAddedRows.value = 'false';
	}
	if(document.getElementById("dayClosed") != null){
		document.agentHours.dayClosed.value = 'false';
	}
	document.agentHours.submit();

}

function closeTheDay()
{
	
//var chaine1 = ""; // contient les infos à inserer (not_already_modified)
//var chaine2 = ""; // contient les infos à updater (already_modified)
//var chaine3 = ""; // contient les infos à updater après CloseTheDay

	var close_really = confirm(MultiArray["Do you really want to close this day"][lang]);
	
	if (close_really == true)
	{
		
		var tabInfos = "", strToInsert = "", strToUpdate = "";
	
		if (chaine3 != '')//
		{
			chaine3 = chaine3.substring(0, chaine3.length - 1);
			strToInsert = "", strToUpdate = "";
			tabInfos = chaine3.split("|");
			for(var i = 0; i < tabInfos.length; i++)
			{
				strToUpdate += tabInfos[i] + "_";
				strToUpdate += document.getElementById("logintime" + tabInfos[i]).value + "_";
				strToUpdate += document.getElementById("paidtime" + tabInfos[i]).value + "_";
				if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
					strToUpdate += "1" + "_";
				else
					strToUpdate += "0" + "_";
				strToUpdate += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
				strToUpdate += document.getElementById("overridetime" + tabInfos[i]).value + "_";
				var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
				if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
				{
					strToUpdate += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
				}
				else
					strToUpdate += selectbox + "_";
	
				strToUpdate += document.getElementById("billabletime" + tabInfos[i]).value + "_";
				strToUpdate += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
				strToUpdate += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
				strToUpdate += "1|";
			}
			strToUpdate = strToUpdate.substring(0, strToUpdate.length-1);
			
			//alert("Chaine3:strToUpdate"+strToUpdate);
			
			if(document.getElementById("strToInsertCell") != null){
				document.agentHours.strToInsertCell.value = strToInsert;
			}
			if(document.getElementById("strToUpdateCell") != null){
				document.agentHours.strToUpdateCell.value = strToUpdate;
			}
			if(document.getElementById("type") != null){
				document.agentHours.type.value = "report";
			}
			if(document.getElementById("tenant_dbid") != null){
				document.agentHours.tenant_dbid.value = tenant_dbid;
			}
			if(document.getElementById("userid") != null){
				document.agentHours.userid.value = userid;
			}
			if(document.getElementById("viewData") != null){
				document.agentHours.viewData.value = "true";
			}
			if(document.getElementById("startDate") != null){
				document.agentHours.startDate.value = startDate;
			}
			if(document.getElementById("agentGroupId") != null){
				document.agentHours.agentGroupId.value = agentGroupId;
			}
			if(document.getElementById("agentId") != null){
				document.agentHours.agentId.value = agentId;
			}
			if(document.getElementById("saveAddedRows") != null){
				document.agentHours.saveAddedRows.value = 'false';
			}
			if(document.getElementById("dayClosed") != null){
				document.agentHours.dayClosed.value = 'true';
			}
			document.agentHours.submit();
	
		}
		else
		{
			if (chaine1 != '')
			{
				chaine1 = chaine1.substring(0, chaine1.length-1);
				strToInsert = "", strToUpdate = "";
				tabInfos = chaine1.split("|");
				for(var i = 0; i < tabInfos.length; i++)
				{
					strToInsert += tabInfos[i] + "_";
					var elt_id = "logintime" + tabInfos[i];
					strToInsert += document.getElementById("logintime" + tabInfos[i]).value + "_";
					strToInsert += document.getElementById("paidtime" + tabInfos[i]).value + "_";
					if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
						strToInsert += "1" + "_";
					else
						strToInsert += "0" + "_";
					strToInsert += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
					strToInsert += document.getElementById("overridetime" + tabInfos[i]).value + "_";
					var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
					if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
					{
						strToInsert += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
					}
					else
						strToInsert += selectbox + "_";
	
					strToInsert += document.getElementById("billabletime" + tabInfos[i]).value + "_";
					strToInsert += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
					strToInsert += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
					strToInsert += "1|";
				}
			}
			if (strToInsert != '')
				strToInsert = strToInsert.substring(0, strToInsert.length-1);
	
			//alert("Chaine1:strToInsert"+strToInsert);
			
			if (chaine2 != '')
			{
				strToUpdate = "";
				chaine2 = chaine2.substring(0, chaine2.length-1);
				tabInfos = chaine2.split("|");
				for(var i = 0; i < tabInfos.length; i++)
				{
					strToUpdate += tabInfos[i] + "_";
					strToUpdate += document.getElementById("logintime" + tabInfos[i]).value + "_";
					strToUpdate += document.getElementById("paidtime" + tabInfos[i]).value + "_";
					if (document.getElementById("checkoverride" + tabInfos[i]).checked == true)
						strToUpdate += "1" + "_";
					else
						strToUpdate += "0" + "_";
					strToUpdate += document.getElementById("correctiontime" + tabInfos[i]).value + "_";
					strToUpdate += document.getElementById("overridetime" + tabInfos[i]).value + "_";
					var selectbox = document.getElementById("selectoverridecause" + tabInfos[i]).value;
					if (selectbox.length == 5 && selectbox.substring(0, 5) == 'Other')
					{
						strToUpdate += selectbox + "~" + document.getElementById("overridecause" + tabInfos[i]).value + "_";
					}
					else
						strToUpdate += selectbox + "_";
	
					strToUpdate += document.getElementById("billabletime" + tabInfos[i]).value + "_";
					strToUpdate += document.getElementById("notpaidnrrtime" + tabInfos[i]).value + "_";
					strToUpdate += document.getElementById("overpaidnrrtime" + tabInfos[i]).value + "_";
					strToUpdate += "1|";
				}
				strToUpdate = strToUpdate.substring(0, strToUpdate.length-1);
				
				//alert("Chaine2:strToUpdate"+strToUpdate);
				
			}
	
			if(document.getElementById("strToInsertCell") != null){
				document.agentHours.strToInsertCell.value = strToInsert;
			}
			if(document.getElementById("strToUpdateCell") != null){
				document.agentHours.strToUpdateCell.value = strToUpdate;
			}
			if(document.getElementById("type") != null){
				document.agentHours.type.value = "report";
			}
			if(document.getElementById("tenant_dbid") != null){
				document.agentHours.tenant_dbid.value = tenant_dbid;
			}
			if(document.getElementById("userid") != null){
				document.agentHours.userid.value = userid;
			}
			if(document.getElementById("viewData") != null){
				document.agentHours.viewData.value = "true";
			}
			if(document.getElementById("startDate") != null){
				document.agentHours.startDate.value = startDate;
			}
			if(document.getElementById("agentGroupId") != null){
				document.agentHours.agentGroupId.value = agentGroupId;
			}
			if(document.getElementById("agentId") != null){
				document.agentHours.agentId.value = agentId;
			}
			if(document.getElementById("saveAddedRows") != null){
				document.agentHours.saveAddedRows.value = 'false';
			}
			if(document.getElementById("dayClosed") != null){
				document.agentHours.dayClosed.value = 'true';
			}
			document.agentHours.submit();
		} // fin de else if chaine != ''
		
	}// fin if (close_really == true)
	else
	{
	
	}

}

function fillActivitiesCombo(id)
{

	if(document.getElementById(id).options.length <= 1 )
	{
		var activities = String( appletObj.getActivitiesByTenantId(tenant_dbid) );//"dbid^name|dbid^name|...|dbid^name"
		var jsActivities = activities + "";
		var arrayActivities = jsActivities.split("|");
		for (j = 0; j < arrayActivities.length; j++)
		{
			var activity = arrayActivities[j].split("^");
			myOption = new Option(activity[1],activity[0])
			optionPos = document.getElementById(id).options.length
			document.getElementById(id).options[optionPos]=myOption
		}
	}
}

function addMyRow(groupBox,agtBox,viewBox)
{
	if(groupBox.value == 'AllGroups')
	{
	  alert(MultiArray["Please select a group"][lang]);
	  return;
	}

	if(agtBox.value == 'AllAgents')
	{
     alert(MultiArray["Please select an agent"][lang]);
	  return;
	}

	var agtinfo = agtBox.options[agtBox.selectedIndex].text;
	var agtId = agtBox.value, agtname="";
	var agtdatas = agtinfo.split("[");
	if(viewBox.checked == true)
	{
		agtname = agtdatas[1].substring(0,agtdatas[1].length-1);
	}
	else
	{
		agtname = agtdatas[0];

	}
	
	lyr = document.getElementById("divAddARow");
	var nom = 'n'+ nrows;
	var code='';
	var i = 0;
	var allRows = '';
	
	var previousRows = '';//to hold html code of previous rows
	var tblObj ;
	
	if (maxrow == 1)
	{
		
		
		code += "<table id='addRowTbl' border='1' style='border-collapse:collapse ' bordercolor='#CCCCCC'>";
		
		//build table header
		
		code += "<tr id='t0'>";
		code += "<td align='center' width='6%'><b> ----- </b></td>";
		code += "<td align='center' width='10%'><b>"+MultiArray["Agent ID"][lang]+"</b></td>";
		code += "<td align='center' width='20%'><b>"+MultiArray["Last name"][lang]+", "+MultiArray["First name"][lang]+"</b></td>";
		code += "<td align='center' width='15%'><b>"+MultiArray["Agent group"][lang]+"</b></td>";
		code += "<td align='center' width='20%'><b>"+MultiArray["Activity"][lang]+"</b></td>";
		code += "<td align='center' width='9%'><b>"+MultiArray["Paid time"][lang]+" (hh:mm:ss)</b></td>";
		code += "<td align='center' width='20%'><b>"+MultiArray["Comments"][lang]+"</b></td>";
		code += "</tr>";
		
		tableArr[0] = code;
		
		//Build the first row
		code = "";
		code += "<tr id='t1'>";
		code += "<td align='center' width='6%'> <input type='button' onClick='javascript:deleteMyRow("+nrows+");' value='"+MultiArray["Delete"][lang]+"'></td>";
		code += "<td align='center' id='agentId"+nrows+"' width='10%'>"+agtId+"</td>";
		code += "<td align='center' id='agentName"+nrows+"' width='20%'>"+agtname+"</td>";
		code += "<td align='center' id='agentGroupId"+nrows+"' value='"+groupBox.options[groupBox.selectedIndex].value+"' width='15%'>"+groupBox.options[groupBox.selectedIndex].text+"</td>";
		code += "<td align='center' id='activity"+nrows+"' width='20%'>";
		code += "<select id='select_activity_type"+nrows+"' name='select_activity_type"+nrows+"' onClick='fillActivitiesCombo(this.id)'>";
		code += "<option value=''>"+MultiArray["Select"][lang]+"</option>";
		code += "</select>";
		code += "</td>";
		code += "<td align='center' width='9%'><input type='text' id='paidtime"+nrows+"' name='paidtime"+nrows+"' size='10' value='' onFocus='this.select()' ></td>";//onBlur='buildReadableTime(this.id, this.value)'
		code += "<td align='center' width='20%'>";
		code += "<input type='text' id='comments"+nrows+"' name='comments"+nrows+"' size='18'></td>";
		code += "</tr>";
		
		tableArr[1] = code;		
	}
	else
	{
		//bulid a new row
		code += "<tr id='t"+nrows+"'>";
		code += "<td align='center' width='6%'> <input type='button' onClick='javascript:deleteMyRow("+nrows+");' value='"+MultiArray["Delete"][lang]+"'></td>";
		code += "<td align='center' id='agentId"+nrows+"' width='10%'>"+agtId+"</td>";
		code += "<td align='center' id='agentName"+nrows+"' width='20%'>"+agtname+"</td>";
		code += "<td align='center' id='agentGroupId"+nrows+"' value='"+groupBox.options[groupBox.selectedIndex].value+"' width='15%'>"+groupBox.options[groupBox.selectedIndex].text+"</td>";
		code += "<td align='center' id='activity"+nrows+"' width='20%'>";
		code += "<select id='select_activity_type"+nrows+"' name='select_activity_type"+nrows+"' onClick='fillActivitiesCombo(this.id)'>";
		code += "<option value=''>"+MultiArray["Select"][lang]+"</option>";
		code += "</select>";
		code += "</td>";
		code += "<td align='center' width='15%'><input type='text' id='paidtime"+nrows+"' name='paidtime"+nrows+"' size='10' value='' onFocus='this.select()' ></td>";//onBlur='buildReadableTime(this.id, this.value)'
		code += "<td align='center' width='20%'>";
		code += "<input type='text' id='comments"+nrows+"' name='comments"+nrows+"' size='18'></td>";
		code += "</tr>";
		
		tableArr.push(code);
	}
	
   	lyr.innerHTML = "";
	previousRows = "";
	for(var i=0; i<tableArr.length; i++)
		previousRows += tableArr[i];		
	lyr.innerHTML = previousRows + "</table>";
	
	fillActivitiesCombo("select_activity_type"+nrows);
	nrows++;
	maxrow++;
	document.getElementById("saveRows").disabled = false;
}

function deleteMyRow(f)
{
	var thisRowId = 't'+f;
	var tObj = document.getElementById("addRowTbl");
	var rObj = tObj.rows;
		
	for(var i=1; i<rObj.length; i++)
	{
		if(rObj[i].id == thisRowId)
			break;
	}
	//alert("row index is "+i);
	tObj.deleteRow(i);
	//remove the HTML code for this row
	tableArr.splice(i,1);
	
	nrows--;
	if(nrows ==1)
		document.getElementById("divAddARow").removeChild(document.getElementById("addRowTbl"));
}

function compareDates(date1, date2)
{
	var comp_result = 'false';
	var tabDate1 = date1.split("/");
	var tabDate2 = date2.split("/");
	//alert( tabDate1[2]+"-"+tabDate2[2] +"-"+tabDate1[1] +"-"+ tabDate2[1]+"-"+tabDate1[0] +"-"+ tabDate2[0]);
	// anee
	if (parseInt(tabDate2[2], 10) < parseInt(tabDate1[2], 10) )
		return 'false';
	if (parseInt(tabDate2[2], 10) > parseInt(tabDate1[2], 10) )
		return 'true';
	if (parseInt(tabDate2[2], 10) == parseInt(tabDate1[2], 10) )
	{
		// mois
		if (parseInt(tabDate2[0], 10) < parseInt(tabDate1[0], 10) )
			return 'false';
		if (parseInt(tabDate2[0], 10) > parseInt(tabDate1[0], 10) )
			return 'true';
		if (parseInt(tabDate2[0], 10) == parseInt(tabDate1[0], 10) )
		{
			// jour
			if (parseInt(tabDate2[1], 10) < parseInt(tabDate1[1], 10) )
				return 'false';
			if (parseInt(tabDate2[1], 10) >= parseInt(tabDate1[1], 10) )
				return 'true';
		}
	}

}

function saveMyRows()
{
	var strToInsert = "", strToUpdate = "";
	var startDate2 = document.getElementById("reportDate2").value;
	if( startDate2== null || startDate2.length == 0 )
	{
		alert(MultiArray["Select a date"][lang]);
		return;
	}
	
	
	var today = new Date();
	
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var year = today.getFullYear();
	var s = "/";
	
	cur_day = month + s + day + s + year;
	var result = compareDates(cur_day, startDate2);
	
	
	var trouve = false;
	for (var i = 1; i < maxrow; i++)
	{
		if (document.getElementById("t"+i) != null)
		{
			if(document.getElementById("select_activity_type"+i).value == "")
			{
				trouve = true;
				break;
			}
		}
	}

	if (trouve == true)
	{
		
		alert(MultiArray["You must select an activity for each row, please verify"][lang]);
		return;
	}
	for (var i = 1; i < maxrow; i++)
	{
		if (document.getElementById("t"+i) != null)
		{
			var paidtime_value = document.getElementById("paidtime"+i).value;
			if(paidtime_value == "" || paidtime_value == "00:00:00" || paidtime_value.length != 8 || paidtime_value.charAt(2) != ':')
			{
				trouve = true;
				break;
			}
		}
	}

	if (trouve == true)
	{
	
		alert(MultiArray["You must enter a paid time for each row, and respect the format. Please verify !"][lang]);
		return;
	}

	for (var i = 1; i < maxrow; i++)
	{
		if (document.getElementById("t"+i) != null)
		{
			strToInsert += document.getElementById("agentId"+i).innerHTML + "_";
			strToInsert += document.getElementById("agentGroupId"+i).value + "_";
			strToInsert += document.getElementById("select_activity_type"+i).value + "_";
			strToInsert += "00:00:00_";
			strToInsert += document.getElementById("paidtime"+i).value + "_";
			strToInsert += "1_";
			strToInsert += "00:00:00_";
			strToInsert += "00:00:00_";
			strToInsert += "Other~"+document.getElementById("comments"+i).value + "_";
			strToInsert += document.getElementById("paidtime"+i).value + "_";
			strToInsert += "0_0_0|";
		}
	}
	if (strToInsert.length > 0)
		strToInsert = strToInsert.substring(0, strToInsert.length - 1);

	if(document.getElementById("strToInsertCell") != null){
		document.agentHours.strToInsertCell.value = strToInsert;
	}
	if(document.getElementById("strToUpdateCell") != null){
		document.agentHours.strToUpdateCell.value = strToUpdate;
	}
	if(document.getElementById("type") != null){
		document.agentHours.type.value = "report";
	}
	if(document.getElementById("tenant_dbid") != null){
		document.agentHours.tenant_dbid.value = tenant_dbid;
	}
	if(document.getElementById("userid") != null){
		document.agentHours.userid.value = userid;
	}
	if(document.getElementById("viewData") != null){
		document.agentHours.viewData.value = "false";
	}
	if(document.getElementById("startDate") != null){
		document.agentHours.startDate.value = startDate2;
	}
	if(document.getElementById("agentGroupId") != null){
		document.agentHours.agentGroupId.value = agentGroupId;
	}
	if(document.getElementById("agentId") != null){
		document.agentHours.agentId.value = agentId;
	}
	if(document.getElementById("saveAddedRows") != null){
		document.agentHours.saveAddedRows.value = 'true';
	}
	document.agentHours.submit();

	
}

isIE=document.all;
isNN=!document.all&&document.getElementById;
 // Mouse events
function setMousePosition(e) 
{
   mp.x = (document.all)? event.clientX  + document.body.scrollLeft : e.pageX ;
   mp.y = (document.all)? event.clientY + document.body.scrollTop : e.pageY ;
   //window.status = " mp.x = "+mp.x+" mp.y = "+ mp.y
}

function mousePosition() 
{
   this.x = 0;
   this.y = 0;
}

var mp = new mousePosition();

function showPaidTimeDetails(agent_id, agent_name, login_time, not_paid_nrr_time, over_paid_nrr_time, paid_time, state)
{
	//
	if (document.getElementById('bulleDiv') != null)
	{
		if(state==1){
			setMousePosition();
			var code = "<TABLE WIDTH='100%'>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left' height='15'></TD><TD NOWRAP WIDTH=50%><b></b></TD><TD NOWRAP WIDTH=30%></TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH='80%' colspan=2 align='center'><b>"+agent_id+": "+agent_name+"</b></TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH=50%><b>"+MultiArray["Login time"][lang] +" :</b></TD><TD NOWRAP WIDTH=30%>  "+login_time+"</TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH=50%><b>"+MultiArray["Not paid NRR time"][lang] +" :</b></TD><TD NOWRAP WIDTH=30%>-("+not_paid_nrr_time+")</TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH=50%><b>"+MultiArray["Extra paid NRR time"][lang] +" :</b><TD NOWRAP WIDTH=30%>-("+over_paid_nrr_time+")</TD></TD></TR>"
			code +="<TR> <TD NOWRAP WIDTH=20% ALIGN='left'></TD><TD NOWRAP WIDTH=50%><b>"+MultiArray["Total paid time"][lang] +" :</b></TD><TD NOWRAP WIDTH=30%>= "+paid_time+"</TD></TR>"
			code +="</TABLE>";
			document.getElementById('bulleDiv').innerHTML = code;
			document.getElementById('bulleDiv').style.left = mp.x+16;
			document.getElementById('bulleDiv').style.top = mp.y-48;
			document.getElementById('bulleDiv').style.visibility = 'visible';

		}
		else{

			document.getElementById('bulleDiv').style.visibility = 'hidden';
		}
	}
}

function hideLoadingDiv()
{
	if (document.getElementById("loading_div") != null)
	{
		document.getElementById("loading_div").innerHTML = "";
		document.getElementById("loading_div").style.visibility = 'hidden';
	}

}

function viewExceptions()
{
	if (document.getElementById("viewExceptionObj") != null)
	{
		document.getElementById("viewExceptionObj").value = 'true';
		var date_from = document.getElementById("fromDate").value;
		var date_to = document.getElementById("toDate").value;
		document.getElementById("dateFrom").value = date_from;
		document.getElementById("dateTo").value = date_to;
		//alert("view exceptions " + date_from +"-"+ date_to);
		document.agentHours.submit();
	}	
}

function displayTmpMessage(theMess, color)
{	
	var TempMsgObj = document.getElementById('TempMsg');
	var TempMessagesObj = document.getElementById('TempMessages');
	TempMsgObj.innerHTML = theMess;
	if(color != "")
		TempMsgObj.style.color = color;
	TempMessagesObj.style.top = document.body.clientHeight/2-TempMessagesObj.clientHeight/2;
	TempMessagesObj.style.left = document.body.clientWidth/2-TempMessagesObj.clientWidth/2;
	
	TempMessagesObj.style.visibility = "visible";
	TempMsgObj.style.visibility = "visible";
}

function retrieveTmpMessage()
{	
	var TempMsgObj = document.getElementById('TempMsg');
	var TempMessagesObj = document.getElementById('TempMessages');
	TempMsgObj.innerHTML = "";
	TempMessagesObj.style.visibility = "hidden";
		
}