<%@page import ="aheevaManager.ressources.*"%>
<%
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else
		pageData.setDefaultLanguage("ENGLISH");	
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/simpleDatePicker.js"></script>
<table cellspacing="8">
 <tr height="26" valign="top" >
	<td align="center"><b><%=pageData.getWord("Report type")%></b></td>
	<td align="center"><b><%=pageData.getWord("Starting date")%></b></td>
	<td align="center"><b> <%=pageData.getWord("Ending date")%></div></td>
 </tr>
<tr height="26">
  	<td>
	<input id="reportType_yealy" name="reportType" type="radio" value="Yearly" onClick="changeDisabled()">
	<label for="reportType_yealy"><%=pageData.getWord("for each year")%></label>   </td>
    <td align="center" valign="top">
     <select name="starting_year_yearly" disabled="true">
    		<option value="2004">2004</option>
    		<option value="2005">2005</option>
    		<option value="2006">2006</option>
			<option value="2007" selected>2007</option>
			<option value="2008">2008</option>
			<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
    </select>    </td>
    <td align="center" valign="top">
	<select name="ending_year_yearly" disabled="true">
    		<option value="2004">2004</option>
    		<option value="2005">2005</option>
    		<option value="2006">2006</option>
			<option value="2007" selected>2007</option>
			<option value="2008">2008</option>
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
   <td>
   	<input id="reportType_monthly" name="reportType" type="radio" value="Monthly" onClick="changeDisabled()">
	<label for="reportType_monthly"><%=pageData.getWord("for each month")%></label>   </td>
   <td align="center" valign="top">
     <select name="starting_month_monthly" disabled="true">
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
			<option value="2007" selected>2007</option>
			<option value="2008">2008</option>
			<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
    </select>    </td>
    <td align="center" valign="top">
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
			<option value="2007" selected>2007</option>
			<option value="2008">2008</option>
			<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
    </select>    </td>
  </tr>
   <tr>
   <td>
    <input id="reportType_daily" name="reportType" type="radio" value="Daily"  onClick="changeDisabled()" checked>
	<label for="reportType_daily"><%=pageData.getWord("for each day")%></label>   </td>
   <td align="center" id="id_startingDateDaily" valign="top">
   	 <input type="text" size="20" onFocus="showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()" name="startingDateDaily" />    </td>
    <td align="center" id="id_endingDateDaily" valign="top">
		<input type="text" size="20" onFocus="showCalendar('',this,this,'','id_endingDateDaily',0,30,1);this.blur()" name="endingDateDaily"/>
	</td>
  <tr>
</table>
