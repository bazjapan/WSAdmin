package jp.wordsmart.audio.providers
{
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.dto.AudioReader;
	
	import utils.string.replace;
	import utils.text.underbar;

	public class GoogleDictionaryAudio extends AudioProvider
	{
		public function GoogleDictionaryAudio()
		{
			super();
			copyright = "Audio provided by Google Dictionary, All rights reserved."
			label = "Google Dictionary";
			origin = label;
			file_prefix = "gd";
			audio_type = "word";
			available_readers = [new AudioReader({data:1, label:"Default", dialect_code:"en-us", reader_age:"30s", reader_gender:"M"})];
			audio_generation_method = AUDIO_GENERATION_HUMAN;
			serviceMaxChars = 100;
		}
		
		/*ignores subtext and language*/
		override public function getURL(text:String, subText:String,  reader:Object, speed:String, mood:String, urlCallback:Function, errorCallback:Function = null, statusCallback:Function = null):void
		{
			var preparedText:String = text.substring(0, serviceMaxChars-1)
			var preparedWord:String = prepareWordForGoogleDictionary(preparedText);
			
			var wholeURL:String = "http://www.gstatic.com/dictionary/static/sounds/de/0/"+preparedWord+".mp3";
			urlCallback(wholeURL);
		}
		
		private function prepareWordForGoogleDictionary(word:String):String
		{
			var preProcessed:String = word
			var preCapitalExclamation:String = preProcessed.replace( /((?<![A-Z])[A-Z]|[A-Z](?![A-Z]))/g, '!$1' );
			var underBarred:String = replace(preCapitalExclamation, " ", "_");
			return underBarred;
		}
		
	}
}