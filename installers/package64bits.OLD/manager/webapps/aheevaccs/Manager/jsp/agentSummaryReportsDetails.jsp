<%
long tLoginTime=0 ,totLoginTime=0;
long scheduledTime =0,totscheduledTime=0;
int n_no =0, totn_no=0, n_yes=0, totn_yes =0;
long n_inbound =0, totn_inbound=0, n_outbound=0, totn_outbound =0;
long n_WrapUp =0, totn_WrapUp =0 ;
long ssTotTalkTimeInbound = 0 ,totTalkTimeInbound = 0;
long ssTotTalkTimeOutbound = 0 ,totTalkTimeOutbound = 0;
long ssTotWrapUp = 0 , totWrapUp =0;

long ssTotSingleTransfert = 0 ,totSingleTransfert = 0;
long ssTotTwoTransfert = 0 ,totTwoTransfert = 0;
long ssTotTransfert = 0 , totTransfert =0;
long n_Transfet = 0 , totn_transfert =0;


long ssTotHold = 0 , totHold = 0 ;
long ssTotWait = 0 , totWait = 0 ;
long n_Hold = 0 , totn_Hold = 0 ;
long n_Wait = 0 , totn_Wait = 0 ;

long ssTotNotReady = 0 , totNotReady =0;
long n_NotReady = 0 , totn_NotReady =0;
String percentGap="0.00%", percentAdherence ="0.00%";
String percentNRR="0.00%", percentTransfert ="0.00%";
String callsPerHour="0.00%";
String productivity="" ;
String avgHandle="00:00:00";
String avgWrapUp="00:00:00";

String avgNRR="00:00:00";
String avgInbound="00:00:00";
String avgOutbound="00:00:00";
String avgTransfert="00:00:00";
String avgHold="00:00:00";
String avgWait="00:00:00";

String percentOutIn="0.00%";
String tempGrpOrLeader_name="", writeName="";
long GroupForAgent =1, first =1;
long total = 0;
double NbCallsPerHour =0;
agentInfo =null;
HashMap map_Agent_forProduc = (HashMap)beanAgent.map_Agent_forProduc;
HashMap map_AgentSummaryNRR = (HashMap)beanAgent.map_AgentSummaryNRR;

%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
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
								try { 
								if(reportSummary.compareTo("leader")==0)
									out.write(beanAgent.getLeaderName(grpOrLeadId)); 
								if(reportSummary.compareTo("group")==0)
									out.write(beanAgent.getGroupName(grpOrLeadId)); 
									}
								catch(Exception e) { out.write(""); }
							%>[  <% out.println(grpOrLeadId); %> 	 ]
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
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write("<script>document.write(MultiArray[\"Daily\"][lang])</script>");
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write("<script>document.write(MultiArray[\"Monthly\"][lang])</script>");						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write("<script>document.write(MultiArray[\"Yearly\"][lang])</script>");
								}
							%>
							<script>document.write(MultiArray["Summary report"][lang])</script> &nbsp; <script>document.write(MultiArray["for"][lang])</script><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<script>document.write(MultiArray["To"][lang])</script>
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
								out.write("<script>document.write(MultiArray[\"Data\"][lang])</script>");
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
			  	<td width="19%"  align="center"><script>document.write(MultiArray["Agent name"][lang])</script></td>
				<td width="9%"  align="center"><script>document.write(MultiArray["Scheduled"][lang])</script></td>
				<td width="9%"  align="center"><script>document.write(MultiArray["Actual"][lang])</script></td>
				<td width="9%"  align="center" colspan="2"><script>document.write(MultiArray["Inbound calls"][lang])</script></td>
				<td width="9%"  align="center" colspan="2"><script>document.write(MultiArray["Outbound calls"][lang])</script></td>
				<td width="9%"  align="center" colspan="2"><script>document.write(MultiArray["Wrap up calls"][lang])</script></td>
				<td width="9%"  align="center" colspan="2"><script>document.write(MultiArray["Hold calls"][lang])</script></td>
				<td width="9%"  align="center" colspan="2"><script>document.write(MultiArray["Waiting calls"][lang])</script></td>
				<td width="9%"  align="center" colspan="2"><script>document.write(MultiArray["Transfer calls"][lang])</script></td>
				<td width="9%"  align="center" colspan="2"><script>document.write(MultiArray["Not ready calls"][lang])</script></td>
			  </tr>
 		<tr class="reportsNRRCol">
 			<td align="center"><%out.write(" ");%></td>
			<td align="center"><%out.write(" ");%></td>
			<td align="center"><%out.write(" ");%></td>
			<td  align="center"><%out.write("NB");%></td>
			<td  align="center"><%out.write("Time");%></td>
			<td  align="center"><%out.write("NB");%></td>
			<td  align="center"><%out.write("Time");%></td>
			<td  align="center"><%out.write("NB");%></td>
			<td  align="center"><%out.write("Time");%></td>
			<td  align="center"><%out.write("NB");%></td>
			<td  align="center"><%out.write("Time");%></td>
			<td  align="center"><%out.write("NB");%></td>
			<td  align="center"><%out.write("Time");%></td>
			<td  align="center"><%out.write("NB");%></td>
			<td  align="center"><%out.write("Time");%></td>
			<td  align="center"><%out.write("NB");%></td>
			<td  align="center"><%out.write("Time");%></td>
		  </tr>
			  
