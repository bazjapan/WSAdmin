package jp.wordsmart.utils.jsonhelpers
{
	import com.adobe.serialization.json.JSON;
	import com.pbsmediatech.json.utils.JSONResultHelper2;
	
	import jp.wordsmart.dto.TranslationRequest;
	


	public class TranslationRequestResultHelper extends JSONResultHelper2
	{
		public function TranslationRequestResultHelper()
		{
		}
		
		public function convertToArray(jsonString:String):Array
		{
			var keywords:Array = [];
			var jObj:Object = JSON.decode(jsonString);
			for each(var obj:Object in jObj)
			{
				if(obj is String)break;
				var kw:TranslationRequest = new TranslationRequest(obj);
				keywords.push(kw);
			}
			return keywords;
		}
	}
}