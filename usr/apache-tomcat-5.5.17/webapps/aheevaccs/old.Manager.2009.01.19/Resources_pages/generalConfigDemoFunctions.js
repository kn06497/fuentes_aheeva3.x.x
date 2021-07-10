
var tenant_dbid = normalizeString(QueryString('tenant_dbid'));
//alert('tenant_dbid='+tenant_dbid);
function refresh()
{
    window.location.reload( false );
}



function enableUpdateButton()
{
	document.generalConfiguration.updateInfo.disabled = false;
}

function toggleLayer(whichLayer)
{
	var tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	//appletObj.deleteGlobalNRRDurations();
	lyr=document.createElement("DIV");

	// lire les nrr globaux
	var nrr = String(appletObj.getGlobalNotReadyReasons()) + "";
	//alert("les nrr globaux sont : "+ nrr);
	var arrayNRR = nrr.split("|");
	
	// lire tous les work period
	var i = 0, j = 0;
	
	var work_periods = String(appletObj.getWorkPeriods(tenant_dbid)) + "";
	//alert("les work periods sont : " + work_periods);
	var arrayWorkPeriods = work_periods.split("|");

	var this_period;
	var code = "<table width='100%'>";
	code += "<tr> <td align='center'><b>"+MultiArray["Login time"][lang]+" (h)</b></td> <td align='center'><b>"+MultiArray["Tolerance"][lang]+ "(mn)</b></td> ";
	for (j = 0; j < arrayNRR.length; j++)
	{
		this_nrr = arrayNRR[j].split(",");
		code += " <td align='center'><b>"+this_nrr[1]+"</b></td> ";
	}
	code += "</tr>";
	for (i = 0; i < arrayWorkPeriods.length; i++)
	{
		this_period = arrayWorkPeriods[i].split(",");
		code += "<tr> <td align='center'>"+ this_period[1] +"</td> <td align='center'>"+ this_period[2] +"</td> "; 
		for (j = 0; j < arrayNRR.length; j++)
		{
			this_nrr = arrayNRR[j].split(",");
			code += "<td align='center'><input type='text' id='"+ this_period[0] + "_" + this_nrr[0] + "' name='"+ this_period[0] + "_" + this_nrr[0] + "' size='2'> mn</td>";
		}
		code += "</tr>";
	}
	code += "</table>";
	lyr.innerHTML = code;
	if (document.getElementById)
	{
		// this is the way the standards work
		var style2 = document.getElementById(whichLayer).style;
		if (style2.display == 'none')
		{
			style2.display = "";
			document.getElementById(whichLayer).innerHTML = "";
			document.getElementById(whichLayer).appendChild(lyr);
			
			
			var globalNRRDurations = appletObj.getGlobalNRRDurations() + ""; // dbid, wp_dbid, nrr_dbid, duration |
			var arrayGlobalNRRDurations = globalNRRDurations.split("|");
		
			if (globalNRRDurations != '')
			{
				for (var i = 0; i < arrayGlobalNRRDurations.length; i++)
				{
					
					var cur_nrr = arrayGlobalNRRDurations[i].split(",");
					var elt_id = cur_nrr[1]+"_"+cur_nrr[2];
					//alert("i="+i+" elt_id="+elt_id);
					if (document.getElementById(elt_id) != null)
						document.getElementById(elt_id).value = cur_nrr[3];
				}
			}
			
			document.getElementById("updateInfo").disabled = false;
		}
	}
	else if (document.all)
	{
		// this is the way old msie versions work
		var style2 = document.all[whichLayer].style;
		style2.display = style2.display? "":"none";

		if (style2.display == 'none')
		{
			style2.display = "";
			document.all[whichLayer].appendChild(lyr);
			document.all["updateInfo"].disabled = false;
		}

	}
	else if (document.layers)
	{
		// this is the way nn4 works
		var style2 = document.layers[whichLayer].style;
		style2.display = style2.display? "":"none";

		if (style2.display == 'none')
		{
			style2.display = "";
			document.layers[whichLayer].appendChild(lyr);
			document.layers["updateInfo"].disabled = false;
		}
	}
	
}

