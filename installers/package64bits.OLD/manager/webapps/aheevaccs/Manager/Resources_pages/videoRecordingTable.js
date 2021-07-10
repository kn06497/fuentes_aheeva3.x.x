//for drag support
var dragging = false;
function Point(pX,pY)
{
  this.x = pX;
  this.y = pY;
}
var startPoint = new Point(0,0);
var endPoint = new Point(0,0);
var srcCell = new Point(0,0);

function Table(nRows, nCols)
{
  this.nRows = nRows||0;
  this.nCols = nCols||0;

  //create an array to hold the data for the cells
  this.data = new Array(nRows);
  for (i=0; i<nRows;i++)
  {
    this.data[i] = new Array(nCols+3);
  }

  //create an array to hold the layers for the cells
  this.cells = new Array(nRows);
  for (k=0;k<nRows;k++)
  {
    this.cells[k] = new Array(nCols);
  }

  //create an array to hold the data for hover help
  this.hoverHelpData = new Array(nRows);
  for (j=0;j<nRows;j++)
  {
    this.hoverHelpData[j] = new Array(nCols);
  }

  //other variables to hold options
  this.cellSelectionColor = "orange";
  this.cellRecordingScheduledColor = "red";
  this.workScheduleColor  = "royalblue"; //dodgerblue,blue
  this.workScheduleValue = '5';
  this.breakPeriodColor  = "yellow";
  this.breakPeriodValue  = '3';
  this.cellAdherenceYesValue  = '100';
  this.cellAdherenceNoValue   = '101';
  this.cellAdherenceYesColor  = "green";
  this.cellAdherenceNoColor    = "red";
  this.cellRecAudioValue = '1001';
  this.cellRecVideoValue = '1002';
  this.cellRecAllMediaValue = '1003';
  this.cellGapColor = 'skyblue';
  this.cellGapValue = '10';
  this.cellSelectionEnabled = true;
  this.rowSelectionEnabled = false;
  this.rowSelectionColor = "skyblue";
  this.selectedRow = 0;
  this.hoverHelpEnabled = false;
  if (at.ns)
    this.hoverHelpSize = 500;
  this.columnHeadersEnabled = false;
  this.rowHeadersEnabled = false;
  this.rowStartIndex = 0;
  this.columnStartIndex = 0;
  this.xPos = 0;
  this.yPos = 0;
  this.tableWidth = 0;
  this.tableHeight = 0;
  this.istableScheduleModel = false;
  this.columnWidth = new Array(nCols);
  for (j=0;j<nCols;j++)
  {
    if (j!=0)
      this.columnWidth[j] = 50;
	else
	  this.columnWidth[j] = 75;
  }
  //to find out what the orignial widths were in case of hide and show columns
  this.backupWidth = new Array(nCols);
  for (j=0;j<nCols;j++)
  {
    this.backupWidth[j] = 100;
  }
  this.rowHeight = 25;
  this.firstRowHeight = 30;

  this.horizontalCellSpacing = 1;
  this.verticalCellSpacing = 1;
  this.headerBackgroundColor = "gray";
  this.headerForegroundColor = "black";//"white";
  this.dataForegroundColor = "darkblue";
  this.rowColors =["lightyellow"];//white,seashell,oldlace,lavenderblush, beige,aliceblue   ["powderblue","lightblue"];//
  this.cellColors = ["darkblue","gold","powderblue","lightgreen","darkred","powderblue"];
  this.fontFace = "";
  if (at.ie)
    this.fontSize = 2;
  else if (at.ns)
    this.fontSize = 1;

  this.zoom = 1.0; 	
  //getter and setters for options
  this.getTableWidth = getTableWidth;
  this.getTableHeight = getTableHeight;
  this.setTablePos = setTablePos;
  this.setTableData = setTableData;
 // this.getTableData = getTableData;
  this.setCellData = setCellData;
  this.setCellColor = setCellColor;
//  this.getCellData = getCellData;
  this.setColumnWidth = setColumnWidth;
  this.setRowHeight = setRowHeight;
  this.setFirstRowHeight = setFirstRowHeight;
  this.setTableModelSchedule  =  setTableModelSchedule;
  this.setTableModelRta = setTableModelRta;
//  this.setHorizontalCellSpacing = setHorizontalCellSpacing;
//  this.setVerticalCellSpacing = setVerticalCellSpacing;
  this.enableHoverHelp = enableHoverHelp;
  this.enableColumnHeaders = enableColumnHeaders;
  this.enableRowHeaders  =enableRowHeaders;
  this.enableRowSelection = enableRowSelection;
  this.enableCellSelection = enableCellSelection; ////
  this.setHeaderForegroundColor = setHeaderForegroundColor;
  this.setHeaderBackgroundColor = setHeaderBackgroundColor;
  this.setDataForegroundColor = setDataForegroundColor;
  this.setRowColors = setRowColors;
  this.setHoverHelpSize = setHoverHelpSize;
  this.setFont = setFont;
  this.setZoom = setZoom;

  //functions for doing stuff
 /* this.hideColumn = hideTheColumn;
  this.showColumn = showTheColumn;
  this.sortOnColumn = sortOnColumn;
  this.swapColumns = swapColumns;
  this.swapRows = swapRows;

  this.addColumn = addColumn;
  this.insertColumn = insertColumn;
  this.removeColumn = removeColumn;
  this.addRow  = addRow;
  this.insertRow = insertRow;
  this.removeRow = removeRow;*/
  this.paint = paint;
  this.refresh = refresh;
}

