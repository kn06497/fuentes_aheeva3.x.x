// JavaScript Document

function softValidationMess()
{
	this.messType 	= "";
	this.messText 	= "";
	this.messImg  	= "";
	this.clickonme	= "";
	
	this.setMessage = function(type, text, img, clicked)
	{
		this.messType = type;
		this.messText = text;
		this.messImg  = img;
		this.clickonme= clicked;
	}
}