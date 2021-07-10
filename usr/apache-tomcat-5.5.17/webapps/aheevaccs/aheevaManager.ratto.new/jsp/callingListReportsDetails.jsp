
<%
boolean needOneMoreTotalRow = false;
    long tNbDials=0,tNbAnswered=0,tNbNoAnswer=0,tNbAbandoned=0,
         tNbAnswerMachine=0,tNbSit=0,tNbBusy=0,tNbFax=0,NbDials=0,
		 NbAnswered=0,NbNoAnswer=0,NbAbandoned=0,NbAnswerMachine=0,
		 NbSit=0,NbBusy=0,NbFax=0;

	long  ssTotNbDials =0 , ssTotNbAnswered =0 , ssTotNbNoAnswer =0,  ssTotNbAbandoned =0,
			   ssTotNbAnswerMachine =0, ssTotNbSit =0, ssTotNbBusy =0, ssTotNbFax =0;/* ssTotNbDials=0,
		 ssTotNbAnswered=0,ssTotNbNoAnswer=0,ssTotNbAbandoned=0,ssTotNbAnswerMachine=0,
		 ssTotNbSit=0,ssTotNbBusy=0,ssTotNbFax=0;*/

    double tHitRate=0; String thRate="0.00";
	String hit = "";
	int ptIndex = 0;
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
							<%
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
								}
							%>
							<script>document.write(MultiArray["Calling List Reports"][lang])</script>&nbsp; <script>document.write(MultiArray["for"][lang])</script> <br><br>
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
				<tr><td height="20"></td></tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="90%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName">
				  <td width="15%" align="center"><script>document.write(MultiArray["Time"][lang])</script></td>
				  <td width="10%" align="center"><script>document.write(MultiArray["HitRate"][lang])</script></td>
				  <td width="10%" align="center"><script>document.write(MultiArray["Dials"][lang])</script></td>
				  <td width="10%" align="center"><script>document.write(MultiArray["Answered"][lang])</script></td>
				  <td width="10%" align="center"><script>document.write(MultiArray["No answer"][lang])</script></td>
				  <td width="10%" align="center"><script>document.write(MultiArray["Abandoned"][lang])</script></td>
				  <td width="11%" align="center"><script>document.write(MultiArray["Answer machine"][lang])</script></td>
				  <td width="8%" align="center"><script>document.write(MultiArray["SIT"][lang])</script></td>
				  <td width="8%"  align="center"><script>document.write(MultiArray["Busy"][lang])</script></td>
				  <td width="8%" align="center"><script>document.write(MultiArray["Fax"][lang])</script></td>
			  </tr>
			<%
    		for( int i = 0;i < beanCallingList.m_vAllDetails.size(); i++ ) 
			{
				r1 = (beanCallingListDetails)beanCallingList.m_vAllDetails.elementAt(i);
				String hitr = Double.toString(r1.HitRate);
				int index = hitr.indexOf(".");
				if(hitr.substring(index+1).length()>2)
				   hitr = hitr.substring(0,index+1)+ hitr.substring(index+1,index+3);
				   
 			if(( r1.time.length() >10 || r1.otherMonthYear) && i > 0) {
				if (ssTotNbDials > 0){
					tHitRate = (double)((double)ssTotNbAnswered /(double)ssTotNbDials)*100;
					hit = Double.toString(tHitRate);
					ptIndex = hit.indexOf(".");
					if(hit.substring(ptIndex+1).length()>2)
					  hit = hit.substring(0,ptIndex+1)+ hit.substring(ptIndex+1,ptIndex+3);
					thRate = new String(hit);
				}
			
			
			%>
			<tr>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(" ");%></b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(thRate);%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbDials));%></b> </font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbAnswered));%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbNoAnswer));%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbAbandoned));%></b> </font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbAnswerMachine));%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbSit));%></b> </font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbBusy));%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbFax));%> </b></font></td>
			</tr>

 			<%
			   ssTotNbDials =0;
			   ssTotNbAnswered =0;
			   ssTotNbNoAnswer =0;
			   ssTotNbAbandoned =0;
			   ssTotNbAnswerMachine =0;
			   ssTotNbSit =0;
			   ssTotNbBusy =0;
			   ssTotNbFax =0;
			   tHitRate=0;
			   thRate="";
			   ptIndex=0;
			   hit = "";
				needOneMoreTotalRow = true;
			}
		%>
		<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
					else out.write("class=reportsRowUnPair");%> >
			  <td align="center"> <%out.write(r1.time);%></td>
			  <td align="center"> <%out.write(hitr);%></td>
			  <td align="center"> <%out.write(Long.toString(r1.NbDials));%> </td>
			  <td align="center"> <%out.write(Long.toString(r1.NbAnswered));%> </td>
			  <td align="center"> <%out.write(Long.toString(r1.NbNoAnswer));%> </td>
			  <td align="center"> <%out.write(Long.toString(r1.NbAbandoned));%> </td>
			  <td align="center"> <%out.write(Long.toString(r1.NbAnswerMachine));%> </td>
			  <td align="center"> <%out.write(Long.toString(r1.NbSit));%> </td>
			  <td align="center"> <%out.write(Long.toString(r1.NbBusy));%> </td>
			  <td align="center"> <%out.write(Long.toString(r1.NbFax));%> </td>
		</tr>
		<!-- end of array traversal-->
		<%
	
		   tNbDials +=r1.NbDials;
		   tNbAnswered +=r1.NbAnswered;
		   tNbNoAnswer +=r1.NbNoAnswer;
		   tNbAbandoned += r1.NbAbandoned;
		   tNbAnswerMachine +=r1.NbAnswerMachine;
		   tNbSit += r1.NbSit;
		   tNbBusy += r1.NbBusy;
		   tNbFax += r1.NbFax;
		   
		   ssTotNbDials +=r1.NbDials;
		   ssTotNbAnswered +=r1.NbAnswered;
		   ssTotNbNoAnswer +=r1.NbNoAnswer;
		   ssTotNbAbandoned += r1.NbAbandoned;
		   ssTotNbAnswerMachine +=r1.NbAnswerMachine;
		   ssTotNbSit += r1.NbSit;
		   ssTotNbBusy += r1.NbBusy;
		   ssTotNbFax += r1.NbFax;
		   
    }
		if(needOneMoreTotalRow == true) {
			if (ssTotNbDials > 0){
				tHitRate = (double)((double)ssTotNbAnswered /(double)ssTotNbDials)*100;
				hit = Double.toString(tHitRate);
				ptIndex = hit.indexOf(".");
				if(hit.substring(ptIndex+1).length()>2)
				  hit = hit.substring(0,ptIndex+1)+ hit.substring(ptIndex+1,ptIndex+3);
				thRate = new String(hit);
			}
			%>
			<tr>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(" ");%></b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(thRate);%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbDials));%></b> </font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbAnswered));%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbNoAnswer));%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbAbandoned));%></b> </font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbAnswerMachine));%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbSit));%></b> </font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbBusy));%> </b></font></td>
				  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(ssTotNbFax));%> </b></font></td>
			</tr>

 			<%
		}
	   tHitRate=0;
	   thRate="0.00";
	   ptIndex=0;
	   hit = "";
    if (tNbDials > 0){
        tHitRate = (double)((double)tNbAnswered /(double)tNbDials)*100;
        hit = Double.toString(tHitRate);
        ptIndex = hit.indexOf(".");
        if(hit.substring(ptIndex+1).length()>2)
          hit = hit.substring(0,ptIndex+1)+ hit.substring(ptIndex+1,ptIndex+3);
        thRate = new String(hit);
		
    }
%>
		<tr>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(thRate);%> </b></font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tNbDials));%></b> </font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tNbAnswered));%> </b></font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tNbNoAnswer));%> </b></font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tNbAbandoned));%></b> </font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tNbAnswerMachine));%> </b></font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tNbSit));%></b> </font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tNbBusy));%> </b></font></td>
			  <td bgcolor="#FFECF5" align="center"> <b><%out.write(Long.toString(tNbFax));%> </b></font></td>
		</tr>
			</table>
		</td>
	</tr>
</table>
