package commander;

import java.lang.reflect.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.regex.*;

public class CommAheevaccs {
	private String m_configHost = "";
	int running = 1;
	PrintWriter out = null;
	int timeout_sec = 0;
	Runnable runnable = null;
	Thread thread = null;
	Interface applet = null;
	BufferedReader in = null;
	Socket s_AheevaccsSocket = null;
	boolean m_fGotConnection = false;

	public CommAheevaccs(Interface pApplet) {
		applet = pApplet;
		ProxySelector.setDefault(null);
	}

	public void openSocket(String ip) {

		try {
			applet.log("Trying to open socket with : " + ip);
			String cmd = "";
			String data = "";
			data = "Connecting to AheevaCCS";
			applet.log(data);
			data = "<DATA src = \"aheevaccs\"><MSG_TYPE_CONNECTION>" + data
					+ "</MSG_TYPE_CONNECTION></DATA>";
			cmd = "parent.startParser('" + data + "')";
			applet.callJSObject(cmd);
			s_AheevaccsSocket = new Socket(InetAddress.getByName(ip), Integer
					.parseInt(applet.s_aheevaccs_tcp_port));
			m_fGotConnection = true;
			applet.log("Connection sucessfull to AheevaCCS[" + ip + "]");

		} catch (Exception e) {
			m_fGotConnection = false;
			applet.CloseAheevaccsConnection();
			applet.log("Don't know about host: " + ip);
		}

		if (m_fGotConnection) {
			try {

				s_AheevaccsSocket.setReceiveBufferSize(50 * 1024);
				s_AheevaccsSocket.setSoTimeout(20000);
				out = new PrintWriter(s_AheevaccsSocket.getOutputStream(), true);
				in = new BufferedReader(new InputStreamReader(s_AheevaccsSocket
						.getInputStream()));

			} catch (IOException e) {
				m_fGotConnection = false;
				// closeSocket();
				applet.CloseAheevaccsConnection();
			}
			// start a new thread for receive info
			runnable = new SocketReceiver(in, applet);
			// Create the thread supplying it with the runnable object
			thread = new Thread(runnable);
			// Start the thread
			thread.start();

			/*
			 * // Create the thread for the HeartBeat with AheevaCCS Runnable
			 * runnableHeartBeat = new HeartBeatSender(this, applet); Thread
			 * thread1 = new Thread(runnableHeartBeat); thread1.start();
			 */

		}
	}

	public void sendNotificationtoCti(String input) {
		if (m_fGotConnection == true) {
			out.print(input + "~");
			out.flush();
			applet.log("AheevaCCS : MSG sent [" + input + "]");
		}
	}

	public void closeSocket() {
		timeout_sec = 0;
		applet.log("close socket");
		try {
			if (s_AheevaccsSocket != null) {
				in.close();
				out.close();
				s_AheevaccsSocket.close();
				m_fGotConnection = false;
				// applet.connectingtoCTI = false;
				// applet.killThreadCTI = true;
				running = 0;
			}
		} catch (IOException e) {
			applet.log("Couldn't create image: badly specified URL");
		}

	}

}