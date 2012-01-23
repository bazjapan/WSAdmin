package be.boulevart.google.weather.data {
	import be.boulevart.google.weather.data.types.GoogleWeatherCurrentCondition;	import be.boulevart.google.weather.data.types.GoogleWeatherForecastInformation;	
	public class GoogleWeatherData {
		private var _forecastInfo : GoogleWeatherForecastInformation;
		private var _currentCondition : GoogleWeatherCurrentCondition;
		private var _forecastConditions : Array;

		public function GoogleWeatherData(forecastInformation : GoogleWeatherForecastInformation,currentCondition : GoogleWeatherCurrentCondition,forecastConditions : Array) {
			_forecastInfo = forecastInformation;
			_currentCondition = currentCondition;
			_forecastConditions = forecastConditions;
		}

		public function get forecastInfo() : GoogleWeatherForecastInformation {
			return _forecastInfo;
		}

		public function get forecastConditions() : Array {
			return _forecastConditions;
		}

		public function get currentConditions() : GoogleWeatherCurrentCondition {
			return _currentCondition;
		}
	}
}