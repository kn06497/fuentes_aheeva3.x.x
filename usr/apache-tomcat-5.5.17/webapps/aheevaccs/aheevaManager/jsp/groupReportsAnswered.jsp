<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageRepAData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageRepAData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageRepAData.openConnection();

	String percent_Ans ="";
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
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
								  out.write(pageRepAData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageRepAData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageRepAData.getWord("Yearly"));
								}
							%>
							<%= pageRepAData.getWord("Report for answered calls")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageRepAData.getWord("To")%>
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
				<table width="70%" align="center">
					<tr><td height="20"></td></tr>
					<tr>
						<td width="100%" align="left"><font style="background-color:#FFC5A8">
							<b><%= pageRepAData.getWord("Answered calls")%>	
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
							<%= pageRepAData.getWord("Login details")%>
										
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
				<%= pageRepAData.getWord("Login time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(groupsInfo.buildReadableTime(groupsInfo.totalLoginTime));
					}catch(Exception e){
						out.write("-");
					}
				%> </td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepAData.getWord("Login count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(Long.toString(groupsInfo.n_login));
					}catch(Exception e){
						out.write("-");
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
							<%= pageRepAData.getWord("Inbound calls")%>					
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
				<%= pageRepAData.getWord("Inbound count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(groupsInfo.n_Inbound));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepAData.getWord("Calls/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(groupsInfo.getInboundPerHour());
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepAData.getWord("Inbound time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeInbound));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageRepAData.getWord("Inbound average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(groupsInfo.getAvgTalktimeInbound());
					}catch(Exception e){
						out.write("-");
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
							<%= pageRepAData.getWord("Outbound calls")%>					
						</b>
					</td>
				</tr>			
			</table></td></tr><tr>
		<td width="100%" align="center">
			<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr><td height="10"></td></tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageRepAData.getWord("Outbound count")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(Long.toString(groupsInfo.n_Outbound));
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageRepAData.getWord("Calls/hour")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {out.write(groupsInfo.getOutboundPerHour());}catch(Exception e){out.write("unknown");}%></td> </tr><tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Outbound time")%></td><td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium"><% try {out.write(groupsInfo.buildReadableTime(groupsInfo.totalTalkTimeOutbound));}catch(Exception e){out.write("unknown");}%></td></tr><tr ><td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Outbound average")%></td><td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium"><%try {out.write(groupsInfo.getAvgTalktimeOutbound());}catch(Exception e){out.write("unknown");}%> </td></tr></table></td></tr><tr><td width="100%" align="center"><table width="70%" align="center"><tr><td height="20"></td></tr><tr><td width="100%" align="left"><b><%= pageRepAData.getWord("Wrap up calls")%></b></td></tr></table></td></tr><tr>
		<td width="100%" align="center"><table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse "><tr><td height="10"></td></tr><tr ><td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Wrap up count")%></td><td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium"><% try {out.write(Long.toString(groupsInfo.n_Wrap_In_up + groupsInfo.n_Wrap_Out_up));}catch(Exception e){out.write("unknown");}%></td></tr> <tr ><td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Wrap_up/hour")%></td><td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium"><% try {out.write(groupsInfo.getWrapUpPerHour());}catch(Exception e){out.write("unknown");}%></td> </tr><tr ><td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Wrap up time")%></td><td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium"><% try {out.write(groupsInfo.buildReadableTime(groupsInfo.totalWrapUpInTime + groupsInfo.totalWrapUpOutTime));}catch(Exception e){out.write("unknown");}%></td> </tr> <tr ><td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Wrap up average")%></td><td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium"><%try {out.write(groupsInfo.getAvgWrapUpTime());}catch(Exception e){out.write("unknown");}%> </td> </tr></table></td></tr><tr><td width="100%" align="center"><table width="70%" align="center"><tr><td height="20"></td></tr><tr><td width="100%" align="left"><b><%= pageRepAData.getWord("Hold calls")%></b></td></tr></table></td></tr><tr><td width="100%" align="center"><table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse "> <tr><td height="10"></td></tr><tr ><td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Hold count")%></td><td class="reportsTabValues" width="60%"  style="border-style:solid; border-width:medium"><% try {out.write(Long.toString(groupsInfo.n_hold));}catch(Exception e){out.write("unknown");}%></td> </tr> <tr ><td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Hold/hour")%></td><td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium"><% try {out.write(groupsInfo.getHoldPerHour());}catch(Exception e){out.write("unknown");}%></td> </tr><tr ><td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Hold time")%></td><td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium"><% try {out.write(groupsInfo.buildReadableTime(groupsInfo.totalHoldTime));}catch(Exception e){out.write("unknown");}%></td> </tr> <tr ><td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Hold average")%></td><td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium"><%try {out.write(groupsInfo.getAvgTalktimeHold());}catch(Exception e){out.write("unknown");}%> </td> </tr></table></td></tr><%if(groupsInfo.totalLoginTime > 0){%><tr><td width="100%" align="center"><table width="70%" align="center"><tr><td height="20"></td></tr><tr><td width="100%" align="left"><b><%= pageRepAData.getWord("Percentages compared to login time")%></b></td></tr></table></td></tr><tr>
		<td width="100%" align="center"><table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse "><tr><td height="10"></td></tr><tr ><td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Login")%></td><td class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none"></td><td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="100%" height="10" align="left"><tr><td width="95%"  style="background-color:#BCBCDE"></td><td width="5%" style="background-color:#F4F4F4"></td></tr></table></td></tr> <tr ><td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Handling")%></td><td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none"><%try {percent_Ans = groupsInfo.getPercentHandlingTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}%></td><td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left"><tr><td width="95%" style="background-color:#BCBCDE"></td><td width="5%" style="background-color:#F4F4F4"></td></tr> </table></td></tr><tr ><td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Busy")%></td><td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none"><%try {percent_Ans = groupsInfo.getPercentBusyTime();out.write(percent_Ans);}catch(Exception e){out.write("unknown");}%></td><td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left"><tr><td width="95%" style="background-color:#BCBCDE"></td><td width="5%" style="background-color:#F4F4F4"></td></tr></table></td></tr> <tr ><td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Inbound")%></td><td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none"><%try {percent_Ans = groupsInfo.getPercentInboundTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}%></td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left"><tr><td width="95%" style="background-color:#BCBCDE"></td><td width="5%" style="background-color:#F4F4F4"></td></tr> </table></td> </tr> <tr ><td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Outbound")%></td><td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none"><%try {percent_Ans = groupsInfo.getPercentOutboundTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}%></td><td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left"><tr><td width="95%" style="background-color:#BCBCDE"></td><td width="5%" style="background-color:#F4F4F4"></td></tr></table></td> </tr> <tr ><td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Wrapup")%></td><td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none"><%try{percent_Ans = groupsInfo.getPercentWrapUpTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}%></td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left"><tr><td width="95%" style="background-color:#BCBCDE"></td><td width="5%" style="background-color:#F4F4F4"></td></tr></table></td> </tr> <tr ><td class="reportsTabName" width="25%" style="border-style:solid; border-width:medium"><%= pageRepAData.getWord("Hold")%></td><td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none"><%try {percent_Ans = groupsInfo.getPercentHoldTime() ;out.write(percent_Ans);}catch(Exception e){out.write("unknown");}%></td>
					<td class="reportsTabValues" width="50%" valign="middle" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent_Ans); %>" height="10" align="left"><tr><td width="95%" style="background-color:#BCBCDE"></td><td width="5%" style="background-color:#F4F4F4"></td></tr></table></td></tr></table></td></tr><%}%></table>
<% pageRepAData.closeConnection(); %>
