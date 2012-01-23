package jp.wordsmart.components.textToImage
{
	import jp.wordsmart.components.textToImage.SimpleDataModel;

	public class TextDataModel extends SimpleDataModel
	{
		[Bindable] public var text:String;
		[Bindable]public var currentLayerIndex:int; //its z index begins at 0 - not using yet
	}
}