package views.buttons
{
	import jp.wordsmart.assets.IconLib;

	public class MakeRequestButton extends WSIconButton
	{
		public function MakeRequestButton()
		{
			super();
			label = "Make Request";
			toolTip = label;
			setStyle("iconUp",IconLib.WAND_16);
			setStyle("iconOver",IconLib.WAND_16);
			width=120; 
		}
	}
}