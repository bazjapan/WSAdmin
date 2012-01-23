package jp.wordsmart.audio.providers
{
	import jp.wordsmart.dto.AudioReader;

	public class WordSmartAudioProvider extends AudioProvider
	{
		public function WordSmartAudioProvider()
		{
			super();
			label = "Wordsmart Audio";
			copyright = "Audio provided by Wordsmart Community, All rights reserved."
			origin = label;
			file_prefix = "wsa";
			audio_generation_method = AUDIO_GENERATION_HUMAN;
			accepts_audio_requests = true;
			getReaders();
			serviceMaxChars = 50000;
		}
		
		private function getReaders():void
		{
		
		available_readers = [new AudioReader({data:1, label:"admin", dialect_code:"en-gb", reader_age:"45", reader_gender:"M"})];
		}
	}
}