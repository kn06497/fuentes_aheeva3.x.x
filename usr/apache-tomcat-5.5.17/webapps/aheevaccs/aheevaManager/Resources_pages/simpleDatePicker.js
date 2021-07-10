/**
 * This file contains javascript functions that are used in the simpleDatePicker.jsp
 * @author Gildas 
 */

function validReportPeriod()
{		
	var reportTypes = document.getElementsByName('reportType'),		
		strStartDate, strEndDate;
	
	if(reportTypes != null){
		if(reportTypes[2].checked){//daily
			var objStartDate = document.getElementById('startingDateDaily'),
				objEndDate = document.getElementById('endingDateDaily');
			
			if(objStartDate.value.length == 0){
				alert(Simd[0]);
				objStartDate.focus();
				return false;
			}//end of if((startDate.value.length == 0)		
			
			if(objEndDate.value.length == 0){
				alert(Simd[1]);
				objEndDate.focus();
				return false;
			}//end of if(endDate.value.length == 0)
			
			strStartDate = objStartDate.value;
			strEndDate = objEndDate.value;					
		}//end of if(reportTypes[2].checked)
		
		else if(reportTypes[1].checked){//Monthly
			var objStartMonth = document.getElementById('starting_month_monthly'),
				objStartYear = document.getElementById('starting_year_monthly'),				
				objEndMonth = document.getElementById('ending_month_monthly'),
				objEndYear = document.getElementById('ending_year_monthly');
				
			if(objStartMonth.selectedIndex == -1){
				objStartMonth.focus();
				return false;
			}//end of if(objStartMonth.selectedIndex == -1)
			
			if(objStartYear.selectedIndex == -1){
				objStartYear.focus();
				return false;
			}//end of if(objStartYear.selectedIndex == -1)
			
			if(objEndMonth.selectedIndex == -1){
				objEndMonth.focus();
				return false;
			}//end of if(objEndMonth.selectedIndex == -1)
			
			if(objEndYear.selectedIndex == -1){
				objEndYear.focus();
				return false;
			}//end of if(objEndYear.selectedIndex == -1)
			
			strStartDate = '01-' + objStartMonth.value + objStartYear.value;
			strEndDate = '01-' + objEndMonth.value + objEndYear.value;
		}//end of if(reportTypes[1].checked)
		
		else if(reportTypes[0].checked){//Yearly
			var objStartYear = document.getElementById('starting_year_yearly'),
				objEndYear = document.getElementById('ending_year_yearly');
			
			if(objStartYear.selectedIndex == -1){
				objStartYear.focus();
				return false;
			}//end of if(objStartYear.selectedIndex == -1)
			
			if(objEndYear.selectedIndex == -1){
				objEndYear.focus();
				return false;
			}//end of if(objEndYear.selectedIndex == -1)
			
			strStartDate = '01-' + '01-' + objStartYear.value;
			strEndDate = '01-' + '01-' + objEndYear.value;				
		}//end of if(reportTypes[0].checked)
		
		return dateChecker(strStartDate, strEndDate);		
	}//end of if(periods != null)		
	else
		return false;
		
}

function dateChecker(strStartDate, strEndDate)
{
	var startDate = new Date(strStartDate);
	var endDate = new Date(strEndDate);
	if(endDate < startDate)
	{
		alert(Simd[2]);
		return false;
	}
	else
		return true;		
}

function changeDisabled()
{
	var reportTypes = document.getElementsByName('reportType');
		if(reportTypes != null){
			if(reportTypes[0].checked){
			document.getElementById('startingDateDaily').disabled = true;
			document.getElementById('endingDateDaily').disabled = true;
			document.getElementById('starting_year_yearly').disabled = false;
			document.getElementById('ending_year_yearly').disabled = false;
			document.getElementById('starting_month_monthly').disabled = true;
			document.getElementById('starting_year_monthly').disabled = true;
			document.getElementById('ending_month_monthly').disabled = true;
			document.getElementById('ending_year_monthly').disabled = true;
		
		} else if(reportTypes[1].checked){
			document.getElementById('startingDateDaily').disabled = true;
			document.getElementById('endingDateDaily').disabled = true;
			document.getElementById('starting_year_yearly').disabled = true;
			document.getElementById('ending_year_yearly').disabled = true;
			document.getElementById('starting_month_monthly').disabled = false;
			document.getElementById('starting_year_monthly').disabled = false;
			document.getElementById('ending_month_monthly').disabled = false;
			document.getElementById('ending_year_monthly').disabled = false;	
	
		} else{
			document.getElementById('startingDateDaily').disabled = false;
			document.getElementById('endingDateDaily').disabled = false;
			document.getElementById('starting_year_yearly').disabled = true;
			document.getElementById('ending_year_yearly').disabled = true;
			document.getElementById('starting_month_monthly').disabled = true;
			document.getElementById('starting_year_monthly').disabled = true;
			document.getElementById('ending_month_monthly').disabled = true;
			document.getElementById('ending_year_monthly').disabled = true;
		}
	}//end of if(reportTypes != null)	
}
