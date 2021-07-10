
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
////////// Simple XML Processing Trasnlator //////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

function ExpressiontoXML(input)
{
	var sReturn4;
	var bigEXP;
	sReturn4 = '';
	sReturn4 += '<?xml version="1.0"?>';
	bigEXP = new ExprLog();
	bigEXP.text = input;	
	bigEXP.setMembers();	
	sReturn4 += bigEXP.translate();	/*
	rExp = /"/gi;
    newString = new String ('\\"');
    sReturn4 = sReturn4.replace(rExp, newString);	*/
	//alert('sReturn4=\n'+sReturn4);
	return sReturn4;
}

function translateAtomic(input)
{
	sReturn = '';
	if(input.length > 0)
	{
		tmp_skillName = '';
		tmp_skillDBID = '';
		tmp_skillRel = '';
		tmp_skillValue = '';
		
		input = input.trim();
		foundOp = false;
		
		if(input.indexOf(">") != -1)
		{
			A = input.split(">");			
			if(A.length == 2)
			{
				tmp_skillRel = ">";
				tmp_skillName 	= A[0].trim();
				tmp_skillValue 	= A[1].trim();
				//tmp_skillDBID = "HardCode1";
				if(tmp_skillName == 'AgentGroup')
				{
					tmp_skillDBID = 'AgentGroup';
					tmp_skillValue = appletObj.getAgentGroupDBIDByName(tmp_skillValue, tenantDBID);
				} else if(tmp_skillName == 'Agent')
				{
					tmp_skillDBID = 'Agent';
				}
				else
					//tmp_skillDBID = tmp_skillName;
					tmp_skillDBID = appletObj.getSkillDBIDByNAME(tmp_skillName, tenantDBID);
				foundOp = true;
			}			
		}else if(input.indexOf("=") != -1)
		{
			A = input.split("=");
			if(A.length == 2)
			{
				tmp_skillRel = "=";
				tmp_skillName 	= A[0].trim();
				tmp_skillValue 	= A[1].trim();
				//tmp_skillDBID = "HardCode1";
				if(tmp_skillName == 'AgentGroup')
				{
					tmp_skillDBID = 'AgentGroup';					
					tmp_skillValue = appletObj.getAgentGroupDBIDByName(tmp_skillValue, tenantDBID);					
				}
				else if(tmp_skillName == 'Agent')
				{
					tmp_skillDBID = 'Agent';
				}
				else
					//tmp_skillDBID = tmp_skillName;
					tmp_skillDBID = appletObj.getSkillDBIDByNAME(tmp_skillName, tenantDBID);
				foundOp = true;
			}			
		}else if(input.indexOf("<") != -1)
		{
			A = input.split("<");
			if(A.length == 2)
			{
				tmp_skillRel = "<";
				tmp_skillName 	= A[0].trim();
				tmp_skillValue 	= A[1].trim();
				//tmp_skillDBID = "HardCode1";
				if(tmp_skillName == 'AgentGroup')
				{
					tmp_skillDBID = 'AgentGroup';
					tmp_skillValue = appletObj.getAgentGroupDBIDByName(tmp_skillValue, tenantDBID);
				}
				else if(tmp_skillName == 'Agent')
				{
					tmp_skillDBID = 'Agent';
				}
				else
					//tmp_skillDBID = tmp_skillName;
					tmp_skillDBID = appletObj.getSkillDBIDByNAME(tmp_skillName, tenantDBID);
				foundOp = true;
			}			
		}
		
		if(foundOp)
		{
			sReturn += '<skill';
			sReturn += ' dbid="'+tmp_skillDBID+'"';
			switch(tmp_skillRel)
			{
				case '>':
					sReturn += ' rel="sup"';
				break;
				case '<':
					sReturn += ' rel="inf"';
				break;
				case '=':
					sReturn += ' rel="eq"';
				break;
			}
			
			sReturn += ' value="'+tmp_skillValue+'"';
			sReturn += ' />';
		}
	}	
	return 	sReturn;
}

