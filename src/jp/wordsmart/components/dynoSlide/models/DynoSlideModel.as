package jp.wordsmart.components.dynoSlide.models
{
	import com.adobe.serialization.json.JSON;

	[Bindable]
	public class DynoSlideModel
	{
		public function DynoSlideModel()
		{
		}
		
		public var bgm:DynoSlideBackgroundModel;
		public var tms:Array; //array of dynoTextModels
		public var bms:Array; //array of dynoBitMapModels
		
		public function getJSON():String
		{
			//get objects which include only nessasary params to recontruct model
			var bgmObj:Object = bgm.getModel();
			var tmObjsArray:Array = [];
			var bmObjsArray:Array = [];
			for each (var dtm:DynoTextModel in tms)
			{
				tmObjsArray.push(dtm.getModel());
			}
			for each (var btm:DynoBitMapModel in bms)
			{
				bmObjsArray.push(btm.getModel());
			}
			var all:Object = new Object;
			all['bgm']= bgmObj;
			all['tms']= tmObjsArray;
			all['bms']= bmObjsArray;
			
			return JSON.encode(all);
		}
		public function setJSON(image_edit_model:String):void
		{
			if(image_edit_model == null || image_edit_model == '')
			{
				bgm = new DynoSlideBackgroundModel;
				tms = [];
				bms = [];
			}
			else
			{
			var jObj:Object = JSON.decode(image_edit_model);
			bgm = new DynoSlideBackgroundModel(jObj['bgm']);
			var jtms:Array = jObj['tms'];
			tms = [];
			for each (var tm:Object in jtms)
			{
				tms.push(new DynoTextModel(tm));
			}
			var jbms:Array = jObj['bms'];
			bms = [];
			for each (var bm:Object in jbms)
			{
				bms.push(new DynoBitMapModel(bm));
			}
			}
			
		}
		
		
	}
}