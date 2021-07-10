
<%
	//String percent ="";
	long NbEntered_det     = 0 , ssTotNbEntered_det = 0, totNbEntered_det = 0 ;
    long NbAnswered_det  = 0 , ssTotNbAnswered_det = 0, totNbAnswered_det = 0 ;
    long NbAbandonned_det  = 0, ssTotNbAbandonned_det = 0, totNbAbandonned_det = 0 ;

   //double ServiceFactor = 0.0;
    queueInfo=null;
    boolean needOneMoreTotalRow_det = false;
	
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<table width="80%" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="center">
					  <b><% out.write(""+queue+""); %></b>
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
							<script>document.write(MultiArray["Queue Reports"][lang])</script> <br><br>
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
						</b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								//out.write("Count");
								NbEntered_det     = 0 ; ssTotNbEntered_det = 0; totNbEntered_det = 0 ;
								NbAnswered_det  = 0 ; ssTotNbAnswered_det = 0; totNbAnswered_det = 0 ;
								NbAbandonned_det  = 0; ssTotNbAbandonned_det = 0; totNbAbandonned_det = 0 ;
								
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
			<table width="90%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" height="15">
				<td width="25%" align="center"> <script>document.write(MultiArray["Time period"][lang])</script></td>
				<td width="25%"  align="center"><script>document.write(MultiArray["Entered"][lang])</script></td>
				<td width="25%"  align="center"><script>document.write(MultiArray["Answered"][lang])</script></td>
				<td width="25%"  align="center"><script>document.write(MultiArray["Abandoned"][lang])</script></td>
			  </tr>
			<%
			for (int i = 0; i < beanQueue.m_vAllDetails.size(); i++) 
			{
				 queueInfo = (beanQueueDetails)beanQueue.m_vAllDetails.elementAt(i);
				 System.out.println("queueInfo.time.: " + queueInfo.time);
				if(( queueInfo.time.length() >10 || queueInfo.otherMonthYear) && i > 0) 
				{
					%>
					 <tr  height="15">
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbEntered_det));%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbAnswered_det));%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbAbandonned_det));%></b></font></td>
						 
					</tr>
					<%
					ssTotNbEntered_det =0;
					ssTotNbAnswered_det =0;
					ssTotNbAbandonned_det=0;
					needOneMoreTotalRow_det = true;
				} // fin if agentInfo.time.length() >10
				%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%>  height="15">
					<td   align="center"><%out.write(queueInfo.time);%></td>
					<td align="center"> <%out.write(Long.toString(queueInfo.NbEntered));%>  </td>
					<td align="center"> <%out.write(Long.toString(queueInfo.NbDistributed));%>  </td>
					<td align="center"> <%out.write(Long.toString(queueInfo.NbAbandonned));%>  </td>
				  </tr>
			  
				<%

				ssTotNbEntered_det +=queueInfo.NbEntered;
				totNbEntered_det +=queueInfo.NbEntered;
				ssTotNbAnswered_det +=queueInfo.NbDistributed;
				totNbAnswered_det +=queueInfo.NbDistributed;
				ssTotNbAbandonned_det +=queueInfo.NbAbandonned;
				totNbAbandonned_det +=queueInfo.NbAbandonned;
				
			} //fin for
			if(needOneMoreTotalRow_det)
			{
			%>
					 <tr  height="15">
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbEntered_det));%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbAnswered_det));%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbAbandonned_det));%></b></font></td>
						 
					</tr>
			<%
			}
			%>
	 			<tr  height="15">
				 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script> ");%></b></font></td>
				 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(totNbEntered_det));%></b></font></td>
				 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(totNbAnswered_det));%></b></font></td>
				 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(totNbAbandonned_det));%></b></font></td>
				</tr>
			
			</table>
		</td>
	</tr>	
</table>


