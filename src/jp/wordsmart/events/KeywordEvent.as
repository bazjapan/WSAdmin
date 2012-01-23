package jp.wordsmart.events
{
	import flash.events.Event;
	
	import jp.wordsmart.dto.WSKeyword;
	
	public class KeywordEvent extends Event
	{
		public static const LOAD_FOR_TRANSLATION:String = "LOAD_FOR_TRANSLATION";
		public static const ADD_TO_LIST:String = "ADD_TO_LIST";
		public static const REMOVE_FROM_LIST:String = "REMOVE_FROM_LIST";
		public static const APPLY_VALUES_TO_KEYWORDS:String = "APPLY_VALUES_TO_KEYWORDS"
			
		public static const EVENT_KEYWORD_ADDED:String = "EVENT_KEYWORD_ADDED";
		
		public var keyword:WSKeyword;
		public function KeywordEvent(type:String, kw:WSKeyword)
		{
			this.keyword = kw;
			super(type, true, false);
		}
	}
}