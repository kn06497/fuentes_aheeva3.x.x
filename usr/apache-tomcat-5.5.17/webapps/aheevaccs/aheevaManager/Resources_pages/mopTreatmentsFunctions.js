/**
@Original code from unknown
@date: 2007-04-13
@modif: FM L'Heureux
@description: Reprogramed almost the entire file to correct the many bugs
*/

var mop_treatment_dbid;
var mop_treatment_name;
var description  = '';
var tenant_dbid		= normalizeString(QueryString('tenant_dbid'));
var linked_table = 'wfm_treatment_commission';
var lineNum = 0; //incrementing with each line added

function enabledUpdateButton()
{
	document.mop_treatment_form.updateInfo.disabled = false;
}

/**
called on load, searches the DB if the commission already exists and show the appropriate data
*/
function displayMopTreatmentInfo()
{
	mop_treatment_name = normalizeString(QueryString('mop_treatment_name'));
	if(mop_treatment_name == '' || mop_treatment_name == 'null' || mop_treatment_name == 'NULL')
	{
		document.mop_treatment_form.mopTreatmentName.value = "";
		document.mop_treatment_form.updateInfo.value =mopTreat[0];
		document.mop_treatment_form.deleteMopTreatment.disabled = true;
		
		document.getElementById('tabCommissions').style.display="none"
	}
	
	document.mop_treatment_form.mopTreatmentName.value = mop_treatment_name;
	
	var mopTreatsDetails = String(appletObj.getMopTreatmentInfo(mop_treatment_name));
	var arrayDetails = mopTreatsDetails.split("|");
	mop_treatment_dbid = arrayDetails[0];//database id
	//arrayDetails[1] = tenant
	if (arrayDetails[2]) document.mop_treatment_form.mopTreatmentName.value = arrayDetails[2];//name
	if (arrayDetails[3] && arrayDetails[3] != "NIL") document.mop_treatment_form.mopTreatmentDescription.value = arrayDetails[3];//description
	if (!arrayDetails[4] || arrayDetails[4] == 1) document.mop_treatment_form.mopTreatmentStatus.checked = true;//active
	else  document.mop_treatment_form.mopTreatmentStatus.checked = false;
	if (arrayDetails[5] && arrayDetails[6] && arrayDetails[5] != 0){
		document.mop_treatment_form.Radio1[arrayDetails[5] - 1].checked = true;//commission type
		if (arrayDetails[5] == 1) toggleLayer("fixed");
		else if (arrayDetails[5] == 2){
			toggleLayer("sales");
			document.mop_treatment_form.Radio2_1[arrayDetails[6] - 1].checked = true;
			if (arrayDetails[6] == 1 || arrayDetails[6] == 2){
				toggleLayer("range");
			}
			else if (arrayDetails[6] == 3){
				toggleLayer("unit");
			}
			else alert("Unkwnown base read from data base + \n + mopTreatmentsFunctions.js");
		}
		else if (arrayDetails[5] == 3 || arrayDetails[5] == 4){
			toggleLayer("group");
			document.mop_treatment_form.Radio2_2[arrayDetails[6] - 1].checked = true;
			if (arrayDetails[6] == 1 || arrayDetails[6] == 2){
				toggleLayer("range");
			}
			else alert("Unkwnown base read from data base + \n + mopTreatmentsFunctions.js");
		}
		else alert("Unkwnow commission type read from database \n mopTreatmentsFunctions.js");
	}
	if (arrayDetails[7]) document.mop_treatment_form.maxCommissionValue.value = arrayDetails[7];//max commission value
	
	var treatComDetails = String(appletObj.getMopTreatmentCommissionInfo(mop_treatment_dbid))
	if (treatComDetails != '')
	{
		if (arrayDetails[5] == 1 || (arrayDetails[5] == 2 && arrayDetails[6] == 3)){
			var jsDetails = treatComDetails;//format xx|xx|from|to|pay|xx|xx|from|to|pay|....
			var arrayComDetails = treatComDetails.split("|"); 
			var comDetails;
			comDetails = arrayComDetails[0].split(",");
			document.mop_treatment_form.amount.value = comDetails[4];
		}
		else{			
			var jsDetails = treatComDetails;//format xx|xx|from|to|pay|xx|xx|from|to|pay|....
			var arrayComDetails = treatComDetails.split("|"); 
			var comDetails;
			for (var i = 0; i < arrayComDetails.length; i ++){
				comDetails = arrayComDetails[i].split(",");
				addMyRow(comDetails[2], comDetails[3], comDetails[4]);
			}
		}
	}
}

/**
(from, to, pay) ->Variables to test
@return: true if all is ok, false otherwise 
*/
function validateRanges(from, to, pay){
	var max = document.mop_treatment_form.maxCommissionValue.value;
	if (isNaN(parseFloat(from)) || isNaN(parseFloat(to)) || isNaN(parseFloat(pay))){
		alert(mopTreat[1]);
		return false;
	}
	if (parseFloat(from) < 0 || parseFloat(to) < 0 ||  parseFloat(pay) < 0){
		alert(mopTreat[1]);
		return false;
	}
	if (max > 0 && parseFloat(pay) > max){
		alert(mopTreat[2]);
		return false;
	}
	return true;
}

