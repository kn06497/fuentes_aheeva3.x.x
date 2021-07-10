<%@page language = "java" %><%@page import ="java.io.*"%><%@page import ="java.text.*"%><%@page import ="java.util.*"%><%@page import ="java.net.*"%><%@page import ="javax.net.ssl.HostnameVerifier"%><%@page import ="javax.net.ssl.HttpsURLConnection"%><%@page import ="javax.net.ssl.SSLSession"%><%@page import ="aheevaManager.reports.*"%><jsp:useBean id="beanRecord" scope="request" class="aheevaManager.reports.beanConversationRecord" /><%@page import ="aheevaManager.ressources.*"%><%
	beanManagerData pageData = new beanManagerData();

	//Variables and constants declarations
	int HTTPS_PORT = 8443;

	//Variables and constants declarations
	String rec_id = null, serverparams= "", agt_id ="", phoneNum="";
	String record_filename ="", is_encrypted="0", call_time="", servletUrl="";
	String tomcat_dir="", path="", filePath="", file="",tmpPath="",subdir="";
	String serverHost = "", serverSecurePort="", encmeth="", protocol="http";
	String mnt_dir="mnt", tomcat_url="", tomcat_path="";
	
	//Get the request parameters
	rec_id = request.getParameter("record_id");
	filePath = request.getParameter("path");
	file =  request.getParameter("file");	
	servletUrl = request.getParameter("servletpath");
	is_encrypted = request.getParameter("encval");
	serverHost = request.getParameter("encServerHost");
	serverSecurePort = request.getParameter("encServerPort");
	encmeth = request.getParameter("encmeth");
	protocol = request.getParameter("proto");
	tomcat_url = request.getParameter("tomcaturl");
	tomcat_path = request.getParameter("tomcatpath");

	filePath += "/" + file;
	System.out.println("File to decrypt: "+filePath) ;
	
	try
	{
		byte [] mbuf = null ;
		String filetodecrypt = filePath;
		int port ;
		if(serverSecurePort.length() < 1)
		port = HTTPS_PORT;
		else
		port = Integer.parseInt(serverSecurePort) ;
		
		if( servletUrl.length() > 0 && serverHost.length() > 4 ) 
		{
			System.out.println( "Protocol = ["+protocol+"]  Host = ["+ serverHost +"]  Port = ["+Integer.toString(port)+"] Encryption URL =  ["+ servletUrl + "] File to decrypt = ["+filetodecrypt + "] Encmethod = [" + encmeth + "]");
			if(servletUrl.charAt(0) != '/')
				servletUrl = "/"+servletUrl;
			
			System.out.println("vefore creating ");
			//Do not verify the hostname after SSL connection with the server
			class Cb implements javax.net.ssl.HostnameVerifier {
				public boolean verify(String urlHostName, javax.net.ssl.SSLSession session)
				{
					System.out.println("Warning: URL Host:" + urlHostName + " vs. " + session.getPeerHost());
					return true;
				}
			};
			Cb bbb = new Cb(); 

			javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(bbb);
			System.out.println(javax.net.ssl.HttpsURLConnection.getDefaultHostnameVerifier());
			
			//Construct an URL connection
			URL dataURL = new java.net.URL(protocol, serverHost, port, servletUrl);
			System.out.println("url set");
			File binaryFile = new File(filetodecrypt);
			
			System.out.println("\n"+ dataURL.toString());
			
			ClientHttpRequest myclient = new ClientHttpRequest(dataURL);
			System.out.println("request");
			
			//System.out.println( "\n Trying to open file, path= "+ binaryFile.getAbsolutePath()+" name="+ binaryFile.getName() );
			InputStream serverInput = myclient.post( new Object[] { "action", "decrypt", "cryptoMethod", encmeth,"data", new File(filetodecrypt) });
			int totavailable= serverInput.available();
			
			String ext = file.substring(file.lastIndexOf('.')+1);
			System.out.println("extension: " + ext);

			// Setting file type
			if (ext.compareTo("swf") == 0)
				response.setContentType("application/x-shockwave-flash");
			else if (ext.compareTo("wav") == 0)
				response.setContentType("audio/wav");
			else if (ext.compareTo("mp3") == 0)
				response.setContentType("audio/mpeg");
			else
				response.setContentType("application/binary");

			response.setHeader("Content-disposition", "attachment; filename=\"" + file + "\"");
			OutputStream OutStrm = response.getOutputStream();

			System.out.println("hum: " + out.getClass());
			//response.setContentLength(myclient.contentlen);
			
			int  totreceived = 0;
			 byte [] buf = new byte [1024];
			int received;
			
			//mbuf = new byte[5000];
			//while ((length = serverInput.read(mbuf)) != -1) {
			out.clearBuffer();
			while( ( received=serverInput.read(buf) ) != -1 ) 
			{
				OutStrm.write(buf, 0, received );
				totreceived += received;
			}
			
			if( serverInput != null ) try { serverInput.close(); } catch( Exception e ) { e.printStackTrace();}
			serverInput = null;
		} //fin du if
	}
	catch (IOException io_excp) 
	{
		String msg =   " - Error: " + io_excp;
		System.err.println(msg);
		io_excp.printStackTrace();
	} 
	catch(Exception e)  
	{
		e.printStackTrace();
	}
%>
