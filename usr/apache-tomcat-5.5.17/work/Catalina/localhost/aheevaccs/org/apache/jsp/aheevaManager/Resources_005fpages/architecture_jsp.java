package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import aheevaManager.ressources.*;
import java.text.*;
import aheevaManager.schedule.*;
import aheevaManager.ressources.*;
import java.util.*;
import jxl.*;

public final class architecture_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/Resources_pages/architectureFunctions_labels.jsp");
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

////open connection to database///////
beanManagerData pageArchFData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageArchFData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageArchFData.openConnection();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("var arch=new Array();\r\n");
      out.write("arch[0]=\"");
      out.print( pageArchFData.getWord("Add site"));
      out.write("\";\r\n");
      out.write("arch[1]=\"");
      out.print( pageArchFData.getWord("Site Name"));
      out.write("\";\r\n");
      out.write("arch[2]=\"");
      out.print( pageArchFData.getWord("Internal Codec"));
      out.write("\";\r\n");
      out.write("arch[3]=\"");
      out.print( pageArchFData.getWord("External Codec"));
      out.write("\";\r\n");
      out.write("arch[4]=\"");
      out.print( pageArchFData.getWord("Proxy Host"));
      out.write("\";\r\n");
      out.write("arch[5]=\"");
      out.print( pageArchFData.getWord("Proxy Port"));
      out.write("\";\r\n");
      out.write("arch[6]=\"");
      out.print( pageArchFData.getWord("Submit"));
      out.write("\";\r\n");
      out.write("arch[7]=\"");
      out.print( pageArchFData.getWord("Add new switch"));
      out.write("\";\r\n");
      out.write("arch[8]=\"");
      out.print( pageArchFData.getWord("Site"));
      out.write("\";\r\n");
      out.write("arch[9]=\"");
      out.print( pageArchFData.getWord("Name"));
      out.write("\";\r\n");
      out.write("arch[10]=\"");
      out.print( pageArchFData.getWord("Password"));
      out.write("\";\r\n");
      out.write("arch[11]=\"");
      out.print( pageArchFData.getWord("Iax Internal Host"));
      out.write("\";\r\n");
      out.write("arch[12]=\"");
      out.print( pageArchFData.getWord("Iax Internal Port"));
      out.write("\";\r\n");
      out.write("arch[13]=\"");
      out.print( pageArchFData.getWord("Iax External Host"));
      out.write("\";\r\n");
      out.write("arch[14]=\"");
      out.print( pageArchFData.getWord("Iax External Port"));
      out.write("\";\r\n");
      out.write("arch[15]=\"");
      out.print( pageArchFData.getWord("Number of lines available for out bound"));
      out.write("\";\r\n");
      out.write("arch[16]=\"");
      out.print( pageArchFData.getWord("Agents load balance"));
      out.write("\";\r\n");
      out.write("arch[17]=\"");
      out.print( pageArchFData.getWord("percent in site"));
      out.write("\";\r\n");
      out.write("arch[18]=\"");
      out.print( pageArchFData.getWord("Outbound load balance"));
      out.write("\";\r\n");
      out.write("arch[19]=\"");
      out.print( pageArchFData.getWord("Save"));
      out.write("\";\r\n");
      out.write("arch[20]=\"");
      out.print( pageArchFData.getWord("No sites were defined.**Please add site first"));
      out.write("\";\r\n");
      out.write("arch[21]=\"");
      out.print( pageArchFData.getWord("Add new encryption server"));
      out.write("\";\r\n");
      out.write("arch[22]=\"");
      out.print( pageArchFData.getWord("Server name"));
      out.write("\";\r\n");
      out.write("arch[23]=\"");
      out.print( pageArchFData.getWord("Protocol"));
      out.write("\";\r\n");
      out.write("arch[24]=\"");
      out.print( pageArchFData.getWord("Internal Host"));
      out.write("\";\r\n");
      out.write("arch[25]=\"");
      out.print( pageArchFData.getWord("Internal Port"));
      out.write("\";\r\n");
      out.write("arch[26]=\"");
      out.print( pageArchFData.getWord("External Host"));
      out.write("\";\r\n");
      out.write("arch[27]=\"");
      out.print( pageArchFData.getWord("External Port"));
      out.write("\";\r\n");
      out.write("arch[28]=\"");
      out.print( pageArchFData.getWord("Add new recording server"));
      out.write("\";\r\n");
      out.write("arch[29]=\"");
      out.print( pageArchFData.getWord("Internal Secure Port"));
      out.write("\";\r\n");
      out.write("arch[30]=\"");
      out.print( pageArchFData.getWord("External Secure Port"));
      out.write("\";\r\n");
      out.write("arch[31]=\"");
      out.print( pageArchFData.getWord("Tomcat Mount Dir. on Web server"));
      out.write("\";\r\n");
      out.write("arch[32]=\"");
      out.print( pageArchFData.getWord("Recording Dir. full path(local)"));
      out.write("\";\r\n");
      out.write("arch[33]=\"");
      out.print( pageArchFData.getWord("Recording Sales Directory"));
      out.write("\";\r\n");
      out.write("arch[34]=\"");
      out.print( pageArchFData.getWord("Recording NoSales Directory"));
      out.write("\";\r\n");
      out.write("arch[35]=\"");
      out.print( pageArchFData.getWord("Daily Synchronization"));
      out.write("\";\r\n");
      out.write("arch[36]=\"");
      out.print( pageArchFData.getWord("Send recordings to"));
      out.write("\";\r\n");
      out.write("arch[37]=\"");
      out.print( pageArchFData.getWord("Synchronization time(HH:mm)"));
      out.write("\";\r\n");
      out.write("arch[38]=\"");
      out.print( pageArchFData.getWord("percent in site"));
      out.write("\";\r\n");
      out.write("arch[39]=\"");
      out.print( pageArchFData.getWord("Max. disk to use"));
      out.write("\";\r\n");
      out.write("arch[40]=\"");
      out.print( pageArchFData.getWord("Configuration"));
      out.write("\";\r\n");
      out.write("arch[41]=\"");
      out.print( pageArchFData.getWord("Statistics"));
      out.write("\";\r\n");
      out.write("arch[42]=\"");
      out.print( pageArchFData.getWord("Diagram"));
      out.write("\";\r\n");
      out.write("arch[43]=\"");
      out.print( pageArchFData.getWord("Save layout"));
      out.write("\";\r\n");
      out.write("arch[44]=\"");
      out.print( pageArchFData.getWord("Show grid"));
      out.write("\";\r\n");
      out.write("arch[45]=\"");
      out.print( pageArchFData.getWord("Hide grid"));
      out.write("\";\r\n");
      out.write("arch[46]=\"");
      out.print( pageArchFData.getWord("Error: Specify site name"));
      out.write("\";\r\n");
      out.write("arch[47]=\"");
      out.print( pageArchFData.getWord("Error: Site already exists. Specify new name"));
      out.write("\";\r\n");
      out.write("arch[48]=\"");
      out.print( pageArchFData.getWord("Error: Unable to delete site"));
      out.write("\";\r\n");
      out.write("arch[49]=\"");
      out.print( pageArchFData.getWord("Unable to delete non empty site.**This site contains asterisk pbx  "));
      out.write("\";\r\n");
      out.write("arch[50]=\"");
      out.print( pageArchFData.getWord("Delete it first"));
      out.write("\";\r\n");
      out.write("arch[51]=\"");
      out.print( pageArchFData.getWord("Unable to delete non empty site.**This site contains recording server"));
      out.write("\";\r\n");
      out.write("arch[52]=\"");
      out.print( pageArchFData.getWord("Unable to delete non empty site.**This site contains encryption server"));
      out.write("\";\r\n");
      out.write("arch[53]=\"");
      out.print( pageArchFData.getWord("Warning !Your are about to delete the"));
      out.write("\";\r\n");
      out.write("arch[54]=\"");
      out.print( pageArchFData.getWord(" site.**Do you want to continue?"));
      out.write("\";\r\n");
      out.write("arch[55]=\"");
      out.print( pageArchFData.getWord("Please wait for site deletion!"));
      out.write("\";\r\n");
      out.write("arch[56]=\"");
      out.print( pageArchFData.getWord("No site was associated with the new switch"));
      out.write("\";\r\n");
      out.write("arch[57]=\"");
      out.print( pageArchFData.getWord("Specify switch name"));
      out.write("\";\r\n");
      out.write("arch[58]=\"");
      out.print( pageArchFData.getWord("Specify switch password"));
      out.write("\";\r\n");
      out.write("arch[59]=\"");
      out.print( pageArchFData.getWord("Specify switch internal host name or ip address"));
      out.write("\";\r\n");
      out.write("arch[60]=\"");
      out.print( pageArchFData.getWord("Invalid switch internal port"));
      out.write("\";\r\n");
      out.write("arch[61]=\"");
      out.print( pageArchFData.getWord("Specify switch external host name or ip adresss"));
      out.write("\";\r\n");
      out.write("arch[62]=\"");
      out.print( pageArchFData.getWord("Invalid load balance for agents"));
      out.write("\";\r\n");
      out.write("arch[63]=\"");
      out.print( pageArchFData.getWord("Invalid load balance for outbound"));
      out.write("\";\r\n");
      out.write("arch[64]=\"");
      out.print( pageArchFData.getWord("Error: Switch "));
      out.write("\";\r\n");
      out.write("arch[65]=\"");
      out.print( pageArchFData.getWord("already exists"));
      out.write("\";\r\n");
      out.write("arch[66]=\"");
      out.print( pageArchFData.getWord("Please wait for switch creation"));
      out.write("\";\r\n");
      out.write("arch[67]=\"");
      out.print( pageArchFData.getWord("Please wait for switch modification"));
      out.write("\";\r\n");
      out.write("arch[68]=\"");
      out.print( pageArchFData.getWord("Error: No specification about the switch name"));
      out.write("\";\r\n");
      out.write("arch[69]=\"");
      out.print( pageArchFData.getWord("switch.**Do you want to continue?"));
      out.write("\";\r\n");
      out.write("arch[70]=\"");
      out.print( pageArchFData.getWord("Error: Unknow switch "));
      out.write("\";\r\n");
      out.write("arch[71]=\"");
      out.print( pageArchFData.getWord("Please wait while deleting switch"));
      out.write("\";\r\n");
      out.write("arch[72]=\"");
      out.print( pageArchFData.getWord("No site was associated with the new encryption server"));
      out.write("\";\r\n");
      out.write("arch[73]=\"");
      out.print( pageArchFData.getWord("Specify the encryption server name"));
      out.write("\";\r\n");
      out.write("arch[74]=\"");
      out.print( pageArchFData.getWord("Specify encryption server protocol"));
      out.write("\";\r\n");
      out.write("arch[75]=\"");
      out.print( pageArchFData.getWord("Specify encryption server internal host"));
      out.write("\";\r\n");
      out.write("arch[76]=\"");
      out.print( pageArchFData.getWord("Specify encryption server external host"));
      out.write("\";\r\n");
      out.write("arch[77]=\"");
      out.print( pageArchFData.getWord("Specify encryption server url"));
      out.write("\";\r\n");
      out.write("arch[78]=\"");
      out.print( pageArchFData.getWord("Specify encryption server internal port"));
      out.write("\";\r\n");
      out.write("arch[79]=\"");
      out.print( pageArchFData.getWord("Specify encryption server external port"));
      out.write("\";\r\n");
      out.write("arch[80]=\"");
      out.print( pageArchFData.getWord("Error: Encryption server"));
      out.write("\";\r\n");
      out.write("arch[81]=\"");
      out.print( pageArchFData.getWord("Specify the site name"));
      out.write("\";\r\n");
      out.write("arch[82]=\"");
      out.print( pageArchFData.getWord("Specify the server name"));
      out.write("\";\r\n");
      out.write("arch[83]=\"");
      out.print( pageArchFData.getWord("Specify server password"));
      out.write("\";\r\n");
      out.write("arch[84]=\"");
      out.print( pageArchFData.getWord("Specify the server internal host"));
      out.write("\";\r\n");
      out.write("arch[85]=\"");
      out.print( pageArchFData.getWord("Specify the server internal port"));
      out.write("\";\r\n");
      out.write("arch[86]=\"");
      out.print( pageArchFData.getWord("Specify the server internal port for secure communications"));
      out.write("\";\r\n");
      out.write("arch[87]=\"");
      out.print( pageArchFData.getWord("Specify the server external host"));
      out.write("\";\r\n");
      out.write("arch[88]=\"");
      out.print( pageArchFData.getWord("Specify the server external port"));
      out.write("\";\r\n");
      out.write("arch[89]=\"");
      out.print( pageArchFData.getWord("Specify the server external port for secure communications"));
      out.write("\";\r\n");
      out.write("arch[90]=\"");
      out.print( pageArchFData.getWord("Specify the local directory for recordings"));
      out.write("\";\r\n");
      out.write("arch[91]=\"");
      out.print( pageArchFData.getWord("Specify the directory for sales recordings"));
      out.write("\";\r\n");
      out.write("arch[92]=\"");
      out.print( pageArchFData.getWord("Specify the directory for no sales recordings"));
      out.write("\";\r\n");
      out.write("arch[93]=\"");
      out.print( pageArchFData.getWord("Specify the load balance for agents"));
      out.write("\";\r\n");
      out.write("arch[94]=\"");
      out.print( pageArchFData.getWord("Specify the sync. time or uncheck the synchronization option"));
      out.write("\";\r\n");
      out.write("arch[95]=\"");
      out.print( pageArchFData.getWord("Specify the master or uncheck the synchronization option"));
      out.write("\";\r\n");
      out.write("arch[96]=\"");
      out.print( pageArchFData.getWord("Please, set synchronisation time in HH:mm format, 5 characters needed!"));
      out.write("\";\r\n");
      out.write("arch[97]=\"");
      out.print( pageArchFData.getWord("Please, invalid synchronisation time, numbers required!"));
      out.write("\";\r\n");
      out.write("arch[98]=\"");
      out.print( pageArchFData.getWord("Invalid synchronisation time"));
      out.write("\";\r\n");
      out.write("arch[99]=\"");
      out.print( pageArchFData.getWord("Specify the URL under TOMCAT for recordings"));
      out.write("\";\r\n");
      out.write("arch[100]=\"");
      out.print( pageArchFData.getWord("A recording server "));
      out.write("\";\r\n");
      out.write("arch[101]=\"");
      out.print( pageArchFData.getWord("Error: Recording server"));
      out.write("\";\r\n");
      out.write("arch[102]=\"");
      out.print( pageArchFData.getWord("Please wait while modifying new recording server"));
      out.write("\";\r\n");
      out.write("arch[103]=\"");
      out.print( pageArchFData.getWord("Site Configuration"));
      out.write("\";\r\n");
      out.write("arch[104]=\"");
      out.print( pageArchFData.getWord("Delete"));
      out.write("\";\r\n");
      out.write("arch[105]=\"");
      out.print( pageArchFData.getWord("Cti Live Statistics"));
      out.write("\";\r\n");
      out.write("arch[106]=\"");
      out.print( pageArchFData.getWord("Configured"));
      out.write("\";\r\n");
      out.write("arch[107]=\"");
      out.print( pageArchFData.getWord("Connected"));
      out.write("\";\r\n");
      out.write("arch[108]=\"");
      out.print( pageArchFData.getWord("Managers"));
      out.write("\";\r\n");
      out.write("arch[109]=\"");
      out.print( pageArchFData.getWord("Agent"));
      out.write("\";\r\n");
      out.write("arch[110]=\"");
      out.print( pageArchFData.getWord("Switch"));
      out.write("\";\r\n");
      out.write("arch[111]=\"");
      out.print( pageArchFData.getWord("Recording servers"));
      out.write("\";\r\n");
      out.write("arch[112]=\"");
      out.print( pageArchFData.getWord("Encryption servers"));
      out.write("\";\r\n");
      out.write("arch[113]=\"");
      out.print( pageArchFData.getWord("Modify Switch"));
      out.write("\";\r\n");
      out.write("arch[114]=\"");
      out.print( pageArchFData.getWord("Update"));
      out.write("\";\r\n");
      out.write("arch[115]=\"");
      out.print( pageArchFData.getWord("Switch Statistics"));
      out.write("\";\r\n");
      out.write("arch[116]=\"");
      out.print( pageArchFData.getWord("Status"));
      out.write("\";\r\n");
      out.write("arch[117]=\"");
      out.print( pageArchFData.getWord("Since"));
      out.write("\";\r\n");
      out.write("arch[118]=\"");
      out.print( pageArchFData.getWord("Agents"));
      out.write("\";\r\n");
      out.write("arch[119]=\"");
      out.print( pageArchFData.getWord("Inbound calls"));
      out.write("\";\r\n");
      out.write("arch[120]=\"");
      out.print( pageArchFData.getWord("Outbound dials"));
      out.write("\";\r\n");
      out.write("arch[125]=\"");
      out.print( pageArchFData.getWord("Lines usage"));
      out.write("\";\r\n");
      out.write("arch[126]=\"");
      out.print( pageArchFData.getWord("Used. "));
      out.write("\";\r\n");
      out.write("arch[127]=\"");
      out.print( pageArchFData.getWord("Total. "));
      out.write("\";\r\n");
      out.write("arch[128]=\"");
      out.print( pageArchFData.getWord("Modify encryption server"));
      out.write("\";\r\n");
      out.write("arch[129]=\"");
      out.print( pageArchFData.getWord("Modify recording server"));
      out.write("\";\r\n");
      out.write("arch[130]=\"");
      out.print( pageArchFData.getWord("Modify"));
      out.write("\";\r\n");
      out.write("arch[131]=\"");
      out.print( pageArchFData.getWord("Recording Server Statistics"));
      out.write("\";\r\n");
      out.write("arch[132]=\"");
      out.print( pageArchFData.getWord("Total recordings"));
      out.write("\";\r\n");
      out.write("arch[133]=\"");
      out.print( pageArchFData.getWord("Daily Total recordings"));
      out.write("\";\r\n");
      out.write("arch[134]=\"");
      out.print( pageArchFData.getWord("Disk usage"));
      out.write("\";\r\n");
      out.write("arch[135]=\"");
      out.print( pageArchFData.getWord("Rem. "));
      out.write("\";\r\n");
      out.write("arch[136]=\"");
      out.print( pageArchFData.getWord("GB"));
      out.write("\";\r\n");
      out.write("arch[137]=\"");
      out.print( pageArchFData.getWord("Disconnected"));
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("var arr_months = new Array();\r\n");
      out.write("arr_months[\"January\"]=\"");
      out.print( pageArchFData.getWord("January"));
      out.write("\";\r\n");
      out.write("arr_months[\"February\"]=\"");
      out.print( pageArchFData.getWord("February"));
      out.write("\";\r\n");
      out.write("arr_months[\"March\"]=\"");
      out.print( pageArchFData.getWord("March"));
      out.write("\";\r\n");
      out.write("arr_months[\"April\"]=\"");
      out.print( pageArchFData.getWord("April"));
      out.write("\";\r\n");
      out.write("arr_months[\"May\"]=\"");
      out.print( pageArchFData.getWord("May"));
      out.write("\";\r\n");
      out.write("arr_months[\"June\"]=\"");
      out.print( pageArchFData.getWord("June"));
      out.write("\";\r\n");
      out.write("arr_months[\"July\"]=\"");
      out.print( pageArchFData.getWord("July"));
      out.write("\";\r\n");
      out.write("arr_months[\"August\"]=\"");
      out.print( pageArchFData.getWord("August"));
      out.write("\";\r\n");
      out.write("arr_months[\"September\"]=\"");
      out.print( pageArchFData.getWord("September"));
      out.write("\";\r\n");
      out.write("arr_months[\"October\"]=\"");
      out.print( pageArchFData.getWord("October"));
      out.write("\";\r\n");
      out.write("arr_months[\"November\"]=\"");
      out.print( pageArchFData.getWord("November"));
      out.write("\";\r\n");
      out.write("arr_months[\"December\"]=\"");
      out.print( pageArchFData.getWord("December"));
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageArchFData.closeConnection();
      out.write('\r');
      out.write('\n');

