package jp.wordsmart.utils
{
	/**
	 *Returns Alert on fault; Consider putting in override if user supplies fault handler function 
	 */	
	import com.adobe.serialization.json.JSON;
	
	import flash.system.Capabilities;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import utils.string.replace;
	
	
	public function googleTextToSpeech(text:String, language:String, result:Function):void
	{
		var googleText:String = "http://translate.google.com/translate_tts?"
		var wholeURL:String = googleText + "tl="+language + "&q=" + text;
		var service:HTTPService = new HTTPService();
		service.useProxy = false;
		service.method = "GET";
		service.resultFormat = "text";
		service.url= wholeURL;
		service.addEventListener(ResultEvent.RESULT, result);
		service.addEventListener(FaultEvent.FAULT, function(evt:FaultEvent):void
		{
			Alert.show("Service is currently unavailable.");
		});
		service.headers = {'Referer':wholeURL};
		
	service.send();	
	}
	
}