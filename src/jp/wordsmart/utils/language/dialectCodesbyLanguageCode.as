package jp.wordsmart.utils.language
{
	import jp.wordsmart.WordSmartConstants;

	/**
	 *Returns array of dialect codes ex en-us, en-uk etc 
	 */	
	public function dialectCodesbyLanguageCode(lang_code:String):Array
	{
		var dialects:Array = [];
		for each (var dialect:Object in WordSmartConstants.DIALECTS)
		{
			if(dialect["language_code"] == lang_code)
			{
				dialects.push(dialect["dialect_code"]);
			}
			
		}
		return dialects;
	}
	
}