////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();

      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n");
      out.write("<title>Architecture1</title>\r\n");
      out.write("<link href=\"architectureStyle.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link href=\"office_xp.css\"\t\t\trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"wz_jsgraphics.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"archjsdomenu.config.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"archjsdomenu.inc.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"jsdomenu.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"archClasses.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"archdlgs.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"architectureFunctions.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"xparse.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"xmlDomFunctions.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- Menu Files -->\r\n");
      out.write("<style>\r\n");
      out.write("#nav{list-style: none; }\r\n");
      out.write("\r\n");
      out.write(" #nav ul { \r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\tmargin:0;\r\n");
      out.write("\tlist-style: none;\r\n");
      out.write("    width:12em;\r\n");
      out.write("    z-index:99;\r\n");
      out.write("    position:relative;\r\n");
      out.write("    overflow:visible;  \r\n");
      out.write("   }\r\n");
      out.write("\r\n");
      out.write("#nav li { \r\n");
      out.write("    margin:0;   \r\n");
      out.write("    position: relative; \r\n");
      out.write("    float:left;\r\n");
      out.write("\twidth: 12em;\r\n");
      out.write("\tbackground-color:#DFDFDF;\r\n");
      out.write("    border:solid 1px #CECECE;\r\n");
      out.write("    display:block;\r\n");
      out.write("    height:auto;\r\n");
      out.write("}\r\n");
      out.write("#nav ul li{ background-color:#DFDFDF;}\r\n");
      out.write("\r\n");
      out.write("#nav ul li{ border-width:1px 1px 0 0;}\r\n");
      out.write("#nav ul ul li{ border-width:1px 1px 0 1px;}\r\n");
      out.write("#nav ul ul li:last-child{border-width:1px;}\r\n");
      out.write(" \r\n");
      out.write("#nav a {\r\n");
      out.write("    text-decoration:none; \r\n");
      out.write("    display:block;\r\n");
      out.write("    padding: 0.1em;  \r\n");
      out.write("    margin:0.2em 0 0.2em 0.1em; \r\n");
      out.write("    width:11.5em; \r\n");
      out.write("    height:1.05em;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#nav a:hover, #nav li:hover{\r\n");
      out.write("    background-color:#DFDFDF; \r\n");
      out.write("}\r\n");
      out.write("#nav ul li:hover, #nav ul li a:hover{ background-color:#DFDFDF;}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("#nav ul{\r\n");
      out.write("    display:none;   \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*all see this */\r\n");
      out.write("#nav ul ul, #nav ul ul ul{\r\n");
      out.write("    display:none; \r\n");
      out.write("    position:absolute; \r\n");
      out.write("    margin-top:-1.8em; \r\n");
      out.write("    margin-left:12em;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* non-IE browsers see this */\r\n");
      out.write(" #nav ul li>ul, #nav ul ul li>ul{\r\n");
      out.write("    margin-top:-1.4em; \r\n");
      out.write(" }\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("#nav li:hover ul ul, #nav li:hover ul ul ul, #nav li:hover ul ul ul ul, #nav li:hover ul ul ul ul ul{\r\n");
      out.write("    display:none; \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#nav li:hover ul, #nav ul li:hover ul, #nav ul ul li:hover ul, #nav ul ul ul li:hover ul, #nav ul ul ul ul li:hover ul{\r\n");
      out.write("    display:block;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("li>ul { \r\n");
      out.write("\ttop: auto;\r\n");
      out.write("\tleft: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(" #holdm{position:absolute; top:150px; left:20px; z-index:100; width:80%;}\r\n");
      out.write("</style>\r\n");
      out.write("<script>\r\n");
      out.write("activateMenu = function(nav) {\r\n");
      out.write("\t\r\n");
      out.write("    /* currentStyle restricts the Javascript to IE only */\r\n");
      out.write("\tif (document.all && document.getElementById(nav).currentStyle) {  \r\n");
      out.write("        var navroot = document.getElementById(nav);\r\n");
      out.write("        \r\n");
      out.write("        /* Get all the list items within the menu */\r\n");
      out.write("        var lis=navroot.getElementsByTagName(\"LI\");  \r\n");
      out.write("        for (i=0; i<lis.length; i++) \r\n");
      out.write("\t\t{\r\n");
      out.write("        \r\n");
      out.write("           /* If the LI has another menu level */\r\n");
      out.write("            if(lis[i].lastChild.tagName==\"UL\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("            \r\n");
      out.write("                /* assign the function to the LI */\r\n");
      out.write("             \tlis[i].onmouseover=function() \r\n");
      out.write("\t\t\t\t{\t\r\n");
      out.write("                \r\n");
      out.write("                   /* display the inner menu */\r\n");
      out.write("                   this.lastChild.style.display=\"block\";\r\n");
      out.write("                }\r\n");
      out.write("                lis[i].onmouseout=function() {                       \r\n");
      out.write("                   this.lastChild.style.display=\"none\";\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<!-- ~~~ Menu Files ~~~ -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"config_body\" onLoad=\"initjsDOMenu()\">\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"wz_dragdrop.js\"></script>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"topmenu\" style=\"position:absolute;height:3%;width:100%; z-index:20\">\r\n");
      out.write("\t\t<!--<a href=\"javascript:addRecordingServer()\">function01</a> | <a href=\"javascript:addEncryption()\">function02</a> | <a href=\"javascript:document.location='architecture.htm'\">function03</a>-->\r\n");
      out.write("\t\t<ul id=\"nav\">\r\n");
      out.write("         \r\n");
      out.write("    <li> <a href=\"#\" > \r\n");
      out.write("     ");
      out.print( pageData.getWord("Network"));
      out.write("\r\n");
      out.write("      </a> \r\n");
      out.write("      <ul>\r\n");
      out.write("        <!--<li><a href=\"javascript:saveWholeConfig()\" >Save Configuration</a></li>-->\r\n");
      out.write("        <li><a href=\"javascript:saveLayout()\" > \r\n");
      out.write("          ");
      out.print( pageData.getWord("Save layout"));
      out.write("\r\n");
      out.write("          </a></li>\r\n");
      out.write("        <li><a href=\"javascript:loadLayout()\" > \r\n");
      out.write("          ");
      out.print( pageData.getWord("Reset layout"));
      out.write("\r\n");
      out.write("          </a></li>\r\n");
      out.write("        <!--<li><a href=\"javascript:addLink(0,0,100,100, 'aaaa', 'bbbb')\" >function01</a></li>-->\r\n");
      out.write("      </ul>\r\n");
      out.write("    </li>\r\n");
      out.write("\t\t \r\n");
      out.write("    <li> <a href=\"#\" >Sites</a> \r\n");
      out.write("      <ul>\r\n");
      out.write("        <li><a href=\"javascript:addSite()\" > \r\n");
      out.write("          ");
      out.print( pageData.getWord("Add site"));
      out.write("\r\n");
      out.write("          </a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </li>\r\n");
      out.write("\t\t \r\n");
      out.write("    <li> <a href=\"javascript:\" > \r\n");
      out.write("      ");
      out.print( pageData.getWord("Servers"));
      out.write("\r\n");
      out.write("      &amp; \r\n");
      out.write("      ");
      out.print( pageData.getWord("Services"));
      out.write("\r\n");
      out.write("      </a> \r\n");
      out.write("      <ul>\r\n");
      out.write("        <li><a href=\"javascript:addSwitch()\" > \r\n");
      out.write("          ");
      out.print( pageData.getWord("Add pbx server"));
      out.write("\r\n");
      out.write("          </a></li>\r\n");
      out.write("        <li><a href=\"javascript:addRecordingServer()\" > \r\n");
      out.write("           ");
      out.print( pageData.getWord("Add recording server"));
      out.write("\r\n");
      out.write("          </a></li>\r\n");
      out.write("\t <script>\r\n");
      out.write("\t\tif(appletObj.getIsEncryptionServerAllowed()) {\r\n");
      out.write("        \t\tdocument.write (\"<li><a href='javascript:addEncryption()' >");
      out.print( pageData.getWord("Add encryption server"));
      out.write("</a></li>\");\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t  \tdocument.write (\"<li style='color:gray'>");
      out.print( pageData.getWord("Add encryption server"));
      out.write("</li>\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\t\r\n");
      out.write("        <li><a href=\"javascript:displayCtiServerLiveStats()\" > \r\n");
      out.write("          ");
      out.print( pageData.getWord("Statistics"));
      out.write("\r\n");
      out.write("          </a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </li>\r\n");
      out.write("\t\t \r\n");
      out.write("     \t</ul>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("<div id=\"diagram\" class=\"diagram\"  style=\"position:relative;height:97%;width:100%;\">\t\r\n");
      out.write("</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- \t  Dialogs   \t--> <!--\r\n");
      out.write("\t<div id=\"dlgNewSite\" class=\"dlgNewSite\">\r\n");
      out.write("\t\t<table>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"middleText\">Create a new site</td><td><img src=\"../img/close2.gif\" width=\"15\" height=\"15\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\t\r\n");
      out.write("\t</div>\t-->\r\n");
      out.write("\t<!-- \t~~Dialogs~~ \t-->\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\tcurrentGraphic = new jsGraphics('diagram');\r\n");
      out.write("\t\tSET_DHTML(\"diagram\"+NO_DRAG);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tsetTimeout('initialize()', 200);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tactivateMenu('nav'); \r\n");
      out.write("\t\tappletObj.sendPbxStatsRequest()\r\n");
      out.write("\t\tsetInterval(\"appletObj.sendPbxStatsRequest()\", 7000);\r\n");
      out.write("\t\t\r\n");
      out.write("\t</script>\r\n");
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
