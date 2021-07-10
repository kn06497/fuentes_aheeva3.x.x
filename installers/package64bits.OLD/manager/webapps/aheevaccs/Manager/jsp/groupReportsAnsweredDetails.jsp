
<%
	//String percent ="";
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
    groupsInfo =null;
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
							<script>document.write(MultiArray["Details Report for answered calls"][lang])</script><br><br>
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
	if(from.compareTo("groupReport") == 0)
	{
	 %>
		<tr>
			<td width="100%" align="center">
				<table width="100%" align="center">
					<tr><td height="20"></td></tr>
					<tr>
						<td width="100%" align="left"><font style="background-color:#FFC5A8">
							<b><script>document.write(MultiArray["Answered calls"][lang])</script>	
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
				<td width="15%" align="center"><script>document.write(MultiArray["Time period"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Login time"][lang])</script></td>
				<td width="5%"  align="center"><script>document.write(MultiArray["Login count"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Inbound time"][lang])</script></td>
				<td width="5%"  align="center"><script>document.write(MultiArray["Inbound count"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Outbound time"][lang])</script></td>
				<td width="5%"  align="center"><script>document.write(MultiArray["Outbound count"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Wrap up time"][lang])</script></td>
				<td width="5%"  align="center"><script>document.write(MultiArray["Wrap up count"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Hold time"][lang])</script></td>
				<td width="5%"  align="center"><script>document.write(MultiArray["Hold count"][lang])</script></td>
			  </tr>
<%
    for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
         groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);

%>
 			<% if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) {%>
			 <tr>
				 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tLoginTime_Ans));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_N_login));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tTalkTimeInbound));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Inbound));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tTalkTimeOutbound));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Outbound));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tWrapUp));%></b></font></td>
				 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Wrap_up));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tHold));%></b></font></td>
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
 		 if(groupsInfo.totalLoginTime > 0){
		%>
	<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");%> >
		<td    align="center"><%out.write(groupsInfo.time);%></td>
		<td width="10%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_login));%></td>
		<td width="10%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeInbound));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_Inbound));%></td>
		<td width="10%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeOutbound));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_Outbound));%></td>
		<td width="10%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalWrapUpInTime+groupsInfo.totalWrapUpOutTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_Wrap_In_up+groupsInfo.n_Wrap_Out_up) );%></td>
		<td width="10%"  align="center"><%out.write(groupsInfo.buildReadableTime(groupsInfo.totalHoldTime));%></td>
		<td width="5%"  align="center"><%out.write(Long.toString(groupsInfo.n_hold));%></td>
	  </tr>
	<!-- end of array traversal-->
<%
        tLoginTime_Ans += groupsInfo.totalLoginTime;   totLoginTime_Ans += groupsInfo.totalLoginTime;
        tTalkTimeInbound += groupsInfo.totalTalkTimeInbound;  totTalkTimeInbound += groupsInfo.totalTalkTimeInbound;
        tTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound; totTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound;
        tWrapUp  += groupsInfo.totalWrapUpInTime; totWrapUp  += groupsInfo.totalWrapUpInTime;
        tWrapUp  += groupsInfo.totalWrapUpOutTime; totWrapUp  += groupsInfo.totalWrapUpOutTime;
        tHold += groupsInfo.totalHoldTime; totHold += groupsInfo.totalHoldTime;

        t_N_login += groupsInfo.n_login; tot_N_login += groupsInfo.n_login;
        t_n_Inbound += groupsInfo.n_Inbound; tot_n_Inbound += groupsInfo.n_Inbound;
        t_n_Outbound += groupsInfo.n_Outbound; tot_n_Outbound += groupsInfo.n_Outbound;

        t_n_Wrap_up += groupsInfo.n_Wrap_In_up;  tot_n_Wrap_up += groupsInfo.n_Wrap_In_up;
        t_n_Wrap_up += groupsInfo.n_Wrap_Out_up;  tot_n_Wrap_up += groupsInfo.n_Wrap_Out_up;
        t_n_Hold += groupsInfo.n_hold; tot_n_Hold += groupsInfo.n_hold;
        }
    }
 	groupsInfo = new beanAgentGlobalInfo();
	if(needOneMoreTotalRow_Ans == true){
	%>
	 <tr>
		 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Sub total\"][lang])</script> ");%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tLoginTime_Ans));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_N_login));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tTalkTimeInbound));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Inbound));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tTalkTimeOutbound));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Outbound));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tWrapUp));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Wrap_up));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tHold));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(t_n_Hold));%></b></font></td>
	</tr>

	<%
		  }
	%>
	 <tr>
		 <td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script> ");%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totLoginTime_Ans));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_N_login));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totTalkTimeInbound));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_n_Inbound));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totTalkTimeOutbound));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_n_Outbound));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totWrapUp));%></b></font></td>
		 <td width="5%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(tot_n_Wrap_up));%></b></font></td>
		 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(totHold));%></b></font></td>
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
								out.write("<script>document.write(MultiArray[\"Average\"][lang])</script>");
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
				<td width="20%" align="center"> <script>document.write(MultiArray["Time period"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Inbound calls"][lang])</script></td>
				<td width="10%"  align="center"> <script>document.write(MultiArray["Outbound calls"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Wrap up calls"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Hold calls"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["AHT in"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["AHT out"][lang])</script></td>
			  </tr>
			<%
		for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
			 groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);

				if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssNInbound) !=0) {
				avgTalkTimeInbound = (ssTotTalkTimeInbound/ssNInbound);
				ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn+ ssTotHold)/ssNInbound;
				}
				if((ssNOutbound) !=0){
				 avgTalkTimeOutbound = (ssTotTalkTimeOutbound/ssNOutbound);
				 ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut+ ssTotHold )/ssNOutbound;
				 }
				if((ssNOutbound + ssNOutbound) !=0) avgWrapUp = (ssTotWrapUp/(ssNOutbound + ssNOutbound));
				if((ssNOutbound + ssNOutbound) !=0) avgHold = (ssTotHold/(ssNOutbound + ssNOutbound));
				if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgTalkTimeInbound));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgTalkTimeOutbound));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgWrapUp));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgHold));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(ahtIn));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(ahtOut));%></b></font></td>
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
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
						<td   align="center"><%out.write(groupsInfo.time);%></td>
						<td   align="center"><%out.write(groupsInfo.getAvgTalktimeInbound());%></td>
						<td   align="center"><%out.write(groupsInfo.getAvgTalktimeOutbound());%></td>
						<td   align="center"><%out.write(groupsInfo.getAvgWrapUpTime());%></td>
						<td   align="center"><%out.write(groupsInfo.getAvgTalktimeHold());%></td>
						<td   align="center"><%out.write(groupsInfo.getAhtIn());%></td>
						<td   align="center"><%out.write(groupsInfo.getAhtOut());%></td>
				  </tr>
				<%

			//System.out.println(groupsInfo.getAhtOut());

			ssTotTalkTimeInbound += groupsInfo.totalTalkTimeInbound ;
			ssNInbound+= groupsInfo.n_Inbound;
			totTalkTimeInbound +=groupsInfo.totalTalkTimeInbound ;
			tot_n_Inbound +=groupsInfo.n_Inbound  ; 
			tTalkTimeInbound = groupsInfo.totalTalkTimeInbound ; 
			t_n_Inbound =groupsInfo.n_Inbound  ; 

			ssTotTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound ;
			ssNOutbound += groupsInfo.n_Outbound;
			totTalkTimeOutbound +=groupsInfo.totalTalkTimeOutbound ;
			tot_n_Outbound +=groupsInfo.n_Outbound  ; 
			tTalkTimeOutbound = groupsInfo.totalTalkTimeOutbound ; 
			t_n_Outbound =groupsInfo.n_Outbound  ; 

			ssTotWrapUp += groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime ;
			ssNWrap_up+= groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up;
			totWrapUp +=groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ;
			tot_n_Wrap_up +=groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up; 
			tWrapUp = groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ; 
			t_n_Wrap_up =groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up;

			ssTotWrapUpIn += groupsInfo.totalWrapUpInTime;
			ssTotWrapUpOut += groupsInfo.totalWrapUpOutTime ;
			totWrapUpIn+= groupsInfo.totalWrapUpInTime;
			totWrapUpOut += groupsInfo.totalWrapUpOutTime ;

			ssTotHold += groupsInfo.totalHoldTime ;
			ssNHold+= groupsInfo.n_hold;
			totHold +=groupsInfo.totalHoldTime ;
			tot_n_Hold +=groupsInfo.n_hold  ; 
			tHold = groupsInfo.totalHoldTime ; 
			t_n_Hold =groupsInfo.n_hold  ; 


			System.out.println("ssTotWrapUpOut : " + ssTotWrapUpOut);
			System.out.println("ssTotTalkTimeOutbound : " + ssTotTalkTimeOutbound);
			System.out.println("ssTotHold : " + ssTotHold);
			System.out.println("ssNOutbound : " + ssNOutbound);
			

			ssTotHandling += groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			ssNHandling+= groupsInfo.n_Inbound + groupsInfo.n_Outbound;
			totHandling +=groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			tot_n_Handling += groupsInfo.n_Inbound + groupsInfo.n_Outbound;
			tHandling = groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			t_n_Handling = groupsInfo.n_Inbound + groupsInfo.n_Outbound;
			
			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true)
			{
				if((ssNInbound) !=0) {
				avgTalkTimeInbound = (ssTotTalkTimeInbound/ssNInbound);
				ahtIn = (ssTotTalkTimeInbound + ssTotWrapUpIn+ ssTotHold)/ssNInbound;
				}
				if((ssNOutbound) !=0){
				 avgTalkTimeOutbound = (ssTotTalkTimeOutbound/ssNOutbound);
				 ahtOut = (ssTotTalkTimeOutbound + ssTotWrapUpOut+ ssTotHold)/ssNOutbound;
				 }
				if((ssNOutbound + ssNInbound) !=0) avgWrapUp = (ssTotWrapUp/(ssNOutbound + ssNInbound));
				if((ssNOutbound + ssNInbound) !=0) avgHold = (ssTotHold/(ssNOutbound + ssNInbound));
				if((ssNHandling) !=0) avgHandling = (ssTotHandling/ssNHandling);
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Sub total\"][lang])</script> ");%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgTalkTimeInbound));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgTalkTimeOutbound));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgWrapUp));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(avgHold));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(ahtIn));%></b></font></td>
				 <td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(ahtOut));%></b></font></td>
					</tr>
			<%
				  }
				  if((tot_n_Inbound) !=0) {
				  tot_avgTalkTimeInbound = (totTalkTimeInbound/tot_n_Inbound);
				  tot_ahtIn =(totTalkTimeInbound +totWrapUpIn +totHold) /tot_n_Inbound;
				  }
				if((tot_n_Outbound) !=0) {
					tot_avgTalkTimeOutbound = (totTalkTimeOutbound/tot_n_Outbound);
					tot_ahtOut =(tot_avgTalkTimeOutbound +totWrapUpOut +totHold) /tot_n_Outbound;
				}
				if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgWrapUp = (totWrapUp/(tot_n_Outbound + tot_n_Inbound ));
				if((tot_n_Outbound + tot_n_Inbound) !=0) tot_avgHold = (totHold/(tot_n_Outbound + tot_n_Inbound ));
				if((tot_n_Handling) !=0) tot_avgHandling = (totHandling/tot_n_Handling);

			%>
	 			<tr>
					<td   width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_avgTalkTimeInbound));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_avgTalkTimeOutbound));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_avgWrapUp));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_avgHold));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_ahtIn));%></b></font></td>
					<td width="10%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(groupsInfo.buildReadableTime(tot_ahtOut));%></b></font></td>
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
				<td width="20%" align="center"> <script>document.write(MultiArray["Time period"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Inbound calls"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Outbound calls"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Wrap up calls"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Hold calls"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Productivity"][lang])</script></td>
				<td width="10%"  align="center"><script>document.write(MultiArray["Busy"][lang])</script></td>
			  </tr>

			<%
			for (int i = 0; i < beanAgentGroup.Detail_vector.size(); i++) {
				 groupsInfo = (beanAgentGlobalInfo)beanAgentGroup.Detail_vector.elementAt(i);

				if(( groupsInfo.time.length() >10 || groupsInfo.otherMonthYear) && i > 0) 
				{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = groupsInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = groupsInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = groupsInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = groupsInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
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
				} // fin if groupsInfo.time.length() >10
			    if(groupsInfo.totalLoginTime > 0)
			    {
				%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
						<td   align="center"><%out.write(groupsInfo.time);%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentInboundTime());%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentOutboundTime());%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentWrapUpTime());%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentHoldTime());%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentHandlingTime());%></td>
						<td   align="center"><%out.write(groupsInfo.getPercentBusyTime());%></td>
				  </tr>
				<%

			ssTotLoginTime_Ans	+=groupsInfo.totalLoginTime;
			totLoginTime_Ans +=groupsInfo.totalLoginTime;
			tLoginTime_Ans =groupsInfo.totalLoginTime;
					
			ssTotTalkTimeInbound += groupsInfo.totalTalkTimeInbound ;
			totTalkTimeInbound +=groupsInfo.totalTalkTimeInbound ;
			tTalkTimeInbound = groupsInfo.totalTalkTimeInbound ; 


			ssTotTalkTimeOutbound += groupsInfo.totalTalkTimeOutbound ;
			totTalkTimeOutbound +=groupsInfo.totalTalkTimeOutbound ;
			tTalkTimeOutbound = groupsInfo.totalTalkTimeOutbound ; 

			ssTotWrapUp += groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime ;
			totWrapUp +=groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ;
			tWrapUp = groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime  ; 

			ssTotHold += groupsInfo.totalHoldTime ;
			totHold +=groupsInfo.totalHoldTime ;
			tHold = groupsInfo.totalHoldTime ; 

			ssTotHandling += groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			totHandling +=groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			tHandling = groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime + groupsInfo.totalHoldTime;
			
			ssTotBusy += groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime;
			totBusy +=groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime;
			tBusy = groupsInfo.totalTalkTimeInbound + groupsInfo.totalTalkTimeOutbound +groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime;
			

			    }// fin if groupsInfo.totalLoginTime
				
			} //fin for
			groupsInfo = new beanAgentGlobalInfo();
			if(needOneMoreTotalRow_Ans == true)
			{
				if((ssTotLoginTime_Ans) !=0) 
				{
					percentTalkTimeInbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeInbound*100)/ssTotLoginTime_Ans), 2);
					percentTalkTimeOutbound = groupsInfo.formatDecimalDouble( ( (double)(ssTotTalkTimeOutbound*100)/ssTotLoginTime_Ans), 2);
					percentWrapUp = groupsInfo.formatDecimalDouble( ( (double)(ssTotWrapUp*100)/ssTotLoginTime_Ans), 2);
					percentHold = groupsInfo.formatDecimalDouble( ( (double)(ssTotHold*100)/ssTotLoginTime_Ans), 2);
					percentHandling = groupsInfo.formatDecimalDouble( ( (double)(ssTotHandling*100)/ssTotLoginTime_Ans), 2);
					percentBusy = groupsInfo.formatDecimalDouble( ( (double)(ssTotBusy*100)/ssTotLoginTime_Ans), 2);
				}
				%>
			 <tr>
				 <td width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Sub total\"][lang])</script> ");%></b></font></td>
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


					tot_percentTalkTimeInbound = groupsInfo.formatDecimalDouble( ( (double)(totTalkTimeInbound*100)/totLoginTime_Ans), 2);
					tot_percentTalkTimeOutbound  = groupsInfo.formatDecimalDouble( ( (double)(totTalkTimeOutbound*100)/totLoginTime_Ans), 2);
					tot_percentWrapUp = groupsInfo.formatDecimalDouble( ( (double)(totWrapUp*100)/totLoginTime_Ans), 2);
					tot_percentHold = groupsInfo.formatDecimalDouble( ( (double)(totHold*100)/totLoginTime_Ans), 2);
					tot_percentHandling = groupsInfo.formatDecimalDouble( ( (double)(totHandling*100)/totLoginTime_Ans), 2);
					tot_percentBusy = groupsInfo.formatDecimalDouble( ( (double)(totBusy*100)/totLoginTime_Ans), 2);
					
				}
				  
			%>
	 			<tr>
					<td   width="20%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
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