function cleanText(theText)
{
	sReturn = theText.trim();
	//Si on a une parenthese avnt et a la fin...ex. (test>10) no need...	
	if(sReturn.charAt(0) == '(' && equivalentOuvrente(sReturn, 0) == sReturn.length-1 )
	{		
		sReturn = sReturn.substring(1, sReturn.length-1);
	}
	
	//Des que deux espaces se suivent, enlever le second
	nbEspaces = 0;
	secondSpacePos = -1;
	var i;
	for(i = 0; i < sReturn.length; i++)
	{
		if(sReturn.charAt(i) == ' ')
			nbEspaces++;
		else
			nbEspaces = 0;
		
		if(nbEspaces == 2) // 
		{
			secondSpacePos = i;
			break;
		}
	}
	if(secondSpacePos > 0)  //ohh... double espace, 
	{   
		sReturn = sReturn.substring(0, secondSpacePos) + sReturn.substring(secondSpacePos+1, sReturn.length);
	}	
	
	if(sReturn != theText) //Si on a change quelque chose, refaire une seconde fois...
		sReturn = cleanText(sReturn);
	
	return sReturn;	
}



function ExprLog()
{
	this.op = ""; //Operation de l'expression logique
	this.exprGauche = null; //new ExprLog();
	this.exprDroite = null; //new ExprLog();
	this.text = "";
	this.isAtomic = true;
	
	this.setMembers = function()
	{
		rightText = "";
		leftText = "";
		operatorANDat = 0;
		sumPosAND = 0;
		operatorORat = 0;
		sumPosOR = 0;
		foundFirstOrderAND = false;
		foundFirstOrderOR = false;
		
		
		this.text = cleanText(this.text);
		this.isAtomic = isAtomic(this.text);
		if(!this.isAtomic) //Trouver les bons membres de gauches et de droite
		{
			//Rechercher les AND
			rightText = this.text.toUpperCase();						
			while(!foundFirstOrderAND && rightText.length > 0) //Tant qu on a pas trouve le firstOrder et qu'il reste du travail a faire
			{
				//alert("rightText=\n"+rightText);
				operatorANDat = rightText.indexOf(" AND ");
				//alert("operatorANDat=\n"+operatorANDat);
				if(operatorANDat == -1) //il n'y a pas cet operateur la dedans
				{
					rightText = "";
					foundFirstOrderAND = false;
				}
				else /// 
				{
					sumPosAND += operatorANDat;
					/*alert("sumPosAND=\n"+sumPosAND);
					alert("retrieveElementOrder(this.text, sumPosAND)=\n"+retrieveElementOrder(this.text, sumPosAND));*/
					if(retrieveElementOrder(this.text, sumPosAND) == 1) // On l'a trouve...
					{
						foundFirstOrderAND = true;						
					} 
					else //on en a trouve un mais ce n'est pas le bon
					{
						sumPosAND += " AND ".length;
						rightText = rightText.substring(operatorANDat + " AND ".length);
					}
				}
			}
			/*alert("foundFirstOrderAND="+foundFirstOrderAND);
			alert("operatorANDat="+operatorANDat);*/
			
			//Rechercher les OR
			rightText = this.text.toUpperCase();
			while(!foundFirstOrderOR && rightText.length > 0) //Tant qu on a pas trouve le firstOrder et qu'il reste du travail a faire
			{
				operatorORat = rightText.indexOf(" OR ");
				//alert("operatorORat="+operatorORat);
				if(operatorORat == -1) //il n'y a pas cet operateur la dedans
				{
					rightText = "";
				}
				else /// 
				{
					sumPosOR += operatorORat;
					/*alert("rightText="+rightText);
					alert("retrieveElementOrder(rightText, operatorORat)="+retrieveElementOrder(rightText, operatorORat));*/
					if(retrieveElementOrder(this.text, sumPosOR) == 1) // On l'a trouve...
					{
						foundFirstOrderOR = true;						
					} 
					else //on en a trouve un mais ce n'est pas le bon
					{
						sumPosOR += " OR ".length;
						rightText = rightText.substring(operatorORat + " OR ".length);
					}
				}
			}
			/*alert("foundFirstOrderOR="+foundFirstOrderOR);
			alert("operatorORat="+operatorORat);*/
			
			//Trouver le plus a gauche entre le AND et le OR
			if(foundFirstOrderOR)
			{				
				this.op = "OR";
				this.exprGauche = new ExprLog();
				this.exprDroite = new ExprLog();
				this.exprGauche.text = this.text.substring(0, sumPosOR);
				this.exprDroite.text = this.text.substring(sumPosOR+" OR ".length, this.text.length);
				this.exprGauche.setMembers();
				this.exprDroite.setMembers();
			}
			
			if( ((sumPosAND < sumPosOR) && foundFirstOrderAND && foundFirstOrderOR) 
				  	|| (foundFirstOrderAND && !foundFirstOrderOR)  )				
			{
				this.op = "AND";
				this.exprGauche = new ExprLog();
				this.exprDroite = new ExprLog();
				this.exprGauche.text = this.text.substring(0, sumPosAND);
				this.exprDroite.text = this.text.substring(sumPosAND+" AND ".length, this.text.length);
				this.exprGauche.setMembers();
				this.exprDroite.setMembers();
			}		
			
		}
	}
	
	
	this.translate = function()
	{
		/*alert("Inside TRANSLATE()");
		alert("this.isAtomic="+this.isAtomic);*/
		sReturn = '';
		if(!this.isAtomic)
		{
			sReturn += '<RequiredSkills op="'+this.op+'">';
			if(this.exprGauche != null)
				sReturn += this.exprGauche.translate();
			if(this.exprDroite != null)
				sReturn += this.exprDroite.translate();
			sReturn += '</RequiredSkills>';		
		}
		else
		{
			sReturn += translateAtomic(this.text);
		}
		return 	sReturn;
	}
}



