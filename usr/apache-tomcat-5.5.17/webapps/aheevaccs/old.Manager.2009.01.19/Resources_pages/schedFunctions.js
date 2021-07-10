var selected_login = '';					//is the login of the selected agent 
var selected_id = '';

var cols = 8;
var rows;
var beginTime='0800';
var endTime='1800';
var period = 30;
var bhh;								// tmp. variable indicating the begin hour value of the current cell
var bmm;								// tmp. variable indicating the begin minute value
var ehh, emm;							// tmp. variable indicating the end hour value, end minute value
var increment;							// spacing between column in minutes

var dataTable;
var table;
 
function setStartTime()
{
 	var starttime = document.published.startTime.value;	
 	 if(starttime != 'undefined' && starttime.length > 0)
		beginTime = starttime.substring(0,2)+starttime.substring(3);
	 else
		beginTime = "0800";
		
}
function setEndTime()
{
	 var endtime = document.published.endTime.value;
	 if(endtime != 'undefined' && endtime.length > 0)
		endTime = endtime.substring(0,2)+endtime.substring(3);
	 else
		endTime = "1800";
}

function setSpacing ()
{
	period = document.published.spacing.value;
}

function setColumHeadersValue()
{
   //var colHeader = new Array("","1","2","3","4","5","6","7","8","9","10","11","12","13","14" );
   //var colHeader = new Array("","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday" );
   var colHeader = new Array("",""+MultiArray["Sunday"][lang]+"",""+MultiArray["Monday"][lang]+"",""+MultiArray["Tuesday"][lang]+"",""+MultiArray["Wednesday"][lang]+"",""+MultiArray["Thursday"][lang]+"",""+MultiArray["Friday"][lang]+"",""+MultiArray["Saturday"][lang]+"");

    //Set array for row header data
    for(i=0;i<cols;i++)
     dataTable[0][i]= colHeader[i];
	 
	/* dataTable[2][3] = 5;
	 dataTable[2][4] = '5';
	 dataTable[2][5] = 3;
	 dataTable[2][6] = '3';*/
 
}

function setRowNum()
{
	  bhh = parseInt(beginTime.substring(0,2),10);
	  bmm = parseInt(beginTime.substring(2,4),10);
	  ehh = parseInt(endTime.substring(0,2),10);
	  emm = parseInt(endTime.substring(2,4),10);
	  increment =  parseInt(period,10);
	  var nrows = 0;
	  for(i=bhh,j=bmm;i<ehh || j<=emm;j+=increment){
		if(j>=60){
		   j=j-60;
		   i=i+1;
		}
		if(String(j).length ==1)
		   k="0"+j;
		else
		   k=j;
		nrows = nrows+1;
	 }
	rows = nrows+1;
}

	
function setRowHeadersValue()
{
	   var rowNum=0
	   //Set array for row header data
	   dataTable = new Array(rows);
	   for(i = 0; i<rows; i++)
    	 dataTable[i] = new Array(cols );

 	   dataTable[0][0]=" Time hh:mm";
	   for(i=bhh,j=bmm;i<ehh ;j+=increment)
	   {
			rowNum++;
			if(j>=60)
			{
			 j=j-60;
			 i=i+1;
			}

			if(String(j).length ==1)
				 k="0"+j;
			else
				 k=j;
			value = i+":"+k;
			dataTable[rowNum][0]= value;
 	  }

}


function viewScheduleTable()
{
	//table.refreshTableView();
 	//delete dataTable;
	//dataTable = null;
	//loadtable();
	//alert(document.getElementById('spacing').value)
	getAgentSchedule(document.getElementById('man_agent'));
}


function loadtable()
{
	setStartTime();
	setEndTime();
	setRowNum();
 	setRowHeadersValue();
 	setColumHeadersValue();
	loadData();
	table = new schedTable(rows,cols);
	table.setPositionAndStyleParams (102,170,1,1,75,25,document.getElementById("tabPage4"));
	table.setData(dataTable);
	table.draw();
	document.getElementById("schedfieldset").style.height = table.tableHeight + 150;
}