function saveGlobalNRRDurations()
{
	
	var values = "";
	// delete all global nrr durations
	// appletObj.deleteGlobalNRRDurations();
	// liste des noms de tous les input
	var array_durations = document.getElementById('configFields').getElementsByTagName('input');
	for (var i = 0; i < array_durations.length; i++)
	{
		//alert("i = " + i + " array_durations[i] = " + array_durations[i].name + " value = " + array_durations[i].value);
		var name = array_durations[i].name;
		var ids = name.split("_");
		var work_period_id = ids[0];
		var global_nrr_id = ids[1];
		var duration = array_durations[i].value;
		//alert(work_period_id +", "+ global_nrr_id +", "+ duration)
		
		if (duration != '' )
		{
			if (validation( duration ) != 0)
			{
				if (IsNumeric( duration ))
				{
					//if (duration <= (work_period_id*60))
						values += work_period_id +","+ global_nrr_id +","+ duration +"|";
					/*
					else
					{
						duration = work_period_id*60;
						values += work_period_id +","+ global_nrr_id +","+ duration +"|";
					}
					*/
				}
				else
				{
				
					alert(MultiArray["This duration is numeric, please change"][lang]);
					return;
				}
			}
			else
			{
				alert(MultiArray["Invalid use of character"][lang]);
				return ;		
			}
		}
		else
		{
		
			alert(MultiArray["Please fill all duration fields"][lang]);
			return;
		}
	}
	if (values.length > 1)
	{
		values = values.substring(0, values.length - 1);
		appletObj.saveGlobalNRRDuration(values);
	}
}

function addMyRow()
{
	lyr=document.createElement("DIV");
 	lyr.id ='t'+nrows;
	var nom = 'n'+ nrows;
	var nom_delta = 'd'+nrows;
	
	
	
	//var nRR_Name;
	var code='';
	var i = 0;
	if (maxrow == 1)
	{
    	code ="<table width='350'><TR><td width='100' align='center'><b>"+MultiArray["Duration"][lang]+"</b></td><td width='100' align='center'><b>"+MultiArray["Tolerance"][lang]+"</b></td></tr>";
		code += "<tr><TD width='100' align='center'><select id= '"+nom+"' name= '"+nom+"' >";
	}
	else
	{
    	code ="<table width='350'><TR><td width='100' align='center'><select id= '"+nom+"' name= '"+nom+"'>";
	}
	
	for (i = 1; i <= 24; i++)
	{
		 code +=" <option value='"+ i +"'>0 - "+i+" h</option>";
	}


	code +="</select></TD><td width='100' align='center'><input type='text' id='"+nom_delta+"' name='"+nom_delta+"' size='2'> mn </td>";
	code +="<td align='center' valign='middle'> &nbsp; &nbsp;<a href='javascript:deleteMyRow("+nrows+");'><font color='#000000'>"+MultiArray["Delete"][lang]+"</font></a></td></TR>";
	
   	//alert(code)
   	lyr.innerHTML = code;
  	document.getElementById("workperiod_items").appendChild(lyr);
	nrows++;
	maxrow++;
	document.getElementById("saveWorkPeriod").disabled = false;
	
}

function deleteMyRow(f)
{
  var xxx = 't'+f;
  var id = 'n'+f;
  var value = document.getElementById(id).value;
  var work_periods = String(appletObj.getWorkPeriods(tenant_dbid)) + "";
  var arrayWorkPeriods = work_periods.split("|");
  var id_elt_to_remove = 0;
  for (var i = 0; i < arrayWorkPeriods.length; i++)
  {
	var this_period = arrayWorkPeriods[i].split(",");
	if (this_period[1] == value)
		id_elt_to_remove = this_period[0];
  }
  //alert(id_elt_to_remove);
  document.getElementById("workperiod_items").removeChild(document.getElementById(xxx));
  document.getElementById("configFields").style.display = 'none';
  if (id_elt_to_remove != 0)
  {
  	appletObj.deleteWorkPeriod(id_elt_to_remove);
  	appletObj.removeNRRDurationFromWorkPeriodId(id_elt_to_remove);
  }
  nrows--;
  enableUpdateButton();
}


