package jp.wordsmart.utils
{
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;

	public class makeDraggable extends EventDispatcher
	{
		private var mouseAwareComponent:UIComponent;
		private var theMovableComponent:UIComponent;
		
		/**
		 * 
		 * @param clickableComponent component that is mouseDown to start drag
		 * @param toMove component to make draggable
		 * 
		 */		
		public function makeDraggable(mouseAwareComponent:UIComponent, toMove:UIComponent)
		{
			mouseAwareComponent = mouseAwareComponent;
			theMovableComponent = toMove;
			mouseAwareComponent.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			mouseAwareComponent.parent.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		}

		private function onMouseDown(event:MouseEvent):void
		{
			event.stopImmediatePropagation();
			theMovableComponent.startDrag();
		}
		private function onMouseUp(event:MouseEvent):void
		{
			event.stopImmediatePropagation();
			theMovableComponent.stopDrag();
		}

	
	}
}