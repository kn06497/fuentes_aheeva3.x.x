/**
 * loadXML() : Loads the XML String and returns the document created
 * @param xmlString String
 * @return Document
 */
function loadXML(xmlString)
{
	var xmlDoc = null;
	if (window.ActiveXObject)	// Internet Explorer code
	{
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async=false;
		xmlDoc.loadXML(xmlString);
	}
	else if (document.implementation &&	document.implementation.createDocument) // Mozilla and others code
	{
		var domParser = new DOMParser();
		var xmlDoc = domParser.parseFromString(xmlString, 'text/xml');
	}
	else
	{
		alert('Your browser cannot handle this script');
	}
	return xmlDoc;
}

/**
 * getXmlChildByName() : Get a pointer to the child with the given name
 * @param p Node
 * @param name String
 * @return Node
 */
function getXmlChildByName(p, name)
{
	if(p == null) return null;
	if(p.hasChildNodes())
	{
		for (var i = 0; i < p.childNodes.length; i++)
		{
			var cur = p.childNodes[i];
			if (cur.nodeName == name)
				return cur;
		}
	}
	return null;
}
  
/**
 * getXmlValue() : Get a string associated to a key
 * @param p Node
 * @param name String
 * @return String
 */
function getXmlValue(p, name)
{
	var goodNode = getXmlChildByName(p, name);
	if(goodNode != null)
	{
		if(goodNode.hasChildNodes())
		{
			var textNode = goodNode.firstChild;
			if(textNode.nodeType == 3)
				return textNode.nodeValue;
		}
	}
	return "";
}

/**
 * getXmlAttribute() : Gets the value of an attribute with name passed
 * as a parameter
 * @param n Node
 * @param name String
 * @return String
 */
function getXmlAttribute(n, name)
{
	if(n.attributes.length > 0 && n.nodeType == 1)
	{
		for(var i = 0; i < n.attributes.length; i++)
		{
			if(n.attributes[i].nodeName == name)
				return n.attributes[i].nodeValue;
		}
	}
	return "";
}