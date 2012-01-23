package jp.wordsmart.components.dynoSlide.tasks
{
	import com.roguedevelopment.objecthandles.constraints.MaintainProportionConstraint;
	import com.roguedevelopment.objecthandles.constraints.MovementConstraint;
	import com.roguedevelopment.objecthandles.constraints.SizeConstraint;
	
	import spark.components.Group;
	
	public function getConstraints(container:Group, maintainAspect:Boolean):Array
	{
		var allContraints:Array = [];
		var constraint:SizeConstraint = new SizeConstraint();
		constraint.minWidth = 16;
		constraint.maxWidth = container.width-2;
		constraint.minHeight = 16;
		constraint.maxHeight = container.height-2;
		allContraints.push(constraint);
		
		var constraint2:MovementConstraint = new MovementConstraint();
		constraint2.minX = 0;
		constraint2.minY = 0;
		constraint2.maxX = container.width-2;
		constraint2.maxY = container.height;
		allContraints.push(constraint2);
		
		var constraint3:MaintainProportionConstraint;
		if(maintainAspect)
		{
			constraint3 = new MaintainProportionConstraint();
			allContraints.push(constraint3);
		}
		
		return allContraints;
	}
	
	
}