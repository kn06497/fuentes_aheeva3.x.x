package commander;

import java.lang.reflect.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.regex.*;

public class CommAhPhone {
	private String m_configHost = "";
	int running = 1;
	PrintWriter out = null;
	int timeout_sec = 0;
	Runnable runnable = null;
	Thread thread = null;
	Interface applet = null;
	BufferedReader in = null;
	Socket s_AhPhonesocket = null;
	boolean m_fGotConnection = false;

	public CommAhPhone(Interface pApplet) {
		applet = pApplet;
		ProxySelector.setDefault(null);
	}

	public void openSocket(String ip) {

		try {

			s_AhPhonesocket = new Socket(InetAddress.getByName(ip), Integer
					.parseInt(applet.s_AhPhone_tcp_port));
			m_fGotConnection = true;
			applet.log("Connection sucessfull...to " + ip + "["
					+ applet.s_AhPhone_tcp_port + "]");

		} catch (Exception e) {
			m_fGotConnection = false;
			// applet.CloseConnection();
			applet.log("Don't know about host: " + ip);
		}

		if (m_fGotConnection) {
			try {

				this.s_AhPhonesocket.setReceiveBufferSize(50 * 1024);
				this.s_AhPhonesocket.setSoTimeout(20000);
				out = new PrintWriter(s_AhPhonesocket.getOutputStream(), true);
				in = new BufferedReader(new InputStreamReader(s_AhPhonesocket
						.getInputStream()));

			} catch (IOException e) {
				m_fGotConnection = false;
				// closeSocket();
				applet.CloseAheevaccsConnection();
			}
			// start a new thread for receive info
			runnable = new AhPhoneSocketReceiver(s_AhPhonesocket, applet);
			// Create the thread supplying it with the runnable object
			thread = new Thread(runnable);
			// Start the thread
			thread.start();

		}
	}

	public void sendNotificationtoAhPhone(String input) {
		if (m_fGotConnection == true) {
			out.print(input + "~");
			out.flush();
			applet.log("AhPhone : MSG sent [" + input + "]");
		}
	}

	public void closeSocket() {
		timeout_sec = 0;
		applet.log("close socket");
		try {
			if (s_AhPhonesocket != null) {
				in.close();
				out.close();
				s_AhPhonesocket.close();
				m_fGotConnection = false;
				applet.connectingtoCTI = false;
				// applet.killThreadCTI = true;
				running = 0;
			}
		} catch (IOException e) {
			applet.log("Couldn't create image: badly specified URL");
		}

	}

}