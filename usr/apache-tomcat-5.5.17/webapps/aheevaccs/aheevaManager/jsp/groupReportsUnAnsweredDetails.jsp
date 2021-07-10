<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageRepUndData = new beanManagerData();
pageRepUndData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepUndData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
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
    groupsInfo =null;
	
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
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<table width="100%" cellpadding="0" cellspacing="0" align="center">
<%
	if(from.compareTo("groupReport") != 0)
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
								try { out.write(groupName); }
								catch(Exception e) { out.write(""); }
							%>
						  [
						  <% out.println(groupId); %>
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
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageRepUndData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepUndData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepUndData.getWord("Yearly"));
								}
							%>
							<%= pageRepUndData.getWord("Detail report for unanswered calls")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageRepUndData.getWord("To")%>
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
							<b><%= pageRepUndData.getWord("Unanswered calls")%>				
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
						<%= pageRepUndData.getWord("Telephony data")
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
				<td width="15%" align="center"> <%= pageRepUndData.getWord("Time period")%></td>
				<td width="12%"  align="center"><%= pageRepUndData.getWord("Login time")%></td>
				<td width="5%"  align="center"><%= pageRepUndData.getWord("Login count")%></td>
				<td width="12%"  align="center"><%= pageRepUndData.getWord("Waiting time")%></td>
				<td width="5%"  align="center"><%= pageRepUndData.getWord("Waiting count")%></td>
				<td width="12%"  align="center"><%= pageRepUndData.getWord("Single transfer time")%></td>
				<td width="5%"  align="center"><%= pageRepUndData.getWord("Single transfer count")%></td>
				<td width="12%"  align="center"><%= pageRepUndData.getWord("Two step transfer time")%></td>
				<td width="5%"  align="center"><%= pageRepUndData.getWord("Two step transfer count")%></td>
				<td width="12%"  align="center"><%= pageRepUndData.getWord("Not ready time")%></td>
				<td width="5%"  align="center"><%= pageRepUndData.getWord("Not ready count")%></td>
			  </tr>
<%
    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);

