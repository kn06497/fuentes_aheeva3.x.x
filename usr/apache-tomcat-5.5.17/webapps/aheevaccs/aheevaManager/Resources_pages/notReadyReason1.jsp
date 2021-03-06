<html>
<head>
	<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<LINK href="style.css" type=text/css rel=stylesheet >
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv=Content-Language content=en-us>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language=JavaScript src="jsUtil.js"></script>
<script language=javascript src="Browser.js" type=text/javascript></script>

<script language=javascript type=text/javascript>
var NRR_DBID       	= '';
var NRRName          	= '';
var notReadyReasonName		= '';
var tenant_dbid		= "NULL";

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


/***********************************************************************
************************************************************************/

function displayNRRInfo()
{
	var notReadyReasonName;

	tenant_dbid = normalizeString(QueryString('tenant_dbid'));
	notReadyReasonName   = normalizeString(QueryString('NRR_name'));
	//ourCaption  = document.getElementById("caption");

	if(notReadyReasonName == '')
	{
		//ourCaption.innerHTML = "<h3>Add new Not Ready Reason</h3>";
		document.getElementById("updateInfo").value = "<%= pageData.getWord("Save")%>";
		document.getElementById("deleteNRR").disabled = true;
	}
	else
	{
		//ourCaption.innerHTML = "<h3>Modify Not Ready Reason</h3>";
		document.getElementById("NRRName").value = notReadyReasonName;
		
		var NRRDetails  =  String( appletObj.getNotReadyReasonInfo(notReadyReasonName) );
		//alert(NRRDetails);
		// parse info received
		var jsDetails = NRRDetails + "";
		arrayDetails = jsDetails.split("|");

		for (i = 0; i <arrayDetails.length; i++)
		{
			if(i == 0) // DBID
			{
				
				NRR_DBID = arrayDetails[i];
				//alert("id = "+ NRR_DBID);
				//document.getElementById("NRRId").value = NRR_DBID;
			}
			if(i == 1) //State
			{
				if(arrayDetails[i] == '1')
				{
					document.getElementById("deleteNRR").disabled = false;
					document.getElementById("state").checked = true;
				}
				else
				{
					document.getElementById("deleteNRR").disabled = false;
					document.getElementById("state").checked = false;
				}
			}
			if (i == 2)//global
			{
				if (arrayDetails[i] == '1')
					document.getElementById("globalNRR").checked = true;
				else
					document.getElementById("globalNRR").checked = false;
			}
			if (i == 3)// in_productivity
			{
				if (arrayDetails[i] == '1')
					document.getElementById("in_productivity").checked = true;
				else
					document.getElementById("in_productivity").checked = false;
			}
		}
	//updateStatisticsOptions();
	}
}


/***********************************************************************
************************************************************************/

function validateInfo()
{
	var	notReadyReasonName   = normalizeString(QueryString('NRR_name'));
	// Verify that the schedule name is set

	if (document.getElementById("NRRName").value == '')
	{
		alert("<%= pageData.getWord("You must enter a not ready reason name")%>");
	}
	else if(validation(document.getElementById("NRRName").value)==0)
	{
		alert("<%= pageData.getWord("Invalid use of character")%>");
		document.getElementById("NRRName").focus();
	}
	else if(document.getElementById("NRRName").value.length > 17 ){//NRR exceeds the Starphone maximal value of 17
		alert("<%= pageData.getWord("NRR Too Long")%>");
	}
	else
	{
		var alReadyExist = false;
		var reasons = String( appletObj.getAllNotReadyReasons(tenant_dbid) );
		jsReasons = reasons.split("|");

			for(var q = 0; q < jsReasons.length; q++)
			{
				thisReason = jsReasons[q];
				thisReasonArray = thisReason.split(",");

				if( document.getElementById("NRRName").value == thisReasonArray[1] && notReadyReasonName != document.getElementById("NRRName").value) //la reason existe deja
				{
					alReadyExist = true;
					break;
				}
			}
		if(alReadyExist)
			alert("<%= pageData.getWord("Not ready reason already exists!")%>");
		else
		{
			appletObj.saveNotReadyReason(	NRR_DBID,
											tenant_dbid,
											document.getElementById("NRRName").value,
											document.getElementById("state").checked == true ? '1':'0',
											document.getElementById("globalNRR").checked == true ? '1':'0',
											document.getElementById("in_productivity").checked == true ? '1':'0'
											);

/*
			NRR_DBID = String(appletObj.getNRRDbidByName(document.getElementById("NRRName").value));
			//alert("#NRRDbid = " + NRR_DBID);

			if (document.getElementById("globalNRR").checked == true)
			{
				// Lire tous les dbid des agents groups existants
				var allAgentGroups = String(appletObj.getAgentGroups()) + "";
				//alert("agtgroup = " + allAgentGroups);
				var jsAllAgentGroups = allAgentGroups.split("|");
				for (i = 0; i < jsAllAgentGroups.length; i++)
				{
					var curAgentGroupInfo = jsAllAgentGroups[i];
					//alert("cur Agt grp = "+ curAgentGroupInfo)
					var jsCurAgentGroupInfo = curAgentGroupInfo.split(",");
					var group_id = jsCurAgentGroupInfo[0];
					//alert(group_id);
					// verifier l existence de l'association de chaque agt_group avec le nrr actuel dans le systeme
					var assocExist = Boolean(appletObj.getAssocAgentGroupNRR(NRR_DBID, group_id));
					// alert("asoc exist = " + assocExist);
					// si cette association n'existe pas, la creer
					if (assocExist == false)
						//alert(assocExist);
						appletObj.addGlobalReasonToGroup(document.getElementById("NRRName").value, group_id);
				}
			}
*/			

			document.getElementById("updateInfo").disabled=true;	// reset the button to disabled
			document.location.href = "../defaultpage.htm";
		}
	}
}


