package jp.wordsmart.utils.audio.mp3
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SampleDataEvent;
	import flash.media.ID3Info;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import utils.http.getStealthURLRequest;
	import utils.number.addLeadingZero;
	
	public class MP3Player extends EventDispatcher
	{
		public function MP3Player()
		{
			super();
		}
		
		public static const EVENT_TIME_CHANGE:String = 'Mp3PlayerTimeChange';
		public static const EVENT_VOLUME_CHANGE:String = 'Mp3PlayerVolumeChange';
		public static const EVENT_PAN_CHANGE:String = 'Mp3PlayerPanningChange';
		public static const EVENT_PAUSE:String = 'Mp3PlayerPause';
		public static const EVENT_UNPAUSE:String = 'Mp3PlayerUnpause';
		public static const EVENT_PLAY:String = 'Mp3PlayerPlay';
		public static const EVENT_IOERROR:String = 'Mp3PlayerIOERROR';
		public static const EVENT_LOADED:String = 'Mp3SoundLoaded';
		public static const EVENT_AUDIO_ENDED:String = 'Mp3AudioEnded';
		
		
		
		public var playing:Boolean;
		public var playlist:Array;
		public var currentUrl:String;
		public var playlistIndex:int = -1;
		
		//
		protected var sound:Sound;
		protected var soundChannel:SoundChannel;
		protected var soundTrans:SoundTransform;
		protected var progressInt:Number;
		
		
		
		public function play( url:String, requestStealthily:Boolean):void {
			clearInterval(progressInt);
			if ( sound ) {
				soundChannel.stop();
			}
			currentUrl = url;
			sound = new Sound();
			sound.addEventListener(Event.COMPLETE, onLoadSong);
			sound.addEventListener(Event.ID3, onId3Info);
			sound.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			sound.addEventListener(SampleDataEvent.SAMPLE_DATA,onSampleData);
			
			if(requestStealthily)
			{
				sound.load(getStealthURLRequest(url));
			}
			else
			{
			sound.load(new URLRequest(currentUrl));
			}
			
			soundChannel = sound.play();
			if ( soundTrans ) {
				soundChannel.soundTransform = soundTrans;
			} else {
				soundTrans = soundChannel.soundTransform;
			}
			soundChannel.addEventListener(Event.COMPLETE, onSongEnd);
			playing = true;
			clearInterval(progressInt);
			progressInt = setInterval(updateProgress, 30);
			dispatchEvent(new Event(EVENT_PLAY));
		}

		private function onSampleData(event:SampleDataEvent):void
		{
			trace("onSampleData "+event)
		}

		private function onIoError(event:IOErrorEvent):void
		{
			dispatchEvent(new Event(EVENT_IOERROR));
		}
		
		public function pause():void {
			if ( soundChannel ) {
				soundChannel.stop();
				dispatchEvent(new Event(EVENT_PAUSE));
				playing = false;
			}
		}
		public function unpause():void {
			if ( playing ) return;
			if ( soundChannel.position < sound.length ) {
				soundChannel = sound.play(soundChannel.position);
				soundChannel.soundTransform = soundTrans;
			} else {
				soundChannel = sound.play();
			}
			dispatchEvent(new Event(EVENT_UNPAUSE));
			playing = true;
		}
		public function stop():void
		{
			soundChannel.stop();
			playing = false;
		}
		public function seek( percent:Number ):void {
			soundChannel.stop();
			soundChannel = sound.play(sound.length * percent);
		}
		public function prev():void {
			//playlistIndex--;
			//if ( playlistIndex < 0 ) playlistIndex = playlist.length - 1;
			//play(playlist[playlistIndex]);
		}
		public function next():void {
			//playlistIndex++;
			//if ( playlistIndex == playlist.length ) playlistIndex = 0;
			//play(playlist[playlistIndex]);
		}
		public function get volume():Number {
			if (!soundTrans) return 0;
			return soundTrans.volume;
		}
		public function set volume( n:Number ):void {
			if ( !soundTrans ) return;
			soundTrans.volume = n;
			soundChannel.soundTransform = soundTrans;
			dispatchEvent(new Event(EVENT_VOLUME_CHANGE));
		}
		public function get pan():Number {
			if (!soundTrans) return 0;
			return soundTrans.pan;
		}
		public function set pan( n:Number ):void {
			if ( !soundTrans ) return;
			soundTrans.pan = n;
			soundChannel.soundTransform = soundTrans;
			dispatchEvent(new Event(EVENT_PAN_CHANGE));
		}
		public function get length():Number {
			if(!sound)return 0;
			return sound.length;
		}
		public function get time():Number {
			return soundChannel.position;
		}
		public function get timePretty():String {
			var secs:Number = soundChannel.position / 1000;
			var mins:Number = Math.floor(secs / 60);
			secs = Math.floor(secs % 60);
			return addLeadingZero(mins) + ":" + addLeadingZero(secs);
		}
		public function get timePercent():Number {
			if ( !sound.length ) return 0;
			return soundChannel.position / sound.length;
		}
		protected function onLoadSong( e:Event ):void {
			if(sound)
			dispatchEvent(new Event(EVENT_LOADED));
		}
		protected function onSongEnd( e:Event ):void {
			playing = false;
			dispatchEvent(new Event(EVENT_AUDIO_ENDED));
			if ( playlist )
				next();
		}
		protected function onId3Info( e:Event ):void {
			if(sound.id3 == null){return};
			var audioInfo:ID3Info = ID3Info(sound.id3)
			for( var key:String in audioInfo )
			{
				trace(audioInfo[key]);
			}
			
			dispatchEvent(new Event(Event.ID3, e.target.id3));
		}
		protected function updateProgress():void {
			dispatchEvent(new Event(EVENT_TIME_CHANGE));
			if ( timePercent >= .99 ) {
				onSongEnd(new Event(Event.COMPLETE));
				clearInterval(progressInt);
			}
		}
		
		public function getData():ByteArray
		{
			var data:ByteArray = new ByteArray;
			sound.extract(data,sound.length*44.1);
			data.position = 0;
			return data;
		}
		
	}
	
	
	
}