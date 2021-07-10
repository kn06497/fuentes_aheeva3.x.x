var mop_treatment_dbid       	= normalizeString(QueryString('mop_treatment_dbid'));
var mop_treatment_name          	= normalizeString(QueryString('mop_treatment_name'));;
var description         = '';
var tenant_dbid		= normalizeString(QueryString('tenant_dbid'));


function enabledUpdateButton()
{
	document.mop_treatment_form.updateInfo.disabled = false;
}

function displayMopTreatmentInfo()
{
	var myForm = document.mop_treatment_form;
 	mopTreatmentDBID = '';
	//mop_treatment_name = normalizeString(QueryString('mop_treatment_name'));

	if(mop_treatment_name == '' || mop_treatment_name == 'null' || mop_treatment_name == 'NULL')
	{
		document.mop_treatment_form.mopTreatmentName.value = "";
		document.mop_treatment_form.updateInfo.value = MultiArray["Save"][lang];
		document.mop_treatment_form.deleteMopTreatment.disabled = true;
		
		document.getElementById("tabCommissions").style.position = 'absolute';
		document.getElementById("tabCommissions").style.left = '-1000';
		document.getElementById("tabCommissions").style.top = '-1000';
	}
	
	document.mop_treatment_form.mopTreatmentName.value = mop_treatment_name;
	
	var mopTreatsDetails = String(appletObj.getMopTreatmentInfo(mop_treatment_name)); 

	//alert(mopTreatsDetails);
	if (mopTreatsDetails!='') 
	{
		var jsDetails = mopTreatsDetails + "";
		arrayDetails = jsDetails.split("|");

		for (i = 0; i < arrayDetails.length; i++)
		{
			if(i == 0){
				mopTreatmentDBID = arrayDetails[i];
			}
			if(i == 1){ // tenant_dbid
				//alert(arrayDetails[i]);
			}
			if(i == 2){ // name
				document.mop_treatment_form.mopTreatmentName.value = arrayDetails[i];
			}
			if(i == 3){ // description
				if (arrayDetails[i] != "NIL")
					document.mop_treatment_form.mopTreatmentDescription.value = arrayDetails[i];
				else
					document.mop_treatment_form.mopTreatmentDescription.value = "";
			}
			if(i == 4){ // status
				if (arrayDetails[i] == 1) document.mop_treatment_form.mopTreatmentStatus.checked = true;
				else  document.mop_treatment_form.mopTreatmentStatus.checked = false;
			}
			if(i == 5){ // commission type
				if (arrayDetails[i] == '1')  document.mop_treatment_form.mopTreatmentCommission[0].checked = true;
				if (arrayDetails[i] == '2')  document.mop_treatment_form.mopTreatmentCommission[1].checked = true;
				if (arrayDetails[i] == '3')  document.mop_treatment_form.mopTreatmentCommission[2].checked = true;
				if (arrayDetails[i] == '4')  document.mop_treatment_form.mopTreatmentCommission[3].checked = true;
				//if (arrayDetails[i] == '5')  document.mop_treatment_form.mopTreatmentCommission[4].checked = true;
			}
			if(i == 6){ // commission type
				if (document.mop_treatment_form.mopTreatmentCommission[1].checked == true)
				{
					if (arrayDetails[i] == 1) document.mop_treatment_form.treatmentBase2[0].checked = true;
					if (arrayDetails[i] == 2) document.mop_treatment_form.treatmentBase2[1].checked = true;
					if (arrayDetails[i] == 3) document.mop_treatment_form.treatmentBase2[2].checked = true;
				}
				if (document.mop_treatment_form.mopTreatmentCommission[2].checked == true)
				{
					if (arrayDetails[i] == 1) document.mop_treatment_form.treatmentBase3[0].checked = true;
					if (arrayDetails[i] == 2) document.mop_treatment_form.treatmentBase3[1].checked = true;
				}
				
				if (document.mop_treatment_form.mopTreatmentCommission[3].checked == true)
				{
					if (arrayDetails[i] == 1) document.mop_treatment_form.treatmentBase4[0].checked = true;
					if (arrayDetails[i] == 2) document.mop_treatment_form.treatmentBase4[1].checked = true;
				}
				
			}
			if(i == 7){
				document.mop_treatment_form.maxCommissionValue.value = arrayDetails[i];
			}

		} // fin for
		setLegends(mop_treatment_name + " - ");
	} // fin du if (mopTreatsDetails!='') 
	// disable button

	//recueillir les infos de la commission
	var treatComDetails = String(appletObj.getMopTreatmentCommissionInfo(mopTreatmentDBID))
	if (treatComDetails != '')
	{
		var jsDetails = treatComDetails + "";
		arrayDetails = jsDetails.split("|");
		
		if (document.mop_treatment_form.mopTreatmentCommission[0].checked == true) //commission fixe
		{
			
			document.getElementById('commissionDiv1').style.visibility = 'visible';
			document.getElementById('commissionDiv2').style.visibility = 'hidden';
			document.getElementById('commissionDiv3').style.visibility = 'hidden';
			document.getElementById('commissionDiv4').style.visibility = 'hidden';
			//document.getElementById('commissionDiv5').style.visibility = 'hidden';
		}
		else if (document.mop_treatment_form.mopTreatmentCommission[1].checked == true) //commission basée sur les ventes
		{
			document.getElementById('commissionDiv1').style.visibility = 'hidden';
			document.getElementById('commissionDiv2').style.visibility = 'visible';
			document.getElementById('commissionDiv3').style.visibility = 'hidden';
			document.getElementById('commissionDiv4').style.visibility = 'hidden';
			//document.getElementById('commissionDiv5').style.visibility = 'hidden';
		}
		else if (document.mop_treatment_form.mopTreatmentCommission[2].checked == true) //commission basée sur la moyenne du groupe
		{
			document.getElementById('commissionDiv1').style.visibility = 'hidden';
			document.getElementById('commissionDiv2').style.visibility = 'hidden';
			document.getElementById('commissionDiv3').style.visibility = 'visible';
			document.getElementById('commissionDiv4').style.visibility = 'hidden';
			//document.getElementById('commissionDiv5').style.visibility = 'hidden';
		}
		
		else if (document.mop_treatment_form.mopTreatmentCommission[3].checked == true) //commission basée sur la performance
		{
			document.getElementById('commissionDiv1').style.visibility = 'hidden';
			document.getElementById('commissionDiv2').style.visibility = 'hidden';
			document.getElementById('commissionDiv3').style.visibility = 'hidden';
			document.getElementById('commissionDiv4').style.visibility = 'visible';
			//document.getElementById('commissionDiv5').style.visibility = 'hidden';
		}
		/*
		else if (document.mop_treatment_form.mopTreatmentCommission[4].checked == true) //commission basée sur custom
		{
			document.getElementById('commissionDiv1').style.visibility = 'hidden';
			document.getElementById('commissionDiv2').style.visibility = 'hidden';
			document.getElementById('commissionDiv3').style.visibility = 'hidden';
			document.getElementById('commissionDiv4').style.visibility = 'hidden';
			document.getElementById('commissionDiv5').style.visibility = 'visible';
		}
		*/	
		if (document.mop_treatment_form.mopTreatmentCommission[0].checked == true) 
		{
			comDetails = arrayDetails[0].split(",");
			lyr=document.createElement("DIV");
			lyr.id ='t1';
			var nom = 'n1';
			var code='';
			

			code ="<table width='100%'>";
			code += "<TR><TD width='100%' align = 'center'>";
			code += "&nbsp; "+MultiArray["Pay"][lang]+"&nbsp;<input type='text' id='usen1' name='usen1' size='5' height='13' maxlength='5' value='"+comDetails[4]+"'> "+MultiArray["per work hour"][lang];

			code +="</TD></TR>";
			
			lyr.innerHTML = code;
			if (document.getElementById('commissionDiv1').style.visibility == 'visible')
			{
				document.getElementById("addRowButton1").disabled = true;
				document.getElementById("Com_ranges1").appendChild(lyr);
			}
		}
		else if((document.mop_treatment_form.mopTreatmentCommission[1].checked == true) && (document.mop_treatment_form.treatmentBase2[2].checked == true))
		{
			comDetails = arrayDetails[0].split(",");
			lyr=document.createElement("DIV");
			lyr.id ='t1';
			var nom = 'n1';
			var code='';
			

			code ="<table width='100%'>";
			code += "<TR><TD align = 'center'>";
			code += "&nbsp;"+MultiArray["Pay"][lang]+"&nbsp;<input type='text' id='usen1' name='usen1' size='5' height='13' maxlength='5' value='"+comDetails[4]+"'>&nbsp;per sale&nbsp;";

			code +="</TD></TR>";

			lyr.innerHTML = code;
			if (document.getElementById('commissionDiv2').style.visibility == 'visible')
			{
				document.getElementById("addRowButton2").disabled = true;
				document.getElementById("Com_ranges2").appendChild(lyr);
			}
		}
		/*
		else if (document.mop_treatment_form.mopTreatmentCommission[4].checked == true)
		{
		}
		*/
		else
		{
			for (i = 0; i < arrayDetails.length; i++)
			{
				nrows = i + 1;
				comDetails = arrayDetails[i].split(",");
				lyr=document.createElement("DIV");
				lyr.id ='t'+nrows;
				var nom = 'n'+ nrows;
				var nRR_Name, code='';

				code ="<table width='100%'>";
				code += "<TR><TD width='75%' align='center'>";
				code += ""+MultiArray["From"][lang]+"&nbsp;<input type='text' id='inf"+nom+"' name='inf"+nom+"' size='5' height='13' maxlength='5' value='"+comDetails[2]+"'>";
				code += "&nbsp;"+MultiArray["To"][lang]+"&nbsp;<input type='text' id='sup"+nom+"' name='sup"+nom+"' size='5' height='13' maxlength='5' value='"+comDetails[3]+"'>";
				code += "&nbsp;"+MultiArray["Pay"][lang]+"&nbsp;<input type='text' id='use"+nom+"' name='use"+nom+"' size='5' height='13' maxlength='5' value='"+comDetails[4]+"'>";

			

				code +="</TD><td align='center' width='25%'> &nbsp; &nbsp;<a href='javascript:deleteMyRow("+nrows+");'><font face='Arial, Helvetica, sans-serif' size='1' color='#000000'>"+MultiArray["Delete"][lang]+"</font></a></td></TR>";

				lyr.innerHTML = code;
				if (document.getElementById('commissionDiv2').style.visibility == 'visible')
				{
					document.getElementById("Com_ranges2").appendChild(lyr);
				}
				if (document.getElementById('commissionDiv3').style.visibility == 'visible')
				{
					document.getElementById("Com_ranges3").appendChild(lyr);
				}
				if (document.getElementById('commissionDiv4').style.visibility == 'visible')
				{
					document.getElementById("Com_ranges4").appendChild(lyr);
				}
	/*			if (document.getElementById('commissionDiv5').style.visibility == 'visible')
				{
					document.getElementById("Com_ranges5").appendChild(lyr);
				}
	*/			nrows++;
				maxrow++;
				enableUpdateButton();
			}
		}
		
	}// fin du if (treatComDetails != '')
	
}


