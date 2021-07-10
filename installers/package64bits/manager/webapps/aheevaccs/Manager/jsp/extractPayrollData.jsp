<html>
<head>

<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.lang.String.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.text.DecimalFormat"%>
<%@page import ="Manager.wfm.*"%>
<%@page import ="java.util.StringTokenizer"%>
<%@page import ="javax.mail.*"%>
<%@page import ="javax.mail.event.*"%>
<%@page import ="javax.mail.internet.*"%>


<jsp:useBean id="beanPayrollDataObj" scope="request" class="Manager.wfm.beanPayrollData" />

<%

String start_date = request.getParameter("date_start");
String end_date = request.getParameter("date_end");
String pay_system = request.getParameter("pay_system");
String export_address = request.getParameter("export_addr");


//DecimalFormat df = new DecimalFormat("###.00");

if (export_address != null && export_address.compareTo("") != 0)
{

	if (beanPayrollDataObj.openConnection()) // ouvrir la connexion
	{
	
		if (beanPayrollDataObj.dataClosed(start_date, end_date)) // vérifier si toutes les données ont été publiées
		{
		  //out.write(new java.util.Date().toString() + "  All data have been confirmed for this period. Go ahead !!");
		
		  Vector myVector = beanPayrollDataObj.traiter_donnees( start_date, end_date); //, pay_system, export_address);
		  //out.write(new java.util.Date().toString() + " Taille du vecteur " + myVector.size());
		    
		  try
		  {
				String start_date1 = start_date1 = start_date.replace('/', '-');
				String end_date1 = end_date1 = end_date.replace('/', '-');
		  
				//BufferedWriter fileHandler = new BufferedWriter(new FileWriter("AgentsHours_"+start_date1+"_"+end_date1));
				String ceridian_file_name = "ceridian_file_" + start_date1 + "_" + end_date1 + ".imp";
				BufferedWriter fileHandler = new BufferedWriter(new FileWriter(ceridian_file_name));
				String sortie = "";
		  		//out.write(new java.util.Date().toString() + " Taille du vecteur " + myVector.size());
				beanPayrollData.agt_pay_info myObj = null;

				for (int i = 0; i < myVector.size(); i++)
				{
					myObj = ((beanPayrollData.agt_pay_info)myVector.elementAt(i));

					if (myObj.training_time > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,"+myObj.training_code+","+ Double.toString( (Math.round((myObj.training_time/3600)*100))/100.0) +"\r\n";
					}
					if (myObj.training_over > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,1,"+ Double.toString( (Math.round((myObj.training_over/3600)*100)) /100.0) +"\r\n";
					}
					if (myObj.integration_time > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,"+myObj.integration_code+","+Double.toString( (Math.round((myObj.integration_time/3600)*100)) /100.0) +"\r\n";
					}
					if (myObj.integration_over > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,1,"+ Double.toString( (Math.round((myObj.integration_over/3600)*100)) /100.0) +"\r\n"; 
					}
					if (myObj.production_time > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,"+myObj.production_code+","+ Double.toString( (Math.round((myObj.production_time/3600)*100)) /100.0) +"\r\n"; 
					}
					if (myObj.production_over > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,1,"+ Double.toString( (Math.round((myObj.production_over/3600)*100)) /100.0) +"\r\n"; 
					}
					if (myObj.commission_value > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,"+myObj.commission_code+","+ Double.toString( (Math.round(myObj.commission_value*100.0)) /100.0) +"\r\n"; 
					}
				}
 				fileHandler.write(sortie);
				fileHandler.close();

				beanPayrollDataObj.sendMessage(export_address, ceridian_file_name);
				out.write(new java.util.Date().toString() + " Data have been processed and a file has been sent. ");
		  }
		  catch(Exception e)
		  {
		  
		  }

		}
		else
		{
		  out.write(new java.util.Date().toString() + "  All data have not been confirmed for this period. Please check !!");
		}

	}
}



%>

<title>Extract Payroll Data</title>

<link rel="stylesheet" href="../Resources_pages/xc2_default.css" type="text/css">
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<script language="javascript" type="text/javascript" src="../Resources_pages/Browser.js"></script>
<script language="javascript" src="../Resources_pages/xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="../Resources_pages/xc2_inpage.js"></script>


<script language="JavaScript">
var NS4 = document.layers ? 1:0
var IE4 = document.all ? 1:0
var IE5 = document.getElementById&&document.all ? 1:0
var NS6 = document.getElementById&&!document.all ? 1:0

