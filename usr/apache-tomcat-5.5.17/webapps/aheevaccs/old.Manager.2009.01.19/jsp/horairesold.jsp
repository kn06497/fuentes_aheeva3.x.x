<html>

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="Manager.wfm_schedule.*"%>

<head>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<style type="text/css">

.dynamic-tab-pane-control .tab-page {
	height:		auto;
	/*width:      550px;*/
}

html, body {
	background:	ThreeDFace;
}

form {
	margin:		0;
	padding:	0;
}

/* over ride styles from webfxlayout */

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
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<jsp:useBean id="sc" scope="request" class="Manager.wfm_schedule.beanSchedule"/>


</head>

<body>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript"  src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/Browser.js"></script>
<%
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String startingDate="", endingDate="";
    String sRet="",ssRet="";
    int i,j,k,l;
    long tLoginTime,next_day_off=0,regular_shift=0;
    String agents = "",myagt="";
    String nextDayOff="";

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

//get the global parameters

try{
    sc.getGlobalParams();
    } catch(Exception e){
    }
   for (int b = 0; b < sc.m_globalParams.size(); b++) {
      parameter prm = (parameter)sc.m_globalParams.elementAt(b);
      if (prm.m_param_name.equalsIgnoreCase("regular_shift")){
         regular_shift = Long.parseLong(prm.m_param_value);
      }
      if (prm.m_param_name.equalsIgnoreCase("next_day_off")){
          next_day_off = Long.parseLong(prm.m_param_value);
      }
   }

 %>

<br><br>
<form   method="post" action='/aheevaccs/servlet/PublishServlet?start_date=<%=startingDateDaily%>&end_date=<%=endingDateDaily%>&group_dbid=<%=agentGroup%>' >

<div class="tab-pane" id="tabPane1" >
 <script type="text/javascript">
  tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
 </script>


 <div class="tab-page" id="tabPage1"  align="center">
  <h2 class="tab">Shifts</h2>
   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );
   </script>
  <fieldset>

<table width="100%" cellpadding="0" cellspacing="0" align="center">
 <tr>
  <td width="100%" align="center">
   <table  border="0" align="center">
    <tr>
     <td class="reportsID"><b>
        Available Shifts from:
        <%out.write(startingDateDaily);	%>
        to
        <%out.write(endingDateDaily);	%>
        </b>
     </td>
    </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td>
   <br><br>
  </td>
 </tr>

   <%  try{

//Temporary patch to allow us to add schedules to the saint john's agents
if (agentGroup.equalsIgnoreCase("79") ){
       sRet=sc.buildScheduleForPeriod(startingDateDaily,endingDateDaily,"34","");
}else{
       sRet=sc.buildScheduleForPeriod(startingDateDaily,endingDateDaily,agentGroup,"");
}
       } catch(Exception e){
    }
 %>

<tr>
 <td align="center">
  <table align="center" border='1'> <!--Tableau de schedule-->
   <tr  bgcolor='0099FF'>
    <td align="center"> Shift </td>
    <td width="70"  align="center">Sunday </td>
    <td width="70"  align="center">Monday </td>
    <td width="70"  align="center">Tuesday </td>
    <td width="70"  align="center">Wednesday </td>
    <td width="70"  align="center">Thursday </td>
    <td width="70"  align="center">Friday </td>
    <td width="70"  align="center">Saturday </td>
   </tr>
   <%
   long tot_sun=0,tot_mon=0,tot_tue=0,tot_wed=0,tot_thu=0,tot_fri=0,tot_sat=0;
	if(sRet=="success") {
              for (i = 0; i < sc.m_vAllShifts.size(); i++) {
              ScheduleInfo sch = (ScheduleInfo)sc.m_vAllShifts.elementAt(i);
              tot_sun+=sch.sunday;
              tot_mon+=sch.monday;
              tot_tue+=sch.tuesday;
              tot_wed+=sch.wednesday;
              tot_thu+=sch.thursday;
              tot_fri+=sch.friday;
              tot_sat+=sch.saturday ;%>

<%if (i%2==0){%>
<tr bgcolor='#e6eff4'>
<%}else{%>
<tr bgcolor='#b4cfff'>
<%}%>

     <%if (sch.duration < regular_shift) {%>
          <td width="80"   align="center" bgcolor='#FFC0CB'>
     <%}else if (sch.duration > regular_shift) {%>
         <td width="80"   align="center"  bgcolor='#DDA0DD'>
      <%}else{%>
          <td width="80"   align="center" >
      <%}%>
         <%out.write(sch.shift);%>
      </td>
      <td width="80"   align="center"> <%out.write(Long.toString(sch.sunday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(sch.monday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(sch.tuesday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(sch.wednesday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(sch.thursday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(sch.friday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(sch.saturday));%>  </td>
     </tr>
      <%} // fin for
    }else {
        System.out.println("NO sucess");
 }//fin if sucess  %>
   <tr bgcolor='0099FF'>
    <td><b>Total/Day</b></td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_sun));%></b> </td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_mon));%></b> </td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_tue));%> </b></td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_wed));%></b> </td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_thu));%></b> </td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_fri));%> </b></td>
    <td width="80" align="center"><b><%out.write(Long.toString(tot_sat));%> </b> </td>
   </tr>

   </table>
  </td>
 </tr>
 <tr>
  <td>
  &nbsp;<br>
  </td>
 </tr>
 <tr>
  <td align="center">
   <table>
    <tr>
     <td  style="background-color:pink" width="40"></td><td>&nbsp;</td><td>part-time shift
    </td>
    </tr>
    <tr>
     <td  style="background-color:plum" width="40"></td><td>&nbsp;</td><td>split shift
    </td>
    </tr>
   </table>
  </td>
 </tr>

