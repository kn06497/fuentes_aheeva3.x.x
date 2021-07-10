_scrollAmount=5                  // Only Used for Netscape 4 scrolling
_scrollDelay=10	                 // Only Used for Netscape 4 scrolling
_scrollUpImage="../img/uparrow.gif"     // Only Used for Netscape 4 scrolling
_scrollDownImage="../img/downarrow.gif" // Only Used for Netscape 4 scrolling


_menuCloseDelay=50              // The delay for menus to remain visible on mouse off
_menuOpenDelay=15               // The delay for opening menus on mouse over
_subOffsetTop=0;                 // Sub menu offset Top position
_subOffsetLeft=0;                // Sub menu offset Left position
Goverfilter = "Fade(duration=0.2);Shadow(color='#777777', Direction=135, Strength=3)"
Goutfilter = "randomdissolve(duration=0.4)"


with(vertStyle=new mm_style()){
		onbgcolor = "#FEFAD2";
		oncolor = "#000000";
		offbgcolor = "transparent";
		offcolor = "#000000";
		//visitedcolor = "green";
		bordercolor = "#999999";
		borderstyle = "solid";
		separatorcolor = "#999999";
		//separatorsize = 1;
		separatorpadding=1
		separatorwidth="85%"
		separatoralign="right"
		padding = 3
		borderwidth = 1
		onborder="1px solid #999999";
		//overfilter="Blinds(direction='down',bands=1,duration=0.3);Alpha(opacity=95);Shadow(color='#777777', Direction=135, Strength=3)"; 
		//outfilter="Blinds(direction='up',bands=1,duration=0.6)";
		overfilter = "Fade(duration=0.1);Alpha(opacity=95);Shadow(color='#777777', Direction=135, Strength=3)"
		outfilter = "randomdissolve(duration=0.2)"
		fontsize = "100%";
		fontstyle = "normal";
		fontfamily = "arial, tahoma";
		//fontweight="bold"
		//ondecoration="underline"
		pagebgcolor = "#CFE2D1";
		pageimage="../img/db_red.gif";
		pagecolor = "#000066";
		subimage = "../img/black_13x13_greyboxed.gif";
		onsubimage="../img/on_13x13_greyboxed.gif";		
		headercolor = "#000099";
		headerbgcolor = "#AFD1B5";
		headerborder="1px solid #000000";
		menubgimage="../img/backoff_green.gif";
		imagepadding=3;
		image="../img/18_blank.gif";
		menubgcolor="#F5F5F5";
}

