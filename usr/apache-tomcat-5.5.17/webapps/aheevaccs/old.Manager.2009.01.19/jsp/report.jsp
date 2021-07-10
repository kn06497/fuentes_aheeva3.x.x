<html>
<head>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="Manager.wfm_schedule.*"%>
<jsp:useBean id="rp" scope="request" class="Manager.wfm_schedule.beanReport"/>

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>

</head>
<body>

<%
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String sRet= "",testP = "";
    int i,j,k;


    String agentGroups  = request.getParameter("group");
    StringTokenizer tok = null, tokGrp=null,  tokn = null;
    String agentGroupName ="", agentGroup ="", aPeriod="";

    if(agentGroups != null){
        tok = new java.util.StringTokenizer(agentGroups,"/");
    }else{
        tok = new java.util.StringTokenizer("","/");
    }

    int numCampaigns = tok.countTokens();
    for( k = 0; k <numCampaigns; k++ ) {
        String agentGroupTemp = tok.nextToken();
        tokGrp = new java.util.StringTokenizer(agentGroupTemp,",");
        agentGroupName =tokGrp.nextToken();
        agentGroup = tokGrp.nextToken();
    }
  %>

<br>
<br>

<form>
<table  border="0" align="center">
    <tr>
    <td width="100%" class="reportsID" align="center"><b>
        <b><script>document.write(MultiArray["Agent group"][lang])</script></b>:   <%out.write(agentGroupName);%>  </b>
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
<table border=0 >
<tr  bgcolor='#b4cfff'>
<td bgcolor='#ffffff'>&nbsp;</td><td bgcolor='#ffffff'>&nbsp;</td>
<td><script>document.write(MultiArray["Hours"][lang])</script></td>
<td><script>document.write(MultiArray["Sunday"][lang])</script></td>
<td><script>document.write(MultiArray["Monday"][lang])</script></td>
<td><script>document.write(MultiArray["Tuesday"][lang])</script></td>
<td><script>document.write(MultiArray["Wednesday"][lang])</script></td>
<td><script>document.write(MultiArray["Thursday"][lang])</script></td>
<td><script>document.write(MultiArray["Friday"][lang])</script></td>
<td><script>document.write(MultiArray["Saturday"][lang])</script></td>
</tr>

<%
String Hour="",finHour="";
ScheduleInfo effectif = new ScheduleInfo();
ScheduleInfo hours = new ScheduleInfo();
ScheduleInfo hoursNoB = new ScheduleInfo();

java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm"); // works for date-format
java.util.Date aHour=null;

