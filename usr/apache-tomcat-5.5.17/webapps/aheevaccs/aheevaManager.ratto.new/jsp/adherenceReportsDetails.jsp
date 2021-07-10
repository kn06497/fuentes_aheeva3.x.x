<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%
long num_no_adherence = 0;
long num_adherence = 0;
long tot_num_no_adherence = 0;
long tot_num_adherence = 0;
boolean needOneMoreTotalRow= false;

%>
<table width="100%" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="center">
					  <b><%
					  	if(agents.compareTo("AllAgents")!= 0) //one agent
							out.write(agt_full_name);
						else //alle agent
							out.write(agentGroupTemp);
						%>
						</b>				
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
							<b><script>document.write(MultiArray["Agent Adherence Reports"][lang])</script></b><br><br>
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
			  <%  if(agents.compareTo("AllAgents")!= 0){ //one agent %>
				<td width="20%" align="center"> <b><script>document.write(MultiArray["Date"][lang])</script></b> </td>
				<td width="20%" align="center"> <b><script>document.write(MultiArray["Agent adherence"][lang])</script></b> </td>
			  <%}
			  	else{ %>
				<td width="20%" align="center"> <b><script>document.write(MultiArray["Date"][lang])</script></b> </td>
				<td width="20%" align="center"> <b><script>document.write(MultiArray["Agent"][lang])</script></b> </td>
				<td width="20%" align="center"> <b><script>document.write(MultiArray["Agent adherence"][lang])</script></b> </td>
			  	<%}%>
			  </tr>
<!-- traverse the array -->
			<%
				int i=0 ;
				int j =0;
				for (i = 0; i < beanAgent.m_schedDailyAdherence.size(); i++)
				{
				
				r1 = (beanAdherenceDetails)beanAgent.m_schedDailyAdherence.elementAt(i);
				//System.out.println("i == "+i +" Time == " + r1.time + " otherMonthYear ==  " + Boolean.toString(r1.otherMonthYear) +" j == "+j ) ;				
				if(agents.compareTo("AllAgents")!= 0)
				{
					%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");%> >
					<td align="center"><%out.write(r1.time);%></td>
					<td align="center"><%out.write(r1.getAdherence());%></td>
				</tr>
				<%
					num_no_adherence += r1.num_no_adherence;
					num_adherence += r1.num_adherence;			
					tot_num_no_adherence +=r1.num_no_adherence;
					tot_num_adherence +=r1.num_adherence;	
					j ++;
					
				}	
				else
				{
					%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");%> >
					<td align="center"><%out.write(r1.time);%></td>
					<td align="center"><%out.write(r1.name);%></td>
					<td align="center"><%out.write(r1.getAdherence());%></td>
				</tr>
				<%
					num_no_adherence += r1.num_no_adherence;
					num_adherence += r1.num_adherence;			
					tot_num_no_adherence +=r1.num_no_adherence;
					tot_num_adherence +=r1.num_adherence;	
					j ++;
					} //fin else
				}	//fin for
				r1 = new beanAdherenceDetails();
				if(agents.compareTo("AllAgents")!= 0){
				%>
				<tr>
					<td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script> ");%></b></font></td>
					<td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.getAdherenceFromNyesNno(tot_num_adherence,tot_num_no_adherence));%></b></font></td>
				</tr>
				<%
				}
				else
				{
				%>
				<tr>
					<td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script> ");%></b></font></td>
					<td   bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write("  ");%></b></font></td>
					<td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.getAdherenceFromNyesNno(tot_num_adherence,tot_num_no_adherence));%></b></font></td>
				</tr>
				<%
				}
				%>
			</table>
		</td>
	</tr>
</table>

