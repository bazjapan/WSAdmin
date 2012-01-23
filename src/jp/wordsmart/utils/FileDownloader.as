package jp.wordsmart.utils
{
	import flash.events.IOErrorEvent;
	import flash.events.OutputProgressEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	
	public class FileDownloader
	{
		
		// Class to download files from the internet
		
		// Function called every time data arrives
		//              called with an argument of how much has been downloaded
		public var onProgress :Function = function(t:uint):void{};
		public var onComplete :Function = function():void{};
		public var remotePath :String = "";
		public var localFile :File = null; 
		
		private var stream :URLStream;
		private var fileAccess :FileStream;
		private var headers:Array = [];
		
		public function FileDownloader( remotePath :String = "" , localFile :File = null, headers:Array = null ) {
			
			//headers = array of URLRequestHeaders;
			this.remotePath = remotePath;
			this.localFile = localFile;
			if(headers)this.headers = headers;
		}
		
		public function load() :void {
			try{
			
			if( !stream || !stream.connected ) {
				stream = new URLStream();
				fileAccess = new FileStream();
				
				var requester :URLRequest = new URLRequest(remotePath );
				trace("downloading from "+remotePath)
				for each (var urh:URLRequestHeader in headers)
				{
					requester.requestHeaders.push(urh);
				}
				
				
				var currentPosition :uint = 0;
				var downloadCompleteFlag :Boolean = false;
				var bytePending:int = -1;
				
				fileAccess.addEventListener(OutputProgressEvent.OUTPUT_PROGRESS, function ( result:OutputProgressEvent ) :void {
					bytePending = result.bytesPending;
					doComplete();
					
				});
				
				var completeCalled:Boolean;
				function doComplete():void
				{
					if(bytePending == 0 && downloadCompleteFlag ) {
						
						if(completeCalled)return;
						try{
							trace("closing stream "+remotePath);
							stream.close();
							fileAccess.close();
						}catch(e:Error){
							trace(e.toString())
						}
						completeCalled = true;
						onComplete();
						return;
					}
				}
				
				fileAccess.openAsync( localFile, FileMode.WRITE );
				stream.addEventListener(ProgressEvent.PROGRESS , function (evt:ProgressEvent) :void {
					
					trace("progress "+evt.bytesLoaded);
					var bytes :ByteArray = new ByteArray();
					var thisStart :uint = currentPosition;
					currentPosition += stream.bytesAvailable;
					// ^^  Makes sure that asyncronicity does not break anything
					stream.readBytes( bytes, thisStart );
					fileAccess.writeBytes( bytes, thisStart );
					onProgress( currentPosition );                                          
				});
				
				stream.addEventListener("complete", function () :void {
					trace("download Complete")
					downloadCompleteFlag = true;
					doComplete();
				});
				stream.addEventListener(IOErrorEvent.IO_ERROR, function(evt:IOErrorEvent):void
				{
					trace("Error: "+evt.toString())
				});
				
				stream.load( requester );
				
			} else {
				// Do something unspeakable;
				trace("FileDownloader::load Do something unspeakable");
			}
			}
			catch(err:Error)
			{
				trace("FileDownloader::load "+err.toString())
			}
		}

		
	}}