<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageQuRsData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageQuRsData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageQuRsData.openConnection();
%>
<%
	String percent ="";
	long NbEntered     = 0 , ssTotNbEntered = 0, totNbEntered = 0 ;
    long NbAnswered  = 0 , ssTotNbAnswered = 0, totNbAnswered = 0 ;
    long NbAbandonned  = 0, ssTotNbAbandonned = 0, totNbAbandonned = 0 ;
	long NbAbandonTimeOut = 0, ssTotNbAbandonTimeOut = 0, totNbAbandonTimeOut = 0 ;
	long NbAbandonNoAgt = 0, ssTotNbAbandonNoAgt = 0, totNbAbandonNoAgt = 0;

	String percentNbAnswered = "" , tot_percentNbAnswered = "";
	String percentNbAbandonned = "" , tot_percentNbAbandonned = "";
    String ServiceFactor = "", tot_ServiceFactor = "";

    long NAnswTh1 = 0,  ssTotNAnswTh1 =0, totNAnswTh1 =0;
	long NAbandTh2=0 ,  ssTotNAbandTh2 =0, totNAbandTh2 =0;
   //double ServiceFactor = 0.0;
   queueInfo = null;
   boolean needOneMoreTotalRow = false;
   
   //variable changeables compte tenu des tranches importantes pour le client
   /*
   int nbTranchesAnsw =10;
   String typeTranchesAnsw[] =new String[nbTranchesAnsw];
	for (int w =0; w < nbTranchesAnsw; w++)
	{
		typeTranchesAnsw[w] =;
	}
   int nbTranchesAband =10;
   String typeTranchesAband[] =new String[nbTranchesAband];
   */
   
	
