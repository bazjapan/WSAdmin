package jp.wordsmart.utils.language
{
	public class Dialect extends Object
	{
		public function Dialect(obj:Object = null)
		{
			super();
			if(obj != null)
			{
			country_label = obj["country_label"];
			country_code = obj["country_code"];
			language_code = obj["language_code"];
			dialect_label = obj["dialect_label"];
			language_label = obj["language_label"];
			dialect_code = obj["dialect_code"];
			dialect_icon = obj["dialect_icon"];
			}
			
		}
		
		public var country_label:String;
		public var country_code:String;
		public var language_code:String;
		public var dialect_label:String;
		public var language_label:String;
		public var dialect_code:String;
		public var dialect_icon:Class;
	}
}