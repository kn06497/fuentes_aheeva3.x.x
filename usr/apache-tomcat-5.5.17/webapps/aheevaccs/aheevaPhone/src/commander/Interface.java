package commander;

import java.awt.*;
import java.net.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.*; //import netscape.javascript.JSObject;
import java.lang.reflect.*;
import java.lang.Thread;
import java.io.*;

public class Interface extends Applet {
	private boolean isStandalone = false;
	Vector v_dialedNumberList = new Vector();
	AhPhoneSocketReceiver ahPhoneClient = null;
	connectToCTI conn_cti = null;
	connectToAhPhone conn_ahphone = null;
	Thread t_getswitch = null;
	CommAheevaccs com_aheevaCCS = null;
	CommAhPhone com_AhPhone = null;
	Thread t_connectoAhPhone = null;

	boolean DEBUG = false;

	String s_aheevaccsip = "";
	String s_aheevaccs_tcp_port = "";
	String s_commander_server_tcp_port = "";
	String s_AhPhone_tcp_port = "";
	String s_AhPhoneip = "";

	String s_dialedString = "";

	boolean CommServerKill = false;
	boolean connectingtoCTI = false;
	boolean connectingtoAhPhone = false;

	boolean killThreadCTI = false;
	boolean killThreadAhPhone = false;
	boolean ThreadKill = false;

	int connectionNbr = 0;

	public Interface() {

	}

	/* Initialize the applet */
	public void init() {
	}

	public void start() {
		String hostNameStr = "hostName";
		String ipStr = "x.x.x.x";

		try {
			String str = "";
			str = getParameter("serverPort");

			if (str.compareTo("") == 0) {
				log("No ahCommander server port entered in the applet using 8765 as default");
				s_commander_server_tcp_port = "8765";
			} else {
				s_commander_server_tcp_port = str;
				log("Parameter for serverPort : " + s_commander_server_tcp_port);
			}

			try {
				java.net.InetAddress localMachine = java.net.InetAddress
						.getLocalHost();
				hostNameStr = localMachine.getHostName();
				ipStr = localMachine.getHostAddress();

				System.out.println("IP of local machine:[" + ipStr
						+ "] hostname:[" + hostNameStr + "]");
			} catch (java.net.UnknownHostException uhe) {
				// handle exception
			}

			com_aheevaCCS = new CommAheevaccs(this);
			com_AhPhone = new CommAhPhone(this);
		} catch (Exception e) {
			if (DEBUG)
				e.printStackTrace();
		}

		s_aheevaccs_tcp_port = "";
		s_aheevaccsip = "";

		String cmd = "parent.startAppletState()";
		callJSObject(cmd);
		String data = "<DATA src = \"ahphone\" ip=\"" + ipStr
				+ "\" hostname=\"" + hostNameStr + "\">";
		cmd = "parent.startParser('" + data + "')";
		callJSObject(cmd);

		CommServerKill = false;
		// CommServer server = new CommServer(this);
		// Thread t_server = new Thread(server);
		// t_server.start();
	}

	public void stop() {
		log("Applet Stopping , killing all processes");

		CommServerKill = true;
		ThreadKill = true;

		/* Applet closing disabling all buttons */
		String cmd = "";
		cmd = "parent.stopAppletState()";
		callJSObject(cmd);
	}

	/* Return applet buttons to there initial state */
	public void initAppletState() {
		s_aheevaccs_tcp_port = "";
		s_aheevaccsip = "";
		s_commander_server_tcp_port = "";
		log("Initialize AhCommander buttons");
		String cmd = "";
		cmd = "parent.initAppletState()";
		callJSObject(cmd);
	}

	public void log(String txt) {
		System.out.println(txt);
	}

	/* Sending via socket data to Aheeva AhPhone application */
	public void sendToAhPhone(String str) {
		if (this.ahPhoneClient == null) {
			if (DEBUG)
				log("No client connected, cant send msg [" + str + "]");
		} else {
			// if(DEBUG)
			log("Sending to AhPhone [" + str + "]");
			try {
				this.ahPhoneClient.sendNotificationtoAhPhone(str);
			} catch (Exception e) {
				if (DEBUG)
					e.printStackTrace();
			}
		}
	}

	/* Sending via socket data to AheevaCCS application */
	public void sendToAheevaccs(String str) {
		if (com_aheevaCCS == null)
			log("Not connected to AheevaCCS, cant send msg [" + str + "]");
		else
			com_aheevaCCS.sendNotificationtoCti(str);
	}

