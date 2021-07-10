<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageOutRdData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageOutRdData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageOutRdData.openConnection();
%>
<%
long tLoginTime = 0, ssLoginTime =0, totLoginTime=0;
String tempLastName="", tempFirstName ="", LastName="", FirstName ="", writeName="";
long GroupForAgent =1, first =1;
long nbContacts=0, totnbContacts=0, nbSucess=0 ,totnbSucess=0 ,nbRefusals=0,totnbRefusals=0, nbCallsBacks=0, totnbCallsBacks =0,
	 RContacts =0, totRContacts=0, tContacts=0, TContacts=0;
String callsPerHour="0.00", sallesPerHour ="0.00", refusalsPerHour ="0.00", netContRate ="0.00", totalContactsPerHour ="0.00";

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
					<td width="100%" align="center" ><font color="#003366">
						<b>
							<%
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageOutRdData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageOutRdData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageOutRdData.getWord("Yearly"));
								}
							
							%>
							
							<%= pageOutRdData.getWord("Outbound calls")%>&nbsp;<%= pageOutRdData.getWord("Report")%>&nbsp; <%= pageOutRdData.getWord("From")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageOutRdData.getWord("To")%>
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
						<%= pageOutRdData.getWord("Data")
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
				<td width="12%" align="center"> <b><%= pageOutRdData.getWord("Agent ID")%></b> </td>
				<td width="25%" align="center"> <b><%= pageOutRdData.getWord("Agent name")%></b> </td>
				<td width="15%" align="center"> <b><%= pageOutRdData.getWord("Campaign")%> </b> </td>
				<td width="12%" align="center"> <b><%= pageOutRdData.getWord("Total login time")%></b> </td>
				<td width="10%" align="center"> <b><%= pageOutRdData.getWord("Total calls")%> </b> </td>
				<td width="10%" align="center"> <b><%= pageOutRdData.getWord("Total contacts")%> </b> </td>
				<td width="10%" align="center"> <b><%= pageOutRdData.getWord("Success")%></b> </td>
				<td width="10%" align="center"> <b><%= pageOutRdData.getWord("Refusals")%></b> </td>
				<td width="13%"   align="center"> <b><%= pageOutRdData.getWord("Callbacks")%></b> </td>
			  </tr>