var x=0;
var y=0;
var closetable = "</TD></TR></TABLE></TD></TR></TABLE>";
if(!IE4)
{
	document.captureEvents(Event.MOUSEMOVE);
	document.onmousemove = GetPos;
}

function Desc(text )
{
 	var opentable = "<TABLE BGCOLOR='#000000' BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH=140><TR><TD ALIGN=center><TABLE BGCOLOR='#FFFFE1' BORDER=0 CELLPADDING=3 CELLSPACING=1 WIDTH=138><TR><TD VALIGN=top style='font-size:10px; font-family:Tahoma' align=left><IMG SRC='../img/help.gif' HEIGHT=24 WIDTH=30 VSPACE=0 HSPACE=0 ALIGN=left>";

	if(NS6) {
		document.getElementById("Description").innerHTML  = opentable+text+closetable;
		document.getElementById("Description").style.left = x-12;
		document.getElementById("Description").style.top  = y+10;
		document.getElementById("Description").style.visibility = "visible";
	}
 	if(IE4) {

		document.all["Description"].innerHTML = opentable+text+closetable;
		Description.style.pixelLeft = event.clientX-12;
		Description.style.posTop  = document.body.scrollTop+event.clientY+16;
		Description.style.visibility = "visible";
	}
	else {
		var nets = document.layers["Description"];
		nets.document.open();
		nets.document.write(opentable+text+closetable);
		document.Description.left = x-12;
		document.Description.top = y+10;
		nets.visibility = "show";
		document.close();
	}
}

function GetPos(evnt)
{
	x = evnt.pageX;
	y = evnt.pageY;
	return true;
}

function noDesc()
{

	if(NS6) {
		document.getElementById("Description").style.visibility = "hidden";
	}
	if(IE4) {
		Description.style.visibility = "hidden";
	}
	else {
		document.Description.visibility = "hidden";
	}
}
</script>
<style type="text/css">
.dynamic-tab-pane-control .contentText{
	font:			12px Tahoma;
	color:			Black;
}
.dynamic-tab-pane-control .tab-page {
	clear:			both;
	border:			1px solid rgb( 145, 155, 156 );
	background:		rgb( 252, 252, 254 );
	z-index:		2;
	position:		relative;
	top:			-2px;

	font:			11px Tahoma;
	color:			Black;

	filter:			progid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)
					progid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);
	padding:		10px;
}

.dynamic-tab-pane-control .tab-row {
	z-index:		1;
	white-space:	nowrap;
}

.dynamic-tab-pane-control .tab-row .tab.selected {
	width:				74px  ;
	height:				18px  ;
	background-image:	url( "tab.active.png" )  ;
	background-repaet:	no-repeat;
	border-bottom-width:	0;
	z-index:		3;
	padding:		2px 0 0px 0;
	margin:			1px -3px -3px 0px;
	top:			-2px;
	font:			11px Tahoma;
}

.dynamic-tab-pane-control .tab-row .tab a {
	font:				11px Tahoma;
	color:				Black;
	text-decoration:	none;
	cursor:				default;
}

.dynamic-tab-pane-control .tab-row .tab.hover {
	font:				11px Tahoma;
	width:				70px;
	height:				16px;
	background-image:	url( "tab.hover.png" );
	background-repaet:	no-repeat;
}

.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		200px;
}

html, body {
	background:	#E1F4FF;
}

form {
	margin:		0;
	padding:	0;
}
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

 .dynamic-tab-pane-control.tab-pane {
	position:	relative;
	width:		100%;
	margin-right:	-2px;
	height:		200px;

}

</style>

<style type="text/css">

.style1 {
	font-size: 11px;
	font-weight: bold;
}