function  enableCellSelection(flag)
{
    this.cellSelectionEnabled = flag;
}

function getTableWidth()
{
  return this.tableWidth;
}

function getTableHeight()
{
  return this.tableHeight;
}


function setTablePos(theX,theY)
{
  this.xPos = theX;
  this.yPos = theY;
}

function setTableData(theData)
{
  for (i=0; i<this.nRows ;++i)
  {
    for (j=0; j<this.nCols; ++j)
    {
      this.data[i][j] = theData[i][j];
    }
  }
}

function setCellData(i,j,theData)
{
  this.data[i][j] = theData;
 // if(theData == 5)
//	this.parent.parent.cells[i][j].setBgColor(this.workScheduleColor);
 // this.cells[i][j].setCaption(theData,"");
}

function setCellColor(i,j,color)
{
   this.cells[i][j].setBgColor(color);
}

function setTableModelSchedule(flag)
{
	this.istableScheduleModel=flag;
}

function setFirstRowHeight(rowHeight)
{
	this.firstRowHeight=rowHeight;
}

/*function getTableData()
{
  return this.data;
}
function getCellData(i,j)
{
  return this.data[i][j];
}
*/
function setColumnWidth(theWidths)
{
  for (i=0; i<this.nCols; i++)
  {
    this.columnWidth[i] = theWidths[i];
    this.backupWidth[i] = theWidths[i];
  }
}

function setRowHeight(theHeight)
{
  this.rowHeight = theHeight;
}

function setZoom (zoomVal)
{
	this.zoom = zoomVal;	
}

function setTableModelRta(value)
{
	if(value == true)
		this.zoom = 2.0;		
}
/*
function setHorizontalCellSpacing(x)
{
  this.horizontalCellSpacing = x;
}

function setVerticalCellSpacing(y)
{
  this.verticalCellSpacing = y;
}
*/
function enableHoverHelp(flag,theData)
{
  this.hoverHelpEnabled = flag;
  if (flag)
  {
    for (i=0; i<this.nRows ;++i)
    {
      for (j=0; j<this.nCols; ++j)
      {
        this.hoverHelpData[i][j] = theData[i][j];//'Allo..'//
      }
    }
  }
}