%>
 			<% if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) {%>
			 <tr>
				 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageRepUndData.getWord("Sub total")%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tLoginTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nlogin));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tWaitTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nWaitTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tSingleTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nSingleTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tTwoStepTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nTwoStepTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tNotReadyTime));%></b></font></td>
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
 		 if(groupsInfo.totalLoginTime > 0){
		%>
	<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");%> >
		<td    align="center"><%out.write(groupsInfo.time);%></td>
		<td width="12%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_login));%></td>
		<td width="12%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalWaitTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_Wait));%></td>
		<td width="12%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalSingleTransfer));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_single_transfer));%></td>
		<td width="12%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalTwoStepTranfer));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_two_step_transfer));%></td>
		<td width="12%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalNotReadyTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_NotReady));%></td>
	  </tr>
	<!-- end of array traversal-->
<%
    tLoginTime += groupsInfo.totalLoginTime;   totLoginTime += groupsInfo.totalLoginTime;
	tNotReadyTime +=groupsInfo.totalNotReadyTime ;  totNotReadyTime +=groupsInfo.totalNotReadyTime ;
	 tWaitTime +=groupsInfo.totalWaitTime  ;  totWaitTime +=groupsInfo.totalWaitTime  ; 
	 tSingleTransferTime +=groupsInfo.totalSingleTransfer  ;  totSingleTransferTime +=groupsInfo.totalSingleTransfer ; 
	 tTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ;  totTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ; 

     nlogin += groupsInfo.n_login; tot_nlogin += groupsInfo.n_login;
	 nNotReadyTime +=groupsInfo.n_NotReady  ;  tot_nNotReadyTime +=groupsInfo.n_NotReady  ; 
	 nWaitTime +=groupsInfo.n_Wait  ;  tot_nWaitTime +=groupsInfo.n_Wait  ; 
	 nSingleTransferTime +=groupsInfo.n_single_transfer  ;  tot_nSingleTransferTime +=groupsInfo.n_single_transfer ; 
	 nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; tot_nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; 
        
        }
    }
 	groupsInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true){
	%>
			 <tr>
				 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageRepUndData.getWord("Sub total")%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tLoginTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nlogin));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tWaitTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nWaitTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tSingleTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nSingleTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tTwoStepTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nTwoStepTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tNotReadyTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(nNotReadyTime));%></b></font></td>
			</tr>

	<%
		  }
	%>
			 <tr>
				 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageRepUndData.getWord("Total")%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totLoginTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_nlogin));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totWaitTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_nWaitTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totSingleTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_nSingleTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totTwoStepTransferTime));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_nTwoStepTransferTime));%></b></font></td>
				 <td width="12%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totNotReadyTime));%></b></font></td>
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
								out.write(pageRepUndData.getWord("Not ready reason"));
								needOneMoreTotalRow = false;
							    tNotReadyTime = 0; ssTotNotReadyTime = 0; totNotReadyTime = 0;
								nb_NRR = beanAgentGroup.m_vAllNRR.size();
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
				<td width="15%" align="center" style="border-style:solid; border-right-color:#949494"><%= pageRepUndData.getWord("Time period")%> </td>
				
				<%
				   tNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   totNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   nNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   tot_nNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   ssNNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   ssTotNotReadyReason = new long[beanAgentGroup.m_vAllNRR.size()];
				   
					for(int k =0; k < beanAgentGroup.m_vAllNRR.size(); k++)
					{ 
						//creer autant de variable que de raison
					  tNotReadyReason[k] = 0;
					  totNotReadyReason[k]=0;
					   nNotReadyReason[k] =0;
					   tot_nNotReadyReason[k] =0;
					   ssNNotReadyReason[k] =0;
					   ssTotNotReadyReason[k] =0;
					  
					%> 
						<td width="6%" colspan="3" align="center" style="border-style:solid; border-right-color: #949494"><%=beanAgentGroup.m_vAllNRR.elementAt(k) %></td>
					<%
					}	
				%>
			  </tr>
			  
			  <tr class="reportsNRRCol">
				<td width="15%" align="center" style="border-style:solid; border-right-color:#949494"><% out.write(" "); %></td>
				
				<%
					for(int k =0; k < beanAgentGroup.m_vAllNRR.size(); k++)
					{ 
					%> 
						<td width="2%" align="center" style="border-style:solid;border-right-color:#CCCCCC"><% out.write("Time"); %></td>
						<td width="2%" align="center" style="border-style:solid; border-right-color:#CCCCCC"><% out.write("Nb"); %></td>
						<td width="2%" align="center" style="border-style:solid;border-right-color: #949494"><% out.write(" % "); %></td>
					<%
					}	
				%>
			  </tr>
			<%    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);
