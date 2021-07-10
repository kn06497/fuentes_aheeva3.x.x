<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<head>
<title>AheevaCCS - Line Usage Details Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		auto;
	/*width:      550px;*/
}

html, body { 
	background:	#E1F4FF;
}

form {
	margin:		40px;
	padding:	0;
}

/* over ride styles from webfxlayout */

body {
	margin:		10px;
	width:		auto;
	height:		auto;
}

.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}

.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
}

.dynamic-tab-pane-control a:hover {
	background: transparent;
}

.imgControl {
	top: 1;
	position:		relative;
}
</style>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));

</script>
<!---
<jsp:useBean id="beanGroupSummary" scope="request" class="aheevaManager.reports.beanSummaryReport" />
--->
</head>
<body>

<%
	String language =request.getParameter("lang");
	String startingDateDaily = request.getParameter("startingDateDaily");
	String endingDateDaily = request.getParameter("endingDateDaily");
	//String[] tabObj =null;
    //StringTokenizer tok = null, tokGrp =null;
   
	String startingDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
	String endingDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) +" 23:59:59";
	String from ="";
%>

	<table width="100%" cellpadding="0" cellspacing="0" align="center">
	<tr valign="top">
		<td width="25%" align="right">
			<button type="button" style="border:none; background:none; cursor:hand;" onClick="window.open('printLineReports.jsp?startingDateDaily=<%out.write(startingDateDaily) ;%>&endingDateDaily=<%out.write(endingDateDaily) ; %>&lang=<%out.write(language); %>')"><img src="../img/printer.gif" border="0"></button>
		</tr>
		</table>

<div class="tab-pane" id="tabPane1">	
<form name="lineReports">
<div class="tab-page" id="tabPage1">

<fieldset>

	<table width="100%" cellpadding="0" cellspacing="0" align="center">
	
		</td>
		<tr><td width="100%" align="center"><table width="70%" align="center"><tr><td height="20"></td></tr>
		<tr><td width="100%" align="center"><b><% out.write("<script>document.write(MultiArray[\"Line usage details\"][lang])</script>");  %></b></td>
				</tr>				
	</table>		
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="center"> 
						<b>
							<% out.write("<script>document.write(MultiArray[\"From\"][lang])</script>"); %>
							&nbsp;&nbsp; <%	
							out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							%>&nbsp; <%
							out.write("<script>document.write(MultiArray[\"To\"][lang])</script>");
							%>&nbsp; <%
							out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							%>
						</b>					
					</td>
				</tr>			
			</table>		
		</td>
	</tr>
	<tr><td height="20"></td></tr>
	<% 	//beanManagerData pageData = new beanManagerData();
		String query = "SELECT DATE_FORMAT(EVENT_TIME, '%Y-%m-%d %H:00:00') AS DATE_HOUR, MAX(TOTAL_USED_LINES) AS PEAK_USED, AVALAIBLE_LINES";
		query += " FROM(SELECT EVENT_TIME, SUM(NB_LINES_USED_GLOBAL) AS TOTAL_USED_LINES, SUM(IF(TOTAL_LINES_AVAILABLE >= 0, TOTAL_LINES_AVAILABLE, 0)) AS AVALAIBLE_LINES FROM (";
		query += "SELECT EVENT_TIME, SERVER_NAME, NB_LINES_USED_GLOBAL, TOTAL_LINES_AVAILABLE FROM datamart_line_status";
		query += " WHERE event_time BETWEEN '"+startingDate+"' and '" +endingDate + "'";
		query += " GROUP BY EVENT_TIME,SERVER_NAME) BY_SERVER GROUP BY EVENT_TIME) BY_HOUR GROUP BY DATE_FORMAT(EVENT_TIME, '%Y-%m-%d %H:00:00')" ;
		
		DataSource m_ds = null;
		try {
      		Context init = new InitialContext();
      		Context ctx = (Context) init.lookup("java:comp/env");
      		if (ctx == null) {
        	throw new Exception("Line report - No Context");
     	 	}
     	 	m_ds = (DataSource) ctx.lookup("jdbc/aheevaccs_report");
      		if (m_ds != null) {
        		System.out.println("Line report ---Got Context");
      		}      
    	}
    	catch (Exception e) {
      		e.printStackTrace();
    	}//good up to here
		
		java.sql.Statement stat = null;
    	java.sql.ResultSet rs =null;
		Connection conn = null;
	%>
	<tr>
	 
	  <td width="100%" align="center"><table  width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
	  	<tr class="reportsForecastReport" height="25" bgcolor="#FFECF5">
	  	<td align="center" ><% out.write("<script>document.write(MultiArray[\"Date & Time\"][lang])</script>");%></td>
        <td  align="center"><% out.write("<script>document.write(MultiArray[\"Peak within the hour\"][lang])</script>");%></td>
		<td  align="center"><% out.write("<script>document.write(MultiArray[\"Number of available lines\"][lang])</script>");%></script></td>	
		</tr>		   	 
	  <%
	  try{
			conn = m_ds.getConnection();
      		stat = conn.createStatement();
			rs = stat.executeQuery(query);
			//if(rs != null)
				//System.out.println("Line report ---------rs not null");
			int i =0;
	 		while(rs.next()){
	  %>
	  	    	
	  <tr <% if(i%2 == 0) out.write("class=reportsRowPair");
								else out.write("class=reportsRowUnPair");%>>
	  	  <td  align="center"><%out.write( rs.getString(1) );%></td>
	  	  <td  align="center"><%out.write( rs.getString(2) );%></td>
	  	  <td  align="center"><%out.write( rs.getString(3) );%></td>
	  </tr>
	  
	  <% 	i++;
	  	 }// while(rs.next())
	  %>	  
		</table>
   </tr>
	
</table>

<%
	  rs.close();
      rs = null;
      stat.close();
      stat = null;
      conn.close();
      conn = null;
	  }//try
	  catch (Exception ee) {
	  	System.out.println("line report -----error");
      	ee.printStackTrace();
      }
	 finally {
       try {
         if (stat != null) {
           stat.close();
         }
         if (conn != null) {
           conn.close();
         }
       }
       catch (Exception e) {
         e.printStackTrace();
       }
     }//finally 
%>
	
</fieldset>	
</div>
</form>
</div>
</body>
</html>

