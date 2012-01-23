package jp.wordsmart.upload
{
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	
	import jp.wordsmart.WordSmartConstants;
	
	import s3.PolicyGenerator;
	import s3.PolicySigner;
	import s3.S3PostOptions;
	import s3.S3PostRequest;

	public class ObjectUploader
	{
		public function ObjectUploader()
		{
		}
		
		public var completeFunc:Function;//returns uploaded URL
		public var progressFunc:Function;//returns percent:Number
		public var errorFunc:Function;//return Event
		public var uploadedObjectURL:String;
		
		private var acl:String = "public-read"; // valid options are "public-read", "public-read-write", "authenticated-read", "private"
		private var is_secured:Boolean = false; // false implies http / true implies https.
		private var policy_expiration_day:String = "31"; // policy expiration day
		private var policy_expiration_month:String = "12"; // policy expiration month
		private var policy_expiration_year:String = "2020"; // policy expiration year
		private var amazon_secret_key:String = WordSmartConstants.amazon_secret_key;// Amazon secret key
		private var amazon_access_key:String = WordSmartConstants.amazon_access_key; // Amazon access key
		
		
		public function uploadImage(obj:Object, objName:String, contentType:String):void
		{
		
			var bucket:String = WordSmartConstants.IMAGE_BUCKET;
			var object_key:String = objName;
			var location:String = "http://"+WordSmartConstants.AMAZON_BASE+"/"+bucket+"/"+object_key;
			uploadedObjectURL = location;
			//set content type
			var content_type:String  = contentType;
			
			var policy:String = PolicyGenerator.generate(policy_expiration_day,policy_expiration_month, policy_expiration_year,bucket,object_key,acl,content_type);
			var signed:Array = PolicySigner.signPolicy(policy, amazon_secret_key);
			
			policy = signed[0];
			var signature:String = signed[1];
			
			
			//set up s3 optons
			var options:S3PostOptions = doOptions(policy,signature,content_type);
			
			// create the post request
			var request:S3PostRequest = new S3PostRequest(amazon_access_key, bucket, object_key, options);
			
			// add event listeners
			request.addEventListener(Event.OPEN, function(event:Event):void {
				trace("Uploading...");
			});
			request.addEventListener(ProgressEvent.PROGRESS, function(event:ProgressEvent):void {
				trace("Progress: " + Math.floor(event.bytesLoaded/event.bytesTotal * 100).toString() + "%");
				var perc:Number = Math.floor(event.bytesLoaded/event.bytesTotal * 100);
				progressFunc(perc);
				//audioAdder.progressBarHelper.enableProgress("Uploading Audio", perc);
			});
			request.addEventListener(IOErrorEvent.IO_ERROR, function(event:IOErrorEvent):void {
				trace("An IO error occurred: " + event);
				errorFunc(event);
			});
			request.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(event:SecurityErrorEvent):void {
				trace("A security error occurred: " + event);
				errorFunc(event);
			});
			request.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, function(event:DataEvent):void {
				trace("Upload completed: " + event);//this event if fired twice by the request make sure the data bject has a string before running the complete function
				if(event.data != "")
				{
				completeFunc(uploadedObjectURL);
				}
			});
			
			// submit the post request
			if(obj is ByteArray)
			{
				request.uploadByteArray(obj as ByteArray);
			}
			else if(obj is File)
			{
				
				trace("upload this file")
			}
		
		
		}
		
		public function uploadAudio(obj:Object, objName:String, contentType:String):void
		{
		
			
			var bucket:String = WordSmartConstants.AUDIO_BUCKET;
			var object_key:String = objName;
			var location:String = "http://"+WordSmartConstants.AMAZON_BASE+"/"+bucket+"/"+object_key;
			uploadedObjectURL = location;
			//set content type
			var content_type:String  = "audio/mpeg";
			
			var policy:String = PolicyGenerator.generate(policy_expiration_day,policy_expiration_month, policy_expiration_year,bucket,object_key,acl,content_type);
			var signed:Array = PolicySigner.signPolicy(policy, amazon_secret_key);
			
			policy = signed[0];
			var signature:String = signed[1];
			
			
			//set up s3 optons
			var options:S3PostOptions = doOptions(policy,signature,content_type);
			
			// create the post request
			var request:S3PostRequest = new S3PostRequest(amazon_access_key, bucket, object_key, options);
			
			// add event listeners
			request.addEventListener(Event.OPEN, function(event:Event):void {
				trace("Uploading...");
			});
			request.addEventListener(ProgressEvent.PROGRESS, function(event:ProgressEvent):void {
				trace("Progress: " + Math.floor(event.bytesLoaded/event.bytesTotal * 100).toString() + "%");
				var perc:Number = Math.floor(event.bytesLoaded/event.bytesTotal * 100);
				progressFunc(perc);
				//audioAdder.progressBarHelper.enableProgress("Uploading Audio", perc);
			});
			request.addEventListener(IOErrorEvent.IO_ERROR, function(event:IOErrorEvent):void {
				trace("An IO error occurred: " + event);
				errorFunc(event);
			});
			request.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(event:SecurityErrorEvent):void {
				trace("A security error occurred: " + event);
				errorFunc(event);
			});
			request.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, function(event:DataEvent):void {
				trace("Upload completed: " + event);//this event if fired twice by the request make sure the data bject has a string before running the complete function
				if(event.data != "")
				{
					completeFunc(uploadedObjectURL);
				}
			});
			
			// submit the post request
			if(obj is ByteArray)
			{
			request.uploadByteArray(obj as ByteArray);
			}
			else if(obj is File)
			{
				trace("upload this file")
			}
			
		}
		
		private function doOptions(policy:String, signature:String, content_type:String):S3PostOptions
		{
		
			//set up s3 optons
			var options:S3PostOptions = new S3PostOptions();
			options.secure = is_secured;
			options.acl = acl;
			options.contentType = content_type;
			options.policy = policy;
			options.signature = signature;
			
			return options
		}
		
		
		
		
	}
}