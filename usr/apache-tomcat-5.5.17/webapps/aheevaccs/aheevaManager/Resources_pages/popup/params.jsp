<%@page import = "aheevaManager.ressources.*" %>
<%@page import="aheevaManager.ressources.popbuilder.*"  %>
<% beanManagerData pageData=new beanManagerData();
   if( session.getAttribute("USER_LANGUAGE") != null )
	   pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
   String vpath=(request.getParameter("phpPath")==null)?"":request.getParameter("phpPath");
   String vphysical=(request.getParameter("physicalName")==null)?"":request.getParameter("physicalName");
   String vuser=(request.getParameter("userName")==null)?"":request.getParameter("userName");
   String vpass=(request.getParameter("password")==null)?"":request.getParameter("password");
   String vip=(request.getParameter("ip")==null)?"":request.getParameter("ip");
   String vport=(request.getParameter("port")==null)?"":request.getParameter("port");
   String vload=(request.getParameter("load")==null)?"":request.getParameter("load");
   String frompop = (request.getParameter("frompop")==null)?"0":request.getParameter("frompop");
   Params param=new Params();
   pageData.openConnection();
   if(vload.equals("update")){
	   param.updateParams(vpath,vphysical,vuser,vpass,vip,vport);
	   if ("1".equals(frompop)) {
		   %><script>window.opener.location.reload();window.close();</script><%
	   }
   }
   param=new Params();
%>
<html>
<head>
<script>
 <%@ include file="include_labels.jsp"%>
</script>
<LINK href="popup.css" rel="stylesheet" type="text/css" />
<LINK href="../style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="validation.js"></script>
<script type="text/javascript">
function paramFit() {
	var parambodyWidth = document.getElementById("parambody").offsetWidth;
	var parambodyHeight = document.getElementById("parambody").offsetHeight;
	
	var paramTitleWidth = document.getElementById("paramTitle").offsetWidth;
	var paramTitleHeight = document.getElementById("paramTitle").offsetHeight;
	
	
	var paramUpdateWidth = document.getElementById("paramUpdate").offsetWidth;
	var paramUpdateHeight = document.getElementById("paramUpdate").offsetHeight;
	
	
	document.getElementById("paramContainer").style.height = (parambodyHeight-4) + "px";
	document.getElementById("paramMain").style.height = ((parambodyHeight - (paramTitleHeight + paramUpdateHeight))-29) + "px";
	document.getElementById("paramMain").style.width = (parambodyWidth - 16) + "px";

};


function updateParam(){
  if(document.paramsfrm.phpPath.value==""){
     alert("<%=pageData.getWord("Please enter the Php Generation Path")%>");
     document.paramsfrm.phpPath.focus();
     return;
  }
  if(document.paramsfrm.physicalName.value==""){
     alert("<%=pageData.getWord("Please enter the Physical Name")%>");
     document.paramsfrm.physicalName.focus();
     return;
  }
  if(document.paramsfrm.userName.value==""){
     alert("<%=pageData.getWord("Please enter the User Name")%>");
     document.paramsfrm.userName.focus();
     return;
  }
  if(document.paramsfrm.password.value==""){
     alert("<%=pageData.getWord("Please enter the Password")%>");
     document.paramsfrm.password.focus();
     return;
  }
   
   if(document.paramsfrm.ip.value==""){
     alert("<%=pageData.getWord("Please enter the Ip")%>");
     document.paramsfrm.ip.focus();
     return;
  }
  if(document.paramsfrm.port.value==""){
     alert("<%=pageData.getWord("Please enter the Port")%>");
     document.paramsfrm.port.focus();
     return;
  } 
  if(!IsValidIp(document.paramsfrm.ip)){
     alert("<%=pageData.getWord("Please enter a correct Ip")%>");
     return;
  }
  if(!IsValidPort(document.paramsfrm.port)){
     alert("<%=pageData.getWord("Please enter a correct Port")%>");
     return;
  }
  validatePath(document.paramsfrm.phpPath)
  
  document.paramsfrm.physicalName.value = cleanVal(document.paramsfrm.physicalName.value);
  document.paramsfrm.userName.value = cleanVal(document.paramsfrm.userName.value);
  
  
  document.paramsfrm.action="params.jsp?load=update";
  
	if (window.opener.needToSaveChanges) {
		var v = confirm("YOU HAVE UNSAVED DATA IN YOUR POPUP\n\nAny unsaved data will be lost if you continue this update.\n\n\nClick 'Cancel' and save your data in the popup builder before continuing          \nor\nclick 'OK' to continue (data will be lost)");
   	
		if (v) {
			window.opener.needToSaveChanges = false;
			document.paramsfrm.submit();
		} else {
//			self.close();
		}
	} else {
		document.paramsfrm.submit();
	}
  
}
</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>
<body id="parambody" style="padding-bottom:0px; overflow:hidden" onLoad="paramFit();">
	<form name="paramsfrm" method="post">
		<div id="paramContainer" class="introContainer" >
			<div id="paramTitle" style="padding-left:5px; padding-top:5px; color:#DFE6EA;"><%=pageData.getWord("Parameter")%></div>
	
			<div id="paramMain" class="pUpInnerBorder" style="overflow:auto; padding-left:5px; padding-top:10px; cursor:default;">
				
				<div>
				<span style="padding-top:5px"><%=pageData.getWord("Php Generation Path")%></span><span style="position:absolute; left:200px;"><input type="text" name="phpPath" value="<%=param.getPathDownload() %>" size="40"/></span>
				</div>
				<div style="padding-top:10px">
				<span style="padding-top:5px"><%=pageData.getWord("Database Physical Name")%></span><span style="position:absolute; left:200px;"><input type="text" name="physicalName" value="<%=param.getPhysicalName()%>" onBlur="validCharacters(this)" onKeyPress="doEnter(this,event)"/></span>
				</div>
				<div style="padding-top:10px">
				<span style="padding-top:5px"><%=pageData.getWord("Database UserName")%></span><span style="position:absolute; left:200px;"><input type="text" name="userName" value="<%=param.getUserName()%>" onBlur="validCharacters(this)" onKeyPress="doEnter(this,event)"/></span>
				</div>
				<div style="padding-top:10px">
				<span style="padding-top:5px"><%=pageData.getWord("Database Password")%></span><span style="position:absolute; left:200px;"><input type="password" name="password" value="<%=param.getPassword()%>" onBlur="validCharacters(this)" onKeyPress="doEnter(this,event)"/></span>
				</div>
				<div style="padding-top:10px">
				<span style="padding-top:5px"><%=pageData.getWord("Server Ip")%></span><span style="position:absolute; left:200px;"><input type="text" name="ip" value="<%=param.getIp()%>"/></span>
				</div>
				<div style="padding-top:10px">
				<span style="padding-top:5px"><%=pageData.getWord("Port")%></span><span style="position:absolute; left:200px;"><input type="text" name="port" value="<%=param.getPort()%>"/></span>
				</div>
			</div>
	
			<div id="paramUpdate" style="padding-left:5px; padding-right:5px; text-align:center">
			<input type="button" value="Update" onClick="updateParam()"/>
    		<input type="hidden" name="frompop" value="<%=frompop%>"/>
			</div>
		</div>
	</form>
</body>



</html>
<%pageData.closeConnection();%>