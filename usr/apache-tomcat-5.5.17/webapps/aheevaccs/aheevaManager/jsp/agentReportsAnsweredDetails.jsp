<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.reports.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import ="java.io.*"%>
<%@page import = "java.io.File" %>
<%@page import = "java.io.RandomAccessFile" %>
<%@page import = "java.io.FileNotFoundException" %>
<%@page import = "java.io.IOException" %>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pageAnsDetData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageAnsDetData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageAnsDetData.openConnection();
    %>
    <%
    long tLoginTime_Ans = 0, ssTotLoginTime_Ans = 0, totLoginTime_Ans = 0 ;
    long tTalkTimeInbound = 0, ssTotTalkTimeInbound = 0 ,totTalkTimeInbound = 0;
    long tTalkTimeOutbound = 0, ssTotTalkTimeOutbound = 0 ,totTalkTimeOutbound = 0;
    long tTime = 0, totTime = 0;
    long tWrapUp =0, ssTotWrapUp = 0 , totWrapUp =0;
	long tHold = 0, ssTotHold = 0 , totHold = 0 ;
    long t_N_login =0, ssNLoginTime = 0, tot_N_login =0;
    long t_n_Inbound =0, ssNInbound =0, tot_n_Inbound =0;
    long t_n_Outbound =0, ssNOutbound =0, tot_n_Outbound =0;
    long t_n_Wrap_up =0, ssNWrap_up =0, tot_n_Wrap_up =0 ;
	long t_n_Hold = 0, ssNHold =0, tot_n_Hold = 0;
    long tHandling = 0, ssTotHandling = 0 ,totHandling = 0;
    long t_n_Handling =0, ssNHandling =0, tot_n_Handling =0;
    long tBusy = 0, ssTotBusy = 0 ,totBusy = 0;
    long t_n_Busy =0, ssNBusy =0, tot_n_Busy =0;
	long ssTotWrapUpIn =0, ssTotWrapUpOut =0, totWrapUpIn =0, totWrapUpOut =0;
	long avgTalkTimeInbound = 0 , tot_avgTalkTimeInbound = 0;
    long avgTalkTimeOutbound = 0, tot_avgTalkTimeOutbound = 0;
    long avgWrapUp = 0, tot_avgWrapUp = 0;
    long avgHold = 0, tot_avgHold = 0;
    long avgHandling = 0, tot_avgHandling = 0;
	long ahtIn =0, tot_ahtIn=0, ahtOut=0, tot_ahtOut =0;

	String percentTalkTimeInbound = "" , tot_percentTalkTimeInbound = "";
    String percentTalkTimeOutbound = "", tot_percentTalkTimeOutbound = "";
    String percentWrapUp = "", tot_percentWrapUp = "";
    String percentHold = "", tot_percentHold = "";
    String percentHandling = "", tot_percentHandling = "";
    String percentBusy = "", tot_percentBusy = "";

	boolean needOneMoreTotalRow_Ans = false;
    agentInfo =null;
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<table width="100%" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="center">
					  <b>
							<%
								try { out.write(beanAgentDetail.getAgentFullName(agentId)); }
								catch(Exception e) { out.write(""); }
							%>
						  [
						  <% out.println(agentId); %>
					  	 ]
					  </b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td  class="reportsID" width="100%" align="center">
						<b>
							<%
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageAnsDetData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageAnsDetData.getWord("Monthly"));					
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageAnsDetData.getWord("Yearly"));
								}
							%>
							<%= pageAnsDetData.getWord("Details Report for answered calls")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageAnsDetData.getWord("To")%>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							%>
						</b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>
	<%
	if(from.compareTo("agentReport") == 0)
	{
	 %>
		<tr>
			<td width="100%" align="center">
				<table width="100%" align="center">
					<tr><td height="20"></td></tr>
					<tr>
						<td width="100%" align="left"><font style="background-color:#FFC5A8">
							<b><%= pageAnsDetData.getWord("Answered calls")%>			
							</b>
							</font>
						</td>
					</tr>			
				</table>
			</td>
		</tr>
	<%
	}
	%>
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%=
							 pageAnsDetData.getWord("Telephony data")
							%>					
						</b>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName">
				<td width="15%" align="center"><%= pageAnsDetData.getWord("Time period")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Login time")%></td>
				<td width="5%"  align="center"><%= pageAnsDetData.getWord("Login count")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Inbound time")%></td>
				<td width="5%"  align="center"><%= pageAnsDetData.getWord("Inbound count")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Outbound time")%></td>
				<td width="5%"  align="center"><%= pageAnsDetData.getWord("Outbound count")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Wrap up time")%></td>
				<td width="5%"  align="center"><%= pageAnsDetData.getWord("Wrap up count")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Hold time")%></td>
				<td width="5%"  align="center"><%= pageAnsDetData.getWord("Hold count")%></td>
			  </tr>
