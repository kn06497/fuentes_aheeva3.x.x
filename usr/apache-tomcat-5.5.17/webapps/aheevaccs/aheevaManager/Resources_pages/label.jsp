<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	LabelDetail LabelDetail ;
	
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	boolean newLabel = false;

	String tenantDbid = request.getParameter("tenant_dbid");
	String LabelDbid = (request.getParameter("dbid") == null)?"":request.getParameter("dbid");
	String LabelDetailHTML = "";
	int labDetNum = 1;
	
	
	Label vLabel = new Label();
	String saveString = (request.getParameter("saveString") == null)?"":request.getParameter("saveString");

	if(saveString.equals("1"))
	{
		String state = (request.getParameter("state")==null)?"0":request.getParameter("state");
		saveString =LabelDbid+"^"+tenantDbid+"^"+request.getParameter("labelName")+"^"+request.getParameter("labelDesc")+"^"+state+"|";
		labDetNum = new Integer(request.getParameter("labDetNum")).intValue();
		for(int i =1;i<=labDetNum;i++)
		{
			if(request.getParameter("labDetName"+i) != null)
			{
				saveString += request.getParameter("labDetId"+i)+"^"+request.getParameter("labDetName"+i)+"^"+request.getParameter("labDetDesc"+i)+"^"+request.getParameter("fromPrc"+i)+"^"+request.getParameter("toPrc"+i)+"^";
			}
		
		}
		LabelDbid = vLabel.saveData(saveString);
		%>
		<script>window.top.main.left.location.reload();</script>
		<%
	}
	
	if(saveString.equals("2"))
	{
		vLabel.deleteLabelsList(LabelDbid);
		LabelDbid = "";
		%>
		<script>window.top.main.left.location.reload();</script>
		<%
	}

	if(LabelDbid.equals(""))
	{
		vLabel = new Label();
		newLabel = true;
	}
	else
	{
		vLabel = new Label(LabelDbid);
	}

	
	if(vLabel.getLabelDetail().size() == 0)
	{
		LabelDetailHTML ="<tr>"+
		                    "<td><input type='hidden' name='labDetId1'></td>"+
		                    "<td>"+pageData.getWord("Name")+"</td>"+
		                    "<td><input type='text' name='labDetName1' size='27' value='' onChange='enableUpdateButton()'></td>"+
		                    "<td>"+pageData.getWord("Description")+"</td>"+
		                    "<td><input type='text' name='labDetDesc1' size='27' value='' onChange='enableUpdateButton()'></td>"+
		                    "<td>"+pageData.getWord("From %")+"</td>"+
		                    "<td><input type='text' name='fromPrc1' size='5' value='' onChange='enableUpdateButton()' onBlur='validateLabel(this)'></td>"+
		                    "<td>"+pageData.getWord("To %")+"</td>"+
		                    "<td><input type='text' name='toPrc1' size='5' value='' onChange='enableUpdateButton()' onBlur='validateLabel(this)'></td>"+
		                    "<td><img src='../img/delete2.gif' onclick='deletelabDetRow(this)'/></td>"+
		                 "</tr>";
	}
	else
	{
		labDetNum = vLabel.getLabelDetail().size();
		for(int i=0;i < vLabel.getLabelDetail().size();i++)
		{
			LabelDetail = vLabel.getLabelDetail().get(i);
			LabelDetailHTML +="<tr>"+
			                     "<td><input type='hidden' name='labDetId"+(i+1)+"' value='"+LabelDetail.getDbid()+"'></td>"+
			                     "<td>"+pageData.getWord("Name")+"</td>"+
			                     "<td><input type='text' name='labDetName"+(i+1)+"' size='27' value='" + LabelDetail.getName() + "' onChange='enableUpdateButton()'></td>"+
			                     "<td>"+pageData.getWord("Description")+"</td>"+
			                     "<td><input type='text' name='labDetDesc"+(i+1)+"' size='27' value='"+LabelDetail.getDescription()+"' onChange='enableUpdateButton()'></td>"+
			                     "<td>"+pageData.getWord("From %")+"</td>"+
			                     "<td><input type='text' name='fromPrc"+(i+1)+"' size='5' value='"+LabelDetail.getFrom_prc()+"' onChange='enableUpdateButton()' onBlur='validateLabel(this)'></td>"+
			                     "<td>"+pageData.getWord("To %")+"</td>"+
			                     "<td><input type='text' name='toPrc"+(i+1)+"' size='5' value='"+LabelDetail.getTo_prc()+"' onChange='enableUpdateButton()' onBlur='validateLabel(this)'></td>"+
			                     "<td><img src='../img/delete2.gif' onclick='deletelabDetRow(this)'/></td>"+
		                      "</tr>";
		}
	}
	
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	String userPrivilegesQuery  = "SELECT * FROM cfg_user WHERE DBID='"+CURRENT_USER_DBID+"'";

	Vector <HashMap> userPrivilegesDataResult = pageData.executeFromStringToVector(userPrivilegesQuery);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<LINK href="style.css" rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="xc2_default.css" type="text/css">
