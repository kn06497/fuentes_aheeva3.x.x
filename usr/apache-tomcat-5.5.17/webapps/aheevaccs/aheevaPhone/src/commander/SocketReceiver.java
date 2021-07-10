package commander;

import java.io.*;
import java.net.*;
import java.security.*;
import java.io.*;
import java.net.*;
import java.util.*;

public class SocketReceiver implements Runnable {
	boolean DEBUG = false;
	BufferedReader m_in = null;
	Interface applet = null;

	SocketReceiver(BufferedReader in, Interface pApplet) {
		m_in = in;
		applet = pApplet;

	}

	public void run() {
		String inputLine = "";
		boolean fGotAllData = true;
		String leftOver = "";
		int nPos, k;

		while (applet.ThreadKill == false) {
			try {
				char[] buf = new char[50 * 1024];
				// System.out.println("Before Read");
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

					}

					nPos = inputLine.lastIndexOf("~");
					if (nPos != inputLine.length() - 1) {
						fGotAllData = false;
					} else {
						// leftOver = "";
						fGotAllData = true;
					}
					// We received data .. now parse it
					if (inputLine.indexOf("~") != -1 && (fGotAllData == true)) {
						// fGotAllData = true;
						if (DEBUG)
							applet.log("inputLine: " + inputLine);
						StringTokenizer tok = new StringTokenizer(inputLine,
						"~");
						int cnt = tok.countTokens();
						String data = "";

						for (k = 0; k < cnt; k++) {
							data = tok.nextToken();

							System.out.println("data: " + data);
							data = "<DATA src = \"aheevaccs\">" + data
							+ "</DATA>";
							String cmd = "";
							cmd = "parent.startParser('" + data + "')";
							applet.callJSObject(cmd);
						}
					}
				} else {
					break;
				}
			} catch (IOException ee) {
				System.out.println("Exception on AheevaCCS socket");
				ee.printStackTrace();
				break;
			}
		}
		applet.log("Out of SocketReceiver Thread");
	}
}