var schedmenuObj;
var itemsOpened = false;
function showSchedMenu()
{
	setMousePos();
	schedmenuObj.style.top        = theClick.y + document.body.scrollTop - 32;
 	schedmenuObj.style.left       = theClick.x + document.body.scrollLeft - 22 ;
	//window.status = (theClick.y+'..'+document.body.scrollTop+'..'+schedmenuObj.style.top+'..'+document.getElementById("tabPage4").style.top)
	
	schedmenuObj.style.visibility = 'visible';
 	document.getElementById('menuitems1').style.left = 120 + parseInt(schedmenuObj.style.left.substring(0,schedmenuObj.style.left.length-2),10) ; 
	document.getElementById('menuitems1').style.top =  parseInt(schedmenuObj.style.top.substring(0,schedmenuObj.style.top.length-2),10) ;  

 	document.getElementById('menuitems2').style.left = 120 + parseInt(schedmenuObj.style.left.substring(0,schedmenuObj.style.left.length-2),10) ; 
	document.getElementById('menuitems2').style.top = 21 + parseInt(schedmenuObj.style.top.substring(0,schedmenuObj.style.top.length-2),10) ;  

 	document.getElementById('menuitems3').style.left = 120 + parseInt(schedmenuObj.style.left.substring(0,schedmenuObj.style.left.length-2),10) ; 
	document.getElementById('menuitems3').style.top = 42 + parseInt(schedmenuObj.style.top.substring(0,schedmenuObj.style.top.length-2),10) ;  

  //alert(schedmenuObj.style.top+'...'+schedmenuObj.style.left+ '.left.'+document.getElementById('menuitems1').style.left+'..top..'+document.getElementById('menuitems1').style.top);
	return false;
}
function hideSchedMenu()
{
	 document.getElementById('menuitems1').style.visibility = 'hidden';
	 document.getElementById('menuitems2').style.visibility = 'hidden';	
	 document.getElementById('menuitems3').style.visibility = 'hidden';	  
	   
 	 schedmenuObj.style.visibility = 'hidden';
}

function showMenuItems()
{
  	document.getElementById('menuitems1').style.visibility = 'visible';
 	document.getElementById('menuitems2').style.visibility = 'visible';
 	document.getElementById('menuitems3').style.visibility = 'visible';
	
	itemsOpened = true;
}

function hideSchedMenuItems()
{
	setMousePos();
	var smenuitemObj = document.getElementById('menuitems1');
	var diffX =document.body.scrollLeft+theClick.x-parseInt(schedmenuObj.style.left.substring(0,schedmenuObj.style.left.length-2));
	var diffY =document.body.scrollTop + theClick.y-parseInt(schedmenuObj.style.top.substring(0,schedmenuObj.style.top.length-2));
	//var maxwidth = parseInt(schedmenuObj.style.width.substring(0,schedmenuObj.style.width.length-2)) + parseInt(smenuitemObj.style.width.substring(0,smenuitemObj.style.width.length-2));
	diffX = diffX - 23;
	diffY = diffY - 28;
	if((diffX < 0) || (diffX > 200) ||(diffY < 0) || (diffY > 70)){
 		itemsOpened = false;
		document.getElementById('menuitems1').style.visibility = 'hidden';
	    document.getElementById('menuitems2').style.visibility = 'hidden';	
	    document.getElementById('menuitems3').style.visibility = 'hidden';	
		
 	 }		
	//window.status = ('..x='+theClick.x+'..y='+theClick.y+ ' diffX='+diffX+'..diffY='+diffY)
}

function setWorkPeriod()
{
 	//alert( ' selectedCellCol = '+table.selectedCellCol + ' selectedCellRow '+table.selectedCellRow)
 	table.setWorkPeriod(table.selectedCellCol,table.selectedCellRow);
}

function setBreakPeriod()
{
 	table.setBreakPeriod(table.selectedCellCol,table.selectedCellRow);

}

function deletePeriod()
{
 	table.deleteSchedPeriod(table.selectedCellCol,table.selectedCellRow);

}

