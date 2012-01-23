package be.boulevart.google.ajaxapi.translation.data {

	/**	 * @author joris	 */	public class GoogleTranslationResult {		private var __result : String;		private var __orig : String;		private var __from : String;		private var __to : String;

		public  function get result() : String {			return __result;		}

		public function set result(_result : String) : void {			__result = _result;		}

		public function get orig() : String {			return __orig;		}

		public function set orig(_orig : String) : void {			__orig = _orig;		}

		public function get from() : String {			return __from;		}

		public function set from(_from : String) : void {			__from = _from;		}

		public function get to() :String{			return __to;		}

		public function set to(_to:String) : void {			__to = _to;		}	}}