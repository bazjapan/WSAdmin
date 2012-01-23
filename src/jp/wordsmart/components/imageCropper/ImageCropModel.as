package jp.wordsmart.components.imageCropper
{
	[Bindable]
	public class ImageCropModel
	{
		public function ImageCropModel()
		{
		}
		
		public var width:int;
		public var height:int;
		public var bgColor:uint;
		public var bgAlpha:Number = 1;
		public var handleColor:uint = 0xFF00FF;
		public var maskColor:uint= 0x660066; 
		public var maskAlpha:Number =0.6;
		public var imageSource:Object;
		public var originalURL:String;
		
	}
}