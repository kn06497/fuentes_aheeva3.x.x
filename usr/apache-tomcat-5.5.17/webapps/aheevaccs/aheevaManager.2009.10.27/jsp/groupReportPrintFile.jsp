<%
if(detail.compareTo("0")==0)
{
	String percent ="";
%>

<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<table width="75%" cellpadding="0" cellspacing="0" align="center">
	<tr><td width="100%" align="center"><table width="70%" align="center"><tr><td height="20"></td></tr>
	<tr><td width="100%" align="center"><b><%try { out.write(groupName); } catch(Exception e) { out.write(""); } %>
	[<% out.println(groupId); %>]
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
							<script>document.write(MultiArray["Report"][lang])</script>&nbsp;  <script>document.write(MultiArray["for"][lang])</script>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(" "+startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(" "+starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(" "+starting_year_yearly);
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
				<script>document.write(MultiArray["Login time"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
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
						out.write(Long.toString(groupsInfo.n_login));
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
							out.write(Long.toString(groupsInfo.n_Inbound));
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
							out.write(groupsInfo.getInboundPerHour());
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
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeInbound));
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
						out.write(groupsInfo.getAvgTalktimeInbound());
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
								out.write(Long.toString(groupsInfo.n_Outbound));
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
								out.write(groupsInfo.getOutboundPerHour());
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
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeOutbound));
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
							out.write(groupsInfo.getAvgTalktimeOutbound());
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
							out.write(Long.toString(groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up));
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
							out.write(groupsInfo.getWrapUpPerHour());
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
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime));
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
						out.write(groupsInfo.getAvgWrapUpTime());
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
							out.write(Long.toString(groupsInfo.n_hold));
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
							out.write(groupsInfo.getHoldPerHour());
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
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalHoldTime));
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
						out.write(groupsInfo.getAvgTalktimeHold());
					}catch(Exception e){
						out.write("unknown");
					}
		
				%> </td>
			  </tr>
			</table>
		</td>
	</tr>
