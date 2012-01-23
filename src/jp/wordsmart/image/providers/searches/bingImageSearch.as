package jp.wordsmart.image.providers.searches
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public function bingImageSearch(searchTerm:String, startIndex:uint, numResults:uint, result:Function):void
		{
			var appID:String = "FE2D7354F4840F91C0EF07790BC3AD46CA934D89";
			var baseURL:String = "http://api.search.live.net/json.aspx";
			var YQL_FORMAT:String = 'json';
			var query:String = "select * from microsoft.bing.image("+startIndex.toString()+","+numResults.toString()+")"+" where query="+'"'+searchTerm+'"';
			var REQUEST_URL:String = baseURL + "?AppId=" +appID+"&Sources=image&Query="+query+"&Image.Count="+numResults+"&Image.Offset="+startIndex;
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