package commander;

import java.io.*;
import java.net.*;
import java.security.*;
import java.io.*;
import java.net.*;
import java.util.*;

public class AhPhoneSocketReceiver implements Runnable {
	private Socket client;
	private String line, input;
	BufferedReader m_in;
	PrintWriter out;
	Interface applet = null;
	boolean m_fGotConnection = true;
	boolean DEBUG = false;
	private boolean validLogout;

	public AhPhoneSocketReceiver(Socket server, Interface pApplet) {

		System.out.println("New client connected to address ["
				+ server.toString() + "]");
		this.client = server;
		applet = pApplet;
		applet.killThreadCTI = true;
		try {

			client.setReceiveBufferSize(50 * 1024);
			m_in = new BufferedReader(new InputStreamReader(client
					.getInputStream()));
			;
			out = new PrintWriter(client.getOutputStream(), true);

		} catch (IOException ee) {
			if (DEBUG) {
				System.out
						.println("Error in creating Buffered Reader (in) or PrinterWriter (out)");
				ee.printStackTrace();
			}
		}

	}

	public void run() {

		String inputLine = "";
		boolean fGotAllData = true;
		String leftOver = "";
		int nPos, k;
		int running = 1;
		m_fGotConnection = true;
		applet.ahPhoneClient = this;
		applet.connectionNbr++;
		input = "";
		// String cmd;
		// cmd = "parent.ahPhone_client_connected()";
		// applet.callJSObject(cmd);
		String cmd = "";
		cmd = "parent.sendAuthenticationtoAhPhone()";
		applet.callJSObject(cmd);
		validLogout = false;
		while (applet.killThreadAhPhone == false) {

			try {

				char[] buf = new char[50 * 1024];
				int recv = m_in.read(buf);

				if (recv != -1) {
					if (fGotAllData == true) {
						inputLine = new String(buf);
						inputLine = inputLine.substring(0, recv);
					} else {
						// We got the second part of the last input data...
						String newLine = new String(buf);
						newLine = newLine.substring(0, recv);
						inputLine = inputLine.concat(newLine);
						System.out.println("inputLine: " + inputLine);
					}

					nPos = inputLine.lastIndexOf("~");
					if (nPos != inputLine.length() - 1) {
						if (DEBUG)
							System.out
									.println("Received a message not terminated");
						fGotAllData = false;
					} else {

						// leftOver = "";
						fGotAllData = true;
					}
					// We received data .. now parse it
					if (inputLine.indexOf("~") != -1 && (fGotAllData == true)) {

						StringTokenizer tok = new StringTokenizer(inputLine,
								"~");
						int cnt = tok.countTokens();
						String data = "";

						for (k = 0; k < cnt; k++) {
							data = tok.nextToken();
							if (data
									.compareTo("<MSG_TYPE_PHONE_STATUS>LOGGED OUT</MSG_TYPE_PHONE_STATUS>") == 0) {
								validLogout = true;
							} else if (data
									.compareTo("<MSG_TYPE_PHONE_STATUS>IN CALL</MSG_TYPE_PHONE_STATUS>") == 0) {
								applet
										.callJSObject("parent.startParser('<DATA src = \"ahphone\"><MSG_TYPE_TICKER></MSG_TYPE_TICKER></DATA>')");
							}
							data = "<DATA src = \"ahphone\">" + data
									+ "</DATA>";
							cmd = "parent.startParser('" + data + "')";
							applet.callJSObject(cmd);

						}
					}
				} else {
					System.out.println("Remote stream closeddd");
					applet.CloseAheevaccsConnection();
					m_in.close();
					client.close();

					break;
				}
			} catch (IOException ee) {
				if (DEBUG) {
					System.out
							.println("IOException : Error on AheevaPhone socket ");
					ee.printStackTrace();
				}
				break;
			}
		}
		// applet.connectionNbr --;
		try {
			m_in.close();
			client.close();
		} catch (IOException ee) {
			if (DEBUG) {
				System.out.println("Error on socket...reinialiaze ourself");
				ee.printStackTrace();
			}
			cmd = "parent.initAppletState()";
			applet.callJSObject(cmd);

		}
		System.out.println("AhPhone socket Client closed");
		cmd = "parent.initAppletState()";
		applet.callJSObject(cmd);
		if (!validLogout) {
			String msg = "Connection to asterisk lost";
			System.out.println(msg);
			applet
					.callJSObject("parent.startParser('<DATA src = \"ahphone\"><MSG_TYPE_TICKER>Connection to asterisk lost</MSG_TYPE_TICKER></DATA>')");
		}
	}

	public void sendNotificationtoAhPhone(String input) {
		if (m_fGotConnection == true) {
			out.print(input + "~");
			out.flush();
			System.out.println("MSG sent [" + input + "]");
		}
	}

}
