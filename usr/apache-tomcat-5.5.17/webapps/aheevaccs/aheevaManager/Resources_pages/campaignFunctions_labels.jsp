<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageCamFData = new beanManagerData();
pageCamFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCamFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var CamF= new Array();
CamF[0]   = "<%=pageCamFData.getWord("Load")%>";
CamF[1]   = "<%=pageCamFData.getWord("Loaded")%>";
CamF[2]   = "<%=pageCamFData.getWord("Unload")%>";
CamF[3]   = "<%=pageCamFData.getWord("Are you sure, you wish to unload this campaign? You should only do this at the end of the day")%>";
CamF[4]   = "<%=pageCamFData.getWord("Not loaded")%>";
CamF[5]   = "<%=pageCamFData.getWord("Start")%>";
CamF[6]   = "<%=pageCamFData.getWord("The total number of ports of started campaigns is higher")%>";
CamF[7]   = "<%=pageCamFData.getWord("than the total configured number of ports.")%>";
CamF[8]   = "<%=pageCamFData.getWord("Would you like to continue anyway?")%>";
CamF[9]   = "<%=pageCamFData.getWord("Campaign Started")%>";
CamF[10]  = "<%=pageCamFData.getWord("Stop")%>";
CamF[11]  = "<%=pageCamFData.getWord("Campaign Stopped")%>";
CamF[12]  = "<%=pageCamFData.getWord("Active")%>";
CamF[13]  = "<%=pageCamFData.getWord("Calling list name")%>";
CamF[14]  = "<%=pageCamFData.getWord("Weight")%>";
CamF[15]  = "<%=pageCamFData.getWord("Save")%>";
CamF[16]  = "<%=pageCamFData.getWord("Campaign Loaded")%>";
CamF[17]  = "<%=pageCamFData.getWord("Campaign Running")%>";
CamF[18]  = "<%=pageCamFData.getWord("All calling lists have been updated from Do-not-call lists")%>";
CamF[19]  = "<%=pageCamFData.getWord("Click OK to continue")%>";
CamF[20]  = "<%=pageCamFData.getWord("Campaign cannot be deactivated while it is loaded.")%>";
CamF[21]  = "<%=pageCamFData.getWord("The total number of ports of started campaigns is higher")%>";
CamF[22]  = "<%=pageCamFData.getWord("than the total configured number of ports.")%>";
CamF[23]  = "<%=pageCamFData.getWord("Invalid use of character")%>";
CamF[24]  = "<%=pageCamFData.getWord("CallerID should be like \\\"CallerName\\\" <(514) 222-2222>")%>";
CamF[25]  = "<%=pageCamFData.getWord("The caller id cannot be more than 100 characters")%>";
CamF[26]  = "<%=pageCamFData.getWord("Campaign already exists")%>";
CamF[27]  = "<%=pageCamFData.getWord("Please Unload/Stop the campaign before deleting it")%>";
CamF[28]  = "<%=pageCamFData.getWord("Are you sure, you wish to delete this campaign")%>";
CamF[29]  = "<%=pageCamFData.getWord("")%>";
CamF[30]  = "<%=pageCamFData.getWord("You must select a routing script")%>";
CamF[31]  = "<%=pageCamFData.getWord("Please wait while applying blacklists to calling list. Do not close your browser !!!")%>";
CamF[32]  = "<%=pageCamFData.getWord("Campaign's name must be provided")%>";
CamF[33]  = "<%=pageCamFData.getWord("You must select a Timeout abandon")%>";
CamF[34]  = "<%=pageCamFData.getWord("You must enter a Recorded message")%>";
</script>
<%pageCamFData.closeConnection(); %>