<%
    for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) {
         agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
%>
 			<% if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) {%>
			 <tr>
				 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageAnsDetData.getWord("Sub total")%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tLoginTime_Ans));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_N_login));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tTalkTimeInbound));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Inbound));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tTalkTimeOutbound));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Outbound));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tWrapUp));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Wrap_up));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tHold));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Hold));%></b></font></td>
			</tr>
 			<%
				tLoginTime_Ans = 0;
				tTalkTimeInbound = 0;
				tTalkTimeOutbound = 0;
				tWrapUp  = 0;
				tHold =0;
				t_N_login =0;
				t_n_Inbound =0;
				t_n_Outbound =0;
				t_n_Wrap_up =0;
				t_n_Hold = 0;
				needOneMoreTotalRow_Ans = true;
			 }
 		 if(agentInfo.totalLoginTime > 0){
		%>
	<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");%> >
		<td    align="center"><%out.write(agentInfo.time);%></td>
		<td width="10%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_login));%></td>
		<td width="10%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_Inbound));%></td>
		<td width="10%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_Outbound));%></td>
		<td width="10%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up) );%></td>
		<td width="10%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalHoldTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_hold));%></td>
	  </tr>
<%
        tLoginTime_Ans += agentInfo.totalLoginTime;   totLoginTime_Ans += agentInfo.totalLoginTime;
        tTalkTimeInbound += agentInfo.totalTalkTimeInbound;  totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
        tTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
        tWrapUp  += agentInfo.totalWrapUpInTime; totWrapUp  += agentInfo.totalWrapUpInTime;
        tWrapUp  += agentInfo.totalWrapUpOutTime; totWrapUp  += agentInfo.totalWrapUpOutTime;
        tHold += agentInfo.totalHoldTime; totHold += agentInfo.totalHoldTime;

        t_N_login += agentInfo.n_login; tot_N_login += agentInfo.n_login;
        t_n_Inbound += agentInfo.n_Inbound; tot_n_Inbound += agentInfo.n_Inbound;
        t_n_Outbound += agentInfo.n_Outbound; tot_n_Outbound += agentInfo.n_Outbound;

        t_n_Wrap_up += agentInfo.n_Wrap_In_up;  tot_n_Wrap_up += agentInfo.n_Wrap_In_up;
        t_n_Wrap_up += agentInfo.n_Wrap_Out_up;  tot_n_Wrap_up += agentInfo.n_Wrap_Out_up;
        t_n_Hold += agentInfo.n_hold; tot_n_Hold += agentInfo.n_hold;
        }
    }
 	agentInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow_Ans == true){
	%>
	 <tr>
		 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageAnsDetData.getWord("Sub total")%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tLoginTime_Ans));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_N_login));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tTalkTimeInbound));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Inbound));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tTalkTimeOutbound));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Outbound));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tWrapUp));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Wrap_up));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tHold));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Hold));%></b></font></td>
	</tr>
	<%
		  }
	%>
	 <tr>
		 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageAnsDetData.getWord("Total")%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totLoginTime_Ans));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_N_login));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totTalkTimeInbound));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_n_Inbound));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totTalkTimeOutbound));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_n_Outbound));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totWrapUp));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_n_Wrap_up));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totHold));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_n_Hold));%></b></font></td>
	</tr>
