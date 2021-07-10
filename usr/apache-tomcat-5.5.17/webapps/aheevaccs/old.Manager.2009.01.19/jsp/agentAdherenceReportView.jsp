<%@page contentType="text/html"%>
<html>
<LINK href="../Resources_pages/style.css" type=text/css rel=stylesheet>

<style>
<!--
/* Context menu Script- © Dynamic Drive (www.dynamicdrive.com) Last updated: 01/08/22
For full source code and Terms Of Use, visit http://www.dynamicdrive.com */

.skin0{
	position:absolute;
	width:145px;
	border:2px solid black;
	background-color:lavenderblush ;
	font-family:Verdana;
	line-height:15px;
	cursor:default;
	font-size:10px;
	z-index:80;
	visibility:hidden;
}

.menuitems{
	padding-left:6px;
	padding-right:6px;
	height:17;
	visibility:visible;
}

div.sousmenu{
	position:absolute; 
	left:0; 
	height:20; 
	width:145px;
	visibility:hidden; 
	border:2px solid black;
	border-style: solid; 
	border-color: #000000;
	background-color:#C3C9D4;
}

a.menu{font-family:arial; color: black; font-size: 11px; font-weight:bold; text-decoration: none;}
a.smenu{font-family:arial; color:black; font-size: 11px; font-weight:bold; text-decoration: none;}
-->
</style>

<head>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/jsUtil.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/Table1.js"></SCRIPT> 
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<SCRIPT>
document.oncontextmenu=new Function("return false;");
<!--<span class=clickableSpan oncontextmenu="displayMenu(); return false">   Right click here to open context menu</span>-->

/* Variables declarations and Initializations*/
	 var myTable;							// the table object that will be drawn for scheduling & adherence
	 var layer;
	 var rows = 1, cntRow = 0;				// the number of rows in the table
	 var cols = 1, cntCol = 0;				// the number of columns in the table
	 var myData ;							// the data in each cell of the table
	 var cells;
	 var hoverHelpData;
	 var personalData;						// table containing private data as: IP, first login, group name, etc..
	 var adherenceDetails;					// table containing adherence details for each period
	 
	 var bhh;								// tmp. variable indicating the begin hour value of the current cell
	 var bmm;								// tmp. variable indicating the begin minute value
	 var ehh, emm;							// tmp. variable indicating the end hour value, end minute value
	 var increment;							// spacing between column in minutes
	 var agt_id;
	 var viewHTML;							//the html code of the view 
	 var allAgentScheduleData=new Array();    //Tab containing all schedule and adherence data received from CTI
	 var thisDayScheduleInfo=new Array();    //Tab containing only schedule info received from CTI for all agents
	 var nrow ;
	 var thetime = new Date();
	 var today=thetime.getYear()+"/"+(thetime.getMonth()+1)+"/"+thetime.getDate();
	 var firstLoad = true;
	 var lastZoomFactor = 0.5;
	 var adherenceValue, lglobaladherence ;
	 var rowSelected = 0;
	 var nreload = 0;
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
	  cells = new Array(rows);
	  hoverHelpData = new Array(rows);
	  personalData = new Array(rows);
	  adherenceDetails	= new Array(rows);
	  cntRow = 0;
	
}


function createTable()
{
	  myTable = new Table(rows,cols);
	  myTable.enableHoverHelp(true,hoverHelpData);
	  myTable.setTableData(myData);
	  myTable.setCellData(cells);
	  myTable.setTablePos(4,125);
	  myTable.enableColumnHeaders(true);
	  myTable.enableRowHeaders(true);
	  myTable.setRowHeight(18);    //18
	  myTable.setFirstRowHeight(30);
	  myTable.setTableModelSchedule(true);
	  myTable.setTableModelRta(true);
	  myTable.enableCellSelection(false);
	  myTable.enableRowSelection(true,"lightgrey");
	  myTable.setCellColor("royalblue","yellow", "skyblue","green", "red");
	  myTable.setHightLightCellColor("darkblue","gold","powderblue","lightgreen","darkred","powderblue");
	  myTable.paint3(viewHTML);

}


function setPageTitle()
{
	window.top.document.title = 	"Agent Schedule and Adherence Report";
}


