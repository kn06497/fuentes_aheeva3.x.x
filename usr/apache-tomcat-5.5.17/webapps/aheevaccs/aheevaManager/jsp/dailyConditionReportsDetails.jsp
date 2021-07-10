<%@page import ="java.lang.*"%>
<%@page import = "aheevaManager.ressources.*" %>

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%
beanManagerData pageDataAgent = new beanManagerData();
pageDataAgent.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDataAgent.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

//dailyInfo = null;
long pTotCalls = 0;
long sumTotCalls = 0;

%>

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
	<tr><td width="100%" align="center">
			<table width="70%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td  class="reportsID" width="100%" align="center">
						<b><%=pageDataAgent.getWord("Staffing daily condition report")%></b>
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
			<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr height="25" bgcolor="#E9CFEC">
			    <td width="82%%"  align="center" colspan="24">&nbsp;</td>
				<td width="3%"  align="center" >5%</td>
				<td width="3%"  align="center" >12%</td>
				<td width="12%" align="center" colspan="4"><%=pageDataAgent.getWord("Condition")%></td>
			  </tr>
			  <tr height="25" bgcolor="#E9CFEC">
			  	<td align="center">&nbsp;</td>
			  	<td align="center" colspan="2"><%=pageDataAgent.getWord("Service")%></td>
				<td align="center" colspan="7"><%=pageDataAgent.getWord("Calls")%></td>
				<td align="center" colspan="2"><%=pageDataAgent.getWord("Transfer")%></td>
				<td align="center" colspan="7">&nbsp;</td>
				<td align="center" colspan="3"><%=pageDataAgent.getWord("Forecast")%></td>
				<td align="center" colspan="2"><%=pageDataAgent.getWord("From WFM Tool")%></td>
				<td align="center" colspan="2"><%=pageDataAgent.getWord("Load factor")%></td>
				<td align="center">&nbsp;</td>
				<td align="center" colspan="2"><%=pageDataAgent.getWord("Condition managed")%></td>
				<td align="center">&nbsp;</td>				
			  </tr>

			  <tr>
			    <td align="center"><%=pageDataAgent.getWord("Intervals")%></td>

				<td align="center"><%=pageDataAgent.getWord("Service level")%> (%)</td>
				<td align="center">% <%=pageDataAgent.getWord("Service lev. consist.")%> &gt;= 70% (%)"</td>

				<td align="center"><%=pageDataAgent.getWord("Agent calls offered (call vol.)")%></td>
				<td align="center"><%=pageDataAgent.getWord("Agent calls handled - Source (#)")%></td>
				<td align="center"><%=pageDataAgent.getWord("Agent calls abnd (#)")%></td>
				<td align="center"><%=pageDataAgent.getWord("Short calls")%></td>
				<td align="center">%<%=pageDataAgent.getWord("Agent calls abnd")%> (%)</td>
				<td align="center"><%=pageDataAgent.getWord("Calls answer. > Thresh.")%></td>
				<td align="center"><%=pageDataAgent.getWord("Calls aband. > Thresh.")%></td>

								
				<td align="center"><%=pageDataAgent.getWord("Calls transf. out")%></td>
				<td align="center"><%=pageDataAgent.getWord("Calls transf. to Bell")%></td>

				<td align="center"><%=pageDataAgent.getWord("Avg handle time (sec)")%></td>
				<td align="center"><%=pageDataAgent.getWord("Avg hold time (sec)")%></td>
				<td align="center"><%=pageDataAgent.getWord("ASA (sec)")%></td>
				<td align="center"><%=pageDataAgent.getWord("Total talk time")%> (sec)</td>
				<td align="center"><%=pageDataAgent.getWord("Total hold time")%><script> (sec)</td>
				<td align="center"><%=pageDataAgent.getWord("Total after call work (ACW) time")%></td>
				<td align="center"><%=pageDataAgent.getWord("Avg ACW Time")%></td>

				<td align="center"><%=pageDataAgent.getWord("Locked forec.")%></td>
				<td align="center"><%=pageDataAgent.getWord("Offered vs Forec.")%></td>
				<td align="center"><%=pageDataAgent.getWord("Handled vs Forecast")%></td>
				
				<td align="center"><%=pageDataAgent.getWord("Staffing required")%></td>
				<td align="center"><%=pageDataAgent.getWord("Net staffing")%></td>

				<td align="center"><%=pageDataAgent.getWord("Non adher.")%></td>
				<td align="center"><%=pageDataAgent.getWord("Absence")%></td>

				<td align="center"><%=pageDataAgent.getWord("Net A")%></td>
				<td align="center"><%=pageDataAgent.getWord("Surplus A")%></td>
				<td align="center"><%=pageDataAgent.getWord("Conting.")%></td>
				<td align="center"><%=pageDataAgent.getWord("Net B")%></td>

			
			  </tr>

			  <tr  height="15" bgcolor="#FFECF5"><% dailyCondInfo = beanDailyCondition.period; %>
			    <td  align="center"><font  color="#000000"><b>"Summary"</b></font></td>
				<!-- Service -->
				<td align="center"></td>
				<td align="center"><%if(dailyCondInfo.getsumDistributed()+dailyCondInfo.getsumAbandAfterTH() > 0) out.write(""+dailyCondInfo.getRateSLOver70());%></td>
				<!-- Calls -->
				<td align="center"><%out.write( Long.toString(dailyCondInfo.getsumCallVolume()) );%></td>
				<td align="center"><%out.write( Long.toString(dailyCondInfo.getsumDistributed()) );%></td>
				<td align="center"><%out.write( Long.toString(dailyCondInfo.getsumAband()) );%></td>
				<td align="center"><%out.write( Long.toString(dailyCondInfo.getsumShortCall()) );%></td>
				<td align="center">&nbsp;</td>
				<td align="center"><%out.write( Long.toString(dailyCondInfo.getsumHandledAfterTH()) );%></td>
				<td align="center"><%out.write( Long.toString(dailyCondInfo.getsumAbandAfterTH()) );%></td>
				<!-- Transfers -->
				<td align="center">&nbsp;</td>
				<td align="center"><%out.write( Long.toString(dailyCondInfo.getsumTransfToBell()) );%></td>
				<!-- Calls (cont.) -->
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>			
				<td align="center"><%out.write(""+dailyCondInfo.getsumTalk());%></td>
				<td align="center"><%out.write(""+dailyCondInfo.getsumHold());%></td>
				<td align="center"><%out.write(""+dailyCondInfo.getsumWrapup());%></td>
				<td align="center">&nbsp;</td>
				<!-- Forecast -->
				<td align="center">&nbsp;</td><td align="center">&nbsp;</td><td align="center">&nbsp;</td>
				<!-- from WFM tools -->
				<td align="center">&nbsp;</td><td align="center">&nbsp;</td>
				<!-- load factor -->
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>
				<!-- Condition -->
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>			
			  </tr>
			  <%			  
			  	//dailyCondInfo = beanDailyCondition.period;
				int maxIntv = NUM_INTVL-1;//48 intervals
			    for(int j=0; j<maxIntv; j++)
				{ 
			  %>
			  <tr  <% if(j%2 == 0) out.write("class=reportsRowPair");
											else out.write("class=reportsRowUnPair"); %> height="20" >
			  	<td align="center" ><%out.write(intervalStart[j]);%></td>
				<!-- Service -->
				<td align="center"><%if(dailyCondInfo.pDistributed[j]+dailyCondInfo.pCallAbandAfterThreshold[j] > 0) out.write(""+dailyCondInfo.pSV[j]);%></td>
				<td align="center"><%if(dailyCondInfo.pDistributed[j]+dailyCondInfo.pCallAbandAfterThreshold[j] > 0) out.write(""+dailyCondInfo.pSLge70[j]);%></td>
				<!-- Calls -->
				<td align="center" ><%out.write(Long.toString(dailyCondInfo.pTotCalls[j]));%></td>
				<td align="center" ><%out.write(Long.toString(dailyCondInfo.pDistributed[j]));%></td>
				<td align="center" ><%out.write(Long.toString(dailyCondInfo.pAband[j]));%></td>
				<td align="center" ><%out.write(""+dailyCondInfo.pShortCall[j]);%></td>
				<td align="center" ><%if(dailyCondInfo.pTotCalls[j] != 0) out.write(""+(int)(100*dailyCondInfo.pAband[j]/dailyCondInfo.pTotCalls[j]));%></td>
				<td align="center"><%out.write(""+dailyCondInfo.pCallHandledAfterThreshold[j]);%></td>
				<td align="center"><%out.write(Long.toString(dailyCondInfo.pCallAbandAfterThreshold[j]));%></td>
				<!-- Transfers -->
				<td align="center">&nbsp;</td>
				<td align="center"><%out.write(""+dailyCondInfo.pTransfToBell[j]);%></td>
				<!-- Calls (cont.) -->
				<td align="center"><%if(dailyCondInfo.pDistributed[j] >0) out.write(""+dailyCondInfo.getAvgHandleTime(j));%></td>
				<td align="center"><%if(dailyCondInfo.pNumHold[j]>0) out.write(""+dailyCondInfo.getAvgHoldTime(j));%></td>
				<td align="center"><%if(dailyCondInfo.pDistributed[j] >0) out.write(""+dailyCondInfo.getASA(j));%></td>
				<td align="center"><%out.write(""+dailyCondInfo.pTotTalk[j]);%></td>
				<td align="center"><%out.write(""+dailyCondInfo.pTotHoldTime[j]);%></td>
				<td align="center"><%out.write(""+dailyCondInfo.pTotwrapup[j]);%></td>
				<td align="center"><%if(dailyCondInfo.pDistributed[j] >0) out.write(""+dailyCondInfo.getAvgWrapupTime(j));%></td>
				<!-- Forecast -->
				<td align="center">&nbsp;</td><td align="center">&nbsp;</td><td align="center">&nbsp;</td>
				<!-- from WFM tools -->
				<td align="center">&nbsp;</td><td align="center">&nbsp;</td>
				<!-- load factor -->
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>
				<!-- Condition -->
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>	
			  </tr>
			  <%
			     }//for
			  %>
			</table>
		</td>
	</tr>
</table>
<%
pageDataAgent.closeConnection();
%>