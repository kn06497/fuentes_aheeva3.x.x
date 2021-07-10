<%@page contentType="text/html"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Conversation recording</title>

<%@page language = "java" %>
<%@page import ="java.io.*"%>
<%@page import ="java.text.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.net.*"%>
<%@page import ="javax.net.ssl.HostnameVerifier"%>
<%@page import ="javax.net.ssl.HttpsURLConnection"%>
<%@page import ="javax.net.ssl.SSLSession"%>
 
<%@page import ="aheevaManager.reports.*"%>
<jsp:useBean id="beanRecord" scope="request" class="aheevaManager.reports.beanConversationRecord" /> <!--beanConversationRecord-->
<%@page import ="aheevaManager.ressources.*"%>
<%
	beanManagerData pageData = new beanManagerData();
	if( session.getAttribute("USER_LANGUAGE") != null )
		pageData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );
%>

<script language="javascript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="../language_reports.js"></script>
<script language="JavaScript">
var lang =normalizeString(QueryString('lang'));
</script>

 
<%
	//Variables and constants declarations
	String record_id = null, serverparams= "", agt_id ="", phoneNum="";
	String record_filename ="", is_encrypted="0", call_time="", servletUrl="";
	String tomcat_dir="", path="", filePath="", file="",tmpPath="",subdir="";
	String serverHost = "", serverSecurePort="", encmeth="", protocol="http";
	String userDbid="", mnt_dir="mnt", tomcat_url="", tomcat_path="";
	String audio_filename, audio_rectime;
	String video_filename, video_rectime;
	
	//Get the request parameters
	record_id = request.getParameter("record_id");
	filePath = request.getParameter("path");
	audio_filename =  request.getParameter("file");	
	audio_rectime = request.getParameter("audio_time");	
	video_filename =  request.getParameter("video_file");	
	video_rectime =  request.getParameter("video_time");	
	servletUrl = request.getParameter("servletpath");
	is_encrypted = request.getParameter("encval");
	serverHost = request.getParameter("encServerHost");
	serverSecurePort = request.getParameter("encServerPort");
	encmeth = request.getParameter("encmeth");
	protocol = request.getParameter("proto");
	tomcat_url = request.getParameter("tomcaturl");
	tomcat_path = request.getParameter("tomcatpath");

	// Finding the name without the extension
	String video_name = new String(video_filename.substring(0,video_filename.lastIndexOf(".")));

    int pIndex = -1;
    String temp_dir = "";
    if(filePath != null)
        pIndex=filePath.lastIndexOf("/");

    for(int nbiter = 0; nbiter < 2; nbiter++)
    {
        if(pIndex > -1)
        {
            //Get the last dir position
            pIndex = filePath.lastIndexOf("/",pIndex-1);
        }
    }
    if( filePath != null)
        filePath = filePath.substring (pIndex+1);


	// Decription url
	String decUrl = "./decrypt.jsp?record=";
	if (is_encrypted != "0") {
		decUrl +=record_id;
		decUrl +="&path=";
		decUrl +=path;
		decUrl +="&encmeth=";
		decUrl +=encmeth;
		decUrl +="&proto=";
		decUrl +=protocol;
		decUrl +="&encServerHost=";
		decUrl +=serverHost;
		decUrl +="&encServerPort=";
		decUrl +=serverSecurePort;
		decUrl +="&servletpath=";
		decUrl +=servletUrl;
		decUrl +="&tomcaturl=";
		decUrl +=tomcat_url;
		decUrl +="&tomcatpath=";
		decUrl +=tomcat_path;
	}
%>

<script src="scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="scripts/AC_ActiveX.js" type="text/javascript"></script>

</head>

<style type="text/css">

    #slider-bg {
        position: relative;
        background:url(assets/bg-fader.gif) 5px 0 no-repeat;
        height:28px;
        width:228px; 
    }

    #slider-thumb {
        position: absolute;
        top: 4px;
    }
</style>


<body>

<script type="text/javascript">

// Recordings parameters
var audioLoaded = false;
var audioRecordTime = <% out.write(video_rectime); %>;
var videoRecordTime = <% out.write(audio_rectime); %>;
var pxLeft;
var mouseOver = false;

// Play start parameters
var audioStart;
var videoStart;
var audioStarted;
var sliderSize = 1000;
if (audioRecordTime < videoRecordTime) {
	audioStart = 0;
	videoStart = videoRecordTime - audioRecordTime;
} else {
	audioStart = audioRecordTime - videoRecordTime;
	videoStart = 0;
}

// Current play status
var playStart;
var playCurrent;
var updating = false;

var audioPlaying = false;
var videoPlaying = false;

// FIXME: Fetch the framerate from the movie... 
var frameRate = 15;
var video;
var audio;
var mm = 0;

// Slider startup
function startSlider()
{
	//document.getElementById("status").value = d.getTime();
	video = document.getElementById( "mymov" );
	audio = document.getElementById( "audio_app" );

	// Wait for the movie to be completely loaded
	if (video.PercentLoaded() != 100) {
		setTimeout('startSlider()',1000);
		return;
	}

	// Setting video infos
	pxLeft = carpeLeft('movie_slider');

	// Setting current start time
	var d = new Date();
	playStart = d.getTime();

	// Start the right one
	if (audioStart == 0) {
		audio.startSeek(0);
		audioPlaying = true;
	} else {
		video.TPlay("/");
		videoPlaying = true;
	}

	// Getting the end of play time
	maxTime = videoStart + video.TGetProperty('/', 5)*1000/frameRate

	updating = true;
	setTimeout('updateMovie()',500);
}

