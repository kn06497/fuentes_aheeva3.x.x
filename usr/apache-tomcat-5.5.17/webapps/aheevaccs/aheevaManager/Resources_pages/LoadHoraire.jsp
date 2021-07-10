<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.lang.*"%>

<%@page import ="com.mysql.jdbc.*"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "aheevaManager.ressources.*" %>
<%
	boolean upload = false;
	String msg = request.getParameter("msg");
    String directory = request.getRealPath("Manager/uploads");
	String tmpdirectory = request.getRealPath("Manager/uploads");
	String tenantDbid = request.getParameter("tenant_dbid");
	System.out.println("----- TENANT "+tenantDbid);
	
	beanManagerData pageloadhData = new beanManagerData();
	pageloadhData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageloadhData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<% boolean createsubfolders = true; %>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%= directory %>" />
  <jsp:setProperty name="upBean" property="parser" value="<%= MultipartFormDataRequest.CFUPARSER %>"/>
  <jsp:setProperty name="upBean" property="parsertmpdir" value="<%= tmpdirectory %>"/>
  <jsp:setProperty name="upBean" property="filesizelimit" value="8589934592"/>
</jsp:useBean>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<link rel="stylesheet" href="../Resources_pages/xc2_default.css" type="text/css">
<LINK href="../Resources_pages/livestats.css" 	rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Language" content="en-us">

<link href="grid.css" rel="stylesheet" type="text/css" ></link>
<script language="JavaScript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>

<script>
var lang = normalizeString(QueryString('lang'));
if( lang == null || lang == 'null' )
	lang = 0;
	

</script>
<%@ include file="xc2_default_labels.jsp" %>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<!-- Calendrier début -->
<script language="javascript" src="../Resources_pages/xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="../Resources_pages/xc2_inpage.js"></script>
<!-- Calendrier fin -->

<%
String source_file_name = "";
  if (MultipartFormDataRequest.isMultipartFormData(request))
  {
      MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

      upBean.store(mrequest);
      //upload = true;
      Vector histVect = upBean.getHistory();
	  if(histVect.size() <= 0)
	  {
	  %>
	  	<script> alert("<%= pageloadhData.getWord("Please choose a file")%>");</script>
		
	  <%
	  	upload = false;
	  }
	  else
	  {
      	UploadParameters lastParams = (UploadParameters) histVect.elementAt(0);
      	source_file_name = lastParams.getFilename();
	  	if(source_file_name.endsWith(".csv"))
	  		upload = true;
	  	else
	  	{	  	
	 %>
	   		<script> alert("<%= pageloadhData.getWord("Invalid input file")%>");</script>
	 <%
	 		upload = false;
	  	}
     }//histVect.size()>0
  }//if (MultipartFormDataRequest.isMultipartFormData(request))
    
  Vector<String> groupNames = new Vector();
  Vector<String> groupIds = new Vector();
  String getGrouprQry = "Select DBID, NAME from `cfg_agent_group` where tenant_DBID = '"+tenantDbid +"'";
  //System.out.println("\n****** LOAD HORAIRES ***********************************\n\n");
  //System.out.println("----- la liste des groupes est: "+ getGrouprQry);
  
  //get info from database
  try{
  	
	//get tenant info list
  	ResultSet groupRs = pageloadhData.executeFromString(getGrouprQry);
  	while(groupRs.next())
	{
		groupNames.add(groupRs.getString("NAME"));
		groupIds.add(groupRs.getString("DBID"));
	}//while(tenantRs.next())
	
  	
  }//try
  catch (Exception e) {
 	e.printStackTrace();
  }
  
  %>
<style type="text/css">

.dynamic-tab-pane-control .tab-page {
/*	height:		200px;*/
}
.dynamic-tab-pane
-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}

