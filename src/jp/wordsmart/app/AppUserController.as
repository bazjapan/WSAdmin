package jp.wordsmart.app
{
	
	import jp.wordsmart.events.ContributerEvent;
	import jp.wordsmart.model.AppModel;
	
	import spark.components.Application;

	public class AppUserController extends AppController
	{
		public function AppUserController(theApp:Application)
		{
			super(theApp);
			app.addEventListener(ContributerEvent.EVENT_CONTRIBUTER_LOGGED_ON,onEVENT_CONTRIBUTER_LOGGED_ON);
			app.addEventListener(ContributerEvent.EVENT_CONTRIBUTER_REGISTERED, onEVENT_CONTRIBUTER_REGISTERED);
		}

		private function onEVENT_CONTRIBUTER_REGISTERED(event:ContributerEvent):void
		{
			AppModel.getInstance().signedInContributor = event.contributor;
			doSetUp();
			app.currentState = "start";
		}

		private function onEVENT_CONTRIBUTER_LOGGED_ON(event:ContributerEvent):void
		{
			AppModel.getInstance().signedInContributor = event.contributor;
			doSetUp();
			app.currentState = "keywordAdmin";
		}
		private function doSetUp():void
		{
			AppModel.getInstance().currentBaseLanguage = AppModel.getInstance().signedInContributor.getBaseLanguage();
		}
	}
}