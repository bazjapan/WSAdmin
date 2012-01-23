package jp.wordsmart.audio.providers
{
	import jp.wordsmart.WordSmartConstants;

	public class WordSmartAudioMicrophone extends AudioProvider
	{
		public function WordSmartAudioMicrophone()
		{
			super();
			
			label = "Wordsmart User Audio";
			copyright = "Audio provided by Wordsmart Community, All rights reserved."
			origin = label;
			file_prefix = "wsa";
			
		}
	}
}