function setHoverHelpSize(theSize)
{
  if (at.ns)
    this.hoverHelpSize = theSize;
}

function setFont(fontFace,fontSize)
{
  var tempSize = fontSize;
  this.fontFace = fontFace;
  if ((at.ns) && (tempSize>1))
    tempSize--;
  this.fontSize = tempSize;
}

function enableColumnHeaders(flag)
{
  this.columnHeadersEnabled = flag;
  if (this.columnHeadersEnabled)
  {
    this.rowStartIndex = 1;
  }
  else
  {
    this.rowStartIdex = 0;
  }
  this.selectedRow = this.rowStartIndex;
}

function enableRowHeaders(flag)
{
  this.rowHeadersEnabled = flag;
  if (this.rowHeadersEnabled)
  {
    this.columnStartIndex = 1;
  }
  else
  {
    this.columnStartIndex = 0;
  }
}

function enableRowSelection(flag,color)
{
  this.rowSelectionEnabled = flag;
  this.rowSelectionColor = color;
}

function setHeaderBackgroundColor(theColor)
{
  this.headerBackgroundColor = theColor;
}

function setHeaderForegroundColor(theColor)
{
  this.headerForegroundColor = theColor;
}

function setDataForegroundColor(theColor)
{
  this.DataForegroundColor = theColor;
}

function setRowColors(theColors)
{
  this.rowColors = theColors;
}

function onMouseOut(e)
{
  if (at.ns)
  {
    var theCell = this.parent;
    var theTable = this.parent.parent;
    if (!((theTable.rowHeadersEnabled && theCell.columnIndex==0) || (theTable.columnHeadersEnabled && theCell.rowIndex==0)))
    {
      if (theTable.hoverHelpEnabled)
        hideHoverHelp(theTable);
    }
  }
}

function onMouseOver(e)
{
  var theCell = this.parent;
  var theTable = this.parent.parent;
  var theEvent;
  if (at.ie)
    theEvent = window.event;
  else if (at.ns)
    theEvent = e;
 /* if (!((theTable.rowHeadersEnabled && theCell.columnIndex==0) || (theTable.columnHeadersEnabled && theCell.rowIndex==0)))
  {
    if (theTable.hoverHelpEnabled)
    {//  showHoverHelp(theEvent,theTable.hoverHelpData[theCell.rowIndex][theCell.columnIndex],theTable);
	}
  }*/
}

function onMouseUp(e)
{
  if (dragging)
  {
    dragging = false;
    if (at.ns)
      this.releaseEvents(Event.MOUSEMOVE);
  }
}

