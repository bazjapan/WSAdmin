package jp.wordsmart.image.providers
{
	import be.boulevart.google.ajaxapi.search.images.data.GoogleImage;
	import be.boulevart.google.events.GoogleAPIErrorEvent;
	import be.boulevart.google.events.GoogleApiEvent;
	
	import flash.events.ErrorEvent;
	
	import jp.wordsmart.dto.WSImage;
	import jp.wordsmart.image.providers.searches.googleImageSearch;
	
	import utils.string.stripHTMLTags;

	public class GoogleImageProvider extends ImageProvider
	{
		public function GoogleImageProvider()
		{
			super();
		}
		
		override public function searchForImages(searchTerm:String, startIndex:int, completeFunc:Function, errorFunc:Function, exact:Boolean = false):void
		{
			var cachedResult:Object = getFromCache(searchTerm,startIndex,defaultNumberOfResults, exact);
			if(cachedResult){completeFunc(cachedResult.images, searchTerm);return};
			
			var images:Array = [];
			
			googleImageSearch(searchTerm, startIndex ,function(evt:GoogleApiEvent):void
			{
				try{
					var results:Array = evt["data"]["results"];
					for each (var result:GoogleImage in results)
					{
						var image:WSImage = new WSImage();
						image.image_title = stripHTMLTags(result.title);
						image.image_url = result.url;
						image.image_refererurl = result.originalContextUrl;
						image.image_w = int(result.width);
						image.image_h = int(result.height);
						image.image_tn_w = int(result.thumbWidth);
						image.image_tn_h = int(result.thumbHeight);
						image.image_tn_url = result.thumbUrl;
						image.image_content = stripHTMLTags(result.content);
						image.image_size = 0;
						image.image_filename = "";
						image.image_mimetype = "";
						image.image_tags = searchTerm;	
						image.image_orig_url = image.image_url;
						image.image_copyright = "Image sourced via Google";
						
						images.push(image);
					} 
					
				}
				catch(err:ErrorEvent)
				{
					errorFunc(err);
					trace(err.toString())
				}
				
				addResultToCache(images,searchTerm,startIndex,defaultNumberOfResults,exact);
				completeFunc(images, searchTerm);
			},
				function(err:GoogleAPIErrorEvent):void
				{
					if(err.responseDetails == "out of range start")
					{errorFunc(ERROR_SEARCH_OUT_OF_RANGE);}
					
					else{errorFunc('')}
				});
				
		}
	}
}