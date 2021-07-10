


//-->
NS6 = (document.getElementById&&!document.all)
IE = (document.all)
NS = (navigator.appName=="Netscape" && navigator.appVersion.charAt(0)=="4")

tempBar='';barBuilt=0;

var currentSkillObj;
moving=setTimeout('null',1)
function moveOut() {
if ((NS6||NS)&&parseInt(ssm.left)<0 || IE && ssm.pixelLeft<0) {
clearTimeout(moving);moving = setTimeout('moveOut()', slideSpeed);slideMenu(10)}
else {clearTimeout(moving);moving=setTimeout('null',1)}};

function moveBack() {clearTimeout(moving);moving = setTimeout('moveBack1()', waitTime)}

function moveBack1() {
document.getElementById("setAgentDIV").style.visibility = 'hidden';
if ((NS6||NS) && parseInt(ssm.left)>(-menuWidth) || IE && ssm.pixelLeft>(-menuWidth)) {
clearTimeout(moving);moving = setTimeout('moveBack1()', slideSpeed);slideMenu(-10)}
else {clearTimeout(moving);moving=setTimeout('null',1)}}

function slideMenu(num){
if (IE) {ssm.pixelLeft += num;}
if (NS||NS6) {ssm.left = parseInt(ssm.left)+num;}
if (NS) {bssm.clip.right+=num;bssm2.clip.right+=num;}}

function makeStatic() {
if (NS||NS6) {winY = window.pageYOffset;}
if (IE) {winY = document.body.scrollTop;}
if (NS6||IE||NS) {
if (winY!=lastY&&winY>YOffset-staticYOffset) {
smooth = .2 * (winY - lastY - YOffset + staticYOffset);}
else if (YOffset-staticYOffset+lastY>YOffset-staticYOffset) {
smooth = .2 * (winY - lastY - (YOffset-(YOffset-winY)));}
else {smooth=0}
if(smooth > 0) smooth = Math.ceil(smooth);
else smooth = Math.floor(smooth);
if (IE) bssm.pixelTop+=smooth;
if (NS6||NS) bssm.top=parseInt(bssm.top)+smooth
lastY = lastY+smooth;
setTimeout('makeStatic()', 1)}}

function buildBar() {
if(barText.indexOf('<IMG')>-1) 
	{tempBar=barText}
else
	{for (b=0;b<barText.length;b++) {tempBar+=barText.charAt(b)+"<BR>"}}
document.write('<td align="center" rowspan="6" width="'+barWidth+'" bgcolor="'+barBGColor+'" valign="'+barVAlign+'"><p align="center"><font face="'+barFontFamily+'" Size="'+barFontSize+'" COLOR="'+barFontColor+'"><B>'+tempBar+'</B></font></p></TD>')
}


function initSlide() {
if (NS6){ssm=document.getElementById("thessm").style;bssm=document.getElementById("basessm").style;
bssm.clip="rect(0 "+document.getElementById("thessm").offsetWidth+" "+document.getElementById("thessm").offsetHeight+" 0)";ssm.visibility="visible";}
else if (IE) {ssm=document.all("thessm").style;bssm=document.all("basessm").style
bssm.clip="rect(0 "+thessm.offsetWidth+" "+thessm.offsetHeight+" 0)";bssm.visibility = "visible";}
else if (NS) {bssm=document.layers["basessm1"];
bssm2=bssm.document.layers["basessm2"];ssm=bssm2.document.layers["thessm"];
bssm2.clip.left=0;ssm.visibility = "show";}
if (menuIsStatic=="yes") makeStatic();}

