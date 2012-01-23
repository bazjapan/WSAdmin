package be.boulevart.google.ajaxapi.search {
	public class GoogleSearchResult {
		private var _results : Array;
		private var _estimatedNumResults : int = 0;
		private var _currentPageIndex : int = 0;
		private var _numPages : int = 1;
		public  function get results() : Array {
			return _results;
		}
		public function set results(results : Array) : void {
			_results = results;
		}
		public function get estimatedNumResults() : int {
			return _estimatedNumResults;
		}
		public function set estimatedNumResults(nor : int) : void {
			_estimatedNumResults = nor;
		}
		public function get currentPageIndex() : int {
			return _currentPageIndex;
		}
		public function set currentPageIndex(index : int) : void {
			_currentPageIndex = index;
		}
		public function get numPages() : int {
			return _numPages;
		}
		public function set numPages(np : int) : void {
			_numPages = np;
		}
	}
}