<!-- traverse the array -->
			<%
			  for (j = 0; j < beanAgentPerf.m_vAllDetails.size(); j++)
			   {
				 r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_vAllDetails.elementAt(j);
				 if(r1.agentFullName != null) writeName=r1.agentFullName;
				 else writeName= " ";
				 if(r1.agentLastName != null) LastName=r1.agentLastName;
				 else LastName= " ";
				 if(r1.agentFirstName != null) FirstName =r1.agentFirstName;
				 else FirstName = " ";
				// System.out.println("\n \n nb objets-------------"+nb_obj+"\n");
			   if(LastName.compareTo(tempLastName) == 0 && FirstName.compareTo(tempFirstName) ==0)
			   {	
					writeName =" ";
					GroupForAgent =GroupForAgent +1;
			   }
			  else
				{
				
					if(first ==0 && GroupForAgent >1) //previous agent has 2 group
					{%>
						<tr>
							 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write("Sub total");%> </b></font></td>
							 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(tempLastName+" "+tempFirstName);%></font></td>
							 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
							 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(r1.buildReadableTime(tLoginTime));%></font></td>
							 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(nbContacts));%></font></td>
							 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(tContacts));%></font></td>
							 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(nbSucess));%></font></td>
							 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(nbRefusals));%></font></td>
							 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(Long.toString(nbCallsBacks));%></b></font></td>
						</tr>
						<%
						GroupForAgent =1;
					}
					tLoginTime=0;nbContacts =0; nbSucess =0; nbRefusals =0; nbCallsBacks=0; tContacts=0;
					writeName =LastName+" "+FirstName;
			   } //fin else
				%>
		  <tr <% if(j%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
			  <td  align="center"><%out.write(r1.agentId);%></td>
			  <td   align="left" >&nbsp;&nbsp;<%out.write(writeName);%></td>
			  <td    align="center" nowrap><font color="#800000"><%out.write(r1.campaignName);%></font></td>
			  <td  align="center"><%out.write(r1.getTotalLoginTime());%></td>
			  <td    align="center" ><%out.write(Long.toString(r1.NbContacts));%> </td>
			  <td    align="center" ><%out.write(Long.toString(r1.totalContacts));%> </td>
			  <td    align="center" ><%out.write(Long.toString(r1.NbSales));%> </td>
			  <td  align="center"><%out.write(Long.toString(r1.NbNoSales));%></td>
			  <td    align="center" ><%out.write(Long.toString(r1.NbCallBacks));%> </td>
		  </tr>
	<!-- end of array traversal-->
	<%
		tLoginTime += r1.totalLoginTime;
		tempLastName=LastName;  tempFirstName =FirstName;
		first =0;	
		totLoginTime += r1.totalLoginTime;
		totnbContacts += r1.NbContacts;
		nbContacts += r1.NbContacts;
		totnbSucess += r1.NbSales;
		nbSucess += r1.NbSales;
		totnbRefusals += r1.NbNoSales;
		nbRefusals += r1.NbNoSales;
		totnbCallsBacks += r1.NbCallBacks;
		nbCallsBacks += r1.NbCallBacks;
		tContacts += r1.totalContacts;
		TContacts += r1.totalContacts;
	  }
	r1 = new beanAgentPerformanceDetails();
	%>
				<tr>
					 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%= pageOutRdData.getWord("Total")%> </b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(" ");%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(r1.buildReadableTime(totLoginTime));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(totnbContacts));%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(Long.toString(TContacts));%></font></td>
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
								out.write(pageOutRdData.getWord("Statistics"));
								tLoginTime = 0; ssLoginTime =0; totLoginTime=0;
								tempLastName=""; tempFirstName =""; LastName=""; FirstName =""; writeName="";
								GroupForAgent =1; first =1;
								nbContacts=0; totnbContacts=0; nbSucess=0 ;totnbSucess=0 ;nbRefusals=0;totnbRefusals=0; nbCallsBacks=0; totnbCallsBacks =0;TContacts=0; tContacts=0;
								RContacts =0; totRContacts=0;
								callsPerHour="0.00"; sallesPerHour ="0.00"; refusalsPerHour ="0.00"; netContRate ="0.00"; totalContactsPerHour="0.00";
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
				<td width="12%" align="center"> <b><%= pageOutRdData.getWord("Agent ID")%></b> </td>
				<td width="25%" align="center"> <b><%= pageOutRdData.getWord("Agent name")%></b> </td>
				<td width="16%" align="center"> <b><%= pageOutRdData.getWord("Campaign")%> </b> </td>
				<td width="10%" align="center"> <b><%= pageOutRdData.getWord("Calls/hour")%></b> </td>
				<td width="10%" align="center"> <b><%= pageOutRdData.getWord("Contact/hour")%></b> </td>
				<td width="10%" align="center"> <b><%= pageOutRdData.getWord("Sales/hour")%></b> </td>
				<td width="10%" align="center"> <b><%= pageOutRdData.getWord("Refusals/hour")%></b> </td>
				<td width="13%"   align="center"> <b><%= pageOutRdData.getWord("Net Conv. Rate")%></b> </td>
			  </tr>
			<%
					  for (j = 0; j < beanAgentPerf.m_vAllDetails.size(); j++)
					   {
							r1 = (beanAgentPerformanceDetails)beanAgentPerf.m_vAllDetails.elementAt(j);
							if(r1.agentFullName != null) writeName=r1.agentFullName;
							else writeName= " ";
							if(r1.agentLastName != null) LastName=r1.agentLastName;
							else LastName= " ";
							if(r1.agentFirstName != null) FirstName =r1.agentFirstName;
							else FirstName = " ";
							if(LastName.compareTo(tempLastName) == 0 && FirstName.compareTo(tempFirstName) ==0)
							{	
								writeName =" ";
								GroupForAgent =GroupForAgent +1;
							}
							else
							{
							
								if(first ==0 && GroupForAgent >1) //previous agent has 2 group
								{
									if(tLoginTime !=0)
									{
									 callsPerHour =r1.formatDecimalDouble( ( (double)nbContacts*3600/tLoginTime), 2);
									 sallesPerHour = r1.formatDecimalDouble( ( (double)nbSucess*3600/tLoginTime), 2);
									 refusalsPerHour = r1.formatDecimalDouble( ( (double)nbRefusals*3600/tLoginTime), 2);
									 totalContactsPerHour = r1.formatDecimalDouble( ( (double)tContacts*3600/tLoginTime), 2);
									}
									else
									{
										callsPerHour ="0.00";sallesPerHour="0.00";refusalsPerHour="0.00";totalContactsPerHour="0.00";
									}
									
									 if(RContacts >0)
									 {
									 netContRate = r1.formatDecimalDouble( ( (double)nbSucess*100/ RContacts), 2);
									 }
									 else
									 	netContRate ="0.00";

								%>
									<tr>
										 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%= pageOutRdData.getWord("Sub total")%> </b></font></td>
										 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(tempLastName+" "+tempFirstName);%></font></td>
										 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
										 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(callsPerHour);%></font></td>
										 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(totalContactsPerHour);%></font></td>
										 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(sallesPerHour);%></font></td>
										 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(refusalsPerHour);%></font></td>
										 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(netContRate +"%");%></font></td>
									</tr>
									<%
									GroupForAgent =1;
								}
								tLoginTime=0;nbContacts =0; nbSucess =0; nbRefusals =0; tContacts=0;
								RContacts =0;
								writeName =LastName+" "+FirstName;
							}
							if(r1.totalLoginTime !=0)
							{
							 callsPerHour =r1.formatDecimalDouble( ( (double)r1.NbContacts*3600/r1.totalLoginTime), 2);
							 sallesPerHour = r1.formatDecimalDouble( ( (double)r1.NbSales*3600/r1.totalLoginTime), 2);
							 refusalsPerHour = r1.formatDecimalDouble( ( (double)r1.NbNoSales*3600/r1.totalLoginTime), 2);
							 totalContactsPerHour = r1.formatDecimalDouble( ( (double)r1.totalContacts*3600/r1.totalLoginTime), 2);
							}
							else
							{
								callsPerHour ="0.00";sallesPerHour="0.00";refusalsPerHour="0.00";totalContactsPerHour="0.00";
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
					  <td align="center"><%out.write(r1.agentId);%></td>
					  <td align="left" >&nbsp;&nbsp;<%out.write(writeName);%></td>
					  <td align="center"><font color="#800000"><%out.write(r1.campaignName);%></font></td>
					  <td align="center" ><%out.write(callsPerHour);%> </td>
					  <td align="center" ><%out.write(totalContactsPerHour);%> </td>
					  <td align="center" ><%out.write(sallesPerHour);%> </td>
					  <td align="center"><%out.write(refusalsPerHour);%></td>
					  <td align="center"><%out.write(netContRate + "%");%></td>
				  </tr>
		<!-- end of array traversal-->
		<%
				tLoginTime += r1.totalLoginTime;
				totLoginTime += r1.totalLoginTime;
				totnbContacts += r1.NbContacts;
				nbContacts += r1.NbContacts;
				totnbSucess += r1.NbSales;
				nbSucess += r1.NbSales;
				totnbRefusals += r1.NbNoSales;
				nbRefusals += r1.NbNoSales;
				RContacts += r1.RContacts;
				totRContacts += r1.RContacts;
				tempLastName=LastName;  tempFirstName =FirstName;
				first =0;	
				tContacts += r1.totalContacts;
				TContacts += r1.totalContacts;
				
				
			  }
			r1 = new beanAgentPerformanceDetails();
			 if(totLoginTime !=0)
			 {
				 callsPerHour =r1.formatDecimalDouble( ( (double)totnbContacts*3600/totLoginTime), 2);
				 sallesPerHour = r1.formatDecimalDouble( ( (double)totnbSucess*3600/totLoginTime), 2);
				 refusalsPerHour = r1.formatDecimalDouble( ( (double)totnbRefusals*3600/totLoginTime), 2);
				 totalContactsPerHour = r1.formatDecimalDouble( ( (double)TContacts*3600/totLoginTime), 2);
			 }
			else
			{
				callsPerHour ="0.00";sallesPerHour="0.00";refusalsPerHour="0.00"; totalContactsPerHour ="0.00";
			}
			 if(totRContacts >0)
			 {
			 netContRate = r1.formatDecimalDouble( ( (double)totnbSucess*100/totRContacts), 2);
			 }
			 else
			 	netContRate ="0.00";
%><!--
				<tr>
					 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%= pageOutRdData.getWord("Total")%> </b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(" ");%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(callsPerHour);%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(totalContactsPerHour);%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(sallesPerHour);%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(refusalsPerHour);%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(netContRate + "%");%></font></td>
				</tr>-->
			</table>
		</td>
	</tr>
</table>
<% pageOutRdData.closeConnection(); %>
