
// JavaScript Document
var tenant_dbid 		= "NULL";
var callingListDBID 	= "";
var currentFilterDBID 	= "";
var callingListName 	= "";
var mysqlExecAnswer 	= "";

/*	Specific to addCallingList.jsp	*/
var associationTableField 	= "";  	//temp value
var associationTableName	= "";	//temp value
var associationFileField 	= "";  	//temp value

var associationVector = new Array();
var tableFieldsVector = new Array();

/**
	Step "Insertion into database"
*/
var totalSQLExecutionTime = 0;
var totalRowsToInsert = 0;
var totalProceed = 0;
var totalSuccess = 0;
var totalErrors = 0;
var loadingCurrentStatus = "";
var totalPercentComplStr = ""
var totalPercentCompl = 0.00;
var sqlInsertionStart = 0;
var errorLogText = "";
var totalcurentElapsedTime = 0;

var interId;


/**
	Step for the after queries status
	*/
var tableOfQueriesStatus = new Array();
var tableOfQueriesMessages = new Array();




function fieldAssoc()
{
	this.TableNum 		= "";
	this.FileNum 		= "";
	this.ColNameInBD 	= "";
}

function tableField()
{
	this.ColNum		= "";
	this.tableName		= "";
	this.isNewCreated = "false";
}

/*	~ Specific to addCallingList.jsp	*/

var tenant_dbid = QueryString('tenant_dbid') ? normalizeString(QueryString('tenant_dbid')) : "";

function enabledUpdateButton()
{
	document.callingList.updateInfo.disabled = false;
}

function enabledNextButton()
{
	document.callingList.nextInfo.disabled = false;
}

function enabledBackButton()
{
	document.callingList.backInfo.disabled = false;
}

function enabledAddButton()
{
	document.callingList.addButton.disabled = false;
}

function enabledAddFilterButton()
{
       document.callingList.addFilter.disabled = false;
}

function enabledDropButton()
{
	document.callingList.dropButton.disabled = false;
}

function checkOnUnload()
{
	return false;
}

function enableReload()
{
   appletObj.fReloadMenu = true;
}


function sortSelect(obj)
{
	var o = new Array();
	if (obj.options==null) { return; }
	for (var i=0; i<obj.options.length; i++) {
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;
		}
	if (o.length==0) { return; }
	o = o.sort(
		function(a,b) {
			if ((a.text+"") < (b.text+"")) { return -1; }
			if ((a.text+"") > (b.text+"")) { return 1; }
			return 0;
			}
		);

	for (var i=0; i<o.length; i++) {
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}
}

function chkAndAddTreatmentToGroup()
{
        var myForm = document.callingList;
        var name = '';
        var tmpTreatments ='';
        var chkedTreatments;
	tenant_dbid		= normalizeString(QueryString('tenant_dbid'));

        var option_len = myForm.availableTreatments.options.length;
        //alert('i: ' + option_len);
        for (i=0;i<=option_len-1;i++){
    	    if(myForm.availableTreatments.options[i].selected == true ) {
       		name = myForm.availableTreatments.options[i].value;
       		var jsname = name+ "";
               tmpTreatments = tmpTreatments+jsname+"|";
    	    }
        }
        // Now check selected treatments to find whether 2 treatments will
        // be affected to the calling list with the same call_result and order
        if(tmpTreatments.length >0)
          tmpTreatments = tmpTreatments.substring(0,tmpTreatments.length-1);

        chkedTreatments= String( appletObj.chkTreatmentToAddToCallList(tmpTreatments,callingListName, tenant_dbid) );/////
        //alert(chkedTreatments)
        //Deselect the treatments that are causing conflit
        var jsTreatmnts = chkedTreatments  + "";
        arraytrtmts = jsTreatmnts.split(",");
        if(chkedTreatments.length > 0){
          tmpTreatments="";
          for(c=0; c<arraytrtmts.length;c++){
            for (i=0; i<myForm.availableTreatments.options.length; i++) {
              o = myForm.availableTreatments.options[i];
              if (o.selected && (o.value == arraytrtmts[c] )){
			  
                 alert(arraytrtmts[c] + MultiArray["cannot be choosen. It causes an order conflict with another treatment"][lang]);
				 
                 myForm.availableTreatments.options[i].selected = false;
                 break;
              }
            }
          }

         for (i=0;i<=myForm.availableTreatments.options.length-1;i++){
    	    if(myForm.availableTreatments.options[i].selected == true )
               tmpTreatments = tmpTreatments+myForm.availableTreatments.options[i].value+"|";
         }
         if(tmpTreatments.length >0)
            tmpTreatments = tmpTreatments.substring(0,tmpTreatments.length-1);
      }

        //alert(tmpTreatments)
        if(tmpTreatments !=''){
            appletObj.addTreatmentToCallList(tmpTreatments,callingListName);/////
            enabledUpdateButton();
        }

        var i;
        var o;
	// Move them over
	for (i=0; i<myForm.availableTreatments.options.length; i++) {
            o = myForm.availableTreatments.options[i];
            if (o.selected)
                myForm.selectedTreatments.options[myForm.selectedTreatments.options.length] = new Option( o.text, o.value, false, false);
          }
	// Delete them from original
	for ( i=(myForm.availableTreatments.options.length-1); i>=0; i--) {
		o = myForm.availableTreatments.options[i];
		if (o.selected)
                    myForm.availableTreatments.options[i] = null;
          }

        sortSelect(myForm.availableTreatments);
	sortSelect(myForm.selectedTreatments);
	myForm.availableTreatments.selectedIndex = -1;
	myForm.selectedTreatments.selectedIndex = -1;
        if(myForm.availableTreatments.options.length <1)
               document.callingList.addButton.disabled = true;

 }

function chkAndDropTreatmentFromGroup()
{
        var myForm = document.callingList;
        var name = '';
        var tmpTreatments='';
        var i;
        var o;
        var option_len = myForm.selectedTreatments.options.length;
        for (i=0;i<option_len;i++){
            if(myForm.selectedTreatments.options[i].selected == true )  {
                name = myForm.selectedTreatments.options[i].value;
                var jsname = name+ "";
                tmpTreatments = tmpTreatments+jsname+"|";
            }
        }

        if(tmpTreatments != '')
            appletObj.dropTreatmentFromCallList(tmpTreatments,callingListName);////
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

        sortSelect(myForm.availableTreatments);
	sortSelect(myForm.selectedTreatments);

	myForm.selectedTreatments.selectedIndex = -1;
	myForm.availableTreatments.selectedIndex = -1;
       
}


