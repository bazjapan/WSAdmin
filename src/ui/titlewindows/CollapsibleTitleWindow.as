package ui.titlewindows
{
	
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.TitleWindow;

	[SkinState("minimized")]
	/**
	 * This class adds support for minimizing the Spark TitleWindow.
	 */
	
	public class CollapsibleTitleWindow extends TitleWindow
	{
		
		[SkinPart (required="false")] 
	/**
	 *  The skin part that defines the appearance of the 
	 *  button responsible for toggling minimization of the titlewindow.
	 */
	public var minButton:Button;
	//public var moveArea:HGroup;
	
	/**
	 * Flag indicating whether this titlewindow is minimized or not.
	 */ 
	public function get minimized():Boolean
	{
		return _minimized;
	}
	/**
	 * @private
	 */
	public function set minimized(value:Boolean):void
	{
		_minimized = value;
		invalidateSkinState();
	}
	
	/**
	 * @private
	 * Toggle minimized state on minButton click event.
	 */
	protected function minButtonClickHandler(event:MouseEvent):void
	{
		minimized = !minimized;
	}
	
	/**
	 * @private
	 * storage variable for <code>minimized</code>property.
	 * Add minButton click listener.
	 */
	protected var _minimized:Boolean;
	
	override protected function partAdded(partName:String, instance:Object) : void
	{
		super.partAdded(partName, instance);
		
		if (instance == minButton)
		{
			Button(instance).addEventListener(MouseEvent.CLICK, minButtonClickHandler);
		}
		if(instance == moveArea)
		{
			var moveArea:Group = Group(instance);
			moveArea.doubleClickEnabled = true;
			moveArea.addEventListener(MouseEvent.DOUBLE_CLICK,onTitleBarDoubleClick);
		}
	}

		private function onTitleBarDoubleClick(event:MouseEvent):void
		{
			minimized = !minimized;
		}
	
	/**
	 * @private
	 * Remove minButton click listener.
	 */
	override protected function partRemoved(partName:String, instance:Object) : void
	{
		if (instance == minButton)
		{
			Button(instance).removeEventListener(MouseEvent.CLICK, minButtonClickHandler);
		}
		if (instance == moveArea)
		{
			moveArea.removeEventListener(MouseEvent.DOUBLE_CLICK, onTitleBarDoubleClick);
		}
		super.partRemoved(partName, instance);
	}
	
	/**
	 *  @private
	 */
	override protected function getCurrentSkinState():String
	{
		return minimized ? "minimized" : super.getCurrentSkinState();
	}
}
}