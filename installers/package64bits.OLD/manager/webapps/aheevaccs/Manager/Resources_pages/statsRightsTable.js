// JavaScript Document

var RIGHTS = new Array();

function setRights(userRole)
{
	switch(userRole)
	{
		case '0':
			RIGHTS["AGENTS"] = true;
			RIGHTS["AGENT_GROUPS"] = true;
			RIGHTS["QUEUES"] = true;
			RIGHTS["CAMPAIGN"] = true;
			RIGHTS["CALLINGLIST"] = true;
			RIGHTS["PERFORMANCE"] = true;
			RIGHTS["TEAMS"] = true;
			RIGHTS["ADHERENCE"] = true;
		break;
		case '10':
			RIGHTS["AGENTS"] = true;
			RIGHTS["AGENT_GROUPS"] = true;
			RIGHTS["QUEUES"] = true;
			RIGHTS["CAMPAIGN"] = true;
			RIGHTS["CALLINGLIST"] = true;
			RIGHTS["PERFORMANCE"] = true;
			RIGHTS["TEAMS"] = true;
			RIGHTS["ADHERENCE"] = true;
		break;
		case '20':
			RIGHTS["AGENTS"] = true;
			RIGHTS["AGENT_GROUPS"] = true;
			RIGHTS["QUEUES"] = true;
			RIGHTS["CAMPAIGN"] = true;
			RIGHTS["CALLINGLIST"] = true;
			RIGHTS["PERFORMANCE"] = true;
			RIGHTS["TEAMS"] = true;
			RIGHTS["ADHERENCE"] = true;
		break;
		case '30':
			RIGHTS["AGENTS"] = true;
			RIGHTS["AGENT_GROUPS"] = true;
			RIGHTS["QUEUES"] = true;
			RIGHTS["CAMPAIGN"] = true;
			RIGHTS["CALLINGLIST"] = true;
			RIGHTS["PERFORMANCE"] = true;
			RIGHTS["TEAMS"] = true;
			RIGHTS["ADHERENCE"] = true;
		break;
		case '40':
			RIGHTS["AGENTS"] = true;
			RIGHTS["AGENT_GROUPS"] = true;
			RIGHTS["QUEUES"] = true;
			RIGHTS["CAMPAIGN"] = true;
			RIGHTS["CALLINGLIST"] = true;
			RIGHTS["PERFORMANCE"] = true;
			RIGHTS["TEAMS"] = true;
			RIGHTS["ADHERENCE"] = true;
		break;
		default:
			RIGHTS["AGENTS"] = true;
			RIGHTS["AGENT_GROUPS"] = true;
			RIGHTS["QUEUES"] = true;
			RIGHTS["CAMPAIGN"] = true;
			RIGHTS["CALLINGLIST"] = true;
			RIGHTS["PERFORMANCE"] = true;
			RIGHTS["TEAMS"] = true;
			RIGHTS["ADHERENCE"] = true;
		
	}
	
	//Retrieve denied services
	var deniedServices = String( appletObj.getDeniedServices() );
	var deniedServicesArray = deniedServices.split("^");
	var i; 
	for(i = 0; i < deniedServicesArray.length; i++)
	{
		if(deniedServicesArray[i] == "TENANT_RESSOURCES_CAMPAIGNS")
		{
			RIGHTS["CAMPAIGN"] = false;
			RIGHTS["PERFORMANCE"] = false;
		}
		if(deniedServicesArray[i] == "TENANT_RESSOURCES_CALLING_LISTS")
			RIGHTS["CALLINGLIST"] = false;
		if(deniedServicesArray[i] == "TENANT_WORK_FORCE")
		{
			RIGHTS["ADHERENCE"] = false;
			RIGHTS["TEAMS"] = false;
		}
	}
	
}