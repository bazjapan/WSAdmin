package jp.wordsmart.audio.providers
{
	import com.adobe.serialization.json.JSON;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.utils.Timer;
	
	import jp.wordsmart.dto.AudioReader;
	import jp.wordsmart.utils.language.dialectCodeToDialectObject;
	
	import mx.controls.Alert;
	
	import utils.display.wait;
	import utils.http.BrowserTypes;
	import utils.http.getUserAgentString;

	public class NaturalVoiceByNaturalSoft extends AudioProvider
	{
		public function NaturalVoiceByNaturalSoft()
		{
			super();
			copyright = "Audio provided by AT&T Natural Voices, All rights reserved."
			label = "AT&T Natural Voices";
			origin = label;
			file_prefix = "nvns";
			audio_type = "word";
			available_readers = getReaders();
			audio_generation_method = AUDIO_GENERATION_MACHINE;
			speeds = ["-10","-9","-8","-7","-6","-5","-4","-3","-2","-1","0","1","2","3","4","5","6","7","8","9","10"]
			default_speed = "0"
			urlIsTemporary = true;
			serviceMaxChars = 200;
		}
		private var serviceURL:String = "http://service.naturalreaders.com/tts2010/wsconvertapi.php";
		private var appTag:String = "375";
		
		
		public function getReaders():Array
		{
			var readers:Array = []
				
			var dialect:String = "en-us";
			var reader_age:String = "30s";
			readers.push(new AudioReader({data:19, label:"Paul", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
			readers.push(new AudioReader({data:37, label:"Ryan", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
			readers.push(new AudioReader({data:17, label:"Kate", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
			readers.push(new AudioReader({data:27, label:"Heather", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
			readers.push(new AudioReader({data:11, label:"Mike", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
			readers.push(new AudioReader({data:4, label:"Claire", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
			readers.push(new AudioReader({data:5, label:"Crystal", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
			readers.push(new AudioReader({data:6, label:"Julia", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
			readers.push(new AudioReader({data:9, label:"Lauren", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
			readers.push(new AudioReader({data:10, label:"Mel", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
			readers.push(new AudioReader({data:12, label:"Ray", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
			readers.push(new AudioReader({data:14, label:"Rich", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
			readers.push(new AudioReader({data:30, label:"Laura", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
			//"UK English":
				dialect= "en-gb";
					readers.push(new AudioReader({data:26, label:"Graham", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
					readers.push(new AudioReader({data:2, label:"Audrey", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
					readers.push(new AudioReader({data:3, label:"Charles", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
					readers.push(new AudioReader({data:32, label:"Lucy", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
					readers.push(new AudioReader({data:34, label:"Peter", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
					readers.push(new AudioReader({data:35, label:"Rachel", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
				//case "French":
				dialect= "fr-fr";
					readers.push(new AudioReader({data:21, label:"Bruno", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
					readers.push(new AudioReader({data:20, label:"Alice", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
					readers.push(new AudioReader({data:7, label:"Juliette", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
					readers.push(new AudioReader({data:16, label:"Alain", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
					readers.push(new AudioReader({data:23, label:"Claire", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
					readers.push(new AudioReader({data:28, label:"Julie", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
				//"Canadian French":
				dialect= "fr-ca";
					readers.push(new AudioReader({data:31, label:"Louise", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
				dialect= "es-es";
				readers.push(new AudioReader({data:29, label:"Klaus", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
					readers.push(new AudioReader({data:39, label:"Sarah", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
					readers.push(new AudioReader({data:8, label:"Klara", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
					readers.push(new AudioReader({data:13, label:"Reiner", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
				//"Spanish":
				dialect= "es-es";
				readers.push(new AudioReader({data:33, label:"Maria", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
				readers.push(new AudioReader({data:15, label:"Rosa", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
				readers.push(new AudioReader({data:1, label:"Alberto", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
				//"US Spanish":
				dialect= "es-us";
				readers.push(new AudioReader({data:36, label:"Rosa", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
				//"Italian":
				dialect= "it-it";
				readers.push(new AudioReader({data:22, label:"Chiara", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
				readers.push(new AudioReader({data:40, label:"Vittorio", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
				//"Swedish":
				dialect = "sv-se";
				readers.push(new AudioReader({data:24, label:"Emma", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
					readers.push(new AudioReader({data:25, label:"Erik", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
					//Arabic
				dialect = "ar-sa";
				readers.push(new AudioReader({data:38, label:"Salma", dialect_code:dialect, reader_age:reader_age, reader_gender:"F"}));
				readers.push(new AudioReader({data:41, label:"Youssef", dialect_code:dialect, reader_age:reader_age, reader_gender:"M"}));
				
				return readers;
		}// end function
		
		
		override public function getURL(text:String, subText:String, reader:Object, speed:String, mood:String, urlCallback:Function, errorCallback:Function = null ,statusCallback:Function = null):void
		{
			//urlCallback returns url of audio
			//statusCallback returns status string
			//errorCallback returns error string
			var preparedText:String = encodeURIComponent(text.substring(0, serviceMaxChars-1))
			trace("prepared text is "+preparedText.length)
			
			var sID:String;
			var rID:String = reader["data"];
			
			//add recording
			var ur:URLRequest;
			ur = new URLRequest();
			ur.requestHeaders = getHeaders();
			ur.url = serviceURL;
			ur.data = "op=initbytext&title=demo&text=" + preparedText + "&rid=" + rID + "&spd=" + speed + "&tag=" + appTag;
			ur.method = URLRequestMethod.GET;
			var loader_pid:URLLoader = new URLLoader();
			loader_pid.load(ur);
			loader_pid.addEventListener(Event.COMPLETE, function(evt:Event):void
			{
				//start convert
				var jsonObj:Object;
				var result:String = String(evt.target.data);
				jsonObj = new Object();
				jsonObj = JSON.decode(result);
				if (jsonObj.rst == "s")
				{
				var pID:String = jsonObj.pid;
				var ur:URLRequest;
				ur = new URLRequest();
				ur.url = serviceURL;
				ur.method = URLRequestMethod.GET;
				ur.data = "op=start&pid=" + pID + "&parg=0";
				var loader_sid:URLLoader = new URLLoader();
				loader_sid.load(ur);
				doStatusCallback("Loading", statusCallback);
				
				loader_sid.addEventListener(Event.COMPLETE, function(evt:Event):void
				{
					var result:String = String(evt.target.data);
					var	jsonObj:Object = new Object();
					jsonObj = JSON.decode(result);
					if (jsonObj.rst == "s")
					{
						sID = jsonObj.sid;
						var ur:URLRequest;
						ur = new URLRequest();
						ur.requestHeaders = getHeaders();
						ur.url = serviceURL;
						ur.method = URLRequestMethod.GET;
						ur.data = "op=getwaitnum&sid="+sID;
						var loader_num:URLLoader = new URLLoader();
						loader_num.load(ur);
						doStatusCallback("Loading", statusCallback);
						loader_num.addEventListener(Event.COMPLETE, function(evt:Event):void
						{
							var result:String = String(evt.target.data);
							var jsonObj:Object = new Object();
							jsonObj = JSON.decode(result);
							if (jsonObj.rst == "s")
							{
								if (jsonObj.waitnum == 0)
								{
									doStatusCallback("Loading", statusCallback);
									getAddress(sID, function(address:String):void
									{
										urlCallback(address);
										return;
									});
								}
								else
								{
									doStatusCallback("Loading", statusCallback);
									getWaitNum(sID, function():void
									{
										doStatusCallback("Loading", statusCallback);
										getAddress(sID, function(address:String):void
										{
											urlCallback(address);
											return;
										});
									});
								}
							}
							else
							{
								doErrorCallback("Service is Busy",errorCallback);
							}
						});
					}
					else
					{
						doErrorCallback("Service is Busy",errorCallback);
					}
					loader_sid.addEventListener(IOErrorEvent.IO_ERROR,handleError);
				});
				
				}else{};
				
				
			});
			
			loader_pid.addEventListener(IOErrorEvent.IO_ERROR, handleError);
			
			
			
			function handleError(evt:Event):void
			{
				Alert.show("Problem getting audio, please try again");
			}
			
			
			
		}
		
		private function getWaitNum(sID:String, callback:Function):void
		{
			var timer:Timer = new Timer(500, 0);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, function(evt:TimerEvent):void
			{
			var ur:URLRequest;
			ur = new URLRequest();
			ur.requestHeaders = getHeaders();
			ur.url = serviceURL;
			ur.method = URLRequestMethod.GET;
			ur.data = "op=getwaitnum&sid=" + sID;
			var loader_num:URLLoader = new URLLoader();
			loader_num.load(ur);
			loader_num.addEventListener(Event.COMPLETE, function(evt:Event):void
			{
				var result:String = String(evt.target.data);
				var jsonObj:Object = new Object();
				jsonObj = JSON.decode(result);
				if (jsonObj.rst == "s")
				{
					if (jsonObj.waitnum == 0)
					{
						callback();
						timer.stop();
					}
					else
					{
						timer.start();
					}// end else if
				}
				
			});
			});
		}
		private function getAddress(sID:String ,callback:Function):void
		{
			var ur:URLRequest;
			ur = new URLRequest();
			ur.requestHeaders = getHeaders();
			ur.url = serviceURL;
			ur.method = URLRequestMethod.GET;
			ur.data = "op=getaddress&sid=" + sID;
			var loader_address:URLLoader = new URLLoader();
			loader_address.load(ur);
			loader_address.addEventListener(Event.COMPLETE, function(evt:Event):void
			{
				var result:String;
				var jsonObj:Object;
				result = String(evt.target.data);
				jsonObj = new Object();
				jsonObj = JSON.decode(result);
					if (jsonObj.rst == "s")
					{
						callback(jsonObj.addr + ".mp3");
					}
					else
					{
						//ta_info.text = "Sorry, it\'s busy now.";
					}// end else if
				
			});
			
		}
		
		
		private function getHeaders():Array
		{
			var headers:Array = [];
			headers.push(new URLRequestHeader('Referer','http://service.naturalreaders.com/tts2010/ttsdemo0118.swf?tag='+appTag));
			headers.push(new URLRequestHeader('Accept','*/*')); 
			headers.push(new URLRequestHeader('User-Agent',getUserAgentString(BrowserTypes.CHROME)));
			
			return headers;
		}
		
		
	}
}