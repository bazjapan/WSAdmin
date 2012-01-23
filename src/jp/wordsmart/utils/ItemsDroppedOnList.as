package jp.wordsmart.utils
{
	import flash.desktop.ClipboardFormats;
	import flash.desktop.NativeDragActions;
	import flash.desktop.NativeDragManager;
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.NativeDragEvent;
	import flash.filesystem.File;
	
	import spark.components.List;

	public class ItemsDroppedOnList extends EventDispatcher
	{
		public function ItemsDroppedOnList(allowAbleTypes:Array)
		{
		this.allowableTypes = allowAbleTypes;
		}
		private var allowableTypes:Array;
		public var enabled:Boolean = true;
		public var filesForUpload:Array;
		
		public function attachList(lt:List):void
		{
			lt.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, onNativeDragEnter);
			lt.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onNativeDragDrop);

			
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
			filesForUpload = [];
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
					filesForUpload.push(f);
				}
			}
			
			if(filesForUpload.length>0)
			{
				dispatchEvent(new Event("ITEMS_READY_FOR_UPLOAD_EVENT"));
			}
		}

		
	}
}