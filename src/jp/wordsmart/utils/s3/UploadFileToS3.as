package jp.wordsmart.utils.s3
{
	import flash.events.DataEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.net.FileReference;
	
	import jp.wordsmart.WordSmartConstants;
	
	import s3.flash.SaveTheFuckinThingToAmazon;

	public class UploadFileToS3
	{
		public function UploadFileToS3()
		{
		}
		
		public function upload(fileName:String, file:File, bucketName:String, progFunc:Function, completeFunc:Function, errorFunc:Function):void
		{
			var fileRef:FileReference= new FileReference();
			fileRef = file as FileReference;
			var saveMeForChristsSake:SaveTheFuckinThingToAmazon = new SaveTheFuckinThingToAmazon();
			saveMeForChristsSake.doItNow(fileName, bucketName, null,fileRef, 
				function(event:ProgressEvent):void
				{
					progFunc(event);
				}
				
				,function(event:DataEvent):void
				{
					completeFunc(event);
				},function(event:IOErrorEvent):void
				{
					errorFunc(event);
				},null);
		}
	}
}