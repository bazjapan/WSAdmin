package jp.wordsmart.utils.language
{
	import jp.wordsmart.WordSmartConstants;
	
	import utils.object.copy;

	public function languageCodeToNonNativeDialectObject(lang_code:String):Dialect
		{
			var copied:Dialect;
			for each (var obj:Dialect in WordSmartConstants.DIALECTS)
			{
				if(obj.language_code == lang_code)
				{
					copied = new Dialect(copy(obj));
					break;
				}		
			}
			if(copied)
			{
			copied.dialect_code = lang_code+"-nn";
			copied.dialect_label = "Non Native";
			return copied;
			}
			return new Dialect;
		}
	
}