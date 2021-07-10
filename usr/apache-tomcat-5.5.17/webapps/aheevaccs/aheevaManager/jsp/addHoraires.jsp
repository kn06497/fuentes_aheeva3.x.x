<html>
<head>
<title>Add horaires</title>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />

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
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<jsp:useBean id="sc" scope="request" class="aheevaManager.wfm_schedule.beanSchedule"/>

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<script language="javascript" type="text/javascript">



function deleteShift(name){
var day;
var shift;
  if (document.getElementById(name).checked){
  //we selected that shift
}else{

name = name.substring(3);
switch (name)
{
case 'sun':
  day = 'Sunday';
  break
case 'mon':
  day = 'Monday';
  break
case 'tue':
  day='Tuesday';
  break
case 'wed':
  day='Wednesday';
  break
case 'thu':
  day = 'Thuesday';
  break
case 'fri':
 day = 'Friday';
  break
case 'sat':
  day='Saturday';
break

}
     return true;
   }
}
function getShifts(nbr){
var suns='',mons='',tuess='',wedness='',thurss='',fris='',saturs='';
var name='';
    for(q=0;q<nbr;q++){
    name='sun'+q;
      if (document.getElementById(name)!=null){
        if (document.getElementById(name).checked){
          suns+=document.getElementById(name).value.substring(4);
          suns+='/'
        }//if checked
      }// if not null
     name='mon'+q;
      if (document.getElementById(name)!=null){
        if (document.getElementById(name).checked){
          mons+=document.getElementById(name).value.substring(4);
          mons+='/'
        }//if checked
      }// if not null
    name='tue'+q;
      if (document.getElementById(name)!=null){
        if (document.getElementById(name).checked){
          tuess+=document.getElementById(name).value.substring(4);
          tuess+='/'


        }//if checked
      }// if not null
    name='wed'+q;
      if (document.getElementById(name)!=null){
        if (document.getElementById(name).checked){
          wedness+=document.getElementById(name).value.substring(4);
          wedness+='/'
        }//if checked
      }// if not null
      name='thu'+q;
      if (document.getElementById(name)!=null){
        if (document.getElementById(name).checked){
          thurss+=document.getElementById(name).value.substring(4);
          thurss+='/'
        }//if checked
      }// if not null
      name='fri'+q;
      if (document.getElementById(name)!=null){
        if (document.getElementById(name).checked){
          fris+=document.getElementById(name).value.substring(4);
          fris+='/'
        }//if checked
      }// if not null
      name='sat'+q;
      if (document.getElementById(name)!=null){
        if (document.getElementById(name).checked){
          saturs+=document.getElementById(name).value.substring(4);
          saturs+='/'
        }//if checked
      }// if not null
    }
  document.agentShift.action = '/aheevaccs/servlet/ScheduleServlet' + '?mons='+mons +'&tuess='+tuess +'&wedness='+wedness+'&thurss='+thurss+'&fris='+fris+'&saturs='+saturs+'&suns='+suns+'&lang='+lang;
  return true;

}
</script>

<!------Menu drop down ------>
<script language="JavaScript1.2">
//Contents for menu 1
var menu1=new Array()
var menu2=new Array()
var menu3=new Array()
var menu4=new Array()
var menu5=new Array()
var menu6=new Array()
var menu7=new Array()

menu1[0]='<a href="javascript:uncheckSun();"><font color="red"><%= pageData.getWord("Delete all")%></font></a><br>'
menu2[0]='<a href="javascript:uncheckMon();"><font color="red"><%= pageData.getWord("Delete all")%></font></a><br>'
menu3[0]='<a href="javascript:uncheckTue();"><font color="red"><%= pageData.getWord("Delete all")%></font></a><br>'
menu4[0]='<a href="javascript:uncheckWed();"><font color="red"><%= pageData.getWord("Delete all")%></font></a><br>'
menu5[0]='<a href="javascript:uncheckThu();"><font color="red"><%= pageData.getWord("Delete all")%></font></a><br>'
menu6[0]='<a href="javascript:uncheckFri();"><font color="red"><%= pageData.getWord("Delete all")%></font></a><br>'
menu7[0]='<a href="javascript:uncheckSat();"><font color="red"><%= pageData.getWord("Delete all")%></font></a><br>'
</script>
<style>
<!--
#dropmenu0{
visibility:hide;
z-index:100;
}
#dropmenu1{
visibility:hide;
z-index:100;
}
#dropmenu2{
visibility:hide;
z-index:100;
}
#dropmenu3{
visibility:hide;
z-index:100;
}
#dropmenu4{
visibility:hide;
z-index:100;
}
#dropmenu5{
visibility:hide;
z-index:100;
}
#dropmenu6{
visibility:hide;
z-index:100;
}
-->
</style>

