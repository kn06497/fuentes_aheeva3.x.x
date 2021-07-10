<%@ page isErrorPage="true" %>
<html>
<head>
<%@page contentType="text/html"%>
<%@page language = "java" %>
<%@page import = "java.io.File" %>
<%@page import = "java.io.RandomAccessFile" %>
<%@page import = "java.io.FileNotFoundException" %>
<%@page import = "java.io.IOException" %>


<style type="text/css">
table.errorLog{
display:none;
border-style:solid;
border-color:Gray;
border-spacing:0px;
}

td.header
{
font-weight:bold;
}

td.content
{
	border-style:solid;
	border-color:Gray;
	border-width:1px;
	border-spacing:0px;
	
}

td.text{
font-size:large;
}

h2.expand
{
cursor:pointer;
font-size:small;
text-decoration:underline;

}
</style>
<body bgcolor="#E1F4FF">
</head>
<body>
<script language="javascript" type="text/javascript" src="/aheevaccs/Manager/language.js"></script>
<script language="javascript" type="text/javascript" src="/aheevaccs/Manager/lang_browser.js"></script>
<script language="javascript">
if (lang == "" || lang == null) lang = "DEFAULT"
/*
@description: Modifie l'affichage pour montrer/cacher l'error log
*/
function test(){
	var infoTxt;
	if (lang != "DEFAULT") infoTxt = MultiArray["More info"][lang];
	else infoTxt = "More info";
	if (document.getElementById('errorTable').style.display == 'block'){
		document.getElementById('errorTable').style.display = 'none';
		document.getElementById('title').innerHTML = "[+]" + infoTxt;
	}
	else{
		document.getElementById('errorTable').style.display = 'block';
		document.getElementById('title').innerHTML = "[-]" + infoTxt;
	}
}
</script>

<table width="528" height="93" border="0" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" style="border: 1px solid rgb(136, 136, 136);">
  <tr> 
    <td height="21" colspan="3">&nbsp;</td>
  </tr>
  <tr> 
    <td width="56" height="24" valign=top><img src="/aheevaccs/Manager/img/Aheeva-logo_small.jpg" width="142" height="80"></td>
    <td width="435" class="text"><script>
		if (lang != "DEFAULT") document.write(MultiArray["Error note"][lang]); 
		else document.write("We apologise for the inconvenience, but the page requested can not be displayed.");
	</script></td>
    <td width="1">&nbsp;</td>
  </tr>
</table>
<table><tr><td><h2 id='title' onClick='test()' class='expand'><script>
										if (lang != "DEFAULT") document.write("[+]" + MultiArray["More info"][lang]);
										else document.write("[+] More info");
									</script></div></h2></td></tr></table>
<table id="errorTable" class="errorLog"><tr><td>


<% 
//Affichage du error log le plus recent
//WARNING:Entrer un mauvais repertoire peut entrainer des ennuis leger
	String path = "/usr/apache-tomcat-5.5.17/logs/"; //repertoire des error logs
	File filePath = new File(path);
	File[] list = filePath.listFiles();
	long lastMod = 0;
	String lastModFile = "";

	//Boucle pour trouver le fichier le plus recent. Comme l'erreur vient tout juste d'y etre ecrite il est le plus recent
	for (int i = 0; i < list.length; i ++){
		if (list[i].lastModified() > lastMod){
			lastMod = list[i].lastModified();
			lastModFile = list[i].getName();
		}
	}


	try {
		RandomAccessFile fileIn = new RandomAccessFile(path + lastModFile, "r");
		out.println("File: " + path + lastModFile + "</br></br>");
		String line;
		long lastHeaderPosition = 0;
		long position = 0;
		String header = fileIn.readLine().substring(0,10);

		//recherche de la derniere ecriture au log en se fiant au 10 premiers caracteres du header, ie.:la date
		while ((line = fileIn.readLine()) != null){
			if (line.indexOf(header) == 0){
				lastHeaderPosition = position;
			}
			position = fileIn.getFilePointer();
		}


		fileIn.seek(lastHeaderPosition);
		boolean ident = false;

		//Une fois la derniere entree trouvee, on transcrit le log dans la page generee
		while ((line = fileIn.readLine()) != null){
			if (!ident && line.indexOf("at") == 1){
				ident = true;
				out.println("<dir>");
			}
			else if(ident && line.indexOf("at") != 1){
				ident = false;
				out.println("</dir>");
			}
			out.println(line + "<br/>");
		}


		fileIn.close();
	} catch (FileNotFoundException e) {
		out.println("ERROR - No error log found");
	} catch (IOException e) {
		out.println("ERROR - IOException");

		}	
%>


</td></tr></table>
</body>
</html>