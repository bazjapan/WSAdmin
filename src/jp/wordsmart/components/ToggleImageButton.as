package jp.wordsmart.components
{
	import mx.controls.Image;
	
	public class ToggleImageButton extends Image
	{
		public function ToggleImageButton()
		{
			super();
			this.buttonMode = true;
		}
		
		public var iconA:Class;
		public var iconB:Class;
		public var toolTipA:String
		public var toolTipB:String
		
		
		private var _baseState:Boolean = true;
		
		

		public function get baseState():Boolean
		{
			return _baseState;
		}

		public function set baseState(value:Boolean):void
		{
			_baseState = value;
			if(value)
			{
				this.source = iconA;
				this.toolTip = toolTipA;
			}
			else
			{
				this.source = iconB;
				this.toolTip = toolTipB;
			}
		}

	}
}