package jp.wordsmart.utils.image
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import jp.wordsmart.dto.WSKeyword;
	import jp.wordsmart.dto.WSImage;
	import jp.wordsmart.dto.nested.KeywordTranslation;
	import jp.wordsmart.events.ImageEvent;
	import jp.wordsmart.utils.jsonhelpers.KeywordTranslationResultHelper;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.managers.PopUpManager;
	
	import views.image.old.ImageFinder2;
	import views.image.old.ImageFinder3;
	/**
	 * 
	 * @author Jan
	 * OUT OF SERVICE
	 */
	public class ImageFinderPopper
	{
		public function ImageFinderPopper()
		{
		}
		
		
		private var imageFinderNotPopped:Boolean = true;
		
		

		[Bindable]
		public function get selectedKeyword():WSKeyword
		{
			return _selectedKeyword;
		}

		public function set selectedKeyword(value:WSKeyword):void
		{
			_selectedKeyword = value;
			if(imageFinder!=null)
			{
				var exists:Boolean;
				for each (var str:String in imageFinder.possibleSearchTerms)
				{
				if(str == value.keyword_text)
				{
					exists = true;
					break;
				}
				}
				if(!exists)
				{
					imageFinder.possibleSearchTerms.addItem(value.keyword_text);
					imageFinder.cb_searchTerms.selectedItem = value.keyword_text;
				}
			}
		}

		private var _selectedKeyword:WSKeyword;
		private var imageFinder:ImageFinder3;
		public function openImageFinderPop(selectedKW:WSKeyword, imageCollection:ArrayCollection, displayObj:DisplayObject):void
		{
			this.selectedKeyword = selectedKW;
			if(!imageFinder){imageFinder = new ImageFinder3}
			imageFinder.minimized = false;
			
			PopUpManager.removePopUp(imageFinder);
			PopUpManager.addPopUp(imageFinder,displayObj);
			if(selectedKeyword)
			{
				var possVals:Array = [];
				var translations:Array = new KeywordTranslationResultHelper().convertToArray(selectedKeyword.keyword_translations);
				possVals.push(selectedKeyword.keyword_text);
				for each (var trans:KeywordTranslation in translations)
				{
					possVals.push(trans.translation_text);
				}
				imageFinder.setPossibleSearchTerms(possVals);
			}
			// TODO Auto-generated method stub
			
			
			//only add event handler once;
			if(imageFinderNotPopped)
			{
				imageFinder.addEventListener(ImageEvent.ADD_IMAGE_TO_KEYWORD, function(evt:ImageEvent):void
				{
					if(selectedKeyword)
					{
						var imageToAdd:WSImage = evt.image;
						var hit:Boolean;
						for each (var image:WSImage in imageCollection)
						{
							if(image.url == imageToAdd.url)
							{
								hit = true;
								break;
							}
						}
						if(!hit)
						{
							imageCollection.addItem(imageToAdd);
						}
						
					}
					else
					{
						var alert:Alert = Alert.show("No Keyword Selected");
						var timer:Timer = new Timer(3000,1);
						timer.reset();
						timer.start()
						timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(evt:TimerEvent):void
						{
							if(alert)
							PopUpManager.removePopUp(alert);
						});
					}
				});
			}
			imageFinderNotPopped = false;
		}

	}
}