</head>
<body>
<script language="JavaScript1.2">

function uncheckSun() {
radioButtonOrGroup = document.agentShift.sun;
  if (radioButtonOrGroup.length) { // we have a group
    for (var b = 0; b < radioButtonOrGroup.length; b++){
      if (radioButtonOrGroup[b].checked) {
        radioButtonOrGroup[b].checked = false;
        break;
      }
    }
  }
  else
    radioButtonOrGroup.checked = false;
}

function uncheckMon() {
radioButtonOrGroup = document.agentShift.mon;
  if (radioButtonOrGroup.length) { // we have a group
    for (var b = 0; b < radioButtonOrGroup.length; b++){
      if (radioButtonOrGroup[b].checked) {
        radioButtonOrGroup[b].checked = false;
      }
    }
  }
  else
    radioButtonOrGroup.checked = false;
}

function uncheckTue() {
radioButtonOrGroup = document.agentShift.tue;
  if (radioButtonOrGroup.length) { // we have a group
    for (var b = 0; b < radioButtonOrGroup.length; b++)
      if (radioButtonOrGroup[b].checked) {
        radioButtonOrGroup[b].checked = false;
      }
  }
  else
    radioButtonOrGroup.checked = false;
}

function uncheckWed() {
radioButtonOrGroup = document.agentShift.wed;
  if (radioButtonOrGroup.length) { // we have a group
    for (var b = 0; b < radioButtonOrGroup.length; b++)
      if (radioButtonOrGroup[b].checked) {
        radioButtonOrGroup[b].checked = false;
      }
  }
  else
    radioButtonOrGroup.checked = false;
}

function uncheckThu() {
radioButtonOrGroup = document.agentShift.thu;
  if (radioButtonOrGroup.length) { // we have a group
    for (var b = 0; b < radioButtonOrGroup.length; b++)
      if (radioButtonOrGroup[b].checked) {
        radioButtonOrGroup[b].checked = false;
      }
  }
  else
    radioButtonOrGroup.checked = false;
}

function uncheckFri() {
radioButtonOrGroup = document.agentShift.fri;
  if (radioButtonOrGroup.length) { // we have a group
    for (var b = 0; b < radioButtonOrGroup.length; b++)
      if (radioButtonOrGroup[b].checked) {
        radioButtonOrGroup[b].checked = false;
      }
  }
  else
    radioButtonOrGroup.checked = false;
}

function uncheckSat() {
radioButtonOrGroup = document.agentShift.sat;
  if (radioButtonOrGroup.length) { // we have a group
    for (var b = 0; b < radioButtonOrGroup.length; b++)
      if (radioButtonOrGroup[b].checked) {
        radioButtonOrGroup[b].checked = false;
      }
  }
  else
    radioButtonOrGroup.checked = false;
}

//reusable/////////////////////////////
var zindex=100
function dropit2(whichone){
if (window.themenu&&themenu.id!=whichone.id)
themenu.style.visibility="hidden"
themenu=whichone
if (document.all){
themenu.style.left=document.body.scrollLeft+event.clientX-event.offsetX
themenu.style.top=document.body.scrollTop+event.clientY-event.offsetY+18
if (themenu.style.visibility=="hidden"){
themenu.style.visibility="visible"
themenu.style.zIndex=zindex++
}
else{
hidemenu()
}
}
}

function dropit(e,whichone){
//if (themenu&&themenu.id!=eval(whichone).id)
//themenu.visibility="hide"
//themenu=eval(whichone)
//if (themenu.visibility=="hide")
//themenu.visibility="show"
//else
//themenu.visibility="hide"
//themenu.zIndex++
//themenu.left=e.pageX-e.layerX
//themenu.top=e.pageY-e.layerY+19
return false
}

function hidemenu(whichone){
if (window.themenu)
themenu.style.visibility="hidden"
}

function hidemenu2(){
themenu.visibility="hide"
}

if (document.all)
document.body.onclick=hidemenu

