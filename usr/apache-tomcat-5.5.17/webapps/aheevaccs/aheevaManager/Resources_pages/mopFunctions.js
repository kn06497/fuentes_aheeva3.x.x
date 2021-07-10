var mop_dbid       	= normalizeString(QueryString('mopDBID'));;
var mop_name          	= normalizeString(QueryString('mopName'));;
var description         = '';
var tenant_dbid		= normalizeString(QueryString('tenant_dbid'));



function getRequestedGroup()
{
	var vValue = normalizeString(QueryString('mopName'));
	alert(vValue);
}

function addRow(id, mop_name )
{
       var select = document.getElementById(id);
       var row = document.createTextNode(mop_name);
       select.appendChild(row);
}


function enabledUpdateButton()
{
	document.mop_form.updateInfo.disabled = false;
}

function enabledAddButton()
{
	document.mop_form.addButton.disabled = false;
}

function enabledDropButton()
{
	document.mop_form.dropButton.disabled = false;
}

function checkOnUnload()
{
	document.mop_form.updateInfo.disabled = false;
}

function enableReload()
{
   appletObj.fReloadMenu = true;
}


function chkAndAddTreatmentToMop()
{
    var myForm = document.mop_form;
	var tmpTreament='';
 	var i;
	var o;
	var cont = true
	var option_len = myForm.availableTreatments.options.length;
	
	if(myForm.selectedTreatments.options.length == 0)
	{
		for (i=0;i<=option_len-1 && cont == true;i++)
		{
			if(myForm.availableTreatments.options[i].selected == true ) 
			{
				tmpTreatment = myForm.availableTreatments.options[i].value; +"|";
				cont = false;
			}
		}
		if(tmpTreatment !='')
		{
			appletObj.addTreatToMop(tmpTreatment,mop_name);  
			enabledUpdateButton();
		}
		// Move them over
		cont = true;
		for (i=0; i<myForm.availableTreatments.options.length && cont == true; i++) 
		{
			o = myForm.availableTreatments.options[i];
			if (o.selected)
			{
				myForm.selectedTreatments.options[myForm.selectedTreatments.options.length] = new Option( o.text, o.value, false, false);
				cont = false;
			}
		}
		// Delete them from original
		for ( i=(myForm.availableTreatments.options.length-1); i>=0; i--) 
		{
			o = myForm.availableTreatments.options[i];
			if (o.selected)
			{
				myForm.availableTreatments.options[i] = null;
				
			}
		}
		myForm.availableTreatments.selectedIndex = -1;
		myForm.selectedTreatments.selectedIndex = -1;
	}
	else
	{
	
		
			alert(mop[0]);
		document.mop_form.addButton.disabled = true;
		enabledDropButton();
	}
}

function chkAndDropTreatmentFromMop()
{
	var myForm = document.mop_form;        
	var tmpTreament='';
	var i;
	var o;
	var option_len = myForm.selectedTreatments.options.length;
	for (i=0;i<option_len;i++)
	{
		if(myForm.selectedTreatments.options[i].selected == true )  
		{
			tmpTreatment = myForm.selectedTreatments.options[i].value +"|";
		}                
	}     

	if(tmpTreatment != '')
		appletObj.dropTreatFromMop(tmpTreatment,mop_name);
	enabledUpdateButton();

   // Move them over
	for (i=0; i<myForm.selectedTreatments.options.length; i++) {
			o = myForm.selectedTreatments.options[i];
	if (o.selected) {
		myForm.availableTreatments.options[myForm.availableTreatments.options.length] = new Option( o.text, o.value, false, false);
		}
	}
	// Delete them from original
	for ( i=(myForm.selectedTreatments.options.length-1); i>=0; i--) {
		o = myForm.selectedTreatments.options[i];
		if (o.selected) {
			myForm.selectedTreatments.options[i] = null;
			}
		}

       
	myForm.selectedTreatments.selectedIndex = -1;
	myForm.availableTreatments.selectedIndex = -1;
	document.mop_form.dropButton.disabled = true;
}



