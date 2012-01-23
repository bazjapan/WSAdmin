package jp.wordsmart.utils.keyword
{
	import mx.collections.ArrayCollection;
	
	public function tagStringToCollection(tagString:String):ArrayCollection
	{
		var arraycol:ArrayCollection = new ArrayCollection;
		if(tagString != null && tagString != '')
		{
			var array:Array = tagString.split("|");
			arraycol.source = array;
		}
		return arraycol;
	}
	
}