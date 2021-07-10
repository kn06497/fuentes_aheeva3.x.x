package commander;

import java.lang.reflect.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.regex.*;
import java.security.*;

public class connectToAhPhone implements Runnable {
	CommAhPhone m_comm = null;
	Interface applet = null;
	boolean ConnectedtoAhPhone = false;
	Socket s_AhPhonesocket = null;
	int conn_counter = 0;
	boolean m_fGotConnection = false;

	public connectToAhPhone(CommAhPhone com_AhPhone, Interface papplet) {
		applet = papplet;
		m_comm = com_AhPhone;
		conn_counter = 0;

	}

	public void run() {
		applet.connectingtoAhPhone = true;

		while (!ConnectedtoAhPhone && conn_counter < 20) {

			if (applet.ThreadKill == true || applet.killThreadAhPhone == true)
				break;

			AccessController.doPrivileged(new PrivilegedAction() {

				public Object run() {
					m_comm.openSocket(applet.s_AhPhoneip);
					if (!m_comm.m_fGotConnection) {
						conn_counter++;
						applet.log("Can't connect to AheevaCCS");
						try {
							synchronized (this) {
								this.wait(1000);
							}
						} catch (java.lang.InterruptedException ee) {
						}
					} else {
						ConnectedtoAhPhone = true;
						conn_counter = 0;
					}

					return null;
				}
			});

		}
		conn_counter = 0;
		applet.log("Out of connectToAhPhone");
		ConnectedtoAhPhone = false;
		/*
		 * try { m_comm.aheevaccsSocket.close(); } catch(Exception e) {
		 * System.out.println("Error closing AheevaCCS Socket"); }
		 */
	}

}