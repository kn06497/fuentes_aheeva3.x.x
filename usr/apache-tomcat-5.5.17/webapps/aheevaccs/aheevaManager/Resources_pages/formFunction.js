function validateInfo()
{
	if (document.formul.formName.value == '')
	{
		alert(lbl_notnullname);
		var tp = tp1.pages[0];
		tp.select();
		document.formul.formName.focus();
		return false;
	}
	var formsName = listFormName.split("~");

	for(var i = 0;i < formsName.length;i++){
		if(formsName[i] == document.formul.formName.value){
			alert(formAlreadyExist);
			return false;
		}
	} 
	if(document.getElementById("questionGrpId0").rows.length == 0){
	   alert(mandatoryQuesGrp);
	   return false;
	}
	if(checkQuesGrpName() && checkDependency() && checkQuestion() && checkQuestionList())
	{
		var sel = document.formul.selectedCampaignGroups.options;
		for (var i=0;i<sel.length;i++)
		{
			sel[i].selected=true;
		}
		
		sel = document.formul.selectedQueuesGroups.options;
		for (var i=0;i<sel.length;i++)
		{
			sel[i].selected=true;
		}
		document.formul.updateInfo.disabled = true;
		document.formul.action = "form.jsp?dbid="+formDbid+"&tenant_dbid="+tenant_dbid+
								 "&saveString=1"+"&grpNum="+grpNum+"&questionNum="+questionNum+"&questDepNum="+questDepNum;
		document.formul.submit();
	}
}

function askDelete()
{
	if(confirm(form_alert))
	{
		document.formul.action = "form.jsp?dbid="+formDbid+"&tenant_dbid="+tenant_dbid+"&saveString=2";
		document.formul.submit();
	}
}	


function addDependency(thisParm,questionGrpId)
{
    questDepNum++;
	var tdElement0 = document.createElement("<TD></TD>");
	var input0 = document.createElement("<input type='hidden' value='"+questionGrpId+"^' name='depId"+ questDepNum +"'/>");
	tdElement0.appendChild(input0)

	var tdElement1 = document.createElement("<TD></TD>");
	tdElement1.innerText = lbl_type;
	
	var tdElement2 = document.createElement("<td></td>");
	var select1 = document.createElement("<div id='depDiv"+questDepNum+"'/>");
	tdElement2.appendChild(select1);
	
	var tdElement3 = document.createElement("<TD></TD>");
	tdElement3.innerText = lbl_name;

	var tdElement4 = document.createElement("<TD></TD>");
	var input1 = document.createElement("<input type='text' name='depName"+ questDepNum +"' value='' size='27' value='' onChange='enableUpdateButton(true)'/>");
	tdElement4.appendChild(input1)
	
	var tdElement7 = document.createElement("<TD></TD>");
		
	var tdElement5 = document.createElement("<TD></TD>");
	
	var tdElement6 = document.createElement("<TD></TD>");
	var img2 = document.createElement("<img src='../img/delete2.gif' onclick='deleteDependency(this)'/>");
	tdElement6.appendChild(img2);
	
	var questionTable = document.getElementById("DependencyTable"+thisParm);
	myNewRow = questionTable.insertRow();
	questionTable.rows[questionTable.rows.length-1].appendChild(tdElement0);	
	questionTable.rows[questionTable.rows.length-1].appendChild(tdElement1);	
	questionTable.rows[questionTable.rows.length-1].appendChild(tdElement2);
	questionTable.rows[questionTable.rows.length-1].appendChild(tdElement3);
	questionTable.rows[questionTable.rows.length-1].appendChild(tdElement4);
	questionTable.rows[questionTable.rows.length-1].appendChild(tdElement7);
	questionTable.rows[questionTable.rows.length-1].appendChild(tdElement5);
	questionTable.rows[questionTable.rows.length-1].appendChild(tdElement6);
	
	document.getElementById("depDiv"+questDepNum).innerHTML = "<select name='depType"+questDepNum+"'>"+styleType+"</select>";
}

