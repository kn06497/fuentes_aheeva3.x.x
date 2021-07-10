<%
/**
 * @Author FM L'Heureux
 * @Date 2007-08-09
 * @Version 0.1
 * @Description The purpose of this page is to create commissions requirements an agent needs to meet to be eligible ex.:40h/week
 */
%>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="aheevaManager.ressources.*"%>
<%@page import ="java.lang.NumberFormatException"%>
<%
beanManagerData pageCmpData = new beanManagerData();
pageCmpData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCmpData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

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

<body class="f_i_com_body">
<%
	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	String query;
	String lineClassStr;
	ResultSet rs;
	int lineNum;
	int line;
	String name = "";
	int extent = -1;
	int base = -1;
	int rule = -1;
	int operator = -1;
	String value = "";
	
	if(request.getParameter("name") != null && request.getParameter("extent") != null && request.getParameter("base") != null && request.getParameter("rule") != null && 
		request.getParameter("operator") != null && request.getParameter("value") != null){
		try{
			name = request.getParameter("name");
			extent  = Integer.parseInt(request.getParameter("extent"));
			base = Integer.parseInt(request.getParameter("base"));
			rule = Integer.parseInt(request.getParameter("rule"));
			operator =Integer.parseInt(request.getParameter("operator"));
			value = request.getParameter("value");
			Double.parseDouble(request.getParameter("value"));
			if(name.indexOf("'") != -1 || name.indexOf('"') != -1){
				%><script type='text/javascript'>alert("Incorrect parameter. ' and \" are not allowed.");</script><%
			} else{//check if a duplicate exists
				query = "SELECT COUNT(*) FROM commission_admissibility_rule " + 
						"WHERE EXTENT='" + extent + "' AND BASE='" + base + "' AND RULE='" + rule + "' AND OP='" + operator + "' " +
						"AND VAL='" + Double.parseDouble(request.getParameter("value")) + "'";
				rs = pageData.executeFromString(query);
				rs.next();
				if(rs.getInt(1) == 0){//insert
					query = "INSERT INTO commission_admissibility_rule (`NAME`, `EXTENT`, `BASE`, `RULE`, `OP`, `VAL`) " +
							"VALUES('" + name + "', '" + extent + "', '" + base + "', '" + rule + "', '" + operator + "', '" + Double.parseDouble(request.getParameter("value")) + "')";
					pageData.executeModification(query);
					//reset values
					name = "";
					extent = -1;
					base = -1;
					rule = -1;
					operator = -1;
					value = "";
				}else{
					query = "SELECT NAME FROM commission_admissibility_rule " + 
							"WHERE EXTENT='" + extent + "' AND BASE='" + base + "' AND RULE='" + rule + "' AND OP='" + operator + "' " +
							"AND VAL='" + Double.parseDouble(request.getParameter("value")) + "'";
					rs = pageData.executeFromString(query);
					rs.next();
					%><script type='text/javascript'>alert("This rule already exists under the name \"<%= rs.getString(1) %>\"");</script><%
				}
			}
		} catch (NumberFormatException e){
			%><script type='text/javascript'>alert("Incorrect parameter");</script><%
		}
	}
%>

