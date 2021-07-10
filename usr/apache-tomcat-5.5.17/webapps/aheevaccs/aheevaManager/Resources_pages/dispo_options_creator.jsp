<html>
<%
/**
 * @Author FM L'Heureux
 * @Date 2007-08-06
 * @Version 0.1
 * @Description The purpose of this page is to create the numerous options that will be used in the dispo_creator. It facilitates the creation process and terms unification
 */
%>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="aheevaManager.ressources.*"%>
<%beanManagerData pageDispcData = new beanManagerData();
pageDispcData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDispcData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

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

html, body {
	background-color: #a3cccc;
	background-image: url(../img/dispo_body.png);
	background-repeat: repeat-x;
}

body {
	/* margin:		10px; */
	width:		auto;
	/*height:		auto; */
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
<%@ include file="mopFunctions_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="mopFunctions.js"></script>




</head>

<body class="dispo_body">
<div class="tab-pane" id="tabPane1">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
<%
	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	String query;
	String lineClassStr;
	ResultSet rs;
	int lineNum;
	int line;
%>

	
	
	
	<div class="tab-page" id="tab2">
		<h2 class="tab"><%= pageDispcData.getWord("Category")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tab2" ) );</script>
		<fieldset>
			<legend><%= pageDispcData.getWord("Add a category")%></legend>
			<form method="post" name="new_category">
			<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			<tr>
				<td></td>
				<td align="center"><strong><%= pageDispcData.getWord("Category")%></strong></td>
			</tr>
			
		<%
		String category = "";
		if (request.getParameter("category") != null){//we have a category post
			category = request.getParameter("category");
			
			if(category.indexOf("'") != -1 || category.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Category contains an invalid character');</script>");
			} else if(category.length() == 0){
				out.println("<script type='text/javascript'>alert('Category cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_category VALUES('" + category + "')";
				pageData.executeModification(query);
				category = "";
			}
		}
		query = "SELECT * FROM dispo_category";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display category
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		%>
			
			
			
			<tr>
				<td></td>
				<td><input type="text" name="category" value="<%= category %>" /></td>
			</tr><tr>
				<td></td>
				<td align="center"><input type='submit' value='<%= pageDispcData.getWord("Add")%>'/></td>
			</tr>
			</table>
			</form>
		</fieldset>
	</div>
	
	<div class="tab-page" id="tab3">
		<h2 class="tab"><%= pageDispcData.getWord("Group")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tab3" ) );</script>
		<fieldset>
			<legend><%= pageDispcData.getWord("Add a group")%></legend>
			<form method="post" name="new_group">
			<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			<tr>
				<td></td>
				<td align="center"><strong><%= pageDispcData.getWord("Group")%></strong></td>
			</tr>
			<%
		String group = "";
		if (request.getParameter("group") != null){//we have a group post
			group = request.getParameter("group");
			
			if(group.indexOf("'") != -1 || group.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Group contains an invalid character');</script>");
			} else if(group.length() == 0){
				out.println("<script type='text/javascript'>alert('Group cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_grp VALUES('" + group + "')";
				pageData.executeModification(query);
				group = "";
			}
		}
		query = "SELECT * FROM dispo_grp";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display group
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		%>
			
			
			
			<tr>
				<td></td>
				<td><input type="text" name="group" value="<%= group%>" /></td>
			</tr><tr>
				<td></td>
				<td align="center"><input type='submit' value='<%= pageDispcData.getWord("Add")%>'/></td>
			</tr>
			</table>
			</form>
		</fieldset>
	</div>
	
	
	
	<div class="tab-page" id="tab5">
		<h2 class="tab"><%= pageDispcData.getWord("Call result")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tab5" ) );</script>
		<fieldset>
			<legend><%= pageDispcData.getWord("Add a Call Result")%></legend>
			<form method="post" name="new_group">
			<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			<tr>
				<td></td>
				<td align="center"><strong><%= pageDispcData.getWord("Call result")%></strong></td>
			</tr>
			<%
		String call_result = "";
		if (request.getParameter("call_result") != null){//we have a call_result post
			call_result = request.getParameter("call_result");
			
			if(call_result.indexOf("'") != -1 || call_result.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Call Result contains an invalid character');</script>");
			} else if(call_result.length() == 0){
				out.println("<script type='text/javascript'>alert('Call result cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_call_result VALUES('" + call_result + "')";
				pageData.executeModification(query);
				call_result = "";
			}
		}
		query = "SELECT * FROM dispo_call_result";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display call_result
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		%>
			
			
			
			<tr>
				<td></td>
				<td><input type="text" name="call_result" value="<%= call_result %>" /></td>
			</tr><tr>
				<td></td>
				<td align="center"><input type='submit' value='<%= pageDispcData.getWord("Add")%>'/></td>
			</tr>
			</table>
			</form>
		</fieldset>
	</div>
	
	<div class="tab-page" id="tab6">
		<h2 class="tab"><%= pageDispcData.getWord("Record Status")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tab6" ), "javascript:showArticleTab( \"tab6\" )");</script>
		<fieldset>
			<legend><%= pageDispcData.getWord("Add a Record Status")%></legend>
			<form method="post" name="new_group">
			<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			<tr>
				<td></td>
				<td align="center"><strong><%= pageDispcData.getWord("Record Status")%></strong></td>
			</tr>
			<%
		String record_status = "";
		if (request.getParameter("record_status") != null){//we have a record_status post
			record_status = request.getParameter("record_status");
			
			if(record_status.indexOf("'") != -1 || record_status.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Record Status contains an invalid character');</script>");
			} else if(record_status.length() == 0){
				out.println("<script type='text/javascript'>alert('Record status cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_record_status VALUES('" + record_status + "')";
				pageData.executeModification(query);
				record_status = "";
			}
		}
		query = "SELECT * FROM dispo_record_status";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display record_status
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		%>
			<tr>
				<td></td>
				<td><input type="text" name="record_status" value="<%= record_status %>" /></td>
			</tr><tr>
				<td></td>
				<td align="center"><input type='submit' value='<%= pageDispcData.getWord("Add")%>'/></td>
			</tr>
			</table>
			</form>
		</fieldset>
	</div>
	
	<div class="tab-page" id="tab7">
		<h2 class="tab"><%= pageDispcData.getWord("Call Code Type")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tab7" ), "javascript:showArticleTab( \"tab7\" )");</script>
		<fieldset>
			<legend><%= pageDispcData.getWord("Add a Call Code Type")%></legend>
			<form method="post" name="new_group">
			<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			<tr>
				<td></td>
				<td align="center"><strong><%= pageDispcData.getWord("Call Code Type")%></strong></td>
			</tr>
			<%
		String call_code_type = "";
		if (request.getParameter("call_code_type") != null){//we have a call_code_type post
			call_code_type = request.getParameter("call_code_type");
			
			if(call_code_type.indexOf("'") != -1 || call_code_type.indexOf('"') != -1){
				out.println("<script type='text/javascript'>alert('Call Code Type contains an invalid character');</script>");
			} else if(call_code_type.length() == 0){
				out.println("<script type='text/javascript'>alert('Call code type cannot be empty');</script>");
			} else{
				query = "INSERT INTO dispo_call_code_type VALUES('" + call_code_type + "')";
				pageData.executeModification(query);
				call_code_type = "";
			}
		}
		query = "SELECT * FROM dispo_call_code_type";
		
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		try{//display call_code_type
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair";
				out.println("<tr class=" + lineClassStr + ">");
				out.println("<td>" + line  + "</td>");
				out.println("<td>" + rs.getString(1)  + "</td>");
				out.println("</tr>");
				line ++;
			}
		} catch(Exception e){
			out.println("SQL rs error");
			e.printStackTrace();
		}
		%>
			<tr>
				<td></td>
				<td><input type="text" name="call_code_type" value="<%= call_code_type %>" /></td>
			</tr><tr>
				<td></td>
				<td align="center"><input type='submit' value='<%= pageDispcData.getWord("Add")%>'/></td>
			</tr>
			</table>
			</form>
		</fieldset>
	</div>

</div>

<% pageData.closeConnection(); %>
</body>

</html>
<% pageDispcData.closeConnection(); %>
