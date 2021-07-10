<%
	String percent_Ans ="";
%>

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<table width="75%" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="center">
					  <b>
							<%
								try { out.write(beanAgent.getAgentFullName(agentId)); }
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
							<script>document.write(MultiArray["Report for answered calls"][lang])</script><br><br>
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
	if(from.compareTo("agentReport") == 0)
	{
	 %>
		<tr>
			<td width="100%" align="center">
				<table width="70%" align="center">
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
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Login details\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>

	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["First login"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(beanAgent.getfirstLoginTime());
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Last logout"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(beanAgent.getLastLogoutTime().substring(0,19));
					}catch(Exception e){
						out.write("unknown");
					}
				%> </td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Login time"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
					}catch(Exception e){
						out.write("unknown");
					}
				%> </td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Login count"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(Long.toString(agentInfo.n_login));
					}catch(Exception e){
						out.write("unknown");
					}
				%> </td>
			  </tr>
			</table>
		</td>
	</tr>

	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Inbound calls\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>


	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Inbound count"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_Inbound));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Calls/hour"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getInboundPerHour());
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Inbound time"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Inbound average"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgTalktimeInbound());
					}catch(Exception e){
						out.write("unknown");
					}
				%> </td>
			  </tr>
			  
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Outbound calls\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Outbound count"][lang])</script></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(Long.toString(agentInfo.n_Outbound));
							}catch(Exception e){
								out.write("unknown");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Calls/hour"][lang])</script></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(agentInfo.getOutboundPerHour());
							}catch(Exception e){
								out.write("unknown");
							}
						%></td>
				  </tr>
				  
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Outbound time"][lang])</script></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));
							}catch(Exception e){
								out.write("unknown");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Outbound average"][lang])</script></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<%
						try {
							out.write(agentInfo.getAvgTalktimeOutbound());
						}catch(Exception e){
							out.write("unknown");
						}
			
					%> </td>
				  </tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Wrap up calls\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Wrap up count"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Calls/hour"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getWrapUpPerHour());
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Wrap up time"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Wrap up average"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgWrapUpTime());
					}catch(Exception e){
						out.write("unknown");
					}
		
				%> </td>
			  </tr>
			</table>
		</td>
	</tr>

	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Hold calls\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Hold count"][lang])</script></td>
				<td class="reportsTabValues" width="60%"  style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_hold));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Calls/hour"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getHoldPerHour());
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Hold time"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalHoldTime));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
		
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Hold average"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgTalktimeHold());
					}catch(Exception e){
						out.write("unknown");
					}
		
				%> </td>
			  </tr>
			</table>
		</td>
	</tr>
<%
	if(agentInfo.totalLoginTime > 0)
	{
%>
	
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Percentages compared to login time\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>

	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Login"][lang])</script></td>
					<td class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="100%" height="10" align="left">
							<tr>
								<td width="95%"  style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
					</td>
				  </tr>
							
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Handling"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent_Ans = agentInfo.getPercentHandlingTime() ;
							out.write(percent_Ans);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
			
							</tr>
							
					  </table>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Busy"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent_Ans = agentInfo.getPercentBusyTime();
							out.write(percent_Ans);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Inbound"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent_Ans = agentInfo.getPercentInboundTime() ;
							out.write(percent_Ans);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Outbound"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent_Ans = agentInfo.getPercentOutboundTime() ;
							out.write(percent_Ans);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Wrapup"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent_Ans = agentInfo.getPercentWrapUpTime() ;
							out.write(percent_Ans);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Hold"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent_Ans = agentInfo.getPercentHoldTime() ;
							out.write(percent_Ans);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
					</td>
				  </tr>
			</table>
		</td>
	</tr>
	<%
	}
	%>	
</table>