<tr>
  <td>
  &nbsp;<br>
  </td>
 </tr>
</table>
</fieldset>
</div>


<div class="tab-page" id="tabPage2"  align="center">
  <h2 class="tab">AGroup view</h2>
   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );
   </script>
  <fieldset>

<table width="100%" cellpadding="0" cellspacing="0" align="center">
 <tr>
  <td align="center">
   <table width="100%"  border="0" align="center">
    <tr>
     <td width="100%" class="reportsID" align="center"><b>
        Agent Group:   <%out.write(agentGroupName);%>  </b>
     </td>
    </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td>
   <br><br>
  </td>
 </tr>
<%
try{
    sc.buildAgentList(agentGroup);
}catch(Exception e){
}

%>

  <tr>
   <td align="center">
    <table border="1" align="center">
     <tr bgcolor='#b4cfff'>
      <td>Name</td>
      <td>Sunday </td>
      <td>Monday </td>
      <td>Tuesday </td>
      <td>Wednesday </td>
      <td>Thursday </td>
      <td>Friday </td>
      <td>Saturday </td>
      <td>Total hours</td>
      <td>Day off</td>
     </tr>
  <%
//get the connection
try{
   sc.getConnection();
}catch(Exception e){
}
for (i = 0; i < sc.m_vAllAgents.size(); i++) {
   beanAgentLoginInfo agent = (beanAgentLoginInfo)sc.m_vAllAgents.elementAt(i); %>


<%if (i%2==0){%>
<tr bgcolor='#e6eff4'>
<%}else{%>
<tr bgcolor='#b4cfff'>
<%}%>

<%
String test="",testP="";
try{
   testP = sc.getdAgentSchedule2(agent.agt_id,startingDateDaily,endingDateDaily);//is there a published schedule?
   test  = sc.buildAgentSchedule2(agent.agt_id,startingDateDaily,endingDateDaily,agentGroup);
}catch(Exception e){
}

if(test=="success") {
     ScheduleInfo agentSht = (ScheduleInfo)sc.m_vAllAgentShifts.elementAt(0);
     ScheduleInfo agentShtP = (ScheduleInfo)sc.m_vAllAgentPublishedShifts.elementAt(0);

// we should use our variable next_day_off to know how many days an agent can work in a row

if (agentSht.lastDayOff.equalsIgnoreCase("Saturday")){
nextDayOff ="OK";
}else if (agentSht.lastDayOff.equalsIgnoreCase("Friday")){
nextDayOff ="Thursday";
}else if (agentSht.lastDayOff.equalsIgnoreCase("Thursday")){
nextDayOff ="Wednesday";
}else if (agentSht.lastDayOff.equalsIgnoreCase("Wednesday")){
nextDayOff ="Tuesday";
}else if (agentSht.lastDayOff.equalsIgnoreCase("Tuesday")){
nextDayOff ="Monday";
}else if (agentSht.lastDayOff.equalsIgnoreCase("Monday")){
nextDayOff ="Sunday";
}else{
nextDayOff ="";
}

%>
  <td>
      <% String name=agent.first_name+" "+agent.last_name;
      out.write("<a href='/aheevaccs/Manager/jsp/addHoraires.jsp?nextDayOff="+nextDayOff+"&name="+name+"&login_id="+agent.agt_login_id+"&agentGroupName="+agentGroupName+"&group="+agentGroup+"&agentId="+agent.agt_id + "&startDate="+startingDateDaily + "&endDate="+endingDateDaily + "&mon="+agentSht.mon + "&tues="+agentSht.tues + "&wednes="+agentSht.wednes +"&thurs="+agentSht.thurs + "&fri="+agentSht.fri +"&satur="+agentSht.satur + "&sun="+agentSht.sun +"'>"); %>
      <%out.write(agent.last_name);%>,<%out.write(agent.first_name);%>&nbsp; [<%out.write(agent.agt_login_id);%>]
      </a>
   </td>

<%if (agentShtP.sun.length()>0) {%>
 <td style="background-color:#BCBCDE"><% out.write(agentShtP.sun ); %></td>
<%}else{%>
      <td><% out.write(agentSht.sun ); %></td>
<%}%>

<%if (agentShtP.mon.length()>0) {%>
      <td style="background-color:#BCBCDE"><% out.write(agentShtP.mon ); %></td>
<%}else{%>
      <td><% out.write(agentSht.mon ); %></td>
<%}%>

<%if (agentShtP.tues.length()>0) {%>
      <td style="background-color:#BCBCDE"><% out.write(agentShtP.tues); %></td>
<%}else{%>
      <td><% out.write(agentSht.tues); %></td>
<%}%>

<%if (agentShtP.wednes.length()>0) {%>
      <td style="background-color:#BCBCDE"><%out.write(agentShtP.wednes); %></td>
<%}else{%>
      <td><%out.write(agentSht.wednes); %></td>
<%}%>

<%if (agentShtP.thurs.length()>0) {%>
      <td style="background-color:#BCBCDE"><% out.write(agentShtP.thurs); %></td>
<%}else{%>
      <td><% out.write(agentSht.thurs); %></td>
<%}%>

<%if (agentShtP.fri.length()>0) {%>
      <td style="background-color:#BCBCDE"><% out.write(agentShtP.fri); %></td>
<%}else{%>
      <td><% out.write(agentSht.fri); %> </td>
<%}%>

<%if (agentShtP.satur.length()>0) {%>
      <td style="background-color:#BCBCDE"><% out.write(agentShtP.satur); %></td>
<%}else{%>
      <td><% out.write(agentSht.satur); %></td>
<%}%>

<%if (agentShtP.satur.length()>0 || agentShtP.fri.length()>0 || agentShtP.thurs.length()>0 || agentShtP.wednes.length()>0 || agentShtP.tues.length()>0 || agentShtP.mon.length()>0 || agentShtP.sun.length()>0) {%>
<td><%out.write(agentShtP.getTotal());%></td>
<%}else{%>
<td><%out.write(agentSht.getTotal());%></td>
<%}%>
<td>

<%

out.write(nextDayOff);

%></td>

<%}else{%>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
<%}%>

    </tr>
 <%} // fin for
