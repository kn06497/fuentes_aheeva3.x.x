package commander;

import java.security.*;

public class connectToCTI implements Runnable {
	CommAheevaccs m_comm = null;
	Interface applet = null;
	boolean ConnectedtoCTI = false;

	public connectToCTI(CommAheevaccs com, Interface papplet) {
		m_comm = com;
		applet = papplet;
	}

	public void run() {
		applet.connectingtoCTI = true;

		while (!ConnectedtoCTI) {

			if (applet.ThreadKill == true || applet.killThreadCTI == true)
				break;

			AccessController.doPrivileged(new PrivilegedAction() {

				public Object run() {
					m_comm.openSocket(applet.s_aheevaccsip);
					if (!m_comm.m_fGotConnection) {
						String cmd = "";
						String data = "";
						data = "Can\\'t connect to AheevaCCS";
						applet.log(data);
						data = "<DATA src = \"aheevaccs\"><MSG_TYPE_EXCEPTION>"
								+ data + "</MSG_TYPE_EXCEPTION></DATA>";
						cmd = "parent.startParser('" + data + "')";
						applet.callJSObject(cmd);
						try {

							synchronized (this) {
								this.wait(1000);
							}
						} catch (java.lang.InterruptedException ee) {
						}
					} else {
						ConnectedtoCTI = true;
						String cmd = "";
						cmd = "parent.sendAuthenticationtoAheevaccs()";
						applet.callJSObject(cmd);
					}

					return null;
				}
			});

		}
		applet.log("Out of connectToCTI");
		ConnectedtoCTI = false;
		// Todo fix this
		// m_comm.closeSocket();
	}

}