package views.tasks
{
	import jp.wordsmart.dto.WSImage;
	
	import utils.stringList.listAppend;
	import utils.stringList.listFind;

	public function addTagToSlide(tag_text:String, slide:WSImage):void
	{
		if(slide.image_tags == null || slide.image_tags == '')
		{
			slide.image_tags  = tag_text;
		}
		else
		{
			if(listFind(slide.image_tags, tag_text, "|")== -1)
			{
			slide.image_tags = listAppend(slide.image_tags,tag_text, "|");
			}
		}
	}
	
}