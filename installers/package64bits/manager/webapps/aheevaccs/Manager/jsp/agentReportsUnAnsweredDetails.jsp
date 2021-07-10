<%
    long tLoginTime = 0, ssTotLoginTime = 0, totLoginTime = 0 ;
	boolean needOneMoreTotalRow = false;
    long tNotReadyTime = 0 , ssTotNotReadyTime = 0, totNotReadyTime = 0;
    long tWaitTime = 0, ssTotWaitTime = 0, totWaitTime = 0;
    long tSingleTransferTime = 0, ssTotSingleTransferTime =0 , totSingleTransferTime = 0;
    long tTwoStepTransferTime = 0, ssTotTwoStepTransferTime =0 , totTwoStepTransferTime = 0;
	long nlogin =0, tot_nlogin=0;
	long nNotReadyTime = 0 , ssNNotReadyTime = 0, tot_nNotReadyTime = 0;
    long nWaitTime = 0, ssNWaitTime = 0, tot_nWaitTime = 0;
    long nSingleTransferTime = 0, ssNSingleTransferTime =0 , tot_nSingleTransferTime = 0;
    long nTwoStepTransferTime = 0, ssNTwoStepTransferTime =0 , tot_nTwoStepTransferTime = 0;
	long avglogin =0, tot_avglogin=0;
	long avgNotReadyTime = 0 , tot_avgNotReadyTime = 0;
    long avgWaitTime = 0, tot_avgWaitTime = 0;
    long avgSingleTransferTime = 0, tot_avgSingleTransferTime = 0;
    long avgTwoStepTransferTime = 0, tot_avgTwoStepTransferTime = 0;

	String percentNotReadyTime = "" , tot_percentNotReadyTime = "";
    String percentWaitTime = "", tot_percentWaitTime = "";
    String percentSingleTransferTime = "", tot_percentSingleTransferTime = "";
    String percentTwoStepTransferTime = "", tot_percentTwoStepTransferTime = "";
	String percentNRR = "", tot_percentNRR = "";
    agentInfo =null;
	
    long [] tNotReadyReason =null;
    long [] totNotReadyReason =null;
    long [] ssTotNotReadyReason =null;
    long [] nNotReadyReason =null;
    long [] tot_nNotReadyReason =null;
    long [] ssNNotReadyReason =null;
	
	long tNotReadyTime_Nrr = 0,totNotReadyTime_Nrr = 0;
	int nb_NRR = 0;
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<table width="100%" cellpadding="0" cellspacing="0" align="center">
<%
	if(from.compareTo("agentReport") != 0)
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
								 out.write(beanAgentDetail.getAgentFullName(agentId)); 
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
							<script>document.write(MultiArray["Detail report for unanswered calls"][lang])</script><br><br>
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
<%
	}
	else
	{
	 %>
		<tr>
			<td width="100%" align="center">
				<table width="100%" align="center">
					<tr><td height="20"></td></tr>
					<tr>
						<td width="100%" align="left"><font style="background-color:#FFC5A8">
							<b><script>document.write(MultiArray["Unanswered calls"][lang])</script>				
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
							<%
								out.write("<script>document.write(MultiArray[\"Telephony data\"][lang])</script>");
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
				<td width="15%" align="center"> <script>document.write(MultiArray["Time period"][lang])</script></td>
				<td width="12%"  align="center"><script>document.write(MultiArray["Login time"][lang])</script></td>
				<td width="5%"  align="center"><script>document.write(MultiArray["Login count"][lang])</script></td>
				<td width="12%"  align="center"><script>document.write(MultiArray["Waiting time"][lang])</script></td>
				<td width="5%"  align="center"><script>document.write(MultiArray["Waiting count"][lang])</script></td>
				<td width="12%"  align="center"><script>document.write(MultiArray["Single transfer time"][lang])</script>
				<td width="5%"  align="center"><script>document.write(MultiArray["Single transfer count"][lang])</script>
				<td width="12%"  align="center"><script>document.write(MultiArray["Two step transfer time"][lang])</script>
				<td width="5%"  align="center"><script>document.write(MultiArray["Two step transfer count"][lang])</script>
				<td width="12%"  align="center"><script>document.write(MultiArray["Not ready time"][lang])</script>
				<td width="5%"  align="center"><script>document.write(MultiArray["Not ready count"][lang])</script>
			  </tr>
<%
    for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) {
         agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
%>
 			<% if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) {%>
			 <tr>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tLoginTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nlogin));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tWaitTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nWaitTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tSingleTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nSingleTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tTwoStepTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nTwoStepTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tNotReadyTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nNotReadyTime));%></b></font></td>
			</tr>
 			<%
				tLoginTime = 0;
				tNotReadyTime = 0;
    			tWaitTime = 0;
				tSingleTransferTime = 0;
				tTwoStepTransferTime = 0;
				nlogin =0;
				nNotReadyTime = 0 ;
				nWaitTime = 0;
				nSingleTransferTime = 0;
				nTwoStepTransferTime = 0;
				needOneMoreTotalRow = true;
			 }
 		 if(agentInfo.totalLoginTime > 0){
		%>
	<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");%> >
		<td    align="center"><%out.write(agentInfo.time);%></td>
		<td width="12%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_login));%></td>
		<td width="12%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalWaitTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_Wait));%></td>
		<td width="12%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalSingleTransfer));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_single_transfer));%></td>
		<td width="12%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalTwoStepTranfer));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_two_step_transfer));%></td>
		<td width="12%"  align="center"><%out.write(agentInfo.buildReadableTime(agentInfo.totalNotReadyTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(agentInfo.n_NotReady));%></td>
	  </tr>
<%
    tLoginTime += agentInfo.totalLoginTime;   totLoginTime += agentInfo.totalLoginTime;
	tNotReadyTime +=agentInfo.totalNotReadyTime ;  totNotReadyTime +=agentInfo.totalNotReadyTime ;
	 tWaitTime +=agentInfo.totalWaitTime  ;  totWaitTime +=agentInfo.totalWaitTime  ; 
	 tSingleTransferTime +=agentInfo.totalSingleTransfer  ;  totSingleTransferTime +=agentInfo.totalSingleTransfer ; 
	 tTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ;  totTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ; 

     nlogin += agentInfo.n_login; tot_nlogin += agentInfo.n_login;
	 nNotReadyTime +=agentInfo.n_NotReady  ;  tot_nNotReadyTime +=agentInfo.n_NotReady  ; 
	 nWaitTime +=agentInfo.n_Wait  ;  tot_nWaitTime +=agentInfo.n_Wait  ; 
	 nSingleTransferTime +=agentInfo.n_single_transfer  ;  tot_nSingleTransferTime +=agentInfo.n_single_transfer ; 
	 nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; tot_nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; 
        }
    }
 	agentInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true){
	%>
			 <tr>
				 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Sub total\"][lang])</script>");%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tLoginTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nlogin));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tWaitTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nWaitTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tSingleTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nSingleTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tTwoStepTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nTwoStepTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tNotReadyTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nNotReadyTime));%></b></font></td>
			</tr>
	<%
		  }
	%>
			 <tr>
				 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totLoginTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_nlogin));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totWaitTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_nWaitTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totSingleTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_nSingleTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totTwoStepTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_nTwoStepTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(totNotReadyTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_nNotReadyTime));%></b></font></td>
			</tr>
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
								needOneMoreTotalRow = false;
							    tNotReadyTime = 0; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								nb_NRR = beanAgentDetail.m_vAllNRR.size();
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
				<td width="15%" align="center" style="border-style:solid; border-right-color:#949494"> <script>document.write(MultiArray["Time period"][lang])</script> </td>
				<%
				   tNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   totNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   nNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   tot_nNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   ssNNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
				   ssTotNotReadyReason = new long[beanAgentDetail.m_vAllNRR.size()];
					for(int k =0; k < beanAgentDetail.m_vAllNRR.size(); k++)
					{ 
					  tNotReadyReason[k] = 0;
					  totNotReadyReason[k]=0;
					   nNotReadyReason[k] =0;
					   tot_nNotReadyReason[k] =0;
					   ssNNotReadyReason[k] =0;
					   ssTotNotReadyReason[k] =0;
					%> 
						<td width="6%" colspan="3" align="center" style="border-style:solid; border-right-color: #949494"><%=beanAgentDetail.m_vAllNRR.elementAt(k) %></td>
					<%
					}	
				%>
			  </tr>
			  <tr class="reportsNRRCol">
				<td width="15%" align="center" style="border-style:solid; border-right-color:#949494"><% out.write(" "); %></td>
				
				<%
					for(int k =0; k < beanAgentDetail.m_vAllNRR.size(); k++)
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
			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				 System.out.println("-------agentInfo.time-------"+ agentInfo.time);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
			%>
		 	<tr>
			 	<td width="15%" bgcolor="#FFECF5" align="center" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
				 <%
				for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
				{ 
						if((ssTotNotReadyTime) !=0) 
						{
							percentNRR = agentInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
						}
						else 
						 percentNRR ="0.00";
					%>
					<td align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write( agentInfo.buildReadableTime(ssTotNotReadyReason[n])); %></b></font></td>
					<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write(""+ ssNNotReadyReason[n]);  %></b></font></td>	
					<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><% out.write(percentNRR);  %></b></font></td>						
										
					<%	
					ssNNotReadyReason[n] =0;
					ssTotNotReadyReason[n] =0;
		}%>
		</tr>
		<%
			ssTotNotReadyTime =0;
			percentNRR = "" ;
			needOneMoreTotalRow = true;
		}
			tNotReadyTime = agentInfo.totalNotReadyTime ; 
			totNotReadyTime += agentInfo.totalNotReadyTime ;
			ssTotNotReadyTime +=agentInfo.totalNotReadyTime ;
		%>
			<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
				<td   align="center" style="border-style:solid; border-right-color:#949494"><%out.write(agentInfo.time);%></td>
				<%
					for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
					{ 
						String key="";
						String nreadyreason = (String)beanAgentDetail.m_vAllNRR.elementAt(n);
						key = agentInfo.datehour+"-"+ nreadyreason;
						beanAgentDetailsInfoReport.nrrdata tmpNrrElt = (beanAgentDetailsInfoReport.nrrdata)mapNRR.get(key);

						if(tmpNrrElt != null)
						{
						tNotReadyReason[n] = tmpNrrElt.nrrtime;	
						totNotReadyReason[n] += tmpNrrElt.nrrtime;
						ssTotNotReadyReason[n] += tmpNrrElt.nrrtime;
						nNotReadyReason[n] = tmpNrrElt.nrrcount;
						tot_nNotReadyReason[n] += tmpNrrElt.nrrcount;
						ssNNotReadyReason[n] += tmpNrrElt.nrrcount;
						}
						else
						{
						tNotReadyReason[n] = 0;	
						totNotReadyReason[n] += 0;
						ssTotNotReadyReason[n] += 0;
						nNotReadyReason[n] = 0;
						tot_nNotReadyReason[n] += 0;
						ssNNotReadyReason[n] += 0;
						}
						if(tNotReadyTime !=0)
						{
						percentNRR = agentInfo.formatDecimalDouble( ( (double)((tNotReadyReason[n])*100)/tNotReadyTime), 2);	
						}
						else 
						 percentNRR ="0.00";
						
						%>
				<td align="center" style="border-style:solid; border-right-color:#CCCCCC"><% out.write( agentInfo.buildReadableTime(tNotReadyReason[n])); 						 						%></td>
				<td   align="center" style="border-style:solid; border-right-color:#CCCCCC"> <% out.write(""+ nNotReadyReason[n]);  %>	</td>	
				<td   align="center" style="border-style:solid; border-right-color:#949494"> <% out.write(percentNRR);  %>	</td>						
						<%	
			} %>
	  </tr>
		<%
	}
	agentInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true)
	{
		%>
	 <tr>
		 <td width="15%" bgcolor="#FFECF5" align="center" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
		 <%
		for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
		{ 
				if((ssTotNotReadyTime) !=0) 
				{
					percentNRR = agentInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
				}
				else 
				 percentNRR ="0.00";
			%>
			<td align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write( agentInfo.buildReadableTime(ssTotNotReadyReason[n])); %></b></font></td>
			<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write(""+ ssNNotReadyReason[n]);  %></b></font></td>	
			<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><% out.write(percentNRR);  %></b></font></td>	
			<%
			}
			%>					
		</tr>
		<%
			} 		  
		%>
			<tr>
				<td   width="20%" bgcolor="#FFECF5" align="center" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
				 <%
				for (int n = 0; n < beanAgentDetail.m_vAllNRR.size(); n++) 
				{ 
				if((totNotReadyTime) !=0) 
				{
					tot_percentNRR = agentInfo.formatDecimalDouble( ( (double)((totNotReadyReason[n])*100)/totNotReadyTime), 2);
				}
				else 
				 tot_percentNRR ="0.00";
				
					%>
				<td align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write( agentInfo.buildReadableTime(totNotReadyReason[n])); %></b></font></td>
				<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write(""+ tot_nNotReadyReason[n]);  %></b></font></td>	
				<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b>
				  <% out.write(tot_percentNRR);  %>
				</b></font></td>						
						<%	
					} %>
			  </tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center">
				<tr><td height="24"></td>
				</tr>
				<tr>
					<td width="100%" align="left"><b>
					  <%
								out.write("<script>document.write(MultiArray[\"Average\"][lang])</script>");
								needOneMoreTotalRow = false;
								tNotReadyTime = 0 ; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								tWaitTime = 0; ssTotWaitTime = 0; totWaitTime = 0;
								tSingleTransferTime = 0; ssTotSingleTransferTime =0 ;
								totSingleTransferTime = 0;
								tTwoStepTransferTime = 0; ssTotTwoStepTransferTime =0 ;
								totTwoStepTransferTime = 0;
								nNotReadyTime = 0 ; ssNNotReadyTime = 0; tot_nNotReadyTime = 0;
								nWaitTime = 0; ssNWaitTime = 0; tot_nWaitTime = 0;
								nSingleTransferTime = 0; ssNSingleTransferTime =0 ;
								tot_nSingleTransferTime = 0;
								nTwoStepTransferTime = 0; ssNTwoStepTransferTime =0 ;
								tot_nTwoStepTransferTime = 0;
							%>
					</b></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName">
				<td width="20%" align="center"> <script>document.write(MultiArray["Time period"][lang])</script></td>
				<td width="15%"  align="center"><script>document.write(MultiArray["Waiting calls"][lang])</script></td>
				<td width="15%"  align="center"><script>document.write(MultiArray["Single transfer calls"][lang])</script></td>
				<td width="15%"  align="center"><script>document.write(MultiArray["Two step transfer calls"][lang])</script></td>
				<td width="15%"  align="center"><script>document.write(MultiArray["Not ready calls"][lang])</script></td>
			  </tr>
			<%
			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
				if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
				if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
				if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
				if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgWaitTime));%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgSingleTransferTime));%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgTwoStepTransferTime));%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgNotReadyTime));%></b></font></td>
			</tr>
 			<%
				ssTotNotReadyTime = 0;
				ssNNotReadyTime = 0;
				avgNotReadyTime = 0 ;
				ssTotWaitTime = 0;
				ssNWaitTime = 0;
				avgWaitTime = 0;
				ssTotSingleTransferTime = 0;
				ssNSingleTransferTime = 0;
				avgSingleTransferTime = 0;
				ssTotTwoStepTransferTime = 0;
				ssNTwoStepTransferTime = 0;
				avgTwoStepTransferTime = 0;
				needOneMoreTotalRow = true;
				}
			    if(agentInfo.totalLoginTime > 0)
			    {
				%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
					<td   align="center"><%out.write(agentInfo.time);%></td>
					<td   align="center"><%out.write(agentInfo.getAvgWaitingTime());%></td>
					<td   align="center"><%out.write(agentInfo.getAvgSingleTransferTime());%></td>
					<td   align="center"><%out.write(agentInfo.getAvgTwoStepTransferTime());%></td>
					<td   align="center"><%out.write(agentInfo.getAvgNotReadyTime());%></td>
				</tr>
				<%
			ssTotNotReadyTime += agentInfo.totalNotReadyTime ;
			ssNNotReadyTime += agentInfo.n_NotReady;
			totNotReadyTime +=agentInfo.totalNotReadyTime ; 
			tot_nNotReadyTime +=agentInfo.n_NotReady  ; 
			tNotReadyTime = agentInfo.totalNotReadyTime ;  
			nNotReadyTime =agentInfo.n_NotReady  ; 
			
			ssTotWaitTime += agentInfo.totalWaitTime;
			ssNWaitTime += agentInfo.n_Wait;
			totWaitTime +=agentInfo.totalWaitTime  ; 
			tot_nWaitTime +=agentInfo.n_Wait  ;
			tWaitTime =agentInfo.totalWaitTime  ;  
			nWaitTime =agentInfo.n_Wait  ;  

			ssTotSingleTransferTime += agentInfo.totalSingleTransfer;
			ssNSingleTransferTime += agentInfo.n_single_transfer;
			totSingleTransferTime +=agentInfo.totalSingleTransfer ; 
			tot_nSingleTransferTime +=agentInfo.n_single_transfer ; 
	 		tSingleTransferTime +=agentInfo.totalSingleTransfer  ;  
	 		nSingleTransferTime +=agentInfo.n_single_transfer  ; 

			ssTotTwoStepTransferTime = agentInfo.totalTwoStepTranfer;
			ssNTwoStepTransferTime = agentInfo.n_two_step_transfer;
			totTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ; 
			tot_nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; 
			tTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ;  
			nTwoStepTransferTime +=agentInfo.n_two_step_transfer ; 
			    }
			} 
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
			if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
			if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
			if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
			if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
			%>
			 		<tr>
						 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Sub total\"][lang])</script>");%></b></font></td>
						 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgWaitTime));%></b></font></td>
						 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgSingleTransferTime));%></b></font></td>
						 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgTwoStepTransferTime));%></b></font></td>
						 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(avgNotReadyTime));%></b></font></td>
					</tr>
			<%
				  }
				  if((tot_nNotReadyTime) !=0) tot_avgNotReadyTime = (totNotReadyTime/tot_nNotReadyTime);
				if((tot_nWaitTime) !=0) tot_avgWaitTime = (totWaitTime/tot_nWaitTime);
				if((tot_nSingleTransferTime) !=0) tot_avgSingleTransferTime = (totSingleTransferTime/tot_nSingleTransferTime);
				if((tot_nTwoStepTransferTime) !=0) tot_avgTwoStepTransferTime = (totTwoStepTransferTime/tot_nTwoStepTransferTime);
			%>
	 			<tr>
					<td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
					<td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_avgWaitTime));%></b></font></td>
					<td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_avgSingleTransferTime));%></b></font></td>
					<td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_avgTwoStepTransferTime));%></b></font></td>
					<td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(agentInfo.buildReadableTime(tot_avgNotReadyTime));%></b></font></td>
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
								out.write("<script>document.write(MultiArray[\"Percentages compared to login time\"][lang])</script>");
								needOneMoreTotalRow = false;
    							tLoginTime = 0; ssTotLoginTime = 0; totLoginTime = 0 ;
								tNotReadyTime = 0 ; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								tWaitTime = 0; ssTotWaitTime = 0; totWaitTime = 0;
								tSingleTransferTime = 0; ssTotSingleTransferTime =0 ;
								totSingleTransferTime = 0;
								tTwoStepTransferTime = 0; ssTotTwoStepTransferTime =0 ;
								totTwoStepTransferTime = 0;
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
				<td width="20%" align="center"> <script>document.write(MultiArray["Time period"][lang])</script></td>
				<td width="15%"  align="center"><script>document.write(MultiArray["Waiting calls"][lang])</script></td>
				<td width="15%"  align="center"><script>document.write(MultiArray["Single transfer calls"][lang])</script></td>
				<td width="15%"  align="center"><script>document.write(MultiArray["Two step transfer calls"][lang])</script></td>
				<td width="15%"  align="center"><script>document.write(MultiArray["Not ready calls"][lang])</script></td>
			  </tr>
			<%
			for (int i = 0; i < beanAgentDetail.Detail_vector.size(); i++) 
			{
				 agentInfo = (beanAgentGlobalInfo)beanAgentDetail.Detail_vector.elementAt(i);
				if(( agentInfo.time.length() >10 || agentInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime) !=0) 
				{
					percentNotReadyTime = agentInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = agentInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentWaitTime+"%");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentSingleTransferTime+"%");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentTwoStepTransferTime+"%");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentNotReadyTime+"%");%></b></font></td>
			</tr>
 			<%
				ssTotLoginTime =0;
				ssTotNotReadyTime = 0; 
				ssTotWaitTime = 0;
				ssTotSingleTransferTime =0 ;
				ssTotTwoStepTransferTime =0 ;
				percentNotReadyTime = "" ;
				percentWaitTime = "";
				percentSingleTransferTime = "";
				percentTwoStepTransferTime = "";
				needOneMoreTotalRow = true;
				} 
			    if(agentInfo.totalLoginTime > 0)
			    {
				%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
						<td   align="center"><%out.write(agentInfo.time);%></td>
						<td   align="center"><%out.write(agentInfo.getPercentWaitingTime());%></td>
						<td   align="center"><%out.write(agentInfo.getPercentSingleTransferTime());%></td>
						<td   align="center"><%out.write(agentInfo.getPercentTwoStepTranferTime());%></td>
						<td   align="center"><%out.write(agentInfo.getPercentNotReadyTime());%></td>
				  </tr>
				<%
			ssTotLoginTime	+=agentInfo.totalLoginTime;
			totLoginTime +=agentInfo.totalLoginTime;
			tLoginTime =agentInfo.totalLoginTime;
					
			ssTotNotReadyTime += agentInfo.totalNotReadyTime;
			totNotReadyTime +=agentInfo.totalNotReadyTime; ;
			tNotReadyTime = agentInfo.totalNotReadyTime; ; 

			ssTotWaitTime += agentInfo.totalWaitTime ;
			totWaitTime += agentInfo.totalWaitTime ;
			tWaitTime = agentInfo.totalWaitTime ; 

			ssTotSingleTransferTime += agentInfo.totalSingleTransfer;
			totSingleTransferTime += agentInfo.totalSingleTransfer;
			tSingleTransferTime = agentInfo.totalSingleTransfer;

			ssTotTwoStepTransferTime += agentInfo.totalTwoStepTranfer ;
			totTwoStepTransferTime +=agentInfo.totalTwoStepTranfer  ;
			tTwoStepTransferTime = agentInfo.totalTwoStepTranfer  ; 

			    }
			} 
			agentInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
				if((ssTotLoginTime) !=0) 
				{
					percentNotReadyTime = agentInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = agentInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = agentInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Sub total\"][lang])</script>");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentWaitTime+"%");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentSingleTransferTime+"%");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentTwoStepTransferTime+"%");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentNotReadyTime+"%");%></b></font></td>
			</tr>
			<%
				  }
				if((totLoginTime) !=0) 
				{
					tot_percentNotReadyTime = agentInfo.formatDecimalDouble( ( (double)(totNotReadyTime*100)/totLoginTime), 2);
					tot_percentWaitTime  = agentInfo.formatDecimalDouble( ( (double)(totWaitTime*100)/totLoginTime), 2);
					tot_percentSingleTransferTime = agentInfo.formatDecimalDouble( ( (double)(totSingleTransferTime*100)/totLoginTime), 2);
					tot_percentTwoStepTransferTime = agentInfo.formatDecimalDouble( ( (double)(totTwoStepTransferTime*100)/totLoginTime), 2);
				}
			%>
	 			<tr>
					<td   width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentWaitTime+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentSingleTransferTime+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentTwoStepTransferTime+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentNotReadyTime +"%");%></b></font></td>
					
				</tr>
			</table>
		</td>
	</tr>
</table>