function displayCallingListInfo()
{
		var name;
        var myForm = document.callingList;
        var i=myForm.selectedTreatments.options.length;
        var j=myForm.availableTreatments.options.length;

        
		callingListName    	= normalizeString(QueryString('callinglistName'));
		tenant_dbid		= normalizeString(QueryString('tenant_dbid'));

       // Remove all treatments from selected Treatments option field
        if (i>0){
    	    for (i-1; i>=0; i--)
               myForm.selectedTreatments.options[i] = null;
        }

        // Remove all treatments from available Treatments option field
        if (j>0){
    	    for (j-1; j>=0; j--)
                myForm.availableTreatments.options[j] = null;
        }
        myForm.selectedTreatments.options.length=0;
        freeTreatmentList = String( appletObj.getAvailableTreatmentList(callingListName,tenant_dbid) ); ////
        selectedTreatmentList  = String( appletObj.getSelectedTreatmentInCallList(callingListName,tenant_dbid) );////
        // parse the selected Treatments list
 	var jsTrtLists = selectedTreatmentList+ "";
	arrayTrtList = jsTrtLists.split("|");

   	for (j = 0; j <arrayTrtList.length; j++){
		if(arrayTrtList[j] != '' )  {
       		    myOption = new Option(arrayTrtList[j],arrayTrtList[j]);
           	    optionPos = myForm.selectedTreatments.options.length
                    myForm.selectedTreatments.options[optionPos]=myOption
                 }
	}
        sortSelect(myForm.selectedTreatments);

        // parse the the available Treatments list
        var jsNCTrmtLists = freeTreatmentList+ "";
        arrayNCTrmtList = jsNCTrmtLists.split("|");
   	for (j = 0; j <arrayNCTrmtList.length; j++){
               if(arrayNCTrmtList[j] != '' )   	{// a enlever
                    name = arrayNCTrmtList[j];
                    myOption = new Option(name,name)
                    optionPos = myForm.availableTreatments.options.length
                    myForm.availableTreatments.options[optionPos]=myOption
                }
        }
	sortSelect(myForm.availableTreatments);

	if (callingListName== '')
	{		
		document.callingList.updateInfo.value = "Save";
		document.callingList.RemoveFilterButton.disabled = true;
		document.callingList.availableFilters.disabled = true;
		document.callingList.addFilter.disabled = true;
		document.callingList.selectedTreatments.disabled = true;
		document.callingList.availableTreatments.disabled = true;
		document.callingList.availableTreatments.disabled = true;
		document.callingList.dropButton.disabled = true;
	}
	else
	 {		
		// disable changing the table name
		document.callingList.table_name.disabled = true;
         }

        var listDetails  =  String( appletObj.getCallingListInfo(callingListName) );

        // parse info received
        var jsDetails = listDetails  + "";
        arrayDetails = jsDetails.split("|");
        //alert(arrayDetails);
		for (i = 0; i <arrayDetails.length; i++)
		{
			if(i == 0){
				callingListDBID = arrayDetails[i];
			}else if (i == 1){ // name
				document.callingList.name.value 	= arrayDetails[i];
				//callingListName= arrayDetails[i];
			}else if(i == 2) { // description
				document.callingList.description.value 	= arrayDetails[i]=='NULL'?'':arrayDetails[i];
			}else if (i == 3){ // table name
				document.callingList.table_name.value 	= arrayDetails[i];
			}else if (i == 4) { // filter dbid
				currentFilterDBID 			= arrayDetails[i];
				// get the name associated with this filter
				document.callingList.selectedFilter.value = String( appletObj.getFilterName(currentFilterDBID) );

				// disable the minus button if there is no filter associated
				if(document.callingList.selectedFilter.value.length == 0)
				{
					document.callingList.RemoveFilterButton.disabled = true;
				}
                                else
                                       document.callingList.RemoveFilterButton.disabled = false;

			}else if ( i == 5) { // state
				if(arrayDetails[i] == '1')
					document.callingList.state.checked = true;
				else
					document.callingList.state.checked = false;
			}else if ( i == 6) { // max_attempts
			    var attempts = arrayDetails[i];
                            for (j = 0; j <document.callingList.max_attempts.options.length; j++){
        //			myOption = new Option(arrayGroups[j],arrayGroups[j])
        			if(attempts == document.callingList.max_attempts.options[j].value )
         			 { document.callingList.max_attempts.options[j].selected = true; break;}
         		    }
			}
		}

		var filters = String( appletObj.getFiltersByName(tenant_dbid) );
		var jsFilters = filters + "";
                arrayFilter = jsFilters.split("|");
		if(filters.length != 0)
		{
    		for (i = 0; i <arrayFilter.length; i++)
			{
				if(arrayFilter[i] != document.callingList.selectedFilter.value)
				{
					opt = new Option(arrayFilter[i],arrayFilter[i]);
					optionPos = document.callingList.availableFilters.options.length;
					document.callingList.availableFilters.options[optionPos] = opt;
				}
			}
		}
 }


function removeAssociatedFilter()
{
	var currentValue = document.callingList.selectedFilter.value;
	if(currentValue != "")
	{
		currentFilterDBID			  = '0';
		document.callingList.selectedFilter.value = "";
		// add it to the list of available filters
		opt = new Option(currentValue ,currentValue );
		var optionPos = document.callingList.availableFilters.options.length;
		document.callingList.availableFilters.options[optionPos] = opt;
                //Sort filters value
                sortSelect(document.callingList.availableFilters);
		// then disable the remove button
		document.callingList.RemoveFilterButton.disabled = true;
		// now invoke the save function
                enabledUpdateButton();
		saveCallingList();
	}
}

function AddSelectedFilter()
{
        var i;
        var o;
        var name;
        var tmpFilter = '';
        var option_len = document.callingList.availableFilters.options.length;
        for (i=0;i<=option_len-1;i++){
    	    if(document.callingList.availableFilters.options[i].selected == true ) {
       		name = document.callingList.availableFilters.options[i].value;
                tmpFilter = name+ "";
                //tmpFilters = tmpFilters+jsname+"|";
    	    }
        }

        if(tmpFilter !=''){
            //appletObj.addFilterToCallList(tmpFilter,callingListName);//
            enabledAddFilterButton();
        }

	// Update selected filter value
	for (i=0; i<document.callingList.availableFilters.options.length; i++) {
            o = document.callingList.availableFilters.options[i];
            if (o.selected)
                document.callingList.selectedFilter.value=o.value;
          }

	// Delete from original
	for ( i=(document.callingList.availableFilters.options.length-1); i>=0; i--) {
		o = document.callingList.availableFilters.options[i];
		if (o.selected)
                    document.callingList.availableFilters.options[i] = null;
          }


        document.callingList.RemoveFilterButton.disabled = false;
        sortSelect(document.callingList.availableFilters);
	document.callingList.availableFilters.selectedIndex = -1;
        enabledUpdateButton();
        saveCallingList();
}

function saveCallingList(withoutFilter)
{
	var state = '';
	if(document.callingList.state.checked)
		state = 1;
	else
		state = 0;

   if(document.callingList.table_name.value.length == 0)
   {
   		alert("You must enter the table name associated with this list");
		document.callingList.table_name.focus();
   		return false;
   }
   
   if(validation(document.callingList.name.value)==0)
   {
   		alert(MultiArray["Invalid use of character"][lang]);
		document.callingList.name.focus();
		return false;
   }
   else if(validation(document.callingList.description.value)==0)
   {
   alert(MultiArray["Invalid use of character"][lang]);
		document.callingList.description.focus();
		return false;
   }
   else if(validation(document.callingList.table_name.value)==0)
   {
   		alert(MultiArray["Invalid use of character"][lang]);
		document.callingList.table_name.focus();
		return false;
   }   
	
	//Validate only name that does not start with a number
	
   var letterStart = document.callingList.name.value.charAt(0);	
   if(letterStart.charCodeAt(0) > 47 &&  letterStart.charCodeAt(0) <58)
   {
      	alert(MultiArray["Calling list name cannot start with a number"][lang]);
		document.callingList.name.focus();
		return false;

   }
  
   letterStart = document.callingList.table_name.value.charAt(0);	
   if(letterStart.charCodeAt(0) > 47 &&  letterStart.charCodeAt(0) <58)
   {
      alert(MultiArray["Calling list name cannot start with a number"][lang]);
		document.callingList.table_name.focus();
		return false;

   }
  
    
   var alReadyExist = false;
   
   var callingLists = String( appletObj.getCallingListByName(tenant_dbid, 1) );
   jscallingLists = callingLists.split("|");
   for(q = 0; q < jscallingLists.length; q++)
	{					
		if( document.callingList.name.value == jscallingLists[q] && document.callingList.name.value != callingListName) //le groupe existe deja						
		{
			alReadyExist = true;
			break;
		}							
	}
	
   var callingLists = String( appletObj.getCallingListByName(tenant_dbid, 0) );
   jscallingLists = callingLists.split("|");
   for(q = 0; q < jscallingLists.length; q++)
		{					
		if( document.callingList.name.value == jscallingLists[q] && callingListName != document.callingList.name.value ) //le groupe existe deja						
			{
			alReadyExist = true;
			break;
			}							
		}
	if(alReadyExist)
	{
	alert(MultiArray["Calling list already exists"][lang]);

		return false;
	}
	else
	{
		if(!withoutFilter)
		{
			appletObj.saveCallingList(
							tenant_dbid,
							callingListDBID,
							document.callingList.name.value,
							document.callingList.description.value,
							document.callingList.table_name.value,
							document.callingList.selectedFilter.value,						
							state,
							document.callingList.max_attempts.value,
							getXmlAllowedUsers());
		}
		else
		{
			appletObj.saveCallingList(
							tenant_dbid,
							callingListDBID,
							document.callingList.name.value,
							document.callingList.description.value,
							document.callingList.table_name.value,
							"",						
							state,
							document.callingList.max_attempts.value,
							getXmlAllowedUsers());
		}
		return true;
	}
}