function saveWorkPeriodInfo()
{
	var tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	values = '';
	//alert(tenant_dbid);
	for (var i = 1; i < maxrow ; i++)
	{
		
		eltid = 't'+i;
		
		periodchild = 'n'+i;
		//alert(periodchild)
		deltachild = 'd'+i;
		//alert(deltachild)
		if ( document.getElementById(periodchild))
			if (document.getElementById(periodchild) != 'null' && document.getElementById(periodchild).disabled == false)
			{
				
				if (document.getElementById(deltachild).value != '' )
				{
					if ((validation(document.getElementById(deltachild).value) != 0))
					{
						if (IsNumeric(document.getElementById(deltachild).value))
						{
							values += tenant_dbid +',';
							values += document.getElementById(periodchild).value  +',';
							values += document.getElementById(deltachild).value  +'|';
						}
						else
						{
						
							alert(MultiArray["This tolerance is numeric, please change"][lang]);
							return ;		
						}
					}
					else
					{
						alert(MultiArray["Invalid use of character"][lang]);
						return ;		
					}
				}
				else
				{
				
					alert(MultiArray["Please fill all tolerance fields"][lang]);
					return;
				}
				
			}
		
	}
	
	
	//alert("Ici")
	if (values != '')
		values = values.substring(0, values.length-1)
	//alert("Valeurs : "+ values)
	if (values != '')
	{
		//alert('values='+values);
		appletObj.saveWorkPeriodInfo(values);
		document.getElementById("saveWorkPeriod").disabled = true;
		document.getElementById("defineDurations").disabled = false;
		document.getElementById("configFields").innerHTML = "";
		document.getElementById("configFields").style.display = 'none';
		//document.getElementById("configFields").setLegends("Configure durations for NRR");
	}
	document.getElementById("defineDurations").disabled = false;
	document.getElementById("updateInfo").disabled = false;
	refresh();
}

function enableReload()
{
   appletObj.fReloadMenu = true;
}