<meta http-equiv="Content-Language" content="en-us">
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {

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
	background: trlabparent;
}

.hide {
	visibility:hidden;
}
</style>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="labelFunction.js"></script>
<script language="javascript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>

<script type="text/javascript" src="slider/js/range.js"></script>
<script type="text/javascript" src="slider/js/timer.js"></script>
<script type="text/javascript" src="slider/js/slider.js"></script>


<script language="javascript" type="text/javascript">
  var tenant_dbid = "<%=tenantDbid%>";
  var newLabel = <%=newLabel%>;
  var labelDbid = "<%=LabelDbid%>";
  var labDetNum = "<%=labDetNum%>";
  var lbl_desc  = "<%=pageData.getWord("Description")%>";
  var lbl_name  = "<%=pageData.getWord("Name")%>";
  var lbl_notnulldesc  	= "<%=pageData.getWord("Description should not be empty")%>";
  var lbl_notnullname  	= "<%=pageData.getWord("Name should not be empty")%>";
  var lbl_invalidnumber	= "<%=pageData.getWord("Invalid number")%>";
  var label_alert = "<%=pageData.getWord("Are you sure you wish to delete this label?")%>";
  var label_list_alert = "<%=pageData.getWord("Are you sure you wish to delete this labels list?")%>";
  var lbl_fromprc  = "<%=pageData.getWord("From %")%>";
  var lbl_toprc  = "<%=pageData.getWord("To %")%>";
  var lbl_fromprcnotnull  	= "<%=pageData.getWord("From % not null")%>";
  var lbl_toprcnotnull  	= "<%=pageData.getWord("To % not null")%>";
  var lbl_alert_integer  = "<%=pageData.getWord("You should enter a number")%>";
  var lbl_labunique		 = "<%=pageData.getWord("Another labels list with the same name exists")%>";
  var lbl_overlapping	= "<%=pageData.getWord("Overlapping percentages between different labels. Are you sure you want to continue?")%>";
</script>


<SCRIPT language="JavaScript">
<!--
if (document.images)
{
  pic1= new Image(90,25); 
  pic1.src="../img/add.gif"; 

  pic2= new Image(94,25); 
  pic2.src="../img/tab.active.gif"; 

  pic3= new Image(90,25); 
  pic3.src="../img/tab.hover.gif"; 
}
//-->
</SCRIPT>

<script language="javascript">
    // Associate a default button with pressing the Enter key
	function KeyDownHandler(btn)
    {
        // process only the Enter key
        if (event.keyCode == 13)
        {
            // cancel the default submit
            event.returnValue=false;
            event.cancel = true;
            // submit the form by programmatically clicking the specified button
            btn.click();
        }
    }
</script>

</head>
<body class="bottompagebody">
<div class="tab-pane" id="tabPane1">
<form name="formul" method="post" action="" onKeyDown="KeyDownHandler(save)">
<script type="text/javascript">
   tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
<div class="tab-page" id="tabGeneral">
	<h2 class="tab"><%=pageData.getWord("General")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
	<fieldset>
	<legend><%=pageData.getWord("General information")%></legend>
	<table border="0">
		<tr>
			<td><%=pageData.getWord("Name")%></td>
			<td>
				<input type="text" name="labelName" size="27"	value="<%=vLabel.getName()%>"  onChange="enableUpdateButton()">
			</td>
		</tr>
		<tr>
			<td><%=pageData.getWord("Description")%></td>
			<td>
				<input type="text" name="labelDesc" size="27" value="<%=vLabel.getDescription()%>"  onChange="enableUpdateButton()">
			</td>
		</tr>
		<tr>
			<td align="left">
				<%=pageData.getWord("Active")%>
			</td>
			<td align="left">
			<input type="checkbox" name="state" onClick="enableUpdateButton()" <%=((vLabel.getState()).compareTo("1")==0)?"checked":""%> value="1">
			</td>
		</tr>
	</table>
	</fieldset>
</div>

<div class="tab-page" id="tabLabelDetail">
	<h2 class="tab"><%=pageData.getWord("Label details")%></h2>
	<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabLabelDetail" ) );</script>
	<fieldset>
		<legend><%=pageData.getWord("Label details information")%></legend>
		<table>
		<tr>
			<td>
				<table border="0" id="LabelDetailId">
					<%=LabelDetailHTML%>			
				</table>
			</td>
		</tr>
		<tr>
			<table>
				<tr onclick='addlabelDetail()'>
					<td><%=pageData.getWord("Add Label")%></td>
					<td><img src='../img/add.gif'></td>
				</tr>
			</table>
		</tr>
	</table>
	</fieldset>
</div>


<input disabled name="updateInfo" type="button" value="<%=pageData.getWord("Save")%>" onClick="validateInfo()" id="save">
<input name="deletelabDet" type="button" value="<%=pageData.getWord("Delete")%>" onClick="askDelete()" <%=newLabel ? "disabled" : ""%>>
</form>
</div>
</body>
</html>

<%
pageData.closeConnection();
%>