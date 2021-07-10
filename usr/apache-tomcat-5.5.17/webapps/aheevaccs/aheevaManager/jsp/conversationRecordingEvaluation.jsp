<%@page contentType = "text/html" %>
<%@page language = "java" %>
<%@page import = "java.util.*" %>
<%@page import = "java.lang.*" %>
<%@page import = "aheevaManager.java.*" %>
<%@page import = "aheevaManager.ressources.*" %>

<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);

beanManagerData pageData = new beanManagerData();

pageData.openConnection();

if( session.getAttribute("USER_LANGUAGE") != null )
	pageData.setDefaultLanguage((String)session.getAttribute("USER_LANGUAGE"));

String currentUserDbid = (String)session.getAttribute("CURRENT_USER_DBID");
String currentUserip	=  request.getRemoteAddr();
//get the data from the calling page
String recid 	= (request.getParameter("recid")==null)?"":request.getParameter("recid");
String tracknum = (request.getParameter("tracknum")==null)?"":request.getParameter("tracknum");
String agtid 	= (request.getParameter("agtid")==null)?"":request.getParameter("agtid");
String grpid 	= (request.getParameter("grpid")==null)?"":request.getParameter("grpid");
String tenantid = (request.getParameter("tenant")==null)?"":request.getParameter("tenant");
String tomcaturl = (request.getParameter("url")==null)?"":request.getParameter("url");
String tomcatpath = (request.getParameter("path")==null)?"":request.getParameter("path");

String view = (request.getParameter("view")==null)?"0":request.getParameter("view");


//if load after submit
String actval = (request.getParameter("actval")==null)?"":request.getParameter("actval");


if (actval.compareTo("1")==0)
{
	String str_list="";
	
	String grpnbr = (request.getParameter("grpnbr")==null)?"0":request.getParameter("grpnbr");
	String comments = (request.getParameter("comments")==null)?"":request.getParameter("comments");
	String frmdbid = (request.getParameter("frmdbid")==null)?"":request.getParameter("frmdbid");
	String evaldbid= (request.getParameter("evaldbid")==null)?"":request.getParameter("evaldbid");
	
	for (int i = 0 ; i < Integer.parseInt(grpnbr) ; i++)
	{
		String grpevaldbid	= (request.getParameter("evaldet"+i)==null)?"":request.getParameter("evaldet"+i);
		String grpdbid	= (request.getParameter("grpdbid"+i)==null)?"":request.getParameter("grpdbid"+i);
		String grpcomment = (request.getParameter("comm"+i)==null)?"":request.getParameter("comm"+i);
		String grpscore = (request.getParameter("grpscore"+i)==null)?"":request.getParameter("grpscore"+i);
		String grpmaxscore = (request.getParameter("grpmaxscore"+i)==null)?"":request.getParameter("grpmaxscore"+i);
		
		if (str_list!=""){str_list=str_list+"^";}
		str_list = str_list+grpevaldbid+"#"+grpdbid+"###"+grpcomment+"#"+grpscore+"#"+grpmaxscore+"#0";
		
		String questnbr = (request.getParameter("grpquestnbr"+i)==null)?"0":request.getParameter("grpquestnbr"+i);
		
		for (int j=0; j <Integer.parseInt(questnbr);j++)
		{
			String subevaldbid	= (request.getParameter("evaldet"+i+"_"+j)==null)?"":request.getParameter("evaldet"+i+"_"+j);
			String subcomment   = (request.getParameter("comm"+i+"_"+j)==null)?"":request.getParameter("comm"+i+"_"+j);
			
			String subanstype   = (request.getParameter("anstype"+i+"_"+j)==null)?"0":request.getParameter("anstype"+i+"_"+j);
			
			String subans = (request.getParameter("ans"+i+"_"+j)==null)?"":request.getParameter("ans"+i+"_"+j);
			
			String subansid = "";
			String subansscore = "";
			
			switch (Integer.parseInt(subanstype))
			{
				case 1:
				case 2:
					if (subans.compareTo("")!=0)
					{
						String [] arr_subans = subans.split("#");
						
						if (arr_subans.length==2)
						{
							subansid 	= arr_subans[0];
							subansscore	= arr_subans[1];
						}
					}
				break;	
				case 3:
				subansscore = 	subans;
				break;
					
			}
			

			
			String subquestdbid	= (request.getParameter("quest"+i+"_"+j)==null)?"":request.getParameter("quest"+i+"_"+j);
			String subfhide	= (request.getParameter("fhide"+i+"_"+j)==null)?"0":request.getParameter("fhide"+i+"_"+j);
			
			if (str_list!=""){str_list=str_list+"^";}
			str_list = str_list+subevaldbid+"#"+grpdbid+"#"+subquestdbid+"#"+subansid+"#"+subcomment+"#"+subansscore+"##0";
		}
		
		
	}
	
	
	
	//initialise a RecordingEvaluation for insert/update
	RecordingEvaluation saveEval = new RecordingEvaluation(recid , evaldbid , frmdbid , comments , currentUserip , currentUserDbid);
	int ret = saveEval.insertUpdateEvaluation(str_list);
	
	if (ret ==1)//insert evaluation
	{
		%>
		<script>window.opener.location.reload();</script>
		<%
	}
	
	saveEval = null;
}

//end if load after submit





//create instance of recording evaluation
RecordingEvaluation recEval = new RecordingEvaluation(recid,tracknum,agtid,grpid,tenantid,currentUserip , currentUserDbid); 



String form_name = recEval.getFormName();
String form_desc = recEval.getFormDesc();

Vector<EvaluationDetails> vec_evdet = recEval.getEvaluationdetails();

%>


<html>
<head>
<title><%=pageData.getWord("Evaluation form")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Language" content="en-us">
<script language="JavaScript" type="text/javascript" src="../Resources_pages/jsUtil.js"></script>
<LINK href="../Resources_pages/livestats.css" 	rel="stylesheet" type="text/css" />
<LINK href="../Resources_pages/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../Resources_pages/xc2_default.css" type="text/css">
<style type="text/css">


