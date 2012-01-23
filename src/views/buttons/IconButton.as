package views.buttons
{

	import spark.components.Button;
	
	//icons
	[Style(name="iconDisabled",type="*")]
	[Style(name="iconDown",type="*")]
	[Style(name="iconOver",type="*")]
	[Style(name="iconUp",type="*")]
	//padding
	[Style(name="paddingBottom",type="Number")]
	[Style(name="paddingLeft",type="Number")]
	[Style(name="paddingRight",type="Number")]
	[Style(name="paddingTop",type="Number")]
	//colors
	[Style(name="gColorTop",type="Number", format="Color")]
	[Style(name="gColorBottom",type="Number", format="Color")]
	
	public class IconButton extends WordSmartButton
	{
		public function IconButton()
		{
			super();
		}
	}
	
}