<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pageInbndData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageInbndData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageInbndData.openConnection();
%>
<%
    int i=0,j=0,k=0;
    long tLoginTime = 0, sstLoginTime = 0;
    long tNotReadyTime = 0, sstNotReadyTime = 0;
    long tTalkTimeInbound = 0, sstTalkTimeInbound = 0;
    long tTalkTimeOutbound = 0, sstTalkTimeOutbound = 0;
    long tTalkTime = 0, sstTalkTime = 0;
    long tTime = 0, sstTime = 0;
    long tWrapUp =0, sstWrapUp=0;
	long tHold = 0, sstHold = 0;
	long tOffered = 0, sstOffered = 0;
	long tHandled =0, sstHandled =0;
    String [] m_Agents;
    String [] m_tLoginTime;
    String [] m_tTalkTimeInbound;
    String [] m_tTalkTimeOutbound;
    String [] m_tWaitTime;


    String tot_ServiceFactor = "", sstot_ServiceFactor = "";
	String time_p="", sstime_p="";

    long  totNAnswTh1 =0,sstotNAnswTh1=0;
	long totNAbandTh2 =0,sstotNAbandTh2 =0;
	long answered = 0,ssAnswered = 0, handled =0,sshandled =0;
	long queued =0,ssQueued =0;
	long abandonned =0,ssAbandonned =0;
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
					  <b>[<%out.write(phoneNumber);%>]</b>				
					 </td>
				</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="80%" align="center">
				<tr><td height="5"></td></tr>
				<tr>
					<td width="100%" align="center" ><font color="#003366">
						<b>
							<%
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageInbndData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageInbndData.getWord("Monthly"));						
								}
							
							%>
							<%= pageInbndData.getWord("Inbound calls report")%>  <br><br><%= pageInbndData.getWord("From")%>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} 
							%>
							<%= pageInbndData.getWord("To")%>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} 
							%>
							<br>
							<%
							 if(spacing.compareTo("15")==0)
							 {
							 	out.write("15 min "+ pageInbndData.getWord("Spacing(mn)"));
							 }
							 if(spacing.compareTo("30")==0)
							 {
							 	out.write("30 min "+ pageInbndData.getWord("Spacing(mn)"));
							 }
							 if(spacing.compareTo("60")==0)
							 {
							 	out.write("60 min "+pageInbndData.getWord("Spacing(mn)"));
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
			<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" >
				  <td width="20%" align="center"><b><%= pageInbndData.getWord("Call date")%></b></font></td>
				  <td width="20%"  align="center"><b><%= pageInbndData.getWord("Time period")%></b></font></td>
				  <td width="10%" align="center"><b><%= pageInbndData.getWord("Entered")%></b></font></td>
				  <td width="10%"  align="center"><%= pageInbndData.getWord("Answered")%></b></font></td>
				  <td width="10%"  align="center"><b><%= pageInbndData.getWord("Service factor")%></b></font></td>
				  <td width="10%"  align="center"><b><%= pageInbndData.getWord("Talk time")%></b></font></td>
				  <td width="10%"  align="center"><b><%= pageInbndData.getWord("Wrap up time")%></b></font></td>
				  <td width="10%"  align="center"><b><%= pageInbndData.getWord("Hold time")%></b></font></td>
				  <td width="10%"  align="center"><b><%= pageInbndData.getWord("Average answering time")%></b></font></td>
			  </tr>
<!-- traverse the array -->
<%
/*
 	  	   Vector v = new Vector();//(Vector)beanInboundCallReport.m_vAllDetails.values();   
 		  for (Iterator iter =  beanInboundCallReport.m_vAllDetails.values().iterator(); iter.hasNext();j++)
		   {
		   	  v.add( (beanCallReportDetails)iter.next());
		   }
		    
		  Collections.sort(v);
		  */	
		  String key="";
		  int first =0;
		  
		 for(j=0; j < beanInboundCallReport.key_vector.size() ; j++)
		   {
		   	key=(String)beanInboundCallReport.key_vector.elementAt(j);
			 r1 = (beanCallReportDetails)beanInboundCallReport.m_vAllDetails.get(key);

			if(time_p.compareTo(r1.timePeriod) !=0 && first !=0)
			{ 
		
			  String sst_productivity = "", ssavg_ans="";
			  float sst_product =0;
			  if (sstLoginTime == 0){
				sst_productivity = "";
			  } else {
				sst_product = (1-(((float)sstWrapUp + (float)sstNotReadyTime) / (float)sstLoginTime))* 100;
				sst_productivity = Float.toString(sst_product);
			  }
			  
				if (ssAnswered + ssAbandonned - sstotNAbandTh2 > 0) 
				{
					sstot_ServiceFactor = r1.formatDecimalDouble(( (double) sstotNAnswTh1 /(double) (ssAnswered + ssAbandonned - sstotNAbandTh2 )) *100 ,2);						
				}
				else
					sstot_ServiceFactor = "0.00";
				if (sshandled == 0) {
				  ssavg_ans= "00:00:00";
				}
				else {
				  ssavg_ans= r1.buildReadableTime( (sstTalkTime + sstWrapUp + sstHold) / sshandled);
				}				
		%>
				 <tr>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageInbndData.getWord("Sub total")%></b></font></td>
					 <td  bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssQueued));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(sshandled));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(sstot_ServiceFactor+"%");%></b></font></td>		 
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.buildReadableTime(sstTalkTime));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.buildReadableTime(sstWrapUp));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.buildReadableTime(sstHold));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(ssavg_ans);%></b></font></td>
				</tr>
			  
			  
			<%
			  sstLoginTime =0;
			  sstNotReadyTime =0;
			  sstTalkTime =0;
			  ssQueued =0;
			  ssAnswered =0;
			  sshandled =0;
			  ssAbandonned =0;
			  sstotNAbandTh2 =0;
			  sstotNAnswTh1 =0;
			  sstWrapUp  =0;
			  sstHold =0;
			  first =0;
		}
			 
