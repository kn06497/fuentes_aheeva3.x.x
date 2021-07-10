
<html>
<%@page import = "aheevaManager.ressources.*" %>
<%
////open connection to database///////
beanManagerData pageListnRecData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageListnRecData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageListnRecData.openConnection();
%>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<LINK href="../Resources_pages/livestats.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>

<style type="text/css">
<script language="javascript" src="../Resources_pages/Browser.js" type="text/javascript"></script>

html, body {
	background:;
}

.reportLook {
	clear:			both;
	border:			1px solid rgb( 145, 155, 156 );
	background:		rgb( 252, 252, 254 );
	z-index:		2;
	position:		relative;
	top:			-2px;
 	font:			11px Tahoma;
	color:			Black;
 	filter:			progid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)
					progid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);
  	padding:		10px;
}
</style>

<%@page contentType="text/html"%>
<head>
<title> Recording</title>

<% String rec_id ="0";%>
  
<%@page language = "java" %>
<%@page import   ="java.util.*"%>
<%@page import   ="java.io.*"%>
<%@page import   ="java.text.*"%>
<%@page import   ="aheevaManager.reports.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<jsp:useBean id="beanRecord" scope="request" class="aheevaManager.reports.beanListenRecord" />

<script>
function goEvaluationForm(p1) 
	{
		window.open('conversationRecordingEvaluation.jsp?view=1&recid='+p1,'formWindow','scrollbars=yes,width=800,height=600,status=yes,resizable=yes');//,'scrollbars=yes,width=600,height=400'
		
	}
</script>

</head>
<body class="bottompagebody">
<%

	beanManagerData pageData = new beanManagerData();
	pageData.openConnection();
	//pageData.setDebug(true);
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	
   
   
    long tLoginTime = 0;
    long tNotReadyTime = 0;
    String option ="", tmp ="";
    String startingDate = request.getParameter("startingDate");
		startingDate =(startingDate == null ? "" : startingDate);
    String endingDate   = request.getParameter("endingDate");
		endingDate =(endingDate == null ? "" : endingDate);

	if(startingDate.length() > 6)
		startingDate = startingDate.substring(6)+"/"+ startingDate.substring(0,2)+"/"+startingDate.substring(3,5) ;
	if(endingDate.length() > 6)
		endingDate = endingDate.substring(6)+"/"+ endingDate.substring(0,2)+"/"+endingDate.substring(3,5) ;

    String ip  = request.getParameter("ip");
		ip =(ip == null ? "" : ip);
    String user  = request.getParameter("user");
		user =(user == null ? "" : user);
 
 	String feval = (request.getParameter("feval")==null)?"0":request.getParameter("feval");
 
    beanListenDetails r1=null;
    try{
 		beanRecord.getListenRecordsHistory (startingDate,endingDate,ip, user,feval);
    	System.out.println("\n All queries are completed in beanRecord. Construction JSP info") ;
   }catch(Exception e){
        //e.printStackTrace();
		System.out.println("\n  Error in JSP ..") ;

    }

%>


<p align="center">&nbsp; </p>

  <fieldset > <legend class="genericTitle"> <b> <%= pageListnRecData.getWord("Record listening report")%>   </b></legend>
