<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.reports.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<jsp:useBean id="beanAgentPerf" scope="request" class="aheevaManager.reports.beanAgentPerformanceReport" />
<body>
<%
	beanManagerData pageDataAgent = new beanManagerData();
	pageDataAgent.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageDataAgent.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

    long tLoginTime = 0, tContacts = 0, tRContacts = 0, tNbSales = 0, nb=0,tNbNoSales = 0, tNbCallbacks = 0;
    double tNbSalesPerHour=0.0, tPercentClosed=0.0,tNetConvRate=0.0, tNbContactsPerHour =0.0;
    beanAgentPerformanceDetails r=null;
    StringTokenizer tok = null, tokn = null;
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_year_yearly = request.getParameter("starting_year_yearly");
    String ending_year_yearly = request.getParameter("ending_year_yearly");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String agentGroups  = request.getParameter("objects");
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

    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    int numObjects = tok.countTokens();
    for( int k = 0; k <numObjects; k++ ) {
        String agentGroup = tok.nextToken();
        System.out.println("Agent group: " + agentGroup);
        tLoginTime = 0;
        tContacts = 0;
        tRContacts = 0;
        tNbSales = 0;
        tNbNoSales = 0;   tNbCallbacks = 0;
        tNbSalesPerHour=0.0; tPercentClosed=0.0;tNetConvRate=0.0; tNbContactsPerHour =0.0;
        // build stats for this agent group
%>

<p align="center"><font size=4><b><%=pageDataAgent.getWord("Agent group performance report")%></b></font><br><br></p>
 
<table width="350" border="0" align="center">
  <tr>
    <td   class="reportsID"><div align="center"><b><%=pageDataAgent.getWord("Agent group")%> &nbsp; <%=pageDataAgent.getWord("Performance")%>
        <%out.write(reportType);%>
        <%=pageDataAgent.getWord("Report")%>&nbsp; <%=pageDataAgent.getWord("From")%>:
        <%
		if (reportType.compareTo("Daily") ==0){
			out.write(startingDateDaily);
		} else if (reportType.compareTo("Monthly") ==0){
			out.write(starting_month_monthly+"/"+starting_year_monthly);
		} else if (reportType.compareTo("Yearly") ==0){
			out.write(starting_year_yearly);
		}
		%>
        <%=pageDataAgent.getWord("To")%>
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

<p class="reportsID" align="center"> <b>[<%=pageDataAgent.getWord("Group")%> :<%out.write( agentGroup +"]");%></b></p>
<p class="reportsID"> </p>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="850" id="AutoNumber1">
  <tr class="reportsTab">
    <td width="200"   align="center"> <b><%=pageDataAgent.getWord("Agent name")%></b> </td>
    <td width="50"   align="center"> <b><%=pageDataAgent.getWord("Agent ID")%></b> </td>
    <td width="70"   align="center"> <b><%=pageDataAgent.getWord("Login time")%></b> </td>
    <td width="70"   align="center"> <b><%=pageDataAgent.getWord("Contacts")%></b> </td>
    <td width="70"   align="center"> <b><%=pageDataAgent.getWord("Success")%></b> </td>
    <td width="70"   align="center"> <b><%=pageDataAgent.getWord("Refusals")%></b> </td>
    <td width="70"   align="center"> <b><%=pageDataAgent.getWord("Callbacks")%></b> </td>
    <td width="70"   align="center"> <b><%=pageDataAgent.getWord("Sales/hour")%></b> </td>
    <td width="70"   align="center"> <b><%=pageDataAgent.getWord("Contact/hour")%></b> </td>
    <td width="70"   align="center"> <b><%=pageDataAgent.getWord("Net Conv. Rate")%></b> </td>
  </tr>
  
<%
    try {  
      String sRet = beanAgentPerf.buildAgentPerformanceGrpDetailsReportForPeriod(agentGroup,startingDate,endingDate,reportType);
	  if(sRet == "succes"){
        for (int i = 0; i < beanAgentPerf.m_vAllDetails.size(); i++) {
             beanAgentPerformanceDetails r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_vAllDetails.elementAt(i);
             if(r1.NbContacts > 0){
%>

<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");%> >
    <td width="200"   align="left"><%out.write(r1.agentFullName);%> </td>
    <td width="50"   align="center"><%out.write(r1.agentId);%></td>
    <td width="70"   align="center"><%out.write(r1.htm);%></td>
    <td width="70"   align="center"><%out.write(Long.toString(r1.NbContacts));%></td>
    <td width="70"   align="center"><%out.write(Long.toString(r1.NbSales));%></td>
    <td width="70"   align="center"><%out.write(Long.toString(r1.NbNoSales));%></td>
    <td width="70"   align="center"><%out.write(Long.toString(r1.NbCallBacks));%></td>
    <td width="70"   align="center"><%out.write(r1.formatNumberToStringValue(r1.NbSalesPerHour));%></td>
    <td width="70"   align="center"><%out.write(r1.formatNumberToStringValue((double)r1.NbContacts /((double)r1.totalLoginTime / 3600)));%></td>
    <td width="70"   align="center"><%out.write(r1.formatNumberToStringValue(r1.NetConvRate));%></td>
  </tr>
<!-- end of array traversal-->
<%
        tLoginTime += r1.totalLoginTime;
        tContacts += r1.NbContacts;
        tRContacts += r1.RContacts;
        tNbSales += r1.NbSales;
        tNbNoSales += r1.NbNoSales;
        tNbCallbacks += r1.NbCallBacks;
        tNbSalesPerHour = (double)tNbSales / ((double)tLoginTime / 3600);
        tNbContactsPerHour = (double)tContacts /((double)tLoginTime / 3600);
        tNetConvRate = ((double)tNbSales /(double)tRContacts)*100;
        }//if
      }//end for
      nb = beanAgentPerf.m_vAllDetails.size();
      r = new beanAgentPerformanceDetails();
%>
  <tr>
    <td width="170" bgcolor="#FDFDE0" align="center"><b><%out.write(agentGroup);%> (<%out.write(Long.toString(nb));%>)</b></td>
    <td width="50" bgcolor="#FDFDE0" align="center"><%out.write("");%></td>
    <td width="70" bgcolor="#FDFDE0" align="center"><b><%out.write(r.buildReadableTime(tLoginTime));%></b></td>
    <td width="70" bgcolor="#FDFDE0" align="center"><b><%out.write(Long.toString(tContacts));%></b></td>
    <td width="70" bgcolor="#FDFDE0" align="center"><b><%out.write(Long.toString(tNbSales));%></b></td>
    <td width="70" bgcolor="#FDFDE0" align="center"><b><%out.write(Long.toString(tNbNoSales));%></b></td>
    <td width="70" bgcolor="#FDFDE0" align="center"><b><%out.write(Long.toString(tNbCallbacks));%></b></td>
    <td width="70" bgcolor="#FDFDE0" align="center"><b><%out.write(r.formatNumberToStringValue(tNbSalesPerHour));//Double.toString(r1.NbSalesPerHour));%></b></td>
    <td width="70" bgcolor="#FDFDE0" align="center"><b><%out.write(r.formatNumberToStringValue(tNbContactsPerHour));//Double.toString(r1.PercentClosed));%></b></td>
    <td width="70" bgcolor="#FDFDE0" align="center"><b><%out.write(r.formatNumberToStringValue(tNetConvRate));//Double.toString(r1.NetConvRate));%></b></td>
  </tr>
</table>
<%
  }//enf if succes
  else{
    out.write(" <p><font size=2>  Error while generating Agent Group Performance Report..Please check data in MySQL database..</font></p> ");
	out.write("</table>");
  }
if(numObjects > 1){
%>
<hr class="reportsID" align="left" width="850"> <!-- add an horizontal line between each agent -->
<%}

 }catch(Exception e){
 
 }
}// end of for token
%>

</body>

</html>

<%
pageDataAgent.closeConnection();
%>