<%@page contentType="text/html"%>
<%@page import = "aheevaManager.ressources.*" %>
<html>
<LINK href="../Resources_pages/style.css" type=text/css rel=stylesheet>

<head>
<%	
beanManagerData pageData = new beanManagerData();
pageData.openConnection();

if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

 %>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/jsUtil.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/Browser.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/BaseLayer.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/Table.js"></SCRIPT>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<script language="javascript" type="text/javascript">
document.oncontextmenu=new Function("return false;");
<!--<span class=clickableSpan oncontextmenu="displayMenu(); return false">   Right click here to open context menu</span>-->

/* Variables declarations and Initializations*/
	var myTable;							// the table object that will be drawn for scheduling & adherence
	var layer;
	var rows = 1, cntRow = 0;				// the number of rows in the table
	var cols = 1, cntCol = 0;				// the number of columns in the table
	var myData ;							// the data in each cell of the table
	var bhh;								// tmp. variable indicating the begin hour value of the current cell
	var bmm;								// tmp. variable indicating the begin minute value
	var ehh, emm;							// tmp. variable indicating the end hour value, end minute value
	var increment;							// spacing between column in minutes
	var agt_id;
	
	 var beginTime, endTime, period; //window.top.main.rtop.bdate.value;
	 var starttime = normalizeString(QueryString('startTime'));
	 var endtime   = normalizeString(QueryString('endTime'));
	 period  = normalizeString(QueryString('spacing'));

	 if(starttime != 'undefined' && starttime.length > 0) 	
		beginTime = starttime.substring(0,2)+starttime.substring(3);
	 else
		beginTime = "0900";
	
	 if(endtime != 'undefined' && endtime.length > 0) 	
		endTime = endtime.substring(0,2)+endtime.substring(3);
	 else
		endTime = "2100";
	
	 if(period.length > 0) 	
		period = period.substring(0,2)+period.substring(3);
	 else
		period = "30";
 	//alert(beginTime+'..'+endTime+'..'+period)

function setRowNum(numrows)
{
  rows = 2*parseInt(numrows,10) + 1;
  myData = new Array(rows);
  cntRow = 0;
  //alert(rows)
}


function setScheduleData()
{
  var colIndex = 0,dataCol=0;
  var start = setScheduleData.arguments[0];
  var end = setScheduleData.arguments[1];
  var day = setScheduleData.arguments[2];
  var value = setScheduleData.arguments[3];
  var monthValue = setScheduleData.arguments[4];
  var MonthArray =["","Jan","Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec"];
  start = start.substring(0,2)+ start.substring(3);
  end = end.substring(0,2)+ end.substring(3);
  var startnum = parseInt(start,10);
  var endnum = parseInt(end,10);
  //alert(start+'..'+end +'..'+value+'..'+day);
  //Set data for the first cell of the row
  myData[cntRow][colIndex++]= MonthArray[monthValue] + '/'+day;
  //For each cell in this row, set the cell data value : 2, 3 or 5
  for(h_incr=bhh,m_incr=bmm;h_incr<ehh || m_incr<=emm;m_incr+=increment){
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
    if((h_incr == ehh || h_incr > ehh) && (m_incr >= emm ) )
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
  	//alert("start :"+sc_time +"  end :"+ec_time);

    //get numeric values of start and end time
    sc_num = parseInt(sc_time,10);
    ec_num = parseInt(ec_time,10);
    if(sc_num >= startnum && ec_num <= endnum){
         myData[cntRow][colIndex]=(value==0?"":value);
         //alert("myData: row.."+cntRow+" col.."+colIndex+" value.."+value)
    }
	else if(startnum >=sc_num  && endnum <ec_num){
         myData[cntRow][colIndex]=10;
	}
	else if(startnum >=sc_num && startnum <ec_num){
	  	 myData[cntRow][colIndex]=10;
	}
	else if(endnum > sc_num && endnum <ec_num){
	  	 myData[cntRow][colIndex]=10;
	}
	
    colIndex = colIndex+1;
  }
}


function createTable()
{
    if(createTable.arguments.length > 1){
      rows = createTable.arguments[0];
    }

  //alert(rows+'..'+cols)
  myTable = new Table(rows,cols);
  myTable.setTableData(myData);
  myTable.setTablePos(4,125);
  myTable.enableColumnHeaders(true);
  myTable.enableRowHeaders(true);
  myTable.setRowHeight(18);
  myTable.setFirstRowHeight(30);
  myTable.setTableModelSchedule(true);
  myTable.enableCellSelection(false);
  myTable.paint();

}


