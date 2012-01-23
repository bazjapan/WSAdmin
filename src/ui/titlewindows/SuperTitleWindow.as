package ui.titlewindows
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.IVisualElement;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.SandboxMouseEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.TitleWindow;
	
	

	
	[SkinState("minimized")]
	/**
	 * This class adds support for minimizing the Spark TitleWindow.
	 */
	
	public class SuperTitleWindow extends TitleWindow
	{

		
		[SkinPart (required="false")] 
	/**
	 *  The skin part that defines the appearance of the 
	 *  button responsible for toggling minimization of the titlewindow.
	 */
	public var minButton:Button;
	
	
	
	private var clickOffset:Point;
	
	
	//----------------------------------
	//  Resize Handle
	//---------------------------------- 
	
	[SkinPart(required="false")]
	
	/**
	 *  The skin part that defines the area where
	 *  the user may drag to resize the window.
	 */
	public var resizeHandle:UIComponent;
	
	
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
		if (instance == resizeHandle)
		{
			resizeHandle.addEventListener(MouseEvent.MOUSE_DOWN, resizeHandle_mouseDownHandler);
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
		if (instance == resizeHandle)
		{
			resizeHandle.removeEventListener(MouseEvent.MOUSE_DOWN, resizeHandle_mouseDownHandler);
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
	
	private var prevWidth:Number;
	private var prevHeight:Number;
	
	
	
	
	protected function resizeHandle_mouseDownHandler(event:MouseEvent):void
	{
		if (enabled && isPopUp && !clickOffset)
		{        
			clickOffset = new Point(event.stageX, event.stageY);
			prevWidth = width;
			prevHeight = height;
			
			var sbRoot:DisplayObject = systemManager.getSandboxRoot();
			
			sbRoot.addEventListener(
				MouseEvent.MOUSE_MOVE, resizeHandle_mouseMoveHandler, true);
			sbRoot.addEventListener(
				MouseEvent.MOUSE_UP, resizeHandle_mouseUpHandler, true);
			sbRoot.addEventListener(
				SandboxMouseEvent.MOUSE_UP_SOMEWHERE, resizeHandle_mouseUpHandler)
		}
	}
	
	/**
	 *  @private
	 */
	
	public var shortest:Number = 0;
	public var narrowest:Number = 0;
	protected function resizeHandle_mouseMoveHandler(event:MouseEvent):void
	{
		// during a resize, only the TitleWindow should get mouse move events
		// we don't check the target since this is on the systemManager and the target
		// changes a lot -- but this listener only exists during a resize.
		event.stopImmediatePropagation();
		
		if (!clickOffset)
		{
			return;
		}
		
		width = prevWidth + (event.stageX - clickOffset.x);
		if(width<narrowest)
		{
			width = narrowest+10;
		}
		height = prevHeight + (event.stageY - clickOffset.y);
		if(height<shortest)
		{
			height = shortest+10;
		}
		updateContentHeight()
		event.updateAfterEvent();
	}
	
	//bj bit of a hack to get content height to resize
	private function updateContentHeight():void
	{
	var element:IVisualElement = this.getElementAt(0);
	element.height = this.height-5//
	}
	
	/**
	 *  @private
	 */
	protected function resizeHandle_mouseUpHandler(event:Event):void
	{
		clickOffset = null;
		prevWidth = NaN;
		prevHeight = NaN;
		
		var sbRoot:DisplayObject = systemManager.getSandboxRoot();
		
		sbRoot.removeEventListener(
			MouseEvent.MOUSE_MOVE, resizeHandle_mouseMoveHandler, true);
		sbRoot.removeEventListener(
			MouseEvent.MOUSE_UP, resizeHandle_mouseUpHandler, true);
		sbRoot.removeEventListener(
			SandboxMouseEvent.MOUSE_UP_SOMEWHERE, resizeHandle_mouseUpHandler);
	}
	}


}