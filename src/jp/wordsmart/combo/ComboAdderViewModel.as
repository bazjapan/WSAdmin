package jp.wordsmart.combo
{
	import com.pbsmediatech.json.utils.extractResult;
	import com.pbsmediatech.json.utils.extractResultResult;
	
	import jp.wordsmart.DomainSettings;
	import jp.wordsmart.dto.WSAudio;
	import jp.wordsmart.dto.WSCombo;
	import jp.wordsmart.dto.WSImage;
	import jp.wordsmart.dto.WSKeyword;
	import jp.wordsmart.json.controllers.WSAudioController;
	import jp.wordsmart.json.controllers.WSComboController;
	import jp.wordsmart.json.controllers.WSImageController;
	import jp.wordsmart.json.utils.WSAudioResultHelper;
	import jp.wordsmart.json.utils.WSComboResultHelper;
	import jp.wordsmart.json.utils.WSImageResultHelper;
	import jp.wordsmart.utils.popMessage;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	[Bindable]
	public class ComboAdderViewModel
	{
		public function ComboAdderViewModel()
		{
		}
		
		
		public function get selected_combo():WSCombo
		{
			return _selected_combo;
		}

		public function set selected_combo(value:WSCombo):void
		{
			_selected_combo = value;
			if(!isNaN(selected_combo.combo_ID))
			{
				getAudio();
				getImage();
			}
		}

		private var _selected_combo:WSCombo;
		public var audio:WSAudio;
		public var keyword:WSKeyword;
		public var image:WSImage;
		
		private var comboController:WSComboController = new WSComboController(DomainSettings.API_URL);
		
		
		public function save():void
		{
		if(image == null){Alert.show("Please select Image")};
		if(audio == null){Alert.show("Please select Audio")};
		selected_combo.audio_ID = audio.audio_ID;
		selected_combo.image_ID = image.image_ID;
			if(isNaN(selected_combo.combo_ID))
			{
				comboController.add_ws_combo(selected_combo,function(evt:ResultEvent):void
				{
				selected_combo.combo_ID = Number(extractResultResult(evt));
				popMessage("Combo Added");
				});
			}
			else
			{
				comboController.update_ws_combos_by_combo_ID(selected_combo,function(evt:ResultEvent):void
				{
					popMessage("Combo Updated");
				});
			}
		}
		
		private function getImage():void
		{
			new WSImageController(DomainSettings.API_URL).get_ws_images_by_image_ID({image_ID:selected_combo.image_ID},
				function(evt:ResultEvent):void
				{
					var results:Array = new WSImageResultHelper().resultToArray(extractResult(evt));
					if(results.length>0)
					{
						image = results[0] as WSImage;
					}
				});
		}
		private function getAudio():void
		{
			new WSAudioController(DomainSettings.API_URL).get_ws_audios_by_audio_ID({audio_ID:selected_combo.audio_ID},
				function(evt:ResultEvent):void
				{
					var results:Array = new WSAudioResultHelper().resultToArray(extractResult(evt));
					if(results.length>0)
					{
						audio = results[0] as WSAudio;
					}
				});
		}
	}
}