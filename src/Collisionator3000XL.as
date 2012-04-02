// designed and developed by Mike Delucchi . Zanuka . mike@zanuka.com

package
{
	import com.greensock.TweenMax;
	import com.greensock.easing.FastEase;
	
	import fl.controls.CheckBox;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.system.System;
	import flash.text.TextField;
	import flash.utils.setTimeout;
	
	[SWF(width='1000',height='600',frameRate='31',backgroundColor='#CBCBCB')]
	
	public class Collisionator3000XL extends Sprite
	{
		
		private var _screen:AssetCollisionator = new AssetCollisionator;
		
		private var _selectedCatValue:String = '';
//		private var _catName:Number = 0;
		private var _currentInputTF:TextField;
		private var _currentCheckBox:CheckBox;
		private var _currentCheckBoxName:String;
		private var _currentCatString:String = '';
		private var _input1String:String = '';
		private var _input2String:String = '';
		private var _input4String:String = '';
		private var _input8String:String = '';
		private var _input16String:String = '';
		private var _input32String:String = '';
		private var _input64String:String = '';
		private var _input128String:String = '';
		private var _input256String:String = '';
		private var _input512String:String = '';
		
		private var _cat1MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat2MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat4MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat8MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat16MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat32MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat64MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat128MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat256MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat512MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		
		private var _cat1MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat2MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat4MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat8MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat16MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat32MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat64MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat128MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat256MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat512MirroredBits:Number = 0; 																			// total sum of all category collision bit values in that row

		public function Collisionator3000XL()
		{
			
			this.addEventListener(Event.ADDED_TO_STAGE,  init);
		}
		
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			createScreen();
			addEventListeners();
		}
		
		
		private function createScreen():void
		{
			addChild(_screen);
		}
		
		
		private function checkFocusIN(e:Event):void
		{
			_currentCheckBoxName = e.target.name;

			trace ('\n\ncheckFocusIN box ' + _currentCheckBoxName);
			
			_currentCheckBox = e.target.valueOf();
			
			var checkBoxCatString:String = getCategoryBitValue(_currentCheckBoxName); 		
			
			_selectedCatValue = checkBoxCatString.substr(3,checkBoxCatString.length);
			
			var bitValue:Number = Number(getColliderBitValue(_currentCheckBoxName));

			if (_currentCheckBox.selected == false) { 										// if it's selected, you get positive bitValue, if not,,, negative to subract
				bitValue = -bitValue;
			}
			
			calcSelectedMaskBits(checkBoxCatString, bitValue);	
			
			var digits:String = _currentCheckBoxName.substr(3,_currentCheckBoxName.length);
			
			var arr:Array = digits.split('_'); 												// then split the digits into an array // so we should have 8_1
			
			var selectedInstance:String = arr[0] + '_' + arr[1]; 							
			
			if (arr[0] == arr[1]) { 	
				trace ('no mirror needed!');										   		// do nothing because you've selected a 1_1, 2_2, 4_4, etc...
//				updateMirroredResults();
			} else {
				calcMirror(); 																// otherwise run the mirrored calculation
				
			}

		}
		
		private function calcSelectedMaskBits(selectedCat:String, bitValue:Number):void
		{
			trace ('calcSelectedMaskBits >> cat = ' + selectedCat);
			trace ('bitValue Value = ' + bitValue);
			
			switch (selectedCat)
			{
				case 'cat1' : 
					_cat1MaskBits = _cat1MaskBits + bitValue;
					_cat1MirroredBits = _cat1MaskBits;
					break;
				case 'cat2' : 
					_cat2MaskBits = _cat2MaskBits + bitValue;	
					_cat2MirroredBits = _cat2MaskBits;
					break;
				case 'cat4' : 
					_cat4MaskBits = _cat4MaskBits + bitValue;	
					_cat4MirroredBits = _cat4MaskBits;
					break;
				case 'cat8' : 
					_cat8MaskBits = _cat8MaskBits + bitValue;	
					_cat8MirroredBits = _cat8MaskBits;
					break;
				case 'cat16' : 
					_cat16MaskBits = _cat16MaskBits + bitValue;	
					_cat16MirroredBits = _cat16MaskBits;
					break;
				case 'cat32' : 
					_cat32MaskBits = _cat32MaskBits + bitValue;	
					_cat32MirroredBits = _cat32MaskBits;
					break;
				case 'cat64' : 
					_cat64MaskBits = _cat64MaskBits + bitValue;	
					_cat64MirroredBits = _cat64MaskBits;
					break;
				case 'cat128' : 
					_cat128MaskBits = _cat128MaskBits + bitValue;	
					_cat128MirroredBits = _cat128MaskBits;
					break;
				case 'cat256' : 
					_cat256MaskBits = _cat256MaskBits + bitValue;	
					_cat256MirroredBits = _cat256MaskBits;
					break;
				case 'cat512' : 
					_cat512MaskBits = _cat512MaskBits + bitValue;	
					_cat512MirroredBits = _cat512MaskBits;
					break;
			}
			updateResults();
		}
		
		private function calcMirror():void													// i need to auto-select boxes to make collision matches
		{
			trace ('\n\ncalcMirror');															// if selected is cat1_8 , we need to then select cat8_1
			
			var digits:String = _currentCheckBoxName.substr(3,_currentCheckBoxName.length);
			
			var arr:Array = digits.split('_'); 												// then split the digits into an array // so we should have 8_1
			
			var mirroredInstance:String = arr[1] + '_' + arr[0]; 							// now swap them around
			
			var currentMirroredName:String = 'cat' + mirroredInstance;
			
			var checkBoxMirroredString:String = getCategoryBitValue(currentMirroredName); 
			
			_selectedCatValue = checkBoxMirroredString.substr(3,checkBoxMirroredString.length);
			
			var mirroredBitValue:Number = Number(getColliderBitValue(currentMirroredName));			
			
			if (_screen["cat" + mirroredInstance].selected == true) { 				     	// toggle off if already selected
				mirroredBitValue = -mirroredBitValue;
				_screen["cat" + mirroredInstance].selected = false;
			} else {
				_screen["cat" + mirroredInstance].selected = true;
			}
			
			calcMirroredMaskBits(checkBoxMirroredString, mirroredBitValue);
			
		}
		
		private function calcMirroredMaskBits(selectedCat:String, mirroredBit:Number):void
		{
			
			trace ('\ncalcMirroredMaskBits >> cat = ' + selectedCat);
			
			trace ('mirroredBit Value = ' + mirroredBit);
			
			switch (selectedCat)
			{
				case 'cat1' : 
					_cat1MirroredBits = _cat1MirroredBits + mirroredBit;
					_cat1MaskBits = _cat1MirroredBits;
					break;
				case 'cat2' : 
					_cat2MirroredBits = _cat2MirroredBits + mirroredBit;
					_cat2MaskBits = _cat2MirroredBits;
					break;
				case 'cat4' : 
					_cat4MirroredBits = _cat4MirroredBits + mirroredBit;	
					_cat4MaskBits = _cat4MirroredBits;
					break;
				case 'cat8' : 
					_cat8MirroredBits = _cat8MirroredBits + mirroredBit;	
					_cat8MaskBits = _cat8MirroredBits;
					break;
				case 'cat16' : 
					_cat16MirroredBits = _cat16MirroredBits + mirroredBit;	
					_cat16MaskBits = _cat16MirroredBits;
					break;
				case 'cat32' : 
					_cat32MirroredBits = _cat32MirroredBits + mirroredBit;	
					_cat32MaskBits = _cat32MirroredBits;
					break;
				case 'cat64' : 
					_cat64MirroredBits = _cat64MirroredBits + mirroredBit;	
					_cat64MaskBits = _cat64MirroredBits;
					break;
				case 'cat128' : 
					_cat128MirroredBits = _cat128MirroredBits + mirroredBit;	
					_cat128MaskBits = _cat128MirroredBits;
					break;
				case 'cat256' : 
					_cat256MirroredBits = _cat256MirroredBits + mirroredBit;	
					_cat256MaskBits = _cat256MirroredBits;
					break;
				case 'cat512' : 
					_cat512MirroredBits = _cat512MirroredBits + mirroredBit;	
					_cat512MaskBits = _cat512MirroredBits;
					break;
			}
			
			updateMirroredResults();
			
		}
		
		
		private function textFocusIN(e:FocusEvent):void
		{
			var inputName:String = e.target.name;
			_currentInputTF = e.target.valueOf();
			
			_selectedCatValue = getSelectedInputCatValue(inputName);
			
			trace ('textFocusIN > catValue = ' + _selectedCatValue);
			
			switch (_selectedCatValue)
			{
				case '1' :
					_screen.input1.text = '';
					_screen.display1.text = '';
					_screen.result1.text = '';
					break;
				case '2' :
					_screen.input2.text = '';
					_screen.display2.text = '';
					_screen.result2.text = '';
					break;
				case '4' :
					_screen.input4.text = '';
					_screen.display3.text = '';
					_screen.result4.text = '';
					break;
				case '8' :
					_screen.input8.text = '';
					_screen.display4.text = '';
					_screen.result8.text = '';
					break;
				case '16' :
					_screen.input16.text = '';
					_screen.display5.text = '';
					_screen.result16.text = '';
					break;
				case '32' :
					_screen.input32.text = '';
					_screen.display6.text = '';
					_screen.result32.text = '';
					break;
				case '64' :
					_screen.input64.text = '';
					_screen.display7.text = '';
					_screen.result64.text = '';
					break;
				case '128' :
					_screen.input128.text = '';
					_screen.display8.text = '';
					_screen.result128.text = '';
					break;
				case '256' :
					_screen.input256.text = '';
					_screen.display9.text = '';
					_screen.result256.text = '';
					break;
				case '512' :
					_screen.input512.text = '';
					_screen.display10.text = '';
					_screen.result512.text = '';
					break;
			}
			
		}
		
		private function updateInputData(e:Event):void 																			// PRIMARY CALCULATION FUNCTION	
		{
			_currentCatString = _currentInputTF.text;
			updateDisplays();
			updateResults();
//			updateMirroredResults();
		}
		
		private function updateDisplays():void
		{
			var catBitValue:Number;
			switch (_selectedCatValue)
			{
				case '1' :
					catBitValue = 1;
					_screen.display1.text = '' + _currentCatString;
					_input1String = _currentCatString;
					break;
				case '2' :
					catBitValue = 2;
					_screen.display2.text = '' + _currentCatString;
					_input2String = _currentCatString;
					break;
				case '4' :
					catBitValue = 4;
					_screen.display3.text = '' + _currentCatString;
					_input4String = _currentCatString;
					break;
				case '8' :
					catBitValue = 8;
					_screen.display4.text = '' + _currentCatString;
					_input8String = _currentCatString;
					break;
				case '16' :
					catBitValue = 16;
					_screen.display5.text = '' + _currentCatString;
					_input16String = _currentCatString;
					break;
				case '32' :
					catBitValue = 32;
					_screen.display6.text = '' + _currentCatString;
					_input32String = _currentCatString;
					break;
				case '64' :
					catBitValue = 64;
					_screen.display7.text = '' + _currentCatString;
					_input64String = _currentCatString;
					break;
				case '128' :
					catBitValue = 128;
					_screen.display8.text = '' + _currentCatString;
					_input128String = _currentCatString;
					break;
				case '256' :
					catBitValue = 256;
					_screen.display9.text = '' + _currentCatString;
					_input256String = _currentCatString;
					break;
				case '512' :
					catBitValue = 512;
					_screen.display10.text = '' + _currentCatString;
					_input512String = _currentCatString;
					break;
			}
		}

		private function updateResults():void
		{
			var catBitValue:Number;
			
			trace ('updateResults > _selectedCatValue = ' + _selectedCatValue); 
			
			switch (_selectedCatValue)
			{
				case '1' :
					catBitValue = 1;
					_screen.result1.text = _input1String + 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat1MaskBits + ' }'
					break;
				case '2' :
					catBitValue = 2;
					_screen.result2.text = _input2String + 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat2MaskBits + ' }'
					break;
				case '4' :
					catBitValue = 4;
					_screen.result4.text = _input4String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat4MaskBits + ' }'
					break;
				case '8' :
					catBitValue = 8;
					_screen.result8.text = _input8String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat8MaskBits + ' }'
					break;
				case '16' :
					catBitValue = 16;
					_screen.result16.text = _input16String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat16MaskBits + ' }'
					break;
				case '32' :
					catBitValue = 32;
					_screen.result32.text = _input32String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat32MaskBits + ' }'
					break;
				case '64' :
					catBitValue = 64;
					_screen.result64.text = _input64String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat64MaskBits + ' }'
					break;
				case '128' :
					catBitValue = 128;
					_screen.result128.text = _input128String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat128MaskBits + ' }'
					break;
				case '256' :
					catBitValue = 256;
					_screen.result256.text = _input256String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat256MaskBits + ' }'
					break;
				case '512' :
					catBitValue = 512;
					_screen.result512.text = _input512String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat512MaskBits + ' }'
					break;
			}
		}

		private function updateMirroredResults():void
		{
			var catBitValue:Number;
			
			trace ('updateMirroredResults > _selectedCatValue = ' + _selectedCatValue); 
			
			switch (_selectedCatValue)
			{
				case '1' :
					catBitValue = 1;
					trace ('_cat1MirroredBits = ' + _cat1MirroredBits);
					_screen.result1.text = _input1String + 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat1MirroredBits + ' }'
					break;
				case '2' :
					catBitValue = 2;
					_screen.result2.text = _input2String + 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat2MirroredBits + ' }'
					break;
				case '4' :
					catBitValue = 4;
					_screen.result4.text = _input4String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat4MirroredBits + ' }'
					break;
				case '8' :
					catBitValue = 8;
					_screen.result8.text = _input8String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat8MirroredBits + ' }'
					break;
				case '16' :
					catBitValue = 16;
					_screen.result16.text = _input16String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat16MirroredBits + ' }'
					break;
				case '32' :
					catBitValue = 32;
					_screen.result32.text = _input32String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat32MirroredBits + ' }'
					break;
				case '64' :
					catBitValue = 64;
					_screen.result64.text = _input64String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat64MirroredBits + ' }'
					break;
				case '128' :
					catBitValue = 128;
					_screen.result128.text = _input128String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat128MirroredBits + ' }'
					break;
				case '256' :
					catBitValue = 256;
					_screen.result256.text = _input256String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat256MirroredBits + ' }'
					break;
				case '512' :
					catBitValue = 512;
					_screen.result512.text = _input512String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat512MirroredBits + ' }'
					break;
			}
		}
		
		private function copyAllResults(e:MouseEvent):void
		{
			var allResults:String = _screen.result1.text + '\n' + 
									_screen.result2.text + '\n' +
									_screen.result4.text + '\n' +
									_screen.result8.text + '\n' +
									_screen.result16.text + '\n' +
									_screen.result32.text + '\n' +
									_screen.result64.text + '\n' +
									_screen.result128.text + '\n' +
									_screen.result256.text + '\n' +
									_screen.result512.text;
			
			System.setClipboard(allResults);
									
		}
		
		private function resultFocusIN(e:FocusEvent):void																	// RESULT FIELDS - FOR COPYING / PASTING
		{
			setTimeout(e.target.setSelection, 25, 0, e.target.text.length); // we put delay on the focusIN event so that it will select all and you can copy to clipboard
		}

		private function resultFocusOUT(e:FocusEvent):void
		{	
			e.target.setSelection(0,0);
			
		}
		
		private function addEventListeners():void 																		// SETUP ALL FIELD LISTENERS... 
		{
			_screen.input1.addEventListener(Event.CHANGE, updateInputData);
			_screen.input2.addEventListener(Event.CHANGE, updateInputData);
			_screen.input4.addEventListener(Event.CHANGE, updateInputData);
			_screen.input8.addEventListener(Event.CHANGE, updateInputData);
			_screen.input16.addEventListener(Event.CHANGE, updateInputData);
			_screen.input32.addEventListener(Event.CHANGE, updateInputData);
			_screen.input64.addEventListener(Event.CHANGE, updateInputData);
			_screen.input128.addEventListener(Event.CHANGE, updateInputData);
			_screen.input256.addEventListener(Event.CHANGE, updateInputData);
			_screen.input512.addEventListener(Event.CHANGE, updateInputData);
			
			_screen.input1.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input2.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input4.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input8.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input16.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input32.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input64.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input128.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input256.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input512.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			
			_screen.cat1_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat2_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat4_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat8_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat16_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat16_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat16_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat16_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat16_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat16_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat16_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat16_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat16_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat16_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat32_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat32_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat32_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat32_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat32_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat32_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat32_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat32_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat32_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat32_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat64_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat64_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat64_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat64_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat64_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat64_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat64_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat64_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat64_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat64_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat128_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat128_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat128_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat128_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat128_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat128_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat128_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat128_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat128_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat128_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat256_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat256_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat256_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat256_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat256_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat256_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat256_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat256_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat256_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat256_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat512_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat512_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat512_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat512_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat512_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat512_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat512_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat512_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat512_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat512_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.result1.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			_screen.result2.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			_screen.result4.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			_screen.result8.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			_screen.result16.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			_screen.result32.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			_screen.result64.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			_screen.result128.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			_screen.result256.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			_screen.result512.addEventListener(FocusEvent.FOCUS_IN, resultFocusIN);
			
			_screen.copyBTN.addEventListener(MouseEvent.CLICK, copyAllResults);
		}
		
		
		// NEATO BURRITO VALUE-RETURNING UTLITY FUNCTIONS 		
		
		private function getCategoryBitValue(s:String):String // here we want to extract 'cat512' from 'cat512_128' or 'cat512_16'
		{
//			return s.substr(3,1);
			
			var arr:Array = s.split('_'); // first split the string into 2 arrays > (cat512,128) > taking out the '_'
			return arr[0];
		}

		private function getSelectedInputCatValue(s:String):String // here we just want to take '512' from 'input512'
		{
//			return s.substr(s.length-1,s.length);
			return s.substr(5,s.length);
		}

		private function getColliderBitValue(s:String):String // here we want to extract 32 from 'cat1_32'... because 32 is the bit value of the object we're colliding with
		{
//			return s.substr(5,s.length);
			
			var arr:Array = s.split('_') // split that shizzle up
			return arr[1]; // just return the last half
			
		}
		
	}
}