/**
reads and tests a fixed value
*/
function readFixedValue(){
	var max = document.mop_treatment_form.maxCommissionValue.value;
	if (isNaN(parseFloat(document.mop_treatment_form.amount.value))){
		alert(mopTreat[3]);
		return false;				
	}
	else if (max > 0 && parseFloat(document.mop_treatment_form.amount.value) > max){
		alert(mopTreat[2]);
		return false;
	}
	return "0, 0, " + document.mop_treatment_form.amount.value;
}

/**
reads and tests (via validateRanges()) the ranged values
*/
function readValues(){
	values = "0, 0 ,0";
	if (document.mop_treatment_form.from){//if there are is some ranges
		if (document.mop_treatment_form.from[0]){//if there is many
			values = '';
			for (var i = 0; i < document.mop_treatment_form.from.length; i ++){
				if(!validateRanges(document.mop_treatment_form.from[i].value, document.mop_treatment_form.to[i].value, document.mop_treatment_form.pay[i].value)){
					return false;
				}
				values += document.mop_treatment_form.from[i].value + ", " + document.mop_treatment_form.to[i].value + ", " + document.mop_treatment_form.pay[i].value + "|";
			}
			values = values.substring(0, values.length - 1);
		}
		else{//if there is only one
			if(!validateRanges(document.mop_treatment_form.from.value, document.mop_treatment_form.to.value, document.mop_treatment_form.pay.value)){
					return false;
			}
			values = document.mop_treatment_form.from.value + ", " + document.mop_treatment_form.to.value + ", " + document.mop_treatment_form.pay.value;
		}
	}
	return values;
}

/**
Validates the input and inserts it in the DB if it's allright
*/
function validateInfo()
{
	//alert(document.mop_treatment_form.mopTreatCom[0].value);this is how we get a value COMMANDER MICH! .checked aussi pour tu devines
	if (document.mop_treatment_form.mopTreatmentName.value =='')//checks Mop Name 
	{
	alert(mopTreat[4]);
	}
	else if(validation(document.mop_treatment_form.mopTreatmentName.value)==0)//checks Mop Name 
	{
		alert(mopTreat[5]);
	}
	else if(validation(document.mop_treatment_form.mopTreatmentDescription.value)==0)//checks Mop description
	{
		alert(mopTreat[5]);
	}
	else if(document.mop_treatment_form.maxCommissionValue.value != '' && (isNaN(parseFloat(document.mop_treatment_form.maxCommissionValue.value)) || parseFloat(document.mop_treatment_form.maxCommissionValue.value) < 0)){
		alert(mopTreat[6]);
	}
	else //preliminaires ok
	{             
		var name = document.mop_treatment_form.mopTreatmentName.value;
		var jsMopCommissionsNames = appletObj.getMopCommissionsNames(tenant_dbid);
		var arrayMopCommissionsNames = jsMopCommissionsNames.split("|");
		//vérification de l'unicité de la commission
		for (var i = 0; i < arrayMopCommissionsNames.length; i++){
			if (name == arrayMopCommissionsNames[i] && arrayMopCommissionsNames[i] != mop_treatment_name)
			{
				alert(mopTreat[7]);
				return false;
			}
		}
		
		var radio1 = 0;
		var radio2 = 0;
		for (var i = 0; i < 4; i ++){
			if (document.mop_treatment_form.Radio1[i].checked){
				radio1 = i + 1;
				break;
			}
		}
		if (radio1 == 2){
			for (var i = 0; i < 3; i ++){
				if (document.mop_treatment_form.Radio2_1[i].checked){
					radio2 = i + 1;
					break;
				}
			}
		}
		else if (radio1 == 3 || radio1 == 4){
			for (var i = 0; i < 2; i ++){
				if (document.mop_treatment_form.Radio2_2[i].checked){
					radio2 = i + 1;
					break;
				}
			}
		}
		
		//Get main values
		var name = document.mop_treatment_form.mopTreatmentName.value;
		var description = document.mop_treatment_form.mopTreatmentDescription.value;
		if (description == '' || description == "NULL") description = "NIL";
		var max = document.mop_treatment_form.maxCommissionValue.value;
		var status = 0;
		if (document.mop_treatment_form.mopTreatmentStatus.checked) status = 1;
		var type = radio1; //=0 by default
		var treatmentBase = 0;
		var values  = "0, 0, 0";
		
		//Fixed commission
		if (radio1 == 1){
			treatmentBase = 0;
			values = readFixedValue();
			if (!values) return false;
		}
		
		else if (radio1 == 2 && radio2 == 3){
			treatmentBase = radio2;
			values = readFixedValue();
			if (!values) return false;
		}
		
		else if ((radio1 == 0 || radio1 == 2 || radio1 == 3 || radio1 == 4) && (radio2 == 0 || radio2 == 1 || radio2 == 2)){
			treatmentBase = radio2;
			if ((values = readValues()) == false) return;
		}
		else{
			alert("ERROR: unknown selection \n mopTreatmentsFunctions.js");
			return;
		}

		appletObj.saveMopTreatmentInfo(mop_treatment_dbid, tenant_dbid, name, description, status, type, treatmentBase, max, linked_table); 
		if (mop_treatment_dbid != ''){
			appletObj.saveMopTreatmentCommissionInfo(values, mop_treatment_dbid);
		}
	}
	return false;
}

