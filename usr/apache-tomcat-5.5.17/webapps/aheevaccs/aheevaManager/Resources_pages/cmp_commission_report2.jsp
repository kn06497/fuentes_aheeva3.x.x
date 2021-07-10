<%
/**
 * @Author FM L'Heureux
 * @Date 2007-08-14
 * @Version 0.1
 * @Description The purpose of this page is to create commissions from campaign Sales/Options ex.:3$/Television
 * 
 * Commission groups and prioryties could be added
 */
%>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="aheevaManager.ressources.*"%>
<%@page import ="aheevaManager.wfm.beanPayrollData"%>
<%@page import ="java.sql.SQLException"%>
<%beanManagerData pagerepp2Data = new beanManagerData();
pagerepp2Data.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagerepp2Data.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>

<html>
<head>
<title>Commission Report</title>
<script type="text/javascript">
	var lang = 0;
</script>
<style type="text/css">

table.main{
	border-style:'outset';
	border-width:1px;
	border-spacing:1px;
}

td{
	border-style:outset;
	border-width:1px;
}

div.red{
	color:#FF0000;
}
</style>
<%
	pageData.openConnection();
%>
<%!
	beanManagerData pageData = new beanManagerData();
	beanPayrollData payrollData = new beanPayrollData();
	

	
	/**
	 *Modifies the received list to add the passed value at the specified index
	 */
	 
	class commissionTotal{
		String period = "";
		double commissionTotalWorkTime;
		ArrayList commissionTotalSells;
		double commissionTotalPay;
		
		commissionTotal(){
			commissionTotalWorkTime = 0;
			commissionTotalSells = new ArrayList();
			commissionTotalPay = 0;
		}
	}
	
	class ReturnPack{
		String toPrint = "";
		double doubleValue;
	}
	 
	void myALIncrement(ArrayList al, int index, int value){
		while(al.size() <= index){
			al.add(0);
		}
		al.set(index, (Integer)al.get(index) + value);
	}
	
	
	/**
	*Return the login time in seconds from datamart_cmp_info_no_agg for the agent between the mentioned period
	*/
    double getLoginTime(String agentID, String beginTime, String endTime) throws SQLException
    {
		String query;
		ResultSet rsTmp;
		query ="SELECT SUM(T_LOGIN) FROM datamart_cmp_info_no_agg " +
				"WHERE EVENT_TIME >= '" + beginTime + "' " +
					"AND EVENT_TIME <= '" + endTime + "' " +
					"AND AGENT_ID='" + agentID + "'";
		
		rsTmp = pageData.executeFromString(query);
		rsTmp.next();
		return rsTmp.getDouble(1);

    }
	
	/**
	 * Builds the rules result set
	 */
	 
	ResultSet buildRule(String commissionID) throws SQLException{
		String query = "SELECT NAME, EXTENT, RULE, OP, VAL, BASE FROM commission_admissibility_rule, commission_admi_assoc " +
				"WHERE commission_admi_assoc.COMMISSION_SETUP_DBID='" + commissionID + "' " +
					"AND commission_admi_assoc.COMMISSION_ADMI_DBID=commission_admissibility_rule.DBID";
		return pageData.executeFromString(query);
	}
	
	
	
	/**
	 * Prints the matching rule and return the pay value. 
	 */
	ReturnPack printRule(double totalRatio, String commissionDBID) throws SQLException{
		String query = "SELECT OP, VAL1, VAL2, PAY FROM commission_rule " +
				"WHERE COMMISSION_DBID='" + commissionDBID + "'";
		ResultSet rsTmp = pageData.executeFromString(query);
		ReturnPack rp = new ReturnPack();
		while(rsTmp.next()){// possible op 0=<, 1=>, 2==, 3=>=<
			if(rsTmp.getInt(1) == 0 && totalRatio < rsTmp.getDouble(2)){ //<
				rp.toPrint = "<td align='center'>x &lt;" + rsTmp.getDouble(2) +"</td>";
				rp.doubleValue = rsTmp.getDouble(4);
				return rp;
			}else if(rsTmp.getInt(1) == 1 && totalRatio >= rsTmp.getDouble(2)){ //>=
				rp.toPrint = "<td align='center'>x &gt;=" + rsTmp.getDouble(2) +"</td>";
				rp.doubleValue =  rsTmp.getDouble(4);
				return rp;
			}else if(rsTmp.getInt(1) == 2 && totalRatio == rsTmp.getDouble(2)){ //=
				rp.toPrint = "<td align='center'>x =" + rsTmp.getDouble(2) + "</td>";
				rp.doubleValue =  rsTmp.getDouble(4);
				return rp;
			}else if(rsTmp.getInt(1) == 3 && totalRatio >= rsTmp.getDouble(2) && totalRatio < rsTmp.getDouble(3)){ //>=<
				rp.toPrint = "<td align='center'>" + rsTmp.getDouble(2) + "&gt;= x &lt;"  + rsTmp.getDouble(3) + "</td>";
				rp.doubleValue =  rsTmp.getDouble(4);
				return rp;
			}
		}
		rp.toPrint = "<td align='center'>-</td>";
		rp.doubleValue = -1;
		return rp;
	}
	
	/**
	 * Return a string to print containing the agent total row
	 */
	String printAgentTotal(double agentTotalWorkTime, ArrayList agentTotalSells, double agentTotalPay, boolean payPerItem) throws SQLException{
		String toPrint = "";
		toPrint += "<tr>";
		toPrint += "<td colspan='3'></td>";
		toPrint += "<td align='center'><strong>TOTAL</strong></td>";
		String query = "SELECT SEC_TO_TIME(" + agentTotalWorkTime + ")";
		ResultSet rsTmp = pageData.executeFromString(query);
		rsTmp.next();
		toPrint += "<td align='center'>" + (rsTmp.getString(1) == null ? "0" : rsTmp.getString(1)) + "</td>";//work time
		int totalTmp = 0;
		for(int i = 0; i < agentTotalSells.size(); i ++){
			toPrint += "<td align='center'>" + agentTotalSells.get(i) + "</td>";//total sells
			totalTmp += (Integer)agentTotalSells.get(i);
		}
		toPrint += "<td align='center'>" + totalTmp + "</td>";
		if(agentTotalWorkTime > 0){
			agentTotalWorkTime = agentTotalWorkTime/3600;
			for(int i = 0; i < agentTotalSells.size(); i ++){
				toPrint += "<td align='center'>" + payrollData.getMyNumberFormat(((Integer)agentTotalSells.get(i))/agentTotalWorkTime, 3) + "</td>";//total ratio
			}
			toPrint += "<td align='center'>" + payrollData.getMyNumberFormat(totalTmp/agentTotalWorkTime, 3) + "</td>";
		} else{
			for(int i = 0; i < agentTotalSells.size(); i ++){
				toPrint += "<td align='center'>-</td>";
			}
			toPrint += "<td align='center'>-</td>";
		}
		toPrint += "<td align='center'>-</td>";//rule
		if(payPerItem){ //pay per item		
			toPrint += "<td align='center'>-</td>";
		}
		toPrint += "<td align='center'>" + payrollData.getMyNumberFormat(agentTotalPay, 2) + "</td>";
		toPrint += "</tr>";
		return toPrint;
	}

	/**
	 * Inspired by mysql function SEC_TO_TIME, takes seconds and return HH:MM:SS
	 */
	String secToTime(int rSeconds){
		int seconds = rSeconds % 60;
		rSeconds -= rSeconds % 60;
		int min = (rSeconds % 3600)/60;
		rSeconds -= rSeconds % 3600;
		int hours = rSeconds/3600;
		String result;
		if(hours < 10) result = "0" + Integer.toString(hours) + ":";
		else result = Integer.toString(hours) + ":";
		
		if(min < 10) result += "0" + Integer.toString(min) + ":";
		else result += Integer.toString(min) + ":";
		
		if (seconds < 10) result += "0" + Integer.toString(seconds);
		else result += Integer.toString(seconds);
		return result;
	}
