package jp.wordsmart.model
{
	import jp.wordsmart.combo.ComboAdderViewModel;
	import jp.wordsmart.dto.WSCombo;
	import jp.wordsmart.dto.WSKeyword;
	
	
	[Bindable]
	public class KeywordAdminModel 
	{
		private static var modelLocator:KeywordAdminModel;
		
		public static function getInstance():KeywordAdminModel
		{
			if (modelLocator == null)
			{
				modelLocator=new KeywordAdminModel();
				
			}
			return modelLocator;
		}
		
		public function KeywordAdminModel()
		{
			if (modelLocator != null)
			{
				throw new Error("Only one KeywordModel instance should be instantiated");
			}
		}
		
		import mx.collections.ArrayCollection;
		
		public var loadedKeywords:ArrayCollection = new ArrayCollection;
		public var selectedKeyword:WSKeyword;
		public var selectedKeyword_attachedImages:ArrayCollection = new ArrayCollection;
		public var selectedKeyword_combos:ArrayCollection = new ArrayCollection;
		public var comboAdderViewModel:ComboAdderViewModel;
		
	}
}