function displayGeneralConfigurationInfo()
{
	
	var myForm = document.generalConfiguration;
	var nom = 'n'+ nrows;
	var nom_delta = 'd'+nrows;
	// display work period info
	var code = "";
	
	var workPeriods = appletObj.getWorkPeriods(tenant_dbid) + "";
	//alert("les wp existants sont :"+ workPeriods + ":")
	var arrayWorkPeriods = workPeriods.split("|");
	if (workPeriods != '')
	{
		
		for (var i = 0; i < arrayWorkPeriods.length; i++)
		{
			code = "<div id='t"+nrows+"'>";
			nom = 'n'+ nrows;
			nom_delta = 'd'+nrows;
			if (i == 0)
			{
				code +="<table width='350'><TR><td width='100' align='center'><b>"+MultiArray["Duration"][lang]+"</b></td><td width='100' align='center'><b>"+MultiArray["Tolerance"][lang]+"</b></td></tr>";
				code += "<tr><TD width='100' align='center'><select id= '"+nom+"' name= '"+nom+"' onChange='enableUpdateButton()' disabled>";
			}
			else
			{
				code += "<table width='350'><tr><TD width='100' align='center'><select id= '"+nom+"' name= '"+nom+"' onChange='enableUpdateButton()' disabled>";
			}
			var curWorkPeriod = arrayWorkPeriods[i].split(",");
			for(var j = 1; j <= 24; j++)
			{
				if  (j == curWorkPeriod[1])
					status = "selected";
				else
					status = "";
				code +=" <option value='"+ j +"'"+ status+">0 - "+j+" h</option>";
			}
			code +="</select></TD><td width='100' align='center'><input type='text' id='"+nom_delta+"' name='"+nom_delta+"' size='2' value='"+curWorkPeriod[2]+"' disabled> mn </td>";
			code +="<td align='center' valign='middle'> &nbsp; &nbsp;<a href='javascript:deleteMyRow("+nrows+");'><font color='#000000'>"+MultiArray["Delete"][lang]+"</font></a></td></TR></table></div>";
			document.getElementById("workperiod_items").innerHTML += code;//appendChild(lyr);
			nrows++;
			maxrow++;
		}
		document.getElementById("saveWorkPeriod").disabled = false;
		document.getElementById("defineDurations").disabled = false;
	}//fin if (workPeriods != '')
	
	// display NRR durations info
	
	var globalNRRDurations = appletObj.getGlobalNRRDurations() + ""; // dbid, wp_dbid, nrr_dbid, duration |
	var arrayGlobalNRRDurations = globalNRRDurations.split("|");
	//alert("les globalNRRDurations existants sont :"+ globalNRRDurations + ":")
	if (globalNRRDurations != '')
	{
		toggleLayer('configFields');
		for (var i = 0; i < arrayGlobalNRRDurations.length; i++)
		{
			
			var cur_nrr = arrayGlobalNRRDurations[i].split(",");
			var elt_id = cur_nrr[1]+"_"+cur_nrr[2];
			//alert("i="+i+" elt_id="+elt_id);
			if (document.getElementById(elt_id) != null)
				document.getElementById(elt_id).value = cur_nrr[3];
		}
	}// if (globalNRRDurations != '')
		
	// display agent group info
	var agentGroups = String(appletObj.getAgentGroups()) + "";
	var arrayAgentGroups = agentGroups.split("|");

	for (var i = 0; i < arrayAgentGroups.length; i++)
	{
		var currentAgentGroup = arrayAgentGroups[i].split(",");
		var ag_dbid = currentAgentGroup[0];
		var ag_name = currentAgentGroup[1];
		myOption = new Option(ag_name, ag_dbid);
		optionPos = myForm.agentGroups.options.length;
		myForm.agentGroups.options[optionPos]=myOption;
	}// fin for (var i = 0; i < arrayAgentGroups.length; i++)
	
	// display paid time and billable time formulas infos
	lyr=document.createElement("DIV");
 	lyr.id ='formula_details';
	
	
	
	
	code = "";
	code += "<table border='0' width='100%'>";
	code += "<tr><td align='center' width='20%'><b>"+MultiArray["Agent group"][lang]+"</b></td>";
	code += "<td width='40%' align='left'><b>"+MultiArray["Paid time formula"][lang]+"</b></td>";
	code += "<td width='40%' align='left'><b>"+MultiArray["Billable time formula"][lang]+"</b></td></tr>"
	// Prendre la liste des agent groups		
	var agentGroups = String(appletObj.getAgentGroups()) + ""; // dbid, name, ...
	var arrayAgentGroups = agentGroups.split("|");
	//alert("Nb agent group = "+arrayAgentGroups.length);
	for (var i = 0; i < arrayAgentGroups.length; i++)
	{
		var curAgentGroup = arrayAgentGroups[i].split(",");
		// lire les infos sur les NRRs payables ou non
		//alert("Agent group ID = "+i + "-" + curAgentGroup[0]);
		var payable_nrrs = String(appletObj.getPayableNRRForAgentGroup(curAgentGroup[0])) + "";
		if (payable_nrrs == '')
		{
			code += "<tr><td align='center' width='20%'>"+curAgentGroup[1]+"</td>";
			code += "<td width='40%' align='left'>"+MultiArray["Login time"][lang]+"</td>";
			code += "<td width='40%' align='left'>"+MultiArray["Login time"][lang]+"</td></tr>"
		}
		
		if (payable_nrrs != '')
		{
			//alert("Payable NRRs = " + payable_nrrs);
			var arrayPayableNRRs = payable_nrrs.split("|");
			var not_paid_nrrs = "", not_billed_nrrs = "";
			var nb_not_paid = 0, nb_not_billed = 0;
			for (var j = 0; j < arrayPayableNRRs.length; j++)
			{
				var curPayableNRR = arrayPayableNRRs[j].split(",");
				//alert("j = "+ j +" curPayableNRR = " + arrayPayableNRRs[j]);
				if (curPayableNRR[2] == 0)
				{
					if (nb_not_paid == 0)
					{
						not_paid_nrrs += "(" + curPayableNRR[1];
					}
					else
					{
						not_paid_nrrs += "+" + curPayableNRR[1];
					}
					nb_not_paid++;
				}
				//alert("not_paid_nrrs="+not_paid_nrrs)
				if (curPayableNRR[3] == 0)
				{
					if (nb_not_billed == 0)
					{
						not_billed_nrrs += "(" + curPayableNRR[1];
					}
					else
					{
						not_billed_nrrs += "+" + curPayableNRR[1];
					}
					nb_not_billed++;
				}
			} // fin for
			if (nb_not_paid != 0)
			{
				not_paid_nrrs = "- " + not_paid_nrrs + ")";
			}
			if (nb_not_billed != 0)
			{
				not_billed_nrrs = "- " + not_billed_nrrs + ")";
			}
			code += "<tr><td align='center' width='20%'>"+curAgentGroup[1]+"</td>";
			code += "<td width='40%' align='left'>"+MultiArray["Login time"][lang]+" "+ not_paid_nrrs +"</td>";
			code += "<td width='40%' align='left'>"+MultiArray["Login time"][lang]+" "+ not_billed_nrrs +"</td></tr>"
		}

	}
	code += '</table>';
	lyr.innerHTML = code;
	document.getElementById("summary").appendChild(lyr);
	
}

