package jp.wordsmart.audio
{
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.dto.WSAudio;
	import jp.wordsmart.model.AppModel;
	import jp.wordsmart.utils.language.dialectCodetoLanguageObject;

	public function getDefaultAudio():WSAudio
		{
			var defaultAudio:WSAudio = new WSAudio();
			defaultAudio.audio_addedby = AppModel.getInstance().signedInContributor.ID;
			defaultAudio.audio_copyright = WordSmartConstants.AUDIO_COPYRIGHT_TEXT;
			defaultAudio.audio_rec_gen = AppModel.getInstance().signedInContributor.user_gender;
			defaultAudio.audio_transcript = "";
			defaultAudio.audio_mood = WordSmartConstants.DEFAULT_AUDIO_MOOD;
			defaultAudio.audio_type = WordSmartConstants.DEFAULT_AUDIO_TYPE;
			defaultAudio.audio_tags = "";
			defaultAudio.audio_rec_dia = AppModel.getInstance().signedInContributor.user_native_dialect_code;
			defaultAudio.audio_language = dialectCodetoLanguageObject(defaultAudio.audio_rec_dia).value;
			defaultAudio.audio_rec_age = AppModel.getInstance().signedInContributor.userAge;
			return defaultAudio;
		}
	
}