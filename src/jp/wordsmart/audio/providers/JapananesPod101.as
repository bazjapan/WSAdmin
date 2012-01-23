package jp.wordsmart.audio.providers
{
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.dto.AudioReader;
	
	import utils.text.underbar;

	public class JapananesPod101 extends AudioProvider
	{
		public function JapananesPod101()
		{
			super();
			label = "JPod101";
			origin = "Japanese Podcast 101";
			file_prefix = "jp101";
			available_readers = [new AudioReader({data:1, label:"Default", dialect_code:"ja-jp", reader_age:reader_age, reader_gender:"F"})];
		}
		//text should be kana and subtext kanji
		override public function getURL(text:String, subText:String,  reader:Object, speed:int, mood:String = '', urlCallback:Function, errorCallback:Function):void
		{
			var baseURL:String = "http://assets.languagepod101.com/dictionary/japanese/audiomp3.php?";
			var kana:String = "kana="+text;
			var wholeURL:String = baseURL+kana;
			if(subText != null || subText != '')
			{
				var kanji:String = "&kanji="+subText;
				wholeURL = wholeURL+kanji;
			}
			urlCallback(wholeURL);
		}
		override public function getFileName(text:String):String
		{
			var now:Date = new Date();
			return file_prefix+underbar()+now.getTime().toString()+"."+audio_mime_type;	
		}
		
		
		
		
	}
}