<html>

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="aheevaManager.wfm_schedule.*"%>
<%@page import ="java.io.*"%>
<%@page import = "java.io.File" %>
<%@page import = "java.io.RandomAccessFile" %>
<%@page import = "java.io.FileNotFoundException" %>
<%@page import = "java.io.IOException" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pagehorData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pagehorData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pagehorData.openConnection();
%>

<head>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<style type="text/css">

.dynamic-tab-pane-control .tab-page {
	height:		100%;
	/*width:      550px;*/
}

html, body {
	background:	#E1F4FF;
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
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<jsp:useBean id="sc" scope="request" class="aheevaManager.wfm_schedule.beanSchedule"/>
<%//@ page session="false" buffer="400kb" %>


</head>

<body>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="JavaScript"  src="../Resources_pages/jsUtil.js"></script>
<%
    String startingDateDaily = request.getParameter("startingDateDaily");
    String endingDateDaily   = request.getParameter("endingDateDaily");
    String lang = request.getParameter("lang");
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
<form  method="post" action='/aheevaccs/servlet/PublishServlet?start_date=<%=startingDateDaily%>&end_date=<%=endingDateDaily%>&group_dbid=<%=agentGroup%>&lang=<%=lang%>' >
<div class="tab-pane" id="tabPane1" >
 <script type="text/javascript">
  tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
 </script>


 <div class="tab-page" id="tabPage1"  align="center">
  <h2 class="tab"><%= pagehorData.getWord("Shifts")%></h2>
   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );
   </script>
  <fieldset>

<table width="100%" cellpadding="0" cellspacing="0" align="center">
 <tr>
  <td width="100%" align="center">
   <table  border="0" align="center">
    <tr>
     <td class="reportsID"><b>
        <%= pagehorData.getWord("Available shifts")%>&nbsp;<%= pagehorData.getWord("From")%>:
        <%out.write(startingDateDaily);	%>
        <%= pagehorData.getWord("To")%>
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
			sRet=sc.buildScheduleForPeriod(startingDateDaily,endingDateDaily,agentGroup,"");
       } catch(Exception e){
    }
 %>

