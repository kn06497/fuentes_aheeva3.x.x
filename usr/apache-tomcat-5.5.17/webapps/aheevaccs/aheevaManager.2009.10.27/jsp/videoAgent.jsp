<%@page contentType="text/html"%>
<html>
<LINK href="../Resources_pages/style.css" type=text/css rel=stylesheet>

<head>

<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/jsUtil.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/videoBrowser.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/BaseLayer.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/videoRecordingTable.js"></SCRIPT>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<SCRIPT>
document.oncontextmenu=new Function("return false;");

<!--<span class=clickableSpan oncontextmenu="displayMenu(); return false">   Right click here to open context menu</span>-->

var myTable;
var layer;
var rows = 1, cntRow = 0;
var cols = 1, cntCol = 0;
var myData ;
var bhh;
var bmm;
var ehh, emm, increment;
var agt_id;

 var beginTime = window.top.rtop.bdate.value;
 var endTime = window.top.rtop.edate.value;
 var period =  window.top.rtop.spacing.value;

function setRowNum(numrows)
{
  rows = 2*parseInt(numrows,10) + 1;
  myData = new Array(rows);
  cntRow = 0;
  //alert(rows)
}

function ToDatetime()
{
  var hh,min,totalMin,mo,rowInd,dayValue;
  var startime = ToDatetime.arguments[0];
  var duration = ToDatetime.arguments[1];
  var shour = parseInt(startime.substring(0,2),10);
  var smin = parseInt(startime.substring(3),10);
  var totalMin = smin + duration;
  nbHourToadd = Math.floor(duration/60);
  shour += nbHourToadd;
  totalMin = totalMin % 60;
  if(String(shour).length == 1)
     hh="0" + shour;
  else
     hh= shour;

  if(String(totalMin).length ==1)
      min="0" + totalMin;
   else
      min=String(totalMin);

  //get the year of the scheduled time block
  yy = window.top.rtop.year.value;

  //get the month of the scheduled time block
  mm = window.top.rtop.month.value;
  if(String(mm).length ==1)
     mo = "0"+ mm
  else
     mo = mm


  //get the day of the scheduled time block
  rowInd = ToDatetime.arguments[2];
  var cellvalue_array = myData[rowInd-1][0].split("/");
  dayValue = cellvalue_array[1];
  sret =yy+"-"+ mo+"-"+dayValue+" "+hh+':'+min+':00';

  return sret;
}
function CancelScheduling()
{
	var startcellindex = 0, endcellindex =0;
	var definedStartTimeBlock, definedEndTimeBlock;
	var agt = window.top.rtop.curAgentId;
	
	startcellindex = CancelScheduling.arguments[0];
	endcellindex = CancelScheduling.arguments[1];
	rowindex = CancelScheduling.arguments[2];
	
	definedStartTimeBlock = ToDatetime(beginTime,(startcellindex-1)*period,rowindex);
	definedEndTimeBlock = ToDatetime(beginTime,(endcellindex)*period,rowindex);

	window.top.opener.appletObj.sendCancelRecordingScheduleToServer( agt, definedStartTimeBlock, definedEndTimeBlock);
	
	//change cell color
	for(var pos=endcellindex; pos <= startcellindex; pos++)
      myTable.setCellColor(rowindex,pos,"orange");

}

function setSchedulingParams()
{
  var startcell = 0,endcell= 0, numrec=0,maxDuration=0,rowindex,mediaType;
  var definedStartTimeBlock,  definedEndTimeBlock,agt;
  startcellindex = setSchedulingParams.arguments[0]
  endcellindex = setSchedulingParams.arguments[1]
  numrec =  setSchedulingParams.arguments[2]
  maxDuration = setSchedulingParams.arguments[3]
  rowindex = setSchedulingParams.arguments[4]
  mediaType = setSchedulingParams.arguments[5]


  definedStartTimeBlock = ToDatetime(beginTime,(startcellindex-1)*period,rowindex);
  definedEndTimeBlock = ToDatetime(beginTime,(endcellindex)*period,rowindex);
  agt = window.top.rtop.curAgent
 // alert(startcellindex)
  //alert(endcellindex)
  //alert(rowindex)
       //alert(definedStartTimeBlock)
       //alert(definedEndTimeBlock)
       //alert(agt)
       //alert(mediaType)
	   //alert("agentid = ["+agt_id+"]");
	   
	
  window.top.opener.appletObj.sendRecordingScheduleToServer(definedStartTimeBlock,definedEndTimeBlock,agt_id,mediaType,numrec,maxDuration);
  //Now change the scheduled cells color to the defined cell Schedule color (red)
  for(var pos=startcellindex; pos <= endcellindex; pos++)
      myTable.setCellColor(rowindex,pos,"red");

}

