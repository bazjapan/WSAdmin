package jp.wordsmart.app
{
	import flash.events.EventDispatcher;
	
	import jp.wordsmart.events.AudioEvent;
	
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.Application;
	
	import ui.titlewindows.AWindowSkin;
	import ui.titlewindows.CollapsibleTitleWindow;
	
	import views.audio.WordSmartAudioAdder3;

	public class AppAudioController extends AppController
	{
		public function AppAudioController(theApp:Application)
		{
			super(theApp);
			app.addEventListener(AudioEvent.EVENT_AUDIO_FROM_COMPUTER_FILE, onEVENT_AUDIO_FROM_COMPUTER_FILE);
			app.addEventListener(AudioEvent.EVENT_AUDIO_FROM_TEXT_TO_SPEECH,onEVENT_AUDIO_FROM_TEXT_TO_SPEECH );
			app.addEventListener(AudioEvent.EVENT_AUDIO_FROM_WEB_URL, onEVENT_AUDIO_FROM_WEB_URL);
			app.addEventListener(AudioEvent.EVENT_RECORD_AUDIO, onEVENT_RECORD_AUDIO);
			app.addEventListener(AudioEvent.EVENT_ADD_AUDIO, onEVENT_ADD_AUDIO);
		}

		private function onEVENT_ADD_AUDIO(event:AudioEvent):void
		{
			openAudioAdder();
			audioAdder.goToState("start");
		}
		
		//define main popup components
		public var audioAdder:WordSmartAudioAdder3;
		private var wrapper:CollapsibleTitleWindow;

		private function onEVENT_RECORD_AUDIO(event:AudioEvent):void
		{
			openAudioAdder();
			audioAdder.goToState("recorder");
			audioAdder.cc_audio_recorder.audio = event.audioVO;
		}

		private function onEVENT_AUDIO_FROM_WEB_URL(event:AudioEvent):void
		{
			openAudioAdder();
			audioAdder.goToState("addFromWeb");
			audioAdder.cc_addFromWeb.audio = event.audioVO;
		}

		private function onEVENT_AUDIO_FROM_TEXT_TO_SPEECH(event:AudioEvent):void
		{
			openAudioAdder();
			audioAdder.goToState("addFromProvider");
			audioAdder.cc_addFromProvider.audio = event.audioVO;
		}
		
		private function onEVENT_AUDIO_FROM_COMPUTER_FILE(event:AudioEvent):void
		{
			openAudioAdder();
			audioAdder.goToState("addFiles");
			audioAdder.cc_addFromFile.audio = event.audioVO;
		}
		public function openAudioAdder():void
		{
			if(!wrapper)
			{
			//once
			wrapper = new CollapsibleTitleWindow;
			audioAdder = new WordSmartAudioAdder3;
			audioAdder.width = 640;
			audioAdder.height= 480;
			
			wrapper.title = "Audio";
			wrapper.addElement(audioAdder);
			wrapper.setStyle("skinClass", AWindowSkin);
			PopUpManager.addPopUp(wrapper,app);
			PopUpManager.centerPopUp(wrapper);
			
			wrapper.addEventListener(CloseEvent.CLOSE, function(ce:CloseEvent):void
			{
				PopUpManager.removePopUp(wrapper);
			});
			}
			else
			{
			wrapper.minimized = false;
			PopUpManager.removePopUp(wrapper);
			PopUpManager.addPopUp(wrapper,app);
			}
			
		}
	}
}