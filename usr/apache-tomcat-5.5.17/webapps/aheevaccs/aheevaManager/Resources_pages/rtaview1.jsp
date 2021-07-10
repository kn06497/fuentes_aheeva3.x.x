<html>
	<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
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
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/jsUtil.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/Table1.js"></SCRIPT>
<script language="javascript" type="text/javascript" src="Browser.js"></script>



<script language="javascript" type="text/javascript">

document.oncontextmenu=new Function("return false;");

	/* Variables declarations and Initializations*/
		 var myTable ;							// the table object that will be drawn for scheduling & adherence
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
		 var beginTime, endTime, starttime, endtime;
		 var period;
		 var thetime =new Date();
         var today=thetime.getYear()+"/"+(thetime.getMonth()+1)+"/"+thetime.getDate();
		 var firstLoad = true;
		 var lastZoomFactor = 0.5;
		 var adherenceValue, lglobaladherence ;
		 var rowSelected = 0;
		 var nreload = 0;
		 
		 var autoReFreshRta = null;// used with function setInterval() to update RTA each minute
		 var autoRefreshOn = false;// this variable tells us if the function autoRefresh() is running or not
		
	function refreshConfigData()
	{
		//Read the new config data in CommApplet to track the user's change
		period  = "1";
		var curHr,startHr, endHr, curMin, minute, startHrStr, endHrSTr, minuteStr;
		var curTime = new Date();
		curHr = curTime.getHours();
		curMin = curTime.getMinutes() ;
		if(curMin >= 30)
		{
			startHr = curHr % 24;
			endHr = (curHr +1) % 24;
		}
		else
		{
			startHr = (curHr -1)  % 24;
			endHr = curHr  % 24;
		}
		minute =(curMin + 30) % 60;	
		//Build start and end time in hhmm format
		if(startHr <= 9)//one digit
			startHrStr = "0" + startHr;
		else
			startHrStr = "" + startHr;
		if(endHr <= 9)
			endHrSTr = "0" + endHr;
		else
			endHrSTr = "" + endHr;			
		if( minute <= 9 )
			minuteStr = "0" + minute;
		else 
			minuteStr = "" + minute;
	
		beginTime = "" + startHrStr + minuteStr;
		endTime = "" + endHrSTr + minuteStr;
		//alert("beginTime"+beginTime+"endTime"+endTime);  
		
		// build starttime, endtime in 'hh:mm' format to send to request updating RTA 
		starttime = "" + startHrStr + ":" + minuteStr;
		endtime = "" + endHrSTr + ":" + minuteStr;
		
	}
	
	

	function loadAllAgentGroups()
	{
		var arrayGroups;
		var allAgentGroups  = String(appletObj.getActiveAgentGroupByName());
		var jsGroups = allAgentGroups  + "";
		arrayGroups = jsGroups.split("|");
		for (j = 0; j <arrayGroups.length; j++)
		{
			myOption = new Option(arrayGroups[j], arrayGroups[j]);
			optionPos = adhGroup.options.length;
			adhGroup.options[optionPos]=myOption;
		}
		
		var adhRunning= appletObj.isAdherenceStarted();
		var selected = appletObj.getAdhereceSelectedGroup();
		if(selected != "")
		{
			for(i=0;i<adhGroup.options.length;i++)
			{
				if(adhGroup.options[i].value==selected)
				{
					adhGroup.options[i].selected=true;
					break;
				}
			}
		}
		adhGroup.disabled=true;
	}
	
	function onGroupChange()
	{
		//change comApplet adherence group
		appletObj.updateRTAGroup(adhGroup.options[adhGroup.selectedIndex].value);
	}



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
	  // alert(rows+'..'+cols)
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

	function scrollingDetector(){
		if (navigator.appName == "Microsoft Internet Explorer")	{
			alert("<%= pageData.getWord("You are at")%>" + document.body.scrollLeft + "<%= pageData.getWord(" pixels")%>");
		}
		else{
		    alert("<%= pageData.getWord("You are at")%>" + window.pageYOffset + "<%= pageData.getWord(" pixels")%>");
		}
	}

	function startScrollingDetector(){
		setInterval("scrollingDetector()", 60000);
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
		 }
		cols = ncols;
		//alert(cols)
	}

	function setColumHeadersValue()
	{
	   var colNum=0
	   //Set array for row header data
	   myData[0] = new Array(cols);
	   hoverHelpData[0] = new Array(cols);
	   cells[0]= new Array(cols);
	   myData[0][0]=" <%= pageData.getWord("Time hh:mm")%>";//" Time hh:mm";
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
		if(nrow == 0 || (allAgentScheduleData[0].length==0)){
			if(appletObj.isAdherenceStarted()=="false")
			{
				allAgentScheduleData=new Array();
			}
			window.top.main.rtop.refreshAgentAdherenceStats();
			nrow = allAgentScheduleData.length;
		}
		
	

		if(allAgentScheduleData[0] != null )
		  if( allAgentScheduleData[0].length == 0)
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

	   if(nrow > 1 ){
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
							if(curAgtID.length > 0 && window.top.comm.myApplet != null)
								curAgtName = appletObj.getAgentFullName(curAgtID);

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
											var string0 ="<%= pageData.getWord(" was LOGGED OUT.** Should be logged in during this period")%>";
											var string1 ="<%= pageData.getWord(" was LOGGED IN.** Should be logged in during this period")%>";
										   if(cellval == 0 || cellval == 4)
										   		{
													if(cellval == 0)
													
														hoverHelpData[cntRow+1][cpos+1] = curAgtID+'['+curAgtName+']'+ string0.replace("**","\n"); 
													else
														hoverHelpData[cntRow+1][cpos+1] = curAgtID+'['+curAgtName+']'+ string1.replace("**","\n"); 

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
							/* if(nElt==4){
							         lcolspan = cols - stPos +1;
									 cwidth = lcolspan*75;
		  							 viewHTML +=  "<TD id="+String(cntRow+1)+'-'+String(k+1)+" colspan="+lcolspan+" height=18 width="+cwidth+" bgcolor='lightyellow' onMouseDown=\"highLightRow('"+(cntRow+1)+"')\"></TD>";
									 cells[(cntRow+1)][nbCells] = 2;
							 }	*/

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
	   	 if(appletObj.isAdhGot() == 'false')
		 viewHTML += "<TD align='justify' height=50   colspan="+cols+"><font face='Arial, Helvetica, sans-serif' size='3' color='#f000000'><b> <marquee WIDTH=100% direction=right behavior=alternate>    <%= pageData.getWord("Click Start in")%>     <a style=\"color:#000000\" href='rta1.jsp?type=AgentGroupsRTA&tenant_dbid=1' target='rbottom'><u>   <%= pageData.getWord("Real Time Adherence")%> </u></a>   <%= pageData.getWord("under Work Force Management--Adherence to view adherence data for this day")%> . </marquee></b></font></TD>";
	   	 else
		    viewHTML += "<TD align='justify' height=50   colspan="+cols+"><font face='Arial, Helvetica, sans-serif' size='3' color='#ff0000'><b> <marquee WIDTH=100% direction=right behavior=alternate>  <%= pageData.getWord("No schedule data found in database. Please load schedule data for this day")%>. </marquee></b></font></TD>";
			viewHTML += '</TR>';

	   }
	   viewHTML += "</TABLE>";
	   /*alert(viewHTML);
	   var adhVal;
	   if( (nNoAdh + nAdh) > 0)
	   		adhVal = 100*nAdh/(nNoAdh + nAdh);
		else
			 adhVal = 100;
	   adherenceValue=new String(adhVal);*/
	  if(allAgentScheduleData.length > 1)
			lglobaladherence = lglobaladherence/(allAgentScheduleData.length-1);
      else
			lglobaladherence ='100';
	  adherenceValue=new String(lglobaladherence);
	  if(adherenceValue.indexOf('.') > 0)
	   	 adherenceValue = adherenceValue.substring(0,adherenceValue.indexOf('.')+2);
	   adherenceValue=adherenceValue+' %';
	   adherence.value = adherenceValue
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
	   if(firstLoad == true) {
	   	  oElem.style.top = 96;
		  oElem.style.visibility = 'hidden';
	   }
	   
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
			if(oElem != null){
			 oElem.style.top = document.body.scrollTop;
			 oElem.style.visibility = 'visible';
			}
		}
		else{
			if(oElem != null){
			 oElem.style.visibility = 'hidden';
			 oElem.style.top = 96;
		   }
		}
	}

	function refreshRtaView()
	{
		var adhRunning= appletObj.isAdherenceStarted();//setTimeout
		adhGroup.disabled=true;//user can't change agent group here
		
		if(adhRunning=="true")
		{
			//adhGroup.disabled=false;
			var i=0;
			var selected=appletObj.getAdhereceSelectedGroup();
			for(i=0;i<adhGroup.options.length;i++)
			{
				if(adhGroup.options[i].value==selected)
				{
					adhGroup.options[i].selected=true;
					break;
				}
			}
			
		}
		/*
		else
		{
			adhGroup.disabled=true;
		} ****************/
	
		nreload++;
		refreshConfigData() ;
		generateRtaView();
		drawHeader();
		if(firstLoad == true)
			createTable();
		else
			{
				createTable();
				myTable.setTableData(myData);
				//myTable.paint2();
				myTable.paint3(viewHTML);
				// var oElement = document.getElementById('divRtaTab');
  				// oElement.innerHTML = viewHTML;
				myTable.enableHoverHelp(true,hoverHelpData);
			}

		setZoom(lastZoomFactor);
		if(allAgentScheduleData != null &&  allAgentScheduleData[0] != null ) {
			if(allAgentScheduleData[0].length > 0 || nreload >1)
				firstLoad = false;
		}
		
		if( (appletObj.isAdherenceStarted()== "true") && (!autoRefreshOn) )
		{
			//alert("call autoRefresh()");
			autoRefreshOn = true;
			autoReFreshRta = setInterval('autoRefresh()', 60000);		
		} 
	}
	
	//This function sends the updated info to the ComApplet object and requests the updated RTA info for each minute 
	function autoRefresh()
	{
		if( (appletObj.isAdherenceStarted()== "true") && (appletObj.getShowAdhValue() == "true") )
		{ //alert("autorefresh");
			refreshRtaView();
			appletObj.updateRTAViewInfo(starttime, endtime,"1",appletObj.getAdhereceSelectedGroup());
			appletObj.sendRTAStartReq();// alert("autoRefresh()--- sendRTAStartReq");
		}
		else if(autoReFreshRta != null)
		{
			clearInterval(autoReFreshRta);
			autoRefreshOn = false; //alert("stop autorefresh");
		}
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

<body onLoad="loadAllAgentGroups()">
<table width="947" border="0" align="center" >
  <tr>
    <td width="176"  class="reportsID"><div align="center"></div></td>
    <td width="284" valign="middle" >
       <b>
		<%= pageData.getWord("Real-time adherence view for")%> : </b><script language="javascript" type="text/javascript">document.write(' '+today); </script></td>
    <td width="284" valign="middle"></td>
	<td width="31" valign="top"  class="reportsID">&nbsp;</td>
    <td width="438" valign="top"  class="reportsID">
		<table width="373" border="0">
			  <tr>
				<td height="4" bgcolor="#3333FF">&nbsp;</td>
				<td ><%= pageData.getWord("Work period")%> </td>
				<td bgcolor="#339933" >&nbsp;</td>
				<td ><%= pageData.getWord("Adherence value")%>:<%= pageData.getWord("yes")%> </td>
			  </tr>
			  <tr >
				<td width="11" height="4" bgcolor="#FFFF00">&nbsp;</td>
				<td width="183" ><%= pageData.getWord("Break/Meal period")%> </td>
				<td width="11" bgcolor="#FF0000" >&nbsp;</td>
				<td width="150" ><%= pageData.getWord("Adherence value")%>:<%= pageData.getWord("no")%> </td>
			  </tr>
			  <tr >
				<td height="4" bgcolor="#3399CC" >&nbsp;</td>
				<td ><%= pageData.getWord("Gap between work and break")%> </td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
			  </tr>
		</table> </td>
  </tr>
  <tr align="center">
    <td height="4" rowspan="2" bgcolor="#FFFFFF">&nbsp;</td>
  	<td ><div align="justify"><b> <%= pageData.getWord("Global adherence")%> :
          <input  style="background-color:#EEEEEE" id="adhval" name="adherence" value="100%" size="8"  maxlength="8" type="text" border="0" readonly="true">
        <script language="javascript" type="text/javascript"> document.write("");</script>
    </b></div></td>
	<td rowspan="2">&nbsp;</td>
	<td rowspan="2" align="left"><table><tr><td><img id="zin" src="../img/stock_zoom_in.png" alt="Zoom in" width="24" height="24" onClick="zoomIn()" onMouseOver="border=1; width=23; height=23; " onMouseOut="border=0; width=24; height=24;" >&nbsp;&nbsp;&nbsp;</td> <td> <img src="../img/stock_zoom_out.png"  alt="Zoom out" width="24" height="24" onClick="zoomOut()" onMouseOver="border=1; width=23; height=23;"   onMouseOut="border=0; width=24; height=24; ">&nbsp;&nbsp;&nbsp;</td><td><img src="../img/stock_zoom_fit.png" width="24" height="24" alt="Remove zoom" onClick="zoomFit()" onMouseOver="border=1; width=23; height=23;" onMouseOut="border=0; width=24; height=24; "></td></tr></table></td>
  </tr>
  <tr align="center">
    <td align="left"><b><%= pageData.getWord("Agent group")%>:
	</b><div align="left"><select name="adhGroup" id="adhGroup" onChange="onGroupChange()" size="1"></select>
&nbsp;</div></td>
  </tr>
</table>
<!--<DIV ID="divRta"></DIV>-->
		<DIV id="divRtaHead"  style="position:absolute; visibility:visible; top:auto" > </DIV>

		<DIV ID="divRtaTab" class="rtaTableClass"></DIV>

<script language="javascript" type="text/javascript">
	if(firstLoad)
	{
		//alert("Loading real time adherence, Please wait...");	
		refreshRtaView();
		appletObj.updateRTAViewInfo(starttime, endtime,"1",appletObj.getAdhereceSelectedGroup());	
		autoReFreshRta = setInterval('autoRefresh()', 60000); //alert("Loading real time adherence, Please wait...");
		autoRefreshOn = true;
	}
	
	else if( (appletObj.isAdherenceStarted()== "true") && (appletObj.getShowAdhValue() == "true") )
	{
		autoReFreshRta = setInterval('autoRefresh()', 60000);
		autoRefreshOn = true;
	}

	
		
	setInterval('updateHeaderBarPosition()',100);

</script>

<div id="ie5menu" class="skin0" style="visibility:hidden " onMouseover="highlightie5(event)" onMouseout="lowlightie5(event)"   display:none> <!-- onClick="jumptoie5(event)"-->
   <div id="menu1"  class="menuitems"  onClick="showmenuitems(1)"  style="visibility:hidden"><%= pageData.getWord("View agent schedule")%>
		<div id="sousmenu1" class="sousmenu" style="visibility:hidden">
		   <div id="sousmenu11" height="12"><a href="#" class="smenu"><%= pageData.getWord("Work")%></a></div>
		   <div id="sousmenu12" height="12"><a href="#" class="smenu"><%= pageData.getWord("Break/Meal")%></a></div>
		</div>
  </div>
	<div id="menu2" class="menuitems"  onClick="showmenuitems(2)"  target="newwin" style="visibility:hidden"><%= pageData.getWord("View adherence details")%>
		<div id="sousmenu2" class="sousmenu" style="visibility:hidden" >
		 <!-- <div id="sousmenu21" height="12"><a href="#" class="smenu">details1</a></div>
		  <div id="sousmenu22" height="12"><a href="#" class="smenu">details2:</a></div>
		  <div id="sousmenu23" height="12"><a href="#" class="smenu">adherence:</a></div>-->
		</div>
	</div>
	<!--<hr>-->
	<div id="menu3" class="menuitems" onClick="showmenuitems(3)" style="visibility:hidden"> <%= pageData.getWord("Agent personal info")%>
		<div id="sousmenu3" class="sousmenu" style="visibility:hidden" >
		  <div id="sousmenu31" height="12"><a class="smenu"><%= pageData.getWord("Agent name")%>:</a></div>
		  <div id="sousmenu32" height="12"><a class="smenu"><%= pageData.getWord("IP Address")%>:</a></div>
		  <div id="sousmenu33" height="12"><a class="smenu"><%= pageData.getWord("Host name")%>:</a></div>
		  <div id="sousmenu34" height="12"><a class="smenu"><%= pageData.getWord("Group name")%>: </a></div>
		  <div id="sousmenu35" height="12"><a class="smenu"><%= pageData.getWord("Team Name")%>:</a></div>
		  <div id="sousmenu36" height="12"><a class="smenu"><%= pageData.getWord("First login")%>:</a></div>
		</div>
	</div>
</div>

<script language="JavaScript1.2">

//set this variable to 1 if you wish the URLs of the highlighted menu to be displayed in the status bar
var new_left_click;   //  indicates whether the user made a new left-click
var display_url=0;
var conf = -1; //
var begin = 0; //
var nb_elem = 3;
var nb_souscat = new Array(nb_elem);//Nb_souscat contient le nombre de sous categorie pour chaque categorie

nb_souscat[0] = 2;//Nombre de sous categorie 1
nb_souscat[1] = 0;//Nombre de sous categorie 2
nb_souscat[2] = 6;//Nombre de sous categorie 3
//nb_souscat[3] = 3;//Nombre de sous categorie 4

var ie5=document.all&&document.getElementById
var ns6=document.getElementById&&!document.all

if (ie5||ns6)
 var menuobj=document.getElementById("ie5menu")

function showmenuie5(e){
     //cols*100
    // alert(document.body.scrollLeft + event.clientX)
    if((document.body.scrollTop+event.clientY > 110) && (document.body.scrollLeft + event.clientX) >10){
		//Find out how close the mouse is to the corner of the window
		var rightedge=ie5? document.body.clientWidth-event.clientX : window.innerWidth-e.clientX
		var bottomedge=ie5? document.body.clientHeight-event.clientY : window.innerHeight-e.clientY

		//if the horizontal distance isn't enough to accomodate the width of the context menu
		if (rightedge<menuobj.offsetWidth)
			//move the horizontal position of the menu to the left by it's width
			menuobj.style.left=ie5? document.body.scrollLeft+event.clientX-menuobj.offsetWidth : window.pageXOffset+e.clientX-menuobj.offsetWidth
		else
			//position the horizontal position of the menu where the mouse was clicked
			menuobj.style.left=ie5? document.body.scrollLeft+event.clientX : window.pageXOffset+e.clientX

		//same concept with the vertical position
		if (bottomedge<menuobj.offsetHeight)
			menuobj.style.top=ie5? document.body.scrollTop+event.clientY-menuobj.offsetHeight : window.pageYOffset+e.clientY-menuobj.offsetHeight
		else
			menuobj.style.top=ie5? document.body.scrollTop+event.clientY : window.pageYOffset+e.clientY

		menuobj.style.visibility="visible"
		Init();
		new_left_click = true;
	}
	return false
}

function hidemenuie5(e){
	//A left click event has occured
	var diffX = document.body.scrollLeft + event.clientX -  parseInt(menuobj.style.left.substring(0,menuobj.style.left.length-2));
	var diffY = document.body.scrollTop + event.clientY -  parseInt(menuobj.style.top.substring(0,menuobj.style.top.length-2));
	if((diffX < 0) || (diffX > 145) ||(diffY < 0) || (diffY > 50)){
		menuobj.style.visibility="hidden";
		var z=1;
		for(z=1;z<=nb_elem;z++){
			document.getElementById("menu"+z+"").style.visibility = 'hidden';
			document.getElementById("sousmenu"+z+"").style.visibility = 'hidden';
		}
	 	//alert('...left..'+menuobj.style.left+'..begin..'+menuobj.style.top+'..event.x..'+event.clientX+'..event.y..'+event.clientY+'..scrollLeft..'+document.body.scrollLeft+'..scrollTop..'+document.body.scrollTop)
	}
	//menuobj.style.visibility="hidden"
}

function highlightie5(e){
	var firingobj=ie5? event.srcElement : e.target
	if(firingobj != null){
		if (firingobj.className=="menuitems" || ns6&&firingobj.parentNode.className=="menuitems"){
			if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode //up one node
			firingobj.style.backgroundColor="goldenrod"//"highlight"
			firingobj.style.color="white"
			if (display_url==1)
				window.status=event.srcElement.url
		}
	}
}

function lowlightie5(e){
	var firingobj=ie5? event.srcElement : e.target
	if (firingobj != null){
		if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
		if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode //up one node
			firingobj.style.backgroundColor=""
			firingobj.style.color="black"
			window.status=''
		}
	}
}

