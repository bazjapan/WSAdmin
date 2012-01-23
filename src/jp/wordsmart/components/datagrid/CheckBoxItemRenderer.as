package jp.wordsmart.components.datagrid
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.controls.CheckBox;
	import mx.controls.DataGrid;

	public class CheckBoxItemRenderer extends CheckBox
	{
		public function CheckBoxItemRenderer()
		{
			super();
			this.addEventListener(MouseEvent.CLICK,onClick);
			this.setStyle("paddingLeft", 3);
		}
		public var isSelected:Boolean;
		private function onClick(event:MouseEvent):void
		{
			event.stopImmediatePropagation();
			isSelected = selected;
		}
		override public function validateProperties():void
		{
			super.validateProperties();
			if (listData)
			{
				
				var dg:DataGrid = DataGrid(listData.owner);
	
				var column:CheckBoxHeaderColumn =	dg.columns[listData.columnIndex];
				column.addEventListener("click",columnHeaderClickHandler);
				selected = isSelected;
			}
		}
		private function columnHeaderClickHandler(event:MouseEvent):void
		{
			//why this alery shows three times for a data of 2 rows
			//mx.controls.Alert.show("alert");
			selected = event.target.selected;
			isSelected = selected;
		}
		
	}
}