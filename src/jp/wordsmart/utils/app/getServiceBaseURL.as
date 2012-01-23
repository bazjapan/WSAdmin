package jp.wordsmart.utils.app
{
	import jp.wordsmart.DomainSettings;
	import jp.wordsmart.WordSmartConstants;

	public function getServiceBaseURL():String
	{
		if(WordSmartConstants.debugging)
		{
		return DomainSettings.API_URL;
		}
		return DomainSettings.API_URL;
	}
	
}