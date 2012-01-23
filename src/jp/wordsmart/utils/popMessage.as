package jp.wordsmart.utils
{
	import com.devahead.utils.PopUpUtils;
	
	import flash.display.DisplayObject;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	import views.application.Message;

	/**
	 *Message to show
	 * Time to show
	 * Text Size
	 * callback when message is closed
	 * Usage:popMessage("Audio Added",2000,24,function():void
				{
				trace("popmessage closed");
				//do something
				} 
	 */	
	public function popMessage(message:String, time:int = 2000, textSize:int =24, completeFunc:Function = null):void
	{
		var all:ArrayCollection = PopUpUtils.getAllPopups();
		for each (var ui:UIComponent in all)
		{
		if(ui is Message)
		{
		PopUpManager.removePopUp(ui);
		}
		}
		
		var timer:Timer = new Timer(time,1);
		var messageBox:Message = new Message;
		messageBox.message = message;
		messageBox.textSize = textSize;
		messageBox.alpha = 0.5;
		
		PopUpManager.addPopUp(messageBox,Application.application as DisplayObject);
		PopUpManager.centerPopUp(messageBox);
		
		timer.addEventListener(TimerEvent.TIMER,function(te:TimerEvent):void
		{
			PopUpManager.removePopUp(messageBox);
			timer = null;
			if(completeFunc != null){completeFunc();}
		});
		timer.start();
		
	}
	
}