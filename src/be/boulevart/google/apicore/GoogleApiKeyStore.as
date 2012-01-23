/**
 * GOOGLE API - AS3 LIBRARY
 * 
 * @author Joris Timmerman
 * @version 2.1
 * 
 * GoogleApiKeyStore - If you have a Google API key, filled it in here
 * Build by Joris Timmerman, these classes uses the Google API
 * 
 * These classes are using methods and classes from the Adobe Core Libary, downloadable @ http://code.google.com/p/as3corelib/
 * 
 * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE API
 * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be)
 * */

package be.boulevart.google.apicore {
	public class GoogleApiKeyStore {
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------

		
		//Sign up for you API key at: http://code.google.com/intl/us-en/apis/ajaxsearch/signup.html
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public static var API_KEY : String = "<insert API key here>";
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
		
		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public static function setAPIKey(apiKey : String) : void {
			API_KEY = apiKey;
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
	
		
	
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public static function get keyIsSet() : Boolean {
			if(API_KEY == "" || API_KEY == "<insert API key here>") {
				return false;
			}else {
				return true;
			}
		}
		
	
//- END CLASS ---------------------------------------------------------------------------------------------
	}
}