function setScheduleData()
{
  var colIndex = 0,dataCol=0;
  var start = setScheduleData.arguments[0];
  var end = setScheduleData.arguments[1];
  var day = setScheduleData.arguments[2];
  var value = setScheduleData.arguments[3];
  var MonthArray =["","January","Febr.","March","April","May","June","July","Aug.","Sept.","Oct.","Nov.","Dec."];
  start = start.substring(0,2)+ start.substring(3);
  end = end.substring(0,2)+ end.substring(3);
  var startnum = parseInt(start,10);
  var endnum = parseInt(end,10);
//alert(start+'..'+end +'..'+value+'..'+day);
  //Set data for the first cell of the row
  myData[cntRow][colIndex++]= MonthArray[window.top.rtop.month.value] + '/'+day;
  //For each cell in this row, set the cell data value : 2, 3 or 5
  for(h_incr=bhh,m_incr=bmm;h_incr<ehh;m_incr+=increment){
     //get the start time and the end time of the current cell: colIndex
    if(m_incr>=60){
       m_incr=m_incr-60;
       h_incr=h_incr+1;
    }
    if(String(m_incr).length ==1)
       km="0"+m_incr;
    else
       km=String(m_incr);

    //break if last column
    if((h_incr == ehh)||(h_incr > ehh))
       break;

    if(String(h_incr).length ==1)
       kh="0"+h_incr;
    else
       kh=String(h_incr);

    sc_time = kh+km;    //this is the start time of this cell
    //alert("start :"+sc_time)

   //Get the end time of this cell
    next_mincr = m_incr + increment;
    next_hincr = h_incr;
    if(m_incr + increment >= 60){
       next_mincr = m_incr + increment-60;
       next_hincr = h_incr + 1;
    }

    if(String(next_mincr).length ==1)
          kem="0"+next_mincr;
    else
          kem=String(next_mincr);

    if(String(next_hincr).length ==1)
          keh="0"+next_hincr;
    else
          keh=String(next_hincr);

    ec_time = keh+kem;  //this is the end time of this cell
//   alert("end :"+ec_time);

    //get numeric values of start and end time
    sc_num = parseInt(sc_time,10);
    ec_num = parseInt(ec_time,10);
    if(sc_num >= startnum && ec_num <= endnum){
         myData[cntRow][colIndex]=value;
        // alert("myData: row.."+cntRow+" col.."+colIndex+" value.."+value)
    }
    colIndex = colIndex+1;
  }
}


function createTable()
{
  if(createTable.arguments.length > 1){
    rows = createTable.arguments[0];
  }

  //var hoverHelpData = new Array(rows);
  /*for (i=0;i<rows;i++)
  {
    //hoverHelpData[i] = new Array(cols);
    for (j=0;j<cols;j++) {
		if (i%2 == 0 && i!= 0)
		{
		  myData[i][j] = "";
		}
	}
  }*/
 //alert(rows+'..'+cols)
  myTable = new Table(rows,cols);
  //myTable.enableHoverHelp(true,hoverHelpData);
  myTable.setTableData(myData);
  myTable.setTablePos(4,4);
  myTable.enableColumnHeaders(true);
  myTable.enableRowHeaders(true);
  myTable.setRowHeight(18);
  myTable.setFirstRowHeight(30);
  myTable.setTableModelSchedule(true);
  /*myTable.enableRowSelection(true,"skyblue");
  myTable.setColumnWidth(columnWidths);
  myTable.setFont("",2);*/
  myTable.paint();

}


function setPageTitle()
{
	window.top.document.title = 	"Agent recording data";
}


function loadRecordingPage()
{
	var location  ='';
		agt_id = normalizeString(QueryString('agt_id'));// agent_id
        var agtId = normalizeString(QueryString('agt')); // DBID
        var mon = normalizeString(QueryString('mm'));
        var year = normalizeString(QueryString('yy'));
        var starttime = normalizeString(QueryString('st'));
        var endtime = normalizeString(QueryString('et'));

        starttime = starttime.substring(0,2)+':'+starttime.substring(3); //format as 07:00
        endtime = endtime.substring(0,2)+':'+endtime.substring(3);
//alert(mon+'..'+agtId)
		window.top.rtop.curAgentId = agt_id;  //agent_id
        window.top.rtop.curAgent = agtId;  //dbid
       location  = "videoRecording.jsp?agent="+agtId;
       location +="&st=";
       location += starttime;
       location +="&et=";
       location += endtime;
       location +="&mm=";
       location += mon;
       location +="&yy=";
       location += year;
        window.top.rbottom.location.href = location;
		
		//alert("agt_id= "+agt_id+" agt_ID= "+agt_Id+" mon= "+mon+" year= "+year+" starttime= "+starttime+" endtime= "+endtime );

}

