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
beanManagerData pageUnAnsData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageUnAnsData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageUnAnsData.openConnection();
    %>
<%
	String percent ="";
%>
<table width="75%" cellpadding="0" cellspacing="0" align="center">
<%
	if(from.compareTo("agentReport") != 0)
	{

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
								try { out.write(beanAgent.getAgentFullName(agentId)); }
								catch(Exception e) { out.write(""); }
							%>
						  [
						  <% out.println(agentId); %>
					  	 ]					  </b>					</td>
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
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write( pageUnAnsData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageUnAnsData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageUnAnsData.getWord("Yearly"));
								}
							%>
							<%= pageUnAnsData.getWord("Report for unanswered calls")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageUnAnsData.getWord("To")%>
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
							<b><%= pageUnAnsData.getWord("Unanswered calls")%>				
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
							 pageUnAnsData.getWord("Waiting calls")
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
				<%= pageUnAnsData.getWord("Waiting count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_Wait));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageUnAnsData.getWord("Waiting/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getWaitingPerHour());
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageUnAnsData.getWord("Waiting time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalWaitTime));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageUnAnsData.getWord("Waiting average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgWaitingTime());
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
							pageUnAnsData.getWord("Transfer calls")
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
				<%= pageUnAnsData.getWord("Transfert count")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(Long.toString(agentInfo.n_single_transfer + agentInfo.n_two_step_transfer));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageUnAnsData.getWord("Transfer/hour")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.getTransferPerHour());
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageUnAnsData.getWord("Transfert time")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<% try {
							out.write(agentInfo.buildReadableTime(agentInfo.totalSingleTransfer + agentInfo.totalTwoStepTranfer));
						}catch(Exception e){
							out.write("-");
						}
					%></td>
			  </tr>
			  <tr >
				<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
				<%= pageUnAnsData.getWord("Transfert average")%></td>
				<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
				<%
					try {
						out.write(agentInfo.getAvgTransferTime());
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
							 pageUnAnsData.getWord("Not ready calls")
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
					<%= pageUnAnsData.getWord("Not ready count")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(Long.toString(agentInfo.n_NotReady));
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageUnAnsData.getWord("Not-Ready/hour")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(agentInfo.getNotReadyPerHour());
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageUnAnsData.getWord("Not ready time")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
						<% try {
								out.write(agentInfo.buildReadableTime(agentInfo.totalNotReadyTime));
							}catch(Exception e){
								out.write("-");
							}
						%></td>
				  </tr>
				  <tr >
					<td class="reportsTabName" width="40%" style="border-style:solid; border-width:medium">
					<%= pageUnAnsData.getWord("Not ready average")%></td>
					<td class="reportsTabValues" width="60%" style="border-style:solid; border-width:medium">
					<%
						try {
							out.write(agentInfo.getAvgNotReadyTime());
						}catch(Exception e){
							out.write("-");
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
		//int nb_not_ready_reason=9;
%>
	
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left"><b>
					  <%=
					pageUnAnsData.getWord("Not ready reason")
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
          <td height="20" class="reportsID" width="35%" align="center" style="border:solid"><%=
           pageUnAnsData.getWord("Reason")
						%>          </td>
          <td height="20" class="reportsID" width="5%" align="center" style="border:solid">
          <%= pageUnAnsData.getWord("Count")
						%>          </td>
          <td height="20" class="reportsID" width="15%" align="center" style="border:solid">
          <%= pageUnAnsData.getWord("Time")
						%>          </td>
          <td colspan="2" height="20" class="reportsID" width="45%" align="center" style="border-left:none; border-top:solid; border-bottom:solid; border-right:solid">
          <%= pageUnAnsData.getWord("Percentages compared to Not ready time")
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
							 pageUnAnsData.getWord("Percentages compared to login time")
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
					<%= pageUnAnsData.getWord("Login")%></td>
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
					<%= pageUnAnsData.getWord("Wait")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentWaitingTime() ;
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
					<%= pageUnAnsData.getWord("Single transfer")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentSingleTransferTime();
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
					<%= pageUnAnsData.getWord("Two step transfer")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentTwoStepTranferTime() ;
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
					<%= pageUnAnsData.getWord("Not ready")%></td>
					<td align="center" class="reportsTabValues" width="15%" style="border-left:solid; border-top:solid; border-bottom:solid; border-right:none">
						<%
						try 
						{
							percent = agentInfo.getPercentNotReadyTime() ;
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
<% pageUnAnsData.closeConnection(); %>
