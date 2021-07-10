function validateInfo()
{
	if (document.formul.answerName.value == '')
	{
		alert(lbl_notnullname);
		var tp = tp1.pages[0];
		tp.select();
		document.formul.answerName.focus();
		return false;
	}

	if (document.formul.fieldType.value == "")
	{
		alert(lbl_stylenull);
		var tp = tp1.pages[0];
		tp.select();
		document.formul.fieldType.focus();
		return false;
	}

	if (document.formul.fieldType.value == 3)
	{
		if(document.formul.maxScore.value <= document.formul.minScore.value)
		{
			alert(answer_style_check);
			var tp = tp1.pages[0];
			tp.select();
			document.formul.minScore.focus();
			return false;
		}
	}
	else
	{
		for (ff=1; ff<=ansDetNum;ff++)
		{
			if (eval('document.formul.ansDetName'+ff))
			{
				if (eval('document.formul.ansDetName'+ff).value== '')
				{
					alert(lbl_notnullname);
					var tp = tp1.pages[1];
					tp.select();
					eval('document.formul.ansDetName'+ff).focus();
					return false;
				}
				if (eval('document.formul.ansDetDesc'+ff).value== '')
				{
					alert(lbl_notnulldesc);
					tp = tp1.pages[1];
					tp.select();
					eval('document.formul.ansDetDesc'+ff).focus();
					return false;
				}
				if (eval('document.formul.ansDetRank'+ff).value== '')
				{
					alert(lbl_notnullrank);
					tp = tp1.pages[1];
					tp.select();
					eval('document.formul.ansDetRank'+ff).focus();
					return false;
				}
				else
				{
					var valu = eval('document.formul.ansDetRank'+ff).value;
					var val = IsInteger(valu);
					if (!val)
					{
						alert(lbl_invalidnumber);
						tp = tp1.pages[1];
						tp.select();
						eval('document.formul.ansDetRank'+ff).focus();
						eval('document.formul.ansDetRank'+ff).select();	
						return false;
						
					}
				}
			}
			
		}
	}
	if(document.formul.state.checked==false){
	  if(check=="true"){
	     alert(lbl_active);  
	     document.formul.state.checked=true;
	     return false;
	  }
	}
	document.formul.action = "answer.jsp?dbid="+answerDbid+"&tenant_dbid="+tenant_dbid+"&saveString=1"+"&ansDetNum="+ansDetNum;
	document.formul.submit();
}

function askDelete()
{
	if(confirm(answer_list_alert))
	{
		document.formul.action = "answer.jsp?dbid="+answerDbid+"&tenant_dbid="+tenant_dbid+"&saveString=2";
		document.formul.submit();
	}
	
}

function fieldTypeClicked()
{
	enableUpdateButton();
	enableDisableMinMax();
}

function enableDisableMinMax()
{
	if(document.formul.fieldType.value == 3)
	{
		document.formul.minScore.disabled = false;
		document.formul.maxScore.disabled = false;
		var tp = tp1.pages[1];
		tp.disable();
	}
	else
	{
		document.formul.minScore.disabled = true;
		document.formul.maxScore.disabled = true;
		var tp = tp1.pages[1];
		tp.enable();
	}
}

function enableUpdateButton()
{	
	if(arguments.length > 0 && arguments[0] != null)
		isAgentNameChanged = arguments[0];		
	
	document.formul.updateInfo.disabled = false;
}

function validateRank(obje)
{
	val = IsInteger(obje.value);
	if (!val)
	{
		var tp = tp1.pages[1];
		tp.select();
		obje.focus();
		obje.select();
		alert(lbl_invalidnumber);
		obje.value = "";
		return false;
	}
	enableUpdateButton();
}
function addAnswerDetail()
{
	var tdElement0 = document.createElement("<TD></TD>");
	var input0 = document.createElement("<input type='hidden' name='ansDetId"+ ++ansDetNum +"' onChange='enableUpdateButton()'/>");
	tdElement0.appendChild(input0)

	var tdElement1 = document.createElement("<TD></TD>");
	tdElement1.innerText = lbl_name;
	
	var tdElement2 = document.createElement("<TD></TD>");
	var input1 = document.createElement("<input type='text' name='ansDetName"+ ansDetNum +"' size='27' value='' onChange='enableUpdateButton()'/>");
	tdElement2.appendChild(input1)
	
	var tdElement3 = document.createElement("<TD></TD>");
	tdElement3.innerText = lbl_desc;
	
	var tdElement4 = document.createElement("<TD></TD>");
	var input2 = document.createElement("<input type='text' name='ansDetDesc"+ ansDetNum +"' size='27' value='' onChange='enableUpdateButton()' />");
	tdElement4.appendChild(input2)
    
    var tdElement5 = document.createElement("<TD></TD>");
	tdElement5.innerText = lbl_rank;
        
    var tdElement6 = document.createElement("<TD></TD>");
	var input3 = document.createElement("<input type='text' name='ansDetRank"+ ansDetNum +"' size='2' value='' onChange='validateRank(this)'/>");
	tdElement6.appendChild(input3)

	var tdElement7 = document.createElement("<TD></TD>");
	var img1 = document.createElement("<img src='../img/delete2.gif' onclick='deleteAnsDetRow(this)'/>");
	tdElement7.appendChild(img1)
	
	var answerTable = document.getElementById("AnswerDetailId");
	myNewRow = answerTable.insertRow();
	answerTable.rows[answerTable.rows.length-1].appendChild(tdElement0);	
	answerTable.rows[answerTable.rows.length-1].appendChild(tdElement1);	
	answerTable.rows[answerTable.rows.length-1].appendChild(tdElement2);
	answerTable.rows[answerTable.rows.length-1].appendChild(tdElement3);
	answerTable.rows[answerTable.rows.length-1].appendChild(tdElement4);
	answerTable.rows[answerTable.rows.length-1].appendChild(tdElement5);
    answerTable.rows[answerTable.rows.length-1].appendChild(tdElement6);   
    answerTable.rows[answerTable.rows.length-1].appendChild(tdElement7);
}


function deleteAnsDetRow(getParam)
{
	if(confirm(answer_alert))
	{
		getParam.parentElement.parentElement.removeNode(true)
		enableUpdateButton();
	}
}