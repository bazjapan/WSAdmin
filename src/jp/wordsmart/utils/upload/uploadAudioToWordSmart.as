package jp.wordsmart.utils.upload
{
	import flash.utils.ByteArray;
	
	import jp.wordsmart.audio.getNewAudioFileName;
	import jp.wordsmart.model.AppModel;
	import jp.wordsmart.upload.ObjectUploader;
	
	import utils.date.now;

	public function uploadAudioToWordSmart(mp3ByteArray:ByteArray, completeFunc:Function, progFunc:Function, errorFunc:Function):void
	{
		//complete returns url of upload
		//errorFunc returns void
		//progressFunc return perc:number 
		
		var audioUploader:ObjectUploader = new ObjectUploader();
		audioUploader.completeFunc = function(returnedURL:String):void
		{
			completeFunc(returnedURL);
		}
		audioUploader.progressFunc = function(perc:Number):void
		{
			progFunc(perc)
		}
		audioUploader.errorFunc = function():void
		{
			errorFunc();
		}
		audioUploader.uploadAudio(mp3ByteArray, getNewAudioFileName(AppModel.getInstance().signedInContributor.ID), "audio/mpeg");
	}
		
	
}