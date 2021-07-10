<html>
<%
/**
 * @Author FM L'Heureux
 * @Date 2007-08-09
 * @Version 0.1
 * @Description The purpose of this page is to associate the campaigns with the sells options and then to configure the way they are shown on reports
 */
%>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.lang.NumberFormatException"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="aheevaManager.ressources.*"%>
<%beanManagerData pageDisData = new beanManagerData();
pageDisData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDisData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Language" content="en-us">

<style type="text/css">
.dynamic-tab-pane-control .tab-page {
	height:		200px;
}
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
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

a{
	color="#000000";
	 text-decoration:underline;
}


</style>
<%@ include file="mopFunctions_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="mopFunctions.js"></script>




</head>

<body class="dispo_body">
<%
	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	String query;
	String lineClassStr;
	ResultSet rs;
	int lineNum;
	int line;
%>

<div class="tab-pane" id="tabPane1">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
/*articleMenu.add(new WebFXMenuItem("Look &amp; Feel", "javascript:showArticleTab( \"looknfeel\" )"));*/
</script>

<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><%= pageDisData.getWord("General")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<fieldset>
			<legend><%= pageDisData.getWord("General settings")%></legend>
			<%
			String posted_id;
			String checked_id;
			//cmp_id -> post for campaign available results
			if (request.getParameter("posted_id") != null && request.getParameter("checked_id") != null && request.getParameter("cmp_id") != null && request.getParameter("cmp_id").length() != 0){
				//check for invalid characters
				if(request.getParameter("cmp_id").indexOf('"') != -1 || request.getParameter("cmp_id").indexOf("'") != -1){
					%><script type="text/javascript">alert("Invalid campaign id");
						document.location="dispo_cmp_assoc.jsp";
					</script>
					<%
				} else{
					posted_id = request.getParameter("posted_id");
					checked_id = request.getParameter("checked_id");
					int index;
					String current_id;
					boolean update;
					int active = 0;
					//loop through the posted items. The algorithm is made to avoid useless queries since it checks if there has been a modification before making an insertion/update
					while((index = posted_id.lastIndexOf('-')) != -1){//loop while we have ids
						current_id = posted_id.substring(index + 1);
						update = false;
						if(request.getParameter(current_id + "_enable") == null){
							//off
							if(checked_id.indexOf("-" + current_id + "-") != -1){
								//ON->OFF
								update = true;
								active = 0;
							}
						}else{
							//on
							if(checked_id.indexOf("-" + current_id + "-") == -1){
								//OFF->ON
								update = true;
								active = 1;
							}
						}
						
						if(update){
							query = "LOCK TABLE dispo_cmp_assoc WRITE";
							pageData.executeModification(query);
							query = "SELECT COUNT(*) FROM dispo_cmp_assoc " +
									"WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "' " +
									"AND DISPO_DBID='" + current_id + "'";
							rs = pageData.executeFromString(query);
							try{
								rs.next();
								if(rs.getInt(1) == 1){//update (there is already a row matching this campaign_dbid and dispo_dbid)
									query = "UPDATE dispo_cmp_assoc SET `ACTIVE`='" + active + "'" +  
											"WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "' " +
											"AND DISPO_DBID='" + current_id + "'";
									
								} else{//insert
									query = "INSERT INTO dispo_cmp_assoc (`CAMPAIGN_DBID`, `DISPO_DBID`, `REPORT_ORDER`, `CALL_CODE_MENU`,  `ACTIVE`) " +
											"VALUES ('" + request.getParameter("cmp_id") + "', '" + current_id + "', '0', '', '1')"; 
								}
								pageData.executeModification(query);
							}catch(Exception e){
								out.println("SQL rs error:" + query + "---" );
								e.printStackTrace();
							}
							query = "UNLOCK TABLES";
							pageData.executeModification(query);
						}
						
						
						posted_id = posted_id.substring(0, index);//chop the end of the string
					}
				}
			} else if(request.getParameter("posted_id") != null && request.getParameter("cmp2_id") != null){//cmp2_id = post for sells options details (for reports and pop-up)
				if(request.getParameter("cmp2_id").indexOf('"') != -1 || request.getParameter("cmp2_id").indexOf("'") != -1){//invalid char
					%><script type="text/javascript">alert("Invalid campaign id");
						document.location="dispo_cmp_assoc.jsp";
					</script>
					<%
				}else{
					posted_id = request.getParameter("posted_id");
					checked_id = request.getParameter("checked_id");
					int index;
					String current_id;
					String errorMsg = "The following entries contain invalid characters \n";
					boolean errorCase = false;
					int active = 0;
					while((index = posted_id.lastIndexOf('-')) != -1){//loop through the ids. This time we update every valid entry.
						current_id = posted_id.substring(index + 1);
						if(request.getParameter(current_id + "_ro") != null && request.getParameter(current_id + "_ccm") != null)
							if(request.getParameter(current_id + "_ro").indexOf("'") != -1 || request.getParameter(current_id + "_ro").indexOf('"') != -1){//invalid Report Order
								errorCase = true;
								errorMsg += "-" + request.getParameter(current_id + "_ro") + "\n";
							} else if(request.getParameter(current_id + "_ccm").indexOf("'") != -1 || request.getParameter(current_id + "_ccm").indexOf('"') != -1){//invalid call code menu
								errorCase = true;
								errorMsg += "-" + request.getParameter(current_id + "_ccm") + "\n";
							}else{//ok, we may insert
								try{
									Integer.parseInt(request.getParameter(current_id + "_ro"));//invalid non numeric Report Order goes in the catch block
									query = "UPDATE dispo_cmp_assoc SET `REPORT_ORDER`='" + request.getParameter(current_id + "_ro") + "', " + 
																		"`CALL_CODE_MENU`='" + request.getParameter(current_id + "_ccm") + "' " +
											"WHERE CAMPAIGN_DBID='" + request.getParameter("cmp2_id") + "' " +
												"AND DISPO_DBID='" + current_id + "'";
									pageData.executeModification(query);
								} catch(NumberFormatException e){
									errorCase = true;
									errorMsg += "-" + request.getParameter(current_id + "_ro") + "\n";
								}
							
						} //else ignore...
						posted_id = posted_id.substring(0, index);//chop the end of the string
					}
					if(errorCase){
						%><script type='text/javascript'>alert("Errors detected");</script> <%
					}
				}
			}
			
			if (request.getParameter("cmp_id") != null){//display the sells/options page
				if(request.getParameter("cmp_id").indexOf("'") != -1 || request.getParameter("cmp_id").indexOf('"') != -1 || request.getParameter("cmp_id").length() == 0){//error in the campaign id
					%><script type="text/javascript">alert("Invalid campaign id");
						document.location="dispo_cmp_assoc.jsp";
					</script>
					
					<%
				} else{
					query = "SELECT name, description FROM cfg_campaign WHERE dbid='" + request.getParameter("cmp_id") + "'";
					rs = pageData.executeFromString(query);
					try{
						rs.next();
						%><%= pageDisData.getWord("Showing properties for")%>: <%= rs.getString(1) %> <a href="dispo_cmp_assoc.jsp">[<%= pageDisData.getWord("Switch")%>]</a>
						<br />
						<form name="dispo_cmp_assoc_form" method="post">
						<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
						<tr>
							<td></td>
							<td><strong><%= pageDisData.getWord("Active")%></strong></td>
							<td><strong><%= pageDisData.getWord("Used")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Category")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Group")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Description")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Call Code Type")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Call result")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Record Status")%></strong></td>
						</tr>
						<%
						query = "SELECT dispo.DBID, dispo.CATEGORY, dispo.GRP, dispo.DESCRIPTION, dispo.CALL_CODE_TYPE, " +
								"dispo.CALL_RESULT, dispo.RECORD_STATUS, dispo_cmp_assoc2.ACTIVE " +
								"FROM dispo LEFT JOIN " +
									"(SELECT ACTIVE, DISPO_DBID FROM dispo_cmp_assoc  WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "') AS dispo_cmp_assoc2 " + 
									"ON dispo.dbid=dispo_cmp_assoc2.dispo_dbid ";
						rs = pageData.executeFromString(query);
						lineNum = 0;
						line = 1;
						checked_id = "-";
						posted_id = "";
						while(rs.next()){//prints all the available options
							lineNum = (lineNum + 1) % 2;
							if(lineNum == 0) lineClassStr = "reportsRowPair";
							else lineClassStr = "reportsRowUnPair";
							out.println("<tr class='" + lineClassStr + "'>");
							out.println("<td align='right'>" + line + "</td>");
							
							out.print("<td align='center'><input type='checkbox' name='" + rs.getString(1) + "_enable'");
							posted_id += "-" + rs.getString(1);
							if(rs.getInt(8) == 1){
								out.print("checked='checked'");
								checked_id += rs.getString(1) + "-";
							}
							out.println("/></td>");
							
							out.print("<td align='center'><input type='checkbox' disabled='disabled'");
							if(rs.getString(8) != null) out.print("checked='checked'");
							out.println("/></td>");
							
							out.println("<td align='center'>" + rs.getString(2) + "</td>");
							out.println("<td align='center'>" + rs.getString(3) + "</td>");
							out.println("<td align='center'>" + rs.getString(4) + "</td>");
							out.println("<td align='center'>" + rs.getString(5) + "</td>");
							out.println("<td align='center'>" + rs.getString(6) + "</td>");
							out.println("<td align='center'>" + rs.getString(7) + "</td>");
							out.println("</tr>");
							line ++;
						}
						%>
						<tr>
						<td colspan="9" align="center">
							<input type="hidden" name="posted_id" value="<%= posted_id %>" /> <% //this hidden value increases update performances by only updating changes  
																								%>
							<input type="hidden" name="checked_id" value="<%= checked_id %>" /> <% //this hidden value increases update performances by only updating changes 
																								%>
							<input type='submit' value='<%= pageDisData.getWord("Update")%>'/>
		
						</td>
						</tr>
						</table>
						</form>
						<%
					}catch(Exception e){
						out.println("SQL rs error ---" + query );
						e.printStackTrace();
					}
				}
			}else if(request.getParameter("cmp2_id") != null){//display the campaign configuration for selected sell/options
				if(request.getParameter("cmp2_id").indexOf("'") != -1 || request.getParameter("cmp2_id").indexOf('"') != -1 || request.getParameter("cmp2_id").length() == 0){//invalid campaign id
					%><script type="text/javascript">alert("Invalid campaign id");
						document.location="dispo_cmp_assoc.jsp";
					</script>
					
					<%
				}else{
					query = "SELECT name, description FROM cfg_campaign WHERE dbid='" + request.getParameter("cmp2_id") + "'";
					rs = pageData.executeFromString(query);
					try{
						rs.next();
						%><%= pageDisData.getWord("Showing configuration for")%>: <%= rs.getString(1) %> <a href="dispo_cmp_assoc.jsp">[<%= pageDisData.getWord("Switch")%>]</a>
						<br />
						<form name="dispo_cmp_assoc_conf_form" method="post">
						<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
						<tr>
							<td></td>
							<td><strong><%= pageDisData.getWord("Active")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Category")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Group")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Description")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Call Code Type")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Call result")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Record Status")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Report Order")%></strong></td>
							<td align="center"><strong><%= pageDisData.getWord("Call Code Menu")%></strong></td>
						</tr>
						<%
						query = "SELECT dispo.DBID, dispo.CATEGORY, dispo.GRP, dispo.DESCRIPTION, dispo.CALL_CODE_TYPE, " +
								"dispo.CALL_RESULT, dispo.RECORD_STATUS, dispo_cmp_assoc.ACTIVE, dispo_cmp_assoc.REPORT_ORDER, dispo_cmp_assoc.CALL_CODE_MENU " +
								"FROM dispo, dispo_cmp_assoc " + 
								"WHERE dispo.DBID=dispo_cmp_assoc.DISPO_DBID " +
								"AND dispo_cmp_assoc.CAMPAIGN_DBID='" + request.getParameter("cmp2_id") +"'";
						rs = pageData.executeFromString(query);
						lineNum = 0;
						line = 1;
						checked_id = "-";
						posted_id = "";
						while(rs.next()){//display all active or previously active sales/options
							lineNum = (lineNum + 1) % 2;
							if(lineNum == 0) lineClassStr = "reportsRowPair";
							else lineClassStr = "reportsRowUnPair";
							out.println("<tr class='" + lineClassStr + "'>");
							out.println("<td align='right'>" + line + "</td>");
							
							out.print("<td align='center'><input type='checkbox' disabled='disabled' name='" + rs.getString(1) + "_enable'");
							posted_id += "-" + rs.getString(1);
							if(rs.getInt(8) == 1){
								out.print("checked='checked'");
								checked_id += rs.getString(1) + "-";
							}
							out.println("/></td>");
							
							out.println("<td align='center'>" + rs.getString(2) + "</td>");
							out.println("<td align='center'>" + rs.getString(3) + "</td>");
							out.println("<td align='center'>" + rs.getString(4) + "</td>");
							out.println("<td align='center'>" + rs.getString(5) + "</td>");
							out.println("<td align='center'>" + rs.getString(6) + "</td>");
							out.println("<td align='center'>" + rs.getString(7) + "</td>");
							out.println("<td align='center'><input type='text' size='1' name='" + rs.getString(1) + "_ro' value='" + rs.getString(9) + "'/></td>");
							out.println("<td align='center'><input type='text' size='30' name='" + rs.getString(1) + "_ccm' value='" + rs.getString(10) + "'/></td>");
							out.println("</tr>");
							line ++;
						}
						
						%>
						<tr><input type="hidden" name="posted_id" value="<%= posted_id %>" /> <% //this hidden value increases update performances by only updating changes 
																		%>
							<td colspan='10' align='center'><input type='submit' value='<%= pageDisData.getWord("Update")%>'/></td>
						</tr>
						<table><%
					}catch(Exception e){
						out.println("SQL rs error ---" + query );
						e.printStackTrace();
					}					
				}
			} else{//nothing selected, show all campaigns
			%>
				<%= pageDisData.getWord("Choose a campaign")%>
				<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
				<tr>
					<td></td>
					<td align="center"><strong><%= pageDisData.getWord("Name")%></strong></td>
					<td align="center"><strong><%= pageDisData.getWord("Description")%></strong></td>
					<td align="center"><strong><%= pageDisData.getWord("Choose results")%></strong></td>
					<td align="center"><strong><%= pageDisData.getWord("Configure results")%></strong></td>
				</tr>
				<%
				query = "SELECT dbid, name, description FROM cfg_campaign";
				rs = pageData.executeFromString(query);
				lineNum = 0;
				line = 1;
				try{
					while(rs.next()){
						lineNum = (lineNum + 1) % 2;
						if(lineNum == 0) lineClassStr = "reportsRowPair";
						else lineClassStr = "reportsRowUnPair";
						out.println("<tr class='" + lineClassStr + "' >");
						out.println("<td>" + line  + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td align='center'><input type='button' onclick=\"document.location='dispo_cmp_assoc.jsp?cmp_id=" + rs.getString(1) + "'\"; /></td>");
						out.println("<td align='center'><input type='button' onclick=\"document.location='dispo_cmp_assoc.jsp?cmp2_id=" + rs.getString(1) + "'\"; /></td>");
						out.println("</tr>");
						line ++;
					}
				} catch(Exception e){
					out.println("SQL rs error --- " + query);
					e.printStackTrace();
				}
				%>
				</table>
			<%
			}
			%>
			</fieldset>
	</div>
	
	
	

</div>

</body>
</html>
<% pageDisData.closeConnection(); %>
