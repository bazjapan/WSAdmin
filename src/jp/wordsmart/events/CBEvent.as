package jp.wordsmart.events
{
	import flash.events.Event;
	
	public class CBEvent extends Event
	{
		public var data:Object;
		public var callbacks:Array = [];
		
		
		public function CBEvent(type:String, callbacks:Array = null, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.data = data;
			
			
			super(type, bubbles, cancelable);
			
			if(callbacks)
			for each (var cb:Function in callbacks)
			{
				this.callbacks.push(cb);
			}
		}
		
		public function playCallbacks(remove:Boolean = true):void
		{
			for (var i:int = 0; i < callbacks.length; i++)
			{
				callbacks[i]();
				callbacks.slice(i,1);
			}
		}
		
		public override function clone():Event
		{
			return new CBEvent(type,callbacks,data,bubbles,cancelable);
		}
	}
}