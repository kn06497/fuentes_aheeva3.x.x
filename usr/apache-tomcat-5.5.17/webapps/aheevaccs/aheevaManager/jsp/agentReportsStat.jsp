<%@page import ="aheevaManager.ressources.*"%>


<%
	String totNotReadyTime_Percent = "10" , totTalkTimeInbound_Percent = "10";
    String totTalkTimeOutbound_Percent = "20", totWaitTime_Percent = "10" , totWrapUp_Percent ="10";
	String totHold_Percent = "0" , totSingleTransfert_Percent ="10", totTwoStepTransfert_Percent ="10";
	String totOther_Percent = "10";
	String lang = "10";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");
		
	beanManagerData pageRepStData = new beanManagerData();
	pageRepStData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageRepStData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	
%>

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
var test ="<%= pageRepStData.getWord("Generals statistics")%>";
</script>
<table width="75%" cellpadding="0" cellspacing="0" align="center"><%if(from.compareTo("agentReport") !=0){%><tr><td width="100%" align="center"><table width="70%" align="center"><tr><td height="20"></td></tr><tr><td width="100%" align="center"><b><%try { out.write(beanAgent.getAgentFullName(agentId)); }catch(Exception e) { out.write(""); }%>[ <% out.println(agentId); %>] </b></td></tr></table></td></tr><tr><td width="100%" align="center"><table width="70%" align="center"><tr><td height="20"></td></tr><tr><td  class="reportsID" width="100%" align="center"><b><%= pageRepStData.getWord("Generals statistics")%> &nbsp;<%= pageRepStData.getWord("for")%><br><br><%if (reportType.compareTo("Daily") ==0){out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));} else if (reportType.compareTo("Monthly") ==0){out.write(starting_year_monthly+"-"+starting_month_monthly);} else if (reportType.compareTo("Yearly") ==0){out.write(starting_year_yearly);}%><%= pageRepStData.getWord("To")%><%if (reportType.compareTo("Daily") ==0){out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));}else if (reportType.compareTo("Monthly") ==0){out.write(ending_year_monthly+"-"+ending_month_monthly);} else if (reportType.compareTo("Yearly") ==0){out.write(ending_year_yearly);}%></b></td></tr>	</table></td></tr>
	<%}else{String wd1 ="100%", wd2 ="70%"; %><tr><td width="100%" align="center"><table   <% if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}else { out.write ("width=70%"); out.write("align=center"); }%>><tr><td height="20"></td></tr><tr><td width="100%" align="left"><font style="background-color:#FFC5A8"><b><%= pageRepStData.getWord("Generals statistics")%></b></font></td>	</tr></table></td></tr><%}%><tr><td width="100%" align="center"><table width="100%" <% if(detail.compareTo("1")==0 )  { out.write("align=left");}else {out.write("align=center"); }%>><tr><td height="20"></td></tr><tr>
					<td align="center"><%
					totNotReadyTime_Percent = Long.toString(agentInfo.totalNotReadyTime);
					totTalkTimeInbound_Percent = Long.toString(agentInfo.totalTalkTimeInbound);
					totTalkTimeOutbound_Percent =Long.toString(agentInfo.totalTalkTimeOutbound);
					totWaitTime_Percent = Long.toString(agentInfo.totalWaitTime);
					totWrapUp_Percent =Long.toString(agentInfo.totalWrapUpOutTime + agentInfo.totalWrapUpInTime);
					totHold_Percent = Long.toString(agentInfo.totalHoldTime) ;
					//totSingleTransfert_Percent = Long.toString(agentInfo.totalSingleTransfer);
					//totTwoStepTransfert_Percent = Long.toString(agentInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(agentInfo.totalLoginTime - agentInfo.totalNotReadyTime - 
														agentInfo.totalTalkTimeInbound - agentInfo.totalTalkTimeOutbound -
														agentInfo.totalWaitTime - agentInfo.totalWrapUpOutTime -
														agentInfo.totalWrapUpInTime - agentInfo.totalHoldTime ); 
														//agentInfo.totalSingleTransfer - agentInfo.totalTwoStepTranfer);
					totOther_Percent = Long.toString(agentInfo.totalLoginTime - agentInfo.totalNotReadyTime - 
														agentInfo.totalTalkTimeInbound - agentInfo.totalTalkTimeOutbound -
														agentInfo.totalWaitTime - agentInfo.totalWrapUpOutTime -
														agentInfo.totalWrapUpInTime - agentInfo.totalHoldTime - 
														agentInfo.totalSingleTransfer - agentInfo.totalTwoStepTranfer);
					
					
					out.write("<applet code='Manager.PieChart.PiechartApplet.class'  archive='../sAheevaChart.jar' width='650' height='320' mayscript name='graphApplet'>");
					// Start Up Parameters -->
					
				//out.write("<PARAM name='LOADINGMESSAGE' value='"+pageRepstatsData.getWord("graphloadingmessage")+"'>");					
				
				out.write("<PARAM name='STEXTCOLOR'     value='0,0,100'>");
				out.write("<PARAM name='STARTUPCOLOR'   value='255,255,255'>");
					//Character Encoding -->
				out.write("<PARAM name='charset'   value='8859_1'>");
					
					//Chart Switches -->
				out.write("<PARAM name='3D' value='true'>");
				out.write("<PARAM name='Slabels' value='true'>");
				out.write("<PARAM name='legend'  value='true'>");
				out.write("<PARAM name='displayPercentages' value='true'>");
					
					//Chart Characteristics -->
				out.write("<PARAM name='width'      value='550'>");
				out.write("<PARAM name='height'     value='250'>");
				out.write("<PARAM name='nPies'      value='1'>");
				out.write("<PARAM name='depth3D'    value='15'>");
				out.write("<PARAM name='ndecplaces' value='0'>");
				out.write("<PARAM name='3Dangle'    value='50'>");
					 
					// Thousand separator -->
				out.write("<PARAM name='thousandseparator' value=''>");
					
					//Link Cursor -->
					//valid values are - crosshair, default, hand, move, text or wait -->
				out.write("<PARAM name='linkCursor' value='default'>");
					
					//Popup segment Value Pre & Post Symbols -->
				out.write("<PARAM name='valuepresym'  value=''>");
				out.write("<PARAM name='valuepostsym'  value=' '>");
					
					//Additional font information -->
				out.write("<PARAM name='popupfont'  value='Arial,B,12'>");
				out.write("<PARAM name='slabelfont' value='Arial,N,10'>");
					
					// Additional color information -->				
				out.write("<PARAM name='bgcolor'      value='white'>");
				out.write("<PARAM name='labelcolor'   value='50,50,50'>");
					
					
					// Legend Information -->
				out.write("<PARAM name='legendfont'       value='Arial,N,10'>");
				out.write("<PARAM name='legendposition'   value='420,10'>");
				
				out.write("<PARAM name='legendtitle'   value='"+pageRepStData.getWord("calls") +"'>");
				
				out.write("<PARAM name='LegendBackground' value='255,255,255'>");
				out.write("<PARAM name='LegendBorder'     value='125,125,125'>");
				out.write("<PARAM name='LegendtextColor'  value='0,0,0'>");
					
					//Pie Data -->
					//  PieN   x,y,size,number of segments, seperation -->
				out.write("<PARAM name='Pie1' value='110,50,175,9,5'>");
				
					//Pie Segement Labels -->
				out.write("<PARAM name='pie1label1' value=''>");
				out.write("<PARAM name='pie1label2' value=''>");
				out.write("<PARAM name='pie1label3' value=''>");
				out.write("<PARAM name='pie1label4' value=''>");
				out.write("<PARAM name='pie1label5' value=''>");
				out.write("<PARAM name='pie1label6' value=''>");
				out.write("<PARAM name='pie1label7' value=''>");
				out.write("<PARAM name='pie1label8' value=''>");
					
					
				out.write("<PARAM name='segment1'   value='115,152,164|"+ pageRepStData.getWord("inbound") +"'>");				
				
				out.write("<PARAM name='segment2'   value='99,99,156|"+ pageRepStData.getWord("outbound") +"'>");				
				
				out.write("<PARAM name='segment3'   value='185,53,8|"+ pageRepStData.getWord("wrapup") +"'>");
				
				out.write("<PARAM name='segment4'   value='239,214,115|"+ pageRepStData.getWord("hold") +"'>");
								
				out.write("<PARAM name='segment5'   value='100,100,60|"+ pageRepStData.getWord("waiting") +"'>");
												
				out.write("<PARAM name='segment6'   value='17,97,158|"+ pageRepStData.getWord("notready") +"'>");
								
				out.write("<PARAM name='segment7'   value='100,214,50|"+ pageRepStData.getWord("singletransfer") +"'>");
										
				out.write("<PARAM name='segment8'   value='180,0,230|"+ pageRepStData.getWord("twosteptransfer") +"'>");	
				
				out.write("<PARAM name='segment9'   value='228,115,64|"+ pageRepStData.getWord("Dialing") +"'>");	
				
				
				out.write("<PARAM name='data1series1' value=\""+totTalkTimeInbound_Percent+"\">");
				out.write("<PARAM name='data2series1' value=\""+totTalkTimeOutbound_Percent+"\">");
				out.write("<PARAM name='data3series1' value=\""+totWrapUp_Percent+"\">");
				out.write("<PARAM name='data4series1' value=\""+totHold_Percent+"\">");
				out.write("<PARAM name='data5series1' value=\""+totWaitTime_Percent+"\">");
				out.write("<PARAM name='data6series1' value=\""+totNotReadyTime_Percent+"\">");
				//out.write("<PARAM name='data7series1' value=\""+totSingleTransfert_Percent+"\">");
				//out.write("<PARAM name='data8series1' value=\""+totTwoStepTransfert_Percent+"\">");
				out.write("<PARAM name='data7series1' value=\""+totOther_Percent+"\">");
				out.write("<PARAM name='data8series1' value=\""+totOther_Percent+"\">");
				 
					
				out.write("</applet>");

					
					
					
					
					
					%></td></tr></table></td></tr>
	<%if(from.compareTo("agentReport") !=0){%><tr><td width="100%" align="center"><table width="70%" align="center"><tr><td height="20"></td></tr><tr><td  class="reportsID" width="100%" align="center"><b><%= pageRepStData.getWord("Other statistics")%> </b></td></tr>	</table></td></tr><%}else{%><tr><td width="100%" align="center"><table <% if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}else { out.write ("width=70%"); out.write("align=center"); }%> ><tr><td height="20"></td></tr><tr><td width="100%" align="left"><font style="background-color:#FFC5A8"><b><%= pageRepStData.getWord("Other statistics")%> 		</b></font></td></tr></table></td></tr><%}%>
	<tr>
		<td width="100%" align="center">
			<table <% if(detail.compareTo("1")==0 )  { out.write("width=100%"); out.write("align=left");}
				else { out.write ("width=70%"); out.write("align=center"); }%> border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC"style="border-collapse:collapse ">
			  <tr><td height="20"></td></tr>
				  <tr >
					<td class="reportsTabValues" width="15%" style="border-style:solid; border-width:medium">
					<%= pageRepStData.getWord("Sheduled time")%></td>
					<td class="reportsTabValues" width="20%" style="border-style:solid; border-width:medium">
					  <%
						out.write(agentInfo.getScheduled());
					%>
					</td>					
				  </tr>
				  <tr >
					<td class="reportsTabValues" width="35%" style="border-style:solid; border-width:medium">
					<%= pageRepStData.getWord("Login")%></td>
					<td class="reportsTabValues" width="20%" style="border-style:solid; border-width:medium">
					<%
						out.write(agentInfo.buildReadableTime(agentInfo.totalLoginTime));
					%>					</td>					
					
				  </tr>
	
				  <tr >
					<td class="reportsTabValues" width="35%" style="border-style:solid; border-width:medium">
					<%= pageRepStData.getWord("Adherence")%></td>
					<td class="reportsTabValues" width="20%" style="border-style:solid; border-width:medium">
					<%
						out.write(agentInfo.getAdherence());
					%>	
					</td>					
				  </tr>
			</table>
		</td>
	</tr>
</table>		
<% pageRepStData.closeConnection();%>
