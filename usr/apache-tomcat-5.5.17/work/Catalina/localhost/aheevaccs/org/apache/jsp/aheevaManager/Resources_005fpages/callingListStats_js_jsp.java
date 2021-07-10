package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import aheevaManager.ressources.beanImportCallingListTask;
import aheevaManager.ressources.beanLoadCallingList;
import java.util.*;

public final class callingListStats_js_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	if(request.getParameter("actionType") != null)
	{
		if(request.getParameter("actionType").compareTo("GetStatistics") == 0)
		{
			int n_rowsProcessed 	= 0;
			int n_rowsSuccesFull 	= 0;
			int n_rowsOnError		= 0;
			int m_rowsToInsert		= 0;
			String n_percentCompletedStr = "0.00%";
			double n_percentCompleted = 0.00;
			String n_currentStatus = "";
			long curentElapsedTime  = 0;
			if( session.getAttribute("loadingTask") != null )
			{		
				beanImportCallingListTask loadingTask = (beanImportCallingListTask) session.getAttribute("loadingTask");
				System.out.println("CallingStats: loadingTask is in the session");
				m_rowsToInsert 			= loadingTask.m_rowsToInsert;
				n_rowsProcessed 		= loadingTask.n_rowsProcessed;
				n_rowsSuccesFull 		= loadingTask.n_rowsSuccesFull;
				n_rowsOnError 			= loadingTask.n_rowsOnError;
				n_percentCompletedStr 	= loadingTask.getStrPercentCompleted();
				n_percentCompleted		= loadingTask.getPercentCompleted();
				n_currentStatus			= loadingTask.m_currentStatus;
				curentElapsedTime		= loadingTask.getLoadingElaspedTime();
			}
			else
				System.out.println("CallingStats: loadingTask is not in the session");
			
			out.write("totalRowsToInsert 	= "+m_rowsToInsert+";");
			out.write("totalProceed 		= "+n_rowsProcessed+";");
			out.write("totalSuccess 		= "+n_rowsSuccesFull+";");
			out.write("totalErrors 			= "+n_rowsOnError+";");
			out.write("totalPercentComplStr = \""+n_percentCompletedStr+"\";");			
			out.write("totalPercentCompl 	= "+n_percentCompleted+";");
			out.write("loadingCurrentStatus = \""+n_currentStatus+"\";");
			out.write("totalcurentElapsedTime= "+curentElapsedTime+";");
			System.out.println("CallingStats: totalRowsToInsert["+m_rowsToInsert+"] totalProceed["+n_rowsProcessed+"] totalSuccess["+n_rowsSuccesFull+"] totalErrors["+n_rowsOnError+"]");
			out.flush();
		}
		else if(request.getParameter("actionType").compareTo("ChangeStatus") == 0)
		{
			if( session.getAttribute("loadingTask") != null )
			{
				beanImportCallingListTask loadingTask = (beanImportCallingListTask) session.getAttribute("loadingTask");
				loadingTask.m_currentStatus = request.getParameter("newStatus");
			}
			else
				System.out.println("CallingStats: loadingTask is not in the session");
		}
		else if(request.getParameter("actionType").compareTo("GetErrorsLog") == 0)
		{
			if( session.getAttribute("loadingTask") != null )
			{
				beanImportCallingListTask loadingTask = (beanImportCallingListTask) session.getAttribute("loadingTask");
				StringBuffer buf = loadingTask.getStrBufLogErrors();
				out.write("errorLogText = "+buf+";");
				out.flush();
			}
			else
				System.out.println("CallingStats: loadingTask is not in the session");
		}
		
	}
	else
		System.out.println("CallingStats: actionType is null");

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
