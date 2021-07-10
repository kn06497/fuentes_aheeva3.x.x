<html>
<%
/**
 * @Author FM L'Heureux
 * @Date 2007-08-06
 * @Version 0.1
 * @Description The purpose of this page is to create the sells options
 */
%>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="aheevaManager.ressources.*"%>
<%beanManagerData pageDispData = new beanManagerData();
pageDispData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDispData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

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

div.red{
	color:#FF0000;
}



</style>
<%@ include file="mopFunctions_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="mopFunctions.js"></script>
<%!

	beanManagerData pageData = new beanManagerData();
	ResultSet rs;
	String query;
	boolean  emptyField = false;
	String emptyFieldMessage = "Before you can use this page, you must create elements for the following field(s):\\n";
	String category = "";
	String group = "";
	String description = "";
	String call_code_type = "";
	String call_result = "";
	String record_status = "";
	
	String getCategoryOptions() throws Exception{
		String category_options = "<select name='category'>";
		category_options += "<option></option>";
		query = "SELECT * FROM dispo_category";
		rs = pageData.executeFromString(query);
		int rsLength = 0;
		while(rs.next()){
			rsLength ++;
			category_options += "<option value='" + rs.getString(1) + "' ";
			if(rs.getString(1).compareTo(category) == 0) category_options += "selected='selected' ";
			category_options += ">" + rs.getString(1) + "</option>";
		}
		category_options += "</select>";
		if(rsLength == 0){
			emptyField = true;
			emptyFieldMessage += "-Category\\n";
		}
		return category_options;
	}
	
	String getGroupOptions() throws Exception{
		String group_options = "<select name='group'>";
			group_options += "<option></option>";
			group_options += "<option value='Any'";
			if(group.compareTo("Any") == 0) group_options += "selected='selected' ";
			group_options += ">-Any-</option>";
			query = "SELECT * FROM dispo_grp";
			rs = pageData.executeFromString(query);
			int rsLength = 0;
			while(rs.next()){
				rsLength ++;
				group_options += "<option value='" + rs.getString(1) + "' ";
				if(rs.getString(1).compareTo(group) == 0) group_options += "selected='selected' ";
				group_options += ">" + rs.getString(1) + "</option>";
			}
			group_options += "</select>";
		return group_options;
	}
		
	String getCallCodeTypeOptions() throws Exception{
		String call_code_type_option = "<select name='call_code_type'>";
		call_code_type_option += "<option></option>";
		query = "SELECT * FROM dispo_call_code_type";
		rs = pageData.executeFromString(query);
		int rsLength = 0;
		while(rs.next()){
			rsLength ++;
			call_code_type_option += "<option value='" + rs.getString(1) + "' ";
			if(rs.getString(1).compareTo(call_code_type) == 0) call_code_type_option += "selected='selected' ";
			call_code_type_option += ">" + rs.getString(1) + "</option>";
		}
		call_code_type_option += "</select>";
		if(rsLength == 0){
			emptyField = true;
			emptyFieldMessage += "-Call Code Type\\n";
		}
		return call_code_type_option;
	}
	
	
	String getCallResultOptions() throws Exception{
		String call_result_option = "<select name='call_result'>";
		call_result_option += "<option></option>";
		query = "SELECT * FROM dispo_call_result";
		rs = pageData.executeFromString(query);
		int rsLength = 0;
		while(rs.next()){
			rsLength ++;
			call_result_option += "<option value='" + rs.getString(1) + "' ";
			if(rs.getString(1).compareTo(call_result) == 0) call_result_option += "selected='selected' ";
			call_result_option += ">" + rs.getString(1) + "</option>";
		}
		call_result_option += "</select>";
		if(rsLength == 0){
			emptyField = true;
			emptyFieldMessage += "-Call Result\\n";
		}
		return call_result_option;
	}
	
	String getRecordStatusOptions() throws Exception{
		String record_status_option = "<select name='record_status'>";
		record_status_option += "<option></option>";
		query = "SELECT * FROM dispo_record_status";
		rs = pageData.executeFromString(query);
		int rsLength = 0;
		while(rs.next()){
			rsLength ++;
			record_status_option += "<option value='" + rs.getString(1) + "' ";
			if(rs.getString(1).compareTo(record_status) == 0) record_status_option += "selected='selected' ";
			record_status_option += ">" + rs.getString(1) + "</option>";
		}
		record_status_option += "</select>";
		if(rsLength == 0){
			emptyField = true;
			emptyFieldMessage += "-Record Status\\n";
		}
		return record_status_option;
	}