function addDependencyDetail(thisParam,rowClickedId)
{
	var depType = thisParam.parentElement.parentElement.cells[2].firstChild.value;
	var listParams = thisParam.parentElement.parentElement.cells[0].firstChild.value;
	listParams += "&quesGrp="+document.getElementById('dependencyCombo').options[document.getElementById('dependencyCombo').selectedIndex].innerText;
	if(depType == 1){
	window.open("notApplicable.jsp?listParams="+listParams,'win1', 'resizable=yes,maximize=yes,scrollbars=yes,width=700,height=500,status=no');
	}else if(depType == 2){
	window.open("condTolalGroup.jsp?listParams="+listParams,'win2', 'resizable=yes,maximize=yes,scrollbars=yes,width=700,height=500,status=no');
	}else if(depType == 3){
	window.open("questAnsCond.jsp?listParams="+listParams,'win3', 'resizable=yes,maximize=yes,scrollbars=yes,width=700,height=500,status=no');
	}else if(depType == 4){
	window.open("hideQuestions.jsp?listParams="+listParams,'win4', 'resizable=yes,maximize=yes,scrollbars=yes,width=700,height=500,status=no');
	}
}

function enableUpdateButton()
{	
	if(arguments.length > 0 && arguments[0] != null)
		isAgentNameChanged = arguments[0];		
	
	document.formul.updateInfo.disabled = false;
}

function predefinedClicked()
{
   enableUpdateButton();
   changePredefined(document.formul.predefined.checked);
}

function changePredefined(truefalse)
{
   document.getElementById("availableCampaignGroups").disabled = truefalse;
   document.getElementById("selectedCampaignGroups").disabled = truefalse;
   document.getElementById("availableQueuesGroups").disabled = truefalse;
   document.getElementById("selectedQueuesGroups").disabled = truefalse;
   document.getElementById("addButton").disabled = truefalse;
   document.getElementById("dropButton").disabled = truefalse;
   document.getElementById("addQueueButton").disabled = truefalse;
   document.getElementById("dropQueueButton").disabled = truefalse;
}

function enabledAddButton()
{
	document.formul.addButton.disabled = false;
}

function enabledDropButton()
{
	document.formul.dropButton.disabled = false;
}

function enabledQueueAddButton()
{
	document.formul.addQueueButton.disabled = false;
}

function enabledQueueDropButton()
{
	document.formul.dropQueueButton.disabled = false;
}

function questionGrpChanged()
{
	enableUpdateButton();
}
function addQuestionGroup(thisParam,addQueGrpNum)
{
	if(checkQuesGrpName())
	{
		var grpTable = document.getElementById("questionGrpId"+addQueGrpNum);
		if(grpTable)
		{
			addTableGrpRow(grpTable,addQueGrpNum)
		}
		else
		{
		   var tdElt1 = document.createElement("<TD></TD>");
		
		   var tdelt2 = document.createElement("<TD colspan='10'></TD>");
		
		   var table = document.createElement("<table id='questionGrpId"+addQueGrpNum+"'></table>");
	   	   tdelt2.appendChild(table)
		
		   grpTable = thisParam.parentElement.parentElement.parentElement.parentElement;
		   myNewRow = grpTable.insertRow((thisParam.parentElement.parentElement.sectionRowIndex+1));
		
		   myNewRow.appendChild(tdElt1);
		   myNewRow.appendChild(tdelt2);
		
		   addTableGrpRow(table,addQueGrpNum)
	    }
	}
}

function openGrpDetail(grpDetId,rowClickedId){
	window.open("questionGroupDetail.jsp?grpDetId="+grpDetId+"&grpName="+eval("document.formul.quesGprName"+rowClickedId).value,'win1', 'resizable=yes,maximize=yes,scrollbars=yes,width=700,height=500,status=no');
}