if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
			%>
		 	<tr>
			 	<td width="15%" bgcolor="#FFECF5" align="center" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
				 <%
				for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
				{ 
						if((ssTotNotReadyTime) !=0) 
						{
							percentNRR = groupsInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
						}
						else 
						 percentNRR ="0.00";
						
					%>
					<td align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write( groupsInfo.buildReadableTime(ssTotNotReadyReason[n])); %></b></font></td>
					<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write(""+ ssNNotReadyReason[n]);  %></b></font></td>	
					<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><% out.write(percentNRR);  %></b></font></td>						
										
					<%	
					ssNNotReadyReason[n] =0;
					ssTotNotReadyReason[n] =0;
		} //fin for n  %>
		</tr>
		<%
			ssTotNotReadyTime =0;
			percentNRR = "" ;
			needOneMoreTotalRow = true;
		} // fin if groupsInfo.time.length() >10
			tNotReadyTime = groupsInfo.totalNotReadyTime ; 
			totNotReadyTime += groupsInfo.totalNotReadyTime ;
			ssTotNotReadyTime +=groupsInfo.totalNotReadyTime ;
		%>
			<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
				<td   align="center" style="border-style:solid; border-right-color:#949494"><%out.write(groupsInfo.time);%></td>
				<%
					for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
					{ 
						String key="";
						String nreadyreason = (String)beanAgentGroup.m_vAllNRR.elementAt(n);
						key = groupsInfo.datehour+"-"+ nreadyreason;
						beanAgentGroupReport.nrrdata tmpNrrElt = (beanAgentGroupReport.nrrdata)mapNRR.get(key);

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
						percentNRR = groupsInfo.formatDecimalDouble( ( (double)((tNotReadyReason[n])*100)/tNotReadyTime), 2);	
						}
						else 
						 percentNRR ="0.00";
						
						%>
				<td align="center" style="border-style:solid; border-right-color:#CCCCCC"><% out.write( groupsInfo.buildReadableTime(tNotReadyReason[n])); 						 						%></td>
				<td   align="center" style="border-style:solid; border-right-color:#CCCCCC"> <% out.write(""+ nNotReadyReason[n]);  %>	</td>	
				<td   align="center" style="border-style:solid; border-right-color:#949494"> <% out.write(percentNRR);  %>	</td>						
									
						<%	
						
			} //fin for n  %>
	  </tr>
		<%
		
	} //fin for
	groupsInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow == true)
	{
		%>
	 <tr>
		 <td width="15%" bgcolor="#FFECF5" align="center" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
		 <%
		for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
		{ 
				if((ssTotNotReadyTime) !=0) 
				{
					percentNRR = groupsInfo.formatDecimalDouble( ( (double)((ssTotNotReadyReason[n])*100)/ssTotNotReadyTime), 2);
				}
				else 
				 percentNRR ="0.00";
			%>
			<td align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write( groupsInfo.buildReadableTime(ssTotNotReadyReason[n])); %></b></font></td>
			<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write(""+ ssNNotReadyReason[n]);  %></b></font></td>	
			<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><% out.write(percentNRR);  %></b></font></td>	
			<%
			}
			%>					
		</tr>
		<%
			} // fin for n
			  
		%>
			<tr>
				<td   width="20%" bgcolor="#FFECF5" align="center" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b><%= pageRepUndData.getWord("Total")%></b></font></td>
				 <%
				for (int n = 0; n < beanAgentGroup.m_vAllNRR.size(); n++) 
				{ 
				if((totNotReadyTime) !=0) 
				{
					tot_percentNRR = groupsInfo.formatDecimalDouble( ( (double)((totNotReadyReason[n])*100)/totNotReadyTime), 2);
				}
				else 
				 tot_percentNRR ="0.00";
				
					%>
				<td align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write( groupsInfo.buildReadableTime(totNotReadyReason[n])); %></b></font></td>
				<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#CCCCCC"><font  color="#000000"><b><% out.write(""+ tot_nNotReadyReason[n]);  %></b></font></td>	
				<td   align="center" bgcolor="#FFECF5" style="border-style:solid; border-right-color:#949494"><font  color="#000000"><b>
				  <% out.write(tot_percentNRR);  %>
				</b></font></td>						
									
						<%	
					} //fin for n  %>
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
								out.write(pageRepUndData.getWord("Average"));
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
				<td width="20%" align="center"> <%= pageRepUndData.getWord("Time period")%></td>
				<td width="15%"  align="center"><%= pageRepUndData.getWord("Waiting calls")%></td>
				<td width="15%"  align="center"><%= pageRepUndData.getWord("Single transfer calls")%></td>
				<td width="15%"  align="center"><%= pageRepUndData.getWord("Two step transfer calls")%></td>
				<td width="15%"  align="center"><%= pageRepUndData.getWord("Not ready calls")%></td>
			  </tr>
			<%    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);
