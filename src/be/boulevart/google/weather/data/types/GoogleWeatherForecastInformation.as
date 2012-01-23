package be.boulevart.google.weather.data.types {
	public class GoogleWeatherForecastInformation {
		private var _city : String;
		private var _postalCode : String;
		private var _latitude : String;
		private var _longitude : String;
		private var _forecastDate : Date;
		private var _currentDateTime : Date;
		private var _unitSystem : String;
		public function GoogleWeatherForecastInformation(city : String,postalCode : String,latitude : String,longitude : String,forecastDate : Date,currentDateTime : Date,unitSystem : String) {
			_city = city;
			_postalCode = postalCode;
			_latitude = latitude;
			_longitude = longitude;
			_forecastDate = forecastDate;
			_currentDateTime = currentDateTime;
			_unitSystem = unitSystem;
		}
		public function get city() : String {
			return _city;
		}
		public function get postalCode() : String {
			return _postalCode;
		}
		public function get latitude() : String {
			return _latitude;
		}
		public function get longitude() : String {
			return _longitude;
		}
		public function get forecastDate() : Date {
			return _forecastDate;
		}
		public function get currentDateTime() : Date {
			return _currentDateTime;
		}
		public function get unitSystem() : String {
			return _unitSystem;
		}
	}
}