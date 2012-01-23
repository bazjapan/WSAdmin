package jp.wordsmart.audio.providers
{
	import jp.wordsmart.dto.AudioReader;
	import jp.wordsmart.utils.language.dialectCodeToDialectObject;
	
	import utils.text.underbar;

	public class GoogleTranslateAudio extends AudioProvider
	{
		public function GoogleTranslateAudio()
		{
			super();
			label = "Google Translate";
			copyright = "Audio provided by Google Translate, All rights reserved."
			origin = label;
			file_prefix = "gt";
			audio_generation_method = AUDIO_GENERATION_MACHINE;
			available_readers = getReaders();
			serviceMaxChars = 160;
		}
		
		/**
		 * 
		 * @param text
		 * @param subText
		 * @param language
		 * @return Returns url of audio file
		 * 
		 */
		override public function getURL(text:String, subText:String, reader:Object, speed:String, mood:String , urlCallback:Function, errorCallback:Function = null, statusCallback:Function = null):void
		{
			var preparedText:String = encodeURIComponent(text.substring(0, serviceMaxChars-1))
			
			var language_code:String = dialectCodeToDialectObject(reader["dialect_code"])["language_code"];
			
			if(language_code == "")language_code = "en";
			var googleText:String = "http://translate.google.com/translate_tts?"
			var wholeURL:String = googleText + "tl="+language_code + "&q=" + preparedText;
			urlCallback(wholeURL);
		}
		private function getReaders():Array
		{
		var readers:Array = [];
		var dialect:String = "en-us";
		var reader_age:String = "30s";
		readers.push(new AudioReader({data:1, label:"Default", dialect_code:"en-us", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:2, label:"Default", dialect_code:"ja-jp", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:3, label:"Default", dialect_code:"zh-cn", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:4, label:"Default", dialect_code:"zh-tw", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:5, label:"Default", dialect_code:"ko-kr", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:6, label:"Default", dialect_code:"fr-fr", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:7, label:"Default", dialect_code:"es-es", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:8, label:"Default", dialect_code:"pt-pt", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:9, label:"Default", dialect_code:"de-de", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:10, label:"Default", dialect_code:"it-it", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:11, label:"Default", dialect_code:"ru-ru", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:12, label:"Default", dialect_code:"ar-sa", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:13, label:"Default", dialect_code:"bg-bg", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:14, label:"Default", dialect_code:"hr-hr", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:15, label:"Default", dialect_code:"cs-cz", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:16, label:"Default", dialect_code:"da-dk", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:17, label:"Default", dialect_code:"nl-nl", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:18, label:"Default", dialect_code:"fi-fi", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:19, label:"Default", dialect_code:"el-gr", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:20, label:"Default", dialect_code:"hi-in", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:21, label:"Default", dialect_code:"no-no", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:22, label:"Default", dialect_code:"pl-pl", reader_age:reader_age, reader_gender:"F"}));
		readers.push(new AudioReader({data:23, label:"Default", dialect_code:"sv-se", reader_age:reader_age, reader_gender:"F"}));
		
		return readers;
		}
		
		
		/*override public function getFileName(text:String):String
		{
			return currentLanguage+underbar()+file_prefix+underbar()+text+"."+audioType;	
		}*/
	
	}
}