<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.util.*"%>
<%@page import ="aheevaManager.wfm.*"%>
<%@page import ="java.util.StringTokenizer"%>
<%@page import ="aheevaManager.wfm.beanAgentLoginProdInfo"%>
<%@page import ="aheevaManager.wfm.beanLoginProdSummary"%>
<%@page import = "aheevaManager.ressources.*" %>
<jsp:useBean id="beanAgentLoginProdReport" scope="request" class="aheevaManager.wfm.beanAgentLoginProdReport" />
<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<head>
<%

beanManagerData pageData = new beanManagerData();
pageData.openConnection();

if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));


double prod_requirements = 24720.0 / 25200.0;     //        6h52/7h00 (en secondes)
beanAgentLoginProdReport.setTenantDBID(request.getParameter("tenant_dbid"));

//Liste des agents actifs
java.util.Vector agents = beanAgentLoginProdReport.getActiveAgents();
String login_id_tmp = "", name_tmp = "";
out.println("<script>");
out.println("var login_id_arr = new Array();");
out.println("var names_arr = new Array();");
for(int i = 0; i < agents.size(); i++)
{
	int j = 0;
	String agt = (String)agents.elementAt(i);
	StringTokenizer tokAgt = new StringTokenizer(agt, "|");
	while(tokAgt.hasMoreTokens())
	{
		if (j == 0) login_id_tmp = tokAgt.nextToken();
		if (j == 1) name_tmp = tokAgt.nextToken();
		j++;
	}
	out.println("login_id_arr["+i+"] = '"+login_id_tmp+"';");
	out.println("names_arr['" + login_id_tmp + "'] = '" + name_tmp + "';");
}
out.println("</script>");
//Liste des agent groups
java.util.Vector groups = beanAgentLoginProdReport.getAgentGroups();
java.util.HashMap mapGroups = new HashMap();
String key = "", value = "";
out.println("<script>");
out.println("var grp_dbids = new Array();");
out.println("var grp_names = new Array();");
for(int i = 0; i < groups.size(); i++)
{
	String grp = (String)groups.elementAt(i);
	StringTokenizer tokGrp = new StringTokenizer(grp, "|");
	for (int j = 0; j <= tokGrp.countTokens(); j++)
	{
		if (j == 0) key = tokGrp.nextToken();
		if (j == 1) value = tokGrp.nextToken();
	}
        mapGroups.put(key, value);

	out.println("grp_dbids[" + i + "] = '" + key + "';");
	out.println("grp_names[" + i + "] = '" + value + "';");
}
out.println("</script>");
%>
<title>Login and Production time report</title>

<script type="text/javascript" language="javascript" src="../Resources_pages/trim.js"></script>
<script type="text/javascript" language="javascript" src="../Resources_pages/jsUtil.js"></script>
<script type="text/javascript" language="javascript" src="../Resources_pages/sha1.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<script type="text/javascript">
prod_requirements = 24720.0 / 25200.0;    //     6h52  /  7h00   en secondes
var good_password = "2141c3a87ae43fc23312993785d55b341981250b";
var path = document.location.href;
var entered_password = "";
var modified = false;

function validateProductionTime(id, prod_time, login_time, sched_time, sched_work_time, login, totalUnpaidBreak)
{
	prod_time_value = convertTimeToSeconds(document.getElementById(prod_time).value);
	document.getElementById(prod_time).value = buildReadableTime(prod_time_value);
	document.getElementById("tmp_prod_time"+id).value = buildReadableTime(prod_time_value);
	var prod_total = 0;
	var login_total = 0;
	var first_login = 0;
	var last_logout = 0;
	var id_arr = new Array();
	prod_time_arr = document.getElementsByName("tmp_prod_time"+login);
	elementCount = prod_time_arr.length;

	for (x=0; x<elementCount; x++)
	{
		prod_total += parseInt(convertTimeToSeconds(prod_time_arr[x].value));
		cur_id = prod_time_arr[x].id.substr("tmp_prod_time".length, prod_time_arr[x].id.length);
		if(!cur_id.match(".*training.*"))
		{
			id_arr.push(cur_id);
			login_total += parseInt(document.getElementById("totalLoginTime"+cur_id).value);
			first_login_tmp = document.getElementById("firstLoginTime"+cur_id).value != "N/A" ? timestamp(document.getElementById("firstLoginTime"+cur_id).value) : 0;
			first_login = ((first_login_tmp < first_login) || (first_login == 0)) ? first_login_tmp : first_login;
			last_logout_tmp = document.getElementById("lastLogoutTime"+cur_id).value != "N/A" ? timestamp(document.getElementById("lastLogoutTime"+cur_id).value) : 0;
			last_logout = last_logout_tmp > last_logout ? last_logout_tmp : last_logout;
		}
	}
	document.getElementById("total_prod_time"+login).innerHTML = buildReadableTime(prod_total);

	var max_login_time_total = last_logout - first_login;
	first_login = document.getElementById("firstLoginTime"+id).value != "N/A" ? timestamp(document.getElementById("firstLoginTime"+id).value) : 0;
	last_logout = document.getElementById("lastLogoutTime"+id).value != "N/A" ? timestamp(document.getElementById("lastLogoutTime"+id).value) : 0;
	var max_login_time = last_logout - first_login;
	//if(prod_time_value > 0)
	//{
		// Ajout des pauses et diners
		//login_time_break = (login_time < 7200) ? login_time : login_time + 900 * (parseInt(login_time / 14400) + 1);   // 14400 = 4 h.   1 pause de 15 min(900 s) par tranche de 4 heures
		login_time_break = ((login_time < 14400) ? login_time : login_time - totalUnpaidBreak);  // 14400 = 4 h.  on retranche la pause de 30mn du lunch

		//login_total_break = (login_total < 7200) ? login_total : login_total + 900 * (parseInt(login_total / 14400) + 1);   // 14400 = 4 h.   1 pause de 15 min(900 s) par tranche de 4 heures

		login_total_break = ((login_total < 14400) ? login_total : login_total - totalUnpaidBreak);  // 14400 = 4 h.  on retranche la pause de 30mn du lunch


		if(max_login_time > 0)
		{
			if(login_time_break > max_login_time)
				login_time_break = login_time;
		}
		if(max_login_time_total > 0)
		{
			if(login_total_break > max_login_time_total)
				login_total_break = login_total;
		}
		//alert("login_time_break["+login_time_break+"]     login_total_break["+login_total_break+"]");

		if(sched_time > 0)
		{
			if(((prod_total / sched_time) < prod_requirements) || ((login_time_break / prod_time_value) < prod_requirements))
			{
				document.getElementById("ack"+id).disabled = false;
				if((prod_total / sched_time) < prod_requirements)
					document.getElementById("msg_err"+id).innerHTML = "Production time under requirements";
				else
					document.getElementById("msg_err"+id).innerHTML = "Login time too low";
			}
			else if((prod_total > sched_time))
			{
				document.getElementById("ack"+id).disabled = false;
				document.getElementById("msg_err"+id).innerHTML = "Production time greater than scheduled time!";
			}
			else
			{
				for(x = 0; x < id_arr.length; x++)
				{
					document.getElementById("ack"+id_arr[x]).disabled = true;
					document.getElementById("ack"+id_arr[x]).checked = false;
					document.getElementById("msg_err"+id_arr[x]).innerHTML = "";
				}
			}
		}
		else
		{
			var min_prod_total = login_total_break * prod_requirements;
			var max_prod_total = login_total_break;
			//var max_prod_total = login_total_break + (login_total_break - login_total_break * prod_requirements);
			var min_prod = login_time_break * prod_requirements;
			var max_prod = login_time_break;

			//alert("login_time_break["+login_time_break+"] --- total["+prod_total+"] min["+min_prod_total+"] max["+max_prod_total+"] --- current["+prod_time_value+"] min["+min_prod+"] max["+max_prod+"]");

			if(prod_total < min_prod_total || prod_time_value < min_prod)
			{
				document.getElementById("ack"+id).disabled = false;
				document.getElementById("msg_err"+id).innerHTML = "Production time lower than login time";
			}
			else if(prod_total > max_prod_total || prod_time_value > max_prod)
			{
				document.getElementById("ack"+id).disabled = false;
				document.getElementById("msg_err"+id).innerHTML = "Production time greater than login time!";
			}
			else
			{
				for(x = 0; x < id_arr.length; x++)
				{
					document.getElementById("ack"+id_arr[x]).disabled = true;
					document.getElementById("ack"+id_arr[x]).checked = false;
					document.getElementById("msg_err"+id_arr[x]).innerHTML = "";
				}
			}
		}
	//}*/
}

