package jp.wordsmart.audio.providers
{
	import jp.wordsmart.WordSmartConstants;
	
	import utils.array.removeDuplicates;
	import utils.text.underbar;

	public class AudioProvider implements IAudioProvider
	{
		public function AudioProvider()
		{}
		
			public static const AUDIO_GENERATION_MACHINE:String = "AUDIO_GENERATION_MACHINE";
			public static const AUDIO_GENERATION_HUMAN:String = "AUDIO_GENERATION_HUMAN";
		
			public var label:String;
			public var origin:String;//name of provider
			public var copyright:String;
			public var file_prefix:String = "";
			public var audio_mime_type:String = "audio/mpeg";
			public var audio_mood:String = WordSmartConstants.DEFAULT_AUDIO_MOOD;
			public var audio_type:String = WordSmartConstants.DEFAULT_AUDIO_TYPE;
			
			public var available_readers:Array = [];//age//gender//dialect//label
			public var speeds:Array = ["0"];
			public var audio_generation_method:String = "";
			[Bindable]public var accepts_audio_requests:Boolean;
			public var default_speed:String = "0"
			public var urlIsTemporary:Boolean = false;
			public var serviceMaxChars:int = 200;
			
			
			
			public function getURL(text:String, subText:String, reader:Object, speed:String, mood:String , urlCallback:Function, errorCallback:Function = null, statusCallback:Function = null):void
			{
				urlCallback("");//have default error mp3 here
			}
			public function getFileName(text:String):String
			{
				return "";//audio_language+underbar()+file_prefix+underbar()+text+"."+audio_mime_type;	
			}
			
			public function getDialectsHandled():Array
			{
				var dialect_codes:Array = [];
				for each (var reader:Object in available_readers)
				{
					dialect_codes.push(reader['dialect_code']);
					
				}
				return removeDuplicates(dialect_codes);
			}
		
		
			public function doStatusCallback(status:String, statusCallback:Function):void
			{
				if(!statusCallback)return;
				statusCallback(status);
			}
			public function doErrorCallback(error:String, errorCallback:Function):void
			{
				if(!errorCallback)return;
				errorCallback(error);
			}
		
	}
}