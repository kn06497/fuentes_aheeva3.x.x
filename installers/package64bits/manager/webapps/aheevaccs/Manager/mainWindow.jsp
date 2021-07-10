<html>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.util.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="Manager.ressources.*"%>

<%
	session.setMaxInactiveInterval(-1);		/* this session should never expire */
	if( request.getParameter("lang") != null )
	{
		String user_number = request.getParameter("lang");
		if( user_number.compareTo("0") == 0 )
			session.setAttribute("USER_LANGUAGE", "ENGLISH");
		else if( user_number.compareTo("1") == 0 )		
			session.setAttribute("USER_LANGUAGE", "FRENCH");
		else if( user_number.compareTo("2") == 0 )
			session.setAttribute("USER_LANGUAGE", "ESPAGNOL");
			
		session.setAttribute("USER_LANGUAGE_NUMBER", request.getParameter("lang"));
	}
	else
	{
		session.setAttribute("USER_LANGUAGE", "ENGLISH");
		session.setAttribute("USER_LANGUAGE_NUMBER", "0");
	}	
	
	if( request.getParameter("user_dbid") != null )
		session.setAttribute("CURRENT_USER_DBID", request.getParameter("user_dbid"));
%>
<head>

<LINK href="Resources_pages/style.css" rel="stylesheet" type="text/css" />


<script language="JavaScript" src="Resources_pages/jsUtil.js"> </script>
<script language="javascript" type="text/javascript" src="Resources_pages/Browser.js"></script>

<title>Aheeva CCS Manager</title>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>

<%
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	String currentUserData = "SELECT ALLOW_CONFIGURATION_MANAGEMENT, ALLOW_TENANT_VIEW, ALLOW_VIEW_LIVE_STATS FROM cfg_user WHERE dbid = '"+CURRENT_USER_DBID+"'";
	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	pageData.executeFromString(currentUserData);
	Vector <HashMap> currentUserDataResult = pageData.CreateVectorFromBean();	
	pageData.closeConnection();
	
	int left_frame_width 		= 240;	//default values
	int top_frame_width_percent  = 65;	//default values
	
	if( currentUserDataResult.size() == 1 )
	{
		String allow_config 	= (String)currentUserDataResult.elementAt(0).get("ALLOW_CONFIGURATION_MANAGEMENT");
		String allow_tenant 	= (String)currentUserDataResult.elementAt(0).get("ALLOW_TENANT_VIEW");
		String allow_livestat 	= (String)currentUserDataResult.elementAt(0).get("ALLOW_VIEW_LIVE_STATS");
		
		if( allow_config.compareTo("yes") != 0 && allow_tenant.compareTo("yes") != 0 ) /* none of this was allowed */
		{
			if(allow_livestat.compareTo("yes") != 0) /* nothing is allowed here ... Permission denied */
			{
				%>
				<jsp:include page="Resources_pages/forbidden.htm"></jsp:include>
				<%
				return;			
			}
			
			left_frame_width = 0; 			/* no left frame */
			top_frame_width_percent = 100;  /* no bottom frame */
		}
		else if(allow_livestat.compareTo("yes") != 0)		/* Allow for the menu and bottom frame but not live stats */
		{
			top_frame_width_percent = 0;  /* no top frame */
		}
	}
%>

<frameset  id="ColFrameset"  border="0"  frameborder="0"  framespacing="5"  cols="<%=left_frame_width%>,*" >
	<frame name="left" scrolling="yes" target="rtop"  CLASS="FrameBorders"  src="menu.jsp">
	<frameset id="RowFrameset"  border="0"  frameborder="0"   framespacing="5"  rows="<%=top_frame_width_percent%>%,<%=(100-top_frame_width_percent)%>%">
		<frame name="rtop" target="rbottom"  CLASS="FrameBordersTop" src="top.jsp" >
		<frame name="rbottom" target="rbottom"  CLASS="FrameBorders"  src="Contents.htm" >
	</frameset>
</frameset>

<noframes></noframes>

</html>