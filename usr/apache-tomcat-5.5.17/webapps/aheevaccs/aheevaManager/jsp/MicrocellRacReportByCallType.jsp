<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>
<jsp:useBean id="beanRac" scope="request" class="aheevaManager.reports.beanQueueReport" />
<body>
<%

    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_year_yearly = request.getParameter("starting_year_yearly");
    String ending_year_yearly = request.getParameter("ending_year_yearly");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String dnis       = request.getParameter("objects");
    String queue = "rac_french" ;//request.getParameter("dnis");
    String startingDate="";
    String endingDate="";
    if (reportType.compareTo("Daily") ==0){
	startingDate =startingDateDaily;
    } else if (reportType.compareTo("Monthly") ==0){
	startingDate=starting_year_monthly+"/"+starting_month_monthly;
    } else if (reportType.compareTo("Yearly") ==0){
	startingDate=starting_year_yearly;
    }
    if (reportType.compareTo("Daily") ==0){
		endingDate=endingDateDaily;
   }else if (reportType.compareTo("Monthly") ==0){
		endingDate=ending_year_monthly+"/"+ending_month_monthly;
   }else if (reportType.compareTo("Yearly") ==0){
		endingDate=ending_year_yearly;
   }

%>
<p align="center">&nbsp; </p>
<table width="250" border="0" align="center">
  <tr>
    <td class="reportsID"><div align="center"><b>Microcell Rac
        <%out.write(reportType);%>
        Report from:   <%out.write(startingDate);%>
        to        <%out.write(endingDate);%>
        </b></div></td>
  </tr>
</table>
<%
   beanRac.buildRacReportForPeriod(startingDate,endingDate,reportType,queue,dnis);

%>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="850" id="AutoNumber1">
    <tr class="reportsTab" align="center">
      <td width="80"  >   Call Date  </td>
      <td width="80"  >   Half Hour  </td>
      <td width="80"  >   Calls Offered  </td>
      <td width="80"  >   Calls Handled  </td>
      <td width="80"  >  % SVL  </td>
      <td width="60"  >   Talk Time </td>
      <td width="80"  >   Wrap Up Time  </td>
      <td width="80"  >   Hold Time  </td>
    </tr>
<%

    for (int i = 0; i < beanRac.m_vAllDetails.size(); i++) {
        beanQueueRac rac = (beanQueueRac)beanRac.m_vAllDetails.elementAt(i);

%>
  <tr <% if(i%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");%> >

      <td width="80"   align="center"> <%out.write(rac.callDate );%>  </td>
      <td width="80"   align="center"> <%out.write(rac.HalfHour );%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(rac.CallsOffered ));%>  </td>
      <td width="80"   align="center"> <%out.write("");%>  </td>
      <td width="60"   align="center"> <%out.write("");%>  </td>
      <td width="60"   align="center"> <%out.write("");%>  </td>
      <td width="60"   align="center"> <%out.write("");%>  </td>
      <td width="60"   align="center"> <%out.write("");%>  </td>

</tr>
<!-- end of array traversal-->
<%  } %>


</table>
<p>
<p>
<hr class="reportsID" align="center" width="850">  <!--add an horizontal line between each agent-->

</body>
</html>

