<%
/**
 * @Author FM L'Heureux
 * @Date 2007-08-09
 * @Version 0.1
 * @Description The purpose of this page is to create commissions from campaign Sells/Options ex.:3$/Television
 * 
 * Commission groups and prioryties could be added
 */
%>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.SQLException"%>
<%@page import ="aheevaManager.ressources.*"%>
<%@page import ="java.util.ArrayList"%>
<%@page import ="java.util.HashMap"%>
<%@page import ="java.lang.NumberFormatException"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Language" content="en-us">
<link rel=stylesheet href="xc2_default.css" type="text/css">




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
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../language.js"></script>
<script language="JavaScript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="mopFunctions.js"></script>

<script language="javascript" type="text/javascript" src="xc2_default.js"></script>
<script language="javascript" type="text/javascript">
	xcAutoHide=1000;
	xcDateFormat="YYYY-MM-DD";
</script>
<script language="javascript" type="text/javascript" src="xc2_inpage.js"></script>

<script language="javascript" type="text/javascript" >
var index = 1;
function add_row(){//op val pay
index ++;
	var tblBody = document.getElementById('opt_table').tBodies[0];
	var newRow = tblBody.insertRow(-1);
	var newCell0 = newRow.insertCell(0);
	newCell0.innerHTML = "<SELECT name='" + index + "_op'><OPTION value=''></OPTION><OPTION value='0'> < </OPTION>" +
											"<OPTION value='1'> >= </OPTION><OPTION value='2'> = </OPTION><OPTION value='3'> >= < </OPTION></SELECT>";

	var newCell1 = newRow.insertCell(1);
	newCell1.innerHTML = "<input type='text' name='" + index + "_val1' size='4' />";

	var newCell2 = newRow.insertCell(2);
	newCell2.innerHTML = "<input type='text' name='" + index + "_val2' size='4' />";
	
	var newCell3 = newRow.insertCell(3);
	newCell3.innerHTML = "<input type='text' name='" + index + "_pay' size='4' />";
}

</script>

</head>

<body class="bottompagebody">

<%!
	/**
	 * Basically tests a string for a valid date format. Example: will return true on 2008-02-31 even if it doesn't exists
	 */
	boolean validateDate(String date){
		if(date.length() != 10) return false;
		if(date.indexOf("-") != 4 || date.lastIndexOf("-") != 7) return false;
		try{
			int tmp;
			tmp = Integer.parseInt(date.substring(0, 4));
			if(tmp < 2000 || tmp > 3000) return false;
			tmp = Integer.parseInt(date.substring(5, 7));
			if(tmp < 1 || tmp > 12) return false;
			tmp = Integer.parseInt(date.substring(8));
			if(tmp < 1 || tmp > 31) return false;
		} catch(NumberFormatException e){
			return false;
		}
		return true;
	}

%>

