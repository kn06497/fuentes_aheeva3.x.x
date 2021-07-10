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
		document.agentGroup.encServer.disabled = true;
		document.agentGroup.encMethod.disabled = true;
	}
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
}

function chkAndAddAgentToGroup()
{
	var myForm = document.agentGroup;
	var name = '';
	var tmpAgents ='';
	var login = '';
	var i;	
	
	var option_len = myForm.nonConfiguredAgents.options.length;

	for ( i=0;i<=option_len-1;i++)
	{
		if(myForm.nonConfiguredAgents.options[i].selected == true )
		{
			login = myForm.nonConfiguredAgents.options[i].value;			
			tmpAgents += login+"|";
		}
	}
	
	if(tmpAgents != '')
	{
		appletObj.addAgentToGroup(tmpAgents,groupName);
		enableUpdateButton();
	}

	var i;
	var o;
	// Move them over
	for ( i=0; i<myForm.nonConfiguredAgents.options.length; i++)
	{
		o = myForm.nonConfiguredAgents.options[i];
		if (o.selected)
			myForm.availableAgentInGroup.options[myForm.availableAgentInGroup.options.length] = new Option( o.text, o.value, false, false);
	}
	// Delete them from original
	for (  i=(myForm.nonConfiguredAgents.options.length-1); i>=0; i--)
	{
		o = myForm.nonConfiguredAgents.options[i];
		if (o.selected)
			myForm.nonConfiguredAgents.options[i] = null;
	}

	sortSelect(myForm.nonConfiguredAgents);
	sortSelect(myForm.availableAgentInGroup);

	myForm.nonConfiguredAgents.selectedIndex = -1;
	myForm.availableAgentInGroup.selectedIndex = -1;
}

function chkAndDropAgentFromGroup()
{
	var myForm = document.agentGroup;
	var name = '';
	var tmpAgents='';
	var login = '';
	var i;
	var o;
	var option_len = myForm.availableAgentInGroup.options.length;
	for (var i=0;i<option_len;i++)
	{
		if(myForm.availableAgentInGroup.options[i].selected == true )
		{
			login = myForm.availableAgentInGroup.options[i].value;			
			tmpAgents += login+"|";
		}
	}

	if(tmpAgents != '')
		appletObj.dropAgentFromGroup(tmpAgents);
	enableUpdateButton();

	// Move them over
	for (i=0; i<myForm.availableAgentInGroup.options.length; i++)
	{
		o = myForm.availableAgentInGroup.options[i];
		if (o.selected)
			myForm.nonConfiguredAgents.options[myForm.nonConfiguredAgents.options.length] = new Option( o.text, o.value, false, false);
	}
	// Delete them from original
	for ( i=(myForm.availableAgentInGroup.options.length-1); i>=0; i--)
	{
		o = myForm.availableAgentInGroup.options[i];
		if (o.selected)
			myForm.availableAgentInGroup.options[i] = null;
	}
	sortSelect(myForm.nonConfiguredAgents);
	sortSelect(myForm.availableAgentInGroup);

	myForm.availableAgentInGroup.selectedIndex = -1;
	myForm.nonConfiguredAgents.selectedIndex = -1;
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
	var availableGlobalNRRNames = String(appletObj.getAvailableGlobalNRRNames());
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
			document.agentGroup.updateInfo.value = "Save";
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
		document.getElementById("tabStatistics").style.position = 'absolute';
		document.getElementById("tabStatistics").style.left = '-1000';
		document.getElementById("tabStatistics").style.top = '-1000';
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
		if(i == 0)
			agentGrpDBID = arrayDetails[i];
			
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
		else if( i == 10) //group schedule id
		{}
		else if (i == 11)
		{
			if(arrayDetails[i] == '1')
			{
				document.agentGroup.encryptionEnable.checked = true;
				myForm.encServer.disabled = false;
				myForm.encMethod.disabled = false;				
			}
			else
				document.agentGroup.encryptionEnable.checked = false;
		}
		else if(i == 12)	//Encryption server
		{
			for(var nb=0; nb < myForm.encServer.options.length; nb++ )
			{
				if (myForm.encServer.options[nb].value == arrayDetails[i]){
					myForm.encServer.options[nb].selected = true; break;
				}
			}
		}
		else if (i == 13)
		{
			if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION"))
			{
				if(arrayDetails[i] == '1')
					document.agentGroup.overrideEnable.checked = true;
				else
					document.agentGroup.overrideEnable.checked = false;
			}
		}
		else if(i == 14)	//override salary
		{
			if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION"))
			{
				if (arrayDetails[i] != '0' && arrayDetails[i] != 'NULL')
					document.agentGroup.overrideSalary.value = arrayDetails[i] ;
				else
					document.agentGroup.overrideSalary.value = "" ;	
			}
		}
		else if(i == 15)	//time out wrap up(enabled == 1 or disabled == 0)
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
		else if(i == 16)	//second of wrap up time out
		{
			if (arrayDetails[i] != '0' && arrayDetails[i] != 'NULL')
				document.agentGroup.maxWrapUpTime.value = arrayDetails[i] ;
			else
				document.agentGroup.maxWrapUpTime.value = "" ;
		}
		else if(i == 17)	//ActionAfterTimeOut
		{
			if (arrayDetails[i] != '0' && arrayDetails[i] != 'NULL')
				document.agentGroup.maxWrapTimeForProductivity.value = arrayDetails[i] ;
			else
				document.agentGroup.maxWrapTimeForProductivity.value = "0" ;	
			//alert(arrayDetails[i]);
			//document.agentGroup.maxWrapTimeForProductivity.value = arrayDetails[i];
		}
		
		else if(i == 18)	//Encryption server
		{
			//document.agentGroup.encServer.value = arrayDetails[i] ;
			for(var nbe=0; nbe < myForm.encMethod.options.length; nbe++){
 				if (myForm.encMethod.options[nbe].value == arrayDetails[i]){
					myForm.encMethod.options[nbe].selected = true; break;
				}
			}
		}
		else if(i == 19)	//ActionAfterTimeOut
		{
			document.agentGroup.ActionAfterTimeOut.value = arrayDetails[i];
		}
		else if(i == 20)	//Mp3 encoding quality
		{
			selectMp3Quality(arrayDetails[i]);
		}
		else if(i == 21)	//Mp3 encoding quality
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
		
		else if(i == 22)	//Mp3 encoding quality
		{
			if(arrayDetails[i] == '1')
			{
				document.agentGroup.grpReadyButtonState.checked = true;
				//alert("in displayAgentGroupInfo grpReadyButtonState=true");
			}
			else
				document.agentGroup.grpReadyButtonState.checked = false;
		}
		
	}

	validateRecordings();
	updateEncServerBox();
}