function validateInfo()
{
	if (document.mop_treatment_form.mopTreatmentName.value =='')
	{
	alert(MultiArray["You must enter a Mop Treatment name"][lang]);

		document.mop_treatment_form.mopTreatmentName.focus();
	}
	else if(validation(document.mop_treatment_form.mopTreatmentName.value)==0)
	{
		alert(MultiArray["Invalid use of character"][lang]);
		document.mop_treatment_form.mopTreatmentName.focus();
	}
	else if(validation(document.mop_treatment_form.mopTreatmentDescription.value)==0)
	{
		alert(MultiArray["Invalid use of character"][lang]);
		document.mop_treatment_form.mopTreatmentDescription.focus();
	}
	else if(document.mop_treatment_form.mopTreatmentCommission.value == '')
	{
		alert(MultiArray["You must select one type of commission for this treatment"][lang]);
	}
	else 
	{             
		var t_name = document.mop_treatment_form.mopTreatmentName.value;
		var jsMopCommissionsNames = appletObj.getMopCommissionsNames(tenant_dbid);
		var arrayMopCommissionsNames = jsMopCommissionsNames.split("|");
		//alert(jsMopCommissionsNames);
		if (mop_treatment_dbid == 'null' || mop_treatment_dbid == '') // vérification de l'unicité de la commission
		{
			//alert(arrayMopCommissionsNames.length)
			for (var i = 0; i < arrayMopCommissionsNames.length; i++)
			{
				if (t_name == arrayMopCommissionsNames[i])
				{
					alert("A commission having this name already exists!! Please change.")
					return false;
				}
			}
		}
		else  // 
		{
			//alert(arrayMopCommissionsNames.length)
			for (var i = 0; i < arrayMopCommissionsNames.length; i++)
			{
				if (arrayMopCommissionsNames[i] != mop_treatment_name && t_name == arrayMopCommissionsNames[i])
				{
					alert("A commission having this name already exists!! Please change.")
					return false;
				}
			}
		}
		

		var dbid = mop_treatment_dbid;//appletObj.getMopTreatmentDBID(t_name); 
		//alert("dbid = "+dbid)
		var description = "";
		if (document.mop_treatment_form.mopTreatmentDescription.value != "")
			description = document.mop_treatment_form.mopTreatmentDescription.value ;
		else
			description = "NIL";
		var max_commission_value = 0;
		if (document.mop_treatment_form.maxCommissionValue.value != "")
			max_commission_value = document.mop_treatment_form.maxCommissionValue.value;
		else
			max_commission_value = 0;
		
		var status = "";
		if (document.mop_treatment_form.mopTreatmentStatus.checked == true) 
			status = 1;
		else 
			status = 0;
		//alert("comm type = "+document.mop_treatment_form.mopTreatmentCommission.value)
		var commission_type = "null"; 
		//commission_type = document.mop_treatment_form.mopTreatmentCommission.value;	
		var linked_table;
		
		var treatmentBase = "null"; 
		linked_table = 'wfm_treatment_commission';
		//if (document.mop_treatment_form.mopTreatmentCommission != null)
		//{
			if (document.mop_treatment_form.mopTreatmentCommission[0].checked == true) 
			{
				commission_type = document.mop_treatment_form.mopTreatmentCommission[0].value; 
				treatmentBase = '0';
				var com_values ='';
				eltid = 't1';
				usechild = 'usen1';
				if ( document.getElementById(eltid) !=null)
				{
					com_values += '0, 0, '+document.getElementById(usechild).value;
				}
				//alert("Valeurs : "+ com_values)
			}
			if (document.mop_treatment_form.mopTreatmentCommission[1].checked == true) 
			{
				commission_type = document.mop_treatment_form.mopTreatmentCommission[1].value; 
				if (document.mop_treatment_form.treatmentBase2[2].checked == true) 
				{
					treatmentBase = '3';
					var com_values ='';
					eltid = 't1';
					usechild = 'usen1';
					if ( document.getElementById(eltid) !=null)
					{
						com_values += '0, 0, '+document.getElementById(usechild).value;
					}
					//alert("Valeurs : "+ com_values);
				}
				else
				{
					if (document.mop_treatment_form.treatmentBase2[0].checked == true) treatmentBase = '1';
					if (document.mop_treatment_form.treatmentBase2[1].checked == true) treatmentBase = '2';
				}
				
			}
			if (document.mop_treatment_form.mopTreatmentCommission[2].checked == true) 
			{
				commission_type = document.mop_treatment_form.mopTreatmentCommission[2].value; 
				if (document.mop_treatment_form.treatmentBase3[0].checked == true) treatmentBase = '1';
				if (document.mop_treatment_form.treatmentBase3[1].checked == true) treatmentBase = '2';
			}

			if (document.mop_treatment_form.mopTreatmentCommission[3].checked == true) 
			{
				commission_type = document.mop_treatment_form.mopTreatmentCommission[3].value;
				if (document.mop_treatment_form.treatmentBase4[0].checked == true) treatmentBase = '1';
				if (document.mop_treatment_form.treatmentBase4[1].checked == true) treatmentBase = '2';
			}
	/*		if (document.mop_treatment_form.mopTreatmentCommission[4].checked == true) 
			{
				commission_type = document.mop_treatment_form.mopTreatmentCommission[4].value;
			}
	*/
			//alert ("paramètres : id="+dbid+" n="+t_name+" d="+description+" s="+status+" t="+commission_type+" b="+treatmentBase+" v="+max_commission_value+" l="+linked_table)
	
			if (document.mop_treatment_form.mopTreatmentCommission[0].checked == true ||
				(document.mop_treatment_form.mopTreatmentCommission[1].checked == true && document.mop_treatment_form.treatmentBase2[2].checked == true) /*||			   
				document.mop_treatment_form.mopTreatmentCommission[4].checked == true*/ ) 
			{
				var result = appletObj.saveMopTreatmentInfo(dbid, tenant_dbid, t_name, description, status, commission_type, treatmentBase, max_commission_value, linked_table); 
				if (dbid.length > 0)	appletObj.saveMopTreatmentCommissionInfo(com_values, mopTreatmentDBID);
			}
			else
			{
				var result = appletObj.saveMopTreatmentInfo(dbid, tenant_dbid, t_name, description, status, commission_type, treatmentBase, max_commission_value, linked_table); 
				if (dbid.length > 0)	saveMopTreatmentCommissionInfo (dbid);
					
			}
		//}
		document.mop_treatment_form.updateInfo.disabled = true;	// reset the button to disabled
		document.location.href = "../defaultpage.htm";
		return;
	}
	return false;
}

