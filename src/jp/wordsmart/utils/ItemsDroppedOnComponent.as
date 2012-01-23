package jp.wordsmart.utils
{
	import flash.desktop.ClipboardFormats;
	import flash.desktop.NativeDragActions;
	import flash.desktop.NativeDragManager;
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.NativeDragEvent;
	import flash.filesystem.File;
	
	import mx.core.UIComponent;
	
	import utils.array.containsObjectWithSameParameterValue;

	/**
	 *More Generic version of ItemsDroppedOnList.as 
	 * @author Beej
	 * 
	 */	
	public class ItemsDroppedOnComponent extends EventDispatcher
	{
		public function ItemsDroppedOnComponent(allowAbleTypes:Array, source:Array, fieldToCheckDuplicateAgainst:String, allowDups:Boolean = false, duplicateAddedFunc:Function = null)
		{
			this.allowableTypes = allowAbleTypes;
			this.source = source;
			allowDuplicates = allowDups
			dupAddedFunc = duplicateAddedFunc;
			checkField = fieldToCheckDuplicateAgainst;
		}
		private var allowableTypes:Array;
		public var enabled:Boolean = true;
		public var source:Array;
		private var allowDuplicates:Boolean;
		private var dupAddedFunc:Function;
		private var checkField:String;
		public var files_just_added:Array = [];//just added
		
		public function attachComponent(component:UIComponent):void
		{
			component.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, onNativeDragEnter);
			component.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onNativeDragDrop);
		}
		
		private function onNativeDragEnter(event:NativeDragEvent):void
		{
			if(!enabled)return;
			
			trace("onNativeDragEnter");
			NativeDragManager.dropAction = NativeDragActions.COPY;
			if(event.clipboard.hasFormat(ClipboardFormats.FILE_LIST_FORMAT)){
				NativeDragManager.acceptDragDrop(InteractiveObject(event.currentTarget)); //'this' is the receiving component
			}
		}
		
		
		
		private function onNativeDragDrop(event:NativeDragEvent):void
		{
			trace("onNativeDragDrop")
			files_just_added = [];
			var files:Array = event.clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
			for each (var f:File in files) 
			{
				var thisTypeAllowed:Boolean;
				for each (var str:String in allowableTypes)
				{
					if(String(f.extension).toUpperCase() == str)
					{
						thisTypeAllowed = true;
						trace("file type qualifies for upload");
						break;
					}
				}
				if(thisTypeAllowed)
				{
					if(allowDuplicates)
					{
						files_just_added.push(f);
					}
					else
					{
					if(!containsObjectWithSameParameterValue(f.url,checkField,source))	
					{
						files_just_added.push(f);
					}
					else
					{
						if(dupAddedFunc!= null){dupAddedFunc()}
					}
					}
				}
			}
			
			if(files_just_added.length>0)
			{
				dispatchEvent(new Event("ITEMS_READY_FOR_UPLOAD_EVENT"));
			}
		}
		
		
	}
}