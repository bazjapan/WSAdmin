package jp.wordsmart.utils.audio.mp3
{
	import com.adobe.protocols.dict.events.ErrorEvent;
	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.utils.ByteArray;
	
	import fr.kikko.lab.ShineMP3Encoder;
	
	import jp.wordsmart.utils.progressEventToPercent;
	
	import mx.controls.Alert;
	
	

	public class ConvertWAVtoMP3
	{
		public function ConvertWAVtoMP3()
		{
		}
		public function convert(wav:ByteArray, completeCallback:Function, progressCallback:Function, errorCallback:Function = null):void
			{
				wav.position = 0
				var mp3Encoder:ShineMP3Encoder = new ShineMP3Encoder(wav);
				mp3Encoder.addEventListener(Event.COMPLETE, mp3EncodeComplete);
				mp3Encoder.addEventListener(ProgressEvent.PROGRESS, mp3EncodeProgress);
				mp3Encoder.addEventListener(ErrorEvent.ERROR, mp3EncodeError);
				mp3Encoder.start();	
				
				function mp3EncodeProgress(e:ProgressEvent) : void 
				{
					var perc:Number = progressEventToPercent(e);
					progressCallback(perc);
				}
				
				function mp3EncodeComplete(e: Event) : void 
				{
					completeCallback(mp3Encoder.mp3Data);
					
					
				}	
				function mp3EncodeError(evt:ErrorEvent):void
				{
					Alert.show("An error occurred trying to encode mp3");
				}
				
			}
	}
}