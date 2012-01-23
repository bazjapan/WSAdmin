package jp.wordsmart.components.quizmatic
{
	[Bindable]
	public class QMQuestion
	{
		public function QMQuestion()
		{
			answers = [];
		}
		public var order:int;
		public var combo_ID:Number;
		public var text:String;
		public var aurl:String;
		public var iurl:String;
		public var type:String;
		public var answers:Array;
		
		public var html:String;
	}
}