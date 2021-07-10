<%@ page contentType="text/javascript" language="java" %>
<%@ page language="java" import="aheevaManager.ressources.beanImportCallingListTask, aheevaManager.ressources.beanLoadCallingList, java.util.*" %>

<%
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
%>