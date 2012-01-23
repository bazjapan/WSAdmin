package s3.flash
{
	import com.adobe.net.MimeTypeMap;
	
	import flash.events.DataEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.model.AppModel;
	import jp.wordsmart.dto.Contributer;

	public class SaveTheFuckinThingToAmazon
	{
		public function SaveTheFuckinThingToAmazon()
		{
		}
		
		
		import com.hurlant.crypto.hash.HMAC;
		import com.hurlant.crypto.hash.SHA1;
		import com.hurlant.util.Base64;
		
		import flash.errors.IOError;
		import flash.events.Event;
		import flash.net.FileReference;
		import flash.utils.ByteArray;
		
		import s3.flash.S3PostOptions;
		import s3.flash.S3PostRequest;
		
		private var fileReference:FileReference;
		private var request:S3PostRequest;
		
		// important keys
		private var amazon_secret_key:String = WordSmartConstants.amazon_secret_key;// Amazon secret key
		private var amazon_access_key:String = WordSmartConstants.amazon_access_key; // Amazon access key
		private var bucket:String = "uranrus"; // folder name where images/files are to be uploaded. In our case "tempbucket".
		private var object_key:String = ""; // keep it blank for now, it will be generated.
		private var acl:String = "public-read"; // valid options are "public-read", "public-read-write", "authenticated-read", "private"
		private var is_secured:Boolean = false; // false implies http / true implies https.
		private var content_type:String; // type of file to be uploaded
		private var policy:String = ""; // keep it blank, it will be generated.
		private var signature:String = ""; // keep it blank, it will be generated
		private var policy_expiration_day:String = "31"; // policy expiration day
		private var policy_expiration_month:String = "12"; // policy expiration month
		private var policy_expiration_year:String = "2020"; // policy expiration year
		
		private var s3Meta:Object;
		
		
		private var progressHandler:Function;
		private var ioErrorHandler:Function;
		private var securityErrorHandler:Function;
		private var uploadCompleteHandler:Function;//returns dataEvent
		
		public var uploadedURL:String = "";
		
		private var mimeMap:MimeTypeMap = new MimeTypeMap();
		
		public function doItNow(nameToSaveAs:String, bucketName:String, s3Meta:Object, fr:FileReference,progressHandler:Function = null,completeHandler:Function = null, ioErrorHandler:Function = null, securityErrorHandler:Function = null):void
		{
			if(s3Meta == null){s3Meta = new Object()};
			this.s3Meta = s3Meta; 
			
			bucket = bucketName;
			this.fileReference = fr;
			//setupHandlers
			if(progressHandler != null)
			{
				this.progressHandler = progressHandler;
			}
			if(completeHandler != null)
			{
				this.uploadCompleteHandler = completeHandler;
				fileReference.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, this.uploadCompleteHandler);
			}
			if(ioErrorHandler != null)
			{
				this.ioErrorHandler = ioErrorHandler;
			}
			if(securityErrorHandler != null)
			{
				this.securityErrorHandler = securityErrorHandler;
			}
			
			
			
			var mimeType:String = mimeMap.getMimeType(this.fileReference.extension);
			trace("extension: "+this.fileReference.extension)
			if (mimeType == null) {mimeType = "application/octet-stream"};
			
			content_type = mimeType;
			object_key = nameToSaveAs;
			generatePolicy();
			signPolicy();
			
			
			// build a S3PostOptions object using the various input fields on the page
			var options:S3PostOptions = new S3PostOptions();
			options.secure = is_secured;
			options.acl = acl;
			options.contentType = content_type;
			options.policy = policy;
			options.signature = signature;
			
			
			
			
			// do the post
			post(amazon_access_key, bucket, object_key, options, fileReference);
			
		}
		
		
		
		private function post(accessKeyId:String, bucket:String, key:String, options:S3PostOptions, fileReference:FileReference):void {
			
			// create the post request
			this.request = new S3PostRequest(accessKeyId, bucket, key, options);
			
			//assign handlers
			
			request.addEventListener(Event.OPEN, function(event:Event):void {
				trace("Upload started: " + fileReference.name);
			});
			if(progressHandler != null)
			{
				request.addEventListener(ProgressEvent.PROGRESS,progressHandler)
			}
			else
			{
			request.addEventListener(ProgressEvent.PROGRESS, function(event:ProgressEvent):void {
				trace(Math.floor(event.bytesLoaded/event.bytesTotal * 100));
			});
			}
			if(ioErrorHandler != null)
			{
				request.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler)
			}
			else
			{
			request.addEventListener(IOErrorEvent.IO_ERROR, function(event:IOErrorEvent):void {
				trace("An IO error occurred: " + event);
			});
			}
			if(securityErrorHandler != null)
			{
				request.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler)
			}
			else
			{
			request.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(event:SecurityErrorEvent):void {
				//setStatus("Upload error!");
				trace("A security error occurred: " + event);
			});
			}
		
			
			
			try {
				request.upload(fileReference);
			} catch(e:Error) {
				trace("An error occurred: " + e);
				
			}
		}
		
		
	
		
		private function generatePolicy():void {
			var buffer:Array = new Array();
			buffer.indents = 0;
			
			write(buffer, "{\n");
			indent(buffer);
			
			// expiration
			var mm:String = policy_expiration_month;
			var dd:String = policy_expiration_day;
			var yyyy:String = policy_expiration_year;
			
			write(buffer, "'expiration': '");
			write(buffer, yyyy);
			write(buffer, "-");
			write(buffer, mm);
			write(buffer, "-");
			write(buffer, dd);
			write(buffer, "T12:00:00.000Z'");
			write(buffer, ",\n");
			
			// conditions
			write(buffer, "'conditions': [\n");
			indent(buffer);
			
			// bucket
			writeSimpleCondition(buffer, "bucket", bucket, true);
			
			// key
			writeSimpleCondition(buffer, "key", object_key, true);
			
			// acl
			writeSimpleCondition(buffer, "acl", acl, true);
			
			// Content-Type
			writeSimpleCondition(buffer, "Content-Type", content_type, true);
			

			
			
			// Filename
			/**
			 * FileReference.Upload sends along the "Filename" form field.
			 * The "Filename" form field contains the name of the local file being
			 * uploaded.
			 *
			 * See http://livedocs.adobe.com/flex/2/langref/flash/net/FileReference.html for more imformation
			 * about the FileReference API.
			 *
			 * Since there is no provided way to exclude this form field, and since
			 * Amazon S3 POST interface requires that all form fields are handled by
			 * the policy document, we must always add this 'starts-with' condition that
			 * allows ANY 'Filename' to be specified.  Removing this condition from your
			 * policy will result in Adobe Flash clients not being able to POST to Amazon S3.
			 */
			writeCondition(buffer, "starts-with", "$Filename", "", true);
			
			// success_action_status
			/**
			 * Certain combinations of Flash player version and platform don't handle
			 * HTTP responses with the header 'Content-Length: 0'.  These clients do not
			 * dispatch completion or error events when such a response is received.
			 * Therefore it is impossible to tell when the upload has completed or failed.
			 *
			 * Flash clients should always set the success_action_status parameter to 201
			 * so that Amazon S3 returns a response with Content-Length being non-zero.
			 * The policy sent along with the POST MUST therefore contain a condition
			 * enabling use of the success_action_status parameter with a value of 201.
			 *
			 * There are many possible conditions satisfying the above requirements.
			 * This policy generator adds one for you below.
			 */
			writeCondition(buffer, "eq", "$success_action_status", "201", false);
			
			write(buffer, "\n");
			outdent(buffer);
			write(buffer, "]");
			
			write(buffer, "\n");
			outdent(buffer);
			write(buffer, "}");
			
			policy = buffer.join("");
		}
		
		private function write(buffer:Array, value:String):void {
			if(buffer.length > 0) {
				var lastPush:String =  String(buffer[buffer.length-1]);
				if(lastPush.length && lastPush.charAt(lastPush.length - 1) == "\n") {
					writeIndents(buffer);
				}
			}
			buffer.push(value);
		}
		
		private function indent(buffer:Array):void {
			buffer.indents++;
		}
		
		private function outdent(buffer:Array):void {
			buffer.indents = Math.max(0, buffer.indents-1);
		}
		
		private function writeIndents(buffer:Array):void {
			for(var i:int=0;i<buffer.indents;i++) {
				buffer.push("    ");
			}
		}
		
		private function writeCondition(buffer:Array, type:String, name:String, value:String, commaNewLine:Boolean):void {
			write(buffer, "['");
			write(buffer, type);
			write(buffer, "', '");
			write(buffer, name);
			write(buffer, "', '");
			write(buffer, value);
			write(buffer, "'");
			write(buffer, "]");
			if(commaNewLine) {
				write(buffer, ",\n");
			}
			
		}
		
		private function writeSimpleCondition(buffer:Array, name:String, value:String, commaNewLine:Boolean):void {
			write(buffer, "{'");
			write(buffer, name);
			write(buffer, "': ");
			write(buffer, "'");
			write(buffer, value);
			write(buffer, "'");
			write(buffer, "}");
			if(commaNewLine) {
				write(buffer, ",\n");
			}
		}
		
		private function signPolicy():void {
			var base64policy:String = Base64.encode(policy);
			policy = base64policy;
			signature = generateSignature(base64policy, amazon_secret_key);
		}
		
		private function generateSignature(data:String, secretKey:String):String {
			
			var secretKeyByteArray:ByteArray = new ByteArray();
			secretKeyByteArray.writeUTFBytes(secretKey);
			secretKeyByteArray.position = 0;
			
			var dataByteArray:ByteArray = new ByteArray();
			dataByteArray.writeUTFBytes(data);
			dataByteArray.position = 0;
			
			var hmac:HMAC = new HMAC(new SHA1());
			var signatureByteArray:ByteArray = hmac.compute(secretKeyByteArray, dataByteArray);
			return Base64.encodeByteArray(signatureByteArray);
		}
		
		
		
		
	}
}