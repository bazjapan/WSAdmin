/** * GOOGLE API - AS3 LIBRARY *  * @author Joris Timmerman * @version 2.1 *  * GoogleTranslations - Translate using Google * Build by Joris Timmerman, these classes uses the Google Ajax API *  * These classes are using methods and classes from the Adobe Core Libary, downloadable @ http://code.google.com/p/as3corelib/ *  * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE AJAX API * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be) * */package be.boulevart.google.ajaxapi.translation {	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	import com.adobe.serialization.json.JSON;
	
	import be.boulevart.google.ajaxapi.translation.data.GoogleLanguageDetectionResult;
	import be.boulevart.google.ajaxapi.translation.data.GoogleTranslationResult;
	import be.boulevart.google.apicore.GoogleAPIServiceURL;
	import be.boulevart.google.apicore.GoogleApiKeyStore;
	import be.boulevart.google.events.GoogleAPIErrorEvent;
	import be.boulevart.google.events.GoogleApiEvent;	

	/**	 * @author joris	 */	public class GoogleTranslation extends EventDispatcher {		private var _orig : String;		private var _from : String;		private var _to : String;
		public function translate(textToTranslate : String,langFromCode : String,langToCode : String) : void {			var serviceURL : String = GoogleAPIServiceURL.TRANSLATE_SERVICE;				_orig = textToTranslate;			_from = langFromCode;			_to = langToCode;						var request : URLRequest = new URLRequest(serviceURL);			var loader : URLLoader = new URLLoader();						var vars : URLVariables = new URLVariables();			vars.v = "1.0";			vars.q = textToTranslate;			vars.langpair = langFromCode + "|" + langToCode;						if(GoogleApiKeyStore.keyIsSet) {				vars.key = GoogleApiKeyStore.API_KEY;			}						request.data = vars;						loader.addEventListener(Event.COMPLETE, onResponse);			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError); 			loader.load(request);		}
		public function detectLanguage(text : String) : void {			var serviceURL : String = GoogleAPIServiceURL.TRANSLATE_DETECTLANG_SERVICE;						var request : URLRequest = new URLRequest(serviceURL);			var loader : URLLoader = new URLLoader();						var vars : URLVariables = new URLVariables();			vars.v = "1.0";			vars.q = text;						request.data = vars;						loader.addEventListener(Event.COMPLETE, onDetectionResponse);			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError); 			loader.load(request);		}
		private function onResponse(event : Event) : void {			var json : Object = JSON.decode("" + event.target.data);			var results : String = json.responseData.translatedText as String;						var t : GoogleTranslationResult = new GoogleTranslationResult();			t.result = results;			t.from = _from;			t.to = _to;			t.orig = _orig;						dispatchEvent(new GoogleApiEvent(GoogleApiEvent.TRANSLATION_RESULT, t));		}
		private function onDetectionResponse(event : Event) : void {			var json : Object = JSON.decode("" + event.target.data);			if(json.responseData != null) {				var language : String = json.responseData.language as String;				var isReliable : Boolean = json.responseData.isReliable as Boolean;				var confidence : Number = json.responseData.confidence as Number ;						var detect : GoogleLanguageDetectionResult = new GoogleLanguageDetectionResult();				detect.language = language;				detect.isReliable = isReliable;				detect.confidence = confidence;							dispatchEvent(new GoogleApiEvent(GoogleApiEvent.TRANSLATION_LANGUAGE_DETECTION_RESULT, detect));			}else {				dispatchEvent(new GoogleAPIErrorEvent(GoogleAPIErrorEvent.API_ERROR, json.responseDetails as String, json.responseStatus as int))	;			}		}
		private function onIOError(event : IOErrorEvent) : void {  			dispatchEvent(new GoogleApiEvent(GoogleApiEvent.ON_ERROR, "IOERROR: " + event.text));		} 	}}