
import flash.events.EventDispatcher;

import jp.wordsmart.events.SaveFileEvent;
		
		
		
		public function dragEnterHandler(e:NativeDragEvent):void {
			trace("dragEnterHandler")
			NativeDragManager.dropAction = NativeDragActions.COPY;
			if(e.clipboard.hasFormat(ClipboardFormats.FILE_LIST_FORMAT)){
				NativeDragManager.acceptDragDrop(InteractiveObject(e.currentTarget)); //'this' is the receiving component
			}
			
		}
		public function nativeDragDrop(e:NativeDragEvent):void {
			trace("drop handler called")
			var files:Array = e.clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
			
			for each (var f:Object in files) {
				if (String(f.extension).toUpperCase() == "JPG" || String(f.extension).toUpperCase() == "PNG") {
					//image.source = "file:///" + f.nativePath
					//imageFile = f as File;
					trace(File(f).nativePath);
					trace(File(f).url);
					trace(File(f).creationDate);
					trace(File(f).creator);
					trace(File(f).name);
					trace(File(f).size);
					trace(File(f).type);
					//trace("What is the file size? "+image.width+" - "+image.height);
					trace("If file size is good offer to save.");
					trace("after save offer to add keyword");
					var evt:SaveFileEvent = new SaveFileEvent(File(f));
					new EventDispatcher().dispatchEvent(evt);
				
					break;
				}
			}
			
		}
		
		
		
		
