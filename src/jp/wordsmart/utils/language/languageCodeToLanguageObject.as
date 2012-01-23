package jp.wordsmart.utils.language
{
	import jp.wordsmart.model.AppModel;

	public function languageCodeToLanguageObject(lang:String):Language
	{
			
			var languages:Array = AppModel.getInstance().languages;
			for each (var language:Language in languages)
			{
				if(language.value == lang)
				{
					return language; 
				}
			}
			return new Language;
	}
	
}