<%
	for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) {
			 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
			//System.out.println("grpOrLeader_name----: "+ agentInfo.grpOrLeader_name);
		%>
		<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
			<td align="center"><%out.write(beanAgent.getAgentFullName(agentInfo.agent_id)+" ["+agentInfo.agent_id+"] ");%></td>
			<td align="center"><%out.write(agentInfo.getScheduled());%></td>
			<td align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));%></td>
			<td  align="center"><%out.write(Long.toString(agentInfo.n_Inbound));%></td>
			<td  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));%></td>
			<td  align="center"><%out.write(Long.toString(agentInfo.n_Outbound));%></td>
			<td  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));%></td>
			<td  align="center"><%out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up));%></td>
			<td  align="center"><%out.write(agentInfo.buildReadableTime((agentInfo.totalWrapUpInTime+ agentInfo.totalWrapUpOutTime)));%></td>

			<td  align="center"><%out.write(Long.toString(agentInfo.n_hold));%></td>
			<td  align="center"><%out.write(agentInfo.buildReadableTime((agentInfo.totalHoldTime)));%></td>
			<td  align="center"><%out.write(Long.toString(agentInfo.n_Wait));%></td>
			<td  align="center"><%out.write(agentInfo.buildReadableTime((agentInfo.totalWaitTime)));%></td>


			<td  align="center"><%out.write(Long.toString(agentInfo.n_single_transfer + agentInfo.n_two_step_transfer));%></td>
			<td  align="center"><%out.write(agentInfo.buildReadableTime((agentInfo.totalSingleTransfer +agentInfo.totalTwoStepTranfer)));%></td>
			<td  align="center"><%out.write(Long.toString(agentInfo.n_NotReady));%></td>
			<td  align="center"><%out.write(agentInfo.buildReadableTime((agentInfo.totalNotReadyTime)));%></td>
		  </tr>
		  <%
		
        tLoginTime += agentInfo.totalLoginTime;   totLoginTime+= agentInfo.totalLoginTime;
		scheduledTime +=agentInfo.Scheduled ; totscheduledTime  +=agentInfo.Scheduled ;
		//n_no += agentInfo.n_no ; totn_no += agentInfo.n_no; 
		//n_yes +=agentInfo.n_yes;  totn_yes+=agentInfo.n_yes;
		n_inbound +=agentInfo.n_Inbound; totn_inbound +=agentInfo.n_Inbound;
		n_outbound +=agentInfo.n_Outbound;  totn_outbound +=agentInfo.n_Outbound; 
		ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound; totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
		ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
		
		ssTotWrapUp += agentInfo.totalWrapUpInTime ; totWrapUp += agentInfo.totalWrapUpInTime;
		ssTotWrapUp += agentInfo.totalWrapUpOutTime ; totWrapUp += agentInfo.totalWrapUpOutTime;
		n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
		totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
		
		ssTotTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		totTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		n_Transfet += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
		totn_transfert += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;

		ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
		n_NotReady += agentInfo.n_NotReady ; totn_NotReady += agentInfo.n_NotReady;
		
		totHold += agentInfo.totalHoldTime;		totn_Hold+= agentInfo.n_hold;
		totWait += agentInfo.totalWaitTime;		totn_Wait += agentInfo.n_Wait;	
		first =0; 
 		tempGrpOrLeader_name= agentInfo.grpOrLeader_name;		
    } //end for
	agentInfo = new beanAgentGlobalInfo();
	if(agentInfo !=null) 
	{
%>
		<tr>
			 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%> </b></font></td>
			 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(scheduledTime));%></font></td>
			 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(totLoginTime));%></font></td>
			 
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totn_inbound));%></font></td>
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(totTalkTimeInbound));%></font></td>
			
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totn_outbound));%></font></td>
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(totTalkTimeOutbound));%></font></td>
			
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totn_WrapUp));%></font></td>
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(totWrapUp));%></font></td>

			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totn_Hold ));%></font></td>
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(totHold));%></font></td> 
			
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totn_Wait));%></font></td>
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(totWait));%></font></td>


			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totn_transfert));%></font></td>
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(totTransfert));%></font></td> 
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totn_NotReady));%></font></td>
			<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(totNotReady));%></font></td>
		</tr>