<tr>
 <td align="center">
  <table align="center" border='1'> <!--Tableau de schedule-->
   <tr  bgcolor='0099FF' style="color:#FFFFFF">
    <td align="center"> <%= pagehorData.getWord("Shift")%></td>
    <td width="70"  align="center"><%= pagehorData.getWord("Sunday")%></td>
    <td width="70"  align="center"><%= pagehorData.getWord("Monday")%> </td>
    <td width="70"  align="center"><%= pagehorData.getWord("Tuesday")%></td>
    <td width="70"  align="center"><%= pagehorData.getWord("Wednesday")%></td>
    <td width="70"  align="center"><%= pagehorData.getWord("Thursday")%> </td>
    <td width="70"  align="center"><%= pagehorData.getWord("Friday")%> </td>
    <td width="70"  align="center"><%= pagehorData.getWord("Saturday")%> </td>
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
	  
	  <% if(sch.sunday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(sch.sunday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(sch.monday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(sch.monday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(sch.tuesday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(sch.tuesday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(sch.wednesday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(sch.wednesday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(sch.thursday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(sch.thursday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(sch.friday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(sch.friday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(sch.saturday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(sch.saturday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	
      <%} // fin for
    }else {
        System.out.println("NO sucess");
 }//fin if sucess  %>
   <tr bgcolor='0099FF' style="color:#FFFFFF">
    <td><b><%= pagehorData.getWord("Total/Day")%></b></td>
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
     <td  style="background-color:pink" width="40"></td><td>&nbsp;</td><td><%= pagehorData.getWord("part-time shift")%>
    </td>
    </tr>
    <tr>
     <td  style="background-color:plum" width="40"></td><td>&nbsp;</td><td><%= pagehorData.getWord("split shift")%>
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
  <h2 class="tab"><%= pagehorData.getWord("Agent group")%>&nbsp; <%= pagehorData.getWord("view")%></h2>
   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );
   </script>
  <fieldset>

<table width="100%" cellpadding="0" cellspacing="0" align="center">
 <tr>
  <td align="center">
   <table width="100%"  border="0" align="center">
    <tr>
     <td width="100%" class="reportsID" align="center"><b>
        <%= pagehorData.getWord("Agent group")%>:   <%out.write(agentGroupName);%>  </b>
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

  <tr>
   <td align="center">
    <table border="1" align="center">
     <tr bgcolor='#b4cfff' style="color:#666666">
      <td><%= pagehorData.getWord("Name")%></td>
      <td><%= pagehorData.getWord("Sunday")%> </td>
      <td><%= pagehorData.getWord("Monday")%> </td>
      <td><%= pagehorData.getWord("Tuesday")%></td>
      <td><%= pagehorData.getWord("Wednesday")%> </td>
      <td><%= pagehorData.getWord("Thursday")%></td>
      <td><%= pagehorData.getWord("Friday")%></td>
      <td><%= pagehorData.getWord("Saturday")%></td>
      <td><%= pagehorData.getWord("Total hours")%></td>
      <td><%= pagehorData.getWord("Day off")%> </td>
     </tr>
  <%
//get the connection
try{
      sc.getConnection();
}catch(Exception e){
      }
 try{
    sc.GetGroupAgentSchedule(startingDateDaily,endingDateDaily,agentGroup);
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
// we should use our variable next_day_off to know how many days an agent can work in a row
if (agent.shifts.lastDayOff.equalsIgnoreCase("Saturday")){
nextDayOff ="OK";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Friday")){
nextDayOff ="Thursday";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Thursday")){
nextDayOff ="Wednesday";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Wednesday")){
nextDayOff ="Tuesday";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Tuesday")){
nextDayOff ="Monday";
}else if (agent.shifts.lastDayOff.equalsIgnoreCase("Monday")){
nextDayOff ="Sunday";
}else{
nextDayOff ="";
}%>
  <td>
      <% String name=agent.first_name+" "+agent.last_name;
      out.write("<a href='/aheevaccs/aheevaManager/jsp/addHoraires.jsp?nextDayOff="+nextDayOff+"&name="+name+"&login_id="+agent.agt_login_id+"&agentGroupName="+agentGroupName+"&group="+agentGroup+"&agentId="+agent.agt_id + "&startDate="+startingDateDaily + "&endDate="+endingDateDaily + "&mon="+agent.shifts.mon + "&tues="+agent.shifts.tues + "&wednes="+agent.shifts.wednes +"&thurs="+agent.shifts.thurs + "&fri="+agent.shifts.fri +"&satur="+agent.shifts.satur + "&sun="+agent.shifts.sun + "&lang=" + lang +"'>"); %>
      <%out.write(agent.last_name);%>,<%out.write(agent.first_name);%>&nbsp; [<%out.write(agent.agt_login_id);%>]
      </a>
   </td>

<%if (agent.shifts.sun.length()>0 && agent.shifts.sun.startsWith("p")) {%>
 <td style="background-color:#BCBCDE">
      <% out.write(agent.shifts.sun.substring(2,7)+ "-" + agent.shifts.sun.substring(agent.shifts.sun.length()-5,agent.shifts.sun.length()) ); %>
 </td>

<%}else if (agent.shifts.sun.length()>0 ){%>
  <td><% out.write(agent.shifts.sun.substring(0,5)+ "-" + agent.shifts.sun.substring(agent.shifts.sun.length()-5,agent.shifts.sun.length()) ); %>
  </td>
<%}else{%>
<td>&nbsp;</td>
<%}%>

<%if (agent.shifts.mon.length()>0 && agent.shifts.mon.startsWith("p")) {%>
      <td style="background-color:#BCBCDE">
<% out.write(agent.shifts.mon.substring(2,7)+ "-" + agent.shifts.mon.substring(agent.shifts.mon.length()-5,agent.shifts.mon.length()) ); %>
</td>
<%}else if (agent.shifts.mon.length()>0){%>
      <td><% out.write(agent.shifts.mon.substring(0,5)+ "-" + agent.shifts.mon.substring(agent.shifts.mon.length()-5,agent.shifts.mon.length()) );  %></td>
<%}else{%>
<td>&nbsp;</td>
<%}%>

<%if (agent.shifts.tues.length()>0 && agent.shifts.tues.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
      <% out.write(agent.shifts.tues.substring(2,7)+ "-" + agent.shifts.tues.substring(agent.shifts.tues.length()-5,agent.shifts.tues.length()) );    %></td>

<%}else if (agent.shifts.tues.length()>0){%>
      <td><% out.write(agent.shifts.tues.substring(0,5)+ "-" + agent.shifts.tues.substring(agent.shifts.tues.length()-5,agent.shifts.tues.length()) );    %></td>
<%}else{%>
<td>&nbsp;</td>
<%}%>

<%if (agent.shifts.wednes.length()>0 && agent.shifts.wednes.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
      <% out.write(agent.shifts.wednes.substring(2,7)+ "-" + agent.shifts.wednes.substring(agent.shifts.wednes.length()-5,agent.shifts.wednes.length()) );    %></td>
<%}else if(agent.shifts.wednes.length()>0) {%>
      <td><% out.write(agent.shifts.wednes.substring(0,5)+ "-" + agent.shifts.wednes.substring(agent.shifts.wednes.length()-5,agent.shifts.wednes.length()) );    %></td>
<%}else{%>
<td>&nbsp;</td>
<%}%>

<%if (agent.shifts.thurs.length()>0 && agent.shifts.thurs.startsWith("p")) {%>
      <td style="background-color:#BCBCDE">
 <% out.write(agent.shifts.thurs.substring(2,7)+ "-" + agent.shifts.thurs.substring(agent.shifts.thurs.length()-5,agent.shifts.thurs.length()) );    %></td>
<%}else if(agent.shifts.thurs.length()>0){%>
 <td><% out.write(agent.shifts.thurs.substring(0,5)+ "-" + agent.shifts.thurs.substring(agent.shifts.thurs.length()-5,agent.shifts.thurs.length()) );    %></td>
<%}else{%>
<td>&nbsp;</td>
<%}%>

<%if (agent.shifts.fri.length()>0 && agent.shifts.fri.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
     <% out.write(agent.shifts.fri.substring(2,7)+ "-" + agent.shifts.fri.substring(agent.shifts.fri.length()-5,agent.shifts.fri.length()) );    %></td>
<%}else if ( agent.shifts.fri.length()>0){%>
     <td>
<% out.write(agent.shifts.fri.substring(0,5)+ "-" + agent.shifts.fri.substring(agent.shifts.fri.length()-5,agent.shifts.fri.length()) );    %>
</td>
<%}else{%>
<td>&nbsp;</td>
<%}%>

 <%if (agent.shifts.satur.length()>0 && agent.shifts.satur.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
    <% out.write(agent.shifts.satur.substring(2,7)+ "-" + agent.shifts.satur.substring(agent.shifts.satur.length()-5,agent.shifts.satur.length()) );    %></td>
 <%}else if (agent.shifts.satur.length()>0){%>
    <td><% out.write(agent.shifts.satur.substring(0,5)+ "-" + agent.shifts.satur.substring(agent.shifts.satur.length()-5,agent.shifts.satur.length()) );    %></td>
<%}else {%>
<td>&nbsp;</td>
<%}%>

  <td><%out.write(agent.shifts.getTotal());%></td>
  <td><%out.write(nextDayOff);%></td>
 </tr>
 <%} // fin for %>
</table>

  </td>
 </tr>
 <tr>
  <td align="center">&nbsp;<br>
  </td>
 </tr>
 <tr>
  <td align="center">
 <input  type="submit" value='<%=pagehorData.getWord("Publish")%>' >
  </td>
 </tr>
</table>


</fieldset>
</div>


<div class="tab-page" id="tabPage3"  align="center">
  <h2 class="tab"><%= pagehorData.getWord("Teams")%>&nbsp; <%= pagehorData.getWord("view")%></h2>
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
     <% out.write("Schedule for team");%> : <%out.write(team.m_team_name);%></b>
  </td>
 </tr>
</table>
      <% try{
          sc.GetTeamAgentSchedule(team.m_dbid,startingDateDaily,endingDateDaily,agentGroup);
         }catch(Exception e){
              }
      %>
     <br>
     <table>
      <tr bgcolor='#b4cfff'>
      <td><%= pagehorData.getWord("Name")%> </td>
      <td><%= pagehorData.getWord("Sunday")%> </td>
      <td><%= pagehorData.getWord("Monday")%>  </td>
      <td><%= pagehorData.getWord("Tuesday")%> </td>
      <td><%= pagehorData.getWord("Wednesday")%>  </td>
      <td><%= pagehorData.getWord("Thursday")%>  </td>
      <td><%= pagehorData.getWord("Friday")%> </td>
      <td><%= pagehorData.getWord("Saturday")%>  </td>
      <td><%= pagehorData.getWord("Total hours")%> </td>
      </tr>
      <%

      for (l = 0; l < sc.m_vAllTeamAgents.size(); l++) {
      beanAgentLoginInfo agentT = (beanAgentLoginInfo)sc.m_vAllTeamAgents.elementAt(l); %>
      <%if (l%2==0){%>
      <tr bgcolor='#e6eff4'>
      <%}else{%>
      <tr bgcolor='#b4cfff'>
      <%}%>
      <td>
       <% String agt_name=agentT.first_name+" "+agentT.last_name;
       out.write("<a href='/aheevaccs/aheevaManager/jsp/addHoraires.jsp?name="+agt_name+"&login_id="+agentT.agt_login_id+"&agentGroupName="+agentGroupName+"&group="+agentGroup+"&agentId="+agentT.agt_id + "&startDate="+startingDateDaily + "&endDate="+endingDateDaily + "&mon="+agentT.shifts.mon + "&tues="+agentT.shifts.tues + "&wednes="+agentT.shifts.wednes +"&thurs="+agentT.shifts.thurs + "&fri="+agentT.shifts.fri +"&satur="+agentT.shifts.satur + "&sun="+agentT.shifts.sun + "&lang=" + lang  +"'>"); %>
       <%out.write(agentT.last_name);%>,<%out.write(agentT.first_name);%>&nbsp; [<%out.write(agentT.agt_login_id);%>]</a>
      </td>

<%if (agentT.shifts.sun.length() >0 && agentT.shifts.sun.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
<% out.write(agentT.shifts.sun.substring(2,7)+ "-" + agentT.shifts.sun.substring(agentT.shifts.sun.length()-5,agentT.shifts.sun.length()) ); %>
</td>
<%}else if(agentT.shifts.sun.length() >0){%>
      <td>
<% out.write(agentT.shifts.sun.substring(0,5)+ "-" + agentT.shifts.sun.substring(agentT.shifts.sun.length()-5,agentT.shifts.sun.length()) ); %>
</td>
<%}else{%>
<td></td>
<%}%>

 <%if (agentT.shifts.mon.length() >0 && agentT.shifts.mon.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
<% out.write(agentT.shifts.mon.substring(2,7)+ "-" + agentT.shifts.mon.substring(agentT.shifts.mon.length()-5,agentT.shifts.mon.length()) ); %>
</td>
<%}else if(agentT.shifts.mon.length() >0){%>
      <td><% out.write(agentT.shifts.mon.substring(0,5)+ "-" + agentT.shifts.mon.substring(agentT.shifts.mon.length()-5,agentT.shifts.mon.length()) ); %>
</td>
<%}else{%>
<td></td>
<%}%>


 <%if (agentT.shifts.tues.length() >0 && agentT.shifts.tues.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
<% out.write(agentT.shifts.tues.substring(2,7)+ "-" + agentT.shifts.tues.substring(agentT.shifts.tues.length()-5,agentT.shifts.tues.length()) ); %>
</td>
<%}else if(agentT.shifts.tues.length() >0){%>
      <td><% out.write(agentT.shifts.tues.substring(0,5)+ "-" + agentT.shifts.tues.substring(agentT.shifts.tues.length()-5,agentT.shifts.tues.length()) ); %>
</td>
<%}else{%>
<td></td>
<%}%>


 <%if (agentT.shifts.wednes.length() >0 && agentT.shifts.wednes.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
<% out.write(agentT.shifts.wednes.substring(2,7)+ "-" + agentT.shifts.wednes.substring(agentT.shifts.wednes.length()-5,agentT.shifts.wednes.length()) ); %>
</td>
<%}else if(agentT.shifts.wednes.length() >0){%>
      <td><% out.write(agentT.shifts.wednes.substring(0,5 )+ "-" + agentT.shifts.wednes.substring(agentT.shifts.wednes.length()-5,agentT.shifts.wednes.length()) ); %>
</td>
<%}else{%>
<td></td>
<%}%>

<%if (agentT.shifts.thurs.length() >0 && agentT.shifts.thurs.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
<% out.write(agentT.shifts.thurs.substring(2,7)+ "-" + agentT.shifts.thurs.substring(agentT.shifts.thurs.length()-5,agentT.shifts.thurs.length()) ); %>
</td>
<%}else if(agentT.shifts.thurs.length() >0){%>
      <td><% out.write(agentT.shifts.thurs.substring(0,5)+ "-" + agentT.shifts.thurs.substring(agentT.shifts.thurs.length()-5,agentT.shifts.thurs.length()) ); %>
</td>
<%}else{%>
<td></td>
<%}%>

<%if (agentT.shifts.fri.length() >0 && agentT.shifts.fri.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
<% out.write(agentT.shifts.fri.substring(2,7)+ "-" + agentT.shifts.fri.substring(agentT.shifts.fri.length()-5,agentT.shifts.fri.length()) ); %>
</td>
<%}else if(agentT.shifts.fri.length() >0){%>
      <td><% out.write(agentT.shifts.fri.substring(0,5)+ "-" + agentT.shifts.fri.substring(agentT.shifts.fri.length()-5,agentT.shifts.fri.length()) ); %>
</td>
<%}else{%>
<td></td>
<%}%>

<%if (agentT.shifts.satur.length() >0 && agentT.shifts.satur.startsWith("p") ) {%>
      <td style="background-color:#BCBCDE">
<% out.write(agentT.shifts.satur.substring(2,7)+ "-" + agentT.shifts.satur.substring(agentT.shifts.satur.length()-5,agentT.shifts.satur.length()) ); %>
</td>
<%}else if(agentT.shifts.satur.length() >0){%>
      <td><% out.write(agentT.shifts.satur.substring(0,5)+ "-" + agentT.shifts.satur.substring(agentT.shifts.satur.length()-5,agentT.shifts.satur.length()) ); %></td>
<%}else{%>
<td></td>
<%}%>

     <td><%out.write(agentT.shifts.getTotal());%></td>

</tr>
<%}//fin for all agents of that team


%>
    </table>
<br><br>


<%}//fin for all teams
  try{
          sc.closeConnection();
      }catch(Exception e){
      }

%>

</fieldset>
</div>


<div class="tab-page" id="tabPage4"  align="center">
  <h2 class="tab"><%= pagehorData.getWord("Assigned shifts")%></h2>
   <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage4" ) );
   </script>
  <fieldset>

<table width="100%" cellpadding="0" cellspacing="0" align="center">
 <tr>
  <td width="100%" align="center">
   <table  border="0" align="center">
    <tr>
     <td class="reportsID"><b>
      <%= pagehorData.getWord("Assigned shifts")%> &nbsp; <%= pagehorData.getWord("From")%>:
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
   <tr  bgcolor='0099FF' style="color:#FFFFFF">
	<td align="center"> <%= pagehorData.getWord("Shift")%> </td>
    <td width="70"  align="center"><%= pagehorData.getWord("Sunday")%> </td>
    <td width="70"  align="center"><%= pagehorData.getWord("Monday")%></td>
    <td width="70"  align="center"><%= pagehorData.getWord("Tuesday")%> </td>
    <td width="70"  align="center"><%= pagehorData.getWord("Wednesday")%> </td>
    <td width="70"  align="center"><%= pagehorData.getWord("Thursday")%> </td>
    <td width="70"  align="center"><%= pagehorData.getWord("Friday")%></td>
    <td width="70"  align="center"><%= pagehorData.getWord("Saturday")%></td>
	
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
	  
	  <% if(asch.sunday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(asch.sunday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(asch.monday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(asch.monday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(asch.tuesday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(asch.tuesday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(asch.wednesday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(asch.wednesday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(asch.thursday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(asch.thursday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(asch.friday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(asch.friday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	  <% if(asch.saturday !=0) {%>	  
      <td width="80"   align="center"> <%out.write(Long.toString(asch.saturday));%>  </td>
	  <% }else{ %>
	  <td>&nbsp;</td>
	  <%}%>
	  
	 <%} // fin for
    }else {
        System.out.println("NO sucess");
 }//fin if sucess  %>
   <tr bgcolor='0099FF' style="color:#FFFFFF">
    <td><b><%= pagehorData.getWord("Total/Day")%></b></td>
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
     <td  style="background-color:pink" width="40"></td><td>&nbsp;</td><td><%= pagehorData.getWord("part-time shift")%>
    </td>
    </tr>
    <tr>
     <td  style="background-color:plum" width="40"></td><td>&nbsp;</td><td><%= pagehorData.getWord("split shift")%>
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
	//setupAllTabs();
</script>
</form>
</body>

</html>

<% pagehorData.closeConnection(); %>
