
function addRows()
{
	lyr=document.createElement("DIV");
 	lyr.id ='t';
	var code='';
	
	var blacklistNumber = document.theForm.blacklistNumber.value;
	if ( !IsNumeric(blacklistNumber) )
	{
		alert("The number must be numeric !!!");
		document.theForm.blacklistNumber.value = "";
		return;
	}
	var campaigns = String(appletObj.getCampaignsFromBlacklistNumber(blacklistNumber));
	campaigns += "";
	// campaign contient les noms des campagnes dans les quelles ce numéro est blacklist
	//alert("chaine = "+campaigns);
	var arrayCampaigns = campaigns.split("|");
	//alert("Campagnes concernees : "+arrayCampaigns)

	var j = 0;
	var campaignToDisplay = new(Array);
	var idCampaignToDisplay = new(Array);
	for (i = 0; i < arrayCampaigns.length; i++)
	{
		arrayCurrentCampaign = arrayCampaigns[i].split(",");
		var affiche = true;
		for (k = 0; k < campaignToDisplay.length; k++)
		{
			if (arrayCurrentCampaign[0] == campaignToDisplay[k])
			{
				affiche = false;
			}
		}
		if (affiche == true)
		{
			campaignToDisplay[j] = arrayCurrentCampaign[0];
			idCampaignToDisplay[j] = arrayCurrentCampaign[1];
			j++;
		}
	}
		
	code ="<table width='100%'>";
	
	if (campaignToDisplay.length > 1)
	{
		code += "<tr><td colspan = '2' width='100%' align = 'center'><b>This number cannot be reached for these campaigns</b></td></tr>";
		for(i = 0; i < campaignToDisplay.length; i++)
		{
			if (campaignToDisplay[i] != '') //affiche == true
			{
				
				code += "<TR><TD width='50%' align = 'right'>";
				code += "&nbsp; "+ campaignToDisplay[i];
				code +="</TD><TD width='50%' align = 'left'>";
				code += "<input type = 'checkbox' id = 'monId"+idCampaignToDisplay[i]+"' checked>";
				code +="</TD></TR>";
			}
		}
	}
	else
	{
		code += "<tr><td colspan='2' width='100%' align = 'center'><b>This number is not assigned to any campaign.</b></td></tr>";
	}
	code +="</table>";

   	lyr.innerHTML = code;
	var div_name = 'campaign_ranges';
  	document.getElementById(div_name).appendChild(lyr);
	
	
	document.getElementById("searchBlacklistNumberInCampaign").disabled = true;
	document.getElementById("refresh_blacklist_number").disabled = false;
}


function removeFromBlacklistCampaign()
{
	var number = document.getElementById("blacklistNumber").value;
	var tab = document.getElementsByTagName("input");
	//var listToReturn = document.getElementById("blacklistNumber").value + "|";
	var cmp_dbid = "";
	var group_dbid = "";
	for (i = 0; i < tab.length; i++)
	{
		if (tab[i].id.indexOf("monId") == 0)
		{
			//alert("id = "+tab[i].id);
			cmp_dbid = tab[i].id.substr(5);
			//alert("cmp_id = "+cmp_dbid);
			group_dbid = appletObj.getGroupDbidFromCampaignAndNumber(cmp_dbid, number);
			if (tab[i].checked == false)
			{
				appletObj.removeFromBlacklistCampaign(cmp_dbid, group_dbid);
			}
		}
	}


}


function clear_form()
{
	var code='';
	lyr=document.createElement("DIV");

	code ="<table width='100%'>";
	code +="</table>";
	
   	lyr.innerHTML = code;
	var div_name = 'campaign_ranges';
	document.getElementById(div_name).removeChild(document.getElementById("t"))
  	document.getElementById(div_name).appendChild(lyr);

	document.theForm.blacklistNumber.value = "";
	document.getElementById("searchBlacklistNumberInCampaign").disabled = false;
	document.getElementById("refresh_blacklist_number").disabled = true;

}

