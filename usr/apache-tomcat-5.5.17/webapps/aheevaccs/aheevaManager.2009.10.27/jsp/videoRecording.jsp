<%@page contentType="text/html"%>
<html>
<LINK href="../Resources_pages/style.css" type=text/css rel=stylesheet>

<head>
<style>
<!--

/* Context menu Script- © Dynamic Drive (www.dynamicdrive.com) Last updated: 01/08/22
For full source code and Terms Of Use, visit http://www.dynamicdrive.com */

.skin0{
position:absolute;
width:165px;
border:2px solid black;
background-color:menu;
font-family:Verdana;
line-height:20px;
cursor:default;
font-size:14px;
z-index:100;
visibility:hidden;
}

.menuitems{
padding-left:10px;
padding-right:10px;
}
-->
</style>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/videoBrowser.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/BaseLayer.js"></SCRIPT>
<SCRIPT language="JAVASCRIPT" src="../Resources_pages/Table.js"></SCRIPT>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<SCRIPT>
var myTable;
var layer;
var rows = 1, cntRow = 0;
var cols = 6, cntCol = 0;
var myData ;
var menuLoad = false;

function setPageTitle()
{
	window.top.document.title = 	"Agent recording data";
}

function setRowNum(numrows)
{
  rows = parseInt(numrows,10) + 1;
  myData = new Array(rows);
}

function setColumHeadersValue()
{
   var colHeader = new Array("ANI","DNIS","Start Date/Time","End Date/Time","Evaluation","Recording type");
   //Set array for row header data
   myData[0] = new Array(cols+3);
   for(i=0;i<cols;i++)
     myData[0][i]= colHeader[i];

}

function setRecordingData()
{
    curRow = setRecordingData.arguments[0];
    for(nbarg=1; nbarg<setRecordingData.arguments.length; nbarg++)
      myData[curRow][nbarg-1] = setRecordingData.arguments[nbarg];
}

function createTable()
{
  var columnWidths = [100,150,150,150,150,150];

  myTable = new Table(rows,cols);
  myTable.setTableData(myData);
  myTable.setTablePos(4,4);
  myTable.enableColumnHeaders(true);
  myTable.enableRowHeaders(false);
  myTable.setRowHeight(16);
  myTable.setFirstRowHeight(20);
  myTable.setTableModelSchedule(false);
  myTable.enableRowSelection(true,"skyblue");
  myTable.setColumnWidth(columnWidths);
  //myTable.setFont("",2);
  myTable.paint();

}

</script>
</head>

<%@page language = "java" %>
<%@ page import="java.util.*" %>
<%@page import ="aheevaManager.VideoReports.*"%>
<jsp:useBean id="beanRecord" scope="request" class="aheevaManager.VideoReports.beanVideoAgentRecording" />

<body >

<div id="ie5menutest" class="skin0" onMouseover="highlightie5(event)" onMouseout="lowlightie5(event)" onClick="jumptoie5(event)" display:none>
<div class="menuitems" target="blank" url='../jsp/downloader.jsp?filePath=tempaudio/101.wav&fileName=101.wav'>save Audio</div>
</div>

<script language="JavaScript1.2">

//set this variable to 1 if you wish the URLs of the highlighted menu to be displayed in the status bar
var display_url=0

var ie5=document.all&&document.getElementById
var ns6=document.getElementById&&!document.all
if (ie5||ns6)
var menuobj 
//= document.getElementById("ie5menutest")

function showmenuie5(e){
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
return false
}

function hidemenuie5(e){
menuobj.style.visibility="hidden"
}

function highlightie5(e){
var firingobj=ie5? event.srcElement : e.target
if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode //up one node
firingobj.style.backgroundColor="highlight"
firingobj.style.color="white"
if (display_url==1)
window.status=event.srcElement.url
}
}

