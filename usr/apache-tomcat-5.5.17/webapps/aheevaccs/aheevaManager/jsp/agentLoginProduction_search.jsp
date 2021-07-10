<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import = "aheevaManager.ressources.*" %>
<html>
<head>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<%
	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	String reportDate = request.getParameter("reportDate");
	String[] date_array = reportDate.split("/");
	int year = 0, month = 0, day = 0;
	for (int i = 0; i<=date_array.length;i++)
	{
		if (i == 0) month = Integer.parseInt(date_array[i]);
		if (i == 1) day = Integer.parseInt(date_array[i]);
		if (i == 2) year = Integer.parseInt(date_array[i]);
	} 
	java.util.Calendar cal = java.util.Calendar.getInstance();
	cal.clear();
	cal.set(year, month-1, day);
	java.util.Date good_date = cal.getTime();
	String formatted_date = java.text.DateFormat.getDateInstance(java.text.DateFormat.LONG).format(good_date);
%>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var path = "";
// -------------------------------------------------------------------
// hasOptions(obj)
//  Utility function to determine if a select object has an options array
// -------------------------------------------------------------------
function hasOptions(obj) {
	if (obj!=null && obj.options!=null) { return true; }
	return false;
	}
		
// -------------------------------------------------------------------
// sortSelect(select_object)
//   Pass this function a SELECT object and the options will be sorted
//   by their text (display) values
// -------------------------------------------------------------------
function sortSelect(obj) 
{
	var o = new Array();
	if (!hasOptions(obj)) { return; }
	for (var i=0; i<obj.options.length; i++) 
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;

	if (o.length==0) { return; }
	o = o.sort( 
		function(a,b) 
		{ 
			if ((a.text+"") < (b.text+"")) { return -1; }
			if ((a.text+"") > (b.text+"")) { return 1; }
			return 0;
		} 
	);

	for (var i=0; i<o.length; i++) 
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
}

function isPresent(obj, text)
{
	if (!hasOptions(obj)) { return false; }
	for(var i=0; i< obj.options.length; i++)
	{
		if(obj.options[i].text == text)
			return true;
	}
	return false;
}

function addAgent(text, value)
{
	if(!isPresent(document.getElementById("search_box"), text))
	{
		myOption = new Option(text,value);
		optionPos = document.getElementById("search_box").options.length;
		document.getElementById("search_box").options[optionPos]=myOption;
	}
}

function setPath(value)
{
	path = value;
}

function selectAgent()
{
	top.frames.mainFrame.location.href = path+"#"+document.getElementById("search_box").value;
}

function submitForm(close_window, publish, unpublish)
{
	document.getElementById('confirm_msg').innerHTML='';
	
	if(close_window)
		top.frames.mainFrame.document.TraitementProdTime.close.value = "1";
	else
		top.frames.mainFrame.document.TraitementProdTime.close.value = "0";

	if(top.frames.mainFrame.modified)
		valid = top.frames.mainFrame.validateData();
	else
		valid = true;
		
	if(publish)
	{
		top.frames.mainFrame.document.TraitementProdTime.Publish.value = "1";
		top.frames.mainFrame.modified = true;
	}
	else
		top.frames.mainFrame.document.TraitementProdTime.Publish.value = "0";
		
	if(unpublish)
	{
		top.frames.mainFrame.document.TraitementProdTime.UnPublish.value = "1";
		top.frames.mainFrame.modified = true;
	}
	else
		top.frames.mainFrame.document.TraitementProdTime.UnPublish.value = "0";

	if(valid)
	{
		if(top.frames.mainFrame.modified)
			top.frames.mainFrame.document.TraitementProdTime.submit();
		else if(close_window)
			top.window.close();
		if(!unpublish)
			document.getElementById('confirm_msg').innerHTML = +'<%=pageData.getWord("Save successful")%>'+.fontcolor('green');
	}
	else
	{
		document.getElementById('confirm_msg').innerHTML = +'<%=pageData.getWord("Errors during save")%>'+.fontcolor('red');
		
	}
	document.getElementById('confirm_msg').innerHTML=document.getElementById('confirm_msg').innerHTML.bold();
}

function validatePassword()
{
	top.frames.mainFrame.showPasswordDialog();
}

function doPublishOrUnPublish()
{
	if(document.getElementById("UnPublish").style.visibility == "visible")
		submitForm(false, false, true);
	else
		submitForm(false, true, false);
}

</script>
</head>
<body>
<table border="0" width="86%">
	<tr>
		<td align="left">
			<%=pageData.getWord("Search")%> <select id="search_box" name="search_box" onChange="selectAgent();" style="width:82mm ">
			<option value="0"></option>
			</select>
		</td>
		<td width="15%" id="confirm_msg" align="center"></td>
		<td align="left">
<script>document.write("<input style=\"visibility:hidden;\" name=\"Send\" type=\"button\" value=\""+"<%=pageData.getWord("Save")%>"+"\" onClick=\"submitForm(false, false, false);\">")</script>&nbsp;&nbsp;
<script>document.write("<input style=\"visibility:hidden;\" name=\"SendClose\" type=\"button\" value=\""+"<%=pageData.getWord("Save & Close")%>"+"\" onClick=\"submitForm(true, false, false);\">")</script>&nbsp;&nbsp;
<script>document.write("<input style=\"visibility:hidden;\" name=\"Publish\" type=\"button\" value=\""+"<%=pageData.getWord("Publish")%>"+"\" onClick=\"validatePassword();\">")</script>&nbsp;&nbsp;			
<script>document.write("<input style=\"visibility:hidden;\" name=\"UnPublish\" type=\"button\" value=\""+"<%=pageData.getWord("Unpublish")%>"+"\" onClick=\"validatePassword();\">")</script>&nbsp;&nbsp;

		</td>
	</tr>
</table>
<table width="350" border="0" align="center">
	<tr>
		<td align="center" class="reportsID">
			<b><%=pageData.getWord("Agent login")%> VS <%=pageData.getWord("Time")%><br>
			<%=pageData.getWord("for")%><%=formatted_date%></b>
		</td>
	</tr>
</table>

  <table id="tblProduction" border="1" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse:collapse ">
    <tr class="reportsTab"> 
      <td width="41" height="80" align="center"><b><%=pageData.getWord("Agent ID")%></b></td>
      <td width="48" align="center"><b><%=pageData.getWord("Agent")%></b></td>
      <td width="187" align="center"><b><%=pageData.getWord("Agent name")%></b></td>
      <td width="100" align="center"><b><%=pageData.getWord("Campaign")%></b></td>
      <td width="100" align="center"><b><%=pageData.getWord("Scheduled time")%></b></td>
      <td width="70" align="center"><b><%=pageData.getWord("First login")%>&nbsp; <%=pageData.getWord("Time")%></b></td>
      <td width="70" align="center"><b><%=pageData.getWord("Last Logout")%>&nbsp; <%=pageData.getWord("Time")%></b></td>
      <td width="70" align="center"><b><%=pageData.getWord("Total login time")%><br><%=pageData.getWord("Login - Lunch - Bath")%></b></td>
      <td width="70" align="center"><b><%=pageData.getWord("Production time")%></b></td>
      <td width="70" align="center"><b><%=pageData.getWord("In integration")%></b></td>
      <td width="70" align="center"><b><%=pageData.getWord("Acknowledge")%></b></td>
<!--      <td width="70" align="center"><b>Comments</b></td>
      <td width="150" align="center"><b>Break Time</b></td>-->
    </tr>
  </table>

</body>
</html>
<%
pageData.closeConnection();
%>