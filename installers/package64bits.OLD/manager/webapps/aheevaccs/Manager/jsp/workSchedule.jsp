<%@page contentType="text/html"%>


<%
//String tmp_login="";
String tmp_sun_in="";
String tmp_sun_out="";
String grpChosen="";

%>
<html>

<head>

<script language="JavaScript" src="../Resources_pages/pupdate.js"></script>
<script language="JavaScript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" src="../Resources_pages/Browser.js" type="text/javascript"></script>
<script language="JavaScript">


var groupChosen ='';
groupChosen = normalizeString(QueryString('group'));
var tenant = normalizeString(QueryString('tenant_dbid'));
var nb_elmt =0;
var wday;
var weeknum;
var go_to_jsp;

function fillObjectCombo()
{
	//var vValue = normalizeString(QueryString('type'));
	tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	objects.disabled = true;
        if(groupChosen == '' ){
		var agents = appletObj.getAgentsByName(tenant_dbid);
		var jsAgents = agents + "";
    	arrayAgents = jsAgents .split("|");
    	for (j = 0; j <arrayAgents.length; j++){
    		var iStartPos = arrayAgents[j].indexOf('[');
    		var iEndPos   = arrayAgents[j].indexOf(']');
    		var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
    		myOption = new Option(arrayAgents [j],login)
			optionPos = objects.options.length
			objects.options[optionPos]=myOption
    		}
        }
  		/*Fill agents group combo box with agent group name*/
   		var agentGroups = appletObj.getAgentGroupByName(tenant_dbid);
		var jsAgentGroups = agentGroups + "";
    	arrayGroups = jsAgentGroups.split("|");
    	for (j = 0; j <arrayGroups.length; j++){
    		myOption = new Option(arrayGroups[j],arrayGroups[j])
			optionPos = agtGrp.options.length
			agtGrp.options[optionPos]=myOption
    	}

     if(groupChosen != '' ){

        for(i=0;i<agtGrp.options.length;i++)
         {
          if(agtGrp.options[i].value == groupChosen)
            {

               agtGrp.options[i].selected = true;
            }
        }
    }

}

function packageScheduleData()
{
	var myfromdata=weeknum +'|';
	var first_date = document.getElementsByName("weekFirstDate");
	myfromdata += first_date[0].value+'|';

	for (j = 0; j <nb_elmt; j++){
			 var agt_id = "agent"+j;
	    		 var sun_in = "sun_in"+j; var sun_out = "sun_out"+j;
			 var mon_in = "mon_in"+j; var mon_out = "mon_out"+j;
	                 var tue_in = "tue_in"+j; var tue_out = "tue_out"+j;
	  		 var wed_in = "wed_in"+j; var wed_out = "wed_out"+j;
			 var thu_in = "thu_in"+j; var thu_out = "thu_out"+j;
			 var fri_in = "fri_in"+j; var fri_out = "fri_out"+j;
			 var sat_in = "sat_in"+j; var sat_out = "sat_out"+j;
	                 var total = "total"+j;

		         var vsun_in = document.getElementsByName(sun_in);
		         var vsun_out = document.getElementsByName(sun_out);
		         var vmon_in = document.getElementsByName(mon_in);
		         var vmon_out = document.getElementsByName(mon_out);
		         var vtue_in = document.getElementsByName(tue_in);
		         var vtue_out = document.getElementsByName(tue_out);
		         var vwed_in = document.getElementsByName(wed_in);
		         var vwed_out = document.getElementsByName(wed_out);
		         var vthu_in = document.getElementsByName(thu_in);
		         var vthu_out = document.getElementsByName(thu_out);
		         var vfri_in = document.getElementsByName(fri_in);
		         var vfri_out = document.getElementsByName(fri_out);
		         var vsat_in = document.getElementsByName(sat_in);
		         var vsat_out = document.getElementsByName(sat_out);
		         var vtotal = document.getElementsByName(total);
		         var agentID = document.getElementsByName(agt_id);

		         myfromdata = myfromdata + (agentID[0].value ==''? N:agentID[0].value )+ ',';
		         myfromdata = myfromdata + (vsun_in[0].value ==(''||' ')? N:vsun_in[0].value)+ ',';
		         myfromdata = myfromdata + (vsun_out[0].value ==(''||' ')? N:vsun_out[0].value)+ ',';
		         myfromdata = myfromdata + (vmon_in[0].value ==''? N:vmon_in[0].value)+ ',';
		         myfromdata = myfromdata + (vmon_out[0].value ==''? N:vmon_out[0].value) + ',';
		         myfromdata = myfromdata + (vtue_in[0].value ==''? N:vtue_in[0].value) + ',';
		         myfromdata = myfromdata + (vtue_out[0].value ==''? N:vtue_out[0].value) + ',';
		         myfromdata = myfromdata + (vwed_in[0].value ==''? N:vwed_in[0].value)+ ',';
		         myfromdata = myfromdata + (vwed_out[0].value ==''? N:vwed_out[0].value)+ ',';
		         myfromdata = myfromdata + (vthu_in[0].value ==''? N:vthu_in[0].value)+ ',';
		         myfromdata = myfromdata + (vthu_out[0].value ==''? N:vthu_out[0].value)+ ',';
		         myfromdata = myfromdata + (vfri_in[0].value ==''? N:vfri_in[0].value)+ ',';
		         myfromdata = myfromdata + (vfri_out[0].value ==''? N:vfri_out[0].value)+ ',';
		         myfromdata = myfromdata + (vsat_in[0].value ==''? N:vsat_in[0].value)+ ',';
		         myfromdata = myfromdata + (vsat_out[0].value ==''? N:vsat_out[0].value)+ '|';
			}
		if(myfromdata.length >1)
		    myfromdata = myfromdata.substring(0,myfromdata.length -1);

		var vsched_data = document.getElementsByName("AllSchedData");
 		vsched_data[0].value = myfromdata;
 		//return myfromdata

}

