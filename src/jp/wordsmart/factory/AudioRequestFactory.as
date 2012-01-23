package jp.wordsmart.factory
{
	import jp.wordsmart.dto.AudioRequest;
	import jp.wordsmart.dto.TranslationRequest;
	import jp.wordsmart.model.AppModel;
	
	import utils.date.now;
	import utils.timestamp.dateToTimestamp;

	public class AudioRequestFactory
	{
		public function AudioRequestFactory()
		{
		}
		
		public function getInstance(audio_request_language:String,
									audio_request_notes:String,
									audio_request_transcript:String,
									audio_request_dialect:String,
									audio_request_recorder_age:String,
									audio_request_gender:String, audio_request_mood:String):AudioRequest
		{
			var item:AudioRequest = new AudioRequest();
			item.audio_request_language = audio_request_language;
			item.audio_request_date_added = dateToTimestamp(now());
			item.audio_request_notes = audio_request_notes;
			item.audio_request_status = "new";
			item.audio_requester_name = AppModel.getInstance().signedInContributor.user_login;
			item.audio_request_transcript = audio_request_transcript;
			item.audio_request_dialect = audio_request_dialect;
			item.audio_request_recorder_age = audio_request_recorder_age;
			item.audio_request_gender = audio_request_gender;
			item.audio_request_mood = audio_request_mood;
			
			return item;
		}
	}
}