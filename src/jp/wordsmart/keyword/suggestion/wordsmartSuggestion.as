package jp.wordsmart.keyword.suggestion
{
	import com.adobe.serialization.json.JSON;
	import com.pbsmediatech.json.utils.JSONResultHelper2;
	import com.pbsmediatech.json.utils.extractResult;
	
	import jp.wordsmart.DomainSettings;
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.json.controllers.WSKeywordController;
	
	import mx.rpc.events.ResultEvent;

	public function wordsmartSuggestion(text:String, lang:String, useLocal:Boolean, result:Function):void
	{
		var kwc:WSKeywordController = new WSKeywordController(DomainSettings.API_URL);
		var helper:JSONResultHelper2 = new JSONResultHelper2;
		kwc.get_similar_keyword_text({search_term:text},function(evt:ResultEvent):void
		{
			var results:Array = helper.resultToArray(extractResult(evt));
			
			var keywords:Array = [];
			for each(var obj:Object in results)
			{
				var kw:String = obj["keyword_text"];
				keywords.push(kw);
			}
			result(keywords);
			
		});
		
		
	}
	
}