//close the connection
try{
   sc.closeConnection();
}catch(Exception e){
}

 %>
</table>

  </td>
 </tr>
 <tr>
  <td align="center">&nbsp;<br>
  </td>
 </tr>
 <tr>
  <td align="center">
   <input type="submit" value="Publish" >
  </td>
 </tr>
</table>


</fieldset>
</div>


<div class="tab-page" id="tabPage3"  align="center">
  <h2 class="tab">Teams view</h2>
   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) );
   </script>
  <fieldset>

<%
    try{
       sc.getTeams(agentGroup);
    }   catch(Exception e){
        }
 %>

<% for (i = 0; i < sc.m_vAllTeams.size(); i++) {
       team team = (team)sc.m_vAllTeams.elementAt(i); %>
<table>
 <tr>
  <td width="100%" class="reportsID" align="center"><b>
      Shcedule for team : <%out.write(team.m_team_name);%></b>
  </td>
 </tr>
</table>
      <% try{
            sc.buildTeamAgentList(team.m_dbid);
         }catch(Exception e){
              }
      %>
     <br>
     <table>
      <tr bgcolor='#b4cfff'>
       <td>Name</td>
       <td>Sunday </td>
       <td>Monday </td>
       <td>Tuesday </td>
       <td>Wednesday </td>
       <td>Thursday </td>
       <td>Friday </td>
       <td>Saturday </td>
       <td>Total hours</td>
      </tr>
      <%
      //get a connection from the pool
      try{
          sc.getConnection();
      }catch(Exception e){
      }
      for (l = 0; l < sc.m_vAllTeamAgents.size(); l++) {
      beanAgentLoginInfo agentT = (beanAgentLoginInfo)sc.m_vAllTeamAgents.elementAt(l); %>
      <%if (l%2==0){%>
      <tr bgcolor='#e6eff4'>
      <%}else{%>
      <tr bgcolor='#b4cfff'>
      <%}%>

<%
String testT="",testTP="";
try{
   testTP = sc.getdAgentSchedule2(agentT.agt_id,startingDateDaily,endingDateDaily);//is there a published schedule?
   testT  = sc.buildAgentSchedule2(agentT.agt_id,startingDateDaily,endingDateDaily,agentGroup);
}catch(Exception e){
}

if(testT=="success") {
     ScheduleInfo agentShtT = (ScheduleInfo)sc.m_vAllAgentShifts.elementAt(0);
     ScheduleInfo agentShtTP = (ScheduleInfo)sc.m_vAllAgentPublishedShifts.elementAt(0);

%>
      <td>
       <% String agt_name=agentT.first_name+" "+agentT.last_name;
       out.write("<a href='/aheevaccs/Manager/jsp/addHoraires.jsp?name="+agt_name+"&login_id="+agentT.agt_login_id+"&agentGroupName="+agentGroupName+"&group="+agentGroup+"&agentId="+agentT.agt_id + "&startDate="+startingDateDaily + "&endDate="+endingDateDaily + "&mon="+agentShtT.mon + "&tues="+agentShtT.tues + "&wednes="+agentShtT.wednes +"&thurs="+agentShtT.thurs + "&fri="+agentShtT.fri +"&satur="+agentShtT.satur + "&sun="+agentShtT.sun +"'>"); %>
       <%out.write(agentT.last_name);%>,<%out.write(agentT.first_name);%>&nbsp; [<%out.write(agentT.agt_login_id);%>]</a>
      </td>

       <%if (agentShtTP.sun.length()>0) {%>
 <td style="background-color:#BCBCDE">assigned</td>
<%}else{%>
      <td><% out.write(agentShtT.sun ); %></td>
<%}%>

<%if (agentShtTP.mon.length()>0) {%>
      <td style="background-color:#BCBCDE">assigned</td>
<%}else{%>
      <td><% out.write(agentShtT.mon ); %></td>
<%}%>

<%if (agentShtTP.tues.length()>0) {%>
      <td style="background-color:#BCBCDE">assigned</td>
<%}else{%>
      <td><% out.write(agentShtT.tues); %></td>
<%}%>

<%if (agentShtTP.wednes.length()>0) {%>
      <td style="background-color:#BCBCDE">assigned</td>
<%}else{%>
      <td><%out.write(agentShtT.wednes); %></td>
<%}%>

<%if (agentShtTP.thurs.length()>0) {%>
      <td style="background-color:#BCBCDE">assigned</td>
<%}else{%>
      <td><% out.write(agentShtT.thurs); %></td>
<%}%>

<%if (agentShtTP.fri.length()>0) {%>
      <td style="background-color:#BCBCDE">assigned</td>
<%}else{%>
      <td><% out.write(agentShtT.fri); %> </td>
<%}%>

<%if (agentShtTP.satur.length()>0) {%>
      <td style="background-color:#BCBCDE">assigned</td>
<%}else{%>
      <td><% out.write(agentShtT.satur); %></td>
<%}%>
<%if (agentShtTP.satur.length()>0 || agentShtTP.fri.length()>0 || agentShtTP.thurs.length()>0 || agentShtTP.wednes.length()>0 || agentShtTP.tues.length()>0 || agentShtTP.mon.length()>0 || agentShtTP.sun.length()>0) {%>
<td><%out.write(agentShtTP.getTotal());%></td>
<%}else{%>
<td><%out.write(agentShtT.getTotal());%></td>
<%}%>

<%}else{%>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
<%}%>
</tr>
<%}//fin for all agents of that team

   try{
          sc.closeConnection();
      }catch(Exception e){
      }
%>
    </table>
<br><br>


<%}//fin for all teams%>