function jumptoie5(e){
	var firingobj=ie5? event.srcElement : e.target
	if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
	if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode
	if (firingobj.getAttribute("target"))
		window.open(firingobj.getAttribute("url"),firingobj.getAttribute("target"))
	else
		window.location=firingobj.getAttribute("url")
	}
}

function Init()
{
	menuobj.style.height = 55;
	////////////////////Mes ajouts/////////////////
    begin= parseInt(menuobj.style.top.substring(0,menuobj.style.top.length-2));
	var hauteur = begin;
	if(conf < 4)
    	document.getElementById("sousmenu"+(conf==-1?1:conf)+"").style.visibility = 'hidden';
    for(i=1;i<=nb_elem;i++){
	// alert('begin '+document.getElementById("menu"+i+"").style.top )
        document.getElementById("menu"+i+"").style.top = hauteur;
        hauteur = parseInt(hauteur) + 17;
		document.getElementById("menu"+i+"").style.height = 17;
		document.getElementById("menu"+i+"").style.visibility = 'visible';

    }
}

function showmenuitems(z){
	if((conf==z)  && (new_left_click==false) ){
        document.getElementById("sousmenu"+z+"").style.visibility = 'hidden';
        Init();
        conf=conf+3;
    }else{
        conf=z;
        new_left_click = false;
        //Calcul de la hauteur dont doit se baisser le menu
        haut=0;
        var haut = 12*nb_souscat[z-1]+z*18+begin;

        //On retracte tous les éléments
        for(i=1;i<=nb_elem;i++){
            document.getElementById("sousmenu"+i+"").style.visibility = 'hidden';
        }

        //on les remet tous à leur place
        Init();

        //on cale le sous menu sous la categorie
        document.getElementById("sousmenu"+z+"").style.top = z*18;//16;
        dec = haut;
		//menuobj.style.height = parseInt(menuobj.style.height.substring(0,menuobj.style.height.length-2))+12*nb_souscat[z-1];

		/**********/
		var arrayScheduleDetails="";
 		var jsScheduleData = "";
		var schedLen=0;
		var name = hoverHelpData[rowSelected][0];
		var ind = name.indexOf('[');
		var loginID = name.substring(0,ind);
		var findItem = false;
		if(z ==1) {
				//Look for tha agent schedule info..
				if(thisDayScheduleInfo.length ==0)
					window.top.main.rtop.setAgentScheduleData();


		 		for(nbElt = 0; nbElt < thisDayScheduleInfo.length; nbElt++)
				  {
				  //alert(loginID+'..'+thisDayScheduleInfo[nbElt])
					jsScheduleData=thisDayScheduleInfo[nbElt] + "";
					arrayScheduleDetails = jsScheduleData.split("^");
					if((arrayScheduleDetails.length > 1) && (arrayScheduleDetails[0]==loginID))
					   {
						  findItem = true;
						  break;
					   }
				 }

				if(findItem == true){
					schedLen = arrayScheduleDetails.length;
				}

			//Remove all child nodes for sousmenu1
			var d2=document.getElementById("sousmenu"+z+"");
			// -- d2Len holds the fixed starting value of the number of childNodes
			var d2Len=d2.childNodes.length;

			for (i=0;i<d2Len;i++){
				   d2.removeChild(d2.childNodes[0]);
			 }

			//Build layers HTML code
			for(var nl=1; nl<schedLen; nl++) {

				 var lyr=document.createElement("DIV");
				 lyr.style.backgroundColor='#C3C9D4';
				 lyr.id="sousmenu"+z+""+nl;
				 var tHeader = '<TABLE WIDTH="100%" HEIGHT="12"  CELLPADDING="0" CELLSPACING="0"><TR><TD NOWRAP ALIGN="left">'
				 var tFooter = '</TD></TR></TABLE>';

				 var code="<a class='smenu'>";
				 tmpVal = '<font color=#000000>'+ arrayScheduleDetails[nl]+'</font>';
				 code = code + tmpVal + '</a>';
				 code = tHeader+code+tFooter;

				 if (ie5) {
					  lyr.innerHTML=code;
				  }

				document.getElementById("sousmenu"+z+"").appendChild(lyr);
				//document.getElementById("sousmenu"+z+"").replaceChild(lyr,document.getElementById("sousmenu"+z+""+nl));

			}//fin du for
    	 }//fin du if(z==1)

	    if(z==2){
			var jsadherenceData = adherenceDetails[rowSelected] + "";
			arrayAdherenceDetails = jsadherenceData.split("*");
			schedLen = arrayAdherenceDetails.length;
			//Remove all child nodes for sousmenu2
			var d2=document.getElementById("sousmenu"+z+"");

			// -- d2Len holds the fixed starting value of the number of childNodes
			var d2Len=d2.childNodes.length;
			for (i=0;i<d2Len;i++){
				   d2.removeChild(d2.childNodes[0]);
			 }

			//Build layers HTML code

			schedLen = 1; //just show the first element
			for(var nl=0; nl<schedLen; nl++) {

				 var lyr=document.createElement("DIV");
				 lyr.style.backgroundColor='#C3C9D4';
				 lyr.id="sousmenu"+z+""+nl;
				 var tHeader = '<TABLE WIDTH="100%" HEIGHT="12"  CELLPADDING="0" CELLSPACING="0"><TR><TD NOWRAP ALIGN="left">'
				 var tFooter = '</TD></TR></TABLE>';

				 var code="<a class='smenu'>";
				 if (nl == 0)
				 	tmpVal = '<font color=#900000> Adherence  ['+ arrayAdherenceDetails[nl]+'%]</font>';
				 else
				 	tmpVal = '<font color=#000000>'+ arrayAdherenceDetails[nl]+'</font>';
				 code = code + tmpVal + '</a>';
				 code = tHeader+code+tFooter;

				 if (ie5) {
					  lyr.innerHTML=code;
				  }

				document.getElementById("sousmenu"+z+"").appendChild(lyr);
				//document.getElementById("sousmenu"+z+"").replaceChild(lyr,document.getElementById("sousmenu"+z+""+nl));
			}//fin du for

		} //fin if(z==2)

		if(z == 3){
			for(var nl=1; nl<=nb_souscat[z-1]; nl++) {

					 var lyr=document.createElement("DIV");
					 lyr.style.backgroundColor='#C3C9D4';
					 lyr.id="sousmenu"+z+""+nl;
					 var tHeader = '<TABLE WIDTH="100%" HEIGHT="12"  CELLPADDING="0" CELLSPACING="0"><TR><TD NOWRAP ALIGN="left">'
					 var tFooter = '</TD></TR></TABLE>'

					 var code="<a class='smenu'>";
				 //if(z==3){
					 var jsPersonalData = personalData[rowSelected] + "";
					 var ipAddr = 'unknown';
					 var host 	= 'unknown';
					 var m_grp  = 'unknown';
					 var m_team = 'unknown';
					 var first_login = 'unknown';
					 if(jsPersonalData.length > 1) {
						 arrayPersoDetails = jsPersonalData.split("*");
						 for(m=0; m < arrayPersoDetails.length; m++)
							{
								if(m==0)
									ipAddr = arrayPersoDetails[m];
								else if(m==1)
									host =  arrayPersoDetails[m];
								else if(m==2)
									m_grp =  arrayPersoDetails[m];
								else if(m==3)
									m_team =  arrayPersoDetails[m];
								else if(m==4){
									  first_login =  arrayPersoDetails[m];
									  var loginTime = parseInt(first_login,10);
									  hhLog  = String(parseInt(loginTime/3600));
									  minLog = String(parseInt((loginTime % 3600)/60));
									  minLog = (minLog.length == 1 ? '0'+ minLog : minLog);
									  first_login = hhLog+':'+minLog;
									}

							} //fin for
					  }  //fin if

					if(nl==1)
						tmpVal = '<font color=#800000>'+ hoverHelpData[rowSelected][0]+'</font>';
					else if(nl==2)
						tmpVal = 'IP :     '+'<font color=#330033>'+ipAddr+'</font>';
					else if(nl==3)
						tmpVal = 'Host :   '+'<font color=#330033>'+host+'</font>';
					else if(nl==4)
						tmpVal = 'Group : '+'<font color=#330033>'+m_grp+'</font>';
					else if(nl==5)
						tmpVal = 'Team :   '+'<font color=#330033>'+m_team+'</font>';
					else if(nl==6)
						tmpVal = 'Login : '+'<font color=#330033>'+first_login+'</font>';
				// } //fin if(z == 3)
				 code = code + tmpVal + '</a>';
				 code = tHeader+code+tFooter;

				 if (ie5) {
					  lyr.innerHTML=code;
				  }

				//document.getElementById("sousmenu"+z+"").appendChild(lyr);
				document.getElementById("sousmenu"+z+"").replaceChild(lyr,document.getElementById("sousmenu"+z+""+nl));

			}//fin du for
		}//fin(if z==3)

        //On peut alors baisser tous les autre menus
        for(i=z+1;i<=nb_elem;i++){
           document.getElementById("menu"+i+"").style.top = dec;
           dec=dec+18;
        }

        //Enfin, on rend le menu visible
		if(z==1)
			document.getElementById("sousmenu"+z+"").style.height = 12*schedLen;
		else if(z==3)
			document.getElementById("sousmenu"+z+"").style.height = 12*nb_souscat[z-1];

        document.getElementById("sousmenu"+z+"").style.visibility = 'visible';
        document.getElementById("sousmenu"+z+"").style.left = -1;
    }

}

if (ie5||ns6){
	menuobj.style.visibility = 'hidden';
	menuobj.style.display=''
	document.oncontextmenu=showmenuie5
	document.onclick=hidemenuie5
}

</script>
</body>
</html>
<% pageData.closeConnection(); %>