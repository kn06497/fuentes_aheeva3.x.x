groupName   = normalizeString(QueryString('grpName'));
function enableUpdateButton()
{
	document.agentGroup.updateInfo.disabled = false;
}

function enableMp3Quality()
{
	for (var b = 0; b < document.agentGroup.mp3Quality.length; b++)
	{
		if(document.agentGroup.mp3Encoding.checked)
			document.agentGroup.mp3Quality[b].disabled = false;
		else
			document.agentGroup.mp3Quality[b].disabled = true;
	}
}

function selectMp3Quality(quality)
{
	for (var b = 0; b < document.agentGroup.mp3Quality.length; b++)
	{
		if(document.agentGroup.mp3Quality[b].value == quality)
			document.agentGroup.mp3Quality[b].checked = true;
		else
			document.agentGroup.mp3Quality[b].checked = false;
	}
}

function getMp3Quality()
{
	var quality = "low";
	for (var b = 0; b < document.agentGroup.mp3Quality.length; b++)
	{
		if(document.agentGroup.mp3Quality[b].checked)
			quality = document.agentGroup.mp3Quality[b].value;
	}
	return quality;
}

function updateEncServerBox()
{
	if(document.agentGroup.encryptionEnable.checked == true )
	{
		document.agentGroup.encServer.disabled = false;
		document.agentGroup.encMethod.disabled = false;
		
	}
	else
	{	
		if(!appletObj.getIsEncryptionServerAllowed()){ 
		    	document.agentGroup.encServer.value = '';
		 	document.agentGroup.encMethod.value = '';
		}
		document.agentGroup.encServer.disabled = true;
		document.agentGroup.encMethod.disabled = true;
	}
}


function updateScreenCaptureBox(){
}


function enableReload()
{
   appletObj.fReloadMenu = true;
}

function changeAgentListView()
{
	var myForm = document.agentGroup;
	var name = '';
	var tmpAgents ='';
	var i=myForm.availableAgentInGroup.options.length;
	var j=myForm.nonConfiguredAgents.options.length;

    // Remove all agents from availableAgentInGroup option field
	if (i>0)
	{
		for (i-1; i>=0; i--)
		   myForm.availableAgentInGroup.options[i] = null;
	}

	// Remove all agents from NonConfiguredAgent option field
	if (j>0)
	{
		for (j-1; j>=0; j--)
			myForm.nonConfiguredAgents.options[j] = null;
	}
	myForm.availableAgentInGroup.options.length=0;

	freeAgtList = String( appletObj.getNonConfiguredAgentListInGroup(tenant_dbid) );
	agtList  = String( appletObj.getAvailableAgentListInGroup(groupName) );

	// parse the available agent list
	var jsAgtLists = agtList+ "";
	arrayAgtList = jsAgtLists.split("|");

	for (j = 0; j <arrayAgtList.length; j++)
	{
		var jsThisList = arrayAgtList[j];
		arrayCurrent   = jsThisList.split(",");
		for (m = 0; m <arrayCurrent.length; m++)
		{
			if(m == 0)
				lastName = arrayCurrent[m];
			else if(m == 1)
				firstName = arrayCurrent[m];
			else if(m == 2)
				login_id = arrayCurrent[m];
		}
		if(arrayAgtList[j] != '' )
		{
			name = lastName +','+ firstName +'['+login_id+']';
			name1 = login_id +' ['+lastName + ','+ firstName +']';
			if(document.agentGroup.orderView.checked == true)
				myOption = new Option(name1,login_id)
			else
				myOption = new Option(name,login_id);

			optionPos = myForm.availableAgentInGroup.options.length
			myForm.availableAgentInGroup.options[optionPos]=myOption
		}
	}

	// parse the Non configured agent list
	var jsNCAgtLists = freeAgtList+ "";
	arrayNCAgtList = jsNCAgtLists.split("|");
	for (j = 0; j <arrayNCAgtList.length; j++)
	{
		var jsThisList = arrayNCAgtList[j];
		arrayCurrent   = jsThisList.split(",");
		for (m = 0; m <arrayCurrent.length; m++)
		{
			if(m == 0)
				lastName = arrayCurrent[m];
			else if(m == 1)
				firstName = arrayCurrent[m];
			else if(m == 2)
				login_id = arrayCurrent[m];
		}
		if(arrayNCAgtList[j] != '' )
		{// a enlever
			name = lastName + ','+ firstName +'['+login_id+']';
			name1 = login_id +' ['+lastName + ','+ firstName +']';
			if(document.agentGroup.orderView.checked == true)
				myOption = new Option(name1,login_id);
			else
				myOption = new Option(name,login_id);
			optionPos = myForm.nonConfiguredAgents.options.length;
			myForm.nonConfiguredAgents.options[optionPos]=myOption;
		}
	}
	sortSelect(myForm.nonConfiguredAgents);
	sortSelect(myForm.availableAgentInGroup);
	myForm.AgentGroupSelection.options[0].selected=true;
}

