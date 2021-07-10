package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import aheevaManager.ressources.*;
import java.io.*;
import java.text.*;
import aheevaManager.reports.*;

public final class conversationRecording_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

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
      out.write("<LINK href=\"../Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"../Resources_pages/livestats.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/Browser.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/Browser.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("/*html, body {\r\n");
      out.write("\tbackground:\tThreeDFace;\r\n");
      out.write("}*/\r\n");
      out.write(".reportLook {\r\n");
      out.write("\tclear: both;\r\n");
      out.write("\tborder: 1px solid rgb(145, 155, 156);\r\n");
      out.write("\tbackground: rgb(252, 252, 254);\r\n");
      out.write("\tz-index: 2;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("\ttop: -2px;\r\n");
      out.write("\tfont: 11px Tahoma;\r\n");
      out.write("\tcolor: Black;\r\n");
      out.write("\tfilter: progid : DXImageTransform . Microsoft .\r\n");
      out.write("\t\tGradient(StartColorStr = #fffcfcfe, EndColorStr = #fff4f3ee,\r\n");
      out.write("\t\tGradientType = 0) progid : DXImageTransform . Microsoft .\r\n");
      out.write("\t\tShadow(Color = #ff919899, Strength = 2, Direction = 135);\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	
	beanManagerData pageCrecData = new beanManagerData();
	pageCrecData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageCrecData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	String tenant_dbid = (request.getParameter("tenant")==null)?"":request.getParameter("tenant");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>Recording</title>\r\n");
      out.write("<script>\r\n");
      out.write(" \r\n");
      out.write("\tfunction saveAll() {\r\n");
      out.write("\t}\r\n");
      out.write(" \r\n");
      out.write("\tfunction getRequestedRecordings()\r\n");
      out.write("\t{\t\r\n");
      out.write("\t\t//convert from 2006/06/15 to 06/15/2006\r\n");
      out.write("\t\tvar startdate = getRequestedRecordings.arguments[0];\r\n");
      out.write("\t\tif(startdate.length > 1)\t\t\r\n");
      out.write("\t\t\tstartdate =  startdate.substring(5,7)+'/'+ startdate.substring(8)+'/'+startdate.substring(0,4);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar enddate   = getRequestedRecordings.arguments[1];\r\n");
      out.write("\t\tif(enddate.length > 1)\r\n");
      out.write("\t\t\tenddate =  enddate.substring(5,7)+'/'+ enddate.substring(8)+'/'+enddate.substring(0,4);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\tvar phonenum  = getRequestedRecordings.arguments[2];\r\n");
      out.write("\t\tvar page      = getRequestedRecordings.arguments[3];\r\n");
      out.write("\t\tvar limit     = getRequestedRecordings.arguments[4];\r\n");
      out.write("\t\tvar numpages  = getRequestedRecordings.arguments[5];\r\n");
      out.write("\t\tvar firstload  = getRequestedRecordings.arguments[6];\r\n");
      out.write("\t\tvar selectedGroups   = getRequestedRecordings.arguments[7];\r\n");
      out.write("\t\tvar agents   = getRequestedRecordings.arguments[8];\r\n");
      out.write("\t\tvar get_sales = getRequestedRecordings.arguments[9];\r\n");
      out.write("\t\tvar get_no_sales = getRequestedRecordings.arguments[10];\r\n");
      out.write("\t\tvar numrecords = getRequestedRecordings.arguments[11];\r\n");
      out.write("\t\tvar get_audio = getRequestedRecordings.arguments[12];\r\n");
      out.write("\t\tvar get_video = getRequestedRecordings.arguments[13];\r\n");
      out.write("\t\tvar dnid = getRequestedRecordings.arguments[14];\r\n");
      out.write("\t\tvar get_qm = \"\"\r\n");
      out.write("\t\tvar get_not_listened = \"\";\r\n");
      out.write("\t\tvar get_listened = \"\";\r\n");
      out.write("\t\tvar dnis = \"\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//alert(startdate+'..'+enddate)\t\t\r\n");
      out.write("\t\tdestination = \"../jsp/conversationRecording.jsp\"\r\n");
      out.write("\t\tdestination += \"?startingDate=\"\r\n");
      out.write("\t\tdestination += startdate;\r\n");
      out.write("\t\tdestination +=\"&endingDate=\";\r\n");
      out.write("\t\tdestination += enddate;\r\n");
      out.write("\t\tdestination +=\"&phoneNumber=\";\r\n");
      out.write("\t\t// Use following function to use wildcards in phone numbers\r\n");
      out.write("\t\tdestination +=escape(phonenum);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tdestination +=\"&page=\";\r\n");
      out.write("\t\tdestination += page;\r\n");
      out.write("\t\tdestination +=\"&limit=\";\r\n");
      out.write("\t\tdestination +=\tlimit;\r\n");
      out.write("\t\tdestination +=\"&numpages=\";\r\n");
      out.write("\t\tdestination += numpages;\r\n");
      out.write("\t\tdestination +=\"&firstload=false\";\t\r\n");
      out.write("\t\tdestination +=\"&agentGrp=\";\r\n");
      out.write("\t\tdestination += selectedGroups;\r\n");
      out.write("\t\tdestination +=\"&agents=\";\r\n");
      out.write("\t\tdestination += agents;\r\n");
      out.write(" \r\n");
      out.write("\t\tdestination +=\"&option_not_listened=\";\r\n");
      out.write("\t\tdestination += get_not_listened;\r\n");
      out.write("\t\tdestination +=\"&option_listened=\";\r\n");
      out.write("\t\tdestination += get_listened;\r\n");
      out.write("\t\tdestination +=\"&sales=\";\r\n");
      out.write("\t\tdestination +=get_sales;\r\n");
      out.write("\t\tdestination +=\"&no_sales=\";\r\n");
      out.write("\t\tdestination += get_no_sales;\r\n");
      out.write("\t\tdestination +=\"&qm=\";\r\n");
      out.write("\t\tdestination += get_qm;\r\n");
      out.write("\t\tdestination += \"&numrec=\";\r\n");
      out.write("\t\tdestination += numrecords;\r\n");
      out.write("\t\tdestination +=\"&audio=\";\r\n");
      out.write("\t\tdestination += get_audio;\r\n");
      out.write("\t\tdestination += \"&video=\";\r\n");
      out.write("\t\tdestination += get_video;\r\n");
      out.write("\t\tdestination +=\"&tenant=\";\r\n");
      out.write("\t\tdestination +=\"");
      out.print(tenant_dbid);
      out.write("\";\r\n");
      out.write("\t\t//alert(destination);\r\n");
      out.write("\t \r\n");
      out.write("\t\tdocument.location = destination;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\t\r\n");
      out.write(" \r\n");
      out.write("\tvar userDbid = ");
      out.print(CURRENT_USER_DBID);
      out.write(";\r\n");
      out.write(" \r\n");
      out.write("\t\r\n");
      out.write("\tfunction submitInfo()\r\n");
      out.write("\t{\r\n");
      out.write("\t\t//alert(record+','+submitInfo.arguments[1]+','+submitInfo.arguments[2]+','+submitInfo.arguments[3]+','+submitInfo.arguments[4]+','+submitInfo.arguments[5]+','+submitInfo.arguments[11])\r\n");
      out.write("\t\tvar record_file='';\r\n");
      out.write("\t\tvar record = submitInfo.arguments[0];\r\n");
      out.write("\t\tvar pathval = submitInfo.arguments[1];\r\n");
      out.write("\t\tvar agtid = submitInfo.arguments[2];\r\n");
      out.write("\t\tvar file = submitInfo.arguments[3];\r\n");
      out.write("\t\tvar phoneval = submitInfo.arguments[4];\r\n");
      out.write("\t\tvar encryptval = submitInfo.arguments[5];\r\n");
      out.write("\t\tvar grp = submitInfo.arguments[6];\r\n");
      out.write("\t\tvar encmeth = submitInfo.arguments[7];\r\n");
      out.write("\t\tvar encservid = submitInfo.arguments[8];\t\r\n");
      out.write("\t\tvar tomcaturl = submitInfo.arguments[9];\t\r\n");
      out.write("\t\tvar tomcatpath = submitInfo.arguments[10];\t\r\n");
      out.write("\t\tvar saveAs = submitInfo.arguments[11];\t\r\n");
      out.write("\t\tvar video_filename = submitInfo.arguments[12];\t\r\n");
      out.write("\t\tvar audio_time = submitInfo.arguments[13];\t\r\n");
      out.write("\t\tvar video_time = submitInfo.arguments[14];\t\r\n");
      out.write("\t\tvar servPath = window.top.comm.myApplet.servletPath;\r\n");
      out.write("\t\tvar proto =  window.top.comm.myApplet.getProto();\r\n");
      out.write("\t\tvar encparams='' ;\r\n");
      out.write("\t\tif(encservid == '' || encservid.length < 1)\r\n");
      out.write("\t\t{\t//Get parameters from the encryption server associated with the agent group \r\n");
      out.write("\t\t\tencparams = window.top.comm.myApplet.getEncryptionServerParamsForAgent(grp);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tencparams = window.top.comm.myApplet.getEncryptionServerParamsForServer(encservid);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tvar jsEncparams = encparams.split(\",\");\r\n");
      out.write("\t\tvar encServerHost = \"\";\r\n");
      out.write("\t\tvar encServerPort = \"\";\r\n");
      out.write("\t\ttry{\r\n");
      out.write("\t\tif(jsEncparams.length > 1)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tencServerHost = jsEncparams[1];\r\n");
      out.write("\t\t\tencServerPort = jsEncparams[2];\r\n");
      out.write("\t\t\tservPath = jsEncparams[3];\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t}catch (exception){}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar nextLoc;\r\n");
      out.write("\t\tif (saveAs == 0) {\r\n");
      out.write("\t\tif (video_filename == undefined) {\r\n");
      out.write("\t\t\tif (encryptval == \"0\") {\r\n");
      out.write("\t\t\t\tnextLoc =\"./wavFileGenerator.jsp?record_id=\";\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\tnextLoc =\"./decrypt.jsp?record_id=\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t} else {\r\n");
      out.write("\t\t\tnextLoc =\"./AVviewer.jsp?record_id=\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t} else {\r\n");
      out.write("\t\t\tnextLoc =\"./saveFileAs.jsp?record_id=\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tnextLoc +=record;\r\n");
      out.write("\t\tnextLoc +=\"&path=\";\r\n");
      out.write("\t\tnextLoc +=pathval;\r\n");
      out.write("\t\tnextLoc +=\"&agt=\";\r\n");
      out.write("\t\tnextLoc +=agtid;\r\n");
      out.write("\t\tnextLoc +=\"&file=\";\r\n");
      out.write("\t\tnextLoc +=file;\r\n");
      out.write("\t\tnextLoc +=\"&phone=\";\r\n");
      out.write("\t\tnextLoc +=phoneval;\r\n");
      out.write("\t\tnextLoc +=\"&encval=\";\r\n");
      out.write("\t\tnextLoc +=encryptval;\r\n");
      out.write("\t\tnextLoc +=\"&encmeth=\";\r\n");
      out.write("\t\tnextLoc +=encmeth;\r\n");
      out.write("\t\tnextLoc +=\"&proto=\";\r\n");
      out.write("\t\tnextLoc +=proto;\r\n");
      out.write("\t\tnextLoc +=\"&encServerHost=\";\r\n");
      out.write("\t\tnextLoc +=encServerHost;\r\n");
      out.write("\t\tnextLoc +=\"&encServerPort=\";\r\n");
      out.write("\t\tnextLoc +=encServerPort;\r\n");
      out.write("\t\tnextLoc +=\"&servletpath=\";\r\n");
      out.write("\t\tnextLoc +=servPath;\r\n");
      out.write("\t\tnextLoc +=\"&userDbid=\";\r\n");
      out.write("\t\tnextLoc +=userDbid;\r\n");
      out.write("\t\tnextLoc +=\"&tomcaturl=\";\r\n");
      out.write("\t\tnextLoc +=tomcaturl;\r\n");
      out.write("\t\tnextLoc +=\"&tomcatpath=\";\r\n");
      out.write("\t\tnextLoc +=tomcatpath;\r\n");
      out.write("\t\tnextLoc +=\"&video_file=\";\r\n");
      out.write("\t\tnextLoc +=video_filename;\r\n");
      out.write("\t\tnextLoc +=\"&audio_time=\";\r\n");
      out.write("\t\tnextLoc +=audio_time;\r\n");
      out.write("\t\tnextLoc +=\"&video_time=\";\r\n");
      out.write("\t\tnextLoc += video_time;\r\n");
      out.write("\t\tnextLoc +=\"&tenant=\";\r\n");
      out.write("\t\tnextLoc +=\"");
      out.print(tenant_dbid);
      out.write("\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif( encryptval == '1' && proto != 'https' && proto != 'HTTPS')\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageCrecData.getWord("To listen to an encrypted record, please login via https !"));
      out.write("\");\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t//alert('location = '+nextLoc)\r\n");
      out.write("\t\t//javascript:window.open(nextLoc,'formWindow','scrollbars=yes,width=100,height=50');//,'scrollbars=yes,width=600,height=400'\r\n");
      out.write("\t\tif (video_filename == undefined)\r\n");
      out.write("\t\t\tdocument.getElementById(\"h_file_reader\").src = nextLoc;\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t\twindow.location.href = nextLoc;\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t//Now send message to cti to inform that this user has listened to the record\r\n");
      out.write("\t\tif(appletObj )\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tvar sret = appletObj.sendRecListenMessageToCti(userDbid, record, file);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("function goEvaluationForm(p1,p2,p3,p4,p5,p6) \r\n");
      out.write("\t{\r\n");
      out.write("\t\t\r\n");
      out.write("\t\twindow.open('conversationRecordingEvaluation.jsp?url='+p5+'&path='+p6+'&recid='+p1+'&tracknum='+p4+'&grpid='+p3+'&agtid='+p2+'&tenant=");
      out.print(tenant_dbid);
      out.write("','formWindow', 'resizable=yes,maximize=yes,scrollbars=yes,width=800,height=600,status=yes');//,'scrollbars=yes,width=600,height=400'\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      aheevaManager.reports.beanConversationRecord beanRecord = null;
      synchronized (request) {
        beanRecord = (aheevaManager.reports.beanConversationRecord) _jspx_page_context.getAttribute("beanRecord", PageContext.REQUEST_SCOPE);
        if (beanRecord == null){
          beanRecord = new aheevaManager.reports.beanConversationRecord();
          _jspx_page_context.setAttribute("beanRecord", beanRecord, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"bottompagebody\">\r\n");

    long tLoginTime = 0;
    long tNotReadyTime = 0;
    String option ="", tmp ="";
    String startingDate = request.getParameter("startingDate");
		startingDate =(startingDate == null ? "" : startingDate);
    String endingDate   = request.getParameter("endingDate");
		endingDate =(endingDate == null ? "" : endingDate);

	if(startingDate.length() > 6)
		startingDate = startingDate.substring(6)+"/"+ startingDate.substring(0,2)+"/"+startingDate.substring(3,5) ;
	if(endingDate.length() > 6)
		endingDate = endingDate.substring(6)+"/"+ endingDate.substring(0,2)+"/"+endingDate.substring(3,5) ;

    String phoneNumber  = request.getParameter("phoneNumber");
		phoneNumber =(phoneNumber == null ? "" : phoneNumber);

    String agents   = request.getParameter("agents");
		agents =(agents == null ? "" : agents);
    String agentGrp  = request.getParameter("agentGrp");
		agentGrp =(agentGrp == null ? "" : agentGrp);
    String option_not_listened = request.getParameter("option_not_listened");
		option_not_listened =(option_not_listened == null ? "" : option_not_listened);
    String option_listened = request.getParameter("option_listened");
		option_listened =(option_listened == null ? "" : option_listened);
    String option_qm = request.getParameter("qm");
		option_qm =(option_qm == null ? "" : option_qm);
    String option_sales = request.getParameter("sales");
		option_sales =(option_sales == null ? "" : option_sales);
    String option_no_sales = request.getParameter("no_sales");
		option_no_sales =(option_no_sales == null ? "" : option_no_sales);
	String option_audio = request.getParameter("audio");
		option_audio =(option_audio == null ? "" : option_audio);
    String option_video = request.getParameter("video");
		option_video =(option_video == null ? "" : option_video);
	String pageStr = request.getParameter("page");
	String dnid  = request.getParameter("dnid");
		dnid =(dnid == null ? "" : dnid);
	int	pagenum =(pageStr == null ? 1 : Integer.parseInt(pageStr));
	
	String limit = request.getParameter("limit");
		limit =(limit == null ? "" : limit);
	String firstload  = request.getParameter("firstload");
		firstload = (firstload == null ? "true" : firstload);	
		if(firstload.compareTo("false")==0)
			beanRecord.firstexec = false;
				
	String numpagesStr  = "";
	String numberofrecords = "";
 
	if(firstload.compareTo("false") == 0) {
		numpagesStr = request.getParameter("numpages");
		numpagesStr = (numpagesStr == null ? "" : numpagesStr);	
		   
		numberofrecords = request.getParameter("numrec");
		numberofrecords =(numberofrecords == null ? "0" : numberofrecords);
		beanRecord.numberOfRecords = Integer.parseInt(numberofrecords);
	}
 


    boolean agentReport = true;
    if(option_listened.compareTo("1")==0)
        {tmp =  pageCrecData.getWord("Listened"); option = "1";}
    if(option_not_listened.compareTo("1")==0)
        {tmp = pageCrecData.getWord("Non listened"); option = "2";}
    if(option_not_listened.compareTo(option_listened)==0 )
        {tmp = pageCrecData.getWord("All"); option = "0";}

   //update the system file database
    /*String updateCmd = "updatedb";
    try{
        Runtime rt = Runtime.getRuntime();
        Process child = rt.exec(updateCmd);
    }catch(Exception e){
        e.printStackTrace();
    }*/

   String agtVar="";
   beanConversationDetails r1=null;
    try{
	   if(agents.compareTo("AllAgents") !=0)
		   {
			  agtVar = agents;
			  agentReport = true;
			 
			  beanRecord.getConversationRecordsForAgent (agents,agentGrp,startingDate,
					endingDate, option, phoneNumber,option_qm,option_sales,option_no_sales,limit, "", pagenum, option_audio, option_video, dnid);
		   }
	   else{
			  agtVar =  agentGrp;
			  agentReport = false;
			  
			  beanRecord.getConversationRecordsForGroup (agentGrp,startingDate,
				   endingDate, option, phoneNumber,option_qm,option_sales,option_no_sales,limit, "", pagenum, option_audio, option_video, dnid);
		   }
   				
		numberofrecords = Long.toString(beanRecord.numberOfRecords);
		System.out.println("\n All queries are completed in beanRecord. Construction JSP info, numberofrecords="+numberofrecords) ;
	
		 
   }catch(Exception e){
        //e.printStackTrace();
		System.out.println("\n  Error in JSP ..") ;

    }


      out.write("\r\n");
      out.write("\r\n");
      out.write("<p align=\"center\">&nbsp; </p>\r\n");
      out.write("<div class=\"tab-page\" >\r\n");
      out.write("  <fieldset > <b><legend>");
      out.print( pageCrecData.getWord("Listening to agent's conversations"));
      out.write("</legend> </b><!--<legend class=\"genericTitle\"> <h5>-->\r\n");
      out.write(" <br>\r\n");
      out.write("   \r\n");
      out.write("  <div class=\"reportLook\" > \r\n");
      out.write("    <table width=\"400\" border=\"0\" align=\"center\"  >\r\n");
      out.write("      <tr> \r\n");
      out.write("        <td align=left> </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr class=\"reportsID\"> \r\n");
      out.write("        <td class=\"textblack\"><div > <b> \r\n");
      out.write("            ");
out.write(tmp);
      out.write("\r\n");
      out.write("            ");
      out.print( pageCrecData.getWord("Records list"));
      out.write("\r\n");
      out.write("             ");
 if(startingDate.length() >0) out.write(pageCrecData.getWord("From")+": "+startingDate);
      out.write("\r\n");
      out.write("            ");
 if(endingDate.length() >0) out.write(pageCrecData.getWord("To")+": " + endingDate);
      out.write("\r\n");
      out.write("            </b></div></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr> \r\n");
      out.write("        <td> <div > <b> \r\n");
      out.write("            ");
 if(phoneNumber.length()>0)  out.write(pageCrecData.getWord(" where Phone Number = ")+ phoneNumber);//out.write(" where Phone Number = " + phoneNumber);
      out.write("\r\n");
      out.write("            </b></div></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t<div><b> ");
 if(dnid.length()>0)  out.write(pageCrecData.getWord(" where DNID = ")+ dnid);//out.write(" where Phone Number = " + phoneNumber);
      out.write("\r\n");
      out.write("\t\t</b></div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("    </table>\r\n");
      out.write("    <p  class=\"reportsID\"> \r\n");
      out.write("    <div style=\"background-color:#EAEAEA; width:100% height:18 \" ><b> \r\n");
      out.write("\t<table><tr> <td>\r\n");
      out.write("       ");
 if(agentReport == true) out.write(pageCrecData.getWord("Agent")+"[" +agtVar+"]");
		 else{
				if(agtVar.length() > 9){
					if(agtVar.substring(0,10).compareTo("AllGroups/")== 0 )
						out.write(pageCrecData.getWord("Group")+" ["+pageCrecData.getWord("All groups")+"]");
					else
						out.write(pageCrecData.getWord("Group")+" [" +agtVar+"]");
				}
			}
		
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td width=\"450\"></td>\r\n");
      out.write("\t\t<td width=\"350\" align=\"center\"><b>\r\n");
      out.write("\t\t");
 int start = (pagenum-1)*Integer.parseInt(limit); 
		int endp =start+Integer.parseInt(limit); 
		endp=(endp>Integer.parseInt(numberofrecords)?Integer.parseInt(numberofrecords):endp); 
		out.write(Integer.toString(start)+"-"+Integer.toString(endp)+" "+pageCrecData.getWord("of")+" " +numberofrecords+" "+pageCrecData.getWord("records found")+"." );	
      out.write("</b>\r\n");
      out.write("\t  </td>\t\r\n");
      out.write("\t</tr></table>\t\r\n");
      out.write("      </b> </div></p>\r\n");
      out.write("    <table border=\"1\"  cellpadding=\"0\" cellspacing=\"1\" style=\"border-collapse:separate; border-color:#DCDAD6\"  id=\"AutoNumber1\">\r\n");
      out.write("      <tr class=\"reportsTab\"> \r\n");
      out.write("        <td width=\"150\"  height=\"30\" align=\"center\"> ");
      out.print( pageCrecData.getWord("Call time"));
      out.write(" \r\n");
      out.write("        </td>\r\n");
      out.write("\t\t<td  align=\"center\"> ");
      out.print( pageCrecData.getWord("Call length"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("        <td  align=\"center\"> ");
      out.print( pageCrecData.getWord("Phone number"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("\t\t<td align=\"center\">");
      out.print( pageCrecData.getWord("DNID"));
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("        <td  align=\"center\">");
      out.print( pageCrecData.getWord("Direction") );
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("        <td  align=\"center\"> ");
      out.print( pageCrecData.getWord("Campaign"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("        <td  align=\"center\"> ");
      out.print( pageCrecData.getWord("Command"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("\t\t<td  align=\"center\"> ");
      out.print(pageCrecData.getWord("Evaluation"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("        <td  align=\"center\"> ");
      out.print( pageCrecData.getWord("Agent name"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("        <td  align=\"center\"> ");
      out.print( pageCrecData.getWord("Agent ID"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("        ");

	   if(option_sales.compareTo(option_no_sales)==0)
		{
		   out.write("<td    align=\"center\">"+pageCrecData.getWord("Sale info")+" </td>");
		}
	
	  if(phoneNumber.length() >0)
		{
		   out.write("<td    align=\"center\">"+pageCrecData.getWord("Call history")+" </td>");
		}
		
      out.write("\r\n");
      out.write("        <td    align=\"center\"> ");
      out.print( pageCrecData.getWord("Encryption"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("        <td    align=\"center\"> ");
      out.print( pageCrecData.getWord("Encryption method"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("        <td    align=\"center\"> ");
      out.print( pageCrecData.getWord("Encryption server"));
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      ");

	if(beanRecord.m_vAllDetails.size() > 0){
	try
	{
		for (int i = 0; i < beanRecord.m_vAllDetails.size(); i++) 
		{
			r1 = (beanConversationDetails)beanRecord.m_vAllDetails.elementAt(i);
			String rec_id = r1.record_id != null ? r1.record_id : "";
			String campaign = r1.campaign != null ? r1.campaign : "";
			
			String path = r1.path != null ? r1.path : "";
			String agt_id = r1.agt_id != null ? r1.agt_id : "";
			String file = r1.file != null ? r1.file : "";
			String filename_video = r1.filename_video != null ? r1.filename_video : "";
			String cur_phoneNumber = r1.phoneNumber != null ? r1.phoneNumber : "";
			String cur_dnid = r1.dnis != null ? r1.dnis : "";
			String encryption = r1.is_encrypted != null ? r1.is_encrypted : "";
			String grp_dbid = r1.grp_dbid != null ? r1.grp_dbid : "";
			String enc_method = r1.enc_method != null ? r1.enc_method : "";
			String enc_server_dbid = r1.enc_server_dbid != null ? r1.enc_server_dbid : "";
			String tomcaturl = r1.rs_tomcat_dir!= null ? r1.rs_tomcat_dir : "";
			String tomcatpath = r1.rs_path!= null ? r1.rs_path : "";
			String direction = r1.direction;
			long audio_time = r1.audio_time;
			long video_time = r1.video_time;
			String tracknum = r1.tracknum != null ? r1.tracknum : "";
			String feval = r1.feval != null ? r1.feval : "0";

	
      out.write("\r\n");
      out.write("      <tr ");
 if(i%2 == 0) out.write("class=conversationRowPair");
  			else out.write("class=reportsRowUnPair");
      out.write(" > \r\n");
      out.write("        <td width=\"150\"  align=\"center\">\r\n");
      out.write("          ");
if(r1.callTime != null)  out.write(r1.callTime);
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("\t\t<td    align=\"center\">\r\n");
      out.write("          ");
if(r1.call_length != null)  out.write(r1.call_length);
      out.write("\r\n");
      out.write("        </td>\t\t\r\n");
      out.write("        <td    align=\"center\">\r\n");
      out.write("          ");
if(r1.phoneNumber != null) out.write(r1.phoneNumber);
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("\t\t<td align=\"center\">\r\n");
      out.write("\t\t");
if(r1.dnis != null) out.write(r1.dnis);
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("        <td align=\"center\">");
      out.print( pageCrecData.getWord(r1.direction) );
      out.write("</td>\r\n");
      out.write("        <td    align=\"center\">\r\n");
      out.write("          ");
if(r1.campaign != null) out.write(r1.campaign);
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t<td height=\"27\" align=\"center\">&nbsp; ");
 
		if(option_audio.compareTo("1")==0 || option_video.compareTo(option_audio)==0)
		{
			if(file.compareTo("")!=0 && file.compareTo("NULL")!=0)
			{
				out.write("	<input  id='audioIcon' name='audioIcon' type='image' src='../img/audio32x32.gif' onClick=\"submitInfo('"+rec_id + "','" + path+ "','" + agt_id+ "','" +file+ "','" +cur_phoneNumber+ "','" +encryption+ "','" +grp_dbid+ "','" +enc_method+ "','" +enc_server_dbid+ "','" +tomcaturl+ "','" +tomcatpath+ "',0)\">\n");
			}
			else
			{
				out.write("	<input disabled='disabled'  id='audioIcon' name='audioIcon' type='image' src='../img/audio32x32BW.gif' >\n");
			}			
				
		}
		if(option_video.compareTo("1")==0 || option_video.compareTo(option_audio)==0)
		{
			if(filename_video.compareTo("")!=0 && filename_video.compareTo("NULL")!=0)
			{
				out.write("	<input  id='videoIcon' name='videoIcon' type='image' src='../img/video32x32.gif' onClick=\"submitInfo('"+rec_id + "','" + path+ "','" + agt_id+ "','" +filename_video+ "','" +cur_phoneNumber+ "','" +encryption+ "','" +grp_dbid+ "','" +enc_method+ "','" +enc_server_dbid+ "','" +tomcaturl+ "','" +tomcatpath+ "',0)\">\n");
			
			}
			else
			{
				out.write("	<input disabled='disabled'  id='videoIcon' name='videoIcon' type='image' src='../img/video32x32BW.gif' >\n");
			}
				
			
		}
		
		
		/* if(option_audio.compareTo("1")==0 && option_video.compareTo("1")==0)
		{
			if(filename_video.compareTo("")!=0 && filename_video.compareTo("NULL")!=0 && file.compareTo("")!=0 && file.compareTo("NULL")!=0)
			{
				out.write("	<input  id='avIcon' name='avIcon' type='image' src='../img/av32x32.gif' onClick=\"submitInfo('" + rec_id + "','" + path+ "','" + agt_id+ "','" +file+ "','" +cur_phoneNumber+ "','" +encryption+ "','" +grp_dbid+ "','" +enc_method+ "','" +enc_server_dbid+ "','" +tomcaturl+ "','" +tomcatpath+ "','" +filename_video+ "',"  + audio_time + ")\" >");
			}
			else
			{
				out.write("	<input disabled='disabled'  id='avIcon' name='avIcon' type='image' src='../img/av32x32BW.gif' >\n");
			}
				
			
		}*/
		
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("\t\t<td    align=\"center\">\r\n");
      out.write("          <input type=\"button\" value=\"");
      out.print((feval.compareTo("1")==0)?pageCrecData.getWord("Edit evaluation"):pageCrecData.getWord("Add evaluation"));
      out.write("\" onClick=\"goEvaluationForm('");
      out.print(rec_id);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(agt_id);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(grp_dbid);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(tracknum);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(tomcaturl);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(tomcatpath);
      out.write("');\">\r\n");
      out.write("        </td>\r\n");
      out.write("        <td    align=\"center\"> ");
if(r1.last_name != null) out.write(r1.last_name);
      out.write("\r\n");
      out.write("          , \r\n");
      out.write("          ");
if(r1.first_name != null) out.write(r1.first_name);
      out.write(" </td>\r\n");
      out.write("        <td    align=\"center\"> ");
if(r1.agt_id != null) out.write(r1.agt_id);
      out.write(" </td>\r\n");
      out.write("        ");

	   if(option_sales.compareTo(option_no_sales)==0)
		{
		   if(r1.sale_value==1)
			   out.write("<td    align=\"center\">"+pageCrecData.getWord("Sale")+" </td>");
		   else
			   out.write("<td    align=\"center\">"+pageCrecData.getWord("No sale")+"</td>");
		}
	
	
	
	
	  if(phoneNumber.length() >0)
		{
		  out.write("<td    align=\"center\">");
		  if(r1.result_code == 1)
			 out.write(pageCrecData.getWord("Accepted"));
		  else if(r1.result_code == 2)
			 out.write(pageCrecData.getWord("Refused"));
		  else if(r1.result_code == 3)
			 out.write(pageCrecData.getWord("Not reached"));
		  else if(r1.result_code == 4)
			 out.write(pageCrecData.getWord("Wrong number"));
		  else if(r1.result_code == 9)
			 out.write(pageCrecData.getWord("Do not call"));
		  else if(r1.result_code == -1)
			 out.write(pageCrecData.getWord("Call back"));
		  else
			 out.write("-");
	
		  out.write("</td>");
		}
		
      out.write("\r\n");
      out.write("\t\t<td align=\"center\">\r\n");
      out.write("\t\t");
if(r1.is_encrypted != null) out.write(r1.is_encrypted.compareTo("1") == 0 ?"yes" : "No"); else out.write("No");
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td align=\"center\">\r\n");
      out.write("\t\t");
if(r1.is_encrypted != null && r1.is_encrypted.compareTo("1")==0) out.write(r1.enc_method); else out.write("-");
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td height=\"27\" align=\"center\">&nbsp;</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

    } //end for
   }catch(Exception e){
  	  out.write("<tr ><td colspan=10 align=\"center\" height=50><b>&nbsp; "+pageCrecData.getWord("Error while generating report")+".. </b></font></td></tr>");
   }
   
   
  }//end if
  else{
	  out.write("<tr><td colspan=12 align=\"center\" height=50><b>&nbsp; "+pageCrecData.getWord("No records available")+" </b></font></td></tr>");
  }

      out.write("\r\n");
      out.write("\t<!-- traverse the array -->\r\n");
      out.write("\t<!-- end of array traversal-->\r\n");
      out.write("</table>\r\n");

		int numpages;
		if(beanRecord.m_vAllDetails.size() > 0){
			int np=0,  tranche=0;
			out.write("<table><tr></tr><tr align ='center'>");
			if(firstload.compareTo("true")==0){
				int limitval = Integer.parseInt(limit);
				int numtotalrecords= (int)beanRecord.numberOfRecords;		
				numpages = numtotalrecords/limitval;
				pagenum = 1;
				
				if((numtotalrecords % limitval) > 0)
					numpages++;
				
				System.out.println("\nFIRSTLOAD, current page="+Integer.toString(pagenum)+" Number of pages = "+Integer.toString(numpages)) ;
				System.out.println("Phone: " + phoneNumber);
				
				if( numpages > 1 )
				{						
					for(np=1; np <= 10 && np <=numpages; np++)
						if(np != pagenum)
							out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+np+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000; cursor: hand ' >"+np+"</a></td>");
						else
							out.write("<td width='25'><a style='font-size:13px; font-family:Tahoma; color:#0000ff ' >"+np+"</a></td>");
														
					if(np < numpages)
						out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+(pagenum - (pagenum%10) + 10)+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000; cursor: hand ' > next </a></td>");
										
				}
			
			}
			else{
					numpages = Integer.parseInt(numpagesStr);
					System.out.println("\nNth LOAD, page="+Integer.toString(pagenum)+" Number of pages = "+Integer.toString(numpages)) ;
					System.out.println("Phone: " + phoneNumber);
					if(pagenum >= 10)			
						out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+((pagenum - (pagenum%10) - 10) <=0?1:(pagenum - (pagenum%10) - 10))+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000; cursor: hand  ' > Prev </a></td>");
				
					for(np=((pagenum - pagenum%10)==0?1:(pagenum - pagenum%10)); np <= (pagenum - (pagenum%10) + 10) && np <=numpages; np++){
						if(np != pagenum)
							out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+np+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000; cursor: hand  ' >"+np+"</a></td>");
						else
							out.write("<td width='25' ><a style='font-size:13px; font-family:Tahoma; color:#0000ff ' >"+np+"</a></td>");
					}
					if(np < numpages)
						out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+(pagenum - (pagenum%10) + 10)+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000 ' > next </a></td>");
					
			}	 
			out.write("</tr><table>");
		}
	
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("<iframe src=\"\" width=\"0\" height=\"0\" name=\"h_file_reader\"\r\n");
      out.write("\tid=\"h_file_reader\"></iframe>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
 pageCrecData.closeConnection(); 
      out.write('\r');
      out.write('\n');
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