/*function checkOnUnload()
{
  	return false;
}
*/
function askDelete()
{

	answer = confirm(MultiArray["Are you sure, you wish to delete this calling list?"][lang]);
	if(answer){
		appletObj.deleteCallingList(callingListDBID);
		// refresh the current page
		//document.location = "./callingList.htm?callinglistName=&tenant_dbid="+tenant_dbid;
		document.location = "../defaultpage.htm";
	}

}

function executeQuery()
{	
	var str = document.callingList.clist_sql_queries.value;
	var goNow = true;
	if(str == "")	
	{
	
		alert(MultiArray["No query specifed.\n"][lang]);
		document.callingList.clist_sql_queries.focus();
	}
	else
	{
		var firstWordPos = str.indexOf(' ');
		if(firstWordPos != -1)
		{
			var firstWord = str.substring(0, firstWordPos);
			if( firstWord.toLowerCase() == 'delete' ||  str == 'delete')
			{
				var yesno = confirm('WARNING !!\nThis SQL Query seems to delete informations from your database. This can affect your system.\nDo you want to continue ?');
				if(!yesno)
					goNow = false;
			}
		}
		
		if(goNow) //proceed
		{
			// DO THE SQL QUERY ...
			//document.write("<SCR" + "IPT LANGUAGE='JavaScript1.2' SRC='jspFuncs.jsp' TYPE='text/javascript'><\/SCR" + "IPT>");
			/*
			var sql_res_div = document.getElementById('mysql_query_res_div');
			document.write('<script type="text\/javascript" src=".\/jspFuncs.jsp"><\/script>')
			mysqlExecAnswer = 'youpi...';
			if(sql_res_div)
			{
				sql_res_div.innerHTML = mysqlExecAnswer;
			}
			*/
		}
	}
}

function adviseTableName()
{
	var tab_name = "";
	var clist_name = document.callingList.name.value;
	if(document.callingList.table_name.value == "")	
	{
		tab_name = clist_name;
		var pos = tab_name.indexOf(' ');
		while( pos != -1 )
		{			
			tab_name = tab_name.substring(0, pos) + '_' + tab_name.substring(pos+1, tab_name.length);			
			pos = tab_name.indexOf(' ');
		}
		document.callingList.table_name.value = tab_name;
	}
	
}


function addCList_next(current_step)
{	
	switch(current_step)
	{
		case "1":
			var call_list = document.callingList.table_name.value;
			//alert ("document.callingList.table_name.value= " + document.callingList.table_name.value);
			if(!call_list.match(/[a-zA-Z][a-zA-Z0-9_]*/))
			{
				alert("The name of the associated table to the calling list contains one or more forbidden characters. A calling list must start with a letter and contain only letters, digits and the underscore character(_). Please try again");
			}			
			else if( saveCallingList(true) ) //the save of the calling list successfull => gonext
			{				
				document.callingList.submitHiddenButton.click();
			}
		break;
		case "2":
			var goNext = false;
			var selectedValue = "";
			
			for (var counter = 0; counter < document.callingList.file_extension.length && !goNext; counter++)
			{		
				if (document.callingList.file_extension[counter].checked)
				{
					selectedValue = document.callingList.file_extension[counter].value;
					goNext = true;
				}
			}
			if(!goNext)
			{
				alert(MultiArray["Specify the file extension"][lang]);
				
			}
			else
			{
				if(selectedValue == 'csv' && (document.callingList.csv_delimiter.value == '' || document.callingList.csv_quote.value == ''))
				{
					goNext = false;
					
					alert(MultiArray["Specify the CSV file delimiters and quotes"][lang]);
				}
				else if(document.callingList.source_file_name.value == '')
				{
					goNext = false;
					alert(MultiArray["Specify the calling list file"][lang]);
					
				}
				if(goNext)
					document.callingList.submitHiddenButton.click();
			}
			
		break;
		case "3": //goto calling list modification...
			var goNext = true;
			var tmpStr = '';
			
			if(associationVector.length == 0)
			{
				goNext = false;
				
				alert(MultiArray["No association have been made"][lang]);				
			}
			else if(tableFieldsVector.length == 0)
			{
				goNext = false;
				
				alert(MultiArray["No table in your calling list"][lang]);
			}
			else
			{
				var phone_associated = false;
				for(var i = 0 ; i < associationVector.length; i++)
				{
					if(associationVector[i].ColNameInBD.toLowerCase() == 'phone_number')
					{
						phone_associated = true;
						break;	
					}					
				}
				
				if(!phone_associated)
				{
					goNext = false;
					
					alert(MultiArray["No association with the phone number field"][lang]);
				}
			}
			
			if( goNext )
			{
				tmpStr = '';
				for(var i = 0 ; i < tableFieldsVector.length; i++)
				{
					tmpStr += tableFieldsVector[i].ColNum+'^';
					tmpStr += tableFieldsVector[i].tableName+'^';
					tmpStr += tableFieldsVector[i].isNewCreated;
					tmpStr += '|';
				}
				if(tmpStr.length >= 1)
					tmpStr = tmpStr.substring(0, tmpStr.length-1);				
				document.callingList.tableFieldsVector_str.value = tmpStr;
				
				tmpStr = '';
				for(var i = 0 ; i < associationVector.length; i++)
				{
					tmpStr += associationVector[i].TableNum+'^';
					tmpStr += associationVector[i].FileNum+'^';
					tmpStr += associationVector[i].ColNameInBD;
					tmpStr += '|';
				}
				if(tmpStr.length >= 1)
					tmpStr = tmpStr.substring(0, tmpStr.length-1);
				document.callingList.associationVector_str.value = tmpStr;
				
				document.callingList.submitHiddenButton.click();
			}
			
		break;
		case "4": //this is just the statistic panel... go next anyway			
			document.callingList.submitHiddenButton.click();		
		break;
		case "5": //validate the after queries mega form
			var goNext = true;
			var theForm = document.callingList;
			var foundone = false;
			foundone = atleastonechecked(theForm.hoursapplyto);
			
			if(!foundone)
			{
			
				alert(MultiArray["Error: Missing dialing hours \"apply to\""][lang]);	
				goNext = false;				
			}
			else
			{
				var temp = theForm.extradataapplyto;
				if(theForm.cList_extrada.value == "" && temp[2].checked==false)
				{

					alert(MultiArray["Error: Missing the extra data for screenpop. Try selecting the \'None\' option"][lang]);


					goNext = false;					
				}
				else
				{
					foundone = atleastonechecked(theForm.extradataapplyto);
					if(!foundone)
					{
					
						alert(MultiArray["Error: Missing extra data \"apply to\""][lang]);
						goNext = false;
					}
					else
					{
						foundone = atleastonechecked(theForm.phone_purification_non_numeric	);
						if(!foundone)
						{
						
							alert(MultiArray["Error: Missing non numeric phone number action"][lang]);	
							goNext = false;
						}
						else
						{
							/*var pref = theForm.phone_purification_non_numeric;
							if((typeof(tableOfQueriesStatus["PREFIX_RULES"]) == 'undefined' || tableOfQueriesStatus["PREFIX_RULES"] == "")
								&& pref[0].checked==false ){
								alert('Error: No prefix rule were selected. Try using the \'None\' option instead.');
								goNext = false;
							}*/
							/*foundone = atleastonechecked(theForm.phone_purification_blackListRules);
							if(!foundone)
							{
								alert('Error: Missing black list phone number "apply to"');	
								goNext = false;
							}
							else
							{
								foundone = atleastonechecked(theForm.timeZoneRulesApplyto);
								if(!foundone)
								{
									alert('Error: Missing time zone setup "apply to"');	
									goNext = false;
								}
							}*/
						}
						
					}
				}
			}
			
			foundone = atleastonechecked(theForm.timeZoneRulesApplyto);
			if(!foundone)
			{	alert('Error: Missing Time Zone Rules Choice');	
				goNext = false;
			}
			else
			{
					
				//build the timeZoneStr
				theForm.timeZoneRulesStr.value = "";
				var tmp = "";
				if(theForm.timezone_selectedrules.options.length ==0 && theForm.timeZoneRulesApplyto[2].checked == false ){
					alert("Error: No rule were selected in Time Zone Setup. Try using the \'None\' option instead.");
					goNext=false;
				}
				else{
					for(var i = 0; i < theForm.timezone_selectedrules.options.length; i++)
					{
						tmp	+= theForm.timezone_selectedrules.options[i].value;
						if(i != theForm.timezone_selectedrules.options.length-1)
							tmp += "^";
					}
					theForm.timeZoneRulesStr.value = tmp;
					
					document.callingList.submitHiddenButton.click();	
				}
			}
		break;
		case "6":	//this is just the statistic panel... go next anyway			
			document.callingList.submitHiddenButton.click();			
		break;
		default:
			//we should never come here...
			
	}
}