function getNRRInfoForAgentGroup(agentGroupID)
{
	var code = "", payStat = "", billStat = "";
	//alert("AG id = "+agentGroupID);
	var nrrs = String(appletObj.getNRRForAgentGroup(agentGroupID)) + "";
	//alert("nrr for ag = "+nrrs);
	var payable_nrrs = String(appletObj.getPayableNRRForAgentGroup(agentGroupID)) + "";
	//alert("payable nrr for ag = "+payable_nrrs);
	var global_nrrs = String(appletObj.getGlobalNotReadyReasons()) + "";
	//alert("global nrr = "+global_nrrs);
	var arrayGlobalNRRs = global_nrrs.split("|");
	var arrayNRRs = nrrs.split("|");
	//alert(arrayNRRs[0]);
	if (payable_nrrs == '') // aucun payable nrr n'a encore été enregistré pour ce groupe
	{
		payStat = ""; 
		billStat = "";
		

		//mettre un titre et les infos
    	code = "<table width='500'>";
		code += "<tr><td width='200' align='center'><b>"+MultiArray["Not-ready reasons"][lang]+"</b></td><td width='100' align='center'><b>"+MultiArray["Paid time"][lang]+"</b></td><td width='100' align='center'><b>"+MultiArray["Billable time"][lang]+"</b></td></tr>";  
		for (var i = 0; i < arrayGlobalNRRs.length; i++)
		{
			var curGlobalNRR = arrayGlobalNRRs[i].split(",");  
			//alert("curGlobalNRR" + arrayGlobalNRRs[i]);
			code += "<tr><td width='200' align='center'>" + curGlobalNRR[1] + "</td>";
			code += "<td width='100' align='center'><input type='checkbox' id='"+agentGroupID+"_"+curGlobalNRR[0]+"_p"+"' name='"+agentGroupID+"_"+curGlobalNRR[0]+"_p"+"' onChange='enableUpdateButton()' " + payStat + " ></td>";
			code += "<td width='100' align='center'><input type='checkbox' id='"+agentGroupID+"_"+curGlobalNRR[0]+"_b"+"' name='"+agentGroupID+"_"+curGlobalNRR[0]+"_b"+"' onChange='enableUpdateButton()' " + billStat + " ></td></tr>";
		}
		//alert("taille des nrrs = " + arrayNRRs.length)
		if(nrrs != '')
		{
			for (var i = 0; i < arrayNRRs.length; i++)
			{
				//alert("arrayNRRs[i] = " + arrayNRRs[i])
				var curNRR = arrayNRRs[i].split(",");
				//if (curNRR[2] == 1) payStat = "checked"; else payStat = "";
				//if (curNRR[3] == 1) billStat = "checked"; else billStat = "";
				code += "<tr><td width='200' align='center'>" + curNRR[1] + "</td>";
				code += "<td width='100' align='center'><input type='checkbox' id='"+agentGroupID+"_"+curNRR[0]+"_p"+"' name='"+agentGroupID+"_"+curNRR[0]+"_p"+"' onChange='enableUpdateButton()' " + payStat + " ></td>";
				code += "<td width='100' align='center'><input type='checkbox' id='"+agentGroupID+"_"+curNRR[0]+"_b"+"' name='"+agentGroupID+"_"+curNRR[0]+"_b"+"' onChange='enableUpdateButton()' " + billStat + " ></td></tr>";
			}
		}
		code += "</table>";
	  	document.getElementById("nrrDetails").innerHTML = code;
		document.getElementById("savePaidConfig").style.visibility = 'visible';
	}
	
	if (payable_nrrs != '') // des payable nrr ont été enregistrés pour ce groupe
	{
		
		payStat = ""; 
		billStat = "";
		//mettre un titre et les infos
    	code = "<table width='500'>";
		code += "<tr><td width='200' align='center'><b>"+MultiArray["Not-ready reasons"][lang]+"</b></td><td width='100' align='center'><b>"+MultiArray["Paid time"][lang]+"</b></td><td width='100' align='center'><b>"+MultiArray["Billable time"][lang]+"</b></td></tr>";  
		for (var i = 0; i < arrayGlobalNRRs.length; i++)
		{
			var curGlobalNRR = arrayGlobalNRRs[i].split(",");
			code += "<tr><td width='200' align='center'>" + curGlobalNRR[1] + "</td>";
			code += "<td width='100' align='center'><input type='checkbox' id='"+agentGroupID+"_"+curGlobalNRR[0]+"_p"+"' name='"+agentGroupID+"_"+curGlobalNRR[0]+"_p"+"' onChange='enableUpdateButton()' " + payStat + " ></td>";
			code += "<td width='100' align='center'><input type='checkbox' id='"+agentGroupID+"_"+curGlobalNRR[0]+"_b"+"' name='"+agentGroupID+"_"+curGlobalNRR[0]+"_b"+"' onChange='enableUpdateButton()' " + billStat + " ></td></tr>";
		}
		
		if(nrrs != '')
		{
			for (var i = 0; i < arrayNRRs.length; i++)
			{
				var curNRR = arrayNRRs[i].split(",");
				code += "<tr><td width='200' align='center'>" + curNRR[1] + "</td>";
				code += "<td width='100' align='center'><input type='checkbox' id='"+agentGroupID+"_"+curNRR[0]+"_p"+"' name='"+agentGroupID+"_"+curNRR[0]+"_p"+"' onChange='enableUpdateButton()' " + payStat + " ></td>";
				code += "<td width='100' align='center'><input type='checkbox' id='"+agentGroupID+"_"+curNRR[0]+"_b"+"' name='"+agentGroupID+"_"+curNRR[0]+"_b"+"' onChange='enableUpdateButton()' " + billStat + " ></td></tr>";
			}
		}
		code += "</table>";
	  	document.getElementById("nrrDetails").innerHTML = code;
		document.getElementById("savePaidConfig").style.visibility = 'visible';
		
		var payable_nrrs = String(appletObj.getPayableNRRForAgentGroup(agentGroupID)) + "";
		//alert("payable nrrs = " + payable_nrrs);
		var arrayPayableNRRs = payable_nrrs.split("|");
		
		for (var i = 0; i < arrayPayableNRRs.length; i++)
		{
			var curPayableNRR = arrayPayableNRRs[i].split(",");
			elt_id = agentGroupID + "_" + curPayableNRR[0] + "_p";
			if (curPayableNRR[2] == '1') 
				document.getElementById(elt_id).checked = true;
			else 
				document.getElementById(elt_id).checked = false;
			elt_id = agentGroupID + "_" + curPayableNRR[0] + "_b";
			if (curPayableNRR[3] == '1') 
				document.getElementById(elt_id).checked = true;
			else 
				document.getElementById(elt_id).checked = false;

		}
		
	}
	
}


