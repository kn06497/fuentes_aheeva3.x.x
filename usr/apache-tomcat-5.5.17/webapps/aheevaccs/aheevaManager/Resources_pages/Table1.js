function UserAgent() {
	var b=navigator.appName;
	if (b=="Netscape") this.b="ns";
	else if (b=="Microsoft Internet Explorer") this.b="ie";
	else this.b=b;
	this.version=navigator.appVersion;
	this.v=parseInt(this.version);
	this.ns=(this.b=="ns" && this.v>=4);
	this.ns4=(this.b=="ns" && this.v==4);
	this.ns5=(this.b=="ns" && this.v==5);
	this.ie=(this.b=="ie" && this.v>=4);
	this.ie4=(this.version.indexOf('MSIE 4')>0);
	this.ie5=(this.version.indexOf('MSIE 5')>0);
	this.ie55=(this.version.indexOf('MSIE 5.5')>0);
}
var at=new UserAgent();

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

var lastSelected=0;
var myTable;
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
  this.workScheduleColor  = "royalblue"; //dodgerblue,blue
  this.workScheduleValue = '5';
  this.breakPeriodColor  = "yellow";
  this.breakPeriodValue  = '3';
  this.cellAdherenceYesValue  = '100';
  this.cellAdherenceNoValue   = '101';
  this.cellAdherenceYesColor  = "green";
  this.cellAdherenceNoColor    = "red";
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
  this.setHightLightCellColor = setHightLightCellColor;
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
  this.highLightRow = highLightRow;
 
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
  this.paint2 = paint2;
  this.paint3 = paint3;
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

function setCellData(theData)
{
  for (i=0; i<this.nRows ;++i)
  { 
    for (j=0; j<this.nCols; ++j)
    {
      this.cells[i][j] = theData[i][j];
    }
  }
}

