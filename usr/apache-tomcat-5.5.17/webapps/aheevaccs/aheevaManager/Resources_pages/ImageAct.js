<!-- // 2001-2003 Daryl Maksymec (Sidepix Inc)

var NS4 = document.layers ? 1:0
var IE4 = document.all ? 1:0
var IE5 = document.getElementById&&document.all ? 1:0
var NS6 = document.getElementById&&!document.all ? 1:0

var p = "/images/menu/";
b1on = new Image();
b1on.src = p+"b2_home.gif";
b2on = new Image();
b2on.src = p+"b2_mortgages.gif";
b3on = new Image();
b3on.src = p+"b2_company_profile.gif";
b4on = new Image();
b4on.src = p+"b2_news.gif";
b5on = new Image();
b5on.src = p+"b2_approval.gif";
b6on = new Image();
b6on.src = p+"b2_contact_us.gif";
b7on = new Image();
b7on.src = p+"b2_news.gif";
b8on = new Image();
b8on.src = p+"b2_broker_login.gif";
b9on = new Image();
b9on.src = p+"b2_mortgages.gif";

b1off = new Image();
b1off.src = p+"b0_home.gif";
b2off = new Image();
b2off.src = p+"b0_mortgages.gif";
b3off = new Image();
b3off.src = p+"b0_company_profile.gif";
b4off = new Image();
b4off.src = p+"b0_news.gif";
b5off = new Image();
b5off.src = p+"b0_approval.gif";
b6off = new Image();
b6off.src = p+"b0_contact_us.gif";
b7off = new Image();
b7off.src = p+"b0_news.gif";
b8off = new Image();
b8off.src = p+"b0_broker_login.gif";
b9off = new Image();
b9off.src = p+"b0_mortgages.gif";

i1on = new Image();
i1on.src = p+"printer_friendly2.gif";
i2on = new Image();
i2on.src = p+"french2.gif";
i3on = new Image();
i3on.src = p+"add_to_favorites2.gif";
i4on = new Image();
i4on.src = p+"add_bookmark2.gif";
i5on = new Image();
i5on.src = p+"bookmark_page2.gif";
i6on = new Image();
i6on.src = p+"pdf_version2.gif";

i1off = new Image();
i1off.src = p+"printer_friendly.gif";
i2off = new Image();
i2off.src = p+"french.gif";
i3off = new Image();
i3off.src = p+"add_to_favorites.gif";
i4off = new Image();
i4off.src = p+"add_bookmark.gif";
i5off = new Image();
i5off.src = p+"bookmark_page.gif";
i6off = new Image();
i6off.src = p+"pdf_version.gif";

function img_act(imgName)
{
	imgOn = eval(imgName+"on.src");
	document [imgName].src = imgOn;
}
function img_inact(imgName) 
{
	imgOff = eval(imgName+"off.src");
	document [imgName].src = imgOff;
}

function OpenWindow(url,height,width)
{
	popUpWindow = window.open(url,"InfoWindow",'height='+height+'px,width='+width+'px,status=no,toolbar=no,menubar=no,location=no,scrollbars=yes,center=yes,resizable=yes,left=10,top=170');
	popUpWindow.focus();
}

function Reno()
{
	popUpWindow = window.open("http://www.homerenovationguide.com");
	popUpWindow.focus();
}

var x=0;
var y=0;
var closetable = "</TD></TR></TABLE></TD></TR></TABLE>";	
if(!IE4) {
	document.captureEvents(Event.MOUSEMOVE);
	document.onmousemove = GetPos;
}
	
function Desc(text,secure) {

	if(secure) {
		var opentable = "<TABLE BGCOLOR='#000000' BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH=140><TR><TD ALIGN=center><TABLE BGCOLOR='#FFFFE1' BORDER=0 CELLPADDING=3 CELLSPACING=1 WIDTH=138><TR><TD VALIGN=top><IMG SRC='../img/help.jpg' HEIGHT=24 WIDTH=30 VSPACE=0 HSPACE=0 ALIGN=left>";
	}
	else {	
		var opentable = "<TABLE BGCOLOR='#000000' BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH=140><TR><TD ALIGN=center><TABLE BGCOLOR='#FFFFE1' BORDER=0 CELLPADDING=3 CELLSPACING=1 WIDTH=138><TR><TD VALIGN=top><IMG SRC='../img/help.jpg' HEIGHT=24 WIDTH=30 VSPACE=0 HSPACE=0 ALIGN=left>";
	}	

	if(NS6) {
		document.getElementById("Description").innerHTML  = opentable+text+closetable;
		document.getElementById("Description").style.left = x-12;
		document.getElementById("Description").style.top  = y+10;
		document.getElementById("Description").style.visibility = "visible";
	}
 	if(IE4) {
		
		document.all["Description"].innerHTML = opentable+text+closetable;
		Description.style.pixelLeft = event.clientX-12;
		Description.style.posTop  = document.body.scrollTop+event.clientY+16;
		Description.style.visibility = "visible";
	}
	else {
		var nets = document.layers["Description"];
		nets.document.open();
		nets.document.write(opentable+text+closetable);
		document.Description.left = x-12;
		document.Description.top = y+10;
		nets.visibility = "show";
		document.close();
	}
}

function GetPos(evnt){
		x = evnt.pageX;
		y = evnt.pageY;
	return true;
}

function noDesc() {

	if(NS6) {
		document.getElementById("Description").style.visibility = "hidden";
	}
	if(IE4) {
		Description.style.visibility = "hidden";
	}
	else {
		document.Description.visibility = "hidden";
	}
}

function AddFavorites() {

	if(IE4) {
		bookmarkSource = location.href;
		bookmarkTitle = document.title;

		document.writeln("<A HREF='javascript:window.external.AddFavorite(\"" + bookmarkSource + '\",\"' + bookmarkTitle + "\");' onMouseover='img_act(\"i3\")' onMouseout='img_inact(\"i3\")'>" + 
				 "<IMG SRC='"+p+"add_to_favorites.gif' NAME='i3' BORDER=0 VSPACE=0 HSPACE=0 HEIGHT=20 WIDTH=75 ALIGN=right ALT='Add to Favorites'></A>"); 
	}
	else if(NS4) {
		document.writeln("<A HREF='#' onMouseover='img_act(\"i4\")' onMouseout='img_inact(\"i4\")'>" +
				 "<IMG SRC='"+p+"add_bookmark.gif' NAME='i4' BORDER=0 VSPACE=0 HSPACE=0 HEIGHT=20 WIDTH=100 ALIGN=right ALT='Right mouse click to add to Bookmarks'></A>");
	}
	else if(NS6)  {
		document.writeln("<A HREF='#' onMouseover='img_act(\"i5\")' onMouseout='img_inact(\"i5\")'>" +
				 "<IMG SRC='"+p+"bookmark_page.gif' NAME='i5' BORDER=0 VSPACE=0 HSPACE=0 HEIGHT=20 WIDTH=100 ALIGN=right ALT='Right mouse click to add to Bookmarks'></A>");
;
	}
}

// -->