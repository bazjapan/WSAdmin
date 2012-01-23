package be.boulevart.google.ajaxapi.feeds.data {

	public class GoogleFeed {
		private var _author : String;
		private var _description : String;
		private var _link : String;
		private var _title : String;
		private var _feedType : String;
		private var _entries : Array = new Array();

		public function get author() : String {
			return _author;
		}

		public function set author(value : String) : void {
			_author = value;
		}

		public function get description() : String {
			return _description;
		}

		public function set description(value : String) : void {
			_description = value;
		}

		public function get link() : String {
			return _link;
		}

		public function set link(value : String) : void {
			_link = value;
		}

		public function get feedType() : String {
			return _feedType;
		}

		public function set feedType(value : String) : void {
			_feedType = value;
		}

		public function get title() : String {
			return _title;
		}

		public function set title(value : String) : void {
			_title = value;
		}

		public function get entries() : Array {
			return _entries;
		}

		public function set entries(value : Array) : void {
			_entries = value;
		}
	}
}