<br>   
<div class="reportLook" > 
  <table width="400" border="0" align="center" >
    <tr> 
      <td align=left> 
        <!-- </div>-->
      </td>
    </tr>
    <tr class="reportsID"> 
      <td class="textblack"><div > <b> 
          <%= pageListnRecData.getWord("Listen history")%>
          <% if(startingDate.length() >0) out.write(pageListnRecData.getWord("From")+": "+startingDate);%>
          <% if(endingDate.length() >0) out.write(pageListnRecData.getWord("To")+": " + endingDate);%>
          </b></div></td>
    </tr>
    <tr> 
      <td> <div > <b> 
          <% if(ip.length()>0) out.write(pageListnRecData.getWord("where IP")+" = " + ip);%>
          </b></div></td>
    </tr>
  </table>
  <p  class="reportsID"> 
  <div style="background-color:#EAEAEA; width: 800; height:18 " ><b> 
    <%   
			if(user.length() > 9){
				if(user.substring(0,9).compareTo("AllUsers/")== 0 )
					out.write(pageListnRecData.getWord("User")+"["+ pageListnRecData.getWord("All Users")+"]");
				else
					out.write( pageListnRecData.getWord("User")+" [" +user+"]");
			}
		%>
    </b> </div></p>   
  <table border="2"  cellpadding="0" cellspacing="1" style="border-collapse:separate; border-style:dotted; border-color:#DCDAD6"  width="800" id="AutoNumber1">
    <tr class="reportsTab"> 
      <td width="150"  height="30" align="center"> <%= pageListnRecData.getWord("Event time")%> 
      </td>
      <td  align="center"> <%= pageListnRecData.getWord("User")%> 
      </td>
      <td  align="center"> <%= pageListnRecData.getWord("IP Address")%> 
      </td>
      <td  align="center"> <%= pageListnRecData.getWord("File name")%> 
      </td>
	  <td  align="center"> <%= pageListnRecData.getWord("Type")%> 
      </td>
      <td  align="center"> <%=pageData.getWord("Evaluation")%></td>
    </tr>
    <%

  if(beanRecord.m_vAllDetails.size() > 0){
   try{
     for (int i = 0; i < beanRecord.m_vAllDetails.size(); i++) {
         r1 = (beanListenDetails)beanRecord.m_vAllDetails.elementAt(i);
	%>
    <tr <% if(i%2 == 0) out.write("class=conversationRowPair");
  			else out.write("class=reportsRowUnPair");%> > 
      <td width="150"  align="center"><%if(r1.listenTime != null)  out.write(r1.listenTime);%></td>
      <td    align="center"><%if(r1.user != null) out.write(r1.user);%></td>
      <td    align="center"><%if(r1.ip != null) out.write(r1.ip);%></td>
      <td    align="center"><%if(r1.file != null) out.write(r1.file);%></td>
	  <td    align="center"><%if(r1.file != null ){
								if(r1.file.substring(r1.file.length() - 3).compareTo("mp3") == 0) out.println("Audio");
								else if (r1.file.substring(r1.file.length() - 3).compareTo("wav") == 0) out.println("Audio");
								else if (r1.file.substring(r1.file.length() - 3).compareTo("swf") == 0) out.println("Video");
								else out.print("Unknown");
							}
	%></td>
	<td    align="center">
         <%
         if ((r1.eval_dbid).compareTo("")!=0)
         {
         	%> 
        	 <input type="button" value="<%=pageData.getWord("View evaluation")%>" onClick="goEvaluationForm(<%=r1.record_id%>);">
    		<%
    	}
    	else
    	{
    	%>&nbsp;<%
    	}
    	%>
    </td>	
		
    </tr>
    <%
    } //end for
	
   }catch(Exception e){
  	  out.write("<tr ><td colspan=4 align=\"center\" height=50><b>&nbsp;"+ pageListnRecData.getWord("Error while generating report")+".. </b></font></td></tr>");
   }
  }//end if
  else{
	  out.write("<tr ><td colspan=4 align=\"center\" height=50><b>&nbsp; "+ pageListnRecData.getWord("No records available")+" </b></font></td></tr>");
  }
%>
    <tr> 
      <td colspan=6><b> 
        <%= pageListnRecData.getWord("Found")%>
        &nbsp;
        <% out.write(Integer.toString(beanRecord.m_vAllDetails.size()));%>
        &nbsp; 
        <%= pageListnRecData.getWord("records")%>
        </b></td>
    </tr>
  </table>
</div>
  </fieldset>

</body>

</html>

<% pageListnRecData.closeConnection(); %>
