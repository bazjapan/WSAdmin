package jp.wordsmart.utils.audio.mp3
{
	import com.fastforwardthinker.util.mp3.MP3InfoUtil;
	import com.fastforwardthinker.util.mp3.events.MP3InfoEvent;

	public class MP3InfoLoader
	{
		
		public function MP3InfoLoader()
		{
			
			MP3InfoUtil.addEventListener(MP3InfoEvent.COMPLETE,onComplete);
			MP3InfoUtil.addEventListener(MP3InfoEvent.ERROR,onError);
		}
		/* The value object returned to the responder contains the following 
		* properties which describe the mpeg file that was analyzed:
		* 
		* bitRate 			: int 		- the bit rate, in Kbps, of the mpeg file (e.g. 192, 128, etc) 
		* sampleRate 		: int 		- the sample rate, in Hz, of the mpeg file (e.g. 44100)  
		* mpegLayer 		: int 		- the mpeg layer ( 1, 2 or 3 )
		* mpegVersion 		: Number 	- the mpeg version ( 1 , 2, or 2.5 )
		* channelMode 		: String 	- type of channel mode used ( 'mono', 'stereo', 'joint stereo' or 'dual channel')
		* channels 		: int 		- the number of channels ( 1 or 2 )
		* lengthBytes 		: int 		- the length of the file, in bytes
		* lengthSeconds 	: int 		- the playback length of the file, in seconds
		* lengthFormatted 	: String 	- human-readable time string, in the format [hh:]mm:ss
		* frameCount		: int 		- the number of frames in the mpeg file 
		* isVBR 			: Boolean	- does the mpeg file employ varible bit-rate encoding?
		* isCBR 			: Boolean	- does the mpeg file employ constant bit-rate encoding? 
		* 
		*/	
		public static const MP3INFO_LOAD_SUCCESSFULL:String = "MP3INFO_LOAD_SUCCESSFULL";
		public static const MP3INFO_LOAD_FAIL:String = "MP3INFO_LOAD_FAIL";
		
		public var bitRate:int = 0;
		public var sampleRate:int = 0;
		public var mpegLayer:int = 0;
		public var mpegVersion:Number = 0;
		public var channelMode:String = "";
		public var channels:int = 0;
		public var lengthBytes:int = 0;
		public var lengthSeconds:Number = 0;
		public var lengthFormatted:String = "00:00";
		public var frameCount:Number = 0;
		public var isVBR:Boolean;
		public var isCBR:Boolean;
		

		public var resultCallback:Function
		
		private function onError(event:MP3InfoEvent):void
		{
			trace("MP3InfoLoader-Error")
			if(resultCallback == null)return;
			resultCallback(MP3INFO_LOAD_FAIL, this);
		}

		private function onComplete(event:MP3InfoEvent):void
		{
			trace("MP3InfoLoader-Complete")
			for( var key:String in event.info )
			{
				this[key] = event.info[key];
			}
			if(resultCallback == null)return;
			resultCallback(MP3INFO_LOAD_SUCCESSFULL, this);
		}
		
		public function tryLoad(url:String, stealthy:Boolean, callback:Function):void
		{
		resetValues();
		resultCallback = callback;
		MP3InfoUtil.getInfo(url, stealthy);
		}
		
		
		private function resetValues():void
		{
			bitRate= 0;
			sampleRate= 0;
			mpegLayer= 0;
			mpegVersion= 0;
			channelMode = "";
			channels= 0;
			lengthBytes= 0;
			lengthSeconds= 0;
			lengthFormatted = "00:00";
			frameCount= 0;
			isVBR = false;
			isCBR = false;
		}
		
		
		
	}
}