horizStyle=new copyOf(vertStyle)
horizStyle.overfilter=""
horizStyle.outfilter=""
horizStyle.borderwidth=1
horizStyle.separatorpadding=0
//horizStyle.onborder="";
horizStyle.separatorcolor = "#999999";
horizStyle.subimage="../img/downboxed.gif";
horizStyle.onsubimage="../img/on_downboxed.gif";
//horizStyle.onbgcolor = "#4F8EB6";
horizStyle.oncolor = "#000000";
horizStyle.offbgcolor = "#CFE2D1";
horizStyle.offcolor = "#000000";
horizStyle.image = "";
horizStyle.overbgimage="../img/backon_beige.gif";
horizStyle.menubgimage="";
horizStyle.menubgcolor=""
//horizStyle.onborder="1px solid #999999";


	with(milonic=new menuname("mainmenu2")){
	top = 15;
	left =132;
	style = horizStyle;
	alwaysvisible = 1;
	orientation="horizontal"
	margin=2;
	
	aI("text="+menu[0]+";showmenu=mm file;");
	aI("text="+menu[1]+";showmenu=mm edit;");
	aI("text="+menu[2]+";showmenu=mm tools;");
	aI("text="+menu[3]+";showmenu=mm help;");
	
	}

	with(milonic=new menuname("mm file"))
	{		
		style = vertStyle;
		top="offset=2"
		margin=3
		aI("text="+menu[4]+";url=javascript:menu_new_script();image=../img/18_new.gif;");
		aI("text="+menu[5]+" ...;url=javascript:menu_new_open();image=../img/open.gif;");
		aI("text="+menu[6]+" ;url=javascript:tryToSaveScript();image=../img/save.gif;");
		aI("text="+menu[7]+"  ...;url=javascript:menu_new_save_as();separatorsize=1");
		aI("text="+menu[8]+";url=javascript:deleteWholeDiagram();image=../img/deleted.gif;separatorsize=1");
		aI("text="+menu[9]+";url=javascript:menu_new_props();");
		aI("text="+menu[10]+" ;url=javascript:menu_new_exit();image=../img/18_exit.gif;");
	}


	with(milonic=new menuname("mm edit"))
	{		
		style = vertStyle;
		top="offset=2"
		margin=3	
		//aI("text="+MultiArray["Undo"][lang]+" ;url=javascript:undoChanges();image=../img/18_undo.gif;");
		//aI("text="+MultiArray["Redo"][lang]+";url=javascript:redoChanges();image=../img/18_redo.gif;");
		aI("text="+menu[11]+";url=javascript:eraseDiagram();image=../img/18_eraser.gif;separatorsize=1");		
		aI("text="+menu[12]+" ;url=javascript:menu_validateWholeSchema();image=../img/18_freelic.gif;separatorsize=1");
		aI("text="+menu[13]+"...;url=javascript:showCallPropsManager();");
		aI("text="+menu[14]+";url=javascript:deleteArrow();image=../img/18_remove_link.gif;separatorsize=1");
		aI("text="+menu[15]+";url=javascript:zoomIn();image=../img/18_stock_zoom_in.gif;");
		aI("text="+menu[16]+";url=javascript:zoomOut();image=../img/18_stock_zoom_out.gif;");
		aI("text="+menu[17]+";url=javascript:fit();image=../img/18_stock_zoom_fit.gif;separatorsize=1");	
	}	

	with(milonic=new menuname("mm tools"))
	{
		style = vertStyle;
		margin=3
		aI("text="+menu[18]+" ;showmenu=mm tools_statements;");
		aI("text="+menu[19]+";showmenu=mm tools_actions;");
		aI("text="+menu[20]+";showmenu=mm tools_statistics;");
	}	

	with(milonic=new menuname("mm help"))
	{
		style = vertStyle;
		top="offset=2"
		margin=3
		aI("text="+menu[21]+";url=javascript:popupHelp();image=../img/18_faq.gif;");			
	}
	
	with(milonic=new menuname("mm tools_actions"))
	{		
		style = vertStyle;
		margin=3
		aI("text="+menu[22]+";url=javascript:addPickMethod();image=../img/18_user_headset.gif");
		aI("text="+menu[23]+" ;url=javascript:addPriorityInc();image=../img/call_up.gif");
		aI("text="+menu[24]+";url=javascript:addPbxExec();image=../img/18_pbx_exec.gif");
		//aI("text=Get DTMF;url=javascript:addGetDigit();image=../img/18_onedigit.gif");
		aI("text="+menu[25]+" ;url=javascript:addGetDigit();image=../img/18_string.gif");
		aI("text="+menu[26]+";url=javascript:addSqlQuery();image=../img/18_product.gif");
		aI("text="+menu[27]+";url=javascript:addCustomServer();image=../img/18_tablecell.gif");
		aI("text="+menu[28]+";url=javascript:addCallEnding();image=../img/18_phone_end.gif");
		aI("text=Link boxes;url=javascript:addLink();image=../img/18_links.gif");
	}	
	
	with(milonic=new menuname("mm tools_statements"))
	{
		alignment="center";
		top="offset=2"
		style = vertStyle;
		margin=3
		aI("text="+menu[29]+";url=javascript:addCallCondition();image=../img/18_if_else.gif");
		aI("text="+menu[30]+";url=javascript:addSwitchCase();image=../img/18_switch_case.gif");
	}
	
	with(milonic=new menuname("mm tools_statistics"))
	{
		alignment="center";
		top="offset=2"
		style = vertStyle;
		margin=3
		aI("text="+menu[31]+";url=javascript:addCounterBox();");
		aI("text="+menu[32]+";url=javascript:addGetStatistic();image=../img/tarte.gif");
	}
	
	
drawMenus();

// Add this bit if you haven't finished building menus yet.
/*clearTimeout(_mst)
_mst=null
_startM=1*/

