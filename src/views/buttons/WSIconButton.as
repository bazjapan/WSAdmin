package views.buttons
{
	
	public class WSIconButton extends IconButton
	{
		public function WSIconButton()
		{
			super();
			buttonMode = true;
			setStyle("skinClass",IconButtonSkin);
			setStyle("gColorBottom","0x999999");
			setStyle("gColorTop","0xffffff");
			setStyle("paddingBottom",4);
			setStyle("paddingBottom",4);
			setStyle("paddingRight",4);
			setStyle("paddingTop",4);
		}
		
		public function set icon(src:Class):void
		{
			setStyle("iconUp",src);
			setStyle("iconOver",src);
		}
		
		
	}
}