%>
			  <tr <% if(j%2 == 0) out.write("class=reportsRowPair");
						else out.write("class=reportsRowUnPair");%> >
				  <td  align="center"><%
						if(time_p.compareTo(r1.timePeriod) !=0)
						{
							out.write("<font color=#800000>");
							out.write(r1.timePeriod);
							out.write("</font>");
						}
						else  out.write(" ");%></td>
			    <td align="center"><%out.write(r1.period_min+"-"+r1.period_max);%> </td>
				  <td align="center"><%out.write(Long.toString(r1.queued));%> </td>
				  <td align="center"><%out.write(Long.toString(r1.handled));%> </td>
				  <td align="center"><%out.write(r1.ServiceFactor+"%");%> </td>
				  <td align="center"><%out.write(r1.buildReadableTime(r1.totalTalkTimeInbound));%></td>
				  <td align="center"><%out.write(r1.getTotalWrapUpTime());%></td>
				  <td align="center"><%out.write(r1.getTotalHoldTime());%></td>
				  <td align="center"><%out.write(r1.getAvgDistributedCalls());%></td>
		      </tr>
<!-- end of array traversal-->
<%
			  first =1;
			  tLoginTime += r1.totalLoginTime;
			  sstLoginTime += r1.totalLoginTime;
			  tNotReadyTime += r1.totalNotReadyTime;
			  sstNotReadyTime += r1.totalNotReadyTime;
			  //tTalkTimeInbound += r1.totalTalkTimeInbound;
			  //tTalkTimeOutbound += r1.totalTalkTimeOutbound;
			  tTalkTime += r1.totalTalkTimeInbound;
			  sstTalkTime += r1.totalTalkTimeInbound;
			  
			  queued += r1.queued;
			  ssQueued += r1.queued;
			  answered += r1.distibuted;
			  ssAnswered += r1.distibuted;
			  handled +=r1.handled;
			  sshandled +=r1.handled;
			  abandonned += r1.abandonned;
			  ssAbandonned += r1.abandonned;
			  totNAbandTh2 += r1.nAbandTh2;
			  sstotNAbandTh2 += r1.nAbandTh2;
			  totNAnswTh1 += r1.nAnswTh1;
			  sstotNAnswTh1 += r1.nAnswTh1;
			  
			  tWrapUp  += r1.totalWrapUpTime;
			  sstWrapUp  += r1.totalWrapUpTime;
			  tHold += r1.totalHoldTime;
			  sstHold += r1.totalHoldTime;
			  
			  time_p =r1.timePeriod;
			  sstime_p =r1.timePeriod;
              System.out.println("\n totalTalkTimeInbound jsp=[" + Long.toString(r1.totalTalkTimeInbound) + "]");
			  
      	 }//end for(j = 0; j <  .size()..)
		 if(first ==1)
		 {
			  String sst_productivity = "", ssavg_ans="";
			  float sst_product =0;
			  if (sstLoginTime == 0){
				sst_productivity = "";
			  } else {
				sst_product = (1-(((float)sstWrapUp + (float)sstNotReadyTime) / (float)sstLoginTime))* 100;
				sst_productivity = Float.toString(sst_product);
			  }
			  
				if (ssAnswered + ssAbandonned - sstotNAbandTh2 > 0) 
				{
					sstot_ServiceFactor = r1.formatDecimalDouble(( (double) sstotNAnswTh1 /(double) (ssAnswered + ssAbandonned - sstotNAbandTh2 )) *100 ,2);						
				}
				else
					sstot_ServiceFactor = "0.00";
				if (sshandled == 0) {
				  ssavg_ans= "00:00:00";
				}
				else {
				  ssavg_ans= r1.buildReadableTime( (sstTalkTime + sstWrapUp + sstHold) / sshandled);
				}				
		%>
				 <tr>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageInbndData.getWord("Sub total")%></b></font></td>
					 <td  bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(ssQueued));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(sshandled));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(sstot_ServiceFactor+"%");%></b></font></td>		 
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.buildReadableTime(sstTalkTime));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.buildReadableTime(sstWrapUp));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.buildReadableTime(sstHold));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(ssavg_ans);%></b></font></td>
				</tr>
			  
				<%
		 }

		  String t_productivity = "", avg_ans="";
		  float t_product =0;
		  if (tLoginTime == 0){
			t_productivity = "";
		  } else {
			t_product = (1-(((float)tWrapUp + (float)tNotReadyTime) / (float)tLoginTime))* 100;
			t_productivity = Float.toString(t_product);
		  }
 		  r1 = new beanCallReportDetails();
			if (answered + abandonned - totNAbandTh2 > 0) 
			{
				tot_ServiceFactor = r1.formatDecimalDouble(( (double) totNAnswTh1 /(double) (answered + abandonned - totNAbandTh2 )) *100 ,2);						
			}
			else
				tot_ServiceFactor = "0.00";
			if (answered == 0) {
			  avg_ans= "00:00:00";
			}
			else {
			  avg_ans= r1.buildReadableTime( (tTalkTime + tWrapUp + tHold) / answered);
			}				
		  //r1.offered = tOffered;
		  //r1.handled = tHandled;
		  r1.totalTalkTime = tTalkTime;
		  r1.totalHoldTime = tHold;
		  //r1.totalTalkTimeInbound = tTalkTimeInbound;
		  //r1.totalTalkTimeOutbound = tTalkTimeOutbound;
		  r1.totalWrapUpTime  = tWrapUp;
		  r1.totalLoginTime = tLoginTime;
	%>
				 <tr>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%= pageInbndData.getWord("Total")%></b></font></td>
					 <td  bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(" ");%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(queued));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(Long.toString(handled));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(tot_ServiceFactor+"%");%></b></font></td>		 
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.buildReadableTime(tTalkTime));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.buildReadableTime(tWrapUp));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(r1.buildReadableTime(tHold));%></b></font></td>
					 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b><%out.write(avg_ans);%></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<% pageInbndData.closeConnection(); %>
