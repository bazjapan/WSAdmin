package jp.wordsmart.events
{
	import flash.display.BitmapData;
	import flash.events.Event;
	
	import jp.wordsmart.dto.WSImage;
	
	public class SlideEvent extends Event
	{
		public static const EVENT_REGISTER_SLIDE:String = "EVENT_REGISTER_SLIDE";
		public static const EVENT_SLIDE_REGISTERED:String = "EVENT_SLIDE_REGISTERED";
		public static const EVENT_UPDATE_SLIDE:String = "EVENT_UPDATE_SLIDE";
		public static const EVENT_SLIDE_UPDATED:String = "EVENT_SLIDE_UPDATED";
		public static const EVENT_UPDATE_SLIDE_DETAILS:String = "EVENT_UPDATE_SLIDE_DETAILS";
		public static const EVENT_SLIDE_DETAILS_UPDATED:String = "EVENT_SLIDE_DETAILS_UPDATED";
		
		public var slide:WSImage;
		public var bitmapData:BitmapData;
		public var callback:Function;//returns nothing;
		public function SlideEvent(type:String, theSlide:WSImage, callback:Function = null,  bubbles:Boolean=false, cancelable:Boolean=false)
		{
			slide = theSlide;
			this.callback = callback;
			super(type, bubbles, cancelable);
		}
	
	}
}