function onMouseDown(e)
{
  var left_click = false;
  if (at.ie){
      startPoint.x = window.event.clientX;
      if(event.button ==1)
           left_click = true;
  }
  else if (at.ns)
  {
      if (at.ns4)
        this.captureEvents(Event.MOUSEMOVE);
      startPoint.x = e.x;
      if(e.which == 1)
          left_click = true;
  }
  var theTable = this.parent.parent;
  if(left_click){
     selectRow(this.parent.parent,this.parent.rowIndex);
     selectCell(this.parent.parent,this.parent.rowIndex, this.parent.columnIndex);
     dragging = true;
     srcCell.y = this.parent.columnIndex;
  }
  else {//if(this.bgcolor == this.parent.parent.cellSelectionColor)
  	if(theTable.istableScheduleModel == false){
		var audioid = theTable.data[this.parent.rowIndex][theTable.nCols];
     	var videoind = parseInt(theTable.nCols,10)+1;
     	var videoid = theTable.data[this.parent.rowIndex][videoind];
		
		window.top.main.rhidden.location = "../jsp/dbreader.jsp?audioid="+audioid+"&videoid="+videoid;
		//if(audioid != 0){
		//window.open('../jsp/downloader.jsp?filePath=tempaudio/'+audioid+'.wav&fileName='+audioid+'.wav','formWindow');
		if (menuLoad){
			hidemenuie5();
		}
		menuobj=document.getElementById("ie5menu"+audioid+videoid);
		document.oncontextmenu=showmenuie5;
		document.onclick=hidemenuie5;
		menuLoad = true;
		document.captureEvents(Event.MOUSEDOWN);
		//}
		//if(videoid != 0){
		//	window.open('../jsp/downloader.jsp?filePath=tempvideo/'+videoid+'.swf&fileName='+videoid+'.swf','formWindow');
		//}
		
	}
	     var curcellColor = theTable.cells[this.parent.rowIndex][this.parent.columnIndex].bgcolor;
         if(curcellColor == theTable.cellSelectionColor || curcellColor == theTable.cellRecordingScheduledColor) {
          //Look for columnIndex of first cell in this time block
           indexCol1 = 0;
           indexCol2 = 0;
		   
			if(curcellColor == theTable.cellRecordingScheduledColor)
			{
			
				for(indexCol1=this.parent.columnIndex; indexCol1>=0; indexCol1--)
    	            if(theTable.cells[this.parent.rowIndex][indexCol1].bgcolor != theTable.cellRecordingScheduledColor)
        	             { indexCol1 = indexCol1 + 1; break;}
						 
				for(indexCol2=this.parent.columnIndex; indexCol2<theTable.nCols; indexCol2++)
                	if(theTable.cells[this.parent.rowIndex][indexCol2].bgcolor != theTable.cellRecordingScheduledColor)
                     { indexCol2 = indexCol2 - 1; break;}
			
				var nextLoc ="../CancelRec.htm?st="+indexCol1+"&end="+indexCol2+"&row="+this.parent.rowIndex;
				winRef = window.open(nextLoc,'recParamWindow','scrollbars=no, left='+window.event.clientX+', top=100,menubar=0,status=0,toolbar=0,width=200,height=100');
			}
			else
			{
			
			    for(indexCol1=this.parent.columnIndex; indexCol1>=0; indexCol1--)
                if(theTable.cells[this.parent.rowIndex][indexCol1].bgcolor != theTable.cellSelectionColor)
                     { indexCol1 = indexCol1 + 1; break;}

	           for(indexCol2=this.parent.columnIndex; indexCol2<theTable.nCols; indexCol2++)
                if(theTable.cells[this.parent.rowIndex][indexCol2].bgcolor != theTable.cellSelectionColor)
                     { indexCol2 = indexCol2 - 1; break;}
			
				var nextLoc ="../timeblocksched.htm?st="+indexCol1+"&end="+indexCol2+"&row="+this.parent.rowIndex;
           		winRef = window.open(nextLoc,'recParamWindow','scrollbars=no, left='+window.event.clientX+', top=100,menubar=0,status=0,toolbar=0,width=350,height=350');
			}
     }
  }
}

function onMouseMove(e)
{
  if (dragging)
  {
    if (at.ie)
      endPoint.x = window.event.clientX;
    else if (at.ns)
      endPoint.x = e.x;
    var theTable = this.parent.parent;
    /*var newWidth = theTable.columnWidth[srcCell.y] + endPoint.x - startPoint.x;
    if (newWidth>=0)
    {
      theTable.columnWidth[srcCell.y] = newWidth;
      theTable.backupWidth[srcCell.y] = newWidth;
      startPoint.x = endPoint.x;
      resizeTable(theTable);
    }*/
	selectCellMouseMove(this.parent.parent,this.parent.rowIndex, this.parent.columnIndex);
	startPoint.x = endPoint.x;
    //resizeTable(theTable);

  }
}

