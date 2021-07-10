<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<title>Modify Switch</title>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript">
var ori_IP = "";
function validateInfo()
	{
	v = true;
	
	var ipParts = document.fswitch.n_ip.value.split(".");
	
	if(document.fswitch.n_dbid.value == "" || !IsNumeric(document.fswitch.n_dbid.value))
		{
		alert("<%= pageData.getWord("The switch DBID must be numeric")%>");
		v = false;
		}
	if(ipParts.length != 4 || document.fswitch.n_ip.value.length > 15)
		{
		alert("<%= pageData.getWord("The IP adress should be like: 192.168.100.100")%>");
		v = false;
		}
	else
		{
		for(j = 0; j < 4; j++)
			{
			if( !IsNumeric(ipParts[j]) )
				{
				alert("<%= pageData.getWord("The IP adress should be like: 192.168.100.100")%>");
				v=false;
				break;
				}
			}		
		}
	
	if(document.fswitch.n_load_agents.value == "" || !IsNumeric(document.fswitch.n_load_agents.value)) 
		{
		alert("<%= pageData.getWord("Load balance for agents must be numeric.")%>");
		v = false;
		} 
	else if(document.fswitch.n_load_outbound.value == "" || !IsNumeric(document.fswitch.n_load_outbound.value) ) 
			{
			alert("<%= pageData.getWord("Load balance for outbound must be numeric")%>");
			v = false;
			}
	else
		{
	
		var jsServers = String( appletObj.getAsteriskSwitchs() + "" );
		totalLoad_agents = 0;
		totalLoad_outbound = 0;
		jsServersArray =  jsServers.split("|");
		
		//alert("jsServersArray.length="+jsServersArray.length);
		//alert("ori_IP="+ori_IP);
		for(i = 0; i < jsServersArray.length; i++)
			{
			if(jsServersArray[i] != "")
				{
				thisServer = jsServersArray[i].split(",");					
				if(thisServer[1] != ori_IP)
					{
					if(thisServer[1] == document.fswitch.n_ip.value )
						{
						alert("<%= pageData.getWord("A switch with this IP address already exists.")%>");
						v = false;				
						}//document.write("<li><a href=\"./Resources_pages/modifySwitch.htm?dbid="+thisServer[0]+"\">"+thisServer[1]+"</a></li>");
					totalLoad_agents = totalLoad_agents + parseInt(thisServer[2]);	
					totalLoad_outbound = totalLoad_outbound + parseInt(thisServer[3]);	
					}
				}
			}
		//totalLoad_agents = parseInt(totalLoad_agents);
		//totalLoad_outbound = parseInt(totalLoad_outbound);
		//alert("totalLoad_agents="+totalLoad_agents);
		//alert("totalLoad_outbound="+totalLoad_outbound);
		if( (totalLoad_agents+parseInt(document.fswitch.n_load_agents.value) ) > 100)
			{
			alert("<%= pageData.getWord("Load balance for agents cant be more than")%>"+(100-totalLoad_agents)+"%" );
			v = false;
			}
			
		if( (totalLoad_outbound+parseInt(document.fswitch.n_load_outbound.value) ) > 100)
			{
			alert("<%= pageData.getWord("Load balance for outbound cant be more than")%>"+(100-totalLoad_outbound)+"%" );
			v = false;
			}
		}
		
		
	// --- if the form is valid
	if(v)
		{ 		
		appletObj.saveSwitch(document.fswitch.n_dbid.value, document.fswitch.n_ip.value, 
						document.fswitch.n_load_agents.value, 
						document.fswitch.n_load_outbound.value);
		document.location.href = "../defaultpage.htm";
		}
	
	}

function confirmDelete()
	{
	v = confirm("<%= pageData.getWord("You are about to delete this switch. \n Do you want to continue")%>");
	
	if(v && document.fswitch.n_ip.value != "" && document.fswitch.n_ip.value != null)
		{
		appletObj.deleteSwitch(document.fswitch.n_ip.value);	
		document.location.href = "../defaultpage.htm";
		}
	}

function setValues() 
	{
	document.fswitch.n_dbid.value = normalizeString(QueryString("dbid"));
	
	var switchList = String( appletObj.getSwitchByDBID(document.fswitch.n_dbid.value) );
	
	var switchListArray = switchList.split(",");
	document.fswitch.n_ip.value = switchListArray[1];
	document.fswitch.n_load_agents.value = switchListArray[2];
	document.fswitch.n_load_outbound.value = switchListArray[3];	
	ori_IP = switchListArray[1];
	}
	

</script>
</head>

<body class="bottompagebody">
<form name="fswitch" method="get">
<table border="0">
		  <tr>
		  
			<td><input name="n_dbid" disabled  type="hidden"></td>
			<td><h3><%= pageData.getWord("Modify switch")%></h3></td>
		  </tr>
		  <tr>
			<td>&nbsp;<%= pageData.getWord("IP Address")%></td>
			<td>&nbsp;<input name="n_ip" disabled type="text"></td>
		  </tr>
		  <tr>
			<td>&nbsp;<%= pageData.getWord("Load balance for agents")%>  %</td>
			<td>&nbsp;<input name="n_load_agents" type="text"></td>
		  </tr>
		  <tr>
			<td>&nbsp;<%= pageData.getWord("Load balance for outbound")%> %</td>
			<td>&nbsp;<input name="n_load_outbound" type="text"></td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
			<td>
					&nbsp;	<input name="submit" type="button" value="<%= pageData.getWord("Update")%>" onClick="validateInfo()">
					&nbsp;<input name="delete_b" type="button" value="<%= pageData.getWord("Delete")%>" onClick="confirmDelete()">

		  </tr>
</table>
</form>
</body>
<script language="javascript" type="text/javascript">
	setValues();
</script>
</html>
<% pageData.closeConnection(); %>