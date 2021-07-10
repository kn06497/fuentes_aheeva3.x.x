// JavaScript Document

function ArchiSite()
{
	this.siteUid = 0;
	this.site_dbid = "";
	this.site_name = "";
	
	
	this.xPos = 0;
	this.yPos = 0;
	
	/*
	this.buildHTML = function()
	{
		var sReturn = "";
		
		var nb_pbx_in_site = 0;
		var inside_text = "";
		inside_text += '<table width="100%">';
		for(var i = 0; i < SwitchList.length; i++)
		{
			if(SwitchList[i].siwtch_site_uId == this.siteUid)
			{				
				nb_pbx_in_site++;
				inside_text += '<tr><td>'+SwitchList[i].buildHTML()+'</td><td>bout</td></tr>';
			}			
		}
		inside_text += '</table>';
		
		sReturn += '<div id="ArchiSite_'+this.siteUid+'" class="ArchiSite" style="top:'+this.yPos+'px; left:'+this.xPos+'px;">';
		sReturn += '<table width="100%" height="100%" cellpadding="0" cellspacing="0">';
		sReturn += '<tr><td>Site: <input name="ArchiSite_name_'+this.siteUid+'" value="'+this.site_name+'" ';
		sReturn += 'class="archi_input_title" onBlur="setSiteName('+this.siteUid+')"> <br> <i>['+nb_pbx_in_site+' switch';
		if(nb_pbx_in_site > 1)
			sReturn += 'es';
		sReturn += ']</i></td></tr>';
		sReturn += '<tr><td style="border:3px solid #41638C " height="95%" style="position:relative">';
		sReturn += '<div id="insideText_site_'+this.siteUid+'" class="insideSite">';
		sReturn += inside_text;
		sReturn += '</div></td></tr>';	
		sReturn += '</table>';
		sReturn += '</div>';
		
		
		return sReturn;
	}
	*/
	
	/*
	this.makeCenter = function(leftTab)
	{
		if(leftTab == null)
			leftTab = 0;
			
		var diagramObj = document.getElementById('diagramInside');
		var networkLnkObj = document.getElementById('NetworkLink');
		var siteObj = document.getElementById('ArchiSite_'+this.siteUid);	
		
		siteObj.style.left 	= leftTab*(siteObj.clientWidth+5);
		siteObj.style.top 	= theNetworkLink.yPos + networkLnkObj.clientHeight + 20;
		
		this.xPos  	= leftTab*(siteObj.clientWidth+5);
		this.yPos	= theNetworkLink.yPos + networkLnkObj.clientHeight + 20;
	}
	*/
}

function add_site()
{
	var newOne = new ArchiSite();
	SitesList.push(newOne);
	newOne.siteUid = SitesList.length;
	document.getElementById('inside_sites_html').innerHTML = buildSitesHTML();
}

function buildSitesHTML()
{
	var sRet = "";
	
	
	
	if(SitesList.length > 0)
	{
		sRet += '<table width="100%">';
		for(var i = 0 ; i < SitesList.length; i++)
		{
			sRet += '<tr>';
			sRet += '<td>';
			sRet += '<input type="text" old_uid="'+SitesList[i].siteUid+'" old_dbid="'+SitesList[i].site_dbid+'" old_name="'+SitesList[i].site_name+'" ';
			sRet += 'name="site_input_'+SitesList[i].site_dbid+'" value="'+SitesList[i].site_name+'"';
			sRet += ' class="archi_input_title"></td>';
			sRet += '<td>';
			sRet += '<img onClick="removeSite('+SitesList[i].siteUid+')" style="cursor:pointer" ';
			sRet += 'src="../img/delete2.gif" alt="Delete site '+SitesList[i].site_name+'" border="0"></td>';
			sRet += '</tr>';
		}
		sRet += '</table>';
	}
	
	return sRet;
}

function addAllSitesToVector()
{
	/*
	var j = SitesList.length;
	while(j > 0)
	{
		SitesList[j] = null;
		j--;
	}
	*/
	
	var sitesString = String( appletObj.getAllSites() );	
	if (sitesString.length > 0 ){
		var sitesStringSplit = sitesString.split('|');
		for(var k = 0 ; k < sitesStringSplit.length; k++)
		{
			var spl_Ar = sitesStringSplit[k].split('^');
			var theNewOne = new ArchiSite();
			theNewOne.siteUid 	= SitesList.length;
			theNewOne.site_dbid = spl_Ar[0];
			theNewOne.site_name = spl_Ar[1];
			SitesList.push(theNewOne);			
		}
	}
}