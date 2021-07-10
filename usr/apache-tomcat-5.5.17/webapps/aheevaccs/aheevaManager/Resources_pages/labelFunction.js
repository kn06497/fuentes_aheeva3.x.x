function validateInfo()
{
	if (document.formul.labelName.value == '')
	{
		alert(lbl_notnullname);
		var tp = tp1.pages[0];
		tp.select();
		document.formul.labelName.focus();
		return false;
	}

	for (ff=1; ff<=labDetNum;ff++)
	{
		if (eval('document.formul.labDetName'+ff))
		{
			if (eval('document.formul.labDetName'+ff).value== '')
			{
				alert(lbl_notnullname);
				tp = tp1.pages[1];
				tp.select();
				eval('document.formul.labDetName'+ff).focus();
				return false;
			}
			if (eval('document.formul.labDetDesc'+ff).value== '')
			{
				alert(lbl_notnulldesc);
				tp = tp1.pages[1];
				tp.select();
				eval('document.formul.labDetDesc'+ff).focus();
				return false;
			}
			if (eval('document.formul.fromPrc'+ff).value== '')
			{
				alert(lbl_fromprcnotnull);
				tp = tp1.pages[1];
				tp.select();
				eval('document.formul.fromPrc'+ff).focus();
				return false;
			}
			if (eval('document.formul.toPrc'+ff).value== '')
			{
				alert(lbl_toprcnotnull);
				tp = tp1.pages[1];
				tp.select();
				eval('document.formul.toPrc'+ff).focus();
				return false;
			}
		}
	}
	
	document.formul.action = "label.jsp?dbid="+labelDbid+"&tenant_dbid="+tenant_dbid+"&saveString=1"+"&labDetNum="+labDetNum;
	document.formul.submit();
}

function askDelete()
{
	if(confirm(label_list_alert))
	{
		document.formul.action = "label.jsp?dbid="+labelDbid+"&tenant_dbid="+tenant_dbid+"&saveString=2";
		document.formul.submit();
	}
	
}

function enableUpdateButton()
{	
	
	if(arguments.length > 0 && arguments[0] != null)
		isAgentNameChanged = arguments[0];		
	
	document.formul.updateInfo.disabled = false;
}

function addlabelDetail()
{
	var tdElement0 = document.createElement("<TD></TD>");
	var input0 = document.createElement("<input type='hidden' name='labDetId"+ ++labDetNum +"' onChange='enableUpdateButton()'/>");
	tdElement0.appendChild(input0)

	var tdElement1 = document.createElement("<TD></TD>");
	tdElement1.innerText = lbl_name;
	
	var tdElement2 = document.createElement("<TD></TD>");
	var input1 = document.createElement("<input type='text' name='labDetName"+ labDetNum +"' size='27' value='' onChange='enableUpdateButton()'/>");
	tdElement2.appendChild(input1)
	
	var tdElement3 = document.createElement("<TD></TD>");
	tdElement3.innerText = lbl_desc;
	
	var tdElement4 = document.createElement("<TD></TD>");
	var input2 = document.createElement("<input type='text' name='labDetDesc"+ labDetNum +"' size='27' value='' onChange='enableUpdateButton()' />");
	tdElement4.appendChild(input2)

	var tdElement5 = document.createElement("<TD></TD>");
	tdElement5.innerText = lbl_fromprc;
	
	var tdElement6 = document.createElement("<TD></TD>");
	var input3 = document.createElement("<input type='text' name='fromPrc"+ labDetNum +"' size='5' value='' onChange='enableUpdateButton()' onBlur='validateLabel(this)' />");
	tdElement6.appendChild(input3)
    
    var tdElement7 = document.createElement("<TD></TD>");
	tdElement7.innerText = lbl_toprc;
	
	var tdElement8 = document.createElement("<TD></TD>");
	var input4 = document.createElement("<input type='text' name='toPrc"+ labDetNum +"' size='5' value='' onChange='enableUpdateButton()' onBlur='validateLabel(this)'/>");
	tdElement8.appendChild(input4)
   
	var tdElement9 = document.createElement("<TD></TD>");
	var img1 = document.createElement("<img src='../img/delete2.gif' onclick='deletelabDetRow(this)'/>");
	tdElement9.appendChild(img1)
	
	var labelTable = document.getElementById("labelDetailId");
	myNewRow = labelTable.insertRow();
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement0);	
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement1);	
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement2);
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement3);
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement4);
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement5);
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement6);
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement7);
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement8);
	labelTable.rows[labelTable.rows.length-1].appendChild(tdElement9);
}

function deletelabDetRow(getParam)
{
	if(confirm(label_alert))
	{
		getParam.parentElement.parentElement.removeNode(true)
		enableUpdateButton();
	}
}