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
var at = new UserAgent();

// JavaScript Document
var dragging = false;
function Point(pX,pY)
{
  this.x = pX;
  this.y = pY;
}
var startPoint = new Point(0,0);
var endPoint = new Point(0,0);

function CellData()
{
	this.row = 0;
	this.col = 0;
	this.clr = '';
}
var srcCell = new CellData();
var destCell = new CellData();

function schedTable(rows,cols)
{
	this.nRows = rows || 0;
	this.nCols = cols || 0;
 	this.xPos   = 0;
	this.yPos   = 0;
	this.rowHeight = 25;
    this.colWidth  = 50;
	this.firstRowHeight = 30;
 	this.fontSize = 1;
	this.horizontalCellSpacing = 1;
	this.verticalCellSpacing = 1;
	this.enableHorizontalSelection = false;
	this.enableVerticalSelection = true;
	
 	this.cellSelectionColor = "yellow";
	this.workScheduleColor  = "blue";
	this.breakPeriodColor  = "green";
	//this.cellNoModifColor  = "#FFCCCC";
	this.cellWorkNoModifColor  = "#663399";
	this.cellBreakNoModifColor = "#666666";
	
 	this.workScheduleValue = '5';
 	this.breakPeriodValue  = '3';
 	this.workScheduleNoModifValue = '7';
 	this.breakPeriodNoModifValue  = '8';
		
	this.headerBackgroundColor = "gray";
	this.headerForegroundColor = "black";//"white";
	this.dataForegroundColor   = "darkblue";
	this.rowColors =["lightblue"];// ["powderblue","lightblue"];//
	this.fontFace = "";
  	this.tableWidth = 0;
  	this.tableHeight = 0;
	this.selectedRow = 0;
	this.selectedCellCol = 0;
	this.selectedCellRow = 0;
	this.parentDocument = document.body;
    //create an array to hold the data for the cells
    this.data = new Array(rows);
    for (i=0; i<rows; i++)
    {
	  this.data[i] = new Array(cols);
    }
	
	//create an array to hold the layers for the cells
	this.cells = new Array(rows);
	for (k=0; k<rows; k++)
    {
	  this.cells[k] = new Array(cols);
    }
	
	//Set columns width
	this.columnWidth = new Array(cols);
/*	for (j=0;j<cols;j++)
	{
 	  this.columnWidth[j] = (j==0? 50 : 75);
	}
*/	 
	this.setPositionAndStyleParams  = setParams;
	this.setData = setDataFunc;
	this.draw = drawTableFunc;
 	this.setWorkPeriod = setWorkPeriodFunc;
	this.setBreakPeriod = setBreakPeriodFunc;
	this.setPeriodValue = setPeriodValue;
	this.refreshTableView = refreshTableView;
	this.removeCell = removeCell;
	this.deleteSchedPeriod = deleteSchedPeriod;
	//alert('End constructeur SchedTable.js-')
	
}

function setDataFunc(theData)
{
  for (i=0; i<this.nRows ;++i)
  {
    for (j=0; j<this.nCols; ++j)
    {
      this.data[i][j] = theData[i][j];
    }
  }
}

function setParams(x, y, horizontalCellSpacing,verticalCellSpacing, columWidth, rowHeight, parentDoc)
{
	this.xPos  = x;
	this.yPos  = y;
	this.horizontalCellSpacing = horizontalCellSpacing;
	this.verticalCellSpacing   = verticalCellSpacing;	
	this.colWidth = columWidth;
	this.rowHeight = rowHeight;
	this.parentDocument = parentDoc;
	//Set column width
	for (j=0;j<cols;j++)
  	  this.columnWidth[j] = columWidth;
 }