%>

<%	
	emptyFieldMessage = "Before you can use this page, you must create elements for the following field(s):\\n";
	category = "";
	group = "";
	description = "";
	call_code_type = "";
	call_result = "";
	record_status = "";
	pageData.openConnection();
	
	if (request.getParameter("category") != null){//we have a post
		category = request.getParameter("category");
		group = request.getParameter("group");
		description = request.getParameter("description");
		call_code_type = request.getParameter("call_code_type");
		call_result = request.getParameter("call_result");
		record_status = request.getParameter("record_status");
		//check all fields for invalid characters
		if(category.indexOf("'") != -1 || category.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Category contains an invalid character');</script>");
		} else if(group.indexOf("'") != -1 || group.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Group contains an invalid character');</script>");
		}else if(description.indexOf("'") != -1 || description.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Description contains an invalid character');</script>");
		}else if(call_code_type.indexOf("'") != -1 || call_code_type.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Call code type contains an invalid character');</script>");
		}else if(call_result.indexOf("'") != -1 || call_result.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Call result contains an invalid character');</script>");
		}else if(record_status.indexOf("'") != -1 || record_status.indexOf('"') != -1){
			out.println("<script type='text/javascript'>alert('Record status contains an invalid character');</script>");
		}else if(category.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a category');</script>");
		}else if(group.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a group');</script>");
		}else if(description.length() == 0){
			out.println("<script type='text/javascript'>alert('You must enter a description');</script>");
		}else if(call_code_type.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a call code type');</script>");
		}else if(call_result.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a call_result');</script>");
		}else if(record_status.length() == 0){
			out.println("<script type='text/javascript'>alert('You must choose a record_status');</script>");
		}else{//no invalid char, proceed
			if(request.getParameter("update_dbid") != null){
				if(request.getParameter("update_dbid").indexOf("'") == -1 && request.getParameter("update_dbid").indexOf('"') == -1){
					query = "UPDATE dispo SET `CATEGORY`='" + category + "', " +
											"`GRP`='" + group + "', " + 
											"`DESCRIPTION`='" + description + "', " +
											"`CALL_CODE_TYPE`='" + call_code_type + "', " + 
											"`CALL_RESULT`='" + call_result + "', " +
											"`RECORD_STATUS`='" + record_status + "' " +
							"WHERE DBID='" + request.getParameter("update_dbid") + "'";
					pageData.executeModification(query);
					category = "";
					group = "";
					description = "";
					call_code_type = "";
					call_result = "";
					record_status = "";
					out.println("<script type='text/javascript'>document.location='?'</script>");
				} else{
					out.println("<div class='red'>Bad dispo DBID. Update failed</div>");
				}
				
			} else{
				query = "INSERT INTO dispo (`CATEGORY`, `GRP`, `DESCRIPTION`, `CALL_CODE_TYPE`, `CALL_RESULT`, `RECORD_STATUS`) " +
					"VALUES ('" + category + "', '" + group + "', '" + description + "', '" + call_code_type + "', '" + call_result + "', '" + record_status + "')";
				pageData.executeModification(query);
				category = "";
				group = "";
				description = "";
				call_code_type = "";
				call_result = "";
				record_status = "";
			}
		}
	}
%>

</head>
<body class="bottompagebody">





