package jp.wordsmart.utils.language
{
	import jp.wordsmart.WordSmartConstants;

	public function dialectCodeToDialectObject(dialect_code:String):Dialect
	{
		for each (var obj:Dialect in WordSmartConstants.DIALECTS)
		{
			if(obj.dialect_code== dialect_code)
			{
				return obj;
			}
		}
		//check for non native etc here
		var lang_code:String = dialect_code.split("-")[0];
		if(dialect_code.split("-")[1] == "?"){return languageCodeToUnknownDialectObject(lang_code)};
		if(dialect_code.split("-")[1] == "nn"){return languageCodeToNonNativeDialectObject(lang_code)};
		if(dialect_code.split("-")[1] == "*"){return languageCodeToAnyDialectObject(lang_code)};
		
		return new Dialect();
	}
	
}