package views.keyword
{
	import jp.wordsmart.WordSmartConstants;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.DropDownList;
	
	public class KeywordTypeDropDown extends DropDownList
	{
		public function KeywordTypeDropDown()
		{
			super();
			this.dataProvider = new ArrayCollection(keyword_types);
		}
		private var keyword_types:Array = WordSmartConstants.keywordTypes;
		
		public function set keyword_type(type:String):void
		{
			var counter:int
			var typeIndex:int
			for each (var str:String in this.dataProvider)
			{
				if(str == type)
				{
					typeIndex = counter;
					break;
				}
				counter++;
			}
			this.selectedIndex = typeIndex;
			
		}
		
		public function getKeywordType():String
		{
			return this.selectedItem as String;
		}
	}
}