package jp.wordsmart.events
{
	import flash.events.Event;
	
	import jp.wordsmart.dto.WSImage;
	
	public class ImageEvent extends Event
	{
		public static const ADD_IMAGE_TO_KEYWORD:String = "ADD_IMAGE_TO_KEYWORD";
		public static const APPLY_VALUES_TO_IMAGES:String = "APPLY_VALUES_TO_IMAGES";
		
		
		public static const EVENT_EDIT_IMAGE:String = "EVENT_EDIT_IMAGE";
		public static const EVENT_SHOW_IMAGE_DETAILS:String = "EVENT_SHOW_IMAGE_DETAILS";
		public static const EVENT_SHOW_KEYWORD_DETAILS:String = "EVENT_SHOW_KEYWORD_DETAILS";
		public static const EVENT_UPDATE_IMAGE_TO_REMOTE:String = "EVENT_UPDATE_IMAGE_TO_REMOTE";
		public static const EVENT_ADD_IMAGE_TO_KEYWORD:String = "EVENT_ADD_IMAGE_TO_KEYWORD";
		
		
		//open Image/Slide Adder;
		public static const EVENT_ADD_IMAGE:String = "EVENT_ADD_IMAGE";
		public static const EVENT_SHOW_IMAGE:String = "EVENT_SHOW_IMAGE";
		
		
		

		public var image:WSImage;
		public var callback:Function;
		public function ImageEvent(type:String, image:WSImage, bubbles:Boolean=false, callback:Function = null)
		{
			this.image = image;
			this.callback = callback;
			super(type, bubbles, cancelable);
		}
	}
}