.dynamic-tab-pane-control .tab-page {
	clear:			both;
	border:			1px solid rgb( 145, 155, 156 );
	background:		rgb( 252, 252, 254 );
	z-index:		2;
	position:		relative;
	top:			-2px;

	font:			11px Tahoma;
	color:			Black;

	filter:			progid:DXImageTransform.Microsoft.Gradient(StartColorStr=#fffcfcfe, EndColorStr=#fff4f3ee, GradientType=0)
					progid:DXImageTransform.Microsoft.Shadow(Color=#ff919899, Strength=2, Direction=135);
	
	padding:		10px;
	height:			99%  ;
	width:			99%	;
}


form {
	margin:		0;
	padding:	0;
} 

/* over ride styles from webfxlayout */
 
body {
	margin:		10px;
	width:		auto;
	height:		auto;
}

</style>



<%

if (view.compareTo("0")==0 && form_name.compareTo("")!=0) 
{
%>

<script language="javascript">
var userDbid = <%=currentUserDbid%>;
 
function roundNumber(rnum, rlength) { // Arguments: number to round, number of decimal places
  var newnumber = Math.round(rnum*Math.pow(10,rlength))/Math.pow(10,rlength);
  return  newnumber; // Output the result to the form field (change for your purposes)
}
 
 
function doSubmit()
{ 	
	for (var i=0; i< parseInt(document.evaluation.grpnbr.value) ; i++)
	{
		eval('document.evaluation.grpscore'+i).style.visibility = 'hidden';
		eval('document.evaluation.grpmaxscore'+i).style.visibility = 'hidden';
		eval('document.evaluation.grpscore'+i).disabled = false;
		eval('document.evaluation.grpmaxscore'+i).disabled = false;

	}
	
	document.evaluation.action="conversationRecordingEvaluation.jsp?recid=<%=recid%>&tracknum=<%=tracknum%>&agtid=<%=agtid%>&grpid=<%=grpid%>&tenantid=<%=tenantid%>&actval=1"
	document.evaluation.submit();
}

function doClose()
{ 	
	self.close();
}
function manageSaveButton()
{
	f_answered = 1;
	for (var i=0; i< parseInt(document.evaluation.grpnbr.value) ; i++)
	{
		if (f_answered == 0)
		{
			break;
		}
		if (parseInt(eval('document.evaluation.grpquestnbr'+i).value)>0)
		{
			
			for (var j=0; j< eval('document.evaluation.grpquestnbr'+i).value ; j++)
			{
				if (eval('document.evaluation.fhide'+i+'_'+j).value == 0)
				{
					f_quest_answered = 0;
					ans_type = 	parseInt(eval('document.evaluation.anstype'+i+'_'+j).value);	 
					switch (ans_type)
					{
						case 1://radio
							
						for (var m=0;m<eval('document.evaluation.ans'+i+'_'+j).length;m++)
						{
							
							if (eval('document.evaluation.ans'+i+'_'+j)[m].checked)
							{
								f_quest_answered = 1;
								break;
							}	
						}
						break;
						case 2://combo
						if (eval('document.evaluation.ans'+i+'_'+j).value!="0#0")
						{
							f_quest_answered =1; 	
						}	
						break;
						case 3://input text field
						if (eval('document.evaluation.ans'+i+'_'+j).value!="")
						{
							f_quest_answered =1; 	
						}
						break;
					}
					
					if (f_quest_answered ==0)
					{
						f_answered = 0;
						break;
					}
				}
			}
		}
	}
	
	if (f_answered == 0)
	{
		document.evaluation.bt_save.disabled=true;
	}
	else
	{
		document.evaluation.bt_save.disabled=false;
	}
	
	
}

function submitInfo()
	{
		//alert(record+','+submitInfo.arguments[1]+','+submitInfo.arguments[2]+','+submitInfo.arguments[3]+','+submitInfo.arguments[4]+','+submitInfo.arguments[5])
		var record_file='';
		var record = submitInfo.arguments[0];
		var pathval = submitInfo.arguments[1];
		var agtid = submitInfo.arguments[2];
		var file = submitInfo.arguments[3];
		var phoneval = submitInfo.arguments[4];
		var encryptval = submitInfo.arguments[5];
		var grp = submitInfo.arguments[6];
		var encmeth = submitInfo.arguments[7];
		var encservid = submitInfo.arguments[8];	
		var tomcaturl = submitInfo.arguments[9];	
		var tomcatpath = submitInfo.arguments[10];	
		var video_filename = submitInfo.arguments[11];	
		var audio_time = submitInfo.arguments[12];	
		var video_time = submitInfo.arguments[13];	
		var servPath = window.opener.top.comm.myApplet.servletPath;
		var proto =  window.opener.top.comm.myApplet.getProto();
		var encparams='' ;
		if(encservid == '' || encservid.length < 1)
		{	//Get parameters from the encryption server associated with the agent group 
			encparams = window.opener.top.comm.myApplet.getEncryptionServerParamsForAgent(grp);
		}
		else
		{
			encparams = window.opener.top.comm.myApplet.getEncryptionServerParamsForServer(encservid);
		}
		var jsEncparams = encparams.split(",");
		var encServerHost = "";
		var encServerPort = "";
		/*if(jsEncparams.length > 1)
		{
			encServerHost = jsEncparams[1];
			encServerPort = jsEncparams[2];
			servPath = jsEncparams[3];
		}*/
		var nextLoc;
		if (video_filename == undefined) {
			if (encryptval == "0") {
				nextLoc ="./wavFileGenerator.jsp?embeded=1&record_id=";
			} else {
				nextLoc ="./decrypt.jsp?record_id=";
			}
		} else {
			nextLoc ="./AVviewer.jsp?record_id=";
		}
		nextLoc +=record;
		nextLoc +="&path=";
		nextLoc +=pathval;
		nextLoc +="&agt=";
		nextLoc +=agtid;
		nextLoc +="&file=";
		nextLoc +=file;
		nextLoc +="&phone=";
		nextLoc +=phoneval;
		nextLoc +="&encval=";
		nextLoc +=encryptval;
		
		nextLoc +="&encmeth=";
		nextLoc +=encmeth;
		nextLoc +="&proto=";
		nextLoc +=proto;
		nextLoc +="&encServerHost=";
		nextLoc +=encServerHost;
		nextLoc +="&encServerPort=";
		nextLoc +=encServerPort;
		nextLoc +="&servletpath=";
		nextLoc +=servPath;
		nextLoc +="&userDbid=";
		nextLoc +=userDbid;
		nextLoc +="&tomcaturl=";
		nextLoc +=tomcaturl;
		nextLoc +="&tomcatpath=";
		nextLoc +=tomcatpath;
		nextLoc +="&video_file=";
		nextLoc +=video_filename;
		nextLoc +="&audio_time=";
		nextLoc +=audio_time;
		nextLoc +="&video_time=";
		nextLoc += video_time;
		nextLoc +="&tenant=";
		nextLoc +="<%=tenantid%>";
		
		
		if( encryptval == '1' && proto != 'https' && proto != 'HTTPS')
		{
			alert(<%=pageData.getWord("To listen to an encrypted record, please login via https !")%>);
			return false;
		}
		//alert('location = '+nextLoc)
		//javascript:window.open(nextLoc,'formWindow','scrollbars=yes,width=100,height=50');//,'scrollbars=yes,width=600,height=400'
		
		if (video_filename == undefined)
			document.getElementById("h_file_reader").src = nextLoc;
		else
			window.location.href = nextLoc;
		 
		//Now send message to cti to inform that this user has listened to the record
		
		try {
			var mainAppletObj;
	
			mainAppletObj = window.opener.top.comm.myApplet;
				
			
			if(mainAppletObj )
			{
				var sret = mainAppletObj.sendRecListenMessageToCti(userDbid, record, file);
			}
		}
		catch (exp){}
	
		return true;
	}

function calculateScore()
{
	
	//fill the group that has childquestions  max socre
	for (var i= 0; i < parseInt(document.evaluation.grpnbr.value) ; i++)
	{
		fillMaxScoreGroup(i);	
	}
	
	fillMaxScoreParentGroup();
	
	//fill the group score that has children
	for (var i= 0; i < parseInt(document.evaluation.grpnbr.value) ; i++)
	{
		fillScoreGroup(i);
	}
	
	fillScoreParentGroup();
	
}




function validateValue(v1,v2)
{
	var val = eval('document.evaluation.ans'+v1+'_'+v2).value;
	
	if (val != "")
	{
		var f_test = IsInteger(val);
		
		if (!f_test) {
			alert("<%=pageData.getWord("Invalid number")%>");
			eval('document.evaluation.ans'+v1+'_'+v2).focus();
			eval('document.evaluation.ans'+v1+'_'+v2).value="";	
			return;
		}
		
		val = roundNumber(parseFloat(val),2);
		if (val >  parseFloat(eval('document.evaluation.ansmaxval'+v1+'_'+v2).value) || val <  parseFloat(eval('document.evaluation.ansminval'+v1+'_'+v2).value) )
		{
		eval('document.evaluation.ans'+v1+'_'+v2).focus();
		eval('document.evaluation.ans'+v1+'_'+v2).value = "";
		alert("<%=pageData.getWord("Value should be between")%> "+eval('document.evaluation.ansminval'+v1+'_'+v2).value+"  "+eval('document.evaluation.ansmaxval'+v1+'_'+v2).value );
		return;
		}
	} 
	validateCondition(v1,0,0);
	
}

function validateCondition(v1,f_without_4,f_only_4)
{
   
   if (f_without_4 !=0 || f_only_4 !=1)
   {
   		fillScoreGroup(v1);
   		fillMaxScoreGroup(v1);
   }
   
   
   var arr = eval('tab_cond'+v1);
   var arr_det = eval('tab_cond_det'+v1);
   
   for (var i=0 ; i < arr.length ; i++)
   {
   		switch (parseInt(arr[i][1])) 
   		{
	   		case 1:// cond not applicable
	   			if (f_only_4 ==0)
	   			{
		   			for (var j=0;j<arr_det.length;j++)
		   			{
		   				if (arr[i][0] == arr_det[j][0])
		   				{
		   					for (var k=0; k<parseInt(eval('document.evaluation.grpquestnbr'+v1).value);k++)
		   					{
		   						if (arr_det[j][1] == eval('document.evaluation.quest'+v1+'_'+k).value)
		   						{
		   							
		   							ans_type = 	parseInt(eval('document.evaluation.anstype'+v1+'_'+k).value);	 
									ansid = "0";
									switch (ans_type)
									{
										case 1://radio
											
										for (var m=0;m<eval('document.evaluation.ans'+v1+'_'+k).length;m++)
										{
											
											if (eval('document.evaluation.ans'+v1+'_'+k)[m].checked)
											{
												arrans = (eval('document.evaluation.ans'+v1+'_'+k)[m].value).split("#");
												ansid = arrans[0];
												break;
											}	
										}
										break;
										case 2://combo
										ansscore = (eval('document.evaluation.ans'+v1+'_'+k).value).split("#");
										ansid = ansscore[0];
										break;
		
									}
									
									if (ansid == arr_det[j][2])
									{
										if (eval('document.evaluation.fhide'+v1+'_'+k).value ==0)
										{
											eval('document.evaluation.grpmaxscore'+v1).value = parseFloat(eval('document.evaluation.grpmaxscore'+v1).value) - parseFloat(eval('document.evaluation.ansmax'+v1+'_'+k).value);
										}
									}
		   							break;
		   						}
		   					}
		   				}
		   			}
		   		}
   			break;
   			case 2: //cond on total % of the group
   			if (f_only_4==0)
   			{
	   			amt = roundNumber(parseFloat(eval('document.evaluation.grpmaxscore'+v1).value)*parseFloat(arr[i][3])/100,2);
	   			amt = parseFloat(amt);
	   			var operator = arr[i][2];
	   			
	   			if (operator=="=") {operator="==";}
	   			if (operator != "" && amt != "") {
	   				str = eval('document.evaluation.grpscore'+v1).value +" "+operator+" " + amt ;
					if (eval(str))
					{
							eval('document.evaluation.grpscore'+v1).value = roundNumber(parseFloat(parseFloat(eval('document.evaluation.grpscore'+v1).value)*parseFloat(arr[i][4])/100),2);	
						
					}
	   			}
			}
   			break;
   			case 3: //if a couple of ans and quest are selected
   			if (f_only_4 ==0)
   			{
	   			found = 0;
	   			for (var j=0;j<arr_det.length;j++)
	   			{
	   				if (arr[i][0] == arr_det[j][0])
	   				{
	   					found = 0;
	   					for (var k=0; k<parseInt(eval('document.evaluation.grpquestnbr'+v1).value);k++)
	   					{
	
	   						if (arr_det[j][1] == eval('document.evaluation.quest'+v1+'_'+k).value)
	   						{
	   							
	   							ans_type = 	parseInt(eval('document.evaluation.anstype'+v1+'_'+k).value);	 
								ansid = "0";
								switch (ans_type)
								{
									case 1://radio
										
									for (m=0;m<eval('document.evaluation.ans'+v1+'_'+k).length;m++)
									{
										
										if (eval('document.evaluation.ans'+v1+'_'+k)[m].checked)
										{
											arrans = (eval('document.evaluation.ans'+v1+'_'+k)[m].value).split("#");
											ansid = arrans[0];
											break;
										}	
									}
									break;
									case 2://combo
									ansscore = (eval('document.evaluation.ans'+v1+'_'+k).value).split("#");
									ansid = ansscore[0];
									break;
	
								}
								
								if (ansid == arr_det[j][2])
								{
									found =1; 
								}
	   							break;
	   						}
	   						
	   					}
	   					if (found ==0)
						{
							break;						
						}
	   					
	   				}
	   			}
	   			
	   			if (found ==1)
	   			{
	   				eval('document.evaluation.grpscore'+v1).value = roundNumber(parseFloat(parseFloat(eval('document.evaluation.grpscore'+v1).value)*parseFloat(arr[i][4])/100),2);	  
	   			}
	   		}
   			break;
   			case 4://show hide answers
   			if (f_without_4 == 0)
   			{
	   			f_hide = 1;
	   			quest_id = 0;
	   			var quest_index = -1;
	   			for (var k=0; k<parseInt(eval('document.evaluation.grpquestnbr'+v1).value);k++)
	   			{
					if (arr[i][5] == eval('document.evaluation.quest'+v1+'_'+k).value)
	   				{
	   					quest_index = k;
	   					ans_type = 	parseInt(eval('document.evaluation.anstype'+v1+'_'+k).value);	 
						ansid = "0";
						switch (ans_type)
						{
							case 1://radio
								
							for (var m=0;m<eval('document.evaluation.ans'+v1+'_'+k).length;m++)
							{
								
								if (eval('document.evaluation.ans'+v1+'_'+k)[m].checked)
								{
									arrans = (eval('document.evaluation.ans'+v1+'_'+k)[m].value).split("#");
									ansid = arrans[0];
									break;
								}	
							}
							break;
							case 2://combo
							ansscore = (eval('document.evaluation.ans'+v1+'_'+k).value).split("#");
							ansid = ansscore[0];
							break;
	
						}
						if (ansid == arr[i][6])
						{
							f_hide =0; 	
						}

						break;	
	   				}
	   			}	
	   			if (quest_index > -1)
	   			{
	   			if (f_hide==0)
				{
					eval('document.evaluation.fhide'+v1+'_'+quest_index).value = 1;
				}
				else
				{
					eval('document.evaluation.fhide'+v1+'_'+quest_index).value = 0;
				}
				}
	   			
	   			
	   			for (var j=0;j<arr_det.length;j++)
	   			{
	   				if (arr[i][0] == arr_det[j][0])
	   				{
	   					for (var k=0; k<parseInt(eval('document.evaluation.grpquestnbr'+v1).value);k++)
	   					{
	   						if (arr_det[j][1] == eval('document.evaluation.quest'+v1+'_'+k).value)
	   						{
		   						if (f_hide==0)
								{
									eval('document.evaluation.fhide'+v1+'_'+k).value = 0;
									document.getElementById("tr"+v1+'_'+k).style.display='';
								}
								else
								{
									eval('document.evaluation.fhide'+v1+'_'+k).value = 1;
									document.getElementById("tr"+v1+'_'+k).style.display='none';
								}
							}
	 					}
	 				}
	   			}
	   			validateCondition(v1,1,0);
	   		}
   			break;
   			
   		}		
   }
   if (f_without_4 ==0)
   {
   		fillMaxScoreParentGroup();
   		fillScoreParentGroup();
   } 
}


function fillScoreGroup(i)
{
	nbr_quest = parseInt(eval('document.evaluation.grpquestnbr'+i).value);
	
	score = 0.0;

	for (j=0;j<nbr_quest;j++)
	{
		ansscore = 0.0;
		ans_type = 	parseInt(eval('document.evaluation.anstype'+i+'_'+j).value);	 
		
		if (eval('document.evaluation.fhide'+i+'_'+j).value ==0)
		{
			switch (ans_type)
			{
				case 1://radio
					
				for (var k=0;k<eval('document.evaluation.ans'+i+'_'+j).length;k++)
				{
					
					if (eval('document.evaluation.ans'+i+'_'+j)[k].checked)
					{
						ansstring = eval('document.evaluation.ans'+i+'_'+j)[k].value;
						ansstringarr =   ansstring.split("#");
						ansscore     = parseInt(ansstringarr[1]);
						break;
					}
					
				}
				break;
				case 2://combo
				ansstring = eval('document.evaluation.ans'+i+'_'+j).value;
				ansstringarr =   ansstring.split("#");
				ansscore     = parseFloat(ansstringarr[1]);
				break;
				case 3://text input
				if (eval('document.evaluation.ans'+i+'_'+j).value =="")
				{
					ansscore = parseFloat(0);
				}
				else
				{
					ansscore = parseFloat(eval('document.evaluation.ans'+i+'_'+j).value);
				}
				break;
			}
			
		}	
		score = score +ansscore ;		
	}
	eval('document.evaluation.grpscore'+i).value = score;	
}

function fillMaxScoreGroup(ii)
{
	nbr_quest = parseInt(eval('document.evaluation.grpquestnbr'+ii).value);

	max_score = 0.0;
	for (var jj=0;jj<nbr_quest;jj++)
	{
				ansmax = 0.0;
				if (eval('document.evaluation.fhide'+ii+'_'+jj).value ==0)
				{
					ansmax = parseFloat(eval('document.evaluation.ansmax'+ii+'_'+jj).value);
				}
				max_score = max_score +ansmax ;		
			
	}
	eval('document.evaluation.grpmaxscore'+ii).value = max_score;
}

function fillMaxScoreParentGroup()
{
	
	for (var i= parseInt(document.evaluation.grpnbr.value)  - 1; i >=0 ; i--)
	{
		current_group_dbid = eval('document.evaluation.grpdbid'+i).value;
		f_first = 0;
		
		for (var j=i+1 ; j < parseInt(document.evaluation.grpnbr.value); j++)
		{
			
			main_group_dbid = eval('document.evaluation.grpmaindbid'+j).value;
			
			if (main_group_dbid==current_group_dbid)
			{
				if (f_first ==0)
				{
					eval('document.evaluation.grpmaxscore'+i).value = 0.0;
					f_first=1;

				}
				eval('document.evaluation.grpmaxscore'+i).value = parseFloat(eval('document.evaluation.grpmaxscore'+i).value)+ parseFloat(eval('document.evaluation.grpmaxscore'+j).value);
			}
		} 	
	}
}

function fillScoreParentGroup()
{
	for (var i=  parseInt(document.evaluation.grpnbr.value) -1; i>=0; i--)
	{
		current_group_dbid = eval('document.evaluation.grpdbid'+i).value;
		f_first = 0;
		for (var j=i+1 ; j < parseInt(document.evaluation.grpnbr.value); j++)
		{
			main_group_dbid = eval('document.evaluation.grpmaindbid'+j).value;
			if (main_group_dbid==current_group_dbid)
			{
				if (f_first ==0)
				{
					eval('document.evaluation.grpscore'+i).value = 0;
					f_first=1;
				}
				
				eval('document.evaluation.grpscore'+i).value = parseFloat(eval('document.evaluation.grpscore'+i).value)+ parseFloat(eval('document.evaluation.grpscore'+j).value);
			}
		} 	
	}
}


function validateConditionAllGroup()
{
	
	//fill the group that has childquestions  max socre
	for (var tt= 0; tt < parseInt(document.evaluation.grpnbr.value) ; tt++)
	{
		if (parseInt(eval('document.evaluation.grpquestnbr'+tt).value) >0)
		{
			validateCondition(tt,0,1);
		}
	}
	
	
	
}
</script>
<%
} //end if view = 0
else
{
	%>
	<script>
	function showDiv(str , pos_x,pos_y) {
		
		
		document.getElementById("divalt").style.left = pos_x + document.body.scrollLeft - 5;
		document.getElementById("divalt").style.top = pos_y + document.body.scrollTop - 5;
		document.getElementById("divalt").style.display = "block";
		document.getElementById("divalt").innerHTML = str;
	} 
	function hideDiv() {
		document.getElementById("divalt").style.display = "none";
	} 
	</script>
	<% 
}
%>

</head>

<body class="toppagebody" >

<form name="evaluation"  method="post">

<%
//no evaluation form
if (form_name.compareTo("")==0) 
{
%>
<table width="90%" cellspacing="0" cellpading="0">
<tr><td align="center"><strong><%=pageData.getWord("No evaluation form")%></strong></td></tr>
</table>
<%
}
else
{
if (view.compareTo("0")==0)
{	
%>
<div class="dynamic-tab-pane-control" width="90%">
    <div class="tab-page" id="general"> 
      <fieldset>
      	<legend title="<%=form_desc%>"> <%=form_name%></legend>
      		<table height="5"><tr><td></td></tr></table>
      		<table width="100%" cellspacing="2"  cellpadding="3" >
				<tr class="question_border2" >
				<td class="reportsLevel2"><%=pageData.getWord("Agent name")%></td>
				<td><%= recEval.getAgentName() %></td>
				<td class="reportsLevel2"><%=pageData.getWord("Call time")%></td>
				<td><%=recEval.getCalltime() %></td>
				<%if(!recEval.getEvalId().equals("")) {%>
				<td class="reportsLevel2"><%=pageData.getWord("Evaluation time")%></td>
				<td><%=recEval.getDate() %></td>
				<td class="reportsLevel2"><%=pageData.getWord("Supervisor name")%></td>
				<td><%=recEval.getUserName() %></td>
				<%
				}%>
				</tr>
			</table>
			<table height="5"><tr><td></td></tr></table>

      		<table ><tr><td class="reportsLevel1">
      		<iframe src=""  name="h_file_reader" id="h_file_reader" width="320" height="45" frameborder="0" scrolling="no"></iframe>
      		</td></tr></table>

			<table cellspacing="1" cellpadding="0" width="100%" >
				<%
				String quest_dbid	= "";
				if (vec_evdet !=null)
				{
					for (int i = 0 ; i <vec_evdet.size();i++)    		
					{
						EvaluationDetails  evdet= vec_evdet.elementAt(i);
						String classname="reportsLevel"+((evdet.getLevel()>2)?2:evdet.getLevel());
						String questionborderclassname ="question_border"+((evdet.getLevel()>2)?2:evdet.getLevel());
						%>
						<tr >
			    				<td width="100%">
			    					<table cellpading="2" cellspacing="0" border="0" width="100%">
			    						<tr>
						    				<td class="<%=classname%>" title="<%=evdet.getQuestgroupdesc() %>">
						    				<%=evdet.getQuestgroupName() %>
						    				&nbsp;<input type="text" name="grpscore<%=i%>" value="<%=evdet.getEvalscore()%>"  size=4  disabled>
						    				<input type="text" name="grpmaxscore<%=i%>" value="<%=evdet.getMaxevalscore()%>"  size=4 disabled>
						    				
						    				</td>
						    				
						    				<%
						    				if (evdet.getAddcomment()==1)
						    				{
						    					%>
						    					<td class="<%=classname%>" align="right">
						    						<textarea cols="<%=(evdet.getCommcolnbr()==0)?20:(evdet.getCommcolnbr()+2)%>" rows="<%=(evdet.getCommrownbr()==0)?2:evdet.getCommrownbr()%>" name="comm<%=i%>" onChange="manageSaveButton()" onKeyDown="limitText(this,500);" onKeyUp="limitText(this,500);"><%=evdet.getEvalcomment()%></textarea>
						    			        </td>
						    					<%
						    				}
						    				%>
				    					</tr>
				    				</table>
				    			</td>	
			    		</tr>
			    		<input type="hidden" name="grpquestnbr<%=i%>" value="<%=evdet.m_listquestionanswer.size()%>">
			    		<input type="hidden" name="level<%=i%>" value="<%=evdet.getLevel()%>">
			    		<input type="hidden" name="grpdbid<%=i%>" value="<%=evdet.getQuestgroupdbid()%>">
			    		<input type="hidden" name="grpmaindbid<%=i%>" value="<%=evdet.getMaingroupdbid()%>">
			    		<input type="hidden" name="evaldet<%=i%>" value="<%=evdet.getEvaldbid() %>">
			    		
						<script>
						   var tab_cond<%=i%> = new Array(<%=evdet.m_listdependency.size()%>);
						   var tab_cond_det<%=i%> = new Array(<%=evdet.getAllCountDepDet()%>);
						   <%
						   int count = 0;
						   int sub_count = 0;
						   for (Dependency dep : evdet.m_listdependency)
				           {%>
							   tab_cond<%=i%>[<%=count%>] = new Array(7);	
							   tab_cond<%=i%>[<%=count%>][0] = "<%=dep.getDbid()%>";tab_cond<%=i%>[<%=count%>][1] = "<%=dep.getDependencyDbid()%>";tab_cond<%=i%>[<%=count%>][2] = "<%=dep.getOperator()%>"; tab_cond<%=i%>[<%=count%>][3] = "<%=dep.getPrcMaxScore()%>";tab_cond<%=i%>[<%=count%>][4] = "<%=dep.getPrcScore()%>";tab_cond<%=i%>[<%=count%>][5] = "<%=dep.getGroupQuestionDetailDbid()%>";tab_cond<%=i%>[<%=count%>][6] = "<%=dep.getAnswerDetailDbid()%>";
							   <%
							  count++;
				        		for (DependencyDetails depdet : dep.getDependencyDetails())
				            	{%>
				        			tab_cond_det<%=i%>[<%=sub_count%>] = new Array(3);
				        			tab_cond_det<%=i%>[<%=sub_count%>][0] = "<%=dep.getDbid()%>";tab_cond_det<%=i%>[<%=sub_count%>][1] = "<%=depdet.getGroupQuestionDetailDbid()%>";tab_cond_det<%=i%>[<%=sub_count%>][2] = "<%=depdet.getAnswerDetailDbid()%>";
				        			<%
				        			sub_count++;
				            	}
				        	}%>
						</script>
						<% 
						if (evdet.m_listquestionanswer !=null)
						{
							if (evdet.m_listquestionanswer.size() >0)
							{	
								%>
								<tr>
		    					<td width="100%" class="<%=questionborderclassname%>">
		    					
			    				<table cellpading="2" cellspacing="1" border="0" width="100%" >
								<%
								for (int j=0;j<evdet.m_listquestionanswer.size();j++)
								{
								%>	
							    	<tr id="tr<%=i%>_<%=j%>">
							    	<%/*for (int k = 1; k <= evdet.getLevel(); k++){%><td width="5"></td><%}*/%>		
									<td class="question" align="left" width="40%"><%=evdet.m_listquestionanswer.elementAt(j).getQuestiondesc()%></td>

									<td class="question" align="left" width="40%"><%
									Answer ans = evdet.m_listquestionanswer.elementAt(j).getAnswer();      
									String type = evdet.m_listquestionanswer.elementAt(j).getAnstype();
									int max_ans = 0;
									
									if (type.compareTo("1")==0  || type.compareTo("2")==0 ) //radio or combo box
									{
										
										if (type.compareTo("2")==0 )
										{
											%>
											<select name="ans<%=i%>_<%=j%>" onChange="validateCondition(<%=i%>,0,0);manageSaveButton();">
												<option value="0#0"></option>
											<% 
										}
										
										if (ans.getAnswerDetail() !=null)
										{
											for (int m=0; m< ans.getAnswerDetail().size();m++)
											{
											
												int score = Integer.parseInt(ans.getAnswerDetail().elementAt(m).getRank());
												
												if (score > max_ans) {max_ans = score;}
												
												if (type.compareTo("1")==0 )
												{
													%>
													<input type="radio" name="ans<%=i%>_<%=j%>" value="<%=ans.getAnswerDetail().elementAt(m).getDbid()%>#<%=ans.getAnswerDetail().elementAt(m).getRank()%>" 
													<%=((ans.getAnswerDetail().elementAt(m).getDbid()).compareTo(evdet.m_listquestionanswer.elementAt(j).getEvaldetanswer())==0)?"checked":""%>  onclick="validateCondition(<%=i%>,0,0);manageSaveButton();" title="<%=ans.getAnswerDetail().elementAt(m).getDescription()%>" ><%=ans.getAnswerDetail().elementAt(m).getName()%>
													<%
												}
												else
												{
													%>
													<option value="<%=ans.getAnswerDetail().elementAt(m).getDbid()%>#<%=ans.getAnswerDetail().elementAt(m).getRank()%>" 
													<%=((ans.getAnswerDetail().elementAt(m).getDbid()).compareTo(evdet.m_listquestionanswer.elementAt(j).getEvaldetanswer())==0)?"selected":""%> > <%=ans.getAnswerDetail().elementAt(m).getName()%></option>
													<%
												}
											
												
											}
										}
										
										if (type.compareTo("2")==0 )
										{
											%>
											</select>
											<% 
										}						
									}
							    	%>
							    	<input type="hidden" name="quest<%=i%>_<%=j%>" value="<%=evdet.m_listquestionanswer.elementAt(j).getQuestiondbid()%>">
							    	<input type="hidden" name="fhide<%=i%>_<%=j%>" value="0">
							    	
							    	<input type="hidden" name="evaldet<%=i%>_<%=j%>" value="<%=evdet.m_listquestionanswer.elementAt(j).getEvaldetdbid()%>">
									<input type="hidden" name="anstype<%=i%>_<%=j%>" value="<%=type%>">
									<input type="hidden" name="anslength<%=i%>_<%=j%>" value="<%=ans.getAnswerDetail().size() %>">
									<% 
									if (type.compareTo("3")==0 )
									{
										
										String val = String.valueOf(evdet.m_listquestionanswer.elementAt(j).getEvalscore());
										if (val.endsWith(".00")) {
											val = val.substring(0,val.indexOf(".00"));
										}
										
										%><%=evdet.m_listquestionanswer.elementAt(j).getAnsmin()%><= <input type="text" name="ans<%=i%>_<%=j%>" value="<%=val%>"  size=5 onBlur="validateValue(<%=i%>, <%=j%>);manageSaveButton();">
										<=<%=evdet.m_listquestionanswer.elementAt(j).getAnsmax()%>
										<%
										max_ans = Integer.parseInt(evdet.m_listquestionanswer.elementAt(j).getAnsmax());
										%>
										<input type="hidden" name="ansmaxval<%=i%>_<%=j%>" value="<%=evdet.m_listquestionanswer.elementAt(j).getAnsmax()%>">
										<input type="hidden" name="ansminval<%=i%>_<%=j%>" value="<%=evdet.m_listquestionanswer.elementAt(j).getAnsmin()%>">
										
										<% 
									}
									%>
									<input type="hidden" name="ansmax<%=i%>_<%=j%>" value="<%=max_ans %>">
							    	</td>
							    	<%
				    				if (evdet.m_listquestionanswer.elementAt(j).getAddcomment()==1)
				    				{
				    					%>
				    					<td align="right" class="question">
				    						<textarea cols="<%=(evdet.m_listquestionanswer.elementAt(j).getCommcolnbr()==0)?20:(evdet.m_listquestionanswer.elementAt(j).getCommcolnbr()+2)%>" rows="<%=(evdet.m_listquestionanswer.elementAt(j).getCommrownbr()==0)?2:evdet.m_listquestionanswer.elementAt(j).getCommrownbr()%>" name="comm<%=i%>_<%=j%>" onChange="manageSaveButton()" onKeyDown="limitText(this,512);" onKeyUp="limitText(this,512);"><%=evdet.m_listquestionanswer.elementAt(j).getEvalcomment()%></textarea>
				    			        </td>
				    					<%
				    				}
							    	%>
									</tr>
									
									<%
								}
								%>
								</table>
								</td></tr>
								
								<%
							}
						}
						%>
						<tr><td height="5"></td></tr>
						<% 

					}
				}
				%>
				<tr height="15"><td></td></tr>
				<input type="hidden" value="<%=vec_evdet.size()%>" name="grpnbr">
				<input type="hidden" value="<%=recEval.getFormId()%>" name="frmdbid">
				<input type="hidden" value="<%=recEval.getEvalId()%>" name="evaldbid">
				
			</table>
				<table>
				<tr>
					<td valign=top>&nbsp;<%=pageData.getWord("COMMENTS")%></td>
					<td>
						<textarea rows="5" name="comments" cols="45" onChange="manageSaveButton()" onKeyDown="limitText(this,512);" onKeyUp="limitText(this,512);"><%=recEval.getComment()%></textarea>
					</td>
				</tr>
				</table>
  </fieldset>
     
	     <table width="100%">
			<tr valign="top">
				<td width="100%" align="left">
					<input  disabled type="button" name="bt_save" onClick="javascript:doSubmit()" value="<%=pageData.getWord("Save")%>">
					<input   type="button" name="bt_close" onClick="javascript:doClose()" value="<%=pageData.getWord("Close")%>">
				</td>
			</tr>
		</table>
	
    </div>
    
</div>
<%
}//end if view ==0
else//view==1
{
	//start display part
	%>

<div class="dynamic-tab-pane-control" width="90%">

<div class="tab-page" id="general"> 
<div id="divalt" style="position:absolute;display:none;padding:5;" class="divComment"></div>
<fieldset>
<legend> <%=form_name%></legend>
<table height="5"><tr><td></td></tr></table>
<table width="100%" cellspacing="2"  cellpadding="3" >
	<tr class="question_border2" >
	<td class="reportsLevel2"><%=pageData.getWord("Agent name")%></td>
	<td><%= recEval.getAgentName() %></td>
	<td class="reportsLevel2"><%=pageData.getWord("Call time")%></td>
	<td><%=recEval.getCalltime() %></td>
	<td class="reportsLevel2"><%=pageData.getWord("Evaluation time")%></td>
	<td><%=recEval.getDate() %></td>
	<td class="reportsLevel2"><%=pageData.getWord("Supervisor name")%></td>
	<td><%=recEval.getUserName() %></td>
	</tr>
</table>
<table height="5"><tr><td></td></tr></table>
<table cellspacing="1" cellpadding="0" width="100%" >
<!-- Start dispay details -->

<table cellspacing="1" cellpadding="4" width="100%" >
<%

int maxlabel = recEval.getMaxLabelCount();
String quest_dbid	= "";
int f_total	 = 0;
EvaluationDetails  previous_evdet = null;
if (vec_evdet !=null)
{
	for (int i = 0 ; i <vec_evdet.size();i++)    		
	{
		EvaluationDetails  evdet= vec_evdet.elementAt(i);
		String classname="reportsLevel"+((evdet.getLevel()>2)?2:evdet.getLevel());
		String questionborderclassname ="question_border"+((evdet.getLevel()>2)?2:evdet.getLevel());
		
		if (i >0)
		{
			EvaluationDetails temp_previous_evdet = vec_evdet.elementAt(i-1);
			EvaluationDetails temp_evdet = vec_evdet.elementAt(i);
			
			if (temp_previous_evdet.getLevel() > temp_evdet.getLevel())
			{
				/*display total previous level*/
				if ( temp_previous_evdet.getDisptotal()==1 && temp_previous_evdet.m_listquestionanswer.size() ==0 )
				{	
				
				String classname1="reportsLevel"+((temp_previous_evdet.getLevel()>2)?2:temp_previous_evdet.getLevel());
				%><tr class="<%=classname1%>" ><td title="<%= temp_previous_evdet.getQuestgroupdesc() %>"><%= temp_previous_evdet.getQuestgroupName() %></td>
				<td align="center"><%=temp_previous_evdet.getMaxevalscore() %></td>
				<%
				
				int  countlab = temp_previous_evdet.m_listscorelabel.getLabelDetail().size();
				for (int k=0; k <temp_previous_evdet.m_listscorelabel.getLabelDetail().size();k++)
				{
					%><td align="center"><%= temp_previous_evdet.getScoreLabel(temp_previous_evdet.m_listscorelabel.getLabelDetail().elementAt(k).getDbid()) %></td><%	
				}
				if (temp_previous_evdet.m_listscorelabel.getLabelDetail().size() <=0)
				{
					countlab = 1;
					%><td align="center" ><%= temp_previous_evdet.getEvalscore() %></td><%	
					
				}
				
				if (maxlabel > countlab) {
					%><td colspan="<%=maxlabel - countlab%>"></td><%					
				}
				%>
				<td align="center"><%=temp_previous_evdet.getScoreMaxScorePrc()%></td>			
				</tr>
				<%
				}
				%>
				 <tr><td height="10"></td></tr>
				<%
				/*end display total previous level*/
				
				int minlevel = temp_previous_evdet.getLevel();
				int samelevel = 0;
				for(int j=i-2;j>=0;j--)
				{
					EvaluationDetails temp_prv = vec_evdet.elementAt(j);
					if(minlevel > temp_prv.getLevel() && temp_prv.getLevel()>= temp_evdet.getLevel() )
					{
						/*display total previous level*/
						if ( temp_prv.getDisptotal()==1 && temp_prv.m_listquestionanswer.size() ==0 )
						{	
						
						String classname1="reportsLevel"+((temp_prv.getLevel()>2)?2:temp_prv.getLevel());
						%><tr class="<%=classname1%>"><td title="<%= temp_prv.getQuestgroupdesc() %>"><%= temp_prv.getQuestgroupName() %></td>
						<td align="center"><%=temp_prv.getMaxevalscore() %></td>
						<%
						int  countlab = temp_prv.m_listscorelabel.getLabelDetail().size();
						for (int k=0; k <temp_prv.m_listscorelabel.getLabelDetail().size();k++)
						
						{
							%><td align="center"><%= temp_prv.getScoreLabel(temp_prv.m_listscorelabel.getLabelDetail().elementAt(k).getDbid()) %></td><%	
						}
						if (temp_prv.m_listscorelabel.getLabelDetail().size() <=0)
						{
							countlab=1;
							%><td align="center" ><%= temp_prv.getEvalscore() %></td><%	
							
						}
						if (maxlabel > countlab) {
							%><td colspan="<%=maxlabel - countlab%>"></td><%					
						}
						%>	
						<td align="center"><%=temp_prv.getScoreMaxScorePrc()%></td>				
						</tr>
						<%
						}
						%>
						 <tr><td height="10"></td></tr>
						<%
						/*end display total previous level*/
						minlevel =temp_prv.getLevel();
						if (minlevel== temp_evdet.getLevel())
						{
							samelevel = 1;
						}
						
					}
					else
					{
						minlevel=0;
					}
					
					
					
					
					if (samelevel==0 && temp_prv.getLevel() == temp_evdet.getLevel())
					{
						samelevel=1;
						/*display total previous level*/
						if ( temp_prv.getDisptotal()==1 && temp_prv.m_listquestionanswer.size() ==0 )
						{	
						
						String classname1="reportsLevel"+((temp_prv.getLevel()>2)?2:temp_prv.getLevel());
						%><tr class="<%=classname1%>"><td title="<%= temp_prv.getQuestgroupdesc() %>"><%= temp_prv.getQuestgroupName() %></td>
						<td align="center"><%=temp_prv.getMaxevalscore() %></td>
						<%
						int  countlab = temp_prv.m_listscorelabel.getLabelDetail().size();
						for (int k=0; k <temp_prv.m_listscorelabel.getLabelDetail().size();k++)
						
						{
							%><td align="center"><%= temp_prv.getScoreLabel(temp_prv.m_listscorelabel.getLabelDetail().elementAt(k).getDbid()) %></td><%	
						}
						if (temp_prv.m_listscorelabel.getLabelDetail().size() <=0)
						{
							countlab=1;
							%><td align="center" ><%= temp_prv.getEvalscore() %></td><%	
							
						}
						if (maxlabel > countlab) {
							%><td colspan="<%=maxlabel - countlab%>"></td><%					
						}
						%>
						<td align="center"><%=temp_prv.getScoreMaxScorePrc()%></td>					
						</tr>
						<%
						}
						%>
						 <tr><td height="10"></td></tr>
						<%
						/*end display total previous level*/
					}
					if(minlevel==0 && samelevel==1) {break;}
						
					
				}
			
				
				
			}	
			
		}
		
		
		previous_evdet = evdet;
		%>
		<tr class="<%=classname%>">
			<td>	
			<table  width="100%"><tr class="<%=classname%>" ><td ><span title="<%=evdet.getQuestgroupdesc()%>"><%=evdet.getQuestgroupName()%></span>
			<%
			
							
			
			
			if (!evdet.getEvalcomment().equals("")) {
				String comm = evdet.getEvalcomment();
				
				comm = comm.replace("'","\\'");
				comm = comm.replace("\"","\\'");
				comm = comm.replace("\n","<br>");
				comm = comm.replace("\r","");
				
				%><img border="0" src="../img/comments.gif" onMouseOver="showDiv('<%=comm%>',event.clientX , event.clientY);"  onmouseout="hideDiv();" ><%
			}
			%>
			</td>
				
				<td align="right" nowrap><%=(evdet.m_listquestionanswer.size()>0)?pageData.getWord("Question score"):"" %></td></tr></table></td>
				<%
				
				f_total = 0;
				int maxlevel = evdet.getLevel();
				
				
				if (maxlevel!=0)
				{	
				for (int j = i-1 ; j>=0 ; j--)
				{
					EvaluationDetails temp = vec_evdet.elementAt(j);
					
					if (temp.getLevel() < maxlevel )
					{
						if (temp.getLabeldbid().compareTo(evdet.getLabeldbid())==0 && temp.getDisptotal()==1)
						{
							f_total =1;
							break;
						}
					}	
					maxlevel = temp.getLevel();

				}
				}	
				if (evdet.getDisptotal()==1 && f_total==0)
				{
					
					%><td align="center"><%=pageData.getWord("Total score")%></td><%
					int  countlab = evdet.m_listscorelabel.getLabelDetail().size();
					
					for (int j=0; j <evdet.m_listscorelabel.getLabelDetail().size();j++)
					{
						%><td align="center"><%= evdet.m_listscorelabel.getLabelDetail().elementAt(j).getName() %></td><%	
					}
					if (evdet.m_listscorelabel.getLabelDetail().size() <= 0)
					{
						countlab = 1;
						%><td ><%=pageData.getWord("Score")%></td><%
					}
					if (maxlabel > countlab) {
						%><td colspan="<%=maxlabel - countlab%>"></td><%					
					}
					%>
					<td ><%=pageData.getWord("%")%></td>
					<%
				}
				else
				{
				%><td colspan=<%=maxlabel+2%>></td><%	
				}
				%>
				
		</tr>
		<%
		if (evdet.m_listquestionanswer.size()>0)
		{
			%>
			<tr class="<%=questionborderclassname%>"><td>
			<table width="100%" class="regulartext">
			<%
			for (QuestionDetails q : evdet.m_listquestionanswer)
			{
				%><tr><td><%=q.getQuestiondesc()%>
				<%
				if (!q.getEvalcomment().equals("")) {
					String comm = q.getEvalcomment();
					
					comm = comm.replace("'","\\'");
					comm = comm.replace("\"","\\'");
					comm = comm.replace("\n","<br>");
					comm = comm.replace("\r","");	
					
				%><img border="0" src="../img/comments.gif" onMouseOver="showDiv('<%=comm%>',event.clientX , event.clientY);"  onmouseout="hideDiv();" ><%
				}
				%>
				</td><td align="right"><%=q.getEvalscore() %></td></tr><%
			}
			%>
			</table>
			</td>
			<td align="center"><%=evdet.getMaxevalscore() %></td>
			<%
			int  countlab = evdet.m_listscorelabel.getLabelDetail().size();
			
			for (int j=0; j <evdet.m_listscorelabel.getLabelDetail().size();j++)
			{
				%><td align="center"><%= evdet.getScoreLabel(evdet.m_listscorelabel.getLabelDetail().elementAt(j).getDbid()) %></td><%	
			}
			if (evdet.m_listscorelabel.getLabelDetail().size() <=0)
			{
				countlab = 1;
				%><td align="center" ><%= evdet.getEvalscore() %></td><%	
				
			}
			if (maxlabel > countlab) {
				%><td colspan="<%=maxlabel - countlab%>"></td><%					
			}
			%>
			<td align="center"><%=evdet.getScoreMaxScorePrc()%></td>			
			</tr>
			<%
		}
		
		
		
		
		
		
		%><tr><td height="10"></td></tr> <%

	}			
}

int oldlevel = -1;
int maxlevel = -1;
for (int i = vec_evdet.size()-1 ; i>=0 ; i--)
{
	EvaluationDetails temp = vec_evdet.elementAt(i);
	
	if ((temp.getLevel() < oldlevel || oldlevel == -1) && (maxlevel ==-1 || maxlevel>temp.getLevel()) )
	{
		maxlevel = temp.getLevel();
		String classname="reportsLevel"+((temp.getLevel()>2)?2:temp.getLevel());
		String questionborderclassname ="question_border"+((temp.getLevel()>2)?2:temp.getLevel());
		
		if ( temp.getDisptotal()==1 && temp.m_listquestionanswer.size()<=0)
		{	
		%><tr class="<%=classname%>"><td title="<%= temp.getQuestgroupdesc() %>"><%= temp.getQuestgroupName() %></td>
			<td align="center"><%=temp.getMaxevalscore() %></td>
			<%
			int  countlab = temp.m_listscorelabel.getLabelDetail().size();
			
			for (int k=0; k <temp.m_listscorelabel.getLabelDetail().size();k++)
			
			{
				%><td align="center"><%= temp.getScoreLabel(temp.m_listscorelabel.getLabelDetail().elementAt(k).getDbid()) %></td><%	
			}
			if (temp.m_listscorelabel.getLabelDetail().size() <=0)
			{
				%><td align="center"><%= temp.getEvalscore() %></td><%	
				countlab = 1;
				
			}
			if (maxlabel > countlab) {
				%><td colspan="<%=maxlabel - countlab%>"></td><%					
			}
			%>	
			<td align="center"><%=temp.getScoreMaxScorePrc() %></td>			
			</tr>
			<tr><td height="10"></td></tr>
		<%
		}
	}
	
	oldlevel = temp.getLevel();

}


%>
<!--  </table></td></tr>-->
<tr height="15"><td></td></tr>	
			
</table>
<%
if (!recEval.getComment().equals("") ) {
	%>
	<table width="100%"><tr><td class="reportsLevel2" valign="top"><%=pageData.getWord("Comments")%></td></tr><tr><td ><%=recEval.getComment() %></td></tr></table>
	<%
}
%>

<!-- End display of the details -->
</table>
</fieldset>
</div>
</div>
	
	<%
	//end display part
}//end view==1
}//end if form exists
%>
<input type="hidden" name="url" value="<%=tomcaturl %>">
<input type="hidden" name="path" value="<%=tomcatpath %>">
<input type="hidden" name="recid" value="<%=recid %>">
<input type="hidden" name="tracknum" value="<%=tracknum %>">
<input type="hidden" name="agtid" value="<%=agtid %>">
<input type="hidden" name="grpid" value="<%=grpid %>">
<input type="hidden" name="tenant" value="<%=tenantid %>">

</form>
<%
if (view.compareTo("0")==0 && form_name.compareTo("")!=0) 
{	
%>
<script>
   submitInfo('<%=recid%>','<%=recEval.getPath()%>','<%=agtid%>','<%=recEval.getFilename()%>','<%=recEval.getPhonenumber()%>','<%=recEval.getEncryption()%>','<%=grpid%>','<%=recEval.getEncmethod()%>','<%=recEval.getEncserverdbid()%>','<%=tomcaturl%>','<%=tomcatpath%>');
   validateConditionAllGroup();
   <%
   if (recEval.getEvalId().compareTo("")==0)
   { 
   %>
   		calculateScore();
   <%
   }
   %>
</script>
<%
}

pageData.closeConnection();
%>

</body>
</html>