/**
activated when the user click on Delete (bottot left)
shows a confirmation dialog
*/
function askDelete()
{
	var t_name = document.mop_treatment_form.mopTreatmentName.value;

	answer = confirm(mopTreat[8]);

	if(answer){
		appletObj.deleteMopTreatmentCommission(t_name);
		appletObj.deleteMopTreatment(t_name);
		// refresh the current page
		document.location = "../defaultpage.htm";
	}
}

/*******************************/


/**
Adds a row to the ranges display
*/
function addMyRow(var1, var2, var3)
{
	lineNum ++;
	enableUpdateButton();
	var row = document.createElement("div");
	row.id = "row" + lineNum;
	row.innerHTML = "From: <input name='from' type='text' size='4' value=" + var1 + ">&nbsp; &nbsp; To: <input name='to' type='text' size='4' value=" + var2 + ">&nbsp; &nbsp; Pay: <input name='pay' type='text' size='4' value=" + var3 + "> &nbsp; &nbsp;<a class='delete' href='javascript:deleteMyRow("+lineNum+");'>"+mopTreat[9]+"</font></a></td></TR>";
	document.getElementById('ranges').appendChild(row);
}

/**
Deletes the row tagged by f
*/
function deleteMyRow(f)
{
	
	document.getElementById('ranges').removeChild(document.getElementById("row" + f));
	enableUpdateButton();
}

/**
Deletes every row and reinitialises the lineNum variable to 0
*/
function deleteAllRow(){
	var fils = document.getElementById('ranges').childNodes;
	var stop = 0;
	while (fils.length > 0){
		document.getElementById('ranges').removeChild(fils[0]);
	}
	lineNum = 0;
}

/********************************/
function enableUpdateButton()
{
	document.mop_treatment_form.updateInfo.disabled = false;
}

/**
Uncheck radio buttons 2.x.y
*/
function radio2Uncheck(){
	document.getElementById('Radio2.1.1').checked=false;
	document.getElementById('Radio2.1.2').checked=false;
	document.getElementById('Radio2.1.3').checked=false;
	document.getElementById('Radio2.2.1').checked=false;
	document.getElementById('Radio2.2.2').checked=false;
}


/**
Activated by radio buttons, displays the appropriate fields
@input:layer the display request key
(layer)
(fixed)	-Fixed commission
											(layer)
(sales)	-Sales-based commission:			(range)	-Average sales per hour			
											(range)	-Sales per week
											(unit)	-Sales per unit
											
(group)	-Commission based on group average:	(range)	-Net conversion rate
											(range)	-Sales per week
											
(group)	-Performance-based commission:		(range)	-Net conversion rate
											(range)	-Sales per week

*/
function toggleLayer(layer)
{
	enableUpdateButton();
	if(layer == "fixed"){
	document.getElementById('Sales-based_table').style.display = 'none';
	document.getElementById('group_average').style.display = 'none';
	document.getElementById('field3.2').style.display = 'none';
	document.getElementById('field3.1').style.display = 'block';
	radio2Uncheck();
	}
	else if (layer == "sales"){
	document.getElementById('Sales-based_table').style.display = 'block';
	document.getElementById('group_average').style.display = 'none';
	document.getElementById('field3.2').style.display = 'none';
	document.getElementById('field3.1').style.display = 'none';
	radio2Uncheck();
	}
	else if (layer == "group"){
	document.getElementById('Sales-based_table').style.display = 'none';
	document.getElementById('group_average').style.display = 'block';
	document.getElementById('field3.2').style.display = 'none';
	document.getElementById('field3.1').style.display = 'none';
	radio2Uncheck();
	}
	else if (layer == "range"){
	document.getElementById('field3.1').style.display = 'none';
	document.getElementById('field3.2').style.display = 'block';
	}
	else if (layer == "unit"){
	document.getElementById('field3.2').style.display = 'none';
	document.getElementById('field3.1').style.display = 'block';
	}	
	else{
		alert("ERROR: Unkown layer \n mopTreatmentsFunctions.js" );
	}
}

/** 
 * @remarks : These 2 first functions have been moved from mopTreatment.htm 
 * to here by Gildas
 */
function askHelp(URL) 
{
	day = new Date();
	id = day.getTime();
	eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=200');");
}
/**
 * Associate a default button with pressing the Enter key
 * @param {Object} btn
 */
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
