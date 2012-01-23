package views.audio
{
	import jp.wordsmart.WordSmartConstants;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.DropDownList;
	
	public class AudioMoodDropDown extends DropDownList
	{
		public function AudioMoodDropDown()
		{
			super();
			this.dataProvider = new ArrayCollection(WordSmartConstants.audioMoods);
			this.selectedIndex = 0;
			this.toolTip "Audio Mood"
		}
		public function set mood(mood:String):void
		{
			setMood(mood);
		}
		
		public function setMood(mood:String):void
		{
			var counter:int
			var moodIndex:int
			for each (var str:String in this.dataProvider)
			{
				if(str == mood)
				{
					moodIndex = counter;
					break;
				}
				counter++;
			}
			this.selectedIndex = moodIndex;
		}
		public function getMood():String
		{
			return this.selectedItem as String;
		}
	}
}