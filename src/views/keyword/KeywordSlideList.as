package views.keyword
{
	import com.pbsmediatech.json.utils.extractResult;
	
	import flash.events.MouseEvent;
	
	import jp.wordsmart.dto.WSImage;
	import jp.wordsmart.events.ImageEvent;
	import jp.wordsmart.json.controllers.WSImageController;
	import jp.wordsmart.json.utils.WSImageResultHelper;
	import jp.wordsmart.model.AppModel;
	import jp.wordsmart.model.KeywordAdminModel;
	import jp.wordsmart.slide.makeDefaultSlide;
	import jp.wordsmart.utils.app.getServiceBaseURL;
	
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.List;
	
	import utils.stringList.listAppend;
	
	import views.tasks.addTagToSlide;
	
	public class KeywordSlideList extends List
	{
		public function KeywordSlideList()
		{
			super();
			//updateList();
			KeywordAdminModel.getInstance().selectedKeyword_attachedImages.addEventListener(CollectionEvent.COLLECTION_CHANGE, onSelectedKeywordAttachedImageCollectionChange);
			
		}
		private var imageController:WSImageController;
		
		public function reset():void
		{
			this.selectedItem = null;
		}
		
		public function updateList():void
		{
			//getImagesMatchingKeywordText();
			KeywordAdminModel.getInstance().selectedKeyword_attachedImages.source = [];
		}
		
		private var lastLoadedImagesSelectedKeywordID:Number;
		public function getImagesMatchingKeywordText():void
		{
			
			if(KeywordAdminModel.getInstance().selectedKeyword == null){return};
			if(KeywordAdminModel.getInstance().selectedKeyword.keyword_text == null ||
				KeywordAdminModel.getInstance().selectedKeyword.keyword_text == ""){return};
			trace("KeywordSlideList - trying to get images LIKE "+KeywordAdminModel.getInstance().selectedKeyword.keyword_text);
			if(imageController == null){imageController = new WSImageController(getServiceBaseURL())};
			//if(KeywordAdminModel.getInstance().selectedKeyword.keyword_ID == lastLoadedImagesSelectedKeywordID){return};
			//lastLoadedImagesSelectedKeywordID = KeywordAdminModel.getInstance().selectedKeyword.keyword_ID;
			KeywordAdminModel.getInstance().selectedKeyword_attachedImages.source = [];
			
			//v0.01 - was linking keywords and images from v0.02 just tagging images
			/*imageController.get_images_connected_to_keyword(KeywordAdminModel.getInstance().selectedKeyword.keyword_ID,function(evt:ResultEvent):void
			{
				var objs:Array = new WSImageResultHelper().resultToArray(extractResult(evt));
				KeywordAdminModel.getInstance().selectedKeyword_attachedImages.source = objs;
				trace(KeywordAdminModel.getInstance().selectedKeyword_attachedImages.length+" slides loaded")
				
			});*/
			var search_term:String = KeywordAdminModel.getInstance().selectedKeyword.keyword_text;
			imageController.search_image_title_content_and_tags({search_term:search_term,total_num_results:20,start_index:0},function(evt:ResultEvent):void
			{
				var helper:WSImageResultHelper = new WSImageResultHelper()
				if(helper.resultIsGood(extractResult(evt)))
					{
				var objs:Array = helper.resultToArray(extractResult(evt));
				KeywordAdminModel.getInstance().selectedKeyword_attachedImages.source = objs;
				trace(KeywordAdminModel.getInstance().selectedKeyword_attachedImages.length+" slides loaded")
					}
			});
								
		}
		
		public function openSlideAdder():void
		{
			var newSlide:WSImage = makeDefaultSlide(AppModel.getInstance().signedInContributor.ID);
			var tag:String = KeywordAdminModel.getInstance().selectedKeyword.keyword_text;
			addTagToSlide(tag,newSlide);
			dispatchEvent(new ImageEvent(ImageEvent.EVENT_ADD_IMAGE,newSlide,true));
		}
		public function openSlideDetails():void
		{	var imageToShow:WSImage = this.selectedItem;
			if(imageToShow == null)return;
			dispatchEvent(new ImageEvent(ImageEvent.EVENT_SHOW_IMAGE_DETAILS,imageToShow,true));
		}
		public function openSlideViewer(event:MouseEvent = null):void
		{
			var imageToShow:WSImage = this.selectedItem;
			if(imageToShow == null)return;
			dispatchEvent(new ImageEvent(ImageEvent.EVENT_SHOW_IMAGE,imageToShow,true));
			
		}
		
		public function removeSlideFromKeyword():void
		{
			if(!KeywordAdminModel.getInstance().selectedKeyword)return;
			if(!this.selectedItem)return;
			KeywordAdminModel.getInstance().selectedKeyword_attachedImages.removeItemAt(KeywordAdminModel.getInstance().selectedKeyword_attachedImages.getItemIndex(this.selectedItem));
		}
		
		private function onSelectedKeywordAttachedImageCollectionChange(event:CollectionEvent):void
		{
			try
			{
				if(!event.items>0)return;
				var image:WSImage = event.items[0] as WSImage;
				
				if(event.kind == CollectionEventKind.ADD)
				{
					trace("WARNING - NO LONGER IN OPERATION")
					/*imageController.add_image_to_keyword(image, KeywordAdminModel.getInstance().selectedKeyword.keyword_ID, function(evt:ResultEvent):void
					{
						trace(evt.result.toString())
					});
					
					if(isNaN(image.image_ID))
					{
						trace("the image is not a wordsmart image - plaese add to image remote store")
					}*/
				}
				else if(event.kind == CollectionEventKind.REMOVE)
				{
					trace("image removed "+KeywordAdminModel.getInstance().selectedKeyword.keyword_text);
					trace("image ID is"+ image.image_ID);
					trace("remove from"+ KeywordAdminModel.getInstance().selectedKeyword.keyword_ID);
					imageController.remove_ws_images_by_image_ID(image, function(evt:ResultEvent):void
					{
						trace(evt.result.toString());
					});
					
					
				}
			}
			catch(err:Error)
			{
				trace(err)
			}
			
		}

		
		
		
	}
}