

function enableUpdateButton()
{
	document.campaign.updateInfo.disabled = false;
}

function chkAndAddGroup()
{
    var myForm = document.theForm;
	var tmpTreament='';
 	var i;
	var o;
	var cont = true;
	var option_len = myForm.availableBlackListGroups.options.length;
	
	if(myForm.selectedTreatments.options.length == 0)
	{
		for (i=0;i<=option_len-1 && cont == true;i++)
		{
			if(myForm.availableBlackListGroups.options[i].selected == true ) 
			{
				tmpGroup = myForm.availableBlackListGroups.options[i].value; +"|";
				cont = false;
			}
		}
		if(tmpGroup !='')
		{
			//appletObj.addTreatToMop(tmpTreatment,mop_name);  
			enabledUpdateButton();
		}
		// Move them over
		cont = true;
		for (i=0; i<myForm.availableBlackListGroups.options.length && cont == true; i++) 
		{
			o = myForm.availableBlackListGroups.options[i];
			if (o.selected)
			{
				myForm.selectedBlackListGroups.options[myForm.selectedBlackListGroups.options.length] = new Option( o.text, o.value, false, false);
				cont = false;
			}
		}
		// Delete them from original
		for ( i=(myForm.availableBlackListGroups.options.length-1); i>=0; i--) 
		{
			o = myForm.availableBlackListGroups.options[i];
			if (o.selected)
			{
				myForm.availableBlackListGroups.options[i] = null;
			}
		}
		myForm.availableBlackListGroups.selectedIndex = -1;
		myForm.selectedBlackListGroups.selectedIndex = -1;
	}
	else
	{
		alert("You can select only one treatment for this mop !! Please drop the selected treatment and select another one.");
		document.theForm.addButton.disabled = true;
		enabledDropButton();
	}
}

function chkAndDropGroup()
{
	var myForm = document.theForm;        
	var tmpTreament='';
	var i;
	var o;
	var option_len = myForm.selectedBlackListGroups.options.length;
	for (i=0;i<option_len;i++)
	{
		if(myForm.selectedBlackListGroups.options[i].selected == true )  
		{
			tmpGroup = myForm.selectedBlackListGroups.options[i].value +"|";
		}                
	}     

	if(tmpGroup != '')
		//appletObj.dropTreatFromMop(tmpTreatment,mop_name);
	enabledUpdateButton();

   // Move them over
	for (i=0; i<myForm.selectedBlackListGroups.options.length; i++) {
			o = myForm.selectedBlackListGroups.options[i];
	if (o.selected) {
		myForm.availableBlackListGroups.options[myForm.availableBlackListGroups.options.length] = new Option( o.text, o.value, false, false);
		}
	}
	// Delete them from original
	for ( i=(myForm.selectedBlackListGroups.options.length-1); i>=0; i--) {
		o = myForm.selectedBlackListGroups.options[i];
		if (o.selected) {
			myForm.selectedBlackListGroups.options[i] = null;
			}
		}
       
	myForm.selectedBlackListGroups.selectedIndex = -1;
	myForm.availableBlackListGroups.selectedIndex = -1;
	document.theForm.dropButton.disabled = true;
}