function updateMovie()
{
	if (mouseOver) {
		updating = false;
		return;
	}

	// Getting the current elapsed time
	var d = new Date();
	playCurrent = d.getTime() - playStart;

	// Start audio when required to
	if (playCurrent > audioStart && !audioPlaying) {
		audio.startSeek(0);
		audioPlaying = true;
	}
	if (playCurrent > videoStart && !videoPlaying) {
		video.TPlay('/');
		videoPlaying = true;
	}

	updateSlider();

	//document.getElementById("status").value = current_time;
	if (playCurrent < maxTime)
		setTimeout('updateMovie()',500);
	else
		updating = false;
}

function updateSlider()
{
	var pos = (playCurrent * 300)/ maxTime;
	if (pos > 300)
		pos = 300;
	else
		pos = Math.round(pos);
	//document.getElementById("status").value = maxTime;

	carpeLeft("movie_slider", pos);
}

function seekRecord(percent)
{
	// Setting new time
	playCurrent = Math.floor(percent*maxTime);
	//document.getElementById('value_disp').value = percent;
	//document.getElementById('disp').value = playCurrent;

	// Stop everything
	video.StopPlay();

	// Updating start time
	var d = new Date();
	playStart = d.getTime() - playCurrent;

	// Go to the right position
	if (playCurrent - audioStart > 0) {
		//document.getElementById('value_disp').value = playCurrent - audioStart;
		audio.startSeek(playCurrent - audioStart);
		audioPlaying = true;
	} else {
		audio.startSeek(0);
		audioPlaying = false;
	}

	if (playCurrent - videoStart > 0) {
		video.TGotoFrame('/', Math.floor((playCurrent - videoStart)/1000)*frameRate);
		video.Play();
		videoPlaying = true;
	} else {
		video.TGotoFrame('/', 0);
		videoPlaying = false;
	}

	updateSlider();
	if (playCurrent < maxTime && !updating) {
		updating = true;
		setTimeout('updateMovie()',500);
	}
}
</script>


<object id="mymov" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" 
	codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" 
	width="800" height="600">
	<param name="movie" value="<% 
	if (is_encrypted.compareTo("0") == 0) {
		out.write("../../"+tomcat_url+filePath+video_filename); 
	} else {
		out.write(decUrl + "&file=" + video_filename); 
	}
	%>">
	<param name="quality" value="high">
	<param name="loop" value="False">
	<param name="Play" value="False">
	<embed src="<% 
	if (is_encrypted.compareTo("0") == 0) {
		out.write("../../"+tomcat_url+filePath+video_filename); 
	} else {
		out.write(decUrl + "&file=" + video_filename); 
	}	
	%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="mymov"  width="400" height="300"></embed></object>

<object classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"
WIDTH = "1" HEIGHT = "1"  codebase="http://java.sun.com/products/plugin/1.3/jinstall-13-win32.cab#Version=1,3,0,0" name='audio_app'>
<param NAME = CODE VALUE = "javazoom.jl.player.PlayerApplet" >
<param NAME = ARCHIVE VALUE = "scripts/APlayerApplet.jar" >
<param NAME="scriptable" VALUE="false">
<param NAME = "audioURL" VALUE ="<% 
if (is_encrypted.compareTo("0") == 0) {
	out.write("../../"+tomcat_url+filePath+audio_filename); 
} else {
	out.write(decUrl + "&file=" + audio_filename); 
}
%>">
<comment>

<embed type="application/x-java-applet;version=1.3"  CODE = "javazoom.jl.player.PlayerApplet" ARCHIVE = "scripts/APlayerApplet.jar" WIDTH = "32" HEIGHT = "32" audioURL = "<% 
if (is_encrypted.compareTo("0") == 0) {
	out.write("../../"+tomcat_url+filePath+audio_filename); 
} else {
	out.write(decUrl + "&file=" + audio_filename); 
} %>"  scriptable=false pluginspage="http://java.sun.com/products/plugin/1.3/plugin-install.html" id="audio_app"><noembed></comment>
</object>



<p>

<link
    href="scripts/slider_default.css"
    rel="stylesheet"
    type="text/css" />

<script
    language="JavaScript"
    src="scripts/slider.js" >
</script>


<!-- Horizontal slider 1 (green) -->
<div class="horizontal_track" id="movie_track" >
<div class="horizontal_slit" id="movie_slit" >&nbsp;</div>
<!-- total movement: 300 pixels, scale: 1 [value/pixel],
default position: 0 pixels, connected to value_display_1 -->
<div class="horizontal_slider" id="movie_slider" style="left: 0px;"
onmousedown="slide(event, 0, 300, 'seekRecord');" >&nbsp;</div>
	</div>

	<!--
<input type="text" id="value_disp" value="80" onfocus="blur(this);" />

<input type="text" id="disp" />
<input type="text" id="status" />

<input type="text" id="swee" value="<% 
//if (is_encrypted.compareTo("0") == 0) {
		out.write("../../"+tomcat_url+filePath+video_filename); 
	//} else {
		out.write(decUrl + "&file=" + video_filename); 
	//}

 %>"> 

 -->


</div>

<script>
setTimeout('startSlider();', 1000);
</script>


</p>

</body>

