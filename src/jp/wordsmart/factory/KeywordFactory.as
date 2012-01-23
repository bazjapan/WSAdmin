package jp.wordsmart.factory
{
	import com.adobe.serialization.json.JSON;
	
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.dto.WSKeyword;
	import jp.wordsmart.dto.nested.KeywordTranslation;
	import jp.wordsmart.model.AppModel;
	
	import utils.array.copyArray;
	import utils.array.removeItem;
	import utils.timestamp.dateToTimeStampUTC;

	public class KeywordFactory
	{
		public function KeywordFactory()
		{
		}
		
		public function getInstance(text:String, lang:String = ""):WSKeyword
		{
			var newKeyword:WSKeyword = new WSKeyword();
			newKeyword.keyword_addedby = AppModel.getInstance().signedInContributor.ID;
			if(lang != "")
			{
			newKeyword.keyword_language = lang;
			}
			else
			{
			newKeyword.keyword_language = AppModel.getInstance().currentBaseLanguage;
			}
			newKeyword.keyword_type = WordSmartConstants.DEFAULT_KEYWORD_TYPE;
			newKeyword.keyword_status = "Not Sure";
			newKeyword.keyword_text = text;
			
			
			//add default translations
			//if base language matches users set base language set translation defaults
			if(lang == AppModel.getInstance().signedInContributor.getBaseLanguage())
			{
			
			var defaultTrans:Array = AppModel.getInstance().signedInContributor.getDefaultKeywordTranslationLanguages();
				removeItem(defaultTrans,newKeyword.keyword_language);
			
			var translations:Array = [];
			for each (var defaultTranslation:String in defaultTrans)
			{
			//add trans
				var trans:KeywordTranslation = new KeywordTranslation;
				trans.translation_language = defaultTranslation;
				trans.translation_status = KeywordTranslation.TO_TRANSLATE;
				translations.push(trans);
			}
			
			newKeyword.keyword_translations = JSON.encode(translations)
			}
			// ----//if base language matches users set base language set translation defaults end
			
			return newKeyword;
		}
	}
}