function chkAndAddAgentToGroup()
{
	var myForm = document.agentGroup;
	var name = '';
	var tmpAgents ='';
	var login = '';
	var i;	
	
	var option_len = myForm.availableAgentInGroup.options.length;
	
	for ( i=0;i<=option_len-1;i++)
	{
		if(myForm.availableAgentInGroup.options[i].selected == true )
		{
			login = myForm.availableAgentInGroup.options[i].value;			
			tmpAgents += login+"|";
		}
	}
	
	if(tmpAgents != '')
	{
		selectedGroupName = document.agentGroup.AgentGroupSelection.value;
		
		appletObj.addAgentToGroup(tmpAgents,selectedGroupName);
		enableUpdateButton();
	}

	var i;
	var o;
	// Move them over
	for ( i=0; i<myForm.availableAgentInGroup.options.length; i++)
	{
		o = myForm.availableAgentInGroup.options[i];
		if (o.selected)
			myForm.nonConfiguredAgents.options[myForm.nonConfiguredAgents.options.length] = new Option( o.text, o.value, false, false);
	}
	// Delete them from original
	for (  i=(myForm.availableAgentInGroup.options.length-1); i>=0; i--)
	{
		o = myForm.availableAgentInGroup.options[i];
		if (o.selected)
			myForm.availableAgentInGroup.options[i] = null;
	}

	sortSelect(myForm.availableAgentInGroup);
	sortSelect(myForm.nonConfiguredAgents);

	myForm.availableAgentInGroup.selectedIndex = -1;
	myForm.nonConfiguredAgents.selectedIndex = -1;
}

function chkAndDropAgentFromGroup()
{
	var myForm = document.agentGroup;
	var name = '';
	var tmpAgents='';
	var login = '';
	var i;
	var o;
	var option_len = myForm.nonConfiguredAgents.options.length;
	for (var i=0;i<option_len;i++)
	{
		if(myForm.nonConfiguredAgents.options[i].selected == true )
		{
			login = myForm.nonConfiguredAgents.options[i].value;			
			tmpAgents += login+"|";
		}
	}

	if(tmpAgents != '')
		//appletObj.dropAgentFromGroup(tmpAgents);
		appletObj.addAgentToGroup(tmpAgents,groupName);
	enableUpdateButton();

	// Move them over
	for (i=0; i<myForm.nonConfiguredAgents.options.length; i++)
	{
		o = myForm.nonConfiguredAgents.options[i];
		if (o.selected)
			myForm.availableAgentInGroup.options[myForm.availableAgentInGroup.options.length] = new Option( o.text, o.value, false, false);
	}
	// Delete them from original
	for ( i=(myForm.nonConfiguredAgents.options.length-1); i>=0; i--)
	{
		o = myForm.nonConfiguredAgents.options[i];
		if (o.selected)
			myForm.nonConfiguredAgents.options[i] = null;
	}
	sortSelect(myForm.availableAgentInGroup);
	sortSelect(myForm.nonConfiguredAgents);

	myForm.nonConfiguredAgents.selectedIndex = -1;
	myForm.availableAgentInGroup.selectedIndex = -1;
}

function loadAgentGroupsCombo(tenant_dbid)
{
	//Getting the list form ComApplet
	var allAgentGroups  = String(appletObj.getAgentGroupDbidAndName(tenant_dbid));
	var curGroupName = normalizeString(QueryString('grpName'));
	//alert(allAgentGroups);
	// always add a null agent group
	myOption = new Option("No Group", "No Group");
	document.agentGroup.AgentGroupSelection.options[0] = myOption;
	
	//Parsing the received list		//GroupName1|GroupName2...
	var jsGroups = allAgentGroups + "";
	arrayGroups = jsGroups.split("|");
	for (j = 0; j < arrayGroups.length; j++)
	{
		aGroup = arrayGroups[j].split(",");
		if (aGroup[1] != curGroupName)
		{
			myOption = new Option(aGroup[1], aGroup[1]);
			optionPos = document.agentGroup.AgentGroupSelection.options.length;
			document.agentGroup.AgentGroupSelection.options[optionPos] = myOption;
		}
	}
}			

function filterGroupAgents()
{
	//alert("inside filterGroupAgents");
	
	var myForm = document.agentGroup;
	var aName="";
	var i=myForm.nonConfiguredAgents.options.length;
	if (i>0)
	{
		for (i-1; i>=0; i--)
			myForm.nonConfiguredAgents.options[i] = null;
	}
	myForm.nonConfiguredAgents.options.length=0;	
	
	
	var groupName = myForm.AgentGroupSelection.value;
	var agtList = "";
	if (groupName == "No Group")
	{
		agtList = String( appletObj.getNonConfiguredAgentListInGroup(tenant_dbid) );	
	}
	else
	{
		agtList  = String( appletObj.getAvailableAgentListInGroup(groupName) );
	}
	//alert("agt list = " + agtList);
	// parse the available agent list
	var jsAgtLists = agtList+ "";

	arrayAgtList = jsAgtLists.split("|");

	for (j = 0; j <arrayAgtList.length; j++)
	{
		var jsThisList = arrayAgtList[j];
		arrayCurrent   = jsThisList.split(",");
		for (m = 0; m <arrayCurrent.length; m++)
		{
			if(m == 0)
				lastName = arrayCurrent[m];
			else if(m == 1)
				firstName = arrayCurrent[m];
			else if(m == 2)
				login_id = arrayCurrent[m];
		}
		if(arrayAgtList[j] != '')
		{
			aName = lastName + ','+ firstName +'['+login_id+']';
			myOption = new Option(aName,login_id);
			optionPos = myForm.nonConfiguredAgents.options.length;
			myForm.nonConfiguredAgents.options[optionPos]=myOption;
		}
	}

}

