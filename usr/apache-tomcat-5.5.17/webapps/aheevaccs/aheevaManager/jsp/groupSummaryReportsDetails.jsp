<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.ressources.*"%>

<%
beanManagerData pageSumRepdData = new beanManagerData();
pageSumRepdData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSumRepdData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%

	long [] totNotReadyReason =null;
 	long tot_loginTime = 0;
 	long tot_talkTime = 0;
 	long totOthers= 0; 
 	long talk_time = 0;
 	long wrap_time = 0;
	long tot_holdTime = 0;
	long tot_waitTime = 0;
	long tot_wrapTime = 0;
 	

%>
<table width="100%" cellpadding="0" cellspacing="0">
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
							<%= pageSumRepdData.getWord("Daily Report for")%>
							&nbsp;&nbsp; <%	
							out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							%>
							<%= pageSumRepdData.getWord("To")%>
							<%
							out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							%>
						</b>					</td>
				</tr>			
			</table>		</td>
	</tr>
<tr><td height="20"></td></tr>
<%
			String lg_table="";
			int nb_NRR = beanGroupSummary.m_vAllNRR.size();
			if(nb_NRR < 6) lg_table = Integer.toString(100 -(6-nb_NRR)*10)+"%";
			else  lg_table = Integer.toString(100)+"%";
%>
	<tr>
	  <td width="100%" align="center"><table  width="<%out.write(lg_table);%>" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
        <tr class="reportsForecastReport" height="25">
          <td align="center" ><%= pageSumRepdData.getWord("Date")%></td>
          <td  align="center"><%= pageSumRepdData.getWord("Login time")%></td>
          <%
			
					totNotReadyReason = new long[beanGroupSummary.m_vAllNRR.size()];
					for(int k =0; k < beanGroupSummary.m_vAllNRR.size(); k++)
					{ 
					  totNotReadyReason[k]=0;
					%>
          <td align="center" ><%=beanGroupSummary.m_vAllNRR.elementAt(k) %></td>
          <%
					}	
				
				%>
          <td  align="center"><%= pageSumRepdData.getWord("Talk time")%></td>
		  <td  align="center"><%= pageSumRepdData.getWord("Wrap up time")%></td>
          <td  align="center"><%= pageSumRepdData.getWord("Hold time")%></td>
          <td  align="center"><%= pageSumRepdData.getWord("Waiting time")%></td>
          <td align="center"><%= pageSumRepdData.getWord("Others")%></td>
        </tr>
        <%
				String key="";
				HashMap mapNRR = (HashMap)beanGroupSummary.mapNrr;
			  	for(int i =0; i < beanGroupSummary.key_vector.size() ; i++ )
				{
					r1 = (beanSummaryInfos)beanGroupSummary.m_vAllData.get(beanGroupSummary.key_vector.elementAt(i));
					 if(r1 !=null)
					 {
					 
						talk_time =r1.totTalkTime_in + r1.totTalkTime_out ;
						wrap_time =r1.totWrapTime_in + r1.totWrapTime_out ;
						tot_holdTime +=r1.totHoldTime ;
						tot_waitTime +=r1.totWaitTime ;
						tot_loginTime +=r1.totLoginTime;
						tot_talkTime +=talk_time;
						tot_wrapTime +=wrap_time;
						totOthers +=r1.totOthers_evtTime;
					%>
        <tr <% if(i%2 == 0) out.write("class=reportsRowPair");
				else out.write("class=reportsRowUnPair");%>>
          <td  align="center"><%out.write(r1.reportDate);%></td>
          <td align="center" ><%out.write(r1.buildReadableTime(r1.totLoginTime));%></td>
          <%
				//get NRRR
				for (int n = 0; n < beanGroupSummary.m_vAllNRR.size(); n++) 
				{
					String nreadyreason = (String)beanGroupSummary.m_vAllNRR.elementAt(n);
					String nrr_key=r1.reportDate+"_"+nreadyreason;
					//System.out.println("---totRRRTime =["+ r1.totRRRTime+"]  ");
					beanSummaryReport.nrrdata tmpNrrElt = (beanSummaryReport.nrrdata)mapNRR.get(nrr_key);
					if (tmpNrrElt != null) 
					{
						%>
						<td align="center" ><%out.write( r1.buildReadableTime(tmpNrrElt.nrrtime)); %></td>
						  <%						
						totNotReadyReason[n] += tmpNrrElt.nrrtime;	
					}
					else
					{
						%><td align="center" ><%out.write("00:00:00"); %></td><%
					}
				}		  
			%>
          <td align="center"><%out.write(r1.buildReadableTime(talk_time));%></td>
          <td align="center"><%out.write(r1.buildReadableTime(wrap_time));%></td>
		  <td align="center"><%out.write(r1.buildReadableTime(r1.totHoldTime ));%></td>
		  <td align="center"><%out.write(r1.buildReadableTime(r1.totWaitTime ));%></td>
          <td align="center"><%out.write(r1.buildReadableTime(r1.totOthers_evtTime ));%></td>
        </tr>
        <%
					}
				}
			   r1 =new beanSummaryInfos();
			  %>
			<tr  bgcolor="#FFECF5" >
				<td align="center" ><b><%= pageSumRepdData.getWord("Total")%></b></td>
				<td align="center" ><%out.write(r1.buildReadableTime(tot_loginTime));%></td>
          <%
				//get NRRR
				for (int n = 0; n < beanGroupSummary.m_vAllNRR.size(); n++) 
				{
				%>
				<td align="center" ><%out.write( r1.buildReadableTime(totNotReadyReason[n])); %></td>
				  <%						
				}		  
			%>
          <td align="center"><%out.write(r1.buildReadableTime(tot_talkTime));%></td>
          <td align="center"><%out.write(r1.buildReadableTime(tot_wrapTime));%></td>
          <td align="center"><%out.write(r1.buildReadableTime(tot_holdTime));%></td>
          <td align="center"><%out.write(r1.buildReadableTime(tot_waitTime));%></td>
          <td align="center"><%out.write(r1.buildReadableTime(totOthers));%></td>
			</tr>
      </table></td>
	</tr>
</table>
<% pageSumRepdData.closeConnection(); %>