	public void addNumberToDialList(String str) {
		if (DEBUG)
			log("Adding number [" + str + "] to dial list");
		v_dialedNumberList.addElement(s_dialedString);
	}

	public void setDialString(String str) {
		String cmd = "";
		cmd = "parent.updateDialString('" + str + "')";
		callJSObject(cmd);
	}

	public void InitConnection(String ccs_ip, String ccs_port,
			String server_port) {
		if (ccs_ip.compareTo("") == 0) {
			log("Aheeva CCS is empty, exiting");
			return;
		}

		if (ccs_port.compareTo("") == 0) {
			log("Aheeva CCS port is empty, exiting");
			return;
		}

		if (server_port.compareTo("") == 0) {
			log("Commander server port is empty, exiting");
			return;
		}

		s_aheevaccs_tcp_port = ccs_port;
		s_aheevaccsip = ccs_ip;
		s_commander_server_tcp_port = server_port;

		/* Putting flag to false so that the thread may live */
		ThreadKill = false;
		killThreadCTI = false;

		conn_cti = new connectToCTI(com_aheevaCCS, this);
		t_getswitch = new Thread(conn_cti);
		t_getswitch.start();

	}

	public void InitAhPhoneConnection(String switch_ip, String switch_port) {
		if (switch_ip.compareTo("") == 0) {
			log("Aheeva CCS is empty, exiting");
			return;
		}

		if (switch_port.compareTo("") == 0) {
			log("Aheeva CCS port is empty, exiting");
			return;
		}

		s_AhPhone_tcp_port = switch_port;
		s_AhPhoneip = switch_ip;

		/* Putting flag to false so that the thread may live */
		ThreadKill = false;
		killThreadAhPhone = false;

		conn_ahphone = new connectToAhPhone(com_AhPhone, this);
		t_connectoAhPhone = new Thread(conn_ahphone);
		t_connectoAhPhone.start();

	}

	public void CloseAheevaPhoneConnection() {
		log("CloseAhPhoneConnection");
		killThreadAhPhone = true;
		com_AhPhone.closeSocket();
		initAppletState();

	}

	public void CloseAheevaccsConnection() {
		log("CloseAheevaccsConnection");
		killThreadCTI = true;
		if (conn_cti.ConnectedtoCTI == true)
			com_aheevaCCS.closeSocket();
		// initAppletState();

	}

	/* Call JS Object */
	public void callJSObject(String cmd) {
		log(cmd);
		String jscmd = cmd; /* JavaScript command */
		String jsresult = null;
		boolean success = false;
		//loop in case the objects are not all ready (bugs frequently with hardphone mode)
		int maxRetry = 5;
		int retryCount;
		for(retryCount = 1; retryCount <= maxRetry; ++ retryCount){
			
			try {
				Method getw = null, eval = null;
				Object jswin = null;
				Class c = Class.forName("netscape.javascript.JSObject");
				Method ms[] = c.getMethods();
				for (int i = 0; i < ms.length; i++) {
					if (ms[i].getName().compareTo("getWindow") == 0){
						getw = ms[i];
					}else if (ms[i].getName().compareTo("eval") == 0){
						eval = ms[i];
					}
				}
				
				Object a[] = new Object[1];
				a[0] = this; /* this is the applet */
				try {
					jswin = getw.invoke(c, a); /* this yields the JSObject */
				} catch (InvocationTargetException ite) {
					ite.printStackTrace();
				}
				a[0] = jscmd;
				Object result = eval.invoke(jswin, a);
				break;
			} catch (InvocationTargetException ite) {
				if(!printRetry(retryCount, maxRetry)){
					ite.printStackTrace();
				}
	
			} catch (Exception e) {
				if(!printRetry(retryCount, maxRetry)){
					e.printStackTrace();
				}
			}
		}
		if(retryCount > maxRetry){
			System.out.println("ERROR - Interface.callJSObject - Invocation attempt [" + retryCount+ "] failed. Abording.");
		}
	}
	
	private static boolean printRetry(int retryCount, int maxRetry){
		if(retryCount < maxRetry){
			System.out.println("ERROR - Interface.callJSObject - Invocation attempt [" + retryCount+ "] failed.");
			try {
				Thread.currentThread().sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			return true;
		}
		return false;
	}

}