function displayAgentGroupInfo()
{
	//alert("Inside displayAgentGroupInfo");
	var lastName;
	var firstName;
	var login_id;
	var name;
	var freeAgtList;
	var agtList;
	var myForm = document.agentGroup;
	var i=myForm.availableAgentInGroup.options.length;
	var j=myForm.nonConfiguredAgents.options.length;

	tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	recordingRight = normalizeString(QueryString('recordingRight'));
	groupName   = normalizeString(QueryString('grpName'));
	//ourCaption   = document.getElementById("caption");
	loadAgentGroupsCombo(tenant_dbid);
	// Remove all agents from availableAgentInGroup option field
	if (i>0)
	{
		for (i-1; i>=0; i--)
			myForm.availableAgentInGroup.options[i] = null;
	}

	// Remove all agents from NonConfiguredAgent option field
	if (j>0)
	{
		for (j-1; j>=0; j--)
			myForm.nonConfiguredAgents.options[j] = null;
	}
	myForm.availableAgentInGroup.options.length=0;

	// Afficher les Not ready Reason Globaux
	var availableGlobalNRRNames = String(appletObj.getAvailableGlobalNRRNames(tenant_dbid));
	availableGlobalNRRNames = availableGlobalNRRNames + "";
	//alert("availableGlobalNRRNames = " + availableGlobalNRRNames );
	arrayGlobalNRRNames = availableGlobalNRRNames.split("|");
	var comboObj, delLink;
	if(availableGlobalNRRNames.length > 0)
	{
		for (var j = 0; j < arrayGlobalNRRNames.length; j++)
		{
			var reasonName = arrayGlobalNRRNames[j];
			addMyGlobalRow();
			comboObj = document.getElementById('n'+(j+1));
			delLink = document.getElementById('del'+(j+1));
			if(comboObj != null)
			{
				comboObj.disabled = true;
				delLink.innerText = "";
				for(var m=0; m < comboObj.options.length; m++)
				{
					//alert("m="+m+" reasonName="+reasonName);
					if(comboObj.options[m].value == reasonName)
					{
						comboObj.options[m].selected= true;
						break;
					}
				}
			}
		}
	}

	// Afficher les Not ready Reason non globaux
	//availableNRRList = String(appletObj.getAvailableNRRList(tenant_dbid) );
	
	NRRList = String (appletObj.getNRRListForGroup(groupName) );
	
	// afficher les reasons *************************************
	var jsNRRList = NRRList+ "";
	//alert("NRRList="+NRRList)
	arrayNRRList = jsNRRList.split("|");
	var comboObj2;
	if(jsNRRList.length > 0)
	{
		//alert("arrayNRRList.length = "+ arrayNRRList.length);
		for (var j = 0; j < arrayNRRList.length; j++)
		{
			var reasonName = arrayNRRList[j];
			addMyNotGlobalRow();

			comboObj2=document.getElementById('n'+(nrows-1));
			if(comboObj2 != null)
			{
				for(var m=0; m < comboObj2.options.length; m++)
				{
					if(comboObj2.options[m].value == reasonName)
					{
						comboObj2.options[m].selected= true;
						break;
					}
				}
			}
		}
	}

	freeAgtList = String( appletObj.getNonConfiguredAgentListInGroup(tenant_dbid) );
	agtList  = String( appletObj.getAvailableAgentListInGroup(groupName) );

	// parse the available agent list
	var jsAgtLists = agtList+ "";

	arrayAgtList = jsAgtLists.split("|");

	for (j = 0; j <arrayAgtList.length; j++)
	{
		var jsThisList = arrayAgtList[j];
		arrayCurrent   = jsThisList.split(",");
		for (m = 0; m <arrayCurrent.length; m++)
		{
			if(m == 0)
				lastName = arrayCurrent[m];
			else if(m == 1)
				firstName = arrayCurrent[m];
			else if(m == 2)
				login_id = arrayCurrent[m];
		}
		if(arrayAgtList[j] != '')
		{
			name = lastName + ','+ firstName +'['+login_id+']';
			myOption = new Option(name,login_id);
			optionPos = myForm.availableAgentInGroup.options.length;
			myForm.availableAgentInGroup.options[optionPos]=myOption;
		}
	}

	// parse the Non configured agent list
	var jsNCAgtLists = freeAgtList+ "";
	arrayNCAgtList = jsNCAgtLists.split("|");
	for (j = 0; j <arrayNCAgtList.length; j++)
	{
		var jsThisList = arrayNCAgtList[j];
		arrayCurrent  = jsThisList.split(",");
		for (m = 0; m <arrayCurrent.length; m++)
		{
			if(m == 0)
				lastName = arrayCurrent[m];
			else if(m == 1)
				firstName = arrayCurrent[m];
			else if(m == 2)
				login_id = arrayCurrent[m];
		}

		if(arrayNCAgtList[j] != '')
		{// a enlever
			name = lastName + ','+ firstName +'['+login_id+']';
			myOption = new Option(name,login_id);
			optionPos = myForm.nonConfiguredAgents.options.length;
			myForm.nonConfiguredAgents.options[optionPos]=myOption;
		}
	}

	//Affficher les serveur d'encryption...
	var allEncServers = String( appletObj.getAllEncServers() );
	// var mopIdselected = String( appletObj.getSelectedMopId(groupName) );

	//Creating an empty option
	myOption = new Option("", "");
	myForm.encServer.options[0] = myOption;

	var jsServers = allEncServers + "";
	var arrayServers = jsServers.split("|");
	var servDbid, servname;
	for (var ne = 0; ne < arrayServers.length; ne++)
	{
		var detailServer = arrayServers[ne].split(",");
		for (var m = 0; m < detailServer.length; m++)
		{
			if(m == 0)
				servDbid = detailServer[m];
			else if(m == 4) //m = 1 is the server IP
				servname = detailServer[m];
		} // end for detailServer
		myOption = new Option(servname,servDbid)
		optionPos = myForm.encServer.options.length
		myForm.encServer.options[optionPos]=myOption;
	}

	if ( recordingRight == 'false')
	{
		document.agentGroup.recordingsState.checked = false;
		document.getElementById("tabRecording").style.position = 'absolute';
		document.getElementById("tabRecording").style.left = '-1000';
		document.getElementById("tabRecording").style.top = '-1000';
	}

	if(groupName == '')
	{
		if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION"))
		{
			document.agentGroup.agtlist.disabled = true;
			document.agentGroup.nonConfiguredAgents.disabled = true;
			document.agentGroup.nonConfiguredAgents.disabled = true;
			document.agentGroup.updateInfo.value = GrpF[0];
			document.agentGroup.deleteAgtGrp.disabled = true;
			var allMops  = String( appletObj.getActiveMops() );
			var jsMops = allMops + "";
			//alert(jsMops);
			var arrayMops = jsMops.split("|");
			//alert(arrayMops.length);
			for (var j = 0; j <arrayMops.length; j++)
			{
				var detailMop = arrayMops[j].split(",");
				//alert(detailMop.length);
				for (var m = 0; m <detailMop.length; m++)
				{
					if(m == 0)
						var mopId = detailMop[m];
					else if(m == 1)
						var mopName = detailMop[m];
				} // end for detailmop
				//alert('mopi = '+ mopId + " " + mopName);
				myOption = new Option(mopName, mopId)
				optionPos = myForm.MopSelection.options.length
				myForm.MopSelection.options[optionPos]=myOption
			}// end for arraymop
		}
		tp1.setSelectedIndex(0);		//Select the first tab
	}
	else
	{
		if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION"))
		{
			var allMops  = String( appletObj.getActiveMops() );
			var mopIdselected = String( appletObj.getSelectedMopId(groupName) );
			// alert (mopIdselected);
			var jsMops = allMops + "";
			//alert(jsMops);
			var arrayMops = jsMops.split("|");
			//alert(arrayMops.length);
			for (var j = 0; j <arrayMops.length; j++)
			{
				var detailMop = arrayMops[j].split(",");

				for (var m = 0; m <detailMop.length; m++)
				{
					if(m == 0)
						var mopId = detailMop[m];
					else if(m == 1)
						var mopName = detailMop[m];
				} // end for detailmop
				myOption = new Option(mopName, mopId)
				optionPos = myForm.MopSelection.options.length
				myForm.MopSelection.options[optionPos]=myOption
				if (mopIdselected==mopId)
					myOption.selected = true;
			}// end for arraymop
			setLegends(groupName + " - ");
		}
	} // end else groupName not null

	document.agentGroup.grpName.value = groupName;
	var grpDetails  =  String( appletObj.getAgentGroupInfo(groupName) );
	// parse info received
	//alert("grpDetails = "+grpDetails);
	var jsDetails = grpDetails + "";
	arrayDetails = jsDetails.split("|");
	for (i = 0; i <arrayDetails.length; i++)
	{
		if(i == 0) {
			agentGrpDBID = arrayDetails[i];
		}

		if(i == 1)
		{
			if(arrayDetails[i] != 'NULL')
				document.agentGroup.grpDescription.value = arrayDetails[i];
		}		
		else if(i == 2)
		{
			if(arrayDetails[i] != 'NULL')
				document.agentGroup.grpQueue.value = arrayDetails[i];
		}
		else if (i == 3)
		{
			if(arrayDetails[i] == '1')
				document.agentGroup.grpState.checked = true;
			else
				document.agentGroup.grpState.checked = false;
		}
		else if(i == 5)
		{
			if(arrayDetails[i] == '1')
				document.agentGroup.recordingsState.checked = true;
			else
				document.agentGroup.recordingsState.checked = false;
		}
		else if(i == 6)	// local recording
		{
			if(arrayDetails[i] == '1')
				document.agentGroup.localRecording.checked = true;
			else
				document.agentGroup.localRecording.checked = false;
		}
		else if(i == 7)	// mp3 encoding
		{
			if(arrayDetails[i] == '1')
				document.agentGroup.mp3Encoding.checked = true;
			else
				document.agentGroup.mp3Encoding.checked = false;
		}
		else if(i == 8)	//Minimum Recording length
			document.agentGroup.minRecTime.value = arrayDetails[i];
		else if(i == 9)	//Maximum Recording length
			document.agentGroup.maxRecTime.value = arrayDetails[i] / 60;
		else if (i == 10)
		{
			if(arrayDetails[i] == '1')
			{
				document.agentGroup.encryptionEnable.checked =  true;
				myForm.encServer.disabled = false;
				myForm.encMethod.disabled = false;	
			}
			else{
				document.agentGroup.encryptionEnable.checked  = false;
			}
		}
		else if(i == 11)	//Encryption server
		{
			for(var nb=0; nb < myForm.encServer.options.length; nb++ )
			{
				if (myForm.encServer.options[nb].value == arrayDetails[i] && (appletObj.getIsEncryptionServerAllowed()) ){
					myForm.encServer.options[nb].selected = true; break;
				}
			}
		}

		else if(i == 12)	// Screen recording
		{
			//alert(appletObj.getIsScreenCaptureAllowed());
			var contenUseEncRecValue  =   document.agentGroup.contentUseEncRec.value;
			if(arrayDetails[i] == '1') {
				//dalert("use_screen_recording      " + contenUseEncRecValue);
				//alert("is screen capture allowed " + appletObj.getIsScreenCaptureAllowed());
				if(appletObj.getIsScreenCaptureAllowed()) {
					document.agentGroup.screenRecording.checked = (contenUseEncRecValue > 0) ?  true : false;
					document.agentGroup.screenRecording.enabled = (contenUseEncRecValue > 0) ? true : false;
				}else{
					document.agentGroup.screenRecording.checked =  false;
				}
				
			}else{
				document.agentGroup.screenRecording.checked   = false;
			   }
		}

		else if(i == 13)	// Screen Recording percentage
		{
			// Find the right value
			for(var nbe=0; nbe < document.agentGroup.screenRecPer.options.length; nbe++){
 				if (document.agentGroup.screenRecPer.options[nbe].value == arrayDetails[i] && (appletObj.getIsScreenCaptureAllowed())){
					document.agentGroup.screenRecPer.options[nbe].selected = true; 
					break;
				}
			}
		}

		else if (i == 14)
		{
			if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION"))
			{
				/*
				if(arrayDetails[i] == '1')
					document.agentGroup.overrideEnable.checked = true;
				else
					document.agentGroup.overrideEnable.checked = false;
				*/
			}
		}
		else if(i == 15)	//override salary
		{
			if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION"))
			{
				/*
				if (arrayDetails[i] != '0' && arrayDetails[i] != 'NULL')
					document.agentGroup.overrideSalary.value = arrayDetails[i] ;
				else
					document.agentGroup.overrideSalary.value = "" ;
				*/	
			}
		}
		else if(i == 16)	//time out wrap up(enabled == 1 or disabled == 0)
		{
			if (arrayDetails[i] == '1'){
				document.agentGroup.wrapUpTimeOut.checked = true;
				document.agentGroup.maxWrapUpTime.disabled = false;
				document.agentGroup.ActionAfterTimeOut.disabled = false;
			}
			else{
				document.agentGroup.wrapUpTimeOut.checked = false;
			}
		}
		else if(i == 17)	//second of wrap up time out
		{
			if (arrayDetails[i] != '0' && arrayDetails[i] != 'NULL')
				document.agentGroup.maxWrapUpTime.value = arrayDetails[i] ;
			else
				document.agentGroup.maxWrapUpTime.value = "" ;
		}

		else if(i == 19)	//Encryption method
		{
			//document.agentGroup.encServer.value = arrayDetails[i] ;
			for(var nbe=0; nbe < myForm.encMethod.options.length; nbe++){
 				if (myForm.encMethod.options[nbe].value == arrayDetails[i] && (document.agentGroup.contentUseEnc.value > 0)){
					myForm.encMethod.options[nbe].selected = true; break;
				}
			}
		}
		else if(i == 18)	// Productivity wrap up
		{
			if (arrayDetails[i] != '0' && arrayDetails[i] != 'NULL')
				document.agentGroup.maxWrapTimeForProductivity.value = arrayDetails[i] ;
			else
				document.agentGroup.maxWrapTimeForProductivity.value = "0" ;	
			//alert(arrayDetails[i]);
			//document.agentGroup.maxWrapTimeForProductivity.value = arrayDetails[i];
		}

		else if(i == 20)	//ActionAfterTimeOut
		{
			document.agentGroup.ActionAfterTimeOut.value = arrayDetails[i];
		}

		else if(i == 21)	//Mp3 encoding quality
		{
			selectMp3Quality(arrayDetails[i]);
		}
		else if(i == 22)	//
		{
			//alert("in displayAgentGroupInfo i =21");
			if(arrayDetails[i] == '1')
			{
				document.agentGroup.grpEnableDialing.checked = true;
				//alert("in displayAgentGroupInfo grpEnableDialing=true");
			}
			else
				document.agentGroup.grpEnableDialing.checked = false;
			//alert("in displayAgentGroupInfo i =21");
		}
		else if(i == 23)	// Ready Button state
		{
			if(arrayDetails[i] == '1')
			{
				document.agentGroup.grpReadyButtonState.checked = true;
				//alert("in displayAgentGroupInfo grpReadyButtonState=true");
			}
			else
				document.agentGroup.grpReadyButtonState.checked = false;
		}
		else if(i == 24)	// Video compression
		{
			for(var nbe=0; nbe < document.agentGroup.screenRecCompression.options.length; nbe++){
				if (document.agentGroup.screenRecCompression.options[nbe].value == arrayDetails[i] && (appletObj.getIsScreenCaptureAllowed()))
				{
					document.agentGroup.screenRecCompression.options[nbe].selected = true;
					break;
				}
			}
		}
	}
	validateRecordings();
	updateScreenCaptureBox();
	updateEncServerBox();
	//Softphone settings;
	if(groupName!="")
	{
		if(addPref=='0')
		{
			document.agentGroup.callPrefix.value="";
		}
		else if(addPref=='1')
		{
			document.agentGroup.callPrefix.value=Prefix;
		}
		if(agmaxlines!=-1)
		{
			document.agentGroup.nbMaxLines.selectedIndex= agmaxlines-1;
		}
		else
		{
			document.agentGroup.nbMaxLines.selectedIndex=10;
		}
		if(btTransfState=='1')
		{
			document.agentGroup.enTransf.checked=true;

		}
		else
		{
			document.agentGroup.enTransf.checked=false;
		}
		if(btConfState=='1')
		{
			document.agentGroup.enConf.checked=true;
		}
		else
		{
			document.agentGroup.enConf.checked=false;
		}
		document.agentGroup.default_campaign_name.value=recdefcmp;
		document.agentGroup.default_client_name_inbound.value=recdefcl;	
	}
}

