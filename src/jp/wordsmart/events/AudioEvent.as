package jp.wordsmart.events
{
	import flash.events.Event;
	
	import jp.wordsmart.dto.WSAudio;
	
	public class AudioEvent extends Event
	{
		public static const OPEN_AUDIO_EVENT:String = "OPEN_AUDIO_EVENT";
		public static const CREATE_AUDIO_EVENT:String = "CREATE_AUDIO_EVENT";
		
		public static const AUDIO_REGISTERED_EVENT:String = "AUDIO_REGISTERED_EVENT";
		public static const AUDIO_UPDATED_EVENT:String = "AUDIO_UPDATED_EVENT";
		
		
		public static const EVENT_RECORD_AUDIO:String = "EVENT_RECORD_AUDIO";
		public static const EVENT_AUDIO_FROM_TEXT_TO_SPEECH:String = "EVENT_AUDIO_FROM_TEXT_TO_SPEECH";
		public static const EVENT_AUDIO_FROM_WEB_URL:String = "EVENT_AUDIO_FROM_WEB_URL";
		public static const EVENT_AUDIO_FROM_COMPUTER_FILE:String = "EVENT_AUDIO_FROM_COMPUTER_FILE";
		public static const EVENT_ADD_AUDIO:String = "EVENT_ADD_AUDIO";
		
		
		public var audioVO:WSAudio;
		
		
		
		public function AudioEvent(type:String, audioVO:WSAudio, bubble:Boolean = false)
		{
			this.audioVO = audioVO;
			super(type, bubble, false);
		}
	}
}