function atleastonechecked(radioObj)
{
	var foundone = false;
	for(var i = 0; i < radioObj.length; i++)
	{
		if(radioObj[i].checked)	
		{
			foundone = true;
			break;
		}
	}
	return foundone;
}


function onClickFileExt()
{
	var selectedValue = "";
	for (var counter = 0; counter < document.callingList.file_extension.length; counter++)
	{		
		if (document.callingList.file_extension[counter].checked)
		{
			selectedValue = document.callingList.file_extension[counter].value;
			break;
		}
	}
	
	if( selectedValue == 'csv' )
	{
		document.callingList.csv_delimiter.disabled = false;
		document.callingList.csv_quote.disabled		= false;
	}
	else if(selectedValue=='txt')
	{
		document.callingList.csv_delimiter.value = "tab";
		document.callingList.csv_quote.value 	 = "double";
		document.callingList.csv_delimiter.disabled = true;
		document.callingList.csv_quote.disabled		= true;
	}
	else
	{
		document.callingList.csv_delimiter.value = "";
		document.callingList.csv_quote.value 	 = "";
		document.callingList.csv_delimiter.disabled = true;
		document.callingList.csv_quote.disabled		= true;
	}
}

function clickOnFileColumn(colNumber)
{
	var tdObjs = document.getElementsByTagName("td");
		
	for(var i = 0; i < tdObjs.length; i++)
	{		
		if(tdObjs[i].id == 'id_file_column_'+colNumber) //select it
		{
			if(tdObjs[i].getAttribute("isFirstLine") == "true")
				tdObjs[i].style.backgroundColor = '#BBBBBB';
			else			
				tdObjs[i].style.backgroundColor = '#E2EBF3';
		}
		else if(tdObjs[i].id.indexOf('id_file_column_') == 0)
		{
			if(tdObjs[i].getAttribute("isFirstLine") == "true")
				tdObjs[i].style.background = 'ThreeDFace';
			else			
				tdObjs[i].style.backgroundColor = '#FFFFFF';
		}
	}
	
	associationFileField = colNumber;
	if(associationTableField != "") //we already selected a table field, do the association
	{
		doAssociationBetweenFields(associationTableField, associationFileField, associationTableName);
		associationFileField 	= "";
		associationTableField	= "";
	}
}

function clickOnTableColumn(colNumber, colName)
{
	var tdObjs = document.getElementsByTagName("tr");
		
	for(var i = 0; i < tdObjs.length; i++)
	{		
		if(tdObjs[i].id == 'tr_id_c_'+colNumber)
		{
			tdObjs[i].style.background = '#BBBBBB';
		}
		else if(tdObjs[i].id.indexOf('tr_id_c_') == 0)
		{
			if( (i%2) == 0)
				tdObjs[i].style.background = '#FFFFFF';
			else
				tdObjs[i].style.background = '#EFEFEF';
		}		
	}
	
	
	associationTableField = colNumber;
	associationTableName  = colName;
	if(associationFileField != "") //we already selected a file field, do the association
	{
		doAssociationBetweenFields(associationTableField, associationFileField, associationTableName);
		associationFileField 	= "";
		associationTableField	= "";
		associationTableName	= "";
	}	
	
}

function existAssociationForField( fileFieldNum)
{
	var alreadyAssociated = false; 	//Verifier que le champ dans la table n'est pas deja associe,
									//si oui, faire une nouvelle association
	for(var i = 0; i < associationVector.length; i++)
	{
		if( associationVector[i].FileNum == fileFieldNum ) //humm, this one already has an association...
		{
			alreadyAssociated = true;
			break;
		}
	}
	return alreadyAssociated;
}


function doAssociationBetweenFields(tableFieldNum, fileFieldNum, colunmNameinDB)
{
	var alreadyAssociated = false; 	//Verifier que le champ dans la table n'est pas deja associe,
									//si oui, faire une nouvelle association
	for(var i = 0; i < associationVector.length; i++)
	{
		if( associationVector[i].TableNum == tableFieldNum ) //humm, this one already has an association...
		{
			associationVector[i].FileNum = fileFieldNum;
			alreadyAssociated = true;
			break;
		}
	}
	
	if(!alreadyAssociated) //we have a new assocation to do here...
	{
		var newAssoc = new fieldAssoc();
		newAssoc.TableNum 	= tableFieldNum;
		newAssoc.FileNum	= fileFieldNum;
		if(colunmNameinDB)
			newAssoc.ColNameInBD = colunmNameinDB;
		associationVector.push(newAssoc);
	}
	
	//write now the number in the C TD
	var cTdObj = document.getElementById('id_c_'+tableFieldNum);
	if( cTdObj )
	{
		cTdObj.innerHTML = fileFieldNum;
	}	
}


