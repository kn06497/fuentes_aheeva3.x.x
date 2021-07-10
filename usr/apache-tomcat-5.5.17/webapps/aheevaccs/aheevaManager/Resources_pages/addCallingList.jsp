<html>
<title>AheevaCCS - Add Callinglist</title>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>

<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<% 	
	String directory = request.getRealPath("Manager/uploads"); 
	String tmpdirectory = request.getRealPath("Manager/uploads"); 	
%>
<% 	boolean createsubfolders = true; %>

<%
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
	{ %>
		<jsp:forward page="forbidden.jsp"/>
<%	} %>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%= directory %>" />
  <jsp:setProperty name="upBean" property="parser" value="<%= MultipartFormDataRequest.CFUPARSER %>"/>
  <jsp:setProperty name="upBean" property="parsertmpdir" value="<%= tmpdirectory %>"/>
  <jsp:setProperty name="upBean" property="overwrite" value="true" />
  <jsp:setProperty name="upBean" property="filesizelimit" value="8589934592"/>
</jsp:useBean>



<head>
<%!
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

%>


<%
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
%>

<jsp:useBean id="loadingTask" 		scope="session" class="aheevaManager.ressources.beanImportCallingListTask" />
<jsp:useBean id="beanCList"   		scope="session" class="aheevaManager.ressources.beanLoadCallingList" />
<jsp:useBean id="beanAfterQueries"  scope="session" class="aheevaManager.ressources.beanCallingListAfterQueries" />

<%
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
	
%>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- this link element includes the css definitions that describes the tab pane -->
<!--
<link type="text/css" rel="stylesheet" href="tab.winclassic.css" />
-->
<LINK href="style.css" rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="style_2.css" />
<link href="grid.css" rel="stylesheet" type="text/css" ></link>
<style type="text/css">

.dynamic-tab-pane-control .tab-page {
	height:		200px;
}

.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}

html, body {
	background:	#E1F4FF;
}

form {
	margin:		0;
	padding:	0;
}

/* over ride styles from webfxlayout */

body {
	margin:		10px;
	width:		auto;
	height:		auto;
}

.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}

.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
}

.dynamic-tab-pane-control a:hover {
	background: transparent;
}

