package jp.wordsmart.utils.download
{
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	
	import jp.wordsmart.utils.progressEventToPercent;
	
	import mx.controls.Alert;
	
	import utils.http.getStealthURLRequest;

	public function downloadToFileFromURL(url:String,completeFunc:Function, progFunc:Function = null, errorFunc:Function = null):void
		{
			//complete returns byteArray
			//errorFunc returns void
			//progressFunc return perc:number 
		
			var remotePath:String =  url;
			var stream:URLStream = new URLStream();
			var bytes :ByteArray = new ByteArray();
			var requester:URLRequest = getStealthURLRequest(remotePath);
			var currentPosition:uint = 0;
			
			stream.addEventListener(IOErrorEvent.IO_ERROR, function(evt:IOErrorEvent):void
			{
				if(errorFunc != null){errorFunc();}
				else{Alert.show("Unable to Download File");}
			});
			
			stream.addEventListener(ProgressEvent.PROGRESS , function (evt:ProgressEvent) :void {
				if(progFunc != null){progFunc(progressEventToPercent(evt));}
				
				var thisStart :uint = currentPosition;
				currentPosition += stream.bytesAvailable;
				stream.readBytes( bytes, thisStart );
			});
			
			stream.addEventListener( "complete", function () :void {
				completeFunc(bytes);
			});
			
			stream.load( requester );
			
		}
	
}