function displayMopInfo()
{
	var name;
	var value;
	var treatmentList;
	var treatment_dbid;
	var treatment_Name;
	var freeTreatmentList;
	var myForm = document.theForm;
	var i=myForm.selectedBlackListGroups.options.length;
	var j=myForm.availableBlackListGroups.options.length;
 
	tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	//mop_name= normalizeString(QueryString('mopName'));
	//ourCaption   = document.getElementById("caption");

    // Remove all treatment from selectedTreatments option field
	if (i>0)
	{
		for (i-1; i>=0; i--)
		   myForm.selectedBlackListGroups.options[i] = null;
	}

	// Remove all treatments from availableTreatments option field
	if (j>0)
	{
		for (j-1; j>=0; j--)
			myForm.availableBlackListGroups.options[j] = null;
	}
	myForm.selectedBlackListGroups.options.length=0;
	freeBlackList = appletObj.getAvailableBlackList(); 
	blackList  = appletObj.getSelectedBlackList(); 
 	var jsBlackLists = blackList+ "" ;
	arrayBlackList = jsBlackLists.split("|");

   	for (i = 0; i <arrayBlackList.length; i++)
	{
   		var jsThisList = arrayBlackList[i];
   		arrayCurrent   = jsThisList.split(",");
   		for (m = 0; m <arrayCurrent.length; m++)
		{
   			if(m == 0)
			{ // get list name
   		   		treatment_dbid = arrayCurrent[m];
   		   	}
			else if(m == 1)
			{ //get firstname
   		   		treatment_Name = arrayCurrent[m];
   		   	}
   		}
		if(arrayBlackList[i] != '' )  
		{
			value = treatment_Name + ','+ treatment_dbid ;
			name = treatment_Name;
			myOption = new Option(name,value);
			optionPos = myForm.selectedBlackListGroups.options.length
			myForm.selectedBlackListGroups.options[optionPos]=myOption
		}
	}
	
	// parse the available mop list
	var jsAvailableBlackLists = freeBlackList+ "";
	arrayAvailableBlackList = jsAvailableBlackLists.split("|");
    
   	for (j = 0; j <arrayAVList.length; j++)
	{
		var jsThisList = arrayAVList[j];
        arrayCurrent = jsThisList.split(",");			

   		for (m = 0; m <arrayCurrent.length; m++)
		{
   			if(m == 0)
			{ // get list name
   		   		treatment_dbid = arrayCurrent[m];
   		   	}
			else if(m == 1)
			{ //get firstname
   		   		treatment_Name = arrayCurrent[m];
   		   	}
   		}// fin for 
		
        if(arrayAVList[j] != '' )	// a enlever
		{
			name = treatment_Name;
			value = treatment_Name + ','+ treatment_dbid;
			myOption = new Option(name,value);
			optionPos = myForm.availableTreatments.options.length
			myForm.availableTreatments.options[optionPos]=myOption
        }// fin if
	}// fin for (j = 0; j <arrayAVList.length; j++)
		

	if(mop_name == '' || mop_name == 'null' || mop_name == 'NULL' || mop_name == null)
	{
		document.mop_form.mopName.value = "";
		document.mop_form.updateInfo.value = "Save";
		document.mop_form.deleteMop.disabled = true;

		document.getElementById("tabTreats").style.position = 'absolute';
		document.getElementById("tabTreats").style.left = '-1000';
		document.getElementById("tabTreats").style.top = '-1000';

		document.getElementById("tabHolidays").style.position = 'absolute';
		document.getElementById("tabHolidays").style.left = '-1000';
		document.getElementById("tabHolidays").style.top = '-1000';
	}
	else
	{

	}

	if(mop_name == '' || mop_name == 'null' || mop_name == 'NULL' || mop_name == null)
	{
		mop_name = '';
		document.mop_form.mopName.value = '';
	}
	else
	{
		document.mop_form.mopName.value = mop_name;
	}

	var mopDetails  = appletObj.getMopInfo(mop_name); 

	if (mopDetails!='') 
	{
		var jsDetails = mopDetails + "";
		//alert(jsDetails);
		arrayDetails = jsDetails.split("|");

		for (i = 0; i <arrayDetails.length; i++)
		{
			if(i == 0){
				mopDBID = arrayDetails[i];
			}
			if(i == 1){ // name
				if (arrayDetails[i].length == 0)
					document.mop_form.mopName.value = '';
				else
					document.mop_form.mopName.value = arrayDetails[i];
			}
			if(i == 2){ // description
				document.mop_form.mopDescription.value = arrayDetails[i];
			}
			if(i == 3){ // status
				if (arrayDetails[i] == 1) document.mop_form.mopStatus.checked = true;
				else  document.mop_form.mopStatus.checked = false;
			}
			if(i == 4){ // training code
				if (arrayDetails[i] != 'null' && arrayDetails[i] != 'NULL')
					document.mop_form.trainingCode.value = arrayDetails[i];
				else
					document.mop_form.trainingCode.value = "";
			}
			if(i == 5){ // training code tag
				if (arrayDetails[i] == 1)
					document.mop_form.trainingCodeTag[0].checked = true;
				else
					document.mop_form.trainingCodeTag[1].checked = true;
			}
			if(i == 6){ // integration code
				if (arrayDetails[i] != 'null' && arrayDetails[i] != 'NULL')
					document.mop_form.integrationCode.value = arrayDetails[i];
				else
					document.mop_form.integrationCode.value = "";
			}
			if(i == 7){ // integration code tag
				if (arrayDetails[i] == 1)
					document.mop_form.integrationCodeTag[0].checked = true;
				else
					document.mop_form.integrationCodeTag[1].checked = true;
			}
			if(i == 8){ // production code
				if (arrayDetails[i] != 'null' && arrayDetails[i] != 'NULL')
					document.mop_form.productionCode.value = arrayDetails[i];
				else
					document.mop_form.productionCode.value = "";
			}
			if(i == 9){ // production code tag
				if (arrayDetails[i] == 1)
					document.mop_form.productionCodeTag[0].checked = true;
				else
					document.mop_form.productionCodeTag[1].checked = true;
			}
			if(i == 10){ // production code
				if (arrayDetails[i] != 'null' && arrayDetails[i] != 'NULL')
					document.mop_form.commissionCode.value = arrayDetails[i];
				else
					document.mop_form.commissionCode.value = "";
			}
			if(i == 11){ // production code tag
				if (arrayDetails[i] == 1)
					document.mop_form.commissionCodeTag[0].checked = true;
				else
					document.mop_form.commissionCodeTag[1].checked = true;
			}
			if(i == 12){ // production code
				if (arrayDetails[i] != 'null' && arrayDetails[i] != 'NULL')
					document.mop_form.continuingTrainingCode.value = arrayDetails[i];
				else
					document.mop_form.continuingTrainingCode.value = "";
			}
			if(i == 13){ // production code tag
				if (arrayDetails[i] == 1)
					document.mop_form.continuingTrainingCodeTag[0].checked = true;
				else
					document.mop_form.continuingTrainingCodeTag[1].checked = true;
			}
			if(i == 14){ // overtime limit
				document.mop_form.weeklyHours.value = arrayDetails[i];
			}
			if(i == 15){ // multiplication factor
				document.mop_form.multFactor.value = arrayDetails[i];
			}
		} // fin for (i = 0; i <arrayDetails.length; i++)
		setLegends(mop_name + " - ");
	}// fin if (mopDetails!='') 
	
	// disable button
	document.mop_form.addButton.disabled = true;
	document.mop_form.dropButton.disabled = true;
}