</style>
<script language="javascript" type="text/javascript">
function validateDataToSubmit()
{
	var temp = document.ceridian_report_form.start_date.value;
	var start = new Date();
	start.setDate(temp.substring(3, 5));
	start.setMonth(temp.substring(0, 2) - 1);
	start.setYear(temp.substring(6, 10));

	var end = Date(document.ceridian_report_form.end_date.value);

	if(start.getDay() != 0)
	{
		alert(MultiArray["Report starting date must be a Sunday"][lang]);
		return false;
	}
	else
	{
	}

	temp = document.ceridian_report_form.end_date.value;
	var end = new Date();
	end.setDate(temp.substring(3, 5));
	end.setMonth(temp.substring(0, 2) - 1);
	end.setYear(temp.substring(6, 10));

	if(end.getDay() != 6)
	{
		alert(MultiArray["Report ending date must be Saturday"][lang]);
		return false;
	}
	else
	{
	}

	if (start > end)
	{
		alert(MultiArray["Starting date must be prior to ending date"][lang]);
		return false;
	}

	if (end.getTime() - start.getTime() > 518400000)
	{
		alert(MultiArray["You cannot extract data for more than one week"][lang]);
		return false;
	}

	if (document.ceridian_report_form.exportTo.value == '')
	{
		alert(MultiArray["You must select a payroll company"][lang]);
		return false;
	}

	if (document.ceridian_report_form.exportEmail.value == '')
	{
		alert(MultiArray["You must specify an email adress to which the report will be sent"][lang]);
		return false;
	}
	else
	{
	}
	document.ceridian_report_form.date_start.value = document.ceridian_report_form.start_date.value;//start;//
	document.ceridian_report_form.date_end.value = document.ceridian_report_form.end_date.value;//end;//
	document.ceridian_report_form.pay_system.value = document.ceridian_report_form.exportTo.value;
	document.ceridian_report_form.export_addr.value = document.ceridian_report_form.exportEmail.value;

}

</script>

</head>

<body>

  <div class="dynamic-tab-pane-control">
	<div class="tab-pane" id="tabPane1">
	  <fieldset > <h4 >
	    <legend  style="font-size:13px; font-family:Tahoma; color:#000000 "> <script>document.write(MultiArray["Extract payroll data"][lang]);</script> </legend>
	  </h4>
 		<div class="tab-page" id="general">
			<fieldset>
				<legend><script>document.write(MultiArray["Payroll data"][lang]);</script></legend>
					<form name="ceridian_report_form" target="_self" action="extractPayrollData.jsp" method="post">
						<table>
							<tr height="15">
								<td valign="bottom">&nbsp;
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td valign="middle" class="style1">
									<b><script>document.write(MultiArray["From"][lang]);</script></b>
								</td>
								<td valign="middle" class="style1">
									<input type="text" id="start_date" name="start_date" onFocus="showCalendar('',this,this,'','id_reportDate',0,10,1);this.blur()" size="15">
									&nbsp;&nbsp;&nbsp;&nbsp;<b><script>document.write(MultiArray["To"][lang]);</script></b> <input type="text" id="end_date" name="end_date" onFocus="showCalendar('',this,this,'','id_reportDate',0,10,1);this.blur()" size="15">
								</td>
							</tr>
							<tr height="15">
								<td valign="bottom">&nbsp;
								</td>
								<td>
								</td>
							</tr>
							<tr height="20">
								<td valign="middle" class="style1">
									<b><script>document.write(MultiArray["Export to"][lang]);</script></b>
								</td>
								<td>
                                  <select name="exportTo" id="select">
								  	<option value="">===<script>//document.write(MultiArray["Select"][lang]);</script>===</option>
                                    <option value="ceridian">Ceridian</option>
                                  </select>
								</td>
							</tr>
							<tr height="15">
								<td valign="bottom">&nbsp;
								</td>
								<td>
								</td>
							</tr>
							<tr height="20">
								<td valign="middle" class="style1">
                                  <b><script>document.write(MultiArray["Mail to"][lang]);</script></b>
								</td>
								<td>
                                  <input type="text" size="35" name="exportEmail" id="exportEmail" />
								</td>
							</tr>
							<tr height="15">
								<td valign="bottom">&nbsp;
								</td>
								<td>
								</td>
							</tr>
							<tr height="20">
								<td valign="bottom">
								</td>
								<td>
									<script>document.write("<input id=\"getCeridianData\" name=\"getCeridianData\" type=\"submit\" value=\""+MultiArray["Submit"][lang]+"\" onClick=\"return validateDataToSubmit();\">")</script>
								</td>
							</tr>
						</table>
						<input type="hidden" id="date_start" name="date_start" />
						<input type="hidden" id="date_end" name="date_end" />
						<input type="hidden" id="pay_system" name="pay_system" />
						<input type="hidden" id="export_addr" name="export_addr" />


					</form>
				</fieldset>
			  </div>
			</fieldset>
		   </div>
		</div>
	</body>
</html>