function drawTableFunc()
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
      if (j==0 || i==0)
      {
        if(i==0) 
           this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.firstRowHeight,caption,"center",this.headerForegroundColor, this.headerBackgroundColor,0,"",this.fontFace, this.fontSize,"",this.parentDocument);
	    else if(j==0)	   
           this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,caption,"center",this.headerForegroundColor,
							this.headerBackgroundColor,0,"",this.fontFace,this.fontSize,"",this.parentDocument);
      }
      else
      {
	    if(caption == this.workScheduleValue ) 
		  {
	            cellcolor = this.workScheduleColor;
                this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,"",this.parentDocument);
		  }
		else if (caption == this.breakPeriodValue)
		 {
		    	cellcolor = this.breakPeriodColor;
            	this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,"",this.parentDocument);
		 } //this.workScheduleNoModifValue
		else if (caption == this.workScheduleNoModifValue)
		 {
		    	cellcolor = this.cellWorkNoModifColor;
            	this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,"",this.parentDocument);
		 }
		else if (caption == this.breakPeriodNoModifValue)
		 {
		    	cellcolor = this.cellBreakNoModifColor;
            	this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,"","center",this.dataForegroundColor,cellcolor,0,"",this.fontFace,this.fontSize,"",this.parentDocument);
		 }		 
		 
		 else{
		    	colorIndex = i % this.rowColors.length;
                this.cells[i][j]= new BaseLayer(x,y,this.columnWidth[j],this.rowHeight,caption,"center",this.dataForegroundColor,this.rowColors[colorIndex],0,"",this.fontFace,this.fontSize,"",this.parentDocument);
		  }
      }
      this.cells[i][j].parent = this;
      this.cells[i][j].rowIndex = i;
      this.cells[i][j].columnIndex = j;
      if (at.ns4)
        this.cells[i][j].lyr.captureEvents(Event.MOUSEDOWN);

      this.cells[i][j].lyr.onmousedown = onMouseDown;
      this.cells[i][j].lyr.onmouseup   = onMouseUp;
//      this.cells[i][j].lyr.onmouseout = onMouseOut;
      this.cells[i][j].lyr.onclick = onClick;
      this.cells[i][j].lyr.onmousemove = onMouseMove;
//	  this.cells[i][j].lyr.disabled = true;
	  if(i==0 )
	    y = y + this.firstRowHeight + this.verticalCellSpacing;
	  else
      	y = y + this.rowHeight + this.verticalCellSpacing;
    }
    x = x + this.columnWidth[j] + this.horizontalCellSpacing;
    this.tableHeight = y - this.verticalCellSpacing - this.yPos;
    y = this.yPos;
  }
 
  this.tableWidth = x - this.horizontalCellSpacing - this.xPos;  
}

function onClick(e)
{
  var left_click = false;
  var theTable = this.parent.parent;
  theTable.selectedCellRow = this.parent.rowIndex; 
  theTable.selectedCellCol = this.parent.columnIndex;

  if (at.ie){
      startPoint.x = window.event.clientX;	 
	  startPoint.y = window.event.clientY;
      if(event.button ==1)
         left_click = true;
  }
  
  if(left_click){
     //selectRow(this.parent.parent,this.parent.rowIndex);
     selectCell (this.parent.parent,this.parent.rowIndex, this.parent.columnIndex); //should use selectCell..
     //dragging = true;
     srcCell.row = this.parent.columnIndex;
  }
 
}

function onMouseDown(e)
{
  startPoint.x = window.event.clientX;	  
  startPoint.y = window.event.clientY;	
  window.status = 'onMouseDown..'+startPoint.x+'..'+startPoint.y;
  var left_click = false;
  var theTable = this.parent.parent;
  theTable.selectedCellRow = this.parent.rowIndex; 
  theTable.selectedCellCol = this.parent.columnIndex;
  
  srcCell.col = this.parent.columnIndex;
  srcCell.row = this.parent.rowIndex;
  srcCell.clr = this.parent.bgcolor;
  if (at.ie){
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
     //selectRow(this.parent.parent,this.parent.rowIndex);
     selectCellMouseMove(this.parent.parent,this.parent.rowIndex, this.parent.columnIndex); //should use selectCell..
     dragging = true;
  }
  else {
	  //if(this.bgcolor == this.parent.parent.cellSelectionColor)
         /*var theTable = this.parent.parent;
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

           var nextLoc ="../timeblocksched.htm?st="+indexCol1+"&end="+indexCol2+"&row="+this.parent.rowIndex;
           winRef = window.open(nextLoc,'recParamWindow','scrollbars=no, left='+window.event.clientX+', top=100,menubar=0,status=0,toolbar=0,width=350,height=350');
		  
     }*/
  }
	
}