<!--
// Week of the year script -
// -->
function weekNo()
	{
		var totalDays = 0;
		//now = new Date();
		now = wday;
		years=wday.getYear();
		var days = new Array(12); // Array to hold the total days in a month
		days[0] = 31;
		days[2] = 31;
		days[3] = 30;
		days[4] = 31;
		days[5] = 30;
		days[6] = 31;
		days[7] = 31;
		days[8] = 30;
		days[9] = 31;
		days[10] = 30;
		days[11] = 31;

		// Check to see if this is a leap year
		if (Math.round(now.getYear()/4) == now.getYear()/4) {
		days[1] = 29
		}else{
		days[1] = 28
		}

		// If this is January no need for any fancy calculation otherwise figure out the
		// total number of days to date and then determine what week
		if (now.getMonth() == 0) {
		totalDays = totalDays + now.getDate();
		}else{
		var curMonth = now.getMonth();
		for (var count = 1; count <= curMonth; count++) {
		totalDays = totalDays + days[count - 1];
		}
		totalDays = totalDays + now.getDate();
		}
		// Here is the modification: considering when start the 1st week of year.
		// Originally was only: var week = Math.round(totalDays/7)
		// Check if browser is "Microsoft Internet Explorer" or not and apply the right var
		var agt=navigator.userAgent.toLowerCase();
		if ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1)) {
		var firstday=new Date("01/01/"+String(now.getYear())).getDay();
		}
		else {
		var firstday=new Date("01/01/"+String(1900+now.getYear())).getDay();
		}
		var diff=7-firstday+1;
		var week = Math.round((totalDays+diff-firstday)/7); return week;
}




function showScheduleForm()
{
	  var loc="./workSchedule.jsp?group="+agtGrp.value+"&tenant_dbid="+tenant;
	//alert(loc)
	  document.location = loc;
	  return;
}

function showWeekDayInit()
{
	var first_date = document.getElementsByName("weekFirstDate");
	if(first_date[0].value =='')
		{
			var now = new Date();
			day = now.getDay();
			if(day > 0)
			{
				 var yy = now.getYear();
				 var mm = now.getMonth();
				 var dd = now.getDate();
				 wday = new Date(yy,mm,dd-day);
				  if(dd < 10)
				    dd='0'+dd;
				  if(mm < 10)
				    mm='0'+(mm+1);
				 first_date[0].value = mm+"/"+(dd-day)+"/"+yy;
			 }
		}

}


function showWeekDay()
{
	go_to_jsp = false;
	var first_date = document.getElementsByName("weekFirstDate");
	if(first_date[0].value =='')
		{
			alert('Please, enter the week date!');
			return false;
		}

    	if(first_date[0].value !=''){

		 var yy = first_date[0].value.substring(6,10);
		 var mm = first_date[0].value.substring(0,2)-1;
		 var dd = first_date[0].value.substring(3,5);
		 wday = new Date(yy,mm,dd);

		 if(wday.getDay()>0)
		   {
		    alert("The first week day is Sunday. Choose a sunday date !");
		    return false;
		   }
		   go_to_jsp = true;
		   weeknum = weekNo();
		   //var weekNum = document.getElementsByName("weekNum");
		   //weekNum[0].value = weeknum;
	 	   //alert(weeknum)
		   return true;

	  }

}

