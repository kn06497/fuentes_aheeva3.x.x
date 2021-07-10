<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*,java.lang.*"%>
<%@page import ="aheevaManager.reports.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<jsp:useBean id="beanAgentPerfByLead" scope="request" class="aheevaManager.reports.beanAgentPerfByLeadReport" />
<body>
<%
	beanManagerData pageDataAgent = new beanManagerData();
	pageDataAgent.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageDataAgent.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

    String startingDate = "", endingDate   = "";//ok
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String starting_year_yearly = request.getParameter("starting_year_yearly");
    String ending_year_yearly = request.getParameter("ending_year_yearly");
    String starting_month_monthly = request.getParameter("starting_month_monthly");
    String starting_year_monthly = request.getParameter("starting_year_monthly");
    String ending_month_monthly = request.getParameter("ending_month_monthly");
    String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");//ok

		if (reportType.compareTo("Daily") ==0){
			startingDate = startingDateDaily.substring(6)+"/"+ startingDateDaily.substring(0,2)+"/"+startingDateDaily.substring(3,5) + " 00:01:00" ;
			endingDate = endingDateDaily.substring(6)+"/"+ endingDateDaily.substring(0,2)+"/"+endingDateDaily.substring(3,5) + " 00:01:00" ;
		} else if (reportType.compareTo("Monthly") ==0){
			startingDate=starting_year_monthly + "/"+ starting_month_monthly+"/"+ "01" + " 00:01:00" ;
			endingDate=ending_year_monthly+ "/"+ ending_month_monthly + "/31"+ " 00:01:00" ;
		} else if (reportType.compareTo("Yearly") ==0){
			startingDate=starting_year_yearly + "/01/01" + " 00:01:00" ;
			endingDate=ending_year_yearly + "/12/31"+ " 00:01:00" ;
		}


    //String agentGroups  = request.getParameter("objects");
    String teams  = request.getParameter("teams");
    String teamLeaderName="";
    String teamDbid="";
    String teamName="";
    StringTokenizer tok = null;
    StringTokenizer tokn = null;
    if(teams != null){
        tok = new java.util.StringTokenizer(teams,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }
     for( int k = 0; k <= tok.countTokens(); k++ ) {
			long tLoginTime = 0, tContacts = 0, tRContacts = 0, tNbSales = 0, nb=0;
			 double tNbSalesPerHour=0.0, tPercentClosed=0.0,tNetConvRate=0.0;
			 beanAgentPerfByLeaderDetails r=null;

			long T_Scheduled=0;
			long T_TotalLoginTime=0;
			long T_TotalWaittingTime=0;
			double T_PercentActualScheduledLogin=0.0;
			double T_callsPerHour=0.0;
			long T_AvgHandlingTime=0;
			long T_AvgWrapUpTime=0;
			double T_PercentIdleTime=0.0;
			long T_N_Inbound=0;
			long T_AvgTalktimeInboud=0;
			long T_N_Outbound=0;
			long T_AvgTalktimeOutboud=0;
			double T_PercentOutIn=0.0;
			long T_TotalTransfert=0;
			long T_AvgTotalTalkTransfer=0;
			double T_PercentTransferIn=0.0;
			long T_totalTalkTimeInbound=0;
			long T_totalTalkTimeOutbound =0;
			long T_t_WrapUp=0;
			long T_n_WrapUp=0;
			long T_T_TotalTransfert=0 ;
			long T_t_Hold = 0 ;
			long T_n_Hold = 0;
			long T_t_Not_Ready = 0 ;
			long T_N_Yes = 0;
			long T_N_No = 0;

			teams = tok.nextToken();
			// build stats for this team leader
			tokn =  new java.util.StringTokenizer(teams,"^");
			teamDbid = tokn.nextToken();
			teamName=tokn.nextToken();
			teamLeaderName = tokn.nextToken();

%>
<p align="center"><font size=4><b><%=pageDataAgent.getWord("Agent performance report")%>&nbsp; <%=pageDataAgent.getWord("grouped by team leader")%>
         </b></font><br><br></p>
<p align="Center" class="reportsID"><b><%out.write("["+teamName+"]");%></b></p>
<table width="400" border="0" align="center">
  <tr>
    <td   class="reportsID">
		<div align="center"><b>
        <%out.write(reportType);%> <%=pageDataAgent.getWord("Agent performance report")%>&nbsp; <%=pageDataAgent.getWord("grouped by team leader")%>
        <%out.write(teamLeaderName);%> <%=pageDataAgent.getWord("From")%>:
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
<br>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111"  id="AutoNumber1" width="1500">
  <tr class="reportsTab">
    <td  align="center"><b><%=pageDataAgent.getWord("Agent name")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Scheduled")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Actual")%></b></td>
    <td width="100"  align="center"><b>%&nbsp;<%=pageDataAgent.getWord("Adherence")%></b></td>
    <td width="100"  align="center"><b>%&nbsp;<%=pageDataAgent.getWord("GAP")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Calls/hour")%></b></td>
	<td width="100"  align="center"><b>%&nbsp;<%=pageDataAgent.getWord("Productivity")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Average handling time")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Average wrap up time")%></b></td>
    <td width="100"  align="center"><b>%&nbsp;<%=pageDataAgent.getWord("Idle time")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Total")%>&nbsp;<%=pageDataAgent.getWord("Idle time")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Total")%>&nbsp;<%=pageDataAgent.getWord("Inbound calls")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Average inbound talk time")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Total")%>&nbsp;<%=pageDataAgent.getWord("Outbound calls")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Average outbound talk time")%></b></td>
    <td width="100"  align="center"><b>%&nbsp;<%=pageDataAgent.getWord("calls outbound/inbound")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Total calls transfered")%></b></td>
    <td width="100"  align="center"><b><%=pageDataAgent.getWord("Average talk time transfer")%></b></td>
    <td width="100"  align="center"><b>%&nbsp;<%=pageDataAgent.getWord("calls transfered Inbound")%></b></td>
  </tr>

