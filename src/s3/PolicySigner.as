package s3
{
	import com.hurlant.crypto.hash.HMAC;
	import com.hurlant.crypto.hash.SHA1;
	import com.hurlant.util.Base64;
	
	import flash.utils.ByteArray;

	public class PolicySigner
	{
		
		
		
		public static function signPolicy(policy:String, secretKey:String):Array {
			var base64policy:String = Base64.encode(policy);
			return [base64policy,generateSignature(base64policy, secretKey)];
			//var base64policy:String = Base64.encode(policy);
			//policy = base64policy;
			//return generateSignature(base64policy, secretKey);
		}
		
		private static function generateSignature(data:String, secretKey:String):String {
			
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