function buildAgentSkillSlide() {
if (IE||NS6) {document.write('<DIV ID="basessm" style="visibility:hidden;Position : Absolute ;Left : '+XOffset+' ;Top : '+YOffset+' ;Z-Index : 20;width:'+(menuWidth+barWidth+10)+'"><DIV ID="thessm" style="Position : Absolute ;Left : '+(-menuWidth)+' ;Top : 0 ;Z-Index : 20;" onmouseover="moveOut()" onmouseout="moveBack()">')}
if (NS) {document.write('<LAYER name="basessm1" top="'+YOffset+'" LEFT='+XOffset+' visibility="show"><ILAYER name="basessm2"><LAYER visibility="hide" name="thessm" bgcolor="'+menuBGColor+'" left="'+(-menuWidth)+'" onmouseover="moveOut()" onmouseout="moveBack()">')}
if (NS6){document.write('<table border="0" cellpadding="0" cellspacing="0" width="'+(menuWidth+barWidth+2)+'" bgcolor="'+menuBGColor+'"><TR><TD>')}
document.write('<table border="0" cellspacing="0" cellpadding="0" width="'+(menuWidth+barWidth+2)+'">');
	
	document.write('<TR>')	
	document.write('<td bgcolor="#CDD8E9" HEIGHT="'+hdrHeight+'" ALIGN="'+hdrAlign+'" COLSPAN="2">&nbsp;<font face="'+hdrFontFamily+'" Size="'+hdrFontSize+'" COLOR="#000000"><i><b>Agent #'+agentLoginID+'</b></i></font></td>')
	
	if(barText.indexOf('<IMG')>-1) 
	{tempBar=barText}
	else
		{for (b=0;b<barText.length;b++) {tempBar+=barText.charAt(b)+"<BR>"}}
	document.write('<td align="center" rowspan="6" width="'+barWidth+'" bgcolor="'+barBGColor+'" valign="'+barVAlign+'"><p align="center"><font face="'+barFontFamily+'" Size="'+barFontSize+'" COLOR="'+barFontColor+'"><B>'+tempBar+'</B></font></p></TD>')

	
	document.write('</TR>')
	
	var jsSkillList = String( appletObj.getAllSkills(tenant_dbid) );
	skillList = "";
	jsSkillListArray = jsSkillList.split("|");
	for(i = 0; i < jsSkillListArray.length; i++)
		{
		thisOne = jsSkillListArray[i].split(",");
		skillList += thisOne[0]+",";
		}
	if(skillList.length > 1)
		skillList = skillList.substring(0, skillList.length-1);
	jsAskedAgentSkills = String( appletObj.getAgentsSkills(skillList, agentLoginID) );
	//alert("jsAskedAgentSkills="+jsAskedAgentSkills)
	jsAskedAgentSkillsArray = jsAskedAgentSkills.split("^");
	thecolor = '#FFFFFF';
	
	for(i = 0; i < jsAskedAgentSkillsArray.length; i++)
	{		
		
		thisOne = jsSkillListArray[i].split(",");
		thisOne2 = jsAskedAgentSkillsArray[i].split(",");
		
		document.write('<TR>')	
			document.write('<td ALIGN="LEFT" BGCOLOR="'+thecolor+'">'+thisOne[1]+'</td>')
			document.write('<td ID="td_agentSkillId" ');
			document.write(' agentDBID="'+thisOne2[2]+'"');
			document.write(' skillDBID="'+thisOne[0]+'"');
			document.write(' oldWeight="'+thisOne2[1]+'"');
			document.write(' dbid="'+thisOne2[0]+'"');
			document.write('ALIGN="RIGHT" BGCOLOR="'+getColor(thisOne2[1])+'" ondblclick="setPopUpValues(\''+agentLoginID+'\', \''+thisOne[1]+'\', \''+thisOne2[1]+'\', this);" style="cursor:pointer">'+thisOne2[1]+'</td>')
		document.write('</TR>')
		
		if(thecolor == "#EEEEEE")
			thecolor = '#FFFFFF';
		else
			thecolor = '#EEEEEE';
	}

	document.write('<TR>')	
		document.write('<td ALIGN="CENTER" COLSPAN="2" BGCOLOR="#FFFFFF"><input type="button" value="Set Skills" onClick="saveskills()"></td>')
	document.write('</TR>')
	
	
document.write('</table>')
if (NS6){document.write('</TD></TR></TABLE>')}
if (IE||NS6) {document.write('</DIV></DIV>')}
if (NS) {document.write('</LAYER></ILAYER></LAYER>')}
	
	theleft=-menuWidth;lastY=0;setTimeout('initSlide();', 1)
}


<!--

/*
Configure menu styles below
NOTE: To edit the link colors, go to the STYLE tags and edit the ssm2Items colors
*/
YOffset=150; // no quotes!!
XOffset=0;
staticYOffset=30; // no quotes!!
slideSpeed=20 // no quotes!!
waitTime=500; // no quotes!! this sets the time the menu stays out for after the mouse goes off it.
menuBGColor="black";
menuIsStatic="yes"; //this sets whether menu should stay static on the screen
menuWidth=150; // Must be a multiple of 10! no quotes!!
menuCols=2;
hdrFontFamily="verdana";
hdrFontSize="2";
hdrFontColor="white";
hdrBGColor="#170088";
hdrAlign="left";
hdrVAlign="center";
hdrHeight="15";
linkFontFamily="Verdana";
linkFontSize="2";
linkBGColor="white";
linkOverBGColor="#FFFF99";
linkTarget="_top";
linkAlign="Left";
barBGColor="#444444";
barFontFamily="Verdana";
barFontSize="2";
barFontColor="white";
barVAlign="center";
barWidth=20; // no quotes!!
barText="SKILLS"; // <IMG> tag supported. Put exact html for an image to show.
if(agentDBID != "")
	buildAgentSkillSlide();


// EXTRA FUNCTIONS ....
function getColor(weight)
{
	if(weight == "N/A")
		return "#FFFFFF";
	redcolor = (112-255)/100*weight+255;
	redcolor = dechex(redcolor);
	greencolor = (223-165)/100*weight+165;
	greencolor = dechex(greencolor);
	//bluecolor = (108-59)/100*new_weight+59;
	bluecolor = '00';
	//bluecolor = dechex(bluecolor);	
	color = "#"+redcolor+""+greencolor+""+bluecolor;	
	
	return color;
}

function dechex(f1) {  
  rhex = tohex(f1);
  return rhex;
}