function askDelete()
{
	var t_name = document.mop_treatment_form.mopTreatmentName.value;

	answer = confirm("Are you sure, you wish to delete this commission?")
	if(answer){
		appletObj.deleteMopTreatmentCommission(t_name);
		appletObj.deleteMopTreatment(t_name);
		// refresh the current page
		document.location = "../defaultpage.htm";
	}
}

/*******************************/

function addMyRow(no_com)
{
	lyr=document.createElement("DIV");
 	lyr.id ='t'+nrows;
	var nom = 'n'+ nrows;
	var code='';
	var no_treat_base2;
	if (document.mop_treatment_form.treatmentBase2[2].checked == true)
		no_treat_base2 = 3;
	//alert ("treatmentBase2 = "+no_treat_base2);
	if ((no_com == 1) )
	{
		code ="<table width='100%'>";
		code += "<TR><TD align = 'center'>";
		code += "&nbsp;"+MultiArray["Pay"][lang]+" &nbsp;<input type='text' id='use"+nom+"' name='use"+nom+"' size='5' height='13' maxlength='5' value=''>";

		code +="</TD></TR>";
		document.getElementById("addRowButton1").disabled = true;
	}
	else if ((no_com == 2) && (no_treat_base2 == 3))
	{

		code ="<table width='100%'>";
		code += "<TR><TD align = 'center'>";
		code += "&nbsp;"+MultiArray["Pay"][lang]+"&nbsp;<input type='text' id='use"+nom+"' name='use"+nom+"' size='5' height='13' maxlength='5' value=''>&nbsp;per sale&nbsp;";

		code +="</TD></TR>";
		document.getElementById("addRowButton2").disabled = true;
	}
	else
	{

		code ="<table width='100%'>";
		code += "<TR><TD align='center' width='80%'>";
		code += ""+MultiArray["From"][lang]+"&nbsp;<input type='text' id='inf"+nom+"' name='inf"+nom+"' size='5' height='13' maxlength='5' value=''>";
		code += "&nbsp;"+MultiArray["To"][lang]+"&nbsp;<input type='text' id='sup"+nom+"' name='sup"+nom+"' size='5' height='13' maxlength='5' value=''>";
		code += "&nbsp;"+MultiArray["Pay"][lang]+"&nbsp;<input type='text' id='use"+nom+"' name='use"+nom+"' size='5' height='13' maxlength='5' value=''>";
		code +="</TD><td align='center' width='20%'> &nbsp; &nbsp;<a href='javascript:deleteMyRow("+nrows+");'><font face='Arial, Helvetica, sans-serif' size='1' color='#000000'>"+MultiArray["Delete"][lang]+"</font></a></td></TR>";

	}
   	lyr.innerHTML = code;
	var div_name = 'Com_ranges'+no_com;
  	document.getElementById(div_name).appendChild(lyr);
	if (no_com == 1) // si la commission est fixe
	{
		//document.detElementById("addRowButton1").disabled = true;
	}
  	//document.getElementById("Com_ranges").appendChild(lyr);
	nrows++;
	maxrow++;
	enableUpdateButton();
}

