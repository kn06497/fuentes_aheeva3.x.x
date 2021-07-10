package commander;

public class HeartBeatSender implements Runnable {
	CommAheevaccs m_comm = null;
	Interface applet = null;

	public HeartBeatSender(CommAheevaccs com, Interface papplet) {
		m_comm = com;
		applet = papplet;

	}

	public void run() {
		System.out.println("Entering  HeartBeatSender");

		while (applet.ThreadKill == false) {

			if (applet.killThreadCTI == true)
				break;

			try {
				synchronized (this) {
					this.wait(5000);
				}
				if (m_comm.m_fGotConnection == true) {
					m_comm.sendNotificationtoCti("58");
				} else {
					break;
				}
			} catch (InterruptedException e) {
				System.out.println("Error on socket");
			}
		}
		try {
			applet.com_aheevaCCS.s_AheevaccsSocket.close();

		} catch (Exception e) {
			System.out.println("Error closing AheevaCCS Socket");
		}
		System.out.println("Out of HeartBeatSender Thread");
	}

}
