package jp.wordsmart.audio
{
	import utils.date.now;

	public function getNewAudioFileName(userID:Number):String
		{
			return "wsa-"+userID+"-"+now().getTime().toString()+".mp3"
		}
	
}