function createNewFieldsFromFistLine(ischecked)
{
	var oneadded = false;
	if(ischecked)
	{ //if the guy has clicked on ischecked...
		var listTds = document.getElementsByTagName("td");
		for(var i = 0; i < listTds.length; i++)
		{
			if( listTds[i].id.indexOf('id_file_column_') == 0 && listTds[i].getAttribute('isFirstLine') == "true" )
			{
				if( !tableFiedAlreadyExist(listTds[i].innerText) )
				{
					//Add a new table field...
					var newTableField = new tableField();					
					newTableField.ColNum		= tableFieldsVector.length;
					newTableField.tableName		= listTds[i].innerText;
					newTableField.isNewCreated  = "true";
					tableFieldsVector.push( newTableField );
					oneadded = true;
				}
			}
		}
		if(oneadded)
		{
			var obj = document.getElementById('div_table_columns');
			if(obj)
				obj.innerHTML = buildHTMLFromTableFieldList();
		}
	}
}

function updateTableFieldList(newTableName, newTablePlace)
{
	//tableFieldsVector	
}

function buildHTMLFromTableFieldList()
{
	var sReturn = "";
	sReturn += '<table>';
	sReturn += '<tr><td style="background:	ThreeDFace;" align="center">&nbsp;C&nbsp;</td><td style="background:ThreeDFace;">'+MultiArray["Table columns"][lang]+'</td></tr>';								
	var color = '#FFFFFF';
	for(var i = 0; i < tableFieldsVector.length; i++)
	{
		sReturn += '<tr id="tr_id_c_'+tableFieldsVector[i].ColNum+'" bgcolor="'+color+'" onClick="javascript:clickOnTableColumn(\''+tableFieldsVector[i].ColNum+'\', \''+tableFieldsVector[i].tableName+'\')">';
		sReturn += '<td id="id_c_'+tableFieldsVector[i].ColNum+'" align=\"center\">';
		var tmpObj = null;	
		for(var j = 0; j < associationVector.length; j++)
		{
			if(associationVector[j].TableNum == tableFieldsVector[i].ColNum)
			{
				sReturn += associationVector[j].FileNum;
				break;
			}
		}		
		sReturn += '</td>';
		sReturn += '<td>'+tableFieldsVector[i].tableName+'</td>';
		sReturn += '</tr>';
		
		if(color == '#FFFFFF')
			color = '#EFEFEF';
		else
			color = '#FFFFFF';
	}
	sReturn += '</table>';
	
	//Mark associations...
	
	return sReturn;
}

function tableFiedAlreadyExist(testFieldName)
{
	var bRet = false;
	for(var i = 0; i < 	tableFieldsVector.length; i++)
	{
		if(tableFieldsVector[i].tableName == testFieldName)
		{
			bRet = true;
			break;
		}		
	}
	return bRet;
}


function js_similar_char(txt1, len1, txt2, len2)
{		
	var sum;
	var pos1 = 0, pos2 = 0, maxi = 0;
	var tmpArray = js_similar_str(txt1, len1, txt2, len2, pos1, pos2, maxi);		
	pos1 = tmpArray[0];
	pos2 = tmpArray[1];
	maxi = tmpArray[2];
	
	sum = maxi;
	
	if(sum)
	{
		if (pos1 && pos2) 
		{
			sum += js_similar_char(txt1, pos1, txt2, pos2);
		}
		if ((pos1 + maxi < len1) && (pos2 + maxi < len2)) 
		{				
			sum += js_similar_char(txt1.substring(pos1 + maxi, txt1.length), len1 - pos1 - maxi, txt2.substring(pos2 + maxi, txt2.length), len2 - pos2 - maxi);
		}
	}		
	return sum;
}
	
function js_similar_str(txt1, len1, txt2, len2, pos1, pos2, maxi)
{		
	var p, q;
	var end1 = len1;
	var end2 = len2;
	maxi = 0;
	for (p = 0; p < end1; p++) 
	{			
		for (q = 0; q < end2; q++) 
		{
			//for (l = 0; (p + l < end1) && (q + l < end2) && (p[l] == q[l]); l++);
			for (l = 0; (p + l < end1) && (q + l < end2) && (txt1.charAt(p+l) == txt2.charAt(q+l)); l++);
			if (l > maxi) 
			{					
				maxi = l;					
				pos1 = p;					
				pos2 = q;
			}
		}
	}		
	return Array(pos1, pos2, maxi);
}

function getStrSimularity(str1, str2)
{
	var pourc = 0.00;
	if(str1.length + str2.length == 0)
		pourc = 0.00;
	else
	{
		pourc = js_similar_char(str1, str1.length, str2, str2.length);
		pourc = (pourc*200.0)/(str1.length+str2.length);		
	}
	return pourc;
}


function clearAllAssociations()
{
	associationVector = new Array();
	var obj = document.getElementById('div_table_columns');
	if(obj)
		obj.innerHTML = buildHTMLFromTableFieldList();
}

function autoFillsColumns()
{
	//Try to do correspondance between fields....
	showPleaseWait('Please wait...');
	
	var shouldreload = false;
	
	var listTds = document.getElementsByTagName("td");
	for(var i = 0; i < listTds.length; i++)
	{
		if( listTds[i].id.indexOf('id_file_column_') == 0 && listTds[i].getAttribute('isFirstLine') == "true" ) //this is a field in the csv book
		{
			if( !tableFiedAlreadyExist(listTds[i].innerText) ) //table does not exist.. create it and do association...
			{
				//Add a new table field...
				var newTableField = new tableField();					
				newTableField.ColNum		= tableFieldsVector.length;
				newTableField.tableName		= listTds[i].innerText;
				newTableField.isNewCreated  = "true";
				tableFieldsVector.push( newTableField );
				//do association...
				if(!existAssociationForField(newTableField.ColNum))
				{
					var newAssocication = new fieldAssoc();
					newAssocication.TableNum = newTableField.ColNum;
					newAssocication.FileNum  = listTds[i].id.substring( 'id_file_column_'.length );
					newAssocication.ColNameInBD = newTableField.tableName;
					associationVector.push( newAssocication );
					shouldreload = true;			
				}
			}
			else //this table field does not already exist... try to find the best matchup...
			{
				var max_matchup_level = -1.00;
				var max_match = null;
				var cur_match_level;
				for(var j = 0 ; j < tableFieldsVector.length; j++)
				{
					cur_match_level = getStrSimularity(tableFieldsVector[j].tableName, listTds[i].innerText);
					if( cur_match_level > max_matchup_level) //new simularity high
					{
						max_matchup_level = cur_match_level;
						max_match = tableFieldsVector[j];
					}
				}				
				
				//watch if we found a matchup
				if(max_match) //do the machup...
				{
						var newAssocication = new fieldAssoc();
						newAssocication.TableNum = max_match.ColNum;
						newAssocication.FileNum  = listTds[i].id.substring( 'id_file_column_'.length );
						newAssocication.ColNameInBD = max_match.tableName;
						if(!existAssociationForField(newAssocication.FileNum))
						{								
							associationVector.push( newAssocication );
							shouldreload = true;
						}
				}
			}
		}
	}
	
	
	
	if(shouldreload) //we need to reload this...
	{
		var obj = document.getElementById('div_table_columns');
		if(obj)
			obj.innerHTML = buildHTMLFromTableFieldList();		
	}
	
	hidePleaseWait();
}

function showPleaseWait(mess)
{	
	var obj = document.getElementById('TempMessages');	
	document.getElementById('TempMsg').innerHTML = mess;
	obj.style.top = document.body.scrollTop + document.body.clientHeight/2-obj.clientHeight/2;
	obj.style.left = document.body.scrollLeft + document.body.clientWidth/2-obj.clientWidth/2;	
	obj.style.visibility = 'visible';	
}

function hidePleaseWait()
{
	var obj = document.getElementById('TempMessages');
	obj.style.visibility = 'hidden';	
}

