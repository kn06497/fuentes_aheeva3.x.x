<%@page contentType="text/html" language = "java"%>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<html><head>
<link rel="stylesheet" type="text/css" href="../Resources_pages/style.css" />
<link rel="stylesheet" type="text/css" href="../Resources_pages/xc2_default.css" />
<link rel="stylesheet" type="text/css" href="../Resources_pages/livestats.css" />
<!-- Calendrier début -->
<%@ include file="../Resources_pages/agentDatePicker_labels.jsp" %>
<%@ include file="../Resources_pages/xc2_default_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" src="../Resources_pages/xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="../Resources_pages/xc2_inpage.js"></script>
<!-- Calendrier fin -->
<script language="JavaScript" src="../Resources_pages/jsUtil.js"></script>
<script type="text/javascript" language="javascript" src="../Resources_pages/trim.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/Browser.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/agentDatePicker.js"></script>
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
<%	
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	else
		pageData.setDefaultLanguage("ENGLISH");	
		
	System.out.println("USER_LANGUAGE : " + (String)session.getAttribute("USER_LANGUAGE"));
	System.out.println("CURRENT_USER_DBID : " + (String)session.getAttribute("CURRENT_USER_DBID"));		
	
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID")),
	 	   tenantDbid = request.getParameter("tenant_dbid"),
		   sqlCountAgents = "SELECT count(*) as NB_AGENTS FROM cfg_person WHERE TENANT_DBID='" + tenantDbid + "'";
		   
	pageData.openConnection();
	Vector <HashMap<String, String> > nbAgentsDataResult = pageData.executeFromStringToVector(sqlCountAgents);
	
%>

</head>
<script type="text/javascript">
var selectObject = "<%=pageData.getWord("Please select at least one object")%>";
</script>

<body class="bottompagebody">
<form name="theForm" id="theForm" action="agentReports.jsp" method="get" target="_blank" onSubmit="return getRequestedReport();">
<table border="0" cellpadding="0" cellspacing="0" width="80%">
	<tr>
		<td align="center" colspan="2"><b><%=pageData.getWord("Agent details report")%></b></td>
	</tr>
	<tr>
	  <td align="center" colspan="2">&nbsp;</td>
    </tr>
  	<tr>
		<td align="center" valign="top">   	    
			<select name="objects" size="15" multiple id="objects">
              <%
							AgentsCollection allAgents = new AgentsCollection(Integer.parseInt(tenantDbid));
							for(int i=0; i<allAgents.size();i++)
							{				
							%>
              <option value="<%=allAgents.elementAt(i).getLoginId()%>"><%=allAgents.elementAt(i).getLastName() + ", " + allAgents.elementAt(i).getFirstName() + " [" + allAgents.elementAt(i).getLoginId() + "]"%></option>
              <% }	%>
            </select>
			<table width="100%">			
						
				<tr>				
					<td colspan="2">
						<input type="checkbox" name="ckboxAgentByID" id="ckboxAgentByID" onClick="changeAgentListView()">
						<label for="ckboxAgentByID"><%=pageData.getWord("Show agent by ID")%></label>					</td>
				</tr>
		</table>		</td>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="100%">     
		  <tr height="26">
			<td><jsp:include page="simpleDatePicker.jsp"></jsp:include></td>
		  </tr>
		  <tr>
			<td>
			  <input type="checkbox" name="detail" id="detail">
			  <label for="detail"><%=pageData.getWord("detailed information")%></label>			</td>        
		  </tr>
		</table>		</td>
  	</tr>
  <input name="prec" type="hidden" value="-1">
  <input name="suiv" type="hidden" value="1">
  <input name="current" type="hidden" value="0">
  <input name="all_obj" type="hidden" value="0">
  <script language="javascript">
  	document.write("<input name=\"lang\" type=\"hidden\" value=\"" + lang + "\">");	
 </script>
  <%--Button--%>
  <tr>
  		<td colspan="2" align="right">
		<input name="btnSubmit" type="submit" value="<%=pageData.getWord("Submit")%>">	</td>
  </tr>
</table>
</form>
</body>
<% pageData.closeConnection();	 %>
</html>
