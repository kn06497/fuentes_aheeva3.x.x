<html>
<head>
<title>Record Picker1</title>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
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
<script language="JavaScript"> 

var tenant_dbid = normalizeString(QueryString('tenant_dbid'));
function chkAndAddGroup()
{
    var myForm = document.theForm;
	var o, i;
	var option_len = myForm.availableBlackListGroups.options.length;

	for (i = 0; i < option_len; i++) 
	{
		o = myForm.availableBlackListGroups.options[i];
		if (o.selected)
		{
			myForm.selectedBlackListGroups.options[myForm.selectedBlackListGroups.options.length] = new Option( o.text, o.value, false, false);
		}
	}
	// Delete them from original
	for ( i = (myForm.availableBlackListGroups.options.length-1); i >= 0; i--) 
	{
		o = myForm.availableBlackListGroups.options[i];
		if (o.selected)
		{
			myForm.availableBlackListGroups.options[i] = null;
			
		}
	}
	myForm.availableBlackListGroups.selectedIndex = -1;
	myForm.selectedBlackListGroups.selectedIndex = -1;
}

function chkAndDropGroup()
{
	var myForm = document.theForm;        
	var tmpTreament='';
	var i;
	var o;
	var option_len = myForm.selectedBlackListGroups.options.length;

	for (i = 0; i < myForm.selectedBlackListGroups.options.length; i++) 
	{
		o = myForm.selectedBlackListGroups.options[i];
		if (o.selected) 
		{
			myForm.availableBlackListGroups.options[myForm.availableBlackListGroups.options.length] = new Option( o.text, o.value, false, false);
		}
	}
	// Delete them from original
	for (i = (myForm.selectedBlackListGroups.options.length-1); i>=0; i--) 
	{
		o = myForm.selectedBlackListGroups.options[i];
		if (o.selected) 
		{
			myForm.selectedBlackListGroups.options[i] = null;
		}
	}

       
	myForm.selectedBlackListGroups.selectedIndex = -1;
	myForm.availableBlackListGroups.selectedIndex = -1;
}

function enabledAddButton()
{
	document.theForm.addButton.disabled = false;
}

function enabledDropButton()
{
	document.theForm.dropButton.disabled = false;
}


function addNumberToBlacklist()
{
	myForm = document.theForm;

	var option_len = myForm.selectedBlackListGroups.options.length;
	var match_type_num = myForm.match_type.value;
	var data = myForm.numbers.value;
	for (i = 0; i < option_len; i++)
	{
		var group_dbid = myForm.selectedBlackListGroups.options[i].value;
		if (data == '')
		{
			alert('<%=pageData.getWord("You must enter a number to put in blacklist(s)")%>');
			myForm.numbers.focus;
			return;
		}
		else  
		{
			if ( !IsNumeric(data))
			{
				alert('<%=pageData.getWord("The number to put in blacklist must be numeric !")%>');
				myForm.numbers.value = '';
				myForm.numbers.focus;
				return;
			}  
			else
			{
				if (match_type_num > 0 )
				{
					appletObj.addNumberToBlacklist(data, match_type_num, group_dbid);
					myForm.numbers.value = '';
					selectObject(document.getElementById("match_type"), "0");
				}
				else
				{
					alert('<%=pageData.getWord("You must select a rule!")%>');
					myForm.numbers.value = '';
					myForm.numbers.focus;
					return;
				}
			}
		}
		
	}
	
	
}


