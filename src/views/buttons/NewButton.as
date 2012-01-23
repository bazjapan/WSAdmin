package views.buttons
{
	import jp.wordsmart.assets.IconLib;

	public class NewButton extends WSIconButton
	{
		public function NewButton()
		{
			super();
			label = "New";
			toolTip = label;
			setStyle("iconUp",IconLib.NEW_16);
			setStyle("iconOver",IconLib.NEW_16);
			width=120; 
		}
	}
}