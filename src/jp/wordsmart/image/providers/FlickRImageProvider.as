package jp.wordsmart.image.providers
{
	import com.adobe.serialization.json.JSON;
	
	import jp.wordsmart.dto.WSImage;
	import jp.wordsmart.image.providers.searches.flickRImageSearch;
	
	import mx.rpc.events.ResultEvent;

	public class FlickRImageProvider extends ImageProvider
	{
		public function FlickRImageProvider()
		{
			super();
		}
		
		override public function searchForImages(searchTerm:String, startIndex:int, completeFunc:Function, errorFunc:Function, exact:Boolean = false):void
		{
			var cachedResult:Object = getFromCache(searchTerm,startIndex,defaultNumberOfResults, exact);
			if(cachedResult){completeFunc(cachedResult.images, searchTerm);return};
			
				var images:Array = [];	
				flickRImageSearch(searchTerm, startIndex, defaultNumberOfResults, function(evt:ResultEvent):void
				{
					var images:Array = [];
					var json:Object = JSON.decode(evt.result as String);
					try{
						var count:int = int(json["query"]["count"])	
						for (var i:int = 0; i < count; i++)
						{
							var flickRImageResult:Object = json["query"]["results"]["photo"][i] as Object;
							var image:WSImage = new WSImage();
							image.image_title = flickRImageResult["title"];//title of image
							image.image_url = "http://static.flickr.com/"+flickRImageResult["server"]+ '/' +flickRImageResult["id"]+ '_' + flickRImageResult["secret"] + '.jpg';
							image.image_refererurl = "http://www.flickr.com";
							image.image_w = 0;
							image.image_h = 0;
							image.image_tn_w = 0;
							image.image_tn_h = 0;
							image.image_tn_url = "http://static.flickr.com/"+flickRImageResult["server"]+ '/' +flickRImageResult["id"]+ '_' + flickRImageResult["secret"] + '_s.jpg';
							image.image_content = "";
							image.image_size = 0;
							image.image_filename = "";
							image.image_mimetype = "image/jpeg";
							image.image_tags = searchTerm;	
							image.image_orig_url = image.image_url;
							image.image_copyright = "Image sourced via FlickR";
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