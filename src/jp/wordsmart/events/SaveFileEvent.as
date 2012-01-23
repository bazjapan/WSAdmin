package jp.wordsmart.events
{
	import flash.events.Event;
	import flash.filesystem.File;
	
	public class SaveFileEvent extends Event
	{
		public static const SAVE_IMAGE_FILE_EVENT:String = "SAVE_IMAGE_FILE_EVENT";
		public static const WAV_DESKTOP_SAVE_COMPLETE_EVENT:String = "WAV_DESKTOP_SAVE_COMPLETE_EVENT";
		public var file:File;
		
		public function SaveFileEvent(type:String,file:File)
		{
			this.file = file;
			super(type, true, true);
		}
	}
}