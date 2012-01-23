package views.language
{
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.utils.language.Dialect;
	import jp.wordsmart.utils.language.languageCodeToAnyDialectObject;
	import jp.wordsmart.utils.language.languageCodeToLanguageObject;
	import jp.wordsmart.utils.language.languageCodeToNonNativeDialectObject;
	import jp.wordsmart.utils.language.languageCodeToUnknownDialectObject;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.DropDownList;
	import spark.events.IndexChangeEvent;
	
	public class DialectDropDown extends DropDownList
	{
		public function DialectDropDown()
		{
			super();
			this.width = 160;
			this.labelField = "dialect_label";
			this.toolTip = "Audio Dialect";
			dialects = WordSmartConstants.DIALECTS;
			
		}

		
		public var availableDialects:ArrayCollection = new ArrayCollection;
		public var allowAny:Boolean;
		public var allowUnknown:Boolean;
		public var allowNonNative:Boolean;
		private var dialects:Array;
		private var _selectedLanguageCode:String
		

		public function get selectedLanguageCode():String
		{
			return _selectedLanguageCode;
		}

		public function set selectedLanguageCode(value:String):void
		{
			_selectedLanguageCode = value;
			showDialectsForLanguage(value);
		}

		public function showDialectsForLanguage(lang_code:String):void
		{
		_selectedLanguageCode = lang_code;
		availableDialects.source = get_dialects(lang_code);
		this.dataProvider = availableDialects;
		if(allowNonNative)
		{
		availableDialects.addItemAt(languageCodeToNonNativeDialectObject(lang_code),0)
		this.selectedIndex = 0;
		}
		if(allowAny)
		{
			//only used for requests
			availableDialects.addItemAt(languageCodeToAnyDialectObject(lang_code),0)
			this.selectedIndex = 0;
		}
		if(allowUnknown)
		{
			availableDialects.addItemAt(languageCodeToUnknownDialectObject(lang_code),0)
			this.selectedIndex = 0;
		}
		}
		

		public function set dialect(str:String):void
		{
			if(selectedLanguageCode)
			{
				setDialect(selectedLanguageCode,str);
			}
		}
		public function get dialect():String
		{
			return selectedItem["dialect_code"];
		}
		
		public function setDialect(lang_code:String, dialect_code:String):void
		{
			
			//showDialectsForLanguage(lang_code)
			var counter:int;
			for each (var obj:Dialect in availableDialects)
			{
				if(obj.dialect_code == dialect_code)
				{
					this.selectedIndex = counter;
					break;
				}
				counter++;
			}
			
		}
		
		
		
		private function get_dialects(language_code:String):Array
		{
			var available_dialects:Array = [];
			
			for each (var obj:Object in dialects)
			{
				if(language_code == obj["language_code"])
				{
					available_dialects.push(obj);
				}
			}
			return available_dialects;
		}
	}
}