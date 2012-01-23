package jp.wordsmart.components.dynoSlide.tasks
{
	import image.BlendModes;
	
	import jp.wordsmart.components.dynoSlide.models.DynoBitMapModel;

	public function makeDefaultDynoBitMapModel():DynoBitMapModel
		{
		var model:DynoBitMapModel = new DynoBitMapModel();
		model.width = 320;
		model.height = 240;
		model.src = "http://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Royal_Coat_of_Arms_of_the_United_Kingdom.svg/270px-Royal_Coat_of_Arms_of_the_United_Kingdom.svg.png";
		model.bm = BlendModes.NORMAL;
		return model;
		}
	
}