package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.*;
import java.util.*;
import java.io.*;
import java.text.*;
import aheevaManager.reports.*;
import aheevaManager.ressources.*;

public final class listenRecording_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\r\n");
      out.write("\r\n");

////open connection to database///////
beanManagerData pageListnRecData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageListnRecData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageListnRecData.openConnection();

      out.write("\n");
      out.write("<LINK href=\"../Resources_pages/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"../Resources_pages/livestats.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("<script language=\"javascript\" src=\"../Resources_pages/Browser.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("\tbackground:;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".reportLook {\r\n");
      out.write("\tclear:\t\t\tboth;\r\n");
      out.write("\tborder:\t\t\t1px solid rgb( 145, 155, 156 );\r\n");
      out.write("\tbackground:\t\trgb( 252, 252, 254 );\r\n");
      out.write("\tz-index:\t\t2;\r\n");
      out.write("\tposition:\t\trelative;\r\n");
      out.write("\ttop:\t\t\t-2px;\r\n");
      out.write(" \tfont:\t\t\t11px Tahoma;\r\n");
      out.write("\tcolor:\t\t\tBlack;\r\n");
      out.write(" \tfilter:\t\t\tprogid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)\r\n");
      out.write("\t\t\t\t\tprogid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);\r\n");
      out.write("  \tpadding:\t\t10px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title> Recording</title>\r\n");
      out.write("\r\n");
 String rec_id ="0";
      out.write("\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\n");
      aheevaManager.reports.beanListenRecord beanRecord = null;
      synchronized (request) {
        beanRecord = (aheevaManager.reports.beanListenRecord) _jspx_page_context.getAttribute("beanRecord", PageContext.REQUEST_SCOPE);
        if (beanRecord == null){
          beanRecord = new aheevaManager.reports.beanListenRecord();
          _jspx_page_context.setAttribute("beanRecord", beanRecord, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\n");
      out.write("function goEvaluationForm(p1) \n");
      out.write("\t{\n");
      out.write("\t\twindow.open('conversationRecordingEvaluation.jsp?view=1&recid='+p1,'formWindow','scrollbars=yes,width=800,height=600,status=yes,resizable=yes');//,'scrollbars=yes,width=600,height=400'\n");
      out.write("\t\t\n");
      out.write("\t}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</head>\r\n");
      out.write("<body class=\"bottompagebody\">\r\n");


	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	//pageData.setDebug(true);
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	
   
   
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

    String ip  = request.getParameter("ip");
		ip =(ip == null ? "" : ip);
    String user  = request.getParameter("user");
		user =(user == null ? "" : user);
 
 	String feval = (request.getParameter("feval")==null)?"0":request.getParameter("feval");
 
    beanListenDetails r1=null;
    try{
 		beanRecord.getListenRecordsHistory (startingDate,endingDate,ip, user,feval);
    	System.out.println("\n All queries are completed in beanRecord. Construction JSP info") ;
   }catch(Exception e){
        //e.printStackTrace();
		System.out.println("\n  Error in JSP ..") ;

    }


      out.write("\r\n");
      out.write("\r\n");
      out.write("\n");
      out.write("<p align=\"center\">&nbsp; </p>\r\n");
      out.write("\r\n");
      out.write("  <fieldset > <legend class=\"genericTitle\"> <b> ");
      out.print( pageListnRecData.getWord("Record listening report"));
      out.write("   </b></legend>\n");
      out.write("<br>   \r\n");
      out.write("<div class=\"reportLook\" > \r\n");
      out.write("  <table width=\"400\" border=\"0\" align=\"center\" >\r\n");
      out.write("    <tr> \r\n");
      out.write("      <td align=left> \r\n");
      out.write("        <!-- </div>-->\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr class=\"reportsID\"> \r\n");
      out.write("      <td class=\"textblack\"><div > <b> \r\n");
      out.write("          ");
      out.print( pageListnRecData.getWord("Listen history"));
      out.write("\n");
      out.write("          ");
 if(startingDate.length() >0) out.write(pageListnRecData.getWord("From")+": "+startingDate);
      out.write("\n");
      out.write("          ");
 if(endingDate.length() >0) out.write(pageListnRecData.getWord("To")+": " + endingDate);
      out.write("\n");
      out.write("          </b></div></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr> \r\n");
      out.write("      <td> <div > <b> \r\n");
      out.write("          ");
 if(ip.length()>0) out.write(pageListnRecData.getWord("where IP")+" = " + ip);
      out.write("\n");
      out.write("          </b></div></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("  <p  class=\"reportsID\"> \r\n");
      out.write("  <div style=\"background-color:#EAEAEA; width: 800; height:18 \" ><b> \r\n");
      out.write("    ");
   
			if(user.length() > 9){
				if(user.substring(0,9).compareTo("AllUsers/")== 0 )
					out.write(pageListnRecData.getWord("User")+"["+ pageListnRecData.getWord("All Users")+"]");
				else
					out.write( pageListnRecData.getWord("User")+" [" +user+"]");
			}
		
      out.write("\r\n");
      out.write("    </b> </div></p>   \r\n");
      out.write("  <table border=\"2\"  cellpadding=\"0\" cellspacing=\"1\" style=\"border-collapse:separate; border-style:dotted; border-color:#DCDAD6\"  width=\"800\" id=\"AutoNumber1\">\r\n");
      out.write("    <tr class=\"reportsTab\"> \r\n");
      out.write("      <td width=\"150\"  height=\"30\" align=\"center\"> ");
      out.print( pageListnRecData.getWord("Event time"));
      out.write(" \n");
      out.write("      </td>\r\n");
      out.write("      <td  align=\"center\"> ");
      out.print( pageListnRecData.getWord("User"));
      out.write(" \n");
      out.write("      </td>\r\n");
      out.write("      <td  align=\"center\"> ");
      out.print( pageListnRecData.getWord("IP Address"));
      out.write(" \n");
      out.write("      </td>\r\n");
      out.write("      <td  align=\"center\"> ");
      out.print( pageListnRecData.getWord("File name"));
      out.write(" \n");
      out.write("      </td>\r\n");
      out.write("\t  <td  align=\"center\"> ");
      out.print( pageListnRecData.getWord("Type"));
      out.write(" \n");
      out.write("      </td>\r\n");
      out.write("      <td  align=\"center\"> ");
      out.print(pageData.getWord("Evaluation"));
      out.write("</td>\n");
      out.write("    </tr>\r\n");
      out.write("    ");


  if(beanRecord.m_vAllDetails.size() > 0){
   try{
     for (int i = 0; i < beanRecord.m_vAllDetails.size(); i++) {
         r1 = (beanListenDetails)beanRecord.m_vAllDetails.elementAt(i);
	
      out.write("\n");
      out.write("    <tr ");
 if(i%2 == 0) out.write("class=conversationRowPair");
  			else out.write("class=reportsRowUnPair");
      out.write(" > \r\n");
      out.write("      <td width=\"150\"  align=\"center\">");
if(r1.listenTime != null)  out.write(r1.listenTime);
      out.write("</td>\r\n");
      out.write("      <td    align=\"center\">");
if(r1.user != null) out.write(r1.user);
      out.write("</td>\r\n");
      out.write("      <td    align=\"center\">");
if(r1.ip != null) out.write(r1.ip);
      out.write("</td>\r\n");
      out.write("      <td    align=\"center\">");
if(r1.file != null) out.write(r1.file);
      out.write("</td>\r\n");
      out.write("\t  <td    align=\"center\">");
if(r1.file != null ){
								if(r1.file.substring(r1.file.length() - 3).compareTo("mp3") == 0) out.println("Audio");
								else if (r1.file.substring(r1.file.length() - 3).compareTo("wav") == 0) out.println("Audio");
								else if (r1.file.substring(r1.file.length() - 3).compareTo("swf") == 0) out.println("Video");
								else out.print("Unknown");
							}
	
      out.write("</td>\n");
      out.write("\t<td    align=\"center\">\n");
      out.write("         ");

         if ((r1.eval_dbid).compareTo("")!=0)
         {
         	
      out.write(" \n");
      out.write("        \t <input type=\"button\" value=\"");
      out.print(pageData.getWord("View evaluation"));
      out.write("\" onClick=\"goEvaluationForm(");
      out.print(r1.record_id);
      out.write(");\">\n");
      out.write("    \t\t");

    	}
    	else
    	{
    	
      out.write("&nbsp;");

    	}
    	
      out.write("\n");
      out.write("    </td>\t\n");
      out.write("\t\t\n");
      out.write("    </tr>\r\n");
      out.write("    ");

    } //end for
	
   }catch(Exception e){
  	  out.write("<tr ><td colspan=4 align=\"center\" height=50><b>&nbsp;"+ pageListnRecData.getWord("Error while generating report")+".. </b></font></td></tr>");
   }
  }//end if
  else{
	  out.write("<tr ><td colspan=4 align=\"center\" height=50><b>&nbsp; "+ pageListnRecData.getWord("No records available")+" </b></font></td></tr>");
  }

      out.write("\r\n");
      out.write("    <tr> \r\n");
      out.write("      <td colspan=6><b> \r\n");
      out.write("        ");
      out.print( pageListnRecData.getWord("Found"));
      out.write("\n");
      out.write("        &nbsp;\r\n");
      out.write("        ");
 out.write(Integer.toString(beanRecord.m_vAllDetails.size()));
      out.write("\r\n");
      out.write("        &nbsp; \r\n");
      out.write("        ");
      out.print( pageListnRecData.getWord("records"));
      out.write("\n");
      out.write("        </b></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("</div>\r\n");
      out.write("  </fieldset>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
      out.write("\n");
 pageListnRecData.closeConnection(); 
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