%>
<table width="80%" cellpadding="0" cellspacing="0" align="center">
<%
	if(from.compareTo("queueReport") != 0)
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
								  out.write(pageQuRsData.getWord("Daily"));
							else if (reportType.compareTo("Monthly")==0) 
								out.write(pageQuRsData.getWord("Monthly"));						
							else if (reportType.compareTo("Yearly")==0) 
								out.write(pageQuRsData.getWord("Yearly"));
							%>
							<%= pageQuRsData.getWord("Percentages for queue")%> <br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageQuRsData.getWord("To")%> 
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
	}
	 %>
	 <!--
		<tr>
			<td width="100%" align="center">
				<table width="90%" align="center">
					<tr>
						<td width="100%" align="left">
							<b>
							<%
								out.write(pageQuRsData.getWord("Percentages"));
								NbEntered     = 0 ; ssTotNbEntered = 0; totNbEntered = 0 ;
								NbAnswered  = 0 ; ssTotNbAnswered = 0; totNbAnswered = 0 ;
								NbAbandonned  = 0; ssTotNbAbandonned = 0; totNbAbandonned = 0 ;
								NbAbandonTimeOut = 0; ssTotNbAbandonTimeOut = 0; totNbAbandonTimeOut = 0 ;
								NbAbandonNoAgt = 0; ssTotNbAbandonNoAgt = 0; totNbAbandonNoAgt = 0;
								needOneMoreTotalRow =false;
								
							%>					
							</b>
						</td>
					</tr>			
				</table>
			</td>
		</tr>
	-->
	<tr>
		<td width="100%" align="center">
			<table width="90%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write(pageQuRsData.getWord("Percentages"));
								NbEntered     = 0 ; ssTotNbEntered = 0; totNbEntered = 0 ;
								NbAnswered  = 0 ; ssTotNbAnswered = 0; totNbAnswered = 0 ;
								NbAbandonned  = 0; ssTotNbAbandonned = 0; totNbAbandonned = 0 ;
								NbAbandonTimeOut = 0; ssTotNbAbandonTimeOut = 0; totNbAbandonTimeOut = 0 ;
								NbAbandonNoAgt = 0; ssTotNbAbandonNoAgt = 0; totNbAbandonNoAgt = 0;
								needOneMoreTotalRow =false;
								
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
			<table width="90%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" height="20">
				<td width="20%" align="center" ><%= pageQuRsData.getWord("Time period")%></td>
				<td width="20%"  align="center" colspan="2" ><%= pageQuRsData.getWord("Answered")%></td>
				<td width="20%"  align="center" colspan="2" ><%= pageQuRsData.getWord("Abandoned")%></td>
				<td width="20%"  align="center" colspan="2" ><%= pageQuRsData.getWord("Answered service factor")%></td>
			  </tr>
			<%
			for (int i = 0; i < beanQueue.m_vAllDetails.size(); i++) {
				 queueInfo = (beanQueueDetails)beanQueue.m_vAllDetails.elementAt(i);
				if(( queueInfo.time.length() >10 || queueInfo.otherMonthYear) && i > 0) {
					if((ssTotNbEntered) !=0) {
						percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)((ssTotNbAnswered)*100)/ssTotNbEntered), 2);
						percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)((ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt)*100)/ssTotNbEntered), 2);
					}else{
						percentNbAnswered = "0.00";
						percentNbAbandonned = "0.00";
					}
          			if (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 > 0) {
						ServiceFactor = queueInfo.formatDecimalDouble(( (double) ssTotNAnswTh1 /(double) (ssTotNbAnswered + (ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt) - ssTotNAbandTh2 )) *100 ,2);						
					}else
						ServiceFactor = "0.00";
					
					%>
					 
					<%
					ssTotNbEntered =0;
					ssTotNbAnswered =0;
					ssTotNbAbandonned=0;
					ssTotNbAbandonTimeOut=0;
					ssTotNbAbandonNoAgt=0;
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
						if(queueInfo.getPercentNbDistributed().compareTo("0.00%") !=0){
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(queueInfo.getPercentNbDistributed()); %>" height="7" align="left">
							<tr>									
								<td width="90%" style="background-color:#BCBCDE"></td>
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
						if(queueInfo.getPercentNbAbandonned().compareTo("0.00%") !=0){
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(queueInfo.getPercentNbAbandonned()); %>" height="7" align="left">
							<tr>									<td width="90%" style="background-color:#BCBCDE"></td>
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
						if(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2).compareTo("0.00") !=0){
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(queueInfo.formatDecimalDouble(queueInfo.ServiceFactor,2)+"%"); %>" height="7" align="left">
							<tr>									<td width="90%" style="background-color:#BCBCDE"></td>
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
				ssTotNbAbandonTimeOut +=queueInfo.NbAbandonTimeOut;
				totNbAbandonTimeOut +=queueInfo.NbAbandonTimeOut;
				ssTotNbAbandonNoAgt +=queueInfo.NbAbandonNoAgt;
				totNbAbandonNoAgt +=queueInfo.NbAbandonNoAgt;
				ssTotNAnswTh1 +=queueInfo.nAnswTh1;
				totNAnswTh1 +=queueInfo.nAnswTh1;
				ssTotNAbandTh2 +=queueInfo.nAbandTh2;
				totNAbandTh2 +=queueInfo.nAbandTh2;
				
			} //fin for
			if(needOneMoreTotalRow){
				if((ssTotNbEntered) !=0) {
					percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)(ssTotNbAnswered*100)/ssTotNbEntered), 2);
					percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)((ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt)*100)/ssTotNbEntered), 2);
				}else{
					percentNbAnswered = "0.00";
					percentNbAbandonned = "0.00";
				}
				if (ssTotNbAnswered + ssTotNbAbandonned - ssTotNAbandTh2 > 0) {
					ServiceFactor = queueInfo.formatDecimalDouble(( (double) ssTotNAnswTh1 /(double) (ssTotNbAnswered + (ssTotNbAbandonned+ssTotNbAbandonTimeOut+ssTotNbAbandonNoAgt) - ssTotNAbandTh2 )) *100 ,2);						
					}else
					ServiceFactor = "0.00";
				
				%>
					 
			<%
			}
			
			if((totNbEntered) !=0) {
				tot_percentNbAnswered = queueInfo.formatDecimalDouble( ( (double)(totNbAnswered*100)/totNbEntered), 2);
				tot_percentNbAbandonned = queueInfo.formatDecimalDouble( ( (double)((totNbAbandonned+totNbAbandonTimeOut+totNbAbandonNoAgt)*100)/totNbEntered), 2);
				}else{
				tot_percentNbAnswered = "0.00";
				tot_percentNbAbandonned = "0.00";
			}
			if (totNbAnswered + totNbAbandonned - totNAbandTh2 > 0) {
				tot_ServiceFactor = queueInfo.formatDecimalDouble(( (double) totNAnswTh1 /(double) (totNbAnswered + (totNbAbandonned+totNbAbandonTimeOut+totNbAbandonNoAgt) - totNAbandTh2 )) *100 ,2);						
				}else
				tot_ServiceFactor = "0.00";
			%>
			<tr>
				 <td width="20%"  bgcolor="#FFECF5" align="center" ><font  color="#000000"><b><%= pageQuRsData.getWord("Total")%></b></font></td>
				 <td width="5%"  bgcolor="#FFECF5" align="center"  style=" border-right:none"><font  color="#000000"><b><%out.write(tot_percentNbAnswered+"%");%></b></font></td>
				 <td width="15%"  bgcolor="#FFECF5" align="center" style=" border-left:none" >
						 <%
						 	if(tot_percentNbAnswered.compareTo("0.00") !=0 ){
						 %>
					<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(tot_percentNbAnswered+"%"); %>" height="7" align="left">
						<tr>									
							<td width="90%" style="background-color:#BCBCDE"></td>
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
						 	if(tot_percentNbAbandonned.compareTo("0.00") !=0 ){
						 %>
					
					<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write((totNbAbandonned+totNbAbandonTimeOut+totNbAbandonNoAgt)+"%"); %>" height="7" align="left">
						<tr>									
							<td width="90%" style="background-color:#BCBCDE"></td>
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
						 	if(tot_ServiceFactor.compareTo("0.00") !=0 ){
						 %>
					
					<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(tot_ServiceFactor+"%"); %>" height="7" align="left">
						<tr>									
							<td width="90%" style="background-color:#BCBCDE"></td>
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
			<table width="90%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
						<%= pageQuRsData.getWord("Service level")
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
			<table width="90%" align="center">
				<tr>
					<td width="100%" align="left" class="reportsID">
						<b>
							<%= pageQuRsData.getWord("Answered calls")
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
			<table width="90%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" height="20">
				<td width="20%"  align="center" ><%= pageQuRsData.getWord("Answered")%> </td>
				<td width="20%" align="center" > <%= pageQuRsData.getWord("Answered count")%></td>
				<td width="20%"  align="center" colspan="2" ><%= pageQuRsData.getWord("Percentages")%></td>
				
			  </tr>
			<%
			long nbqueue =(long)beanQueue.nbQueue;
			long nbEvent =0;
			String carac="";
			percent="";
			for (int i = 0; i < beanQueue.m_AnsweredSL.size(); i++){
				if(i < beanQueue.m_AnsweredSL.size() - 1){
					carac =Integer.toString(tabAnswered[i]);
				}
				beanQueueReport.SLdata tmpSLdata = (beanQueueReport.SLdata)beanQueue.m_AnsweredSL.elementAt(i);
				nbEvent = tmpSLdata.eventCount;
				percent =  tmpSLdata.percent;
			%>
				<tr class="reportsQueueRow">
					<% if(i < beanQueue.m_AnsweredSL.size() - 1){  %>
					 	<td width="20%"  align="center" ><%out.write(pageQuRsData.getWord("Within") + carac +pageQuRsData.getWord("seconds"));%></td>
					 <% }else{ %>
					 	<td width="20%"  align="center" ><%out.write("&gt; "+ carac +pageQuRsData.getWord("seconds"));%></td>
					 <% } %>
					 <td width="20%"  align="center" ><%out.write(Long.toString(nbEvent));%></td>
					 <td width="20%"  align="center" style="border-right:none">
					 <%	out.write(percent); %></td>
					 <td width="40%"  align="center" style="border-left:none">
						<%
						if(nbqueue > 0){
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent); %>" height="7" align="left">
							<tr>									
								<td width="90%" style="background-color:#BCBCDE"></td>
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
			<table width="90%" align="center">
			<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left" class="reportsID">
						<b>
							<%= pageQuRsData.getWord("Abandoned calls")
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
			<table width="90%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" height="20">
				<td width="20%"  align="center" ><%= pageQuRsData.getWord("Abandoned")%> </td>
				<td width="20%" align="center" > <%= pageQuRsData.getWord("Abandon count")%></td>
				<td width="20%"  align="center" colspan="2" ><%= pageQuRsData.getWord("Percentages")%></td>
				
			  </tr>
			<%
			nbEvent =0;
			//System.out.println("tmpSLdata nb queue: "+Long.toString(nbqueue));
			carac="";
			percent="";
			for (int i =0; i < beanQueue.m_AbandSL.size(); i++){
				//percent = (String)beanQueue.m_AnsweredSL.elementAt(i);
				if(i < beanQueue.m_AbandSL.size() - 1){
					carac = Integer.toString(tabAband[i]);
				}
				beanQueueReport.SLdata tmpSLdata = (beanQueueReport.SLdata)beanQueue.m_AbandSL.elementAt(i);
				nbEvent = tmpSLdata.eventCount;
				percent =  tmpSLdata.percent;
				//System.out.println("tmpSLdata nb aband: "+percent);
			%>
				<tr class="reportsQueueRow">
				<%if(i < beanQueue.m_AbandSL.size() - 1){ %>
					 <td width="20%"  align="center" ><%out.write(pageQuRsData.getWord("Within") + carac +pageQuRsData.getWord("seconds"));%></td>
				<%}else{ %>
					<td width="20%"  align="center" ><%out.write("&gt; " + carac +pageQuRsData.getWord("seconds"));%></td>
				<%} %>
					 <td width="20%"  align="center" ><%out.write(Long.toString(nbEvent));%></td>
				  <td width="20%"  align="center" style="border-right:none">
					 <%	out.write(percent); %></td>
					 <td width="40%"  align="center" style="border-left:none">
						<%
						if(nbqueue > 0){
						%>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCDE" style="background-color:#CC9999" width="<% out.write(percent); %>" height="7" align="left">
							<tr>									
								<td width="90%" style="background-color:#BCBCDE"></td>
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
<% pageQuRsData.closeConnection(); %>
