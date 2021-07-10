

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.io.*"%>
<%@page import ="aheevaManager.wfm.*"%>
<%@page import ="java.util.StringTokenizer"%>
<%@page session="true"%>

<jsp:useBean id="beanAgentCommission" scope="session" class="aheevaManager.wfm.beanCommissionReport"/>

<html>																	 
<head>

<%

beanAgentCommission.setTenantDBID(request.getParameter("tenant_dbid"));

String tenant_dbid = request.getParameter("tenant_dbid");
String fromDate = request.getParameter("fromDate");
String toDate = request.getParameter("toDate");
String objId = request.getParameter("objId");
String reqType = request.getParameter("reqType");
String submitRequest = request.getParameter("viewData");

%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<link rel="stylesheet" href="../Resources_pages/xc2_default.css" type="text/css">
<LINK href="../Resources_pages/livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Language" content="en-us">

<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}
html, body {
	background:	;
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
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="JavaScript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/Browser.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<!-- Calendrier début -->
<script language="javascript" src="../Resources_pages/xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="../Resources_pages/xc2_inpage.js"></script>
<!-- Calendrier fin -->

<script language="javascript" type="text/javascript">

var tenant_dbid = normalizeString(QueryString('tenant_dbid'));

var dataExtracted = normalizeString(QueryString("viewData"));

</script>
<%
out.write("<script>tenant_dbid = '"+tenant_dbid+"'</script>");
out.write("<script>dataExtracted = '"+submitRequest+"'</script>");

%>
<script>
var userid = appletObj.getCurrentUserDBID();

function changeDisabled()
{
	document.agentHours.agtGrp.value = "AllGroups";
	// Agent group radios
	if(document.agentHours.agtChoice[0].checked)
	{
		// activer le div de l'agent group et desactiver celui de l agent
		document.getElementById("listAgt").style.visibility = 'hidden';
		document.getElementById("listAgtGrp").style.visibility = 'visible';
		document.agentHours.agtChoice[1].checked = false;
		//alert("agent group activation");		
		
	} 
	// Agent radios
	else if(document.agentHours.agtChoice[1].checked)
	{
		// activer le div de l'agent et desactiver celui de l'agent group
		document.getElementById("listAgt").style.visibility = 'visible';
		document.getElementById("listAgtGrp").style.visibility = 'hidden';
		document.agentHours.agtChoice[0].checked = false;
		//alert("agent  activation");	
		
	}
}


function fillObjectCombo(groupBox, agentBox, viewBox)
{
	
	if(agentBox.options.length <= 1 )
	{
		var agents = String( appletObj.getAgentsByName(tenant_dbid) );
		var o = new Array();
		
		//Fill agents combo box with agents name
        var jsAgents = agents + "";
    	arrayAgents = jsAgents.split("|");		
    	if(agents.length > 0 )
		{
    		for (j = 0; j <arrayAgents.length; j++)
			{
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if ( viewBox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents [j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)
				o[o.length]= myOption;
    		}			
		}
		//Sort the object
		sortSelect(o);
		for (var i=0; i<o.length; i++)
		{
			agentBox.options[i+1] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}
	}

	if(groupBox.options.length <= 1 )
	{
		var agentGroups = String( appletObj.getAgentGroupDbidAndName(tenant_dbid) ); // dbid. name
		var jsAgentGroups = agentGroups + "";
		var arrayGroups = jsAgentGroups.split("|");
		for (j = 0; j < arrayGroups.length; j++)
		{
			var agtGrp = arrayGroups[j].split(",");
			myOption = new Option(agtGrp[1],agtGrp[0])
			optionPos = groupBox.options.length
			groupBox.options[optionPos]=myOption
		}
	 }
}

function getAgentGroupId(agtGroupName)
{
	var agentsGrp = String( appletObj.getAgentGroupInfo(agtGroupName) );
	var jsAgents = agentsGrp + "";        

	if(agentsGrp.length > 0 )
	{
		arrayAgents = jsAgents.split("|");
    	var grpDbid = arrayAgents[0];
		objId = grpDbid;
		document.getElementById("idObject").value = grpDbid;
    }
	//alert("function getAgentGroupId(agtGroupName) --> objId value : "+ objId);
	
}


function getAgentsInGroup(groupBox, agentBox, viewBox)
{
	var o = new Array();
	if(groupBox.value =='AllGroups')
	{
		
		//Empty the agent group combo box
		groupBox.options.length=1;
		agentBox.length = 0;
        var defaultvalue = '- ' + MultiArray["Select an agent"][lang] + ' -'; //  "- All Agents -" ;
		myOption = new Option(defaultvalue,"AllAgents")
		optionPos = agentBox.options.length
		agentBox.options[optionPos]=myOption
		
		fillObjectCombo(groupBox, agentBox, viewBox);
	}
	else
	{
		var agtGroupName = "";
		
		for (var i = 0; i < groupBox.length; i++)
		{
			if (groupBox.options[i].selected == true)
			{
				agtGroupName = groupBox.options[i].text;
				document.getElementById("idRequest").value = "1";
				
				// retrouver le id de l'agent group
				getAgentGroupId(agtGroupName)
				//alert("getAgentsInGroup(groupBox, agentBox, viewBox) agtGroupName " + agtGroupName);
				break;
			}
		}
		var agents = String( appletObj.getAvailableAgentListInGroupByStatus(agtGroupName,1) );
		var jsAgents = agents + "";

		// Remove all agents from agents option field
		var i=agentBox.options.length;
        if (i>0)
		{
              //agentBox.length = 0;
        }
        var defaultvalue =  '- ' + MultiArray["Select an agent"][lang] + ' -'; // "- All Agents -" ;
		myOption = new Option(defaultvalue,"AllAgents")
		o[o.length]= myOption;

		if(agents.length > 0 )
		{
			arrayAgents = jsAgents.split("|");
    		for (j = 0; j <arrayAgents.length; j++)
			{
    			var iStartPos = arrayAgents[j].indexOf('[');
    			var iEndPos   = arrayAgents[j].indexOf(']');
    			var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
				var name = login+'['+arrayAgents[j].substr(0,iStartPos)+']';
				if ( viewBox.checked == false)	  		// show agents name as : firstname, lastname[login]
      				myOption = new Option(arrayAgents [j],login)
				else									// show agents name as : login[firstname, lastname]
					myOption = new Option(name,login)

				o[o.length]= myOption;
			}
         }
	}

	sortSelect(o);

	return;
}


function getAgents(agentBox)
{
	var o = new Array();
	if(agentBox.value !='AllAgents')
	{
		var agtName = "";
		
		for (var i = 0; i < agentBox.length; i++)
		{
			if (agentBox.options[i].selected == true)
			{
				agtName = agentBox.options[i].text;
				if(document.getElementById("Checkbox2").checked == false)
				{
					var iStartPos = agtName.indexOf('[');
					var iEndPos   = agtName.indexOf(']');
					var name = agtName.substr(0,iStartPos);
					var login	  = agtName.substr(iStartPos+1,iEndPos-iStartPos-1);
				}
				else
				{
					var iStartPos = agtName.indexOf('[');
		  			var iEndPos   = agtName.indexOf(']');
		  			var login = agtName.substr(0,iStartPos);
		  			var name	  = agtName.substr(iStartPos+1,iEndPos-iStartPos-1);
				}				
				//alert("name:" + name+"login:"+login);
				document.getElementById("idRequest").value = "2";
				document.getElementById("idObject").value = login;
				break;
			}
		}       
	}	
}


function loadAgentGrp()
{
	getAgentsInGroup(document.getElementById("agtGrp"), document.getElementById("objects"), document.getElementById("viewckbox"));
	
}

function changeAgentListView(groupBox, agentBox, viewBox)
{
	var agents;
	var name="";
	var o = new Array();
	agentBox.length = 0;
    var defaultvalue =  '- ' + MultiArray["Select an agent"][lang] + ' -'; // "- All Agents -" ;
	myOption = new Option(defaultvalue,"AllAgents")
	o[o.length]=myOption

	if(groupBox.value == 'AllGroups')
		agents = String( appletObj.getAgentsByNameActif(tenant_dbid) );
	else
		agents = String( appletObj.getAvailableAgentListInGroupByStatus(groupBox.options[groupBox.selectedIndex].text,1) );

    var jsAgents = agents + "";
    arrayAgents = jsAgents.split("|");
    for (j = 0; j <arrayAgents.length; j++){
		  var iStartPos = arrayAgents[j].indexOf('[');
		  var iEndPos   = arrayAgents[j].indexOf(']');
		  var login	  = arrayAgents[j].substr(iStartPos+1,iEndPos-iStartPos-1);
		  name = login+'['+arrayAgents[j].substr(0,iStartPos)+']'
		  if ( viewBox.checked == false)  // show agents name as : firstname, lastname[login]
			myOption = new Option(arrayAgents[j],login);  // show agents name as : login[firstname, lastname]
		  else
			myOption = new Option(name,login);
		  o[o.length]=myOption

   }

  
   // Sorted by id
   if (viewBox.checked == false)	
	{
   		o = o.sort(
			function(a,b) 
			{
				if ((a.text+"") < (b.text+"")) { return -1; }
				if ((a.text+"") > (b.text+"")) { return 1; }
				return 0;
			}
		);
	}
	else
	{
		o = o.sort(
			function(a,b) 
			{
				if (parseInt(a.value) < parseInt(b.value)) { return -1; }
				if (parseInt(a.value) > parseInt(b.value)) { return 1; }
				return 0;
			}				
		);   	
	}	
   
	for (var i=0; i<o.length; i++) {
		agentBox.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
		}

}

function convertTimeToSeconds(time)
{
	total_time = 0;
	hour = 0;
	minute = 0;
	second = 0;
	if(time.indexOf(":") != -1)
	{
		time_array = time.split(":");
		hour = time_array[0] != null && IsNumeric(time_array[0]) ? time_array[0] : 0;
		minute = time_array[1] != null && IsNumeric(time_array[0]) ? time_array[1] : 0;
		second = time_array[2] != null && IsNumeric(time_array[0]) ? time_array[2] : 0;
	}
	else
		hour = time;
	total_time += hour * 3600 + minute * 60 + second * 1;
	return total_time;
}

function buildOverrideTime(id, time_format)
{
	var override_time = 0;
	var time_format_sec = 0;
	var agt_id = id.substring(14, id.length);
	var paid_time = document.getElementById("paidtime"+agt_id).value;
	//alert(convertTimeToSeconds(paid_time));
	
	if (time_format.substring(0, 1) == '-')
	{
		time_format_sec = time_format.substring(1, time_format.length);
		//alert(convertTimeToSeconds(time_format_sec));
		override_time = convertTimeToSeconds(paid_time) - convertTimeToSeconds(time_format_sec);
	}
	else
	{
		time_format_sec = time_format.substring(0, time_format.length);
		//alert(convertTimeToSeconds(time_format_sec));
		override_time = convertTimeToSeconds(paid_time) + convertTimeToSeconds(time_format_sec);
	}
	
	var dest_id = "overridetime"+agt_id;
	//alert(override_time);
	var override_hour = override_time / 3600;
	//alert(override_hour);
	buildReadableTime(dest_id, override_hour);
}

function buildCorrectionTime(id, value)
{
	if (value.substring(0, 1) == '-')
	{
		document.getElementById(id).value = "(" + value.substring(1, value.length) + ")";
	}
	else
	{
		document.getElementById(id).value = value;
	}	
}


function buildReadableTime(id, time_hr)
{
	var signe = 1;
	if (time_hr < 0)
	{
		signe = -1;
		time_hr = -1*time_hr;
	}
	var time_sec = time_hr*3600;
	var time = "";
	var hours = 0;
	var minutes = 0;
	var seconds = 0;

	if (time_hr < 0)
	{
		time_sec = -1*time_sec;
	}
	hours = parseInt(time_sec / 3600);
	if ((hours < 10) && (hours > 0))
	{
		time += "0";
		time += hours;
	}
	else if ((hours >= 10) && (hours > 0))
		time += hours;
	if (hours == 0)
		time += "00";
	time += ":";

	minutes = parseInt((time_sec - hours * 3600) / 60);
	if ((minutes < 10) && (minutes > 0))
	{
		time += "0";
		time += minutes;
	}
	else if ((minutes >= 10) && (minutes > 0))
		time += minutes;
	if (minutes == 0)
		time += "00";
	time += ":";

	seconds = parseInt((time_sec - minutes * 60) % 3600);
	if (seconds < 10)
	{
		time += "0";
		time += seconds;
	}
	else
		time += seconds;

	if (signe == -1)
	{
		time = "(" + time + ")";
	}

	document.getElementById(id).value = time;
}

function extractAllData()
{
	if(dateChecker() && choiceChecker())
	{
		var fromDate = document.getElementById("fromDate").value;
		var toDate = document.getElementById("toDate").value;
		var reqType = document.getElementById("idRequest").value;
		var objId = document.getElementById("idObject").value;
				
		document.location = "./commissionReport.jsp?viewData=true&tenant_dbid="+tenant_dbid+"&fromDate="+fromDate+"&toDate="+toDate+"&reqType="+reqType+"&objId="+objId;
		
	}
	
	
}


function compareDates(date1, date2)
{
	var comp_result = 'false';
	var tabDate1 = date1.split("/");
	var tabDate2 = date2.split("/");
	//alert( tabDate1[2]+"-"+tabDate2[2] +"-"+tabDate1[1] +"-"+ tabDate2[1]+"-"+tabDate1[0] +"-"+ tabDate2[0]);
	
	if (parseInt(tabDate2[2], 10) < parseInt(tabDate1[2], 10) )
		return 'false';
	if (parseInt(tabDate2[2], 10) > parseInt(tabDate1[2], 10) )
		return 'true';
	if (parseInt(tabDate2[2], 10) == parseInt(tabDate1[2], 10) )
	{
		// mois
		if (parseInt(tabDate2[0], 10) < parseInt(tabDate1[0], 10) )
			return 'false';
		if (parseInt(tabDate2[0], 10) > parseInt(tabDate1[0], 10) )
			return 'true';
		if (parseInt(tabDate2[0], 10) == parseInt(tabDate1[0], 10) )
		{
			// jour
			if (parseInt(tabDate2[1], 10) < parseInt(tabDate1[1], 10) )
				return 'false';
			if (parseInt(tabDate2[1], 10) >= parseInt(tabDate1[1], 10) )
				return 'true';
		}
	}

}


isIE=document.all;
isNN=!document.all&&document.getElementById;

function viewExceptions()
{
	if (document.getElementById("viewExceptionObj") != null)
	{
		document.getElementById("viewExceptionObj").value = 'true';
		var date_from = document.getElementById("fromDate").value;
		var date_to = document.getElementById("toDate").value;
		document.getElementById("dateFrom").value = date_from;
		document.getElementById("dateTo").value = date_to;
		//alert("view exceptions " + date_from +"-"+ date_to);
		document.agentHours.submit();
	}	
}

function dateChecker()
{
	var startDate=new Date(document.getElementById("fromDate").value);
	var endDate = new Date(document.getElementById("toDate").value);
	
	if(document.getElementById("fromDate").value == "" || document.getElementById("toDate").value == "")
	{
		alert(MultiArray["Please enter a valid date to proceed"][lang]);
		return false;
	}	
	else if(endDate < startDate)
	{
		alert(MultiArray["Your ending date cannnot be smaller than your starting date"][lang]);
		return false;
	}

	return true;
}

function choiceChecker()
{
	var response = true;
	if(document.getElementById("idObject").value == "" )
	{
		alert(MultiArray["Please select at least one object"][lang]);
		response = false;
	}
	if(document.getElementById("idRequest").value =="1" && document.agentHours.agtChoice[0].checked == "" )
	{
		alert(MultiArray["Please select at least one object"][lang]);
		response = false;
	}
	else if(document.getElementById("idRequest").value =="2" && document.agentHours.agtChoice[1].checked == "" )
	{
		alert(MultiArray["Please select at least one object"][lang]);
		response= false;
	}
	return response;
}

function openSaveFileWindow()
{
	window.open('./commissionReport.xls');
	
	
}
</script>

</head>

<!--<li id="menuli"><a href="./jsp/commissionReport.jsp?viewData=&tenant_dbid=<%//=current_tenant_dbid%>&fromDate=&toDate=&reqType=&objId="><%//=pageData.getWord("Commission details")%></a></li>--> 
<body  class="bottompagebody" onLoad="loadAgentGrp()">
<%String sret ="";%>
<div class="tab-pane" id="tabPane1">
<form name="agentHours"  action="./commissionReport.jsp" method="post"    >
	<input id="idObject" type="hidden" value=""></input>
	<input id="idRequest" type="hidden" value=""></input>
	<script type="text/javascript">
		tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );		
	</script>
	  <div class="tab-page" id="searchoptions">
	  	<h4 class="tab"><script>document.write(MultiArray["Commissions"][lang]);</script></h4>

			<script type="text/javascript">
				tp1.addTabPage( document.getElementById( "searchoptions" ) );
			</script>
			<fieldset>
				<legend><script>document.write(MultiArray["Search options"][lang]);</script></legend>
				<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="1455">
					<tr>
						<td height="25" colspan="4">&nbsp;						</td>
					</tr>
					<tr>
						<td align="right" width="251" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">							<b><script>document.write(MultiArray["Show commission details from"][lang]);</script></b>						</td>
						<td width="34" ></td>
						<td width="222" style="border-top-style: none; border-top-width: 1">
					  <input type="text" size="15" onFocus="showCalendar('',this,this,'','id_fromDate',310,95,1);this.blur()" name="fromDate" id="fromDate" value=""/>		</td>				
						<td width="948">&nbsp;<b><script>document.write(MultiArray["to"][lang]);</script></b>
						<input type="text" size="15" onFocus="showCalendar('',this,this,'','id_toDate',550,95,1);this.blur()" name="toDate" id="toDate" value=""/>				
						</td>								
					</tr>
					<tr>
						<td align="right" width="251" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">
							<b><script>document.write(MultiArray["Select an agent group"][lang]);</script></b>
					  <input name="agtChoice" type="radio" value="agentGroup" onClick="changeDisabled();"></td>
						<td width="34" ></td>
						<td width="222" style="border-top-style: none; border-top-width: 1">
						<div id="listAgtGrp" style="visibility:hidden" >
							<select  id="agtGrp" name="agtGrp" onChange="getAgentsInGroup(this, document.agentHours.objects, document.agentHours.viewckbox);" class="contentText" >
								<option value="AllGroups">- <script>document.write(MultiArray["Select a group"][lang]);</script> -</option>
							</select>		
					  </div>				</td>
						<td valign="middle" >&nbsp;</td>
					</tr>
					<tr>
						<td align="right" width="251" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">
							<b><script>document.write(MultiArray["Select an agent"][lang]);</script></b>
					  <input name="agtChoice" type="radio" value="agent" onClick="changeDisabled()" >						</td>
						<td width="34" ></td>
						
							<td colspan="2" id="id_reportDate" style="border-top-style: none; border-top-width: 1">
								<div id="listAgt" style="visibility:hidden">
								<select  id="objects" name="objects" class="contentText" onChange="getAgents(this)" >
									<option value="AllAgents">- <script>document.write(MultiArray["Select an agent"][lang]);</script> -</option>
								</select>	
											
								<input type="checkbox" name="viewckbox" onClick="javascript:changeAgentListView(document.agentHours.agtGrp, document.agentHours.objects, this);" ID="Checkbox2">
              					 <b><script>document.write(MultiArray["Show agent by ID"][lang]); </script></b>
								</div>
							</td>
							
					</tr>
					<tr>
						<td width="251" height="23" style="border-left-style: none; border-left-width: 1; border-top-style: none; border-top-width: 1">													</td>
						<td width="34" ></td>
						<td width="222" style="border-top-style: none; border-top-width: 1"></b>	</td>				
						<td width="948">&nbsp; <script>document.write("<input id=\"viewAgentsHours\"  name=\"viewAgentsHours\" type=\"button\"  value=\""+MultiArray["View data"][lang]+"\" onClick=\"extractAllData()\">");</script>
						
						<% if((submitRequest != null) && submitRequest.compareTo("true") == 0) 
						{%>
							<!--<a href="javascript:openSaveFileWindow()">Download the file</a>-->
							
						<%}%>
						</td>								
					</tr>
					<tr>
						<td height="21" colspan="4">&nbsp;</td>						
					</tr>
	 		</table>
  			</fieldset>		
					
			<%
			if((submitRequest != null) && submitRequest.compareTo("true") == 0) 
			{
				sret = beanAgentCommission.getCommissionDetails(fromDate,toDate,objId, reqType);
				//beanAgentCommission.createReport(fromDate,toDate);
			 	java.util.Vector allDetails = new Vector();			 
			 	allDetails = beanAgentCommission.comDetails;				
				beanCommissionDetails agentData = new beanCommissionDetails();
				//String strToWrite ="";
			%>
				<div  style="margin-right:20px ">
				<table width="30%" align="center" >
				
			<!--Requete pour l'agent group-->
				<% if (allDetails.size() >0  && reqType.compareTo("1") == 0 ) {%>				
					<tr>
					<td  class="reportsID" width="20%" align="center">
					<b><script>document.write(MultiArray["Commission details"][lang]+" "); document.write(MultiArray["for"][lang]+" ")</script><%=((beanCommissionDetails)allDetails.elementAt(0)).agent_group_name%></b></td></tr>
					
					<tr>
					 <td  class="reportsID" width="20%" align="center">
					<b><%=fromDate %> <script>document.write(MultiArray["To"][lang]);</script> <%=toDate%></b>  </td>
					</tr>
					<tr><td height="20"></td></tr>
			<%}// fin if (allDetails.size() >0 && reqType.compareTo("1") == 0 )				
				
			//Requete pour un agent
				if(allDetails.size() >0  && reqType.compareTo("2") == 0 ){%>
				
					<tr>
					<td  class="reportsID" width="20%" align="center">
					<b><script>document.write(MultiArray["Commission details"][lang]+" "); document.write(MultiArray["for"][lang]+" ")</script><%=((beanCommissionDetails)allDetails.elementAt(0)).agent_name%></b></td></tr>
					
					<tr>
					 <td  class="reportsID" width="20%" align="center">
					<b><%=fromDate %> <script>document.write(MultiArray["To"][lang]);</script> <%=toDate%></b>  </td>
					</tr>
					<tr><td height="20"></td></tr>						
				<%} // fin if (allDetails.size() >0 && reqType.compareTo("2") == 0 ) %>
				</table>	
				
			<!--Debut affichage details pour l'objet choisi-->
				<table border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
				<tr>
					<% if (reqType.compareTo("1") == 0) { // pour agent group%>
					<td align="center" width="100"><b><script>document.write(MultiArray["Agent ID"][lang]);</script></b></td>
					<td align="center" width="200"><b><script>document.write(MultiArray["Last name"][lang]);</script>, <script>document.write(MultiArray["First name"][lang]);</script></b></td>	<%}%>
					<% if (reqType.compareTo("2") == 0) { //pour un agent%>
					<td align="center" width="110"><b><script>document.write(MultiArray["Group ID"][lang]);</script></b></td>
					<td align="center" width="150"><b><script>document.write(MultiArray["Group name"][lang]);</script></b></td>
					<%}%>								
					<td align="center" width="100"><b><script>document.write(MultiArray["Agent sales"][lang]);</script></b></td>
					<td align="center" width="100"><b><script>document.write(MultiArray["Group sales"][lang]);</script></b></td>
					<td align="center" width="125"><b><script>document.write(MultiArray["Agent hours"][lang]);</script></b></td>
					<td align="center" width="125"><b><script>document.write(MultiArray["Group hours"][lang]);</script></b></td>
					<td align="center" width="125"><b><script>document.write(MultiArray["Calculation base"][lang]);</script></b></td>
					<td align="center" width="130"><b><script>document.write(MultiArray["Total commission"][lang]);</script></b></td>
					<td align="center" width="130"><b><script>document.write(MultiArray["Commission per hour"][lang]);</script></b></td>
					<td align="center" width="200"><b><script>document.write(MultiArray["Commission details"][lang]);</script></b></td>
			 	</tr>
				
				</table>
				</div>		
			<%
				/*strToWrite = "Agent ID;Last name-First name;Group ID;Group name;Agent sales;Group sales;Agent hours;Group hours;Calculation base;Total commission;Commission details\n";*/
				if(	allDetails.size() >0)
				{
					int tot_agent_sales =0 , tot_grp_sales =0;
					float tot_agent_hours =0, tot_grp_hours = 0, tot_commission =0 ,commission_per_hrs=0,tot_commission_per_hrs=0;
					
					
					%>
					<div id="tabDailyHours"  style="overflow:scroll; height:500px"> 
					<table border="0">						
					<%		
					for(int i = 0; i < allDetails.size(); i++)
					{						
						agentData = (beanCommissionDetails)allDetails.elementAt(i);		
						if(agentData.agent_hours>0)
							commission_per_hrs=	agentData.total_commission_value/agentData.agent_hours;
												
						if(i%2 ==0) {
					  	%>
					  		<tr class="reportsRowPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
					  	<%
					  	} else {
					  	%>
				  	  	<tr class="reportsRowUnPair" bordercolor="#CCCCCC" style="border-collapse:collapse ">
                     	<%
					 	}
					 	%>	  
						
						<%if (reqType.compareTo("1") == 0) {%> 
						<td align="center" width="100"><b><%=agentData.agent_id%></b></td>
						<td align="center" width="200"><b><%=agentData.agent_name%></b></td><%}%>
						
						<%if (reqType.compareTo("2") == 0) {%>
						<td align="center" width="110"><b><%=agentData.agent_group_id%></b></td>
						<td align="center" width="150"><b><%=agentData.agent_group_name%></b></td>
						<%
						 // Cumul pour les != agent group dont fait partie l'agent
						 tot_grp_hours += agentData.group_hours;
						 tot_grp_sales += agentData.group_sales;
						 }%>							 
						 					
						<td align="center" width="100"><b><%=agentData.agent_sales%></b></td>
						
						<%if(agentData.calculationBase.compareTo("Group-based")==0){%>
						<td align="center" width="100"><b><%=agentData.group_sales%></b></td><% }
						 else {%>
						<td align="center" width="99"><b> - </b></td>	 <% }%>		
									
						<td align="center" width="125"><b><%=Double.toString( (Math.round(agentData.agent_hours*100))/100.0)%></b></td>
						
						<%if(agentData.calculationBase.compareTo("Group-based")==0) {%>
						<td align="center" width="125"><b><%=Double.toString( (Math.round(agentData.group_hours*100))/100.0)%></b></td>
						<%} 
						else {%>
						<td align="center" width="125"><b> - </b></td> <% }%>	
						
						<td align="center" width="125"><b><%=agentData.commission_base%></b></td>
						<td align="center" width="130"><b><%=Double.toString( (Math.round(agentData.total_commission_value*100))/100.0)%></b></td>
						<td align="center" width="130"><b><%=Double.toString( (Math.round(commission_per_hrs*100))/100.0)%></b></td>
						<td align="center" width="200"><b><%=agentData.calculationBase%></b></td>
					  	</tr>   
			<% 		
					// Cumul pour les 2 requetes
					tot_agent_sales += agentData.agent_sales ;
					tot_agent_hours +=agentData.agent_hours;
					tot_commission +=agentData.total_commission_value;
					
					//CSV file content
					/*strToWrite += agentData.agent_id +";"+ agentData.agent_name +";"+ agentData.agent_group_id+";"+agentData.agent_group_name+";"+
					agentData.agent_sales+";"+agentData.group_sales+";"+agentData.agent_hours+";"+agentData.group_hours+";"+
					agentData.calculationBase+";"+agentData.total_commission_value+"\n ";*/
					
					}// fin for		
					tot_commission_per_hrs = tot_commission/tot_agent_hours;	
					%>
					
			<!--Affichage du total-->
					<tr>
					  <td bgcolor="#FFECF5" align="center"> <b><%out.write("<script>document.write(MultiArray[\"Total\"][lang])</script>");%></b></font></td>					  
					  <td bgcolor="#FFECF5" align="center"> <b> </b></font></td>
					  <td bgcolor="#FFECF5" align="center"> <b><%=tot_agent_sales%> </b></font></td>
					  
					  <!--Group sales-->
					  <%if(agentData.calculationBase.compareTo("Group-based")==0){%>
						<td bgcolor="#FFECF5" align="center"> <b><%=agentData.group_sales%></b></font></td><% } 
						else if(reqType.compareTo("2") == 0) {%>
						<td bgcolor="#FFECF5" align="center"> <b><%=tot_grp_sales%></b></font></td>	<%}
						else {%>
						<td bgcolor="#FFECF5" align="center"><b> - </b></td><% }%>
						
								
					  <td bgcolor="#FFECF5" align="center"> <b><%=Double.toString( (Math.round(tot_agent_hours*100))/100.0)%> </b></font></td>
					  
					  <!--Group hours-->
					  <%if(agentData.calculationBase.compareTo("Group-based")==0) {%>
						<td bgcolor="#FFECF5" align="center"><b><%=Double.toString( (Math.round(agentData.group_hours*100))/100.0)%></b></td><% } 
						else if(reqType.compareTo("2") == 0) {%>
						<td bgcolor="#FFECF5" align="center"><b><%=Double.toString( (Math.round(tot_grp_hours*100))/100.0)%></b></td><%}
						else {%>
						<td bgcolor="#FFECF5" align="center"><b> - </b></td> <% }%>	
						
						
					  <td bgcolor="#FFECF5" align="center"> <b> </b></font></td>
					  <td bgcolor="#FFECF5" align="center"> <b><%=Double.toString( (Math.round(tot_commission*100))/100.0)%> </b></font></td>
					  <td bgcolor="#FFECF5" align="center"> <b><%=Double.toString( (Math.round(tot_commission_per_hrs*100))/100.0)%> </b></font></td>
					  <td bgcolor="#FFECF5" align="center"> <b> </b></font></td>
					</tr>
					</table>
					</div>
					<%
					
				} // fin if( allDetails.size() >0)
				// Creation du fichier Excell commissionReport.cvs
				//String strPath = "../webapps/aheevaccs/Manager/Resources_pages/Exceptions.csv";				
				
				/*String strPath="../webapps/aheevaccs/Manager/commissionReport.xls";
				File strFile = new File(strPath);
				FileWriter myWriter = new FileWriter(strFile);
				BufferedWriter objWriter = new BufferedWriter(myWriter);	
				objWriter.write(strToWrite);	
				objWriter.flush();	
				objWriter.close();*/
				
				//beanFile.doSave("../logs/commissionReport.xls");		
				%>
				
				<!--<iframe id="SaveFrame" style="display:none"></iframe> 
				
				<script> 				
				function SaveVarAsFile(){ 				
				  SaveFrame.document.open("csv","replace")
				  SaveFrame.document.write("mettre;le;contenu;ici;")
				  SaveFrame.document.close()
				  SaveFrame.focus()
				  SaveFrame.document.execCommand('SaveAs',false,"ddd.csv")
				} 
				</script>-->
				<%				
			}// fin if((submitRequest != null) && submitRequest.compareTo("true") == 0) %>
	
</div>
</form>
</div>
</body>
</html>

 

	