.active-controls-grid {border: 1px solid #ccc}
</style>
<%@ include file="callingListFuncs_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="callingListFuncs.js"></script>
<script language="javascript" type="text/javascript" src="tabpane.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>


</head>
<body class="call_body">

<div class="tab-pane" id="tabPane1">
<form name="callingList" action="addCallingList.jsp" method="post" 
	<% 
		if(newCList_step.compareTo("2")==0 )
			out.write("enctype=\"multipart/form-data\"");	
	%> 
>
<script type="text/javascript">	
var currentUserDbid = "<%=currentUserDbid%>";
var isNewResource = true;
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
	<div class="tab-page" id="tabPage1">
		<h2 class="tab"><%= AddCalLstData.getWord("New")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );</script>
		<fieldset>
				<legend>
					<%
						if(list_name.compareTo("")==0)
						
							out.write(AddCalLstData.getWord("New calling list wizard"));
						else
							out.write(list_name + AddCalLstData.getWord("Calling list wizard"));
					%>				
				</legend>  
				<%
				if(newCList_step.compareTo("1") == 0) //calling list name, description and table_name
				{
				%>
					<table>
						<tr>						
							<td><%= AddCalLstData.getWord("List name")%></td>
							<td colspan="2"><input name="name" size="37" onChange="adviseTableName()" onFocus="enabledNextButton()" style="float: left"></td>
						</tr>
						<tr>						
							<td valign="top"><%= AddCalLstData.getWord("Description")%></td>
							<td colspan="2"><textarea wrap="hard" rows="4" name="description" style="width:98% " onFocus="enabledNextButton()"></textarea></td>
						</tr>
						<tr>						
							<td><%= AddCalLstData.getWord("Associated table name")%></td>
							<td colspan="2"><input name="table_name" size="37" onChange="enabledNextButton()"></td>
						</tr>
<% if(userManagementAllowed)
{
%>
						<tr>
							<td valign="top"><%= AddCalLstData.getWord("Security")%></td>
							<td colspan="2">
								<table>
									<tr>
										<td><%= AddCalLstData.getWord("Not allowed users")%></td>
										<td>&nbsp;</td>
										<td><%= AddCalLstData.getWord("Allowed users")%></td>
									</tr>
									<tr>
										<td align="center">
											<select id="notAllowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="notAllowedUsers" size="5" multiple="multiple">
											<%for(int i = 0; i < listNotAllowedUsersDataResult.size(); i++)
											{
												String userDbid = (String)listNotAllowedUsersDataResult.elementAt(i).get("USER_DBID");
												String userName = (String)listNotAllowedUsersDataResult.elementAt(i).get("USERNAME");
												if(userDbid.compareTo(currentUserDbid) != 0)
												{
												%>
												<option value="<%=userDbid%>"><%=userName%></option>
											<%	}
											} %>
											</select>
										</td>
										<td valign=middle>
											&nbsp;<img src="../img/left_to_right.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('notAllowedUsers', 'allowedUsers');enabledNextButton();"/>&nbsp;<br>
											&nbsp;<img src="../img/right_to_left.gif" style="cursor:pointer " onClick="switchOptionsFromSelectBoxes('allowedUsers', 'notAllowedUsers');enabledNextButton();"/>&nbsp;
										</td>
										<td align="center">
											<select id="allowedUsers" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; WIDTH: 120px" name="allowedUsers" size="5" multiple="multiple">
												<option value="<%=currentUserDbid%>"><%=currentUserName%></option>
											</select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
<%
}
%>
						<tr>
							<td><%= AddCalLstData.getWord("Maximum attempts")%></td>
							<td colspan="2">
								<input type="checkbox" name="UnlimitCkB" value="ON" onClick="enabledNextButton();validateMaxAttempts();" checked>
								<%= AddCalLstData.getWord("Unlimited")%>						
								<input disabled name="MaxAttemptsTxt" size="3" onChange="validateMaxAttempts()" style="float: left">
							</td>
						</tr>
						<tr>
							<td><%= AddCalLstData.getWord("Active")%></td> 
					    	<td colspan="2"><input type="checkbox" name="state" value="ON" onClick="enabledNextButton()" checked></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="2">
 								<input disabled name="nextInfo"  type="button" value="<%= AddCalLstData.getWord("Next")%> &gt;&gt;" onClick="addCList_next('<%=newCList_step%>')">
								<input name="finishedInfo" type="button" value="<%= AddCalLstData.getWord("Finished")%>" onClick="addCList_next('<%=newCList_step%>')" >
						    	<input type="submit" name="submitHiddenButton" style="visibility:hidden ">
							</td>						
						</tr>
					</table>
				<%
				}
				else if(newCList_step.compareTo("2") == 0) //File type and upload and choose format...
				{
				%>
					<table>
						<tr>
							<td>
								<input type="radio" name="file_extension" value="xls" onClick="onClickFileExt()">xls<br>
								<input type="radio" name="file_extension" value="csv" onClick="onClickFileExt()">csv<br>
								<input type="radio" name="file_extension" value="txt" onClick="onClickFileExt()">txt<br>
								<%= AddCalLstData.getWord("Delimiter")%> 
									<select name="csv_delimiter" disabled>
										<option value=""></option>
										<option value=",">,</option>
										<option value=";">;</option>
										<option value="tab"><%= AddCalLstData.getWord("tab")%> </option>
										<option value="space"><%= AddCalLstData.getWord("space")%> </option>
									</select> 
								&nbsp;&nbsp;&nbsp; 
								<%= AddCalLstData.getWord("Quote")%>
									<select name="csv_quote" disabled>
										<option value=""></option>
										<option value="double">"</option>
										<option value="single">'</option>
									</select> 
							</td>
						</tr>
						<tr>
							<td>
							<%= AddCalLstData.getWord("Source file name")%> :
							<input name="source_file_name" type="file" size="40" >
							</td>
						</tr>
						<tr>
							<td>
							<%= AddCalLstData.getWord("Load format")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
							<%
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
							%>
							</td>
						</tr>
						<tr>
							<td>
						<input name="nextInfo"  type="button" value="<%= AddCalLstData.getWord("Next")%>" &gt;&gt;" onClick="addCList_next('<% out.write(newCList_step); %>')">
						<input name="finishedInfo" type="button" value="<%= AddCalLstData.getWord("Finished")%>" onClick="addCList_finished()" >					

								<input type="submit" name="submitHiddenButton" style="visibility:hidden ">
							</td>						
						</tr>
					</table>
				<%
				}
				else if(newCList_step.compareTo("3") == 0) //Show file... and database columns...
				{
				%>
					<table>
						<tr>
							<td width="30%">&nbsp;</td>
							<td width="70%"> <!-- OPTIONS ...-->
								<table>
									<tr>

										<td height="33" valign="top">
											<fieldset><legend><%= AddCalLstData.getWord("Skip")%></legend><%= AddCalLstData.getWord("Row(s)")%>&nbsp;
											<input name="rows_to_skip" type="text" size="3" value="0" style="text-align:right; height:15px; font-family:Verdana; font-size:10px " />
											<br>
											</fieldset>									  </td>

										<td valign="top">
											<fieldset><legend><%= AddCalLstData.getWord("Actions")%></legend>
													
 												<input type="button" value="<%= AddCalLstData.getWord("Auto fill")%>" onClick="autoFillsColumns()">
												<input type="button" value="<%= AddCalLstData.getWord("Clear all")%>" onClick="clearAllAssociations()">
											</fieldset>										</td>
										<td valign="top">
											<fieldset><legend><%= AddCalLstData.getWord("Extras")%></legend>
													<input name="createFieldsFromFirstLine" type="checkbox" value="true" onClick="createNewFieldsFromFistLine(this.checked)"><%= AddCalLstData.getWord("Create new fields from first line")%>
											</fieldset>										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td valign="top" width="30%"> <!-- LIST OF TABLE COLUMNS -->
								<div id="div_table_columns"  style="overflow:scroll; width:100% ">
								<% /// Show the table columns list
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
										
										%>
								<script>
									document.write( buildHTMLFromTableFieldList() );
								</script>
								</div>
								
							
							</td>
							<td valign="top" width="70%"> <!-- LIST OF FILE COLUMNS -->
								<div id="div_file_contains"  style="overflow:scroll; width:500px;">
								<%
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
									
								%>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="hidden" name="associationVector_str" value="">
								<input type="hidden" name="tableFieldsVector_str" value="">
						
								<input name="nextInfo"  type="button" value="<%= AddCalLstData.getWord("Next")%>" &gt;&gt;" onClick="addCList_next('<% out.write(newCList_step); %>')"/>
								<input name="finishedInfo" type="button" value="<%= AddCalLstData.getWord("Finished")%>" onClick="addCList_finished()"/>				
								
								<input type="submit" name="submitHiddenButton" style="visibility:hidden ">
							</td>						
						</tr>
					</table>						
				<%
				}
				else if(newCList_step.compareTo("4") == 0) //Show insertion stats...
				{
					//build the interface
					%>
						<script>sqlInsertionStart = currentTimestamp();</script>
						<table align="center" width="50%" cellpadding="2" cellspacing="2" style="background-color:ThreeDFace; border:3px solid #666666">
							<tr>
								<td>&nbsp;</td>
								<td align="right" id="liveStats_buttons"></td>
							</tr>
							<tr>
								<td><b><%= AddCalLstData.getWord("Loading statistics")%></b></td>								
							</tr>
							<tr>
								<td width="50%" align="center"><b><%= AddCalLstData.getWord("Status")%></b></td>
								<td width="50%" align="center"><b><%= AddCalLstData.getWord("Processed")%></b></td>
							</tr>
							<tr>
								<td style="border:1px solid #000000" align="center" id="liveStats_status">&nbsp;</td>
								<td style="border:1px solid #000000" align="center" id="liveStats_processed">0</td>
							</tr>
							<tr>
								<td width="50%" align="center"><b><%= AddCalLstData.getWord("Inserted")%></b></td>
								<td width="50%" align="center"><b><%= AddCalLstData.getWord("Errors")%></b></td>
							</tr>
							<tr>
								<td style="border:1px solid #000000" align="center" id="liveStats_inserted">0</td>
								<td style="border:1px solid #000000" align="center" id="liveStats_errors">0</td>
							</tr>
							<tr>
								<td colspan="2" align="center"><b><%= AddCalLstData.getWord("Time")%></b></td>
							</tr>
							<tr>
								<td style="border:1px solid #000000" colspan="2" align="center" id="liveStats_time">00:00:00</td>
							</tr>
							<tr>
								<td id="liveStats_pourcentageCompleted" align="center" colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td  style="border:1px solid #000000; text-align:center" colspan="2" id="liveStats_progress">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr style="height:12px"><td bgcolor="#003366" id="liveStats_progress_left"></td><td id="liveStats_progress_right"></td></tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
						<table align="center" width="50%" cellpadding="2" cellspacing="2">
							<tr>
								<td width="100%" align="center">
									<input id="insertPauseButton" style="width:100px"  type="button" value="<%= AddCalLstData.getWord("Pause")%>" onClick="if(loadingCurrentStatus == 'Paused') changeLoaderStatus('Inserting...'); else changeLoaderStatus('Paused');"/>																					
									&nbsp;&nbsp;
										<input id="insertStopButton" style="width:100px"  type="button" value="<%= AddCalLstData.getWord("Stop")%>" onClick="changeLoaderStatus('Stopped')"/><br>																
									<input id="insertLogErrorButton" style="width:100px; visibility:hidden"  type="button" value="<%= AddCalLstData.getWord("Show errors")%>" onClick="askForLogErrorDisplay()"/>																						

								</td>
							</tr>
						</table>
						<br>						
						<table>
							<tr>
								<td>
								<input disabled name="nextInfo"  type="button" value="<%= AddCalLstData.getWord("Next")%>" &gt;&gt;" onClick="addCList_next('<% out.write(newCList_step); %>')"/>															


									<!--<input type="button" name="finishedInfo" onclick="addCList_finished()" value="Finished" />-->
									<input type="submit" name="submitHiddenButton" style="visibility:hidden ">
								</td>						
							</tr>
						</table>
					
					<%
						//just start the insertion thread...
						loadingTask.setCallingListObj(beanCList);
						loadingTask.resetStats();
						Thread loadingThread = new Thread(loadingTask);
						loadingThread.start();
						session.setAttribute("loadingThread", loadingThread);
						session.setAttribute("loadingTask", loadingTask);
					%>
				<script>		
					interId = setInterval('callback()', 200);
				</script>
				<%
				}
				else if(newCList_step.compareTo("5") == 0) //setup the default call_from call_to, extradata_ timezone
				{
				%>
					<table width="100%">
						<tr>
							<td width="50%" valign="top">
								<fieldset style="border:#999999 solid 1px">
									<legend style="color:#000000"><%= AddCalLstData.getWord("Dialing hours")%></legend>
									<table>
										<tr><td>&nbsp;</td><td>
										<%= AddCalLstData.getWord("From")%> &nbsp; 
											<select name="dialing_from" id="dialing_from">
												<%										
												for(int i = 0 ; i <= 24; i++)
												{
													String hstr = (i < 10) ? "0"+i : ""+i;
													out.write("<option value=\""+hstr+"00\">"+hstr+":00</option>");
													out.write("<option value=\""+hstr+"30\">"+hstr+":30</option>");
												}
												%>
											</select>									
											&nbsp; <%= AddCalLstData.getWord("To")%>  &nbsp;
											<select name="dialing_to" id="dialing_to">
												<%
												for(int i = 0 ; i <= 24; i++)
												{
													String hstr = (i < 10) ? "0"+i : ""+i;
													out.write("<option value=\""+hstr+"00\">"+hstr+":00</option>");
													out.write("<option value=\""+hstr+"30\">"+hstr+":30</option>");
												}
												%>
											</select>
										</td></tr>
										<tr><td valign="top"><i><%= AddCalLstData.getWord("Apply to")%></i></td><td valign="top">
											<input type="radio" name="hoursapplyto" value="all_records" /> <%= AddCalLstData.getWord("All records")%><br>
											<input type="radio" name="hoursapplyto" value="empty_records" /><%= AddCalLstData.getWord("Empty hours records")%><br>
											<input type="radio" name="hoursapplyto" value="none" checked/> <%= AddCalLstData.getWord("None")%><br>
										</td></tr>
									</table>
								</fieldset>							</td>
							<td width="50%">
								<fieldset style="border:#999999 solid 1px">
									<legend style="color:#000000"><%= AddCalLstData.getWord("Screen pop")%></legend>
									<table>
										<tr>
											<td><%= AddCalLstData.getWord("Url")%></td><td>
												<input type="text" name="cList_extrada" style="width:300px" />
											</td>
										</tr>
										<tr>
											<td valign="top"><!--<a href="#" onClick="javascript:adviceUrls()">--><i><%= AddCalLstData.getWord("Defined urls")%></i><!--</a>--></td><td>
												<select size="5" id="defined_urls" style=" width:300px" onChange="setCListExtraData(this.value)">
												<%
													Vector urlVec = getAllExtraDatas();
													
													for(int i = 0; i < urlVec.size(); i++)
													{														
														out.write("<option onclick=\"setCListExtraData(this.text)\" value=\""+(String)urlVec.elementAt(i)+"\">"+(String)urlVec.elementAt(i)+"</option>");
													}
													//Go and get a list of extradatas (from callinglists, from format and from )													
												%>
												</select>
											</td>											
										</tr>
										<tr><td valign="top"><i><%= AddCalLstData.getWord("Apply to")%></i></td> 
										<td valign="top">
											<input type="radio" name="extradataapplyto" value="all_records" /><%= AddCalLstData.getWord("All records")%><br>
											<input type="radio" name="extradataapplyto" value="empty_records" /><%= AddCalLstData.getWord("Records with no extradata")%><br>
										<input type="radio" name="extradataapplyto" value="none" checked/><%= AddCalLstData.getWord("None")%><br>										</td></tr>

									</table>
								</fieldset>							</td>
						</tr>
						<tr>
							<td width="100%" colspan="2">
								<fieldset style="border:#999999 solid 1px">
									<legend style="color:#000000"><%= AddCalLstData.getWord("Phone number purification")%></legend>
									<table>
										<tr>
											<td>&nbsp;</td>
											<td><i><%= AddCalLstData.getWord("Action")%></i></td>
										</tr>
										<tr>
											<td><i><%= AddCalLstData.getWord("Non numeric phone numbers")%></i></td>
											<td>
												<input type="radio" name="phone_purification_non_numeric" value="None" checked/><%= AddCalLstData.getWord("None")%> &nbsp;&nbsp;
												<!--<input type="radio" name="phone_purification_non_numeric" value="Remove_non_numeric" /> Remove non numeric caracters &nbsp;&nbsp;-->
												<input type="radio" name="phone_purification_non_numeric" value="Delete_record" /><%= AddCalLstData.getWord("Remove record")%>&nbsp;&nbsp;											</td>
										</tr>
										<tr>
											<td valign="top">
												<i><%= AddCalLstData.getWord("Prefix rules")%><br>
													<!--[<a href="#" onClick="showPhonePrefixRules()" style="font-size:10px">Edit rules</a>]--></i>											</td>
											<td valign="top">
													<select name="phone_prefix_rule">
														<option value=""></option>														
														<%
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
														%>
													</select>											</td>												
										</tr>
									</table>
								</fieldset>							
								</td>
						</tr>
						<tr>
							<td width="100%" colspan="2">
								<fieldset style="border:#999999 solid 1px">
									<legend style="color:#000000"><%= AddCalLstData.getWord("Time zones setup")%></legend>
									<i><!--[<a href="#" onClick="showTimeZoneRules()" style="font-size:10px">Edit rules</a>]--></i><br>
									<!-- -->
										<table width="100%">
											<tr>
												<td width="45%" valign="top"><%= AddCalLstData.getWord("Available rules")%><br>												</td>
												<td width="10%">&nbsp;</td>
											  <td width="45%" valign="top"><%= AddCalLstData.getWord("Selected rules")%><br>
												<img src="../img/movenext1.gif" width="20" height="20" style="cursor:pointer" alt="Down" onClick="moveTimeZoneRuleDown()">
												<img src="../img/moveprevious1.gif" width="20" height="20" style="cursor:pointer" alt="Up" onClick="moveTimeZoneRuleUp()">											  </td>
											</tr>
											<tr>
												<td width="45%" valign="top">													
													<select name="timezone_availablerules" size="5" style="width:100%;">
														<%
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
															
												%>
													</select>												</td>
												<td width="10%" valign="middle" align="center">
													<img src="../img/left_to_right.gif" style="cursor:pointer " onClick="javascript:chkAndAddTimeZoneRule()" /><br />
													<img src="../img/right_to_left.gif"  style="cursor:pointer " onClick="javascript:chkAndDropTimeZoneRule()"/>												</td>												
												<td width="45%" valign="top">
													<select name="timezone_selectedrules" size="5" style="width:100%;">
													</select>												</td>
											</tr>
											<tr>
												<td colspan="3">
													<%= AddCalLstData.getWord("Apply to")%>: 
														<input type="radio" name="timeZoneRulesApplyto" value="all_records" /><%= AddCalLstData.getWord("All records")%>&nbsp;&nbsp;
														<input type="radio" name="timeZoneRulesApplyto" value="empty_records"><%= AddCalLstData.getWord("Empty time zone records")%> &nbsp;&nbsp;
														<input type="radio" name="timeZoneRulesApplyto" value="none" checked><%= AddCalLstData.getWord("None")%>&nbsp;&nbsp;												</td>
											</tr>
										</table>
									<!-- -->
								</fieldset>							</td>
						</tr>
						<tr>
						  <td>
								<input type="hidden" name="timeZoneRulesStr">																			
								<input name="nextInfo"  type="button" value="<%= AddCalLstData.getWord("Next")%>" &gt;&gt;" onClick="addCList_next('<% out.write(newCList_step); %>')"/>
							<input name="finishedInfo" type="button" value="<%= AddCalLstData.getWord("Finished")%>" onClick="addCList_finished()"/>
							<input type="submit" name="submitHiddenButton" style="visibility:hidden " /></td>						
						</tr>
					</table>
				<%
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
				%>
					<script>sqlInsertionStart = currentTimestamp();</script>
						<table align="center" width="50%" cellpadding="2" cellspacing="2" style="background-color:ThreeDFace; border:3px solid #666666">
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><b><%= AddCalLstData.getWord("Queries status")%></b></td>								
							</tr>
							<tr>
								<td align="center"><b><%= AddCalLstData.getWord("Actions")%></b></td>
								<td align="center"><b><%= AddCalLstData.getWord("Status")%></b></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="border:1px solid #000000" align="left" id="afterQueries_DailyHours"><%= AddCalLstData.getWord("Daily hours")%></td>
								<td style="border:1px solid #000000" align="center" id="afterQueries_DailyHoursStatus">&nbsp;</td>
								<td style="border:1px solid #000000" align="left" id="afterQueries_DailyHoursMessage">&nbsp;</td>
							</tr>
							<tr>
								<td style="border:1px solid #000000" align="left" id="afterQueries_ExtraData"><%= AddCalLstData.getWord("Extra data")%></td>
								<td style="border:1px solid #000000" align="center" id="afterQueries_ExtraDataStatus">&nbsp;</td>
								<td style="border:1px solid #000000" align="left" id="afterQueries_ExtraDataMessage">&nbsp;</td>
							</tr>
							<tr>
								<td style="border:1px solid #000000" align="left" id="afterQueries_NonNumeric"><%= AddCalLstData.getWord("Non numeric phone numbers")%></td>
								<td style="border:1px solid #000000" align="center" id="afterQueries_NonNumericStatus">&nbsp;</td>
								<td style="border:1px solid #000000" align="left" id="afterQueries_NonNumericMessage">&nbsp;</td>
							</tr>
							<tr>
								<td style="border:1px solid #000000" align="left" id="afterQueries_PrefixRules"><%= AddCalLstData.getWord("Prefix rules")%></td>
								<td style="border:1px solid #000000" align="center" id="afterQueries_PrefixRulesStatus">&nbsp;</td>
								<td style="border:1px solid #000000" align="left" id="afterQueries_PrefixRulesMessage">&nbsp;</td>
							</tr>
							<!--
							<tr>
								<td style="border:1px solid #000000" align="left" id="afterQueries_BlackRules">Black list rules</td>
								<td style="border:1px solid #000000" align="center" id="afterQueries_BlackRulesStatus">&nbsp;</td>
								<td style="border:1px solid #000000" align="left" id="afterQueries_BlackRulesMessage">&nbsp;</td>
							</tr>
							-->
							<tr>
								<td style="border:1px solid #000000" align="left" id="afterQueries_TimeZones"><%= AddCalLstData.getWord("Time zones")%></td>
								<td style="border:1px solid #000000" align="center" id="afterQueries_TimeZonesStatus">&nbsp;</td>
								<td style="border:1px solid #000000" align="left" id="afterQueries_TimeZonesMessage">&nbsp;</td>
							</tr>
							
						</table>	
						
						<br>
						
						<table>
							<tr>
								<td>									
								
						<input  disabled name="nextInfo"  type="button" value="<%= AddCalLstData.getWord("Next")%>" &gt;&gt;" onClick="addCList_next('<% out.write(newCList_step); %>')"/>
							  
							   <input type="submit" name="submitHiddenButton" style="visibility:hidden ">		
								
								</td>						
							</tr>
						</table>
								
						<%
							//just start the queries thread...
							beanAfterQueries.setCallingListObj(beanCList);
							beanAfterQueries.resetAllStatus();
							Thread queryThread = new Thread(beanAfterQueries);
							queryThread.start();
							session.setAttribute("queryThread", queryThread);
							session.setAttribute("beanAfterQueries", beanAfterQueries);
						%>
					<script>		
						interId = setInterval('callbackQueryStatus()', 200);
					</script>
						
						
				<%				
				}
				else if(newCList_step.compareTo("7") == 0) //last Panel and save format
				{
					//calculate the final statistics
					
					beanCList.setupFinalStats();
					session.setAttribute("beanCList", beanCList);
					%>
					
					<table align="center" width="50%" cellpadding="2" cellspacing="2" style="background-color:ThreeDFace; border:3px solid #666666">
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><b><%= AddCalLstData.getWord("Diagnostic")%></b></td>
								<td>&nbsp;</td>								
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><%= AddCalLstData.getWord("Loaded records")%></td>
								<td align="right">&nbsp;<%=beanCList.getTotalLoadedRecord() %></td>
							</tr>
							<tr>
								<td><%= AddCalLstData.getWord("Records in table")%></td>
								<td align="right">&nbsp;<%=beanCList.getTotalRecordsInTable() %></td>
							</tr>
							<tr>
								<td><%= AddCalLstData.getWord("Records with no time zone")%></td>
								<td align="right">&nbsp;<%=beanCList.getTotalRecordsNoTimeZoneInTable() %></td>
							</tr>
							<tr>
								<td><%= AddCalLstData.getWord("Records with no extra data")%></td>
								<td align="right">&nbsp;<%=beanCList.getTotalRecordsNoExtradataInTable() %></td>
							</tr>
					</table>
					
					
					<%				
					
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
					%>
					
					<table>
							<tr>
								<td>									
						
								<input  name="nextInfo"  type="button" value="<%= AddCalLstData.getWord("Finished")%>" onClick="addCList_finished()"/>

								</td>						
							</tr>
					</table>
					
					<%		
					
					
				}
				%>
		</fieldset>
	</div>
	<%
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
	
	%>
</form>
</div>
<script type="text/javascript">
	//<![CDATA[
	setupAllTabs();
	//]]>
</script>
<div class="TempMessages" id="TempMessages"> 
  <table border="0" width="100%" cellpadding="0" cellspacing="0" height="100%">
    <tr> 
      <td width="100%" id="TempMsg" align="center" class="TempMsg"></td>
    </tr>
  </table>
</div>
</body>
<% AddCalLstData.closeConnection(); %>
</html>