//reusable/////////////////////////////
</script>


<%
    String startingDateDaily = request.getParameter("startDate");
    String endingDateDaily   = request.getParameter("endDate");
    String name = request.getParameter("name");
    String agentId  = request.getParameter("agentId");
    String login_id = request.getParameter("login_id");
    String group = request.getParameter("group");
    String mon = request.getParameter("mon");
System.out.println("le monday recu est : " + mon);

    String tues = request.getParameter("tues");
    String wednes= request.getParameter("wednes");
    String thurs = request.getParameter("thurs");
    String fri = request.getParameter("fri");
    String satur = request.getParameter("satur");
    String sun = request.getParameter("sun");
    String agentGroupName = request.getParameter("agentGroupName");
    String nextDayOff =  request.getParameter("nextDayOff");
    String startingDate= "",endingDate= "";
    String sRet= "",testP = "";
    int i,j,k;
    long tLoginTime;
    String agents = "",myagt="";
    String [] m_Agents;
    String [] m_tLoginTime;
    //get the global parameters
    long next_day_off=0,regular_shift=0;

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
   }%>

<br>
<br>
<%
  // build stats for this agent group
  try{
      // sc.getConnection();
      // testP = sc.getdAgentSchedule2(agentId,startingDateDaily,endingDateDaily);//is there a published schedule?
     //  sc.closeConnection();
	   sRet=sc.buildScheduleForPeriod(startingDateDaily,endingDateDaily,group,agentId);
   }   catch(Exception e){
  }

//if(testP=="success") { -- we check later
   //  ScheduleInfo agentShtP = (ScheduleInfo)sc.m_vAllAgentPublishedShifts.elementAt(0);
//}
 %>
<form id="agentShift" name="agentShift" method="post" onSubmit="return getShifts('<%=sc.m_vAllShifts.size()%>');">

<input type="hidden" name="agent_dbid" value="<%=agentId%>">
<input type="hidden" name="group_dbid" value="<%=group%>">
<input type="hidden" name="start_date" value="<%=startingDateDaily%>">
<input type="hidden" name="end_date" value="<%=endingDateDaily%>">
<input type="hidden" name="agentGroupName" value="<%=agentGroupName%>">