<div class="tab-pane" id="tabPane1">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
/*articleMenu.add(new WebFXMenuItem("Look &amp; Feel", "javascript:showArticleTab( \"looknfeel\" )"));*/
</script>
	
	<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><%= pageCmpData.getWord("General")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<fieldset>
			<legend><%= pageCmpData.getWord("General settings")%></legend>
			<form name='commission_condition' method='post'>
			<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
			<tr>
				<td></td>
				<td align='center'><strong><%= pageCmpData.getWord("Name")%></striong></td>
				<td align='center'><strong><%= pageCmpData.getWord("Extent")%></striong></td>
				<td align='center'><strong><%= pageCmpData.getWord("Base")%></striong></td>
				<td align='center'><strong><%= pageCmpData.getWord("Rule")%></striong></td>
				<td align='center'><strong><%= pageCmpData.getWord("Operator")%></striong></td>
				<td align='center'><strong><%= pageCmpData.getWord("Value")%></striong></td>
			</tr>
			<%
			query = "SELECT NAME, EXTENT, BASE, RULE, OP, VAL FROM commission_admissibility_rule";
			rs = pageData.executeFromString(query);
			line = 1;
			lineNum = 0;
			while(rs.next()){
				lineNum = (lineNum + 1) % 2;
				if(lineNum == 0) lineClassStr = "reportsRowPair";
				else lineClassStr = "reportsRowUnPair"; %>
				<tr class='<%= lineClassStr %>' valign='top'>
					<td><%= line ++ %></td>
					<td><%= rs.getString(1) %></td>
					<td><% if(rs.getInt(2) == 0) out.print(pageCmpData.getWord("Agent"));
							else if(rs.getInt(2) == 1) out.print(pageCmpData.getWord("Group"));
							else if(rs.getInt(2) == 2) out.print(pageCmpData.getWord("Campaign")); %>
						</td>
					<td><% if(rs.getInt(3) == 0) out.print(pageCmpData.getWord("Hour"));
							else if(rs.getInt(3) == 1) out.print(pageCmpData.getWord("Day"));
							else if(rs.getInt(3) == 2) out.print(pageCmpData.getWord("Week")); %>
						</td>
					<td><% if(rs.getInt(4) == 0) out.print(pageCmpData.getWord("Work Hours"));
							else if(rs.getInt(4) == 1) out.print(pageCmpData.getWord("Disciplinary Measures"));
							else if(rs.getInt(4) == 2) out.print(pageCmpData.getWord("Productivity Ratio")+"(%)");
							else if(rs.getInt(4) == 3) out.print(pageCmpData.getWord("Quality Ratio") +"(%)"); %>
						</td>
					<td><% if(rs.getInt(5) == 0) out.print("<");
							else if(rs.getInt(5) == 1) out.print("<=");
							else if(rs.getInt(5) == 2) out.print("=");
							else if(rs.getInt(5) == 3) out.print(">=");
							else if(rs.getInt(5) == 4) out.print(">"); %>
						</td>
					<td><%= rs.getString(6) %></td>
				</tr>
				<%
			}	
			%>
			<tr>
				<td></td>
				<td align='center'><input type='text' name='name' value='<%= name %>'/></td>
				<td align='center'><SELECT name='extent'>
						<OPTION value=''></OPTION>
						<OPTION value='0' <% if (extent == 0) out.print("selected='selected'"); %>><%= pageCmpData.getWord("Agent")%></OPTION>
						<!-- <OPTION value='1' <% if (extent == 1) out.print("selected='selected'"); %>><script>document.write(MultiArray['Group'][lang]);</script></OPTION> -->
						<!-- <OPTION value='2' <% if (extent == 2) out.print("selected='selected'"); %>><script>document.write(MultiArray['Campaign'][lang]);</script></OPTION> -->
					</SELECT></td>
				<td align='center'><SELECT name='base'>
						<OPTION value=''></OPTION>
						<!-- <OPTION value='0' <% if (base == 0) out.print("selected='selected'"); %>><script>document.write(MultiArray['Hour'][lang]);</script></OPTION> -->
						<OPTION value='1' <% if (base == 1) out.print("selected='selected'"); %>><%= pageCmpData.getWord("Day")%></OPTION>
						<OPTION value='2' <% if (base == 2) out.print("selected='selected'"); %>><%= pageCmpData.getWord("Week")%></OPTION>
					</SELECT></td>
				<td align='center'><SELECT name='rule'>
						<OPTION value=''></OPTION>
						<OPTION value='0' <% if (rule == 0) out.print("selected='selected'"); %>><%= pageCmpData.getWord("Work Hours")%></OPTION>
						<!-- <OPTION value='1' <% if (rule == 1) out.print("selected='selected'"); %>> pageCmpData.getWord("Disciplinary Measures")%></OPTION> 
						<OPTION value='2' <% if (rule == 2) out.print("selected='selected'"); %>>pageCmpData.getWord("Productivity Ratio")%> (%)</OPTION>
						<OPTION value='3' <% if (rule == 3) out.print("selected='selected'"); %>> pageCmpData.getWord("Quality Ratio")%> (%)</OPTION> -->
					</SELECT></td>
				<td align='center'><SELECT name='operator'>
						<OPTION value=''></OPTION>
						<OPTION value='0' <% if (operator == 0) out.print("selected='selected'"); %>> < </OPTION>
						<OPTION value='1' <% if (operator == 1) out.print("selected='selected'"); %>> <= </OPTION>
						<OPTION value='2' <% if (operator == 2) out.print("selected='selected'"); %>> = </OPTION>
						<OPTION value='3' <% if (operator == 3) out.print("selected='selected'"); %>> >= </OPTION>
						<OPTION value='4' <% if (operator == 4) out.print("selected='selected'"); %>> > </OPTION>
					</SELECT></td>
				<td align='center'><input type='text' name='value' size='3' value='<%= value %>'/></td>
			</tr><tr>
				<td colspan='7' align='center'>
				<input type='submit' value="<%= pageCmpData.getWord("Create")%>" />
				</td>
			</tr>
		</table>
		</form>
		</fieldset>
	</div>
</body>
</html><%pageCmpData.closeConnection(); %>
