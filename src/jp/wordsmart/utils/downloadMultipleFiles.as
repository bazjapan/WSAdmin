package jp.wordsmart.utils
{
	import flash.net.URLRequest;
	import flash.utils.ByteArray;

	public function downloadMultipleFiles(urls:Array, localPath:String):String
	{
		
		
		
		var remotePath:String
		function load(onComplete:Function) :void {
			try{
				
				if( !stream || !stream.connected ) {
					stream = new URLStream();
					fileAccess = new FileStream();
					var requester :URLRequest = new URLRequest(remotePath );
					/*for each (var urh:URLRequestHeader in headers)
					{
						requester.requestHeaders.push(urh);
					}*/
					
					
					var currentPosition :uint = 0;
					var downloadCompleteFlag :Boolean = false;
					var bytePending:int = -1;
					
					fileAccess.addEventListener(OutputProgressEvent.OUTPUT_PROGRESS, function ( result:OutputProgressEvent ) :void {
						
						bytePending = result.bytesPending;
						doComplete();
						
					});
					
					function doComplete():void
					{
						if(bytePending == 0 && downloadCompleteFlag ) {
							try{
								trace("closing stream "+remotePath);
								stream.close();
								fileAccess.close();
							}catch(e:Error){
								trace("Error closing stream")
							}
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
						//onProgress( currentPosition );                                          
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
					trace("downloadMultipleFiles::load Doing something unspeakable");
				}
			}
			catch(err:Error)
			{
				trace("downloadMultipleFiles::load "+err.toString())
			}
		}
	}
	
}