function calculateTotal(num)
{

			var j = num;
	    		 var sun_in = "sun_in"+j; var sun_out = "sun_out"+j;
			 var mon_in = "mon_in"+j; var mon_out = "mon_out"+j;
	                 var tue_in = "tue_in"+j; var tue_out = "tue_out"+j;
	  		 var wed_in = "wed_in"+j; var wed_out = "wed_out"+j;
			 var thu_in = "thu_in"+j; var thu_out = "thu_out"+j;
			 var fri_in = "fri_in"+j; var fri_out = "fri_out"+j;
			 var sat_in = "sat_in"+j; var sat_out = "sat_out"+j;
	                 var total = "total"+j;

		         var vsun_in = document.getElementsByName(sun_in);
		         var vsun_out = document.getElementsByName(sun_out);
		         var vmon_in = document.getElementsByName(mon_in);
		         var vmon_out = document.getElementsByName(mon_out);
		         var vtue_in = document.getElementsByName(tue_in);
		         var vtue_out = document.getElementsByName(tue_out);
		         var vwed_in = document.getElementsByName(wed_in);
		         var vwed_out = document.getElementsByName(wed_out);
		         var vthu_in = document.getElementsByName(thu_in);
		         var vthu_out = document.getElementsByName(thu_out);
		         var vfri_in = document.getElementsByName(fri_in);
		         var vfri_out = document.getElementsByName(fri_out);
		         var vsat_in = document.getElementsByName(sat_in);
		         var vsat_out = document.getElementsByName(sat_out);
		         var vtotal = document.getElementsByName(total);
		         vtotal[0].value = 0;
			 if(vsun_in[0].value !='')
	 			vtotal[0].value = parseFloat(vsun_in[0].value) + parseFloat(vtotal[0].value);

			 if(vsun_out[0].value !='')
	 			vtotal[0].value = parseFloat(vsun_out[0].value) + parseFloat(vtotal[0].value);
	 		 if(vmon_in[0].value !='')
	 			vtotal[0].value = parseFloat(vmon_in[0].value) + parseFloat(vtotal[0].value);
	 		 if(vmon_out[0].value !='')
	 			vtotal[0].value = parseFloat(vmon_out[0].value) + parseFloat(vtotal[0].value);
			 if(vtue_in[0].value !='')
	 			vtotal[0].value = parseFloat(vtue_in[0].value) + parseFloat(vtotal[0].value);
			 if(vtue_out[0].value !='')
	 			vtotal[0].value = parseFloat(vtue_out[0].value) + parseFloat(vtotal[0].value);
			 if(vwed_in[0].value !='')
	 			vtotal[0].value = parseFloat(vwed_in[0].value) + parseFloat(vtotal[0].value);
			 if(vwed_out[0].value !='')
	 			vtotal[0].value = parseFloat(vwed_out[0].value) + parseFloat(vtotal[0].value);
			 if(vthu_in[0].value !='')
	 			vtotal[0].value = parseFloat(vthu_in[0].value) + parseFloat(vtotal[0].value);
			 if(vthu_out[0].value !='')
	 			vtotal[0].value = parseFloat(vthu_out[0].value) + parseFloat(vtotal[0].value);
			 if(vfri_in[0].value !='')
	 			vtotal[0].value = parseFloat(vfri_in[0].value) + parseFloat(vtotal[0].value);
			 if(vfri_out[0].value !='')
	 			vtotal[0].value = parseFloat(vfri_out[0].value) + parseFloat(vtotal[0].value);
			 if(vsat_in[0].value !='')
	 			vtotal[0].value = parseFloat(vsat_in[0].value) + parseFloat(vtotal[0].value);
			 if(vsat_out[0].value !='')
	 			vtotal[0].value = parseFloat(vsat_out[0].value) + parseFloat(vtotal[0].value);


}

