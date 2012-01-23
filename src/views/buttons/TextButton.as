package views.buttons
{
	import jp.wordsmart.assets.IconLib;

	public class TextButton extends WSIconButton
	{
		public function TextButton()
		{
			super();
			label = "Type";
			toolTip = label;
			setStyle("iconUp",IconLib.TEXT_16);
			setStyle("iconOver",IconLib.TEXT_16);
			width=120; 
		}
	}
}