function addTableGrpRow(grpTable,addQueGrpNum)
{
	var tdElement0 = document.createElement("<TD></TD>");
	var input0 = document.createElement("<input type='hidden' name='quesGprId"+ ++grpNum +"' value='^"+grpNum+"^"+addQueGrpNum+"'/>");
	tdElement0.appendChild(input0)

	var tdElement1 = document.createElement("<TD></TD>");
	tdElement1.innerText = lbl_name;
	
	var tdElement2 = document.createElement("<TD></TD>");
	var input1 = document.createElement("<input type='text' name='quesGprName"+ grpNum +"' size='27' value='' onChange='enableUpdateButton(true)' onBlur='checkDuplicateName(this,"+grpNum+",document.formul.quesGprName"+grpNum+".value)'>");
	tdElement2.appendChild(input1)
	
	var tdElement3 = document.createElement("<TD></TD>");
	tdElement3.innerText = lbl_desc;
	
	var tdElement4 = document.createElement("<TD></TD>");
	var input2 = document.createElement("<input type='text' name='quesGprDesc"+ grpNum +"' size='27' value='' onChange='enableUpdateButton(true)'/>");
	tdElement4.appendChild(input2)
	
	var tdElement5 = document.createElement("<TD></TD>");
	var img1 = document.createElement("<img src='../img/delete2.gif' onclick='deleteQuesGrpRow(this,"+grpNum+")'/>");
	tdElement5.appendChild(img1)
	
	var tdElement6 = document.createElement("<TD></TD>");
	var img2 = document.createElement("<img src='../img/add.gif' onclick='addQuestionGroup(this,"+grpNum+")'>");
	tdElement6.appendChild(img2)
	
	var tdElement7 = document.createElement("<TD></TD>");
	
	myNewRow = grpTable.insertRow();
	myNewRow.appendChild(tdElement6);
	myNewRow.appendChild(tdElement5);
	myNewRow.appendChild(tdElement0);
	myNewRow.appendChild(tdElement1);	
	myNewRow.appendChild(tdElement2);
	myNewRow.appendChild(tdElement3);
	myNewRow.appendChild(tdElement4);
	myNewRow.appendChild(tdElement7);

}

function setlistOfQuestion()
{
	var grpTable = document.getElementById("questionGrpId");
	
	for (var i=1; i<=grpTable.rows.length-1;i++)
	{
		var value = "";
		if(grpTable.rows[i].cells[6].firstChild)
		{
			value = grpTable.rows[i].cells[6].firstChild.value;
		}
		var listQues = "<select STYLE='width:1in'>";
		for (var j=0; j<=grpTable.rows.length-1;j++)
		{
			
			if(grpTable.rows[j].cells[3].firstChild.value != "" && i != j)
			{
				listQues += "<option value='"+grpTable.rows[j].cells[3].firstChild.value+"'>"
							+ grpTable.rows[j].cells[3].firstChild.value+"</option>";
			}
		}
		grpTable.rows[i].cells[6].innerHTML = listQues + "</select>";
		
		if(value != "")
		{
			grpTable.rows[i].cells[6].firstChild.value = value; 
		}
	}
}

