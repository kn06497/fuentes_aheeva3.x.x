package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;
import aheevaManager.ressources.*;

public final class topstats_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/aheevaManager/Resources_pages/topstatsFunctions_labels.jsp");
    _jspx_dependants.add("/aheevaManager/Resources_pages/agentSpyFunctions_labels.jsp");
    _jspx_dependants.add("/aheevaManager/Resources_pages/jsdomenu_labels.inc.jsp");
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

      out.write(" \r\n");
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

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<title>AheevaCCS - Statistics</title>\r\n");
      out.write('\r');
      out.write('\n');

beanManagerData pagetopsData = new beanManagerData();
pagetopsData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pagetopsData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var tops= new Array();\r\n");
      out.write("\r\n");
      out.write("tops[0]=\"");
      out.print( pagetopsData.getWord("Host [") );
      out.write("\";\r\n");
      out.write("tops[1]=\"");
      out.print( pagetopsData.getWord("Switch [") );
      out.write("\";\r\n");
      out.write("tops[2]=\"");
      out.print( pagetopsData.getWord("Phone [") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pagetopsData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');

beanManagerData pageSpyFData = new beanManagerData();
pageSpyFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageSpyFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var Spy= new Array();\r\n");
      out.write("\r\n");
      out.write("Spy[0]=\"");
      out.print( pageSpyFData.getWord("You are already spying agent #") );
      out.write("\";\r\n");
      out.write("Spy[1]=\"");
      out.print( pageSpyFData.getWord("Unable to find agent switch!") );
      out.write("\";\r\n");
      out.write("Spy[2]=\"");
      out.print( pageSpyFData.getWord("Error: Unable to get call and hangup!") );
      out.write("\";\r\n");
      out.write("Spy[3]=\"");
      out.print( pageSpyFData.getWord("Error: Unable to remove call ") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageSpyFData.closeConnection(); 
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');

beanManagerData pageDoMenuData = new beanManagerData();
pageDoMenuData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageDoMenuData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var DoMenu= new Array();\r\n");
      out.write("\r\n");
      out.write("DoMenu[0]=\"");
      out.print( pageDoMenuData.getWord("Log out") );
      out.write("\";\r\n");
      out.write("DoMenu[1]=\"");
      out.print( pageDoMenuData.getWord("On hold") );
      out.write("\";\r\n");
      out.write("DoMenu[2]=\"");
      out.print( pageDoMenuData.getWord("Information") );
      out.write("\";\r\n");
      out.write("DoMenu[3]=\"");
      out.print( pageDoMenuData.getWord("Monitoring") );
      out.write("\";\r\n");
      out.write("DoMenu[4]=\"");
      out.print( pageDoMenuData.getWord("Properties") );
      out.write("\";\r\n");
      out.write("DoMenu[5]=\"");
      out.print( pageDoMenuData.getWord("Change status") );
      out.write("\";\r\n");
      out.write("DoMenu[6]=\"");
      out.print( pageDoMenuData.getWord("Logged out") );
      out.write("\";\r\n");
      out.write("DoMenu[7]=\"");
      out.print( pageDoMenuData.getWord("Statistics") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageDoMenuData.closeConnection(); 
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"jsdom_menuvariables.js\" type=\"text/javascript\" ></script>\r\n");
      out.write("<script language=\"javascript\" src=\"jsdomenu.config.js\" type=\"text/javascript\" ></script>\r\n");
      out.write("<script language=\"javascript\" src=\"jsdomenu.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"jsdomenu.inc.js\" type=\"text/javascript\" ></script>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" src=\"jsUtil.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"Browser.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"topstatsFunctions.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"agentSpyFunctions.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("<LINK href=\"style.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"office_xp.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write("<!--[if lt IE 7]>\r\n");
      out.write("<link href=\"Resources_pages/styleie6.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<![endif]-->\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("div.TableContainer {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\toverflow:  auto;\r\n");
      out.write("\tmargin: 0 auto; \r\n");
      out.write("}\t\r\n");
      out.write("tbody\t{ \r\n");
      out.write("\toverflow: auto; \r\n");
      out.write("\theight: 10px;\r\n");
      out.write("}\r\n");
      out.write("thead tr\t{\t\r\n");
      out.write("\tposition: relative; \r\n");
      out.write("\ttop: expression(this.parentNode.parentNode.parentNode.scrollTop-2);\r\n");
      out.write("\r\n");
      out.write(" }\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<SCRIPT language=\"JavaScript\">\r\n");
      out.write("<!--\r\n");
      out.write("if (document.images)\r\n");
      out.write("{\r\n");
      out.write("pic1= new Image(20,16); \r\n");
      out.write("pic1.src=\"../img/inbound.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic2= new Image(20,16); \r\n");
      out.write("pic2.src=\"../img/outbound.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic3= new Image(20,16); \r\n");
      out.write("pic3.src=\"../img/coaching.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic4= new Image(20,16); \r\n");
      out.write("pic4.src=\"../img/conference.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic5= new Image(20,16); \r\n");
      out.write("pic5.src=\"../img/dialing.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic6= new Image(20,16); \r\n");
      out.write("pic6.src=\"../img/logged_out.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic7= new Image(20,16); \r\n");
      out.write("pic7.src=\"../img/not_ready.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic8= new Image(20,16); \r\n");
      out.write("pic8.src=\"../img/on_break.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic9= new Image(20,16); \r\n");
      out.write("pic9.src=\"../img/on_hold.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic10= new Image(20,16); \r\n");
      out.write("pic10.src=\"../img/technical_problem.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic11= new Image(20,16); \r\n");
      out.write("pic11.src=\"../img/waiting.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic12= new Image(20,16); \r\n");
      out.write("pic12.src=\"../img/wrap_up.gif\"; \r\n");
      out.write("\r\n");
      out.write("pic13= new Image(20,16); \r\n");
      out.write("pic13.src=\"../img/follow_up.gif\"; \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function hei2 (){\r\n");
      out.write("\t\r\n");
      out.write("\tdocument.getElementById('stats_division').style.height = (document.body.clientHeight)-20;\r\n");
      out.write("\t//alert (document.getElementById('stats_division').style.height);\r\n");
      out.write("\r\n");
      out.write("};\r\n");
      out.write("window.onload=hei2;\r\n");
      out.write("window.onresize=hei2;\r\n");
      out.write("-->\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"topstatsbody\" onLoad=\"initjsDOMenu();window.top.main.rtop.tabOnClick(window.top.main.rtop.currentTabID);\" SCROLL=\"NO\">\r\n");
      out.write("<div id=\"stats_division\" class=\"TableContainer\">\r\n");
      out.write("<!--\t<IFRAME ID=\"current_stats_frm\" name=\"current_stats_frm\" border=\"0\" frameborder=\"0\" CLASS=\"tabFrame\" src=\"\">-->\r\n");
      out.write("</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"changeStatusDialog\" class=\"changeStatusDialog\">\r\n");
      out.write("\t<table>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td bgcolor=\"#AFCEEF\" colspan=\"2\">");
      out.print(pageData.getWord("Notice"));
      out.write(":</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td id=\"changeStatusDialog_text\" colspan=\"2\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\">");
      out.print(pageData.getWord("Message"));
      out.write("<input name=\"changeStatusDialog_mess\" value=\"\" class=\"changeStatusDialog_input\" maxlength=\"256\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"right\" id=\"changeStatusDialog_okButton\" width=\"50%\">&nbsp;</td>\r\n");
      out.write("\t\t\t<td align=\"left\" width=\"50%\">\r\n");
      out.write("\t      \t\t<input type=\"button\" value=\"");
      out.print(pageData.getWord("Cancel"));
      out.write("\" onClick=\"hidechangeStatusDialog()\">\r\n");
      out.write("\t\t</td></tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"showLiveListeningDialog\" style=\"visibility:hidden; position:absolute; top:0px; left:0px; z-index:500;\">\r\n");
      out.write("\t\r\n");
      out.write("\t<table width=\"180\" height=\"74\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border: 1px solid rgb(136, 136, 136);\">\r\n");
      out.write("\t\t\t<tr style=\"background-image:url(../img/tile_blue.gif)\">\r\n");
      out.write("\t\t\t<td  style=\"background-image:url(../img/tile_blue.gif);cursor:move;\" width=\"253\" height=\"16\" valign=\"top\" onMouseDown=\"dragThis('showLiveListeningDialog')\">\r\n");
      out.write("\t\t  &nbsp;&nbsp;<font color=\"#FFFFFF\" size=\"1\" face=\"Verdana, Arial, Helvetica, sans-serif\"><strong>");
      out.print(pageData.getWord("Agent spying"));
      out.write("</strong></font></td>\r\n");
      out.write("\t\t<td width=\"15\" align=\"right\" style=\"background-image:url(../img/tile_blue.gif)\"><div align=\"right\"><img src=\"../img/x.gif\" width=\"15\" height=\"14\" border=\"0\"  onClick=\"javascript:hideSpyInterface()\" style=\"cursor:pointer\"></div></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t  <tr bgcolor=\"#FFFFF0\">\r\n");
      out.write("\t\t<td height=\"2\" colspan=\"2\" align=\"left\" valign=\"top\"><img src=\"../img/line_gray.gif\" width=\"100%\" height=\"1\"></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t  <tr bgcolor=\"#FFFFF0\">\r\n");
      out.write("\t\t<td height=\"30\" colspan=\"2\" valign=\"middle\">&nbsp;&nbsp; \r\n");
      out.write("\t\t\t<img id=\"listen_img\" src=\"../img/listen.gif\" title=\"Listen to agent\" width=\"32\" height=\"32\" style=\"cursor:pointer\" onClick=\"javascript:spy_start()\">&nbsp&nbsp\r\n");
      out.write("\t\t  \t<img src=\"../img/stop_inactive.gif\" id=\"stop_whisper\" title=\"Stop listening to agent\" width=\"32\" height=\"32\" style=\"cursor:pointer\" onClick=\"javascript:spy_stop()\">&nbsp&nbsp\r\n");
      out.write("\t\t\t<script>\r\n");
      out.write("\t\t\tif(userHasRight(\"ALLOW_MANAGER_WHISPER_TOAGENT\"))\r\n");
      out.write("\t\t\t\tdocument.write('<img src=\"../img/talk_to_agent_inactive.gif\" alt=\"Whisper to agent\" width=\"32\" height=\"32\" id=\"whisper_agent_img\" style=\"cursor:pointer\" onClick=\"javascript:whisper_agent()\">&nbsp&nbsp');\r\n");
      out.write("\t\t\t</script>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<script>\r\n");
      out.write("\t\t\tif(appletObj.getIsScreenCaptureAllowed()) {\r\n");
      out.write("\t\t\t\tdocument.write('<img src=\"../img/tv_icon.gif\" alt=\"Watch agent monitor\" width=\"32\" height=\"32\" id=\"watch_agent\" style=\"cursor:pointer\" onClick=\"javascript:startWatcher()\">&nbsp&nbsp');\r\n");
      out.write("\t\t\t}else {\r\n");
      out.write("\t\t\t\t  document.write('<img src=\"../img/spy-audio-screen_bw.gif\" alt=\"Watch agent monitor disabled\" width=\"32\" height=\"32\" id=\"watch_agent\" style=\"\" >&nbsp&nbsp');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t</script>\r\n");
      out.write("\t\t\t<!--<img src=\"../img/talk_to_customer_inactive.gif\" alt=\"Whisper to customer\" width=\"32\" height=\"32\" id=\"whisper_customer_img\" style=\"cursor:pointer\" onClick=\"javascript:whisper_customer()\">&nbsp&nbsp -->\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t  <tr bgcolor=\"#EAF4F3\">\r\n");
      out.write("\t\t<td height=\"2\" colspan=\"2\" align=\"left\" valign=\"top\"><img src=\"../img/line_gray.gif\" width=\"100%\" height=\"1\"></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t  <tr bgcolor=\"#EAF4F3\">\r\n");
      out.write("\t\t<td height=\"15\" colspan=\"2\" id=\"agtSpyTicker\" style=\"font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px\">&nbsp; </td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- INCLUDE THE IAX JAVA STARPHONE -->\r\n");
      out.write("\t");
      out.write("<OBJECT classid=\"clsid:8AD9C840-044E-11D1-B3E9-00805F499D93\" name=\"myPhoneApplet\"" + " width=\"" + "0" + "\"" + " height=\"" + "0" + "\"" + " codebase=\"http://java.sun.com/products/plugin/1.2.2/jinstall-1_2_2-win.cab#Version=1,2,2,0\">");
      out.write("\n");
      out.write("<PARAM name=\"java_code\" value=\"aheevaManager.iaxclient.iaxPhone.class\">");
      out.write("\n");
      out.write("<PARAM name=\"java_archive\" value=\"../siaxPhone.jar\">");
      out.write("\n");
      out.write("<PARAM name=\"type\" value=\"application/x-java-applet;\">");
      out.write("\n");
      out.write( "<PARAM name=\"scriptable\" value=\"" + "true" + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"INPUT\" value=\"" + "0" + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"OUTPUT\" value=\"" + "0" + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"MAYSCRIPT\" value=\"" + "true" + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"USER\" value=\"" + "aheeva_spy" + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"PASS\" value=\"" + "aheeva_spy" + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"REGISTER\" value=\"" + "false" + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"NUMBER\" value=\"" + "" + "\">" );
      out.write("\n");
      out.write( "<PARAM name=\"DEBUG\" value=\"" + "false" + "\">" );
      out.write("\n");
      out.write("<COMMENT>");
      out.write("\n");
      out.write("<EMBED type=\"application/x-java-applet;\" name=\"myPhoneApplet\"" + " width=\"" + "0" + "\"" + " height=\"" + "0" + "\"" + " pluginspage=\"http://java.sun.com/products/plugin/\" java_code=\"aheevaManager.iaxclient.iaxPhone.class\" java_archive=\"../siaxPhone.jar\"");
      out.write( " scriptable=\"" + "true" + "\"" );
      out.write( " INPUT=\"" + "0" + "\"" );
      out.write( " OUTPUT=\"" + "0" + "\"" );
      out.write( " MAYSCRIPT=\"" + "true" + "\"" );
      out.write( " USER=\"" + "aheeva_spy" + "\"" );
      out.write( " PASS=\"" + "aheeva_spy" + "\"" );
      out.write( " REGISTER=\"" + "false" + "\"" );
      out.write( " NUMBER=\"" + "" + "\"" );
      out.write( " DEBUG=\"" + "false" + "\"" );
      out.write("/>");
      out.write("\n");
      out.write("<NOEMBED>");
      out.write("\n");
      out.write("\n");
      out.write("</NOEMBED>");
      out.write("\n");
      out.write("</COMMENT>");
      out.write("\n");
      out.write("</OBJECT>");
      out.write("\n");
      out.write("\r\n");
      out.write("\t<!-- END OF IAX STARPHONE -->\r\n");
      out.write("\r\n");
      out.write("\t<!-- ERROR MESSAGES DIV -->\r\n");
      out.write("\t<div id=\"showMessageDialogError\" class=\"showMessageDialogError\">\r\n");
      out.write("\t<table width=\"100%\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"30\"><img src=\"../img/error.gif\" width=\"30\" height=\"30\"></td>\r\n");
      out.write("\t\t\t<td id=\"showMessageDialogError_text\" class=\"showMessageDialogError_text\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- ~ ERROR MESSAGES DIV  -->\r\n");
      out.write("\r\n");
      out.write("<!-- Fixes the IE6 & IE7 \"Press SPACEBAR or ENTER to activate and use this control\" - must be at the end of the file-->\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../activateActiveX.js\"></script>\r\n");
      out.write("</body>\r\n");
 pageData.closeConnection(); 
      out.write("\r\n");
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
