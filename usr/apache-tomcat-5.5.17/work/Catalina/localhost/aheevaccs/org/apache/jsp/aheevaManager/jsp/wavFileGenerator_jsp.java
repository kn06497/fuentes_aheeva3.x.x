package org.apache.jsp.aheevaManager.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.text.*;
import java.util.*;
import java.net.*;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSession;
import aheevaManager.reports.*;
import aheevaManager.ressources.*;

public final class wavFileGenerator_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write(" \n");
      out.write("<title> Conversation Recording</title>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(" \n");
      out.write("\n");
      aheevaManager.reports.beanConversationRecord beanRecord = null;
      synchronized (request) {
        beanRecord = (aheevaManager.reports.beanConversationRecord) _jspx_page_context.getAttribute("beanRecord", PageContext.REQUEST_SCOPE);
        if (beanRecord == null){
          beanRecord = new aheevaManager.reports.beanConversationRecord();
          _jspx_page_context.setAttribute("beanRecord", beanRecord, PageContext.REQUEST_SCOPE);
        }
      }
      out.write(" <!--beanConversationRecord-->\n");
      out.write("\n");

	beanManagerData wavData = new beanManagerData();
	wavData.openConnection();
	if( session.getAttribute("USER_LANGUAGE") != null )
		wavData.setDefaultLanguage( (String)session.getAttribute("USER_LANGUAGE") );

      out.write("\n");
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" src=\"../Resources_pages/jsUtil.js\"></script>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("var lang =normalizeString(QueryString('lang'));\n");
      out.write("</script>\n");
      out.write("<script >\n");
      out.write("function submitInfo()\n");
      out.write("{\n");
      out.write("\tvar record_file = submitInfo.arguments[0];\n");
      out.write("\tvar has_found = submitInfo.arguments[1];\n");
      out.write("\tvar enc = submitInfo.arguments[4];\n");
      out.write("\tvar reason = submitInfo.arguments[5];\n");
      out.write("\t//alert('../../'+record_file+'...'+submitInfo.arguments[1]+'...'+submitInfo.arguments[2]+'...'+submitInfo.arguments[3]+'...'+enc)\n");
      out.write("\tif(has_found == 'true' && enc == '0') {\n");
      out.write("\t\tjavascript:window.open('../../'+record_file,'formWindow');//,'scrollbars=yes',width=800,height=500\n");
      out.write("\t}\n");
      out.write("\telse\n");
      out.write("\t{\n");
      out.write("\t\tif(has_found == 'false' )\n");
      out.write("\t\t{ // The record is not found on the server..\n");
      out.write("\t\t\tif(reason.length > 1 )\n");
      out.write("\t\t\t{\n");
      out.write("\t\t\t\talert(reason);\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\telse\n");
      out.write("\t\t\t{\n");
      out.write("\t\t\t\t");

				
				String errormsg_beg = wavData.getWord("Could not find the record");
				String errormsg_end = wavData.getWord("on disk. Please verify that the recording is still on disk at the right place!");
				errormsg_end += wavData.getWord("Check also that the mount service is working properly");
				errormsg_end += wavData.getWord("if a directory has been mounted for recordings.");
				out.write("alert(\""+errormsg_beg+" \" +record_file+ \" "+errormsg_end+"\");");
				
      out.write("\n");
      out.write("\t\t\t}\n");
      out.write("\t\t}\n");
      out.write("\t\n");
      out.write("\t\tvar user = submitInfo.arguments[2];\n");
      out.write("\t\tvar rec = submitInfo.arguments[3];\n");
      out.write("\t\t\n");
      out.write("\t\tif( window.top.comm.myApplet)\n");
      out.write("\t\t\tvar sret = window.top.comm.myApplet.deleteRecListenMessage(user,rec);\n");
      out.write("\t}\n");
      out.write("\treturn true;\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write(" \n");

	//Variables and constants declarations
	int HTTPS_PORT = 8443;
	int n=0;
	boolean found = false;
	
	String rec_id = null, serverparams= "", agt_id ="", phoneNum="";
	String record_filename ="", is_encrypted="0", call_time="", servletUrl="";
	String tomcat_dir="", path="", filePath="", file="",tmpPath="",subdir="";
	String serverHost = "", serverSecurePort="", encmeth="", protocol="http";
	String userRole = "", userDbid="", mnt_dir="mnt", tomcat_url="", tomcat_path="";
	String notfound_reason="", newFilePath="";
	String embeded = "0";
	//Get the request parameters
	rec_id = request.getParameter("record_id");
	filePath = request.getParameter("path");
	record_filename =  request.getParameter("file");	
	servletUrl = request.getParameter("servletpath");
	is_encrypted = request.getParameter("encval");
	serverHost = request.getParameter("encServerHost");
	serverSecurePort = request.getParameter("encServerPort");
	encmeth = request.getParameter("encmeth");
	protocol = request.getParameter("proto");
	userDbid = request.getParameter("userDbid");
	tomcat_url = request.getParameter("tomcaturl");
	tomcat_path = request.getParameter("tomcatpath");
	embeded = (request.getParameter("embeded")==null)?"0":request.getParameter("embeded");
	
	//If we have an absolute path, first remove everything until 'aheevaccs/'
	if(filePath != null && filePath.charAt(filePath.length()-1) != '/')
		filePath = filePath + "/";
		
	if(tomcat_url != null && tomcat_url.charAt(tomcat_url.length()-1) != '/')
		tomcat_url = tomcat_url + "/";

	//Get the last 2 directories from the path name ==> the path under the mount directory
	int pIndex = -1;
	String temp_dir = "";
	if(filePath != null)
		pIndex=filePath.lastIndexOf("/");
	else
		notfound_reason = wavData.getWord("The file path is null ! Please check data in your database");
	
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
		
	System.out.println("\nFilePath="+filePath) ;

	
	
	//look at the path
	String rpath = getServletContext().getRealPath("/WEB-INF/"); 
	String varToSearch = "WEB-INF";
	System.out.println("Ressource dir is:"+rpath );	
	
	if(rpath != null && rpath.length() >0)	{	
		pIndex=rpath.indexOf("WEB-INF");
		if(pIndex > -1) 
		{	//Get the last dir position
			tomcat_dir = rpath.substring(0,pIndex);
		}		
	}
	
	// Lookup for the audio file name on the server
	String mount_dir = tomcat_url;		
	if( tomcat_dir.length() > 0 )
	{		
		newFilePath = tomcat_dir+mount_dir+filePath+record_filename  ;
		File filetoOpen = new File(newFilePath);
		if(filetoOpen.exists())
			found = true;			
		System.out.println("\nTomcat dir is: "+tomcat_dir+" Mount dir="+mount_dir+" File="+newFilePath );	
	}
		
	if(found)
		System.out.println("File found: "+ newFilePath + " , encrypted = " +is_encrypted);
	else 
		System.out.println("File NOT FOUND : "+ newFilePath);
	
	//If the record was not encrypted
	if(is_encrypted.compareTo("0") == 0 || found==false)
	{
		
		if (embeded.compareTo("0")==0)
		{	
		
      out.write("\n");
      out.write("\t\t<script>\n");
      out.write("\t\t\tsubmitInfo('");
      out.print( mount_dir+filePath+record_filename);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(Boolean.toString(found));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(userDbid);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rec_id);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(is_encrypted);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(notfound_reason);
      out.write("');\n");
      out.write("\t\t</script>\n");
      out.write("\t\t");

		}
		else
		{
			
      out.write("\n");
      out.write("\t\t\t<OBJECT id=\"AUDIO\" width=\"320\" height=\"45\" \n");
      out.write("\t\t\t\tstyle=\"position:absolute; left:0;top:0;\"\n");
      out.write("\t\t\t\tCLASSID=\"CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6\"\n");
      out.write("\t\t\t\ttype=\"application/x-oleobject\">\n");
      out.write("\t\t\t\t<PARAM NAME=\"URL\" VALUE=\"../../");
      out.print( mount_dir+filePath+record_filename);
      out.write("\">\n");
      out.write("\t\t\t\t<PARAM NAME=\"SendPlayStateChangeEvents\" VALUE=\"True\">\n");
      out.write("\t\t\t\t<PARAM NAME=\"AutoStart\" VALUE=\"False\">\n");
      out.write("\t\t\t\t<PARAM name=\"uiMode\" value=\"full\">\n");
      out.write("\t\t\t\t<PARAM name=\"PlayCount\" value=\"1\">\n");
      out.write("\t\t\t\t<param name=\"windowlessVideo\" value=\"true\">\n");
      out.write("\t\t\t</OBJECT>\n");
      out.write("\t\t\t");
  
		}
		
		
	}
	else
	{ //The record is encrypted, is_encrypted=1
		if(serverHost== null || serverSecurePort==null)
		{// || serverHost.length() < 7 || serverSecurePort.length() < 1) { // min IP: 0.0.0.1, len=7
			
      out.write("\n");
      out.write("\t\t\t<script >\n");
      out.write("\t\t\t\talert(\"");
      out.print( wavData.getWord("Invalid Encryption Server Host IP or Port ! Please, check Encryption Server settings.."));
      out.write("\");\n");
      out.write("\t\t\t\tsubmitInfo('");
      out.print(mount_dir+filePath+record_filename);
      out.write("', '");
      out.print(Boolean.toString(found));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(userDbid);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rec_id);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(is_encrypted);
      out.write("','');\n");
      out.write("\t\t\t</script>\n");
      out.write("\t\t\t");

		}
		else if(servletUrl.length() < 1 )
		{
			
      out.write("\n");
      out.write("\t\t\t<script >\n");
      out.write("\t\t\t\talert(\"");
      out.print( wavData.getWord("Invalid Servlet URL ! Please, check Encryption Server settings.."));
      out.write("\");\n");
      out.write("\t\t\t\tsubmitInfo('");
      out.print(mount_dir+filePath+record_filename);
      out.write("', '");
      out.print(Boolean.toString(found));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(userDbid);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rec_id);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(is_encrypted);
      out.write("','');\n");
      out.write("\t\t\t</script>\n");
      out.write("\t\t\t");

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
				
      out.write("\n");
      out.write("\t\t\t\t<script >\n");
      out.write("\t\t\t\talert(\"");
      out.print( wavData.getWord("Error occured ! Please check tomcat log file for details"));
      out.write("\");\n");
      out.write("\t\t\t\tsubmitInfo('");
 out.write(mount_dir+filePath+record_filename);
      out.write("', '");
out.write(Boolean.toString(found));
      out.write('\'');
      out.write(',');
      out.write('\'');
out.write(userDbid);
      out.write('\'');
      out.write(',');
      out.write('\'');
out.write(rec_id);
      out.write('\'');
      out.write(',');
      out.write('\'');
out.write(is_encrypted);
      out.write("','');\n");
      out.write("\t\t\t\t</script>\n");
      out.write("\t\t\t\t");

			} 
			catch(Exception e)  
			{
				e.printStackTrace();
				
      out.write("\n");
      out.write("\t\t\t\t<script>\n");
      out.write("\t\t\t\talert(\"");
      out.print( wavData.getWord("Error occured ! Please check tomcat log file for details"));
      out.write("\");\n");
      out.write("\t\t\t\tsubmitInfo('");
 out.write(mount_dir+filePath+record_filename);
      out.write("', '");
out.write(Boolean.toString(found));
      out.write('\'');
      out.write(',');
      out.write('\'');
out.write(userDbid);
      out.write('\'');
      out.write(',');
      out.write('\'');
out.write(rec_id);
      out.write('\'');
      out.write(',');
      out.write('\'');
out.write(is_encrypted);
      out.write("','');\n");
      out.write("\t\t\t\t</script>\n");
      out.write("\t\t\t\t");

			}
		}
	} //End of record decryption section
	wavData.closeConnection();

      out.write("\n");
      out.write("\t\n");
      out.write("\t\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