function onMouseUp(e)
{
  var left_click = false;	
  destCell.col = this.parent.columnIndex;
  destCell.row = this.parent.rowIndex;
  endPoint.x = window.event.clientX;
  endPoint.y = window.event.clientY;
  if (at.ie){
      if(event.button ==1)
         left_click = true;
  }

  if (dragging)
  {

    dragging = false;
    if (at.ns)
      this.releaseEvents(Event.MOUSEMOVE);
  }
  
  //Set cell color if this is a click
  if(left_click){
	  window.status = 'onMouseUp --'+startPoint.x + '..'+endPoint.x+'..'+startPoint.y+'..'+endPoint.y+'..'+this.parent.bgcolor+'..'+this.parent.parent.cellSelectionColor;
	  if((endPoint.x == startPoint.x) && (endPoint.y == startPoint.y) && (srcCell.clr == this.parent.parent.cellSelectionColor) )
	  {
		  window.status = 'click';
		  this.parent.setBgColor(this.parent.parent.rowColors[0]); 
	  }
  }
}

function onMouseMove(e)
{
   //window.status = 'onMouseMove';
   if (dragging)
   {	  
    if (at.ie)
      endPoint.x = window.event.clientX;
    else if (at.ns)
      endPoint.x = e.x;
    var theTable = this.parent.parent;
 	selectCellMouseMove(this.parent.parent,this.parent.rowIndex, this.parent.columnIndex);
	
	//This is the current cell pos
	theTable.selectedCellCol = this.parent.columnIndex; 
	theTable.selectedCellRow = this.parent.rowIndex;
	
	//startPoint.x = endPoint.x;
   }
}

function selectCell(theTable,rowIndex,columnIndex)
{
  var thisCell = theTable.cells[rowIndex][columnIndex];		
  if(thisCell.bgcolor == theTable.cellSelectionColor)
	thisCell.setBgColor(theTable.rowColors[0]); 
  else if(thisCell.bgcolor != theTable.workScheduleColor && thisCell.bgcolor != theTable.breakPeriodColor &&  thisCell.bgcolor != theTable.cellWorkNoModifColor && thisCell.bgcolor != theTable.cellBreakNoModifColor)	
	thisCell.setBgColor(theTable.cellSelectionColor);         
  theTable.selectedCol = columnIndex; 
  theTable.selectedRow = rowIndex;	
}

function selectCellMouseMove(theTable,rowIndex,columnIndex)
{
  var thisCell = theTable.cells[rowIndex][columnIndex];	
  if(rowIndex != 0 && columnIndex != 0 )
  {  
  	 if((endPoint.x == startPoint.x) && (endPoint.y == startPoint.y)) //this is a click
	 {
		//this is a click
		 if(thisCell.bgcolor == theTable.cellSelectionColor)
			thisCell.setBgColor(theTable.rowColors[0]); 
	     return;	 
	 }
  
     if(thisCell.bgcolor != theTable.workScheduleColor && thisCell.bgcolor != theTable.breakPeriodColor && thisCell.bgcolor != theTable.cellWorkNoModifColor && thisCell.bgcolor != theTable.cellBreakNoModifColor )	
		 thisCell.setBgColor(theTable.cellSelectionColor);         
 
 	 theTable.selectedCol = columnIndex; 
	 theTable.selectedRow = rowIndex;
	 
  }
}

