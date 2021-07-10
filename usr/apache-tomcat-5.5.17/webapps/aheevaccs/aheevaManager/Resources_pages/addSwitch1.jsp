<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<title>Add a new switch</title>
<script language="javascript" src="jsUtil.js"> </script>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript">
function validateInfo()
	{
	v = true;
	
	var ipParts = document.fswitch.ip.value.split(".");
	
	if(ipParts.length != 4 || document.fswitch.ip.value.length > 15)
		{
		alert('<%= pageData.getWord("The IP adress should be like: 192.168.100.100")%>');
		v = false;
		}
	else
		{
		for(j = 0; j < 4; j++)
			{
			if( !IsNumeric(ipParts[j]) )
				{
				alert('<%= pageData.getWord("The IP adress should be like: 192.168.100.100")%>');
				v=false;
				break;
				}
			}		
		}
	
	if(document.fswitch.load_agents.value == "" || !IsNumeric(document.fswitch.load_agents.value)) 
		{
		alert('<%= pageData.getWord("Load balance for agents must be numeric.")%>');
		v = false;
		} 
	else if(document.fswitch.load_outbound.value == "" || !IsNumeric(document.fswitch.load_outbound.value) ) 
			{
			alert('<%= pageData.getWord("Load balance for outbound must be numeric")%>');
			v = false;
			}
	else
		{
	
		var jsServers = String( appletObj.getAsteriskSwitchs() + "" );
		totalLoad_agents = 0;
		totalLoad_outbound = 0;
		jsServersArray =  jsServers.split("|");
		
		//alert("jsServersArray.length="+jsServersArray.length);
		for(i = 0; i < jsServersArray.length; i++)
			{
			if(jsServersArray[i] != "")
				{
				thisServer = jsServersArray[i].split(",");					
				if(thisServer[1] == document.fswitch.ip.value)
					{
					alert('<%= pageData.getWord("A switch with this IP address already exists.")%>');
					v = false;				
					}//document.write("<li><a href=\"./Resources_pages/modifySwitch.htm?dbid="+thisServer[0]+"\">"+thisServer[1]+"</a></li>");
				totalLoad_agents = totalLoad_agents + parseInt(thisServer[2]);	
				totalLoad_outbound = totalLoad_outbound + parseInt(thisServer[3]);	
				}
			}
		//totalLoad_agents = parseInt(totalLoad_agents);
		//totalLoad_outbound = parseInt(totalLoad_outbound);
		//alert("totalLoad_agents="+totalLoad_agents);
		//alert("totalLoad_outbound="+totalLoad_outbound);
		if( (totalLoad_agents+parseInt(document.fswitch.load_agents.value) ) > 100)
			{
			alert("<%= pageData.getWord("Load balance for agents can't be more than")%>" +(100-totalLoad_agents)+ "%" );
			v = false;
			}
			
		if( (totalLoad_outbound+parseInt(document.fswitch.load_outbound.value) ) > 100)
			{
			alert("<%= pageData.getWord("Load balance for outbound can't be more than")%>"+(100-totalLoad_outbound)+"%" );
			v = false;
			}
		}
		
	// --- if the form is valid
	if(v) 
		{		
		appletObj.saveSwitch("", document.fswitch.ip.value, 
						document.fswitch.load_agents.value, 
						document.fswitch.load_outbound.value);
		document.location.href = "../defaultpage.htm";				
		}
		
	
	}
</script>
</head>

<body class="bottompagebody">
<form name="fswitch" method="get">
<table border="0">
		  <tr>
			<td>&nbsp;</td>
			<td><h3><%= pageData.getWord("Add new switch")%></h3></td>
		  </tr>
		  <tr>
			<td>&nbsp;<%= pageData.getWord("IP Address")%></td>
			<td>&nbsp;<input name="ip" type="text"></td>
		  </tr>
		  <tr>
			<td>&nbsp;<%= pageData.getWord("Load balance for agents")%> %</td>
			<td>&nbsp;<input name="load_agents" type="text"></td>
		  </tr>
		  <tr>
			<td>&nbsp;<%= pageData.getWord("Load balance for outbound")%> %</td>
			<td>&nbsp;<input name="load_outbound" type="text"></td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
			<td>&nbsp;
				<input name="submit" type="button" value='<%= pageData.getWord("Submit")%>' onClick="valideInfo()">
		  </tr>
</table></form>
</body>
<% pageData.closeConnection(); %>
</html>