function selectRow(theTable,rowIndex)
{  
  var lastSelectedRow = theTable.selectedRow;
  var color;//
  if ((theTable.rowSelectionEnabled && theTable.istableScheduleModel) && !(theTable.columnHeadersEnabled && rowIndex==0))
  {
    deselectRow(theTable,lastSelectedRow);
  
	theTable.selectedRow = rowIndex;
    for (j=0;j<theTable.nCols;j++)
    {
	  if(theTable.data[theTable.selectedRow][j] ==  theTable.workScheduleValue)
	   	color = theTable.cellColors[0];
	  else if(theTable.data[theTable.selectedRow][j] ==  theTable.breakPeriodValue)
	   	color = theTable.cellColors[1];
	  else if(theTable.data[theTable.selectedRow][j] ==  theTable.cellGapValue)
	   	color = theTable.cellColors[2];
	  else if(theTable.data[theTable.selectedRow][j] ==  theTable.cellAdherenceYesValue)
	   	color = theTable.cellColors[3];
	  else if(theTable.data[theTable.selectedRow][j] ==  theTable.cellAdherenceNoValue)
	   	color = theTable.cellColors[4];
      else
	    color = theTable.rowSelectionColor;
      if (!((theTable.rowHeadersEnabled && j==0) || (theTable.columnHeadersEnabled && theTable.selectedRow==0)))
        theTable.cells[theTable.selectedRow][j].setBgColor(color);
     /* if (!((theTable.rowHeadersEnabled && j==0) || (theTable.columnHeadersEnabled && theTable.rowIndex==0)))
	  	if(theTable.cells[rowIndex][j].bgcolor != theTable.cellSelectionColor)
         theTable.cells[rowIndex][j].setBgColor(theTable.rowSelectionColor);*/
    }
  }
 /* else if((theTable.rowSelectionEnabled && !theTable.istableScheduleModel) && !(theTable.columnHeadersEnabled && rowIndex==0))
  {
    var colorIndex = theTable.selectedRow % theTable.rowColors.length;
    for (j=0;j<theTable.nCols;j++)
    {
      if (!((theTable.rowHeadersEnabled && j==0) || (theTable.columnHeadersEnabled && theTable.selectedRow==0)))
        theTable.cells[theTable.selectedRow][j].setBgColor(theTable.rowColors[colorIndex]);
      if (!((theTable.rowHeadersEnabled && j==0) || (theTable.columnHeadersEnabled && theTable.rowIndex==0)))
         theTable.cells[rowIndex][j].setBgColor(theTable.rowSelectionColor);
    }
    theTable.selectedRow = rowIndex;
    //alert(theTable.nCols +'--'+(parseInt(theTable.nCols,10)+1))
     var audioid = theTable.data[rowIndex][theTable.nCols];
     var videoind = parseInt(theTable.nCols,10)+1;
     var videoid = theTable.data[rowIndex][videoind];
	 var detailIDind = parseInt(theTable.nCols,10)+2;
	 var detailsId = theTable.data[rowIndex][detailIDind];
     //appletObj.getMedia(theTable.cells[rowIndex][cols],theTable.cells[rowIndex][videoind]);
    // alert(audioid+'...'+videoid)
     window.top.main.rhidden.location = "../jsp/dbreader.jsp?audioid="+audioid+"&videoid="+videoid;
     if(videoid =='')
         videoid =0;
     if(audioid =='')
         audioid =0;

     window.top.main.rtop.myPlayer.setStopButtonColor();
     window.top.main.rtop.myPlayer.getMedia(audioid,videoid);
	 if(window.top.main.rtop.eval_option.value =="ON"){
	 	var url_form = "../evaluationForm/Evaluation.jsp?FormId=";
	 	url_form += window.top.main.rtop.eval_form.value;
		url_form += "&DetailsID=";
		url_form += detailsId;
		window.open(url_form,'Evaluation','');
	}

  }*/
}

