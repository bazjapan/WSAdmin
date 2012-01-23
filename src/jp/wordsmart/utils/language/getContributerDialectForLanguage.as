package jp.wordsmart.utils.language
{
	import jp.wordsmart.dto.Contributer;
	import jp.wordsmart.model.AppModel;

	public function getContributerDialectForLanguage(lang_code:String):Dialect
		{
			var contributor:Contributer = AppModel.getInstance().signedInContributor;
			if(dialectCodetoLanguageObject(contributor.user_native_dialect_code)["value"] == lang_code)
			{
				return dialectCodeToDialectObject(contributor.user_native_dialect_code);
			}
			else
			{
				return languageCodeToNonNativeDialectObject(lang_code);
			}
		}
	
}