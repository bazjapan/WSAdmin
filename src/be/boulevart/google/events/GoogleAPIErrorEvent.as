/**
 * GOOGLE API - AS3 LIBRARY
 * 
 * @author Joris Timmerman
 * @version 2.1
 * 
 * GoogleAPIErrorEvent - Events thrown on API error
 * Build by Joris Timmerman

 * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE AJAX API
 * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be)
 */
package be.boulevart.google.events {
	import flash.events.ErrorEvent;			
	 * @author joris
	 */
	public class GoogleAPIErrorEvent extends ErrorEvent {
		public static const API_ERROR : String = "api_error"; 


			super(error_type, false, false, message);
			this._errorID = id;
		}

			return this.text;
		}

			return this._errorID;
		}

			return 	"Google API Error:: " + text + " (responseStatus: " + responseStatus + ")\n" + "Please check your search query.\n" + "Error-details:";
		}
	}
}