</fieldset>
</div>


<div class="tab-page" id="tabPage4"  align="center">
  <h2 class="tab">Assigned shifts</h2>
   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage4" ) );
   </script>
  <fieldset>

<table width="100%" cellpadding="0" cellspacing="0" align="center">
 <tr>
  <td width="100%" align="center">
   <table  border="0" align="center">
    <tr>
     <td class="reportsID"><b>
        Assigned Shifts from:
        <%out.write(startingDateDaily);	%>
        to
        <%out.write(endingDateDaily); %>
        </b>
     </td>
    </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td>
   <br><br>
  </td>
 </tr>

   <%  try{
           ssRet=sc.buildAssignedScheduleForPeriod(startingDateDaily,endingDateDaily,agentGroup);
       } catch(Exception e){
    } %>

<tr>
 <td align="center">
  <table align="center" border='1'> <!--Tableau de schedule-->
   <tr  bgcolor='0099FF'>
    <td align="center"> Shift </td>
    <td width="70"  align="center">Sunday </td>
    <td width="70"  align="center">Monday </td>
    <td width="70"  align="center">Tuesday </td>
    <td width="70"  align="center">Wednesday </td>
    <td width="70"  align="center">Thursday </td>
    <td width="70"  align="center">Friday </td>
    <td width="70"  align="center">Saturday </td>
   </tr>
   <%
    tot_sun=0;tot_mon=0;tot_tue=0;tot_wed=0;tot_thu=0;tot_fri=0;tot_sat=0;
	if(ssRet=="success") {
              for (int a = 0; a < sc.m_vAllAssignedShifts.size(); a++) {
              ScheduleInfo asch = (ScheduleInfo)sc.m_vAllAssignedShifts.elementAt(a);
              tot_sun+=asch.sunday;
              tot_mon+=asch.monday;
              tot_tue+=asch.tuesday;
              tot_wed+=asch.wednesday;
              tot_thu+=asch.thursday;
              tot_fri+=asch.friday;
              tot_sat+=asch.saturday ;%>

<%if (i%2==0){%>
<tr bgcolor='#e6eff4'>
<%}else{%>
<tr bgcolor='#b4cfff'>
<%}%>

     <%if (asch.duration < regular_shift) {%>
          <td width="80"   align="center" bgcolor='#FFC0CB'>
     <%}else if (asch.duration > regular_shift) {%>
         <td width="80"   align="center"  bgcolor='#DDA0DD'>
      <%}else{%>
          <td width="80"   align="center" >
      <%}%>
         <%out.write(asch.shift);%>
      </td>
      <td width="80"   align="center"> <%out.write(Long.toString(asch.sunday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(asch.monday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(asch.tuesday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(asch.wednesday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(asch.thursday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(asch.friday));%>  </td>
      <td width="80"   align="center"> <%out.write(Long.toString(asch.saturday));%>  </td>
     </tr>
      <%} // fin for
    }else {
        System.out.println("NO sucess");
 }//fin if sucess  %>
   <tr bgcolor='0099FF'>
    <td><b>Total/Day</b></td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_sun));%></b> </td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_mon));%></b> </td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_tue));%> </b></td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_wed));%></b> </td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_thu));%></b> </td>
    <td width="80" align="center"><b> <%out.write(Long.toString(tot_fri));%> </b></td>
    <td width="80" align="center"><b><%out.write(Long.toString(tot_sat));%> </b> </td>
   </tr>

   </table>
  </td>
 </tr>
 <tr>
  <td>
  &nbsp;<br>
  </td>
 </tr>
 <tr>
  <td align="center">
   <table>
    <tr>
     <td  style="background-color:pink" width="40"></td><td>&nbsp;</td><td>part-time shift
    </td>
    </tr>
    <tr>
     <td  style="background-color:plum" width="40"></td><td>&nbsp;</td><td>split shift
    </td>
    </tr>
   </table>
  </td>
 </tr>

<tr>
  <td>
  &nbsp;<br>
  </td>
 </tr>
</table>
</fieldset>
</div>





</div>
<script type="text/javascript">
	setupAllTabs();
</script>
</form>
</body>

</html>

