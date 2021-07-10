package org.apache.jsp.aheevaManager.Resources_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.io.*;
import aheevaManager.csvinterface.*;
import aheevaManager.ressources.*;
import javazoom.upload.*;
import java.util.*;
import jxl.*;
import aheevaManager.ressources.*;

public final class addCallingList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


	/*Custom functions....*/
	Vector readCSVFile(String input, String csv_delimiter, String csv_quote, int maxLineToLoadFromFile) 
	{
		Vector returnVect = new Vector();
		char delim='X' ;
		char quote='X' ;
		int max_count=0;
		try{
			if(csv_delimiter.compareTo(";")==0)
					delim =';';
			else if(csv_delimiter.compareTo(",")==0)
					delim =',';
			else if(csv_delimiter.compareTo("tab")==0)
					delim ='\t';
			else if(csv_delimiter.compareTo("space")==0)
					delim =' ';
			else 
				System.out.println("On ne devrait jamais arriver ici!! Delimiter: "+csv_delimiter);
			
			if(csv_quote.compareTo("single")==0)
					quote ='\'';
			else if(csv_quote.compareTo("double")==0)
					quote='\"';
			else
				System.out.println("On ne devrait jamais arriver ici!! Quote: "+csv_quote);
			
			if(delim !='X' &&  quote !='X'){
			
				aheevaManager.csvinterface.CSVFileReader in = new CSVFileReader(input, delim, quote);
				aheevaManager.csvinterface.CSVFileWriter pout = new CSVFileWriter("csv_out.txt");
			
				Vector<String> fields = in.readFields();
				returnVect.addElement(fields);		
				while(fields!=null && max_count < maxLineToLoadFromFile ) {
				  pout.writeFields(fields);
				  //System.out.println(fields);
				  fields = in.readFields();
				  if(fields!=null)
				 	 returnVect.addElement(fields);
				  max_count++;
				}
				System.out.println("returnVectSize: "+returnVect.size());
				in.close();
				pout.close();
			}		
	  }
	  catch(Exception e)
	  {
	  	e.printStackTrace();
	  }
		
		return returnVect;
	}
	
	/*
	int getCSVFileLine(BufferedReader in)
	{
		int iReturn = 0;
		String line = new String("");
		try
		{	
			while((line = in.readLine()) != null)
				iReturn++;
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
				
		return iReturn;	
	}
	*/
	
	Vector parseCsvLine(String str, String csv_quote, String csv_delimiter)
	{
		System.out.println("DEBUG: "+csv_quote);
		System.out.println("DEBUG: "+csv_delimiter);
		Vector vReturn = new Vector();
		if(str.length() != 0)
		{
			str = str.trim();
			// make sure the line does not contain 2 comma
			// first remove all trailing comma
			while(true)
			{
				if(str.lastIndexOf(csv_delimiter) == str.length()-1)
					str = str.substring(0,str.length()-1);
				else
					break;
			}
			while(true)
			{
				int pos = str.indexOf(csv_delimiter+csv_delimiter);
				if(pos != -1)
				{
					str = str.substring(0,pos+1)+"n/a"+str.substring(pos+1);
				}
				else
					break;				
		
			}
			// Now verify if we have double quotes in the line
			// If we do, we want to make sure to remove it and replace it with single quote
			// along with the comma
			int pos = str.indexOf(csv_quote);
			if(pos != -1)
			{
				int pos1 = str.indexOf(csv_delimiter,pos);
				int pos2 = str.indexOf(csv_quote,pos+1);                    
				if((pos1 != -1) && (pos1 < pos2))
				{
					str = str.substring(0,pos1)+" "+str.substring(pos1+1);                        
				}
				// now remove all double quote and replace it with single quote
				while(true)
				{
					pos = str.indexOf(csv_quote);
					if(pos == -1)
						break;
					else
						str = str.substring(0,pos)+"'"+str.substring(pos+1);
				}                    
			}
			
			java.util.StringTokenizer token = new java.util.StringTokenizer(str, csv_delimiter);                
			Vector thisLineVector = new Vector();
			while(token.hasMoreTokens())
			{
				vReturn.addElement( token.nextToken() );                    
			}	
		}
		
		
		return vReturn;	
	}
		
	/** This function returns if a String is a number, a float, a double or a long*/
	boolean isANumber(String daString)
	{
		boolean toBeReturn = true;
		try
		{
			Integer.parseInt(daString);
		}
		catch(Exception e)
		{
			toBeReturn = false;
		}
		return toBeReturn;
	}
	
	Vector getAllExtraDatas()
	{
		Vector vReturn = new Vector();		
		/*java.sql.Connection conn = null;
		java.sql.Statement stat = null;
		DataSource          m_ds = null;	
			
		try
		{
			Context init = new InitialContext();
			Context ctx = (Context) init.lookup("java:comp/env");
			if (ctx == null) 
			{
				throw new Exception("Boom - No Context");
			}			
			m_ds = (DataSource) ctx.lookup("jdbc/aheevaccs");
			if (m_ds != null) 
			{
				System.out.println("Got Context");
			}
			conn = m_ds.getConnection();
			stat = conn.createStatement();			
			String getTableNames = "SELECT DISTINCT TABLE_NAME FROM CFG_CALLING_LIST";
			java.sql.ResultSet rs_names = stat.executeQuery(getTableNames);
			java.sql.ResultSet rs_extradatas = null;
			java.sql.Statement  stat2 = conn.createStatement();
			while( rs_names.next() )
			{
				String getExtraDataFromThisTable = "SELECT DISTINCT EXTRADATA FROM "+rs_names.getString("TABLE_NAME");
				rs_extradatas = stat2.executeQuery(getExtraDataFromThisTable);
				while(rs_extradatas.next())
				{
					if(!vReturn.contains(rs_extradatas.getString("EXTRADATA")))
						vReturn.addElement( rs_extradatas.getString("EXTRADATA") );
				}
			}
			rs_names.close();
			if(rs_extradatas != null)
				rs_extradatas.close();
			conn.close();
			stat.close();
			stat2.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				conn.close();
				stat.close();				
			}
			catch(Exception ee)
			{
				//
				ee.printStackTrace();
			}
		}*/
		
		return vReturn;
	}
	
	String getXlsColName(int colnum)
	{
		//work to ZZ
		String sRet = "";
		int a_ascii = 65;
		int alpha_limit = 26;
		int limit = 26*26;
		
		if(colnum > limit)
			return "";
		else
		{
			if(colnum < alpha_limit)
			{
				sRet = String.valueOf((char) (a_ascii + colnum));
			}
			else
			{
				int col1 = (colnum / alpha_limit) - 1;
				sRet = String.valueOf((char) (col1));
				col1 = colnum - alpha_limit*col1;				
				sRet += String.valueOf((char) (col1));
			}
		}			
				
		return sRet;	
	}


  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aheevaManager/Resources_pages/callingListFuncs_labels.jsp");
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
      out.write("<title>AheevaCCS - Add Callinglist</title>\r\n");
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
 	
	String directory = request.getRealPath("Manager/uploads"); 
	String tmpdirectory = request.getRealPath("Manager/uploads"); 	

      out.write('\r');
      out.write('\n');
 	boolean createsubfolders = true; 
      out.write("\r\n");
      out.write("\r\n");

	beanManagerData AddCalLstData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		AddCalLstData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

	String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
	
	String tenantDbid = request.getParameter("tenant_dbid");

	String userAssignedTenants = "(SELECT USER_DBID FROM cfg_user_authorize_ressources WHERE RESSOURCE_TYPE='TENANT' AND RESSOURCE_DBID='"+tenantDbid+"')";
	String listNotAllowedUsersQuery = "SELECT DBID AS USER_DBID, USERNAME FROM cfg_user WHERE ALLOW_CALLING_LIST_MANAGEMENT='yes' AND state='1' "+
		"AND DBID != "+currentUserDbid+" AND DBID IN "+userAssignedTenants+" ORDER BY USERNAME";
	String userRightsQuery = "SELECT USERNAME, ALLOW_USER_MANAGEMENT, ALLOW_CALLING_LIST_MANAGEMENT FROM cfg_user WHERE DBID='"+currentUserDbid+"'";

	AddCalLstData.openConnection();
	AddCalLstData.executeFromString(listNotAllowedUsersQuery);
	Vector <HashMap> listNotAllowedUsersDataResult = AddCalLstData.CreateVectorFromBean();
	AddCalLstData.executeFromString(userRightsQuery);
	Vector <HashMap> userRightsDataResult = AddCalLstData.CreateVectorFromBean();
	

	String currentUserName = (String)userRightsDataResult.elementAt(0).get("USERNAME");
	boolean userManagementAllowed = AddCalLstData.userHasRight(userRightsDataResult, "ALLOW_USER_MANAGEMENT");
	if(!AddCalLstData.userHasRight(userRightsDataResult, "ALLOW_CALLING_LIST_MANAGEMENT"))
	{ 
      out.write("\r\n");
      out.write("\t\t");
      if (true) {
        _jspx_page_context.forward("forbidden.jsp");
        return;
      }
      out.write('\r');
      out.write('\n');
	} 
      out.write("\r\n");
      out.write("\r\n");
      javazoom.upload.UploadBean upBean = null;
      synchronized (_jspx_page_context) {
        upBean = (javazoom.upload.UploadBean) _jspx_page_context.getAttribute("upBean", PageContext.PAGE_SCOPE);
        if (upBean == null){
          upBean = new javazoom.upload.UploadBean();
          _jspx_page_context.setAttribute("upBean", upBean, PageContext.PAGE_SCOPE);
          out.write("\r\n");
          out.write("  ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("upBean"), "folderstore",
 directory );
          out.write("\r\n");
          out.write("  ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("upBean"), "parser",
 MultipartFormDataRequest.CFUPARSER );
          out.write("\r\n");
          out.write("  ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("upBean"), "parsertmpdir",
 tmpdirectory );
          out.write("\r\n");
          out.write("  ");
          org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("upBean"), "overwrite", "true", null, null, false);
          out.write("\r\n");
          out.write("  ");
          org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("upBean"), "filesizelimit", "8589934592", null, null, false);
          out.write('\r');
          out.write('\n');
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	//Setup variables...
	String newCList_step 	= "1";
	String tenant_dbid 		= "NULL";
	String list_name 		= "";
	String source_file_name = "";
	String csv_quote 		= "";
	String csv_delimiter 	= "";
	String file_extension 	= "";
	String table_name 		= "";
	String tableFieldsStr 	= "";
	String assocVectorStr 	= "";
	String file_path 		= "";
	String rows_to_skip 	= "";
	String dialing_from 	= "";
	String dialing_to		= "";
	String hoursapplyto		= "";
	String phone_prefix_rule= "";
	String cList_extrada	= "";
	String extradataapplyto = "";
	String phone_purification_non_numeric = "";
	String phone_purification_blackListRules = "";
	String timeZoneRulesStr = "";
	String timeZoneRulesApplyto = "";
	String format_to_use 	= "";
		
	
	if (MultipartFormDataRequest.isMultipartFormData(request))
   	{
       // Uses MultipartFormDataRequest to parse the HTTP request.
       MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
	   if( mrequest.getParameter("newCList_step") != null )
			newCList_step = (String)mrequest.getParameter("newCList_step");				
		if( mrequest.getParameter("tenant_dbid") != null )
			tenant_dbid = (String)mrequest.getParameter("tenant_dbid");					
		if( mrequest.getParameter("name") != null )
			list_name = (String)mrequest.getParameter("name");
		if( mrequest.getParameter("source_file_name") != null )
			source_file_name = (String)mrequest.getParameter("source_file_name");
		if( mrequest.getParameter("csv_quote") != null )
			csv_quote = (String)mrequest.getParameter("csv_quote");
		if( mrequest.getParameter("csv_delimiter") != null )
			csv_delimiter = (String)mrequest.getParameter("csv_delimiter");
		if( mrequest.getParameter("file_extension") != null )
			file_extension = (String)mrequest.getParameter("file_extension");
		if( mrequest.getParameter("table_name") != null )
			table_name = (String)mrequest.getParameter("table_name");
		if( mrequest.getParameter("associationVector_str") != null )
			assocVectorStr = (String)mrequest.getParameter("associationVector_str");
		if( mrequest.getParameter("tableFieldsVector_str") != null )
			tableFieldsStr = (String)mrequest.getParameter("tableFieldsVector_str");
		if( mrequest.getParameter("file_path") != null )
			file_path = (String)mrequest.getParameter("file_path");	
		if( mrequest.getParameter("rows_to_skip") != null )
			rows_to_skip = (String)mrequest.getParameter("rows_to_skip");
		if( mrequest.getParameter("dialing_from") != null )
			dialing_from = (String)mrequest.getParameter("dialing_from");
		if( mrequest.getParameter("dialing_to") != null )
			dialing_to = (String)mrequest.getParameter("dialing_to");
		if( mrequest.getParameter("hoursapplyto") != null )
			hoursapplyto = (String)mrequest.getParameter("hoursapplyto");
		if( mrequest.getParameter("cList_extrada") != null )
			cList_extrada = (String)mrequest.getParameter("cList_extrada");
		if( mrequest.getParameter("extradataapplyto") != null )
			extradataapplyto = (String)mrequest.getParameter("extradataapplyto");
		if( mrequest.getParameter("phone_purification_non_numeric") != null )
			phone_purification_non_numeric = (String)mrequest.getParameter("phone_purification_non_numeric");
		if( mrequest.getParameter("phone_purification_blackListRules") != null )
			phone_purification_blackListRules = (String)mrequest.getParameter("phone_purification_blackListRules");
		if( mrequest.getParameter("timeZoneRulesStr") != null )
			timeZoneRulesStr = (String)mrequest.getParameter("timeZoneRulesStr");
		if( mrequest.getParameter("timeZoneRulesApplyto") != null )
			timeZoneRulesApplyto = (String)mrequest.getParameter("timeZoneRulesApplyto");
		if( mrequest.getParameter("format_to_use") != null )
			format_to_use = (String)mrequest.getParameter("format_to_use");
		if( mrequest.getParameter("phone_prefix_rule") != null )
			phone_prefix_rule = (String)mrequest.getParameter("phone_prefix_rule");
			
			
		upBean.store(mrequest);     
	}
	else
	{
		if( request.getParameter("newCList_step") != null )
			newCList_step = (String)request.getParameter("newCList_step");				
		if( request.getParameter("tenant_dbid") != null )
			tenant_dbid = (String)request.getParameter("tenant_dbid");					
		if( request.getParameter("name") != null )
			list_name = (String)request.getParameter("name");
		if( request.getParameter("table_name") != null )
			table_name = (String)request.getParameter("table_name");
		if( request.getParameter("source_file_name") != null )
			source_file_name = (String)request.getParameter("source_file_name");
		if( request.getParameter("csv_quote") != null )
			csv_quote = (String)request.getParameter("csv_quote");
		if( request.getParameter("csv_delimiter") != null )
			csv_delimiter = (String)request.getParameter("csv_delimiter");
		if( request.getParameter("file_extension") != null )
			file_extension = (String)request.getParameter("file_extension");
		if( request.getParameter("associationVector_str") != null )
			assocVectorStr = (String)request.getParameter("associationVector_str");
		if( request.getParameter("tableFieldsVector_str") != null )
			tableFieldsStr = (String)request.getParameter("tableFieldsVector_str");
		if( request.getParameter("file_path") != null )
			file_path = (String)request.getParameter("file_path");
		if( request.getParameter("rows_to_skip") != null )
			rows_to_skip = (String)request.getParameter("rows_to_skip");
		if( request.getParameter("dialing_from") != null )
			dialing_from = (String)request.getParameter("dialing_from");
		if( request.getParameter("dialing_to") != null )
			dialing_to = (String)request.getParameter("dialing_to");
		if( request.getParameter("hoursapplyto") != null )
			hoursapplyto = (String)request.getParameter("hoursapplyto");
		if( request.getParameter("cList_extrada") != null )
			cList_extrada = (String)request.getParameter("cList_extrada");
		if( request.getParameter("extradataapplyto") != null )
			extradataapplyto = (String)request.getParameter("extradataapplyto");
		if( request.getParameter("phone_purification_non_numeric") != null )
			phone_purification_non_numeric = (String)request.getParameter("phone_purification_non_numeric");
		if( request.getParameter("phone_purification_blackListRules") != null )
			phone_purification_blackListRules = (String)request.getParameter("phone_purification_blackListRules");
		if( request.getParameter("timeZoneRulesStr") != null )
			timeZoneRulesStr = (String)request.getParameter("timeZoneRulesStr");
		if( request.getParameter("timeZoneRulesApplyto") != null )
			timeZoneRulesApplyto = (String)request.getParameter("timeZoneRulesApplyto");
		if( request.getParameter("format_to_use") != null )
			format_to_use = (String)request.getParameter("format_to_use");
		if( request.getParameter("phone_prefix_rule") != null )
			phone_prefix_rule = (String)request.getParameter("phone_prefix_rule");
	}
		
	out.write("<script>var newCList_step = \""+newCList_step+"\";</script>");
	
	if(newCList_step.compareTo("1") == 0)
	{
		session.removeAttribute("loadingTask");
		session.removeAttribute("beanCList");
		session.removeAttribute("beanAfterQueries");
	}

      out.write("\r\n");
      out.write("\r\n");
      aheevaManager.ressources.beanImportCallingListTask loadingTask = null;
      synchronized (session) {
        loadingTask = (aheevaManager.ressources.beanImportCallingListTask) _jspx_page_context.getAttribute("loadingTask", PageContext.SESSION_SCOPE);
        if (loadingTask == null){
          loadingTask = new aheevaManager.ressources.beanImportCallingListTask();
          _jspx_page_context.setAttribute("loadingTask", loadingTask, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      aheevaManager.ressources.beanLoadCallingList beanCList = null;
      synchronized (session) {
        beanCList = (aheevaManager.ressources.beanLoadCallingList) _jspx_page_context.getAttribute("beanCList", PageContext.SESSION_SCOPE);
        if (beanCList == null){
          beanCList = new aheevaManager.ressources.beanLoadCallingList();
          _jspx_page_context.setAttribute("beanCList", beanCList, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      aheevaManager.ressources.beanCallingListAfterQueries beanAfterQueries = null;
      synchronized (session) {
        beanAfterQueries = (aheevaManager.ressources.beanCallingListAfterQueries) _jspx_page_context.getAttribute("beanAfterQueries", PageContext.SESSION_SCOPE);
        if (beanAfterQueries == null){
          beanAfterQueries = new aheevaManager.ressources.beanCallingListAfterQueries();
          _jspx_page_context.setAttribute("beanAfterQueries", beanAfterQueries, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");

	//Setup the bean values
	if(beanCList.tenant_dbid.compareTo("") == 0)
		beanCList.tenant_dbid 		= tenant_dbid;
	if(list_name.compareTo("") != 0)
		beanCList.list_name			= list_name;
	if(beanCList.source_file_name.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.source_file_name 	= source_file_name;
	if(beanCList.csv_quote.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))	
		beanCList.csv_quote			= csv_quote;
	if(beanCList.csv_delimiter.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.csv_delimiter		= csv_delimiter;
	if(beanCList.file_extension.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.file_extension	= file_extension;
	if(beanCList.table_name.compareTo("") == 0)
		beanCList.table_name		= table_name;
	if(beanCList.file_path.compareTo("") == 0)
		beanCList.file_path			= file_path;
	if(rows_to_skip.compareTo("") != 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.rows_to_skip	= Integer.parseInt(rows_to_skip);
	else
		beanCList.rows_to_skip	= 0;
		
	if(beanCList.tableFieldsStr.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.tableFieldsStr	= tableFieldsStr;
	if(beanCList.assocVectorStr.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.assocVectorStr	= assocVectorStr;
	beanCList.buildAssocVector();
	beanCList.buildTableFields();
	if(beanCList.dialing_from.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.dialing_from		= dialing_from;
	if(beanCList.dialing_to.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.dialing_to		= dialing_to;
	if(beanCList.hoursapplyto.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.hoursapplyto		= hoursapplyto;
	if(beanCList.cList_extrada.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.cList_extrada		= cList_extrada;
	if(beanCList.extradataapplyto.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.extradataapplyto	= extradataapplyto;
	if(beanCList.phone_purification_non_numeric.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.phone_purification_non_numeric = phone_purification_non_numeric;
	if(beanCList.phone_purification_blackListRules.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.phone_purification_blackListRules = phone_purification_blackListRules;
	if(beanCList.phone_prefix_rule.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.phone_prefix_rule = phone_prefix_rule;
	if(beanCList.timeZoneRulesStr.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.timeZoneRulesStr 	= timeZoneRulesStr;
	if(beanCList.timeZoneRulesApplyto.compareTo("") == 0 || (beanCList.inLoadFormatMode && newCList_step.compareTo("6") ==0))
		beanCList.timeZoneRulesApplyto 	= timeZoneRulesApplyto;
	beanCList.buildTimeZoneRules();
	if(beanCList.format_to_use.compareTo("") == 0)
		beanCList.format_to_use			= format_to_use;
	

      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<!-- this link element includes the css definitions that describes the tab pane -->\r\n");
      out.write("<!--\r\n");
      out.write("<link type=\"text/css\" rel=\"stylesheet\" href=\"tab.winclassic.css\" />\r\n");
      out.write("-->\r\n");
      out.write("<LINK href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<LINK href=\"livestats.css\" \trel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"tab_luna.css\" />\r\n");
      out.write("<link id=\"luna-tab-style-sheet\" type=\"text/css\" rel=\"stylesheet\" href=\"style_2.css\" />\r\n");
      out.write("<link href=\"grid.css\" rel=\"stylesheet\" type=\"text/css\" ></link>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t200px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {\r\n");
      out.write("\theight:\t\t100px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html, body {\r\n");
      out.write("\tbackground:\t#E1F4FF;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("form {\r\n");
      out.write("\tmargin:\t\t0;\r\n");
      out.write("\tpadding:\t0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* over ride styles from webfxlayout */\r\n");
      out.write("\r\n");
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
      out.write(".active-controls-grid {border: 1px solid #ccc}\r\n");
      out.write("</style>\r\n");
      out.write('\r');
      out.write('\n');

beanManagerData pageCalFData = new beanManagerData();
pageCalFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCalFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );


      out.write("\r\n");
      out.write("<script language=\"JavaScript\" type=\"text/javascript\">\r\n");
      out.write("var CAll= new Array();\r\n");
      out.write("CAll[0]=\"");
      out.print(pageCalFData.getWord("cannot be choosen. It causes an order conflict with another treatment") );
      out.write("\";\r\n");
      out.write("CAll[1]=\"");
      out.print(pageCalFData.getWord("You must enter the table name associated with this list") );
      out.write("\";\r\n");
      out.write("CAll[2]=\"");
      out.print(pageCalFData.getWord("Invalid use of character") );
      out.write("\";\r\n");
      out.write("CAll[3]=\"");
      out.print(pageCalFData.getWord("Calling list name cannot start with a number") );
      out.write("\";\r\n");
      out.write("CAll[4]=\"");
      out.print(pageCalFData.getWord("Calling list already exists") );
      out.write("\";\r\n");
      out.write("CAll[5]=\"");
      out.print(pageCalFData.getWord("Are you sure, you wish to delete this calling list?") );
      out.write("\";\r\n");
      out.write("CAll[6]=\"");
      out.print(pageCalFData.getWord("Unable to delete a calling list associated to a running campaign") );
      out.write("\";\r\n");
      out.write("CAll[7]=\"");
      out.print(pageCalFData.getWord("No query specifed.**") );
      out.write("\";\r\n");
      out.write("CAll[8]=\"");
      out.print(pageCalFData.getWord("Invalid list name") );
      out.write("\";\r\n");
      out.write("CAll[9]=\"");
      out.print(pageCalFData.getWord("The name of the associated table to the calling list contains one or more forbidden characters. A calling list must start with a letter and contain only letters, digits and the underscore character(_). Please try again") );
      out.write("\";\r\n");
      out.write("CAll[10]=\"");
      out.print(pageCalFData.getWord("Specify the file extension") );
      out.write("\";\r\n");
      out.write("CAll[11]=\"");
      out.print(pageCalFData.getWord("Specify the CSV file delimiters and quotes") );
      out.write("\";\r\n");
      out.write("CAll[12]=\"");
      out.print(pageCalFData.getWord("Specify the calling list file") );
      out.write("\";\r\n");
      out.write("CAll[13]=\"");
      out.print(pageCalFData.getWord("No association have been made") );
      out.write("\";\r\n");
      out.write("CAll[14]=\"");
      out.print(pageCalFData.getWord("No table in your calling list") );
      out.write("\";\r\n");
      out.write("CAll[15]=\"");
      out.print(pageCalFData.getWord("No association with the phone number field") );
      out.write("\";\r\n");
      out.write("CAll[16]=\"");
      out.print(pageCalFData.getWord("Error: Missing dialing hours \\\"apply to\\\"") );
      out.write("\";\r\n");
      out.write("CAll[17]=\"");
      out.print(pageCalFData.getWord("Error: Missing the extra data for screenpop. Try selecting the \\\'None\\\' option") );
      out.write("\";\r\n");
      out.write("CAll[18]=\"");
      out.print(pageCalFData.getWord("Error: Missing extra data \\\"apply to\\\"") );
      out.write("\";\r\n");
      out.write("CAll[19]=\"");
      out.print(pageCalFData.getWord("Error: Missing non numeric phone number action") );
      out.write("\";\r\n");
      out.write("CAll[20]=\"");
      out.print(pageCalFData.getWord("Error: Missing Time Zone Rules Choice") );
      out.write("\";\r\n");
      out.write("CAll[21]=\"");
      out.print(pageCalFData.getWord("Error: No rule were selected in Time Zone Setup. Try using the \\\'None\\\' option instead.") );
      out.write("\";\r\n");
      out.write("CAll[22]=\"");
      out.print(pageCalFData.getWord("Table columns") );
      out.write("\";\r\n");
      out.write("CAll[23]=\"");
      out.print(pageCalFData.getWord("Specify format name") );
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
 pageCalFData.closeConnection(); 
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../lang_browser.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"jsUtil.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"callingListFuncs.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"tabpane.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"Browser.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"call_body\">\r\n");
      out.write("\r\n");
      out.write("<div class=\"tab-pane\" id=\"tabPane1\">\r\n");
      out.write("<form name=\"callingList\" action=\"addCallingList.jsp\" method=\"post\" \r\n");
      out.write("\t");
 
		if(newCList_step.compareTo("2")==0 )
			out.write("enctype=\"multipart/form-data\"");	
	
      out.write(" \r\n");
      out.write(">\r\n");
      out.write("<script type=\"text/javascript\">\t\r\n");
      out.write("var currentUserDbid = \"");
      out.print(currentUserDbid);
      out.write("\";\r\n");
      out.write("var isNewResource = true;\r\n");
      out.write("tp1 = new WebFXTabPane( document.getElementById( \"tabPane1\" ) );\r\n");
      out.write("</script>\r\n");
      out.write("\t<div class=\"tab-page\" id=\"tabPage1\">\r\n");
      out.write("\t\t<h2 class=\"tab\">");
      out.print( AddCalLstData.getWord("New"));
      out.write("</h2>\r\n");
      out.write("\t\t<script type=\"text/javascript\">tp1.addTabPage( document.getElementById( \"tabPage1\" ) );</script>\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t\t<legend>\r\n");
      out.write("\t\t\t\t\t");

						if(list_name.compareTo("")==0)
						
							out.write(AddCalLstData.getWord("New calling list wizard"));
						else
							out.write(list_name + AddCalLstData.getWord("Calling list wizard"));
					
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t</legend>  \r\n");
      out.write("\t\t\t\t");

				if(newCList_step.compareTo("1") == 0) //calling list name, description and table_name
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("List name"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\"><input name=\"name\" size=\"37\" onChange=\"adviseTableName()\" onFocus=\"enabledNextButton()\" style=\"float: left\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td valign=\"top\">");
      out.print( AddCalLstData.getWord("Description"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\"><textarea wrap=\"hard\" rows=\"4\" name=\"description\" style=\"width:98% \" onFocus=\"enabledNextButton()\"></textarea></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Associated table name"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\"><input name=\"table_name\" size=\"37\" onChange=\"enabledNextButton()\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
 if(userManagementAllowed)
{

      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td valign=\"top\">");
      out.print( AddCalLstData.getWord("Security"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Not allowed users"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Allowed users"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<select id=\"notAllowedUsers\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px\" name=\"notAllowedUsers\" size=\"5\" multiple=\"multiple\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");
for(int i = 0; i < listNotAllowedUsersDataResult.size(); i++)
											{
												String userDbid = (String)listNotAllowedUsersDataResult.elementAt(i).get("USER_DBID");
												String userName = (String)listNotAllowedUsersDataResult.elementAt(i).get("USERNAME");
												if(userDbid.compareTo(currentUserDbid) != 0)
												{
												
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<option value=\"");
      out.print(userDbid);
      out.write('"');
      out.write('>');
      out.print(userName);
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");
	}
											} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td valign=middle>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t&nbsp;<img src=\"../img/left_to_right.gif\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('notAllowedUsers', 'allowedUsers');enabledNextButton();\"/>&nbsp;<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t&nbsp;<img src=\"../img/right_to_left.gif\" style=\"cursor:pointer \" onClick=\"switchOptionsFromSelectBoxes('allowedUsers', 'notAllowedUsers');enabledNextButton();\"/>&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<select id=\"allowedUsers\" style=\"FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px\" name=\"allowedUsers\" size=\"5\" multiple=\"multiple\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<option value=\"");
      out.print(currentUserDbid);
      out.write('"');
      out.write('>');
      out.print(currentUserName);
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");

}

      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Maximum attempts"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"checkbox\" name=\"UnlimitCkB\" value=\"ON\" onClick=\"enabledNextButton();validateMaxAttempts();\" checked>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print( AddCalLstData.getWord("Unlimited"));
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<input disabled name=\"MaxAttemptsTxt\" size=\"3\" onChange=\"validateMaxAttempts()\" style=\"float: left\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Active"));
      out.write("</td> \r\n");
      out.write("\t\t\t\t\t    \t<td colspan=\"2\"><input type=\"checkbox\" name=\"state\" value=\"ON\" onClick=\"enabledNextButton()\" checked></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\">\r\n");
      out.write(" \t\t\t\t\t\t\t\t<input disabled name=\"nextInfo\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Next"));
      out.write(" &gt;&gt;\" onClick=\"addCList_next('");
      out.print(newCList_step);
      out.write("')\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"finishedInfo\" type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Finished"));
      out.write("\" onClick=\"addCList_next('");
      out.print(newCList_step);
      out.write("')\" >\r\n");
      out.write("\t\t\t\t\t\t    \t<input type=\"submit\" name=\"submitHiddenButton\" style=\"visibility:hidden \">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t");

				}
				else if(newCList_step.compareTo("2") == 0) //File type and upload and choose format...
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"file_extension\" value=\"xls\" onClick=\"onClickFileExt()\">xls<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"file_extension\" value=\"csv\" onClick=\"onClickFileExt()\">csv<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"file_extension\" value=\"txt\" onClick=\"onClickFileExt()\">txt<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print( AddCalLstData.getWord("Delimiter"));
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select name=\"csv_delimiter\" disabled>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\"></option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\",\">,</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\";\">;</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"tab\">");
      out.print( AddCalLstData.getWord("tab"));
      out.write(" </option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"space\">");
      out.print( AddCalLstData.getWord("space"));
      out.write(" </option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select> \r\n");
      out.write("\t\t\t\t\t\t\t\t&nbsp;&nbsp;&nbsp; \r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print( AddCalLstData.getWord("Quote"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select name=\"csv_quote\" disabled>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\"></option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"double\">\"</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"single\">'</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select> \r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( AddCalLstData.getWord("Source file name"));
      out.write(" :\r\n");
      out.write("\t\t\t\t\t\t\t<input name=\"source_file_name\" type=\"file\" size=\"40\" >\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print( AddCalLstData.getWord("Load format"));
      out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:\r\n");
      out.write("\t\t\t\t\t\t\t");

								java.sql.Statement  stat = null;
								java.sql.Connection conn = null;
								DataSource          m_ds = null;
								Context init = new InitialContext();
								Context ctx = (Context) init.lookup("java:comp/env");
								if(ctx == null )
									throw new Exception("Boom - No Context");
								
								m_ds = (DataSource) ctx.lookup("jdbc/aheevaccs");
								if (m_ds != null) 
								{
									System.out.println("Got Context");
								}
								conn = m_ds.getConnection();
								stat = conn.createStatement();
								
								String sqlQuery = "SELECT DBID, FORMAT_NAME FROM CFG_LIST_LOADING_FORMAT WHERE TENANT_DBID=\""+tenant_dbid+"\"";
								java.sql.ResultSet res = stat.executeQuery(sqlQuery);
								String bString = "<select style=\"width:200px\" name=\"format_to_use\">";
								bString += "<option value=\"\"></option>";
								while(res.next())
								{
									bString += "<option value=\""+res.getString("FORMAT_NAME")+"\">"+res.getString("FORMAT_NAME")+"</option>";
								}
								bString += "</select>";
								out.write(bString);
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input name=\"nextInfo\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Next"));
      out.write("\" &gt;&gt;\" onClick=\"addCList_next('");
 out.write(newCList_step); 
      out.write("')\">\r\n");
      out.write("\t\t\t\t\t\t<input name=\"finishedInfo\" type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Finished"));
      out.write("\" onClick=\"addCList_finished()\" >\t\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"submit\" name=\"submitHiddenButton\" style=\"visibility:hidden \">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t");

				}
				else if(newCList_step.compareTo("3") == 0) //Show file... and database columns...
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"30%\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"70%\"> <!-- OPTIONS ...-->\r\n");
      out.write("\t\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td height=\"33\" valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<fieldset><legend>");
      out.print( AddCalLstData.getWord("Skip"));
      out.write("</legend>");
      out.print( AddCalLstData.getWord("Row(s)"));
      out.write("&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input name=\"rows_to_skip\" type=\"text\" size=\"3\" value=\"0\" style=\"text-align:right; height:15px; font-family:Verdana; font-size:10px \" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</fieldset>\t\t\t\t\t\t\t\t\t  </td>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<fieldset><legend>");
      out.print( AddCalLstData.getWord("Actions"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write(" \t\t\t\t\t\t\t\t\t\t\t\t<input type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Auto fill"));
      out.write("\" onClick=\"autoFillsColumns()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Clear all"));
      out.write("\" onClick=\"clearAllAssociations()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</fieldset>\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<fieldset><legend>");
      out.print( AddCalLstData.getWord("Extras"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<input name=\"createFieldsFromFirstLine\" type=\"checkbox\" value=\"true\" onClick=\"createNewFieldsFromFistLine(this.checked)\">");
      out.print( AddCalLstData.getWord("Create new fields from first line"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</fieldset>\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td valign=\"top\" width=\"30%\"> <!-- LIST OF TABLE COLUMNS -->\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"div_table_columns\"  style=\"overflow:scroll; width:100% \">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
 /// Show the table columns list
											if(table_name.compareTo("") != 0)
											{
												String getAllColumnsQuery = "SHOW COLUMNS FROM `"+table_name+"`";												
												java.sql.Statement  stat = null;
												java.sql.Connection conn = null;
												DataSource          m_ds = null;
												
												
												try
												{
													Context init = new InitialContext();
													Context ctx = (Context) init.lookup("java:comp/env");
													if(ctx == null )
														throw new Exception("Boom - No Context");
													
													m_ds = (DataSource) ctx.lookup("jdbc/aheevaccs");
													if (m_ds != null) 
													{
														System.out.println("Got Context");
													}
													conn = m_ds.getConnection();
													stat = conn.createStatement();
													
													java.sql.ResultSet rs = null;
													
													if(beanCList.format_to_use.compareTo("") != 0)
													{
														String getXmlCfg = "SELECT FORMAT_TEXT FROM CFG_LIST_LOADING_FORMAT WHERE FORMAT_NAME=\""+beanCList.format_to_use+"\" AND TENANT_DBID=\""+tenant_dbid+"\" LIMIT 0,1";														
														rs = stat.executeQuery(getXmlCfg);
														if(rs.next())
															beanCList.setSettings(rs.getString("FORMAT_TEXT"));
													}
													
													if(beanCList.inLoadFormatMode == false) //we are not in a load format mode
													{													
														rs = stat.executeQuery(getAllColumnsQuery);
														String color = "#FFFFFF";
														int ColNum = 0;
														out.write("<script>");
														while(rs.next())
														{														
															out.write("tmpTableField = new tableField();");
															out.write("tmpTableField.ColNum=\""+ColNum+"\";");
															out.write("tmpTableField.tableName=\""+rs.getString("Field")+"\";");
															out.write("tableFieldsVector.push(tmpTableField);");																									
															ColNum++;
														}																										
														out.write("</script>");
														
													}
													else
													{
														//<-- We are here in a format mode, setup all variable
														out.write("<script>");
														//build the table field javascript vector
														for(int i = 0; i < beanCList.tableFields.size(); i++)
														{															
															aheevaManager.ressources.beanLoadCallingList.tableField thisField = (aheevaManager.ressources.beanLoadCallingList.tableField) beanCList.tableFields.elementAt(i);
															out.write("tmpTableField = new tableField();");
															out.write("tmpTableField.ColNum=\""+thisField.colNum+"\";");
															out.write("tmpTableField.tableName=\""+thisField.colName+"\";");
															out.write("tmpTableField.isNewCreated="+ (thisField.newCreated ? "true" : "false") +";");
															out.write("tableFieldsVector.push(tmpTableField);");
														}
														//build the association vector field
														for(int i = 0 ; i < beanCList.assocVector.size(); i++)
														{
															aheevaManager.ressources.beanLoadCallingList.assocField thisassoc = (aheevaManager.ressources.beanLoadCallingList.assocField) beanCList.assocVector.elementAt(i);
															out.write("tmpassoc = new fieldAssoc();");
															out.write("tmpassoc.TableNum="+thisassoc.tableNum+";");
															out.write("tmpassoc.FileNum="+thisassoc.fileNum+";");
															out.write("tmpassoc.ColNameInBD=\""+ thisassoc.colNameInDb +"\";");
															out.write("associationVector.push(tmpassoc);");
														}
														//setup the rows_to_skip
														out.write("document.callingList.rows_to_skip.value=\""+beanCList.rows_to_skip+"\";");
														out.write("</script>");
													}
													
													rs.close();
													stat.close();
													conn.close();
												}
												catch(Exception e) 
												{
													e.printStackTrace();
													stat.close();
													conn.close();
												}
												finally
												{
												}
																					
											}
										
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<script>\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdocument.write( buildHTMLFromTableFieldList() );\r\n");
      out.write("\t\t\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td valign=\"top\" width=\"70%\"> <!-- LIST OF FILE COLUMNS -->\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"div_file_contains\"  style=\"overflow:scroll; width:500px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									Vector file_lines = new Vector();
									int maxLineToLoadFromFile = 10;
									Vector histVect = upBean.getHistory();
									UploadParameters lastParams = (UploadParameters) histVect.elementAt(0);
									String full_file_name = directory + "/" + lastParams.getFilename();
									if(file_extension.compareTo("csv") == 0 || file_extension.compareTo("txt") == 0) // This is an csv file
									{
										if(file_extension.compareTo("txt") == 0){
										csv_delimiter="tab";
										csv_quote = "double";			
										}
										file_lines = readCSVFile(full_file_name, csv_delimiter, csv_quote, maxLineToLoadFromFile);
										String color2 = "#FFFFFF";
										out.write("<input type=\"hidden\" name=\"file_path\" value=\""+full_file_name+"\">");
										out.write("<table>");
										/*for( int i = 0 ; i < file_lines.size(); i++ )
										{
											Vector currentLine = (Vector)file_lines.elementAt(i);
											if( currentLine == null )
												out.write("null at line "+i);
											else
											{
												for( int j = 0 ; j < currentLine.size(); j++ )
												{
													String theInsider = (String)currentLine.elementAt(j);
													if( theInsider == null )
														out.write("null at cell "+i+","+j+"     ");
													else
														out.write("cell"+i+","+j+" = "+theInsider+"    ");
													
												}
											}
											out.write("<br>");
										}*/
										for(int i = 0 ; i < file_lines.size(); i++)//file_lines = readCSVFile();
										{											
											if(i == 0)
											{
												out.write("<tr style=\"background:	ThreeDFace;\">");
												out.write("<td align=\"center\">&nbsp;</td>");
											}
											else
											{
												out.write("<tr bgcolor=\""+color2+"\">");
												out.write("<td align=\"center\" style=\"background:	ThreeDFace;\">"+i+"</td>");
											}
											
											Vector currentLine = (Vector)file_lines.elementAt(i);
											for(int j = 0; j < currentLine.size(); j++)
											{
												String theInsider = (String)currentLine.elementAt(j);
												out.write("<td id=\"id_file_column_"+j+"\"");
												if(i == 0) //firstLine...
													out.write(" isFirstLine=\"true\"");
												else
													out.write(" isFirstLine=\"false\"");											
												out.write(" onClick=\"javascript:clickOnFileColumn('"+j+"');\"");
												if(isANumber(theInsider))
													out.write(" align=\"right\" ");
												else
													out.write(" align=\"center\" ");

												out.write(">");												
												out.write(theInsider);
												out.write("</td>");																						
											}
											out.write("</tr>");												
										}
										
										
										out.write("</table>");
									}
									else if(file_extension.compareTo("xls") == 0) // This is an xls file
									{
										Workbook workbook = Workbook.getWorkbook(new File(full_file_name));
										String color2 = "#FFFFFF";
										out.write("<input type=\"hidden\" name=\"file_path\" value=\""+full_file_name+"\">");
										
										if(workbook.getNumberOfSheets() > 1)
										{
											//display the "more than one sheet" warning
											out.write("<div style=\"color:red\">Warning: More than one sheet in this xls file. Just the first one will be use.</div>");
										}
										out.write("<table>");
										try
										{
											Sheet curSheet 		= workbook.getSheet(0);
											int nbFileColumns 	= curSheet.getColumns();
											int nbFileLines		= curSheet.getRows();
											
											//build the file header
											out.write("<tr style=\"background:	ThreeDFace;\">");								
											for(int i = 0; i < nbFileColumns; i++)
											{											
												out.write("<td align=\"center\" onClick=\"javascript:clickOnFileColumn('"+i+"')\">"+getXlsColName(i)+"</td>");																						
											}
											out.write("</tr>");
											
											//build the file himself
											Cell myCell;
											String cellContent = "";
											for(int i = 0; i < nbFileLines && i <= maxLineToLoadFromFile; i++)
											{
												out.write("<tr>");
												for(int j = 0; j < nbFileColumns; j++)
												{
													myCell = curSheet.getCell(j, i);
													cellContent = myCell.getContents();
													out.write("<td id=\"id_file_column_"+j+"\"");
													if(i == 0) //firstLine...
														out.write(" isFirstLine=\"true\"");
													else
														out.write(" isFirstLine=\"false\"");											
													out.write(" onClick=\"javascript:clickOnFileColumn('"+j+"');\"");
													if(myCell.getType() == CellType.NUMBER)
														out.write(" align=\"right\" ");
													else
														out.write(" align=\"center\" ");
	
													out.write(">");												
													out.write(cellContent);
													out.write("</td>");
												}
												out.write("</tr>");										
											}
										}
										catch(IndexOutOfBoundsException i)
										{
											out.write("<tr><td><div style=\"color:red\">"+ AddCalLstData.getWord("Warning: No sheet found in this xls file")+"</div></td></tr>");
										}
																	
										out.write("</table>");																
									}
									
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"associationVector_str\" value=\"\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"tableFieldsVector_str\" value=\"\">\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"nextInfo\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Next"));
      out.write("\" &gt;&gt;\" onClick=\"addCList_next('");
 out.write(newCList_step); 
      out.write("')\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"finishedInfo\" type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Finished"));
      out.write("\" onClick=\"addCList_finished()\"/>\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"submit\" name=\"submitHiddenButton\" style=\"visibility:hidden \">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t");

				}
				else if(newCList_step.compareTo("4") == 0) //Show insertion stats...
				{
					//build the interface
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<script>sqlInsertionStart = currentTimestamp();</script>\r\n");
      out.write("\t\t\t\t\t\t<table align=\"center\" width=\"50%\" cellpadding=\"2\" cellspacing=\"2\" style=\"background-color:ThreeDFace; border:3px solid #666666\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"right\" id=\"liveStats_buttons\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><b>");
      out.print( AddCalLstData.getWord("Loading statistics"));
      out.write("</b></td>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"50%\" align=\"center\"><b>");
      out.print( AddCalLstData.getWord("Status"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"50%\" align=\"center\"><b>");
      out.print( AddCalLstData.getWord("Processed"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"liveStats_status\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"liveStats_processed\">0</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"50%\" align=\"center\"><b>");
      out.print( AddCalLstData.getWord("Inserted"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"50%\" align=\"center\"><b>");
      out.print( AddCalLstData.getWord("Errors"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"liveStats_inserted\">0</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"liveStats_errors\">0</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"2\" align=\"center\"><b>");
      out.print( AddCalLstData.getWord("Time"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" colspan=\"2\" align=\"center\" id=\"liveStats_time\">00:00:00</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td id=\"liveStats_pourcentageCompleted\" align=\"center\" colspan=\"2\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td  style=\"border:1px solid #000000; text-align:center\" colspan=\"2\" id=\"liveStats_progress\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr style=\"height:12px\"><td bgcolor=\"#003366\" id=\"liveStats_progress_left\"></td><td id=\"liveStats_progress_right\"></td></tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t<table align=\"center\" width=\"50%\" cellpadding=\"2\" cellspacing=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td width=\"100%\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input id=\"insertPauseButton\" style=\"width:100px\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Pause"));
      out.write("\" onClick=\"if(loadingCurrentStatus == 'Paused') changeLoaderStatus('Inserting...'); else changeLoaderStatus('Paused');\"/>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input id=\"insertStopButton\" style=\"width:100px\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Stop"));
      out.write("\" onClick=\"changeLoaderStatus('Stopped')\"/><br>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input id=\"insertLogErrorButton\" style=\"width:100px; visibility:hidden\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Show errors"));
      out.write("\" onClick=\"askForLogErrorDisplay()\"/>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t<br>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input disabled name=\"nextInfo\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Next"));
      out.write("\" &gt;&gt;\" onClick=\"addCList_next('");
 out.write(newCList_step); 
      out.write("')\"/>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<!--<input type=\"button\" name=\"finishedInfo\" onclick=\"addCList_finished()\" value=\"Finished\" />-->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"submit\" name=\"submitHiddenButton\" style=\"visibility:hidden \">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t");

						//just start the insertion thread...
						loadingTask.setCallingListObj(beanCList);
						loadingTask.resetStats();
						Thread loadingThread = new Thread(loadingTask);
						loadingThread.start();
						session.setAttribute("loadingThread", loadingThread);
						session.setAttribute("loadingTask", loadingTask);
					
      out.write("\r\n");
      out.write("\t\t\t\t<script>\t\t\r\n");
      out.write("\t\t\t\t\tinterId = setInterval('callback()', 200);\r\n");
      out.write("\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t");

				}
				else if(newCList_step.compareTo("5") == 0) //setup the default call_from call_to, extradata_ timezone
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"50%\" valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<fieldset style=\"border:#999999 solid 1px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<legend style=\"color:#000000\">");
      out.print( AddCalLstData.getWord("Dialing hours"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr><td>&nbsp;</td><td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
      out.print( AddCalLstData.getWord("From"));
      out.write(" &nbsp; \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<select name=\"dialing_from\" id=\"dialing_from\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
										
												for(int i = 0 ; i <= 24; i++)
												{
													String hstr = (i < 10) ? "0"+i : ""+i;
													out.write("<option value=\""+hstr+"00\">"+hstr+":00</option>");
													out.write("<option value=\""+hstr+"30\">"+hstr+":30</option>");
												}
												
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</select>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t&nbsp; ");
      out.print( AddCalLstData.getWord("To"));
      out.write("  &nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<select name=\"dialing_to\" id=\"dialing_to\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");

												for(int i = 0 ; i <= 24; i++)
												{
													String hstr = (i < 10) ? "0"+i : ""+i;
													out.write("<option value=\""+hstr+"00\">"+hstr+":00</option>");
													out.write("<option value=\""+hstr+"30\">"+hstr+":30</option>");
												}
												
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td></tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr><td valign=\"top\"><i>");
      out.print( AddCalLstData.getWord("Apply to"));
      out.write("</i></td><td valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"hoursapplyto\" value=\"all_records\" /> ");
      out.print( AddCalLstData.getWord("All records"));
      out.write("<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"hoursapplyto\" value=\"empty_records\" />");
      out.print( AddCalLstData.getWord("Empty hours records"));
      out.write("<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"hoursapplyto\" value=\"none\" checked/> ");
      out.print( AddCalLstData.getWord("None"));
      out.write("<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</td></tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t</fieldset>\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"50%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<fieldset style=\"border:#999999 solid 1px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<legend style=\"color:#000000\">");
      out.print( AddCalLstData.getWord("Screen pop"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Url"));
      out.write("</td><td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"text\" name=\"cList_extrada\" style=\"width:300px\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td valign=\"top\"><!--<a href=\"#\" onClick=\"javascript:adviceUrls()\">--><i>");
      out.print( AddCalLstData.getWord("Defined urls"));
      out.write("</i><!--</a>--></td><td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<select size=\"5\" id=\"defined_urls\" style=\" width:300px\" onChange=\"setCListExtraData(this.value)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");

													Vector urlVec = getAllExtraDatas();
													
													for(int i = 0; i < urlVec.size(); i++)
													{														
														out.write("<option onclick=\"setCListExtraData(this.text)\" value=\""+(String)urlVec.elementAt(i)+"\">"+(String)urlVec.elementAt(i)+"</option>");
													}
													//Go and get a list of extradatas (from callinglists, from format and from )													
												
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr><td valign=\"top\"><i>");
      out.print( AddCalLstData.getWord("Apply to"));
      out.write("</i></td> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"extradataapplyto\" value=\"all_records\" />");
      out.print( AddCalLstData.getWord("All records"));
      out.write("<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"extradataapplyto\" value=\"empty_records\" />");
      out.print( AddCalLstData.getWord("Records with no extradata"));
      out.write("<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"extradataapplyto\" value=\"none\" checked/>");
      out.print( AddCalLstData.getWord("None"));
      out.write("<br>\t\t\t\t\t\t\t\t\t\t</td></tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t</fieldset>\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"100%\" colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<fieldset style=\"border:#999999 solid 1px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<legend style=\"color:#000000\">");
      out.print( AddCalLstData.getWord("Phone number purification"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td><i>");
      out.print( AddCalLstData.getWord("Action"));
      out.write("</i></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td><i>");
      out.print( AddCalLstData.getWord("Non numeric phone numbers"));
      out.write("</i></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"phone_purification_non_numeric\" value=\"None\" checked/>");
      out.print( AddCalLstData.getWord("None"));
      out.write(" &nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<!--<input type=\"radio\" name=\"phone_purification_non_numeric\" value=\"Remove_non_numeric\" /> Remove non numeric caracters &nbsp;&nbsp;-->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"phone_purification_non_numeric\" value=\"Delete_record\" />");
      out.print( AddCalLstData.getWord("Remove record"));
      out.write("&nbsp;&nbsp;\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<i>");
      out.print( AddCalLstData.getWord("Prefix rules"));
      out.write("<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<!--[<a href=\"#\" onClick=\"showPhonePrefixRules()\" style=\"font-size:10px\">Edit rules</a>]--></i>\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<select name=\"phone_prefix_rule\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<option value=\"\"></option>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t");

															//go and get all existing rules groupname...
															String getTimeZoneGroupRules_sql = "SELECT DISTINCT GROUPNAME FROM CFG_CALLING_LIST_PREFIX";															
															java.sql.Statement  stat = null;
															java.sql.Connection conn = null;
															DataSource          m_ds = null;															
															try
															{
																Context init = new InitialContext();
																Context ctx = (Context) init.lookup("java:comp/env");
																if(ctx == null )
																	throw new Exception("Boom - No Context");
																
																m_ds = (DataSource) ctx.lookup("jdbc/aheevaccs");
																if (m_ds != null) 
																{
																	System.out.println("Got Context");
																}
																conn = m_ds.getConnection();
																stat = conn.createStatement();																
																java.sql.ResultSet rs = stat.executeQuery(getTimeZoneGroupRules_sql);
																String color = "#FFFFFF";
																while(rs.next())
																{														
																	out.write("<option value=\""+rs.getString("GROUPNAME")+"\">"+rs.getString("GROUPNAME")+"</option>");
																}
																
																rs.close();
																stat.close();
																conn.close();
															}
															catch(Exception e) 
															{
																e.printStackTrace();
																stat.close();
																conn.close();
															}
															finally
															{
																//
															}
														
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</select>\t\t\t\t\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t</fieldset>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"100%\" colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<fieldset style=\"border:#999999 solid 1px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<legend style=\"color:#000000\">");
      out.print( AddCalLstData.getWord("Time zones setup"));
      out.write("</legend>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<i><!--[<a href=\"#\" onClick=\"showTimeZoneRules()\" style=\"font-size:10px\">Edit rules</a>]--></i><br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<!-- -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td width=\"45%\" valign=\"top\">");
      out.print( AddCalLstData.getWord("Available rules"));
      out.write("<br>\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td width=\"10%\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t  <td width=\"45%\" valign=\"top\">");
      out.print( AddCalLstData.getWord("Selected rules"));
      out.write("<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"../img/movenext1.gif\" width=\"20\" height=\"20\" style=\"cursor:pointer\" alt=\"Down\" onClick=\"moveTimeZoneRuleDown()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"../img/moveprevious1.gif\" width=\"20\" height=\"20\" style=\"cursor:pointer\" alt=\"Up\" onClick=\"moveTimeZoneRuleUp()\">\t\t\t\t\t\t\t\t\t\t\t  </td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td width=\"45%\" valign=\"top\">\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<select name=\"timezone_availablerules\" size=\"5\" style=\"width:100%;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t");

															//go and get all existing rules groupname...
															
															String getTimeZoneGroupRules_sql_tmz = "SELECT DISTINCT GROUPNAME FROM CFG_TIMEZONE_RULES";															
															java.sql.Statement  stat_tmz = null;
															java.sql.Connection conn_tmz = null;
															DataSource          m_ds_tmz = null;															
															try
															{
																Context init = new InitialContext();
																Context ctx = (Context) init.lookup("java:comp/env");
																if(ctx == null )
																	throw new Exception("Boom - No Context");
																
																m_ds_tmz = (DataSource) ctx.lookup("jdbc/aheevaccs");
																if (m_ds_tmz != null) 
																{
																	System.out.println("Got Context");
																}
																conn_tmz = m_ds_tmz.getConnection();
																stat_tmz = conn_tmz.createStatement();																
																java.sql.ResultSet rs_tmz = stat_tmz.executeQuery(getTimeZoneGroupRules_sql_tmz);
																String color = "#FFFFFF";
																while(rs_tmz.next())
																{														
																	out.write("<option value=\""+rs_tmz.getString("GROUPNAME")+"\">"+rs_tmz.getString("GROUPNAME")+"</option>");
																}
																
																rs_tmz.close();
																stat_tmz.close();
																conn_tmz.close();
															}
															catch(Exception e) 
															{
																e.printStackTrace();
																stat_tmz.close();
																conn_tmz.close();
															}
															finally
															{
																//
															}
															
												
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</select>\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td width=\"10%\" valign=\"middle\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"../img/left_to_right.gif\" style=\"cursor:pointer \" onClick=\"javascript:chkAndAddTimeZoneRule()\" /><br />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"../img/right_to_left.gif\"  style=\"cursor:pointer \" onClick=\"javascript:chkAndDropTimeZoneRule()\"/>\t\t\t\t\t\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td width=\"45%\" valign=\"top\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<select name=\"timezone_selectedrules\" size=\"5\" style=\"width:100%;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</select>\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");
      out.print( AddCalLstData.getWord("Apply to"));
      out.write(": \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"timeZoneRulesApplyto\" value=\"all_records\" />");
      out.print( AddCalLstData.getWord("All records"));
      out.write("&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"timeZoneRulesApplyto\" value=\"empty_records\">");
      out.print( AddCalLstData.getWord("Empty time zone records"));
      out.write(" &nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"timeZoneRulesApplyto\" value=\"none\" checked>");
      out.print( AddCalLstData.getWord("None"));
      out.write("&nbsp;&nbsp;\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<!-- -->\r\n");
      out.write("\t\t\t\t\t\t\t\t</fieldset>\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t  <td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"timeZoneRulesStr\">\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"nextInfo\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Next"));
      out.write("\" &gt;&gt;\" onClick=\"addCList_next('");
 out.write(newCList_step); 
      out.write("')\"/>\r\n");
      out.write("\t\t\t\t\t\t\t<input name=\"finishedInfo\" type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Finished"));
      out.write("\" onClick=\"addCList_finished()\"/>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"submit\" name=\"submitHiddenButton\" style=\"visibility:hidden \" /></td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t");

						//<!--- if we are in the load format mode, just setup all the stuff
						if(beanCList.inLoadFormatMode == true)
						{
							out.write("<script>");
							out.write("selectOptioninSelect( document.callingList.dialing_from , '"+beanCList.dialing_from+"');");
							out.write("selectOptioninSelect( document.callingList.dialing_to , '"+beanCList.dialing_to+"');");
							out.write("checkOptioninradio( document.callingList.hoursapplyto , '"+beanCList.hoursapplyto+"');");
							out.write("document.callingList.cList_extrada.value = \""+beanCList.cList_extrada+"\";");
							out.write("checkOptioninradio( document.callingList.extradataapplyto , '"+beanCList.extradataapplyto+"');");
							out.write("checkOptioninradio( document.callingList.phone_purification_non_numeric , '"+beanCList.phone_purification_non_numeric+"');");
							out.write("selectOptioninSelect( document.callingList.phone_prefix_rule , '"+beanCList.phone_prefix_rule+"');");
							
							for(int i = 0; i < beanCList.timeZoneRules.size(); i++)
							{
								out.write("addOptiontoselect(document.callingList.timezone_selectedrules, '"+(String)beanCList.timeZoneRules.elementAt(i)+"', '"+(String)beanCList.timeZoneRules.elementAt(i)+"');");
								out.write("removeOptionfromselect(document.callingList.timezone_availablerules, '"+(String)beanCList.timeZoneRules.elementAt(i)+"', '"+(String)beanCList.timeZoneRules.elementAt(i)+"');");
							}
							out.write("checkOptioninradio( document.callingList.timeZoneRulesApplyto, '"+beanCList.timeZoneRulesApplyto+"');");
							out.write("</script>");
						}
				}
				else if(newCList_step.compareTo("6") == 0) //show after_queries 
				{
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<script>sqlInsertionStart = currentTimestamp();</script>\r\n");
      out.write("\t\t\t\t\t\t<table align=\"center\" width=\"50%\" cellpadding=\"2\" cellspacing=\"2\" style=\"background-color:ThreeDFace; border:3px solid #666666\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><b>");
      out.print( AddCalLstData.getWord("Queries status"));
      out.write("</b></td>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"center\"><b>");
      out.print( AddCalLstData.getWord("Actions"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"center\"><b>");
      out.print( AddCalLstData.getWord("Status"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_DailyHours\">");
      out.print( AddCalLstData.getWord("Daily hours"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"afterQueries_DailyHoursStatus\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_DailyHoursMessage\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_ExtraData\">");
      out.print( AddCalLstData.getWord("Extra data"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"afterQueries_ExtraDataStatus\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_ExtraDataMessage\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_NonNumeric\">");
      out.print( AddCalLstData.getWord("Non numeric phone numbers"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"afterQueries_NonNumericStatus\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_NonNumericMessage\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_PrefixRules\">");
      out.print( AddCalLstData.getWord("Prefix rules"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"afterQueries_PrefixRulesStatus\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_PrefixRulesMessage\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<!--\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_BlackRules\">Black list rules</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"afterQueries_BlackRulesStatus\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_BlackRulesMessage\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t-->\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_TimeZones\">");
      out.print( AddCalLstData.getWord("Time zones"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"center\" id=\"afterQueries_TimeZonesStatus\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"border:1px solid #000000\" align=\"left\" id=\"afterQueries_TimeZonesMessage\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</table>\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<input  disabled name=\"nextInfo\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Next"));
      out.write("\" &gt;&gt;\" onClick=\"addCList_next('");
 out.write(newCList_step); 
      out.write("')\"/>\r\n");
      out.write("\t\t\t\t\t\t\t  \r\n");
      out.write("\t\t\t\t\t\t\t   <input type=\"submit\" name=\"submitHiddenButton\" style=\"visibility:hidden \">\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");

							//just start the queries thread...
							beanAfterQueries.setCallingListObj(beanCList);
							beanAfterQueries.resetAllStatus();
							Thread queryThread = new Thread(beanAfterQueries);
							queryThread.start();
							session.setAttribute("queryThread", queryThread);
							session.setAttribute("beanAfterQueries", beanAfterQueries);
						
      out.write("\r\n");
      out.write("\t\t\t\t\t<script>\t\t\r\n");
      out.write("\t\t\t\t\t\tinterId = setInterval('callbackQueryStatus()', 200);\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t");
				
				}
				else if(newCList_step.compareTo("7") == 0) //last Panel and save format
				{
					//calculate the final statistics
					
					beanCList.setupFinalStats();
					session.setAttribute("beanCList", beanCList);
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<table align=\"center\" width=\"50%\" cellpadding=\"2\" cellspacing=\"2\" style=\"background-color:ThreeDFace; border:3px solid #666666\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><b>");
      out.print( AddCalLstData.getWord("Diagnostic"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Loaded records"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"right\">&nbsp;");
      out.print(beanCList.getTotalLoadedRecord() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Records in table"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"right\">&nbsp;");
      out.print(beanCList.getTotalRecordsInTable() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Records with no time zone"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"right\">&nbsp;");
      out.print(beanCList.getTotalRecordsNoTimeZoneInTable() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( AddCalLstData.getWord("Records with no extra data"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"right\">&nbsp;");
      out.print(beanCList.getTotalRecordsNoExtradataInTable() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t");
				
					
					//get all saved formats
					String bString = "";
					java.sql.Statement  stat = null;
					java.sql.Connection conn = null;
					DataSource          m_ds = null;
					try
					{
						Context init = new InitialContext();
						Context ctx = (Context) init.lookup("java:comp/env");
						if(ctx == null )
							throw new Exception("Boom - No Context");
						
						m_ds = (DataSource) ctx.lookup("jdbc/aheevaccs");
						if (m_ds != null) 
						{
							System.out.println("Got Context");
						}
						conn = m_ds.getConnection();
						stat = conn.createStatement();
						
						String sqlQuery = "SELECT DBID, FORMAT_NAME FROM CFG_LIST_LOADING_FORMAT WHERE TENANT_DBID=\""+tenant_dbid+"\"";
						java.sql.ResultSet res = stat.executeQuery(sqlQuery);
						bString = "<select style=\"width:200px\" name=\"selectExistingFormat\" size=\"5\" onchange=\"document.callingList.saving_format_name.value=this.value\">";
						while(res.next())
						{
							bString += "<option value=\""+res.getString("FORMAT_NAME")+"\">"+res.getString("FORMAT_NAME")+"</option>";
						}
						bString += "</select>";
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					finally
					{
						try
						{
							conn.close();
							stat.close();
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
					}
					
					//out.write("<div id=\"divSaveSettings\" style=\"background-color:#FFFFFF\">");
					out.write("<br>");
					out.write("<table style=\"border: 3px solid #000000\" align=\"center\">");
					out.write("<tr><td align=\"center\" bgcolor=\"#CCCCCC\"><b>"+AddCalLstData.getWord("Save load list settings (Optional)")+"</b></td></tr>");
					out.write("<tr><td><i>"+AddCalLstData.getWord("Setting name")+"</i></td></tr>");
					out.write("<tr><td><input style=\"width:200px\" type=\"text\" name=\"saving_format_name\"></td></tr>");
					out.write("<tr><td><i>"+AddCalLstData.getWord("Existing formats")+"</i></td></tr>");
					out.write("<tr><td>"+bString+"</td></tr>");
					out.write("<tr><td align=\"center\">");
					out.write("<input style=\"font-weight:bold; width:75px\"  name=\"savebutton\" type=\"button\" value=\"Save\" onClick=\"saveCallingListSettings(document.callingList.saving_format_name.value)\">&nbsp;");
					//out.write("<input style=\"font-weight:bold; width:75px\" type=\"button\" value=\"Close\" onClick=\"closeSettingDialog()\">");
					out.write("</td></tr>");
					out.write("</table>");
					//out.write("</div>");
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<input  name=\"nextInfo\"  type=\"button\" value=\"");
      out.print( AddCalLstData.getWord("Finished"));
      out.write("\" onClick=\"addCList_finished()\"/>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t");
		
					
					
				}
				
      out.write("\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t");

	//Insert hidden fields...
	
	switch(Integer.parseInt(newCList_step))
	{
		case 7:
		case 6:
			out.write("<input type=\"hidden\" name=\"dialing_from\" value=\""+dialing_from+"\">");
			out.write("<input type=\"hidden\" name=\"dialing_to\" value=\""+dialing_to+"\">");
			out.write("<input type=\"hidden\" name=\"hoursapplyto\" value=\""+hoursapplyto+"\">");
			out.write("<input type=\"hidden\" name=\"cList_extrada\" value=\""+cList_extrada+"\">");
			out.write("<input type=\"hidden\" name=\"extradataapplyto\" value=\""+extradataapplyto+"\">");
			out.write("<input type=\"hidden\" name=\"phone_prefix_rule\" value=\""+phone_prefix_rule+"\">");
			out.write("<input type=\"hidden\" name=\"phone_purification_non_numeric\" value=\""+phone_purification_non_numeric+"\">");
			out.write("<input type=\"hidden\" name=\"phone_purification_blackListRules\" value=\""+phone_purification_blackListRules+"\">");
			out.write("<input type=\"hidden\" name=\"timeZoneRulesStr\" value=\""+timeZoneRulesStr+"\">");
			out.write("<input type=\"hidden\" name=\"timeZoneRulesApplyto\" value=\""+timeZoneRulesApplyto+"\">");
		case 5:		
		case 4:
			out.write("<input type=\"hidden\" name=\"rows_to_skip\" value=\""+rows_to_skip+"\">");
			out.write("<input type=\"hidden\" name=\"associationVector_str\" value=\""+assocVectorStr+"\">");
			out.write("<input type=\"hidden\" name=\"tableFieldsVector_str\" value=\""+tableFieldsStr+"\">");
		case 3:
			out.write("<input type=\"hidden\" name=\"source_file_name\" value=\""+source_file_name+"\">");
			out.write("<input type=\"hidden\" name=\"csv_quote\" value=\""+csv_quote+"\">");
			out.write("<input type=\"hidden\" name=\"csv_delimiter\" value=\""+csv_delimiter+"\">");
			out.write("<input type=\"hidden\" name=\"file_extension\" value=\""+file_extension+"\">");
			out.write("<input type=\"hidden\" name=\"format_to_use\" value=\""+format_to_use+"\">");
		case 2:
			out.write("<input type=\"hidden\" name=\"name\" value=\""+list_name+"\">");
			out.write("<input type=\"hidden\" name=\"table_name\" value=\""+table_name+"\">");			
		case 1:			
			out.write("");
		break;
		
	}	
	out.write("<input type=\"hidden\" name=\"newCList_step\" value=\""+(Integer.parseInt(newCList_step)+1)+"\">");
	out.write("<input type=\"hidden\" name=\"tenant_dbid\" value=\""+tenant_dbid+"\">");
	
	
      out.write("\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t//<![CDATA[\r\n");
      out.write("\tsetupAllTabs();\r\n");
      out.write("\t//]]>\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"TempMessages\" id=\"TempMessages\"> \r\n");
      out.write("  <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\">\r\n");
      out.write("    <tr> \r\n");
      out.write("      <td width=\"100%\" id=\"TempMsg\" align=\"center\" class=\"TempMsg\"></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
 AddCalLstData.closeConnection(); 
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