<%

	}
	else
	{
	%>
			 <tr>
				 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%> </b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("0.00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("0.00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("0.00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("0.00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("0.00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("0.00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("0.00");%></font></td>
				<td  bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
			</tr>
			
	<%
	}
%>
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
							out.write("<script>document.write(MultiArray[\"Average\"][lang])</script>");
					tLoginTime =0;   totLoginTime=0;
					scheduledTime =0; totscheduledTime  =0;
					n_inbound =0; totn_inbound =0;
					n_outbound =0;  totn_outbound =0;
					ssTotTalkTimeInbound =0; totTalkTimeInbound =0;
					ssTotTalkTimeOutbound =0;totTalkTimeOutbound =0;
					ssTotWrapUp =0; totWrapUp =0;
					ssTotWrapUp =0; totWrapUp =0;
					n_WrapUp =0; totn_WrapUp =0;
					ssTotTransfert =0; totTransfert =0;	n_Transfet =0;totn_transfert =0;
					ssTotNotReady =0; totNotReady =0;n_NotReady =0; totn_NotReady =0;
					ssTotHold=0; totHold =0;	
					
					ssTotWait =0 ; totWait = 0 ;
					n_Hold = 0; totn_Hold = 0 ;
					n_Wait = 0 ; totn_Wait = 0 ;
	
					first =0; 
					tempGrpOrLeader_name= "";	
								
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
			  	<td width="20%"  align="center"><script>document.write(MultiArray["Agent name"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Inbound time"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Outbound time"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Wrap up time"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Hold time"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Handling time"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Waiting time"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Transfer time"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Not ready time"][lang])</script></td>
				
			  </tr>
<%
	for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) {
			 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
			//System.out.println("grpOrLeader_name----: "+ agentInfo.grpOrLeader_name);
		%>
		<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
			<td align="center"><%out.write(beanAgent.getAgentFullName(agentInfo.agent_id)+" ["+agentInfo.agent_id+"] ");%></td>
			<!--<td align="center"><%//out.write(agentInfo.getScheduled());%></td>
			<td align="center"><%//out.write(agentInfo.buildReadableTime((agentInfo.totalLoginTime)));%></td>-->
			<td  align="center"><%out.write(agentInfo.getAvgTalktimeInbound());%></td>
			<td align="center"><%out.write(agentInfo.getAvgTalktimeOutbound());%></td>
			<td align="center"><%out.write(agentInfo.getAvgWrapUpTime());%></td>
			<td align="center"><%out.write(agentInfo.getAvgTalktimeHold());%></td>
			<td align="center"><%out.write(agentInfo.getAvgHandlingTime());%></td>
			<td align="center"><%out.write(agentInfo.getAvgWaitingTime());%></td>
			<td align="center"><%out.write(agentInfo.getAvgTransferTime());%></td>
			<td align="center"><%out.write(agentInfo.getAvgNotReadyTime() );%></td>
			
		  </tr>
		  <%
		
        tLoginTime += agentInfo.totalLoginTime;   totLoginTime+= agentInfo.totalLoginTime;
		scheduledTime +=agentInfo.Scheduled ; totscheduledTime  +=agentInfo.Scheduled ;
		//n_no += agentInfo.n_no ; totn_no += agentInfo.n_no; 
		//n_yes +=agentInfo.n_yes;  totn_yes+=agentInfo.n_yes;
		n_inbound +=agentInfo.n_Inbound; totn_inbound +=agentInfo.n_Inbound;
		n_outbound +=agentInfo.n_Outbound;  totn_outbound +=agentInfo.n_Outbound; 
		ssTotTalkTimeInbound += agentInfo.totalTalkTimeInbound; totTalkTimeInbound += agentInfo.totalTalkTimeInbound;
		ssTotTalkTimeOutbound += agentInfo.totalTalkTimeOutbound; totTalkTimeOutbound += agentInfo.totalTalkTimeOutbound;
		
		ssTotWrapUp += agentInfo.totalWrapUpInTime ; totWrapUp += agentInfo.totalWrapUpInTime;
		ssTotWrapUp += agentInfo.totalWrapUpOutTime ; totWrapUp += agentInfo.totalWrapUpOutTime;
		n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
		totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
		
		ssTotTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		totTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		n_Transfet += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
		totn_transfert += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;

		ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
		n_NotReady += agentInfo.n_NotReady ; totn_NotReady += agentInfo.n_NotReady;
		
		totHold += agentInfo.totalHoldTime;		totn_Hold+= agentInfo.n_hold;
		totWait += agentInfo.totalWaitTime;		totn_Wait += agentInfo.n_Wait;	
		
		first =0; 
 		tempGrpOrLeader_name= agentInfo.grpOrLeader_name;		
    } //end for
	agentInfo = new beanAgentGlobalInfo();
	if(agentInfo !=null) 
	{
		
		avgHandle="00:00:00";avgWrapUp="00:00:00";
		avgNRR="00:00:00";avgInbound="00:00:00";
		avgOutbound="00:00:00";avgTransfert="00:00:00";

		total = totn_inbound + totn_outbound;
		if(total > 0)
			avgHandle = agentInfo.buildReadableTime( (totTalkTimeInbound + totTalkTimeOutbound + totWrapUp + totHold) / total);
		if (total > 0)
			avgWrapUp = agentInfo.buildReadableTime( totWrapUp / totn_WrapUp);
		  //avgWrapUp = agentInfo.buildReadableTime( total);
		if (totn_NotReady > 0)
		  avgNRR = agentInfo.buildReadableTime( totNotReady / totn_NotReady);
		if (totn_inbound > 0)
		  avgInbound = agentInfo.buildReadableTime( totTalkTimeInbound / totn_inbound);
		if (totn_outbound > 0)
		  avgOutbound = agentInfo.buildReadableTime( totTalkTimeOutbound / totn_outbound);
		if (totn_transfert > 0)
		  avgTransfert = agentInfo.buildReadableTime( totTransfert / totn_transfert);
		if(total >0)
			avgHold = agentInfo.buildReadableTime( totHold / total);
		if(totn_Wait >0)
			avgWait = agentInfo.buildReadableTime( totWait / totn_Wait);

%>
				<tr>
					 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%> </b></font></td>
					 <!--<td bgcolor="#FFECF5" align="center"><font  color="#000000"><%//out.write(agentInfo.buildReadableTime(scheduledTime));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%//out.write(agentInfo.buildReadableTime(totLoginTime));%></font></td>-->
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(avgInbound);%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgOutbound);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgWrapUp);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgHold);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgHandle);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgWait);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgTransfert);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(avgNRR);%></b></font></td>
				</tr>
