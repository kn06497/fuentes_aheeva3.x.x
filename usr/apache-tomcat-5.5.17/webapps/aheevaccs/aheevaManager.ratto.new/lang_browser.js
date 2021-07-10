
function UserAgent() {
	var b=navigator.appName;
	if (b=="Netscape") this.b="ns";
	else if (b=="Microsoft Internet Explorer") this.b="ie";
	else this.b=b;
	this.version=navigator.appVersion;
	this.v=parseInt(this.version);
	this.ns=(this.b=="ns" && this.v>=4);
	this.ns4=(this.b=="ns" && this.v==4);
	this.ns5=(this.b=="ns" && this.v==5);
	this.ie=(this.b=="ie" && this.v>=4);
	this.ie4=(this.version.indexOf('MSIE 4')>0);
	this.ie5=(this.version.indexOf('MSIE 5')>0);
	this.ie55=(this.version.indexOf('MSIE 5.5')>0);
}
var at = new UserAgent();
var lang;
//Get the applet object
if(at.b == 'ie')
{
//	appletObj = window.top.comm.myApplet; 
   
    lang = window.top.comm.lang;	
	 
//	alert(lang);
//	alert ("IN");
}
else
    lang = top.frames.comm.lang;
    

/* Emulations for Mozilla*/
//var isMozilla = !(document.all);
/*if(at.b != 'ie')
{
	HTMLElement.prototype.innerText getter = function()
	{
		return this.innerHTML.replace(/<[^>]+>/g, "");
	}

	HTMLElement.prototype.innerText setter = function(txtStr)
	{
		var parsedText = document.createTextNode(txtStr);
		this.innerHTML = "";
		this.appendChild( parsedText );
	}
}*/

	

