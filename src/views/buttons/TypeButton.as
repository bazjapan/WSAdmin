package views.buttons
{
	import jp.wordsmart.assets.IconLib;

	public class TypeButton extends WSIconButton
	{
		public function TypeButton()
		{
			super();
			label = "Type";
			toolTip = label;
			setStyle("iconUp",IconLib.TYPE_16);
			setStyle("iconOver",IconLib.TYPE_16);
			width=120; 
		}
	}
}