<%
	if(groupsInfo.totalLoginTime > 0)
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
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="100%" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
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
							percent = groupsInfo.getPercentHandlingTime() ;
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
					 <%
						if(percent.compareTo("0.00") !=0 )
						{
					 %>
					
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
			
							</tr>
							
					  </table>
						<%
						}
						%>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Busy"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentBusyTime();
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
					 <%
						if(percent.compareTo("0.00") !=0 )
						{
					 %>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
						<%
						}
						%>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Inbound"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentInboundTime() ;
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
					 <%
						if(percent.compareTo("0.00") !=0 )
						{
					 %>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
						<%
						}
						%>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Outbound"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentOutboundTime() ;
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
					 <%
						if(percent.compareTo("0.00") !=0 )
						{
					 %>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
						<%
						}
						%>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Wrapup"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentWrapUpTime() ;
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
					 <%
						if(percent.compareTo("0.00") !=0 )
						{
					 %>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
						<%
						}
						%>
					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Hold"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentHoldTime() ;
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>
			
					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
					 <%
						if(percent.compareTo("0.00") !=0 )
						{
					 %>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
							
					  </table>
						<%
						}
						%>
					</td>
				  </tr>
			</table>
		</td>
	</tr>
	<%
	}
	
	//unansrered calls
	%>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
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
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Waiting calls\"][lang])</script>");
							%>					
						</b>					</td>
				</tr>			
			</table>		</td>
	</tr>


	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Waiting count"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(groupsInfo.n_Wait));
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
							out.write(groupsInfo.getWaitingPerHour());
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>			 
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Waiting time"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalWaitTime));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Waiting average"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(groupsInfo.getAvgWaitingTime());
					}catch(Exception e){
						out.write("unknown");
					}
				%> </td>
			  </tr>
			</table>		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Transfer calls\"][lang])</script>");
							%>					
						</b>					</td>
				</tr>			
			</table>		</td>
	</tr>


	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Transfert count"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(groupsInfo.n_single_transfer + groupsInfo.n_two_step_transfer));
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
							out.write(groupsInfo.getTransferPerHour());
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Transfert time"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalSingleTransfer + groupsInfo.totalTwoStepTranfer));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<script>document.write(MultiArray["Transfert average"][lang])</script></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(groupsInfo.getAvgTransferTime());
					}catch(Exception e){
						out.write("unknown");
					}
				%> </td>
			  </tr>
			</table>		</td>
	</tr>

	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Not ready calls\"][lang])</script>");
							%>					
						</b>					</td>
				</tr>			
			</table>		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
			  <tr><td height="10"></td></tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Not ready count"][lang])</script></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(Long.toString(groupsInfo.n_NotReady));
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
								out.write(groupsInfo.getNotReadyPerHour());
							}catch(Exception e){
								out.write("unknown");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Not ready time"][lang])</script></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(groupsInfo.buildReadableTime(groupsInfo.totalNotReadyTime));
							}catch(Exception e){
								out.write("unknown");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Not ready average"][lang])</script></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<%
						try {
							out.write(groupsInfo.getAvgNotReadyTime());
						}catch(Exception e){
							out.write("unknown");
						}
			
					%> </td>
				  </tr>
			</table>		</td>
	</tr>
<%
	if(groupsInfo.totalNotReadyTime > 0)
	{
		String name ="" , nombre="";
		String duree ="", nrr_percent="";
		int nb_not_ready_reason = (groupsInfo.NRR_vector.size())/4;
		//int nb_not_ready_reason=9;
%>
	
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left"><b>
					  <%
								out.write("<script>document.write(MultiArray[\"Not ready reason\"][lang])</script>");
							%>
					</b></td>
				</tr>			
			</table>		</td>
	</tr>
	<tr>
	  <td width="100%" align="center"><table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
        <tr>
          <td height="20"></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td height="20" class="reportsID" width="35%" align="center" style="border:solid"><%
							out.write("<script>document.write(MultiArray[\"Reason\"][lang])</script>");
						%>          </td>
          <td height="20" class="reportsID" width="5%" align="center" style="border:solid"><%
							out.write("<script>document.write(MultiArray[\"Count\"][lang])</script>");
						%>          </td>
          <td height="20" class="reportsID" width="15%" align="center" style="border:solid"><%
							out.write("<script>document.write(MultiArray[\"Time\"][lang])</script>");
						%>          </td>
          <td colspan="2" height="20" class="reportsID" width="45%" align="center" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><%
							out.write("<script>document.write(MultiArray[\"Percentages compared to Not ready time\"][lang])</script>");
						%>          </td>
        </tr>
        <%
		int j=0, v=0, w=0, y=0;
		for(int i=0; i < nb_not_ready_reason ; i++)
		{
			j=i*4;
	%>
        <tr>
          <td class="reportsTabName" width="35%" style="border:solid"><b>
            <%
							
							name =(String)groupsInfo.NRR_vector.elementAt(j);
							out.write(name);
						%>
          </b> </td>
          <td class="reportsTabValues" width="5%" style="border:solid"><%
							w=j+1;
							nombre =(String)groupsInfo.NRR_vector.elementAt(w);
							out.write(nombre);
						%>          </td>
          <td class="reportsTabValues" width="15%" style="border:solid"><%
							v=j+2;
							duree =(String)groupsInfo.NRR_vector.elementAt(v);
							out.write(duree);
						%>          </td>
          <td class="reportsTabValues" width="10%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none"><%
							y=j+3;
							nrr_percent =(String)groupsInfo.NRR_vector.elementAt(y);
							out.write(nrr_percent);
						%>          </td>
          <td class="reportsTabValues" width="35%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">
						<%
						if(nrr_percent.compareTo("0.00") !=0)
						{
						%>
			  <table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(nrr_percent); %>" height="10" align="left">
				  <tr>
					<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
					<td width="5%" style="background-color:#F4F4F4"></td>
				  </tr>
			  </table>
						<%
						}
						%>
		  </td>
        </tr>
        <%
		}
	%>
      </table></td>
	</tr>
<%
	}
	
	if(groupsInfo.totalLoginTime > 0)
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
						</b>					</td>
				</tr>			
			</table>		</td>
	</tr>

	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
				  <tr >
					<td class="reportsTabName" width="35%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Login"][lang])</script></td>
					<td class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" width="100%" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>					</td>
				  </tr>
							
				  <tr >
					<td class="reportsTabName" width="35%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Wait"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentWaitingTime() ;
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						
						%>					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<%
						if(percent.compareTo("0.00") !=0)
						{
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>
					  <%
					  }
					  %>					
					  </td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="35%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Single transfer"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentSingleTransferTime();
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<%
						if(percent.compareTo("0.00") !=0)
						{
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>
					  <%
					  }
					  %>					
					 </td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="35%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Two step transfer"][lang])</script>r</td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentTwoStepTranferTime() ;
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<%
						if(percent.compareTo("0.00") !=0)
						{
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>
					  <%
					  }
					  %>					
					 </td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="35%" style="border-style:solid; border-width:medium">
					<script>document.write(MultiArray["Not ready"][lang])</script></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentNotReadyTime() ;
							out.write(percent);
						}
						catch(Exception e)
						{ 
							out.write("unknown");
						}
						%>					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<%
						if(percent.compareTo("0.00") !=0)
						{
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#000000"><img src="../img/percent.gif" width="100%" border="no" height="10" ></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>
					  <%
					  }
					  %>					
					  </td>
				  </tr>
			</table>
		</td>
	</tr>
	
	<%
	}
%>
</table>
<%
} //rapport non detaille

%>