function setPageTitle()
{
	window.top.document.title = 	"Agent Schedule and Adherence data";
}


function setColumNum()
{
	  bhh = parseInt(beginTime.substring(0,2),10);
	  bmm = parseInt(beginTime.substring(2,4),10);
	  ehh = parseInt(endTime.substring(0,2),10);
	  emm = parseInt(endTime.substring(2,4),10);
	  increment =  parseInt(period,10);
	  //alert(bhh +'..'+bmm+'--'+ehh +'..'+emm+ '--'+increment)
	  //document.write("<tr>");
	  //document.write("<td width=\"100\" height=\"20\" style=\"border-bottom-style: solid; border-bottom-width: 1; border-left-style: solid; border-left-width: 1;border-top-style: solid; border-top-width: 1;border-right-style: solid; border-right-width: 1;\">" +"Date/Time"+"</td>");
	  var ncols = 0;
	  for(i=bhh,j=bmm;i<ehh || j<=emm;j+=increment){
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
	//alert(cols)
}

function setColumHeadersValue()
{
   var colNum=0
   //Set array for row header data
   myData[0] = new Array(cols);
   myData[0][0]="Date";
   for(i=bhh,j=bmm;i<ehh || j<=emm;j+=increment){
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

<%@page import ="aheevaManager.schedule.*"%>
<jsp:useBean id="beanScheduler" scope="request" class="aheevaManager.schedule.beanAgentSchedule" />

<body  class="grey" > <!--onload="loadRecordingPage();"-->
<%
   Calendar c = new GregorianCalendar();
    
    // Get the components of the date
    int y = c.get(Calendar.YEAR);       
    int m = c.get(Calendar.MONTH) + 1;
    int d = c.get(Calendar.DATE);
    int spaceColumn = 30, numObjects=0, cntAgent;
    String mm = Integer.toString(m);
    String dd = Integer.toString(d);
    String defaultDate = y + "/"+(m < 10 ? "0" + mm : mm) +"/"+(d < 10 ? "0" + dd : dd);
    System.out.println("Default date : " +defaultDate ); 
 
    String agents="", agentId = "3360";
    String inTime  = "09:00";
    String outTime = "21:00";	
	String startMonth=mm, startYear=Integer.toString(y);
	String startDate =defaultDate,endDate=defaultDate, viewType="daily";	
    StringTokenizer tok = null;


	if ( request.getParameter("objects") != null ) {
    	agents = request.getParameter("objects");
        System.out.println("Agents  : " +agents );
    }
	
	if ( request.getParameter("startTime") != null && request.getParameter("startTime").length() > 0) {
    	inTime = request.getParameter("startTime");
        System.out.println("Start time : " + inTime);
    }
    if ( request.getParameter("endTime") != null && request.getParameter("endTime").length() > 0 ) {
    	outTime = request.getParameter("endTime");
        System.out.println("End time : " +outTime );
    }
    if ( request.getParameter("spacing") != null && request.getParameter("spacing").length() > 0) {
    	spaceColumn = Integer.parseInt(request.getParameter("spacing"));
        System.out.println("Space column : " +spaceColumn );
    }
    if ( request.getParameter("starting_month_monthly") != null && request.getParameter("starting_month_monthly").length() > 0) {
    	startMonth = request.getParameter("starting_month_monthly");
        System.out.println("Month : " +startMonth );
    }
    if ( request.getParameter("starting_year_monthly") != null && request.getParameter("starting_year_monthly").length() > 0) {
    	startYear = request.getParameter("starting_year_monthly");
        System.out.println("Year : " +startYear );
    }
	if ( request.getParameter("startingDate") != null && request.getParameter("startingDate").length() > 0) {
    	startDate = request.getParameter("startingDate");
		startDate = startDate.substring(6)+"/"+ startDate.substring(0,2)+"/"+startDate.substring(3,5) ;
        System.out.println("startDate : " +startDate );
    }
	if ( request.getParameter("endingDate") != null && request.getParameter("endingDate").length() > 0) {
	   	endDate = request.getParameter("endingDate");
		endDate = endDate.substring(6)+"/"+ endDate.substring(0,2)+"/"+endDate.substring(3,5) ;
        System.out.println("endDate : " +endDate );
    }
	if ( request.getParameter("reportType") != null && request.getParameter("reportType").length() > 0) {
    	viewType = request.getParameter("reportType");
        System.out.println("reportType : " +viewType );
    }

	//Construct an adherence table for each selected agent 
    if(agents != null){
        tok = new java.util.StringTokenizer(agents,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
    numObjects = tok.countTokens();
    for( cntAgent = 0; cntAgent < numObjects; cntAgent++ ) {
        agentId = tok.nextToken();
        System.out.println("Agentid: " + agentId);

	  beanWorkScheduleDetails mySchedData = null;
	  beanWorkScheduleDetails myAdhSchedData = null;
	  int  cnt, nb_elt ;
	
	  String inT = inTime.substring(0,2)+ inTime.substring(3);
	  String outT = outTime.substring(0,2)+ outTime.substring(3);
	
	  if(viewType.equalsIgnoreCase("Monthly") == true){
		 String tmpStartDate = startYear+"/"+startMonth+"/"+"01";
		 String tmpEndDate = startYear+"/"+startMonth+"/"+"31";
		 beanScheduler.getAgentWorkSchedule(agentId,startYear,startMonth,"","",inTime,outTime,viewType);
		 beanScheduler.getAdherence2(agentId,tmpStartDate,tmpEndDate,inT,outT,spaceColumn);
	 }else{
		 beanScheduler.getAgentWorkSchedule(agentId,"","",startDate,endDate,inTime,outTime,viewType);
		 beanScheduler.getAdherence2(agentId,startDate,endDate,inT,outT,spaceColumn);
	  }

%>
<!--<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">-->
<table width="947" border="0" align="center">
  <tr>
    <td width="50"  class="reportsID"></td>
    <td width="350" valign="top" ><font size=4><b><%=pageData.getWord("Agent")%> 	
        <%out.write(viewType);%>
		<%=pageData.getWord("Adherence report")%>  </b></font>
	<%
		out.write("<br><br><b> <font color='black'> Name: "+beanScheduler.getAgentFullName(agentId)+" ["+ agentId+ "] <br><br> ");
		if (viewType.compareTo("Daily") ==0){
			if(startDate.compareTo(endDate) == 0)
				out.write(" Day: "+ startDate);
			else
			 	out.write(" Period: From "+ startDate + " to " + endDate);
		} else if (viewType.compareTo("Monthly") ==0){
			out.write(" Month:"+startMonth+"/"+startYear);
		} 
		out.write(" </b></font>");
	%>
      </td>
    <td width="31" valign="top"  class="reportsID">&nbsp;</td>
    <td width="438" valign="top"  class="reportsID"><table width="373" border="0">
      <tr>
        <td height="4" bgcolor="#3333FF">&nbsp;</td>
        <td ><%=pageData.getWord("Work period")%> </td>
        <td bgcolor="#339933" >&nbsp;</td>
        <td ><%=pageData.getWord("Adherence value")%>:<%=pageData.getWord("yes")%>  </td
      </tr>
      <tr>
        <td width="11" height="4" bgcolor="#FFFF00">&nbsp;</td>
        <<td width="183" ><%=pageData.getWord("Break/Meal period")%> </td>
        <td width="11" bgcolor="#FF0000" >&nbsp;</td>
        <td width="150" ><%=pageData.getWord("Adherence value")%>:<%=pageData.getWord("no")%>  </td>
      </tr>
      <tr>
        <td height="4" bgcolor="#3399CC">&nbsp;</td>
        <td ><%=pageData.getWord("Gap between work and break")%> </td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
      </tr>
      <tr>
        <td height="4" bgcolor="#FFFFFF">&nbsp;</td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
      </tr>
    
    </table></td>
  </tr>
  <tr align="center"> 
    <td  height=25 bgcolor="#FFFFFF">&nbsp;</td>
  	<td  valign=middle><div align="justify" class="reportsID"><b><%=pageData.getWord("Adherence")%> :  
        <%	String tmp = Double.toString(beanScheduler.adherenceValue);
							int index = tmp.indexOf(".");
							if(index >0 && tmp.substring(index).length() > 2)
								tmp = tmp.substring(0,index) + tmp.substring(index,index+2);
							else
								tmp = tmp + "0";	
							out.write(tmp+"%");	
						%> 
    </b></div></td>  
  </tr>
</table>
<script language="javascript" type="text/javascript">
    setColumNum();
</script>
<%
  int adhIndice = 0, nb_rec_elt=0;
  int curWorkSchedDay = 0,curAdherenceDay=0;
 %>
  <script language="javascript" type="text/javascript">
    //Set the number of rows in the table
    setRowNum('<%out.write(Integer.toString(beanScheduler.m_schedDailyDetails.size()));%>');
    setColumHeadersValue();
  </script>
<%
  for(cnt = 0;cnt < beanScheduler.m_schedDailyDetails.size();cnt++){
        Vector this_day_schedule_data = (Vector)beanScheduler.m_schedDailyDetails.elementAt(cnt);
%>
  <script language="javascript" type="text/javascript">
       cntRow++;
       myData[cntRow] = new Array(cols);
  </script>
<%
       //Get the current day value for work schedule
       curWorkSchedDay = ((beanWorkScheduleDetails)this_day_schedule_data.elementAt(0)).dayInMonth;
       for(nb_elt=0; nb_elt < this_day_schedule_data.size();nb_elt++){
             mySchedData =(beanWorkScheduleDetails)this_day_schedule_data.elementAt(nb_elt);
             //out.write("<td width=\"50\" bgcolor=\"#FFFFFF\" align=\"center\"><font size=\"2\" color=\"#000000\"><b>" + mySchedData.startTime +"</b></font></td>");
%>
  <script language="javascript" type="text/javascript">
          setScheduleData('<%out.write(mySchedData.startTime);%>','<%out.write(mySchedData.endTime);%>','<%out.write(Integer.toString(mySchedData.dayInMonth));%>','<%out.write(Integer.toString(mySchedData.activity_type));%>','<%out.write(Integer.toString(mySchedData.month));%>');
  </script>
<%
        }
%>
   <script language="javascript" type="text/javascript">
   		  //go to the next row, this row will show the adherence data
		  //First, initialize the cells value
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
  	 System.out.println("agentAdherenceView.jsp: adhIndice["+adhIndice+"] AND beanScheduler.m_schedDailyDetails.size()["+beanScheduler.m_schedDailyDetails.size()+"] AND beanScheduler.m_schedDailyAdherence.size()["+beanScheduler.m_schedDailyAdherence.size()+"]");
     if(adhIndice < beanScheduler.m_schedDailyAdherence.size())
     {
       Vector this_day_adherence_data = (Vector)beanScheduler.m_schedDailyAdherence.elementAt(adhIndice);
        //Get the current adherence day value
       curAdherenceDay = ((beanWorkScheduleDetails)this_day_adherence_data.elementAt(0)).dayInMonth;
	   //As long as the current work day is bigger than the adherence day, increment the adherence day 
	   while(curWorkSchedDay > curAdherenceDay && (adhIndice < beanScheduler.m_schedDailyAdherence.size()-1)){
	   		adhIndice++;
			this_day_adherence_data = (Vector)beanScheduler.m_schedDailyAdherence.elementAt(adhIndice);
        	//Get the current recording day value
       		curAdherenceDay = ((beanWorkScheduleDetails)this_day_adherence_data.elementAt(0)).dayInMonth;		
	   }
       if(curWorkSchedDay == curAdherenceDay)
        {   //We have the right day. Copy recording schedule inside myData..
          for(nb_rec_elt=0; nb_rec_elt < this_day_adherence_data.size();nb_rec_elt++){
             myAdhSchedData =(beanWorkScheduleDetails)this_day_adherence_data.elementAt(nb_rec_elt);
            //Now set value for recording schedule
 %>
  <script language="javascript" type="text/javascript">
            setScheduleData('<%out.write(myAdhSchedData.startTime);%>','<%out.write(myAdhSchedData.endTime);%>','<%out.write(Integer.toString(myAdhSchedData.dayInMonth));%>','<%out.write(Integer.toString(myAdhSchedData.activity_type));%>');
  </script>
  <%
          } //end for
          //Move to next day inside m_schedDailyAdherence Vector
          adhIndice++;
      } // end if
     }//end if 
	 
   } // end for 
  %>
 <script language="javascript" type="text/javascript">
   createTable();
 </script>
   <!-- <td width="70" bgcolor="#0000FF" align="center"><font color="#FFFFFF" size="2"> Time Period </font></td>-->
 <%  
} // end For 
%>
<!--</table>
</b></font></p>-->
</body>
</html>
<%
pageData.closeConnection();
%>