function setColumNum()
{
	  bhh = parseInt(beginTime.substring(0,2),10);
	  bmm = parseInt(beginTime.substring(2,4),10);
	  ehh = parseInt(endTime.substring(0,2),10);
	  emm = parseInt(endTime.substring(2,4),10);
	  increment =  parseInt(period,10);
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
}

function setColumHeadersValue()
  {
	   var colNum=0
	   //Set array for row header data
	   myData[0] = new Array(cols);
	   hoverHelpData[0] = new Array(cols);
	   cells[0]= new Array(cols);
	   myData[0][0]=" Time hh:mm";
	   hoverHelpData[0][0]="";
	   cells[0][0]= "";
	   personalData[0]="";
	   adherenceDetails[0]="";
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
		hoverHelpData[0][colNum]=value;
		cells[0][colNum] = value;
	  }
  }

   function generateRtaView()
   {
        viewHTML = "<TABLE cellspacing=1px bgcolor=lightyellow>";
    	setColumNum();
		//Set the number of rows in the table
		nrow = allAgentScheduleData.length;
		if((nrow == 0) || (allAgentScheduleData[0].length==0)){
			window.top.main.rtop.refreshAgentAdherenceStats();
			nrow = allAgentScheduleData.length;
		}

		if(allAgentScheduleData.length == 0)
			nrow = 0;
		setRowNum(nrow);
		setColumHeadersValue();
		viewHTML += '<TR>';
		for(c=0;c < cols ; c++)
		   viewHTML += "<TD align='center' width=100 height=30 bgcolor=gray  title=\""+ hoverHelpData[0][c]+"\">"+myData[0][c]+"</TD>";
		viewHTML += '</TR>';

	   var cnt=0,iter=0, n=0, nParam;       //counter for iteration
	   var nb_elt = 0;
	   var timeBlockData;                   //Data for this time block
	   var agentDaySchedAdherence;          //all schedule and adherence data for an agent

	   var curAgtID, curAgtName='';         //the current agent ID and name
	   var nbCells=0;
	   var jsSchedData, arrayTimeBlock;
	   var startTime,stopTime,activity_type,adherenceData;
	   var nNoAdh = 0, nAdh = 0;
	   lglobaladherence = 0;

	   if(rows > 1 ){
		  //Loop for every agent
		  for(cnt = 0;cnt < allAgentScheduleData.length;cnt++){
			 //Get the adherence and schedule data for this agent
			 agentDaySchedAdherence = allAgentScheduleData[cnt];

			 //Add a new row to myData for this agent schedule
			 cntRow++;
			 myData[cntRow] = new Array(cols);
			 hoverHelpData[cntRow] = new Array(cols);
			 cells[cntRow] = new Array(cols);
			 //Add a new row to myData for this agent adherence
			 myData[cntRow+1] = new Array(cols);
			 hoverHelpData[cntRow+1] = new Array(cols);
			 cells[cntRow+1] = new Array(cols);
			 for (nc=0;nc<cols;nc++) {
			 	cells[cntRow][nc] = "";
				cells[cntRow+1][nc] = "";
				if ((cntRow+1) %2 == 0 && (cntRow+1)!= 0)
				   {
					  myData[cntRow][nc] = "";
				   }
			  }

			 //Set current agent ID and Fill the new row with schedule data :
			 //1047^0-17:2,18-29:5,30-30:3,31-31:6,32-41:5^0-26:2,27-27:0|
			 var jsAgentData = agentDaySchedAdherence + "";
			 arrayAgentData	= jsAgentData .split("^");
			 var colIndex = 0;
			 for(nElt = 0; nElt < arrayAgentData.length; nElt++)
			  {
			  		  nbCells=0;
					  if(nElt == 0){
							curAgtID = arrayAgentData[0];
							if(curAgtID == null)
							   curAgtID = '';
							//if(curAgtID.length > 0 && window.top.comm.myApplet != null)
								//curAgtName = window.top.comm.myApplet.getAgentFullName(curAgtID);

							if(curAgtName == null)
								curAgtName = '';
							//Set agent id value for the first cell of the row
							myData[cntRow][0]= curAgtID;
							hoverHelpData[cntRow][0]=curAgtID+'['+curAgtName+']' ;
							hoverHelpData[cntRow+1][0]=curAgtID+'['+curAgtName+']' ;
							cells[cntRow][0]= curAgtID;
							cells[cntRow+1][0]= curAgtID;

					  }
					  else if(nElt ==1){
					  		adherenceDetails[cntRow] = arrayAgentData[nElt] + "";
							adherenceDetails[cntRow+1] = arrayAgentData[nElt] + "";
                            lglobaladherence += parseFloat(arrayAgentData[nElt]);
					  }else if (nElt ==2){
					  		personalData[cntRow] = arrayAgentData[nElt] + "";
							personalData[cntRow+1] = arrayAgentData[nElt] + "";
					  }
					  else {
							   nbCells=1;
					  		   if(nElt ==3)
					  		   		viewHTML += "<TR id="+cntRow+">";
								else
								   viewHTML += "<TR id="+(parseInt(cntRow)+1)+">";
							   //viewHTML += '<TD width='+this.columnWidth[0]+' rowspan=2 height='+this.rowHeight+' bgcolor='+this.headerBackgroundColor+'>'+curAgtID+'</TD>';
							   if(nElt ==3)
   							      viewHTML += "<TD align='center' id='"+cntRow+"-0' width=100 rowspan=2 height=18 bgcolor=gray title=\""+ hoverHelpData[cntRow][0]+"\" onMouseDown=\"highLightRow('"+cntRow+"')\">"+curAgtID+"</TD>";

							   jsSchedData = arrayAgentData[nElt] + "";   //we got a schedule info : 0-17:2,18-29:5,30-30:3,31-31:6,32-41:5
							   arrayTimeBlock = jsSchedData.split(",");
							   //nParam = arrayTimeBlock.length;
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
									 	if(nElt == 3){     //we got schedule info
										   if(cellval == 6)
										   		cellval = 10;
											if(cellval == 2)
												cellval="";
										   myData[cntRow][cpos+1] = cellval;
										   hoverHelpData[cntRow][cpos+1]=curAgtID+'['+curAgtName+'] ' ;
										   //alert('..cellval..'+ cellval + '..cntRow..'+cntRow+'..cpos+1..'+cpos+1)
										 }
										else if(nElt == 4){ //we got adherence info
											hoverHelpData[cntRow+1][cpos+1]=curAgtID+'['+curAgtName+']';
										   if(cellval == 0 || cellval == 4)
										   		{
													if(cellval == 0)
														hoverHelpData[cntRow+1][cpos+1] = curAgtID+ ' [\"+curAgtName+\"]  +MultiArray[\" was LOGGED IN.\n Should be logged in during this period\"][lang]';
													else
														hoverHelpData[cntRow+1][cpos+1] = curAgtID+ ' [\"+curAgtName+\"]  +MultiArray[\" was LOGGED IN.\n Should be logged in during this period\"][lang]';

													cellval = 101;
													nNoAdh ++;
												}
										   else if(cellval == 1)
										   		{
													cellval = 100;
													nAdh++;
												}
										   /*else
										   		{
													cellval = "";
												  	nAdh++;
												}*/
										   if(cellval != 2)
										   		myData[cntRow+1][cpos+1] = cellval;

										 }
										//alert('cntRow..' +cntRow+'..cpos..'+cpos+'..cellval'+cellval)
									 }//end for(cpos..)
									 //viewHTML
									 if(cellval == 100)
									 	ccolor = "green";
									 else if(cellval == 3)
									 	ccolor = "yellow";
									 else if(cellval == 4 || cellval==101)
									 	ccolor = "red";
									 else if (cellval == 5)
									 	ccolor = "blue";
									 else if (cellval == 6 || cellval == 10)
									    ccolor = "skyblue";
									 else
									 	ccolor = "lightyellow";

									 var cid= String((nElt==3?cntRow:cntRow+1))+'-'+String(k+1);
									 var lcolspan = ePos - stPos +1;
									 var cwidth = lcolspan*75;
		  							 viewHTML +=  "<TD id="+cid+" colspan="+lcolspan+" height=18 width="+cwidth+" bgcolor="+ccolor+" title=\""+ hoverHelpData[(nElt==3?cntRow:cntRow+1)][stPos+1]+ "\" onMouseDown=\"highLightRow('"+(nElt==3?cntRow:cntRow+1)+"')\"></TD>";
									 cells[(nElt==3?cntRow:cntRow+1)][nbCells++] = cellval;

						 	  }//fin du for(k..)
							  
							 viewHTML += "</TR>";
					 	}//fin else

					}// fin du for(nElt...)

			   //Go to the next row, this row will show the adherence data
			   //Leave the row for adherence data
			   cntRow++;
		  } //fin du for(cnt..)
	   } // fin du if(nrow > 1 )
	   else{
	   	viewHTML += '<TR>';

			    viewHTML += "<TD align='justify' height=50   colspan="+cols+"><font face='Arial, Helvetica, sans-serif' size='3' color='#ff0000'><b> <marquee WIDTH=100% direction=right behavior=alternate>" + MultiArray["No schedule data found in database."][lang] +"</marquee></b></font></TD>";

		viewHTML += '</TR>';

	   }
	   viewHTML += "</TABLE>";
	   
	  /*if(allAgentScheduleData.length > 1)
			lglobaladherence = lglobaladherence/(allAgentScheduleData.length-1);
      else
			lglobaladherence ='100';
	  adherenceValue=new String(lglobaladherence);
	  if(adherenceValue.indexOf('.') > 0)
	   	 adherenceValue = adherenceValue.substring(0,adherenceValue.indexOf('.')+2);
	   adherenceValue=adherenceValue+' %';
	   adherence.value = adherenceValue*/
    }


 function drawHeader()
	{
		headerHTML = "<TABLE cellspacing=1px bgcolor=lightyellow>";

		headerHTML += '<TR>';
		for(c=0;c < cols ; c++)
		   headerHTML += "<TD align=center  width=100 height=30 bgcolor=gray  title=\""+ hoverHelpData[0][c]+"\">"+myData[0][c]+"</TD>";
		headerHTML += '</TR>';

		headerHTML += "</TABLE>";
	   var oElem = document.getElementById('divRtaHead');
  	   oElem.innerHTML = headerHTML;
	   oElem.style.height = 30;
	   if(firstLoad == true)
	   	  oElem.style.top = 124;
	   else{
	         //var sommet= parseInt(oElem.style.top.substring(0,oElem.style.top.length-2));
			 if(document.body.scrollTop > 96){
             	var sommet = document.body.scrollTop;
	         	oElem.style.top = sommet;
			 	oElem.style.visibility = 'visible';
			 }

		  }
	}

	function updateHeaderBarPosition()
	{
		var oElem = document.getElementById('divRtaHead');
    	if(document.body.scrollTop > 96) {
	        oElem.style.top = document.body.scrollTop;
			oElem.style.visibility = 'visible';
		}
		else{
		  //    oElem.style.visibility = 'hidden';
		     oElem.style.top = 96;
		  }
	}

	function refreshRtaView()
	{
		nreload++;
		//refreshConfigData() ;
		generateRtaView();
		//drawHeader();
		if(firstLoad == true)
			createTable();
	  /*else
		{
			myTable.setTableData(myData);			 
			myTable.paint3(viewHTML);
			myTable.enableHoverHelp(true,hoverHelpData);
		}*/

		setZoom(lastZoomFactor);
 	}

	function zoomIn()
	{

		if(document.getElementById('divRtaTab').style.zoom == "")
			document.getElementById('divRtaTab').style.zoom = 1.0;

		if(document.getElementById('divRtaTab').style.zoom <= 1.50)
			document.getElementById('divRtaTab').style.zoom = parseFloat(document.getElementById('divRtaTab').style.zoom) + 0.25;
			//document.body.style.zoom = 1.4;
		lastZoomFactor = document.getElementById('divRtaTab').style.zoom;
	    document.getElementById('divRtaHead').style.zoom=document.getElementById('divRtaTab').style.zoom;

	}

	function zoomOut()
	{
		if(document.getElementById('divRtaTab').style.zoom == "")
			document.getElementById('divRtaTab').style.zoom = 1.0;
		if(document.getElementById('divRtaTab').style.zoom >= 0.30)
			document.getElementById('divRtaTab').style.zoom = document.getElementById('divRtaTab').style.zoom - 0.20;

		lastZoomFactor = document.getElementById('divRtaTab').style.zoom;
			//document.body.style.zoom = 0.5;
	    document.getElementById('divRtaHead').style.zoom=document.getElementById('divRtaTab').style.zoom;
	}

	function zoomFit()
	{
		document.getElementById('divRtaTab').style.zoom = 0.5;
		lastZoomFactor = document.getElementById('divRtaTab').style.zoom;
		document.getElementById('divRtaHead').style.zoom=document.getElementById('divRtaTab').style.zoom;

	}

	function setZoom(value)
	{
		document.getElementById('divRtaTab').style.zoom = parseFloat(value);
	    document.getElementById('divRtaHead').style.zoom=document.getElementById('divRtaTab').style.zoom;
	}
  
