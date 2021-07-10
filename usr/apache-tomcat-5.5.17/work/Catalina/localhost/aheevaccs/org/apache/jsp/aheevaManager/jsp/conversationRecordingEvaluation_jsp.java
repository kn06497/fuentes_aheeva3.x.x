package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import aheevaManager.java.*;
import aheevaManager.ressources.*;

public final class conversationRecordingEvaluation_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);

beanManagerData pageData = new beanManagerData();

pageData.openConnection();

if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
String currentUserip	=  request.getRemoteAddr();
//get the data from the calling page
String recid 	= (request.getParameter("recid")==null)?"":request.getParameter("recid");
String tracknum = (request.getParameter("tracknum")==null)?"":request.getParameter("tracknum");
String agtid 	= (request.getParameter("agtid")==null)?"":request.getParameter("agtid");
String grpid 	= (request.getParameter("grpid")==null)?"":request.getParameter("grpid");
String tenantid = (request.getParameter("tenant")==null)?"":request.getParameter("tenant");
String tomcaturl = (request.getParameter("url")==null)?"":request.getParameter("url");
String tomcatpath = (request.getParameter("path")==null)?"":request.getParameter("path");

String view = (request.getParameter("view")==null)?"0":request.getParameter("view");


//if load after submit
String actval = (request.getParameter("actval")==null)?"":request.getParameter("actval");


if (actval.compareTo("1")==0)
{
	String str_list="";
	
	String grpnbr = (request.getParameter("grpnbr")==null)?"0":request.getParameter("grpnbr");
	String comments = (request.getParameter("comments")==null)?"":request.getParameter("comments");
	String frmdbid = (request.getParameter("frmdbid")==null)?"":request.getParameter("frmdbid");
	String evaldbid= (request.getParameter("evaldbid")==null)?"":request.getParameter("evaldbid");
	
	for (int i = 0 ; i < Integer.parseInt(grpnbr) ; i++)
	{
		String grpevaldbid	= (request.getParameter("evaldet"+i)==null)?"":request.getParameter("evaldet"+i);
		String grpdbid	= (request.getParameter("grpdbid"+i)==null)?"":request.getParameter("grpdbid"+i);
		String grpcomment = (request.getParameter("comm"+i)==null)?"":request.getParameter("comm"+i);
		String grpscore = (request.getParameter("grpscore"+i)==null)?"":request.getParameter("grpscore"+i);
		String grpmaxscore = (request.getParameter("grpmaxscore"+i)==null)?"":request.getParameter("grpmaxscore"+i);
		
		if (str_list!=""){str_list=str_list+"^";}
		str_list = str_list+grpevaldbid+"#"+grpdbid+"###"+grpcomment+"#"+grpscore+"#"+grpmaxscore+"#0";
		
		String questnbr = (request.getParameter("grpquestnbr"+i)==null)?"0":request.getParameter("grpquestnbr"+i);
		
		for (int j=0; j <Integer.parseInt(questnbr);j++)
		{
			String subevaldbid	= (request.getParameter("evaldet"+i+"_"+j)==null)?"":request.getParameter("evaldet"+i+"_"+j);
			String subcomment   = (request.getParameter("comm"+i+"_"+j)==null)?"":request.getParameter("comm"+i+"_"+j);
			
			String subanstype   = (request.getParameter("anstype"+i+"_"+j)==null)?"0":request.getParameter("anstype"+i+"_"+j);
			
			String subans = (request.getParameter("ans"+i+"_"+j)==null)?"":request.getParameter("ans"+i+"_"+j);
			
			String subansid = "";
			String subansscore = "";
			
			switch (Integer.parseInt(subanstype))
			{
				case 1:
				case 2:
					if (subans.compareTo("")!=0)
					{
						String [] arr_subans = subans.split("#");
						
						if (arr_subans.length==2)
						{
							subansid 	= arr_subans[0];
							subansscore	= arr_subans[1];
						}
					}
				break;	
				case 3:
				subansscore = 	subans;
				break;
					
			}
			

			
			String subquestdbid	= (request.getParameter("quest"+i+"_"+j)==null)?"":request.getParameter("quest"+i+"_"+j);
			String subfhide	= (request.getParameter("fhide"+i+"_"+j)==null)?"0":request.getParameter("fhide"+i+"_"+j);
			
			if (str_list!=""){str_list=str_list+"^";}
			str_list = str_list+subevaldbid+"#"+grpdbid+"#"+subquestdbid+"#"+subansid+"#"+subcomment+"#"+subansscore+"##0";
		}
		
		
	}
	
	
	
	//initialise a RecordingEvaluation for insert/update
	RecordingEvaluation saveEval = new RecordingEvaluation(recid , evaldbid , frmdbid , comments , currentUserip , currentUserDbid);
	int ret = saveEval.insertUpdateEvaluation(str_list);
	
	if (ret ==1)//insert evaluation
	{
		
      out.write("\r\n");
      out.write("\t\t<script>window.opener.location.reload();</script>\r\n");
      out.write("\t\t");

	}
	
	saveEval = null;
}

//end if load after submit





//create instance of recording evaluation
RecordingEvaluation recEval = new RecordingEvaluation(recid,tracknum,agtid,grpid,tenantid,currentUserip , currentUserDbid); 



String form_name = recEval.getFormName();
String form_desc = recEval.getFormDesc();