/*
var associationVector = new Array();
var tableFieldsVector = new Array();
*/
function buildAssociationVectorFromStr(str)
{
	associationVector = new Array();
	var tmpObj = null;
	var asArray = str.split('|');
	for(var i = 0; i < asArray.length; i++)
	{
		var thisObjAr = asArray[i].split('^');
		tmpObj = new fieldAssoc();
		tmpObj.TableNum = thisObjAr[0];
		tmpObj.FileNum = thisObjAr[1];
		tmpObj.ColNameInBD = thisObjAr[2];
		associationVector.push(tmpObj);		
	}
}


function buildtableVectorFromStr(str)
{
	tableFieldsVector = new Array();
	var tmpObj = null;
	var asArray = str.split('|');
	for(var i = 0; i < asArray.length; i++)
	{
		var thisObjAr = asArray[i].split('^');
		tmpObj = new tableField();
		tmpObj.ColNum = thisObjAr[0];
		tmpObj.tableName = thisObjAr[1];
		tmpObj.isNewCreated = thisObjAr[2];
		tableFieldsVector.push(tmpObj);		
	}
}


/**
	Functions for Sql Rows insertion statistics
*/
/*
function insertStatus_changeStatusTo(str)
{
	
	var obj = document.getElementById('liveStats_status');
	if(obj)
		obj.innerHTML = str;
	
}
*/
/*
function insertStatus_increaseProcesses()
{
	var obj = document.getElementById('liveStats_processed');
	if(obj)
	{
		totalProceed = parseInt(obj.innerHTML)+1;
		obj.innerHTML = totalProceed;
	}
	insertStatus_updateProgressBar();
}
*/

/*
function insertStatus_increaseInserted()
{
	var obj = document.getElementById('liveStats_inserted');
	if(obj)
		obj.innerHTML = parseInt(obj.innerHTML)+1;
}
*/

/*
function insertStatus_increaseErrors()
{
	var obj = document.getElementById('liveStats_errors');
	if(obj)
		obj.innerHTML = parseInt(obj.innerHTML)+1;
}

*/
/*
function insertStatus_increaseSqlExecTime(dt)
{
	
	totalSQLExecutionTime += dt;	
	var obj = document.getElementById('liveStats_time');
	if(obj)
	{		
		obj.innerHTML = buildReadbleTime(currentTimestamp() - sqlInsertionStart) + ' <br>[SQL: '+totalSQLExecutionTime+' ms]';
	}
}
*/

function currentTimestamp()
{
	var now = new Date();
	var ts = new Array(
	now.getFullYear().toString(),
	now.getMonth().toString(),
	now.getDay().toString(),
	now.getHours().toString(),
	now.getMinutes().toString(),
	now.getSeconds().toString())
	var i;
	var retval = '';
	
	//pad one-digit values to two and concatenate
	//the order is yyyymmddhhnnss
	for (i=0; i < ts.length; i++)
	{
		if (ts[i].length < 2) ts[i] = '0' + ts[i];
			retval += ts[i];
	}
	return (parseInt(retval));
}

function buildReadbleTime(millisecond)
{
	var sReturn = "";
	var hh = 0;
	var mm = 0;
	var ss = 0;
	var tmp = Math.floor(millisecond/1000);
	hh = Math.floor(tmp/3600);	
	tmp = tmp - 3600*hh;
	mm = Math.floor(tmp/60);
	tmp = tmp-60*mm;
	ss = tmp;
	
	
	if(hh < 10)
		sReturn += '0';
	sReturn += hh;
	sReturn += ':';
	if(mm < 10)
		sReturn += '0';
	sReturn += mm;
	sReturn += ':';
	if(ss < 10)
		sReturn += '0';
	sReturn += ss;
	return sReturn;	
}

function updateStatisticsCallBack()
{
	var tmpFile = null;			
	tmpFile = document.createElement("script");	
	tmpFile.src = "callingListStats.js.jsp?actionType=GetStatistics&timestamp="+currentTimestamp()+"&rand="+Math.random();
	tmpFile.type = "text/javascript";
	document.body.appendChild(tmpFile);
	//document.body.removeChild(tmpFile);
	//tmpFile = null;
	
	//now do the graphical stuff
	var obj = document.getElementById('liveStats_status');
	if(obj)
	{
		if(loadingCurrentStatus == "")
			obj.innerHTML = "&nbsp;";
		else
			obj.innerHTML = loadingCurrentStatus;		
	}
	obj = document.getElementById('liveStats_processed');
	if(obj)
	{		
		obj.innerHTML = totalProceed;
	}
	
	obj = document.getElementById('liveStats_errors');
	if(obj)
		obj.innerHTML = totalErrors;
	obj = document.getElementById('liveStats_inserted');
	if(obj)
		obj.innerHTML = totalSuccess;
	obj = document.getElementById('liveStats_pourcentageCompleted');
	if(obj)
	{
		if(totalPercentComplStr == "")
			obj.innerHTML = "&nbsp;";
		else
		{
			var theStr = (Math.round(totalPercentCompl*100)/100);
			obj.innerHTML = theStr+'%';
		}
	}
	obj = document.getElementById('liveStats_time');
	if(obj)
	{
		obj.innerHTML = buildReadbleTime(totalcurentElapsedTime);
	}
	updateLoaderProgressBar();		
}

