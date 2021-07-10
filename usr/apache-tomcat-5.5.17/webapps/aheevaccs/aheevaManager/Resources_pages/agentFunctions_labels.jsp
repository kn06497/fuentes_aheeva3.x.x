<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageAgntFData = new beanManagerData();
pageAgntFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageAgntFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var string= new Array();
string[0]="<%=pageAgntFData.getWord("Are you sure, you wish to delete this agent?") %>";
string[1]="<%=pageAgntFData.getWord("name fields: First name and Last name required") %>";
string[2]="<%=pageAgntFData.getWord("Login and Password required") %>";
string[3]="<%=pageAgntFData.getWord("You must select a site.") %>";
string[4]="<%=pageAgntFData.getWord("Agent must have at least one preferred site") %>";
string[5]="<%=pageAgntFData.getWord("Invalid use of character") %>";
string[6]="<%=pageAgntFData.getWord("Invalid login. Already given to another agent") %>";







</script>
<% pageAgntFData.closeConnection(); %>