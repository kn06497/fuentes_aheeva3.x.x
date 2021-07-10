<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage=""%> 
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageDatepData = new beanManagerData();
pageDatepData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDatepData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="xc2_default_labels.jsp" %>
<%@ include file="datePicker_labels.jsp" %>
<LINK type="text/css" rel="stylesheet" href="../Resources_pages/style.css" />
<link type="text/css" rel="stylesheet" href="../Resources_pages/xc2_default.css" >
<LINK type="text/css" rel="stylesheet" href="../Resources_pages/livestats.css" />
<!-- Calendrier début -->
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="xc2_default.js"></script>
<script language="javascript" type="text/javascript">xcAutoHide=1000;</script>
<script language="javascript" type="text/javascript" src="xc2_inpage.js"></script>
<!-- Calendrier fin -->
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="datePicker.js"></script><!--Contains js functions used exclusively in this file-->
</head>

<body class="bottompagebody">
<form name="agentReportForm" id="agentReportForm">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="69%"  >
  <tr >
    <td width="40%" colspan="2" valign="top" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1">
   	    <div align="center">
    	  <p class="style1"><%=pageDatepData.getWord("Agent details report")%></p>
    	  <p align="center">
    	    <select name="objects" size="15" multiple id="objects">
              <%
			AgentsCollection allAgents = new AgentsCollection(Integer.parseInt(tenantDbid));
			for(int i=0; i<allAgents.size();i++)
			{
				
		%>
              <option value="<%=allAgents.elementAt(i).getLoginId()%>"><%="["+allAgents.elementAt(i).getLoginId()+"] "+allAgents.elementAt(i).getLastName()+", "+allAgents.elementAt(i).getFirstName()%></option>
              <%
			}
		
		%>
            </select>
    	  </p>
   	    </div>   	    <br>		</td>
    <td width="40%" valign="top" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1"><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="100%"  >
      <tr height="26" valign="top" >
        <td width="34%" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" ><div align="center"><b><%=pageDatepData.getWord("Report type")%></b> </div></td>
        <td width="38%" style="border-top-style: none; border-top-width: 1" ><div align="center"><b><%=pageDatepData.getWord("Starting date")%></b> </div></td>
        <td width="38%" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" ><div align="center"><b> <%=pageDatepData.getWord("Ending date")%></b> </div></td>
      </tr>
      <tr height="26">
        <td><input name="period" type="radio" value="yearly" onClick="changeDisabled()">
             <%=pageDatepData.getWord("For each year")%> </td>
        <td valign="top" width="38%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" ><select name="starting_year_yearly" disabled="true">
            <option value="2004">2004</option>
            <option value="2005">2005</option>
            <option value="2006">2006</option>
            <option value="2007">2007</option>
            <option value="2008" selected>2008</option>
            <option value="2009">2009</option>
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
          </select>        </td>
        <td valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1"><select name="ending_year_yearly" disabled="true">
            <option value="2004">2004</option>
            <option value="2005">2005</option>
            <option value="2006">2006</option>
            <option value="2007">2007</option>
            <option value="2008 selected">2008</option>
            <option value="2009">2009</option>
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
          </select>        </td>
      </tr>
      <tr>
        <td><input name="period" type="radio" value="monthly" onClick="changeDisabled()"><%=pageDatepData.getWord("For each month")%> </td>
        <td valign="top" width="38%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" ><select name="starting_month_monthly" disabled="true">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
          </select>
            <select name="starting_year_monthly" disabled="true">
              <option value="2004">2004</option>
              <option value="2005">2005</option>
              <option value="2006">2006</option>
              <option value="2007">2007</option>
              <option value="2008" selected>2008</option>
              <option value="2009">2009</option>
              <option value="2010">2010</option>
              <option value="2011">2011</option>
              <option value="2012">2012</option>
              <option value="2013">2013</option>
              <option value="2014">2014</option>
              <option value="2015">2015</option>
            </select>        
			</td>
			<td valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1">
			<select name="ending_month_monthly" disabled="true">
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			  </select>
			<select name="ending_year_monthly" disabled="true">
			  <option value="2004">2004</option>
			  <option value="2005">2005</option>
			  <option value="2006">2006</option>
			  <option value="2007">2007</option>
			  <option value="2008" selected>2008</option>
			  <option value="2009">2009</option>
			  <option value="2010">2010</option>
			  <option value="2011">2011</option>
			  <option value="2012">2012</option>
			  <option value="2013">2013</option>
			  <option value="2014">2014</option>
			  <option value="2015">2015</option>
			</select>        
			</td>
      </tr>
      <tr>
        <td><input name="period" type="radio" value="daily"  onClick="changeDisabled()" checked>
            <%=pageDatepData.getWord("For each day")%> </td>
        <td id="id_startingDateDaily" valign="top" width="38%" style="border-left-style: none; border-left-width: 1; border-bottom-style:none; border-bottom-width:1" ><input type="text" size="20" onFocus="showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()" name="startingDateDaily" />        </td>
        <td id="id_endingDateDaily" valign="top" width="38%" style="border-bottom-style: none; border-bottom-width: 1"><input type="text" size="20" onFocus="showCalendar('',this,this,'','id_endingDateDaily',0,30,1);this.blur()" name="endingDateDaily"/>        </td>
      <tr>
        <td height="10">      </tr>
      <tr>
        <td  style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" >&nbsp;</td>
        <td  style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1"><span style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">
          <input type="checkbox" name="detailReport" id="detailReport">
          <%=pageDatepData.getWord("detailed information")%> </span> </td>
        <td  valign"top"  align="right" >&nbsp;</td>
      </tr>

    </table>
      <p>&nbsp;</p>
	  <input type="button" value="<%=pageDatepData.getWord("Submit")%>" onClick="getRequestedReport()"/>
	  <input type="button" value="" onclick="return getRequestedReport()"  />
	  </td>
  </tr>
</table>
</form>
</body>
</html>
<% pageDatepData.closeConnection(); %>