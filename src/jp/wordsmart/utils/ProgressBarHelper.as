package jp.wordsmart.utils
{
	import views.ProgressBar;

	public class ProgressBarHelper
	{
		public function ProgressBarHelper(pb:ProgressBar)
		{
			this.progressBar = pb;
		}
		
		public var progressBar:ProgressBar;
		//---------------progress bar
		public function enableProgress(action:String, perc:int):void
		{
			if(progressBar == null){return};
			progressBar.visible = true;
			progressBar.includeInLayout = true;
			progressBar.label = action +" "+ perc.toString()+"%";
			progressBar.enabled = true;
			progressBar.setProgress(perc,100);
		}
		public function disableProgress():void
		{
			if(progressBar == null){return};
			progressBar.visible = false;
			progressBar.includeInLayout = false;
			progressBar.label = "Done";
			progressBar.enabled = false;
		}
		////---------------progress bar
	}
}