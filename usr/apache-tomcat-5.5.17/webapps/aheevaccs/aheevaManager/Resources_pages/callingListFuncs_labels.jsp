<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageCalFData = new beanManagerData();
pageCalFData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageCalFData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var CAll= new Array();
CAll[0]="<%=pageCalFData.getWord("cannot be choosen. It causes an order conflict with another treatment") %>";
CAll[1]="<%=pageCalFData.getWord("You must enter the table name associated with this list") %>";
CAll[2]="<%=pageCalFData.getWord("Invalid use of character") %>";
CAll[3]="<%=pageCalFData.getWord("Calling list name cannot start with a number") %>";
CAll[4]="<%=pageCalFData.getWord("Calling list already exists") %>";
CAll[5]="<%=pageCalFData.getWord("Are you sure, you wish to delete this calling list?") %>";
CAll[6]="<%=pageCalFData.getWord("Unable to delete a calling list associated to a running campaign") %>";
CAll[7]="<%=pageCalFData.getWord("No query specifed.**") %>";
CAll[8]="<%=pageCalFData.getWord("Invalid list name") %>";
CAll[9]="<%=pageCalFData.getWord("The name of the associated table to the calling list contains one or more forbidden characters. A calling list must start with a letter and contain only letters, digits and the underscore character(_). Please try again") %>";
CAll[10]="<%=pageCalFData.getWord("Specify the file extension") %>";
CAll[11]="<%=pageCalFData.getWord("Specify the CSV file delimiters and quotes") %>";
CAll[12]="<%=pageCalFData.getWord("Specify the calling list file") %>";
CAll[13]="<%=pageCalFData.getWord("No association have been made") %>";
CAll[14]="<%=pageCalFData.getWord("No table in your calling list") %>";
CAll[15]="<%=pageCalFData.getWord("No association with the phone number field") %>";
CAll[16]="<%=pageCalFData.getWord("Error: Missing dialing hours \\\"apply to\\\"") %>";
CAll[17]="<%=pageCalFData.getWord("Error: Missing the extra data for screenpop. Try selecting the \\\'None\\\' option") %>";
CAll[18]="<%=pageCalFData.getWord("Error: Missing extra data \\\"apply to\\\"") %>";
CAll[19]="<%=pageCalFData.getWord("Error: Missing non numeric phone number action") %>";
CAll[20]="<%=pageCalFData.getWord("Error: Missing Time Zone Rules Choice") %>";
CAll[21]="<%=pageCalFData.getWord("Error: No rule were selected in Time Zone Setup. Try using the \\\'None\\\' option instead.") %>";
CAll[22]="<%=pageCalFData.getWord("Table columns") %>";
CAll[23]="<%=pageCalFData.getWord("Specify format name") %>";






</script>
<% pageCalFData.closeConnection(); %>