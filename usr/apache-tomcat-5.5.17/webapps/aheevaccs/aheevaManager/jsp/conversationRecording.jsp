<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<LINK href="../Resources_pages/livestats.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/Browser.js"></script>

<script language="javascript" type="text/javascript" src="../Resources_pages/Browser.js"></script>

<style type="text/css">
/*html, body {
	background:	ThreeDFace;
}*/
.reportLook {
	clear: both;
	border: 1px solid rgb(145, 155, 156);
	background: rgb(252, 252, 254);
	z-index: 2;
	position: relative;
	top: -2px;
	font: 11px Tahoma;
	color: Black;
	filter: progid : DXImageTransform . Microsoft .
		Gradient(StartColorStr = #fffcfcfe, EndColorStr = #fff4f3ee,
		GradientType = 0) progid : DXImageTransform . Microsoft .
		Shadow(Color = #ff919899, Strength = 2, Direction = 135);
	padding: 10px;
}
</style>

<%@page contentType="text/html"%>
<%@page language="java"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="aheevaManager.ressources.*"%>
<%
	
	beanManagerData pageCrecData = new beanManagerData();
	pageCrecData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageCrecData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
	
	String CURRENT_USER_DBID = ((String)session.getAttribute("CURRENT_USER_DBID"));
	String tenant_dbid = (request.getParameter("tenant")==null)?"":request.getParameter("tenant");
%>

<head>
<title>Recording</title>
<script>
 
	function saveAll() {
	}
 
	function getRequestedRecordings()
	{	
		//convert from 2006/06/15 to 06/15/2006
		var startdate = getRequestedRecordings.arguments[0];
		if(startdate.length > 1)		
			startdate =  startdate.substring(5,7)+'/'+ startdate.substring(8)+'/'+startdate.substring(0,4);
		
		var enddate   = getRequestedRecordings.arguments[1];
		if(enddate.length > 1)
			enddate =  enddate.substring(5,7)+'/'+ enddate.substring(8)+'/'+enddate.substring(0,4);
			
		var phonenum  = getRequestedRecordings.arguments[2];
		var page      = getRequestedRecordings.arguments[3];
		var limit     = getRequestedRecordings.arguments[4];
		var numpages  = getRequestedRecordings.arguments[5];
		var firstload  = getRequestedRecordings.arguments[6];
		var selectedGroups   = getRequestedRecordings.arguments[7];
		var agents   = getRequestedRecordings.arguments[8];
		var get_sales = getRequestedRecordings.arguments[9];
		var get_no_sales = getRequestedRecordings.arguments[10];
		var numrecords = getRequestedRecordings.arguments[11];
		var get_audio = getRequestedRecordings.arguments[12];
		var get_video = getRequestedRecordings.arguments[13];
		var dnid = getRequestedRecordings.arguments[14];
		var get_qm = ""
		var get_not_listened = "";
		var get_listened = "";
		var dnis = "";
		
		//alert(startdate+'..'+enddate)		
		destination = "../jsp/conversationRecording.jsp"
		destination += "?startingDate="
		destination += startdate;
		destination +="&endingDate=";
		destination += enddate;
		destination +="&phoneNumber=";
		// Use following function to use wildcards in phone numbers
		destination +=escape(phonenum);
		
		destination +="&page=";
		destination += page;
		destination +="&limit=";
		destination +=	limit;
		destination +="&numpages=";
		destination += numpages;
		destination +="&firstload=false";	
		destination +="&agentGrp=";
		destination += selectedGroups;
		destination +="&agents=";
		destination += agents;
 
		destination +="&option_not_listened=";
		destination += get_not_listened;
		destination +="&option_listened=";
		destination += get_listened;
		destination +="&sales=";
		destination +=get_sales;
		destination +="&no_sales=";
		destination += get_no_sales;
		destination +="&qm=";
		destination += get_qm;
		destination += "&numrec=";
		destination += numrecords;
		destination +="&audio=";
		destination += get_audio;
		destination += "&video=";
		destination += get_video;
		destination +="&tenant=";
		destination +="<%=tenant_dbid%>";
		//alert(destination);
	 
		document.location = destination;
	
}
	
 
	var userDbid = <%=CURRENT_USER_DBID%>;
 
	
	function submitInfo()
	{
		//alert(record+','+submitInfo.arguments[1]+','+submitInfo.arguments[2]+','+submitInfo.arguments[3]+','+submitInfo.arguments[4]+','+submitInfo.arguments[5]+','+submitInfo.arguments[11])
		var record_file='';
		var record = submitInfo.arguments[0];
		var pathval = submitInfo.arguments[1];
		var agtid = submitInfo.arguments[2];
		var file = submitInfo.arguments[3];
		var phoneval = submitInfo.arguments[4];
		var encryptval = submitInfo.arguments[5];
		var grp = submitInfo.arguments[6];
		var encmeth = submitInfo.arguments[7];
		var encservid = submitInfo.arguments[8];	
		var tomcaturl = submitInfo.arguments[9];	
		var tomcatpath = submitInfo.arguments[10];	
		var saveAs = submitInfo.arguments[11];	
		var video_filename = submitInfo.arguments[12];	
		var audio_time = submitInfo.arguments[13];	
		var video_time = submitInfo.arguments[14];	
		var servPath = window.top.comm.myApplet.servletPath;
		var proto =  window.top.comm.myApplet.getProto();
		var encparams='' ;
		if(encservid == '' || encservid.length < 1)
		{	//Get parameters from the encryption server associated with the agent group 
			encparams = window.top.comm.myApplet.getEncryptionServerParamsForAgent(grp);
		}
		else
		{
			encparams = window.top.comm.myApplet.getEncryptionServerParamsForServer(encservid);
		}
		var jsEncparams = encparams.split(",");
		var encServerHost = "";
		var encServerPort = "";
		try{
		if(jsEncparams.length > 1)
		{
			encServerHost = jsEncparams[1];
			encServerPort = jsEncparams[2];
			servPath = jsEncparams[3];
		}
		}catch (exception){}
		
		var nextLoc;
		if (saveAs == 0) {
		if (video_filename == undefined) {
			if (encryptval == "0") {
				nextLoc ="./wavFileGenerator.jsp?record_id=";
			} else {
				nextLoc ="./decrypt.jsp?record_id=";
			}
		} else {
			nextLoc ="./AVviewer.jsp?record_id=";
		}
		} else {
			nextLoc ="./saveFileAs.jsp?record_id=";
		}
		
		nextLoc +=record;
		nextLoc +="&path=";
		nextLoc +=pathval;
		nextLoc +="&agt=";
		nextLoc +=agtid;
		nextLoc +="&file=";
		nextLoc +=file;
		nextLoc +="&phone=";
		nextLoc +=phoneval;
		nextLoc +="&encval=";
		nextLoc +=encryptval;
		nextLoc +="&encmeth=";
		nextLoc +=encmeth;
		nextLoc +="&proto=";
		nextLoc +=proto;
		nextLoc +="&encServerHost=";
		nextLoc +=encServerHost;
		nextLoc +="&encServerPort=";
		nextLoc +=encServerPort;
		nextLoc +="&servletpath=";
		nextLoc +=servPath;
		nextLoc +="&userDbid=";
		nextLoc +=userDbid;
		nextLoc +="&tomcaturl=";
		nextLoc +=tomcaturl;
		nextLoc +="&tomcatpath=";
		nextLoc +=tomcatpath;
		nextLoc +="&video_file=";
		nextLoc +=video_filename;
		nextLoc +="&audio_time=";
		nextLoc +=audio_time;
		nextLoc +="&video_time=";
		nextLoc += video_time;
		nextLoc +="&tenant=";
		nextLoc +="<%=tenant_dbid%>";
		
		if( encryptval == '1' && proto != 'https' && proto != 'HTTPS')
		{
			alert("<%=pageCrecData.getWord("To listen to an encrypted record, please login via https !")%>");
			return false;
		}
		//alert('location = '+nextLoc)
		//javascript:window.open(nextLoc,'formWindow','scrollbars=yes,width=100,height=50');//,'scrollbars=yes,width=600,height=400'
		if (video_filename == undefined)
			document.getElementById("h_file_reader").src = nextLoc;
		else
			window.location.href = nextLoc;
		 
		//Now send message to cti to inform that this user has listened to the record
		if(appletObj )
		{
			var sret = appletObj.sendRecListenMessageToCti(userDbid, record, file);
		}
		return true;
	}

function goEvaluationForm(p1,p2,p3,p4,p5,p6) 
	{
		
		window.open('conversationRecordingEvaluation.jsp?url='+p5+'&path='+p6+'&recid='+p1+'&tracknum='+p4+'&grpid='+p3+'&agtid='+p2+'&tenant=<%=tenant_dbid%>','formWindow', 'resizable=yes,maximize=yes,scrollbars=yes,width=800,height=600,status=yes');//,'scrollbars=yes,width=600,height=400'
		
	}
</script>

<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="aheevaManager.reports.*"%>
<jsp:useBean id="beanRecord" scope="request"
	class="aheevaManager.reports.beanConversationRecord" />

</head>
<body class="bottompagebody">
<%
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

    String phoneNumber  = request.getParameter("phoneNumber");
		phoneNumber =(phoneNumber == null ? "" : phoneNumber);

    String agents   = request.getParameter("agents");
		agents =(agents == null ? "" : agents);
    String agentGrp  = request.getParameter("agentGrp");
		agentGrp =(agentGrp == null ? "" : agentGrp);
    String option_not_listened = request.getParameter("option_not_listened");
		option_not_listened =(option_not_listened == null ? "" : option_not_listened);
    String option_listened = request.getParameter("option_listened");
		option_listened =(option_listened == null ? "" : option_listened);
    String option_qm = request.getParameter("qm");
		option_qm =(option_qm == null ? "" : option_qm);
    String option_sales = request.getParameter("sales");
		option_sales =(option_sales == null ? "" : option_sales);
    String option_no_sales = request.getParameter("no_sales");
		option_no_sales =(option_no_sales == null ? "" : option_no_sales);
	String option_audio = request.getParameter("audio");
		option_audio =(option_audio == null ? "" : option_audio);
    String option_video = request.getParameter("video");
		option_video =(option_video == null ? "" : option_video);
	String pageStr = request.getParameter("page");
	String dnid  = request.getParameter("dnid");
		dnid =(dnid == null ? "" : dnid);
	int	pagenum =(pageStr == null ? 1 : Integer.parseInt(pageStr));
	
	String limit = request.getParameter("limit");
		limit =(limit == null ? "" : limit);
	String firstload  = request.getParameter("firstload");
		firstload = (firstload == null ? "true" : firstload);	
		if(firstload.compareTo("false")==0)
			beanRecord.firstexec = false;
				
	String numpagesStr  = "";
	String numberofrecords = "";
 
	if(firstload.compareTo("false") == 0) {
		numpagesStr = request.getParameter("numpages");
		numpagesStr = (numpagesStr == null ? "" : numpagesStr);	
		   
		numberofrecords = request.getParameter("numrec");
		numberofrecords =(numberofrecords == null ? "0" : numberofrecords);
		beanRecord.numberOfRecords = Integer.parseInt(numberofrecords);
	}
 


    boolean agentReport = true;
    if(option_listened.compareTo("1")==0)
        {tmp =  pageCrecData.getWord("Listened"); option = "1";}
    if(option_not_listened.compareTo("1")==0)
        {tmp = pageCrecData.getWord("Non listened"); option = "2";}
    if(option_not_listened.compareTo(option_listened)==0 )
        {tmp = pageCrecData.getWord("All"); option = "0";}

   //update the system file database
    /*String updateCmd = "updatedb";
    try{
        Runtime rt = Runtime.getRuntime();
        Process child = rt.exec(updateCmd);
    }catch(Exception e){
        e.printStackTrace();
    }*/

   String agtVar="";
   beanConversationDetails r1=null;
    try{
	   if(agents.compareTo("AllAgents") !=0)
		   {
			  agtVar = agents;
			  agentReport = true;
			 
			  beanRecord.getConversationRecordsForAgent (agents,agentGrp,startingDate,
					endingDate, option, phoneNumber,option_qm,option_sales,option_no_sales,limit, "", pagenum, option_audio, option_video, dnid);
		   }
	   else{
			  agtVar =  agentGrp;
			  agentReport = false;
			  
			  beanRecord.getConversationRecordsForGroup (agentGrp,startingDate,
				   endingDate, option, phoneNumber,option_qm,option_sales,option_no_sales,limit, "", pagenum, option_audio, option_video, dnid);
		   }
   				
		numberofrecords = Long.toString(beanRecord.numberOfRecords);
		System.out.println("\n All queries are completed in beanRecord. Construction JSP info, numberofrecords="+numberofrecords) ;
	
		 
   }catch(Exception e){
        //e.printStackTrace();
		System.out.println("\n  Error in JSP ..") ;

    }

%>

<p align="center">&nbsp; </p>
<div class="tab-page" >
  <fieldset > <b><legend><%= pageCrecData.getWord("Listening to agent's conversations")%></legend> </b><!--<legend class="genericTitle"> <h5>-->
 <br>
   
  <div class="reportLook" > 
    <table width="400" border="0" align="center"  >
      <tr> 
        <td align=left> </td>
      </tr>
      <tr class="reportsID"> 
        <td class="textblack"><div > <b> 
            <%out.write(tmp);%>
            <%= pageCrecData.getWord("Records list")%>
             <% if(startingDate.length() >0) out.write(pageCrecData.getWord("From")+": "+startingDate);%>
            <% if(endingDate.length() >0) out.write(pageCrecData.getWord("To")+": " + endingDate);%>
            </b></div></td>
      </tr>
      <tr> 
        <td> <div > <b> 
            <% if(phoneNumber.length()>0)  out.write(pageCrecData.getWord(" where Phone Number = ")+ phoneNumber);//out.write(" where Phone Number = " + phoneNumber);%>
            </b></div></td>
      </tr>
	<tr>
		<td>
		<div><b> <% if(dnid.length()>0)  out.write(pageCrecData.getWord(" where DNID = ")+ dnid);//out.write(" where Phone Number = " + phoneNumber);%>
		</b></div>
		</td>
	</tr>
    </table>
    <p  class="reportsID"> 
    <div style="background-color:#EAEAEA; width:100% height:18 " ><b> 
	<table><tr> <td>
       <% if(agentReport == true) out.write(pageCrecData.getWord("Agent")+"[" +agtVar+"]");
		 else{
				if(agtVar.length() > 9){
					if(agtVar.substring(0,10).compareTo("AllGroups/")== 0 )
						out.write(pageCrecData.getWord("Group")+" ["+pageCrecData.getWord("All groups")+"]");
					else
						out.write(pageCrecData.getWord("Group")+" [" +agtVar+"]");
				}
			}
		%>
		</td>
		<td width="450"></td>
		<td width="350" align="center"><b>
		<% int start = (pagenum-1)*Integer.parseInt(limit); 
		int endp =start+Integer.parseInt(limit); 
		endp=(endp>Integer.parseInt(numberofrecords)?Integer.parseInt(numberofrecords):endp); 
		out.write(Integer.toString(start)+"-"+Integer.toString(endp)+" "+pageCrecData.getWord("of")+" " +numberofrecords+" "+pageCrecData.getWord("records found")+"." );	%></b>
	  </td>	
	</tr></table>	
      </b> </div></p>
    <table border="1"  cellpadding="0" cellspacing="1" style="border-collapse:separate; border-color:#DCDAD6"  id="AutoNumber1">
      <tr class="reportsTab"> 
        <td width="150"  height="30" align="center"> <%= pageCrecData.getWord("Call time")%> 
        </td>
		<td  align="center"> <%= pageCrecData.getWord("Call length")%>
        </td>
        <td  align="center"> <%= pageCrecData.getWord("Phone number")%>
        </td>
		<td align="center"><%= pageCrecData.getWord("DNID")%>
		</td>
        <td  align="center"><%= pageCrecData.getWord("Direction") %>
        </td>
        <td  align="center"> <%= pageCrecData.getWord("Campaign")%>
        </td>
        <td  align="center"> <%= pageCrecData.getWord("Command")%>
        </td>
		<td  align="center"> <%=pageCrecData.getWord("Evaluation")%>
        </td>
        <td  align="center"> <%= pageCrecData.getWord("Agent name")%>
        </td>
        <td  align="center"> <%= pageCrecData.getWord("Agent ID")%>
        </td>
        <%
	   if(option_sales.compareTo(option_no_sales)==0)
		{
		   out.write("<td    align=\"center\">"+pageCrecData.getWord("Sale info")+" </td>");
		}
	
	  if(phoneNumber.length() >0)
		{
		   out.write("<td    align=\"center\">"+pageCrecData.getWord("Call history")+" </td>");
		}
		%>
        <td    align="center"> <%= pageCrecData.getWord("Encryption")%>
        </td>
        <td    align="center"> <%= pageCrecData.getWord("Encryption method")%>
        </td>
        <td    align="center"> <%= pageCrecData.getWord("Encryption server")%>
        </td>
      </tr>
      <%
	if(beanRecord.m_vAllDetails.size() > 0){
	try
	{
		for (int i = 0; i < beanRecord.m_vAllDetails.size(); i++) 
		{
			r1 = (beanConversationDetails)beanRecord.m_vAllDetails.elementAt(i);
			String rec_id = r1.record_id != null ? r1.record_id : "";
			String campaign = r1.campaign != null ? r1.campaign : "";
			
			String path = r1.path != null ? r1.path : "";
			String agt_id = r1.agt_id != null ? r1.agt_id : "";
			String file = r1.file != null ? r1.file : "";
			String filename_video = r1.filename_video != null ? r1.filename_video : "";
			String cur_phoneNumber = r1.phoneNumber != null ? r1.phoneNumber : "";
			String cur_dnid = r1.dnis != null ? r1.dnis : "";
			String encryption = r1.is_encrypted != null ? r1.is_encrypted : "";
			String grp_dbid = r1.grp_dbid != null ? r1.grp_dbid : "";
			String enc_method = r1.enc_method != null ? r1.enc_method : "";
			String enc_server_dbid = r1.enc_server_dbid != null ? r1.enc_server_dbid : "";
			String tomcaturl = r1.rs_tomcat_dir!= null ? r1.rs_tomcat_dir : "";
			String tomcatpath = r1.rs_path!= null ? r1.rs_path : "";
			String direction = r1.direction;
			long audio_time = r1.audio_time;
			long video_time = r1.video_time;
			String tracknum = r1.tracknum != null ? r1.tracknum : "";
			String feval = r1.feval != null ? r1.feval : "0";

	%>
      <tr <% if(i%2 == 0) out.write("class=conversationRowPair");
  			else out.write("class=reportsRowUnPair");%> > 
        <td width="150"  align="center">
          <%if(r1.callTime != null)  out.write(r1.callTime);%>
        </td>
		<td    align="center">
          <%if(r1.call_length != null)  out.write(r1.call_length);%>
        </td>		
        <td    align="center">
          <%if(r1.phoneNumber != null) out.write(r1.phoneNumber);%>
        </td>
		<td align="center">
		<%if(r1.dnis != null) out.write(r1.dnis);%>
		</td>
        <td align="center"><%= pageCrecData.getWord(r1.direction) %></td>
        <td    align="center">
          <%if(r1.campaign != null) out.write(r1.campaign);%>
        </td>


		<td height="27" align="center">&nbsp; <% 
		if(option_audio.compareTo("1")==0 || option_video.compareTo(option_audio)==0)
		{
			if(file.compareTo("")!=0 && file.compareTo("NULL")!=0)
			{
				out.write("	<input  id='audioIcon' name='audioIcon' type='image' src='../img/audio32x32.gif' onClick=\"submitInfo('"+rec_id + "','" + path+ "','" + agt_id+ "','" +file+ "','" +cur_phoneNumber+ "','" +encryption+ "','" +grp_dbid+ "','" +enc_method+ "','" +enc_server_dbid+ "','" +tomcaturl+ "','" +tomcatpath+ "',0)\">\n");
			}
			else
			{
				out.write("	<input disabled='disabled'  id='audioIcon' name='audioIcon' type='image' src='../img/audio32x32BW.gif' >\n");
			}			
				
		}
		if(option_video.compareTo("1")==0 || option_video.compareTo(option_audio)==0)
		{
			if(filename_video.compareTo("")!=0 && filename_video.compareTo("NULL")!=0)
			{
				out.write("	<input  id='videoIcon' name='videoIcon' type='image' src='../img/video32x32.gif' onClick=\"submitInfo('"+rec_id + "','" + path+ "','" + agt_id+ "','" +filename_video+ "','" +cur_phoneNumber+ "','" +encryption+ "','" +grp_dbid+ "','" +enc_method+ "','" +enc_server_dbid+ "','" +tomcaturl+ "','" +tomcatpath+ "',0)\">\n");
			
			}
			else
			{
				out.write("	<input disabled='disabled'  id='videoIcon' name='videoIcon' type='image' src='../img/video32x32BW.gif' >\n");
			}
				
			
		}
		
		
		/* if(option_audio.compareTo("1")==0 && option_video.compareTo("1")==0)
		{
			if(filename_video.compareTo("")!=0 && filename_video.compareTo("NULL")!=0 && file.compareTo("")!=0 && file.compareTo("NULL")!=0)
			{
				out.write("	<input  id='avIcon' name='avIcon' type='image' src='../img/av32x32.gif' onClick=\"submitInfo('" + rec_id + "','" + path+ "','" + agt_id+ "','" +file+ "','" +cur_phoneNumber+ "','" +encryption+ "','" +grp_dbid+ "','" +enc_method+ "','" +enc_server_dbid+ "','" +tomcaturl+ "','" +tomcatpath+ "','" +filename_video+ "',"  + audio_time + ")\" >");
			}
			else
			{
				out.write("	<input disabled='disabled'  id='avIcon' name='avIcon' type='image' src='../img/av32x32BW.gif' >\n");
			}
				
			
		}*/
		%>
        </td>
		<td    align="center">
          <input type="button" value="<%=(feval.compareTo("1")==0)?pageCrecData.getWord("Edit evaluation"):pageCrecData.getWord("Add evaluation")%>" onClick="goEvaluationForm('<%=rec_id%>','<%=agt_id%>','<%=grp_dbid%>','<%=tracknum%>','<%=tomcaturl%>','<%=tomcatpath%>');">
        </td>
        <td    align="center"> <%if(r1.last_name != null) out.write(r1.last_name);%>
          , 
          <%if(r1.first_name != null) out.write(r1.first_name);%> </td>
        <td    align="center"> <%if(r1.agt_id != null) out.write(r1.agt_id);%> </td>
        <%
	   if(option_sales.compareTo(option_no_sales)==0)
		{
		   if(r1.sale_value==1)
			   out.write("<td    align=\"center\">"+pageCrecData.getWord("Sale")+" </td>");
		   else
			   out.write("<td    align=\"center\">"+pageCrecData.getWord("No sale")+"</td>");
		}
	
	
	
	
	  if(phoneNumber.length() >0)
		{
		  out.write("<td    align=\"center\">");
		  if(r1.result_code == 1)
			 out.write(pageCrecData.getWord("Accepted"));
		  else if(r1.result_code == 2)
			 out.write(pageCrecData.getWord("Refused"));
		  else if(r1.result_code == 3)
			 out.write(pageCrecData.getWord("Not reached"));
		  else if(r1.result_code == 4)
			 out.write(pageCrecData.getWord("Wrong number"));
		  else if(r1.result_code == 9)
			 out.write(pageCrecData.getWord("Do not call"));
		  else if(r1.result_code == -1)
			 out.write(pageCrecData.getWord("Call back"));
		  else
			 out.write("-");
	
		  out.write("</td>");
		}
		%>
		<td align="center">
		<%if(r1.is_encrypted != null) out.write(r1.is_encrypted.compareTo("1") == 0 ?"yes" : "No"); else out.write("No");%>
		</td>
		<td align="center">
		<%if(r1.is_encrypted != null && r1.is_encrypted.compareTo("1")==0) out.write(r1.enc_method); else out.write("-");%>
		</td>
		<td height="27" align="center">&nbsp;</td>
	</tr>
	<%
    } //end for
   }catch(Exception e){
  	  out.write("<tr ><td colspan=10 align=\"center\" height=50><b>&nbsp; "+pageCrecData.getWord("Error while generating report")+".. </b></font></td></tr>");
   }
   
   
  }//end if
  else{
	  out.write("<tr><td colspan=12 align=\"center\" height=50><b>&nbsp; "+pageCrecData.getWord("No records available")+" </b></font></td></tr>");
  }
%>
	<!-- traverse the array -->
	<!-- end of array traversal-->
</table>
<%
		int numpages;
		if(beanRecord.m_vAllDetails.size() > 0){
			int np=0,  tranche=0;
			out.write("<table><tr></tr><tr align ='center'>");
			if(firstload.compareTo("true")==0){
				int limitval = Integer.parseInt(limit);
				int numtotalrecords= (int)beanRecord.numberOfRecords;		
				numpages = numtotalrecords/limitval;
				pagenum = 1;
				
				if((numtotalrecords % limitval) > 0)
					numpages++;
				
				System.out.println("\nFIRSTLOAD, current page="+Integer.toString(pagenum)+" Number of pages = "+Integer.toString(numpages)) ;
				System.out.println("Phone: " + phoneNumber);
				
				if( numpages > 1 )
				{						
					for(np=1; np <= 10 && np <=numpages; np++)
						if(np != pagenum)
							out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+np+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000; cursor: hand ' >"+np+"</a></td>");
						else
							out.write("<td width='25'><a style='font-size:13px; font-family:Tahoma; color:#0000ff ' >"+np+"</a></td>");
														
					if(np < numpages)
						out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+(pagenum - (pagenum%10) + 10)+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000; cursor: hand ' > next </a></td>");
										
				}
			
			}
			else{
					numpages = Integer.parseInt(numpagesStr);
					System.out.println("\nNth LOAD, page="+Integer.toString(pagenum)+" Number of pages = "+Integer.toString(numpages)) ;
					System.out.println("Phone: " + phoneNumber);
					if(pagenum >= 10)			
						out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+((pagenum - (pagenum%10) - 10) <=0?1:(pagenum - (pagenum%10) - 10))+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000; cursor: hand  ' > Prev </a></td>");
				
					for(np=((pagenum - pagenum%10)==0?1:(pagenum - pagenum%10)); np <= (pagenum - (pagenum%10) + 10) && np <=numpages; np++){
						if(np != pagenum)
							out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+np+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000; cursor: hand  ' >"+np+"</a></td>");
						else
							out.write("<td width='25' ><a style='font-size:13px; font-family:Tahoma; color:#0000ff ' >"+np+"</a></td>");
					}
					if(np < numpages)
						out.write("<td width='25' onclick=\"getRequestedRecordings('"+startingDate+"','"+endingDate+"','"+phoneNumber+"','"+(pagenum - (pagenum%10) + 10)+"','"+limit+"','"+Integer.toString(numpages)+"','false','"+agentGrp+"','"+agents+"','"+option_sales+"','"+option_no_sales+"','"+numberofrecords+"','"+option_audio+"','"+option_video+"')\"><a style='font-size:13px; font-family:Tahoma; color:#000000 ' > next </a></td>");
					
			}	 
			out.write("</tr><table>");
		}
	%>
</div>
</fieldset>
</div>
<iframe src="" width="0" height="0" name="h_file_reader"
	id="h_file_reader"></iframe>

</body>

</html>

<% pageCrecData.closeConnection(); %>