function updateStatisticsStatusCallBack()
{
	window.status = 'updateStatisticsStatusCallBack';
	var tmpFile = null;			
	tmpFile = document.createElement("script");	
	tmpFile.src = "callingListStatusStats.js.jsp?actionType=GetStatistics&timestamp="+currentTimestamp()+"&rand="+Math.random();
	tmpFile.type = "text/javascript";
	document.body.appendChild(tmpFile);
	//document.body.removeChild(tmpFile);
	//tmpFile = null;
	
	//tableOfQueriesStatus = new Array();
	//tableOfQueriesMessages = new Array();	
	//now do the graphical stuff
	var obj = null;
	
	
	//hours
	obj = document.getElementById('afterQueries_DailyHoursStatus');	
	if(typeof(tableOfQueriesStatus["DAILY HOURS"]) == 'undefined' || tableOfQueriesStatus["DAILY HOURS"] == "")
		obj.innerHTML = "&nbsp;";
	else
	{
		obj.innerHTML = tableOfQueriesStatus["DAILY HOURS"];
		obj = document.getElementById('afterQueries_DailyHours');
		obj.style.color = "#000000";
		if(tableOfQueriesStatus["DAILY HOURS"] == "In Progress")
			obj.style.color = "#009966";
	}
	obj = document.getElementById('afterQueries_DailyHoursMessage');
	if(typeof(tableOfQueriesMessages["DAILY HOURS"]) == 'undefined' || tableOfQueriesMessages["DAILY HOURS"] == "")
		obj.innerHTML = "&nbsp;";
	else
		obj.innerHTML = tableOfQueriesMessages["DAILY HOURS"];
		
	
	//extra data
	obj = document.getElementById('afterQueries_ExtraDataStatus');	
	if(typeof(tableOfQueriesStatus["EXTRA DATA"]) == 'undefined' || tableOfQueriesStatus["EXTRA DATA"] == "")
		obj.innerHTML = "&nbsp;";
	else
	{
		obj.innerHTML = tableOfQueriesStatus["EXTRA DATA"];
		obj = document.getElementById('afterQueries_ExtraData');
		obj.style.color = "#000000";
		if(tableOfQueriesStatus["EXTRA DATA"] == "In Progress")
			obj.style.color = "#009966";
	}
	obj = document.getElementById('afterQueries_ExtraDataMessage');
	if(typeof(tableOfQueriesMessages["EXTRA DATA"]) == 'undefined' || tableOfQueriesMessages["EXTRA DATA"] == "")
		obj.innerHTML = "&nbsp;";
	else
		obj.innerHTML = tableOfQueriesMessages["EXTRA DATA"];
		
	
	//non numeric phones
	obj = document.getElementById('afterQueries_NonNumericStatus');	
	if(typeof(tableOfQueriesStatus["NON_NUMERIC_PHONES"]) == 'undefined' || tableOfQueriesStatus["NON_NUMERIC_PHONES"] == "")
		obj.innerHTML = "&nbsp;";
	else
	{
		obj.innerHTML = tableOfQueriesStatus["NON_NUMERIC_PHONES"];
		obj = document.getElementById('afterQueries_NonNumeric');
		obj.style.color = "#000000";
		if(tableOfQueriesStatus["NON_NUMERIC_PHONES"] == "In Progress")
			obj.style.color = "#009966";
	}
	obj = document.getElementById('afterQueries_NonNumericMessage');
	if(typeof(tableOfQueriesMessages["NON_NUMERIC_PHONES"]) == 'undefined' || tableOfQueriesMessages["NON_NUMERIC_PHONES"] == "")
		obj.innerHTML = "&nbsp;";
	else
		obj.innerHTML = tableOfQueriesMessages["NON_NUMERIC_PHONES"];
		
	
	//prefix rules
	obj = document.getElementById('afterQueries_PrefixRulesStatus');	
	if(typeof(tableOfQueriesStatus["PREFIX_RULES"]) == 'undefined' || tableOfQueriesStatus["PREFIX_RULES"] == "")
		obj.innerHTML = "&nbsp;";
	else
	{
		obj.innerHTML = tableOfQueriesStatus["PREFIX_RULES"];
		obj = document.getElementById('afterQueries_PrefixRules');
		obj.style.color = "#000000";
		if(tableOfQueriesStatus["PREFIX_RULES"] == "In Progress")
			obj.style.color = "#009966";
	}
	obj = document.getElementById('afterQueries_PrefixRulesMessage');
	if(typeof(tableOfQueriesMessages["PREFIX_RULES"]) == 'undefined' || tableOfQueriesMessages["PREFIX_RULES"] == "")
		obj.innerHTML = "&nbsp;";
	else
		obj.innerHTML = tableOfQueriesMessages["PREFIX_RULES"];
			
	
	//time zones
	obj = document.getElementById('afterQueries_TimeZonesStatus');	
	if(typeof(tableOfQueriesStatus["TIME_ZONE_SETUP"]) == 'undefined' || tableOfQueriesStatus["TIME_ZONE_SETUP"] == "")
		obj.innerHTML = "&nbsp;";
	else
	{
		obj.innerHTML = tableOfQueriesStatus["TIME_ZONE_SETUP"];
		obj = document.getElementById('afterQueries_TimeZones');
		obj.style.color = "#000000";
		if(tableOfQueriesStatus["TIME_ZONE_SETUP"] == "In Progress")
			obj.style.color = "#009966";
	}
	obj = document.getElementById('afterQueries_TimeZonesMessage');
	if(typeof(tableOfQueriesMessages["TIME_ZONE_SETUP"]) == 'undefined' || tableOfQueriesMessages["TIME_ZONE_SETUP"] == "")
		obj.innerHTML = "&nbsp;";
	else
		obj.innerHTML = tableOfQueriesMessages["TIME_ZONE_SETUP"];	
}

function updateLoaderProgressBar()
{
	if(totalPercentCompl > 100)
		totalPercentCompl = 100;
	var obj = document.getElementById('liveStats_progress_left');
	var obj2 = document.getElementById('liveStats_progress_right');
	if(obj && obj2)
	{
		//alert(pourc);
		var width = Math.round(totalPercentCompl);
		obj.style.width = width+'%';
		obj2.style.width = (100-width)+'%';		
	}
}

function changeLoaderStatus(newStatus)
{
	var tmpFile = null;			
	tmpFile = document.createElement("script");	
	tmpFile.src = "callingListStats.js.jsp?actionType=ChangeStatus&newStatus="+newStatus+"&timestamp="+currentTimestamp()+"&rand="+Math.random();
	tmpFile.type = "text/javascript";
	document.body.appendChild(tmpFile);
	document.body.removeChild(tmpFile);
	tmpFile = null;
}


function callback()
{
	updateStatisticsCallBack();
	var obj  = document.getElementById('insertPauseButton');
	
	if(loadingCurrentStatus != 'Inserting...' && loadingCurrentStatus != 'Paused' && loadingCurrentStatus != '')
	{
		var obj2 = document.getElementById('insertStopButton');
		
		//this is completed... stop the thread...
		obj.disabled = true;
		obj2.disabled = true;		
		clearInterval(interId);	
		if(totalErrors > 0)
		{
			//var obj3 = document.getElementById('insertLogErrorButton');
			//obj3.style.visibility = 'visible';
		}
		//enable the next button
		document.callingList.nextInfo.disabled = false;
		
	}
	else
	{
		if(loadingCurrentStatus == 'Inserting...')
			obj.value = 'Pause';
		else if(loadingCurrentStatus == 'Paused')
			obj.value = 'Resume';
	}
}

function callbackQueryStatus()
{	
	updateStatisticsStatusCallBack();
	
	if( (tableOfQueriesStatus["DAILY HOURS"] == "Completed" || tableOfQueriesStatus["DAILY HOURS"] == "Failed" || tableOfQueriesStatus["DAILY HOURS"] == "No action")
		&& (tableOfQueriesStatus["EXTRA DATA"] == "Completed" || tableOfQueriesStatus["EXTRA DATA"] == "Failed" || tableOfQueriesStatus["EXTRA DATA"] == "No action")
		&& (tableOfQueriesStatus["NON_NUMERIC_PHONES"] == "Completed" || tableOfQueriesStatus["NON_NUMERIC_PHONES"] == "Failed" || tableOfQueriesStatus["NON_NUMERIC_PHONES"] == "No action")
		&& (tableOfQueriesStatus["PREFIX_RULES"] == "Completed" || tableOfQueriesStatus["PREFIX_RULES"] == "Failed" || tableOfQueriesStatus["PREFIX_RULES"] == "No action")
		&& (tableOfQueriesStatus["TIME_ZONE_SETUP"] == "Completed" || tableOfQueriesStatus["TIME_ZONE_SETUP"] == "Failed" )	|| tableOfQueriesStatus["TIME_ZONE_SETUP"] == "No action")
	{		
		//stop the call back
		clearInterval(interId);
		document.callingList.nextInfo.disabled = false;		
	}
}

function saveCallingListSettings(formatName)
{
	//close the dialog
	if(formatName != "")
	{
		closeSettingDialog();
		//open the saving tab
		showPleaseWait('Please wait...');
		var tmpFile = null;			
		tmpFile = document.createElement("script");	
		tmpFile.src = "callingListAction.js.jsp?actionType=SaveThisListSettings&formatName="+formatName+"&timestamp="+currentTimestamp()+"&rand="+Math.random();
		tmpFile.type = "text/javascript";
		document.body.appendChild(tmpFile);
		
		//close the saving tab
		setTimeout('hidePleaseWait()',500);
		var obj = document.getElementById('savebutton');
		obj.disabled = true;
	}
	else
	{
		alert('Specify format name');
	}	
}

