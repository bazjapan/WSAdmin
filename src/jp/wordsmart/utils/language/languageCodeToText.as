package jp.wordsmart.utils.language
{
	import jp.wordsmart.model.Languages;
	import jp.wordsmart.model.AppModel;
	/**
	 *Returns Language Label for Language Code 
	 */	
	public function languageCodeToText(lang:String):String
	{
		
		var languages:Array = AppModel.getInstance().languages;
		for each (var language:Object in languages)
		{
			if(language["value"] == lang)
			{
				return language["label"]; 
			}
		}
		return "unknown";
		
	}
	
}