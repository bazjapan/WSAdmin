package jp.wordsmart.model
{
	
	
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.dto.Contributer;
	
	import spark.components.Group;
	

	
	
	
	[Bindable]
	public class AppModel 
	{
		private static var modelLocator:AppModel;
		
		public static function getInstance():AppModel
		{
			if (modelLocator == null)
			{
				modelLocator=new AppModel();
				
			}
			return modelLocator;
		}
		
		public function AppModel()
		{
			if (modelLocator != null)
			{
				throw new Error("Only one MainModel instance should be instantiated");
			}
		}
		
		
		public var signedInContributor:Contributer;
		
		public var useLocalControllers:Boolean = true;
		
		public var languages:Array = new Languages().languages;
	
		public var currentBaseLanguage:String = WordSmartConstants.DEFAULT_BASE_LANGUAGE;
			
		
			
		public var APP_CONTAINER:Group
	}
}
