package jp.wordsmart.components.dynoSlide.models
{
	import flash.utils.Dictionary;
	
	import image.BlendModes;
	
	import utils.display.Alignment;
	import utils.object.clone;
	import utils.object.copy;
	import utils.type.getQNames;
	
	
	
	
	[Bindable]
	public class DynoBitMapModel extends DynoSlideBackgroundModel
	{
		public function DynoBitMapModel(obj:Object = null)
		{
			super(obj);
			if(obj!=null)
			{
				this.bm= obj["bm"];
				this.src= obj["src"];
				this.ha= obj["ha"];
				this.ia= obj["ia"];
				this.cd= obj["cd"];
				
			}
		}
		public var bm:String = BlendModes.NORMAL;
		public var src:String;//source
		public var ha:String = "left";//hAlign
		public var ia:Number = 1;//imageAlpha
		public var cd:Object;//cropData[xywh]
		
		override public function getModel():Object
		{
			var obj:Object = super.getModel();
			obj["bm"]=this.bm;
			obj["src"]=this.src;
			obj["ha"]=this.ha;
			obj["ia"]=this.ia;
			obj["cd"]=this.cd;
			
			return obj;
		}
		
		public function clone():DynoBitMapModel
		{
			var qNames:Array = getQNames(this);
			var nm:DynoBitMapModel = new DynoBitMapModel();
			for each (var str:String in qNames)
			{
			nm[str] = this[str];
			}
			return nm;
		}
		
	}
}