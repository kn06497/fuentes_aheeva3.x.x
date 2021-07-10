<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.wfm_schedule.*"%>

<head>
<title>AheevaCCS - Sheduled Agent's Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		auto;
}
html, body { 
	background:	#E1F4FF;
}
form {
	margin:		40px;
	padding:	0;
}
body {
	margin:		10px;
	width:		auto;
	height:		auto;
}
.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}
.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
}
.dynamic-tab-pane-control a:hover {
	background: transparent;
}
.imgControl {
	top: 1;
	position:		relative;	
}
</style>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<jsp:useBean id="rp" scope="request" class="aheevaManager.wfm_schedule.beanWeekReport"/>
</head>
<body>
<%
	String language =request.getParameter("lang");
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
	
    String sRet= "", startDate ="", endDate ="";
    int i,j,k;
	String[] tabObj =null;
	
	startDate = startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5) + " 00:00:00" ;
	endDate = endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5) + " 23:59:59" ;

    String agentGroups  = request.getParameter("group");
    StringTokenizer tok = null, tokGrp=null,  tokn = null;
    String agentGroupName ="", agentGroup ="";

    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    int numCampaigns = tok.countTokens();
	tabObj =new String[numCampaigns];
    for( k = 0; k <numCampaigns; k++ ) {
        String agentGroupTemp = tok.nextToken();
        tokGrp = new java.util.StringTokenizer(agentGroupTemp,",");
        agentGroupName =tokGrp.nextToken();
        agentGroup = tokGrp.nextToken();
    }	

	
	//System.out.println("fin for tabObj ");
%>
<div class="tab-pane" id="tabPane1">	
<form>
	<div class="tab-page" id="tabPage1">
	<fieldset>
