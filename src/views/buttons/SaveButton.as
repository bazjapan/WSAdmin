package views.buttons
{
	import jp.wordsmart.assets.IconLib;
	
	
	public class SaveButton extends WSIconButton
	{
		public function SaveButton()
		{
			super();
			label = "Save";
			toolTip = label;
			setStyle("iconUp",IconLib.SAVE_16);
			setStyle("iconOver",IconLib.SAVE_16);
			width=120; 
		}
	}
}