function validateInfo()
{
	var count = document.agentGroup.elements.length
	var tempName   ='';
	var state = '';
	var wrapUpTimeOut = '';
	var actionAfterTimeOut = '';
	var EnableDialing ='';
	var beReadyButtonState ='';
	
	// Verify that the group name, group queue are set
	if (document.agentGroup.grpName.value =='')
	
		alert(MultiArray["You must enter a GROUP NAME"][lang]);
	else if (document.agentGroup.grpQueue.value =='')
		alert(MultiArray["You must enter a GROUP QUEUE"][lang]);
	else if(validation(document.agentGroup.grpName.value)==0)
		alert(MultiArray["Invalid use of character"][lang]);
	else if(validation(document.agentGroup.grpQueue.value)==0)
		alert(MultiArray["Invalid use of character"][lang]);
	else if(validation(document.agentGroup.grpDescription.value)==0)
		alert(MultiArray["Your description should be filled. Use valid characters."][lang]);

	//validation of the maximum wrap up time
	else if(document.agentGroup.wrapUpTimeOut.checked == true &&
			IsInteger(document.agentGroup.maxWrapUpTime.value) == false)
		alert(MultiArray["The maximum wrap up time must be in seconds"][lang]);
	else if(document.agentGroup.wrapUpTimeOut.checked == true &&
			document.agentGroup.maxWrapUpTime.value.length > 5)
		alert(MultiArray["The maximum wrap up time must be less than 99999 seconds"][lang]);
	else if(document.agentGroup.wrapUpTimeOut.checked == true &&
			document.agentGroup.maxWrapUpTime.value.length == 0 )
		alert(MultiArray["The maximum wrap up time must be at least 1 second"][lang]);
	else if(document.agentGroup.wrapUpTimeOut.checked == true &&
			document.agentGroup.maxWrapUpTime.value == '0' )
		alert(MultiArray["The maximum wrap up time must be at least 1 second"][lang]);
	else if(IsInteger(document.agentGroup.maxWrapTimeForProductivity.value) == false)
		alert(MultiArray["The maximum wrap up time that does not affect productivity must be in seconds"][lang]);
		
	else
	{
		
		// check that the assigned queue is not already assigned to another group
		var queue = document.agentGroup.grpQueue.value;
		var result = String( appletObj.validateQueueValue(queue,groupName) );
		if(result =="bad")
			alert(MultiArray["This QUEUE is already assigned. You must enter a NEW QUEUE"][lang]);
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
					
					alert(MultiArray["You must enter the encryption server IP or uncheck the encryption box"][lang]);
					return false;
				}
				else if(document.agentGroup.encMethod.value ==''){
				
					alert(MultiArray["You must enter the encryption method or uncheck the encryption box"][lang]);
					return false;
				}
			}

			var useOverrideSalary = 0;
			var overrideSalary = '';
			
			if(userHasRight("ALLOW_FINANCIAL_CONFIGURATION"))
			{
				if(document.agentGroup.overrideEnable.checked)
					useOverrideSalary = 1;
				else
					useOverrideSalary = 0;
				
				if(document.agentGroup.overrideEnable.checked)
				{
					overrideSalary = document.agentGroup.overrideSalary.value;
					if(overrideSalary == '')
					{
					
						alert(MultiArray["You must enter the amount of override salary of that group"][lang]);
						return false;
					}
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
			
				alert(MultiArray["Agent group already exists"][lang]);
			else
			{
				if(document.agentGroup.minRecTime.value > document.agentGroup.maxRecTime.value * 60)
					
					alert(MultiArray["Minimum recording time must be smaller than maximum recording time"][lang]);
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
									document.agentGroup.grpQueue.value,
									state,	
									agentMop, 
									recordingsState,
									localRecording,
									mp3Encoding,
									document.agentGroup.minRecTime.value,
									document.agentGroup.maxRecTime.value * 60 ,
									"",
									useEncryption,
									encServer,
									useOverrideSalary,
									overrideSalary,
									wrapUpTimeOut,
									document.agentGroup.maxWrapUpTime.value,
									document.agentGroup.maxWrapTimeForProductivity.value,
									document.agentGroup.encMethod.value,
									actionAfterTimeOut,
									getMp3Quality(),
									EnableDialing,
									beReadyButtonState,
									getXmlAllowedUsers());
									
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
		answer = confirm(MultiArray["Are you sure you wish to delete this group"][lang]);
		if(answer)
		{
			appletObj.deleteAgentGroup(agentGroupDbid);
			// refresh the current page
			document.location = "../defaultpage.htm";
		}
	}
	else
	{
		alert(MultiArray["A running campaign uses this group! You can't delete it"][lang]);
	}
}

