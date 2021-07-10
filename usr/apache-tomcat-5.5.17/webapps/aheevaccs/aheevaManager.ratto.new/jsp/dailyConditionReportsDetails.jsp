<%@page import ="java.lang.*"%>

<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%
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
						<b><% out.write("<script>document.write(MultiArray[\"Staffing daily condition report\"][lang])</script>"); %></b>
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
				<td width="12%" align="center" colspan="4"><script>document.write(MultiArray["Condition"][lang])</script></td>
			  </tr>
			  <tr height="25" bgcolor="#E9CFEC">
			  	<td align="center">&nbsp;</td>
			  	<td align="center" colspan="2"><script>document.write(MultiArray["Service"][lang])</script></td>
				<td align="center" colspan="7"><script>document.write(MultiArray["Calls"][lang])</script></td>
				<td align="center" colspan="2"><script>document.write(MultiArray["Transfer"][lang])</script></td>
				<td align="center" colspan="7">&nbsp;</td>
				<td align="center" colspan="3"><script>document.write(MultiArray["Forecast"][lang])</script></td>
				<td align="center" colspan="2"><script>document.write(MultiArray["From WFM Tool"][lang])</script></td>
				<td align="center" colspan="2"><script>document.write(MultiArray["Load factor"][lang])</script></td>
				<td align="center">&nbsp;</td>
				<td align="center" colspan="2"><script>document.write(MultiArray["Condition managed"][lang])</script></td>
				<td align="center">&nbsp;</td>				
			  </tr>

			  <tr>
			    <td align="center"><script>document.write(MultiArray["Intervals"][lang])</script></td>

				<td align="center"><script>document.write(MultiArray["Service level"][lang])</script> (%)</td>
				<td align="center">% <script>document.write(MultiArray["Service lev. consist."][lang])</script> &gt;= 70% (%)"</td>

				<td align="center"><script>document.write(MultiArray["Agent calls offered (call vol.)"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Agent calls handled - Source (#)"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Agent calls abnd (#)"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Short calls"][lang])</script></td>
				<td align="center">%<script>document.write(MultiArray["Agent calls abnd"][lang])</script> (%)</td>
				<td align="center"><script>document.write(MultiArray["Calls answer. > Thresh."][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Calls aband. > Thresh."][lang])</script></td>

								
				<td align="center"><script>document.write(MultiArray["Calls transf. out"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Calls transf. to Bell"][lang])</script></td>

				<td align="center"><script>document.write(MultiArray["Avg handle time (sec)"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Avg hold time (sec)"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["ASA (sec)"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Total talk time"][lang])</script> (sec)</td>
				<td align="center"><script>document.write(MultiArray["Total hold time"][lang])</script> (sec)</td>
				<td align="center"><script>document.write(MultiArray["Total after call work (ACW) time"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Avg ACW Time"][lang])</script></td>

				<td align="center"><script>document.write(MultiArray["Locked forec."][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Offered vs Forec."][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Handled vs Forecast"][lang])</script></td>
				
				<td align="center"><script>document.write(MultiArray["Staffing required"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Net staffing"][lang])</script></td>

				<td align="center"><script>document.write(MultiArray["Non adher."][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Absence"][lang])</script></td>

				<td align="center"><script>document.write(MultiArray["Net A"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Surplus A"][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Conting."][lang])</script></td>
				<td align="center"><script>document.write(MultiArray["Net B"][lang])</script></td>

			
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

	