function deleteMyRow(f)
{
	var xxx = 't'+f;
	
	if (document.getElementById('commissionDiv2').style.visibility == 'visible')
		document.getElementById("Com_ranges2").removeChild(document.getElementById(xxx));
	if (document.getElementById('commissionDiv3').style.visibility == 'visible')
		document.getElementById("Com_ranges3").removeChild(document.getElementById(xxx));
	if (document.getElementById('commissionDiv4').style.visibility == 'visible')
		document.getElementById("Com_ranges4").removeChild(document.getElementById(xxx));
	
	nrows--;
	enableUpdateButton();
}

function saveMopTreatmentCommissionInfo (mopTreatmentDBID)
{
	values ='';
	for (var i=1; i<maxrow ; i++)
	{
		eltid = 't'+i;
		infchild = 'infn'+i;
		supchild = 'supn'+i;
		usechild = 'usen'+i;
		if ( document.getElementById(eltid) != null)
		{
			values += document.getElementById(infchild).value  +',';
			values += document.getElementById(supchild).value  +',';
			values += document.getElementById(usechild).value  +'|';
		}
	}
	com_values = values.substring(0, values.length-1)
	//alert("Valeurs : "+ com_values)
	appletObj.saveMopTreatmentCommissionInfo(com_values, mopTreatmentDBID);
	//alert("essaie")
}
/********************************/
function enableUpdateButton()
{
	document.mop_treatment_form.updateInfo.disabled = false;
}