function deselectRow(theTable,rowIndex)
{
    	var colorIndex = rowIndex % theTable.rowColors.length;
		for (j=0;j<theTable.nCols;j++)
		{
		  if (!((theTable.rowHeadersEnabled && j==0) || (theTable.columnHeadersEnabled && rowIndex==0))){
			
			if(theTable.data[rowIndex][j] == theTable.workScheduleValue)
			{
				theTable.cells[rowIndex][j].setBgColor(theTable.workScheduleColor);
				//alert('Inside..'+theTable.data[theTable.selectedRow][j]);
			}	
			else if(theTable.data[rowIndex][j] ==  theTable.breakPeriodValue)
				 theTable.cells[rowIndex][j].setBgColor(theTable.breakPeriodColor);
			else if(theTable.data[rowIndex][j] ==  theTable.cellAdherenceYesValue)
				theTable.cells[rowIndex][j].setBgColor(theTable.cellAdherenceYesColor);
	    	else if(theTable.data[rowIndex][j] ==  theTable.cellAdherenceNoValue )
				theTable.cells[rowIndex][j].setBgColor(theTable.cellAdherenceNoColor);
	    	else if (theTable.data[rowIndex][j] ==  theTable.cellGapValue) 
				theTable.cells[rowIndex][j].setBgColor(theTable.cellGapColor);
			else
        		theTable.cells[rowIndex][j].setBgColor(theTable.rowColors[colorIndex]);		      
		  }
	   }
	
}


function selectCell(theTable,rowIndex,columnIndex)
{
  if ((theTable.cellSelectionEnabled) && !(theTable.columnHeadersEnabled && rowIndex==0)&& (theTable.istableScheduleModel))
  {
    var colorIndex = theTable.selectedRow % theTable.rowColors.length;
   // for (j=0;j<theTable.nCols;j++)
   // {
      //if (!((theTable.rowHeadersEnabled && columnIndex==0) || (theTable.columnHeadersEnabled && theTable.selectedRow==0)))
      //  theTable.cells[theTable.selectedRow][columnIndex].setBgColor(theTable.cellSelectionColor);
      if (!((theTable.rowHeadersEnabled && columnIndex==0) || (theTable.columnHeadersEnabled && theTable.rowIndex==0) || (rowIndex % 2 == 1)))
        {
		  if(theTable.cells[rowIndex][columnIndex].bgcolor == theTable.cellSelectionColor)
		     theTable.cells[rowIndex][columnIndex].setBgColor(theTable.rowColors[colorIndex]);
		 else
		  theTable.cells[rowIndex][columnIndex].setBgColor(theTable.cellSelectionColor);

		}
    //}
    theTable.selectedRow = rowIndex;
  }
  else if((theTable.cellSelectionEnabled) && !(theTable.columnHeadersEnabled && rowIndex==0))
  {
    var colorIndex = theTable.selectedRow % theTable.rowColors.length;
    for (j=0;j<theTable.nCols;j++)
    {
      if (!((theTable.rowHeadersEnabled && columnIndex==0) || (theTable.columnHeadersEnabled && theTable.selectedRow==0)))
         theTable.cells[theTable.selectedRow][columnIndex].setBgColor(theTable.rowColors[colorIndex]);

	  if (!((theTable.rowHeadersEnabled && columnIndex==0) || (theTable.columnHeadersEnabled && theTable.rowIndex==0)))
           {
		  theTable.cells[rowIndex][columnIndex].setBgColor(theTable.rowSelectionColor);
           }
    }
    theTable.selectedRow = rowIndex;
  }
}

