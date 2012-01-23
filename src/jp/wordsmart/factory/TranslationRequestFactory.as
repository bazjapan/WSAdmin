package jp.wordsmart.factory
{
	import jp.wordsmart.dto.TranslationRequest;
	import jp.wordsmart.model.AppModel;
	
	import utils.date.now;
	import utils.timestamp.dateToTimestamp;

	public class TranslationRequestFactory
	{
		public function TranslationRequestFactory()
		{
		}
		
		public function getInstance(keywordID:Number,sourceLanguageCode:String,targetLanguageCode:String,notes:String, type:String):TranslationRequest
		{
			var item:TranslationRequest = new TranslationRequest();
			item.keyword_ID = keywordID;
			item.request_date_added = dateToTimestamp(now());
			item.request_notes = notes;
			item.request_status = "new";
			item.requester_name = AppModel.getInstance().signedInContributor.user_login;
			item.source_language = sourceLanguageCode;
			item.target_language = targetLanguageCode;
			item.request_type = type;
			
			return item;
		}
	}
}