function setColumNum()
{
  bhh = parseInt(beginTime.substring(0,2),10);
  bmm = parseInt(beginTime.substring(3,5),10);
  ehh = parseInt(endTime.substring(0,2),10);
  emm = parseInt(endTime.substring(3,5),10);
  increment =  parseInt(period,10);
  //alert("begintime="+beginTime+" .. "+"endTime="+endTime+" .. "+bhh +'..'+bmm+'--'+ehh +'..'+emm+ '--'+increment)
  //document.write("<tr>");
  //document.write("<td width=\"100\" height=\"20\" style=\"border-bottom-style: solid; border-bottom-width: 1; border-left-style: solid; border-left-width: 1;border-top-style: solid; border-top-width: 1;border-right-style: solid; border-right-width: 1;\">" +"Date/Time"+"</td>");
 var ncols = 0;
 for(i=bhh,j=bmm;i<ehh;j+=increment){
    if(j>=60){
       j=j-60;
       i=i+1;
    }
    if(String(j).length ==1)
       k="0"+j;
    else
       k=j;
    ncols = ncols+1;
   // document.write("<td width=\"100\" height=\"20\">" +i+":"+k+"</td>");
 }
    cols = ncols;
}

function setColumHeadersValue()
{
   var colNum=0
   //Set array for row header data
   myData[0] = new Array(cols);
   myData[0][0]="Date";
   for(i=bhh,j=bmm;i<ehh;j+=increment){
      colNum++;
      if(j>=60){
         j=j-60;
         i=i+1;
      }

    if(String(j).length ==1)
         k="0"+j;
    else
         k=j;
    value = i+":"+k;
    myData[0][colNum]= value;
  }
}

</script>
</head>
<%@page language = "java" %>
<%@ page import="java.util.*" %>

<%@page import ="aheevaManager.VideoReports.*"%>
<jsp:useBean id="beanScheduler" scope="request" class="aheevaManager.VideoReports.beanVideoAgentSchedule" />

<body  class="grey" onload="loadRecordingPage();">
<!--<p> <font color="#0000FF" face="Arial"><b>-->

<%
    String agentId="";
    String inTime = "";//"07:00";
    String outTime = "";//"10:00";
	String agt_id = "";
    int spaceColumn = 30;
    String mm="", yy="";
    if ( request.getParameter("agt") != null ) {
    	agentId = request.getParameter("agt");
        System.out.println("<script language='javascript'>document.write(MultiArray[\"Agent ID\"][lang]);</script>"" : " +agentId );
    }
    if ( request.getParameter("st") != null ) {
    	inTime = request.getParameter("st");
        System.out.println("<script language='javascript'>document.write(MultiArray[\"Start time\"][lang]);</script>""  : " + inTime);
    }
    if ( request.getParameter("et") != null ) {
    	outTime = request.getParameter("et");
        System.out.println("<script language='javascript'>document.write(MultiArray[\"End time\"][lang]);</script>"" : " +outTime );
    }
    if ( request.getParameter("cols") != null && request.getParameter("cols").compareTo("") !=0) {
    	spaceColumn = Integer.parseInt(request.getParameter("cols"));
        System.out.println("<script language='javascript'>document.write(MultiArray[\"Space column\"][lang]);</script>"" : " +spaceColumn );
    }
    if ( request.getParameter("mm") != null ) {
    	mm = request.getParameter("mm");
        System.out.println("<script language='javascript'>document.write(MultiArray[\"Month\"][lang]);</script>"" : " +mm );
    }
    if ( request.getParameter("yy") != null ) {
    	yy = request.getParameter("yy");
        System.out.println("<script language='javascript'>document.write(MultiArray[\"Year\"][lang]);</script>"" : " +yy );
    }
	if ( request.getParameter("agt_id") != null ) {
    	agt_id = request.getParameter("agt_id");
    }	

%>
<!--<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">-->
<script>
	//alert("agentId="+agendId+" inTime="+inTime+" outTime="+outTime+" agt_id="+agt_id+" mm="+mm+" yy="+yy);
    setColumNum();