<table width="100%"  border="0" align="center">
 <tr>
  <td align="center">
   <table  border="0" align="center">
    <tr>
     <td class="reportsID"  align="center"><b>
       <%= pageData.getWord("Add schedule for agent")%> : <%out.write(name);%> [ <%out.write(login_id);%>]</b>
     </td>
     </tr>
     <tr>
     <td class="reportsID"  align="center"><b>
        <%= pageData.getWord("next day off")%> : <%out.write(nextDayOff);%> </b>
     </td>
    </tr>
    <tr>
     <td>&nbsp;
     </td>
    </tr>
    <tr>
     <td align="center">
	 	<input  type="submit" value= '<%= pageData.getWord("Assign")%>' >
	      &nbsp;&nbsp;
		<input  type="button" value= '<%= pageData.getWord("Cancel")%>'  onClick="javascript:history.back()">

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
 <tr>
  <td align="center">
   <table> <!--Tableau de schedule-->
    <tr bgcolor='#b4cfff'>
     <td align="center"><%= pageData.getWord("Shift")%></td>
     <span onClick="dropit2(dropmenu0);event.cancelBubble=true;return false">
     <td width="70"  align="center">
     <a href="alternate.htm" onClick="return dropit(event, 'document.dropmenu0')"><%= pageData.getWord("Sunday")%><font size='1'> >> </font></a>
     </td>
     </span>
    <span onClick="dropit2(dropmenu1);event.cancelBubble=true;return false">
     <td width="70"  align="center">
     <a href="alternate.htm" onClick="return dropit(event, 'document.dropmenu1')"><%= pageData.getWord("Monday")%><font size='1'> >> </font></a>
     </td>
     </span>
     <span onClick="dropit2(dropmenu2);event.cancelBubble=true;return false">
     <td width="70"  align="center">
     <a href="alternate.htm" onClick="return dropit(event, 'document.dropmenu2')"><%= pageData.getWord("Tuesday")%><font size='1'> >> </font></a>
     </td>
     </span>
     <span onClick="dropit2(dropmenu3);event.cancelBubble=true;return false">
     <td align="center" nowrap>
     <a href="alternate.htm" onClick="return dropit(event, 'document.dropmenu3')"><%= pageData.getWord("Wednesday")%><font size='1'> >> </font></a>
     </td>
     </span>
     <span onClick="dropit2(dropmenu4);event.cancelBubble=true;return false">
     <td align="center" nowrap>
     <a href="alternate.htm" onClick="return dropit(event, 'document.dropmenu4')"><%= pageData.getWord("Thursday")%><font size='1'> >> </font></a>
     </td>
     </span>
      <span onClick="dropit2(dropmenu5);event.cancelBubble=true;return false">
     <td width="70"  align="center">
     <a href="alternate.htm" onClick="return dropit(event, 'document.dropmenu5')"><%= pageData.getWord("Friday")%><font size='1'> >> </font></a>
     </td>
     </span>
      <span onClick="dropit2(dropmenu6);event.cancelBubble=true;return false">
     <td  align="center" nowrap>
     <a href="alternate.htm" onClick="return dropit(event, 'document.dropmenu6')"><%= pageData.getWord("Saturday")%><font size='1'> >> </font></a>
     </td>
     </span>
    </tr>
    <%
        long tot_sun=0,tot_mon=0,tot_tue=0,tot_wed=0,tot_thu=0,tot_fri=0,tot_sat=0;
        int numObjects;
        StringTokenizer tok;
        tok = null;
        String mshift="";
	if(sRet=="success") {
              for (i = 0; i < sc.m_vAllShifts.size(); i++) {
              ScheduleInfo sch = (ScheduleInfo)sc.m_vAllShifts.elementAt(i);
              tot_sun+=sch.sunday;
              tot_mon+=sch.monday;
              tot_tue+=sch.tuesday;
              tot_wed+=sch.wednesday;
              tot_thu+=sch.thursday;
              tot_fri+=sch.friday;
              tot_sat+=sch.saturday ;
   %>


 <%if (sch.duration < regular_shift) {%>
         <tr bgcolor='#FFC0CB'>
    <%}else if (sch.duration > regular_shift) {%>
         <tr  bgcolor='#DDA0DD'>
    <%}else{%>
     <%if (i%2==0){%>
     <tr bgcolor='#e6eff4'>
     <%}else{%>
     <tr bgcolor='#b4cfff'>
    <%}%>
  <%}%>

    <td width="80"   align="center" >
      <%out.write(sch.shift);%>
    </td>
    <%if (sun.length() > 0 && sun.startsWith("p") ) { // if it's published %>
       <% if ( sun.indexOf(sch.shift)>0){ %>
        <td width="80"  align="center" style="background-color:#BCBCDE">
       <%}else{%>
       <td width="80"  align="center" >
       <%}%>
    <%}else{ //not published yet %>
      <td width="80"  align="center">
      <%if ( sch.sunday > 0 ){%>
         <%//decouper les shift en token et les afficher%>
       <% if (sun.compareTo(sch.shift)==0 ){ %>
	   <%out.write(Long.toString(sch.sunday));%>
        <input id="sun<%=i%>" type=checkbox name="sun"  value="sun-<%out.write(sch.shift);%>" onClick=deleteShift("sun<%=i%>") checked>
       <%}else{%>
	   <%out.write(Long.toString(sch.sunday));%>
        <input id="sun<%=i%>" type=checkbox name="sun"  value="sun-<%out.write(sch.shift);%>" onClick=deleteShift("sun<%=i%>")>
        <%}%>


      <%}//end of if ( sch.sunday > 0 ) %>
    <%} // end if not published%>
 </td>

<%if (mon.length() > 0 && mon.startsWith("p")) {%>
     <% if ( mon.indexOf(sch.shift)>0){ %>
        <td width="80"  align="center" style="background-color:#BCBCDE">
     <%}else{%>
       <td width="80"  align="center" >
     <%}%>
<%}else{%>
     <td width="80"   align="center">
     <%if(sch.monday> 0 ){
          //decouper les shift en token et les afficher
          numObjects=0;
          tok = null;
          mshift="";
           tok = new java.util.StringTokenizer(mon,"/");
           numObjects = tok.countTokens();
           for(k = 0; k <numObjects; k++ ) {
           mshift= tok.nextToken();
           if ( mshift.equalsIgnoreCase(sch.shift)){%>
           <%System.out.println("on a trouver un shift egal : " + mshift);%>
				<%out.write(Long.toString(sch.monday));%>
                <input id="mon<%=i%>" type=checkbox  name="mon" value="mon-<%out.write(sch.shift);%>" onClick=deleteShift("mon<%=i%>") checked>
              <%}%>
           <%}//fin des tokens - mshift%>
           <% if (  mon.indexOf(sch.shift)<0 ){%>
		   <%out.write(Long.toString(sch.monday));%>
                <input id="mon<%=i%>" type=checkbox name="mon" value="mon-<%out.write(sch.shift);%>" onClick=deleteShift("mon<%=i%>")>
           <%}%>
      <%} // End of if(sch.monday> 0 ) %>
<%}// End of - shift not published%>
    </td>

<%if (tues.length() > 0 && tues.startsWith("p") ) {%>
     <% if ( tues.indexOf(sch.shift)>0){ %>
        <td width="80"  align="center" style="background-color:#BCBCDE">
     <%}else{%>
       <td width="80"  align="center" >
     <%}%>
<%}else{%>
    <td width="80"  align="center">
      <%if(sch.tuesday> 0 ){
          //decouper les shift en token et les afficher
          numObjects=0;
          tok = null;
          String tueshift="";
           tok = new java.util.StringTokenizer(tues,"/");
           numObjects = tok.countTokens();
           for(k = 0; k <numObjects; k++ ) {
           tueshift= tok.nextToken();
           if ( tueshift.equalsIgnoreCase(sch.shift)){%>
		   		<%out.write(Long.toString(sch.tuesday));%>
                <input id="tue<%=i%>" type=checkbox  name="tue" value="tue-<%out.write(sch.shift);%>" onClick=deleteShift("tue<%=i%>") checked>
              <%}%>
           <%}//fin des tokens - tueshift%>
           <% if ( tues.indexOf(sch.shift)<0 ){%>
		   <%out.write(Long.toString(sch.tuesday));%>
                <input id="tue<%=i%>" type=checkbox name="tue" value="tue-<%out.write(sch.shift);%>" onClick=deleteShift("tue<%=i%>")>
           <%}%>
      <%} // End of if(sch.tuesday> 0 ) %>
<%}//End of Not Published %>
</td>

<%if (wednes.length() > 0 && wednes.startsWith("p") ) {%>
     <% if ( wednes.indexOf(sch.shift)>0){ %>
        <td width="80"  align="center" style="background-color:#BCBCDE">
     <%}else{%>
       <td width="80" align="center">
     <%}%>
<%}else{%>
<td width="80" align="center">

<%if(sch.wednesday> 0 ){
          //decouper les shift en token et les afficher
          numObjects=0;
          tok = null;
          String wedshift="";
           tok = new java.util.StringTokenizer(wednes,"/");
           numObjects = tok.countTokens();
           for(k = 0; k <numObjects; k++ ) {
           wedshift= tok.nextToken();
           if ( wedshift.equalsIgnoreCase(sch.shift)){%>
		   	<%out.write(Long.toString(sch.wednesday));%>
                <input id="wed<%=i%>" type=checkbox  name="wed" value="wed-<%out.write(sch.shift);%>" onClick=deleteShift("wed<%=i%>") checked>
              <%}%>
           <%}//fin des tokens - wedshift%>
           <% if ( wednes.indexOf(sch.shift)<0 ){%>
		   <%out.write(Long.toString(sch.wednesday));%>
                <input id="wed<%=i%>" type=checkbox name="wed" value="wed-<%out.write(sch.shift);%>" onClick=deleteShift("wed<%=i%>")>
           <%}%>
      <%} // End of if(sch.wednesday> 0 ) %>
<%}%>
</td>

 <%if (thurs.length() > 0 && thurs.startsWith("p")) {%>
     <%if ( thurs.indexOf(sch.shift)>0){ %>
        <td width="80"  align="center" style="background-color:#BCBCDE">
     <%}else{%>
       <td width="80"  align="center" >
     <%}%>
 <%}else{%>
 <td width="80"  align="center">

<%if(sch.thursday> 0 ){
          //decouper les shift en token et les afficher
          numObjects=0;
          tok = null;
          String thushift="";
           tok = new java.util.StringTokenizer(thurs,"/");
           numObjects = tok.countTokens();
           for(k = 0; k <numObjects; k++ ) {
           thushift= tok.nextToken();
           if ( thushift.equalsIgnoreCase(sch.shift)){%>
		   <%out.write(Long.toString(sch.thursday));%>
                <input id="thu<%=i%>" type=checkbox  name="thu" value="thu-<%out.write(sch.shift);%>" onClick=deleteShift("thu<%=i%>") checked>
              <%}%>
           <%}//fin des tokens - wedshift%>
           <% if ( thurs.indexOf(sch.shift)<0 ){%>
		   <%out.write(Long.toString(sch.thursday));%>
                <input id="thu<%=i%>" type=checkbox name="thu" value="thu-<%out.write(sch.shift);%>" onClick=deleteShift("thu<%=i%>")>
           <%}%>
      <%} // End of if(sch.thursday> 0 ) %>

<%}%>
</td>

<%if (fri.length() > 0 && fri.startsWith("p")) {%>
     <%if ( fri.indexOf(sch.shift)>0){ %>
        <td width="80"  align="center" style="background-color:#BCBCDE">
     <%}else{%>
       <td width="80"  align="center" >
     <%}%>
<%}else{%>
 <td width="80" align="center">
<%if(sch.friday> 0 ){
          //decouper les shift en token et les afficher
          numObjects=0;
          tok = null;
          String frishift="";
           tok = new java.util.StringTokenizer(fri,"/");
           numObjects = tok.countTokens();
           for(k = 0; k <numObjects; k++ ) {
           frishift= tok.nextToken();
           if ( frishift.equalsIgnoreCase(sch.shift)){%>
		   <%out.write(Long.toString(sch.friday));%>
                <input id="fri<%=i%>" type=checkbox  name="fri" value="fri-<%out.write(sch.shift);%>" onClick=deleteShift("fri<%=i%>") checked>
              <%}%>
           <%}//fin des tokens - frishift%>
           <% if ( fri.indexOf(sch.shift)<0 ){%>
		   <%out.write(Long.toString(sch.friday));%>
                <input id="fri<%=i%>" type=checkbox name="fri" value="fri-<%out.write(sch.shift);%>" onClick=deleteShift("fri<%=i%>")>
           <%}%>
      <%} // End of if(sch.friday> 0 ) %>




<%}%>
</td>
<%if (satur.length() > 0 && satur.startsWith("p")) {%>
     <%if ( satur.indexOf(sch.shift)>0){ %>
        <td width="80"  align="center" style="background-color:#BCBCDE">
     <%}else{%>
       <td width="80"  align="center" >
     <%}%><%}else{%>
<td width="80"  align="center">

<%if(sch.saturday> 0 ){
          //decouper les shift en token et les afficher
          numObjects=0;
          tok = null;
          String satshift="";
           tok = new java.util.StringTokenizer(satur,"/");
           numObjects = tok.countTokens();
           for(k = 0; k <numObjects; k++ ) {
           satshift= tok.nextToken();
           if ( satshift.equalsIgnoreCase(sch.shift)){%>
		   <%out.write(Long.toString(sch.saturday));%>
                <input id="sat<%=i%>" type=checkbox  name="sat" value="sat-<%out.write(sch.shift);%>" onClick=deleteShift("sat<%=i%>") checked>
              <%}%>
           <%}//fin des tokens - satshift%>
           <% if ( satur.indexOf(sch.shift)<0 ){%>
		   <%out.write(Long.toString(sch.saturday));%>
                <input id="sat<%=i%>" type=checkbox name="sat" value="sat-<%out.write(sch.shift);%>" onClick=deleteShift("sat<%=i%>")>
           <%}%>
      <%} // End of if(sch.saturday> 0 ) %>



<%}%>
</td>
</tr>

      <%} // fin for
    }// fin if sucess%>
   <tr bgcolor='0099FF'>
    <td><b><%= pageData.getWord("To")%>/<%= pageData.getWord("day")%> </b></td>
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
  <td align="center">
   <table>
    <tr>
     <td  style="background-color:#BCBCDE" width="40"></td><td>&nbsp;</td><td><%= pageData.getWord("shift assigned for this day")%></td>
    </tr>
    <tr>
     <td  style="background-color:pink" width="40"></td><td>&nbsp;</td><td><%= pageData.getWord("part-time shift")%>
    </td>
    </tr>
    <tr>
     <td  style="background-color:plum" width="40"></td><td>&nbsp;</td><td><%= pageData.getWord("split shift")%>
    </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<br><br><br><br>

