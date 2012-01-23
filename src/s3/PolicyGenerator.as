package s3
{
	public class PolicyGenerator
	{
		public static function generate(expDay:String, expMonth:String, expYear:String, bucket:String, object_key:String, acl:String, content_type:String):String
		{
			var policy:String;
			var buffer:Array = new Array();
				buffer.indents = 0;
				
				write(buffer, "{\n");
				indent(buffer);
				
				// expiration
				var mm:String = expMonth;
				var dd:String = expDay;
				var yyyy:String = expYear;
				
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
			
			
			return policy;
		}
		private static function write(buffer:Array, value:String):void {
			if(buffer.length > 0) {
				var lastPush:String =  String(buffer[buffer.length-1]);
				if(lastPush.length && lastPush.charAt(lastPush.length - 1) == "\n") {
					writeIndents(buffer);
				}
			}
			buffer.push(value);
		}
		
		private static function indent(buffer:Array):void {
			buffer.indents++;
		}
		
		private static function outdent(buffer:Array):void {
			buffer.indents = Math.max(0, buffer.indents-1);
		}
		
		private static function writeIndents(buffer:Array):void {
			for(var i:int=0;i<buffer.indents;i++) {
				buffer.push("    ");
			}
		}
		
		private static function writeCondition(buffer:Array, type:String, name:String, value:String, commaNewLine:Boolean):void {
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
		
		private static function writeSimpleCondition(buffer:Array, name:String, value:String, commaNewLine:Boolean):void {
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
	}
}