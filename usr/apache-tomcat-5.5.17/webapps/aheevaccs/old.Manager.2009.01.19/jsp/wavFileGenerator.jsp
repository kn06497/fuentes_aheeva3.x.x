
<%@page contentType="text/html"%>
 
<title> Conversation Recording</title>

<%@page language = "java" %>
<%@page import ="java.io.*"%>
<%@page import ="java.text.*"%>
<%@page import ="java.util.*"%>
<%@page import ="java.net.*"%>
<%@page import ="javax.net.ssl.HostnameVerifier"%>
<%@page import ="javax.net.ssl.HttpsURLConnection"%>
<%@page import ="javax.net.ssl.SSLSession"%>

<%@page import ="Manager.reports.*"%>
<jsp:useBean id="beanRecord" scope="request" class="Manager.reports.beanConversationRecord" /> <!--beanConversationRecord-->
<%@page import ="Manager.ressources.*"%>
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
<script >

function submitInfo()
{
	var record_file = submitInfo.arguments[0];
	var has_found = submitInfo.arguments[1];
	var enc = submitInfo.arguments[4];
	var reason = submitInfo.arguments[5];
	//alert('../../'+record_file+'...'+submitInfo.arguments[1]+'...'+submitInfo.arguments[2]+'...'+submitInfo.arguments[3]+'...'+enc)
	if(has_found == 'true' && enc == '0')
		javascript:window.open('../../'+record_file,'formWindow');//,'scrollbars=yes',width=800,height=500
	else
	{
		if(has_found == 'false' )
		{ // The record is not found on the server..
			if(reason.length > 1 )
			{
				alert(reason);
			}
			else
			{
				<%
				String errormsg_beg = pageData.getWord("Could not find the record");
				String errormsg_end = pageData.getWord("on disk. Please verify that the recording is still on disk at the right place");
				errormsg_end += pageData.getWord("You would like to check also that the mount service is working properly");
				errormsg_end += pageData.getWord(" if a directory has been mounted for recordings");
				out.write("alert('"+errormsg_beg+" '+record_file+' "+errormsg_end+"');");
				%>
			}
		}
	
		var user = submitInfo.arguments[2];
		var rec = submitInfo.arguments[3];
		
		if( window.top.comm.myApplet)
			var sret = window.top.comm.myApplet.deleteRecListenMessage(user,rec);
	}
	return true;
}
</script>

 
<%
	//Variables and constants declarations
	int HTTPS_PORT = 8443;
	int n=0;
	boolean found = false;
	
	String rec_id = null,yy="",mon="", serverparams= "",agt_id ="", phoneNum="";
	String record_filename ="", is_encrypted="0", call_time="",servletUrl="";
	String rpath="", path="",filePath="",file="",tmpPath="",subdir="";
	String serverHost = "", serverSecurePort="", encmeth="", protocol="http";
	String userRole = "", userDbid="", mnt_dir="mnt" ;
	String notfound_reason="";
	
	//Get the request parameters
	rec_id = request.getParameter("record_id");
	filePath = request.getParameter("path");
	agt_id = request.getParameter("agt");
	phoneNum = request.getParameter("phone");
	record_filename =  request.getParameter("file");
	//serverparams   =  request.getParameter("encparams");
	servletUrl = request.getParameter("servletpath");
	is_encrypted = request.getParameter("encval");
	serverHost = request.getParameter("encServerHost");
	serverSecurePort = request.getParameter("encServerPort");
	encmeth = request.getParameter("encmeth");
	protocol = request.getParameter("proto");
	userDbid = request.getParameter("userDbid");
	// userRole = request.getParameter("userRole");
	
	//If we have an absolute path, first remove everything until 'aheevaccs/'
	if(filePath != null && filePath.charAt(filePath.length()-1) != '/')
		filePath = filePath + "/";
	
	//Get the last 2 directories from the path name ==> the path under the mount directory
	int pIndex = -1;
	String temp_dir = "";
	if(filePath != null)
		pIndex=filePath.lastIndexOf("/");
	else
		notfound_reason = pageData.getWord("The file path is null ! Please check data in your database");
	
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

	//where to find ctiSocket.properties
	rpath = getServletContext().getRealPath("/WEB-INF/"); 
	
	// Get the audio server directory from a properties files
	while(!found && path != null && filePath != null)
	{
		String varToSearch = "recDir"+Integer.toString(n);
		try
		{
			Properties properties = new Properties();
			properties.load(new FileInputStream(rpath+"/ctiSocket.properties"));
			path = properties.getProperty(varToSearch);
		} 
		catch(Exception e) 
		{
			e.printStackTrace();
			break;
		}
		
		// Lookup for the audio file name on the server
		System.out.println("Ressource dir is:"+rpath+". Looking up the filename on audio server in dir.."+varToSearch+"="+path+"..file to search "+filePath+record_filename+"]");
		
		if( path == null || path.length() == 0 || path.compareToIgnoreCase("null")==0)
		{
			System.out.println("Value of path is : null ");
			if(n == 0)
			{
				System.out.println("No search path is specified in file ctiSocket.properties. Please set at least one.");				  
				notfound_reason = pageData.getWord("No search path specified in ctiSocket.properties");
			}
			break;
		} 
		else
		{
			pIndex = path.indexOf("aheevaccs/");
			mnt_dir = path.substring(pIndex+10);
		}
		
		String command = "find "+ path.trim() +"/"+ filePath+" -name *"+record_filename+"*";
		System.out.println(command);
		try
		{
			//String[] cmdArg = {command, "-print"};
			Runtime rt = Runtime.getRuntime();
			Process child = rt.exec(command);
			DataInputStream ls_in = new DataInputStream(child.getInputStream());
			String ls_str="";
			//ls_str = ls_in.readLine();
			while((ls_str = ls_in.readLine()) != null)
			{
				// outFile.write(ls_str+"\r\n");
				if(ls_str.length()>0)
				tmpPath += ls_str;
			}
			if( tmpPath.length() > 0)
			{
				found = true;
				break;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		n++;
	} //end of while
	// if found, play it
	
	if(found)
		System.out.println("File found: "+ filePath + record_filename + " encrypted = " +is_encrypted);
	else 
		System.out.println("File NOT FOUND : "+ filePath + record_filename);
	
	//If the record was not encrypted
	if(is_encrypted.compareTo("0") == 0 || found==false)
	{
		%>
		<script>
			submitInfo('<%= mnt_dir+"/"+filePath+record_filename%>','<%=Boolean.toString(found)%>','<%=userDbid%>','<%=rec_id%>','<%=is_encrypted%>','<%=notfound_reason%>');
		</script>
		<%  
	}
	else
	{ //The record is encrypted, is_encrypted=1
		if(serverHost== null || serverSecurePort==null)
		{// || serverHost.length() < 7 || serverSecurePort.length() < 1) { // min IP: 0.0.0.1, len=7
			%>
			<script >
				alert(MultiArray["Invalide Encryption Server Host IP or Port ! Please, check Encryption Server settings.."][lang]);
				submitInfo('<%=mnt_dir+"/"+filePath+record_filename%>', '<%=Boolean.toString(found)%>','<%=userDbid%>','<%=rec_id%>','<%=is_encrypted%>','');
			</script>
			<%
		}
		else if(servletUrl.length() < 1 )
		{
			%>
			<script >
				alert(MultiArray["Invalide Servlet URL ! Please, check Encryption Server settings.."][lang]);
				submitInfo('<%=mnt_dir+"/"+filePath+record_filename%>', '<%=Boolean.toString(found)%>','<%=userDbid%>','<%=rec_id%>','<%=is_encrypted%>','');
			</script>
			<%
		}
		else
		{
			try
			{
				byte [] mbuf = null ;
				String filetodecrypt = path.trim()+"/"+ filePath + record_filename;
				System.out.println( "\n Filetodecrypt= "+ filetodecrypt );
				int port ;
				if(serverSecurePort.length() < 1)
				port = HTTPS_PORT;
				else
				port = Integer.parseInt(serverSecurePort) ;
				
				/////////For test purpose///////////////
				//port = 8443;  //8467
				//serverHost = "192.168.26.100";
				//protocol = "https"; //http
				//servletUrl ="/encryptor/encryptor";
				////////////////////////////////////////
				
				if( servletUrl.length() > 0 && serverHost.length() > 4 ) 
				{
					System.out.println( "Protocol = ["+protocol+"]  Host = ["+ serverHost +"]  Port = ["+Integer.toString(port)+"] Encryption URL =  ["+ servletUrl + "] File to decrypt = ["+filetodecrypt + "] Encmethod = [" + encmeth + "]");
					if(servletUrl.charAt(0) != '/')
						servletUrl = "/"+servletUrl;
					
					//Do not verify the hostname after SSL connection with the server
					javax.net.ssl.HostnameVerifier hv = new javax.net.ssl.HostnameVerifier()
					{
						public boolean verify(String urlHostName, javax.net.ssl.SSLSession session)
						{
							System.out.println("Warning: URL Host:" + urlHostName + " vs. " + session.getPeerHost());
							return true;
						}
					};
					javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(hv);
					
					//Construct an URL connection
					URL dataURL = new java.net.URL(protocol, serverHost, port, servletUrl);
					File binaryFile = new File(filetodecrypt);
					
					System.out.println("\n"+ dataURL.toString());
					
					ClientHttpRequest myclient = new ClientHttpRequest(dataURL);
					
					//System.out.println( "\n Trying to open file, path= "+ binaryFile.getAbsolutePath()+" name="+ binaryFile.getName() );
					InputStream serverInput = myclient.post( new Object[] { "action", "decrypt", "cryptoMethod", encmeth,"data", new File(filetodecrypt) });
					int totavailable= serverInput.available();
					
					response.setContentType("application/binary");
					response.setHeader("Content-disposition", "attachment; filename=\"" + record_filename + "\"");
					//response.setContentLength(myclient.contentlen);
					
					int  totreceived = 0;
					// byte [] ret = new byte [5*1000*1000]; int length=0, nb=0;
					OutputStream outStr = null;
					outStr = new BufferedOutputStream( response.getOutputStream());
					int c;
					
					if(totavailable > 0 && outStr != null)
					{
						//mbuf = new byte[5000];
						//while ((length = serverInput.read(mbuf)) != -1) {
						while( ( c=serverInput.read() ) != -1 ) 
						{
							outStr.write( c );
							totreceived += 1;
						}
					}
					
					if( serverInput != null ) try { serverInput.close(); } catch( Exception e ) { e.printStackTrace();}
					if( outStr != null ) try { outStr.close(); } catch( Exception e ) {e.printStackTrace();}
					serverInput = null;
					outStr = null;
				} //fin du if
			}
			catch (IOException io_excp) 
			{
				String msg =   " - Error: " + io_excp;
				System.err.println(msg);
				io_excp.printStackTrace();
				%>
				<script >
				alert(MultiArray["Error occured ! Please check tomcat log file for details"][lang]);
				submitInfo('<% out.write(mnt_dir+"/"+filePath+record_filename);%>', '<%out.write(Boolean.toString(found));%>','<%out.write(userDbid);%>','<%out.write(rec_id);%>','<%out.write(is_encrypted);%>','');
				</script>
				<%
			} 
			catch(Exception e)  
			{
				e.printStackTrace();
				%>
				<script>
				alert(MultiArray["Error occured ! Please check tomcat log file for details"][lang]);
				submitInfo('<% out.write(mnt_dir+"/"+filePath+record_filename);%>', '<%out.write(Boolean.toString(found));%>','<%out.write(userDbid);%>','<%out.write(rec_id);%>','<%out.write(is_encrypted);%>','');
				</script>
				<%
			}
		}
	} //End of record decryption section
%>
	
	
