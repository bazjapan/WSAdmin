package views.viewTestHarnesses
{
	
	import jp.wordsmart.dto.WSKeyword;
	import jp.wordsmart.model.KeywordAdminModel;
	
	public function initializeKeywordAdminModel():void
	{
		var keyword:WSKeyword = new WSKeyword;
		keyword.ID = 105;
		keyword.keyword_text = "orange";
		KeywordAdminModel.getInstance().selectedKeyword = keyword;
	}
	
}