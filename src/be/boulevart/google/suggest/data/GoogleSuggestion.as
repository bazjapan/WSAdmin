package be.boulevart.google.suggest.data {

	public class GoogleSuggestion {
		private var __suggestion : String;
		private var __numQueries : int;

		public function set suggestion(value : String) : void {
			this.__suggestion = value;
		}

		public function set numQueries(value : int) : void {
			this.__numQueries = value;
		}		

		public function get suggestion() : String {
			return __suggestion;
		} 

		public function get numQueries() : int {
			return __numQueries;
		} 
	}
}