function selectCellMouseMove(theTable,rowIndex,columnIndex)
{
  if ((theTable.cellSelectionEnabled && theTable.istableScheduleModel) && !(theTable.columnHeadersEnabled && rowIndex==0))
  {
    var colorIndex = theTable.selectedRow % theTable.rowColors.length;
   // for (j=0;j<theTable.nCols;j++)
   // {
      //if (!((theTable.rowHeadersEnabled && columnIndex==0) || (theTable.columnHeadersEnabled && theTable.selectedRow==0)))
      //  theTable.cells[theTable.selectedRow][columnIndex].setBgColor(theTable.cellSelectionColor);
      if (!((theTable.rowHeadersEnabled && columnIndex==0) || (theTable.columnHeadersEnabled && theTable.rowIndex==0)||(rowIndex % 2 == 1)))
        {
		  //if(theTable.cells[rowIndex][columnIndex].bgcolor == theTable.cellSelectionColor)
		   //  theTable.cells[rowIndex][columnIndex].setBgColor(theTable.rowColors[colorIndex]);
		// else
		  theTable.cells[rowIndex][columnIndex].setBgColor(theTable.cellSelectionColor);
		}
    //}
    theTable.selectedRow = rowIndex;
  }
}

function paint()
{
  var x = this.xPos;
  var y = this.yPos;
  var caption = "";
  var colorIndex = 0;

  for(j=0;j<this.nCols;j++)
  {
    for(i=0;i<this.nRows;i++)
    {
      caption = this.data[i][j];
//	  alert("caption = " +caption);
      if ((this.rowHeadersEnabled && j==0) || (this.columnHeadersEnabled && i==0))
      {
	     if(i!=0 && j==0 && this.istableScheduleModel)
		 {
		    if(i%2 != 0)
           		this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],(this.rowHeight)*2,caption,"center",this.headerForegroundColor,this.headerBackgroundColor,0,"",this.fontFace,this.fontSize,this.zoom);
            else
                this.cells[i][j]=new BaseLayer(4,4,10,2,"","center",this.headerForegroundColor,"white",0,"",this.fontFace,this.fontSize,this.zoom);
		 }
         else// if(this.istableScheduleModel && i!=0)
           	this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.firstRowHeight,caption,"center",this.headerForegroundColor,this.headerBackgroundColor,0,"",this.fontFace,this.fontSize,this.zoom);
		// else
        //   	this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.firstRowHeight,caption,"center",this.headerForegroundColor,this.rowColors[0],0,"",this.fontFace,this.fontSize);
      }
      else
      {	    
	    if((caption == this.workScheduleValue ) && (this.istableScheduleModel))
		  {
	            cellcolor = this.workScheduleColor;
                this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		  }
		  else if ((caption == this.cellRecAllMediaValue || caption == this.cellRecAudioValue || caption == this.cellRecVideoValue) && (this.istableScheduleModel))
		 {		 
		    cellcolor = this.cellRecordingScheduledColor;
//			alert(this.cellRecordingScheduledColor);
//                this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom););
                this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		 }
		else if ((caption == this.breakPeriodValue) && (this.istableScheduleModel))
		 {
				cellcolor = this.breakPeriodColor;
				this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		 }
		else if ((caption == this.cellGapValue ) && (this.istableScheduleModel))
		 {
				cellcolor = this.cellGapColor;
				this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		 }		 
		else{
				colorIndex = i % this.rowColors.length;
				this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,caption,"center",this.dataForegroundColor,this.rowColors[colorIndex],0,"",this.fontFace,this.fontSize,this.zoom);
		  }
      }
	  
      this.cells[i][j].parent = this;
      this.cells[i][j].rowIndex = i;
      this.cells[i][j].columnIndex = j;
      if (at.ns4)
        this.cells[i][j].lyr.captureEvents(Event.MOUSEDOWN);

      this.cells[i][j].lyr.onmousedown = onMouseDown;
      this.cells[i][j].lyr.onmouseover = onMouseOver;
      this.cells[i][j].lyr.onmouseout = onMouseOut;
      this.cells[i][j].lyr.onmouseup = onMouseUp;
      this.cells[i][j].lyr.onmousemove = onMouseMove;
	  if(i==0){
	    y = y + this.firstRowHeight + this.verticalCellSpacing;
            //this.cells[i][j].lyr.disabled = true;
	  }
	 /* else if (j==0 && i%2 == 1)
      	y = y + (this.rowHeight)*2 + this.verticalCellSpacing;*/
	  else
      	y = y + this.rowHeight + this.verticalCellSpacing;
    }
    x = x + this.columnWidth[j] + this.horizontalCellSpacing;
    this.tableHeight = y - this.verticalCellSpacing - this.yPos;
    y = this.yPos;
  }
  this.tableWidth = x - this.horizontalCellSpacing - this.xPos;
  if ((at.ns) && (this.hoverHelpEnabled))
  {
    this.hoverHelp = new Layer(this.hoverHelpSize);
  }

}