function addQuestion(thisParm,questionGrpId)
{
	if(document.getElementById("quesListComboId").value==""){
	   alert(question_alert);
	   return;
	}
	var questionTable = document.getElementById("questionTable"+thisParm);
	
	if (questionTable.rows.length<=1){
		questionTable.insertRow();
		var head=document.createElement("<TD></TD>")
		questionTable.rows[questionTable.rows.length-1].appendChild(head);
		var head=document.createElement("<TD></TD>")
		head.innerHTML=lbl_name;
		questionTable.rows[questionTable.rows.length-1].appendChild(head);
		var head=document.createElement("<TD></TD>")
		head.innerHTML=lbl_answer;
		questionTable.rows[questionTable.rows.length-1].appendChild(head);
		var head=document.createElement("<TD></TD>")
		head.innerHTML=lbl_order;
		questionTable.rows[questionTable.rows.length-1].appendChild(head);
		var head=document.createElement("<TD></TD>")
		head.innerHTML=add_comment;
		questionTable.rows[questionTable.rows.length-1].appendChild(head);
		var head=document.createElement("<TD></TD>")
		head.innerHTML=colls_nbr;
		questionTable.rows[questionTable.rows.length-1].appendChild(head);
		var head=document.createElement("<TD></TD>")
		head.innerHTML=rows_nbr;
		questionTable.rows[questionTable.rows.length-1].appendChild(head);
		var head=document.createElement("<TD></TD>")
		questionTable.rows[questionTable.rows.length-1].appendChild(head);
		
	}
	if(checkQuestion() && checkQuestionList()){
	     questionNum++;
	     var tdElement0 = document.createElement("<TD></TD>");
	     var input0 = document.createElement("<input type='hidden' value='"+questionGrpId+"^' name='quesId"+ questionNum +"'/>");
	     tdElement0.appendChild(input0)

	     var tdElement1 = document.createElement("<TD></TD>");
	     tdElement1.innerText = lbl_name;
	
	     var tdElement2 = document.createElement("<TD></TD>");
	     var input1 = document.createElement("<input type='text' name='quesName"+ questionNum +"' size='27' value='' onChange='enableUpdateButton(true)' onBlur='checkDuplicateQuest(this,"+questionNum+",document.formul.quesName"+questionNum+".value)'/>");
	     tdElement2.appendChild(input1)
	
	     var tdElement3 = document.createElement("<TD></TD>");
       	 var input2 = document.createElement("<input type='checkbox' name='fcomment"+ questionNum +"'  value='0' onClick='manageComment("+ questionNum +");enableUpdateButton(true)'/>");
         tdElement3.appendChild(input2);
	
	     var tdElement8 = document.createElement("<TD></TD>");
	     var input5 = document.createElement("<input type='text' size = '4' name='quesOrder"+ questionNum +"'  value='0' onBlur='validateNumber(this);enableUpdateButton(true)'/>");
	     tdElement8.appendChild(input5)
	
	     var tdElement4 = document.createElement("<TD></TD>");
	     var input3 = document.createElement("<input type='text' size = '5' name='width"+ questionNum +"'  value='' onBlur='validateNumber(this);enableUpdateButton(true)' disabled class=\"grayButton\" />");
         tdElement4.appendChild(input3);
	
	     var tdElement5 = document.createElement("<TD></TD>");
	     var input4 = document.createElement("<input type='text' size = '5' name='height"+ questionNum +"'  value='' onBlur='validateNumber(this);enableUpdateButton(true)' disabled class=\"grayButton\" />");
         tdElement5.appendChild(input4)
	
	     var tdElement6 = document.createElement("<TD></TD>");
	     var img1 = document.createElement("<img src='../img/delete2.gif' onclick='deleteQuestion(this)'/>");
	     tdElement6.appendChild(img1);
	
	     var tdElement7 = document.createElement("<td></td>");
	     var select1 = document.createElement("<div id='ansDiv"+questionNum+"'/>");
	     tdElement7.appendChild(select1);

	     var myNewRow = questionTable.insertRow();
	     questionTable.rows[questionTable.rows.length-1].appendChild(tdElement0);	
         questionTable.rows[questionTable.rows.length-1].appendChild(tdElement2);
	     questionTable.rows[questionTable.rows.length-1].appendChild(tdElement7);
	     questionTable.rows[questionTable.rows.length-1].appendChild(tdElement8);
	     questionTable.rows[questionTable.rows.length-1].appendChild(tdElement3);
	     questionTable.rows[questionTable.rows.length-1].appendChild(tdElement4);
	     questionTable.rows[questionTable.rows.length-1].appendChild(tdElement5);
	     questionTable.rows[questionTable.rows.length-1].appendChild(tdElement6);
	     
	     document.getElementById("ansDiv"+questionNum).innerHTML = "<select name='ans"+questionNum+"'>"+listAnswer+"</select>";
      }
}


function validateNumber(obj)
{
	var val = IsInteger(obj.value);
	if (!val && obj.value != "")
	{
		alert(invalid);
		obj.focus();
		obj.value="";					
	}
}

function deleteQuesGrpRow(getParam,questionGrpId)
{
	if(confirm(ques_group_alert))
	{
		var questionTable = document.getElementById("questionGrpId"+questionGrpId);
		enableUpdateButton();
		if(questionTable)
		{
		    questionTable.parentElement.parentElement.removeNode(true);
		}
		getParam.parentElement.parentElement.removeNode(true);
		
	}
}
function deleteQuestion(getParam)
{   obj = getParam.parentElement.parentElement.parentElement.rows;
    if(obj.length<=2) {
	   alert(notDeleteAll);
	   return;
    }
	if(confirm(ques_alert))
	{
		enableUpdateButton();
		getParam.parentElement.parentElement.removeNode(true);
	}
}
function deleteDependency(getParam)
{   obj = getParam.parentElement.parentElement.parentElement.rows;
   	if(confirm(depen_alert))
	{
		enableUpdateButton();
		getParam.parentElement.parentElement.removeNode(true);
	}
}

function getListQuestion(thisParm)
{
	if(checkQuestion())
	{
		for(var i=1;i<=grpNum;i++)
		{
			if(document.getElementById("questions"+i))
				document.getElementById("questions"+i).style.display = "none";
		}
		if(thisParm.value != ""){
			document.getElementById("questions"+thisParm.value).style.display = "";
		}
	}
}

