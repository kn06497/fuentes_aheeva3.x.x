<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import ="aheevaManager.ressources.*"%>
<%
beanManagerData pageforbData = new beanManagerData();
pageforbData.openConnection();
if( session.getAttribute("USER_LANGUAGE") != null )
	pageforbData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

%>
<html>
<head>
<title>Forbidden Access</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="style.css" rel="stylesheet" type="text/css" >
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="JavaScript" src="jsUtil.js"></script> 

<!--<LINK href="style.css" rel="stylesheet" type="text/css" />-->

<style type="text/css">

.dynamic-tab-pane-control .contentText{
	font:			12px Tahoma;
	color:			Black;
}
.dynamic-tab-pane-control .tab-page {
	clear:			both;
	border:			1px solid rgb( 145, 155, 156 );
	background:		rgb( 252, 252, 254 );
	z-index:		2;
	position:		relative;
	top:			-2px;

	font:			11px Tahoma;
	color:			Black;

	filter:			progid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)
					progid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);
	
	/* 244, 243, 238 */ 
	/*145, 155, 156 */
	padding:		10px;
}

.dynamic-tab-pane-control .tab-row {
	z-index:		1;
	white-space:	nowrap;
}
 
.dynamic-tab-pane-control .tab-row .tab.selected {
	width:				74px  ;
	height:				18px  ;
	background-image:	url( "tab.active.png" )  ;
	background-repaet:	no-repeat;

	border-bottom-width:	0;
	z-index:		3;
	padding:		2px 0 0px 0;
	margin:			1px -3px -3px 0px;
	top:			-2px;
	font:			11px Tahoma;
}

.dynamic-tab-pane-control .tab-row .tab a {
	font:				11px Tahoma;
	color:				Black;
	text-decoration:	none;
	cursor:				default;
}

.dynamic-tab-pane-control .tab-row .tab.hover {
	font:				11px Tahoma;
	width:				70px;
	height:				16px;
	background-image:	url( "tab.hover.png" );
	background-repaet:	no-repeat;
}
 
.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		200px;
}
 
html, body {
/*	background:	ThreeDFace; */

}

form {
	margin:		0;
	padding:	0;
} 

/* over ride styles from webfxlayout */
 
body {
	margin:		10px;
	width:		auto;
	height:		auto;
}

.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}

.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
}

.dynamic-tab-pane-control a:hover {
	background: transparent;
}
 
 .dynamic-tab-pane-control.tab-pane {
	position:	relative;
	width:		100%;		 
	margin-right:	-2px;	 
	height:		200px;
	
}

</style>
 

</head>

<body class="bottompagebody">
<p>&nbsp;</p>
<table width="403" height="82" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="51">&nbsp;</td>
    <td width="302">&nbsp;</td>
    <td width="50">&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><img src="../Manager/img/stop_sign.gif" width="50" height="50" /></div></td>
    <td><div align="center"><strong>No further access!</strong></div></td>
    <td><img src="../Manager/img/stop_sign.gif" width="50" height="50" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
<% pageforbData.closeConnection(); %>