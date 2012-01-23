package jp.wordsmart.components.dynoSlide.tasks
{
	import com.flexblocks.imagecropper.ImageCropper;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import jp.wordsmart.components.dynoSlide.DynoBitMap;
	import jp.wordsmart.components.imageCropper.ImageCrop;
	import jp.wordsmart.components.imageCropper.ImageCropModel;
	
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import ui.titlewindows.AWindowSkin;
	import ui.titlewindows.CollapsibleTitleWindow;
	import ui.titlewindows.SuperTitleWindow;
	import ui.titlewindows.SuperTitleWindowSkin;

	public function openImageCropper(dbm:DynoBitMap, bgColor:uint, bgAlpha:Number, parent:DisplayObject, closeOnCrop:Boolean, croppedCallback:Function):void
	{
		var wrapper:CollapsibleTitleWindow= new CollapsibleTitleWindow;
		wrapper.setStyle("skinClass", AWindowSkin);
		//
		var cropperModel:ImageCropModel = new ImageCropModel();
		cropperModel.width = 640; 
		cropperModel.height = 480; 
		cropperModel.bgColor = bgColor; 
		cropperModel.bgAlpha = bgAlpha;
		cropperModel.imageSource = dbm.model.src;
		cropperModel.originalURL = dbm.model.src;
		
		var cropper:ImageCrop = new ImageCrop();
		cropper.model = cropperModel;
		
		cropper.cropCallback = function(newData:BitmapData, cropData:Object):void
		{
			dbm.setBitMapData(newData);
			dbm.model.cd = cropData;
			croppedCallback();
			if(closeOnCrop){cleanUp()};
		}
		wrapper.addElement(cropper);
		
		
		wrapper.addEventListener(CloseEvent.CLOSE, function(ce:Event):void
		{
			cleanUp();
		});
			
			PopUpManager.addPopUp(wrapper,parent);
			function cleanUp():void
			{
				PopUpManager.removePopUp(wrapper);
				wrapper = null;
				cropper = null;
				cropperModel = null;
			}
	}
	
}