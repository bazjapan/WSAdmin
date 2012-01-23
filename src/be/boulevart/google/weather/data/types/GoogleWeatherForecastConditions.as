package be.boulevart.google.weather.data.types {

	public class GoogleWeatherForecastConditions {
		private var _condition : String;
		private var _min : int;
		private var _max : int;
		private var _day : String;
		private var _icon : String;		

		public function GoogleWeatherForecastConditions(dayOfWeek : String,low : int,high : int,icon : String,condition : String) {
			_day = dayOfWeek;
			_min = low;
			_max = high;
			_icon = icon;
			_condition = condition;
		}

		public function get dayOfWeek() : String {
			return _day;
		}

		public function get minimum() : Number {
			return _min;
		}

		public function get maximum() : Number {
			return _max;
		}

		public function get icon() : String {
			return _icon;
		}

		public function get conditionDescription() : String {
			return _condition;
		}
	}
}