<%
	System.out.println("Agent Login report for group: " + agentGroup);
    sRet = 	rp.buildSheduledReportForPeriod(agentGroup,startDate,endDate);
	if(sRet == "success")
	{
		System.out.println("sRet == success");
		%>
			<table  border="0" align="center">
			<tr height="20"></tr>
				<tr>
				<td width="100%" class="reportsID" align="center"><b>
					<b><script>document.write(MultiArray["Agent group"][lang])</script></b>:   <%out.write(rp.getGroupName(agentGroup));%>  </b>
				 </td>
				</tr>
				<tr>
				 <td class="reportsID"><b>
					 <b><script>document.write(MultiArray["Scheduled"][lang])</script> <script>document.write(MultiArray["agents"][lang])</script> <script>document.write(MultiArray["From"][lang])</script>:
					<%out.write(startingDateDaily);	%>
				   <script>document.write(MultiArray["To"][lang])</script>
					<%out.write(endingDateDaily);	%>
					</b>
				 </td>
				</tr>
			
			   </table>
			<br><br>
			<table border=0 align="center">
			<tr bgcolor="#D9ECEC">
			<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>
			<td bgcolor='#ffffff'>&nbsp;</td>
			<td colspan="2" width="80" align="center"><script>document.write(MultiArray["Sunday"][lang])</script></td>
			<td colspan="2" width="80" align="center"><script>document.write(MultiArray["Monday"][lang])</script></td>
			<td colspan="2" width="80" align="center"><script>document.write(MultiArray["Tuesday"][lang])</script></td>
			<td colspan="2" width="80" align="center"><script>document.write(MultiArray["Wednesday"][lang])</script></td>
			<td colspan="2" width="80" align="center"><script>document.write(MultiArray["Thursday"][lang])</script></td>
			<td colspan="2" width="80" align="center"><script>document.write(MultiArray["Friday"][lang])</script></td>
			<td colspan="2" width="80" align="center"><script>document.write(MultiArray["Saturday"][lang])</script></td>
			</tr>
			<tr>
			<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>
			<td></td>
			<td width="40" align="center"><script>document.write(MultiArray["Log in"][lang])</script></td><td width="40" align="center"><script>document.write(MultiArray["Sched"][lang])</script></td>
			<td width="40" align="center"><script>document.write(MultiArray["Log in"][lang])</script></td><td width="40" align="center"><script>document.write(MultiArray["Sched"][lang])</script></td>
			<td width="40" align="center"><script>document.write(MultiArray["Log in"][lang])</script></td><td width="40" align="center"><script>document.write(MultiArray["Sched"][lang])</script></td>
			<td width="40" align="center"><script>document.write(MultiArray["Log in"][lang])</script></td><td width="40" align="center"><script>document.write(MultiArray["Sched"][lang])</script></td>
			<td width="40" align="center"><script>document.write(MultiArray["Log in"][lang])</script></td><td width="40" align="center"><script>document.write(MultiArray["Sched"][lang])</script></td>
			<td width="40" align="center"><script>document.write(MultiArray["Log in"][lang])</script></td><td width="40" align="center"><script>document.write(MultiArray["Sched"][lang])</script></td>
			<td width="40" align="center"><script>document.write(MultiArray["Log in"][lang])</script></td><td width="40" align="center"><script>document.write(MultiArray["Sched"][lang])</script></td>
			</tr>
			<%
			String key="";
			beanWeekInfos r1 =null;
			for( i =0; i < rp.keys.size() ; i++ )
			{
				key ="";
				key = (String)rp.keys.elementAt(i);
				r1 =(beanWeekInfos)rp.key_vector.get(key);
				if(r1 !=null)
				{
					%>
					<tr <% if(i%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");%> >
					<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>
					<td align="center"><%out.write(r1.key);%></td>
					<td align="center" bgcolor="#FFECEC"><%out.write(r1.formatDecimalDouble(((double)r1.nb_sunday_login/900.0) ,2));%></td>
					<td align="center" bgcolor="#E7CFCF"><%out.write(Long.toString(r1.nb_sunday_shed));%></td>
					<td align="center" bgcolor="#FFECEC"><%out.write(r1.formatDecimalDouble(((double)r1.nb_monday_login/900.0) ,2));%></td>
					<td align="center" bgcolor="#E7CFCF"><%out.write(Long.toString(r1.nb_monday_shed));%></td>
					<td align="center" bgcolor="#FFECEC"><%out.write(r1.formatDecimalDouble(((double)r1.nb_tuesday_login/900.0) ,2));%></td>
					<td align="center" bgcolor="#E7CFCF"><%out.write(Long.toString(r1.nb_tuesday_shed));%></td>
					<td align="center" bgcolor="#FFECEC"><%out.write(r1.formatDecimalDouble(((double)r1.nb_wednesday_login/900.0) ,2));%></td>
					<td align="center" bgcolor="#E7CFCF"><%out.write(Long.toString(r1.nb_wednesday_shed));%></td>
					<td align="center" bgcolor="#FFECEC"><%out.write(r1.formatDecimalDouble(((double)r1.nb_thursday_login/900.0) ,2));%></td>
					<td align="center" bgcolor="#E7CFCF"><%out.write(Long.toString(r1.nb_thursday_shed));%></td>
					<td align="center" bgcolor="#FFECEC"><%out.write(r1.formatDecimalDouble(((double)r1.nb_friday_login/900.0) ,2));%></td>
					<td align="center" bgcolor="#E7CFCF"><%out.write(Long.toString(r1.nb_friday_shed));%></td>
					<td align="center" bgcolor="#FFECEC"><%out.write(r1.formatDecimalDouble(((double)r1.nb_saturday_login/900.0) ,2));%></td>
					<td align="center" bgcolor="#E7CFCF"><%out.write(Long.toString(r1.nb_saturday_shed));%></td>
					</tr>
					<%
				}
				else
				{
					System.out.println("\n In JSP Not found in vector Key: " +key);
				}
				
			
			}
			%>
			<tr  bgcolor='#ffffff' height="10" ><td colspan="17">&nbsp;</td></tr>
			<%
			r1 =null;
			r1 =(beanWeekInfos)rp.m_vScheduledHours.elementAt(0);
			if(r1 !=null)
			{
			%>
				<tr >
				<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>
				<td bgcolor='#E4E4E4' align="center"><b><script>document.write(MultiArray["Scheduled Hours"][lang])</script><%//out.write("Scheduled Hours***");%></b></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_sunday));%></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_monday));%></td>
				<td  bgcolor='#E4E4E4' colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_tuesday));%></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_wednesday));%></td>
				<td  bgcolor='#E4E4E4' colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_thursday));%></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_friday));%></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_saturday));%></td>
				</tr>
			<%
			}
			r1 =null;
			r1 =(beanWeekInfos)rp.m_vScheduledHours.elementAt(1);
			if(r1 !=null)
			{
			%>
				<tr  bgcolor="#FF91C8">
				<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>
				<td bgcolor='#E4E4E4' align="center"><b><script>document.write(MultiArray["Real hours (without breaks)"][lang])</script><%//out.write("Real hours (without breaks)");%></b></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_sunday));%></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_monday));%></td>
				<td  bgcolor='#E4E4E4' colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_tuesday));%></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_wednesday));%></td>
				<td  bgcolor='#E4E4E4' colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_thursday));%></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_friday));%></td>
				<td  bgcolor='#E4E4E4'  colspan="2" align="center"><%out.write(Long.toString(r1.tot_time_saturday));%></td>
				</tr>
			<%	
			}
			%>		
		
			</table>
		<%
	}
	else
		System.out.println("sRet no success");

%>	
		</fieldset>	
	</div>
</form>
</div>
</body>
</html>