<div id="tabPane1">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
	
	<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><%= pageDispData.getWord("General")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<fieldset>
			<legend><%= pageDispData.getWord("General settings")%></legend>
			<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
				<tr>
					<td></td>
					<td align="center"><strong><%= pageDispData.getWord("Category")%></strong></td>
					<td align="center"><strong><%= pageDispData.getWord("Group")%></strong></td>
					<td align="center"><strong><%= pageDispData.getWord("Description")%></strong></td>
					<td align="center"><strong><%= pageDispData.getWord("Call Code Type")%></strong></td>
					<td align="center"><strong><%= pageDispData.getWord("Call result")%></strong></td>
					<td align="center"><strong><%= pageDispData.getWord("Record Status")%></strong></td>
					<td align="center"><strong><%= pageDispData.getWord("Edit")%></strong></td>
				</tr>
		<%
		if(request.getParameter("mod_id") != null){
			if(request.getParameter("mod_id").indexOf("'") == -1 && request.getParameter("mod_id").indexOf('"') == -1){
				query = "SELECT CATEGORY, GRP, DESCRIPTION, CALL_CODE_TYPE, CALL_RESULT, RECORD_STATUS FROM dispo " +
						"WHERE DBID='" + request.getParameter("mod_id") + "'";
				rs = pageData.executeFromString(query);
				if(rs.next()){
					category = rs.getString(1);
					group = rs.getString(2);
					description = rs.getString(3);
					call_code_type = rs.getString(4);
					call_result = rs.getString(5);
					record_status = rs.getString(6);
				%>
					<h4>WARNING: Editing these settings after they have been used in production may corrupt data integrity.<br />
					NOTE: Since the group option is only used for sorting purposes, it can be modified at any time without risk.</h4>
					<form name='edit' method='post'>
					<tr>
						<td></td>
						<td><%= getCategoryOptions() %></td>
						<td><%= getGroupOptions() %></td>
						<td><input type='text' name='description' value='<%= description %>'/></td>
						<td><%= getCallCodeTypeOptions() %></td>
						<td><%= getCallResultOptions() %></td>
						<td><%= getRecordStatusOptions() %></td>
						<td><input type='submit' /></td>
					</tr>
					<input type='hidden' name='update_dbid' value='<%= request.getParameter("mod_id") %>' />
					</form>
				<%
				}else{
					out.println("<td colspan='8' align='center'>DBID ERROR</td>");
				}
			} else{
				out.println("<td colspan='8' align='center'>DBID ERROR</td>");

			}
			out.println("<tr><td colspan='8' align='center'><input type='button' value='Cancel' onclick=\"document.location='?'\" /></td></tr>");
			out.println("</table>");
		} else{
		
			query = "SELECT CATEGORY, GRP, DESCRIPTION, CALL_CODE_TYPE, CALL_RESULT, RECORD_STATUS, DBID FROM dispo";
			rs = pageData.executeFromString(query);
			int lineNum = 0;
			int line = 1;
			int rsLength;
			String lineClassStr;
			try{
				while(rs.next()){//show all options
					lineNum = (lineNum + 1) % 2;
					if(lineNum == 0) lineClassStr = "reportsRowPair";
					else lineClassStr = "reportsRowUnPair";
					out.println("<tr class=" + lineClassStr + ">");
					out.println("<td>" + line  + "</td>");
					out.println("<td>" + rs.getString(1) + "</td>");
					out.println("<td>" + rs.getString(2) + "</td>");
					out.println("<td>" + rs.getString(3) + "</td>");
					out.println("<td>" + rs.getString(4) + "</td>");
					out.println("<td>" + rs.getString(5) + "</td>");
					out.println("<td>" + rs.getString(6) + "</td>");
					out.println("<td align='center'><input type='button' value='' onclick=\"document.location='?mod_id=" + rs.getString(7) + "'\"/></td>");
					out.println("</tr>");
					line ++;
				}
			} catch(Exception e){
				out.println("SQL rs error");
				e.printStackTrace();
			}
			
			//build all select input type
			String category_options = getCategoryOptions();			
			String group_options = getGroupOptions();	
			String call_code_type_option = getCallCodeTypeOptions();
			String call_result_option = getCallResultOptions();
			String record_status_option = getRecordStatusOptions();
			if(emptyField){
				out.println("<script type='text/javascript'>alert('" + emptyFieldMessage + "');</script>");
			}
			pageData.closeConnection();
			//display input line
			%>
					<tr><form name="new_dispo" method="POST">
					<td></td>
					<td align='center'><%= category_options %></td>
					<td align='center'><%= group_options %></td>
					<td align='center'><input type="text" size='50' name="description" value="<%= description %>" /></td>
					<td align='center'><%= call_code_type_option %></td>
					<td align='center'><%= call_result_option %></td>
					<td align='center'><%= record_status_option %></td>
					<td align='center'></td>
					</tr><tr>
					<td colspan="8" align="center">
					<input type='submit' value='<%= pageDispData.getWord("Add")%>'/>
					</td></tr>
					</table>
					</form>
		<% } 
		
		%>
		</fieldset>
	</div>
	
	
	

</div>


</body>

</html>
<% pageDispData.closeConnection(); %>

