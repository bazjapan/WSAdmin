package jp.wordsmart.image.providers.searches
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	/*As of April 2011, Yahoo dropped image search so have changed to using bing.*/
	
	public function flickRImageSearch(searchTerm:String, startIndex:uint, numResults:uint, result:Function):void
	{
		var appID:String = ".RnHZfbV34FwfEcY177XluQgglhCs0Zcmh4cX5Xjm27Gww3aQBf2bL7AXcO4G9k-";
		var baseURL:String = "http://query.yahooapis.com/v1/public/yql"
		var YQL_FORMAT:String = 'json';
		var query:String = "select id,title,farm,server,secret from flickr.photos.search("+startIndex.toString()+","+numResults.toString()+")"+" where text="+'"'+searchTerm+'"';
		
		var REQUEST_URL:String = baseURL + "?format=" + YQL_FORMAT+"&json&callback=&q="+query+"&env=store://datatables.org/alltableswithkeys";
		
		var otherBits:String = "&format=json&diagnostics=true&callback=cbfunc"
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

