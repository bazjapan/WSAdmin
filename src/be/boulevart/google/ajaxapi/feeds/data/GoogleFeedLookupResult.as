package be.boulevart.google.ajaxapi.feeds.data {

	public class GoogleFeedLookupResult {
		private var _url : String;
		private var _query : String;

		public function get query() : String {
			return _url;
		}

		public function set query(value : String) : void {
			_url = value;
		}

		public function get url() : String {
			return _query;
		}

		public function set url(value : String) : void {
			_query = value;
		}

		public function get feedFound() : Boolean {
			return url != "";
		}
	}
}