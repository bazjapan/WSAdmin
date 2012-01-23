package jp.wordsmart.components.dynoSlide.models
{
	import com.roguedevelopment.objecthandles.IMoveable;
	import com.roguedevelopment.objecthandles.IResizeable;
	
	import utils.type.getQNames;

	[Bindable]
	public class SimpleDynoDataModel implements IResizeable, IMoveable, IDynoDataModel
	{
		public function SimpleDynoDataModel(obj:Object = null)
		{
			if(obj!=null)
			{
				this.visible= obj["visible"];
				this.x= obj["x"];
				this.y= obj["y"];
				this.height= obj["height"];
				this.width= obj["width"];
				this.rotation= obj["rotation"];
				this.isLocked= obj["isLocked"];
			}
		}
		public var visible:Boolean = true;
		public var x:Number = 10;
		public var y:Number  = 10;
		public var height:Number = 100;
		public var width:Number = 200;
		public var rotation:Number = 0;
		public var isLocked:Boolean = false;
		
		public var showPositionInfo:Boolean = false;
		public var showSizeInfo:Boolean = false;
		public var showRotationInfo:Boolean = false;
		
		
		public function getModel():Object
		{
			var obj:Object = new Object;
			obj["visible"] = this.visible;
			obj["x"]=this.x;
			obj["y"]=this.y;
			obj["height"]=this.height;
			obj["width"] = this.width;
			obj["rotation"] = this.rotation;
			obj["isLocked"] = this.isLocked;
			return obj;
		}
	
	}
	
}