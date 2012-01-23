package jp.wordsmart.components.dynoSlide.tasks
{
	import com.roguedevelopment.objecthandles.ObjectHandles;
	
	import image.BlendModes;
	
	import jp.wordsmart.components.dynoSlide.DynoText;
	import jp.wordsmart.components.dynoSlide.models.DynoTextModel;
	
	import spark.components.Group;
	
	import utils.number.randomWithinRange;

	public function addTextToSlide(container:Group, objectHandles:ObjectHandles, model:DynoTextModel):DynoText
	{
		var objectToAdd:DynoText = new DynoText();
		objectToAdd.model = model;
		
		
		container.addElement(objectToAdd);
		objectHandles.selectionManager.clearSelection();
		objectHandles.selectionManager.addToSelected(model);
		var cons:Array = getConstraints(container,false);
		objectHandles.registerComponent( model, objectToAdd,null,true,cons);
		
		
		
		return objectToAdd;
	}
	
	
}