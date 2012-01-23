package jp.wordsmart.image.providers
{
	import utils.array.copyArray;

	public class ImageProvider implements IImageProvider
	{
		public function ImageProvider()
		{
		}
		public static const ERROR_SEARCH_OUT_OF_RANGE:String = "ERROR_SEARCH_OUT_OF_RANGE";
		
		public var defaultNumberOfResults:uint = 8;//defaults to 8
		public var storedSearchResults:Array = [];
		public var cacheSize:uint = 10;
		/**
		 * Abstract Class
		 * @param searchTerm
		 * @param callbackFunc [Array of WSImage (s)], searchTermUsed
		 * @param errorFunc
		 * 
		 */		
		public function searchForImages(searchTerm:String, startIndex:int,  completeFunc:Function, errorFunc:Function, exact:Boolean = false):void
		{
		
		throw new Error("Image Provider is an Abstract class")
		
		}
		/**
		 * 
		 * @param searchTerm
		 * @param startIndex
		 * @param numberOfResults
		 * @return true if search is the same;
		 * 
		 */		
		public function getFromCache(searchTerm:String, startIndex:int, numberOfResults:uint, exact:Boolean):Object
		{
			if(!storedSearchResults.length<0){return null};
			for each (var cachedResult:Object in storedSearchResults)
			{
				if(cachedResult["searchTerm"] == searchTerm &&
					cachedResult["startIndex"] == startIndex &&
					cachedResult["numberOfResults"] == numberOfResults &&
					cachedResult["exact"] == exact && cachedResult.images.length >0
				
				)
				{return cachedResult};
			}
			return null
		}
		
		public function addResultToCache(images:Array, searchTerm:String, startIndex:int, numberOfResults:uint, exact:Boolean):void
		{
			var toAdd:Object = new Object()
			toAdd.images= copyArray(images);
			toAdd.searchTerm=searchTerm
			toAdd.startIndex=startIndex
			toAdd.numberOfResults=numberOfResults
			toAdd.exact=exact;
			
			if(storedSearchResults.length==cacheSize)
			{
				//remove first item form cache
				storedSearchResults.shift();
			}
			storedSearchResults.push(toAdd);
		}
		
		
	}
}