</script>
</head>
<%@page language = "java" %>
<%@ page import="java.util.*" %>

<%@page import ="Manager.schedule.*"%>
<jsp:useBean id="beanScheduler" scope="request" class="Manager.schedule.beanAgentSchedule" />

<body  class="grey" >  
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
 
    String agents="", agentId = "";
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
   // for( cntAgent = 0; cntAgent < numObjects; cntAgent++ ) {
      agentId = tok.nextToken();
      System.out.println("Agentid: " + agentId);

	  beanWorkScheduleDetails mySchedData = null;
	  beanWorkScheduleDetails myAdhSchedData = null;
	  int  cnt, nb_elt ;
	  String ret ="";	
	  String inT = inTime.substring(0,2)+ inTime.substring(3);
	  String outT = outTime.substring(0,2)+ outTime.substring(3);
	
	  if(viewType.equalsIgnoreCase("Monthly") == true){
		 String tmpStartDate = startYear+"/"+startMonth+"/"+"01";
		 String tmpEndDate = startYear+"/"+startMonth+"/"+"31";
		 ret = beanScheduler.getAgentWorkSchedule3(agentId,startYear,startMonth,"","",inT,outT,spaceColumn,viewType);
		 beanScheduler.getAdherence3(agentId,tmpStartDate,tmpEndDate,inT,outT,spaceColumn);
	 }else{
		 ret = beanScheduler.getAgentWorkSchedule3(agentId,"","",startDate,endDate,inT,outT,spaceColumn,viewType);
		 System.out.println("ret: " + ret);
		 beanScheduler.getAdherence3(agentId,startDate,endDate,inT,outT,spaceColumn);
		 //out.write("size :"+beanScheduler.m_schedDailyDetails.size() +".."+ ((beanWorkScheduleDetails)(beanScheduler.m_schedDailyDetails.elementAt(0))).schedAdhDetails);		 
		 //out.write("\n size :"+beanScheduler.m_schedDailyDetails.size() +".."+ ((beanWorkScheduleDetails)(beanScheduler.m_schedDailyDetails.elementAt(1))).schedAdhDetails);		 

	  }