function refresh(myData)
{
  for(i=0;i<this.nRows;i++)
  {
    for(j=0;j<this.nCols;j++)
    {
		//this.cells[i][j].setCaption(this.data[i][j],"");
		this.data[i][j] = myData[i][j];
		  //repaint the cells
	  	if((this.data[i][j] == this.workScheduleValue ) && (this.istableScheduleModel))
		  {
	            cellcolor = this.workScheduleColor;
		  }
		else if ((this.data[i][j] == this.breakPeriodValue) && (this.istableScheduleModel))
		 {
				cellcolor = this.breakPeriodColor;
		 }
		else if ((this.data[i][j] == this.cellAdherenceYesValue ) && (this.istableScheduleModel))
		 {
				cellcolor = this.cellAdherenceYesColor;
		 }
	    else if ((this.data[i][j] == this.cellAdherenceNoValue ) && (this.istableScheduleModel))
		 {
				cellcolor = this.cellAdherenceNoColor;
		 }
	    else if ((this.data[i][j] == this.cellGapValue ) && (this.istableScheduleModel))
		 {
				cellcolor = this.cellGapColor;
		 } 
		else{
				colorIndex = i % this.rowColors.length;
				cellcolor = this.rowColors[i];
		 }
     
	  	if (!((this.rowHeadersEnabled && j==0) || (this.columnHeadersEnabled && i==0)))
        	this.cells[i][j].setBgColor(cellcolor);
      }//

    }
  
}

function resizeTable(theTable)
{
  var x = theTable.xPos;
  var y = theTable.yPos;
  var width;
  for (j=0;j<theTable.nCols;j++)
  {
    width = theTable.columnWidth[j];
    for (i=0;i<theTable.nRows;i++)
    {
      theTable.cells[i][j].setPos(x,y);
      theTable.cells[i][j].setSize(theTable.columnWidth[j],theTable.rowHeight);
	  if(i==0)
        y = y + theTable.firstRowHeight + theTable.verticalCellSpacing;
	  else
        y = y + theTable.rowHeight + theTable.verticalCellSpacing;
    }
    if (width > 0)
      x = x + width + theTable.horizontalCellSpacing;
    y = theTable.yPos;
  }
}

function showHoverHelp(theEvent,theText,theTable)
{
  var theHelp='';	
  var theMsg ='';
  theText=(theText!=null?theText:"");
  if (at.ie)
  {
    /*theMsg=theText.split('<br>');
    if (theMsg != null && theMsg != 'undefined' && theMsg.length>1)
    {
      theHelp='';
      for (i=0;i<theMsg.length;i++)
        theHelp+=theMsg[i];
      theEvent.srcElement.title=theHelp;
    }
    else
    {*/
      theEvent.srcElement.title= theText;
    //}
  }
  else if (at.ns)
  {
      theTable.hoverHelp.document.open();
      theTable.hoverHelp.document.write('<layer bgColor="lightyellow" style="border:1px solid black;font-size:12px;">'+theText+'</layer>');
      theTable.hoverHelp.document.close();
      theTable.hoverHelp.left=theEvent.pageX+5;
      theTable.hoverHelp.top=theEvent.pageY+5;
      theTable.hoverHelp.visibility="show";
  }
}

function hideHoverHelp(theTable)
{
  if (at.ns)
      theTable.hoverHelp.visibility="hide";
}

