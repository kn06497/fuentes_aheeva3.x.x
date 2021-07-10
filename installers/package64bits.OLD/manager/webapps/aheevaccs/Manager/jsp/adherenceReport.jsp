<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=utf-8">
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="Manager.schedule.*"%>
<jsp:useBean id="beanAgent" scope="request" class="Manager.schedule.beanAdherenceReport" />
<body bgcolor="#E1F4FF">
<%

    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
	String starting_year_yearly = request.getParameter("starting_year_yearly");
	String ending_year_yearly = request.getParameter("ending_year_yearly");
	String starting_month_monthly = request.getParameter("starting_month_monthly");
	String starting_year_monthly = request.getParameter("starting_year_monthly");
	String ending_month_monthly = request.getParameter("ending_month_monthly");
	String ending_year_monthly = request.getParameter("ending_year_monthly");
    String reportType   = request.getParameter("reportType");
    String agents       = request.getParameter("objects");	
    String agtGroup      = request.getParameter("agtGrp");	
  	String orderBy 		 = request.getParameter("order");

    StringTokenizer tok = null;
    beanAdherenceDetails r1 = null;
	int index = 0;
	double tot_period=0.0,tot_num_adh=0.0,adherence=0.0;
	String tmp="",firstStartTime="",lastEndTime="";

	String startingDate="", endingDate="";	
    if (reportType.compareTo("Daily") ==0){
		startingDateDaily = startingDateDaily.substring(6)+"/"+ startingDateDaily.substring(0,2)+"/"+startingDateDaily.substring(3,5) ;
        startingDate =startingDateDaily;
		endingDateDaily = endingDateDaily.substring(6)+"/"+ endingDateDaily.substring(0,2)+"/"+endingDateDaily.substring(3,5) ;
        endingDate =endingDateDaily;
        
    } else if (reportType.compareTo("Monthly") ==0){
		startingDate = starting_year_monthly+"/"+starting_month_monthly; //+"/01";
		endingDate = ending_year_monthly+"/"+ending_month_monthly; 
    } else if (reportType.compareTo("Yearly") ==0){
		startingDate=starting_year_yearly;
		endingDate = ending_year_yearly;
    }

%>
<p align="left"> 
<table width="350" border="0" >
  <tr>
    <td  ><div align="justify"><h5><b><script>document.write(MultiArray["Agent adherence"][lang])</script>
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
        <script>document.write(MultiArray["Report"][lang])</script> </b></h5><br><br><b><script>document.write(MultiArray["Period"][lang])</script> : <script>document.write(MultiArray["From"][lang])</script> 
        <%
		if (reportType.compareTo("Daily") ==0){
			out.write(startingDateDaily);
		} else if (reportType.compareTo("Monthly") ==0){
			out.write(starting_month_monthly+"/"+starting_year_monthly);
		} else if (reportType.compareTo("Yearly") ==0){
			out.write(starting_year_yearly);
		}
		%>
        <script>document.write(MultiArray["To"][lang])</script>
        <%
		if (reportType.compareTo("Daily") ==0){
			out.write(endingDateDaily);
		} else if (reportType.compareTo("Monthly") ==0){
			out.write(ending_month_monthly+"/"+ending_year_monthly);
		} else if (reportType.compareTo("Yearly") ==0){
			out.write(ending_year_yearly);
		}
		%>
        </b></div></td>
  </tr>
</table>
</p>

<%
    int numObjects = 0;//tok.countTokens();
   // for( int k = 0; k < numObjects; k++ ) {
        String agentId = agents;
        System.out.println("<script language='javascript'>document.write(MultiArray[\"Agent ID\"][lang]);</script> : " + agentId);
		if(agents.compareTo("AllAgents")!= 0)
		{
			// build stats for this agent
			System.out.println("<script language='javascript'>document.write(MultiArray[\"Agent\"][lang]);</script> : " + agentId);
		 	beanAgent.getAdherence(agentId,startingDate,endingDate,reportType);
		}
		else
		{
			System.out.println("<script language='javascript'>document.write(MultiArray[\"Agent group\"][lang]);</script> : " + agtGroup);
		 	beanAgent.getAdherenceForGroup(agtGroup,startingDate,endingDate,reportType);			
			if(startingDate.compareTo(endingDate)==0 && reportType.compareTo("Daily")==0)
			{
				beanAgent.sortData(orderBy);
			}
			
		}        
		
%>
<p><font color="#FF6600"><b>
<%
	if(agents.compareTo("AllAgents")== 0){
		if(agtGroup.length()> 9 && agtGroup.substring(0,9).compareTo("AllGroups") == 0)
			out.write("<script language='javascript'>document.write(MultiArray[\"Group\"][lang]);</script> [ <script language='javascript'>document.write(MultiArray[\"All groups\"][lang]);</script> ]");
		else
			out.write("<script language='javascript'>document.write(MultiArray[\"Group\"][lang]);</script> ["+agtGroup+"]");
	}
	else
		out.write(beanAgent.getAgentFullName(agentId)+"["+agentId+"]");