function validateCallPrefix(){
	if (10 < document.agentGroup.callPrefix.value.length){
		alert(GrpF[1]);
		return -1;
	}
	if (IsInteger(document.agentGroup.callPrefix.value)) return 0;
	var c;
	var i = 0;
	for (var i = 0; i < document.agentGroup.callPrefix.value.length; i ++){
		c = document.agentGroup.callPrefix.value.charAt(i);
		if ( c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9' || c == '#' || c == '*') continue;
		alert(GrpF[2]);
		return -1;
	}
return 0;
}

function isAlphaNumeric(val){
	if (val.match(/^[a-zA-Z0-9\-\_]+$/)){
		return true;
	}else{
		return false;
	} 
}


/**
called by the update button
*/
function validateInfo()
{
	var count = document.agentGroup.elements.length
	var tempName   ='';
	var state = '';
	var wrapUpTimeOut = '';
	var actionAfterTimeOut = '';
	var EnableDialing ='';
	var beReadyButtonState ='';
	var ahenDial='';
	var ahenTransf='';
	var ahenConf='';
	var add_prefix_call='';
	var call_pref=document.agentGroup.callPrefix.value;
	var def_camp_name=document.agentGroup.default_campaign_name.value;
	var def_cl_inb=document.agentGroup.default_client_name_inbound.value;
	var def_cl_out=document.agentGroup.default_client_name_outbound.value;
	var video_compression = document.agentGroup.screenRecCompression.value;
	var use_screen_recording;
	var screen_rec_per = document.agentGroup.screenRecPer.value;
	var video_colors = "24"; //document.agentGroup.screenRecColors.value;
	
	// Verify that the group name, group queue are set
	if (document.agentGroup.grpName.value =='')	
		alert(GrpF[3]);
	else if(!isAlphaNumeric(document.agentGroup.grpName.value))
		alert(GrpF[4] + ': ' + GrpF[5]);
	else if (document.agentGroup.grpQueue.value =='')
		alert(GrpF[6]);
	else if(!isAlphaNumeric(document.agentGroup.grpQueue.value))
		alert(GrpF[4] + ': ' + GrpF[7]);	
	else if(validation(document.agentGroup.grpDescription.value)==0)
		alert(GrpF[8]);

	//validation of the maximum wrap up time
	else if(document.agentGroup.wrapUpTimeOut.checked == true &&
			IsInteger(document.agentGroup.maxWrapUpTime.value) == false)
		alert(GrpF[9]);
	else if(document.agentGroup.wrapUpTimeOut.checked == true &&
			document.agentGroup.maxWrapUpTime.value.length > 5)
		alert(GrpF[10]);
	else if(document.agentGroup.wrapUpTimeOut.checked == true &&
			document.agentGroup.maxWrapUpTime.value.length == 0 )
		alert(GrpF[11]);
	else if(document.agentGroup.wrapUpTimeOut.checked == true &&
			document.agentGroup.maxWrapUpTime.value == '0' )
		alert(GrpF[11]);
	else if(IsInteger(document.agentGroup.maxWrapTimeForProductivity.value) == false)
		alert(GrpF[12]);
	//else if(IsInteger(document.agentGroup.callPrefix.value)==false && document.agentGroup.callPrefix.value!="")
	else if(validateCallPrefix()==-1 && document.agentGroup.callPrefix.value!="")
	{
		//alert("The call prefix must be empty or numeric");	(validateCallPrefix fait le message d'erreur)
	}
	else if(def_camp_name.lastIndexOf("/")!=-1 || def_cl_inb.lastIndexOf("/")!=-1 || def_camp_name.lastIndexOf("/")!=-1 )
	{
		alert("One of the recordings prefix names contains the forbidden character: '/'");	
	}
	else
	{
		// check that the assigned queue is not already assigned to another group
		var queue = document.agentGroup.grpQueue.value;
		var result = String( appletObj.validateQueueValue(queue,groupName) );
		if(result =="bad")
			alert(GrpF[13]);
		else
		{
			// save agentGroup details
			if(document.agentGroup.grpState.checked)
				state = 1;
			else
				state = 0;

			if(document.agentGroup.grpEnableDialing.checked )
				EnableDialing =1;
			else 
				EnableDialing =0;			
			if(document.agentGroup.grpReadyButtonState.checked )
				beReadyButtonState =1;
			else 
				beReadyButtonState =0;				

			if(document.agentGroup.grpEnableDialing.checked)
			 	ahenDial=1;
			else
				ahenDial=0;
			if(document.agentGroup.enTransf.checked)
			 	ahenTransf=1;
			else
				ahenTransf=0;
			if(document.agentGroup.enConf.checked)
			 	ahenConf=1;
			else
				ahenConf=0;	
			 if(call_pref=='')
			 {
				add_prefix_call='0';				 
			 }
			 else
			 	add_prefix_call='1';	
				
			if(document.agentGroup.screenRecording.checked)
			 	use_screen_recording=1;
			else
				use_screen_recording=0;	
			
			var agentMop = 0;
			if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION"))
			{
				if (document.agentGroup.MopSelection.length != 0)
					agentMop = document.agentGroup.MopSelection.value;
			}
 			if(document.agentGroup.recordingsState.checked)
				recordingsState = 1;
			else
				recordingsState = 0;

			if(document.agentGroup.localRecording.checked)
				localRecording = 1;
			else
				localRecording = 0;

			if(document.agentGroup.mp3Encoding.checked)
				mp3Encoding = 1;
			else
				mp3Encoding = 0;

			var useEncryption = 0;
			if(document.agentGroup.encryption.checked)
				useEncryption = 1;
			else
			 	useEncryption = 0;

			var encServer = '';
			if(document.agentGroup.encryption.checked)
			{
				encServer = document.agentGroup.encServer.value;
				if(encServer == ''){
					
					alert(GrpF[14]);
					return false;
				}
				else if(document.agentGroup.encMethod.value ==''){
				
					alert(GrpF[15]);
					return false;
				}
			}

			var alReadyExist = false;

			if(document.agentGroup.wrapUpTimeOut.checked == true)
			{
				wrapUpTimeOut = "1";
				actionAfterTimeOut = document.agentGroup.ActionAfterTimeOut.value;
			}
			else
			{
				wrapUpTimeOut = "0";
				document.agentGroup.maxWrapUpTime.value = "";
			}

			var agentGroups = String( appletObj.getAgentGroups() );
			jsAgentGroups = agentGroups.split("|");
			for(q = 0; q < jsAgentGroups.length; q++)
			{
				thisGroup = jsAgentGroups[q];
				thisGroupArray = thisGroup.split(",");
				if( document.agentGroup.grpName.value == thisGroupArray[1] && groupName != document.agentGroup.grpName.value) //le groupe existe deja
				{
					alReadyExist = true;
					break;
				}
			}
			if(alReadyExist)
			
				alert(GrpF[16]);
			else
			{
				if(document.agentGroup.minRecTime.value > document.agentGroup.maxRecTime.value * 60)
					
					alert(GrpF[17]);
				else
				{
					if(validateNotReadyReasons() == false)
						return;
						
						
						
					if(agentGroupDbid.length > 0)
					{
						saveNotReadyReasons(agentGroupDbid);
					}

					appletObj.saveAgentGroup(agentGroupDbid,
									tenant_dbid,
									document.agentGroup.grpName.value,
									document.agentGroup.grpDescription.value,
									document.agentGroup.grpQueue.value,//5
									state,	
									agentMop, 
									recordingsState,
									localRecording,
									mp3Encoding,//10
									document.agentGroup.minRecTime.value,
									document.agentGroup.maxRecTime.value * 60 ,
									useEncryption,
									encServer,
									use_screen_recording,//15
									screen_rec_per,
									"",
									"",
									wrapUpTimeOut,
									document.agentGroup.maxWrapUpTime.value,//20
									document.agentGroup.maxWrapTimeForProductivity.value,
									document.agentGroup.encMethod.value,
									actionAfterTimeOut,
									getMp3Quality(),
									EnableDialing,//25
									beReadyButtonState,
									getXmlAllowedUsers(),
									ahenTransf,
									ahenConf,
									add_prefix_call,//30
									call_pref,
									document.agentGroup.nbMaxLines.value,
									def_cl_inb,
									def_camp_name,
									video_compression,//35
									video_colors
									);
									
					document.agentGroup.updateInfo.disabled = true;	// reset the button to disabled
				}
				document.location.href = "../defaultpage.htm";
			}
		}
	}
	
}

function askDelete()
{
	campaignRunning = String( appletObj.getCampaingRunningByGroup(agentGroupDbid) );
	if (campaignRunning == "false")
	{
		answer = confirm(GrpF[18]);
		if(answer)
		{
			appletObj.deleteAgentGroup(agentGroupDbid);
			// refresh the current page
			document.location = "../defaultpage.htm";
		}
	}
	else
	{
		alert(GrpF[19]);
	}
}

function validateRecordings()
{
	if(!document.agentGroup.recordingsState.checked && 
		!document.agentGroup.screenRecording.checked)
	{
		// Always enter here when one the box enable recrding or enable screen cpature recording is cheked
		document.agentGroup.localRecording.checked = false;
		document.agentGroup.localRecording.disabled = true;
		document.agentGroup.mp3Encoding.checked = false;
		document.agentGroup.mp3Encoding.disabled = true;
		document.agentGroup.minRecTime.disabled = true;
		document.agentGroup.maxRecTime.disabled = true;
		document.agentGroup.encryptionEnable.checked =  false;
		document.agentGroup.encryptionEnable.disabled = true; 
		document.agentGroup.encServer.disabled = true;
		document.agentGroup.encMethod.disabled = true;
		document.agentGroup.default_campaign_name.disabled = true;
		document.agentGroup.default_client_name_inbound.disabled = true;

	}
	else
	{
		// Enter here when one the box enable recrding or enable screen cpature recording is uncheked

		var currentEncryptionValue  =   document.agentGroup.contentUseEnc.value;
 
		document.agentGroup.localRecording.disabled = false;
		document.agentGroup.mp3Encoding.disabled = false;
		document.agentGroup.minRecTime.disabled = false;
		document.agentGroup.maxRecTime.disabled = false;
		 
		if(appletObj.getIsEncryptionServerAllowed() ){
		  	document.agentGroup.encryptionEnable.checked  = (currentEncryptionValue > 0)? true : false;
			document.agentGroup.encryptionEnable.disabled  =  false;

		}else{
			document.agentGroup.encryptionEnable.checked  = false;
                        document.agentGroup.encryptionEnable.disabled = true;
		}
		document.agentGroup.default_client_name_inbound.disabled = false;
		document.agentGroup.default_campaign_name.disabled = false;
	}
	enableMp3Quality();
}

function addMyGlobalRow()
{
	lyr=document.createElement("DIV");
 	lyr.id ='t'+nrows;
	var nom = 'n'+ nrows;
	var delnom = 'del'+ nrows;
	var nRR_Name, code='';

	var availableNRRList = String(appletObj.getAvailableGlobalNRRList(tenant_dbid) )+"";
	//alert("availableGlobalNRRList="+availableNRRList);
    arrayAvailableNRRList = availableNRRList.split('|');
	if (availableNRRList != "")
	{
		code ="<table width='250'><TR><TD  width='160' align='left' ><select style='WIDTH: 150px' id= '"+nom+"' name= '"+nom+"' onChange='enableUpdateButton()'>";
		for (j = 0; j < arrayAvailableNRRList.length; j++){
			 nRR_Name = arrayAvailableNRRList[j];
			 code +=" <option value='"+ nRR_Name +"'>"+nRR_Name+"</option>";
		}
		code +="</select>  </TD><td align='right' id= '"+delnom+"' name= '"+delnom+"'> &nbsp; &nbsp;<a href='javascript:deleteMyRow("+nrows+");'><font color='#000000'> "+GrpF[20]+"</font></a></td></TR>";
	}
	//alert(code)
   	lyr.innerHTML = code;
  	document.getElementById("NRR_items").appendChild(lyr);
	nrows++;
	maxrow++;
}

function addMyNotGlobalRow()
{
	lyr=document.createElement("DIV");
 	lyr.id ='t'+nrows;
	var nom = 'n'+ nrows;
	var delnom = 'del'+ nrows;
	var nRR_Name, code='';
    
	var availableNRRList = String(appletObj.getAvailableNotGlobalNRRList(tenant_dbid) )+"";
	//alert("availableNotGlobalNRRList="+availableNRRList+".");
	arrayAvailableNRRList = availableNRRList.split('|');
	if (availableNRRList != "")
	{
		code ="<table width='250'><TR><TD  width='160' align='left' ><select style='WIDTH: 150px' id= '"+nom+"' name= '"+nom+"' onChange='enableUpdateButton()'>";
		for (j = 0; j < arrayAvailableNRRList.length; j++){
			 nRR_Name = arrayAvailableNRRList[j];
			 code +=" <option value='"+ nRR_Name +"'>"+nRR_Name+"</option>";
		}
  		code +="</select>  </TD><td align='right' id= '"+delnom+"' name= '"+delnom+"'> &nbsp; &nbsp;<a href='javascript:deleteMyRow("+nrows+");'><font color='#000000'> "+GrpF[20]+"</font></a></td></TR>";
	}
	else
	{
		alert(GrpF[21]);
	}
   	//alert(code)
   	lyr.innerHTML = code;
  	document.getElementById("NRR_items").appendChild(lyr);
	nrows++;
	maxrow++;
}

function deleteMyRow( f)
{
  var sss = 'n'+f;
  var xxx = 't'+f;
  document.getElementById("NRR_items").removeChild(document.getElementById(xxx));

  nrows--;
  enableUpdateButton();
}

function saveNotReadyReasons (groupDBID)
{
	reasons ='';
	//alert(maxrow);
	for (var i=1; i<maxrow ; i++)
	{
		eltid = 'n'+i;
		if ( document.getElementById(eltid) !=null && document.getElementById(eltid).disabled == false)
			reasons = document.getElementById(eltid).value  +'|'+ reasons ;
	}
	//alert(reasons+"-"+groupDBID);
	appletObj.addReasonToGroup(reasons,groupDBID);
}

function validateNotReadyReasons()
{
	for (var i=1; i<maxrow-1 ; i++)
	{
		eltid = 'n'+i;
		if ( document.getElementById(eltid) != null)
		{
			var name = document.getElementById(eltid).value;
			for(var m=i+1; m <maxrow; m++)
			{
				if(document.getElementById('n'+m) != null)
				{
					if(name ==  document.getElementById('n'+m).value)
					{
						alert(GrpF[22]);
						return false;
					}
				}
			}
 		}
	}
	return true;
}

function setLegends(text_to_append)
{
	for(i = 0; i < document.getElementsByTagName('legend').length; i++)
	{
		var curObj = document.getElementsByTagName('legend')[i];
		curObj.innerHTML = text_to_append + curObj.innerHTML;
	}
}

function changeSecondWrapUpStatus()
{
	if(document.agentGroup.wrapUpTimeOut.checked == true)
	{
		document.agentGroup.maxWrapUpTime.disabled = false;
		document.agentGroup.ActionAfterTimeOut.disabled = false;
	}
	else
	{
		document.agentGroup.maxWrapUpTime.disabled = true;
		document.agentGroup.ActionAfterTimeOut.disabled = true;
	}
}

function getXmlAllowedUsers()
{
	var theForm = document.agentGroup;
	var allowed = "";
	if(theForm.allowedUsers)
	{
		allowed = "<AllowedUsers>";
		for(var i = 0; i < theForm.allowedUsers.length; i++)
			allowed += "<Dbid>" + theForm.allowedUsers.options[i].value + "</Dbid>";
		allowed += "</AllowedUsers>";
	}
	else if(isNewResource)
		allowed += "<AllowedUsers><Dbid>" + currentUserDbid + "</Dbid></AllowedUsers>";
	return allowed;
}

function enableDial()
{
	//alert("here");
	if(document.agentGroup.grpEnableDialing.checked==true)
	{
		document.agentGroup.enTransf.disabled=false;
		document.agentGroup.enConf.disabled=false;	
	}
	else
	{
		if(document.agentGroup.enTransf.checked || document.agentGroup.enConf.checked)
			alert("Dialing cannot be disabled when Transfert and/or Conference is enabled");
		document.agentGroup.enTransf.checked=false;
		document.agentGroup.enConf.checked=false;
		document.agentGroup.enTransf.disabled=true;
		document.agentGroup.enConf.disabled=true;			
	}	
}
// Associate a default button with pressing the Enter key

function KeyDownHandler(btn)
{
	// process only the Enter key
	if (event.keyCode == 13)
	{
		// cancel the default submit
		event.returnValue=false;
		event.cancel = true;
		// submit the form by programmatically clicking the specified button
		btn.click();
	}
}
