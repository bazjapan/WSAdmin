package jp.wordsmart.components.dynoSlide.tasks
{
	import com.roguedevelopment.objecthandles.ObjectHandles;
	import com.roguedevelopment.objecthandles.constraints.MovementConstraint;
	import com.roguedevelopment.objecthandles.constraints.SizeConstraint;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import image.BlendModes;
	
	import jp.wordsmart.components.dynoSlide.DynoBitMap;
	import jp.wordsmart.components.dynoSlide.models.DynoBitMapModel;
	
	import spark.components.Group;
	
	import utils.number.randomWithinRange;

	public function addBitMapToSlide(container:Group, objectHandles:ObjectHandles, pModel:DynoBitMapModel, loadFromOrigURL:Boolean = true):DynoBitMap
	{
		var model:DynoBitMapModel = pModel;
		var objectToAdd:DynoBitMap = new DynoBitMap();
		objectToAdd.model = model;
		container.addElement(objectToAdd);
		if(loadFromOrigURL){objectToAdd.reloadImage()};
		objectHandles.selectionManager.clearSelection();
		var cons:Array = getConstraints(container, false);
		objectHandles.registerComponent( model, objectToAdd,null,true,cons);
		
		return objectToAdd;
	}
	
	
	
}