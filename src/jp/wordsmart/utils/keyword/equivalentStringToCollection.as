package jp.wordsmart.utils.keyword
{
	import mx.collections.ArrayCollection;

	public function equivalentStringToCollection(equivString:String):ArrayCollection
	{
		var arraycol:ArrayCollection = new ArrayCollection;
		if(equivString != null && equivString != '')
		{
			var array:Array = equivString.split("|");
			arraycol.source = array;
		}
		return arraycol;
	}
	
}