package views.keyword.combination
{
	import jp.wordsmart.dto.WSKeyword;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.Group;
	
	public class CombinationAdder extends Group
	{
		public function CombinationAdder()
		{
			super();
		}
		public var selected_keyword:WSKeyword;
		
		public var available_images:ArrayCollection;
		public var available_audio:ArrayCollection;
	}
}