<!------For the drop down menu 1------>

<div id=dropmenu0 style="position:absolute;left:0;top:0;layer-background-color:lightyellow;background-color:lightyellow;width:120;visibility:hidden;border:2px solid black;padding:0px">
<script language="JavaScript1.2">
if (document.all)
dropmenu0.style.padding="4px"
for (i=0;i<menu1.length;i++)
document.write(menu1[i])
</script>
</div>
<script language="JavaScript1.2">
if (document.layers){
document.dropmenu0.captureEvents(Event.CLICK)
document.dropmenu0.onclick=hidemenu2
}
</script>
<!------For the drop down menu 2------>

<div id=dropmenu1 style="position:absolute;left:0;top:0;layer-background-color:lightyellow;background-color:lightyellow;width:120;visibility:hidden;border:2px solid black;padding:0px">
<script language="JavaScript1.2">
if (document.all)
dropmenu1.style.padding="4px"
for (i=0;i<menu2.length;i++)
document.write(menu2[i])
</script>
</div>
<script language="JavaScript1.2">
if (document.layers){
document.dropmenu1.captureEvents(Event.CLICK)
document.dropmenu1.onclick=hidemenu2
}
</script>

<!------For the drop down menu 3------>

<div id=dropmenu2 style="position:absolute;left:0;top:0;layer-background-color:lightyellow;background-color:lightyellow;width:120;visibility:hidden;border:2px solid black;padding:0px">
<script language="JavaScript1.2">
if (document.all)
dropmenu2.style.padding="4px"
for (i=0;i<menu3.length;i++)
document.write(menu3[i])
</script>
</div>
<script language="JavaScript1.2">
if (document.layers){
document.dropmenu2.captureEvents(Event.CLICK)
document.dropmenu2.onclick=hidemenu2
}
</script>

