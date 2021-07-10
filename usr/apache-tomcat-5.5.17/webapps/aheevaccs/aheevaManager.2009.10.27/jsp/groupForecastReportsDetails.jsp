<%@page import ="java.lang.*"%>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%
String aht="";
String phone ="";
String Phone_variance="";
String Phone_variance30="";
%>
<table width="90%" cellpadding="0" cellspacing="0" align="center">
	<tr><td width="100%" align="center"><table width="70%" align="center"><tr><td height="20"></td></tr>
	<tr><td width="100%" align="center"><b><%
			try { out.write(groupName); } catch(Exception e) { out.write(""); } %>
	[<% out.println(groupId); %>]
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
							<% out.write("<script>document.write(MultiArray[\"Daily Report for\"][lang])</script>"); %>
							&nbsp;&nbsp; <%	out.write(startingDate); %>
						</b>
					</td>
				</tr>			
			</table>
		</td>
	</tr>
<tr><td height="20"></td></tr>
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsForecastReport" height="25">
			  	<td width="6%"  align="center" bgcolor="#FFFFFF">&nbsp;</td>
				<td width="8%"  align="center" bgcolor="#FFFFFF">&nbsp;</td>
			  	<td width="8%"  align="center" ><script>document.write(MultiArray["Agents"][lang])</script></td>
				<td width="8%"  align="center"><script>document.write(MultiArray["Phone"][lang])</script></td>
				<td width="7%"  align="center"><script>document.write(MultiArray["Break"][lang])</script></td>
				<td width="7%"  align="center" ><script>document.write(MultiArray["Lunch"][lang])</script></td>
				<td width="8%"  align="center" ><script>document.write(MultiArray["Training"][lang])</script></td>
				<td width="8%"  align="center"><script>document.write(MultiArray["Coaching"][lang])</script></td>
				<td width="5%"  align="center" ><script>document.write(MultiArray["Abs"][lang])</script></td>
				<td width="5%"  align="center" ><script>document.write(MultiArray["Quit"][lang])</script></td>
				<td width="8%"  align="center" ><script>document.write(MultiArray["Shrinkage"][lang])</script></td>
				<td width="7%"  align="center" ><script>document.write(MultiArray["Others"][lang])</script></td>
				<td width="8%"  align="center" >AHT</td>
				<td width="7%"  align="center" ><script>document.write(MultiArray["Call"][lang])</script></td>
			  </tr>
			  <%
				String key="";
				int sched =0;
			  	for(int i =0; i < beanGroupForecast.m_vAllData.size() ; i=i+1 )
				{
					aht="0.00";
				    phone ="0.00";
					r1 = (beanForecastInfos)beanGroupForecast.m_vAllData.elementAt(i);
					 if(r1 !=null){
					/*Phone_variance = r1.formatDecimalDouble(((((double)r1.nb_agts_login_actu -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu))/Long.parseLong(interval))/r1.nb_agts_phone_shed) ,2);*/
					 
					if(interval.compareTo("900")==0){					
					 if(r1.nb_calls_actu > 0)
						aht = r1.formatDecimalDouble( ( (double)(r1.tot_wrap_time +r1.tot_in_out_time+ r1.tot_hold)/(double)r1.nb_calls_actu), 2);
					 phone = r1.formatDecimalDouble((((double)r1.nb_agts_login_actu -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu))/Long.parseLong(interval)) ,2);
					 
					Phone_variance = r1.formatDecimalDouble(((((double)r1.nb_agts_login_actu -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu))/Long.parseLong(interval))/r1.nb_agts_phone_shed) ,2);
					System.out.println("Actual for " + r1.key + " " + r1.nb_agts_login_actu);
					%>
					<tr class="reportsForecastShed" height="20">
							<td   bgcolor="#99CCCC" align="center"><%out.write(r1.key);%></td>
							<td align="center" bgcolor="#CC99CC"><script>document.write(MultiArray["Scheduled"][lang])</script></td>
							<td align="center" bgcolor=""><%out.write(Long.toString(r1.nb_agts_login_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_agts_phone_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_agts_break_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_agts_lunch_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_agts_training_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_agts_coaching_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_agts_absent_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_agts_quit_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_agts_shrinkage_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_agts_others_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.aht_shed));%></td>
							<td align="center" ><%out.write(Long.toString(r1.nb_calls_shed));%></td>
					</tr>
					<tr class="reportsForecastActual" height="20">
						<td bgcolor="#FFFFFF" ><%out.write("    ");%></td>
						<td align="center" bgcolor="#FFCCCC"><script>document.write(MultiArray["Actual"][lang])</script></td>
						<td align="center"><%out.write(r1.formatDecimalDouble(((double)r1.nb_agts_login_actu/Long.parseLong(interval)),2));%></td>
						<td align="center"><%out.write(phone);%></td>
						<td align="center"><%out.write(r1.formatDecimalDouble(((double)r1.nb_agts_break_actu/Long.parseLong(interval)),2));%></td>
						<td align="center"><%out.write(r1.formatDecimalDouble(((double)r1.nb_agts_lunch_actu/Long.parseLong(interval)),2));%></td>
						<td align="center"><%out.write(r1.formatDecimalDouble(((double)r1.nb_agts_training_actu/Long.parseLong(interval)),2));%></td>
						<td align="center"><%out.write(r1.formatDecimalDouble(((double)r1.nb_agts_coaching_actu/Long.parseLong(interval)),2));%></td>
						<td align="center"><%out.write(r1.formatDecimalDouble(((double)r1.nb_agts_absent_actu/Long.parseLong(interval)),2));%></td>
						<td align="center"><%out.write(r1.formatDecimalDouble(((double)r1.nb_agts_quit_actu/Long.parseLong(interval)),2));%></td>
						<td align="center"><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_login_shed)-(double)r1.nb_agts_login_actu/Long.parseLong(interval)-(double)r1.nb_agts_quit_actu/Long.parseLong(interval)-(double)r1.nb_agts_absent_actu/Long.parseLong(interval)),2));%></td>
						<td align="center"><%out.write(r1.formatDecimalDouble(((double)r1.nb_agts_others_actu/Long.parseLong(interval)),2));%></td>
						<td align="center"><%out.write(aht);%></td>
						<td align="center"><%out.write(Long.toString(Math.round((double)r1.nb_calls_actu)));%></td>
					</tr>
					<tr class="reportsForecastVariance" height="20">
						<td bgcolor="#FFFFFF" ><%out.write("    ");%></td>
						<td align="center" bgcolor="#FFCCCC"><script>document.write(MultiArray["Variance"][lang])</script></td>
						<td align="center">
						<% if(r1.nb_agts_login_shed !=0)  //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_login_actu/Long.parseLong(interval))/((double)r1.nb_agts_login_shed),2));
						   else out.write("N/A");%> </td><td align="center">
						<% if(r1.nb_agts_phone_shed !=0) 
				out.write(Phone_variance);
						   else out.write("N/A");%> </td><td align="center">
						<% if(r1.nb_agts_break_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_break_actu/Long.parseLong(interval))/((double)r1.nb_agts_break_shed),2));
						   else out.write("N/A"); %></td><td align="center">
						<% if(r1.nb_agts_lunch_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_lunch_actu/Long.parseLong(interval))/((double)r1.nb_agts_lunch_shed),2));
						   else out.write("N/A"); %> </td><td align="center">
						<% if(r1.nb_agts_training_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_training_actu/Long.parseLong(interval))/((double)r1.nb_agts_training_shed),2));
						   else out.write("N/A"); %></td><td align="center">
						<% if(r1.nb_agts_coaching_shed !=0) //ok 
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_coaching_actu/Long.parseLong(interval))/((double)r1.nb_agts_coaching_shed),2));
						   else out.write("N/A"); %> </td><td align="center">
						<% if(r1.nb_agts_absent_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_absent_actu/Long.parseLong(interval))/((double)r1.nb_agts_absent_shed),2));
						   else out.write("N/A"); %></td><td align="center">
						<% if(r1.nb_agts_quit_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_quit_actu/Long.parseLong(interval))/((double)r1.nb_agts_quit_shed),2));
						   else out.write("N/A"); %></td><td align="center">
						<% if(r1.nb_agts_shrinkage_shed !=0) //ok		
						out.write(r1.formatDecimalDouble((((double)(r1.nb_agts_login_shed)-(double)r1.nb_agts_login_actu/Long.parseLong(interval)-(double)r1.nb_agts_quit_actu/Long.parseLong(interval)-(double)r1.nb_agts_absent_actu/Long.parseLong(interval))/((double)r1.nb_agts_shrinkage_shed)),2));		
						   else out.write("N/A"); %></td><td align="center">
						<% if(r1.nb_agts_others_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_others_actu/Long.parseLong(interval))/((double)r1.nb_agts_others_shed),2));
						   else out.write("N/A"); %> </td><td align="center">
						<% if(r1.aht_shed !=0) //ok
				out.write(r1.formatDecimalDouble((Long.parseLong(aht))/((double)r1.aht_shed ),2));
						   else out.write("N/A");%> </td><td align="center">
						<% if(r1.nb_calls_shed !=0) //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_calls_actu)/((double)r1.nb_calls_shed),2));
						   else out.write("N/A"); %></td>						  		  
					<% 
					}
					if(interval.compareTo("1800")==0){
					//if((i==0) || ((i%2) == 0)  && (i<(beanGroupForecast.m_vAllData.size()-1))){
					if(((i%2) == 0)  && (i<(beanGroupForecast.m_vAllData.size()-1))){
					r2 = (beanForecastInfos)beanGroupForecast.m_vAllData.elementAt(i+1);
					
					if((r1.nb_calls_actu + r2.nb_calls_actu) > 0)
						aht = r1.formatDecimalDouble( ( (double)(r1.tot_wrap_time +r1.tot_in_out_time+ r1.tot_hold+r2.tot_wrap_time +r2.tot_in_out_time+ r2.tot_hold)/(double)(r1.nb_calls_actu + r2.nb_calls_actu)), 2);
					 phone = r1.formatDecimalDouble((((double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu) -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu + r2.nb_agts_break_actu + r2.nb_agts_lunch_actu + r2.nb_agts_training_actu +r2.nb_agts_coaching_actu +r2.nb_agts_absent_actu + r2.nb_agts_quit_actu + r2.nb_agts_others_actu))/Long.parseLong(interval)) ,2);
					 
					/*Phone_variance30 = r1.formatDecimalDouble(((((double)r1.nb_agts_login_actu -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu))/Long.parseLong(interval))/(r1.nb_agts_phone_shed + r2.nb_agts_phone_shed)/2.0) ,2);*/
					
					Phone_variance30 = r1.formatDecimalDouble(((((double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu) -(double)(r1.nb_agts_break_actu + r1.nb_agts_lunch_actu + r1.nb_agts_training_actu +r1.nb_agts_coaching_actu +r1.nb_agts_absent_actu + r1.nb_agts_quit_actu + r1.nb_agts_others_actu + r2.nb_agts_break_actu + r2.nb_agts_lunch_actu + r2.nb_agts_training_actu +r2.nb_agts_coaching_actu +r2.nb_agts_absent_actu + r2.nb_agts_quit_actu + r2.nb_agts_others_actu))/Long.parseLong(interval)))/((r1.nb_agts_phone_shed + r2.nb_agts_phone_shed)),2);
					
					System.out.println("Actual for " + r1.key + " " + r1.nb_agts_login_actu);
					System.out.println("Scheduled for " + r1.key + " " + r1.nb_agts_login_shed);
					System.out.println("Actual for " + r2.key + " " + r2.nb_agts_login_actu);
					System.out.println("Scheduled for " + r2.key + " " + r2.nb_agts_login_shed);
					%>
					
											   
			<tr class="reportsForecastShed" height="20">
			<td bgcolor="#99CCCC" align="center"><%out.write(r1.key);%></td>
			<td align="center" bgcolor="#CC99CC"><script>document.write(MultiArray["Scheduled"][lang])</script></td>
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_login_shed+r2.nb_agts_login_shed),2));%></td>
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_phone_shed+r2.nb_agts_phone_shed),2));%></td>
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_break_shed+r2.nb_agts_break_shed),2));%></td>			
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_lunch_shed+r2.nb_agts_lunch_shed),2));%></td>
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_training_shed+r2.nb_agts_training_shed),2));%></td>				
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_coaching_shed+r2.nb_agts_coaching_shed),2));%></td>
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_absent_shed+r2.nb_agts_absent_shed),2));%></td>			
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_quit_shed+r2.nb_agts_quit_shed),2));%></td>
		    <td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_shrinkage_shed+r2.nb_agts_shrinkage_shed),2));%></td>			
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.nb_agts_others_shed+r2.nb_agts_others_shed),2));%></td>			
			<td align="center" bgcolor=""><%out.write(r1.formatDecimalDouble((double)(r1.aht_shed+r2.aht_shed),2));%></td>						
			<td align="center" ><%out.write(Long.toString(Math.round((double)(r1.nb_calls_shed + r2.nb_calls_shed))));%></td>									
						
			<tr class="reportsForecastActual" height="20">
			  <td bgcolor="#FFFFFF" ><%out.write("    ");%></td>
			  <td align="center" bgcolor="#FFCCCC"><script>document.write(MultiArray["Actual"][lang])</script></td>
			  <td align="center" ><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu)/Long.parseLong(interval)) ,2));%></td>
			  <td align="center"><%out.write(phone);%></td>
			  <td align="center"><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_break_actu+r2.nb_agts_break_actu)/Long.parseLong(interval)) ,2));%></td>
			  <td align="center" ><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_lunch_actu+r2.nb_agts_lunch_actu)/Long.parseLong(interval)) ,2));%></td>
			  <td align="center" ><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_training_actu+r2.nb_agts_training_actu)/Long.parseLong(interval)) ,2));%></td>							              
			  <td align="center" ><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_coaching_actu+r2.nb_agts_coaching_actu)/Long.parseLong(interval)) ,2));%></td>
			  <td align="center" ><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_absent_actu+r2.nb_agts_absent_actu)/Long.parseLong(interval)),2));%></td>
			  <td align="center" ><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_quit_actu+r2.nb_agts_quit_actu)/Long.parseLong(interval)),2));%></td>
			  <td align="center" ><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_login_shed+r2.nb_agts_login_shed)-(double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu)/Long.parseLong(interval) -(double)r1.nb_agts_quit_actu/Long.parseLong(interval) - (double)r2.nb_agts_quit_actu/Long.parseLong(interval)- (double)r1.nb_agts_absent_actu/Long.parseLong(interval) - (double)r2.nb_agts_absent_actu/Long.parseLong(interval)),2));%></td>
			  <td align="center" ><%out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_others_actu+r2.nb_agts_others_actu)/Long.parseLong(interval)),2));%></td>
			  <td align="center" ><%out.write(aht);%></td>
			  <td align="center" ><%out.write(Long.toString(Math.round((double)(r1.nb_calls_actu+r2.nb_calls_actu))));%></td>
		  </tr>
		  	
		<tr class="reportsForecastVariance" height="20">
			<td bgcolor="#FFFFFF" ><%out.write("    ");%></td>
			<td align="center" bgcolor="#FFCCCC"><script>document.write(MultiArray["Variance"][lang])</script></td>
			<td align="center">		
			<% if((r1.nb_agts_login_shed + r2.nb_agts_login_shed) !=0)  //ok
				out.write(r1.formatDecimalDouble(((double)r1.nb_agts_login_actu/Long.parseLong(interval))/((double)(r1.nb_agts_login_shed+r2.nb_agts_login_shed)),2));
			  else out.write("N/A");%> </td><td align="center">
			<% if(r1.nb_agts_phone_shed !=0)  //ok
			   out.write(Phone_variance30);
				else out.write("N/A");%> </td><td align="center">
			<% if((r1.nb_agts_break_shed + r2.nb_agts_break_shed)!=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_break_actu+r2.nb_agts_break_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_break_shed + r2.nb_agts_break_shed)),2));
				else out.write("N/A"); %></td><td align="center">
			<% if((r1.nb_agts_lunch_shed + r2.nb_agts_lunch_shed) !=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_lunch_actu+r2.nb_agts_lunch_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_lunch_shed + r2.nb_agts_lunch_shed)),2));
			    else out.write("N/A"); %> </td><td align="center">
			<% if((r1.nb_agts_training_shed + r2.nb_agts_training_shed) !=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_training_actu+r2.nb_agts_training_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_training_shed + r2.nb_agts_training_shed)),2));
			    else out.write("N/A"); %></td><td align="center">
			<% if((r1.nb_agts_coaching_shed + r2.nb_agts_coaching_shed) !=0) //ok 
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_coaching_actu+r2.nb_agts_coaching_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_coaching_shed + r2.nb_agts_coaching_shed)),2));
				else out.write("N/A"); %> </td><td align="center">
			<% if((r1.nb_agts_absent_shed + r2.nb_agts_absent_shed)!=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_absent_actu+r2.nb_agts_absent_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_absent_shed + r2.nb_agts_absent_shed)),2));
				else out.write("N/A"); %></td><td align="center">
			<% if((r1.nb_agts_quit_shed + r2.nb_agts_quit_shed)!=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_quit_actu+r2.nb_agts_quit_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_quit_shed + r2.nb_agts_quit_shed)),2));
				else out.write("N/A"); %></td><td align="center">
			<% if((r1.nb_agts_shrinkage_shed + r2.nb_agts_shrinkage_shed) !=0) //ok		
				out.write(r1.formatDecimalDouble((((double)(r1.nb_agts_login_shed+r2.nb_agts_login_shed)-(double)(r1.nb_agts_login_actu+r2.nb_agts_login_actu)/Long.parseLong(interval)-(double)(r1.nb_agts_quit_actu+r2.nb_agts_quit_actu)/Long.parseLong(interval)-(double)(r1.nb_agts_absent_actu+r2.nb_agts_absent_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_shrinkage_shed + r2.nb_agts_shrinkage_shed))),2));		
				else out.write("N/A"); %></td><td align="center">
				<% if((r1.nb_agts_others_shed + r2.nb_agts_others_shed) !=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_agts_others_actu+r2.nb_agts_others_actu)/Long.parseLong(interval))/((double)(r1.nb_agts_others_shed + r2.nb_agts_others_shed)),2));
				else out.write("N/A"); %> </td><td align="center">
				<% if((r1.aht_shed + r2.aht_shed) !=0) //ok
				out.write(r1.formatDecimalDouble((Long.parseLong(aht))/((double)(r1.aht_shed + r2.aht_shed )),2));
				else out.write("N/A");%> </td><td align="center">
						<% if((r1.nb_calls_shed + r2.nb_calls_shed) !=0) //ok
				out.write(r1.formatDecimalDouble(((double)(r1.nb_calls_actu+r2.nb_calls_actu))/((double)(r1.nb_calls_shed + r2.nb_calls_shed)),2));
						   else out.write("N/A"); %></td>		
					</tr>			
					<%
					}//%2==0
				}//fin interval 1800
			}
		}
					%>
			  
			</table>
		</td>
	</tr>
</table>
