package jp.wordsmart.events
{
	import flash.events.Event;
	
	public class PercentEvent extends Event
	{
		public var percent:Number;
		public function PercentEvent(type:String, percent:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.percent = percent;
			super(type, bubbles, cancelable);
		}
	}
}