package jp.wordsmart.model
{
	import views.image.WordSmartSlideCreator;
	[Bindable]
	public class ImageCreatorModel
	{
		private static var modelLocator:ImageCreatorModel;
		
		public static function getInstance():ImageCreatorModel
		{
			if (modelLocator == null)
			{
				modelLocator=new ImageCreatorModel();
				
			}
			return modelLocator;
		}
		
		public function ImageCreatorModel()
		{
			if (modelLocator != null)
			{
				throw new Error("Only one ImageCreatorModel instance should be instantiated");
			}
		}
		
		import mx.collections.ArrayCollection;
		
		public var imageWidth:int = 640;
		public var imageHeight:int = 480;
		
		public var imageCreator:WordSmartSlideCreator;
		
		public var lastCopied:Object;
		
	}
}
