<%@page import="aheevaManager.ressources.popbuilder.*"%><%if (request.getParameter("mn").equals("fillFieldOrTableList")) {
		Menu menu = new Menu();
		out.print(menu.getFieldorTableList(request));
	} else if (request.getParameter("mn").equals("testConnection")) {
		DBConnection DBConnection = new DBConnection();
		out.print(DBConnection.getDBConnection(request));
	} else if (request.getParameter("mn").equals("getListPopUps")) {
		Menu menu = new Menu();
		out.print(menu.getPopUpsList(request));
	} else if (request.getParameter("mn").equals("ckeckPopUniqueId")) {
		Menu menu = new Menu();
		out.print(menu.ckeckPopUniqueId(request));
	}else if (request.getParameter("mn").equals("unloadPopup")) {
		UploadDownload.deleteFile(request.getParameter("path"));
	}%>