for (i=0;i<=15;i++){
//Get info for each 15 min
Hour = String.valueOf(8+i) + ":00";
aHour = sdf.parse(Hour);
aHour.setMinutes(aHour.getMinutes()+15);
finHour = sdf.format(aHour);

 try{
       sRet=rp.getdEffectif(Hour,agentGroup,startingDateDaily,endingDateDaily); // tempo
   }   catch(Exception e){
  }
  effectif = (ScheduleInfo)rp.m_vAllEffectifs.elementAt(0);
%>
<tr bgcolor='#e6eff4'>
<td bgcolor='#ffffff'>&nbsp;</td>
<td bgcolor='#ffffff'>&nbsp;</td>
<td><%out.write(Hour);%>-<%out.write(finHour);%></td>
<td><%out.write( Long.toString(effectif.sunday) );%></td>
<td><%out.write(Long.toString(effectif.monday));%></td>
<td><%out.write(Long.toString(effectif.tuesday));%></td>
<td><%out.write( Long.toString(effectif.wednesday) );%></td>
<td><%out.write( Long.toString(effectif.thursday) );%></td>
<td><%out.write( Long.toString(effectif.friday) );%></td>
<td><%out.write( Long.toString(effectif.saturday) );%></td>
</tr>
<tr  bgcolor='#b4cfff'>
<%
Hour = String.valueOf(8+i) + ":15";
aHour = sdf.parse(Hour);
aHour.setMinutes(aHour.getMinutes()+15);
finHour = sdf.format(aHour);

 try{
       sRet=rp.getdEffectif(Hour,agentGroup,startingDateDaily,endingDateDaily); // tempo
   }   catch(Exception e){
  }
 effectif = (ScheduleInfo)rp.m_vAllEffectifs.elementAt(0);

%>
<td bgcolor='#ffffff'>&nbsp;</td>
<td bgcolor='#ffffff'>&nbsp;</td>
<td><%out.write(Hour);%>-<%out.write(finHour);%></td>
<td><%out.write( Long.toString(effectif.sunday) );%></td>
<td><%out.write(Long.toString(effectif.monday));%></td>
<td><%out.write(Long.toString(effectif.tuesday));%></td>
<td><%out.write( Long.toString(effectif.wednesday) );%></td>
<td><%out.write( Long.toString(effectif.thursday) );%></td>
<td><%out.write( Long.toString(effectif.friday) );%></td>
<td><%out.write( Long.toString(effectif.saturday) );%></td>

</tr>
<tr bgcolor='#e6eff4'>
<%
Hour = String.valueOf(8+i) + ":30";
aHour = sdf.parse(Hour);
aHour.setMinutes(aHour.getMinutes()+15);
finHour = sdf.format(aHour);

 try{
       sRet=rp.getdEffectif(Hour,agentGroup,startingDateDaily,endingDateDaily); // tempo
   }   catch(Exception e){
  }
 effectif = (ScheduleInfo)rp.m_vAllEffectifs.elementAt(0);

%>
<td bgcolor='#ffffff'>&nbsp;</td>
<td bgcolor='#ffffff'>&nbsp;</td>
<td><%out.write(Hour);%>-<%out.write(finHour);%></td>
<td><%out.write( Long.toString(effectif.sunday) );%></td>
<td><%out.write(Long.toString(effectif.monday));%></td>
<td><%out.write(Long.toString(effectif.tuesday));%></td>
<td><%out.write( Long.toString(effectif.wednesday) );%></td>
<td><%out.write( Long.toString(effectif.thursday) );%></td>
<td><%out.write( Long.toString(effectif.friday) );%></td>
<td><%out.write( Long.toString(effectif.saturday) );%></td>
</tr>
<tr  bgcolor='#b4cfff'>
<%
Hour = String.valueOf(8+i) + ":45";
aHour = sdf.parse(Hour);
aHour.setMinutes(aHour.getMinutes()+15);
finHour = sdf.format(aHour);

 try{
       sRet=rp.getdEffectif(Hour,agentGroup,startingDateDaily,endingDateDaily); // tempo
   }   catch(Exception e){
  }
 effectif = (ScheduleInfo)rp.m_vAllEffectifs.elementAt(0);

%>
<td bgcolor='#ffffff'>&nbsp;</td>
<td bgcolor='#ffffff'>&nbsp;</td>
<td><%out.write(Hour);%>-<%out.write(finHour);%></td>
<td><%out.write( Long.toString(effectif.sunday));%></td>
<td><%out.write(Long.toString(effectif.monday));%></td>
<td><%out.write(Long.toString(effectif.tuesday));%></td>
<td><%out.write( Long.toString(effectif.wednesday));%></td>
<td><%out.write( Long.toString(effectif.thursday));%></td>
<td><%out.write( Long.toString(effectif.friday));%></td>
<td><%out.write( Long.toString(effectif.saturday));%></td>
</tr>
<%}//fin for %>

<%
 try{
    rp.getScheduledHoursWithBreaks(agentGroup,startingDateDaily, endingDateDaily);
  } catch(Exception e){
  }
 hours = (ScheduleInfo)rp.m_vScheduledHoursWithBreak.elementAt(0);

%>

<tr>
<td><script>document.write(MultiArray["Scheduled"][lang])</script> <script>document.write(MultiArray["Hours"][lang])</script></td>
<td></td>
<td>&nbsp;</td>
<td><%out.write( Long.toString(hours.sunday) );%></td><td><%out.write(Long.toString(hours.monday));%></td><td><%out.write(Long.toString(hours.tuesday));%></td><td><%out.write( Long.toString(hours.wednesday) );%></td>
<td><%out.write( Long.toString(hours.thursday) );%></td><td><%out.write( Long.toString(hours.friday) );%></td><td><%out.write( Long.toString(hours.saturday) );%></td>
</tr>

<%
 try{
    rp.getScheduledHours(agentGroup,startingDateDaily, endingDateDaily);
  } catch(Exception e){
  }
 hoursNoB = (ScheduleInfo)rp.m_vScheduledHours.elementAt(0);

%>

<tr>
<td><script>document.write(MultiArray["Real hours (without Breaks)"][lang])</script></td>
<td></td>
<td>&nbsp;</td>
<td><%out.write( Long.toString(hoursNoB.sunday) );%></td>
<td><%out.write(Long.toString(hoursNoB.monday));%></td>
<td><%out.write(Long.toString(hoursNoB.tuesday));%></td>
<td><%out.write( Long.toString(hoursNoB.wednesday) );%></td>
<td><%out.write( Long.toString(hoursNoB.thursday) );%></td>
<td><%out.write( Long.toString(hoursNoB.friday) );%></td>
<td><%out.write( Long.toString(hoursNoB.saturday) );%></td>
</tr>



</table>
</form>
</body>

</html>