function displayMopInfo()
{
	var name;
	var value;
	var treatmentList;
	var treatment_dbid;
	var treatment_Name;
	var freeTreatmentList;
	var myForm = document.mop_form;
	var i=myForm.selectedTreatments.options.length;
	var j=myForm.availableTreatments.options.length;
 
	tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	mop_name= normalizeString(QueryString('mopName'));
	ourCaption   = document.getElementById("caption");

   // Remove all treatment from selectedTreatments option field
	if (i>0){
		for (i-1; i>=0; i--)
		   myForm.selectedTreatments.options[i] = null;
	}

	// Remove all treatments from availableTreatments option field
	if (j>0)
	{
		for (j-1; j>=0; j--)
			myForm.availableTreatments.options[j] = null;
	}
	myForm.selectedTreatments.options.length=0;
	freeTreatmentList = appletObj.getActiveTreatmentsForMop(mop_name); 
	//freeTreatmentList = appletObj.getActiveTreatments();
	treatmentList  = appletObj.getSelectedTreatmentsInMop(mop_name); 
	// parse the selected treatment list
 	var jsTreatmentLists = treatmentList+ "" ; 
	arrayTreatmentList = jsTreatmentLists.split("|");

   	for (i = 0; i <arrayTreatmentList.length; i++) //arrayTreatmentList = [{index,selectedCom}] -->Element selectionne
	{
   		var jsThisList = arrayTreatmentList[i];
   		arrayCurrent   = jsThisList.split(",");
   		for (m = 0; m <arrayCurrent.length; m++)//arrayCurrent = [{index},{selectedcom}] -->Element selectionne decompose
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
		if(arrayTreatmentList[i] != '' )  
		{
			value = treatment_Name + ','+ treatment_dbid ;
			name = treatment_Name;
			myOption = new Option(name,value);
			optionPos = myForm.selectedTreatments.options.length
			myForm.selectedTreatments.options[optionPos]=myOption
		}
	}
	
	// parse the available mop list
	var jsAVTreatmentLists = freeTreatmentList+ "";
	arrayAVList = jsAVTreatmentLists.split("|");
    
   	for (j = 0; j <arrayAVList.length; j++)//cette liste contient les choix disponibles
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
		
        if(arrayAVList[j] != '' )
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
		document.mop_form.updateInfo.value = mop[1];
		document.mop_form.deleteMop.disabled = true;

		document.getElementById("tabTreats").style.position = 'absolute';
		document.getElementById("tabTreats").style.left = '-1000';
		document.getElementById("tabTreats").style.top = '-1000';
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
			if(i == 2){ // tenant_dbid
				//alert(arrayDetails[i]);
			}
			
			if(i == 3){ // description
				arrayDetails[i] == "NIL" ? document.mop_form.mopDescription.value = "" : document.mop_form.mopDescription.value = arrayDetails[i];
			}
			if(i == 4){ // status
				if (arrayDetails[i] == 1) document.mop_form.mopStatus.checked = true;
				else  document.mop_form.mopStatus.checked = false;
			}
			if(i == 5){ // training code
				arrayDetails[i] == "NIL" ? document.mop_form.trainingCode.value = "" : document.mop_form.trainingCode.value = arrayDetails[i];
			}
			if(i == 6){ // training code tag
				if (arrayDetails[i] == 1)
					document.mop_form.trainingCodeTag[0].checked = true;
				else
					document.mop_form.trainingCodeTag[1].checked = true;
			}
			if(i == 7){ // integration code
				arrayDetails[i] == "NIL" ? document.mop_form.integrationCode.value = "" : document.mop_form.integrationCode.value = arrayDetails[i];
			}
			if(i == 8){ // integration code tag
				if (arrayDetails[i] == 1)
					document.mop_form.integrationCodeTag[0].checked = true;
				else
					document.mop_form.integrationCodeTag[1].checked = true;
			}
			if(i == 9){ // production code
				arrayDetails[i] == "NIL" ? document.mop_form.productionCode.value = "" : document.mop_form.productionCode.value = arrayDetails[i];
			}
			if(i == 10){ // production code tag
				if (arrayDetails[i] == 1)
					document.mop_form.productionCodeTag[0].checked = true;
				else
					document.mop_form.productionCodeTag[1].checked = true;
			}
			if(i == 11){ // overtime code
				arrayDetails[i] == "NIL" ? document.mop_form.overtimeCode.value = "" : document.mop_form.overtimeCode.value = arrayDetails[i];
			}
			if(i == 12){ // overtime code tag
				if (arrayDetails[i] == 1)
					document.mop_form.overtimeCodeTag[0].checked = true;
				else
					document.mop_form.overtimeCodeTag[1].checked = true;
			}
			if(i == 13){ // commission code
				arrayDetails[i] == "NIL" ? document.mop_form.commissionCode.value = "" : document.mop_form.commissionCode.value = arrayDetails[i];
			}
			if(i == 14){ // commission code tag
				if (arrayDetails[i] == 1)
					document.mop_form.commissionCodeTag[0].checked = true;
				else
					document.mop_form.commissionCodeTag[1].checked = true;
			}
			if(i == 15){ // cont training code
				arrayDetails[i] == "NIL" ? document.mop_form.continuingTrainingCode.value = "" : document.mop_form.continuingTrainingCode.value = arrayDetails[i];
			}
			if(i == 16){ // cont training code tag
				if (arrayDetails[i] == 1)
					document.mop_form.continuingTrainingCodeTag[0].checked = true;
				else
					document.mop_form.continuingTrainingCodeTag[1].checked = true;
			}
			if(i == 17){ // overtime limit
				document.mop_form.weeklyHours.value = arrayDetails[i];
			}
		} // fin for (i = 0; i <arrayDetails.length; i++)
		setLegends(mop_name + " - ");
	}// fin if (mopDetails!='') 
	
	// disable button
	document.mop_form.addButton.disabled = true;
	document.mop_form.dropButton.disabled = true;
}