/**********************************************
*
GOLBALS
******************************************/



function isAtomic(text)
{	
	
	text = text.toUpperCase();
	if(text.indexOf('(') != -1)
		return false;
	else if(text.indexOf(')') != -1)
		return false;
	else if(text.indexOf(' AND ') != -1)
		return false;
	else if(text.indexOf(' OR ') != -1)
		return false;
	else 
		return true;			
}


function retrieveElementOrder(text, elementPlace)
{
	
	text = text.trim().toUpperCase();
	leftText = text.substring(0, elementPlace);	
	//rigthText = text.substring(elementPlace+elementSize, text.length);
		
	nbOpenParenths = 0;
	nbCloseParenths = 0;
	iReturn = 0;
	var i;
	for(i = 0; i < leftText.length; i++)
	{
		if(leftText.charAt(i) == '(')
			nbOpenParenths++;
		if(leftText.charAt(i) == ')')
			nbCloseParenths++;
	}
	
	iReturn = nbOpenParenths-nbCloseParenths+1;
	
	return iReturn;	
}


function equivalentOuvrente(theText, ouvrantePos)
{
	iReturn = -1;
	
	cnt = 1;
	var i;
	for(i = ouvrantePos+1; i < theText.length; i++)
	{
		if(theText.charAt(i) == '(')
			cnt++;
		if(theText.charAt(i) == ')')
			cnt--;
		if(cnt == 0)
		{
			iReturn = i;
			break;
		}
	}	
	return iReturn;
}

/** ************************
***** ExtraFucntions  ******
****************************/
function strltrim() {
	return this.replace(/^\s+/,'');
}

function strrtrim() {
	return this.replace(/\s+$/,'');
}
function strtrim() {
	return this.replace(/^\s+/,'').replace(/\s+$/,'');
}
String.prototype.ltrim = strltrim;
String.prototype.rtrim = strrtrim;
String.prototype.trim = strtrim;