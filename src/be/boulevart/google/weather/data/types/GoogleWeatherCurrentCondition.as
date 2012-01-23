package be.boulevart.google.weather.data.types {

	public class GoogleWeatherCurrentCondition {
		private var _humidity : uint;
		private var _tempInF : int;
		private var _tempInC : int;
		private var _windDir : String;
		private var _windSum : String;
		private var _windSpeed : uint;
		private var _icon : String;
		private var _condition : String;

		public function GoogleWeatherCurrentCondition(condition : String,temperatureInFahrenheit : int,temperatureInCelsius : int,humidity : uint,
																				wind : String,windDirection : String,windSpeed : uint,icon : String) {
			_condition = condition;
			_tempInF = temperatureInFahrenheit;
			_tempInC = temperatureInCelsius;
			_humidity = humidity;
			_windSum = wind;
			_windDir = windDirection;
			_windSpeed = windSpeed;
			_icon = icon;
		}

		public function get conditionDescription() : String {
			return _condition;
		}

		public function get temperatureInFahrenheit() : Number {
			return _tempInF;
		}

		public function get temperatureInCelsius() : Number {
			return _tempInC;
		}

		public function get humidity() : uint {
			return _humidity;
		}

		public function get windDirection() : String {
			return _windDir;
		}

		public function get wind() : String {
			return _windSum;
		}

		public function get windSpeed() : uint {
			return _windSpeed;
		}

		public function get icon() : String {
			return _icon;
		}
	}
}