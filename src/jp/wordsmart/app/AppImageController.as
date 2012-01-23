package jp.wordsmart.app
{
	import flash.events.Event;
	
	import jp.wordsmart.dto.WSImage;
	import jp.wordsmart.events.ImageEvent;
	
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.Application;
	
	import ui.titlewindows.AWindowSkin;
	import ui.titlewindows.CollapsibleTitleWindow;
	
	import views.image.WSImageViewer;
	import views.image.WordSmartSlideAdder;
	
	public class AppImageController extends AppController
	{
		//define main popup components
		public var slideAdder:WordSmartSlideAdder;
		private var slideAdderWrapper:CollapsibleTitleWindow;
		public var slideViewer:WSImageViewer;
		private var slideViewerWrapper:CollapsibleTitleWindow;

		public function AppImageController(theApp:Application)
		{
			super(theApp);
			app.addEventListener(ImageEvent.EVENT_ADD_IMAGE,onEVENT_ADD_IMAGE);
			app.addEventListener("OPEN_SLIDE_ADDER",onOPEN_SLIDE_ADDER);
			app.addEventListener(ImageEvent.EVENT_SHOW_IMAGE,onEVENT_SHOW_IMAGE);
			app.addEventListener(ImageEvent.EVENT_SHOW_IMAGE_DETAILS,onEVENT_SHOW_IMAGE_DETAILS);
			
		}

		private function onEVENT_SHOW_IMAGE_DETAILS(event:ImageEvent):void
		{
			event.stopImmediatePropagation();
			openSlideAdder();
			slideAdder.editImageDetail(event.image);
		}

		private function onEVENT_SHOW_IMAGE(event:ImageEvent):void
		{
			event.stopImmediatePropagation();
			openSlideViewer(event.image);
		}

		
		private function onOPEN_SLIDE_ADDER(event:Event):void
		{
			event.stopImmediatePropagation();
			var notOpened:Boolean = slideAdder == null;
			openSlideAdder();
			if(notOpened)slideAdder.goToState("start");
		}

		private function onEVENT_ADD_IMAGE(event:ImageEvent):void
		{
			event.stopImmediatePropagation();
			openSlideAdder();
			slideAdder.editImage(event.image);
			
		}
		
		
		
		
		
		
		
		private function openSlideAdder():void
		{
			if(!slideAdderWrapper)
			{
			//once
			slideAdderWrapper = new CollapsibleTitleWindow;
			slideAdder = new WordSmartSlideAdder;
			slideAdder.width = 650;
			slideAdder.height= 545;
			slideAdderWrapper.title = "Slide Editor";
			slideAdderWrapper.addElement(slideAdder);
			slideAdderWrapper.setStyle("skinClass", AWindowSkin);
			PopUpManager.addPopUp(slideAdderWrapper,app);
			PopUpManager.centerPopUp(slideAdderWrapper);
			
			slideAdderWrapper.addEventListener(CloseEvent.CLOSE, function(ce:CloseEvent):void
			{
				PopUpManager.removePopUp(slideAdderWrapper);
			});
			}
			else
			{
				slideAdderWrapper.minimized = false;
				PopUpManager.removePopUp(slideAdderWrapper);
				PopUpManager.addPopUp(slideAdderWrapper,app);
			}
		}
		
		private function openSlideViewer(img:WSImage):void
		{
			if(!slideViewerWrapper)
			{
				//once
				slideViewerWrapper = new CollapsibleTitleWindow;
				slideViewer = new WSImageViewer;
				slideViewer.width = 650;
				slideViewer.height= 490;
				slideViewerWrapper.title = "Slide Viewer";
				slideViewerWrapper.addElement(slideViewer);
				slideViewerWrapper.setStyle("skinClass", AWindowSkin);
				PopUpManager.addPopUp(slideViewerWrapper,app);
				PopUpManager.centerPopUp(slideViewerWrapper);
				
				slideViewerWrapper.addEventListener(CloseEvent.CLOSE, function(ce:CloseEvent):void
				{
					PopUpManager.removePopUp(slideViewerWrapper);
				});
			}
			else
			{
				slideViewerWrapper.minimized = false;
				PopUpManager.removePopUp(slideViewerWrapper);
				PopUpManager.addPopUp(slideViewerWrapper,app);
			}
			slideViewer.image = img;
		}
	
	
	}
}