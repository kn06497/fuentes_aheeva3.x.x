<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageroutData = new beanManagerData();
pageroutData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageroutData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">

var rout= new Array();
rout[0]="<%= pageroutData.getWord("Saving") %>";
rout[1]="<%= pageroutData.getWord("Validating diagram") %>";
rout[2]="<%= pageroutData.getWord("Error: Specify script name") %>";
rout[3]="<%= pageroutData.getWord("Error: Specify script priority") %>";
rout[4]="<%= pageroutData.getWord("Error: Script with the same name already exists") %>";
rout[5]="<%= pageroutData.getWord("The current script has been modified.**Do you want to save it?") %>";
rout[6]="<%= pageroutData.getWord("Warning:**You are about to delete this routing script.**Do you want to continue?") %>";
rout[7]="<%= pageroutData.getWord("Please, enter a name for the script.") %>";
rout[8]="<%= pageroutData.getWord("This routing script already exists. Do you want to overwrite it?") %>";
rout[9]="<%= pageroutData.getWord("Counters") %>";
rout[10]="<%= pageroutData.getWord("Error: No starting box found in this script. Please add a call condition") %>";
rout[11]="<%= pageroutData.getWord("Error: No starting box found in this script") %>";
rout[12]="<%= pageroutData.getWord("More than one starting box were found.**") %>";
rout[13]="<%= pageroutData.getWord("Possible Call Conditions are:**") %>";


</script>
<% pageroutData.closeConnection(); %>