package jp.wordsmart.utils.audio
{
	import flash.filesystem.File;
	import flash.net.URLRequestHeader;
	
	import jp.wordsmart.utils.FileDownloader;
	
	import utils.http.BrowserTypes;

	public class SaveFileToDiskFromRemoteURL
	{
		public function SaveFileToDiskFromRemoteURL()
		{
		}
		/**
		 * Parse a feed
		 * @param remoteURL the url to download the file from.
		 * @param pathWhereToSave the path on the local machine of where to save the file - should end with a backslash.
		 * @param completeFunc returns a File object
		 * */
		public function saveToDisk(remoteURL:String, nameForFile:String, pathWhereToSaveFile:String, completeFunc:Function):void
		{
			try
			{
				var file:File  = File.desktopDirectory.resolvePath(pathWhereToSaveFile+nameForFile); 
				var headers:Array = [new URLRequestHeader('Referer', encodeURI(remoteURL)), new URLRequestHeader('User-Agent', BrowserTypes.CHROME)];
				var downloader:FileDownloader = new FileDownloader(remoteURL, file, headers);
				downloader.load();
				downloader.onComplete = function():void{completeFunc(file)};
			}
			catch(err:Error)
			{
				trace(err.toString())
			}
		}
	}
}