if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
				if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
				if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
				if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
				
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageRepUndData.getWord("Sub total")%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgWaitTime));%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgSingleTransferTime));%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgTwoStepTransferTime));%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgNotReadyTime));%></b></font></td>
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
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
					<td   align="center"><%out.write(groupsInfo.time);%></td>
					<td   align="center"><%out.write(groupsInfo.getAvgWaitingTime());%></td>
					<td   align="center"><%out.write(groupsInfo.getAvgSingleTransferTime());%></td>
					<td   align="center"><%out.write(groupsInfo.getAvgTwoStepTransferTime());%></td>
					<td   align="center"><%out.write(groupsInfo.getAvgNotReadyTime());%></td>
				</tr>
				<%

			ssTotNotReadyTime += groupsInfo.totalNotReadyTime ;
			ssNNotReadyTime += groupsInfo.n_NotReady;
			totNotReadyTime +=groupsInfo.totalNotReadyTime ; 
			tot_nNotReadyTime +=groupsInfo.n_NotReady  ; 
			tNotReadyTime = groupsInfo.totalNotReadyTime ;  
			nNotReadyTime =groupsInfo.n_NotReady  ; 
			
			ssTotWaitTime += groupsInfo.totalWaitTime;
			ssNWaitTime += groupsInfo.n_Wait;
			totWaitTime +=groupsInfo.totalWaitTime  ; 
			tot_nWaitTime +=groupsInfo.n_Wait  ;
			tWaitTime =groupsInfo.totalWaitTime  ;  
			nWaitTime =groupsInfo.n_Wait  ;  

			ssTotSingleTransferTime += groupsInfo.totalSingleTransfer;
			ssNSingleTransferTime += groupsInfo.n_single_transfer;
			totSingleTransferTime +=groupsInfo.totalSingleTransfer ; 
			tot_nSingleTransferTime +=groupsInfo.n_single_transfer ; 
	 		tSingleTransferTime +=groupsInfo.totalSingleTransfer  ;  
	 		nSingleTransferTime +=groupsInfo.n_single_transfer  ; 

			ssTotTwoStepTransferTime = groupsInfo.totalTwoStepTranfer;
			ssNTwoStepTransferTime = groupsInfo.n_two_step_transfer;
			totTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ; 
			tot_nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; 
			tTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ;  
			nTwoStepTransferTime +=groupsInfo.n_two_step_transfer ; 
				
			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
			if((ssNNotReadyTime) !=0) avgNotReadyTime = (ssTotNotReadyTime/ssNNotReadyTime);
			if((ssNWaitTime) !=0) avgWaitTime = (ssTotWaitTime/ssNWaitTime);
			if((ssNSingleTransferTime) !=0) avgSingleTransferTime = (ssTotSingleTransferTime/ssNSingleTransferTime);
			if((ssNTwoStepTransferTime) !=0) avgTwoStepTransferTime = (ssTotTwoStepTransferTime/ssNTwoStepTransferTime);
						
			%>
			 		<tr>
						 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageRepUndData.getWord("Sub total")%></b></font></td>
						 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgWaitTime));%></b></font></td>
						 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgSingleTransferTime));%></b></font></td>
						 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgTwoStepTransferTime));%></b></font></td>
						 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgNotReadyTime));%></b></font></td>
					</tr>
			<%
				  }
				  if((tot_nNotReadyTime) !=0) tot_avgNotReadyTime = (totNotReadyTime/tot_nNotReadyTime);
				if((tot_nWaitTime) !=0) tot_avgWaitTime = (totWaitTime/tot_nWaitTime);
				if((tot_nSingleTransferTime) !=0) tot_avgSingleTransferTime = (totSingleTransferTime/tot_nSingleTransferTime);
				if((tot_nTwoStepTransferTime) !=0) tot_avgTwoStepTransferTime = (totTwoStepTransferTime/tot_nTwoStepTransferTime);
				  
			%>
	 			<tr>
					<td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageRepUndData.getWord("Total")%></b></font></td>
					<td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_avgWaitTime));%></b></font></td>
					<td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_avgSingleTransferTime));%></b></font></td>
					<td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_avgTwoStepTransferTime));%></b></font></td>
					<td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_avgNotReadyTime));%></b></font></td>
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
								out.write(pageRepUndData.getWord("Percentages compared to login time"));
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
				<td width="20%" align="center"><%= pageRepUndData.getWord("Time period")%></td>
				<td width="15%"  align="center"><%= pageRepUndData.getWord("Waiting calls")%></td>
				<td width="15%"  align="center"><%= pageRepUndData.getWord("Single transfer calls")%></td>
				<td width="15%"  align="center"><%= pageRepUndData.getWord("Two step transfer calls")%></td>
				<td width="15%"  align="center"><%= pageRepUndData.getWord("Not ready calls")%></td>
			  </tr>
			  
			<%    
			for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
        	 groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);
			if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime) !=0) 
				{

					percentNotReadyTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageRepUndData.getWord("Sub total")%></b></font></td>
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
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
						<td   align="center"><%out.write(groupsInfo.time);%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentWaitingTime());%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentSingleTransferTime());%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentTwoStepTranferTime());%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentNotReadyTime());%></td>
				  </tr>
				<%

			ssTotLoginTime	+=groupsInfo.totalLoginTime;
			totLoginTime +=groupsInfo.totalLoginTime;
			tLoginTime =groupsInfo.totalLoginTime;
					
			ssTotNotReadyTime += groupsInfo.totalNotReadyTime;
			totNotReadyTime +=groupsInfo.totalNotReadyTime; ;
			tNotReadyTime = groupsInfo.totalNotReadyTime; ; 

			ssTotWaitTime += groupsInfo.totalWaitTime ;
			totWaitTime += groupsInfo.totalWaitTime ;
			tWaitTime = groupsInfo.totalWaitTime ; 

			ssTotSingleTransferTime += groupsInfo.totalSingleTransfer;
			totSingleTransferTime += groupsInfo.totalSingleTransfer;
			tSingleTransferTime = groupsInfo.totalSingleTransfer;

			ssTotTwoStepTransferTime += groupsInfo.totalTwoStepTranfer ;
			totTwoStepTransferTime +=groupsInfo.totalTwoStepTranfer  ;
			tTwoStepTransferTime = groupsInfo.totalTwoStepTranfer  ; 

			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow == true)
			{
				if((ssTotLoginTime) !=0) 
				{
					percentNotReadyTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotNotReadyTime*100)/ssTotLoginTime), 2);
					percentWaitTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotWaitTime*100)/ssTotLoginTime), 2);
					percentSingleTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotSingleTransferTime*100)/ssTotLoginTime), 2);
					percentTwoStepTransferTime = groupsInfo.formatDecimalDouble( ( (double)(ssTotTwoStepTransferTime*100)/ssTotLoginTime), 2);
				}
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageRepUndData.getWord("Sub total")%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentWaitTime+"%");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentSingleTransferTime+"%");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentTwoStepTransferTime+"%");%></b></font></td>
				 <td width="15%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(percentNotReadyTime+"%");%></b></font></td>
			</tr>

			<%
				  }
				if((totLoginTime) !=0) 
				{
					tot_percentNotReadyTime = groupsInfo.formatDecimalDouble( ( (double)(totNotReadyTime*100)/totLoginTime), 2);
					tot_percentWaitTime  = groupsInfo.formatDecimalDouble( ( (double)(totWaitTime*100)/totLoginTime), 2);
					tot_percentSingleTransferTime = groupsInfo.formatDecimalDouble( ( (double)(totSingleTransferTime*100)/totLoginTime), 2);
					tot_percentTwoStepTransferTime = groupsInfo.formatDecimalDouble( ( (double)(totTwoStepTransferTime*100)/totLoginTime), 2);

				}
				  
			%>
	 			<tr>
					<td   width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageRepUndData.getWord("Total")%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentWaitTime+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentSingleTransferTime+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentTwoStepTransferTime+"%");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_percentNotReadyTime +"%");%></b></font></td>
					
				</tr>
			</table>
		</td>
	</tr>
</table>
<% pageRepUndData.closeConnection(); %>
