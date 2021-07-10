
<%
boolean needOneMoreTotalRow = false;
boolean timeWritten = false;

//---------------------
	long tRecords= 0,tRemainingRecords=0,tCallbacks=0,tWrongNumber=0,tNotSatisfied=0,tCallbacksSched=0;
  	long sTRecords= 0, sTRemainingRecords= 0 ,sTCallbacks = 0,sTCallbacksSched = 0;
//---------------------
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<table width="100%" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="center">
					  <b><% out.write("["+c_list+"]"); %> </b>
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
							<%/*
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
								}*/
							%>
							<script>document.write(MultiArray["Calling List Report Details"][lang])</script>&nbsp; 
							<!--<script>document.write(MultiArray["for"][lang])</script> <br><br>-->
							<%/*
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
							}*/
							%>
						</b>
					</td>
				</tr>
				<tr><td height="20"></td></tr>			
			</table>
		</td>
	</tr>
	
		<!-- Remaining records -->
	<tr>
		<td width="70%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Remaining records\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			<table width="30%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
				<tr class="reportsTabName">
					  <td width="7%" align="center"><script>document.write(MultiArray["Time zones"][lang])</script></td>
					  <td width="7%" align="center"><script>document.write(MultiArray["Remaining records"][lang])</script></td>
				</tr>
	<% 
				
				for( int i = 0;i < beanCall.m_vAllDetails.size(); i++ ) 
				{
					r1 = (beanCallDetails)beanCall.m_vAllDetails.elementAt(i);	
					tRemainingRecords += r1.NbRemainingRecords;						
	%> 			


					<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
					  <td align="center"> <%out.write(r1.TimeZone);%></td>
					  <td align="center"> <%out.write(Long.toString(r1.NbRemainingRecords));%> </td>
					</tr>
<%			   		
   				}// fin du for						
%>			
		<tr>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tRemainingRecords));%> </b></font></td>
		</tr>		
			</table>
		</td>
	</tr>
<!-- Fin  -->
	
		
<!-- Scheduled callbacks -->
	<tr>
		<td width="70%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Scheduled callbacks\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			<table width="30%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
				<tr class="reportsTabName">
					 <!-- <td width="7%" align="center"><script>document.write(MultiArray["Time"][lang])</script></td>-->
					  <td width="7%" align="center"><script>document.write(MultiArray["Time zones"][lang])</script></td>
					  <td width="7%" align="center"><script>document.write(MultiArray["Scheduled callbacks"][lang])</script></td>
				</tr>
	<% 
				// Remise a 0 et declaration
				needOneMoreTotalRow = false;
				sTCallbacksSched = 0;
				
				for( int i = 0;i < beanCall.m_vAllDetails.size(); i++ ) 
				{
					r1 = (beanCallDetails)beanCall.m_vAllDetails.elementAt(i);
				 
 					if(( r1.time.length() >10 || r1.otherMonthYear) && i > 0) 
					{						
			
	%>
				<tr> 
				   <td bgcolor="#FFECF5" align="center"> <b><%out.write("<script>document.write(MultiArray[\"Sub total\"][lang])</script>");%></b></font></td>
				 <!-- <td bgcolor="#FFECF5" align="center"> <b><%//out.write(" ");%> </b></font></td>-->
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(sTCallbacksSched));%> </b></font></td>
				 </tr>

 <%						
				needOneMoreTotalRow = true;				
				sTCallbacksSched = 0;										
				
					}// fin du if							
					 %>
				
						<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");%> >
						  <!--<td align="center"> <%//out.write(r1.time);%></td>-->
						  <td align="center"> <%out.write(r1.TimeZone);%></td>
						  <td align="center"> <%out.write(Long.toString(r1.NbCallbacksSched));%> </td>
						</tr>
					<%				
					
				sTCallbacksSched  += r1.NbCallbacksSched;				
				tCallbacksSched += r1.NbCallbacksSched;				
				
		   		
   			}// fin du for	
				if(needOneMoreTotalRow == true) 
				{
					if(sTCallbacksSched!=0) 
					{
%>

					<tr>
						<td bgcolor="#FFECF5" align="center"> <b><%out.write("<script>document.write(MultiArray[\"Sub total\"][lang])</script>");%></b></font></td>
						<td bgcolor="#FFECF5" align="center"> <b><%out.write(" ");%> </b></font></td>
						<td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(sTCallbacksSched));%></b> </font></td>
					</tr>
 <%
					}
				}// fin du if		
%>
					<tr>
					  <td bgcolor="#FFECF5" align="center"> <b><%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
					  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tCallbacksSched));%> </b></font></td>
					</tr>
				
			</table>
		</td>
	</tr>
	
	<!-- Fin  -->
	
	<!-- Completed callbacks-->
	<tr>
		<td width="70%" align="center">
		
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td width="100%" align="left">
						<b>
							<%
								out.write("<script>document.write(MultiArray[\"Completed callbacks\"][lang])</script>");
							%>					
						</b>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			<table width="45%" align="left" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName">
			 	 <!-- <td width="15%" align="center"><script>document.write(MultiArray["Time"][lang])</script></td>-->
				  <td width="7%" align="center"><script>document.write(MultiArray["Time zones"][lang])</script></td>
				  <td width="7%" align="center"><script>document.write("Total Records")</script></td>
				  <td width="7%" align="center"><script>document.write(MultiArray["Callbacks"][lang])</script></td>
			  </tr>
			<%
			needOneMoreTotalRow = false;			
			sTRecords= 0;
			sTCallbacks = 0;
			tRecords= 0;
			tCallbacks = 0;
    		for( int i = 0;i < beanCall.m_vAllDetails.size(); i++ ) 
			{
				r1 = (beanCallDetails)beanCall.m_vAllDetails.elementAt(i);
				 
 				if(( r1.time.length() >10 || r1.otherMonthYear) && i > 0) 
				{			
			%>
			<tr> 
				   <td bgcolor="#FFECF5" align="center"> <b><%out.write("<script>document.write(MultiArray[\"Sub total\"][lang])</script>");%></b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(" ");%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(sTRecords));%></b> </font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(sTCallbacks));%> </b></font></td>
			</tr>
 			<%
				needOneMoreTotalRow = true;
				
				//-----
				sTRecords= 0;
				sTCallbacks = 0;
				//------
				
				
			}// fin du if
		%>
		<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
			 <!-- <td align="center"> <%//out.write(r1.time);%></td>-->
			  <td align="center"> <%out.write(r1.TimeZone);%></td>
			  <td align="center"> <%out.write(Long.toString(r1.TotalRecords));%> </td>
			  <td align="center"> <%out.write(Long.toString(r1.NbCallbacks));%> </td>
		</tr>
		
		<%
	   ///---------
		   	sTRecords += r1.TotalRecords;			
			sTCallbacks += r1.NbCallbacks;			
			tRecords += r1.TotalRecords;			
			tCallbacks += r1.NbCallbacks;
			
			///----------
		   
    }// fin du for
		if(needOneMoreTotalRow == true) 
		{
			%>
			<tr>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write("<script>document.write(MultiArray[\"Sub total\"][lang])</script>");%></b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(" ");%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(sTRecords));%></b> </font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(sTCallbacks));%> </b></font></td>
			</tr>
 			<%
		}// fin du if
		
%>
		<tr>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tRecords));%> </b></font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tCallbacks));%> </b></font></td>
		</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<tr>
			<table width="90%" align="center" border="0" cellpadding="0" cellspacing="0">
				<tr><td height="40"></td></tr>
			</table>
		</tr>
	</tr>
<!-- Fin -->	
	
	
	

	
	

	
			
</table>
