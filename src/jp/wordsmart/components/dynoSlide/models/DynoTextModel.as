package jp.wordsmart.components.dynoSlide.models
{
	import flashx.textLayout.formats.TextAlign;
	
	import image.BlendModes;
	
	import utils.type.getQNames;

	[Bindable]
	public class DynoTextModel extends DynoSlideBackgroundModel
	{
		public function DynoTextModel(obj:Object = null)
		{
			super(obj);
			if(obj!=null)
			{
				this.fs= obj["fs"];
				this.tc= obj["tc"];
				this.ta= obj["ta"];
				this.text= obj["text"];
				this.bm= obj["bm"];
				this.fw= obj["b"];
				this.st= obj["st"];
				this.ha= obj["ha"];
			}
		}
		
		public var fs:int = 40;
		public var tc:uint;//
		public var ta:Number = 1;//textAlpha
		public var text:String;
		public var bm:String = BlendModes.NORMAL;//blendMode
		public var fw:String = "normal"
		public var st:String = "normal"//fontStyle
		public var ha:String = TextAlign.LEFT;	//hAlign
		
		public function increaseTextSize():void
		{
		fs++;
		}
		public function decreaseTextSize():void
		{
		fs--;
		}
		
		override public function getModel():Object
		{
			var obj:Object = super.getModel();
			obj["fs"]=this.fs;
			obj["tc"]=this.tc;
			obj["ta"]=this.ta;
			obj["text"]=this.text;
			obj["bm"]=this.bm;
			obj["fw"]=this.fw;
			obj["st"]=this.st;
			obj["ha"]=this.ha;
			
			return obj;
		}
		
		
		public function clone():DynoTextModel
		{
			var qNames:Array = getQNames(this);
			var nm:DynoTextModel = new DynoTextModel();
			for each (var str:String in qNames)
			{
				nm[str] = this[str];
			}
			return nm;
		}
		
	}
}