function setWorkPeriodFunc( CellCol, CellRow)
{
	var curcell = CellCol;
	var i=0, start, end;
	//look backward
	for (i = CellCol ; i>0; i--)
	{
		if(this.cells[CellRow][i].bgcolor != this.cellSelectionColor)
			break;
	}
	start = i+1;
	//look forward
	for (i = CellCol ; i<this.nCols; i++)
	{
		if(this.cells[CellRow][i].bgcolor != this.cellSelectionColor)
			break;
	}
	end = i-1;
	
	for (i=start; i<=end; ++i)
	{
	   this.data[CellRow][i] = this.workScheduleValue ;
       this.cells[CellRow][i].setBgColor(this.workScheduleColor);
 	}
	
  	 
}

function setPeriodValue (CellCol, CellRow, activity)
{
	//var curcell = CellCol;
	var i=0, start, end;
	//look backward
	if(this.enableVerticalSelection)
	{
		for (i = CellRow ; i>0; i--)
		{
			if(this.cells[i][CellCol].bgcolor != this.cellSelectionColor)
				break;
		}
		start = i+1;
		//look forward
		for (i = CellRow ; i<this.nRows; i++)
		{
			if(this.cells[i][CellCol].bgcolor != this.cellSelectionColor)
				break;
		}
		end = i-1;
		
		for (i=start; i<=end; ++i)
		{		
		   this.data[i][CellCol] = (activity == 'WORK') ? this.workScheduleValue : this.breakPeriodValue ;
		   this.cells[i][CellCol].setBgColor((activity == 'WORK')? this.workScheduleColor:this.breakPeriodColor);
		}

	}
	
	if(this.enableHorizontalSelection)
	{	
		for (i = CellCol ; i>0; i--)
		{
			if(this.cells[CellRow][i].bgcolor != this.cellSelectionColor)
				break;
		}
		start = i+1;
		//look forward
		for (i = CellCol ; i<this.nCols; i++)
		{
			if(this.cells[CellRow][i].bgcolor != this.cellSelectionColor)
				break;
		}
		end = i-1;
		
		for (i=start; i<=end; ++i)
		{		
		   this.data[CellRow][i] = (activity == 'WORK') ? this.workScheduleValue : this.breakPeriodValue ;
		   this.cells[CellRow][i].setBgColor((activity == 'WORK')? this.workScheduleColor:this.breakPeriodColor);
		}
	}
	
	enableSaveButton();
}

function setWorkPeriodFunc( CellCol, CellRow)
{
	this.setPeriodValue( CellCol, CellRow,'WORK');
}

function setBreakPeriodFunc( CellCol, CellRow)
{
	this.setPeriodValue( CellCol, CellRow, 'BREAK');
}

function deleteSchedPeriod( CellCol, CellRow) 
{
  	var i=0, start, end;
	var thiscellcolor = this.cells[CellRow][CellCol].bgcolor;
	if((thiscellcolor != this.workScheduleColor) && (thiscellcolor != this.breakPeriodColor))
		return;
	//look backward
	if(this.enableVerticalSelection)
	{
		for (i = CellRow ; i>0; i--)
		{
		    if(this.cells[i][CellCol].bgcolor != thiscellcolor)
				break;
		}
		start = i+1;
		//look forward
		for (i = CellRow ; i<this.nRows; i++)
		{
			if(this.cells[i][CellCol].bgcolor != thiscellcolor)
				break;
		}
		end = i-1;
		
		for (i=start; i<=end; ++i)
		{		
		   this.data[i][CellCol] = '';
		   this.cells[i][CellCol].setBgColor(this.rowColors[0]);
		}
	
		enableSaveButton();

	}
	

}

function enableSaveButton()
{
		document.getElementById('saveSched').disabled = false;	
}

function removeCell(cellrow, cellcol)
{
  	var theCell = this.cells[cellrow][cellcol];	
	//document.body.removeChild(theCell.lyr); 
	document.getElementById("tabPage4").removeChild(theCell.lyr); 
}

function refreshTableView()
{
  for(j=0;j<this.nCols;j++)
  {
    for(i=0;i<this.nRows;i++)
    {
		this.removeCell(i,j);
	}		
  }
  this.nCols = 0;
  this.nRows = 0; 
}