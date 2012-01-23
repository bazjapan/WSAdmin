package jp.wordsmart.utils.language
{
	import jp.wordsmart.WordSmartConstants;

	public function getDialectsForLanguage(language_code:String):Array
	{
		var matching:Array = [];
		for each (var dialect:Dialect in WordSmartConstants.DIALECTS)
		{
			if(dialect.language_code == language_code)
			{
				matching.push(dialect);
			}
		}
		return matching;
	}
	
}