package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.*;
import java.lang.*;
import java.lang.String.*;
import java.util.*;
import java.io.*;
import java.text.DecimalFormat;
import aheevaManager.wfm.*;
import java.util.StringTokenizer;
import javax.mail.*;
import javax.mail.event.*;
import javax.mail.internet.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import aheevaManager.ressources.*;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;

public final class extractPayrollData_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/jsp/../Resources_pages/xc2_default_labels.jsp");
  }

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

beanManagerData pagePayData = new beanManagerData();
pagePayData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagePayData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      aheevaManager.wfm.beanPayrollData beanPayrollDataObj = null;
      synchronized (request) {
        beanPayrollDataObj = (aheevaManager.wfm.beanPayrollData) _jspx_page_context.getAttribute("beanPayrollDataObj", PageContext.REQUEST_SCOPE);
        if (beanPayrollDataObj == null){
          beanPayrollDataObj = new aheevaManager.wfm.beanPayrollData();
          _jspx_page_context.setAttribute("beanPayrollDataObj", beanPayrollDataObj, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");


String start_date = request.getParameter("start_date");
String end_date = request.getParameter("date_end");
String pay_system = request.getParameter("pay_system");
String export_from = request.getParameter("export_from");
String export_address = request.getParameter("export_addr");


//DecimalFormat df = new DecimalFormat("###.00");

if (export_address != null && export_address.compareTo("") != 0)
{

	if (beanPayrollDataObj.openConnection()) // ouvrir la connexion
	{
		if (beanPayrollDataObj.dataClosed(start_date, end_date)) // vérifier si toutes les données ont été publiées
		{
		  out.write(new java.util.Date().toString() + "  All data have been confirmed for this period. Go ahead !!");
		
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
					if (myObj.continuing_training_time > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,"+myObj.continuing_training_code+","+ Double.toString( (Math.round((myObj.continuing_training_time/3600)*100)) /100.0) +"\r\n"; 
					}
					if (myObj.continuing_training_over > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,1,"+ Double.toString( (Math.round((myObj.continuing_training_over/3600)*100)) /100.0) +"\r\n"; 
					}					
					if (myObj.commission_value > 0)
					{
						sortie += "0076,COSTING,00000"+ Integer.toString(myObj.agt_id) +",REG,"+myObj.commission_code+","+ Double.toString( (Math.round(myObj.commission_value*100.0)) /100.0) +"\r\n"; 
					}
				}
 				fileHandler.write(sortie);
				fileHandler.close();

				beanPayrollDataObj.sendMessage(export_from, export_address, ceridian_file_name);
				out.write(new java.util.Date().toString() + " Data have been processed and a file has been sent. ");
				//out.write(" -------export_from[ " + export_from + "] export_address[" + export_address + "] ceridian_file_name[" + ceridian_file_name + "] -----------");

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




      out.write("\r\n");
      out.write("\r\n");
      out.write("<title>Extract Payroll Data</title>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../Resources_pages/xc2_default.css\" type=\"text/css\">\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var lang =normalizeString(QueryString('lang'));\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pagexc2Data = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pagexc2Data.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pagexc2Data.openConnection();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("// variables of labels;// \r\n");
      out.write("var phrase= new Array();\r\n");
      out.write("phrase[0]=\"");
      out.print( pagexc2Data.getWord("January"));
      out.write("\";\r\n");
      out.write("phrase[1]=\"");
      out.print( pagexc2Data.getWord("February"));
      out.write("\";\r\n");
      out.write("phrase[2]=\"");
      out.print( pagexc2Data.getWord("March"));
      out.write("\";\r\n");
      out.write("phrase[3]=\"");
      out.print( pagexc2Data.getWord("April"));
      out.write("\";\r\n");
      out.write("phrase[4]=\"");
      out.print( pagexc2Data.getWord("May"));
      out.write("\";         \r\n");
      out.write("phrase[5]=\"");
      out.print( pagexc2Data.getWord("June"));
      out.write("\";\r\n");
      out.write("phrase[6]=\"");
      out.print( pagexc2Data.getWord("July"));
      out.write("\";\r\n");
      out.write("phrase[7]=\"");
      out.print( pagexc2Data.getWord("August"));
      out.write("\";\r\n");
      out.write("phrase[8]=\"");
      out.print( pagexc2Data.getWord("September"));
      out.write("\";\r\n");
      out.write("phrase[9]=\"");
      out.print( pagexc2Data.getWord("October"));
      out.write("\";\r\n");
      out.write("phrase[10]=\"");
      out.print( pagexc2Data.getWord("November"));
      out.write("\";\r\n");
      out.write("phrase[11]=\"");
      out.print( pagexc2Data.getWord("December"));
      out.write("\";\r\n");
      out.write("phrase[12]=\"");
      out.print( pagexc2Data.getWord("Jan"));
      out.write("\";\r\n");
      out.write("phrase[13]=\"");
      out.print( pagexc2Data.getWord("Feb"));
      out.write("\";\r\n");
      out.write("phrase[14]=\"");
      out.print( pagexc2Data.getWord("Mar"));
      out.write("\";\r\n");
      out.write("phrase[15]=\"");
      out.print( pagexc2Data.getWord("Apr"));
      out.write("\";\r\n");
      out.write("phrase[16]=\"");
      out.print( pagexc2Data.getWord("May"));
      out.write("\";\r\n");
      out.write("phrase[17]=\"");
      out.print( pagexc2Data.getWord("Jun"));
      out.write("\";\r\n");
      out.write("phrase[18]=\"");
      out.print( pagexc2Data.getWord("Jul"));
      out.write("\";\r\n");
      out.write("phrase[19]=\"");
      out.print( pagexc2Data.getWord("Aug"));
      out.write("\";\r\n");
      out.write("phrase[20]=\"");
      out.print( pagexc2Data.getWord("Sep"));
      out.write("\";\r\n");
      out.write("phrase[21]=\"");
      out.print( pagexc2Data.getWord("Oct"));
      out.write("\";\r\n");
      out.write("phrase[22]=\"");
      out.print( pagexc2Data.getWord("Nov"));
      out.write("\";\r\n");
      out.write("phrase[23]=\"");
      out.print( pagexc2Data.getWord("Dec"));
      out.write("\";\r\n");
      out.write("phrase[24]=\"");
      out.print( pagexc2Data.getWord("Sunday"));
      out.write("\";\r\n");
      out.write("phrase[25]=\"");
      out.print( pagexc2Data.getWord("Monday"));
      out.write("\";\r\n");
      out.write("phrase[26]=\"");
      out.print( pagexc2Data.getWord("Tuesday"));
      out.write("\";\r\n");
      out.write("phrase[27]=\"");
      out.print( pagexc2Data.getWord("Wednesday"));
      out.write("\";\r\n");
      out.write("phrase[28]=\"");
      out.print( pagexc2Data.getWord("Thursday"));
      out.write("\";\r\n");
      out.write("phrase[29]=\"");
      out.print( pagexc2Data.getWord("Friday"));
      out.write("\";\r\n");
      out.write("phrase[30]=\"");
      out.print( pagexc2Data.getWord("Saturday"));
      out.write("\";\r\n");
      out.write("phrase[31]=\"");
      out.print( pagexc2Data.getWord("Sun"));
      out.write("\";\r\n");
      out.write("phrase[32]=\"");
      out.print( pagexc2Data.getWord("Mon"));
      out.write("\";\r\n");
      out.write("phrase[33]=\"");
      out.print( pagexc2Data.getWord("Tue"));
      out.write("\";\r\n");
      out.write("phrase[34]=\"");
      out.print( pagexc2Data.getWord("Wed"));
      out.write("\";\r\n");
      out.write("phrase[35]=\"");
      out.print( pagexc2Data.getWord("Thu"));
      out.write("\";\r\n");
      out.write("phrase[36]=\"");
      out.print( pagexc2Data.getWord("Fri"));
      out.write("\";\r\n");
      out.write("phrase[37]=\"");
      out.print( pagexc2Data.getWord("Sat"));
      out.write("\";\r\n");
      out.write("phrase[38]=\"");
      out.print( pagexc2Data.getWord("Su"));
      out.write("\";\r\n");
      out.write("phrase[39]=\"");
      out.print( pagexc2Data.getWord("Mo"));
      out.write("\";\r\n");
      out.write("phrase[40]=\"");
      out.print( pagexc2Data.getWord("Tu"));
      out.write("\";\r\n");
      out.write("phrase[41]=\"");
      out.print( pagexc2Data.getWord("We"));
      out.write("\";\r\n");
      out.write("phrase[42]=\"");
      out.print( pagexc2Data.getWord("Th"));
      out.write("\";\r\n");
      out.write("phrase[43]=\"");
      out.print( pagexc2Data.getWord("Fr"));
      out.write("\";\r\n");
      out.write("phrase[44]=\"");
      out.print( pagexc2Data.getWord("Sa"));
      out.write("\";\r\n");
      out.write("phrase[45]=\"");
      out.print( pagexc2Data.getWord(" Today "));
      out.write("\";\r\n");
      out.write("phrase[46]=\"");
      out.print( pagexc2Data.getWord("Clear"));
      out.write("\";\r\n");
      out.write("phrase[47]=\"");
      out.print( pagexc2Data.getWord("Back"));
      out.write("\";\r\n");
      out.write("phrase[48]=\"");
      out.print( pagexc2Data.getWord("Close"));
      out.write("\";\r\n");
      out.write("phrase[49]=\"");
      out.print( pagexc2Data.getWord("Reset"));
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pagexc2Data.closeConnection(); 
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"../Resources_pages/xc2_default.js\"></script>\r\n");
      out.write("<script language=\"javascript\">xcAutoHide=1000;</script>\r\n");
      out.write("<script language=\"javascript\" src=\"../Resources_pages/xc2_inpage.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var NS4 = document.layers ? 1:0\r\n");
      out.write("var IE4 = document.all ? 1:0\r\n");
      out.write("var IE5 = document.getElementById&&document.all ? 1:0\r\n");
      out.write("var NS6 = document.getElementById&&!document.all ? 1:0\r\n");
      out.write("\r\n");
      out.write("var x=0;\r\n");
      out.write("var y=0;\r\n");
      out.write("var closetable = \"</TD></TR></TABLE></TD></TR></TABLE>\";\r\n");
      out.write("if(!IE4)\r\n");
      out.write("{\r\n");
      out.write("\tdocument.captureEvents(Event.MOUSEMOVE);\r\n");
      out.write("\tdocument.onmousemove = GetPos;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function Desc(text )\r\n");
      out.write("{\r\n");
      out.write(" \tvar opentable = \"<TABLE BGCOLOR='#000000' BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH=140><TR><TD ALIGN=center><TABLE BGCOLOR='#FFFFE1' BORDER=0 CELLPADDING=3 CELLSPACING=1 WIDTH=138><TR><TD VALIGN=top style='font-size:10px; font-family:Tahoma' align=left><IMG SRC='../img/help.gif' HEIGHT=24 WIDTH=30 VSPACE=0 HSPACE=0 ALIGN=left>\";\r\n");
      out.write("\r\n");
      out.write("\tif(NS6) {\r\n");
      out.write("\t\tdocument.getElementById(\"Description\").innerHTML  = opentable+text+closetable;\r\n");
      out.write("\t\tdocument.getElementById(\"Description\").style.left = x-12;\r\n");
      out.write("\t\tdocument.getElementById(\"Description\").style.top  = y+10;\r\n");
      out.write("\t\tdocument.getElementById(\"Description\").style.visibility = \"visible\";\r\n");
      out.write("\t}\r\n");
      out.write(" \tif(IE4) {\r\n");
      out.write("\r\n");
      out.write("\t\tdocument.all[\"Description\"].innerHTML = opentable+text+closetable;\r\n");
      out.write("\t\tDescription.style.pixelLeft = event.clientX-12;\r\n");
      out.write("\t\tDescription.style.posTop  = document.body.scrollTop+event.clientY+16;\r\n");
      out.write("\t\tDescription.style.visibility = \"visible\";\r\n");
      out.write("\t}\r\n");
      out.write("\telse {\r\n");
      out.write("\t\tvar nets = document.layers[\"Description\"];\r\n");
      out.write("\t\tnets.document.open();\r\n");
      out.write("\t\tnets.document.write(opentable+text+closetable);\r\n");
      out.write("\t\tdocument.Description.left = x-12;\r\n");
      out.write("\t\tdocument.Description.top = y+10;\r\n");
      out.write("\t\tnets.visibility = \"show\";\r\n");
      out.write("\t\tdocument.close();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function GetPos(evnt)\r\n");
      out.write("{\r\n");
      out.write("\tx = evnt.pageX;\r\n");
      out.write("\ty = evnt.pageY;\r\n");
      out.write("\treturn true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function noDesc()\r\n");
      out.write("{\r\n");
      out.write("\r\n");
      out.write("\tif(NS6) {\r\n");
      out.write("\t\tdocument.getElementById(\"Description\").style.visibility = \"hidden\";\r\n");
      out.write("\t}\r\n");
      out.write("\tif(IE4) {\r\n");
      out.write("\t\tDescription.style.visibility = \"hidden\";\r\n");
      out.write("\t}\r\n");
      out.write("\telse {\r\n");
      out.write("\t\tdocument.Description.visibility = \"hidden\";\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".dynamic-tab-pane-control .contentText{\r\n");
      out.write("\tfont:\t\t\t10px Tahoma;\r\n");
      out.write("\tcolor:\t\t\tblack;\r\n");
      out.write("}\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\tclear:\t\t\tboth;\r\n");
      out.write("\tborder:\t\t\t1px solid rgb( 145, 155, 156 );\r\n");
      out.write("\tbackground:\t\trgb( 252, 252, 254 );\r\n");
      out.write("\tz-index:\t\t2;\r\n");
      out.write("\tposition:\t\trelative;\r\n");
      out.write("\ttop:\t\t\t-2px;\r\n");
      out.write("\r\n");
      out.write("\tfont:\t\t\t11px Tahoma;\r\n");
      out.write("\tcolor:\t\t\tBlack;\r\n");
      out.write("\r\n");
      out.write("\tfilter:\t\t\tprogid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)\r\n");
      out.write("\t\t\t\t\tprogid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);\r\n");
      out.write("\tpadding:\t\t10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-row {\r\n");
      out.write("\tz-index:\t\t1;\r\n");
      out.write("\twhite-space:\tnowrap;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-row .tab.selected {\r\n");
      out.write("\twidth:\t\t\t\t74px  ;\r\n");
      out.write("\theight:\t\t\t\t18px  ;\r\n");
      out.write("\tbackground-image:\turl( \"tab.active.png\" )  ;\r\n");
      out.write("\tbackground-repaet:\tno-repeat;\r\n");
      out.write("\tborder-bottom-width:\t0;\r\n");
      out.write("\tz-index:\t\t3;\r\n");
      out.write("\tpadding:\t\t2px 0 0px 0;\r\n");
      out.write("\tmargin:\t\t\t1px -3px -3px 0px;\r\n");
      out.write("\ttop:\t\t\t-2px;\r\n");
      out.write("\tfont:\t\t\t11px Tahoma;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-row .tab a {\r\n");
      out.write("\tfont:\t\t\t\t11px Tahoma;\r\n");
      out.write("\tcolor:\t\t\t\tBlack;\r\n");
      out.write("\ttext-decoration:\tnone;\r\n");
      out.write("\tcursor:\t\t\t\tdefault;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-row .tab.hover {\r\n");
      out.write("\tfont:\t\t\t\t11px Tahoma;\r\n");
      out.write("\twidth:\t\t\t\t70px;\r\n");
      out.write("\theight:\t\t\t\t16px;\r\n");
      out.write("\tbackground-image:\turl( \"tab.hover.png\" );\r\n");
      out.write("\tbackground-repaet:\tno-repeat;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("\t/*background:\t#E1F4FF; */\r\n");
      out.write("\tbackground-color: #b8ced9;\r\n");
      out.write("\tbackground-image: url(../img/rep_body.png);\r\n");
      out.write("\tbackground-repeat: repeat-x;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("}\r\n");
      out.write("body {\r\n");
      out.write("\tmargin:\t\t10px;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control h2 {\r\n");
      out.write("\ttext-align:\tcenter;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control h2 a {\r\n");
      out.write("\tdisplay:\tinline;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control a:hover {\r\n");
      out.write("\tbackground: transparent;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(" .dynamic-tab-pane-control.tab-pane {\r\n");
      out.write("\tposition:\trelative;\r\n");
      out.write("\twidth:\t\t100%;\r\n");
      out.write("\tmargin-right:\t-2px;\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write(".style1 {\r\n");
      out.write("\tfont-size: 11px;\r\n");
      out.write("\tfont-weight: ;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("function validateDataToSubmit()\r\n");
      out.write("{\r\n");
      out.write("\tvar m_year;\r\n");
      out.write("\tvar m_month ;\r\n");
      out.write("\tvar m_day;\r\n");
      out.write("\r\n");
      out.write("\tvar temp = document.ceridian_report_form.start_date.value;\r\n");
      out.write("\tvar m_year = temp.substring(6, 10);\r\n");
      out.write("\tvar m_month =temp.substring(0, 2) - 1;\r\n");
      out.write("\tvar m_day =temp.substring(3, 5);\r\n");
      out.write("\r\n");
      out.write("\tvar start = new Date( m_year,m_month,m_day);\r\n");
      out.write("\r\n");
      out.write("\t//var end = Date(document.ceridian_report_form.end_date.value);\r\n");
      out.write("\r\n");
      out.write("\tif(start.getDay() != 0)\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pagePayData.getWord("Report starting date must be Sunday!"));
      out.write("\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\ttemp = document.ceridian_report_form.end_date.value;\r\n");
      out.write("\tm_year = temp.substring(6, 10);\r\n");
      out.write("\tm_month =temp.substring(0, 2) - 1;\r\n");
      out.write("\tm_day =temp.substring(3, 5);\r\n");
      out.write("\tvar end = new Date( m_year,m_month,m_day);\r\n");
      out.write("/*\r\n");
      out.write("\talert(\"end \" + end)\r\n");
      out.write("\talert(\"Date \"+ end.getDate())\r\n");
      out.write("\talert(\"Day \"+ end.getDay())\r\n");
      out.write("\talert(\"Month\"+ end.getMonth())\r\n");
      out.write("\talert(\"Year\"+ end.getYear())\r\n");
      out.write("*/\r\n");
      out.write("\r\n");
      out.write("\tif(end.getDay() != 6)\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pagePayData.getWord("Report ending date must be Saturday!"));
      out.write("\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tif (start > end)\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pagePayData.getWord("Starting date must be prior to ending date"));
      out.write("\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tif (end.getTime() - start.getTime() > 522000000)\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pagePayData.getWord("You cannot extract data for more than one week"));
      out.write("\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tif (document.ceridian_report_form.exportTo.value == '')\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pagePayData.getWord("You must select a payroll company"));
      out.write("\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tif (document.ceridian_report_form.exportEmail.value == '')\r\n");
      out.write("\t{\r\n");
      out.write("\t\talert(\"");
      out.print( pagePayData.getWord("You must specify an email adress to which the report will be sent"));
      out.write("\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t}\r\n");
      out.write("\tdocument.ceridian_report_form.date_start.value = document.ceridian_report_form.start_date.value;//start;//\r\n");
      out.write("\tdocument.ceridian_report_form.date_end.value = document.ceridian_report_form.end_date.value;//end;//\r\n");
      out.write("\tdocument.ceridian_report_form.pay_system.value = document.ceridian_report_form.exportTo.value;\r\n");
      out.write("\tdocument.ceridian_report_form.export_addr.value = document.ceridian_report_form.exportEmail.value;\r\n");
      out.write("\tdocument.ceridian_report_form.export_from.value = document.ceridian_report_form.exportFrom.value;\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\tvar destination = \"./extractPayrollData.jsp?start_date=\";\r\n");
      out.write("\tdestination +=document.ceridian_report_form.date_start.value;\r\n");
      out.write("\tdestination +=\"&date_end=\";\r\n");
      out.write("\tdestination +=document.ceridian_report_form.date_end.value;\r\n");
      out.write("\tdestination +=\"&pay_system=\";\r\n");
      out.write("\tdestination +=document.ceridian_report_form.pay_system.value;\r\n");
      out.write("\tdestination +=\"&export_addr=\";\r\n");
      out.write("\tdestination +=document.ceridian_report_form.export_addr.value;\r\n");
      out.write("\tdestination +=\"&export_from=\";\r\n");
      out.write("\tdestination +=document.ceridian_report_form.export_from.value;\t\r\n");
      out.write("\tdocument.location = destination;\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("    // Associate a default button with pressing the Enter key\r\n");
      out.write("\tfunction KeyDownHandler(btn)\r\n");
      out.write("    {\r\n");
      out.write("        // process only the Enter key\r\n");
      out.write("        if (event.keyCode == 13)\r\n");
      out.write("        {\r\n");
      out.write("            // cancel the default submit\r\n");
      out.write("            event.returnValue=false;\r\n");
      out.write("            event.cancel = true;\r\n");
      out.write("            // submit the form by programmatically clicking the specified button\r\n");
      out.write("            btn.click();\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"rep_body\">\r\n");
      out.write("\r\n");
      out.write("  <div class=\"dynamic-tab-pane-control\">\r\n");
      out.write("\t<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("\t  \r\n");
      out.write(" \t\t<div class=\"tab-page\" id=\"general\">\r\n");
      out.write("\t\t\t<fieldset>\r\n");
      out.write("\t\t\t\t<legend>");
      out.print( pagePayData.getWord("Extract payroll data"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t<form name=\"ceridian_report_form\" target=\"_self\" action=\"extractPayrollData.jsp\" method=\"post\" onKeyDown=\"KeyDownHandler(getCeridianData)\">\r\n");
      out.write("\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><br>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"style1\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");
      out.print( pagePayData.getWord("From"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td valign=\"middle\" class=\"style1\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"start_date\" name=\"start_date\" onFocus=\"showCalendar('',this,this,'','id_reportDate',0,10,1);this.blur()\" size=\"15\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;");
      out.print( pagePayData.getWord("To"));
      out.write("&nbsp;&nbsp;<input type=\"text\" id=\"end_date\" name=\"end_date\" onFocus=\"showCalendar('',this,this,'','id_reportDate',0,10,1);this.blur()\" size=\"15\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"style1\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");
      out.print( pagePayData.getWord("Export to"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("                                  <select name=\"exportTo\" id=\"select\">\r\n");
      out.write("                                    <option value=\"ceridian\">Ceridian</option>\r\n");
      out.write("                                  </select>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"style1\">\r\n");
      out.write("                                  ");
      out.print( pagePayData.getWord("Mail from"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("                                  <input type=\"text\" size=\"35\" name=\"exportFrom\" id=\"exportFrom\" value=\"finance@aheeva.com\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"style1\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print( pagePayData.getWord("Mail to"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("                                  <input type=\"text\" size=\"35\" name=\"exportEmail\" id=\"exportEmail\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input id=\"getCeridianData\" name=\"getCeridianData\" type=\"button\" value=\"");
      out.print( pagePayData.getWord("Submit"));
      out.write("\" onClick=\"return validateDataToSubmit();\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id=\"date_start\" name=\"date_start\" />\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id=\"date_end\" name=\"date_end\" />\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id=\"pay_system\" name=\"pay_system\" />\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id=\"export_from\" name=\"export_from\" />\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id=\"export_addr\" name=\"export_addr\" />\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t  </div>\r\n");
      out.write("\t\t   </div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pagePayData.closeConnection(); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
