package jp.wordsmart.utils.language
{
	import jp.wordsmart.WordSmartConstants;
	
	import utils.object.copy;

	/**
	 *return dialect object for language with ldialect set to any 
	 */	
	public function languageCodeToUnknownDialectObject(lang_code:String):Dialect
	{
		var copied:Dialect
		for each (var obj:Dialect in WordSmartConstants.DIALECTS)
		{
			if(obj.language_code == lang_code)
			{
				copied = new Dialect(copy(obj));
				break;
			}		
		}
		copied.dialect_code = lang_code+"-?";
		copied.dialect_label = "Unknown";
		return copied;
	}
	
}