function lowlightie5(e){
var firingobj=ie5? event.srcElement : e.target
if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode //up one node
firingobj.style.backgroundColor=""
firingobj.style.color="black"
window.status=''
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

if (ie5||ns6){
//menuobj.style.display='' 
//document.oncontextmenu=showmenuie5
//document.onclick=hidemenuie5
}

</script>

<!--<p> <font color="#000000" face="Arial"><b>-->
<%
int cnt =0;
   String agent="",mm="00",yy="2004",inTime="07:00",outTime="22:00";
    if ( request.getParameter("agent") != null ) {
    	 agent = request.getParameter("agent");
    	 System.out.println("<script language='javascript'>document.write(MultiArray[\"Agent\"][lang]);</script>"" : " + agent);
    }
    if ( request.getParameter("mm") != null ) {
    	mm = request.getParameter("mm");
    	//mm = "06";
        System.out.println"<script language='javascript'>document.write(MultiArray[\"Month\"][lang]);</script>"" : " +mm );
    }
    if ( request.getParameter("yy") != null ) {
    	yy = request.getParameter("yy");
        System.out.println("<script language='javascript'>document.write(MultiArray[\"Year\"][lang]);</script>"" : " +yy );
    }
    if ( request.getParameter("st") != null ) {
    	inTime = request.getParameter("st");
        System.out.println("<script language='javascript'>document.write(MultiArray[\"Start time\"][lang]);</script>""  : " + inTime);
    }
    if ( request.getParameter("et") != null ) {
    	outTime = request.getParameter("et");
        System.out.println("<script language='javascript'>document.write(MultiArray[\"End time\"][lang]);</script>"" : " +outTime );
        //outTime
    }

//beanRecord.getAgentRecording("101","06","2004","07:00","15:00");
    beanRecord.getAgentRecording(agent,mm,yy,inTime,outTime);
%>
  <script>
    setRowNum('<%out.write(Integer.toString(beanRecord.m_recDetails.size()));%>');
    setColumHeadersValue();
   //alert(rows)
  </script>

<!--<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">-->
  <%
 for(cnt = 0;cnt < beanRecord.m_recDetails.size();cnt++){
            //out.write("<tr>");
            beanVideoRecordDetails myRecData =(beanVideoRecordDetails)beanRecord.m_recDetails.elementAt(cnt);
            //out.write("<td width=\"50\" bgcolor=\"#FFFFFF\" align=\"center\"><font size=\"2\" color=\"#000000\">" + myRecData.recStartTime +"</font></td>");
  %>
  <script>
  			var audioId = <%out.write(myRecData.audioid);%>
			var videoId = <%out.write(myRecData.videoid);%>
			//alert("audioId["+audioId+"]");
			//alert("videoId["+videoId+"]");
  			document.write("<div id=\"ie5menu"+audioId+videoId+"\" class=\"skin0\" onMouseover=\"highlightie5(event)\" onMouseout=\"lowlightie5(event)\" onClick=\"jumptoie5(event)\" display:none>");

			if (audioId > 0){
				document.write("<div class=\"menuitems\" target=\"blank\" url='../jsp/downloader.jsp?filePath=tempaudio/"+audioId+".wav&fileName="+audioId+".wav'>"+MultiArray["save Audio"][lang]+" </div>");
			}
			if (videoId > 0){
				document.write("<div class=\"menuitems\" target=\"blank\" url='../jsp/downloader.jsp?filePath=tempvideo/"+videoId+".swf&fileName="+videoId+".swf'>"+MultiArray["save Video"][lang]+" </div>");
			}
			
			document.write("</div>");
			
            cntRow++;
            myData[cntRow] = new Array(cols+3);
            setRecordingData(cntRow,'<%out.write(myRecData.ANI);%>','<%out.write(myRecData.DNIS);%>','<%out.write(myRecData.recStartTime);%>','<%out.write(myRecData.recEndTime);%>','<%out.write(myRecData.evaluationid);%>','<%out.write(myRecData.recType);%>','<%out.write(myRecData.audioid);%>','<%out.write(myRecData.videoid);%>','<%out.write(myRecData.detailsId);%>');
  </script>
  <%
        }
  %>
  <script>
           createTable();
  </script>
<!--</table>

</b></font></p>-->
</body>
</html>