/***********************************************************************
************************************************************************/

function askDelete()
{
	answer = confirm("<%= pageData.getWord("Are you sure, you wish to delete this Reason? This can affect your reports!")%>");
	if(answer)
	{
		appletObj.deleteNotReadyReason(NRR_DBID);
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
	<body class="no_ready_body" onLoad="displayNRRInfo()"><!--  onUnload=" return checkOnUnload()" -->
	<div class="dynamic-tab-pane-control">
		<div class="tab-pane" id="tabPane1">
				
    <div class="tab-page" id="general"> 
      <fieldset>
      <legend> 
      <%= pageData.getWord("General")%> 
      </legend>
      <form name="theForm" onKeyDown="KeyDownHandler(Button3)">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
          <tr> 
            <td width='40%' height=25><b> 
              <%= pageData.getWord("Not ready reason name")%>
              </b></td>
            <td align=left width='60%' height=25> <input id="NRRName" type=text onChange="enabledUpdateButton()" onClick="enabledUpdateButton()" size=20 name="NRRName"> 
            </td>
          </tr>
          <tr> 
            <td width='40%' height="25"></td>
            <td></td>
          </tr>
          <tr> 
            <td width='40%' height=25><b> 
               <%= pageData.getWord("Active")%>
              </b> <input id="state" onClick="/*enableReload();*/ enabledUpdateButton()" type="checkbox" checked value="ON" name="state"> 
              &nbsp;&nbsp;<b> 
              <%= pageData.getWord("Global")%>
              </b> <input id="globalNRR" onClick="/*enableReload();*/ enabledUpdateButton()" type="checkbox" checked  value="ON" name="globalNRR"> 
            </td>
            <td></td>
          </tr>
          <tr> 
            <td width='40%'> <b> 
               <%= pageData.getWord("Use this not ready reason in productivity")%>
              </b> <input id="in_productivity" onClick="/*enableReload();*/ enabledUpdateButton()" type="checkbox" checked value="ON" name="in_productivity"> 
            </td>
            <td></td>
          </tr>
          <tr> 
            <td height="10"></td>
            <td></td>
          </tr>
        </table>
      </form>
      </fieldset>
    </div>
			</div>
		</div>
		<table border="0" height="40" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td align="left" width="100%">
					<button id=Button3 style="WIDTH: 85px; HEIGHT: 20px" disabled onclick=validateInfo() name=updateInfo type=button> <%= pageData.getWord("Update")%></button> &nbsp;&nbsp;
					<button id=Button4 style="WIDTH: 85px; HEIGHT: 20px" onclick=askDelete()  name=deleteNRR type=button > <%= pageData.getWord("Delete")%></button>
				</td>
			</tr>
		</table>

</body>
<% pageData.closeConnection(); %>
</html>