%>


</head>
<body>
<div align='center'>
<h1>Commission Report</h1>
<%
	if(request.getParameter("lang") != null){
		out.println("<script type='text/javascript'>lang = " + request.getParameter("lang") + ";</script>");
	}

	if(!payrollData.openConnection()){
		out.println("Connection problem");
		System.exit(0);
	}
	boolean haveWeek = false;
	boolean haveWeekTested = false;
	String firstBeginWeekDay = "";
	String query;
	ResultSet rs, rsDispo, rsAgent, rsTmp, rsRules;
	String start;
	String end;
	int group_id;
	ArrayList agentBrokenConditions;
	double agentTotalWorkTime;
	ArrayList agentTotalSells;
	double agentTotalPay;
	ArrayList commissionTotalAl;
	
	
if( request.getParameter("id") != null && request.getParameter("id").indexOf("'") == -1 && request.getParameter("id").indexOf('"') == -1 &&
	request.getParameter("start") != null && request.getParameter("start").indexOf("'") == -1 && request.getParameter("start").indexOf('"') == -1 &&
	request.getParameter("end") != null && request.getParameter("end").indexOf("'") == -1 && request.getParameter("end").indexOf('"') == -1){
	query = "SELECT DATEDIFF('" + request.getParameter("end") + "', '" + request.getParameter("start") + "')";
	rs = pageData.executeFromString(query);
	try{
		rs.next();
		if(rs.getInt(1) < -31 || rs.getInt(1) > 31){
			out.println("The maximum range between start and end must be 31 days.");
		} else{
			if(rs.getInt(1) < 0){ //the parameters are inverted
				start = request.getParameter("end");
				end = request.getParameter("start");
			} else{
				start = request.getParameter("start");
				end = request.getParameter("end");
			}
			query = "SELECT name, description, agent_group_dbid FROM cfg_campaign WHERE DBID='" + request.getParameter("id") + "'" ;
			rs = pageData.executeFromString(query);
			rs.next();
			group_id = rs.getInt(3);
			out.println("<h3>" + rs.getString(1) + "</h3>");
			%>
			Showing for <%= start %> to
			<%= end %> </br> 
			
			<%			
			//returns all the active commissions
			query = "SELECT COUNT(*) FROM commission_setup " +
					"WHERE (UNTIL='2001-01-01' OR UNTIL >='" + start + "') " +
					"AND DEBUT <='" + end + "' " +
					"AND CAMPAIGN_DBID='" + request.getParameter("id") + "'";
			rs = pageData.executeFromString(query);
			rs.next();
			if(rs.getInt(1) == 0){
				out.print("No commission found for this campaign in the specified range");
			}
					
			query = "SELECT DBID, UNTIL, NAME, DESCRIPTION, CALCULATION_TYPE, CALCULATION_EXTENT, BASE, DEBUT FROM commission_setup " +
					"WHERE (UNTIL='2001-01-01' OR UNTIL >='" + start + "') " +
					"AND CAMPAIGN_DBID='" + request.getParameter("id") + "'";
			rs = pageData.executeFromString(query);
			while(rs.next()){
				agentBrokenConditions = new ArrayList();
				commissionTotalAl = new ArrayList();
				//build rules for this one
				rsRules = payrollData.buildRule(rs.getString(1));
			 %>
				<table class='main'>
					<tr>
						<th><%= rs.getString(3) %></th>
						<td colspan='3'><%= rs.getString(4) %></td>
					</tr><tr>
						<td><strong><%= pagerepp2Data.getWord("Begin")%>:</strong><%= rs.getString(8) %></td>
						<td><strong><%= pagerepp2Data.getWord("Until")%>:</strong><% if( rs.getString(2).compareTo("2001-01-01") != 0) out.print(rs.getString(2));
									else out.print("-");%></td>
						<td><strong><%= pagerepp2Data.getWord("Type")%>:</strong><% if(rs.getInt(5) == 0) out.print(pagerepp2Data.getWord("Per Item"));
									else if(rs.getInt(5) == 1) out.print(pagerepp2Data.getWord("Bonus")); %></td>
						<td><strong><%= pagerepp2Data.getWord("Extent")%>:</strong><% if(rs.getInt(6) == 0) out.print(pagerepp2Data.getWord("Agent"));
														else if(rs.getInt(6) == 1) out.print( pagerepp2Data.getWord("Group"));
														else if(rs.getInt(7) == 1) out.print( pagerepp2Data.getWord("Campaign")); %></td>
						<td><strong><%= pagerepp2Data.getWord("Base")%>:</strong><% if(rs.getInt(7) == 0) out.print(pagerepp2Data.getWord("Hour"));
														else if(rs.getInt(7) == 1) out.print( pagerepp2Data.getWord("Day"));
														else if(rs.getInt(7) == 2) out.print( pagerepp2Data.getWord("Week")); %></td>
					</tr><tr>
						<td colspan='5'>
							<table>
								<tr valign='top'>
								<% query = "SELECT COUNT(*) FROM dispo, commission_object " +
											"WHERE dispo.DBID=commission_object.DISPO_DBID AND commission_object.COMMISSION_SETUP_DBID='" + rs.getString(1) + "'";
									rsTmp = pageData.executeFromString(query);
									rsTmp.next();
								%>
									<th rowspan='2'><%= pagerepp2Data.getWord("Agent ID")%></th>
									<th rowspan='2'><%= pagerepp2Data.getWord("Agent Last Name")%></th>
									<th rowspan='2'><%= pagerepp2Data.getWord("Agent First Name")%></th>
									<th rowspan='2'><%= pagerepp2Data.getWord("Work Period")%></th>
									<th rowspan='2'><%= pagerepp2Data.getWord("Work Time")%></th>
									<th colspan='<%= rsTmp.getInt(1) + 1 %>'><%= pagerepp2Data.getWord("Sold Items")%></th>
									<th colspan='<%= rsTmp.getInt(1) + 1 %>'><%= pagerepp2Data.getWord("Sold Ratio")%></th>
									<th rowspan='2'><%= pagerepp2Data.getWord("Rule")%></th>
									<% if(rs.getInt(5) == 0) out.println("<th rowspan='2'>"+pagerepp2Data.getWord("Pay per Item")+"</th>"); %>
									<th rowspan='2'><%= pagerepp2Data.getWord("Pay")%></th>
								</tr><tr>
								<% query = "SELECT dispo.DESCRIPTION, dispo.DBID FROM dispo, commission_object " +
											"WHERE dispo.DBID=commission_object.DISPO_DBID AND commission_object.COMMISSION_SETUP_DBID='" + rs.getString(1) + "'";
								rsDispo = pageData.executeFromString(query);
								while(rsDispo.next()){
									out.println("<td>" + rsDispo.getString(1) + "</td>");
								}
								out.println(pagerepp2Data.getWord("Total")+"</td>");
								
								rsDispo.beforeFirst();
								while(rsDispo.next()){
									out.println("<td>" + rsDispo.getString(1) + "</td>");
								}
								out.println("<td>"+pagerepp2Data.getWord("Total")+"</td>");
								%>								
								</tr>
								<% query = "SELECT DISTINCT AGENT_ID FROM datamart_cmp_info_no_agg, cfg_campaign " +
										"WHERE EVENT_TIME >='" + request.getParameter("start") + " 00:00:00' " +
											"AND EVENT_TIME <='" + request.getParameter("end") + " 23:59:59' " +
											"AND cfg_campaign.DBID='" + request.getParameter("id") + "' " +
											"AND cfg_campaign.AGENT_GROUP_DBID=datamart_cmp_info_no_agg.GRP_DBID";
								rsAgent = pageData.executeFromString(query);
								while(rsAgent.next()){
									agentTotalWorkTime = 0;
									agentTotalSells = new ArrayList();
									agentTotalPay = 0;
									query = "SELECT LAST_NAME, FIRST_NAME FROM cfg_person WHERE LOGIN_ID='" + rsAgent.getString(1) + "'";
									rsTmp = pageData.executeFromString(query);
									rsTmp.next();
									%><tr>
										<td><%= rsAgent.getString(1) %></td>
										<td><%= rsTmp.getString(1) %></td>
										<td><%= rsTmp.getString(2) %></td>
										<%  
											ArrayList agentSales;
											double workTime = 0;//in hours
											double totalRatio = 0;
											int totalSales = 0;
											boolean ruleFound;
											int numRow = 0;
											if(rs.getInt(7) == 0){//agent has work. different cases for hours, day and week - hour case
												
											} else if(rs.getInt(7) == 1){//day
												String today;
												String thisEnd = end;
												query = "SELECT DATEDIFF('" + rs.getString(8) + "', '" + start + "')";
												rsTmp = pageData.executeFromString(query);
												rsTmp.next();
												if(rsTmp.getInt(1) > 0) today = rs.getString(8);
												else today = start;
												if(rs.getString(2).compareTo("2001-01-01") != 0){
													query = "SELECT DATEDIFF('" + rs.getString(2) + "', '" + end + "')";
													rsTmp = pageData.executeFromString(query);
													rsTmp.next();
													if(rsTmp.getInt(1) < 0) thisEnd = rs.getString(2);
												}
												do{
													if(commissionTotalAl.size() <= numRow){
														commissionTotalAl.add(new commissionTotal());
														((commissionTotal)commissionTotalAl.get(numRow)).period = today;
													}
													if(numRow > 0){
														out.print("<tr><td colspan='3'>");
													}
													out.print("<td>" + today + "</td>");
													query = "SELECT SUM(T_LOGIN) FROM datamart_cmp_info_no_agg " +
																		"WHERE EVENT_TIME >= '" + today + " 00:00:00' " +
																			"AND EVENT_TIME <= '" + today + " 23:59:59'" +
																			"AND AGENT_ID='" + rsAgent.getString(1) + "'";
													rsTmp = pageData.executeFromString(query);
													rsTmp.next();
													if(rsTmp.getInt(1) > 0){
														workTime = rsTmp.getDouble(1)/3600;
														agentTotalWorkTime += rsTmp.getDouble(1);
														((commissionTotal)commissionTotalAl.get(numRow)).commissionTotalWorkTime += rsTmp.getInt(1);
													} else{
														workTime = 0;
													}
													query = "SELECT SEC_TO_TIME(" + rsTmp.getString(1) + ")";
													rsTmp = pageData.executeFromString(query);
													rsTmp.next();
													if(rsTmp.getInt(1) > 0){
														out.println("<td align='center'>" + rsTmp.getString(1) + "</td>");
													}else{
														out.println("<td align='center'>0</td>");
													}
													
													rsDispo.beforeFirst();
													agentSales = new ArrayList();
													totalSales = 0;
													{
														int i = 0;
														while(rsDispo.next()){//for each item, calculate qty
															query = "SELECT SUM(QUANTITY) FROM sales " + 
																	"WHERE EVENT_TIME >= '" + today +  " 00:00:00' " +
																	"AND EVENT_TIME <= '" + today + " 23:59:59' " +
																	"AND AGENT_ID='" + rsAgent.getString(1) + "' " +
																	"AND GROUP_ID='" + group_id + "' " +
																	"AND DISPO_DBID='" + rsDispo.getString(2) + "'";
															rsTmp = pageData.executeFromString(query);
															rsTmp.next();
															agentSales.add(rsTmp.getDouble(1));
															totalSales += rsTmp.getInt(1);
															out.println("<td align='center'>" + rsTmp.getInt(1) + "</td>");
															myALIncrement(agentTotalSells, i, rsTmp.getInt(1));
															myALIncrement(((commissionTotal)commissionTotalAl.get(numRow)).commissionTotalSells, i, rsTmp.getInt(1));
															i ++;
														}
													}
													out.println("<td align='center'>" + totalSales + "</td>");//total
													
													//for array list print ratio
													for(int i = 0; i < agentSales.size(); i ++){
														if(workTime > 0){
															out.println("<td align='center'>" + payrollData.getMyNumberFormat((Double)agentSales.get(i)/workTime, 3) + "</td>");
														} else if((Double)agentSales.get(i) > 0) {
															out.println("<td align='center'>E</td>");
														} else{
															out.println("<td align='center'>-</td>");
														}
													}
													totalRatio = 0;
													if(workTime > 0){
														totalRatio = totalSales/workTime;
														out.println("<td align='center'>" + payrollData.getMyNumberFormat(totalRatio, 3) + "</td>");//total
													} else if(totalSales > 0){
														out.println("<td align='center'>E</td>");//total
													} else{
														out.println("<td align='center'>-</td>");//total
													}
													//check rule
													ReturnPack rp = printRule(totalRatio, rs.getString(1));
													out.println(rp.toPrint);
													if(rp.doubleValue != -1){
														String bc = payrollData.checkRules(rsAgent.getString(1), today, today, rsRules);
														if(bc.length() > 0){//rule borken!
															agentBrokenConditions.add("<strong>" + rsAgent.getString(1) + " </strong>" + today + "<br />" + bc);
															if(rs.getInt(5) == 0){ //pay per item		
																out.println("<td align='center'>" + rp.doubleValue + "</td>");
																out.println("<td align='center'><div class='red'>[" + payrollData.getMyNumberFormat((rp.doubleValue * totalSales), 2) + "]</div></td>");//do not pay
															} else{
																out.println("<td align='center'><div class='red'>[" + rp.doubleValue + "]</div></td>");//do not pay
															}
														} else {//admissible
															out.println("<td align='center'>" + payrollData.getMyNumberFormat(rp.doubleValue, 2) + "</td>");
															if(rs.getInt(5) == 0){ //pay per item
																out.println("<td align='center'>" + payrollData.getMyNumberFormat(rp.doubleValue * totalSales, 2) + "</td>");
																agentTotalPay += rp.doubleValue * totalSales;
																((commissionTotal)commissionTotalAl.get(numRow)).commissionTotalPay += rp.doubleValue * totalSales;//pay
															}else{
																agentTotalPay += rp.doubleValue;
																((commissionTotal)commissionTotalAl.get(numRow)).commissionTotalPay += rp.doubleValue;//pay
															}
														}
													} else{
														out.println("<td align='center'>-</td>");
														if(rs.getInt(5) == 0){
															out.println("<td align='center'>-</td>");
														}
													}
													
													
													query = "SELECT DATE_ADD('" + today + "', INTERVAL 1 DAY)";
													rsTmp = pageData.executeFromString(query);
													rsTmp.next();
													today = rsTmp.getString(1);
													query = "SELECT DATEDIFF('" + thisEnd + "', '" + today + "')";
													rsTmp = pageData.executeFromString(query);
													rsTmp.next();
													out.println("</tr>");
													numRow ++;
												}while(rsTmp.getInt(1) >= 0);
												if(numRow > 1){
													out.println(printAgentTotal(agentTotalWorkTime, agentTotalSells, agentTotalPay, rs.getInt(5) == 0));
												}
											} else if(rs.getInt(7) == 2){//week
												//#1:Find the first begining week (must be entirely within report bounds)
												String beginWeekDay;
												if(!haveWeekTested){
													haveWeekTested = true;
													query = "SELECT DATEDIFF('" + start + "', '" + rs.getString(8) + "')";
													rsTmp = pageData.executeFromString(query);
													rsTmp.next();
													if(rsTmp.getInt(1) < 0) start = rs.getString(8);
													query = "SELECT DATE_ADD('" + start + "', INTERVAL(SELECT (8 - DAYOFWEEK('" + start + "')) % 7) DAY)";
													rsTmp = pageData.executeFromString(query);
													rsTmp.next();
													firstBeginWeekDay = rsTmp.getString(1);
													query = "SELECT DATEDIFF('" + end + "', (SELECT DATE_ADD('" + firstBeginWeekDay + "', INTERVAL 6 DAY)))";
													rsTmp = pageData.executeFromString(query);
													rsTmp.next();
													if(rsTmp.getInt(1) >= 0){
														haveWeek = true;
													}
												}
												if(haveWeek){	
													if(rs.getInt(6) == 0){//extent by agent
														String endWeekDay;
														beginWeekDay = firstBeginWeekDay;
														do{
															if(numRow > 0){
																out.println("<td colspan='3'></td>");
															}
															
															
															query = "SELECT DATE_ADD('" + beginWeekDay + "', INTERVAL 6 DAY)";
															rsTmp = pageData.executeFromString(query);
															rsTmp.next();
															endWeekDay = rsTmp.getString(1);
															out.print("<td>" + beginWeekDay + " to " + endWeekDay + "</td>");//work period
															//check if the until is contained entirely
															
															if(rs.getString(2).compareTo("2001-01-01") != 0){
																query = "SELECT DATEDIFF('" + rs.getString(2) + "', '" + endWeekDay + "')";
																rsTmp = pageData.executeFromString(query);
																rsTmp.next();
																if(rsTmp.getInt(1) < 0){
																	out.println("<td colspan='7'><div class='red'>The current commission does not cover the entire week</div></td>");
																	break;
																}
															}
															if(commissionTotalAl.size() <= numRow){
																commissionTotalAl.add(new commissionTotal());
																((commissionTotal)commissionTotalAl.get(numRow)).period = beginWeekDay + " to " + endWeekDay;
															}
															
															
															query = "SELECT SUM(T_LOGIN) FROM datamart_cmp_info_no_agg " +
																		"WHERE EVENT_TIME >= '" + beginWeekDay + " 00:00:00' " +
																			"AND EVENT_TIME <= '" + endWeekDay + " 23:59:59'" +
																			"AND AGENT_ID='" + rsAgent.getString(1) + "'";
															rsTmp = pageData.executeFromString(query);
															rsTmp.next();
															agentTotalWorkTime += rsTmp.getInt(1);															
															((commissionTotal)commissionTotalAl.get(numRow)).commissionTotalWorkTime += rsTmp.getInt(1);
															workTime = getLoginTime(rsAgent.getString(1), beginWeekDay + " 00:00:00", endWeekDay + " 23:59:59")/3600;
															query = "SELECT SEC_TO_TIME(" + rsTmp.getString(1) + ")";
															rsTmp = pageData.executeFromString(query);
															rsTmp.next();
															out.print("<td align='center'>" + (rsTmp.getString(1) == null ? "0" : rsTmp.getString(1)) + "</td>");//work time
															
															rsDispo.beforeFirst();
															agentSales = new ArrayList();
															totalSales = 0;
															{
																int i = 0;
																while(rsDispo.next()){//for each item, calculate qty
																		query = "SELECT SUM(QUANTITY) FROM sales " + 
																				"WHERE EVENT_TIME >= '" + beginWeekDay +  " 00:00:00' " +
																				"AND EVENT_TIME <= '" + endWeekDay + " 23:59:59' " +
																				"AND AGENT_ID='" + rsAgent.getString(1) + "' " +
																				"AND GROUP_ID='" + group_id + "' " +
																				"AND DISPO_DBID='" + rsDispo.getString(2) + "'";
																	rsTmp = pageData.executeFromString(query);
																	rsTmp.next();
																	agentSales.add(rsTmp.getDouble(1));
																	totalSales += rsTmp.getInt(1);
																	out.println("<td align='center'>" + rsTmp.getInt(1) + "</td>");
																	myALIncrement(agentTotalSells, i, rsTmp.getInt(1));
																	myALIncrement(((commissionTotal)commissionTotalAl.get(numRow)).commissionTotalSells, i, rsTmp.getInt(1));
																	i ++;
																}
															}
															out.println("<td align='center'>" + totalSales + "</td>");//total
															
															//for array list print ratio
															for(int i = 0; i < agentSales.size(); i ++){
																if(workTime > 0){
																	out.println("<td align='center'>" + payrollData.getMyNumberFormat((Double)agentSales.get(i)/workTime, 3) + "</td>");
																} else if((Double)agentSales.get(i) > 0) {
																	out.println("<td align='center'>E</td>");
																} else{
																	out.println("<td align='center'>-</td>");
																}
															}
															totalRatio = 0;
															if(workTime > 0){
																totalRatio = totalSales/workTime;
																out.println("<td align='center'>" + payrollData.getMyNumberFormat(totalRatio, 3) + "</td>");//total
															} else if(totalSales > 0){
																out.println("<td align='center'>E</td>");//total
															} else{
																out.println("<td align='center'>-</td>");//total
															}
															
															//check matching rule
															
															ReturnPack rp = printRule(totalRatio, rs.getString(1));
															out.println(rp.toPrint);
															if(rp.doubleValue != -1){
																//check if agent is admissible
																String bc = payrollData.checkRules(rsAgent.getString(1), beginWeekDay, endWeekDay, rsRules);
																if(bc.length() > 0){//rule borken!
																	agentBrokenConditions.add("<strong>" + rsAgent.getString(1) + "</strong> " + beginWeekDay + " to " + endWeekDay + " <br />" + bc);
																	if(rs.getInt(5) == 0){ //pay per item		
																		out.println("<td align='center'>" + rp.doubleValue + "</td>");
																		out.println("<td align='center'><div class='red'>[" + payrollData.getMyNumberFormat((rp.doubleValue * totalSales), 2) + "]</div></td>");//do not pay
																	} else{
																		out.println("<td align='center'><div class='red'>[" + rp.doubleValue + "]</div></td>");//do not pay
																	}
																} else {//admissible
																	out.println("<td align='center'>" + payrollData.getMyNumberFormat(rp.doubleValue, 2) + "</td>");
																	if(rs.getInt(5) == 0){ //pay per item
																		out.println("<td align='center'>" + payrollData.getMyNumberFormat(rp.doubleValue * totalSales, 2) + "</td>");
																		agentTotalPay += rp.doubleValue * totalSales;
																		((commissionTotal)commissionTotalAl.get(numRow)).commissionTotalPay += rp.doubleValue * totalSales;//pay
																	}else{
																		agentTotalPay += rp.doubleValue;
																		((commissionTotal)commissionTotalAl.get(numRow)).commissionTotalPay += rp.doubleValue;//pay
																	}
																}
															} else{
																out.println("<td align='center'>-</td>");
																if(rs.getInt(5) == 0){
																	out.println("<td align='center'>-</td>");
																}
															}

															
															//goes to next week
															query = "SELECT DATE_ADD('" + beginWeekDay + "', INTERVAL 7 DAY)";
															rsTmp = pageData.executeFromString(query);
															rsTmp.next();
															beginWeekDay = rsTmp.getString(1);
															query = "SELECT DATEDIFF('" + end + "', (SELECT DATE_ADD('" + beginWeekDay + "', INTERVAL 6 DAY)))";
															rsTmp = pageData.executeFromString(query);
															rsTmp.next();
															out.println("</tr>");
															numRow ++;
														}while(rsTmp.getInt(1) > 0);
														out.println(printAgentTotal(agentTotalWorkTime, agentTotalSells, agentTotalPay, rs.getInt(5) == 00));
													}else if(rs.getInt(6) == 1){//extent by group/cmp
													
													}
												}else{
													//no full week
													out.println("<td align='center'>-</td>");//work period
													out.println("<td align='center'>-</td>");//work time
													rsDispo.beforeFirst();
													while(rsDispo.next()){
														out.println("<td align='center'>-</td>");
													}
													rsDispo.beforeFirst();
													while(rsDispo.next()){
														out.println("<td align='center'>-</td>");
													}
													out.println("<td align='center'>-</td>");//rule
													if(rs.getInt(5) == 0) out.println("<td align='center'>-</td>");//pay per item
													out.println("<td align='center'>-</td>");//pay
												}
												
											}%>
									</tr>
									
								<% } 
								out.println("<tr>");
								out.println("<td colspan='3'><strong>"+pagerepp2Data.getWord("Commission Total")+"</strong></td>");
									
								double tmpTotal;
								double tmpTotalTime;
								double tmpBigTotal = 0;
								double tmpBigTotalTime = 0;
								double tmpBigTotalPay = 0;
								ArrayList tmpBigTotalSells = new ArrayList();
								String timeStr;
								for(int i = 0; i < commissionTotalAl.size(); i ++){
									if(i > 0){
										out.println("<tr>");
										out.println("<td colspan='3'></td>");
									}
									out.println("<td align='center'>" + ((commissionTotal)commissionTotalAl.get(i)).period + "</td>");
									timeStr = secToTime((int)((commissionTotal)commissionTotalAl.get(i)).commissionTotalWorkTime);
									out.print("<td align='center'>" + timeStr + "</td>");//work time
									tmpTotal = 0;
									for(int j = 0; j < ((commissionTotal)commissionTotalAl.get(i)).commissionTotalSells.size(); j ++){
										out.println("<td align='center'>" + (Integer)((commissionTotal)commissionTotalAl.get(i)).commissionTotalSells.get(j) + "</td>");
										tmpTotal += (Integer)((commissionTotal)commissionTotalAl.get(i)).commissionTotalSells.get(j);
										myALIncrement(tmpBigTotalSells, j, ((Integer)((commissionTotal)commissionTotalAl.get(i)).commissionTotalSells.get(j)));
									}
									tmpBigTotal += tmpTotal;
									out.println("<td align='center'>" + Math.round(tmpTotal) + "</td>");
									tmpTotalTime = ((commissionTotal)commissionTotalAl.get(i)).commissionTotalWorkTime/3600;
									tmpBigTotalTime += ((commissionTotal)commissionTotalAl.get(i)).commissionTotalWorkTime;
									
									if(tmpTotalTime > 0){
										for(int j = 0; j < ((commissionTotal)commissionTotalAl.get(i)).commissionTotalSells.size(); j ++){
												out.println("<td align='center'>" + payrollData.getMyNumberFormat(((Integer)((commissionTotal)commissionTotalAl.get(i)).commissionTotalSells.get(j))/tmpTotalTime, 3) + "</td>");												
										}
										out.println("<td align='center'>" + payrollData.getMyNumberFormat(tmpTotal/tmpTotalTime, 3) + "</td>");
									} else{
										for(int j = 0; j < ((commissionTotal)commissionTotalAl.get(i)).commissionTotalSells.size(); j ++){
												out.println("<td align='center'>-</td>");												
										}
										out.println("<td align='center'>-</td>");
									}
									out.println("<td align='center'>-</td>");//rule
									if(rs.getInt(5) == 0){
										out.println("<td align='center'>-</td>");
									}
									out.println("<td align='center'>" + payrollData.getMyNumberFormat(((commissionTotal)commissionTotalAl.get(i)).commissionTotalPay, 2) + "</td>");//rule
									tmpBigTotalPay += (double)((commissionTotal)commissionTotalAl.get(i)).commissionTotalPay;
									out.println("</tr>");
									
									
									
								}
								//print big total
								if(commissionTotalAl.size() > 1){
									out.println("<tr>");
									out.println("<td colspan='3'></td>");
									out.println("<td align='center'><strong>TOTAL</strong></td>");
									query = "SELECT SEC_TO_TIME(" + tmpBigTotalTime + ")";
									rsTmp = pageData.executeFromString(query);
									rsTmp.next();
									out.print("<td align='center'>" + (rsTmp.getString(1) == null ? "0" : rsTmp.getString(1)) + "</td>");//work time
									tmpTotal = 0;
									for(int i = 0; i < tmpBigTotalSells.size(); i ++){
										out.println("<td align='center'>" + tmpBigTotalSells.get(i) + "</td>");//sells
										tmpTotal += (Integer)tmpBigTotalSells.get(i);
									}
									out.println("<td align='center'>" + Math.round(tmpTotal) + "</td>");
									tmpBigTotalTime = tmpBigTotalTime/3600;
									if(tmpBigTotalTime > 0){
										for(int i = 0; i < tmpBigTotalSells.size(); i ++){
											out.println("<td align='center'>" + payrollData.getMyNumberFormat((Integer)tmpBigTotalSells.get(i)/tmpBigTotalTime, 3) + "</td>");//sells
										}
										out.println("<td align='center'>" + payrollData.getMyNumberFormat(tmpTotal/tmpBigTotalTime, 3) + "</td>");//total sells
									} else{
										for(int i = 0; i < tmpBigTotalSells.size(); i ++){
											out.println("<td align='center'>-</td>");
										}
										out.println("<td align='center'>-</td>");
									}
									out.println("<td align='center'>-</td>");//rule
									if(rs.getInt(5) == 0){
											out.println("<td align='center'>-</td>");//pay per item
									}
									out.println("<td align='center'>" + payrollData.getMyNumberFormat(tmpBigTotalPay, 2) + "</td>");
									out.println("</tr>");
								}
								
							
								%>	
							
							</table>
						</td>
					</tr>
					<tr>
						<%
						//now print the excluded agents with their reasons
						if (agentBrokenConditions.size() > 0){
						%>
							<td colspan='5'>
							<h3><%= pagerepp2Data.getWord("Agents who didn't met the requirements")%></h3>
							<%
							for(int i = 0; i < agentBrokenConditions.size(); i ++){
								out.print(agentBrokenConditions.get(i));
							}
							%>
							</td>
						<% } %>
					</tr>	
				</table>
				<br/>
			<%
				if(haveWeekTested && !haveWeek){
					out.print("<div class='red'>"+pagerepp2Data.getWord("The selected dates do not cover a full week")+"</div>");
				}
			}
		}
	
	} catch(SQLException e){
		out.println("SQL rs error1 --- " + query + "</br>");
		out.println("state:" + e.getSQLState() + "  errCode:" + e.getErrorCode() + "  errMsg:" + e.getMessage());
	} catch(Exception e){
		out.println("SQL rs error2 --- " + query + "</br>");
		out.print(e);
		e.printStackTrace();
	}

}else{
	out.print("Parameter error");
} 
	pageData.closeConnection();
 %>
</div>
</body>
<% pagerepp2Data.closeConnection(); %>
</hmtl>