function validateRecordings()
{
	if(!document.agentGroup.recordingsState.checked)
	{
		document.agentGroup.localRecording.checked = false;
		document.agentGroup.localRecording.disabled = true;
		document.agentGroup.mp3Encoding.checked = false;
		document.agentGroup.mp3Encoding.disabled = true;
		document.agentGroup.minRecTime.disabled = true;
		document.agentGroup.maxRecTime.disabled = true;
		document.agentGroup.encryptionEnable.disabled = true;
		document.agentGroup.encryptionEnable.checked = false; 
		document.agentGroup.encServer.disabled = true;
		document.agentGroup.encMethod.disabled = true;
	}
	else
	{
		document.agentGroup.localRecording.disabled = false;
		document.agentGroup.mp3Encoding.disabled = false;
		document.agentGroup.minRecTime.disabled = false;
		document.agentGroup.maxRecTime.disabled = false;
		document.agentGroup.encryptionEnable.disabled = false;
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
		code +="</select>  </TD><td align='right' id= '"+delnom+"' name= '"+delnom+"'> &nbsp; &nbsp;<a href='javascript:deleteMyRow("+nrows+");'><font color='#000000'> "+MultiArray["Delete"][lang]+"</font></a></td></TR>";
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
  		code +="</select>  </TD><td align='right' id= '"+delnom+"' name= '"+delnom+"'> &nbsp; &nbsp;<a href='javascript:deleteMyRow("+nrows+");'><font color='#000000'> "+MultiArray["Delete"][lang]+"</font></a></td></TR>";
	}
	else
	{
		alert("There is no active non-global not-ready-reason in the system!!!");
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
					
						alert(MultiArray["You cannot select a reason several times"][lang]);
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