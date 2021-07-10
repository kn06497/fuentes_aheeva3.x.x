package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.*;

public final class forbidden_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\r\n");
      out.write("\t\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n");
      out.write("\r\n");

beanManagerData pageforbData = new beanManagerData();
pageforbData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageforbData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Forbidden Access</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" >\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"jsUtil.js\"></script> \r\n");
      out.write("\r\n");
      out.write("<!--<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />-->\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .contentText{\r\n");
      out.write("\tfont:\t\t\t12px Tahoma;\r\n");
      out.write("\tcolor:\t\t\tBlack;\r\n");
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
      out.write("\t\r\n");
      out.write("\t/* 244, 243, 238 */ \r\n");
      out.write("\t/*145, 155, 156 */\r\n");
      out.write("\tpadding:\t\t10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-row {\r\n");
      out.write("\tz-index:\t\t1;\r\n");
      out.write("\twhite-space:\tnowrap;\r\n");
      out.write("}\r\n");
      out.write(" \r\n");
      out.write(".dynamic-tab-pane-control .tab-row .tab.selected {\r\n");
      out.write("\twidth:\t\t\t\t74px  ;\r\n");
      out.write("\theight:\t\t\t\t18px  ;\r\n");
      out.write("\tbackground-image:\turl( \"tab.active.png\" )  ;\r\n");
      out.write("\tbackground-repaet:\tno-repeat;\r\n");
      out.write("\r\n");
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
      out.write(" \r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write(" \r\n");
      out.write("html, body {\r\n");
      out.write("/*\tbackground:\tThreeDFace; */\r\n");
      out.write("\r\n");
      out.write("}\r\n");
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
      out.write(" \r\n");
      out.write(" .dynamic-tab-pane-control.tab-pane {\r\n");
      out.write("\tposition:\trelative;\r\n");
      out.write("\twidth:\t\t100%;\t\t \r\n");
      out.write("\tmargin-right:\t-2px;\t \r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"bottompagebody\">\r\n");
      out.write("<p>&nbsp;</p>\r\n");
      out.write("<table width=\"403\" height=\"82\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"51\">&nbsp;</td>\r\n");
      out.write("    <td width=\"302\">&nbsp;</td>\r\n");
      out.write("    <td width=\"50\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td><div align=\"right\"><img src=\"../Manager/img/stop_sign.gif\" width=\"50\" height=\"50\" /></div></td>\r\n");
      out.write("    <td><div align=\"center\"><strong>No further access!</strong></div></td>\r\n");
      out.write("    <td><img src=\"../Manager/img/stop_sign.gif\" width=\"50\" height=\"50\" /></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td>&nbsp;</td>\r\n");
      out.write("    <td>&nbsp;</td>\r\n");
      out.write("    <td>&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("<p>&nbsp;</p>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 pageforbData.closeConnection(); 
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
