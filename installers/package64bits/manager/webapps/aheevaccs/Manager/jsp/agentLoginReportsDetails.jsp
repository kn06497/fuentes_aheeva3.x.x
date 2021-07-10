
<%
long tLoginTime = 0;
String LastName="", FirstName ="", writeName="";

%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
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
							<b><script>document.write(MultiArray["Agent Login Reports"][lang])</script></b><br><br>
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
						</b></font>
					</td>
				</tr>
				<tr><td height="20"></td></tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" >
				<td width="20%" align="center"> <b><script>document.write(MultiArray["Agent ID"][lang])</script></b> </td>
				<td width="20%" align="center"> <b><script>document.write(MultiArray["Agent name"][lang])</script></b> </td>
				<td width="20%" align="center"> <b><script>document.write(MultiArray["First login"][lang])</script></b> </td>
				<td width="20%" align="center"> <b><script>document.write(MultiArray["Last Logout"][lang])</script></b> </td>
				<td width="20%" align="center"> <b><script>document.write(MultiArray["Total login time"][lang])</script></b> </td>
			  </tr>
<!-- traverse the array -->
			<%
					  for (j = 0; j < beanAgentLoginReport.m_gAllDetails.size(); j++)
					   {
					   //System.out.println("j =="+j);
						 r1 = (beanAgentLoginInfo)beanAgentLoginReport.m_gAllDetails.elementAt(j);
						 if(r1.last_name != null) LastName=r1.last_name;
						 else LastName= " ";
						 if(r1.first_name != null) FirstName =r1.first_name;
						 else FirstName = " ";
						 writeName =LastName+" "+FirstName;
						 System.out.println("j =="+j+" writeName");
						 
			%>
				  <tr <% if(j%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");%> >
					  <td  align="center"><%out.write(r1.agt_id);%></td>
					  <td   align="left" nowrap>&nbsp;&nbsp;<%out.write(writeName);%></td>
					  <td    align="center" nowrap><% out.write(r1.getFirstLoginTime());%> </td>
					  <td    align="center" nowrap><%out.write(r1.getLastLogoutTime());%> </td>
					  <td  align="center"><%out.write(r1.getTotalLoginTime());%></td>
				  </tr>
		<!-- end of array traversal-->
		<%
			   tLoginTime += r1.totalLoginTime;
			   if(r1.getLastLogoutTime().compareTo("Unknow")==0)
			   {
			   System.out.println("\n begin lastLogoutTime==Unknow");
			   %>
				<tr>
					 <td bgcolor="#DCEDED" align="right" colspan="3"><font color="#000000"><b>
					 <%out.write(" Next logout ");%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
					 <td bgcolor="#DCEDED" align="center"><%out.write(r1.getNextLogoutTime());%></td>
					 <td bgcolor="#DCEDED" align="center"><font  color="#000000"><b> <%out.write(" ");%></b></font></td>
				</tr>
			   <%
			   System.out.println("\n end lastLogoutTime==Unknow");
			   }
			 }
			r1 = new beanAgentLoginInfo();
		  System.out.println("fin for");
		  if(r1 !=null)
		  {
		  System.out.println("r1 !=null");
%>
				<tr>
					 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%> </b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(r1.buildReadableTime(tLoginTime));%></b></font></td>
				</tr>
				<% }%>
			</table>
		</td>
	</tr>
</table>

