var login_td_enable_str = "<td id=\"login_logout_td\"  width=\"32px\" class=\"td_menu\"><input id=\"login_logout_input\" type=\"image\" src=\"./images/logon.png\" title=\"Log in\" onClick=\"postJavaEvent('login','na') \" </td>";
//var logout_td_enable_str = "<td id=\"login_logout_td\" width=\"32px\" class=\"td_menu\"><input id=\"login_logout_input\" type=\"image\" src=\"./images/logoff.png\" title=\"Log off\" onClick=\"postJavaEvent('logout','na')\"></td>";
//var ready_td_enable_str = "<td id=\"ready_notready_td\" width=\"32px\" class=\"td_menu\"><input id=\"ready_notready_input\" type=\"image\" src=\"./images/not_ready.png\" title=\"Not ready\" onClick=\"postJavaEvent('ready','na')\"></td>";
//var notready_td_enable_str = "<td id=\"ready_notready_td\" width=\"32px\" class=\"td_menu\"><input id=\"ready_notready_input\" type=\"image\" src=\"./images/ready.png\" title=\"Ready\" onClick=\"postJavaEvent('notready','na')\"></td>";
//var notready_reason_td_enable_str = "<td id=\"not_ready_reason_td\" width=\"5px\"><img  id=\"ready_notready_reason_dropdown\" src=\"./images/not_ready_arrow.png\" onclick=\"postJavaEvent('notready_reason','na')\" valign=\"bottom\"></img></td>";
//var dial_td_enable_str = "<td id=\"dial_td\" width=\"32px\" class=\"td_menu\"><input id=\"dial_input\" type=\"image\" src=\"./images/plus_phone.png\" title=\"Dial number\" onClick=\"postJavaEvent('add_line','na')\" name=\"dialpad\" onMouseOver=\"MM_swapImage('dialpad','','./images/dial1_over.png',1)\" onMouseOut=\"MM_swapImgRestore()\"></td>";
//var dialpad_td_enable_str = "<td id=\"dialpad_td\" width=\"5px\" class=\"td_menu\"><input id=\"dialpad_input\" type=\"image\" src=\"./images/dialpad1_short.png\" title=\"dialpad\" onClick=\"postJavaEvent('dial','na')\" valign=\"bottom\"></td>";
//var hangup_td_enable_str = "<td id=\"hangup_td\" width=\"32px\" class=\"td_menu\"><input type=\"image\" src=\"./images/hangup.png\" title=\"Hangup\" onClick=\"postJavaEvent('hangup','na')\"></td>";
//var transfer_td_enable_str = "<td id=\"transfer_td\" width=\"32px\" class=\"td_menu\"><input id=\"transfer_input\" type=\"image\" src=\"./images/transfer1.png\" title=\"Transfer call\" onClick=\"postJavaEvent('transfer','na')\"></td>";
//var conference_td_enable_str = "<td id=\"conference_td\" width=\"32px\" class=\"td_menu\"><input id=\"conference_input\" type=\"image\" src=\"./images/add_line.png\" title=\"Add calling line\"  onClick=\"postJavaEvent('add_line','na')\"></td>";
//var hold_td_enable_str = "<td id=\"hold_unhold_td\" width=\"32px\" class=\"td_menu\"><input id=\"hold_unhold_input\" type=\"image\" src=\"./images/hold.png\" title=\"Hold\" onClick=\"postJavaEvent('hold','na')\"></td>";
//var unhold_td_enable_str ="<td id=\"hold_unhold_td\" width=\"32px\" class=\"td_menu\"><input id=\"hold_unhold_input\" type=\"image\" src=\"./images/unhold.png\" title=\"Remove Hold\" onClick=\"postJavaEvent('unhold','na')\"></td>";
//var exDataArrow_td_enable_str="<td id=\"exDataArrow_td_enable_str\" width=\"5px\" class=\"td_menu\" align=\"right\"><input id=\"exdata_input\" type=\"image\" src=\"./images/arrowdown.gif\" title=\"Show Extradata\" onClick=\"postJavaEvent('exdata','na')\"></td>";


//disable graphic
//var login_td_disable_str = "<td id=\"login_logout_td\" width=\"32px\" class=\"td_menu\"><input id=\"login_logout_input\" type=\"image\" src=\"./images/logon_off.png\" title=\"Log off\"></td>";
//var logout_td_disable_str = "<td id=\"login_logout_td\" width=\"32px\" class=\"td_menu\"><input id=\"login_logout_input\" type=\"image\" src=\"./images/logoff_off.png\" title=\"Log in\"></td>";
var ready_td_disable_str = "<td id=\"ready_notready_td\" width=\"32px\" class=\"td_menu\"><input id=\"ready_notready_input\" type=\"image\" src=\"./images/not_ready_off.png\" title=\"Not ready\"></td>";
//var notready_td_disable_str = "<td id=\"ready_notready_td\" width=\"5px\" class=\"td_menu\"><input id=\"ready_notready_input\" type=\"image\" src=\"./images/ready_off.png\" title=\"Ready\"></td>";
var notready_reason_td_disable_str = "<td id=\"not_ready_reason_td\" width=\"5px\"><img  id=\"ready_notready_reason_dropdown\"  src=\"./images/not_ready_arrow_off.png\" valign=\"bottom\"></img></td>";
var dial_td_disable_str = "<td id=\"dial_td\" width=\"5px\" class=\"td_menu\"><input id=\"dial_input\" type=\"image\" src=\"./images/plus_phone_off.png\" title=\"Dial number\" name=\"dial\"></td>";
var dialpad_td_disable_str = "<td id=\"dialpad_td\" width=\"32px\" class=\"td_menu\"><input id=\"dialpad_input\" type=\"image\" src=\"./images/dialpad2_short.png\" title=\"Dial Pad\" \></td>";
var hangup_td_disable_str = "<td id=\"hangup_td\" width=\"32px\" class=\"td_menu\"><input id=\"hangup_input\" type=\"image\" src=\"./images/hangup_off.png\" title=\"Hang up\"></td>";
var transfer_td_disable_str = "<td id=\"transfer_td\" width=\"32px\" class=\"td_menu\"><input id=\"transfer_input\" type=\"image\" src=\"./images/transfer1_off.png\" title=\"Transfer call\"></td>";
var conference_td_disable_str = "<td id=\"conference_td\" width=\"32px\" class=\"td_menu\"><input id=\"conference_input\" type=\"image\" src=\"./images/conference1_off.png\"  title=\"Conference\"></td>";
var hold_td_disable_str = "<td id=\"hold_unhold_td\" width=\"32px\" class=\"td_menu\"><input id=\"hold_unhold_input\" type=\"image\" src=\"./images/hold_off.png\"  title=\"Hold\"></td>";
var unhold_td_disable_str ="<td id=\"hold_unhold_td\" width=\"32px\" class=\"td_menu\"><input id=\"hold_unhold_input\" type=\"image\" src=\"./images/unhold_off.png\" title=\"Remove Hold\"></td>";
var att_data_table_str = "<table topmargin=0 marginheight=0 leftmargin=0 rightmargin=0 marginwidth=0><tr><td id=\"exDataArrow_td_disable_str\"><input border=0 id=\"exdata_input\" type=\"image\" src=\"./images/arrowupdis.gif\" title=\"Show Extradata\"></td></tr></table>";


function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}



		