<%

	}
	else
	{
	%>
			 <tr>
				 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%> </b></font></td>
				 <!--<td bgcolor="#FFECF5" align="center"><font  color="#000000"><%//out.write("00:00:00");%></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%//out.write("00:00:00");%></font></td>-->
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("00:00:00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("00:00:00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("00:00:00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("00:00:00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("00:00:00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("00:00:00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("00:00:00");%></b></font></td>
			</tr>
			
	<%
	}
%>
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
								out.write("<script>document.write(MultiArray[\"Percentages\"][lang])</script>");
					tLoginTime =0;   totLoginTime=0;
					scheduledTime =0; totscheduledTime  =0;
					n_inbound =0; totn_inbound =0;
					n_outbound =0;  totn_outbound =0;
					ssTotTalkTimeInbound =0; totTalkTimeInbound =0;
					ssTotTalkTimeOutbound =0;totTalkTimeOutbound =0;
					ssTotWrapUp =0; totWrapUp =0;
					ssTotWrapUp =0; totWrapUp =0;
					n_WrapUp =0; totn_WrapUp =0;
					ssTotTransfert =0; totTransfert =0;	n_Transfet =0;totn_transfert =0;
					ssTotNotReady =0; totNotReady =0;n_NotReady =0; totn_NotReady =0;
					ssTotHold=0; totHold =0;		
					first =0; 
					tempGrpOrLeader_name= "";	
					long totWrapUpForProduc =0;
					long totNrrForProduc=0;
					long totlogForProduc=0;
								
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
			  	<td width="20%"  align="center"><script>document.write(MultiArray["Agent name"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Scheduled"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Actual"][lang])</script></td>
				<td width="8%"  align="center"><script>document.write(MultiArray["Adherence"][lang])</script></td>
				<td width="8%"  align="center"><script>document.write(MultiArray["GAP"][lang])</script></td>
				<td width="8%"  align="center"><script>document.write(MultiArray["Productivity"][lang])</script></td>
				<td width="8%"  align="center"><script>document.write(MultiArray["Calls/hour"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Calls out/in"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Transfer"][lang])</script></td>
				<td width="8%"  align="center"><script>document.write(MultiArray["Not ready"][lang])</script></td>
			  </tr>
<%
	for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) {
			 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
			//System.out.println("grpOrLeader_name----: "+ agentInfo.grpOrLeader_name);
			String key="";
			productivity="";
			key = agentInfo.agent_id;
			beanAgentGlobalInfoReport.agentData tmpNrrElt = (beanAgentGlobalInfoReport.agentData)map_Agent_forProduc.get(key);
			//System.out.println("\n************** agt_id----: "+ tmpNrrElt.agt_id);
			//System.out.println("totWrapUpForProduc----: "+ Long.toString(tmpNrrElt.totWrapUpForProduc));
			//System.out.println("totNrrForProduc----: "+ Long.toString(tmpNrrElt.totNrrForProduc));
			//System.out.println("totLoginTime----: "+ Long.toString(tmpNrrElt.totLoginTime));
			if(tmpNrrElt.totLoginTime >0)
			{
				productivity =agentInfo.formatDecimalDouble(100*(1-((double)(tmpNrrElt.totWrapUpForProduc+tmpNrrElt.totNrrForProduc)/ (double)tmpNrrElt.totLoginTime)),2)+" %";
			}
			totWrapUpForProduc +=tmpNrrElt.totWrapUpForProduc;
			totNrrForProduc +=tmpNrrElt.totNrrForProduc;
			totlogForProduc +=tmpNrrElt.totLoginTime;
		%>
		<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
			<td align="center"><%out.write(beanAgent.getAgentFullName(agentInfo.agent_id)+" ["+agentInfo.agent_id+"] ");%></td>
			<td align="center"><%out.write(agentInfo.getScheduled());%></td>
			<td align="center"><%out.write(agentInfo.buildReadableTime((agentInfo.totalLoginTime)));%></td>
			<td  align="center"><%out.write(agentInfo.getAdherence());%></td>
			<td align="center"><%out.write(agentInfo.getPercentActualScheduledLogin());%></td>
			<td align="center"><%out.write(productivity);%></td>
			<td align="center"><%out.write(agentInfo.getCallPerHour());%></td>
			<td align="center"><%out.write(agentInfo.getPercentOutIn());%></td>
			<td align="center"><%out.write(agentInfo.getPercentTransferTime());%></td>
			<td align="center"><%out.write(agentInfo.getPercentNotReadyTime());%></td>
		  </tr>
		  <%
		
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
		n_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up ; 
		totn_WrapUp += agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up; 
		
		ssTotTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		totTransfert += agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer ;
		n_Transfet += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;
		totn_transfert += agentInfo.n_single_transfer + agentInfo.n_two_step_transfer ;

		ssTotNotReady += agentInfo.totalNotReadyTime ; totNotReady += agentInfo.totalNotReadyTime;
		n_NotReady += agentInfo.n_NotReady ; totn_NotReady += agentInfo.n_NotReady;
		
		ssTotHold += agentInfo.totalHoldTime; totHold += agentInfo.totalHoldTime;
		
		first =0; 
 		tempGrpOrLeader_name= agentInfo.grpOrLeader_name;		
    } //end for
	agentInfo = new beanAgentGlobalInfo();
	if(agentInfo !=null) 
	{
		percentGap="0.00%"; percentAdherence ="0.00%";callsPerHour="0.00%";
		 productivity="0.00" ;
		 percentOutIn="0.00%"; 
		 percentNRR="0.00%"; percentTransfert ="0.00%";

		//System.out.println("agentInfo no null");	
		total = totn_inbound + totn_outbound;
		if (totn_no + totn_yes > 0) 
		  percentAdherence = agentInfo.formatDecimalDouble((( (double)totn_yes * 100) / (totn_yes + totn_no)), 2) + " %";
		if (totscheduledTime > 0) 
			percentGap = agentInfo.formatDecimalDouble(((double) ( (totLoginTime - totscheduledTime) * 100) / totscheduledTime ), 2) + " %";					
		if (totLoginTime > 3600) 
		  NbCallsPerHour = (double) total / ( (double) totLoginTime / 3600);
		else  
		  NbCallsPerHour = total;
		callsPerHour = agentInfo.formatDecimalDouble( (NbCallsPerHour + 0.005), 2);
		if(totLoginTime >0)
		{
			//productivity =agentInfo.formatDecimalDouble(100*(1-((double)(totWrapUp+totNotReady)/ (double)totLoginTime)),2)+" %";
			percentNRR = agentInfo.formatDecimalDouble((( (double)totNotReady * 100) / (totLoginTime)), 2) + " %";
			percentTransfert = agentInfo.formatDecimalDouble((( (double)totTransfert * 100) / (totLoginTime)), 2) + " %";
		}
		if (totn_inbound > 0) 
		  percentOutIn = agentInfo.formatDecimalDouble((( (double) totn_outbound * 100) / totn_inbound), 2) ;//+ " %";
		
			System.out.println(" wwwwwwwwwwwwwwwwwwwwww      percentTransfert----: "+ percentTransfert);
			System.out.println(" wwwwwwwwwwwwwwwwwwwwww      percentNRR ----: "+ percentNRR);

			if(totLoginTime >0)
			{
				productivity =agentInfo.formatDecimalDouble(100*(1-((double)(totWrapUpForProduc+totNrrForProduc)/ (double)totLoginTime)),2)+" %";
			}
	
%>
				<tr>
					 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%> </b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(scheduledTime));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(agentInfo.buildReadableTime(totLoginTime));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(percentAdherence);%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(percentGap);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(productivity );%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(callsPerHour);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(percentOutIn);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(percentTransfert);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(percentNRR);%></b></font></td>
				</tr>
<%

	}
	else
	{
	%>
			 <tr>
				 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%> </b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("00:00:00");%></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write("0.00%");%></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00%");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00%");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00%");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00%");%></b></font></td>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write("0.00%");%></b></font></td>
			</tr>
			
	<%
	}
