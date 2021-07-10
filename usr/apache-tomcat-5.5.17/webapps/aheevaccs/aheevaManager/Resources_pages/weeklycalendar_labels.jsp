<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageWeekCaData = new beanManagerData();
pageWeekCaData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageWeekCaData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<script language="JavaScript" type="text/javascript">
var WeekCa= new Array();

WeekCa[0]="<%= pageWeekCaData.getWord("January")%>";
WeekCa[1]="<%= pageWeekCaData.getWord("February")%>";
WeekCa[2]="<%= pageWeekCaData.getWord("March")%>";
WeekCa[3]="<%= pageWeekCaData.getWord("April")%>";
WeekCa[4]="<%= pageWeekCaData.getWord("May")%>";         
WeekCa[5]="<%= pageWeekCaData.getWord("June")%>";
WeekCa[6]="<%= pageWeekCaData.getWord("July")%>";
WeekCa[7]="<%= pageWeekCaData.getWord("August")%>";
WeekCa[8]="<%= pageWeekCaData.getWord("September")%>";
WeekCa[9]="<%= pageWeekCaData.getWord("October")%>";
WeekCa[10]="<%= pageWeekCaData.getWord("November")%>";
WeekCa[11]="<%= pageWeekCaData.getWord("December")%>";
WeekCa[12]="<%= pageWeekCaData.getWord("week")%>";
WeekCa[24]="<%= pageWeekCaData.getWord("Sunday")%>";
WeekCa[25]="<%= pageWeekCaData.getWord("Monday")%>";
WeekCa[26]="<%= pageWeekCaData.getWord("Tuesday")%>";
WeekCa[27]="<%= pageWeekCaData.getWord("Wednesday")%>";
WeekCa[28]="<%= pageWeekCaData.getWord("Thursday")%>";
WeekCa[29]="<%= pageWeekCaData.getWord("Friday")%>";
WeekCa[30]="<%= pageWeekCaData.getWord("Saturday")%>";


</script>
<% pageWeekCaData.closeConnection(); %>