%> 
</b></font></p>
<!--Adherence Data:-->
<table border="1" cellpadding="0" cellspacing="0"  style="border-collapse: collapse" bordercolor="#111111"  id="AutoNumber1">
  <tr class="reportsTab" align="center">
    <td   height=30><b> <% if(startingDate.compareTo(endingDate)==0 && reportType.compareTo("Daily")==0)  
								out.write("<script language='javascript'>document.write(MultiArray[\"Agent\"][lang]);</script>");
						 	else 
								out.write("<script language='javascript'>document.write(MultiArray[\"Agent group\"][lang]);</script>");
						%> </b></td>
    <% if(startingDate.compareTo(endingDate)==0 && reportType.compareTo("Daily")==0 && agents.compareTo("AllAgents")!= 0 )
			out.write("<td width=\"120\"  align=\"center\"><b> <script language='javascript'>document.write(MultiArray[\"Time period\"][lang]);</script></b> </td>");
	   else  {
			out.write("<td width=\"120\"  align=\"center\"><b> <script language='javascript'>document.write(MultiArray[\"Date\"][lang]);</script> </b></td>");	
		}
	%> 
    <td width="120"  align="center"><b> <script>document.write(MultiArray["Adherence"][lang])</script> (%)</b></td>
  </tr>
<!-- traverse the array -->
<%  int i=0 ;
    for (i = 0; i < beanAgent.m_schedDailyAdherence.size(); i++) {
         r1 = (beanAdherenceDetails)beanAgent.m_schedDailyAdherence.elementAt(i);
		 //tot_period += r1.num_period;
		 tot_num_adh += r1.adherence_per_cent;
		 if(firstStartTime.length() < 2)
		    firstStartTime = r1.startTime;		 
		 lastEndTime = r1.endTime;
%>
<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");%> >
    <td   align="left" nowrap><%if (startingDate.compareTo(endingDate)==0 && reportType.compareTo("Daily")==0)
										out.write(r1.agent_id+" ["+ r1.name+"]");%></td>  			
    <td width="120"  align="center"><% if (startingDate.compareTo(endingDate) == 0 && reportType.compareTo("Daily") ==0 && agents.compareTo("AllAgents")== 0)
											 out.write(r1.dayInMonth+"/"+r1.month);
									   else  if( reportType.compareTo("Daily") == 0 ||  (reportType.compareTo("Monthly") ==0 && startingDate.compareTo(endingDate) == 0 ))
									   		out.write (r1.dayInMonth+"/"+r1.month);	
									   else if(	reportType.compareTo("Monthly") == 0 || (reportType.compareTo("Yearly") ==0 && startingDate.compareTo(endingDate) == 0 ))
											out.write (r1.month+"/"+r1.year);	
									   else if(	reportType.compareTo("Yearly") ==0 )
											out.write (r1.year);											
									 %></td>
	<%//if (startingDate.compareTo(endingDate) == 0 && agents.compareTo("AllAgents")!= 0 && reportType.compareTo("Daily") ==0)
	//		out.write("<td width=\"120\"  align=\"center\">"+r1.endTime+"</td>");
	%>
    <td  width="120" align="center"><% tmp = r1.formatDecimalDouble(100*(r1.adherence_per_cent),2);
									out.write(tmp);
								%></td>
  </tr>
<!-- end of array traversal-->
<%
    }
    if(i > 0)
		adherence = 100*(tot_num_adh/i);
	else
		adherence = 0.00;
	tmp = Double.toString(adherence);
 	index = tmp.indexOf(".");
	if(index >0 && tmp.substring(index).length() > 2)
		tmp = tmp.substring(0,index) + tmp.substring(index,index+3);
	else
		tmp = tmp + "0";										 
%>
 <tr>
     <td  bgcolor="#FDFDE0" align="center"><font  color="#000000"><b><%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>
     <td width="120" bgcolor="#FDFDE0" align="center"><font  color="#000000"><b><%//out.write(startingDate);%></b></font></td>
     	
     <%//if (startingDate.compareTo(endingDate) != 0 )
		//out.write("<td width=\"120\" bgcolor=\"#FDFDE0\" align=\"center\"><font color=\"#000000\"><b>"+endingDate+"</b></font></td>");%>
     <td width="120" bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%out.write(tmp);%></b></font></td>
  </tr>

</table>
<%if(numObjects > 1) {%>
  <hr class="reportsID" align="left" width="500">
<%}
//} end of for token %>

</body>

</html>

