<html>
<%@page import ="aheevaManager.ressources.*"%>
<body>

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>


<%
	String totNbEntered ="" ;
    String totNbAnswered = "" ;
    String totNbAbandonned = "" ;
	String lang = "0";
	if(request.getParameter("lang") != null)
		lang = request.getParameter("lang");
		
	beanManagerData pageQuRStData = new beanManagerData();
	pageQuRStData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageQuRStData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
%>

<table width="80%" cellpadding="0" cellspacing="0" align="center">
	<%
	if(from.compareTo("queueReport") !=0)
	{
	%>
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
							<%= pageQuRStData.getWord("Generals statistics")%>&nbsp; <%= pageQuRStData.getWord("for")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageQuRStData.getWord("To")%>
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
	else
	{
	 %>
		<tr>
			<td width="100%" align="center">
				<table width="110%" align="center">
					<tr><td height="20"></td></tr>
					<tr>
						<td width="100%" align="left"><font style="background-color:#FFC5A8">
							<b><%= pageQuRStData.getWord("Generals statistics")%>				
							</b>
							</font>
						</td>
					</tr>			
				</table>
			</td>
		</tr>
	<%
	}
	%>
	<tr>
		<td width="100%" align="center">
			<table width="100%" align="center">
				<tr><td height="20"></td></tr>
				<tr>
					<td align="center">
				<%
					queueInfo = (beanQueueDetails)beanQueue.period;
					if(queueInfo ==null)
						System.out.println("\n queueInfo = NULL !!!!! ");
					else
						System.out.println("\n queueInfo = NON NULL !!!!! ");
						/*
					if(period ==null)
						System.out.println("\n period = NULL !!!!! ");
					else
						System.out.println("\n period = NON NULL !!!!! ");
						*/
						
					totNbAnswered = Long.toString(queueInfo.NbDistributed);
					totNbAbandonned =Long.toString(queueInfo.NbAbandonned);

					out.write("<applet code='Manager.PieChart.PiechartApplet.class'  archive='../sAheevaChart.jar' width='550' height='300' mayscript name='graphApplet'>");
						// Start Up Parameters -->
						
					out.write("<PARAM name='LOADINGMESSAGE' value='"+pageQuRStData.getWord("graphloadingmessage")+"'>");
				
				
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
					
					out.write("<PARAM name='legendtitle'   value='"+ pageQuRStData.getWord("calls") +"'>");					
					
					out.write("<PARAM name='LegendBackground' value='255,255,255'>");
					out.write("<PARAM name='LegendBorder'     value='125,125,125'>");
					out.write("<PARAM name='LegendtextColor'  value='0,0,0'>");
						
						//Pie Data -->
						//  PieN   x,y,size,number of segments, seperation -->
					out.write("<PARAM name='Pie1' value='110,50,175,2,5'>");
					
						//Pie Segement Labels -->
					out.write("<PARAM name='pie1label1' value=''>");
					out.write("<PARAM name='pie1label2' value=''>");						
					
					out.write("<PARAM name='segment1'   value='115,152,164|"+ pageQuRStData.getWord("Answered") +"'>");	
									 
					out.write("<PARAM name='segment2'   value='185,53,8|"+ pageQuRStData.getWord("Abandoned") +"'>");	
					

					out.write("<PARAM name='data1series1' value=\""+totNbAnswered+"\">");
					out.write("<PARAM name='data2series1' value=\""+totNbAbandonned+"\">");
					 
						
					out.write("</applet>");
				
					%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>		
</body>
</html>

<% pageQuRStData.closeConnection(); %>
