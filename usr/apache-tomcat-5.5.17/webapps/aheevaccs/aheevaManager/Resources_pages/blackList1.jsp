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
<LINK href="style.css" rel="stylesheet" type="text/css" >
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />

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
<script language="JavaScript">

</script>
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
/*	background:	ThreeDFace; */

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



function enableSubmitButton()
{
	document.getElementById("createBlacklist").disabled = false;
}


function displayBlacklistInfo()
{
	tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	blacklist_dbid = normalizeString(QueryString('blacklist_dbid'));
	blacklist_name = normalizeString(QueryString('blacklist_name'));
	
	if (blacklist_name.length != 0)
	{
		document.theForm.blacklistname.value = blacklist_name;
		document.theForm.blacklistname.disabled = true;
		document.getElementById("createBlacklist").disabled = true;
	}
	
	
}

function askDelete()
{
	answer = confirm("<%= pageData.getWord("Are you sure, you wish to delete this do-not-call list ?")%>");
	blacklist_dbid = normalizeString(QueryString('blacklist_dbid'));	
	if(answer)
	{
		appletObj.deleteBlacklistGroup(blacklist_dbid,document.theForm.blacklistname.value);
		// Reload the left menu
		window.top.main.left.location.reload();	
		// refresh the current page
		document.location = "../defaultpage.htm";
	}
}

function isAlphaNumeric(val){
	if (val.match(/^[a-zA-Z0-9\-\_]+$/)){
		return true;
	}else{
		return false;
	} 
}


function createBlacklistGroup()
{
	var alReadyExist = false;
	if(!isAlphaNumeric(document.theForm.blacklistname.value)){
		alert("<%= pageData.getWord("Invalid use of character")%>");
		document.theForm.blacklistname.value = '';
		document.theForm.blacklistname.focus();	
		return;			
	}

	var blacklistGroups = String(appletObj.getBlacklistGroups(tenant_dbid));

	jsBlacklistGroups = blacklistGroups.split("|");
	//alert(blacklistGroups);
	
	for(var q = 0; q < jsBlacklistGroups.length; q++)
	{
		var cur_blacklist = jsBlacklistGroups[q].split("^");
		if(document.theForm.blacklistname.value == cur_blacklist[1]) //le groupe existe deja						
		{
			alert("<%= pageData.getWord("This group name already exists. Please change the name of your group !")%>");
			document.theForm.blacklistname.value = '';
			alReadyExist = true;
			break;
		}							
	}
	
	if (!alReadyExist)
	{
		appletObj.createBlacklistGroup(tenant_dbid, document.theForm.blacklistname.value);
		document.theForm.blacklistname.value = '';
		document.getElementById("createBlacklist").disabled = true;
	}
	else
	{
		return;
	}

	//document.location.href = "../defaultpage.htm";
	
}

</script>
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

<body class="no_call_body" onload="displayBlacklistInfo()">
<br />
<DIV ID="Description" STYLE="position:absolute; top:5px; left:5px; visibility:hide; z-index:1; background-color:#FFFFCC;"></DIV>

<div class="dynamic-tab-pane-control">
	<div class="tab-pane" id="tabPane1">
	
		
		<div class="tab-page" id="general"> 
      <fieldset>
      <legend> 
      <%=pageData.getWord("Do-not-call list name")%>
      </legend>
      <form name="theForm" onKeyDown="KeyDownHandler(save)">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
          <tr> 
            <td style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1"
							colspan="5">&nbsp;</td>
          </tr>
          <tr> 
            <td width="280" height="26" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1"> 
              <%=pageData.getWord("Enter a name for the new do-not-call list")%></td>
            <td width="224" height="22" align="left"> <input type="text" id="blacklistname" name="blacklistname" size="30" onclick="enableSubmitButton();"/> 
            </td>
          </tr>
          <tr height="40"> </tr>
        </table>
      </form>
      </fieldset>
    </div>
 	  <div>
	  	 <table width="182">	
			<tr>
				<td width="165" height="40" style="border-right-style: none; border-right-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" align="left" valign="top">
								
								<input name="createBlacklist"  id="save" type="button" value='<%=pageData.getWord("Save")%>' onClick="createBlacklistGroup()">
								<script>
								if(normalizeString(QueryString('blacklist_dbid')).length != 0)
								document.write("<input name=\"deleteBlacklist\" id =\"delete\" type=\"button\" value='<%=pageData.getWord("Delete")%>' onClick=\"askDelete()\" >");
								else
								document.write("<input name=\"deleteBlacklist\" id =\"delete\" type=\"button\" value='<%=pageData.getWord("Delete")%>' onClick=\"askDelete()\" disabled>");
								
								
								</script>   			
				</td>
				<td style="border-left-style: none; border-left-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">
				</td>
				<td style="border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1">
				</td>
			</tr>
  	    </table>	
	  </div>
   </div>
</div>
  

</body>
<% pageData.closeConnection(); %>
</html>
