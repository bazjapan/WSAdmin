package views.buttons
{
	import jp.wordsmart.assets.IconLib;

	public class TagButton extends WSIconButton
	{
		public function TagButton()
		{
			super();
			label = "Tag";
			toolTip = label;
			setStyle("iconUp",IconLib.TAG_16);
			setStyle("iconOver",IconLib.TAG_16);
			width=120; 
		}
	}
}