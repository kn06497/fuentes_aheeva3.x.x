<html>
<head>


<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<title>Add an Activity1</title>


<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();

%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" type=text/css rel=stylesheet >
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv=Content-Language content=en-us>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language=JavaScript src="jsUtil.js"></script>
<script language=javascript src="Browser.js" type=text/javascript></script>

<script language=javascript type=text/javascript>
/*
var NRR_DBID       	= '';
var NRRName          	= '';
var notReadyReasonName		= '';
var tenant_dbid		= "NULL";
*/
function enabledUpdateButton()
{
	document.getElementById("updateInfo").disabled = false;
}

function checkOnUnload()
{
	//document.nrr.updateInfo.disabled = false;
}

function enableReload()
{
   appletObj.fReloadMenu = true;
}

function displayActivityInfo()
{
	var activityName;

	tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	activity_dbid = normalizeString(QueryString('activity_dbid'));   //activity_dbid="+anActivity[0]+"
	activityName   = normalizeString(QueryString('activity_name'));
	
	if(activityName == '' || activityName == 'null')
	{
		document.getElementById("updateInfo").value = "<%= pageData.getWord("Save")%>";
		
		//document.getElementById("deleteActivity").disabled = true;
	}
	else
	{
		document.getElementById("activity_name").value = activityName;
		document.getElementById("updateInfo").disabled = false;
		document.getElementById("activity_dbid").value = activity_dbid;
		//document.getElementById("deleteActivity").disabled = false;
	}

}


function validateInfo()
{
	var can_save = true, 
		activity_name = document.getElementById("activity_name").value;
		
	if(activity_name.length == 0){
		alert('<%= pageData.getWord("Activity name cannot be null")%>');	
		document.getElementById("activity_name").focus();	
		return;
	}
	
	// Verify if Activity name contains spaces only
	
	if(allSpaces(activity_name) == '0')
	{
		alert('<%= pageData.getWord("The activity name cannot be all space(s)")%>');
		return;
	}		
		
	var activities = appletObj.getActivities() + "";
	
	var jsActivities = activities.split("|");
	
	for (var i = 0; i < jsActivities.length; i++)
	{
		var one_activity = jsActivities[i].split("^");
		
		if ( (activity_name == one_activity[1]) && (one_activity[2] == tenant_dbid)  )
		{
			can_save = false;
			break;
		}
	}
	
	if (can_save == true)
	{
		if (document.getElementById("updateInfo").value == "Save")
		{

			if ((validation(activity_name) != 0))
			{
				appletObj.saveActivity(tenant_dbid, activity_name);
				document.location = "./Activity1.jsp?tenant_dbid="+tenant_dbid;
				enableReload();
			}
			else
			{
				alert("<%= pageData.getWord("Invalid use of character")%>");
				return ;		
			}

		}
		else
		{
			if ((validation(activity_name) != 0))
			{
				var values = document.getElementById("activity_dbid").value + "^" + activity_name;
				appletObj.modifyActivity(values);
				document.location = "./Activity1.jsp?tenant_dbid="+tenant_dbid;
				enableReload();
			}
			else
			{
				alert('<%= pageData.getWord("Invalid use of character")%>');
				return ;		
			}
		}
	}
	else
	{
		
		alert("<%= pageData.getWord("This activity already exists. Please choose another name !")%>");
		document.getElementById("activity_name").value = "";
	}
}




/***********************************************************************
************************************************************************/

function askDelete()
{

	answer = confirm('<%= pageData.getWord("Are you sure, you wish to delete this activity? This can affect your reports!!")%>');
	if(answer)
	{
		if (document.getElementById("activity_name").value != '')
			appletObj.deleteActivity(document.getElementById("activity_name").value);
		// refresh the current page
		document.location = "../defaultpage.htm";
	}
}


</script>

<!--<body BGCOLOR="#C0C0C0" TEXT="#000000" LINK="#000066" VLINK="#666666" onLoad="displayCampaignInfo()" onUnload=" return checkOnUnload()"> -->
<script language=javascript id=clientEventHandlersJS>
<!--
//function Checkbox4_onclick() {}
//-->
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
/*	height:		200px;*/
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

 .dynamic-tab-pane-control.tab-pane {
	position:	relative;
	width:		100%;
	margin-right:	-2px;
/*	height:		200px;*/

}

</style>

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
	<body class="f_i_act_body" onLoad="displayActivityInfo()">
		<div class="dynamic-tab-pane-control">
			<div class="tab-pane" id="tabPane1">
					
    <div class="tab-page" id="general"> 
      <fieldset>
      <legend> 
      <%= pageData.getWord("General")%>
      </legend>
      <form name="theForm" onKeyDown="KeyDownHandler(updateInfo)">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
          <tr> 
            <td width='30%' height=25> <div align="center"> 
               <%= pageData.getWord("Activity name1")%>
                &nbsp;&nbsp; </div></td>
            <td align=left width='70%' height=25> <input id="activity_name" type=text onChange="enabledUpdateButton()" onClick="enabledUpdateButton()" size=30 name="activity_name"> 
              <input type="hidden" id="activity_dbid" name="activity_dbid" value=""> 
            </td>
          </tr>
          <tr> 
            <td width='30%' height="60"></td>
            <td></td>
          </tr>
        </table>
      </form>
      </fieldset>
    </div>
				
			</div>
		</div>
		<table width="100%">
			<tr valign="top">
				<td align="left" width="100%">
					<input disabled  id="updateInfo"  name="updateInfo" type="button" value='<%= pageData.getWord("Update")%>' onClick="validateInfo()">&nbsp;
				</td>
			</tr>
		</table>
</body>
<% pageData.closeConnection(); %>
</html>