function validateTraining(id, prod_time, login)
{
	prod_time_value = convertTimeToSeconds(document.getElementById(prod_time).value);
	document.getElementById(prod_time).value = buildReadableTime(prod_time_value);
	if(login.length > 0)
	{
		document.getElementById("tmp_prod_time"+id).value = buildReadableTime(prod_time_value);
		var prod_total = 0;
		prod_time_arr = document.getElementsByName("tmp_prod_time"+login);
		elementCount = prod_time_arr.length;

		for(x=0; x<elementCount; x++)
		{
			prod_total += parseInt(convertTimeToSeconds(prod_time_arr[x].value));
		}
		document.getElementById("total_prod_time"+login).innerHTML = buildReadableTime(prod_total);
	}
}

function timestamp(date_time)
{
	var date = date_time.substring(0, date_time.indexOf(" "));
	var time = date_time.substring(date_time.indexOf(" ") + 1, date_time.length);

	var arr_date = date.split("-");
	var year = arr_date[0];
	var month = arr_date[1];
	var day = arr_date[2];

	var arr_time = time.split(":");
	var hour = arr_time[0];
	var minute = arr_time[1];
	var second = arr_time[2];

    var humDate = new Date(Date.UTC(year,
          (stripLeadingZeroes(month)-1),
          stripLeadingZeroes(day),
          stripLeadingZeroes(hour),
          stripLeadingZeroes(minute),
          stripLeadingZeroes(second)));
    return humDate.getTime() / 1000.0;
}

