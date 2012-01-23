package jp.wordsmart.slide
{
	import jp.wordsmart.model.AppModel;
	
	import utils.date.now;

	public function getNewSlideImageFileName(userID:String):String
	{
		return "wss-"+userID+"-"+now().getTime().toString()+".png"
	}
	
}