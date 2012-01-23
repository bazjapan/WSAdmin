package views.viewTestHarnesses
{
	import jp.wordsmart.dto.Contributer;
	import jp.wordsmart.model.AppModel;

	public function initializeAppModel():void
	{
		var contributor:Contributer = new Contributer();
		contributor.ID = '1';
		AppModel.getInstance().signedInContributor = contributor;
	}
	
}