
<%
	String percent ="";
	long NbEntered     = 0 , ssTotNbEntered = 0, totNbEntered = 0 ;
    long NbAnswered  = 0 , ssTotNbAnswered = 0, totNbAnswered = 0 ;
    long NbAbandonned  = 0, ssTotNbAbandonned = 0, totNbAbandonned = 0 ;

	String percentNbAnswered = "" , tot_percentNbAnswered = "";
	String percentNbAbandonned = "" , tot_percentNbAbandonned = "";
    String ServiceFactor = "", tot_ServiceFactor = "";

    long NAnswTh1 = 0,  ssTotNAnswTh1 =0, totNAnswTh1 =0;
	long NAbandTh2=0 ,  ssTotNAbandTh2 =0, totNAbandTh2 =0;

   //double ServiceFactor = 0.0;
    queueInfo=null;
    boolean needOneMoreTotalRow = false;
	
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
				<tr><td height="30"></td></tr>
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
							out.write(reportType);
							%>
							<script>document.write(MultiArray["Queue Reports"][lang])</script>  <br><br>
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
					<td width="100%" align="left"><font style="background-color:#FFC5A8">
						<b><script>document.write(MultiArray["Data count"][lang])</script> 			
						</b>
						</font>
						  <%
							NbEntered     = 0 ; ssTotNbEntered = 0; totNbEntered = 0 ;
							NbAnswered  = 0 ; ssTotNbAnswered = 0; totNbAnswered = 0 ;
							NbAbandonned  = 0; ssTotNbAbandonned = 0; totNbAbandonned = 0 ;
						%>
					</td>
				</tr>	
				<tr><td height="10"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="90%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" height="15">
				<td width="25%" align="center"> <script>document.write(MultiArray["Time period"][lang])</script> </td>
				<td width="25%"  align="center"><script>document.write(MultiArray["Entered"][lang])</script></td>
				<td width="25%"  align="center"><script>document.write(MultiArray["Answered"][lang])</script></td>
				<td width="25%"  align="center"><script>document.write(MultiArray["Abandoned"][lang])</script></td>
			  </tr>
			<%
			for (int i = 0; i < beanQueue.m_vAllDetails.size(); i++) 
			{
				 queueInfo = (beanQueueDetails)beanQueue.m_vAllDetails.elementAt(i);
				if(( queueInfo.time.length() >10 || queueInfo.otherMonthYear) && i > 0) 
				{
					%>
					 <tr  height="15">
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbEntered));%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbAnswered));%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbAbandonned));%></b></font></td>
						 
					</tr>
					<%
					ssTotNbEntered =0;
					ssTotNbAnswered =0;
					ssTotNbAbandonned=0;
					needOneMoreTotalRow = true;
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

				ssTotNbEntered +=queueInfo.NbEntered;
				totNbEntered +=queueInfo.NbEntered;
				ssTotNbAnswered +=queueInfo.NbDistributed;
				totNbAnswered +=queueInfo.NbDistributed;
				ssTotNbAbandonned +=queueInfo.NbAbandonned;
				totNbAbandonned +=queueInfo.NbAbandonned;
				
			} //fin for
			if(needOneMoreTotalRow)
			{
			%>
					 <tr  height="15">
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbEntered));%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbAnswered));%></b></font></td>
						 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssTotNbAbandonned));%></b></font></td>
						 
					</tr>
			<%
			}
			%>
	 			<tr  height="15">
				 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" <script>document.write(MultiArray[\"Total\"][lang])</script> ");%></b></font></td>
				 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(totNbEntered));%></b></font></td>
				 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(totNbAnswered));%></b></font></td>
				 <td width="25%" bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(totNbAbandonned));%></b></font></td>
				</tr>
			
			</table>
		</td>
	</tr>	
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left"><font style="background-color:#FFC5A8">
						<b><script>document.write(MultiArray["Percentages"][lang])</script>			
						</b>
						</font>
						  <%
								NbEntered     = 0 ; ssTotNbEntered = 0; totNbEntered = 0 ;
								NbAnswered  = 0 ; ssTotNbAnswered = 0; totNbAnswered = 0 ;
								NbAbandonned  = 0; ssTotNbAbandonned = 0; totNbAbandonned = 0 ;
								needOneMoreTotalRow =false;
						%>
					</td>
				</tr>	
				<tr><td height="10"></td></tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td width="100%" align="center">
			<table width="90%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" height="20">
				<td width="20%" align="center" >  <script>document.write(MultiArray["Time period"][lang])</script> </td>
				<td width="20%"  align="center" colspan="2" ><script>document.write(MultiArray["Answered"][lang])</script></td>
				<td width="20%"  align="center" colspan="2" ><script>document.write(MultiArray["Abandoned"][lang])</script></td>
				<td width="20%"  align="center" colspan="2" ><script>document.write(MultiArray["Answered service factor"][lang])</script></td>
				
			  </tr>
			<%
			for (int i = 0; i < beanQueue.m_vAllDetails.size(); i++) 
			{
				 queueInfo = (beanQueueDetails)beanQueue.m_vAllDetails.elementAt(i);
				if(( queueInfo.time.length() >10 || queueInfo.otherMonthYear) && i > 0) 
				{
					if((ssTotNbEntered) !=0) 
					{
						percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)(ssTotNbAnswered*100)/ssTotNbEntered), 2);
						percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)(ssTotNbAbandonned*100)/ssTotNbEntered), 2);
					}
					else
					{
						percentNbAnswered = "0.00";
						percentNbAbandonned = "0.00";
					}
          			if (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 > 0) 
					{
						ServiceFactor = queueInfo.formatDecimalDouble(( (double) ssTotNAnswTh1 /(double) (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 )) *100 ,2);						
					}
					else
						ServiceFactor = "0.00";
					
					%>
					 <tr>
						 <td width="20%"  bgcolor="#FFECF5" align="center" ><font  color="#000000"><b><%out.write(" ");%></b></font></td>
						 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(percentNbAnswered+"%");%></b></font></td>
						 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(percentNbAnswered.compareTo("0.00")!=0)
							{
						 %>
							<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percentNbAnswered+"%"); %>" height="7" align="left">
								<tr>
									<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
									<td width="10%" style="background-color:#FFECF5"></td>
								</tr>
					  		</table>
							<%
							}
							%>
						 </td>
						 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(percentNbAbandonned+"%");%></b></font></td>
						 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(percentNbAbandonned.compareTo("0.00")!=0)
							{
						 %>
							<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percentNbAbandonned+"%"); %>" height="7" align="left">
								<tr>
									<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
									<td width="10%" style="background-color:#FFECF5"></td>
								</tr>
					  		</table>
							<%
							}
							%>
						 </td>
						 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(ServiceFactor+"%");%></b></font></td>
						 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(ServiceFactor.compareTo("0.00")!=0)
							{
						 %>
							<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(ServiceFactor+"%"); %>" height="7" align="left">
								<tr>
									<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
									<td width="10%" style="background-color:#FFECF5"></td>
								</tr>
					  		</table>
							<%
							}
							%>
						 </td>
						 
					</tr>
					<%
					ssTotNbEntered =0;
					ssTotNbAnswered =0;
					ssTotNbAbandonned=0;
					ssTotNAnswTh1 =0;
					ssTotNAbandTh2 =0;
					percentNbAnswered ="";
					percentNbAbandonned ="";
					ServiceFactor = "";
					needOneMoreTotalRow = true;
				} // fin if agentInfo.time.length() >10
				%>
				<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%>>
					 <td width="20%"  align="center" ><%out.write(queueInfo.time);%></td>
					 <td width="5%"  align="center"  style=" border-right:none"><%out.write(queueInfo.getPercentNbDistributed());%></td>
					 <td width="15%"  align="center" style=" border-left:none" >
						<%
						if(queueInfo.getPercentNbDistributed().compareTo("0.00%") !=0)
						{
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(queueInfo.getPercentNbDistributed()); %>" height="7" align="left">
							<tr>
								<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
								<td width="10%" <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%>></td>
							</tr>
						</table>
						<%
						}
						%>
					 <td width="5%"  align="center"  style=" border-right:none"><%out.write(queueInfo.getPercentNbAbandonned());%></td>
					 <td width="15%"  align="center" style=" border-left:none" >
						<%
						if(queueInfo.getPercentNbAbandonned().compareTo("0.00%") !=0)
						{
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(queueInfo.getPercentNbAbandonned()); %>" height="7" align="left">
							<tr>
								<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
								<td width="10%" <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%>></td>
							</tr>
						</table>
						<%
						}
						%>
					 </td>
					 <td width="5%"  align="center"  style=" border-right:none"><%out.write(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2)+"%");%></td>
					 <td width="15%"  align="center" style=" border-left:none" >
						<%
						if(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2).compareTo("0.00") !=0)
						{
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2)+"%"); %>" height="7" align="left">
							<tr>
								<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
								<td width="10%" <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%>></td>
							</tr>
						</table>
						<%
						}
						%>
					 </td>
				  </tr>
			  
				<%

				ssTotNbEntered +=queueInfo.NbEntered;
				totNbEntered +=queueInfo.NbEntered;
				ssTotNbAnswered +=queueInfo.NbDistributed;
				totNbAnswered +=queueInfo.NbDistributed;
				ssTotNbAbandonned +=queueInfo.NbAbandonned;
				totNbAbandonned +=queueInfo.NbAbandonned;
				ssTotNAnswTh1 +=queueInfo.nAnswTh1;
				totNAnswTh1 +=queueInfo.nAnswTh1;
				ssTotNAbandTh2 +=queueInfo.nAbandTh2;
				totNAbandTh2 +=queueInfo.nAbandTh2;
				
			} //fin for
			if(needOneMoreTotalRow)
			{
				if((ssTotNbEntered) !=0) 
				{
					percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)(ssTotNbAnswered*100)/ssTotNbEntered), 2);
					percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)(ssTotNbAbandonned*100)/ssTotNbEntered), 2);
				}
				else
				{
					percentNbAnswered = "0.00";
					percentNbAbandonned = "0.00";
				}
				if (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 > 0) 
				{
					ServiceFactor = queueInfo.formatDecimalDouble(( (double) ssTotNAnswTh1 /(double) (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 )) *100 ,2);						
				}
				else
					ServiceFactor = "0.00";
				
				%>
					 <tr>
						 <td width="20%"  bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
						 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(percentNbAnswered+"%");%></b></font></td>
						 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(percentNbAnswered.compareTo("0.00")!=0)
							{
						 %>
							<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percentNbAnswered+"%"); %>" height="7" align="left">
								<tr>
									<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
									<td width="10%" style="background-color:#FFECF5"></td>
								</tr>
					  		</table>
							<%
							}
							%>
						 </td>
						 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(percentNbAbandonned+"%");%></b></font></td>
						 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(percentNbAbandonned.compareTo("0.00")!=0)
							{
						 %>
							<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percentNbAbandonned+"%"); %>" height="7" align="left">
								<tr>
									<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
									<td width="10%" style="background-color:#FFECF5"></td>
								</tr>
					  		</table>
							<%
							}
							%>
						 </td>
						 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(ServiceFactor+"%");%></b></font></td>
						 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(ServiceFactor.compareTo("0.00")!=0)
							{
						 %>
							<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(ServiceFactor+"%"); %>" height="7" align="left">
								<tr>
									<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
									<td width="10%" style="background-color:#FFECF5"></td>
								</tr>
					  		</table>
							<%
							}
							%>
						 </td>
						 
					</tr>
			<%
			}
			
			if((totNbEntered) !=0) 
			{
				tot_percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)(totNbAnswered*100)/totNbEntered), 2);
				tot_percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)(totNbAbandonned*100)/totNbEntered), 2);
			}
			else
			{
				tot_percentNbAnswered = "0.00";
				tot_percentNbAbandonned = "0.00";
			}
			if (totNbAnswered + totNbAbandonned - totNAbandTh2 > 0) 
			{
				tot_ServiceFactor = queueInfo.formatDecimalDouble(( (double) totNAnswTh1 /(double) (totNbAnswered + totNbAbandonned - totNAbandTh2 )) *100 ,2);						
			}
			else
				tot_ServiceFactor = "0.00";
			%>
			<tr>
				 <td width="20%"  bgcolor="#FFECF5" align="center" ><font  color="#000000"><b><%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script> ");%></b></font></td>
				 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(tot_percentNbAnswered+"%");%></b></font></td>
				 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(tot_percentNbAnswered.compareTo("0.00") !=0 )
							{
						 %>
					<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(tot_percentNbAnswered+"%"); %>" height="7" align="left">
						<tr>
							<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
							<td width="10%" style="background-color:#FFECF5"></td>							
						</tr>
					</table>
					<%
					}
					%>
				 </td>
				 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(tot_percentNbAbandonned+"%");%></b></font></td>
				 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(tot_percentNbAbandonned.compareTo("0.00") !=0 )
							{
						 %>
					
					<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(tot_percentNbAbandonned+"%"); %>" height="7" align="left">
						<tr>
							<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
							<td width="10%" style="background-color:#FFECF5"></td>							
						</tr>
					</table>
					<%
					}
					%>
				 </td>
				 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(tot_ServiceFactor+"%");%></b></font></td>
				 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(tot_ServiceFactor.compareTo("0.00") !=0 )
							{
						 %>
					
					<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(tot_ServiceFactor+"%"); %>" height="7" align="left">
						<tr>
							<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
							<td width="10%" style="background-color:#FFECF5"></td>							
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
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Service level\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>
				<tr><td height="7"></td></tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center">
				<tr>
					<td width="100%" align="left" class="reportsID">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Answered calls\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>
				<tr><td height="7"></td></tr>
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" height="20">
				<td width="20%"  align="center" ><script>document.write(MultiArray["Answered"][lang])</script> </td>
				<td width="20%" align="center" > <script>document.write(MultiArray["Answered count"][lang])</script></td>
				<td width="20%"  align="center" colspan="2" ><script>document.write(MultiArray["Percentages"][lang])</script></td>
				
			  </tr>
			<%
			long nbqueue =(long)beanQueue.nbQueue;
			long nbEvent =0;
			System.out.println("tmpSLdata nb queue: "+Long.toString(nbqueue));
			String carac="";
			for (int i =0; i < beanQueue.m_AnsweredSL.size(); i++)
			{
				//percent = (String)beanQueue.m_AnsweredSL.elementAt(i);
				carac =Integer.toString(tabAnswered[i]);
				beanQueueReport.SLdata tmpSLdata = (beanQueueReport.SLdata)beanQueue.m_AnsweredSL.elementAt(i);
				nbEvent = tmpSLdata.eventCount;
				percent =  tmpSLdata.percent;
				System.out.println("tmpSLdata nb Answ: "+percent);
		
				
			%>
				<tr class="reportsQueueRow">
					 <td width="20%"  align="center" ><%out.write("<script>document.write(MultiArray[\"Within\"][lang])</script> " +carac+" <script>document.write(MultiArray[\"seconds\"][lang])</script>");%></td>
					 <td width="20%"  align="center" ><%out.write(Long.toString(nbEvent));%></td>
					 <td width="20%"  align="center" style=" border-right:none">
					 <%	out.write(percent); %></td>
					 <td width="40%"  align="center" style="border-left:none">
						<%
						if(nbqueue > 0)
						{
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent); %>" height="7" align="left">
							<tr>									
							<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
							<td width="10%" class="reportsQueueRow"></td>							
							</tr>
						</table>
						<%
						}
						%>
					 
					 </td>
			  </tr>
				<%
			} //fin for