function fieldTypeClicked()
{
	enableUpdateButton(true);
}

function getListDependency(thisParm)
{
	if(checkDependency()){
		for(var i=1;i<=grpNum;i++)
		{
			if(document.getElementById("dependency"+i))
				document.getElementById("dependency"+i).style.display = "none";
		}
		
		if(thisParm.value != "")
		   document.getElementById("dependency"+thisParm.value).style.display = "";
	}
}

function checkQuesGrpName()
{
	for (ff=1; ff<=grpNum;ff++)
	{
		if (eval('document.formul.quesGprName'+ff))
		{
			if (eval('document.formul.quesGprName'+ff).value== '')
			{
				alert(lbl_notnullname)
				var tp = tp1.pages[1];
				tp.select();
				eval('document.formul.quesGprName'+ff).focus();
				return false;
			}
		}
	}
	return true;
}

function checkQuestion(){
	for (ff=1; ff<=questionNum;ff++)
	{
		if (eval('document.formul.quesName'+ff))
		{
			if (eval('document.formul.quesName'+ff).value== '')
			{
				alert(lbl_notnullname)
				var tp = tp1.pages[2];
				tp.	select();
				eval('document.formul.quesName'+ff).focus();
				return false;
			}
		}
	}
	return true;
}

function checkQuestionList(){
   for(ff=1;ff<=questionNum;ff++)
   {
      if(eval('document.formul.ans'+ff))
      {
         if(eval('document.formul.ans'+ff).value=='')
         {
        	   alert(lbl_notnullans)
				var tp = tp1.pages[2];
				tp.select();
				eval('document.formul.ans'+ff).focus();
				return false;  
         }
      }
   }
   return true;
}
function checkDependency(){
	for (ff=1; ff<=questDepNum;ff++)
	{
		if (eval('document.formul.depName'+ff))
		{
			if (eval('document.formul.depName'+ff).value== '')
			{
				alert(lbl_notnullname)
				var tp = tp1.pages[3];
				tp.select();
				eval('document.formul.depName'+ff).focus();
				return false;
			}
		}
	}
	return true;
}

function manageComment(val)
{
	if (eval('document.formul.fcomment'+val).checked ==true)
	{
		eval('document.formul.width'+val).disabled=false;
		eval('document.formul.height'+val).disabled=false;
		eval('document.formul.height'+val).className = "";
		eval('document.formul.width'+val).className = "";
	}
	else
	{
		eval('document.formul.width'+val).value='';
		eval('document.formul.height'+val).value='';
		eval('document.formul.width'+val).disabled=true;
		eval('document.formul.height'+val).disabled=true;
		eval('document.formul.height'+val).className = "grayButton";
		eval('document.formul.width'+val).className = "grayButton";
		
	}
}

function checkDuplicateName(thisParam,addQueGrpNum,name){
   if(checkQuesGrpName())
	{
		var grpTable = document.getElementById("quesGprId"+addQueGrpNum);
		if(grpTable)
		{
		    var numRow = grpTable.parentElement.parentElement.parentElement.parentElement.rows.length;
			for(i=0;i<numRow-1;i++){
			     if(i%2==0){
			       cells= grpTable.parentElement.parentElement.parentElement.parentElement.rows[i].cells;
			         if(cells[4].childNodes[0].value==name){
			            alert(lbl_duplicateQuest)
			            document.getElementById("quesGprName"+addQueGrpNum).value="";
			         }
			     }
			}       			
		}
	}    
}

function checkDuplicateQuest(thisParam,questionNum,name){
	
	var grpTable = document.getElementById("quesName"+questionNum);
	if(grpTable)
	{
	    var numRow = grpTable.parentElement.parentElement.parentElement.parentElement.rows.length;
		for(i=1;i<numRow;i++){
		       cells= grpTable.parentElement.parentElement.parentElement.parentElement.rows[i].cells;
		       		if(cells[1].childNodes[0].value==name && questionNum!=i){
		            alert(lbl_duplicateQuest)
		            document.getElementById("quesName"+questionNum).focus();
		            document.getElementById("quesName"+questionNum).select();
		            break;
		         }
		}     			
	}
}