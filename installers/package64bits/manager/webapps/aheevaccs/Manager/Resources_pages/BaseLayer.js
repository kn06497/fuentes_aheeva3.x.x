function BaseLayer(x,y,w,h,desc,align,fgcolor,bgcolor,clickable,icon,fontface,fontsize,style,parentObj )
{
	this.index="BaseLayer"+(BaseLayer.index++)
    this.x=x||0;
    this.y=y||0;
    this.w=w||100;
    this.h=h||0;
    this.desc=desc||"";
	this.align=align||"CENTER";
	this.fgcolor=fgcolor||"white";
	this.bgcolor=bgcolor||"black";
	this.clickable=clickable||"0";
	this.fontface=fontface||"Verdana";
	this.fontsize=fontsize||3;
	this.icon=icon||"";
    this.lyr=null;
	this.style=style||"";
	if( parentObj == null)
		this.parentDoc = document.body;
	else 
 	    this.parentDoc = parentObj;
	this.create();
}
BaseLayer.index=0

BaseLayer.prototype.setCaption=function(caption,icon)
{
   var tHeader = '<TABLE WIDTH="100%" HEIGHT="'+this.h+'" BORDER="0" CELLPADDING="0" CELLSPACING="0"><TR><TD NOWRAP ALIGN="'+this.align+'">'
   var tFooter = '</TD></TR></TABLE>'
	this.desc=caption;
	this.icon=icon;

	if (this.desc=="" && this.icon=="") return;

	var fontsize; if (at.ns4) fontsize=this.fontsize+1;else fontsize=this.fontsize;
	var code="";
	if (this.icon!="")
	{
		code="<IMG BORDER='0' WIDTH='"+this.w+"' HEIGHT='"+this.h+"' SRC='"+this.icon+"'></IMG>";
	}
	else
	{
		code="<FONT id='"+this.index+"d' color='"+this.fgcolor+"' size='"+ fontsize + "' face='"+this.fontface+"'>" + this.desc+"</FONT>";
	}
	if (this.clickable=="1") {
		code="<A href=# onclick='return false;'>"+code+"</A>";
	}
	code=tHeader+code+tFooter

	if (at.ie) {
	  this.lyr.innerHTML=code;
	}
	else if(at.ns4)
	{
		this.lyr.document.open()
		this.lyr.document.write(code);
		this.lyr.document.close();
		this.lyr.captureEvents(Event.MOUSEUP);
	}
	else if (at.ns5) {
		while (this.lyr.hasChildNodes()) {this.lyr.removeChild(this.lyr.firstChild);}
		var r = this.lyr.ownerDocument.createRange();
		r.selectNodeContents(this.lyr);
		r.deleteContents();
		var df = r.createContextualFragment(code);
		this.lyr.appendChild(df);
	}
}

BaseLayer.prototype.setFgColor=function(clr)
{
	this.fgcolor=clr;
	if (at.ns4) {
		this.setCaption(this.desc,this.icon);
	}
	else if (at.ie4) {
		document.all[this.index+"d"].style.color=this.bgcolor;
	}
	else
	{
		if (this.icon=="") {
			document.getElementById(this.index+"d").style.color=this.fgcolor;
		}
	}
}

BaseLayer.prototype.setBgColor=function(clr)
{
	this.bgcolor=clr;
	if (at.ns4) {
		this.lyr.document.bgColor=this.bgcolor;
	}
	else
	{
		this.lyr.style.backgroundColor=this.bgcolor;
	}
}

BaseLayer.prototype.setSize=function(w,h)
{
	var layer=this.lyr;
	this.w=w;this.h=h;

	if (at.ns4) {
	 if (this.w=="100%") layer.resizeTo(window.innerWidth,this.h);
	 else layer.resizeTo(this.w, this.h);
	}
	else if (at.ie||at.ns5) {
	 if (this.w=="100%") {
		 layer.style.width="100%";
		 layer.style.height=this.h+'px';
	 }
	 else
	 {
		 layer.style.width=this.w+'px';
		 layer.style.height=this.h+'px';
	 }
	}
}

BaseLayer.prototype.setPos=function(x,y)
{
	this.x=x;this.y=y;
	var layer=this.lyr;

	if (at.ns4) {
	 layer.moveTo(this.x,this.y);
	}
	else
	{
	 layer.style.top=this.y;
	 layer.style.left=this.x;
	}
}

BaseLayer.prototype.setVisibility=function(visible)
{
	var layer=this.lyr;

	if (at.ns4) {
	 layer.visibility=(visible)?"show":"hide";
	}
	else if (at.ie) {
		layer.style.visibility=(visible)?"visible":"hidden";
	}
	else {
	 layer.style.display=(visible)?"":"none";
	}
}

 
BaseLayer.prototype.setFontsize=function(fontsize)
{
	this.fontsize=fontsize;
}

BaseLayer.prototype.setFontface=function(fontface)
{
	this.fontface=fontface;
}

BaseLayer.prototype.create=function()
{
  var index=this.index;
  if (at.ns4) {
	 if (this.w=="100%") this.lyr=new Layer(window.innerWidth);
	 else this.lyr=new Layer(this.w);
  }
  else if (at.ie4)
  {
	 var code='<div id="' + index + '" style="position:absolute;left:0px;top:0px;width:'+this.w+'px;"></div>'
	 document.body.insertAdjacentHTML("beforeEnd", code);
     this.lyr=document.all[index];
  }
  else if (at.ie || at.ns5) {
	  this.lyr=document.createElement("DIV");
	  this.lyr.style.position="absolute";
	  this.lyr.id=index;
	  //document.body.appendChild(this.lyr);
	  this.parentDoc.appendChild(this.lyr);
  }
  this.lyr.parent=this;
  this.setSize(this.w,this.h);

  this.setCaption(this.desc, this.icon);
  this.setBgColor(this.bgcolor);

  this.setPos(this.x,this.y);
  this.setVisibility(true);
	
  if(this.style.length > 1) 
	this.lyr.style = this.style;
  
}