function tohex(i) {
  a2 = ''
  ihex = hexQuot(i);
  idiff = eval(i + '-(' + ihex + '*16)')
  a2 = itohex(idiff) + a2;
  while( ihex >= 16) {
	 itmp = hexQuot(ihex);
	 idiff = eval(ihex + '-(' + itmp + '*16)');
	 a2 = itohex(idiff) + a2;
	 ihex = itmp;
  } 
  a1 = itohex(ihex);
  return a1 + a2 ;
}
function hexQuot(i) {
  return Math.floor(eval(i +'/16'));
}
function itohex(i) {
		aa = '0';
      if( i == 0) { aa = '0' } else { if( i== 1) { aa = '1'} else {if( i== 2) { aa = '2'} else {if( i == 3) { aa = '3' } else {if( i== 4) { aa = '4'} else {if( i == 5) { aa = '5' } else {if( i== 6) { aa = '6'} else {if( i == 7) { aa = '7' } else {if( i== 8) { aa = '8'} else {if( i == 9) { aa = '9'} else {if( i==10) { aa = 'A'} else {if( i==11) { aa = 'B'} else {if( i==12) { aa = 'C'} else {if( i==13) { aa = 'D'} else {if( i==14) { aa = 'E'}  else {if( i==15) { aa = 'F'} } } } } } } } } } } } } } } }
      return aa
   }
   
function saveskills()
{
	//alert('ici...');
	var AgentSkillString = "";
	var agentDBID		 = "";
	var skillDBID		 = "";
	var olDWEight		 = "";
	var NewWeight		 = "";
	var mDBID		  	 = "";
	
	//alert('len='+document.getElementsById('td_agentSkillId').length);
	for(i = 0; i < document.getElementsByTagName('td').length; i++)
	{
		var curObj = document.getElementsByTagName('td')[i];
		if(curObj.id == 'td_agentSkillId')
		{		
			//agentSkillDBID = td_agentSkillId[i].agentSkillDBID;
			
			var agentDBID = curObj.getAttribute('agentDBID');
			var skillDBID = curObj.getAttribute('skillDBID');
			var olDWEight = curObj.getAttribute('oldWeight');
			var NewWeight = curObj.innerHTML;
			var mDBID	  = curObj.getAttribute('dbid');
			
			
			if(olDWEight == "N/A") olDWEight = "0";
			if(NewWeight == "N/A") NewWeight = "0";
			
			if(olDWEight != NewWeight ) //alors un changement a eu lieu,
			{
				
				if(olDWEight == "0") //, donc NewWeight != "N/a" ==> ajout d'un nouvel element...					
				{
					AgentSkillString += "-1"+"^"+agentDBID+"^"+skillDBID+"^"+NewWeight;
				}
				else
				{
					if(NewWeight == "0") //donc olDWEight != "N/A" ==> delete d'un elemnt existant
					{
						AgentSkillString += "-2"+"^"+mDBID;
					}
					else  // le oldWeight est different de NewWeight et sont tous les deux non N/A, modify
					{
						AgentSkillString += mDBID+"^"+NewWeight;
					}
				}			
				
				AgentSkillString += "|";
				curObj.oldWeight = NewWeight;
			}
		
		}//End IF
	}
	//
	
	//alert('AgentSkillString='+AgentSkillString);
	if(AgentSkillString.length > 1)
		AgentSkillString = AgentSkillString.substring(0, AgentSkillString.length-1);
	
	if(AgentSkillString != "")
	{
		//alert('AgentSkillString='+AgentSkillString);
		appletObj.saveAgentSkills(AgentSkillString);		
	}
	moveBack1();
}

function setPopUpValues(agentLoginID, skillName, skillScore, obj)
{
		var delta_top, delta_left;
		if(at.b == 'ie')
		{
			delta_top = obj.clientTop+obj.offsetTop+obj.clientHeight; 
			delta_left= obj.clientLeft+obj.offsetLeft;
		}
		else
		{
			delta_top = obj.offsetTop+obj.clientHeight;
			delta_left= obj.offsetLeft;			
		}
		
		
		document.getElementById('setAgentDIVLoginID').innerHTML = agentLoginID;
		document.getElementById('setAgentDIVSkill').innerHTML = skillName;
		//score.value = skillScore;
		document.setAgentForm.score.value = obj.innerHTML;
		
		document.getElementById('setAgentDIV').style.top = document.getElementById('basessm').offsetTop+delta_top;
		document.getElementById('setAgentDIV').style.left = document.getElementById('basessm').offsetLeft+delta_left;			
		document.getElementById('setAgentDIV').style.visibility = 'visible';
		document.getElementById('setAgentDIV').style.zIndex = 100;
		currentSkillObj = obj;
}

function returnNewSkill()
{
	new_weight = document.setAgentForm.score.value;
	
	if(new_weight >= 0 && new_weight <= 100 )
	{
		document.getElementById('setAgentDIV').style.visibility = 'hidden';
		currentSkillObj.innerHTML = new_weight;
		color = getColor(new_weight);			
		currentSkillObj.style.backgroundColor = color;
		return new_weight;
	}
	else
	{				
		alert("Weight must be between 0 and 100.");
		return -1;
	}
	
	//new_weight = prompt("Skill weight for agent #"+agent_dbid);	
}