function stripLeadingZeroes(input)
  {
    if((input.length > 1) && (input.substr(0,1) == "0"))
      return input.substr(1);
    else
      return input;
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

function buildReadableTime(time_sec)
{
	var time = "";
	var hours = 0;
	var minutes = 0;
	var seconds = 0;

	if (time_sec < 0)
	{
		time = "00:00:00";
		return time;
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
	return time;
}

var first_err = "";

function validateData()
{
	valid = true;
	for(i = 0; i < document.forms["TraitementProdTime"].elements.length; i++)
	{
		elt_name = document.forms["TraitementProdTime"].elements[i].name;
		if(elt_name.match("ack") == "ack")
		{
			ack = document.getElementById(elt_name);
			id = elt_name.substr(3, elt_name.length);
			comments = Trim(document.getElementById("comments"+id).value);
			login = document.getElementById("login"+id).value;
			//prod_time = document.getElementById("total_prod_time"+login).innerHTML;
			document.getElementById("comments"+id).value = comments;
			///if(prod_time != "00:00:00")
			//{
				if(!ack.disabled && (!ack.checked || comments == ""))
				{
					if(first_err == "")
						first_err = login;
					document.getElementById("tr"+id).className="reportsRowError";
					document.getElementById("msg_err"+id).innerHTML = +'<%=pageData.getWord("You must acknowledge and enter a comment before submitting")%>'+.fontcolor("navy");
					valid = false
				}
			//} 
		}/*
		else if(elt_name.match("training_value") == "training_value")
		{
			id = elt_name.substr("training_value".length, elt_name.length);
			login = document.getElementById("login"+id).value;
			if(document.getElementById("grp_id"+id).value == "-1")
			{
				if(first_err == "" && document.getElementById(elt_name).value == "2")
					first_err = "other_training_link";
				else
					first_err = login;
				document.getElementById("tr"+id).className="reportsRowError";
				document.getElementById("msg_err"+id).innerHTML = "You must select a group".fontcolor("navy");
				valid = false;
			}
			if(document.getElementById(elt_name).value == "2")
			{
				if(document.getElementById("agt_id"+id).value.length <= 0)
				{
					if(first_err == "")
						first_err = "other_training_link";
					document.getElementById("tr"+id).className="reportsRowError";
					document.getElementById("msg_err"+id).innerHTML = "You must enter the agent id".fontcolor("navy");
					valid = false;
				}
			}
			document.getElementById("comments"+id).value = Trim(document.getElementById("comments"+id).value);
		}*/
	}
	if(first_err != "")
		parent.mainFrame.location.href = path+"#"+first_err;
	return valid;
}

function validatePassword()
{
	if(hex_sha1(document.getElementById("passwordPublish").value) == good_password)
	{
		closePasswordDialog();
		top.frames.topFrame.doPublishOrUnPublish();
	}
	else
	{
		alert("Bad password!");
		document.getElementById("passwordPublish").focus();
	}
}

function showPasswordDialog()
{
	var theObj = document.getElementById('PasswordVerifDialog');
	if(theObj)
	{
		theObj.style.top = 20;
		theObj.style.left = document.body.clientWidth/2-theObj.clientWidth/2;
		theObj.style.visibility = "visible";
	}
	document.getElementById("passwordPublish").focus();
}

function closePasswordDialog()
{
	var theObj = document.getElementById('PasswordVerifDialog');
	if(theObj)
		theObj.style.visibility = "hidden";
	document.getElementById("passwordPublish").value = "";
}

function checkTheKey(e)
{
	var pressedKey = "";
	if(window.event)
      		pressedKey = window.event.keyCode;
    	else if(e.which)
      		pressedKey = e.which;

  	if(pressedKey == 13)		//13 = <Enter>
    	validatePassword();
	else if(pressedKey == 27)	//27 = <Escape>
        closePasswordDialog();
}

var nb_trRow = 0;

function insertRow(tbody_id, id, login, table_id)
{
	nb_trRow++;
	var id_new = tbody_id+'|training|'+nb_trRow;
	var root = document.getElementById('tbody'+tbody_id);
	var newRow = root.insertRow(root.rows.length);
	newRow.id = "tr"+id_new;
	if(nb_trRow % 2 == 0)
		newRow.className = "reportsRowPair";
	else
		newRow.className = "reportsRowUnPair";
	var cell = newRow.insertCell(0);
	var agt_id = document.getElementById("agt_id"+id).value;
	cell.innerHTML = '<input type="button" name"remove" value="delete" onClick="deleteRow(\''+newRow.id+'\', \''+table_id+'\')">';
	cell.innerHTML += agt_id;
	cell.innerHTML += '<input type="hidden" name="training_value'+id_new+'" value="1">';
	cell.innerHTML += '<input type="hidden" name="login'+id_new+'" value="'+document.getElementById("login"+id).value+'">';
	cell.align = "center";
	cell = newRow.insertCell(1);
	cell.innerHTML = document.getElementById("is_agent"+id).value == "true" ? "Yes" : "No";
	cell.innerHTML += '<input type="hidden" name="is_agent'+id_new+'" value="'+document.getElementById("is_agent"+id).value+'">';
	cell.align = "center";
	cell = newRow.insertCell(2);
	cell.innerHTML = document.getElementById("last_name"+id).value + ", " + document.getElementById("first_name"+id).value;
	cell.innerHTML += '<input type="hidden" name="last_name'+id_new+'" value="'+document.getElementById("last_name"+id).value+'">';
	cell.innerHTML += '<input type="hidden" name="first_name'+id_new+'" value="'+document.getElementById("first_name"+id).value+'">';
	//alert(cell.innerHTML);
	cell = newRow.insertCell(3);
	selectStr = '<select name="grp_id'+id_new+'">';
	selectStr += '<option value="-1"></option>';
	for(z = 0; z < grp_dbids.length; z++)
	{
		selectStr += '<option value="'+grp_dbids[z]+'">'+grp_names[z]+'</option>';
	}
	selectStr += '</select>';
	cell.innerHTML = selectStr;
	cell = newRow.insertCell(4);
	cell.colSpan = 4;

	selectStr = '<select name="type'+id_new+'" >';
	selectStr += '<option value="training"> '+'<%=pageData.getWord("Training")%>' +' </option>';
	selectStr += '<option value="workshop1"> '+'<%=pageData.getWord("Workshop")%>' +' 1</option>';
	selectStr += '<option value="workshop2"> '+'<%=pageData.getWord("Workshop")%>' +'  2</option>';
	selectStr += '<option value="integration"> '+'<%=pageData.getWord("Integration")%>' +' </option>';
	selectStr += '<option value="production"> '+'<%=pageData.getWord("Production")%>' +' </option>';
	selectStr += '</select>';
	cell.innerHTML = selectStr;
	cell.align = "center";

	cell = newRow.insertCell(5);
	cell.innerHTML = '<input name="dbid'+id_new+'" value="-1" type="hidden">';
	cell.innerHTML += '<input id="tmp_prod_time'+id_new+'" name="tmp_prod_time'+login+'" value="0" type="hidden">';
	cell.innerHTML += '<input id="prod_time'+id_new+'" name="prod_time'+id_new+'" onFocus="this.select()" type="text" value="00:00:00" maxlength="8" size="8" onChange="validateTraining(\''+id_new+'\', \'prod_time'+id_new+'\', \''+login+'\');modified=true;">';
	cell.align = "center";
	cell = newRow.insertCell(6);
	cell.colSpan = 2;
	cell = newRow.insertCell(7);
	cell.innerHTML = '<input id="comments'+id_new+'" name="comments'+id_new+'" type="text" onChange="modified=true;">';
	cell = newRow.insertCell(8);
	cell.align = "center";
	cell.innerHTML = '<font color="red"><label id="msg_err'+id_new+'"></label></font>';
	modified = true;
}

function insertRowOther(tbody_id, table_id)
{
	nb_trRow++;
	var id_new = tbody_id+'|training|'+nb_trRow;
	var root = document.getElementById('tbody'+tbody_id);
	var newRow = root.insertRow(root.rows.length);
	newRow.id = "tr"+id_new;
	if(nb_trRow % 2 == 0)
		newRow.className = "reportsRowPair";
	else
		newRow.className = "reportsRowUnPair";
	var cell = newRow.insertCell(0);
	selectStr = '<select name="agt_id'+id_new+'">';
	selectStr += '<option value=""></option>';
	for(z = 0; z < login_id_arr.length; z++)
	{
		selectStr += '<option value="'+login_id_arr[z]+'">'+names_arr[login_id_arr[z]]+'</option>';
	}
	selectStr += '</select>';
	cell.innerHTML = '<input type="button" name"remove" value="delete" onClick="deleteRow(\''+newRow.id+'\', \''+table_id+'\')">';
	cell.innerHTML += selectStr;
	cell.innerHTML += '<input type="hidden" name="training_value'+id_new+'" value="2">';
	cell.innerHTML += '<input type="hidden" name="is_agent'+id_new+'" value="true">';
	cell.align = "center";
	cell = newRow.insertCell(1);
	selectStr = '<select name="grp_id'+id_new+'">';
	selectStr += '<option value="-1"></option>';
	for(z = 0; z < grp_dbids.length; z++)
	{
		selectStr += '<option value="'+grp_dbids[z]+'">'+grp_names[z]+'</option>';
	}
	selectStr += '</select>';
	cell.innerHTML = selectStr;
	cell = newRow.insertCell(2);
	cell.colSpan = 4;
	cell.noWrap = true;
	cell.align = "center";


	selectStr = '<select name="type'+id_new+'" >';
	selectStr += '<option value="training"> '+'<%=pageData.getWord("Training")%>' +' </option>';
	selectStr += '<option value="workshop1"> '+'<%=pageData.getWord("Workshop")%>' +' 1</option>';
	selectStr += '<option value="workshop2"> '+'<%=pageData.getWord("Workshop")%>' +'  2</option>';
	selectStr += '<option value="integration"> '+'<%=pageData.getWord("Integration")%>' +' </option>';
	selectStr += '<option value="production"> '+'<%=pageData.getWord("Production")%>' +' </option>';
	selectStr += '</select>';
	cell.innerHTML = selectStr;


	//cell.innerHTML = 'Training<input name="type'+id_new+'" type="radio" value="training" checked onChange="modified=true;"> Workshop1<input name="type'+id_new+'" type="radio" value="workshop1" onChange="modified=true;"> Workshop2<input name="type'+id_new+'" type="radio" value="workshop2" onChange="modified=true;">';
	cell = newRow.insertCell(3);
	cell.innerHTML = '<input name="dbid'+id_new+'" value="-1" type="hidden">';
	cell.innerHTML += '<input id="prod_time'+id_new+'" name="prod_time'+id_new+'" onFocus="this.select()" type="text" value="00:00:00" maxlength="8" size="8" onChange="validateTraining(\''+id_new+'\', \'prod_time'+id_new+'\', \'\');modified=true;">';
	cell.align = "center";
	cell = newRow.insertCell(4);
	cell.innerHTML = '<input id="comments'+id_new+'" name="comments'+id_new+'" type="text" onChange="modified=true;">';
	cell = newRow.insertCell(5);
	cell.align = "center";
	cell.innerHTML = '<font color="red"><label id="msg_err'+id_new+'"></label></font>';
	modified = true;
}

function deleteRow(id, table_id)
{
	confirmed = confirm('Are you sure ?');
	if(confirmed)
	{
		var table = document.getElementById(table_id);
		var rowToDelete = document.getElementById(id);
		table.deleteRow(rowToDelete.rowIndex);
	}
}
</script>
</head>

<body>
<%
	beanAgentLoginProdReport.setStartTime("01:00:00");
	beanAgentLoginProdReport.setEndTime("01:00:00");
	beanAgentLoginProdReport.setAtelka(false);
    	String reportDate = request.getParameter("reportDate");
	String curDate = request.getParameter("reportDate");
    	String userid = request.getParameter("userid");
	String userinfo = beanAgentLoginProdReport.getUserInfo(userid);
	String username = "", userrole = "";
	if(userinfo.indexOf("|") != -1)
	{
		username = userinfo.substring(0, userinfo.indexOf("|"));
		userrole = userinfo.substring(userinfo.indexOf("|")+1, userinfo.length());
	}
	boolean include_agents = request.getParameter("agents") != null ? true : false;
	boolean include_sup = request.getParameter("supervisors") != null ? true : false;
	boolean valid = true;
	java.util.Vector data = new java.util.Vector();
	data.clear();

	//Le parametre Send est utilisé lorsque les infos de production sont envoyées
	if (request.getParameter("Send") != null || request.getParameter("Publish") != null)
	{
		java.util.Enumeration param_names = request.getParameterNames();
		beanAgentLoginProdInfo info = null;
		while (param_names.hasMoreElements())
		{
			String name = (String)param_names.nextElement();
			String agt_login = "", agt_id = "", prod_time = "", first_name = "", last_name = "";
			String grp_id = "", comments = "", firstLoginTime = "", lastLogoutTime = "";
			String id = "";
			long loginTime = 0;
			int dbid = 0;
			boolean ack = false, is_agent = false, integration = false, training = false, workshop1 = false, workshop2 = false, production = false;
			if(name.matches("prod_time.*"))
			{
				//Lecture des parametres post de la requete HTML
				prod_time = request.getParameter(name);
				id = name.substring(String.valueOf("prod_time").length(), name.length());
				StringTokenizer tok_id = new StringTokenizer(id, "|");
				if(!name.matches(".*training.*"))
				{
					for (int i = 0; i<=tok_id.countTokens();i++)
					{
						if (i == 0) grp_id = tok_id.nextToken();
						if (i == 1) agt_id = tok_id.nextToken();
					}
					firstLoginTime = request.getParameter("firstLoginTime"+id);
					lastLogoutTime = request.getParameter("lastLogoutTime"+id);
					loginTime = Integer.parseInt(request.getParameter("totalLoginTime"+id));
					integration = request.getParameter("integration"+id) != null ? true : (request.getParameter("integration_hidden"+id).compareTo("false") == 0) ? false : true;
					training = false;
					workshop1 = false;
					workshop2 = false;
					production = false;
				}
				else
				{
					String training_value = request.getParameter("training_value"+id);
					if(training_value.compareTo("1") == 0)
					{
						for (int i = 0; i<=tok_id.countTokens(); i++)
						{
							if (i == 0) agt_id = tok_id.nextToken();
						}
					}
					else if(training_value.compareTo("2") == 0)
					{
						agt_id = request.getParameter("agt_id"+id);
					}
					grp_id = request.getParameter("grp_id"+id);
					firstLoginTime = "";
					lastLogoutTime = "";
					loginTime = 0;
					if(request.getParameter("type"+id) == null)
					{
						training = (request.getParameter("type_hidden"+id).compareTo("training") == 0);
						workshop1 = (request.getParameter("type_hidden"+id).compareTo("workshop1") == 0);
						workshop2 = (request.getParameter("type_hidden"+id).compareTo("workshop2") == 0);
						integration = (request.getParameter("type_hidden"+id).compareTo("integration") == 0);
						production = (request.getParameter("type_hidden"+id).compareTo("production") == 0);
					}
					else
					{
						training = (request.getParameter("type"+id).compareTo("training") == 0);
						workshop1 = (request.getParameter("type"+id).compareTo("workshop1") == 0);
						workshop2 = (request.getParameter("type"+id).compareTo("workshop2") == 0);
						integration = (request.getParameter("type"+id).compareTo("integration") == 0);
						production = (request.getParameter("type"+id).compareTo("production") == 0);
					}
				}
				dbid = Integer.parseInt(request.getParameter("dbid"+id));
				agt_login = request.getParameter("login"+id) == null ? "" : request.getParameter("login"+id);
				ack = (request.getParameter("ack"+id) == null) ? false : true;
				first_name = request.getParameter("first_name"+id) == null ? "" : request.getParameter("first_name"+id);
				last_name = request.getParameter("last_name"+id) == null ? "" : request.getParameter("last_name"+id);
				is_agent = (request.getParameter("is_agent"+id).equals("true")) ? true : false;
				comments = request.getParameter("comments"+id);

				if(!training && !workshop1 && !workshop2 && !integration)
                                	production = true;
				//Entrees des infos dans un bean
				info = new beanAgentLoginProdInfo();
				info.login = agt_login;
				info.last_name = last_name;
				info.first_name = first_name;
				info.dbid = dbid;
				info.firstLoginTime = firstLoginTime;
				info.lastLogoutTime = lastLogoutTime;
				info.totalLoginTime = loginTime;
				info.agt_id = agt_id;
				info.grp_id = grp_id;
				info.event_date = reportDate;
				info.totalProductionTime = beanAgentLoginProdReport.convertTimeToSeconds(prod_time);
				info.comments = comments;
				info.acknowledged = ack;
				info.integration = integration;
				info.training = training;
				info.workshop1 = workshop1;
				info.workshop2 = workshop2;
				info.production = production;
				info.acknowledged_by = userid;
				info.is_agent = is_agent;
				data.add(info);
			}
		}

		if(request.getParameter("UnPublish").compareTo("1") == 0)
		{
			beanAgentLoginProdReport.unPublish(reportDate);
			out.println("<script>top.frames.topFrame.document.getElementById('confirm_msg').innerHTML = '';</script>");
		}
		else
		{
			if(request.getParameter("Publish").compareTo("1") == 0)
			{
				beanAgentLoginProdReport.updateProductionTime(data, true);
				//out.println(data);
			}
			else
				beanAgentLoginProdReport.updateProductionTime(data, false);
		}

		if(request.getParameter("close").equals("1"))
			out.println("<script>top.window.close()</script>");
	}
%>
<%
	boolean published = beanAgentLoginProdReport.checkPublished(reportDate);
	if(published)
	{%>
		<script language="javascript" type="text/javascript">
			top.frames.topFrame.document.getElementById("Send").style.visibility = "hidden";
			top.frames.topFrame.document.getElementById("SendClose").style.visibility = "hidden";
			top.frames.topFrame.document.getElementById("Publish").style.visibility = "hidden";
			top.frames.topFrame.document.getElementById("UnPublish").style.visibility = "visible";
		</script>
<%	}
	else
	{%>
		<script language="javascript" type="text/javascript">
			top.frames.topFrame.document.getElementById("Send").style.visibility = "visible";
			top.frames.topFrame.document.getElementById("SendClose").style.visibility = "visible";
			top.frames.topFrame.document.getElementById("Publish").style.visibility = "visible";
			top.frames.topFrame.document.getElementById("UnPublish").style.visibility = "hidden";
		</script>
<%	}
    int j, k;
    long tLoginTime = 0, tProductionTime = 0, tScheduledWorkTime = 0;
	String scheduled_time = "";
    beanAgentLoginProdInfo r1 = new beanAgentLoginProdInfo();

	if(published)
		out.println("<b><font color='red'>"+pageData.getWord("Data is published, modifications are disabled. Contact your supervisor if you need to unlock it")+"</font></b>");
%>

<form action="agentLoginProduction_inside.jsp?<%=request.getQueryString()%>" method="post" name="TraitementProdTime" target="_self">
  <table id="tblProduction" border="1" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse:collapse ">
     <%
 	data.clear();
        HashMap nrrdata = new HashMap();
	data = new java.util.Vector();
	if(request.getParameter("close") == null || !request.getParameter("close").equals("1"))
	{
		beanAgentLoginProdReport.buildAgentGroupLoginProdReport(reportDate, include_agents, include_sup);
		data = beanAgentLoginProdReport.m_gAllDetails;
        beanAgentLoginProdReport.getPaidUnpaidTime( reportDate);
        nrrdata= beanAgentLoginProdReport.map_notreadydetails;
		System.out.println(new java.util.Date().toString() +" Out from bean functions ..");

	}

	java.util.Collections.sort(data);
	int nb_trRow = 0;
	String login = "", agt_id = "", id = "", agentGroup = "";
	String old_login = "", old_agt_id = "", old_id = "", new_id = "";
	long login_time_break = 0, login_total_break = 0, first_login_total = 0;
       long last_logout_total = 0, totalUnpaidBreak = 0, totalPaidBreak = 0;
	boolean training = false;

	for (j = 0; j < data.size(); j++)
	{
		System.out.println("data.size() is "+Integer.toString(data.size())+".."+ new java.util.Date().toString() +".."+ Integer.toString(j) + "..element..");

		r1 = (beanAgentLoginProdInfo)data.elementAt(j);
		training = (r1.training || r1.workshop1 || r1.workshop2);// || r1.production
		agentGroup = r1.grp_id;
		old_login = (j == 0) ? r1.login : login;
		login = r1.login;
		old_agt_id = (j == 0) ? r1.agt_id : agt_id;
		agt_id = r1.agt_id;
		login_total_break += login_time_break;

		totalUnpaidBreak = 0;
		totalPaidBreak = 0;

		String agtkey = agt_id+"|"+agentGroup;
		// debut calcul du temps de lunch
		if(nrrdata.containsKey(agtkey))
        	{
                totalPaidBreak += ((beanAgentLoginProdReport.notreadydetails)nrrdata.get(agtkey)).breaktime;
          		totalUnpaidBreak += ((beanAgentLoginProdReport.notreadydetails)nrrdata.get(agtkey)).bathroomtime;
         		totalUnpaidBreak += ((beanAgentLoginProdReport.notreadydetails)nrrdata.get(agtkey)).lunchtime;
        	}

		// fin calcul du temps de lunch

		if(!training)
		{
			new_id = agentGroup+"|"+r1.agt_id;
		}
		else
		{
			out.println("<script>nb_trRow++;</script>");
			nb_trRow++;
			new_id = r1.agt_id+"|training|"+nb_trRow;
		}
		old_id = (j == 0) ? new_id : id;
		id = new_id;

		if(j == 0)	{%><tbody id="tbody<%=r1.agt_id%>"><a name="<%=login%>"></a><br><%}

		System.out.println("old login is "+old_login+".."+ new java.util.Date().toString() +"..login.."+login );

		if(!old_login.equals(login))
		{
			//login_total_break += login_time_break;//(tLoginTime < 7200) ? tLoginTime : tLoginTime + 900 * ((tLoginTime / 14400) + 1);   // 14400 = 4 h.   1 pause de 15 min(900 s) par tranche de 4 heures
		%>
		</tbody>
			<tr>
                              <td width="41" bgcolor="#FDFDE0" align="center"><font color="#000000"><b> <%=pageData.getWord("Total")%> </b></font></td>						 
                            <td width="235" colspan="2" bgcolor="#FDFDE0" align="center"><%if(!published){%><script>document.write("<input name=\"addRow\" type=\"button\" value=\""+'<%=pageData.getWord("Add a new row")%>'+"\" onClick=\"insertRow(<%=old_agt_id%>, '<%=old_id%>', '<%=old_login%>', 'tblProduction')\">")</script><%}else{%>&nbsp;<%}%></td>						     
                             <td width="100" bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
                             <td width="100" bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=(scheduled_time.compareTo("00:00:00") == 0) ? "Not scheduled" : scheduled_time%></b></font></td>
                             <td width="70" bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
                             <td width="70" bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
                             <td width="70" bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=r1.buildReadableTime(tLoginTime)+"<br>("+r1.buildReadableTime(login_total_break)+")"%></b></font></td>
                             <td width="70" bgcolor="#FDFDEO" align="center"><font color="#000000"><b><label id="total_prod_time<%=old_login%>"><%=r1.buildReadableTime(tProductionTime)%></label></b></font></td>
                             <td width="70" bgcolor="#FDFDEO" align="center"><font color="#000000">&nbsp;</font></td>
                             <td width="70" bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
                             <td width="70" bgcolor="#FDFDE0" align="center">
                                <font color="red">
                                        <%
                                        if(tScheduledWorkTime > 0)
                                        {
                                                if(((double)tLoginTime / (double)tScheduledWorkTime) < prod_requirements)
                                                        out.write("Low Login");
                                        }%>
                                </font>
                             </td>
                             <td width="70" bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
			</tr>
			<tr>
				<td colspan="13"><a name="<%=login%>"></a><br></td>
			</tr>
			<tbody id="tbody<%=r1.agt_id%>">
            <%
         	tLoginTime = 0;
			tProductionTime = 0;
			login_total_break = 0;
		}

		scheduled_time = r1.getTotalScheduledTime();
		System.out.println("scheduled_time "+scheduled_time+  " training = "+ Boolean.toString(training));

		//login_time_break = (r1.totalLoginTime < 7200) ? r1.totalLoginTime : r1.totalLoginTime + 900 * ((r1.totalLoginTime / 14400) + 1);   // 14400 = 4 h.   1 pause de 15 min(900 s) par tranche de 4 heures
		login_time_break = (r1.totalLoginTime < 14400) ? r1.totalLoginTime : (r1.totalLoginTime - totalUnpaidBreak); // 14400 = 4 h.   1 pause de 30 min doit etre retranchee si login time plus de 3h

		long first_login = r1.getFirstLoginTime() != "N/A" ? 0 : 0; //r1.getTimeStamp(r1.firstLoginTime)
		long last_logout = r1.getLastLogoutTime() != "N/A" ? 0 : 0; //r1.getTimeStamp(r1.lastLogoutTime)
		long max_login_time = last_logout - first_login;
		if(max_login_time > 0)
		{
			if(login_time_break > max_login_time)
				login_time_break = r1.totalLoginTime;
		}
		System.out.println("scheduled_time "+scheduled_time+"..first_login= "+Long.toString(first_login) + "..last_logout = "+ Long.toString(last_logout) +"..max_login_time.."+Long.toString(max_login_time)  + " training = "+ Boolean.toString(training));

		if(!training)
		{
		System.out.println(" In !training " +".."+ new java.util.Date().toString()  );

            %>
		<tr id="tr<%=id%>" <% if(r1.dbid != -1 && r1.totalProductionTime > 0){out.write("class=reportsRowDone");}else{
		if(j%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");}%> >
        	<td width="41" height="39" align="center"><%=r1.agt_id%></td>
        	<td width="48" align="center"><%= r1.is_agent ? "Yes":"No"%></td>
        	<td width="187" align="left" nowrap> <a href="events_details.jsp?agentId=<%=r1.agt_id%>&curDate=<%=curDate%>" target="_blank"><%=r1.last_name%>, <%=r1.first_name%></a>
          		<input type="hidden" name="agt_id<%=id%>" value="<%=r1.agt_id%>">
          		<input type="hidden" name="login<%=id%>" value="<%=r1.login%>">
            		<input type="hidden" name="is_agent<%=id%>" value="<%=r1.is_agent%>">
                	<input type="hidden" name="last_name<%=id%>" value="<%=r1.last_name%>">
			<input type="hidden" name="first_name<%=id%>" value="<%=r1.first_name%>">
        	</td>
        	<td width="100" align="center"><%=mapGroups.get(agentGroup)%></td>
        	<td width="100" align="center" valign="middle">&nbsp;

			  <center>
				<select name="type<%=id%>" onChange="modified=true;" disabled>
				  <option value="training" <%=r1.training?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Training")%></option>
				  <option value="workshop1" <%=r1.workshop1?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Workshop")%> 1</option>
				  <option value="workshop2" <%=r1.workshop2?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Workshop")%> 2</option>
				  <option value="integration" <%=r1.integration?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Integration")%></option>
				  <option value="production" <%=r1.production?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Production")%></option>
				</select>
			  </center>
			

			</td>
        	<td width="70" align="center"><%=r1.getFirstLoginTime()%>
          		<input name="firstLoginTime<%=id%>" type="hidden" value="<%=r1.firstLoginTime%>"></td>
                <td width="70" align="center"><%=r1.getLastLogoutTime()%>
          	<input name="lastLogoutTime<%=id%>" type="hidden" value="<%=r1.lastLogoutTime%>"></td>
        	<td width="70" align="center"><%=r1.getTotalLoginTime()+"<br>("+r1.buildReadableTime(login_time_break)+")"%>
          	<input id="totalLoginTime<%=id%>" name="totalLoginTime<%=id%>" type="hidden" value="<%=r1.totalLoginTime%>"></td>
       	  <td width="70" align="center"> <input name="dbid<%=id %>" value="<%=r1.dbid %>" type="hidden">
          	<input id="tmp_prod_time<%=id%>" name="tmp_prod_time<%=r1.login%>" value="<%=r1.getTotalProductionTime()%>" type="hidden">
            <input id="prod_time<%=id%>" name="prod_time<%=id%>" onFocus="this.select()" type="text"  value="<%=r1.getTotalProductionTime()%>" <%=published?"readonly":""%> maxlength="8" size="8" onChange="validateProductionTime('<%=id%>','prod_time<%=id%>',<%=r1.totalLoginTime%>, '<%=r1.totalScheduledTime%>', '<%=r1.totalScheduledWorkTime%>', '<%=r1.login%>');modified=true;">
</td>
        	<td width="70" align="center"> <input name="integration<%=id%>" type="checkbox" <%=r1.integration?"checked":""%> <%=published?"disabled":""%> onChange="modified=true;">
          	<input name="integration_hidden<%=id%>" type="hidden" value="<%=r1.integration?"true":"false"%>">
        	</td>
        	<td width="70" align="center"><input id="ack<%=id%>" name="ack<%=id%>" type="checkbox" <%=r1.acknowledged?"checked":"disabled"%> <%=published?"disabled":""%> onChange="modified=true;" <%//(r1.totalScheduledWorkTime > 0)?(((double)r1.totalLoginTime / (double)r1.totalScheduledWorkTime) < prod_requirements)?"":"disabled":"disabled"%> ></td>
        	<td width="70" align="center"><input id="comments<%=id%>" name="comments<%=id%>" type="text" value="<%=r1.comments%>" <%=published?"readonly":""%> onChange="modified=true;"></td>
        	<td width="70" align="center"><font color="red">
         	 <label id="msg_err<%=id%>"><%="Break : "+r1.buildReadableTime(totalPaidBreak)%></label>
          	</font></td>
        	<%="<script>top.frames.topFrame.addAgent('"+r1.order_by+"','"+login+"');</script>"%>
        <%
		System.out.println(" In if !training " +".."+ new java.util.Date().toString()  );

        }
	else
	{
		System.out.println(" In else training " +".."+ new java.util.Date().toString()  );

	%>
      <tr id="tr<%=id%>" <% if(r1.dbid != -1 && r1.totalProductionTime > 0){out.write("class=reportsRowDone");}else{
	if(j%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");}%> >
        <td width="41" align="center"><%=r1.agt_id%> <input type="hidden" name="agt_id<%=id%>" value="<%=r1.agt_id%>">
        </td>
        <td width="48" align="center"><%= r1.is_agent ? "Yes":"No"%></td>
        <td width="187" align="left" nowrap> <a href="events_details.jsp?agentId=<%=r1.agt_id%>&curDate=<%=curDate%>" target="_blank"> <%=r1.last_name%>, <%=r1.first_name%>  </a><input type="hidden" name="training_value<%=id%>" value="1">
          <input type="hidden" name="login<%=id%>" value="<%=r1.login%>"> <input type="hidden" name="is_agent<%=id%>" value="<%=r1.is_agent%>">

          <input type="hidden" name="last_name<%=id%>" value="<%=r1.last_name%>">
          <input type="hidden" name="first_name<%=id%>" value="<%=r1.first_name%>">
          </td>
        <td width="100"> <select name="grp_id<%=id%>" onChange="modified=true;" <%=published?"disabled":""%>>
            <option value="-1"></option>
            <%for(int i = 0; i < groups.size(); i++)
              	{
                      String grp = (String)groups.elementAt(i);
                      StringTokenizer tokGrp = new StringTokenizer(grp, "|");
                      for (int z = 0; z <= tokGrp.countTokens(); z++)
                      {
                              if (z == 0) key = tokGrp.nextToken();
                              if (z == 1) value = tokGrp.nextToken();
                      }
                      if(r1.grp_id.compareTo(key) == 0)
                              out.println("<option value='"+key+"' selected>"+value+"</option>");
                      else
                              out.println("<option value='"+key+"'>"+value+"</option>");
                }%>
          </select> </td>
        <td width="310" colspan="4" nowrap>
          <center>
            <select name="type<%=id%>" onChange="modified=true;">
              <option value="training" <%=r1.training?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Training")%></option>
              <option value="workshop1" <%=r1.workshop1?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Workshop")%> 1</option>
              <option value="workshop2" <%=r1.workshop2?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Workshop")%> 2</option>
              <option value="integration" <%=r1.integration?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Integration")%></option>
              <option value="production" <%=r1.production?"selected":""%>  <%=published?"disabled":""%>><%=pageData.getWord("Production")%></option>
            </select>
          </center>
          <input name="type_hidden<%=id%>" type="hidden" value="<%=r1.training?"training":(r1.workshop1?"workshop1":(r1.workshop2?"workshop2":(r1.production?"production":"")))%>">
        </td>
        <td  width="70" align="center"> <input name="dbid<%=id%>" value="<%=r1.dbid%>" type="hidden">
          <input id="tmp_prod_time<%=id%>" name="tmp_prod_time<%=r1.login%>" value="<%=r1.getTotalProductionTime()%>" type="hidden">
          <input id="prod_time<%=id%>" name="prod_time<%=id%>" onFocus="this.select()" type="text" value="<%=r1.getTotalProductionTime()%>" maxlength="8" size="8" onChange="validateTraining('<%=id%>', 'prod_time<%=id%>', '<%=r1.login%>');modified=true;" <%=published?"readonly":""%>>
        </td>
        <td width="140" colspan="2">&nbsp;</td>
        <td width="70"><input id="comments<%=id%>" name="comments<%=id%>" type="text" value="<%=r1.comments%>" onChange="modified=true;" <%=published?"readonly":""%>></td>
        <td width="70" align="center"><font color="red">
          <label id="msg_err<%=id%>"></label>
          </font></td>
        <%="<script>top.frames.topFrame.addAgent('"+r1.order_by+"','"+login+"');</script>"%>
        <%
		System.out.println(" End else training " +".."+ new java.util.Date().toString()  );

        }
        %>
      </tr>
  <%
            tLoginTime += r1.totalLoginTime;
            tProductionTime += r1.totalProductionTime;
            tScheduledWorkTime = r1.totalScheduledWorkTime;

            System.out.println(" r1.getFirstLoginTime() " +".."+ r1.firstLoginTime );
            System.out.println(" r1.getLastLogoutTime() " +".."+ r1.lastLogoutTime );

            long first_login_tmp = r1.getFirstLoginTime() != "N/A" ? 0 : 0; //r1.getTimeStamp(r1.firstLoginTime )
            long last_logout_tmp = r1.getLastLogoutTime() != "N/A" ? 0 : 0; //r1.getTimeStamp(r1.lastLogoutTime)
            first_login_total = first_login_tmp < first_login_total || first_login_total == 0 ? first_login_tmp : first_login_total;
            last_logout_total = last_logout_tmp > last_logout_total ? last_logout_tmp : last_logout_total;
     }
//login_total_break = (tLoginTime < 7200) ? tLoginTime : tLoginTime + 900 * ((tLoginTime / 14400) + 1);   // 14400 = 4 h.   1 pause de 15 min(900 s) par tranche de 4 heures
      login_total_break = ((tLoginTime < 14400) ? tLoginTime : tLoginTime - totalUnpaidBreak);  // 14400 = 4 h.  on retranche la pause de 30mn du lunch
      long max_login_total = last_logout_total - first_login_total;
      if(max_login_total > 0)
      {
	 if(login_total_break > max_login_total)
		login_total_break = tLoginTime;
      }
  %>
    </tbody>
    <tr>
      <td width="41" height="23" align="center" bgcolor="#FDFDE0"><font color="#000000"><b><%=pageData.getWord("Total")%></b></font></td>
      <td width="235" colspan="2" bgcolor="#FDFDE0" align="center">
        <%if(!published){%>
		<script>document.write("<input name=\"addRow\" type=\"button\" value=\""+"<%=pageData.getWord("Add a new row")%>"+"\" onClick=\"insertRow(<%=r1.agt_id%>, '<%=id%>', '<%=login%>', 'tblProduction')\">")</script>
        <%}else{%>
        &nbsp;
        <%}%>
      </td>
      <td width="100" bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
      <td width="100" bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=(scheduled_time.compareTo("00:00:00") == 0) ? "Not scheduled" : scheduled_time%></b></font></td>
      <td width="70" bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
      <td width="70" bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
      <td width="70" bgcolor="#FDFDE0" align="center"><font color="#000000"><b><%=r1.buildReadableTime(tLoginTime)+"<br>("+r1.buildReadableTime(login_total_break)+")"%></b></font></td>
      <td width="70" bgcolor="#FDFDEO" align="center"><font color="#000000"><b>
        <label id="total_prod_time<%=login%>"><%=r1.buildReadableTime(tProductionTime)%></label>
        </b></font></td>
      <td width="70" bgcolor="#FDFDEO" align="center"><font color="#000000">&nbsp;</font></td>
      <td width="70" bgcolor="#FDFDEO" align="center"><font color="#000000">&nbsp;</font></td>
      <td width="70" bgcolor="#FDFDE0" align="center"> <font color="red">
        <%
            if(tScheduledWorkTime > 0)
            {
                    if(((double)tLoginTime / (double)tScheduledWorkTime) < prod_requirements)
                            out.write("Low Login");
            }
        %>
        </font> </td>
      <td width="70" bgcolor="#FDFDE0" align="center"><font color="#000000">&nbsp;</font></td>
    </tr>
  </table>
  <br>
  <br>
<%if(!published){%>
<a name="other_training_link"></a><br>
<strong><%=pageData.getWord("Other training")%></strong>
<table id="tblOtherTraining" border="1" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse:collapse ">
	<tr><td bgcolor="#FDFDE0" colspan="9" align="center">
	<script>document.write("<input name=\"addTraining\" type=\"button\" value=\""+"<%=pageData.getWord("Add a new row")%>"+"\" onClick=\"insertRowOther('other_training', 'tblOtherTraining')\">")</script>
</td></tr>
	<tr class="reportsTab">
       <td align="center"><b><%=pageData.getWord("Agent ID")%></b></td>
	  <td align="center"><b><%=pageData.getWord("Campaign")%></b></td>
	  <td align="center" colspan="4"><b><%=pageData.getWord("Training type")%></b></td>
	  <td width="70" align="center"><b><%=pageData.getWord("Production time")%></b></td>
	  <td align="center"><b><%=pageData.getWord("Comments")%></b></td>
	  <td width="100" align="center">&nbsp;</td>
    </tr>
	<tbody id="tbodyother_training">
	</tbody>
</table>
<%}%>

<input type="hidden" name="Send" value="1">
<input type="hidden" name="Publish" value="0">
<input type="hidden" name="close" value="0">
<input type="hidden" name="UnPublish" value="0">
</form>
<script>
top.frames.topFrame.sortSelect(window.top.topFrame.document.getElementById("search_box"));
top.frames.topFrame.setPath(document.location.href);
</script>
<%
System.out.println(new java.util.Date().toString() + "  Before getProductionSummary()");

java.util.Vector summary = beanAgentLoginProdReport.getProductionSummary(reportDate);
beanLoginProdSummary bean_summ = null;

System.out.println(new java.util.Date().toString() + "  After getProductionSummary()");

if(summary.size() > 0)
{
%>
<h3><strong><%=pageData.getWord("Summary")%></strong></h3>
<table width="50%" class="reportsTab" border="0" align="left">
	<tr>
		<td><strong><%=pageData.getWord("Name")%></strong></td>
		<td><strong><%=pageData.getWord("Queue")%></strong></td>
		<td><strong><%=pageData.getWord("Production time")%></strong></td>
	</tr>
	<%
	for(int i = 0; i < summary.size(); i++)
	{
		bean_summ = (beanLoginProdSummary) summary.elementAt(i);
		if(bean_summ.prod_time != 0)
		{%>
		<tr <%if(i%2 == 0) out.write("class=reportsRowPair");
  			else out.write("class=reportsRowUnPair");%> >
			<td><%=bean_summ.campaign%></td>
			<td><%=bean_summ.queue%></td>
			<td><%=bean_summ.getProductionTime()%></td>
		</tr>
<%		}
	} %>
</table>
<%}
System.out.println(new java.util.Date().toString() + "  After if summary()");

%>
      <div id="PasswordVerifDialog" style="visibility:hidden; border:2px solid #000000; background-color:#FFFFFF; width:200px;position:absolute; z-index:500; top:0px; left:0px; ">
            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                            <td colspan="2" align="center" bgcolor="#6AA5D7"><b><%=pageData.getWord("Please enter your password")%></b></td>
                    </tr>
                    <tr>
                            <td align="center"><input type="password" onFocus="this.select()" name="passwordPublish" onKeyPress="checkTheKey()"></td>
                    </tr>
                    <tr>
                            <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="right">
					  <script>document.write("<input type=\"button\" value=\"OK\" onClick=\"validatePassword()\">")</script>&nbsp;&nbsp;
					  <script>document.write("<input type=\"button\" value=\""+"<%=pageData.getWord("Cancel")%>"+"\" onClick=\"closePasswordDialog()\">")</script>
                                     
                      </td>
                    </tr>
            </table>
      </div>
</body>
</html>
<%
pageData.closeConnection();
%>