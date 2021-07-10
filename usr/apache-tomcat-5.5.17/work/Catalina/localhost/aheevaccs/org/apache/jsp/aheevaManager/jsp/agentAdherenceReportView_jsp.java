package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.schedule.*;
import java.io.*;
import java.io.File;
import java.io.RandomAccessFile;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import aheevaManager.csvinterface.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;
import java.util.*;
import aheevaManager.schedule.*;

public final class agentAdherenceReportView_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageadVData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageadVData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageadVData.openConnection();

      out.write("\n");
      out.write("<LINK href=\"../Resources_pages/style.css\" type=text/css rel=stylesheet>\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("<!--\r\n");
      out.write("/* Context menu Script- © Dynamic Drive (www.dynamicdrive.com) Last updated: 01/08/22\r\n");
      out.write("For full source code and Terms Of Use, visit http://www.dynamicdrive.com */\r\n");
      out.write("\r\n");
      out.write(".skin0{\r\n");
      out.write("\tposition:absolute;\r\n");
      out.write("\twidth:145px;\r\n");
      out.write("\tborder:2px solid black;\r\n");
      out.write("\tbackground-color:lavenderblush ;\r\n");
      out.write("\tfont-family:Verdana;\r\n");
      out.write("\tline-height:15px;\r\n");
      out.write("\tcursor:default;\r\n");
      out.write("\tfont-size:10px;\r\n");
      out.write("\tz-index:80;\r\n");
      out.write("\tvisibility:hidden;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".menuitems{\r\n");
      out.write("\tpadding-left:6px;\r\n");
      out.write("\tpadding-right:6px;\r\n");
      out.write("\theight:17;\r\n");
      out.write("\tvisibility:visible;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.sousmenu{\r\n");
      out.write("\tposition:absolute; \r\n");
      out.write("\tleft:0; \r\n");
      out.write("\theight:20; \r\n");
      out.write("\twidth:145px;\r\n");
      out.write("\tvisibility:hidden; \r\n");
      out.write("\tborder:2px solid black;\r\n");
      out.write("\tborder-style: solid; \r\n");
      out.write("\tborder-color: #000000;\r\n");
      out.write("\tbackground-color:#C3C9D4;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a.menu{font-family:arial; color: black; font-size: 11px; font-weight:bold; text-decoration: none;}\r\n");
      out.write("a.smenu{font-family:arial; color:black; font-size: 11px; font-weight:bold; text-decoration: none;}\r\n");
      out.write("-->\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<SCRIPT language=\"JAVASCRIPT\" src=\"../Resources_pages/jsUtil.js\"></SCRIPT>\r\n");
      out.write("<SCRIPT language=\"JAVASCRIPT\" src=\"../Resources_pages/Table1.js\"></SCRIPT> \r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("<SCRIPT>\r\n");
      out.write("document.oncontextmenu=new Function(\"return false;\");\r\n");
      out.write("<!--<span class=clickableSpan oncontextmenu=\"displayMenu(); return false\">   Right click here to open context menu</span>-->\r\n");
      out.write("\r\n");
      out.write("/* Variables declarations and Initializations*/\r\n");
      out.write("\t var myTable;\t\t\t\t\t\t\t// the table object that will be drawn for scheduling & adherence\r\n");
      out.write("\t var layer;\r\n");
      out.write("\t var rows = 1, cntRow = 0;\t\t\t\t// the number of rows in the table\r\n");
      out.write("\t var cols = 1, cntCol = 0;\t\t\t\t// the number of columns in the table\r\n");
      out.write("\t var myData ;\t\t\t\t\t\t\t// the data in each cell of the table\r\n");
      out.write("\t var cells;\r\n");
      out.write("\t var hoverHelpData;\r\n");
      out.write("\t var personalData;\t\t\t\t\t\t// table containing private data as: IP, first login, group name, etc..\r\n");
      out.write("\t var adherenceDetails;\t\t\t\t\t// table containing adherence details for each period\r\n");
      out.write("\t \r\n");
      out.write("\t var bhh;\t\t\t\t\t\t\t\t// tmp. variable indicating the begin hour value of the current cell\r\n");
      out.write("\t var bmm;\t\t\t\t\t\t\t\t// tmp. variable indicating the begin minute value\r\n");
      out.write("\t var ehh, emm;\t\t\t\t\t\t\t// tmp. variable indicating the end hour value, end minute value\r\n");
      out.write("\t var increment;\t\t\t\t\t\t\t// spacing between column in minutes\r\n");
      out.write("\t var agt_id;\r\n");
      out.write("\t var viewHTML;\t\t\t\t\t\t\t//the html code of the view \r\n");
      out.write("\t var allAgentScheduleData=new Array();    //Tab containing all schedule and adherence data received from CTI\r\n");
      out.write("\t var thisDayScheduleInfo=new Array();    //Tab containing only schedule info received from CTI for all agents\r\n");
      out.write("\t var nrow ;\r\n");
      out.write("\t var thetime = new Date();\r\n");
      out.write("\t var today=thetime.getYear()+\"/\"+(thetime.getMonth()+1)+\"/\"+thetime.getDate();\r\n");
      out.write("\t var firstLoad = true;\r\n");
      out.write("\t var lastZoomFactor = 0.5;\r\n");
      out.write("\t var adherenceValue, lglobaladherence ;\r\n");
      out.write("\t var rowSelected = 0;\r\n");
      out.write("\t var nreload = 0;\r\n");
      out.write("\t var beginTime, endTime, period; //window.top.main.rtop.bdate.value;\r\n");
      out.write("\t var starttime = normalizeString(QueryString('startTime'));\r\n");
      out.write("\t var endtime   = normalizeString(QueryString('endTime'));\r\n");
      out.write("\t period  = normalizeString(QueryString('spacing'));\r\n");
      out.write("\r\n");
      out.write("\t if(starttime != 'undefined' && starttime.length > 0) \t\r\n");
      out.write("\t\tbeginTime = starttime.substring(0,2)+starttime.substring(3);\r\n");
      out.write("\t else\r\n");
      out.write("\t\tbeginTime = \"0900\";\r\n");
      out.write("\t\r\n");
      out.write("\t if(endtime != 'undefined' && endtime.length > 0) \t\r\n");
      out.write("\t\tendTime = endtime.substring(0,2)+endtime.substring(3);\r\n");
      out.write("\t else\r\n");
      out.write("\t\tendTime = \"2100\";\r\n");
      out.write("\t\r\n");
      out.write("\t if(period.length > 0) \t\r\n");
      out.write("\t\tperiod = period.substring(0,2)+period.substring(3);\r\n");
      out.write("\t else\r\n");
      out.write("\t\tperiod = \"30\";\r\n");
      out.write(" \t//alert(beginTime+'..'+endTime+'..'+period)\r\n");
      out.write("\r\n");
      out.write("function setRowNum(numrows)\r\n");
      out.write("{\r\n");
      out.write("\t  rows = 2*parseInt(numrows,10) + 1;\r\n");
      out.write("\t  myData = new Array(rows);\r\n");
      out.write("\t  cells = new Array(rows);\r\n");
      out.write("\t  hoverHelpData = new Array(rows);\r\n");
      out.write("\t  personalData = new Array(rows);\r\n");
      out.write("\t  adherenceDetails\t= new Array(rows);\r\n");
      out.write("\t  cntRow = 0;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function createTable()\r\n");
      out.write("{\r\n");
      out.write("\t  myTable = new Table(rows,cols);\r\n");
      out.write("\t  myTable.enableHoverHelp(true,hoverHelpData);\r\n");
      out.write("\t  myTable.setTableData(myData);\r\n");
      out.write("\t  myTable.setCellData(cells);\r\n");
      out.write("\t  myTable.setTablePos(4,125);\r\n");
      out.write("\t  myTable.enableColumnHeaders(true);\r\n");
      out.write("\t  myTable.enableRowHeaders(true);\r\n");
      out.write("\t  myTable.setRowHeight(18);    //18\r\n");
      out.write("\t  myTable.setFirstRowHeight(30);\r\n");
      out.write("\t  myTable.setTableModelSchedule(true);\r\n");
      out.write("\t  myTable.setTableModelRta(true);\r\n");
      out.write("\t  myTable.enableCellSelection(false);\r\n");
      out.write("\t  myTable.enableRowSelection(true,\"lightgrey\");\r\n");
      out.write("\t  myTable.setCellColor(\"royalblue\",\"yellow\", \"skyblue\",\"green\", \"red\");\r\n");
      out.write("\t  myTable.setHightLightCellColor(\"darkblue\",\"gold\",\"powderblue\",\"lightgreen\",\"darkred\",\"powderblue\");\r\n");
      out.write("\t  myTable.paint3(viewHTML);\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function setPageTitle()\r\n");
      out.write("{\r\n");
      out.write("\twindow.top.document.title = \t\"Agent Schedule and Adherence Report\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function setColumNum()\r\n");
      out.write("{\r\n");
      out.write("\t  bhh = parseInt(beginTime.substring(0,2),10);\r\n");
      out.write("\t  bmm = parseInt(beginTime.substring(2,4),10);\r\n");
      out.write("\t  ehh = parseInt(endTime.substring(0,2),10);\r\n");
      out.write("\t  emm = parseInt(endTime.substring(2,4),10);\r\n");
      out.write("\t  increment =  parseInt(period,10);\r\n");
      out.write(" \t  var ncols = 0;\r\n");
      out.write("\t  for(i=bhh,j=bmm;i<ehh || j<=emm;j+=increment){\r\n");
      out.write("\t\tif(j>=60){\r\n");
      out.write("\t\t   j=j-60;\r\n");
      out.write("\t\t   i=i+1;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(String(j).length ==1)\r\n");
      out.write("\t\t   k=\"0\"+j;\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t   k=j;\r\n");
      out.write("\t\tncols = ncols+1;\r\n");
      out.write("\t   // document.write(\"<td width=\\\"100\\\" height=\\\"20\\\">\" +i+\":\"+k+\"</td>\");\r\n");
      out.write("\t }\r\n");
      out.write("    cols = ncols;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function setColumHeadersValue()\r\n");
      out.write("  {\r\n");
      out.write("\t   var colNum=0\r\n");
      out.write("\t   //Set array for row header data\r\n");
      out.write("\t   myData[0] = new Array(cols);\r\n");
      out.write("\t   hoverHelpData[0] = new Array(cols);\r\n");
      out.write("\t   cells[0]= new Array(cols);\r\n");
      out.write("\t   myData[0][0]=\" ");
      out.print(  pageadVData.getWord("Time hh:mm"));
      out.write("\";\n");
      out.write("\t   hoverHelpData[0][0]=\"\";\r\n");
      out.write("\t   cells[0][0]= \"\";\r\n");
      out.write("\t   personalData[0]=\"\";\r\n");
      out.write("\t   adherenceDetails[0]=\"\";\r\n");
      out.write("\t   for(i=bhh,j=bmm;i<ehh || j<=emm;j+=increment){\r\n");
      out.write("\t\t  colNum++;\r\n");
      out.write("\t\t  if(j>=60){\r\n");
      out.write("\t\t\t j=j-60;\r\n");
      out.write("\t\t\t i=i+1;\r\n");
      out.write("\t\t  }\r\n");
      out.write("\r\n");
      out.write("\t\tif(String(j).length ==1)\r\n");
      out.write("\t\t\t k=\"0\"+j;\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t\t k=j;\r\n");
      out.write("\t\tvalue = i+\":\"+k;\r\n");
      out.write("\t\tmyData[0][colNum]= value;\r\n");
      out.write("\t\thoverHelpData[0][colNum]=value;\r\n");
      out.write("\t\tcells[0][colNum] = value;\r\n");
      out.write("\t  }\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("   function generateRtaView()\r\n");
      out.write("   {\r\n");
      out.write("        viewHTML = \"<TABLE cellspacing=1px bgcolor=lightyellow>\";\r\n");
      out.write("    \tsetColumNum();\r\n");
      out.write("\t\t//Set the number of rows in the table\r\n");
      out.write("\t\tnrow = allAgentScheduleData.length;\r\n");
      out.write("\t\tif((nrow == 0) || (allAgentScheduleData[0].length==0)){\r\n");
      out.write("\t\t\twindow.top.main.rtop.refreshAgentAdherenceStats();\r\n");
      out.write("\t\t\tnrow = allAgentScheduleData.length;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tif(allAgentScheduleData.length == 0)\r\n");
      out.write("\t\t\tnrow = 0;\r\n");
      out.write("\t\tsetRowNum(nrow);\r\n");
      out.write("\t\tsetColumHeadersValue();\r\n");
      out.write("\t\tviewHTML += '<TR>';\r\n");
      out.write("\t\tfor(c=0;c < cols ; c++)\r\n");
      out.write("\t\t   viewHTML += \"<TD align='center' width=100 height=30 bgcolor=gray  title=\\\"\"+ hoverHelpData[0][c]+\"\\\">\"+myData[0][c]+\"</TD>\";\r\n");
      out.write("\t\tviewHTML += '</TR>';\r\n");
      out.write("\r\n");
      out.write("\t   var cnt=0,iter=0, n=0, nParam;       //counter for iteration\r\n");
      out.write("\t   var nb_elt = 0;\r\n");
      out.write("\t   var timeBlockData;                   //Data for this time block\r\n");
      out.write("\t   var agentDaySchedAdherence;          //all schedule and adherence data for an agent\r\n");
      out.write("\r\n");
      out.write("\t   var curAgtID, curAgtName='';         //the current agent ID and name\r\n");
      out.write("\t   var nbCells=0;\r\n");
      out.write("\t   var jsSchedData, arrayTimeBlock;\r\n");
      out.write("\t   var startTime,stopTime,activity_type,adherenceData;\r\n");
      out.write("\t   var nNoAdh = 0, nAdh = 0;\r\n");
      out.write("\t   lglobaladherence = 0;\r\n");
      out.write("\r\n");
      out.write("\t   if(rows > 1 ){\r\n");
      out.write("\t\t  //Loop for every agent\r\n");
      out.write("\t\t  for(cnt = 0;cnt < allAgentScheduleData.length;cnt++){\r\n");
      out.write("\t\t\t //Get the adherence and schedule data for this agent\r\n");
      out.write("\t\t\t agentDaySchedAdherence = allAgentScheduleData[cnt];\r\n");
      out.write("\r\n");
      out.write("\t\t\t //Add a new row to myData for this agent schedule\r\n");
      out.write("\t\t\t cntRow++;\r\n");
      out.write("\t\t\t myData[cntRow] = new Array(cols);\r\n");
      out.write("\t\t\t hoverHelpData[cntRow] = new Array(cols);\r\n");
      out.write("\t\t\t cells[cntRow] = new Array(cols);\r\n");
      out.write("\t\t\t //Add a new row to myData for this agent adherence\r\n");
      out.write("\t\t\t myData[cntRow+1] = new Array(cols);\r\n");
      out.write("\t\t\t hoverHelpData[cntRow+1] = new Array(cols);\r\n");
      out.write("\t\t\t cells[cntRow+1] = new Array(cols);\r\n");
      out.write("\t\t\t for (nc=0;nc<cols;nc++) {\r\n");
      out.write("\t\t\t \tcells[cntRow][nc] = \"\";\r\n");
      out.write("\t\t\t\tcells[cntRow+1][nc] = \"\";\r\n");
      out.write("\t\t\t\tif ((cntRow+1) %2 == 0 && (cntRow+1)!= 0)\r\n");
      out.write("\t\t\t\t   {\r\n");
      out.write("\t\t\t\t\t  myData[cntRow][nc] = \"\";\r\n");
      out.write("\t\t\t\t   }\r\n");
      out.write("\t\t\t  }\r\n");
      out.write("\r\n");
      out.write("\t\t\t //Set current agent ID and Fill the new row with schedule data :\r\n");
      out.write("\t\t\t //1047^0-17:2,18-29:5,30-30:3,31-31:6,32-41:5^0-26:2,27-27:0|\r\n");
      out.write("\t\t\t var jsAgentData = agentDaySchedAdherence + \"\";\r\n");
      out.write("\t\t\t arrayAgentData\t= jsAgentData .split(\"^\");\r\n");
      out.write("\t\t\t var colIndex = 0;\r\n");
      out.write("\t\t\t for(nElt = 0; nElt < arrayAgentData.length; nElt++)\r\n");
      out.write("\t\t\t  {\r\n");
      out.write("\t\t\t  \t\t  nbCells=0;\r\n");
      out.write("\t\t\t\t\t  if(nElt == 0){\r\n");
      out.write("\t\t\t\t\t\t\tcurAgtID = arrayAgentData[0];\r\n");
      out.write("\t\t\t\t\t\t\tif(curAgtID == null)\r\n");
      out.write("\t\t\t\t\t\t\t   curAgtID = '';\r\n");
      out.write("\t\t\t\t\t\t\t//if(curAgtID.length > 0 && window.top.comm.myApplet != null)\r\n");
      out.write("\t\t\t\t\t\t\t\t//curAgtName = window.top.comm.myApplet.getAgentFullName(curAgtID);\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\tif(curAgtName == null)\r\n");
      out.write("\t\t\t\t\t\t\t\tcurAgtName = '';\r\n");
      out.write("\t\t\t\t\t\t\t//Set agent id value for the first cell of the row\r\n");
      out.write("\t\t\t\t\t\t\tmyData[cntRow][0]= curAgtID;\r\n");
      out.write("\t\t\t\t\t\t\thoverHelpData[cntRow][0]=curAgtID+'['+curAgtName+']' ;\r\n");
      out.write("\t\t\t\t\t\t\thoverHelpData[cntRow+1][0]=curAgtID+'['+curAgtName+']' ;\r\n");
      out.write("\t\t\t\t\t\t\tcells[cntRow][0]= curAgtID;\r\n");
      out.write("\t\t\t\t\t\t\tcells[cntRow+1][0]= curAgtID;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t  }\r\n");
      out.write("\t\t\t\t\t  else if(nElt ==1){\r\n");
      out.write("\t\t\t\t\t  \t\tadherenceDetails[cntRow] = arrayAgentData[nElt] + \"\";\r\n");
      out.write("\t\t\t\t\t\t\tadherenceDetails[cntRow+1] = arrayAgentData[nElt] + \"\";\r\n");
      out.write("                            lglobaladherence += parseFloat(arrayAgentData[nElt]);\r\n");
      out.write("\t\t\t\t\t  }else if (nElt ==2){\r\n");
      out.write("\t\t\t\t\t  \t\tpersonalData[cntRow] = arrayAgentData[nElt] + \"\";\r\n");
      out.write("\t\t\t\t\t\t\tpersonalData[cntRow+1] = arrayAgentData[nElt] + \"\";\r\n");
      out.write("\t\t\t\t\t  }\r\n");
      out.write("\t\t\t\t\t  else {\r\n");
      out.write("\t\t\t\t\t\t\t   nbCells=1;\r\n");
      out.write("\t\t\t\t\t  \t\t   if(nElt ==3)\r\n");
      out.write("\t\t\t\t\t  \t\t   \t\tviewHTML += \"<TR id=\"+cntRow+\">\";\r\n");
      out.write("\t\t\t\t\t\t\t\telse\r\n");
      out.write("\t\t\t\t\t\t\t\t   viewHTML += \"<TR id=\"+(parseInt(cntRow)+1)+\">\";\r\n");
      out.write("\t\t\t\t\t\t\t   //viewHTML += '<TD width='+this.columnWidth[0]+' rowspan=2 height='+this.rowHeight+' bgcolor='+this.headerBackgroundColor+'>'+curAgtID+'</TD>';\r\n");
      out.write("\t\t\t\t\t\t\t   if(nElt ==3)\r\n");
      out.write("   \t\t\t\t\t\t\t      viewHTML += \"<TD align='center' id='\"+cntRow+\"-0' width=100 rowspan=2 height=18 bgcolor=gray title=\\\"\"+ hoverHelpData[cntRow][0]+\"\\\" onMouseDown=\\\"highLightRow('\"+cntRow+\"')\\\">\"+curAgtID+\"</TD>\";\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t   jsSchedData = arrayAgentData[nElt] + \"\";   //we got a schedule info : 0-17:2,18-29:5,30-30:3,31-31:6,32-41:5\r\n");
      out.write("\t\t\t\t\t\t\t   arrayTimeBlock = jsSchedData.split(\",\");\r\n");
      out.write("\t\t\t\t\t\t\t   //nParam = arrayTimeBlock.length;\r\n");
      out.write("\t\t\t\t\t\t\t   var viewUnit=\"\";\r\n");
      out.write("\t\t\t\t\t\t\t   var valPos = 0, stPos=0, ePos=0, cellval=2, ccolor=\"\";\r\n");
      out.write("\t\t\t\t\t\t\t   var stInd=0, endInd=0 ;\r\n");
      out.write("\t\t\t\t\t\t\t   for(k=0; k < arrayTimeBlock.length; k++)\r\n");
      out.write("\t\t\t\t\t\t\t   {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t viewUnit = arrayTimeBlock[k];\r\n");
      out.write("\t\t\t\t\t\t\t\t\t valPos  = \tviewUnit.indexOf(':');\r\n");
      out.write("\t\t\t\t\t\t\t\t\t sepPos  =  viewUnit.indexOf('-');\r\n");
      out.write("\t\t\t\t\t\t\t\t\t stPos   = \tparseInt(viewUnit.substring(0,sepPos), 10);\r\n");
      out.write("\t\t\t\t\t\t\t\t\t ePos    = \tparseInt(viewUnit.substring(sepPos+1,valPos), 10);\r\n");
      out.write("\t\t\t\t\t\t\t\t\t cellval =  parseInt(viewUnit.substring(valPos+1), 10);\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t //Fill cell between column stPos and ePos with cellval\r\n");
      out.write("\t\t\t\t\t\t\t\t\t for(cpos=stPos; cpos <= ePos; cpos++){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t \tif(nElt == 3){     //we got schedule info\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   if(cellval == 6)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   \t\tcellval = 10;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tif(cellval == 2)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tcellval=\"\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   myData[cntRow][cpos+1] = cellval;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   hoverHelpData[cntRow][cpos+1]=curAgtID+'['+curAgtName+'] ' ;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   //alert('..cellval..'+ cellval + '..cntRow..'+cntRow+'..cpos+1..'+cpos+1)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t }\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\telse if(nElt == 4){ //we got adherence info\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\thoverHelpData[cntRow+1][cpos+1]=curAgtID+'['+curAgtName+']';\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tvar oops0=\" ");
      out.print(  pageadVData.getWord("was LOGGED IN.** Should be logged in during this period"));
      out.write("\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tvar oops1=\"");
      out.print(  pageadVData.getWord("was LOGGED IN.** Should be logged in during this period"));
      out.write("\";\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   if(cellval == 0 || cellval == 4)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   \t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tif(cellval == 0)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\thoverHelpData[cntRow+1][cpos+1] = curAgtID+ ' [\\\"+curAgtName+\\\"] '+ oops0.replace(\"**\",\"\\n\");\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\telse\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\thoverHelpData[cntRow+1][cpos+1] = curAgtID+ ' [\\\"+curAgtName+\\\"] '+ oops1.replace(\"**\",\"\\n\");\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tcellval = 101;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tnNoAdh ++;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   else if(cellval == 1)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   \t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tcellval = 100;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tnAdh++;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   /*else\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   \t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tcellval = \"\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t  \tnAdh++;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t}*/\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   if(cellval != 2)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t   \t\tmyData[cntRow+1][cpos+1] = cellval;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t }\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t//alert('cntRow..' +cntRow+'..cpos..'+cpos+'..cellval'+cellval)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t }//end for(cpos..)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t //viewHTML\r\n");
      out.write("\t\t\t\t\t\t\t\t\t if(cellval == 100)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t \tccolor = \"green\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t else if(cellval == 3)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t \tccolor = \"yellow\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t else if(cellval == 4 || cellval==101)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t \tccolor = \"red\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t else if (cellval == 5)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t \tccolor = \"blue\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t else if (cellval == 6 || cellval == 10)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t    ccolor = \"skyblue\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t else\r\n");
      out.write("\t\t\t\t\t\t\t\t\t \tccolor = \"lightyellow\";\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t var cid= String((nElt==3?cntRow:cntRow+1))+'-'+String(k+1);\r\n");
      out.write("\t\t\t\t\t\t\t\t\t var lcolspan = ePos - stPos +1;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t var cwidth = lcolspan*75;\r\n");
      out.write("\t\t  \t\t\t\t\t\t\t viewHTML +=  \"<TD id=\"+cid+\" colspan=\"+lcolspan+\" height=18 width=\"+cwidth+\" bgcolor=\"+ccolor+\" title=\\\"\"+ hoverHelpData[(nElt==3?cntRow:cntRow+1)][stPos+1]+ \"\\\" onMouseDown=\\\"highLightRow('\"+(nElt==3?cntRow:cntRow+1)+\"')\\\"></TD>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t cells[(nElt==3?cntRow:cntRow+1)][nbCells++] = cellval;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t \t  }//fin du for(k..)\r\n");
      out.write("\t\t\t\t\t\t\t  \r\n");
      out.write("\t\t\t\t\t\t\t viewHTML += \"</TR>\";\r\n");
      out.write("\t\t\t\t\t \t}//fin else\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t}// fin du for(nElt...)\r\n");
      out.write("\r\n");
      out.write("\t\t\t   //Go to the next row, this row will show the adherence data\r\n");
      out.write("\t\t\t   //Leave the row for adherence data\r\n");
      out.write("\t\t\t   cntRow++;\r\n");
      out.write("\t\t  } //fin du for(cnt..)\r\n");
      out.write("\t   } // fin du if(nrow > 1 )\r\n");
      out.write("\t   else{\r\n");
      out.write("\t   \tviewHTML += '<TR>';\r\n");
      out.write("\r\n");
      out.write("\t\t\t    viewHTML += \"<TD align='justify' height=50   colspan=\"+cols+\"><font face='Arial, Helvetica, sans-serif' size='3' color='#ff0000'><b> <marquee WIDTH=100% direction=right behavior=alternate>");
      out.print( pageadVData.getWord("No schedule data found in database."));
      out.write("</marquee></b></font></TD>\";\n");
      out.write("\r\n");
      out.write("\t\tviewHTML += '</TR>';\r\n");
      out.write("\r\n");
      out.write("\t   }\r\n");
      out.write("\t   viewHTML += \"</TABLE>\";\r\n");
      out.write("\t   \r\n");
      out.write("\t  /*if(allAgentScheduleData.length > 1)\r\n");
      out.write("\t\t\tlglobaladherence = lglobaladherence/(allAgentScheduleData.length-1);\r\n");
      out.write("      else\r\n");
      out.write("\t\t\tlglobaladherence ='100';\r\n");
      out.write("\t  adherenceValue=new String(lglobaladherence);\r\n");
      out.write("\t  if(adherenceValue.indexOf('.') > 0)\r\n");
      out.write("\t   \t adherenceValue = adherenceValue.substring(0,adherenceValue.indexOf('.')+2);\r\n");
      out.write("\t   adherenceValue=adherenceValue+' %';\r\n");
      out.write("\t   adherence.value = adherenceValue*/\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" function drawHeader()\r\n");
      out.write("\t{\r\n");
      out.write("\t\theaderHTML = \"<TABLE cellspacing=1px bgcolor=lightyellow>\";\r\n");
      out.write("\r\n");
      out.write("\t\theaderHTML += '<TR>';\r\n");
      out.write("\t\tfor(c=0;c < cols ; c++)\r\n");
      out.write("\t\t   headerHTML += \"<TD align=center  width=100 height=30 bgcolor=gray  title=\\\"\"+ hoverHelpData[0][c]+\"\\\">\"+myData[0][c]+\"</TD>\";\r\n");
      out.write("\t\theaderHTML += '</TR>';\r\n");
      out.write("\r\n");
      out.write("\t\theaderHTML += \"</TABLE>\";\r\n");
      out.write("\t   var oElem = document.getElementById('divRtaHead');\r\n");
      out.write("  \t   oElem.innerHTML = headerHTML;\r\n");
      out.write("\t   oElem.style.height = 30;\r\n");
      out.write("\t   if(firstLoad == true)\r\n");
      out.write("\t   \t  oElem.style.top = 124;\r\n");
      out.write("\t   else{\r\n");
      out.write("\t         //var sommet= parseInt(oElem.style.top.substring(0,oElem.style.top.length-2));\r\n");
      out.write("\t\t\t if(document.body.scrollTop > 96){\r\n");
      out.write("             \tvar sommet = document.body.scrollTop;\r\n");
      out.write("\t         \toElem.style.top = sommet;\r\n");
      out.write("\t\t\t \toElem.style.visibility = 'visible';\r\n");
      out.write("\t\t\t }\r\n");
      out.write("\r\n");
      out.write("\t\t  }\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction updateHeaderBarPosition()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar oElem = document.getElementById('divRtaHead');\r\n");
      out.write("    \tif(document.body.scrollTop > 96) {\r\n");
      out.write("\t        oElem.style.top = document.body.scrollTop;\r\n");
      out.write("\t\t\toElem.style.visibility = 'visible';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse{\r\n");
      out.write("\t\t  //    oElem.style.visibility = 'hidden';\r\n");
      out.write("\t\t     oElem.style.top = 96;\r\n");
      out.write("\t\t  }\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction refreshRtaView()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tnreload++;\r\n");
      out.write("\t\t//refreshConfigData() ;\r\n");
      out.write("\t\tgenerateRtaView();\r\n");
      out.write("\t\t//drawHeader();\r\n");
      out.write("\t\tif(firstLoad == true)\r\n");
      out.write("\t\t\tcreateTable();\r\n");
      out.write("\t  /*else\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tmyTable.setTableData(myData);\t\t\t \r\n");
      out.write("\t\t\tmyTable.paint3(viewHTML);\r\n");
      out.write("\t\t\tmyTable.enableHoverHelp(true,hoverHelpData);\r\n");
      out.write("\t\t}*/\r\n");
      out.write("\r\n");
      out.write("\t\tsetZoom(lastZoomFactor);\r\n");
      out.write(" \t}\r\n");
      out.write("\r\n");
      out.write("\tfunction zoomIn()\r\n");
      out.write("\t{\r\n");
      out.write("\r\n");
      out.write("\t\tif(document.getElementById('divRtaTab').style.zoom == \"\")\r\n");
      out.write("\t\t\tdocument.getElementById('divRtaTab').style.zoom = 1.0;\r\n");
      out.write("\r\n");
      out.write("\t\tif(document.getElementById('divRtaTab').style.zoom <= 1.50)\r\n");
      out.write("\t\t\tdocument.getElementById('divRtaTab').style.zoom = parseFloat(document.getElementById('divRtaTab').style.zoom) + 0.25;\r\n");
      out.write("\t\t\t//document.body.style.zoom = 1.4;\r\n");
      out.write("\t\tlastZoomFactor = document.getElementById('divRtaTab').style.zoom;\r\n");
      out.write("\t    document.getElementById('divRtaHead').style.zoom=document.getElementById('divRtaTab').style.zoom;\r\n");
      out.write("\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction zoomOut()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(document.getElementById('divRtaTab').style.zoom == \"\")\r\n");
      out.write("\t\t\tdocument.getElementById('divRtaTab').style.zoom = 1.0;\r\n");
      out.write("\t\tif(document.getElementById('divRtaTab').style.zoom >= 0.30)\r\n");
      out.write("\t\t\tdocument.getElementById('divRtaTab').style.zoom = document.getElementById('divRtaTab').style.zoom - 0.20;\r\n");
      out.write("\r\n");
      out.write("\t\tlastZoomFactor = document.getElementById('divRtaTab').style.zoom;\r\n");
      out.write("\t\t\t//document.body.style.zoom = 0.5;\r\n");
      out.write("\t    document.getElementById('divRtaHead').style.zoom=document.getElementById('divRtaTab').style.zoom;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction zoomFit()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.getElementById('divRtaTab').style.zoom = 0.5;\r\n");
      out.write("\t\tlastZoomFactor = document.getElementById('divRtaTab').style.zoom;\r\n");
      out.write("\t\tdocument.getElementById('divRtaHead').style.zoom=document.getElementById('divRtaTab').style.zoom;\r\n");
      out.write("\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction setZoom(value)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.getElementById('divRtaTab').style.zoom = parseFloat(value);\r\n");
      out.write("\t    document.getElementById('divRtaHead').style.zoom=document.getElementById('divRtaTab').style.zoom;\r\n");
      out.write("\t}\r\n");
      out.write("  \r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      aheevaManager.schedule.beanAgentSchedule beanScheduler = null;
      synchronized (request) {
        beanScheduler = (aheevaManager.schedule.beanAgentSchedule) _jspx_page_context.getAttribute("beanScheduler", PageContext.REQUEST_SCOPE);
        if (beanScheduler == null){
          beanScheduler = new aheevaManager.schedule.beanAgentSchedule();
          _jspx_page_context.setAttribute("beanScheduler", beanScheduler, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body  class=\"grey\" >  \r\n");

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


      out.write("\r\n");
      out.write("\r\n");
      out.write("<table width=\"947\" border=\"0\" align=\"center\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"50\"  class=\"reportsID\"></td>\r\n");
      out.write("    <td width=\"350\" valign=\"top\" ><font size=4><b>");
      out.print(pageadVData.getWord("Agent"));
      out.write("\t\n");
      out.write("        ");
 
			if (viewType.compareTo("Daily") ==0){
				out.write(pageadVData.getWord("Daily"));
		   	}//out.write(viewType);
			else if (viewType.compareTo("Monthly") ==0){
				out.write(pageadVData.getWord("Monthly"));
			}
		
      out.write("\r\n");
      out.write("\t\t");
      out.print(pageadVData.getWord("Adherence report"));
      out.write("</b></font>\n");
      out.write("\t");

		String agtName = beanScheduler.getAgentFullName(agentId);
		 out.write("<br><br><b> <font color='black'>"+pageadVData.getWord("Name")+": "+agtName+" ["+ agentId+ "] <br><br> ");
		if (viewType.compareTo("Daily") ==0){
			if(startDate.compareTo(endDate) == 0)
				out.write(pageadVData.getWord("Day")+": "+ startDate);
			else
			 	out.write(pageadVData.getWord("Period") +": "+pageadVData.getWord("From")+ startDate + " to " + endDate);
		} else if (viewType.compareTo("Monthly") ==0){
			out.write(" Month:"+startMonth+"/"+startYear);
		} 
		out.write(" </b></font>"); 
	
      out.write("\r\n");
      out.write("     </td>\r\n");
      out.write("    <td width=\"31\" valign=\"top\"  class=\"reportsID\">&nbsp;</td>\r\n");
      out.write("    <td width=\"438\" valign=\"top\"  class=\"reportsID\"><table width=\"373\" border=\"0\">\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td height=\"4\" bgcolor=\"#3333FF\">&nbsp;</td>\r\n");
      out.write("        <td >");
      out.print(pageadVData.getWord("Work period"));
      out.write("</td>\n");
      out.write("        <td bgcolor=\"#339933\" >&nbsp;</td>\r\n");
      out.write("        <td >");
      out.print(pageadVData.getWord("Adherence value"));
      out.write(':');
      out.print(pageadVData.getWord("yes"));
      out.write(" </td>\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td width=\"11\" height=\"4\" bgcolor=\"#FFFF00\">&nbsp;</td>\r\n");
      out.write("        <td width=\"183\" >");
      out.print(pageadVData.getWord("Break/Meal period"));
      out.write(" </td>\n");
      out.write("        <td width=\"11\" bgcolor=\"#FF0000\" >&nbsp;</td>\r\n");
      out.write("        <td width=\"150\" >");
      out.print(pageadVData.getWord("Adherence value"));
      out.write(':');
      out.print(pageadVData.getWord("no"));
      out.write("</td>\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td height=\"4\" bgcolor=\"#3399CC\">&nbsp;</td>\r\n");
      out.write("        <td >");
      out.print(pageadVData.getWord("Gap between work and break"));
      out.write("</td>\n");
      out.write("        <td >&nbsp;</td>\r\n");
      out.write("        <td >&nbsp;</td>\r\n");
      out.write("      </tr> \r\n");
      out.write("    </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr align=\"center\"> \r\n");
      out.write("    <td  height=25 bgcolor=\"#FFFFFF\">&nbsp;</td>\r\n");
      out.write("  \t<td  valign=middle><div align=\"justify\" class=\"reportsID\"><b>");
      out.print(pageadVData.getWord("Adherence"));
      out.write(":  \n");
      out.write("        ");
	 String tmp = Double.toString(beanScheduler.adherenceValue);
							int index = tmp.indexOf(".");
							if(index >0 && tmp.substring(index).length() > 2)
								tmp = tmp.substring(0,index) + tmp.substring(index,index+2);
							else
								tmp = tmp + "0";	
							out.write(tmp+"%");	 
						
      out.write(" \r\n");
      out.write("    </b></div></td> \r\n");
      out.write("\t<td>&nbsp;</td>\r\n");
      out.write("\t<td align=\"left\"><table><tr><td><img id=\"zin\" src=\"../img/stock_zoom_in.png\" alt=\"Zoom in\" width=\"24\" height=\"24\" onClick=\"zoomIn()\" onMouseOver=\"border=1; width=23; height=23; \" onMouseOut=\"border=0; width=24; height=24;\" >&nbsp;&nbsp;&nbsp;</td> <td> <img src=\"../img/stock_zoom_out.png\"  alt=\"Zoom out\" width=\"24\" height=\"24\" onClick=\"zoomOut()\" onMouseOver=\"border=1; width=23; height=23;\"   onMouseOut=\"border=0; width=24; height=24; \">&nbsp;&nbsp;&nbsp;</td><td><img src=\"../img/stock_zoom_fit.png\" width=\"24\" height=\"24\" alt=\"Remove zoom\" onClick=\"zoomFit()\" onMouseOver=\"border=1; width=23; height=23;\" onMouseOut=\"border=0; width=24; height=24; \"></td></tr></table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write(" <DIV id=\"divRtaHead\"  style=\"position:absolute; visibility:visible\" > </DIV>\r\n");
      out.write("<DIV ID=\"divRtaTab\" class=\"rtaTableClass\"></DIV> \r\n");
      out.write("\r\n");
      out.write(" ");

  int adhIndice = 0, nb_rec_elt=0;
  cnt=0;
  int curWorkSchedDay = 0,curAdherenceDay=0;  
    for(cnt = 0;cnt < beanScheduler.m_schedDailyDetails.size();cnt++){
          beanWorkScheduleDetails this_day_schedule_data = ((beanWorkScheduleDetails)(beanScheduler.m_schedDailyDetails.elementAt(cnt)));
  
      out.write("\r\n");
      out.write("  <script>\r\n");
      out.write("\t   allAgentScheduleData[allAgentScheduleData.length]= '");
out.write(this_day_schedule_data.schedAdhDetails);
      out.write("'; \r\n");
      out.write("\t   //alert(allAgentScheduleData[allAgentScheduleData.length-1])\r\n");
      out.write("\t  //allAgentScheduleData[0]='4/4^9^9^0-5:5,6-6:3,7-7:6,8-17:5,18-20:2,21-32:5,33-33:3,34-34:6,35-41:5^0-5:0,6-6:1,7-17:0,18-20:2,21-32:0,33-33:1,34-41:0';\r\n");
      out.write("\t  //allAgentScheduleData[1]='4/5^9^9^0-5:5,6-6:3,7-7:6,8-17:5,18-20:2,21-32:5,33-33:3,34-34:6,35-41:5^0-3:1,4-4:0,5-5:1,6-7:0,8-10:1,11-11:0,12-12:1,13-13:0,14-16:1,17-19:0,20-20:2,21-22:0,23-29:1,30-34:0,35-39:1,40-41:0'; \r\n");
      out.write("  </script>\r\n");
      out.write(" ");
  
   } // end For 
 
      out.write("\r\n");
      out.write("  <script>\r\n");
      out.write(" \t refreshRtaView();\r\n");
      out.write("  </script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 pageadVData.closeConnection(); 
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
