<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<%@page contentType="text/html"%>
<%@page language = "java"%>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*"%>
<%
if (request.getParameter("password") == null)
{
%>
	<body>
	<form id="loginProductionVerif" action="loginProductionVerif.jsp?tenant_dbid=<%=request.getParameter("tenant_dbid")%>" target="_self" method="post">
	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="80%">
	  <tr>
		<td valign="top" style="border-right-style: none; border-right-width: 1; border-top-style: none; border-top-width: 1" colspan="4">
		  <div align="center">
			<span font-size: 16px; font-weight: bold;>
				Please enter your password
				<script language="javascript" type="text/javascript">
				</script>
			</span>
		  </div>
		</td>
	  </tr>
	  <tr><td height="25">&nbsp;</td></tr>
	  <tr>
		  <td height="25" align="center"> 
			<input type="password" name="password" id="password">
		  </td>
	  </tr>
	  <tr><td height="25">&nbsp;</td></tr>
	  <tr>
		<td valign="bottom" align="center">
			<input name="getReport" type="submit" value="Submit" >
		</td>
	  </tr>
	</table>
	</form>
<%
}
else
{
    String realPassword = "";
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
	if (conn != null) 
	{
		System.out.println("Conn non null");
	}
	stat = conn.createStatement();
	if (stat != null) 
	{
		System.out.println("Stat non null");
	}
    java.sql.ResultSet rs = null;
    try {
      String sqlCmd = "SELECT PASSWORD FROM cfg_user WHERE USERNAME = 'geek' ";
      System.out.println("sqlCmd [" + sqlCmd +"]");
      rs = stat.executeQuery(sqlCmd);
      if (rs.next()) {
        realPassword = rs.getString("PASSWORD");
      }
	conn.close();  
	String tenant_id = request.getParameter("tenant_dbid");
	//out.write("tenant = "+tenant_id);
	if (realPassword.compareTo(request.getParameter("password")) == 0)
		{
		out.write("<script language='javascript' type='text/javascript'>");
		out.write("document.location = './loginProductionDatePicker.htm?type=report&tenant_dbid="+tenant_id+"'");
		out.write("</script>");
		
		}
	else
		{
		out.write("<script language='javascript' type='text/javascript'>");
		out.write("document.location = './loginProductionVerif.jsp?tenant_dbid="+tenant_id+"'");
		out.write("</script>");
		}
    }
    catch(Exception e)
    {
     e.printStackTrace();
    }
}
%>
</body>
</html>