</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write(pageAnsDetData.getWord("Average"));
								needOneMoreTotalRow_Ans = false;
								tTalkTimeInbound = 0; ssTotTalkTimeInbound = 0 ; 
								totTalkTimeInbound = 0; 		    
								tTalkTimeOutbound = 0; ssTotTalkTimeOutbound = 0 ; 
								totTalkTimeOutbound = 0;
    							tWrapUp =0; ssTotWrapUp = 0 ; totWrapUp =0;
								tHold = 0; ssTotHold = 0 ; totHold = 0 ;
    							tHandling = 0; ssTotHandling = 0 ;totHandling = 0;
    							tBusy = 0; ssTotBusy = 0; totBusy = 0;

    							t_n_Inbound =0; ssNInbound =0; tot_n_Inbound =0;
								t_n_Outbound =0; ssNOutbound =0; tot_n_Outbound =0;
								t_n_Wrap_up =0; ssNWrap_up =0; tot_n_Wrap_up =0 ;
								t_n_Hold = 0; ssNHold =0; tot_n_Hold = 0;
								tHandling = 0; ssTotHandling = 0 ;totHandling = 0;
								t_n_Handling =0; ssNHandling =0; tot_n_Handling =0;
								tBusy = 0; ssTotBusy = 0 ;totBusy = 0;
								t_n_Busy =0; ssNBusy =0; tot_n_Busy =0;
							%>					
						</b>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName">
				<td width="20%" align="center"> <%= pageAnsDetData.getWord("Time period")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Inbound calls")%></td>
				<td width="10%"  align="center"> <%= pageAnsDetData.getWord("Outbound calls")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Wrap up calls")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Hold calls")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Handling")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("AHT in")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("AHT out")%></td>
			  </tr>
			<%
			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) {
				agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0){
					if((ssNInbound) !=0) {
					avgTalkTimeInbound = (ssTotTalkTimeInbound/ssNInbound);
					
					// Add Hold Time to inbound only if agent were spent more time on Inbound calls than on Outbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)>=(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn+ ssTotHold)/ssNInbound;
						} else {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn)/ssNInbound;
						}
					}
					if((ssNOutbound) !=0){
						avgTalkTimeOutbound = (ssTotTalkTimeOutbound/ssNOutbound);
						
						// Add Hold Time to outbound only if agent were spent more time on Outbound calls than on Inbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)<(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut+ ssTotHold)/ssNOutbound;
						} else {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut)/ssNOutbound;						
						}
					}
					if((ssNInbound + ssNOutbound) !=0) avgWrapUp = (ssTotWrapUp/(ssNInbound + ssNOutbound));
					if((ssNInbound + ssNOutbound) !=0) avgHold = (ssTotHold/(ssNInbound + ssNOutbound));
					if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
					%>
				 	<tr>
					 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageAnsDetData.getWord("Sub total")%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgTalkTimeInbound));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgTalkTimeOutbound));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgWrapUp));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgHold));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgHandling));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(ahtIn));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(ahtOut));%></b></font></td>
					</tr>
	 			<%
					ssTotTalkTimeInbound = 0;
					ssNInbound = 0;
					avgTalkTimeInbound = 0 ;
					ssTotTalkTimeOutbound = 0;
					ssNOutbound = 0;
					avgTalkTimeOutbound  = 0;
					ssTotWrapUp = 0;
					ssNWrap_up = 0;
					avgWrapUp = 0;
					ssTotWrapUpIn =0;
					ssTotWrapUpOut =0;
					ssTotHold = 0;
					ssNHold = 0;
					avgHold = 0;
	    			ssTotHandling = 0 ;
					ssNHandling =0;
	    			avgHandling = 0;
					ahtIn=0;
					ahtOut=0;
					needOneMoreTotalRow_Ans = true;
				}
			    if(agentInfo.totalLoginTime > 0){
					%>
					<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
						<td   align="center"><%out.write(agentInfo.time);%></td>
						<td   align="center"><%out.write(agentInfo.getAvgTalktimeInbound());%></td>
						<td   align="center"><%out.write(agentInfo.getAvgTalktimeOutbound());%></td>
						<td   align="center"><%out.write(agentInfo.getAvgWrapUpTime());%></td>
						<td   align="center"><%out.write(agentInfo.getAvgTalktimeHold());%></td>
						<td   align="center"><%out.write(agentInfo.getAvgHandlingTime());%></td>
						<td   align="center"><%out.write(agentInfo.getAhtIn());%></td>
						<td   align="center"><%out.write(agentInfo.getAhtOut());%></td>
				  	</tr>
					<%
					ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound ;
					ssNInbound+= agentInfo.n_Inbound;
					totTalkTimeInbound +=agentInfo.totalTalkTimeInbound ;
					tot_n_Inbound +=agentInfo.n_Inbound  ; 
					tTalkTimeInbound = agentInfo.totalTalkTimeInbound ; 
					t_n_Inbound =agentInfo.n_Inbound  ; 
		
					ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound ;
					ssNOutbound += agentInfo.n_Outbound;
					totTalkTimeOutbound +=agentInfo.totalTalkTimeOutbound ;
					tot_n_Outbound +=agentInfo.n_Outbound  ; 
					tTalkTimeOutbound = agentInfo.totalTalkTimeOutbound ; 
					t_n_Outbound =agentInfo.n_Outbound  ; 
		
					ssTotWrapUp += agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime ;
					ssNWrap_up+= agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up;
					totWrapUp +=agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ;
					tot_n_Wrap_up +=agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
					tWrapUp = agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ; 
					t_n_Wrap_up =agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up;
		
					ssTotWrapUpIn += agentInfo.totalWrapUpInTime;
					ssTotWrapUpOut += agentInfo.totalWrapUpOutTime ;
					totWrapUpIn+= agentInfo.totalWrapUpInTime;
					totWrapUpOut += agentInfo.totalWrapUpOutTime ;
		
					ssTotHold += agentInfo.totalHoldTime ;
					ssNHold+= agentInfo.n_hold;
					totHold +=agentInfo.totalHoldTime ;
					tot_n_Hold +=agentInfo.n_hold  ; 
					tHold = agentInfo.totalHoldTime ; 
					t_n_Hold =agentInfo.n_hold  ; 
					ssTotHandling += agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
					ssNHandling+= agentInfo.n_Inbound + agentInfo.n_Outbound;
					totHandling +=agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
					tot_n_Handling += agentInfo.n_Inbound + agentInfo.n_Outbound;
					tHandling = agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
					t_n_Handling = agentInfo.n_Inbound + agentInfo.n_Outbound;
			    }
			} 
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true){
				if((ssNInbound) !=0) {
					avgTalkTimeInbound = (ssTotTalkTimeInbound/ssNInbound);
					// Add Hold Time to inbound only if agent were spent more time on Inbound calls than on Outbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)>=(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn+ ssTotHold)/ssNInbound;
						} else {
							ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn)/ssNInbound;
						}
					}
					if((ssNOutbound) !=0){
						avgTalkTimeOutbound = (ssTotTalkTimeOutbound/ssNOutbound);
						
						// Add Hold Time to outbound only if agent were spent more time on Outbound calls than on Inbound cals
						if ((ssTotTalkTimeInbound + ssTotWrapUpIn)<(ssTotTalkTimeOutbound + ssTotWrapUpOut)) {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut+ ssTotHold)/ssNOutbound;
						} else {
							ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut)/ssNOutbound;						
						}
				
				}
				if((ssNOutbound + ssNInbound ) !=0) avgWrapUp = (ssTotWrapUp/(ssNOutbound + ssNInbound) );
				if((ssNOutbound + ssNInbound ) !=0) avgHold = (ssTotHold/(ssNOutbound + ssNInbound ));
				if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
				%>
			 		<tr>
					 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageAnsDetData.getWord("Sub total")%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgTalkTimeInbound));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgTalkTimeOutbound));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgWrapUp));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgHold));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgHandling));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(ahtIn));%></b></font></td>
					 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(ahtOut));%></b></font></td>
					</tr>
				<%
			}
			if((tot_n_Inbound) !=0) {
				tot_avgTalkTimeInbound = (totTalkTimeInbound/tot_n_Inbound);
				
				// Add Hold Time to inbound only if agent were spent more time on Inbound calls than on Outbound cals
						if ((totTalkTimeInbound +totWrapUpIn)>=(totTalkTimeOutbound +totWrapUpOut)) {
							tot_ahtIn = (totTalkTimeInbound +totWrapUpIn +totHold) /tot_n_Inbound;
						} else {
							tot_ahtIn = (totTalkTimeInbound +totWrapUpIn) /tot_n_Inbound;
						}
					}
					if((tot_n_Outbound) !=0){
						tot_avgTalkTimeOutbound = (totTalkTimeOutbound/tot_n_Outbound);
						
						// Add Hold Time to outbound only if agent were spent more time on Outbound calls than on Inbound cals
						if ((totTalkTimeInbound +totWrapUpIn)<(totTalkTimeOutbound +totWrapUpOut)) {
							tot_ahtOut =(totTalkTimeOutbound +totWrapUpOut +totHold) /tot_n_Outbound;
						} else {
							tot_ahtOut =(totTalkTimeOutbound +totWrapUpOut) /tot_n_Outbound;						
						}
					}
			if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgWrapUp = (totWrapUp/(tot_n_Outbound + tot_n_Inbound));
			if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgHold = (totHold/(tot_n_Outbound + tot_n_Inbound));
			if((tot_n_Handling) !=0) tot_avgHandling = (totHandling/tot_n_Handling);
			%>
	 			<tr>
					<td   width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageAnsDetData.getWord("Total")%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_avgTalkTimeInbound));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_avgTalkTimeOutbound));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_avgWrapUp));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_avgHold));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_avgHandling));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_ahtIn));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_ahtOut));%></b></font></td>
				</tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write(pageAnsDetData.getWord("Percentages compared to login time"));
								needOneMoreTotalRow_Ans = false;
    							tLoginTime_Ans = 0; ssTotLoginTime_Ans = 0; totLoginTime_Ans = 0 ;
								tTalkTimeInbound = 0; ssTotTalkTimeInbound = 0 ; 
								totTalkTimeInbound = 0; 		    
								tTalkTimeOutbound = 0; ssTotTalkTimeOutbound = 0 ; 
								totTalkTimeOutbound = 0;
    							tWrapUp =0; ssTotWrapUp = 0 ; totWrapUp =0;
								tHold = 0; ssTotHold = 0 ; totHold = 0 ;
    							tHandling = 0; ssTotHandling = 0 ;totHandling = 0;
    							tBusy = 0; ssTotBusy = 0; totBusy = 0;
							%>					
						</b>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName">
				<td width="20%" align="center"> <%= pageAnsDetData.getWord("Time period")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Inbound calls")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Outbound calls")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Wrap up calls")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Hold calls")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Handling")%></td>
				<td width="10%"  align="center"><%= pageAnsDetData.getWord("Busy")%></td>
			  </tr>
			<%
			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = agentInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = agentInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = agentInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = agentInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageAnsDetData.getWord("Sub total")%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentTalkTimeInbound+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentTalkTimeOutbound+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentWrapUp+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentHold+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentHandling+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentBusy+"%");%></b></font></td>
			</tr>
 			<%
				ssTotLoginTime_Ans =0;
				ssTotTalkTimeInbound = 0;
				percentTalkTimeInbound = "" ;
				ssTotTalkTimeOutbound = 0;
				percentTalkTimeOutbound ="" ;
				ssTotWrapUp = 0;
				percentWrapUp ="" ;
				ssTotHold = 0;
				percentHold ="" ;
    			ssTotHandling = 0 ;
				percentHandling ="" ;
    			ssTotBusy = 0 ;
				percentBusy ="" ;
				needOneMoreTotalRow_Ans = true;
				} 
			    if(agentInfo.totalLoginTime > 0)
			    {
				%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
						<td   align="center"><%out.write(agentInfo.time);%></td>
						<td   align="center"><%out.write(agentInfo.getPercentInboundTime());%></td>
						<td   align="center"><%out.write(agentInfo.getPercentOutboundTime());%></td>
						<td   align="center"><%out.write(agentInfo.getPercentWrapUpTime());%></td>
						<td   align="center"><%out.write(agentInfo.getPercentHoldTime());%></td>
						<td   align="center"><%out.write(agentInfo.getPercentHandlingTime());%></td>
						<td   align="center"><%out.write(agentInfo.getPercentBusyTime());%></td>
				  </tr>
				<%

			ssTotLoginTime_Ans	+=agentInfo.totalLoginTime;
			totLoginTime_Ans +=agentInfo.totalLoginTime;
			tLoginTime_Ans =agentInfo.totalLoginTime;
			ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound ;
			totTalkTimeInbound +=agentInfo.totalTalkTimeInbound ;
			tTalkTimeInbound = agentInfo.totalTalkTimeInbound ; 
			ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound ;
			totTalkTimeOutbound +=agentInfo.totalTalkTimeOutbound ;
			tTalkTimeOutbound = agentInfo.totalTalkTimeOutbound ; 
			ssTotWrapUp += agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime ;
			totWrapUp +=agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ;
			tWrapUp = agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime  ; 
			ssTotHold += agentInfo.totalHoldTime ;
			totHold +=agentInfo.totalHoldTime ;
			tHold = agentInfo.totalHoldTime ; 
			ssTotHandling += agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
			totHandling +=agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
			tHandling = agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime + agentInfo.totalHoldTime;
			ssTotBusy += agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime;
			totBusy +=agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime;
			tBusy = agentInfo.totalTalkTimeInbound + agentInfo.totalTalkTimeOutbound +agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime;
			
			    }
			}
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true)
			{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = agentInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = agentInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = agentInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = agentInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = agentInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageAnsDetData.getWord("Sub total")%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentTalkTimeInbound+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentTalkTimeOutbound+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentWrapUp+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentHold+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentHandling+"%");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentBusy+"%");%></b></font></td>
			</tr>
			<%
				  }
				if((totLoginTime_Ans) !=0) 
				{
					tot_percentTalkTimeInbound = agentInfo.formatDecimalDouble( ( (double)(totTalkTimeInbound*100)/totLoginTime_Ans), 2);
					tot_percentTalkTimeOutbound  = agentInfo.formatDecimalDouble( ( (double)(totTalkTimeOutbound*100)/totLoginTime_Ans), 2);
					tot_percentWrapUp = agentInfo.formatDecimalDouble( ( (double)(totWrapUp*100)/totLoginTime_Ans), 2);
					tot_percentHold = agentInfo.formatDecimalDouble( ( (double)(totHold*100)/totLoginTime_Ans), 2);
					tot_percentHandling = agentInfo.formatDecimalDouble( ( (double)(totHandling*100)/totLoginTime_Ans), 2);
					tot_percentBusy = agentInfo.formatDecimalDouble( ( (double)(totBusy*100)/totLoginTime_Ans), 2);
				}
			%>
	 			<tr>
					<td   width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageAnsDetData.getWord("Total")%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentTalkTimeInbound+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentTalkTimeOutbound+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentWrapUp+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentHold +"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentHandling+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentBusy+"%");%></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<% pageAnsDetData.closeConnection(); %>
