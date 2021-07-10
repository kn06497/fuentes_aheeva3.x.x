<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

<html>
<head>
<meta http-equiv="Content-type" content="text/html;charset=ISO-8859-1">
<title>Aheeva</title>
<LINK REL="SHORTCUT ICON" HREF="img/aheeva.ico">

<!-- Fixes the IE6 & IE7 "Press SP
ACEBAR or ENTER to activate and use this control" - must be at the beginning of the file-->
<script type="text/javascript" src="activateActiveX_onload.js"></script>
<script type="text/javascript" src="/jsUtil.js"></script>

<script type="text/javascript">
        function refreshFrame() {
        frames['comm'].window.location.href = "CommPage.jsp"; // frame 1's page
}
</SCRIPT>
<script type="javascript" src="Resources_pages/globFuncsIndexHTM.js"></script>
<!-- Fixes the IE6 & IE7 "Press SPACEBAR or ENTER to activate and use this control" - must be at the end of the file-->
<script type="text/javascript" src="activateActiveX.js" ></script>

</head>
<frameset rows="*,100%" >
<frame name="comm" scrolling="no" noresize src="CommPage.jsp" >
<frame name="main" scrolling="no" noresize src="login.jsp" >
<noframes>Your browser does not support frames</noframes>
</frameset>

</html>

