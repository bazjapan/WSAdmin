package jp.wordsmart.model
{
	import jp.wordsmart.dto.WSImage;
	
	import views.image.WordSmartSlideAdder;
	[Bindable]
	public class SlideAdderModel
	{
		private static var modelLocator:SlideAdderModel;
		
		public static function getInstance():SlideAdderModel
		{
			if (modelLocator == null)
			{
				modelLocator=new SlideAdderModel();
				
			}
			return modelLocator;
		}
		
		public function SlideAdderModel()
		{
			if (modelLocator != null)
			{
				throw new Error("Only one ImageAdderModel instance should be instantiated");
			}
		}
		
		import mx.collections.ArrayCollection;
		
		public var imageWidth:int = 640;
		public var imageHeight:int = 480;
		
		public var imageAdder:WordSmartSlideAdder;
		public var selectedImage:WSImage;
		
		public var recentlyAddedSlides:ArrayCollection = new ArrayCollection;
		
	}
}
