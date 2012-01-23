package jp.wordsmart.image.providers
{
	import jp.wordsmart.DomainSettings;
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.json.controllers.WSImageController;
	import jp.wordsmart.json.utils.WSImageResultHelper;
	import jp.wordsmart.model.AppModel;
	
	import mx.rpc.events.ResultEvent;

	public class WordSmartImageProvider extends ImageProvider
	{
		public function WordSmartImageProvider()
		{
			super();
		}
		public var useLocalController:Boolean = AppModel.getInstance().useLocalControllers;
		private var wordsmartImageController:WSImageController = new WSImageController(DomainSettings.API_URL);
		
		override public function searchForImages(searchTerm:String, startIndex:int, completeFunc:Function, errorFunc:Function, exact:Boolean = false):void
		{
			var cachedResult:Object = getFromCache(searchTerm,startIndex,defaultNumberOfResults, exact);
			if(cachedResult){completeFunc(cachedResult.images, searchTerm);return};
			
			var params:Object = new Object;
			params.search_term = searchTerm;
			params.start_index = startIndex;
			params.total_num_results = defaultNumberOfResults;
			wordsmartImageController.search_image_title_content_and_tags(params, function(evt:ResultEvent):void
			{
				try
				{
					var images:Array = new WSImageResultHelper().resultToArray(evt.result as String);
					addResultToCache(images,searchTerm,startIndex,defaultNumberOfResults,exact);
					completeFunc(images, searchTerm);
				}
				catch(err:Error)
				{
					errorFunc(err);
					trace(err.toString())
				}
			});
			
				
				
		}
	}
}