%>

<table width="947" border="0" align="center">
  <tr>
    <td width="50"  class="reportsID"></td>
    <td width="350" valign="top" ><font size=4><b><script>document.write(MultiArray["Agent"][lang])</script> 	
        <%out.write(viewType);%>
		<script>document.write(MultiArray["Adherence report"][lang])</script> </b></font>
	<%
		String agtName = beanScheduler.getAgentFullName(agentId);
		 out.write("<br><br><b> <font color='black'> <script language='javascript'>document.write(MultiArray[\"Name\"][lang]);</script>: "+agtName+" ["+ agentId+ "] <br><br> ");
		if (viewType.compareTo("Daily") ==0){
			if(startDate.compareTo(endDate) == 0)
				out.write(" <script language='javascript'>document.write(MultiArray[\"Day\"][lang]);</script>: "+ startDate);
			else
			 	out.write(" <script language='javascript'>document.write(MultiArray[\"Period\"][lang]);</script> : <script language='javascript'>document.write(MultiArray[\"From\"][lang]);</script> "+ startDate + " to " + endDate);
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
        <td ><script>document.write(MultiArray["Work period"][lang])</script> </td>
        <td bgcolor="#339933" >&nbsp;</td>
        <td ><script>document.write(MultiArray["Adherence value"][lang])</script>:<script>document.write(MultiArray["yes"][lang])</script> </td>
      </tr>
      <tr>
        <td width="11" height="4" bgcolor="#FFFF00">&nbsp;</td>
        <td width="183" ><script>document.write(MultiArray["Break/Meal period"][lang])</script> </td>
        <td width="11" bgcolor="#FF0000" >&nbsp;</td>
        <td width="150" ><script>document.write(MultiArray["Adherence value"][lang])</script>:<script>document.write(MultiArray["no"][lang])</script> </td>
      </tr>
      <tr>
        <td height="4" bgcolor="#3399CC">&nbsp;</td>
        <td ><script>document.write(MultiArray["Gap between work and break"][lang])</script> </td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
      </tr> 
    </table></td>
  </tr>
  <tr align="center"> 
    <td  height=25 bgcolor="#FFFFFF">&nbsp;</td>
  	<td  valign=middle><div align="justify" class="reportsID"><b> <script>document.write(MultiArray["Adherence"][lang])</script>:  
        <%	 String tmp = Double.toString(beanScheduler.adherenceValue);
							int index = tmp.indexOf(".");
							if(index >0 && tmp.substring(index).length() > 2)
								tmp = tmp.substring(0,index) + tmp.substring(index,index+2);
							else
								tmp = tmp + "0";	
							out.write(tmp+"%");	 
						%> 
    </b></div></td> 
	<td>&nbsp;</td>
	<td align="left"><table><tr><td><img id="zin" src="../img/stock_zoom_in.png" alt="Zoom in" width="24" height="24" onClick="zoomIn()" onMouseOver="border=1; width=23; height=23; " onMouseOut="border=0; width=24; height=24;" >&nbsp;&nbsp;&nbsp;</td> <td> <img src="../img/stock_zoom_out.png"  alt="Zoom out" width="24" height="24" onClick="zoomOut()" onMouseOver="border=1; width=23; height=23;"   onMouseOut="border=0; width=24; height=24; ">&nbsp;&nbsp;&nbsp;</td><td><img src="../img/stock_zoom_fit.png" width="24" height="24" alt="Remove zoom" onClick="zoomFit()" onMouseOver="border=1; width=23; height=23;" onMouseOut="border=0; width=24; height=24; "></td></tr></table></td>
  </tr>
</table>

 <DIV id="divRtaHead"  style="position:absolute; visibility:visible" > </DIV>
<DIV ID="divRtaTab" class="rtaTableClass"></DIV> 

 <%
  int adhIndice = 0, nb_rec_elt=0;
  cnt=0;
  int curWorkSchedDay = 0,curAdherenceDay=0;  
    for(cnt = 0;cnt < beanScheduler.m_schedDailyDetails.size();cnt++){
          beanWorkScheduleDetails this_day_schedule_data = ((beanWorkScheduleDetails)(beanScheduler.m_schedDailyDetails.elementAt(cnt)));
  %>
  <script>
	   allAgentScheduleData[allAgentScheduleData.length]= '<%out.write(this_day_schedule_data.schedAdhDetails);%>'; 
	   //alert(allAgentScheduleData[allAgentScheduleData.length-1])
	  //allAgentScheduleData[0]='4/4^9^9^0-5:5,6-6:3,7-7:6,8-17:5,18-20:2,21-32:5,33-33:3,34-34:6,35-41:5^0-5:0,6-6:1,7-17:0,18-20:2,21-32:0,33-33:1,34-41:0';
	  //allAgentScheduleData[1]='4/5^9^9^0-5:5,6-6:3,7-7:6,8-17:5,18-20:2,21-32:5,33-33:3,34-34:6,35-41:5^0-3:1,4-4:0,5-5:1,6-7:0,8-10:1,11-11:0,12-12:1,13-13:0,14-16:1,17-19:0,20-20:2,21-22:0,23-29:1,30-34:0,35-39:1,40-41:0'; 
  </script>
 <%  
   } // end For 
 %>
  <script>
 	 refreshRtaView();
  </script>

</body>
</html>