function fillFormForAgent()
{
		var agtID= fillFormForAgent.arguments[0];
		for (j = 0; j <nb_elmt; j++){
			 var agt_id = "agent"+j;
		     var agentID = document.getElementsByName(agt_id);
		     if(agentID[0].value == agtID)
			  		break;
			}
		// Now fill the form for this agent
		if(j<nb_elmt) {
	    	 var sun_in = "sun_in"+j; var sun_out = "sun_out"+j;
			 var mon_in = "mon_in"+j; var mon_out = "mon_out"+j;
	         var tue_in = "tue_in"+j; var tue_out = "tue_out"+j;
	  		 var wed_in = "wed_in"+j; var wed_out = "wed_out"+j;
			 var thu_in = "thu_in"+j; var thu_out = "thu_out"+j;
			 var fri_in = "fri_in"+j; var fri_out = "fri_out"+j;
			 var sat_in = "sat_in"+j; var sat_out = "sat_out"+j;
	         var total = "total"+j;

		     var vsun_in = document.getElementsByName(sun_in);
		     var vsun_out = document.getElementsByName(sun_out);
		     var vmon_in = document.getElementsByName(mon_in);
		     var vmon_out = document.getElementsByName(mon_out);
		     var vtue_in = document.getElementsByName(tue_in);
		     var vtue_out = document.getElementsByName(tue_out);
		     var vwed_in = document.getElementsByName(wed_in);
		     var vwed_out = document.getElementsByName(wed_out);
		     var vthu_in = document.getElementsByName(thu_in);
		     var vthu_out = document.getElementsByName(thu_out);
		     var vfri_in = document.getElementsByName(fri_in);
		     var vfri_out = document.getElementsByName(fri_out);
		     var vsat_in = document.getElementsByName(sat_in);
		     var vsat_out = document.getElementsByName(sat_out);
		     var vtotal = document.getElementsByName(total);

		      vsun_in[0].value = fillFormForAgent.arguments[1];
		      vsun_out[0].value = fillFormForAgent.arguments[2];
		      vmon_in[0].value = fillFormForAgent.arguments[3];
		      vmon_out[0].value = fillFormForAgent.arguments[4];
		      vtue_in[0].value = fillFormForAgent.arguments[5];
		      vtue_out[0].value = fillFormForAgent.arguments[6];
		      vwed_in[0].value = fillFormForAgent.arguments[7];
		      vwed_out[0].value = fillFormForAgent.arguments[8];
		      vthu_in[0].value = fillFormForAgent.arguments[9];
		      vthu_out[0].value = fillFormForAgent.arguments[10];
		      vfri_in[0].value = fillFormForAgent.arguments[11];
		      vfri_out[0].value = fillFormForAgent.arguments[12];
		      vsat_in[0].value = fillFormForAgent.arguments[13];
		      vsat_out[0].value = fillFormForAgent.arguments[14];

		}


}