function setBGColor(id,color) {
 		document.getElementById(id).style.backgroundColor = color
 }

/* This code is inserted for the calendar  */
var startDateValue, endDateValue;			
var weekDateValues = new Array(7);

function setSelectionDate(dateval){
	var month = parseInt(dateval.substring(0,2)-1,10);
	var date  = parseInt(dateval.substring(3,5),10);
	var year  = parseInt(dateval.substring(6),10);
	
	

	w_d.setMonth(month, date);
	w_d.setYear(year);
	w_d.setDate(date);
	var nbsec = w_d.getTime();
	var startDateObj, endDateObj , tmpObj; 
	var lap = parseInt(w_d.getDay(),10)*86400000;
	//startDateObj.setDate(w_d.getDate()-w_d.getDay());  
	startDateObj = new Date(nbsec-lap);
	//endDateObj.setDate(w_d.getDate()-w_d.getDay()+6); 
	endDateObj = new Date(nbsec-lap+86400000*6);
	
 	var mm =(startDateObj.getMonth()+1)<10?'0'+(startDateObj.getMonth()+1):(startDateObj.getMonth()+1);
	var dd =(startDateObj.getDate())<10?'0'+(startDateObj.getDate()):(startDateObj.getDate());
	var yy = startDateObj.getFullYear();
	startDateValue = mm+'/'+dd+'/'+yy;
	weekDateValues[0] = yy +'-'+ mm+'-'+dd;
	
	mm =(endDateObj.getMonth()+1)<10?'0'+(endDateObj.getMonth()+1):(endDateObj.getMonth()+1);
	dd =(endDateObj.getDate())<10?'0'+(endDateObj.getDate()):(endDateObj.getDate());
	yy = endDateObj.getFullYear();
	endDateValue = mm+'/'+dd+'/'+yy;
//alert(startDateValue + '..'+endDateValue)	
	/* Set all week date */
	//tmpObj.setDate(w_d.getDate()-w_d.getDay()+1)
	tmpObj =   new Date(nbsec-lap+86400000*1);
	mm =(tmpObj.getMonth()+1)<10?'0'+(tmpObj.getMonth()+1):(tmpObj.getMonth()+1);
	dd =(tmpObj.getDate())<10?'0'+(tmpObj.getDate()):(tmpObj.getDate());
	yy = tmpObj.getFullYear();
	weekDateValues[1] = yy +'-'+ mm+'-'+dd;
	
	tmpObj =   new Date(nbsec-lap+86400000*2);
	//tmpObj.setDate(w_d.getDate()-w_d.getDay()+2)
	mm =(tmpObj.getMonth()+1)<10?'0'+(tmpObj.getMonth()+1):(tmpObj.getMonth()+1);
	dd =(tmpObj.getDate())<10?'0'+(tmpObj.getDate()):(tmpObj.getDate());
	yy = tmpObj.getFullYear();
	weekDateValues[2] = yy +'-'+ mm+'-'+dd;

	tmpObj =   new Date(nbsec-lap+86400000*3);
	//tmpObj.setDate(w_d.getDate()-w_d.getDay()+3)
	mm =(tmpObj.getMonth()+1)<10?'0'+(tmpObj.getMonth()+1):(tmpObj.getMonth()+1);
	dd =(tmpObj.getDate())<10?'0'+(tmpObj.getDate()):(tmpObj.getDate());
	yy = tmpObj.getFullYear();
	weekDateValues[3] = yy +'-'+ mm+'-'+dd;

	tmpObj =   new Date(nbsec-lap+86400000*4);
	//tmpObj.setDate(w_d.getDate()-w_d.getDay()+4)
	mm =(tmpObj.getMonth()+1)<10?'0'+(tmpObj.getMonth()+1):(tmpObj.getMonth()+1);
	dd =(tmpObj.getDate())<10?'0'+(tmpObj.getDate()):(tmpObj.getDate());
	yy = tmpObj.getFullYear();
	weekDateValues[4] = yy +'-'+ mm+'-'+dd;

	tmpObj =   new Date(nbsec-lap+86400000*5);
	//tmpObj.setDate(w_d.getDate()-w_d.getDay()+5)
	mm =(tmpObj.getMonth()+1)<10?'0'+(tmpObj.getMonth()+1):(tmpObj.getMonth()+1);
	dd =(tmpObj.getDate())<10?'0'+(tmpObj.getDate()):(tmpObj.getDate());
	yy = tmpObj.getFullYear();
	weekDateValues[5] = yy +'-'+ mm+'-'+dd;

	tmpObj =   new Date(nbsec-lap+86400000*6);
	//tmpObj.setDate(w_d.getDate()-w_d.getDay()+6)
	mm =(tmpObj.getMonth()+1)<10?'0'+(tmpObj.getMonth()+1):(tmpObj.getMonth()+1);
	dd =(tmpObj.getDate())<10?'0'+(tmpObj.getDate()):(tmpObj.getDate());
	yy = tmpObj.getFullYear();
	weekDateValues[6] = yy +'-'+ mm+'-'+dd;
//	var elts = '';
//	for(var s=0; s < weekDateValues.length; s++)
//		elts += '..'+weekDateValues[s];
//	alert(elts)	

}	
	