<!------For the drop down menu 4------>

<div id=dropmenu3 style="position:absolute;left:0;top:0;layer-background-color:lightyellow;background-color:lightyellow;width:120;visibility:hidden;border:2px solid black;padding:0px">
<script language="JavaScript1.2">
if (document.all)
dropmenu3.style.padding="4px"
for (i=0;i<menu4.length;i++)
document.write(menu4[i])
</script>
</div>
<script language="JavaScript1.2">
if (document.layers){
document.dropmenu3.captureEvents(Event.CLICK)
document.dropmenu3.onclick=hidemenu2
}
</script>

<!------For the drop down menu 5------>

<div id=dropmenu4 style="position:absolute;left:0;top:0;layer-background-color:lightyellow;background-color:lightyellow;width:120;visibility:hidden;border:2px solid black;padding:0px">
<script language="JavaScript1.2">
if (document.all)
dropmenu4.style.padding="4px"
for (i=0;i<menu5.length;i++)
document.write(menu5[i])
</script>
</div>
<script language="JavaScript1.2">
if (document.layers){
document.dropmenu4.captureEvents(Event.CLICK)
document.dropmenu4.onclick=hidemenu2
}
</script>

<!------For the drop down menu 6------>

<div id=dropmenu5 style="position:absolute;left:0;top:0;layer-background-color:lightyellow;background-color:lightyellow;width:120;visibility:hidden;border:2px solid black;padding:0px">
<script language="JavaScript1.2">
if (document.all)
dropmenu5.style.padding="4px"
for (i=0;i<menu6.length;i++)
document.write(menu6[i])
</script>
</div>
<script language="JavaScript1.2">
if (document.layers){
document.dropmenu5.captureEvents(Event.CLICK)
document.dropmenu5.onclick=hidemenu2
}
</script>

<!------For the drop down menu 7------>

<div id=dropmenu6 style="position:absolute;left:0;top:0;layer-background-color:lightyellow;background-color:lightyellow;width:120;visibility:hidden;border:2px solid black;padding:0px">
<script language="JavaScript1.2">
if (document.all)
dropmenu6.style.padding="4px"
for (i=0;i<menu7.length;i++)
document.write(menu7[i])
</script>
</div>
<script language="JavaScript1.2">
if (document.layers){
document.dropmenu6.captureEvents(Event.CLICK)
document.dropmenu6.onclick=hidemenu2
}
</script>

</form>
</body>
</html>
<% pageData.closeConnection(); %>