function validateInfo()
{
	// save campaign
	group = document.campaign.AgentGroupSelection.value;
	var state = '';
	var amd = '';
	
	if(document.campaign.cmpState.checked)
		state = 1;
	else
		state = 0;
	
	if(document.campaign.AMD.checked)
		amd = 1;
	else
		amd = 0;
	
	var nb_ports = document.campaign.cmp_NbrPorts.value;
	if(nb_ports.length < 1)
		nb_ports = '0';

	var alReadyExist = false;

	var allCampaigns = String(appletObj.getCampaignsByName(tenant_dbid));
	jsCampaigns = allCampaigns.split("|");
	for(q = 0; q < jsCampaigns.length; q++)
	{
		if(document.campaign.campaignName.value == jsCampaigns[q] && cmpName != document.campaign.campaignName.value) //le groupe existe deja						
		{
			alReadyExist = true;
			break;
		}							
	}

	if(!valideCallerID(document.campaign.callerID.value))	
		alert("CallerID should be like \"CallerName\" <(514) 222-2222>");
	else if(document.campaign.callerID.value.length > 99)
		alert("The caller id cannot be more than 100 characters");
	else if(alReadyExist)
		alert("Campaign already exists.");
	else if(validation(document.campaign.callerID.value)==0)
	{
		alert("You cannot use ~ or ^ or | !!!");
		//document.campaign.callerID.focus();				
	}
	else if(validation(document.campaign.cmpDescription.value)==0)
	{
		alert("You cannot use ~ or ^ or | !!!");
		//document.campaign.cmpDescription.focus();				
	}
	else if(validation(document.campaign.campaignName.value)==0)
	{
		alert("You cannot use ~ or ^ or | !!!");
		//document.campaign.campaignName.focus();				
	}
	else if(validation(document.campaign.cmp_NbrPorts.value)==0)
	{
		alert("You cannot use ~ or ^ or | !!!");
		//document.campaign.cmp_NbrPorts.focus();				
	}
	else
	{
		if(document.campaign.callerID.value=="")
			document.campaign.callerID.value = "NULL";
		if(document.campaign.cmpDescription.value=="")
			document.campaign.cmpDescription.value = "NULL";

		appletObj.saveCampaign(
				cmpDBID,
				tenant_dbid,
				document.campaign.campaignName.value,
				document.campaign.cmpDescription.value,
				nb_ports,
				group,
				state,
				amd,
				document.campaign.daily_from_monday.value,
				document.campaign.daily_from_tuesday.value,
				document.campaign.daily_from_wednesday.value,
				document.campaign.daily_from_thursday.value,
				document.campaign.daily_from_friday.value,
				document.campaign.daily_from_saturday.value,
				document.campaign.daily_from_sunday.value,
				document.campaign.daily_to_monday.value,
				document.campaign.daily_to_tuesday.value,
				document.campaign.daily_to_wednesday.value,
				document.campaign.daily_to_thursday.value,
				document.campaign.daily_to_friday.value,
				document.campaign.daily_to_saturday.value,
				document.campaign.daily_to_sunday.value,
				document.campaign.callerID.value
				);

		validateCallingLists(cmpName);

		// reset the button to disabled
		document.campaign.updateInfo.disabled=true;
		return false;
	}
}