function toggleLayer(whichLayer)
{
	if (document.getElementById)
	{
		// this is the way the standards work
		var style2 = document.getElementById(whichLayer).style;
		if (whichLayer == 'commissionDiv1')
		{
			style2.visibility = "visible"
			document.getElementById('commissionDiv2').style.visibility = 'hidden'
			document.getElementById('commissionDiv3').style.visibility = 'hidden'
			document.getElementById('commissionDiv4').style.visibility = 'hidden'
			//document.getElementById('commissionDiv5').style.visibility = 'hidden'
		} // fin commissionDiv1		
		if (whichLayer == 'commissionDiv2')
		{
			style2.visibility = "visible"
			document.getElementById('commissionDiv1').style.visibility = 'hidden'
			document.getElementById('commissionDiv3').style.visibility = 'hidden'
			document.getElementById('commissionDiv4').style.visibility = 'hidden'
			//document.getElementById('commissionDiv5').style.visibility = 'hidden'
		} // fin commissionDiv2		
		if (whichLayer == 'commissionDiv3')
		{
			style2.visibility = "visible"
			document.getElementById('commissionDiv1').style.visibility = 'hidden'
			document.getElementById('commissionDiv2').style.visibility = 'hidden'
			document.getElementById('commissionDiv4').style.visibility = 'hidden'
			//document.getElementById('commissionDiv5').style.visibility = 'hidden'
		} // fin commissionDiv3		
		if (whichLayer == 'commissionDiv4')
		{
			style2.visibility = "visible"
			document.getElementById('commissionDiv1').style.visibility = 'hidden'
			document.getElementById('commissionDiv2').style.visibility = 'hidden'
			document.getElementById('commissionDiv3').style.visibility = 'hidden'
			//document.getElementById('commissionDiv5').style.visibility = 'hidden'
		} // fin commissionDiv4		
		if (whichLayer == 'commissionDiv5')
		{
			style2.visibility = "visible"
			document.getElementById('commissionDiv1').style.visibility = 'hidden'
			document.getElementById('commissionDiv2').style.visibility = 'hidden'
			document.getElementById('commissionDiv3').style.visibility = 'hidden'
			document.getElementById('commissionDiv4').style.visibility = 'hidden'
		} // fin commissionDiv5		
	}
	else if (document.all)
	{
		// this is the way old msie versions work
		var style2 = document.all[whichLayer].style;
		if (whichLayer == 'commissionDiv1')
		{
			style2.visibility = "visible"
			document.all['commissionDiv2'].style.visibility = 'hidden'
			document.all['commissionDiv3'].style.visibility = 'hidden'
			document.all['commissionDiv4'].style.visibility = 'hidden'
			//document.all['commissionDiv5'].style.visibility = 'hidden'
		} // fin commissionDiv1		
		if (whichLayer == 'commissionDiv2')
		{
			style2.visibility = "visible"
			document.all['commissionDiv1'].style.visibility = 'hidden'
			document.all['commissionDiv3'].style.visibility = 'hidden'
			document.all['commissionDiv4'].style.visibility = 'hidden'
			//document.all['commissionDiv5'].style.visibility = 'hidden'
		} // fin commissionDiv2		
		if (whichLayer == 'commissionDiv3')
		{
			style2.visibility = "visible"
			document.all['commissionDiv1'].style.visibility = 'hidden'
			document.all['commissionDiv2'].style.visibility = 'hidden'
			document.all['commissionDiv4'].style.visibility = 'hidden'
			//document.all['commissionDiv5'].style.visibility = 'hidden'
		} // fin commissionDiv3		
		if (whichLayer == 'commissionDiv4')
		{
			style2.visibility = "visible"
			document.all['commissionDiv1'].style.visibility = 'hidden'
			document.all['commissionDiv2'].style.visibility = 'hidden'
			document.all['commissionDiv3'].style.visibility = 'hidden'
			//document.all['commissionDiv5'].style.visibility = 'hidden'
		} // fin commissionDiv4		
		if (whichLayer == 'commissionDiv5')
		{
			style2.visibility = "visible"
			document.all['commissionDiv1'].style.visibility = 'hidden'
			document.all['commissionDiv2'].style.visibility = 'hidden'
			document.all['commissionDiv3'].style.visibility = 'hidden'
			document.all['commissionDiv4'].style.visibility = 'hidden'
		} // fin commissionDiv4		
	}
	else if (document.layers)
	{
		// this is the way nn4 works
		var style2 = document.layers[whichLayer].style;
		if (whichLayer == 'commissionDiv1')
		{
			style2.visibility = "visible"
			document.layers['commissionDiv2'].style.visibility = 'hidden'
			document.layers['commissionDiv3'].style.visibility = 'hidden'
			document.layers['commissionDiv4'].style.visibility = 'hidden'
			//document.layers['commissionDiv5'].style.visibility = 'hidden'
		} // fin commissionDiv1		
		if (whichLayer == 'commissionDiv2')
		{
			style2.visibility = "visible"
			document.layers['commissionDiv1'].style.visibility = 'hidden'
			document.layers['commissionDiv3'].style.visibility = 'hidden'
			document.layers['commissionDiv4'].style.visibility = 'hidden'
			//document.layers['commissionDiv5'].style.visibility = 'hidden'
		} // fin commissionDiv2		
		if (whichLayer == 'commissionDiv3')
		{
			style2.visibility = "visible"
			document.layers['commissionDiv1'].style.visibility = 'hidden'
			document.layers['commissionDiv2'].style.visibility = 'hidden'
			document.layers['commissionDiv4'].style.visibility = 'hidden'
			//document.layers['commissionDiv5'].style.visibility = 'hidden'
		} // fin commissionDiv3		
		if (whichLayer == 'commissionDiv4')
		{
			style2.visibility = "visible"
			document.layers['commissionDiv1'].style.visibility = 'hidden'
			document.layers['commissionDiv2'].style.visibility = 'hidden'
			document.layers['commissionDiv3'].style.visibility = 'hidden'
			//document.layers['commissionDiv5'].style.visibility = 'hidden'
		} // fin commissionDiv4		
		if (whichLayer == 'commissionDiv5')
		{
			style2.visibility = "visible"
			document.layers['commissionDiv1'].style.visibility = 'hidden'
			document.layers['commissionDiv2'].style.visibility = 'hidden'
			document.layers['commissionDiv3'].style.visibility = 'hidden'
			document.layers['commissionDiv4'].style.visibility = 'hidden'
		} // fin commissionDiv4		
	}
	



}

