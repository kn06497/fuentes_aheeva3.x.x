<html>
	<head>
		<title>Add a calling list </title>
	</head>
	<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
	<LINK href="style.css" rel="stylesheet" type="text/css" />
	<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="jsUtil.js"></script>
	<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
	<script language="javascript" type="text/javascript" src="Browser.js"></script>
	<script language="javascript" type="text/javascript">

var tenant_dbid = "NULL";
var callingListDBID = "";
var currentFilterDBID = "";
var callingListName = "";

function enabledUpdateButton()
{
	document.callingList.updateInfo.disabled = false;
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
	return;
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
                 alert(arraytrtmts[c]+" <%= pageData.getWord("cannot be choosen. It causes an order conflict with another treatment")%>");
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
        if(myForm.selectedTreatments.options.length <1)
               document.callingList.dropButton.disabled = true;
}


function displayCallingListInfo()
{		
        var name;
        var myForm = document.callingList;
        var i=myForm.selectedTreatments.options.length;
        var j=myForm.availableTreatments.options.length;

        ourCaption   		= document.getElementById("caption");
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
		ourCaption.innerHTML = "<h5><%= pageData.getWord("Add a new Calling list")%></h5>";
		document.callingList.updateInfo.value = "<%= pageData.getWord("Save")%>";
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
		ourCaption.innerHTML = "<h3><%= pageData.getWord("Modify Calling list information")%></h3>";
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
				if(arrayDetails[i] == "10000")
				{
					document.callingList.UnlimitCkB.checked = true;
					document.callingList.MaxAttemptsTxt.disabled = true;
					document.callingList.MaxAttemptsTxt.value = "";
				}
				else
				{
					document.callingList.UnlimitCkB.checked = false;
					document.callingList.MaxAttemptsTxt.disabled = false;
					document.callingList.MaxAttemptsTxt.value = arrayDetails[i];
				}
			    /***var attempts = arrayDetails[i];
                            for (j = 0; j <document.callingList.max_attempts.options.length; j++){
        //			myOption = new Option(arrayGroups[j],arrayGroups[j])
        			if(attempts == document.callingList.max_attempts.options[j].value )
         			 { document.callingList.max_attempts.options[j].selected = true; break;}
         		    } *****/
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

function saveCallingList()
{

	var state = '';
	var max_attempts = '';
	if(document.callingList.state.checked)
		state = 1;
	else
		state = 0;

   if(document.callingList.table_name.value.length == 0)
   {
   		alert('<%= pageData.getWord("You must enter the table name associated with this list")%>');
   		return false;
   }
   
   if(validation(document.callingList.name.value)==0)
   {
   		alert('<%= pageData.getWord("Invalid use of character")%>');
		document.callingList.name.focus();
		return false;
   }
   else if(validation(document.callingList.description.value)==0)
   {
   		alert('<%= pageData.getWord("Invalid use of character")%>');
		document.callingList.description.focus();
		return false;
   }
   else if(validation(document.callingList.table_name.value)==0)
   {
   		alert('<%= pageData.getWord("Invalid use of character")%>');
		document.callingList.table_name.focus();
		return false;
   } 
   else if(validation(document.callingList.MaxAttemptsTxt.value)==0)  
   {
   		alert('<%= pageData.getWord("Invalid use of character")%>');
		document.callingList.MaxAttemptsTxt.focus();
		return false;
   } 
						
						
		
		  
	
   var alReadyExist = false;
   if( (max_attempts == '') || (max_attempts == "") )
   {
   		max_attempts = "10000";
   }
   
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
			alert('<%= pageData.getWord("Calling list already exists")%>');
	else
		{
		appletObj.saveCallingList(
						tenant_dbid,
						callingListDBID,
						document.callingList.name.value,
						document.callingList.description.value,
						document.callingList.table_name.value,
						document.callingList.selectedFilter.value,
						state,
						max_attempts);//document.callingList.max_attempts.value);-----------------------
		// disable the update button
		document.callingList.updateInfo.disabled = true;
		}
}

function checkOnUnload()
{
  	return false;
}

function askDelete()
{
	answer = confirm(<%= pageData.getWord("Are you sure, you wish to delete this calling list?")%>);
	if(answer){
		appletObj.deleteCallingList(callingListDBID);
		// refresh the current page
		//document.location = "./callingList.htm?callinglistName=&tenant_dbid="+tenant_dbid;
		document.location = "../defaultpage.htm";
	}

}
	</script>
	
<body class="bottompagebody" TEXT="#000000" LINK="#000066" VLINK="#666666" onLoad="displayCallingListInfo()"
		onUnload=" return checkOnUnload()">
		<form name="callingList">
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#808080"
				width="56%" id="AutoNumber2" height="37">
				<tr>
					<td width="100%" height="37">
						<table border="0" cellspacing="0" width="606" id="AutoNumber1" height="405" cellpadding="0"
							style="border-width: 0">
							<!--   <tr>
								<td width="424" height="57" align="center" valign="top" style="border-right-style: none; border-right-width: 0" colspan="2"  >&nbsp;
										</td>
								<td width="244" height="57" align="center" valign="top" style="border-right-style: none; border-right-width: 0" colspan="3"  >
										<p style="text-align: center"><b>CALLING LIST INFO&nbsp;</b><p></td>
							 </tr>-->
							<tr>
								<td id="caption" width="2636" height="1" align="left" valign="top" style="border-right-style: none; border-right-width: 0; text-align: center; font-weight:bold;"
									colspan="5">
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td width="599" height="40" align="left" valign="top" style="border-right-style: none; border-right-width: 0; border-top-style:none; border-top-width:1"
									colspan="2">
								<%= pageData.getWord("Name")%>&nbsp;&nbsp;
								</td>
								<td width="162" height="40" align="left" valign="top" style="border-right-style: none; border-right-width: 0; border-top-style:none; border-top-width:1"
									colspan="3">
									<input name="name" size="37" onChange="enabledUpdateButton()" style="float: left">
								</td>
							</tr>
							<tr>
								<td width="920" height="44" align="left" valign="top" style="border-right-style: none; border-right-width: 0"
									colspan="2">
									<p><%= pageData.getWord("Description")%>&nbsp;&nbsp; 
								</td>
								<td width="35" height="44" valign="top" style="border-left-style: none; border-left-width: 0"
									align="left" colspan="3">
									<textarea rows="4" name="description" cols="36" onChange="enabledUpdateButton()"></textarea></td>
							</tr>
							<tr>
								<td width="320" height="40" align="left" valign="top" style="border-right-style: none; border-right-width: 0"
									colspan="2">
									<%= pageData.getWord("Table Name")%></td>
								<td width="2015" height="40" valign="top" style="border-left-style: none; border-left-width: 0; border-bottom-style:none; border-bottom-width:1"
									align="left" colspan="3">
									<input name="table_name" size="37" onChange="enabledUpdateButton()"></td>
							</tr>
							<tr>
								<td width="1195" height="40" valign="top" style="border-right-style: none; border-right-width: 0; border-top-style:none; border-top-width:1"
									align="left">
									<%= pageData.getWord("Selected filter")%></td>
								<td width="1427" height="40" valign="top" style=" border-right-width: 0; border-top-style:none; border-top-width:1"
									colspan="4" align="left">
									<input type="text" name="selectedFilter" size="37" disabled="true" value="">&nbsp;&nbsp;
									<button name="RemoveFilterButton" onClick="removeAssociatedFilter()">--</button>
								</td>
							</tr>
							<tr>
								<td width="1195" height="70" valign="top" style="border-right-style: none; border-right-width: 0; "
									align="left">
									<%= pageData.getWord("Available Filters")%></td>
								<td width="1427" height="70" valign="top" style="border-right-style: none; border-right-width: 0"
									colspan="4">
									<select width="275" size="4" style="width: 275px" name="availableFilters" onChange="enabledAddFilterButton()">
									</select>&nbsp;&nbsp;
									<button name="addFilter" disabled="true" onClick="AddSelectedFilter()"><%= pageData.getWord("Add this filter")%></button>
								</td>
							</tr>
							<tr>
								<td width="2561" height="150" valign="top" style="border-top-style:none; border-top-width:1; border-left-style:none; border-left-width:1; border-bottom-style:none; border-bottom-width:1"
									colspan="3">
									<p align="center"><%= pageData.getWord("Available Treatments")%>
										<select width="300" style="width: 320; height:120; font-size: 8pt; font-weight: bold" name="availableTreatments" size="5" 
										multiple onChange="enabledAddButton()">
										</select></p>
								</td>
								<td width="60" height="150" valign="top" style="border-right-style: none; border-right-width: medium; border-top-style:none; border-top-width:1; border-left-style:none; border-left-width:medium; border-bottom-style:none; border-bottom-width:1">
									<p align="center">&nbsp;
									</p>
									<p align="center">
										<input type="button"  name="dropButton" disabled="true" onClick="chkAndDropTreatmentFromGroup()" value="&lt;&lt;">
									</p>
									<p align="center">
										<input type="button" name="addButton" disabled="true" onClick="chkAndAddTreatmentToGroup()" value="&gt;&gt;">										
									</p>
								</td>
								<td width="276" height="150" valign="top" style="border-right-style: none; border-right-width: 1; border-top-style:none; border-top-width:1; border-left-style:none; border-left-width:medium; border-bottom-style:none; border-bottom-width:1"
									bordercolor="#FFFFFF">
									<p align="center"><%= pageData.getWord("Selected Treatments")%>
										<select width="300" style="width: 320; height:120; font-size: 8pt; font-weight: bold" name="selectedTreatments" size="5" multiple
											onChange="enabledDropButton()">
										</select>
									</p>
									<p>
								</td>
							</tr>
							<tr>
								<td width="2236" valign="top" style="border-right-style: none; border-right-width: 0; "
									colspan="2" height="21">
									<%= pageData.getWord("Active")%></td>
								<td width="325" valign="top" style="border-right-style: none; border-right-width: none; "
									height="21">
									<input type="checkbox" name="state" value="ON" onClick="enableReload();enabledUpdateButton()"
										checked>
								</td>
							</tr>
							<tr>
								<td><strong><%= pageData.getWord("Maximum attempts")%></strong></td>
								<td colspan="2">
									<input type="checkbox" name="UnlimitCkB" value="ON" onClick="enabledUpdateButton();validateMaxAttempts();" checked>
									<strong><%= pageData.getWord("Unlimited")%></strong>						
									<input disabled name="MaxAttemptsTxt" size="3" onChange="validateMaxAttempts();enabledUpdateButton();" style="float: left">
								</td>
							</tr>
							<!---
								<td width="336" valign="top" style="border-style:none; border-width:medium; " colspan="2"
									height="21">
									<script>document.write(MultiArray["Maximum attempts"][lang])</script>
									<select name="max_attempts" onChange="enabledUpdateButton()">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="8">8</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="50">50</option>
										<option value="100">100</option>
										<option value="10000"><script>document.write(MultiArray["Unlimited"][lang])</script></option>
									</select>
								</td>
							</tr>
							--->
						</table>
					</td>
				</tr>
			</table>
				<input disabled="true" name="updateInfo" type="button" value='<%= pageData.getWord("Update")%>' onClick="saveCallingList()">&nbsp;&nbsp;
				<input name="deleteCallList" type="button" value='<%= pageData.getWord("Delete")%>' onClick="askDelete()">
			<!--
			<p>
				<button name="updateInfo" disabled="true" onclick="saveCallingList()" style="width: 59; height: 26">Update</button>&nbsp;&nbsp;
				<button name="deleteCallList" onclick="askDelete()" style="width: 59; height: 26">Delete</button>
			</p>-->
		</form>
</body>
<% pageData.closeConnection(); %>
</html>