Vector<EvaluationDetails> vec_evdet = recEval.getEvaluationdetails();


      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>");
      out.print(pageData.getWord("Evaluation form"));
      out.write("</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<meta http-equiv=\"Content-Language\" content=\"en-us\">\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\r\n");
      out.write("<LINK href=\"../Resources_pages/livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"../Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../Resources_pages/xc2_default.css\" type=\"text/css\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
      out.write("\t\r\n");
      out.write("\tpadding:\t\t10px;\r\n");
      out.write("\theight:\t\t\t99%  ;\r\n");
      out.write("\twidth:\t\t\t99%\t;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("} \r\n");
      out.write("\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write(" \r\n");
      out.write("body {\r\n");
      out.write("\tmargin:\t\t10px;\r\n");
      out.write("\twidth:\t\tauto;\r\n");
      out.write("\theight:\t\tauto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");


if (view.compareTo("0")==0 && form_name.compareTo("")!=0) 
{

      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("var userDbid = ");
      out.print(currentUserDbid);
      out.write(";\r\n");
      out.write(" \r\n");
      out.write("function roundNumber(rnum, rlength) { // Arguments: number to round, number of decimal places\r\n");
      out.write("  var newnumber = Math.round(rnum*Math.pow(10,rlength))/Math.pow(10,rlength);\r\n");
      out.write("  return  newnumber; // Output the result to the form field (change for your purposes)\r\n");
      out.write("}\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write("function doSubmit()\r\n");
      out.write("{ \t\r\n");
      out.write("\tfor (var i=0; i< parseInt(document.evaluation.grpnbr.value) ; i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\teval('document.evaluation.grpscore'+i).style.visibility = 'hidden';\r\n");
      out.write("\t\teval('document.evaluation.grpmaxscore'+i).style.visibility = 'hidden';\r\n");
      out.write("\t\teval('document.evaluation.grpscore'+i).disabled = false;\r\n");
      out.write("\t\teval('document.evaluation.grpmaxscore'+i).disabled = false;\r\n");
      out.write("\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tdocument.evaluation.action=\"conversationRecordingEvaluation.jsp?recid=");
      out.print(recid);
      out.write("&tracknum=");
      out.print(tracknum);
      out.write("&agtid=");
      out.print(agtid);
      out.write("&grpid=");
      out.print(grpid);
      out.write("&tenantid=");
      out.print(tenantid);
      out.write("&actval=1\"\r\n");
      out.write("\tdocument.evaluation.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function doClose()\r\n");
      out.write("{ \t\r\n");
      out.write("\tself.close();\r\n");
      out.write("}\r\n");
      out.write("function manageSaveButton()\r\n");
      out.write("{\r\n");
      out.write("\tf_answered = 1;\r\n");
      out.write("\tfor (var i=0; i< parseInt(document.evaluation.grpnbr.value) ; i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif (f_answered == 0)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif (parseInt(eval('document.evaluation.grpquestnbr'+i).value)>0)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tfor (var j=0; j< eval('document.evaluation.grpquestnbr'+i).value ; j++)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tif (eval('document.evaluation.fhide'+i+'_'+j).value == 0)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\tf_quest_answered = 0;\r\n");
      out.write("\t\t\t\t\tans_type = \tparseInt(eval('document.evaluation.anstype'+i+'_'+j).value);\t \r\n");
      out.write("\t\t\t\t\tswitch (ans_type)\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\tcase 1://radio\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\tfor (var m=0;m<eval('document.evaluation.ans'+i+'_'+j).length;m++)\r\n");
      out.write("\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tif (eval('document.evaluation.ans'+i+'_'+j)[m].checked)\r\n");
      out.write("\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\tf_quest_answered = 1;\r\n");
      out.write("\t\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t\t\t}\t\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t\tcase 2://combo\r\n");
      out.write("\t\t\t\t\t\tif (eval('document.evaluation.ans'+i+'_'+j).value!=\"0#0\")\r\n");
      out.write("\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\tf_quest_answered =1; \t\r\n");
      out.write("\t\t\t\t\t\t}\t\r\n");
      out.write("\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t\tcase 3://input text field\r\n");
      out.write("\t\t\t\t\t\tif (eval('document.evaluation.ans'+i+'_'+j).value!=\"\")\r\n");
      out.write("\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\tf_quest_answered =1; \t\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tif (f_quest_answered ==0)\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\tf_answered = 0;\r\n");
      out.write("\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tif (f_answered == 0)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.evaluation.bt_save.disabled=true;\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.evaluation.bt_save.disabled=false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function submitInfo()\r\n");
      out.write("\t{\r\n");
      out.write("\t\t//alert(record+','+submitInfo.arguments[1]+','+submitInfo.arguments[2]+','+submitInfo.arguments[3]+','+submitInfo.arguments[4]+','+submitInfo.arguments[5])\r\n");
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
      out.write("\t\tvar video_filename = submitInfo.arguments[11];\t\r\n");
      out.write("\t\tvar audio_time = submitInfo.arguments[12];\t\r\n");
      out.write("\t\tvar video_time = submitInfo.arguments[13];\t\r\n");
      out.write("\t\tvar servPath = window.opener.top.comm.myApplet.servletPath;\r\n");
      out.write("\t\tvar proto =  window.opener.top.comm.myApplet.getProto();\r\n");
      out.write("\t\tvar encparams='' ;\r\n");
      out.write("\t\tif(encservid == '' || encservid.length < 1)\r\n");
      out.write("\t\t{\t//Get parameters from the encryption server associated with the agent group \r\n");
      out.write("\t\t\tencparams = window.opener.top.comm.myApplet.getEncryptionServerParamsForAgent(grp);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tencparams = window.opener.top.comm.myApplet.getEncryptionServerParamsForServer(encservid);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tvar jsEncparams = encparams.split(\",\");\r\n");
      out.write("\t\tvar encServerHost = \"\";\r\n");
      out.write("\t\tvar encServerPort = \"\";\r\n");
      out.write("\t\t/*if(jsEncparams.length > 1)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tencServerHost = jsEncparams[1];\r\n");
      out.write("\t\t\tencServerPort = jsEncparams[2];\r\n");
      out.write("\t\t\tservPath = jsEncparams[3];\r\n");
      out.write("\t\t}*/\r\n");
      out.write("\t\tvar nextLoc;\r\n");
      out.write("\t\tif (video_filename == undefined) {\r\n");
      out.write("\t\t\tif (encryptval == \"0\") {\r\n");
      out.write("\t\t\t\tnextLoc =\"./wavFileGenerator.jsp?embeded=1&record_id=\";\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\tnextLoc =\"./decrypt.jsp?record_id=\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t} else {\r\n");
      out.write("\t\t\tnextLoc =\"./AVviewer.jsp?record_id=\";\r\n");
      out.write("\t\t}\r\n");
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
      out.write("\t\t\r\n");
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
      out.print(tenantid);
      out.write("\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif( encryptval == '1' && proto != 'https' && proto != 'HTTPS')\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(");
      out.print(pageData.getWord("To listen to an encrypted record, please login via https !"));
      out.write(");\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t//alert('location = '+nextLoc)\r\n");
      out.write("\t\t//javascript:window.open(nextLoc,'formWindow','scrollbars=yes,width=100,height=50');//,'scrollbars=yes,width=600,height=400'\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif (video_filename == undefined)\r\n");
      out.write("\t\t\tdocument.getElementById(\"h_file_reader\").src = nextLoc;\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t\twindow.location.href = nextLoc;\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t//Now send message to cti to inform that this user has listened to the record\r\n");
      out.write("\t\t\r\n");
      out.write("\t\ttry {\r\n");
      out.write("\t\t\tvar mainAppletObj;\r\n");
      out.write("\t\r\n");
      out.write("\t\t\tmainAppletObj = window.opener.top.comm.myApplet;\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(mainAppletObj )\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tvar sret = mainAppletObj.sendRecListenMessageToCti(userDbid, record, file);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tcatch (exp){}\r\n");
      out.write("\t\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("function calculateScore()\r\n");
      out.write("{\r\n");
      out.write("\t\r\n");
      out.write("\t//fill the group that has childquestions  max socre\r\n");
      out.write("\tfor (var i= 0; i < parseInt(document.evaluation.grpnbr.value) ; i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tfillMaxScoreGroup(i);\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfillMaxScoreParentGroup();\r\n");
      out.write("\t\r\n");
      out.write("\t//fill the group score that has children\r\n");
      out.write("\tfor (var i= 0; i < parseInt(document.evaluation.grpnbr.value) ; i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tfillScoreGroup(i);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfillScoreParentGroup();\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function validateValue(v1,v2)\r\n");
      out.write("{\r\n");
      out.write("\tvar val = eval('document.evaluation.ans'+v1+'_'+v2).value;\r\n");
      out.write("\t\r\n");
      out.write("\tif (val != \"\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar f_test = IsInteger(val);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif (!f_test) {\r\n");
      out.write("\t\t\talert(\"");
      out.print(pageData.getWord("Invalid number"));
      out.write("\");\r\n");
      out.write("\t\t\teval('document.evaluation.ans'+v1+'_'+v2).focus();\r\n");
      out.write("\t\t\teval('document.evaluation.ans'+v1+'_'+v2).value=\"\";\t\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tval = roundNumber(parseFloat(val),2);\r\n");
      out.write("\t\tif (val >  parseFloat(eval('document.evaluation.ansmaxval'+v1+'_'+v2).value) || val <  parseFloat(eval('document.evaluation.ansminval'+v1+'_'+v2).value) )\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\teval('document.evaluation.ans'+v1+'_'+v2).focus();\r\n");
      out.write("\t\teval('document.evaluation.ans'+v1+'_'+v2).value = \"\";\r\n");
      out.write("\t\talert(\"");
      out.print(pageData.getWord("Value should be between"));
      out.write(" \"+eval('document.evaluation.ansminval'+v1+'_'+v2).value+\"  \"+eval('document.evaluation.ansmaxval'+v1+'_'+v2).value );\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t} \r\n");
      out.write("\tvalidateCondition(v1,0,0);\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function validateCondition(v1,f_without_4,f_only_4)\r\n");
      out.write("{\r\n");
      out.write("   \r\n");
      out.write("   if (f_without_4 !=0 || f_only_4 !=1)\r\n");
      out.write("   {\r\n");
      out.write("   \t\tfillScoreGroup(v1);\r\n");
      out.write("   \t\tfillMaxScoreGroup(v1);\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   \r\n");
      out.write("   var arr = eval('tab_cond'+v1);\r\n");
      out.write("   var arr_det = eval('tab_cond_det'+v1);\r\n");
      out.write("   \r\n");
      out.write("   for (var i=0 ; i < arr.length ; i++)\r\n");
      out.write("   {\r\n");
      out.write("   \t\tswitch (parseInt(arr[i][1])) \r\n");
      out.write("   \t\t{\r\n");
      out.write("\t   \t\tcase 1:// cond not applicable\r\n");
      out.write("\t   \t\t\tif (f_only_4 ==0)\r\n");
      out.write("\t   \t\t\t{\r\n");
      out.write("\t\t   \t\t\tfor (var j=0;j<arr_det.length;j++)\r\n");
      out.write("\t\t   \t\t\t{\r\n");
      out.write("\t\t   \t\t\t\tif (arr[i][0] == arr_det[j][0])\r\n");
      out.write("\t\t   \t\t\t\t{\r\n");
      out.write("\t\t   \t\t\t\t\tfor (var k=0; k<parseInt(eval('document.evaluation.grpquestnbr'+v1).value);k++)\r\n");
      out.write("\t\t   \t\t\t\t\t{\r\n");
      out.write("\t\t   \t\t\t\t\t\tif (arr_det[j][1] == eval('document.evaluation.quest'+v1+'_'+k).value)\r\n");
      out.write("\t\t   \t\t\t\t\t\t{\r\n");
      out.write("\t\t   \t\t\t\t\t\t\t\r\n");
      out.write("\t\t   \t\t\t\t\t\t\tans_type = \tparseInt(eval('document.evaluation.anstype'+v1+'_'+k).value);\t \r\n");
      out.write("\t\t\t\t\t\t\t\t\tansid = \"0\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\tswitch (ans_type)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tcase 1://radio\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfor (var m=0;m<eval('document.evaluation.ans'+v1+'_'+k).length;m++)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tif (eval('document.evaluation.ans'+v1+'_'+k)[m].checked)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tarrans = (eval('document.evaluation.ans'+v1+'_'+k)[m].value).split(\"#\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tansid = arrans[0];\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t}\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tcase 2://combo\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tansscore = (eval('document.evaluation.ans'+v1+'_'+k).value).split(\"#\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tansid = ansscore[0];\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\tif (ansid == arr_det[j][2])\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tif (eval('document.evaluation.fhide'+v1+'_'+k).value ==0)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\teval('document.evaluation.grpmaxscore'+v1).value = parseFloat(eval('document.evaluation.grpmaxscore'+v1).value) - parseFloat(eval('document.evaluation.ansmax'+v1+'_'+k).value);\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t   \t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t   \t\t\t\t\t\t}\r\n");
      out.write("\t\t   \t\t\t\t\t}\r\n");
      out.write("\t\t   \t\t\t\t}\r\n");
      out.write("\t\t   \t\t\t}\r\n");
      out.write("\t\t   \t\t}\r\n");
      out.write("   \t\t\tbreak;\r\n");
      out.write("   \t\t\tcase 2: //cond on total % of the group\r\n");
      out.write("   \t\t\tif (f_only_4==0)\r\n");
      out.write("   \t\t\t{\r\n");
      out.write("\t   \t\t\tamt = roundNumber(parseFloat(eval('document.evaluation.grpmaxscore'+v1).value)*parseFloat(arr[i][3])/100,2);\r\n");
      out.write("\t   \t\t\tamt = parseFloat(amt);\r\n");
      out.write("\t   \t\t\tvar operator = arr[i][2];\r\n");
      out.write("\t   \t\t\t\r\n");
      out.write("\t   \t\t\tif (operator==\"=\") {operator=\"==\";}\r\n");
      out.write("\t   \t\t\tif (operator != \"\" && amt != \"\") {\r\n");
      out.write("\t   \t\t\t\tstr = eval('document.evaluation.grpscore'+v1).value +\" \"+operator+\" \" + amt ;\r\n");
      out.write("\t\t\t\t\tif (eval(str))\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\teval('document.evaluation.grpscore'+v1).value = roundNumber(parseFloat(parseFloat(eval('document.evaluation.grpscore'+v1).value)*parseFloat(arr[i][4])/100),2);\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t   \t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("   \t\t\tbreak;\r\n");
      out.write("   \t\t\tcase 3: //if a couple of ans and quest are selected\r\n");
      out.write("   \t\t\tif (f_only_4 ==0)\r\n");
      out.write("   \t\t\t{\r\n");
      out.write("\t   \t\t\tfound = 0;\r\n");
      out.write("\t   \t\t\tfor (var j=0;j<arr_det.length;j++)\r\n");
      out.write("\t   \t\t\t{\r\n");
      out.write("\t   \t\t\t\tif (arr[i][0] == arr_det[j][0])\r\n");
      out.write("\t   \t\t\t\t{\r\n");
      out.write("\t   \t\t\t\t\tfound = 0;\r\n");
      out.write("\t   \t\t\t\t\tfor (var k=0; k<parseInt(eval('document.evaluation.grpquestnbr'+v1).value);k++)\r\n");
      out.write("\t   \t\t\t\t\t{\r\n");
      out.write("\t\r\n");
      out.write("\t   \t\t\t\t\t\tif (arr_det[j][1] == eval('document.evaluation.quest'+v1+'_'+k).value)\r\n");
      out.write("\t   \t\t\t\t\t\t{\r\n");
      out.write("\t   \t\t\t\t\t\t\t\r\n");
      out.write("\t   \t\t\t\t\t\t\tans_type = \tparseInt(eval('document.evaluation.anstype'+v1+'_'+k).value);\t \r\n");
      out.write("\t\t\t\t\t\t\t\tansid = \"0\";\r\n");
      out.write("\t\t\t\t\t\t\t\tswitch (ans_type)\r\n");
      out.write("\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\tcase 1://radio\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\tfor (m=0;m<eval('document.evaluation.ans'+v1+'_'+k).length;m++)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tif (eval('document.evaluation.ans'+v1+'_'+k)[m].checked)\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tarrans = (eval('document.evaluation.ans'+v1+'_'+k)[m].value).split(\"#\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tansid = arrans[0];\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t\t\t\t\tcase 2://combo\r\n");
      out.write("\t\t\t\t\t\t\t\t\tansscore = (eval('document.evaluation.ans'+v1+'_'+k).value).split(\"#\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\tansid = ansscore[0];\r\n");
      out.write("\t\t\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\tif (ansid == arr_det[j][2])\r\n");
      out.write("\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\tfound =1; \r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t   \t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t   \t\t\t\t\t\t}\r\n");
      out.write("\t   \t\t\t\t\t\t\r\n");
      out.write("\t   \t\t\t\t\t}\r\n");
      out.write("\t   \t\t\t\t\tif (found ==0)\r\n");
      out.write("\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\tbreak;\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t   \t\t\t\t\t\r\n");
      out.write("\t   \t\t\t\t}\r\n");
      out.write("\t   \t\t\t}\r\n");
      out.write("\t   \t\t\t\r\n");
      out.write("\t   \t\t\tif (found ==1)\r\n");
      out.write("\t   \t\t\t{\r\n");
      out.write("\t   \t\t\t\teval('document.evaluation.grpscore'+v1).value = roundNumber(parseFloat(parseFloat(eval('document.evaluation.grpscore'+v1).value)*parseFloat(arr[i][4])/100),2);\t  \r\n");
      out.write("\t   \t\t\t}\r\n");
      out.write("\t   \t\t}\r\n");
      out.write("   \t\t\tbreak;\r\n");
      out.write("   \t\t\tcase 4://show hide answers\r\n");
      out.write("   \t\t\tif (f_without_4 == 0)\r\n");
      out.write("   \t\t\t{\r\n");
      out.write("\t   \t\t\tf_hide = 1;\r\n");
      out.write("\t   \t\t\tquest_id = 0;\r\n");
      out.write("\t   \t\t\tvar quest_index = -1;\r\n");
      out.write("\t   \t\t\tfor (var k=0; k<parseInt(eval('document.evaluation.grpquestnbr'+v1).value);k++)\r\n");
      out.write("\t   \t\t\t{\r\n");
      out.write("\t\t\t\t\tif (arr[i][5] == eval('document.evaluation.quest'+v1+'_'+k).value)\r\n");
      out.write("\t   \t\t\t\t{\r\n");
      out.write("\t   \t\t\t\t\tquest_index = k;\r\n");
      out.write("\t   \t\t\t\t\tans_type = \tparseInt(eval('document.evaluation.anstype'+v1+'_'+k).value);\t \r\n");
      out.write("\t\t\t\t\t\tansid = \"0\";\r\n");
      out.write("\t\t\t\t\t\tswitch (ans_type)\r\n");
      out.write("\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\tcase 1://radio\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\tfor (var m=0;m<eval('document.evaluation.ans'+v1+'_'+k).length;m++)\r\n");
      out.write("\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\tif (eval('document.evaluation.ans'+v1+'_'+k)[m].checked)\r\n");
      out.write("\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\tarrans = (eval('document.evaluation.ans'+v1+'_'+k)[m].value).split(\"#\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\tansid = arrans[0];\r\n");
      out.write("\t\t\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t\t\t\t}\t\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t\t\tcase 2://combo\r\n");
      out.write("\t\t\t\t\t\t\tansscore = (eval('document.evaluation.ans'+v1+'_'+k).value).split(\"#\");\r\n");
      out.write("\t\t\t\t\t\t\tansid = ansscore[0];\r\n");
      out.write("\t\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\tif (ansid == arr[i][6])\r\n");
      out.write("\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\tf_hide =0; \t\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\tbreak;\t\r\n");
      out.write("\t   \t\t\t\t}\r\n");
      out.write("\t   \t\t\t}\t\r\n");
      out.write("\t   \t\t\tif (quest_index > -1)\r\n");
      out.write("\t   \t\t\t{\r\n");
      out.write("\t   \t\t\tif (f_hide==0)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\teval('document.evaluation.fhide'+v1+'_'+quest_index).value = 1;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\telse\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\teval('document.evaluation.fhide'+v1+'_'+quest_index).value = 0;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t   \t\t\t\r\n");
      out.write("\t   \t\t\t\r\n");
      out.write("\t   \t\t\tfor (var j=0;j<arr_det.length;j++)\r\n");
      out.write("\t   \t\t\t{\r\n");
      out.write("\t   \t\t\t\tif (arr[i][0] == arr_det[j][0])\r\n");
      out.write("\t   \t\t\t\t{\r\n");
      out.write("\t   \t\t\t\t\tfor (var k=0; k<parseInt(eval('document.evaluation.grpquestnbr'+v1).value);k++)\r\n");
      out.write("\t   \t\t\t\t\t{\r\n");
      out.write("\t   \t\t\t\t\t\tif (arr_det[j][1] == eval('document.evaluation.quest'+v1+'_'+k).value)\r\n");
      out.write("\t   \t\t\t\t\t\t{\r\n");
      out.write("\t\t   \t\t\t\t\t\tif (f_hide==0)\r\n");
      out.write("\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\teval('document.evaluation.fhide'+v1+'_'+k).value = 0;\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdocument.getElementById(\"tr\"+v1+'_'+k).style.display='';\r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\telse\r\n");
      out.write("\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\teval('document.evaluation.fhide'+v1+'_'+k).value = 1;\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdocument.getElementById(\"tr\"+v1+'_'+k).style.display='none';\r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t \t\t\t\t\t}\r\n");
      out.write("\t \t\t\t\t}\r\n");
      out.write("\t   \t\t\t}\r\n");
      out.write("\t   \t\t\tvalidateCondition(v1,1,0);\r\n");
      out.write("\t   \t\t}\r\n");
      out.write("   \t\t\tbreak;\r\n");
      out.write("   \t\t\t\r\n");
      out.write("   \t\t}\t\t\r\n");
      out.write("   }\r\n");
      out.write("   if (f_without_4 ==0)\r\n");
      out.write("   {\r\n");
      out.write("   \t\tfillMaxScoreParentGroup();\r\n");
      out.write("   \t\tfillScoreParentGroup();\r\n");
      out.write("   } \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function fillScoreGroup(i)\r\n");
      out.write("{\r\n");
      out.write("\tnbr_quest = parseInt(eval('document.evaluation.grpquestnbr'+i).value);\r\n");
      out.write("\t\r\n");
      out.write("\tscore = 0.0;\r\n");
      out.write("\r\n");
      out.write("\tfor (j=0;j<nbr_quest;j++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tansscore = 0.0;\r\n");
      out.write("\t\tans_type = \tparseInt(eval('document.evaluation.anstype'+i+'_'+j).value);\t \r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif (eval('document.evaluation.fhide'+i+'_'+j).value ==0)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tswitch (ans_type)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tcase 1://radio\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\tfor (var k=0;k<eval('document.evaluation.ans'+i+'_'+j).length;k++)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tif (eval('document.evaluation.ans'+i+'_'+j)[k].checked)\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\tansstring = eval('document.evaluation.ans'+i+'_'+j)[k].value;\r\n");
      out.write("\t\t\t\t\t\tansstringarr =   ansstring.split(\"#\");\r\n");
      out.write("\t\t\t\t\t\tansscore     = parseInt(ansstringarr[1]);\r\n");
      out.write("\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\tcase 2://combo\r\n");
      out.write("\t\t\t\tansstring = eval('document.evaluation.ans'+i+'_'+j).value;\r\n");
      out.write("\t\t\t\tansstringarr =   ansstring.split(\"#\");\r\n");
      out.write("\t\t\t\tansscore     = parseFloat(ansstringarr[1]);\r\n");
      out.write("\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\tcase 3://text input\r\n");
      out.write("\t\t\t\tif (eval('document.evaluation.ans'+i+'_'+j).value ==\"\")\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\tansscore = parseFloat(0);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\telse\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\tansscore = parseFloat(eval('document.evaluation.ans'+i+'_'+j).value);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tbreak;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}\t\r\n");
      out.write("\t\tscore = score +ansscore ;\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\teval('document.evaluation.grpscore'+i).value = score;\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fillMaxScoreGroup(ii)\r\n");
      out.write("{\r\n");
      out.write("\tnbr_quest = parseInt(eval('document.evaluation.grpquestnbr'+ii).value);\r\n");
      out.write("\r\n");
      out.write("\tmax_score = 0.0;\r\n");
      out.write("\tfor (var jj=0;jj<nbr_quest;jj++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\t\t\tansmax = 0.0;\r\n");
      out.write("\t\t\t\tif (eval('document.evaluation.fhide'+ii+'_'+jj).value ==0)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\tansmax = parseFloat(eval('document.evaluation.ansmax'+ii+'_'+jj).value);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tmax_score = max_score +ansmax ;\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\teval('document.evaluation.grpmaxscore'+ii).value = max_score;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fillMaxScoreParentGroup()\r\n");
      out.write("{\r\n");
      out.write("\t\r\n");
      out.write("\tfor (var i= parseInt(document.evaluation.grpnbr.value)  - 1; i >=0 ; i--)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tcurrent_group_dbid = eval('document.evaluation.grpdbid'+i).value;\r\n");
      out.write("\t\tf_first = 0;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfor (var j=i+1 ; j < parseInt(document.evaluation.grpnbr.value); j++)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tmain_group_dbid = eval('document.evaluation.grpmaindbid'+j).value;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif (main_group_dbid==current_group_dbid)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tif (f_first ==0)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\teval('document.evaluation.grpmaxscore'+i).value = 0.0;\r\n");
      out.write("\t\t\t\t\tf_first=1;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\teval('document.evaluation.grpmaxscore'+i).value = parseFloat(eval('document.evaluation.grpmaxscore'+i).value)+ parseFloat(eval('document.evaluation.grpmaxscore'+j).value);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t} \t\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fillScoreParentGroup()\r\n");
      out.write("{\r\n");
      out.write("\tfor (var i=  parseInt(document.evaluation.grpnbr.value) -1; i>=0; i--)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tcurrent_group_dbid = eval('document.evaluation.grpdbid'+i).value;\r\n");
      out.write("\t\tf_first = 0;\r\n");
      out.write("\t\tfor (var j=i+1 ; j < parseInt(document.evaluation.grpnbr.value); j++)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tmain_group_dbid = eval('document.evaluation.grpmaindbid'+j).value;\r\n");
      out.write("\t\t\tif (main_group_dbid==current_group_dbid)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tif (f_first ==0)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\teval('document.evaluation.grpscore'+i).value = 0;\r\n");
      out.write("\t\t\t\t\tf_first=1;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\teval('document.evaluation.grpscore'+i).value = parseFloat(eval('document.evaluation.grpscore'+i).value)+ parseFloat(eval('document.evaluation.grpscore'+j).value);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t} \t\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function validateConditionAllGroup()\r\n");
      out.write("{\r\n");
      out.write("\t\r\n");
      out.write("\t//fill the group that has childquestions  max socre\r\n");
      out.write("\tfor (var tt= 0; tt < parseInt(document.evaluation.grpnbr.value) ; tt++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif (parseInt(eval('document.evaluation.grpquestnbr'+tt).value) >0)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tvalidateCondition(tt,0,1);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");

} //end if view = 0
else
{
	
      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\tfunction showDiv(str , pos_x,pos_y) {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tdocument.getElementById(\"divalt\").style.left = pos_x + document.body.scrollLeft - 5;\r\n");
      out.write("\t\tdocument.getElementById(\"divalt\").style.top = pos_y + document.body.scrollTop - 5;\r\n");
      out.write("\t\tdocument.getElementById(\"divalt\").style.display = \"block\";\r\n");
      out.write("\t\tdocument.getElementById(\"divalt\").innerHTML = str;\r\n");
      out.write("\t} \r\n");
      out.write("\tfunction hideDiv() {\r\n");
      out.write("\t\tdocument.getElementById(\"divalt\").style.display = \"none\";\r\n");
      out.write("\t} \r\n");
      out.write("\t</script>\r\n");
      out.write("\t");
 
}

      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"toppagebody\" >\r\n");
      out.write("\r\n");
      out.write("<form name=\"evaluation\"  method=\"post\">\r\n");
      out.write("\r\n");

//no evaluation form
if (form_name.compareTo("")==0) 
{

      out.write("\r\n");
      out.write("<table width=\"90%\" cellspacing=\"0\" cellpading=\"0\">\r\n");
      out.write("<tr><td align=\"center\"><strong>");
      out.print(pageData.getWord("No evaluation form"));
      out.write("</strong></td></tr>\r\n");
      out.write("</table>\r\n");

}
else
{
if (view.compareTo("0")==0)
{	

      out.write("\r\n");
      out.write("<div class=\"dynamic-tab-pane-control\" width=\"90%\">\r\n");
      out.write("    <div class=\"tab-page\" id=\"general\"> \r\n");
      out.write("      <fieldset>\r\n");
      out.write("      \t<legend title=\"");
      out.print(form_desc);
      out.write('"');
      out.write('>');
      out.write(' ');
      out.print(form_name);
      out.write("</legend>\r\n");
      out.write("      \t\t<table height=\"5\"><tr><td></td></tr></table>\r\n");
      out.write("      \t\t<table width=\"100%\" cellspacing=\"2\"  cellpadding=\"3\" >\r\n");
      out.write("\t\t\t\t<tr class=\"question_border2\" >\r\n");
      out.write("\t\t\t\t<td class=\"reportsLevel2\">");
      out.print(pageData.getWord("Agent name"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print( recEval.getAgentName() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"reportsLevel2\">");
      out.print(pageData.getWord("Call time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(recEval.getCalltime() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t");
if(!recEval.getEvalId().equals("")) {
      out.write("\r\n");
      out.write("\t\t\t\t<td class=\"reportsLevel2\">");
      out.print(pageData.getWord("Evaluation time"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(recEval.getDate() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"reportsLevel2\">");
      out.print(pageData.getWord("Supervisor name"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(recEval.getUserName() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t");

				}
      out.write("\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<table height=\"5\"><tr><td></td></tr></table>\r\n");
      out.write("\r\n");
      out.write("      \t\t<table ><tr><td class=\"reportsLevel1\">\r\n");
      out.write("      \t\t<iframe src=\"\"  name=\"h_file_reader\" id=\"h_file_reader\" width=\"320\" height=\"45\" frameborder=\"0\" scrolling=\"no\"></iframe>\r\n");
      out.write("      \t\t</td></tr></table>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<table cellspacing=\"1\" cellpadding=\"0\" width=\"100%\" >\r\n");
      out.write("\t\t\t\t");

				String quest_dbid	= "";
				if (vec_evdet !=null)
				{
					for (int i = 0 ; i <vec_evdet.size();i++)    		
					{
						EvaluationDetails  evdet= vec_evdet.elementAt(i);
						String classname="reportsLevel"+((evdet.getLevel()>2)?2:evdet.getLevel());
						String questionborderclassname ="question_border"+((evdet.getLevel()>2)?2:evdet.getLevel());
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr >\r\n");
      out.write("\t\t\t    \t\t\t\t<td width=\"100%\">\r\n");
      out.write("\t\t\t    \t\t\t\t\t<table cellpading=\"2\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n");
      out.write("\t\t\t    \t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t<td class=\"");
      out.print(classname);
      out.write("\" title=\"");
      out.print(evdet.getQuestgroupdesc() );
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t");
      out.print(evdet.getQuestgroupName() );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t&nbsp;<input type=\"text\" name=\"grpscore");
      out.print(i);
      out.write("\" value=\"");
      out.print(evdet.getEvalscore());
      out.write("\"  size=4  disabled>\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t<input type=\"text\" name=\"grpmaxscore");
      out.print(i);
      out.write("\" value=\"");
      out.print(evdet.getMaxevalscore());
      out.write("\"  size=4 disabled>\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t");

						    				if (evdet.getAddcomment()==1)
						    				{
						    					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t\t<td class=\"");
      out.print(classname);
      out.write("\" align=\"right\">\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t\t\t<textarea cols=\"");
      out.print((evdet.getCommcolnbr()==0)?20:(evdet.getCommcolnbr()+2));
      out.write("\" rows=\"");
      out.print((evdet.getCommrownbr()==0)?2:evdet.getCommrownbr());
      out.write("\" name=\"comm");
      out.print(i);
      out.write("\" onChange=\"manageSaveButton()\" onKeyDown=\"limitText(this,500);\" onKeyUp=\"limitText(this,500);\">");
      out.print(evdet.getEvalcomment());
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t        </td>\r\n");
      out.write("\t\t\t\t\t\t    \t\t\t\t\t");

						    				}
						    				
      out.write("\r\n");
      out.write("\t\t\t\t    \t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t    \t\t\t\t</table>\r\n");
      out.write("\t\t\t\t    \t\t\t</td>\t\r\n");
      out.write("\t\t\t    \t\t</tr>\r\n");
      out.write("\t\t\t    \t\t<input type=\"hidden\" name=\"grpquestnbr");
      out.print(i);
      out.write("\" value=\"");
      out.print(evdet.m_listquestionanswer.size());
      out.write("\">\r\n");
      out.write("\t\t\t    \t\t<input type=\"hidden\" name=\"level");
      out.print(i);
      out.write("\" value=\"");
      out.print(evdet.getLevel());
      out.write("\">\r\n");
      out.write("\t\t\t    \t\t<input type=\"hidden\" name=\"grpdbid");
      out.print(i);
      out.write("\" value=\"");
      out.print(evdet.getQuestgroupdbid());
      out.write("\">\r\n");
      out.write("\t\t\t    \t\t<input type=\"hidden\" name=\"grpmaindbid");
      out.print(i);
      out.write("\" value=\"");
      out.print(evdet.getMaingroupdbid());
      out.write("\">\r\n");
      out.write("\t\t\t    \t\t<input type=\"hidden\" name=\"evaldet");
      out.print(i);
      out.write("\" value=\"");
      out.print(evdet.getEvaldbid() );
      out.write("\">\r\n");
      out.write("\t\t\t    \t\t\r\n");
      out.write("\t\t\t\t\t\t<script>\r\n");
      out.write("\t\t\t\t\t\t   var tab_cond");
      out.print(i);
      out.write(" = new Array(");
      out.print(evdet.m_listdependency.size());
      out.write(");\r\n");
      out.write("\t\t\t\t\t\t   var tab_cond_det");
      out.print(i);
      out.write(" = new Array(");
      out.print(evdet.getAllCountDepDet());
      out.write(");\r\n");
      out.write("\t\t\t\t\t\t   ");

						   int count = 0;
						   int sub_count = 0;
						   for (Dependency dep : evdet.m_listdependency)
				           {
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t   tab_cond");
      out.print(i);
      out.write('[');
      out.print(count);
      out.write("] = new Array(7);\t\r\n");
      out.write("\t\t\t\t\t\t\t   tab_cond");
      out.print(i);
      out.write('[');
      out.print(count);
      out.write("][0] = \"");
      out.print(dep.getDbid());
      out.write("\";tab_cond");
      out.print(i);
      out.write('[');
      out.print(count);
      out.write("][1] = \"");
      out.print(dep.getDependencyDbid());
      out.write("\";tab_cond");
      out.print(i);
      out.write('[');
      out.print(count);
      out.write("][2] = \"");
      out.print(dep.getOperator());
      out.write("\"; tab_cond");
      out.print(i);
      out.write('[');
      out.print(count);
      out.write("][3] = \"");
      out.print(dep.getPrcMaxScore());
      out.write("\";tab_cond");
      out.print(i);
      out.write('[');
      out.print(count);
      out.write("][4] = \"");
      out.print(dep.getPrcScore());
      out.write("\";tab_cond");
      out.print(i);
      out.write('[');
      out.print(count);
      out.write("][5] = \"");
      out.print(dep.getGroupQuestionDetailDbid());
      out.write("\";tab_cond");
      out.print(i);
      out.write('[');
      out.print(count);
      out.write("][6] = \"");
      out.print(dep.getAnswerDetailDbid());
      out.write("\";\r\n");
      out.write("\t\t\t\t\t\t\t   ");

							  count++;
				        		for (DependencyDetails depdet : dep.getDependencyDetails())
				            	{
      out.write("\r\n");
      out.write("\t\t\t\t        \t\t\ttab_cond_det");
      out.print(i);
      out.write('[');
      out.print(sub_count);
      out.write("] = new Array(3);\r\n");
      out.write("\t\t\t\t        \t\t\ttab_cond_det");
      out.print(i);
      out.write('[');
      out.print(sub_count);
      out.write("][0] = \"");
      out.print(dep.getDbid());
      out.write("\";tab_cond_det");
      out.print(i);
      out.write('[');
      out.print(sub_count);
      out.write("][1] = \"");
      out.print(depdet.getGroupQuestionDetailDbid());
      out.write("\";tab_cond_det");
      out.print(i);
      out.write('[');
      out.print(sub_count);
      out.write("][2] = \"");
      out.print(depdet.getAnswerDetailDbid());
      out.write("\";\r\n");
      out.write("\t\t\t\t        \t\t\t");

				        			sub_count++;
				            	}
				        	}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\t");
 
						if (evdet.m_listquestionanswer !=null)
						{
							if (evdet.m_listquestionanswer.size() >0)
							{	
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t    \t\t\t\t\t<td width=\"100%\" class=\"");
      out.print(questionborderclassname);
      out.write("\">\r\n");
      out.write("\t\t    \t\t\t\t\t\r\n");
      out.write("\t\t\t    \t\t\t\t<table cellpading=\"2\" cellspacing=\"1\" border=\"0\" width=\"100%\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t");

								for (int j=0;j<evdet.m_listquestionanswer.size();j++)
								{
								
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t\t    \t<tr id=\"tr");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t    \t");
/*for (int k = 1; k <= evdet.getLevel(); k++){
      out.write("<td width=\"5\"></td>");
}*/
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td class=\"question\" align=\"left\" width=\"40%\">");
      out.print(evdet.m_listquestionanswer.elementAt(j).getQuestiondesc());
      out.write("</td>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td class=\"question\" align=\"left\" width=\"40%\">");

									Answer ans = evdet.m_listquestionanswer.elementAt(j).getAnswer();      
									String type = evdet.m_listquestionanswer.elementAt(j).getAnstype();
									int max_ans = 0;
									
									if (type.compareTo("1")==0  || type.compareTo("2")==0 ) //radio or combo box
									{
										
										if (type.compareTo("2")==0 )
										{
											
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<select name=\"ans");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" onChange=\"validateCondition(");
      out.print(i);
      out.write(",0,0);manageSaveButton();\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<option value=\"0#0\"></option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");
 
										}
										
										if (ans.getAnswerDetail() !=null)
										{
											for (int m=0; m< ans.getAnswerDetail().size();m++)
											{
											
												int score = Integer.parseInt(ans.getAnswerDetail().elementAt(m).getRank());
												
												if (score > max_ans) {max_ans = score;}
												
												if (type.compareTo("1")==0 )
												{
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"ans");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"");
      out.print(ans.getAnswerDetail().elementAt(m).getDbid());
      out.write('#');
      out.print(ans.getAnswerDetail().elementAt(m).getRank());
      out.write("\" \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");
      out.print(((ans.getAnswerDetail().elementAt(m).getDbid()).compareTo(evdet.m_listquestionanswer.elementAt(j).getEvaldetanswer())==0)?"checked":"");
      out.write("  onclick=\"validateCondition(");
      out.print(i);
      out.write(",0,0);manageSaveButton();\" title=\"");
      out.print(ans.getAnswerDetail().elementAt(m).getDescription());
      out.write('"');
      out.write(' ');
      out.write('>');
      out.print(ans.getAnswerDetail().elementAt(m).getName());
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");

												}
												else
												{
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<option value=\"");
      out.print(ans.getAnswerDetail().elementAt(m).getDbid());
      out.write('#');
      out.print(ans.getAnswerDetail().elementAt(m).getRank());
      out.write("\" \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");
      out.print(((ans.getAnswerDetail().elementAt(m).getDbid()).compareTo(evdet.m_listquestionanswer.elementAt(j).getEvaldetanswer())==0)?"selected":"");
      out.write(' ');
      out.write('>');
      out.write(' ');
      out.print(ans.getAnswerDetail().elementAt(m).getName());
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");

												}
											
												
											}
										}
										
										if (type.compareTo("2")==0 )
										{
											
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");
 
										}						
									}
							    	
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t    \t<input type=\"hidden\" name=\"quest");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"");
      out.print(evdet.m_listquestionanswer.elementAt(j).getQuestiondbid());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t    \t<input type=\"hidden\" name=\"fhide");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"0\">\r\n");
      out.write("\t\t\t\t\t\t\t    \t\r\n");
      out.write("\t\t\t\t\t\t\t    \t<input type=\"hidden\" name=\"evaldet");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"");
      out.print(evdet.m_listquestionanswer.elementAt(j).getEvaldetdbid());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"anstype");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"");
      out.print(type);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"anslength");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"");
      out.print(ans.getAnswerDetail().size() );
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");
 
									if (type.compareTo("3")==0 )
									{
										
										String val = String.valueOf(evdet.m_listquestionanswer.elementAt(j).getEvalscore());
										if (val.endsWith(".00")) {
											val = val.substring(0,val.indexOf(".00"));
										}
										
										
      out.print(evdet.m_listquestionanswer.elementAt(j).getAnsmin());
      out.write("<= <input type=\"text\" name=\"ans");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"");
      out.print(val);
      out.write("\"  size=5 onBlur=\"validateValue(");
      out.print(i);
      out.write(',');
      out.write(' ');
      out.print(j);
      out.write(");manageSaveButton();\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<=");
      out.print(evdet.m_listquestionanswer.elementAt(j).getAnsmax());
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

										max_ans = Integer.parseInt(evdet.m_listquestionanswer.elementAt(j).getAnsmax());
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"ansmaxval");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"");
      out.print(evdet.m_listquestionanswer.elementAt(j).getAnsmax());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"ansminval");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"");
      out.print(evdet.m_listquestionanswer.elementAt(j).getAnsmin());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
 
									}
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"ansmax");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" value=\"");
      out.print(max_ans );
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t    \t</td>\r\n");
      out.write("\t\t\t\t\t\t\t    \t");

				    				if (evdet.m_listquestionanswer.elementAt(j).getAddcomment()==1)
				    				{
				    					
      out.write("\r\n");
      out.write("\t\t\t\t    \t\t\t\t\t<td align=\"right\" class=\"question\">\r\n");
      out.write("\t\t\t\t    \t\t\t\t\t\t<textarea cols=\"");
      out.print((evdet.m_listquestionanswer.elementAt(j).getCommcolnbr()==0)?20:(evdet.m_listquestionanswer.elementAt(j).getCommcolnbr()+2));
      out.write("\" rows=\"");
      out.print((evdet.m_listquestionanswer.elementAt(j).getCommrownbr()==0)?2:evdet.m_listquestionanswer.elementAt(j).getCommrownbr());
      out.write("\" name=\"comm");
      out.print(i);
      out.write('_');
      out.print(j);
      out.write("\" onChange=\"manageSaveButton()\" onKeyDown=\"limitText(this,512);\" onKeyUp=\"limitText(this,512);\">");
      out.print(evdet.m_listquestionanswer.elementAt(j).getEvalcomment());
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t    \t\t\t        </td>\r\n");
      out.write("\t\t\t\t    \t\t\t\t\t");

				    				}
							    	
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

								}
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td></tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t");

							}
						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr><td height=\"5\"></td></tr>\r\n");
      out.write("\t\t\t\t\t\t");
 

					}
				}
				
      out.write("\r\n");
      out.write("\t\t\t\t<tr height=\"15\"><td></td></tr>\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" value=\"");
      out.print(vec_evdet.size());
      out.write("\" name=\"grpnbr\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" value=\"");
      out.print(recEval.getFormId());
      out.write("\" name=\"frmdbid\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" value=\"");
      out.print(recEval.getEvalId());
      out.write("\" name=\"evaldbid\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td valign=top>&nbsp;");
      out.print(pageData.getWord("COMMENTS"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<textarea rows=\"5\" name=\"comments\" cols=\"45\" onChange=\"manageSaveButton()\" onKeyDown=\"limitText(this,512);\" onKeyUp=\"limitText(this,512);\">");
      out.print(recEval.getComment());
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("  </fieldset>\r\n");
      out.write("     \r\n");
      out.write("\t     <table width=\"100%\">\r\n");
      out.write("\t\t\t<tr valign=\"top\">\r\n");
      out.write("\t\t\t\t<td width=\"100%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t<input  disabled type=\"button\" name=\"bt_save\" onClick=\"javascript:doSubmit()\" value=\"");
      out.print(pageData.getWord("Save"));
      out.write("\">\r\n");
      out.write("\t\t\t\t\t<input   type=\"button\" name=\"bt_close\" onClick=\"javascript:doClose()\" value=\"");
      out.print(pageData.getWord("Close"));
      out.write("\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("</div>\r\n");

}//end if view ==0
else//view==1
{
	//start display part
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"dynamic-tab-pane-control\" width=\"90%\">\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-page\" id=\"general\"> \r\n");
      out.write("<div id=\"divalt\" style=\"position:absolute;display:none;padding:5;\" class=\"divComment\"></div>\r\n");
      out.write("<fieldset>\r\n");
      out.write("<legend> ");
      out.print(form_name);
      out.write("</legend>\r\n");
      out.write("<table height=\"5\"><tr><td></td></tr></table>\r\n");
      out.write("<table width=\"100%\" cellspacing=\"2\"  cellpadding=\"3\" >\r\n");
      out.write("\t<tr class=\"question_border2\" >\r\n");
      out.write("\t<td class=\"reportsLevel2\">");
      out.print(pageData.getWord("Agent name"));
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print( recEval.getAgentName() );
      out.write("</td>\r\n");
      out.write("\t<td class=\"reportsLevel2\">");
      out.print(pageData.getWord("Call time"));
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print(recEval.getCalltime() );
      out.write("</td>\r\n");
      out.write("\t<td class=\"reportsLevel2\">");
      out.print(pageData.getWord("Evaluation time"));
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print(recEval.getDate() );
      out.write("</td>\r\n");
      out.write("\t<td class=\"reportsLevel2\">");
      out.print(pageData.getWord("Supervisor name"));
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print(recEval.getUserName() );
      out.write("</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table height=\"5\"><tr><td></td></tr></table>\r\n");
      out.write("<table cellspacing=\"1\" cellpadding=\"0\" width=\"100%\" >\r\n");
      out.write("<!-- Start dispay details -->\r\n");
      out.write("\r\n");
      out.write("<table cellspacing=\"1\" cellpadding=\"4\" width=\"100%\" >\r\n");


int maxlabel = recEval.getMaxLabelCount();
String quest_dbid	= "";
int f_total	 = 0;
EvaluationDetails  previous_evdet = null;
if (vec_evdet !=null)
{
	for (int i = 0 ; i <vec_evdet.size();i++)    		
	{
		EvaluationDetails  evdet= vec_evdet.elementAt(i);
		String classname="reportsLevel"+((evdet.getLevel()>2)?2:evdet.getLevel());
		String questionborderclassname ="question_border"+((evdet.getLevel()>2)?2:evdet.getLevel());
		
		if (i >0)
		{
			EvaluationDetails temp_previous_evdet = vec_evdet.elementAt(i-1);
			EvaluationDetails temp_evdet = vec_evdet.elementAt(i);
			
			if (temp_previous_evdet.getLevel() > temp_evdet.getLevel())
			{
				/*display total previous level*/
				if ( temp_previous_evdet.getDisptotal()==1 && temp_previous_evdet.m_listquestionanswer.size() ==0 )
				{	
				
				String classname1="reportsLevel"+((temp_previous_evdet.getLevel()>2)?2:temp_previous_evdet.getLevel());
				
      out.write("<tr class=\"");
      out.print(classname1);
      out.write("\" ><td title=\"");
      out.print( temp_previous_evdet.getQuestgroupdesc() );
      out.write('"');
      out.write('>');
      out.print( temp_previous_evdet.getQuestgroupName() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td align=\"center\">");
      out.print(temp_previous_evdet.getMaxevalscore() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t");

				
				int  countlab = temp_previous_evdet.m_listscorelabel.getLabelDetail().size();
				for (int k=0; k <temp_previous_evdet.m_listscorelabel.getLabelDetail().size();k++)
				{
					
      out.write("<td align=\"center\">");
      out.print( temp_previous_evdet.getScoreLabel(temp_previous_evdet.m_listscorelabel.getLabelDetail().elementAt(k).getDbid()) );
      out.write("</td>");
	
				}
				if (temp_previous_evdet.m_listscorelabel.getLabelDetail().size() <=0)
				{
					countlab = 1;
					
      out.write("<td align=\"center\" >");
      out.print( temp_previous_evdet.getEvalscore() );
      out.write("</td>");
	
					
				}
				
				if (maxlabel > countlab) {
					
      out.write("<td colspan=\"");
      out.print(maxlabel - countlab);
      out.write("\"></td>");
					
				}
				
      out.write("\r\n");
      out.write("\t\t\t\t<td align=\"center\">");
      out.print(temp_previous_evdet.getScoreMaxScorePrc());
      out.write("</td>\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");

				}
				
      out.write("\r\n");
      out.write("\t\t\t\t <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t");

				/*end display total previous level*/
				
				int minlevel = temp_previous_evdet.getLevel();
				int samelevel = 0;
				for(int j=i-2;j>=0;j--)
				{
					EvaluationDetails temp_prv = vec_evdet.elementAt(j);
					if(minlevel > temp_prv.getLevel() && temp_prv.getLevel()>= temp_evdet.getLevel() )
					{
						/*display total previous level*/
						if ( temp_prv.getDisptotal()==1 && temp_prv.m_listquestionanswer.size() ==0 )
						{	
						
						String classname1="reportsLevel"+((temp_prv.getLevel()>2)?2:temp_prv.getLevel());
						
      out.write("<tr class=\"");
      out.print(classname1);
      out.write("\"><td title=\"");
      out.print( temp_prv.getQuestgroupdesc() );
      out.write('"');
      out.write('>');
      out.print( temp_prv.getQuestgroupName() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
      out.print(temp_prv.getMaxevalscore() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t");

						int  countlab = temp_prv.m_listscorelabel.getLabelDetail().size();
						for (int k=0; k <temp_prv.m_listscorelabel.getLabelDetail().size();k++)
						
						{
							
      out.write("<td align=\"center\">");
      out.print( temp_prv.getScoreLabel(temp_prv.m_listscorelabel.getLabelDetail().elementAt(k).getDbid()) );
      out.write("</td>");
	
						}
						if (temp_prv.m_listscorelabel.getLabelDetail().size() <=0)
						{
							countlab=1;
							
      out.write("<td align=\"center\" >");
      out.print( temp_prv.getEvalscore() );
      out.write("</td>");
	
							
						}
						if (maxlabel > countlab) {
							
      out.write("<td colspan=\"");
      out.print(maxlabel - countlab);
      out.write("\"></td>");
					
						}
						
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
      out.print(temp_prv.getScoreMaxScorePrc());
      out.write("</td>\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t\t\t");

						/*end display total previous level*/
						minlevel =temp_prv.getLevel();
						if (minlevel== temp_evdet.getLevel())
						{
							samelevel = 1;
						}
						
					}
					else
					{
						minlevel=0;
					}
					
					
					
					
					if (samelevel==0 && temp_prv.getLevel() == temp_evdet.getLevel())
					{
						samelevel=1;
						/*display total previous level*/
						if ( temp_prv.getDisptotal()==1 && temp_prv.m_listquestionanswer.size() ==0 )
						{	
						
						String classname1="reportsLevel"+((temp_prv.getLevel()>2)?2:temp_prv.getLevel());
						
      out.write("<tr class=\"");
      out.print(classname1);
      out.write("\"><td title=\"");
      out.print( temp_prv.getQuestgroupdesc() );
      out.write('"');
      out.write('>');
      out.print( temp_prv.getQuestgroupName() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
      out.print(temp_prv.getMaxevalscore() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t");

						int  countlab = temp_prv.m_listscorelabel.getLabelDetail().size();
						for (int k=0; k <temp_prv.m_listscorelabel.getLabelDetail().size();k++)
						
						{
							
      out.write("<td align=\"center\">");
      out.print( temp_prv.getScoreLabel(temp_prv.m_listscorelabel.getLabelDetail().elementAt(k).getDbid()) );
      out.write("</td>");
	
						}
						if (temp_prv.m_listscorelabel.getLabelDetail().size() <=0)
						{
							countlab=1;
							
      out.write("<td align=\"center\" >");
      out.print( temp_prv.getEvalscore() );
      out.write("</td>");
	
							
						}
						if (maxlabel > countlab) {
							
      out.write("<td colspan=\"");
      out.print(maxlabel - countlab);
      out.write("\"></td>");
					
						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<td align=\"center\">");
      out.print(temp_prv.getScoreMaxScorePrc());
      out.write("</td>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t <tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t\t\t\t\t");

						/*end display total previous level*/
					}
					if(minlevel==0 && samelevel==1) {break;}
						
					
				}
			
				
				
			}	
			
		}
		
		
		previous_evdet = evdet;
		
      out.write("\r\n");
      out.write("\t\t<tr class=\"");
      out.print(classname);
      out.write("\">\r\n");
      out.write("\t\t\t<td>\t\r\n");
      out.write("\t\t\t<table  width=\"100%\"><tr class=\"");
      out.print(classname);
      out.write("\" ><td ><span title=\"");
      out.print(evdet.getQuestgroupdesc());
      out.write('"');
      out.write('>');
      out.print(evdet.getQuestgroupName());
      out.write("</span>\r\n");
      out.write("\t\t\t");

			
							
			
			
			if (!evdet.getEvalcomment().equals("")) {
				String comm = evdet.getEvalcomment();
				
				comm = comm.replace("'","\\'");
				comm = comm.replace("\"","\\'");
				comm = comm.replace("\n","<br>");
				comm = comm.replace("\r","");
				
				
      out.write("<img border=\"0\" src=\"../img/comments.gif\" onMouseOver=\"showDiv('");
      out.print(comm);
      out.write("',event.clientX , event.clientY);\"  onmouseout=\"hideDiv();\" >");

			}
			
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<td align=\"right\" nowrap>");
      out.print((evdet.m_listquestionanswer.size()>0)?pageData.getWord("Question score"):"" );
      out.write("</td></tr></table></td>\r\n");
      out.write("\t\t\t\t");

				
				f_total = 0;
				int maxlevel = evdet.getLevel();
				
				
				if (maxlevel!=0)
				{	
				for (int j = i-1 ; j>=0 ; j--)
				{
					EvaluationDetails temp = vec_evdet.elementAt(j);
					
					if (temp.getLevel() < maxlevel )
					{
						if (temp.getLabeldbid().compareTo(evdet.getLabeldbid())==0 && temp.getDisptotal()==1)
						{
							f_total =1;
							break;
						}
					}	
					maxlevel = temp.getLevel();

				}
				}	
				if (evdet.getDisptotal()==1 && f_total==0)
				{
					
					
      out.write("<td align=\"center\">");
      out.print(pageData.getWord("Total score"));
      out.write("</td>");

					int  countlab = evdet.m_listscorelabel.getLabelDetail().size();
					
					for (int j=0; j <evdet.m_listscorelabel.getLabelDetail().size();j++)
					{
						
      out.write("<td align=\"center\">");
      out.print( evdet.m_listscorelabel.getLabelDetail().elementAt(j).getName() );
      out.write("</td>");
	
					}
					if (evdet.m_listscorelabel.getLabelDetail().size() <= 0)
					{
						countlab = 1;
						
      out.write("<td >");
      out.print(pageData.getWord("Score"));
      out.write("</td>");

					}
					if (maxlabel > countlab) {
						
      out.write("<td colspan=\"");
      out.print(maxlabel - countlab);
      out.write("\"></td>");
					
					}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<td >");
      out.print(pageData.getWord("%"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t");

				}
				else
				{
				
      out.write("<td colspan=");
      out.print(maxlabel+2);
      out.write("></td>");
	
				}
				
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t");

		if (evdet.m_listquestionanswer.size()>0)
		{
			
      out.write("\r\n");
      out.write("\t\t\t<tr class=\"");
      out.print(questionborderclassname);
      out.write("\"><td>\r\n");
      out.write("\t\t\t<table width=\"100%\" class=\"regulartext\">\r\n");
      out.write("\t\t\t");

			for (QuestionDetails q : evdet.m_listquestionanswer)
			{
				
      out.write("<tr><td>");
      out.print(q.getQuestiondesc());
      out.write("\r\n");
      out.write("\t\t\t\t");

				if (!q.getEvalcomment().equals("")) {
					String comm = q.getEvalcomment();
					
					comm = comm.replace("'","\\'");
					comm = comm.replace("\"","\\'");
					comm = comm.replace("\n","<br>");
					comm = comm.replace("\r","");	
					
				
      out.write("<img border=\"0\" src=\"../img/comments.gif\" onMouseOver=\"showDiv('");
      out.print(comm);
      out.write("',event.clientX , event.clientY);\"  onmouseout=\"hideDiv();\" >");

				}
				
      out.write("\r\n");
      out.write("\t\t\t\t</td><td align=\"right\">");
      out.print(q.getEvalscore() );
      out.write("</td></tr>");

			}
			
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td align=\"center\">");
      out.print(evdet.getMaxevalscore() );
      out.write("</td>\r\n");
      out.write("\t\t\t");

			int  countlab = evdet.m_listscorelabel.getLabelDetail().size();
			
			for (int j=0; j <evdet.m_listscorelabel.getLabelDetail().size();j++)
			{
				
      out.write("<td align=\"center\">");
      out.print( evdet.getScoreLabel(evdet.m_listscorelabel.getLabelDetail().elementAt(j).getDbid()) );
      out.write("</td>");
	
			}
			if (evdet.m_listscorelabel.getLabelDetail().size() <=0)
			{
				countlab = 1;
				
      out.write("<td align=\"center\" >");
      out.print( evdet.getEvalscore() );
      out.write("</td>");
	
				
			}
			if (maxlabel > countlab) {
				
      out.write("<td colspan=\"");
      out.print(maxlabel - countlab);
      out.write("\"></td>");
					
			}
			
      out.write("\r\n");
      out.write("\t\t\t<td align=\"center\">");
      out.print(evdet.getScoreMaxScorePrc());
      out.write("</td>\t\t\t\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

		}
		
		
		
		
		
		
		
      out.write("<tr><td height=\"10\"></td></tr> ");


	}			
}

int oldlevel = -1;
int maxlevel = -1;
for (int i = vec_evdet.size()-1 ; i>=0 ; i--)
{
	EvaluationDetails temp = vec_evdet.elementAt(i);
	
	if ((temp.getLevel() < oldlevel || oldlevel == -1) && (maxlevel ==-1 || maxlevel>temp.getLevel()) )
	{
		maxlevel = temp.getLevel();
		String classname="reportsLevel"+((temp.getLevel()>2)?2:temp.getLevel());
		String questionborderclassname ="question_border"+((temp.getLevel()>2)?2:temp.getLevel());
		
		if ( temp.getDisptotal()==1 && temp.m_listquestionanswer.size()<=0)
		{	
		
      out.write("<tr class=\"");
      out.print(classname);
      out.write("\"><td title=\"");
      out.print( temp.getQuestgroupdesc() );
      out.write('"');
      out.write('>');
      out.print( temp.getQuestgroupName() );
      out.write("</td>\r\n");
      out.write("\t\t\t<td align=\"center\">");
      out.print(temp.getMaxevalscore() );
      out.write("</td>\r\n");
      out.write("\t\t\t");

			int  countlab = temp.m_listscorelabel.getLabelDetail().size();
			
			for (int k=0; k <temp.m_listscorelabel.getLabelDetail().size();k++)
			
			{
				
      out.write("<td align=\"center\">");
      out.print( temp.getScoreLabel(temp.m_listscorelabel.getLabelDetail().elementAt(k).getDbid()) );
      out.write("</td>");
	
			}
			if (temp.m_listscorelabel.getLabelDetail().size() <=0)
			{
				
      out.write("<td align=\"center\">");
      out.print( temp.getEvalscore() );
      out.write("</td>");
	
				countlab = 1;
				
			}
			if (maxlabel > countlab) {
				
      out.write("<td colspan=\"");
      out.print(maxlabel - countlab);
      out.write("\"></td>");
					
			}
			
      out.write("\t\r\n");
      out.write("\t\t\t<td align=\"center\">");
      out.print(temp.getScoreMaxScorePrc() );
      out.write("</td>\t\t\t\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr><td height=\"10\"></td></tr>\r\n");
      out.write("\t\t");

		}
	}
	
	oldlevel = temp.getLevel();

}



      out.write("\r\n");
      out.write("<!--  </table></td></tr>-->\r\n");
      out.write("<tr height=\"15\"><td></td></tr>\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("</table>\r\n");

if (!recEval.getComment().equals("") ) {
	
      out.write("\r\n");
      out.write("\t<table width=\"100%\"><tr><td class=\"reportsLevel2\" valign=\"top\">");
      out.print(pageData.getWord("Comments"));
      out.write("</td></tr><tr><td >");
      out.print(recEval.getComment() );
      out.write("</td></tr></table>\r\n");
      out.write("\t");

}

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- End display of the details -->\r\n");
      out.write("</table>\r\n");
      out.write("</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\t\r\n");
      out.write("\t");

	//end display part
}//end view==1
}//end if form exists

      out.write("\r\n");
      out.write("<input type=\"hidden\" name=\"url\" value=\"");
      out.print(tomcaturl );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"path\" value=\"");
      out.print(tomcatpath );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"recid\" value=\"");
      out.print(recid );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"tracknum\" value=\"");
      out.print(tracknum );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"agtid\" value=\"");
      out.print(agtid );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"grpid\" value=\"");
      out.print(grpid );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"tenant\" value=\"");
      out.print(tenantid );
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("</form>\r\n");

if (view.compareTo("0")==0 && form_name.compareTo("")!=0) 
{	

      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("   submitInfo('");
      out.print(recid);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(recEval.getPath());
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(agtid);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(recEval.getFilename());
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(recEval.getPhonenumber());
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(recEval.getEncryption());
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(grpid);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(recEval.getEncmethod());
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(recEval.getEncserverdbid());
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(tomcaturl);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(tomcatpath);
      out.write("');\r\n");
      out.write("   validateConditionAllGroup();\r\n");
      out.write("   ");

   if (recEval.getEvalId().compareTo("")==0)
   { 
   
      out.write("\r\n");
      out.write("   \t\tcalculateScore();\r\n");
      out.write("   ");

   }
   
      out.write("\r\n");
      out.write("</script>\r\n");

}

pageData.closeConnection();

      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
