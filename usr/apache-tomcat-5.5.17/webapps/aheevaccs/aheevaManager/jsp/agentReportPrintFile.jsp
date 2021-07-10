<%@page language = "java" %>
<%@page import ="aheevaManager.reports.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import ="java.io.*"%>
<%@page import = "java.io.File" %>
<%@page import = "java.io.RandomAccessFile" %>
<%@page import = "java.io.FileNotFoundException" %>
<%@page import = "java.io.IOException" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();

if(detail.compareTo("0")==0)
{
	String percent ="";
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
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageData.getWord("Monthly"));					
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageData.getWord("Yearly"));
								}
							
							%>
							<%=pageData.getWord("Report")%>&nbsp;  <%=pageData.getWord("for")%>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(" "+startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(" "+starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(" "+starting_year_yearly);
							}
							%>
							<%=pageData.getWord("To")%>
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
						<b><%=pageData.getWord("Answered calls")%>			
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
							<%=
								pageData.getWord("Login details")
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
			<%= pageData.getWord("First login")%></td>
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
				<%= pageData.getWord("Last logout")%></td>
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
				<%= pageData.getWord("Login time")%></td>
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
				<%= pageData.getWord("Login count")%></td>
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
							<%=
							 pageData.getWord("Inbound calls")
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
				<%= pageData.getWord("Inbound count")%></td>
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
				<%= pageData.getWord("Calls/hour")%></td>
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
				<%= pageData.getWord("Inbound time")%></td>
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
				<%= pageData.getWord("Inbound average")%></td>
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
							<%=
							pageData.getWord("Outbound calls")
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
					<%= pageData.getWord("Outbound count")%></td>
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
					<%= pageData.getWord("Calls/hour")%></td>
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
					<%= pageData.getWord("Outbound time")%></td>
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
					<%= pageData.getWord("Outbound average")%></td>
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
							<%=
							 pageData.getWord("Wrap up calls")
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
				<%= pageData.getWord("Wrap up count")%></td>
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
				<%= pageData.getWord("Calls/hour")%></td>
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
					<%= pageData.getWord("Wrap up time")%></td>
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
					<%= pageData.getWord("Wrap up average")%></td>
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
							<%=
							pageData.getWord("Hold calls")
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
					<%= pageData.getWord("Hold count")%></td>
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
					<%= pageData.getWord("Calls/hour")%></td>
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
					<%= pageData.getWord("Hold time")%></td>
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
					<%= pageData.getWord("Hold average")%></td>
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
							<%=
							 pageData.getWord("Percentages compared to login time")
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
					<%= pageData.getWord("Login")%></td>
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
					<%= pageData.getWord("Handling")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentHandlingTime() ;
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
					<%= pageData.getWord("Busy")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentBusyTime();
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
					<%= pageData.getWord("Inbound")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentInboundTime() ;
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
					<%= pageData.getWord("Outbound")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentOutboundTime() ;
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
					<%= pageData.getWord("Wrapup")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentWrapUpTime() ;
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
					<%= pageData.getWord("Hold")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentHoldTime() ;
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
	%>
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left"><font style="background-color:#FFC5A8">
						<b><%= pageData.getWord("Unanswered calls")%>				
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
							<%=
							 pageData.getWord("Waiting calls")
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
				<%= pageData.getWord("Waiting count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_Wait));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageData.getWord("Calls/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getWaitingPerHour());
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageData.getWord("Waiting time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalWaitTime));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageData.getWord("Waiting average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgWaitingTime());
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
							<%=
							 pageData.getWord("Transfer calls")
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
				<%= pageData.getWord("Transfert count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_single_transfer + agentInfo.n_two_step_transfer));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageData.getWord("Calls/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getTransferPerHour());
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageData.getWord("Transfert time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer));
						}catch(Exception e){
							out.write("unknown");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageData.getWord("Transfert average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgTransferTime());
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
							<%=
							 pageData.getWord("Not ready calls")
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
					<%= pageData.getWord("Not ready count")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(Long.toString(agentInfo.n_NotReady));
							}catch(Exception e){
								out.write("unknown");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageData.getWord("Calls/hour")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(agentInfo.getNotReadyPerHour());
							}catch(Exception e){
								out.write("unknown");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageData.getWord("Not ready time")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(agentInfo.buildReadableTime(agentInfo.totalNotReadyTime));
							}catch(Exception e){
								out.write("unknown");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageData.getWord("Not ready average")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<%
						try {
							out.write(agentInfo.getAvgNotReadyTime());
						}catch(Exception e){
							out.write("unknown");
						}
					%> </td>
				  </tr>
			</table>		</td>
	</tr>
<%
	if(agentInfo.totalNotReadyTime > 0)
	{
		String name ="" , nombre="";
		String duree ="", nrr_percent="";
		int nb_not_ready_reason = (agentInfo.NRR_vector.size())/4;
%>
	
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left"><b>
					  <%=
					  pageData.getWord("Not ready reason")
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
							out.write("Reason");
						%>          </td>
          <td height="20" class="reportsID" width="5%" align="center" style="border:solid"><%
							out.write("Count");
						%>          </td>
          <td height="20" class="reportsID" width="15%" align="center" style="border:solid"><%
							out.write("Time");
						%>          </td>
          <td colspan="2" height="20" class="reportsID" width="45%" align="center" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid"><%=
         pageData.getWord("Percentages compared to Not ready time")
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
							name =(String)agentInfo.NRR_vector.elementAt(j);
							out.write(name);
						%>
          </b> </td>
          <td class="reportsTabValues" width="5%" style="border:solid"><%
							w=j+1;
							nombre =(String)agentInfo.NRR_vector.elementAt(w);
							out.write(nombre);
						%>          </td>
          <td class="reportsTabValues" width="15%" style="border:solid"><%
							v=j+2;
							duree =(String)agentInfo.NRR_vector.elementAt(v);
							out.write(duree);
						%>          </td>
          <td class="reportsTabValues" width="10%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none"><%
							y=j+3;
							nrr_percent =(String)agentInfo.NRR_vector.elementAt(y);
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
							 pageData.getWord("Percentages compared to login time")
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
					<%= pageData.getWord("Login")%></td>
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
					<%= pageData.getWord("Wait")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentWaitingTime() ;
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
				<%= pageData.getWord("Single transfer")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentSingleTransferTime();
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
					<%= pageData.getWord("Two step transfer")%>r</td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentTwoStepTranferTime() ;
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
					<%= pageData.getWord("Not ready")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentNotReadyTime() ;
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
}
%>
<% pageData.closeConnection(); %>