%>			
			</table>
		</td>
	</tr>	

	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center">
			<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left" class="reportsID">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Abandonned calls\"][lang])</script>");
								%>
						</b>
					</td>
				</tr>
				<tr><td height="7"></td></tr>
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" height="20">
				<td width="20%"  align="center" ><script>document.write(MultiArray["Abandoned"][lang])</script> </td>
				<td width="20%" align="center" ><script>document.write(MultiArray["Abandon count"][lang])</script></td>
				<td width="20%"  align="center" colspan="2" ><script>document.write(MultiArray["Percentages"][lang])</script></td>
				
			  </tr>
			<%
			nbEvent =0;
			System.out.println("tmpSLdata nb queue: "+Long.toString(nbqueue));
			carac="";
			for (int i =0; i < beanQueue.m_AbandSL.size(); i++)
			{
				//percent = (String)beanQueue.m_AnsweredSL.elementAt(i);
				carac =Integer.toString(tabAband[i]);
				beanQueueReport.SLdata tmpSLdata = (beanQueueReport.SLdata)beanQueue.m_AbandSL.elementAt(i);
				nbEvent = tmpSLdata.eventCount;
				percent =  tmpSLdata.percent;
				System.out.println("tmpSLdata nb aband: "+percent);
			%>
				<tr class="reportsQueueRow">
					 <td width="20%"  align="center" ><%out.write("<script>document.write(MultiArray[\"Within\"][lang])</script> " +carac+" <script>document.write(MultiArray[\"seconds\"][lang])</script>");%></td>
					 <td width="20%"  align="center" ><%out.write(Long.toString(nbEvent));%></td>
					 <td width="20%"  align="center" style="border-right:none">
					 <%	out.write(percent); %></td>
					 <td width="40%"  align="center" style="border-left:none">
						<%
						if(nbqueue > 0)
						{
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent); %>" height="7" align="left">
							<tr>									
							<td width="90%" style="background-color:#BCBCDE" valign="middle"><img src="../img/percent.gif" width="100%" border="no" height="7" ></td>
							<td width="10%" class="reportsQueueRow"></td>							
							</tr>
						</table>
						<%
						}
						%>
					 
					 </td>
			  </tr>
				<%
			} //fin for
%>			
			</table>
		</td>
	</tr>	
</table>

