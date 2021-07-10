<html>
<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<title>Record Picker</title>

<link rel="stylesheet" href="xc2_default.css" type="text/css">
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<%@ include file="xc2_default_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" src="jsUtil.js"></script> 
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" src="xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="xc2_inpage.js"></script>

<!--<LINK href="style.css" rel="stylesheet" type="text/css" />-->
<style type="text/css">

.dynamic-tab-pane-control .contentText{
	font:			12px Tahoma;
	color:			Black;
}
.dynamic-tab-pane-control .tab-page {
	clear:			both;
	border:			1px solid rgb( 145, 155, 156 );
	background:		rgb( 252, 252, 254 );
	z-index:		2;
	position:		relative;
	top:			-2px;

	font:			11px Tahoma;
	color:			Black;

	filter:			progid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)
					progid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);
	
	/* 244, 243, 238 */ 
	/*145, 155, 156 */
	padding:		10px;
}

.dynamic-tab-pane-control .tab-row {
	z-index:		1;
	white-space:	nowrap;
}
 
.dynamic-tab-pane-control .tab-row .tab.selected {
	width:				74px  ;
	height:				18px  ;
	background-image:	url( "tab.active.png" )  ;
	background-repaet:	no-repeat;

	border-bottom-width:	0;
	z-index:		3;
	padding:		2px 0 0px 0;
	margin:			1px -3px -3px 0px;
	top:			-2px;
	font:			11px Tahoma;
}

.dynamic-tab-pane-control .tab-row .tab a {
	font:				11px Tahoma;
	color:				Black;
	text-decoration:	none;
	cursor:				default;
}

.dynamic-tab-pane-control .tab-row .tab.hover {
	font:				11px Tahoma;
	width:				70px;
	height:				16px;
	background-image:	url( "tab.hover.png" );
	background-repaet:	no-repeat;
}
 
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		200px;
}
 
html, body {
	/*background:	ThreeDFace;*/
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
 
 .dynamic-tab-pane-control.tab-pane {
	position:	relative;
	width:		100%;		 
	margin-right:	-2px;	 
	height:		200px;
	
}

</style>
 
<script type="text/javascript" >

var tenant_dbid = normalizeString(QueryString('tenant_dbid'));



function enableSubmitButton()
{
	document.getElementById("createBlacklist").disabled = false;
}





function fillBlacklistComboObj()
{
	var blacklistGroups = String(appletObj.getBlacklistGroups(tenant_dbid));
	jsBlacklistGroups = blacklistGroups.split("|");
	//alert(blacklistGroups);
	for(var q = 0; q < jsBlacklistGroups.length; q++)
	{
		var cur_blacklist = jsBlacklistGroups[q].split("^"); // dbid, name
		myOption = new Option(cur_blacklist[1],cur_blacklist[0]);
		optionPos = document.getElementById("blacklistgroups").options.length
		document.getElementById("blacklistgroups").options[optionPos]=myOption
	}
}


function displayBlacklistContents()
{
	var code = "";
	if (document.getElementById("blacklistgroups").value != '')
	{
		var group_id = document.getElementById("blacklistgroups").value;
		//alert(group_id);
		var group_numbers = appletObj.getNumbersInBlacklist(group_id); //  rule, data
		//alert(group_numbers);
		if (group_numbers.length > 0)
		{
			code += "<table>";
			code += "<tr><td width='30%'><b><%= pageData.getWord("Do not call numbers when")%> ...</b></td><td width='20%'></td><td width='20%'></td><td align='center' width='20%'><%= pageData.getWord("Uncheck to remove")%></td></tr>";
			var numbers = group_numbers.split("|");
			for (var i = 0; i < numbers.length; i++)
			{
				var one_entry = numbers[i].split("^");
				code += "<tr><td></td><td>"+one_entry[1]+"</td><td>"+one_entry[2]+"</td><td align='center'><input type='checkbox' id='ck_"+one_entry[0]+"' name='ck_"+one_entry[2]+"' checked></td></tr>";
			}
			code += "</table>";
		}
		else
		{
			code += "<table><tr><td><%= pageData.getWord("There are no numbers in this do-not-call list")%></td></tr>";
		}
		document.getElementById("contents").innerHTML = code;
		document.getElementById("contents").style.display = '';
	}
}

function removeNumbersFromBlacklist()
{
	var dbid = '';
	var tab = document.getElementsByTagName("input");
	for (i = 0; i < tab.length; i++)
	{
		if (tab[i].id.indexOf("ck") == 0)
		{
			dbid = tab[i].id.substr(3);
			if (tab[i].checked == false)
			{
				appletObj.removeNumberFromBlacklist(dbid);
			}
		}
	}
	document.location = "./viewBlacklistContents1.jsp?tenant_dbid="+tenant_dbid;

}



</script>
</head>

<body class="no_call_act_body" onload="fillBlacklistComboObj()">
<br />
<DIV ID="Description" STYLE="position:absolute; top:5px; left:5px; visibility:hide; z-index:1; background-color:#FFFFCC;"></DIV>

<div class="dynamic-tab-pane-control">
	<div class="tab-pane" id="tabPane1"> 
	
	
    	<div class="tab-page" id="general"> 
      <fieldset>
      <legend> 
		<%=pageData.getWord("Select a do-not-call list name")%>
      </legend>
      <form name="theForm">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
          <tr> 
            <td style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" colspan="5">&nbsp;</td>
          </tr>
          <tr> 
            <td width="278" height="26" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1"> 
              <%= pageData.getWord("Select a do-not-call list")%></td>
            <td width="231" height="22" align="left"> <select id="blacklistgroups" name="blacklistgroups">
                <option value=""> -- 
                 <%= pageData.getWord("Select")%>
                -- </option>
              </select> </td>
            <td width="350"><input type="button" value='<%= pageData.getWord("View contents")%>' onClick="displayBlacklistContents()">
            </td>
            <td width="389"><input type="button" value='<%= pageData.getWord("Remove unchecked numbers")%>' onClick="removeNumbersFromBlacklist()">
            </td>
          </tr>
          <tr height="40"> </tr>
        </table>
      </form>
      </fieldset>
      <fieldset id="contents" style="display:none">
      --> 
      </fieldset>
    </div>
   </div>
</div>
  
</body>
<% pageData.closeConnection(); %>
</html>
