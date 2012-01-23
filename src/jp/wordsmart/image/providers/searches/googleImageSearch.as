package jp.wordsmart.image.providers.searches
{
	import be.boulevart.google.ajaxapi.search.images.GoogleImageSearch;
	import be.boulevart.google.events.GoogleAPIErrorEvent;
	import be.boulevart.google.events.GoogleApiEvent;

	public function googleImageSearch(searchTerm:String, startVal:int,  result:Function, error:Function):void
	{
		var imageSearch:GoogleImageSearch = new GoogleImageSearch();
		imageSearch.search(searchTerm, startVal);
		imageSearch.addEventListener(GoogleApiEvent.IMAGE_SEARCH_RESULT, result);
		imageSearch.addEventListener(GoogleAPIErrorEvent.API_ERROR,error);
		
		
	}
	
}