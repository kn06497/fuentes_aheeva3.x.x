<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageRepUnData = new beanManagerData();
pageRepUnData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepUnData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	String percent ="";
%>
<table width="75%" cellpadding="0" cellspacing="0" align="center">
<%
if(from.compareTo("groupReport") != 0){
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
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
						  </b>					</td>
				</tr>			
			</table>		</td>
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
								  out.write(pageRepUnData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepUnData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepUnData.getWord("Yearly"));
								}
							%>
							<%= pageRepUnData.getWord("Report for unanswered calls")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageRepUnData.getWord("To")%>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							%>
						</b>					</td>
				</tr>			
			</table>		</td>
	</tr>
<%
	}
	else
	{
	 %>
		<tr>
			<td width="100%" align="center">
				<table width="70%" align="center">
					<tr><td height="20"></td></tr>
					<tr>
						<td width="100%" align="left"><font style="background-color:#FFC5A8">
							<b><%= pageRepUnData.getWord("Unanswered calls")%>				
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
							<%=
								 pageRepUnData.getWord("Waiting calls")
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
				<%= pageRepUnData.getWord("Waiting count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(groupsInfo.n_Wait));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepUnData.getWord("Waiting/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(groupsInfo.getWaitingPerHour());
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>			 
			   <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepUnData.getWord("Waiting time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalWaitTime));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepUnData.getWord("Waiting average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(groupsInfo.getAvgWaitingTime());
					}catch(Exception e){
						out.write("-");
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
							<%=
							pageRepUnData.getWord("Transfer calls")
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
				<%= pageRepUnData.getWord("Transfert count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(groupsInfo.n_single_transfer + groupsInfo.n_two_step_transfer));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepUnData.getWord("Transfer/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(groupsInfo.getTransferPerHour());
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepUnData.getWord("Transfert time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalSingleTransfer + groupsInfo.totalTwoStepTranfer));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepUnData.getWord("Transfert average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(groupsInfo.getAvgTransferTime());
					}catch(Exception e){
						out.write("-");
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
							<%=
							 pageRepUnData.getWord("Not ready calls")
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
					<%= pageRepUnData.getWord("Not ready count")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(Long.toString(groupsInfo.n_NotReady));
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageRepUnData.getWord("Not-Ready/hour")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(groupsInfo.getNotReadyPerHour());
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageRepUnData.getWord("Not ready time")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(groupsInfo.buildReadableTime(groupsInfo.totalNotReadyTime));
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageRepUnData.getWord("Not ready average")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<%
						try {
							out.write(groupsInfo.getAvgNotReadyTime());
						}catch(Exception e){
							out.write("-");
						}
			
					%> </td>
				  </tr>
			</table>		</td>
	</tr>
<%
	if(groupsInfo.totalNotReadyTime > 0){
		String name ="" , nombre="";
		String duree ="", nrr_percent="";
		int nb_not_ready_reason = (groupsInfo.NRR_vector.size())/4;
%>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left"><b>
					  <%=
					  pageRepUnData.getWord("Not ready reason")
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
          <td height="20" class="reportsID" width="35%" align="center" style="border:solid">
          <%= pageRepUnData.getWord("Reason")
						%>          </td>
          <td height="20" class="reportsID" width="5%" align="center" style="border:solid">
          <%= pageRepUnData.getWord("Count")
						%>          </td>
          <td height="20" class="reportsID" width="15%" align="center" style="border:solid">
          <%= pageRepUnData.getWord("Time")
						%>          </td>
          <td colspan="2" height="20" class="reportsID" width="45%" align="center" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">
          <%= pageRepUnData.getWord("Percentages compared to Not ready time")
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
							if (nrr_percent.compareTo("0.99%")<0 && nrr_percent.compareTo("0.00%")>0) {
								nrr_percent="1.00%";
							}
						%>          </td>
          <td class="reportsTabValues" width="35%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(nrr_percent); %>" height="10" align="left">
              <tr>
                <td width="95%"  style="background-color:#BCBCDE"></td>
                <td width="5%" style="background-color:#F4F4F4"></td>
              </tr>
          </table></td>
        </tr>
        <%
		}
	%>
      </table></td>
	</tr>
<%
	}
	if(groupsInfo.totalLoginTime > 0){
%>	
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%= pageRepUnData.getWord("Percentages compared to login time")
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
					<%= pageRepUnData.getWord("Login")%></td>
					<td class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="100%" height="10" align="left">
							<tr>
								<td width="95%"  style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>					</td>
				  </tr>
							
				  <tr >
					<td class="reportsTabName" width="35%" style="border-style:solid; border-width:medium">
					<%= pageRepUnData.getWord("Wait")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentWaitingTime() ;
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						
						%>					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="35%" style="border-style:solid; border-width:medium">
					<%= pageRepUnData.getWord("Single transfer")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentSingleTransferTime();
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						%>					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="35%" style="border-style:solid; border-width:medium">
					<%= pageRepUnData.getWord("Two step transfer")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentTwoStepTranferTime() ;
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						%>					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>					</td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="35%" style="border-style:solid; border-width:medium">
					<%= pageRepUnData.getWord("Not ready")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = groupsInfo.getPercentNotReadyTime() ;
							out.write(percent);
							if (percent.compareTo("0.99%")<0 && percent.compareTo("0.00%")>0) {
								percent="1.00%";
							}
						}
						catch(Exception e)
						{ 
							out.write("-");
						}
						%>					</td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">		      	
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent); %>" height="10" align="left">
							<tr>
								<td width="95%" style="background-color:#BCBCDE"></td>
								<td width="5%" style="background-color:#F4F4F4"></td>
							</tr>
					  </table>					</td>
				  </tr>
			</table>		</td>
	</tr>
	<%
	}
	%>	
</table>
<% pageRepUnData.closeConnection(); %>
