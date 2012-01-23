package jp.wordsmart.image.providers
{
	import com.adobe.serialization.json.JSON;
	
	import jp.wordsmart.dto.WSImage;
	import jp.wordsmart.image.providers.searches.bingImageSearch;
	
	import mx.rpc.events.ResultEvent;

	public class BingImageProvider extends ImageProvider
	{
		public function BingImageProvider()
		{
			super();
		}
		override public function searchForImages(searchTerm:String, startIndex:int, completeFunc:Function, errorFunc:Function, exact:Boolean = false):void
		{
			var cachedResult:Object = getFromCache(searchTerm,startIndex,defaultNumberOfResults, exact);
			if(cachedResult){completeFunc(cachedResult.images, searchTerm);return};
			
			var images:Array = [];	
			bingImageSearch(searchTerm, startIndex, defaultNumberOfResults, function(evt:ResultEvent):void
			{
				var json:Object = JSON.decode(evt.result as String);
				try{
					var imagesResults:Array = Array(json["SearchResponse"]["Image"]["Results"])[0]
					
					for (var i:int = 0; i < imagesResults.length; i++)
					{
						//bingified
						var bingImageResult:Object = imagesResults[i] as Object;
						var image:WSImage = new WSImage();
						image.image_title = bingImageResult["Title"];//title of image
						image.image_url = bingImageResult["MediaUrl"];
						image.image_refererurl = bingImageResult["DisplayUrl"];
						image.image_w = bingImageResult["Width"];
						image.image_h = bingImageResult["Height"];
						image.image_tn_w = bingImageResult["Thumbnail"]["Width"];
						image.image_tn_h = bingImageResult["Thumbnail"]["Height"];
						image.image_tn_url = bingImageResult["Thumbnail"]["Url"];
						image.image_content = "";
						image.image_size = bingImageResult["FileSize"];
						image.image_filename = "";
						image.image_mimetype = bingImageResult["ContentType"];
						image.image_tags = searchTerm;	
						image.image_orig_url = image.image_url;
						image.image_copyright = "Image sourced via Bing";
						images.push(image);
						
					}
					
				}
				catch(err:Error)
				{
					errorFunc(err);
					trace(err.toString())
				}
				
				addResultToCache(images,searchTerm,startIndex,defaultNumberOfResults,exact);
				completeFunc(images, searchTerm);
				
				
			});
			
		}
	}
}