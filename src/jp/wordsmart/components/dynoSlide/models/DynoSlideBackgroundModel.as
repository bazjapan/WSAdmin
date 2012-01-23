package jp.wordsmart.components.dynoSlide.models
{
	
	
	
	[Bindable]
	public class DynoSlideBackgroundModel extends SimpleDynoDataModel
	{
		public function DynoSlideBackgroundModel(obj:Object = null)
		{
			super(obj);
			if(obj!=null)
			{
				this.bgc= obj["bgc"];
				this.bc= obj["bc"];
				this.bw= obj["bw"];
				this.bga= obj["bga"];
				this.ba= obj["ba"];
				//this.bgu= obj["bgu"];
				//this.uu= obj["uu"];
			}
			
		}
		public var bgc:uint = 0xFFFFFF;//backgroundColor
		public var bc:uint = 0x000000;//borderColor
		public var bw:uint = 0;//borderWeight
		public var bga:Number =1;//backgroundAlpha
		public var ba:Number = 1;//borderAlpha
		//public var bgu:String;//bgURL
		//public var uu:Boolean = true;//useURL
		
		
		override public function getModel():Object
		{
			var obj:Object = super.getModel();
			obj["bgc"]=this.bgc;
			obj["bc"]=this.bc;
			obj["bw"]=this.bw;
			obj["bga"]=this.bga;
			obj["ba"]=this.ba;
			//obj["bgu"]=this.bgu;
			//obj["uu"]=this.uu;
			
			return obj;
		}
		
	}
}