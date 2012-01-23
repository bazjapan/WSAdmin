package jp.wordsmart.image.providers.searches
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	/*As of April 2011, Yahoo dropped image search so have changed to using bing.*/
	
	public function yahooImageSearch(searchTerm:String, startIndex:uint, numResults:uint, result:Function):void
	{
		var appID:String = ".RnHZfbV34FwfEcY177XluQgglhCs0Zcmh4cX5Xjm27Gww3aQBf2bL7AXcO4G9k-";
		//var baseURL:String = "http://search.yahooapis.com/ImageSearchService/V1/imageSearch"
		var baseURL:String = "http://query.yahooapis.com/v1/public/yql"
		var YQL_FORMAT:String = 'json';
		//old pre April 2011 var query:String = "select * from search.images("+startIndex.toString()+","+numResults.toString()+")"+" where query="+'"'+searchTerm+'"';
		var query:String = "select * from microsoft.bing.image("+startIndex.toString()+","+numResults.toString()+")"+" where query="+'"'+searchTerm+'"';
		//old pre April 2011 var REQUEST_URL:String = baseURL + "?q=" + query + "&format=" + YQL_FORMAT
		var REQUEST_URL:String = baseURL + "?format=" + YQL_FORMAT+"&json&callback=&q="+query+"&env=store://datatables.org/alltableswithkeys";
		var wholeURL:String = REQUEST_URL;//baseURL + query + otherBits
		var service:HTTPService = new HTTPService();
		service.useProxy = false;
		service.method = "GET";
		service.resultFormat = "text";
		service.url= wholeURL;
		service.addEventListener(ResultEvent.RESULT, result);
		service.addEventListener(FaultEvent.FAULT, function(evt:FaultEvent):void
		{
			Alert.show("Service is currently unavailable.");
		});
		//service.headers = {'Referer':wholeURL};
		
		service.send();	
	}
	
}

//USAGE
/*
yahooImageSearch(searchTerm, startIndex, defaultSearchResultNumber, function(evt:ResultEvent):void
{
	var json:Object = JSON.decode(evt.result as String);
	try{
		var count:int = int(json["query"]["count"])	
		for (var i:int = 0; i < count; i++)
		{
			//bingified
			var yahooImageResult:Object = json["query"]["results"]["ImageResult"][i] as Object;
			var image:WSImage = new WSImage();
			//image.ID = yahooImageResult["url"];
			image.title = yahooImageResult["Title"];//title of image
			image.url = yahooImageResult["MediaUrl"];
			image.refererurl = yahooImageResult["DisplayUrl"];
			image.width = yahooImageResult["Width"];
			image.height = yahooImageResult["Height"];
			image.thumbnail_width = yahooImageResult["Thumbnail"]["Width"];
			image.thumbnail_height = yahooImageResult["Thumbnail"]["Height"];
			image.thumbnail_url = yahooImageResult["Thumbnail"]["Url"];
			image.content = "";
			image.size = yahooImageResult["FileSize"];
			image.filename = "";
			image.mimetype = yahooImageResult["ContentType"];
			image.image_tags = searchTerm;	
			images.addItem(image);
			
			
			
		}
		currentProvider["images"] = images.source;
		updatePageing();
	}
	catch(err:Error)
	{
		trace(err.toString());
	}
	*/