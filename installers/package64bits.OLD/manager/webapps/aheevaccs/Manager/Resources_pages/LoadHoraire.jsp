<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>

<%@page import ="com.mysql.jdbc.*"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%
	boolean upload = false;
        String directory = request.getRealPath("Manager/uploads");
	String tmpdirectory = request.getRealPath("Manager/uploads");
%>
<% boolean createsubfolders = true; %>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%= directory %>" />
  <jsp:setProperty name="upBean" property="parser" value="<%= MultipartFormDataRequest.CFUPARSER %>"/>
  <jsp:setProperty name="upBean" property="parsertmpdir" value="<%= tmpdirectory %>"/>
  <jsp:setProperty name="upBean" property="filesizelimit" value="8589934592"/>
</jsp:useBean>

<!-- Calendar required javascript -->
<link rel="stylesheet" href="../Resources_pages/xc2_default.css" type="text/css">
<script language="javascript" src="../Resources_pages/xc2_default.js"></script>
<script language="javascript">xcAutoHide=1000;</script>
<script language="javascript" src="../Resources_pages/xc2_inpage.js"></script>

<!-- End of calendar required section -->

<head>

<%
String source_file_name = "";
  if (MultipartFormDataRequest.isMultipartFormData(request))
  {
      MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

      upBean.store(mrequest);
      upload = true;
      Vector histVect = upBean.getHistory();
      UploadParameters lastParams = (UploadParameters) histVect.elementAt(0);
      source_file_name = lastParams.getFilename();

  }
%>


<!-- DO I NEED THAT ?????/ -->
<!--jsp:useBean id="loadingTask" scope="session" class="Manager.ressources.beanImportCallingListTask" /-->
<!--jsp:useBean id="beanCList"   scope="session" class="Manager.ressources.beanLoadCallingList" /-->
<!--jsp:useBean id="beanAfterQueries"  scope="session" class="Manager.ressources.beanCallingListAfterQueries" /-->




<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- this link element includes the css definitions that describes the tab pane -->
<!--
<link type="text/css" rel="stylesheet" href="tab.winclassic.css" />
-->
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/tab_luna.css" />
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="../Resources_pages/style_2.css" />
<link href="grid.css" rel="stylesheet" type="text/css" ></link>
<style type="text/css">

.dynamic-tab-pane-control .tab-page {
	height:		200px;
}

.dynamic-tab-pane
-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		100px;
}

html, body {
	background:	ThreeDFace;
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
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/callingListFuncs.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/tabpane.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/Browser.js"></script>

<script language="javascript" type="text/javascript">

function getAction(){
  document.loadhoraire.action = '/aheevaccs/servlet/LoadScheduleServlet' ;
  return true;
}

function upload(){
  document.loadhoraire.action = 'LoadHoraire.jsp' ;
return true;
}

</script>

<title>Atelka - Load Horaire</title>
<body>

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
		<h2 class="tab">New</h2>
		<script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );</script>
		<fieldset>
			<legend>load schedule Wizard</legend>
				<table>
                                 <tr>
				  <td>
				   <input type="radio" name="file_extension" value="csv" onClick="">csv<br>
				  </td>
				 </tr>
				 <tr>
				  <td>
				    Source File Name:
                                    <% if(upload==false ){ %>
                                     <input name="source_file_name" type="file" size="40" >
                                    <%}else{%>
                                     <%out.write(source_file_name);%>
                                   <%}%>
                                    <input type="hidden" name="fileName" value='<%out.write(source_file_name);%>'>
                                  </td>
				 </tr>
                                 <% if(upload==true ){ %>
                                 <tr>
                                  <td>
  	                          Start Date
                                  <input  id="id_startingDateDaily" type="text" size="20" onFocus="showCalendar('',this,this,'','id_startingDateDaily',0,30,1);this.blur()" name="startingDateDaily" />
                                  &nbsp;&nbsp;

      	                          End Date
                                  <input type="text" id="id_endingDateDaily" size="20" onFocus="showCalendar('',this,this,'','id_endingDateDaily',0,30,1);this.blur()" name="endingDateDaily"/>
                                 </td>
                                </tr>
                                <tr><td>Agent Group
                                <select name="group_dbid" >
				  <option value="34">Microcell_rac</option>
				  <option value="32">Microcell_prepaid</option>
				</select>
                               </td></tr>
                               <%}%>

						<tr>
						 <td>
                                                 <% if(upload==false ){ %>
                                                 <input type="submit" name="loadButton" value="upload" onClick="return upload();">
                                                 <%}else{%>
						 <input type="submit" name="submitButton" value="submit"  onClick="return getAction();">
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

</html>
