package views.audio
{
	import jp.wordsmart.WordSmartConstants;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.DropDownList;
	
	public class AudioTypeDropDown extends DropDownList
	{
		public function AudioTypeDropDown()
		{
			super();
			this.dataProvider = new ArrayCollection(audio_types);
			this.toolTip = "Audio Type";
		}
		private var audio_types:Array = WordSmartConstants.audioTypes;
		
		public function set audioType(type:String):void
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
		
		public function getAudioType():String
		{
			return this.selectedItem as String;
		}
	}
}