<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>
<jsp:useBean id="beanAgentPerf" scope="request" class="aheevaManager.reports.beanAgentPerformanceReport" />
<body>
<%
    long tLoginTime = 0, tContacts = 0, tRContacts = 0, tNbSales = 0, nb=0,tNbNoSales = 0, tNbCallbacks = 0;
    double tNbSalesPerHour=0.0, tPercentClosed=0.0,tNetConvRate=0.0, tNbContactsPerHour =0.0;
    beanAgentPerformanceDetails r=null;
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_year_yearly = request.getParameter("starting_year_yearly");
    String ending_year_yearly = request.getParameter("ending_year_yearly");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String agents       = request.getParameter("objects");
    String tmpCamp = "", sRet="";
    StringTokenizer tok = null, tokn = null;
    if(agents != null){
        tok = new java.util.StringTokenizer(agents,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    String startingDate="", endingDate="";
    if (reportType.compareTo("Daily") ==0){
			startingDate = startingDateDaily.substring(6)+"/"+ startingDateDaily.substring(0,2)+"/"+startingDateDaily.substring(3,5) + " 00:01:00" ;
			endingDate = endingDateDaily.substring(6)+"/"+ endingDateDaily.substring(0,2)+"/"+endingDateDaily.substring(3,5) + " 00:01:00" ;
    } else if (reportType.compareTo("Monthly") ==0){
			startingDate = starting_year_monthly + "/"+ starting_month_monthly+ "/"+ "01" + " 00:01:00" ;
			endingDate = ending_year_monthly+ "/"+ ending_month_monthly + "/01"+ " 00:01:00" ;					
    } else if (reportType.compareTo("Yearly") ==0){
			startingDate=starting_year_yearly + "/01/01" + " 00:01:00" ;
			endingDate=ending_year_yearly + "/01/01"+ " 00:01:00" ;
    }

%>
<p align="center"><font size=4><b><script>document.write(MultiArray["Agent performance report"][lang])</script>  </b></font><br><br></p>

 

<%
    int numObjects = tok.countTokens();
    for( int k = 0; k <numObjects; k++ ) {
        String agentId = tok.nextToken();
        System.out.println("Agent : " + agentId);
        // build stats for this agent group
%>
<table width="480" border="0" align="center">
  <tr>
    <td   class="reportsID"><div align="center"><b><script>document.write(MultiArray["Agent performance"][lang])</script>
        <%out.write(reportType);%>
        <script>document.write(MultiArray["Report"][lang])</script>  &nbsp;  <script>document.write(MultiArray["From"][lang])</script> :
        <%
		if (reportType.compareTo("Daily") ==0){
			out.write(startingDateDaily);
		} else if (reportType.compareTo("Monthly") ==0){
			out.write(starting_month_monthly+"/"+starting_year_monthly);
		} else if (reportType.compareTo("Yearly") ==0){
			out.write(starting_year_yearly);
		}
		%>
         <script>document.write(MultiArray["To"][lang])</script>
        <%
		if (reportType.compareTo("Daily") ==0){
			out.write(endingDateDaily);
		} else if (reportType.compareTo("Monthly") ==0){
			out.write(ending_month_monthly+"/"+ending_year_monthly);
		} else if (reportType.compareTo("Yearly") ==0){
			out.write(ending_year_yearly);
		}
		%>
        </b></div></td>
  </tr>
</table>
<p class="reportsID" align="center"> <b><%out.write(beanAgentPerf.getAgentFullName(agentId));%> [<%out.write(agentId);%>]</b></p>
<p class="reportsID"> </p>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="850" id="AutoNumber1">
  <tr class="reportsTab">

    <td width="70" align="center"> <b><script>document.write(MultiArray["Group name"][lang])</script></b> </td>

<%
   if(reportType.compareTo("Monthly") == 0) {
%>
    <td width="50"    align="center"> <b> <script>document.write(MultiArray["Call time"][lang])</script> &nbsp; (<script>document.write(MultiArray["MM-AA"][lang])</script>) </b> </td>
<%
   }else if (reportType.compareTo("Yearly") == 0) {
%>
    <td width="50"    align="center"> <b> <script>document.write(MultiArray["Call time"][lang])</script> &nbsp; (<script>document.write(MultiArray["YY"][lang])</script>) </b> </td>
<%
   }else if(reportType.compareTo("Daily")== 0) { %>

    <td width="50"    align="center" nowrap> <b><script>document.write(MultiArray["Call time"][lang])</script> &nbsp; (<script>document.write(MultiArray["DD-MM-YY"][lang])</script>) </b> </td>

<% }
%>
    <td width="70"    align="center"> <b> <script>document.write(MultiArray["Login time"][lang])</script> </b> </td>
    <td width="70"    align="center"> <b> <script>document.write(MultiArray["Contacts"][lang])</script> </b> </td>
    <td width="70"    align="center"> <b> <script>document.write(MultiArray["Success"][lang])</script> </b> </td>
    <td width="70"    align="center"> <b> <script>document.write(MultiArray["Refusals"][lang])</script>  </b> </td>
    <td width="70"    align="center"> <b> <script>document.write(MultiArray["Callbacks"][lang])</script></b> </td>
    <td width="70"    align="center"> <b> <script>document.write(MultiArray["Sales/hour"][lang])</script> </b> </td>
    <td width="70"    align="center"> <b> <script>document.write(MultiArray["Contact/hour"][lang])</script>  </b> </td>
    <td width="70"    align="center"> <b><script>document.write(MultiArray["Net Conv. Rate"][lang])</script> </b> </td>
  </tr>

	<%
        sRet = beanAgentPerf.buildAgentPerformanceDetailsReportForPeriod(agentId,startingDate,endingDate,reportType);   
		if(sRet == "succes") {
			for (int i = 0; i < beanAgentPerf.m_vAllDetails.size(); i++) {
				beanAgentPerformanceDetails r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_vAllDetails.elementAt(i);
            	// if (r1.NbContacts >0){
	%>
  <tr <% if(i%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");%> >
	 <td width="70" align="center">
    <%
			if(tmpCamp.compareTo(r1.campaignName)!=0){
			  tmpCamp = r1.campaignName;
			  out.write(r1.campaignName);
			}
	%>
     </td>
    <td width="70"   align="center" nowrap><%out.write(r1.callDate);%></td>
    <td width="70"   align="center"><%out.write(r1.htm);%></td>
    <td width="70"   align="center"><%out.write(Long.toString(r1.NbContacts));%></td>
    <td width="70"   align="center"><%out.write(Long.toString(r1.NbSales));%></td>
    <td width="70"   align="center"><%out.write(Long.toString(r1.NbNoSales));%></td>
    <td width="70"   align="center"><%out.write(Long.toString(r1.NbCallBacks));%></td>
    <td width="70"   align="center"><%out.write(r1.formatNumberToStringValue(r1.NbSalesPerHour));%></td>
    <td width="70"   align="center"><%out.write(r1.formatNumberToStringValue(r1.NbContactPerHour));%></td>
    <td width="70"   align="center"><%out.write(r1.formatNumberToStringValue(r1.NetConvRate));%></td>
  </tr>
<!-- end of array traversal-->
<%
      }// end of for token
	  
  } //fin if
  else {
  		out.write("<tr><td colspan=13><p><font size=2> <script language='javascript'>document.write(MultiArray[\"Error whileError while generating Agent Performance Report...\"][lang]);</script> </font></p></td></tr>");
   }
 %>

</table>
<%
if(numObjects > 1){
%>
<hr class="reportsID" align="left" width="850"> <!-- add an horizontal line between each agent -->
<%}
}// end of for token
%>
</body>

</html>

