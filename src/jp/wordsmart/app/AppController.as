package jp.wordsmart.app
{
	import flash.events.EventDispatcher;
	
	import spark.components.Application;

	public class AppController extends EventDispatcher
	{
		public function AppController(theApp:Application)
		{
			app = theApp;
		}
		public var app:Application;
	}
}