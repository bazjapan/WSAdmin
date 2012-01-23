package jp.wordsmart.events
{
	import flash.events.Event;
	
	import jp.wordsmart.dto.Contributer;
	
	public class ContributerEvent extends Event
	{
		public static const EVENT_CONTRIBUTER_LOGGED_ON:String = "EVENT_CONTRIBUTER_LOGGED_ON";
		public static const EVENT_CONTRIBUTER_REGISTERED:String = "EVENT_CONTRIBUTER_REGISTERED";
		public var callback:Function;
		public var contributor:Contributer;
		public function ContributerEvent(type:String, contributor:Contributer,bubbles:Boolean=false, callbackFunc:Function = null)
		{
			callback = callbackFunc;
			this.contributor = contributor;
			super(type, bubbles, cancelable);
		}
	}
}