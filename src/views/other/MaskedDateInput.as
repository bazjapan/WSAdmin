package views.other
{
	
		import com.adobe.flex.extras.controls.MaskedTextInput;
		
		import flash.display.DisplayObject;
		import flash.events.Event;
		
		import mx.controls.DateChooser;
		import mx.controls.DateField;
		import mx.core.FlexVersion;
		import mx.core.IFlexDisplayObject;
		import mx.core.mx_internal;
		import mx.events.FlexEvent;
		import mx.styles.StyleProxy;
		
		use namespace mx_internal;
		
		/**
		 * 
		 * @author olga@codeflex.ru
		 * http://cookbooks.adobe.com/post_Simple_DateField_extension_with_masked_input-15666.html
		 */	  
		public class MaskedDateInput extends DateField
		{ 
			
			public static const defaultInputMask:String="MM/DD/YYYY";	
			
			private static var _inputMask:String = defaultInputMask;	  
			private var _dropdown:DateChooser
			
			
			/**
			 * constructor 
			 * 
			 */	
			public function MaskedDateInput()
			{
				super();
				
			}
			
			/**
			 * 
			 * @param value String, proper values 'DD/MM/YYYY','MM/DD/YYYY', 'YYYY/DD/MM' and 'YYYY/MM/DD'. Other would be ignored
			 * and used default value "MM/DD/YYYY" 
			 * 
			 */		
			public function set inputMask(value:String) : void
			{
				_inputMask = value;
				if(textInput) (textInput as MaskedTextInput).inputMask = value;
				formatString = value;
			}
			
			public function get inputMask():String
			{
				if(textInput) return (textInput as MaskedTextInput).inputMask;
				else return defaultInputMask;
			}
			
			/**
			 * we need to re-declarate adn re-create textInput instance (TextInput > MaskedTextInput)
			 * 
			 */	
			override protected function createChildren():void
			{
				
				super.createChildren();
				
				var level:Number = -1;
				
				if(textInput){
					
					if(owns(DisplayObject(textInput))){
						
						level = getChildIndex(textInput as DisplayObject);	
						removeChild(textInput as DisplayObject);
					}
					textInput = null;
					
				}
				if (!textInput)
				{
					var textInputStyleName:Object = getStyle("textInputStyleName");
					if (!textInputStyleName)
						textInputStyleName = new StyleProxy(this, textInputStyleFilters);
					
					textInput = new MaskedTextInput();
					
					(textInput as MaskedTextInput).inputMask = _inputMask;
					textInput.editable = editable;
					textInput.restrict = "^\u001b";
					textInput.focusEnabled = false;
					textInput.imeMode = super.imeMode;
					textInput.styleName = textInputStyleName;
					
					textInput.addEventListener('inputMaskEnd', uniHandler);
					textInput.addEventListener('change', uniHandler);
					textInput.addEventListener(FlexEvent.VALUE_COMMIT, uniHandler);
					
					if(level != -1) addChildAt(textInput as DisplayObject, level);
					
					this.swapChildren(textInput as DisplayObject,downArrowButton);
					textInput.move(0, 0);
					
				}
				_dropdown = dropdown;
				
			}
			
			/**
			 *  Handler for 'inputMaskEnd', 'change' and 'valueCommit' MaskedInput instance to update DateChooser 
			 *  selection in accordance to  fullText.
			 * @param evt event
			 * 
			 */    	
			private function uniHandler(evt:Event):void{
				
				
				_dropdown.selectedDate = stringToDate((textInput as MaskedTextInput).fullText, formatString);
				
				if (_dropdown.selectedDate)
				{
					//	trace('event of '+evt.type+' type, _dropdown.selectedDate.toDateString()='+_dropdown.selectedDate.toDateString());
					
					_dropdown.displayedMonth = _dropdown.selectedDate.getMonth();
					_dropdown.displayedYear = _dropdown.selectedDate.getFullYear();
					
					
				}
				
			}
			
			/**
			 * we need to redeclated  DateField.stringToDate function to process "/" symbol correctly 
			 * @param valueString string (from MaskedTextInput instance) 
			 * @param inputFormat defined with inputMask or default masked format 
			 * @return Date (used in DateChooser open() function)
			 * 
			 */   
			public static function stringToDate(valueString:String, inputFormat:String):Date
			{
				var mask:String
				var temp:String;
				var dateString:String = "";
				var monthString:String = "";
				var yearString:String = "";
				var j:int = 0;
				
				var n:int = inputFormat.length;
				for (var i:int = 0; i < n; i++,j++)
				{
					temp = "" + valueString.charAt(j);
					mask = "" + inputFormat.charAt(i);
					
					if (temp == "_"){//cose we processing change event to
						
						temp="0";
					}
					if (mask == "M")
					{
						if (isNaN(Number(temp)) || temp == " ")
							j--;
						else
							monthString += temp;
					}
					else if (mask == "D")
					{
						if (isNaN(Number(temp)) || temp == " ")
							j--;
						else
							dateString += temp;
					}
					else if (mask == "Y")
					{
						yearString += temp;
					}
					else if (mask == "/")//just avoid null return
					{
						
					}
					else if (!isNaN(Number(temp)) && temp != " ")
					{
						return null;
					}
				}
				
				if(monthString == "") monthString = "01";
				if(dateString == "") dateString = "01";
				if(yearString == "") yearString = "1900";
				
				temp = "" + valueString.charAt(inputFormat.length - i + j);
				if (!(temp == "") && (temp != " "))
					return null;
				
				var monthNum:Number = Number(monthString);
				var dayNum:Number = Number(dateString);
				var yearNum:Number = Number(yearString);
				
				if (isNaN(yearNum) || isNaN(monthNum) || isNaN(dayNum))
					return null;
				
				if (yearString.length == 2 && yearNum < 70)
					yearNum+=2000;
				
				var newDate:Date = new Date(yearNum, monthNum - 1, dayNum);
				
				if (dayNum != newDate.getDate() || (monthNum - 1) != newDate.getMonth())
					return null;
				
				return newDate;
			}
			
			/**
			 * we need to override this measure() function to increase measuredMinWidth
			 * (fast solution, some smart measurement needed here :))
			 * 
			 */
			override protected function measure():void
			{
				
				var buttonWidth:Number = downArrowButton.getExplicitOrMeasuredWidth();
				var buttonHeight:Number = downArrowButton.getExplicitOrMeasuredHeight();
				
				var bigDate:Date = new Date(2004, 12, 31);
				var txt:String = (labelFunction != null) ? labelFunction(bigDate) : 
					dateToString(bigDate, formatString);
				
				measuredMinWidth = measuredWidth = measureText(txt).width + 25 + buttonWidth;
				if (FlexVersion.compatibilityVersion >= FlexVersion.VERSION_3_0)
					measuredMinWidth = measuredWidth += getStyle("paddingLeft") + getStyle("paddingRight");
				measuredMinHeight = measuredHeight = textInput.getExplicitOrMeasuredHeight();
			}
			
		}
	}