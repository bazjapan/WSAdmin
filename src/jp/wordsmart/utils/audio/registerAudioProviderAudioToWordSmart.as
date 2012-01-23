package jp.wordsmart.utils.audio
{
	import com.adobe.net.MimeTypeMap;
	
	import flash.events.DataEvent;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.net.FileReference;
	import flash.net.URLRequestHeader;
	
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.audio.providers.AudioProvider;
	import jp.wordsmart.dto.WSAudio;
	import jp.wordsmart.dto.Contributer;
	import jp.wordsmart.events.AudioEvent;
	import jp.wordsmart.factory.AudioFactory;
	import jp.wordsmart.json.controllers.AudioController;
	import jp.wordsmart.model.AppModel;
	import jp.wordsmart.utils.FileDownloader;
	import jp.wordsmart.utils.s3.UploadFileToS3;
	
	import mx.core.mx_internal;
	import mx.rpc.events.ResultEvent;
	
	import s3.flash.SaveTheFuckinThingToAmazon;
	
	import utils.http.BrowserTypes;
	import utils.string.replace;
	import utils.timestamp.dateToTimeStampUTC;
	
	import views.ProgressBar;

	/**
	 * 
	 * @author Jan
	 * Downloads audio from web url and stores in wordsmart audio repository
	 */
		public function registerAudioProviderAudioToWordSmart(audioProvider:AudioProvider,language:String, recorderAge:String, recorderDialect:String, recorderGender:String, isLocal:int, audio_location:String, orig_location:String, audio_transcript:String, completeFunc:Function, audio_total_time:Number = 0, kanjiText:String = null):void
		{
			
			var newAudio:WSAudio = new AudioFactory().getInstance(audio_location,
				audioProvider.audio_mime_type,
				language,
				audio_transcript,
				audioProvider.copyright,
				audioProvider.origin, 
				isLocal,
				audioProvider.audio_type, 
				orig_location,
				recorderAge,
				recorderDialect,
				recorderGender,
				"",
				audioProvider.audio_mood,
				audio_total_time);
			
			var audioController:AudioController = new AudioController(AppModel.getInstance().useLocalControllers);
			
			audioController.add_audio(newAudio, function(evt:ResultEvent):void
			{
				newAudio.ID = evt.result as Number;
				completeFunc(newAudio);
			});
			
		
		
		
	}
}