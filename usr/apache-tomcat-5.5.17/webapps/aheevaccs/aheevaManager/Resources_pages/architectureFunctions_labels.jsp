<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="java.text.*"%>
<%@page import ="aheevaManager.schedule.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="jxl.*" %>
<%
////open connection to database///////
beanManagerData pageArchFData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageArchFData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
pageArchFData.openConnection();
    %>


<script language="javascript" type="text/javascript">

var arch=new Array();
arch[0]="<%= pageArchFData.getWord("Add site")%>";
arch[1]="<%= pageArchFData.getWord("Site Name")%>";
arch[2]="<%= pageArchFData.getWord("Internal Codec")%>";
arch[3]="<%= pageArchFData.getWord("External Codec")%>";
arch[4]="<%= pageArchFData.getWord("Proxy Host")%>";
arch[5]="<%= pageArchFData.getWord("Proxy Port")%>";
arch[6]="<%= pageArchFData.getWord("Submit")%>";
arch[7]="<%= pageArchFData.getWord("Add new switch")%>";
arch[8]="<%= pageArchFData.getWord("Site")%>";
arch[9]="<%= pageArchFData.getWord("Name")%>";
arch[10]="<%= pageArchFData.getWord("Password")%>";
arch[11]="<%= pageArchFData.getWord("Iax Internal Host")%>";
arch[12]="<%= pageArchFData.getWord("Iax Internal Port")%>";
arch[13]="<%= pageArchFData.getWord("Iax External Host")%>";
arch[14]="<%= pageArchFData.getWord("Iax External Port")%>";
arch[15]="<%= pageArchFData.getWord("Number of lines available for out bound")%>";
arch[16]="<%= pageArchFData.getWord("Agents load balance")%>";
arch[17]="<%= pageArchFData.getWord("percent in site")%>";
arch[18]="<%= pageArchFData.getWord("Outbound load balance")%>";
arch[19]="<%= pageArchFData.getWord("Save")%>";
arch[20]="<%= pageArchFData.getWord("No sites were defined.**Please add site first")%>";
arch[21]="<%= pageArchFData.getWord("Add new encryption server")%>";
arch[22]="<%= pageArchFData.getWord("Server name")%>";
arch[23]="<%= pageArchFData.getWord("Protocol")%>";
arch[24]="<%= pageArchFData.getWord("Internal Host")%>";
arch[25]="<%= pageArchFData.getWord("Internal Port")%>";
arch[26]="<%= pageArchFData.getWord("External Host")%>";
arch[27]="<%= pageArchFData.getWord("External Port")%>";
arch[28]="<%= pageArchFData.getWord("Add new recording server")%>";
arch[29]="<%= pageArchFData.getWord("Internal Secure Port")%>";
arch[30]="<%= pageArchFData.getWord("External Secure Port")%>";
arch[31]="<%= pageArchFData.getWord("Tomcat Mount Dir. on Web server")%>";
arch[32]="<%= pageArchFData.getWord("Recording Dir. full path(local)")%>";
arch[33]="<%= pageArchFData.getWord("Recording Sales Directory")%>";
arch[34]="<%= pageArchFData.getWord("Recording NoSales Directory")%>";
arch[35]="<%= pageArchFData.getWord("Daily Synchronization")%>";
arch[36]="<%= pageArchFData.getWord("Send recordings to")%>";
arch[37]="<%= pageArchFData.getWord("Synchronization time(HH:mm)")%>";
arch[38]="<%= pageArchFData.getWord("percent in site")%>";
arch[39]="<%= pageArchFData.getWord("Max. disk to use")%>";
arch[40]="<%= pageArchFData.getWord("Configuration")%>";
arch[41]="<%= pageArchFData.getWord("Statistics")%>";
arch[42]="<%= pageArchFData.getWord("Diagram")%>";
arch[43]="<%= pageArchFData.getWord("Save layout")%>";
arch[44]="<%= pageArchFData.getWord("Show grid")%>";
arch[45]="<%= pageArchFData.getWord("Hide grid")%>";
arch[46]="<%= pageArchFData.getWord("Error: Specify site name")%>";
arch[47]="<%= pageArchFData.getWord("Error: Site already exists. Specify new name")%>";
arch[48]="<%= pageArchFData.getWord("Error: Unable to delete site")%>";
arch[49]="<%= pageArchFData.getWord("Unable to delete non empty site.**This site contains asterisk pbx  ")%>";
arch[50]="<%= pageArchFData.getWord("Delete it first")%>";
arch[51]="<%= pageArchFData.getWord("Unable to delete non empty site.**This site contains recording server")%>";
arch[52]="<%= pageArchFData.getWord("Unable to delete non empty site.**This site contains encryption server")%>";
arch[53]="<%= pageArchFData.getWord("Warning !Your are about to delete the")%>";
arch[54]="<%= pageArchFData.getWord(" site.**Do you want to continue?")%>";
arch[55]="<%= pageArchFData.getWord("Please wait for site deletion!")%>";
arch[56]="<%= pageArchFData.getWord("No site was associated with the new switch")%>";
arch[57]="<%= pageArchFData.getWord("Specify switch name")%>";
arch[58]="<%= pageArchFData.getWord("Specify switch password")%>";
arch[59]="<%= pageArchFData.getWord("Specify switch internal host name or ip address")%>";
arch[60]="<%= pageArchFData.getWord("Invalid switch internal port")%>";
arch[61]="<%= pageArchFData.getWord("Specify switch external host name or ip adresss")%>";
arch[62]="<%= pageArchFData.getWord("Invalid load balance for agents")%>";
arch[63]="<%= pageArchFData.getWord("Invalid load balance for outbound")%>";
arch[64]="<%= pageArchFData.getWord("Error: Switch ")%>";
arch[65]="<%= pageArchFData.getWord("already exists")%>";
arch[66]="<%= pageArchFData.getWord("Please wait for switch creation")%>";
arch[67]="<%= pageArchFData.getWord("Please wait for switch modification")%>";
arch[68]="<%= pageArchFData.getWord("Error: No specification about the switch name")%>";
arch[69]="<%= pageArchFData.getWord("switch.**Do you want to continue?")%>";
arch[70]="<%= pageArchFData.getWord("Error: Unknow switch ")%>";
arch[71]="<%= pageArchFData.getWord("Please wait while deleting switch")%>";
arch[72]="<%= pageArchFData.getWord("No site was associated with the new encryption server")%>";
arch[73]="<%= pageArchFData.getWord("Specify the encryption server name")%>";
arch[74]="<%= pageArchFData.getWord("Specify encryption server protocol")%>";
arch[75]="<%= pageArchFData.getWord("Specify encryption server internal host")%>";
arch[76]="<%= pageArchFData.getWord("Specify encryption server external host")%>";
arch[77]="<%= pageArchFData.getWord("Specify encryption server url")%>";
arch[78]="<%= pageArchFData.getWord("Specify encryption server internal port")%>";
arch[79]="<%= pageArchFData.getWord("Specify encryption server external port")%>";
arch[80]="<%= pageArchFData.getWord("Error: Encryption server")%>";
arch[81]="<%= pageArchFData.getWord("Specify the site name")%>";
arch[82]="<%= pageArchFData.getWord("Specify the server name")%>";
arch[83]="<%= pageArchFData.getWord("Specify server password")%>";
arch[84]="<%= pageArchFData.getWord("Specify the server internal host")%>";
arch[85]="<%= pageArchFData.getWord("Specify the server internal port")%>";
arch[86]="<%= pageArchFData.getWord("Specify the server internal port for secure communications")%>";
arch[87]="<%= pageArchFData.getWord("Specify the server external host")%>";
arch[88]="<%= pageArchFData.getWord("Specify the server external port")%>";
arch[89]="<%= pageArchFData.getWord("Specify the server external port for secure communications")%>";
arch[90]="<%= pageArchFData.getWord("Specify the local directory for recordings")%>";
arch[91]="<%= pageArchFData.getWord("Specify the directory for sales recordings")%>";
arch[92]="<%= pageArchFData.getWord("Specify the directory for no sales recordings")%>";
arch[93]="<%= pageArchFData.getWord("Specify the load balance for agents")%>";
arch[94]="<%= pageArchFData.getWord("Specify the sync. time or uncheck the synchronization option")%>";
arch[95]="<%= pageArchFData.getWord("Specify the master or uncheck the synchronization option")%>";
arch[96]="<%= pageArchFData.getWord("Please, set synchronisation time in HH:mm format, 5 characters needed!")%>";
arch[97]="<%= pageArchFData.getWord("Please, invalid synchronisation time, numbers required!")%>";
arch[98]="<%= pageArchFData.getWord("Invalid synchronisation time")%>";
arch[99]="<%= pageArchFData.getWord("Specify the URL under TOMCAT for recordings")%>";
arch[100]="<%= pageArchFData.getWord("A recording server ")%>";
arch[101]="<%= pageArchFData.getWord("Error: Recording server")%>";
arch[102]="<%= pageArchFData.getWord("Please wait while modifying new recording server")%>";
arch[103]="<%= pageArchFData.getWord("Site Configuration")%>";
arch[104]="<%= pageArchFData.getWord("Delete")%>";
arch[105]="<%= pageArchFData.getWord("Cti Live Statistics")%>";
arch[106]="<%= pageArchFData.getWord("Configured")%>";
arch[107]="<%= pageArchFData.getWord("Connected")%>";
arch[108]="<%= pageArchFData.getWord("Managers")%>";
arch[109]="<%= pageArchFData.getWord("Agent")%>";
arch[110]="<%= pageArchFData.getWord("Switch")%>";
arch[111]="<%= pageArchFData.getWord("Recording servers")%>";
arch[112]="<%= pageArchFData.getWord("Encryption servers")%>";
arch[113]="<%= pageArchFData.getWord("Modify Switch")%>";
arch[114]="<%= pageArchFData.getWord("Update")%>";
arch[115]="<%= pageArchFData.getWord("Switch Statistics")%>";
arch[116]="<%= pageArchFData.getWord("Status")%>";
arch[117]="<%= pageArchFData.getWord("Since")%>";
arch[118]="<%= pageArchFData.getWord("Agents")%>";
arch[119]="<%= pageArchFData.getWord("Inbound calls")%>";
arch[120]="<%= pageArchFData.getWord("Outbound dials")%>";
arch[125]="<%= pageArchFData.getWord("Lines usage")%>";
arch[126]="<%= pageArchFData.getWord("Used. ")%>";
arch[127]="<%= pageArchFData.getWord("Total. ")%>";
arch[128]="<%= pageArchFData.getWord("Modify encryption server")%>";
arch[129]="<%= pageArchFData.getWord("Modify recording server")%>";
arch[130]="<%= pageArchFData.getWord("Modify")%>";
arch[131]="<%= pageArchFData.getWord("Recording Server Statistics")%>";
arch[132]="<%= pageArchFData.getWord("Total recordings")%>";
arch[133]="<%= pageArchFData.getWord("Daily Total recordings")%>";
arch[134]="<%= pageArchFData.getWord("Disk usage")%>";
arch[135]="<%= pageArchFData.getWord("Rem. ")%>";
arch[136]="<%= pageArchFData.getWord("GB")%>";
arch[137]="<%= pageArchFData.getWord("Disconnected")%>";


var arr_months = new Array();
arr_months["January"]="<%= pageArchFData.getWord("January")%>";
arr_months["February"]="<%= pageArchFData.getWord("February")%>";
arr_months["March"]="<%= pageArchFData.getWord("March")%>";
arr_months["April"]="<%= pageArchFData.getWord("April")%>";
arr_months["May"]="<%= pageArchFData.getWord("May")%>";
arr_months["June"]="<%= pageArchFData.getWord("June")%>";
arr_months["July"]="<%= pageArchFData.getWord("July")%>";
arr_months["August"]="<%= pageArchFData.getWord("August")%>";
arr_months["September"]="<%= pageArchFData.getWord("September")%>";
arr_months["October"]="<%= pageArchFData.getWord("October")%>";
arr_months["November"]="<%= pageArchFData.getWord("November")%>";
arr_months["December"]="<%= pageArchFData.getWord("December")%>";

</script>
<% pageArchFData.closeConnection();%>