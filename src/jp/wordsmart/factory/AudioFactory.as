package jp.wordsmart.factory
{
	import com.adobe.net.MimeTypeMap;
	
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.dto.WSAudio;
	import jp.wordsmart.dto.WSImage;
	import jp.wordsmart.model.AppModel;
	
	import utils.date.now;
	import utils.timestamp.dateToTimeStampUTC;

	public class AudioFactory
	{
		public function AudioFactory()
		{
		}
		
		public function getInstance(audio_location:String,
									audio_mime_type:String,
									audio_language:String,
									audio_transcript:String,
									copyright:String,
									origin:String,
									isLocal:int,
									audio_type:String, audio_orig_url:String,
									recorder_age:String = '',
									recorder_dialect:String = '',
									recorder_gender:String = "U",
									audio_meta:String = '',
									audio_mood:String = '',
									audio_total_time:Number = 0):WSAudio
		{
			
			
			var audio:WSAudio = new WSAudio;
			audio.audio_addedby = AppModel.getInstance().signedInContributor.ID;
			audio.audio_location = audio_location;
			audio.audio_total_time = audio_total_time
			audio.audio_mime_type = audio_mime_type
			audio.date_added = dateToTimeStampUTC(now());
			audio.audio_language = audio_language;
			audio.audio_mood = audio_mood;
			audio.audio_meta = audio_meta;//json obj
			audio.recorder_gender = recorder_gender;
			audio.recorder_dialect = recorder_dialect;
			audio.recorder_age = recorder_age;
			audio.audio_transcript = audio_transcript;
			audio.copyright = copyright;
			audio.origin = origin;
			audio.isLocal = isLocal;
			audio.audio_orig_url = audio_orig_url;
			audio.audio_type = audio_type; 
			
			return audio;
			
			
		}
	}
}