%>
			</table>
		</td>
	</tr>
	
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left"><b>
					  <%
								out.write("<script>document.write(MultiArray[\"Not ready reason\"][lang])</script>");
								long [] totNotReadyReason =null;
								long [] tot_nNotReadyReason =null;
								percentNRR="";
								totNotReady =0; totn_NotReady =0;
   								int nb_NRR = beanAgent.m_vAllNRR.size();
								String lg_table="";
								if(nb_NRR < 6) lg_table = Integer.toString(100 -(6-nb_NRR)*10)+"%";
								else  lg_table = Integer.toString(100)+"%";
							%>
					</b></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="<%out.write(lg_table);%>" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName">
				<td width="15%" align="center" style="border-style:solid; border-right-color:#949494"> <script>document.write(MultiArray["Agent name"][lang])</script> </td>
				
				<%
				   totNotReadyReason = new long[beanAgent.m_vAllNRR.size()];
				   tot_nNotReadyReason = new long[beanAgent.m_vAllNRR.size()];
				   
					for(int k =0; k < beanAgent.m_vAllNRR.size(); k++)
					{ 
						//creer autant de variable que de raison
					  totNotReadyReason[k]=0;
					   tot_nNotReadyReason[k] =0;
					  
					%> 
						<td width="6%" colspan="3" align="center" style="border-style:solid; border-right-color: #949494"><%=beanAgent.m_vAllNRR.elementAt(k) %></td>
					<%
					}	
				%>
			  </tr>
			  
			  <tr class="reportsNRRCol">
				<td width="15%" align="center" style="border-style:solid; border-right-color:#949494"><% out.write(" "); %></td>
				
				<%
					for(int k =0; k < beanAgent.m_vAllNRR.size(); k++)
					{ 
					%> 
						<td width="2%" align="center" style="border-style:solid;border-right-color:#CCCCCC"><% out.write("Time"); %></td>
						<td width="2%" align="center" style="border-style:solid; border-right-color:#CCCCCC"><% out.write("Nb"); %></td>
						<td width="2%" align="center" style="border-style:solid;border-right-color: #949494"><% out.write(" % "); %></td>
					<%
					}	
				%>
			  </tr>
			<%
			for (int i = 0; i < beanAgent.m_vAllDetails.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgent.m_vAllDetails.elementAt(i);
				 //System.out.println("-------agentInfo.time-------"+ agentInfo.time);
				totNotReady += agentInfo.totalNotReadyTime ;
		%>
			<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
				<td   align="center" style="border-style:solid; border-right-color:#949494"><%out.write(beanAgent.getAgentFullName(agentInfo.agent_id)+" ["+agentInfo.agent_id+"] ");%></td>
				<%
					for (int n = 0; n < beanAgent.m_vAllNRR.size(); n++) 
					{ 
						String key="";
						String nreadyreason = (String)beanAgent.m_vAllNRR.elementAt(n);
						key = agentInfo.agent_id+"-"+ nreadyreason;
						//System.out.println("**********key************: "+key);
						beanAgentGlobalInfoReport.nrrData tmpNrrElt = (beanAgentGlobalInfoReport.nrrData)map_AgentSummaryNRR.get(key);
						if(tmpNrrElt != null)
						{
						totNotReadyReason[n] += tmpNrrElt.nrrDuration;
						tot_nNotReadyReason[n] += tmpNrrElt.nrrCount;
						//System.out.println("**********------------tmpNrrElt NOT NULL!!!!!!!!!!!!!!!!: ");
						%>
				<td align="center" style="border-style:solid; border-right-color:#CCCCCC"><% out.write( agentInfo.buildReadableTime(tmpNrrElt.nrrDuration)); 						 						%></td>
				<td   align="center" style="border-style:solid; border-right-color:#CCCCCC"> <% out.write(Long.toString(tmpNrrElt.nrrCount));  %>	</td>	
				<td   align="center" style="border-style:solid; border-right-color:#949494"> <% out.write(tmpNrrElt.nrrPercent);  %>	</td>						
						<%	
						
						}
						else
						{
						totNotReadyReason[n] += 0;
						tot_nNotReadyReason[n] += 0;
						//System.out.println("**********------------tmpNrrElt NULL???????????????????: ");
						%>
				<td align="center" style="border-style:solid; border-right-color:#CCCCCC"><% out.write( "00:00:00"); 						 						%></td>
				<td   align="center" style="border-style:solid; border-right-color:#CCCCCC"> <% out.write("0");  %>	</td>	
				<td   align="center" style="border-style:solid; border-right-color:#949494"> <% out.write("0.00");  %>	</td>						
						<%	
						
						}
			} //fin for n  %>
	  </tr>
		<%
	} //fin for
	agentInfo = new beanAgentGlobalInfo();
			  
		%>
			<tr>
				<td   width="15%" bgcolor="#FFECF5" align="center" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
				 <%
				for (int n = 0; n < beanAgent.m_vAllNRR.size(); n++) 
				{ 
				if((totNotReady) !=0) 
				{
					percentNRR = agentInfo.formatDecimalDouble( ( (double)((totNotReadyReason[n])*100)/totNotReady), 2);
				}
				else 
				 percentNRR ="0.00";
				
					%>
				<td align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write( agentInfo.buildReadableTime(totNotReadyReason[n])); %></b></font></td>

				<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write(""+ tot_nNotReadyReason[n]);  %></b></font></td>	
				<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b>
				  <% out.write(percentNRR);  %>
				</b></font></td>						
									
						<%	
					} //fin for n  %>
			  </tr>
			</table>
		</td>
	</tr>	


	
	
</table>