buildWeeklyCalendar(0);
/* End of the calendar  code */
	 
function fillTimeBox(sel)
{
	for(var b=0;b<=24;b++){
		if(b == sel) document.write("<option value='"+(sel<10?'0'+sel:sel)+"00' selected>"+(sel<10?'0'+sel:sel)+":00 </option>");
		else document.write("<option value='"+(b<10?'0'+b:b)+"00'>"+(b<10?'0'+b:b)+":00 </option>");
	}
}


/* View and save schedule*/
var arrayOfSchedule = new Array() ;
function packScheduleData()
{
	 
	var c, r, daydate;
	var startperiod=1, endperiod=1;
	var oldSchedValue='', newSchedValue='', curSchedValue='';
	
	if(arrayOfSchedule != null && arrayOfSchedule.length > 0){
		arrayOfSchedule.length = 0;
		arrayOfSchedule = new Array();
	}
	for(c=1; c<cols; c++)
	{
		startperiod=1;
		endperiod=1;
		for(r=1; r<rows; r++)
		{
			newSchedValue = table.cells[r][c].bgcolor;			
			//dataTable[r][c] = 
			if(newSchedValue != oldSchedValue)
			{
				//Get start and end val
				endperiod = r;
				var stp = dataTable[startperiod][0];//startperiod;
				var etp = dataTable[endperiod][0];//endperiod;	
								
				startperiod = r;
				//We change period. Calculate the last period value
				if( oldSchedValue == table.workScheduleColor)
				{	
					//Construct a work period
					stp = weekDateValues[c-1]+ ' '+stp;
					etp = weekDateValues[c-1]+ ' '+etp;
					var elt = new Array(stp,etp,'WORK');
					arrayOfSchedule.push(elt);
				}
				else if(oldSchedValue == table.breakPeriodColor)
				{				
					//Construct a break period
					stp = weekDateValues[c-1]+ ' '+stp;
					etp = weekDateValues[c-1]+ ' '+etp;
					var elt = new Array(stp,etp,'BREAK/MEAL');
					arrayOfSchedule.push(elt);					
				}
				
			}			
			//if(table.cells[c][r].bgcolor == workScheduleColor)
			//curSchedValue = newSchedValue;
			oldSchedValue = newSchedValue;			
		}
	}
	var elts = '';
	for(var s=0; s < arrayOfSchedule.length; s++)
		elts += arrayOfSchedule[s]+ '|';
	if(elts.length > 1)
		elts = elts.substring(0, elts.length-1)	;
	document.getElementById("allsched").value = elts;
	//alert(elts) 
}

function saveScheduleForWeek(){
	if(document.published.man_agent.value.length < 1 )  {
		alert('Please, select an agent ')
		return false;
	}
	var nbr_breaks = nrows - 1 ;
	packScheduleData();
	document.published.action = '/aheevaccs/servlet/SaveScheduleServlet?nbr_breaks='+nbr_breaks+'&sel=3&lang='+lang;
	//alert(document.published.action)
	document.published.submit();
	return true;
}