</script>
<%
  int bhr = 7;//Integer.parseInt(request.getParameter("beginTime").substring(0,2));
  int bmin = 0;//Integer.parseInt(request.getParameter("beginTime").substring(2,4));
  int ehr = 10;//Integer.parseInt(request.getParameter("endTime").substring(0,2));
  int emin = 0;//Integer.parseInt(request.getParameter("endTime").substring(2,4));
  int i=0,j=0, cnt, nb_elt ;
  String k="";
  beanVideoWorkScheduleDetails mySchedData = null;
  beanVideoWorkScheduleDetails myRecSchedData = null;
  //out.write("<tr><td></td>");
  for(i=bhr,j=bmin;i<ehr;j+=spaceColumn){

    if(j>=60){
       j=j-60;
       i=i+1;
    }
  /*if(Integer.toString(j).length == 1)
    k="0"+j;
  else
    k=j;*/
  //out.write("<td width=\"50\" height=\"20\">" +i+":"+j+"</td>");
  }
  //out.write("</tr>");
  //agentId = "101";
  beanScheduler.getAgentWorkSchedule(agentId,mm,yy,inTime,outTime);
  beanScheduler.getAgentRecordingSchedule(agt_id,mm,yy,inTime,outTime);
  int recIndice = 0, nb_rec_elt=0;
  int curWorkSchedDay = 0,curRecSchedDay=0;
 %>
  <script>
    setRowNum('<%out.write(Integer.toString(beanScheduler.m_schedDailyDetails.size()));%>');
    setColumHeadersValue();	
  </script>
<%
  for(cnt = 0;cnt < beanScheduler.m_schedDailyDetails.size();cnt++){
        Vector this_day_schedule_data = (Vector)beanScheduler.m_schedDailyDetails.elementAt(cnt);
%>
  <script>
       cntRow++;
       myData[cntRow] = new Array(cols);
  </script>
<%
       //Get the current day value for work schedule
       curWorkSchedDay = ((beanVideoWorkScheduleDetails)this_day_schedule_data.elementAt(0)).dayInMonth;
       for(nb_elt=0; nb_elt < this_day_schedule_data.size();nb_elt++){
             mySchedData =(beanVideoWorkScheduleDetails)this_day_schedule_data.elementAt(nb_elt);

             //out.write("<td width=\"50\" bgcolor=\"#FFFFFF\" align=\"center\"><font size=\"2\" color=\"#000000\"><b>" + mySchedData.startTime +"</b></font></td>");
%>
  <script>
          setScheduleData('<%out.write(mySchedData.startTime);%>','<%out.write(mySchedData.endTime);%>','<%out.write(Integer.toString(mySchedData.dayInMonth));%>','<%out.write(Integer.toString(mySchedData.activity_type));%>');
  </script>
  <%
        }
  %>
   <script>
          cntRow++;
          myData[cntRow] = new Array(cols);
          for (nc=0;nc<cols;nc++) {
            if (cntRow %2 == 0 && cntRow!= 0)
		{
		  myData[cntRow][nc] = "";
		}
          }

   </script>
  <%
  	 System.out.println("agent.jsp: recIndice["+recIndice+"] AND beanScheduler.m_schedDailyRecording.size()["+beanScheduler.m_schedDailyRecording.size()+"]");
     if(recIndice < beanScheduler.m_schedDailyRecording.size())
     {
       Vector this_day_rec_schedule_data = (Vector)beanScheduler.m_schedDailyRecording.elementAt(recIndice);
        //Get the current recording day value
       curRecSchedDay = ((beanVideoWorkScheduleDetails)this_day_rec_schedule_data.elementAt(0)).dayInMonth;
	   //while the current work is bigger than the recording day, increment the recording day 
	   while(curWorkSchedDay > curRecSchedDay && recIndice < beanScheduler.m_schedDailyRecording.size()){
	   		recIndice++;
			this_day_rec_schedule_data = (Vector)beanScheduler.m_schedDailyRecording.elementAt(recIndice);
        	//Get the current recording day value
       		curRecSchedDay = ((beanVideoWorkScheduleDetails)this_day_rec_schedule_data.elementAt(0)).dayInMonth;		
	   }
       if(curWorkSchedDay == curRecSchedDay)
        {   //We have the right day. Copy recording schedule inside myData..
          for(nb_rec_elt=0; nb_rec_elt < this_day_rec_schedule_data.size();nb_rec_elt++){
             myRecSchedData =(beanVideoWorkScheduleDetails)this_day_rec_schedule_data.elementAt(nb_rec_elt);
             //Now set value for recording schedule
 %>
  <script>
            setScheduleData('<%out.write(myRecSchedData.startTime);%>','<%out.write(myRecSchedData.endTime);%>','<%out.write(Integer.toString(myRecSchedData.dayInMonth));%>','<%out.write(Integer.toString(myRecSchedData.activity_type));%>');
  </script>
  <%
          }
          //Move to next day inside m_schedDailyRecording Vector
          recIndice++;
      }
     }
   }
  %>
 <script>
   createTable();
 </script>
   <!-- <td width="70" bgcolor="#0000FF" align="center"><font color="#FFFFFF" size="2"> Time Period </font></td>-->

<!--</table>
</b></font></p>-->
</body>
</html>