function getAgentsInGroup()
{

 document.write("<form action=\"./schedule.jsp\" method=post>");

 document.write("<table>");

                      document.write("<tr>");
                      document.write("<td width=\"50\" height=\"20\" style=\"border-bottom-style: solid; border-bottom-width: 1; border-left-style: solid; border-left-width: 1;border-top-style: solid; border-top-width: 1;border-right-style: solid; border-right-width: 1;\">" +"Week:"+"</td>");
                      document.write("<td height=\"20\" width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1; border-left-style: solid; border-left-width: 1;border-right-style: solid; border-right-width: 1; border-top-style:solid; border-top-width:1\"> "+ " <b><input type=\"text\" size=\"20\" name=\"weekFirstDate\" onFocus=\"getCalendarFor(this); this.blur();\" /></b>" + "</td>");
                      document.write("<td width=\"50\" colspan=2 style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"<b>Sunday</b>"+"</td>");
                      //document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"<input type=\"text\" bgcolor=\"000000\" size=2 MAXLENGTH=2 name=\"dimanche\""+"</td>");
                      document.write("<td width=\"100\" colspan=2 style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +"<b>Monday</b>"+" </td>");
                     // document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1\" >"+"<b></b>"+"</td>");
                      document.write("<td width=\"50\" colspan=2 style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+" <b>Tuesday</b>"+"</td>");
                     // document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+" <b>&nbsp;</b>"+"</td>");
                      document.write("<td width=\"50\" colspan=2 style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"<b>Wednesday</b>"+" </td>");
                     // document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1\">"+"&nbsp;"+"</td>");
                      document.write("<td width=\"50\" colspan=2 style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"<b>Thursday</b>"+"</td>");
                     // document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"&nbsp;"+"</td>");
                      document.write("<td width=\"50\" colspan=2 style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1; border-right-style: solid; border-right-width: 1;\">"+"<b>Friday</b>"+"</td>");
                     // document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"&nbsp;"+"</td>");
                      document.write("<td width=\"50\" colspan=2 style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"<b>Saturday</b>"+"</td>");
                     // document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"&nbsp;"+"</td>");
                      document.write("<td width=\"50\" colspan=2 style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"<b>TOTAL</b>"+"</td>");
                     // document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">"+"&nbsp;"+"</td>");

                      document.write("</tr>");

                      document.write("<tr>");
                      document.write("<td height=\"20\" width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1; border-left-style: solid; border-left-width: 1;border-right-style: solid; border-right-width: 1; border-top-style:solid; border-top-width:1\">"+ " <b>ID</b>" + "</td>");
                      document.write("<td width=\"80\"  style=\"border-bottom-style: solid; border-bottom-width: 1; border-left-style: solid; border-left-width: 1;border-top-style: solid; border-top-width: 1;border-right-style: solid; border-right-width: 1;\">" +" <b>Name</b>" +"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>In</b>"+" </td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1\" >" +" <b>Out</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>In</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>Out</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>In</b>"+" </td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1\" >" +" <b>Out</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>In</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>Out</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1; border-right-style: solid; border-right-width: 1;\">" +" <b>In</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>Out</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>In</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>Out</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>In</b>"+"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>Out</b>"+"</td>");
                      document.write("<td width=\"80\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\">" +" <b>Hours</b>"+"</td>");
                      document.write("</tr>");

		//Get active agent
		var agents = appletObj.getAvailableAgentListInGroupByStatus(getAgentsInGroup.arguments[0],1);
		var jsAgents = agents + "";
		arrayAgents = jsAgents .split("|");
		nb_elmt = arrayAgents.length;
                for (j = 0; j <arrayAgents.length; j++){

    		      var iStartPos = arrayAgents[j].indexOf('[');
                      var iEndPos   = arrayAgents[j].indexOf(']');
    		      var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
                      var name = arrayAgents[j].substr(0,iStartPos);

                      var sun_in = "sun_in"+j; var sun_out = "sun_out"+j;
		      var mon_in = "mon_in"+j; var mon_out = "mon_out"+j;
                      var tue_in = "tue_in"+j; var tue_out = "tue_out"+j;
  		      var wed_in = "wed_in"+j; var wed_out = "wed_out"+j;
		      var thu_in = "thu_in"+j; var thu_out = "thu_out"+j;
		      var fri_in = "fri_in"+j; var fri_out = "fri_out"+j;
		      var sat_in = "sat_in"+j; var sat_out = "sat_out"+j;
                      var total = "total"+j;
                      var agentId = "agent"+j;
                      tmp_login = login;
                      //alert(tmp_login)

                      document.write("<tr>");
                      document.write("<td height=\"20\" width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1; border-left-style: solid; border-left-width: 1;border-right-style: solid; border-right-width: 1; border-top-style:solid; border-top-width:1\">"+ login +"<input type=\"hidden\" name=\""+ agentId +"\" value=\""+login+"\"></td>");
                      document.write("<td height=\"20\" style=\"border-bottom-style: solid; border-bottom-width: 1; border-left-style: solid; border-left-width: 1;border-top-style: solid; border-top-width: 1;border-right-style: solid; border-right-width: 1;\" NOWRAP>" +name +"</td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ sun_in +"\" onChange=\"calculateTotal("+j+")\"  MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1\" ><input type=\"text\" name=\""+ sun_out +"\" onChange=\"calculateTotal("+j+")\"  MAXLENGTH=5 SIZE=5 ></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ mon_in +"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ mon_out+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ tue_in+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1\" ><input type=\"text\" name=\""+ tue_out+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5 ></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ wed_in+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ wed_out+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1; border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ thu_in +"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ thu_out+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ fri_in+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ fri_out+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ sat_in+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"50\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ sat_out+"\" onChange=\"calculateTotal("+j+")\" MAXLENGTH=5 SIZE=5></td>");
                      document.write("<td width=\"80\" style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"text\" name=\""+ total+"\" MAXLENGTH=10 SIZE=10></td>");
                      document.write("</tr>");
                 tmp_sun_in="";
        	 tmp_sun_out="";
                //alert(total)
                 }
document.write("<tr>");
document.write("<td style=\"border-bottom-style: solid; border-bottom-width: 1;border-left-style: solid; border-left-width: 1;border-top-style:solid; border-top-width:1;border-right-style: solid; border-right-width: 1;\"><input type=\"hidden\" name=\"AllSchedData\"></td>");
document.write("</tr>");
document.write("</table>");
return;

}

function getSelectedObjects()
{
	selectedAgents = new Array()
	for (i=objects.selectedIndex;i<objects.options.length;i++) {
  		if (objects.options[i].selected) {
  			selectedAgents[selectedAgents.length]=objects.options[i].value;
  		}
  	}
	var url = '';
	if (selectedAgents.length > 0)
	{
		url= escape(selectedAgents.join('/'))
	}
	return url;
}

function submitInfo()
{
	if(weekFirstDate.value =='')
		{
			alert('Please, enter the week date!');
			return false;
		}

        if(showWeekDay(weekFirstDate.value)==0)
          return false;
	else
	  return true;
	//var Sched = packageScheduleData();
	//var loc = "../jsp/schedule.jsp?sched="+Sched;
	//alert(loc)
	//document.location = loc;
}

function refreshFrame() {
frames['comm'].window.location.href = "CommPage.htm"; // frame 1's page
}

function enabledFullTimeSchedBox(){
	ftweeksched.disabled = false;
	ftweekendsched.disabled = false;
	ptweeksched.disabled = true;
	ptweekendsched.disabled = true;
}

function enabledPartTimeSchedBox(){
	ftweeksched.disabled = true;
	ftweekendsched.disabled = true;
	ptweeksched.disabled = false;
	ptweekendsched.disabled = false;
}

</script>

<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="Manager.reports.*"%>
<jsp:useBean id="beanScheduler" scope="request" class="Manager.reports.beanSchedule" />

</head>

<body bgcolor="#98A6E9" onload="fillObjectCombo()">
<%
	grpChosen = request.getParameter("group"); %>

<!--<p align="center"> <strong> AGENT'S WORK SCHEDULE</strong></p>-->
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="77%"  >
  <tr>
    <td height="26" style="border-left-style: solid; border-left-width: 0; border-top-style: solid; border-top-width: 0" >&nbsp;</td>
    <td colspan="4" style="border-top-style: solid; border-top-width: 0; border-right-style: solid; border-right-width: 0" >
         <div align="center"><strong>AGENT'S WORKING SCHEDULE</strong></div></td>
  </tr>
  <tr>
    <td style="border-left-style: solid; border-left-width: 1; border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td style="border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td colspan="2" style="border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td style="border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1" >&nbsp;</td>
  </tr>
  <tr>
    <td width="20%" height="23" style="border-left-style: solid; border-left-width: 1; border-top-style: solid; border-top-width: 1" ><b>Agent
      Group : </b> </td>
    <td style="border-top-style: solid; border-top-width: 1" > <select name="agtGrp"  onChange="showScheduleForm()">
        <option value="AllGroups">- All Groups -</option>
      </select></td>
    <td width="30%" colspan="2" style="border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td width="12%" style="border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1" >&nbsp;</td>
  </tr>
  <tr>
    <td width="20%" height="23" style="border-left-style: solid; border-left-width: 1; border-top-style: solid; border-top-width: 1" ><b>Agents
      :</b> </td>
    <td style="border-top-style: solid; border-top-width: 1" > <select name="objects" >
        <option value="AllAgents">- All Agents -</option>
      </select></td>
    <td width="30%" colspan="2" style="border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td width="12%" style="border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1" >&nbsp;</td>
  </tr>
  <tr>
    <td height="20" style="border-left-style: solid; border-left-width: 1; border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td style="border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td colspan="2" style="border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td style="border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1" >&nbsp;</td>
  </tr>
   <tr>
    <td height="20" style="border-left-style: solid; border-left-width: 0; border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td style="border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td colspan="2" style="border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td style="border-right-style: solid; border-right-width: 0; border-top-style: solid; border-top-width:1" >&nbsp;</td>
  </tr>

  <tr>
    <td height="26" style="border-left-style: solid; border-left-width: 0; border-top-style: solid; border-top-width: 0" >&nbsp;</td>
    <td colspan="4" style="border-top-style: solid; border-top-width: 0; border-right-style: solid; border-right-width: 0" >
         <div align="center"><b>STANDARD WORK SCHEDULE</b></div></td>
  </tr>
  <tr>
    <td height="20" style="border-left-style: solid; border-left-width: 0; border-top-style: solid; border-top-width: 0" >&nbsp;</td>
    <td colspan="4" style="border-top-style: solid; border-top-width: 0; border-right-style: solid; border-right-width: 0" ><div align="center"></div></td>
  </tr>
   <script language="javascript" type="text/javascript">
       if(groupChosen != '')
            {
             getAgentsInGroup(groupChosen);
     	     }

   <%
    if(grpChosen.compareTo("")!=0){

   	beanSchedDetails r = null;
        if(beanScheduler.getScheduleData(grpChosen)==true) {

		for(int i=0; i < beanScheduler.m_schedDetails.size();i++)   {

    	      		r = (beanSchedDetails)beanScheduler.m_schedDetails.elementAt(i);


	  	out.write("fillFormForAgent('"+r.agt_id+"','"+r.sun_in+"','"+r.sun_out+"','"+ r.mon_in+"','"+r.mon_out+"','"+r.tue_in+"','"+r.tue_out+"','"+r.wed_in+"','"+r.wed_out+"','"+r.thu_in+"','"+r.thu_out+"','"+r.fri_in+"','"+r.fri_out+"','"+r.sat_in+"','"+r.sat_out+"');");


		}
            }
        }
    %>
    if(groupChosen != '')
        {
         for(i=0;i<nb_elmt;i++)
         	calculateTotal(i);
	 showWeekDayInit();
     	}

 </script>

  <tr>
    <td height="20" style="border-left-style: solid; border-left-width: 1; border-top-style: solid; border-top-width: 1" >&nbsp;</td>
    <td colspan="4" style="border-top-style: solid; border-top-width: 1; border-right-style: solid; border-right-width: 1" ><div align="center"></div></td>
  </tr>
  <tr>
    <td width="20%" style="border-left-style: solid; border-left-width: 1; border-bottom-style: solid; border-bottom-width: 1; border-top-style:solid; border-top-width:1" ></td>
    <td style="border-bottom-style: solid; border-bottom-width: 1; border-top-style:solid; border-top-width:1"></td>
    <td width="30%" colspan="2" style="border-bottom-style: solid; border-bottom-width: 1; border-top-style:solid; border-top-width:1"></td>
  <script language="javascript" type="text/javascript">
   	if(groupChosen == '')
            {
    	 	document.writeln("<td width=\"12%\" style=\"border-right-style: solid; border-right-width: 1; border-bottom-style: solid; border-bottom-width: 1; border-top-style:solid; border-top-width:1\" align=\"right\" >");
      	  	document.writeln(" <button onClick=\"submitInfo();\">submit</button></td>");
      	  	document.writeln(" </tr> ");
		document.writeln(" </table> ");

      	    }
   else  {
   		document.writeln("<td width=\"20%\" style=\"border-right-style: solid; border-right-width: 1; border-bottom-style: solid; border-bottom-width: 1; border-top-style:solid; border-top-width:1\" align=\"right\" >");
      	  	document.writeln(" <input type=\"submit\" onClick=\"showWeekDay();packageScheduleData()\" value=\"Submit\"><input type=\"reset\" value=\"Reset\"></td>");
      	  	document.writeln(" </tr> ");
		document.writeln(" </table> ");
   		document.writeln(" </form> ");
   	}
  </script>

<script language="JavaScript">
<!-- PopUp Calendar BEGIN -->
if (document.all) {
 document.writeln("<div id=\"PopUpCalendar\" style=\"position:absolute; left:0px; top:0px; z-index:7; width:200px; height:77px; overflow: visible; visibility: hidden; background-color: #FFFFFF; border: 1px none #000000\" onMouseOver=\"if(ppcTI){clearTimeout(ppcTI);ppcTI=false;}\" onMouseOut=\"ppcTI=setTimeout(\'hideCalendar()\',500)\">");
 document.writeln("<div id=\"monthSelector\" style=\"position:absolute; left:0px; top:0px; z-index:9; width:181px; height:27px; overflow: visible; visibility:inherit\">");}
else if (document.layers) {
 document.writeln("<layer id=\"PopUpCalendar\" pagex=\"0\" pagey=\"0\" width=\"200\" height=\"200\" z-index=\"100\" visibility=\"hide\" bgcolor=\"#FFFFFF\" onMouseOver=\"if(ppcTI){clearTimeout(ppcTI);ppcTI=false;}\" onMouseOut=\"ppcTI=setTimeout('hideCalendar()',500)\">");
 document.writeln("<layer id=\"monthSelector\" left=\"0\" top=\"0\" width=\"181\" height=\"27\" z-index=\"9\" visibility=\"inherit\">");}
else {
 document.writeln("<p><font color=\"#FF0000\"><b>Error ! The current browser is either too old or too modern (usind DOM document structure).</b></font></p>");}
</script>
<noscript>
<p><font color="#FF0000"><b>JavaScript is not activated !</b></font></p></noscript>
<table border="1" cellspacing="1" cellpadding="2" width="200" bordercolorlight="#000000" bordercolordark="#000000" vspace="0" hspace="0"><form name="ppcMonthList"><tr><td align="center" bgcolor="#CCCCCC"><a href="javascript:moveMonth('Back')" onMouseOver="window.status=' ';return true;"><font face="Arial, Helvetica, sans-serif" size="2" color="#000000"><b>&lt;&nbsp;</b></font></a><font face="MS Sans Serif, sans-serif" size="1">
<select name="sItem" onMouseOut="if(ppcIE){window.event.cancelBubble = true;}"  onChange="switchMonth(this.options[this.selectedIndex].value)" style="font-family: 'MS Sans Serif', sans-serif; font-size: 9pt">
    <option value="0" selected>2000 ? December</option>
    <option value="1" selected>2001 ? January</option>
    <option value="2">2001 ? February</option>
    <option value="3">2001 ? March</option>
    <option value="4">2001 ? April</option>
    <option value="5">2001 ? May</option>
    <option value="6">2001 ? June</option>
    <option value="7">2001 ? July</option>
    <option value="8">2001 ? August</option>
    <option value="9">2001 ? September</option>
    <option value="10">2001 ? October</option>
    <option value="11">2001 ? November</option>
    <option value="12">2001 ? December</option>
    <option value="13">2002  ? January</option>
    <option value="14">2002 ? February</option>
    <option value="15">2002 ? March</option>
    <option value="16">2002 ? April</option>
    <option value="17">2002 ? May</option>
    <option value="18">2002 ? June</option>
    <option value="19">2002 ? July</option>
    <option value="20">2002 ? August</option>
    <option value="21">2002 ? September</option>
    <option value="22">2002 ? October</option>
    <option value="23">2002 ? November</option>
    <option value="24">2002 ? December</option>
    <option value="25">2003 ? January</option>
</select></font><a href="javascript:moveMonth('Forward')" onMouseOver="window.status=' ';return true;"><font face="Arial, Helvetica, sans-serif" size="2" color="#000000"><b>&nbsp;&gt;</b></font></a></td></tr></form></table>
<table border="1" cellspacing="1" cellpadding="2" bordercolorlight="#000000" bordercolordark="#000000" width="200" vspace="0" hspace="0"><tr align="center" bgcolor="#CCCCCC"><td width="20" bgcolor="#FFFFCC"><b><font face="MS Sans Serif, sans-serif" size="1">Su</font></b></td><td width="20"><b><font face="MS Sans Serif, sans-serif" size="1">Mo</font></b></td><td width="20"><b><font face="MS Sans Serif, sans-serif" size="1">Tu</font></b></td><td width="20"><b><font face="MS Sans Serif, sans-serif" size="1">We</font></b></td><td width="20"><b><font face="MS Sans Serif, sans-serif" size="1">Th</font></b></td><td width="20"><b><font face="MS Sans Serif, sans-serif" size="1">Fr</font></b></td><td width="20" bgcolor="#FFFFCC"><b><font face="MS Sans Serif, sans-serif" size="1">Sa</font></b></td></tr></table>
<script language="JavaScript">
if (document.all) {
 document.writeln("</div>");
 document.writeln("<div id=\"monthDays\" style=\"position:absolute; left:0px; top:52px; z-index:8; width:200px; height:17px; overflow: visible; visibility:inherit; background-color: #FFFFFF; border: 1px none #000000\">&nbsp;</div></div>");}
else if (document.layers) {
 document.writeln("</layer>");
 document.writeln("<layer id=\"monthDays\" left=\"0\" top=\"52\" width=\"200\" height=\"17\" z-index=\"8\" bgcolor=\"#FFFFFF\" visibility=\"inherit\">&nbsp;</layer></layer>");}
else {/*NOP*/}
</script>
<!-- PopUp Calendar END --></script>
</body>

</html><body></body>