function getAgentSchedule(selectobj)
{
	var id = selectobj.options[selectobj.selectedIndex].value ;
	var name = selectobj.options[selectobj.selectedIndex].text;
	var login_index_start = name.indexOf("[");
	var	login_index_end	  = name.indexOf("]");							 
	var login_id = name.substring(login_index_start+1, login_index_end);
	selected_login = login_id;
	selected_id = id;
	document.getElementById('man_agent_login').value = login_id;
	
	//document.location.href = "./publishedHoraires.jsp?startingDateDaily="+ document.getElementById('start_date').value+ "&endingDateDaily="+document.getElementById('end_date').value+"&group="+document.getElementById('groupName').value+","+ document.getElementById('group').value+"&selected_login="+selected_login+"&selected_id="+selected_id;
	document.published.action = './publishedHoraires.jsp?startingDateDaily='+document.getElementById('start_date').value+ "&endingDateDaily="+document.getElementById('end_date').value+"&group="+document.getElementById('groupName').value+","+ document.getElementById('group').value+"&sel=3&selected_login="+selected_login+"&selected_id="+selected_id+"&lang="+lang;
	//alert(document.published.action)	
	document.published.submit();
	return true;
 }
 
 
var allAgentScheduleData=new Array();    //Tab containing all schedule and adherence data received from CTI
var thisDayScheduleInfo=new Array();    //Tab containing only schedule info received from CTI for all agents

function loadData()
{
  var nbdays = allAgentScheduleData.length;
  var whichcol;
//allAgentScheduleData[0]='4/4^9^9^0-5:5,6-6:3,7-7:6,8-17:5,18-20:2,21-32:5,33-33:3,34-34:6,35-41:5^0-5:0,6-6:1,7-17:0,18-20:2,21-32:0,33-33:1,34-41:0';
  for(cmpt=0; cmpt < nbdays; cmpt++){
	   var thisdaysched = allAgentScheduleData[cmpt];
	   var arrayAgentData = thisdaysched.split("^");
	  
	   //Get month/day values and search for the appropriate col in  dataTable
	   var thisday = arrayAgentData[0];
	   jsdayparams = thisday.split("/");
	   var monthval = jsdayparams[0];
	   var dayval = jsdayparams[1];
	   var x;
	   for(x=0; x<weekDateValues.length;x++){
	   		if(parseInt(weekDateValues[x].substring(8),10) == dayval)
			{ whichcol = x+1;}
	   }
	   
	   var jsSchedData = arrayAgentData[3] + "";   //we got a schedule info : 0-17:2,18-29:5,30-30:3,31-31:6,32-41:5	   
	   var arrayTimeBlock = jsSchedData.split(",");
	   var viewUnit="";
	   var valPos = 0, stPos=0, ePos=0, cellval=2, ccolor="";
	   var stInd=0, endInd=0 ;
	   for(k=0; k < arrayTimeBlock.length; k++)
	   { 
			 viewUnit = arrayTimeBlock[k]; 
			 valPos  = 	viewUnit.indexOf(':');
			 sepPos  =  viewUnit.indexOf('-');
			 stPos   = 	parseInt(viewUnit.substring(0,sepPos), 10);
			 ePos    = 	parseInt(viewUnit.substring(sepPos+1,valPos), 10);
			 cellval =  parseInt(viewUnit.substring(valPos+1), 10);
	
			 //Fill cell between column stPos and ePos with cellval
			 for(cpos=stPos; cpos <= ePos; cpos++){
				    if(cellval == 6)
						cellval = 'Gap';
					if(cellval == 2)
						cellval="";
				   dataTable[cpos+1][whichcol] = cellval;
				   //alert('..cellval..'+ cellval + '..stPos..'+stPos+'.ePos..'+cpos+1)
				
 			 }//end for(cpos..)
			 //viewHTML
			//alert('..cellval..'+ cellval + '..stPos..'+stPos+'..ePos..'+ePos)
	 			 	
	  }//fin du for(k..)
  }
}

