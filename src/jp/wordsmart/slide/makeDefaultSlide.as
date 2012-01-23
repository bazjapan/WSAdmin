package jp.wordsmart.slide
{
	import jp.wordsmart.dto.WSImage;

	public function makeDefaultSlide(userID:Number):WSImage
	{
		var slide:WSImage = new WSImage;
		slide.image_title = "WordSmart Slide";
		slide.image_tags = "";
		slide.image_added_by = userID;
		
		return slide;
		
	}
	
}