package be.boulevart.google.ajaxapi.search.patents.data {
	/**	 * @author joris	 */	public class GooglePatent {		private var __title : String;		private var __titleNF : String;		private var __content : String;		private var __unescapedUrl : String;		private var __url : String;		private var __applicationDate : String;		private var __patentNumber : String;		private var __patentStatus : String;		private var __assignee : String;		private var __thumbUrl : String;
		public function get title() : String {			return __title;		}
		public function set title(_title : String) : void {			__title = _title;		}
		public function get titleNoFormatting() : String {			return __titleNF;		}
		public function set titleNoFormatting(_titleNF : String) : void {			__titleNF = _titleNF;		}
		public function get content() : String {			return __content;		}
		public function set content(_content : String) : void {			__content = _content;		}
		public function get unescapedUrl() : String {			return __unescapedUrl;		}
		public function set unescapedUrl(_unescapedUrl : String) : void {			__unescapedUrl = _unescapedUrl;		}
		public function get url() : String {			return __url;		}
		public function set url(_url : String) : void {			__url = _url;		}
		public function get applicationDate() : String {			return __applicationDate;		}
		public function set applicationDate(_applicationDate : String) : void {			__applicationDate = _applicationDate;		}
		public function get patentNumber() : String {			return __patentNumber;		}
		public function set patentNumber(_patentNumber : String) : void {			__patentNumber = _patentNumber;		}
		public function get patentStatus() : String {			return __patentStatus;		}
		public function set patentStatus(_patentStatus : String) : void {			__patentStatus = _patentStatus;		}
		public function get assignee() : String {			return __assignee;		}
		public function set assignee(_assignee : String) : void {			__assignee = _assignee;		}
		public function get thumbUrl() : String {			return __thumbUrl;		}
		public function set thumbUrl(_thumbUrl : String) : void {			__thumbUrl = _thumbUrl;		}	}}