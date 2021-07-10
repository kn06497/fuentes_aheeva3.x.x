<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import ="javax.naming.*"%>
<%@page import = "aheevaManager.ressources.*" %>
<%@ include file="architectureFunctions_labels.jsp" %>
<%
////open connection to database///////
beanManagerData pageData = new beanManagerData();
System.out.println(session.getAttribute("USER_LANGUAGE"));
if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));
    pageData.openConnection();
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Architecture1</title>
<link href="architectureStyle.css" 	rel="stylesheet" type="text/css" />
<link href="office_xp.css"			rel="stylesheet" type="text/css" />
<LINK href="livestats.css" 	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../lang_browser.js"></script>
<script language="javascript" type="text/javascript" src="Browser.js"></script>
<script language="javascript" type="text/javascript" src="jsUtil.js"></script>
<script language="javascript" type="text/javascript" src="wz_jsgraphics.js"></script>
<script language="javascript" type="text/javascript" src="archjsdomenu.config.js"></script>
<script language="javascript" type="text/javascript" src="archjsdomenu.inc.js"></script>
<script language="javascript" type="text/javascript" src="jsdomenu.js"></script>
<script language="javascript" type="text/javascript" src="archClasses.js"></script>
<script language="javascript" type="text/javascript" src="archdlgs.js"></script>
<script language="javascript" type="text/javascript" src="architectureFunctions.js"></script>
<script language="javascript" type="text/javascript" src="xparse.js"></script>
<script language="javascript" type="text/javascript" src="xmlDomFunctions.js"></script>



<!-- Menu Files -->
<style>
#nav{list-style: none; }

 #nav ul { 
	padding: 0;
	margin:0;
	list-style: none;
    width:12em;
    z-index:99;
    position:relative;
    overflow:visible;  
   }

#nav li { 
    margin:0;   
    position: relative; 
    float:left;
	width: 12em;
	background-color:#DFDFDF;
    border:solid 1px #CECECE;
    display:block;
    height:auto;
}
#nav ul li{ background-color:#DFDFDF;}

#nav ul li{ border-width:1px 1px 0 0;}
#nav ul ul li{ border-width:1px 1px 0 1px;}
#nav ul ul li:last-child{border-width:1px;}
 
#nav a {
    text-decoration:none; 
    display:block;
    padding: 0.1em;  
    margin:0.2em 0 0.2em 0.1em; 
    width:11.5em; 
    height:1.05em;
}

#nav a:hover, #nav li:hover{
    background-color:#DFDFDF; 
}
#nav ul li:hover, #nav ul li a:hover{ background-color:#DFDFDF;}


#nav ul{
    display:none;   
}

/*all see this */
#nav ul ul, #nav ul ul ul{
    display:none; 
    position:absolute; 
    margin-top:-1.8em; 
    margin-left:12em;
}

/* non-IE browsers see this */
 #nav ul li>ul, #nav ul ul li>ul{
    margin-top:-1.4em; 
 }

 
#nav li:hover ul ul, #nav li:hover ul ul ul, #nav li:hover ul ul ul ul, #nav li:hover ul ul ul ul ul{
    display:none; 
}

#nav li:hover ul, #nav ul li:hover ul, #nav ul ul li:hover ul, #nav ul ul ul li:hover ul, #nav ul ul ul ul li:hover ul{
    display:block;
}



li>ul { 
	top: auto;
	left: auto;
}

 #holdm{position:absolute; top:150px; left:20px; z-index:100; width:80%;}
</style>
<script>
activateMenu = function(nav) {
	
    /* currentStyle restricts the Javascript to IE only */
	if (document.all && document.getElementById(nav).currentStyle) {  
        var navroot = document.getElementById(nav);
        
        /* Get all the list items within the menu */
        var lis=navroot.getElementsByTagName("LI");  
        for (i=0; i<lis.length; i++) 
		{
        
           /* If the LI has another menu level */
            if(lis[i].lastChild.tagName=="UL")
			{
            
                /* assign the function to the LI */
             	lis[i].onmouseover=function() 
				{	
                
                   /* display the inner menu */
                   this.lastChild.style.display="block";
                }
                lis[i].onmouseout=function() {                       
                   this.lastChild.style.display="none";
                }
            }
        }
    }
}



</script>
<!-- ~~~ Menu Files ~~~ -->




</head>

<body class="config_body" onLoad="initjsDOMenu()">
<script language="javascript" type="text/javascript" src="wz_dragdrop.js"></script>
	
	<div id="topmenu" style="position:absolute;height:3%;width:100%; z-index:20">
		<!--<a href="javascript:addRecordingServer()">function01</a> | <a href="javascript:addEncryption()">function02</a> | <a href="javascript:document.location='architecture.htm'">function03</a>-->
		<ul id="nav">
         
    <li> <a href="#" > 
     <%= pageData.getWord("Network")%>
      </a> 
      <ul>
        <!--<li><a href="javascript:saveWholeConfig()" >Save Configuration</a></li>-->
        <li><a href="javascript:saveLayout()" > 
          <%= pageData.getWord("Save layout")%>
          </a></li>
        <li><a href="javascript:loadLayout()" > 
          <%= pageData.getWord("Reset layout")%>
          </a></li>
        <!--<li><a href="javascript:addLink(0,0,100,100, 'aaaa', 'bbbb')" >function01</a></li>-->
      </ul>
    </li>
		 
    <li> <a href="#" >Sites</a> 
      <ul>
        <li><a href="javascript:addSite()" > 
          <%= pageData.getWord("Add site")%>
          </a></li>
      </ul>
    </li>
		 
    <li> <a href="javascript:" > 
      <%= pageData.getWord("Servers")%>
      &amp; 
      <%= pageData.getWord("Services")%>
      </a> 
      <ul>
        <li><a href="javascript:addSwitch()" > 
          <%= pageData.getWord("Add pbx server")%>
          </a></li>
        <li><a href="javascript:addRecordingServer()" > 
           <%= pageData.getWord("Add recording server")%>
          </a></li>
	 <script>
		if(appletObj.getIsEncryptionServerAllowed()) {
        		document.write ("<li><a href='javascript:addEncryption()' ><%= pageData.getWord("Add encryption server")%></a></li>");
		}else{
		  	document.write ("<li style='color:gray'><%= pageData.getWord("Add encryption server")%></li>");
		}
	</script>	
        <li><a href="javascript:displayCtiServerLiveStats()" > 
          <%= pageData.getWord("Statistics")%>
          </a></li>
      </ul>
    </li>
		 
     	</ul>
	</div>
	
	
<div id="diagram" class="diagram"  style="position:relative;height:97%;width:100%;">	
</div>
	
	
	
	<!-- 	  Dialogs   	--> <!--
	<div id="dlgNewSite" class="dlgNewSite">
		<table>
			<tr>
				<td class="middleText">Create a new site</td><td><img src="../img/close2.gif" width="15" height="15"></td>
			</tr>
		</table>	
	</div>	-->
	<!-- 	~~Dialogs~~ 	-->
	<script>
		currentGraphic = new jsGraphics('diagram');
		SET_DHTML("diagram"+NO_DRAG);
		
		setTimeout('initialize()', 200);
		
		activateMenu('nav'); 
		appletObj.sendPbxStatsRequest()
		setInterval("appletObj.sendPbxStatsRequest()", 7000);
		
	</script>
</body>
<% pageData.closeConnection(); %>
</html>
