package jp.wordsmart.components.dynoSlide.tasks
{
	import jp.wordsmart.components.dynoSlide.models.DynoBitMapModel;
	import jp.wordsmart.components.dynoSlide.models.DynoSlideModel;
	
	import utils.object.clone;
	import utils.object.copy;

	public function cloneDynoSlideModel(modelToCopy:DynoSlideModel):DynoSlideModel
	{
	var toReturn:DynoSlideModel = new DynoSlideModel();
	toReturn.setJSON(modelToCopy.getJSON());;
	}
	
}