<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>
<style type="text/css">
<script language="javascript" src="../Resources_pages/Browser.js" type="text/javascript"></script>

html, body {
	background:	#E1F4FF;;
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
<%@page import = "aheevaManager.ressources.*" %>
<jsp:useBean id="beanReport" scope="request" class="aheevaManager.reports.beanCampaignReport" />

</head>
<body>
<%
	beanManagerData pageDataAgent = new beanManagerData();
	pageDataAgent.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageDataAgent.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

    //long tLoginTime = 0;
    //long tNotReadyTime = 0;
    //String option ="", tmp ="";
	Vector campaign_hours = new Vector();
    String startingDate = request.getParameter("startingDate");
		startingDate =(startingDate == null ? "" : startingDate);
    String endingDate   = request.getParameter("endingDate");
		endingDate =(endingDate == null ? "" : endingDate);
    String cmp_name   = request.getParameter("campaign_name");
		cmp_name =(cmp_name == null ? "" : cmp_name);
    String training_hours = "";
    String integration_hours = "";
    String production_hours = "";
    String cont_training_hours = "";

	if(startingDate.length() > 6)
		startingDate = startingDate.substring(6)+"/"+ startingDate.substring(0,2)+"/"+startingDate.substring(3,5) ;
	if(endingDate.length() > 6)
		endingDate = endingDate.substring(6)+"/"+ endingDate.substring(0,2)+"/"+endingDate.substring(3,5) ;

    //beanCampaignReport r1 = null;
    try{
 		campaign_hours = beanReport.getCampaignHoursInfo(cmp_name, startingDate, endingDate);
		training_hours = (String)campaign_hours.elementAt(0);
		integration_hours = (String)campaign_hours.elementAt(1);
		production_hours = (String)campaign_hours.elementAt(2);
		cont_training_hours = (String)campaign_hours.elementAt(3);
    	System.out.println("\n All queries are completed in getCampaignHoursInfo. Construction JSP info") ;
   }catch(Exception e){
		System.out.println("\n  Error in JSP ..") ;
   }

%>

<p align="center">&nbsp; </p>
  <fieldset > <legend class="genericTitle"> <h5><%=pageDataAgent.getWord("Campaign Reports")%></h5></legend>
   
<div class="reportLook" > 
  <table width="400" border="0" align="center" >
    <tr> 
      <td align=left> 
        <!-- </div>-->
      </td>
    </tr>
    <tr class="reportsID"> 
      <td class="textblack"><div > <b> 
          <% if(startingDate.length() >0) out.write(" from: "+startingDate);%>
          <% if(endingDate.length() >0) out.write(" to: " + endingDate);%>
          </b></div></td>
    </tr>
    <tr> 
      <td> <div > <b> </b></div></td>
    </tr>
  </table>
  <table border="2"  cellpadding="0" cellspacing="1" style="border-collapse:separate; border-style:dotted; border-color:#DCDAD6"  width="800" id="AutoNumber1">
    <tr class="reportsTab"> 
      <td width="150"  height="25" align="center"><%=pageDataAgent.getWord("Training hours")%> 
      </td>
      <td align="center"><%=pageDataAgent.getWord("Integration hours")%> 
      </td>
      <td align="center"><%=pageDataAgent.getWord("Production hours")%></td>
      <td align="center"><%=pageDataAgent.getWord("Continuing training hours")%> 
      </td>
    </tr>
    <tr> 
      <td width="150" height="25" align="center"><%if (training_hours.length() > 0) out.write( training_hours); else out.write("0");%></td>
      <td align="center"><%if (integration_hours.length() > 0) out.write( integration_hours); else out.write("0");%></td>
      <td align="center"><%if (production_hours.length() > 0) out.write( production_hours); else out.write("0");%></td>
      <td align="center"><%if (cont_training_hours.length() > 0) out.write( cont_training_hours); else out.write("0");%></td>
    </tr>
  </table>
</div>
  </fieldset>

</body>

</html>

