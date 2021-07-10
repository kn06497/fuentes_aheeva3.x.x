<html>

<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>

<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link type="text/css" rel="StyleSheet" href="slider/css/luna.css" />
<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
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
</style>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript">
var filterName          = '';
var filterDBID 		= '';
var tenant_dbid 	= "NULL"


function enabledUpdateButton()
{
	document.filter.updateInfo.disabled = false;
}

function enableReload()
{
      appletObj.fReloadMenu = true;
}

function displayFilterInfo()
{
    ourCaption   	= document.getElementById("caption");
	filterName   	= normalizeString(QueryString('filter_name'));
	tenant_dbid 	= normalizeString(QueryString('tenant_dbid'));
	var myForm   	= document.filter;
        //alert('filterName:');

	if (filterName== '')
	{
		ourCaption.innerHTML = "<%= pageData.getWord("Add a new filter")%>";
		//document.getElementById("deleteAgt").disabled=true;
		document.filter.updateInfo.value = "<%= pageData.getWord("Save")%>";
		
	}
	else
	{
                //alert('In else:');
		ourCaption.innerHTML = "<%= pageData.getWord("Modify existing filter information")%>";
   		document.filter.filterName.value = filterName;
                var filterDetails =  String( appletObj.getFilterInfo(filterName) );

        // parse info received
        var jsDetails = filterDetails + "";
        arrayDetails = jsDetails.split("|");
        //alert(arayDetails);

	   	for (i = 0; i <arrayDetails.length; i++)
	   	{
			if(i == 0){
				filterDBID = arrayDetails[i];
			}else if(i == 1){ // description
				document.filter.filterDescription.value		= arrayDetails[i];
			}else if(i == 2) { // where
				document.filter.filterWhereClause.value 	= arrayDetails[i];
			}else if(i == 3) { // order by clause
				document.filter.filterOrderByClause.value	= arrayDetails[i];
			}else if (i == 4) { // state
				if(arrayDetails[i] == '1')
					document.filter.filterState.checked = true;
				else
					document.filter.filterState.checked = false;
			}
	  	}

        }

}

function validateInfo()
{
	var state = '';
    // Verify that the filter name is set
    if (document.filter.filterName.value =='')
    	alert ("<%= pageData.getWord("You must enter a FILTER NAME")%>");
    else if(document.filter.filterWhereClause.value.length==0 && document.filter.filterOrderByClause.value.length==0)
        alert ("<%= pageData.getWord("You must enter a criteria or order by clause")%>");
	else if(validation(document.filter.filterName.value)==0)
	{
		alert ("<%= pageData.getWord("Invalid use of character")%>");
		document.filter.filterName.focus();
	}
	else if(validation(document.filter.filterDescription.value)==0)
	{
		alert ("<%= pageData.getWord("Invalid use of character")%>");
		document.filter.filterDescription.focus();	
	}
	else if(validation(document.filter.filterWhereClause.value)==0)
	{
		alert ("<%= pageData.getWord("Invalid use of character")%>");
		document.filter.filterWhereClause.focus();	
	}
	else if(validation(document.filter.filterOrderByClause.value)==0)
	{
		alert ("<%= pageData.getWord("Invalid use of character")%>");
		document.filter.filterOrderByClause.focus();	
	}
    else {
    	// save filter details
	    if(document.filter.filterState.checked)
			state = 1;
        else
			state = 0;		
		
		
		var alReadyExist = false;
			   
	   var filters = appletObj.getFiltersByName(tenant_dbid);
	   jsfilters = filters.split("|");
	   
	   for(q = 0; q < jsfilters.length; q++)
			{
					
			if( document.filter.filterName.value == jsfilters[q] && filterName != document.filter.filterName.value) //le groupe existe deja						
				{
				alReadyExist = true;
				break;
				}							
			}
			
			
		if(alReadyExist)
			alert ('<%= pageData.getWord("Filter already exists")%>');
		else
			{
			appletObj.saveFilter(filterDBID,
									tenant_dbid,
													document.filter.filterName.value,
													document.filter.filterDescription.value,
													document.filter.filterWhereClause.value,
													document.filter.filterOrderByClause.value,
												state);
	
			// reset the button to disabled
			document.filter.updateInfo.disabled=true;
			
			//document.location.href = "../defaultpage.htm";
			}

	}
}

function askDelete()
{
	answer = confirm("<%= pageData.getWord("Are you sure, you wish to delete this filter?")%>");
	if(answer){
		appletObj.deleteFilter(filterDBID);
		// refresh the current page
		//document.location = "./filter.htm?filter_name=&tenant_dbid="+tenant_dbid;
        document.location.href = "../defaultpage.htm";
	}
}

function checkOnUnload()
{
  //alert('checkOnUnload:');

 return
}

</script>

<title><%= pageData.getWord("Add a filter")%></title>

 
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

<body class="fil_body" onLoad="displayFilterInfo()" onUnload=" return checkOnUnload()">
<!--        <control:slider ID="oSlider" STYLE= "position:relative;backgroundColor:#C0C0C0" >
			</control:slider>
 -->
<div class="tab-pane" id="tabPane1">
	<form name="filter" onKeyDown="KeyDownHandler(save)">
		<script type="text/javascript">
			tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
		</script>
		<div class="tab-page" id="tabGeneral">

			<fieldset>
			<legend id="caption"></legend>
				<table  cellpadding="0" cellspacing="0" id="AutoNumber2">
					<tr>
						<td width="100%">
							<table  cellspacing="0" id="AutoNumber1"  cellpadding="0" >
								<tr>
									<td align="left" valign="top" style="padding-bottom:12px; padding-top:30px">
										<span style="padding-left:5px; padding-right:5px; width:95px;"><%=pageData.getWord("Filter name")%></span>
										<input type="text" name="filterName" size="25" onClick="enabledUpdateButton()" style="font-weight: bold">
									</td>
								</tr>
								<tr>
									<td align="left" valign="top" style="padding-bottom:12px">
										<span style="padding-left:5px; padding-right:5px; width:95px;"><%=pageData.getWord("Description")%></span>
										<textarea rows="2" name="filterDescription" cols="52" onClick="enabledUpdateButton()"></textarea>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top" style="padding-bottom:12px">
										<span style="padding-left:5px; padding-right:5px; width:95px;"><%=pageData.getWord("Criteria")%></span>
										<textarea rows="3" name="filterWhereClause" cols="52" onClick="enabledUpdateButton()"></textarea>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top" style="padding-bottom:16px">
										<span style="padding-left:5px; padding-right:5px; width:95px;"><%=pageData.getWord("Order by")%></span>
										<textarea rows="3" name="filterOrderByClause" cols="52" onClick="enabledUpdateButton()"></textarea>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top" style="padding-bottom:5px">
											<input disabled="true" id="save" name="updateInfo" type="button" value='<%= pageData.getWord("Update")%>' onClick="validateInfo()" style="margin-left:100px;">
											<script language="JavaScript">
												var filterName = normalizeString(QueryString('filter_name'));

												if (filterName== '')
												{
													document.write('&nbsp;') 
												}else {
													document.write("<input id=\"deleteAgt\" name=\"deleteAgt\" onclick=\"askDelete()\"  value=\"<%= pageData.getWord("Delete")%>\"  type=\"button\">");         
												} 
											</script>
											<span style="padding-left:100px; padding-right:5px;"><%= pageData.getWord("Active")%></span>
											<input type="checkbox" name="filterState" value="ON" onClick="enableReload();enabledUpdateButton()">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
		</form>
	</div>
</body>
<% pageData.closeConnection(); %>
</html>