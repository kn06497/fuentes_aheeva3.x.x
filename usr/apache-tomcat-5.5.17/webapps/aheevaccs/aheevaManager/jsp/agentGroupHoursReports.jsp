<html>
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../Resources_pages/Browser.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script><style type="text/css">
html, body {
	background:	ThreeDFace;
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

<style type="text/css">

.dynamic-tab-pane-control .contentText{
	font:			12px Tahoma;
	color:			Black;
}
.dynamic-tab-pane-control .tab-page {
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
	
	/* 244, 243, 238 */ 
	/*145, 155, 156 */
	padding:		10px;
}

.dynamic-tab-pane-control .tab-row {
	z-index:		1;
	white-space:	nowrap;
}
 
.dynamic-tab-pane-control .tab-row .tab.selected {
	width:				74px  ;
	height:				18px  ;
	background-image:	url( "tab.active.png" )  ;
	background-repaet:	no-repeat;

	border-bottom-width:	0;
	z-index:		3;
	padding:		2px 0 0px 0;
	margin:			1px -3px -3px 0px;
	top:			-2px;
	font:			11px Tahoma;
}

.dynamic-tab-pane-control .tab-row .tab a {
	font:				11px Tahoma;
	color:				Black;
	text-decoration:	none;
	cursor:				default;
}

.dynamic-tab-pane-control .tab-row .tab.hover {
	font:				11px Tahoma;
	width:				70px;
	height:				16px;
	background-image:	url( "tab.hover.png" );
	background-repaet:	no-repeat;
}
 
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		200px;
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
 
 .dynamic-tab-pane-control.tab-pane {
	position:	relative;
	width:		100%;		 
	margin-right:	-2px;	 
	height:		200px;
	
}

</style>





<%@page contentType="text/html"%>
<%@page import = "aheevaManager.ressources.*" %>
<head>
<title> Recording</title>

<% String rec_id ="0";%>

<%@page language ="java" %>
<%@page import   ="java.util.*"%>
<%@page import   ="java.io.*"%>
<%@page import   ="java.text.*"%>
<%@page import   ="aheevaManager.reports.*"%>
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

    String startingDate = request.getParameter("startingDate");
		startingDate =(startingDate == null ? "" : startingDate);
    String endingDate   = request.getParameter("endingDate");
		endingDate =(endingDate == null ? "" : endingDate);
    String agent_group_name   = request.getParameter("agent_group_name");
		agent_group_name =(agent_group_name == null ? "" : agent_group_name);
    String name = "";
    long training_hours = 0;
    long integration_hours = 0;
    long production_hours = 0;
    long cont_training_hours = 0;

	if(startingDate.length() > 6)
		startingDate = startingDate.substring(6)+"-"+ startingDate.substring(0,2)+"-"+startingDate.substring(3,5) ;
	if(endingDate.length() > 6)
		endingDate = endingDate.substring(6)+"-"+ endingDate.substring(0,2)+"-"+endingDate.substring(3,5) ;

    //beanCampaignReport r1 = null;

%>

<p align="center">&nbsp; </p>
   <fieldset > <legend class="genericTitle"> <h5><%=pageDataAgent.getWord("Agent group report")%></h5></legend>
   
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
  <table border="2"  cellpadding="0" cellspacing="1" style="border-collapse:separate; border-color:#DCDAD6"  width="800" id="AutoNumber1">
    <tr class="reportsTab"> 
      <td width="150"  height="25" align="center"><%=pageDataAgent.getWord("Agent group")%>
      </td>
      <td align="center"><%=pageDataAgent.getWord("Training hours")%> 
      </td>
      <td align="center"><%=pageDataAgent.getWord("Integration hours")%>
      </td>
      <td align="center"><%=pageDataAgent.getWord("Production hours")%>
      </td>
      <td align="center"><%=pageDataAgent.getWord("Continuing training hours")%> 
      </td>
    </tr>
    <%
	Vector agent_group_hours = new Vector();
	agent_group_hours = beanReport.getCampaignHoursInfo(agent_group_name, startingDate, endingDate);
	beanCampaignReport.activity_hours act;
	System.out.println("size = "+agent_group_hours.size()+"\n");
	for (int i = 0; i < agent_group_hours.size(); i++)
	{
		try{

			act = (beanCampaignReport.activity_hours)agent_group_hours.elementAt(i);
                        name = (String)act.agent_group_name;
			training_hours = (long)act.training_hours;
			//System.out.println("tr = "+training_hours);
			integration_hours = (long)act.integration_hours;
			production_hours = (long)act.production_hours;
			cont_training_hours = (long)act.cont_training_hours;
%>
    <tr> 
      <td width="150" height="25" align="center"><% out.write(name);%> </td>
      <td align="center"><%if (training_hours > 0) out.write( String.valueOf(training_hours/3600)); else out.write("0,00");%></td>
      <td align="center"><%if (integration_hours > 0) out.write( String.valueOf(integration_hours/3600)); else out.write("0,00");%></td>
      <td align="center"><%if (production_hours > 0) out.write( String.valueOf(production_hours/3600)); else out.write("0,00");%></td>
      <td align="center"><%if (cont_training_hours > 0) out.write( String.valueOf(cont_training_hours/3600)); else out.write("0,00");%></td>
    </tr>
    <%
			System.out.println("\n All queries are completed in getCampaignHoursInfo. Construction JSP info") ;
	   }catch(Exception e){
			System.out.println("\n  Error in JSP ....") ;
	   }

	}


%>
  </table>
</div>
  </fieldset>

</body>

</html>

<%
pageDataAgent.closeConnection();
%>