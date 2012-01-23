package views.buttons
{
	import jp.wordsmart.assets.IconLib;

	public class ShowRequestsButton extends WSIconButton
	{
		public function ShowRequestsButton()
		{
			super();
			label = "Show Requests";
			toolTip = label;
			setStyle("iconUp",IconLib.IMAGE_TEXT_16);
			setStyle("iconOver",IconLib.IMAGE_TEXT_16);
			width = 150;
		}
	}
}