function showSaveFormatDialog()
{
	var obj = document.getElementById('divSaveSettings');	
	if(obj)
	{
		//obj.style.top = document.body.scrollTop + document.body.clientHeight/2-obj.clientHeight/2;
		//obj.style.left = document.body.scrollLeft + document.body.clientWidth/2-obj.clientWidth/2;	
		obj.style.visibility = 'visible';
	}
}

function closeSettingDialog()
{
	var obj = document.getElementById('divSaveSettings');	
	if(obj)
		obj.style.visibility = 'hidden';
}

function askForLogErrorDisplay()
{
	var tmpFile = null;			
	tmpFile = document.createElement("script");	
	tmpFile.src = "callingListStats.js.jsp?actionType=GetErrorsLog&timestamp="+currentTimestamp()+"&rand="+Math.random();
	tmpFile.type = "text/javascript";
	document.body.appendChild(tmpFile);
	//document.body.removeChild(tmpFile);
	tmpFile = null;
	//alert('Before displayLogErrors');
	
	displayLogErrors(errorLogText);
}

function displayLogErrors(buffer)
{
	//alert('inside displayLogErrors');
	var obj = document.getElementById('liveStatErrorLog_table');
	obj.style.visibility = 'visible';
	obj = document.getElementById('liveStats_errorsLog');
	if(obj)
		obj.innerText = buffer;	
}

function adviceUrls()
{
/*	var obj = document.callingList.defined_urls;
	if( obj )
	{		
		var tmpFile = null;			
		tmpFile = document.createElement("script");	
		tmpFile.src = "callingListStats.js.jsp?actionType=GetErrorsLog&timestamp="+currentTimestamp()+"&rand="+Math.random();
		tmpFile.type = "text/javascript";
		document.body.appendChild(tmpFile);
		//document.body.removeChild(tmpFile);
		tmpFile = null;
	}*/
}

function chkAndAddTimeZoneRule()
{
	var selectedobj = null;
	var theForm = document.callingList;
	var foundat = null;
	if(theForm)
	{
		for(var i = 0; i < theForm.timezone_availablerules.options.length; i++)
		{
			if(	theForm.timezone_availablerules.options[i].selected == true)
			{
				selectedobj = theForm.timezone_availablerules.options[i];
				foundat = i;
				break;
			}
		}
		
		if(selectedobj)
		{
			var tmp = new Option(selectedobj.text, selectedobj.value);
			theForm.timezone_selectedrules.options[theForm.timezone_selectedrules.options.length] = tmp;
			for(var i = foundat; i < theForm.timezone_availablerules.options.length-1; i++)
			{
				var tmp2 = new Option(theForm.timezone_availablerules.options[i+1].text, theForm.timezone_availablerules.options[i+1].value);
				theForm.timezone_availablerules.options[i] = tmp2;
			}
			theForm.timezone_availablerules.options.length = theForm.timezone_availablerules.options.length-1;
		}
	}
}


function chkAndDropTimeZoneRule()
{
	var selectedobj = null;
	var theForm = document.callingList;
	var foundat = null;
	if(theForm)
	{
		//timezone_selectedrules
		//timezone_availablerules
		for(var i = 0; i < theForm.timezone_selectedrules.options.length; i++)
		{
			if(	theForm.timezone_selectedrules.options[i].selected == true)
			{
				selectedobj = theForm.timezone_selectedrules.options[i];
				foundat = i;
				break;
			}
		}
		
		if(selectedobj)
		{
			var tmp = new Option(selectedobj.text, selectedobj.value);
			theForm.timezone_availablerules.options[theForm.timezone_availablerules.options.length] = tmp;
			for(var i = foundat; i < theForm.timezone_selectedrules.options.length-1; i++)
			{
				var tmp2 = new Option(theForm.timezone_selectedrules.options[i+1].text, theForm.timezone_selectedrules.options[i+1].value);
				theForm.timezone_selectedrules.options[i] = tmp2;
			}
			theForm.timezone_selectedrules.options.length = theForm.timezone_selectedrules.options.length-1;
		}
	}
}


function moveTimeZoneRuleUp()
{
	var selectedObj = null;
	var foundat = null;
	var theForm = document.callingList;
	if(theForm)
	{
		for(var i = 0; i < theForm.timezone_selectedrules.options.length; i++)
		{
			if(	theForm.timezone_selectedrules.options[i].selected == true )
			{
				selectedObj = theForm.timezone_selectedrules.options[i];
				foundat = i;
			}
		}
		
		if(foundat != null)
		{
			if(foundat != 0)
			{
				var tmpValue 	= theForm.timezone_selectedrules.options[foundat].value;
				var tmpText 	= theForm.timezone_selectedrules.options[foundat].text;
				theForm.timezone_selectedrules.options[foundat].value = theForm.timezone_selectedrules.options[foundat-1].value;
				theForm.timezone_selectedrules.options[foundat].text  = theForm.timezone_selectedrules.options[foundat-1].text;
				theForm.timezone_selectedrules.options[foundat-1].value = tmpValue;
				theForm.timezone_selectedrules.options[foundat-1].text  = tmpText;
				theForm.timezone_selectedrules.options[foundat-1].selected = true;
			}			
		}
	}
}

function moveTimeZoneRuleDown()
{
	var selectedObj = null;
	var foundat = null;
	var theForm = document.callingList;
	if(theForm)
	{
		for(var i = 0; i < theForm.timezone_selectedrules.options.length; i++)
		{
			if(	theForm.timezone_selectedrules.options[i].selected == true )
			{
				selectedObj = theForm.timezone_selectedrules.options[i];
				foundat = i;
			}
		}		
		
		if(foundat != null)
		{
			
			if(foundat != theForm.timezone_selectedrules.options.length-1)
			{
				var tmpValue 	= theForm.timezone_selectedrules.options[foundat].value;
				var tmpText 	= theForm.timezone_selectedrules.options[foundat].text;
				theForm.timezone_selectedrules.options[foundat].value = theForm.timezone_selectedrules.options[foundat+1].value;
				theForm.timezone_selectedrules.options[foundat].text  = theForm.timezone_selectedrules.options[foundat+1].text;
				theForm.timezone_selectedrules.options[foundat+1].value = tmpValue;
				theForm.timezone_selectedrules.options[foundat+1].text  = tmpText;
				theForm.timezone_selectedrules.options[foundat+1].selected = true;
			}			
		}
	}
}

function selectOptioninSelect(selectobj, value)
{
	for(var i = 0; i < selectobj.options.length; i++)
	{
		if(selectobj.options[i].value == value)
		{
			selectobj.options[i].selected = true;
			break;
		}
	}
}

function checkOptioninradio(radioobj, value)
{
	for(var i = 0; i < radioobj.length; i++)
	{
		if(radioobj[i].value == value)
			radioobj[i].checked = true;
	}
}

function addOptiontoselect(selectobj, text, value)
{
	//alert('here...');
	var opt = new Option(text, value);
	selectobj.options[selectobj.options.length] = opt;
}

function removeOptionfromselect(selectobj, optvalue)
{
	var found = false;
	var foundat = -1;
	for(var i = 0; i < selectobj.options.length; i++)
	{
		if(selectobj.options[i].value == optvalue)
		{
			foundat = i;
			found = true;	
			break;
		}
	}
	
	if(found)
	{
		for(var i = foundat; i < selectobj.options.length-1; i++)
		{
			var tmp2 = new Option(selectobj.options[i+1].text, selectobj.options[i+1].value);
			selectobj.options[i] = tmp2;
		}
		selectobj.options.length = selectobj.options.length-1;
	}		
}

function addCList_finished()
{
	//finally, we have finished...
	document.location.href = "../defaultpage.htm";	
}

function getXmlAllowedUsers()
{
	var theForm = document.callingList;
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