package be.boulevart.google.ajaxapi.translation.data {

	public class GoogleLanguageDetectionResult {
		private var _lang : String;
		private var _ir : Boolean;
		private var _conf : Number;

		public function GoogleLanguageDetectionResult() {
		}

		public function get language() : String {
			return _lang;
		}

		public function set language(lang : String) : void {
			_lang = lang;
		}

		public function get isReliable() : Boolean {
			return _ir;
		}

		public function set isReliable(ir : Boolean) : void {
			_ir = ir;
		}

		public function get confidence() : Number {
			return _conf;
		}

		public function set confidence(conf : Number) : void {
			_conf = conf;
		}
	}
}