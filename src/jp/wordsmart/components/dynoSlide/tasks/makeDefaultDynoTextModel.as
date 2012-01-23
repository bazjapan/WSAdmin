package jp.wordsmart.components.dynoSlide.tasks
{
	import image.BlendModes;
	
	import jp.wordsmart.components.dynoSlide.models.DynoTextModel;

	public function makeDefaultDynoTextModel():DynoTextModel
	{
		
		var model:DynoTextModel = new DynoTextModel();
		model.width = 200;
		model.height = 100;
		model.text = 'Text';
		model.bm = BlendModes.NORMAL;
		return model;
		
	}
	
}