function displayBlacklistInfo()
{
	myForm = document.theForm;
	var blacklistGroups = String(appletObj.getBlacklistGroups(tenant_dbid));
	var jsBlacklistGroups = blacklistGroups + "";
	var arrayBlacklistGroups = jsBlacklistGroups.split("|");
	for (var i = 0; i < arrayBlacklistGroups.length; i++)
	{
		var jsThisBlacklist = arrayBlacklistGroups[i];
		var arrayCurrent = jsThisBlacklist.split("^");
		var dbid = arrayCurrent[0];
		var name = arrayCurrent[1];
		
		myOption = new Option(name,dbid);
		if (name != 'Globals')
		{
			optionPos = myForm.availableBlackListGroups.options.length;
			myForm.availableBlackListGroups.options[optionPos]=myOption;
		}
		else
		{
			optionPos = myForm.selectedBlackListGroups.options.length;
			myForm.selectedBlackListGroups.options[optionPos]=myOption;
		}
	}
}



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

<body class="bottompagebody" onLoad="displayBlacklistInfo()">
<br />
<DIV ID="Description" STYLE="position:absolute; top:5px; left:5px; visibility:hide; z-index:1; background-color:#FFFFCC;"></DIV>

<div class="dynamic-tab-pane-control">
	<div class="tab-pane" id="tabPane1"> 
	
		
    	<div class="tab-page" id="general"> 
      <fieldset>
      <legend> 
      <%=pageData.getWord("Do-not-call lists rules")%>
      </legend>
      <form name="theForm" onKeyDown="KeyDownHandler(save)">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" >
          <tr> 
            <td style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1" colspan="5">&nbsp;</td>
          </tr>
          <tr> 
            <td align="center" width="200" height="26" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1"> 
              <%= pageData.getWord("Do not call numbers when")%> 
            </td>
            <td width="115" height="22" align="left"> <select id="match_type" name="match_type" class="contentText" >
                <option value="0"> -- 
               <%= pageData.getWord("Select")%> -- </option>
                <option value="1">  <%= pageData.getWord("EQUAL TO")%></option>
                <option value="2"><%=pageData.getWord("START WITH")%></option>
				<option value="3"><%=pageData.getWord("END WITH")%></option>
				<option value="4"><%=pageData.getWord("CONTAIN")%></option>
				
              </select> </td>
            <td align="right"><input type="text" id="numbers" name="numbers"></td>
          </tr>
          <tr> 
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr> 
          <tr> 
            <td height="21" align="center"><b> 
             <%= pageData.getWord("Available do-not-call list groups")%>
              </b> </td>
            <td></td>
            <td align="center"><b> 
              <%= pageData.getWord("Selected do-not-call list groups")%>
              </b> </td>
          </tr>
          <tr> 
            <td width="200" height="138" align="center"><select width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="availableBlackListGroups" size="10" multiple onChange="enabledAddButton()">
              </select></td>
            <td width="115" height="138" bordercolordark="#c0c0c0" nowrap align="center"> 
              <p> </p>
              <p> 
                <button name="addButton"  disabled onClick="chkAndAddGroup()" style="WIDTH: 40px; HEIGHT: 26px" type=button> 
                &gt;&gt; </button>
              </p>
              <button name="dropButton" disabled onClick="chkAndDropGroup()" style="WIDTH: 40px; HEIGHT: 26px" type=button> 
              &lt;&lt; </button>
              <p>&nbsp;</p></td>
            <td width="200" height="138" bordercolor="#000000" align="left"> <select width="200" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 200px" name="selectedBlackListGroups" size="10" multiple onChange="enabledDropButton()">
              </select> </td>
          </tr>
          <tr height="25"> </tr>
          <tr> 
            <td style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">&nbsp;</td>
            <td style="border-top-style: none; border-top-width: 1">&nbsp;</td>
            <td style="border-top-style: none; border-top-width: 1" colspan="">&nbsp;</td>
          </tr>
        </table>
      </form>
      </fieldset>
    </div>
 	  <div>
	  	 <table width="182">	
			<tr>
				<td width="165" height="40" style="border-right-style: none; border-right-width: 1; border-bottom-style: none; border-bottom-width: 1; border-top-style:none; border-top-width:1" align="left" valign="top">
						<input id="save" type="button" value='<%=pageData.getWord("Submit")%>' onClick="addNumberToBlacklist()"> 
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
