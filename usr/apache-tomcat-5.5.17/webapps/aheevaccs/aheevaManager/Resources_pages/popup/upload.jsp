<%@page import="aheevaManager.ressources.popbuilder.*"%>
<%@page import ="aheevaManager.ressources.*"%>
<%@page import="java.io.*,common.*,java.util.*"%>
<%
beanManagerData pageData = new beanManagerData();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
else
	pageData.setDefaultLanguage("ENGLISH");	


String act= request.getParameter("act");



String uniqueid = request.getParameter("uniqueid");
String popdbid  = request.getParameter("popdbid");
String path		= request.getParameter("path");
String popname	= request.getParameter("popname");	
String filename= request.getParameter("filename");
if (act !=null) {
	filename = UploadDownload.uploadAnyFile(request);
}

String sub_path = "";

if ("".equals(popdbid)) {
	sub_path = uniqueid;
} else {
	sub_path = popname;
}

%>



<LINK href="popup.css" rel="stylesheet" type="text/css" />
<script>
function imgUploadFit() {
	var uploadbodyWidth = document.getElementById("uploadbody").offsetWidth;
	var uploadbodyHeight = document.getElementById("uploadbody").offsetHeight;
	
	if (document.getElementById("uploadError")) {
	var uploadErrorWidth = document.getElementById("uploadError").offsetWidth;
	var uploadErrorHeight = document.getElementById("uploadError").offsetHeight;
	}
	
	var uploadInputWidth = document.getElementById("uploadInput").offsetWidth;
	var uploadInputHeight = document.getElementById("uploadInput").offsetHeight;
	
	var uploadButWidth = document.getElementById("uploadBut").offsetWidth;
	var uploadButHeight = document.getElementById("uploadBut").offsetHeight;
	
	var uploadDoneWidth = document.getElementById("uploadDone").offsetWidth;
	var uploadDoneHeight = document.getElementById("uploadDone").offsetHeight;
	
	if (document.getElementById("uploadError")) {
		document.getElementById("uploadContainer").style.height = (uploadbodyHeight-4) + "px";
		document.getElementById("uploadMain").style.height = ((uploadbodyHeight - (uploadErrorHeight + uploadInputHeight + uploadButHeight + uploadDoneHeight))-29) + "px";
		document.getElementById("uploadMain").style.width = (uploadbodyWidth - 16) + "px";
	}else{
		document.getElementById("uploadContainer").style.height = (uploadbodyHeight-4) + "px";
		document.getElementById("uploadMain").style.height = ((uploadbodyHeight - (uploadInputHeight + uploadButHeight + uploadDoneHeight))-29) + "px";
		document.getElementById("uploadMain").style.width = (uploadbodyWidth - 16) + "px";
	}
	if (document.getElementById("myimg")) { // if an image is loaded
		var uploadImgHeight = document.getElementById("myimg").offsetHeight;
		var uploadImgBoxHeight = document.getElementById("uploadMain").offsetHeight;
		if (uploadImgHeight < uploadImgBoxHeight) { // if smaller than view area center in view area
			document.getElementById("myimg").style.marginTop = (Math.round((uploadImgBoxHeight - uploadImgHeight)/2)) + "px";
		}else{ // if larger than view area align to top of view area
			document.getElementById("myimg").style.marginTop = 0 + "px";
		}
	}
};

function doUpload(){
	
	var val = document.uploadform.uploadfile.value;
	
   	if (val=="") {
   		alert("Please add file to upload");
   		return;
   	}
   	
   	ext = val.substr(val.length-4,val.length-1);
	
	if (ext !=".gif" && ext !=".GIF" && ext !=".jpg" && ext !=".JPG" && ext !=".bmp" && ext !=".BMP") {
		alert("File type should be .gif, .bmp or .jpg");
   		return;
	}
   	
  
   	
   	
   	var param="filepath="+val+"&act=1&path=<%=path%>&popdbid=<%=popdbid%>&popname=<%=popname%>&uniqueid=<%=uniqueid%>&filename=<%=filename%>";
	
   	document.uploadform.action="upload.jsp?"+param;
   	
   
   	document.uploadform.submit();
  
   	
   	

}
</script>
<html>
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
<head><title>Upload Image</title></head>
<body id="uploadbody" style="padding-bottom:0px; overflow:hidden" onLoad="imgUploadFit();" onResize="imgUploadFit()">
<form name="uploadform" enctype="multipart/form-data" method="post" >
<div id="uploadContainer" class="introContainer" >

	<%
	if (act!=null && "".equals(filename)) {
	%>
	<div id="uploadError">Error in uploading file</div>
	<%
	}
	%>
	
	<div id="uploadInput" style="padding-left:5px; padding-top:5px; color:#DFE6EA;">Image: <input type="file" name="uploadfile" class="formfields" size=30 ></div>
	
	<div id="uploadBut" style="padding-left:251px; padding-top:5px;">
	<input class="formfields" type='button' onClick="doUpload()" value="upload">
	</div> 
	
	<div id="uploadMain" class="pUpInnerBorder" style="overflow:auto; padding:0px; cursor:default; text-align:center;">
	<%
	if (!"".equals(filename)) {
		if ("logoaheeva01.gif".equals(filename)) {
		%>
			<img src="./phpgenerator/logoaheeva01.gif" name="myimg" id ="myimg" style="margin-top:0px">
		<%
			
		} else {
	
		%>
			<img src="/aheevaccs/servlet/Image?<%=path+sub_path+"/"+filename%>" name="myimg" id ="myimg" style="margin-top:0px">
		<%
		}
	}
	%>
	</div>
	
	<div id="uploadDone" style="padding-left:5px; padding-right:5px;">
	<input class="formfields" type='button' onClick="self.close()" value="close" style="float:right;">
	<%
	if (!"".equals(filename)) {
	%>
	File name: <%=filename %> <img src="../../img/popup/tick01.gif" width="18" height="18" align="absmiddle">
	<%
	}
	%>
	</div>
</div>
<input type="hidden" name="act" value="1">
<input type="hidden" name="filepath" value="">
<%
if (act !=null) {
	%>
	<script for="window" event="onload">
	try {
	
	window.opener.setPropertyValue('File',"<%=filename%>");
	
	window.opener.setPropertyValue('Width',document.getElementById("myimg").width+"px");
	window.opener.setPropertyValue('Height',document.getElementById("myimg").height+"px");
	window.opener.setPropertyValue('CnvWidth',document.getElementById("myimg").width+"px");
	window.opener.setPropertyValue('CnvHeight',document.getElementById("myimg").height+"px");
	window.opener.fillPropertiesCurrentObj();
	window.opener.redrawObject(-1,-1);
	}catch (exp){}
	
	imgUploadFit();
	</script>
	<%
}

%>


</form>
<div style="position:absolute;top:0;left:0;width:400;height:50;display:block;"></div>
</body>
</html>

<% pageData.closeConnection(); %>