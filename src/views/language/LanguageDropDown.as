package views.language
{
	import jp.wordsmart.model.AppModel;
	
	import mx.collections.ArrayCollection;
	import mx.core.ClassFactory;
	import mx.core.ScrollPolicy;
	
	import spark.components.DropDownList;
	import spark.events.DropDownEvent;
	
	import views.other.LangIconItemRenderer;
	
	public class LanguageDropDown extends DropDownList
	{
		public function LanguageDropDown()
		{
			super();
			this.dataProvider = new ArrayCollection(AppModel.getInstance().languages);
			this.width = 160;
			this.itemRenderer = new ClassFactory( views.other.LangIconItemRenderer);
			
			
		}

		
		
		public function set language(langcode:String):void
		{
		setSelectedLangCode(langcode);
		}
		public function get language():String
		{
			return getSelectedLangCode();
		}
		
		
		public function setSelectedLangCode(lang:String):void
		{
			var counter:int
			for each (var obj:Object in this.dataProvider)
			{
				if(obj["value"] == lang)
				{
					this.selectedIndex = counter;
					break;
				}
				counter++;
			}
			
		}
		public function getSelectedLangCode():String
		{
			return this.selectedItem["value"].toString();
		}
	}
}