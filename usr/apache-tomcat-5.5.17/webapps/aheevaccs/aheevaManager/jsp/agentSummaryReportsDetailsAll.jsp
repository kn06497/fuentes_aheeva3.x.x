<%@page contentType="text/html"%>
<%@page import = "aheevaManager.ressources.*" %>
<%

	beanManagerData pageDataAgent = new beanManagerData();
	pageDataAgent.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageDataAgent.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));


long tLoginTime=0 ,totLoginTime=0;
long scheduledTime =0,totscheduledTime=0;
int n_no =0, totn_no=0, n_yes=0, totn_yes =0;
long n_inbound =0, totn_inbound=0, n_outbound=0, totn_outbound =0;
long n_WrapUp =0, totn_WrapUp =0 ;
long ssTotTalkTimeInbound = 0 ,totTalkTimeInbound = 0;
long ssTotTalkTimeOutbound = 0 ,totTalkTimeOutbound = 0;
long ssTotWrapUp = 0 , totWrapUp =0;
long ssTotHold = 0 , totHold = 0 ;
long ssTotNotReady = 0 , totNotReady =0;
String percentGap="0.00%", percentAdherence ="0.00%";
String callsPerHour="0.00%";
String productivity="" ;
String avgHandle="00:00:00";
String avgWrapUp="00:00:00";
String percentOutIn="0.00%";
String tempGrpOrLeader_name="", writeName="";
long GroupForAgent =1, first =1;
long total = 0;
double NbCallsPerHour =0;
agentInfo =null;
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>

<table width="100%" cellpadding="0" cellspacing="0" align="center">
<%
	if( tabObj.length==1)
	{
	%>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="center">
					  <b>
							<%
								try { out.write(beanAgent.getAgentFullName(tabObj[0])); }
								catch(Exception e) { out.write(""); }
							%>
						  [
						  <% out.println(tabObj[0]); %>
					  	 ]
					  </b>
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
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td  class="reportsID" width="100%" align="center">
						<b>
							<%
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
							    
								  out.write(pageDataAgent.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageDataAgent.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageDataAgent.getWord("Yearly"));
								}
							%>
							<%=pageDataAgent.getWord("Summary report")% &nbsp; <%=pageDataAgent.getWord("for")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%=pageDataAgent.getWord("To")%>
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
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write(pageDataAgent.getWord("Data"));
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
			  <%
			  	if( tabObj.length > 1)
				{

			  %>
				<td width="15%" align="center"><% 
						if(reportSummary.compareTo("leader")==0) out.write("Leader Name");
						if(reportSummary.compareTo("group")==0) out.write("Group Name");
					%></td>
				<td width="15%"  align="center"><%=pageDataAgent.getWord("Agent name")%></td>
				<td width="9%"  align="center"><%=pageDataAgent.getWord("Scheduled")%></td>
				<td width="9%"  align="center"><%=pageDataAgent.getWord("Actual")%></td>
				<td width="7%"  align="center"><%=pageDataAgent.getWord("Adherence")%></td>
				<td width="7%"  align="center"><%=pageDataAgent.getWord("GAP")%></td>
				<td width="6%"  align="center"><%=pageDataAgent.getWord("Calls/hour")%></td>
				<td width="7%"  align="center"><%=pageDataAgent.getWord("Productivity")%></td>
				<td width="9%"  align="center"><%=pageDataAgent.getWord("Average handling time")%></td>
				<td width="9%"  align="center"><%=pageDataAgent.getWord("Average wrap up time")%></td>
				<td width="7%"  align="center"><%=pageDataAgent.getWord("Calls out/in")%></td>
				<%
				}
				if( tabObj.length == 1)
				{
				%>
				<td width="10%" align="center"><% 
						if(reportSummary.compareTo("leader")==0) out.write("Leader Name");
						if(reportSummary.compareTo("group")==0) out.write("Group Name");
					%></td>
				<td width="10%"  align="center"><%=pageDataAgent.getWord("Scheduled")%></td>
				<td width="10%"  align="center"><%=pageDataAgent.getWord("Actual")%></td>
				<td width="10%"  align="center"><%=pageDataAgent.getWord("Adherence")%></td>
				<td width="10%"  align="center"><%=pageDataAgent.getWord("GAP")%></td>
				<td width="10%"  align="center"><%=pageDataAgent.getWord("Calls/hour")%></td>
				<td width="10%"  align="center"><%=pageDataAgent.getWord("Productivity")%></td>
				<td width="10%"  align="center"><%=pageDataAgent.getWord("Average handling time")%></td>
				<td width="10%"  align="center"><%=pageDataAgent.getWord("Average wrap up time")%></td>
				<td width="10%"  align="center"><%=pageDataAgent.getWord("Calls out/in")%></td>
				<%
				}
				%>
			  </tr>
