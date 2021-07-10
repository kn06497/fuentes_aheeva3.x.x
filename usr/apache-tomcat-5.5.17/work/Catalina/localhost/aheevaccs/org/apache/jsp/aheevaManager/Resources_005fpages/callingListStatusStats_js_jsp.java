package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.beanCallingListAfterQueries;
import aheevaManager.ressources.beanLoadCallingList;
import java.util.*;

public final class callingListStatusStats_js_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/javascript");
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

	System.out.println("CallingListStatus: Getting Stats");	
	if(request.getParameter("actionType") != null)
	{		
		if(request.getParameter("actionType").compareTo("GetStatistics") == 0)
		{					
			if( session.getAttribute("queryThread") != null )
			{				
				beanCallingListAfterQueries beanQuery = (beanCallingListAfterQueries) session.getAttribute("beanAfterQueries");
				out.write("tableOfQueriesStatus[\"DAILY HOURS\"] = \""+beanQuery.getStatus("DAILY HOURS")+"\"; ");
				out.write("tableOfQueriesStatus[\"EXTRA DATA\"] = \""+beanQuery.getStatus("EXTRA DATA")+"\"; ");
				out.write("tableOfQueriesStatus[\"NON_NUMERIC_PHONES\"] = \""+beanQuery.getStatus("NON_NUMERIC_PHONES")+"\"; ");
				out.write("tableOfQueriesStatus[\"PREFIX_RULES\"] = \""+beanQuery.getStatus("PREFIX_RULES")+"\"; ");
				out.write("tableOfQueriesStatus[\"TIME_ZONE_SETUP\"] = \""+beanQuery.getStatus("TIME_ZONE_SETUP")+"\"; ");
				out.write("tableOfQueriesMessages[\"DAILY HOURS\"] = \""+beanQuery.getStatusMessage("DAILY HOURS")+"\"; ");
				out.write("tableOfQueriesMessages[\"EXTRA DATA\"] = \""+beanQuery.getStatusMessage("EXTRA DATA")+"\"; ");
				out.write("tableOfQueriesMessages[\"NON_NUMERIC_PHONES\"] = \""+beanQuery.getStatusMessage("NON_NUMERIC_PHONES")+"\"; ");
				out.write("tableOfQueriesMessages[\"PREFIX_RULES\"] = \""+beanQuery.getStatusMessage("PREFIX_RULES")+"\"; ");
				out.write("tableOfQueriesMessages[\"TIME_ZONE_SETUP\"] = \""+beanQuery.getStatusMessage("TIME_ZONE_SETUP")+"\"; ");				
				out.flush();								
			}
			else
			{
				System.out.println("CallingListStatus: queryThread is not in session");				
			}
		}
		else
		{
			System.out.println("CallingListStatus: Unsupported Action");	
		}
	}
	else
	{
		System.out.println("CallingListStatus: actionType is null");
	}

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