html, body {
	/* background:	ThreeDFace; */
	
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
<script language="javascript" type="text/javascript">
function getAction(){
/******************
	var nbGroup = 0;
	for(i=document.loadhoraire.group_dbid.selectedIndex;i<document.loadhoraire.group_dbid.options.length;i++)
	{
		if (document.loadhoraire.group_dbid.options[i].selected)
			nbGroup++;
	}
	if(nbGroup<=0)
	{
		alert("Please select a group.");
		document.loadhoraire.action = 'LoadHoraire.jsp?source_file_name=<%=source_file_name%>' ;
		//return false;
		
	} **********************/
  document.loadhoraire.action = '/aheevaccs/servlet/LoadScheduleServlet?tenant_dbid=<%=tenantDbid%>' ;
  
  return true;
}

function upload(){   
  document.loadhoraire.action = 'LoadHoraire.jsp?tenant_dbid=<%=tenantDbid%>' ;
return true;
}

</script>

<title>Atelka - Load Horaire</title>
</head>
<body class="sched_body">
<div class="tab-pane" id="tabPane1">
<form name="loadhoraire"  method="post"
<%
		if(upload==false )
			out.write("enctype=\"multipart/form-data\"");
	%>
>


<script type="text/javascript">
tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
</script>
	<div class="tab-page" id="tabPage1">
		<h2 class="tab"><%= pageloadhData.getWord("Import")%></h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );</script>
		<fieldset>
			<legend><%= pageloadhData.getWord("load schedule Wizard")%></legend>
				<table>
                  <% if(msg != null && msg.compareTo("1")== 0 ){ %>
                  <tr>&nbsp;&nbsp; </tr>
				  <tr> <td align="left" style="color:blue" ; font-weight:bold> <%= pageloadhData.getWord("Schedule Submited")%>   </td></tr>
				  <%}%>
				  <% if(msg != null && msg.compareTo("0")== 0 ){ %>
				  <tr>&nbsp;&nbsp; </tr>
                  <tr> <td align="left" style="color:red" ; font-weight:bold > <%= pageloadhData.getWord("Error occured while submitting schedule")%>   </td></tr>
				  <%}%>
				  
				  <tr>
				  <td>
				   <%= pageloadhData.getWord("Please upload a file with csv format (*.csv)")%><br>
				 </td>
				 </tr>
				 <tr>
				  <td>
				  <%= pageloadhData.getWord("Source file name:")%>
                                    <% if(upload==false ){ %>
                                     <input name="source_file_name" type="file" size="40" >
                                    <%}else{%>
                                     <%out.write(source_file_name);%>
                                   <%}%>
                                    <input type="hidden" name="fileName" value='<%out.write(source_file_name);%>'>
                                  </td>
								 </tr>
                                 <% if(upload==true ){ %>
								
								<tr><td><%= pageloadhData.getWord("Agent group")%>
                                &nbsp;&nbsp;
                 
				<select name="group_dbid" >	   
				<%for(int i=0; i<groupIds.size(); i++){%>
  				<option value="<%=groupIds.elementAt(i)%>"><%=groupNames.elementAt(i)%></option>
            	<% } %>
				</select>
                               </td></tr>
                               <%}%>

						<tr>
						 <td>
                                                 <% if(upload==false ){ %>
                                                 <input type="submit" name="loadButton" value="<%= pageloadhData.getWord("upload")%>" onClick="return upload();">
                                                 <%}else{%>
						 <input type="submit" name="submitButton" value="<%= pageloadhData.getWord("submit")%>"  onClick="return getAction();">
                                                 <%}%>
						 </td>
						</tr>
					</table>
		</fieldset>
	</div>
</form>
</div>
<script type="text/javascript">

	setupAllTabs();

</script>
<div class="TempMessages" id="TempMessages">
  <table border="0" width="100%" cellpadding="0" cellspacing="0" height="100%">
    <tr>
      <td width="100%" id="TempMsg" align="center" class="TempMsg"></td>
    </tr>
  </table>
</div>
</body>
<%pageloadhData.closeConnection(); %>
</html>
