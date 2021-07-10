// JavaScript Document


function XMLtoExpression(rNoodle)
{
	var sReturn = '';		
	var i;
					
	if(rNoodle.name == 'ROOT')	//C'est la base ici...
	{
		for(i = 0; i < rNoodle.contents.length; i++)
		{
			sReturn += XMLtoExpression(rNoodle.contents[i]);
		}
	}
	else
	{
		if(rNoodle.name == 'RequiredSkills')
		{				
			sReturn += '(';
			for(i = 0; i < rNoodle.contents.length; i++)
			{					
				sReturn += XMLtoExpression(rNoodle.contents[i]);
				if(i != rNoodle.contents.length-1)
					sReturn += ' '+rNoodle.attributes['op']+ ' ';									
			}
			sReturn += ')';			
		}
		else if(rNoodle.name == 'skill')
		{
			if(rNoodle.attributes['dbid'] != 'AgentGroup' && rNoodle.attributes['dbid'] != 'Agent')			
				sReturn += appletObj.getSkillNameByDBID(rNoodle.attributes['dbid']);
			else
				sReturn += rNoodle.attributes['dbid'];
							
			switch(rNoodle.attributes['rel'])
			{
			case 'sup':				
				sReturn += '>';
			break;
			case 'inf':
				sReturn += '<';
			break;
			case 'eq':
				sReturn += '=';
			break;
			default:
				sReturn += '???';
			break;				
			}
			
			if(rNoodle.attributes['dbid'] != 'AgentGroup')
				sReturn += rNoodle.attributes['value'];	
			else
				sReturn += appletObj.getAgentGroupNameByDbid(rNoodle.attributes['value']);
						
		}
	
	
	}	
	
	
	return sReturn;
}