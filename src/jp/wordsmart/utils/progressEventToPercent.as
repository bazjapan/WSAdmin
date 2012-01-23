package jp.wordsmart.utils
{
	import flash.events.ProgressEvent;

	public function progressEventToPercent(progressEvent:ProgressEvent):Number
	{
		return Math.floor(progressEvent.bytesLoaded/progressEvent.bytesTotal * 100);
	}
	
}