function savePayableOrBillableConfig(agentGroupID)
{
	var elt_id = "", values = "";
	var nrrs = String(appletObj.getNRRForAgentGroup(agentGroupID)) + "";
	
	var arrayNRRs = nrrs.split("|");

	var global_nrrs = String(appletObj.getGlobalNotReadyReasons()) + "";
	var arrayGlobalNRRs = global_nrrs.split("|");
	
	if(global_nrrs != '')
	{
		for (var i = 0; i < arrayGlobalNRRs.length; i++)
		{
			var curGlobalNRR = arrayGlobalNRRs[i].split(",");
			elt_id = agentGroupID + "_" + curGlobalNRR[0] + "_p";
			var payable = document.getElementById(elt_id).checked?'1':'0';
			elt_id = agentGroupID + "_" + curGlobalNRR[0] + "_b";
			var billable = document.getElementById(elt_id).checked?'1':'0';
			values += tenant_dbid+","+agentGroupID+","+curGlobalNRR[0]+","+payable+","+billable+"|";
		}
	}

	if(nrrs != '')
	{
		for (var i = 0; i < arrayNRRs.length; i++)
		{
			var curNRR = arrayNRRs[i].split(",");
			elt_id = agentGroupID + "_" + curNRR[0] + "_p";
			var payable = document.getElementById(elt_id).checked?'1':'0';
			elt_id = agentGroupID + "_" + curNRR[0] + "_b";
			var billable = document.getElementById(elt_id).checked?'1':'0';
			values += tenant_dbid+","+agentGroupID+","+curNRR[0]+","+payable+","+billable+"|";
		}
	}
	
	

	values = values.substring(0, values.length - 1);
	if (values != '')
	{
		appletObj.deletePayableNRR(agentGroupID);
		//alert(values);
		appletObj.savePayableNRR(values);
	}
	
}