<%
try{
	  String sRet = beanAgentPerfByLead.buildAgentPerformanceGrpReportForPeriod(teamDbid,startingDate,endingDate,reportType);
	  String callsPerHour="";
	  System.out.println("Size : " +Integer.toString(beanAgentPerfByLead.m_vAllDetails.size()));

  	  if(sRet == "success"){
	    for (int i = 0; i < beanAgentPerfByLead.m_vAllDetails.size(); i++) {
		   beanAgentPerfByLeaderDetails r1 = (beanAgentPerfByLeaderDetails)beanAgentPerfByLead.m_vAllDetails.elementAt(i);
		   callsPerHour = r1.getCallPerHour();
%>

	 <tr <% if(i%2 == 0) {out.write("class=reportsRowPair");}
				else {out.write("class=reportsRowUnPair");}%> >
		<td   align="left" nowrap><%out.write(r1.agentFullName);%> [<%out.write(r1.agentId);%>]</td>
		<td   align="center"><%out.write(r1.getScheduled());%></td>
		<td   align="center"><%out.write(r1.buildReadableTime(r1.totalLoginTime));%></td>
		<td   align="center"><%out.write(r1.getAdherence());%></td>
		<td   align="center" nowrap><%out.write(r1.getPercentActualScheduledLogin());%></td>
		<td   align="center"><%out.write(callsPerHour);%></td>
		<td   align="center"><%out.write(r1.getProductivityRatio());%></td>
		<td   align="center"><%out.write(r1.getAvgHandlingTime());%></td>
		<td   align="center"><%out.write(r1.getAvgWrapUpTime());%></td>
		<td   align="center"><%out.write(r1.getPercentIdleTime());%></td>
		<td   align="center"><%out.write(r1.getTotalNotReadyTime());%></td>
		<td   align="center"><%out.write(r1.getN_Inbound());%></td>
		<td   align="center"><%out.write(r1.getAvgTalktimeInboud());%></td>
		<td   align="center"><%out.write(r1.getN_Outbound());%></td>
		<td   align="center"><%out.write(r1.getAvgTalktimeOutboud());%></td>
		<td   align="center"><%out.write(r1.getPercentOutIn());%></td>
		<td   align="center"><%out.write(r1.getTotalTransfert());%></td>
		<td   align="center"><%out.write(r1.getAvgTotalTalkTransfer());%></td>
		<td   align="center"><%out.write(r1.getPercentTransferIn());%></td>
	  </tr>

<%
		T_Scheduled += r1.Scheduled;
		T_TotalLoginTime += r1.totalLoginTime;
		T_TotalWaittingTime += r1.TotalWaittingTime;
		T_N_Inbound += r1.n_Inbound;
		T_N_Outbound += r1.n_Outbound ;
		T_TotalTransfert+=r1.n_single_transfer + r1.n_two_step_transfer ;
		T_T_TotalTransfert+=r1.t_single_transfer + r1.t_two_step_transfer ;

		T_totalTalkTimeInbound+=r1.totalTalkTimeInbound ;
		T_totalTalkTimeOutbound+=r1.totalTalkTimeOutbound ;
		T_t_WrapUp+=r1.t_WrapUpIn + r1.t_WrapUpOut ;
		T_n_WrapUp+=r1.n_WrapUpIn + r1.n_WrapUpOut ;
		T_TotalWaittingTime+= r1.TotalWaittingTime;
		T_t_Hold += r1.t_hold;
		T_n_Hold += r1.n_hold;
		T_t_Not_Ready += r1.t_Not_Ready;
		T_N_Yes += r1.n_yes;
	    T_N_No += r1.n_no;
  	} // fin boucle pour afficher les agents, end for

	if (T_Scheduled > 0){
	   T_PercentActualScheduledLogin = ((double)(T_TotalLoginTime - T_Scheduled)*100)/ T_Scheduled;
	}else{
	   T_PercentActualScheduledLogin=0.0;
	}


	 if (T_TotalLoginTime> 3600){
	   T_callsPerHour = (double) (T_N_Outbound + T_N_Inbound) / ( (double)T_TotalLoginTime / 3600);
	 } else{ // if it's been less than an hour that the agent is logged in
	   T_callsPerHour = T_N_Outbound + T_N_Inbound;
	 }

	if (T_N_Outbound + T_N_Inbound > 0) {
	  T_AvgHandlingTime =  (T_totalTalkTimeInbound +T_totalTalkTimeOutbound + T_t_WrapUp + T_t_Hold)/(T_N_Outbound + T_N_Inbound);
	}
	if (T_n_WrapUp > 0) {
	  T_AvgWrapUpTime = T_t_WrapUp/T_n_WrapUp;
	}


   if (T_TotalLoginTime >0){
	 T_PercentIdleTime=((double)(T_t_Not_Ready*100))/T_TotalLoginTime;
   }

	if (T_N_Outbound> 0) {
	 T_AvgTalktimeOutboud =T_totalTalkTimeOutbound / T_N_Outbound;
	}
	if (T_N_Inbound> 0) {
	 T_AvgTalktimeInboud =T_totalTalkTimeInbound / T_N_Inbound;
   }

	T_PercentOutIn=0.0;
	if (T_N_Inbound > 0){
	  T_PercentOutIn =  ( (double)T_N_Outbound * 100 / T_N_Inbound );
	}

   if (T_TotalTransfert >0) {
		 T_AvgTotalTalkTransfer = T_T_TotalTransfert/T_TotalTransfert;
	 }

	 if (T_N_Inbound > 0){
	   T_PercentTransferIn = ( (double)T_TotalTransfert * 100) / T_N_Inbound;
	 }
	beanAgentPerfByLeaderDetails bean_total = new beanAgentPerfByLeaderDetails();
	double tot_productivity = 0.0;
	if(T_TotalLoginTime > 0)
	  tot_productivity = (1 - ((double)(T_t_WrapUp + T_t_Not_Ready)/T_TotalLoginTime))*100.0;

	double tot_adherence = 0.0;
	if(T_N_Yes + T_N_No > 0)
		tot_adherence = 100*((double)T_N_Yes / (double)(T_N_Yes + T_N_No ));
%>
<!--Totaux-->
	<tr bgcolor="#FDFDE0" >
		<td align="left" nowrap><b><%=pageDataAgent.getWord("Total")%></b></td>
		<td  align="center"><b><%out.write(bean_total.buildReadableTime(T_Scheduled));%></b></td>
		<td  align="center"><b><%out.write(bean_total.buildReadableTime(T_TotalLoginTime));%></b></td>
		<td  align="center" ><b><%out.write(bean_total.formatDecimalDouble(tot_adherence, 2) + "%");%></td>
		<td  align="center" nowrap><b><%out.write(bean_total.formatDecimalDouble(T_PercentActualScheduledLogin, 2) + " %");%></b></td>
		<td  align="center"><b><%out.write(bean_total.formatDecimalDouble(T_callsPerHour, 2));%></td>
		<td  align="center"><b><%out.write(bean_total.formatDecimalDouble(tot_productivity, 2) + "%");%></b></td>
		<td  align="center"><b><%out.write(bean_total.buildReadableTime(T_AvgHandlingTime));%></b></td>
		<td  align="center"><b><%out.write(bean_total.buildReadableTime(T_AvgWrapUpTime));%></b></td>
		<td  align="center"><b><%out.write(bean_total.formatDecimalDouble(T_PercentIdleTime, 2) + "%");%></b></td>
		<td  align="center"><b><%out.write(bean_total.buildReadableTime(T_t_Not_Ready));%></b></td>
		<td  align="center"><b><%out.write(Long.toString(T_N_Inbound));%></b></td>
		<td  align="center"><b><%out.write(bean_total.buildReadableTime(T_AvgTalktimeInboud));%></b></td>
		<td  align="center"><b><%out.write(Long.toString(T_N_Outbound));%></b></td>
		<td  align="center"><b><%out.write(bean_total.buildReadableTime(T_AvgTalktimeOutboud));%></b></td>
		<td  align="center"><b><%out.write(bean_total.formatDecimalDouble(T_PercentOutIn,2) + "%");%></b></td>
		<td  align="center"><b><%out.write(Long.toString(T_TotalTransfert));%></b></td>
		<td  align="center"><b><%out.write(bean_total.buildReadableTime(T_AvgTotalTalkTransfer));%></b></td>
		<td  align="center"><b><%out.write(bean_total.formatDecimalDouble(T_PercentTransferIn, 2) + "%");%></b></td>
	</tr>

	</table>
	<p>
	<p>
<%
  	 }// end if
	  else if(sRet == "sqlException"){
			out.write("<p><font size=2>"+pageDataAgent.getWord("Error in queries..Please check the database")+"</font></p>");
	 }else{
			out.write("<p><font size=2>"+pageDataAgent.getWord("Error while generating Agent Performance Report")+"</font></p>");
	 }
	}//end try
	catch( Exception e){
			out.write("<p><font size=2>"+pageDataAgent.getWord("Error while getting data..Please check the database")+"</font></p>");
	}// end catch

 } //end for token
  %>

</body>

</html>

<%
pageDataAgent.closeConnection();
%>