function unloadMop()
{
	//appletObj.unloadMop(mop_name);
}

function isAlphaNumeric(val){
	if (val.match(/^[a-zA-Z0-9\-\_]+$/)){
		return true;
	}else{
		return false;
	} 
}

function validateInfo()
{
	if (document.mop_form.mopName.value =='')
		alert(mop[2]);
           
	else if(!isAlphaNumeric(document.mop_form.mopName.value)){
		alert(mop[3]);
		document.mop_form.mopName.focus();
	}
	else if(validation(document.mop_form.mopDescription.value)==0)
	{
		alert(mop[3]);
		document.mop_form.mopDescription.focus();
	}
	else if(validation(document.mop_form.trainingCode.value)==0)
	{
		alert(mop[3]);
		document.mop_form.trainingCode.focus();
	}
	else if(validation(document.mop_form.integrationCode.value)==0)
	{
		alert(mop[3]);
		document.mop_form.integrationCode.focus();
	}
	else if(validation(document.mop_form.productionCode.value)==0)
	{
		alert(mop[3]);
		document.mop_form.productionCode.focus();
	}
	else if(validation(document.mop_form.commissionCode.value)==0)
	{
		alert(mop[3]);
		document.mop_form.commissionCode.focus();
	}
	else if(validation(document.mop_form.weeklyHours.value)==0)
	{
		alert(mop[3]);
		document.mop_form.weeklyHours.focus();
	}
	else 
	{             
		//alert('avt'+document.mop_form.mopName.value)
		var t_name = document.mop_form.mopName.value;
		var jsMopNames = appletObj.getMopNames(tenant_dbid);
		var arrayMopNames = jsMopNames.split("|");
		if (mop_dbid == 'null') // vérification de l'unicité du mop
		{
			for (var i = 0; i < arrayMopNames.length; i++)
			{
				if (t_name == arrayMopNames[i])
				{
					alert("A method of payment having this name already exists!! Please change.")
					return false;
				}
			}
		}
		else // 
		{
			for (var i = 0; i < arrayMopNames.length; i++)
			{
				if (arrayMopNames[i] != mop_name && t_name == arrayMopNames[i] )
				{
					alert("A method of payment having this name already exists!! Please change.")
					return false;
				}
			}
		}
		
		//alert('avt'+t_name)
		var dbid = mop_dbid; //appletObj.getMopDBID(t_name); 
		if (dbid == 'null')
			dbid = '';
		//var tenant_dbid = tenant_dbid;
		var agent_group_dbid = "";
		var description;
		if (document.mop_form.mopDescription.value != '')
			description = document.mop_form.mopDescription.value;
		else
			description = "NIL";
		
		var status = "";
		if (document.mop_form.mopStatus.checked == true) 
			status = 1;
		else 
			status = 0;
			
		var trainingCode;
		if (document.mop_form.trainingCode.value != '')
			trainingCode = document.mop_form.trainingCode.value;
		else
			trainingCode = "NIL";
		var trainingCodeTag;
		if (document.mop_form.trainingCodeTag[0].checked)
			trainingCodeTag = 1;
		else
			trainingCodeTag = 2;
		
		var integrationCode;
		if (document.mop_form.integrationCode.value != '')
			integrationCode = document.mop_form.integrationCode.value;
		else
			integrationCode = "NIL";
		
		var integrationCodeTag;
		if (document.mop_form.integrationCodeTag[0].checked)
			integrationCodeTag = 1;
		else
			integrationCodeTag = 2;
		
		var productionCode;
		if (document.mop_form.productionCode.value)
			productionCode = document.mop_form.productionCode.value;
		else
			productionCode = "NIL";
		var productionCodeTag;
		if (document.mop_form.productionCodeTag[0].checked)
			productionCodeTag = 1;
		else
			productionCodeTag = 2;

		var overtimeCode;
		if (document.mop_form.overtimeCode.value)
			overtimeCode = document.mop_form.overtimeCode.value;
		else
			overtimeCode = "NIL";
		
		var overtimeCodeTag;
		if (document.mop_form.overtimeCodeTag[0].checked)
			overtimeCodeTag = 1;
		else
			overtimeCodeTag = 2;

		var commissionCode;
		if (document.mop_form.commissionCode.value)
			commissionCode = document.mop_form.commissionCode.value;
		else
			commissionCode = "NIL";
		var commissionCodeTag;
		if (document.mop_form.commissionCodeTag[0].checked)
			commissionCodeTag = 1;
		else
			commissionCodeTag = 2;

		var continuingTrainingCode;
		if (document.mop_form.continuingTrainingCode.value)
			continuingTrainingCode = document.mop_form.continuingTrainingCode.value;
		else
			continuingTrainingCode = "NIL";
		var continuingTrainingCodeTag;
		if (document.mop_form.continuingTrainingCodeTag[0].checked)
			continuingTrainingCodeTag = 1;
		else
			continuingTrainingCodeTag = 2;



		var overtime_limit;
		if (document.mop_form.weeklyHours.value != '')
			overtime_limit = document.mop_form.weeklyHours.value;
		else
			overtime_limit = 0;
		
		//var mult_factor = document.mop_form.multFactor.value;
		
		//alert("dbid = " + dbid + "name = " +t_name+ "desc = " + description + "status = " + status+ trainingCode+ integrationCode+ productionCode+ tenant_dbid);
		var result = appletObj.saveMopInfo(dbid, t_name, tenant_dbid, agent_group_dbid, description, status, 
											trainingCode, trainingCodeTag, integrationCode, integrationCodeTag, 
											productionCode, productionCodeTag, overtimeCode, overtimeCodeTag,
											commissionCode, commissionCodeTag, continuingTrainingCode, 
											continuingTrainingCodeTag, overtime_limit);
		// il faudrait sauvegarder également les informations sur les traitements et les vacances ici
	
		document.mop_form.updateInfo.disabled = true;	// reset the button to disabled
		document.location.href = "../defaultpage.htm";
	
		return;
	}
	return false;
}


function askDelete()
{
	var t_name = document.mop_form.mopName.value;
	answer = confirm(mop[4].replace("**","\n"));
	if(answer){
		appletObj.deleteMop(t_name);
		// refresh the current page
		document.location = "../defaultpage.htm";
	}
}



