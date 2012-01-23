

package s3.flash {
    
    /**
     * Provides configuration options for a POST request to S3.
     */
    public class S3PostOptions {
        
        /**
         * A canned access control list for the object being uploaded to S3.
         * 
         * Valid values are:
         *    private
         *    public-read
         *    public-read-write
         *    authenticated-read
         */
        public var acl:String;
		
		
		//wordsmart specific values - also see:
		//generate policy doc
		//and s3PostRequest-loadPolicyfile
		/*public var addedBy:String;
		public var origURL:String;
		public var userDialect:String;
		public var userDOB:String;
		public var userGender:String;
		public var audioLength:String;*/
		
		
        /**
         * The MIME type of the object being uploaded.
         */
        public var contentType:String;
        
        /**
         * Base64 encoded S3 POST policy document used to validate this request.
         *
         * For more details on how to build a policy document, see:
         * http://docs.amazonwebservices.com/AmazonS3/2006-03-01/
         */
        public var policy:String;
        
        /**
         * Base64 encoded signature of the S3 POST policy document used to validate this request.
         *
         * For more details on how to build a policy document, see:
         * http://docs.amazonwebservices.com/AmazonS3/2006-03-01/
         * 
         * You can use the S3PostSamplePolicyGenerator application included in this sample code to
         * generate policy documents and sign them with your secret key.
         */
        public var signature:String;
        
        /**
         * A flag indicating whether HTTPS should be used.
         */
        public var secure:Boolean;
    }
}