<%
	for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) {
			 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
			System.out.println("grpOrLeader_name----: "+ agentInfo.grpOrLeader_name);
			if(agentInfo.grpOrLeader_name.compareTo(tempGrpOrLeader_name) == 0) //begin if 01
			{	
				writeName =" ";
				GroupForAgent =GroupForAgent +1;
			} //end if 01
		  	else //begin else 01
			{
			
				if(first ==0 && GroupForAgent >1) //previous agent has 2 group or leader
				{
    				total = n_inbound + n_outbound;
					if(total > 0)
						avgHandle = agentInfo.buildReadableTime( (ssTotTalkTimeInbound + ssTotTalkTimeOutbound + ssTotWrapUp + ssTotHold) / total);
					if (n_WrapUp > 0)
					  avgWrapUp = agentInfo.buildReadableTime( ssTotWrapUp / n_WrapUp);
					if (n_no + n_yes > 0) {
					  percentAdherence = agentInfo.formatDecimalDouble((( (double)n_yes * 100) / (n_no + n_yes)), 2) + " %";
					}
					if (scheduledTime > 0) {
				 		percentGap = agentInfo.formatDecimalDouble(((double) ( (tLoginTime - scheduledTime) * 100) / scheduledTime ), 2) + " %";					
					}
					if (tLoginTime > 3600) 
					  NbCallsPerHour = (double) total / ( (double) tLoginTime / 3600);
					else  
					  NbCallsPerHour = total;
					callsPerHour = agentInfo.formatDecimalDouble( (NbCallsPerHour + 0.005), 2);
					productivity =agentInfo.formatDecimalDouble(100*(1-((double)(ssTotWrapUp+ssTotNotReady)/ (double)tLoginTime)),2)+" %";
					if (n_inbound > 0) 
					  percentOutIn = agentInfo.formatDecimalDouble((( (double) n_outbound * 100) / n_inbound), 2) + " %";
  
  					if( tabObj.length > 1) 
					{
					%>
					<tr> 
						 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%=pageDataAgent.getWord("Sub total")%> </b></font></td>
						 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write(" ");%> </b></font></td>
						 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(scheduledTime));%></font></td>
						 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(tLoginTime));%></font></td>
						 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(percentAdherence);%></font></td>
						 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(percentGap);%></b></font></td>
						 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(callsPerHour);%></b></font></td>
						 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(productivity);%></b></font></td>
						 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgHandle);%></b></font></td>
						 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgWrapUp);%></b></font></td>
						 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(percentOutIn);%></b></font></td>
					</tr>
					<%
					} 
					} //end previous agent has 2 group or leader
					GroupForAgent =1;
					tLoginTime=0; scheduledTime =0;
					n_no =0; n_yes=0; percentAdherence =""; 
					n_inbound =0; n_outbound =0;
					ssTotTalkTimeInbound = 0 ;
					ssTotTalkTimeOutbound = 0 ;
					ssTotWrapUp = 0 ;
					ssTotHold = 0;
					n_WrapUp =0 ;
					percentGap="0.00%"; callsPerHour="0.00%";
					percentAdherence ="0.00%";
					productivity=""; avgHandle="00:00:00"; avgWrapUp="00:00:00"; percentOutIn="0.00%";
					writeName =agentInfo.grpOrLeader_name;
				
		   } //end else 01

	if( tabObj.length > 1) 
	{%>
	<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");%> >
		<td align="center"><font color="#800000"><%out.write(writeName);%></font></td>
		<td    align="center"><%out.write(agentInfo.last_name +" "+agentInfo.first_name);%></td>
		<td align="center"><%out.write(agentInfo.getScheduled());%></td>
		<td align="center"><%out.write(agentInfo.buildReadableTime((agentInfo.totalLoginTime)));%></td>
		<td  align="center"><%out.write(agentInfo.getAdherence());%></td>
		<td align="center"><%out.write(agentInfo.getPercentActualScheduledLogin());%></td>
		<td align="center"><%out.write(agentInfo.getCallPerHour());%></td>
		<td align="center"><%out.write(agentInfo.getProductivityRatio());%></td>
		<td align="center"><%out.write(agentInfo.getAvgHandlingTime());%></td>
		<td align="center"><%out.write(agentInfo.getAvgWrapUpTime() );%></td>
		<td align="center"><%out.write(agentInfo.getPercentOutIn());%></td>
	  </tr>
<%
		}
		if( tabObj.length == 1)
		{%>
		<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
			<td align="center"><font color="#800000"><%out.write(writeName);%></font></td>
			<td align="center"><%out.write(agentInfo.getScheduled());%></td>
			<td align="center"><%out.write(agentInfo.buildReadableTime((agentInfo.totalLoginTime)));%></td>
			<td  align="center"><%out.write(agentInfo.getAdherence());%></td>
			<td align="center"><%out.write(agentInfo.getPercentActualScheduledLogin());%></td>
			<td align="center"><%out.write(agentInfo.getCallPerHour());%></td>
			<td align="center"><%out.write(agentInfo.getProductivityRatio());%></td>
			<td align="center"><%out.write(agentInfo.getAvgHandlingTime());%></td>
			<td align="center"><%out.write(agentInfo.getAvgWrapUpTime() );%></td>
			<td align="center"><%out.write(agentInfo.getPercentOutIn());%></td>
		  </tr>
		  <%
		}
		
        tLoginTime += agentInfo.totalLoginTime;   totLoginTime+= agentInfo.totalLoginTime;
		scheduledTime +=agentInfo.Scheduled ; totscheduledTime  +=agentInfo.Scheduled ;
		n_no += agentInfo.n_no ; totn_no += agentInfo.n_no; 
		n_yes +=agentInfo.n_yes;  totn_yes+=agentInfo.n_yes;
		n_inbound +=agentInfo.n_Inbound; totn_inbound +=agentInfo.n_Inbound;
		n_outbound +=agentInfo.n_Outbound;  totn_outbound +=agentInfo.n_Outbound; 
		ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound; totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
		ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
		ssTotWrapUp += agentInfo.totalWrapUpInTime ; totWrapUp += agentInfo.totalWrapUpInTime;
		ssTotWrapUp += agentInfo.totalWrapUpOutTime ; totWrapUp += agentInfo.totalWrapUpOutTime;
		ssTotHold += agentInfo.totalHoldTime; totHold += agentInfo.totalHoldTime;
		n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
		totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
		ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
		first =0; 
 		tempGrpOrLeader_name= agentInfo.grpOrLeader_name;		
    } //end for
	agentInfo = new beanAgentGlobalInfo();
	if(agentInfo !=null) 
	{
		System.out.println("agentInfo no null");	
		total = totn_inbound + totn_outbound;
		if(total > 0)
			avgHandle = agentInfo.buildReadableTime( (totTalkTimeInbound + totTalkTimeOutbound + totWrapUp + totHold) / total);
		if (totn_WrapUp > 0)
		  avgWrapUp = agentInfo.buildReadableTime( totWrapUp / totn_WrapUp);
		if (totn_no + totn_yes > 0) 
		  percentAdherence = agentInfo.formatDecimalDouble((( (double)totn_yes * 100) / (totn_yes + n_yes)), 2) + " %";
		if (totscheduledTime > 0) 
			percentGap = agentInfo.formatDecimalDouble(((double) ( (totLoginTime - totscheduledTime) * 100) / totscheduledTime ), 2) + " %";					
		if (totLoginTime > 3600) 
		  NbCallsPerHour = (double) total / ( (double) totLoginTime / 3600);
		else  
		  NbCallsPerHour = total;
		callsPerHour = agentInfo.formatDecimalDouble( (NbCallsPerHour + 0.005), 2);
		productivity =agentInfo.formatDecimalDouble(100*(1-((double)(totWrapUp+totNotReady)/ (double)totLoginTime)),2)+" %";
		if (totn_inbound > 0) 
		  percentOutIn = agentInfo.formatDecimalDouble((( (double) totn_outbound * 100) / totn_inbound), 2) + " %";

%>
				<!-- <tr>
					 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%=pageDataAgent.getWord("Total")%> </b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write(" ");%> </b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(scheduledTime));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(tLoginTime));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(percentAdherence);%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(percentGap);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(callsPerHour);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(productivity);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgHandle);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgWrapUp);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(percentOutIn);%></b></font></td>
				</tr>-->
<%
	}
	else
	{
	%><!--
			 <tr>
				 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write(" ");%> </b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write(" ");%> </b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("0.00%");%></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00%");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00%");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("00:00:00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("00:00:00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00%");%></b></font></td>
			</tr>
			-->
	<%
	}
%>
			</table>
		</td>
	</tr>
</table>
<%
pageDataAgent.closeConnection();
%>