<%!
	String query;
	beanManagerData pageData;
	ResultSet rs;
	String begin = "";
	String until = "";
	String name = "";
	String description = "";
	String lineClassStr;
	int type = -1;
	int extent = -1;
	int base = -1;
	int lineNum;
	int line;
	ArrayList val1Array = new ArrayList();
	ArrayList val2Array = new ArrayList();
	ArrayList payArray = new ArrayList();
	ArrayList opArray = new ArrayList();
	HashMap selectedIdsMap;//serve error case items recheck
	ArrayList selectedIdsList;//serve MySQL insertion
	HashMap selectedConditionMap;//error case
	ArrayList selectedConditionList;//MySQL insertion

	String getTableHeader(){
		return "<table align='center' border='1' class='reportsTabName' style='border-collapse:collapse ' bordercolor='#CCCCCC'>"
				+			"<tr>"
				+				"<td rowspan='2'></td>"
				+				"<td align='center' rowspan='2'><strong><script>document.write(MultiArray['Begin'][lang]);</script></strong></td>"
				+				"<td align='center' rowspan='2'><strong><script>document.write(MultiArray['Until'][lang]);</script></strong></td>"
				+				"<td align='center' rowspan='2'><strong><script>document.write(MultiArray['Name'][lang]);</script></strong></td>"
				+				"<td align='center' rowspan='2'><strong><script>document.write(MultiArray['Description'][lang]);</script></strong></td>"
				+				"<td align='center' rowspan='2'><strong><script>document.write(MultiArray['Type'][lang]);</script></strong></td>"
				+				"<td align='center' rowspan='2'><strong><script>document.write(MultiArray['Extent'][lang]);</script></strong></td>"
				+				"<td align='center' rowspan='2'><strong><script>document.write(MultiArray['Base'][lang]);</script></strong></td>"
				+				"<td align='center' colspan='3'><strong><script>document.write(MultiArray['Applicable items'][lang]);</script></strong></td>"
				+				"<td align='center'><strong><script>document.write(MultiArray['Commission Details'][lang]);</script></strong></td>"
				+				"<td align='center' rowspan='2'><strong><script>document.write(MultiArray['Commission Requirement'][lang]);</script></strong></td>"
				+				"<td align='center' rowspan='2'><strong><script>document.write(MultiArray['Modify'][lang]);</script></strong></td>"
				+			"</tr><tr>"
				+				"<td><strong><script>document.write(MultiArray['Category'][lang]);</script></strong></td>"
				+				"<td><strong><script>document.write(MultiArray['Group'][lang]);</script></strong></td>"
				+				"<td><strong><script>document.write(MultiArray['Description'][lang]);</script></strong></td>"
				+				"<td><table width='100%'><tr>"
				+					"<td align='center' width='40%'><strong><script>document.write(MultiArray['Operator'][lang]);</script></strong></td>"
				+					"<td align='center' width='30%' colspan='2'><strong><script>document.write(MultiArray['Value'][lang]);</script></strong></td>"
				+					"<td align='center' width='30%'><strong><script>document.write(MultiArray['Pay'][lang]);</script></strong></td>"
				+					"</tr></table></td>"
				+			"</tr>";
	}
	
	String getTableFooter(String cmp_id) throws SQLException{
		String returnStr = "<tr valign='top'>";
		returnStr +=	"<td></td>";
		returnStr +=	"<td id='cal3'><input type='text' name='begin' onfocus=\"showCalendar('', this, this, '', 'cal3', 0,30, 1)\" value='" + begin + "' size='10'></td>";
		if(until.compareTo("2001-01-01") == 0) until = "";
		returnStr +=	"<td id='cal2'><input type='text' name='until' onfocus=\"showCalendar('', this, this, '', 'cal2', 0,30, 1)\" value='" + until + "' size='10'></td>";
		if(until.length() == 0) until = "2001-01-01";
		returnStr +=	"<td><input type='text' name='name' value='" + name + "'></td>";
		returnStr +=	"<td><input type='text' name='description' value='" + description + "'></td>";
		returnStr +=	"<td><SELECT name='type'>";
		returnStr +=			"<OPTION value=''></OPTION>";
		returnStr +=			"<OPTION value='0' " + (type == 0 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Per Item'][lang]);</script></OPTION>";
		returnStr +=			"<OPTION value='1' " + (type == 1 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Bonus'][lang]);</script></OPTION>";
		returnStr += "</SELECT>";
		returnStr +=		"</td>";
		returnStr +=	"<td><SELECT name='extent'>";
		returnStr +=			"<OPTION value=''></OPTION>";
		returnStr +=			"<OPTION value='0' " + (extent == 0 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Agent'][lang]);</script></OPTION>";
		//returnStr +=			"<OPTION value='1' " + (extent == 1 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Group'][lang]);</script></OPTION>";
		//returnStr +=			"<OPTION value='2' " + (extent == 2 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Campaign'][lang]);</script></OPTION>";
		returnStr +=		"</SELECT>";
		returnStr +=		"</td>";
		returnStr +=	"<td><SELECT name='base'>";
		returnStr +=			"<OPTION value=''></OPTION>";
		//returnStr +=			"<OPTION value='0' " + (base == 0 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Hour'][lang]);</script></OPTION>";
		returnStr +=			"<OPTION value='1' " + (base == 1 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Day'][lang]);</script></OPTION>";
		returnStr +=			"<OPTION value='2' " + (base == 2 ? "selected='selected'" : "") + "><script>document.write(MultiArray['Week'][lang]);</script></OPTION>";
		returnStr +=		"</SELECT>";
		returnStr +=	"</td>";
		returnStr +=	"<td colspan='3'><script>document.write(MultiArray['Select from the list below'][lang]);</script></td>";
		returnStr +=	"<td>";
		returnStr +=		"<table id='opt_table' width='100%'>";

		int i = 0;
		for(i = 0; i < val1Array.size(); i ++){
			returnStr += "<tr>";
			returnStr += "<td id='op' width='40%' align='center'><SELECT name='" + i + "_op'>";
			returnStr +=	"<OPTION value=''></OPTION>";
			returnStr +=	"<OPTION value='0' " + ((Integer)opArray.get(i) == 0 ? "selected='selected'" : "") + "> < </OPTION>";
			returnStr +=	"<OPTION value='1' " + ((Integer)opArray.get(i) == 1 ? "selected='selected'" : "") + "> >= </OPTION>";
			returnStr +=	"<OPTION value='2' " + ((Integer)opArray.get(i) == 2 ? "selected='selected'" : "") + "> = </OPTION>";
			returnStr +=	"<OPTION value='3' " + ((Integer)opArray.get(i) == 3 ? "selected='selected'" : "") + "> >= < </OPTION>";
			returnStr += "</SELECT>";
			returnStr += "</td>";
			returnStr += "<td id ='val' width='30%' align='center'><input type='text' name='" + i + "_val1' size='4' value='" + val1Array.get(i) + "'/></td>";
			returnStr += "<td id ='val' width='30%' align='center'><input type='text' name='" + i + "_val2' size='4' value='" + val2Array.get(i) + "'/></td>";
			returnStr += "<td id='pay' width='30%' align='center'><input type='text' name='" + i + "_pay' size='4' value='" + payArray.get(i) +"'/></td>";
			returnStr += "</tr>";
		}
		
		if(i == 0){
			returnStr += "<tr>";
			
			returnStr += "<td id='op' width='40%' align='center'><SELECT name='" + i + "_op'>";
			returnStr += "	<OPTION value=''></OPTION>";
			returnStr += "	<OPTION value='0'> < </OPTION>";
			returnStr += "	<OPTION value='1'> >= </OPTION>";
			returnStr += "	<OPTION value='2'> = </OPTION>";
			returnStr += "	<OPTION value='3'> >= < </OPTION>";
			returnStr += "</SELECT>";
			returnStr += "</td>";
			returnStr += "<td id ='val' width='30%' align='center'><input type='text' name='" + i + "_val1' size='4'/></td>";
			returnStr += "<td id ='val' width='30%' align='center'><input type='text' name='" + i + "_val2' size='4'/></td>";
			returnStr += "<td id='pay' width='30%' align='center'><input type='text' name='" + i + "_pay' size='4'/></td>";
			returnStr += "</tr>";
		} else{
			i --;
		}
		returnStr += "</table><script type='text/javascript'>index=" + i +  ";</script>";
		
		returnStr += "</td>";
		returnStr += "<td><script>document.write(MultiArray['Select from the list below'][lang]);</script></td>";
		returnStr += "<td></td>";
		returnStr += "</tr>";
							
		returnStr += "<tr>";
		returnStr += "<td colspan='11'></td>";
		returnStr += "<td align='center'><a onclick=\"add_row();\" style=\"cursor: pointer;\"><script>document.write(MultiArray['Add'][lang]);</script></a></td>";
		returnStr += "<td colspan='2'></td>";
		returnStr += "</tr>";
		returnStr += "</table>";

							
							
		returnStr += "<br />";
		returnStr += "<table align='center' border='1' class='reportsTabName' style='border-collapse:collapse ' bordercolor='#CCCCCC'>";
		returnStr += "<tr>";
		returnStr += "<td colspan='6' align='center'><strong><script>document.write(MultiArray['Applicable items'][lang]);</script></strong></td>";
		returnStr += "</tr><tr>";
		returnStr += "<td></td>";
		returnStr += "<td><strong><script>document.write(MultiArray['Select'][lang]);</script></strong></td>";
		returnStr += "<td><strong><script>document.write(MultiArray['Active'][lang]);</script></strong></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Category'][lang]);</script></strong></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Group'][lang]);</script></strong></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Description'][lang]);</script></strong></td>";
		returnStr += "</tr>";
		
		query = "SELECT dispo.DBID, dispo.CATEGORY, dispo.GRP, dispo.DESCRIPTION, " +
									"dispo_cmp_assoc.ACTIVE " +
									"FROM dispo, dispo_cmp_assoc " + 
									"WHERE dispo.DBID=dispo_cmp_assoc.DISPO_DBID " +
									"AND dispo_cmp_assoc.CAMPAIGN_DBID='" + cmp_id + "'";
		rs = pageData.executeFromString(query);
		lineNum = 0;
		line = 1;
		
		String posted_id = "";
		while(rs.next()){//display all active or previously active sales/options
			lineNum = (lineNum + 1) % 2;
			if(lineNum == 0) lineClassStr = "reportsRowPair";
			else lineClassStr = "reportsRowUnPair";
			returnStr += "<tr class='" + lineClassStr + "'>";
			returnStr += "<td align='right'>" + line + "</td>";
			returnStr += "<td align='center'><input type='checkbox' name='" + rs.getString(1) + "_selected' ";
			if(selectedIdsMap.containsKey(rs.getString(1))) returnStr += "checked='checked'";
			returnStr += "/></td>";
			
			returnStr += "<td align='center'><input type='checkbox' disabled='disabled' name='" + rs.getString(1) + "_enable'";
			posted_id += "-" + rs.getString(1);
			if(rs.getInt(5) == 1){
				returnStr += "checked='checked'";
			}
			returnStr +="/></td>";
			
			returnStr +="<td align='center'>" + rs.getString(2) + "</td>";
			returnStr +="<td align='center'>" + rs.getString(3) + "</td>";
			returnStr +="<td align='center'>" + rs.getString(4) + "</td>";
			returnStr +="</tr>";
			line ++;
		}
		
		returnStr += "<tr><input type='hidden' name='posted_id' value='" + posted_id + "' />"; //this hidden value increases update performances by only updating changes 
		returnStr += "</tr>";
		returnStr += "</table>";
		returnStr += "<br />";
		returnStr += "<table align='center' border='1' class='reportsTabName' style='border-collapse:collapse ' bordercolor='#CCCCCC'>";
		returnStr += "<tr><td colspan='8' align='center'><strong><script>document.write(MultiArray['Commission Requirement'][lang]);</script></strong></td></tr>";
		returnStr += "<tr>";
		returnStr += "<td></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Select'][lang]);</script></bold></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Name'][lang]);</script></striong></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Extent'][lang]);</script></striong></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Base'][lang]);</script></striong></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Rule'][lang]);</script></striong></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Operator'][lang]);</script></striong></td>";
		returnStr += "<td align='center'><strong><script>document.write(MultiArray['Value'][lang]);</script></striong></td>";
		returnStr += "</tr>";
		query = "SELECT NAME, EXTENT, BASE, RULE, OP, VAL, DBID FROM commission_admissibility_rule";
		rs = pageData.executeFromString(query);
		line = 1;
		lineNum = 0;
		String requirementsIds = "";
		while(rs.next()){
			requirementsIds += "-" + rs.getString(7);
			lineNum = (lineNum + 1) % 2;
			if(lineNum == 0) lineClassStr = "reportsRowPair";
			else lineClassStr = "reportsRowUnPair"; 
			returnStr += "<tr class='" + lineClassStr + "' valign='top'>";
			returnStr += "<td>" + (line ++) + "</td>";
			returnStr += "<td align='center'><input type='checkbox' name='" + rs.getInt(7) + "_rule'" + (selectedConditionMap.containsKey(rs.getString(7)) ? "checked='checked'" : "") + "/></td>";
			returnStr += "<td>" + rs.getString(1) + "</td>";
			returnStr += "<td>"; 
			if(rs.getInt(2) == 0) returnStr += "<script>document.write(MultiArray['Agent'][lang]);</script>";
			else if(rs.getInt(2) == 1) returnStr += "<script>document.write(MultiArray['Group'][lang]);</script>";
			else if(rs.getInt(2) == 2) returnStr += "<script>document.write(MultiArray['Campaign'][lang]);</script>";
			returnStr += "</td>";
			returnStr += "<td>";
			if(rs.getInt(3) == 0) returnStr += "<script>document.write(MultiArray['Hour'][lang]);</script>";
			else if(rs.getInt(3) == 1) returnStr += "<script>document.write(MultiArray['Day'][lang]);</script>";
			else if(rs.getInt(3) == 2) returnStr += "<script>document.write(MultiArray['Week'][lang]);</script>";
			returnStr += "</td>";
			returnStr += "<td>";
			if(rs.getInt(4) == 0) returnStr += "<script>document.write(MultiArray['Work Hours'][lang]);</script>";
			else if(rs.getInt(4) == 1) returnStr += "<script>document.write(MultiArray['Disciplinary Measures'][lang]);</script>";
			else if(rs.getInt(4) == 2) returnStr += "<script>document.write(MultiArray['Productivity Ratio'][lang]);</script> (%)";
			else if(rs.getInt(4) == 3) returnStr += "<script>document.write(MultiArray['Quality Ratio'][lang]);</script> (%)";
			returnStr += "</td>";
			returnStr += "<td>";
			if(rs.getInt(5) == 0) returnStr += "<";
			else if(rs.getInt(5) == 1) returnStr += "<=";
			else if(rs.getInt(5) == 2) returnStr += "=";
			else if(rs.getInt(5) == 3) returnStr += ">=";
			else if(rs.getInt(5) == 4) returnStr += ">";
			returnStr += "</td>";
			returnStr += "<td>" + rs.getString(6) + "</td>";
			returnStr += "</tr>";
		}
		returnStr += "</table>";
		returnStr += "<input type='hidden' name='requirementIds' value='" + requirementsIds + "' />";
		return returnStr;
	}

%>

<%
	pageData = new beanManagerData();
	pageData.openConnection();
	
	begin = "";
	until = "";
	name = "";
	description = "";	
	type = -1;
	extent = -1;
	base = -1;
	String errorTxt = "The following field(s) must be corrected\\n";
	opArray = new ArrayList();
	val1Array = new ArrayList();
	val2Array = new ArrayList();
	payArray = new ArrayList();
	selectedIdsMap = new HashMap();//serve error case items recheck
	selectedIdsList = new ArrayList();//serve MySQL insertion
	selectedConditionMap = new HashMap();//error case
	selectedConditionList = new ArrayList();//MySQL insertion
	boolean cleanParam = true;
		
	
	//check for post	
	if(request.getParameter("setup_id2") != null && request.getParameter("change_date") != null){
	
		if(request.getParameter("setup_id2").indexOf("'") != -1 || request.getParameter("setup_id2").indexOf('"') != -1){
			%><script type='text/javascript'>alert("Internal Error");</script><%
		} else if(request.getParameter("change_date").indexOf("'") != -1 || request.getParameter("change_date").indexOf('"') != -1){
			%><script type='text/javascript'>alert("Erronous date");</script><%
		}
		query = "UPDATE commission_setup SET `UNTIL`='" + request.getParameter("change_date") + "' " +
				"WHERE DBID='" + request.getParameter("setup_id2") + "'";
		
		pageData.executeModification(query);
	}
	else if(request.getParameter("cmp_id") != null && request.getParameter("until") != null && request.getParameter("name") != null && request.getParameter("description") != null && 
		request.getParameter("type") != null && request.getParameter("extent") != null && request.getParameter("base") != null && request.getParameter("posted_id") != null && 
		request.getParameter("0_val1") != null && request.getParameter("0_val2") != null &&request.getParameter("0_pay") != null && request.getParameter("0_op") != null &&
		request.getParameter("requirementIds") != null && request.getParameter("begin") != null){
		begin = request.getParameter("begin").trim();
		until = request.getParameter("until").trim();
		name = request.getParameter("name").trim();
		description = request.getParameter("description").trim();
		try{
			type = Integer.parseInt(request.getParameter("type").trim());
			if(type < 0 || type > 1){
				cleanParam = false;
				errorTxt += "-Type\\n";
			}
		} catch (NumberFormatException e){
			cleanParam = false;
			errorTxt += "-Type\\n";
		}
		try{
			extent = Integer.parseInt(request.getParameter("extent").trim());
			if(extent < 0 || extent > 2){
				cleanParam = false;
				errorTxt += "-Extent\\n";
			}
		} catch (NumberFormatException e){
			cleanParam = false;
			errorTxt += "-Extent\\n";
		}
		try{
			base = Integer.parseInt(request.getParameter("base").trim());
			if(base < 0 || base > 2){
				cleanParam = false;
				errorTxt += "-Base\\n";
			}
		} catch (NumberFormatException e){
			cleanParam = false;
			errorTxt += "-Base\\n";
		}
		int index = 0;
		while(request.getParameter(index + "_val1") != null && request.getParameter(index + "_val2") != null && request.getParameter(index + "_pay") != null && request.getParameter(index + "_op") != null){
			if(request.getParameter(index + "_op").trim().compareTo("") != 0 || request.getParameter(index + "_pay").trim().compareTo("") != 0 || request.getParameter(index + "_val1").trim().compareTo("") != 0){
				try{
					opArray.add(Integer.parseInt(request.getParameter(index + "_op").trim()));
				}catch (NumberFormatException e){
					opArray.add("");
					if(cleanParam){
						cleanParam = false;
						errorTxt += "-Commission Details (invalid number)\\n";
					}
				}
				try{
					payArray.add(Double.parseDouble(request.getParameter(index + "_pay").trim()));
				}catch (NumberFormatException e){
					payArray.add("");
					if(cleanParam){
						cleanParam = false;
						errorTxt += "-Commission Details (invalid number)\\n";
					}
				}
				try{
					val1Array.add(Double.parseDouble(request.getParameter(index + "_val1").trim()));
				}catch (NumberFormatException e){
					val1Array.add("");
					if(cleanParam){
						cleanParam = false;
						errorTxt += "-Commission Details (invalid number)\\n";
					}
				}
				try{
					if(Integer.parseInt(request.getParameter(index + "_op").trim()) == 3) val2Array.add(Double.parseDouble(request.getParameter(index + "_val2").trim()));
					else val2Array.add("");
				}catch (NumberFormatException e){
					val2Array.add("");
					if(cleanParam){
						cleanParam = false;
						errorTxt += "-Commission Details (invalid number)\\n";
					}
				}
			}
			index ++;
		}
		
		String posted_id = request.getParameter("posted_id");
		String current_id;
		int posted_index;
		//create the list and map of the refernced Items
		while((posted_index = posted_id.lastIndexOf('-')) != -1){//loop while we have ids
			current_id = posted_id.substring(posted_index + 1);
			if(request.getParameter(current_id + "_selected") != null){
				selectedIdsMap.put(current_id, current_id);
				selectedIdsList.add(current_id);
			}
			posted_id = posted_id.substring(0, posted_index);//chop the end of the string
		}
		
		//create the list of the referenced conditions
		posted_id = request.getParameter("requirementIds");
		while((posted_index = posted_id.lastIndexOf('-')) != -1){//loop while we have ids
			current_id = posted_id.substring(posted_index + 1);
			if(request.getParameter(current_id + "_rule") != null){
				selectedConditionMap.put(current_id, current_id);
				selectedConditionList.add(current_id);
			}
			posted_id = posted_id.substring(0, posted_index);//chop the end of the string
		}
		
		index = 0;
		
		if(request.getParameter("cmp_id").indexOf("'") != -1 || request.getParameter("cmp_id").indexOf('"') != -1){
			%><script type='text/javascript'>alert("Invalid campaign id");</script><%
		} 
		if(begin.indexOf("'") != -1 || begin.indexOf('"') != -1 || !validateDate(begin)){
			errorTxt += "-Begin\\n";//TODO must be a date
			cleanParam = false;
		}
		if(until.indexOf("'") != -1 || until.indexOf('"') != -1 || (until.length() > 0 && !validateDate(until))){
			errorTxt += "-Until\\n";//TODO must be a date
			cleanParam = false;
		}
		if(name.indexOf("'") != -1 || name.indexOf('"') != -1){
			errorTxt += "-Name\\n";
			cleanParam = false;
		}
		if(name.length() == 0){
			errorTxt += "-Name (must not be empty)\\n";
			cleanParam = false;
		}
		if(description.indexOf("'") != -1 || description.indexOf('"') != -1){
			errorTxt += "-Description\\n";
			cleanParam = false;
		}
		if(request.getParameter("posted_id").indexOf("'") != -1 || request.getParameter("posted_id").indexOf('"') != -1){
			errorTxt += "\\nInternal parameter error\\n";
			cleanParam = false;
		}
		if(val1Array.size() == 0){
			errorTxt += "\\nYou must define at least one Commission Detail\\n";
			cleanParam = false;
		}
		if(selectedIdsList.size() == 0){
			errorTxt += "\\nYou muste select at least one Commission Item\\n";
			cleanParam = false;
		}
		
		while(request.getParameter(index + "_val") != null && request.getParameter(index + "_pay") != null && request.getParameter(index + "_op") != null){
			if(request.getParameter(index + "_val").indexOf("'") != -1 || request.getParameter(index + "_val").indexOf('"') != -1){//TODO numerical test with -
				errorTxt += "\\nInvalid Value #" + index;
				cleanParam = false;
			}else if(request.getParameter(index + "_op").indexOf("'") != -1 || request.getParameter(index + "_op").indexOf('"') != -1 ||
					(request.getParameter(index + "_op").compareTo("<") != 0 && request.getParameter(index + "_op").compareTo(">") != 0 && 
					 request.getParameter(index + "_op").compareTo("=") != 0 && request.getParameter(index + "_op").compareTo("><") != 0 &&
					 request.getParameter(index + "_op").compareTo("") != 0)){
				errorTxt += "\\nInvalid Operator #" + index;
				cleanParam = false;
			}else if(request.getParameter(index + "_pay").indexOf("'") != -1 || request.getParameter(index + "_pay").indexOf('"') != -1){//numerical
				errorTxt += "\\nInvalid pay #" + index;
				cleanParam = false;
			}else if(request.getParameter(index + "_op").compareTo("><") == 0 && request.getParameter(index + "_val").indexOf('-') == -1){
				errorTxt += "\\n\\nInvalid value #" + index + "\nWhen used with '><', it must contain be  value-value";
				cleanParam = false;
			}  
			if(!cleanParam) break;

			index ++;
		}
		index --;
		
		if(request.getParameter("update_id") != null && (request.getParameter("update_id").indexOf("'") != -1 || request.getParameter("update_id").indexOf('"') != -1)){
				cleanParam = false;
				errorTxt += "\\nCannot update. An error occured with the commission id to update";
		}
		
		if(cleanParam){ //parameters are clean, proceed we may make the insertions
			if(request.getParameter("update_id") != null){//update case. delete old infos (False update... delete old and insert new)
				query = "DELETE FROM commission_setup WHERE DBID='" + request.getParameter("update_id") + "'";
				pageData.executeModification(query);
				query = "DELETE FROM commission_rule WHERE COMMISSION_DBID='" + request.getParameter("update_id") + "'";
				pageData.executeModification(query);
				query = "DELETE FROM commission_object WHERE COMMISSION_SETUP_DBID='" + request.getParameter("update_id") + "'";
				pageData.executeModification(query);
				query = "DELETE FROM commission_admi_assoc WHERE COMMISSION_SETUP_DBID='" + request.getParameter("update_id") + "'";
				pageData.executeModification(query);
			}
			if(until.length() == 0) until= "2001-01-01";
			query = "INSERT INTO commission_setup (`CAMPAIGN_DBID`, `UNTIL`, `NAME`, `DESCRIPTION`, `CALCULATION_TYPE`, `CALCULATION_EXTENT`, `BASE`, `DEBUT`) " +
					"VALUES ('" + request.getParameter("cmp_id") + "', '" + until + "', '" + name + "', '" + description + "', '" + type + "', '" + extent + "', '" + base + "', '" + begin + "')";
			pageData.executeModification(query);
			query = "SELECT LAST_INSERT_ID()";
			rs = pageData.executeFromString(query);
			try{
				rs.next();
				for(int i = 0; i < selectedIdsList.size(); i ++){
					query = "INSERT INTO commission_object (`COMMISSION_SETUP_DBID`, `DISPO_DBID`) " +
							"VALUES ('" + rs.getString(1) + "', '" +  (String)selectedIdsList.get(i) + "')";
							
					pageData.executeModification(query);
				}
				for(int i = 0; i < opArray.size(); i ++){//op, val and pay theoritically have the same size
					if((Integer)opArray.get(i) == 3){
						query = "INSERT INTO commission_rule (`COMMISSION_DBID`, `OP`, `VAL1`, `VAL2`, `PAY`) " +
								"VALUES('" + rs.getString(1) + "', '" + (Integer)opArray.get(i) + "', '" + (Double)val1Array.get(i) + "', '" + (Double)val2Array.get(i) + "', '" + (Double)payArray.get(i) + "')";
					} else{
						query = "INSERT INTO commission_rule (`COMMISSION_DBID`, `OP`, `VAL1`, `PAY`) " +
								"VALUES('" + rs.getString(1) + "', '" + (Integer)opArray.get(i) + "', '" + (Double)val1Array.get(i) + "', '" + (Double)payArray.get(i) + "')";
					}
					
					pageData.executeModification(query);
				}
				

				for(int i = 0 ; i < selectedConditionList.size(); i ++){//conditions
					query = "INSERT INTO commission_admi_assoc (`COMMISSION_SETUP_DBID`, `COMMISSION_ADMI_DBID`) " +
							"VALUES('" + rs.getString(1) + "', '" + selectedConditionList.get(i) + "')";
					
					pageData.executeModification(query);
				}
				
				//reseting parameter
				begin = "";
				until = "";
				name = "";
				description = "";
				type = -1;
				extent = -1;
				base = -1;
				selectedIdsList = new ArrayList();
				opArray = new ArrayList();
				val1Array = new ArrayList();
				val2Array = new ArrayList();
				payArray = new ArrayList();
				selectedIdsMap = new HashMap();
				selectedConditionMap = new HashMap();
				selectedConditionList = new ArrayList();
				out.println("<script type='text/javascript'>document.location='?cmp_id=" + request.getParameter("cmp_id") + "'</script>"); 
			}catch(Exception e){
				out.println("SQL rs error --- " + query);
				e.printStackTrace();
			}
		}else{
			%><script type='text/javascript'>alert("<%= errorTxt %>");</script><%
		}
	}
%>

<div class="tab-pane" id="tabPane1">
<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
/*articleMenu.add(new WebFXMenuItem("Look &amp; Feel", "javascript:showArticleTab( \"looknfeel\" )"));*/
</script>
	<div class="tab-page" id="tabGeneral">
		<h2 class="tab"><script>document.write(MultiArray["General"][lang])</script></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabGeneral" ) );</script>
		<fieldset>
			<legend><script>document.write(MultiArray["General settings"][lang])</script></legend>
					<%
				if(request.getParameter("modify") != null && request.getParameter("modify").indexOf("'") == -1 && request.getParameter("modify").indexOf('"') == -1 &&
						request.getParameter("cmp_id") != null && request.getParameter("cmp_id").indexOf("'") == -1 && request.getParameter("cmp_id").indexOf('"') == -1){
					//Update display
					query = "SELECT UNTIL, NAME, DESCRIPTION, CALCULATION_TYPE, CALCULATION_EXTENT, BASE, DEBUT " +
								"FROM commission_setup WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "' " +
								"AND DBID='" + request.getParameter("modify") + "'";
					try{
						rs = pageData.executeFromString(query);
						rs.next();
						if (name.length() == 0){//means that it's the first access. otherwise it's a failed update and we already have the post infos
							until = rs.getString(1);
							begin = rs.getString(7);
							name = rs.getString(2);
							description = rs.getString(3);
							type = rs.getInt(4);
							extent = rs.getInt(5);
							base = rs.getInt(6);
							query = "SELECT dispo.DBID FROM dispo, commission_object " +
									"WHERE dispo.DBID=commission_object.DISPO_DBID " +
									"AND commission_object.COMMISSION_SETUP_DBID='" + request.getParameter("modify") + "' ";
							ResultSet rs2 = pageData.executeFromString(query);
							while(rs2.next()){//reload the dispos
								selectedIdsMap.put(rs2.getString(1), rs2.getString(1));
							}
							
							query = "SELECT DBID FROM commission_admissibility_rule, commission_admi_assoc " + 
									"WHERE commission_admi_assoc.COMMISSION_SETUP_DBID='" + request.getParameter("modify") + "' " +
									"AND commission_admissibility_rule.DBID=commission_admi_assoc.COMMISSION_ADMI_DBID ";
							rs2 = pageData.executeFromString(query);
							while(rs2.next()){//reload conditions
								selectedConditionMap.put(rs2.getString(1), rs2.getString(1));
							}
							
							query = "SELECT OP, VAL1, VAL2, PAY FROM commission_rule WHERE COMMISSION_DBID='" + request.getParameter("modify") + "'";
							rs2 = pageData.executeFromString(query);
							while(rs2.next()){//reload operations
								opArray.add(rs2.getInt(1));
								payArray.add(rs2.getInt(4));
								val1Array.add(rs2.getDouble(2));
								if(rs2.getInt(1) == 3) val2Array.add(rs2.getDouble(3));
								else val2Array.add("");
							}
						}
						
						out.println(getTableHeader());				
						out.println("<form name='comm_creator' method='post'>");
						out.println(getTableFooter(request.getParameter("cmp_id")));
						out.println("<br />");
						out.println("<div align='center'><script>document.write(\"<input type='submit' value='\" + MultiArray['Update'][lang] + \"' />\");</script>");
						out.println("<input type='hidden' name='update_id' value='" + request.getParameter("modify") + "' />");
						out.println("<script>document.write(\"<input type='submit' value='\" + MultiArray['Cancel'][lang] + \"' onclick=\\\"document.location='?cmp_id=" + request.getParameter("cmp_id") + "'\\\" />\");</script>");
						//out.println("<input type='button' value='Cancel' onclick=\"document.location='?cmp_id=" + request.getParameter("cmp_id") + "'\" /></div>");
						out.println("</form>");
						out.println("<br />");
					} catch (SQLException e){
						out.println("SQLException - Last query:" + query);
					} catch (Exception e){
						out.println("Error on page. Last query was:" + query);
					}
				}else if(request.getParameter("cmp_id") != null){
					//Input display
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
							%><script>document.write(MultiArray["Showing properties for"][lang]);</script>: <%= rs.getString(1) %> <a href="cmp_commission_creator.jsp">[<script>document.write(MultiArray["Switch"][lang]);</script>]</a></br>
							<script>document.write(MultiArray["Only active objects for the selected campaign are displayed"][lang]);</script>.</br>
							<%
							out.println(getTableHeader());
							query = "SELECT DBID, UNTIL, NAME, DESCRIPTION, CALCULATION_TYPE, CALCULATION_EXTENT, BASE, DEBUT " +
									"FROM commission_setup WHERE CAMPAIGN_DBID='" + request.getParameter("cmp_id") + "'";
							rs = pageData.executeFromString(query);
							lineNum = 0;
							line = 1;
							ResultSet rs2;
							String op = "";
							String val = "";
							String pay = "";
							while(rs.next()){//loop through all commissions for this campaign
								lineNum = (lineNum + 1) % 2;
								if(lineNum == 0) lineClassStr = "reportsRowPair";
								else lineClassStr = "reportsRowUnPair"; %>
								<tr class='<%= lineClassStr %>' valign='top'>
									<td><%= line ++ %>
									<td><%= rs.getString(8)  %></td>
									<td><%
										if(rs.getString(2).compareTo("2001-01-01") != 0) out.print(rs.getString(2)); 
									%>
										</td>
									<td><% out.print(rs.getString(3)); %></td>
									<td><% out.print(rs.getString(4)); %></td>
									<td><% 
										if(rs.getInt(5) == 0) out.print("Per Item");
										else if(rs.getInt(5) == 1) out.print("Bonus");
										%></td>
									<td><% 
										if(rs.getInt(6) == 0) out.print("Agent");
										else if(rs.getInt(6) == 1) out.print("Group");
										else if(rs.getInt(6) == 2) out.print("Campaign"); %></td>
									<td><% if(rs.getInt(7) == 0) out.print("Hour");
										else if(rs.getInt(7) == 1) out.print("Day");
										else if(rs.getInt(7) == 2) out.print("Week"); %></td>
									<%
									query = "SELECT dispo.CATEGORY, dispo.GRP, dispo.DESCRIPTION FROM dispo, commission_object " +
											"WHERE dispo.DBID=commission_object.DISPO_DBID " +
												"AND commission_object.COMMISSION_SETUP_DBID='" + rs.getString(1) + "' ";
									rs2 = pageData.executeFromString(query);
									%>
									<td><table>
									<%
									while(rs2.next()){
										out.println("<tr><td>" + rs2.getString(1) + "</td></tr>");
									}
									rs2.beforeFirst();
									%>
									</table></td>
									<td><table>
									<%
									while(rs2.next()){
										out.println("<tr><td>" + rs2.getString(2) + "</td></tr>");
									}
									rs2.beforeFirst();
									%>
									</table></td>
									<td><table>
									<%
									while(rs2.next()){
										out.println("<tr><td>" + rs2.getString(3) + "</td></tr>");
									}
									%>
									</table></td>
									
									<%
									query = "SELECT OP, VAL1, VAL2, PAY FROM commission_rule WHERE COMMISSION_DBID='" + rs.getString(1) + "'";
									rs2 = pageData.executeFromString(query);
									%>
									<td><table width='100%'>
									<%
									String sign = "";
									while(rs2.next()){										
										if(rs2.getInt(1) == 0) sign = "<";
										else if(rs2.getInt(1) == 1) sign = ">=";
										else if(rs2.getInt(1) == 2) sign = "=";
										else if(rs2.getInt(1) == 3) sign = ">= <";
										out.println("<tr><td align='center'>" + sign + "</td>");
										out.println("<td align='center'>" + rs2.getDouble(2) + "</td>");
										if(rs2.getInt(1) == 3){
											out.println("<td align='center'>" + rs2.getDouble(3) + "</td>");
										}else{
											out.println("<td></td>");
										}
										out.println("<td align='center'>" + rs2.getDouble(4) + "</td></tr>");
									}
									%>
									</table></td>
									
									<td>
										<%
										query = "SELECT NAME FROM commission_admissibility_rule, commission_admi_assoc " + 
												"WHERE commission_admi_assoc.COMMISSION_SETUP_DBID='" + rs.getString(1) + "' " +
												"AND commission_admissibility_rule.DBID=commission_admi_assoc.COMMISSION_ADMI_DBID ";
										rs2 = pageData.executeFromString(query);
										while(rs2.next()){
											out.println(rs2.getString(1) + "<br />");
										}
										%>
										</td>
									<td align='center' valign='middle'><input type='button' value='' onClick='document.location="?modify=<%= rs.getString(1) %>&cmp_id=<%= request.getParameter("cmp_id") %>"'/></td>
								</tr>
							<%
							}
							//now display a "make commission" box
							out.println("<form name='comm_creator' method='post'>");
							out.println(getTableFooter(request.getParameter("cmp_id")));
							out.println("<div align='center'><script>document.write(\"<input type='submit' value='\" + MultiArray['Create'][lang] + \"' />\");</script></div>"); //<input type='submit' value='Create'/>");
							out.println("</form>");
							
						} catch(Exception e){
							out.println("SQL rs error --- " + query);
							e.printStackTrace();
						}
					}
				}else{	
					%>
					<script>document.write(MultiArray["Choose a campaign"][lang]);</script>
					<table align="center" border="1" class="reportsTabName" style="border-collapse:collapse " bordercolor="#CCCCCC">
					<tr>
						<td></td>
						<td align="center"><strong><script>document.write(MultiArray["Name"][lang]);</script></strong></td>
						<td align="center"><strong><script>document.write(MultiArray["Description"][lang]);</script></strong></td>
						<td align="center"><strong><script>document.write(MultiArray["Choose"][lang]);</script></strong></td>
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
							out.println("<td align='center'>");
							out.println("<input type='button' onclick=\"document.location='cmp_commission_creator.jsp?cmp_id=" + rs.getString(1) + "'\"; /></td>");
							out.println("</tr>");
							line ++;
						}
					} catch(Exception e){
						out.println("SQL rs error --- " + query);
						e.printStackTrace();
					}
					out.print("</table>");
				}
					%>
							
</body>
</html>
