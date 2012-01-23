package be.boulevart.google.ajaxapi.feeds.data {

	public class GoogleFeedFindResult {
		private var _entries : Array = new Array();
		private var _query : String;

		public function get query() : String {
			return _query;
		}

		public function set query(value : String) : void {
			_query = value;
		}

		public function get entries() : Array {
			return _entries;
		}

		public function set entries(value : Array) : void {
			_entries = value;
		}
	}
}