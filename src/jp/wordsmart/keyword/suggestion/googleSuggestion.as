package jp.wordsmart.keyword.suggestion
{
	import com.adobe.serialization.json.JSON;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import utils.http.BrowserTypes;
	import utils.http.getUserAgentString;
	import utils.string.stripHTMLTags;

	public function googleSuggestion(searchTerm:String, lang:String, stripHTML:Boolean, result:Function):void
		{

			var baseURL:String = "http://clients1.google.co.jp/complete/search?"
			//http://clients1.google.co.jp/complete/search?client=chrome&hl=en-US&q=sugges
			
			var query:String = "client=hp&hl=en&q="+searchTerm+"&cp="+searchTerm.length;
			var REQUEST_URL:String = baseURL+query;
			var wholeURL:String = REQUEST_URL;
			var service:HTTPService = new HTTPService();
			service.useProxy = false;
			service.method = "GET";
			service.resultFormat = "text";
			service.url= wholeURL;
			service.addEventListener(ResultEvent.RESULT,function(evt:ResultEvent):void
			{
				try
				{
					var res:String = evt.result as String;
					var startInd:int = res.indexOf('(')+1;
					var endInd:uint = res.lastIndexOf(')');
					var sub:String = res.substr(startInd, endInd-startInd);
					var json:Object = JSON.decode(sub);
					var suggestions:Array = [];
					for each (var obj:Object in json)
					{
						if(obj is Array)
						{
							for each (var theresult:Array in obj)
							{
								var value:String = theresult[0] as String;
								if(stripHTML)
								{
									value = stripHTMLTags(value);
								}
								suggestions.push(unescapeMe(value));
							}
						}
						
					}
					result(suggestions);
				}
				catch(err:Error)
				{
					result([]);
				}
			});
			
			service.addEventListener(FaultEvent.FAULT, function(evt:FaultEvent):void
			{
				Alert.show("Service is currently unavailable.");
			});
			
			service.headers = {'Referer':'http://www.google.co.jp/', 'Accept':'*/*', "User-Agent":getUserAgentString(BrowserTypes.CHROME)};
			
			service.send();	
			
			
			//hack
			function unescapeMe(data:String):String
			{
				var fixed:String = data.replace('&#39;', "'");
				return fixed;
			}
		}
		

}