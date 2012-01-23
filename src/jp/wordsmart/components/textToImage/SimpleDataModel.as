package jp.wordsmart.components.textToImage
{
	import com.roguedevelopment.objecthandles.IMoveable;
	import com.roguedevelopment.objecthandles.IResizeable;

	public class SimpleDataModel implements IResizeable, IMoveable
	{
		
		[Bindable] public var x:Number = 10;
		[Bindable] public var y:Number  = 10;
		[Bindable] public var height:Number = 100;
		[Bindable] public var width:Number = 200;
		[Bindable] public var rotation:Number = 0;
		[Bindable] public var isLocked:Boolean = false;
	}
}