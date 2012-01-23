package jp.wordsmart.utils.jsonhelpers
{
	import com.adobe.serialization.json.JSON;
	import com.pbsmediatech.json.utils.JSONResultHelper2;
	
	import jp.wordsmart.dto.nested.KeywordTranslation;
	


	public class KeywordTranslationResultHelper extends JSONResultHelper2
	{
		public function KeywordTranslationResultHelper()
		{
			super();
		}
		
		
		/**
		 * 
		 * @param jsonString = keyword.keyword_translations
		 * @return Array of KeywordTranslation objects
		 * 
		 */
		public function convertToArray(jsonString:String):Array
		{
			try
			{
			var objects:Array = [];
			if(jsonString == null || jsonString == '')return objects;
			
			
			var jObj:Object = JSON.decode(jsonString);
			for each(var obj:Object in jObj)
			{
				if(obj is String)break;;
				var kw:KeywordTranslation = new KeywordTranslation(obj);
				
				trace("found translation "+kw.translation_language+ " --- "+kw.translation_text)
				objects.push(kw);
			}
			}
			catch(err:Error)
			{
				trace(err.toString())
			}
			return objects;
		}
	}
}