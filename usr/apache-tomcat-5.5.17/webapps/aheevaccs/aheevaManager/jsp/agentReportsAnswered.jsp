<% String percent_Ans =""; %>
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
beanManagerData page2Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	page2Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    page2Data.openConnection();
    %>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javaScript" type="text/javascript">
var lang = normalizeString(QueryString('lang'));
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
								  out.write(page2Data.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0)
							    {
								out.write(page2Data.getWord("Monthly"));
								}
							else if (reportType.compareTo("Yearly")==0)
							    {
								out.write(page2Data.getWord("Yearly"));
								}

							%>
							<%= page2Data.getWord("Details Report for answered calls")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= page2Data.getWord("To")%>
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
							<b><%= page2Data.getWord("Answered calls")%>
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
							 page2Data.getWord("Login details")
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
				<%= page2Data.getWord("First login")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(beanAgent.getfirstLoginTime());
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Last logout")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(beanAgent.getLastLogoutTime().substring(0,19));
					}catch(Exception e){
						out.write("-");
					}
				%> </td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Login time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
					}catch(Exception e){
						out.write("-");
					}
				%> </td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Login count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(Long.toString(agentInfo.n_login));
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
							<%=
							 page2Data.getWord("Inbound calls")
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
				<%= page2Data.getWord("Inbound count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_Inbound));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Calls/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getInboundPerHour());
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Inbound time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeInbound));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Inbound average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgTalktimeInbound());
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
							<%=
							 page2Data.getWord("Outbound calls")
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
					<%= page2Data.getWord("Outbound count")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(Long.toString(agentInfo.n_Outbound));
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= page2Data.getWord("Calls/hour")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(agentInfo.getOutboundPerHour());
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>

				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= page2Data.getWord("Outbound time")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalTalkTimeOutbound));
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= page2Data.getWord("Outbound average")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<%
						try {
							out.write(agentInfo.getAvgTalktimeOutbound());
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
							<%=
							 page2Data.getWord("Wrap up calls")
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
				<%= page2Data.getWord("Wrap up count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_Wrap_In_up + agentInfo.n_Wrap_Out_up));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Wrap_up/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getWrapUpPerHour());
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Wrap up time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalWrapUpInTime + agentInfo.totalWrapUpOutTime));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Wrap up average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgWrapUpTime());
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
							<%=
							 page2Data.getWord("Hold calls")
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
				<%= page2Data.getWord("Hold count")%></td>
				<td class="reportsTabValues" width="60%"  style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_hold));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Hold/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getHoldPerHour());
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Hold time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalHoldTime));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >

				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= page2Data.getWord("Hold average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgTalktimeHold());
					}catch(Exception e){
						out.write("-");
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
							<%=
							 page2Data.getWord("Percentages compared to login time")
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
				<%= page2Data.getWord("Login")%></td>
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
					<%= page2Data.getWord("Handling")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try
						{
							percent_Ans = agentInfo.getPercentHandlingTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
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
					<%= page2Data.getWord("Busy")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try
						{
							percent_Ans = agentInfo.getPercentBusyTime();
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
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
					<%= page2Data.getWord("Inbound")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try
						{
							percent_Ans = agentInfo.getPercentInboundTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
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
				<%= page2Data.getWord("Outbound")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try
						{
							percent_Ans = agentInfo.getPercentOutboundTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
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
					<%= page2Data.getWord("Wrapup")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try
						{
							percent_Ans = agentInfo.getPercentWrapUpTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
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
					<%= page2Data.getWord("Hold")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try
						{
							percent_Ans = agentInfo.getPercentHoldTime() ;
							out.write(percent_Ans);
							if (percent_Ans.compareTo("0.99%")<0 && percent_Ans.compareTo("0.00%")>0) {
								percent_Ans="1.00%";
							}
						}
						catch(Exception e)
						{
							out.write("-");
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
<% page2Data.closeConnection(); %>
