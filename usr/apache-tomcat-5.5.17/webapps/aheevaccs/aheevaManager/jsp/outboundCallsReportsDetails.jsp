<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageOutRData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageOutRData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageOutRData.openConnection();
%>
<%
long totLoginTime=0;
String writeName="";
long totnbContacts=0,totnbSucess=0 ,totnbRefusals=0,totnbCallsBacks =0,	 totRContacts=0, totalContacts = 0; 
String callsPerHour="0.00", sallesPerHour ="0.00", refusalsPerHour ="0.00", netContRate ="0.00", totalContactsPerHour="0.00";
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>

<table width="100%" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="center">
					  <b><%out.write(agentGroupName);%></b>				
					 </td>
				</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="center" ><font color="#003366">
						<b>
							<%
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) {
								  out.write(pageOutRData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) {
								out.write(pageOutRData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) {
								out.write(pageOutRData.getWord("Yearly"));
								}
							
							%>
							<%= pageOutRData.getWord("Outbound calls")%>&nbsp; <%= pageOutRData.getWord("Report")%>&nbsp; <%= pageOutRData.getWord("From")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageOutRData.getWord("To")%>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							%>
						</b></font>
					</td>
				</tr>
				<tr><td height="20"></td></tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%= pageOutRData.getWord("Data")
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
			<table width="80%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" >
				<td width="12%" align="center"> <b><%= pageOutRData.getWord("Agent ID")%></b> </td>
				<td width="25%" align="center"> <b><%= pageOutRData.getWord("Agent name")%></b> </td>
				<td width="14%" align="center"> <b> <%= pageOutRData.getWord("Total login time")%></b> </td>
				<td width="12%" align="center"> <b><%= pageOutRData.getWord("Total calls")%> </b> </td>
				<td width="12%" align="center"> <b><%= pageOutRData.getWord("Total contacts")%> </b> </td>
				<td width="12%" align="center"> <b><<%= pageOutRData.getWord("Success")%></b> </td>
				<td width="12%" align="center"> <b><%= pageOutRData.getWord("Refusals")%></b> </td>
				<td width="16%"   align="center"> <b><%= pageOutRData.getWord("Callbacks")%></b> </td>
			  </tr>
			<%
					  for (j = 0; j < beanAgentPerf.m_gAllDetails.size(); j++)
					   {
						 r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_gAllDetails.elementAt(j);
						 if(r1.agentFullName != null) writeName=r1.agentFullName;
						 else writeName= " ";
			%>
				  <tr <% if(j%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");%> >
					  <td  align="center"><%out.write(r1.agentId);%></td>
					  <td   align="left" >&nbsp;&nbsp;<%out.write(writeName);%></td>
					  <td  align="center"><%out.write(r1.getTotalLoginTime());%></td>
					  <td    align="center" ><%out.write(Long.toString(r1.NbContacts));%> </td>
					  <td    align="center" ><%out.write(Long.toString(r1.totalContacts));%> </td>
					  <td    align="center" ><%out.write(Long.toString(r1.NbSales));%> </td>
					  <td  align="center"><%out.write(Long.toString(r1.NbNoSales));%></td>
					  <td    align="center" ><%out.write(Long.toString(r1.NbCallBacks));%> </td>
				  </tr>
		<!-- end of array traversal-->
		<%
				totLoginTime += r1.totalLoginTime;
				totnbContacts += r1.NbContacts;
				totnbSucess += r1.NbSales;
				totnbRefusals += r1.NbNoSales;
				totnbCallsBacks += r1.NbCallBacks;
				totalContacts += r1.totalContacts;
			   
			  } //fin for
			r1 = new beanAgentPerformanceDetails();
%>
				<tr>
					 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%= pageOutRData.getWord("Total")%> </b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(r1.buildReadableTime(totLoginTime));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totnbContacts));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totalContacts));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totnbSucess));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totnbRefusals));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totnbCallsBacks));%></font></td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write(pageOutRData.getWord("Statistics"));
								totLoginTime=0;
								writeName="";
								totnbContacts=0;totnbSucess=0 ;totnbRefusals=0; totnbCallsBacks =0; totalContacts = 0;
								totRContacts=0;
								callsPerHour="0.00"; sallesPerHour ="0.00"; refusalsPerHour ="0.00"; netContRate ="0.00";totalContactsPerHour="0.00";
								
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
			<table width="80%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" >
				<td width="12%" align="center"> <b><%= pageOutRData.getWord("Agent ID")%></b> </td>
				<td width="25%" align="center"> <b><%= pageOutRData.getWord("Agent name")%></b> </td>
				<td width="12%" align="center"> <b><%= pageOutRData.getWord("Calls/hour")%></b> </td>
				<td width="12%" align="center"> <b><%= pageOutRData.getWord("Contact/hour")%></b> </td>
				<td width="12%" align="center"> <b><%= pageOutRData.getWord("Sales/hour")%></b> </td>
				<td width="12%" align="center"> <b><%= pageOutRData.getWord("Refusals/hour")%></b> </td><!-- rEFUSALS/H FROM DATABASE -->
				<td width="16%"   align="center"> <b><%= pageOutRData.getWord("Net Conv. Rate")%></b> </td>
			  </tr>
			<%
					  for (j = 0; j < beanAgentPerf.m_gAllDetails.size(); j++)
					   {
						 r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_gAllDetails.elementAt(j);
						 if(r1.agentFullName != null) writeName=r1.agentFullName;
						 else writeName= " ";
						 if(r1.totalLoginTime !=0)
						 {
							 callsPerHour =r1.formatDecimalDouble( ( (double)r1.NbContacts*3600/r1.totalLoginTime), 2);
							 sallesPerHour = r1.formatDecimalDouble( ( (double)r1.NbSales*3600/r1.totalLoginTime), 2);
							 refusalsPerHour = r1.formatDecimalDouble( ( (double)r1.NbNoSales*3600/r1.totalLoginTime), 2);
							 totalContactsPerHour = r1.formatDecimalDouble( ( (double)r1.totalContacts*3600/r1.totalLoginTime), 2);
							
						 }
						 if(r1.RContacts >0)
						 {
						 netContRate = r1.formatDecimalDouble( ( (double)r1.NbSales*100/r1.RContacts), 2);
						 }
						 else
			 				netContRate ="0.00";
						 
						 
			%>
				  <tr <% if(j%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");%> >
					  <td  align="center"><%out.write(r1.agentId);%></td>
					  <td   align="left" >&nbsp;&nbsp;<%out.write(writeName);%></td>
					  <td  align="center"><%out.write(callsPerHour);%></td>
					  <td  align="center"><%out.write(totalContactsPerHour);%></td>
					  <td    align="center" ><%out.write(sallesPerHour);%> </td>
					  <td    align="center" ><%out.write(refusalsPerHour);%> </td>
					  <td  align="center"><%out.write(netContRate + "%");%></td>
				  </tr>
		<!-- end of array traversal-->
		<%
			callsPerHour ="0.00";sallesPerHour="0.00";refusalsPerHour="0.00";netContRate="0.00";totalContactsPerHour="0.00";
				totLoginTime += r1.totalLoginTime;
				totnbContacts += r1.NbContacts;
				totnbSucess += r1.NbSales;
				totnbRefusals += r1.NbNoSales;
				totRContacts += r1.RContacts;
				totalContacts += r1.totalContacts;
				//System.out.println("---------totnbSucess--------"+Long.toString(totnbSucess));
				//System.out.println("---------totRContacts--------"+Long.toString(totRContacts));
			  }
			r1 = new beanAgentPerformanceDetails();
			 if(totLoginTime !=0)
			 {
				 callsPerHour =r1.formatDecimalDouble( ( (double)totnbContacts*3600/totLoginTime), 2);
				 sallesPerHour = r1.formatDecimalDouble( ( (double)totnbSucess*3600/totLoginTime), 2);
				 refusalsPerHour = r1.formatDecimalDouble( ( (double)totnbRefusals*3600/totLoginTime), 2);
				 totalContactsPerHour = r1.formatDecimalDouble( ( (double)totalContacts*3600/totLoginTime), 2);
			}
			 if(totRContacts >0)
			 {
			 netContRate = r1.formatDecimalDouble( ( (double)totnbSucess*100/totRContacts), 2);
			 }
			 else
			 	netContRate ="0.00";

%>

				<tr>
					 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%= pageOutRData.getWord("Total")%> </b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(callsPerHour);%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(totalContactsPerHour);%></font></td>
					  <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(sallesPerHour);%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(refusalsPerHour);%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(netContRate+ "%");%></font></td>
				</tr>
			</table>
		</td>
	</tr>


</table>
<% pageOutRData.closeConnection(); %>
