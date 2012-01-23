package jp.wordsmart.utils.audio
{
	import com.hurlant.crypto.symmetric.NullPad;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundLoaderContext;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	
	import utils.http.BrowserTypes;
	import utils.http.getStealthURLRequest;
	import utils.http.getUserAgentString;

	/**
	 *return completeFunc return audio length;
	 * errorCallbck return a string
	 */
	public function playAudioFromURL(wholeURL:String, completeCallback:Function = null, errorCallback:Function = null):Sound
	{
			var globalSoundObject:Sound = new Sound();
			if(errorCallback == null)
			{
			globalSoundObject.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			}
			else
			{
				globalSoundObject.addEventListener(IOErrorEvent.IO_ERROR,errorCallback);
			}
			
			globalSoundObject.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			globalSoundObject.addEventListener(Event.COMPLETE, completeHandler);
			
			
			var request:URLRequest = getStealthURLRequest(wholeURL);
			try
			{
				var globalSoundChannel:SoundChannel = new SoundChannel;
				globalSoundObject.load(request);
				globalSoundChannel = globalSoundObject.play();
				
			}
			catch(err:Error)
			{
				trace("No Audio Available - Maybe can not have spaces perhaps???")
			}
			
			function progressHandler(event:ProgressEvent):void {
				var loadTime:Number = event.bytesLoaded / event.bytesTotal;
				var LoadPercent:uint = Math.round(100 * loadTime);
				trace(LoadPercent);
				
				
			}
			
			function errorHandler(errorEvent:IOErrorEvent):void {
				errorCallback(errorEvent.text)
			}		
			
			function completeHandler(event:Event):void {  
				
				if(completeCallback != null)
				{
				completeCallback(Math.round(globalSoundObject.length));
				}
			}
			
			return globalSoundObject;
		}
		
	
}