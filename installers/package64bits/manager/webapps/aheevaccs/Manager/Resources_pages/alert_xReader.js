// JavaScript Document


function XMLtoExpression(rNoodle)
	{ 
		//alert(rNoodle);
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
			if(rNoodle.name == 'RequiredAlertsConditions')
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
			else if(rNoodle.name == 'condition')
			{
				sReturn += rNoodle.attributes['var'];
								
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
				sReturn += rNoodle.attributes['value'];
			}
		}	
		return sReturn;
	}