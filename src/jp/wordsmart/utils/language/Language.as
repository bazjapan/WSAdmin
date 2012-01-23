package jp.wordsmart.utils.language
{
	public class Language extends Object
	{
		public function Language(obj:Object = null)
		{
			super();
			if(obj != null)
			{
				value = obj["value"];
				label = obj["label"];
				selected = obj["selected"];
				icon = obj["icon"];
			}
		}
		
		public var value:String;
		public var label:String; 
		public var selected:Boolean; 
		public var icon:Class;
	}
}