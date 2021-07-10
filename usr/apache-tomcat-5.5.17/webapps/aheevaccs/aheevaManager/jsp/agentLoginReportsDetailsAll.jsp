<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="aheevaManager.reports.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import ="java.io.*"%>
<%@page import = "java.io.File" %>
<%@page import = "java.io.RandomAccessFile" %>
<%@page import = "java.io.FileNotFoundException" %>
<%@page import = "java.io.IOException" %>
<%@page import ="javax.naming.*"%>
<%@page import ="javax.sql.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="aheevaManager.csvinterface.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();

long tLoginTime = 0, ssLoginTime =0, totLoginTime=0;
String tempLastName="", tempFirstName ="", LastName="", FirstName ="", writeName="";
long GroupForAgent =1, first =1;
%>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<table width="100%" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="100%" align="center">
			<table width="90%" align="center">
				<tr><td height="30"></td></tr>
				<tr>
					<td width="100%" align="center" ><font color="#003366">
						<b><% 
							//out.write(reportType);
							if (reportType.compareTo("Daily")==0) 
							    {
								  out.write(pageData.getWord("Daily"));
								}
							else if (reportType.compareTo("Monthly")==0) 
							    {
								out.write(pageData.getWord("Monthly"));						
								}
							else if (reportType.compareTo("Yearly")==0) 
							    {
								out.write(pageData.getWord("Yearly"));
								}
						 %>
												
							<%= pageData.getWord("Agent Login Reports")%><br><br>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(startingDateDaily.substring(6)+"-"+ startingDateDaily.substring(0,2)+"-"+startingDateDaily.substring(3,5));
							} else if (reportType.compareTo("Monthly") ==0){
								out.write(starting_year_monthly+"-"+starting_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(starting_year_yearly);
							}
							%>
							<%= pageData.getWord("To")%>
							<%
							if (reportType.compareTo("Daily") ==0){
								out.write(endingDateDaily.substring(6)+"-"+ endingDateDaily.substring(0,2)+"-"+endingDateDaily.substring(3,5));
							}else if (reportType.compareTo("Monthly") ==0){
								out.write(ending_year_monthly+"-"+ending_month_monthly);
							} else if (reportType.compareTo("Yearly") ==0){
								out.write(ending_year_yearly);
							}
							%>
						</b></font>
					</td>
				</tr>
				<tr><td height="20"></td></tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="90%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse ">
			  <tr class="reportsTabName" >
				<td width="15%" align="center"> <b><%= pageData.getWord("Agent ID")%></b> </td>
				<td width="15%" align="center"> <b><%= pageData.getWord("Agent name")%></b> </td>
				<td width="15%" align="center"> <b><%= pageData.getWord("Group name")%></b> </td>
				<td width="20%" align="center"> <b><%= pageData.getWord("First login")%></b> </td>
				<td width="20%" align="center"> <b><%= pageData.getWord("Last Logout")%></b> </td>
				<td width="15%" align="center"> <b><%= pageData.getWord("Total login time")%></b> </td>
			  </tr>
<!-- traverse the array -->
			<%
				try {
					  for (j = 0; j < beanAgentLoginReport.m_vAllDetails.size(); j++)
					   {
						 r1 = (beanAgentLoginInfo)beanAgentLoginReport.m_vAllDetails.elementAt(j);
						 //if(r1 ==null) System.out.println("r1 ==null");
						 //else System.out.println("r1 !=null");
						 if(r1.last_name != null) LastName=r1.last_name;
						 else LastName= " ";
						 if(r1.first_name != null) FirstName =r1.first_name;
						 else FirstName = " ";
					   if(LastName.compareTo(tempLastName) == 0 && FirstName.compareTo(tempFirstName) ==0)
					   {	
					   		writeName =" ";
							GroupForAgent =GroupForAgent +1;
					   }
					  else
					  	{
					  	
							if(first ==0 && GroupForAgent >1) //previous agent has 2 group
							{%>
								<tr>
									 <td bgcolor="#FFECF5" align="center"><font color="#000000"><b> <%= pageData.getWord("Sub total")%> </b></font></td>
									 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(tempLastName+" "+tempFirstName);%></font></td>
									 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
									 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
									 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><%out.write(" ");%></font></td>
									 <td bgcolor="#FFECF5" align="center"><font  color="#000000"><b> <%out.write(r1.buildReadableTime(tLoginTime));%></b></font></td>
								</tr>
								<%
								GroupForAgent =1;
							}
							tLoginTime=0;
							writeName =LastName+" "+FirstName;
					   }
						%>
				  <tr <% if(j%2 == 0) out.write("class=reportsRowPair");
							else out.write("class=reportsRowUnPair");%> >
					  <td  align="center"><%out.write(r1.agt_id);%></td>
					  <td   align="left" nowrap>&nbsp;&nbsp;<%out.write(writeName);%></td>
					  <td    align="center" nowrap><font color="#800000"><%out.write(r1.grp_name);%></font></td>
					  <td    align="center" nowrap><%out.write(r1.getFirstLoginTime());%> </td>
					  <td    align="center" nowrap><%out.write(r1.getLastLogoutTime());%> </td>
					  <td  align="center"><%out.write(r1.getTotalLoginTime());%></td>
				  </tr>
		<!-- end of array traversal-->
		<%
			   if(r1.getLastLogoutTime().compareTo("Unknow")==0)
			   {
			   System.out.println("\n begin lastLogoutTime==Unknow");
			   %>
				<tr>
					 <td bgcolor="#DCEDED" align="right" colspan="4"><font color="#000000"><b>
					 <%= pageData.getWord("Next logout")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
					 <td bgcolor="#DCEDED" align="center"><%out.write(r1.getNextLogoutTime());%></td>
					 <td bgcolor="#DCEDED" align="center"><font  color="#000000"><b> <%out.write(" ");%></b></font></td>
				</tr>
			   <%
			   System.out.println("\n end lastLogoutTime==Unknow");
			   }
		
			   tLoginTime += r1.totalLoginTime;
			   tempLastName=LastName;  tempFirstName =FirstName;
				first =0;	
			   if(GroupForAgent >1)
			   		System.out.println("GroupForAgent " + Long.toString(GroupForAgent));
			  } //end for
			//r1 = new beanAgentLoginInfo();
		  }//end try
		  catch( Exception e){
				out.write("<tr><td><p><font size=2>"+ pageData.getWord("Error while generating agent login report") +" </font></p></td></tr>");
		  }// end catch
		  catch (Error e){
				out.write(" ");
		  }
%>
			</table>
		</td>
	</tr>
</table>
<% pageData.closeConnection(); %>