function setCellColor(workClr,breakClr,gapClr,adhYesClr, adhNoClr)
{
  this.workScheduleColor  = workClr; //dodgerblue,blue
  this.breakPeriodColor   = breakClr;
  this.cellAdherenceYesColor = adhYesClr;
  this.cellAdherenceNoColor  = adhNoClr;
  this.cellGapColor = gapClr;
}
function setHightLightCellColor(workHClr,breakHClr,gapHClr,adhYesHClr, adhNoHClr)
{
  this.cellColors[0]  = workHClr; //dodgerblue,blue
  this.cellColors[1]  = breakHClr;
  this.cellColors[2]  = gapHClr;
  this.cellColors[3]  = adhYesHClr;
  this.cellColors[4]  = adhNoHClr;
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
  if (!((theTable.rowHeadersEnabled && theCell.columnIndex==0) || (theTable.columnHeadersEnabled && theCell.rowIndex==0)))
  {
    if (theTable.hoverHelpEnabled)
    {
		showHoverHelp(theEvent,theTable.hoverHelpData[theCell.rowIndex][theCell.columnIndex],theTable);
	}
  }
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
  if(left_click){
	 //deselectRow(this.parent.parent);
     selectRow(this.parent.parent,this.parent.rowIndex);
     //selectCell(this.parent.parent,this.parent.rowIndex, this.parent.columnIndex);
     dragging = true;
     srcCell.y = this.parent.columnIndex;
  }
  else {//if(this.bgcolor == this.parent.parent.cellSelectionColor)
         var theTable = this.parent.parent;
         var curcellColor = theTable.cells[this.parent.rowIndex][this.parent.columnIndex].bgcolor;
         if(curcellColor == theTable.cellSelectionColor) {
          //Look for columnIndex of first cell in this time block
           indexCol1 = 0;
           indexCol2 = 0;
           for(indexCol1=this.parent.columnIndex; indexCol1>=0; indexCol1--)
                if(theTable.cells[this.parent.rowIndex][indexCol1].bgcolor != theTable.cellSelectionColor)
                     { indexCol1 = indexCol1 + 1; break;}

           for(indexCol2=this.parent.columnIndex; indexCol2<theTable.nCols; indexCol2++)
                if(theTable.cells[this.parent.rowIndex][indexCol2].bgcolor != theTable.cellSelectionColor)
                     { indexCol2 = indexCol2 - 1; break;}

          // var nextLoc ="../timeblocksched.htm?st="+indexCol1+"&end="+indexCol2+"&row="+this.parent.rowIndex;
         //  winRef = window.open(nextLoc,'recParamWindow','scrollbars=no, left='+window.event.clientX+', top=100,menubar=0,status=0,toolbar=0,width=350,height=350');
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

function highLightRow(rowIndex)
{
  window.top.main.rtop.stats.rowSelected = rowIndex;
  var left_click = false;
  if (at.ie){
      if(event.button ==1)
           left_click = true;
  }
  else if (at.ns)
  {
      if (at.ns4)
        this.captureEvents(Event.MOUSEMOVE);
      if(e.which == 1)
          left_click = true;
  }
  if(left_click){
	//var lastSelectedRow = lastSelected;
	//alert('..lastSelectedRow..'+lastSelectedRow+'..row selected='+rowIndex+'..'+ myTable.selectedRow+'..'+myTable.nCols);
    selectRow(rowIndex);
	lastSelected = rowIndex;
	myTable.selectedRow = rowIndex;

  }
}

function selectRow(rowIndex)
{  
  	var color;//
	var oCell;
  //if ((myTable.rowSelectionEnabled && myTable.istableScheduleModel) && !(myTable.columnHeadersEnabled && rowIndex==0))
  //{
    deselectRow(lastSelected);  
	//myTable.selectedRow = rowIndex;
    for (j=1;j<myTable.nCols;j++)
    {
	  if(myTable.cells[rowIndex][j] ==  myTable.workScheduleValue)
	   	color = myTable.cellColors[0];
	  else if(myTable.cells[rowIndex][j] ==  myTable.breakPeriodValue)
	   	color = myTable.cellColors[1];
	  else if(myTable.cells[rowIndex][j] ==  myTable.cellGapValue)
	   	color = myTable.cellColors[2];
	  else if(myTable.cells[rowIndex][j] ==  myTable.cellAdherenceYesValue)
	   	color = myTable.cellColors[3];
	  else if(myTable.cells[rowIndex][j] ==  myTable.cellAdherenceNoValue)
	   	color = myTable.cellColors[4];
      else
	    color = myTable.rowSelectionColor;
      if (!((myTable.rowHeadersEnabled && j==0) || (myTable.columnHeadersEnabled && rowIndex==0)))
       {//myTable.cells[myTable.selectedRow][j].setBgColor(color);
	       var cid = rowIndex+'-'+String(j);
	   	   oCell = document.getElementById(cid);
		   //alert(cid+'..old color..'+oCell.style.backgroundColor+'..new color..'+color)
		   if(oCell)
		   	oCell.style.backgroundColor = color;

	   }
   }
}

function deselectRow(rowIndex)
{
    	var colorIndex = rowIndex % myTable.rowColors.length;
		var color;
		//alert('deselectrow..'+rowIndex)
		for (j=1;j<myTable.nCols;j++)
		{
		  if (!((myTable.rowHeadersEnabled && j==0) || (myTable.columnHeadersEnabled && rowIndex==0))){
			
			if(myTable.cells[rowIndex][j] == myTable.workScheduleValue)			
				color = myTable.workScheduleColor;			
			else if(myTable.cells[rowIndex][j] ==  myTable.breakPeriodValue)
				color = myTable.breakPeriodColor;
			else if(myTable.cells[rowIndex][j] ==  myTable.cellAdherenceYesValue)
				color =	myTable.cellAdherenceYesColor;
	    	else if(myTable.cells[rowIndex][j] ==  myTable.cellAdherenceNoValue )
				color = myTable.cellAdherenceNoColor;
	    	else if (myTable.cells[rowIndex][j] ==  myTable.cellGapValue) 
				color = myTable.cellGapColor;
			else
        		color = myTable.rowColors[colorIndex];		
			
		   var cid = rowIndex+'-'+String(j);
	   	   oCell = document.getElementById(cid);
		   //alert(cid+'..old color..'+oCell.style.backgroundColor+'..new color..'+color)
		   if(oCell)
		   	oCell.style.backgroundColor = color;	
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

function paint2()
{
   //TODO : clean this line
  var HTML= "<TABLE cellspacing=1px>";
  var oElement = document.getElementById('divRtaTab');
  //oElement.innerHTML += HTML;
  var rid;
  var x = this.xPos;
  var y = this.yPos;
  var caption = "";
  var colorIndex = 0;
  myTable = this;
  
  for(i=0;i<this.nRows;i++)
  {
	// oElement.innerHTML += "<TR>"; 
	rid= String(i);
	HTML += "<TR id="+rid+">"; 
    for(j=0;j<this.nCols;j++)
    {
      caption = this.data[i][j]; 
      if ((this.rowHeadersEnabled && j==0) || (this.columnHeadersEnabled && i==0))
      {
	     if(i!=0 && j==0 && this.istableScheduleModel)
		 {
		    if(i%2 != 0){
           		//this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],(this.rowHeight)*2,caption,"center",this.headerForegroundColor,this.headerBackgroundColor,0,"",this.fontFace,this.fontSize,this.zoom);
				HTML += '<TD width='+this.columnWidth[j]+' rowspan=2 height='+this.rowHeight+' bgcolor='+this.headerBackgroundColor+'>'+caption+'</TD>';
			}else{
                //this.cells[i][j]=new BaseLayer(4,4,10,2,"","center",this.headerForegroundColor,"white",0,"",this.fontFace,this.fontSize,this.zoom);
				//HTML += '<TD width='+this.columnWidth[j]+' height='+this.rowHeight+' bgcolor='+this.headerBackgroundColor+'></TD>';
			}
		 }
         else{
           		//this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.firstRowHeight,caption,"center",this.headerForegroundColor,this.headerBackgroundColor,0,"",this.fontFace,this.fontSize,this.zoom);
				HTML += '<TD width='+this.columnWidth[j]+' height='+this.firstRowHeight+' bgcolor='+this.headerBackgroundColor+'>'+caption+'</TD>';
		 }
      }
      else
      {
	    if((caption == this.workScheduleValue ) && (this.istableScheduleModel))
		  {
	            cellcolor = this.workScheduleColor;
               // this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		  }
		else if ((caption == this.breakPeriodValue) && (this.istableScheduleModel))
		 {
				cellcolor = this.breakPeriodColor;
				//this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		 }
		else if ((caption == this.cellAdherenceYesValue ) && (this.istableScheduleModel))
		 {
				cellcolor = this.cellAdherenceYesColor;
				//this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		 }
	    else if ((caption == this.cellAdherenceNoValue ) && (this.istableScheduleModel))
		 {
				cellcolor = this.cellAdherenceNoColor;
				//this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		 }
	    else if ((caption == this.cellGapValue ) && (this.istableScheduleModel))
		 {
				cellcolor = this.cellGapColor;
				//this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		 } 
		else{
				colorIndex = i % this.rowColors.length;
				cellcolor = this.rowColors[colorIndex];
				//this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,caption,"center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		  }
		  var cid= String(i)+'-'+String(j);
		  HTML +=  "<TD id="+cid+" width="+ this.columnWidth[j]+" height="+this.rowHeight+" bgcolor="+cellcolor+" title=\""+ this.hoverHelpData[i][j]+ "\" onMouseDown=\"highLightRow('"+rid+"')\"></TD>";
      }
      /*this.cells[i][j].parent = this;
      this.cells[i][j].rowIndex = i;
      this.cells[i][j].columnIndex = j;
      if (at.ns4)
        this.cells[i][j].lyr.captureEvents(Event.MOUSEDOWN);
      this.cells[i][j].lyr.onmousedown = onMouseDown;
      this.cells[i][j].lyr.onmouseover = onMouseOver;
      this.cells[i][j].lyr.onmouseout = onMouseOut;
      this.cells[i][j].lyr.onmouseup = onMouseUp;
      this.cells[i][j].lyr.onmousemove = onMouseMove;
      
	  x = x + this.columnWidth[j] + this.horizontalCellSpacing;
	  */
    }
	//oElement.innerHTML += "</TR>";  
	HTML += "</TR>"; 
	/*if(i==0)
	    y = y + this.firstRowHeight + this.verticalCellSpacing;	  
	else
      	y = y + this.rowHeight + this.verticalCellSpacing;
    x = this.xPos;

    this.tableHeight = y - this.verticalCellSpacing - this.yPos;*/
  }
  //this.tableWidth = x - this.horizontalCellSpacing - this.xPos; 	
  
  //oElement.innerHTML += "</TABLE>";  
  HTML += "</TABLE>"; 
  oElement.innerHTML = HTML; //"<table width=500px height=300px> <tr><td bgcolor='red'>Yeah!!</td></tr></table>"
  //alert(oElement.innerHTML)
}


function paint3(html)
{
   var oElement = document.getElementById('divRtaTab');

  oElement.innerHTML = html; 
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
		else if ((caption == this.breakPeriodValue) && (this.istableScheduleModel))
		 {
				cellcolor = this.breakPeriodColor;
				this.cells[i][j]=new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		 }
		else if ((caption == this.cellAdherenceYesValue ) && (this.istableScheduleModel))
		 {
				cellcolor = this.cellAdherenceYesColor;
				this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
		 }
	    else if ((caption == this.cellAdherenceNoValue ) && (this.istableScheduleModel))
		 {
				cellcolor = this.cellAdherenceNoColor;
				this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,this.zoom);
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
  setTableData(myData);	
  /*for(i=0;i<this.nRows;i++)
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
  */
  paint2();
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

