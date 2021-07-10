<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageGrpFData = new beanManagerData();
pageGrpFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageGrpFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var GrpF= new Array();
GrpF[0]="<%=pageGrpFData.getWord("Save") %>";
GrpF[1]="<%=pageGrpFData.getWord("AGERR Length") %>";
GrpF[2]="<%=pageGrpFData.getWord("AGERR Char") %>";
GrpF[3]="<%=pageGrpFData.getWord("You must enter a GROUP NAME") %>";
GrpF[4]="<%=pageGrpFData.getWord("Invalid use of character") %>";
GrpF[5]="<%=pageGrpFData.getWord("Group name") %>";
GrpF[6]="<%=pageGrpFData.getWord("You must enter a GROUP QUEUE") %>";
GrpF[7]="<%=pageGrpFData.getWord("Queue name") %>";
GrpF[8]="<%=pageGrpFData.getWord("Your description should be filled. Use valid characters.") %>";
GrpF[9]="<%=pageGrpFData.getWord("The maximum wrap up time must be in seconds") %>";
GrpF[10]="<%=pageGrpFData.getWord("The maximum wrap up time must be less than 99999 seconds") %>";
GrpF[11]="<%=pageGrpFData.getWord("The maximum wrap up time must be at least 1 second") %>";
GrpF[12]="<%=pageGrpFData.getWord("The maximum wrap up time that does not affect productivity must be in seconds") %>";
GrpF[13]="<%=pageGrpFData.getWord("This QUEUE is already assigned. You must enter a NEW QUEUE") %>";
GrpF[14]="<%=pageGrpFData.getWord("You must enter the encryption server IP or uncheck the encryption box") %>";

GrpF[15]="<%=pageGrpFData.getWord("You must enter the encryption method or uncheck the encryption box") %>";
GrpF[16]="<%=pageGrpFData.getWord("Agent group already exists") %>";

GrpF[17]="<%=pageGrpFData.getWord("Minimum recording time must be smaller than maximum recording time") %>";
GrpF[18]="<%=pageGrpFData.getWord("Are you sure you wish to delete this group?") %>";
GrpF[19]="<%=pageGrpFData.getWord("A running campaign uses this group! You can't delete it") %>";
GrpF[20]="<%=pageGrpFData.getWord("Delete") %>";
GrpF[21]="<%=pageGrpFData.getWord("There is no active non-global not-ready-reason in the system.") %>";
GrpF[22]="<%=pageGrpFData.getWord("You cannot select a reason several times") %>";






</script>
<% pageGrpFData.closeConnection(); %>