/*
_menuCloseDelay=0;
_menuOpenDelay=0;
_subOffsetTop=20;
_subOffsetLeft=20;

with(menuStyle=new mm_style()){
bordercolor="#999999";
borderstyle="solid";
borderwidth=1;
fontfamily="Verdana, Tahoma, Arial";
fontsize="100%";
fontstyle="normal";
headerbgcolor="#ffffff";
headercolor="#000000";
offbgcolor="#eeeeee";
offcolor="#000000";
onbgcolor="#DDE7F0";
oncolor="#000099";
outfilter="randomdissolve(duration=0.0)";
overfilter="Fade(duration=0.05);Alpha(opacity=90);Shadow(color=#777777', Direction=135, Strength=3)";
padding=4;
pagebgcolor="#82B6D7";
pagecolor="black";
separatorcolor="#999999";
separatorsize=1;
subimage="../img/arrow.gif";
subimagepadding=2;
}

with(milonic=new menuname("Main Menu")){
alwaysvisible=1;
left=0;
orientation="horizontal";
style=menuStyle;
top=0;
aI("showmenu=Samples;text=Menu Samples;");
aI("showmenu=Milonic;text=Milonic;");
aI("showmenu=HelpMenu;text=Help;");
}

with(milonic=new menuname("Samples")){
overflow="scroll";
style=menuStyle;
aI("text=Plain Text Horizontal Style DHTML Menu Bar;url=/menusample1.php;")
aI("text=DHTML Menu - Vertical Plain Text Menu;url=/menusample2.php;")
aI("text=JavaScript Menu - All Horizontal Text Based Menu;url=/menusample25.php;")
aI("text=Using The Popup Menu Function Positioned by Images;url=/menusample24.php;")
aI("text=Classic XP Style Menu;url=/menusample82.php;")
aI("text=XP Style;url=/menusample86.php;")
aI("text=XP Taskbar Style Menu;url=/menusample83.php;")
aI("text=Office XP Style Menu;url=/menusample47.php;")
aI("text=Office 2003 Style Menu;url=/menusample46.php;")
aI("text=Apple Mac Style Menu;url=/menusample72.php;")
aI("text=Amazon Style Tab Menu;url=/menusample74.php;")
aI("text=Milonic Home Menu;url=/menusample78.php;")
aI("text=Windows 98 Style Menu;url=/menusample13.php;")
aI("text=Multiple Styles Menu;url=/menusample5.php;")
aI("text=Multi Colored Menu Items;url=/menusample80.php;")
aI("text=Multi Colored Menus Using Styles;url=/menusample7.php;")
aI("text=Multi Tab;url=/menusample50.php;")
aI("text=Tab Top;url=/menusample52.php;")
aI("text=Multi Columns;url=/menusample73.php;")
aI("text=100% Width Span Menu;url=/menusample26.php;")
aI("text=Follow Scrolling Style Menu;url=/menusample10.php;")
aI("text=Menu Positioning With Offsets;url=/menusample23.php;")
aI("text=Table Based (Relative) Menus;url=/menusample9.php;")
aI("text=Opening Windows and Frames with the Menu;url=/menusample11.php;")
aI("text=Menus Over Form Selects, Flash and Java Applets;url=/menusample14.php;")
aI("text=Activating Functions on Mouseover;url=/menusample15.php;")
aI("text=Drag Drop Menus;url=/menusample22.php;")
aI("text=Menus with Header Type Items;url=/menusample8.php;")
aI("text=Right To Left Openstyle;url=/menusample65.php;")
aI("text=Up Openstyle Featuring Headers;url=/menusample33.php;")
aI("text=DHTML Menus and Tooltips;url=/menusample6.php;")
aI("text=Unlimited Level Menus Example;url=/menusample67.php;")
aI("text=Context Right Click Menu;url=/menusample27.php;")
aI("text=Menus built entirely from images;url=/menusample18.php;")
aI("text=Static Images Sample;url=/menusample16.php;")
aI("text=Rollover Swap Images Sample;url=/menusample17.php;")
aI("text=Background Item Images;url=/menusample20.php;")
aI("text=Background Image Buttons;url=/menusample89.php;")
aI("text=Menu Background Images;url=/menusample76.php;")
aI("text=Creating Texture with Menu Background Images;url=/menusample19.php;")
aI("text=Static Background Item Images;url=/menusample71.php;")
aI("text=Vertical Static Background Item Images;url=/menusample87.php;")
aI("text=World Map Sample;url=/menusample92.php;")
aI("text=US Map Sample;url=/menusample91.php;")
aI("text=Image Map Sample;url=/menusample4.php;")
aI("text=Rounded Edges Imperial Style;url=/menusample21.php;")
aI("text=Corporation;url=/menusample40.php;")
aI("text=International;url=/menusample70.php;")
aI("text=Clean;url=/menusample32.php;")
aI("text=3D Gradient Block;url=/menusample57.php;")
aI("text=Descreet;url=/menusample42.php;")
aI("text=Agriculture;url=/menusample41.php;")
aI("text=Breeze;url=/menusample29.php;")
aI("text=Chart;url=/menusample66.php;")
aI("text=Cartoon;url=/menusample77.php;")
aI("text=Start Button Menu;url=/menusample69.php;")
aI("text=Tramline;url=/menusample54.php;")

}

with(milonic=new menuname("Milonic")){
style=menuStyle;
aI("text=Product Purchasing Page;url=http://www.milonic.com/cbuy.php;");
aI("text=Contact Us;url=http://www.milonic.com/contactus.php;");
aI("text=Newsletter Subscription;url=http://www.milonic.com/newsletter.php;");
aI("text=FAQ;url=http://www.milonic.com/menufaq.php;");
aI("text=Discussion Forum;url=http://www.milonic.com/forum/;");
aI("text=Software License Agreement;url=http://www.milonic.com/license.php;");
aI("text=Privacy Policy;url=http://www.milonic.com/privacy.php;");
}

with(milonic=new menuname("HelpMenu")){
style=menuStyle;
aI("status=(aq) Web Server Hosting & Services;text=(aq) Web Hosting;url=http://www.a-q.co.uk/;");
aI("text=WebSmith;url=websmith;");
aI("text=SMS 2 Email;url=http://www.sms2email.com/;");
}


drawMenus();*/

