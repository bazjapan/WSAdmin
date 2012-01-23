package jp.wordsmart.image.providers
{
	import com.adobe.serialization.json.JSON;
	
	import jp.wordsmart.dto.WSImage;
	import jp.wordsmart.image.providers.searches.yahooImageSearch;
	
	import mx.rpc.events.ResultEvent;

	public class YahooImageProvider extends ImageProvider
	{
		public function YahooImageProvider()
		{
			super();
		}
		override public function searchForImages(searchTerm:String, startIndex:int, completeFunc:Function, errorFunc:Function, exact:Boolean = false):void
		{
			var cachedResult:Object = getFromCache(searchTerm,startIndex,defaultNumberOfResults, exact);
			if(cachedResult){completeFunc(cachedResult.images, searchTerm);return};
				
			var images:Array = [];	
			yahooImageSearch(searchTerm, startIndex, defaultNumberOfResults, function(evt:ResultEvent):void
			{
				var json:Object = JSON.decode(evt.result as String);
				try{
					var count:int = int(json["query"]["count"])	
					for (var i:int = 0; i < count; i++)
					{
						//bingified
						var yahooImageResult:Object = json["query"]["results"]["ImageResult"][i] as Object;
						var image:WSImage = new WSImage();
						image.image_title = yahooImageResult["Title"];//title of image
						image.image_url = yahooImageResult["MediaUrl"];
						image.image_refererurl = yahooImageResult["DisplayUrl"];
						image.image_w = yahooImageResult["Width"];
						image.image_h = yahooImageResult["Height"];
						image.image_tn_w = yahooImageResult["Thumbnail"]["Width"];
						image.image_tn_h = yahooImageResult["Thumbnail"]["Height"];
						image.image_tn_url = yahooImageResult["Thumbnail"]["Url"];
						image.image_content = "";
						image.image_size = yahooImageResult["FileSize"];
						image.image_filename = "";
						image.image_mimetype = yahooImageResult["ContentType"];
						image.image_tags = searchTerm;	
						image.image_orig_url = image.image_url;
						image.image_copyright = "Image sourced via Yahoo";
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