package jp.wordsmart.utils.language
{
	public function dialectCodetoLanguageObject(dialect_code:String):Language
	{
			var languageCode:String = dialect_code.split("-")[0];
			return languageCodeToLanguageObject(languageCode);
	}
	
}